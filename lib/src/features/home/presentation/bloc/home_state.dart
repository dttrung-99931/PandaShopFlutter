part of 'home_bloc.dart';

class LogoutSuccess extends LoadingCompleteStateWithoutProps {}

class GetHomeProductsSucess extends FullDataLoadedState<List<ProductDto>> {
  GetHomeProductsSucess(super.data);

  @override
  List<Object?> get props => [data];
}
