// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/format_utils.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/panvideo/domain/dtos/panvideo_dto.dart';
import 'package:evievm_app/src/shared/widgets/app_image.dart';

class MyPanvideoItem extends StatelessWidget {
  const MyPanvideoItem({
    super.key,
    required this.panvideo,
  });

  final PanvideoDto panvideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 88.w,
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: AppImage.network(
                panvideo.thumbImageUrl,
                fit: BoxFit.scaleDown,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          12.swb,
          // Second column: Title and description
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text(
                  panvideo.title,
                  style: textTheme.titleSmall.withColor(Colors.white54).withHeight(1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  panvideo.description,
                  style: textTheme.bodyMedium.withColor(Colors.white30),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  FormatUtils.formatDuration(panvideo.durationInSecs),
                  style: textTheme.bodyMedium.withColor(Colors.white24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8.w,
                  children: const [
                    _ActionCount(
                      count: 10,
                      icon: Icons.thumb_up,
                    ),
                    _ActionCount(
                      count: 2,
                      icon: Icons.comment,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCount extends StatelessWidget {
  const _ActionCount({
    required this.icon,
    required this.count,
  });

  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$count',
          style: textTheme.bodySmall.withColor(Colors.white54),
        ),
        4.swb,
        Icon(
          icon,
          color: Colors.white54,
          size: 16.sp,
        ),
      ],
    );
  }
}
