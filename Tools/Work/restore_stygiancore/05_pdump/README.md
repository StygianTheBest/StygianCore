
### <p align="center">![StygianCore](https://stygianthebest.github.io/assets/img/logo/world_of_stygiancore.png "StygianCore")</p>

#### <p align="center"> A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)</p>

# HOW TO IMPORT/EXPORT PLAYER ACCOUNTS

There are two ways to import and export character data.

1) You can export the tables from the auth and character databases.

   - Brute force capture all data by exporting databases.
   - Character only export requires a SQL script targeting all needed tables.

2) You can use the .pdump command from the Worldserver console. The .pdump command captures every detail of a character export as a SQL. This SQL file is not recommended for direct import as-is, but can be used as a base.

   - .pdump write <$filename> <$playerNameOrGUID>
   - .pdump load <$filename> <$account> <$newname> <$newguid>

## LICENSE

All code and scripts are released under [GNU AGPL v3](https://stygianthebest.github.io/license/).

World of Warcraft© and Blizzard Entertainment© are all trademarks or registered trademarks of Blizzard Entertainment© in the United States and/or other countries. These [terms](http://us.blizzard.com/en-us/company/about/legal-faq.html) and all related materials, logos, and images are [copyright](http://us.blizzard.com/en-us/company/about/copyrightnotices.html) Blizzard Entertainment©. This site and content is in no way associated with or endorsed by Blizzard Entertainment©.