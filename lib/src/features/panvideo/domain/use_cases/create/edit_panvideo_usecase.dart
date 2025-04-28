// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/edit_panvideo_result_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_repo.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/edit_panvideo/panvideo_editor.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditPanvideoUsecase extends EitherUseCase<EditPanvideoResultDto?, EditPanvideoArgs> {
  final PanvideoRepo repo;

  EditPanvideoUsecase({
    required this.repo,
  });

  @override
  Future<Either<Failure, EditPanvideoResultDto?>> call(EditPanvideoArgs param) async {
    return await executeWithTryCatch(
      () => PanvideoEditorFactory.getEditor(PanvideoEditerType.creative).editVdieo(param),
    );
  }
}
