// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/product/domain/dto/product_detail_dto.dart';
import 'package:evievm_app/src/features/product/presentation/bloc/product_detail/product_option/product_option_bloc.dart';
import 'package:evievm_app/src/shared/widgets/common/app_chip.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:evievm_app/src/shared/widgets/sliver/sliver_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductOptions extends StatelessWidget {
  const ProductOptions({
    super.key,
    required this.productDetail,
  });

  final ProductDetailDto productDetail;

  @override
  Widget build(BuildContext context) {
    return SliverSection(
      title: 'Phân loại',
      child: CustomBlocBuilder<ProductOptionBloc>(
          buildForStates: const [OptionSelectedChanged],
          builder: (state) {
            if (state is! OptionSelectedChanged) {
              return const SizedBox.shrink();
            }
            return Column(
              children: state.selectablePropVals.entries
                  .map<Widget>(
                    (MapEntry<String, List<SelectableValueDto>> entry) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: _OptionPropertySelect(
                        propertyName: entry.key,
                        selectableValues: entry.value,
                      ),
                    ),
                  )
                  .toList()
                  .addBetweenEvery(sh(2.h)),
            );
          }),
    );
  }
}

class _OptionPropertySelect extends StatefulWidget {
  final String propertyName;
  final List<SelectableValueDto> selectableValues;

  const _OptionPropertySelect({
    required this.propertyName,
    required this.selectableValues,
  });

  @override
  State<_OptionPropertySelect> createState() => _OptionPropertySelectState();
}

class _OptionPropertySelectState extends State<_OptionPropertySelect> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: make this shorter, add 'view more' button
        Text(widget.propertyName, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
        const Spacer(),
        ...widget.selectableValues
            .map<Widget>(
              (selectableVal) => InkWell(
                onTap: selectableVal.isSelectable && !selectableVal.isSelected
                    ? () {
                        getIt<ProductOptionBloc>().add(
                          OnOptionPropSelectedChagned(
                            propertyName: widget.propertyName,
                            value: selectableVal.value,
                            isSelected: !selectableVal.isSelected,
                          ),
                        );
                      }
                    : null,
                child: AppChip(
                  isSelected: selectableVal.isSelected,
                  label: selectableVal.value,
                  isSelectable: selectableVal.isSelectable,
                ),
              ),
            )
            .toList()
            .addBetweenEvery(
              SizedBox(
                width: 4.w,
              ),
            )
      ],
    );
  }
}
