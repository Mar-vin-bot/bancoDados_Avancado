DELIMITER $
create procedure insereFilme( VARcodFilme int , VARtitulo varchar(100) , VARduracao int, VARGenero varchar(20), VARsinopse varchar(250), VARdt_inicio date , VARdt_termino date, VARCodSala int )
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
create procedure attFilmeDuracao( VARcodFilme int , VARduracao int )
begin
	DECLARE buscaCodFilme int;
    
    SET buscaCodFilme = (SELECT buscaCodFilme from Filme) -- verificar tudo
    
	if (VARcodFilme is null or VARCodSala is null ) then 
    select "Cod filme e Cod sala campos obrigatorios reveja seu insert. Obrigado" as msg;
    else 
		insert into filme(Cod_Filme , Titulo, Duracao, Genero, Sinopse, data_inicio, data_termino, Cod_Sala) 
        values (VARcodFilme , VARtitulo , VARduracao,  VARGenero, VARsinopse, VARdt_inicio , VARdt_termino, VARCodSala);
        end if ;
END $
DELIMITER ;






