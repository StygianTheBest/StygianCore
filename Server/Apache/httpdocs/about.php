<?php
/*

StygianCore - stygianthebest.github.io

*/

require_once("config.php");

?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
        <link rel="stylesheet" type="text/css" href="site.css" />
        <meta name="description" content="<?php echo META_DESCRIPTION; ?>" />
        <meta name="keywords" content="<?php echo META_KEYWORDS; ?>" />
        <meta name="robots" content="<?php echo META_ROBOTS; ?>" />
        <meta name="author" content="StygianTheBest - stygianthebest.github.io" />
        <title><?php echo SITE_TITLE; ?></title>
    </head>
    <body>
        <table class="reg">
            <tr>
                <td>
                    <a href="<?php echo $_SERVER["PHP_SELF"]; ?>"><img src="img/logo.png" alt="<?php echo SITE_TITLE; ?>" /></a>
					<div class="thrallisyourdaddy">
						Welcome to the StygianCore repack powered by AzerothCore.
						<br />
						<br />
						<div class="yallgotcleaned">
							<span class="seradane">Solid base</span>
							<br /><br />
							AzerothCore has a strong and solid base, coming from years of development: it is based on MaNGOS, TrinityCore and SunwellCore.
							We're improving this reliability offering a project that follows specific versioning rules, allowing you to develop the right way.
							<br /><br />
							<span class="seradane">Playable</span>
							<br /><br />
							Our main goal is to provide a fully working and playable server application. We will focus our stable revisions on final user experiences, instead of following strict development patterns like our predecessors. Of course we will work to improve the code in any new versions that are in the development stage.
							<br /><br />
							<span class="seradane">Open Source</span>
							<br /><br />
							AzerothCore modules are released under GNU AGPL 3.0 and GNU GPL 2.0, both those licenses are totally free and open source. We believe in free software and open collaboration.
							<br /><br />
							<span class="seradane">Tested, reliable, Updated</span>
							<br /><br />
							SunwellCore, the brood mother of AzerothCore, ran with thousands of players for years. The goal of AzerothCore is to keep this game application updated, continuing its development.
							<br /><br />
							<span class="seradane">Community-Driven</span>
							<br /><br />
							The main strength of AzerothCore is its community. Users can help us by improving our codebase or simply by submitting any bug report. If you want to contribute, we'd love it!
							<br /><br />
							<span class="seradane">Modular</span>
							<br /><br />
							We try to make our software as modular as possible, because modular software is much easier to be extended.
						</div>
					</div>
				</td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <div class="forthehorde">
                        <a href="index.php">Login</a> | 
						<a target="_blank" href="sunwell.pl/">Sunwell</a> | 
                        <a target="_blank" href="gamemaster/GM_Commands_335a.html">Commands</a> | 
						<a target="_blank" href="gamemaster/stygiancore_npc_id_list.txt">StygianCore NPC/Items</a> | 
						<a target="_blank" href="gamemaster/mount_id_list.txt">Mounts</a>
						<br />
						<a target="_blank" href="gamemaster/teleport_locations.txt">Teleports</a> | 
						<a target="_blank" href="gamemaster/lua_colors.txt">LUA Colors</a> | 
						<a target="_blank" href="gamemaster/race_class_codes.txt">Race/Class</a> | 
						<a target="_blank" href="gamemaster/unused_item_id_list.txt">Unused Item ID</a>
						<br />
						<a target="_blank" href="gamemaster/dump_items_353a.html">Item Dump</a> |                  
						<a target="_blank" href="gamemaster/dump_quests_353a.html">Quest Dump</a> | 
						<a target="_blank" href="gamemaster/dump_spells_353a.html">Spell Dump</a> |
                        <br />
                        <a target="_blank" href="gamemaster/REF_BAH.PDF">Of Blood and Honor</a> |                      
						<a target="_blank" href="gamemaster/REF_LUA.PDF">LUA Reference</a> |
						<a target="_blank" href="gamemaster/REF_ADDON.PDF">AddOn Reference</a>
						<br /><br />
						<img src="img\azerothcore.png">
						<br />
						Powered by <a target="_blank" href="http://www.azerothcore.org/">AzerothCore</a>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>