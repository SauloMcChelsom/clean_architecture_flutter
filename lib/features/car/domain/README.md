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