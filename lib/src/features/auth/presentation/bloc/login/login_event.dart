part of 'login_bloc.dart';

class OnEmailLogin extends LoadingEvent {
  final String email;
  final String password;
  final bool rememberEmail;

  OnEmailLogin(this.email, this.password, this.rememberEmail);

  @override
  List<Object?> get props => [email, password, rememberEmail];
}

class OnQrBarcodeReaderLogin extends LoadingEvent {
  final String scannedCode;

  OnQrBarcodeReaderLogin({required this.scannedCode});

  @override
  List<Object?> get props => [scannedCode];
}

class OnCheckLogin extends BaseEventWithoutProps {}

class OnGetRememberLoginEmail extends BaseEventWithoutProps {}

class OnLogout extends BaseEventWithoutProps {}
