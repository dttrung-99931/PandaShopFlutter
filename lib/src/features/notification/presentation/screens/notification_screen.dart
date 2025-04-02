// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/ui/auto_reset_bloc_state.dart';
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/core/utils/format_utils.dart';
import 'package:evievm_app/core/utils/utils.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/data/models/response/notification_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/empty_data.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends AutoResetBlocState<NotificationScreen, NotificationBloc> {
  @override
  void initState() {
    _getNotifications();
    super.initState();
  }

  void _getNotifications() {
    doIfLoggedIn(() {
      GetNotificationsModel requestModel = GetNotificationsModel.default_();
      notiBloc.add(OnGetNotifications(requestModel: requestModel));
      notiBloc.add(OnGetNotificationOverview(requestModel: requestModel));
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _getNotifications();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            'Thông báo',
            style: textTheme.titleSmall?.withColor(AppColors.white),
          ),
        ),
        body: CustomBlocBuilder<NotificationBloc>(
          buildForStates: const [GetNotificationsSuccesss],
          builder: (state) {
            if (state is! GetNotificationsSuccesss) {
              return emptyWidget;
            }
            return Stack(
              children: [
                ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.data.data.length,
                  itemBuilder: (context, index) {
                    return NotificationItem(noti: state.data.data[index]);
                  },
                ),
                if (state.data.isEmpty) ...[
                  const EmptyData(title: 'Bạn chưa có thông báo!'),
                  // Make RefreshIndicator working even no data / error
                  ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.noti,
  });
  final NotificationDto noti;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 20.r),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: noti.status == UserNotificationStatus.seen ? AppColors.white.withOpacity(0.6) : AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 2.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noti.title,
            style: textTheme.bodySmall.withOpacity(0.6),
            maxLines: 1,
          ),
          2.shb,
          Row(
            children: [
              Text(noti.data.order?.productAndOptionNames ?? '', style: textTheme.bodyLarge.bold()),
            ],
          ),
          4.shb,
          Text(noti.description, style: textTheme.bodyLarge),
          8.shb,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              FormatUtils.formatDateTime(noti.createdDate),
              style: textTheme.bodySmall.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
