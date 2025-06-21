class Pet {
  final String id;
  final String name;
  final String imageUrl;
  final String type;
  final String breed;
  final int age;
  final bool isFavorite;

  const Pet({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.breed,
    required this.age,
    this.isFavorite = false,
  });

  Pet copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? type,
    String? breed,
    int? age,
    bool? isFavorite,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
