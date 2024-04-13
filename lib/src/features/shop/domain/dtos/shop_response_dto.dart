// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:evievm_app/src/features/shop/data/models/response/shop_response_model.dart';

class ShopDto extends Equatable {
  final String name;
  final int id;

  const ShopDto({
    required this.name,
    required this.id,
  });
  factory ShopDto.fromModel(ShopResponseModel model) {
    return ShopDto(id: model.id, name: model.name);
  }

  @override
  List<Object?> get props => [id];
}
