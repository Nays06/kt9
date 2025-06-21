import 'package:json_annotation/json_annotation.dart';
import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel {
  final String id;
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final String type;
  final String breed;
  final int age;
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;

  const PetModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.breed,
    required this.age,
    this.isFavorite = false,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) => _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);

  Pet toEntity() {
    return Pet(
      id: id,
      name: name,
      imageUrl: imageUrl,
      type: type,
      breed: breed,
      age: age,
      isFavorite: isFavorite,
    );
  }

  factory PetModel.fromEntity(Pet pet) {
    return PetModel(
      id: pet.id,
      name: pet.name,
      imageUrl: pet.imageUrl,
      type: pet.type,
      breed: pet.breed,
      age: pet.age,
      isFavorite: pet.isFavorite,
    );
  }
}
