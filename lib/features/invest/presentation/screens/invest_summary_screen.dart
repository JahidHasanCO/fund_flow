import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/route_names.dart';
import '../../../core/constants/constants.dart';

class InvestSummaryScreen extends StatefulWidget {
  const InvestSummaryScreen({Key? key}) : super(key: key);

  @override
  State<InvestSummaryScreenState> createState() => _InvestSummaryScreenState();
}

class _InvestSummaryScreenState extends State<InvestSummaryScreen> {
  String _selectedWithdrawal = 'Bkash';
  String _selectedPayment = 'manual';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 919),
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
                  spacing: AppDimensions.padding32,
                  children: [
                    const SizedBox(height: AppDimensions.padding32),
                    _buildTitle(),
                    _buildInvestmentSummary(),
                    _buildWithdrawalSection(),
                    _buildManualPaymentSection(),
                    _buildAutoPaymentSection(),
                    _buildSubmitButton(),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.padding48),
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
                'Invest Now (3/3)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Manrope',
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
          _buildProgressDot(true),
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

  Widget _buildTitle() {
    return const Text(
      'Your Invest Summary',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w800,
        height: 1.25,
        letterSpacing: -0.75,
      ),
    );
  }

  Widget _buildInvestmentSummary() {
    return Container(
      width: 358,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.18, -0.19),
          end: Alignment(0.82, 1.19),
          colors: [Color(0xFF1E1E1E), Color(0xFF181818)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x0CF4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        spacing: 32,
        children: [
          _buildAmountSection(),
          _buildInvestmentDetails(),
        ],
      ),
    );
  }

  Widget _buildAmountSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.41, -0.41),
          end: const Alignment(0.59, 1.41),
          colors: [
            AppColors.primary.withValues(alpha: 0.2),
            AppColors.primary.withValues(alpha: 0),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.primary.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            'INVEST AMOUNT',
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.8),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              height: 1.43,
              letterSpacing: 1.40,
            ),
          ),
          const Text(
            'BDT 50,000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 1.20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvestmentDetails() {
    return Column(
      spacing: 16,
      children: [
        _buildDetailCard(
          icon: Icons.trending_up,
          title: 'Profit Type',
          value: 'Monthly 4%',
          iconColor: AppColors.primary,
        ),
        _buildDetailCard(
          icon: Icons.check_circle,
          title: 'Projected Monthly Profit',
          value: 'BDT 2,000',
          iconColor: const Color(0xFF10B981),
        ),
      ],
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.28, -0.88),
          end: Alignment(0.72, 1.88),
          colors: [Color(0xFF1E1E1E), Color(0xFF181818)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x0CF4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawalSection() {
    return Container(
      width: 358,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.18, -0.19),
          end: Alignment(0.82, 1.19),
          colors: [Color(0xFF1E1E1E), Color(0xFF181818)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x0CF4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          const Text(
            'WITHDRAWAL METHOD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 1.43,
              letterSpacing: 1.40,
            ),
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: _buildWithdrawalButton('Bkash'),
              ),
              Expanded(
                child: _buildWithdrawalButton('Nagad'),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              const Text(
                'ENTER ACCOUNT NUMBER',
                style: TextStyle(
                  color: Color(0xFFD4D4D8),
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                  letterSpacing: 0.70,
                ),
              ),
              Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFF342D18),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF685A31),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '+1 (555) 0123-4567',
                    style: TextStyle(
                      color: Color(0xFFCBBC90),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawalButton(String label) {
    bool isSelected = _selectedWithdrawal == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedWithdrawal = label),
      child: Container(
        height: 56,
        decoration: ShapeDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : const Color(0xFF342D18),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: isSelected ? AppColors.primary : const Color(0xFF685A31),
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColors.primary : const Color(0xFFA1A1AA),
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              height: 1.50,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildManualPaymentSection() {
    return Container(
      width: 358,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.18, -0.19),
          end: Alignment(0.82, 1.19),
          colors: [Color(0xFF1E1E1E), Color(0xFF181818)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x0CF4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          const Text(
            'MANUAL PAYMENT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 1.43,
              letterSpacing: 1.40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              _buildPaymentField('SEND PAYMENT TO', '+1 (555) 0123-4567'),
              _buildPaymentField('Enter paid amount', 'Enter amount'),
              _buildPaymentField('Enter transaction ID', 'Transaction ID'),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0x7F27272A),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF3F3F46),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey[600], size: 18),
                    Expanded(
                      child: Text(
                        'You can find the Transaction ID in your mobile banking app after payment.',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          height: 1.63,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFD4D4D8),
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 1.50,
            letterSpacing: 0.70,
          ),
        ),
        Container(
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: const Color(0xFF342D18),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFF685A31),
              ),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hint,
              style: const TextStyle(
                color: Color(0xFFCBBC90),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAutoPaymentSection() {
    return Container(
      width: 358,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.18, -0.19),
          end: Alignment(0.82, 1.19),
          colors: [Color(0xFF1E1E1E), Color(0xFF181818)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x0CF4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const Text(
            'AUTO PAYMENT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 1.43,
              letterSpacing: 1.40,
            ),
          ),
          const Text(
            'Auto Payment integration coming soon! Stay tuned for seamless transactions.',
            style: TextStyle(
              color: Color(0xFFA1A1AA),
              fontSize: 12,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              height: 1.63,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: 342,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.pushReplacement(RouteNames.dashboardHome),
          child: const Center(
            child: Text(
              'Final Submit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF17171B),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                height: 1.50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
