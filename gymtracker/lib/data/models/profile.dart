class Profile {
  final int id;
  final String name;
  final int age;

  Profile({required this.id, required this.name, required this.age});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, age: $age}';
  }
}
