import 'package:flutter/material.dart';
import 'package:kt9/features/pet_gallery/presentation/pet_gallery_screen.dart';

class PetGalleryApp extends StatelessWidget {
  const PetGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: PetGalleryScreen(),
    );
  }
}