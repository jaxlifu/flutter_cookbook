class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  factory Dog.fromMap(Map<String, dynamic> map) => Dog(
        id: map['id'],
        name: map['name'],
        age: map['age'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
