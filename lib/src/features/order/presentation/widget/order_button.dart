import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/message_utils.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:evievm_app/src/features/order/presentation/screens/successful_order_screen.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<OrderBloc>(
      listener: (state) {
        if (state is LoadingState<OnCreateOrder>) {
          showLoadingOverlay();
          return;
        }
        if (state is ValidateDataState) {
          hideLoadingOverlay();
          if (state.isValid) {
            orderBloc.add(OnCreateOrder());
          } else if (state.shouldShowError) {
            showFillEnoughtInfoMsg();
          }
          return;
        }

        if (state is CreatOrderSuccess) {
          hideLoadingOverlay();
          Global.pushNamed(SuccessfulOrderScreen.router);
        }
      },
      child: ClipPath(
        clipper: _CustomClipPath(),
        child: Container(
          color: AppColors.primary,
          margin: const EdgeInsets.all(4),
          child: TextButton(
            onPressed: () {
              orderBloc.add(OnValidateData(showErrorMsg: true));
            },
            child: Text(
              "Xác nhận đặt hàng",
              style: textTheme.bodyLarge?.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(24, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  // oldClipper != this
}
