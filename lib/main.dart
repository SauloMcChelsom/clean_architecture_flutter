import 'package:clean_architecture_flutter/shared/inject/car_inject.dart';
import 'package:clean_architecture_flutter/shared/inject/movie_inject.dart';
import 'package:clean_architecture_flutter/features/car/presentation/ui/pages/carro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Cars.initialize();
  Movies.initialize();
  FlutterNativeSplash.remove();
  runApp(MaterialApp(
    home: CarroPage(),
  ));
}
