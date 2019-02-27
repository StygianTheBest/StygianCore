/*

# NPC - All Mounts #

_This module was created for [StygianCore](https://rebrand.ly/stygiancoreproject). A World of Warcraft 3.3.5a Solo/LAN repack by StygianTheBest | [GitHub](https://rebrand.ly/stygiangithub) | [Website](https://rebrand.ly/stygianthebest))_

### Description ###
------------------------------------------------------------------------------------------------------------------
- Adds an NPC that will teach all available mounts to the player

### To-Do ###
------------------------------------------------------------------------------------------------------------------
- Remove all mounts not compatible with 3.3.5a

### Data ###
------------------------------------------------------------------------------------------------------------------
- Type: NPC
- Script: All_Mounts_NPC
- Config: Yes
- SQL: Yes
    - NPC ID: 601014


### Version ###
------------------------------------------------------------------------------------------------------------------
- v2019.02.14 - Update AI, Fix Bengal Tiger, Remove Invalid Mounts
- v2018.12.15 - Updated for StygianCore
- v2017.09.03 - Added Bengal Tiger + Tiger Riding
- v2017.08.01 - Release


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

bool AllMountsAnnounceModule;
bool AllMountsTeachBengalTiger;
bool AllMountsEnableAI;

class AllMountsConfig : public WorldScript
{
public:
    AllMountsConfig() : WorldScript("AllMountsConfig_conf") { }

    void OnBeforeConfigLoad(bool reload) override
    {
        if (!reload) {
            std::string conf_path = _CONF_DIR;
            std::string cfg_file = conf_path + "/npc_allmounts.conf";
#ifdef WIN32
            cfg_file = "npc_allmounts.conf";
#endif
            std::string cfg_def_file = cfg_file + ".dist";
            sConfigMgr->LoadMore(cfg_def_file.c_str());
            sConfigMgr->LoadMore(cfg_file.c_str());

            AllMountsAnnounceModule = sConfigMgr->GetBoolDefault("AllMountsNPC.Announce", 1);
            AllMountsTeachBengalTiger = sConfigMgr->GetBoolDefault("AllMountsNPC.TeachBengalTiger", 0);
            AllMountsEnableAI = sConfigMgr->GetBoolDefault("AllMountsNPC.EnableAI", 1);
        }
    }
};

class AllMountsAnnounce : public PlayerScript
{

public:

    AllMountsAnnounce() : PlayerScript("AllMountsAnnounce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (AllMountsAnnounceModule)
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00AllMountsNPC |rmodule.");
        }
    }
};

class All_Mounts_NPC : public CreatureScript
{

public:

    All_Mounts_NPC() : CreatureScript("All_Mounts_NPC") {}

    bool OnGossipHello(Player* player, Creature* creature) override
    {

        std::ostringstream messageKnown;
        messageKnown << "I have already taught you all there is to know " << player->GetName() << ".";

        player->PlayerTalkClass->ClearMenus();

        // If they already know Furor's Fabled Steed, we've probably taught them everything before.
        if (player->HasSpell(24576))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, messageKnown.str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }
        else
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Teach me to ride.. EVERYTHING!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Maybe Next Time", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        }

        player->SEND_GOSSIP_MENU(601014, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player * player, Creature * creature, uint32 sender, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();

        if (sender != GOSSIP_SENDER_MAIN)
            return false;

        switch (uiAction)
        {
        case GOSSIP_ACTION_INFO_DEF + 1:

            // Teaches Bengal Tiger and Tiger Riding
            // Disabled if using the BengalTiger NPC which teaches Tiger Riding
            // on character creation. The tiger is then obtained in the cave.
            if (AllMountsTeachBengalTiger)
            {
                player->learnSpell(828);		// TigerRiding
                player->learnSpell(10790);		// ReinsoftheBengalTiger
            }

            // Add Items
            player->AddItem(20221, 1);  // Add Furor's Fabled Steed

            // Learn Mounts
            player->learnSpell(48778);	// AcherusDeathcharger
            player->learnSpell(60025);	// AlbinoDrake
            player->learnSpell(43688);	// AmaniWarBear
            player->learnSpell(16056);	// AncientFrostsaber
            player->learnSpell(16081);	// ArcticWolf
            player->learnSpell(66906);	// ArgentCharger
            player->learnSpell(63844);	// ArgentHippogryph
            player->learnSpell(66907);	// ArgentWarhorse
            player->learnSpell(67466);	// ArgentWarhorse
            player->learnSpell(61230);	// ArmoredBlueWindRider
            player->learnSpell(60114);	// ArmoredBrownBear
            player->learnSpell(60116);	// ArmoredBrownBear
            player->learnSpell(61229);	// ArmoredSnowyGryphon
            player->learnSpell(40192);	// AshesofAl'ar
            player->learnSpell(59567);	// AzureDrake
            player->learnSpell(41514);	// AzureNetherwingDrake
            player->learnSpell(51412);	// BigBattleBear
            player->learnSpell(58983);	// BigBlizzardBear
            player->learnSpell(71342);	// BigLoveRocket
            player->learnSpell(22719);	// BlackBattlestrider
            player->learnSpell(59650);	// BlackDrake
            player->learnSpell(35022);	// BlackHawkstrider
            player->learnSpell(16055);	// BlackNightsaber
            player->learnSpell(59976);	// BlackProto-Drake
            player->learnSpell(25863);	// BlackQirajiBattleTank
            player->learnSpell(26655);	// BlackQirajiBattleTank
            player->learnSpell(26656);	// BlackQirajiBattleTank
            player->learnSpell(17461);	// BlackRam
            player->learnSpell(64977);	// BlackSkeletalHorse
            player->learnSpell(470);	// BlackStallion
            player->learnSpell(60118);	// BlackWarBear
            player->learnSpell(60119);	// BlackWarBear
            player->learnSpell(48027);	// BlackWarElekk
            player->learnSpell(22718);	// BlackWarKodo
            player->learnSpell(59785);	// BlackWarMammoth
            player->learnSpell(59788);	// BlackWarMammoth
            player->learnSpell(22720);	// BlackWarRam
            player->learnSpell(22721);	// BlackWarRaptor
            player->learnSpell(22717);	// BlackWarSteed
            player->learnSpell(22723);	// BlackWarTiger
            player->learnSpell(22724);	// BlackWarWolf
            player->learnSpell(64658);	// BlackWolf
            player->learnSpell(74856);	// BlazingHippogryph
            player->learnSpell(72808);	// BloodbathedFrostbroodVanquisher
            player->learnSpell(61996);	// BlueDragonhawk
            player->learnSpell(59568);	// BlueDrake
            player->learnSpell(35020);	// BlueHawkstrider
            player->learnSpell(10969);	// BlueMechanostrider
            player->learnSpell(59996);	// BlueProto-Drake
            player->learnSpell(25953);	// BlueQirajiBattleTank
            player->learnSpell(39803);	// BlueRidingNetherRay
            player->learnSpell(17463);	// BlueSkeletalHorse
            player->learnSpell(64656);	// BlueSkeletalWarhorse
            player->learnSpell(32244);	// BlueWindRider
            player->learnSpell(50869);	// BrewfestKodo
            player->learnSpell(43899);	// BrewfestRam
            player->learnSpell(59569);	// BronzeDrake
            player->learnSpell(34406);	// BrownElekk
            player->learnSpell(458);	// BrownHorse
            player->learnSpell(18990);	// BrownKodo
            player->learnSpell(6899);	// BrownRam
            player->learnSpell(17464);	// BrownSkeletalHorse
            player->learnSpell(6654);	// BrownWolf
            player->learnSpell(58615);	// BrutalNetherDrake
            player->learnSpell(75614);	// CelestialSteed
            player->learnSpell(43927);	// CenarionWarHippogryph
            player->learnSpell(6648);	// ChestnutMare
            player->learnSpell(24576);	// Chromatic Drake
            player->learnSpell(41515);	// CobaltNetherwingDrake
            player->learnSpell(39315);	// CobaltRidingTalbuk
            player->learnSpell(34896);	// CobaltWarTalbuk
            player->learnSpell(73313);	// CrimsonDeathcharger
            player->learnSpell(68188);	// Crusader'sBlackWarhorse
            player->learnSpell(68187);	// Crusader'sWhiteWarhorse
            player->learnSpell(39316);	// DarkRidingTalbuk
            player->learnSpell(63635);	// DarkspearRaptor
            player->learnSpell(34790);	// DarkWarTalbuk
            player->learnSpell(63637);	// DarnassianNightsaber
            player->learnSpell(64927);	// DeadlyGladiator'sFrostWyrm
            player->learnSpell(6653);	// DireWolf
            player->learnSpell(32239);	// EbonGryphon
            player->learnSpell(63639);	// ExodarElekk
            player->learnSpell(36702);	// FieryWarhorse
            player->learnSpell(61451);	// FlyingCarpet
            player->learnSpell(44153);	// FlyingMachine
            player->learnSpell(63643);	// ForsakenWarhorse
            player->learnSpell(17460);	// FrostRam
            player->learnSpell(23509);	// FrostwolfHowler
            player->learnSpell(75596);	// FrostyFlyingCarpet
            player->learnSpell(65439);	// FuriousGladiator'sFrostWyrm
            player->learnSpell(63638);	// GnomereganMechanostrider
            player->learnSpell(32235);	// GoldenGryphon
            player->learnSpell(61465);	// GrandBlackWarMammoth
            player->learnSpell(61467);	// GrandBlackWarMammoth
            player->learnSpell(61469);	// GrandIceMammoth
            player->learnSpell(61470);	// GrandIceMammoth
            player->learnSpell(35710);	// GrayElekk
            player->learnSpell(18989);	// GrayKodo
            player->learnSpell(6777);	// GrayRam
            player->learnSpell(35713);	// GreatBlueElekk
            player->learnSpell(49379);	// GreatBrewfestKodo
            player->learnSpell(23249);	// GreatBrownKodo
            player->learnSpell(65641);	// GreatGoldenKodo
            player->learnSpell(23248);	// GreatGrayKodo
            player->learnSpell(35712);	// GreatGreenElekk
            player->learnSpell(35714);	// GreatPurpleElekk
            player->learnSpell(65637);	// GreatRedElekk
            player->learnSpell(23247);	// GreatWhiteKodo
            player->learnSpell(18991);	// GreenKodo
            player->learnSpell(17453);	// GreenMechanostrider
            player->learnSpell(61294);	// GreenProto-Drake
            player->learnSpell(26056);	// GreenQirajiBattleTank
            player->learnSpell(39798);	// GreenRidingNetherRay
            player->learnSpell(17465);	// GreenSkeletalWarhorse
            player->learnSpell(32245);	// GreenWindRider
            player->learnSpell(48025);	// HeadlessHorseman'sMount
            player->learnSpell(72807);	// IceboundFrostbroodVanquisher
            player->learnSpell(59797);	// IceMammoth
            player->learnSpell(59799);	// IceMammoth
            player->learnSpell(17459);	// IcyBlueMechanostriderModA
            player->learnSpell(72286);	// Invincible'sReins
            player->learnSpell(63956);	// IronboundProto-Drake
            player->learnSpell(63636);	// IronforgeRam
            player->learnSpell(17450);	// IvoryRaptor
            player->learnSpell(65917);	// MagicRooster
            player->learnSpell(61309);	// MagnificentFlyingCarpet
            player->learnSpell(55531);	// Mechano-Hog
            player->learnSpell(60424);	// Mekgineer'sChopper
            player->learnSpell(44744);	// MercilessNetherDrake
            player->learnSpell(63796);	// Mimiron'sHead
            player->learnSpell(16084);	// MottledRedRaptor
            player->learnSpell(66846);	// OchreSkeletalWarhorse
            player->learnSpell(69395);	// OnyxianDrake
            player->learnSpell(41513);	// OnyxNetherwingDrake
            player->learnSpell(63640);	// OrgrimmarWolf
            player->learnSpell(16082);	// Palomino
            player->learnSpell(32345);	// PeepthePhoenixMount
            player->learnSpell(472);	// Pinto
            player->learnSpell(60021);	// PlaguedProto-Drake
            player->learnSpell(35711);	// PurpleElekk
            player->learnSpell(35018);	// PurpleHawkstrider
            player->learnSpell(41516);	// PurpleNetherwingDrake
            player->learnSpell(39801);	// PurpleRidingNetherRay
            player->learnSpell(23246);	// PurpleSkeletalWarhorse
            player->learnSpell(66090);	// Quel'doreiSteed
            player->learnSpell(41252);	// RavenLord
            player->learnSpell(61997);	// RedDragonhawk
            player->learnSpell(59570);	// RedDrake
            player->learnSpell(34795);	// RedHawkstrider
            player->learnSpell(10873);	// RedMechanostrider
            player->learnSpell(59961);	// RedProto-Drake
            player->learnSpell(26054);	// RedQirajiBattleTank
            player->learnSpell(39800);	// RedRidingNetherRay
            player->learnSpell(17462);	// RedSkeletalHorse
            player->learnSpell(22722);	// RedSkeletalWarhorse
            player->learnSpell(16080);	// RedWolf
            player->learnSpell(67336);	// RelentlessGladiator'sFrostWyrm
            player->learnSpell(30174);	// RidingTurtle
            player->learnSpell(17481);	// Rivendare'sDeathcharger
            player->learnSpell(63963);	// RustedProto-Drake
            player->learnSpell(64731);	// SeaTurtle
            player->learnSpell(66087);	// SilverCovenantHippogryph
            player->learnSpell(63642);	// SilvermoonHawkstrider
            player->learnSpell(39802);	// SilverRidingNetherRay
            player->learnSpell(39317);	// SilverRidingTalbuk
            player->learnSpell(34898);	// SilverWarTalbuk
            player->learnSpell(32240);	// SnowyGryphon
            player->learnSpell(42776);	// SpectralTiger
            player->learnSpell(10789);	// SpottedFrostsaber
            player->learnSpell(23510);	// StormpikeBattleCharger
            player->learnSpell(63232);	// StormwindSteed
            player->learnSpell(66847);	// StripedDawnsaber
            player->learnSpell(10793);	// StripedNightsaber
            player->learnSpell(66088);	// SunreaverDragonhawk
            player->learnSpell(66091);	// SunreaverHawkstrider
            player->learnSpell(68057);	// SwiftAllianceSteed
            player->learnSpell(32242);	// SwiftBlueGryphon
            player->learnSpell(23241);	// SwiftBlueRaptor
            player->learnSpell(43900);	// SwiftBrewfestRam
            player->learnSpell(23238);	// SwiftBrownRam
            player->learnSpell(23229);	// SwiftBrownSteed
            player->learnSpell(23250);	// SwiftBrownWolf
            player->learnSpell(65646);	// SwiftBurgundyWolf
            player->learnSpell(23221);	// SwiftFrostsaber
            player->learnSpell(23239);	// SwiftGrayRam
            player->learnSpell(65640);	// SwiftGraySteed
            player->learnSpell(23252);	// SwiftGrayWolf
            player->learnSpell(32290);	// SwiftGreenGryphon
            player->learnSpell(35025);	// SwiftGreenHawkstrider
            player->learnSpell(23225);	// SwiftGreenMechanostrider
            player->learnSpell(32295);	// SwiftGreenWindRider
            player->learnSpell(68056);	// SwiftHordeWolf
            player->learnSpell(23219);	// SwiftMistsaber
            player->learnSpell(65638);	// SwiftMoonsaber
            player->learnSpell(37015);	// SwiftNetherDrake
            player->learnSpell(23242);	// SwiftOliveRaptor
            player->learnSpell(23243);	// SwiftOrangeRaptor
            player->learnSpell(23227);	// SwiftPalomino
            player->learnSpell(33660);	// SwiftPinkHawkstrider
            player->learnSpell(32292);	// SwiftPurpleGryphon
            player->learnSpell(35027);	// SwiftPurpleHawkstrider
            player->learnSpell(65644);	// SwiftPurpleRaptor
            player->learnSpell(32297);	// SwiftPurpleWindRider
            player->learnSpell(24242);	// SwiftRazzashiRaptor
            player->learnSpell(32289);	// SwiftRedGryphon
            player->learnSpell(65639);	// SwiftRedHawkstrider
            player->learnSpell(32246);	// SwiftRedWindRider
            player->learnSpell(55164);	// SwiftSpectralGryphon
            player->learnSpell(42777);	// SwiftSpectralTiger
            player->learnSpell(23338);	// SwiftStormsaber
            player->learnSpell(23251);	// SwiftTimberWolf
            player->learnSpell(65643);	// SwiftVioletRam
            player->learnSpell(35028);	// SwiftWarstrider
            player->learnSpell(46628);	// SwiftWhiteHawkstrider
            player->learnSpell(23223);	// SwiftWhiteMechanostrider
            player->learnSpell(23240);	// SwiftWhiteRam
            player->learnSpell(23228);	// SwiftWhiteSteed
            player->learnSpell(23222);	// SwiftYellowMechanostrider
            player->learnSpell(32296);	// SwiftYellowWindRider
            player->learnSpell(49322);	// SwiftZhevra
            player->learnSpell(24252);	// SwiftZulianTiger
            player->learnSpell(39318);	// TanRidingTalbuk
            player->learnSpell(34899);	// TanWarTalbuk
            player->learnSpell(32243);	// TawnyWindRider
            player->learnSpell(18992);	// TealKodo
            player->learnSpell(63641);	// ThunderBluffKodo
            player->learnSpell(580);	// TimberWolf
            player->learnSpell(60002);	// Time-LostProto-Drake
            player->learnSpell(61425);	// Traveler'sTundraMammoth
            player->learnSpell(61447);	// Traveler'sTundraMammoth
            player->learnSpell(44151);	// Turbo-ChargedFlyingMachine
            player->learnSpell(65642);	// Turbostrider
            player->learnSpell(10796);	// TurquoiseRaptor
            player->learnSpell(59571);	// TwilightDrake
            player->learnSpell(17454);	// UnpaintedMechanostrider
            player->learnSpell(49193);	// VengefulNetherDrake
            player->learnSpell(64659);	// VenomhideRavasaur
            player->learnSpell(41517);	// VeridianNetherwingDrake
            player->learnSpell(41518);	// VioletNetherwingDrake
            player->learnSpell(60024);	// VioletProto-Drake
            player->learnSpell(10799);	// VioletRaptor
            player->learnSpell(64657);	// WhiteKodo
            player->learnSpell(15779);	// WhiteMechanostriderModB
            player->learnSpell(54753);	// WhitePolarBear
            player->learnSpell(6898);	// WhiteRam
            player->learnSpell(39319);	// WhiteRidingTalbuk
            player->learnSpell(65645);	// WhiteSkeletalWarhorse
            player->learnSpell(16083);	// WhiteStallion
            player->learnSpell(34897);	// WhiteWarTalbuk
            player->learnSpell(54729);	// WingedSteedoftheEbonBlade
            player->learnSpell(17229);	// WinterspringFrostsaber
            player->learnSpell(59791);	// WoolyMammoth
            player->learnSpell(59793);	// WoolyMammoth
            player->learnSpell(74918);	// WoolyWhiteRhino
            player->learnSpell(71810);	// WrathfulGladiator'sFrostWyrm
            player->learnSpell(46197);	// X-51Nether-Rocket
            player->learnSpell(46199);	// X-51Nether-RocketX-TREME
            player->learnSpell(75973);	// X-53TouringRocket
            player->learnSpell(26055);	// YellowQirajiBattleTank

            // Goodbye
            player->PlayerTalkClass->SendCloseGossip();
            break;

        case GOSSIP_ACTION_INFO_DEF + 2:

            // Goodbye
            player->PlayerTalkClass->SendCloseGossip();
            break;
        }

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
            MessageTimer = urand(60000, 180000); // 1-3 minutes
        }

        // Called at World update tick
        void UpdateAI(const uint32 diff)
        {
            if (AllMountsEnableAI)
            {
                if (MessageTimer <= diff)
                {
                    // Make a random message choice
                    Choice = urand(1, 3);

                    switch (Choice)
                    {
                    case 1:
                    {
                        me->MonsterSay("I can teach you to ride.. anything!", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    case 2:
                    {
                        me->MonsterSay("Have you ever wanted to mount a chicken?", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    case 3:
                    {
                        me->MonsterSay("The finest mounts in all of Azeroth are in my stables.", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    default:
                    {
                        me->MonsterSay("The finest mounts in all of Azeroth are in my stables.", LANG_UNIVERSAL, NULL);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_WAVE);
                        MessageTimer = urand(60000, 180000);
                        break;
                    }
                    }
                }
                else { MessageTimer -= diff; }
            }
        };
    };

    // CREATURE AI
    CreatureAI * GetAI(Creature * creature) const
    {
        return new NPC_PassiveAI(creature);
    }
};

void AddAllMountsNPCScripts()
{
    new AllMountsConfig();
    new AllMountsAnnounce();
    new All_Mounts_NPC();
}
