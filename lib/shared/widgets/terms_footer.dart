import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class TermsFooter extends StatelessWidget {
  final VoidCallback? onTermsPressed;
  final VoidCallback? onPrivacyPressed;

  const TermsFooter({
    Key? key,
    this.onTermsPressed,
    this.onPrivacyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: AppDimensions.padding48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: AppStrings.termsText,
                  style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ${AppStrings.termsOfService} ',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: null,
                ),
                const TextSpan(
                  text: '& ',
                  style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: AppStrings.privacy,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ${AppStrings.policy}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
