import 'dart:math';
import '../models/death_report.dart';
import '../models/user_profile.dart';
import '../constants/app_constants.dart';

class DeathReportService {
  DeathReport compute({
    required double dailyBadHours,
    required UserProfile profile,
  }) {
    final age = profile.age;
    final remainingYears = max(0, AppConstants.lifespanYears - age);
    final lifetimeBadHours = dailyBadHours * 365.0 * remainingYears;

    final books = lifetimeBadHours / AppConstants.hoursPerBook;
    final marathons = lifetimeBadHours / AppConstants.hoursPerMarathon;
    final skills = lifetimeBadHours / AppConstants.hoursPerSkillMastery;
    final friends = lifetimeBadHours / AppConstants.hoursPerFriendship;
    final wealth = _futureValue(
      weeklyDeposit: profile.hourlyRate * dailyBadHours * 7.0,
      annualRate: AppConstants.annualReturnRate,
      years: remainingYears.toDouble(),
    );

    return DeathReport(
      dailyBadHours: dailyBadHours,
      remainingYears: remainingYears,
      lifetimeBadHours: lifetimeBadHours,
      booksCouldHaveRead: books,
      marathonsCouldHaveRun: marathons,
      skillsCouldHaveMastered: skills,
      friendsCouldHaveMade: friends,
      wealthCouldHaveBuilt: wealth,
    );
  }

  // Future value of weekly annuity: FV = PMT * [((1+r)^n - 1) / r]
  double _futureValue({
    required double weeklyDeposit,
    required double annualRate,
    required double years,
  }) {
    if (weeklyDeposit <= 0 || years <= 0) return 0;
    final weeklyRate = annualRate / 52.0;
    final n = years * 52.0;
    return weeklyDeposit * ((pow(1 + weeklyRate, n) - 1) / weeklyRate);
  }
}
