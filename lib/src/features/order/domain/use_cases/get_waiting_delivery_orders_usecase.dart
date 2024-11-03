// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/delivery_with_orders_response_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/temp_delivery_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/temp_delivery_response_dto.dart';
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetWaitingDeliveryOrdersUseCase extends EitherUseCase<List<DeliveryWithOrdersResponseDto>, NoParams> {
  final OrderRepo _repo;

  GetWaitingDeliveryOrdersUseCase(this._repo);

  @override
  Future<Either<Failure, List<DeliveryWithOrdersResponseDto>>> call(NoParams param) async {
    return handleRepoResult(
      repoResult: _repo.getWaitingDeliveryOrders(),
      onSuccess: (List<DeliveryWithOrdersResponseModel> model) async {
        return model.mapList(((e) => DeliveryWithOrdersResponseDto.fromModel(e)));
      },
    );
  }
}
