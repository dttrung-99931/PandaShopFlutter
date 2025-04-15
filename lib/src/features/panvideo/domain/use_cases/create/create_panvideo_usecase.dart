// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_request.dart';
import 'package:evievm_app/src/features/panvideo/data/models/create_panvideo_response.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/create_video_response_dto.dart';
import 'package:evievm_app/src/features/panvideo/domain/repositories/panvideo_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreatePanvideoUsecase extends EitherUseCase<CreatePanvideoResponseDto, CreatePanvideoRequest> {
  final PanvideoRepo repo;

  CreatePanvideoUsecase({
    required this.repo,
  });

  @override
  Future<Either<Failure, CreatePanvideoResponseDto>> call(CreatePanvideoRequest param) {
    return handleRepoResult(
      repoResult: repo.createPanvideo(param),
      onSuccess: (CreatePanvideoResponse model) async {
        return CreatePanvideoResponseDto.fromModel(model);
      },
    );
  }
}
