// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_detail_bloc.dart';

class OnGetProductDetail extends BaseEvent {
  final int id;
  final int? selectedOptionId;

  OnGetProductDetail(this.id, {this.selectedOptionId});

  @override
  List<Object?> get props => [id, selectedOptionId];
}
