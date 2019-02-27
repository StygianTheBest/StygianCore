### <p align="center">![StygianCore](https://stygianthebest.github.io/assets/img/logo/world_of_stygiancore.png "StygianCore")</p>

#### <p align="center"> A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)</p>

# StygianCore Master Restoration Archive

## _!! DO NOT DELETE THIS FOLDER OR ITS CONTENTS !!_

This folder contains the master restoration folders and archives. These folders serve as the master repository for the files included in the restoration archives. All edits to game content should be made here so they are bundled and deployed during a restore event. The various batch files included in this repack will not run if files are missing.

## Folder Contents

### Folder: restore_stygiancore

This folder holds all of the default, update, and custom game data and configuration files.

> **This folder is required to run the restore process.**

- Folder Structure:
  - **01_default**
    - TrinityCore/SunwellCore base files that make up the original WOTLK content.
    - _DO NOT EDIT THESE FILES!_
  - **02_update**
    - AzerothCore bugfixes and updates.
    - _DO NOT EDIT THESE FILES!_
  - **03_custom**
    - StygianCore bugfixes, updates, and custom content.
    - **All content edits and updates are made here.**
  - **04_conf**
    - Server and Module configuration files.
    - **All configuration updates are made here.**
  - **05_pdump**
    - PDump command reference and sample characters.
    - See the README.MD in the folder for more information.

### Batch File: build_restore_stygiancore.bat

- This file builds a new StygianCore restoration archive from the restore_stygiancore folder contents.

## Workflow for updating the restoration archive with new data

### 1) Make changes or add new files to the following folder

#### Task

- Maybe you change the model of the Beastmaster NPC
- Maybe you need to adjust the price of an item
- Maybe you add a new .SQL file with your custom changes

#### Example Workflow

- Task: _Change the name of the Beastmaster NPC_
  - Locate the file to edit:
    - restore_stygiancore\03_custom\db_world\npc_stygiancore.sql
  - Locate the Beastmaster NPC ID in the NPC Index (ID: 601026)
  - Search for the ID and edit the NPC name
  - Save the file

### 2) Load StygianCoreTools.bat

![Controls](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/app_stygiancorecontrols.jpg)

- Launch the tools by clicking the sword icon in the bottom right corner of the app.
- Or.. run it using the batch file in the root folder of the repack.

### 3) Choose Option [5] to rebuild the restoration archive and reset the server

![Controls](https://stygianthebest.github.io/assets/img/projects/stygiancore_controls/restore_command.jpg)

_This process will:_

- Create a new restoration archive from the _restore_stygiancore_ folder contents which now includes your changes to the Beastmaster NPC which will then be used to restore the server.
- The same process would be used to update the configuration files for the server or modules.
- This method ensures that your changes are preserved and restored when performing a reset.
- You can rename an existing restoration archive to make a backup prior to making changes or performing a reset. Just right click, copy, and paste to make restore_stygiancore - Copy.zip until you've confirmed everything works as intended.

> Alternatively, you can run the included build_restorestygiancore.bat file manually to rebuild the restoration archive without performing a restore.

## Testing the updates

- Launch the World via the StygianCore Controls app, or manually with start_world.bat, and inspect the startup for any errors, indicated in red in the console, that may have been caused by recent edits.
- Edit and rebuild as needed until the server loads without additional errors.

## LICENSE

All code and scripts are released under [GNU AGPL v3](https://stygianthebest.github.io/license/).

World of Warcraft© and Blizzard Entertainment© are all trademarks or registered trademarks of Blizzard Entertainment© in the United States and/or other countries. These [terms](http://us.blizzard.com/en-us/company/about/legal-faq.html) and all related materials, logos, and images are [copyright](http://us.blizzard.com/en-us/company/about/copyrightnotices.html) Blizzard Entertainment©. This site and content is in no way associated with or endorsed by Blizzard Entertainment©.