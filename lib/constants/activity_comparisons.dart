// Factual activity comparison data for each reporting period.
// All time estimates are evidence-based approximations.
class ActivityComparison {
  final String icon;
  final String description;
  final double hours;

  const ActivityComparison({required this.icon, required this.description, required this.hours});
}

class ActivityComparisons {
  // Daily Activity Comparisons
  static const List<ActivityComparison> daily = [
    ActivityComparison(icon: '🏓', description: 'Played 3 games of pickleball', hours: 0.75),
    ActivityComparison(icon: '🧩', description: 'Solved a crossword puzzle', hours: 1.0),
    ActivityComparison(icon: '🍎', description: 'Made and canned a batch of applesauce', hours: 2.0),
    ActivityComparison(icon: '👵', description: 'Visited your grandparents', hours: 2.0),
    ActivityComparison(icon: '🏃', description: 'Gone for a training run', hours: 2.0),
    ActivityComparison(icon: '🥏', description: 'Played a round of disc golf', hours: 2.0),
    ActivityComparison(icon: '🌱', description: 'Tended your garden', hours: 3.0),
    ActivityComparison(icon: '📖', description: 'Read an entire book', hours: 7.0),
    ActivityComparison(icon: '🌍', description: 'Learned the basics of a new language', hours: 9.0),
    ActivityComparison(icon: '🚶', description: 'Hiked 20 miles', hours: 9.0),
    ActivityComparison(icon: '🧣', description: 'Crocheted a scarf', hours: 12.0),
    ActivityComparison(icon: '🏕️', description: 'Gone on a camping trip', hours: 24.0),
  ];

  // Weekly Activity Comparisons
  static const List<ActivityComparison> weekly = [
    ActivityComparison(icon: '🍞', description: 'Baked a loaf of sourdough bread', hours: 2.0),
    ActivityComparison(icon: '👵', description: 'Visited your grandparents', hours: 2.0),
    ActivityComparison(icon: '🌱', description: 'Tended your garden', hours: 3.0),
    ActivityComparison(icon: '🐝', description: 'Kept up your beekeeping', hours: 3.0),
    ActivityComparison(icon: '🧑‍🍳', description: 'Learned a new recipe and made it for friends', hours: 10.0),
    ActivityComparison(icon: '🧣', description: 'Crocheted a scarf', hours: 12.0),
    ActivityComparison(icon: '🩹', description: 'Became CPR and First-Aid certified', hours: 16.0),
    ActivityComparison(icon: '🏕️', description: 'Gone on a camping trip', hours: 24.0),
    ActivityComparison(icon: '📺', description: 'Binge-watched all of Adventure Time', hours: 52.0)
  ];

  // Monthly Activity Comparisons
  static const List<ActivityComparison> monthly = [
    ActivityComparison(icon: '📖', description: 'Read 5 books', hours: 35.0),
    ActivityComparison(icon: '🏃', description: 'Completed a 5K training program', hours: 40.0),
    ActivityComparison(icon: '🪡', description: 'Sewed your first garment', hours: 50.0),
    ActivityComparison(icon: '🎸', description: 'Learned to play 10 songs on an instrument', hours: 100.0),
    ActivityComparison(icon: '🧶', description: 'Crocheted an entire blanket', hours: 120.0),
    ActivityComparison(icon: '✍️', description: 'Wrote your own novel', hours: 240.0),
    ActivityComparison(icon: '🎷', description: 'Learned a new instrument to basic proficiency', hours: 250.0),
    ActivityComparison(icon: '🍽️', description: 'Washed over 30,000 dishes', hours: 252.0),
    ActivityComparison(icon: '🤝', description: 'Made 5 new close friends', hours: 450.0),
  ];

  // Yearly Activity Comparisons
  static const List<ActivityComparison> yearly = [
    ActivityComparison(icon: '🏃', description: 'Train for and run a marathon', hours: 500.0),
    ActivityComparison(icon: '🌍', description: 'Learn a new language to conversational level', hours: 600.0),
    ActivityComparison(icon: '🎹', description: 'Learn to play a musical instrument', hours: 1000.0),
    ActivityComparison(icon: '📚', description: 'Read over 400 novels', hours: 2800.0),
    ActivityComparison(icon: '🚣', description: 'Cross the Atlantic solo by rowboat', hours: 3000.0),
    ActivityComparison(icon: '🌍', description: 'Learn 5 new languages to conversational level', hours: 3000.0),
    ActivityComparison(icon: '👩‍🎓', description: 'Complete a 4-year college degree', hours: 4860.0),
  ];

  // Lifetime projections
  static const List<ActivityComparison> lifetime = [
    ActivityComparison(icon: '💼', description: 'Built a business and became a millionaire', hours: double.infinity),
    ActivityComparison(icon: '📗', description: 'Read over 20,000 books', hours: double.infinity),
    ActivityComparison(icon: '🎓', description: 'Earned 30+ college degrees', hours: double.infinity),
  ];
}
