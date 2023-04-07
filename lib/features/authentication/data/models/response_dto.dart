import 'dart:convert';
import 'package:clean_architecture_flutter/shared/model/response_entity.dart';

class ResponseDTO {
  String _response_text = '';
  var _response = ResponseEntity(results: []);

  ResponseDTO({required String response_text}) {
    this._response_text = response_text;
  }

  ResponseEntity response() {
    var json = jsonDecode(this._response_text);

    _setResponseEntity(statusCode: json[0]['statusCode'], code: json[0]['code'], message: json[0]['message'], description: json[0]['description']);
    return _response;
  }

  _setResponseEntity({required int statusCode, required String code, required String message, required String description}) {
    this._response.setStatusCode(statusCode);
    this._response.setCode(code);
    this._response.setMessage(message);
    this._response.setDescription(description);
    this._response.setResults([]);
  }
}

void main(List<String> args) {
  String text =
      '[{"results":[{"id":3,"uid":"3b4cebaa-cb75-4c70-8e2a-e77e955710e5","name":"saulo","email":"2033.xyz@gmail.com","providers":"local.com","last_login":"2023-03-18T19:28:09.337Z","is_active":false,"updated_at":null,"timestamp":"Thu Feb 23 2023 15:00:34 GMT-0300 (Horário Padrão de Brasília)"}],"statusCode":200,"code":"SUCCESSFULLY_FOUND","message":"Encontrado com sucesso","description":"","count":0,"limit":3,"offset":0,"order":"asc","column":"id","search":null,"start":null,"end":null,"timestamp":"2023-04-04T19:00:26.407Z"}]';
  final dto = ResponseDTO(response_text: text);

  var response = dto.response();
  print(response.getMessage());
  print(response.getDescription());
  print(response.getCode());
  print(response.getStatusCode());
  print(response.getResults());
}
/**
  [{"statusCode":404,
  "code":"NOT_FOUND",
  "message":"not found user by email",
  "description":"the email '2033.xyzd@gmail.com' is not registered",
  "timestamp":"2023-03-16T02:33:23.840Z",
  "path":"/v1/public/auth/sign-in",
  "method":"POST",
  "req":{"rawHeaders":["user-agent","Dart/2.19 (dart:io)","content-type","application/json; charset=utf-8","accept","application/json","accept-encoding","gzip","content-length","58","host","localhost:3000"],"httpVersion":"1.1","params":{},"protocol":"http"},
  "offset":0,
  "order":"asc","column":"id","search":null,"start":null,"end":null,"limit":3,"count":0,
  "body":{"email":"2033.xyzd@gmail.com","password":"123456789a"}}]
 */