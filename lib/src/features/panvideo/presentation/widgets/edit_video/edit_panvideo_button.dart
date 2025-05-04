// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/panvideo/presentation/bloc/edit_panvideo/edit_panvideo_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPanvideoButton extends StatefulWidget {
  const EditPanvideoButton({super.key});
  @override
  State<EditPanvideoButton> createState() => _EditPanvideoButtonState();
}

class _EditPanvideoButtonState extends State<EditPanvideoButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
      value: 1,
      upperBound: 1,
      lowerBound: 0.6,
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
      offset: Offset(0, 8.h),
      child: SizedBox.square(
        dimension: 68.r,
        child: CustomBlocListener<EditPanVideoBloc>(
          listener: (state) {
            switch (state) {
              case (LoadingEditPanvideo _):
                _animationController.repeat();
              default:
                _animationController.stop();
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: _animationController.isAnimating ? null : _editPanvideo,
                shape: const CircleBorder(),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: Icon(
                        Icons.done_outlined,
                        size: 54.r,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editPanvideo() {
    editPanVideoBloc.add(OnEditPanvideo());
  }
}
