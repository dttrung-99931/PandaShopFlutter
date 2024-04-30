// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/shared/widgets/common/empty_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/notification/data/models/request/get_notifications_model.dart';
import 'package:evievm_app/src/features/notification/domain/dtos/notification_dto.dart';
import 'package:evievm_app/src/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    _getNotifications();
    super.initState();
  }

  void _getNotifications() {
    notiBloc.add(OnGetNotifications(
      requestModel: GetNotificationsModel(onlyForShop: !Global.isUserMode),
    ));
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
              if (state.data.isEmpty) {
                return const EmptyData(title: 'Bạn chưa có thông báo!');
              }
              return ListView(
                children: state.data.mapList(
                  (element) => NotificationItem(noti: element),
                ),
              );
            }),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.noti,
  }) : super(key: key);
  final NotificationDto noti;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      color: AppColors.white,
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(noti.title, style: textTheme.bodyLarge.bold()),
          4.shb,
          Text(noti.description, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
