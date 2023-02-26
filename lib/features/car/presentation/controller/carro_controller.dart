import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase.dart';

class CarroController {
  final GetCarrosPorCorUseCase _getCarrosPorCorUseCase;
  final SalvarCarroFavoritoUseCase _salvarCarroFavoritoUseCase;

  CarroController(this._getCarrosPorCorUseCase, this._salvarCarroFavoritoUseCase) {
    getCarrosPorCor('vermelho');
  }

  late CarroEntity carro;

  getCarrosPorCor(String cor) {
    carro = _getCarrosPorCorUseCase(cor);
  }

  salverCarroFavorito(CarroEntity carro) async {
    var result = await _salvarCarroFavoritoUseCase(carro);
  }
}
