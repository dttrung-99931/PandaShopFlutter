// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evievm_app/core/utils/app_colors.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/common/domain/dtos/address_dto.dart';
import 'package:evievm_app/src/features/common/presentation/bloc/address/address_bloc.dart';
import 'package:evievm_app/src/features/common/presentation/widget/address/add_address_dialog.dart';
import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
import 'package:evievm_app/src/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/widgets/custom_bloc_builder.dart';
import '../../../../../shared/widgets/spacing_column.dart';

class AddressInput extends StatefulWidget {
  const AddressInput({
    super.key,
    this.title = 'Địa chỉ',
    required this.onSelected,
    this.initSelectedId,
  });
  final String title;
  final Function(AddressDto selected) onSelected;
  final int? initSelectedId;

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  // Separated address bloc
  final AddressBloc addressBloc = getIt();

  @override
  void initState() {
    addressBloc.add(OnGetMyAddresses(selectedId: widget.initSelectedId));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AddressInput oldWidget) {
    if (oldWidget.initSelectedId != widget.initSelectedId) {
      addressBloc.add(OnGetMyAddresses(selectedId: widget.initSelectedId));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    addressBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      title: widget.title,
      titlePadding: EdgeInsets.only(bottom: 8.h),
      child: CustomBlocBuilder<AddressBloc>(
        bloc: addressBloc,
        buildForStates: const [GetMyAddressesSucess],
        builder: (state) {
          if (state is! GetMyAddressesSucess) {
            return emptyWidget;
          }
          return CustomDropdownButton(
            selectedItem: state.selected,
            height: 64.h,
            dataItems: state.data,
            disableItems: [AddressDto.add],
            itemBuilder: (AddressDto item) {
              return item == AddressDto.add
                  ? InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddAddrDialog(
                            onAddSuccessed: (added) {
                              addressBloc.add(OnGetMyAddresses(selectedId: added.id));
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        child: Text(
                          'Thêm địa chỉ',
                          style: textTheme.bodyLarge?.withColor(AppColors.blackLight.withOpacity(.6)),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: SpacingColumn(
                        spacing: 2.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (item.name.isNotEmpty)
                            Text(item.name, style: textTheme.bodyLarge.withWeight(FontWeight.bold)),
                          Text(item.address, style: textTheme.bodyMedium),
                        ],
                      ),
                    );
            },
            onSelected: (AddressDto? item) {
              widget.onSelected(item!);
            },
          );
        },
      ),
    );
  }
}
