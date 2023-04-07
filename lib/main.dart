import 'package:clean_architecture_flutter/shared/inject/car_inject.dart';
import 'package:clean_architecture_flutter/shared/inject/movie_inject.dart';
import 'package:clean_architecture_flutter/features/car/presentation/ui/pages/carro_page.dart';
import 'package:flutter/material.dart';

void main() {
  Cars.initialize();
  Movies.initialize();
  runApp(MaterialApp(
    home: CarroPage(),
  ));
}
