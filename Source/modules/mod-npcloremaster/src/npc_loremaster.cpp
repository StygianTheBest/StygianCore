/*

# Loremaster NPC

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

## Description
------------------------------------------------------------------------------------------------------------------
This places a Loremaster NPC in the game world at various locations who recants the lore of the old world and
brings back the lost memories of so many that sacrificed their lives for this ravaged land we all call home.

Many of you may know of the website [Warcraft Less Traveled](http://warcraftlesstraveled.com) which was
a Podcast site where the host, Skolnick, discussed various areas in the game, mostly pre-Cata, that
were considered hidden gems. As a Vanilla player and pre-Cata Loremaster/Seeker myself, I knew of
every place he discussed and quite a few he didn't. My plan is to add all of these places into this
module for players to explore and learn about.

As of the release of this module, I have only had time to create three of these NPCs, and hope that the community
can contribute. I have written the module so adding new Loremaster NPCs is done purely in the database and will
chain to one another automatically if done correctly.

## Data
------------------------------------------------------------------------------------------------------------------
- Type: NPC
- Script: Loremaster_NPC
- Config: Yes
- SQL: Yes
  - NPC ID: 601075-601XXX

## Version
------------------------------------------------------------------------------------------------------------------
- v2019.02.27 - Add Phrase/Emote/Options
- v2019.02.13 - Update AI
- v2019.01.14 - Release


### CREDITS
------------------------------------------------------------------------------------------------------------------
![Styx](https://stygianthebest.github.io/assets/img/avatar/avatar-128.jpg "Styx")
![StygianCore](https://stygianthebest.github.io/assets/img/projects/stygiancore/StygianCore.png "StygianCore")

##### This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))

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

#include "Config.h"
#include "ScriptPCH.h"
#include "ScriptedGossip.h"

// Locals
uint32 ThisLoremaster;
uint32 NextLoremaster;

// DB
uint32 id;
float position_x;
float position_y;
float position_z;
float orientation;
uint32 mapID;
string destination;

// Config
bool LoremasterAnnounceModule = true;
string LoremasterName;
uint32 FirstLoremaster;
uint32 LoremasterEmoteSpell;
uint32 LoremasterEmoteCommand;
uint32 LoremasterNumPhrases;
uint32 LoremasterMessageTimer;

class LoremasterConfig : public WorldScript
{
public:
    LoremasterConfig() : WorldScript("LoremasterConfig") { }

    // Read Configuration File
    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/npc_loremaster.conf";
#ifdef WIN32
            cfg_file = "npc_loremaster.conf";
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
        // Get the bet amounts from config
        FirstLoremaster = sConfigMgr->GetIntDefault("FirstLoremasterGUID", 601075);
        LoremasterAnnounceModule = sConfigMgr->GetBoolDefault("Loremaster.Announce", true);
        LoremasterName = sConfigMgr->GetStringDefault("Loremaster.Name", "Crom");
        LoremasterNumPhrases = sConfigMgr->GetIntDefault("Loremaster.NumPhrases", 5);
        LoremasterMessageTimer = sConfigMgr->GetIntDefault("Loremaster.MessageTimer", 60000);
        LoremasterEmoteSpell = sConfigMgr->GetIntDefault("Loremaster.EmoteSpell", 0);
        LoremasterEmoteCommand = sConfigMgr->GetIntDefault("Loremaster.EmoteCommand", 3);

        // Enforce Min/Max Time
        if (LoremasterMessageTimer != 0)
        {
            if (LoremasterMessageTimer < 60000 || LoremasterMessageTimer > 300000)
            {
                LoremasterMessageTimer = 60000;
            }
        }
    }
};

class LoremasterAnnounce : public PlayerScript
{

public:
    LoremasterAnnounce() : PlayerScript("LoremasterAnnounce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (LoremasterAnnounceModule)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00LoremasterNPC |rmodule.");
        }
    }
};

class Loremaster_NPC : public CreatureScript
{

public:

    Loremaster_NPC() : CreatureScript("Loremaster_NPC") { }

    // Pick Phrase
    static string PickPhrase()
    {
        // Choose and speak a random phrase to the player
        // Phrases are stored in the config file
        std::string phrase = "";
        uint32 PhraseNum = urand(1, LoremasterNumPhrases); // How many phrases does the NPC speak? 
        phrase = "LM.P" + std::to_string(PhraseNum);

        // Sanitize
        if (phrase == "")
        {
            phrase = "ERROR! NPC Emote Text Not Found! Check the npc_loremaster.conf!";
        }

        std::string randMsg = sConfigMgr->GetStringDefault(phrase.c_str(), "");
        return randMsg.c_str();
    }

    // Get Loremaster Info
    void GetLoremaster(Player *player, Creature * creature)
    {
        // Get Loremaster
        ThisLoremaster = creature->GetDBTableGUIDLow();
        NextLoremaster = ThisLoremaster + 1;

        // Get/Set Destination
        if (QueryResult NextDestination = WorldDatabase.PQuery("SELECT id, position_x, position_y, position_z, orientation, map, name FROM npc_loremaster WHERE id = '%u'", (NextLoremaster)))
        {
            // Get NextDestination fields
            Field * fields = NextDestination->Fetch();
            id = fields[0].GetInt32();
            position_x = fields[1].GetFloat();
            position_y = fields[2].GetFloat();
            position_z = fields[3].GetFloat();
            orientation = fields[4].GetFloat();
            mapID = fields[5].GetUInt32();
            destination = fields[6].GetCString();
        }
        else
        {
            // GUID not found - Assign the first Loremaster entry
            if (NextDestination = WorldDatabase.PQuery("SELECT id, position_x, position_y, position_z, orientation, map, name FROM npc_loremaster WHERE id = '%u'", (FirstLoremaster)))
            {
                // Get NextDestination fields
                Field * fields = NextDestination->Fetch();
                id = fields[0].GetInt32();
                position_x = fields[1].GetFloat();
                position_y = fields[2].GetFloat();
                position_z = fields[3].GetFloat();
                orientation = fields[4].GetFloat();
                mapID = fields[5].GetUInt32();
                destination = fields[6].GetCString();
            }
            else
            {
                // FirstLoremasterGUID not found - Someone broke something - Set destination
                position_x = -10806.2;
                position_y = 2448.78;
                position_z = 2.12592;
                orientation = 5.56451;
                mapID = 1;
                destination = "Camp Silithus";
            }
        }
    }

    // Gossip Hello
    bool OnGossipHello(Player * player, Creature * creature)
    {
        // Gossip Options
        std::ostringstream Option1;
        std::ostringstream Option2;
        std::ostringstream messageHello;
        player->PlayerTalkClass->ClearMenus();

        // Check Player Status
        if (player->IsInFlight() || !player->getAttackers().empty() || player->IsInCombat())
        {
            messageHello << "You appear to be in combat " << player->GetName() << "!";
            creature->MonsterWhisper(messageHello.str().c_str(), player);
            player->CLOSE_GOSSIP_MENU();
            return false;
        }

        // Get Loremaster info
        GetLoremaster(player, creature);

        // Gossip Menu
        Option1 << "Take me to " << destination << " " << LoremasterName;
        Option2 << "I think I'll explore this area for now.";
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, Option1.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, Option2.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        player->SEND_GOSSIP_MENU(ThisLoremaster, creature->GetGUID());

        return true;
    }

    // Gossip Select
    bool OnGossipSelect(Player * player, Creature * creature, uint32 sender, uint32 uiAction)
    {
        // Gossip Options
        std::ostringstream messageSelect;
        player->PlayerTalkClass->ClearMenus();

        // Check Sender
        if (sender != GOSSIP_SENDER_MAIN)
        {
            player->CLOSE_GOSSIP_MENU();
            return false;
        }

        // Check Player Status
        if (player->IsInFlight() || !player->getAttackers().empty() || player->IsInCombat())
        {
            messageSelect << "You appear to be in combat " << player->GetName() << "!";
            creature->MonsterWhisper(messageSelect.str().c_str(), player);
            player->CLOSE_GOSSIP_MENU();
            return false;
        }

        // Get Loremaster info
        GetLoremaster(player, creature);

        // Gossip Action
        switch (uiAction)
        {
        case GOSSIP_ACTION_INFO_DEF + 1:

            messageSelect << "Transporting you to " << destination << " " << player->GetName() << ".";
            creature->MonsterWhisper(messageSelect.str().c_str(), player);
            creature->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
            player->PlayDirectSound(3337);
            player->CastSpell(player, 47292);
            player->TeleportTo(mapID, position_x, position_y, position_z, orientation);
            player->CLOSE_GOSSIP_MENU();
            break;

        case GOSSIP_ACTION_INFO_DEF + 2:

            player->CLOSE_GOSSIP_MENU();
            break;

        default:

            player->CLOSE_GOSSIP_MENU();
            break;
        }

        return true;
    }

    // Passive Emotes
    struct NPC_PassiveAI : public ScriptedAI
    {
        NPC_PassiveAI(Creature * creature) : ScriptedAI(creature) { }

        uint32 MessageTimer;

        // Called once when client is loaded
        void Reset()
        {
            MessageTimer = urand(LoremasterMessageTimer, 300000); // 1-5 minutes
        }

        // Called at World update tick
        void UpdateAI(const uint32 diff)
        {
            if (MessageTimer <= diff)
            {
                std::string Message = PickPhrase();
                me->MonsterSay(Message.c_str(), LANG_UNIVERSAL, NULL);

                // Use gesture?
                if (LoremasterEmoteCommand != 0)
                {
                    me->HandleEmoteCommand(LoremasterEmoteCommand);
                }

                // Alert players?
                if (LoremasterEmoteSpell != 0)
                {
                    me->CastSpell(me, LoremasterEmoteSpell);
                }

                MessageTimer = urand(LoremasterMessageTimer, 300000);
            }
            else { MessageTimer -= diff; }
        }
    };

    // CREATURE AI
    CreatureAI * GetAI(Creature * creature) const
    {
        return new NPC_PassiveAI(creature);
    }

};

void AddNPCLoremasterScripts()
{
    new LoremasterConfig();
    new LoremasterAnnounce();
    new Loremaster_NPC();
}
