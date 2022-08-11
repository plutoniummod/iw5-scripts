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
        maps\mp\_utility::registerroundswitchdvar( level.gametype, 1, 0, 9 );
        maps\mp\_utility::registertimelimitdvar( level.gametype, 3 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 3 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 2 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    maps\mp\_utility::setovertimelimitdvar( 3 );
    level.objectivebased = 1;
    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.ondeadevent = ::ondeadevent;
    level.ontimelimit = ::ontimelimit;
    level.onnormaldeath = ::onnormaldeath;
    level.initgametypeawards = ::initgametypeawards;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    level.dd = 1;
    level.bombsplanted = 0;
    level.ddbombmodel = [] setbombtimerdvar();
    makedvarserverinfo( "ui_bombtimer_a", -1 );
    makedvarserverinfo( "ui_bombtimer_b", -1 );
    game["dialog"]["gametype"] = "demolition";

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
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    var_0 = getmatchrulesdata( "demData", "roundSwitch" );
    setdynamicdvar( "scr_dd_roundswitch", var_0 );
    maps\mp\_utility::registerroundswitchdvar( "dd", var_0, 0, 9 );
    setdynamicdvar( "scr_dd_bombtimer", getmatchrulesdata( "demData", "bombTimer" ) );
    setdynamicdvar( "scr_dd_planttime", getmatchrulesdata( "demData", "plantTime" ) );
    setdynamicdvar( "scr_dd_defusetime", getmatchrulesdata( "demData", "defuseTime" ) );
    setdynamicdvar( "scr_dd_addtime", getmatchrulesdata( "demData", "extraTime" ) );
    setdynamicdvar( "scr_dd_roundlimit", 3 );
    maps\mp\_utility::registerroundlimitdvar( "dd", 3 );
    setdynamicdvar( "scr_dd_winlimit", 2 );
    maps\mp\_utility::registerwinlimitdvar( "dd", 2 );
    setdynamicdvar( "scr_dd_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "dd", 0 );
    setdynamicdvar( "scr_dd_promode", 0 );
}

onprecachegametype()
{
    game["bomb_dropped_sound"] = "mp_war_objective_lost";
    game["bomb_recovered_sound"] = "mp_war_objective_taken";
    precacheshader( "waypoint_bomb" );
    precacheshader( "hud_suitcase_bomb" );
    precacheshader( "waypoint_target" );
    precacheshader( "waypoint_target_a" );
    precacheshader( "waypoint_target_b" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_defend_a" );
    precacheshader( "waypoint_defend_b" );
    precacheshader( "waypoint_defuse_a" );
    precacheshader( "waypoint_defuse_b" );
    precacheshader( "waypoint_target" );
    precacheshader( "waypoint_target_a" );
    precacheshader( "waypoint_target_b" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_defend_a" );
    precacheshader( "waypoint_defend_b" );
    precacheshader( "waypoint_defuse" );
    precacheshader( "waypoint_defuse_a" );
    precacheshader( "waypoint_defuse_b" );
    precachestring( &"MP_EXPLOSIVES_RECOVERED_BY" );
    precachestring( &"MP_EXPLOSIVES_DROPPED_BY" );
    precachestring( &"MP_EXPLOSIVES_PLANTED_BY" );
    precachestring( &"MP_EXPLOSIVES_DEFUSED_BY" );
    precachestring( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    precachestring( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    precachestring( &"MP_CANT_PLANT_WITHOUT_BOMB" );
    precachestring( &"MP_PLANTING_EXPLOSIVE" );
    precachestring( &"MP_DEFUSING_EXPLOSIVE" );
    precachestring( &"MP_BOMB_A_TIMER" );
    precachestring( &"MP_BOMB_B_TIMER" );
    precachestring( &"MP_BOMBSITE_IN_USE" );
}

onstartgametype()
{
    if ( game["roundsPlayed"] == 2 )
    {
        game["status"] = "overtime";
        setdvar( "ui_overtime", 1 );
    }

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    level.usestartspawn = 1;
    setclientnamemode( "manual_change" );
    game["strings"]["target_destroyed"] = &"MP_TARGET_DESTROYED";
    game["strings"]["bomb_defused"] = &"MP_BOMB_DEFUSED";

    if ( maps\mp\_utility::inovertime() )
        game["dialog"]["defense_obj"] = "obj_destroy";

    precachestring( game["strings"]["target_destroyed"] );
    precachestring( game["strings"]["bomb_defused"] );
    level._effect["bombexplosion"] = loadfx( "explosions/tanker_explosion" );
    maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_DD_ATTACKER" );
    maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_DD_DEFENDER" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_DD_ATTACKER" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_DD_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_DD_ATTACKER_SCORE" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_DD_DEFENDER_SCORE" );
    }

    if ( maps\mp\_utility::inovertime() )
    {
        maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_DD_OVERTIME_HINT" );
        maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_DD_OVERTIME_HINT" );
    }
    else
    {
        maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_DD_ATTACKER_HINT" );
        maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_DD_DEFENDER_HINT" );
    }

    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["defenders"], "mp_dd_spawn_defender" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["defenders"], "mp_dd_spawn_defender_a", 1 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["defenders"], "mp_dd_spawn_defender_b", 1 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_dd_spawn_defender_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["attackers"], "mp_dd_spawn_attacker" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["attackers"], "mp_dd_spawn_attacker_a", 1 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( game["attackers"], "mp_dd_spawn_attacker_b", 1 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_dd_spawn_attacker_start" );
    level.spawn_defenders = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_defender" );
    level.spawn_defenders_a = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_defender_a" );
    level.spawn_defenders_a = common_scripts\utility::array_combine( level.spawn_defenders, level.spawn_defenders_a );
    level.spawn_defenders_b = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_defender_b" );
    level.spawn_defenders_b = common_scripts\utility::array_combine( level.spawn_defenders, level.spawn_defenders_b );
    level.spawn_attackers = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker" );
    level.spawn_attackers_a = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker_a" );
    level.spawn_attackers_a = common_scripts\utility::array_combine( level.spawn_attackers, level.spawn_attackers_a );
    level.spawn_attackers_b = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker_b" );
    level.spawn_attackers_b = common_scripts\utility::array_combine( level.spawn_attackers, level.spawn_attackers_b );
    level.spawn_defenders_start = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_defender_start" );
    level.spawn_attackers_start = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker_start" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    level.aplanted = 0;
    level.bplanted = 0;
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "win", 2 );
    maps\mp\gametypes\_rank::registerscoreinfo( "loss", 1 );
    maps\mp\gametypes\_rank::registerscoreinfo( "tie", 1.5 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 20 );
    maps\mp\gametypes\_rank::registerscoreinfo( "plant", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defuse", 100 );
    thread updategametypedvars();
    thread waittoprocess();
    var_2 = maps\mp\_utility::getwatcheddvar( "winlimit" );
    var_3[0] = "dd";
    var_3[1] = "dd_bombzone";
    var_3[2] = "blocker";
    maps\mp\gametypes\_gameobjects::main( var_3 );
    thread bombs();
}

waittoprocess()
{
    level endon( "game_end" );

    for (;;)
    {
        if ( level.ingraceperiod == 0 )
            break;

        wait 0.05;
    }

    level.usestartspawn = 0;
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( level.usestartspawn )
    {
        if ( var_0 == game["attackers"] )
            var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( level.spawn_attackers_start );
        else
            var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( level.spawn_defenders_start );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( maps\mp\_utility::inovertime() )
            var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        else if ( !level.aplanted && !level.bplanted )
            var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        else if ( level.aplanted && !level.bplanted )
            var_2 = level.spawn_attackers_a;
        else if ( level.bplanted && !level.aplanted )
            var_2 = level.spawn_attackers_b;
        else
            var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );

        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_2 );
    }
    else
    {
        if ( maps\mp\_utility::inovertime() )
            var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        else if ( !level.aplanted && !level.bplanted )
            var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );
        else if ( level.aplanted && !level.bplanted )
            var_2 = level.spawn_defenders_a;
        else if ( level.bplanted && !level.aplanted )
            var_2 = level.spawn_defenders_b;
        else
            var_2 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( var_0 );

        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_2 );
    }

    return var_1;
}

onspawnplayer()
{
    if ( maps\mp\_utility::inovertime() || self.pers["team"] == game["attackers"] )
    {
        self.isplanting = 0;
        self.isdefusing = 0;
        self.isbombcarrier = 1;

        if ( level.splitscreen )
        {
            self.carryicon = maps\mp\gametypes\_hud_util::createicon( "hud_suitcase_bomb", 33, 33 );
            self.carryicon maps\mp\gametypes\_hud_util::setpoint( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -78 );
            self.carryicon.alpha = 0.75;
        }
        else
        {
            self.carryicon = maps\mp\gametypes\_hud_util::createicon( "hud_suitcase_bomb", 50, 50 );
            self.carryicon maps\mp\gametypes\_hud_util::setpoint( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -65 );
            self.carryicon.alpha = 0.75;
        }

        self.carryicon.hidewheninmenu = 1;
        thread hidecarryiconongameend();
    }
    else
    {
        self.isplanting = 0;
        self.isdefusing = 0;
        self.isbombcarrier = 0;

        if ( isdefined( self.carryicon ) )
            self.carryicon destroy();
    }

    level notify( "spawned_player" );
}

hidecarryiconongameend()
{
    self endon( "disconnect" );
    level waittill( "game_ended" );

    if ( isdefined( self.carryicon ) )
        self.carryicon.alpha = 0;
}

dd_endgame( var_0, var_1 )
{
    if ( var_0 == "tie" )
        level.finalkillcam_winner = "none";
    else
        level.finalkillcam_winner = var_0;

    thread maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
}

ondeadevent( var_0 )
{
    if ( level.bombexploded || level.bombdefused )
        return;

    if ( var_0 == "all" )
    {
        if ( level.bombplanted )
            dd_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
        else
            dd_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level.bombplanted )
            return;

        level thread dd_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread dd_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
}

onnormaldeath( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill" );
    var_4 = var_0.team;

    if ( game["state"] == "postgame" && ( var_0.team == game["defenders"] || !level.bombplanted ) )
        var_1.finalkill = 1;

    if ( var_0.isplanting )
    {
        thread maps\mp\_matchdata::logkillevent( var_2, "planting" );
        var_1 maps\mp\_utility::incpersstat( "defends", 1 );
        var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }
    else if ( var_0.isdefusing )
    {
        thread maps\mp\_matchdata::logkillevent( var_2, "defusing" );
        var_1 maps\mp\_utility::incpersstat( "defends", 1 );
        var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }
}

ontimelimit()
{
    if ( maps\mp\_utility::inovertime() )
        dd_endgame( "tie", game["strings"]["time_limit_reached"] );
    else
        dd_endgame( game["defenders"], game["strings"]["time_limit_reached"] );
}

updategametypedvars()
{
    level.planttime = maps\mp\_utility::dvarfloatvalue( "planttime", 5, 0, 20 );
    level.defusetime = maps\mp\_utility::dvarfloatvalue( "defusetime", 5, 0, 20 );
    level.bombtimer = maps\mp\_utility::dvarintvalue( "bombtimer", 45, 1, 300 );
    level.ddtimetoadd = maps\mp\_utility::dvarfloatvalue( "addtime", 2, 0, 5 );
}

verifybombzones( var_0 )
{
    var_1 = "";

    if ( var_0.size != 3 )
    {
        var_2 = 0;
        var_3 = 0;
        var_4 = 0;

        foreach ( var_6 in var_0 )
        {
            if ( issubstr( tolower( var_6.script_label ), "a" ) )
            {
                var_2 = 1;
                continue;
            }

            if ( issubstr( tolower( var_6.script_label ), "b" ) )
            {
                var_3 = 1;
                continue;
            }

            if ( issubstr( tolower( var_6.script_label ), "c" ) )
                var_4 = 1;
        }

        if ( !var_2 )
            var_1 += " A ";

        if ( !var_3 )
            var_1 += " B ";

        if ( !var_4 )
            var_1 += " C ";
    }

    if ( var_1 != "" )
        return;
}

bombs()
{
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    level.bombzones = [];
    var_0 = getentarray( "dd_bombzone", "targetname" );
    verifybombzones( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_3 = getentarray( var_0[var_1].target, "targetname" );
        var_4 = var_0[var_1].script_label;
        var_5 = getent( "dd_bombzone_clip" + var_4, "targetname" );

        if ( maps\mp\_utility::inovertime() )
        {
            if ( var_4 == "_a" || var_4 == "_b" )
            {
                var_2 delete();
                var_3[0] delete();
                var_5 delete();
                continue;
            }

            var_6 = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", var_2, var_3, ( 0.0, 0.0, 64.0 ) );
            var_6 maps\mp\gametypes\_gameobjects::allowuse( "any" );
        }
        else
        {
            if ( var_4 == "_c" )
            {
                var_2 delete();
                var_3[0] delete();
                var_5 delete();
                continue;
            }

            var_6 = maps\mp\gametypes\_gameobjects::createuseobject( game["defenders"], var_2, var_3, ( 0.0, 0.0, 64.0 ) );
            var_6 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
        }

        var_6 maps\mp\gametypes\_gameobjects::setusetime( level.planttime );
        var_6 maps\mp\gametypes\_gameobjects::setusetext( &"MP_PLANTING_EXPLOSIVE" );
        var_6 maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
        var_6 maps\mp\gametypes\_gameobjects::setkeyobject( level.ddbomb );

        if ( maps\mp\_utility::inovertime() )
            var_4 = "_a";

        var_6.label = var_4;
        var_6.index = var_1;

        if ( maps\mp\_utility::inovertime() )
        {
            var_6 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_target" );
            var_6 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_target" );
            var_6 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_target" );
            var_6 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_target" );
        }
        else
        {
            var_6 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defend" + var_4 );
            var_6 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" + var_4 );
            var_6 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_target" + var_4 );
            var_6 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_target" + var_4 );
        }

        var_6 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_6.onbeginuse = ::onbeginuse;
        var_6.onenduse = ::onenduse;
        var_6.onuse = ::onuseobject;
        var_6.oncantuse = ::oncantuse;
        var_6.useweapon = "briefcase_bomb_mp";
        var_6.bombplanted = 0;
        var_6.visuals[0] thread setupkillcament();

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            if ( isdefined( var_3[var_7].script_exploder ) )
            {
                var_6.exploderindex = var_3[var_7].script_exploder;
                break;
            }
        }

        level.bombzones[level.bombzones.size] = var_6;
        var_6.bombdefusetrig = getent( var_3[0].target, "targetname" );
        var_6.bombdefusetrig.origin += ( 0.0, 0.0, -10000.0 );
        var_6.bombdefusetrig.label = var_4;
    }

    for ( var_1 = 0; var_1 < level.bombzones.size; var_1++ )
    {
        var_8 = [];

        for ( var_9 = 0; var_9 < level.bombzones.size; var_9++ )
        {
            if ( var_9 != var_1 )
                var_8[var_8.size] = level.bombzones[var_9];
        }

        level.bombzones[var_1].otherbombzones = var_8;
    }
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

onuseobject( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = level.otherteam[var_1];

    if ( maps\mp\_utility::inovertime() && self.bombplanted == 0 || !maps\mp\_utility::inovertime() && !maps\mp\gametypes\_gameobjects::isfriendlyteam( var_0.pers["team"] ) )
    {
        self.bombplanted = 1;
        var_0 notify( "bomb_planted" );
        var_0 playsound( "mp_bomb_plant" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_bombplanted", var_0 );
        var_0 notify( "objective", "plant" );
        maps\mp\_utility::leaderdialog( "bomb_planted" );
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "plant", maps\mp\gametypes\_rank::getscoreinfovalue( "plant" ) );
        var_0 thread maps\mp\gametypes\_rank::giverankxp( "plant" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "plant", var_0 );
        var_0 maps\mp\_utility::incplayerstat( "bombsplanted", 1 );
        var_0 thread maps\mp\_matchdata::loggameevent( "plant", var_0.origin );
        var_0.bombplantedtime = gettime();
        var_0 maps\mp\_utility::incpersstat( "plants", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "plants", var_0.pers["plants"] );
        level thread bombplanted( self, var_0 );
        level.bombowner = var_0;
        self.useweapon = "briefcase_bomb_defuse_mp";
    }
    else
    {
        self.bombplanted = 0;
        thread bombhandler( var_0, "defused" );
        var_0 notify( "objective", "defuse" );
    }
}

resetbombzone()
{
    if ( maps\mp\_utility::inovertime() )
    {
        maps\mp\gametypes\_gameobjects::setownerteam( "neutral" );
        maps\mp\gametypes\_gameobjects::allowuse( "any" );
        var_0 = "waypoint_target";
        var_1 = "waypoint_target";
    }
    else
    {
        maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
        var_0 = "waypoint_defend" + self.label;
        var_1 = "waypoint_target" + self.label;
    }

    maps\mp\gametypes\_gameobjects::setusetime( level.planttime );
    maps\mp\gametypes\_gameobjects::setusetext( &"MP_PLANTING_EXPLOSIVE" );
    maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::setkeyobject( level.ddbomb );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", var_0 );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", var_0 );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", var_1 );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", var_1 );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    self.useweapon = "briefcase_bomb_mp";
}

setupfordefusing()
{
    if ( maps\mp\_utility::inovertime() )
    {
        var_0 = "waypoint_defuse";
        var_1 = "waypoint_defend";
    }
    else
    {
        var_0 = "waypoint_defuse" + self.label;
        var_1 = "waypoint_defend" + self.label;
    }

    maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
    maps\mp\gametypes\_gameobjects::setusetime( level.defusetime );
    maps\mp\gametypes\_gameobjects::setusetext( &"MP_DEFUSING_EXPLOSIVE" );
    maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::setkeyobject( undefined );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", var_0 );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", var_0 );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", var_1 );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", var_1 );
    maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
}

onbeginuse( var_0 )
{
    if ( maps\mp\_utility::inovertime() && self.bombplanted == 1 || !maps\mp\_utility::inovertime() && maps\mp\gametypes\_gameobjects::isfriendlyteam( var_0.pers["team"] ) )
    {
        var_0 playsound( "mp_bomb_defuse" );
        var_0.isdefusing = 1;
        var_1 = 9000000;
        var_2 = undefined;

        if ( isdefined( level.ddbombmodel ) )
        {
            foreach ( var_4 in level.ddbombmodel )
            {
                if ( !isdefined( var_4 ) )
                    continue;

                var_5 = distancesquared( var_0.origin, var_4.origin );

                if ( var_5 < var_1 )
                {
                    var_1 = var_5;
                    var_2 = var_4;
                }
            }

            var_0.defusing = var_2;
            var_2 hide();
            return;
        }
    }
    else
        var_0.isplanting = 1;
}

onenduse( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( var_1.isdefusing )
    {
        if ( isdefined( var_1.defusing ) && !var_2 )
            var_1.defusing show();
    }

    if ( isalive( var_1 ) )
    {
        var_1.isdefusing = 0;
        var_1.isplanting = 0;
    }
}

oncantuse( var_0 )
{
    var_0 iprintlnbold( &"MP_BOMBSITE_IN_USE" );
}

onreset()
{

}

bombplanted( var_0, var_1 )
{
    var_0 endon( "defused" );
    var_2 = var_1.team;
    level.bombsplanted += 1;
    setbombtimerdvar();
    maps\mp\gametypes\_gamelogic::pausetimer();
    level.timepausestart = gettime();
    level.timelimitoverride = 1;
    level.bombplanted = 1;
    level.destroyedobject = var_0;

    if ( level.destroyedobject.label == "_a" )
        level.aplanted = 1;
    else
        level.bplanted = 1;

    level.destroyedobject.bombplanted = 1;
    var_0.visuals[0] thread playdemolitiontickingsound( var_0 );
    level.tickingobject = var_0.visuals[0];
    dropbombmodel( var_1, var_0.label );
    var_0.bombdefused = 0;
    var_0 maps\mp\gametypes\_gameobjects::allowuse( "none" );
    var_0 maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );

    if ( maps\mp\_utility::inovertime() )
        var_0 maps\mp\gametypes\_gameobjects::setownerteam( level.otherteam[var_1.team] );

    var_0 setupfordefusing();
    var_0 bombtimerwait( var_0 );
    var_0 thread bombhandler( var_1, "explode", var_2 );
}

bombhandler( var_0, var_1, var_2 )
{
    self.visuals[0] notify( "stopTicking" );
    level.bombsplanted -= 1;

    if ( self.label == "_a" )
        level.aplanted = 0;
    else
        level.bplanted = 0;

    restarttimer();
    setbombtimerdvar();
    setdvar( "ui_bombtimer" + self.label, -1 );

    if ( level.gameended )
        return;

    if ( var_1 == "explode" )
    {
        level notify( "bomb_exploded" + self.label );
        level.bombexploded += 1;
        var_3 = self.curorigin;
        level.ddbombmodel[self.label] delete();

        if ( isdefined( var_0 ) )
        {
            self.visuals[0] radiusdamage( var_3, 512, 200, 20, var_0, "MOD_EXPLOSIVE", "bomb_site_mp" );
            var_0 maps\mp\_utility::incplayerstat( "targetsdestroyed", 1 );
            var_0 maps\mp\_utility::incpersstat( "destructions", 1 );
            var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", var_0.pers["destructions"] );
        }
        else
            self.visuals[0] radiusdamage( var_3, 512, 200, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

        var_4 = randomfloat( 360 );
        var_5 = spawnfx( level._effect["bombexplosion"], var_3 + ( 0.0, 0.0, 50.0 ), ( 0.0, 0.0, 1.0 ), ( cos( var_4 ), sin( var_4 ), 0 ) );
        triggerfx( var_5 );
        playrumbleonposition( "grenade_rumble", var_3 );
        earthquake( 0.75, 2.0, var_3, 2000 );
        thread maps\mp\_utility::playsoundinspace( "exp_suitcase_bomb_main", var_3 );

        if ( isdefined( self.exploderindex ) )
            common_scripts\utility::exploder( self.exploderindex );

        maps\mp\gametypes\_gameobjects::disableobject();

        if ( !maps\mp\_utility::inovertime() && level.bombexploded < 2 )
        {
            foreach ( var_7 in level.players )
                var_7 thread maps\mp\gametypes\_hud_message::splashnotify( "time_added" );
        }

        wait 2;

        if ( maps\mp\_utility::inovertime() || level.bombexploded > 1 )
        {
            dd_endgame( var_2, game["strings"]["target_destroyed"] );
            return;
        }

        level thread maps\mp\_utility::teamplayercardsplash( "callout_time_added", var_0 );
        return;
    }
    else
    {
        var_0 notify( "bomb_defused" );
        self notify( "defused" );
        maps\mp\_utility::leaderdialog( "bomb_defused" );
        level thread maps\mp\_utility::teamplayercardsplash( "callout_bombdefused", var_0 );
        level thread bombdefused( self );
        resetbombzone();

        if ( isdefined( level.bombowner ) && level.bombowner.bombplantedtime + 4000 + level.defusetime * 1000 > gettime() && maps\mp\_utility::isreallyalive( level.bombowner ) )
            var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "ninja_defuse", maps\mp\gametypes\_rank::getscoreinfovalue( "defuse" ) );
        else
            var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "defuse", maps\mp\gametypes\_rank::getscoreinfovalue( "defuse" ) );

        var_0 thread maps\mp\gametypes\_rank::giverankxp( "defuse" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "defuse", var_0 );
        var_0 maps\mp\_utility::incplayerstat( "bombsdefused", 1 );
        var_0 maps\mp\_utility::incpersstat( "defuses", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "defuses", var_0.pers["defuses"] );
        var_0 thread maps\mp\_matchdata::loggameevent( "defuse", var_0.origin );
    }
}

playdemolitiontickingsound( var_0 )
{
    self endon( "death" );
    self endon( "stopTicking" );
    level endon( "game_ended" );

    for (;;)
    {
        self playsound( "ui_mp_suitcasebomb_timer" );

        if ( !isdefined( var_0.waittime ) || var_0.waittime > 10 )
            wait 1.0;
        else if ( isdefined( var_0.waittime ) && var_0.waittime > 5 )
            wait 0.5;
        else
            wait 0.25;

        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }
}

setbombtimerdvar()
{
    if ( level.bombsplanted == 1 )
        setdvar( "ui_bomb_timer", 2 );
    else if ( level.bombsplanted == 2 )
        setdvar( "ui_bomb_timer", 3 );
    else
        setdvar( "ui_bomb_timer", 0 );
}

dropbombmodel( var_0, var_1 )
{
    var_2 = bullettrace( var_0.origin + ( 0.0, 0.0, 20.0 ), var_0.origin - ( 0.0, 0.0, 2000.0 ), 0, var_0 );
    var_3 = randomfloat( 360 );
    var_4 = ( cos( var_3 ), sin( var_3 ), 0 );
    var_4 = vectornormalize( var_4 - var_2["normal"] * vectordot( var_4, var_2["normal"] ) );
    var_5 = vectortoangles( var_4 );
    level.ddbombmodel[var_1] = spawn( "script_model", var_2["position"] );
    level.ddbombmodel[var_1].angles = var_5;
    level.ddbombmodel[var_1] setmodel( "prop_suitcase_bomb" );
}

restarttimer()
{
    if ( level.bombsplanted <= 0 )
    {
        maps\mp\gametypes\_gamelogic::resumetimer();
        level.timepaused = gettime() - level.timepausestart;
        level.timelimitoverride = 0;
    }
}

bombtimerwait( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" + var_0.label );

    if ( maps\mp\_utility::inovertime() )
        var_0.waittime = level.bombtimer;
    else
        var_0.waittime = level.bombtimer;

    level thread update_ui_timers( var_0 );

    while ( var_0.waittime >= 0 )
    {
        var_0.waittime--;

        if ( var_0.waittime >= 0 )
            wait 1;

        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }
}

update_ui_timers( var_0 )
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "bomb_defused" + var_0.label );
    level endon( "bomb_exploded" + var_0.label );
    var_1 = var_0.waittime * 1000 + gettime();
    setdvar( "ui_bombtimer" + var_0.label, var_1 );
    level waittill( "host_migration_begin" );
    var_2 = maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

    if ( var_2 > 0 )
        setdvar( "ui_bombtimer" + var_0.label, var_1 + var_2 );
}

bombdefused( var_0 )
{
    level.tickingobject maps\mp\gametypes\_gamelogic::stoptickingsound();
    var_0.bombdefused = 1;
    setbombtimerdvar();
    setdvar( "ui_bombtimer" + var_0.label, -1 );
    level notify( "bomb_defused" + var_0.label );
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
