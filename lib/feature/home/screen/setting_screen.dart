import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hand_made_maker/share/my_loading.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/config/local_storage/shared_preferences.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_string.dart';
import '../../../share/custom_button.dart';
import '../../../share/sized_box.dart';
import '../../../share/toast.dart';
import '../../auth/bloc/logout_bloc/log_out_bloc.dart';
import '../../auth/bloc/logout_bloc/log_out_event.dart';
import '../../auth/bloc/logout_bloc/log_out_state.dart';
import '../widget/custom_divider.dart';
import '../widget/setting_ListTile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutBloc(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox_Height(height: 20.h),
              Center(
                child: Text(
                  AppStrings.setting.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColor.primary),
                ),
              ),
              SizedBox_Height(height: 40.h),
              SettingListTile(
                text: AppStrings.profile.tr(),
                leadingIcon: Icons.person,
              ),
              const CustomDivider(),
              SettingListTile(
                ontap: () {
                  showMenu(
                      color: AppColor.background,
                      context: context,
                      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
                      items: [
                        PopupMenuItem(
                          child: Text(
                            'English',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            if (context.locale.languageCode == "ar") {
                              context.setLocale(const Locale("en"));
                            } else {
                              context.setLocale(const Locale("en"));
                            }

                            getIt
                                .get<SharedPreferences>()
                                .setString('languagecode', 'en');
                            Future.delayed(
                                const Duration(milliseconds: 100), () {});
                          },
                        ),
                        PopupMenuItem(
                          child: Text(
                            'العربية',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            if (context.locale.languageCode == "en") {
                              context.setLocale(const Locale("ar"));
                            } else {
                              context.setLocale(const Locale("ar"));
                            }
                            getIt
                                .get<SharedPreferences>()
                                .setString('languagecode', 'ar');
                            Future.delayed(
                                const Duration(milliseconds: 100), () {});
                          },
                        ),
                      ]);
                },
                text: AppStrings.language.tr(),
                leadingIcon: Icons.language,
              ),
              const CustomDivider(),
              SettingListTile(
                text: AppStrings.mylocation.tr(),
                leadingIcon: Icons.location_on_sharp,
                ontap: () {
                  Navigator.of(context).pushNamed('location');
                },
              ),
              const CustomDivider(),
              Builder(builder: (context) {
                return BlocConsumer<LogOutBloc, LogOutState>(
                    listener: (context, state) {
                  if (state is LogOutSuccessState) {
                    showTost(
                        message: AppStrings.logoutSuccess.tr(),
                        state: ToastState.error);
                    Navigator.of(context).pushReplacementNamed('login');
                  }
                }, builder: (context, state) {
                  return SettingListTile(
                    ontap: () {
                      AwesomeDialog(
                              btnOk: state is LogOutLoadingState
                                  ? SizedBox(
                                      height: 10.h,
                                      width: 10.h,
                                      child: const Loading())
                                  : CustomButton(
                                      height: 30,
                                      onPressed: () {
                                        context
                                            .read<LogOutBloc>()
                                            .add(LogOutSuccess());
                                      },
                                      text: AppStrings.yes.tr()),
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 20),
                              context: context,
                              descTextStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: AppColor.blodbrownText),
                              // dialogType: DialogType.question,
                              animType: AnimType.rightSlide,
                              customHeader: Icon(
                                Icons.question_mark,
                                color: AppColor.brownText,
                                size: 100,
                              ),
                              title: AppStrings.logoutsure.tr(),
                              btnCancelOnPress: () {},
                              btnCancelText: AppStrings.cancel.tr(),
                              btnOkColor: AppColor.primary,
                              btnCancelColor: AppColor.brownText,
                              dialogBackgroundColor: AppColor.background)
                          .show();
                    },
                    text: AppStrings.logout.tr(),
                    leadingIcon: Icons.logout,
                  );
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
