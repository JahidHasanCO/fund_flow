import 'package:flutter/material.dart';
import 'package:fund_flow/core/constants/constants.dart';

class ReferralCard extends StatelessWidget {
  final String name;
  final String code;
  final String earnings;

  const ReferralCard({
    Key? key,
    required this.name,
    required this.code,
    required this.earnings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: ShapeDecoration(
                  color: const Color(0x19F4C025),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    AppStrings.raferId,
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 4,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: ShapeDecoration(
                  color: const Color(0x3310B981),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  code,
                  style: const TextStyle(
                    color: Color(0xFF10B981),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.50,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
              Text(
                earnings,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF10B981),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
