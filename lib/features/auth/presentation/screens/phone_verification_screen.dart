import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/constants.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../config/route_names.dart';
import '../bloc/bloc.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpSent) {
          context.push(RouteNames.otpVerification);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: AppDimensions.screenHeightSmall,
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: AppDimensions.padding24,
                          left: AppDimensions.padding24,
                          right: AppDimensions.padding24,
                          bottom: AppDimensions.padding60,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AuthHeader(
                              title: AppStrings.welcome,
                              subtitle: AppStrings.welcomeSubtitle,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(
                                AppDimensions.padding24,
                              ),
                              decoration: ShapeDecoration(
                                color: AppColors.darkCard,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: AppDimensions.borderWidth1,
                                    color: AppColors.border,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.borderRadius24,
                                  ),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 30,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: AppDimensions.padding32,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: AppDimensions.padding16,
                                    children: [
                                      CustomTextField(
                                        label: AppStrings.mobileNumber,
                                        hint: AppStrings.phoneHint,
                                        controller: _phoneController,
                                        keyboardType: TextInputType.phone,
                                        prefix: AppStrings.countryCode,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: AppDimensions.padding4,
                                        ),
                                        child: Text(
                                          AppStrings.phoneVerifyMsg,
                                          style: const TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            height: 1.63,
                                          ),
                                        ),
                                      ),
                                      CustomButton(
                                        text: AppStrings.sendOtp,
                                        onPressed: () {
                                          if (_phoneController
                                              .text.isNotEmpty) {
                                            context.read<AuthBloc>().add(
                                              SendOtpEvent(
                                                _phoneController.text,
                                              ),
                                            );
                                          }
                                        },
                                        isLoading: state is AuthLoading,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const TermsFooter(),
                          ],
                        ),
                      ),
                    ),
                    AuthProgressBar(progress: 1 / 3),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
