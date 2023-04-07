import 'dart:convert';
import 'package:clean_architecture_flutter/features/authentication/domain/entities/user_entity.dart';

class UserDTO {
  late String _user_text;

  UserDTO({required String user_text}) {
    this._user_text = user_text;
  }

  UserEntity user() {
    var json = jsonDecode(this._user_text);
    return UserEntity(
        name: json[0]['name'],
        email: json[0]['email'],
        id: json[0]['id'],
        uid: json[0]['uid'],
        providers: json[0]['providers'],
        last_login: json[0]['last_login'],
        is_active: json[0]['is_active'],
        updated_at: json[0]['updated_at'],
        timestamp: json[0]['timestamp']);
  }
}

void main(List<String> args) {
  String text =
      '[{"id":3,"uid":"3b4cebaa-cb75-4c70-8e2a-e77e955710e5","name":"saulo","email":"2033.xyz@gmail.com","providers":"local.com","last_login":"2023-03-18T19:28:09.337Z","is_active":false,"updated_at":"Thu Feb 23 2023 15:00:34 GMT-0300 (Horário Padrão de Brasília)","timestamp":"Thu Feb 23 2023 15:00:34 GMT-0300 (Horário Padrão de Brasília)"}]';
  final dto = UserDTO(user_text: text).user();
  print(dto.is_active);
}
