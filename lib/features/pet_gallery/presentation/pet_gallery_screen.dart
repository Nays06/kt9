import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:kt9/features/pet_gallery/presentation/pet_gallery_wm.dart';
import 'package:kt9/features/pet_gallery/presentation/widgets/pet_card.dart';
import 'package:kt9/features/pet_gallery/presentation/widgets/filter_chip_widget.dart';
import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';

class PetGalleryScreen extends ElementaryWidget<PetGalleryWM> {
  const PetGalleryScreen({super.key}) : super(defaultWidgetModelFactory);

  @override
  Widget build(PetGalleryWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Gallery'),
        backgroundColor: Theme.of(wm.context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: wm.refreshPets,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ValueListenableBuilder<FilterType>(
                valueListenable: wm.selectedFilter,
                builder: (context, filter, _) {
                  return Row(
                    children: [
                      FilterChipWidget(
                        label: 'All',
                        isSelected: filter == FilterType.all,
                        onTap: () => wm.setFilter(FilterType.all),
                      ),
                      const SizedBox(width: 8),
                      FilterChipWidget(
                        label: 'Dogs',
                        isSelected: filter == FilterType.dogs,
                        onTap: () => wm.setFilter(FilterType.dogs),
                      ),
                      const SizedBox(width: 8),
                      FilterChipWidget(
                        label: 'Cats',
                        isSelected: filter == FilterType.cats,
                        onTap: () => wm.setFilter(FilterType.cats),
                      ),
                      const SizedBox(width: 8),
                      FilterChipWidget(
                        label: 'Favorites',
                        isSelected: filter == FilterType.favorites,
                        onTap: () => wm.setFilter(FilterType.favorites),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: EntityStateNotifierBuilder<List<Pet>>(
              listenableEntityState: wm.petsState,
              loadingBuilder: (_, __) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorBuilder: (_, error, __) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: wm.refreshPets,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              builder: (_, pets) {
                if (pets?.isEmpty ?? true) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pets, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('No pets found'),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: pets!.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return PetCard(
                      pet: pet,
                      onFavoriteToggle: () => wm.toggleFavorite(pet.id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
