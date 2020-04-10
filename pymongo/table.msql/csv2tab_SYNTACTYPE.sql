CREATE TABLE `SYNTACTYPE` (
    `ID` INTEGER NOT NULL,
    `_id_fk` INTEGER,
    `CATEGORY` LONGTEXT,
    `SUBCATEGORY` LONGTEXT,
    `REGULAREXPR` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


CREATE TABLE `SYNTACTYPE__id` (
    `ID` INTEGER NOT NULL,
    `CATEGORY` LONGTEXT,
    `SUBCATEGORY` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;


ALTER TABLE `SYNTACTYPE`
ADD CONSTRAINT s3t_SYNTACTYPE_SYNTACTYPE__id_0 FOREIGN KEY (`_id_fk`) REFERENCES `SYNTACTYPE__id`(`ID`);



-- { _id: [DATE, DATE] }
INSERT INTO `SYNTACTYPE__id` (`ID`, `CATEGORY`, `SUBCATEGORY`)
    VALUES
        (0, 'DATE', 'DATE');

INSERT INTO `SYNTACTYPE` (`ID`, `_id_fk`, `CATEGORY`, `SUBCATEGORY`, `REGULAREXPR`)
    VALUES
        (0, 0, 'DATE', 'DATE', '^([a-zA-ZàâçéÉèêëîïôûùüÿñæœ_°@+ -. ]+)?((([0-2][0-9]|3[0-1])(-|/)((0[0-9]|1[0-2])|[a-zA-ZÉàâçéèÛêëîïôûùüÿñæœ_°@+ -.]+)(-|/)[0-9]{4})|([0-9]{4}(-|/)(0[0-9]|1[0-2])(-|/)([0-2][0-9]|3[0-1])))$');


-- { _id: [NUMBER, NUMBER] }
INSERT INTO `SYNTACTYPE__id` (`ID`, `CATEGORY`, `SUBCATEGORY`)
    VALUES
        (1, 'NUMBER', 'NUMBER');

INSERT INTO `SYNTACTYPE` (`ID`, `_id_fk`, `CATEGORY`, `SUBCATEGORY`, `REGULAREXPR`)
    VALUES
        (1, 1, 'NUMBER', 'NUMBER', '^([+ -]?( )*[0-9 ]+(((.)|(,)|( ))[0-9 ]+)?)+$');


-- { _id: [STRING, ALPHABETIQUE] }
INSERT INTO `SYNTACTYPE__id` (`ID`, `CATEGORY`, `SUBCATEGORY`)
    VALUES
        (2, 'STRING', 'ALPHABETIQUE');

INSERT INTO `SYNTACTYPE` (`ID`, `_id_fk`, `CATEGORY`, `SUBCATEGORY`, `REGULAREXPR`)
    VALUES
        (2, 2, 'STRING', 'ALPHABETIQUE', '^[a-zA-ZàâçéèêëîïôÉûùüÿñæœ_°@+ -.]+$');


-- { _id: [STRING, ALPHANUMERIQUE] }
INSERT INTO `SYNTACTYPE__id` (`ID`, `CATEGORY`, `SUBCATEGORY`)
    VALUES
        (3, 'STRING', 'ALPHANUMERIQUE');

INSERT INTO `SYNTACTYPE` (`ID`, `_id_fk`, `CATEGORY`, `SUBCATEGORY`, `REGULAREXPR`)
    VALUES
        (3, 3, 'STRING', 'ALPHANUMERIQUE', '(([a-zA-Zàâçéèêëîïôûùüÿñæœ_°@+. -]+[0-9]+(.|,|( )|(-)*)?[0-9]*([a-zA-ZàâçéèêëîïôÉûùüÿñæœ_°@+. -]+)*)|([0-9]+((.|,)[0-9]+)?((-)*( )*(°)*)*[a-zA-ZàâçéèêëîÉïôûùüÿñæœ_°@+. -]+((°)|[0-9])*(.|,|( )*|(-)*)?[0-9]*))+$');

