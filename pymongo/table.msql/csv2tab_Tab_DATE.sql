CREATE TABLE `Tab_DATE` (
    `ID` INTEGER NOT NULL,
    `_id` VARBINARY(12),
    `SEMANTIQUE` LONGTEXT,
    `SUBSEMANTIQUE` LONGTEXT,
    `REGULAREXPR` LONGTEXT,
    PRIMARY KEY (`ID`)
) CHARSET=utf8mb4;



-- { _id: 5e790b4be8d04f37dcb9b93b }
INSERT INTO `Tab_DATE` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (0, x'5E790B4BE8D04F37DCB9B93B', 'DATE', 'DATE_NUM_FRENCH', '^([0-2][0-9]|3[0-1])(-|/)(0[0-9]|1[0-2])(-|/)[0-9]{4}$');


-- { _id: 5e790b4be8d04f37dcb9b93c }
INSERT INTO `Tab_DATE` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (1, x'5E790B4BE8D04F37DCB9B93C', 'DATE', 'DATE_NUM_ENGLISH', '^(0[0-9]|1[0-2])(-|/)([0-2][0-9]|3[0-1])(-|/)[0-9]{4}$');


-- { _id: 5e790b4be8d04f37dcb9b93d }
INSERT INTO `Tab_DATE` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (2, x'5E790B4BE8D04F37DCB9B93D', 'DATE', 'DATE_ALPHA_FRENCH', '^([a-zA-ZàâçéèêëîïÉôûùüÿñæœ_°@+ -. ]+)?([0-2][0-9]|3[0-1])(-|s)([a-zA-ZàâçéèÉêëÛîïôûùüÿñæœ_°@+ -. ]+)(-|s)[0-9]{4}$');


-- { _id: 5e790b4be8d04f37dcb9b93e }
INSERT INTO `Tab_DATE` (`ID`, `_id`, `SEMANTIQUE`, `SUBSEMANTIQUE`, `REGULAREXPR`)
    VALUES
        (3, x'5E790B4BE8D04F37DCB9B93E', 'DATE', 'DATE_ALPHA_ENGLISH', '^([a-zA-Zàâçéèêëîïôûùüÿñæœ_°@+ -. ]+)?([0-2][0-9]|3[0-1])(-|s)(JANUARY|FEBRUARY|MARCH|APRIL|MAY|JUNE|JULY|AUGUST|SEPTEMBER|OCTOBER|NOVEMBER|DECEMBER)(-|s)[0-9]{4}$');

