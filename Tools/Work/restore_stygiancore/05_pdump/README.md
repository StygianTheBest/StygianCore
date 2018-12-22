# HOW TO IMPORT/EXPORT PLAYER ACCOUNTS

There are two ways to import and export character data.
 
1) You can export the tables from the auth and character tables.
   - Brute force capture all data by exporting databases.
   - Character only export requires a SQL script targeting all needed tables.

2) You can use the .pdump command from the Worldserver console. The .pdump command 
captures every detail of a character export as a SQL. This SQL file is not recommended
for direct import, but can be used as a base.
   - .pdump write <$filename> <$playerNameOrGUID>
   - .pdump load <$filename> <$account> <$newname> <$newguid>