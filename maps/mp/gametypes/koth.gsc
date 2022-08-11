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
        maps\mp\_utility::registertimelimitdvar( level.gametype, 30 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 300 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.teambased = 1;
    level.doprematch = 1;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onplayerkilled = ::onplayerkilled;
    level.initgametypeawards = ::initgametypeawards;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_targetneutral" );
    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
    precachestring( &"MP_WAITING_FOR_HQ" );

    if ( getdvar( "koth_autodestroytime" ) == "" )
        setdvar( "koth_autodestroytime", "60" );

    level.hqautodestroytime = getdvarint( "koth_autodestroytime" );

    if ( getdvar( "koth_spawntime" ) == "" )
        setdvar( "koth_spawntime", "0" );

    level.hqspawntime = getdvarint( "koth_spawntime" );

    if ( getdvar( "koth_kothmode" ) == "" )
        setdvar( "koth_kothmode", "1" );

    level.kothmode = getdvarint( "koth_kothmode" );

    if ( getdvar( "koth_captureTime" ) == "" )
        setdvar( "koth_captureTime", "20" );

    level.capturetime = getdvarint( "koth_captureTime" );

    if ( getdvar( "koth_destroyTime" ) == "" )
        setdvar( "koth_destroyTime", "10" );

    level.destroytime = getdvarint( "koth_destroyTime" );

    if ( getdvar( "koth_delayPlayer" ) == "" )
        setdvar( "koth_delayPlayer", 1 );

    level.delayplayer = getdvarint( "koth_delayPlayer" );

    if ( getdvar( "koth_spawnDelay" ) == "" )
        setdvar( "koth_spawnDelay", 0 );

    level.spawndelay = getdvarint( "koth_spawnDelay" );

    if ( getdvar( "koth_extraDelay" ) == "" )
        setdvar( "koth_extraDelay", 0.0 );

    level.extradelay = getdvarint( "koth_extraDelay" );
    setdvarifuninitialized( "koth_proMode", 0 );
    level.promode = getdvarint( "koth_proMode" );
    level.iconoffset = ( 0.0, 0.0, 32.0 );
    level.onrespawndelay = ::getrespawndelay;
    game["dialog"]["gametype"] = "headquarters";

    if ( getdvarint( "g_hardcore" ) )
    {
        if ( getmapcustom( "allieschar" ) == "us_army" )
            game["dialog"]["allies_gametype"] = "hc_hq";

        if ( getmapcustom( "axischar" ) == "us_army" )
            game["dialog"]["axis_gametype"] = "hc_hq";

        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    }
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "koth_autodestroytime", getmatchrulesdata( "hqData", "HQLifetime" ) );
    setdynamicdvar( "koth_spawntime", getmatchrulesdata( "hqData", "HQActivateDelay" ) );
    setdynamicdvar( "scr_koth_roundswitch", 1 );
    maps\mp\_utility::registerroundswitchdvar( "koth", 1, 0, 9 );
    setdynamicdvar( "scr_koth_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "koth", 1 );
    setdynamicdvar( "scr_koth_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "koth", 1 );
    setdynamicdvar( "scr_koth_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "koth", 0 );
    setdynamicdvar( "koth_kothmode", 0 );
    setdynamicdvar( "koth_capturetime", 20 );
    setdynamicdvar( "koth_destroytime", 10 );
    setdynamicdvar( "koth_delayPlayer", 0 );
    setdynamicdvar( "koth_spawnDelay", 60 );
    setdynamicdvar( "koth_extraDelay", 0 );
    setdynamicdvar( "koth_proMode", 0 );
    setdynamicdvar( "scr_koth_promode", 0 );
}

updateobjectivehintmessages( var_0, var_1 )
{
    game["strings"]["objective_hint_allies"] = var_0;
    game["strings"]["objective_hint_axis"] = var_1;

    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];

        if ( isdefined( var_3.pers["team"] ) && var_3.pers["team"] != "spectator" )
        {
            var_4 = maps\mp\_utility::getobjectivehinttext( var_3.pers["team"] );
            var_3 thread maps\mp\gametypes\_hud_message::hintmessage( var_4 );
        }
    }
}

getrespawndelay()
{
    maps\mp\_utility::clearlowermessage( "hq_respawn" );

    if ( !isdefined( level.radioobject ) )
        return undefined;

    var_0 = level.radioobject maps\mp\gametypes\_gameobjects::getownerteam();

    if ( self.pers["team"] == var_0 )
    {
        if ( !isdefined( level.hqdestroytime ) )
            return undefined;

        if ( !level.spawndelay )
            return undefined;

        var_1 = ( level.hqdestroytime - gettime() ) / 1000;
        var_1 += ( level.extradelay + 1.0 );

        if ( level.spawndelay >= level.hqautodestroytime )
            maps\mp\_utility::setlowermessage( "hq_respawn", &"MP_WAITING_FOR_HQ", undefined, 10 );

        if ( !isalive( self ) )
            self.forcespawnnearteammates = 1;

        if ( level.delayplayer )
            return min( level.spawndelay, var_1 );
        else
            return int( var_1 ) % level.spawndelay;
    }
}

onstartgametype()
{
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_KOTH" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_KOTH" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_KOTH" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_KOTH" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_KOTH_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_KOTH_SCORE" );
    }

    level.objectivehintpreparehq = &"MP_CONTROL_HQ";
    level.objectivehintcapturehq = &"MP_CAPTURE_HQ";
    level.objectivehintdestroyhq = &"MP_DESTROY_HQ";
    level.objectivehintdefendhq = &"MP_DEFEND_HQ";
    precachestring( level.objectivehintpreparehq );
    precachestring( level.objectivehintcapturehq );
    precachestring( level.objectivehintdestroyhq );
    precachestring( level.objectivehintdefendhq );

    if ( level.kothmode )
        level.objectivehintdestroyhq = level.objectivehintcapturehq;

    if ( level.hqspawntime )
        updateobjectivehintmessages( level.objectivehintpreparehq, level.objectivehintpreparehq );
    else
        updateobjectivehintmessages( level.objectivehintcapturehq, level.objectivehintcapturehq );

    setclientnamemode( "auto_change" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    level.spawn_all = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_tdm_spawn" );

    if ( !level.spawn_all.size )
    {
        maps\mp\gametypes\_callbacksetup::abortlevel();
        return;
    }

    var_0[0] = "hq";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    thread setupradios();
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 10 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend", 10 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault", 10 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 250 );
    thread hqmainloop();
}

hqmainloop()
{
    level endon( "game_ended" );
    level.hqrevealtime = -100000;
    var_0 = &"MP_HQ_AVAILABLE_IN";

    if ( level.kothmode )
    {
        var_1 = &"MP_HQ_DESPAWN_IN";
        var_2 = &"MP_HQ_DESPAWN_IN";
    }
    else if ( !level.splitscreen )
    {
        var_1 = &"MP_HQ_REINFORCEMENTS_IN";
        var_2 = &"MP_HQ_DESPAWN_IN";
    }
    else
    {
        var_1 = &"MP_HQ_REINFORCEMENTS_IN_SPLITSCREEN";
        var_2 = &"MP_HQ_DESPAWN_IN";
    }

    precachestring( var_0 );
    precachestring( var_1 );
    precachestring( var_2 );
    precachestring( &"MP_CAPTURING_HQ" );
    precachestring( &"MP_DESTROYING_HQ" );
    maps\mp\_utility::gameflagwait( "prematch_done" );
    wait 5;
    var_3 = [];
    var_3["allies"] = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4, "allies" );
    var_3["allies"] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 125, 2 );
    var_3["allies"].label = var_0;
    var_3["allies"].alpha = 0;
    var_3["allies"].archived = 0;
    var_3["allies"].hidewheninmenu = 1;
    var_3["axis"] = maps\mp\gametypes\_hud_util::createservertimer( "objective", 1.4, "axis" );
    var_3["axis"] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 125, 2 );
    var_3["axis"].label = var_0;
    var_3["axis"].alpha = 0;
    var_3["axis"].archived = 0;
    var_3["axis"].hidewheninmenu = 1;
    level.timerdisplay = var_3;
    thread hidetimerdisplayongameend( var_3["allies"] );
    thread hidetimerdisplayongameend( var_3["axis"] );
    var_4 = maps\mp\gametypes\_gameobjects::getnextobjid();
    objective_add( var_4, "invisible", ( 0.0, 0.0, 0.0 ) );

    for (;;)
    {
        var_5 = pickradiotospawn();
        var_5 makeradioactive();
        maps\mp\_utility::playsoundonplayers( "mp_suitcase_pickup" );
        maps\mp\_utility::leaderdialog( "hq_located" );
        var_6 = var_5.gameobject;
        level.radioobject = var_6;
        var_6 maps\mp\gametypes\_gameobjects::setmodelvisibility( 1 );
        level.hqrevealtime = gettime();

        if ( level.hqspawntime )
        {
            var_7 = maps\mp\gametypes\_objpoints::createteamobjpoint( "objpoint_next_hq", var_5.origin + level.iconoffset, "all", "waypoint_targetneutral" );
            var_7 setwaypoint( 1, 1 );
            objective_position( var_4, var_5.trigorigin );
            objective_icon( var_4, "waypoint_targetneutral" );
            objective_state( var_4, "active" );
            updateobjectivehintmessages( level.objectivehintpreparehq, level.objectivehintpreparehq );
            var_3["allies"].label = var_0;
            var_3["allies"] settimer( level.hqspawntime );
            var_3["allies"].alpha = 1;
            var_3["axis"].label = var_0;
            var_3["axis"] settimer( level.hqspawntime );
            var_3["axis"].alpha = 1;
            wait(level.hqspawntime);
            maps\mp\gametypes\_objpoints::deleteobjpoint( var_7 );
            objective_state( var_4, "invisible" );
            maps\mp\_utility::leaderdialog( "hq_online" );
        }

        var_3["allies"].alpha = 0;
        var_3["axis"].alpha = 0;
        waittillframeend;
        maps\mp\_utility::leaderdialog( "obj_capture" );
        updateobjectivehintmessages( level.objectivehintcapturehq, level.objectivehintcapturehq );
        maps\mp\_utility::playsoundonplayers( "mp_killstreak_radar" );
        var_6 maps\mp\gametypes\_gameobjects::allowuse( "any" );
        var_6 maps\mp\gametypes\_gameobjects::setusetime( level.capturetime );
        var_6 maps\mp\gametypes\_gameobjects::setusetext( &"MP_CAPTURING_HQ" );
        var_6 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_captureneutral" );
        var_6 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_captureneutral" );
        var_6 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_6.onuse = ::onradiocapture;
        var_6.onbeginuse = ::onbeginuse;
        var_6.onenduse = ::onenduse;
        level waittill( "hq_captured" );
        var_8 = var_6 maps\mp\gametypes\_gameobjects::getownerteam();
        var_9 = maps\mp\_utility::getotherteam( var_8 );

        if ( level.hqautodestroytime )
        {
            thread destroyhqaftertime( level.hqautodestroytime );
            var_3[var_8] settimer( level.hqautodestroytime + level.extradelay );
            var_3[var_9] settimer( level.hqautodestroytime );
        }
        else
            level.hqdestroyedbytimer = 0;

        for (;;)
        {
            var_8 = var_6 maps\mp\gametypes\_gameobjects::getownerteam();
            var_9 = maps\mp\_utility::getotherteam( var_8 );

            if ( var_8 == "allies" )
                updateobjectivehintmessages( level.objectivehintdefendhq, level.objectivehintdestroyhq );
            else
                updateobjectivehintmessages( level.objectivehintdestroyhq, level.objectivehintdefendhq );

            var_6 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
            var_6 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defend" );
            var_6 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" );
            var_6 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_capture" );
            var_6 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_capture" );

            if ( !level.kothmode )
                var_6 maps\mp\gametypes\_gameobjects::setusetext( &"MP_DESTROYING_HQ" );

            var_6.onuse = ::onradiodestroy;

            if ( level.hqautodestroytime )
            {
                var_3[var_8].label = var_1;
                var_3[var_8].alpha = 1;
                var_3[var_9].label = var_2;
                var_3[var_9].alpha = 1;
            }

            level waittill( "hq_destroyed" );
            var_3[var_9].alpha = 0;

            if ( !level.kothmode || level.hqdestroyedbytimer )
                break;

            thread forcespawnteam( var_8 );
            var_6 maps\mp\gametypes\_gameobjects::setownerteam( maps\mp\_utility::getotherteam( var_8 ) );
        }

        level notify( "hq_reset" );
        var_6 maps\mp\gametypes\_gameobjects::allowuse( "none" );
        var_6 maps\mp\gametypes\_gameobjects::setownerteam( "neutral" );
        var_6 maps\mp\gametypes\_gameobjects::setmodelvisibility( 0 );
        var_5 makeradioinactive();
        level.radioobject = undefined;
        thread forcespawnteam( var_8, level.extradelay );
        wait(level.extradelay);
        wait(max( 1.0, 6.0 - level.extradelay ));
    }
}

hidetimerdisplayongameend( var_0 )
{
    level waittill( "game_ended" );
    var_0.alpha = 0;
}

forcespawnteam( var_0, var_1 )
{
    if ( var_1 )
    {
        foreach ( var_3 in level.players )
        {
            if ( isalive( var_3 ) )
                continue;

            if ( var_3.pers["team"] == var_0 )
                var_3 maps\mp\_utility::setlowermessage( "hq_respawn", game["strings"]["waiting_to_spawn"] );
        }

        wait(var_1);
    }

    level.timerdisplay[var_0].alpha = 0;

    foreach ( var_3 in level.players )
    {
        if ( var_3.pers["team"] == var_0 )
        {
            var_3 maps\mp\_utility::clearlowermessage( "hq_respawn" );

            if ( !isalive( var_3 ) )
                var_3.forcespawnnearteammates = 1;

            var_3 notify( "force_spawn" );
        }
    }
}

onbeginuse( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::getownerteam();

    if ( var_1 == "neutral" )
        self.objpoints[var_0.pers["team"]] thread maps\mp\gametypes\_objpoints::startflashing();
    else
    {
        self.objpoints["allies"] thread maps\mp\gametypes\_objpoints::startflashing();
        self.objpoints["axis"] thread maps\mp\gametypes\_objpoints::startflashing();
    }
}

onenduse( var_0, var_1, var_2 )
{
    self.objpoints["allies"] thread maps\mp\gametypes\_objpoints::stopflashing();
    self.objpoints["axis"] thread maps\mp\gametypes\_objpoints::stopflashing();
}

onradiocapture( var_0 )
{
    var_1 = var_0.pers["team"];
    var_0 thread [[ level.onxpevent ]]( "capture" );
    maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_0 );

    foreach ( var_3 in self.touchlist[var_1] )
    {
        var_4 = var_3.player;
        var_4 maps\mp\_utility::incplayerstat( "hqscaptured", 1 );
        var_4 maps\mp\_utility::incpersstat( "captures", 1 );
        var_4 maps\mp\gametypes\_persistence::statsetchild( "round", "captures", var_0.pers["captures"] );
    }

    var_0 thread maps\mp\_matchdata::loggameevent( "capture", var_0.origin );
    var_6 = maps\mp\gametypes\_gameobjects::getownerteam();
    maps\mp\gametypes\_gameobjects::setownerteam( var_1 );

    if ( !level.kothmode )
        maps\mp\gametypes\_gameobjects::setusetime( level.destroytime );

    var_7 = "axis";

    if ( var_1 == "axis" )
        var_7 = "allies";

    maps\mp\_utility::teamplayercardsplash( "callout_capturedhq", var_0 );
    maps\mp\_utility::leaderdialog( "hq_secured", var_1 );
    maps\mp\_utility::leaderdialog( "hq_enemy_captured", var_7 );
    thread maps\mp\_utility::playsoundonplayers( "mp_war_objective_taken", var_1 );
    thread maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_7 );
    level thread awardhqpoints( var_1 );
    var_0 notify( "objective", "captured" );
    level notify( "hq_captured" );
}

onradiodestroy( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = "axis";

    if ( var_1 == "axis" )
        var_2 = "allies";

    var_0 thread [[ level.onxpevent ]]( "capture" );
    maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_0 );

    foreach ( var_4 in self.touchlist[var_1] )
    {
        var_5 = var_4.player;
        var_5 maps\mp\_utility::incplayerstat( "hqsdestroyed", 1 );
        var_5 maps\mp\_utility::incpersstat( "destructions", 1 );
        var_5 maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", var_0.pers["destructions"] );
    }

    var_0 thread maps\mp\_matchdata::loggameevent( "destroy", var_0.origin );

    if ( level.kothmode )
    {
        maps\mp\_utility::teamplayercardsplash( "callout_capturedhq", var_0 );
        maps\mp\_utility::leaderdialog( "hq_secured", var_1 );
        maps\mp\_utility::leaderdialog( "hq_enemy_captured", var_2 );
    }
    else
    {
        maps\mp\_utility::teamplayercardsplash( "callout_destroyedhq", var_0 );
        maps\mp\_utility::leaderdialog( "hq_secured", var_1 );
        maps\mp\_utility::leaderdialog( "hq_enemy_destroyed", var_2 );
    }

    thread maps\mp\_utility::playsoundonplayers( "mp_war_objective_taken", var_1 );
    thread maps\mp\_utility::playsoundonplayers( "mp_war_objective_lost", var_2 );
    level notify( "hq_destroyed" );

    if ( level.kothmode )
        level thread awardhqpoints( var_1 );
}

destroyhqaftertime( var_0 )
{
    level endon( "game_ended" );
    level endon( "hq_reset" );
    level.hqdestroytime = gettime() + var_0 * 1000;
    level.hqdestroyedbytimer = 0;
    wait(var_0);
    level.hqdestroyedbytimer = 1;
    maps\mp\_utility::leaderdialog( "hq_offline" );
    level notify( "hq_destroyed" );
}

awardhqpoints( var_0 )
{
    level endon( "game_ended" );
    level endon( "hq_destroyed" );
    level notify( "awardHQPointsRunning" );
    level endon( "awardHQPointsRunning" );
    var_1 = 12;
    var_2 = 5;
    var_3 = 5;
    var_4 = 10;

    if ( level.promode )
        var_5 = int( level.hqautodestroytime / var_1 );
    else
        var_5 = 5;

    var_6 = 0;

    while ( !level.gameended )
    {
        if ( level.promode && level.hqautodestroytime )
            maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_0, int( var_4 * ( var_6 + 1 ) ) );
        else
            maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_0, var_4 );

        for ( var_7 = 0; var_7 < level.players.size; var_7++ )
        {
            var_8 = level.players[var_7];

            if ( var_8.pers["team"] == var_0 )
            {
                if ( level.promode )
                {
                    if ( level.hqautodestroytime )
                        var_8 thread maps\mp\gametypes\_rank::giverankxp( "defend", int( var_2 + var_3 * var_6 ) );
                    else
                        var_8 thread maps\mp\gametypes\_rank::giverankxp( "defend", int( var_2 + var_3 ) );
                }
                else
                    var_8 thread maps\mp\gametypes\_rank::giverankxp( "defend" );

                if ( isalive( var_8 ) )
                    maps\mp\gametypes\_gamescore::giveplayerscore( "defend", var_8 );
            }
        }

        var_6++;
        wait(var_5);
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }
}

getspawnpoint()
{
    var_0 = undefined;

    if ( isdefined( level.radioobject ) )
    {
        var_1 = level.radioobject maps\mp\gametypes\_gameobjects::getownerteam();

        if ( self.pers["team"] == var_1 )
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_all, level.radioobject.nearspawns );
        else
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_all, level.radioobject.outerspawns );
    }

    if ( !isdefined( var_0 ) )
        var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_all );

    return var_0;
}

onspawnplayer()
{
    maps\mp\_utility::clearlowermessage( "hq_respawn" );
    self.forcespawnnearteammates = undefined;
}

setupradios()
{
    var_0 = [];
    var_1 = getentarray( "hq_hardpoint", "targetname" );

    if ( var_1.size < 2 )
        var_0[var_0.size] = "There are not at least 2 entities with targetname \"radio\"";

    var_2 = getentarray( "radiotrigger", "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = 0;
        var_5 = var_1[var_3];
        var_5.trig = undefined;

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            if ( var_5 istouching( var_2[var_6] ) )
            {
                if ( isdefined( var_5.trig ) )
                {
                    var_0[var_0.size] = "Radio at " + var_5.origin + " is touching more than one \"radiotrigger\" trigger";
                    var_4 = 1;
                    break;
                }

                var_5.trig = var_2[var_6];
                break;
            }
        }

        if ( !isdefined( var_5.trig ) )
        {
            if ( !var_4 )
            {
                var_0[var_0.size] = "Radio at " + var_5.origin + " is not inside any \"radiotrigger\" trigger";
                continue;
            }
        }

        var_5.trigorigin = var_5.trig.origin;
        var_7 = [];
        var_7[0] = var_5;
        var_8 = getentarray( var_5.target, "targetname" );

        for ( var_6 = 0; var_6 < var_8.size; var_6++ )
            var_7[var_7.size] = var_8[var_6];

        var_5.visuals = var_7;
        var_5 maps\mp\gametypes\_gameobjects::setmodelvisibility( 0 );
    }

    if ( var_0.size > 0 )
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {

        }

        common_scripts\utility::error( "Map errors. See above" );
        maps\mp\gametypes\_callbacksetup::abortlevel();
    }
    else
    {
        level.radios = var_1;
        level.prevradio = undefined;
        level.prevradio2 = undefined;
    }
}

makeradioactive()
{
    self.gameobject = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", self.trig, self.visuals, self.origin - self.trigorigin + level.iconoffset );
    self.gameobject maps\mp\gametypes\_gameobjects::setmodelvisibility( 0 );
    self.trig.useobj = self.gameobject;
    setupnearbyspawns();
}

makeradioinactive()
{
    self.gameobject maps\mp\gametypes\_gameobjects::deleteuseobject();
    self.gameobject = undefined;
}

setupnearbyspawns()
{
    var_0 = level.spawn_all;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].distsq = distancesquared( var_0[var_1].origin, self.origin );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        for ( var_3 = var_1 - 1; var_3 >= 0 && var_2.distsq < var_0[var_3].distsq; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];

        var_0[var_3 + 1] = var_2;
    }

    var_4 = [];
    var_5 = [];
    var_6 = var_0.size / 3;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_1 <= var_6 || var_0[var_1].distsq <= 490000 )
            var_4[var_4.size] = var_0[var_1];

        if ( var_1 > var_6 || var_0[var_1].distsq > 1000000 )
        {
            if ( var_5.size < 10 || var_0[var_1].distsq < 2250000 )
                var_5[var_5.size] = var_0[var_1];
        }
    }

    self.gameobject.nearspawns = var_4;
    self.gameobject.outerspawns = var_5;
}

pickradiotospawn()
{
    var_0 = [];
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == "spectator" )
            continue;

        if ( !isalive( var_3 ) )
            continue;

        var_3.dist = 0;

        if ( var_3.team == "allies" )
        {
            var_0[var_0.size] = var_3;
            continue;
        }

        var_1[var_1.size] = var_3;
    }

    if ( !var_0.size || !var_1.size )
    {
        for ( var_5 = level.radios[randomint( level.radios.size )]; isdefined( level.prevradio ) && var_5 == level.prevradio; var_5 = level.radios[randomint( level.radios.size )] )
        {

        }

        level.prevradio2 = level.prevradio;
        level.prevradio = var_5;
        return var_5;
    }

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        for ( var_7 = var_6 + 1; var_7 < var_0.size; var_7++ )
        {
            var_8 = distancesquared( var_0[var_6].origin, var_0[var_7].origin );
            var_0[var_6].dist += var_8;
            var_0[var_7].dist += var_8;
        }
    }

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        for ( var_7 = var_6 + 1; var_7 < var_1.size; var_7++ )
        {
            var_8 = distancesquared( var_1[var_6].origin, var_1[var_7].origin );
            var_1[var_6].dist += var_8;
            var_1[var_7].dist += var_8;
        }
    }

    var_9 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        if ( var_3.dist < var_9.dist )
            var_9 = var_3;
    }

    var_12["allies"] = var_9.origin;
    var_9 = var_1[0];

    foreach ( var_3 in var_1 )
    {
        if ( var_3.dist < var_9.dist )
            var_9 = var_3;
    }

    var_12["axis"] = var_1[0].origin;
    var_15 = undefined;
    var_16 = undefined;

    for ( var_6 = 0; var_6 < level.radios.size; var_6++ )
    {
        var_5 = level.radios[var_6];
        var_17 = abs( distance( var_5.origin, var_12["allies"] ) - distance( var_5.origin, var_12["axis"] ) );

        if ( isdefined( level.prevradio ) && var_5 == level.prevradio )
            continue;

        if ( isdefined( level.prevradio2 ) && var_5 == level.prevradio2 )
        {
            if ( level.radios.size > 2 )
                continue;
            else
                var_17 += 512;
        }

        if ( !isdefined( var_16 ) || var_17 < var_16 )
        {
            var_16 = var_17;
            var_15 = var_5;
        }
    }

    level.prevradio2 = level.prevradio;
    level.prevradio = var_15;
    return var_15;
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isplayer( var_1 ) || !self.touchtriggers.size && !var_1.touchtriggers.size || var_1.pers["team"] == self.pers["team"] )
        return;

    if ( self.touchtriggers.size )
    {
        foreach ( var_11 in self.touchtriggers )
        {
            if ( !isdefined( var_11.useobj ) )
                continue;

            var_12 = var_11.useobj.ownerteam;
            var_13 = self.pers["team"];

            if ( var_12 == "neutral" )
                continue;

            var_13 = self.pers["team"];

            if ( var_13 == var_12 )
            {
                var_1 thread [[ level.onxpevent ]]( "assault" );
                maps\mp\gametypes\_gamescore::giveplayerscore( "assault", var_1 );
                thread maps\mp\_matchdata::logkillevent( var_9, "defending" );
                continue;
            }

            var_1 thread [[ level.onxpevent ]]( "defend" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "defend", var_1 );
            var_1 maps\mp\_utility::incpersstat( "defends", 1 );
            var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
            thread maps\mp\_matchdata::logkillevent( var_9, "assaulting" );
        }
    }

    if ( var_1.touchtriggers.size )
    {
        foreach ( var_11 in var_1.touchtriggers )
        {
            if ( !isdefined( var_11.useobj ) )
                continue;

            var_12 = var_11.useobj.ownerteam;
            var_13 = var_1.pers["team"];

            if ( var_12 == "neutral" )
                var_13 = var_1.pers["team"];

            if ( var_13 == var_12 )
            {
                var_1 thread [[ level.onxpevent ]]( "defend" );
                maps\mp\gametypes\_gamescore::giveplayerscore( "defend", var_1 );
                thread maps\mp\_matchdata::logkillevent( var_9, "assaulting" );
                continue;
            }

            var_1 thread [[ level.onxpevent ]]( "assault" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "assault", var_1 );
            thread maps\mp\_matchdata::logkillevent( var_9, "defending" );
        }
    }
}

initgametypeawards()
{
    maps\mp\_awards::initstataward( "hqsdestroyed", 0, maps\mp\_awards::highestwins );
    maps\mp\_awards::initstataward( "hqscaptured", 0, maps\mp\_awards::highestwins );
}
