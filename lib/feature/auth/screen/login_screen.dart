import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/domin/model/auth_model/login_model.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_string.dart';
import '../../../share/custom_button.dart';
import '../../../share/custom_text_field.dart';
import '../../../share/my_loading.dart';
import '../../../share/sized_box.dart';
import '../../../share/toast.dart';
import '../bloc/login_bloc/log_in_bloc.dart';
import '../bloc/login_bloc/log_in_event.dart';
import '../bloc/login_bloc/log_in_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isFormValid = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: BlocConsumer<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            Navigator.of(context).pushReplacementNamed('bottom');
          } else if (state is LogInFieldState) {
            showTost(
                message: AppStrings.loginFailed.tr(), state: ToastState.error);
          }
        },
        builder: (context, state) {
          var loginbloc = BlocProvider.of<LogInBloc>(context);

          return Form(
            key: loginbloc.formkey,
            child: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox_Height(height: screenHeight * 0.05),
                        Center(
                          child: Image.asset(
                            AppAssets.splash,
                            width: screenWidth * 0.6,
                            fit: BoxFit.cover,
                            height: screenHeight * 0.3,
                          ),
                        ),

                        SizedBox_Height(height: screenHeight * 0.02),

                        CustomTextfield(
                          textInputType: TextInputType.emailAddress,
                          labeltext: AppStrings.userName.tr(),
                          controller: loginbloc.username,
                          validate: (val) {
                            if (val.isEmpty && val == null) {
                              return AppStrings.nameErrorMsg;
                            }
                            return null;
                          },
                        ),

                        //!password
                        CustomTextfield(
                          validate: (val) {
                            if (val!.length < 5 || val == null) {
                              return AppStrings.passwordlenght.tr();
                            }

                            return null;
                          },
                          labeltext: AppStrings.password.tr(),
                          controller: loginbloc.password,
                          isScreat: loginbloc.isPassword,
                          suffixicon: IconButton(
                              onPressed: () {
                                context
                                    .read<LogInBloc>()
                                    .add(PasswordEvent(loginbloc.isPassword));
                              },
                              icon: loginbloc.isPassword == true
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: AppColor.primary,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: AppColor.primary,
                                    )),
                        ),
                        SizedBox_Height(height: screenHeight * 0.02),
                        Row(
                          children: [
                            SizedBox_width(width: screenWidth * 0.04),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('forgetpassword');
                              },
                              child: Text(
                                AppStrings.forgetPassword.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 13,
                                      color: AppColor.brownText,
                                      decorationColor: AppColor.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox_Height(height: screenHeight * 0.14),
                        state is LogInLoadingState
                            ? const Loading()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: CustomButton(
                                    onPressed: () {
                                      if (BlocProvider.of<LogInBloc>(context)
                                          .formkey
                                          .currentState!
                                          .validate()) {
                                        context
                                            .read<LogInBloc>()
                                            .add(LogInSuccess(LogInModel(
                                              username: loginbloc.username.text,
                                              password: loginbloc.password.text,
                                            )));
                                        Navigator.of(context)
                                            .pushNamed('bottom');
                                      } else {
                                        showTost(
                                            message:
                                                AppStrings.loginFailed.tr(),
                                            state: ToastState.error);
                                      }
                                    },
                                    text: AppStrings.login.tr(),
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.4,
                                  ),
                                ),
                              ),
                        SizedBox_Height(height: screenHeight * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                AppStrings.donthaveaccount.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontSize: 13.sp,
                                        color: AppColor.blodbrownText),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('signup');
                              },
                              child: Text(
                                AppStrings.signup.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: AppColor.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.primary,
                                        fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
