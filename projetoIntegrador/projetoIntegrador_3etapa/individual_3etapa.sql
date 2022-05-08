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


DELIMITER $
create procedure attFilmeDuracao( VARcodFilme int, VARduracao int )
begin

-- falta fazer validação mgn não sai e consultas com cod invalido são feitas
    
	if (VARcodFilme is null ) then 
    select "Cod filme e Cod sala campos obrigatorios reveja seu insert. Obrigado" as msg;
    else 
		update Filme set Duracao =  VARduracao where Cod_Filme = VARcodFilme;
	end if ;
END $
DELIMITER ;

call attFilmeDuracao (1,202);

select * from Filme;

-- FALTA FAZER A LETRA 1 C

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














