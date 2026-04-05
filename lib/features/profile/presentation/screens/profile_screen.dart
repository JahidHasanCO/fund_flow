import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090909),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildProfileCard(),
            _buildTierBadge(),
            _buildBottomNav(),
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
          GestureDetector(
            onTap: () {},
            child: Container(width: 48, height: 48, color: Colors.transparent),
          ),
          const Text('Account Profile', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          GestureDetector(
            onTap: () {},
            child: Container(width: 48, height: 48, color: Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          Container(
            width: 126,
            height: 126,
            decoration: ShapeDecoration(
              image: const DecorationImage(image: NetworkImage('https://placehold.co/126x126'), fit: BoxFit.fill),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(63)),
            ),
          ),
          const Text('Julian Thorne', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
          const Text('GOLD TIER INVESTOR', style: TextStyle(color: Color(0xFFF4C025), fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.4)),
          Text.rich(
            TextSpan(children: [
              const TextSpan(text: 'Referral Code: ', style: TextStyle(color: Color(0x99CBBC90), fontSize: 12)),
              const TextSpan(text: 'JHKKHU', style: TextStyle(color: Color(0xFFF4C025), fontSize: 12, fontWeight: FontWeight.w700)),
            ]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTierBadge() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
    );
  }

  Widget _buildBottomNav() {
    return Container(
      width: 390,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: ShapeDecoration(
        color: const Color(0xCC121212),
        shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('HOME', false),
          _buildNavItem('HISTORY', false),
          _buildNavItem('INVEST', false),
          _buildNavItem('PROFILE', true),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, bool active) {
    return Text(label, style: TextStyle(color: active ? AppColors.primary : const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w700));
  }
}
