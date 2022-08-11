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
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;
    level.onprecachegametype = ::onprecachegametype;
    level.initgametypeawards = ::initgametypeawards;
    level.onspawnplayer = ::onspawnplayer;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "domination";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    game["dialog"]["offense_obj"] = "capture_objs";
    game["dialog"]["defense_obj"] = "capture_objs";
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "scr_dom_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "dom", 1 );
    setdynamicdvar( "scr_dom_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "dom", 1 );
    setdynamicdvar( "scr_dom_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "dom", 0 );
    setdynamicdvar( "scr_dom_promode", 0 );
}

onprecachegametype()
{
    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_captureneutral_a" );
    precacheshader( "waypoint_capture_a" );
    precacheshader( "waypoint_defend_a" );
    precacheshader( "waypoint_captureneutral_b" );
    precacheshader( "waypoint_capture_b" );
    precacheshader( "waypoint_defend_b" );
    precacheshader( "waypoint_captureneutral_c" );
    precacheshader( "waypoint_capture_c" );
    precacheshader( "waypoint_defend_c" );
    precacheshader( "waypoint_captureneutral" );
    precacheshader( "waypoint_capture" );
    precacheshader( "waypoint_defend" );
    precacheshader( "waypoint_captureneutral_a" );
    precacheshader( "waypoint_capture_a" );
    precacheshader( "waypoint_defend_a" );
    precacheshader( "waypoint_captureneutral_b" );
    precacheshader( "waypoint_capture_b" );
    precacheshader( "waypoint_defend_b" );
    precacheshader( "waypoint_captureneutral_c" );
    precacheshader( "waypoint_capture_c" );
    precacheshader( "waypoint_defend_c" );
}

onstartgametype()
{
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_DOM" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_DOM" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DOM" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DOM" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DOM_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DOM_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_DOM_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_DOM_HINT" );
    setclientnamemode( "auto_change" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_dom_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_dom_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_dom_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_dom_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    level.spawn_all = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dom_spawn" );
    level.spawn_axis_start = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dom_spawn_axis_start" );
    level.spawn_allies_start = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dom_spawn_allies_start" );
    level.startpos["allies"] = level.spawn_allies_start[0].origin;
    level.startpos["axis"] = level.spawn_axis_start[0].origin;
    level.flagbasefxid["allies"] = loadfx( maps\mp\gametypes\_teams::getteamflagfx( "allies" ) );
    level.flagbasefxid["axis"] = loadfx( maps\mp\gametypes\_teams::getteamflagfx( "axis" ) );
    var_0[0] = "dom";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 10 );
    maps\mp\gametypes\_rank::registerscoreinfo( "capture", 150 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defend_assist", 10 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assault_assist", 10 );
    thread domflags();
    thread updatedomscores();
}

getspawnpoint()
{
    var_0 = undefined;

    if ( !level.usestartspawn )
    {
        var_1 = 0;
        var_2 = 0;
        var_3 = self.pers["team"];
        var_4 = maps\mp\_utility::getotherteam( var_3 );

        for ( var_5 = 0; var_5 < level.flags.size; var_5++ )
        {
            var_6 = level.flags[var_5] getflagteam();

            if ( var_6 == var_3 )
            {
                var_1++;
                continue;
            }

            if ( var_6 == var_4 )
                var_2++;
        }

        if ( var_1 == level.flags.size )
        {
            var_7 = level.bestspawnflag[maps\mp\_utility::getotherteam( self.pers["team"] )];
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_all, getspawnsboundingflag( var_7 ) );
        }
        else if ( var_1 > 0 )
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_all, getboundaryflagspawns( var_3 ) );
        else
        {
            var_8 = undefined;

            if ( var_2 > 0 && var_2 < level.flags.size )
                var_8 = getunownedflagneareststart( var_3 );

            if ( !isdefined( var_8 ) )
                var_8 = level.bestspawnflag[self.pers["team"]];

            level.bestspawnflag[self.pers["team"]] = var_8;
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( level.spawn_all, var_8.nearbyspawns );
        }
    }

    if ( !isdefined( var_0 ) )
    {
        if ( self.pers["team"] == "axis" )
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( level.spawn_axis_start );
        else
            var_0 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( level.spawn_allies_start );
    }

    return var_0;
}

domflags()
{
    level.laststatus["allies"] = 0;
    level.laststatus["axis"] = 0;
    game["flagmodels"] = [];
    game["flagmodels"]["neutral"] = "prop_flag_neutral";
    game["flagmodels"]["allies"] = maps\mp\gametypes\_teams::getteamflagmodel( "allies" );
    game["flagmodels"]["axis"] = maps\mp\gametypes\_teams::getteamflagmodel( "axis" );
    precachemodel( game["flagmodels"]["neutral"] );
    precachemodel( game["flagmodels"]["allies"] );
    precachemodel( game["flagmodels"]["axis"] );
    precachestring( &"MP_SECURING_POSITION" );
    var_0 = getentarray( "flag_primary", "targetname" );
    var_1 = getentarray( "flag_secondary", "targetname" );

    if ( var_0.size + var_1.size < 2 )
    {
        maps\mp\gametypes\_callbacksetup::abortlevel();
        return;
    }

    level.flags = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        level.flags[level.flags.size] = var_0[var_2];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        level.flags[level.flags.size] = var_1[var_2];

    level.domflags = [];

    for ( var_2 = 0; var_2 < level.flags.size; var_2++ )
    {
        var_3 = level.flags[var_2];

        if ( isdefined( var_3.target ) )
            var_4[0] = getent( var_3.target, "targetname" );
        else
        {
            var_4[0] = spawn( "script_model", var_3.origin );
            var_4[0].angles = var_3.angles;
        }

        var_4[0] setmodel( game["flagmodels"]["neutral"] );
        var_5 = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", var_3, var_4, ( 0.0, 0.0, 100.0 ) );
        var_5 maps\mp\gametypes\_gameobjects::allowuse( "enemy" );
        var_5 maps\mp\gametypes\_gameobjects::setusetime( 10.0 );
        var_5 maps\mp\gametypes\_gameobjects::setusetext( &"MP_SECURING_POSITION" );
        var_6 = var_5 maps\mp\gametypes\_gameobjects::getlabel();
        var_5.label = var_6;
        var_5 maps\mp\gametypes\_gameobjects::set2dicon( "friendly", "waypoint_defend" + var_6 );
        var_5 maps\mp\gametypes\_gameobjects::set3dicon( "friendly", "waypoint_defend" + var_6 );
        var_5 maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_captureneutral" + var_6 );
        var_5 maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_captureneutral" + var_6 );
        var_5 maps\mp\gametypes\_gameobjects::setvisibleteam( "any" );
        var_5.onuse = ::onuse;
        var_5.onbeginuse = ::onbeginuse;
        var_5.onuseupdate = ::onuseupdate;
        var_5.onenduse = ::onenduse;
        var_7 = var_4[0].origin + ( 0.0, 0.0, 32.0 );
        var_8 = var_4[0].origin + ( 0.0, 0.0, -32.0 );
        var_9 = bullettrace( var_7, var_8, 0, undefined );
        var_10 = vectortoangles( var_9["normal"] );
        var_5.baseeffectforward = anglestoforward( var_10 );
        var_5.baseeffectright = anglestoright( var_10 );
        var_5.baseeffectpos = var_9["position"];
        level.flags[var_2].useobj = var_5;
        level.flags[var_2].adjflags = [];
        level.flags[var_2].nearbyspawns = [];
        var_5.levelflag = level.flags[var_2];
        level.domflags[level.domflags.size] = var_5;
    }

    level.bestspawnflag = [];
    level.bestspawnflag["allies"] = getunownedflagneareststart( "allies", undefined );
    level.bestspawnflag["axis"] = getunownedflagneareststart( "axis", level.bestspawnflag["allies"] );
    flagsetup();
}

getunownedflagneareststart( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < level.flags.size; var_4++ )
    {
        var_5 = level.flags[var_4];

        if ( var_5 getflagteam() != "neutral" )
            continue;

        var_6 = distancesquared( var_5.origin, level.startpos[var_0] );

        if ( ( !isdefined( var_1 ) || var_5 != var_1 ) && ( !isdefined( var_2 ) || var_6 < var_3 ) )
        {
            var_3 = var_6;
            var_2 = var_5;
        }
    }

    return var_2;
}

onbeginuse( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::getownerteam();
    self.didstatusnotify = 0;

    if ( var_1 == "neutral" )
    {
        statusdialog( "securing" + self.label, var_0.pers["team"] );
        self.objpoints[var_0.pers["team"]] thread maps\mp\gametypes\_objpoints::startflashing();
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
        var_3 = maps\mp\gametypes\_gameobjects::getownerteam();

        if ( var_3 == "neutral" )
            statusdialog( "securing" + self.label, var_0 );
        else
        {
            statusdialog( "losing" + self.label, var_3 );
            statusdialog( "securing" + self.label, var_0 );
        }

        self.didstatusnotify = 1;
    }
}

statusdialog( var_0, var_1, var_2 )
{
    var_3 = gettime();

    if ( gettime() < level.laststatus[var_1] + 5000 && ( !isdefined( var_2 ) || !var_2 ) )
        return;

    thread delayedleaderdialog( var_0, var_1 );
    level.laststatus[var_1] = gettime();
}

onenduse( var_0, var_1, var_2 )
{
    self.objpoints["allies"] thread maps\mp\gametypes\_objpoints::stopflashing();
    self.objpoints["axis"] thread maps\mp\gametypes\_objpoints::stopflashing();
}

resetflagbaseeffect()
{
    if ( isdefined( self.baseeffect ) )
        self.baseeffect delete();

    var_0 = maps\mp\gametypes\_gameobjects::getownerteam();

    if ( var_0 != "axis" && var_0 != "allies" )
        return;

    var_1 = level.flagbasefxid[var_0];
    self.baseeffect = spawnfx( var_1, self.baseeffectpos, self.baseeffectforward, self.baseeffectright );
    triggerfx( self.baseeffect );
}

onuse( var_0 )
{
    var_1 = var_0.pers["team"];
    var_2 = maps\mp\gametypes\_gameobjects::getownerteam();
    var_3 = maps\mp\gametypes\_gameobjects::getlabel();
    self.capturetime = gettime();
    maps\mp\gametypes\_gameobjects::setownerteam( var_1 );
    maps\mp\gametypes\_gameobjects::set2dicon( "enemy", "waypoint_capture" + var_3 );
    maps\mp\gametypes\_gameobjects::set3dicon( "enemy", "waypoint_capture" + var_3 );
    self.visuals[0] setmodel( game["flagmodels"][var_1] );
    resetflagbaseeffect();
    level.usestartspawn = 0;

    if ( var_2 == "neutral" )
    {
        var_4 = maps\mp\_utility::getotherteam( var_1 );
        thread maps\mp\_utility::printandsoundoneveryone( var_1, var_4, undefined, undefined, "mp_war_objective_taken", undefined, var_0 );
        statusdialog( "secured" + self.label, var_1, 1 );
        statusdialog( "enemy_has" + self.label, var_4, 1 );
    }
    else
    {
        thread maps\mp\_utility::printandsoundoneveryone( var_1, var_2, undefined, undefined, "mp_war_objective_taken", "mp_war_objective_lost", var_0 );

        if ( getteamflagcount( var_1 ) == level.flags.size )
        {
            statusdialog( "secure_all", var_1 );
            statusdialog( "lost_all", var_2 );
        }
        else
        {
            statusdialog( "secured" + self.label, var_1, 1 );
            statusdialog( "lost" + self.label, var_2, 1 );
        }

        level.bestspawnflag[var_2] = self.levelflag;
    }

    var_0 notify( "objective", "captured" );
    thread giveflagcapturexp( self.touchlist[var_1] );
}

giveflagcapturexp( var_0 )
{
    level endon( "game_ended" );
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_0[var_1[var_2]].player;
        var_3 thread maps\mp\gametypes\_hud_message::splashnotify( "capture", maps\mp\gametypes\_rank::getscoreinfovalue( "capture" ) );
        var_3 thread updatecpm();
        var_3 thread maps\mp\gametypes\_rank::giverankxp( "capture", maps\mp\gametypes\_rank::getscoreinfovalue( "capture" ) * var_3 getcapxpscale() );
        maps\mp\gametypes\_gamescore::giveplayerscore( "capture", var_3 );
        var_3 maps\mp\_utility::incplayerstat( "pointscaptured", 1 );
        var_3 maps\mp\_utility::incpersstat( "captures", 1 );
        var_3 maps\mp\gametypes\_persistence::statsetchild( "round", "captures", var_3.pers["captures"] );

        if ( var_3 != self )
            var_3 notify( "objective", "assistedCapture" );
    }

    var_3 = maps\mp\gametypes\_gameobjects::getearliestclaimplayer();
    level thread maps\mp\_utility::teamplayercardsplash( "callout_securedposition" + self.label, var_3 );
    var_3 thread maps\mp\_matchdata::loggameevent( "capture", var_3.origin );
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

updatedomscores()
{
    level endon( "game_ended" );

    while ( !level.gameended )
    {
        var_0 = getowneddomflags();

        if ( var_0.size )
        {
            for ( var_1 = 1; var_1 < var_0.size; var_1++ )
            {
                var_2 = var_0[var_1];
                var_3 = gettime() - var_2.capturetime;

                for ( var_4 = var_1 - 1; var_4 >= 0 && var_3 > gettime() - var_0[var_4].capturetime; var_4-- )
                    var_0[var_4 + 1] = var_0[var_4];

                var_0[var_4 + 1] = var_2;
            }

            foreach ( var_2 in var_0 )
            {
                var_6 = var_2 maps\mp\gametypes\_gameobjects::getownerteam();
                maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_6, 1 );
            }
        }

        if ( ( maps\mp\_utility::gettimepassed() / 1000 > 120 && var_0.size < 2 || maps\mp\_utility::gettimepassed() / 1000 > 300 && var_0.size < 3 ) && maps\mp\_utility::matchmakinggame() )
        {
            level.finalkillcam_winner = "none";
            thread maps\mp\gametypes\_gamelogic::endgame( "none", game["strings"]["time_limit_reached"] );
            return;
        }

        wait 5.0;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isplayer( var_1 ) || var_1.pers["team"] == self.pers["team"] )
        return;

    var_10 = 0;
    var_11 = 0;
    var_12 = self;

    foreach ( var_14 in var_12.touchtriggers )
    {
        if ( var_14 != level.flags[0] && var_14 != level.flags[1] && var_14 != level.flags[2] )
            continue;

        var_15 = var_14.useobj.ownerteam;
        var_16 = var_12.pers["team"];

        if ( var_15 == "neutral" )
            continue;

        if ( var_16 == var_15 )
        {
            var_10 = 1;
            var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "assault", maps\mp\gametypes\_rank::getscoreinfovalue( "assault" ) );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "assault" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "assault", var_1 );
            thread maps\mp\_matchdata::logkillevent( var_9, "defending" );
            continue;
        }

        var_11 = 1;
        var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "defend", maps\mp\gametypes\_rank::getscoreinfovalue( "defend" ) );
        var_1 thread maps\mp\gametypes\_rank::giverankxp( "defend" );
        maps\mp\gametypes\_gamescore::giveplayerscore( "defend", var_1 );
        var_1 maps\mp\_utility::incpersstat( "defends", 1 );
        var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
        thread maps\mp\_matchdata::logkillevent( var_9, "assaulting" );
    }

    foreach ( var_14 in var_1.touchtriggers )
    {
        if ( var_14 != level.flags[0] && var_14 != level.flags[1] && var_14 != level.flags[2] )
            continue;

        var_15 = var_14.useobj.ownerteam;
        var_19 = var_1.pers["team"];

        if ( var_15 == "neutral" )
            continue;

        if ( var_19 != var_15 )
        {
            if ( !var_10 )
                var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "assault", maps\mp\gametypes\_rank::getscoreinfovalue( "assault" ) );

            var_1 thread maps\mp\gametypes\_rank::giverankxp( "assault" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "assault", var_1 );
            thread maps\mp\_matchdata::logkillevent( var_9, "defending" );
        }
    }

    foreach ( var_14 in level.flags )
    {
        var_15 = var_14.useobj.ownerteam;
        var_19 = var_1.pers["team"];
        var_22 = distancesquared( var_14.origin, var_12.origin );
        var_23 = 90000;

        if ( var_19 == var_15 && var_22 < var_23 )
        {
            if ( !var_11 )
                var_1 thread maps\mp\gametypes\_hud_message::splashnotify( "defend", maps\mp\gametypes\_rank::getscoreinfovalue( "defend" ) );

            var_1 thread maps\mp\gametypes\_rank::giverankxp( "defend" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "defend", var_1 );
            thread maps\mp\_matchdata::logkillevent( var_9, "assaulting" );
        }
    }
}

getowneddomflags()
{
    var_0 = [];

    foreach ( var_2 in level.domflags )
    {
        if ( var_2 maps\mp\gametypes\_gameobjects::getownerteam() != "neutral" && isdefined( var_2.capturetime ) )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

getteamflagcount( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level.flags.size; var_2++ )
    {
        if ( level.domflags[var_2] maps\mp\gametypes\_gameobjects::getownerteam() == var_0 )
            var_1++;
    }

    return var_1;
}

getflagteam()
{
    return self.useobj maps\mp\gametypes\_gameobjects::getownerteam();
}

getboundaryflags()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.flags.size; var_1++ )
    {
        for ( var_2 = 0; var_2 < level.flags[var_1].adjflags.size; var_2++ )
        {
            if ( level.flags[var_1].useobj maps\mp\gametypes\_gameobjects::getownerteam() != level.flags[var_1].adjflags[var_2].useobj maps\mp\gametypes\_gameobjects::getownerteam() )
            {
                var_0[var_0.size] = level.flags[var_1];
                break;
            }
        }
    }

    return var_0;
}

getboundaryflagspawns( var_0 )
{
    var_1 = [];
    var_2 = getboundaryflags();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_0 ) && var_2[var_3] getflagteam() != var_0 )
            continue;

        for ( var_4 = 0; var_4 < var_2[var_3].nearbyspawns.size; var_4++ )
            var_1[var_1.size] = var_2[var_3].nearbyspawns[var_4];
    }

    return var_1;
}

getspawnsboundingflag( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level.flags.size; var_2++ )
    {
        var_3 = level.flags[var_2];

        if ( var_3 == var_0 )
            continue;

        var_4 = 0;

        for ( var_5 = 0; var_5 < var_3.adjflags.size; var_5++ )
        {
            if ( var_3.adjflags[var_5] == var_0 )
            {
                var_4 = 1;
                break;
            }
        }

        if ( !var_4 )
            continue;

        for ( var_5 = 0; var_5 < var_3.nearbyspawns.size; var_5++ )
            var_1[var_1.size] = var_3.nearbyspawns[var_5];
    }

    return var_1;
}

getownedandboundingflagspawns( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level.flags.size; var_2++ )
    {
        if ( level.flags[var_2] getflagteam() == var_0 )
        {
            for ( var_3 = 0; var_3 < level.flags[var_2].nearbyspawns.size; var_3++ )
                var_1[var_1.size] = level.flags[var_2].nearbyspawns[var_3];

            continue;
        }

        for ( var_4 = 0; var_4 < level.flags[var_2].adjflags.size; var_4++ )
        {
            if ( level.flags[var_2].adjflags[var_4] getflagteam() == var_0 )
            {
                for ( var_3 = 0; var_3 < level.flags[var_2].nearbyspawns.size; var_3++ )
                    var_1[var_1.size] = level.flags[var_2].nearbyspawns[var_3];

                break;
            }
        }
    }

    return var_1;
}

getownedflagspawns( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level.flags.size; var_2++ )
    {
        if ( level.flags[var_2] getflagteam() == var_0 )
        {
            for ( var_3 = 0; var_3 < level.flags[var_2].nearbyspawns.size; var_3++ )
                var_1[var_1.size] = level.flags[var_2].nearbyspawns[var_3];
        }
    }

    return var_1;
}

flagsetup()
{
    var_0 = [];
    var_1 = [];
    var_2 = getentarray( "flag_descriptor", "targetname" );
    var_3 = level.flags;

    for ( var_4 = 0; var_4 < level.domflags.size; var_4++ )
    {
        var_5 = undefined;
        var_6 = undefined;

        for ( var_7 = 0; var_7 < var_2.size; var_7++ )
        {
            var_8 = distance( var_3[var_4].origin, var_2[var_7].origin );

            if ( !isdefined( var_5 ) || var_8 < var_5 )
            {
                var_5 = var_8;
                var_6 = var_2[var_7];
            }
        }

        if ( !isdefined( var_6 ) )
        {
            var_0[var_0.size] = "there is no flag_descriptor in the map! see explanation in dom.gsc";
            break;
        }

        if ( isdefined( var_6.flag ) )
        {
            var_0[var_0.size] = "flag_descriptor with script_linkname \"" + var_6.script_linkname + "\" is nearby more than one flag; is there a unique descriptor near each flag?";
            continue;
        }

        var_3[var_4].descriptor = var_6;
        var_6.flag = var_3[var_4];
        var_1[var_6.script_linkname] = var_6;
    }

    if ( var_0.size == 0 )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( isdefined( var_3[var_4].descriptor.script_linkto ) )
                var_9 = strtok( var_3[var_4].descriptor.script_linkto, " " );
            else
                var_9 = [];

            for ( var_7 = 0; var_7 < var_9.size; var_7++ )
            {
                var_10 = var_1[var_9[var_7]];

                if ( !isdefined( var_10 ) || var_10.targetname != "flag_descriptor" )
                {
                    var_0[var_0.size] = "flag_descriptor with script_linkname \"" + var_3[var_4].descriptor.script_linkname + "\" linked to \"" + var_9[var_7] + "\" which does not exist as a script_linkname of any other entity with a targetname of flag_descriptor (or, if it does, that flag_descriptor has not been assigned to a flag)";
                    continue;
                }

                var_11 = var_10.flag;

                if ( var_11 == var_3[var_4] )
                {
                    var_0[var_0.size] = "flag_descriptor with script_linkname \"" + var_3[var_4].descriptor.script_linkname + "\" linked to itself";
                    continue;
                }

                var_3[var_4].adjflags[var_3[var_4].adjflags.size] = var_11;
            }
        }
    }

    var_12 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_dom_spawn" );

    for ( var_4 = 0; var_4 < var_12.size; var_4++ )
    {
        if ( isdefined( var_12[var_4].script_linkto ) )
        {
            var_13 = var_1[var_12[var_4].script_linkto];

            if ( !isdefined( var_13 ) || var_13.targetname != "flag_descriptor" )
            {
                var_0[var_0.size] = "Spawnpoint at " + var_12[var_4].origin + "\" linked to \"" + var_12[var_4].script_linkto + "\" which does not exist as a script_linkname of any entity with a targetname of flag_descriptor (or, if it does, that flag_descriptor has not been assigned to a flag)";
                continue;
            }

            var_14 = var_13.flag;
        }
        else
        {
            var_14 = undefined;
            var_15 = undefined;

            for ( var_7 = 0; var_7 < var_3.size; var_7++ )
            {
                var_8 = distancesquared( var_3[var_7].origin, var_12[var_4].origin );

                if ( !isdefined( var_14 ) || var_8 < var_15 )
                {
                    var_14 = var_3[var_7];
                    var_15 = var_8;
                }
            }
        }

        var_14.nearbyspawns[var_14.nearbyspawns.size] = var_12[var_4];
    }

    if ( var_0.size > 0 )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {

        }

        common_scripts\utility::error( "Map errors. See above" );
        maps\mp\gametypes\_callbacksetup::abortlevel();
        return;
    }
}

initgametypeawards()
{
    maps\mp\_awards::initstataward( "pointscaptured", 0, maps\mp\_awards::highestwins );
}

onspawnplayer()
{

}

updatecpm()
{
    if ( !isdefined( self.cpm ) )
    {
        self.numcaps = 0;
        self.cpm = 0;
    }

    self.numcaps++;

    if ( maps\mp\_utility::getminutespassed() < 1 )
        return;

    self.cpm = self.numcaps / maps\mp\_utility::getminutespassed();
}

getcapxpscale()
{
    if ( self.cpm < 4 )
        return 1;
    else
        return 0.25;
}
