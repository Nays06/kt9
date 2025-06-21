import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';

abstract class PetRepository {
  Future<List<Pet>> getPets();
  Future<Pet> toggleFavorite(String petId);
  Future<List<Pet>> getFavorites();
  Future<List<Pet>> getPetsByType(String type);
}
