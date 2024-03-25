import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickLocalImageUseCase extends EitherUseCase<File?, NoParams> {
  PickLocalImageUseCase();

  @override
  Future<Either<Failure, File?>> call(NoParams param) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result.files.single.path!);
      return Right(file);
    } else {
      // Users cancel picking
      return const Right(null);
    }
  }
}
