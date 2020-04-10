-- ===============================================================================
-------- Université Sorbonne Paris Cité, Université Paris 13 , Institut Galiée
-------- Master 2, Informatique, 
-------- Exploration Informatique des Données et Décisionnel
-------- M2 EID2

-- ===============================================================================
-------- La Data ; The Data
-------- La Donnée est le monde du futur ; Les données et le monde de l'avenir
-------- The Data is the world of the future ;  The Data and the future's world

-------- DATA -->>> Big Data, Dark Data, Open Data, ... 
-- ===============================================================================
-------- Bases de Données Avancées = Advanced Databases (BDA)
-------- Entrepôts de Données = Data Warehouses (DWH, EDON)

-------- Directeur :  Dr. M. Faouzi Boufarès
-------- Enseignant-Chercheur Responsable      

-------- Page Web : http://www.lipn.univ-paris13.fr/~boufares

-------- http://www.lipn.univ-paris13.fr/~boufares/Master2/*.sql

-- ===============================================================================
-- ===============================================================================
--   Projet  BDM : Big Data Management - Gestion des Données Massives
--
--   Data Manipulation (DM) - Manipulation de Données
--   Data Integration (DI) - Intégration de Données
--   Données structurées ; Données Semi-structurées ; Données NON structurées
--   Structured data; Semi-structured data; NON-structured data

--   Master Data Management (MDM) - Gestion des Données de Référence
--   Data Quality Managment (DQM) - Gestion de la qualité des données
--   Data Cleaning - Nettayage des données
--   Data deduplication - Elimination des doubles et des similaires

--   More semantics to better correct the data 
--   Plus de sémantique afin de mieux corriger les données
-- ===============================================================================
-- ===============================================================================
--
--------=============  BIG DATA, DATA BASE, DATA WAREHOUSE =============----------
--
-- Big Data & Clound Computing : Think DIFFERENTLY, BIGGER and SMARTER !
-- The Excellence in Data Use !
-- EID : L'Excellence dans l'Investigation des Données
-- EID : Excellence in Data Investigation
--
-- =============================================================================== 
-- Think DIFFERENTLY, BIGGER and SMARTER ! The Excellence in Data Use !
-- MISSION IMPOSSIBLE OU POSSIBLE ????? !!!!!!!!!!!
-- Votre mission, si vous l'acceptez, est : The Excellence in Data Use !
-- Si vous échouez, nous nierons avoir eu connaissance de vos agissements !

-- ===============================================================================
-- Les dictons du jour !
--
-- Aujourd'hui, j'arrête de fumer
-- Le TABAC t'ABAT
-- Fumer nuit grâvement à ta santé et à celle de ton entourage
--
-- M   T   Dents
-- SMILE and the World SMILES with you !
--
-- MANGER + MANGER = GROSSIR (??? M, A, N, G, E, R, O, S, S, I)
--
-- Manger & Bouger, 
-- Pour votre santé mangez 5 fruits et légumes par jour
-- Pour votre santé ne mangez pas trop gras, trop salé, trop sucré
-- Pour votre santé faites une activité physique régulière
-- Pour votre santé faites 30 mn de marche par jour
-- Pour votre santé faites des BD !!!
--
-- Dr. M. Faouzi Boufarès
-- =============================================================================== 
-- =============================================================================== 
--   A new ETL   ETL & DQ : Extract-Transform-Load & Data-Quality 
--                    Al ETL Al Jadyd   
-- ===============================================================================
-- ===============================================================================

-- =============================================================================== 
-- =============================================================================== 
-- ===============================================================================                   
--   Nom du SGBD/DBMS  : ORACLE  /  DB2  /  MySQL  /  ...        
--   Date de creation  : jj/mm/20aa
---  Lieu              : Université Sorbonne Paris Cité, Université Paris 13, Institut Galiée
-- =============================================================================== 

-- MFB MFB MFB MFB MFB MFB MFB MFB MFB
-- ===============================================================================
-------------------- Master 2 EID2 - Promotion 2019-2020 -------------------------

-- Groupe de Travail N° xy  : Bxy (Exemple B01, B02,... B09, B10, B11...)

-- NOM1 PRENOM1     --->>>>             : np1
-- NOM2 PRENOM2     --->>>>             : np2

-- ====>>> Vos fichiers sql devront s'appeler : Bxy-NomDuFichier.sql
-- ====>>> Ce fichier sql s'appelle : Bxy-G1.sql

-- =============================================================================== 
-- MFB MFB MFB MFB MFB MFB MFB MFB MFB

-- ===============================================================================
-- ===============================================================================
--   Problématique    :  Intégration de données hétérogènes

--   Problématique    :  Traitement des anomalies éventuelles
--   Problématique    :  Plusieurs types d'anomalies INTRA-Colonne ; INTER-COLONNES ; INTER-LIGNES

--   Problématique    :  Standardisation de données hétérogènes
--   Problématique    :  Traitement des valeurs invalides syntaxiquement
--   Problématique    :  Traitement des valeurs invalides sémantiquement
--   Problématique    :  Traitement des valeurs nulles
--   Problématique    :  Traitement des redondances sémantiques (Dépendances fonctionnelles)
--   Problématique    :  Elimination des doubles et similaires

-- =============================================================================== 
-- ===============================================================================
-- ===============================================================================   
-- =============================================================================== 
-- ===============================================================================


-- *******************************************************************************
-- *******************************************************************************
-- *******************************************************************************
--       SQL 2 --     SQL 2 -- --       SQL 2 --     SQL 2 -- 
--       SQL 2 --     SQL 2 -- --       SQL 2 --     SQL 2 -- 
-- *******************************************************************************
-- *******************************************************************************
-- *******************************************************************************


-- SPOOL Bxy-G1.lst

PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI : GCI
-- Nom de SGBD      :  ORACLE DBMS                    
-- Date de création :  SEPTEMBER 2019
-- Auteur           :  Faouzi BOUFARES 
-- Université       :  Université Sorbonne Paris Cité, Université Paris 13 
-- Formation        :  Master 2 EID 2  
PROMPT =========================================================
PROMPT 
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice 1 :  BD GCI     avec SQL 2               |
PROMPT |     Manipulations-Interrogations de BD                |
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

SELECT * FROM CLIENTS;

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> DETECTION DES ANOMALIE CLIENTS
PROMPT =========================================================
PROMPT

UPDATE CLIENTS SET VILCLI = UPPER(VILCLI);
UPDATE CLIENTS SET NOMCLI = UPPER(NOMCLI);
UPDATE CLIENTS SET PRENCLI = INITCAP(PRENCLI);
UPDATE CLIENTS SET ADRCLI = UPPER(ADRCLI);
UPDATE CLIENTS SET VILCLI = REPLACE(VILCLI, '-', ' ');
UPDATE CLIENTS SET PAYSCLI = REPLACE(PAYSCLI,'FRA','FRANCE') WHERE PAYSCLI LIKE 'FRA'; 
SELECT NOMCLI, PRENCLI FROM CLIENTS;
SELECT CODCLI,NOMCLI,PRENCLI FROM CLIENTS WHERE NOT REGEXP_LIKE(NOMCLI, '^([A-Z ])+$');
INSERT INTO CLIENTS(CODCLI,NOMCLI) VALUES('CNEW','AAAAA');
SELECT CPCLI FROM CLIENTS WHERE NOT REGEXP_LIKE(CPCLI, '^([1-9][0-9]{4})+$');
SELECT VILCLI FROM CLIENTS WHERE NOT REGEXP_LIKE(VILCLI, '^([A-Za-z ])+$');

SELECT * FROM CLIENTS WHERE NOT REGEXP_LIKE(TELCLI, '^(((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$)') OR TELCLI IS NULL ;
SELECT * FROM CLIENTS WHERE NOT REGEXP_LIKE(MAILCLI, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');

PROMPT
pause Tapez sur Enter...
PROMPT

SELECT * FROM COMMANDES;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM ARTICLES;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM DETAILCOM;

PROMPT
pause Tapez sur Enter...
PROMPT




-- ===============================================================================
-- Manipulations-Interrogations des données ========= DEBUT ======================
-- en SQL 2 ======================================================================
-- Requêtes dans les tables ======================================================

PROMPT =========================================================
PROMPT FB-A : Requetes sur la bd EN SQL 2  du type : A, B, C, D, E, F, I, J...
PROMPT =========================================================
PROMPT

-- =======================================================================
-- =======================================================================G1
-- =======================================================================
/*
Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Requêtes du type Ai (Sélections + Projections) : 
SELECT … FROM …UneTable… WHERE … ;

A01. Les Noms des clients (Avec éventuellement des doublons)S

A02. Les Noms des clients (Sans les doublons)
	
A03. Les articles dont le prix de vente est supérieur ou égal au double du prix d’achat
	
A04. Les articles dont le prix de vente est soit 4 soit 27 soit 35
A05. Les articles dont le prix de vente est compris entre 30 et 50
A06. Les commandes du mois de septembre 2015
A07. Les détails des commandes d’une année donnée (2012)

A08. Les clients de « Paris » (Civilité Nom Prénom, Ville), le nom de la ville s’écrit comme « Paris »

A09. Les clients dont le nom commence par « C »
A10. Les articles dont le nom commence par « Barrières de »
A11. Les articles du fournisseur « WD »

A12. Les clients pour lesquels on n'a pas de téléphone

A13. Les clients dont le nom de la ville se prononce comme « pari » ou « bariz » ou « pary »
A14. Les clients dont le nom est similaire à « pari » ou « bariz » ou « pary »

A15. Décodification de la catégorie des clients : Transformez la catégorie comme suit : 1 ? Grossiste, 2 ? Demi-Gros, ? Détaillant

Qualité des données : Y-a-t-il des anomalies dans les données ; Quelles sont ces anomalies ?
A16. Les clients pour lesquels le nom et/ou le prénom sont invalides (Code, Nom, et Prénom)
A17. Les clients pour lesquels les mails sont invalides (Code, Nom, et Mail)
A18. Les clients pour lesquels les téléphones sont invalides (Code, Nom, et Mail)
*/

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Complétez vos réponses

PROMPT =========================================================
PROMPT >> Requete A01 : Les Noms des clients (Avec éventuellement des doublons)
PROMPT =========================================================
PROMPT
SELECT NOMCLI FROM Clients ;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
/*
	NOMCLI
	--------
	CLEM@ENT
	LESEUL
	UNIQUE
	CLEMENCE
	FORT
	LE BON
	TRAIFOR
	VIVANT
	CLEMENCE
	TRAIFOR
	PREMIER
	CLEMENT
	FORT
	ADAM
	Labsent
	obsolete
	RAHYM
	GENIE

	18 rows selected.
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A02 : Les Noms des clients (Sans les doublons)
PROMPT =========================================================
PROMPT
SELECT DISTINCT NOMCLI FROM Clients ;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
/*
	NOMCLI
	--------
	LE BON
	VIVANT
	UNIQUE
	PREMIER
	CLEM@ENT
	CLEMENT
	obsolete
	CLEMENCE
	FORT
	TRAIFOR
	ADAM
	RAHYM
	GENIE
	LESEUL
	Labsent

15 rows selected.
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A03. Les articles dont le prix de vente est supérieur ou égal au double du prix d’achat
PROMPT =========================================================
PROMPT

SELECT * FROM Articles WHERE PvArt >= 2*(PaArt);

/*
REFART	 NOMART 		     PVART QSART   PAART
-------- ------------------------- ------- ----- -------
F1.005	 COINS DE PROTECTION	      4.00   ###    1.71
F1.006	 CACHE PRISE DE COURANT       2.29   ###     .71
F1.007	 BLOQUE PORTE		      5.00     4    2.29
FB.001	 DVD-SPIRIT		     24.90     2   12.00
FB.002	 DVD-SPIDER MAN 	     24.90     2   12.00
FB.003	 DVD-SPIDER MAN 2	     24.90     2   12.00
WD.001	 K7 VIDEO-TOY STORY	     21.29    10    9.29
WD.002	 DVD-TOY STORY 2	     34.29    10   12.14
WD.003	 K7 VIDEO-WINNIE L OURSON    22.86     5    9.29
WD.004	 DVD-FRERES DES OURS	     35.00     3   13.00
WD.005	 K7 VIDEO-LE ROI LION	     30.00     1   13.00
WD.006	 K7 VIDEO-LE ROI LION 2      30.00     4   13.00
WD.007	 K7 VIDEO-LE ROI LION 3      30.00     3   13.00
*/


PROMPT
pause Tapez sur Enter...

PROMPT

PROMPT =========================================================
PROMPT >> Requete A04. Les articles dont le prix de vente est soit 4 soit 27 soit 35
PROMPT =========================================================
PROMPT

SELECT * FROM Articles WHERE PvArt=4 OR PvArt=27 OR PvArt=35;
SELECT * FROM Articles WHERE PvArt IN (4, 27, 35);
/*
REFART	 NOMART 		     PVART QSART   PAART
-------- ------------------------- ------- ----- -------
F1.001	 SIEGE DE TABLE 	     35.00    10   26.43
F1.002	 CASQUE CYCLISTE PROTECTIO   27.00    20   20.00
	 N

F1.005	 COINS DE PROTECTION	      4.00   ###    1.71
WD.004	 DVD-FRERES DES OURS	     35.00     3   13.00
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A05. Les articles dont le prix de vente est compris entre 30 et 50
PROMPT =========================================================
PROMPT

SELECT * FROM Articles WHERE PvArt between 30 AND 50;


/*
REFART	 NOMART 		     PVART QSART   PAART
-------- ------------------------- ------- ----- -------
F1.001	 SIEGE DE TABLE 	     35.00    10   26.43
F1.009	 PROTECTION DE FOUR	     37.86    10   26.43
F1.010	 PROTECTION DE CUISINIERE    30.71    10   22.86
F1.013	 HAUSSE-CHAISE		     42.71     1   25.43
F2.001	 BARRIERE DE PORTE, EN BOI   32.71     2   25.71
	 S

F2.002	 BARRIERE DE PORTE, EN MET   49.14     3   28.43
	 AL

F2.004	 PORTE-BEBE		     44.86     6   34.29
WD.002	 DVD-TOY STORY 2	     34.29    10   12.14
WD.004	 DVD-FRERES DES OURS	     35.00     3   13.00
WD.005	 K7 VIDEO-LE ROI LION	     30.00     1   13.00
WD.006	 K7 VIDEO-LE ROI LION 2      30.00     4   13.00
WD.007	 K7 VIDEO-LE ROI LION 3      30.00     3   13.00

12 rows selected.

*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A06. Les commandes du mois de septembre 2015
PROMPT =========================================================
PROMPT

SELECT * FROM Commandes WHERE TO_CHAR(datcom,'MM')='09' AND TO_CHAR(datcom,'YYYY')='2015';

/*
	no rows selected
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A07. Les détails des commandes d’une année donnée (2012)
PROMPT =========================================================
PROMPT

SELECT * FROM COMMANDES WHERE TO_CHAR(datcom,'YYYY')='2012';

/*
	no rows selected
*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A08. Les clients de « Paris » (Civilité Nom Prénom, Ville), le nom de la ville s’écrit comme « Paris »
PROMPT =========================================================
PROMPT


SELECT civcli,Nomcli,prencli,VilCli FROM Clients WHERE UPPER(VilCli) = 'PARIS';
SELECT civcli,Nomcli,prencli,VilCli FROM Clients WHERE LOWER(VilCli) = 'paris';
SELECT civcli,Nomcli,prencli,VilCli FROM Clients WHERE VilCli = 'PARIS';

/*
 Verification de la cohérence de la base de données
=========================================================================
CIVCLI	 NOMCLI   PRENCLI  VILCLI
-------- -------- -------- ------
Madame	 LESEUL   M@RIE    PARIS
Mademois TRAIFOR  ALICE    PARIS
elle

Monsieur CLEMENCE ALEXANDR PaRiS
		  E

Monsieur TRAIFOR  ALEXANDR PARIS
		  E
*/


SELECT civcli,Nomcli,prencli,VilCli FROM Clients WHERE VilCli = 'Paris';

/*
	no rows selected
*/



PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A09. Les clients dont le nom commence par « C »
PROMPT =========================================================
PROMPT


SELECT * FROM Clients WHERE UPPER(Nomcli) LIKE 'C%';

/*
 Verification de la cohérence de la base de données
=========================================================================
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C001   Madame	CLEM@ENT EVE	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899
						FOCH		 -SUR-O 	t@gmail.co 11
								 RGE		m

C004   Madame	CLEMENCE EVELYNE       3 8 BIS	BOULEVARD  93800 EPINAY FRANCE	clemence e +337778899
						FOCH		 -SUR-S 	velyne@gma 33
								 EINE		il.com

C009   Monsieur CLEMENCE ALEXANDR      1 5	RUE DE BEL 75019 PaRiS	FRANCE	alexandre. +331494040
			 E			LEVILLE 			clemence@u 71
										p13.fr

C012   Monsieur CLEMENT  ADAM	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om
*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A10. Les articles dont le nom commence par « Barrières de »
PROMPT =========================================================
PROMPT

SELECT * FROM ARTICLES WHERE NOMART LIKE 'BARRIERE DE%';
SELECT * FROM ARTICLES WHERE UPPER(NOMART) LIKE 'BARRIERE DE%';

/*
  Verification de la cohérence de la base de données
=========================================================================
REFART	 NOMART 		     PVART QSART   PAART
-------- ------------------------- ------- ----- -------
F2.001	 BARRIERE DE PORTE, EN BOI   32.71     2   25.71
	 S

F2.002	 BARRIERE DE PORTE, EN MET   49.14     3   28.43
	 AL

F2.003	 BARRIERE DE LIT	     23.71    10   15.71
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A11. Les articles du fournisseur « WD »
PROMPT =========================================================
PROMPT

SELECT * FROM ARTICLES WHERE UPPER(REFART) LIKE'WD%';

/*
 Verification de la cohérence de la base de données
=========================================================================
REFART	 NOMART 		     PVART QSART   PAART
-------- ------------------------- ------- ----- -------
WD.001	 K7 VIDEO-TOY STORY	     21.29    10    9.29
WD.002	 DVD-TOY STORY 2	     34.29    10   12.14
WD.003	 K7 VIDEO-WINNIE L OURSON    22.86     5    9.29
WD.004	 DVD-FRERES DES OURS	     35.00     3   13.00
WD.005	 K7 VIDEO-LE ROI LION	     30.00     1   13.00
WD.006	 K7 VIDEO-LE ROI LION 2      30.00     4   13.00
WD.007	 K7 VIDEO-LE ROI LION 3      30.00     3   13.00
*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A12. Les clients pour lesquels on n a pas de téléphone
PROMPT =========================================================
PROMPT

SELECT * FROM CLIENTS WHERE TELCLI IS NULL;

/*
 Verification de la cohérence de la base de données
=========================================================================
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C014   Monsieur ADAM	 DAVID	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam
						ROME				é@gmail c
										om

C015   Monsieur Labsent  pala	       7 1	rue des ab 000	 BAGDAD IRAQ	pala-labse
						sents				nt@paici

*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A13. Les clients dont le nom de la ville se prononce comme « pari » ou « bariz » ou « pary »
PROMPT =========================================================
PROMPT

SELECT * FROM Clients WHERE SOUNDEX(VilCli)=SOUNDEX('PARI') OR SOUNDEX(VilCli)=SOUNDEX('barizzz') OR SOUNDEX(VilCli)=SOUNDEX('pary');

/*
	no rows selected
*/

SELECT * FROM Clients WHERE SOUNDEX(VilCli)=SOUNDEX('PARYZ');

/*
 Verification de la cohérence de la base de données
=========================================================================
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C002   Madame	LESEUL	 M@RIE	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565
						TALIE				l@yahoo.fr

C007   Mademois TRAIFOR  ALICE	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899
       elle					ROSIERE 			for@yahoo. 66
										fr

C009   Monsieur CLEMENCE ALEXANDR      1 5	RUE DE BEL 75019 PaRiS	FRANCE	alexandre. +331494040
			 E			LEVILLE 			clemence@u 71
										p13.fr

C010   Monsieur TRAIFOR  ALEXANDR      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809
			 E			H				traifor@up
										13.fr


*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A14. Les clients dont le nom est similaire à « pari » ou « bariz » ou « pary »
PROMPT =========================================================
PROMPT

SELECT * FROM CLIENTS WHERE UPPER(NOMCLI) LIKE 'PARI' OR UPPER(NOMCLI) LIKE 'BARIZ' OR UPPER(NOMCLI) LIKE 'PARY';

/*
	no rows selected
*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A15. Décodification de la catégorie des clients : Transformez la catégorie comme suit : 1 ? Grossiste, 2 ? Demi-Gros, ? Détaillant 
PROMPT =========================================================
PROMPT

SELECT Nomcli, CASE catcli WHEN 1 THEN 'Grossiste' WHEN 2 THEN 'Demi-Gros' ELSE 'Detaillant' END AS Categorie FROM Clients;
SELECT Nomcli,DECODE(catcli,1,'Grossiste',2,'Demi-Gros','Detaillant') FROM Clients;

/*
NOMCLI	 DECODE(CAT
-------- ----------
CLEM@ENT Grossiste
LESEUL	 Grossiste
UNIQUE	 Demi-Gros
CLEMENCE Detaillant
FORT	 Detaillant
LE BON	 Grossiste
TRAIFOR  Demi-Gros
VIVANT	 Grossiste
CLEMENCE Grossiste
TRAIFOR  Grossiste
PREMIER  Demi-Gros
CLEMENT  Demi-Gros
FORT	 Detaillant
ADAM	 Detaillant
Labsent  Detaillant
obsolete Detaillant
RAHYM	 Grossiste
GENIE	 Detaillant

*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A16. Les clients pour lesquels le nom et/ou le prénom sont invalides (Code, Nom, et Prénom)
PROMPT =========================================================
PROMPT
SELECT CODCLI,NOMCLI,PRENCLI FROM CLIENTS WHERE NOT REGEXP_LIKE(NOMCLI, '^([A-Za-z-])+$') OR NOT REGEXP_LIKE(PRENCLI, '^([A-Za-z-])+$');
/*
CODCLI NOMCLI	PRENCLI
------ -------- --------
C001   CLEM@ENT EVE
C002   LESEUL	M@RIE
C006   LE BON	CLEMENCE
C011   PREMIER	JOS//EPH
*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A17. Les clients pour lesquels les mails sont invalides (Code, Nom, et Mail)
PROMPT =========================================================
PROMPT

SELECT * FROM CLIENTS WHERE NOT REGEXP_LIKE(MAILCLI, '^[A-Za-z]+[A-Za-z0-9.]+[A-Za-z0-9]+@[A-Za-z0-9.-]+[A-Za-z0-9]\.[A-Za-z]{2,4}$') ;

/*
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C004   Madame	CLEMENCE EVELYNE       3 8 BIS	BOULEVARD  93800 EPINAY FRANCE	clemence e +337778899
						FOCH		 -SUR-S 	velyne@gma 33
								 EINE		il.com

C005   Madame	FORT	 JEANNE        3 55	RUE DU JAP 94310 ORLY-V FRANCE	jfort\@hot +337778899
						ON		 ILLE		mail.fr    44

C006   Mademois LE BON	 CLEMENCE      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889
       elle					FOCH		 -SUR-S 	e bon@cfo. 955
								 EINE		fr

C008   Monsieur VIVANT	 JEAN-BAP      1 13	RUE DE LA  93800 EPINAY FRANCE	jeanbaptis 0607
			 TISTE			PAIX		 -SUR-S 	te@
								 EINE

C011   Monsieur PREMIER  JOS//EPH      2 77	RUE DE LA  13001 MARCHE FRANCE	josef@prem +337778899
						LIBERTE 	 ILLE		ier	   77

C014   Monsieur ADAM	 DAVID	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam
						ROME				é@gmail c
										om

C015   Monsieur Labsent  pala	       7 1	rue des ab 000	 BAGDAD IRAQ	pala-labse
						sents				nt@paici

C016   Madame	obsolete kadym	       7 1	rue des an 000	 CARTHA IFRIQIA inexistant inexistant
						ciens		 GE

C018   Madame	GENIE	 ADAM	       3 8	BOULEVARD  93800 EPINAY FRANCE	adam.géni +337778899
						FOCH		  SUR S 	e@gmail.co 11
								 EINE		m
*/


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A18. Les clients pour lesquels les téléphones sont invalides (Code, Nom, et Mail)
PROMPT =========================================================
PROMPT
SELECT * FROM CLIENTS WHERE NOT REGEXP_LIKE(TELCLI, '^06[0-9]{8}$') AND NOT REGEXP_LIKE(TELCLI, '^\+33[1-9][0-9]{8}$') AND NOT REGEXP_LIKE(TELCLI, '^\+216[1-9][0-9]{7}$') AND NOT REGEXP_LIKE(TELCLI, '^0033[0-9]{9}$') OR TELCLI IS NULL;

SELECT * FROM CLIENTS WHERE NOT REGEXP_LIKE(TELCLI, '^(((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{4})(( x| ext)\d{1,5}){0,1}$)') OR TELCLI IS NULL ;

--SELECT * FROM CLIENTS WHERE REGEXP_LIKE(TELCLI, '^06[0-9]{8}$') ;
--SELECT * FROM CLIENTS WHERE REGEXP_LIKE(TELCLI, '^\+33[1-9][0-9]{8}$');
--SELECT * FROM CLIENTS WHERE REGEXP_LIKE(TELCLI, '^\+216[1-9][0-9]{7}$');
--SELECT * FROM CLIENTS WHERE REGEXP_LIKE(TELCLI, '^0033[0-9]{9}$');

/*
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C008   Monsieur VIVANT	 JEAN-BAP      1 13	RUE DE LA  93800 EPINAY FRANCE	jeanbaptis 0607
			 TISTE			PAIX		 -SUR-S 	te@
								 EINE

C010   Monsieur TRAIFOR  ALEXANDR      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809
			 E			H				traifor@up
										13.fr

C016   Madame	obsolete kadym	       7 1	rue des an 000	 CARTHA IFRIQIA inexistant inexistant
*/

--/*



-- =======================================================================
-- =======================================================================
-- =======================================================================
/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Bi (Tris + Sélections + Projections + Calculs) : 
--SELECT …function(…)… FROM … WHERE … ORDER BY …;

--B01. Classez les clients par ville, par ordre croissant
--B02. Classez les articles de PV < 20, dans l’ordre décroissant du stock
--B03. Calculez la marge pour chaque article (marge = PV – PA !), présentez le résultat par ordre décroissant de la marge
--B04. Calculez la marge pour tous les sièges, présentez le résultat par ordre croissant de la marge
--B05. Calculez le nombre de valeurs nulles ….
--*/

PROMPT =========================================================
PROMPT >> Requete B01 : Classez les clients par ville, par ordre croissant
PROMPT =========================================================
PROMPT
SELECT * FROM Clients ORDER BY VilCli ASC;
SELECT * FROM Clients ORDER BY VilCli;
SELECT * FROM CLIENTS ORDER BY 9;

/*
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C015   Monsieur Labsent  pala	       7 1	rue des ab 000	 BAGDAD IRAQ	pala-labse
						sents				nt@paici

C016   Madame	obsolete kadym	       7 1	rue des an 000	 CARTHA IFRIQIA inexistant inexistant
						ciens		 GE

C017   Madame	RAHYM	 KARYM	       1 1	RUE DES GE 1000  CARTHA TUNISIE karym.rahy +216248084
						NTILS		 GE		m@gmail.co 44
										m

C018   Madame	GENIE	 ADAM	       3 8	BOULEVARD  93800 EPINAY FRANCE	adam.géni +337778899
						FOCH		  SUR S 	e@gmail.co 11
								 EINE		m

C001   Madame	CLEM@ENT EVE	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899
						FOCH		 -SUR-O 	t@gmail.co 11
								 RGE		m

C004   Madame	CLEMENCE EVELYNE       3 8 BIS	BOULEVARD  93800 EPINAY FRANCE	clemence e +337778899
						FOCH		 -SUR-S 	velyne@gma 33
								 EINE		il.com

C006   Mademois LE BON	 CLEMENCE      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889
       elle					FOCH		 -SUR-S 	e bon@cfo. 955
								 EINE		fr

C008   Monsieur VIVANT	 JEAN-BAP      1 13	RUE DE LA  93800 EPINAY FRANCE	jeanbaptis 0607
			 TISTE			PAIX		 -SUR-S 	te@
								 EINE

C003   Madame	UNIQUE	 MARINE        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899
						LIBERTE 	 ILLE		ail.com    22

C011   Monsieur PREMIER  JOS//EPH      2 77	RUE DE LA  13001 MARCHE FRANCE	josef@prem +337778899
						LIBERTE 	 ILLE		ier	   77

C005   Madame	FORT	 JEANNE        3 55	RUE DU JAP 94310 ORLY-V FRANCE	jfort\@hot +337778899
						ON		 ILLE		mail.fr    44

C010   Monsieur TRAIFOR  ALEXANDR      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809
			 E			H				traifor@up
										13.fr

C007   Mademois TRAIFOR  ALICE	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899
       elle					ROSIERE 			for@yahoo. 66
										fr

C002   Madame	LESEUL	 M@RIE	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565
						TALIE				l@yahoo.fr

C009   Monsieur CLEMENCE ALEXANDR      1 5	RUE DE BEL 75019 PaRiS	FRANCE	alexandre. +331494040
			 E			LEVILLE 			clemence@u 71
										p13.fr

C014   Monsieur ADAM	 DAVID	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam
						ROME				é@gmail c
										om

C013   Monsieur FORT	 GABRIEL       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017
						CARTAGE 			rt@yahoo.f 77
										r

C012   Monsieur CLEMENT  ADAM	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om


*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete B02. Classez les articles de PV < 20, dans l’ordre décroissant du stock
PROMPT =========================================================
PROMPT
SELECT NomArt,QsArt FROM Articles WHERE PvArt< 20 ORDER BY QsArt DESC;

/*
NOMART			  QSART
------------------------- -----
CACHE PRISE DE COURANT	    ###
COINS DE PROTECTION	    ###
BONNET PARE-CHOCS	    ###
COUVRE ROBINETTERIE	     12
BRETELLE DE SECURITE	      8
STORE DE PROTECTION	      5
BLOQUE PORTE		      4
BANDE DE FERMETURE	      4
*/

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete B03. Calculez la marge pour chaque article (marge = PV – PA !), présentez le résultat par ordre décroissant de la marge
PROMPT =========================================================
PROMPT
SELECT (PvArt-PaArt) AS Marge FROM Articles ORDER BY MARGE DESC;
/*
     MARGE
----------
     55,43
     49,86
	35
     22,15
	22
     20,71
     17,28
	17
	17
	17
     13,57
      12,9
      12,9
      12,9
	12
     11,43
     10,57
      8,57
	 8
      7,85
	 7
	 7
	 5
      4,14
      3,57
      3,14
      2,71
      2,29
      1,58
      1,58
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete B04. Calculez la marge pour tous les sièges, présentez le résultat par ordre croissant de la marge
PROMPT =========================================================
PROMPT

SELECT NomArt, (PvArt-PaArt) AS Marge  FROM Articles WHERE UPPER(NomArt) LIKE '%SIEGE%' ORDER BY MARGE;

--SELECT NomArt, (PvArt-PaArt) AS Marge  FROM Articles WHERE NomArt LIKE '%SIeGE%';
--SELECT NomArt, (PvArt-PaArt) AS Marge  FROM Articles WHERE NomArt LIKE '%SIEGE%';
--SELECT NomArt, (PvArt-PaArt) AS Marge  FROM Articles WHERE NomArt LIKE '%SIEge%';
--SELECT NomArt, (PvArt-PaArt) AS Marge FROM Articles WHERE NomArt LIKE '%SIEGE%' 
--ORDER BY Marge DESC;
--SELECT NomArt, (PvArt-PaArt) AS Marge FROM Articles WHERE NomArt LIKE '%SIEGE%' 
--ORDER BY 2 DESC;
/*
NOMART			       MARGE
------------------------- ----------
SIEGE DE TABLE			8,57
SIEGE-AUTO EUROSEAT	       49,86
SIEGE-AUTO COSMOS	       55,43
*/

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete B05. Calculez le nombre de valeurs nulles
PROMPT =========================================================
PROMPT

SELECT COUNT(*) FROM ARTICLES WHERE REFART IS NULL OR NOMART IS NULL OR PVART IS NULL OR QSART IS NULL OR PAART IS NULL;

/*

*/

PROMPT
pause Tapez sur Enter...
PROMPT










---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Ci (Calculs + Sélections+ Projections) : 
--SELECT …function(…)… FROM … WHERE …;

--C01. Nombre de clients (Femme + Homme)
--C02. Nombre de clientes (Femme)
--C03. Nombre de clients (Homme)
--C04. Le prix de vente le plus élevé
--C05. Moyenne des prix de vente des articles
--C06. Le chiffre d’affaires global
--C07. Les articles dont le prix de vente est supérieur à la moyenne des prix de vente

--*/

PROMPT =========================================================
PROMPT >> Requete C01 : Nombre de clients (Femme + Homme)
PROMPT =========================================================
PROMPT
SELECT COUNT(*) FROM Clients;
SELECT COUNT(*) AS NbrCli FROM Clients;

/*
  COUNT(*)
----------
	18


    NBRCLI
----------
	18

*/


PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete C02. Nombre de clientes (Femme)
PROMPT =========================================================
PROMPT
SELECT COUNT(*) FROM Clients WHERE CivCli='Madame' OR CivCli='Mademoiselle';
SELECT COUNT(*) FROM Clients WHERE CivCli='MADame' OR CivCli='MaDEmoisellE';

/*
  COUNT(*)
----------
	10


  COUNT(*)
----------
	 0

*/


PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete C03. Nombre de clients (Homme)
PROMPT =========================================================
PROMPT
SELECT COUNT(*) FROM Clients WHERE CivCli='Monsieur';

/*
  COUNT(*)
----------
	 8
*/


PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete C04. Le prix de vente le plus élevé
PROMPT =========================================================
PROMPT
SELECT MAX(PvArt) FROM Articles;

/*
MAX(PVART)
----------
    126,86
*/


PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete C05. Moyenne des prix de vente des articles
PROMPT =========================================================
PROMPT
SELECT AVG(PvArt) FROM Articles;

/*
AVG(PVART)
----------
    32,895
*/


PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete C06. Le chiffre d’affaires global
PROMPT =========================================================
PROMPT
SELECT SUM(PvArt*qsart) AS chiffre_daffaires FROM Articles;

/*
CHIFFRE_DAFFAIRES
-----------------
	  7145,63
*/


PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete C07. Les articles dont le prix de vente est supérieur à la moyenne des prix de vente
PROMPT =========================================================
PROMPT
SELECT * FROM Articles WHERE PvArt >= (SELECT AVG(PvArt) FROM Articles);

/*
REFART	 NOMART 		     PVART QSART   PAART
-------- ------------------------- ------- ----- -------
F1.001	 SIEGE DE TABLE 	     35.00    10   26.43
F1.009	 PROTECTION DE FOUR	     37.86    10   26.43
F1.011	 BABY PHONE		     80.71     3   45.71
F1.013	 HAUSSE-CHAISE		     42.71     1   25.43
F2.002	 BARRIERE DE PORTE, EN MET   49.14     3   28.43
	 AL

F2.004	 PORTE-BEBE		     44.86     6   34.29
F2.005	 SIEGE-AUTO COSMOS	    126.86     2   71.43
F2.006	 SIEGE-AUTO EUROSEAT	    121.29     2   71.43
WD.002	 DVD-TOY STORY 2	     34.29    10   12.14
WD.004	 DVD-FRERES DES OURS	     35.00     3   13.00
*/


PROMPT
pause Tapez sur Enter...
PROMPT










---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Di (Calculs + Sous-Totaux + Sélections+ Projections + Tris) : 
--SELECT …function(…)… FROM … WHERE … GROUP BY… ORDER BY …;

--D01. Nombre de clients par catégorie
--D02. Nombre de clients parisiens par catégorie
--D03. Montant de chaque commande
--D04. Nombre de clients parisiens par catégorie, nombre > 2
--D05. Total des quantités commandées par article

--D06. Total des quantités commandées par catégorie d’article
--D07. Total du chiffre d’affaires par catégorie d’article
--D08. Total, moyenne, min et max du chiffre d’affaires par catégorie d’article
--D09. Le chiffre d’affaires par année
--D10. Le nombre de valeurs différentes par colonne 
--*/



PROMPT =========================================================
PROMPT >> Requete D01 : Nombre de clients par catégorie
PROMPT =========================================================
PROMPT
SELECT COUNT(*), CatCli FROM Clients GROUP BY CatCli;
SELECT CatCli, COUNT(*) AS nbr  FROM Clients GROUP BY CatCli;
SELECT CatCli AS Categorie, COUNT(*) AS NombreCli  FROM Clients GROUP BY CatCli;

/*
  COUNT(*) CATCLI
---------- ------
	 7	1
	 4	2
	 2	5
	 3	3
	 2	7

CATCLI	      NBR
------ ----------
     1		7
     2		4
     5		2
     3		3
     7		2

 CATEGORIE  NOMBRECLI
---------- ----------
	 1	    7
	 2	    4
	 5	    2
	 3	    3
	 7	    2
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D02. Nombre de clients parisiens par catégorie
PROMPT =========================================================
PROMPT
SELECT COUNT(*) AS nbr,CatCli FROM Clients WHERE SOUNDEX(vilcli) = SOUNDEX('Paris') GROUP BY CatCli;

/*
       NBR CATCLI
---------- ------
	 3	1
	 1	2
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D03. Montant de chaque commande
PROMPT =========================================================
PROMPT
SELECT SUM(Pvart*qsart),numcom FROM Commandes NATURAL JOIN Detailcom NATURAL JOIN Articles GROUP BY numcom;


/*
SUM(PVART*QSART) NUMCOM
---------------- ----------
	  128,38 20031FB
	  242,13 20056FB
	     507 20003AB
	   114,3 20054FB
	    49,8 20067FB
	    49,8 20068FB
	    49,8 20074FB
	 1676,61 20001AB
	    49,8 20070FB
	    49,8 20073FB
	   62,96 20051FB
	    49,8 20061FB
	    49,8 20062FB
	    49,8 20066FB
	    49,8 20069FB
	  1020,1 20002AB
	  226,06 20004AB
	    49,8 20071FB
	    49,8 20072FB
	   448,4 20012RB
	 1790,91 20052FB
	   114,3 20053FB
	    49,8 20181AB
	  699,31 20055FB
	   65,42 20057FB
	    49,8 20065FB

*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D04. Nombre de clients parisiens par catégorie, nombre > 2
PROMPT =========================================================
PROMPT
SELECT * FROM(SELECT COUNT(*) AS nbr,CatCli FROM Clients WHERE SOUNDEX(vilcli) = SOUNDEX('Paris') GROUP BY CatCli) WHERE nbr >2;

/*
       NBR CATCLI
---------- ------
	 3	1
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D05. Total des quantités commandées par article
PROMPT =========================================================
PROMPT
SELECT SUM(QTCOM),NOMART FROM ARTICLES NATURAL JOIN DETAILCOM GROUP BY NOMART;


/*
SUM(QTCOM) NOMART
---------- -------------------------
	 8 BONNET PARE-CHOCS
	 4 HAUSSE-CHAISE
	 5 BLOQUE PORTE
	25 DVD-SPIDER MAN 2
	11 BANDE DE FERMETURE
	 2 DVD-TOY STORY 2
	 5 K7 VIDEO-WINNIE L OURSON
       233 DVD-SPIRIT
	 2 PROTECTION DE FOUR
	 6 SIEGE DE TABLE
	 4 K7 VIDEO-TOY STORY
	 3 BARRIERE DE PORTE, EN BOIS
	 4 BABY PHONE


*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D06. Total des quantités commandées par catégorie d’article
PROMPT =========================================================
PROMPT

SELECT SUBSTR(REFART, 1, 2) AS REFA,SUM(QTCOM) AS TTART FROM ARTICLES NATURAL JOIN DETAILCOM GROUP BY SUBSTR(REFART, 1, 2); 

/*
RE	TTART
-- ----------
F1	   40
WD	   11
F2	    3
FB	  258

*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D07. Total du chiffre d’affaires par catégorie d’article
PROMPT =========================================================
PROMPT




SELECT SUBSTR(REFART, 1, 2) AS REFA, SUM(QTCOM*PVART - QTCOM*REMISE/100) AS CHAART FROM ARTICLES NATURAL JOIN DETAILCOM GROUP BY SUBSTR(REFART, 1, 2); 
		 

/*
RE     CHAART
-- ----------
F1     925,69
WD    268,015
F2	98,13
FB     6423,8
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D08. Total, moyenne, min et max du chiffre d’affaires par catégorie d’article
PROMPT =========================================================
PROMPT
SELECT SUBSTR(REFART, 1, 2) AS REFA,SUM(QTCOM*PVART - QTCOM*REMISE/100) AS CHAART, AVG(QTCOM*PVART- QTCOM*REMISE/100) AS CHAVG, MIN(QTCOM*PVART- QTCOM*REMISE/100) AS MINCH, MAX(QTCOM*PVART- QTCOM*REMISE/100) AS MAXCH FROM ARTICLES NATURAL JOIN Detailcom GROUP BY SUBSTR(REFART, 1, 2); 

/*
RE     CHAART	   CHAVG      MINCH	 MAXCH
-- ---------- ---------- ---------- ----------
F1     925,69  57,855625       6,51	161,42
WD    268,015	  24,365     21,265	 34,29
F2	98,13	   32,71      32,71	 32,71
FB     6423,8 377,870588      124,3	  1245
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D09. Le chiffre d’affaires par année
PROMPT =========================================================
PROMPT
SELECT SUM(QTCOM*PVART),TO_CHAR(DATCOM,'YYYY') AS ANNEE FROM DETAILCOM NATURAL JOIN ARTICLES NATURAL JOIN COMMANDES GROUP BY TO_CHAR(DATCOM,'YYYY') ORDER BY TO_CHAR(DATCOM,'YYYY');

/*
SUM(QTCOM*PVART) ANNE
---------------- ----
	  577,51 2000
	  187,36 2001
	 1757,39 2003
	  861,78 2005
	  4158,3 2007
	   174,3 2018
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete D10. Le nombre de valeurs différentes par colonne 
PROMPT =========================================================
PROMPT


SELECT SUM(COUNT(DISTINCT NUMCOM)) FROM COMMANDES GROUP BY NUMCOM
UNION ALL
SELECT SUM(COUNT(DISTINCT CODCLI)) FROM COMMANDES GROUP BY CODCLI
UNION ALL
SELECT SUM(COUNT(DISTINCT DATCOM)) FROM COMMANDES GROUP BY DATCOM
;

/*
SUM(COUNT(DISTINCTCODCLI))
--------------------------
			10
*/

PROMPT
pause Tapez sur Enter...
PROMPT





---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Ei (Jointures + Sélections + Projections)
--SELECT … FROM …PlusieursTables… WHERE … ;

--E01. Différents types de jointures (équi-jointure) : voir pages suivantes
--E02. full outer join
--E03. left join
--E04. right join
--E05. Produit Cartésien (Le cas le plus général sans clause WHERE ; la jointure est un cas particulier)
--E06. La téta-jointure (téta appartient à < <= > >= <>)
--E07.
--E08. Jointure & Optimisation des requêtes
--E09. Jointure avec une requête dans la clause FROM
--E10. Jointure & Ordre d’exécution des tables
--*/

PROMPT =========================================================
PROMPT >> Requete E01. Les clients ayant commandé et leurs commandes 
PROMPT =========================================================
PROMPT

TTITLE 'Jointure : Les clients ayant commandé et leurs commandes '
SELECT * FROM CLIENTS, COMMANDES WHERE CLIENTS.CODCLI= COMMANDES.CODCLI;


/*
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI     NUMCOM	 CODCLI DATCOM
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ---------- ---------- ------ ----------------------------
C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20001AB	 C012	SUNDAY	  17-SEPTEMBER-2000
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C001   Madame	CLEM@ENT Eve	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899 20002AB	 C001	SUNDAY	  17-SEPTEMBER-2000
						FOCH		  SUR O 	t@gmail.co 11
								 RGE		m

C006   Mademois LE BON	 Clemence      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889 20003AB	 C006	MONDAY	  16-OCTOBER  -2000
       elle					FOCH		  SUR S 	e bon@cfo. 955
								 EINE		fr

C006   Mademois LE BON	 Clemence      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889 20004AB	 C006	TUESDAY   24-OCTOBER  -2000
       elle					FOCH		  SUR S 	e bon@cfo. 955
								 EINE		fr

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20011RB	 C012	MONDAY	  22-JANUARY  -2001
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20012RB	 C012	TUESDAY   13-MARCH    -2001
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C001   Madame	CLEM@ENT Eve	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899 20031FB	 C001	FRIDAY	  14-FEBRUARY -2003
						FOCH		  SUR O 	t@gmail.co 11
								 RGE		m

C003   Madame	UNIQUE	 Marine        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899 20051FB	 C003	FRIDAY	  07-JANUARY  -2005
						LIBERTE 	 ILLE		ail.com    22

C003   Madame	UNIQUE	 Marine        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899 20052FB	 C003	WEDNESDAY 12-JANUARY  -2005
						LIBERTE 	 ILLE		ail.com    22

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20053FB	 C012	THURSDAY  10-MARCH    -2005
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899 20054FB	 C007	MONDAY	  14-MARCH    -2005
       elle					ROSIERE 			for@yahoo. 66
										fr

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20055FB	 C012	FRIDAY	  11-MARCH    -2005
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20056FB	 C013	MONDAY	  14-MARCH    -2005
						CARTAGE 			rt@yahoo.f 77
										r

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20057FB	 C014	FRIDAY	  11-MARCH    -2005
						ROME				é@gmail c
										om

C010   Monsieur TRAIFOR  Alexandr      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809   20061FB	 C010	FRIDAY	  14-FEBRUARY -2003
			 e			H				traifor@up
										13.fr

C009   Monsieur CLEMENCE Alexandr      1 5	RUE DE BEL 75019 PARIS	FRANCE	alexandre. +331494040 20062FB	 C009	FRIDAY	  14-FEBRUARY -2003
			 e			LEVILLE 			clemence@u 71
										p13.fr

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899 20065FB	 C007	FRIDAY	  14-FEBRUARY -2003
       elle					ROSIERE 			for@yahoo. 66
										fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20066FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20067FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20068FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20069FB	 C002	TUESDAY   30-JANUARY  -2007
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20070FB	 C002	TUESDAY   30-JANUARY  -2007
						TALIE				l@yahoo.fr

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20071FB	 C013	TUESDAY   30-JANUARY  -2007
						CARTAGE 			rt@yahoo.f 77
										r

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20072FB	 C013	TUESDAY   30-JANUARY  -2007
						CARTAGE 			rt@yahoo.f 77
										r

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20073FB	 C014	TUESDAY   30-JANUARY  -2007
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20074FB	 C014	TUESDAY   30-JANUARY  -2007
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20184FB	 C014	MONDAY	  17-SEPTEMBER-2018
						ROME				é@gmail c
										om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20181AB	 C012	MONDAY	  17-SEPTEMBER-2018
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

*/


PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete E02. Les clients ayant commandé et leurs commandes (full outer join)
PROMPT =========================================================
PROMPT


TTITLE 'Full outer join : Les clients ayant commandé et leurs commandes'
SELECT * FROM CLIENTS FULL OUTER JOIN COMMANDES ON CLIENTS.CODCLI= COMMANDES.CODCLI;


/*
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI     NUMCOM	 CODCLI DATCOM
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ---------- ---------- ------ ----------------------------
C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20001AB	 C012	SUNDAY	  17-SEPTEMBER-2000
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C001   Madame	CLEM@ENT Eve	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899 20002AB	 C001	SUNDAY	  17-SEPTEMBER-2000
						FOCH		  SUR O 	t@gmail.co 11
								 RGE		m

C006   Mademois LE BON	 Clemence      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889 20003AB	 C006	MONDAY	  16-OCTOBER  -2000
       elle					FOCH		  SUR S 	e bon@cfo. 955
								 EINE		fr

C006   Mademois LE BON	 Clemence      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889 20004AB	 C006	TUESDAY   24-OCTOBER  -2000
       elle					FOCH		  SUR S 	e bon@cfo. 955
								 EINE		fr

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20011RB	 C012	MONDAY	  22-JANUARY  -2001
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20012RB	 C012	TUESDAY   13-MARCH    -2001
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C001   Madame	CLEM@ENT Eve	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899 20031FB	 C001	FRIDAY	  14-FEBRUARY -2003
						FOCH		  SUR O 	t@gmail.co 11
								 RGE		m

C003   Madame	UNIQUE	 Marine        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899 20051FB	 C003	FRIDAY	  07-JANUARY  -2005
						LIBERTE 	 ILLE		ail.com    22

C003   Madame	UNIQUE	 Marine        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899 20052FB	 C003	WEDNESDAY 12-JANUARY  -2005
					no rows selected
	LIBERTE 	 ILLE		ail.com    22

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20053FB	 C012	THURSDAY  10-MARCH    -2005
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899 20054FB	 C007	MONDAY	  14-MARCH    -2005
       elle					ROSIERE 			for@yahoo. 66
										fr

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20055FB	 C012	FRIDAY	  11-MARCH    -2005
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20056FB	 C013	MONDAY	  14-MARCH    -2005
						CARTAGE 			rt@yahoo.f 77
										r

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20057FB	 C014	FRIDAY	  11-MARCH    -2005
						ROME				é@gmail c
										om

C010   Monsieur TRAIFOR  Alexandr      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809   20061FB	 C010	FRIDAY	  14-FEBRUARY -2003
			 e			H				traifor@up
										13.fr

C009   Monsieur CLEMENCE Alexandr      1 5	RUE DE BEL 75019 PARIS	FRANCE	alexandre. +331494040 20062FB	 C009	FRIDAY	  14-FEBRUARY -2003
			 e			LEVILLE 			clemence@u 71
										p13.fr

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899 20065FB	 C007	FRIDAY	  14-FEBRUARY -2003
       elle					ROSIERE 			for@yahoo. 66
										fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20066FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20067FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20068FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20069FB	 C002	TUESDAY   30-JANUARY  -2007
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20070FB	 C002	TUESDAY   30-JANUARY  -2007
						TALIE				l@yahoo.fr

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20071FB	 C013	TUESDAY   30-JANUARY  -2007
						CARTAGE 			rt@yahoo.f 77
										r

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20072FB	 C013	TUESDAY   30-JANUARY  -2007
						CARTAGE 			rt@yahoo.f 77
										r

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20073FB	 C014	TUESDAY   30-JANUARY  -2007
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20074FB	 C014	TUESDAY   30-JANUARY  -2007
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20184FB	 C014	MONDAY	  17-SEPTEMBER-2018
						ROME				é@gmail c
										om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20181AB	 C012	MONDAY	  17-SEPTEMBER-2018
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C017   Madame	RAHYM	 Karym	       1 1	RUE DES GE 1000  CARTHA TUNISIE karym.rahy +216248084
						NTILS		 GE		m@gmail.co 44
										m

C008   Monsieur VIVANT	 Jean-Bap      1 13	RUE DE LA  93800 EPINAY FRANCE	jeanbaptis 0607
			 tiste			PAIX		  SUR S 	te@
								 EINE

C004   Madame	CLEMENCE Evelyne       3 8 BIS	BOULEVARD  93800 EPINAY FRANCE	clemence e +337778899
						FOCH		  SUR S 	velyne@gma 33
								 EINE		il.com

C005   Madame	FORT	 Jeanne        3 55	RUE DU JAP 94310 ORLY V FRANCE	jfort\@hot +337778899
						ON		 ILLE		mail.fr    44

C018   Madame	GENIE	 Adam	       3 8	BOULEVARD  93800 EPINAY FRANCE	adam.géni +337778899
						FOCH		  SUR S 	e@gmail.co 11
								 EINE		m

C016   Madame	OBSOLETE Kadym	       7 1	RUE DES AN 000	 CARTHA IFRIQIA inexistant inexistant
						CIENS		 GE

C015   Monsieur LABSENT  Pala	       7 1	RUE DES AB 000	 BAGDAD IRAQ	pala-labse
						SENTS				nt@paici

C011   Monsieur PREMIER  Jos//Eph      2 77	RUE DE LA  13001 MARCHE FRANCE	josef@prem +337778899
						LIBERTE 	 ILLE		ier	   77



*/



PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =========================================================
PROMPT >> Requete E03. Les clients ayant commandé et leurs commandes (left join)
PROMPT =========================================================
PROMPT

TTITLE 'Left join : Les clients ayant commandé et leurs commandes'
SELECT * FROM CLIENTS LEFT OUTER JOIN COMMANDES ON CLIENTS.CODCLI= COMMANDES.CODCLI;



/*
		Meme resultat que la Requetes E02

*/


PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =========================================================
PROMPT >> Requete E04. Les clients ayant commandé et leurs commandes (right join)
PROMPT =========================================================
PROMPT

TTITLE 'Right join : Les clients ayant commandé et leurs commandes'
SELECT * FROM CLIENTS RIGHT OUTER JOIN COMMANDES ON CLIENTS.CODCLI= COMMANDES.CODCLI;


/*
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI     NUMCOM	 CODCLI DATCOM
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ---------- ---------- ------ ----------------------------
C001   Madame	CLEM@ENT Eve	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899 20031FB	 C001	FRIDAY	  14-FEBRUARY -2003
						FOCH		  SUR O 	t@gmail.co 11
								 RGE		m

C001   Madame	CLEM@ENT Eve	       1 18	BOULEVARD  91000 EPINAY FRANCE	eve.clemen +337778899 20002AB	 C001	SUNDAY	  17-SEPTEMBER-2000
						FOCH		  SUR O 	t@gmail.co 11
								 RGE		m

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20070FB	 C002	TUESDAY   30-JANUARY  -2007
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20069FB	 C002	TUESDAY   30-JANUARY  -2007
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20068FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20067FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565 20066FB	 C002	FRIDAY	  14-FEBRUARY -2003
						TALIE				l@yahoo.fr

C003   Madame	UNIQUE	 Marine        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899 20052FB	 C003	WEDNESDAY 12-JANUARY  -2005
						LIBERTE 	 ILLE		ail.com    22

C003   Madame	UNIQUE	 Marine        2 77	RUE DE LA  13001 MARCHE FRANCE	munique@gm +337778899 20051FB	 C003	FRIDAY	  07-JANUARY  -2005
						LIBERTE 	 ILLE		ail.com    22

C006   Mademois LE BON	 Clemence      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889 20004AB	 C006	TUESDAY   24-OCTOBER  -2000
       elle					FOCH		  SUR S 	e bon@cfo. 955
								 EINE		fr

C006   Mademois LE BON	 Clemence      1 18	BOULEVARD  93800 EPINAY FRANCE	clemence.l 0033777889 20003AB	 C006	MONDAY	  16-OCTOBER  -2000
       elle					FOCH		  SUR S 	e bon@cfo. 955
								 EINE		fr

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899 20065FB	 C007	FRIDAY	  14-FEBRUARY -2003
       elle					ROSIERE 			for@yahoo. 66
										fr

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899 20054FB	 C007	MONDAY	  14-MARCH    -2005
       elle					ROSIERE 			for@yahoo. 66
										fr

C009   Monsieur CLEMENCE Alexandr      1 5	RUE DE BEL 75019 PARIS	FRANCE	alexandre. +331494040 20062FB	 C009	FRIDAY	  14-FEBRUARY -2003
			 e			LEVILLE 			clemence@u 71
										p13.fr

C010   Monsieur TRAIFOR  Alexandr      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809   20061FB	 C010	FRIDAY	  14-FEBRUARY -2003
			 e			H				traifor@up
										13.fr

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20181AB	 C012	MONDAY	  17-SEPTEMBER-2018
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20055FB	 C012	FRIDAY	  11-MARCH    -2005
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20053FB	 C012	THURSDAY  10-MARCH    -2005
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20012RB	 C012	TUESDAY   13-MARCH    -2001
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20011RB	 C012	MONDAY	  22-JANUARY  -2001
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C012   Monsieur CLEMENT  Adam	       2 13	AVENUE JEA 9430  VILLET FRANCE	adam.cleme +331494040 20001AB	 C012	SUNDAY	  17-SEPTEMBER-2000
						N BAPTISTE	 ANEUSE 	nt@gmail.c 72
						 CLEMENT			om

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20072FB	 C013	TUESDAY   30-JANUARY  -2007
						CARTAGE 			rt@yahoo.f 77
										r

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20071FB	 C013	TUESDAY   30-JANUARY  -2007
						CARTAGE 			rt@yahoo.f 77
										r

C013   Monsieur FORT	 Gabriel       5 1	AVENUE DE  99000 TUNIS	TUNISIE gabriel.fo +216248017 20056FB	 C013	MONDAY	  14-MARCH    -2005
						CARTAGE 			rt@yahoo.f 77
										r

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20184FB	 C014	MONDAY	  17-SEPTEMBER-2018
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20074FB	 C014	TUESDAY   30-JANUARY  -2007
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20073FB	 C014	TUESDAY   30-JANUARY  -2007
						ROME				é@gmail c
										om

C014   Monsieur ADAM	 David	       5 1	AVENUE DE  99001 ROME	ITALIE	david.adam	      20057FB	 C014	FRIDAY	  11-MARCH    -2005
						ROME				é@gmail c
										om



*/


PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =========================================================
PROMPT >> Requete E05. Produit Cartésien (Le cas le plus général sans clause WHERE ; la jointure est un cas particulier)
PROMPT =========================================================
PROMPT
TTITLE 'sans clause WHERE : Les clients ayant commandé et leurs commandes'
SELECT * FROM CLIENTS, COMMANDES;
/*
	Le produit cartesien nous donne 504 ligne meme avec un Distinct car chaque ligne deviennent unique avec toutes
	les combinaisons.

*/


PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =========================================================
PROMPT >> Requete E06. La téta-jointure (téta appartient à < <= > >= <>)
PROMPT =========================================================
PROMPT

---- E06. Les dates des commandes des clients de PARIS
TTITLE 'Jointure : Les dates des commandes des clients de PARIS '
SELECT CLIENTS.CODCLI, COMMANDES.DATCOM FROM CLIENTS, COMMANDES WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND CLIENTS.VILCLI=LOWER('paris');

/**

no rows selected

	Celle-ci ne fonctionnne pas car toute nos vilcli sont en UPPER

**/
SELECT CLIENTS.CODCLI, COMMANDES.DATCOM FROM CLIENTS, COMMANDES WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND CLIENTS.VILCLI=UPPER('PARIS');

/**no rows selected

CODCLI DATCOM
------ ----------------------------
C007   MONDAY	 14-MARCH    -2005
C010   FRIDAY	 14-FEBRUARY -2003
C009   FRIDAY	 14-FEBRUARY -2003
C007   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   TUESDAY	 30-JANUARY  -2007
C002   TUESDAY	 30-JANUARY  -2007


	Celle-ci fonction grace au UPDATE des toutes les vilcli en UPPER

**/

-- Les requêtes ci-dessous ne donnent pas le même résultat à cause des majuscules-minuscules !
SELECT CLIENTS.CODCLI, COMMANDES.DATCOM FROM CLIENTS, COMMANDES WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND CLIENTS.VILCLI='PARIS';

/** 

		Meme resultat que la precedente

**/

SELECT CLIENTS.CODCLI, COMMANDES.DATCOM FROM CLIENTS, COMMANDES
WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND CLIENTS.VILCLI='paris';

SELECT CLIENTS.CODCLI, COMMANDES.DATCOM FROM CLIENTS, COMMANDES
WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND CLIENTS.VILCLI='Paris';


/*
	Memes resultats que la première
	
*/



PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete E08. Jointure & Optimisation des requêtes
PROMPT =========================================================
PROMPT


/** On a ajoute des DISTINCT car il y avait trop de redondances.**/


TTITLE '1. Jointure première écriture : Les clients de paris ayant commandé'
SELECT  CLIENTS.CODCLI, CLIENTS.NOMCLI 
FROM CLIENTS, COMMANDES
WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND CLIENTS.VILCLI=UPPER('paris');
/**
CODCLI NOMCLI
------ --------
C007   TRAIFOR
C010   TRAIFOR
C009   CLEMENCE
C007   TRAIFOR
C002   LESEUL
C002   LESEUL
C002   LESEUL
C002   LESEUL
C002   LESEUL

Avec le DISTINCT :

CODCLI NOMCLI
------ --------
C009   CLEMENCE
C002   LESEUL
C010   TRAIFOR
C007   TRAIFOR
**/
TTITLE '2. Jointure deuxième écriture : Les clients de paris ayant commandé'
SELECT DISTINCT CLIENTS.CODCLI, CLIENTS.NOMCLI FROM CLIENTS,COMMANDES
WHERE CLIENTS.VILCLI=UPPER('paris') 
AND CLIENTS.CODCLI  IN (SELECT COMMANDES.CODCLI FROM COMMANDES);



TTITLE '3. Jointure troisième écriture : Les clients de paris ayant commandé'
SELECT DISTINCT CLIENTS.CODCLI, CLIENTS.NOMCLI FROM CLIENTS,COMMANDES
WHERE CLIENTS.VILCLI=UPPER('paris') 
AND CLIENTS.CODCLI  = ANY (SELECT COMMANDES.CODCLI FROM COMMANDES);



TTITLE '4. Jointure quatrième écriture : Les clients de paris ayant commandé'
SELECT DISTINCT CLIENTS.CODCLI, CLIENTS.NOMCLI FROM CLIENTS,COMMANDES
WHERE CLIENTS.VILCLI=UPPER('paris') 
AND EXISTS (SELECT * FROM COMMANDES WHERE COMMANDES.CODCLI = CLIENTS.CODCLI);

TTITLE '5. Jointure cinquième écriture : Les clients de paris ayant commandé'
SELECT DISTINCT CLIENTS.CODCLI, CLIENTS.NOMCLI FROM CLIENTS,COMMANDES
WHERE CLIENTS.VILCLI=UPPER('paris') 
AND 0 < (SELECT COUNT(*) FROM COMMANDES WHERE COMMANDES.CODCLI = CLIENTS.CODCLI);


/*
CODCLI NOMCLI
------ --------
C009   CLEMENCE
C002   LESEUL
C010   TRAIFOR
C007   TRAIFOR

Sans les distincts il y a 112 lignes car il y a la totalite des commandes


*/




PROMPT
pause Tapez sur Enter...
PROMPT





PROMPT =========================================================
PROMPT >> Requete E09. Jointure avec une requête dans la clause FROM
PROMPT =========================================================
PROMPT

TTITLE '6. Jointure : Requête SELECT dans le FROM'
SELECT T.CODCLI, COMMANDES.DATCOM 
FROM (SELECT * FROM CLIENTS WHERE UPPER(VILCLI)='PARIS') T, COMMANDES
      WHERE T.CODCLI= COMMANDES.CODCLI;



/*
CODCLI DATCOM
------ ----------------------------
C007   MONDAY	 14-MARCH    -2005
C010   FRIDAY	 14-FEBRUARY -2003
C009   FRIDAY	 14-FEBRUARY -2003
C007   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   TUESDAY	 30-JANUARY  -2007
C002   TUESDAY	 30-JANUARY  -2007


*/


PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =========================================================
PROMPT >> Requete E10. Jointure & Ordre d’exécution des tables
PROMPT =========================================================
PROMPT


---- Jointure & choix de l’ordre d’exécution des tables pour des raisons de performances !
---- SELECT /* + ordered */  --->>>>> ceci s’appelle le hint !



TTITLE '7. JOINTURE : CHOIX DE L’ORDRE D’EXÉCUTION DES TABLES COMMANDES ET CLIENTS '
SELECT /* + ORDERED */ CLIENTS.CODCLI, COMMANDES.DATCOM FROM COMMANDES, CLIENTS
WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND UPPER(CLIENTS.VILCLI)='PARIS';

TTITLE '8. JOINTURE : CHOIX DE L’ORDRE D’EXÉCUTION DES TABLES CLIENTS ET COMMANDES'
SELECT /* + ORDERED */ CLIENTS.CODCLI, COMMANDES.DATCOM FROM CLIENTS, COMMANDES
WHERE CLIENTS.CODCLI= COMMANDES.CODCLI AND UPPER(CLIENTS.VILCLI)='PARIS';

/*
CODCLI DATCOM
------ ----------------------------
C007   MONDAY	 14-MARCH    -2005
C010   FRIDAY	 14-FEBRUARY -2003
C009   FRIDAY	 14-FEBRUARY -2003
C007   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   FRIDAY	 14-FEBRUARY -2003
C002   TUESDAY	 30-JANUARY  -2007
C002   TUESDAY	 30-JANUARY  -2007
*/


PROMPT
pause Tapez sur Enter...
PROMPT



--SELECT * FROM CLIENTS NATURAL JOIN COMMANDES WHERE TO_CHAR(DATCOM,'MM')=9 AND TO_CHAR(DATCOM,'YYYY')=2011;
--SELECT SUM(QSART*PVART) FROM ARTICLES NATURAL JOIN COMMANDES WHERE TO_CHAR(DATCOM,'MM')=9 AND TO_CHAR(DATCOM,'YYYY')=2011;

--SELECT REFART FROM DETAILCOM 
--WHERE NUMCOM IN (SELECT NUMCOM FROM COMMANDES) GROUP BY REFART HAVING COUNT(*) = (SELECT COUNT(DISTINCT NUMCOM) FROM COMMANDES);

--CREATE OR REPLACE VIEW COMMANDESPARISIENS AS 
--SELECT * FROM DETAILCOM WHERE NUMCOM IN (SELECT NUMCOM FROM COMMANDES WHERE CODCLI IN (SELECT CODCLI FROM CLIENTS WHERE VILCLI = 'PARIS'  ));

--SELECT REFART FROM DETAILCOM WHERE NUMCOM IN (SELECT NUMCOM FROM COMMANDESPARISIENS) 
--GROUP BY REFART HAVING COUNT(*) = (SELECT COUNT(DISTINCT NUMCOM) FROM COMMANDESPARISIENS);
--DROP VIEW COMMANDESPARISIENS;



---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Fi (Calculs + Sous-Totaux + Unions + Intersections + Différences + Jointures) 
--SELECT … FROM …PlusieursTables… WHERE … ;

--SELECT … FROM … WHERE … UNION S F W ;
--SELECT … FROM … WHERE … MINUS S F W ;
--SELECT … FROM … WHERE … INTERSECT S F W ;

--F01. Clients ayant commandé en septembre 2011
--F02. Montant total des commandes de septembre 2011
--F03. Commandes ayant des articles dont le prix vente est supérieur à 20 (Commande, Article, PV)
--F04. Commandes ayant des articles dont le prix vente est supérieur à 20 (Commande, Nombre)
--F05. Commandes ayant 4 articles dont le prix vente est supérieur à 20
--F06. Les clients de paris qui n’ont pas commandé en octobre 2011
--F07. Les clients de paris ou ceux ayant commandé en octobre 2011

--*/




PROMPT =========================================================
PROMPT >> Requete F01 : Clients ayant commandé en septembre 2011
PROMPT =========================================================
PROMPT

SELECT * FROM Clients NATURAL JOIN Commandes WHERE TO_CHAR(DATCOM,'MM')=9 AND TO_CHAR(DATCOM,'YYYY')=2011;

/*
no rows selected
*/

PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =========================================================
PROMPT >> Requete F02. Montant total des commandes de septembre 2011
PROMPT =========================================================
PROMPT

SELECT COUNT(NUMCOM) FROM COMMANDES WHERE TO_CHAR(DATCOM,'MM')=9 AND TO_CHAR(DATCOM,'YYYY')=2011;

/**
COUNT(NUMCOM)
-------------
	    0
**/


PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete F03. Commandes ayant des articles dont le prix vente est supérieur à 20 (Commande, Article, PV)
PROMPT =========================================================
PROMPT

SELECT NUMCOM,NOMART,PUART FROM COMMANDES NATURAL JOIN ARTICLES NATURAL JOIN DETAILCOM WHERE PUART>20 ORDER BY NUMCOM;

/**
NUMCOM	   NOMART		       PUART
---------- ------------------------- -------
20001AB    SIEGE DE TABLE	       35.00
20001AB    HAUSSE-CHAISE	       49.14
20001AB    K7 VIDEO-TOY STORY	       21.29
20002AB    SIEGE DE TABLE	       33.00
20002AB    K7 VIDEO-TOY STORY	       21.29
20002AB    DVD-TOY STORY 2	       34.29
20002AB    K7 VIDEO-WINNIE L OURSON    22.86
20003AB    DVD-SPIRIT		       21.00
20003AB    DVD-TOY STORY 2	       34.29
20003AB    K7 VIDEO-WINNIE L OURSON    22.86
20004AB    K7 VIDEO-TOY STORY	       21.29
20012RB    PROTECTION DE FOUR	       37.86
20012RB    DVD-SPIDER MAN 2	       24.00
20031FB    BARRIERE DE PORTE, EN BOI   30.71
	   S

20031FB    DVD-SPIRIT		       21.00
20051FB    DVD-SPIRIT		       21.00
20052FB    SIEGE DE TABLE	       35.00
20052FB    HAUSSE-CHAISE	       49.14
20052FB    K7 VIDEO-TOY STORY	       21.29
20052FB    K7 VIDEO-WINNIE L OURSON    22.86
20053FB    K7 VIDEO-WINNIE L OURSON    22.86
20054FB    K7 VIDEO-WINNIE L OURSON    22.86
20055FB    PROTECTION DE FOUR	       37.86
20055FB    BABY PHONE		       80.71
20055FB    BARRIERE DE PORTE, EN BOI   30.71
	   S

20056FB    BABY PHONE		       80.71
20057FB    BARRIERE DE PORTE, EN BOI   30.71
	   S

20061FB    DVD-SPIDER MAN 2	       24.00
20062FB    DVD-SPIDER MAN 2	       24.00
20065FB    DVD-SPIDER MAN 2	       24.00
20066FB    DVD-SPIDER MAN 2	       24.00
20067FB    DVD-SPIRIT		       24.00
20068FB    DVD-SPIRIT		       24.00
20069FB    DVD-SPIRIT		       58.00
20070FB    DVD-SPIRIT		       24.00
20071FB    DVD-SPIRIT		       27.90
20072FB    DVD-SPIRIT		       34.00
**/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================================================
PROMPT >> Requete F04. Commandes ayant des articles dont le prix vente est supérieur à 20 (Commande, Nombre)
PROMPT ====================================================================================================
PROMPT

SELECT NUMCOM,COUNT(QTCOM) FROM COMMANDES NATURAL JOIN ARTICLES NATURAL JOIN DETAILCOM WHERE PUART>20 GROUP BY NUMCOM;

/*

NUMCOM	   COUNT(QTCOM)
---------- ------------
20031FB 	      2
20056FB 	      1
20003AB 	      3
20054FB 	      1
20067FB 	      1
20068FB 	      1
20001AB 	      3
20070FB 	      1
20051FB 	      1
20061FB 	      1
20062FB 	      1
20066FB 	      1
20069FB 	      1
20002AB 	      4
20004AB 	      1
20071FB 	      1
20072FB 	      1
20012RB 	      2
20052FB 	      4
20053FB 	      1
20055FB 	      3
20057FB 	      1
20065FB 	      1


*/




PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete F05. Commandes ayant 4 articles dont le prix vente est supérieur à 20
PROMPT =========================================================
PROMPT

SELECT NUMCOM,COUNT(QTCOM) FROM COMMANDES NATURAL JOIN ARTICLES NATURAL JOIN DETAILCOM WHERE PUART>20 GROUP BY NUMCOM HAVING COUNT(QTCOM)=4;

/**
NUMCOM	   COUNT(QTCOM)
---------- ------------
20002AB 	      4
20052FB 	      4
**/


PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete F06. Les clients de paris qui n’ont pas commandé en octobre 2011
PROMPT =========================================================
PROMPT

SELECT * FROM Clients WHERE UPPER(VILCLI) = 'PARIS' 
AND CODCLI NOT IN 
(SELECT CODCLI FROM Commandes WHERE TO_CHAR(DATCOM,'MM')=9 AND TO_CHAR(DATCOM,'YYYY')=2011);

/**
CODCLI CIVCLI	NOMCLI	 PRENCLI  CATCLI ADNCLI ADRCLI	   CPCLI VILCLI PAYSCLI MAILCLI    TELCLI
------ -------- -------- -------- ------ ------ ---------- ----- ------ ------- ---------- ----------
C009   Monsieur CLEMENCE Alexandr      1 5	RUE DE BEL 75019 PARIS	FRANCE	alexandre. +331494040
			 e			LEVILLE 			clemence@u 71
										p13.fr

C007   Mademois TRAIFOR  Alice	       2 6	RUE DE LA  75015 PARIS	FRANCE	alice.trai +337778899
       elle					ROSIERE 			for@yahoo. 66
										fr

C010   Monsieur TRAIFOR  Alexandr      1 16	AVENUE FOC 75016 PARIS	FRA	alexandre. 06070809
			 e			H				traifor@up
										13.fr

C002   Madame	LESEUL	 M@Rie	       1 21	AVENUE D I 75013 PARIS	FRANCE	marieleseu 0617586565
						TALIE				l@yahoo.fr

**/


SELECT CODCLI FROM Clients WHERE UPPER(VILCLI) = 'PARIS' 
MINUS
SELECT CODCLI FROM Commandes WHERE TO_CHAR(DATCOM,'MM')=10 AND TO_CHAR(DATCOM,'YYYY')=2011;

/**
CODCLI
------
C002
C007
C009
C010
**/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =========================================================
PROMPT >> Requete F07. Les clients de paris ou ceux ayant commandé en octobre 2011
PROMPT =========================================================
PROMPT


SELECT CODCLI FROM Clients WHERE UPPER(VILCLI) = 'PARIS' 
UNION 
SELECT CODCLI FROM Commandes WHERE TO_CHAR(DATCOM,'MM')=10 AND TO_CHAR(DATCOM,'YYYY')=2011;


/**
CODCLI
------
C002
C007
C009
C010
**/


PROMPT
pause Tapez sur Enter...
PROMPT





---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Gi (Divisions)
--SELECT … FROM …PlusieursTables… WHERE … ;

--G01. Les articles qui figurent sur toutes les commandes !
--G02. Articles commandés par tous les parisiens
--G03. Les articles qui figurent sur toutes les commandes d’une période donnée !

--*/
PROMPT =====================================================================
PROMPT >> Requete G01. Les articles qui figurent sur toutes les commandes !
PROMPT =====================================================================
PROMPT
SELECT REFART, NOMART FROM ARTICLES WHERE NOT EXISTS (SELECT * FROM CLIENTS WHERE
NOT EXISTS (SELECT * FROM COMMANDES, DETAILCOM WHERE COMMANDES.NUMCOM = DETAILCOM.NUMCOM AND DETAILCOM.REFART = ARTICLES.REFART AND COMMANDES.CODCLI = CLIENTS.CODCLI));

/*
no rows selected
*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Requete G02. Articles commandés par tous les parisiens
PROMPT =====================================================================
PROMPT

SELECT REFART, NOMART FROM ARTICLES WHERE NOT EXISTS (SELECT * FROM CLIENTS WHERE UPPER(VilCli) = 'PARIS'AND 
NOT EXISTS (SELECT * FROM COMMANDES, DETAILCOM WHERE COMMANDES.NUMCOM = DETAILCOM.NUMCOM AND DETAILCOM.REFART = ARTICLES.REFART AND COMMANDES.CODCLI = CLIENTS.CODCLI));

/*
REFART	 NOMART
-------- -------------------------
FB.003	 DVD-SPIDER MAN 2

*/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Requete G03. Les articles qui figurent sur toutes les commandes d’une période donnée !
PROMPT =====================================================================
PROMPT


SELECT REFART, NOMART FROM ARTICLES, COMMANDES WHERE NOT EXISTS (SELECT * FROM CLIENTS WHERE  
NOT EXISTS (SELECT * FROM COMMANDES, DETAILCOM WHERE COMMANDES.NUMCOM = DETAILCOM.NUMCOM AND DETAILCOM.REFART = ARTICLES.REFART AND COMMANDES.CODCLI = CLIENTS.CODCLI AND EXTRACT(YEAR FROM DATCOM) = '2009'));


/*
no rows selected
*/

PROMPT
pause Tapez sur Enter...
PROMPT

---- On pourrait appliquer une suite d'opérations, de l'Algèbre relationnelle, qui définissent la division !



---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Hi (SQL Avancé, SQL pour le multidimensionnel)
--CUBE ; ROLLUP ; RANK() OVER

--H01. Nombre de clients
--H02. Nombre de pays
--H03. Nombre de clients par catégorie
--H04. Nombre de clients par catégorie et par ville
--H05. Nombre de clients par ville et par catégorie
--H06. Nombre de clients par catégorie et par ville : fonction CUBE
--H07. Nombre de clients par catégorie et par ville : fonction ROLLUP

--H08. Classez les clients par ordre décroissant du chiffre d’affaires CA
--H09. Classez les clients par ordre décroissant du CA, donnez le rang
--H10. Classez les clients par ordre décroissant du CA, donnez le rang : RANK() OVER…
--H11. Clients par ordre décroissant du CA et de la catégorie, donnez le rang
--H12. Clients par ordre décroissant du CA et de la catégorie, donnez le rang

--*/


PROMPT =========================================================
PROMPT >> Requete H01. Nombre de clients
PROMPT =========================================================
PROMPT


SELECT COUNT(*) AS NBCLI FROM Clients;
/*
     NBCLI
----------
	18
*/


ttitle 'Nombre de clients'
SELECT COUNT(CODCLI) AS NBCLIENTS FROM CLIENTS;
/*
 NBCLIENTS
----------
	18
*/

PROMPT
pause Tapez sur Enter...
PROMPT

--SELECT PaysCli AS Pays, COUNT(*) AS NbrCli FROM Clients GROUP BY PaysCli;
--SELECT CatCli AS Categorie, COUNT(*) AS NbrCli FROM Clients GROUP BY CatCli;
--SELECT CatCli AS Category, VilCli AS City, COUNT(*) AS nbcv FROM Clients GROUP BY VilCli, CatCli;
--SELECT vilcli, catcli, COUNT(*) FROM Clients GROUP BY vilcli, catcli;
--SELECT catcli, vilcli, COUNT(*) FROM Clients GROUP BY CUBE(catcli,vilcli);
--SELECT catcli, vilcli, COUNT(*) FROM Clients GROUP BY ROLLUP (catcli, vilcli);



PROMPT =====================================================================
PROMPT >> Requete H02. Nombre de pays
PROMPT =====================================================================
PROMPT


TTITLE 'NOMBRE DE PAYS'
SELECT COUNT(DISTINCT PAYSCLI) AS NBPAYS FROM CLIENTS;


/*
    NBPAYS
----------
	 5
*/

PROMPT
pause Tapez sur Enter...
PROMPT





PROMPT =====================================================================
PROMPT >> Requete  H03. Nombre de clients par catégorie
PROMPT =====================================================================
PROMPT


ttitle 'Nombre de clients par catégorie'
SELECT CATCLI AS CATEGORIE, COUNT(*) AS NBC FROM CLIENTS 
GROUP BY CATCLI ORDER BY CATEGORIE;

/*
 CATEGORIE	  NBC
---------- ----------
	 1	    7
	 2	    4
	 3	    3
	 5	    2
	 7	    2
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete H04. Nombre de clients par catégorie et par ville
PROMPT =====================================================================
PROMPT


TTITLE 'NOMBRE DE CLIENTS PAR CATÉGORIE ET PAR VILLE'
SELECT CATCLI AS CATEGORIE, VILCLI AS VILLE, COUNT(*) AS NBCV FROM CLIENTS 
GROUP BY CATCLI, VILCLI ORDER BY CATEGORIE;


/*
 CATEGORIE VILLE		      NBCV
---------- -------------------- ----------
	 1 CARTHAGE			 1
	 1 EPINAY SUR ORGE		 1
	 1 EPINAY SUR SEINE		 2
	 1 PARIS			 3
	 2 MARCHEILLE			 2
	 2 PARIS			 1
	 2 VILLETANEUSE 		 1
	 3 EPINAY SUR SEINE		 2
	 3 ORLY VILLE			 1
	 5 ROME 			 1
	 5 TUNIS			 1
	 7 BAGDAD			 1
	 7 CARTHAGE			 1
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete H05. Nombre de clients par ville et par catégorie
PROMPT =====================================================================
PROMPT



TTITLE 'NOMBRE DE CLIENTS PAR CATÉGORIE ET PAR VILLE'
SELECT VILCLI AS VILLE, CATCLI AS CATEGORIE, COUNT(*) AS NBCV FROM CLIENTS
GROUP BY VILCLI, CATCLI ORDER BY CATEGORIE;



/*
 CATEGORIE VILLE		      NBCV
---------- -------------------- ----------
	 1 CARTHAGE			 1
	 1 EPINAY SUR ORGE		 1
	 1 EPINAY SUR SEINE		 2
	 1 PARIS			 3
	 2 MARCHEILLE			 2
	 2 PARIS			 1
	 2 VILLETANEUSE 		 1
	 3 EPINAY SUR SEINE		 2
	 3 ORLY VILLE			 1
	 5 ROME 			 1
	 5 TUNIS			 1
	 7 BAGDAD			 1
	 7 CARTHAGE			 1
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete  H06. Nombre de clients par catégorie et par ville  fonction CUBE
PROMPT =====================================================================
PROMPT


TTITLE 'NOMBRE DE CLIENTS PAR CATÉGORIE ET PAR VILLE CUBE'
SELECT CATCLI AS CATEGORIE, VILCLI AS VILLE, COUNT(*) AS NBCV FROM CLIENTS 
GROUP BY CUBE(CATCLI, VILCLI);

/*
 CATEGORIE VILLE		      NBCV
---------- -------------------- ----------
					18
	   ROME 			 1
	   PARIS			 4
	   TUNIS			 1
	   BAGDAD			 1
	   CARTHAGE			 2
	   MARCHEILLE			 2
	   ORLY VILLE			 1
	   VILLETANEUSE 		 1
	   EPINAY SUR ORGE		 1
	   EPINAY SUR SEINE		 4
	 1				 7
	 1 PARIS			 3
	 1 CARTHAGE			 1
	 1 EPINAY SUR ORGE		 1
	 1 EPINAY SUR SEINE		 2
	 2				 4
	 2 PARIS			 1
	 2 MARCHEILLE			 2
	 2 VILLETANEUSE 		 1
	 3				 3
	 3 ORLY VILLE			 1
	 3 EPINAY SUR SEINE		 2
	 5				 2
	 5 ROME 			 1
	 5 TUNIS			 1
	 7				 2
	 7 BAGDAD			 1
	 7 CARTHAGE			 1

*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete  H07. Nombre de clients par catégorie et par ville  fonction ROLLUP
PROMPT =====================================================================
PROMPT



TTITLE 'NOMBRE DE CLIENTS PAR CATÉGORIE ET PAR VILLE ROLLUP'
SELECT CATCLI AS CATEGORIE, VILCLI AS VILLE, COUNT(*) AS NBCV FROM CLIENTS 
GROUP BY ROLLUP(CATCLI, VILCLI);



/*
 CATEGORIE VILLE		      NBCV
---------- -------------------- ----------
	 1 PARIS			 3
	 1 CARTHAGE			 1
	 1 EPINAY SUR ORGE		 1
	 1 EPINAY SUR SEINE		 2
	 1				 7
	 2 PARIS			 1
	 2 MARCHEILLE			 2
	 2 VILLETANEUSE 		 1
	 2				 4
	 3 ORLY VILLE			 1
	 3 EPINAY SUR SEINE		 2
	 3				 3
	 5 ROME 			 1
	 5 TUNIS			 1
	 5				 2
	 7 BAGDAD			 1
	 7 CARTHAGE			 1
	 7				 2
					18

*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete  H08. Classez les clients par ordre décroissant du chiffre d’affaires CA
PROMPT =====================================================================
PROMPT

CREATE OR REPLACE VIEW CLI 
AS 
SELECT CLIENTS.CODCLI AS CODCLI, CLIENTS.CATCLI AS CATCLI, SUM(D.PUART*D.QTCOM-D.REMISE*D.PUART/100) AS CA 
FROM CLIENTS, COMMANDES, DETAILCOM D
WHERE COMMANDES.NUMCOM=D.NUMCOM AND COMMANDES.CODCLI=CLIENTS.CODCLI 
GROUP BY CLIENTS.CODCLI,CLIENTS.CATCLI;


TTITLE 'LES CLIENTS PAR ORDRE DÉCROISSANT DU CA'
SELECT * FROM CLI ORDER BY CA;

/*
CODCLI CATCLI	      CA
------ ------ ----------
C010	    1	     120
C009	    1	     120
C007	    2	  142,86
C006	    1	188,5326
C001	    1	285,6413
C003	    2	364,2901
C012	    2	807,6137
C014	    5	  813,09
C013	    5	 1465,72
C002	    1	    3826
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete  H09. Classez les clients par ordre décroissant du ca, donnez le rang
PROMPT =====================================================================
PROMPT


TTITLE 'LES CLIENTS PAR ORDRE DÉCROISSANT DU CA, DONNEZ LE RANG'
SELECT (SELECT COUNT(*)+1 FROM CLI C2 WHERE C1.CA<C2.CA) AS RANG,
CATCLI, CODCLI, NOMCLI, CA, VILCLI, PAYSCLI
FROM CLI C1 NATURAL JOIN CLIENTS
ORDER BY RANG;

/*
      RANG	   CA CODCLI NOMCLI   CATCLI VILCLI PAYSCLI
---------- ---------- ------ -------- ------ ------ -------
	 1	 3826 C002   LESEUL	   1 PARIS  FRANCE
	 2    1465,72 C013   FORT	   5 TUNIS  TUNISIE
	 3     813,09 C014   ADAM	   5 ROME   ITALIE
	 4   807,6137 C012   CLEMENT	   2 VILLET FRANCE
					     ANEUSE

	 5   364,2901 C003   UNIQUE	   2 MARCHE FRANCE
					     ILLE

	 6   285,6413 C001   CLEM@ENT	   1 EPINAY FRANCE
					      SUR O
					     RGE

	 7   188,5326 C006   LE BON	   1 EPINAY FRANCE
					      SUR S
					     EINE

	 8     142,86 C007   TRAIFOR	   2 PARIS  FRANCE
	 9	  120 C010   TRAIFOR	   1 PARIS  FRANCE
	 9	  120 C009   CLEMENCE	   1 PARIS  FRANCE
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete H10. Classez les clients par ordre décroissant du ca, donnez le rang : RANK() OVER…
PROMPT =====================================================================
PROMPT


TTITLE 'CLASSEZ LES CLIENTS PAR ORDRE DÉCROISSANT DU CA, DONNEZ LE RANG'
SELECT RANK() OVER(ORDER BY CA DESC) AS RANG,
CA, CODCLI, NOMCLI, CATCLI, VILCLI, PAYSCLI
FROM CLI NATURAL JOIN CLIENTS;



/*
      RANG	   CA CODCLI NOMCLI   CATCLI VILCLI PAYSCLI
---------- ---------- ------ -------- ------ ------ -------
	 1	 3826 C002   LESEUL	   1 PARIS  FRANCE
	 2    1465,72 C013   FORT	   5 TUNIS  TUNISIE
	 3     813,09 C014   ADAM	   5 ROME   ITALIE
	 4   807,6137 C012   CLEMENT	   2 VILLET FRANCE
					     ANEUSE

	 5   364,2901 C003   UNIQUE	   2 MARCHE FRANCE
					     ILLE

	 6   285,6413 C001   CLEM@ENT	   1 EPINAY FRANCE
					      SUR O
					     RGE

	 7   188,5326 C006   LE BON	   1 EPINAY FRANCE
					      SUR S
					     EINE

	 8     142,86 C007   TRAIFOR	   2 PARIS  FRANCE
	 9	  120 C009   CLEMENCE	   1 PARIS  FRANCE
	 9	  120 C010   TRAIFOR	   1 PARIS  FRANCE
*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete H11. Clients par ordre décroissant du ca et de la catégorie, donnez le rang
PROMPT =====================================================================
PROMPT


TTITLE 'CLIENTS PAR ORDRE DÉCROISSANT DU CA ET DE LA CATÉGORIE, DONNEZ LE RANG'
SELECT RANK() OVER (ORDER BY CA DESC, CATCLI DESC) AS RANG,
CA, CODCLI, NOMCLI, CATCLI, VILCLI, PAYSCLI
FROM CLI NATURAL JOIN CLIENTS;



/*
      RANG	   CA CODCLI NOMCLI   CATCLI VILCLI PAYSCLI
---------- ---------- ------ -------- ------ ------ -------
	 1	 3826 C002   LESEUL	   1 PARIS  FRANCE
	 2    1465,72 C013   FORT	   5 TUNIS  TUNISIE
	 3     813,09 C014   ADAM	   5 ROME   ITALIE
	 4   807,6137 C012   CLEMENT	   2 VILLET FRANCE
					     ANEUSE

	 5   364,2901 C003   UNIQUE	   2 MARCHE FRANCE
					     ILLE

	 6   285,6413 C001   CLEM@ENT	   1 EPINAY FRANCE
					      SUR O
					     RGE

	 7   188,5326 C006   LE BON	   1 EPINAY FRANCE
					      SUR S
					     EINE

	 8     142,86 C007   TRAIFOR	   2 PARIS  FRANCE
	 9	  120 C010   TRAIFOR	   1 PARIS  FRANCE
	 9	  120 C009   CLEMENCE	   1 PARIS  FRANCE

*/

PROMPT
pause Tapez sur Enter...
PROMPT



PROMPT =====================================================================
PROMPT >> Requete H12. Clients par ordre décroissant du ca et de la catégorie, donnez le rang
PROMPT =====================================================================
PROMPT

CREATE OR REPLACE VIEW CLI2 AS 
SELECT CLIENTS.CODCLI AS CODCLI, CLIENTS.CATCLI AS CATCLI, SUM(D.PUART*D.QTCOM-D.REMISE*D.PUART/100) AS CA, CLIENTS.PAYSCLI AS PAYSCLI, CLIENTS.NOMCLI AS NOMCLI, CLIENTS.VILCLI AS VILCLI
FROM CLIENTS, COMMANDES, DETAILCOM D
WHERE COMMANDES.NUMCOM=D.NUMCOM AND COMMANDES.CODCLI=CLIENTS.CODCLI 
GROUP BY CLIENTS.CODCLI,CLIENTS.CATCLI,CLIENTS.PAYSCLI, CLIENTS.NOMCLI, CLIENTS.VILCLI;

TTITLE 'CLIENTS PAR ORDRE DÉCROISSANT DU CA ET DE LA CATÉGORIE, DONNEZ LE RANG'
SELECT COUNT(C2.CA) AS RANG,C1.CA, C1.CODCLI, C1.NOMCLI, C1.CATCLI, C1.VILCLI, C1.PAYSCLI
FROM CLI2 C1, CLI2 C2
WHERE C1.CA <= C2.CA OR (C1.CA=C2.CA AND C1.CATCLI=C2.CATCLI)
GROUP BY C1.CATCLI, C1.CA, C1.CODCLI, C1.NOMCLI, C1.VILCLI, C1.PAYSCLI
ORDER BY C1.CA DESC, C1.CATCLI DESC;
--/*
--Remarques : 
--La première partie de la clause WHERE C1.cacli <= C2.cacli permet de ne pas compter le nombre d’occurrences 
--où la valeur de la colonne cacli est <= à elle-même. 
--Si la colonne cacli ne contient pas de doublons, cette partie de la clause 
--where serait en elle-même suffisante pour générer le rang correct.
--La deuxième partie de la clause WHERE or (C1.cacli=C2.cacli and C1.catcli=C2.catcli), 
--garantit qu’en présence de doublons dans la colonne cacli, chaque valeur obtiendrait le correct.

--A VERIFIER pour les clients ex æquo
--*/

/*
      RANG	   CA CODCLI NOMCLI   CATCLI VILCLI PAYSCLI
---------- ---------- ------ -------- ------ ------ -------
	 1	 3826 C002   LESEUL	   1 PARIS  FRANCE
	 2    1465,72 C013   FORT	   5 TUNIS  TUNISIE
	 3     813,09 C014   ADAM	   5 ROME   ITALIE
	 4   807,6137 C012   CLEMENT	   2 VILLET FRANCE
					     ANEUSE

	 5   364,2901 C003   UNIQUE	   2 MARCHE FRANCE
					     ILLE

	 6   285,6413 C001   CLEM@ENT	   1 EPINAY FRANCE
					      SUR O
					     RGE

	 7   188,5326 C006   LE BON	   1 EPINAY FRANCE
					      SUR S
					     EINE

	 8     142,86 C007   TRAIFOR	   2 PARIS  FRANCE
	10	  120 C009   CLEMENCE	   1 PARIS  FRANCE
	10	  120 C010   TRAIFOR	   1 PARIS  FRANCE
*/

PROMPT
pause Tapez sur Enter...
PROMPT

---- =======================================================================
---- =======================================================================
---- =======================================================================
--/*
--Exemples de requêtes à Tester : ----->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Requêtes du type Ii (SQL Gestion de Gros volumes de Données - Export / Import)

--I01. Export depuis une BD gérée par un SGBD vers des fichiers (Extraction/Export/Déchargement)

--Utilisation de l’utilitaire SPOOLER pour extraire/exporter les tables d’une BD vers des fichiers textes
--(sql> spool nomdefichier.txt 		sql>select… 			sql> spool off)
--(sql> spool nomdefichier.lst 		sql>select…				sql> spool off)

--Déchargez toutes les tables de la BD GCI dans des fichiers CSV en utilisant le « ; » comme séparateur de colonnes.

--I02. Import Depuis des fichiers vers une BD gérée par un SGBD (Import/Chargement)
--Importer/Chargez toutes les tables de la BD GCI à partir de fichiers de différents types tels que CSV, Excel et autres. 
--Le « ; » est utilisé comme séparateur de colonnes.

--*/


--PROMPT =====================================================================
--PROMPT Affichage des magasins de  l entreprise BB EN SQL 2 
--PROMPT =====================================================================
--PROMPT

--COLUMN NUMMAG		FORMAT A4
--COLUMN NOMMAG		FORMAT A8
--COLUMN TELMAG		FORMAT A10
--COLUMN ADRNUMMAG	FORMAT A5
--COLUMN ADRRUEMAG	FORMAT A10
--COLUMN ADRCPMAG		FORMAT A7
--COLUMN ADRVILLEMAG	FORMAT A10
--COLUMN ADRPAYSMAG	FORMAT A10
--COLUMN MAILMAG	    FORMAT A10

--SELECT * FROM MAGASINS;

--PROMPT
--Pause Tapez sur Enter...
--PROMPT

----====================================================================================
----====================================================================================
----====================================================================================
----==================== Modification de la structure des données ======================
----==================== ATTENTION : CETTE ACTION EST DANGEREUSE !!! ===================
----==================== ATTENTION :  A UTILISER/CONSOMMER AVEC MODERATION !!!==========
----====================================================================================
----====================================================================================
---- Modifiez la structure de la table MAGASINS
---- Ajoutez la colonne MAILMAG de type VARCHAR(30)

--ALTER TABLE MAGASINS
--ADD MAILMAG VARCHAR(30);

---- Développez une procédure CREERMAILMAG qui permet d Insérer les nouvelles données dans cette colonne
---- Le mail d un magasin (en minuscule) est composé de : 'bb' + NUMMAG + '@gmail.com'

--CREATE OR REPLACE PROCEDURE CREERMAILMAG IS
--BEGIN
--EXECUTE IMMEDIATE 'UPDATE MAGASINS SET MAILMAG=concat(concat(''bb'',nummag),''@gmail.com'')';
--END;
--/

--EXEC CREERMAILMAG;

----======================================================================================
----======================================================================================
----======================================================================================
---- MFB FFF ++++++++ Déchargement des données des magasins dans un fichier au format CSV
---- MFB FFF ++++++++ Le séparateur est ;
----======================================================================================
--SPOOL listemag.csv

--SELECT 
--NUMMAG      || ';' ||
--NOMMAG      || ';' ||
--TELMAG      || ';' ||
--ADRNUMMAG   || ';' ||
--ADRRUEMAG   || ';' ||
--ADRCPMAG    || ';' ||
--ADRVILLEMAG || ';' ||
--ADRPAYSMAG  || ';' ||
--ADRVILLEMAG || ';' ||
--MAILMAG
--FROM MAGASINS;

--SPOOL OFF

---- =========================================================================

---- ??? A QUOI CORRESPONDENT LES 4 REQUETES CI-DESSOUS
---- PLACEZ LES DANS LA CATEGORIE DE REQUETES CORRESPONDANTE

--SELECT codcli, SUM(ca) FROM (SELECT codcli, numcom, SUM((puart * QTCOM)*(1-remise/100)) AS CA  
--FROM Clients  NATURAL JOIN Commandes NATURAL JOIN Detailcom NATURAL JOIN Articles GROUP BY numcom, codcli) 
--GROUP BY codcli ORDER BY SUM(ca) DESC;

--SELECT (SELECT COUNT(*)+1 FROM Clients c2 WHERE c1.catcli<c2.catcli) AS rang, catcli,codcli,Nomcli,catcli,vilcli,PaysCli 
--FROM Clients c1 ORDER BY rang;

--SELECT RANK() OVER(ORDER BY catcli DESC) AS rang, catcli,codcli, Nomcli,catcli,vilcli,PaysCli FROM Clients;

--SELECT RANK() OVER (ORDER BY catcli DESC,catcli DESC) AS rang, catcli, codcli,Nomcli, catcli,vilcli,PaysCli FROM Clients;

---- =========================================================================


--PROMPT =====================================================================
--PROMPT >> Requete FB01 : Articles commandés toujours en quantité > 5
--PROMPT =====================================================================
--PROMPT
--TTITLE CENTER 'Requete: les articles toujours commandés en quantité superieure à 5' skip 1 -
--       LEFT   '=========================================================================' skip 0
--SELECT d.NUMCOM, a.REFART, a.NOMART
--FROM   ARTICLES a, DETAILCOM d
--WHERE  a.REFART = d.REFART
--AND    d.QTCOM > 5;
--      
---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

--PROMPT =====================================================================
--PROMPT >> Requete FB02 : Articles sans remise depuis le 1er JANUARY 2005
--PROMPT =====================================================================
--PROMPT
--TTITLE CENTER 'Requete: Articles sans remise depuis le 1er JANUARY 2005' skip 1 -
--       LEFT   '=========================================================================' skip 0
--SELECT	d.NUMCOM, a.REFART, a.NOMART
--FROM	ARTICLES a, DETAILCOM d, COMMANDES c
--WHERE	EXTRACT(YEAR FROM DATCOM) > 2004
--AND	c.NUMCOM = d.NUMCOM
--AND	d.REFART = a.REFART
--AND	d.REMISE = 0;

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

---- =================================================================
---- ========= Quelques requetes de suivi du chiffre d affaires DEBUT
---- =================================================================

---- ????????????      FB FB FB FB FB FB A compléter ??????????????

--PROMPT =========================================================
--PROMPT >> Requete FB03 : Chiffre d affaires global du magasin en question
--PROMPT =========================================================
--PROMPT
--SELECT 
--SUM((PUART*QTCOM)*(1-REMISE/100.0)) AS CHIFFRE_AFFAIRES 
--FROM DETAILCOM;

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

--PROMPT =========================================================
--PROMPT >> Requete FB04 : Chiffre d affaires par jour
--PROMPT =========================================================
--PROMPT
--SELECT 
--C.DATCOM,SUM((D.PUART*D.QTCOM)*(1-D.REMISE/100.0)) AS CHIFFRE_AFFAIRES  
--FROM DETAILCOM D JOIN COMMANDES C ON C.NUMCOM=D.NUMCOM
--GROUP BY C.DATCOM
--ORDER BY C.DATCOM;

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

--PROMPT =========================================================
--PROMPT >> Requete FB05 : Chiffre d affaires par mois
--PROMPT =========================================================
--PROMPT
--SELECT 
--EXTRACT(MONTH FROM C.DATCOM) AS MOIS,
--SUM((D.PUART*D.QTCOM)*(1-D.REMISE/100.0)) AS CHIFFRE_AFFAIRES  
--FROM DETAILCOM D JOIN COMMANDES C ON C.NUMCOM=D.NUMCOM
--GROUP BY EXTRACT(MONTH FROM C.DATCOM)
--ORDER BY EXTRACT(MONTH FROM C.DATCOM);

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT


--PROMPT =========================================================
--PROMPT >> Requete FB06 : Chiffre d affaires par année
--PROMPT =========================================================
--PROMPT
--SELECT 
--EXTRACT(YEAR FROM C.DATCOM) AS ANNEE,
--SUM((D.PUART*D.QTCOM)*(1-D.REMISE/100.0)) AS CHIFFRE_AFFAIRES  
--FROM DETAILCOM D JOIN COMMANDES C ON C.NUMCOM=D.NUMCOM
--GROUP BY EXTRACT(YEAR FROM C.DATCOM)
--ORDER BY EXTRACT(YEAR FROM C.DATCOM);

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT


--PROMPT =========================================================
--PROMPT >> Requete FB07 : Chiffre d affaires par ville du client
--PROMPT =========================================================
--PROMPT
--SELECT UPPER(LTRIM(RTRIM(VilCli))) AS VILLE,
--sum((D.PUART*D.QTCOM)*(1-D.REMISE/100.0)) as CHIFFRE_AFFAIRES  
--FROM DETAILCOM D JOIN COMMANDES C ON C.NUMCOM=D.NUMCOM 
--JOIN CLIENTS ON CLIENTS.CODCLI=C.CODCLI
--GROUP BY UPPER(LTRIM(RTRIM(VilCli))) 
--ORDER BY UPPER(LTRIM(RTRIM(VilCli)));

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT


--PROMPT =========================================================
--PROMPT >> Requete FB08 : Chiffre d affaires par pays du client
--PROMPT =========================================================
--PROMPT
--TTITLE CENTER 'Requete: permet de determiner le chiffre d affaires par pays' skip 1 -
--       LEFT   '=========================================================================' skip 0
--SELECT	c.PAYSCLI, SUM((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) AS chiffre_affaires 
--FROM	DETAILCOM d, CLIENTS c, COMMANDES k
--WHERE	d.NUMCOM  = k.NUMCOM
--AND	 	c.CODCLI = k.CODCLI
--GROUP BY c.PAYSCLI;

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ------------------------------ ---------------
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

--PROMPT =========================================================
--PROMPT >> Requete FB09 : Chiffre d affaires par pays et par ville du client
--PROMPT =========================================================
--PROMPT
--SELECT 
--UPPER(LTRIM(RTRIM(PAYSCLI))) AS PAYS,
--UPPER(LTRIM(RTRIM(VilCli))) AS VILLE,
--SUM((D.PUART*D.QTCOM)*(1-D.REMISE/100.0)) AS CHIFFRE_AFFAIRES  
--FROM DETAILCOM D JOIN COMMANDES C ON C.NUMCOM=D.NUMCOM 
--JOIN CLIENTS ON CLIENTS.CODCLI=C.CODCLI
--GROUP BY UPPER(LTRIM(RTRIM(PAYSCLI))),UPPER(LTRIM(RTRIM(VilCli))) 
--ORDER BY UPPER(LTRIM(RTRIM(PAYSCLI))),UPPER(LTRIM(RTRIM(VilCli)));

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ------------------------------ ---------------
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

---- =================================================================
---- ========= Quelques requetes de suivi du chiffre d affaires FIN
---- =================================================================





----======================================================================================
----======================================================================================
----======================================================================================

----======================================================================================
----======================================================================================
----======================================================================================

----======================================================================================
----======================================================================================
----======================================================================================
---- MFB FFF +++++++++++++++++++   QUALITE DES DONNEES !! DATA QUALITY !!
---- MFB FFF +++++++++++++++++++   NETTOYAGE DES DONNEES !! DATA CLEANING !!
----======================================================================================
---- Qualité des données ::: Y-a-t-il des anomalies dans les données ? 
---- Quelles sont ces anomalies ? Comment les détecter et comment les corriger ?
----======================================================================================
----======================================================================================
----==== Vérification de la validité (véracité) des données de l'entreprise BB ===========
----========== Donnée valide ? Donnée INVALIDE ===========================================
----======================================================================================
----======================================================================================

---- Quelques règles de gestion afin d'homogénéiser et normaliser les données
---- La colonne NOMCLI n'est pas bien renseignée ni commentée NO COMMENT !
---- Les seules contraintes définies sur la colonne NOMCLI sont :
-------- Son type syntaxique >> NOMCLI VARCHAR2(20),
-------- Son type/caratère obligatoire >> CONSTRAINT NN_CLIENTS_NOMCLI CHECK(NOMCLI IS NOT NULL),
---- Il faudrait par exemple ajouter :
---- la majuscule >> CONSTRAINT CK_CLIENTS_NOMCLI	CHECK(NOMCLI = UPPER(NOMCLI)),
---- l'expression régulière qui permet de définir la règle alphabétique
--/*
--LE PROBLEME EST : La Détection et La Correction des anomalies dans les données
--Mesures de la qualité des Données ; Profilage des données

--*/


---- ????????????      FB FB FB FB FB FB A compléter ??????????????

--PROMPT =========================================================
--PROMPT >> Requete : Les Noms des clients NON MAJUSCULEs !
--PROMPT =========================================================
--PROMPT
--SELECT NOMCLI FROM CLIENTS WHERE NOMCLI <> UPPER(NOMCLI);

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

--PROMPT =========================================================
--PROMPT >> Requete : Les Noms des clients NON Alphabétiques !
--PROMPT =========================================================
--PROMPT

--SELECT NOMCLI FROM CLIENTS WHERE NOT REGEXP_LIKE (REPLACE(NOMCLI,' ',''),'^[A-Za-z]+$');
--SELECT NOMCLI FROM CLIENTS WHERE NOT REGEXP_LIKE (NOMCLI,'^[A-Za-z ]+$');
--SELECT NOMCLI FROM CLIENTS WHERE NOT REGEXP_LIKE (NOMCLI,'^[[:alpha:] ]+$');

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT


--/*
--Etant donné les requêtes ci-dessous qui permettent de voir aisément qu’il y a des anomalies dans les données !
--La question qui se pose est « Comment détecter et corriger les anomalies dans les données ? ».
--*/

--REM Liste des pays
--TTITLE 'Liste des pays'
--SELECT DISTINCT paycli AS Pays FROM Clients;

--REM Nombre de pays
--TTITLE 'Nombre de pays'
--SELECT COUNT(DISTINCT paycli) AS NbPays FROM Clients;

--REM Liste des villes
--TTITLE 'Liste des villes'
--SELECT DISTINCT vilcli AS Villes FROM Clients;

--REM Nombre de villes
--TTITLE 'Nombre de villes'
--SELECT COUNT(DISTINCT vilcli) AS NbVilles FROM Clients;


--/*
--CREATE TABLE CLIENTS
--(
--	CODCLI		VARCHAR2(10), 
--	CIVCLI		VARCHAR2(12),
--	NOMCLI		VARCHAR2(20),
--	PRENCLI		VARCHAR2(20),
--	CATCLI		NUMBER(1),
--	ADNCLI		VARCHAR2(10),
--	ADRCLI		VARCHAR2(50),
--	CPCLI		VARCHAR2(10),
--	VilCli		VARCHAR2(20),
--	PAYSCLI		VARCHAR2(30),
--	MAILCLI		VARCHAR2(30),
--	TELCLI		VARCHAR2(20),
--	CONSTRAINT PK_CLIENTS				PRIMARY KEY(CODCLI),
--	CONSTRAINT CK_CLIENTS_CIVCLI		CHECK(CIVCLI IN ('Mademoiselle', 'Madame', 'Monsieur')),
--	CONSTRAINT CK_CLIENTS_CATCLI		CHECK(CATCLI BETWEEN 1 and 7),
--	CONSTRAINT NN_CLIENTS_NOMCLI		CHECK(NOMCLI IS NOT NULL),
--	CONSTRAINT NN_CLIENTS_PRENCLI		CHECK(PRENCLI IS NOT NULL),
--	CONSTRAINT NN_CLIENTS_CATCLI		CHECK(CATCLI IS NOT NULL),
--	CONSTRAINT CK_CLIENTS_VilCli		CHECK(VilCli = UPPER(VilCli)),
--	CONSTRAINT CK_CLIENTS_PAYSCLI		CHECK(PAYSCLI = UPPER(PAYSCLI))
--);
--*/
---- Vérifier toutes les informations relatives aux clients...

---- Afficher les clients pour lesquels on n'a pas de téléphone (Code, Nom, Tel)
--CREATE OR REPLACE VIEW CLISANSTEL (Code, Nom, Tel)
--AS SELECT CODCLI, NOMCLI, TELCLI FROM CLIENTS WHERE TELCLI IS NULL;
--SELECT * FROM CLISANSTEL;
---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

---- Afficher les clients pour lesquels les mails sont invalides ou qui n'ont pas de mail (Code, Nom, Mail)
--CREATE OR REPLACE VIEW CLIINVALIDMAIL (Code, Nom, Mail)
--AS SELECT CODCLI, NOMCLI, MAILCLI FROM CLIENTS 
--WHERE MAILCLI IS NULL 
--OR NOT REGEXP_LIKE (LTRIM(RTRIM(MAILCLI)),'^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
--SELECT * FROM CLIINVALIDMAIL;
---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

---- Afficher les clients pour lesquels les téléphones sont invalides (Code, Nom, Tel)
--CREATE OR REPLACE VIEW CLIINVALIDTEL (Code, Nom, Tel)
--AS SELECT CODCLI, NOMCLI, TELCLI FROM CLIENTS 
--WHERE TELCLI IS NULL 
--OR NOT REGEXP_LIKE (LTRIM(RTRIM(TELCLI)),'^((([\+]|[0]{2})([1-9]{3}|[1-9]{2}))|([0]))[1-9]([0-9]{8}|[0-9]{7})$');
--SELECT * FROM CLIINVALIDTEL;
---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT

---- Afficher les clients pour lesquels le nom ou le prénom n'est pas alphabétique (Code, Nom, Prénom)
---- ou que le nom n'est pas en MAJUSCULE
---- ou que le prénom n'est pas "Première lettre en Majuscule et le reste en minuscule
--CREATE OR REPLACE VIEW CLIINVALIDNAME (Code, Nom, Prenom)
--AS SELECT CODCLI, NOMCLI, PRENCLI FROM CLIENTS 
--WHERE 
--NOMCLI NOT REGEXP_LIKE (LTRIM(RTRIM(NOMCLI)),'^[A-Z ]+$') OR 
--PRENCLI NOT REGEXP_LIKE (LTRIM(RTRIM(PRENCLI)),'^[A-Z][a-z ]+$') ;
--SELECT * FROM CLIINVALIDNAME;
---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
---- ??? 

--PROMPT
--pause Tapez sur Enter...
--PROMPT


----====================================================================================
----====================================================================================
---- Développer le mécanisme (procédure et/ou fonction) qui le fait avec comme paramètres par exemple :
---- les noms de la table et de la colonne à vérifier moyennant une EXPRESSION REGULIERE ou autre
---- Créer une table pour stocker les expressions régulières par catégorie sémantique de données
----====================================================================================
----====================================================================================
--CREATE TABLE REGULAREXPRES
--(
--CATEGORY 								VARCHAR2(20), 
--REGULAREXPR 							VARCHAR2(200),
--CONSTRAINT PK_REGULAREXPRES				PRIMARY KEY(CATEGORY),
--CONSTRAINT CK_REGULAREXPRES_CATEGORY	CHECK(CATEGORY = UPPER(CATEGORY))
--);

---- Des catégories sémantiques de données définies avec des expressions régulières
---- Le nombre de valeurs clés est infini
--INSERT INTO REGULAREXPRES VALUES
--('MAIL','^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
--INSERT INTO REGULAREXPRES VALUES
--('TELFR-I','^(([\+]|[0]{2})([3]{2}))[1-9]([0-9]{8})$');
--INSERT INTO REGULAREXPRES VALUES
--('TELFR','^[0][1-9][0-9]{8}$');
--INSERT INTO REGULAREXPRES VALUES
--('TELBE-I', '^(([\+]|[0]{2})[3][2])[4]([5-9]{1})([0-9]{7})$');
--INSERT INTO REGULAREXPRES VALUES
--('TELBE', '^[0][4]([5-9]{1})([0-9]{7})$');
--INSERT INTO REGULAREXPRES VALUES
--('TELTN-I', '^(([\+]|[0]{2})[2][1][6])[1-9]([0-9]{7})$');
--INSERT INTO REGULAREXPRES VALUES
--('TELTN', '^[0][1-9]([0-9]{7})$');
---- et d'autres téléphone selon votre pays d origine et plus
--INSERT INTO REGULAREXPRES VALUES
--('DATEFR', '^(([0-2][0-9]|3[0-1])/(0[0-9]|1[0-2])/[0-9]{4})$');
--INSERT INTO REGULAREXPRES VALUES
--('DATEAM', '^((0[0-9]|1[0-2])/([0-2][0-9]|3[0-1])/[0-9]{4})$');
--INSERT INTO REGULAREXPRES VALUES
--('ALPHABETIQUE', '^[[:alpha:] ]+$');
--INSERT INTO REGULAREXPRES VALUES
--('NUMERIQUE', '^[[:digit:]]+$');
--INSERT INTO REGULAREXPRES VALUES
--('TEMPERATURECF', '^[-[:digit:].°C]+$');

---- Des catégories sémantiques de données définies avec des expressions régulières
---- Le nombre de valeurs (ou mots) clés est fini
---- La civilité (CIVILITY) est définie par exemple par : 
--/*
--Madame, MADAME, MAdame, Mme, MME... Mademoiselle, MADEMOISELLE, MADEMoiselle, Mlle...
--Madam, MADAM, MaDAm, Mrs, MRS, Miss, MISS...
--Monsieur, MONSIEUR, M., ...
--Sir, SIR, Mr., M.,...
--*/

--INSERT INTO REGULAREXPRES VALUES ('MADEMOISELLE', 'MADEMOISELLE|MLLE|Mademoiselle|MADEMoiselle|Miss|MISS');
--INSERT INTO REGULAREXPRES VALUES ('MADAME', 'MADAME|MAdame|Mme|MME|Madam|MADAM|MaDAm|Mrs|MRS');
--INSERT INTO REGULAREXPRES VALUES ('MONSIEUR', 'MONSIEUR|MR|M\.|Sir|SIR|Mr\.');
---- Le sexe (SEX) est défini par exemple par : 
--/*
--Femme, FEMME, Femelle, F
--Woman, Wife, Female, F
--Homme, HOMME, Male, MALe, M, H
--MAN, Man, Male, MALe, M
--*/
--INSERT INTO REGULAREXPRES VALUES ('FEMALE', 'Femme|FEMME|Femelle|F|Woman|Wife|Female');
--INSERT INTO REGULAREXPRES VALUES ('MALE', 'Homme|HOMME|Male|MALe|M|H|MAN|Man|Male|MALe');
---- Le groupe sanguin (BLOODGROUP) est définie par les seules valeurs MAJUSCULES 
---- fondées sur les systèmes ABO et Rhésus : 
--/*
--A+, A-, B+, B-, AB+, AB-, O+ et O-
--*/
--INSERT INTO REGULAREXPRES VALUES ('BLOODGROUP', 'A-|A+|B-|B+|AB-|AB+|O-|O+');

--COMMIT;


---- Créeer une fonction qui permet de dire si une valeur vérifie une expression régulière
---- CREATE OR REPLACE FUNCTION VerifRegExpr (...Valeur ...CategExpReg) renvoie Vrai ou Faux

--CREATE OR REPLACE FUNCTION VerifRegExpr( p_variable IN varchar2, p_category IN varchar2 )
--RETURN VARCHAR2
--IS
--RESULT varchar2(50);
--REGULAR VARCHAR2(250);
--BEGIN
--	SELECT REGULAREXPR INTO REGULAR FROM REGULAREXPRES WHERE Category=p_category ;		
--	SELECT CASE WHEN (SELECT count(*) FROM DUAL 
--	WHERE NOT REGEXP_LIKE (p_variable ,REGULAR ))> 0 THEN 'FALSE' ELSE 'TRUE' END INTO RESULT FROM DUAL ;
--RETURN(RESULT);
--END;
--/
--SELECT VerifRegExpr('0555555555','TELFR') AS resultat_verification FROM dual;

---------------------------------PROCEDURE GENERALE

--CREATE OR REPLACE PROCEDURE VerifRegExpr(p_table IN varchar2, p_colonne IN varchar2, p_category IN varchar2)
--AUTHID CURRENT_USER IS
--BEGIN
--	FOR i IN (SELECT REGULAREXPR FROM REGULAREXPRES WHERE Category=p_category) 
--		LOOP
--			EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW VueVerif ('||p_colonne||'_NonValide) 
--			AS SELECT '||p_colonne||' from '||p_table||' where not REGEXP_LIKE ('||p_colonne||','''||i.REGULAREXPR||''')';
--		END LOOP;
--END;
--/
--EXEC VerifRegExpr('clients','TELCLI','TELFR');


---- ????????????      FB FB FB FB FB FB A compléter ??????????????



----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
----==================== INTRA-COLONNE ===================================================
----==================== INTER-COLONNES (Dépendances sémantiques, DF) ====================
----==================== INTER-LIGNES (Doubles et similaires =============================

--PROMPT =========================================================
---- Nom du Cas       :  TRAITEMENT DE CERTAINES ANOMALIES (INTRA-COLONNE et INTER-COLONNES)
---- Nom de SGBD      :  ORACLE DBMS                    
---- Date de création :  SEPTEMBER 2019
---- Auteur           :  Faouzi BOUFARES 
---- Université       :  Université Sorbonne Paris Cité, Université Paris 13 
---- Formation        :  Master 2 EID 2  
--PROMPT =========================================================
--PROMPT 
--PROMPT =========================================================
--PROMPT |                                                       |
--PROMPT |     Exercice 2 :  VILPAYS    avec SQL 2               |
--PROMPT |     Manipulations-Interrogations de BD                |
--PROMPT |                                                       |
--PROMPT =========================================================
--PROMPT
--PROMPT

--/*
--Entre parenthèses hihi haha FFF ! (...)

--Etant donné la table VILPAYS suivante :
--Elle est issue des tables de la BD GesComI... 
--Faire les requêtes ci-dessous : 
--Calculs dans la table VILPAYS !
--*/

--CREATE TABLE VILPAYS (COL1 VARCHAR2(20), COL2 VARCHAR2(20));

--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', '');
--INSERT INTO VILPAYS VALUES ('EPINAY SUR SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', '');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('MARCHEILLE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', '');
--INSERT INTO VILPAYS VALUES ('ORLY-VILLE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('MARCHEILLE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('PARYS', 'FR');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('Paris', '');
--INSERT INTO VILPAYS VALUES ('PARIS', 'france');
--INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
--INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
--INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
--INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
--INSERT INTO VILPAYS VALUES ('Brusselle', 'Belgic');
--INSERT INTO VILPAYS VALUES ('Berlin', 'ALLEMANGNE');
--INSERT INTO VILPAYS VALUES ('Berlin', 'ALLEMANGNE');
--INSERT INTO VILPAYS VALUES ('Berlin', 'ALLEMANGNE');
--INSERT INTO VILPAYS VALUES ('Dublin', 'ALEMANGNE');
--INSERT INTO VILPAYS VALUES ('TUNIS', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'Italie');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUcE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', '');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('BIZERTE', '');
--INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('DJERBA', 'France');
--INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUScE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('TUNIS', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('JERBA', 'TUNISIE');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANC');
--INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANC');
--INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('VILETANEUSE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARIS', 'FRANC');
--INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
--INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('ROME', 'ITALIE');
--INSERT INTO VILPAYS VALUES ('ROME', 'ITALIA');
--INSERT INTO VILPAYS VALUES ('MADRID', 'Espagne');
--INSERT INTO VILPAYS VALUES ('MADRID', 'Spain');
--INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
--INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
--INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
--INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGUAL');
--INSERT INTO VILPAYS VALUES ('Dacar', 'SENEGAL');
--INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
--INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
--INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
--INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
--INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIA');
--INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
--INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
--INSERT INTO VILPAYS VALUES ('ALGER', 'ALGER');
--INSERT INTO VILPAYS VALUES ('CAIRO', 'Egypt');
--INSERT INTO VILPAYS VALUES ('Marrakech', 'Marroc');
--INSERT INTO VILPAYS VALUES ('Fès', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Rabat', 'Marok');
--INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Casablanca', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Casablanka', 'Maroc');
--INSERT INTO VILPAYS VALUES ('Rabat', '');
--INSERT INTO VILPAYS VALUES ('PARI', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('PARISI', 'FRANCE');
--INSERT INTO VILPAYS VALUES ('BAGDAD', 'IRAQ');
--INSERT INTO VILPAYS VALUES ('BAGDAD', 'IRAQ');
--INSERT INTO VILPAYS VALUES ('BAGDAD', 'IRAQ');
--INSERT INTO VILPAYS VALUES ('BAGDADE', 'IRAQ');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRA');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
--INSERT INTO VILPAYS VALUES ('TEHERAN', '');
--INSERT INTO VILPAYS VALUES ('TEERAN', 'IRAN');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'YRAN');
--INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRANE');
--COMMIT; 

----======================================================================================
----======================================================================================
----======================================================================================

--REM VISUALISATION DES DONNEES
--SELECT * FROM VILPAYS;

--REM HOMOGENEISATION DES DONNEES : TOUT EN MAJUSCULE
--UPDATE VILPAYS SET COL1 = UPPER(COL1);
--UPDATE VILPAYS SET COL2 = UPPER(COL2);
--COMMIT;
--SELECT * FROM VILPAYS;

--REM Calcul du nombre de lignes dans la table
--SELECT COUNT(*) FROM VILPAYS;

--REM Calcul du nombre de villes et du nombre de pays
--SELECT COUNT(COL1) AS NBVILLES, COUNT(COL2) AS NBPAYS FROM VILPAYS;

--REM Calcul du nombre de villes et du nombre de pays
--SELECT COUNT(DISTINCT COL1) AS NBVILLES, COUNT(DISTINCT COL2) AS NBPAYS FROM VILPAYS;

--REM Compter le nombre d occurrences par valeur de COL1 et valeur de COL2 afin de détecter d éventuelles anomalies
--CREATE OR REPLACE VIEW V1 (VILLE, NOMBRE) AS SELECT COL1, COUNT(*) FROM VILPAYS GROUP BY COL1 ORDER BY 1;
--SELECT * FROM V1;
--CREATE OR REPLACE VIEW V2 (PAYS, NOMBRE) AS SELECT COL2, COUNT(*) FROM VILPAYS GROUP BY COL2 ORDER BY 1;
--SELECT * FROM V2;

--REM On considère que la valeur la plus fréquente (pour chaque groupe de valeurs similaires) est la chaine de caractères valide
--REM Développez le processus qui permet de détecter les anomalies et éventuellement les corriger

---- ????????????      FB FB FB FB FB FB A compléter ??????????????
---- A VOUS ! -- BON COURAGE -- MFB
---- ????????????      FB FB FB FB FB FB A compléter ??????????????

--CREATE OR REPLACE PROCEDURE corrigerVille
--AUTHID CURRENT_USER IS
--   a number(2) := 10; 
--BEGIN 
--   WHILE a > 0  LOOP

--EXECUTE IMMEDIATE  'CREATE OR REPLACE VIEW V1 (VILLE, NOMBRE) AS SELECT COL1, COUNT(*) FROM VILPAYS GROUP BY COL1 ORDER BY 1';

--EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW Vcor1 (VILLE1, NOMBRE1,VILLE2,nombre2,similarity,distance,prononce,score,correction) 
--		AS 
--		SELECT t1.ville,t1.nombre,t2.ville,t2.nombre,UTL_MATCH.jaro_winkler_similarity(t1.ville,t2.ville ) as similarity,UTL_MATCH.edit_distance_similarity(t1.ville,t2.ville ) as distance, 
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.ville),SOUNDEX(t2.ville)) as prononce,
--		(UTL_MATCH.jaro_winkler_similarity(t1.ville,t2.ville )+UTL_MATCH.edit_distance_similarity(t1.ville,t2.ville )+
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.ville),SOUNDEX(t2.ville)))/3.0 AS SCORE,CASE WHEN t1.nombre>t2.nombre THEN t1.ville else t2.ville end as correction from v1 t1 
--		join v1 t2 on t1.ville<t2.ville 
--		where  ((UTL_MATCH.jaro_winkler_similarity(t1.ville,t2.ville )+UTL_MATCH.edit_distance_similarity(t1.ville,t2.ville )+
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.ville),SOUNDEX(t2.ville)))/3.0) >=85
--		group by t1.ville,t2.ville,t1.nombre,t2.nombre
--		order by SCORE';

--EXECUTE IMMEDIATE 'UPDATE VILPAYS
--set col1=(select correction from vcor1 where (col1=ville1 or col1=ville2) and rownum = 1)
--where col1 in (select ville1 from vcor1) or col1 in (select ville2 from vcor1)' ;

--SELECT count(*) INTO a FROM Vcor1;

--   END LOOP; 
--END;
--/

--EXEC corrigerVille;


--CREATE OR REPLACE PROCEDURE corrigerPays
--AUTHID CURRENT_USER IS
--   a number(2) := 10; 
--BEGIN 
--   WHILE a > 0  LOOP

--EXECUTE IMMEDIATE  'CREATE OR REPLACE VIEW V2 (PAYS, NOMBRE) AS SELECT COL2, COUNT(*) FROM VILPAYS GROUP BY COL2 ORDER BY 1';

--EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW Vcor2 (PAYS1, NOMBRE1,PAYS2,nombre2,similarity,distance,prononce,score,correction)
--		AS 
--		SELECT t1.PAYS,t1.nombre,t2.PAYS,t2.nombre,UTL_MATCH.jaro_winkler_similarity(t1.PAYS,t2.PAYS ) as similarity,UTL_MATCH.edit_distance_similarity(t1.PAYS,t2.PAYS ) as distance, 
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.PAYS),SOUNDEX(t2.PAYS)) as prononce,
--		(UTL_MATCH.jaro_winkler_similarity(t1.PAYS,t2.PAYS )+UTL_MATCH.edit_distance_similarity(t1.PAYS,t2.PAYS )+
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.PAYS),SOUNDEX(t2.PAYS)))/3.0 AS SCORE,CASE WHEN t1.nombre>t2.nombre THEN t1.PAYS else t2.PAYS end as correction from V2 t1 
--		join V2 t2 on t1.PAYS<t2.PAYS 
--		where  ((UTL_MATCH.jaro_winkler_similarity(t1.PAYS,t2.PAYS )+UTL_MATCH.edit_distance_similarity(t1.PAYS,t2.PAYS )+
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.PAYS),SOUNDEX(t2.PAYS)))/3.0) >=85
--		group by t1.PAYS,t2.PAYS,t1.nombre,t2.nombre
--		order by SCORE';

--EXECUTE IMMEDIATE 'UPDATE VILPAYS
--set col2=(select correction from vcor2 where (col2=PAYS1 or col2=PAYS2) and rownum = 1)
--where col2 in (select PAYS1 from vcor2) or col2 in (select PAYS2 from vcor2)' ;

--SELECT count(*) INTO a FROM Vcor2;

--   END LOOP; 
--END;
--/

--EXEC corrigerPays;


--CREATE OR REPLACE PROCEDURE corrigervillepays
--AUTHID CURRENT_USER IS
--   a number(2) := 10; 
--BEGIN 
--   WHILE a > 0  LOOP 
--      dbms_output.put_line('value of a: ' || a); 
--      EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW V3 (VILLEPAYS, NOMBRE) AS SELECT COL1||'';''||COL2, COUNT(*) FROM VILPAYS GROUP BY COL1||'';''||COL2  ORDER BY 1;';
--      EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW Vcor3 (VILLEPAYS1, NOMBRE1, VILLEPAYS2, nombre2, similarity, distance, prononce, score, correction, nbrcor)
--		AS 
--		SELECT t1.VILLEPAYS,t1.nombre,t2.VILLEPAYS,t2.nombre,UTL_MATCH.jaro_winkler_similarity(t1.VILLEPAYS,t2.VILLEPAYS ) as similarity,UTL_MATCH.edit_distance_similarity(t1.VILLEPAYS,t2.VILLEPAYS ) as distance, 
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.VILLEPAYS),SOUNDEX(t2.VILLEPAYS)) as prononce,
--		(UTL_MATCH.jaro_winkler_similarity(t1.VILLEPAYS,t2.VILLEPAYS )+UTL_MATCH.edit_distance_similarity(t1.VILLEPAYS,t2.VILLEPAYS )+
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.VILLEPAYS),SOUNDEX(t2.VILLEPAYS)))/3.0 AS SCORE,CASE WHEN t1.nombre>t2.nombre THEN t1.VILLEPAYS else t2.VILLEPAYS end as correction,CASE WHEN t1.nombre > t2.nombre THEN t1.nombre else t2.nombre end as nbrcor from v3 t1 
--		join v3 t2 on t1.VILLEPAYS<t2.VILLEPAYS 
--		where  ((UTL_MATCH.jaro_winkler_similarity(t1.VILLEPAYS,t2.VILLEPAYS )+UTL_MATCH.edit_distance_similarity(t1.VILLEPAYS,t2.VILLEPAYS )+
--		UTL_MATCH.jaro_winkler_similarity(SOUNDEX(t1.VILLEPAYS),SOUNDEX(t2.VILLEPAYS)))/3.0) >=75
--		group by t1.VILLEPAYS,t2.VILLEPAYS,t1.nombre,t2.nombre
--		order by nbrcor RESC';
--      EXECUTE IMMEDIATE 'UPDATE VILPAYS set col1=(select SUBSTR(correction,0,INSTR(correction,'';'')-1) from vcor3 where (VILLEPAYS1 = COL1||'';''||COL2 or VILLEPAYS2= COL1||'';''||COL2) and rownum = 1) , col2=(select SUBSTR(correction,INSTR(correction,'';'')+1) from vcor3 where (VILLEPAYS1 = COL1||'';''||COL2 or VILLEPAYS2= COL1||'';''||COL2) and rownum = 1) 
--                         where COL1||'';''||COL2 in (select VILLEPAYS1 from vcor3) or COL1||'';''||COL2 in (select VILLEPAYS2 from vcor3)' ;
--      SELECT count(*) INTO a FROM Vcor3;	
--   END LOOP; 
--END;
--/

--EXEC corrigervillepays;

----======================================================================================
----======================================================================================
----======================================================================================
----==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
----==================== INTER-LIGNES ====================================================
--/*
--Entre parenthèses hihi haha FFF ! (...)

--Etant donné la table TABCLI suivante :
--Elle est issue des tables de la BD GesComI... 
--Faire les requêtes ci-dessous : 
--Eliminer les doubles et les similaires !
--*/

--CREATE TABLE TABCLI (COL1 VARCHAR(10), COL2 VARCHAR(12), COL3 VARCHAR(10), COL4 VARCHAR(10), COL5 VARCHAR(1));

--INSERT INTO TABCLI VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
--INSERT INTO TABCLI VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1');
--INSERT INTO TABCLI VALUES ('3000107', 'MO NSIEUR', 'ONRI', 'PANDA', '2');
--INSERT INTO TABCLI VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1');
--INSERT INTO TABCLI VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1');
--INSERT INTO TABCLI VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2');
--INSERT INTO TABCLI VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1');
--INSERT INTO TABCLI VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1');
--INSERT INTO TABCLI VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1');
--INSERT INTO TABCLI VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3');
--INSERT INTO TABCLI VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1');
--INSERT INTO TABCLI VALUES ('3001778', 'Mr', 'COURTOIS', 'Bruno', '1');
--INSERT INTO TABCLI VALUES ('3001779', 'Monsieur', 'VANDERHOTE', 'Ivan', '1');
--INSERT INTO TABCLI VALUES ('3001780', 'Monsieur', 'Hollanda', 'Francis', '1');
--INSERT INTO TABCLI VALUES ('3001781', 'Monsieur', 'Bernard', 'Hugues', '1');
--INSERT INTO TABCLI VALUES ('3001782', 'Monsieur', 'LATIFOU', 'Ilyas', '1');
--INSERT INTO TABCLI VALUES ('3001783', 'Madame', 'LALLEMAND', 'Ines', '1');
--INSERT INTO TABCLI VALUES ('3001784', 'Monsieur', 'DEUTCH', 'Hans', '1');
--INSERT INTO TABCLI VALUES ('3001785', 'Madame', 'ALMANI', 'Eve', '1');
--INSERT INTO TABCLI VALUES ('3001786', 'Madame', 'MERQUELLE', 'Angela', '1');
--INSERT INTO TABCLI VALUES ('3001', 'M.', 'LE BON', 'Adam', '1');
--INSERT INTO TABCLI VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1');
--INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
--INSERT INTO TABCLI VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2');
--INSERT INTO TABCLI VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2');
--INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
--INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
--INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '');
--INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
--INSERT INTO TABCLI VALUES ('3001777', 'Monsieùr', 'LE BON', 'Adam', '1');
--COMMIT; 


-----Elimination des doubles 

--create table tabcli_temp as
--select col1,col2,col3,col4,col5
--from tabcli
--group by col1,col2,col3,col4,col5
--having count(*)>1;

--delete from tabcli t
--where exists 
--(select * from tabcli_temp t2 where t2.col1=t.col1
--and t2.col2=t.col2
--and t2.col3=t.col3
--and t2.col4=t.col4
--and t2.col5=t.col5
--group by t2.col1,t2.col2,t2.col3,t2.col4,t2.col5);

--insert into tabcli
--select * from tabcli_temp;

-----Detection et elimination des SIMILAIRES

--CREATE OR REPLACE PROCEDURE corrigerSimilaire
--AUTHID CURRENT_USER IS
--   a number(2) := 10; 
--BEGIN 
--   WHILE a > 0  LOOP

--EXECUTE IMMEDIATE  'update tabcli set col5=0 where col5 is null';

--EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW Vtabcli (col11,col12,col13,col14,col15,col21,col22,col23,col24,col25,SImilarity)
--		AS 
--		select t1.*,t2.*,(UTL_MATCH.jaro_winkler_similarity(t1.col2,t2.col2)+
--		UTL_MATCH.jaro_winkler_similarity(t1.col3,t2.col3)+UTL_MATCH.jaro_winkler_similarity(t1.col4,t2.col4)
--		+(0.001*UTL_MATCH.jaro_winkler_similarity(t1.col5,t2.col5)))/3.001 as similarity 
--		from tabcli t1 join tabcli t2 on 1=1
--		where (UTL_MATCH.jaro_winkler_similarity(t1.col2,t2.col2)+
--		UTL_MATCH.jaro_winkler_similarity(t1.col3,t2.col3)+UTL_MATCH.jaro_winkler_similarity(t1.col4,t2.col4)
--		+(0.001*UTL_MATCH.jaro_winkler_similarity(t1.col5,t2.col5)))/3.001 between 80 and 99.99
--		order by similarity';

--EXECUTE IMMEDIATE 'delete from tabcli t
--where exists 
--(
--select distinct t.* from Vtabcli t2 
--where t2.col21=t.col1
--and t2.col22=t.col2
--and t2.col23=t.col3
--and t2.col24=t.col4
--and t2.col25=t.col5
--) and rownum = 1';


--SELECT count(*) INTO a FROM VTABCLI;

--   END LOOP; 
--END;
--/

--EXEC corrigerSimilaire;

----======================================================================================
----======================================================================================
----======================================================================================

--REM VISUALISATION DES DONNEES
--SELECT COUNT(*) AS NbrCli FROM TABCLI;
--SELECT * FROM TABCLI;

--REM ??? Que font les commandes SQL ci-dessous ?
--SELECT COUNT(DISTINCT *) FROM TABCLI ;
----reponse : elle donne le nombre de couple(ville,pays) distincts dans la table tabcli

--SELECT DISTINCT * FROM TABCLI ;
----reponse : elle affiche les couples(ville,pays) distincts dans la table tabcli

---- ????????????      FB FB FB FB FB FB A compléter ??????????????
---- A VOUS ! -- BON COURAGE -- MFB
---- ????????????      FB FB FB FB FB FB A compléter ??????????????

----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
----==================== DES CONTRAINTES DEFINIES PAR L UTILSATEUR =======================

---- Développez une procédure PL/SQL qui permet de vérifier la cohérence de la BD : 
---- Vérifiez si toutes les commandes portent au moins sur un article 
---- Affichez celles qui sont donc vides !

--PROMPT =====================================================================
--PROMPT >> Requete : Procedure PL/SQL => vérification cohérence de la BD
--PROMPT =====================================================================
--PROMPT
--REM Verifier si toutes les commandes portent au moins sur un article et
--REM afficher celles qui sont donc vides!

--TTITLE CENTER 'Verification de la cohérence de la base de données' skip 1 -
--       LEFT   '=========================================================================' skip 0

--SET SERVEROUTPUT ON;

--PROMPT =====================================================================
--PROMPT Suppression et création de la procédure COHERENCE_BD
--PROMPT =====================================================================
--PROMPT
--DROP PROCEDURE COHERENCE_BD;

--CREATE OR REPLACE PROCEDURE COHERENCE_BD IS
--	CURSOR curseur IS
--	SELECT NUMCOM FROM COMMANDES
--	MINUS (SELECT NUMCOM FROM DETAILCOM);

--BEGIN
--	DBMS_OUTPUT.PUT_LINE('Le(s) numéro(s) de commande vide(s) sont :');
--	FOR i IN curseur LOOP
--		DBMS_OUTPUT.PUT_LINE('-  ' || i.NUMCOM);
--	END LOOP;
--END;
--/

--PROMPT
--pause Tapez sur Enter...
--PROMPT

--PROMPT =====================================================================
--PROMPT Execution de la procédure COHERENCE_BD
--PROMPT =====================================================================
--PROMPT
--EXECUTE COHERENCE_BD;

---- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
----
---- Le(s) numéro(s) de commande vide(s) sont :
----  ????

--PROMPT
--pause Tapez sur Enter...
--PROMPT

----====================================================================================
----====================================================================================
----====================================================================================
----==================== Modification de la structure des données ======================
----========================== Diagnostiquer les anomalies =============================
----====================================================================================
----====================================================================================

---- Ajoutez 4 colonnes à la table CLIENTS afin de diagnostiquer les éventuelles anomalies
---- ANOMALIES de type VARCHAR(20), VALIDCOL NUMBER(2), INVALIDCOL NUMBER(2), NULLCOL NUMBER(2)

--CREATE TABLE DIAGNOSTICDATA 
--(ANOMALIES VARCHAR(20), VALIDCOL NUMBER(2), INVALIDCOL NUMBER(2), NULLCOL NUMBER(2));
--INSERT INTO DIAGNOSTICDATA values ('', 0, 0, 0);
--/*
--CREATE OR REPLACE VIEW DIAGNOCLIENTS
--AS SELECT * FROM CLIENTS, DIAGNOSTICDATA;
--SELECT * FROM DIAGNOCLIENTS;
--*/

--DROP TABLE DIAGNOCLIENTS;
--CREATE TABLE DIAGNOCLIENTS
--AS SELECT * FROM CLIENTS, DIAGNOSTICDATA;
--SELECT * FROM DIAGNOCLIENTS;

---- Ajoutez 4 colonnes à la table CLIENTS afin de diagnostiquer les éventuelles anomalies
--ALTER TABLE CLIENTS
--ADD	ANOMALIES VARCHAR(20) 
--ADD VALIDCOL NUMBER(2)
--ADD INVALIDCOL NUMBER(2)
--ADD  NULLCOL NUMBER(2);


---- Développez le mécanisme VERIFYDATACLI qui permet de faire : 
---- Pour chaque ligne de la table
---- Vérifier la validité de chaque colonne
---- ErrorIndicator = ''  -- ErrorIndicator est une chaine vide au départ
---- NbreT = 0    NbrF = 0 NbrN = 0
---- Si la donnée est valide alors ErrorIndicator = ErrorIndicator || 'T' et NbrT = NbrT + 1
---- Si la donnée est INvalide alors ErrorIndicator = ErrorIndicator || 'F' et NbrF = NbrF + 1
---- Si la donnée est vide alors ErrorIndicator = ErrorIndicator || 'N' et NbrN = NbrN + 1
---- Insérer à la fin de chaque ligne la valeur ErrorIndicator dans la colonne ANOMALIES
---- ErrorIndicator permet de diagnostiquer le contenu d une ligne entiere
---- Insérer à la fin de chaque ligne le nombre de valeurs valides (nombre de T)
---- Insérer à la fin de chaque ligne le nombre de valeurs invalides (nombre de F)
---- Insérer à la fin de chaque ligne le nombre de valeurs nulles (nombre de N)
---- La colonne ANOMALIES et les 3 autres colonnes permettent de diagnostiquer le contenu de la table entiere

---- Filtrez (découpez) la table en plusieurs parties :
---- Les données VALIDES, les "WARNING" et les "INVALIDES"
---- Affichez les lignes INVALIDES avec messages d'erreur

---- Proposez des corrections...

---- ????????????      FB FB FB FB FB FB A compléter ??????????????


--DROP TABLE VERIFICATION;
--CREATE TABLE VERIFICATION (COLONNE VARCHAR2(125),CATEGORY VARCHAR2(125));
--SET SERVEROUTPUT ON;

--create or replace procedure VERIFYDATACLI IS

--V_NOMCLI VARCHAR2(120);
--V_PRENCLI VARCHAR2(120);
--V_VilCli VARCHAR2(120);
--V_PAYSCLI VARCHAR(130);
--V_MAILCLI VARCHAR(130);
--V_TELCLI VARCHAR(120);
--ErrorIndicator VARCHAR2(150); 
--NbrT number(2);
--NbrF number(2);
--NbrN number(2);
--V_CODCLI VARCHAR(130);
--V_COLONNE VARCHAR2(150);
--V_CATEGORY VARCHAR2(150);
--result varchar2(50);


--CURSOR curseur IS
--SELECT CODCLI,NOMCLI,PRENCLI,VilCli,PAYSCLI,MAILCLI,TELCLI FROM CLIENTS;

--CURSOR curseur2 IS
--SELECT Colonne,Category FROM Verification;

--BEGIN
--OPEN curseur;

--LOOP
--	FETCH curseur INTO V_CODCLI,V_NOMCLI,V_PRENCLI,V_VilCli,V_PAYSCLI,V_MAILCLI,V_TELCLI ;
--	EXIT WHEN NOT curseur%FOUND;
--	SELECT '' INTO ErrorIndicator FROM dual;
--	SELECT 0 INTO NbrT FROM dual;
--	SELECT 0 INTO NbrF FROM dual;
--	SELECT 0 INTO NbrN FROM dual;
--	
--	EXECUTE IMMEDIATE 'DELETE FROM VERIFICATION';	
--	EXECUTE IMMEDIATE 'INSERT INTO VERIFICATION VALUES('''||V_NOMCLI||''',''ALPHABETIQUE'')';
--	EXECUTE IMMEDIATE 'INSERT INTO VERIFICATION VALUES('''||V_PRENCLI||''',''ALPHABETIQUE'')';
--	EXECUTE IMMEDIATE 'INSERT INTO VERIFICATION VALUES('''||V_VilCli||''',''ALPHABETIQUE'')';
--	EXECUTE IMMEDIATE 'INSERT INTO VERIFICATION VALUES('''||V_PAYSCLI||''',''ALPHABETIQUE'')';
--	EXECUTE IMMEDIATE 'INSERT INTO VERIFICATION VALUES('''||V_MAILCLI||''',''MAIL'')';
--	EXECUTE IMMEDIATE 'INSERT INTO VERIFICATION VALUES('''||V_TELCLI||''',''TELFR'')';
--	
--	OPEN curseur2;

--	LOOP
--	FETCH curseur2 INTO V_COlONNE, V_CATEGORY ;
--	EXIT WHEN NOT curseur2%FOUND;
--	
--	IF V_COLONNE IS NULL THEN
--		SELECT concat(ErrorIndicator,'N') INTO ErrorIndicator FROM dual;
--		SELECT NbrN+1 INTO NbrN FROM dual;
--	ELSE
--		SELECT VerifRegExpr(V_COLONNE,V_CATEGORY) into result from dual;		
--		IF RESULT='FALSE' THEN 
--			SELECT concat(ErrorIndicator,'F') INTO ErrorIndicator FROM dual;
--			SELECT NbrF+1 INTO NbrF FROM dual;
--		ELSE
--			SELECT concat(ErrorIndicator,'T') INTO ErrorIndicator FROM dual;
--			SELECT NbrT+1 INTO NbrT FROM dual;
--		END IF;
--	END IF;
--	

--	
--	END LOOP;

--	CLOSE curseur2;
--	
--	update clients
--	set ANOMALIES=ErrorIndicator ,VALIDCOL=NbrT ,INVALIDCOL=NbrF ,NULLCOL=NbrN
--	where codcli=v_codcli;


--END LOOP;

--CLOSE curseur;
--END;
--/

--exec VERIFYDATACLI;


----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
----======================================================================================
---- MFB FFF +++++++++++++++++++++++++++++++++++++++++++
--COMMIT;	   
--SET TIMING OFF;
--SPOOL OFF;


	
