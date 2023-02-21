
import 'package:clean_architecture_flutter/features/car/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';
import 'package:clean_architecture_flutter/features/car/domain/repositories/get_carros_por_cor_repository.dart';


class GetCarrosPorCorRepositoryImp implements GetCarrosPorCorRepository {
  final GetCarrosPorCorDateSource _getCarrosPorCorDataSource;
  GetCarrosPorCorRepositoryImp(this._getCarrosPorCorDataSource);

  @override
  CarroEntity call(String cor){
    return _getCarrosPorCorDataSource(cor);
  }
}