import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';

class DashboardBottomNav extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;

  const DashboardBottomNav({
    Key? key,
    required this.activeIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> navItems = [
      AppStrings.home,
      AppStrings.history,
      AppStrings.invest,
      AppStrings.profile,
    ];

    return Container(
      width: 390,
      padding: const EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: 32,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xCC121212),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          navItems.length,
          (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                Text(
                  navItems[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: activeIndex == index
                        ? AppColors.primary
                        : const Color(0xFF64748B),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.50,
                    letterSpacing: -0.50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
