# Gambler NPC

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description

Hey, the name's Skinny. You feelin' lucky? This NPC will allow players to gamble copper, silver, or gold as
defined in the configuration. It's a nice way for players to make a little extra coin.

- Config:
    - Set bet and jackpot amounts
    - Enable/Disable coin type (gold, silver, copper)
    - Set coin type to gamble
- A roll of 50 or higher wins double the bet!
- A roll of less than 50 loses double the bet!
- A roll of 100 within the first 10 rolls hits the jackpot!
- The jackpot can only be hit in the first 10 rolls of each session to discourage spam.
- A little help is given to players losing 5 rolls in a row.

### To-Do

- Track and display jackpot winners/dates.
- Create lottery from player losses.

### Data

- Type: NPC
- Script: gamble_npc
- Config: Yes
- SQL: Yes
    - NPC ID: 601020

### Version

- v2019.02.13 - Redesign, Add Coin Type Options, Update AI
- v2018.12.09 - Update config
- v2017.08.10 - Release


### CREDITS

![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

##### This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))

#### Additional Credits

- [Blizzard Entertainment](http://blizzard.com)
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
