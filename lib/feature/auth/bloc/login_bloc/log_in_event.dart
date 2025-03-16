import '../../../../core/domin/model/auth_model/login_model.dart';

class LogInEvent {}

class LogInSuccess extends LogInEvent {
  final LogInModel logInModel;

  LogInSuccess(this.logInModel);
}

class CheckIfField extends LogInEvent {}

class SubmitForm extends LogInEvent {}

class LogInField extends LogInEvent {}

class LogInLoading extends LogInEvent {}

class PasswordEvent extends LogInEvent {
  final bool isScreat;

  PasswordEvent(this.isScreat);
}
