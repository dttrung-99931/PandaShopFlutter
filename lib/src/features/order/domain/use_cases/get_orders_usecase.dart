// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/use_case/use_case.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/data/models/request/get_orders_request_model.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/order/domain/repos/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOrdersUseCase extends EitherUseCase<List<OrderDto>, GetOrdersRequestModel> {
  final OrderRepo _repo;

  GetOrdersUseCase(this._repo);

  @override
  Future<Either<Failure, List<OrderDto>>> call(GetOrdersRequestModel param) async {
    return handleRepoResult(
      repoResult: _repo.getOrders(param),
      onSuccess: (List<OrderResponseModel> model) async {
        return model.mapList((element) => OrderDto.fromModel(element));
      },
    );
  }
}
