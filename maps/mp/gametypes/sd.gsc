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
        maps\mp\_utility::registerroundswitchdvar( level.gametype, 3, 0, 9 );
        maps\mp\_utility::registertimelimitdvar( level.gametype, 2.5 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 4 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 1 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.objectivebased = 1;
    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onplayerkilled = ::onplayerkilled;
    level.ondeadevent = ::ondeadevent;
    level.ononeleftevent = ::ononeleftevent;
    level.ontimelimit = ::ontimelimit;
    level.onnormaldeath = ::onnormaldeath;
    level.initgametypeawards = ::initgametypeawards;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "searchdestroy";

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
    makedvarserverinfo( "ui_bomb_timer_endtime", -1 );
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    var_0 = getmatchrulesdata( "sdData", "roundLength" );
    setdynamicdvar( "scr_sd_timelimit", var_0 );
    maps\mp\_utility::registertimelimitdvar( "sd", var_0 );
    var_1 = getmatchrulesdata( "sdData", "roundSwitch" );
    setdynamicdvar( "scr_sd_roundswitch", var_1 );
    maps\mp\_utility::registerroundswitchdvar( "sd", var_1, 0, 9 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sd_winlimit", var_2 );
    maps\mp\_utility::registerwinlimitdvar( "sd", var_2 );
    setdynamicdvar( "scr_sd_bombtimer", getmatchrulesdata( "sdData", "bombTimer" ) );
    setdynamicdvar( "scr_sd_planttime", getmatchrulesdata( "sdData", "plantTime" ) );
    setdynamicdvar( "scr_sd_defusetime", getmatchrulesdata( "sdData", "defuseTime" ) );
    setdynamicdvar( "scr_sd_multibomb", getmatchrulesdata( "sdData", "multiBomb" ) );
    setdynamicdvar( "scr_sd_roundlimit", 0 );
    maps\mp\_utility::registerroundlimitdvar( "sd", 0 );
    setdynamicdvar( "scr_sd_scorelimit", 1 );
    maps\mp\_utility::registerscorelimitdvar( "sd", 1 );
    setdynamicdvar( "scr_sd_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "sd", 0 );
    setdynamicdvar( "scr_sd_promode", 0 );
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
    precacheshader( "waypoint_defuse" );
    precacheshader( "waypoint_defuse_a" );
    precacheshader( "waypoint_defuse_b" );
    precacheshader( "waypoint_escort" );
    precachestring( &"MP_EXPLOSIVES_RECOVERED_BY" );
    precachestring( &"MP_EXPLOSIVES_DROPPED_BY" );
    precachestring( &"MP_EXPLOSIVES_PLANTED_BY" );
    precachestring( &"MP_EXPLOSIVES_DEFUSED_BY" );
    precachestring( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    precachestring( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    precachestring( &"MP_CANT_PLANT_WITHOUT_BOMB" );
    precachestring( &"MP_PLANTING_EXPLOSIVE" );
    precachestring( &"MP_DEFUSING_EXPLOSIVE" );
}

onstartgametype()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    setclientnamemode( "manual_change" );
    game["strings"]["target_destroyed"] = &"MP_TARGET_DESTROYED";
    game["strings"]["bomb_defused"] = &"MP_BOMB_DEFUSED";
    precachestring( game["strings"]["target_destroyed"] );
    precachestring( game["strings"]["bomb_defused"] );
    level._effect["bombexplosion"] = loadfx( "explosions/tanker_explosion" );
    maps\mp\_utility::setobjectivetext( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
    maps\mp\_utility::setobjectivetext( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( game["attackers"], &"OBJECTIVES_SD_ATTACKER_SCORE" );
        maps\mp\_utility::setobjectivescoretext( game["defenders"], &"OBJECTIVES_SD_DEFENDER_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( game["attackers"], &"OBJECTIVES_SD_ATTACKER_HINT" );
    maps\mp\_utility::setobjectivehinttext( game["defenders"], &"OBJECTIVES_SD_DEFENDER_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_sd_spawn_attacker" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_sd_spawn_defender" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_2[0] = "sd";
    var_2[1] = "bombzone";
    var_2[2] = "blocker";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    maps\mp\gametypes\_rank::registerscoreinfo( "win", 2 );
    maps\mp\gametypes\_rank::registerscoreinfo( "loss", 1 );
    maps\mp\gametypes\_rank::registerscoreinfo( "tie", 1.5 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 20 );
    maps\mp\gametypes\_rank::registerscoreinfo( "plant", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defuse", 100 );
    thread updategametypedvars();
    setspecialloadout();
    thread bombs();
}

getspawnpoint()
{
    if ( self.pers["team"] == game["attackers"] )
        var_0 = "mp_sd_spawn_attacker";
    else
        var_0 = "mp_sd_spawn_defender";

    var_1 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( var_0 );
    var_2 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_1 );
    return var_2;
}

onspawnplayer()
{
    self.isplanting = 0;
    self.isdefusing = 0;
    self.isbombcarrier = 0;

    if ( level.multibomb && !isdefined( self.carryicon ) && self.pers["team"] == game["attackers"] && !level.bombplanted )
    {
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

    level notify( "spawned_player" );
}

hidecarryiconongameend()
{
    self endon( "disconnect" );
    level waittill( "game_ended" );

    if ( isdefined( self.carryicon ) )
        self.carryicon.alpha = 0;
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    thread checkallowspectating();
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

sd_endgame( var_0, var_1 )
{
    level.finalkillcam_winner = var_0;

    if ( var_1 == game["strings"]["target_destroyed"] || var_1 == game["strings"]["bomb_defused"] )
    {
        var_2 = 1;

        foreach ( var_4 in level.bombzones )
        {
            if ( isdefined( level.finalkillcam_killcamentityindex[var_0] ) && level.finalkillcam_killcamentityindex[var_0] == var_4.killcamentnum )
            {
                var_2 = 0;
                break;
            }
        }

        if ( var_2 )
            maps\mp\gametypes\_damage::erasefinalkillcam();
    }

    thread maps\mp\gametypes\_gamelogic::endgame( var_0, var_1 );
}

ondeadevent( var_0 )
{
    if ( level.bombexploded || level.bombdefused )
        return;

    if ( var_0 == "all" )
    {
        if ( level.bombplanted )
            sd_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
        else
            sd_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level.bombplanted )
            return;

        level thread sd_endgame( game["defenders"], game["strings"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread sd_endgame( game["attackers"], game["strings"][game["defenders"] + "_eliminated"] );
}

ononeleftevent( var_0 )
{
    if ( level.bombexploded || level.bombdefused )
        return;

    var_1 = maps\mp\_utility::getlastlivingplayer( var_0 );
    var_1 thread givelastonteamwarning();
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
    else if ( var_0.isbombcarrier )
    {
        var_1 maps\mp\_utility::incplayerstat( "bombcarrierkills", 1 );
        thread maps\mp\_matchdata::logkillevent( var_2, "carrying" );
    }
    else if ( var_0.isdefusing )
    {
        thread maps\mp\_matchdata::logkillevent( var_2, "defusing" );
        var_1 maps\mp\_utility::incpersstat( "defends", 1 );
        var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }

    if ( var_1.isbombcarrier )
        var_1 maps\mp\_utility::incplayerstat( "killsasbombcarrier", 1 );
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
    maps\mp\gametypes\_missions::lastmansd();
}

ontimelimit()
{
    sd_endgame( game["defenders"], game["strings"]["time_limit_reached"] );
}

updategametypedvars()
{
    level.planttime = maps\mp\_utility::dvarfloatvalue( "planttime", 5, 0, 20 );
    level.defusetime = maps\mp\_utility::dvarfloatvalue( "defusetime", 5, 0, 20 );
    level.bombtimer = maps\mp\_utility::dvarfloatvalue( "bombtimer", 45, 1, 300 );
    level.multibomb = maps\mp\_utility::dvarintvalue( "multibomb", 0, 0, 1 );
}

removebombzonec( var_0 )
{
    var_1 = [];
    var_2 = getentarray( "script_brushmodel", "classname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4.script_gameobjectname ) && var_4.script_gameobjectname == "bombzone" )
        {
            foreach ( var_6 in var_0 )
            {
                if ( distance( var_4.origin, var_6.origin ) < 100 && issubstr( tolower( var_6.script_label ), "c" ) )
                {
                    var_6.relatedbrushmodel = var_4;
                    var_1[var_1.size] = var_6;
                    break;
                }
            }
        }
    }

    foreach ( var_10 in var_1 )
    {
        var_10.relatedbrushmodel delete();
        var_11 = getentarray( var_10.target, "targetname" );

        foreach ( var_13 in var_11 )
            var_13 delete();

        var_10 delete();
    }

    return common_scripts\utility::array_removeundefined( var_0 );
}

bombs()
{
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    var_0 = getent( "sd_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        common_scripts\utility::error( "No sd_bomb_pickup_trig trigger found in map." );
        return;
    }

    var_1[0] = getent( "sd_bomb", "targetname" );

    if ( !isdefined( var_1[0] ) )
    {
        common_scripts\utility::error( "No sd_bomb script_model found in map." );
        return;
    }

    precachemodel( "prop_suitcase_bomb" );
    var_1[0] setmodel( "prop_suitcase_bomb" );

    if ( !level.multibomb )
    {
        level.sdbomb = maps\mp\gametypes\_gameobjects::createcarryobject( game["attackers"], var_0, var_1, ( 0.0, 0.0, 32.0 ) );
        level.sdbomb maps\mp\gametypes\_gameobjects::allowcarry( "friendly" );
        level.sdbomb maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_bomb" );
        level.sdbomb maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_bomb" );
        level.sdbomb maps\mp\gametypes\_gameobjects::setvisibleteam( "friendly" );
        level.sdbomb maps\mp\gametypes\_gameobjects::setcarryicon( "hud_suitcase_bomb" );
        level.sdbomb.allowweapons = 1;
        level.sdbomb.onpickup = ::onpickup;
        level.sdbomb.ondrop = ::ondrop;
    }
    else
    {
        var_0 delete();
        var_1[0] delete();
    }

    level.bombzones = [];
    var_2 = getentarray( "bombzone", "targetname" );
    var_2 = removebombzonec( var_2 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_0 = var_2[var_3];
        var_1 = getentarray( var_2[var_3].target, "targetname" );
        var_4 = maps\mp\gametypes\_gameobjects::createuseobject( game["defenders"], var_0, var_1, ( 0.0, 0.0, 64.0 ) );
        var_4 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
        var_4 maps\mp\gametypes\_gameobjects::setusetime( level.planttime );
        var_4 maps\mp\gametypes\_gameobjects::setusetext( &"MP_PLANTING_EXPLOSIVE" );
        var_4 maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );

        if ( !level.multibomb )
            var_4 maps\mp\gametypes\_gameobjects::setkeyobject( level.sdbomb );

        var_5 = var_4 maps\mp\gametypes\_gameobjects::getlabel();
        var_4.label = var_5;
        var_4 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defend" + var_5 );
        var_4 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" + var_5 );
        var_4 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_target" + var_5 );
        var_4 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_target" + var_5 );
        var_4 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_4.onbeginuse = ::onbeginuse;
        var_4.onenduse = ::onenduse;
        var_4.onuse = ::onuseplantobject;
        var_4.oncantuse = ::oncantuse;
        var_4.useweapon = "briefcase_bomb_mp";

        for ( var_6 = 0; var_6 < var_1.size; var_6++ )
        {
            if ( isdefined( var_1[var_6].script_exploder ) )
            {
                var_4.exploderindex = var_1[var_6].script_exploder;
                var_1[var_6] thread setupkillcament( var_4 );
                break;
            }
        }

        level.bombzones[level.bombzones.size] = var_4;
        var_4.bombdefusetrig = getent( var_1[0].target, "targetname" );
        var_4.bombdefusetrig.origin += ( 0.0, 0.0, -10000.0 );
        var_4.bombdefusetrig.label = var_5;
    }

    for ( var_3 = 0; var_3 < level.bombzones.size; var_3++ )
    {
        var_7 = [];

        for ( var_8 = 0; var_8 < level.bombzones.size; var_8++ )
        {
            if ( var_8 != var_3 )
                var_7[var_7.size] = level.bombzones[var_8];
        }

        level.bombzones[var_3].otherbombzones = var_7;
    }
}

setupkillcament( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = self.angles;
    var_1 rotateyaw( -45, 0.05 );
    wait 0.05;
    var_2 = self.origin + ( 0.0, 0.0, 5.0 );
    var_3 = self.origin + anglestoforward( var_1.angles ) * 100 + ( 0.0, 0.0, 128.0 );
    var_4 = bullettrace( var_2, var_3, 0, self );
    self.killcament = spawn( "script_model", var_4["position"] );
    self.killcament setscriptmoverkillcam( "explosive" );
    var_0.killcamentnum = self.killcament getentitynumber();
    var_1 delete();
}

onbeginuse( var_0 )
{
    if ( maps\mp\gametypes\_gameobjects::isfriendlyteam( var_0.pers["team"] ) )
    {
        var_0 playsound( "mp_bomb_defuse" );
        var_0.isdefusing = 1;

        if ( isdefined( level.sdbombmodel ) )
            level.sdbombmodel hide();
    }
    else
    {
        var_0.isplanting = 1;

        if ( level.multibomb )
        {
            for ( var_1 = 0; var_1 < self.otherbombzones.size; var_1++ )
            {
                self.otherbombzones[var_1] maps\mp\gametypes\_gameobjects::allowuse( "none" );
                self.otherbombzones[var_1] maps\mp\gametypes\_gameobjects::setvisibleteam( "friendly" );
            }
        }
    }
}

onenduse( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( isalive( var_1 ) )
    {
        var_1.isdefusing = 0;
        var_1.isplanting = 0;
    }

    if ( maps\mp\gametypes\_gameobjects::isfriendlyteam( var_1.pers["team"] ) )
    {
        if ( isdefined( level.sdbombmodel ) && !var_2 )
            level.sdbombmodel show();
    }
    else if ( level.multibomb && !var_2 )
    {
        for ( var_3 = 0; var_3 < self.otherbombzones.size; var_3++ )
        {
            self.otherbombzones[var_3] maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
            self.otherbombzones[var_3] maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        }
    }
}

oncantuse( var_0 )
{
    var_0 iprintlnbold( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

onuseplantobject( var_0 )
{
    if ( !maps\mp\gametypes\_gameobjects::isfriendlyteam( var_0.pers["team"] ) )
    {
        level thread bombplanted( self, var_0 );

        for ( var_1 = 0; var_1 < level.bombzones.size; var_1++ )
        {
            if ( level.bombzones[var_1] == self )
                continue;

            level.bombzones[var_1] maps\mp\gametypes\_gameobjects::disableobject();
        }

        var_0 playsound( "mp_bomb_plant" );
        var_0 notify( "bomb_planted" );
        var_0 notify( "objective", "plant" );
        var_0 maps\mp\_utility::incpersstat( "plants", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "plants", var_0.pers["plants"] );

        if ( isdefined( level.sd_loadout ) && isdefined( level.sd_loadout[var_0.team] ) )
            var_0 thread removebombcarrierclass();

        maps\mp\_utility::leaderdialog( "bomb_planted" );
        level thread maps\mp\_utility::teamplayercardsplash( "callout_bombplanted", var_0 );
        level.bombowner = var_0;
        var_0 thread maps\mp\gametypes\_hud_message::splashnotify( "plant", maps\mp\gametypes\_rank::getscoreinfovalue( "plant" ) );
        var_0 thread maps\mp\gametypes\_rank::giverankxp( "plant" );
        var_0.bombplantedtime = gettime();
        maps\mp\gametypes\_gamescore::giveplayerscore( "plant", var_0 );
        var_0 thread maps\mp\_matchdata::loggameevent( "plant", var_0.origin );
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

    self.pers["gamemodeLoadout"] = level.sd_loadout[self.team];
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

onusedefuseobject( var_0 )
{
    var_0 notify( "bomb_defused" );
    var_0 notify( "objective", "defuse" );
    level thread bombdefused();
    maps\mp\gametypes\_gameobjects::disableobject();
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
}

ondrop( var_0 )
{
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_bomb" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_bomb" );
    maps\mp\_utility::playsoundonplayers( game["bomb_dropped_sound"], game["attackers"] );
}

onpickup( var_0 )
{
    var_0.isbombcarrier = 1;
    var_0 maps\mp\_utility::incplayerstat( "bombscarried", 1 );
    var_0 thread maps\mp\_matchdata::loggameevent( "pickup", var_0.origin );
    maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_escort" );
    maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_escort" );

    if ( isdefined( level.sd_loadout ) && isdefined( level.sd_loadout[var_0.team] ) )
        var_0 thread applybombcarrierclass();

    if ( !level.bombdefused )
    {
        maps\mp\_utility::teamplayercardsplash( "callout_bombtaken", var_0, var_0.team );
        maps\mp\_utility::leaderdialog( "bomb_taken", var_0.pers["team"] );
    }

    maps\mp\_utility::playsoundonplayers( game["bomb_recovered_sound"], game["attackers"] );
}

onreset()
{

}

bombplanted( var_0, var_1 )
{
    maps\mp\gametypes\_gamelogic::pausetimer();
    level.bombplanted = 1;
    var_0.visuals[0] thread maps\mp\gametypes\_gamelogic::playtickingsound();
    level.tickingobject = var_0.visuals[0];
    level.timelimitoverride = 1;
    setgameendtime( int( gettime() + level.bombtimer * 1000 ) );
    setdvar( "ui_bomb_timer", 1 );

    if ( !level.multibomb )
    {
        level.sdbomb maps\mp\gametypes\_gameobjects::allowcarry( "none" );
        level.sdbomb maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
        level.sdbomb maps\mp\gametypes\_gameobjects::setdropped();
        level.sdbombmodel = level.sdbomb.visuals[0];
    }
    else
    {
        for ( var_2 = 0; var_2 < level.players.size; var_2++ )
        {
            if ( isdefined( level.players[var_2].carryicon ) )
                level.players[var_2].carryicon maps\mp\gametypes\_hud_util::destroyelem();
        }

        var_3 = bullettrace( var_1.origin + ( 0.0, 0.0, 20.0 ), var_1.origin - ( 0.0, 0.0, 2000.0 ), 0, var_1 );
        var_4 = randomfloat( 360 );
        var_5 = ( cos( var_4 ), sin( var_4 ), 0 );
        var_5 = vectornormalize( var_5 - var_3["normal"] * vectordot( var_5, var_3["normal"] ) );
        var_6 = vectortoangles( var_5 );
        level.sdbombmodel = spawn( "script_model", var_3["position"] );
        level.sdbombmodel.angles = var_6;
        level.sdbombmodel setmodel( "prop_suitcase_bomb" );
    }

    var_0 maps\mp\gametypes\_gameobjects::allowuse( "none" );
    var_0 maps\mp\gametypes\_gameobjects::setvisibleteam( "none" );
    var_7 = var_0 maps\mp\gametypes\_gameobjects::getlabel();
    var_8 = var_0.bombdefusetrig;
    var_8.origin = level.sdbombmodel.origin;
    var_9 = [];
    var_10 = maps\mp\gametypes\_gameobjects::createuseobject( game["defenders"], var_8, var_9, ( 0.0, 0.0, 32.0 ) );
    var_10 maps\mp\gametypes\_gameobjects::allowuse( "friendly" );
    var_10 maps\mp\gametypes\_gameobjects::setusetime( level.defusetime );
    var_10 maps\mp\gametypes\_gameobjects::setusetext( &"MP_DEFUSING_EXPLOSIVE" );
    var_10 maps\mp\gametypes\_gameobjects::setusehinttext( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    var_10 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
    var_10 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defuse" + var_7 );
    var_10 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_defend" + var_7 );
    var_10 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defuse" + var_7 );
    var_10 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_defend" + var_7 );
    var_10.label = var_7;
    var_10.onbeginuse = ::onbeginuse;
    var_10.onenduse = ::onenduse;
    var_10.onuse = ::onusedefuseobject;
    var_10.useweapon = "briefcase_bomb_defuse_mp";
    bombtimerwait();
    setdvar( "ui_bomb_timer", 0 );
    var_0.visuals[0] maps\mp\gametypes\_gamelogic::stoptickingsound();

    if ( level.gameended || level.bombdefused )
        return;

    level.bombexploded = 1;
    var_11 = level.sdbombmodel.origin;
    level.sdbombmodel hide();

    if ( isdefined( var_1 ) )
    {
        var_0.visuals[0] radiusdamage( var_11, 512, 200, 20, var_1, "MOD_EXPLOSIVE", "bomb_site_mp" );
        var_1 maps\mp\_utility::incpersstat( "destructions", 1 );
        var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", var_1.pers["destructions"] );
    }
    else
        var_0.visuals[0] radiusdamage( var_11, 512, 200, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

    var_12 = randomfloat( 360 );
    var_13 = spawnfx( level._effect["bombexplosion"], var_11 + ( 0.0, 0.0, 50.0 ), ( 0.0, 0.0, 1.0 ), ( cos( var_12 ), sin( var_12 ), 0 ) );
    triggerfx( var_13 );
    playrumbleonposition( "grenade_rumble", var_11 );
    earthquake( 0.75, 2.0, var_11, 2000 );
    thread maps\mp\_utility::playsoundinspace( "exp_suitcase_bomb_main", var_11 );

    if ( isdefined( var_0.exploderindex ) )
        common_scripts\utility::exploder( var_0.exploderindex );

    for ( var_2 = 0; var_2 < level.bombzones.size; var_2++ )
        level.bombzones[var_2] maps\mp\gametypes\_gameobjects::disableobject();

    var_10 maps\mp\gametypes\_gameobjects::disableobject();
    setgameendtime( 0 );
    wait 3;
    sd_endgame( game["attackers"], game["strings"]["target_destroyed"] );
}

bombtimerwait()
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    var_0 = level.bombtimer * 1000 + gettime();
    setdvar( "ui_bomb_timer_endtime", var_0 );
    level thread handlehostmigration( var_0 );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithgameendtimeupdate( level.bombtimer );
}

handlehostmigration( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    var_1 = maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

    if ( var_1 > 0 )
        setdvar( "ui_bomb_timer_endtime", var_0 + var_1 );
}

bombdefused()
{
    level.tickingobject maps\mp\gametypes\_gamelogic::stoptickingsound();
    level.bombdefused = 1;
    setdvar( "ui_bomb_timer", 0 );
    level notify( "bomb_defused" );
    wait 1.5;
    setgameendtime( 0 );
    sd_endgame( game["defenders"], game["strings"]["bomb_defused"] );
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

setspecialloadout()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
        level.sd_loadout[game["attackers"]] = maps\mp\_utility::getmatchrulesspecialclass( "axis", 5 );
}
