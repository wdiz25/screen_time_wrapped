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
import 'dart:async';

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
    Timer.periodic(Duration(seconds: 8), (Timer timer) {
      if (_pageController.positions.isNotEmpty) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildSlides(UsageDataProvider data) {
    final previousMonth = data.previousMonth;
    final death = data.deathReport;

    // Calculate Number of Days in Month
    final numDays = previousMonth?.periodEnd.difference(previousMonth.periodStart).inDays ?? 30.0;

    // Averages Data from Previous Month
    final monthlyHours = previousMonth?.totalHours ?? 0.0;
    final dailyHours = monthlyHours / numDays;
    final weeklyHours = dailyHours * 7;
    final yearlyHours = dailyHours * 365;

    final wakingPercent = dailyHours > 0
        ? (dailyHours / 16.0 * 100).round()
        : 0;
    final weeklyDays = (weeklyHours / 24.0);
    final monthlyDays = (monthlyHours / 24.0);
    final yearlyDays = (yearlyHours / 24.0);

    final dailyActivities = ActivityComparisons.daily
        .where((a) => a.hours <= dailyHours)
        .toList();
    final weeklyActivities = ActivityComparisons.weekly
        .where((a) => a.hours <= weeklyHours)
        .toList();
    final monthlyActivities = ActivityComparisons.monthly
        .where((a) => a.hours <= monthlyHours)
        .toList();
    final yearlyActivities = ActivityComparisons.yearly
        .where((a) => a.hours <= yearlyHours)
        .toList();
    dailyActivities.shuffle();
    weeklyActivities.shuffle();
    monthlyActivities.shuffle();
    yearlyActivities.shuffle();

    return [
      // 1 — Splash
      const S01SplashSlide(),

      // 2 — Daily Usage
      UsageSlide(
        backgroundColor: SlideColors.yellow,
        periodLabel: 'Your average daily usage was',
        hours: dailyHours,
        contextLine: wakingPercent > 50 ? 'OVER HALF' : '$wakingPercent%',
        contextSuffix: 'of your waking day spent on your phone.',
        shapeColor1: SlideColors.pink,
        shapeColor2: SlideColors.mint,
      ),

      // 3 — Daily Opportunity
      OpportunitySlide(
        backgroundColor: SlideColors.periwinkle,
        periodHeader: 'IN THAT TIME,\nYOU COULD HAVE...',
        periodFooter: '...EVERY DAY.',
        activities: dailyActivities.take(3).toList(),
        shapeColor1: SlideColors.pink,
        shapeColor2: SlideColors.yellow,
      ),

      // 4 — Weekly Usage
      UsageSlide(
        backgroundColor: SlideColors.mint,
        periodLabel: 'Your average weekly usage was',
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
        activities: weeklyActivities.take(3).toList(),
        shapeColor1: SlideColors.yellow,
        shapeColor2: SlideColors.mint,
      ),

      // 6 — Monthly Usage
      UsageSlide(
        backgroundColor: SlideColors.periwinkle,
        periodLabel: 'Your monthly usage was',
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
        activities: monthlyActivities.take(3).toList(),
        shapeColor1: SlideColors.pink,
        shapeColor2: SlideColors.periwinkle,
      ),

      // 8 — Yearly Usage
      UsageSlide(
        backgroundColor: SlideColors.mint,
        periodLabel: 'At this rate,\n your yearly usage would be',
        hours: yearlyHours,
        contextLine: 'over ${yearlyDays.round()} DAYS',
        contextSuffix: 'spent on your phone.',
        shapeColor1: SlideColors.yellow,
        shapeColor2: SlideColors.periwinkle,
      ),

      // 9 — Yearly Opportunity
      OpportunitySlide(
        backgroundColor: SlideColors.pink,
        periodHeader: 'IN ONE YEAR,\nYOU COULD...',
        periodFooter: null,
        activities: yearlyActivities.take(3).toList(),
        shapeColor1: SlideColors.periwinkle,
        shapeColor2: SlideColors.yellow,
      ),

      // 10 — BrainScore
      if (previousMonth != null)
        S10BrainScoreSlide(report: previousMonth)
      else
        const ColoredBox(color: SlideColors.yellow),

      // 11 — Top Bad App
      if (previousMonth != null)
        S11TopBadAppSlide(report: previousMonth)
      else
        const ColoredBox(color: SlideColors.periwinkle),

      // 12 — Top Good App
      if (previousMonth != null)
        S12TopGoodAppSlide(report: previousMonth)
      else
        const ColoredBox(color: SlideColors.mint),

      // 13 — Death Report
      S13DeathReportSlide(deathReport: death),

      // 14 — Lifetime Opportunity
      S14LifetimeOpportunitySlide(deathReport: death),

      // 15 — Animal Reveal
      if (previousMonth != null)
        S15AnimalSlide(report: previousMonth)
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
                top: MediaQuery.of(context).padding.top + 16,
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
                top: MediaQuery.of(context).padding.top + 4,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: slides.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 6,
                      dotWidth: MediaQuery.of(context).size.width / 22,
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
