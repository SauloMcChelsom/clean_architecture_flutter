import 'package:clean_architecture_flutter/features/car/presentation/controller/carro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CarroPage extends StatelessWidget {
  CarroPage({Key? key}) : super(key: key);

  /*CarroController controller = CarroController(
    GetCarrosPorCorUseCaseImp(
      GetCarrosPorCorRepositoryImp(
        GetCarrosPorCorLocalDateSourceImp(),
      ),
    ),
    SalvarCarroFavoritoUseCaseImp(
      SalvarCarroFavoritoRepositoryImp(),
    )
  );*/
  CarroController controller = GetIt.I.get<CarroController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Text(controller.carro.placa),
      ),
    );
  }
}
