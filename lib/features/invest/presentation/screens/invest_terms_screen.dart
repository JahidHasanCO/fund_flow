import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_flow/config/route_names.dart';
import 'package:fund_flow/core/constants/constants.dart';

class InvestTermsScreen extends StatefulWidget {
  const InvestTermsScreen({Key? key}) : super(key: key);

  @override
  State<InvestTermsScreen> createState() => _InvestTermsScreenState();
}

class _InvestTermsScreenState extends State<InvestTermsScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 884),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildProgressBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding16,
                ),
                child: Column(
                  spacing: AppDimensions.padding48,
                  children: [
                    const SizedBox(height: AppDimensions.padding32),
                    _buildTermsContent(),
                    _buildTermsCheckbox(),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.padding48),
              _buildContinueButton(),
              const SizedBox(height: AppDimensions.padding32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 390,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkVariant,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Invest Now (2/3)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                  letterSpacing: -0.45,
                ),
              ),
            ),
          ),
          Container(width: 48),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: 390,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          _buildProgressDot(true),
          _buildProgressDot(true),
          _buildProgressDot(false),
        ],
      ),
    );
  }

  Widget _buildProgressDot(bool active) {
    return Container(
      width: 48,
      height: 6,
      decoration: ShapeDecoration(
        color: active ? AppColors.primary : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: active ? Colors.transparent : AppColors.primary.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        shadows: active
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 0),
                )
              ]
            : null,
      ),
    );
  }

  Widget _buildTermsContent() {
    return Column(
      spacing: 24,
      children: [
        const Text(
          'Welcome to FundFlow! Before you proceed with your investment, please read and agree to the following Terms & Conditions. These terms govern your use of the FundFlow application and services.',
          style: TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.63,
          ),
        ),
        const Text(
          '1.  Acceptance of Terms: By accessing and using the FundFlow application and services, you acknowledge that you have read, understood, and agree to be bound by these Terms & Conditions, our Privacy Policy, and all applicable laws and regulations. If you do not agree to these terms, you may not use our services.',
          style: TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.63,
          ),
        ),
        const Text(
          '2.  Eligibility: You must be at least 18 years old and a resident of Bangladesh to use FundFlow\'s investment services. By agreeing to these terms, you represent and warrant that you meet these eligibility requirements.',
          style: TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.63,
          ),
        ),
        const Text(
          '3.  Investment Risks: All investments carry inherent risks.',
          style: TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.63,
          ),
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      spacing: 16,
      children: [
        GestureDetector(
          onTap: () => setState(() => _agreedToTerms = !_agreedToTerms),
          child: Container(
            width: 48,
            height: 24,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: ShapeDecoration(
              color: _agreedToTerms ? AppColors.primary : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  _agreedToTerms ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text(
          'I agree to the terms',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 1.43,
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.padding16),
      child: Container(
        width: double.infinity,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: _agreedToTerms ? AppColors.primary : Colors.grey[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadows: _agreedToTerms
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _agreedToTerms
                ? () => context.push(RouteNames.investSummary)
                : null,
            child: const Center(
              child: Text(
                'CONTINUE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF17171B),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
