import 'package:evievm_app/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/error_handlers.dart';

abstract class UseCase<Type, Params> {
  Type call(Params param);

  /// Map model to dto, handle repo success, error result
  Future<Either<Failure, TDto>> handleRepoResult<TDto, TModel>({
    required Future<Either<Failure, TModel>> repoResult,
    Future<TDto> Function(TModel model)? onSuccess,
    Future<Either<Failure, TDto>> Function(TModel result)? nextRepoResult,
    Future<Failure> Function(Failure failure)? onError,
  }) async {
    assert(onSuccess == null || nextRepoResult == null, 'onSuccess & nextRepoResult can not be used together');
    Either<Failure, TModel> result = await repoResult;
    try {
      return result.fold(
        (l) async => Left(onError != null ? await onError(l) : l),
        (r) async {
          if (onSuccess != null) {
            return Right(await onSuccess(r));
          }
          return nextRepoResult!.call(r);
        },
      );
    } catch (e) {
      return Left(handleError(e));
    }
  }
}

abstract class FutureUseCase<Type, Params> extends UseCase<Future<Type>, Params> {}

abstract class EitherUseCase<Type, Params> extends FutureUseCase<Either<Failure, Type>, Params> {}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

final noParam = NoParams();
