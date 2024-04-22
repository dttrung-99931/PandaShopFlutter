// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/order/data/models/response/order/order_response_model.dart';
import 'package:evievm_app/src/features/order/domain/dto/order/sub_order_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_actions/complete_processing_action.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/shop_order/order_actions/start_processing_action.dart';
import 'package:flutter/widgets.dart';

abstract class OrderActionsWidget extends StatelessWidget {
  const OrderActionsWidget({
    Key? key,
    required this.order,
  }) : super(key: key);
  final SubOrderDto order;
}

class OrderActionsWidgetFactory {
  static OrderActionsWidget buildOrderActions(SubOrderDto order) {
    switch (order.subOrderStatus) {
      case OrderStatus.created:
        return StartProcessingAction(order: order);
      case OrderStatus.pending:
        return StartProcessingAction(order: order);
      case OrderStatus.processing:
        return StartProcessingAction(order: order);
      case OrderStatus.cancelledByBuyer:
        return StartProcessingAction(order: order);
      case OrderStatus.cancelledByShop:
        return StartProcessingAction(order: order);
      case OrderStatus.waitingForDelivering:
        return CompleteProcessingAction(order: order);
      case OrderStatus.delivering:
        return StartProcessingAction(order: order);
      case OrderStatus.delivered:
        return StartProcessingAction(order: order);
      case OrderStatus.completedByUser:
        return StartProcessingAction(order: order);
      case OrderStatus.completedBySystem:
        return StartProcessingAction(order: order);
      case OrderStatus.lost:
        return StartProcessingAction(order: order);
    }
  }
}
