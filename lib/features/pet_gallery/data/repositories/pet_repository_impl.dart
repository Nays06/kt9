import 'package:kt9/features/pet_gallery/data/datasources/pet_remote_datasource.dart';
import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';
import 'package:kt9/features/pet_gallery/domain/repositories/pet_repository.dart';

class PetRepositoryImpl implements PetRepository {
  final PetRemoteDataSource remoteDataSource;

  PetRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Pet>> getPets() async {
    final petModels = await remoteDataSource.getPets();
    return petModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Pet> toggleFavorite(String petId) async {
    final petModel = await remoteDataSource.toggleFavorite(petId);
    return petModel.toEntity();
  }

  @override
  Future<List<Pet>> getFavorites() async {
    final allPets = await getPets();
    return allPets.where((pet) => pet.isFavorite).toList();
  }

  @override
  Future<List<Pet>> getPetsByType(String type) async {
    final allPets = await getPets();
    return allPets.where((pet) => pet.type.toLowerCase() == type.toLowerCase()).toList();
  }
}
