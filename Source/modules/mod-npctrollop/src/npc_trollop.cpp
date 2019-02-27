/*

# Trollop NPC

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

## Description
------------------------------------------------------------------------------------------------------------------
Everybody needs someone...

## Data
------------------------------------------------------------------------------------------------------------------
- Type: NPC
- Script: Trollop_NPC
- Config: Yes
- SQL: Yes
  - NPC ID: 601017

## Version
------------------------------------------------------------------------------------------------------------------
- v2019.02.14 - Release

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

// Config
bool TrollopAnnounceModule = true;
uint32 TrollopNPC = 601017;
uint32 TrollopNumPhrases;
uint32 TrollopNumWhispers;
uint32 TrollopEmoteCommand;
uint32 TrollopEmoteSpell;
uint32 TrollopEmoteSound;
uint32 TrollopMessageTimer;
uint32 TrollopOver18Content;

class TrollopConfig : public WorldScript
{
public:
    TrollopConfig() : WorldScript("TrollopConfig") { }

    // Read Configuration File
    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/npc_trollop.conf";
#ifdef WIN32
            cfg_file = "npc_trollop.conf";
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
        TrollopAnnounceModule = sConfigMgr->GetBoolDefault("Trollop.Announce", true);
        TrollopMessageTimer = sConfigMgr->GetIntDefault("Trollop.MessageTimer", 60000);
        TrollopNumPhrases = sConfigMgr->GetIntDefault("Trollop.NumPhrases", 3);
        TrollopNumWhispers = sConfigMgr->GetIntDefault("Trollop.NumWhispers", 3);
        TrollopEmoteCommand = sConfigMgr->GetIntDefault("Trollop.EmoteCommand", 3);
        TrollopEmoteSpell = sConfigMgr->GetIntDefault("Trollop.EmoteSpell", 44940);
        TrollopEmoteSound = sConfigMgr->GetIntDefault("Trollop.EmoteSound", 9102);
        TrollopOver18Content = sConfigMgr->GetBoolDefault("Trollop.Over18Content", false);

        // Enforce Min/Max Time
        if (TrollopMessageTimer != 0)
        {
            if (TrollopMessageTimer < 60000 || TrollopMessageTimer> 300000)
            {
                TrollopMessageTimer = 60000;
            }
        }
    }
};

class TrollopAnnounce : public PlayerScript
{

public:
    TrollopAnnounce() : PlayerScript("TrollopAnnounce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (TrollopAnnounceModule)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00TrollopNPC |rmodule.");
        }
    }
};

class Trollop_NPC : public CreatureScript
{

public:

    Trollop_NPC() : CreatureScript("Trollop_NPC") { }

    // Replace
    static bool replace(std::string& str, const std::string& from, const std::string& to)
    {
        size_t start_pos = str.find(from);
        if (start_pos == std::string::npos)
            return false;
        str.replace(start_pos, from.length(), to);
        return true;
    }

    // Pick Whisper
    static string PickWhisper(string Name)
    {
        // Choose and speak a random phrase to the player
        // Phrases are stored in the config file
        std::string whisper = "";
        uint32 WhisperNum = urand(1, TrollopNumWhispers); // How many phrases does the NPC speak? 
        whisper = "TP.W" + std::to_string(WhisperNum);

        // Sanitize
        if (whisper == "")
        {
            whisper = "ERROR! NPC Emote Text Not Found! Check the npc_trollop.conf!";
        }

        std::string randMsg = sConfigMgr->GetStringDefault(whisper.c_str(), "");
        replace(randMsg, "%s", Name);
        return randMsg.c_str();
    }

    // Pick Phrase
    static string PickPhrase()
    {
        // Choose and speak a random phrase to the player
        // Phrases are stored in the config file
        std::string phrase = "";
        uint32 PhraseNum = urand(1, TrollopNumPhrases); // How many phrases does the NPC speak? 
        phrase = "TP.P" + std::to_string(PhraseNum);

        // Sanitize
        if (phrase == "")
        {
            phrase = "ERROR! NPC Emote Text Not Found! Check the npc_trollop.conf!";
        }

        std::string randMsg = sConfigMgr->GetStringDefault(phrase.c_str(), "");
        return randMsg.c_str();
    }

    // Gossip Hello
    bool OnGossipHello(Player * player, Creature * creature)
    {
        // Gossip Options
        std::ostringstream Option1;
        std::ostringstream Option2;
        std::ostringstream Option3;
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

        // Gossip Menu
        if (TrollopOver18Content)
        {
            Option1 << "Say, \"Sure, I'll have a slice.\"";
            Option2 << "Grab her by the horns and show her your sword.";
            Option3 << "Maybe next time..";
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, Option1.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, Option2.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, Option3.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
        else
        {
            Option1 << "Oh yeah!";
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, Option1.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
        }

        player->SEND_GOSSIP_MENU(TrollopNPC, creature->GetGUID());
        return true;
    }

    // Gossip Select
    bool OnGossipSelect(Player * player, Creature * creature, uint32 sender, uint32 uiAction)
    {
        string PlayerName = player->GetName();

        // Gossip Options
        std::ostringstream messageSelect;
        player->PlayerTalkClass->ClearMenus();

        // Check Sender
        if (sender != GOSSIP_SENDER_MAIN)
        {
            player->CLOSE_GOSSIP_MENU();
            return false;
        }

        // Gossip Action
        switch (uiAction)
        {

        case GOSSIP_ACTION_INFO_DEF + 1:

            // Choose and speak a random phrase to the player
            // Phrases are stored in the config file
            creature->MonsterWhisper(PickWhisper(PlayerName).c_str(), player);

            // Give the player some love!
            player->CastSpell(player, 16609, true); // Chain Lightning

            // Emote and Close
            creature->HandleEmoteCommand(TrollopEmoteCommand);
            player->CLOSE_GOSSIP_MENU();
            break;

        case GOSSIP_ACTION_INFO_DEF + 2:

            // Choose and speak a random phrase to the player
            // Phrases are stored in the config file
            creature->MonsterWhisper(PickWhisper(PlayerName).c_str(), player);

            // Emote and Close
            creature->HandleEmoteCommand(TrollopEmoteCommand);
            player->CLOSE_GOSSIP_MENU();
            break;

        case GOSSIP_ACTION_INFO_DEF + 3:

            // Choose and speak a random phrase to the player
            // Phrases are stored in the config file
            creature->MonsterWhisper("Run along little boy..", player);

            // Run along little boy...
            player->CastSpell(player, 44940, true);     // Love in the Air
            player->SetDisplayId(251);

            // Emote and Close
            creature->PlayDirectSound(TrollopEmoteSound, player);
            creature->HandleEmoteCommand(TrollopEmoteCommand);
            player->CLOSE_GOSSIP_MENU();
            break;

        default:

            // Emote and Close
            creature->HandleEmoteCommand(TrollopEmoteCommand);
            player->CLOSE_GOSSIP_MENU();
            break;
        }

        return true;
    }

    // Passive Emotes
    struct NPC_PassiveAI : public ScriptedAI
    {
        NPC_PassiveAI(Creature * creature) : ScriptedAI(creature) { }

        uint32 MessageTimer = 60000;

        // Called once when client is loaded
        void Reset()
        {
            MessageTimer = urand(TrollopMessageTimer, 300000); // 1-5 minutes
        }

        // Called at World update tick
        void UpdateAI(const uint32 diff)
        {
            if (MessageTimer <= diff)
            {
                std::string Message = PickPhrase();
                me->MonsterSay(Message.c_str(), LANG_UNIVERSAL, NULL);

                // Use gesture?
                if (TrollopEmoteCommand != 0)
                {
                    me->HandleEmoteCommand(TrollopEmoteCommand);
                }

                // Alert players?
                if (TrollopEmoteSpell != 0)
                {
                    me->CastSpell(me, TrollopEmoteSpell);
                }

                MessageTimer = urand(TrollopMessageTimer, 300000);
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

void AddNPCTrollopScripts()
{
    new TrollopConfig();
    new TrollopAnnounce();
    new Trollop_NPC();
}
