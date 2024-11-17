// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/map_extension.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map/base_map_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_bloc.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:flutter/widgets.dart';
import 'package:panda_map/core/controllers/map_tracking_controller.dart';
import 'package:panda_map/widgets/map/map_tracking_bottom_sheet.dart';

class DeliveryTrackingArgs {
  final DeliveryWithOrdersResponseDto deliveryWithOrders;
  DeliveryTrackingArgs({
    required this.deliveryWithOrders,
  });
}

class DeliveryTrackingBottomSheetScreen extends StatefulWidget {
  const DeliveryTrackingBottomSheetScreen({
    super.key,
    required this.args,
  });
  final DeliveryTrackingArgs args;

  @override
  State<DeliveryTrackingBottomSheetScreen> createState() => _DeliveryTrackingBottomSheetScreenState();
}

class _DeliveryTrackingBottomSheetScreenState extends State<DeliveryTrackingBottomSheetScreen> {
  DeliveryWithOrdersResponseDto get deliveryWithOrders => widget.args.deliveryWithOrders;

  @override
  void initState() {
    mapDeliveryTrackingBloc.add(OnEnsureMapSdkInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (deliveryWithOrders.progress == null || deliveryWithOrders.progress?.driverLat == 0) {
      return Center(child: Text('Delivery #${deliveryWithOrders.id} has not been started'));
    }
    return CustomBlocConsumer<MapDeliveryTrackingBloc>(
      buildForStates: const [MapSDKInitilized],
      listener: (BaseState state) {
      },
      builder: (state) {
        if (state is! MapSDKInitilized) {
          return emptyWidget;
        }
        return MapTrackingBottomSheet(
          options: MapTrackingOptions(
            from: deliveryWithOrders.progress!.driverLocation,
            to: deliveryWithOrders.currentDestLocation.address.mapLocation,
          ),
          controller: mapDeliveryTrackingBloc.trackingController,
        );
      },
    );
  }
}
