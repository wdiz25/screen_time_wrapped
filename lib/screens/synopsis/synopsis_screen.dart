import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../providers/usage_data_provider.dart';
import '../../constants/theme/slide_colors.dart';
import '../../constants/activity_comparisons.dart';
import 'slides/s01_splash_slide.dart';
import 'slides/usage_slide.dart';
import 'slides/opportunity_slide.dart';
import 'slides/s10_brain_score_slide.dart';
import 'slides/s11_top_bad_app_slide.dart';
import 'slides/s12_top_good_app_slide.dart';
import 'slides/s13_death_report_slide.dart';
import 'slides/s14_lifetime_opportunity_slide.dart';
import 'slides/s15_animal_slide.dart';

class SynopsisScreen extends StatefulWidget {
  const SynopsisScreen({super.key});

  @override
  State<SynopsisScreen> createState() => _SynopsisScreenState();
}

class _SynopsisScreenState extends State<SynopsisScreen> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<UsageDataProvider>();
      if (provider.state == LoadState.idle ||
          provider.state == LoadState.error) {
        provider.loadAll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildSlides(UsageDataProvider data) {
    final daily = data.daily;
    final weekly = data.weekly;
    final monthly = data.monthly;
    final yearly = data.yearly;
    final death = data.deathReport;

    final dailyHours = daily?.totalHours ?? 0.0;
    final weeklyHours = weekly?.totalHours ?? 0.0;
    final monthlyHours = monthly?.totalHours ?? 0.0;
    final yearlyHours = yearly?.totalHours ?? 0.0;

    final wakingPercent = dailyHours > 0
        ? (dailyHours / 16.0 * 100).round()
        : 0;
    final weeklyDays = (weeklyHours / 24.0);
    final monthlyDays = (monthlyHours / 24.0);
    final yearlyDays = (yearlyHours / 24.0);

    return [
      // 1 — Splash
      const S01SplashSlide(),

      // 2 — Daily Usage
      UsageSlide(
        backgroundColor: SlideColors.yellow,
        periodLabel: 'daily',
        hours: dailyHours,
        contextLine: wakingPercent > 50 ? 'OVER HALF' : '$wakingPercent%',
        contextSuffix: 'your waking day spent on your phone.',
        shapeColor1: SlideColors.pink,
        shapeColor2: SlideColors.mint,
      ),

      // 3 — Daily Opportunity
      OpportunitySlide(
        backgroundColor: SlideColors.periwinkle,
        periodHeader: 'IN THAT TIME,\nYOU COULD HAVE...',
        periodFooter: '...EVERY DAY.',
        activities: ActivityComparisons.daily,
        shapeColor1: SlideColors.pink,
        shapeColor2: SlideColors.yellow,
      ),

      // 4 — Weekly Usage
      UsageSlide(
        backgroundColor: SlideColors.mint,
        periodLabel: 'weekly',
        hours: weeklyHours,
        contextLine: 'over ${weeklyDays.toStringAsFixed(1)} DAYS',
        contextSuffix: 'spent on your phone.',
        shapeColor1: SlideColors.periwinkle,
        shapeColor2: SlideColors.pink,
      ),

      // 5 — Weekly Opportunity
      OpportunitySlide(
        backgroundColor: SlideColors.pink,
        periodHeader: 'IN ONE WEEK,\nYOU COULD HAVE...',
        periodFooter: null,
        activities: ActivityComparisons.weekly,
        shapeColor1: SlideColors.yellow,
        shapeColor2: SlideColors.mint,
      ),

      // 6 — Monthly Usage
      UsageSlide(
        backgroundColor: SlideColors.periwinkle,
        periodLabel: 'monthly',
        hours: monthlyHours,
        contextLine: 'over ${monthlyDays.toStringAsFixed(1)} DAYS',
        contextSuffix: 'spent on your phone.',
        shapeColor1: SlideColors.mint,
        shapeColor2: SlideColors.yellow,
      ),

      // 7 — Monthly Opportunity
      OpportunitySlide(
        backgroundColor: SlideColors.yellow,
        periodHeader: 'IN ONE MONTH,\nYOU COULD HAVE...',
        periodFooter: null,
        activities: ActivityComparisons.monthly,
        shapeColor1: SlideColors.pink,
        shapeColor2: SlideColors.periwinkle,
      ),

      // 8 — Yearly Usage
      UsageSlide(
        backgroundColor: SlideColors.mint,
        periodLabel: 'yearly',
        hours: yearlyHours,
        contextLine: 'over ${yearlyDays.round()} DAYS',
        contextSuffix: 'spent on your phone.',
        shapeColor1: SlideColors.yellow,
        shapeColor2: SlideColors.periwinkle,
      ),

      // 9 — Yearly Opportunity
      OpportunitySlide(
        backgroundColor: SlideColors.pink,
        periodHeader: 'IN ONE YEAR,\nYOU COULD HAVE...',
        periodFooter: null,
        activities: ActivityComparisons.yearly,
        shapeColor1: SlideColors.periwinkle,
        shapeColor2: SlideColors.yellow,
      ),

      // 10 — BrainScore
      if (yearly != null)
        S10BrainScoreSlide(report: yearly)
      else
        const ColoredBox(color: SlideColors.yellow),

      // 11 — Top Bad App
      if (yearly != null)
        S11TopBadAppSlide(report: yearly)
      else
        const ColoredBox(color: SlideColors.periwinkle),

      // 12 — Top Good App
      if (yearly != null)
        S12TopGoodAppSlide(report: yearly)
      else
        const ColoredBox(color: SlideColors.mint),

      // 13 — Death Report
      S13DeathReportSlide(deathReport: death),

      // 14 — Lifetime Opportunity
      S14LifetimeOpportunitySlide(deathReport: death),

      // 15 — Animal Reveal
      if (yearly != null)
        S15AnimalSlide(report: yearly)
      else
        const ColoredBox(color: SlideColors.mint),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UsageDataProvider>(
        builder: (context, data, _) {
          if (data.isLoading) {
            return const Scaffold(
              backgroundColor: SlideColors.yellow,
              body: Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
          }

          final slides = _buildSlides(data);

          return Stack(
            children: [
              PageView(controller: _pageController, children: slides),
              // Close button
              Positioned(
                top: MediaQuery.of(context).padding.top + 12,
                right: 16,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
              // Page indicator dots
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: slides.length,
                    effect: const ScrollingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotScale: 1.4,
                      spacing: 5,
                      dotColor: Colors.white38,
                      activeDotColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
