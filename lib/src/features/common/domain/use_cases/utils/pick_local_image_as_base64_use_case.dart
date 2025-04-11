import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';

import 'pick_local_image_use_case.dart';

@lazySingleton
// return compressed base 64 image
class PickLocalImageCompressedBase64UseCase extends EitherUseCase<String?, NoParams> {
  PickLocalImageCompressedBase64UseCase(this._pickImage);
  final PickLocalImageUseCase _pickImage;

  @override
  Future<Either<Failure, String?>> call(NoParams param) async {
    Either<Failure, File?> result = await _pickImage.call(param);
    return result.fold((Failure failure) => Left(failure), (File? file) async {
      if (file != null) {
        Uint8List compressed = await FlutterImageCompress.compressWithList(
          await file.readAsBytes(),
          minHeight: 1280,
          minWidth: 720,
          quality: 95,
        );
        List<int> bytes = compressed;
        if (bytes.isEmpty) {
          // User cancel
          return const Right(null);
        }
        String format = file.uri.path.split('.').lastWhereOrNull((p0) => true) ?? 'png';
        String header = 'data:image/$format;base64';
        String base64 = '$header,${base64Encode(bytes)}';
        file.delete();
        return Right(base64);
      }
      return const Right(null);
    });
  }
}
