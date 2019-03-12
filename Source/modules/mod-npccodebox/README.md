# Codebox NPC

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description

- Creates a CodeBox NPC with emotes
- GM can view a menu of codes in the database in-game
- GM can create, read, update, and delete codes in-game
- Characters input codes to change name, race, or faction
- Gives items and/or gold to players if they enter the correct code
- Reads/Writes code data from the database
- Supports alpha-numeric codes
- Allows unique codes to be given out only once
- Checks for already redeemed codes
- Codes have charges that can prevent the code from being used more than X times
- Supports multiple items per code
- I check the db for # of codes the player has obtained so..
  - Charges for each item in a multi-code must be equal to: (charges X # of items)
  - ex) A 3 item code with 1 charge must have 9 charges for each item

### Sample Codes

- These codes will add the following items to the player's inventory:
  - **artifact**: A one-charge code from a questgiver or GM.
  - **ballroom**: A multi-charge code giving three items for a tuxedo outfit.
  - **threebags**: A limited multi-charge code giving 3 Netherweave bags to the player.
  - **lockpick**: A limited multi-charge code giving 5 skeleton keys to the player.

- These codes will initiate a character customization:
  - **race**: A customization code that queues the player to change their race.
  - **name**: A customization code that queues the player to change their name.
  - **faction**: A customization code that queues the player to change their faction.

### To-Do

- If possible, create a way to prevent players from trading codes
- Refactor the charges code

### Version

- v2019.03.11 - Add GM Code CRUD & Character Customization by WiiZZy
- v2019.02.09 - Update AI, Config
- v2017.08.10 - Release

### CREDITS

![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

##### This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))

#### Additional Credits

- [WiiZZy](https://github.com/wizzymore)
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