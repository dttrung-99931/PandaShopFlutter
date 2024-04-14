import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/order/data/models/request/order_request_model.dart';

abstract class OrderRepo extends BaseRepo {
  Future<Either<Failure, dynamic>> createOrder(OrderRequestModel param);
}
