// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart';
import 'package:evievm_app/src/shared/dtos/image_dto.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:flutter/material.dart';
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
            return index < state.data.length
                ? Stack(
                    children: [
                      Positioned.fill(child: AppImage(image: state.data[index])),
                      const Positioned.fill(
                        child: _EditImage(),
                      )
                    ],
                  )
                : const _AddImageButton();
          },
        );
      },
    );
  }
}

class _EditImage extends StatefulWidget {
  const _EditImage();

  @override
  State<_EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<_EditImage> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      },
      child: _isVisible
          ? BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 1.0,
              ),
              child: Container(
                color: AppColors.black.withOpacity(.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIconButton(
                      title: 'Đổi ảnh',
                      onPressed: () {},
                      iconData: Icons.edit,
                    ),
                    16.swb,
                    AppIconButton(
                      title: 'Xoá ảnh',
                      onPressed: () {},
                      iconData: Icons.delete,
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.expand(),
    );
  }
}

class _AddImageButton extends StatelessWidget {
  const _AddImageButton();

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
          child: AppIconButton(
            title: 'Thêm ảnh sản phẩm',
            onPressed: () {},
            iconData: Icons.add,
            color: AppColors.blackLight,
          ),
        ),
      ),
    );
  }
}
