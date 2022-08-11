// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();
    maps\mp\_utility::registertimelimitdvar( level.gametype, 3, 0, 1440 );
    maps\mp\_utility::registerscorelimitdvar( level.gametype, 101, 0, 10000 );
    maps\mp\_utility::registerroundlimitdvar( level.gametype, 1, 0, 30 );
    maps\mp\_utility::registerwinlimitdvar( level.gametype, 1, 0, 10 );
    maps\mp\_utility::registerroundswitchdvar( level.gametype, 0, 0, 30 );
    maps\mp\_utility::registernumlivesdvar( level.gametype, 0, 0, 10 );
    maps\mp\_utility::registerhalftimedvar( level.gametype, 0, 0, 1 );
    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.ondeadevent = ::ondeadevent;
    level.initgametypeawards = ::initgametypeawards;
    level.ontimelimit = ::ontimelimit;
    level.onnormaldeath = ::onnormaldeath;
    level.gtnw = 1;
    game["dialog"]["gametype"] = "gtw";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    game["dialog"]["offense_obj"] = "obj_destroy";
    game["dialog"]["defense_obj"] = "obj_defend";
    level thread onplayerconnect();
}

gtnw_endgame( var_0, var_1 )
{
    thread maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_1 = var_0 maps\mp\gametypes\_hud_util::createprimaryprogressbar();
        var_2 = var_0 maps\mp\gametypes\_hud_util::createprimaryprogressbartext();
        var_2 settext( &"MP_CAPTURING_NUKE" );
        var_1.usetime = 100;
        var_0.usebar = var_1;
        var_0.usebar maps\mp\gametypes\_hud_util::hideelem();
        var_0.usebartext = var_2;
        var_0.usebartext maps\mp\gametypes\_hud_util::hideelem();
    }
}

onstartgametype()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( !isdefined( game["original_defenders"] ) )
        game["original_defenders"] = game["defenders"];

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    setclientnamemode( "auto_change" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_GTNW" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_GTNW" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_GTNW_SCORE" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_GTNW_SCORE" );
    }

    maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_GTNW" );
    maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_GTNW" );
    maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_GTNW_HINT" );
    maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_GTNW_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_ctf_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_ctf_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_ctf_spawn_allies" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_ctf_spawn_axis" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 20 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 500 );
    var_2[0] = "airdrop_pallet";
    var_2[1] = "gtnw";
    var_2[2] = "gtnw_zone";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    thread setupnukesite();
}

onprecachegametype()
{
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_target" );
    precacheshader( "waypoint_capture" );
    precacheshader( "compass_waypoint_target" );
    precacheshader( "compass_waypoint_defend" );
    precacheshader( "compass_waypoint_capture" );
    precachestring( &"MP_CAPTURING_NUKE" );
    return;
}

setupnukesite()
{
    level.laststatus["allies"] = 0;
    level.laststatus["axis"] = 0;
    var_0 = getent( "gtnw_zone", "targetname" );
    var_1 = [];
    var_2 = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", var_0, var_1, ( 0.0, 0.0, 100.0 ) );
    var_2 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "compass_waypoint_defend" );
    var_2 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" );
    var_2 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "compass_waypoint_captureneutral" );
    var_2 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_captureneutral" );
    var_2 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
    var_2.nousebar = 1;
    var_2 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    var_2.onbeginuse = ::onbeginuse;
    var_2.onenduse = ::onenduse;
    level.nukesite = var_2;
    var_2 thread scorecounter();
}

getspawnpoint()
{
    if ( self.team == "axis" )
        var_0 = game["attackers"];
    else
        var_0 = game["defenders"];

    if ( level.ingraceperiod )
    {
        var_1 = getentarray( "mp_ctf_spawn_" + var_0 + "_start", "classname" );
        var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_1 );
    }
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_1 );
    }

    return var_2;
}

spawnfxdelay( var_0, var_1, var_2, var_3, var_4 )
{
    wait(var_4);
    var_5 = spawnfx( var_0, var_1, var_2, var_3 );
    triggerfx( var_5 );
}

ondeadevent( var_0 )
{
    if ( isdefined( level.nukeincoming ) && level.nukeincoming || isdefined( level.nukedetonated ) && level.nukedetonated )
        return;

    if ( var_0 == game["attackers"] )
    {
        maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_0, 1 );
        level thread gtnw_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
    {
        maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_0, 1 );
        level thread gtnw_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
    }
}

initgametypeawards()
{
    return;
}

ontimelimit()
{
    if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
        level thread overtimethread();
    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["time_limit_reached"] );
    else if ( game["teamScores"]["axis"] < game["teamScores"]["allies"] )
        thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["time_limit_reached"] );
}

overtimethread( var_0 )
{
    level endon( "game_ended" );
    level.inovertime = 1;
    level thread disablespawning( 5 );
    level.endgametime = 120;
    var_0 = level.endgametime;

    foreach ( var_2 in level.players )
        var_2 thread maps\mp\gametypes\_hud_message::splashnotify( "gtnw_overtime" );

    maps\mp\gametypes\_gamelogic::pausetimer();
    level.timelimitoverride = 1;
    setgameendtime( int( gettime() + level.endgametime * 1000 ) );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithgameendtimeupdate( var_0 );

    if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["time_limit_reached"] );
    else if ( game["teamScores"]["axis"] < game["teamScores"]["allies"] )
        thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["time_limit_reached"] );
    else
        thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["time_limit_reached"] );
}

disablespawning( var_0 )
{
    level endon( "game_ended" );
    wait 5;
    level.disablespawning = 1;
}

onbeginuse( var_0 )
{
    var_0.usebar maps\mp\gametypes\_hud_util::showelem();
    var_0.usebartext maps\mp\gametypes\_hud_util::showelem();
    return;
}

onenduse( var_0, var_1, var_2 )
{
    var_1.usebar maps\mp\gametypes\_hud_util::hideelem();
    var_1.usebartext maps\mp\gametypes\_hud_util::hideelem();
    return;
}

scorecounter()
{
    level endon( "game_ended" );
    self endon( "stop_counting" );

    for (;;)
    {
        if ( !self.touchlist["axis"].size && !self.touchlist["allies"].size )
        {
            setdvar( "ui_danger_team", "none" );
            maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "compass_waypoint_captureneutral" );
            maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_captureneutral" );
            maps\mp\gametypes\_gameobjects::setownerteam( "none" );
            updatehudelems();
            wait 1;
            continue;
        }

        maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "compass_waypoint_defend" );
        maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" );
        maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "compass_waypoint_capture" );
        maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_capture" );

        if ( self.touchlist["axis"].size > self.touchlist["allies"].size )
        {
            if ( maps\mp\gametypes\_gamescore::_getteamscore( "axis" ) < 100 )
                maps\mp\gametypes\_gamescore::giveteamscoreforobjective( "axis", 1 );

            thread setusebarscore( "axis" );
            setdvar( "ui_danger_team", "allies" );
            maps\mp\gametypes\_gameobjects::setownerteam( "axis" );

            if ( maps\mp\gametypes\_gamescore::_getteamscore( "axis" ) >= 100 )
            {
                maps\mp\gametypes\_gameobjects::allowuse( "none" );
                activatenuke( "axis" );
                self notify( "stop_counting" );
            }
        }
        else if ( self.touchlist["axis"].size < self.touchlist["allies"].size )
        {
            if ( maps\mp\gametypes\_gamescore::_getteamscore( "allies" ) < 100 )
                maps\mp\gametypes\_gamescore::giveteamscoreforobjective( "allies", 1 );

            thread setusebarscore( "allies" );
            setdvar( "ui_danger_team", "axis" );
            maps\mp\gametypes\_gameobjects::setownerteam( "allies" );

            if ( maps\mp\gametypes\_gamescore::_getteamscore( "allies" ) >= 100 )
            {
                maps\mp\gametypes\_gameobjects::allowuse( "none" );
                activatenuke( "allies" );
                self notify( "stop_counting" );
            }
        }
        else
        {
            maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "compass_waypoint_captureneutral" );
            maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_captureneutral" );
            maps\mp\gametypes\_gameobjects::setownerteam( "none" );
            setdvar( "ui_danger_team", "contested" );
        }

        updatehudelems();
        wait 1;
    }
}

activatenuke( var_0 )
{
    giveflagcapturexp( self.touchlist[var_0] );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    maps\mp\gametypes\_gameobjects::allowuse( "none" );
    var_1 = 99999999;
    var_2 = undefined;

    foreach ( var_4 in level.players )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_4.usebar maps\mp\gametypes\_hud_util::hideelem();
        var_4.usebartext maps\mp\gametypes\_hud_util::hideelem();

        if ( var_4.team != var_0 )
            continue;

        if ( !isdefined( self.touchlist[var_0][var_4.guid] ) )
            continue;

        var_5 = self.touchlist[var_0][var_4.guid].starttime;

        if ( var_5 < var_1 )
        {
            var_2 = var_4;
            var_1 = var_5;
        }
    }

    var_2 maps\mp\killstreaks\_nuke::tryusenuke( 1 );
}

giveflagcapturexp( var_0 )
{
    level endon( "game_ended" );
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_0[var_1[var_2]].player;
        var_3 thread maps\mp\gametypes\_hud_message::splashnotify( "captured_nuke", maps\mp\gametypes\_rank::getscoreinfovalue( "capture" ) );
        var_3 thread [[ level.onxpevent ]]( "capture" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_3 );
    }
}

setusebarscore( var_0 )
{
    var_1 = getteamscore( var_0 );

    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3.team != var_0 )
            continue;

        if ( !isdefined( self.touchlist[var_0][var_3.guid] ) )
            continue;

        var_3.usebar maps\mp\gametypes\_hud_util::updatebar( var_1 / 100, 0 );
    }
}

updatehudelems()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( self.touchlist["axis"][var_1.guid] ) && !isdefined( self.touchlist["allies"][var_1.guid] ) )
        {
            var_1.usebar maps\mp\gametypes\_hud_util::hideelem();
            var_1.usebartext maps\mp\gametypes\_hud_util::hideelem();
        }

        if ( isdefined( self.touchlist["axis"][var_1.guid] ) || isdefined( self.touchlist["allies"][var_1.guid] ) )
        {
            var_1.usebar maps\mp\gametypes\_hud_util::showelem();
            var_1.usebartext maps\mp\gametypes\_hud_util::showelem();
        }
    }
}

onnormaldeath( var_0, var_1, var_2 )
{
    if ( !isdefined( level.inovertime ) || !level.inovertime )
        return;

    var_3 = var_0.team;

    if ( game["state"] == "postgame" )
        var_1.finalkill = 1;
}
