import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:kt9/app/di/app_scope.dart';
import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';
import 'package:kt9/features/pet_gallery/domain/usecases/get_pets_usecase.dart';
import 'package:kt9/features/pet_gallery/domain/usecases/toggle_favorite_usecase.dart';
import 'package:kt9/features/pet_gallery/presentation/pet_gallery_screen.dart';

enum FilterType { all, dogs, cats, favorites }

PetGalleryWM defaultWidgetModelFactory(BuildContext context) {
  final appScope = AppScope.of(context);
  return PetGalleryWM(
    appScope.getPetsUseCase,
    appScope.toggleFavoriteUseCase,
  );
}

class PetGalleryWM extends WidgetModel<PetGalleryScreen, void> {
  final GetPetsUseCase _getPetsUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  late final EntityStateNotifier<List<Pet>> _petsState;
  late final ValueNotifier<FilterType> _selectedFilter;

  List<Pet> _allPets = [];

  EntityStateNotifier<List<Pet>> get petsState => _petsState;
  ValueNotifier<FilterType> get selectedFilter => _selectedFilter;

  PetGalleryWM(this._getPetsUseCase, this._toggleFavoriteUseCase);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _petsState = EntityStateNotifier<List<Pet>>();
    _selectedFilter = ValueNotifier<FilterType>(FilterType.all);
    
    _selectedFilter.addListener(_onFilterChanged);
    _loadPets();
  }

  @override
  void dispose() {
    _petsState.dispose();
    _selectedFilter.dispose();
    super.dispose();
  }

  Future<void> _loadPets() async {
    try {
      _petsState.loading();
      final pets = await _getPetsUseCase();
      _allPets = pets;
      _applyFilter();
    } catch (error) {
      _petsState.error(error);
    }
  }

  void _onFilterChanged() {
    _applyFilter();
  }

  void _applyFilter() {
    List<Pet> filteredPets;
    
    switch (_selectedFilter.value) {
      case FilterType.all:
        filteredPets = _allPets;
        break;
      case FilterType.dogs:
        filteredPets = _allPets.where((pet) => pet.type.toLowerCase() == 'dog').toList();
        break;
      case FilterType.cats:
        filteredPets = _allPets.where((pet) => pet.type.toLowerCase() == 'cat').toList();
        break;
      case FilterType.favorites:
        filteredPets = _allPets.where((pet) => pet.isFavorite).toList();
        break;
    }
    
    _petsState.content(filteredPets);
  }

  void setFilter(FilterType filter) {
    _selectedFilter.value = filter;
  }

  Future<void> toggleFavorite(String petId) async {
    try {
      final updatedPet = await _toggleFavoriteUseCase(petId);
      final index = _allPets.indexWhere((pet) => pet.id == petId);
      if (index != -1) {
        _allPets[index] = updatedPet;
        _applyFilter();
      }
    } catch (error) {
      // Можно показать снекбар с ошибкой
      debugPrint('Error toggling favorite: $error');
    }
  }

  Future<void> refreshPets() async {
    await _loadPets();
  }
}
