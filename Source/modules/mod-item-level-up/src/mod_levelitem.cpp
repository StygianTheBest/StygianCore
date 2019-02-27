/*

# Item Level Up

_This module was adapted for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description
------------------------------------------------------------------------------------------------------------------
- Use: Instantly levels the player to the next level.
- Check the mod_itemlevelup.conf for more options.

### Version
------------------------------------------------------------------------------------------------------------------
- 2018.12.10 - Rebuilt and repacked for use with StygianCore

### CREDITS
------------------------------------------------------------------------------------------------------------------
![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

##### This module was adapted for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))

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

#include "Configuration/Config.h"
#include "Player.h"
#include "Creature.h"
#include "AccountMgr.h"
#include "ScriptMgr.h"
#include "Define.h"
#include "GossipDef.h"

uint32 Increase_Level;
uint32 MaxItemLevel = 80;
bool LevelItemEnable = true;
bool LevelItemAnnounce = true;

// Configuration
class mod_levelitem_Conf : public WorldScript
{
public:
    mod_levelitem_Conf() : WorldScript("mod_levelitem_Conf") { }

    // Initialize Configuration
    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/mod_levelitem.conf";

#ifdef WIN32
            cfg_file = "mod_levelitem.conf";
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
        LevelItemEnable = sConfigMgr->GetBoolDefault("LevelItem.Enable", true);
        LevelItemAnnounce = sConfigMgr->GetBoolDefault("LevelItem.Announce", true);
        MaxItemLevel = sConfigMgr->GetIntDefault("LevelItem.MaxItemLevel", 80);
    }
};

// Announce
class mod_levelitem_Announce : public PlayerScript
{

public:
    mod_levelitem_Announce() : PlayerScript("mod_levelitem_Announce") {}

    void OnLogin(Player* player)
    {
        if (LevelItemEnable)
        {
            // Announce Module
            if (LevelItemAnnounce)
            {
                ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00LevelItem |rmodule");
            }
        }
    }
};

class LevelItem : public ItemScript
{
public:
    LevelItem() : ItemScript("LevelItem") { }

    bool OnUse(Player* p, Item* i, const SpellCastTargets &) override
    {
        if (!LevelItemEnable)
            return false;

        if (p->IsInCombat() || p->IsInFlight() || p->GetMap()->IsBattlegroundOrArena())
        {
            ChatHandler(p->GetSession()).PSendSysMessage("You can't use that right now!");
            return false;
        }

        if (p->getLevel() == MaxItemLevel)
        {
            ChatHandler(p->GetSession()).PSendSysMessage("You're already at MAX level!");
            return false;
        }

        uint8 newLevel = p->getLevel() + 1;
        p->GiveLevel(newLevel);
        p->SetUInt32Value(PLAYER_XP, 0);
        p->DestroyItemCount(i->GetEntry(), 1, true);
        ChatHandler(p->GetSession()).PSendSysMessage("You have used one Level-Up Token!");

        return true;
    }
};



void AddLevelItemScripts()
{
    new mod_levelitem_Conf();
    new mod_levelitem_Announce();
    new LevelItem();
}
