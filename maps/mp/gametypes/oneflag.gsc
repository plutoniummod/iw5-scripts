// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();
    maps\mp\_utility::registertimelimitdvar( level.gametype, 3, 0, 1440 );
    maps\mp\_utility::registerscorelimitdvar( level.gametype, 1, 0, 10000 );
    maps\mp\_utility::registerroundlimitdvar( level.gametype, 0, 0, 30 );
    maps\mp\_utility::registerwinlimitdvar( level.gametype, 4, 0, 10 );
    maps\mp\_utility::registerroundswitchdvar( level.gametype, 3, 0, 30 );
    maps\mp\_utility::registernumlivesdvar( level.gametype, 0, 0, 10 );
    maps\mp\_utility::registerhalftimedvar( level.gametype, 0, 0, 1 );
    level.objectivebased = 1;
    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onplayerkilled = ::onplayerkilled;
    level.ontimelimit = ::ontimelimit;
    level.initgametypeawards = ::initgametypeawards;
    game["dialog"]["gametype"] = "oneflag";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    if ( getdvar( "scr_oneflag_returntime" ) == "" )
        setdvar( "scr_oneflag_returntime", "15" );

    level.flagreturntime = getdvarint( "scr_oneflag_returntime" );
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
    maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_CTF" );
    maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_CTF" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_SCORE" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_HINT" );
    maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_ctf_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_ctf_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_ctf_spawn_allies" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_ctf_spawn_axis" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_2[0] = "ctf";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 20 );
    maps\mp\gametypes\_rank::registerscoreinfo( "pickup", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "return", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 500 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_carrier", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend_assist", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault", 200 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault_assist", 40 );
    thread oneflag_ctf();
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::getotherteam( var_0 );

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

onspawnplayer()
{
    self.usingobj = undefined;
}

oneflag_ctf()
{
    level.flagmodel["allies"] = maps\mp\gametypes\_teams::getteamflagmodel( "allies" );
    level.icon2d["allies"] = maps\mp\gametypes\_teams::getteamflagicon( "allies" );
    level.carryflag["allies"] = maps\mp\gametypes\_teams::getteamflagcarrymodel( "allies" );
    precachemodel( level.flagmodel["allies"] );
    precachemodel( level.carryflag["allies"] );
    level.flagmodel["axis"] = maps\mp\gametypes\_teams::getteamflagmodel( "axis" );
    level.icon2d["axis"] = maps\mp\gametypes\_teams::getteamflagicon( "axis" );
    level.carryflag["axis"] = maps\mp\gametypes\_teams::getteamflagcarrymodel( "axis" );
    precachemodel( level.flagmodel["axis"] );
    precachemodel( level.carryflag["axis"] );
    level.iconcapture3d = "waypoint_capture";
    level.iconcapture2d = "compass_waypoint_capture";
    level.icondefend3d = "waypoint_defend";
    level.icondefend2d = "compass_waypoint_defend";
    level.icontarget3d = "waypoint_target";
    level.icontarget2d = "compass_waypoint_target";
    precacheshader( level.icon2d["axis"] );
    precacheshader( level.icon2d["allies"] );
    precacheshader( level.iconcapture3d );
    precacheshader( level.icondefend3d );
    precacheshader( level.iconcapture2d );
    precacheshader( level.icondefend2d );
    precacheshader( level.icontarget3d );
    precacheshader( level.icontarget2d );
    precacheshader( "waypoint_kill" );
    level.teamflags[game["defenders"]] = createteamflag( game["defenders"] );
    level.capzones[game["attackers"]] = createcapzone( game["attackers"] );
    level.flagcaptured = 0;
}

spawnfxdelay( var_0, var_1, var_2, var_3, var_4 )
{
    wait(var_4);
    var_5 = spawnfx( var_0, var_1, var_2, var_3 );
    triggerfx( var_5 );
}

createteamflag( var_0 )
{
    var_1 = game["original_defenders"];
    var_2 = getent( "ctf_trig_" + var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        common_scripts\utility::error( "No ctf_trig_" + var_1 + " trigger found in map." );
    else
    {
        var_3[0] = getent( "ctf_flag_" + var_1, "targetname" );

        if ( !isdefined( var_3[0] ) )
        {
            common_scripts\utility::error( "No ctf_flag_" + var_1 + " script_model found in map." );
            return;
        }

        var_4 = spawn( "trigger_radius", var_2.origin, 0, 96, var_2.height );
        var_2 delete();
        var_2 = var_4;
        var_3[0] setmodel( level.flagmodel[var_0] );
        var_5 = maps\mp\gametypes\_gameobjects::createcarryobject( var_0, var_2, var_3, ( 0.0, 0.0, 85.0 ) );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetime( "friendly", 15.0 );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetime( "enemy", 0 );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetext( "enemy", &"MP_CAPTURING_FLAG" );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetext( "friendly", &"MP_RETURNING_FLAG" );
        var_5 maps\mp\gametypes\_gameobjects::allowcarry( "enemy" );
        var_5 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_5 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icondefend2d );
        var_5 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icondefend3d );
        var_5 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcapture2d );
        var_5 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcapture3d );
        var_5 maps\mp\gametypes\_gameobjects::setcarryicon( level.icon2d[var_0] );
        var_5.allowweapons = 1;
        var_5.onpickup = ::onpickup;
        var_5.onpickupfailed = ::onpickup;
        var_5.ondrop = ::ondrop;
        var_5.onreset = ::onreset;
        var_5.oldradius = var_2.radius;
        var_6 = var_2.origin + ( 0.0, 0.0, 32.0 );
        var_7 = var_2.origin + ( 0.0, 0.0, -32.0 );
        var_8 = bullettrace( var_6, var_7, 0, undefined );
        var_9 = maps\mp\gametypes\_teams::getteamflagfx( var_0 );
        var_10 = loadfx( var_9 );
        var_11 = vectortoangles( var_8["normal"] );
        var_12 = anglestoforward( var_11 );
        var_13 = anglestoright( var_11 );
        thread spawnfxdelay( var_10, var_8["position"], var_12, var_13, 0.5 );
    }
}

createcapzone( var_0 )
{
    var_1 = level.otherteam[game["original_defenders"]];
    var_2 = getent( "ctf_zone_" + var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        common_scripts\utility::error( "No ctf_zone_" + var_1 + " trigger found in map." );
    else
    {
        var_3[0] = getent( "ctf_flag_" + var_1, "targetname" );

        if ( !isdefined( var_3[0] ) )
        {
            common_scripts\utility::error( "No ctf_flag_" + var_1 + " script_model found in map." );
            return;
        }

        var_3[0] hide();
        var_3 = [];
        var_4 = maps\mp\gametypes\_gameobjects::createuseobject( var_0, var_2, var_3, ( 0.0, 0.0, 85.0 ) );
        var_4 maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
        var_4 maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
        var_4 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icontarget2d );
        var_4 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icontarget3d );
        var_4 maps\mp\gametypes\_gameobjects::setusetime( 0 );
        var_4 maps\mp\gametypes\_gameobjects::setkeyobject( level.teamflags[maps\mp\_utility::getotherteam( var_0 )] );
        var_4.onuse = ::onuse;
        var_4.oncantuse = ::oncantuse;
        var_5 = var_2.origin + ( 0.0, 0.0, 32.0 );
        var_6 = var_2.origin + ( 0.0, 0.0, -32.0 );
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
    var_1 = var_0.pers["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    if ( var_1 == maps\mp\gametypes\_gameobjects::getownerteam() )
    {
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flagreturn", maps\mp\gametypes\_rank::getscoreinfovalue( "pickup" ) );
        var_0 thread [[ level.onxpevent ]]( "pickup" );
        thread returnflag();
        var_0 maps\mp\_utility::incplayerstat( "flagsreturned", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "return", var_0.origin );
    }
    else
    {
        var_0 attachflag();
        level.capzones[var_1] maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_defend" );
        maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_kill" );
        maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icontarget2d );
        maps\mp\_utility::printandsoundoneveryone( var_1, var_2, &"MP_ENEMY_FLAG_TAKEN_BY", &"MP_FLAG_TAKEN_BY", "mp_obj_taken", "mp_enemy_obj_taken", var_0 );
        maps\mp\_utility::leaderdialog( "enemy_flag_taken", var_1, "status" );
        maps\mp\_utility::leaderdialog( "flag_taken", var_2, "status" );
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flagpickup", maps\mp\gametypes\_rank::getscoreinfovalue( "pickup" ) );
        maps\mp\gametypes\_gamescore::giveplayerscore( "pickup", var_0 );
        var_0 thread [[ level.onxpevent ]]( "pickup" );
        var_0 maps\mp\_utility::incplayerstat( "flagscarried", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "pickup", var_0.origin );
    }
}

returnflag()
{
    var_0 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_1 = level.otherteam[var_0];
    maps\mp\gametypes\_gameobjects::returnhome();
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::allowcarry( "enemy" );
    level.capzones[var_1] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    maps\mp\_utility::printandsoundoneveryone( var_0, maps\mp\_utility::getotherteam( var_0 ), &"MP_FLAG_RETURNED", &"MP_ENEMY_FLAG_RETURNED", "mp_obj_returned", "mp_obj_returned", "" );
    maps\mp\_utility::leaderdialog( "enemy_flag_returned", var_1, "status" );
    maps\mp\_utility::leaderdialog( "flag_returned", var_0, "status" );
}

ondrop( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_2 = level.otherteam[var_1];
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icondefend3d );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icondefend2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcapture3d );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::allowcarry( "any" );
    level.capzones[var_2] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.carryflag ) )
            var_0 detachflag();

        maps\mp\_utility::printandsoundoneveryone( var_2, "none", &"MP_ENEMY_FLAG_DROPPED_BY", "", "mp_war_objective_lost", "", var_0 );
    }
    else
        maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_2 );

    maps\mp\_utility::leaderdialog( "enemy_flag_dropped", var_2, "status" );
    maps\mp\_utility::leaderdialog( "flag_dropped", var_1, "status" );
}

onreset()
{
    self notify( "flag_reset" );
    var_0 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_1 = level.otherteam[var_0];
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icondefend3d );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icondefend2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcapture3d );
    level.capzones[var_1] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
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
    maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_0 );
    var_0 thread [[ level.onxpevent ]]( "capture" );
    var_0 maps\mp\_utility::incplayerstat( "flagscaptured", 1 );
    var_0 notify( "objective", "captured" );
    var_0 thread maps\mp\_matchdata::loggameevent( "capture", var_0.origin );
    maps\mp\_utility::printandsoundoneveryone( var_1, var_2, &"MP_ENEMY_FLAG_CAPTURED_BY", &"MP_FLAG_CAPTURED_BY", "mp_obj_captured", "mp_enemy_obj_captured", var_0 );
    thread flagcaptured( var_1, &"MP_DOM_NEUTRAL_FLAG_CAPTURED" );
    level.teamflags[var_2] maps\mp\gametypes\_gameobjects::allowcarry( "none" );
    level.teamflags[var_2] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    level.teamflags[var_2] maps\mp\gametypes\_gameobjects::disableobject();
    level.capzones[var_1] maps\mp\gametypes\_gameobjects::allowuse( "none" );

    if ( isdefined( var_0.carryflag ) )
        var_0 detachflag();
}

flagcaptured( var_0, var_1 )
{
    maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
    level.flagcaptured = 1;
}

ontimelimit()
{
    if ( level.flagcaptured )
        return;

    maps\mp\gametypes\_gamelogic::endgame( game["defenders"], game["strings"]["time_limit_reached"] );
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
            var_1 thread [[ level.onxpevent ]]( "kill_carrier" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "kill_carrier", var_1 );
            var_1 maps\mp\_utility::incplayerstat( "flagcarrierkills", 1 );
            thread maps\mp\_matchdata::logkillevent( var_9, "carrying" );
            detachflag();
        }
    }
}

attachflag()
{
    var_0 = level.otherteam[self.pers["team"]];
    self attach( level.carryflag[var_0], "J_spine4", 1 );
    self.carryflag = level.carryflag[var_0];
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
