// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/shop/data/models/request/shop_request_model.dart';

abstract class ShopRepo extends BaseRepo {
  Future<Either<Failure, dynamic>> registerShop(ShopParams param);
}

class ShopParams {
  final int userId;
  final ShopRequestModel shop;
  ShopParams({
    required this.userId,
    required this.shop,
  });
}
