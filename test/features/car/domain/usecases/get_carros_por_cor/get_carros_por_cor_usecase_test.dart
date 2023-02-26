import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retornar uma instancia de carro quando passado qualquer cor', () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp();
    var result = useCase('azul');
    expect(result, isInstanceOf<CarroEntity>());
  });

  test('Deve retornar uma carro de quatro portas quando vermelho', () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp();
    var result = useCase('vermelho');
    expect(result.qtdPortas, 4);
  });

  test('Deve retornar uma carro de duas portas quando qualquer cor exceto vermelho', () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp();
    var result = useCase('azul');
    expect(result.qtdPortas, 2);
  });
}
