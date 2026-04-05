import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/route_names.dart';
import '../../../core/constants/constants.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 919),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildProgressBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding16,
                ),
                child: Column(
                  spacing: AppDimensions.padding32,
                  children: [
                    const SizedBox(height: AppDimensions.padding32),
                    _buildTitle(),
                    _buildForm(),
                    _buildContinueButton(),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.padding48),
            ],
          ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkVariant,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Invest Now (1/3)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                  letterSpacing: -0.45,
                ),
              ),
            ),
          ),
          Container(width: 48),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: 390,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          _buildProgressDot(true),
          _buildProgressDot(false),
          _buildProgressDot(false),
        ],
      ),
    );
  }

  Widget _buildProgressDot(bool active) {
    return Container(
      width: 48,
      height: 6,
      decoration: ShapeDecoration(
        color: active ? AppColors.primary : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: active ? Colors.transparent : AppColors.primary.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        shadows: active
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 0),
                )
              ]
            : null,
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      spacing: 16,
      children: [
        const Text(
          'Personal Information',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w800,
            height: 1.25,
            letterSpacing: -0.75,
          ),
        ),
        const SizedBox(
          width: 342,
          child: Text(
            'Please provide your legal details for identity\nverification and KYC compliance.',
            style: TextStyle(
              color: Color(0xFFA1A1AA),
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              height: 1.63,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      spacing: 32,
      children: [
        _buildFormField('FULL NAME', 'Alexander Sterling'),
        _buildFormField('EMAIL ADDRESS', 'name@example.com'),
        _buildFormField('PHONE NUMBER', '+1 (555) 0123-4567'),
        _buildDateOfBirth(),
        _buildGenderSelection(),
        _buildFormField('NID NUMBER', 'Enter document ID'),
        _buildUploadGovernmentId(),
        _buildSecurityNotice(),
      ],
    );
  }

  Widget _buildFormField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFD4D4D8),
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 1.50,
            letterSpacing: 0.70,
          ),
        ),
        Container(
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: const Color(0xFF342D18),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFF685A31),
              ),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hint,
              style: const TextStyle(
                color: Color(0xFFCBBC90),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateOfBirth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text(
          'DATE OF BIRTH',
          style: TextStyle(
            color: Color(0xFFD4D4D8),
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 1.50,
            letterSpacing: 0.70,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: _buildDatePickerField('Date'),
            ),
            Expanded(
              child: _buildDatePickerField('Month'),
            ),
            Expanded(
              child: _buildDatePickerField('Year'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDatePickerField(String label) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFF342D18),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFF685A31),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 16,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
            height: 1.50,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text(
          'GENDER',
          style: TextStyle(
            color: Color(0xFFD4D4D8),
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 1.50,
            letterSpacing: 0.70,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: _buildGenderButton('Male', true),
            ),
            Expanded(
              child: _buildGenderButton('Female', false),
            ),
            Expanded(
              child: _buildGenderButton('Other', false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String label, bool isSelected) {
    return Container(
      height: 56,
      decoration: ShapeDecoration(
        color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : const Color(0xFF342D18),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: isSelected ? AppColors.primary : const Color(0xFF685A31),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? AppColors.primary : const Color(0xFFA1A1AA),
            fontSize: 16,
            fontFamily: 'Manrope',
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            height: 1.50,
          ),
        ),
      ),
    );
  }

  Widget _buildUploadGovernmentId() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
        color: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            color: Color(0x4CF4C025),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        spacing: 16,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Icon(Icons.cloud_upload_outlined,
                color: AppColors.primary, size: 24),
          ),
          const Text(
            'Upload Government ID',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),
          const SizedBox(
            width: 200,
            child: Text(
              'Required for international wealth\ntransfers and tax compliance.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                height: 1.33,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFF4C025),
                ),
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: const Text(
              'SELECT DOCUMENT',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF4C025),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                height: 1.33,
                letterSpacing: 1.20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityNotice() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0x7F27272A),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFF3F3F46),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.lock_outline, color: Colors.grey[500], size: 18),
          Expanded(
            child: Text(
              'Your data is encrypted with bank-level 256-bit AES\ntechnology and will only be used for identity\nverification purposes.',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                height: 1.63,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push(RouteNames.investTerms),
          child: const Center(
            child: Text(
              'CONTINUE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF17171B),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                height: 1.50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
