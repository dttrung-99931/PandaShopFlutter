// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

import 'order_actions_widget_factory.dart';

class NoProcessingAction extends OrderActionsWidget {
  const NoProcessingAction({super.key, required super.order});

  @override
  Widget build(BuildContext context) {
    return emptyWidget;
  }
}
