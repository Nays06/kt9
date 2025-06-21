import 'package:flutter/material.dart';
import 'package:kt9/app/app.dart';
import 'package:kt9/app/di/app_scope.dart';

void main() {
  runApp(AppScope(child: const PetGalleryApp()));
}