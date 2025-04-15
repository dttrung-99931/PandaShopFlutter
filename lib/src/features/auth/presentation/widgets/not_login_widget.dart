// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/shared/widgets/common/unregister_widget.dart';
import 'package:flutter/material.dart';

class NotLoginWidget extends StatelessWidget {
  const NotLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnregisterWidget(
      title: 'Bạn chưa đăng nhập!',
      buttonTitle: 'Đăng nhập',
      onPressed: () {
        Global.pushNamed(LoginScreen.router);
      },
    );
  }
}
