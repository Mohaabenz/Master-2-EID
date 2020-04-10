-- ===================================================
-- From a CSV file TO a TABLE with columns
-- ===================================================
-- MFB

SET SERVEROUTPUT ON

/**********************************************************************************************************/

/************************************************/
/*						*/
/*     		CHOIX DU CSVFILE		*/
/*						*/
/************************************************/


CREATE OR REPLACE PROCEDURE CHOIXCSV(LaTable IN VARCHAR2)
AS
	BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE TMP';
		EXECUTE IMMEDIATE 'CREATE TABLE TMP AS (SELECT * FROM '||LaTable||')';
	
	END;
/
/**********************************************************************************************************/

/************************************************/
/*						*/
/*      	  Prétraitement			*/
/*						*/
/************************************************/


CREATE OR REPLACE PROCEDURE TRANS
IS
	CURSOR TAILLE IS SELECT * FROM TMP;
	UPDATES VARCHAR2(2000);
	UP VARCHAR2(2000);
	UP1 VARCHAR2(2000);
	BEGIN
		FOR RES IN TAILLE
		LOOP
			UP1 := 	REPLACE(RES.COL,'''','''''');	
			--UPDATES := REPLACE(RES.COL,', ',';');
			FOR C IN 1..10 LOOP
			UPDATES := REPLACE(RES.COL,';;','; ;');
			END LOOP;
			UPDATES := REPLACE(UPDATES,'''',' ');					
			IF SUBSTR(UPDATES,-1)=';' THEN
				UPDATES := SUBSTR(UPDATES,1,LENGTH(UPDATES)-1);
			END IF;
			UP := 'UPDATE TMP SET COL= '||chr(39)||UPDATES||chr(39)||' WHERE COL LIKE '||chr(39)||'%'||UP1||'%'||chr(39) ;
			EXECUTE IMMEDIATE UP;
		END LOOP;
	END;
/


/**********************************************************************************************************/

/************************************************/
/*						*/
/*      COMPTAGE DU NOMBRE DE COLONNES		*/
/*      Cette fonction est utilisé dans		*/
/*	la plupart des fonction et proc		*/
/*						*/
/************************************************/


CREATE OR REPLACE FUNCTION NOMBRE_COLONNE(LaTable varchar2,LaColonne varchar2)
RETURN NUMBER
IS
	NBCOL	NUMBER(5);
	BEGIN

		EXECUTE IMMEDIATE 'SELECT REGEXP_COUNT('||LaColonne||', '';'')
				   FROM '||LaTable||'
				   WHERE REGEXP_COUNT('||LaColonne||', '';'') = 
                       		   (SELECT MAX(REGEXP_COUNT('||LaColonne||', '';'')) FROM '||LaTable||')
                         	   AND ROWNUM = 1' INTO NBCOL;
                --DBMS_OUTPUT.PUT_LINE(NBCOL);
                RETURN(NBCOL+1);
	END;
/


/************************************************/
/*						*/
/*	Transformation de CSVfile en une	*/
/*	nouvelle fragmenter en plusieurs	*/
/*	           colonnes			*/
/*						*/
/************************************************/


CREATE OR REPLACE PROCEDURE CSVToTable(LaTable IN varchar2, LaColonne IN VARCHAR2, LaTable2 IN VARCHAR2)
	
	IS
	CURSOR TAILLE IS SELECT * FROM TMP;
	NBCOL 	     NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
	INSER2	     VARCHAR2(2000) ; 
	INSER	     VARCHAR2(2000) ; 
	DEBUT	     NUMBER(5) := 1;
	FIN          NUMBER(5) := 0;
	LIGNE	     NUMBER(5) := 1;
   	II  	     NUMBER(5) := 1;


	BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE ' || LaTable2;
		-- Creation de la TABLE avec une première colonne
		EXECUTE IMMEDIATE 'CREATE TABLE ' || Latable2 || '(DATASOURCE VARCHAR2(2000))';
		FOR RES IN 1..NBCOL
		LOOP
			-- Creation de nouvelle colonnes avec le bon nombre supposé
			INSER := INSER || 'COL'|| RES  || ',';
			EXECUTE IMMEDIATE 'ALTER TABLE ' || Latable2 || ' ADD COL'|| RES || ' VARCHAR2(50)';
		END LOOP;
		FOR RES IN TAILLE
		LOOP	
			--Debut des Insertion avec le découpage des attributs
			II := 1;
			INSER2 := 'INSERT INTO ' || LaTable2 || '(DATASOURCE,';
			DEBUT := 1;
			INSER := ' VALUES('||chr(39)|| RES.COL||chr(39)||',';
			FIN := INSTR(RES.COL, ';', DEBUT );
			WHILE FIN > 0 LOOP
				INSER2 := INSER2 || 'COL' || II || ',';
	      			INSER := INSER || chr(39) || (SUBSTR(RES.COL, DEBUT, FIN - DEBUT)) || chr(39) || ',';
	      			DEBUT := FIN+1;
	      			FIN := INSTR( RES.COL, ';', DEBUT);
	      			II := II + 1;
	      		END LOOP;
			IF DEBUT <= LENGTH(RES.COL)+1 THEN
				INSER := INSER || chr(39) || (SUBSTR(RES.COL, DEBUT, LENGTH(RES.COL)));
			END IF;
			INSER2 := INSER2 || 'COL' || II || ')';
			INSER := INSER2 || INSER || chr(39) ||')';
			
			EXECUTE IMMEDIATE INSER;
			--DBMS_OUTPUT.PUT_LINE(INSER);
		END LOOP;		
	END;
/



/**********************************************************************************************************/

/************************************************/
/*						*/
/*	CREATION D'UNE TABLE PAR COLONNES	*/
/*	 AVEC SON REMPLISSAGE AUTOMATIQUE	*/
/*	A L'AIDE DES FONCTIONS PRECEDENTES	*/
/*	AVANT LA CORRECTION DES NEWVALUES	*/
/*						*/
/************************************************/



CREATE OR REPLACE PROCEDURE TYPAGE(LaTable varchar2, LaColonne varchar2, LaTable2 varchar2)
	IS
	CURSOR TAILLE IS SELECT * FROM TMP;
	VIEWI		VARCHAR2(500);
	NBCOL 		NUMBER(5) := NOMBRE_COLONNE(LaTable, LaColonne);
	REFER	 	VARCHAR2(100) := LaTable;
	OLD 		VARCHAR2(100);
	SYNTAX		VARCHAR2(100);
	COLUMNW 	NUMBER(5);
	NUMBERO 	NUMBER(2);
	OBSER 		VARCHAR2(100);
	NEWV 		VARCHAR2(100);
	SEMANTICC 	VARCHAR2(100);
	SEMANTICS 	VARCHAR2(100);
	ID		NUMBER(5):=1;
	BEGIN		
--		DBMS_OUTPUT.PUT_LINE(NBCOL);      		
		FOR I IN 1..NBCOL
		LOOP
			--DBMS_OUTPUT.PUT_LINE(I);
			EXECUTE IMMEDIATE ' DROP TABLE DR_CSVFile_Col_' ||I;
			EXECUTE IMMEDIATE 'CREATE TABLE DR_CSVFile_Col_'||I||' 
					 (
						IDJOIN NUMBER(5),
						REFERENCES VARCHAR2(200),
						OLDVALUES VARCHAR2(100),
						SYNTACTICTYPE VARCHAR2(100),
						COLUMNWIDHT NUMBER(5),
						NUMBEROFWORDS NUMBER(2),
						OBSERVATION VARCHAR2(100),
						NEWVALUES VARCHAR2(100),
						SEMANTICCATEGORY VARCHAR2(100),
						SEMANTICSUBCATEGORY VARCHAR2(100)
					)';
		END LOOP; 
		FOR RES IN TAILLE
		LOOP
			FOR I IN 1..NBCOL
			LOOP 		
				OLD := REGEXP_SUBSTR(RES.COL,'[^;]+',1,I);
				COLUMNW := LENGTH(OLD);
				SYNTAX := VerifSyntax(OLD);
				NUMBERO := REGEXP_COUNT(OLD,' ')+1;
				SEMANTICC := VerifCategory(OLD,1);
				SEMANTICS :=  VerifCategory(OLD,2);
				IF OLD IS NULL OR OLD = ' 'THEN
					OLD := '';
					SYNTAX := 'NULL';
					NUMBERO := 0;
					COLUMNW := 0;
					SEMANTICC := 'NULL';
					SEMANTICS := 'NULL';
				END IF;		
				VIEWI :=  'INSERT INTO DR_CSVFile_Col_'||I||'
				(IDJOIN,REFERENCES,OLDVALUES,SYNTACTICTYPE, COLUMNWIDHT,NUMBEROFWORDS,SEMANTICCATEGORY,SEMANTICSUBCATEGORY) VALUES
				('
				 || chr(39) || ID	 ||  chr(39) ||','
				 || chr(39) || REFER 	 ||  '_'    || SYSDATE ||'_DR_CSVFile_Col_'||I|| chr(39) ||','
				 || chr(39) || OLD       || chr(39) ||','
				 || chr(39) || SYNTAX    || chr(39) ||',' 
				 || chr(39) || COLUMNW   || chr(39) ||','
				 || chr(39) || NUMBERO   || chr(39) ||','
				 || chr(39) || SEMANTICC || chr(39) ||','
				 || chr(39) || SEMANTICS || chr(39) ||
				 ')';
				--DBMS_OUTPUT.PUT_LINE(VIEWI); 
				EXECUTE IMMEDIATE VIEWI;

			END LOOP;
			ID := ID+1;		
		END LOOP;
				
	END;
/

/**********************************************************************************************************/

/************************************************/
/*						*/
/*       FONCTION DE HOMOGEINISATION DATE	*/
/*						*/
/************************************************/

CREATE OR REPLACE PROCEDURE HOMODATE(LaTable IN VARCHAR2, LaColonne IN VARCHAR2) 
    IS
	CURSOR C1 IS SELECT * FROM TMP;
    	NBCOL 		NUMBER(5);
	DATEOLD 	VARCHAR2(200);
	DATENEW		VARCHAR2(200);
    	REGDATEFR     	VARCHAR2(200);
    	REGDATEFRJ    	VARCHAR2(200);
    	REGDATEAM     	VARCHAR2(200);
    	HOMOF		VARCHAR2(200);
	BEGIN	
	
		SELECT REGULAREXPR INTO REGDATEFR FROM CATEGORYTYPE WHERE CATEGORY='DATEFR' AND SUBCATEGORY='DATEALPHA' ;
		SELECT REGULAREXPR INTO REGDATEFRJ FROM CATEGORYTYPE WHERE CATEGORY='DATEFR' AND SUBCATEGORY='DATEALPHAJ' ;	
		SELECT REGULAREXPR INTO REGDATEAM FROM CATEGORYTYPE WHERE CATEGORY='DATEAM' AND SUBCATEGORY='DATEALPHA' ;		
		SELECT REGULAREXPR INTO HOMOF FROM CATEGORYTYPE WHERE CATEGORY='DATEFR' AND SUBCATEGORY='DATENUM';
	    	FOR RES IN C1
			LOOP
		    NBCOL := NOMBRE_COLONNE(LaTable,LaColonne);
		    FOR I IN 1..NBCOL
				LOOP 
		        DATENEW := REGEXP_SUBSTR(RES.COL,'[^;]+',1,I);
			DATEOLD := DATENEW;
			
			DATENEW := REPLACE(UPPER(DATENEW),'LUNDI','');
			DATENEW := REPLACE(UPPER(DATENEW),'MARDI','');
			DATENEW := REPLACE(UPPER(DATENEW),'MERCREDI','');
			DATENEW := REPLACE(UPPER(DATENEW),'JEUDI','');
			DATENEW := REPLACE(UPPER(DATENEW),'VENDREDI','');
			DATENEW := REPLACE(UPPER(DATENEW),'SAMEDI','');
			DATENEW := REPLACE(UPPER(DATENEW),'DIMANCHE','');

			DATENEW := REPLACE(UPPER(DATENEW),'MONDAY','');
			DATENEW := REPLACE(UPPER(DATENEW),'TUESDAY','');
			DATENEW := REPLACE(UPPER(DATENEW),'WEDNESDAY','');
			DATENEW := REPLACE(UPPER(DATENEW),'THURSDAY','');
			DATENEW := REPLACE(UPPER(DATENEW),'FRIDAY','');
			DATENEW := REPLACE(UPPER(DATENEW),'SATURDAY','');
			DATENEW := REPLACE(UPPER(DATENEW),'SUNDAY','');
																								
		        IF REGEXP_LIKE (UPPER(DATENEW), REGDATEFR) OR REGEXP_LIKE (UPPER(DATENEW), REGDATEAM) OR REGEXP_LIKE (UPPER(DATENEW), REGDATEFRJ) THEN
		            IF REGEXP_LIKE (UPPER(DATENEW), 'JANVIER') OR REGEXP_LIKE (UPPER(DATENEW), 'JANUARY') OR REGEXP_LIKE (UPPER(DATENEW), 'JAN') OR REGEXP_LIKE (UPPER(DATENEW), 'JANV') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'JANVIER','01');
		                DATENEW := REPLACE(UPPER(DATENEW),'JANUARY','01');
       		                DATENEW := REPLACE(UPPER(DATENEW),'JANV','01');
		                DATENEW := REPLACE(UPPER(DATENEW),'JAN','01');                               		                                                                
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'FÉVRIER') OR REGEXP_LIKE (UPPER(DATENEW), 'FEBRUARY') 
		            OR REGEXP_LIKE (UPPER(DATENEW), 'FEVRIER') OR REGEXP_LIKE (UPPER(DATENEW), 'FÉV') OR REGEXP_LIKE (UPPER(DATENEW), 'FEB') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'FÉVRIER','02');
		                DATENEW := REPLACE(UPPER(DATENEW),'FEVRIER','02');		                
		                DATENEW := REPLACE(UPPER(DATENEW),'FEBRUARY','02');
		                DATENEW := REPLACE(UPPER(DATENEW),'FÉV','02');		                
		                DATENEW := REPLACE(UPPER(DATENEW),'FEB','02');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'MARS') OR REGEXP_LIKE (UPPER(DATENEW), 'MARCH') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'MARS','03');
		                DATENEW := REPLACE(UPPER(DATENEW),'MARCH','03');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'AVRIL') OR REGEXP_LIKE (UPPER(DATENEW), 'APRIL') OR REGEXP_LIKE (UPPER(DATENEW), 'APR') OR REGEXP_LIKE (UPPER(DATENEW), 'AVR') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'AVRIL','04');
		                DATENEW := REPLACE(UPPER(DATENEW),'APRIL','04');		              
		                DATENEW := REPLACE(UPPER(DATENEW),'AVR','04');
		                DATENEW := REPLACE(UPPER(DATENEW),'APR','04');		               
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), '-MAI-') OR REGEXP_LIKE (UPPER(DATENEW), '-MAY-') OR REGEXP_LIKE (UPPER(DATENEW), '/MAI/') OR REGEXP_LIKE (UPPER(DATENEW), '/MAY/') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'-MAI-','-05-');
		                DATENEW := REPLACE(UPPER(DATENEW),'MAY','05');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'JUIN') OR REGEXP_LIKE (UPPER(DATENEW), 'JUNE') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'JUIN','06');
		                DATENEW := REPLACE(UPPER(DATENEW),'JUNE','06');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'JUILLET') OR REGEXP_LIKE (UPPER(DATENEW), 'JULY') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'JUILLET','07');
		                DATENEW := REPLACE(UPPER(DATENEW),'JULY','07');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'AOÛT') OR REGEXP_LIKE (UPPER(DATENEW), 'AUGUST') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'AOÛT','08');
		                DATENEW := REPLACE(UPPER(DATENEW),'AUGUST','08');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'SEPTEMBRE') OR REGEXP_LIKE (UPPER(DATENEW), 'SEPTEMBER') OR REGEXP_LIKE (UPPER(DATENEW), 'SEPT') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'SEPTEMBRE','09');
		                DATENEW := REPLACE(UPPER(DATENEW),'SEPTEMBER','09');
		                DATENEW := REPLACE(UPPER(DATENEW),'SEPT','09');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'OCTOBRE') OR REGEXP_LIKE (UPPER(DATENEW), 'OCTOBER') OR REGEXP_LIKE (UPPER(DATENEW), 'OCT') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'OCTOBRE','10');
		                DATENEW := REPLACE(UPPER(DATENEW),'OCTOBER','10');
		                DATENEW := REPLACE(UPPER(DATENEW),'OCT','10');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;
		            IF REGEXP_LIKE (UPPER(DATENEW), 'NOVEMBRE') OR REGEXP_LIKE (UPPER(DATENEW), 'NOVEMBER') OR REGEXP_LIKE (UPPER(DATENEW), 'NOV') THEN
		                
		                DATENEW := REPLACE(UPPER(DATENEW),'NOVEMBRE','11');
		                DATENEW := REPLACE(UPPER(DATENEW),'NOVEMBER','11');
		                DATENEW := REPLACE(UPPER(DATENEW),'NOV','11');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		            END IF;

		            IF REGEXP_LIKE (UPPER(DATENEW), 'DÉCEMBRE') OR REGEXP_LIKE (DATENEW, 'décembre') OR REGEXP_LIKE (UPPER(DATENEW), 'DECEMBER') 
		            						OR REGEXP_LIKE (UPPER(DATENEW), '-DEC-') OR REGEXP_LIKE (UPPER(DATENEW), '-DÉC-') 
		            						OR REGEXP_LIKE (UPPER(DATENEW), '/DEC/') OR REGEXP_LIKE (UPPER(DATENEW), '/DÉC/') THEN
		                DATENEW := REPLACE(UPPER(DATENEW),'DECEMBRE','12');
       		                DATENEW := REPLACE(UPPER(DATENEW),'DÉCEMBRE','12');
       		                DATENEW := REPLACE(UPPER(DATENEW),'décembre','12');       		                
		                DATENEW := REPLACE(UPPER(DATENEW),'DECEMBER','12');
		                DATENEW := REPLACE(UPPER(DATENEW),'déc','12');		                
		                DATENEW := REPLACE(UPPER(DATENEW),'DÉC','12');
		                DATENEW := REPLACE(UPPER(DATENEW),'DEC','12');
		            	EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);		                           
		            END IF;
		            DATENEW := REPLACE(UPPER(DATENEW),'-','/');
		            EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);		            	

		        END IF;
		        IF REGEXP_LIKE (UPPER(DATENEW), HOMOF) THEN
		            DATENEW := REPLACE(UPPER(DATENEW),'-','/');
		            EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||DATENEW||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DATEOLD||'%'||chr(39);
		        END IF;
		    END LOOP;
		END LOOP;
		
	END;
/
/**********************************************************************************************************/

/************************************************/
/*						*/
/*       FONCTION DE CONVERTION °F EN °C	*/
/*						*/
/************************************************/


CREATE OR REPLACE FUNCTION F2C(DEGRE FLOAT) 
RETURN FLOAT
IS
	FAHRENHEIT	FLOAT(5) := DEGRE;
	RESULT 		FLOAT(5);
	BEGIN 
		RESULT := (DEGRE-32.00)*5.0/9.0;
		RETURN(RESULT);
	END;
/

/************************************************/
/*						*/
/*       PROCEDURE DE CONVERTION °F EN °C	*/
/*	     ET AJOUT DANS NEWVALUES		*/
/*						*/
/************************************************/

CREATE OR REPLACE PROCEDURE FAHRENHEIT_TO_CELCIUS(LaTable IN VARCHAR2, LaColonne IN VARCHAR2)
IS 	CURSOR TAILLE IS SELECT * FROM TMP;
	NBCOL 		NUMBER(5) ;
	DEGRE 		VARCHAR2(100) :='';
	DEGRET 		VARCHAR2(100):='';
	FAHRENHEIT 	NUMBER(5);
	CELCIUS 	VARCHAR2(10);
	TEST		NUMBER(5) := 0;
	
	BEGIN
		FOR RES IN TAILLE 
		LOOP 			
			NBCOL := NOMBRE_COLONNE(LaTable,LaColonne);
			FOR I IN 1..NBCOL
			LOOP
				TEST := 0;
				DEGRE := REGEXP_SUBSTR(RES.COL,'[^;]+',1,I);
				DEGRET := DEGRE;
				IF REGEXP_LIKE (DEGRE, '°F$') OR REGEXP_LIKE (UPPER(DEGRE), 'CELCIUS$')
							      OR REGEXP_LIKE (UPPER(DEGRE), '°CELCIUS$') 
							      OR REGEXP_LIKE (DEGRE, '°c$') 
							      OR REGEXP_LIKE (DEGRE, '°C$') THEN
--					DBMS_OUTPUT.PUT_LINE(DEGRE);
					DEGRE := REPLACE(DEGRE,' ','');
					DEGRE := REPLACE(DEGRE,'.',',');
					IF REGEXP_LIKE (DEGRE, '°c$') AND TEST = 0 THEN
					EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||UPPER(DEGRE)||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DEGRET||'%'||chr(39);
					TEST:=1;
					END IF;
					IF REGEXP_LIKE (DEGRE, '°C$') AND TEST = 0 THEN
					EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||UPPER(DEGRE)||chr(39)||' WHERE OLDVALUES LIKE '||chr(39)||'%'||DEGRET||'%'||chr(39);
					TEST:=1;
					END IF;
					IF REGEXP_LIKE (DEGRE, '°F$') AND TEST = 0 THEN
						FAHRENHEIT := REPLACE(DEGRE, '°F', '');
						FAHRENHEIT := F2C(FAHRENHEIT);
--						DBMS_OUTPUT.PUT_LINE(FAHRENHEIT);
						CELCIUS := TO_CHAR(FAHRENHEIT);
						CELCIUS := CELCIUS || '°C';				
						EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||CELCIUS||chr(39)||
											   'WHERE OLDVALUES LIKE '||chr(39)||'%'||DEGRET||'%'||chr(39);
						TEST := 1;
					END IF;
					DEGRE := REPLACE(UPPER(DEGRE), '°', '');
					IF REGEXP_LIKE (UPPER(DEGRE), 'CELCIUS$') AND TEST = 0 THEN
						CELCIUS := REPLACE(UPPER(DEGRE), 'CELCIUS', '°C');
						EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = '||chr(39)||CELCIUS||chr(39)||
										          ' WHERE OLDVALUES LIKE '||chr(39)||'%'||DEGRET||'%'||chr(39);
						TEST := 1;
					END IF;

				END IF;
			END LOOP;
		END LOOP; 
	END;
/
/**********************************************************************************************************/

/************************************************/
/*						*/
/*       FONCTION QUI CREE UNE VIEW AVEC	*/
/*	   LE TYPE MAX ET LA TAILLE MAX		*/
/*						*/
/************************************************/


CREATE OR REPLACE PROCEDURE MAXTYPE(I in NUMBER)
IS
	BEGIN
	EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW SYNTAX AS 
			   SELECT SYNTACTICTYPE as S,COUNT(SYNTACTICTYPE) as NB   
			   FROM DR_CSVFile_Col_'||I||' GROUP BY SYNTACTICTYPE 
			   HAVING COUNT(SYNTACTICTYPE)=(SELECT MAX(NBMAX) 
			   FROM (SELECT SYNTACTICTYPE, COUNT(SYNTACTICTYPE) NBMAX 
			   FROM DR_CSVFile_Col_'||I||' GROUP BY SYNTACTICTYPE))';
			   
	EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW CATE AS 
			   SELECT SEMANTICCATEGORY as S,COUNT(SEMANTICCATEGORY) as NB   
			   FROM DR_CSVFile_Col_'||I||' GROUP BY SEMANTICCATEGORY 
			   HAVING COUNT(SEMANTICCATEGORY)=(SELECT MAX(NBMAX) 
			   FROM (SELECT SEMANTICCATEGORY, COUNT(SEMANTICCATEGORY) NBMAX 
			   FROM DR_CSVFile_Col_'||I||' GROUP BY SEMANTICCATEGORY))';
	END;
/		   
/**********************************************************************************************************/

/************************************************/
/*						*/
/*	PREMIERE VERSION DE LA DETECTION 	*/
/*	  D'ANOMALIES AVEC LA MENTION		*/
/*	     <!>ANO POUR ANOMALIES		*/
/*	 <!>NULL POUR LES VALEURS NULL		*/
/*						*/
/************************************************/


CREATE OR REPLACE PROCEDURE DETECTION_ANOMALIE(LaTable IN VARCHAR2,LaColonne IN VARCHAR2) AS
	NBCOL 		NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
	CAT		VARCHAR2(20);
	NBTYPE		NUMBER(5);
	
	BEGIN
		FOR I IN 1..NBCOL
		LOOP
			IF I <= NBCOL+1 THEN
			MAXTYPE(I);
			EXECUTE IMMEDIATE 'SELECT S FROM SYNTAX' INTO CAT;
			EXECUTE IMMEDIATE 'SELECT NB FROM SYNTAX' INTO NBTYPE;
			EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET OBSERVATION = CONCAT(OLDVALUES,'|| chr(39) || '<!>ANO' || chr(39) ||') WHERE SYNTACTICTYPE NOT IN (SELECT S FROM SYNTAX)';
			EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET OBSERVATION = CONCAT(OLDVALUES,'|| chr(39) || '<!>NULL' || chr(39) ||') WHERE SYNTACTICTYPE IN ' || chr(39) ||'NULL' || CHR(39) ;
			
			EXECUTE IMMEDIATE 'SELECT S FROM CATE' INTO CAT;
			EXECUTE IMMEDIATE 'SELECT NB FROM CATE' INTO NBTYPE;
			EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET OBSERVATION = CONCAT(OLDVALUES,'|| chr(39) || '<!>ANO' || chr(39) ||') WHERE SEMANTICCATEGORY NOT IN (SELECT S FROM CATE)';
			EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET OBSERVATION = CONCAT(OLDVALUES,'|| chr(39) || '<!>NULL' || chr(39) ||') WHERE SEMANTICCATEGORY IN '|| chr(39)||'NULL'||CHR(39) ;
			END IF;

		END LOOP;
	END;
/
/**********************************************************************************************************/

/************************************************/
/*						*/
/*	  PREMIERE VERSION DE L'INSERTION 	*/
/*	    	  DES NEWVALUES			*/
/*						*/
/************************************************/


CREATE OR REPLACE PROCEDURE NEW_VALUES(LaTable IN VARCHAR2,LaColonne IN VARCHAR2) AS
	NBCOL 		NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
	
	BEGIN
		
		FOR I IN 1..NBCOL 
		LOOP
			EXECUTE IMMEDIATE 'UPDATE DR_CSVFILE_COL_'||I||' SET NEWVALUES = OLDVALUES WHERE OBSERVATION IS NULL';

		END LOOP;
		HOMODATE(LaTable,LaColonne);
		FAHRENHEIT_TO_CELCIUS(LaTable,LaColonne); 
	END;
/



/**********************************************************************************************************/

/************************************************/
/*						*/
/*		TABLE DE PROFILAGE		*/
/*						*/
/************************************************/

COLUMN REFERENCES FORMAT A60
COLUMN OLDNAME FORMAT A10
COLUMN NEWNAME FORMAT A50
COLUMN M000 FORMAT 999
COLUMN M100 FORMAT 999
COLUMN M101 FORMAT 999
COLUMN M102 FORMAT 999
COLUMN M103 FORMAT 999
COLUMN M104 FORMAT 999
COLUMN M105 FORMAT 999
COLUMN M106 FORMAT 999
COLUMN M107 FORMAT 999
COLUMN M108 FORMAT 999
COLUMN M109 FORMAT 999
COLUMN M110 FORMAT 999
COLUMN M111 FORMAT A15
COLUMN M112 FORMAT 999
COLUMN M113 FORMAT 999
COLUMN M114 FORMAT A15
COLUMN M115 FORMAT 999 
COLUMN M116 FORMAT 999

DROP TABLE DR_CSVFILE_TABCOL ;
CREATE TABLE DR_CSVFILE_TABCOL
(
	REFERENCES 	VARCHAR2(100),
	OLDNAME 	VARCHAR2(100),
	NEWNAME		VARCHAR2(100),
	M000 		NUMBER(5),
	M100 		NUMBER(5),
	M101 		NUMBER(5),
	M102 		NUMBER(5),
	M103 		NUMBER(5),
	M104 		NUMBER(5),
	M105 		NUMBER(5), 
	M106 		NUMBER(5),
	M107 		NUMBER(5),
	M108 		NUMBER(5),
	M109 		NUMBER(5),
	M110 		NUMBER(5),
	M111 		VARCHAR2(10),
	M112 		NUMBER(5),
	M113 		NUMBER(5),
	M114 		VARCHAR2(50),
	M115		NUMBER(5), 
	M116 		NUMBER(5),
	M117 		VARCHAR2(50)
);

COMMENT ON table DR_CSVFILE_TABCOL IS 'Cette table regroupe les informations des CSV';
COMMENT ON column DR_CSVFILE_TABCOL.OLDNAME IS 'Col_i';
COMMENT ON column DR_CSVFILE_TABCOL.NEWNAME IS 'Col_i_syntax_semantique';
COMMENT ON column DR_CSVFILE_TABCOL.M000 IS 'Number of rows';
COMMENT ON column DR_CSVFILE_TABCOL.M100 IS 'Number of null values';
COMMENT ON column DR_CSVFILE_TABCOL.M101 IS 'Number of not null values';
COMMENT ON column DR_CSVFILE_TABCOL.M102 IS 'MIN length (characters)';
COMMENT ON column DR_CSVFILE_TABCOL.M103 IS 'MAX length (characters)';
COMMENT ON column DR_CSVFILE_TABCOL.M104 IS 'Number of words';
COMMENT ON column DR_CSVFILE_TABCOL.M105 IS 'Number of values of the STRING type';
COMMENT ON column DR_CSVFILE_TABCOL.M106 IS 'Number of values of the NUMBER type';
COMMENT ON column DR_CSVFILE_TABCOL.M107 IS 'Number of values of the DATE type';
COMMENT ON column DR_CSVFILE_TABCOL.M108 IS 'Number of values of the BOOLEAN type';
COMMENT ON column DR_CSVFILE_TABCOL.M109 IS 'Number of values of the NULL type';
COMMENT ON column DR_CSVFILE_TABCOL.M110 IS 'Number of different values';
COMMENT ON column DR_CSVFILE_TABCOL.M111 IS 'The dominant syntactic type';
COMMENT ON column DR_CSVFILE_TABCOL.M112 IS 'Number of syntactic anomalies';
COMMENT ON column DR_CSVFILE_TABCOL.M113 IS 'Number of syntactic normal values m113';
COMMENT ON column DR_CSVFILE_TABCOL.M114 IS 'The dominant semantic category m114';
COMMENT ON column DR_CSVFILE_TABCOL.M115 IS 'Number of semantic anomalies' ;
COMMENT ON column DR_CSVFILE_TABCOL.M116 IS 'Number of semantic normal values';
COMMENT ON column DR_CSVFILE_TABCOL.M117 IS 'The dominant semantic subcategory m117';

CREATE OR REPLACE PROCEDURE PROFILAGE(LaTable IN VARCHAR2, LaColonne IN VARCHAR2) IS 
	NBCOL NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
	INSER VARCHAR2(2000) ;
	M000 NUMBER(5);
	M100 NUMBER(5);
	M101 NUMBER(5);
	M102 NUMBER(5);
	M103 NUMBER(5);
	M104 NUMBER(5);
	M105 NUMBER(5); 
	M106 NUMBER(5);
	M107 NUMBER(5);
	M108 NUMBER(5);
	M109 NUMBER(5);
	M110 NUMBER(5);
	M111 VARCHAR2(10);
	M112 NUMBER(5);
	M113 NUMBER(5);
	M114 VARCHAR2(50);
	M115 NUMBER(5); 
	M116 NUMBER(5);
	M117 VARCHAR2(50);
	
	BEGIN

		FOR I IN 1..NBCOL 
		LOOP
			INSER :='INSERT INTO DR_CSVFILE_TABCOL VALUES(';
			
			EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM DR_CSVFILE_COL_'||I INTO M000;
			EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM DR_CSVFILE_COL_'||I||' WHERE OLDVALUES IS NULL' INTO M100;
			EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM DR_CSVFILE_COL_'||I||' WHERE OLDVALUES IS NOT NULL' INTO M101;
			
			EXECUTE IMMEDIATE 'SELECT MIN(COLUMNWIDHT) FROM DR_CSVFILE_COL_'||I INTO M102;
			EXECUTE IMMEDIATE 'SELECT MAX(COLUMNWIDHT) FROM DR_CSVFILE_COL_'||I INTO M103;
			EXECUTE IMMEDIATE 'SELECT MAX(NUMBEROFWORDS) FROM DR_CSVFILE_COL_'||I INTO M104;
			
			EXECUTE IMMEDIATE 'SELECT COUNT(SYNTACTICTYPE) FROM DR_CSVFILE_COL_'||I||' WHERE UPPER(SYNTACTICTYPE) ='||chr(39)||'VARCHAR2'||chr(39) INTO M105;
			EXECUTE IMMEDIATE 'SELECT COUNT(SYNTACTICTYPE) FROM DR_CSVFILE_COL_'||I||' WHERE UPPER(SYNTACTICTYPE) ='||chr(39)||'NUMBER'||chr(39) INTO M106;
			EXECUTE IMMEDIATE 'SELECT COUNT(SYNTACTICTYPE) FROM DR_CSVFILE_COL_'||I||' WHERE UPPER(SYNTACTICTYPE) ='||chr(39)||'DATE'||chr(39) INTO M107;
			EXECUTE IMMEDIATE 'SELECT COUNT(SYNTACTICTYPE) FROM DR_CSVFILE_COL_'||I||' WHERE UPPER(SYNTACTICTYPE) ='||chr(39)||'BOOLEAN'||chr(39) INTO M108;
			EXECUTE IMMEDIATE 'SELECT COUNT(SYNTACTICTYPE) FROM DR_CSVFILE_COL_'||I||' WHERE UPPER(SYNTACTICTYPE) ='||chr(39)||'NULL'||chr(39) INTO M109;
			
			EXECUTE IMMEDIATE 'SELECT COUNT( DISTINCT OLDVALUES) FROM DR_CSVFILE_COL_'||I INTO M110;
			EXECUTE IMMEDIATE 'SELECT SYNTACTICTYPE FROM (SELECT SYNTACTICTYPE,COUNT(*) AS B FROM DR_CSVFILE_COL_'||I||
								    ' WHERE SYNTACTICTYPE IS NOT NULL GROUP BY SYNTACTICTYPE)
					   WHERE B = (SELECT MAX(A) FROM (SELECT SYNTACTICTYPE,COUNT(*) AS A FROM DR_CSVFILE_COL_'||I||
						     		    ' WHERE SYNTACTICTYPE IS NOT NULL GROUP BY SYNTACTICTYPE))' INTO M111;
			EXECUTE IMMEDIATE 'SELECT COUNT(OBSERVATION) FROM DR_CSVFILE_COL_'||I||' WHERE OBSERVATION IS NOT NULL' INTO M112;
			M113 := M000 - M112;
			EXECUTE IMMEDIATE 'SELECT SEMANTICCATEGORY FROM (SELECT SEMANTICCATEGORY,COUNT(*) AS B FROM DR_CSVFILE_COL_'||I||
								       ' WHERE SEMANTICCATEGORY IS NOT NULL GROUP BY SEMANTICCATEGORY) 
					   WHERE B = (SELECT MAX(A) FROM (SELECT SEMANTICCATEGORY,COUNT(*) AS A FROM DR_CSVFILE_COL_'||I||
					   				' WHERE SEMANTICCATEGORY IS NOT NULL GROUP BY SEMANTICCATEGORY))' INTO M114;
					   				
			EXECUTE IMMEDIATE 'SELECT SEMANTICSUBCATEGORY FROM (SELECT SEMANTICSUBCATEGORY,COUNT(*) AS B FROM DR_CSVFILE_COL_'||I||
									  ' WHERE SEMANTICSUBCATEGORY IS NOT NULL GROUP BY SEMANTICSUBCATEGORY) 
					   WHERE B = (SELECT MAX(A) FROM (SELECT SEMANTICSUBCATEGORY,COUNT(*) AS A FROM DR_CSVFILE_COL_'||I||
					   				' WHERE SEMANTICSUBCATEGORY IS NOT NULL GROUP BY SEMANTICSUBCATEGORY))' INTO M117;
					   				
			EXECUTE IMMEDIATE 'SELECT COUNT(SEMANTICCATEGORY) FROM DR_CSVFILE_COL_'||I||' WHERE SEMANTICCATEGORY != '||chr(39)||M114||chr(39) INTO M115;
			EXECUTE IMMEDIATE 'SELECT COUNT(SEMANTICCATEGORY) FROM DR_CSVFILE_COL_'||I||' WHERE SEMANTICCATEGORY = ' ||chr(39)||M114||chr(39) INTO M116;

			INSER := INSER ||chr(39)||'CSVFILE_'||SYSDATE||chr(39)||
				      ','||chr(39)||'COL'||I||chr(39)||
				      ','||chr(39)||'COL'||I||'_'||M114||chr(39)||
				      ','||M000||','||M100||','||M101||','||M102||
				      ','||M103||','||M104||','||M105||','||M106||
				      ','||M107||','||M108||','||M109||','||M110||
				      ','||chr(39)||M111||chr(39)||','||M112||','||M113||
				      ','||chr(39)||M114||chr(39)||','||M115||','||M116||','||chr(39)||M117||chr(39)||')';

			EXECUTE IMMEDIATE INSER;
		END LOOP;  
	END;
/

/**********************************************************************************************************/

/************************************************/
/*						*/
/*	VERSION 5.0 DE LA TABLEFINAL		*/
/*						*/
/************************************************/
	

CREATE OR REPLACE PROCEDURE AFFICHER_COL(LaTable IN VARCHAR2,LaColonne IN VARCHAR2) 
AS
	NBCOL 		NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
	INSER		VARCHAR2(1000) := 'CREATE TABLE DR_CSVFile_Col_TT AS ';
	
	BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE DR_CSVFile_Col_TT';
		FOR I IN 1..NBCOL
		LOOP
			INSER := INSER || 'SELECT * FROM DR_CSVFile_Col_'||I;
			IF I <NBCOL THEN
				INSER := INSER || ' UNION ALL ';
			END IF;
			
		END LOOP;
		EXECUTE IMMEDIATE INSER;
	END;
/





