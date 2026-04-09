class UserProfile {
  final int birthYear;
  final double hourlyRate;

  const UserProfile({
    required this.birthYear,
    required this.hourlyRate,
  });

  int get age => DateTime.now().year - birthYear;

  UserProfile copyWith({int? birthYear, double? hourlyRate}) {
    return UserProfile(
      birthYear: birthYear ?? this.birthYear,
      hourlyRate: hourlyRate ?? this.hourlyRate,
    );
  }

  Map<String, dynamic> toJson() => {
    'birthYear': birthYear,
    'hourlyRate': hourlyRate,
  };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    birthYear: json['birthYear'] as int,
    hourlyRate: (json['hourlyRate'] as num).toDouble(),
  );
}
