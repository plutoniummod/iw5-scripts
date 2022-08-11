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
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 65 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level.teambased = 1;
    level.initgametypeawards = ::initgametypeawards;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onnormaldeath = ::onnormaldeath;
    level.onprecachegametype = ::onprecachegametype;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "kill_confirmed";
    level.conf_fx["vanish"] = loadfx( "impacts/small_snowhit" );
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( "scr_conf_roundswitch", 0 );
    maps\mp\_utility::registerroundswitchdvar( "conf", 0, 0, 9 );
    setdynamicdvar( "scr_conf_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "conf", 1 );
    setdynamicdvar( "scr_conf_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "conf", 1 );
    setdynamicdvar( "scr_conf_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "conf", 0 );
    setdynamicdvar( "scr_conf_promode", 0 );
}

onprecachegametype()
{
    precachemodel( "prop_dogtags_friend" );
    precachemodel( "prop_dogtags_foe" );
    precacheshader( "waypoint_dogtags" );
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

    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_CONF" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_CONF" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_CONF" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_CONF" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_CONF_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_CONF_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_CONF_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_CONF_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::placespawnpoints( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_confirmed", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill_denied", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "tags_retrieved", 250 );
    level.dogtags = [];
    var_2[0] = level.gametype;
    maps\mp\gametypes\_gameobjects::main( var_2 );
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

onnormaldeath( var_0, var_1, var_2 )
{
    level thread spawndogtags( var_0, var_1 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1.team] > game["teamScores"][level.otherteam[var_1.team]] )
        var_1.finalkill = 1;
}

spawndogtags( var_0, var_1 )
{
    if ( isdefined( level.dogtags[var_0.guid] ) )
    {
        playfx( level.conf_fx["vanish"], level.dogtags[var_0.guid].curorigin );
        level.dogtags[var_0.guid] notify( "reset" );
    }
    else
    {
        var_2[0] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_2[0] setmodel( "prop_dogtags_foe" );
        var_2[1] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_2[1] setmodel( "prop_dogtags_friend" );
        var_3 = spawn( "trigger_radius", ( 0.0, 0.0, 0.0 ), 0, 32, 32 );
        level.dogtags[var_0.guid] = maps\mp\gametypes\_gameobjects::createuseobject( "any", var_3, var_2, ( 0.0, 0.0, 16.0 ) );
        maps\mp\_utility::_objective_delete( level.dogtags[var_0.guid].objidallies );
        maps\mp\_utility::_objective_delete( level.dogtags[var_0.guid].objidaxis );
        maps\mp\gametypes\_objpoints::deleteobjpoint( level.dogtags[var_0.guid].objpoints["allies"] );
        maps\mp\gametypes\_objpoints::deleteobjpoint( level.dogtags[var_0.guid].objpoints["axis"] );
        level.dogtags[var_0.guid] maps\mp\gametypes\_gameobjects::setusetime( 0 );
        level.dogtags[var_0.guid].onuse = ::onuse;
        level.dogtags[var_0.guid].victim = var_0;
        level.dogtags[var_0.guid].victimteam = var_0.pers["team"];
        level.dogtags[var_0.guid].objid = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( level.dogtags[var_0.guid].objid, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_icon( level.dogtags[var_0.guid].objid, "waypoint_dogtags" );
        level thread clearonvictimdisconnect( var_0 );
        var_0 thread tagteamupdater( level.dogtags[var_0.guid] );
    }

    var_4 = var_0.origin + ( 0.0, 0.0, 14.0 );
    level.dogtags[var_0.guid].curorigin = var_4;
    level.dogtags[var_0.guid].trigger.origin = var_4;
    level.dogtags[var_0.guid].visuals[0].origin = var_4;
    level.dogtags[var_0.guid].visuals[1].origin = var_4;
    level.dogtags[var_0.guid] maps\mp\gametypes\_gameobjects::allowuse( "any" );
    level.dogtags[var_0.guid].visuals[0] thread showtoteam( level.dogtags[var_0.guid], maps\mp\_utility::getotherteam( var_0.pers["team"] ) );
    level.dogtags[var_0.guid].visuals[1] thread showtoteam( level.dogtags[var_0.guid], var_0.pers["team"] );
    level.dogtags[var_0.guid].attacker = var_1;
    objective_position( level.dogtags[var_0.guid].objid, var_4 );
    objective_state( level.dogtags[var_0.guid].objid, "active" );
    objective_player( level.dogtags[var_0.guid].objid, var_1 getentitynumber() );
    playsoundatpos( var_4, "mp_killconfirm_tags_drop" );
    level.dogtags[var_0.guid] thread bounce();
}

showtoteam( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    self hide();

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_1 )
            self showtoplayer( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_3 in level.players )
        {
            if ( var_3.team == var_1 )
                self showtoplayer( var_3 );

            if ( var_0.victimteam == var_3.team && var_3 == var_0.attacker )
                objective_state( var_0.objid, "invisible" );
        }
    }
}

onuse( var_0 )
{
    if ( var_0.pers["team"] == self.victimteam )
    {
        self.trigger playsound( "mp_killconfirm_tags_deny" );
        var_0 maps\mp\_utility::incplayerstat( "killsdenied", 1 );
        var_0 maps\mp\_utility::incpersstat( "denied", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "denied", var_0.pers["denied"] );

        if ( self.victim == var_0 )
        {
            var_1 = "tags_retrieved";
            var_2 = &"SPLASHES_TAGS_RETRIEVED";
        }
        else
        {
            var_1 = "kill_denied";
            var_2 = &"SPLASHES_KILL_DENIED";
        }

        if ( isdefined( self.attacker ) )
            self.attacker thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DENIED_KILL", ( 1.0, 0.5, 0.5 ) );
    }
    else
    {
        self.trigger playsound( "mp_killconfirm_tags_pickup" );
        var_1 = "kill_confirmed";
        var_2 = &"SPLASHES_KILL_CONFIRMED";
        var_0 maps\mp\_utility::incplayerstat( "killsconfirmed", 1 );
        var_0 maps\mp\_utility::incpersstat( "confirmed", 1 );
        var_0 maps\mp\gametypes\_persistence::statsetchild( "round", "confirmed", var_0.pers["confirmed"] );

        if ( self.attacker != var_0 )
            self.attacker onpickup( var_1, var_2 );

        self.trigger playsoundtoplayer( game["voice"][var_0.team] + "kill_confirmed", var_0 );
        var_0 maps\mp\gametypes\_gamescore::giveteamscoreforobjective( var_0.pers["team"], 1 );
    }

    var_0 onpickup( var_1, var_2 );
    resettags();
}

onpickup( var_0, var_1, var_2 )
{
    thread maps\mp\gametypes\_rank::xpeventpopup( var_1 );
    maps\mp\gametypes\_gamescore::giveplayerscore( var_0, self, undefined, 1 );
    thread maps\mp\gametypes\_rank::giverankxp( var_0 );
}

resettags()
{
    self.attacker = undefined;
    self notify( "reset" );
    self.visuals[0] hide();
    self.visuals[1] hide();
    self.curorigin = ( 0.0, 0.0, 1000.0 );
    self.trigger.origin = ( 0.0, 0.0, 1000.0 );
    self.visuals[0].origin = ( 0.0, 0.0, 1000.0 );
    self.visuals[1].origin = ( 0.0, 0.0, 1000.0 );
    maps\mp\gametypes\_gameobjects::allowuse( "none" );
    objective_state( self.objid, "invisible" );
}

bounce()
{
    level endon( "game_ended" );
    self endon( "reset" );
    var_0 = self.curorigin;
    var_1 = self.curorigin + ( 0.0, 0.0, 12.0 );

    for (;;)
    {
        self.visuals[0] moveto( var_1, 0.5, 0.15, 0.15 );
        self.visuals[0] rotateyaw( 180, 0.5 );
        self.visuals[1] moveto( var_1, 0.5, 0.15, 0.15 );
        self.visuals[1] rotateyaw( 180, 0.5 );
        wait 0.5;
        self.visuals[0] moveto( var_0, 0.5, 0.15, 0.15 );
        self.visuals[0] rotateyaw( 180, 0.5 );
        self.visuals[1] moveto( var_0, 0.5, 0.15, 0.15 );
        self.visuals[1] rotateyaw( 180, 0.5 );
        wait 0.5;
    }
}

timeout( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self notify( "timeout" );
    self endon( "timeout" );
    level maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 30.0 );
    self.visuals[0] hide();
    self.visuals[1] hide();
    self.curorigin = ( 0.0, 0.0, 1000.0 );
    self.trigger.origin = ( 0.0, 0.0, 1000.0 );
    self.visuals[0].origin = ( 0.0, 0.0, 1000.0 );
    self.visuals[1].origin = ( 0.0, 0.0, 1000.0 );
    maps\mp\gametypes\_gameobjects::allowuse( "none" );
}

tagteamupdater( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        var_0.victimteam = self.pers["team"];
        var_0 resettags();
    }
}

clearonvictimdisconnect( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0.guid;
    var_0 waittill( "disconnect" );

    if ( isdefined( level.dogtags[var_1] ) )
    {
        level.dogtags[var_1] maps\mp\gametypes\_gameobjects::allowuse( "none" );

        if ( isdefined( level.dogtags[var_1].attacker ) )
            level.dogtags[var_1].attacker thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DENIED_KILL", ( 1.0, 0.5, 0.5 ) );

        playfx( level.conf_fx["vanish"], level.dogtags[var_1].curorigin );
        level.dogtags[var_1] notify( "reset" );
        wait 0.05;

        if ( isdefined( level.dogtags[var_1] ) )
        {
            objective_delete( level.dogtags[var_1].objid );
            level.dogtags[var_1].trigger delete();

            for ( var_2 = 0; var_2 < level.dogtags[var_1].visuals.size; var_2++ )
                level.dogtags[var_1].visuals[var_2] delete();

            level.dogtags[var_1] notify( "deleted" );
            level.dogtags[var_1] = undefined;
        }
    }
}

initgametypeawards()
{

}
