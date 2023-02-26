import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:clean_architecture_flutter/features/car/domain/repositories/salvar_carro_favorito_repository.dart';

class SalvarCarroFavoritoRepositoryImp implements SalvarCarroFavoritoRepository {
  @override
  Future<bool> call(CarroEntity carroEntity) async {
    return carroEntity.valor > 0;
  }
}
