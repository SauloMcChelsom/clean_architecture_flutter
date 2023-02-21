//flutter run --dart-define ENV=prod
//flutter run --dart-define ENV=homolog

abstract class AppConfig {
 String get REQUEST_CAR_LIST;
 String REQUEST_IMG(String img);
}

class ProdConfig implements AppConfig {
  @override
  String get REQUEST_CAR_LIST => 'http://www.api.com/list/1?page=1';

  @override
  String REQUEST_IMG(String img) => 'https://image.tmb.org/t/p/w500/$img';
}


class HomologConfig implements AppConfig {
  @override
  String get REQUEST_CAR_LIST => 'http://www.api-homolog.com/list/1?page=1';

  @override
  String REQUEST_IMG(String img) => 'https://image.tmb.org/t/p/w500/$img';
}

class DevelopConfig implements AppConfig {
  @override
  String get REQUEST_CAR_LIST => 'https://my-develop-url.com';

  @override
  String REQUEST_IMG(String img) => 'https://image.tmb.org/t/p/w500/$img';
}

class API {
  static AppConfig get url {
    const environmentParameter = String.fromEnvironment('ENV');
    switch (environmentParameter) {
      case 'prod': 
        return ProdConfig();
      case 'homolog': 
        return HomologConfig();
      case 'dev': 
        return DevelopConfig();
      default: 
       return DevelopConfig();
    }
  }
}

class Test {
  Test(){
    print(API.url.REQUEST_CAR_LIST);
    print(API.url.REQUEST_IMG(''));
  }
}
//print(API.url.REQUEST_CAR_LIST2);