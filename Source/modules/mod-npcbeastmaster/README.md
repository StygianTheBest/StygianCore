# BeastMaster NPC #


### Description ###
------------------------------------------------------------------------------------------------------------------
WhiteFang is a Beastmaster NPC that howls! This NPC allows any player, or only Hunters, to adopt and use beasts. 
He also teaches the player specific Hunter skills for use with their beasts. A player can adopt normal or exotic 
beasts depending on how you've configured the NPC. For each type of beast I use a rare spawn model of a creature 
of the same type, so they all look cool. He also sells a great selection of grub for every level of beast. Hunters 
can access the stables as well. This has been a lot of fun for players on my server, StygianCore, and beasts work 
great and just like they do on a Hunter in or out of dungeons.


### Features ###
------------------------------------------------------------------------------------------------------------------
- Adds a Worgen BeastMaster NPC with sounds/emotes
- Allows adopting of beasts by level, class, and ability
- Teaches player all required Hunter abilities
- Sells beast food For all levels
- The scale of the beast is configurable


### To-Do ###
------------------------------------------------------------------------------------------------------------------
- If possible, create working stable for non-Hunter player
- Fix beast spells disappearing from beast bar on relog/dismiss (Note: they persist if added back)


### Data ###
------------------------------------------------------------------------------------------------------------------
- Type: NPC
- Script: BeastMaster
- Config: Yes
    - Module Announce
    - CorePatch check
    - Level Requirement
    - Enabled for Hunter class only
    - Require Beast Mastery talent
    - Allow Exotic Beasts for all classes (Teaches Beast Mastery)
    - Set Beast Scale Factor
- SQL: Yes
    - NPC ID: 601026


### Version ###
------------------------------------------------------------------------------------------------------------------
- v2017.09.03 - Release


### Credits ###
------------------------------------------------------------------------------------------------------------------
#### An original module for AzerothCore by StygianTheBest ([stygianthebest.github.io](http://stygianthebest.github.io)) ####

###### Additional Credits include:
- [Blizzard Entertainment](http://blizzard.com)
- [TrinityCore](https://github.com/TrinityCore/TrinityCore/blob/3.3.5/THANKS)
- [SunwellCore](http://www.azerothcore.org/pages/sunwell.pl/)
- [AzerothCore](https://github.com/AzerothCore/azerothcore-wotlk/graphs/contributors)
- [AzerothCore Discord](https://discord.gg/gkt4y2x)
- [EMUDevs](https://youtube.com/user/EmuDevs)
- [AC-Web](http://ac-web.org/)
- [ModCraft.io](http://modcraft.io/)
- [OwnedCore](http://ownedcore.com/)
- [OregonCore](https://wiki.oregon-core.net/)
- [Wowhead.com](http://wowhead.com)
- [AoWoW](https://wotlk.evowow.com/)


### License ###
------------------------------------------------------------------------------------------------------------------
- This code and content is released under the [GNU AGPL v3](https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3).