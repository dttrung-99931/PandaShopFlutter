import 'package:dartz/dartz.dart';
import 'package:evievm_app/core/failures/failures.dart';
import 'package:evievm_app/src/features/product/data/data_sources/shopping_cart_data_soruce.dart';
import 'package:evievm_app/src/features/product/data/models/response/shopping_cart/shopping_cart_model.dart';
import 'package:evievm_app/src/features/product/domain/repos/shopping_cart_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ShoppingCartRepo)
class ShoppingCartRepoImpl extends ShoppingCartRepo {
  final ShoppingCartDatasource datasource;

  ShoppingCartRepoImpl(this.datasource);

  @override
  Future<Either<Failure, ShoppingCartModel>> getShoppingCart(int shoppingCartId) {
    return handleNetwork(
      onRemote: handleServerErrors(
        datasourceResponse: datasource.get(shoppingCartId),
      ),
    );
  }
}
