

import 'package:clean_architecture_flutter/features/car/data/dtos/carros_dto.dart';

abstract class GetCarrosPorCorDateSource {
  CarroDto call(String cor);
}