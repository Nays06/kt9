// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) => PetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      type: json['type'] as String,
      breed: json['breed'] as String,
      age: (json['age'] as num).toInt(),
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'type': instance.type,
      'breed': instance.breed,
      'age': instance.age,
      'is_favorite': instance.isFavorite,
    };
