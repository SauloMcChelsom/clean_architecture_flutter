import 'package:clean_architecture_flutter/core/domain/entities/response_entity.dart';
import 'package:dio/dio.dart';
import 'package:uno/uno.dart';
import 'package:http/http.dart' as http;

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

class HttpService extends IHttpService {
  @override
  Future<ResponseEntity> get(String url, {data}) async {
    var _url = Uri.parse(url);
    final headers = _headers();
    var response_entitty = new ResponseEntity(code: '', description: '', message: '', results: [], statusCode: 0, timestamp: '');
    try {
      var response = await http.get(_url, headers: headers);
      response_entitty.setCode('SUCCESS');
      response_entitty.setDescription('');
      response_entitty.setMessage('successful in request method GET by HTTP');
      response_entitty.setResults([response.body]);
      response_entitty.setStatusCode(200);
      response_entitty.setTimestamp();
    } catch (e) {
      response_entitty.setCode('EXCEPTION');
      response_entitty.setDescription(e.toString());
      response_entitty.setMessage('erro in request method GET by HTTP');
      response_entitty.setResults([]);
      response_entitty.setStatusCode(500);
      response_entitty.setTimestamp();
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> post(String url, {data}) async {
    var _url = Uri.parse(url);
    final headers = _headers();
    var response_entitty = new ResponseEntity(code: '', description: '', message: '', results: [], statusCode: 0, timestamp: '');
    try {
      var response = await http.post(_url, body: data, headers: headers);
      response_entitty.setCode('SUCCESS');
      response_entitty.setDescription('');
      response_entitty.setMessage('successful in request method POST by HTTP');
      response_entitty.setResults([response.body]);
      response_entitty.setStatusCode(200);
      response_entitty.setTimestamp();
    } catch (e) {
      response_entitty.setCode('EXCEPTION');
      response_entitty.setDescription(e.toString());
      response_entitty.setMessage('erro in request method POST by HTTP');
      response_entitty.setResults([]);
      response_entitty.setStatusCode(500);
      response_entitty.setTimestamp();
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> put(String url, {data}) async {
    var _url = Uri.parse(url);
    final headers = _headers();
    late http.Response response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await http.put(_url, body: data, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method PUT by HTTP',
          results: [response.body],
          statusCode: response.statusCode,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method PUT by HTTP',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> delete(String url, {data}) async {
    var _url = Uri.parse(url);
    final headers = _headers();
    late http.Response response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await http.delete(_url, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method DELETE by HTTP',
          results: [response.body],
          statusCode: response.statusCode,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method DELETE by HTTP',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> patch(String url, {data}) async {
    var _url = Uri.parse(url);
    final headers = _headers();
    late http.Response response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await http.patch(_url, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method PATCH by HTTP',
          results: [response.body],
          statusCode: response.statusCode,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method PATCH by HTTP',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }
}

class UnoHttpService extends IHttpService {
  final uno = Uno();

  @override
  Future<ResponseEntity> delete(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await uno.delete(url, data: data, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method DELETE by UNO',
          results: [response.data],
          statusCode: response.status,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method DELETE by UNO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> get(String url) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await uno.get(url, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method GET by UNO',
          results: [response.data],
          statusCode: response.status,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method GET by UNO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> patch(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await uno.patch(url, data: data, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method PATCH by UNO',
          results: [response.data],
          statusCode: response.status,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method PATCH by UNO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> post(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await uno.post(url, data: data, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method POST by UNO',
          results: [response.data],
          statusCode: response.status,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method POST by UNO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> put(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await uno.put(url, data: data, headers: headers);
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method PUT by UNO',
          results: [response.data],
          statusCode: response.status,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method PUT by UNO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }
}

class DioHttpService extends IHttpService {
  final dio = Dio();

  @override
  Future<ResponseEntity> delete(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await dio.delete(url, data: data, options: Options(headers: headers));
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method DELETE by DIO',
          results: [response.data],
          statusCode: response.statusCode!,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method DELETE by DIO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> get(String url) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await dio.get(url, options: Options(headers: headers));
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method GET by DIO',
          results: [response.data],
          statusCode: response.statusCode!,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method GET by DIO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> patch(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await dio.patch(url, data: data, options: Options(headers: headers));
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method PATCH by DIO',
          results: [response.data],
          statusCode: response.statusCode!,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method PATCH by DIO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> post(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await dio.post(url, data: data, options: Options(headers: headers));
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method POST by DIO',
          results: [response.data],
          statusCode: response.statusCode!,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method POST by DIO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }

  @override
  Future<ResponseEntity> put(String url, {data}) async {
    final headers = _headers();
    late dynamic response = null!;
    late ResponseEntity response_entitty = null!;
    try {
      response = await dio.put(url, data: data, options: Options(headers: headers));
      response_entitty = ResponseEntity(
          code: 'SUCCESS',
          description: '',
          message: 'successful in request method PUT by DIO',
          results: [response.data],
          statusCode: response.statusCode!,
          timestamp: DateTime.now().toString());
    } catch (e) {
      response_entitty = ResponseEntity(
          code: 'EXCEPTION',
          description: e.toString(),
          message: 'erro in request method PUT by DIO',
          results: [],
          statusCode: 500,
          timestamp: DateTime.now().toString());
    }

    return response_entitty;
  }
}

Map<String, String> _headers() {
  final String tokenUser = '';
  late Map<String, String> headers = null!;
  if (tokenUser.isNotEmpty) {
    headers = {"Content-Type": "application/json", "Authorization": "Bearer $tokenUser"};
  } else {
    headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
  }

  print('headers $headers');
  return headers;
}

abstract class IHttpService {
  final interceptors = <MyInterceptor>[];

  Future<ResponseEntity> get(String url);
  Future<ResponseEntity> post(String url, {dynamic data});
  Future<ResponseEntity> put(String url, {dynamic data});
  Future<ResponseEntity> patch(String url, {dynamic data});
  Future<ResponseEntity> delete(String url, {dynamic data});
}

abstract class MyInterceptor<TRequest, TResponse, TError> {
  Future<TRequest> onRequest(TRequest request);
  Future<TResponse> onResponse(TResponse response);
  Future<TError> onError(TError error);
}
