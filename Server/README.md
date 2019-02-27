### <p align="center">![StygianCore](https://stygianthebest.github.io/assets/img/logo/world_of_stygiancore.png "StygianCore")</p>

#### <p align="center"> A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://github.com/StygianTheBest) | [Website](http://stygianthebest.github.io)</p>

# Server

This folder holds the server components required to run the game.

## Apache

  This is the Apache web server and contains the _httpdocs_ folder for updates to the Account Registration Portal and online support documentation.

## Core

This is the main game server folder. The auth, world, and module configuration files are located here. ELUNA scripts are in the lua_scripts folder.

> Be sure to look at the config files for the world server and modules. You can modify these files to configure how the server and modules work and what features are available for each.

## MySQL

MySQL is the database engine that holds all of the game's data. 

> When MySQL is not running, uou can zip up the Data folder to make a quick backup of all databases at once.

## PHP

PHP is used to run the Account Registration portal and to communicate with the World Server.

## TEMP

This folder is used by PHP.

## LICENSE

All code and scripts are released under [GNU AGPL v3](https://stygianthebest.github.io/license/).

World of Warcraft© and Blizzard Entertainment© are all trademarks or registered trademarks of Blizzard Entertainment© in the United States and/or other countries. These [terms](http://us.blizzard.com/en-us/company/about/legal-faq.html) and all related materials, logos, and images are [copyright](http://us.blizzard.com/en-us/company/about/copyrightnotices.html) Blizzard Entertainment©. This site and content is in no way associated with or endorsed by Blizzard Entertainment©.