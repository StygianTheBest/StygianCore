![StygianCore](https://stygianthebest.github.io/assets/img/logo/world_of_stygiancore.png "StygianCore")

## DOWNLOAD

- [Mirror 1 (MEGA)](https://rebrand.ly/stygiancore_release_mega)
- [Mirror 2 (MediaFire)](https://rebrand.ly/stygiancore_release_mediafire)

_This repo only contains updates to the files in the repack archives above. Unless you plan to compile this source on your own, you will need to download the repack archive first. All updates except C++ based core and module changes can be applied directly to your repack's restoration archive folder and then deployed with the included tools._

## GREETINGS

Welcome to StygianCore. This repack is powered by AzerothCore and would not be possible without the players, developers, and communities of the World of Warcraft MMO emulator and private server scene. A big thanks to everyone for any and all contributions absorbed to make this repack possible. Your hard work is much appreciated!

## INTRODUCTION

StygianCore is World of Warcraft v3.3.5a server powered by a modified build of the AzerothCore World of Warcraft v3.3.5a server emulator. It has been providing an enjoyable gaming experience to hundreds of kids at our school since summer of 2017. Last fall I promised to release a repack of this server for parents and students to host at home. Additionally, I wanted to share a fun levelling server for solo or 4-10 player groups and help others who want to get started with development, scripting, and building their own server experience.

Included are custom tools and docs for maintaining the game database and automating archive, save, and restore operations for sandboxing, testing, and development.

In addition to new content, this repack includes updated versions of the modules, SQL, custom tools, and client modifications from my [AzerothCore Content](https://github.com/StygianTheBest/AzerothCore-Content) release in summer 2017.

## DOCUMENTATION & SUPPORT

### This repack is released with _no official support_. All questions, requests, and bug reports should be directed through the [StygianCore GitHub](https://github.com/StygianTheBest) repo(s). Be sure to follow the repos to see when I put out an update or bugfix. I will respond to all questions as time permits.

Documentation for the this repack and its contents can be found throughout the documents, code, SQL, and scripts. For more information you can [visit my website](http://stygianthebest.github.io) or peruse the [GIT](https://github.com/StygianTheBest) repos. I've tried to be as detailed as possible to diminish the learning curve and get new users up and running quickly.

The Support folder also contains documentation and other support files. You can view many these files by by starting the included Apache Web server and visiting the Account Registration Portal at http://127.0.0.1/.

### Support Folder Contents

- GameMaster's Guide
  - Accounts
  - GM Commands
  - Modules
  - Restoration and Backup
  - Server
- GM Commands
- Custom NPC List
- Custom Item List
- Teleport Destination List
- Item Reference
- Spell Reference
- Quest Reference
- Chat Icon List
- LUA Color Reference
- Mount ID List
- Race/Class ID List
- Unused Item ID List
- A few other useful texts

## CORE

- AzerothCore rev.  e5fde8c8226a+ 2018-12-19 (master branch) (Win64, Release) Modified
- Apache 2.2.17 Web Server with working SOAP Account Registration page
- MySQL 5.6.42
- PHP 5.3.5
- Eluna LUA Engine
- Core Modifications:
  - DungeonCheckpoints
  - Beastmaster Pet Handling
  - Day/Night Cycle

## BACKUP/RESTORE

- Easy Backup/Restore/Save/Archive the accounts, characters, and game world.
- Includes an Azerothcore (master) build sandbox mode.
  - Saves the current server state before restore.
  - Temporarily restores default binaries and databases for sandbox testing.
  - Restores back to the server state prior to sandboxing.
  - Auto-Install patches for testing and development.
  - Restoration archives are upgradable for testing future versions of AzerothCore.

## HIGHLIGHTS

### PLAYER AND SERVER

- On character creation configurable options include:
  - Add the player to a guild
  - Grant Exalted faction with all major cities
  - Grant items and heirloom gear
  - Grant additional or all weapon skills
  - Grant special abilities of other classes such as Sprint, Remove Curse, etc.
- Personal Teleporter - Spawns a teleport NPC that fades after use
- Tome of World Flying - Allows learning of flying in classic zones
- Weapon skills level up to max with each level gained
- 11 Profession limit for each character
- Random chance to enchant gear on drop, quest, or craft
- Day/Night Cycle configurable - One game day passes every 6 hours
- XP Rate configurable as you play. From the console type: .xp set <rate 0-10>
- Cross-Faction
  - Accounts
  - Auction House
  - Calendar
  - Channel
  - Chat
  - Friends
  - Group
  - Guild
  - Mail
  - Trade
  - WhoList

### LIFE, DEATH, AND COMBAT

- Dungeon Checkpoints: You resurrect at the last or closest boss killed with 25% health/mana
- Dungeons and Raid difficulty is auto-scaled based on player count and other factors
- Quest, Raid, and Party requirements for entering instances are ignored
- 25% reduced creature aggro rate
- 25% less creature assistance radius
- 25% less creature flee assistance radius
- Resurrection Sickness is disabled
- Durability on resurrection has been reduced
- PVP kills can allow the player to loot a percentage of the victim's loot.
- A bounty system can award players money for mob or player kills based on level.
- World, Dungeon, and PVP kills are announced to the world.
- All classes can have Hunter tamed beasts that will assist you in battle.

### CUSTOM NPC

- BeastMaster NPC: Allows all classes to have and control hunter pets
- Buffer NPC: Buffs players with one click
- Codebox NPC: Allows codes to be entered for gold and items
- Enchanter NPC: Offers all weapon and armor enchantments
- Fisherman NPC: A custom fishing vendor with a path, waypoints, and speech
- Gambler NPC: Allows players to gamble their money
- Gift Box NPC - Sends players gifts at specified times like level-up
- Global Trainer NPC - Trains all classes and skills
- Portal Master NPC: Provides quick transport all over the realm
- Jukebox NPC - Plays much of the music content and videos in the game
- Transmogrifier NPC (ELUNA): Transmog your gear

### CUSTOM VENDORS

- StygianCore Specialty Vendors: Over 30 new vendors with custom item sets
- GM Island Vendor Mall + Building Theme Changer (.tele gmisland)
- Heirloom Vendors in all player starting zones
- Elven Gem Vendors in Moonglade (.tele gemglade)
- Sorcerer Glyph Vendors in Undercity and Darnassus (.tele glyphcity, glyphdarn)

### ITEM PRICING

- Vendor an items have been repriced using the included template
  - Prices are adjusted for my server's solo and small group players
  - Fishing is now much more lucrative
  - Rare and strange items now fetch more money from vendors
  - The repricing template can be adjusted/imported to suit your needs.

### PLAYER ITEMS

> _A [client patch](https://github.com/StygianTheBest/StygianCore/tree/master/Client/Data) is required to see the icons for the custom items in this repack._

- **Personal Teleporter:** An item that spawns a teleport NPC that fades after use.
- **Level-Up Token:** An item that levels the player up on use. This is a unique item.
- **Tome of World Flying:** Sold by all flight masters. Allows flying in classic zones.
- **Azerothian Humor Vol.1:** A book of WoW jokes. Not sold in stores! Parents beware!

## ELUNA

**This repack includes the Eluna LUA Scripting Engine.**

When possible, I've moved module functions to ELUNA. This is a work in progress.

## MODULES

**StygianCore was compiled with the following modules/mods:**

- [Better Item Reloading](https://github.com/azerothcore/mod-better-item-reloading)
- [Congrats On Level Up](https://github.com/StygianTheBest/mod-congratsonlevel)
- [Custom Login](https://github.com/StygianTheBest/mod-customlogin)
  - Set Reputation
  - Set Skills
  - Set Special Abilities
  - Set Special Items
  - Set Heirloom Items
- [Custom Server](https://github.com/StygianTheBest/mod-customserver)
  - Contains Core modifications
- [Duel Reset](https://github.com/azerothcore/mod-duel-reset)
- [Dungeon Checkpoints](https://github.com/callmephil)
- [Eluna LUA Engine](https://github.com/azerothcore/mod-eluna-lua-engine)
  - Script: Transmogrification NPC
- [GM Island](https://github.com/StygianTheBest/mod-gmisland)
- [Individual XP](https://github.com/azerothcore/mod-individual-xp)
- [Item Level-Up](https://github.com/StygianTheBest/mod-item-level-up)
- [Money For Kills](https://github.com/StygianTheBest/mod-moneyforkills)
  - World/Dungeon Boss Kill Announcer
  - PVP Kill Announcer
  - Suicide Announcer
- [NPC Buffer](https://github.com/StygianTheBest/mod-npcbuffer)
  - Updated with emotes, speech, config options
- [NPC Gambler](https://github.com/StygianTheBest/mod-npcgambler)
- [NPC Codebox](https://github.com/StygianTheBest/mod-npccodebox)
- [NPC Enchanter](https://github.com/StygianTheBest/mod-npcenchanter)
- [NPC Beastmaster](https://github.com/StygianTheBest/mod-npcbeastmaster)
- [NPC All Mounts Vendor](https://github.com/StygianTheBest/mod-npcallmounts)
- Random Enchants (https://github.com/azerothcore/mod-random-enchants)
  - % Chance to enchant is now configurable
  - Item Quality to enchant is now configurable
- [Starting Guild](https://github.com/StygianTheBest/mod-startguild)
  - Added SQL for creating default Guild/Characters/Guild Bank
- [VAS AutoBalance](https://github.com/azerothcore/mod-vas-autobalance)

## TOOLS

I've packaged a few custom tools I use for administration of the server. Batch files are used extensively to automate many file handling and database import/export functions. The custom front-end program controls batch files to launch and manage the server processes.

- **StygianCoreControls.exe (SCC)**
  - A server front-end, process monitor, and launcher.
  - Dedicated launch icons for StygianCoreTools and HeidiSQL.
  - Monitors server processes (World, Auth, MySQL, Apache).
  - Restarts crashed processes.
  - Hides running process windows.
  - Gracefully shuts down the database to prevent data loss.
  - Monitors and logs crashes and other system events.

- **StygianCoreTools.bat**
  - This batch file is a UI for game database management.
  - Launch it via a dedicated launch button on the SCC launcher.
  - AzerothCore Sandbox Mode for testing and development.
  - Easy backup, restoration, and testing of game data from backup, archive, or patch.
    - Dynamicly rebuilds restoration archives for quick updates.
    - All backup and archive data is stored in the **Tools/Temp** folder.
    - Selectively backup and restore auth/character or world databases.
    - Auto archives any existing backups when a backup is run.
    - Has error-checking to make sure everyting runs as intended.

- **UpdateDeploy.bat**
  - Included only for reference. Edit the paths to match your system.
  - Launched via StygianCoreTools batch file or start_deploy.bat.
  - Automates testing of different Visual Studio builds on the test server.
  - Supports Debug, RelWithDebInfo, and Release configurations.
  - Supports "Auto Start" after deploying. Great for testing build changes quickly.
  - Extremely useful for Pre/Post Build Events if modified.

- **start_'process'.bat**
  - These are used for customizing the launch of server processes and tools and providing ways to automate tasks from the SCC launcher. There's one for each major process and a few tools.

- **HeidiSQL 9.5 x64 Portable**
  - An excellent free database mangement alternative to NaviCat.
  - Launch it via a dedicated launch button on the SCC launcher.

# GETTING STARTED

This repack includes a default Administrator account. It is used to log into the server console, the WoW game client, and for SOAP communications via the Account Registration portal.

    - Login: admin
    - Password: wow

## 1) ON EACH GAME CLIENT

Set your realmlist.wtf file to point to the server. For local play it should work with 127.0.0.1.

- Locate and edit the WoW client file: **realmlist.wtf**
  - Ex: \<PATH TO WOW>\Data\enUS\realmlist.wtf
- **SET REALMLIST 127.0.0.1**

If you are putting the server on a different system, you will need to use that system's address.
In addition, you will need to edit the auth database to point to that system. In the example, the
server is listening on address 192.168.1.20 and local address 127.0.0.1. Here's a sample query to change the IP.

    INSERT INTO `stygian_auth`.`realmlist` (`id`, `name`, `address`, `localAddress`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`) VALUES ('1', 'StygianCore', '192.168.1.20', '127.0.0.1', '255.255.255.0', '8085', '0', '0', '2', '0', '0', '12340');

## 2) UNZIP THE STYGIANCORE REPACK ARCHIVE

This server and tools are portable. You should be able to run it from any folder.

**Recommended Repack Folder: C:\Games\WoW\StygianCore**

## 3) EXECUTE THE TOOLS

### StygianCoreControls.exe - Launcher and Process Monitor

Run StygianCoreControls.exe - This is a launch tool built for StygianCore and assists with running the processes and admin tools in the repack. It is preconfigured to run all of the server components. It controls the following processes:

- Launcher for custom batch files to run StygianCoreTools, HeidiSQL, and others.
- Start/Stop/Restart World, Character, Auth, Web servers
- Track process uptime
- Log server events (Autosave)
- Hide process windows for each server
- Docks to systray with process uptime as balloon text
- Dragons denote the status of each process:
  - Green: Process is running and uptime timer is running
  - Red: Process is not running.
  - Red (Collapsed): Process path not found. Click to set a new path.
  
 This tool comes preconfigured to launch each process batch file, but if you want to change the process or path just click the Dragon icon to bring up the process configuration.

    - WorldServer - start_world.bat
    - AuthServer - start_auth.bat
    - Database - start_database.bat
    - WebServer - start_web.bat
    - HeidiSQL - start_sql.bat
    - DB Tools - StygianCoreTools.bat
    - VS Deploy - start_deploy.bat

### StygianCoreTools.bat - Database Maintenance Tool

This tool handles the archive, backup, and restore processes for StygianCore. When you're ready to perform on of these tasks, click the small 'sword' icon in the bottom right of the launcher to bring up the tool.

- Archives and backups are saved to the Tools\Temp\ folder.
- Archive, backup and restore the world, auth, and character databases.
- Restores the database system to the default state for StygianCore or AzerothCore.
  - Restoring StygianCore will reset the repack to the default state.
  - Sandbox Mode will backup the current server state and restore fresh AzerothCore (master) binaries and database.
    - Exiting Sandbox Mode restores the previously saved game state.
- This is a great option for sandbox testing in-game.
- Archives existing backups when making new backups.
- Allows selective backup and restore for just auth/character or world databases.
- Has error-checking to make sure everything works as intended.

### StygianCore Tools Menu

The menu and options on this tool are dynamic and will change as you perform different tasks. The default menu looks like this:

- **[1] Export World**
  - This will save the current game world.
  - Worlds can be reloaded without affecting the account/character data.
  - If an existing backup is found, it is archived.
- **[2] Export Accounts/Characters**
  - Exports the servers current accounts, characters, guilds, etc.
  - Accounts/Characters can be reloaded without affecting the world.
  - If an existing backup is found, it is archived.
- **[5] Restore Server (StygianCore)**
  - This will restore the repack to its default state.
  - This is a destructive restore. You will lose all current data.
  - This will rebuild the _restore_stygiancore.zip_ restoration archive before deploying.
  - Uses the newly minted restoration archive to perform the restore.
  - Saved World and Account/Character backups can be reloaded on top of a fresh restore.
  - Use this after updating game files in the restoration archive to commit the changes for future rebuilds.
- **[6] Sandbox Mode (AzerothCore)**
  - This will restore the repack to the default AzerothCore release.
  - This is a destructive restore. You will lose all current data.
  - This will rebuild the _restore_azerothcore.zip_ restoration archive before deploying.
  - Uses the newly minted restoration archive to perform the restore.
  - The current game state is backed up to Tools\SaveGameState.
  - This mode is for testing for bugs, testing patches, and development.
  - Exiting Sandbox Mode will restore the game back to its prior saved state.
- **[7] Update MySQL Configuration**
  - Use this to temporarily alter the ports and server credentials.
- **[8] Deploy Visual Studio Builds**
  - Launches the UpdateDeploy.bat to handle deployment of build files.
  - This automates copying of Debug, RelWithDBInfo, and Release builds and confs while testing.
  - Has an 'Auto-Run' toggle for starting the server after copy.
  - You can skip this if you're not compiling.

## REPACK UPDATES

**[This repo](https://github.com/StygianTheBest/StygianCore) is the home of all future updates to any of the content in this repack. The folder structure is a mirror of the file structure within the repack archive, so you can easily download and copy file updates into your repack or restoration archive.**

    - Client
      - Interface
        - AddOns and Login Screen Updates
      - Data
        - Game Patches
    - Repack
      - Server
        - Apache
          - httpdocs
            - Account Registgration Portal
            - Online Documentation
        - Core
          - lua_scripts
            - LUA scripts for ELUNA
      - Support
        - Docs
          - Server Documentation
        - Icons
          - For shortcuts and the like
      - Tools
        - Work
          - restore_stygiancore
            - The master restoration archive.
            - All game SQL, conf, and other updates are stored here.
            - This is where the magic happens. The Codex of Ultmate Wisdom.
  
## OTHER INFORMATION

### DEVBOX

- Apple i7 Mac-Mini (MID-2012), SSD, 16GB RAM, Thunderbolt
- Windows 10 Enterprise
  - VMWare Workstation (Windows 7 Professional)
  - Microsoft Visual Studio Community 2017
  - Navicat/HeidiSQL
  - SmartGIT
  - Notepad++

### CORE MOD FILES

#### All mods are tagged with #SCMOD in the source

- Beastmaster NPC - Better Pet Handling
  - Edits: Pet.cpp, npc_beastmaster module

- Day/Night Cycle Timer
  - Edits: World.cpp, World.h, Player.cpp, customserver module

- Dungeon Checkpoints
  - Edits: Player.cpp, customserver module
  
### ADDITIONAL TOOLS USED

- Azure DevOps (TFS)
- Cleanmem
- FreeFileSync
- Faststone Image Viewer
- Greenshot
- HeidiSQL
- Navicat
- Notepad++
- SmartGit
- Tortoise SVN
- Visual Studio Code
- VMWare Workstation
- WinDiff
- And the trusty old MS-DOS CMD Interpreter

### RESTORE TIMING

This is the timing for Restore (Option #5) in StygianCoreTools.bat.

    - 0:00 - DEFAULT CONTENT (START RESTORE)
    - 1:47 - UPDATE CONTENT
    - 2:13 - CUSTOM CONTENT (FINISH RESTORE)

## CREDITS

![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

#### A repack for AzerothCore by StygianTheBest ([GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io))

### Additional Credits

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
- [More credits are cited in the sources](https://github.com/StygianTheBest)

## LICENSE

This code and content is released under the [GNU AGPL v3](https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3).