// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class OnLogin extends LoadingEvent {
  final String phone;
  final String password;
  final bool rememberEmail;

  OnLogin(this.phone, this.password, this.rememberEmail);

  @override
  List<Object?> get props => [phone, password, rememberEmail];
}

class OnQrBarcodeReaderLogin extends LoadingEvent {
  final String scannedCode;

  OnQrBarcodeReaderLogin({required this.scannedCode});

  @override
  List<Object?> get props => [scannedCode];
}

class OnCheckLogin extends BaseEventWithoutProps {}

class OnDoCheckLogin extends BaseEvent {
  final void Function()? onNotLogin;
  final void Function()? onDidLogin;
  OnDoCheckLogin({
    this.onNotLogin,
    this.onDidLogin,
  });

  @override
  List<Object?> get props => [onNotLogin, onDidLogin];
}

class OnGetRememberLoginEmail extends BaseEventWithoutProps {}

class OnLogout extends BaseEventWithoutProps {}
