// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/domin/service/auth_service.dart';
import 'log_in_event.dart';
import 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  bool isPassword = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isFormValid = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LogInBloc() : super(LogInInitial()) {
    on<LogInSuccess>((event, emit) async {
      emit(LogInLoadingState());
      final isSuccess = await AuthServiceImpl().logIn(event.logInModel);
      print('----------------');
      print(isSuccess);
      if (isSuccess.isRight()) {
        emit(LogInSuccessState());
      } else {
        emit(LogInFieldState());
      }
    });
    on<PasswordEvent>(
      (event, emit) {
        isPassword = !isPassword;
        emit(PasswordState());
      },
    );
    on<CheckIfField>((event, emit) {
      final isVaild = formkey.currentState?.validate() ?? false;
      isFormValid = isVaild;
      print(' valid!');
    });
    on<SubmitForm>((event, emit) {
      if (formkey.currentState?.validate() ?? false) {
        // تنفيذ العملية عند النجاح
        print('Form is valid!');
      }
    });
  }
}
