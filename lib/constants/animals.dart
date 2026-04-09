class AppAnimal {
  final String emoji;
  final String name;
  final String trait;
  const AppAnimal(this.emoji, this.name, this.trait);
}

const appAnimals = [
  AppAnimal('🧟', 'Zombie',   'Mindless. But fixable.'),
  AppAnimal('🦝', 'Raccoon',  'Impulsive and easily distracted.'),
  AppAnimal('🦥', 'Sloth',    'Passive and slow to change.'),
  AppAnimal('🐬', 'Dolphin',  'Intelligent, mostly curious.'),
  AppAnimal('🦅', 'Eagle',    'Sharp, focused, and intentional.'),
];

AppAnimal animalForScore(double score) {
  if (score >= 80) return appAnimals[4]; // Eagle
  if (score >= 60) return appAnimals[3]; // Dolphin
  if (score >= 40) return appAnimals[2]; // Sloth
  if (score >= 20) return appAnimals[1]; // Raccoon
  return appAnimals[0];                  // Zombie
}
