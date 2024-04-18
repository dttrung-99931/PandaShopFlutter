// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'main_bloc.dart';

enum AppMode { user, shop }

class GetAppModeSuccess extends FullDataLoadedState<AppMode> {
  GetAppModeSuccess(super.data);
}

class ChangeAppModeSuccess extends GetAppModeSuccess {
  ChangeAppModeSuccess(super.data);
}
