part of 'home_bloc.dart';

class LogoutSuccess extends LoadingCompleteStateWithoutProps {}

class GetProductsSucess extends FullDataLoadedState<List<ProductDto>> {
  GetProductsSucess(super.data);

  @override
  List<Object?> get props => [data];
}
