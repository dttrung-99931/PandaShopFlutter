import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/features/panvideo/presentation/widgets/my_panvideos/my_panvideo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPanvideoList extends StatelessWidget {
  const MyPanvideoList({
    super.key,
    required this.panvideos,
    required this.scrollController,
  });
  final List<PanvideoDto> panvideos;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(12.r),
      controller: scrollController,
      separatorBuilder: (context, index) => 12.shb,
      itemCount: panvideos.length,
      itemBuilder: (context, index) {
        final panvideo = panvideos[index];
        return MyPanvideoItem(panvideo: panvideo);
      },
    );
  }
}
