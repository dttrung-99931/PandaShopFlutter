import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/assets/assets.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_header.dart';
import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/dimensions.dart';

class SignUpPaymentInputScreen extends StatelessWidget {
  static const router = '/signUpPaymentInput';
  final _cardNumberController = TextEditingController();
  final _expireDateController = TextEditingController();
  // Card password
  final _cvvController = TextEditingController();

  SignUpPaymentInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVMColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: Dimensions.signUpPadding(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 48.0),
                  SignUpHeader(title: 'auth.register_credit_card', titleStyle: textTheme.titleLarge, translateX: -16),
                  const SizedBox(height: 48.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: EVMColors.blueGrey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr('auth.you_can_use_these_cards'),
                          style: textTheme.bodyMedium?.copyWith(color: EVMColors.blueGrey),
                        ),
                        SvgPicture.asset(Assets.img.paymentGateways),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  InfoInput(
                    controller: _cardNumberController,
                    title: 'auth.card_number',
                    hint: 'auth.enter_card_number_hint',
                    showRequiredLabel: false,
                  ),
                  InfoInput(
                    controller: _expireDateController,
                    title: 'auth.expire',
                    paddingRight: 64,
                    trailing: CustomDropdownButton<String>(
                      onSelected: (district) {},
                      dataItems: const ['2020年', '2021年', '2022年', '2023年'],
                      itemBuilder: ((item) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(item, style: textTheme.bodyMedium),
                        );
                      }),
                    ),
                    customInput: CustomDropdownButton<String>(
                      onSelected: (district) {},
                      dataItems: const ['1月', '2月', '3月', '4月'],
                      itemBuilder: ((item) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(item, style: textTheme.bodyMedium),
                        );
                      }),
                    ),
                  ),
                  InfoInput(
                    controller: _cvvController,
                    title: 'auth.card_cvv',
                    paddingRight: 156,
                    showBottomDivider: true,
                  ),
                  const SizedBox(height: 32.0),
                  CustomButton(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: context.width / 4),
                    onPressed: () {},
                    title: 'auth.register_card',
                    elevation: 0,
                  ),
                  const SizedBox(height: 4.0),
                  TextButton(
                    onPressed: () {},
                    child: Text(tr('auth.jump'), style: textTheme.bodyMedium?.copyWith(color: EVMColors.primary)),
                  ),
                  const SizedBox(height: 12.0),
                  Image.asset(Assets.img.creditCardGuide, fit: BoxFit.fitWidth, width: double.infinity),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
