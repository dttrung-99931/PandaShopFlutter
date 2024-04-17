import 'package:evievm_app/global.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_products_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class GetProductsRequestModel {
  final String? q;
  final int? categoryIdLV1;
  final int? categoryIdLV2;
  final int? categoryIdLV3;
  final String? orderBy;
  final int? shopId;
  final bool? available;

  GetProductsRequestModel({
    this.categoryIdLV1,
    this.categoryIdLV2,
    this.categoryIdLV3,
    this.q,
    this.orderBy,
    this.shopId,
    this.available,
  });

  factory GetProductsRequestModel.shopProducts({String? q}) {
    if (Global.shop == null) {
      throw 'User is not shop user';
    }
    return GetProductsRequestModel(
      shopId: Global.shop?.id,
      orderBy: 'desc',
    );
  }

  Map<String, dynamic> toJson() => _$GetProductsRequestModelToJson(this);
}
