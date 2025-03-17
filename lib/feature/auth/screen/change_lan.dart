import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/local_storage/shared_preferences.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_string.dart';
import '../../../share/custom_button.dart';
import '../../../share/sized_box.dart';

class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({super.key});

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  @override
  void initState() {
    super.initState();
    getIt.get<SharedPreferences>().getString(
          'languagecode',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          SizedBox_Height(
            height: 77.h,
          ),
          SizedBox(
              width: 300.w,
              height: 300.h,
              child: Center(
                  child: Image.asset(
                AppAssets.change,
                fit: BoxFit.cover,
              ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(AppStrings.pleasechooseyourlanguage.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 24)),
          ),
          SizedBox_Height(
            height: 90.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onPressed: () {
                  if (context.locale.languageCode == "ar") {
                    context.setLocale(const Locale("en"));
                  } else {
                    context.setLocale(const Locale("en"));
                  }

                  getIt
                      .get<SharedPreferences>()
                      .setString('languagecode', 'en');
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Navigator.of(context).pushReplacementNamed('onboaring');
                  });
                },
                text: 'English',
                width: 170,
                textcolor: AppColor.lightbrownText,
                height: 40,
              ),
              CustomButton(
                onPressed: () {
                  if (context.locale.languageCode == "en") {
                    context.setLocale(const Locale("ar"));
                  } else {
                    context.setLocale(const Locale("ar"));
                  }
                  getIt
                      .get<SharedPreferences>()
                      .setString('languagecode', 'ar');
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Navigator.of(context).pushReplacementNamed('onboaring');
                  });
                },
                text: 'العربية',
                width: 170,
                height: 40,
                textcolor: AppColor.lightbrownText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
