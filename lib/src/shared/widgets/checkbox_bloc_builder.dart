import 'package:evievm_app/core/base_bloc/base_bloc.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/shared/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MapStateToIsChecked = bool? Function(BaseState state);

class CheckboxBlocBuilder<T extends BaseBloc> extends StatelessWidget {
  final MapStateToIsChecked mapStateToIsChecked;
  final String label;
  final BoxShape shape;
  final EdgeInsets? checkPadding;
  final Function(T bloc, bool isChecked) onCheckChanged;
  final T bloc = getIt();
  final bool initialCheck;

  CheckboxBlocBuilder({
    super.key,
    required this.mapStateToIsChecked,
    required this.label,
    required this.onCheckChanged,
    this.shape = BoxShape.circle,
    EdgeInsets? checkPadding,
    this.initialCheck = false,
  }) : checkPadding = checkPadding ?? EdgeInsets.only(top: 8.h, bottom: 7.h);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, BaseState>(
      bloc: bloc,
      buildWhen: (previous, current) {
        return mapStateToIsChecked(current) != null;
      },
      builder: (context, state) {
        bool isChecked = mapStateToIsChecked(state) ?? initialCheck;
        return CustomCheckbox(
          value: isChecked,
          label: label,
          shape: shape,
          checkPadding: checkPadding,
          onTap: () {
            onCheckChanged(bloc, !isChecked);
          },
        );
      },
    );
  }
}
