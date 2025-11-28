class Profile {
  final int? id;
  final String name;
  final double weightGoal;

  Profile({this.id, required this.name, required this.weightGoal});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'weightGoal': weightGoal};
  }

  factory Profile.fromMap(Map<String, Object?> map) {
    return Profile(
      id: map['id'] as int?,
      name: map['name'] as String,
      weightGoal: (map['weightGoal'] as num).toDouble(),
    );
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, weightGoal: $weightGoal}';
  }
}
