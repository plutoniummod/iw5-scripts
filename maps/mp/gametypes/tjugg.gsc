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
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 7500 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_juggswitchtime = 90;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    setspecialloadouts();
    level.teambased = 1;
    level.doprematch = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    level.matchrules_juggswitchtime = getmatchrulesdata( "tjuggData", "juggSwitchTime" );
    setdynamicdvar( "scr_tjugg_roundswitch", 0 );
    maps\mp\_utility::registerroundswitchdvar( "tjugg", 0, 0, 9 );
    setdynamicdvar( "scr_tjugg_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "tjugg", 1 );
    setdynamicdvar( "scr_tjugg_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "tjugg", 1 );
    setdynamicdvar( "scr_tjugg_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "tjugg", 0 );
    setdynamicdvar( "scr_team_fftype", 0 );
    setdynamicdvar( "scr_tjugg_promode", 0 );
}

onprecachegametype()
{
    precachestring( &"MP_JUGG_NEXT_JUGG_IN" );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_TJUGG" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_TJUGG" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_TJUGG" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_TJUGG" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_TJUGG_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_TJUGG_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_TJUGG_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_TJUGG_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "got_juggernaut", 250 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_juggernaut", 250 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_as_juggernaut", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "jugg_on_jugg", 400 );
    var_0[0] = "tjugg";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level.respawnoldjugg_fx = loadfx( "explosions/bouncing_betty_explosion" );
    level.jugg_available = [];
    level.jugg_available["axis"] = 1;
    level.jugg_available["allies"] = 1;
    level.jugg_attackers = [];
    level.jugg_attackers["axis"] = [];
    level.jugg_attackers["allies"] = [];
    level.jugg_currjugg = [];
    level.jugg_currjugg["axis"] = undefined;
    level.jugg_currjugg["allies"] = undefined;
    level.tjugg_timerdisplay = [];
    level.tjugg_timerdisplay["allies"] = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4, "allies" );
    level.tjugg_timerdisplay["allies"] maps\mp\gametypes\_hud_util::setpoint( "TOPLEFT", "TOPLEFT", 115, 5 );
    level.tjugg_timerdisplay["allies"].label = &"MP_JUGG_NEXT_JUGG_IN";
    level.tjugg_timerdisplay["allies"].alpha = 0;
    level.tjugg_timerdisplay["allies"].archived = 0;
    level.tjugg_timerdisplay["allies"].hidewheninmenu = 1;
    level.tjugg_timerdisplay["axis"] = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4, "axis" );
    level.tjugg_timerdisplay["axis"] maps\mp\gametypes\_hud_util::setpoint( "TOPLEFT", "TOPLEFT", 115, 5 );
    level.tjugg_timerdisplay["axis"].label = &"MP_JUGG_NEXT_JUGG_IN";
    level.tjugg_timerdisplay["axis"].alpha = 0;
    level.tjugg_timerdisplay["axis"].archived = 0;
    level.tjugg_timerdisplay["axis"].hidewheninmenu = 1;
    thread hidetimerdisplayongameend( level.tjugg_timerdisplay["allies"] );
    thread hidetimerdisplayongameend( level.tjugg_timerdisplay["axis"] );
    level.favorclosespawnscalar = 5;
    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.jugg_alligience = 0;
    }
}

getspawnpoint()
{
    if ( level.ingraceperiod )
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_tdm_spawn_" + self.pers["team"] + "_start" );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_0 );
    }
    else
    {
        level.favorclosespawnent = level.jugg_currjugg[self.pers["team"]];
        var_0 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.pers["team"] );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_0 );
    }

    return var_1;
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( var_3 == "MOD_SUICIDE" && var_4 == "none" )
        return;

    var_10 = self;

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        var_11 = 0;
        var_12 = 0;
        var_13 = 0;
        var_14 = 0;
        var_15 = 0;
        var_16 = 0;
        var_17 = 0;

        if ( var_1 == var_10 )
        {
            if ( isdefined( var_10.isjuggmodejuggernaut ) )
                var_12 = 1;
        }
        else if ( var_1.team != var_10.team )
        {
            var_17 += maps\mp\gametypes\_rank::getscoreinfovalue( "kill" );

            if ( isdefined( var_10.isjuggmodejuggernaut ) )
            {
                var_12 = 1;

                if ( isdefined( var_1.isjuggmodejuggernaut ) )
                    var_13 = 1;
                else
                    var_14 = 1;
            }
            else if ( isdefined( var_1.isjuggmodejuggernaut ) )
                var_15 = 1;

            if ( level.jugg_available[var_1.team] )
                var_11 = 1;
        }
        else if ( isdefined( var_10.isjuggmodejuggernaut ) && var_1.team == var_10.team )
        {
            var_10 thread givejuggloadout();
            return;
        }

        if ( var_11 )
            resetjugg( var_1 );

        if ( var_12 )
        {
            var_18 = getbestteammate( var_10.team, 0 );

            if ( !isdefined( var_18 ) )
                var_18 = getbestteammate( var_10.team, 1 );

            if ( !isdefined( var_18 ) )
                var_18 = var_10;

            resetjugg( var_18, var_10 );
        }

        if ( var_11 || var_12 )
            maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );

        if ( var_1 != var_10 && var_1.team != var_10.team && !isdefined( var_1.isjuggmodejuggernaut ) )
        {
            var_1.jugg_alligience += 50;

            if ( var_14 )
                var_1.jugg_alligience += 100;

            if ( isdefined( level.jugg_attackers[var_1.team][var_10.guid] ) )
            {
                var_16 = 1;
                var_1.jugg_alligience += 100;
                level.jugg_attackers[var_1.team][var_10.guid] = undefined;
            }
        }

        if ( var_14 )
        {
            var_19 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill_juggernaut" );
            var_17 += var_19;
            var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_KILLED_JUGGERNAUT" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "kill_juggernaut", var_1, var_10, 1 );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill_juggernaut" );
        }
        else if ( var_13 )
        {
            var_17 += maps\mp\gametypes\_rank::getscoreinfovalue( "jugg_on_jugg" );
            var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_JUGGERNAUT_KILL_JUGGERNAUT" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "jugg_on_jugg", var_1, var_10, 1 );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "jugg_on_jugg" );
        }
        else if ( var_15 )
        {
            var_17 += maps\mp\gametypes\_rank::getscoreinfovalue( "kill_as_juggernaut" );
            var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_JUGGERNAUT_KILL" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "kill_as_juggernaut", var_1, var_10, 1 );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill_as_juggernaut" );
        }

        if ( var_17 )
            var_1 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_1.pers["team"], var_17 );

        if ( var_1.team != var_10.team && game["state"] == "postgame" && game["teamScores"][var_1.team] > game["teamScores"][level.otherteam[var_1.team]] )
        {
            var_1.finalkill = 1;
            return;
        }
    }
    else if ( isdefined( var_10.isjuggmodejuggernaut ) )
    {
        var_18 = getbestteammate( var_10.team, 0 );

        if ( !isdefined( var_18 ) )
            var_18 = getbestteammate( var_10.team, 1 );

        if ( !isdefined( var_18 ) )
            var_18 = var_10;

        resetjugg( var_18, var_10 );
    }
}

resetjugg( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        var_1.isjuggmodejuggernaut = undefined;
    else
        level.jugg_available[var_0.team] = 0;

    level.jugg_currjugg[var_0.team] = undefined;
    level.tjugg_timerdisplay[var_0.team].alpha = 0;
    level.jugg_attackers[var_0.team] = [];

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_0.team )
            var_3.jugg_alligience = 0;
    }

    var_0 thread givejuggloadout();
}

givejuggloadout()
{
    if ( !maps\mp\_utility::isreallyalive( self ) || maps\mp\_utility::isusingremote() )
    {
        self endon( "disconnect" );
        thread resetjuggloadoutondisconnect( 0 );

        while ( !maps\mp\_utility::isreallyalive( self ) || maps\mp\_utility::isusingremote() )
            wait 0.05;

        self notify( "end_resetJuggLoadoutOnDisconnect" );
    }

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

    self.isjuggmodejuggernaut = 1;
    level.jugg_currjugg[self.team] = self;
    self.pers["gamemodeLoadout"] = level.tjugg_loadouts[self.pers["team"]];
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0.playerspawnpos = self.origin;
    var_0.notti = 1;
    self.setspawnpoint = var_0;
    self.gamemode_chosenclass = self.class;
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "gamemode";
    self.class = "gamemode";
    self.lastclass = "gamemode";
    self notify( "faux_spawn" );
    self.faux_spawn_stance = self getstance();
    thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
    var_1 = maps\mp\gametypes\_rank::getscoreinfovalue( "got_juggernaut" );
    thread maps\mp\gametypes\_hud_message::splashnotify( "got_juggernaut", var_1 );
    maps\mp\gametypes\_gamescore::giveplayerscore( "got_juggernaut", self, undefined, 1 );
    thread resetjuggloadoutondisconnect( 1 );
    thread resetjuggloadoutonchangeteam();
    thread rewardteammateproximity();
    thread logattackers();
    thread nextjuggtimeout();
}

nextjuggtimeout()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    level.tjugg_timerdisplay[self.team].label = &"MP_JUGG_NEXT_JUGG_IN";
    level.tjugg_timerdisplay[self.team] settimer( level.matchrules_juggswitchtime );
    level.tjugg_timerdisplay[self.team].alpha = 1;
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( level.matchrules_juggswitchtime );
    level.tjugg_timerdisplay[self.team].alpha = 0;
    var_0 = getbestteammate( self.team, 0 );

    if ( !isdefined( var_0 ) )
        var_0 = getbestteammate( self.team, 1 );

    if ( !isdefined( var_0 ) )
        var_0 = self;

    maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
    resetjugg( var_0, self );

    if ( var_0 != self )
        thread respawnoldjugg();
}

respawnoldjugg()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( !maps\mp\_utility::isreallyalive( self ) || maps\mp\_utility::isusingremote() )
        wait 0.05;

    if ( isdefined( self.iscarrying ) && self.iscarrying == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    playfx( level.respawnoldjugg_fx, self.origin );
    self notify( "lost_juggernaut" );
    wait 0.05;
    self notify( "faux_spawn" );
    self.faux_spawn_stance = self getstance();
    thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
}

rewardteammateproximity()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 1.0;

        foreach ( var_1 in level.players )
        {
            if ( maps\mp\_utility::isreallyalive( var_1 ) && !var_1 maps\mp\_utility::isusingremote() && var_1 != self && var_1.team == self.team && distancesquared( var_1.origin, self.origin ) < 48400 )
                var_1.jugg_alligience += 25;
        }
    }
}

logattackers()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( isplayer( var_1 ) && var_1.team != self.team )
        {
            if ( !isdefined( level.jugg_attackers[self.team][var_1.guid] ) )
                level.jugg_attackers[self.team][var_1.guid] = 1;
        }
    }
}

resetjuggloadoutondisconnect( var_0 )
{
    level endon( "game_ended" );

    if ( var_0 )
        self endon( "death" );
    else
        self endon( "end_resetJuggLoadoutOnDisconnect" );

    var_1 = self.team;
    self waittill( "disconnect" );
    var_2 = getbestteammate( var_1, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = getbestteammate( var_1, 1 );

    if ( isdefined( var_2 ) )
    {
        maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
        resetjugg( var_2 );
    }
    else
    {
        level.jugg_available[var_1] = 1;
        level.jugg_currjugg[var_1] = undefined;
        level.tjugg_timerdisplay[var_1].alpha = 0;
        level.jugg_attackers[var_1] = [];

        foreach ( var_4 in level.players )
        {
            if ( var_4.team == var_1 )
                var_4.jugg_alligience = 0;
        }
    }
}

resetjuggloadoutonchangeteam()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = self.team;
    common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    self.isjuggmodejuggernaut = undefined;
    var_1 = getbestteammate( var_0, 0 );

    if ( !isdefined( var_1 ) )
        var_1 = getbestteammate( var_0, 1 );

    if ( isdefined( var_1 ) )
    {
        maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
        resetjugg( var_1 );
    }
    else
    {
        level.jugg_available[var_0] = 1;
        level.jugg_currjugg[var_0] = undefined;
        level.tjugg_timerdisplay[var_0].alpha = 0;
        level.jugg_attackers[var_0] = [];

        foreach ( var_3 in level.players )
        {
            if ( var_3.team == var_0 )
                var_3.jugg_alligience = 0;
        }
    }
}

getbestteammate( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = -1;

    foreach ( var_5 in level.players )
    {
        if ( ( var_1 || !var_5 maps\mp\_utility::isusingremote() ) && var_5 != self && var_5.team == var_0 && var_5.jugg_alligience > var_3 )
        {
            var_2 = var_5;
            var_3 = var_5.jugg_alligience;
        }
    }

    return var_2;
}

hidetimerdisplayongameend( var_0 )
{
    level waittill( "game_ended" );
    var_0.alpha = 0;
}

setspecialloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
    {
        level.tjugg_loadouts["axis"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 5 );
        level.tjugg_loadouts["axis"]["loadoutJuggernaut"] = 1;
    }
    else
    {
        level.tjugg_loadouts["axis"]["loadoutPrimary"] = "iw5_scar";
        level.tjugg_loadouts["axis"]["loadoutPrimaryAttachment"] = "none";
        level.tjugg_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
        level.tjugg_loadouts["axis"]["loadoutPrimaryBuff"] = "specialty_bulletpenetration";
        level.tjugg_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
        level.tjugg_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
        level.tjugg_loadouts["axis"]["loadoutSecondary"] = "rpg";
        level.tjugg_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
        level.tjugg_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
        level.tjugg_loadouts["axis"]["loadoutSecondaryBuff"] = "specialty_null";
        level.tjugg_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
        level.tjugg_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
        level.tjugg_loadouts["axis"]["loadoutEquipment"] = "frag_grenade_mp";
        level.tjugg_loadouts["axis"]["loadoutOffhand"] = "smoke_grenade_mp";
        level.tjugg_loadouts["axis"]["loadoutPerk1"] = "specialty_scavenger";
        level.tjugg_loadouts["axis"]["loadoutPerk2"] = "_specialty_blastshield";
        level.tjugg_loadouts["axis"]["loadoutPerk3"] = "specialty_bulletaccuracy";
        level.tjugg_loadouts["axis"]["loadoutDeathstreak"] = "specialty_null";
        level.tjugg_loadouts["axis"]["loadoutJuggernaut"] = 1;
    }

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 5, "class", "inUse" ) )
    {
        level.tjugg_loadouts["allies"] = maps\mp\_utility::getmatchrulesspecialclass( "allies", 5 );
        level.tjugg_loadouts["allies"]["loadoutJuggernaut"] = 1;
    }
    else
    {
        level.tjugg_loadouts["allies"]["loadoutPrimary"] = "iw5_scar";
        level.tjugg_loadouts["allies"]["loadoutPrimaryAttachment"] = "none";
        level.tjugg_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
        level.tjugg_loadouts["allies"]["loadoutPrimaryBuff"] = "specialty_bulletpenetration";
        level.tjugg_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
        level.tjugg_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
        level.tjugg_loadouts["allies"]["loadoutSecondary"] = "rpg";
        level.tjugg_loadouts["allies"]["loadoutSecondaryAttachment"] = "none";
        level.tjugg_loadouts["allies"]["loadoutSecondaryAttachment2"] = "none";
        level.tjugg_loadouts["allies"]["loadoutSecondaryBuff"] = "specialty_null";
        level.tjugg_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
        level.tjugg_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
        level.tjugg_loadouts["allies"]["loadoutEquipment"] = "frag_grenade_mp";
        level.tjugg_loadouts["allies"]["loadoutOffhand"] = "smoke_grenade_mp";
        level.tjugg_loadouts["allies"]["loadoutPerk1"] = "specialty_scavenger";
        level.tjugg_loadouts["allies"]["loadoutPerk2"] = "_specialty_blastshield";
        level.tjugg_loadouts["allies"]["loadoutPerk3"] = "specialty_bulletaccuracy";
        level.tjugg_loadouts["allies"]["loadoutDeathstreak"] = "specialty_null";
        level.tjugg_loadouts["allies"]["loadoutJuggernaut"] = 1;
    }
}
