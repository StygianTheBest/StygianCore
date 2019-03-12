# BeastMaster NPC

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). An AzerothCore 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description

WhiteFang is a Beastmaster NPC that howls! This NPC allows any player, or only Hunters, to adopt and use beasts.
He also teaches the player specific Hunter skills for use with their beasts. A player can adopt normal or exotic
beasts depending on how you've configured the NPC. For each type of beast I use a rare spawn model of a creature
of the same type, so they all look cool. He also sells a great selection of grub for every level of beast. Hunters
can access the stables as well. This has been a lot of fun for players of my repack, StygianCore, and beasts work
great and just like they do on a Hunter in or out of dungeons. This is a one-click buffing NPC that will buff the player with a specific set of spells. The NPC can also
buff everyone the same or by player level. He can also attract the player using configurable emote options.

### Features

- Adds a Worgen BeastMaster NPC with sounds/emotes
- Allows adopting of beasts by level, class, and ability
- Teaches player all required Hunter abilities
- Sells beast food For all levels
- Attracts the player using configurable emotes
- Config:
    - Module Announce
    - Emote Options
    - CorePatch check
    - Level Requirement
    - Enable for Hunter class only
    - Require Beast Mastery talent
    - Allow Exotic Beasts for all classes (Teaches Beast Mastery)
    - Set Beast Scale Factor

### To-Do

- Fix beast spells disappearing from beast bar on relog/dismiss (Note: they persist if added back)
- If possible, create working stable for non-Hunter player
- If possible, show the player's pet on the login screen for non-Hunter classes

### Data

- Type: NPC
- Script: BeastMaster
- Config: Yes
- SQL: Yes
    - NPC ID: 601026

### Version

- v2019.02.13 - Added Phrases/Emotes, Add Config Options, Updated AI
- v2019.01.23 - Bugfixes, Pets Added to Config, Merged AC repo
- v2019.01.08 - Added "Better Pet Handling" & "PetAlwaysHappy" config options
- v2017.09.30 - Add pet->InitLevelupSpellsForLevel(); recommended by Alistar
- v2017.09.13 - Teaches additional hunter spells (Eagle Eye, Eyes of the Beast, Beast Lore)
- v2017.09.11
    - Added Exotic Pet: Spirit Bear
    - Added Pet: Warp Stalker
    - Added Pet: Wind Serpent
    - Added Pet: Nether Ray
    - Added Pet: Spore Bat
    - Updated pet models to rare spawn models
- v2017.09.08 - Created new Pet Food item list for all pet levels
- v2017.09.04 - Fixed Spirit Beast persistence (teaches Beast Mastery to player)
- v2017.09.03 - Release

### CREDITS

![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

##### This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). An AzerothCore 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))

#### Additional Credits

- [Blizzard Entertainment](http://blizzard.com)
- [StoaBrogga](https://github.com/Stoabrogga)
- [TrinityCore](https://github.com/TrinityCore/TrinityCore/blob/3.3.5/THANKS)
- [SunwellCore](http://www.azerothcore.org/pages/sunwell.pl/)
- [AzerothCore](https://github.com/AzerothCore/azerothcore-wotlk/graphs/contributors)
- [OregonCore](https://wiki.oregon-core.net/)
- [Wowhead.com](http://wowhead.com)
- [OwnedCore](http://ownedcore.com/)
- [ModCraft.io](http://modcraft.io/)
- [MMO Society](https://www.mmo-society.com/)
- [AoWoW](https://wotlk.evowow.com/)
- [More credits are cited in the sources](https://github.com/StygianTheBest)

### LICENSE

This code and content is released under the [GNU AGPL v3](https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3).
