class AppAnimal {
  final String emoji;
  final String name;
  final String trait;
  const AppAnimal(this.emoji, this.name, this.trait);
}

const appAnimals = [
  AppAnimal('🦥', 'Sloth',    'Passive and slow to change.'),
  AppAnimal('🐼', 'Panda',    'Cute, but not very productive.'),
  AppAnimal('🐱', 'Cat',      'Independent, but easily distracted.'),
  AppAnimal('🐶', 'Dog',      'Loyal, but needs constant attention.'),
  AppAnimal('🐬', 'Dolphin',  'Intelligent, mostly curious.'),
  AppAnimal('🦅', 'Eagle',    'Sharp, focused, and intentional.'),
  AppAnimal('🐆', 'Cheetah',  'Fast, efficient, and goal-oriented.'),
];

AppAnimal animalForScore(double score) {
  if (score > 90) return appAnimals[6]; // Cheetah
  if (score > 75) return appAnimals[5]; // Eagle
  if (score > 60) return appAnimals[4]; // Dolphin
  if (score > 45) return appAnimals[3]; // Dog
  if (score > 30) return appAnimals[2]; // Cat
  if (score > 15) return appAnimals[1]; // Panda
  return appAnimals[0];                 // Sloth
}
