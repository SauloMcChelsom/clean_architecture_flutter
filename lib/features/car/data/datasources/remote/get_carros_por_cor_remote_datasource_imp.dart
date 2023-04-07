import 'package:clean_architecture_flutter/shared/services/http/http_service_imp.dart';
import 'package:clean_architecture_flutter/features/car/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:clean_architecture_flutter/features/car/data/dtos/carros_dto.dart';

class GetCarrosPorCorLocalDateSourceImp implements GetCarrosPorCorDateSource {
  final HttpService _httpService;

  GetCarrosPorCorLocalDateSourceImp(this._httpService);

  final jsonany = {'placa': 'QWE', 'quantidadeDePortas': 2, 'ValorFinal': 2000.00};

  @override
  CarroDto call(String cor) {
    if (cor.contains('vermelho')) {
      return CarroDto.fromMap(jsonany);
    }
    return CarroDto.fromMap(jsonany);
  }

  Future car(String cor) async {
    try {
      await Future.delayed(Duration(seconds: 3));
      //var result = await IHttpService().get(API.url.REQUEST_CAR_LIST);
      return CarroDto;
    } catch (e) {
      return Exception('Falha no datasource');
    }
  }
}
