import 'package:clean_architecture_flutter/shared/model/response_entity.dart';
import 'package:clean_architecture_flutter/shared/services/http/http_service.dart';
import 'package:clean_architecture_flutter/shared/services/http/http_service_imp.dart';

void main(List<String> args) async {
  final uno = TodoService(UnoHttpService());
  final dio = TodoService(DioHttpService());
  final http = TodoService(HttpService());
  //service.signIn();
  uno.getAllUser();
  dio.getAllUser();
  http.getAllUser();
}

class TodoService {
  final IHttpService http;

  TodoService(this.http);

  Future<ResponseEntity> signIn() async {
    var data = '{"email": "2033.xyz@gmail.com", "password": "123456789"}';
    final res = await http.post('http://localhost:3000/v1/public/auth/sign-in', data: data);
    print(res.getStatusCode());
    print(res.getMessage());
    print(res.getCode());
    print(res.getDescription());
    print(res.getResults());
    return res;
  }

  Future<ResponseEntity> getAllUser() async {
    final res = await http.get('http://localhost:3000/v1/public/user/all');
    print(res.getStatusCode());
    print(res.getMessage());
    print(res.getCode());
    print(res.getDescription());
    print(res.getResults());
    return res;
  }
}
