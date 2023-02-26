import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:clean_architecture_flutter/features/car/domain/repositories/salvar_carro_favorito_repository.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

class SalvarCarroFavoritoRepositoryImp implements SalvarCarroFavoritoRepository {
  @override
  Future<bool> call(CarroEntity carroEntity) async {
    if (carroEntity.valor > 0) {
      return true;
    }
    return false;
  }
}

void main() {
  test('Espero que salve o carro com sucesso', () async {
    SalvarCarroFavoritoUseCase useCase = SalvarCarroFavoritoUseCaseImp(SalvarCarroFavoritoRepositoryImp());

    var carro = CarroEntity(placa: 'ABC', qtdPortas: 2, valor: 1);
    var result = await useCase(carro);

    expect(result, true);
  });

  test('Espero que não salve o carro quando valor for manor ou igual que zero', () async {
    SalvarCarroFavoritoUseCase useCase = SalvarCarroFavoritoUseCaseImp(SalvarCarroFavoritoRepositoryImp());

    var carro = CarroEntity(placa: 'ABC', qtdPortas: 2, valor: 0);
    var result = await useCase(carro);

    expect(result, false);
  });
}
