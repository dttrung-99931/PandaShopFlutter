// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/product/data/models/response/shopping_cart/shopping_cart_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';
import 'package:evievm_app/src/shared/models/selectable.dart';

class ShoppingCartDto extends Equatable {
  const ShoppingCartDto({
    required this.id,
    required this.items,
  });
  final int id;
  final List<CartItemDto> items;
  List<CartItemDto> get selectedItems => items.where((element) => element.isSelected).toList();
  int get totalItems => items.length;

  factory ShoppingCartDto.fromModel(ShoppingCartModel model) {
    return ShoppingCartDto(id: model.id, items: model.items.mapList((element) => CartItemDto.fromModel(element)));
  }

  ShoppingCartDto copyWith({
    int? id,
    List<CartItemDto>? items,
  }) {
    return ShoppingCartDto(
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [id, items];
}

class CartItemDto extends Selectable {
  final int productNum;
  final int proudctOptionId;
  final ProductDto product;
  final int id;

  CartItemDto({
    required this.productNum,
    required this.proudctOptionId,
    required this.product,
    required this.id,
    super.isSelected,
  });

  factory CartItemDto.fromModel(CartItemModel model) {
    return CartItemDto(
      productNum: model.productNum,
      proudctOptionId: model.productOptionId,
      product: ProductDto.fromModel(model.shortProduct),
      id: model.id,
    );
  }

  @override
  get selectId => id;

  CartItemDto copyWith({
    int? productNum,
    int? proudctOptionId,
    ProductDto? product,
    int? id,
    bool? isSelected
  }) {
    return CartItemDto(
      productNum: productNum ?? this.productNum,
      proudctOptionId: proudctOptionId ?? this.proudctOptionId,
      product: product ?? this.product,
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
