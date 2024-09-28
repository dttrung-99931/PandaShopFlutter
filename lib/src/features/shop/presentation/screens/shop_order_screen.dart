// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/shop_order/shop_order_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_status_tab.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/shop_order_list/shop_order_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopOrderScreen extends StatefulWidget {
  static const router = '/shopOrder';

  const ShopOrderScreen({super.key});

  @override
  State<ShopOrderScreen> createState() => _ShopOrderScreenState();
}

class _ShopOrderScreenState extends State<ShopOrderScreen> {
  @override
  void initState() {
    super.initState();
    shopOrderBloc.add(OnSelectOrderStatus(selected: shopOrderBloc.selectedStatus));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.background,
      body: RefreshIndicator(
        onRefresh: () async {
          shopOrderBloc.add(OnGetShopOrders(orderStatus: shopOrderBloc.selectedStatus));
        },
        child: const CustomScrollView(
          slivers: [
            _AppBar(),
            OrderStatusesTab(),
            ShopOrderListBuilder(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryShop,
      automaticallyImplyLeading: false,
      stretchTriggerOffset: 56,
      floating: true,
      snap: true,
      elevation: 2.r,
      title: Text('Đơn hàng', style: textTheme.titleSmall?.withColor(AppColors.white)),
      // title: CustomBlocBuilder<ShopOrderBloc>(
      //   builder: (state) {
      //     return Text(
      //       'Đơn hàng${state is ShoppingCartUpdated ? ' (${state.data.total})' : ''}',
      //       style: textTheme.titleSmall?.withColor(AppColors.white),
      //     );
      //   },
      // ),
    );
  }
}
