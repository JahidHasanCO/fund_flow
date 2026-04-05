import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class AuthProgressBar extends StatelessWidget {
  final double progress;

  const AuthProgressBar({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Container(
        width: 390,
        height: 4,
        decoration:
            BoxDecoration(color: AppColors.borderLight),
        child: Stack(
          children: [
            Container(
              width: 390 * progress,
              height: 4,
              decoration:
                  BoxDecoration(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
