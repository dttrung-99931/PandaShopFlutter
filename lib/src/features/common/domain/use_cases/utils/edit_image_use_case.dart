import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:injectable/injectable.dart';

// Crop, scale, rotate image
@lazySingleton
class EditImageUseCase extends EitherUseCase<File?, File> {
  EditImageUseCase();

  @override
  Future<Either<Failure, File?>> call(File param) async {
    final CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: param.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Chỉnh sửa hình ảnh',
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: AppColors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Chỉnh sửa hình ảnh',
          minimumAspectRatio: 1.0,
        ),
      ],
    );

    if (cropped != null) {
      final File file = File(cropped.path);
      return Right(file);
    }
    return const Right(null);
  }
}
