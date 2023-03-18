import 'package:clean_architecture_flutter/features/car/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:clean_architecture_flutter/features/car/data/datasources/local/get_carros_por_cor_local_datasource_imp.dart';
import 'package:clean_architecture_flutter/features/car/data/repositories/get_carros_por_cor_repository_imp.dart';
import 'package:clean_architecture_flutter/features/car/data/repositories/salvar_carro_favorito_repository_imp.dart';
import 'package:clean_architecture_flutter/features/car/domain/repositories/get_carros_por_cor_repository.dart';
import 'package:clean_architecture_flutter/features/car/domain/repositories/salvar_carro_favorito_repository.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase_imp.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase.dart';
import 'package:clean_architecture_flutter/features/car/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase_imp.dart';
import 'package:clean_architecture_flutter/features/car/presentation/controller/carro_controller.dart';
import 'package:get_it/get_it.dart';

class Cars {
  static void initialize() {
    GetIt getIt = GetIt.instance;

    // detasources
    getIt.registerLazySingleton<GetCarrosPorCorDateSource>(
      () => GetCarrosPorCorLocalDateSourceImp(),
    );
    // repositories
    getIt.registerLazySingleton<GetCarrosPorCorRepository>(
      () => GetCarrosPorCorRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<SalvarCarroFavoritoRepository>(
      () => SalvarCarroFavoritoRepositoryImp(),
    );
    // usecases
    getIt.registerLazySingleton<GetCarrosPorCorUseCase>(
      () => GetCarrosPorCorUseCaseImp(),
    );
    getIt.registerLazySingleton<SalvarCarroFavoritoUseCase>(
      () => SalvarCarroFavoritoUseCaseImp(getIt()),
    );
    // controller
    getIt.registerFactory<CarroController>(
      () => CarroController(getIt(), getIt()),
    );
  }
}
/**
 *     GetIt getIt = GetIt.instance;

    // detasources
    getIt.registerLazySingleton<IAuthenticationDatasource>(
      () => AuthenticationRemoteDatasource(getIt()),
    );
    // repositories
    getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(datasource: getIt()),
    );
 */