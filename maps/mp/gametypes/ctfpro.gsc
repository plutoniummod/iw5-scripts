// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();
    maps\mp\_utility::registerscorelimitdvar( level.gametype, 1000 );
    maps\mp\_utility::registertimelimitdvar( level.gametype, 6, 0, 0 );
    maps\mp\_utility::registerroundlimitdvar( level.gametype, 2, 0, 0 );
    maps\mp\_utility::setoverridewatchdvar( "winlimit", 2 );
    maps\mp\_utility::registerroundswitchdvar( level.gametype, 1, 0, 0 );
    maps\mp\_utility::registernumlivesdvar( level.gametype, 0, 0, 0 );
    maps\mp\_utility::registerhalftimedvar( level.gametype, 1, 0, 0 );
    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;
    level.initgametypeawards = ::initgametypeawards;
    level.onhalftime = ::ontimelimit;
    level.ontimelimit = ::ontimelimit;
    level.onspawnplayer = ::onspawnplayer;
    level.scorelimitoverride = 1;
    level.overtimescorewinoverride = 1;
    level.flagreturntime = maps\mp\_utility::getintproperty( "scr_ctf_returntime", 30 );
    game["dialog"]["gametype"] = "captureflag";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    game["dialog"]["offense_obj"] = "capture_obj";
    game["dialog"]["defense_obj"] = "capture_obj";
}

onprecachegametype()
{
    precachestring( &"MP_FLAG_TAKEN_BY" );
    precachestring( &"MP_ENEMY_FLAG_TAKEN_BY" );
    precachestring( &"MP_FLAG_CAPTURED_BY" );
    precachestring( &"MP_ENEMY_FLAG_CAPTURED_BY" );
    precachestring( &"MP_FLAG_RETURNED" );
    precachestring( &"MP_ENEMY_FLAG_RETURNED" );
    precachestring( &"MP_YOUR_FLAG_RETURNING_IN" );
    precachestring( &"MP_ENEMY_FLAG_RETURNING_IN" );
    precachestring( &"MP_ENEMY_FLAG_DROPPED_BY" );
    precachestring( &"MP_DOM_NEUTRAL_FLAG_CAPTURED" );
    precachestring( &"MP_GRABBING_FLAG" );
    precachestring( &"MP_RETURNING_FLAG" );
}

onspawnplayer()
{
    if ( maps\mp\_utility::inovertime() && !isdefined( self.otspawned ) )
        thread printothint();
}

printothint()
{
    self endon( "disconnect" );
    wait 0.25;
    self.otspawned = 1;
    var_0 = maps\mp\_utility::getobjectivehinttext( self.team );
    thread maps\mp\gametypes\_hud_message::hintmessage( var_0 );
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

        if ( game["roundsWon"][game["defenders"]] > 0 )
        {
            game["teamScores"][game["defenders"]] = 500;
            setteamscore( game["defenders"], 500 );
        }
        else
        {
            game["teamScores"][game["defenders"]] = 0;
            setteamscore( game["defenders"], 0 );
        }
    }

    setclientnamemode( "auto_change" );

    if ( level.splitscreen )
    {
        if ( maps\mp\_utility::inovertime() )
        {
            maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_GRAB_FLAG" );
            maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_GRAB_FLAG" );
        }
        else
        {
            maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER" );
            maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER" );
        }
    }
    else if ( maps\mp\_utility::inovertime() )
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_GRAB_FLAG_SCORE" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_GRAB_FLAG_SCORE" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_SCORE" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_SCORE" );
    }

    if ( maps\mp\_utility::inovertime() )
    {
        maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_OVERTIME_CTF" );
        maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_OVERTIME_CTF" );
        maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_GRAB_FLAG_HINT" );
        maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_GRAB_FLAG_HINT" );
    }
    else
    {
        maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_CTF" );
        maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_CTF" );
        maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_HINT" );
        maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_HINT" );
    }

    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_ctf_pro_spawn_attackers_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_ctf_pro_spawn_defenders_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["attackers"], "mp_ctf_pro_spawn_attackers" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["defenders"], "mp_ctf_pro_spawn_defenders" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 20 );
    maps\mp\gametypes\_rank::registerscoreinfo( "pickup", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "return", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 250 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_carrier", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend_assist", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault_assist", 100 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "capture", 1 );
    var_2[0] = "ctf_pro";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    thread ctfpro();
}

getspawnpoint()
{
    if ( level.ingraceperiod )
    {
        if ( self.team == game["attackers"] )
            var_0 = "attackers";
        else
            var_0 = "defenders";

        var_1 = getentarray( "mp_ctf_pro_spawn_" + var_0 + "_start", "classname" );
        var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_1 );
    }
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.team );
        var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_1 );
    }

    return var_2;
}

ctfpro()
{
    level.flagmodel[game["defenders"]] = maps\mp\gametypes\_teams::getteamflagmodel( game["defenders"] );
    level.icon2d[game["defenders"]] = maps\mp\gametypes\_teams::getteamflagicon( game["defenders"] );
    level.carryflag[game["defenders"]] = maps\mp\gametypes\_teams::getteamflagcarrymodel( game["defenders"] );
    precachemodel( level.flagmodel[game["defenders"]] );
    precachemodel( level.carryflag[game["defenders"]] );
    level.iconescort2d["a"] = "waypoint_escort_a";
    level.iconescort2d["b"] = "waypoint_escort_b";
    level.iconescort3d["a"] = level.iconescort2d["a"];
    level.iconescort3d["b"] = level.iconescort2d["b"];
    precacheshader( level.iconescort2d["a"] );
    precacheshader( level.iconescort2d["b"] );
    level.iconkill2d["a"] = "waypoint_kill_a";
    level.iconkill2d["b"] = "waypoint_kill_b";
    level.iconkill3d["a"] = level.iconkill2d["a"];
    level.iconkill3d["b"] = level.iconkill2d["b"];
    precacheshader( level.iconkill2d["a"] );
    precacheshader( level.iconkill2d["b"] );
    level.iconcaptureflag2d["a"] = "waypoint_capture_flag_a";
    level.iconcaptureflag2d["b"] = "waypoint_capture_flag_b";
    level.iconcaptureflag3d["a"] = level.iconcaptureflag2d["a"];
    level.iconcaptureflag3d["b"] = level.iconcaptureflag2d["b"];
    precacheshader( level.iconcaptureflag2d["a"] );
    precacheshader( level.iconcaptureflag2d["b"] );
    level.icondefendflag2d["a"] = "waypoint_defend_flag_a";
    level.icondefendflag2d["b"] = "waypoint_defend_flag_b";
    level.icondefendflag3d["a"] = level.icondefendflag2d["a"];
    level.icondefendflag3d["b"] = level.icondefendflag2d["b"];
    precacheshader( level.icondefendflag2d["a"] );
    precacheshader( level.icondefendflag2d["b"] );
    level.iconreturnflag2d["a"] = "waypoint_return_flag_a";
    level.iconreturnflag2d["b"] = "waypoint_return_flag_b";
    level.iconreturnflag3d["a"] = level.iconreturnflag2d["a"];
    level.iconreturnflag3d["b"] = level.iconreturnflag2d["b"];
    precacheshader( level.iconreturnflag2d["a"] );
    precacheshader( level.iconreturnflag2d["b"] );
    level.iconflagbase2d = "waypoint_flag_base";
    level.iconflagbase3d = level.iconflagbase2d;
    precacheshader( level.iconflagbase2d );
    precacheshader( level.icon2d[game["defenders"]] );
    precacheshader( "waypoint_flag_friendly" );
    precacheshader( "waypoint_flag_enemy" );
    precachestring( &"OBJECTIVES_FLAG_HOME" );
    precachestring( &"OBJECTIVES_FLAG_NAME" );
    precachestring( &"OBJECTIVES_FLAG_AWAY" );
    level.teamflags[game["defenders"]] = createteamflags( game["defenders"] );
    level.capzones[game["attackers"]] = createcapzones( game["attackers"] );
}

ontimelimit()
{
    if ( game["switchedsides"] == 1 )
    {
        if ( game["roundsWon"][game["defenders"]] > 0 )
        {
            game["teamScores"][game["defenders"]] = 1;
            setteamscore( game["defenders"], 1 );
            game["teamScores"][game["attackers"]] = 0;
            setteamscore( game["attackers"], 0 );
            maps\mp\_utility::setoverridewatchdvar( "winlimit", 1 );
            level.onlyroundoverride = 1;
            thread maps\mp\gametypes\_gamelogic::endgame( game["defenders"], game["strings"]["time_limit_reached"] );
        }
        else
        {
            game["teamScores"][game["defenders"]] = 0;
            setteamscore( game["defenders"], 0 );
            game["teamScores"][game["attackers"]] = 0;
            setteamscore( game["attackers"], 0 );
            thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["time_limit_reached"] );
        }
    }
    else
    {
        game["roundsPlayed"]++;
        game["teamScores"][game["attackers"]] = 0;
        setteamscore( game["attackers"], 0 );
        thread maps\mp\gametypes\_gamelogic::endgame( "halftime", game["strings"]["time_limit_reached"] );
    }
}

spawnfxdelay( var_0, var_1, var_2, var_3, var_4 )
{
    wait(var_4);
    var_5 = spawnfx( var_0, var_1, var_2, var_3 );
    triggerfx( var_5 );
}

createteamflags( var_0 )
{
    var_1 = [];
    var_1[0] = createteamflag( var_0, "a" );
    var_1[0].points = 200;
    var_1[1] = createteamflag( var_0, "b" );
    var_1[1].points = 200;
    return var_1;
}

createteamflag( var_0, var_1 )
{
    var_2 = getent( "ctf_pro_trig_" + var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        common_scripts\utility::error( "No ctf_pro_trig_" + var_1 + " trigger found in map." );
    else
    {
        var_3 = getent( "ctf_pro_flag_" + var_1, "targetname" );

        if ( !isdefined( var_3 ) )
        {
            common_scripts\utility::error( "No ctf_pro_flag_" + var_1 + " script_model found in map." );
            return;
        }

        var_4 = getent( "ctf_pro_flag_spawn_" + var_1, "targetname" );

        if ( !isdefined( var_4 ) )
        {
            common_scripts\utility::error( "No ctf_pro_flag_spawn_" + var_1 + " script_origin found in map." );
            return;
        }

        var_3 setmodel( level.flagmodel[var_0] );
        var_5[0] = var_3;
        var_6 = maps\mp\gametypes\_gameobjects::createcarryobject( var_0, var_2, var_5, ( 0.0, 0.0, 85.0 ) );
        var_6 maps\mp\gametypes\_gameobjects::setteamusetime( "friendly", 0.5 );
        var_6 maps\mp\gametypes\_gameobjects::setteamusetime( "enemy", 0.5 );
        var_6 maps\mp\gametypes\_gameobjects::setteamusetext( "enemy", &"MP_GRABBING_FLAG" );
        var_6 maps\mp\gametypes\_gameobjects::setteamusetext( "friendly", &"MP_RETURNING_FLAG" );
        var_6 maps\mp\gametypes\_gameobjects::allowcarry( "enemy" );
        var_6 maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
        var_6 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconkill2d[var_1] );
        var_6 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconkill3d[var_1] );
        var_6 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconescort2d[var_1] );
        var_6 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconescort3d[var_1] );
        var_6 maps\mp\gametypes\_gameobjects::setcarryicon( level.icon2d[var_0] );
        var_6.objidpingfriendly = 1;
        var_6.allowweapons = 1;
        var_6.onpickup = ::onpickup;
        var_6.onpickupfailed = ::onpickup;
        var_6.ondrop = ::ondrop;
        var_6.onreset = ::onreset;
        var_6.oldradius = var_2.radius;
        var_6.athome = 1;
        var_6.label = var_1;
        var_5 = [];
        var_7 = maps\mp\gametypes\_gameobjects::createuseobject( var_0, var_4, var_5, ( 0.0, 0.0, 85.0 ) );
        var_7 maps\mp\gametypes\_gameobjects::allowuse( "none" );
        var_7 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_7 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icondefendflag2d[var_1] );
        var_7 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icondefendflag3d[var_1] );
        var_7 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d[var_1] );
        var_7 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d[var_1] );
        var_6.marker = var_7;
        var_8 = var_2.origin + ( 0.0, 0.0, 32.0 );
        var_9 = var_2.origin + ( 0.0, 0.0, -32.0 );
        var_10 = bullettrace( var_8, var_9, 0, undefined );
        var_11 = maps\mp\gametypes\_teams::getteamflagfx( var_0 );
        var_12 = loadfx( var_11 );
        var_13 = vectortoangles( var_10["normal"] );
        var_14 = anglestoforward( var_13 );
        var_15 = anglestoright( var_13 );
        thread spawnfxdelay( var_12, var_10["position"], var_14, var_15, 0.5 );
    }
}

createcapzones( var_0 )
{
    var_1 = [];
    var_1 = getentarray( "ctf_pro_zone", "targetname" );

    if ( !isdefined( var_1[0] ) )
        common_scripts\utility::error( "No ctf_pro_zone triggers found in map." );
    else
    {
        var_2 = [];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( isdefined( level.teamflags[maps\mp\_utility::getotherteam( var_0 )][var_3] ) )
            {
                var_4 = [];
                var_2[var_3] = maps\mp\gametypes\_gameobjects::createuseobject( var_0, var_1[var_3], var_4, ( 0.0, 0.0, 0.0 ) );
                var_2[var_3] maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
                var_2[var_3] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
                var_2[var_3] maps\mp\gametypes\_gameobjects::setusetime( 0 );
                var_2[var_3] maps\mp\gametypes\_gameobjects::setkeyobject( level.teamflags[maps\mp\_utility::getotherteam( var_0 )][var_3] );
                var_2[var_3].onuse = ::onuse;
                var_2[var_3].oncantuse = ::oncantuse;
            }
        }

        var_2[0].origin = var_1[0].origin;
        var_5 = var_1[0].origin + ( 0.0, 0.0, 32.0 );
        var_6 = var_1[0].origin + ( 0.0, 0.0, -32.0 );
        var_7 = bullettrace( var_5, var_6, 0, undefined );
        var_8 = maps\mp\gametypes\_teams::getteamflagfx( var_0 );
        var_9 = loadfx( var_8 );
        var_10 = vectortoangles( var_7["normal"] );
        var_11 = anglestoforward( var_10 );
        var_12 = anglestoright( var_10 );
        thread spawnfxdelay( var_9, var_7["position"], var_11, var_12, 0.5 );
    }
}

onbeginuse( var_0 )
{
    var_1 = var_0.pers["team"];

    if ( var_1 == maps\mp\gametypes\_gameobjects::getownerteam() )
        self.trigger.radius = 1024;
    else
        self.trigger.radius = self.oldradius;
}

onenduse( var_0, var_1, var_2 )
{
    self.trigger.radius = self.oldradius;
}

onpickup( var_0 )
{
    self notify( "picked_up" );
    var_1 = var_0.pers["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    if ( var_1 == maps\mp\gametypes\_gameobjects::getownerteam() )
    {
        thread maps\mp\_utility::teamplayercardsplash( "callout_flagreturn", var_0 );
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flagreturn", maps\mp\gametypes\_rank::getscoreinfovalue( "return" ) );
        maps\mp\gametypes\_gamescore::giveplayerscore( "return", var_0 );
        var_0 thread [[ level.onxpevent ]]( "return" );
        thread returnflag();
        var_0 maps\mp\_utility::incplayerstat( "flagsreturned", 1 );
        var_0 maps\mp\_utility::incpersstat( "returns", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "return", var_0.origin );
        maps\mp\_utility::printandsoundoneveryone( var_1, maps\mp\_utility::getotherteam( var_1 ), &"MP_FLAG_RETURNED", &"MP_ENEMY_FLAG_RETURNED", "mp_obj_returned", "mp_obj_returned", "" );
        maps\mp\_utility::leaderdialog( "enemy_flag_returned", var_2, "status" );
        maps\mp\_utility::leaderdialog( "flag_returned", var_1, "status" );
    }
    else
    {
        var_0 attachflag( self );
        maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconkill2d[self.label] );
        maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconkill3d[self.label] );
        maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconescort2d[self.label] );
        maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconescort3d[self.label] );
        self.marker maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
        var_0.zoneheadicon = level.capzones[game["attackers"]][0] maps\mp\_entityheadicons::setheadicon( var_0, level.iconflagbase2d, ( 0.0, 0.0, 0.0 ), 24, 24, undefined, undefined, undefined, undefined, undefined, 0 );
        var_0.zonemapicon = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_0.zonemapicon, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( var_0.zonemapicon, level.capzones[game["attackers"]][0].origin );
        objective_state( var_0.zonemapicon, "active" );
        objective_player( var_0.zonemapicon, var_0 getentitynumber() );
        objective_icon( var_0.zonemapicon, level.iconflagbase2d );
        maps\mp\_utility::printandsoundoneveryone( var_1, var_2, &"MP_ENEMY_FLAG_TAKEN_BY", &"MP_FLAG_TAKEN_BY", "mp_obj_taken", "mp_enemy_obj_taken", var_0 );
        maps\mp\_utility::leaderdialog( "enemy_flag_taken", var_1, "status" );
        maps\mp\_utility::leaderdialog( "flag_taken", var_2, "status" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_flagpickup", var_0 );
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flagpickup", maps\mp\gametypes\_rank::getscoreinfovalue( "pickup" ) );
        maps\mp\gametypes\_gamescore::giveplayerscore( "pickup", var_0 );
        var_0 thread [[ level.onxpevent ]]( "pickup" );
        var_0 maps\mp\_utility::incplayerstat( "flagscarried", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "pickup", var_0.origin );
    }
}

returnflag()
{
    maps\mp\gametypes\_gameobjects::returnhome();
}

ondrop( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_2 = level.otherteam[var_1];
    maps\mp\gametypes\_gameobjects::allowcarry( "any" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconreturnflag2d[self.label] );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconreturnflag3d[self.label] );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d[self.label] );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d[self.label] );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.carryflag ) )
            var_0 detachflag();

        maps\mp\_utility::printandsoundoneveryone( var_2, "none", &"MP_ENEMY_FLAG_DROPPED_BY", "", "mp_war_objective_lost", "", var_0 );

        if ( isdefined( var_0.zoneheadicon ) )
            var_0.zoneheadicon destroy();

        if ( isdefined( var_0.zonemapicon ) )
        {
            maps\mp\_utility::_objective_delete( var_0.zonemapicon );
            var_0.zonemapicon = undefined;
        }
    }
    else
        maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_2 );

    maps\mp\_utility::leaderdialog( "enemy_flag_dropped", var_2, "status" );
    maps\mp\_utility::leaderdialog( "flag_dropped", var_1, "status" );
    thread returnaftertime();
}

returnaftertime()
{
    self endon( "picked_up" );
    wait(level.flagreturntime);
    maps\mp\gametypes\_gameobjects::returnhome();
}

onreset()
{
    var_0 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_1 = level.otherteam[var_0];
    maps\mp\gametypes\_gameobjects::allowcarry( "enemy" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconkill2d[self.label] );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconkill3d[self.label] );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconescort2d[self.label] );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconescort3d[self.label] );
    self.marker maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
}

onuse( var_0 )
{
    var_1 = var_0.pers["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    maps\mp\_utility::leaderdialog( "enemy_flag_captured", var_1, "status" );
    maps\mp\_utility::leaderdialog( "flag_captured", var_2, "status" );
    thread maps\mp\_utility::teamplayercardsplash( "callout_flagcapture", var_0 );
    givescore( var_1, var_0.cappedflag.points );
    var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flag_capture", maps\mp\gametypes\_rank::getscoreinfovalue( "capture" ) );
    maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_0 );
    var_0 thread [[ level.onxpevent ]]( "capture" );
    var_0 maps\mp\_utility::incplayerstat( "flagscaptured", 1 );
    var_0 maps\mp\_utility::incpersstat( "captures", 1 );
    var_0 notify( "objective", "captured" );
    var_0 thread maps\mp\_matchdata::loggameevent( "capture", var_0.origin );

    if ( isdefined( level.adrenalineinfo["capture"] ) )
        var_0 maps\mp\killstreaks\_killstreaks::giveadrenaline( "capture" );

    maps\mp\_utility::printandsoundoneveryone( var_1, var_2, &"MP_ENEMY_FLAG_CAPTURED_BY", &"MP_FLAG_CAPTURED_BY", "mp_obj_captured", "mp_enemy_obj_captured", var_0 );

    if ( isdefined( var_0.carryflag ) )
        var_0 detachflag();

    if ( isdefined( var_0.zoneheadicon ) )
        var_0.zoneheadicon destroy();

    if ( isdefined( var_0.zonemapicon ) )
    {
        maps\mp\_utility::_objective_delete( var_0.zonemapicon );
        var_0.zonemapicon = undefined;
    }

    var_0.cappedflag returnflag();
}

givescore( var_0, var_1 )
{
    maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_0, var_1 );

    if ( game["state"] != "playing" )
        return;

    if ( game["switchedsides"] )
    {
        if ( game["teamScores"][game["attackers"]] >= maps\mp\_utility::getwatcheddvar( "scorelimit" ) )
        {
            maps\mp\_utility::setoverridewatchdvar( "winlimit", 1 );
            level.onlyroundoverride = 1;

            if ( game["roundsWon"][game["defenders"]] == 0 )
            {
                game["teamScores"][game["attackers"]] = 1;
                setteamscore( game["attackers"], 1 );
                game["teamScores"][game["defenders"]] = 0;
                setteamscore( game["defenders"], 0 );
                thread maps\mp\gametypes\_gamelogic::endgame( game["attackers"], game["strings"]["score_limit_reached"] );
            }
            else
            {
                game["teamScores"][game["attackers"]] = 1;
                setteamscore( game["attackers"], 1 );
                game["teamScores"][game["defenders"]] = 1;
                setteamscore( game["defenders"], 1 );
                thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["score_limit_reached"] );
            }
        }
    }
    else if ( game["teamScores"][game["attackers"]] >= maps\mp\_utility::getwatcheddvar( "scorelimit" ) )
    {
        game["roundsPlayed"]++;
        game["teamScores"][game["attackers"]] = 1;
        setteamscore( game["attackers"], 1 );
        game["teamScores"][game["defenders"]] = 0;
        setteamscore( game["defenders"], 0 );
        game["roundsWon"][game["attackers"]]++;
        maps\mp\gametypes\_gamescore::updateteamscore( game["attackers"] );
        thread maps\mp\gametypes\_gamelogic::endgame( "halftime", game["strings"]["score_limit_reached"] );
    }
}

oncantuse( var_0 )
{

}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1.pers["team"] != self.pers["team"] )
    {
        if ( isdefined( var_1.carryflag ) )
            var_1 maps\mp\_utility::incplayerstat( "killsasflagcarrier", 1 );

        if ( isdefined( self.carryflag ) )
        {
            thread maps\mp\_utility::teamplayercardsplash( "callout_killflagcarrier", var_1 );
            var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "killflagcarrier", maps\mp\gametypes\_rank::getscoreinfovalue( "kill_carrier" ) );
            maps\mp\gametypes\_gamescore::giveplayerscore( "kill_carrier", var_1 );
            var_1 thread [[ level.onxpevent ]]( "kill_carrier" );
            var_1 maps\mp\_utility::incpersstat( "defends", 1 );
            thread maps\mp\_matchdata::logkillevent( var_9, "carrying" );
            detachflag();
        }
    }
}

attachflag( var_0 )
{
    var_1 = level.otherteam[self.pers["team"]];
    self attach( level.carryflag[var_1], "J_spine4", 1 );
    self.carryflag = level.carryflag[var_1];
    self.cappedflag = var_0;
}

detachflag()
{
    self detach( self.carryflag, "J_spine4" );
    self.carryflag = undefined;
}

initgametypeawards()
{
    maps\mp\_awards::initstataward( "flagscaptured", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "flagsreturned", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "flagcarrierkills", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "flagscarried", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "killsasflagcarrier", 0, maps\mp\_awards::highestwins );
}
