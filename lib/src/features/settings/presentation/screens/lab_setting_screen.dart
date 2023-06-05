// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/settings/data/models/lab_branch_model.dart';
import 'package:evievm_app/src/features/settings/presentation/widgets/setting_menu.dart';
import 'package:evievm_app/src/shared/widgets/evm_app_bar.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabSettingScreen extends StatelessWidget {
  static const router = '/labSetting';
  const LabSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                const SettingMenu(),
                Expanded(
                  child: Column(
                    children: const [
                      EVMAppBar(title: 'settings.lab_info'),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: Dimensions.appBarHeight,
              left: Dimensions.settingMenuExpandWidth(context),
              child: const _LabSettingsTabs(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabSettingsTabs extends StatefulWidget {
  const _LabSettingsTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<_LabSettingsTabs> createState() => _LabSettingsTabsState();
}

class _LabSettingsTabsState extends State<_LabSettingsTabs> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            Container(
              margin: const EdgeInsets.only(left: 4),
              alignment: Alignment.centerLeft,
              height: 60,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (tabIndex) {
                  setState(() {
                    _selectedTabIndex = tabIndex;
                  });
                },
                indicatorWeight: 3,
                isScrollable: true,
                tabs: [
                  _TabItem(isSelected: _selectedTabIndex == 0, title: '基本情 報'),
                  _TabItem(isSelected: _selectedTabIndex == 1, title: '支店・拠点'),
                  _TabItem(isSelected: _selectedTabIndex == 2, title: '部署'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _LabInfoTab(),
                  const _LabBranchTab(),
                  const Text('Tab3'),
                ],
              ),
            ),
          ],
        ));
  }
}

const labTabPadding = EdgeInsets.fromLTRB(20, 0, 20, 20);

class _LabBranchTab extends StatelessWidget {
  const _LabBranchTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: labTabPadding.copyWith(top: labTabPadding.top + 2),
      child: _LabBranchSortableList(labBranches: LabBranchModel.dummyList),
    );
  }
}

class _LabBranchSortableList extends StatefulWidget {
  final List<LabBranchModel> labBranches;
  const _LabBranchSortableList({
    Key? key,
    required this.labBranches,
  }) : super(key: key);

  @override
  State<_LabBranchSortableList> createState() => _LabBranchSortableListState();
}

class _LabBranchSortableListState extends State<_LabBranchSortableList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = widget.labBranches.removeAt(oldIndex);
          widget.labBranches.insert(newIndex, item);
        });
      },
      header: const _Header(),
      children: widget.labBranches.map((branch) => _LabBranchItem(branch, key: Key(branch.id))).toList(),
    );
  }
}

class _LabBranchItem extends StatelessWidget {
  final LabBranchModel branch;
  const _LabBranchItem(this.branch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
          child: Row(
            children: [
              const SizedBox(width: 6),
              Expanded(flex: 1, child: SvgPicture.asset(Assets.ic.settings)),
              const SizedBox(width: 16),
              Expanded(flex: 8, child: Text(branch.name, style: textTheme.bodyMedium)),
              Expanded(flex: 20, child: Text(branch.address, style: textTheme.bodyMedium)),
              Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: EVMColors.primary),
                        borderRadius: BorderRadiusDirectional.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                    ),
                    child: Text(
                      tr('common.edit'),
                      style: textTheme.bodyMedium?.copyWith(color: EVMColors.primary),
                    ),
                  )),
              const SizedBox(width: 12),
            ],
          ),
        ),
        const Divider(color: EVMColors.divider, height: 8),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EVMColors.tableHeader,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const ExpandedSizedBox(flex: 1),
          const SizedBox(width: 16),
          Expanded(
            flex: 8,
            child: _HeaderCell(title: tr('settings.branch/bases'), isSortIconActive: true),
          ),
          Expanded(
            flex: 20,
            child: _HeaderCell(title: tr('settings.address'), isSortIconActive: false),
          ),
          const ExpandedSizedBox(flex: 2),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatefulWidget {
  final String title;
  final bool isSortIconActive;
  const _HeaderCell({
    Key? key,
    required this.title,
    required this.isSortIconActive,
  }) : super(key: key);

  @override
  State<_HeaderCell> createState() => _HeaderCellState();
}

class _HeaderCellState extends State<_HeaderCell> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title, style: textTheme.bodyMedium),
        Icon(
          Icons.arrow_drop_down,
          color: widget.isSortIconActive ? EVMColors.primary : EVMColors.blackLight,
          size: 28,
        ),
      ],
    );
  }
}

class _LabInfoTab extends StatelessWidget {
  final _authBloc = getIt<SignUpBloc>();

  _LabInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: labTabPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.company_name',
              controller: _authBloc.companyNameController,
              showTopDivider: false,
              showRequiredLabel: false,
              inputWidth: 180,
              customInput: CustomDropdownButton<String>(
                onSelected: (district) {
                  _authBloc.selectedDistrict = district;
                },
                dataItems: const [
                  '法人名',
                  '法人名 2',
                  '法人名 3',
                  '法人名 4',
                ],
                itemBuilder: ((item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(item, style: textTheme.bodyMedium),
                  );
                }),
              ),
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.technicain_name',
              controller: _authBloc.technicianNameController,
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.lab_name',
              controller: _authBloc.labNameController,
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              inputWidth: 180,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.phone_num',
              controller: _authBloc.phoneController,
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              inputWidth: 180,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'settings.fax',
              controller: _authBloc.phoneController,
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.postal_code',
              controller: _authBloc.postalCodeController,
              showTopDivider: false,
              inputWidth: 180,
              expandTrailing: false,
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: EVMColors.primary),
                    borderRadius: BorderRadiusDirectional.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                ),
                child: Text(
                  tr('auth.auto_fill_company_addr'),
                  style: textTheme.bodyMedium?.copyWith(color: EVMColors.primary),
                ),
              ),
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.district',
              defaultTextWhenNotEditable: _authBloc.selectedDistrict ?? '',
              inputWidth: 512,
              customInput: Padding(
                padding: const EdgeInsets.only(right: 144),
                child: CustomDropdownButton<String>(
                  onSelected: (district) {
                    _authBloc.selectedDistrict = district;
                  },
                  dataItems: const [
                    '1区',
                    '2区',
                    '3区',
                    '4区',
                  ],
                  itemBuilder: ((item) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(item, style: textTheme.bodyMedium),
                    );
                  }),
                ),
              ),
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.ward',
              defaultTextWhenNotEditable: _authBloc.selectedWardName ?? '',
              customInput: CustomDropdownButton<String>(
                onSelected: (wardName) {
                  _authBloc.selectedWardName = wardName;
                },
                dataItems: const [
                  '病棟1',
                  '病棟2',
                  '病棟3',
                  '病棟4',
                ],
                itemBuilder: ((item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(item, style: textTheme.bodyMedium),
                  );
                }),
              ),
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.street_name',
              controller: _authBloc.streetNameController,
              showTopDivider: false,
            ),
            InfoInput(
              titleFlex: 4,
              hasRightSpace: false,
              titleStyle: textTheme.bodyLarge,
              paddingLeft: 0,
              requireBackgroundColor: EVMColors.redDeep,
              isEditable: true,
              title: 'common.building_name',
              controller: _authBloc.buildingNameController,
              showTopDivider: false,
              showRequiredLabel: false,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 56),
                onPressed: () {},
                title: tr('settings.renew'),
                elevation: 4,
                borderRadius: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _TabItem({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: textTheme.bodyMedium?.copyWith(color: isSelected ? EVMColors.primary : EVMColors.blackLight),
      ),
    );
  }
}
