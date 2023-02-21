import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';

abstract class GetCarrosPorCorRepository {
  CarroEntity call(String cor);
}