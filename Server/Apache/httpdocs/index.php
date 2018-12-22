<?php
/*
###################################################################################################
#     ____    __                                         ____                           
#    /\  _`\ /\ \__                  __                 /\  _`\                         
#    \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\ \ \/\_\    ___   _ __    __   
#     \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \/_/_  / __`\/\`'__\/'__`\ 
#       /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \L\ \/\ \L\ \ \ \//\  __/ 
#       \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \____/\ \____/\ \_\\ \____\
#        \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/\/___/  \/___/  \/_/ \/____/
#                         /\___/ /\____/                                                
#                         \/__/  \_/__/          http://stygianthebest.github.io
###################################################################################################
*/

require_once("config.php");
require_once("SOAPRegistration.php");

// Initialize session and variables.
$messages = Array();
$showForm = true;

// If form was submitted, carry out the registration.
if(!empty($_POST["submit"]))
{
    $reg = new SOAPRegistration();
    $messages = $reg -> getMessages();
    $showForm = $reg -> showForm();
}

$messagesDisplay = '';
foreach($messages as $msg)
{
    $messagesDisplay .= '<div class="errors">'.$msg.'</div>';
}

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
					Welcome to the StygianCore World of Warcraft v3.3.5a Repack
					</div>
				</td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <?php
                    echo $messagesDisplay;
                    
                    if ($showForm)
                    { ?>
                    <form action="" method="post" name="reg">
                        <table class="form">
                            <tr>
                                <td align="right">
                                    Account Name:
                                </td>
                                <td align="left">
                                    <input name="accountname" type="text" maxlength="32" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Password:
                                </td>
                                <td align="left">
                                    <input name="password" type="password" maxlength="16" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Confirm Password:
                                </td>
                                <td align="left">
                                    <input name="password2" type="password" maxlength="16" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    E-mail Address:
                                </td>
                                <td align="left">
                                    <input name="email" type="text" maxlength="254" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Expansion:
                                </td>
                                <td align="left">
                                    <select name="expansion">
                                        <option selected value="2">Wrath Of The Lich King 3.3.5a</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" class="sbm" value="Register" name='submit' />
                                </td>
                            </tr>
                        </table>
                    </form>
                    <?php
                    }
                    ?>
                    <br />
                    <div class="forthehorde">
                        .: <span class="realmlist">Be sure to SET REALMLIST TO <?php echo REALMLIST; ?></span> :.<br />
						.: <span class="realmlist">The server must be online to create accounts!</span> :.<br />
                        <br />
                        <a href="about.php">About</a> |
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
						<span style="color:#A6DC94;">Have a peek inside the restoration archive's SQL files for more<br />
						specific information regarding creatures, quests, and items.</span>
						<br /><br /><br /><br /><br />
						<img src="img\azerothcore.png">
						<br />
						Powered by <a target="_blank" href="http://www.azerothcore.org/">AzerothCore</a>	
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>