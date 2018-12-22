# StygianCore | GM Quick Start Guide

##### A repack for AzerothCore by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)

## CONTENTS

- Accounts
- GM Commands
- Modules
- Restoration and Backup
- Server

## ACCOUNTS

You can create or edit accounts via the worldserver console or the Account Registration Portal. The portal is useful if you're hosting the game and want users to register on their own. Here are a few commands to get you started:

- **Create Account**
  - account create (name) (password)**
- **Make Account A GM**
  - account set gmlevel (name) 3 -1**

## GM COMMANDS

There are many commands for manipulating the game world. You can view more in the Index below or the entire list in the [GM Commands](GM_Commands_335a.html) document. The most useful for getting started are:

### GameMaster (GM)

- **GM Mode**
(_Peforming certain tasks in GM mode can have undesireable results!_)

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
  - .mod aspeed (0-10)

### RESURRECT

- **Revive Player**
  - .revive (self/target)
- **Kill/Revive Player/MOB**
  - .die (self/target)
  - .respawn (target)

### TELEPORT

- **Teleport**
  - .tele (location)
    - .tele orgrimmar
  - .tele (name) (location)
    - .tele name Ghostcrawler Jail
- **Save the current location to the database.**
  - .tele add (location)
- **Teleports you to the player's location.**
  - .app (player)
- **Teleports the player to your location.**
  - .sum (player)

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
  
### SKILLS

- **Lookup Item, Skill, or Object**
  - .lookup (item, skill, gob) (id, profession, id)
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
- **Remove item from character**
  - DELETE FROM character_inventory where item IN(ITEMID1, ITEMID2, ITEMID3, ITEMID4)

### GUILD

- **Create Guild**
  - .guild create (Name) ("Guild Name")
    - .guild create Sauron "One Ring"

## MODULES

Modules extend the functionality of the server. These modules have many different configuration parameters you can tweak and tune by editing their config files.

- Module config files are located in the .\Server\Core\ folder.
- Module config files have the extension .conf.dist.
  - mod_moneyforkills.conf.dist
- Most modules have an "Announce" feature which indicates to the user on login that the module is running. This can be turned off by editing the module's config file and placing a '0' for the value instead of '1'.
  - EnableModuleAnnounce = 0

## RESTORATION AND BACKUP

With the StygianCore Controls launcher running, click the small sword icon in the bottom right corner of the window. This will open the StygianCoreTools batch application. Use this tool to backup, restore, and archive your server's world and character data.

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

## SERVER

- **StygianCore Controls**
  - Use the StygianCore Controls launcher app to start, stop, and restart the game server processes. 
    - Processes will not automatically restart unless "Restart" is checked for the process in the launcher app.
- **Worldserver Console Commands**
  - Shutdown
    - .server shutdown (time)
    - .server idleshutdown
  - Restart
    - .server restart
    - .server idlerestart