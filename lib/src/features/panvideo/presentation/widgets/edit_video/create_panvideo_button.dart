// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/features/main/presentation/screens/main_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/create_panvideo/create_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/my_panvideo/my_panvideo_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePanvideoButton extends StatefulWidget {
  const CreatePanvideoButton(this.createPanvideoEvent, {super.key});
  final OnCreatePanvideo createPanvideoEvent;
  @override
  State<CreatePanvideoButton> createState() => _CreatePanvideoButtonState();
}

class _CreatePanvideoButtonState extends State<CreatePanvideoButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 4.h),
      child: SizedBox.square(
        dimension: 64.r,
        child: CustomBlocConsumer<CreatePanVideoBloc>(
          handleLoading: false,
          listener: (state) {
            switch (state) {
              case (LoadingState _):
                _animationController.repeat();
              case (CreatePanvideoSuccess _):
                _animationController.stop();
                myPanVideoBloc.add(OnGetMyPanvideos());
                Global.popUntilNamed(MainScreen.router);
                showSnackBar('Tải lên thành công');
              default:
                _animationController.stop();
            }
          },
          builder: (state) => Stack(
            alignment: Alignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: _animationController.isAnimating ? null : _createPanvideo,
                shape: const CircleBorder(),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationController.value * 2 * 3.141592653589793,
                      child: Icon(
                        Icons.upload_outlined,
                        size: 48.r,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              // if (state is LoadingState)
              //   const Positioned.fill(
              //     child: CircularProgressIndicator(
              //       value: 0.6,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  void _createPanvideo() {
    createPanVideoBloc.add(widget.createPanvideoEvent);
  }
}
