// Factual activity comparison data for each reporting period.
// All time estimates are evidence-based approximations.
class ActivityComparison {
  final String icon;
  final String description;

  const ActivityComparison({required this.icon, required this.description});
}

class ActivityComparisons {
  // ~9 hours (daily bad-app usage)
  static const List<ActivityComparison> daily = [
    ActivityComparison(icon: '🗣️', description: 'Learned the basics of a new language'),
    ActivityComparison(icon: '📖', description: 'Read an entire novel'),
    ActivityComparison(icon: '🥾', description: 'Hiked 20 miles of trail'),
  ];

  // ~63 hours (weekly bad-app usage)
  static const List<ActivityComparison> weekly = [
    ActivityComparison(icon: '🍳', description: 'Mastered a new recipe and cooked it for friends'),
    ActivityComparison(icon: '📺', description: 'Watched all of Adventure Time (~61 hours)'),
    ActivityComparison(icon: '🩺', description: 'Became CPR and First-Aid certified'),
  ];

  // ~252 hours (monthly bad-app usage)
  static const List<ActivityComparison> monthly = [
    ActivityComparison(icon: '🎸', description: 'Learned to play a new instrument'),
    ActivityComparison(icon: '✍️', description: 'Written your own novel (NaNoWriMo pace)'),
    ActivityComparison(icon: '🤝', description: 'Made 5 new close friends'),
  ];

  // ~3,023 hours (yearly bad-app usage)
  static const List<ActivityComparison> yearly = [
    ActivityComparison(icon: '🚣', description: 'Crossed the Atlantic solo by rowboat'),
    ActivityComparison(icon: '📚', description: 'Read over 400 novels'),
    ActivityComparison(icon: '🌍', description: 'Learned 5 new languages to conversational level'),
  ];

  // Lifetime projections
  static const List<ActivityComparison> lifetime = [
    ActivityComparison(icon: '💼', description: 'Built a business and became a millionaire'),
    ActivityComparison(icon: '📗', description: 'Read over 28,000 books'),
    ActivityComparison(icon: '🎓', description: 'Earned 41 college degrees'),
  ];
}
