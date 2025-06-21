import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';
import 'package:kt9/features/pet_gallery/domain/repositories/pet_repository.dart';

class ToggleFavoriteUseCase {
  final PetRepository repository;

  ToggleFavoriteUseCase(this.repository);

  Future<Pet> call(String petId) async {
    return await repository.toggleFavorite(petId);
  }
}
