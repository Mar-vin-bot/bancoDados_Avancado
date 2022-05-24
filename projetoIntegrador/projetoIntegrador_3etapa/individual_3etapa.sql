-- 1 A

DELIMITER $
create procedure insereFilme( VARcodFilme int , VARtitulo varchar(100) , VARduracao int, 
							VARGenero varchar(20), VARsinopse varchar(250), VARdt_inicio date , 
                            VARdt_termino date, VARCodSala int )
begin
	if (VARcodFilme is null or VARCodSala is null ) then 
    select "Cod filme e Cod sala campos obrigatorios reveja seu insert. Obrigado" as msg; -- mensagem não esta saindo
    else 
		insert into filme(Cod_Filme , Titulo, Duracao, Genero, Sinopse, data_inicio, data_termino, Cod_Sala) 
        values (VARcodFilme , VARtitulo , VARduracao,  VARGenero, VARsinopse, VARdt_inicio , VARdt_termino, VARCodSala);
        end if ;
END $
DELIMITER ;  -- ATENTE-SE PARA DEIXAR UM ESPAÇO DO COMANDO PARA O ;
call insereFilme  (9, "The GodFather", 137, "AÇÃO",  "Um idoso e sua quadrilha de carcamano colocam Chicado de cabaça para baixo", "2012-12-31", "2013-01-30", 2);
call insereFilme  ( "Dream on", 427, "AÇÃO",  "-ppppp-----pppppp" "2002-12-31", "2003-01-30", 2);


-- 1A

DELIMITER $
create procedure attFilmeDuracao( VARcodFilme int, VARduracao int )
	
begin
	declare msg varchar(200);
-- falta fazer validação mgn não sai e consultas com cod invalido são feitas
    
	if (VARcodFilme is null ) then 
    
  set msg = "Cod filme e Cod sala campos obrigatorios reveja seu insert. Obrigado";
  signal sqlstate "45000" set message_text=msg;
    else 
		update Filme set Duracao =  VARduracao where Cod_Filme = VARcodFilme;
	end if ;
END $
DELIMITER ;

call attFilmeDuracao (null, 202);


-- 1 B

DELIMITER $
create procedure valorGastoPorFilme( VARcodFilme int )
	
begin
		declare msg varchar(200);

		if (VARcodFilme is null) then
		set msg = "Cod filme e Cod sala campos obrigatorios reveja seu insert. Obrigado";

else
	select f.titulo, sum(valor) from ingresso i
    inner join filme f on f.cod_filme = i.cod_filme
    where VARcodFilme = i.cod_filme and f.cod_filme = VARcodFilme
    group by f.cod_filme;
    
end if;

END $
DELIMITER ;

call valorGastoPorFilme (3);


-- 1 C

DELIMITER $
create procedure aindaVouDescobrir( VARcodFilme int )
	
begin

	declare msg varchar(200);

	if (VARcodFilme is null) then
	set msg = "Cod filme e Cod sala campos obrigatorios reveja seu insert. Obrigado";
else
	select count(f.cod_filme) from filme f 
    inner join sala s on f.cod_sala = s.cod_sala
    where VARcodFilme = f.cod_sala and VARcodFilme = s.cod_sala
    group by f.cod_filme;
    
    end if;
    

END $
DELIMITER ;

call aindaVouDescobrir (3);



-- 2
-- MAIS TEMPO EM EXIBIÇÃO, FILME

SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER |
	CREATE FUNCTION diasExbicao (dt_inicio date, dt_fim date)
RETURNS int
BEGIN
DECLARE qtdDias int;
	SET qtdDias=(select timestampdiff(day,dt_inicio,dt_fim));
RETURN qtdDias;
END |
Delimiter ;

select diasExbicao(data_inicio,data_termino) from Filme where Cod_Filme = 1;

-- 3
create table filme_BackUp(
codFilme int auto_increment primary Key,
Titulo varchar(100),
Duracao int,
Genero varchar(20),
Sinopse varchar(200),
dt_exclusao dateTIme, 
usuario varchar (30)
);


delimiter $
create trigger backUp_Filme  after update on Filme 		
for each row
begin
	
    
    if(old.Duracao!=new.Duracao or old.Titulo != new.Titulo or old.Genero != new.Genero or old.Sinopse != new.Sinopse) then
		insert into filme_BackUp values (old.Cod_Filme, old.Titulo, old.Duracao, old.Genero, old.Sinopse, now(), user());
    
    end if;

end $
delimiter ;

UPDATE Filme
SET Duracao = 205
WHERE Cod_Filme = 2;

-- https://classroom.google.com/w/NDY2MTc1NjkyNzM2/t/all
-- pg 11

use tanatela;

select * from Filme;
