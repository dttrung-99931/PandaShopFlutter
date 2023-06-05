part of 'login_bloc.dart';

class LoginSuccess extends LoadingCompleteStateWithoutProps {}

class LoginFailed extends ErrorState {
  LoginFailed(super.failure);
}

class CheckLoginSuccess extends LoadingCompleteState {
  final bool isLoggedIn;

  CheckLoginSuccess(this.isLoggedIn);

  @override
  List<Object?> get props => [isLoggedIn];
}

class LogoutSuccess extends LoadingCompleteStateWithoutProps {}

class GetRememberLoginEmailSuccess extends LoadingCompleteState {
  final String? email;

  GetRememberLoginEmailSuccess(this.email);

  @override
  List<Object?> get props => [email];
}
