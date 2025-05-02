// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/panvideos/panvideo_manager_bloc.dart/panvideo_manager_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideo_controller_builder.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/panvideos/panvideo_list.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';

class PanvideosScreen extends StatefulWidget {
  static const router = '/panvideos';

  const PanvideosScreen({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<PanvideosScreen> createState() => _PanvideosScreenState();
}

class _PanvideosScreenState extends AutoResetBlocState<PanvideosScreen, PanVideoBloc> {
  @override
  void initState() {
    super.initState();
    // Trigger PanvideoManagerBloc created for its communication with panvideosBloc starting
    getIt<PanvideoManagerBloc>();
    panvideosBloc.add(OnGetPanvideos());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SizedBox.expand(
          child: PanvideoControllerBuilder<PanvideoManagerBloc>(builder: (controller) {
            return CustomBlocBuilder<PanVideoBloc>(
              // loadingWidgetBuilder: () {
              //   final loading = PanvideoDto.loading();
              //   return MyPanvideoList(
              //     panvideos: List.generate(6, (_) => loading),
              //     scrollController: widget.scrollController,
              //   ).skeletonLoading(context);
              // },
              builder: (state) {
                if (state is! GetPanvideosSuccess) {
                  return emptyWidget;
                }
                return PanvideoList(
                  panvideos: state.data,
                  scrollController: widget.scrollController,
                  videoController: controller,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
