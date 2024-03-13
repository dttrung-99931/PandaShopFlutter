// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shopping_cart_bloc.dart';

class OnGetShoppingCart extends BaseEvent {
  final int id;

  OnGetShoppingCart(this.id);

  @override
  List<Object?> get props => [id];
}
