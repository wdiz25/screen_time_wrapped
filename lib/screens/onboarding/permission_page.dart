import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/usage_stats_service.dart';
import '../../constants/theme/slide_colors.dart';
import '../../constants/theme/typography.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

class PermissionPage extends StatefulWidget {
  final VoidCallback onNext;
  const PermissionPage({super.key, required this.onNext});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver {
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Called when user returns from system settings
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissionAndAdvance();
    }
  }

  Future<void> _checkPermissionAndAdvance() async {
    final service = context.read<UsageStatsService>();
    final granted = await service.hasPermission();
    if (granted && mounted) {
      widget.onNext();
    }
  }

  Future<void> _requestPermission() async {
    setState(() => _checking = true);
    final service = context.read<UsageStatsService>();
    final already = await service.hasPermission();
    if (already) {
      if (mounted) setState(() => _checking = false);
      widget.onNext();
      return;
    }
    await service.openPermissionSettings();
    // The didChangeAppLifecycleState observer will handle the return
    if (mounted) setState(() => _checking = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlideColors.mint,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 60,
              child: M3Container.softBurst(
                color: SlideColors.pink,
                width: 120,
                height: 120,
                child: const SizedBox.shrink(),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 80,
              child: Transform.rotate(angle: 24,
              child: M3Container.c4SidedCookie(
                color: SlideColors.yellow,
                width: 100,
                height: 100,
                child: const SizedBox.shrink(),
              ), ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('🔒', style: const TextStyle(fontSize: 64)),
                    const SizedBox(height: 24),
                    Text(
                      'ONE PERMISSION',
                      style: AppTypography.displayBold(size: 32),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Screen Time Synopsis needs access to your app usage data to calculate your BrainScore and generate your Synopsis report.',
                      style: AppTypography.body(size: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'All data stays on your device.\nNothing is sent to any server.',
                        style: AppTypography.body(
                          size: 14,
                          weight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (_checking)
                      const CircularProgressIndicator(color: Colors.black)
                    else
                      _GrantButton(onTap: _requestPermission),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GrantButton extends StatelessWidget {
  final VoidCallback onTap;
  const _GrantButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          'Grant Access',
          style: AppTypography.body(
            size: 18,
            color: Colors.white,
            weight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
