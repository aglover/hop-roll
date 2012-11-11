PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE hops (_id integer  PRIMARY KEY AUTOINCREMENT DEFAULT NULL, 
  name TEXT, description TEXT, substitutions TEXT DEFAULT '', alpha_acid TEXT DEFAULT '', 
  beer_styles TEXT DEFAULT '', type TEXT DEFAULT '');
INSERT INTO "hops" VALUES(1,'Amarillo','Spicy hop with mild bitterness and a noble aroma.  Good all around hop.','Cascade, Centennial','7 to 10','Ale, IPA','Aroma');
INSERT INTO "hops" VALUES(2,'Athanum','Floral, citrusy, and piney, similar to Cascade.','','5 to 6','Beer styles suited for Ahtanum include American APA, American IPA, Light lagers.','Bittering');
INSERT INTO "hops" VALUES(3,'Brewer''s Gold','Strong and pungent bittering hop developed from Bullion.  Commonly used in English Ales.','Bullion','7 to 9','English ale','Bittering');
INSERT INTO "hops" VALUES(4,'Bullion','Has an aroma similar to black currant, as well as a spicy bitterness. Used in Stouts and other stronger flavored beers.','Columbus, Northern Brewer, German Brewer''s Gold','7 to 12','IPA, ESB, stout','Bittering');
INSERT INTO "hops" VALUES(5,'Cascade','A strong piney, fragrant, floral, spicy, and citrusy (especially grapefruit) aroma.  It is the Classic American Pale Ale Hop.','Centennial, Amarillo, possibly Columbus','5 to 8','Pale ale, IPA, porter, barleywine','Both');
INSERT INTO "hops" VALUES(6,'Centennial','This hop has a clean aroma with floral notes, similar to Cascade, but stronger.','Cascade, possibly Columbus','9 to 12','All ale styles, has been used with wheat beer','Bittering');
INSERT INTO "hops" VALUES(7,'Challenger','Some pine notes with spicy and fruity aromas.  Good multi-purpose hop for aroma, bittering, or finishing. Blends well with other hops.','','6 to 9','English style Ale, Porter, Stout, ESB, Bitter, Barley Wine, Brown Ales','Aroma');
INSERT INTO "hops" VALUES(8,'Chinook','Piney and citrusy with notes of grapefruit and pineapple.  Classic American Pale Ale hop.','Nugget, Columbus, Northern Brewer, U.K. Target','10 to 12','Pale ale, IPA, stout, porter, lager','Bittering');
INSERT INTO "hops" VALUES(9,'Cluster','Lager hop. Very coarse, best if blended with more refined, aromatic varieties.  Smooth with some floral components','Galena','6 to 9','Ale and lager (good aroma for ale, good bittering for lager)','Bittering');
INSERT INTO "hops" VALUES(10,'Columbus','A strong American bittering hop with clean, refined perfume aroma.  Also known as Tomahawk.','Nugget, Chinook, U.K. Target, Northern Brewer','14 to 18','IPA, pale ale, stout','Bittering');
INSERT INTO "hops" VALUES(11,'Crystal','Mild hop with a fruity and floral aroma.  A descendant of the German Hallertau hop.','Mt. Hood, Hersbrucker, French Strisslespalt, Liberty, Hallertauer','3 to 6','Lager, pilsner, ESB','Aroma');
INSERT INTO "hops" VALUES(12,'Eroica','A strong but clean Amercian bittering hop.  Similar to Horizon.','Galena, Nugget, Chinook','9 to 14','Wheat','Bittering');
INSERT INTO "hops" VALUES(13,'First Gold','This hop has a spicy, fruity character with notes of orange peel and apricots.','','6 to 9','Ale, ESB','Both');
INSERT INTO "hops" VALUES(14,'Fuggle','A mild hop with a soft fruity and woody aroma.  Can be grassy or floral as well.  Ideally a finishing hop for ales of all kinds.  Also known as Fuggles.','','4 to 5','nglish ales are a good fit for this hop variety:  Porters, Milds, and Bitters','Both');
INSERT INTO "hops" VALUES(15,'Galena','Primarily a bittering hop with a smooth bitterness.   Originally developed from Brewer''s Gold.  Has a citrus character to it.','Nugget, Pride of Ringwood, Chinook','12 to 14','Ale, porter, stout, ESB, bitter','Bittering');
INSERT INTO "hops" VALUES(16,'Goldings','Soft, earthy, rounded yet spicy aroma with some floral notes.  A traditional British noble hop originally developed in 1790.','','4 to 6','Superb in English-style ales, and lend a unique character to fine lagers as well.','Aroma');
INSERT INTO "hops" VALUES(17,'Hallertauer','Classic German aroma hop, it has a pleasant mild, yet spicy flavor and aroma with some earthy notes.','','3 to 6','German and American Lagers','Aroma');
INSERT INTO "hops" VALUES(18,'Horizon','A soft, clean bitterness.  Originally derived from Nugget.  Similar to Eroica.','Magnum or a high-alpha hop','11 to 14','Ale, lager','Bittering');
INSERT INTO "hops" VALUES(19,'Liberty','American version of Hallertauer with a mild spicy and perfumey aroma','Hallertauer Tradition, Hallertauer, Mt. Hood','3 to 5','Lager, pilsner, bock, wheat','Aroma');
INSERT INTO "hops" VALUES(20,'Magnum','A strong high alpha acid bittering hop with spicey and citrusy aroma.  Cultivated in the Northwest and of German descent.  This hop is a cross between Galena and Hallertau.','Northern Brewer','12 to 17','All beers, particularly lager, pilsner, stout','Bittering');
INSERT INTO "hops" VALUES(21,'Mount Hood','An aromatic hop derived from Hallertau with a clean but somewhat pungent and spicy aroma.','','4 to 8','A good choice for lagers','Both');
INSERT INTO "hops" VALUES(22,'Northdown','This hop has a middle of the road bitterness but retains a good flavor and aroma. It has a traditional English flavor.','','8 to 10','Use for any English ale.','Both');
INSERT INTO "hops" VALUES(23,'Northern Brewer','A strong bittering hop grown worldwide.  A more bitter version of Hallertau but with a fine mellow aroma. Mainly used for bittering in combination with other hops.  When used as a bittering hop it has a clean bittering affect.','','8 to 10','Ideal for steam-style beers and ales','Both');
INSERT INTO "hops" VALUES(24,'Nugget','An very pungent and spicy bittering hop with heavy herbal aromatics.','Columbus, Chinook, U.K. Target, Galena','12 to 16','Light lager','Bittering');
INSERT INTO "hops" VALUES(25,'Perle','A slightly spicy bittering and finishing hop similar to Hallertauer although not as refined. A cross between Hallertau & Northern Brewer varieties.','','6 to 9','Lager, Wheat','Aroma');
INSERT INTO "hops" VALUES(26,'Pride of Ringwood','A clean bittering hop used primarily in Australian beers.  With a subtle hint of citrus.','','7 to 10','a dominating force in the Ales and Lagers in Australia','Bittering');
INSERT INTO "hops" VALUES(27,'Saaz','The hop that defines a Pilsner. It has a mild and pleasant bite with a delicate floral aroma that is almost musty.  Usually leaves a clean bitterness.','','2 to 5','Czech Pilsners, Lagers, and European and Belgian styles of the same','Aroma');
INSERT INTO "hops" VALUES(28,'Simcoe','A strong bittering hop with a woody and piney aroma with some citrus character.  Similar to Cascade but more bitter.','','12 to 14','distinctive and unique Pale Ales and American Ales','Bittering');
INSERT INTO "hops" VALUES(29,'Spalt','Medium strength German noble hop, but bigger than Hallertauer and similar also to Saaz.','','3 to 5','Spalt is sought after for German-style Lagers, Helles, Pilsners and more','Aroma');
INSERT INTO "hops" VALUES(30,'Summit','A citrusy bittering hop with notes of orange, tangerine, and grapefruit.','Simcoe','17 to 19','IPAs, Imperial IPAs','Bittering');
INSERT INTO "hops" VALUES(31,'Target','A strong and spicy bittering hop that is aromatic and has some herbal notes.','','8 to 10','All Ales and lagers','Bittering');
INSERT INTO "hops" VALUES(32,'Tettnanger','A classic German Noble hop, related to Saaz.  A refined sweet and spicy aroma with a rich flowery fragrance.','','6 to 3','ideal for your finest lagers and wheat beers','Aroma');
INSERT INTO "hops" VALUES(33,'Tomahawk','A strong American bittering hop with clean, refined perfume aroma. Also known as Columbus.','Columbus','14 to 18','Ale','Bittering');
INSERT INTO "hops" VALUES(34,'Tradition','Very smooth and refined aroma which is similar to Hallertauer.  Was originaly developed from Hallertauer.','','5 to 7','Pilsners, Other German Lagers, Wheat/Weizens','Bittering');
INSERT INTO "hops" VALUES(35,'Vanguard','American developed version of Hallertau crossed with other hops.  Primarily developed for aroma.','Saaz, Hallertauer Mittelfrüh','5 to 6','German Lager, American','Aroma');
INSERT INTO "hops" VALUES(36,'Warrior','High alpha bittering hop with citrus and herb aroma.','Nugget','15 to 17','Ale, stout','Both');
INSERT INTO "hops" VALUES(37,'Willamete','A US variety of Fuggles that is stronger with a spicy, woody, and fragrant aroma and finish.  Also spelled Williamette.','','6 to 4','American Pale and Brown Ales, English-style Ales','Aroma');
INSERT INTO "hops" VALUES(38,'Zeus','Aromatic and highly bitter hop.  Very similar to Tomahawk and Columbus.','Columbus','14 to 15','IPAs','Bittering');
INSERT INTO "hops" VALUES(39,'Hop Name','Hop Characteristics','Possible Hop Substitutions','Hop Alpha Acid ','Common Beer Styles','');
INSERT INTO "hops" VALUES(40,'Admiral (U.K.)','Known for its bittering potential.','U.K. Target, U.K. Northdown, U.K. Challenger','13.5 to 16','Ale','Bittering');
INSERT INTO "hops" VALUES(41,'Ahtanum','Floral, citrus, sharp, and piney.','','4 to 6.3','','Aroma');
INSERT INTO "hops" VALUES(42,'Bramling Cross (U.K.)','Quite mild, fruity currant aroma.','U.K. Kent Golding, U.K. Progress, Whitbread Golding Variety','5 to 7','ESB, bitter, pale ale','Aroma');
INSERT INTO "hops" VALUES(43,'Brewer''s Gold (German)','Black currant, fruity, spicy.','Northdown, Northern Brewer, Galena, Bullion','6 to 7','Ale, heavier Germanstyle lagers','Bittering');
INSERT INTO "hops" VALUES(44,'Challenger (U.K.)','Mild to moderate, quite spicy.','U.S. or German Perle, Northern Brewer','6.5 to 8.5','Englishstyle ales, porter, stout, ESB, bitter','Both');
INSERT INTO "hops" VALUES(45,'First Gold (U.K.)','A little like Golding family; spicy.','U.K. Kent Golding, maybe Crystal','6.5 to 8.5','Ale, ESB','Both');
INSERT INTO "hops" VALUES(46,'Fuggle (U.S.)','Mild and pleasant, earthy and fruity.','U.K. Fuggle, Willamette, Styrian Golding, U.S. Tettnanger','4 to 5.5','Any Englishstyle beer or American ale','Aroma');
INSERT INTO "hops" VALUES(47,'Fuggle (U.K.)','Mild, pleasant, hoppy, and robust.','U.S. Fuggle, Willamette, Styrian Golding','4 to 5.5','All Englishstyle ales, ESB, bitter, lager','Aroma');
INSERT INTO "hops" VALUES(48,'Golding (U.S.)','Mild, extremely pleasant, and gently hoppy.','U.K. Golding, Whitbread Golding Variety, U.K. Progress, and possibly the Fuggle family','4 to 6','Pale ale, ESB, all Englishstyle beer','Aroma');
INSERT INTO "hops" VALUES(49,'Hallertauer (U.S.)','Very mild, pleasant, and slightly flowery, some spicy.','Liberty, Ultra, Hallertauer Tradition','3.5 to 5.5','Lager, pilsner, bock, wheat','Both');
INSERT INTO "hops" VALUES(50,'Hallertauer Gold','Known for its aromatic properties similar to Hallertauer.','Crystal, Mt. Hood','6 to 6.5','','Both');
INSERT INTO "hops" VALUES(51,'Hallertauer Mittelfrüh','Mild and pleasant.','Liberty, German Tradition, Ultra','3 to 5.5','Lager, bock, wheat, maybe pilsner','Both');
INSERT INTO "hops" VALUES(52,'Hallertauer Tradition (Ger.)','Known for its aromatic properties. A replacement for Hallertauer Mittelfrüh.','Crystal, Liberty','3.5 to 5.5','Mildflavored beers','Both');
INSERT INTO "hops" VALUES(53,'Hallertau Hersbrucker (German)','Mild to semi-strong, pleasant, hoppy.','Mt. Hood, French Strisslespalt','3 to 5.5','Lager, pilsner, bock, wheat','Both');
INSERT INTO "hops" VALUES(54,'Kent Golding (U.K.)','Gentle, fragrant, and pleasant.','U.S. Golding, Whitbread Golding Variety, U.K. Progress','4 to 5.5','All Englishstyle ales, ESB, bitter','Aroma');
INSERT INTO "hops" VALUES(55,'Mt. Hood','Mild, pleasant, and clean, somewhat pungent and resiny.','Crystal, French Strisslespalt, Hersbrucker','3 to 8','Lager, pilsner, bock, wheat','Aroma');
INSERT INTO "hops" VALUES(56,'Northdown (U.K.)','Fruity with some spiciness.','','7.5 to 9.5','All ales, porter','Both');
INSERT INTO "hops" VALUES(57,'Northern Brewer (U.S.)','Medium-strong with some wild tones.','Nugget, Chinook','6 to 10','ESB, bitter, English pale ale, porter, California (steam) beer','Both');
INSERT INTO "hops" VALUES(58,'Northern Brewer (German)','Medium-strong with some wild tones.','Chinook, U.S. Northern Brewer','7 to 10','ESB, bitter, English pale ale, porter','Both');
INSERT INTO "hops" VALUES(59,'Northwest Golding','Known for aromatic properties.','','4 to 5','Ale, porter, stout, ESB, bitter','Both');
INSERT INTO "hops" VALUES(60,'Olympic','Mild to medium, citrusy aroma, spicy.','Chinook','11 to 13','IPAs and Pale Ales','Bittering');
INSERT INTO "hops" VALUES(61,'Perle (U.S.)','Known for its aromatic and bittering properties, pleasant and slightly spicy.','Northern Brewer, Cluster, Galena, Chinook','6 to 9.5','Pale ale, porter, German styles','Aroma');
INSERT INTO "hops" VALUES(62,'Perle (German)','Moderately intense, good and hoppy, fruity and a little spicy.','U.S. Perle, Northern Brewer','6 to 8.5','Pale ale, porter, lager','Aroma');
INSERT INTO "hops" VALUES(63,'Phoenix (U.K.)','Similar to U.K. Challenger.','U.K. Northdown, U.K. Kent Golding, U.K. Challenger','4.2 to 5.5','All ales','Bittering');
INSERT INTO "hops" VALUES(64,'Pioneer (U.K.)','A mild, typical English aroma.','U.K. Kent Golding','8 to 10','Ale, ESB','Both');
INSERT INTO "hops" VALUES(65,'Polish Lublin','Mild and typical of noble aroma types, spicy, herbal.','U.S. Saaz, Czech Saaz, U.S. Tettnanger','3 to 4.5','Pilsner','Bittering');
INSERT INTO "hops" VALUES(66,'Pride of Ringwood (Australia)','Quite pronounced, woody, earthy, herbal.','Galena, Cluster','7 to 10','Australian lager','Bittering');
INSERT INTO "hops" VALUES(67,'Progress (U.K.)','Moderately strong, good aroma.','U.K. Kent Golding, Fuggle','5 to 7.5','Ale, bitter, ESB, porter','Aroma');
INSERT INTO "hops" VALUES(68,'Saaz (Czech)','Very mild with pleasant hoppy notes, earthy, spicy, and herbal.','U.S. Saaz, Polish Lublin','3 to 4.5','Pilsner','Aroma');
INSERT INTO "hops" VALUES(69,'Saaz (U.S.)','Mild and pleasant, earthy and spicy.','Czech Saaz, Polish Lublin','3 to 5','Pilsner, lager, wheat','Aroma');
INSERT INTO "hops" VALUES(70,'Santiam','Noble characteristics.','German Tettnanger, German Spalt, German Spalt Select','5 to 7.9','Lager, American ale, pilsner','Aroma');
INSERT INTO "hops" VALUES(71,'Satus','Known for its bittering and aromatic properties.','Galena','12.5 to 14','IPAs, Pale Ales, ESB, Stout','Bittering');
INSERT INTO "hops" VALUES(72,'Spalt (German)','Mild and pleasant, slightly spicy.','U.S. Saaz, U.S. Tettnanger, German Spalt Select','4 to 5.5','Lager','Aroma');
INSERT INTO "hops" VALUES(73,'Spalt Select (German)','Very fine Spalter-type aroma.','U.S. Saaz, U.S. Tettnanger, German Spalt','4 to 6','Lager, and any beer where noble aroma is wanted','Aroma');
INSERT INTO "hops" VALUES(74,'Spalt Select (U.S.)','Medium intensity and pleasant hoppy qualities. Medium-strong aroma with wild American tones.','Tettnanger, Saaz','3 to 5','German lagers','Aroma');
INSERT INTO "hops" VALUES(75,'Sterling','Herbal, spicy, pleasant aroma, hint of floral and citrus.','Saaz, Polish Lublin','6 to 9','Lager, ale, pilsner','Both');
INSERT INTO "hops" VALUES(76,'Strisslespalt (France)','Medium intensity, pleasant, hoppy.','Mt. Hood, Crystal, Hersbrucker','3 to 5','Pilsner, lager, wheat','Aroma');
INSERT INTO "hops" VALUES(77,'Styrian Golding (Slovenia)','Delicate, slightly spicy.','U.S. Fuggle, U.K. Fuggle, Willamette','4.5 to 6','All Englishstyle ales, ESB, bitter, lager','Aroma');
INSERT INTO "hops" VALUES(78,'Target (U.K.)','Pleasant English hop aroma, quite intense.','Fuggle, Willamette','9.5 to 12.5','All ale and lager','Aroma');
INSERT INTO "hops" VALUES(79,'Tettnanger (U.S.)','An aromatic hop, mild and slightly spicy.','German Spalt, Czech Saaz Santiam','3.4 to 5.2','German ales and lagers, American lagers, wheat','Aroma');
INSERT INTO "hops" VALUES(80,'Tettnanger (German)','Mild and pleasant, slightly spicy, herbal.','German Spalt, German Spalt Select, U.S. Tettnanger, Saaz','3.5 to 5.5','Lager, ale','Aroma');
INSERT INTO "hops" VALUES(81,'Tradition (German)','Very fine and similar to Hallertauer Mittelfrüh.','Hersbrucker, Hallertauer Mittelfrüh','5 to 7','Lager, pilsner','Aroma');
INSERT INTO "hops" VALUES(82,'Ultra','Very good to outstanding, some Saaz-like qualities. Aromatic properties similar to Hallertauer.','Liberty, Hallertauer Tradition, Saaz','2 to 4.1','Lager, pilsner, wheat, finish hop in ales','Aroma');
INSERT INTO "hops" VALUES(83,'WGV (Whitbread Golding Variety) (U.K.)','Quite pleasant and hoppy, moderately intense.','U.K. Kent Golding, U.K. Progress','5 to 7','Ale','Aroma');
INSERT INTO "hops" VALUES(84,'Willamette','Mild and pleasant, slightly spicy, fruity, floral, a little earthy.','U.S. Fuggle, U.S. Tettnanger, Styrian Golding','3.5 to 6','Pale ale, ESB, bitter, Englishstyle ale, porter, stout','Aroma');
INSERT INTO "hops" VALUES(85,'Yakima Cluster','Used as a kettle hop for bittering.','','6 to 8.5','IPAs, Pale Ales','Bittering');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('hops',85);
COMMIT;
