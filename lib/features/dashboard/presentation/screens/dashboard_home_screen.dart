import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_flow/config/route_names.dart';
import 'package:fund_flow/core/constants/constants.dart';
import '../widgets/dashboard_widgets.dart';

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({Key? key}) : super(key: key);

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int _activeNavIndex = 0;

  void _handleNavigation(int index) {
    setState(() {
      _activeNavIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        context.push(RouteNames.history);
        break;
      case 2:
        context.push(RouteNames.investPersonal);
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
                    ProfitCard(
                      profit: '\$12,450.00',
                      percentage: '+8.4%',
                      totalProfit: '\$112,450.00',
                      yieldPeriod: '12 Months',
                    ),
                    Row(
                      spacing: 16,
                      children: [
                        StatCard(
                          label: AppStrings.totalWithdraw,
                          value: '\$12.4B',
                        ),
                        StatCard(
                          label: AppStrings.totalWithdraw,
                          value: '\$12.4B',
                        ),
                      ],
                    ),
                    StatCard(
                      label: AppStrings.withdrawalBalance,
                      value: '\$12.4B',
                    ),
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
                          borderRadius:
                              BorderRadius.circular(AppDimensions.borderRadius24),
                        ),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${AppStrings.withdrawalRules} ',
                                    style: const TextStyle(
                                      color: Color(0xFFA1A1AA),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      height: 1.63,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppStrings.withdrawalMsg,
                                    style: const TextStyle(
                                      color: Color(0xFFA1A1AA),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.63,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
}
