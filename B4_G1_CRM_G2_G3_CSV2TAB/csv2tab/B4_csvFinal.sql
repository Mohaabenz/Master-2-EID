-----------CSV1
COLUMN COL1_ALPHABETIQUE FORMAT A20									     
COLUMN COL3_SEXE FORMAT A5												 
COLUMN COL4_NUMERIQUE FORMAT 99				      
COLUMN COL5_DATEFR FORMAT A15											   
COLUMN COL6_TEMPERATURE FORMAT A10


------------CSV3
COLUMN COL2_SEXE FORMAT A10											    
COLUMN COL3_BLOODGROUP FORMAT A5										 
COLUMN COL4_ALPHABETIQUE FORMAT A15				      
COLUMN COL5_ALPHABETIQUE FORMAT A20

----------------CSV2
COLUMN   IDJOIN FORMAT 999
COLUMN   COL1_ID FORMAT A10										
COLUMN   COL2_ALPHABETIQUE FORMAT A15										     
COLUMN   COL3_ALPHABETIQUE FORMAT A15					  
COLUMN   COL4_DATEFR FORMAT A15									       
COLUMN   COL5_MAIL FORMAT A30										    
COLUMN   COL6_BLOODGROUP FORMAT A5							 
COLUMN   COL7_SEXE FORMAT A5									      
COLUMN   COL8_POIDS FORMAT A15										   
COLUMN   COL9_ALPHABETIQUE FORMAT A15							
COLUMN   COL10_CONTINENT FORMAT A15										     
COLUMN   COL11_NUMERIQUE FORMAT 99
COLUMN   COL12_TEMPERATURE FORMAT A15										     
COLUMN   COL13_MESURE FORMAT A15

--------------CSV 4
COLUMN  COL1_SEXE FORMAT A5
COLUMN  COL5_BLOODGROUP FORMAT A5
COLUMN  COL6_NULL FORMAT A5
COLUMN  COL7_NULL FORMAT A5											
COLUMN  COL8_ALPHABETIQUE FORMAT A15									      

----------------CSV5	  
COLUMN COL2_CIVIL FORMAT A5											       
COLUMN COL5_SEXE FORMAT A5											    
COLUMN COL6_DATEFR FORMAT A15	 
COLUMN COL7_MAIL FORMAT A25											      
COLUMN COL8_BLOODGROUP	FORMAT A5										   
COLUMN COL11_ALPHABETIQUE FORMAT A10
COLUMN COL12_ALPHABETIQUE FORMAT A10										     
COLUMN COL13_CODEPOSTAL FORMAT 99999										  
COLUMN COL14_ALPHABETIQUE FORMAT A15						       
COLUMN COL15_ALPHABETIQUE FORMAT A15									    
COLUMN COL16_NUMERIQUE FORMAT 99
COLUMN COL17_COORDONNEE	FORMAT A35									     
COLUMN COL18_POIDS FORMAT A8											  
COLUMN COL19_MESURE FORMAT A8								       
COLUMN COL20_DATEFR FORMAT A15

 
CREATE OR REPLACE PROCEDURE CREATE_TABLE_FINAL(LaTable IN VARCHAR2,LaColonne IN VARCHAR2) 
AS
	CURSOR C1 IS SELECT * FROM DR_CSVFILE_TABCOL;
	NBCOL 		NUMBER := NOMBRE_COLONNE(LaTable,LaColonne);
	INSER		VARCHAR2(1000) := 'CREATE TABLE DR_CSVFINAL(';
	TAIL		NUMBER(10);
	TYPES		VARCHAR2(500);
	II		NUMBER(10) := 1;
	BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE DR_CSVFINAL';
		FOR RES IN C1 
		LOOP
			TYPES := RES.M111;
			TYPES := REPLACE(TYPES,'NULL','VARCHAR2');
			TYPES := REPLACE(TYPES,'STRING','VARCHAR2');
			TAIL := TO_NUMBER(RES.M103)+10;
			--DBMS_OUTPUT.PUT_LINE(I);
			INSER := INSER  || RES.NEWNAME||' '|| TYPES;
			
			IF RES.M111 != 'DATE' THEN
				INSER := INSER ||'('||TAIL||')';
			END IF;
			
			IF C1%ROWCOUNT < NBCOL THEN
				INSER := INSER ||', ';
			END IF;
			
			II := II + 1;
		END LOOP; 
		INSER := INSER||')';
		--DBMS_OUTPUT.PUT_LINE(INSER);
		EXECUTE IMMEDIATE INSER;

	END;
/

CREATE OR REPLACE PROCEDURE INSERT_TABLE_FINAL(LaTable IN VARCHAR2,LaColonne IN VARCHAR2)
IS
        CURSOR C1 IS SELECT * FROM DR_CSVFILE_TABCOL;
        INSER VARCHAR2(2000);
        NBCOL  NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
        NBLIN NUMBER(5);
        
	BEGIN
		EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM TMP' INTO NBLIN;
		FOR I IN 1..NBLIN LOOP
		    INSER:= 'INSERT INTO DR_CSVFINAL VALUES (';
		      FOR RES IN C1 LOOP
		          EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW TMP2 AS SELECT * FROM DR_CSVFile_Col_'||C1%ROWCOUNT ;
		          COMMIT;
		          INSER := INSERT_TAB(I,INSER,LaTable,LaColonne);
		      END LOOP; 
		      INSER := SUBSTR(INSER, 1, LENGTH(INSER)-1);
		      INSER := INSER||')';
--		      DBMS_OUTPUT.PUT_LINE(INSER);
		      EXECUTE IMMEDIATE INSER;
		END LOOP;
	END;
/


CREATE OR REPLACE FUNCTION INSERT_TAB(I IN NUMBER,INSER IN VARCHAR2, LaTable IN VARCHAR2,LaColonne IN VARCHAR2) 
RETURN VARCHAR2
IS
        CURSOR C2 IS SELECT * FROM TMP2;
        NBCOL  NUMBER(5) := NOMBRE_COLONNE(LaTable,LaColonne);
        INSER2 VARCHAR2(2000);

	BEGIN

		FOR RES IN C2 LOOP
		    IF I = C2%ROWCOUNT THEN
		            INSER2 := INSER ||chr(39)||RES.NEWVALUES||chr(39)||',';
		    END IF;
		 END LOOP;
		 RETURN(INSER2);
	END;
/

