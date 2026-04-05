import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        backgroundColor: AppColors.dark,
      ),
      body: const Center(
        child: Text(
          'Welcome to FundFlow',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
