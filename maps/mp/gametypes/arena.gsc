// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();
    maps\mp\_utility::registerroundswitchdvar( level.gametype, 0, 0, 9 );
    maps\mp\_utility::registertimelimitdvar( level.gametype, 10, 0, 1440 );
    maps\mp\_utility::registerscorelimitdvar( level.gametype, 500, 0, 5000 );
    maps\mp\_utility::registerroundlimitdvar( level.gametype, 1, 0, 10 );
    maps\mp\_utility::registerwinlimitdvar( level.gametype, 1, 0, 10 );
    maps\mp\_utility::registerroundswitchdvar( level.gametype, 3, 0, 30 );
    maps\mp\_utility::registernumlivesdvar( level.gametype, 0, 0, 10 );
    maps\mp\_utility::registerhalftimedvar( level.gametype, 0, 0, 1 );
    level.teambased = 1;
    level.objectivebased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onnormaldeath = ::onnormaldeath;
    level.onplayerkilled = ::onplayerkilled;
    level.ondeadevent = ::ondeadevent;
    game["dialog"]["gametype"] = "arena";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];

    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
}

onprecachegametype()
{
    precacheshader( "compass_waypoint_captureneutral" );
    precacheshader( "compass_waypoint_capture" );
    precacheshader( "compass_waypoint_defend" );
    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_ARENA" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_ARENA" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_ARENA" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_ARENA" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_ARENA_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_ARENA_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_ARENA_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_ARENA_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_2[0] = "dom";
    var_2[1] = "airdrop_pallet";
    var_2[2] = "arena";
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 200 );
    maps\mp\gametypes\_gameobjects::main( var_2 );
    precacheflag();
    thread arenaflagwaiter();
    thread arenatimeflagwaiter();
}

precacheflag()
{
    game["flagmodels"] = [];
    game["flagmodels"]["neutral"] = "prop_flag_neutral";
    game["flagmodels"]["allies"] = maps\mp\gametypes\_teams::getteamflagmodel( "allies" );
    game["flagmodels"]["axis"] = maps\mp\gametypes\_teams::getteamflagmodel( "axis" );
    precachemodel( game["flagmodels"]["neutral"] );
    precachemodel( game["flagmodels"]["allies"] );
    precachemodel( game["flagmodels"]["axis"] );
    precachestring( &"MP_CAPTURING_FLAG" );
    precachestring( &"MP_LOSING_FLAG" );
    precachestring( &"MP_DOM_YOUR_FLAG_WAS_CAPTURED" );
    precachestring( &"MP_DOM_ENEMY_FLAG_CAPTURED" );
    precachestring( &"MP_DOM_NEUTRAL_FLAG_CAPTURED" );
    precachestring( &"MP_ENEMY_FLAG_CAPTURED_BY" );
    precachestring( &"MP_NEUTRAL_FLAG_CAPTURED_BY" );
    precachestring( &"MP_FRIENDLY_FLAG_CAPTURED_BY" );
}

arenatimeflagwaiter()
{
    level endon( "down_to_one" );
    level endon( "game_end" );

    for (;;)
    {
        var_0 = maps\mp\gametypes\_gamelogic::gettimeremaining();

        if ( var_0 < 61000 )
            break;

        wait 1;
    }

    level notify( "arena_flag_time" );
    thread arenaflag();
}

arenaflagwaiter()
{
    level endon( "game_end" );
    level endon( "arena_flag_time" );

    for (;;)
    {
        if ( level.ingraceperiod == 0 )
            break;

        wait 0.05;
    }

    for (;;)
    {
        if ( getteamplayersalive( "axis" ) == 1 )
        {
            thread arenaflag();
            level notify( "down_to_one" );
            break;
        }

        if ( getteamplayersalive( "allies" ) == 1 )
        {
            thread arenaflag();
            level notify( "down_to_one" );
            break;
        }

        wait 1;
    }
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::getotherteam( var_0 );

    if ( level.ingraceperiod )
    {
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_tdm_spawn_" + var_0 + "_start" );
        var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_1 );
    }
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_1 );
    }

    return var_2;
}

onspawnplayer()
{
    self.usingobj = undefined;
    level notify( "spawned_player" );
}

onnormaldeath( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill" );
    var_1 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_1.pers["team"], var_3 );
    var_4 = var_0.team;

    if ( game["state"] == "postgame" )
        var_1.finalkill = 1;
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    thread checkallowspectating();
}

ontimelimit()
{
    if ( game["status"] == "overtime" )
        var_0 = "forfeit";
    else if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
        var_0 = "overtime";
    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        var_0 = "axis";
    else
        var_0 = "allies";

    thread maps\mp\gametypes\_gamelogic::endgame( var_0, game["strings"]["time_limit_reached"] );
}

checkallowspectating()
{
    wait 0.05;
    var_0 = 0;

    if ( !level.alivecount[game["attackers"]] )
    {
        level.spectateoverride[game["attackers"]].allowenemyspectate = 1;
        var_0 = 1;
    }

    if ( !level.alivecount[game["defenders"]] )
    {
        level.spectateoverride[game["defenders"]].allowenemyspectate = 1;
        var_0 = 1;
    }

    if ( var_0 )
        maps\mp\gametypes\_spectating::updatespectatesettings();
}

arenaflag()
{
    level.laststatus["allies"] = 0;
    level.laststatus["axis"] = 0;
    var_0 = getentarray( "flag_arena", "targetname" );
    var_1 = getentarray( "flag_primary", "targetname" );
    var_2 = getentarray( "flag_secondary", "targetname" );

    if ( !isdefined( var_0[0] ) )
    {
        if ( var_1.size + var_2.size < 1 )
        {
            maps\mp\gametypes\_callbacksetup::abortlevel();
            return;
        }

        setupdomflag( var_1, var_2 );
    }
    else
        level.arenaflag = var_0[0];

    var_3 = level.arenaflag;

    if ( isdefined( var_3.target ) )
        var_4[0] = getent( var_3.target, "targetname" );
    else
    {
        var_4[0] = spawn( "script_model", var_3.origin );
        var_4[0].angles = var_3.angles;
    }

    var_4[0] setmodel( game["flagmodels"]["neutral"] );
    var_0 = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", var_3, var_4, ( 0.0, 0.0, 100.0 ) );
    var_0 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
    var_0 maps\mp\gametypes\_gameobjects::setusetime( 20.0 );
    var_0 maps\mp\gametypes\_gameobjects::setusetext( &"MP_CAPTURING_FLAG" );
    var_5 = var_0 maps\mp\gametypes\_gameobjects::getlabel();
    var_0.label = var_5;
    var_0 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "compass_waypoint_defend" );
    var_0 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" );
    var_0 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "compass_waypoint_captureneutral" );
    var_0 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_captureneutral" );
    var_0 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    var_0.onuse = ::onuse;
    var_0.onbeginuse = ::onbeginuse;
    var_0.onuseupdate = ::onuseupdate;
    var_0.onenduse = ::onenduse;
    var_0.isarena = 1;
    iprintlnbold( "Arena flag spawned" );
    level.arenaflag playsound( "flag_spawned" );
    var_6 = var_4[0].origin + ( 0.0, 0.0, 32.0 );
    var_7 = var_4[0].origin + ( 0.0, 0.0, -32.0 );
    var_8 = bullettrace( var_6, var_7, 0, undefined );
    var_9 = vectortoangles( var_8["normal"] );
    var_0.baseeffectforward = anglestoforward( var_9 );
    var_0.baseeffectright = anglestoright( var_9 );
    var_0.baseeffectpos = var_8["position"];
    var_0.levelflag = level.arenaflag;
    level.arenaflag = var_0;
}

setupdomflag( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2].script_label;

        if ( var_3 != "_b" )
        {
            var_0[var_2] delete();
            continue;
        }

        level.arenaflag = var_0[var_2];
        return;
    }
}

ondeadevent( var_0 )
{
    if ( var_0 == game["attackers"] )
        level thread arena_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    else if ( var_0 == game["defenders"] )
        level thread arena_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
}

arena_endgame( var_0, var_1 )
{
    thread maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
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
        var_3 thread [[ level.onxpevent ]]( "capture" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_3 );
        var_3 thread maps\mp\_matchdata::loggameevent( "capture", var_3.origin );
    }
}

onuse( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_3 = maps\mp\gametypes\_gameobjects::getlabel();
    self.capturetime = gettime();
    maps\mp\gametypes\_gameobjects::setownerteam( var_1 );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "compass_waypoint_capture" );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_capture" );
    self.visuals[0] setmodel( game["flagmodels"][var_1] );

    if ( var_2 == "neutral" )
    {
        var_4 = maps\mp\_utility::getotherteam( var_1 );
        thread maps\mp\_utility::printandsoundoneveryone( var_1, var_4, &"MP_NEUTRAL_FLAG_CAPTURED_BY", &"MP_NEUTRAL_FLAG_CAPTURED_BY", "mp_war_objective_taken", undefined, var_0 );
        statusdialog( "captured_a", var_1 );
        statusdialog( "enemy_has_a", var_4 );
    }
    else
        thread maps\mp\_utility::printandsoundoneveryone( var_1, var_2, &"MP_ENEMY_FLAG_CAPTURED_BY", &"MP_FRIENDLY_FLAG_CAPTURED_BY", "mp_war_objective_taken", "mp_war_objective_lost", var_0 );

    thread giveflagcapturexp( self.touchlist[var_1] );
    var_0 notify( "objective", "captured" );
    thread flagcaptured( var_1, &"MP_DOM_NEUTRAL_FLAG_CAPTURED" );
}

onbeginuse( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::getownerteam();
    self.didstatusnotify = 0;

    if ( var_1 == "neutral" )
    {
        var_2 = maps\mp\_utility::getotherteam( var_0.pers["team"] );
        statusdialog( "securing", var_0.pers["team"] );
        self.objpoints[var_0.pers["team"]] thread maps\mp\gametypes\_objpoints::startflashing();
        statusdialog( "enemy_taking", var_2 );
        return;
    }

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    self.objpoints["allies"] thread maps\mp\gametypes\_objpoints::startflashing();
    self.objpoints["axis"] thread maps\mp\gametypes\_objpoints::startflashing();
}

onuseupdate( var_0, var_1, var_2 )
{
    if ( var_1 > 0.05 && var_2 && !self.didstatusnotify )
    {
        var_3 = maps\mp\_utility::getotherteam( var_0 );
        statusdialog( "losing_a", var_3 );
        statusdialog( "securing_a", var_0 );
        self.didstatusnotify = 1;
    }
}

onenduse( var_0, var_1, var_2 )
{
    self.objpoints["allies"] thread maps\mp\gametypes\_objpoints::stopflashing();
    self.objpoints["axis"] thread maps\mp\gametypes\_objpoints::stopflashing();
}

statusdialog( var_0, var_1 )
{
    var_2 = gettime();

    if ( gettime() < level.laststatus[var_1] + 6000 )
        return;

    thread delayedleaderdialog( var_0, var_1 );
    level.laststatus[var_1] = gettime();
}

delayedleaderdialog( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.1;
    maps\mp\_utility::waittillslowprocessallowed();
    maps\mp\_utility::leaderdialog( var_0, var_1 );
}

delayedleaderdialogbothteams( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    wait 0.1;
    maps\mp\_utility::waittillslowprocessallowed();
    maps\mp\_utility::leaderdialogbothteams( var_0, var_1, var_2, var_3 );
}

flagcaptured( var_0, var_1 )
{
    maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
}
