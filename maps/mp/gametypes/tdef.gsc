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
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 7500 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_enemyflagradar = 1;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    setspecialloadouts();
    level.teambased = 1;
    level.initgametypeawards = ::initgametypeawards;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onnormaldeath = ::onnormaldeath;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    precacheshader( "waypoint_targetneutral" );
    game["dialog"]["gametype"] = "team_def";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    level.matchrules_enemyflagradar = getmatchrulesdata( "tdefData", "enemyFlagRadar" );
    setdynamicdvar( "scr_tdef_roundswitch", 0 );
    maps\mp\_utility::registerroundswitchdvar( "tdef", 0, 0, 9 );
    setdynamicdvar( "scr_tdef_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "tdef", 1 );
    setdynamicdvar( "scr_tdef_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "tdef", 1 );
    setdynamicdvar( "scr_tdef_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "tdef", 0 );
    setdynamicdvar( "scr_tdef_promode", 0 );
}

onprecachegametype()
{
    precachestring( &"MP_NEUTRAL_FLAG_CAPTURED_BY" );
    precachestring( &"MP_NEUTRAL_FLAG_DROPPED_BY" );
    precachestring( &"MP_GRABBING_FLAG" );
    precachestring( &"OBJECTIVES_TDEF_ATTACKER_HINT" );
    precachestring( &"OBJECTIVES_TDEF_DEFENDER_HINT" );
    precachestring( &"OBJECTIVES_TDEF" );
    precachestring( &"OBJECTIVES_TDEF_SCORE" );
    precachestring( &"OBJECTIVES_TDEF_HINT" );
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

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_TDEF" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_TDEF" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_TDEF" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_TDEF" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_TDEF_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_TDEF_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_TDEF_ATTACKER_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_TDEF_ATTACKER_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "firstblood", 200 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_bonus", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_carrier", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "team_assist", 20 );
    var_2[0] = level.gametype;
    var_2[1] = "tdm";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    tdef();
}

tdef()
{
    level.icon2d["allies"] = maps\mp\gametypes\_teams::getteamflagicon( "allies" );
    level.icon2d["axis"] = maps\mp\gametypes\_teams::getteamflagicon( "axis" );
    precacheshader( level.icon2d["axis"] );
    precacheshader( level.icon2d["allies"] );
    level.carryflag["allies"] = maps\mp\gametypes\_teams::getteamflagcarrymodel( "allies" );
    level.carryflag["axis"] = maps\mp\gametypes\_teams::getteamflagcarrymodel( "axis" );
    level.carryflag["neutral"] = "prop_flag_neutral";
    precachemodel( level.carryflag["allies"] );
    precachemodel( level.carryflag["axis"] );
    precachemodel( level.carryflag["neutral"] );
    level.iconescort3d = "waypoint_defend";
    level.iconescort2d = "waypoint_defend";
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
    precacheshader( "waypoint_flag_friendly" );
    precacheshader( "waypoint_flag_enemy" );
    level.gameflag = undefined;
}

onnormaldeath( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill" );

    if ( isdefined( level.gameflag ) && level.gameflag maps\mp\gametypes\_gameobjects::getownerteam() == var_1.pers["team"] )
    {
        if ( isdefined( var_1.carryflag ) )
            var_1 maps\mp\_utility::incplayerstat( "killsasflagcarrier", 1 );
        else
        {
            level.gameflag.carrier thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_TEAM_ASSIST" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "team_assist", level.gameflag.carrier, var_0, 1 );
            level.gameflag.carrier thread maps\mp\gametypes\_rank::giverankxp( "team_assist" );
        }

        var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_X2_BONUS" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "kill_bonus", var_1, var_0, 1 );
        var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill_bonus" );
        var_3 *= 2;
    }
    else if ( !isdefined( level.gameflag ) && cancreateflagatvictimorigin( var_0 ) )
    {
        level.gameflag = createflag( var_0 );
        var_3 += maps\mp\gametypes\_rank::getscoreinfovalue( "firstblood" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "firstblood", var_1, var_0, 1 );
    }
    else if ( isdefined( var_0.carryflag ) )
    {
        var_4 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill_carrier" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_killflagcarrier", var_1 );
        var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "flag_carrier_killed", var_4 );
        maps\mp\gametypes\_gamescore::giveplayerscore( "kill_carrier", var_1, var_0, 1 );
        var_1 maps\mp\_utility::incplayerstat( "flagcarrierkills", 1 );
        var_1 thread [[ level.onxpevent ]]( "kill_carrier" );
        var_1 notify( "objective", "kill_carrier" );
        var_1 thread maps\mp\_matchdata::loggameevent( "kill_carrier", var_1.origin );
        var_3 += var_4;
    }

    var_1 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_1.pers["team"], var_3 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1.team] > game["teamScores"][level.otherteam[var_1.team]] )
        var_1.finalkill = 1;
}

ondrop( var_0 )
{
    if ( isdefined( var_0.tdef_flagtime ) )
    {
        var_1 = int( gettime() - var_0.tdef_flagtime );
        var_0 maps\mp\_utility::incplayerstat( "holdingteamdefenderflag", var_1 );

        if ( var_1 / 100 / 60 < 1 )
            var_2 = 0;
        else
            var_2 = int( var_1 / 100 / 60 );

        var_0 maps\mp\_utility::incpersstat( "destructions", var_2 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", var_0.pers["destructions"] );
        var_0.tdef_flagtime = undefined;
        var_0 notify( "dropped_flag" );
    }

    var_3 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_4 = level.otherteam[var_3];

    if ( isdefined( self.portable_radar ) )
    {
        level maps\mp\gametypes\_portable_radar::deleteportableradar( self.portable_radar );
        self.portable_radar = undefined;
    }

    self.currentcarrier = undefined;
    maps\mp\gametypes\_gameobjects::setownerteam( "neutral" );
    maps\mp\gametypes\_gameobjects::allowcarry( "any" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconcaptureflag2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconcaptureflag3d );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.carryflag ) )
            var_0 detachflag();

        maps\mp\_utility::printandsoundoneveryone( var_3, var_4, &"MP_NEUTRAL_FLAG_DROPPED_BY", &"MP_NEUTRAL_FLAG_DROPPED_BY", "mp_war_objective_lost", "mp_war_objective_lost", var_0 );
    }
    else
    {
        maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_3 );
        maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_4 );
    }

    maps\mp\_utility::leaderdialog( "dropped_flag", var_3, "status" );
    maps\mp\_utility::leaderdialog( "enemy_dropped_flag", var_4, "status" );
}

onpickup( var_0 )
{
    self notify( "picked_up" );
    var_0.tdef_flagtime = gettime();
    var_0 thread watchforendgame();
    var_1 = maps\mp\gametypes\_rank::getscoreinfovalue( "capture" );
    var_2 = var_0.pers["team"];
    var_3 = level.otherteam[var_2];

    if ( isdefined( level.tdef_loadouts ) && isdefined( level.tdef_loadouts[var_2] ) )
        var_0 thread applyflagcarrierclass();
    else
        var_0 attachflag();

    self.currentcarrier = var_0;
    var_0.carryicon setshader( level.icon2d[var_2], var_0.carryicon.width, var_0.carryicon.height );
    maps\mp\gametypes\_gameobjects::setownerteam( var_2 );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconescort2d );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconescort2d );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconkill3d );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconkill3d );
    maps\mp\_utility::leaderdialog( "got_flag", var_2, "status" );
    maps\mp\_utility::leaderdialog( "enemy_got_flag", var_3, "status" );
    thread maps\mp\_utility::teamplayercardsplash( "callout_flagcapture", var_0 );
    var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "flag_capture", var_1 );
    maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_0, undefined, 1 );
    var_0 thread [[ level.onxpevent ]]( "capture" );
    var_0 maps\mp\_utility::incplayerstat( "flagscaptured", 1 );
    var_0 notify( "objective", "captured" );
    var_0 thread maps\mp\_matchdata::loggameevent( "capture", var_0.origin );
    maps\mp\_utility::printandsoundoneveryone( var_2, var_3, &"MP_NEUTRAL_FLAG_CAPTURED_BY", &"MP_NEUTRAL_FLAG_CAPTURED_BY", "mp_obj_captured", "mp_enemy_obj_captured", var_0 );

    if ( self.currentteam == var_3 )
        var_0 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_2, var_1 );

    self.currentteam = var_2;

    if ( level.matchrules_enemyflagradar )
        thread flagattachradar( var_3 );
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

    self.pers["gamemodeLoadout"] = level.tdef_loadouts[self.team];
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
    thread waitattachflag();
    self notify( "faux_spawn" );
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
}

waitattachflag()
{
    level endon( "game_ende" );
    self endon( "disconnect" );
    self endon( "death" );
    self waittill( "spawned_player" );
    attachflag();
}

watchforendgame()
{
    self endon( "dropped_flag" );
    self endon( "disconnect" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
    {
        if ( isdefined( self.tdef_flagtime ) )
        {
            var_0 = int( gettime() - self.tdef_flagtime );
            maps\mp\_utility::incplayerstat( "holdingteamdefenderflag", var_0 );

            if ( var_0 / 100 / 60 < 1 )
                var_1 = 0;
            else
                var_1 = int( var_0 / 100 / 60 );

            maps\mp\_utility::incpersstat( "destructions", var_1 );
            maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", self.pers["destructions"] );
        }
    }
}

cancreateflagatvictimorigin( var_0 )
{
    var_1 = getentarray( "minefield", "targetname" );
    var_2 = getentarray( "trigger_hurt", "classname" );
    var_3 = getentarray( "radiation", "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_0 istouching( var_3[var_4] ) )
            return 0;
    }

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( var_0 istouching( var_1[var_4] ) )
            return 0;
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_0 istouching( var_2[var_4] ) )
            return 0;
    }

    return 1;
}

createflag( var_0 )
{
    var_1[0] = spawn( "script_model", var_0.origin );
    var_1[0] setmodel( level.carryflag["neutral"] );
    var_2 = spawn( "trigger_radius", var_0.origin, 0, 96, 72 );
    var_3 = maps\mp\gametypes\_gameobjects::createcarryobject( "neutral", var_2, var_1, ( 0.0, 0.0, 85.0 ) );
    var_3 maps\mp\gametypes\_gameobjects::setteamusetime( "friendly", 0.5 );
    var_3 maps\mp\gametypes\_gameobjects::setteamusetime( "enemy", 0.5 );
    var_3 maps\mp\gametypes\_gameobjects::setteamusetext( "enemy", &"MP_GRABBING_FLAG" );
    var_3 maps\mp\gametypes\_gameobjects::setteamusetext( "friendly", &"MP_GRABBING_FLAG" );
    var_3 maps\mp\gametypes\_gameobjects::allowcarry( "any" );
    var_3 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    var_3 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", level.iconcaptureflag2d );
    var_3 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", level.iconcaptureflag3d );
    var_3 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", level.iconcaptureflag2d );
    var_3 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", level.iconcaptureflag3d );
    var_3 maps\mp\gametypes\_gameobjects::setcarryicon( level.icon2d["axis"] );
    var_3.allowweapons = 1;
    var_3.onpickup = ::onpickup;
    var_3.onpickupfailed = ::onpickup;
    var_3.ondrop = ::ondrop;
    var_3.oldradius = 96;
    var_3.currentteam = "none";
    var_3.requireslos = 1;
    level.favorclosespawnent = var_3.trigger;
    level.favorclosespawnscalar = 3;
    var_3 thread updatebaseposition();
    return var_3;
}

updatebaseposition()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( self.safeorigin ) )
        {
            self.baseorigin = self.safeorigin;
            self.trigger.baseorigin = self.safeorigin;
            self.visuals[0].baseorigin = self.safeorigin;
        }

        wait 0.05;
    }
}

attachflag()
{
    self attach( level.carryflag[self.pers["team"]], "J_spine4", 1 );
    self.carryflag = level.carryflag[self.pers["team"]];
    level.favorclosespawnent = self;
}

detachflag()
{
    self detach( self.carryflag, "J_spine4" );
    self.carryflag = undefined;
    level.favorclosespawnent = level.gameflag.trigger;
}

flagattachradar( var_0 )
{
    level endon( "game_ended" );
    self endon( "dropped" );
    var_1 = getflagradarowner( var_0 );
    var_2 = spawn( "script_model", self.currentcarrier.origin );
    var_2.team = var_0;
    var_2.owner = var_1;
    var_2 makeportableradar( var_1 );
    self.portable_radar = var_2;
    thread flagradarmover();
    thread flagwatchradarownerlost();
}

getflagradarowner( var_0 )
{
    level endon( "game_ended" );
    self endon( "dropped" );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( isalive( var_2 ) && var_2.pers["team"] == var_0 )
                return var_2;
        }

        wait 0.05;
    }
}

flagradarmover()
{
    level endon( "game_ended" );
    self endon( "dropped" );
    self.portable_radar endon( "death" );

    for (;;)
    {
        self.portable_radar moveto( self.currentcarrier.origin, 0.05 );
        wait 0.05;
    }
}

flagwatchradarownerlost()
{
    level endon( "game_ended" );
    self endon( "dropped" );
    var_0 = self.portable_radar.team;
    self.portable_radar.owner common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    level maps\mp\gametypes\_portable_radar::deleteportableradar( self.portable_radar );
    self.portable_radar = undefined;
    flagattachradar( var_0 );
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

initgametypeawards()
{
    maps\mp\_awards::initstataward( "flagscaptured", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "flagcarrierkills", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "killsasflagcarrier", 0, maps\mp\_awards::highestwins );
}

setspecialloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
        level.tdef_loadouts["axis"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 5 );

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 5, "class", "inUse" ) )
        level.tdef_loadouts["allies"] = maps\mp\_utility::getmatchrulesspecialclass( "allies", 5 );
}
