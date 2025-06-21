import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';
import 'package:kt9/features/pet_gallery/domain/repositories/pet_repository.dart';

class GetPetsUseCase {
  final PetRepository repository;

  GetPetsUseCase(this.repository);

  Future<List<Pet>> call() async {
    return await repository.getPets();
  }

  Future<List<Pet>> getFavorites() async {
    return await repository.getFavorites();
  }

  Future<List<Pet>> getPetsByType(String type) async {
    return await repository.getPetsByType(type);
  }
}
