### <p align="center">![StygianCore](https://stygianthebest.github.io/assets/img/logo/world_of_stygiancore.png "StygianCore")</p>

#### <p align="center"> A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)</p>

## NEWS

### StygianCore v2019.03.01 has been released! 

- [Changelog](https://github.com/StygianTheBest/StygianCore#changelog) | [Bugfixes](https://github.com/StygianTheBest/StygianCore/blob/master/Tools/Work/restore_stygiancore/03_custom/db_world/world_update_bugfix.sql)
- There are **MANY** new improvements and additions in this version.
- If you are running a previous version, I **highly recommend** moving to this one ASAP.

## DOWNLOAD

- **StygianCore Repack** _(Release v2019.03.01)_
  - [Mirror 1 (MEGA)](https://rebrand.ly/stygiancore_release_mega)
  - [Mirror 2 (Google)](https://rebrand.ly/stygiancore_release_google)

- **StygianCore HD Client Upgrade** _(Release v2019.03.01)_
  - [View Project Details](https://rebrand.ly/stygiancore335client)
  - [Mirror 1 (MEGA)](https://rebrand.ly/stygiancore_client_mega)
  - [Mirror 2 (Google)](https://rebrand.ly/stygiancore_client_google)


## GREETINGS

Welcome to StygianCore. This repack is powered by AzerothCore and would not be possible without the players, developers, and communities of the World of Warcraft MMO emulator and private server scene. A big thanks to everyone for any and all contributions absorbed to make this repack possible. Your hard work is much appreciated!

<div style="font-weight: bold; color:green;">This project is, and will always be, FREE! I designed it with lots of comments and templates to make life easier for new developers and creators to get started. My hope is that all of the hard work I put into this will inspire others to get involved and create more cool and interesting projects for the WoW Emulation community.</div>

#### This repack is dedicated to the late [Michel Martin Koiter](https://web.archive.org/web/20101201092653/http://www.sonsofthestorm.com/memorial_twincruiser.html) (May 4, 1984 – March 18, 2004). His shrine in World of Warcraft served as a place of solace for myself, my guildmates, and countless others in the classic days of World of Warcraft and beyond. 

# <p align="center">![TRIBUTE TO MICHEL KOITER](https://stygianthebest.github.io/assets/img/projects/mod-michelkoiter/michel-koiter-tribute-stygianthebest.jpg "A Tribute to Michel Koiter")</p>

Michel Koiter was one of Blizzard Entertainment's premium artists and a member of [Sons of the Storm](https://web.archive.org/web/20101201092653/http://www.sonsofthestorm.com/memorial_twincruiser.html). He went by the moniker "_Twincruiser_", an artistic collaboration with his twin brother René Koiter. Just a few months before World of Warcraft's release, he died of unexpected heart failure. He was 19 years old. The cause of his death was never really understood and remains shrouded in mystery.

- I recreated [Michel Koiter](https://wow.gamepedia.com/Michel_Koiter)'s orc warrior, located at the [Shrine of the Fallen Warrior](https://wow.gamepedia.com/Michel_Koiter) in The Barrens, as closely as possible. It is said that the gear his orc has equipped is exactly as it was when he last logged out of the World of Warcraft Beta.
- A custom NPC is available in normal and ghost form.
- The Guildmaster character for the Horde is Koiter's orc warrior complete with armor and sword.
  - This specific armor he wore was unused, marked for use by NPCs, and not accessible to players.
  - I located each item in the data files _(quite the chore!)_ and updated the entries in the Item.dbc and ItemDisplayInfo.dbc to make them useable as item id 701005 thru 7010012.
  - The correct shoulders were found, but not the one-shoulder variant that Koiter's orc is wearing on the shrine. After looking at the shrine again, **_my theory_** is they removed the left shoulder of the model because it would have stuck into the shrine wall.

#### <p align="center"> _It is said that his ghost still wanders the Barrens looking for a good brawl._
</p>

#### <p align="center"><span style="font-weight: bold; font-style: italic; color: #ff6600;">**_Rest In Peace.. See you on the other side brother._**</span></p>

## INTRODUCTION

StygianCore is World of Warcraft v3.3.5a server powered by a modified build of the AzerothCore World of Warcraft v3.3.5a server emulator. Last fall I promised to release a repack of this server for friends to host at home. Additionally, I wanted to share a fun levelling server for solo or 4-10 player groups and help others who want to exprience the nostalgia of the past and get started with development, scripting, and building their own server experience.

Included are custom tools and docs for maintaining the game database and automating archive, save, and restore operations for sandboxing, testing, and development.

### A bit of history...
In addition to new content, this repack includes updated versions of my C++ modules, SQL templates, custom tools, and client modifications from my [AzerothCore Content](https://github.com/StygianTheBest/AzerothCore-Content) release in summer 2017 which included 11 new modules and a lot of ported C++ and SQL from TrinityCore.

### <p align="center">![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianTheBestThanksYouAll.jpg)</p>

## DOCUMENTATION & SUPPORT

### This repack is released with _no official support_. All questions, requests, and bug reports should be directed through the StygianCore [GitHub](https://github.com/StygianTheBest) repo(s). Be sure to follow the repos to see when I put out an update or bugfix. I will respond to all questions as time permits.

Documentation for the this repack and its contents can be found throughout the documents, code, SQL, and scripts. For more information you can [visit my website](http://stygianthebest.github.io) or peruse the [GIT](https://github.com/StygianTheBest) repos. I've tried to be as detailed as possible to diminish the learning curve and get new users up and running quickly.

## READ THE FOLLOWING FILES BEFORE ATTEMPTING TO RESTORE, EDIT, OR DELETE ANY SQL OR CONFIG FILES IN THE REPACK

- TOOLS\README.MD
- TOOLS\WORK\README.MD

The **Support** folder also contains documentation and other support files. You can view many these files by by starting the included Apache Web server and visiting the Account Registration Portal at http://127.0.0.1/.

## TL;DR 
- Check out the [Getting Started](https://github.com/StygianTheBest/StygianCore#getting-started) section!

### Support Folder Contents

- GameMaster's QuickStart Guide
  - Accounts
  - GM Commands
  - Modules
  - Restoration and Backup
- Comprehensive GM Command List
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

- AzerothCore rev. 500c04+ 2019-02-27 11:04:10 -0500 (Master, Win64, Release) Modified
- Apache 2.2.17 Web Server with working SOAP Account Registration page
- MySQL 5.6.42
- PHP 5.3.5
- Core Modifications:
  - Beastmaster Pet Support
  - DungeonCheckpoints
  - Eluna LUA Engine
  - Multi-Vendor
  - TimeShift

## BACKUP/RESTORE/UPDATE

- Easily backup, restore, and archive the accounts, characters, and game world.
- A repack update function is included to support future revisions.
- Restoration archives are upgradable.

## HIGHLIGHTS

### SERVER, PLAYER, AND GUILD

- Realm type set for RP-PVP rules. Why? Nostalgia. ;)
- XP gain for exploration has been doubled.
- Mail Delivery Delay reduced to 10 seconds.
- Tome of World Flying allows flying in classic zones.
  - Flying has been disabled for battlegrounds
- Random chance to enchant gear on drop, quest, or craft.
- TimeShift
  - Adjust the number of game days per real day
  - Default: One game day passes every 3.2 hours
- Cross-Faction enabled for:
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
- On character creation configurable options include:
  - Add the player to a guild
  - Grant Exalted faction with all major cities
  - Grant items and heirloom gear
  - Grant additional or all weapon skills
  - Grant special abilities of other classes such as Sprint, Remove Curse, etc.
- Players start with the following:
  - Starting Gold (Configurable - Default: 1000)
  - Personal Teleporter - Spawns a teleport NPC that fades after use
  - Heirloom Trinkets
  - Heirloom Ring
  - Foror's Crate of Endless Storage (36 slot bag)
- Player XP rate configurable as you play. From the console type: .xp set <rate 0-10>.
- Includes two default characters and guilds for Horde and Alliance.
  - Guildmaster characters are owned by the Administrator account.
  - Guildmaster characters are equipped and ready for play.
  - Guilds are pre-configured for use:
    - Horde Guild: _Sons of the Storm_
    - Alliance Guild: _Emerald Dreams_
    - Guild Banks have all tabs available
    - Guild Tabs are styled with icons
    - Guild Roles and Limits are set
    - Guild Tabards are designed

![Guildmaster Characters](https://stygianthebest.github.io/assets/img/projects/stygiancore/stygiancore_gmchars.jpg)

> _Default Guildmaster Characters for Alliance & Horde_

### LIFE, DEATH, AND COMBAT

- Dungeon Checkpoints: You resurrect at the last or closest boss killed with 25% health/mana.
- Dungeons and Raid difficulty is auto-scaled based on player count and other factors.
- Quest, Raid, and Party requirements for entering instances are ignored.
- Quest's can be completed while in raid groups.
- Creature aggro rate reduced by 25%.
  Creature assistance radius reduced by 25%.
- Creature flee assistance radius reduced by 25%.
- Resurrection Sickness is disabled.
- Durability hit on ressurrection reduced to 5% from 25%.
- Battleground Deserter debuff is disabled.
- PVP kills can allow the player to loot a configurable percentage of the victim's loot if desired.
- A bounty system can award players a configurable amount of money for mob or player kills based on level if desired.
- World, Dungeon, and PVP kills are announced to the world.
- All classes can adopt beasts like the Hunter class that will assist you in battle.

### SKILLS & CRAFTING

- Players can now learn up to 11 professions.
- Weapon skills level up to max with each level gained.
- Skill gain on crafting has been doubled.
- Skill gain on gathering has been doubled.
- Skill gain on greens increased to 50%.
- Skill gain on greys increased to 25%.

### WORLD

> _A [client patch](https://github.com/StygianTheBest/StygianCore/tree/master/Client/Data) is required to enable this content in the repack._

- Access to previously inaccessible zones:
  - Emerald Dream
    - [Emerald Dream Canyon](https://www.ownedcore.com/forums/world-of-warcraft/world-of-warcraft-model-editing/wow-advanced-model-edits/512219-emerald-dream-canyon.html) Mod
  - Programmer Isle
  - Designer Isle

### CUSTOM NPC

- BeastMaster NPC: Allows all classes to have and control hunter pets.
- Bengal Tiger NPC: If you can find the cave, she gives you the Bengal Tiger!
- Buffer NPC: Buffs players with one click.
- Critters NPC: Various critters (Pig, Dog, Horse, Cow, etc.)
- Codebox NPC: Allows codes to be entered for gold and items.
- Enchanter NPC: Offers all weapon and armor enchantments.
- Fisherman NPC: A custom fishing vendor with a path, waypoints, and speech.
- Gambler NPC: Allows players to gamble their money.
- Gift Box NPC: Sends players gifts at specified times like level-up.
- Global Trainer NPC: Trains all classes and skills.
- Jukebox NPC: Plays much of the music content and videos in the game.
- Loremaster NPC: Recants lore and trivia of WoW at specific locations.
- Multi-Vendor NPC: Allows multiple item iventories on one vendor.
- Portal Master NPC: Provides quick transport all over the realm.
- Trollop NPC: Everyone needs someone.
- Transmogrifier NPC (Eluna): Transmog your gear.
- World Trainer NPC: Trains every class, skills, and flying.

### CUSTOM VENDORS

StygianCore Specialty Vendors: Over 30 new vendors with custom item sets are placed in various locations throughout the land.

- Here are a few locations:
  - Booty Bay (.tele bootybay)
  - GM Island (.tele gmisland)
  - Moonglade (.tele vgems)
  - Ratchet (.tele ratchet)
  - Silithus Camp (.tele vcamp)
  - Silvermoon (.tele silverm)
  - Sunrock Retreat (.tele sunrock)
  - Thunder Bluff (.tele thunderbluff)
  - Winterspring (.tele vholiday)
- GM Island Vendor Mall
  - Includes all StygianCore custom vendors
  - Includes Rownan's Twink 19 vendors
  - Includes Island Theme Manager
- Heirloom Vendors in all player starting zones.
- Multi-Vendor for Gems and Glyphs (.tele bootybay)

### CUSTOM NPC TOOLS

- NPC Model Mall: Generates hundreds or thousands of NPCs with unique models.
  - NPCs are spawned on Programmer Isle
  - NPCs are named as their ModelID #
  - Number of models and spawn location is configurable
- NPC Model Randomizer: Randomizes the models of NPCs from a list of valid models.
  - This is used for GM Island and Vendor Set NPCs
  - Reseeding of random models can be done from StygianCoreTools

### ITEM PRICING

Vendor an items have been repriced using the included item pricing template.

- The included repricing template can be adjusted/imported to suit your needs.
- Prices are adjusted for my server's solo and small group players
- Fishing is now much more lucrative
- Rare and strange items now fetch more money from vendors

### PLAYER ITEMS

> _A [client patch](https://github.com/StygianTheBest/StygianCore/tree/master/Client/Data) is required to see the icons for the custom items in this repack._

- **Personal Teleporter:** An item that spawns a teleport NPC that fades after use.
- **Level-Up Token:** An item that levels the player up on use. This is a unique item.
- **Tome of World Flying:** Sold by all flight masters. Allows flying in classic zones.
- **Azerothian Humor Vol.1:** A book of WoW jokes. Not sold in stores! Parents beware!
- **GameMaster's License:** A vanity item for kids so they can brag about being a REAL GM!

![Eluna](http://www.elunaengine.com/static/eluna-logo.png)
--

**This repack includes the Eluna LUA Scripting Engine.**

 The Eluna Lua Engine© API allows you to add your own Lua code to be executed when certain events (called "hooks") occur.

Add a new in-game command, give life to creatures with new AI, or even light players who try to duel on fire! If the hook exists, you can script it.

- You can find the included and sample scripts in the _Server\Core\luascripts_ folder.
- Eluna allows functionality such as [Rochet2's Item/Player Gossip](http://rochet2.github.io/Player-and-Item-Gossip.html) for TrinityCore.

## MODULES

**StygianCore was compiled with the following modules/mods:**

> Be sure to look at the config files for the world server and modules located in the Server/Core folder. You can modify these files to configure how the server and modules work and what features are available for each during gameplay.

- [Better Item Reloading](https://github.com/azerothcore/mod-better-item-reloading)
- [Congrats On Level Up](https://github.com/StygianTheBest/mod-congratsonlevel)
- [Custom Login](https://github.com/StygianTheBest/mod-customlogin)
  - Set Reputation
  - Set Skills
  - Set Special Abilities
  - Set Special Items
  - Set Heirloom Items
- [Custom Server](https://github.com/StygianTheBest/mod-customserver)
  - Core modifications and smaller scripts
- [Duel Reset](https://github.com/azerothcore/mod-duel-reset)
- [Dungeon Checkpoints](https://github.com/callmephil)
- [Eluna LUA Engine](https://github.com/azerothcore/mod-eluna-lua-engine)
  - Script: GM Command Handler
  - Script: Item Gossip & other examples
  - Script: Transmogrification NPC
- [GM Island](https://github.com/StygianTheBest/mod-gmisland)
- [Individual XP](https://github.com/azerothcore/mod-individual-xp)
- [Item Level-Up](https://github.com/StygianTheBest/mod-item-level-up)
- [Money For Kills](https://github.com/StygianTheBest/mod-moneyforkills)
  - World/Dungeon Boss Kill Announcer
  - PVP Kill Announcer
  - Suicide Announcer
- [NPC All Mounts Vendor](https://github.com/StygianTheBest/mod-npcallmounts)
- [NPC Beastmaster](https://github.com/StygianTheBest/mod-npcbeastmaster)
- [NPC Buffer](https://github.com/StygianTheBest/mod-npcbuffer)
  - Updated with emotes, speech, config options
- [NPC Codebox](https://github.com/StygianTheBest/mod-npccodebox)
- [NPC Enchanter](https://github.com/StygianTheBest/mod-npcenchanter)
- [NPC Gambler](https://github.com/StygianTheBest/mod-npcgambler)
- [NPC Loremaster](https://github.com/StygianTheBest/mod-npcloremaster)
- [NPC Multi-Vendor](http://rochet2.github.io/Multivendor.html)
- [NPC Trollop](https://github.com/StygianTheBest/mod-npctrollop)
- [Random Enchants](https://github.com/azerothcore/mod-random-enchants)
  - % Chance to enchant is now configurable
  - Item Quality to enchant is now configurable
- [Starting Guild](https://github.com/StygianTheBest/mod-startguild)
  - Added SQL for creating default Guild/Characters/Guild Bank
- [VAS AutoBalance](https://github.com/azerothcore/mod-vas-autobalance)

# GETTING STARTED

This repack includes a default Administrator account. It is used to log into the server console, the WoW game client, and for SOAP communications via the Account Registration portal.

## ADMIN LOGIN

- **Login: admin**
- **Password: wow**

## 1) UNZIP THE STYGIANCORE REPACK ARCHIVE

**This server and tools are portable.** You can run it from any folder.

- **Recommended Repack Folder: C:\Games\WoW\StygianCore**

## 2) CONFIGURE THE SCC LAUNCHER

### StygianCoreControls.exe - Launcher and Process Monitor

![Controls](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/app_stygiancorecontrols.jpg)

Run **StygianCoreControls.exe** - This is a launch tool built for StygianCore and assists with running the processes and admin tools in the repack. It is preconfigured to run all of the server components. It offers the following features:

- A server launcher, front-end, and process monitor.
- Start/Stop/Restart World, Character, Auth, Web servers.
- Dedicated launch icons for StygianCoreTools and HeidiSQL.
- Monitors server processes (World, Auth, MySQL, Apache).
- Restarts crashed processes.
- Hides running process windows.
- Gracefully shuts down the database to prevent data loss.
- Monitors and logs crashes and other system events.
- Docks to systray with process uptime as balloon text.
- Track process uptime.
- Dragons denote the status of each process:
  - Green: Process is running and uptime timer is ticking.
  - Red: Process is not running.
  - Yellow: Process path not found. Click to set a new path.
  
 This tool comes preconfigured to launch each process batch file, but if you want to change the process or path just click the Dragon icon to bring up the process configuration. Each process should point to the following batch files in the repack root folder:

    - WORLD - start_world.bat
    - AUTH - start_auth.bat
    - DB - start_database.bat
    - WEB - start_web.bat

### ICONS ![StygianCore Tools](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/icons_stygiancorecontrols.jpg)

Each icon launches a tool or performs a function:

- Book: Expand the window to reveal the log and other options.
- Sword: Launch StygianCore Repack Maintenance Tool.
- Gold Coins: Launch the included HeidiSQL Portable application.
- Shield: _Not Shown_ Hides running processes windows.
- Potion: Drink Me!

### StygianCoreTools.bat - Repack Maintenance Tool

When you're ready to run an archive, backup, or restore process, click the small _Sword_ in the bottom right of the launcher to bring up the tool which performs the following tasks:

- Easy backup, restore, archive, and testing of game data.
- All backup and archive data is stored in the **Tools/Temp** folder.
- Dynamically rebuilds restoration archives for quick updates.
- Allows selective backup and restore for just auth/character or world databases.
- Auto archives any existing backups when a backup is run.
- Restores the server db and configuration to the current state of the restoration archive.
  - This is a great feature for sandbox testing.
- Has error-checking to make sure everything works as intended.

### StygianCore Tools Menu

The menu and options on this tool are dynamic and will change as you perform different tasks. The default menu looks like this:

![StygianCoreTools Menu](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/stygiancoretools_menu.jpg)

#### MENU OPTIONS

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

### ADDITIONAL TOOLS

I've packaged a few custom tools I use for administration of the server. Batch files are used extensively to automate many file handling and database import/export functions.

- **start_'process'.bat**

  - These are used for customizing the launch of server processes and tools and providing ways to automate tasks from the SCC launcher or SCT.
  - There's one for each major server process and a few tools.
  - The header of each file contains its original filename and a description of what function it performs in the repack.

- **start_deploy.bat**

  - Included only for reference, but makes deploying and testing new builds of each type a lot easier. Edit the paths to match your system.
  - Automates testing of different Visual Studio builds on my test server.
  - Supports Debug, RelWithDebInfo, and Release configurations.
  - Supports "Auto Start" after deploying. Great for testing build changes quickly.

- **HeidiSQL 9.5 x64 Portable**

  - An excellent free database management alternative to NaviCat.
  - Launched via a dedicated launch button ![Gold Coins](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/icons_stygiancorecontrols.jpg) in the SCC launcher or via batch in the repack root folder.
  
## 2) CONFIGURE EACH GAME CLIENT

Set your realmlist.wtf file to point to the server. For local play it should work with the default of 127.0.0.1.

- Locate and edit the WoW client file: **realmlist.wtf**
  - Ex: \<PATH TO WOW>\Data\enUS\realmlist.wtf
  - **SET REALMLIST 127.0.0.1**

> **NOTE: If you are using the StygianCore Client Pack, a batch tool called SCUpdateIP.bat is included that automates this procedure and gives you flexibility for using one client with serveral different servers.**

If you are putting the server on a different system, you will need to use that system's address.
In addition, you will need to edit the auth database _realmlist_ table to point to that system. In the example, the
server is listening for remote connections on 192.168.1.20 with a local address of 127.0.0.1. Here's a sample query to change the IP.

    INSERT INTO `stygian_auth`.`realmlist` (`id`, `name`, `address`, `localAddress`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`) VALUES ('1', 'StygianCore', '192.168.1.20', '127.0.0.1', '255.255.255.0', '8085', '0', '0', '2', '0', '0', '12340');

## 3) UPDATE YOUR WOW CLIENT INSTALLATION

**Copy the client patch files from the repack's _ClientPatch_ folder to your client's Data folder. These files are required to support custom items, objects, and other content in the repack.**

> **_NOTE: Be sure to delete your client's cache folder after copying the new patches!_**

- ### PATCH-Z.MPQ (_REQUIRED_)

This is the client support patch required to display and enable custom content in the repack.

- Required to support custom items and content in the StygianCore repack.
- Required to enable access to forbidden zones.
- Required to enable custom textures on some custom NPCs.

**_If this patch is NOT installed:_**
  
- Custom items will appear as a **?** icon in your character's backpack.
- Custom NPCs will not display custom weapons and armor.
- Custom NPCs will not display the correct textures.
- The game client will crash when attempting to access forbidden zones.

> To complete the StygianCore experience, I suggest downloading my [World of Warcraft 3.3.5a Client Upgrade](https://rebrand.ly/stygiancore335clients) which includes [HD Player and Creature Models](https://github.com/StygianTheBest/StygianCore/blob/master/Client/Data/StygianCore%20Client%20Patch%20Info.txt), [Random Animated Login Screens](https://rebrand.ly/randomloginscreens), Custom Add-Ons and more.

## REPACK UPDATES

**[This repo](https://github.com/StygianTheBest/StygianCore) is the home of all future updates to any of the content in this repack. The folder structure is a mirror of the file structure within the repack archive, so you can easily download and copy file updates into your repack or restoration archive.**

    - Client
      - Interface
        - Custom Addons
      - Data
        - Required Game Patches
    - Server
      - Server
        - Apache
          - httpdocs
            - Account Registgration Portal
            - Online Documentation
        - Core
          - lua_scripts
            - LUA scripts for Eluna
    - Support
      - Docs
        - Server Documentation
      - Icons
        - For shortcuts and the like
    - Tools
      - Patch
        - Instructions on how to apply StygianCore repack updates
      - Work
        - restore_stygiancore
          - The master restoration archive.
          - All game SQL, conf, and other updates are stored here.
          - This is where the magic happens.. The Codex of Ultmate Wisdom!
  
## OTHER INFORMATION

### COMPILING

You will need a few things to compile the source of this repack. The source can be found in the [GitHub Repo](https://github.com/StygianTheBest/StygianCore/tree/master/Source). Below are the specific tools and versions I used to compile the repack on my virtual machine. You may be able to use updated versions.

- [Visual Studio 2017 Community](https://visualstudio.microsoft.com/vs/community/)
- [CMAKE 3.9.0](https://github.com/Kitware/CMake/releases/tag/v3.9.0)
- [OpenSSL 1.0.2l](https://www.openssl.org/source/old/1.0.2/openssl-1.0.2l.tar.gz) 
- [MySQL v5.6.42](https://dev.mysql.com/downloads/mysql/5.6.html#downloads)

### TRINITYCORE DATABASES

The MySQL server included in this repack also contains the TrinityCore databases from 2019-01-27. These are used for a TrinityCore Sandbox repack I've created for adding custom content with [Rochet's GOMove and DressNPC](http://rochet2.github.io/downloads/) tools. It shares the database server with StygianCore to make imports from core to core a breeze. You can find more info on that project at [my website](http://stygianthebest.github.io).

### DEVBOX

- Apple i7 Mac-Mini (MID-2012), SSD, 16GB RAM, Thunderbolt
- Windows 10 Enterprise
  - VMWare Workstation (Windows 7 Professional)
  - Microsoft Visual Studio Community 2017
  - Visual Studio Code
  - Navicat/HeidiSQL
  - SmartGIT
  - Notepad++

### CORE MODIFICATIONS

#### All mods are labled with _SCMOD_ in the source

- Beastmaster NPC
  - Pet.cpp
  - npc_beastmaster

- TimeShift
  - Player.cpp
  - World.h
  - World.cpp
  - mod_customserver

- Dungeon Checkpoints
  - Player.cpp
  - mod_customserver

- Eluna
  - _Extensive_ core edits
  - mod-eluna-lua-engine

- Multi-Vendor
  - cs_npc.cpp
  - GossipDefs.h
  - Itemhandler.cpp
  - ObjectMgr.cpp
  - Player.cpp
  - WorldSession.h
  
### ADDITIONAL TOOLS USED

- Azure DevOps (TFS)
- Cleanmem
- Docker
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

### Hellscream's Chosen Guild of Stonemaul

- Bras
- Gatog
- Girlys
- Jadenelle
- Katojune
- Mobbius
- Pamooya
- Ragathar
- Retdream
- Shootameat
- Spaget @ Dead End Friends
- Zagmund

## LICENSE

All code and scripts are released under [GNU AGPL v3](https://stygianthebest.github.io/license/).

World of Warcraft© and Blizzard Entertainment© are all trademarks or registered trademarks of Blizzard Entertainment© in the United States and/or other countries. These [terms](http://us.blizzard.com/en-us/company/about/legal-faq.html) and all related materials, logos, and images are [copyright](http://us.blizzard.com/en-us/company/about/copyrightnotices.html) Blizzard Entertainment©. This site and content is in no way associated with or endorsed by Blizzard Entertainment©.

## CHANGELOG

## :wrench: 2019.03.05

#### _Download_

- [StygianCore Patch](https://github.com/StygianTheBest/StygianCore/tree/master/Tools/Patch)

#### _Module_

- Fixed an issue with Custom Login Abilities being unlearned on logoff
- All abilities are now configurable in the Custom Login module's config file
- Learning Town Portals is now a configurable option

## :wrench: 2019.03.01

#### _Core_

- Multi-Vendor Support Added

#### _Account/Character_

- GameMaster Account
  - Default characters updated and now fully armored
  - PDUMP files have been updated

#### _Module_

- Most modules have been updated and improved
- New Module: Trollop NPC
- NPC Gambler
  - Gambler can now gamble copper, silver, or gold
  - Coin type can be configured in the module's config

#### _NPC_

- Many NPCs now speak AI phrases and emotes
- Multi-Vendor: Gem Vendor placed in Booty Bay
- Multi-Vendor: Glyph Vendor placed in Booty Bay
- Global Trainer: Placed in Silithus Camp
- Loremaster: New locations added
- Custom Vendor: Placed many in Booty Bay and Ratchet
- Koiter's ghost now watches over The Barrens
- Portal Master: Teleport destinations added
- Several critters have been added
- Captain Lou is now ferrying near the Silithus Camp
- A few Trollops have been sighted in dark places

#### _Item/Object_

- Pocket Portal
  - Model Updated to Spinning Ulduar Globe
  - Teleport destination added

#### _World_

- Silithus Camp: Added NPCS, Objects, and Critters
- Zone: Added Emerald Dream Canyon
- Zone: Added Programmer Isle
- Zone: Added Designer Isle

## :wrench: 2019.01.29

- Core Patch Update Released

## :wrench: 2018.12.21

- Initial Release

[:top:](https://github.com/StygianTheBest/StygianCore#news)
