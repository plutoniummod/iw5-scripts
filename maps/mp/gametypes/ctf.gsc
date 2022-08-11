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
        maps\mp\_utility::registertimelimitdvar( level.gametype, 5 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 3 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    maps\mp\_utility::setovertimelimitdvar( 4 );
    setspecialloadouts();
    level.teambased = 1;
    level.objectivebased = 1;
    level.overtimescorewinoverride = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;
    level.initgametypeawards = ::initgametypeawards;
    level.ontimelimit = ::ontimelimit;
    level.onspawnplayer = ::onspawnplayer;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

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

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "scr_ctf_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "ctf", 1 );
    setdynamicdvar( "scr_ctf_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "ctf", 1 );
    setdynamicdvar( "scr_ctf_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "ctf", 0 );
    setdynamicdvar( "scr_ctf_returntime", 30 );
    setdynamicdvar( "scr_ctf_promode", 0 );
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

    if ( maps\mp\_utility::inovertime() )
        setdvar( "ui_override_halftime", 0 );
    else if ( game["switchedsides"] )
        setdvar( "ui_override_halftime", 2 );
    else
        setdvar( "ui_override_halftime", 1 );

    if ( !isdefined( game["original_defenders"] ) )
        game["original_defenders"] = game["defenders"];

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    game["teamScores"][game["attackers"]] = 0;
    setteamscore( game["attackers"], 0 );
    game["teamScores"][game["defenders"]] = 0;
    setteamscore( game["defenders"], 0 );
    setclientnamemode( "auto_change" );

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

    maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_CTF" );
    maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_CTF" );
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
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 20 );
    maps\mp\gametypes\_rank::registerscoreinfo( "pickup", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "return", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 250 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_carrier", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend_assist", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault", 200 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault_assist", 40 );
    var_2[0] = "ctf";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    thread ctf();
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

ctf()
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
    level.iconescort3d = "waypoint_escort";
    level.iconescort2d = "waypoint_escort";
    precacheshader( level.iconescort3d );
    precacheshader( level.iconescort2d );
    level.iconkill3d = "waypoint_kill";
    level.iconkill2d = "waypoint_kill";
    precacheshader( level.iconkill3d );
    precacheshader( level.iconkill2d );
    level.iconcaptureflag3d = "waypoint_capture_flag";
    level.iconcaptureflag2d = "waypoint_capture_flag";
    precacheshader( level.iconcaptureflag3d );
    precacheshader( level.iconcaptureflag2d );
    level.icondefendflag3d = "waypoint_defend_flag";
    level.icondefendflag2d = "waypoint_defend_flag";
    precacheshader( level.icondefendflag3d );
    precacheshader( level.icondefendflag2d );
    level.iconreturnflag3d = "waypoint_return_flag";
    level.iconreturnflag2d = "waypoint_return_flag";
    precacheshader( level.iconreturnflag3d );
    precacheshader( level.iconreturnflag2d );
    level.iconwaitforflag3d = "waypoint_waitfor_flag";
    level.iconwaitforflag2d = "waypoint_waitfor_flag";
    precacheshader( level.iconwaitforflag3d );
    precacheshader( level.iconwaitforflag2d );
    precacheshader( level.icon2d["axis"] );
    precacheshader( level.icon2d["allies"] );
    precacheshader( "waypoint_flag_friendly" );
    precacheshader( "waypoint_flag_enemy" );
    precachestring( &"OBJECTIVES_FLAG_HOME" );
    precachestring( &"OBJECTIVES_FLAG_NAME" );
    precachestring( &"OBJECTIVES_FLAG_AWAY" );
    level.teamflags[game["defenders"]] = createteamflag( game["defenders"], "allies" );
    level.teamflags[game["attackers"]] = createteamflag( game["attackers"], level.otherteam["allies"] );
    level.capzones[game["defenders"]] = createcapzone( game["defenders"], "allies" );
    level.capzones[game["attackers"]] = createcapzone( game["attackers"], level.otherteam["allies"] );

    if ( level.splitscreen )
        var_0 = 0;
    else
        var_0 = 0.85;

    level.friendlyflagstatusicon["allies"] = maps\mp\gametypes\_hud_util::createservericon( "waypoint_flag_friendly", 32, 32, "allies" );
    level.friendlyflagstatusicon["allies"] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 132, 0 );
    level.friendlyflagstatusicon["allies"].alpha = var_0;
    level.friendlyflagstatusicon["allies"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.friendlyflagstatusicon["allies"] );
    level.friendlyflagstatustext["allies"] = maps\mp\gametypes\_hud_util::createserverfontstring( "small", 1.6, "allies" );
    level.friendlyflagstatustext["allies"] maps\mp\gametypes\_hud_util::setparent( level.friendlyflagstatusicon["allies"] );
    level.friendlyflagstatustext["allies"] maps\mp\gametypes\_hud_util::setpoint( "LEFT", "RIGHT", 4 );
    level.friendlyflagstatustext["allies"] settext( &"OBJECTIVES_FLAG_HOME" );
    level.friendlyflagstatustext["allies"].alpha = var_0;
    level.friendlyflagstatustext["allies"].color = ( 1.0, 1.0, 1.0 );
    level.friendlyflagstatustext["allies"].glowalpha = 1;
    level.friendlyflagstatustext["allies"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.friendlyflagstatustext["allies"] );
    level.enemyflagstatusicon["allies"] = maps\mp\gametypes\_hud_util::createservericon( "waypoint_flag_enemy", 24, 24, "allies" );
    level.enemyflagstatusicon["allies"] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 132, 26 );
    level.enemyflagstatusicon["allies"].alpha = var_0;
    level.enemyflagstatusicon["allies"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.enemyflagstatusicon["allies"] );
    level.enemyflagstatustext["allies"] = maps\mp\gametypes\_hud_util::createserverfontstring( "small", 1.6, "allies" );
    level.enemyflagstatustext["allies"] maps\mp\gametypes\_hud_util::setparent( level.enemyflagstatusicon["allies"] );
    level.enemyflagstatustext["allies"] maps\mp\gametypes\_hud_util::setpoint( "LEFT", "RIGHT", 4 );
    level.enemyflagstatustext["allies"] settext( &"OBJECTIVES_FLAG_HOME" );
    level.enemyflagstatustext["allies"].alpha = var_0;
    level.enemyflagstatustext["allies"].color = ( 1.0, 1.0, 1.0 );
    level.enemyflagstatustext["allies"].glowalpha = 1;
    level.enemyflagstatustext["allies"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.enemyflagstatustext["allies"] );
    level.friendlyflagstatusicon["axis"] = maps\mp\gametypes\_hud_util::createservericon( "waypoint_flag_friendly", 32, 32, "axis" );
    level.friendlyflagstatusicon["axis"] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 132, 0 );
    level.friendlyflagstatusicon["axis"].alpha = var_0;
    level.friendlyflagstatusicon["axis"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.friendlyflagstatusicon["axis"] );
    level.friendlyflagstatustext["axis"] = maps\mp\gametypes\_hud_util::createserverfontstring( "small", 1.6, "axis" );
    level.friendlyflagstatustext["axis"] maps\mp\gametypes\_hud_util::setparent( level.friendlyflagstatusicon["axis"] );
    level.friendlyflagstatustext["axis"] maps\mp\gametypes\_hud_util::setpoint( "LEFT", "RIGHT", 4 );
    level.friendlyflagstatustext["axis"] settext( &"OBJECTIVES_FLAG_HOME" );
    level.friendlyflagstatustext["axis"].alpha = var_0;
    level.friendlyflagstatustext["axis"].color = ( 1.0, 1.0, 1.0 );
    level.friendlyflagstatustext["axis"].glowalpha = 1;
    level.friendlyflagstatustext["axis"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.friendlyflagstatustext["axis"] );
    level.enemyflagstatusicon["axis"] = maps\mp\gametypes\_hud_util::createservericon( "waypoint_flag_enemy", 24, 24, "axis" );
    level.enemyflagstatusicon["axis"] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 132, 26 );
    level.enemyflagstatusicon["axis"].alpha = var_0;
    level.enemyflagstatusicon["axis"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.enemyflagstatusicon["axis"] );
    level.enemyflagstatustext["axis"] = maps\mp\gametypes\_hud_util::createserverfontstring( "small", 1.6, "axis" );
    level.enemyflagstatustext["axis"] maps\mp\gametypes\_hud_util::setparent( level.enemyflagstatusicon["axis"] );
    level.enemyflagstatustext["axis"] maps\mp\gametypes\_hud_util::setpoint( "LEFT", "RIGHT", 4 );
    level.enemyflagstatustext["axis"] settext( &"OBJECTIVES_FLAG_HOME" );
    level.enemyflagstatustext["axis"].alpha = var_0;
    level.enemyflagstatustext["axis"].color = ( 1.0, 1.0, 1.0 );
    level.enemyflagstatustext["axis"].glowalpha = 1;
    level.enemyflagstatustext["axis"].hidewheninmenu = 1;
    level thread hidehudelementongameend( level.enemyflagstatustext["axis"] );
}

hidehudelementongameend( var_0 )
{
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0.alpha = 0;
}

spawnfxdelay( var_0, var_1, var_2, var_3, var_4 )
{
    wait(var_4);
    var_5 = spawnfx( var_0, var_1, var_2, var_3 );
    triggerfx( var_5 );
}

createteamflag( var_0, var_1 )
{
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

        var_4 = spawn( "trigger_radius", var_2.origin, 0, 96, var_2.height );
        var_2 = var_4;
        var_3[0] setmodel( level.flagmodel[var_0] );
        var_5 = maps\mp\gametypes\_gameobjects::createcarryobject( var_0, var_2, var_3, ( 0.0, 0.0, 85.0 ) );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetime( "friendly", 0.5 );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetime( "enemy", 0.5 );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetext( "enemy", &"MP_GRABBING_FLAG" );
        var_5 maps\mp\gametypes\_gameobjects::setteamusetext( "friendly", &"MP_RETURNING_FLAG" );
        var_5 maps\mp\gametypes\_gameobjects::allowcarry( "enemy" );
        var_5 maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
        var_5 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconkill2d );
        var_5 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconkill3d );
        var_5 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconescort2d );
        var_5 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconescort3d );
        var_5 maps\mp\gametypes\_gameobjects::setcarryicon( level.icon2d[var_0] );
        var_5.objidpingfriendly = 1;
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

createcapzone( var_0, var_1 )
{
    var_2 = getent( "ctf_zone_" + var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        common_scripts\utility::error( "No ctf_zone_" + var_1 + " trigger found in map." );
    else
    {
        var_3 = [];
        var_4 = maps\mp\gametypes\_gameobjects::createuseobject( var_0, var_2, var_3, ( 0.0, 0.0, 85.0 ) );
        var_4 maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
        var_4 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_4 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icondefendflag2d );
        var_4 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icondefendflag3d );
        var_4 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d );
        var_4 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d );
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
    self notify( "picked_up" );
    var_1 = var_0.pers["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    if ( var_1 == maps\mp\gametypes\_gameobjects::getownerteam() )
    {
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flagreturn", maps\mp\gametypes\_rank::getscoreinfovalue( "return" ) );
        var_0 thread [[ level.onxpevent ]]( "return" );
        thread returnflag();
        var_0 maps\mp\_utility::incplayerstat( "flagsreturned", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "return", var_0.origin );
        maps\mp\_utility::printandsoundoneveryone( var_1, maps\mp\_utility::getotherteam( var_1 ), &"MP_FLAG_RETURNED", &"MP_ENEMY_FLAG_RETURNED", "mp_obj_returned", "mp_obj_returned", "" );
        maps\mp\_utility::leaderdialog( "enemy_flag_returned", var_2, "status" );
        maps\mp\_utility::leaderdialog( "flag_returned", var_1, "status" );
        var_0 maps\mp\_utility::incpersstat( "returns", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "returns", var_0.pers["returns"] );
        level.friendlyflagstatustext[var_1] settext( &"OBJECTIVES_FLAG_HOME" );
        level.friendlyflagstatustext[var_1].glowcolor = ( 1.0, 1.0, 1.0 );
        level.friendlyflagstatustext[var_1].glowalpha = 0;
        level.enemyflagstatustext[var_2] settext( &"OBJECTIVES_FLAG_HOME" );
        level.enemyflagstatustext[var_2].glowcolor = ( 1.0, 1.0, 1.0 );
        level.enemyflagstatustext[var_2].glowalpha = 0;
    }
    else
    {
        if ( isdefined( level.ctf_loadouts ) && isdefined( level.ctf_loadouts[var_1] ) )
            var_0 thread applyflagcarrierclass();
        else
            var_0 attachflag();

        level.friendlyflagstatustext[var_2] setplayernamestring( var_0 );
        level.friendlyflagstatustext[var_2].glowcolor = ( 0.75, 0.25, 0.25 );
        level.friendlyflagstatustext[var_2].glowalpha = 1;
        level.enemyflagstatustext[var_1] setplayernamestring( var_0 );
        level.enemyflagstatustext[var_1].glowcolor = ( 0.25, 0.75, 0.25 );
        level.enemyflagstatustext[var_1].glowalpha = 1;
        maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconkill2d );
        maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconkill3d );
        maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconescort2d );
        maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconescort3d );
        level.capzones[var_2] maps\mp\gametypes\_gameobjects::allowuse( "none" );
        level.capzones[var_2] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );

        if ( !level.teamflags[var_1] maps\mp\gametypes\_gameobjects::ishome() )
        {
            level.capzones[var_1].trigger maps\mp\_entityheadicons::setheadicon( var_0, level.iconwaitforflag2d, ( 0.0, 0.0, 85.0 ), undefined, undefined, undefined, undefined, undefined, undefined, undefined, 0 );

            if ( isdefined( level.teamflags[var_1].carrier ) )
                level.capzones[var_2].trigger maps\mp\_entityheadicons::setheadicon( level.teamflags[var_1].carrier, level.iconwaitforflag2d, ( 0.0, 0.0, 85.0 ), undefined, undefined, undefined, undefined, undefined, undefined, undefined, 0 );
        }

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
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconreturnflag2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconreturnflag3d );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d );
    level.friendlyflagstatustext[var_1] settext( &"OBJECTIVES_FLAG_AWAY" );
    level.friendlyflagstatustext[var_1].glowcolor = ( 1.0, 1.0, 1.0 );
    level.friendlyflagstatustext[var_1].glowalpha = 0;
    level.enemyflagstatustext[var_2] settext( &"OBJECTIVES_FLAG_AWAY" );
    level.enemyflagstatustext[var_2].glowcolor = ( 1.0, 1.0, 1.0 );
    level.enemyflagstatustext[var_2].glowalpha = 0;
    level.capzones[var_2].trigger maps\mp\_entityheadicons::setheadicon( "none", "", ( 0.0, 0.0, 0.0 ) );

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
    thread returnaftertime();
}

returnaftertime()
{
    self endon( "picked_up" );
    wait(level.flagreturntime);
    var_0 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_1 = level.otherteam[var_0];
    maps\mp\_utility::playsoundonplayers( "mp_war_objective_taken", var_0 );
    maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_1 );
    maps\mp\gametypes\_gameobjects::returnhome();
}

onreset()
{
    var_0 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_1 = level.otherteam[var_0];
    maps\mp\gametypes\_gameobjects::allowcarry( "enemy" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconkill2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconkill3d );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconescort2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconescort3d );
    level.friendlyflagstatustext[var_0] settext( &"OBJECTIVES_FLAG_HOME" );
    level.friendlyflagstatustext[var_0].glowcolor = ( 1.0, 1.0, 1.0 );
    level.friendlyflagstatustext[var_0].glowalpha = 0;
    level.enemyflagstatustext[var_1] settext( &"OBJECTIVES_FLAG_HOME" );
    level.enemyflagstatustext[var_1].glowcolor = ( 1.0, 1.0, 1.0 );
    level.enemyflagstatustext[var_1].glowalpha = 0;
    level.capzones[var_0] maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
    level.capzones[var_0] maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    level.capzones[var_0] maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.icondefendflag2d );
    level.capzones[var_0] maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.icondefendflag3d );
    level.capzones[var_0] maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d );
    level.capzones[var_0] maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d );
    level.capzones[var_0].trigger maps\mp\_entityheadicons::setheadicon( "none", "", ( 0.0, 0.0, 0.0 ) );
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
    maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_1, 1 );
    var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flag_capture", maps\mp\gametypes\_rank::getscoreinfovalue( "capture" ) );
    maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_0 );
    var_0 thread [[ level.onxpevent ]]( "capture" );
    var_0 maps\mp\_utility::incplayerstat( "flagscaptured", 1 );
    var_0 notify( "objective", "captured" );
    var_0 thread maps\mp\_matchdata::loggameevent( "capture", var_0.origin );
    var_0 maps\mp\_utility::incpersstat( "captures", 1 );
    var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "captures", var_0.pers["captures"] );
    maps\mp\_utility::printandsoundoneveryone( var_1, var_2, &"MP_ENEMY_FLAG_CAPTURED_BY", &"MP_FLAG_CAPTURED_BY", "mp_obj_captured", "mp_enemy_obj_captured", var_0 );

    if ( isdefined( var_0.carryflag ) )
        var_0 detachflag();

    if ( isdefined( level.ctf_loadouts ) && isdefined( level.ctf_loadouts[var_1] ) )
        var_0 thread removeflagcarrierclass();

    level.teamflags[var_2] returnflag();
    level thread checkroundwin( var_1 );
}

checkroundwin( var_0 )
{
    if ( maps\mp\_utility::inovertime() )
    {
        game["roundsWon"][var_0]++;
        level.finalkillcam_winner = var_0;
        game["teamScores"]["axis"] = game["roundsWon"]["axis"];
        game["teamScores"]["allies"] = game["roundsWon"]["allies"];
        setteamscore( "axis", game["teamScores"]["axis"] );
        setteamscore( "allies", game["teamScores"]["allies"] );
        thread maps\mp\gametypes\_gamelogic::endgame( var_0, game["strings"]["score_limit_reached"] );
    }
    else if ( game["switchedsides"] )
    {
        if ( game["teamScores"][var_0] == maps\mp\_utility::getwatcheddvar( "scorelimit" ) )
        {
            game["roundsWon"][var_0]++;
            game["teamScores"]["axis"] = game["roundsWon"]["axis"];
            game["teamScores"]["allies"] = game["roundsWon"]["allies"];
            setteamscore( "axis", game["teamScores"]["axis"] );
            setteamscore( "allies", game["teamScores"]["allies"] );

            if ( game["roundsWon"][var_0] > game["roundsWon"][level.otherteam[var_0]] )
            {
                level.finalkillcam_winner = var_0;
                thread maps\mp\gametypes\_gamelogic::endgame( var_0, game["strings"]["score_limit_reached"] );
            }
            else
            {
                level.finalkillcam_winner = "none";
                thread maps\mp\gametypes\_gamelogic::endgame( "overtime", game["strings"]["score_limit_reached"] );
            }
        }
    }
    else if ( game["teamScores"][var_0] == maps\mp\_utility::getwatcheddvar( "scorelimit" ) )
    {
        game["roundsWon"][var_0]++;
        level.finalkillcam_winner = var_0;
        game["teamScores"]["axis"] = game["roundsWon"]["axis"];
        game["teamScores"]["allies"] = game["roundsWon"]["allies"];
        setteamscore( "axis", game["teamScores"]["axis"] );
        setteamscore( "allies", game["teamScores"]["allies"] );
        thread maps\mp\gametypes\_gamelogic::endgame( "halftime", game["strings"]["score_limit_reached"] );
    }
}

ontimelimit()
{
    if ( maps\mp\_utility::inovertime() )
    {
        game["teamScores"]["axis"] = game["roundsWon"]["axis"];
        game["teamScores"]["allies"] = game["roundsWon"]["allies"];
        setteamscore( "axis", game["teamScores"]["axis"] );
        setteamscore( "allies", game["teamScores"]["allies"] );
        level.finalkillcam_winner = "none";
        thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["time_limit_reached"] );
    }
    else if ( game["switchedsides"] )
    {
        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            game["roundsWon"]["axis"]++;
        else if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            game["roundsWon"]["allies"]++;

        game["teamScores"]["axis"] = game["roundsWon"]["axis"];
        game["teamScores"]["allies"] = game["roundsWon"]["allies"];
        setteamscore( "axis", game["teamScores"]["axis"] );
        setteamscore( "allies", game["teamScores"]["allies"] );

        if ( game["roundsWon"]["axis"] > game["roundsWon"]["allies"] )
        {
            level.finalkillcam_winner = "axis";
            thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["time_limit_reached"] );
            return;
        }
        else if ( game["roundsWon"]["allies"] > game["roundsWon"]["axis"] )
        {
            level.finalkillcam_winner = "allies";
            thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["time_limit_reached"] );
            return;
        }
        else
        {
            level.finalkillcam_winner = "none";
            thread maps\mp\gametypes\_gamelogic::endgame( "overtime", game["strings"]["time_limit_reached"] );
        }
    }
    else
    {
        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            game["roundsWon"]["axis"]++;
            level.finalkillcam_winner = "axis";
        }
        else if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
        {
            game["roundsWon"]["allies"]++;
            level.finalkillcam_winner = "allies";
        }
        else
            level.finalkillcam_winner = "none";

        game["teamScores"]["axis"] = game["roundsWon"]["axis"];
        game["teamScores"]["allies"] = game["roundsWon"]["allies"];
        setteamscore( "axis", game["teamScores"]["axis"] );
        setteamscore( "allies", game["teamScores"]["allies"] );
        thread maps\mp\gametypes\_gamelogic::endgame( "halftime", game["strings"]["time_limit_reached"] );
    }
}

applyflagcarrierclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

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

    self.pers["gamemodeLoadout"] = level.ctf_loadouts[self.team];
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
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
    thread waitattachflag();
}

waitattachflag()
{
    level endon( "game_ende" );
    self endon( "disconnect" );
    self endon( "death" );
    self waittill( "spawned_player" );
    attachflag();
}

removeflagcarrierclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

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

    self.pers["gamemodeLoadout"] = undefined;
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0.playerspawnpos = self.origin;
    var_0.notti = 1;
    self.setspawnpoint = var_0;
    self notify( "faux_spawn" );
    self.faux_spawn_stance = self getstance();
    thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
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
            var_1 maps\mp\_utility::incpersstat( "defends", 1 );
            var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
            thread maps\mp\_matchdata::logkillevent( var_9, "carrying" );
            detachflag();
        }
    }
    else if ( isdefined( self.carryflag ) )
        detachflag();
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

setspecialloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
        level.ctf_loadouts["axis"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 5 );

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 5, "class", "inUse" ) )
        level.ctf_loadouts["allies"] = maps\mp\_utility::getmatchrulesspecialclass( "allies", 5 );
}
