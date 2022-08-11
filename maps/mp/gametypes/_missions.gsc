// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_CHALLENGE_COMPLETED" );

    if ( !mayprocesschallenges() )
        return;

    level.missioncallbacks = [];
    registermissioncallback( "playerKilled", ::ch_kills );
    registermissioncallback( "playerKilled", ::ch_vehicle_kills );
    registermissioncallback( "playerHardpoint", ::ch_hardpoints );
    registermissioncallback( "playerAssist", ::ch_assists );
    registermissioncallback( "roundEnd", ::ch_roundwin );
    registermissioncallback( "roundEnd", ::ch_roundplayed );
    registermissioncallback( "vehicleKilled", ::ch_vehicle_killed );
    level thread createperkmap();
    level thread onplayerconnect();
}

createperkmap()
{
    level.perkmap = [];
    level.perkmap["specialty_bulletdamage"] = "specialty_stoppingpower";
    level.perkmap["specialty_quieter"] = "specialty_deadsilence";
    level.perkmap["specialty_localjammer"] = "specialty_scrambler";
    level.perkmap["specialty_fastreload"] = "specialty_sleightofhand";
    level.perkmap["specialty_pistoldeath"] = "specialty_laststand";
}

mayprocesschallenges()
{
    return level.rankedmatch;
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["postGameChallenges"] ) )
            var_0.pers["postGameChallenges"] = 0;

        var_0 thread onplayerspawned();
        var_0 thread initmissiondata();
        var_0 thread monitorbombuse();
        var_0 thread monitorfalldistance();
        var_0 thread monitorlivetime();
        var_0 thread monitorstreaks();
        var_0 thread monitorstreakreward();
        var_0 thread monitorscavengerpickup();
        var_0 thread monitorblastshieldsurvival();
        var_0 thread monitortacinsertionsdestroyed();
        var_0 thread monitorprocesschallenge();
        var_0 thread monitorkillstreakprogress();
        var_0 thread monitorfinalstandsurvival();
        var_0 thread monitoradstime();
        var_0 thread monitorweaponswap();
        var_0 thread monitorflashbang();
        var_0 thread monitorconcussion();
        var_0 thread monitorminetriggering();
        var_0 notifyonplayercommand( "hold_breath", "+breath_sprint" );
        var_0 notifyonplayercommand( "release_breath", "-breath_sprint" );
        var_0 thread monitorholdbreath();
        var_0 notifyonplayercommand( "jumped", "+goStand" );
        var_0 thread monitormantle();

        if ( isdefined( level.patientzeroname ) && issubstr( var_0.name, level.patientzeroname ) )
        {
            var_0 setplayerdata( "challengeState", "ch_infected", 2 );
            var_0 setplayerdata( "challengeProgress", "ch_infected", 1 );
            var_0 setplayerdata( "challengeState", "ch_plague", 2 );
            var_0 setplayerdata( "challengeProgress", "ch_plague", 1 );
        }

        var_0 setplayerdata( "round", "weaponsUsed", 0, "none" );
        var_0 setplayerdata( "round", "weaponsUsed", 1, "none" );
        var_0 setplayerdata( "round", "weaponsUsed", 2, "none" );
        var_0 setplayerdata( "round", "weaponXpEarned", 0, 0 );
        var_0 setplayerdata( "round", "weaponXpEarned", 1, 0 );
        var_0 setplayerdata( "round", "weaponXpEarned", 2, 0 );
        var_1 = var_0 getplayerdata( "cardTitle" );
        var_2 = tablelookupbyrow( "mp/cardTitleTable.csv", var_1, 0 );

        if ( var_2 == "cardtitle_infected" )
        {
            var_0.infected = 1;
            continue;
        }

        if ( var_2 == "cardtitle_plague" )
            var_0.plague = 1;
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread monitorsprintdistance();
    }
}

monitorscavengerpickup()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "scavenger_pickup" );

        if ( self isitemunlocked( "specialty_scavenger" ) && maps\mp\_utility::_hasperk( "specialty_scavenger" ) )
            processchallenge( "ch_scavenger_pro" );

        wait 0.05;
    }
}

monitorstreakreward()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "received_earned_killstreak" );

        if ( self isitemunlocked( "specialty_hardline" ) && maps\mp\_utility::_hasperk( "specialty_hardline" ) )
            processchallenge( "ch_hardline_pro" );

        wait 0.05;
    }
}

monitorblastshieldsurvival()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "survived_explosion", var_0 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) && self == var_0 )
            continue;

        if ( self isitemunlocked( "_specialty_blastshield" ) && maps\mp\_utility::_hasperk( "_specialty_blastshield" ) )
            processchallenge( "ch_blastshield_pro" );

        common_scripts\utility::waitframe();
    }
}

monitortacinsertionsdestroyed()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "destroyed_insertion", var_0 );

        if ( self == var_0 )
            return;

        processchallenge( "ch_darkbringer" );
        maps\mp\_utility::incplayerstat( "mosttacprevented", 1 );
        thread maps\mp\gametypes\_hud_message::splashnotify( "denied", 20 );
        var_0 maps\mp\gametypes\_hud_message::playercardsplashnotify( "destroyed_insertion", self );
        common_scripts\utility::waitframe();
    }
}

monitorfinalstandsurvival()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "revive" );
        processchallenge( "ch_livingdead" );
        common_scripts\utility::waitframe();
    }
}

initmissiondata()
{
    var_0 = getarraykeys( level.killstreakfuncs );

    foreach ( var_2 in var_0 )
        self.pers[var_2] = 0;

    self.pers["lastBulletKillTime"] = 0;
    self.pers["bulletStreak"] = 0;
    self.explosiveinfo = [];
}

registermissioncallback( var_0, var_1 )
{
    if ( !isdefined( level.missioncallbacks[var_0] ) )
        level.missioncallbacks[var_0] = [];

    level.missioncallbacks[var_0][level.missioncallbacks[var_0].size] = var_1;
}

getchallengestatus( var_0 )
{
    if ( isdefined( self.challengedata[var_0] ) )
        return self.challengedata[var_0];
    else
        return 0;
}

ch_assists( var_0 )
{
    var_1 = var_0.player;
    var_1 processchallenge( "ch_assists" );
}

ch_hardpoints( var_0 )
{
    var_1 = var_0.player;
    var_1.pers[var_0.hardpointtype]++;

    switch ( var_0.hardpointtype )
    {
        case "uav":
            var_1 processchallenge( "ch_uav" );
            var_1 processchallenge( "ch_assault_streaks" );

            if ( var_1.pers["uav"] >= 3 )
                var_1 processchallenge( "ch_nosecrets" );

            break;
        case "airdrop_assault":
            var_1 processchallenge( "ch_airdrop_assault" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "predator_missile":
            var_1 processchallenge( "ch_predator_missile" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "ims":
            var_1 processchallenge( "ch_ims" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "airdrop_sentry_minigun":
            var_1 processchallenge( "ch_airdrop_sentry_minigun" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "precision_airstrike":
            var_1 processchallenge( "ch_precision_airstrike" );
            var_1 processchallenge( "ch_assault_streaks" );

            if ( var_1.pers["precision_airstrike"] >= 2 )
                var_1 processchallenge( "ch_afterburner" );

            break;
        case "helicopter":
            var_1 processchallenge( "ch_helicopter" );
            var_1 processchallenge( "ch_assault_streaks" );

            if ( var_1.pers["helicopter"] >= 2 )
                var_1 processchallenge( "ch_airsuperiority" );

            break;
        case "littlebird_flock":
            var_1 processchallenge( "ch_littlebird_flock" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "littlebird_support":
            var_1 processchallenge( "ch_littlebird_support" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "remote_mortar":
            var_1 processchallenge( "ch_remote_mortar" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "airdrop_remote_tank":
            var_1 processchallenge( "ch_airdrop_remote_tank" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "helicopter_flares":
            var_1 processchallenge( "ch_helicopter_flares" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "ac130":
            var_1 processchallenge( "ch_ac130" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "airdrop_juggernaut":
            var_1 processchallenge( "ch_airdrop_juggernaut" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "osprey_gunner":
            var_1 processchallenge( "ch_osprey_gunner" );
            var_1 processchallenge( "ch_assault_streaks" );
            break;
        case "uav_support":
            var_1 processchallenge( "ch_uav_support" );
            var_1 processchallenge( "ch_support_streaks" );

            if ( var_1.pers["uav"] >= 3 )
                var_1 processchallenge( "ch_nosecrets" );

            break;
        case "counter_uav":
            var_1 processchallenge( "ch_counter_uav" );
            var_1 processchallenge( "ch_support_streaks" );

            if ( var_1.pers["counter_uav"] >= 3 )
                var_1 processchallenge( "ch_sunblock" );

            break;
        case "deployable_vest":
            var_1 processchallenge( "ch_deployable_vest" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "airdrop_trap":
            var_1 processchallenge( "ch_airdrop_trap" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "sam_turret":
            var_1 processchallenge( "ch_sam_turret" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "remote_uav":
            var_1 processchallenge( "ch_remote_uav" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "triple_uav":
            var_1 processchallenge( "ch_triple_uav" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "remote_mg_turret":
            var_1 processchallenge( "ch_remote_mg_turret" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "stealth_airstrike":
            var_1 processchallenge( "ch_stealth_airstrike" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "emp":
            var_1 processchallenge( "ch_emp" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "airdrop_juggernaut_recon":
            var_1 processchallenge( "ch_airdrop_juggernaut_recon" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "escort_airdrop":
            var_1 processchallenge( "ch_escort_airdrop" );
            var_1 processchallenge( "ch_support_streaks" );
            break;
        case "specialty_longersprint_ks":
        case "specialty_longersprint_ks_pro":
            var_1 processchallenge( "ch_longersprint_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_fastreload_ks":
        case "specialty_fastreload_ks_pro":
            var_1 processchallenge( "ch_fastreload_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_scavenger_ks":
        case "specialty_scavenger_ks_pro":
            var_1 processchallenge( "ch_scavenger_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_blindeye_ks":
        case "specialty_blindeye_ks_pro":
            var_1 processchallenge( "ch_blindeye_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_paint_ks":
        case "specialty_paint_ks_pro":
            var_1 processchallenge( "ch_paint_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_hardline_ks":
        case "specialty_hardline_ks_pro":
            var_1 processchallenge( "ch_hardline_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_coldblooded_ks":
        case "specialty_coldblooded_ks_pro":
            var_1 processchallenge( "ch_coldblooded_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_quickdraw_ks":
        case "specialty_quickdraw_ks_pro":
            var_1 processchallenge( "ch_quickdraw_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "_specialty_blastshield_ks":
        case "_specialty_blastshield_ks_pro":
            var_1 processchallenge( "ch_blastshield_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_detectexplosive_ks":
        case "specialty_detectexplosive_ks_pro":
            var_1 processchallenge( "ch_detectexplosive_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_autospot_ks":
        case "specialty_autospot_ks_pro":
            var_1 processchallenge( "ch_autospot_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_bulletaccuracy_ks":
        case "specialty_bulletaccuracy_ks_pro":
            var_1 processchallenge( "ch_bulletaccuracy_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_quieter_ks":
        case "specialty_quieter_ks_pro":
            var_1 processchallenge( "ch_quieter_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "specialty_stalker_ks":
        case "specialty_stalker_ks_pro":
            var_1 processchallenge( "ch_stalker_ks" );
            var_1 processchallenge( "ch_specialist_streaks" );
            break;
        case "all_perks_bonus":
            var_1 processchallenge( "ch_all_perks_bonus" );
            break;
        case "nuke":
            var_1 processchallenge( "ch_nuke" );
            break;
    }
}

ch_vehicle_kills( var_0 )
{
    if ( !isdefined( var_0.attacker ) || !isplayer( var_0.attacker ) )
        return;

    if ( !maps\mp\_utility::iskillstreakweapon( var_0.sweapon ) )
        return;

    var_1 = var_0.attacker;

    if ( !isdefined( var_1.pers[var_0.sweapon + "_streak"] ) )
        var_1.pers[var_0.sweapon + "_streak"] = 0;

    var_1.pers[var_0.sweapon + "_streak"]++;

    switch ( var_0.sweapon )
    {
        case "artillery_mp":
            var_1 processchallenge( "ch_carpetbomber" );

            if ( var_1.pers[var_0.sweapon + "_streak"] >= 5 )
                var_1 processchallenge( "ch_carpetbomb" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_finishingtouch" );

            break;
        case "stealth_bomb_mp":
            var_1 processchallenge( "ch_thespirit" );

            if ( var_1.pers[var_0.sweapon + "_streak"] >= 6 )
                var_1 processchallenge( "ch_redcarpet" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_technokiller" );

            break;
        case "pavelow_minigun_mp":
            var_1 processchallenge( "ch_jollygreengiant" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_transformer" );

            break;
        case "sentry_minigun_mp":
            var_1 processchallenge( "ch_looknohands" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_absentee" );

            break;
        case "ac130_105mm_mp":
        case "ac130_40mm_mp":
        case "ac130_25mm_mp":
            var_1 processchallenge( "ch_spectre" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_deathfromabove" );

            break;
        case "remotemissile_projectile_mp":
            var_1 processchallenge( "ch_predator" );

            if ( var_1.pers[var_0.sweapon + "_streak"] >= 4 )
                var_1 processchallenge( "ch_reaper" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_dronekiller" );

            break;
        case "cobra_20mm_mp":
            var_1 processchallenge( "ch_choppervet" );

            if ( isdefined( var_1.finalkill ) )
                var_1 processchallenge( "ch_og" );

            break;
        case "nuke_mp":
            var_0.victim processchallenge( "ch_radiationsickness" );
            break;
        default:
            break;
    }
}

ch_vehicle_killed( var_0 )
{
    if ( !isdefined( var_0.attacker ) || !isplayer( var_0.attacker ) )
        return;

    var_1 = var_0.attacker;
}

clearidshortly( var_0 )
{
    self endon( "disconnect" );
    self notify( "clearing_expID_" + var_0 );
    self endon( "clearing_expID_" + var_0 );
    wait 3.0;
    self.explosivekills[var_0] = undefined;
}

mgkill()
{
    var_0 = self;

    if ( !isdefined( var_0.pers["MGStreak"] ) )
    {
        var_0.pers["MGStreak"] = 0;
        var_0 thread endmgstreakwhenleavemg();

        if ( !isdefined( var_0.pers["MGStreak"] ) )
            return;
    }

    var_0.pers["MGStreak"]++;

    if ( var_0.pers["MGStreak"] >= 5 )
        var_0 processchallenge( "ch_mgmaster" );
}

endmgstreakwhenleavemg()
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( !isalive( self ) || self usebuttonpressed() )
        {
            self.pers["MGStreak"] = undefined;
            break;
        }

        wait 0.05;
    }
}

endmgstreak()
{
    self.pers["MGStreak"] = undefined;
}

killedbestenemyplayer( var_0 )
{
    if ( !isdefined( self.pers["countermvp_streak"] ) || !var_0 )
        self.pers["countermvp_streak"] = 0;

    self.pers["countermvp_streak"]++;

    if ( self.pers["countermvp_streak"] == 3 )
        processchallenge( "ch_thebiggertheyare" );
    else if ( self.pers["countermvp_streak"] == 5 )
        processchallenge( "ch_thehardertheyfall" );

    if ( self.pers["countermvp_streak"] >= 10 )
        processchallenge( "ch_countermvp" );
}

ishighestscoringplayer( var_0 )
{
    if ( !isdefined( var_0.score ) || var_0.score < 1 )
        return 0;

    var_1 = level.players;

    if ( level.teambased )
        var_2 = var_0.pers["team"];
    else
        var_2 = "all";

    var_3 = var_0.score;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( !isdefined( var_1[var_4].score ) )
            continue;

        if ( var_1[var_4].score < 1 )
            continue;

        if ( var_2 != "all" && var_1[var_4].pers["team"] != var_2 )
            continue;

        if ( var_1[var_4].score > var_3 )
            return 0;
    }

    return 1;
}

ch_kills( var_0, var_1 )
{
    var_0.victim playerdied();

    if ( !isdefined( var_0.attacker ) || !isplayer( var_0.attacker ) )
        return;

    var_2 = var_0.attacker;
    var_1 = var_0.time;

    if ( var_2.pers["cur_kill_streak"] == 10 )
        var_2 processchallenge( "ch_fearless" );

    if ( level.teambased )
    {
        if ( level.teamcount[var_0.victim.pers["team"]] > 3 && var_2.killedplayers.size >= level.teamcount[var_0.victim.pers["team"]] )
            var_2 processchallenge( "ch_tangodown" );

        if ( level.teamcount[var_0.victim.pers["team"]] > 3 && var_2.killedplayerscurrent.size >= level.teamcount[var_0.victim.pers["team"]] )
            var_2 processchallenge( "ch_extremecruelty" );
    }

    if ( isdefined( var_0.victim.inplayersmokescreen ) && var_0.victim.inplayersmokescreen == var_2 )
        var_2 processchallenge( "ch_smokeemifyougotem" );

    if ( isdefined( var_0.victim.inplayerscrambler ) && var_0.victim.inplayerscrambler == var_2 )
        var_2 processchallenge( "ch_scram" );

    if ( isdefined( var_0.victim.inplayerportableradar ) && var_0.victim.inplayerportableradar == var_2 )
        var_2 processchallenge( "ch_zerolatency" );

    if ( isdefined( var_2.killedplayers[var_0.victim.guid] ) && var_2.killedplayers[var_0.victim.guid] == 5 )
        var_2 processchallenge( "ch_rival" );

    if ( isdefined( var_2.tookweaponfrom[var_0.sweapon] ) )
    {
        if ( var_2.tookweaponfrom[var_0.sweapon] == var_0.victim && var_0.smeansofdeath != "MOD_MELEE" )
            var_2 processchallenge( "ch_cruelty" );
    }

    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = 1;
    var_7[var_0.victim.name] = var_0.victim.name;
    var_8[var_0.sweapon] = var_0.sweapon;
    var_9 = 1;
    var_10 = [];

    foreach ( var_12 in var_2.killsthislife )
    {
        if ( maps\mp\_utility::iscacsecondaryweapon( var_12.sweapon ) && var_12.smeansofdeath != "MOD_MELEE" )
            var_4++;

        if ( isdefined( var_12.modifiers["longshot"] ) )
            var_5++;

        if ( var_1 - var_12.time < 10000 )
            var_6++;

        if ( maps\mp\_utility::iskillstreakweapon( var_12.sweapon ) )
        {
            if ( !isdefined( var_10[var_12.sweapon] ) )
                var_10[var_12.sweapon] = 0;

            var_10[var_12.sweapon]++;
            continue;
        }

        if ( isdefined( level.onelefttime[var_2.team] ) && var_12.time > level.onelefttime[var_2.team] )
            var_3++;

        if ( isdefined( var_12.victim ) )
        {
            if ( !isdefined( var_7[var_12.victim.name] ) && !isdefined( var_8[var_12.sweapon] ) && !maps\mp\_utility::iskillstreakweapon( var_12.sweapon ) )
                var_9++;

            var_7[var_12.victim.name] = var_12.victim.name;
        }

        var_8[var_12.sweapon] = var_12.sweapon;
    }

    foreach ( var_16, var_15 in var_10 )
    {
        if ( var_15 >= 10 )
            var_2 processchallenge( "ch_crabmeat" );
    }

    if ( var_9 == 3 )
        var_2 processchallenge( "ch_renaissance" );

    if ( var_6 > 3 && level.teamcount[var_0.victim.team] <= var_6 )
        var_2 processchallenge( "ch_omnicide" );

    if ( maps\mp\_utility::iscacsecondaryweapon( var_0.sweapon ) && var_4 == 2 )
        var_2 processchallenge( "ch_sidekick" );

    if ( isdefined( var_0.modifiers["longshot"] ) && var_5 == 2 )
        var_2 processchallenge( "ch_nbk" );

    if ( isdefined( level.onelefttime[var_2.team] ) && var_3 == 2 )
        var_2 processchallenge( "ch_enemyofthestate" );

    if ( var_2 isitemunlocked( "specialty_twoprimaries" ) && var_2 maps\mp\_utility::_hasperk( "specialty_twoprimaries" ) && var_2.secondaryweapon == var_0.sweapon )
        var_2 processchallenge( "ch_twoprimaries_pro" );

    if ( var_0.victim.score > 0 )
    {
        if ( level.teambased )
        {
            var_17 = var_0.victim.pers["team"];

            if ( isdefined( var_17 ) && var_17 != var_2.pers["team"] )
            {
                if ( ishighestscoringplayer( var_0.victim ) && level.players.size >= 6 )
                    var_2 killedbestenemyplayer( 1 );
                else
                    var_2 killedbestenemyplayer( 0 );
            }
        }
        else if ( ishighestscoringplayer( var_0.victim ) && level.players.size >= 4 )
            var_2 killedbestenemyplayer( 1 );
        else
            var_2 killedbestenemyplayer( 0 );
    }

    if ( isdefined( var_0.modifiers["avenger"] ) )
        var_2 processchallenge( "ch_avenger" );

    if ( isdefined( var_0.modifiers["buzzkill"] ) && var_0.modifiers["buzzkill"] >= 9 )
        var_2 processchallenge( "ch_thedenier" );

    if ( maps\mp\_utility::iskillstreakweapon( var_0.sweapon ) )
        return;

    if ( isdefined( var_0.modifiers["jackintheboxkill"] ) )
        var_2 processchallenge( "ch_jackinthebox" );

    if ( isdefined( var_0.modifiers["cooking"] ) )
        var_2 processchallenge( "ch_no" );

    if ( isdefined( var_2.finalkill ) )
    {
        var_2 processchallenge( "ch_theedge" );

        if ( isdefined( var_0.modifiers["revenge"] ) )
            var_2 processchallenge( "ch_moneyshot" );
    }

    if ( var_2 isatbrinkofdeath() )
    {
        var_2.brinkofdeathkillstreak++;

        if ( var_2.brinkofdeathkillstreak >= 3 )
            var_2 processchallenge( "ch_thebrink" );
    }

    if ( isdefined( var_2.infinalstand ) && var_2.infinalstand )
    {
        if ( isdefined( var_0.modifiers["revenge"] ) )
            var_2 processchallenge( "ch_robinhood" );

        if ( isdefined( var_2.finalkill ) )
            var_2 processchallenge( "ch_lastresort" );

        if ( maps\mp\_utility::isstrstart( var_0.sweapon, "c4_" ) )
            var_2 processchallenge( "ch_clickclickboom" );

        var_2 processchallenge( "ch_laststandvet" );
    }

    if ( var_0.smeansofdeath == "MOD_PISTOL_BULLET" || var_0.smeansofdeath == "MOD_RIFLE_BULLET" )
    {
        var_18 = maps\mp\_utility::getweaponclass( var_0.sweapon );
        ch_bulletdamagecommon( var_0, var_2, var_1, var_18 );

        if ( maps\mp\_utility::isenvironmentweapon( var_0.sweapon ) )
            var_2 mgkill();
        else
        {
            var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );

            if ( isdefined( level.challengeinfo["ch_marksman_" + var_19] ) )
                var_2 processchallenge( "ch_marksman_" + var_19 );

            if ( isdefined( level.challengeinfo["pr_marksman_" + var_19] ) )
                var_2 processchallenge( "pr_marksman_" + var_19 );

            var_18 = tablelookup( "mp/statstable.csv", 4, var_19, 2 );

            switch ( var_18 )
            {
                case "weapon_smg":
                    var_2 processchallenge( "ch_smg_kill" );
                    break;
                case "weapon_assault":
                    var_2 processchallenge( "ch_ar_kill" );
                    break;
                case "weapon_shotgun":
                    var_2 processchallenge( "ch_shotgun_kill" );
                    break;
                case "weapon_sniper":
                    var_2 processchallenge( "ch_sniper_kill" );
                    break;
                case "weapon_handgun":
                    var_2 processchallenge( "ch_handgun_kill" );
                    break;
                case "weapon_machine_pistol":
                    var_2 processchallenge( "ch_machine_pistols_kill" );
                    break;
                default:
            }
        }
    }
    else if ( issubstr( var_0.smeansofdeath, "MOD_GRENADE" ) || issubstr( var_0.smeansofdeath, "MOD_EXPLOSIVE" ) || issubstr( var_0.smeansofdeath, "MOD_PROJECTILE" ) )
    {
        if ( maps\mp\_utility::isstrstart( var_0.sweapon, "frag_grenade_short" ) && ( !isdefined( var_0.victim.explosiveinfo["throwbackKill"] ) || !var_0.victim.explosiveinfo["throwbackKill"] ) )
            var_2 processchallenge( "ch_martyr" );

        if ( isdefined( var_0.victim.explosiveinfo["damageTime"] ) && var_0.victim.explosiveinfo["damageTime"] == var_1 )
        {
            if ( var_0.sweapon == "none" )
                var_0.sweapon = var_0.victim.explosiveinfo["weapon"];

            var_20 = var_1 + "_" + var_0.victim.explosiveinfo["damageId"];

            if ( !isdefined( var_2.explosivekills[var_20] ) )
                var_2.explosivekills[var_20] = 0;

            var_2 thread clearidshortly( var_20 );
            var_2.explosivekills[var_20]++;
            var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );

            if ( var_19 == "javelin" || var_19 == "m79" || var_19 == "at4" || var_19 == "rpg" || var_19 == "iw5_smaw" )
            {
                var_2 processchallenge( "ch_launcher_kill" );

                if ( var_2.explosivekills[var_20] > 1 )
                    var_2 processchallenge( "pr_expert_" + var_19 );
            }

            var_21 = maps\mp\_utility::getweaponattachments( var_0.sweapon );

            foreach ( var_23 in var_21 )
            {
                switch ( var_23 )
                {
                    case "gl":
                    case "m320":
                    case "gp25":
                        if ( maps\mp\_utility::isstrstart( var_0.sweapon, "alt_" ) )
                            var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                        continue;
                }
            }

            if ( isdefined( var_0.victim.explosiveinfo["stickKill"] ) && var_0.victim.explosiveinfo["stickKill"] )
            {
                if ( isdefined( var_0.modifiers["revenge"] ) )
                    var_2 processchallenge( "ch_overdraft" );

                if ( isdefined( var_2.finalkill ) )
                    var_2 processchallenge( "ch_stickman" );

                if ( var_2.explosivekills[var_20] > 1 )
                    var_2 processchallenge( "ch_grouphug" );
            }

            if ( isdefined( var_0.victim.explosiveinfo["stickFriendlyKill"] ) && var_0.victim.explosiveinfo["stickFriendlyKill"] )
                var_2 processchallenge( "ch_resourceful" );

            if ( !issubstr( var_19, "stinger" ) )
            {
                if ( isdefined( level.challengeinfo["ch_marksman_" + var_19] ) )
                    var_2 processchallenge( "ch_marksman_" + var_19 );

                if ( isdefined( level.challengeinfo["pr_marksman_" + var_19] ) )
                    var_2 processchallenge( "pr_marksman_" + var_19 );
            }

            if ( maps\mp\_utility::isstrstart( var_0.sweapon, "frag_" ) )
            {
                if ( var_2.explosivekills[var_20] > 1 )
                    var_2 processchallenge( "ch_multifrag" );

                if ( isdefined( var_0.modifiers["revenge"] ) )
                    var_2 processchallenge( "ch_bangforbuck" );

                var_2 processchallenge( "ch_grenadekill" );

                if ( var_0.victim.explosiveinfo["cookedKill"] )
                    var_2 processchallenge( "ch_masterchef" );

                if ( var_0.victim.explosiveinfo["suicideGrenadeKill"] )
                    var_2 processchallenge( "ch_miserylovescompany" );

                if ( var_0.victim.explosiveinfo["throwbackKill"] )
                    var_2 processchallenge( "ch_hotpotato" );
            }
            else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "semtex_" ) )
            {
                if ( isdefined( var_0.modifiers["revenge"] ) )
                    var_2 processchallenge( "ch_timeismoney" );
            }
            else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "c4_" ) )
            {
                if ( isdefined( var_0.modifiers["revenge"] ) )
                    var_2 processchallenge( "ch_iamrich" );

                if ( var_2.explosivekills[var_20] > 1 )
                    var_2 processchallenge( "ch_multic4" );

                if ( var_0.victim.explosiveinfo["returnToSender"] )
                    var_2 processchallenge( "ch_returntosender" );

                if ( var_0.victim.explosiveinfo["counterKill"] )
                    var_2 processchallenge( "ch_counterc4" );

                if ( var_0.victim.explosiveinfo["bulletPenetrationKill"] )
                    var_2 processchallenge( "ch_howthe" );

                if ( var_0.victim.explosiveinfo["chainKill"] )
                    var_2 processchallenge( "ch_dominos" );

                var_2 processchallenge( "ch_c4shot" );
            }
            else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "claymore_" ) )
            {
                if ( isdefined( var_0.modifiers["revenge"] ) )
                    var_2 processchallenge( "ch_breakbank" );

                var_2 processchallenge( "ch_claymoreshot" );

                if ( var_2.explosivekills[var_20] > 1 )
                    var_2 processchallenge( "ch_multiclaymore" );

                if ( var_0.victim.explosiveinfo["returnToSender"] )
                    var_2 processchallenge( "ch_returntosender" );

                if ( var_0.victim.explosiveinfo["counterKill"] )
                    var_2 processchallenge( "ch_counterclaymore" );

                if ( var_0.victim.explosiveinfo["bulletPenetrationKill"] )
                    var_2 processchallenge( "ch_howthe" );

                if ( var_0.victim.explosiveinfo["chainKill"] )
                    var_2 processchallenge( "ch_dominos" );
            }
            else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "bouncingbetty_" ) )
                var_2 processchallenge( "ch_bouncingbetty" );
            else if ( var_0.sweapon == "explodable_barrel" )
            {

            }
            else if ( var_0.sweapon == "destructible_car" )
                var_2 processchallenge( "ch_carbomb" );
            else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "rpg_" ) || maps\mp\_utility::isstrstart( var_0.sweapon, "at4_" ) || maps\mp\_utility::isstrstart( var_0.sweapon, "iw5_smaw_" ) )
            {
                if ( var_2.explosivekills[var_20] > 1 )
                    var_2 processchallenge( "ch_multirpg" );
            }
        }
    }
    else if ( issubstr( var_0.smeansofdeath, "MOD_MELEE" ) && !issubstr( var_0.sweapon, "riotshield_mp" ) )
    {
        var_2 endmgstreak();
        var_2 processchallenge( "ch_knifevet" );
        var_2.pers["meleeKillStreak"]++;

        if ( var_2.pers["meleeKillStreak"] == 3 )
            var_2 processchallenge( "ch_slasher" );

        if ( var_2 isitemunlocked( "specialty_quieter" ) && var_2 maps\mp\_utility::_hasperk( "specialty_quieter" ) )
            var_2 processchallenge( "ch_deadsilence_pro" );

        var_25 = var_0.victim.anglesondeath[1];
        var_26 = var_2.anglesonkill[1];
        var_27 = angleclamp180( var_25 - var_26 );

        if ( abs( var_27 ) < 30 )
        {
            var_2 processchallenge( "ch_backstabber" );

            if ( isdefined( var_2.attackers ) )
            {
                foreach ( var_29 in var_2.attackers )
                {
                    if ( var_29 != var_0.victim )
                        continue;

                    var_2 processchallenge( "ch_neverforget" );
                    break;
                }
            }
        }

        if ( !var_2 playerhasammo() )
            var_2 processchallenge( "ch_survivor" );

        if ( isdefined( var_2.infected ) )
            var_0.victim processchallenge( "ch_infected" );

        if ( isdefined( var_0.victim.plague ) )
            var_2 processchallenge( "ch_plague" );

        var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );
        var_21 = maps\mp\_utility::getweaponattachments( var_0.sweapon );

        foreach ( var_23 in var_21 )
        {
            switch ( var_23 )
            {
                case "tactical":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    if ( isdefined( level.challengeinfo["ch_marksman_" + var_19] ) )
                        var_2 processchallenge( "ch_marksman_" + var_19 );

                    if ( isdefined( level.challengeinfo["pr_marksman_" + var_19] ) )
                        var_2 processchallenge( "pr_marksman_" + var_19 );

                    continue;
            }
        }
    }
    else if ( issubstr( var_0.smeansofdeath, "MOD_MELEE" ) && issubstr( var_0.sweapon, "riotshield_mp" ) )
    {
        var_2 endmgstreak();
        var_2 processchallenge( "ch_shieldvet" );
        var_2.pers["shieldKillStreak"]++;

        if ( var_2.pers["shieldKillStreak"] == 3 )
            var_2 processchallenge( "ch_smasher" );

        if ( isdefined( var_2.finalkill ) )
            var_2 processchallenge( "ch_owned" );

        var_2 processchallenge( "ch_riot_kill" );
        var_25 = var_0.victim.anglesondeath[1];
        var_26 = var_2.anglesonkill[1];
        var_27 = angleclamp180( var_25 - var_26 );

        if ( abs( var_27 ) < 30 )
            var_2 processchallenge( "ch_backsmasher" );

        if ( !var_2 playerhasammo() )
            var_2 processchallenge( "ch_survivor" );
    }
    else if ( issubstr( var_0.smeansofdeath, "MOD_IMPACT" ) )
    {
        if ( maps\mp\_utility::isstrstart( var_0.sweapon, "frag_" ) )
            var_2 processchallenge( "ch_thinkfast" );
        else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "concussion_" ) )
            var_2 processchallenge( "ch_thinkfastconcussion" );
        else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "flash_" ) )
            var_2 processchallenge( "ch_thinkfastflash" );

        if ( var_0.sweapon == "throwingknife_mp" )
        {
            if ( isdefined( var_0.modifiers["revenge"] ) )
                var_2 processchallenge( "ch_atm" );

            if ( var_1 < var_2.flashendtime || var_1 < var_2.concussionendtime )
                var_2 processchallenge( "ch_didyouseethat" );

            if ( isdefined( var_2.finalkill ) )
                var_2 processchallenge( "ch_unbelievable" );

            var_2 processchallenge( "ch_carnie" );

            if ( isdefined( var_0.victim.attackerdata[var_2.guid].isprimary ) )
                var_2 processchallenge( "ch_its_personal" );
        }

        var_21 = maps\mp\_utility::getweaponattachments( var_0.sweapon );
        var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );

        foreach ( var_23 in var_21 )
        {
            switch ( var_23 )
            {
                case "gl":
                case "m320":
                case "gp25":
                    if ( maps\mp\_utility::isstrstart( var_0.sweapon, "alt_" ) )
                    {
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                        if ( isdefined( level.challengeinfo["ch_marksman_" + var_19] ) )
                            var_2 processchallenge( "ch_marksman_" + var_19 );

                        if ( isdefined( level.challengeinfo["pr_marksman_" + var_19] ) )
                            var_2 processchallenge( "pr_marksman_" + var_19 );

                        var_2 processchallenge( "ch_ouch" );
                    }

                    continue;
            }
        }
    }
    else if ( var_0.smeansofdeath == "MOD_HEAD_SHOT" )
    {
        var_18 = maps\mp\_utility::getweaponclass( var_0.sweapon );
        ch_bulletdamagecommon( var_0, var_2, var_1, var_18 );

        switch ( var_18 )
        {
            case "weapon_smg":
                var_2 processchallenge( "ch_expert_smg" );
                break;
            case "weapon_lmg":
                var_2 processchallenge( "ch_expert_lmg" );
                break;
            case "weapon_assault":
                var_2 processchallenge( "ch_expert_assault" );
                break;
        }

        if ( isdefined( var_0.modifiers["revenge"] ) )
            var_2 processchallenge( "ch_colorofmoney" );

        if ( maps\mp\_utility::isenvironmentweapon( var_0.sweapon ) )
            var_2 mgkill();
        else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "frag_" ) )
            var_2 processchallenge( "ch_thinkfast" );
        else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "concussion_" ) )
            var_2 processchallenge( "ch_thinkfastconcussion" );
        else if ( maps\mp\_utility::isstrstart( var_0.sweapon, "flash_" ) )
            var_2 processchallenge( "ch_thinkfastflash" );
        else
        {
            var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );

            if ( isdefined( level.challengeinfo["ch_expert_" + var_19] ) )
                var_2 processchallenge( "ch_expert_" + var_19 );

            if ( isdefined( level.challengeinfo["pr_expert_" + var_19] ) )
                var_2 processchallenge( "pr_expert_" + var_19 );

            if ( isdefined( level.challengeinfo["ch_marksman_" + var_19] ) )
                var_2 processchallenge( "ch_marksman_" + var_19 );

            if ( isdefined( level.challengeinfo["pr_marksman_" + var_19] ) )
                var_2 processchallenge( "pr_marksman_" + var_19 );
        }
    }

    if ( ( var_0.smeansofdeath == "MOD_PISTOL_BULLET" || var_0.smeansofdeath == "MOD_RIFLE_BULLET" || var_0.smeansofdeath == "MOD_HEAD_SHOT" ) && !maps\mp\_utility::iskillstreakweapon( var_0.sweapon ) && !maps\mp\_utility::isenvironmentweapon( var_0.sweapon ) )
    {
        var_21 = maps\mp\_utility::getweaponattachments( var_0.sweapon );
        var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );

        foreach ( var_23 in var_21 )
        {
            switch ( var_23 )
            {
                case "acog":
                case "acogsmg":
                    var_23 = "acog";

                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "akimbo":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );
                    continue;
                case "eotech":
                case "eotechsmg":
                case "eotechlmg":
                    var_23 = "eotech";

                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "grip":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );
                    continue;
                case "heartbeat":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );
                    continue;
                case "hamrhybrid":
                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "hybrid":
                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "reflex":
                case "reflexsmg":
                case "reflexlmg":
                    var_23 = "reflex";

                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "rof":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );
                    continue;
                case "shotgun":
                    if ( maps\mp\_utility::isstrstart( var_0.sweapon, "alt_" ) )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "silencer02":
                case "silencer03":
                case "silencer":
                case "silencer01":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );
                    continue;
                case "thermal":
                case "thermalsmg":
                    var_23 = "thermal";

                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "vzscope":
                    if ( var_2 playerads() )
                        var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );

                    continue;
                case "xmags":
                    var_2 processchallenge( "ch_" + var_19 + "_" + var_23 );
                    continue;
                default:
                    continue;
            }
        }

        if ( var_2 isitemunlocked( "specialty_autospot" ) && var_2 maps\mp\_utility::_hasperk( "specialty_autospot" ) && ( var_2.holdingbreath && var_2 playerads() ) )
            var_2 processchallenge( "ch_autospot_pro" );

        if ( var_2 isitemunlocked( "specialty_bulletaccuracy" ) && var_2 maps\mp\_utility::_hasperk( "specialty_bulletaccuracy" ) && !var_2 playerads() )
            var_2 processchallenge( "ch_bulletaccuracy_pro" );

        if ( var_2 isitemunlocked( "specialty_stalker" ) && var_2 maps\mp\_utility::_hasperk( "specialty_stalker" ) && var_2 playerads() )
            var_2 processchallenge( "ch_stalker_pro" );

        if ( distancesquared( var_2.origin, var_0.victim.origin ) < 65536 )
        {
            if ( var_2 isitemunlocked( "specialty_quieter" ) && var_2 maps\mp\_utility::_hasperk( "specialty_quieter" ) )
                var_2 processchallenge( "ch_deadsilence_pro" );
        }

        if ( var_2 isitemunlocked( "specialty_fastreload" ) && var_2 maps\mp\_utility::_hasperk( "specialty_fastreload" ) )
            var_2 processchallenge( "ch_sleightofhand_pro" );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_marksman", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_marksman", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_marksman" ) && var_2 playerads() )
            var_2 processchallenge( "ch_kickstop" );

        if ( var_0.victim.idflagstime == var_1 )
        {
            if ( var_0.victim.idflags & level.idflags_penetration )
            {
                if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_bulletpenetration", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_bulletpenetration", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_bulletpenetration" ) )
                    var_2 processchallenge( "ch_xrayvision" );
            }
        }

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_bling", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_bling", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_bling" ) && var_21.size > 1 )
            var_2 processchallenge( "ch_blingbling" );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_sharp_focus", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_sharp_focus", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_sharp_focus" ) && var_2.health < var_2.maxhealth && isdefined( var_2.attackers ) )
        {
            foreach ( var_29 in var_2.attackers )
            {
                if ( var_29 == var_0.victim )
                {
                    var_2 processchallenge( "ch_unshakeable" );
                    break;
                }
            }
        }

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_holdbreathwhileads", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_holdbreathwhileads", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_holdbreathwhileads" ) && ( var_2.holdingbreath && var_2 playerads() ) )
            var_2 processchallenge( "ch_holditrightthere" );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_reducedsway", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_reducedsway", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_reducedsway" ) && var_2 playerads() )
            var_2 processchallenge( "ch_swayless" );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_longerrange", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_longerrange", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_longerrange" ) )
            var_2 processchallenge( "ch_longishshot" );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_lightweight", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_lightweight", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_lightweight" ) )
            var_2 processchallenge( "ch_lightweight" );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_moredamage", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_moredamage", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_moredamage" ) )
            var_2 processchallenge( "ch_moredamage" );
    }

    if ( var_0.smeansofdeath == "MOD_MELEE" )
    {
        var_19 = maps\mp\_utility::getbaseweaponname( var_0.sweapon );

        if ( var_2 maps\mp\_utility::isbuffunlockedforweapon( "specialty_fastermelee", var_19 ) && var_2 maps\mp\_utility::isbuffequippedonweapon( "specialty_fastermelee", var_19 ) && var_2 maps\mp\_utility::_hasperk( "specialty_fastermelee" ) )
            var_2 processchallenge( "ch_coldsteel" );
    }

    if ( var_2 isitemunlocked( "specialty_quickdraw" ) && var_2 maps\mp\_utility::_hasperk( "specialty_quickdraw" ) && ( var_2.adstime > 0 && var_2.adstime < 3 ) )
        var_2 processchallenge( "ch_quickdraw_pro" );

    if ( var_2 isitemunlocked( "specialty_coldblooded" ) && var_2 maps\mp\_utility::_hasperk( "specialty_coldblooded" ) )
    {
        if ( level.teambased )
        {
            var_39 = 0;

            foreach ( var_41 in level.uavmodels[maps\mp\_utility::getotherteam( var_2.team )] )
            {
                switch ( var_41.uavtype )
                {
                    case "remote_mortar":
                    case "counter":
                        continue;
                }

                var_39 = 1;
                break;
            }

            if ( var_39 )
                var_2 processchallenge( "ch_coldblooded_pro" );
        }
        else
        {
            var_43 = 0;

            foreach ( var_45 in level.players )
            {
                if ( var_45 == var_2 )
                    continue;

                var_43 += level.activeuavs[var_45.guid];
            }

            if ( var_43 > 0 )
                var_2 processchallenge( "ch_coldblooded_pro" );
        }
    }

    if ( var_2 isitemunlocked( "specialty_empimmune" ) && var_2 maps\mp\_utility::_hasperk( "specialty_empimmune" ) )
    {
        if ( level.teambased )
        {
            var_47 = 0;

            foreach ( var_49 in level.uavmodels[maps\mp\_utility::getotherteam( var_2.team )] )
            {
                if ( var_49.uavtype != "counter" )
                    continue;

                var_47 = 1;
                break;
            }

            if ( var_47 || var_2 maps\mp\_utility::isemped() )
                var_2 processchallenge( "ch_spygame" );
        }
        else if ( var_2.isradarblocked || var_2 maps\mp\_utility::isemped() )
            var_2 processchallenge( "ch_spygame" );
    }

    if ( isdefined( var_0.victim.isplanting ) && var_0.victim.isplanting )
        var_2 processchallenge( "ch_bombplanter" );

    if ( isdefined( var_0.victim.isdefusing ) && var_0.victim.isdefusing )
        var_2 processchallenge( "ch_bombdefender" );

    if ( isdefined( var_0.victim.isbombcarrier ) && var_0.victim.isbombcarrier && ( !isdefined( level.dd ) || !level.dd ) )
        var_2 processchallenge( "ch_bombdown" );

    if ( isdefined( var_0.victim.wasti ) && var_0.victim.wasti )
        var_2 processchallenge( "ch_tacticaldeletion" );

    if ( var_2 isitemunlocked( "specialty_quickswap" ) && var_2 maps\mp\_utility::_hasperk( "specialty_quickswap" ) )
    {
        if ( isdefined( var_2.lastprimaryweaponswaptime ) && gettime() - var_2.lastprimaryweaponswaptime < 3000 )
            var_2 processchallenge( "ch_quickswap" );
    }

    if ( var_2 isitemunlocked( "specialty_extraammo" ) && var_2 maps\mp\_utility::_hasperk( "specialty_extraammo" ) )
        var_2 processchallenge( "ch_extraammo" );

    if ( isexplosivedamagemod( var_0.smeansofdeath ) )
    {
        switch ( var_0.sweapon )
        {
            case "concussion_grenade_mp":
            case "frag_grenade_mp":
            case "flash_grenade_mp":
            case "semtex_mp":
            case "emp_grenade_mp":
            case "throwingkinfe_mp":
                if ( var_2 isitemunlocked( "specialty_fastoffhand" ) && var_2 maps\mp\_utility::_hasperk( "specialty_fastoffhand" ) )
                    var_2 processchallenge( "ch_fastoffhand" );

                break;
        }
    }

    if ( var_2 isitemunlocked( "specialty_overkillpro" ) && var_2 maps\mp\_utility::_hasperk( "specialty_overkillpro" ) )
    {
        if ( var_2.secondaryweapon == var_0.sweapon )
        {
            var_21 = maps\mp\_utility::getweaponattachments( var_0.sweapon );

            if ( var_21.size > 0 )
                var_2 processchallenge( "ch_secondprimary" );
        }
    }

    if ( var_2 isitemunlocked( "specialty_stun_resistance" ) && var_2 maps\mp\_utility::_hasperk( "specialty_stun_resistance" ) )
    {
        if ( isdefined( var_2.lastflashedtime ) && gettime() - var_2.lastflashedtime < 5000 )
            var_2 processchallenge( "ch_stunresistance" );
        else if ( isdefined( var_2.lastconcussedtime ) && gettime() - var_2.lastconcussedtime < 5000 )
            var_2 processchallenge( "ch_stunresistance" );
    }

    if ( var_2 isitemunlocked( "specialty_selectivehearing" ) && var_2 maps\mp\_utility::_hasperk( "specialty_selectivehearing" ) )
        var_2 processchallenge( "ch_selectivehearing" );

    if ( var_2 isitemunlocked( "specialty_fastsprintrecovery" ) && var_2 maps\mp\_utility::_hasperk( "specialty_fastsprintrecovery" ) )
    {
        if ( isdefined( var_2.lastsprintendtime ) && gettime() - var_2.lastsprintendtime < 3000 )
            var_2 processchallenge( "ch_fastsprintrecovery" );
    }
}

ch_bulletdamagecommon( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::isenvironmentweapon( var_0.sweapon ) )
        var_1 endmgstreak();

    if ( maps\mp\_utility::iskillstreakweapon( var_0.sweapon ) )
        return;

    if ( var_1.pers["lastBulletKillTime"] == var_2 )
        var_1.pers["bulletStreak"]++;
    else
        var_1.pers["bulletStreak"] = 1;

    var_1.pers["lastBulletKillTime"] = var_2;

    if ( !var_0.victimonground )
        var_1 processchallenge( "ch_hardlanding" );

    if ( !var_0.attackeronground )
        var_1.pers["midairStreak"]++;

    if ( var_1.pers["midairStreak"] == 2 )
        var_1 processchallenge( "ch_airborne" );

    if ( var_2 < var_0.victim.flashendtime )
        var_1 processchallenge( "ch_flashbangvet" );

    if ( var_2 < var_1.flashendtime )
        var_1 processchallenge( "ch_blindfire" );

    if ( var_2 < var_0.victim.concussionendtime )
        var_1 processchallenge( "ch_concussionvet" );

    if ( var_2 < var_1.concussionendtime )
        var_1 processchallenge( "ch_slowbutsure" );

    if ( var_1.pers["bulletStreak"] == 2 )
    {
        if ( isdefined( var_0.modifiers["headshot"] ) )
        {
            foreach ( var_5 in var_1.killsthislife )
            {
                if ( var_5.time != var_2 )
                    continue;

                if ( !isdefined( var_0.modifiers["headshot"] ) )
                    continue;

                var_1 processchallenge( "ch_allpro" );
            }
        }

        if ( var_3 == "weapon_sniper" )
            var_1 processchallenge( "ch_collateraldamage" );
    }

    if ( var_3 == "weapon_pistol" )
    {
        if ( isdefined( var_0.victim.attackerdata ) && isdefined( var_0.victim.attackerdata[var_1.guid] ) )
        {
            if ( isdefined( var_0.victim.attackerdata[var_1.guid].isprimary ) )
                var_1 processchallenge( "ch_fastswap" );
        }
    }

    if ( !isdefined( var_1.infinalstand ) || !var_1.infinalstand )
    {
        if ( var_0.attackerstance == "crouch" )
            var_1 processchallenge( "ch_crouchshot" );
        else if ( var_0.attackerstance == "prone" )
        {
            var_1 processchallenge( "ch_proneshot" );

            if ( var_3 == "weapon_sniper" )
                var_1 processchallenge( "ch_invisible" );
        }
    }

    if ( var_3 == "weapon_sniper" )
    {
        if ( isdefined( var_0.modifiers["oneshotkill"] ) )
            var_1 processchallenge( "ch_ghillie" );
    }

    if ( issubstr( var_0.sweapon, "silencer" ) )
        var_1 processchallenge( "ch_stealthvet" );
}

ch_roundplayed( var_0 )
{
    var_1 = var_0.player;

    if ( var_1.wasaliveatmatchstart )
    {
        var_2 = var_1.pers["deaths"];
        var_3 = var_1.pers["kills"];
        var_4 = 1000000;

        if ( var_2 > 0 )
            var_4 = var_3 / var_2;

        if ( var_4 >= 5.0 && var_3 >= 5.0 )
            var_1 processchallenge( "ch_starplayer" );

        if ( var_2 == 0 && maps\mp\_utility::gettimepassed() > 300000 )
            var_1 processchallenge( "ch_flawless" );

        if ( level.placement["all"].size < 3 )
            return;

        if ( var_1.score > 0 )
        {
            switch ( level.gametype )
            {
                case "dm":
                    if ( var_0.place < 3 )
                    {
                        var_1 processchallenge( "ch_victor_dm" );
                        var_1 processchallenge( "ch_ffa_win" );
                    }

                    var_1 processchallenge( "ch_ffa_participate" );
                    break;
                case "war":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_war_win" );

                    var_1 processchallenge( "ch_war_participate" );
                    break;
                case "kc":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_kc_win" );

                    var_1 processchallenge( "ch_kc_participate" );
                    break;
                case "dd":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_dd_win" );

                    var_1 processchallenge( "ch_dd_participate" );
                    break;
                case "koth":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_koth_win" );

                    var_1 processchallenge( "ch_koth_participate" );
                    break;
                case "sab":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_sab_win" );

                    var_1 processchallenge( "ch_sab_participate" );
                    break;
                case "sd":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_sd_win" );

                    var_1 processchallenge( "ch_sd_participate" );
                    break;
                case "dom":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_dom_win" );

                    var_1 processchallenge( "ch_dom_participate" );
                    break;
                case "ctf":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_ctf_win" );

                    var_1 processchallenge( "ch_ctf_participate" );
                    break;
                case "tdef":
                    if ( var_0.winner )
                        var_1 processchallenge( "ch_tdef_win" );

                    var_1 processchallenge( "ch_tdef_participate" );
                    break;
            }
        }
    }
}

ch_roundwin( var_0 )
{
    if ( !var_0.winner )
        return;

    var_1 = var_0.player;

    if ( var_1.wasaliveatmatchstart )
    {
        switch ( level.gametype )
        {
            case "war":
                if ( level.hardcoremode )
                {
                    var_1 processchallenge( "ch_teamplayer_hc" );

                    if ( var_0.place == 0 )
                        var_1 processchallenge( "ch_mvp_thc" );
                }
                else
                {
                    var_1 processchallenge( "ch_teamplayer" );

                    if ( var_0.place == 0 )
                        var_1 processchallenge( "ch_mvp_tdm" );
                }

                break;
            case "sab":
                var_1 processchallenge( "ch_victor_sab" );
                break;
            case "sd":
                var_1 processchallenge( "ch_victor_sd" );
                break;
            case "dm":
            case "koth":
            case "dom":
            case "ctf":
            case "hc":
                break;
            default:
                break;
        }
    }
}

playerdamaged( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( var_1 ) )
        var_1 endon( "disconnect" );

    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();
    var_6 = spawnstruct();
    var_6.victim = self;
    var_6.einflictor = var_0;
    var_6.attacker = var_1;
    var_6.idamage = var_2;
    var_6.smeansofdeath = var_3;
    var_6.sweapon = var_4;
    var_6.shitloc = var_5;
    var_6.victimonground = var_6.victim isonground();

    if ( isplayer( var_1 ) )
    {
        var_6.attackerinlaststand = isdefined( var_6.attacker.laststand );
        var_6.attackeronground = var_6.attacker isonground();
        var_6.attackerstance = var_6.attacker getstance();
    }
    else
    {
        var_6.attackerinlaststand = 0;
        var_6.attackeronground = 0;
        var_6.attackerstance = "stand";
    }

    domissioncallback( "playerDamaged", var_6 );
}

playerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self.anglesondeath = self getplayerangles();

    if ( isdefined( var_1 ) )
        var_1.anglesonkill = var_1 getplayerangles();

    self endon( "disconnect" );
    var_8 = spawnstruct();
    var_8.victim = self;
    var_8.einflictor = var_0;
    var_8.attacker = var_1;
    var_8.idamage = var_2;
    var_8.smeansofdeath = var_3;
    var_8.sweapon = var_4;
    var_8.sprimaryweapon = var_5;
    var_8.shitloc = var_6;
    var_8.time = gettime();
    var_8.modifiers = var_7;
    var_8.victimonground = var_8.victim isonground();

    if ( isplayer( var_1 ) )
    {
        var_8.attackerinlaststand = isdefined( var_8.attacker.laststand );
        var_8.attackeronground = var_8.attacker isonground();
        var_8.attackerstance = var_8.attacker getstance();
    }
    else
    {
        var_8.attackerinlaststand = 0;
        var_8.attackeronground = 0;
        var_8.attackerstance = "stand";
    }

    waitandprocessplayerkilledcallback( var_8 );

    if ( isdefined( var_1 ) && maps\mp\_utility::isreallyalive( var_1 ) )
        var_1.killsthislife[var_1.killsthislife.size] = var_8;

    var_8.attacker notify( "playerKilledChallengesProcessed" );
}

vehiclekilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawnstruct();
    var_7.vehicle = var_1;
    var_7.victim = var_0;
    var_7.einflictor = var_2;
    var_7.attacker = var_3;
    var_7.idamage = var_4;
    var_7.smeansofdeath = var_5;
    var_7.sweapon = var_6;
    var_7.time = gettime();

    if ( isdefined( var_3 ) && isplayer( var_3 ) && ( !isdefined( var_0 ) || var_3 != var_0 ) && !maps\mp\_utility::iskillstreakweapon( var_6 ) )
    {
        var_3 maps\mp\killstreaks\_killstreaks::giveadrenaline( "vehicleDestroyed" );

        switch ( var_6 )
        {
            case "stinger_mp":
                if ( isdefined( var_1.helitype ) && ( var_1.helitype == "flares" || var_1.helitype == "littlebird" || var_1.helitype == "helicopter" || var_1.helitype == "airdrop" ) )
                    var_3 processchallenge( "pr_expert_stinger" );

                var_3 processchallenge( "ch_marksman_stinger" );
                var_3 processchallenge( "pr_marksman_stinger" );
                break;
            default:
                var_8 = maps\mp\_utility::getbaseweaponname( var_6 );

                if ( isdefined( level.challengeinfo["ch_marksman_" + var_8] ) )
                    var_3 processchallenge( "ch_marksman_" + var_8 );

                if ( isdefined( level.challengeinfo["pr_marksman_" + var_8] ) )
                    var_3 processchallenge( "pr_marksman_" + var_8 );

                break;
        }

        switch ( var_6 )
        {
            case "stinger_mp":
            case "iw5_smaw_mp":
            case "javelin_mp":
                if ( var_3 isitemunlocked( "specialty_fasterlockon" ) && var_3 maps\mp\_utility::_hasperk( "specialty_fasterlockon" ) )
                    var_3 processchallenge( "ch_fasterlockon" );

                break;
        }

        if ( var_3 isitemunlocked( "specialty_blindeye" ) && var_3 maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
        {
            var_9 = 1;

            if ( isdefined( var_3.scramproxyperk ) && var_3.scramproxyperk )
                var_9 = 0;

            if ( isdefined( var_3.spawnperk ) && var_3.spawnperk )
                var_9 = 0;

            if ( var_9 )
                var_3 processchallenge( "ch_blindeye_pro" );
        }
    }
}

waitandprocessplayerkilledcallback( var_0 )
{
    if ( isdefined( var_0.attacker ) )
        var_0.attacker endon( "disconnect" );

    self.processingkilledchallenges = 1;
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();
    domissioncallback( "playerKilled", var_0 );
    self.processingkilledchallenges = undefined;
}

playerassist()
{
    var_0 = spawnstruct();
    var_0.player = self;
    domissioncallback( "playerAssist", var_0 );
}

usehardpoint( var_0 )
{
    self endon( "disconnect" );
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();
    var_1 = spawnstruct();
    var_1.player = self;
    var_1.hardpointtype = var_0;
    domissioncallback( "playerHardpoint", var_1 );
}

roundbegin()
{
    domissioncallback( "roundBegin" );
}

roundend( var_0 )
{
    var_1 = spawnstruct();

    if ( level.teambased )
    {
        var_2 = "allies";

        for ( var_3 = 0; var_3 < level.placement[var_2].size; var_3++ )
        {
            var_1.player = level.placement[var_2][var_3];
            var_1.winner = var_2 == var_0;
            var_1.place = var_3;
            domissioncallback( "roundEnd", var_1 );
        }

        var_2 = "axis";

        for ( var_3 = 0; var_3 < level.placement[var_2].size; var_3++ )
        {
            var_1.player = level.placement[var_2][var_3];
            var_1.winner = var_2 == var_0;
            var_1.place = var_3;
            domissioncallback( "roundEnd", var_1 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level.placement["all"].size; var_3++ )
        {
            var_1.player = level.placement["all"][var_3];
            var_1.winner = isdefined( var_0 ) && isplayer( var_0 ) && var_1.player == var_0;
            var_1.place = var_3;
            domissioncallback( "roundEnd", var_1 );
        }
    }
}

domissioncallback( var_0, var_1 )
{
    if ( !mayprocesschallenges() )
        return;

    if ( getdvarint( "disable_challenges" ) > 0 )
        return;

    if ( !isdefined( level.missioncallbacks[var_0] ) )
        return;

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < level.missioncallbacks[var_0].size; var_2++ )
            thread [[ level.missioncallbacks[var_0][var_2] ]]( var_1 );
    }
    else
    {
        for ( var_2 = 0; var_2 < level.missioncallbacks[var_0].size; var_2++ )
            thread [[ level.missioncallbacks[var_0][var_2] ]]();
    }
}

monitorsprintdistance()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "sprint_begin" );
        self.sprintdistthissprint = 0;
        thread monitorsprinttime();
        monitorsinglesprintdistance();

        if ( self isitemunlocked( "specialty_longersprint" ) && maps\mp\_utility::_hasperk( "specialty_longersprint" ) )
            processchallenge( "ch_longersprint_pro", int( self.sprintdistthissprint / 12 ) );
    }
}

monitorsinglesprintdistance()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "sprint_end" );
    var_0 = self.origin;

    for (;;)
    {
        wait 0.1;
        self.sprintdistthissprint += distance( self.origin, var_0 );
        var_0 = self.origin;
    }
}

monitorsprinttime()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = gettime();
    self waittill( "sprint_end" );
    var_1 = int( gettime() - var_0 );
    maps\mp\_utility::incplayerstat( "sprinttime", var_1 );
    self.lastsprintendtime = gettime();
}

monitorfalldistance()
{
    self endon( "disconnect" );
    self.pers["midairStreak"] = 0;

    for (;;)
    {
        if ( !isalive( self ) )
        {
            self waittill( "spawned_player" );
            continue;
        }

        if ( !self isonground() )
        {
            self.pers["midairStreak"] = 0;
            var_0 = self.origin[2];

            while ( !self isonground() && isalive( self ) )
            {
                if ( self.origin[2] > var_0 )
                    var_0 = self.origin[2];

                wait 0.05;
            }

            self.pers["midairStreak"] = 0;
            var_1 = var_0 - self.origin[2];

            if ( var_1 < 0 )
                var_1 = 0;

            if ( var_1 / 12.0 > 15 && isalive( self ) )
                processchallenge( "ch_basejump" );

            if ( var_1 / 12.0 > 30 && !isalive( self ) )
                processchallenge( "ch_goodbye" );
        }

        wait 0.05;
    }
}

lastmansd()
{
    if ( !mayprocesschallenges() )
        return;

    if ( !self.wasaliveatmatchstart )
        return;

    if ( self.teamkillsthisround > 0 )
        return;

    processchallenge( "ch_lastmanstanding" );
}

monitorbombuse()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = common_scripts\utility::waittill_any_return( "bomb_planted", "bomb_defused" );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 == "bomb_planted" )
        {
            processchallenge( "ch_saboteur" );
            continue;
        }

        if ( var_0 == "bomb_defused" )
            processchallenge( "ch_hero" );
    }
}

monitorlivetime()
{
    for (;;)
    {
        self waittill( "spawned_player" );
        thread survivalistchallenge();
    }
}

survivalistchallenge()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 300;

    if ( isdefined( self ) )
        processchallenge( "ch_survivalist" );
}

monitorstreaks()
{
    self endon( "disconnect" );
    self.pers["airstrikeStreak"] = 0;
    self.pers["meleeKillStreak"] = 0;
    self.pers["shieldKillStreak"] = 0;
    thread monitormisc();

    for (;;)
    {
        self waittill( "death" );
        self.pers["airstrikeStreak"] = 0;
        self.pers["meleeKillStreak"] = 0;
        self.pers["shieldKillStreak"] = 0;
    }
}

monitormisc()
{
    thread monitormiscsingle( "destroyed_explosive" );
    thread monitormiscsingle( "begin_airstrike" );
    thread monitormiscsingle( "destroyed_car" );
    thread monitormiscsingle( "destroyed_helicopter" );
    thread monitormiscsingle( "used_uav" );
    thread monitormiscsingle( "used_double_uav" );
    thread monitormiscsingle( "used_triple_uav" );
    thread monitormiscsingle( "used_counter_uav" );
    thread monitormiscsingle( "used_directional_uav" );
    thread monitormiscsingle( "used_airdrop" );
    thread monitormiscsingle( "used_emp" );
    thread monitormiscsingle( "used_nuke" );
    thread monitormiscsingle( "crushed_enemy" );
    self waittill( "disconnect" );
    self notify( "destroyed_explosive" );
    self notify( "begin_airstrike" );
    self notify( "destroyed_car" );
    self notify( "destroyed_helicopter" );
}

monitormiscsingle( var_0 )
{
    for (;;)
    {
        self waittill( var_0 );

        if ( !isdefined( self ) )
            return;

        monitormisccallback( var_0 );
    }
}

monitormisccallback( var_0 )
{
    switch ( var_0 )
    {
        case "begin_airstrike":
            self.pers["airstrikeStreak"] = 0;
            break;
        case "destroyed_explosive":
            if ( self isitemunlocked( "specialty_detectexplosive" ) && maps\mp\_utility::_hasperk( "specialty_detectexplosive" ) )
                processchallenge( "ch_detectexplosives_pro" );

            processchallenge( "ch_backdraft" );
            break;
        case "destroyed_helicopter":
            processchallenge( "ch_flyswatter" );
            break;
        case "destroyed_car":
            processchallenge( "ch_vandalism" );
            break;
        case "crushed_enemy":
            processchallenge( "ch_heads_up" );

            if ( isdefined( self.finalkill ) )
                processchallenge( "ch_droppincrates" );

            break;
    }
}

healthregenerated()
{
    if ( !isalive( self ) )
        return;

    if ( !mayprocesschallenges() )
        return;

    if ( !maps\mp\_utility::rankingenabled() )
        return;

    thread resetbrinkofdeathkillstreakshortly();
    self notify( "healed" );

    if ( isdefined( self.lastdamagewasfromenemy ) && self.lastdamagewasfromenemy )
    {
        self.healthregenerationstreak++;

        if ( self.healthregenerationstreak >= 5 )
            processchallenge( "ch_invincible" );
    }
}

resetbrinkofdeathkillstreakshortly()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "damage" );
    wait 1;
    self.brinkofdeathkillstreak = 0;
}

playerspawned()
{
    self.brinkofdeathkillstreak = 0;
    self.healthregenerationstreak = 0;
    self.pers["MGStreak"] = 0;
}

playerdied()
{
    self.brinkofdeathkillstreak = 0;
    self.healthregenerationstreak = 0;
    self.pers["MGStreak"] = 0;
}

isatbrinkofdeath()
{
    var_0 = self.health / self.maxhealth;
    return var_0 <= level.healthoverlaycutoff;
}

processchallenge( var_0, var_1, var_2 )
{
    if ( !mayprocesschallenges() )
        return;

    if ( level.players.size < 2 )
        return;

    if ( !maps\mp\_utility::rankingenabled() )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !issubstr( var_0, "_daily" ) && !issubstr( var_0, "_weekly" ) && self isitemunlocked( "tier_90" ) )
    {
        thread processchallenge( var_0 + "_daily", var_1, var_2 );
        thread processchallenge( var_0 + "_weekly", var_1, var_2 );
    }

    var_3 = getchallengestatus( var_0 );

    if ( var_3 == 0 )
        return;

    if ( var_3 > level.challengeinfo[var_0]["targetval"].size )
        return;

    var_4 = maps\mp\gametypes\_hud_util::ch_getprogress( var_0 );

    if ( isdefined( var_2 ) && var_2 )
        var_5 = var_1;
    else
        var_5 = var_4 + var_1;

    var_6 = level.challengeinfo[var_0]["targetval"][var_3];

    if ( var_5 >= var_6 )
    {
        var_7 = 1;
        var_5 = var_6;
    }
    else
        var_7 = 0;

    if ( var_4 < var_5 )
        maps\mp\gametypes\_hud_util::ch_setprogress( var_0, var_5 );

    if ( var_7 )
    {
        thread giverankxpafterwait( var_0, var_3 );
        maps\mp\_matchdata::logchallenge( var_0, var_3 );

        if ( !isdefined( self.challengescompleted ) )
            self.challengescompleted = [];

        var_8 = 0;

        foreach ( var_10 in self.challengescompleted )
        {
            if ( var_10 == var_0 )
                var_8 = 1;
        }

        if ( !var_8 )
            self.challengescompleted[self.challengescompleted.size] = var_0;

        var_3++;
        maps\mp\gametypes\_hud_util::ch_setstate( var_0, var_3 );
        self.challengedata[var_0] = var_3;
        thread maps\mp\gametypes\_hud_message::challengesplashnotify( var_0 );
    }
}

giverankxpafterwait( var_0, var_1 )
{
    self endon( "disconnect" );
    wait 0.25;
    maps\mp\gametypes\_rank::giverankxp( "challenge", level.challengeinfo[var_0]["reward"][var_1], undefined, undefined, var_0 );
}

getmarksmanunlockattachment( var_0, var_1 )
{
    return tablelookup( "mp/unlockTable.csv", 0, var_0, 4 + var_1 );
}

getweaponattachment( var_0, var_1 )
{
    return tablelookup( "mp/statsTable.csv", 4, var_0, 11 + var_1 );
}

masterychallengeprocess( var_0 )
{
    if ( tablelookup( "mp/allChallengesTable.csv", 0, "ch_" + var_0 + "_mastery", 1 ) == "" )
        return;

    var_1 = 0;

    for ( var_2 = 0; var_2 <= 10; var_2++ )
    {
        var_3 = getweaponattachment( var_0, var_2 );

        if ( var_3 == "" )
            continue;

        if ( maps\mp\gametypes\_class::isattachmentunlocked( var_0, var_3 ) )
            var_1++;
    }

    processchallenge( "ch_" + var_0 + "_mastery", var_1, 1 );
}

updatechallenges()
{
    self.challengedata = [];
    self endon( "disconnect" );

    if ( !mayprocesschallenges() )
        return;

    if ( !self isitemunlocked( "challenges" ) )
        return;

    var_0 = 0;

    foreach ( var_13, var_2 in level.challengeinfo )
    {
        var_0++;

        if ( var_0 % 40 == 0 )
            wait 0.05;

        self.challengedata[var_13] = 0;

        if ( isweaponchallenge( var_13 ) )
        {
            var_3 = getweaponfromchallenge( var_13 );

            if ( !self isitemunlocked( var_3 ) )
                continue;

            var_4 = getweaponattachmentfromchallenge( var_13 );

            if ( isdefined( var_4 ) )
            {
                if ( !maps\mp\gametypes\_class::isattachmentunlocked( var_3, var_4 ) )
                    continue;
            }
        }
        else if ( iskillstreakchallenge( var_13 ) )
        {
            if ( !self isitemunlocked( var_13 ) )
                continue;

            var_5 = getkillstreakfromchallenge( var_13 );

            if ( isdefined( var_5 ) )
            {
                if ( !self getplayerdata( "killstreakUnlocked", var_5 ) )
                    continue;
            }
        }
        else
        {
            var_6 = self isitemunlocked( var_13 );

            if ( var_6 == 0 )
                continue;
            else if ( var_6 == 2 )
            {
                var_7 = getchallengefilter( var_13 );

                if ( var_7 != "" )
                {
                    var_8 = getchallengetable( var_7 );

                    if ( var_8 != "" )
                    {
                        var_9 = gettierfromtable( var_8, var_13 );

                        if ( var_9 != "" )
                        {
                            if ( !self isitemunlocked( var_9 ) )
                                continue;
                        }
                    }
                }
            }
        }

        if ( isdefined( var_2["requirement"] ) && !self isitemunlocked( var_2["requirement"] ) )
            continue;

        if ( var_2["type"] == 1 )
        {
            var_10 = maps\mp\gametypes\_hud_util::getdailyref( var_13 );

            if ( var_10 == "" )
                continue;
        }
        else if ( var_2["type"] == 2 )
        {
            var_11 = maps\mp\gametypes\_hud_util::getweeklyref( var_13 );

            if ( var_11 == "" )
                continue;
        }

        var_12 = maps\mp\gametypes\_hud_util::ch_getstate( var_13 );

        if ( var_12 == 0 )
        {
            maps\mp\gametypes\_hud_util::ch_setstate( var_13, 1 );
            var_12 = 1;
        }

        self.challengedata[var_13] = var_12;
    }
}

isinunlocktable( var_0 )
{
    return tablelookup( "mp/unlockTable.csv", 0, var_0, 0 ) != "";
}

getchallengefilter( var_0 )
{
    return tablelookup( "mp/allChallengesTable.csv", 0, var_0, 5 );
}

getchallengetable( var_0 )
{
    return tablelookup( "mp/challengeTable.csv", 8, var_0, 4 );
}

gettierfromtable( var_0, var_1 )
{
    return tablelookup( var_0, 0, var_1, 1 );
}

isweaponchallenge( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = getchallengefilter( var_0 );

    if ( isdefined( var_1 ) && var_1 == "riotshield" )
        return 1;

    var_2 = strtok( var_0, "_" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( var_4 == "iw5" )
            var_4 = var_2[var_3] + "_" + var_2[var_3 + 1];

        if ( maps\mp\gametypes\_class::isvalidprimary( var_4, 0 ) || maps\mp\gametypes\_class::isvalidsecondary( var_4, "specialty_null", "specialty_null", 0 ) )
            return 1;
    }

    return 0;
}

getweaponfromchallenge( var_0 )
{
    var_1 = "ch_";

    if ( issubstr( var_0, "ch_marksman_" ) )
        var_1 = "ch_marksman_";
    else if ( issubstr( var_0, "ch_expert_" ) )
        var_1 = "ch_expert_";
    else if ( issubstr( var_0, "pr_marksman_" ) )
        var_1 = "pr_marksman_";
    else if ( issubstr( var_0, "pr_expert_" ) )
        var_1 = "pr_expert_";

    var_2 = getsubstr( var_0, var_1.size, var_0.size );
    var_3 = strtok( var_2, "_" );
    var_2 = undefined;

    if ( var_3[0] == "iw5" )
        var_2 = var_3[0] + "_" + var_3[1];
    else
        var_2 = var_3[0];

    return var_2;
}

getweaponattachmentfromchallenge( var_0 )
{
    var_1 = "ch_";

    if ( issubstr( var_0, "ch_marksman_" ) )
        var_1 = "ch_marksman_";
    else if ( issubstr( var_0, "ch_expert_" ) )
        var_1 = "ch_expert_";
    else if ( issubstr( var_0, "pr_marksman_" ) )
        var_1 = "pr_marksman_";
    else if ( issubstr( var_0, "pr_expert_" ) )
        var_1 = "pr_expert_";

    var_2 = getsubstr( var_0, var_1.size, var_0.size );
    var_3 = strtok( var_2, "_" );
    var_4 = undefined;

    if ( isdefined( var_3[2] ) && maps\mp\_utility::isattachment( var_3[2] ) )
        var_4 = var_3[2];

    return var_4;
}

iskillstreakchallenge( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = getchallengefilter( var_0 );

    if ( isdefined( var_1 ) && ( var_1 == "killstreaks_assault" || var_1 == "killstreaks_support" ) )
        return 1;

    return 0;
}

getkillstreakfromchallenge( var_0 )
{
    var_1 = "ch_";
    var_2 = getsubstr( var_0, var_1.size, var_0.size );

    if ( var_2 == "assault_streaks" || var_2 == "support_streaks" )
        var_2 = undefined;

    return var_2;
}

challenge_targetval( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 6 + ( var_2 - 1 ) * 2 );
    return int( var_3 );
}

challenge_rewardval( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 7 + ( var_2 - 1 ) * 2 );
    return int( var_3 );
}

buildchallengetableinfo( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;
    var_4 = tablelookupbyrow( var_0, 0, 0 );

    for ( var_2 = 1; var_4 != ""; var_2++ )
    {
        level.challengeinfo[var_4] = [];
        level.challengeinfo[var_4]["type"] = var_1;
        level.challengeinfo[var_4]["targetval"] = [];
        level.challengeinfo[var_4]["reward"] = [];

        for ( var_5 = 1; var_5 < 11; var_5++ )
        {
            var_6 = challenge_targetval( var_0, var_4, var_5 );
            var_7 = challenge_rewardval( var_0, var_4, var_5 );

            if ( var_6 == 0 )
                break;

            level.challengeinfo[var_4]["targetval"][var_5] = var_6;
            level.challengeinfo[var_4]["reward"][var_5] = var_7;
            var_3 += var_7;
        }

        var_4 = tablelookupbyrow( var_0, var_2, 0 );
    }

    return int( var_3 );
}

buildchallegeinfo()
{
    level.challengeinfo = [];
    var_0 = 0;
    var_0 += buildchallengetableinfo( "mp/allChallengesTable.csv", 0 );
    var_0 += buildchallengetableinfo( "mp/dailychallengesTable.csv", 1 );
    var_0 += buildchallengetableinfo( "mp/weeklychallengesTable.csv", 2 );
    var_1 = tablelookupbyrow( "mp/challengeTable.csv", 0, 4 );

    for ( var_2 = 1; var_1 != ""; var_2++ )
    {
        var_3 = tablelookupbyrow( var_1, 0, 0 );

        for ( var_4 = 1; var_3 != ""; var_4++ )
        {
            var_5 = tablelookup( var_1, 0, var_3, 1 );

            if ( var_5 != "" )
                level.challengeinfo[var_3]["requirement"] = var_5;

            var_3 = tablelookupbyrow( var_1, var_4, 0 );
        }

        var_1 = tablelookupbyrow( "mp/challengeTable.csv", var_2, 4 );
    }
}

monitorprocesschallenge()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        if ( !mayprocesschallenges() )
            return;

        self waittill( "process", var_0 );
        processchallenge( var_0 );
    }
}

monitorkillstreakprogress()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "got_killstreak", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        switch ( var_0 )
        {
            case 3:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "3streak" );
                break;
            case 4:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "4streak" );
                break;
            case 5:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "5streak" );
                break;
            case 6:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "6streak" );
                break;
            case 7:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "7streak" );
                break;
            case 8:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "8streak" );
                break;
            case 9:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "9streak" );
                break;
            case 10:
                maps\mp\killstreaks\_killstreaks::giveadrenaline( "10streak" );
                break;
            default:
                break;
        }

        if ( var_0 == 10 && self.killstreaks.size == 0 )
        {
            processchallenge( "ch_theloner" );
            continue;
        }

        if ( var_0 == 9 )
        {
            if ( isdefined( self.killstreaks[7] ) && isdefined( self.killstreaks[8] ) && isdefined( self.killstreaks[9] ) )
                processchallenge( "ch_6fears7" );
        }
    }
}

monitorkilledkillstreak()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "destroyed_killstreak", var_0 );

        if ( self isitemunlocked( "specialty_blindeye" ) && maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
            processchallenge( "ch_blindeye_pro" );

        if ( isdefined( var_0 ) && var_0 == "stinger_mp" )
        {
            processchallenge( "ch_marksman_stinger" );
            processchallenge( "pr_marksman_stinger" );
        }
    }
}

genericchallenge( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "hijacker_airdrop":
            processchallenge( "ch_smoothcriminal" );
            break;
        case "hijacker_airdrop_mega":
            processchallenge( "ch_poolshark" );
            break;
        case "wargasm":
            processchallenge( "ch_wargasm" );
            break;
        case "weapon_assault":
            processchallenge( "ch_surgical_assault" );
            break;
        case "weapon_smg":
            processchallenge( "ch_surgical_smg" );
            break;
        case "weapon_lmg":
            processchallenge( "ch_surgical_lmg" );
            break;
        case "weapon_sniper":
            processchallenge( "ch_surgical_sniper" );
            break;
        case "shield_damage":
            if ( !maps\mp\_utility::isjuggernaut() )
                processchallenge( "ch_shield_damage", var_1 );

            break;
        case "shield_bullet_hits":
            if ( !maps\mp\_utility::isjuggernaut() )
                processchallenge( "ch_shield_bullet", var_1 );

            break;
        case "shield_explosive_hits":
            if ( !maps\mp\_utility::isjuggernaut() )
                processchallenge( "ch_shield_explosive", var_1 );

            break;
    }
}

playerhasammo()
{
    var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( self getweaponammoclip( var_2 ) )
            return 1;

        var_3 = weaponaltweaponname( var_2 );

        if ( !isdefined( var_3 ) || var_3 == "none" )
            continue;

        if ( self getweaponammoclip( var_3 ) )
            return 1;
    }

    return 0;
}

monitoradstime()
{
    self endon( "disconnect" );
    self.adstime = 0.0;

    for (;;)
    {
        if ( self playerads() == 1 )
            self.adstime += 0.05;
        else
            self.adstime = 0.0;

        wait 0.05;
    }
}

monitorholdbreath()
{
    self endon( "disconnect" );
    self.holdingbreath = 0;

    for (;;)
    {
        self waittill( "hold_breath" );
        self.holdingbreath = 1;
        self waittill( "release_breath" );
        self.holdingbreath = 0;
    }
}

monitormantle()
{
    self endon( "disconnect" );
    self.mantling = 0;

    for (;;)
    {
        self waittill( "jumped" );
        var_0 = self getcurrentweapon();
        common_scripts\utility::waittill_notify_or_timeout( "weapon_change", 1 );
        var_1 = self getcurrentweapon();

        if ( var_1 == "none" )
            self.mantling = 1;
        else
            self.mantling = 0;

        if ( self.mantling )
        {
            if ( self isitemunlocked( "specialty_fastmantle" ) && maps\mp\_utility::_hasperk( "specialty_fastmantle" ) )
                processchallenge( "ch_fastmantle" );

            common_scripts\utility::waittill_notify_or_timeout( "weapon_change", 1 );
            var_1 = self getcurrentweapon();

            if ( var_1 == var_0 )
                self.mantling = 0;
        }
    }
}

monitorweaponswap()
{
    self endon( "disconnect" );
    var_0 = self getcurrentweapon();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_1 == "none" )
            continue;

        if ( var_1 == var_0 )
            continue;

        if ( maps\mp\_utility::iskillstreakweapon( var_1 ) || maps\mp\_utility::isdeathstreakweapon( var_1 ) )
            continue;

        if ( var_1 == "briefcase_bomb_mp" || var_1 == "briefcase_bomb_defuse_mp" )
            continue;

        var_2 = weaponinventorytype( var_1 );

        if ( var_2 != "primary" )
            continue;

        self.lastprimaryweaponswaptime = gettime();
    }
}

monitorflashbang()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3 );

        if ( self == var_3 )
            continue;

        self.lastflashedtime = gettime();
    }
}

monitorconcussion()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "concussed", var_0 );

        if ( self == var_0 )
            continue;

        self.lastconcussedtime = gettime();
    }
}

monitorminetriggering()
{
    self endon( "disconnect" );

    for (;;)
    {
        common_scripts\utility::waittill_any( "triggered_mine", "triggered_claymore", "triggered_ims" );
        thread waitdelayminetime();
    }
}

waitdelayminetime()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait(level.delayminetime + 2);
    processchallenge( "ch_delaymine" );
}
