// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/skeleton_extension.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/bloc/my_panvideo/my_panvideo_bloc.dart';
import 'package:evievm_app/src/features/panvideo/presentation/screens/create_panvideo_screen.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/my_panvideos/my_panvideo_list.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPanvideosScreen extends StatefulWidget {
  static const router = '/myPanvideos';
  static const hereTagAddVideo = 'hereTagAddVideo';

  const MyPanvideosScreen({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<MyPanvideosScreen> createState() => _MyPanvideosScreenState();
}

class _MyPanvideosScreenState extends State<MyPanvideosScreen> {
  @override
  void initState() {
    super.initState();
    myPanVideoBloc.add(OnGetMyPanvideos());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.shb,
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Text(
                'My panvideos',
                style: textTheme.titleSmall?.copyWith(color: Colors.white60),
              ),
            ),
            Expanded(
              child: CustomBlocBuilder<MyPanVideoBloc>(
                loadingWidgetBuilder: () {
                  final loading = PanvideoDto.loading();
                  return MyPanvideoList(
                    panvideos: List.generate(6, (_) => loading),
                    scrollController: widget.scrollController,
                  ).skeletonLoading(context);
                },
                builder: (state) {
                  if (state is! GetMyPanvideosSuccess) {
                    return emptyWidget;
                  }
                  return MyPanvideoList(
                    panvideos: state.data,
                    scrollController: widget.scrollController,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // Fix same tag error
          heroTag: MyPanvideosScreen.hereTagAddVideo,
          shape: const CircleBorder(),
          onPressed: () {
            Global.pushNamed(CreatePanvideoScreen.router);
          },
          backgroundColor: Colors.white24,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
