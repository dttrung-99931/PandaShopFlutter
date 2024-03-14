import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/core/repository/base_repository.dart';
import 'package:evievm_app/src/features/product/data/models/request/shopping_cart/upsert_cart_request_model.dart';
import 'package:evievm_app/src/features/product/data/models/response/shopping_cart/shopping_cart_model.dart';

abstract class ShoppingCartRepo extends BaseRepo {
  Future<Either<Failure, ShoppingCartModel>> getShoppingCart(int shoppingCartId);
  Future<Either<Failure, dynamic>> upsertCartItem(UpsertCartRequestModel requestModel);
  Future<Either<Failure, dynamic>> deleteCartItems(List<int> cartItemDtos);
}
