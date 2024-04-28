// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_actions/complete_processing_action.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_actions/no_action.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_actions/start_processing_action.dart';
import 'package:flutter/widgets.dart';

abstract class OrderActionsWidget extends StatelessWidget {
  const OrderActionsWidget({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderDto order;
}

class OrderActionsWidgetFactory {
  static OrderActionsWidget buildOrderActions(OrderDto order) {
    switch (order.status) {
      case OrderStatus.pending:
        return NoProcessingAction(order: order);
      case OrderStatus.created:
        return StartProcessingAction(order: order);
      case OrderStatus.processing:
        return CompleteProcessingAction(order: order);

      // TODO:
      case OrderStatus.cancelledByBuyer:
        return NoProcessingAction(order: order);
      case OrderStatus.cancelledByShop:
        return NoProcessingAction(order: order);
      case OrderStatus.waitingForDelivering:
        return NoProcessingAction(order: order);
      case OrderStatus.delivering:
        return NoProcessingAction(order: order);
      case OrderStatus.delivered:
        return NoProcessingAction(order: order);
      case OrderStatus.completedByUser:
        return NoProcessingAction(order: order);
      case OrderStatus.completedBySystem:
        return NoProcessingAction(order: order);
      case OrderStatus.lost:
        return NoProcessingAction(order: order);
    }
  }
}
