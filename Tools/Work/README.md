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