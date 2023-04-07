//flutter run --dart-define ENV=prod
//flutter run --dart-define ENV=homolog

abstract class AppConfig {
  String get APP_CAO_GUIA_ROBO;
  String get ENV;
}

class ProdConfig implements AppConfig {
  @override
  String get APP_CAO_GUIA_ROBO => 'https://app.caoguiarobo.com.br';

  @override
  String get ENV => 'PROD';
}

class DevelopConfig implements AppConfig {
  @override
  String get APP_CAO_GUIA_ROBO => 'https://hmg-app.caoguiarobo.com.br';

  @override
  String get ENV => 'DEV';
}

class AppPath {
  static AppConfig get url {
    const environmentParameter = String.fromEnvironment('ENV');
    switch (environmentParameter) {
      case 'prod':
        return ProdConfig();
      case 'dev':
        return DevelopConfig();
      default:
        return DevelopConfig();
    }
  }
}

main() {
  print(AppPath.url.APP_CAO_GUIA_ROBO);
}
