-- BibleForge
-- 
-- @date    05-21-12
-- @version 1.0
-- @link    http://BibleForge.com
-- @license MIT License (MIT)
-- @author  BibleForge <info@bibleforge.com>

-- This creates the pseudo SphinxSE tables in the database.
--TODO: This should probably be created dynamically in the Forge because the connection string.
--NOTE: The connection parameters can be changed during the query via the "WHERE query='...;host=DYNAMIC_HOST;port=DYNAMIC_PORT'" section of the query.

--
-- Create verse_text_en
--

-- First, drop it if it exists.
DROP TABLE IF EXISTS `verse_text_en`;

-- Create table structure
CREATE TABLE `verse_text_en` (
    `id` int(10) unsigned NOT NULL,
    `weight` int(11) NOT NULL,
    `query` varchar(3072) NOT NULL,
    KEY `query` (`query`)
) ENGINE=SPHINX DEFAULT CHARSET=latin1 CONNECTION='sphinx://127.0.0.1:9312/verse_text_en';


--
-- Create verse_text_en_em
--

-- First, drop it if it exists.
DROP TABLE IF EXISTS `verse_text_en_em`;

-- Create table structure
CREATE TABLE `verse_text_en_em` (
    `id` int(10) unsigned NOT NULL,
    `weight` int(11) NOT NULL,
    `query` varchar(3072) NOT NULL,
    KEY `query` (`query`)
) ENGINE=SPHINX DEFAULT CHARSET=latin1 CONNECTION='sphinx://127.0.0.1:9312/verse_text_en_em';



-- First, drop it if it exists.
DROP TABLE IF EXISTS `morphological_en`;

CREATE TABLE `morphological_en` (
    `id` int(10) unsigned NOT NULL,
    `weight` int(11) NOT NULL,
    `query` varchar(3072) NOT NULL,
    `verseID` int(11) NOT NULL,
    KEY `query` (`query`)
) ENGINE=SPHINX DEFAULT CHARSET=latin1 CONNECTION='sphinx://127.0.0.1:9312/morphological_en';
