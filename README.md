https://github.com/ShadyBoukhary/flutter_clean_architecture
https://github.com/devmuaz/flutter_clean_architecture
https://github.com/ntminhdn/Flutter-Bloc-CleanArchitecture
https://github.com/RashmiRanganathan/clean-code-architecture-flutter

https://github1s.com/devmuaz/flutter_clean_architecture
https://github1s.com/RashmiRanganathan/clean-code-architecture-flutter

#dominio
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

#data
a camada de date tem a reponsabilidade de tratar de dados

serialização
desarialização
transformação de dados
busca em apis
busca em  cache
trabalha em enttrada e saida de dados
