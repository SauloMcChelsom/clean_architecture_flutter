import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';

class GetCarrosPorCorUseCaseImp implements GetCarrosPorCorUseCase {
  @override
  CarroEntity call(String cor) {
    if(cor.contains('vermelho')){
      return CarroEntity(placa: 'ABC123', qtdPortas: 4, valor: 5000.00);
    }
    return CarroEntity(placa: 'S2S', qtdPortas: 2, valor: 2000.00);
  }
}