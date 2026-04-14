import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;
import '../../constants/animals.dart';
import '../../models/app_classification.dart';
import '../../providers/usage_data_provider.dart';
import '../../models/usage_report.dart';
import '../../theme/slide_colors.dart';
import '../../theme/typography.dart';
import '../../widgets/starburst_shape.dart';
import '../../widgets/brain_score_gauge.dart';
import '../synopsis/synopsis_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  static const _labels = ['Day', 'Week', 'Month', 'Year'];
  static const _periodLabels = ['Today', 'This Week', 'This Month', 'This Year'];

  UsageReport? _activeReport(UsageDataProvider p) => switch (_selected) {
    0 => p.daily,
    1 => p.weekly,
    2 => p.monthly,
    _ => p.yearly,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  Future<void> _loadData() async {
    final provider = context.read<UsageDataProvider>();
    if (provider.state == LoadState.idle || provider.state == LoadState.error) {
      await provider.loadAll();
    }
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 18) return 'Good Afternoon';
    return 'Good Evening';
  }

  bool _shouldUseDaysHours() => _selected >= 2; // Month (2) and Year (3)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlideColors.yellow,
      body: SafeArea(
        child: Column(
          children: [
            _Header(onSettings: () async {
              final dataProvider = context.read<UsageDataProvider>();
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
              dataProvider.invalidate();
              await dataProvider.loadAll();
            }),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => context.read<UsageDataProvider>().loadAll(),
                child: Consumer<UsageDataProvider>(
                  builder: (context, dataProvider, _) {
                    if (dataProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.black));
                    }
                    final activeReport = _activeReport(dataProvider);
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _greeting(),
                                  style: AppTypography.body(size: 18, weight: FontWeight.w500),
                                ),
                                Text(
                                  intl.DateFormat('EEEE, MMMM d').format(DateTime.now()),
                                  style: AppTypography.body(size: 14, color: const Color(0xFF555555)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            if (activeReport != null)
                              Text(
                                animalForScore(activeReport.brainScore).emoji,
                                style: const TextStyle(fontSize: 36),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: List.generate(_labels.length, (i) {
                            final active = i == _selected;
                            return Padding(
                              padding: EdgeInsets.only(right: i < _labels.length - 1 ? 8 : 0),
                              child: GestureDetector(
                                onTap: () => setState(() => _selected = i),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: active ? Colors.black : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black, width: 1.5),
                                  ),
                                  child: Text(
                                    _labels[i],
                                    style: AppTypography.label(
                                      size: 13,
                                      color: active ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        if (activeReport != null) ...[
                          _QuickStatsRow(
                            report: activeReport,
                            periodLabel: _periodLabels[_selected],
                            useDaysHours: _shouldUseDaysHours(),
                          ),
                          const SizedBox(height: 24),
                        ],
                        if (activeReport != null)
                          _PeriodBreakdown(
                            report: activeReport,
                            periodLabel: _periodLabels[_selected],
                            useDaysHours: _shouldUseDaysHours(),
                          ),
                        const SizedBox(height: 24),
                        _TopAppsSection(report: activeReport, useDaysHours: _shouldUseDaysHours()),
                        const SizedBox(height: 24),
                        _SynopsisCTA(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SynopsisScreen()),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onSettings;
  const _Header({required this.onSettings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Text('Screen Time Synopsis', style: AppTypography.displayBold(size: 24)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.settings_outlined, size: 26),
            color: SlideColors.darkText,
            onPressed: onSettings,
          ),
        ],
      ),
    );
  }
}

class _QuickStatsRow extends StatelessWidget {
  final UsageReport report;
  final String periodLabel;
  final bool useDaysHours;
  const _QuickStatsRow({required this.report, required this.periodLabel, required this.useDaysHours});

  String _formatHours(double hours) {
    if (useDaysHours) {
      final totalHours = hours.floor();
      final days = totalHours ~/ 24;
      final remainingHours = totalHours % 24;
      if (days == 0) return '${remainingHours}h';
      if (remainingHours == 0) return '${days}d';
      return '${days}d ${remainingHours}h';
    } else {
      final h = hours.floor();
      final m = ((hours - h) * 60).round();
      if (h == 0) return '${m}m';
      if (m == 0) return '${h}h';
      return '${h}h ${m}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BrainScoreCard(score: report.brainScore),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: periodLabel,
                value: _formatHours(report.totalHours),
                color: SlideColors.mint,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: 'Top Bad App',
                value: report.topBadApp?.appName.split(' ').first ?? '—',
                color: SlideColors.pink,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BrainScoreCard extends StatelessWidget {
  final double score;
  const _BrainScoreCard({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      decoration: BoxDecoration(
        color: SlideColors.periwinkle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BrainScore', style: AppTypography.label(size: 12)),
          Center(child: BrainScoreGauge(score: score, size: 180)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.label(size: 12)),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.displayBold(size: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _SynopsisCTA extends StatelessWidget {
  final VoidCallback onTap;
  const _SynopsisCTA({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR ${DateTime.now().year} SYNOPSIS',
                    style: AppTypography.body(
                      size: 13,
                      color: Colors.white70,
                      weight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'View Your\nReport',
                    style: AppTypography.displayBold(
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            StarburstShape(
              fillColor: SlideColors.yellow,
              borderColor: SlideColors.yellow,
              size: 60,
              points: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class _TopAppsSection extends StatefulWidget {
  final UsageReport? report;
  final bool useDaysHours;

  const _TopAppsSection({required this.report, required this.useDaysHours});

  @override
  State<_TopAppsSection> createState() => _TopAppsSectionState();
}

class _TopAppsSectionState extends State<_TopAppsSection> {
  bool _showAll = false;

  String _formatTime(Duration d) {
    if (widget.useDaysHours) {
      final h = d.inHours;
      final days = h ~/ 24;
      final remainingHours = h % 24;
      if (days == 0) return '${remainingHours}h';
      if (remainingHours == 0) return '${days}d';
      return '${days}d ${remainingHours}h';
    } else {
      final h = d.inHours;
      final m = d.inMinutes % 60;
      if (h == 0) return '${m}m';
      if (m == 0) return '${h}h';
      return '${h}h ${m}m';
    }
  }

  double _maxTimeWidth(List<dynamic> apps, TextStyle style) {
    var max = 0.0;
    for (final app in apps) {
      final tp = TextPainter(
        text: TextSpan(text: _formatTime(app.totalTime), style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      if (tp.width > max) max = tp.width;
    }
    return max + 4; // add small padding
  }

  Color _categoryColor(AppCategory category) => switch (category) {
    AppCategory.games  => const Color(0xFFFF6B6B),
    AppCategory.entertainment => const Color(0xFFFF6B6B),
    AppCategory.socialMedia => const Color(0xFFFF6B6B),
    AppCategory.shopping => const Color(0xFFFF6B6B),
    AppCategory.good => SlideColors.mint,
    AppCategory.neutral => const Color(0xFFDDDDDD),
  };

  @override
  Widget build(BuildContext context) {
    final report = widget.report;
    final timeStyle = AppTypography.label(size: 12);
    final allApps = report?.topApps ?? [];
    final visibleApps = allApps.take(_showAll ? 10 : 5).toList();
    final timeWidth = visibleApps.isEmpty ? 0.0 : _maxTimeWidth(visibleApps, timeStyle);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Apps', style: AppTypography.body(size: 16, weight: FontWeight.w700)),
        const SizedBox(height: 12),
        if (allApps.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('No data yet.', style: AppTypography.label(size: 13)),
          )
        else ...[
          ...visibleApps.asMap().entries.map((entry) {
            final i = entry.key;
            final app = entry.value;
            final fraction = report!.totalScreenTime.inMilliseconds > 0
                ? (app.totalTime.inMilliseconds / report.totalScreenTime.inMilliseconds).clamp(0.0, 1.0)
                : 0.0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      '${i + 1}',
                      style: AppTypography.label(size: 12, color: const Color(0xFF888888)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          app.appName,
                          style: AppTypography.body(size: 13, weight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: LinearProgressIndicator(
                            value: fraction,
                            minHeight: 10,
                            backgroundColor: Colors.black.withValues(alpha: 0.1),
                            valueColor: AlwaysStoppedAnimation<Color>(_categoryColor(app.category)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: timeWidth,
                    child: Text(
                      _formatTime(app.totalTime),
                      style: timeStyle,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }),
          if (allApps.length > 5)
            GestureDetector(
              onTap: () => setState(() => _showAll = !_showAll),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _showAll ? 'Show less' : 'Show more',
                  style: AppTypography.label(size: 13, color: const Color(0xFF555555)),
                ),
              ),
            ),
        ],
      ],
    );
  }
}

class _PeriodBreakdown extends StatelessWidget {
  final UsageReport report;
  final String periodLabel;
  final bool useDaysHours;
  const _PeriodBreakdown({required this.report, required this.periodLabel, required this.useDaysHours});

  String _fmt(double hours) {
    if (useDaysHours) {
      final totalHours = hours.floor();
      final days = totalHours ~/ 24;
      final remainingHours = totalHours % 24;
      if (days == 0) return '${remainingHours}h';
      if (remainingHours == 0) return '${days}d';
      return '${days}d ${remainingHours}h';
    } else {
      final h = hours.floor();
      final m = ((hours - h) * 60).round();
      return h > 0 ? '${h}h ${m}m' : '${m}m';
    }
  }

  double _maxTextWidth(List<String> texts, TextStyle style) {
    var max = 0.0;
    for (final text in texts) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      if (tp.width > max) max = tp.width;
    }
    return max + 4; // add small padding
  }

  @override
  Widget build(BuildContext context) {
    final total = report.totalHours;
    if (total == 0) return const SizedBox.shrink();

    final neutralHours = report.totalHours - report.badHours - report.goodHours;
    final labelStyle = AppTypography.label(size: 13);
    final timeStyle = AppTypography.label(size: 12);
    final labelWidth = _maxTextWidth(['Bad Apps', 'Good Apps', 'Neutral'], labelStyle);
    final timeWidth = _maxTextWidth([_fmt(report.badHours), _fmt(report.goodHours), _fmt(neutralHours)], timeStyle);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$periodLabel\'s Breakdown', style: AppTypography.body(size: 16, weight: FontWeight.w700)),
        const SizedBox(height: 12),
        _BreakdownBar(
          label: 'Bad Apps',
          hours: report.badHours,
          total: total,
          color: const Color(0xFFFF6B6B),
          labelWidth: labelWidth,
          timeWidth: timeWidth,
          useDaysHours: useDaysHours,
        ),
        const SizedBox(height: 8),
        _BreakdownBar(
          label: 'Good Apps',
          hours: report.goodHours,
          total: total,
          color: SlideColors.mint,
          labelWidth: labelWidth,
          timeWidth: timeWidth,
          useDaysHours: useDaysHours,
        ),
        const SizedBox(height: 8),
        _BreakdownBar(
          label: 'Neutral',
          hours: neutralHours,
          total: total,
          color: const Color(0xFFDDDDDD),
          labelWidth: labelWidth,
          timeWidth: timeWidth,
          useDaysHours: useDaysHours,
        ),
      ],
    );
  }
}

class _BreakdownBar extends StatelessWidget {
  final String label;
  final double hours;
  final double total;
  final Color color;
  final double labelWidth;
  final double timeWidth;
  final bool useDaysHours;

  const _BreakdownBar({
    required this.label,
    required this.hours,
    required this.total,
    required this.color,
    required this.labelWidth,
    required this.timeWidth,
    required this.useDaysHours,
  });

  String _formatDaysHours(int totalHours) {
    final days = totalHours ~/ 24;
    final remainingHours = totalHours % 24;
    if (days == 0) return '${remainingHours}h';
    if (remainingHours == 0) return '${days}d';
    return '${days}d ${remainingHours}h';
  }

  @override
  Widget build(BuildContext context) {
    final fraction = total > 0 ? (hours / total).clamp(0.0, 1.0) : 0.0;
    final h = hours.floor();
    final timeStr = useDaysHours
        ? _formatDaysHours(h)
        : (h > 0 ? '${h}h ${(((hours - h) * 60).round())}m' : '${(((hours - h) * 60).round())}m');

    return Row(
      children: [
        SizedBox(width: labelWidth, child: Text(label, style: AppTypography.label(size: 13))),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 10,
              backgroundColor: Colors.black.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: timeWidth,
          child: Text(
            timeStr,
            style: AppTypography.label(size: 12),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
