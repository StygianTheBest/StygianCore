/*

# BeastMaster NPC #

### Description ###
------------------------------------------------------------------------------------------------------------------
WhiteFang is a Beastmaster NPC that howls! This NPC allows any player, or only Hunters, to adopt and use beasts.
He also teaches the player specific Hunter skills for use with their beasts. A player can adopt normal or exotic
beasts depending on how you've configured the NPC. For each type of beast I use a rare spawn model of a creature
of the same type, so they all look cool. He also sells a great selection of grub for every level of beast. Hunters
can access the stables as well. This has been a lot of fun for players on my server, StygianCore, and beasts work
great and just like they do on a Hunter in or out of dungeons.


### Features ###
------------------------------------------------------------------------------------------------------------------
- Adds a Worgen BeastMaster NPC with sounds/emotes
- Allows adopting of beasts by level, class, and ability
- Teaches player all required Hunter abilities
- Sells beast food For all levels
- The scale of the beast is configurable


### To-Do ###
------------------------------------------------------------------------------------------------------------------
- If possible, create working stable for non-Hunter player
- Fix beast spells disappearing from beast bar on relog/dismiss (Note: they persist if added back)


### Data ###
------------------------------------------------------------------------------------------------------------------
- Type: NPC
- Script: BeastMaster
- Config: Yes
    - Module Announce
    - CorePatch check
    - Level Requirement
    - Enabled for Hunter class only
    - Require Beast Mastery talent
    - Allow Exotic Beasts for all classes (Teaches Beast Mastery)
    - Set Beast Scale Factor
- SQL: Yes
    - NPC ID: 601026


### Version ###
------------------------------------------------------------------------------------------------------------------
- v2019.01.08 - Fix 'Core Hound' pet issues on relog, death, or teleport
- v2017.09.03 - Release


### Credits ###
------------------------------------------------------------------------------------------------------------------
#### A module for AzerothCore by StygianTheBest ([stygianthebest.github.io](http://stygianthebest.github.io)) ####

###### Additional Credits include:
- [Blizzard Entertainment](http://blizzard.com)
- [TrinityCore](https://github.com/TrinityCore/TrinityCore/blob/3.3.5/THANKS)
- [SunwellCore](http://www.azerothcore.org/pages/sunwell.pl/)
- [AzerothCore](https://github.com/AzerothCore/azerothcore-wotlk/graphs/contributors)
- [AzerothCore Discord](https://discord.gg/gkt4y2x)
- [EMUDevs](https://youtube.com/user/EmuDevs)
- [AC-Web](http://ac-web.org/)
- [ModCraft.io](http://modcraft.io/)
- [OwnedCore](http://ownedcore.com/)
- [OregonCore](https://wiki.oregon-core.net/)
- [Wowhead.com](http://wowhead.com)
- [AoWoW](https://wotlk.evowow.com/)


### License ###
------------------------------------------------------------------------------------------------------------------
- This code and content is released under the [GNU AGPL v3](https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3).

*/

#include "Config.h"
#include "Pet.h"
#include "ScriptPCH.h"
#include "Configuration/Config.h"
#include "ScriptedGossip.h"

std::vector<uint32> HunterSpells = { 883, 982, 2641, 6991, 48990, 1002, 1462, 6197 };
uint32 BeastMasterMinLevel = 10;
float BeastMasterBeastScale = 1.0;
bool BeastMasterAnnounceToPlayer = 1;
bool BeastMasterHunterOnly = 0;
bool BeastMasterAdoptExotic = 1;
bool BeastMasterTalentRequired = 0;
bool BeastMasterKeepBeastHappy = 1;
bool BeastMasterCorePatch = 1;

class BeastMasterConf : public WorldScript
{
public:
    BeastMasterConf() : WorldScript("BeastMasterConf_conf") { }

    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/npc_beastmaster.conf";
#ifdef WIN32
            cfg_file = "npc_beastmaster.conf";
#endif
            std::string cfg_def_file = cfg_file + ".dist";
            sConfigMgr->LoadMore(cfg_def_file.c_str());
            sConfigMgr->LoadMore(cfg_file.c_str());

            BeastMasterAnnounceToPlayer = sConfigMgr->GetBoolDefault("BeastMaster.Announce", true);
            BeastMasterMinLevel = sConfigMgr->GetIntDefault("BeastMaster.MinLevel", 10);
            BeastMasterHunterOnly = sConfigMgr->GetBoolDefault("BeastMaster.HunterOnly", false);
            BeastMasterAdoptExotic = sConfigMgr->GetBoolDefault("BeastMaster.AdoptExotic", true);
            BeastMasterTalentRequired = sConfigMgr->GetBoolDefault("BeastMaster.TalentRequired", false);
            BeastMasterKeepBeastHappy = sConfigMgr->GetBoolDefault("BeastMaster.KeepBeastHappy", true);
            BeastMasterBeastScale = sConfigMgr->GetFloatDefault("BeastMaster.BeastScale", 1.0);
            BeastMasterCorePatch = sConfigMgr->GetBoolDefault("BeastMaster.CorePatch", false);

            // Sanitize (just n' case ya'll)
            if (BeastMasterMinLevel < 0 || BeastMasterMinLevel > 80)
            {
                BeastMasterMinLevel = 10;
            }
            if (BeastMasterBeastScale < 0.2 || BeastMasterBeastScale > 10)
            {
                BeastMasterBeastScale = 1.0;
            }
        }
    }
};

class BeastMasterAnnounce : public PlayerScript
{

public:

    BeastMasterAnnounce() : PlayerScript("BeastMasterAnnounce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (BeastMasterAnnounceToPlayer)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00BeastMasterNPC |rmodule.");
        }
    }
};

class BeastMaster : public CreatureScript
{

public:

    BeastMaster() : CreatureScript("BeastMaster") { }

    void CreatePet(Player *player, Creature * m_creature, uint32 entry)
    {
        // Does the player already have a beast?
        if (player->GetPet())
        {
            m_creature->MonsterWhisper("First you must abandon or stable your current beast!", player, false);
            player->CLOSE_GOSSIP_MENU();
            return;
        }

        // Summon Creature
        Creature *creatureTarget = m_creature->SummonCreature(entry, player->GetPositionX(), player->GetPositionY() + 2, player->GetPositionZ(), player->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 500);
        if (!creatureTarget) { return; }

        // Create Tamed Creature
        Pet* pet = player->CreateTamedPetFrom(entry, 883);
        if (!pet) { return; }

        // Kill Original Creature
        creatureTarget->setDeathState(JUST_DIED);
        creatureTarget->RemoveCorpse();
        creatureTarget->SetHealth(0);                       // Nice for GM-Mode view

        // Set Pet Happiness
        pet->SetPower(POWER_HAPPINESS, 1048000);

        // Initialize Pet
        pet->AddUInt64Value(UNIT_FIELD_CREATEDBY, player->GetGUID());
        pet->SetUInt32Value(UNIT_FIELD_FACTIONTEMPLATE, player->getFaction());
        pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel());

        // Prepare Level-Up Visual
        pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel() - 1);
        pet->GetMap()->AddToMap(pet->ToCreature());

        // Visual Effect for Level-Up
        pet->SetUInt32Value(UNIT_FIELD_LEVEL, player->getLevel());

        // Initialize Pet Stats
        pet->InitTalentForLevel();
        if (!pet->InitStatsForLevel(player->getLevel()))
        {
            // sLog->outError("Pet Create fail: no init stats for entry %u", entry);
            pet->UpdateAllStats();
        }

        // Scale Pet
        pet->SetObjectScale(BeastMasterBeastScale);

        // Caster Pets?
        player->SetMinion(pet, true);

        // Save Pet
        pet->GetCharmInfo()->SetPetNumber(sObjectMgr->GeneratePetNumber(), true);
        player->PetSpellInitialize();
        pet->InitLevelupSpellsForLevel();
        pet->SavePetToDB(PET_SAVE_AS_CURRENT, 0);

        // Learn Hunter Abilities (only for non-hunter classes)
        if (player->getClass() != CLASS_HUNTER)
        {
            // Assume player has already learned the spells if they have Call Pet
            if (!player->HasSpell(883))
            {
                for (int i = 0; i < HunterSpells.size(); ++i)
                    player->learnSpell(HunterSpells[i]);
            }
        }

        // Farewell
        std::ostringstream messageAdopt;
        messageAdopt << "A fine choice " << player->GetName() << "! Your " << pet->GetName() << " shall know no law but that of the club and fang.";
        m_creature->MonsterWhisper(messageAdopt.str().c_str(), player);
        player->CLOSE_GOSSIP_MENU();
        m_creature->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
    }

    bool OnGossipHello(Player *player, Creature * m_creature)
    {
        // Howl
        m_creature->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);

        // Check level requirement
        if (player->getLevel() < BeastMasterMinLevel && BeastMasterMinLevel != 0)
        {
            std::ostringstream messageExperience;
            messageExperience << "Sorry " << player->GetName() << ", but you must reach Level " << BeastMasterMinLevel << " before adopting a beast.";
            m_creature->MonsterWhisper(messageExperience.str().c_str(), player);
            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);
            return false;
        }
        else
        {
            // Are we only serving the Hunter class?
            if (BeastMasterHunterOnly && player->getClass() != CLASS_HUNTER)
            {
                // Are there any core modifications to Pet.cpp?
                if (BeastMasterCorePatch)
                {
                    std::ostringstream messageSorry;
                    messageSorry << "Hail " << player->GetName() << ", take only memories, leave only footprints.";
                    m_creature->MonsterWhisper(messageSorry.str().c_str(), player);
                }
                else
                {
                    std::ostringstream messageSorry;
                    messageSorry << "Sorry " << player->GetName() << ", but your knowledge of the wilds leaves much to be desired.";
                    m_creature->MonsterWhisper(messageSorry.str().c_str(), player);
                    m_creature->HandleEmoteCommand(EMOTE_ONESHOT_LAUGH);
                }
            }

            // MAIN MENU
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Beasts", GOSSIP_SENDER_MAIN, 51);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Rare Beasts", GOSSIP_SENDER_MAIN, 70);

            // EXOTIC PETS can be adopted by anyone or only the hunter class with or without the Beast Mastery talent
            if (BeastMasterAdoptExotic || player->HasSpell(53270) || player->HasTalent(53270, player->GetActiveSpec()))
            {
                // If player isn't a Hunter class, let them adopt exotic beasts.
                if (player->getClass() != CLASS_HUNTER)
                {

                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Exotic Beasts", GOSSIP_SENDER_MAIN, 60);

                    // Greet the player
                    std::ostringstream messageSorry;
                    messageSorry << "Hail " << player->GetName() << ", take only memories, leave only footprints.";
                    m_creature->MonsterWhisper(messageSorry.str().c_str(), player);
                }
                else
                {
                    // Is the player a real beast master?
                    if (player->HasTalent(53270, player->GetActiveSpec()))
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Exotic Beasts", GOSSIP_SENDER_MAIN, 60);
                        std::ostringstream messageAdopt;
                        messageAdopt << "Greetings " << player->GetName() << ", it's an honor to meet a true Beast Master.";
                        m_creature->MonsterWhisper(messageAdopt.str().c_str(), player);
                        m_creature->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                    }
                    else
                    {
                        // If not, can hunters adopt exotic beasts without learning beast mastery first ?
                        if (!BeastMasterTalentRequired)
                        {
                            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Exotic Beasts", GOSSIP_SENDER_MAIN, 60);
                            std::ostringstream messageAdopt;
                            messageAdopt << "How goes it " << player->GetName() << "? Have you seen my exotic beasts yet?";
                            m_creature->MonsterWhisper(messageAdopt.str().c_str(), player);
                            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                        }
                        else
                        {
                            // Hunters must train beast mastery before adopting exotic beasts.
                            std::ostringstream messageAdopt;
                            messageAdopt << "Alas " << player->GetName() << ".. One must master the ways of the wilds to control exotic beasts.";
                            m_creature->MonsterWhisper(messageAdopt.str().c_str(), player);
                            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
                        }
                    }
                }
            }

            // Remove Hunter abilties from non-Hunter characters
            if (player->getClass() != CLASS_HUNTER)
            {
                // Assume player has already learned the spells if they have Call Pet
                if (player->HasSpell(883))
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Unlearn Hunter Abilities", GOSSIP_SENDER_MAIN, 80);
                }
            }

            // Stables for Hunters Only - Doesn't seem to work for other classes
            if (player->getClass() == CLASS_HUNTER)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Visit Stable", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_STABLEPET);
            }
        }

        // Buy Food
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Buy Food", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
        player->PlayerTalkClass->SendGossipMenu(601026, m_creature->GetGUID());

        // Howl/Roar
        player->PlayDirectSound(9036);
        m_creature->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
        return true;
    }

    bool OnGossipSelect(Player *player, Creature * m_creature, uint32 sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        switch (action)
        {

            // MAIN MENU
        case 50:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Beasts", GOSSIP_SENDER_MAIN, 51);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Rare Beasts", GOSSIP_SENDER_MAIN, 70);

            // EXOTIC BEASTS can be adopted by anyone or only the hunter class with or without the Beast Mastery talent
            if (BeastMasterAdoptExotic || player->HasSpell(53270) || player->HasTalent(53270, player->GetActiveSpec()))
            {
                // Allow exotic beast adoption if not a Hunter class
                if (player->getClass() != CLASS_HUNTER)
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Exotic Beasts", GOSSIP_SENDER_MAIN, 60);
                }
                else
                {
                    // Do Hunters need to learn Beast Mastery before adopting exotic beasts?
                    if (!BeastMasterTalentRequired)
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Browse Exotic Beasts", GOSSIP_SENDER_MAIN, 60);
                    }
                    else
                    {
                        // Of all the things I've lost, I miss my mind the most.
                    }
                }
            }

            // Remove Hunter abilities (for non-Hunter classes)
            if (player->getClass() != CLASS_HUNTER)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Unlearn Hunter Abilities", GOSSIP_SENDER_MAIN, 80);
            }

            // Stables for Hunters only (Doesn't seem to work for other classes)
            if (player->getClass() == CLASS_HUNTER)
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Visit Stable", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_STABLEPET);
            }

            // Buy Food
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Buy Food", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
            player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, m_creature->GetGUID());
            break;

            // BEASTS PAGE 1
        case 51:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", GOSSIP_SENDER_MAIN, 50);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Next..", GOSSIP_SENDER_MAIN, 52);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Bat", GOSSIP_SENDER_MAIN, 16180);              // Shadikith The Glider
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Bear", GOSSIP_SENDER_MAIN, 12037);             // Ursollok
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Boar", GOSSIP_SENDER_MAIN, 29996);             // Armored Brown
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Cat", GOSSIP_SENDER_MAIN, 2175);               // Shadowclaw
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Carrion Bird", GOSSIP_SENDER_MAIN, 2931);      // Zaricotl
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Crab", GOSSIP_SENDER_MAIN, 18241);             // Crusty
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Crocolisk", GOSSIP_SENDER_MAIN, 1417);         // Izod Green
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Dragonhawk", GOSSIP_SENDER_MAIN, 8);           // Bloodfalcon
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Gorilla", GOSSIP_SENDER_MAIN, 1559);           // King Mukla
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Hound", GOSSIP_SENDER_MAIN, 29452);            // Darkhound - (Registers as Wolf Pre-Cata)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Hyena", GOSSIP_SENDER_MAIN, 5829);             // Snort the Heckler
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Moth", GOSSIP_SENDER_MAIN, 25498);             // Aspatha the Broodmother
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Nether Ray", GOSSIP_SENDER_MAIN, 18285);       // Count Ungula
            player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, m_creature->GetGUID());
            break;

            // BEASTS PAGE 2
        case 52:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", GOSSIP_SENDER_MAIN, 50);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Previous..", GOSSIP_SENDER_MAIN, 51);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Next..", GOSSIP_SENDER_MAIN, 53);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Owl", GOSSIP_SENDER_MAIN, 14343);              // Olm the Wise
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Raptor", GOSSIP_SENDER_MAIN, 9684);            // Lar'korwi
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Ravager", GOSSIP_SENDER_MAIN, 22123);          // Rip-blade Ravager
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Scorpid", GOSSIP_SENDER_MAIN, 14476);          // Krellak
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Serpent", GOSSIP_SENDER_MAIN, 28011);          // Emperor Cobra
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Spider", GOSSIP_SENDER_MAIN, 12433);           // Krethis the Shadowspinner
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Spore Bat", GOSSIP_SENDER_MAIN, 18280);        // Sporewing
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Tallstrider", GOSSIP_SENDER_MAIN, 22807);      // Green/Purple
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Turtle", GOSSIP_SENDER_MAIN, 14223);           // Cranky Benj
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Warp Stalker", GOSSIP_SENDER_MAIN, 23163);     // Gezzarak the Huntress
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Wasp", GOSSIP_SENDER_MAIN, 18283);             // Blacksting
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Wind Serpent", GOSSIP_SENDER_MAIN, 5834);      // Azzere the Skyblade
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Wolf", GOSSIP_SENDER_MAIN, 3825);              // Ghostpaw Alpha
            player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, m_creature->GetGUID());
            break;

            // BEASTS PAGE 3
        case 53:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", GOSSIP_SENDER_MAIN, 50);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Previous..", GOSSIP_SENDER_MAIN, 52);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Worg", GOSSIP_SENDER_MAIN, 25791);             // Oil-Stained Wolf
            player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, m_creature->GetGUID());
            break;

            // EXOTIC BEASTS
        case 60:

            // Teach Beast Mastery or Spirit Beasts won't work properly
            if (!(player->HasSpell(53270) || player->HasTalent(53270, player->GetActiveSpec())))
            {
                player->addSpell(53270, SPEC_MASK_ALL, false);
                std::ostringstream messageLearn;
                messageLearn << "I have taught you the art of Beast Mastery " << player->GetName() << ".";
                m_creature->MonsterWhisper(messageLearn.str().c_str(), player);
            }

            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", GOSSIP_SENDER_MAIN, 50);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Chimaera", GOSSIP_SENDER_MAIN, 20932);                     // Nuramoc
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Core Hound", GOSSIP_SENDER_MAIN, 33502);                   // Tame 33502/Lava (11671)/Fire (21108 - Fel/Fire)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Devilsaur", GOSSIP_SENDER_MAIN, 32485);                    // King Krush
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Rhino", GOSSIP_SENDER_MAIN, 25487);                        // Wooly Rhino Matriarch Brown
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Silithid", GOSSIP_SENDER_MAIN, 6582);                      // Clutchmother Zavas
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Jormungar Worm", GOSSIP_SENDER_MAIN, 30422);               // Rattlebore
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Arcturis (Spirit Bear)", GOSSIP_SENDER_MAIN, 38453);       // Arcturis 
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Gondria (Spirit Tiger)", GOSSIP_SENDER_MAIN, 33776);       // Gondria
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Loque'nahak (Spirit Leopard)", GOSSIP_SENDER_MAIN, 32517); // Loque'nahak
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Skoll (Spirit Worg)", GOSSIP_SENDER_MAIN, 35189);          // (Skoll
            player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, m_creature->GetGUID());
            break;

            // RARE Beasts
        case 70:
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", GOSSIP_SENDER_MAIN, 50);

            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Aotona (Bird)", GOSSIP_SENDER_MAIN, 32481);                    // Aotona
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "Mazzranache (Tallstrider)", GOSSIP_SENDER_MAIN, 3068);         // Mazzranache
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, "The Kurken (Wolf Core Hound)", GOSSIP_SENDER_MAIN, 17447);     // The Kurken
            player->PlayerTalkClass->SendGossipMenu(DEFAULT_GOSSIP_MESSAGE, m_creature->GetGUID());
            break;

            // REMOVE PET SKILLS
        case 80:
            for (int i = 0; i < HunterSpells.size(); ++i)
                player->removeSpell(HunterSpells[i], SPEC_MASK_ALL, false); // Remove Hunter Abilities
            player->removeSpell(53270, SPEC_MASK_ALL, false); // Remove Beast Mastery Talent
            player->CLOSE_GOSSIP_MENU();
            break;

            // STABLE
        case GOSSIP_OPTION_STABLEPET:
            player->GetSession()->SendStablePet(m_creature->GetGUID());
            break;

            // VENDOR
        case GOSSIP_OPTION_VENDOR:
            player->GetSession()->SendListInventory(m_creature->GetGUID());
            break;
        }

        // BEASTS
        if (action > 1000)
            CreatePet(player, m_creature, action);
        return true;
    }

};

// Infinite Beast Happiness
class BeastMaster_PlayerScript : public PlayerScript
{
public:
    BeastMaster_PlayerScript()
        : PlayerScript("BeastMaster_PlayerScript")
    {}

    void OnBeforeUpdate(Player* player, uint32 /*p_time*/) override
    {
        if (BeastMasterKeepBeastHappy && player->GetPet())
        {
            Pet* beast = player->GetPet();

            if (beast->getPetType() == HUNTER_PET)
            {
                beast->SetPower(POWER_HAPPINESS, 1048000);
            }
        }
    }
};

void AddBeastMasterScripts()
{
    new BeastMasterConf();
    new BeastMasterAnnounce();
    new BeastMaster();
    new BeastMaster_PlayerScript();
}
