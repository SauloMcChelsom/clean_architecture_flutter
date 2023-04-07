# Arquitetura

(Geralmente é um documento escrito em inglês)

# Objetivo

Esse documento tem por objetivo principal organizar o processo de desenvolvimento do software.

# Regras iniciais, limite e Análise

Pontos a serem levados em consideração antes de introduzir uma nova feature:

- Todo projeto precisará respeitar as regras de Lint escritas no pacote flutterando-analysis.
- Esse projeto deve ter cobertura mínima de testes de no mínimo 70%.
- Camadas globais devem ter um lugar específico na aplicação, por tanto, devem estar na pasta Shared.
- Cada feature deverá ter sua própria pasta onde conterá todas as camadas necessárias para a execução dos casos de uso da feature.
- Todos os designs patterns usados no projeto devem estar listados na sessão “Design Patterns” desse documento, caso contrário será considerado implementação errônea.
- Packages e plugins novos só poderão ser usados nos projetos após avaliação e aprovação de toda equipe responsável pelo projeto.
- Atualizações no Modelo de domínio só poderão ser aceitas se primeiro for adicionada nesse documento e aprovado por todos os envolvidos no projeto.
- Não é permitido ter uma classe concreta como dependência de uma camada. Só será aceita coesão com classes abstratas ou interfaces. Com exceção da Store.
- Cada camada deve ter apenas uma responsabilidade.



# Entidades

Regras de negócios em toda a empresa
Composto de classes que podem conter métodos
Objetos de negócios do aplicativo
Usado em todo o aplicativo
Menos provável de mudar quando algo no aplicativo muda

# Casos de Uso
Regras de negócios específicas do aplicativo
Encapsule todos os casos de uso do aplicativo
Orquestre o fluxo de dados em todo o aplicativo
Não deve ser afetado por nenhuma alteração na interface do usuário
Pode mudar se a funcionalidade e o fluxo do aplicativo mudarem

# Repositórios
Classes abstratas que definem a funcionalidade esperada das camadas externas
Não estão cientes das camadas externas, simplesmente defina a funcionalidade esperada
Por exemplo, o Logincaso de uso espera um Repositoryque tenha loginfuncionalidade
Passado para Usecasesas camadas externas


# Design Patterns

- Repository Pattern: Para acesso a API externa.
- Service Pattern: Para isolar trechos de códigos com outras responsabilidades.
- Dependency Injection: Resolver dependências das classes.
- Store: Guardar e mudar estados.
- State pattern: Padrão que auxilia no gerenciamento estados.
- Adapter: Converter um objeto em outro.
- Result: Trabalhar com retorno Múltiplo.


# Package externos (Comum)

- uno: Cliente HTTP.
- result: Retorno múltiplo no formato Failure e Success.
- Mocktail: Para testes de unidade.


# Package externos (App)

- flutter_modular: Modularização de rotas e injeção de dependências.
- realm: Base de dados local.

# Package externos (Backend)

- shelf_modular: Modularização de rotas e injeção de dependências.
- Shelf: Criação de servidor Web.
- Postgres: Persistência de dados.
- Redis: Persistência de dados em memória.

### Folder structure

```
├── lib
│   ├── common
│   │   ├── configs
│   │   │   └── configuration.dart
│   │   ├── constants
│   │   │   ├── exception_constants.dart
│   │   │   ├── http_constants.dart
│   │   │   ├── local_database_type_constants.dart
│   │   │   └── route_constants.dart
│   │   ├── exceptions
│   │   │   ├── bad_request_exception.dart
│   │   │   ├── forbidden_exception.dart
│   │   │   ├── server_error_exception.dart
│   │   │   ├── server_exception.dart
│   │   │   └── unauthorized_exception.dart
│   │   ├── extensions
│   │   │   └── string_extension.dart
│   │   ├── http
│   │   │   └── http_client.dart
│   │   ├── injector
│   │   │   ├── injector.dart
│   │   │   ├── injector_config.dart
│   │   │   └── injector_config.g.dart
│   │   └── utils
│   │       ├── database_util.dart
│   │       └── http_utils.dart
│   ├── data
│   │   ├── datasources
│   │   │   ├── local
│   │   │   │   ├── local_database
│   │   │   │   │   ├── base_local_database.dart
│   │   │   │   │   ├── tables
│   │   │   │   │   │   ├── todo_table.dart
│   │   │   │   │   │   └── todo_table.g.dart
│   │   │   │   │   └── todo_local_datasource.dart
│   │   │   │   └── shared_preference
│   │   │   └── remote
│   │   │       ├── constants
│   │   │       │   └── todo_remote_datasource_constants.dart
│   │   │       └── todo_remote_datasource.dart
│   │   ├── models
│   │   │   └── todo_model.dart
│   │   └── repositories
│   │       └── todo_repository_impl.dart
│   ├── domain
│   │   ├── entities
│   │   │   └── todo_entity.dart
│   │   ├── repositories
│   │   │   └── todo_repository.dart
│   │   └── usescases
│   │       └── todo_usecase.dart
│   ├── main.dart
│   └── presentation
│       ├── app.dart
│       ├── common_bloc
│       ├── journey
│       │   ├── dashboard
│       │   │   ├── dashboard_constants.dart
│       │   │   ├── dashboard_routes.dart
│       │   │   └── dashboard_screen.dart
│       │   └── todo
│       │       ├── bloc
│       │       │   ├── todo_bloc.dart
│       │       │   ├── todo_event.dart
│       │       │   └── todo_state.dart
│       │       ├── create_todo
│       │       │   ├── create_todo_constants.dart
│       │       │   └── create_todo_screen.dart
│       │       ├── todo_list
│       │       │   ├── todo_list_screen.dart
│       │       │   └── widgets
│       │       │       ├── todo_item.dart
│       │       │       └── todo_list_constants.dart
│       │       └── todo_routes.dart
│       ├── routes.dart
│       ├── themes
│       │   ├── custom_icons.dart
│       │   ├── theme_colors.dart
│       │   ├── theme_data.dart
│       │   └── theme_text.dart
│       └── widgets
├── pubspec.lock
├── pubspec.yaml
└── test
    ├── __setup__
    │   ├── base_test_bloc.dart
    │   ├── navigation_mock.dart
    │   ├── path_provider_mock.dart
    │   └── wrapper.dart
    ├── common
    │   ├── exceptions
    │   │   ├── bad_request_exception_test.dart
    │   │   ├── forbidden_exception_test.dart
    │   │   ├── server_error_exception_test.dart
    │   │   └── unauthorized_exception_test.dart
    │   ├── http
    │   │   ├── __mock__
    │   │   │   ├── http_client_data.dart
    │   │   │   └── http_client_mock.dart
    │   │   └── http_client_test.dart
    │   └── utils
    │       ├── __mock__
    │       │   ├── sample_adapter.dart
    │       │   ├── sample_table.dart
    │       │   └── sample_table_mock.dart
    │       ├── database_utils_test.dart
    │       └── http_util_test.dart
    ├── data
    │   ├── datasources
    │   │   ├── local
    │   │   │   ├── __mock__
    │   │   │   │   ├── base_local_datasource_mock.dart
    │   │   │   │   ├── sample_model.dart
    │   │   │   │   ├── todo_local_datasource_mock.dart
    │   │   │   │   └── todo_table_data.dart
    │   │   │   ├── base_local_datasource_test.dart
    │   │   │   └── todo_local_datasource_test.dart
    │   │   └── remote
    │   │       ├── __mock__
    │   │       │   ├── http_client_mock.dart
    │   │       │   └── todo_remote_datasource_mock.dart
    │   │       └── todo_remote_datasource_test.dart
    │   ├── models
    │   │   ├── __mock__
    │   │   │   └── todo_model_data.dart
    │   │   └── todo_model_test.dart
    │   └── repositories
    │       ├── __mock__
    │       │   ├── todo_json_data.dart
    │       │   └── todo_repository_mock.dart
    │       └── todo_repository_impl_test.dart
    ├── domain
    │   ├── entities
    │   │   └── __mock__
    │   │       └── todo_entity_data.dart
    │   └── usecases
    │       ├── __mock__
    │       │   └── todo_usecase_mock.dart
    │       └── todo_usecase_test.dart
    ├── local_database_test_files
    │   ├── database_util_test.hive
    │   ├── database_util_test.lock
    │   ├── testbox.hive
    │   ├── testbox.lock
    │   ├── todo.hive
    │   └── todo.lock
    └── presentation
        ├── app_test.dart
        └── journey
            ├── dashboard
            │   └── dashboard_screen_test.dart
            └── todo
                ├── bloc
                │   ├── __mock__
                │   │   └── todo_bloc_mock.dart
                │   └── todo_bloc_test.dart
                ├── create_todo
                │   └── create_todo_screen_test.dart
                ├── todo_list
                │   ├── todo_list_screen_test.dart
                │   └── widgets
                │       └── todo_item_test.dart
                └── todo_routes_test.dart

```