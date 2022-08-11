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
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 10 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_respawnnewjugg = 0;
        level.matchrules_showjuggradaricon = 1;
        level.matchrules_showjuggworldicon = 0;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    setspecialloadouts();
    level.teambased = 1;
    level.doprematch = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onplayerkilled = ::onplayerkilled;
    level.ontimelimit = ::ontimelimit;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    level.matchrules_respawnnewjugg = getmatchrulesdata( "juggData", "respawnNewJugg" );
    level.matchrules_showjuggradaricon = getmatchrulesdata( "juggData", "showJuggRadarIcon" );
    level.matchrules_showjuggworldicon = getmatchrulesdata( "juggData", "showJuggWorldIcon" );
    setdynamicdvar( "scr_jugg_roundswitch", 0 );
    maps\mp\_utility::registerroundswitchdvar( "jugg", 0, 0, 9 );
    setdynamicdvar( "scr_jugg_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "jugg", 1 );
    setdynamicdvar( "scr_jugg_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "jugg", 1 );
    setdynamicdvar( "scr_jugg_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "jugg", 0 );
    setdynamicdvar( "scr_jugg_promode", 0 );
}

onprecachegametype()
{
    precachestring( &"MP_JUGG_NEXT_JUGG_IN" );
    precacheshader( "waypoint_kill" );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_JUGG" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_JUGG" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_JUGG" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_JUGG" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_JUGG_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_JUGG_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_JUGG_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_JUGG_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "got_juggernaut", 250 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_as_juggernaut", 50 );
    var_0 = [];
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level.jugg_juggernaut = undefined;
    level.jugg_choosingjugg = 0;
    level thread onplayerconnect();
    level.jugg_timerdisplay = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4 );
    level.jugg_timerdisplay maps\mp\gametypes\_hud_util::setpoint( "TOPLEFT", "TOPLEFT", 115, 5 );
    level.jugg_timerdisplay.label = &"MP_JUGG_NEXT_JUGG_IN";
    level.jugg_timerdisplay.alpha = 0;
    level.jugg_timerdisplay.archived = 0;
    level.jugg_timerdisplay.hidewheninmenu = 1;
    thread hidetimerdisplayongameend( level.jugg_timerdisplay );
    level.killstreakrewards = 0;
}

chooseinitialjugg()
{
    level endon( "game_ended" );
    level notify( "chooseInitialJugg" );
    level endon( "chooseInitialJugg" );
    maps\mp\_utility::gameflagwait( "prematch_done" );
    level.jugg_timerdisplay.label = &"MP_JUGG_NEXT_JUGG_IN";
    level.jugg_timerdisplay settimer( 8 );
    level.jugg_timerdisplay.alpha = 1;
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 8.0 );
    level.jugg_timerdisplay.alpha = 0;
    resetjugg( level.players[randomint( level.players.size )], undefined, 1 );
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.jugg_juggscore = 0;
        var_0.jugg_firstspawn = 1;
        var_0 thread onplayerdisconnect();
    }
}

onplayerdisconnect()
{
    level endon( "game_ended" );
    self waittill( "disconnect" );
    updatejuggscores();
}

onspawnplayer()
{
    if ( !level.jugg_choosingjugg )
    {
        level.jugg_choosingjugg = 1;
        level thread chooseinitialjugg();
    }

    self.pers["gamemodeLoadout"] = level.jugg_loadouts[self.pers["team"]];
    level notify( "spawned_player" );
}

getspawnpoint()
{
    if ( self.jugg_firstspawn )
    {
        self.jugg_firstspawn = 0;
        self.pers["class"] = "gamemode";
        self.pers["lastClass"] = "";
        self.class = self.pers["class"];
        self.lastclass = self.pers["lastClass"];
        maps\mp\gametypes\_menus::addtoteam( "axis", 1 );
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

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 != self )
    {
        if ( isdefined( level.jugg_juggernaut ) && level.jugg_juggernaut == self )
        {
            if ( level.matchrules_showjuggworldicon )
                self.jugg_headicon destroy();

            resetjugg( var_1, self );
        }
        else if ( isdefined( level.jugg_juggernaut ) && level.jugg_juggernaut == var_1 )
        {
            var_1.jugg_juggscore++;
            var_1 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_1.pers["team"], 1 );
            var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_JUGGERNAUT_KILL" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "kill_as_juggernaut", var_1, self, 1 );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill_as_juggernaut" );
        }
    }
    else if ( isdefined( level.jugg_juggernaut ) && level.jugg_juggernaut == self )
    {
        self.addtoteam = "axis";
        maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
        level.jugg_juggernaut = undefined;
        level thread chooseinitialjugg();
    }
}

resetjugg( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_1.addtoteam = "axis";

    if ( isdefined( level.jugg_juggernaut ) )
    {
        maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
        level.jugg_juggernaut = undefined;
    }
    else
        maps\mp\_utility::playsoundonplayers( "mp_obj_captured" );

    var_0 endon( "disconnect" );
    var_0 thread ondisconnect();

    if ( var_0 maps\mp\_utility::isjuggernaut() )
    {
        var_0 notify( "lost_juggernaut" );
        wait 0.05;
    }

    while ( !isalive( var_0 ) )
        wait 0.05;

    var_0 maps\mp\gametypes\_menus::addtoteam( "allies" );
    level.jugg_juggernaut = var_0;

    if ( isdefined( var_2 ) )
        updatejuggscores();
    else
    {
        var_0.jugg_juggscore++;
        updatejuggscores();
        var_0 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( "allies", 1 );
    }

    if ( isdefined( var_2 ) )
        var_0 thread givejuggloadout( 1 );
    else
        var_0 thread givejuggloadout();
}

givejuggloadout( var_0 )
{
    self.pers["gamemodeLoadout"] = level.jugg_loadouts[self.pers["team"]];

    if ( level.matchrules_respawnnewjugg )
    {
        self notify( "faux_spawn" );
        self.faux_spawn_stance = self getstance();
        thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
    }
    else
    {
        var_1 = spawn( "script_model", self.origin );
        var_1.angles = self.angles;
        var_1.playerspawnpos = self.origin;
        var_1.notti = 1;
        self.setspawnpoint = var_1;
        self notify( "faux_spawn" );
        self.faux_spawn_stance = self getstance();
        thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
    }

    if ( level.matchrules_showjuggworldicon )
        self.jugg_headicon = maps\mp\_entityheadicons::setheadicon( level.otherteam[self.team], "waypoint_kill", ( 0.0, 0.0, 85.0 ), 24, 24, undefined, undefined, undefined, undefined, undefined, 0 );

    if ( !isdefined( var_0 ) )
    {
        var_2 = maps\mp\gametypes\_rank::getscoreinfovalue( "got_juggernaut" );
        thread maps\mp\gametypes\_hud_message::splashnotify( "got_juggernaut", var_2 );
        maps\mp\gametypes\_gamescore::giveplayerscore( "got_juggernaut", self, undefined, 1 );
        thread maps\mp\gametypes\_rank::giverankxp( "got_juggernaut" );
    }

    level thread maps\mp\_utility::teamplayercardsplash( "callout_new_juggernaut", self, level.otherteam[self.team] );
}

updatejuggscores()
{
    if ( isdefined( level.jugg_juggernaut ) )
    {
        game["teamScores"]["allies"] = level.jugg_juggernaut.jugg_juggscore;
        setteamscore( "allies", level.jugg_juggernaut.jugg_juggscore );
    }
    else
    {
        game["teamScores"]["allies"] = 0;
        setteamscore( "allies", 0 );
    }

    game["teamScores"]["axis"] = 0;
    setteamscore( "axis", 0 );
}

ondisconnect()
{
    level endon( "game_ended" );
    self endon( "death" );
    self waittill( "disconnect" );
    level thread chooseinitialjugg();
}

ontimelimit()
{
    level.finalkillcam_winner = "axis";
    level thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["time_limit_reached"] );
}

hidetimerdisplayongameend( var_0 )
{
    level waittill( "game_ended" );
    var_0.alpha = 0;
}

setspecialloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 0, "class", "inUse" ) )
    {
        level.jugg_loadouts["axis"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 0 );
        level.jugg_loadouts["axis"]["loadoutJuggernaut"] = 0;
    }
    else
    {
        level.jugg_loadouts["axis"]["loadoutPrimary"] = "iw5_usas12";
        level.jugg_loadouts["axis"]["loadoutPrimaryAttachment"] = "none";
        level.jugg_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
        level.jugg_loadouts["axis"]["loadoutPrimaryBuff"] = "specialty_longerrange";
        level.jugg_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
        level.jugg_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
        level.jugg_loadouts["axis"]["loadoutSecondary"] = "iw5_44magnum";
        level.jugg_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
        level.jugg_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
        level.jugg_loadouts["axis"]["loadoutSecondaryBuff"] = "specialty_null";
        level.jugg_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
        level.jugg_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
        level.jugg_loadouts["axis"]["loadoutEquipment"] = "claymore_mp";
        level.jugg_loadouts["axis"]["loadoutOffhand"] = "flash_grenade_mp";
        level.jugg_loadouts["axis"]["loadoutPerk1"] = "specialty_longersprint";
        level.jugg_loadouts["axis"]["loadoutPerk2"] = "specialty_quickdraw";
        level.jugg_loadouts["axis"]["loadoutPerk3"] = "specialty_bulletaccuracy";
        level.jugg_loadouts["axis"]["loadoutDeathstreak"] = "specialty_grenadepulldeath";
        level.jugg_loadouts["axis"]["loadoutJuggernaut"] = 0;
    }

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 5, "class", "inUse" ) )
    {
        level.jugg_loadouts["allies"] = maps\mp\_utility::getmatchrulesspecialclass( "allies", 5 );
        level.jugg_loadouts["allies"]["loadoutJuggernaut"] = 1;
    }
    else
    {
        level.jugg_loadouts["allies"]["loadoutPrimary"] = "iw5_scar";
        level.jugg_loadouts["allies"]["loadoutPrimaryAttachment"] = "none";
        level.jugg_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
        level.jugg_loadouts["allies"]["loadoutPrimaryBuff"] = "specialty_bulletpenetration";
        level.jugg_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
        level.jugg_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
        level.jugg_loadouts["allies"]["loadoutSecondary"] = "rpg";
        level.jugg_loadouts["allies"]["loadoutSecondaryAttachment"] = "none";
        level.jugg_loadouts["allies"]["loadoutSecondaryAttachment2"] = "none";
        level.jugg_loadouts["allies"]["loadoutSecondaryBuff"] = "specialty_null";
        level.jugg_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
        level.jugg_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
        level.jugg_loadouts["allies"]["loadoutEquipment"] = "frag_grenade_mp";
        level.jugg_loadouts["allies"]["loadoutOffhand"] = "smoke_grenade_mp";
        level.jugg_loadouts["allies"]["loadoutPerk1"] = "specialty_scavenger";
        level.jugg_loadouts["allies"]["loadoutPerk2"] = "_specialty_blastshield";
        level.jugg_loadouts["allies"]["loadoutPerk3"] = "specialty_bulletaccuracy";
        level.jugg_loadouts["allies"]["loadoutDeathstreak"] = "specialty_null";
        level.jugg_loadouts["allies"]["loadoutJuggernaut"] = 1;
    }
}
