import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/src/shared/widgets/color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/config/theme/app_theme.dart';

class SettingMenu extends StatefulWidget {
  static const expandColapseDuration = Duration(milliseconds: 200);

  const SettingMenu({Key? key}) : super(key: key);

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
  bool _isExpanded = true;
  final String _iconPlaceHodlerSvg = '''
<svg xmlns="http://www.w3.org/2000/svg" width="23.999" height="24" viewBox="0 0 23.999 24">
  <g id="Group_21628" data-name="Group 21628" transform="translate(6561 17389)">
    <path id="Subtraction_3" data-name="Subtraction 3" d="M24,24H0V0H24V24ZM6.293,17H7.708l-6,6H22.294l-6-6h1.413L23,22.293V1.707L17.707,7H16.292l6-6H1.707l6,6H6.293L1,1.707V22.293L6.293,17Z" transform="translate(-6561 -17389)" fill="#fff"/>
    <path id="Path_13965" data-name="Path 13965" d="M1.036-9.638v5.9H2.242v-5.9ZM6.807-5.6a1.111,1.111,0,0,1-1.137.99c-1.008,0-1.318-.965-1.318-2.084,0-1.068.327-2.058,1.309-2.058.81,0,1,.482,1.12.965h1.18A2.039,2.039,0,0,0,5.7-9.716c-1.723,0-2.575,1.361-2.575,3.023,0,1.688.672,3.04,2.532,3.04A2.193,2.193,0,0,0,8-5.6Zm4.41-4.117A2.7,2.7,0,0,0,8.538-6.727c0,1.671.775,3.075,2.6,3.075,1.86,0,2.679-1.369,2.679-3.066C13.818-8.3,13.008-9.716,11.216-9.716Zm-.052.956c1.051,0,1.421.956,1.421,2.041,0,1.24-.37,2.11-1.4,2.11-.93,0-1.4-.939-1.4-2.119C9.778-7.864,10.192-8.76,11.165-8.76Zm4.591,5.021V-5.565c0-1.059,0-2.076-.043-2.825h.009c.086.224.293.7,2.179,4.651h1.473v-5.9h-1.1v1.826c0,.965.009,1.929.069,2.636h-.017c-.086-.284-.37-.87-2.127-4.461H14.662v5.9Z" transform="translate(-6559.205 -17370.314)" fill="#fff"/>
  </g>
</svg>
''';

  void toogle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _isExpanded ? Dimensions.settingMenuExpandWidth(context) : Dimensions.settingMenuCollapseWidth(context),
      color: EVMColors.blueGrey2,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      duration: SettingMenu.expandColapseDuration,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 4.0),
          _CollapseExpandButton(
            onPressed: toogle,
            alignment: _isExpanded ? Alignment.centerRight : Alignment.centerLeft,
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.lab_info',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.employee_list',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.establish_project',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.setting_artifact',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.material_management',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.icon_management',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.remanufactoring_reasons',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.clinic_clients_list',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.device_connection_setting',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.payment_method',
                  showTitle: _isExpanded,
                ),
                _SettingItem(
                  onPressed: () {},
                  svgIcon: _iconPlaceHodlerSvg,
                  title: 'settings.management_setting',
                  showTitle: _isExpanded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CollapseExpandButton extends StatelessWidget {
  final Function() onPressed;
  final Alignment alignment;

  const _CollapseExpandButton({
    Key? key,
    required this.onPressed,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: alignment,
      duration: SettingMenu.expandColapseDuration,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(Assets.ic.settingMenuToggle, height: 23, width: 23),
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final String svgIcon;
  final String title;
  final bool showTitle;
  final Function() onPressed;

  const _SettingItem({
    Key? key,
    required this.svgIcon,
    required this.title,
    required this.showTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      // Wrap scroll view to ignore overflow error when [SettingMenuDrawer] expaneded
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: Row(
            children: [
              SizedBox(height: 28, width: 28, child: SvgPicture.string(svgIcon)),
              const SizedBox(width: 20),
              AnimatedOpacity(
                opacity: showTitle ? 1 : 0,
                duration: SettingMenu.expandColapseDuration,
                child: Text(
                  tr(title),
                  style: textTheme.bodyLarge?.copyWith(color: EVMColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
