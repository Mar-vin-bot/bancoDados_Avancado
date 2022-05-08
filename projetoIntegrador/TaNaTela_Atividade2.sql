/* TaNaTela_Lógico: */
CREATE DATABASE tanatela;
use tanatela;

CREATE TABLE Cliente (
    Login VARCHAR(50) PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(200),
    Telefone CHAR(20),
    Senha VARCHAR(50),
    Dt_nasc DATE
);

CREATE TABLE Sala (
    Cod_Sala INT PRIMARY KEY,
    Nome_Sala VARCHAR(50),
    Capacidade INT
);

CREATE TABLE Filme (
    Cod_Filme INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Duracao INT,
    Genero VARCHAR(20),
    Sinopse VARCHAR(250),
    data_inicio DATE,
    data_termino DATE,
    Cod_Sala INT,
    FOREIGN KEY (Cod_Sala)
    REFERENCES Sala (Cod_Sala)
);

CREATE TABLE Ingresso (
    Cod_Ingresso INT PRIMARY KEY,
    Valor numeric(7,2),
    Cod_Filme INT,
     FOREIGN KEY (Cod_Filme)
    REFERENCES Filme (Cod_Filme)
);

CREATE TABLE Promocao (
    Cod_Promo INT PRIMARY KEY,
    Descricao VARCHAR(200),
    Ref_Regulamento VARCHAR(100),
    Data_Inicio DATE,
    Data_Sorteio DATE,
    Data_Fim DATE
);

CREATE TABLE Compra (
    Nro_Compra INT PRIMARY KEY,
    Nro_Cartao VARCHAR(40),
    Data_Aquisicao DATE,
    Data_exibicao DATE,
    Login VARCHAR(50),
    Cod_Ingresso INT,
    FOREIGN KEY (Cod_Ingresso)
    REFERENCES Ingresso (Cod_Ingresso),
    FOREIGN KEY (Login)
    REFERENCES Cliente (Login)
);

#DROP TABLE Participa;

CREATE TABLE Participa (
	Cod_participa INT PRIMARY KEY,
    Cliente_Login VARCHAR(50),
    Promocao_Cod_Promo INT,
	FOREIGN KEY (Cliente_Login)
    REFERENCES Cliente (Login),
    FOREIGN KEY (Promocao_Cod_Promo)
    REFERENCES Promocao (Cod_Promo)
);

  
    
INSERT INTO Cliente VALUES
("Brenosm1","Breno","breno@iftm.com","99999999","123456","1987-05-12"),
("Bruno2","Bruno","bruno@iftm.com","88888888","456789","1990-08-20"),
("Marvin123","Marvin","Marvin@iftm.com","77777777","16147789","1994-04-30"),
("Rubens321","Rubens","rubens@iftm.com","66666666","127832123","1993-02-01"),
("Cricia65454","Cricia","cricia@iftm.com","5555555","aoufbdsf","1992-01-01"),
("Arthur987","Arthur","arthur@iftm.com","444444444","basuidbsa","2000-06-06"),
("Leticia345","leticia","leticia@iftm.com","3333333","cabsidiasd","1935-11-22"),
("Patricia54353","Patricia","patricia@iftm.com","222222222","avbuaisdf","1947-12-01"),
("Lauracvs","Laura","laura@iftm.com","111111111","vaoujdfSA","1966-01-07"),
("Solange312","Solange","solange@iftm.com","000000000","VAOIDNAOS","2010-09-24"),
("Clarimundo123","Clarimundo","clarimundo@iftm.com","123456789","BAOFNGDOU","1999-07-23"),
("Phably","Phabliny","phabliny@iftm.com","998669377","1234","1995-12-08");

select * FROM CLIENTE;
    
INSERT INTO Sala VALUES
(1,"Xtreme", 200),
(2,"VIP", 100),
(3,"Economica", 300),
(4,"3D", 200),
(5,"Luxo", 80);

SELECT * FROM SALA;

INSERT INTO Filme VALUES
(1,"Homem Aranha 1",120,"Ação","O Homem-Aranha precisa lidar com as consequências da sua verdadeira identidade ter sido descoberta.","2021-12-16","2022-01-16",1),
(2,"Batman",150,"Ação","Da Warner Bros. Pictures chega THE BATMAN com o realizador Matt Reeves no comando e protagonizado por Robert Pattinson no duplo papel de detetive de Gotham City e do seu alter ego, o bilionário solitário Bruce Wayne.","2022-02-15","2022-04-24",5),
(3,"Os trapalhões",100,"Comedia","Os quatro Trapalhões opõem-se a inimigos ou a si mesmos em disputas e pregam peças em outras pessoas. Entre outras palhaçadas, os amigos sempre unem forças para chegar a um objetivo comum.","2022-01-20","2022-02-28",4),
(4,"Lua de cristal",60,"Infantil","Maria da Graça chega à cidade grande para morar com sua tia e seus primos, mas eles atormentam sua vida, fazendo-a trabalhar na casa onde moram. Ela conhece Bob e, através dele, consegue realizar seu grande sonho: ter aulas de canto.","2021-10-08","2021-12-30",3),
(5,"A lagoa azul",130,"Romance","Após um naufrágio, duas crianças e o velho cozinheiro de um navio vão parar em uma ilha deserta no Oceano Pacífico. Pouco tempo depois, o cozinheiro morre, deixando o menino Richard e a menina Emmeline entregues à própria sorte.","2021-08-26","2021-10-16",2),
(6,"Free Guy: Assumindo o Controle",115,"Comedia","Um caixa de banco preso a uma entediante rotina tem sua vida virada de cabeça para baixo quando descobre que é um personagem em um jogo interativo. ","2022-01-16","2022-03-16",2);
select * from Filme;

INSERT INTO ingresso VALUES
(1,50,1),
(2,60,2),
(3,40,3),
(4,20,4),
(5,30,5),
(6,50,1),
(7,60,2),
(8,40,3),
(9,20,4),
(10,30,5);

SELECT * FROM INGRESSO;

INSERT INTO promocao VALUES
(1,"Festa de Aniversário","Festeje essa data especial onde o protagonista é voce","2022-01-01","2022-02-10","2022-02-09"),
(2,"Compre 2 e Ganhei 1","Compre 2 ingressos e concorra a um ingresso gratuito","2022-01-10","2022-02-15","2022-02-14"),
(3,"Compre 1 ingresso e ganhe 1 pipoca","Compre 1 ingresso e concorra a uma pipoca grande","2022-02-01","2022-02-20","2022-02-18"),
(4,"Mulher não paga","Compre 1 ingresso e concorra a um ingresso gratis para sua acompanhante","2022-01-01","2022-02-22","2022-02-20"),
(5,"1 Mês gratis","Compre 1 ingresso e concorra a 1 mês de cinema de graça","2022-01-20","2022-02-15","2022-02-14");

SELECT * FROM PROMOCAO;
insert into Participa values
(1,"Brenosm1",2),
(2,"Clarimundo123",5),
(3,"Solange312",4),
(4,"Cricia65454",3),
(5,"Bruno2",3),
(6,"Rubens321",2),
(7,"Leticia345",4),
(8,"Marvin123",1),
(9,"Lauracvs",2),
(10,"Arthur987",2),
(11,"Patricia54353",3),
(12,"Cricia65454",1),
(13,"Lauracvs",4),
(14,"Solange312",5),
(15,"Marvin123",2);
 SELECT * FROM PARTICIPA;

insert into Compra values
(1,1234,"2022-02-22","2022-01-07","Marvin123",4),
(2,5678,"2022-01-30","2022-01-07","Lauracvs",2),
(3,4564,"2022-01-10","2022-01-07","Bruno2",1),
(4,3453,"2021-12-21","2022-01-07","Cricia65454",1),
(5,3988,"2021-12-24","2022-01-07","Solange312",2),
(6,1238,"2022-01-30","2022-01-07","Lauracvs",3),
(7,1237,"2022-01-10","2022-01-07","Patricia54353",2),
(8,1236,"2021-12-21","2022-01-07","Lauracvs",1),
(9,1235,"2021-12-24","2022-01-07","Rubens321",5),
(10,5678,"2022-01-30","2022-02-22","Clarimundo123",2),
(11,4564,"2022-01-10","2022-03-15","Bruno2",1),
(12,3453,"2021-12-21","2022-01-09","Clarimundo123",1),
(13,5678,"2022-01-30","2022-01-21","Lauracvs",2),
(14,4564,"2022-01-10","2022-02-17","Bruno2",1),
(15,3453,"2021-12-21","2022-03-08","Cricia65454",1),
(16,3988,"2021-12-24","2022-01-07","Solange312",2);
 SELECT * FROM COMPRA;




################################################### Atividade 1-
/*(union)
    Listar o genero do filme concatenado com o titulo para filmes de ação ou romance e o valor do ingresso*/
(select concat_ws( " ",f.Genero, "-", f.Titulo, "-", "R$", i.Valor)
from Filme f inner join Ingresso i on f.Cod_Filme = i.Cod_Filme 
where f.Genero like 'Romance'
)
UNION
(select concat_ws( " ",f.Genero, "-", f.Titulo, "-", "R$", i.Valor)
from Filme f inner join Ingresso i on f.Cod_Filme = i.Cod_Filme 
where f.Genero like 'Ação');

#Contar a quantidade de clientes separando pela faixa etária
(select concat('Crianças/Adolescentes: ',cast(count(Nome)as char)) Qte_Faixa_Etaria from cliente where year(Dt_nasc) between '2004' and '2022')
union
(select concat('Adultos: ',cast(count(Nome)as char)) Qte_Faixa_Etaria from cliente where year(Dt_nasc) between '1960' and '2003')
union
(select concat('Idosos: ',cast(count(Nome)as char)) Qte_Faixa_Etaria from cliente where year(Dt_nasc) between '1900' and '1959');

################################################### Atividade 2 - Dê exemplos de consultas usando operadores de junção (ao menos 5).
/*
(junção)
		Liste o nome do cliente a descrição da promoção e a data do sorteio de todas as promoções realizadas
        no mes de fevereiro de 2022
*/
select c.Nome, pr.Descricao
from Cliente c inner join Participa p on c.Login = p.Cliente_Login
			   inner join Promocao pr on pr.Cod_Promo = p.Promocao_Cod_Promo
where pr.Data_Inicio like '2022-02-%';

/*
(junção)
    Lista o titulo, data inicio de exibição e data termino de exibição e nome da sala de todos os filmes do genero ação
*/
select f.Titulo, f.data_inicio, f.data_termino, s.Nome_Sala
from Filme f inner join Sala s on f.Cod_Sala = s.Cod_Sala
where f.Genero like 'Ação';


/*
(junção)
    Listar nome do cliente e a quantidade de ingresso comprado pelo cliente(considerar os top 5 que mais compraram ingresso)
*/
select c.Nome, count(c.Nome)
from Cliente c inner join Compra co on co.Login = c.Login
inner join Ingresso i on i.Cod_Ingresso = co.Cod_Ingresso
group by 1
order by 2 desc
limit 5;

/*
(junção)
    Listar o titulo do filme e o total arrecado em ingresso
*/
select f.Titulo, sum(i.Valor)
from Filme f inner join Ingresso i on i.Cod_Filme = f.Cod_Filme
group by 1
order by 2 desc;

/*(junção)
    Listar o ano, o mes e o total vendido em ingresso por ano e mes
*/

SELECT YEAR(co.Data_Aquisicao) Ano, MONTH(co.Data_Aquisicao) Mes, SUM(i.Valor) Total
FROM Compra co inner join Ingresso i on i.Cod_Ingresso = co.Cod_Ingresso
GROUP BY 
YEAR(co.Data_Aquisicao), MONTH(co.Data_Aquisicao);

/*
(junção externa)
    Listar o nome do cliente e a quantidade de promoções que ele participo(para clientes que não participaram de nenhuma promoção mostrar o valor 0)
*/
select c.Nome, count(p.Promocao_Cod_Promo)
from Cliente c left join Participa p on c.Login = p.Cliente_Login
			   left join Promocao pr on pr.Cod_Promo = p.Promocao_Cod_Promo
group by 1
order by 2 desc;

/*(junção e agrupamento)
    Listar o nome e o total gasto com ingresso e ordenar pelo total gasto em ordem decrescente, caso não tenha comprado um ingresso vai ser retornado o nome do cliente e o total como nulo
*/
select c.Nome, sum(i.Valor) Total
from Cliente c left join Compra co on co.Login = c.Login
			   left join Ingresso i on i.Cod_Ingresso = co.Cod_Ingresso
group by 1
order by 2 desc;

################################################### Atividade 3 - Dê exemplos de consultas usando subconsultas (ao menos 5).
/*
(subconsulta)
        Listar o titulo, genero e sinopse dos filmes que foi exibido na sala VIP
*/
select titulo, genero, sinopse
from Filme
where cod_sala in (
select s.cod_sala
from sala s
where s.Nome_Sala like "VIP"
);

/*
(subconsulta)
    Listar dados dos filmes que não tiveram ingresso vendido
*/
select *
from Filme
where cod_filme not in (
select i.cod_filme
from Ingresso i
);

/*
(subconsulta)
    Listar os dados das promoções que participaram cliente com mais de 40 anos de idade (fiz essa)
*/
select * from Cliente;

SELECT *
FROM Promocao
where Cod_Promo in (
select p.Promocao_Cod_Promo
from Participa p inner join Cliente c on c.Login = p.Cliente_Login
where TIMESTAMPDIFF (YEAR, c.Dt_nasc ,CURDATE())  > 40
);

/*SELECT Nome, TIMESTAMPDIFF (YEAR, Dt_nasc ,CURDATE())
FROM Cliente
where login in (
select p.Cliente_login
from Participa p
) and TIMESTAMPDIFF (YEAR, Dt_nasc ,CURDATE())  > 40;*/


/*(subconsulta)    
        Dados dos clientes que não participaram de nenhuma promoção
*/

select * 
from Cliente
where login not in (
select p.Cliente_Login
from Participa p
);

/* (subconsulta)   
       Listar nome, email e telefone dos clientes que compra um ingresso para o filme os trapalhões
*/

select Nome , Email, telefone
from Cliente
where Login in (
select c.Login
from Compra c 
inner join Ingresso i on c.Cod_Ingresso = i.Cod_Ingresso
inner join Filme f on f.Cod_Filme = i.Cod_Filme
where f.Titulo like 'Os trapalhões'
);

/*
	(visao)
		Criar uma visão que mostre o nome do cliente, quantos ingressos ele comprou e o valor total dos ingressos.
*/

create view vendasCliente as
select c.Nome, count(i.Cod_Ingresso), sum(i.Valor) Total
from Cliente c 
left join Compra co on co.Login = c.Login
left join Ingresso i on i.Cod_Ingresso = co.Cod_Ingresso
group by 1
order by 3 desc;

select * from vendasCliente;

/*
	(visao)
		Criar uma visão que mostre nome do cliente, o cartão usado, valor do ingresso, titulo do filme e o nome da sala, 
        ordenado por data de aquisição dos ingressos. 
*/

create view relatorioGeral as
select c.Nome, co.Nro_Cartao, i.Valor, f.Titulo, s.Nome_Sala
from Cliente c
inner join Compra co on c.Login = co.login
inner join Ingresso i on co.Cod_Ingresso = i.Cod_Ingresso
inner join Filme f on i.Cod_Filme = f.Cod_Filme
inner join Sala s on f.Cod_Sala = s.Cod_Sala
order by co.Data_Aquisicao;

select * from relatorioGeral;


/*
	(visao)
		Criar uma visão que mostre o titulo do filme, a média da idade dos clientes que assistiram o filme e a quantidade de ingressos vendidos. 
*/

create view Titulo_ingressos as
select f.Titulo,format(avg(timestampdiff(year,c.Dt_nasc,current_date)),0)Media_Idade,count(i.Cod_Ingresso) Total
from filme f
inner join Ingresso i on f.Cod_Filme = i.Cod_Filme
inner join Compra co on co.Cod_Ingresso = i.Cod_Ingresso
inner join Cliente c on c.Login = co.login
group by 1
order by 2 desc;

select * from Titulo_ingressos;

/*
	(visao)
		Criar uma visão que mostre o nome do cliente e a quantidade de promoções que ele participou, ordenando de forma decrescente.
*/
create view participantes_Promocao as
select c.Nome, count(p.Promocao_Cod_Promo)
from cliente c
left join Participa p on c.Login = p.Cliente_Login
 group by 1
 order by 2 desc;
 
 select * from participantes_Promocao;
 

