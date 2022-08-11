// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread maps\mp\_utility::reinitializematchrulesonmigration();
    }
    else
    {
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        maps\mp\_utility::setoverridewatchdvar( "scorelimit", 0 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_numinitialinfected = 1;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    setspecialloadouts();
    level.teambased = 1;
    level.doprematch = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.onspawnplayer = ::onspawnplayer;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;
    level.ondeadevent = ::ondeadevent;
    level.ontimelimit = ::ontimelimit;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    level.matchrules_numinitialinfected = getmatchrulesdata( "infectData", "numInitialInfected" );
    var_0 = maps\mp\_utility::getwatcheddvar( "numlives" );

    if ( var_0 )
    {
        setdynamicdvar( "scr_" + level.gametype + "_numLives", var_0 + 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, var_0 + 1 );
    }

    maps\mp\_utility::setoverridewatchdvar( "scorelimit", 0 );
    setdynamicdvar( "scr_infect_roundswitch", 0 );
    maps\mp\_utility::registerroundswitchdvar( "infect", 0, 0, 9 );
    setdynamicdvar( "scr_infect_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "infect", 1 );
    setdynamicdvar( "scr_infect_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "infect", 1 );
    setdynamicdvar( "scr_infect_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "infect", 0 );
    setdynamicdvar( "scr_infect_promode", 0 );
}

onprecachegametype()
{
    precachestring( &"MP_CONSCRIPTION_STARTS_IN" );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_INFECT" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_INFECT" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_INFECT" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_INFECT" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_INFECT_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_INFECT_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_INFECT_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_INFECT_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_0 = [];
    maps\mp\gametypes\_gameobjects::main( var_0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "final_rogue", 200 );
    maps\mp\gametypes\_rank::registerscoreinfo( "draft_rogue", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "survivor", 100 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level.infect_timerdisplay = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4 );
    level.infect_timerdisplay maps\mp\gametypes\_hud_util::setpoint( "TOPLEFT", "TOPLEFT", 115, 5 );
    level.infect_timerdisplay.label = &"MP_DRAFT_STARTS_IN";
    level.infect_timerdisplay.alpha = 0;
    level.infect_timerdisplay.archived = 0;
    level.infect_timerdisplay.hidewheninmenu = 1;
    level.infect_chosefirstinfected = 0;
    level.infect_choosingfirstinfected = 0;
    level.infect_teamscores["axis"] = 0;
    level.infect_teamscores["allies"] = 0;
    level thread onplayerconnect();
    level thread onplayereliminated();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.infect_firstspawn = 1;
        var_0 thread onplayerdisconnect();
    }
}

onspawnplayer()
{
    updateteamscores();

    if ( !level.infect_choosingfirstinfected )
    {
        level.infect_choosingfirstinfected = 1;
        level thread choosefirstinfected();
    }

    if ( isdefined( self.isinitialinfected ) )
        self.pers["gamemodeLoadout"] = level.infect_loadouts["axis_initial"];
    else
        self.pers["gamemodeLoadout"] = level.infect_loadouts[self.pers["team"]];

    if ( self.infect_firstactualspawn )
    {
        self.infect_firstactualspawn = 0;
        level.infect_teamscores["allies"]++;
        updateteamscores();
    }

    level notify( "spawned_player" );
}

getspawnpoint()
{
    if ( self.infect_firstspawn )
    {
        self.infect_firstspawn = 0;
        self.infect_firstactualspawn = 1;
        self.pers["class"] = "gamemode";
        self.pers["lastClass"] = "";
        self.class = self.pers["class"];
        self.lastclass = self.pers["lastClass"];
        maps\mp\gametypes\_menus::addtoteam( "allies", 1 );
    }

    if ( level.ingraceperiod )
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_tdm_spawn" );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_0 );
    }
    else
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.pers["team"] );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_0 );
    }

    return var_1;
}

choosefirstinfected()
{
    level endon( "game_ended" );
    maps\mp\_utility::gameflagwait( "prematch_done" );
    level.infect_timerdisplay.label = &"MP_DRAFT_STARTS_IN";
    level.infect_timerdisplay settimer( 8 );
    level.infect_timerdisplay.alpha = 1;
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 8.0 );
    level.infect_timerdisplay.alpha = 0;
    var_0 = level.players[randomint( level.players.size )];
    var_0.infect_isbeingchosen = 1;
    var_0 endon( "disconnect" );

    while ( !maps\mp\_utility::isreallyalive( var_0 ) || var_0 maps\mp\_utility::isusingremote() )
        wait 0.05;

    if ( isdefined( var_0.iscarrying ) && var_0.iscarrying == 1 )
    {
        var_0 notify( "force_cancel_placement" );
        wait 0.05;
    }

    if ( var_0 maps\mp\_utility::isjuggernaut() )
    {
        var_0 notify( "lost_juggernaut" );
        wait 0.05;
    }

    var_0 maps\mp\gametypes\_playerlogic::removefromalivecount();
    var_0 maps\mp\gametypes\_menus::addtoteam( "axis" );
    level.infect_chosefirstinfected = 1;
    var_0.infect_isbeingchosen = undefined;
    var_0.isinitialinfected = 1;
    level.infect_teamscores["allies"]--;
    level.infect_teamscores["axis"]++;
    updateteamscores();
    var_1 = maps\mp\_utility::getwatcheddvar( "numlives" );

    if ( var_1 && var_0.pers["lives"] )
        var_0.pers["lives"]--;

    var_0 maps\mp\gametypes\_playerlogic::addtoalivecount();
    var_0.pers["gamemodeLoadout"] = level.infect_loadouts["axis_initial"];
    var_2 = spawn( "script_model", var_0.origin );
    var_2.angles = var_0.angles;
    var_2.playerspawnpos = var_0.origin;
    var_2.notti = 1;
    var_0.setspawnpoint = var_2;
    var_0 notify( "faux_spawn" );
    var_0.faux_spawn_stance = var_0 getstance();
    var_0 thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
    thread maps\mp\_utility::teamplayercardsplash( "callout_first_mercenary", var_0 );
    maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
}

setinitialtonormalinfected()
{
    level endon( "game_ended" );
    self.isinitialinfected = undefined;

    if ( isdefined( self.iscarrying ) && self.iscarrying == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    if ( maps\mp\_utility::isjuggernaut() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    while ( !maps\mp\_utility::isreallyalive( self ) )
        wait 0.05;

    self.pers["gamemodeLoadout"] = level.infect_loadouts["axis"];
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0.playerspawnpos = self.origin;
    var_0.notti = 1;
    self.setspawnpoint = var_0;
    self notify( "faux_spawn" );
    self.faux_spawn_stance = self getstance();
    thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 != self && self.team == "allies" && self.team != var_1.team )
    {
        self.addtoteam = "axis";
        level.infect_teamscores["allies"]--;
        level.infect_teamscores["axis"]++;
        updateteamscores();

        if ( isdefined( var_1.isinitialinfected ) )
            var_1 thread setinitialtonormalinfected();

        var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DRAFTED" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "draft_rogue", var_1, self, 1 );
        var_1 thread maps\mp\gametypes\_rank::giverankxp( "draft_rogue" );

        if ( level.infect_teamscores["allies"] > 1 )
        {
            maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured", "allies" );
            maps\mp\_utility::playsoundonplayers( "mp_war_objective_taken", "axis" );
            thread maps\mp\_utility::teamplayercardsplash( "callout_got_drafted", self, "allies" );
            thread maps\mp\_utility::teamplayercardsplash( "callout_drafted_rogue", var_1, "axis" );

            foreach ( var_11 in level.players )
            {
                if ( var_11.team == "allies" && var_11 != self )
                {
                    var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_SURVIVOR" );
                    maps\mp\gametypes\_gamescore::giveplayerscore( "survivor", var_11, undefined, 1 );
                    var_11 thread maps\mp\gametypes\_rank::giverankxp( "survivor" );
                }
            }
        }

        if ( level.infect_teamscores["allies"] == 1 )
        {
            maps\mp\_utility::playsoundonplayers( "mp_obj_captured" );

            foreach ( var_11 in level.players )
            {
                if ( var_11.team == "allies" && var_11 != self )
                {
                    var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_FINAL_ROGUE" );
                    maps\mp\gametypes\_gamescore::giveplayerscore( "final_rogue", var_11, undefined, 1 );
                    var_11 thread maps\mp\gametypes\_rank::giverankxp( "final_rogue" );
                    thread maps\mp\_utility::teamplayercardsplash( "callout_final_rogue", var_11 );
                    break;
                }
            }
        }
        else if ( level.infect_teamscores["allies"] == 0 )
        {
            level.finalkillcam_winner = "axis";
            level thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["allies_eliminated"] );
        }
    }
}

onplayerdisconnect()
{
    level endon( "game_ended" );
    self endon( "eliminated" );
    self waittill( "disconnect" );

    if ( self.team == "spectator" )
        return;

    level.infect_teamscores[self.team]--;
    updateteamscores();

    if ( isdefined( self.infect_isbeingchosen ) || level.infect_chosefirstinfected )
    {
        if ( level.infect_teamscores["allies"] == 0 )
        {
            level.finalkillcam_winner = "axis";
            level thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["allies_eliminated"] );
        }
        else if ( level.infect_teamscores["axis"] == 0 )
        {
            if ( level.infect_teamscores["allies"] > 1 )
            {
                level.infect_chosefirstinfected = 0;
                level thread choosefirstinfected();
            }
            else
            {
                level.finalkillcam_winner = "allies";
                level thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["allies_eliminated"] );
            }
        }
    }
}

onplayereliminated()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_eliminated", var_0 );
        var_0 notify( "eliminated" );
        level.infect_teamscores[var_0.team]--;
        updateteamscores();

        if ( level.infect_teamscores["allies"] == 0 )
        {
            level.finalkillcam_winner = "axis";
            level thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["allies_eliminated"] );
            continue;
        }

        if ( level.infect_teamscores["axis"] == 0 )
        {
            level.finalkillcam_winner = "allies";
            level thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["axis_eliminated"] );
        }
    }
}

ondeadevent( var_0 )
{
    return;
}

ontimelimit()
{
    level.finalkillcam_winner = "allies";
    level thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["time_limit_reached"] );
}

updateteamscores()
{
    game["teamScores"]["axis"] = level.infect_teamscores["axis"];
    setteamscore( "axis", level.infect_teamscores["axis"] );
    game["teamScores"]["allies"] = level.infect_teamscores["allies"];
    setteamscore( "allies", level.infect_teamscores["allies"] );
}

setspecialloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 0, "class", "inUse" ) )
    {
        level.infect_loadouts["axis"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 0 );
        level.infect_loadouts["axis"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak3"] = "none";
    }
    else
    {
        level.infect_loadouts["axis"]["loadoutPrimary"] = "iw5_fmg9";
        level.infect_loadouts["axis"]["loadoutPrimaryAttachment"] = "reflex";
        level.infect_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
        level.infect_loadouts["axis"]["loadoutPrimaryBuff"] = "specialty_null";
        level.infect_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondary"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryBuff"] = "specialty_null";
        level.infect_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["axis"]["loadoutEquipment"] = "throwingknife_mp";
        level.infect_loadouts["axis"]["loadoutOffhand"] = "none";
        level.infect_loadouts["axis"]["loadoutPerk1"] = "specialty_longersprint";
        level.infect_loadouts["axis"]["loadoutPerk2"] = "specialty_quickdraw";
        level.infect_loadouts["axis"]["loadoutPerk3"] = "specialty_quieter";
        level.infect_loadouts["axis"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak3"] = "none";
        level.infect_loadouts["axis"]["loadoutDeathstreak"] = "specialty_grenadepulldeath";
        level.infect_loadouts["axis"]["loadoutJuggernaut"] = 0;
    }

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
    {
        level.infect_loadouts["axis_initial"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 5 );
        level.infect_loadouts["axis_initial"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak3"] = "none";
    }
    else
    {
        level.infect_loadouts["axis_initial"]["loadoutPrimary"] = "iw5_scar";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment"] = "reflex";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment2"] = "xmags";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryBuff"] = "specialty_bling";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondary"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryAttachment"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryAttachment2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryBuff"] = "specialty_null";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutEquipment"] = "specialty_null";
        level.infect_loadouts["axis_initial"]["loadoutOffhand"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPerk1"] = "specialty_longersprint";
        level.infect_loadouts["axis_initial"]["loadoutPerk2"] = "specialty_quickdraw";
        level.infect_loadouts["axis_initial"]["loadoutPerk3"] = "specialty_bulletaccuracy";
        level.infect_loadouts["axis_initial"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak3"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutDeathstreak"] = "specialty_grenadepulldeath";
        level.infect_loadouts["axis_initial"]["loadoutJuggernaut"] = 0;
    }

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 0, "class", "inUse" ) )
        level.infect_loadouts["allies"] = maps\mp\_utility::getmatchrulesspecialclass( "allies", 0 );
    else
    {
        level.infect_loadouts["allies"]["loadoutPrimary"] = "iw5_spas12";
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment"] = "silencer03";
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryBuff"] = "specialty_longerrange";
        level.infect_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondary"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryAttachment"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryAttachment2"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryBuff"] = "specialty_null";
        level.infect_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["allies"]["loadoutEquipment"] = "claymore_mp";
        level.infect_loadouts["allies"]["loadoutOffhand"] = "flash_grenade_mp";
        level.infect_loadouts["allies"]["loadoutPerk1"] = "specialty_scavenger";
        level.infect_loadouts["allies"]["loadoutPerk2"] = "specialty_quickdraw";
        level.infect_loadouts["allies"]["loadoutPerk3"] = "specialty_quieter";
        level.infect_loadouts["allies"]["loadoutDeathstreak"] = "specialty_null";
        level.infect_loadouts["allies"]["loadoutJuggernaut"] = 0;
    }
}
