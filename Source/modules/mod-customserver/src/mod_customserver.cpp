/*

# Custom Server #

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). An AzerothCore 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description ###
------------------------------------------------------------------------------------------------------------------
- Announces Core Edits as modules.
- Contaisn functions and smaller scripts that don't need their own module.
- Config: Enable/Disable sub-scripts


### Data ###
------------------------------------------------------------------------------------------------------------------
- Type: Server/Player
- Script: CustomServer
- Config: Yes
- SQL: No


### Version ###
------------------------------------------------------------------------------------------------------------------
- v2019.02.18 - Update Core Scripts
- v2017.09.03 - Release


### CREDITS
------------------------------------------------------------------------------------------------------------------
![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

##### This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). An AzerothCore 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))

#### Additional Credits

- [Blizzard Entertainment](http://blizzard.com)
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

### LICENSE
------------------------------------------------------------------------------------------------------------------
This code and content is released under the [GNU AGPL v3](https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3).

*/

#include <cstring>
#include "Config.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "DungeonCheckpoints.h"

bool CustomServerAnnounceModule;
bool FireworkLevels;
bool DungeonCheckpoints;

class CustomServerConfig : public WorldScript
{
public:
    CustomServerConfig() : WorldScript("CustomServerConfig") { }

    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/mod_customserver.conf";
#ifdef WIN32
            cfg_file = "mod_customserver.conf";
#endif
            std::string cfg_def_file = cfg_file + ".dist";
            sConfigMgr->LoadMore(cfg_def_file.c_str());
            sConfigMgr->LoadMore(cfg_file.c_str());

            // Load Configuration Settings
            SetInitialWorldSettings();
        }
    }

    // Load Configuration Settings
    void SetInitialWorldSettings()
    {
        CustomServerAnnounceModule = sConfigMgr->GetBoolDefault("CustomServer.Announce", true);
        FireworkLevels = sConfigMgr->GetBoolDefault("FireworkLevels", true);
        DungeonCheckpoints = sConfigMgr->GetBoolDefault("DungeonCheckpoints", true);
    }
};

class CustomServerAnnounce : public PlayerScript
{

public:

    CustomServerAnnounce() : PlayerScript("CustomServerAnnounce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (CustomServerAnnounceModule)
        {
            // Announce the module and any core mods or other functions it currently supports
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00CustomServer |rmodule.");
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00DungeonCheckpoints |rmodule.");
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00Eluna |rmodule.");
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00Multi-Vendor |rmodule.");
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00TimeShift |rmodule.");
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00TransmogrifierNPC |rmodule.");

            // Unused mod references

            // ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00ItemObject Gossip |rmodule.");
            // ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00FireworksOnLevelUp |rmodule.");
            // ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00BetterPetHandling |rmodule.");
        }

    }
};

bool Dynamic_Resurrection::IsInDungeonOrRaid(Player* player)
{
    if (DungeonCheckpoints)
    {
        if (sMapStore.LookupEntry(player->GetMapId())->Instanceable())
        {
            return true; // boolean need to return to a value
        }
        return false;
    }
    else
    {
        return false;
    }
}

bool Dynamic_Resurrection::CheckForSpawnPoint(Player* player)
{
    if (DungeonCheckpoints)
    {
        // Find Nearest Creature And Teleport.
        if (Creature* creature = player->FindNearestCreature(C_Resurrection_ENTRY, C_DISTANCE_CHECK_RANGE))
        {
            return true;
        }
        return false;
    }
    else
    {
        return false;
    }
}

class Dynamic_Resurrections : public PlayerScript
{
public:
    Dynamic_Resurrections() : PlayerScript("Dynamic_Resurrections") {}

    void OnCreatureKill(Player* player, Creature* boss) override
    {
        if (DungeonCheckpoints)
        {
            if (sDynRes->IsInDungeonOrRaid(player) && (boss->isWorldBoss() || boss->IsDungeonBoss()))
            {
                player->SummonCreature(C_Resurrection_ENTRY, boss->GetPositionX(), boss->GetPositionY(), boss->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, C_SPAWN_TIMER_TWO_HOURS);
            }
        }
    }
};

class CustomServer : public PlayerScript
{

public:

    CustomServer() : PlayerScript("CustomServer") { }

    // Login
    void OnLogin(Player * player)
    {
        // Alter player run speed
        // player->SetSpeed(MOVE_RUN, 4.0, 1);
    }

    // Level Change
    void OnLevelChanged(Player * player, uint8 oldLevel)
    {
        // Shoot fireworks into the air when a player levels
        if (FireworkLevels)
        {
            if (oldLevel == 4)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 9)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 14)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 19)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 29)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 39)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 49)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 59)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 69)
                player->CastSpell(player, 11541, true);

            if (oldLevel == 79)
                player->CastSpell(player, 11541, true);
        }
    }
};

void AddCustomServerScripts()
{
    new CustomServerConfig();
    new CustomServerAnnounce();
    new Dynamic_Resurrections();
    new CustomServer();
}
