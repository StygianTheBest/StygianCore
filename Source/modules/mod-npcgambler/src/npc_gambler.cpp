/*

# Gambler NPC

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description
------------------------------------------------------------------------------------------------------------------
Hey, the name's Skinny. You feelin' lucky? This NPC will allow players to gamble copper, silver, or gold as
defined in the configuration. It's a nice way for players to make a little extra coin.

- Config:
    - Set bet and jackpot amounts
    - Enable/Disable coin type (gold, silver, copper)
    - Set coin type to gamble
- A roll of 50 or higher wins double the bet!
- A roll of less than 50 loses double the bet!
- A roll of 100 within the first 10 rolls hits the jackpot!
- The jackpot can only be hit in the first 10 rolls of each session to discourage spam.
- A little help is given to players losing 5 rolls in a row.

### To-Do
------------------------------------------------------------------------------------------------------------------
- Track and display jackpot winners/dates.
- Create lottery from player losses.

### Data
------------------------------------------------------------------------------------------------------------------
- Type: NPC
- Script: gamble_npc
- Config: Yes
- SQL: Yes
    - NPC ID: 601020

### Version
------------------------------------------------------------------------------------------------------------------
- v2019.02.13 - Redesign, Add Coin Type Options, Update AI
- v2018.12.09 - Update config
- v2017.08.10 - Release


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
#include "Pet.h"
#include "ScriptPCH.h"
#include "ScriptedGossip.h"

bool GamblerNPCAnnounce = true;

// Module Configuration Values
uint32 Bet1 = 1;
uint32 Bet2 = 2;
uint32 Bet3 = 3;
uint32 Bet4 = 4;
uint32 Bet5 = 5;
uint32 Jackpot = 50;
uint32 MoneyType = 3;
uint32 EnableGold = 1;
uint32 EnableSilver = 1;
uint32 EnableCopper = 1;
uint32 GamblerEmoteSpell;
uint32 GamblerMessageTimer;

class GamblerConfig : public WorldScript
{
public:
    GamblerConfig() : WorldScript("GamblerConfig") { }

    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/npc_gambler.conf";
#ifdef WIN32
            cfg_file = "npc_gambler.conf";
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
        GamblerNPCAnnounce = sConfigMgr->GetBoolDefault("Gambler.Announce", true);
        Bet1 = sConfigMgr->GetIntDefault("Gambler.Amount1", 1);
        Bet2 = sConfigMgr->GetIntDefault("Gambler.Amount2", 2);
        Bet3 = sConfigMgr->GetIntDefault("Gambler.Amount3", 3);
        Bet4 = sConfigMgr->GetIntDefault("Gambler.Amount4", 4);
        Bet5 = sConfigMgr->GetIntDefault("Gambler.Amount5", 5);
        Jackpot = sConfigMgr->GetIntDefault("Gambler.Jackpot", 50);
        MoneyType = sConfigMgr->GetIntDefault("Gambler.MoneyType", 3);
        EnableGold = sConfigMgr->GetIntDefault("Gambler.EnableGold", 1);
        EnableSilver = sConfigMgr->GetIntDefault("Gambler.EnableSilver", 1);
        EnableCopper = sConfigMgr->GetIntDefault("Gambler.EnableCopper", 1);
        GamblerEmoteSpell = sConfigMgr->GetIntDefault("Gambler.MessageTimer", 44940);
        GamblerMessageTimer = sConfigMgr->GetIntDefault("Gambler.MessageTimer", 60000);

        // Enforce Min/Max Time
        if (GamblerMessageTimer != 0)
        {
            if (GamblerMessageTimer < 60000 || GamblerMessageTimer > 300000)
            {
                GamblerMessageTimer = 60000;
            }
        }
    }
};

class GamblerAnnounce : public PlayerScript
{

public:
    GamblerAnnounce() : PlayerScript("GamblerAnnounce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (GamblerNPCAnnounce)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00GamblerNPC |rmodule.");
        }
    }
};

class gamble_npc : public CreatureScript
{

public:

    gamble_npc() : CreatureScript("gamble_npc") { }

    // Money
    uint32 Pocket = 0;
    uint32 BetAmount = 0;
    uint32 WinAmount = 0;
    uint32 PlayerMoney = 0;
    uint32 JackpotAmount = 0;
    string MoneyTypeText = "Electrum";

    // Bets
    uint32 Bets = 0;		// # of bets placed
    uint32 Wins = 0;		// # of wins
    uint32 Losses = 0;		// # of losses

    // Calculate Gamble Amounts
    int CalcMoney(int Copper, int bet)
    {
        if (MoneyType == 3)
        {
            MoneyTypeText = "Gold";                     // Gamble Gold
            PlayerMoney = Copper / 10000;               // Player Gold
            BetAmount = ((bet * 10000) * 2);            // Bet value in Gold
            WinAmount = BetAmount / 10000 % 100;        // Player Wins Gold
            JackpotAmount = Jackpot * 10000;            // Jackpot value in Copper
        }
        else if (MoneyType == 2)
        {
            MoneyTypeText = "Silver";                   // Gamble Silver
            PlayerMoney = Copper / 100;                 // Player Silver
            BetAmount = ((bet * 100) * 2);              // Bet value in Silver
            WinAmount = BetAmount / 100 % 100;          // Player Wins Silver
            JackpotAmount = Jackpot * 100;              // Jackpot value in Copper
        }
        else
        {
            MoneyTypeText = "Copper";                   // Gamble Copper
            PlayerMoney = Copper;                       // Player Copper 
            BetAmount = bet * 2;                        // Bet value in Copper
            WinAmount = BetAmount % 100;                // Player Wins Copper
            JackpotAmount = Jackpot * 1;                // Jackpot value in Copper
        }

        return Copper;
    }

    // Gossip Hello
    bool OnGossipHello(Player * player, Creature * creature)
    {
        std::ostringstream messageCoinType;
        std::ostringstream messagePocket;
        std::ostringstream messageJackpot;

        player->PlayerTalkClass->ClearMenus();

        // Calculate player money and bet values
        Pocket = CalcMoney(player->GetMoney(), 0);

        // For the high-rollers
        if (Pocket >= 50000000 && Bets == 0) // If they have 5000+ Gold
        {
            std::ostringstream messageTaunt;
            messageTaunt << "Whadda we have here? A high-roller eh? Step right up " << player->GetName() << "!";
            player->GetSession()->SendNotification(messageTaunt.str().c_str());
        }

        // Reset # of bets placed
        Bets = 0;

        // Clean up the display if using Copper or Silver
        if (Pocket >= 100000 && MoneyType == 1 || Pocket >= 100000 && MoneyType == 2)
        {
            messagePocket << "Hi " << player->GetName() << ". I see you have PLENTY of " << MoneyTypeText << " to gamble.";
        }
        else if (Pocket >= 10000000 && MoneyType == 3)
        {
            messagePocket << "Hi " << player->GetName() << ". I see you have PLENTY of " << MoneyTypeText << " to gamble.";
        }
        else
        {
            messagePocket << "Hi " << player->GetName() << ". I see you've got " << PlayerMoney << " " << MoneyTypeText << " to gamble.";
        }

        // Main Menu
        messageJackpot << "Place your bet. Today's Jackpot is " << Jackpot << " " << MoneyTypeText << ".";
        messageCoinType << "Coin Type: " << MoneyTypeText;
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, messagePocket.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 14);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "So, how does this game work?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, messageCoinType.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, messageJackpot.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        player->SEND_GOSSIP_MENU(601020, creature->GetGUID());
        return true;
    }

    // Gossip Select
    bool OnGossipSelect(Player * player, Creature * creature, uint32 sender, uint32 uiAction)
    {
        // Strings
        std::ostringstream Option1;
        std::ostringstream Option2;
        std::ostringstream Option3;
        std::ostringstream Option4;
        std::ostringstream Option5;
        std::ostringstream CoinCopper;
        std::ostringstream CoinSilver;
        std::ostringstream CoinGold;
        std::ostringstream messageCoins;
        std::ostringstream messageInstruct;

        // Initialize
        player->PlayerTalkClass->ClearMenus();

        if (sender != GOSSIP_SENDER_MAIN)
        {
            return false;
        }

        // Main Menu
        switch (uiAction)
        {

            // Gamble Menu
        case GOSSIP_ACTION_INFO_DEF + 1:
            Option1 << Bet1 << " " << MoneyTypeText;
            Option2 << Bet2 << " " << MoneyTypeText;
            Option3 << Bet3 << " " << MoneyTypeText;
            Option4 << Bet4 << " " << MoneyTypeText;
            Option5 << Bet5 << " " << MoneyTypeText;
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, Option1.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, Option2.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, Option3.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, Option4.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, Option5.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, " Back", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 14);
            player->PlayerTalkClass->SendGossipMenu(1, creature->GetGUID());
            break;

            // Rules Menu
        case GOSSIP_ACTION_INFO_DEF + 2:
            messageInstruct << "The rules are simple " << player->GetName() << ".. If you roll higher than 50, you win double the bet amount. Otherwise, you lose twice the bet amount. A roll of 100 wins the jackpot. Good Luck!";
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, messageInstruct.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 14);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Alright Skinny, I'm up for some gambling.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->PlayerTalkClass->SendGossipMenu(1, creature->GetGUID());
            break;

            // Bet 1
        case GOSSIP_ACTION_INFO_DEF + 3:
            OnGossipSelectMoney(player, creature, 1, 1, Bet1);
            break;

            // Bet 2
        case GOSSIP_ACTION_INFO_DEF + 4:
            OnGossipSelectMoney(player, creature, 1, 1, Bet2);
            break;

            // Bet 3
        case GOSSIP_ACTION_INFO_DEF + 5:
            OnGossipSelectMoney(player, creature, 1, 1, Bet3);
            break;

            // Bet 4
        case GOSSIP_ACTION_INFO_DEF + 6:
            OnGossipSelectMoney(player, creature, 1, 1, Bet4);
            break;

            // Bet 5
        case GOSSIP_ACTION_INFO_DEF + 7:
            OnGossipSelectMoney(player, creature, 1, 1, Bet5);
            break;

            // MoneyType Menu
        case GOSSIP_ACTION_INFO_DEF + 8:
            CoinCopper << "Copper";
            CoinSilver << "Silver";
            CoinGold << "Gold";
            messageCoins << "Whatta ya gamblin' with " << player->GetName() << "?";
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, messageCoins.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);

            if (EnableCopper)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, CoinCopper.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 10);
            }

            if (EnableSilver)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, CoinSilver.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 11);
            }

            if (EnableGold)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, CoinGold.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 12);
            }
            player->PlayerTalkClass->SendGossipMenu(1, creature->GetGUID());

            break;

            // MoneyType: Copper
        case GOSSIP_ACTION_INFO_DEF + 10:
            MoneyType = 1;
            player->PlayerTalkClass->ClearMenus();
            OnGossipHello(player, creature);
            break;

            // MoneyType: Silver
        case GOSSIP_ACTION_INFO_DEF + 11:
            MoneyType = 2;
            player->PlayerTalkClass->ClearMenus();
            OnGossipHello(player, creature);
            break;

            // MoneyTaype: Gold
        case GOSSIP_ACTION_INFO_DEF + 12:
            MoneyType = 3;
            player->PlayerTalkClass->ClearMenus();
            OnGossipHello(player, creature);
            break;

            // Main Menu
        case GOSSIP_ACTION_INFO_DEF + 14:
            player->PlayerTalkClass->ClearMenus();
            OnGossipHello(player, creature);
            break;
        }
        return true;
    }

    // Gossip Select Gold
    bool OnGossipSelectMoney(Player* player, Creature* creature, uint32 sender, uint32 uiAction, uint32 bet)
    {
        player->PlayerTalkClass->ClearMenus();

        // Dice Roll
        uint32 Roll = 0;

        // Generate a "random" number	
        Roll = urand(1, 100);
        Bets = Bets + 1;

        // The house always wins (discourage spamming for the jackpot)
        if (Bets >= 10 && Roll == 100)
        {
            // If they have bet 10 times this session, decrement their roll 
            // by 1 to prevent a roll of 100 and hitting the jackpot. 
            Roll = Roll - 1;
        }

        // Calculate player money and bet values
        Pocket = CalcMoney(player->GetMoney(), bet);

        // Losing Streak? Aww.. how about some help.
        // After 5 losses in a row, add +25 to their next roll.
        if (Losses >= 5 && Roll < 50)
        {
            std::ostringstream messageHelp;
            messageHelp << "Lady luck isn't on your side tonight " << player->GetName() << ".";
            creature->MonsterWhisper(messageHelp.str().c_str(), player);
            Roll = Roll + 25;
            Losses = 0;
        }

        // For the cheapskates
        if (Pocket < (BetAmount / 2))
        {
            std::ostringstream messageTaunt;
            messageTaunt << "Hey, I got no time for cheapskates " << player->GetName() << ". Come back when you have " << bet << " " << MoneyTypeText << "!";
            player->AddAura(228, player);	// Polymorph Chicken
            player->AddAura(5782, player);	// Fear
            creature->MonsterWhisper(messageTaunt.str().c_str(), player);
            player->CLOSE_GOSSIP_MENU();
            player->PlayDirectSound(5960); // Goblin Pissed
            creature->HandleEmoteCommand(EMOTE_ONESHOT_RUDE);
            return false;
        }

        // Hittin' the jackpot!
        if (Roll == 100)
        {
            std::ostringstream messageAction;
            std::ostringstream messageNotice;
            player->ModifyMoney(JackpotAmount);
            player->PlayDirectSound(3337);
            player->CastSpell(player, 47292);
            player->CastSpell(player, 44940);
            messageAction << "The bones come to rest with a total roll of " << Roll << ".";
            messageNotice << "WOWZERS " << player->GetName() << "!! You hit the jackpot! Here's your purse of " << Jackpot << " " << MoneyTypeText << "!";
            creature->MonsterWhisper(messageAction.str().c_str(), player);
            player->GetSession()->SendAreaTriggerMessage(messageNotice.str().c_str());
            player->CLOSE_GOSSIP_MENU();
            creature->HandleEmoteCommand(EMOTE_ONESHOT_APPLAUD);
            return true;
        }

        // Why does it happen? Because it happens.. Roll the bones.. Roll the bones!
        if (Roll >= 50)
        {
            std::ostringstream messageAction;
            std::ostringstream messageNotice;
            player->ModifyMoney(BetAmount);
            Wins = Wins + 1;
            Losses = 0;
            player->CastSpell(player, 47292);
            messageAction << "The bones come to rest with a total roll of " << Roll << ".";
            messageNotice << "Congratulations " << player->GetName() << ", You've won " << WinAmount << " " << MoneyTypeText << "!";
            creature->MonsterWhisper(messageAction.str().c_str(), player);
            ChatHandler(player->GetSession()).SendSysMessage(messageNotice.str().c_str());
            creature->HandleEmoteCommand(EMOTE_ONESHOT_APPLAUD);
        }
        else
        {
            std::ostringstream messageAction;
            std::ostringstream messageNotice;
            player->ModifyMoney(-BetAmount);
            Losses = Losses + 1;
            messageAction << "The bones come to rest with a total roll of " << Roll << ".";
            messageNotice << "Tough luck " << player->GetName() << ", you've lost " << WinAmount << " " << MoneyTypeText << "!";
            creature->MonsterWhisper(messageAction.str().c_str(), player);
            ChatHandler(player->GetSession()).SendSysMessage(messageNotice.str().c_str());
            creature->HandleEmoteCommand(EMOTE_ONESHOT_QUESTION);
        }

        OnGossipSelect(player, creature, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        return true;
    }

    // Passive Emotes
    struct NPC_PassiveAI : public ScriptedAI
    {
        NPC_PassiveAI(Creature * creature) : ScriptedAI(creature) { }

        uint32 Choice;
        uint32 MessageTimer;

        // Called once when client is loaded
        void Reset()
        {
            // GamblerMessageTimer Hardcoded - Does Not Use Config Value
            MessageTimer = urand(60000, 180000); // 1-3 minutes
        }

        // Called at World update tick
        void UpdateAI(const uint32 diff)
        {
            if (MessageTimer <= diff)
            {
                // If Enabled
                if (GamblerMessageTimer != 0)
                {
                    // Make a random message choice
                    Choice = urand(1, 3);

                    switch (Choice)
                    {
                    case 1:
                    {
                        me->MonsterSay("Come one, come all! Step right up to Skinny's! Place your bets, Place your bets!", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);

                        if (GamblerEmoteSpell != 0)
                        {
                            me->CastSpell(me, 44940);
                        }

                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    case 2:
                    {
                        me->MonsterSay("Come on! Place your bets, Don't be a chicken!", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_CHICKEN);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    case 3:
                    {
                        me->MonsterSay("Don't make me sad, Come and gamble! Step right up and win today!", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_CRY);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    default:
                    {
                        me->MonsterSay("Come one, come all!Step right up to Skinny's! Place your bets, Place your bets!", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);
                        me->CastSpell(me, 44940);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    }
                }
            }
            else { MessageTimer -= diff; }
        };
    };

    // CREATURE AI
    CreatureAI * GetAI(Creature * creature) const
    {
        return new NPC_PassiveAI(creature);
    }
};

void AddNPCGamblerScripts()
{
    new GamblerConfig();
    new GamblerAnnounce();
    new gamble_npc();
}
