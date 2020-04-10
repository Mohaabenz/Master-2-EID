/**********************************************************************************************************/

/************************************************/
/*						*/
/*	     Creation des tables		*/
/*						*/
/************************************************/

@B4_csvfile
@B4_type

/**********************************************************************************************************/

/************************************************/
/*						*/
/*	         Compile csv2tab		*/
/*						*/
/************************************************/


@B4_csv2tab
@B4_csvFinal
/**********************************************************************************************************/

/************************************************/
/*						*/
/*	     VERSION DU MAIN 5.0		*/
/*						*/
/************************************************/




CREATE OR REPLACE PROCEDURE MAIN(LaColonne IN VARCHAR2,LaTable2 IN VARCHAR2)
AS

	BEGIN

		TRANS();
		CSVToTable('TMP',LaColonne,LaTable2);
		TYPAGE('TMP',LaColonne,LaTable2);
		DETECTION_ANOMALIE('TMP',LaColonne);
		NEW_VALUES('TMP',LaColonne);
		PROFILAGE('TMP', LaColonne);
		AFFICHER_COL('TMP', LaColonne);
		CREATE_TABLE_FINAL('TMP', LaColonne);
		INSERT_TABLE_FINAL('TMP',LaColonne);
	END;
/


/************************************************/
/*						*/
/*	AFFICHAGE DES RESULTATS DU MAIN		*/
/*						*/
/************************************************/
PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> EXEC MAIN
PROMPT =====================================================================
PROMPT


--SELECT * FROM TMP;
EXEC CHOIXCSV('CSVFILE');
EXEC MAIN('COL','CSVTOTAB');

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> AFFICHAGE DE LA CSVToTable
PROMPT =====================================================================
PROMPT

COMMENT ON table CSVTOTAB IS 'Cette table est la transformation CSV en Table';

SELECT  table_name, comments FROM user_tab_comments WHERE UPPER(table_name) = 'CSVTOTAB';

SELECT * FROM CSVTOTAB;

PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =====================================================================
PROMPT >> AFFICHAGE DE LA TABLE DE PROFILAGE
PROMPT =====================================================================
PROMPT



SELECT  table_name, comments FROM user_tab_comments WHERE UPPER(table_name) = 'DR_CSVFILE_TABCOL';

SELECT * FROM user_col_comments WHERE UPPER(table_name) = 'DR_CSVFILE_TABCOL';

SELECT * FROM DR_CSVFILE_TABCOL;

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> AFFICHAGE DES TABLES COL
PROMPT =====================================================================
PROMPT


COMMENT ON table DR_CSVFile_Col_TT IS 'Cette table regroupe toute les tables annotation de nos données';


COMMENT ON column DR_CSVFile_Col_TT.REFERENCES IS 'Values references';
COMMENT ON column DR_CSVFile_Col_TT.OLDVALUES IS 'Values before traitements';
COMMENT ON column DR_CSVFile_Col_TT.SYNTACTICTYPE IS 'Syntaxic type';
COMMENT ON column DR_CSVFile_Col_TT.COLUMNWIDHT IS 'Lenght words';
COMMENT ON column DR_CSVFile_Col_TT.NUMBEROFWORDS IS 'Number of words';
COMMENT ON column DR_CSVFile_Col_TT.OBSERVATION IS 'Annomalies observation';
COMMENT ON column DR_CSVFile_Col_TT.NEWVALUES IS 'Values after traitements';
COMMENT ON column DR_CSVFile_Col_TT.SEMANTICCATEGORY IS 'Semantics category type';
COMMENT ON column DR_CSVFile_Col_TT.SEMANTICSUBCATEGORY IS 'Semantics subcategory type';


SELECT  table_name, comments FROM user_tab_comments WHERE UPPER(table_name) = 'DR_CSVFILE_COL_TT';
SELECT * FROM user_col_comments WHERE UPPER(table_name) = 'DR_CSVFILE_COL_TT';

SELECT * FROM DR_CSVFile_Col_TT;


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> DESCRIPTION TABLEFINAL
PROMPT =====================================================================
PROMPT

DESC DR_CSVFINAL;

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> TABLEFINAL
PROMPT =====================================================================
PROMPT

SELECT * FROM DR_CSVFINAL ORDER BY COL1_ID;


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> CONVERTION EN TAB2CSV
PROMPT =====================================================================
PROMPT

@tab2csv
