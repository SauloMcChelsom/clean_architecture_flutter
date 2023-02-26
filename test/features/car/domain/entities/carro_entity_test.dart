import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Espero que a entidade não seja nula', () {
    CarroEntity carroEntity = CarroEntity(placa: 'ABC', qtdPortas: 2, valor: 1000.00);
    expect(carroEntity, isNotNull);
  });

  test('Espero que a quantidade de portas seja 2', () {
    CarroEntity carroEntity = CarroEntity(placa: 'ABC', qtdPortas: 2, valor: 1000.00);
    expect(carroEntity.qtdPortas, 2);
  });

  test('Espero que o valorReal seja 2000.00', () {
    CarroEntity carroEntity = CarroEntity(placa: 'ABC', qtdPortas: 2, valor: 1000.00);

    var resultadoEsperado = 2000.00;
    expect(carroEntity.valorReal, resultadoEsperado);
  });

  test('Espero que o valor seja 30000.00', () {
    CarroEntity carroEntity = CarroEntity(placa: 'ABC', qtdPortas: 2, valor: 15000.00);

    var resultadoEsperado = 30000.00;
    carroEntity.carroExportivo();

    expect(carroEntity.valor, resultadoEsperado);
  });
}
