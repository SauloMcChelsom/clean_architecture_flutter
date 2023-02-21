import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';

abstract class SalvarCarroFavoritoRepository {
  Future <bool> call(CarroEntity carroEntity);
}