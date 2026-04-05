import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool expand;

  const StatCard({
    Key? key,
    required this.label,
    required this.value,
    this.expand = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Container(
      padding: const EdgeInsets.all(17),
      decoration: ShapeDecoration(
        color: const Color(0x0CF4C025),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x33F4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.33,
              letterSpacing: 1.20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.33,
            ),
          ),
        ],
      ),
    );

    return expand ? Expanded(child: child) : child;
  }
}
