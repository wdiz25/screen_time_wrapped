import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../models/user_profile.dart';
import '../../providers/user_profile_provider.dart';
import '../../constants/theme/slide_colors.dart';
import '../../constants/theme/typography.dart';
import '../../constants/app_constants.dart';

class ProfileSetupPage extends StatefulWidget {
  final Future<void> Function() onComplete;
  const ProfileSetupPage({super.key, required this.onComplete});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _birthYearController = TextEditingController(
    text: (DateTime.now().year - 25).toString(),
  );
  final _hourlyRateController = TextEditingController(
    text: AppConstants.defaultHourlyRate.toStringAsFixed(0),
  );
  bool _saving = false;

  @override
  void dispose() {
    _birthYearController.dispose();
    _hourlyRateController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final birthYear = int.tryParse(_birthYearController.text);
    final hourlyRate = double.tryParse(_hourlyRateController.text);

    if (birthYear == null || birthYear < 1900 || birthYear > DateTime.now().year - 5) {
      _showError('Please enter a valid birth year.');
      return;
    }
    if (hourlyRate == null || hourlyRate < 0) {
      _showError('Please enter a valid hourly rate.');
      return;
    }

    setState(() => _saving = true);
    final profile = UserProfile(birthYear: birthYear, hourlyRate: hourlyRate);
    await context.read<UserProfileProvider>().saveProfile(profile);
    await widget.onComplete();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: SlideColors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlideColors.periwinkle,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ABOUT\nYOU', style: AppTypography.displayBlack(size: 56)),
              const SizedBox(height: 8),
              Text(
                'Used only for your Death Report projections. Stored locally, never shared.',
                style: AppTypography.body(size: 15),
              ),
              const SizedBox(height: 40),
              _FieldLabel('Birth Year'),
              const SizedBox(height: 8),
              _StyledTextField(
                controller: _birthYearController,
                hint: 'e.g. 1998',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 28),
              _FieldLabel('Your Hourly Rate (USD)'),
              const SizedBox(height: 4),
              Text(
                'Used to calculate the financial cost of time spent on bad apps. US median is \$35/hr.',
                style: AppTypography.label(),
              ),
              const SizedBox(height: 8),
              _StyledTextField(
                controller: _hourlyRateController,
                hint: '35',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                prefixText: '\$ ',
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: _saving
                    ? const Center(child: CircularProgressIndicator(color: Colors.black))
                    : GestureDetector(
                        onTap: _save,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Let's See My Synopsis",
                            style: AppTypography.body(
                              size: 18,
                              color: Colors.white,
                              weight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.body(size: 16, weight: FontWeight.w700),
    );
  }
}

class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? prefixText;

  const _StyledTextField({
    required this.controller,
    required this.hint,
    required this.keyboardType,
    required this.inputFormatters,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: AppTypography.body(size: 18),
        decoration: InputDecoration(
          hintText: hint,
          prefixText: prefixText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
    );
  }
}
