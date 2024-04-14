// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_event.dart';
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/core/utils/overlay_utils.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/product_inventory_inp_dto.dart';
import 'package:evievm_app/src/features/shop/domain/dtos/warehouse/warehouse_dto.dart';
import 'package:evievm_app/src/features/shop/presentation/bloc/product_inventory/product_inventory_input/product_inventory_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_inventory/product_inventory_input.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
import 'package:evievm_app/src/shared/widgets/common/center_single_child_scroll_view.dart';
import 'package:evievm_app/src/shared/widgets/common/custom_dropdown_input.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_builder.dart';
import 'package:evievm_app/src/shared/widgets/custom_bloc_listener.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/shared/widgets/evm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInventoryAdditionDialog extends StatefulWidget {
  const ProductInventoryAdditionDialog({
    Key? key,
    this.onAddSuccessed,
  }) : super(key: key);
  final Function()? onAddSuccessed;

  Future<T?> show<T>(BuildContext context) {
    return showDialog(context: context, builder: (_) => this);
  }

  @override
  State<ProductInventoryAdditionDialog> createState() => _ProductInventoryAdditionDialogState();
}

class _ProductInventoryAdditionDialogState extends State<ProductInventoryAdditionDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<ProductInventoryInputBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<ProductInventoryInputBloc>(
      listener: (state) {
        if (state is ValidateDataState) {
          if (state.isValid) {
            productInventoryInpBloc.add(OnCreateProductInventory());
          } else if (state.showErrorMsg) {
            showSnackBar(state.message, SnackType.fail);
          }
          return;
        }

        if (state is CreateProductInventorySuccess) {
          widget.onAddSuccessed?.call();
          Global.pop();
          showSnackBar('Nhập kho thành công');
        }
      },
      // Scroll view to Fix overflow when keyboard showing
      child: CenterSingleChildScrollView(
        child: AppDialog(
          width: .9.sw,
          title: 'Nhập hàng',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: const _WarehouseSelect(),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: .6.sh),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomBlocBuilder<ProductInventoryInputBloc>(
                        buildForStates: const [ProductInventoryInpsUpdated],
                        builder: (state) {
                          if (state is! ProductInventoryInpsUpdated) {
                            return emptyWidget;
                          }
                          return Column(
                            children: state.data
                                .mapList<Widget>(
                                  (ProductInventoryInpDto element) => ProductInventoryInput(element),
                                )
                                .addBetweenEvery(16.shb),
                          );
                        },
                      ),
                      AddingPannel(
                        height: 100.h,
                        title: 'Thêm sản phẩm nhập',
                        onPressed: () {
                          productInventoryInpBloc.add(OnAddInventoryInput());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              8.shb,
              CustomBlocBuilder<ProductInventoryInputBloc>(
                buildForStates: const [LoadingState<OnCreateProductInventory>, CreateProductInventoryError],
                builder: (state) {
                  return CustomButton(
                    isLoading: state is LoadingState<OnCreateProductInventory>,
                    title: 'Nhập hàng',
                    onPressed: () {
                      productInventoryInpBloc.add(OnValidateData());
                    },
                    elevation: 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WarehouseSelect extends StatefulWidget {
  const _WarehouseSelect({Key? key}) : super(key: key);

  @override
  State<_WarehouseSelect> createState() => _WarehouseSelectState();
}

class _WarehouseSelectState extends State<_WarehouseSelect> {
  @override
  void initState() {
    productInventoryInpBloc.add(
      OnGetWarehousesToSelect(selectedId: null),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownInput<WarehouseDto, int, GetWarehousesSuccess, ProductInventoryInputBloc>(
      title: 'Kho nhập',
      titleFlex: 6,
      titleFontWeight: FontWeight.w600,
      onSelected: (WarehouseDto selected) {
        productInventoryInpBloc.add(OnWarehouseSelected(selected: selected));
      },
      buildCondition: (state) {
        return state is GetWarehousesSuccess;
      },
      nameGetter: (WarehouseDto selected) {
        return selected.name;
      },
    );
  }
}
