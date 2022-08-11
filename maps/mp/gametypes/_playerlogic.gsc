// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

timeuntilwavespawn( var_0 )
{
    if ( !self.hasspawned )
        return 0;

    var_1 = gettime() + var_0 * 1000;
    var_2 = level.lastwave[self.pers["team"]];
    var_3 = level.wavedelay[self.pers["team"]] * 1000;
    var_4 = ( var_1 - var_2 ) / var_3;
    var_5 = ceil( var_4 );
    var_6 = var_2 + var_5 * var_3;

    if ( isdefined( self.respawntimerstarttime ) )
    {
        var_7 = ( gettime() - self.respawntimerstarttime ) / 1000.0;

        if ( self.respawntimerstarttime < var_2 )
            return 0;
    }

    if ( isdefined( self.wavespawnindex ) )
        var_6 += 50 * self.wavespawnindex;

    return ( var_6 - gettime() ) / 1000;
}

teamkilldelay()
{
    var_0 = self.pers["teamkills"];

    if ( level.maxallowedteamkills < 0 || var_0 <= level.maxallowedteamkills )
        return 0;

    var_1 = var_0 - level.maxallowedteamkills;
    return maps\mp\gametypes\_tweakables::gettweakablevalue( "team", "teamkillspawndelay" ) * var_1;
}

timeuntilspawn( var_0 )
{
    if ( level.ingraceperiod && !self.hasspawned || level.gameended )
        return 0;

    var_1 = 0;

    if ( self.hasspawned )
    {
        var_2 = self [[ level.onrespawndelay ]]();

        if ( isdefined( var_2 ) )
            var_1 = var_2;
        else
            var_1 = getdvarint( "scr_" + level.gametype + "_playerrespawndelay" );

        if ( var_0 && isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
            var_1 += teamkilldelay();

        if ( isdefined( self.respawntimerstarttime ) )
        {
            var_3 = ( gettime() - self.respawntimerstarttime ) / 1000.0;
            var_1 -= var_3;

            if ( var_1 < 0 )
                var_1 = 0;
        }

        if ( isdefined( self.setspawnpoint ) )
            var_1 += level.tispawndelay;
    }

    var_4 = getdvarint( "scr_" + level.gametype + "_waverespawndelay" ) > 0;

    if ( var_4 )
        return timeuntilwavespawn( var_1 );

    return var_1;
}

mayspawn()
{
    if ( maps\mp\_utility::getgametypenumlives() || isdefined( level.disablespawning ) )
    {
        if ( isdefined( level.disablespawning ) && level.disablespawning )
            return 0;

        if ( isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
            return 0;

        if ( !self.pers["lives"] && maps\mp\_utility::gamehasstarted() )
            return 0;
        else if ( maps\mp\_utility::gamehasstarted() )
        {
            if ( !level.ingraceperiod && !self.hasspawned )
                return 0;
        }
    }

    return 1;
}

spawnclient()
{
    if ( isdefined( self.addtoteam ) )
    {
        maps\mp\gametypes\_menus::addtoteam( self.addtoteam );
        self.addtoteam = undefined;
    }

    if ( !mayspawn() )
    {
        var_0 = self.origin;
        var_1 = self.angles;
        self notify( "attempted_spawn" );

        if ( isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
        {
            self.pers["teamkills"] = max( self.pers["teamkills"] - 1, 0 );
            maps\mp\_utility::setlowermessage( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT" );

            if ( !self.hasspawned && self.pers["teamkills"] <= level.maxallowedteamkills )
                self.pers["teamKillPunish"] = 0;
        }
        else if ( maps\mp\_utility::isroundbased() && !maps\mp\_utility::islastround() )
        {
            maps\mp\_utility::setlowermessage( "spawn_info", game["strings"]["spawn_next_round"] );
            thread removespawnmessageshortly( 3.0 );
        }

        if ( self.sessionstate != "spectator" )
            var_0 += ( 0.0, 0.0, 60.0 );

        thread spawnspectator( var_0, var_1 );
        return;
    }

    if ( self.waitingtospawn )
        return;

    self.waitingtospawn = 1;
    waitandspawnclient();

    if ( isdefined( self ) )
        self.waitingtospawn = 0;
}

waitandspawnclient()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );
    level endon( "game_ended" );
    self notify( "attempted_spawn" );
    var_0 = 0;

    if ( isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
    {
        var_1 = teamkilldelay();

        if ( var_1 > 0 )
        {
            maps\mp\_utility::setlowermessage( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT", var_1, 1, 1 );
            thread respawn_asspectator( self.origin + ( 0.0, 0.0, 60.0 ), self.angles );
            var_0 = 1;
            wait(var_1);
            maps\mp\_utility::clearlowermessage( "friendly_fire" );
            self.respawntimerstarttime = gettime();
        }

        self.pers["teamKillPunish"] = 0;
    }
    else if ( teamkilldelay() )
        self.pers["teamkills"] = max( self.pers["teamkills"] - 1, 0 );

    if ( maps\mp\_utility::isusingremote() )
    {
        self.spawningafterremotedeath = 1;
        self waittill( "stopped_using_remote" );
    }

    if ( !isdefined( self.wavespawnindex ) && isdefined( level.waveplayerspawnindex[self.team] ) )
    {
        self.wavespawnindex = level.waveplayerspawnindex[self.team];
        level.waveplayerspawnindex[self.team]++;
    }

    var_2 = timeuntilspawn( 0 );
    thread predictabouttospawnplayerovertime( var_2 );

    if ( var_2 > 0 )
    {
        maps\mp\_utility::setlowermessage( "spawn_info", game["strings"]["waiting_to_spawn"], var_2, 1, 1 );

        if ( !var_0 )
            thread respawn_asspectator( self.origin + ( 0.0, 0.0, 60.0 ), self.angles );

        var_0 = 1;
        maps\mp\_utility::waitfortimeornotify( var_2, "force_spawn" );
        self notify( "stop_wait_safe_spawn_button" );
    }

    var_3 = getdvarint( "scr_" + level.gametype + "_waverespawndelay" ) > 0;

    if ( maps\mp\gametypes\_tweakables::gettweakablevalue( "player", "forcerespawn" ) == 0 && self.hasspawned && !var_3 && !self.wantsafespawn )
    {
        maps\mp\_utility::setlowermessage( "spawn_info", game["strings"]["press_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );

        if ( !var_0 )
            thread respawn_asspectator( self.origin + ( 0.0, 0.0, 60.0 ), self.angles );

        var_0 = 1;
        waitrespawnbutton();
    }

    self.waitingtospawn = 0;
    maps\mp\_utility::clearlowermessage( "spawn_info" );
    self.wavespawnindex = undefined;
    thread spawnplayer();
}

waitrespawnbutton()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );

    for (;;)
    {
        if ( self usebuttonpressed() )
            break;

        wait 0.05;
    }
}

removespawnmessageshortly( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    waittillframeend;
    self endon( "end_respawn" );
    wait(var_0);
    maps\mp\_utility::clearlowermessage( "spawn_info" );
}

laststandrespawnplayer()
{
    self laststandrevive();

    if ( maps\mp\_utility::_hasperk( "specialty_finalstand" ) && !level.diehardmode )
        maps\mp\_utility::_unsetperk( "specialty_finalstand" );

    if ( level.diehardmode )
        self.headicon = "";

    self setstance( "crouch" );
    self.revived = 1;
    self notify( "revive" );

    if ( isdefined( self.standardmaxhealth ) )
        self.maxhealth = self.standardmaxhealth;

    self.health = self.maxhealth;
    common_scripts\utility::_enableusability();

    if ( game["state"] == "postgame" )
        maps\mp\gametypes\_gamelogic::freezeplayerforroundend();
}

getdeathspawnpoint()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 hide();
    var_0.angles = self.angles;
    return var_0;
}

showspawnnotifies()
{
    if ( isdefined( game["defcon"] ) )
        thread maps\mp\gametypes\_hud_message::defconsplashnotify( game["defcon"], 0 );

    if ( maps\mp\_utility::isrested() )
        thread maps\mp\gametypes\_hud_message::splashnotify( "rested" );
}

predictabouttospawnplayerovertime( var_0 )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "used_predicted_spawnpoint" );
    self notify( "predicting_about_to_spawn_player" );
    self endon( "predicting_about_to_spawn_player" );

    if ( var_0 <= 0 )
        return;

    if ( var_0 > 1.0 )
        wait(var_0 - 1.0);

    predictabouttospawnplayer();
    self predictstreampos( self.predictedspawnpoint.origin + ( 0.0, 0.0, 60.0 ), self.predictedspawnpoint.angles );
    self.predictedspawnpointtime = gettime();

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        wait 0.4;
        var_2 = self.predictedspawnpoint;
        predictabouttospawnplayer();

        if ( self.predictedspawnpoint != var_2 )
        {
            self predictstreampos( self.predictedspawnpoint.origin + ( 0.0, 0.0, 60.0 ), self.predictedspawnpoint.angles );
            self.predictedspawnpointtime = gettime();
        }
    }
}

predictabouttospawnplayer()
{
    if ( timeuntilspawn( 1 ) > 1.0 )
    {
        var_0 = "mp_global_intermission";
        var_1 = getentarray( var_0, "classname" );
        self.predictedspawnpoint = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_1 );
        return;
    }

    if ( isdefined( self.setspawnpoint ) )
    {
        self.predictedspawnpoint = self.setspawnpoint;
        return;
    }

    var_2 = self [[ level.getspawnpoint ]]();
    self.predictedspawnpoint = var_2;
}

checkpredictedspawnpointcorrectness( var_0 )
{
    self notify( "used_predicted_spawnpoint" );
    self.predictedspawnpoint = undefined;
}

percentage( var_0, var_1 )
{
    return var_0 + " (" + int( var_0 / var_1 * 100 ) + "%)";
}

printpredictedspawnpointcorrectness()
{

}

getspawnorigin( var_0 )
{
    if ( !positionwouldtelefrag( var_0.origin ) )
        return var_0.origin;

    if ( !isdefined( var_0.alternates ) )
        return var_0.origin;

    foreach ( var_2 in var_0.alternates )
    {
        if ( !positionwouldtelefrag( var_2 ) )
            return var_2;
    }

    return var_0.origin;
}

tivalidationcheck()
{
    if ( !isdefined( self.setspawnpoint ) )
        return 0;

    var_0 = getentarray( "care_package", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( distance( var_2.origin, self.setspawnpoint.playerspawnpos ) > 64 )
            continue;

        if ( isdefined( var_2.owner ) )
            maps\mp\gametypes\_hud_message::playercardsplashnotify( "destroyed_insertion", var_2.owner );

        maps\mp\perks\_perkfunctions::deleteti( self.setspawnpoint );
        return 0;
    }

    return 1;
}

spawnplayer( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    self notify( "spawned" );
    self notify( "end_respawn" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( isdefined( self.setspawnpoint ) && ( isdefined( self.setspawnpoint.notti ) || tivalidationcheck() ) )
    {
        var_1 = self.setspawnpoint;

        if ( !isdefined( self.setspawnpoint.notti ) )
        {
            self playlocalsound( "tactical_spawn" );

            if ( level.teambased )
                self playsoundtoteam( "tactical_spawn", level.otherteam[self.team] );
            else
                self playsound( "tactical_spawn" );
        }

        foreach ( var_3 in level.ugvs )
        {
            if ( distancesquared( var_3.origin, var_1.playerspawnpos ) < 1024 )
                var_3 notify( "damage", 5000, var_3.owner, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "MOD_EXPLOSIVE", "", "", "", undefined, "killstreak_emp_mp" );
        }

        var_5 = self.setspawnpoint.playerspawnpos;
        var_6 = self.setspawnpoint.angles;

        if ( isdefined( self.setspawnpoint.enemytrigger ) )
            self.setspawnpoint.enemytrigger delete();

        self.setspawnpoint delete();
        var_1 = undefined;
    }
    else
    {
        var_1 = self [[ level.getspawnpoint ]]();
        var_5 = var_1.origin;
        var_6 = var_1.angles;
    }

    setspawnvariables();
    var_7 = self.hasspawned;
    self.fauxdead = undefined;

    if ( !var_0 )
    {
        self.killsthislife = [];
        updatesessionstate( "playing", "" );
        maps\mp\_utility::clearkillcamstate();
        self.cancelkillcam = 1;
        self openmenu( "killedby_card_hide" );
        self.maxhealth = maps\mp\gametypes\_tweakables::gettweakablevalue( "player", "maxhealth" );
        self.health = self.maxhealth;
        self.friendlydamage = undefined;
        self.hasspawned = 1;
        self.spawntime = gettime();
        self.wasti = !isdefined( var_1 );
        self.afk = 0;
        self.damagedplayers = [];
        self.killstreakscaler = 1;
        self.xpscaler = 1;
        self.objectivescaler = 1;
        self.clampedhealth = undefined;
        self.shielddamage = 0;
        self.shieldbullethits = 0;
        self.recentshieldxp = 0;
    }

    self.movespeedscaler = 1;
    self.inlaststand = 0;
    self.laststand = undefined;
    self.infinalstand = undefined;
    self.inc4death = undefined;
    self.disabledweapon = 0;
    self.disabledweaponswitch = 0;
    self.disabledoffhandweapons = 0;
    common_scripts\utility::resetusability();

    if ( !var_0 )
    {
        self.avoidkillstreakonspawntimer = 5.0;

        if ( self.pers["lives"] == maps\mp\_utility::getgametypenumlives() )
            addtolivescount();

        if ( self.pers["lives"] )
            self.pers["lives"]--;

        addtoalivecount();

        if ( !var_7 || maps\mp\_utility::gamehasstarted() || maps\mp\_utility::gamehasstarted() && level.ingraceperiod && self.hasdonecombat )
            removefromlivescount();

        if ( !self.wasaliveatmatchstart )
        {
            var_8 = 20;

            if ( maps\mp\_utility::gettimelimit() > 0 && var_8 < maps\mp\_utility::gettimelimit() * 60 / 4 )
                var_8 = maps\mp\_utility::gettimelimit() * 60 / 4;

            if ( level.ingraceperiod || maps\mp\_utility::gettimepassed() < var_8 * 1000 )
                self.wasaliveatmatchstart = 1;
        }
    }

    self setclientdvar( "cg_thirdPerson", "0" );
    self setdepthoffield( 0, 0, 512, 512, 4, 0 );
    self setclientdvar( "cg_fov", "65" );

    if ( isdefined( var_1 ) )
    {
        maps\mp\gametypes\_spawnlogic::finalizespawnpointchoice( var_1 );
        var_5 = getspawnorigin( var_1 );
        var_6 = var_1.angles;
    }
    else
        self.lastspawntime = gettime();

    self.spawnpos = var_5;
    self spawn( var_5, var_6 );

    if ( var_0 && isdefined( self.faux_spawn_stance ) )
    {
        self setstance( self.faux_spawn_stance );
        self.faux_spawn_stance = undefined;
    }

    [[ level.onspawnplayer ]]();

    if ( isdefined( var_1 ) )
        checkpredictedspawnpointcorrectness( var_1.origin );

    if ( !var_0 )
        maps\mp\gametypes\_missions::playerspawned();

    maps\mp\gametypes\_class::setclass( self.class );
    maps\mp\gametypes\_class::giveloadout( self.team, self.class );

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 1 );

    if ( !maps\mp\_utility::gameflag( "prematch_done" ) )
        maps\mp\_utility::freezecontrolswrapper( 1 );
    else
        maps\mp\_utility::freezecontrolswrapper( 0 );

    if ( !maps\mp\_utility::gameflag( "prematch_done" ) || !var_7 && game["state"] == "playing" )
    {
        self setclientdvar( "scr_objectiveText", maps\mp\_utility::getobjectivehinttext( self.pers["team"] ) );
        var_9 = self.pers["team"];

        if ( game["status"] == "overtime" )
            thread maps\mp\gametypes\_hud_message::oldnotifymessage( game["strings"]["overtime"], game["strings"]["overtime_hint"], undefined, ( 1.0, 0.0, 0.0 ), "mp_last_stand" );
        else if ( maps\mp\_utility::getintproperty( "useRelativeTeamColors", 0 ) )
            thread maps\mp\gametypes\_hud_message::oldnotifymessage( game["strings"][var_9 + "_name"], undefined, game["icons"][var_9] + "_blue", game["colors"]["blue"] );
        else
            thread maps\mp\gametypes\_hud_message::oldnotifymessage( game["strings"][var_9 + "_name"], undefined, game["icons"][var_9], game["colors"][var_9] );

        thread showspawnnotifies();
    }

    if ( maps\mp\_utility::getintproperty( "scr_showperksonspawn", 1 ) == 1 && game["state"] != "postgame" )
    {
        self openmenu( "perk_display" );
        thread hideperksaftertime( 4.0 );
        thread hideperksondeath();
    }

    waittillframeend;
    self.spawningafterremotedeath = undefined;
    self notify( "spawned_player" );
    level notify( "player_spawned", self );

    if ( game["state"] == "postgame" )
        maps\mp\gametypes\_gamelogic::freezeplayerforroundend();
}

hideperksaftertime( var_0 )
{
    self endon( "disconnect" );
    self endon( "perks_hidden" );
    wait(var_0);
    self openmenu( "perk_hide" );
    self notify( "perks_hidden" );
}

hideperksondeath()
{
    self endon( "disconnect" );
    self endon( "perks_hidden" );
    self waittill( "death" );
    self openmenu( "perk_hide" );
    self notify( "perks_hidden" );
}

hideperksonkill()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "perks_hidden" );
    self waittill( "killed_player" );
    self openmenu( "perk_hide" );
    self notify( "perks_hidden" );
}

spawnspectator( var_0, var_1 )
{
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "joined_spectators" );
    in_spawnspectator( var_0, var_1 );
}

respawn_asspectator( var_0, var_1 )
{
    in_spawnspectator( var_0, var_1 );
}

in_spawnspectator( var_0, var_1 )
{
    setspawnvariables();

    if ( isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" && !level.gameended )
        maps\mp\_utility::clearlowermessage( "spawn_info" );

    self.sessionstate = "spectator";
    maps\mp\_utility::clearkillcamstate();
    self.friendlydamage = undefined;

    if ( isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
        self.statusicon = "";
    else
        self.statusicon = "hud_status_dead";

    maps\mp\gametypes\_spectating::setspectatepermissions();
    onspawnspectator( var_0, var_1 );

    if ( level.teambased && !level.splitscreen && !self issplitscreenplayer() )
        self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

getplayerfromclientnum( var_0 )
{
    if ( var_0 < 0 )
        return undefined;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] getentitynumber() == var_0 )
            return level.players[var_1];
    }

    return undefined;
}

onspawnspectator( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        self setspectatedefaults( var_0, var_1 );
        self spawn( var_0, var_1 );
        checkpredictedspawnpointcorrectness( var_0 );
        return;
    }

    var_2 = "mp_global_intermission";
    var_3 = getentarray( var_2, "classname" );
    var_4 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_3 );
    self setspectatedefaults( var_4.origin, var_4.angles );
    self spawn( var_4.origin, var_4.angles );
    checkpredictedspawnpointcorrectness( var_4.origin );
}

spawnintermission()
{
    self endon( "disconnect" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    setspawnvariables();
    self closepopupmenu();
    self closeingamemenu();
    maps\mp\_utility::clearlowermessages();
    maps\mp\_utility::freezecontrolswrapper( 1 );
    self setclientdvar( "cg_everyoneHearsEveryone", 1 );

    if ( level.rankedmatch && ( self.postgamepromotion || self.pers["postGameChallenges"] ) )
    {
        if ( self.postgamepromotion )
            self playlocalsound( "mp_level_up" );
        else
            self playlocalsound( "mp_challenge_complete" );

        if ( self.postgamepromotion > level.postgamenotifies )
            level.postgamenotifies = 1;

        if ( self.pers["postGameChallenges"] > level.postgamenotifies )
            level.postgamenotifies = self.pers["postGameChallenges"];

        self closepopupmenu();
        self closeingamemenu();
        self openmenu( game["menu_endgameupdate"] );
        var_0 = 4.0 + min( self.pers["postGameChallenges"], 3 );

        while ( var_0 )
        {
            wait 0.25;
            var_0 -= 0.25;
            self openmenu( game["menu_endgameupdate"] );
        }

        self closemenu( game["menu_endgameupdate"] );
    }

    self.sessionstate = "intermission";
    maps\mp\_utility::clearkillcamstate();
    self.friendlydamage = undefined;
    var_1 = getentarray( "mp_global_intermission", "classname" );
    var_2 = var_1[0];
    self spawn( var_2.origin, var_2.angles );
    checkpredictedspawnpointcorrectness( var_2.origin );
    self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

spawnendofgame()
{
    if ( 1 )
    {
        maps\mp\_utility::freezecontrolswrapper( 1 );
        spawnspectator();
        maps\mp\_utility::freezecontrolswrapper( 1 );
        return;
    }

    self notify( "spawned" );
    self notify( "end_respawn" );
    setspawnvariables();
    self closepopupmenu();
    self closeingamemenu();
    maps\mp\_utility::clearlowermessages();
    self setclientdvar( "cg_everyoneHearsEveryone", 1 );
    self.sessionstate = "dead";
    maps\mp\_utility::clearkillcamstate();
    self.friendlydamage = undefined;
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_1 = var_0[0];
    self spawn( var_1.origin, var_1.angles );
    checkpredictedspawnpointcorrectness( var_1.origin );
    var_1 setmodel( "tag_origin" );
    self playerlinkto( var_1 );
    self playerhide();
    maps\mp\_utility::freezecontrolswrapper( 1 );
    self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

setspawnvariables()
{
    self stopshellshock();
    self stoprumble( "damage_heavy" );
}

notifyconnecting()
{
    waittillframeend;

    if ( isdefined( self ) )
        level notify( "connecting", self );
}

callback_playerdisconnect()
{
    if ( !isdefined( self.connected ) )
        return;

    var_0 = getmatchdata( "gameLength" );
    var_0 += int( maps\mp\_utility::getsecondspassed() );
    setmatchdata( "players", self.clientid, "disconnectTime", var_0 );

    if ( isdefined( self.pers["confirmed"] ) )
        maps\mp\_matchdata::logkillsconfirmed();

    if ( isdefined( self.pers["denied"] ) )
        maps\mp\_matchdata::logkillsdenied();

    removeplayerondisconnect();

    if ( !level.teambased )
        game["roundsWon"][self.guid] = undefined;

    if ( level.splitscreen )
    {
        var_1 = level.players;

        if ( var_1.size <= 1 )
            level thread maps\mp\gametypes\_gamelogic::forceend();
    }

    if ( isdefined( self.score ) && isdefined( self.pers["team"] ) )
        setplayerteamrank( self, self.clientid, self.score - 5 * self.deaths );

    var_2 = self getentitynumber();
    var_3 = self.guid;
    logprint( "Q;" + var_3 + ";" + var_2 + ";" + self.name + "\\n" );
    thread maps\mp\_events::disconnected();

    if ( level.gameended )
        maps\mp\gametypes\_gamescore::removedisconnectedplayerfromplacement();

    if ( isdefined( self.team ) )
        removefromteamcount();

    if ( self.sessionstate == "playing" )
        removefromalivecount( 1 );
    else if ( self.sessionstate == "spectator" )
        level thread maps\mp\gametypes\_gamelogic::updategameevents();
}

removeplayerondisconnect()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level.players.size - 1; var_1++ )
                level.players[var_1] = level.players[var_1 + 1];

            level.players[var_1] = undefined;
            break;
        }
    }
}

initclientdvarssplitscreenspecific()
{
    if ( level.splitscreen || self issplitscreenplayer() )
        self setclientdvars( "cg_hudGrenadeIconHeight", "37.5", "cg_hudGrenadeIconWidth", "37.5", "cg_hudGrenadeIconOffset", "75", "cg_hudGrenadePointerHeight", "18", "cg_hudGrenadePointerWidth", "37.5", "cg_hudGrenadePointerPivot", "18 40.5", "cg_fovscale", "0.75" );
    else
        self setclientdvars( "cg_hudGrenadeIconHeight", "25", "cg_hudGrenadeIconWidth", "25", "cg_hudGrenadeIconOffset", "50", "cg_hudGrenadePointerHeight", "12", "cg_hudGrenadePointerWidth", "25", "cg_hudGrenadePointerPivot", "12 27", "cg_fovscale", "1" );
}

initclientdvars()
{
    makedvarserverinfo( "cg_drawTalk", 1 );
    makedvarserverinfo( "cg_drawCrosshair", 1 );
    makedvarserverinfo( "cg_drawCrosshairNames", 1 );
    makedvarserverinfo( "cg_hudGrenadeIconMaxRangeFrag", 250 );

    if ( level.hardcoremode )
    {
        setdvar( "cg_drawTalk", 3 );
        setdvar( "cg_drawCrosshair", 0 );
        setdvar( "cg_drawCrosshairNames", 1 );
        setdvar( "cg_hudGrenadeIconMaxRangeFrag", 0 );
    }

    self setclientdvars( "cg_drawSpectatorMessages", 1, "g_compassShowEnemies", getdvar( "scr_game_forceuav" ), "cg_scoreboardPingGraph", 1 );
    initclientdvarssplitscreenspecific();

    if ( maps\mp\_utility::getgametypenumlives() )
        self setclientdvars( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0 );
    else
        self setclientdvars( "cg_deadChatWithDead", 0, "cg_deadChatWithTeam", 1, "cg_deadHearTeamLiving", 1, "cg_deadHearAllLiving", 0 );

    if ( level.teambased )
        self setclientdvars( "cg_everyonehearseveryone", 0 );

    self setclientdvar( "ui_altscene", 0 );

    if ( getdvarint( "scr_hitloc_debug" ) )
    {
        for ( var_0 = 0; var_0 < 6; var_0++ )
            self setclientdvar( "ui_hitloc_" + var_0, "" );

        self.hitlocinited = 1;
    }
}

getlowestavailableclientid()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        foreach ( var_3 in level.players )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.clientid == var_1 )
            {
                var_0 = 1;
                break;
            }

            var_0 = 0;
        }

        if ( !var_0 )
            return var_1;
    }
}

callback_playerconnect()
{
    thread notifyconnecting();
    self.statusicon = "hud_status_connecting";
    self waittill( "begin" );
    self.statusicon = "";
    var_0 = undefined;
    level notify( "connected", self );
    self.connected = 1;

    if ( self ishost() )
        level.player = self;

    if ( !level.splitscreen && !isdefined( self.pers["score"] ) )
        iprintln( &"MP_CONNECTED", self );

    self.usingonlinedataoffline = self isusingonlinedataoffline();
    initclientdvars();
    initplayerstats();

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self.guid = self getguid();
    var_1 = 0;

    if ( !isdefined( self.pers["clientid"] ) )
    {
        if ( game["clientid"] >= 30 )
            self.pers["clientid"] = getlowestavailableclientid();
        else
            self.pers["clientid"] = game["clientid"];

        if ( game["clientid"] < 30 )
            game["clientid"]++;

        var_1 = 1;
    }

    if ( var_1 )
        maps\mp\killstreaks\_killstreaks::resetadrenaline();

    self.clientid = self.pers["clientid"];
    self.pers["teamKillPunish"] = 0;
    logprint( "J;" + self.guid + ";" + self getentitynumber() + ";" + self.name + "\\n" );

    if ( game["clientid"] <= 30 && game["clientid"] != getmatchdata( "playerCount" ) )
    {
        var_2 = 0;
        var_3 = 0;
        setmatchdata( "playerCount", game["clientid"] );
        setmatchdata( "players", self.clientid, "xuid", self getxuid() );
        setmatchdata( "players", self.clientid, "gamertag", self.name );
        var_3 = self getplayerdata( "connectionIDChunkLow" );
        var_2 = self getplayerdata( "connectionIDChunkHigh" );
        setmatchdata( "players", self.clientid, "connectionIDChunkLow", var_3 );
        setmatchdata( "players", self.clientid, "connectionIDChunkHigh", var_2 );
        setmatchclientip( self, self.clientid );
        var_4 = getmatchdata( "gameLength" );
        var_4 += int( maps\mp\_utility::getsecondspassed() );
        setmatchdata( "players", self.clientid, "connectTime", var_4 );
        setmatchdata( "players", self.clientid, "startXp", self getplayerdata( "experience" ) );

        if ( maps\mp\_utility::matchmakinggame() && maps\mp\_utility::allowteamchoice() )
            setmatchdata( "players", self.clientid, "team", self.sessionteam );
    }

    if ( !level.teambased )
        game["roundsWon"][self.guid] = 0;

    self.leaderdialogqueue = [];
    self.leaderdialogactive = "";
    self.leaderdialoggroups = [];
    self.leaderdialoggroup = "";

    if ( !isdefined( self.pers["cur_kill_streak"] ) )
        self.pers["cur_kill_streak"] = 0;

    if ( !isdefined( self.pers["cur_death_streak"] ) )
        self.pers["cur_death_streak"] = 0;

    if ( !isdefined( self.pers["assistsToKill"] ) )
        self.pers["assistsToKill"] = 0;

    if ( !isdefined( self.pers["cur_kill_streak_for_nuke"] ) )
        self.pers["cur_kill_streak_for_nuke"] = 0;

    self.kill_streak = maps\mp\gametypes\_persistence::statget( "killStreak" );
    self.lastgrenadesuicidetime = -1;
    self.teamkillsthisround = 0;
    self.hasspawned = 0;
    self.waitingtospawn = 0;
    self.wantsafespawn = 0;
    self.wasaliveatmatchstart = 0;
    self.movespeedscaler = 1;
    self.killstreakscaler = 1;
    self.xpscaler = 1;
    self.objectivescaler = 1;
    self.issniper = 0;
    self.saved_actionslotdata = [];
    setrestxpgoal();

    for ( var_5 = 1; var_5 <= 4; var_5++ )
    {
        self.saved_actionslotdata[var_5] = spawnstruct();
        self.saved_actionslotdata[var_5].type = "";
        self.saved_actionslotdata[var_5].item = undefined;
    }

    thread maps\mp\_flashgrenades::monitorflash();
    waittillframeend;
    level.players[level.players.size] = self;

    if ( level.teambased )
        self updatescores();

    if ( game["state"] == "postgame" )
    {
        self.connectedpostgame = 1;

        if ( maps\mp\_utility::matchmakinggame() )
            maps\mp\gametypes\_menus::addtoteam( maps\mp\gametypes\_menus::getteamassignment(), 1 );
        else
            maps\mp\gametypes\_menus::addtoteam( "spectator", 1 );

        self setclientdvars( "cg_drawSpectatorMessages", 0 );
        spawnintermission();
    }
    else
    {
        if ( var_1 )
            maps\mp\gametypes\_gamelogic::updatelossstats( self );

        level endon( "game_ended" );

        if ( isdefined( level.hostmigrationtimer ) )
            thread maps\mp\gametypes\_hostmigration::hostmigrationtimerthink();

        if ( isdefined( level.onplayerconnectaudioinit ) )
            [[ level.onplayerconnectaudioinit ]]();

        if ( !isdefined( self.pers["team"] ) )
        {
            if ( maps\mp\_utility::matchmakinggame() )
            {
                thread spawnspectator();
                self [[ level.autoassign ]]();
                thread kickifdontspawn();
                return;
            }
            else if ( maps\mp\_utility::allowteamchoice() )
            {
                self [[ level.spectator ]]();
                maps\mp\gametypes\_menus::beginteamchoice();
            }
            else
            {
                self [[ level.spectator ]]();
                self [[ level.autoassign ]]();
                return;
            }
        }
        else
        {
            maps\mp\gametypes\_menus::addtoteam( self.pers["team"], 1 );

            if ( maps\mp\_utility::isvalidclass( self.pers["class"] ) )
            {
                thread spawnclient();
                return;
            }

            thread spawnspectator();

            if ( self.pers["team"] == "spectator" )
            {
                if ( maps\mp\_utility::allowteamchoice() )
                {
                    maps\mp\gametypes\_menus::beginteamchoice();
                    return;
                }

                self [[ level.autoassign ]]();
                return;
                return;
            }

            maps\mp\gametypes\_menus::beginclasschoice();
        }
    }
}

callback_playermigrated()
{
    if ( isdefined( self.connected ) && self.connected )
    {
        maps\mp\_utility::updateobjectivetext();
        maps\mp\_utility::updatemainmenu();

        if ( level.teambased )
            self updatescores();
    }

    if ( self ishost() )
        initclientdvarssplitscreenspecific();

    level.hostmigrationreturnedplayercount++;

    if ( level.hostmigrationreturnedplayercount >= level.players.size * 2 / 3 )
        level notify( "hostmigration_enoughplayers" );
}

addlevelstoexperience( var_0, var_1 )
{
    var_2 = maps\mp\gametypes\_rank::getrankforxp( var_0 );
    var_3 = maps\mp\gametypes\_rank::getrankinfominxp( var_2 );
    var_4 = maps\mp\gametypes\_rank::getrankinfomaxxp( var_2 );
    var_2 += ( var_0 - var_3 ) / ( var_4 - var_3 );
    var_2 += var_1;

    if ( var_2 < 0 )
    {
        var_2 = 0;
        var_5 = 0.0;
    }
    else if ( var_2 >= level.maxrank + 1.0 )
    {
        var_2 = level.maxrank;
        var_5 = 1.0;
    }
    else
    {
        var_5 = var_2 - floor( var_2 );
        var_2 = int( floor( var_2 ) );
    }

    var_3 = maps\mp\gametypes\_rank::getrankinfominxp( var_2 );
    var_4 = maps\mp\gametypes\_rank::getrankinfomaxxp( var_2 );
    return int( var_5 * ( var_4 - var_3 ) ) + var_3;
}

getrestxpcap( var_0 )
{
    var_1 = getdvarfloat( "scr_restxp_cap" );
    return addlevelstoexperience( var_0, var_1 );
}

setrestxpgoal()
{
    if ( !getdvarint( "scr_restxp_enable" ) )
    {
        self setplayerdata( "restXPGoal", 0 );
        return;
    }

    var_0 = self getrestedtime();
    var_1 = var_0 / 3600;
    var_2 = self getplayerdata( "experience" );
    var_3 = getdvarfloat( "scr_restxp_minRestTime" );
    var_4 = getdvarfloat( "scr_restxp_levelsPerDay" ) / 24.0;
    var_5 = getrestxpcap( var_2 );
    var_6 = self getplayerdata( "restXPGoal" );

    if ( var_6 < var_2 )
        var_6 = var_2;

    var_7 = var_6;
    var_8 = 0;

    if ( var_1 > var_3 )
    {
        var_8 = var_4 * var_1;
        var_6 = addlevelstoexperience( var_6, var_8 );
    }

    var_9 = "";

    if ( var_6 >= var_5 )
    {
        var_6 = var_5;
        var_9 = " (hit cap)";
    }

    self setplayerdata( "restXPGoal", var_6 );
}

forcespawn()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    wait 60.0;

    if ( self.hasspawned )
        return;

    if ( self.pers["team"] == "spectator" )
        return;

    if ( !maps\mp\_utility::isvalidclass( self.pers["class"] ) )
    {
        self.pers["class"] = "CLASS_CUSTOM1";
        self.class = self.pers["class"];
    }

    maps\mp\_utility::closemenus();
    thread spawnclient();
}

kickifdontspawn()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "attempted_spawn" );
    var_0 = getdvarfloat( "scr_kick_time", 90 );
    var_1 = getdvarfloat( "scr_kick_mintime", 45 );
    var_2 = gettime();

    if ( self ishost() )
        kickwait( 120 );
    else
        kickwait( var_0 );

    var_3 = ( gettime() - var_2 ) / 1000;

    if ( var_3 < var_0 - 0.1 && var_3 < var_1 )
        return;

    if ( self.hasspawned )
        return;

    if ( self.pers["team"] == "spectator" )
        return;

    kick( self getentitynumber(), "EXE_PLAYERKICKED_INACTIVE" );
    level thread maps\mp\gametypes\_gamelogic::updategameevents();
}

kickwait( var_0 )
{
    level endon( "game_ended" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
}

updatesessionstate( var_0, var_1 )
{
    self.sessionstate = var_0;
    self.statusicon = var_1;
}

initplayerstats()
{
    maps\mp\gametypes\_persistence::initbufferedstats();
    self.pers["lives"] = maps\mp\_utility::getgametypenumlives();

    if ( !isdefined( self.pers["deaths"] ) )
    {
        maps\mp\_utility::initpersstat( "deaths" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "deaths", 0 );
    }

    self.deaths = maps\mp\_utility::getpersstat( "deaths" );

    if ( !isdefined( self.pers["score"] ) )
    {
        maps\mp\_utility::initpersstat( "score" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "score", 0 );
    }

    self.score = maps\mp\_utility::getpersstat( "score" );

    if ( !isdefined( self.pers["suicides"] ) )
        maps\mp\_utility::initpersstat( "suicides" );

    self.suicides = maps\mp\_utility::getpersstat( "suicides" );

    if ( !isdefined( self.pers["kills"] ) )
    {
        maps\mp\_utility::initpersstat( "kills" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "kills", 0 );
    }

    self.kills = maps\mp\_utility::getpersstat( "kills" );

    if ( !isdefined( self.pers["headshots"] ) )
        maps\mp\_utility::initpersstat( "headshots" );

    self.headshots = maps\mp\_utility::getpersstat( "headshots" );

    if ( !isdefined( self.pers["assists"] ) )
        maps\mp\_utility::initpersstat( "assists" );

    self.assists = maps\mp\_utility::getpersstat( "assists" );

    if ( !isdefined( self.pers["captures"] ) )
    {
        maps\mp\_utility::initpersstat( "captures" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "captures", 0 );
    }

    self.captures = maps\mp\_utility::getpersstat( "captures" );

    if ( !isdefined( self.pers["returns"] ) )
    {
        maps\mp\_utility::initpersstat( "returns" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "returns", 0 );
    }

    self.returns = maps\mp\_utility::getpersstat( "returns" );

    if ( !isdefined( self.pers["defends"] ) )
    {
        maps\mp\_utility::initpersstat( "defends" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "defends", 0 );
    }

    self.defends = maps\mp\_utility::getpersstat( "defends" );

    if ( !isdefined( self.pers["plants"] ) )
    {
        maps\mp\_utility::initpersstat( "plants" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "plants", 0 );
    }

    self.plants = maps\mp\_utility::getpersstat( "plants" );

    if ( !isdefined( self.pers["defuses"] ) )
    {
        maps\mp\_utility::initpersstat( "defuses" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "defuses", 0 );
    }

    self.defuses = maps\mp\_utility::getpersstat( "defuses" );

    if ( !isdefined( self.pers["destructions"] ) )
    {
        maps\mp\_utility::initpersstat( "destructions" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "destructions", 0 );
    }

    self.destructions = maps\mp\_utility::getpersstat( "destructions" );

    if ( !isdefined( self.pers["confirmed"] ) )
    {
        maps\mp\_utility::initpersstat( "confirmed" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "confirmed", 0 );
    }

    self.confirmed = maps\mp\_utility::getpersstat( "confirmed" );

    if ( !isdefined( self.pers["denied"] ) )
    {
        maps\mp\_utility::initpersstat( "denied" );
        maps\mp\gametypes\_persistence::statsetchild( "round", "denied", 0 );
    }

    self.denied = maps\mp\_utility::getpersstat( "denied" );

    if ( !isdefined( self.pers["teamkills"] ) )
        maps\mp\_utility::initpersstat( "teamkills" );

    if ( !isdefined( self.pers["teamKillPunish"] ) )
        self.pers["teamKillPunish"] = 0;

    maps\mp\_utility::initpersstat( "longestStreak" );
    self.pers["lives"] = maps\mp\_utility::getgametypenumlives();
    maps\mp\gametypes\_persistence::statsetchild( "round", "killStreak", 0 );
    maps\mp\gametypes\_persistence::statsetchild( "round", "loss", 0 );
    maps\mp\gametypes\_persistence::statsetchild( "round", "win", 0 );
    maps\mp\gametypes\_persistence::statsetchild( "round", "scoreboardType", "none" );
    maps\mp\gametypes\_persistence::statsetchildbuffered( "round", "timePlayed", 0 );
}

addtoteamcount()
{
    level.teamcount[self.team]++;
    maps\mp\gametypes\_gamelogic::updategameevents();
}

removefromteamcount()
{
    level.teamcount[self.team]--;
}

addtoalivecount()
{
    level.alivecount[self.team]++;
    level.hasspawned[self.team]++;

    if ( level.alivecount["allies"] + level.alivecount["axis"] > level.maxplayercount )
        level.maxplayercount = level.alivecount["allies"] + level.alivecount["axis"];
}

removefromalivecount( var_0 )
{
    if ( isdefined( self.switching_teams ) || isdefined( var_0 ) )
    {
        removeallfromlivescount();

        if ( isdefined( self.switching_teams ) )
            self.pers["lives"] = 0;
    }

    level.alivecount[self.team]--;
    return maps\mp\gametypes\_gamelogic::updategameevents();
}

addtolivescount()
{
    level.livescount[self.team] += self.pers["lives"];
}

removefromlivescount()
{
    level.livescount[self.team]--;
    level.livescount[self.team] = int( max( 0, level.livescount[self.team] ) );
}

removeallfromlivescount()
{
    level.livescount[self.team] -= self.pers["lives"];
    level.livescount[self.team] = int( max( 0, level.livescount[self.team] ) );
}
