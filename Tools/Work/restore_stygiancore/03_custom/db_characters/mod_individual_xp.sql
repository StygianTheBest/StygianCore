/*
-- ###################################################################################### --
--
-- CORE MOD: INDIVIDUAL XP
--
-- ###################################################################################### --
*/

USE stygian_characters;

-- Dumping structure for table acore_characters.individualxp
CREATE TABLE IF NOT EXISTS `individualxp` (
  `CharacterGUID` int(11) NOT NULL,
  `XPRate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CharacterGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;