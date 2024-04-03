part of 'sign_up_bloc.dart';

class OnSignUp extends LoadingEvent {
  final String phone;
  final String password;

  OnSignUp(this.phone, this.password);

  @override
  List<Object?> get props => [phone, password];
}
