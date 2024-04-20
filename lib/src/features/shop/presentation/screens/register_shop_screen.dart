// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/core/utils/validate.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/main/main_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/user/user_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop/shop_bloc.dart';
import 'package:evievm_app/src/shared/widgets/app_alert_dialog.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/utils/validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/custom_bloc_consumer.dart';

class RegisterShopScreen extends StatefulWidget {
  static const router = '/createShop';
  const RegisterShopScreen({super.key});

  @override
  State<RegisterShopScreen> createState() => _RegisterShopScreenState();
}

class _RegisterShopScreenState extends ValidationState<RegisterShopScreen, ShopBloc> {
  @override
  void initState() {
    super.initState();
    loginBloc.add(OnCheckLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: .15.sw),
            child: Form(
              key: formKey,
              onChanged: () {
                shopBloc.add(OnValidateData());
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tạo cửa hàng',
                    style: textTheme.titleLarge
                        .withColor(context.isKeyboardShowing ? AppColors.black : AppColors.primary)
                        .withSize(40.sp),
                  ),
                  52.shb,
                  InfoInput.onlyInput(
                    hint: 'Tên cửa hàng',
                    controller: shopBloc.nameController,
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    validator: (text) => Validate.validateRequired(text, fieldName: 'Tên cửa hàng'),
                  ),
                  36.shb,
                  const _RegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return CustomBlocConsumer<ShopBloc>(
      handleLoading: false,
      listenForStates: const [RegisterShopSuccess],
      buildForStates: const [RegisterShopSuccess, ErrorState, LoadingState],
      listener: (state) {
        if (state is RegisterShopSuccess) {
          Global.pop();
          // showSnackBar('Đăng ký thành công.\nBạn có thể tạo sản phẩm cho cửa hàng của mình!');
          AppAlertDialog.show(
            context: context,
            title: 'Đăng ký thành công. Chuyên qua mode shop để tạo sản phảm ngay nhé',
            onConfirm: () {
              mainBloc.add(OnChangeAppMode(mode: AppMode.shop));
            },
            onCancel: () {
              userBloc.add(OnGetUserDetail());
            },
            isPositive: true,
          );
        }
      },
      builder: (state) {
        return CustomButton(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          onPressed: () {
            shopBloc.add(OnRegisterShop());
          },
          title: 'Đăng ký',
          elevation: 0,
          isLoading: state is LoadingState,
        );
      },
    );
  }
}
