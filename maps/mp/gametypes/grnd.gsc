// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

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
        maps\mp\_utility::registerroundswitchdvar( level.gametype, 0, 0, 9 );
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 20000 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_droptime = 30;
        level.matchrules_zoneswitchtime = 120;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    level.grnd_fx["smoke"] = loadfx( "smoke/airdrop_flare_mp_effect_now" );
    level.grnd_fx["flare"] = loadfx( "smoke/signal_smoke_airdrop" );
    createzones();
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    level.matchrules_droptime = getmatchrulesdata( "grndData", "dropTime" );
    level.matchrules_zoneswitchtime = 60 * getmatchrulesdata( "grndData", "zoneSwitchTime" );
    setdynamicdvar( "scr_grnd_roundswitch", 0 );
    maps\mp\_utility::registerroundswitchdvar( "grnd", 0, 0, 9 );
    setdynamicdvar( "scr_grnd_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "grnd", 1 );
    setdynamicdvar( "scr_grnd_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "grnd", 1 );
    setdynamicdvar( "scr_grnd_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "grnd", 0 );
    setdynamicdvar( "scr_grnd_promode", 0 );
}

onprecachegametype()
{
    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
    precachemodel( "prop_flag_neutral" );
    precachestring( &"OBJECTIVES_GRND" );
    precachestring( &"OBJECTIVES_GRND_SCORE" );
    precachestring( &"OBJECTIVES_GRND_HINT" );
    precachestring( &"OBJECTIVES_GRND_CONFIRM" );
    precachestring( &"MP_CALLING_AIRDROP" );
    precachestring( &"MP_NEXT_DROP_ZONE_IN" );
    precachemodel( "weapon_us_smoke_grenade_burnt2" );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_GRND" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_GRND" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_GRND" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_GRND" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_GRND_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_GRND_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_GRND_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_GRND_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_sab_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_sab_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_0 = getent( "sab_bomb", "targetname" );
    level.grnd_centerloc = var_0.origin;
    maps\mp\gametypes\_rank::registerscoreinfo( "zone_kill", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "zone_tick", 20 );
    var_1[0] = level.gametype;
    var_1[1] = "tdm";
    maps\mp\gametypes\_gameobjects::main( var_1 );
    level._id_39F5 = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4 );

    if ( level.splitscreen )
        level._id_39F5 maps\mp\gametypes\_hud_util::setpoint( "TOPLEFT", "TOPLEFT", 80, 0 );
    else
        level._id_39F5 maps\mp\gametypes\_hud_util::setpoint( "TOPLEFT", "TOPLEFT", 115, 5 );

    level._id_39F5.label = &"MP_NEXT_DROP_ZONE_IN";
    level._id_39F5.alpha = 0;
    level._id_39F5.archived = 0;
    level._id_39F5.hidewheninmenu = 1;
    thread hidehudelementongameend( level._id_39F5 );
    initfirstzone();
}

initfirstzone()
{
    level.zonescycling = 0;
    level.zonescycling = 0;
    var_0 = 999999;
    var_1 = 0;

    for ( var_2 = 0; var_2 < level.grnd_dropzones[level.script].size; var_2++ )
    {
        var_3 = level.grnd_dropzones[level.script][var_2];
        var_4 = distance2d( level.grnd_centerloc, var_3 );

        if ( var_4 < var_0 )
        {
            var_0 = var_4;
            var_1 = var_2;
        }
    }

    level.grnd_initialindex = var_1;
    var_5 = level.grnd_dropzones[level.script][var_1];
    level.grnd_zone = spawn( "script_model", var_5 );
    level.grnd_zone.origin = var_5;
    level.grnd_zone.angles = ( 90.0, 0.0, 0.0 );
    level.grnd_zone setmodel( "weapon_us_smoke_grenade_burnt2" );
    level.favorclosespawnent = level.grnd_zone;
    level.favorclosespawnscalar = 5;
    level thread initzones();
}

initzones()
{
    level.grnd_zones = [];

    for ( var_0 = 0; var_0 < level.grnd_dropzones[level.script].size; var_0++ )
    {
        var_1 = level.grnd_dropzones[level.script][var_0];
        level.grnd_zones[var_0] = spawn( "script_origin", var_1 );
        level.grnd_zones[var_0].origin = var_1;
        wait 0.05;
    }

    level.grnd_zones[level.grnd_initialindex] delete();
    level.grnd_zones[level.grnd_initialindex] = undefined;
    level.grnd_zones = common_scripts\utility::array_removeundefined( level.grnd_zones );
}

getspawnpoint()
{
    if ( level.ingraceperiod )
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_" + self.pers["team"] + "_start" );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_0 );
    }
    else
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.pers["team"] );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_0 );
    }

    return var_1;
}

onspawnplayer()
{
    if ( !isdefined( self.ingrindzone ) )
    {
        level thread setplayermessages( self );

        if ( !level.zonescycling )
        {
            level.zonescycling = 1;
            level thread cyclezones();
            level thread locationscoring();
        }
    }

    level notify( "spawned_player" );
}

setplayermessages( var_0 )
{
    level endon( "game_ended" );
    maps\mp\_utility::gameflagwait( "prematch_done" );
    var_0.ingrindzonepoints = 0;
    var_0._id_3A00 = var_0 maps\mp\gametypes\_hud_util::createfontstring( "small", 1.6 );

    if ( level.splitscreen )
        var_0._id_3A00 maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 80, 18 );
    else
        var_0._id_3A00 maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 115, 22 );

    var_0._id_3A00.alpha = 1;
    var_0._id_3A00.archived = 0;
    var_0._id_3A00.hidewheninmenu = 1;
    level thread hidehudelementongameend( var_0._id_3A00 );
    var_0.grndheadicon = level.grnd_zone maps\mp\_entityheadicons::setheadicon( var_0, "waypoint_captureneutral", ( 0.0, 0.0, 0.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
    var_0.grndobjid = maps\mp\gametypes\_gameobjects::getnextobjid();
    objective_add( var_0.grndobjid, "invisible", ( 0.0, 0.0, 0.0 ) );
    objective_player( var_0.grndobjid, var_0 getentitynumber() );
    objective_onentity( var_0.grndobjid, level.grnd_zone );
    objective_icon( var_0.grndobjid, "waypoint_captureneutral" );
    objective_state( var_0.grndobjid, "active" );

    if ( distance2d( level.grnd_zone.origin, var_0.origin ) < 300 )
    {
        var_0.ingrindzone = 1;
        var_0._id_3A00 settext( &"OBJECTIVES_GRND_CONFIRM" );
        var_0._id_3A00.color = ( 0.6, 1.0, 0.6 );
        var_0.grndheadicon.alpha = 0;
    }
    else
    {
        var_0.ingrindzone = 0;
        var_0._id_3A00 settext( &"OBJECTIVES_GRND_HINT" );
        var_0._id_3A00.color = ( 1.0, 0.6, 0.6 );
        var_0.grndheadicon.alpha = 0.85;
    }

    var_0.grnd_wasspectator = 0;

    if ( var_0.team == "spectator" )
    {
        var_0.ingrindzone = 0;
        var_0.ingrindzonepoints = 0;
        var_0.grndheadicon.alpha = 0;
        var_0._id_3A00.alpha = 0;
        var_0.grnd_wasspectator = 1;
    }

    var_0 thread grndtracking();
}

getnextzone()
{
    var_0 = undefined;
    var_1 = undefined;

    if ( level.grnd_zones.size > 2 )
    {
        var_2 = 999999;
        var_3 = 0;

        for ( var_4 = 0; var_4 < level.grnd_zones.size; var_4++ )
        {
            level.grnd_zones[var_4].index = var_4;
            level.grnd_zones[var_4].disttozone = distance( level.grnd_zones[var_4].origin, level.grnd_zone.origin );

            if ( level.grnd_zones[var_4].disttozone > var_3 )
            {
                var_3 = level.grnd_zones[var_4].disttozone;
                continue;
            }

            if ( level.grnd_zones[var_4].disttozone < var_2 )
                var_2 = level.grnd_zones[var_4].disttozone;
        }

        var_5 = [];
        var_6 = [];
        var_7 = int( ( var_2 + var_3 ) / 2 );

        for ( var_4 = 0; var_4 < level.grnd_zones.size; var_4++ )
        {
            if ( level.grnd_zones[var_4].disttozone >= var_7 )
            {
                var_5[var_5.size] = level.grnd_zones[var_4];
                continue;
            }

            var_6[var_6.size] = level.grnd_zones[var_4];
        }

        var_8 = undefined;

        if ( var_5.size > 1 )
            var_8 = var_5[randomintrange( 0, var_5.size )];
        else if ( var_5.size )
            var_8 = var_5[0];
        else
            var_8 = var_6[randomintrange( 0, var_6.size )];

        var_1 = var_8.index;
    }
    else if ( level.grnd_zones.size == 2 )
    {
        var_9 = distance( level.grnd_zones[0].origin, level.grnd_zone.origin );
        var_10 = distance( level.grnd_zones[1].origin, level.grnd_zone.origin );

        if ( var_9 > var_10 )
            var_1 = 0;
        else
            var_1 = 1;
    }
    else if ( level.grnd_zones.size == 1 )
        var_1 = 0;

    if ( isdefined( var_1 ) )
    {
        var_0 = level.grnd_zones[var_1].origin;
        level.grnd_zones[var_1] delete();
        level.grnd_zones[var_1] = undefined;
        level.grnd_zones = common_scripts\utility::array_removeundefined( level.grnd_zones );
    }
    else
    {
        var_0 = level.grnd_dropzones[level.script][level.grnd_initialindex];
        level thread initzones();
    }

    return var_0;
}

cyclezones()
{
    level endon( "game_ended" );
    maps\mp\_utility::gameflagwait( "prematch_done" );

    for (;;)
    {
        var_0["axis"] = game["teamScores"]["axis"];
        var_0["allies"] = game["teamScores"]["allies"];
        var_1 = undefined;

        if ( !level.zonescycling )
        {
            level.zonescycling = 1;
            var_1 = level.grnd_zone.origin;
        }
        else
        {
            var_1 = getnextzone();
            stopfxontag( level.grnd_fx["smoke"], level.grnd_zone, "tag_fx" );
            wait 0.05;
        }

        var_2 = var_1 + ( 0.0, 0.0, 30.0 );
        var_3 = var_1 + ( 0.0, 0.0, -1000.0 );
        var_4 = bullettrace( var_2, var_3, 0, undefined );
        level.grnd_zone.origin = var_4["position"] + ( 0.0, 0.0, 1.0 );
        wait 0.05;
        playfxontag( level.grnd_fx["smoke"], level.grnd_zone, "tag_fx" );

        if ( level.matchrules_droptime )
            level thread randomdrops();

        level._id_39F5.label = &"MP_NEXT_DROP_ZONE_IN";
        level._id_39F5 settimer( level.matchrules_zoneswitchtime );
        level._id_39F5.alpha = 1;
        maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( level.matchrules_zoneswitchtime );
        level._id_39F5.alpha = 0;

        if ( game["teamScores"]["axis"] - var_0["axis"] > game["teamScores"]["allies"] - var_0["allies"] )
        {
            maps\mp\_utility::playsoundonplayers( "mp_obj_captured", "axis" );
            maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured", "allies" );
            continue;
        }

        if ( game["teamScores"]["allies"] - var_0["allies"] > game["teamScores"]["axis"] - var_0["axis"] )
        {
            maps\mp\_utility::playsoundonplayers( "mp_obj_captured", "allies" );
            maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured", "axis" );
        }
    }
}

grndtracking()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !self.grnd_wasspectator && self.team == "spectator" )
        {
            self.ingrindzone = 0;
            self.ingrindzonepoints = 0;
            self.grndheadicon.alpha = 0;
            self._id_3A00.alpha = 0;
            self.grnd_wasspectator = 1;
        }
        else if ( self.team != "spectator" )
        {
            if ( ( self.grnd_wasspectator || !self.ingrindzone ) && distance2d( level.grnd_zone.origin, self.origin ) < 300 )
            {
                self.ingrindzone = 1;
                self.ingrindzonepoints = 0;
                self._id_3A00 settext( &"OBJECTIVES_GRND_CONFIRM" );
                self._id_3A00.color = ( 0.6, 1.0, 0.6 );
                self._id_3A00.alpha = 1;
                self.grndheadicon.alpha = 0;
            }
            else if ( ( self.grnd_wasspectator || self.ingrindzone ) && distance2d( level.grnd_zone.origin, self.origin ) >= 300 )
            {
                self.ingrindzone = 0;
                self.ingrindzonepoints = 0;
                self._id_3A00 settext( &"OBJECTIVES_GRND_HINT" );
                self._id_3A00.color = ( 1.0, 0.6, 0.6 );
                self._id_3A00.alpha = 1;
                self.grndheadicon.alpha = 0.85;
            }

            self.grnd_wasspectator = 0;
        }

        wait 0.05;
    }
}

locationscoring()
{
    level endon( "game_ended" );
    maps\mp\_utility::gameflagwait( "prematch_done" );
    var_0 = maps\mp\gametypes\_rank::getscoreinfovalue( "zone_tick" );

    for (;;)
    {
        var_1["axis"] = 0;
        var_1["allies"] = 0;

        foreach ( var_3 in level.players )
        {
            if ( isdefined( var_3.ingrindzone ) && maps\mp\_utility::isreallyalive( var_3 ) && distance2d( level.grnd_zone.origin, var_3.origin ) < 300 )
            {
                var_1[var_3.pers["team"]]++;
                var_3.ingrindzonepoints += var_0;
            }
        }

        if ( var_1["axis"] )
            maps\mp\gametypes\_gamescore::giveteamscoreforobjective( "axis", var_0 * var_1["axis"] );

        if ( var_1["allies"] )
            maps\mp\gametypes\_gamescore::giveteamscoreforobjective( "allies", var_0 * var_1["allies"] );

        if ( var_1["axis"] == var_1["allies"] )
        {
            foreach ( var_3 in level.players )
            {
                if ( isdefined( var_3.ingrindzone ) )
                {
                    var_3.grndheadicon setshader( "waypoint_captureneutral", 14, 14 );
                    var_3.grndheadicon setwaypoint( 0, 0, 0, 0 );
                    objective_icon( var_3.grndobjid, "waypoint_captureneutral" );
                }
            }
        }
        else
        {
            foreach ( var_3 in level.players )
            {
                if ( isdefined( var_3.ingrindzone ) )
                {
                    if ( var_1[var_3.pers["team"]] > var_1[level.otherteam[var_3.pers["team"]]] )
                    {
                        var_3.grndheadicon setshader( "waypoint_defend", 14, 14 );
                        var_3.grndheadicon setwaypoint( 0, 0, 0, 0 );
                        objective_icon( var_3.grndobjid, "waypoint_defend" );
                        continue;
                    }

                    var_3.grndheadicon setshader( "waypoint_capture", 14, 14 );
                    var_3.grndheadicon setwaypoint( 0, 0, 0, 0 );
                    objective_icon( var_3.grndobjid, "waypoint_capture" );
                }
            }
        }

        maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 1.0 );
    }
}

randomdrops()
{
    level endon( "game_ended" );
    level notify( "reset_grnd_drops" );
    level endon( "reset_grnd_drops" );
    level.grnd_previouscratetypes = [];

    for (;;)
    {
        var_0 = getbestplayer();
        var_1 = 1;

        if ( isdefined( var_0 ) && maps\mp\_utility::currentactivevehiclecount() < maps\mp\_utility::maxvehiclesallowed() && level.fauxvehiclecount + var_1 < maps\mp\_utility::maxvehiclesallowed() && level.numdropcrates < 8 )
        {
            var_0 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_EARNED_CAREPACKAGE" );
            thread maps\mp\_utility::teamplayercardsplash( "callout_earned_carepackage", var_0 );
            var_0 thread maps\mp\_utility::leaderdialog( level.otherteam[var_0.team] + "_enemy_airdrop_assault_inbound", level.otherteam[var_0.team] );
            var_0 thread maps\mp\_utility::leaderdialog( var_0.team + "_friendly_airdrop_assault_inbound", var_0.team );
            maps\mp\_utility::playsoundonplayers( "mp_war_objective_taken", var_0.team );
            maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", level.otherteam[var_0.team] );
            var_2 = level.grnd_zone.origin + ( randomintrange( -72, 72 ), randomintrange( -72, 72 ), 0 );
            var_3 = getdropzonecratetype();

            if ( issubstr( tolower( var_3 ), "juggernaut" ) )
                level thread maps\mp\killstreaks\_airdrop::doc130flyby( var_0, var_2, randomfloat( 360 ), var_3 );
            else if ( var_3 == "mega" )
                level thread maps\mp\killstreaks\_airdrop::domegac130flyby( var_0, var_2, randomfloat( 360 ), "airdrop_grnd", -360 );
            else
                level thread maps\mp\killstreaks\_airdrop::doflyby( var_0, var_2, randomfloat( 360 ), "airdrop_grnd", 0, var_3 );

            var_4 = level.matchrules_droptime;
        }
        else
            var_4 = 0.5;

        maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_4 );
    }
}

getbestplayer()
{
    var_0 = undefined;
    var_1 = 0;

    foreach ( var_3 in level.players )
    {
        if ( maps\mp\_utility::isreallyalive( var_3 ) )
        {
            if ( distance2d( level.grnd_zone.origin, var_3.origin ) < 300 && var_3.ingrindzonepoints > var_1 )
            {
                var_0 = var_3;
                var_1 = var_3.ingrindzonepoints;
            }
        }
    }

    return var_0;
}

getdropzonecratetype()
{
    var_0 = undefined;

    if ( !isdefined( level.grnd_previouscratetypes["mega"] ) && level.numdropcrates == 0 && randomintrange( 0, 100 ) < 5 )
        var_0 = "mega";
    else
    {
        if ( level.grnd_previouscratetypes.size )
        {
            for ( var_1 = 200; var_1; var_1-- )
            {
                var_0 = maps\mp\killstreaks\_airdrop::getrandomcratetype( "airdrop_grnd" );

                if ( isdefined( level.grnd_previouscratetypes[var_0] ) )
                {
                    var_0 = undefined;
                    continue;
                }

                break;
            }
        }

        if ( !isdefined( var_0 ) )
            var_0 = maps\mp\killstreaks\_airdrop::getrandomcratetype( "airdrop_grnd" );
    }

    level.grnd_previouscratetypes[var_0] = 1;

    if ( level.grnd_previouscratetypes.size == 15 )
        level.grnd_previouscratetypes = [];

    return var_0;
}

hidehudelementongameend( var_0 )
{
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0.alpha = 0;
}

createzones()
{
    level.grnd_dropzones = [];
    var_0 = getentarray( "grnd_dropZone", "targetname" );

    if ( isdefined( var_0 ) && var_0.size )
    {
        var_1 = 0;

        foreach ( var_3 in var_0 )
        {
            level.grnd_dropzones[level.script][var_1] = var_3.origin;
            var_1++;
        }
    }
    else
    {
        level.grnd_dropzones["mp_seatown"][0] = ( -1226.0, -1399.0, 204.0 );
        level.grnd_dropzones["mp_seatown"][1] = ( 1048.0, 886.0, 228.0 );
        level.grnd_dropzones["mp_seatown"][2] = ( -2086.0, 1263.0, 260.0 );
        level.grnd_dropzones["mp_seatown"][3] = ( -2297.0, -855.0, 210.0 );
        level.grnd_dropzones["mp_seatown"][4] = ( -2261.0, -334.0, 248.0 );
        level.grnd_dropzones["mp_seatown"][5] = ( -2048.0, 512.0, 248.0 );
        level.grnd_dropzones["mp_seatown"][6] = ( -1439.0, 1065.0, 72.0 );
        level.grnd_dropzones["mp_seatown"][7] = ( -410.0, 982.0, 127.0 );
        level.grnd_dropzones["mp_seatown"][8] = ( -666.0, -217.0, 226.0 );
        level.grnd_dropzones["mp_seatown"][9] = ( -523.0, -875.0, 280.0 );
        level.grnd_dropzones["mp_seatown"][10] = ( -345.0, -1449.0, 254.0 );
        level.grnd_dropzones["mp_seatown"][11] = ( 1167.0, -533.0, 294.0 );
        level.grnd_dropzones["mp_seatown"][12] = ( 367.0, 991.0, 179.0 );
        level.grnd_dropzones["mp_seatown"][13] = ( 1106.0, 219.0, 292.0 );
        level.grnd_dropzones["mp_dome"][0] = ( 97.0, 898.0, -240.0 );
        level.grnd_dropzones["mp_dome"][1] = ( -226.0, 1464.0, -231.0 );
        level.grnd_dropzones["mp_dome"][2] = ( -603.0, 194.0, -358.0 );
        level.grnd_dropzones["mp_dome"][3] = ( 814.0, -406.0, -335.0 );
        level.grnd_dropzones["mp_dome"][4] = ( 5.0, 1975.0, -231.0 );
        level.grnd_dropzones["mp_dome"][5] = ( -673.0, 1100.0, -284.0 );
        level.grnd_dropzones["mp_dome"][6] = ( 669.0, 1028.0, -255.0 );
        level.grnd_dropzones["mp_dome"][7] = ( 1231.0, 807.0, -267.0 );
        level.grnd_dropzones["mp_dome"][8] = ( 709.0, 210.0, -342.0 );
        level.grnd_dropzones["mp_dome"][9] = ( 1223.0, 10.0, -336.0 );
        level.grnd_dropzones["mp_dome"][10] = ( -222.0, 418.0, -333.0 );
        level.grnd_dropzones["mp_dome"][11] = ( 501.0, -183.0, -330.0 );
        level.grnd_dropzones["mp_plaza2"][0] = ( 221.0, 440.0, 754.0 );
        level.grnd_dropzones["mp_plaza2"][1] = ( 155.0, 1763.0, 668.0 );
        level.grnd_dropzones["mp_plaza2"][2] = ( -430.0, 1871.0, 691.0 );
        level.grnd_dropzones["mp_plaza2"][3] = ( -1190.0, 1759.0, 668.0 );
        level.grnd_dropzones["mp_plaza2"][4] = ( -1273.0, 1279.0, 829.0 );
        level.grnd_dropzones["mp_plaza2"][5] = ( -593.0, 1274.0, 676.0 );
        level.grnd_dropzones["mp_plaza2"][6] = ( -251.0, 1006.0, 722.0 );
        level.grnd_dropzones["mp_plaza2"][7] = ( 80.0, 1343.0, 676.0 );
        level.grnd_dropzones["mp_plaza2"][8] = ( 397.0, -99.0, 708.0 );
        level.grnd_dropzones["mp_plaza2"][9] = ( -1109.0, 92.0, 741.0 );
        level.grnd_dropzones["mp_plaza2"][10] = ( -280.0, -195.0, 700.0 );
        level.grnd_dropzones["mp_plaza2"][11] = ( 28.0, -1600.0, 668.0 );
        level.grnd_dropzones["mp_plaza2"][12] = ( 764.0, -1752.0, 669.0 );
        level.grnd_dropzones["mp_mogadishu"][0] = ( 1448.0, 1945.0, 39.0 );
        level.grnd_dropzones["mp_mogadishu"][1] = ( 1499.0, -1193.0, 15.0 );
        level.grnd_dropzones["mp_mogadishu"][2] = ( 791.0, -880.0, 16.0 );
        level.grnd_dropzones["mp_mogadishu"][3] = ( 38.0, -1007.0, 16.0 );
        level.grnd_dropzones["mp_mogadishu"][4] = ( -691.0, -260.0, 22.0 );
        level.grnd_dropzones["mp_mogadishu"][5] = ( 2.0, 52.0, 2.0 );
        level.grnd_dropzones["mp_mogadishu"][6] = ( 664.0, 69.0, 12.0 );
        level.grnd_dropzones["mp_mogadishu"][7] = ( 1676.0, 251.0, -1.0 );
        level.grnd_dropzones["mp_mogadishu"][8] = ( 2314.0, 1860.0, 63.0 );
        level.grnd_dropzones["mp_mogadishu"][9] = ( 73.0, 858.0, 3.0 );
        level.grnd_dropzones["mp_mogadishu"][10] = ( 710.0, 837.0, 16.0 );
        level.grnd_dropzones["mp_mogadishu"][11] = ( -549.0, 829.0, 2.0 );
        level.grnd_dropzones["mp_mogadishu"][12] = ( 34.0, 1850.0, 84.0 );
        level.grnd_dropzones["mp_mogadishu"][13] = ( -778.0, 2614.0, 157.0 );
        level.grnd_dropzones["mp_mogadishu"][14] = ( -204.0, 3206.0, 152.0 );
        level.grnd_dropzones["mp_mogadishu"][15] = ( 752.0, 3189.0, 148.0 );
        level.grnd_dropzones["mp_mogadishu"][16] = ( 692.0, 2354.0, 95.0 );
        level.grnd_dropzones["mp_paris"][0] = ( -931.0, -921.0, 110.0 );
        level.grnd_dropzones["mp_paris"][1] = ( 1597.0, 1768.0, 47.0 );
        level.grnd_dropzones["mp_paris"][2] = ( 716.0, 1809.0, 33.0 );
        level.grnd_dropzones["mp_paris"][3] = ( 258.0, 2074.0, 36.0 );
        level.grnd_dropzones["mp_paris"][4] = ( 459.0, 1067.0, 37.0 );
        level.grnd_dropzones["mp_paris"][5] = ( 852.0, 1350.0, 118.0 );
        level.grnd_dropzones["mp_paris"][6] = ( 1601.0, 897.0, 45.0 );
        level.grnd_dropzones["mp_paris"][7] = ( 1286.0, 420.0, 41.0 );
        level.grnd_dropzones["mp_paris"][8] = ( 1613.0, 181.0, 172.0 );
        level.grnd_dropzones["mp_paris"][9] = ( 466.0, -752.0, 67.0 );
        level.grnd_dropzones["mp_paris"][10] = ( 994.0, -625.0, 50.0 );
        level.grnd_dropzones["mp_paris"][11] = ( -211.0, -60.0, 63.0 );
        level.grnd_dropzones["mp_paris"][12] = ( -742.0, 177.0, 133.0 );
        level.grnd_dropzones["mp_paris"][13] = ( -1532.0, 100.0, 250.0 );
        level.grnd_dropzones["mp_paris"][14] = ( -343.0, 1922.0, 121.0 );
        level.grnd_dropzones["mp_paris"][15] = ( -1127.0, 1555.0, 284.0 );
        level.grnd_dropzones["mp_paris"][16] = ( -2025.0, 1327.0, 316.0 );
        level.grnd_dropzones["mp_paris"][17] = ( -1039.0, 841.0, 187.0 );
        level.grnd_dropzones["mp_exchange"][0] = ( -614.0, 1286.0, 113.0 );
        level.grnd_dropzones["mp_exchange"][1] = ( 182.0, 1155.0, 148.0 );
        level.grnd_dropzones["mp_exchange"][2] = ( 1018.0, 1254.0, 120.0 );
        level.grnd_dropzones["mp_exchange"][3] = ( 2182.0, 1322.0, 145.0 );
        level.grnd_dropzones["mp_exchange"][4] = ( 655.0, 815.0, 13.0 );
        level.grnd_dropzones["mp_exchange"][5] = ( 761.0, -312.0, -18.0 );
        level.grnd_dropzones["mp_exchange"][6] = ( 761.0, -771.0, 112.0 );
        level.grnd_dropzones["mp_exchange"][7] = ( 635.0, -1450.0, 110.0 );
        level.grnd_dropzones["mp_exchange"][8] = ( 152.0, -1538.0, 96.0 );
        level.grnd_dropzones["mp_exchange"][9] = ( 303.0, -824.0, 88.0 );
        level.grnd_dropzones["mp_exchange"][10] = ( -953.0, -768.0, 45.0 );
        level.grnd_dropzones["mp_exchange"][11] = ( 2392.0, 1305.0, 144.0 );
        level.grnd_dropzones["mp_exchange"][12] = ( 1634.0, 1329.0, 151.0 );
        level.grnd_dropzones["mp_exchange"][13] = ( 1315.0, 743.0, 159.0 );
        level.grnd_dropzones["mp_bootleg"][0] = ( -1432.0, 1404.0, 8.0 );
        level.grnd_dropzones["mp_bootleg"][1] = ( -1017.0, 1787.0, -39.0 );
        level.grnd_dropzones["mp_bootleg"][2] = ( -590.0, 1514.0, -43.0 );
        level.grnd_dropzones["mp_bootleg"][3] = ( -588.0, 614.0, -12.0 );
        level.grnd_dropzones["mp_bootleg"][4] = ( -1732.0, 84.0, 11.0 );
        level.grnd_dropzones["mp_bootleg"][5] = ( -1809.0, -302.0, 140.0 );
        level.grnd_dropzones["mp_bootleg"][6] = ( -1649.0, -1147.0, 92.0 );
        level.grnd_dropzones["mp_bootleg"][7] = ( -884.0, -1035.0, -4.0 );
        level.grnd_dropzones["mp_bootleg"][8] = ( -719.0, -1673.0, 60.0 );
        level.grnd_dropzones["mp_bootleg"][9] = ( -335.0, -2111.0, 60.0 );
        level.grnd_dropzones["mp_bootleg"][10] = ( 208.0, -1955.0, 68.0 );
        level.grnd_dropzones["mp_bootleg"][11] = ( -198.0, -1726.0, 60.0 );
        level.grnd_dropzones["mp_bootleg"][12] = ( 100.0, -1101.0, -9.0 );
        level.grnd_dropzones["mp_bootleg"][13] = ( -427.0, -100.0, -8.0 );
        level.grnd_dropzones["mp_bootleg"][14] = ( 949.0, -1132.0, -10.0 );
        level.grnd_dropzones["mp_bootleg"][15] = ( 884.0, 1182.0, -28.0 );
        level.grnd_dropzones["mp_bootleg"][16] = ( 242.0, 1194.0, -45.0 );
        level.grnd_dropzones["mp_carbon"][0] = ( -3330.0, -3392.0, 3630.0 );
        level.grnd_dropzones["mp_carbon"][1] = ( -3635.0, -3735.0, 3630.0 );
        level.grnd_dropzones["mp_carbon"][2] = ( -3625.0, -4189.0, 3633.0 );
        level.grnd_dropzones["mp_carbon"][3] = ( -2992.0, -4339.0, 3627.0 );
        level.grnd_dropzones["mp_carbon"][4] = ( -2925.0, -4999.0, 3673.0 );
        level.grnd_dropzones["mp_carbon"][5] = ( -2573.0, -4771.0, 3784.0 );
        level.grnd_dropzones["mp_carbon"][6] = ( -1705.0, -4643.0, 3813.0 );
        level.grnd_dropzones["mp_carbon"][7] = ( -1799.0, -3957.0, 3813.0 );
        level.grnd_dropzones["mp_carbon"][8] = ( -2141.0, -3647.0, 3815.0 );
        level.grnd_dropzones["mp_carbon"][9] = ( -3212.0, -2879.0, 3807.0 );
        level.grnd_dropzones["mp_carbon"][10] = ( -1623.0, -3339.0, 3808.0 );
        level.grnd_dropzones["mp_carbon"][11] = ( -1223.0, -4234.0, 3834.0 );
        level.grnd_dropzones["mp_carbon"][12] = ( -896.0, -4888.0, 3944.0 );
        level.grnd_dropzones["mp_carbon"][13] = ( -228.0, -4535.0, 3975.0 );
        level.grnd_dropzones["mp_carbon"][14] = ( -257.0, -3865.0, 3956.0 );
        level.grnd_dropzones["mp_carbon"][15] = ( -215.0, -3260.0, 3967.0 );
        level.grnd_dropzones["mp_carbon"][16] = ( -535.0, -3798.0, 3966.0 );
        level.grnd_dropzones["mp_hardhat"][0] = ( 2125.0, -364.0, 266.0 );
        level.grnd_dropzones["mp_hardhat"][1] = ( 1959.0, -772.0, 352.0 );
        level.grnd_dropzones["mp_hardhat"][2] = ( 1883.0, -1384.0, 351.0 );
        level.grnd_dropzones["mp_hardhat"][3] = ( 848.0, -1520.0, 334.0 );
        level.grnd_dropzones["mp_hardhat"][4] = ( 1326.0, -1380.0, 342.0 );
        level.grnd_dropzones["mp_hardhat"][5] = ( -338.0, -1273.0, 348.0 );
        level.grnd_dropzones["mp_hardhat"][6] = ( -821.0, -884.0, 348.0 );
        level.grnd_dropzones["mp_hardhat"][7] = ( -920.0, -290.0, 230.0 );
        level.grnd_dropzones["mp_hardhat"][8] = ( -463.0, -250.0, 333.0 );
        level.grnd_dropzones["mp_hardhat"][9] = ( -741.0, 208.0, 245.0 );
        level.grnd_dropzones["mp_hardhat"][10] = ( -201.0, 806.0, 437.0 );
        level.grnd_dropzones["mp_hardhat"][11] = ( 224.0, 980.0, 436.0 );
        level.grnd_dropzones["mp_hardhat"][12] = ( 1125.0, 656.0, 255.0 );
        level.grnd_dropzones["mp_hardhat"][13] = ( 1531.0, 1241.0, 364.0 );
        level.grnd_dropzones["mp_hardhat"][14] = ( 1522.0, 542.0, 244.0 );
        level.grnd_dropzones["mp_alpha"][0] = ( -1979.0, 1653.0, 148.0 );
        level.grnd_dropzones["mp_alpha"][1] = ( -1392.0, 1623.0, 60.0 );
        level.grnd_dropzones["mp_alpha"][2] = ( -1697.0, 1205.0, 52.0 );
        level.grnd_dropzones["mp_alpha"][3] = ( -1671.0, 692.0, 54.0 );
        level.grnd_dropzones["mp_alpha"][4] = ( -572.0, -272.0, 55.0 );
        level.grnd_dropzones["mp_alpha"][5] = ( 634.0, -345.0, 52.0 );
        level.grnd_dropzones["mp_alpha"][6] = ( 391.0, 121.0, 60.0 );
        level.grnd_dropzones["mp_alpha"][7] = ( 291.0, 1271.0, 60.0 );
        level.grnd_dropzones["mp_alpha"][8] = ( -459.0, 868.0, 52.0 );
        level.grnd_dropzones["mp_alpha"][9] = ( -353.0, 1334.0, 52.0 );
        level.grnd_dropzones["mp_alpha"][10] = ( -37.0, 1637.0, 52.0 );
        level.grnd_dropzones["mp_alpha"][11] = ( -5.0, 2226.0, 52.0 );
        level.grnd_dropzones["mp_alpha"][12] = ( -407.0, 2198.0, 196.0 );
        level.grnd_dropzones["mp_village"][0] = ( 647.0, 1891.0, 332.0 );
        level.grnd_dropzones["mp_village"][1] = ( -26.0, 1749.0, 334.0 );
        level.grnd_dropzones["mp_village"][2] = ( 104.0, 1292.0, 323.0 );
        level.grnd_dropzones["mp_village"][3] = ( -1064.0, 1552.0, 322.0 );
        level.grnd_dropzones["mp_village"][4] = ( -599.0, 886.0, 378.0 );
        level.grnd_dropzones["mp_village"][5] = ( -1038.0, 569.0, 317.0 );
        level.grnd_dropzones["mp_village"][6] = ( -1899.0, 1217.0, 336.0 );
        level.grnd_dropzones["mp_village"][7] = ( -1540.0, 289.0, 304.0 );
        level.grnd_dropzones["mp_village"][8] = ( -454.0, -277.0, 270.0 );
        level.grnd_dropzones["mp_village"][9] = ( -1734.0, -790.0, 365.0 );
        level.grnd_dropzones["mp_village"][10] = ( -1418.0, -1371.0, 431.0 );
        level.grnd_dropzones["mp_village"][11] = ( -928.0, -749.0, 417.0 );
        level.grnd_dropzones["mp_village"][12] = ( -861.0, -2105.0, 408.0 );
        level.grnd_dropzones["mp_village"][13] = ( -191.0, -1550.0, 400.0 );
        level.grnd_dropzones["mp_village"][14] = ( 357.0, -678.0, 245.0 );
        level.grnd_dropzones["mp_village"][15] = ( -216.0, 295.0, 223.0 );
        level.grnd_dropzones["mp_village"][16] = ( 162.0, -199.0, 229.0 );
        level.grnd_dropzones["mp_village"][17] = ( 179.0, -3052.0, 447.0 );
        level.grnd_dropzones["mp_village"][18] = ( 510.0, -1790.0, 375.0 );
        level.grnd_dropzones["mp_village"][19] = ( 1089.0, -615.0, 398.0 );
        level.grnd_dropzones["mp_village"][20] = ( 1631.0, 394.0, 297.0 );
        level.grnd_dropzones["mp_village"][21] = ( 1007.0, 1385.0, 337.0 );
        level.grnd_dropzones["mp_village"][22] = ( 992.0, 248.0, 330.0 );
        level.grnd_dropzones["mp_village"][23] = ( 551.0, 732.0, 386.0 );
        level.grnd_dropzones["mp_lambeth"][0] = ( -293.0, -1286.0, -180.0 );
        level.grnd_dropzones["mp_lambeth"][1] = ( -938.0, -785.0, -130.0 );
        level.grnd_dropzones["mp_lambeth"][2] = ( -375.0, -250.0, -187.0 );
        level.grnd_dropzones["mp_lambeth"][3] = ( -355.0, 409.0, -196.0 );
        level.grnd_dropzones["mp_lambeth"][4] = ( 161.0, -5.0, -181.0 );
        level.grnd_dropzones["mp_lambeth"][5] = ( 682.0, -407.0, -197.0 );
        level.grnd_dropzones["mp_lambeth"][6] = ( 694.0, 263.0, -196.0 );
        level.grnd_dropzones["mp_lambeth"][7] = ( 690.0, 1158.0, -243.0 );
        level.grnd_dropzones["mp_lambeth"][8] = ( 1181.0, 801.0, -67.0 );
        level.grnd_dropzones["mp_lambeth"][9] = ( 1281.0, 1248.0, -257.0 );
        level.grnd_dropzones["mp_lambeth"][10] = ( 2057.0, 757.0, -249.0 );
        level.grnd_dropzones["mp_lambeth"][11] = ( 1470.0, -1040.0, -109.0 );
        level.grnd_dropzones["mp_lambeth"][12] = ( 1761.0, -258.0, -210.0 );
        level.grnd_dropzones["mp_lambeth"][13] = ( 2800.0, -652.0, -186.0 );
        level.grnd_dropzones["mp_lambeth"][14] = ( 2785.0, 445.0, -244.0 );
        level.grnd_dropzones["mp_lambeth"][15] = ( 2751.0, 1090.0, -263.0 );
        level.grnd_dropzones["mp_lambeth"][16] = ( 1535.0, 1980.0, -214.0 );
        level.grnd_dropzones["mp_lambeth"][17] = ( 1262.0, 2602.0, -213.0 );
        level.grnd_dropzones["mp_lambeth"][18] = ( 419.0, 2218.0, -183.0 );
        level.grnd_dropzones["mp_lambeth"][19] = ( 170.0, 1631.0, -182.0 );
        level.grnd_dropzones["mp_lambeth"][20] = ( -606.0, 1549.0, -201.0 );
        level.grnd_dropzones["mp_lambeth"][21] = ( -1199.0, 1030.0, -196.0 );
        level.grnd_dropzones["mp_radar"][0] = ( -3482.0, -498.0, 1222.0 );
        level.grnd_dropzones["mp_radar"][1] = ( -4263.0, -124.0, 1229.0 );
        level.grnd_dropzones["mp_radar"][2] = ( -4006.0, 827.0, 1238.0 );
        level.grnd_dropzones["mp_radar"][3] = ( -3375.0, 342.0, 1222.0 );
        level.grnd_dropzones["mp_radar"][4] = ( -4623.0, 531.0, 1298.0 );
        level.grnd_dropzones["mp_radar"][5] = ( -5157.0, 877.0, 1200.0 );
        level.grnd_dropzones["mp_radar"][6] = ( -5950.0, 1071.0, 1305.0 );
        level.grnd_dropzones["mp_radar"][7] = ( -6509.0, 1660.0, 1299.0 );
        level.grnd_dropzones["mp_radar"][8] = ( -7013.0, 2955.0, 1359.0 );
        level.grnd_dropzones["mp_radar"][9] = ( -6333.0, 3473.0, 1421.0 );
        level.grnd_dropzones["mp_radar"][10] = ( -5675.0, 2923.0, 1388.0 );
        level.grnd_dropzones["mp_radar"][11] = ( -7119.0, 4357.0, 1380.0 );
        level.grnd_dropzones["mp_radar"][12] = ( -5487.0, 4077.0, 1356.0 );
        level.grnd_dropzones["mp_radar"][13] = ( -5736.0, 2960.0, 1407.0 );
        level.grnd_dropzones["mp_radar"][14] = ( -4908.0, 3281.0, 1225.0 );
        level.grnd_dropzones["mp_radar"][15] = ( -4421.0, 4071.0, 1268.0 );
        level.grnd_dropzones["mp_radar"][16] = ( -4979.0, 1816.0, 1205.0 );
        level.grnd_dropzones["mp_radar"][17] = ( -4874.0, 2306.0, 1223.0 );
        level.grnd_dropzones["mp_interchange"][0] = ( 2465.0, -402.0, 149.0 );
        level.grnd_dropzones["mp_interchange"][1] = ( 2128.0, 199.0, 68.0 );
        level.grnd_dropzones["mp_interchange"][2] = ( 1280.0, 1263.0, 126.0 );
        level.grnd_dropzones["mp_interchange"][3] = ( 762.0, 1747.0, 114.0 );
        level.grnd_dropzones["mp_interchange"][4] = ( -9.0, 1836.0, 38.0 );
        level.grnd_dropzones["mp_interchange"][5] = ( -284.0, 1171.0, 159.0 );
        level.grnd_dropzones["mp_interchange"][6] = ( -1028.0, 944.0, 31.0 );
        level.grnd_dropzones["mp_interchange"][7] = ( -256.0, 264.0, 126.0 );
        level.grnd_dropzones["mp_interchange"][8] = ( 462.0, -463.0, 158.0 );
        level.grnd_dropzones["mp_interchange"][9] = ( 1029.0, -1045.0, 179.0 );
        level.grnd_dropzones["mp_interchange"][10] = ( 1760.0, -1434.0, 142.0 );
        level.grnd_dropzones["mp_interchange"][11] = ( 1538.0, -361.0, 142.0 );
        level.grnd_dropzones["mp_interchange"][12] = ( 1150.0, -2977.0, 171.0 );
        level.grnd_dropzones["mp_interchange"][13] = ( 371.0, -2883.0, 209.0 );
        level.grnd_dropzones["mp_interchange"][14] = ( 399.0, -2149.0, 220.0 );
        level.grnd_dropzones["mp_underground"][0] = ( -602.0, 3072.0, -68.0 );
        level.grnd_dropzones["mp_underground"][1] = ( -285.0, 2551.0, -215.0 );
        level.grnd_dropzones["mp_underground"][2] = ( 574.0, 2656.0, -40.0 );
        level.grnd_dropzones["mp_underground"][3] = ( -627.0, 1579.0, -196.0 );
        level.grnd_dropzones["mp_underground"][4] = ( 28.0, 1556.0, -196.0 );
        level.grnd_dropzones["mp_underground"][5] = ( 727.0, 1615.0, -196.0 );
        level.grnd_dropzones["mp_underground"][6] = ( -1491.0, 1268.0, -196.0 );
        level.grnd_dropzones["mp_underground"][7] = ( -1370.0, 1757.0, -196.0 );
        level.grnd_dropzones["mp_underground"][8] = ( -1259.0, 599.0, -156.0 );
        level.grnd_dropzones["mp_underground"][9] = ( -959.0, -26.0, 60.0 );
        level.grnd_dropzones["mp_underground"][10] = ( -303.0, -562.0, 60.0 );
        level.grnd_dropzones["mp_underground"][11] = ( 193.0, -922.0, 60.0 );
        level.grnd_dropzones["mp_underground"][12] = ( 305.0, 817.0, -68.0 );
        level.grnd_dropzones["mp_underground"][13] = ( -276.0, 370.0, -68.0 );
        level.grnd_dropzones["mp_bravo"][0] = ( -1359.0, 608.0, 975.0 );
        level.grnd_dropzones["mp_bravo"][1] = ( -1686.0, 313.0, 991.0 );
        level.grnd_dropzones["mp_bravo"][2] = ( -1228.0, 41.0, 976.0 );
        level.grnd_dropzones["mp_bravo"][3] = ( -732.0, -715.0, 1032.0 );
        level.grnd_dropzones["mp_bravo"][4] = ( 31.0, -771.0, 1038.0 );
        level.grnd_dropzones["mp_bravo"][5] = ( 986.0, -833.0, 1116.0 );
        level.grnd_dropzones["mp_bravo"][6] = ( 1800.0, -577.0, 1229.0 );
        level.grnd_dropzones["mp_bravo"][7] = ( 1588.0, -55.0, 1181.0 );
        level.grnd_dropzones["mp_bravo"][8] = ( 619.0, 916.0, 1175.0 );
        level.grnd_dropzones["mp_bravo"][9] = ( -129.0, 1310.0, 1228.0 );
        level.grnd_dropzones["mp_bravo"][10] = ( -726.0, 1272.0, 1268.0 );
        level.grnd_dropzones["mp_bravo"][11] = ( -741.0, 752.0, 1053.0 );
        level.grnd_dropzones["mp_bravo"][12] = ( 6.0, -136.0, 1282.0 );
    }
}
