import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';

class DashboardTopBar extends StatelessWidget {
  final String userName;
  final String userRole;

  const DashboardTopBar({
    Key? key,
    required this.userName,
    required this.userRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xCC221E10),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x19F4C025),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      color: Color(0x4CF4C025),
                    ),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
                child: Container(
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('https://placehold.co/32x32'),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.welcomeBack,
                    style: const TextStyle(
                      color: Color(0xFFCBBC90),
                      fontSize: 10,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      height: 1.50,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              _IconButton(),
              _IconButton(),
              _IconButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: const Color(0x19F4C025),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x33F4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(),
        ),
      ),
    );
  }
}
