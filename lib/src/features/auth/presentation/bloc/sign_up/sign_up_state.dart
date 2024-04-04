// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

class SignUpSuccess extends LoadingCompleteState {
  final UserDetailDto userDetail;
  // Used to get user/pwd to login after signup successed
  final OnSignUp event;
  SignUpSuccess({
    required this.userDetail,
    required this.event,
  });
  @override
  List<Object?> get props => [userDetail];
}
