// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/base_bloc/base_state.dart';
import 'package:evievm_app/core/utils/extensions/num_extensions.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart';
import 'package:evievm_app/src/features/shop/presentation/widgets/product_inventory/product_inventory_input.dart';
import 'package:evievm_app/src/shared/widgets/common/adding_pannel.dart';
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
  final Function(AddressDto added)? onAddSuccessed;

  static Future<T?> show<T>(BuildContext context) {
    return showDialog(context: context, builder: (_) => const ProductInventoryAdditionDialog());
  }

  @override
  State<ProductInventoryAdditionDialog> createState() => _ProductInventoryAdditionDialogState();
}

class _ProductInventoryAdditionDialogState extends State<ProductInventoryAdditionDialog> {
  final addressInputBloc = getIt<AddressInputBloc>();

  @override
  void initState() {
    addressInputBloc.addressBloc.add(OnInitInputAddress(addressBlocMixin: addressInputBloc));
    super.initState();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<AddressInputBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBlocListener<AddressInputBloc>(
      listener: (state) {
        if (state is SaveMyAddressSuccesss) {
          widget.onAddSuccessed?.call(state.data);
          // Pop AddAddressDialog
          Global.pop();
          // Pop Address drop down
          Global.pop();
        }
      },
      child: AppDialog(
        width: .9.sw,
        title: 'Nhập hàng',
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ProductSelect
              // ProductOptionInventoryInput
              // ProductOptionInventoryInput
              // ProductOptionInventoryInput
              // const ProductInventoryInput(),
              // InfoInput(
              //   title: 'Lưu địa chỉ với tên',
              //   controller: addressInputBloc.addrNameController,
              // ),
              AddingPannel(
                height: 100.h,
                title: 'Thêm sản phẩm nhập',
                onPressed: () {},
              ),
              8.shb,
              CustomBlocBuilder<AddressInputBloc>(
                buildForStates: const [SaveMyAddressSuccesss],
                builder: (state) {
                  return CustomButton(
                    isLoading: state is LoadingState,
                    title: 'Nhập hàng',
                    onPressed: () {
                      // addressInputBloc.add(OnSaveMyAddress());
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