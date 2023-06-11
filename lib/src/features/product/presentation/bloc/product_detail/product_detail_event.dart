part of 'product_detail_bloc.dart';

class OnGetProductDetail extends BaseEvent {
  final int id;

  OnGetProductDetail(this.id);

  @override
  List<Object?> get props => [id];
}
