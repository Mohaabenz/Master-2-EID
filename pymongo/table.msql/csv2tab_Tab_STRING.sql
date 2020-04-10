CREATE TABLE `Tab_STRING` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `SEMANTIQUE` LONGTEXT,
    `SUBSEMANTIQUE` LONGTEXT,
    `REGULAREXPR` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;



-- { _id: 5e710caef87edb1f570c1fa5 }
INSERT INTO `Tab_STRING` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (0, x'5E710CAEF87EDB1F570C1FA5', 'SEXE', 'SEXE_FR', '^f$|FEMME|FEMELLE|F$|HOMME|MALE|^M$|^H$|^m$');


-- { _id: 5e710caef87edb1f570c1fa6 }
INSERT INTO `Tab_STRING` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (1, x'5E710CAEF87EDB1F570C1FA6', 'SEXE', 'SEXE_EN', '^F$|WOMAN|WIFE|FEMALE+$|MALE|^M$|^MAN$');


-- { _id: 5e710caef87edb1f570c1fa7 }
INSERT INTO `Tab_STRING` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (2, x'5E710CAEF87EDB1F570C1FA7', 'CIVILITY', 'CIVILITY_FR', '^(M.|MME|MLLE|MONSIEUR|MADAME|MADEMOISELLE)$');


-- { _id: 5e710caef87edb1f570c1fa8 }
INSERT INTO `Tab_STRING` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (3, x'5E710CAEF87EDB1F570C1FA8', 'CIVILITY', 'CIVILITY_EN', '^(M.|MRS|MS|MISTER|MISS)$');


-- { _id: 5e710caef87edb1f570c1fa9 }
INSERT INTO `Tab_STRING` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (4, x'5E710CAEF87EDB1F570C1FA9', 'EMAIL', 'EMAIL', '^[A-Za-z]+.?[A-Za-z0-9]*@[a-zA-Z]+.(FR|fr|COM|com|[a-zA-Z]+)$');


-- { _id: 5e710caef87edb1f570c1faa }
INSERT INTO `Tab_STRING` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (5, x'5E710CAEF87EDB1F570C1FAA', 'BLOODGROUP', 'BLOODGROUP', '^((A|B|AB|O){1}[+-]{1})$');
