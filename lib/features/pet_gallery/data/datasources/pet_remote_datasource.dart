import 'package:dio/dio.dart';
import 'package:kt9/features/pet_gallery/data/models/pet_model.dart';

class PetRemoteDataSource {
  final Dio dio;
  final List<PetModel> _mockPets = [
    const PetModel(
      id: '1',
      name: 'Buddy',
      imageUrl: 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=400',
      type: 'Dog',
      breed: 'Golden Retriever',
      age: 3,
    ),
    const PetModel(
      id: '2',
      name: 'Whiskers',
      imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400',
      type: 'Cat',
      breed: 'Persian',
      age: 2,
    ),
    const PetModel(
      id: '3',
      name: 'Max',
      imageUrl: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=400',
      type: 'Dog',
      breed: 'German Shepherd',
      age: 5,
    ),
    const PetModel(
      id: '4',
      name: 'Luna',
      imageUrl: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?w=400',
      type: 'Cat',
      breed: 'Siamese',
      age: 1,
    ),
    const PetModel(
      id: '5',
      name: 'Charlie',
      imageUrl: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=400',
      type: 'Dog',
      breed: 'Labrador',
      age: 4,
    ),
    const PetModel(
      id: '6',
      name: 'Mittens',
      imageUrl: 'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?w=400',
      type: 'Cat',
      breed: 'Maine Coon',
      age: 3,
    ),
    const PetModel(
      id: '7',
      name: 'Rocky',
      imageUrl: 'https://images.unsplash.com/photo-1558788353-f76d92427f16?w=400',
      type: 'Dog',
      breed: 'Bulldog',
      age: 6,
    ),
    const PetModel(
      id: '8',
      name: 'Shadow',
      imageUrl: 'https://images.unsplash.com/photo-1561948955-570b270e7c36?w=400',
      type: 'Cat',
      breed: 'British Shorthair',
      age: 2,
    ),
  ];

  PetRemoteDataSource(this.dio);

  Future<List<PetModel>> getPets() async {
    // Симуляция сетевого запроса
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockPets;
  }

  Future<PetModel> toggleFavorite(String petId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final index = _mockPets.indexWhere((pet) => pet.id == petId);
    if (index != -1) {
      final pet = _mockPets[index];
      final updatedPet = PetModel(
        id: pet.id,
        name: pet.name,
        imageUrl: pet.imageUrl,
        type: pet.type,
        breed: pet.breed,
        age: pet.age,
        isFavorite: !pet.isFavorite,
      );
      _mockPets[index] = updatedPet;
      return updatedPet;
    }
    throw Exception('Pet not found');
  }
}
