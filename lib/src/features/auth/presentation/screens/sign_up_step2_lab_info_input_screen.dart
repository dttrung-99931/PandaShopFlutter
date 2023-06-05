import 'package:easy_localization/easy_localization.dart';
import 'package:evievm_app/core/utils/dimensions.dart';
import 'package:evievm_app/core/utils/evm_colors.dart';
import 'package:evievm_app/global.dart';
import 'package:evievm_app/src/config/di/injection.dart';
import 'package:evievm_app/src/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:evievm_app/src/features/auth/presentation/screens/sign_up_payment_input_screen.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/back_to_email_login_screen_button.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/info_input.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_header.dart';
import 'package:evievm_app/src/features/auth/presentation/widgets/sign_up_steps.dart';
import 'package:evievm_app/src/shared/widgets/custom_drop_down_button.dart';
import 'package:evievm_app/src/shared/widgets/cutstom_button.dart';
import 'package:evievm_app/src/config/theme.dart';
import 'package:flutter/material.dart';

class SignUpStep2LabInfoInputScreenArgs {
  final bool isEditMode;

  SignUpStep2LabInfoInputScreenArgs({required this.isEditMode});
}

class SignUpStep2LabInfoInputScreen extends StatelessWidget {
  static const router = '/signUpStep2LabInfoInput';
  final SignUpStep2LabInfoInputScreenArgs args;
  final _authBloc = getIt<SignUpBloc>();

  SignUpStep2LabInfoInputScreen(this.args, {Key? key}) : super(key: key);

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
                  SignUpHeader(titleStyle: textTheme.titleLarge, translateX: 16),
                  const SizedBox(height: 40.0),
                  SignUpSteps(currentStep: args.isEditMode ? 2 : 3, marginLeft: 72),
                  const SizedBox(height: 48.0),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.company_name',
                    controller: _authBloc.companyNameController,
                    showRequiredLabel: false,
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.technicain_name',
                    controller: _authBloc.technicianNameController,
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.lab_name',
                    controller: _authBloc.labNameController,
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.phone_num',
                    controller: _authBloc.phoneController,
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.postal_code',
                    controller: _authBloc.postalCodeController,
                    trailing: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: EVMColors.primary),
                          borderRadius: BorderRadiusDirectional.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                      ),
                      child: Text(
                        tr('auth.auto_fill_company_addr'),
                        style: textTheme.bodyMedium?.copyWith(color: EVMColors.primary),
                      ),
                    ),
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.district',
                    defaultTextWhenNotEditable: _authBloc.selectedDistrict ?? '',
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
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
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
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.street_name',
                    controller: _authBloc.streetNameController,
                  ),
                  InfoInput(
                    isEditable: args.isEditMode,
                    title: 'common.building_name',
                    controller: _authBloc.buildingNameController,
                    showBottomDivider: true,
                    showRequiredLabel: false,
                  ),
                  Row(
                    children: [
                      const ExpandedSizedBox(flex: 6),
                      Expanded(
                        flex: 14,
                        child: Column(
                          children: [
                            CustomButton(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 160),
                              onPressed: () {
                                if (args.isEditMode) {
                                  Global.navigator.pushNamed(
                                    SignUpStep2LabInfoInputScreen.router,
                                    arguments: SignUpStep2LabInfoInputScreenArgs(isEditMode: false),
                                  );
                                } else {
                                  Global.navigator.pushNamed(SignUpPaymentInputScreen.router);
                                }
                              },
                              title: tr(args.isEditMode ? 'auth.confirm_contents' : 'auth.register_lab'),
                              elevation: 0,
                            ),
                            const SizedBox(height: 4.0),
                            const BackToEmailLoginScreenButton(),
                          ],
                        ),
                      ),
                      const ExpandedSizedBox(flex: 4),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
