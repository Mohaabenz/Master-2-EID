-- ===================================================
-- Enrichissement des relations avec client.e.s CRM
-- ===================================================
-- MFB

-- Modification de la structure des données
-- Ajout d'une colonne de mots clés dans la table des clients
--

/* MOHAMED BEN SAAD 11400535
   ELIAS ABDELLI 11501114 */

SET SERVEROUTPUT ON

PROMPT =========================================================
PROMPT 
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice CRM               |
PROMPT |                                                       |
PROMPT =========================================================
PROMPT
PROMPT

PROMPT =========================================================
PROMPT Ceci permet d initialiser le type de la date
PROMPT =========================================================
ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
ALTER SESSION SET NLS_LANGUAGE=ENGLISH;
PROMPT =========================================================


-- Affichage des données ===================================================
-- en SQL 2 ================================================================
-- Affichage des lignes dans les tables ====================================

PROMPT
PROMPT =========================================================
PROMPT Affichage des tables de la bd EN SQL 2 
PROMPT =========================================================

SET TIMING ON;
SET LINES 1000
SET PAGES 1000

COLUMN CODCLI  FORMAT A6
COLUMN CIVCLI  FORMAT A8
COLUMN NOMCLI  FORMAT A8
COLUMN PRENCLI FORMAT A8
COLUMN CATCLI  FORMAT 99
COLUMN ADNCLI  FORMAT A6
COLUMN ADRCLI  FORMAT A10
COLUMN CPCLI   FORMAT A5
COLUMN VilCli  FORMAT A6
COLUMN PAYSCLI FORMAT A7
COLUMN MAILCLI FORMAT A10
COLUMN TELCLI  FORMAT A10

COLUMN NUMCOM  FORMAT A10
COLUMN DATCOM  FORMAT A28
COLUMN REFART  FORMAT A8
COLUMN NOMART  FORMAT A25
COLUMN PvArt   FORMAT 999.99
COLUMN QsArt   FORMAT 99
COLUMN PaArt   FORMAT 999.99
COLUMN QTCOM   FORMAT 99
COLUMN PUART   FORMAT 999.99
COLUMN REMISE  FORMAT 999.99

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> DETECTION DES ANOMALIE CLIENTS
PROMPT =========================================================
PROMPT

ALTER TABLE Clients
ADD KeyWordsCli VARCHAR(300);



UPDATE Clients SET KeyWordsCli='Voyages, Mangas, BasketBall, Musique' WHERE UPPER(CODCLI)='C001';
UPDATE Clients SET KeyWordsCli='Natation, Dessin, Voyages, Bandes Dessinees' WHERE UPPER(CODCLI)='C002';
UPDATE Clients SET KeyWordsCli='Cinema, football, Yoga, Mangas' WHERE UPPER(CODCLI)='C003';
UPDATE Clients SET KeyWordsCli='Mangas, football , Theatre, Cinema, Musique, Plongee sous marine' WHERE UPPER(CODCLI)='C004';
UPDATE Clients SET KeyWordsCli='Bandes Dessinees, Handball, Musique, Manga, foot, BasketBall' WHERE UPPER(CODCLI)='C005';
UPDATE Clients SET KeyWordsCli='Plongee sous marine, Mangas, Cinema, FOOTBALL' WHERE UPPER(CODCLI)='C006';
UPDATE Clients SET KeyWordsCli='Bandes Dessinees, football , Musique, Handball, Voyages' WHERE UPPER(CODCLI)='C007';
UPDATE Clients SET KeyWordsCli='Handball, football, BasketBall' WHERE UPPER(CODCLI)='C008';
UPDATE Clients SET KeyWordsCli='' WHERE UPPER(CODCLI)='C009';
UPDATE Clients SET KeyWordsCli='Handball, Theatre, Voyages, FOOTBALL' WHERE UPPER(CODCLI)='C010';
UPDATE Clients SET KeyWordsCli='Voyages, Mangas' WHERE UPPER(CODCLI)='C011';
UPDATE Clients SET KeyWordsCli='Voyages, FOOTBALL, BasketBall, Mangas' WHERE UPPER(CODCLI)='C012';
UPDATE Clients SET KeyWordsCli='Plongee sous marine, , Natation, , Cinema' WHERE UPPER(CODCLI)='C013';
UPDATE Clients SET KeyWordsCli='Foot, Natation, Mangas, Cinema' WHERE UPPER(CODCLI)='C014';
UPDATE Clients SET KeyWordsCli='FootBALL, Natation, Mangas, Cinema' WHERE UPPER(CODCLI)='C015';
UPDATE Clients SET KeyWordsCli='PARIS' WHERE UPPER(CODCLI)='C016';
UPDATE Clients SET KeyWordsCli='Plongee sous marine, Voyages, Plongee sous marine, FOOTBALL, Cinema' WHERE UPPER(CODCLI)='C017';
UPDATE Clients SET KeyWordsCli='FootBALL, Natation, Mangas, Cinema' WHERE UPPER(CODCLI)='C018';
COMMIT;


-- ======= MFB = Recherches d'information avancées ============== Recherche intelligenete =======================
/* 
-- Contacter les clients en faisant une recherche sur des mots clés !
-- Les client.e.s qui aiment le football et/ou les mangas (? Code, Nom, Prénom, KeyWordsCli)
Développez une procédure de nom RECHERCHEAVANCEE avec 3 paramètres : LaTable, LaColonne, MotsCles
qui permet de traiter les différents cas schématisés ci-dessous et de couvrir le maximum de cas possibles !
*/




CREATE OR REPLACE PROCEDURE RECHERCHE_AVANCEE(LaTable IN varchar2, LaColonne IN varchar2, MotsCles IN varchar2, Seuil IN Number)
	
	IS
	SEARCH 	     VARCHAR(100) := '%'; 
	DEBUT        NUMBER(5) := 1;
  	FIN          NUMBER(5);
  	LONGUEUR     NUMBER(5) := LENGTH( MOTSCLES );
  	DELIMITEUR   NUMBER(5) := 3;
   	Delim	     VARCHAR(4); 


	BEGIN
		-- Choix du délimiteur
		DBMS_OUTPUT.PUT_LINE(UPPER(MOTSCLES));
		IF MOTSCLES LIKE '%+%' THEN
			Delim := ' + ';
		ELSIF MOTSCLES LIKE '%*%' THEN
			Delim := ' * ';
		ELSIF MOTSCLES LIKE '%/%' THEN
			Delim := ' / ';
		ELSIF MOTSCLES LIKE '%,%' THEN
			Delim := ' , ';
		END IF;
		--Decoupage du mots clés 
		IF LONGUEUR > 0 THEN
			FIN := INSTR( MOTSCLES, Delim, DEBUT );
			WHILE FIN > 0 LOOP
			SEARCH := SEARCH || (SUBSTR(MOTSCLES, DEBUT, SEUIL)) || '%';
			DEBUT := FIN + DELIMITEUR;
			FIN := INSTR( MOTSCLES, Delim, DEBUT );
			END LOOP;
			IF DEBUT <= LONGUEUR + 1 THEN
			SEARCH := SEARCH || (SUBSTR( MOTSCLES, DEBUT, SEUIL )) || '%';
			END IF;
			SEARCH := UPPER(SEARCH);
		END IF;
		DBMS_OUTPUT.PUT_LINE(SUBSTR(SEARCH, 1, 5));
		DBMS_OUTPUT.PUT_LINE(SUBSTR(SEARCH, 5, 9));
--		 POUR UN DELIMITEUR DE TYPE "*" -et		
		IF Delim = ' * ' THEN
			FOR RES IN (SELECT CODCLI,KeyWordsCli FROM CLIENTS WHERE UPPER(KeyWordsCli) LIKE TO_CHAR(SUBSTR(SEARCH, 1, 5)) AND UPPER(KeyWordsCli) LIKE TO_CHAR(SUBSTR(SEARCH, 5, 9)))
			LOOP
				DBMS_OUTPUT.PUT_LINE(UPPER(RES.CODCLI) || ' ' || UPPER(RES.KeyWordsCli));
			END LOOP;
--		 POUR UN DELIMITEUR DE TYPE "+" - ou
		ELSIF Delim = ' + ' THEN
			FOR RES IN (SELECT CODCLI,KeyWordsCli FROM CLIENTS WHERE UPPER(KeyWordsCli) LIKE TO_CHAR(SUBSTR(SEARCH, 1, 5)) OR UPPER(KeyWordsCli) LIKE TO_CHAR(SUBSTR(SEARCH, 5, 9)))
			LOOP
				DBMS_OUTPUT.PUT_LINE(UPPER(RES.CODCLI) || ' ' || UPPER(RES.KeyWordsCli));
			END LOOP;


--		 POUR UN DELIMITEUR DE TYPE "/"	- xor		
		ELSIF Delim = ' / ' THEN
			FOR RES IN (SELECT CODCLI,KeyWordsCli FROM ((SELECT c1.CODCLI,c1.KeyWordsCli  FROM CLIENTS c1 WHERE UPPER(c1.KeyWordsCli) LIKE SUBSTR(SEARCH, 1, 5)) 
								     UNION
	       							    (SELECT c2.CODCLI,c2.KeyWordsCli FROM CLIENTS c2 WHERE UPPER(c2.KeyWordsCli) LIKE SUBSTR(SEARCH, 5, 9)))
				    WHERE UPPER(KeyWordsCli) NOT LIKE SUBSTR(SEARCH, 1, 5) OR UPPER(KeyWordsCli) NOT LIKE SUBSTR(SEARCH, 5, 9))
			LOOP
				DBMS_OUTPUT.PUT_LINE(UPPER(RES.CODCLI) || ' ' || UPPER(RES.KeyWordsCli));
			END LOOP;
		-- POUR UN DELIMITEUR DE TYPE "," -et			
		ELSIF Delim = ' , ' THEN
			FOR RES IN (SELECT CODCLI,KeyWordsCli FROM CLIENTS WHERE UPPER(KeyWordsCli) LIKE TO_CHAR(SUBSTR(SEARCH, 1, 5)) AND UPPER(KeyWordsCli) LIKE TO_CHAR(SUBSTR(SEARCH, 5, 9)))
			LOOP
				DBMS_OUTPUT.PUT_LINE(UPPER(RES.CODCLI) || ' ' || UPPER(RES.KeyWordsCli));
			END LOOP;			
		END IF;		
			DBMS_OUTPUT.PUT_LINE(SEARCH);
		
	END;
/

PROMPT =========================================================
PROMPT >> Exemples avec 2 mots clés (on connait le nom de la colonne sur laquelle devrait porter la recherche : KeyWordsCli)
PROMPT >> A20. Les client.e.s qui aiment le football et les mangas (les deux obligatoirement : football * mangas)
PROMPT =========================================================
PROMPT


EXEC RECHERCHE_AVANCEE('CLIENTS','KeyWordsCli','FootBALL , Mangas',3);
/*
FOOTBALL , MANGAS
%FOO%
%MAN%
C003 CINEMA, FOOTBALL, YOGA, MANGAS
C004 MANGAS, FOOTBALL , THEATRE, CINEMA, MUSIQUE, PLONGEE SOUS MARINE
C005 BANDES DESSINEES, HANDBALL, MUSIQUE, MANGA, FOOT, BASKETBALL
C006 PLONGEE SOUS MARINE, MANGAS, CINEMA, FOOTBALL
C012 VOYAGES, FOOTBALL, BASKETBALL, MANGAS
C014 FOOT, NATATION, MANGAS, CINEMA
C015 FOOTBALL, NATATION, MANGAS, CINEMA
C018 FOOTBALL, NATATION, MANGAS, CINEMA
%FOO%MAN%


*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> A21. Les client.e.s qui aiment le football ou les mangas (soit le football soit les mangas, un seul suffit : football + mangas)
PROMPT =========================================================
PROMPT


SELECT UPPER(CODCLI),UPPER(KeyWordsCli) FROM CLIENTS WHERE UPPER(KeyWordsCli) LIKE '%FOO%' OR UPPER(KeyWordsCli) LIKE '%MAN%';

/*

UPPER(CODC UPPER(KEYWORDSCLI)
---------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
C001	   VOYAGES, MANGAS, BASKETBALL, MUSIQUE
C003	   CINEMA, FOOTBALL, YOGA, MANGAS
C004	   MANGAS, FOOTBALL , THEATRE, CINEMA, MUSIQUE, PLONGEE SOUS MARINE
C005	   BANDES DESSINEES, HANDBALL, MUSIQUE, MANGA, FOOT, BASKETBALL
C006	   PLONGEE SOUS MARINE, MANGAS, CINEMA, FOOTBALL
C007	   BANDES DESSINEES, FOOTBALL , MUSIQUE, HANDBALL, VOYAGES
C008	   HANDBALL, FOOTBALL, BASKETBALL
C010	   HANDBALL, THEATRE, VOYAGES, FOOTBALL
C011	   VOYAGES, MANGAS
C012	   VOYAGES, FOOTBALL, BASKETBALL, MANGAS
C014	   FOOT, NATATION, MANGAS, CINEMA
C015	   FOOTBALL, NATATION, MANGAS, CINEMA
C017	   PLONGEE SOUS MARINE, VOYAGES, PLONGEE SOUS MARINE, FOOTBALL, CINEMA
C018	   FOOTBALL, NATATION, MANGAS, CINEMA


*/



EXEC RECHERCHE_AVANCEE('CLIENTS','KeyWordsCli','FootBALL + Mangas',3);

/*

FOOTBALL + MANGAS
%FOO%
%MAN%
C001 VOYAGES, MANGAS, BASKETBALL, MUSIQUE
C003 CINEMA, FOOTBALL, YOGA, MANGAS
C004 MANGAS, FOOTBALL , THEATRE, CINEMA, MUSIQUE, PLONGEE SOUS MARINE
C005 BANDES DESSINEES, HANDBALL, MUSIQUE, MANGA, FOOT, BASKETBALL
C006 PLONGEE SOUS MARINE, MANGAS, CINEMA, FOOTBALL
C007 BANDES DESSINEES, FOOTBALL , MUSIQUE, HANDBALL, VOYAGES
C008 HANDBALL, FOOTBALL, BASKETBALL
C010 HANDBALL, THEATRE, VOYAGES, FOOTBALL
C011 VOYAGES, MANGAS
C012 VOYAGES, FOOTBALL, BASKETBALL, MANGAS
C014 FOOT, NATATION, MANGAS, CINEMA
C015 FOOTBALL, NATATION, MANGAS, CINEMA
C017 PLONGEE SOUS MARINE, VOYAGES, PLONGEE SOUS MARINE, FOOTBALL, CINEMA
C018 FOOTBALL, NATATION, MANGAS, CINEMA
%FOO%MAN%

*/




PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> A22. Les client.e.s qui aiment soit le football soit les mangas mais pas les deux ensemble (le ou exclusif : football / mangas)
PROMPT =========================================================
PROMPT

SELECT UPPER(CODCLI),UPPER(KeyWordsCli) FROM (
				(SELECT c1.CODCLI,c1.KeyWordsCli  FROM CLIENTS c1 WHERE UPPER(c1.KeyWordsCli) LIKE '%FOO%' ) 
				UNION
	       			(SELECT c2.CODCLI,c2.KeyWordsCli FROM CLIENTS c2 WHERE UPPER(c2.KeyWordsCli) LIKE '%MAN%')
				)
WHERE UPPER(KeyWordsCli) NOT LIKE '%FOO%' OR UPPER(KeyWordsCli) NOT LIKE '%MAN%';



/*

UPPER(CODC UPPER(KEYWORDSCLI)
---------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
C001	   VOYAGES, MANGAS, BASKETBALL, MUSIQUE
C007	   BANDES DESSINEES, FOOTBALL , MUSIQUE, HANDBALL, VOYAGES
C008	   HANDBALL, FOOTBALL, BASKETBALL
C010	   HANDBALL, THEATRE, VOYAGES, FOOTBALL
C011	   VOYAGES, MANGAS
C017	   PLONGEE SOUS MARINE, VOYAGES, PLONGEE SOUS MARINE, FOOTBALL, CINEMA


*/

EXEC RECHERCHE_AVANCEE('CLIENTS','KeyWordsCli','FootBALL / Mangas',3);

/*

FOOTBALL / MANGAS
%FOO%
%MAN%
C001 VOYAGES, MANGAS, BASKETBALL, MUSIQUE
C007 BANDES DESSINEES, FOOTBALL , MUSIQUE, HANDBALL, VOYAGES
C008 HANDBALL, FOOTBALL, BASKETBALL
C010 HANDBALL, THEATRE, VOYAGES, FOOTBALL
C011 VOYAGES, MANGAS
C017 PLONGEE SOUS MARINE, VOYAGES, PLONGEE SOUS MARINE, FOOTBALL, CINEMA
%FOO%MAN%



*/




PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Exemples avec 3 mots clés (on connait le nom de la colonne sur laquelle devrait porter la recherche : KeyWordsCli)
PROMPT >> A30. Les client.e.s qui aiment (*) :  Voyages, FOOTBALL, BasketBall (-->>>  Voyages * FOOTBALL * BasketBall)
PROMPT =========================================================
PROMPT

EXEC RECHERCHE_AVANCEE('CLIENTS','KeyWordsCli','Voyages * FOOTBALL',3);

/*

VOYAGES * FOOTBALL
%VOY%
%FOO%
C007 BANDES DESSINEES, FOOTBALL , MUSIQUE, HANDBALL, VOYAGES
C010 HANDBALL, THEATRE, VOYAGES, FOOTBALL
C012 VOYAGES, FOOTBALL, BASKETBALL, MANGAS
C017 PLONGEE SOUS MARINE, VOYAGES, PLONGEE SOUS MARINE, FOOTBALL, CINEMA
%VOY%FOO%

*/



PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> A30. Les client.e.s qui aiment (+) :  Voyages, FOOTBALL, BasketBall (-->>>  Voyages + FOOTBALL + BasketBall)
PROMPT =========================================================
PROMPT

EXEC RECHERCHE_AVANCEE('CLIENTS','KeyWordsCli','Voyages + FOOTBALL',3);


/*

VOYAGES + FOOTBALL
%VOY%
%FOO%
C001 VOYAGES, MANGAS, BASKETBALL, MUSIQUE
C002 NATATION, DESSIN, VOYAGES, BANDES DESSINEES
C003 CINEMA, FOOTBALL, YOGA, MANGAS
C004 MANGAS, FOOTBALL , THEATRE, CINEMA, MUSIQUE, PLONGEE SOUS MARINE
C005 BANDES DESSINEES, HANDBALL, MUSIQUE, MANGA, FOOT, BASKETBALL
C006 PLONGEE SOUS MARINE, MANGAS, CINEMA, FOOTBALL
C007 BANDES DESSINEES, FOOTBALL , MUSIQUE, HANDBALL, VOYAGES
C008 HANDBALL, FOOTBALL, BASKETBALL
C010 HANDBALL, THEATRE, VOYAGES, FOOTBALL
C011 VOYAGES, MANGAS
C012 VOYAGES, FOOTBALL, BASKETBALL, MANGAS
C014 FOOT, NATATION, MANGAS, CINEMA
C015 FOOTBALL, NATATION, MANGAS, CINEMA
C017 PLONGEE SOUS MARINE, VOYAGES, PLONGEE SOUS MARINE, FOOTBALL, CINEMA
C018 FOOTBALL, NATATION, MANGAS, CINEMA
%VOY%FOO%


*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> A30. Les client.e.s qui aiment (/) :  Voyages, FOOTBALL, BasketBall (-->>>  Voyages / FOOTBALL / BasketBall)
PROMPT =========================================================
PROMPT

EXEC RECHERCHE_AVANCEE('CLIENTS','KeyWordsCli','Voyages / FOOTBALL',3);

/*

VOYAGES / FOOTBALL
%VOY%
%FOO%
C001 VOYAGES, MANGAS, BASKETBALL, MUSIQUE
C002 NATATION, DESSIN, VOYAGES, BANDES DESSINEES
C003 CINEMA, FOOTBALL, YOGA, MANGAS
C004 MANGAS, FOOTBALL , THEATRE, CINEMA, MUSIQUE, PLONGEE SOUS MARINE
C005 BANDES DESSINEES, HANDBALL, MUSIQUE, MANGA, FOOT, BASKETBALL
C006 PLONGEE SOUS MARINE, MANGAS, CINEMA, FOOTBALL
C008 HANDBALL, FOOTBALL, BASKETBALL
C011 VOYAGES, MANGAS
C014 FOOT, NATATION, MANGAS, CINEMA
C015 FOOTBALL, NATATION, MANGAS, CINEMA
C018 FOOTBALL, NATATION, MANGAS, CINEMA
%VOY%FOO%



*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Exemples où on connait PAS le nom de la colonne sur laquelle devrait porter la recherche (une des n colonnes d une table !)
PROMPT >> A40. Les client.e.s pour lesquels le mots Paris est cité (cela peut être le nom ou le Prénom ou la ville ou encore les mots clés; on ne sait pas!)
PROMPT =========================================================
PROMPT

-- ======= MFB = Recherches d'information avancées ============== Recherche intelligenete =======================

