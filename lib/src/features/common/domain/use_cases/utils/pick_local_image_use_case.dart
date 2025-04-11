import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/common/domain/use_cases/utils/edit_image_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickLocalImageUseCase extends EitherUseCase<File?, NoParams> {
  PickLocalImageUseCase(this._editImageUseCase);
  final EditImageUseCase _editImageUseCase;

  @override
  Future<Either<Failure, File?>> call(NoParams param) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      Either<Failure, File?> either = await _editImageUseCase.call(file);
      file.delete();
      return either.fold(
        (Failure failure) => const Right(null),
        (File? editedFile) => Right(editedFile),
      );
    } else {
      // Users cancel picking
      return const Right(null);
    }
  }
}
