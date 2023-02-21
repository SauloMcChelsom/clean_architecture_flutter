import 'package:clean_architecture_flutter/features/car/domain/entities/carro_entity.dart';

class CarroDto extends CarroEntity {
  String placa;
  int quantidadeDePortas;
  double ValorFinal;

  CarroDto({
    required this.placa,
    required this.quantidadeDePortas,
    required this.ValorFinal
  }) : super(
    valor: ValorFinal,
    qtdPortas: quantidadeDePortas,
    placa: placa
  );

  Map toMap(){
    return {
      'placa': this.placa,
      'quantidadeDePortas': this.quantidadeDePortas,
      'ValorFinal': this.ValorFinal
    };
  }

  static CarroDto fromMap(Map map){
    return CarroDto(
      placa: map['placa'],
      quantidadeDePortas: map['quantidadeDePortas'],
      ValorFinal: map['ValorFinal']
    );
  }
}