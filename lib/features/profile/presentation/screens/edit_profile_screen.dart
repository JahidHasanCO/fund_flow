import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090909),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildProfileInfo(),
            _buildSaveButton(),
          ],
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
        children: [
          GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.white)),
          const Text('Account Profile', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          Container(width: 48),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(spacing: 32, children: [
        _buildFormField('FULL NAME', 'Alexander Sterling'),
        _buildFormField('EMAIL ADDRESS', 'name@example.com'),
        _buildFormField('PHONE NUMBER', '+1 (555) 0123-4567'),
        _buildFormField('NID NUMBER', 'Enter document ID'),
        _buildFormField('BKASH NUMBR', '+1 (555) 0123-4567'),
      ]),
    );
  }

  Widget _buildFormField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFD4D4D8), fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.7)),
        Container(
          height: 56,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: const Color(0xFF342D18),
            shape: RoundedRectangleBorder(side: const BorderSide(width: 1, color: Color(0xFF685A31)), borderRadius: BorderRadius.circular(24)),
          ),
          child: Align(alignment: Alignment.centerLeft, child: Text(value, style: const TextStyle(color: Color(0xFFCBBC90), fontSize: 16))),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: 358,
      height: 56,
      margin: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        shadows: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: const Center(child: Text('SAVE CHANGES', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 1.6))),
    );
  }
}
