### <p align="center">![StygianCore](https://stygianthebest.github.io/assets/img/logo/world_of_stygiancore.png "StygianCore")</p>

#### <p align="center"> A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)</p>

# GM Quick Start Guide

##### A repack for AzerothCore by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)

## CONTENTS

- Accounts
- GM Commands
- Modules
- Restoration and Backup
- Credits

## ACCOUNTS

You can create or edit accounts via the worldserver console or the Account Registration Portal. The portal is useful if you're hosting the game and want users to register on their own. Here are a few commands to get you started:

- **Create Account**
  - account create (name) (password)**
- **Make Account A GM**
  - account set gmlevel (name) 3 -1**
- **Change Password**
  - account set password (account) (password) (password)

### HOW TO IMPORT/EXPORT PLAYER ACCOUNTS

There are two ways to import and export character data.
1) You can export the tables from the auth and character databases.

   - Brute force capture all data by exporting databases.
   - Character only export requires a SQL script targeting all needed tables.

2) You can use the .pdump command from the Worldserver console. The .pdump command captures every detail of a character export as a SQL. This SQL file is not recommended for direct import as-is, but can be used as a base.

   - .pdump write <$filename> <$playerNameOrGUID>
   - .pdump load <$filename> <$account> <$newname> <$newguid>

## GM COMMANDS

There are many commands for manipulating the game world. You can view more in the Index below or the entire list in the [GM Commands](https://web.archive.org/web/20171112140309/https://www.reaper-x.com/2009/01/01/trinity-core-gm-commands/) document. The most useful for getting started are:

> NOTE: Commands can be abbreviated:
> - .lookup creature thrall
> - .lo cr thrall

### GameMaster (GM)

- **GM Mode**(_Peforming certain tasks in GM mode can have undesireable results!_)
  - .gm on | off
- **Enables your visibility to players**
  - .gm vis on | off
- **Freezes the target so he/she will be unable to move**
  - .freeze
  - .unfreeze

### Aura

- **Removes a specific spell, buff or debuff**
  - .unaura (id)
- **Removes everything from your target**
  - .unaura all
- **Refreshes all cooldowns**
  - .cooldown

### MOVEMENT

- **Fly Mode**
  - .mod gm fly (on | off)
- **Set Player Speed**
  - .mod speed (0-50)
  - .mod speed all (0-50)

### RESURRECT

- **Revive Player**
  - .revive (self/target)
  - /g .revive (self/target) - If you get the "can't do that while dead" message.
- **Kill/Revive Player/MOB**
  - .die (self/target)
  - .respawn (target)

### TELEPORT

- ** Search Teleport Locations **
  - .lo tele (name)
- **Teleport**
  - .tele (location)
    - .tele orgrimmar
  - .tele (name) (location)
    - .tele name PlayerName Jail
- **Save the current location to the database.**
  - .tele add (location)
- **Teleports you to the player's location.**
  - .app (player)
- **Teleports the player to your location.**
  - .sum (player)
- **Teleport to your previous location**
  - .recall

Look at the [Teleport Locations](teleport_locations.txt) document to see a list of all teleport locations you can use. You can also find this data in the game_tele' table of the stygian_world database.

The StygianCore repack comes with a few teleport related items

- **Portal Master (_NPC ID: 601019_)**
  - Located in all major cities and a few other places
  - Offers a free teleport to any destination in the list
  - Locations available are based on the player's level
  
- **Pocket Portal (_ITEM ID: 701002_)**
  - This unique item spawns a Portal Master NPC
  - Shares all the same functionality as the Portal Master NPC
  - Disappears after a 15 seconds (default)
  - Has a 1 minute cooldown (default)

### NPC

- **Add the NPC to the game world**
  - .npc add (id)
  - .npc add temp (id) - _Will not persist after server restart_
- **Delete the NPC from the game world**
  - .npc delete (id)

### ITEM

- **Add an item to the target**
  - .additem (id) (quantity)
    - .additem 701002 (Personal Teleporter)
    - .additem 9360 12 (12 pack of Cuergo's Gold!)
  
### OBJECT

- **Place a game object in the world, like a chair.**
  - .gobject add (id)
    - .gobject add 194377
  - **NOTE:** Game object movement functions are currently broken in AzerothCore. I have created a custom TrinityCore repack with custom tools for performing these operations. See [my website](stygianthebest.github.io) for more information about the TrinityCore Sandbox Project.
  
### SKILLS

- **Lookup Item, Skill, or Object**
  - .lookup (item, skill, gob)
    - .lo it thunderfury
    - .lo sk enchanting
    - .lo gob Christmas Tree
- **Set Skill Level**
  - .setskill (number returned by lookup) 450 450
    - .setskill 762 450 450 (Riding)
- **Add Reputation**
  - .set rep (#)
    - .set rep 10000
- **Learn Profession**
  - .learn all recipe (profession)
    - .learn all recipe jewelcrafting

### GUILD

- **Create Guild**
  - .guild create (Name) ("Guild Name")
    - .guild create Sauron "One Ring"

### SERVER

- **Shutdown/Restart**
  - Shutdown
    - .server shutdown (time)
    - .server idleshutdown
  - Restart
    - .server restart
    - .server idlerestart

### Useful SQL Queries (Using the included Tools\HeidiSQL app)

- **Remove item(s) from a character**
  - DELETE FROM character_inventory where item IN (ITEMID1, ITEMID2, ITEMID3, ITEMID4);

## MODULES

Modules extend the functionality of the server. These modules have many different configuration parameters you can tweak and tune by editing their config files.

- Module config files are located in the .\Server\Core\ folder and the restoration archive folder. All edits should be replicated to the restoration archive to preserve them after a server restore.
- Module config files have the extension .conf.dist.
  - Ex: mod_loremaster.conf.dist
- Most modules have an "Announce" feature which indicates to the user on login that the module is running. This can be turned off by editing the module's config file and placing a '0' for the value instead of '1'.
  - Ex: LoremasterAnnounce = 0

## RESTORATION AND BACKUP

### READ THE FOLLOWING FILES BEFORE ATTEMPTING TO RESTORE OR  EDIT ANY SQL OR CONFIG FILES IN THE REPACK

- TOOLS\README.MD
- TOOLS\WORK\README.MD

![Controls](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/app_stygiancorecontrols.jpg)

With the StygianCore Controls launcher running, click the small sword icon in the bottom right corner of the window. This will open the **StygianCoreTools** batch application.

- This tool handles the archive, backup, and restore processes for StygianCore.
- Archives and backups are saved to the Tools\Temp\ folder.
- Archive, backup, and restore the world, auth, and character databases.
- Restoring StygianCore will reset the repack to the current state of the restoration archive.
- Archives any existing backups when making new backups.
- Allows selective backup and restore for just auth/character or world databases.
- Has error-checking to make sure everything works as intended.

### StygianCore Tools Menu

![StygianCoreTools Menu](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/stygiancoretools_menu.jpg)

The menu and options on this tool are dynamic and will change as you perform different tasks.

- **[0] Patch Core**
  - _Only visible if a repack update archive is found._
  - Updates the repack to the latest release.
- **[1] Export World**
  - This will save the current game world.
  - Worlds can be reloaded without affecting the account/character data.
  - If an existing backup is found, it is archived.
- **[2] Export Accounts/Characters**
  - Exports the servers current accounts, characters, guilds, etc.
  - Accounts/Characters can be reloaded without affecting the world.
  - If an existing backup is found, it is archived.
- **[3] Import World**
  - _Only visible if a world backup is found._
  - Imports the saved World from Option 1.
  - Accounts/Characters are not affected by World imports.
  - If an existing backup is found, it is archived.  
- **[4] Import Accounts/Characters**
  - _Only visible if a account/character backup is found._
  - Imports the saved Account/Character data from Option 2.
  - If an existing backup is found, it is archived.
- **[5] Restore Server (StygianCore)**
  - This will restore the repack to its default state.
  - This is a destructive restore. You will lose all current data.
  - This will rebuild the _restore_stygiancore.zip_ restoration archive before deploying.
  - Uses the newly minted restoration archive to perform the restore.
  - Saved World and Account/Character backups can be reloaded on top of a fresh restore.
  - Use this after updating game files in the restoration archive to commit the changes for future rebuilds.
- **[6] Start Server**
  - Starts/Restarts the Auth and Worldserver processes.
- **[7] NPC Model Tools**
  - Creates the ModelMall that allows you to preview thousands of NPC models at once.
  - Randomizes the NPC models on GM Island.
- **[8] Deploy Visual Studio Builds**
  - _You can ignore this option if you're not compiling._
  - Launches the UpdateDeploy.bat to handle deployment of build files.
  - Automates copying of Debug, RelWithDBInfo, and Release builds + confs for testing.
  - Has an 'Auto-Run' toggle for starting the server after deploy.
- **[9] Update MySQL Configuration**
  - Use this to temporarily alter the ports and server credentials.  

## CREDITS

![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

#### A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)

### Additional Credits

- [Blizzard Entertainment](http://blizzard.com)
- [Michel Martin Koiter](https://web.archive.org/web/20160329220904/http://www.sonsofthestorm.com:80/memorial_twincruiser.html)
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

## LICENSE

All code and scripts are released under [GNU AGPL v3](https://stygianthebest.github.io/license/).

World of Warcraft© and Blizzard Entertainment© are all trademarks or registered trademarks of Blizzard Entertainment© in the United States and/or other countries. These [terms](http://us.blizzard.com/en-us/company/about/legal-faq.html) and all related materials, logos, and images are [copyright](http://us.blizzard.com/en-us/company/about/copyrightnotices.html) Blizzard Entertainment©. This site and content is in no way associated with or endorsed by Blizzard Entertainment©.