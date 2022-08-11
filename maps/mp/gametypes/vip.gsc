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
    maps\mp\_utility::registernumlivesdvar( level.gametype, 1, 0, 10 );
    maps\mp\_utility::registerwatchdvarint( "halftime", 0 );
    level.teambased = 1;
    level.objectivebased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onnormaldeath = ::onnormaldeath;
    level.onplayerkilled = ::onplayerkilled;
    level.ondeadevent = ::ondeadevent;
    game["dialog"]["gametype"] = "VIP";
}

onprecachegametype()
{
    precacheshader( "compass_waypoint_captureneutral" );
    precacheshader( "compass_waypoint_capture" );
    precacheshader( "compass_waypoint_defend" );
    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
    precachestring( &"MP_ELIMINATED_VIP" );
    precachestring( &"MP_DEFENDED_VIP" );
    precachestring( &"SPLASHES_VIP" );
    game["flagmodels"] = [];
    game["flagmodels"]["neutral"] = "prop_flag_neutral";
    game["flagmodels"]["allies"] = maps\mp\gametypes\_teams::getteamflagmodel( "allies" );
    game["flagmodels"]["axis"] = maps\mp\gametypes\_teams::getteamflagmodel( "axis" );
    precachemodel( game["flagmodels"]["neutral"] );
    precachemodel( game["flagmodels"]["allies"] );
    precachemodel( game["flagmodels"]["axis"] );
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

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_VIP" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_VIP" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_VIP" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_VIP" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_VIP_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_VIP_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_VIP_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_VIP_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_2[0] = "vip";
    var_2[1] = "sd";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    thread waittoprocess();
}

waittoprocess()
{
    level endon( "game_end" );
    level endon( "waitSkipped" );
    thread extractionzone();
    thread skipwait();
    maps\mp\_utility::gameflagwait( "prematch_done" );
    maps\mp\_utility::gameflagwait( "graceperiod_done" );
    self notify( "graceComplete" );
    thread vipselection();
}

skipwait()
{
    self endon( "graceComplete" );

    for (;;)
    {
        if ( level.players.size > 2 )
            break;

        wait 0.5;
    }

    self notify( "waitSkipped" );
    thread vipselection();
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
    self.isvip = 0;
    self.usingobj = undefined;
    level notify( "spawned_player" );
}

onnormaldeath( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill" );
    var_1 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_1.pers["team"], var_3 );
    var_4 = var_0.team;

    if ( isdefined( var_0.isvip ) && var_0.isvip )
    {
        level thread vip_endgame( game["attackers"], &"MP_ELIMINATED_VIP" );
        var_1.finalkill = 1;
    }
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

ondeadevent( var_0 )
{
    if ( var_0 == game["attackers"] )
        level thread vip_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    else if ( var_0 == game["defenders"] )
        level thread vip_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
}

vip_endgame( var_0, var_1 )
{
    thread maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
}

vipselection()
{
    var_0 = [];
    var_1 = 0;

    for (;;)
    {
        if ( level.players.size >= 2 )
            break;

        if ( var_1 >= 100 )
        {
            iprintlnbold( "Game mode only playable with 2 or more players" );
            wait 2;
            maps\mp\gametypes\_callbacksetup::abortlevel();
        }

        var_1++;
        wait 0.1;
    }

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == game["defenders"] )
            var_0[var_0.size] = var_3;
    }

    var_5 = randomintrange( 0, var_0.size );
    var_6 = var_0[var_5];

    if ( !isalive( var_6 ) && !issubstr( var_6.guid, "bot" ) )
        var_6 forcevipspawn();

    setupvip( var_6 );
}

setupvip( var_0 )
{
    var_0 takeallweapons();
    var_0 maps\mp\_utility::_clearperks();
    var_0.isvip = 1;
    var_0 giveweapon( "deserteagle_fmj_mp" );
    var_0 givestartammo( "deserteagle_fmj_mp" );
    var_0 giveweapon( "riotshield_mp" );
    var_0 switchtoweapon( "riotshield_mp" );
    var_0 maps\mp\_utility::giveperk( "specialty_armorvest", 0 );
    var_0 maps\mp\_utility::giveperk( "specialty_finalstand", 0 );
    var_0 iprintlnbold( "You Are the VIP" );
}

extractionzone()
{
    var_0 = getentarray( "extraction_vip", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        maps\mp\gametypes\_callbacksetup::abortlevel();
        return;
    }
    else
        level.extractionzone = var_0;

    var_1 = level.extractionzone[0];

    if ( isdefined( var_1.target ) )
        var_2[0] = getent( var_1.target, "targetname" );
    else
    {
        var_2[0] = spawn( "script_model", var_1.origin );
        var_2[0].angles = var_1.angles;
    }

    var_0 = maps\mp\gametypes\_gameobjects::createuseobject( game["defenders"], var_1, var_2, ( 0.0, 0.0, 100.0 ) );
    var_0 maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
    var_0 maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    var_0 maps\mp\gametypes\_gameobjects::setusetext( &"MP_CALLING_EXTRACTION" );
    var_0 maps\mp\gametypes\_gameobjects::setusetime( 0 );
    var_0.onuse = ::onuse;
    var_0.oncantuse = ::oncantuse;
    var_3 = var_1.origin + ( 0.0, 0.0, 32.0 );
    var_4 = var_1.origin + ( 0.0, 0.0, -32.0 );
    var_5 = bullettrace( var_3, var_4, 0, undefined );
    var_6 = maps\mp\gametypes\_teams::getteamflagfx( game["defenders"] );
    var_7 = loadfx( var_6 );
    var_8 = vectortoangles( var_5["normal"] );
    var_9 = anglestoforward( var_8 );
    var_10 = anglestoright( var_8 );
    thread spawnfxdelay( var_7, var_5["position"], var_9, var_10, 0.5 );
    var_0 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "compass_waypoint_defend" );
    var_0 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" );
    var_0 maps\mp\gametypes\_gameobjects::setvisibleteam( "friendly" );
    level.extractionzone = var_0;
}

setvipuse()
{
    foreach ( var_1 in level.players )
    {
        if ( !var_1.isvip )
            self.trigger disableplayeruse( var_1 );
    }
}

onuse( var_0 )
{
    if ( !isdefined( var_0.isvip ) || !var_0.isvip )
        return;

    iprintlnbold( "Extraction on its way" );
    handletimer( var_0 );
}

handletimer( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_end" );
    level.extractiontime = 45;
    maps\mp\gametypes\_gamelogic::pausetimer();
    level.timelimitoverride = 1;
    setgameendtime( int( gettime() + level.extractiontime * 1000 ) );
    wait(level.extractiontime);
    level thread vip_endgame( game["defenders"], &"MP_DEFENDED_VIP" );
}

onenduse( var_0, var_1, var_2 )
{

}

oncantuse( var_0 )
{

}

spawnfxdelay( var_0, var_1, var_2, var_3, var_4 )
{
    wait(var_4);
    var_5 = spawnfx( var_0, var_1, var_2, var_3 );
    triggerfx( var_5 );
}

forcevipspawn()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );

    if ( self.hasspawned )
        return;

    if ( !maps\mp\_utility::isvalidclass( self.pers["class"] ) )
    {
        self.pers["class"] = "CLASS_CUSTOM1";
        self.class = self.pers["class"];
    }

    maps\mp\_utility::closemenus();
    thread maps\mp\gametypes\_playerlogic::spawnclient();
}
