import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kt9/features/pet_gallery/domain/entities/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onFavoriteToggle;

  const PetCard({
    super.key,
    required this.pet,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Изображение питомца
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: pet.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.pets,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                // Кнопка избранного
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        pet.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: pet.isFavorite ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Информация о питомце
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${pet.breed} • ${pet.age} years',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: pet.type.toLowerCase() == 'dog' 
                          ? Colors.blue[100] 
                          : Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      pet.type,
                      style: TextStyle(
                        fontSize: 10,
                        color: pet.type.toLowerCase() == 'dog' 
                            ? Colors.blue[700] 
                            : Colors.orange[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
