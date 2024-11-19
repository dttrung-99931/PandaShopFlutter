// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/map_extension.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map/base_map_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/map_delivery_tracking_bloc/map_delivery_tracking_bloc.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/delivery_with_orders_response_dto.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panda_map/core/controllers/map_tracking_controller.dart';
import 'package:panda_map/panda_map_widget.dart';

class DeliveryTrackingArgs {
  final DeliveryWithOrdersResponseDto deliveryWithOrders;
  DeliveryTrackingArgs({
    required this.deliveryWithOrders,
  });
}

class DeliveryTrackingBottomSheet extends StatefulWidget {
  const DeliveryTrackingBottomSheet({
    super.key,
    required this.args,
  });
  final DeliveryTrackingArgs args;

  static Future<void> show({required BuildContext context, required DeliveryTrackingArgs args}) {
    return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: 0.612.sh,
      ),
      showDragHandle: true,
      builder: (_) => DeliveryTrackingBottomSheet(args: args),
    );
  }

  @override
  State<DeliveryTrackingBottomSheet> createState() => _DeliveryTrackingBottomSheetState();
}

class _DeliveryTrackingBottomSheetState extends State<DeliveryTrackingBottomSheet> {
  DeliveryWithOrdersResponseDto get deliveryWithOrders => widget.args.deliveryWithOrders;

  @override
  void initState() {
    mapDeliveryTrackingBloc.add(OnEnsureMapSdkInit());
    super.initState();
  }

  @override
  void dispose() {
    mapDeliveryTrackingBloc.add(OnDisposeMapSDK());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (deliveryWithOrders.progress == null || deliveryWithOrders.progress?.driverLat == 0) {
      return Center(child: Text('Delivery #${deliveryWithOrders.id} has not been started'));
    }
    return CustomBlocConsumer<MapDeliveryTrackingBloc>(
      buildForStates: const [MapSDKInitilized],
      listener: (BaseState state) {
        if (state is MapSDKInitilized) {
          mapDeliveryTrackingBloc.add(
            OnStartDeliveryTracking(
              deliveryId: widget.args.deliveryWithOrders.id,
              options: MapTrackingOptions(
                from: deliveryWithOrders.progress!.driverLocation,
                to: deliveryWithOrders.currentDestLocation.address.mapLocation,
              ),
            ),
          );
        }
      },
      builder: (state) {
        if (state is! MapSDKInitilized) {
          return emptyWidget;
        }
        return PandaMapWidget();
      },
    );
  }
}
