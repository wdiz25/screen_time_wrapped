class DeathReport {
  final double dailyBadHours;
  final int remainingYears;
  final double lifetimeBadHours;

  // Opportunity costs
  final double booksCouldHaveRead;
  final double marathonsCouldHaveRun;
  final double skillsCouldHaveMastered;
  final double friendsCouldHaveMade;
  final double wealthCouldHaveBuilt;

  const DeathReport({
    required this.dailyBadHours,
    required this.remainingYears,
    required this.lifetimeBadHours,
    required this.booksCouldHaveRead,
    required this.marathonsCouldHaveRun,
    required this.skillsCouldHaveMastered,
    required this.friendsCouldHaveMade,
    required this.wealthCouldHaveBuilt,
  });

  double get lifetimeDays => lifetimeBadHours / 24.0;
  double get lifetimeYears => lifetimeDays / 365.0;
}
