import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/route_names.dart';
import '../../../core/constants/constants.dart';
import '../widgets/dashboard_widgets.dart';

class DashboardHistoryScreen extends StatefulWidget {
  const DashboardHistoryScreen({Key? key}) : super(key: key);

  @override
  State<DashboardHistoryScreen> createState() => _DashboardHistoryScreenState();
}

class _DashboardHistoryScreenState extends State<DashboardHistoryScreen> {
  int _activeNavIndex = 1;

  void _handleNavigation(int index) {
    setState(() {
      _activeNavIndex = index;
    });

    switch (index) {
      case 0:
        context.pop();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 919),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardTopBar(
                userName: AppStrings.executive,
                userRole: AppStrings.welcomeBack,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding16,
                ),
                child: Column(
                  spacing: AppDimensions.padding32,
                  children: [
                    const SizedBox(height: AppDimensions.padding32),
                    _buildTabHeader(),
                    _buildInvestmentTable(),
                    _buildHistoryTable(),
                    _buildReferralSection(),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.padding48),
              DashboardBottomNav(
                activeIndex: _activeNavIndex,
                onTap: _handleNavigation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabHeader() {
    return Container(
      width: 358,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withValues(alpha: 0.10),
          ),
        ),
      ),
      child: Row(
        spacing: 32,
        children: [
          _TabButton(
            label: AppStrings.investments,
            isActive: true,
          ),
          _TabButton(
            label: AppStrings.profit,
            isActive: false,
          ),
          _TabButton(
            label: AppStrings.withdrawals,
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildInvestmentTable() {
    return Container(
      width: 358,
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
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              AppStrings.date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              AppStrings.amount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              AppStrings.type,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              AppStrings.profit,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTable() {
    return Container(
      width: 358,
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      ),
      child: Column(
        children: [
          _buildHistoryRow('2024-07-20', '1,500', AppStrings.weeklyProfit,
              'BDT 1,500'),
          _buildHistoryRow('2024-07-20', '1,500', AppStrings.weeklyProfit,
              'BDT 1,500'),
          _buildHistoryRow('2024-07-20', '1,500', AppStrings.weeklyProfit,
              'BDT 1,500'),
        ],
      ),
    );
  }

  Widget _buildHistoryRow(
    String date,
    String amount,
    String type,
    String profit,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            type,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            profit,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralSection() {
    return Column(
      spacing: 16,
      children: [
        Text(
          AppStrings.referralId,
          style: const TextStyle(
            color: Color(0xFFD4D4D8),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.70,
          ),
        ),
        ReferralCard(
          name: AppStrings.referredName,
          code: AppStrings.referralCode,
          earnings: '+\$15,240.00',
        ),
        ReferralCard(
          name: AppStrings.referredName,
          code: AppStrings.referralCode,
          earnings: '+\$15,240.00',
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const _TabButton({
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
            color: isActive ? AppColors.primary : Colors.transparent,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.primary : const Color(0xFF94A3B8),
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.35,
        ),
      ),
    );
  }
}
