import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kt9/features/pet_gallery/data/datasources/pet_remote_datasource.dart';
import 'package:kt9/features/pet_gallery/data/repositories/pet_repository_impl.dart';
import 'package:kt9/features/pet_gallery/domain/repositories/pet_repository.dart';
import 'package:kt9/features/pet_gallery/domain/usecases/get_pets_usecase.dart';
import 'package:kt9/features/pet_gallery/domain/usecases/toggle_favorite_usecase.dart';

class AppScope extends InheritedWidget {
  final Dio dio;
  final PetRemoteDataSource petRemoteDataSource;
  final PetRepository petRepository;
  final GetPetsUseCase getPetsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  AppScope({super.key, required super.child})
      : dio = Dio(),
        petRemoteDataSource = PetRemoteDataSource(Dio()),
        petRepository = PetRepositoryImpl(PetRemoteDataSource(Dio())),
        getPetsUseCase = GetPetsUseCase(PetRepositoryImpl(PetRemoteDataSource(Dio()))),
        toggleFavoriteUseCase = ToggleFavoriteUseCase(PetRepositoryImpl(PetRemoteDataSource(Dio())));

  static AppScope of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(result != null, 'No AppScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppScope oldWidget) => false;
}
