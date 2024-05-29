// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';
import 'dart:ui';

import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/image/image_input_dto.dart';
import 'package:evievm_app/src/shared/bloc/image_input/image_input_bloc.dart';
import 'package:evievm_app/src/shared/enums/edit_action.dart';
import 'package:evievm_app/src/shared/widgets/app_alert_dialog.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
import 'package:evievm_app/src/shared/widgets/common/app_icon_button.dart';
import 'package:evievm_app/src/shared/widgets/common/page_indicator.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:evievm_app/src/shared/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesInputSlider extends StatefulWidget {
  const ImagesInputSlider({
    super.key,
    required this.initImages,
  });
  final List<ImageInputDto> initImages;

  @override
  State<ImagesInputSlider> createState() => _ImagesInputSliderState();
}

class _ImagesInputSliderState extends State<ImagesInputSlider> {
  final PageController _controller = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    imageInputBloc.add(OnInitImagesInput(images: widget.initImages));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocConsumer<ImageInputBloc>(
      listener: (state) {
        if (state is ImagesInputUpdated && state.action == EditAction.add) {
          doOnBuildUICompleted(() {
            _controller.jumpToPage(state.data.length - 1);
          });
        }
      },
      buildForStates: const [ImagesInputUpdated],
      builder: (state) {
        if (state is! ImagesInputUpdated) {
          return emptyWidget;
        }
        return Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                _selectedIndex = index;
                setState(() {});
              },
              controller: _controller,
              itemCount: max(1, state.data.length),
              itemBuilder: (context, index) {
                return state.data.isNotEmpty
                    ? Stack(
                        children: [
                          Positioned.fill(
                            child: AppImage(image: state.data[index]),
                          ),
                          Positioned.fill(
                            child: _EditOptions(imageIndex: index),
                          ),
                        ],
                      )
                    : const _AddImageButton();
              },
            ),
            if (state.data.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PageIndicator(totalPages: state.data.length, currentPage: _selectedIndex),
                ),
              )
          ],
        );
      },
    );
  }
}

class _EditOptions extends StatefulWidget {
  const _EditOptions({required this.imageIndex});
  final int imageIndex;
  @override
  State<_EditOptions> createState() => _EditOptionsState();
}

class _EditOptionsState extends State<_EditOptions> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Remove ripple effect on press
      splashColor: AppColors.transparent,
      onTap: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      },
      child: Visibility(
        visible: _isVisible,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 0.5,
            sigmaY: 0.5,
          ),
          child: Container(
            color: AppColors.black.withOpacity(.1),
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIconButton(
                    size: 20.r,
                    fontSize: 14.sp,
                    title: 'Xoá ảnh',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AppAlertDialog(
                          title: 'Xác nhận xóa ảnh',
                          onConfirm: () {
                            imageInputBloc.add(OnDeleteImage(index: widget.imageIndex));
                          },
                        ),
                      );
                    },
                    iconData: Icons.delete,
                  ),
                  16.swb,
                  AppIconButton(
                    size: 20.r,
                    fontSize: 14.sp,
                    title: 'Đổi ảnh',
                    onPressed: () {
                      imageInputBloc.add(OnChangeImage(index: widget.imageIndex));
                    },
                    iconData: Icons.edit,
                  ),
                  16.swb,
                  AppIconButton(
                    size: 20.r,
                    fontSize: 14.sp,
                    title: 'Thêm ảnh',
                    onPressed: () {
                      imageInputBloc.add(OnAddNewImage());
                    },
                    iconData: Icons.add,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddImageButton extends StatelessWidget {
  const _AddImageButton();

  @override
  Widget build(BuildContext context) {
    return AddingPannel(
      onPressed: () {
        imageInputBloc.add(OnAddNewImage());
      },
      title: 'Thêm ảnh sản phẩm',
    );
  }
}
