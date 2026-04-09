// App-level constants for the extrapolation engine and reporting
class AppConstants {
  static const int lifespanYears = 80;
  static const int wakingHoursPerDay = 16;

  // Opportunity cost conversion factors
  static const double hoursPerBook = 5.0;
  static const double hoursPerMarathon = 4.5;
  static const double hoursPerSkillMastery = 10000.0;
  static const double hoursPerFriendship = 90.0;

  // Wealth calculation
  static const double annualReturnRate = 0.06;
  static const double defaultHourlyRate = 35.0;

  // BrainScore tiers
  static const double brainScoreGood = 70.0;
  static const double brainScoreNeutral = 40.0;

  // BrainScore weighting
  static const double brainScoreGoodWeight = 1.25;
  static const double brainScoreBadWeight = 0.9;
  static const double brainScoreBadWeightSocialMedia = 1.4;
  static const double brainScoreBadWeightGames = 1.2;
  static const double brainScoreBadWeightShopping = 1.0;
  static const double brainScoreBadWeightEntertainment = 0.8;
  static const double brainScoreNeutralBoostWeight = 0.15;
}
