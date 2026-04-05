import 'package:flutter/material.dart';
import 'package:fund_flow/core/constants/constants.dart';

class ProfitCard extends StatelessWidget {
  final String profit;
  final String percentage;
  final String totalProfit;
  final String yieldPeriod;

  const ProfitCard({
    Key? key,
    required this.profit,
    required this.percentage,
    required this.totalProfit,
    required this.yieldPeriod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.23, -0.23),
          end: Alignment(0.77, 1.23),
          colors: [Color(0xFF1E1E1E), Color(0xFF0A0A0A)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 50,
            offset: Offset(0, 25),
            spreadRadius: -12,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.estimatedProfit,
                style: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                  letterSpacing: 1.40,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    profit,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    percentage,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withValues(alpha: 0.10),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.totalProfit,
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          totalProfit,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.yield,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          yieldPeriod,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: -50,
            top: -100,
            child: Opacity(
              opacity: 0.45,
              child: Container(
                width: 400,
                height: 300,
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.63, 0.39),
                    radius: 0.78,
                    colors: [
                      const Color(0xFFFEBE00),
                      const Color(0x00111111),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
