import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../providers/user_profile_provider.dart';
import '../../constants/theme/slide_colors.dart';
import '../../constants/theme/typography.dart';
import '../../constants/app_constants.dart';
import 'app_classifier_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _birthYearCtrl;
  late TextEditingController _hourlyRateCtrl;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final profile = context.read<UserProfileProvider>().profile;
    _birthYearCtrl = TextEditingController(
      text: profile?.birthYear.toString() ?? '',
    );
    _hourlyRateCtrl = TextEditingController(
      text: (profile?.hourlyRate ?? AppConstants.defaultHourlyRate).toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _birthYearCtrl.dispose();
    _hourlyRateCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final birthYear = int.tryParse(_birthYearCtrl.text);
    final hourlyRate = double.tryParse(_hourlyRateCtrl.text);

    if (birthYear == null || birthYear < 1900 || birthYear > DateTime.now().year - 5) {
      _showError('Enter a valid birth year.');
      return;
    }
    if (hourlyRate == null || hourlyRate < 0) {
      _showError('Enter a valid hourly rate.');
      return;
    }

    setState(() => _saving = true);
    final provider = context.read<UserProfileProvider>();
    final current = provider.profile;
    if (current != null) {
      await provider.saveProfile(current.copyWith(
        birthYear: birthYear,
        hourlyRate: hourlyRate,
      ));
    }
    if (mounted) {
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved'), backgroundColor: Colors.black),
      );
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: SlideColors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlideColors.periwinkle,
      appBar: AppBar(
        title: Text('Settings', style: AppTypography.displayBold(size: 22)),
        backgroundColor: SlideColors.periwinkle,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          _SectionHeader('Profile'),
          const SizedBox(height: 12),
          _SettingsCard(
            children: [
              _FieldRow(
                label: 'Birth Year',
                child: SizedBox(
                  width: 110,
                  child: TextField(
                    controller: _birthYearCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: AppTypography.body(size: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                ),
              ),
              const Divider(height: 1),
              _FieldRow(
                label: 'Hourly Rate (USD)',
                child: SizedBox(
                  width: 110,
                  child: TextField(
                    controller: _hourlyRateCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    style: AppTypography.body(size: 16),
                    decoration: const InputDecoration(
                      prefixText: '\$ ',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: _saving
                ? const Center(child: CircularProgressIndicator(color: Colors.black))
                : ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text('Save Profile', style: AppTypography.body(size: 16, color: Colors.white, weight: FontWeight.w700)),
                  ),
          ),
          const SizedBox(height: 32),
          _SectionHeader('App Categories'),
          const SizedBox(height: 8),
          Text(
            'Classify installed apps as Good, Bad, or Neutral to customize your BrainScore.',
            style: AppTypography.body(size: 14),
          ),
          const SizedBox(height: 12),
          _SettingsCard(
            children: [
              ListTile(
                title: Text('Manage App Categories', style: AppTypography.body(size: 16, weight: FontWeight.w600)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AppClassifierScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _SectionHeader('Privacy'),
          const SizedBox(height: 8),
          _SettingsCard(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'All usage data is processed on your device. No data is ever sent to any server or third party.',
                  style: AppTypography.body(size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTypography.displayBold(size: 18));
  }
}

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 1.5),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _FieldRow extends StatelessWidget {
  final String label;
  final Widget child;
  const _FieldRow({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(child: Text(label, style: AppTypography.body(size: 15))),
          child,
        ],
      ),
    );
  }
}
