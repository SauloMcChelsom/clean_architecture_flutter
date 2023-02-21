

import 'package:clean_architecture_flutter/features/car/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:clean_architecture_flutter/features/car/data/dtos/carros_dto.dart';

class GetCarrosPorCorLocalDateSourceImp implements GetCarrosPorCorDateSource {
  final jsonVermelho = {
    'placa': 'ABC',
    'quantidadeDePortas': 4,
    'ValorFinal': 5000.00
  };

  final jsonany = {
    'placa': 'QWE',
    'quantidadeDePortas': 2,
    'ValorFinal': 2000.00
  };

  @override
  CarroDto call(String cor){
    if(cor.contains('vermelho')){
      return CarroDto.fromMap(jsonVermelho);
    }
    return CarroDto.fromMap(jsonany);
  }
}