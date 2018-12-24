# StygianCore Master Restoration Archives

## DO NOT DELETE THIS FOLDER OR ITS CONTENTS

This folder contains the master restoration folders and archives. These folders serve as the master repository for the files included in the restoration archives. All edits to game content should be made here so they are bundled and deployed during a restore event. The various batch files included in this repack will not run if files are missing.

## Folder Contents

### Folder: restore_stygiancore

- Required to restore the StygianCore repack to defaults.
- Contains the modified StygianCore content. This is the main working folder for the StygianCore restoration archive.
- All edits to data files used by StygianCore are made here and then deployed via the restore process.

### Folder: restore_azerothcore

- Required to convert to AzerothCore Sandbox Mode.
- Contains the vanilla AzerothCore (master) branch content.

### Batch File: build_restore_stygiancore.bat

- This file builds a new StygianCore restoration archive from the restore_stygiancore folder contents.
- After building, the restore_stygiancore.zip is copied to the Tools folder for use with the restoration process.

### Batch File: build_restore_azerothcore.bat

- This file creates a new AzerothCore restoration archive from the restore_azerothcore folder contents.
- After building, the restore_azerothcore.zip is copied to the Tools folder for use with the restoration process.

## Updating the restoration archives

**There are two restoration archives and a folder for each:**

- StygianCore: restore_stygiancore
- AzerothCore: restore_azerothcore

These two folders hold all of the game data and should be used for making edits to the game you'd like to see added when performing a future restore.

## Workflow for updating the restoration archive with new data

### 1) Make changes or add new files to the following folder
  
- Tools\Work\restore_stygiancore\03_custom\
  - Maybe you change the model of the Portal Master NPC
  - Maybe you adjust the price on an item
  - Maybe you add a new .SQL file with your custom changes

### 2) Load StygianCoreTools.bat

- Launch it from the StygianCore Controls
- Or.. run it using the batch file in the root folder of the repack

### 3) Choose Option [5] to rebuild the restoration archive and reset the server

_This process will:_
  
- Create a new restoration archive from the folder
- The new archive will be used to restore the server
- The server is now restored with the new changes

Alternatively, you can use the included build_restorestygiancore.bat file to rebuild the restoration archive without importing afterwards.

## Testing the updates

- Launch the World (worldserver.exe) and inpsect the startup for any errors that may have bene caused by edits to files in the restoration archive
- Edit as needed until the server loads without additional errors

## Sandbox Restore

### Choose Option [6] to enter AzerothCore Sandbox Mode

Use the exact same process described above for updating and deploying this default AzerothCore build. I suggest leaving this build alone unless you are updating it to a later version for testing and development.