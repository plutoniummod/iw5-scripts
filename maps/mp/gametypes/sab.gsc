// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();
    level.teambased = 1;

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
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    maps\mp\_utility::setovertimelimitdvar( 2 );
    setspecialloadouts();
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.ononeleftevent = ::ononeleftevent;
    level.ontimelimit = ::ontimelimit;
    level.onnormaldeath = ::onnormaldeath;
    level.initgametypeawards = ::initgametypeawards;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "sabotage";

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
    var_0 = getent( "sab_bomb_defuse_allies", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_0 = getent( "sab_bomb_defuse_axis", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    makedvarserverinfo( "ui_bomb_timer_endtime", -1 );
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "scr_sab_bombtimer", getmatchrulesdata( "sabData", "bombTimer" ) );
    setdynamicdvar( "scr_sab_planttime", getmatchrulesdata( "sabData", "plantTime" ) );
    setdynamicdvar( "scr_sab_defusetime", getmatchrulesdata( "sabData", "defuseTime" ) );
    setdynamicdvar( "scr_sab_hotpotato", getmatchrulesdata( "sabData", "sharedBombTimer" ) );
    setdynamicdvar( "scr_sab_roundswitch", 1 );
    maps\mp\_utility::registerroundswitchdvar( "sab", 1, 0, 9 );
    setdynamicdvar( "scr_sab_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "sab", 1 );
    setdynamicdvar( "scr_sab_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "sab", 1 );
    setdynamicdvar( "scr_sab_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "sab", 0 );
    setdynamicdvar( "scr_sab_promode", 0 );
}

onprecachegametype()
{
    game["bomb_dropped_sound"] = "mp_war_objective_lost";
    game["bomb_recovered_sound"] = "mp_war_objective_taken";
    precacheshader( "waypoint_bomb" );
    precacheshader( "waypoint_kill" );
    precacheshader( "waypoint_bomb_enemy" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_defuse" );
    precacheshader( "waypoint_target" );
    precacheshader( "waypoint_escort" );
    precacheshader( "waypoint_bomb" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_defuse" );
    precacheshader( "waypoint_target" );
    precacheshader( "hud_suitcase_bomb" );
    precachestring( &"MP_EXPLOSIVES_RECOVERED_BY" );
    precachestring( &"MP_EXPLOSIVES_DROPPED_BY" );
    precachestring( &"MP_EXPLOSIVES_PLANTED_BY" );
    precachestring( &"MP_EXPLOSIVES_DEFUSED_BY" );
    precachestring( &"MP_YOU_HAVE_RECOVERED_THE_BOMB" );
    precachestring( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    precachestring( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    precachestring( &"MP_PLANTING_EXPLOSIVE" );
    precachestring( &"MP_DEFUSING_EXPLOSIVE" );
    precachestring( &"MP_TARGET_DESTROYED" );
    precachestring( &"MP_NO_RESPAWN" );
    precachestring( &"MP_TIE_BREAKER" );
    precachestring( &"MP_NO_RESPAWN" );
    precachestring( &"MP_SUDDEN_DEATH" );
}

onstartgametype()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    setclientnamemode( "auto_change" );
    game["strings"]["target_destroyed"] = &"MP_TARGET_DESTROYED";
    game["strings"]["target_defended"] = &"MP_TARGET_DEDEFEND";
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_SAB" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_SAB" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_SAB" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_SAB" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_SAB_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_SAB_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_SAB_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_SAB_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_sab_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_sab_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_sab_spawn_allies" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_sab_spawn_axis" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_sab_spawn_allies_planted", 1 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_sab_spawn_axis_planted", 1 );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    level.spawn_axis = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_axis" );
    level.spawn_axis_planted = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_axis_planted" );
    level.spawn_axis_planted = common_scripts\utility::array_combine( level.spawn_axis_planted, level.spawn_axis );
    level.spawn_allies = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_allies" );
    level.spawn_allies_planted = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_allies_planted" );
    level.spawn_allies_planted = common_scripts\utility::array_combine( level.spawn_allies_planted, level.spawn_allies );
    level.spawn_axis_start = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_axis_start" );
    level.spawn_allies_start = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_sab_spawn_allies_start" );
    maps\mp\gametypes\_rank::registerscoreinfo( "plant", 200 );
    maps\mp\gametypes\_rank::registerscoreinfo( "destroy", 1000 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defuse", 150 );
    var_0[0] = "sab";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    thread updategametypedvars();
    thread sabotage();
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::getotherteam( var_0 );

    if ( level.usestartspawn )
    {
        if ( var_0 == "axis" )
            var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( level.spawn_axis_start );
        else
            var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( level.spawn_allies_start );
    }
    else if ( isdefined( level.bombplanted ) && level.bombplanted && ( isdefined( level.bombowner ) && var_0 == level.bombowner.team ) )
    {
        if ( var_0 == "axis" )
            var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_axis_planted );
        else
            var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_allies_planted );
    }
    else if ( var_0 == "axis" )
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_axis );
    else
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_allies );

    return var_1;
}

onspawnplayer()
{
    self.isplanting = 0;
    self.isdefusing = 0;
    self.isbombcarrier = 0;

    if ( maps\mp\_utility::inovertime() && !isdefined( self.otspawned ) )
        thread printothint();
}

printothint()
{
    self endon( "disconnect" );
    wait 0.25;
    thread maps\mp\gametypes\_hud_message::splashnotify( "sudden_death" );
    self.otspawned = 1;
}

updategametypedvars()
{
    level.planttime = maps\mp\_utility::dvarfloatvalue( "planttime", 5, 0, 20 );
    level.defusetime = maps\mp\_utility::dvarfloatvalue( "defusetime", 5, 0, 20 );
    level.bombtimer = maps\mp\_utility::dvarfloatvalue( "bombtimer", 45, 1, 300 );
    level.hotpotato = maps\mp\_utility::dvarintvalue( "hotpotato", 1, 0, 1 );
    level.scoremode = maps\mp\_utility::getwatcheddvar( "scorelimit" );
}

sabotage()
{
    level.bombplanted = 0;
    level.bombexploded = 0;
    level._effect["bombexplosion"] = loadfx( "explosions/tanker_explosion" );
    var_0 = getent( "sab_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        common_scripts\utility::error( "No sab_bomb_pickup_trig trigger found in map." );
        return;
    }

    var_1[0] = getent( "sab_bomb", "targetname" );

    if ( !isdefined( var_1[0] ) )
    {
        common_scripts\utility::error( "No sab_bomb script_model found in map." );
        return;
    }

    precachemodel( "prop_suitcase_bomb" );
    var_1[0] setmodel( "prop_suitcase_bomb" );
    level.sabbomb = maps\mp\gametypes\_gameobjects::createcarryobject( "neutral", var_0, var_1, ( 0.0, 0.0, 32.0 ) );
    level.sabbomb maps\mp\gametypes\_gameobjects::allowcarry( "any" );
    level.sabbomb maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_bomb" );
    level.sabbomb maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_bomb" );
    level.sabbomb maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_bomb" );
    level.sabbomb maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_bomb" );
    level.sabbomb maps\mp\gametypes\_gameobjects::setcarryicon( "hud_suitcase_bomb" );
    level.sabbomb maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    level.sabbomb.objidpingenemy = 1;
    level.sabbomb.onpickup = ::onpickup;
    level.sabbomb.ondrop = ::ondrop;
    level.sabbomb.allowweapons = 1;
    level.sabbomb.objpoints["allies"].archived = 1;
    level.sabbomb.objpoints["axis"].archived = 1;
    level.sabbomb.autoresettime = 60.0;

    if ( !isdefined( getent( "sab_bomb_axis", "targetname" ) ) )
    {
        common_scripts\utility::error( "No sab_bomb_axis trigger found in map." );
        return;
    }

    if ( !isdefined( getent( "sab_bomb_allies", "targetname" ) ) )
    {
        common_scripts\utility::error( "No sab_bomb_allies trigger found in map." );
        return;
    }

    if ( game["switchedsides"] )
    {
        level.bombzones["allies"] = createbombzone( "allies", getent( "sab_bomb_axis", "targetname" ) );
        level.bombzones["axis"] = createbombzone( "axis", getent( "sab_bomb_allies", "targetname" ) );
    }
    else
    {
        level.bombzones["allies"] = createbombzone( "allies", getent( "sab_bomb_allies", "targetname" ) );
        level.bombzones["axis"] = createbombzone( "axis", getent( "sab_bomb_axis", "targetname" ) );
    }

    if ( level.scoremode )
        level thread scorethread();

    if ( maps\mp\_utility::inovertime() )
        level thread overtimethread();
}

getclosestsite()
{
    if ( distance2d( self.origin, level.bombzones["allies"].trigger.origin ) < distance2d( self.origin, level.bombzones["axis"].trigger.origin ) )
        return "allies";
    else
        return "axis";
}

distancetosite( var_0 )
{
    return distance2d( self.origin, level.bombzones[var_0].trigger.origin );
}

scorethread()
{
    level.bombdistance = distance2d( getent( "sab_bomb_axis", "targetname" ) getorigin(), getent( "sab_bomb_allies", "targetname" ) getorigin() );
    var_0 = level.bombdistance / 2 - 384;
    var_1 = level.sabbomb.trigger;

    if ( var_0 > var_1 distancetosite( "allies" ) || var_0 > var_1 distancetosite( "axis" ) )
        var_0 = var_1 distancetosite( var_1 getclosestsite() ) - 128;

    var_2 = "";

    for (;;)
    {
        if ( isdefined( level.sabbomb.carrier ) )
            var_1 = level.sabbomb.carrier;
        else
            var_1 = level.sabbomb.trigger;

        var_3 = var_2;
        var_2 = "none";

        if ( var_1 distancetosite( "allies" ) < var_0 )
            var_2 = level.bombzones["allies"] maps\mp\gametypes\_gameobjects::getownerteam();
        else if ( var_1 distancetosite( "axis" ) < var_0 )
            var_2 = level.bombzones["axis"] maps\mp\gametypes\_gameobjects::getownerteam();
        else if ( var_1 distancetosite( "allies" ) > level.bombdistance && var_1 getclosestsite() != "allies" )
            var_2 = level.bombzones["axis"] maps\mp\gametypes\_gameobjects::getownerteam();
        else if ( var_1 distancetosite( "axis" ) > level.bombdistance && var_1 getclosestsite() != "axis" )
            var_2 = level.bombzones["allies"] maps\mp\gametypes\_gameobjects::getownerteam();

        if ( var_2 != "none" )
        {
            if ( !level.bombplanted || !maps\mp\_utility::getwatcheddvar( "scorelimit" ) || level.bombplanted && maps\mp\gametypes\_gamescore::_getteamscore( level.otherteam[var_2] ) < maps\mp\_utility::getwatcheddvar( "scorelimit" ) - 1 )
            {
                maps\mp\gametypes\_gamescore::_setteamscore( level.otherteam[var_2], maps\mp\gametypes\_gamescore::_getteamscore( level.otherteam[var_2] ) + 1 );
                maps\mp\gametypes\_gamescore::updateteamscore( level.otherteam[var_2] );
            }
        }

        if ( var_2 != var_3 && !level.bombexploded )
            setdvar( "ui_danger_team", var_2 );

        wait 2.5;
    }
}

createbombzone( var_0, var_1 )
{
    var_2 = getentarray( var_1.target, "targetname" );
    var_3 = maps\mp\gametypes\_gameobjects::createuseobject( var_0, var_1, var_2, ( 0.0, 0.0, 64.0 ) );
    var_3 resetbombsite();
    var_3.onuse = ::onuse;
    var_3.onbeginuse = ::onbeginuse;
    var_3.onenduse = ::onenduse;
    var_3.oncantuse = ::oncantuse;
    var_3.useweapon = "briefcase_bomb_mp";

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( isdefined( var_2[var_4].script_exploder ) )
        {
            var_3.exploderindex = var_2[var_4].script_exploder;
            var_2[var_4] thread setupkillcament();
            break;
        }
    }

    return var_3;
}

setupkillcament()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = self.angles;
    var_0 rotateyaw( -45, 0.05 );
    wait 0.05;
    var_1 = self.origin + ( 0.0, 0.0, 5.0 );
    var_2 = self.origin + anglestoforward( var_0.angles ) * 100 + ( 0.0, 0.0, 128.0 );
    var_3 = bullettrace( var_1, var_2, 0, self );
    self.killcament = spawn( "script_model", var_3["position"] );
    self.killcament setscriptmoverkillcam( "explosive" );
    var_0 delete();
}

onbeginuse( var_0 )
{
    if ( !maps\mp\gametypes\_gameobjects::isfriendlyteam( var_0.pers["team"] ) )
        var_0.isplanting = 1;
    else
        var_0.isdefusing = 1;
}

onenduse( var_0, var_1, var_2 )
{
    if ( !isalive( var_1 ) )
        return;

    var_1.isplanting = 0;
    var_1.isdefusing = 0;
}

onpickup( var_0 )
{
    level notify( "bomb_picked_up" );
    self.autoresettime = 60.0;
    level.usestartspawn = 0;
    var_1 = var_0.pers["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    var_0 playlocalsound( "mp_suitcase_pickup" );
    var_0 maps\mp\_utility::leaderdialogonplayer( "obj_destroy", "bomb" );
    var_3[0] = var_0;
    maps\mp\_utility::leaderdialog( "bomb_taken", var_1, "bomb", var_3 );

    if ( !level.splitscreen )
    {
        maps\mp\_utility::leaderdialog( "bomb_lost", var_2, "bomb" );
        maps\mp\_utility::leaderdialog( "obj_defend", var_2, "bomb" );
    }

    var_0.isbombcarrier = 1;

    if ( isdefined( level.sab_loadouts ) && isdefined( level.sab_loadouts[var_1] ) )
        var_0 thread applybombcarrierclass();

    if ( var_1 == maps\mp\gametypes\_gameobjects::getownerteam() )
        maps\mp\_utility::playsoundonplayers( game["bomb_recovered_sound"], var_1 );
    else
        maps\mp\_utility::playsoundonplayers( game["bomb_recovered_sound"] );

    maps\mp\gametypes\_gameobjects::setownerteam( var_1 );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_target" );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_kill" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_escort" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_escort" );
    level.bombzones[var_1] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    level.bombzones[var_2] maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    var_0 maps\mp\_utility::incplayerstat( "bombscarried", 1 );
    var_0 thread maps\mp\_matchdata::loggameevent( "pickup", var_0.origin );
}

ondrop( var_0 )
{
    if ( level.bombplanted )
        return;

    if ( isdefined( var_0 ) )
        maps\mp\_utility::printonteamarg( &"MP_EXPLOSIVES_DROPPED_BY", maps\mp\gametypes\_gameobjects::getownerteam(), var_0 );

    maps\mp\_utility::playsoundonplayers( game["bomb_dropped_sound"], maps\mp\gametypes\_gameobjects::getownerteam() );
    thread abandonmentthink( 0.0 );
    return;
}

abandonmentthink( var_0 )
{
    level endon( "bomb_picked_up" );
    wait(var_0);

    if ( isdefined( self.carrier ) )
        return;

    if ( maps\mp\gametypes\_gameobjects::getownerteam() == "allies" )
        var_1 = "axis";
    else
        var_1 = "allies";

    maps\mp\_utility::playsoundonplayers( game["bomb_dropped_sound"], var_1 );
    maps\mp\gametypes\_gameobjects::setownerteam( "neutral" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_bomb" );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_bomb" );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_bomb" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_bomb" );
    level.bombzones["allies"] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    level.bombzones["axis"] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
}

onuse( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = level.otherteam[var_1];

    if ( !maps\mp\gametypes\_gameobjects::isfriendlyteam( var_0.pers["team"] ) )
    {
        var_0 notify( "bomb_planted" );
        var_0 notify( "objective", "plant" );
        var_0 playsound( "mp_bomb_plant" );
        level thread maps\mp\_utility::teamplayercardsplash( "callout_bombplanted", var_0 );
        maps\mp\_utility::leaderdialog( "bomb_planted" );
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "plant", maps\mp\gametypes\_rank::getscoreinfovalue( "plant" ) );
        var_0 thread maps\mp\gametypes\_rank::giverankxp( "plant" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "plant", var_0 );
        var_0 maps\mp\_utility::incplayerstat( "bombsplanted", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "plant", var_0.origin );
        var_0.bombplantedtime = gettime();
        var_0 maps\mp\_utility::incpersstat( "plants", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "plants", var_0.pers["plants"] );
        level thread bombplanted( self, var_0.pers["team"] );
        level.bombowner = var_0;

        if ( isdefined( level.sab_loadouts ) && isdefined( level.sab_loadouts[var_1] ) )
            var_0 thread removebombcarrierclass();

        level.sabbomb.autoresettime = undefined;
        level.sabbomb maps\mp\gametypes\_gameobjects::allowcarry( "none" );
        level.sabbomb maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
        level.sabbomb maps\mp\gametypes\_gameobjects::setdropped();
        self.useweapon = "briefcase_bomb_defuse_mp";
        setupfordefusing();
    }
    else
    {
        var_0 notify( "bomb_defused" );
        var_0 notify( "objective", "defuse" );
        maps\mp\_utility::leaderdialog( "bomb_defused" );
        level thread maps\mp\_utility::teamplayercardsplash( "callout_bombdefused", var_0 );

        if ( isdefined( level.bombowner ) && level.bombowner.bombplantedtime + 3000 + level.defusetime * 1000 > gettime() && maps\mp\_utility::isreallyalive( level.bombowner ) )
            var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "ninja_defuse", maps\mp\gametypes\_rank::getscoreinfovalue( "defuse" ) );
        else
            var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "defuse", maps\mp\gametypes\_rank::getscoreinfovalue( "defuse" ) );

        var_0 thread maps\mp\gametypes\_rank::giverankxp( "defuse" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "defuse", var_0 );
        var_0 maps\mp\_utility::incpersstat( "defuses", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "defuses", var_0.pers["defuses"] );
        var_0 thread maps\mp\_matchdata::loggameevent( "defuse", var_0.origin );

        if ( maps\mp\_utility::inovertime() )
        {
            level.finalkillcam_winner = var_1;
            thread maps\mp\gametypes\_gamelogic::endgame( var_1, game["strings"]["target_destroyed"] );
            return;
        }

        level thread bombdefused( self );
        resetbombsite();
        level.sabbomb maps\mp\gametypes\_gameobjects::allowcarry( "any" );
        level.sabbomb maps\mp\gametypes\_gameobjects::setpickedup( var_0 );
    }
}

applybombcarrierclass()
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

    self.pers["gamemodeLoadout"] = level.sab_loadouts[self.team];
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
}

removebombcarrierclass()
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
    var_0 iprintlnbold( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

bombplanted( var_0, var_1 )
{
    level endon( "overtime" );
    maps\mp\gametypes\_gamelogic::pausetimer();
    level.bombplanted = 1;
    level.timelimitoverride = 1;
    level.scorelimitoverride = 1;
    setdvar( "ui_bomb_timer", 1 );
    setgameendtime( int( gettime() + level.bombtimer * 1000 ) );
    var_0.visuals[0] thread maps\mp\gametypes\_gamelogic::playtickingsound();
    var_2 = gettime();
    bombtimerwait();
    setdvar( "ui_bomb_timer", 0 );
    var_0.visuals[0] maps\mp\gametypes\_gamelogic::stoptickingsound();

    if ( !level.bombplanted )
    {
        if ( level.hotpotato )
        {
            var_3 = ( gettime() - var_2 ) / 1000;
            level.bombtimer -= var_3;
        }

        return;
    }

    var_4 = level.sabbomb.visuals[0].origin;
    level.bombexploded = 1;
    setdvar( "ui_danger_team", "BombExploded" );

    if ( isdefined( level.bombowner ) )
    {
        var_0.visuals[0] radiusdamage( var_4, 512, 200, 20, level.bombowner, "MOD_EXPLOSIVE", "bomb_site_mp" );
        level.bombowner maps\mp\_utility::incpersstat( "destructions", 1 );
        level.bombowner maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", level.bombowner.pers["destructions"] );
    }
    else
        var_0.visuals[0] radiusdamage( var_4, 512, 200, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

    var_5 = randomfloat( 360 );
    var_6 = spawnfx( level._effect["bombexplosion"], var_4 + ( 0.0, 0.0, 50.0 ), ( 0.0, 0.0, 1.0 ), ( cos( var_5 ), sin( var_5 ), 0 ) );
    triggerfx( var_6 );
    playrumbleonposition( "grenade_rumble", var_4 );
    earthquake( 0.75, 2.0, var_4, 2000 );
    thread maps\mp\_utility::playsoundinspace( "exp_suitcase_bomb_main", var_4 );

    if ( isdefined( var_0.exploderindex ) )
        common_scripts\utility::exploder( var_0.exploderindex );

    level.sabbomb maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    level.bombzones["allies"] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    level.bombzones["axis"] maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    setgameendtime( 0 );
    level.scorelimitoverride = 1;

    if ( level.scoremode )
        maps\mp\gametypes\_gamescore::_setteamscore( var_1, int( max( maps\mp\_utility::getwatcheddvar( "scorelimit" ), maps\mp\gametypes\_gamescore::_getteamscore( level.otherteam[var_1] ) + 1 ) ) );
    else
        maps\mp\gametypes\_gamescore::_setteamscore( var_1, 1 );

    maps\mp\gametypes\_gamescore::updateteamscore( var_1 );

    if ( isdefined( level.bombowner ) )
    {
        level.bombowner thread maps\mp\gametypes\_rank::giverankxp( "destroy" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "destroy", level.bombowner );
        level thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_objective", level.bombowner );
    }

    wait 3;
    level.finalkillcam_winner = var_1;
    thread maps\mp\gametypes\_gamelogic::endgame( var_1, game["strings"]["target_destroyed"] );
}

bombtimerwait()
{
    level endon( "bomb_defused" );
    level endon( "overtime_ended" );
    var_0 = level.bombtimer * 1000 + gettime();
    setdvar( "ui_bomb_timer_endtime", var_0 );
    level thread handlehostmigration( var_0 );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithgameendtimeupdate( level.bombtimer );
}

handlehostmigration( var_0 )
{
    level endon( "bomb_defused" );
    level endon( "overtime_ended" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    var_1 = maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

    if ( var_1 > 0 )
        setdvar( "ui_bomb_timer_endtime", var_0 + var_1 );
}

givelastonteamwarning()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::waittillrecoveredhealth( 3 );
    var_0 = maps\mp\_utility::getotherteam( self.pers["team"] );
    level thread maps\mp\_utility::teamplayercardsplash( "callout_lastteammemberalive", self, self.pers["team"] );
    level thread maps\mp\_utility::teamplayercardsplash( "callout_lastenemyalive", self, var_0 );
    level notify( "last_alive", self );
}

ontimelimit()
{
    if ( level.bombexploded )
        return;

    if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
    {
        level.finalkillcam_winner = "axis";
        thread maps\mp\gametypes\_gamelogic::endgame( "axis", game["strings"]["time_limit_reached"] );
    }
    else if ( game["teamScores"]["axis"] < game["teamScores"]["allies"] )
    {
        level.finalkillcam_winner = "allies";
        thread maps\mp\gametypes\_gamelogic::endgame( "allies", game["strings"]["time_limit_reached"] );
    }
    else if ( game["teamScores"]["axis"] == game["teamScores"]["allies"] )
    {
        level.finalkillcam_winner = "none";

        if ( maps\mp\_utility::inovertime() )
            thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["time_limit_reached"] );
        else
            thread maps\mp\gametypes\_gamelogic::endgame( "overtime", game["strings"]["time_limit_reached"] );
    }
}

overtimethread( var_0 )
{
    level endon( "game_ended" );
    level.inovertime = 1;
    wait 5.0;
    level.disablespawning = 1;
}

bombdistancethread()
{
    level endon( "game_ended" );

    if ( common_scripts\utility::cointoss() )
        level.dangerteam = "allies";
    else
        level.dangerteam = "axis";

    for (;;)
    {
        if ( isdefined( level.sabbomb.carrier ) )
            var_0 = level.sabbomb.carrier;
        else
            var_0 = level.sabbomb.visuals[0];

        if ( distance( var_0.origin, level.bombzones[maps\mp\_utility::getotherteam( level.dangerteam )].visuals[0].origin ) < distance( var_0.origin, level.bombzones[level.dangerteam].visuals[0].origin ) )
            level.dangerteam = maps\mp\_utility::getotherteam( level.dangerteam );

        wait 0.05;
    }
}

resetbombsite()
{
    maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
    maps\mp\gametypes\_gameobjects::setusetime( level.planttime );
    maps\mp\gametypes\_gameobjects::setusetext( &"MP_PLANTING_EXPLOSIVE" );
    maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::setkeyobject( level.sabbomb );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defend" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_target" );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_target" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    self.useweapon = "briefcase_bomb_mp";
}

setupfordefusing()
{
    maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
    maps\mp\gametypes\_gameobjects::setusetime( level.defusetime );
    maps\mp\gametypes\_gameobjects::setusetext( &"MP_DEFUSING_EXPLOSIVE" );
    maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::setkeyobject( undefined );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defuse" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defuse" );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_defend" );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_defend" );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
}

bombdefused( var_0 )
{
    setdvar( "ui_bomb_timer", 0 );
    maps\mp\gametypes\_gamelogic::resumetimer();
    level.bombplanted = 0;
    level.timelimitoverride = 0;
    level.scorelimitoverride = 0;
    level notify( "bomb_defused" );
}

ononeleftevent( var_0 )
{
    if ( level.bombexploded )
        return;

    var_1 = maps\mp\_utility::getlastlivingplayer( var_0 );
    var_1 thread givelastonteamwarning();
}

onnormaldeath( var_0, var_1, var_2, var_0 )
{
    if ( var_1.isplanting )
    {
        thread maps\mp\_matchdata::logkillevent( var_0, "planting" );
        var_2 maps\mp\_utility::incpersstat( "defends", 1 );
        var_2 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_2.pers["defends"] );
    }
    else if ( var_1.isbombcarrier )
    {
        var_2 maps\mp\_utility::incplayerstat( "bombcarrierkills", 1 );
        thread maps\mp\_matchdata::logkillevent( var_0, "carrying" );
    }
    else if ( var_1.isdefusing )
        thread maps\mp\_matchdata::logkillevent( var_0, "defusing" );

    if ( var_2.isbombcarrier )
        var_2 maps\mp\_utility::incplayerstat( "killsasbombcarrier", 1 );
}

initgametypeawards()
{
    maps\mp\_awards::initstataward( "targetsdestroyed", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "bombsplanted", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "bombsdefused", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "bombcarrierkills", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "bombscarried", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "killsasbombcarrier", 0, maps\mp\_awards::highestwins );
}

setspecialloadouts()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
        level.sab_loadouts["axis"] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 5 );

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 5, "class", "inUse" ) )
        level.sab_loadouts["allies"] = maps\mp\_utility::getmatchrulesspecialclass( "allies", 5 );
}
