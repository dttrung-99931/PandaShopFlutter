// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/src/features/common/presentation/bloc/address_input_bloc/address_input_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widget/address/provinces_or_city_input.dart';
import 'package:evievm_app/src/shared/widgets/evm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddrDialog extends StatelessWidget {
  const AddAddrDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EVMDialog(
      width: .9.sw,
      title: 'Thêm địa chỉ',
      child: Column(
        children: [
          ProvinceOrCityInput(addrBlocMixin: addressInputBloc),
        ],
      ),
    );
  }
}
