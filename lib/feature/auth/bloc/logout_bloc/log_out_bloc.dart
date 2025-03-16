// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domin/service/auth_service.dart';
import 'log_out_event.dart';
import 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutBloc() : super(LogOutInitial()) {
    on<LogOutSuccess>((event, emit) async {
      emit(LogOutLoadingState());
      final isSuccess = await AuthServiceImpl().logOut();
      print('----------------');
      print(isSuccess);
      if (isSuccess) {
        emit(LogOutSuccessState());
      } else {
        emit(LogOutFieldState());
      }
    });
  }
}
