// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/spacing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusesTab extends StatelessWidget {
  const OrderStatusesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 4.h),
        child: CustomBlocBuilder<ShopOrderBloc>(
            buildForStates: const [DisplayOrderStatusesUpdated],
            handleLoading: false,
            buildForErrorState: false,
            builder: (state) {
              if (state is! DisplayOrderStatusesUpdated) {
                return emptyWidget;
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SpacingRow(
                    spacing: 8.w,
                    children: state.data.mapList(
                      (status) => AppChip(
                        label: status.title,
                        isSelected: status == state.selected,
                        onPressed: () {
                          shopOrderBloc.add(OnSelectOrderStatus(selected: status));
                        },
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
