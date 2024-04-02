// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/base_bloc/bloc_communication.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/product/data/models/request/product/create_product_request_model.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_category_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_dto.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_option_input_dto.dart';
import 'package:evievm_app/src/features/product/domain/repos/product_repo.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/create_product_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/get_product_detail_usecase.dart';
import 'package:evievm_app/src/features/product/domain/use_cases/image/create_product_image_usecase.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/image/image_input_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_product_detail/shop_product_detail_communicaton.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'shop_product_detail_event.dart';
part 'shop_product_detail_state.dart';

ShopProductDetailBloc get shopProductDetailBloc => getIt();

@lazySingleton
class ShopProductDetailBloc extends BaseBloc {
  ShopProductDetailBloc(
    this._getProductDetail,
    this._createProduct,
    this._createImages,
  ) : super(InitialState()) {
    on<OnInitShopProduct>(_onInitShopProduct);
    on<OnSaveProduct>(_onSaveProduct);
  }
  @override
  BlocCommunication? get blocCommunication => getIt<ShopProductDetailCommunication>();
  final GetProductDetailUseCase _getProductDetail;
  final CreateProductUseCase _createProduct;
  final CreateProductImagesUseCase _createImages;

  ProductDetailDto? productDetail;
  List<ImageInputDto>? images;
  ProductCategoryDto? productCateLv3; // Need select cate to lv3
  // Map<property id, text edt controller>
  Map<int, TextEditingController>? propControllerMap;
  List<ProductOptionInputDto>? optionInputs;
  TextEditingController? descController;
  TextEditingController? productNameController;
  AddressDto? productAddress;

  FutureOr<void> _onInitShopProduct(OnInitShopProduct event, Emitter<BaseState> emit) async {
    if (event.productId != null) {
      await handleUsecaseResult(
        usecaseResult: _getProductDetail.call(event.productId!),
        emit: emit,
        onSuccess: (ProductDetailDto? result) {
          if (result != null) {
            _init(result);
            emit(InitShopProductSuccess(productDetail: result));
          }
          return null;
        },
      );
    } else {
      _init(null);
      emit(InitShopProductSuccess(productDetail: null));
    }
  }

  void _init(ProductDetailDto? result) {
    productDetail = result;
    descController = TextEditingController(text: result?.description ?? '');
    productNameController = TextEditingController(text: result?.name ?? '');
  }

  FutureOr<void> _onSaveProduct(OnSaveProduct event, Emitter<BaseState> emit) async {
    if (!handleValidate(emit, showErrMsg: true)) {
      return;
    }
    ProductDto? created = await handleUsecaseResult(
      usecaseResult: _createProduct.call(_getCreateModel()),
      emit: emit,
      onError: (failure) {
        return CreateProductError(failure);
      },
    );

    if (created != null && !isNullOrEmpty(images)) {
      await handleUsecaseResult(
        usecaseResult: _createImages.call(
          ProductImagesParams(
            productId: created.id,
            images: images!.mapList((ImageInputDto element) => element.toRequestModel()),
          ),
        ),
        emit: emit,
        onSuccess: (dynamic _) {
          return CreateProductSuccess(product: created);
        },
        onError: (failure) {
          // TODO: create state for image errror
          return CreateProductError(failure);
        },
      );
    } else {}
  }

  CreateProductRequestModel _getCreateModel() {
    return CreateProductRequestModel(
      name: productNameController?.text ?? '',
      description: descController?.text ?? '',
      sellingNum: 1,
      categoryId: productCateLv3!.id,
      shopId: Global.userDetail!.shop!.id,
      addressId: productAddress!.id, // TODO:
      productOptions: (optionInputs ?? []).mapList((ProductOptionInputDto element) => element.toRequestModel()),
      properties: (propControllerMap ?? {}).entries.mapList(
        (MapEntry<int, TextEditingController> element) {
          return PropertyValueRequestModel(propertyId: element.key, value: element.value.text);
        },
      ),
    );
  }

  @override
  bool validateMoreData() {
    return productCateLv3?.id != Constatnts.idEmpty &&
        productAddress?.id != Constatnts.idEmpty &&
        images?.isNotEmpty == true;
  }

  @disposeMethod
  @override
  Future<void> close() {
    return super.close();
  }
}
