# Arquitetura

Aplicativo de propagação com arquitetura de código limpo

Na arquitetura de código limpo, existem três camadas principais

- Data
- Domain
- Presentation
- shared (também pode ser chamado de core ou common)

# Exemplo 1
![image](https://raw.githubusercontent.com/SauloMcChelsom/clean_architecture_flutter/feature/auth/architecture1.png)

# Exemplo 2
![image](https://raw.githubusercontent.com/SauloMcChelsom/clean_architecture_flutter/feature/auth/architecture2.png)

## Shared

Este contém todas as funcionalidades comuns para o aplicativo. por exemplo, cliente http, configuração de ambiente, itens específicos da plataforma, como verificador de rede, etc.

Essas funcionalidades comuns serão usadas pela camada de dados, camada de domínio e camada de apresentação, por exemplo, cliente http por fonte de dados remota, informações de rede por camada de repositório, enums por camada de domínio e configuração por apresentação.

## Domain

Esta é a camada mais interna e conterá a lógica de negócios principal, ou seja, casos de uso e objetos de negócios também chamados de entidades, o caso de uso depende do contrato do repositório (não da implementação)

sempre o codigo começa no dominio
o dominio e responsavel por toda a logica de negocio da aplicação
o dominio tem entities e usecases

usecases tem contratos seguido por implementação

faço a inversao do controlle de dependencia
preciço de um repositorio 
aqui eu não sei quem implementa essa interface
tenho um contrato, quem algum implementa um contrato

então a minha camada de dominio não conheçe o mundo exterior
porem ela escreve um contrato, que algum tem que implementar esse
contrato, isso quer dizer na pratica quem alguma camada vai olhar 
pra esse repositorio e vai realizar a implementação dele, o usecase
que vai ultilizar esse repositorio, não quer saber quem implementar e como 
como implementa

## Data

As camadas de dados contêm a implementação do repositório e essa camada está mais próxima das fontes de dados reais e é responsável pela comunicação com as fontes de dados.

A camada de dados retorna os modelos e não entidades e o modelo também contém o mapeador fromJson e toJson.

Observação: não temos uma classe de mapeador extra, vamos apenas aproveitar o construtor nomeado por dart para mapear nosso conjunto de dados de um formulário para nossos modelos. toJson e fromJson.

a camada de date tem a reponsabilidade de tratar de dados

serialização
desarialização
transformação de dados
busca em apis
busca em  cache
trabalha em enttrada e saida de dados

## Entidades

Regras de negócios em toda a empresa
Composto de classes que podem conter métodos
Objetos de negócios do aplicativo
Usado em todo o aplicativo
Menos provável de mudar quando algo no aplicativo muda

## Casos de Uso
Regras de negócios específicas do aplicativo
Encapsule todos os casos de uso do aplicativo
Orquestre o fluxo de dados em todo o aplicativo
Não deve ser afetado por nenhuma alteração na interface do usuário
Pode mudar se a funcionalidade e o fluxo do aplicativo mudarem

## Repositórios
Classes abstratas que definem a funcionalidade esperada das camadas externas
Não estão cientes das camadas externas, simplesmente defina a funcionalidade esperada
Por exemplo, o Logincaso de uso espera um Repositoryque tenha loginfuncionalidade
Passado para Usecasesas camadas externas

## Presentation

Essa camada contém todas as informações sobre a interface do usuário e tudo para mostrar ao cliente usuário final. A camada de apresentação também contém o bloco que é o gerenciamento de estado e geralmente denominado como cérebro da interface do usuário.

A camada de apresentação interage via camada de domínio, ou seja, entidades e casos de uso.


# Objetivo

Esse documento tem por objetivo principal organizar o processo de desenvolvimento do software.

# Regras iniciais, limite e Análise

Pontos a serem levados em consideração antes de introduzir uma nova feature:

- Todo projeto precisará respeitar as regras de Lint
- Esse projeto deve ter cobertura mínima de testes de no mínimo 70%.
- Camadas globais devem ter um lugar específico na aplicação, por tanto, devem estar na pasta Shared.
- Cada feature deverá ter sua própria pasta onde conterá todas as camadas necessárias para a execução dos casos de uso da feature.
- Packages e plugins novos só poderão ser usados nos projetos após avaliação e aprovação de toda equipe responsável pelo projeto.
- Atualizações no Modelo de domínio só poderão ser aceitas se primeiro for adicionada nesse documento e aprovado por todos os envolvidos no projeto.
- Não é permitido ter uma classe concreta como dependência de uma camada. Só será aceita coesão com classes abstratas ou interfaces. Com exceção da Store.
- Cada camada deve ter apenas uma responsabilidade.

# Package externos (Comum)

- uno: Cliente HTTP.
- result: Retorno múltiplo no formato Failure e Success.
- Mocktail: Para testes de unidade.


# Package externos (App)

- flutter_modular: Modularização de rotas e injeção de dependências.
- realm: Base de dados local.

### Folder structure

```
├── lib
│   ├── main.dart
│   ├── shared
│   │   ├── constants
│   │   ├── inject
│   │   ├── model
│   │   ├── services
│   │   └── utils
│   └── features
│       └── todo
│           ├── data
│           │   ├── datasources
│           │   │   ├── local
│           │   │   │   └── todo_local_datasource.dart
│           │   │   └── remote
│           │   │       └── todo_remote_datasource.dart
│           │   ├── models
│           │   │   └── todo_model.dart
│           │   └── repositories
│           │       └── todo_repository_impl.dart
│           │
│           ├── domain
│           │   ├── entities
│           │   │   └── todo_entity.dart
│           │   ├── repositories
│           │   │   └── todo_repository.dart
│           │   └── usescases
│           │       └── todo_usecase.dart
│           │
│           └── presentation
│               └── todo
│                   ├── controller
│                   │   └── todo_controller.dart
│                   ├── bloc
│                   │   ├── todo_bloc.dart
│                   │   ├── todo_event.dart
│                   │   └── todo_state.dart
│                   ├── pages
│                   │   ├── list_todo_page.dart
│                   │   └── create_todo_page.dart
│                   ├── widgets
│                   │   ├── table_widget.dart
│                   │   └── button_widget.dart
│                   └── todo_routes.dart
├── pubspec.lock
└── pubspec.yaml

```

# How to run

Executar em modo de produção
```bash
flutter run --dart-define ENV=prod
```

Executar em modo de homologação
```bash
flutter run --dart-define ENV=homolog
```

Executar em modo de desenvolvimento
```bash
flutter run --dart-define ENV=dev
```

Construir um App.apk
```bash
flutter build apk --release
```

Construir um App.aab
```bash
flutter build appbundle
```

Executar em um emulator
```bash
flutter run -d emulator-5554
```

limpar o cache de compilação do projeto Flutter
```bash
flutter clean
```

Comando para excluir pacotes `Dart`
```bash
dart pub cache clean
```

Comando para excluir pacotes `Flutter`
```bash
flutter pub cache clean
```

## How to test

```bash
flutter test --coverage
```