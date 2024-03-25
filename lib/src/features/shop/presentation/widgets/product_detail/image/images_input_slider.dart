// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dotted_border/dotted_border.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesInputSlider extends StatefulWidget {
  const ImagesInputSlider({
    Key? key,
    required this.initImages,
  }) : super(key: key);
  final List<BaseImageDto> initImages;

  @override
  State<ImagesInputSlider> createState() => _ImagesInputSliderState();
}

class _ImagesInputSliderState extends State<ImagesInputSlider> {
  @override
  void initState() {
    imageInputBloc.add(OnInitImagesInput(images: widget.initImages));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocBuilder<ImageInputBloc>(
      buildForStates: const [ImagesInputUpdated],
      builder: (state) {
        if (state is! ImagesInputUpdated) {
          return emptyWidget;
        }
        return PageView.builder(
          itemCount: state.data.length + 1,
          itemBuilder: (context, index) {
            return index < state.data.length ? AppImage(image: state.data[index]) : _AddImage();
          },
        );
      },
    );
  }
}

class _AddImage extends StatelessWidget {
  const _AddImage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        imageInputBloc.add(OnAddNewImage());
      },
      child: DottedBorder(
        radius: Radius.circular(8.r),
        color: AppColors.blackLight,
        strokeCap: StrokeCap.butt,
        borderPadding: EdgeInsets.all(16.r),
        dashPattern: const [6, 2],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: AppColors.blackLight),
              Text('Thêm ảnh sản phẩm'),
            ],
          ),
        ),
      ),
    );
  }
}
