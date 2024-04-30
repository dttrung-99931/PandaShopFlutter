import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';
import 'package:evievm_app/src/shared/widgets/loading_widget.dart';
import 'package:evievm_app/src/shared/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EVMTable extends StatelessWidget {
  final List<String> headerText;
  final List<Widget Function(int)> rowItemBuilder;
  final void Function(int sortColumnIndex, String sortColumnName, bool isAsc)? onSort;
  final int? activeSortColumnIndex;
  final bool isActiveSortAsc;
  final List<String> sortFieldNames;
  final List<int>? rowFlex;
  final List<double>? rowSpace;
  final double? headerHeight; // default is 48.h
  final ScrollController? scrollController;
  final bool isLoadingMore;

  const EVMTable({
    required this.headerText,
    required this.rowItemBuilder,
    this.onSort,
    this.rowFlex,
    this.rowSpace,
    this.headerHeight,
    this.scrollController,
    this.isLoadingMore = false,
    super.key,
    this.activeSortColumnIndex,
    this.isActiveSortAsc = false,
    this.sortFieldNames = const [],
  })  : assert((rowFlex != null && headerText.length == rowFlex.length) || rowFlex == null),
        assert((rowSpace != null && headerText.length == rowSpace.length + 1) || rowSpace == null);

  int get _nColumns => headerText.length;
  int get _nRows => rowItemBuilder.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            itemCount: isLoadingMore ? _nRows + 1 : _nRows,
            itemBuilder: (ctx, i) {
              if (isLoadingMore && i == _nRows) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: LoadingWidget(size: 40.r),
                );
              }
              return _row(i);
            },
            separatorBuilder: (ctx, i) => const Divider(height: 0, thickness: 1, color: EVMColors.divider),
          ),
        ),
      ],
    );
  }

  Widget _header() {
    return Container(
      height: headerHeight ?? 48.h,
      color: EVMColors.tableHeader,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: List.generate(
          _nColumns,
          (j) => _itemHeader(
              title: headerText[j],
              flex: rowFlex?[j] ?? 1,
              onTap: () {
                if (onSort == null) return;
                onSort!(
                  j,
                  sortFieldNames[j],
                  activeSortColumnIndex != j ? false : !isActiveSortAsc,
                );
              },
              isSortActive: activeSortColumnIndex == j,
              isSortAsc: isActiveSortAsc),
        ).interleave(
          List.generate(_nColumns - 1, (j) => sw(rowSpace?[j] ?? 0)),
        ),
      ),
    );
  }

  Widget _itemHeader({
    required String title,
    required int flex,
    required void Function()? onTap,
    required bool isSortActive,
    bool? isSortAsc,
  }) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(tr(title), style: textTheme.bodySmall)),
              if (onTap != null) sw(6.w),
              if (onTap != null)
                RotatedBox(
                  quarterTurns: isSortActive && isSortAsc == true ? 2 : 0,
                  child: SvgPicture.asset(
                    Assets.ic.arrowDown,
                    width: 14.w,
                    color: isSortActive ? EVMColors.primary : EVMColors.greyDark,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(int i) {
    return Container(
      color: EVMColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: List<Widget>.generate(
          _nColumns,
          (j) => Expanded(
            flex: rowFlex?[j] ?? 1,
            child: rowItemBuilder[i].call(j),
          ),
        ).interleave(
          List<Widget>.generate(_nColumns - 1, (j) => sw(rowSpace?[j] ?? 0)),
        ),
      ),
    );
  }
}
