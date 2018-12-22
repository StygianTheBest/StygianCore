/*
-- ################################################################################### --
--  ____    __                                         ____                           
-- /\  _`\ /\ \__                  __                 /\  _`\                         
-- \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\ \ \/\_\    ___   _ __    __   
--  \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \/_/_  / __`\/\`'__\/'__`\ 
--    /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \L\ \/\ \L\ \ \ \//\  __/ 
--    \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \____/\ \____/\ \_\\ \____\
--     \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/\/___/  \/___/  \/_/ \/____/
--                      /\___/ /\____/                                                
--                      \/__/  \_/__/          http://stygianthebest.github.io
-- 
-- ################################################################################### --
--
-- ITEM: Azerothian Humor Vol. 1
--
-- Creates a book full of WoW jokes.
-- PG-13 - Parent's Beware!
--
-- ################################################################################### --
*/

-- --------------------------------------------------------------------------------------
--	BOOK - 701003
-- --------------------------------------------------------------------------------------
DELETE FROM `item_template` WHERE `entry`=701003;
INSERT INTO `item_template` VALUES (701003, 15, 0, -1, 'Azerothian Humor Vol. 1', 12547, 1, 0, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 'A strong odor of cheese emanates from the book.', 3623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);

-- --------------------------------------------------------------------------------------
--	PAGE 1
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3623;
INSERT INTO `page_text` VALUES (3623, 'Q: How many GM\'s does it take to screw in a lightbulb? $B$BA: None, It\'s working as intended. $B$B$B$BAnd Christ said to his disciples, "I shall grant you eternal Salvation!" The disciples fell to their knees and replied, "Give us Kings n00b.." $B$B$BYour momma is so fat that it takes five warlocks just to summon her!$B', 3624, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 2
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3624;
INSERT INTO `page_text` VALUES (3624, 'Q: What happens when the Unstoppable Force hits the Immovable Object?$B$BA: I think that\'s how it went. The answers vary. $B$B$B$BQ: Why did the Murloc cross the street?$B$BA: Because another Murloc was attacked on the other side of the city. $B$B$BYour momma\'s so fat that mages have to grease their portals and conjure cinnamon rolls on the other side to get her through.."$B$B$BQ: What do a Noob and a Rogue have in common? $B$BA: They both pick Locks. $B$B', 3625, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 3
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3625;
INSERT INTO `page_text` VALUES (3625, 'Your momma\'s so ugly, I had to use [Track Beasts] just to find her!$B$B$BThis Jesus guy is getting some terrible lag, it took him 3 days to respawn.$B$B$BA gnome walks into a bar. The bartender has a jar of cash and is hosting a contest to see who can make the tauren laugh, the gnome enters it and in moments the tauren falls to the ground laughing. The gnome collects his money and leaves, a few months later he comes back and there is another jar of cash waiting to collected. The contest this time was to make the same tauren cry. The gnome asks the bartender if he can have a moment with the tauren and the bartender allows him. Once again within a few moments the tauren is crying. When the gnome came to collect the money, the bartender asked how he did it. He replied, "First I told him my schlong was bigger, then I showed him it was true." ', 3626, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 4
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3626;
INSERT INTO `page_text` VALUES (3626, 'The doctor called me and said I only have six months left to live. I said, "That\'s terrible! Isn\'t there anything I can do?"$B$BHe said, "Well, you can get a WoW account and farm rep in Silithus."$B$BI said, "Will that help?"$B$BHe said, "No, but it\'ll be the longest 6 months you\'ve ever lived." $B$B$B$BThree wives are sitting on rocking chairs on the porch, when the first wife says, "My husband is a rogue. He likes to do it from behind."$B$BThe second wife giggles and says, "My husband is a warrior... and he has stamina to last ALL night long!"$B$BBoth wives stop rocking, and look at wife #3. She starts turning an embarassed shade of red, and finally mutters...$B$B"My husband is a mage... and I HATE Polymorph!"', 3627, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 5
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3627;
INSERT INTO `page_text` VALUES (3627, '$BYou know your a warcraft addict that when your microwave dings you yell "GZ!!!" $B$B$BA Human Paladin, a Dwarven Warrior and a Night Elf Priest walk into the Goldshire tavern, shortly after all are seated by the bar maid. The Human and the Dwarf both order a tall frosty mug of ale, the priestess a glass of wine and begin to talk about their next dungeon to explore.$B$BThe bar maid brings out their drinks and to the surprise of the party, each drink has a dead fly floating upright in it. The Priestess looks at the glass in disgust, throws it over her shoulder, and storms out of the tavern.$B$BThe Human casually shrugs, flicks the fly out of his mug, and begins to drink. The dwarf\'s eyes light up in a furious rage, and he violently plucks the fly from his mug and starts squeezing the lifeless bug over the mug while screaming "SPIT IT OUT! SPIT IT BACK OUT!" $B$B$B$B', 3628, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 6
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3628;
INSERT INTO `page_text` VALUES (3628, 'Q: What do you call a bunch of paladins in a lake?$B$BA: A bubble bath. $B$B$B$B Q: What do you call five druids in a bath?$B$BA: A HoT tub!$B$B$B Q: What\'s the difference between Paladins and Chickens?$B$B$BA:Nothing, they both go BoK BoK BoK.$B$BQ: How many rogues does it take to kill a paladin?$B$BA: Two! One to start the fight, and the other to wait in the Ironforge Inn."$B$B', 3629, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 7
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3629;
INSERT INTO `page_text` VALUES (3629, 'Q: Why did the Felguard cross the road?$B$B$BA: He was given a poultry task. "$B$B$B$BYour mother is so fat, every time she gets Blessing of Kings, Northrend sinks one foot deeper into the sea. $B$B$BQ: When dining in a restaurant, how can you tell which other diners play hunters?$B$B$BA: They\'re the ones who need lifeguards to keep them from drowning in their soup. $B$BYo momma so fat she\'s exalted with mcdonalds!$B$BSTD\'s are BoP!', 3630, 1);

-- --------------------------------------------------------------------------------------
--	PAGE 8
-- --------------------------------------------------------------------------------------
DELETE FROM `page_text` WHERE `ID`=3630;
INSERT INTO `page_text` VALUES (3630, 'A guy enters a bar and says to a good looking girl - Are your pants purple? Because your ass is epic!$B$B$BA priest, a paladin and a rogue are on a quest to save some children from an island. They\'re on a small rowing boat and on their way back to the mainland. Suddenly they notice that the boat is slowly sinking and decide that they need to get some weight off the boat. The paladin says, $B"We must protect the young and sacrifice ourselves!"$BTo which the rogue replies, "Naah, screw all the kids."$BAnd the priest asks quietly, "Do you think we have enough time?$B$BQ: What do you call a Tauren with no legs?$B$B$BA: Ground beef!"$B$B', 0, 1);
