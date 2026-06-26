class PlayerProfile {
  final String name;
  final String gender;

  final int level;
  final int experience;

  final int gold;
  final int reputation;

  final int energy;
  final int currentDay;

  final int workshopLevel;

  final List<String> inventory;

  const PlayerProfile({
    required this.name,
    required this.gender,
    this.level = 1,
    this.experience = 0,
    this.gold = 100,
    this.reputation = 0,
    this.energy = 100,
    this.currentDay = 1,
    this.workshopLevel = 1,
    this.inventory = const [],
  });

  PlayerProfile copyWith({
    String? name,
    String? gender,
    int? level,
    int? experience,
    int? gold,
    int? reputation,
    int? energy,
    int? currentDay,
    int? workshopLevel,
    List<String>? inventory,
  }) {
    return PlayerProfile(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      gold: gold ?? this.gold,
      reputation: reputation ?? this.reputation,
      energy: energy ?? this.energy,
      currentDay: currentDay ?? this.currentDay,
      workshopLevel: workshopLevel ?? this.workshopLevel,
      inventory: inventory ?? this.inventory,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'level': level,
      'experience': experience,
      'gold': gold,
      'reputation': reputation,
      'energy': energy,
      'currentDay': currentDay,
      'workshopLevel': workshopLevel,
      'inventory': inventory,
    };
  }

  factory PlayerProfile.fromJson(Map<String, dynamic> json) {
    return PlayerProfile(
      name: json['name'] ?? '',
      gender: json['gender'] ?? 'Male',
      level: json['level'] ?? 1,
      experience: json['experience'] ?? 0,
      gold: json['gold'] ?? 100,
      reputation: json['reputation'] ?? 0,
      energy: json['energy'] ?? 100,
      currentDay: json['currentDay'] ?? 1,
      workshopLevel: json['workshopLevel'] ?? 1,
      inventory: List<String>.from(json['inventory'] ?? []),
    );
  }
}