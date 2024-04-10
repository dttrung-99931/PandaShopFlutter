// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_batch_input_bloc.dart';

class OnAddProductBatchInput extends BaseEvent {
  final int productInventoryId;
  OnAddProductBatchInput({
    required this.productInventoryId,
  });

  @override
  List<Object?> get props => [productInventoryId];
}
