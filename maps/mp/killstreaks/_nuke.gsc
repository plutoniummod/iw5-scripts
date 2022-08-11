// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheitem( "nuke_mp" );
    precachelocationselector( "map_nuke_selector" );
    precachestring( &"MP_TACTICAL_NUKE_CALLED" );
    precachestring( &"MP_FRIENDLY_TACTICAL_NUKE" );
    precachestring( &"MP_TACTICAL_NUKE" );
    level.nukevisionset = "aftermath";
    level._effect["nuke_player"] = loadfx( "explosions/player_death_nuke" );
    level._effect["nuke_flash"] = loadfx( "explosions/player_death_nuke_flash" );
    level._effect["nuke_aftermath"] = loadfx( "dust/nuke_aftermath_mp" );
    game["strings"]["nuclear_strike"] = &"MP_TACTICAL_NUKE";
    level.killstreakfuncs["nuke"] = ::tryusenuke;
    setdvarifuninitialized( "scr_nukeTimer", 10 );
    setdvarifuninitialized( "scr_nukeCancelMode", 0 );
    level.nuketimer = getdvarint( "scr_nukeTimer" );
    level.cancelmode = getdvarint( "scr_nukeCancelMode" );
    level.teamnukeemped["allies"] = 0;
    level.teamnukeemped["axis"] = 0;
    level.nukeemptimeout = 60.0;
    level.nukeemptimeremaining = int( level.nukeemptimeout );
    level.nukeinfo = spawnstruct();
    level.nukeinfo._id_0036 = 2;
    level.nukedetonated = undefined;
    level thread nuke_empteamtracker();
    level thread onplayerconnect();
}

tryusenuke( var_0, var_1 )
{
    if ( isdefined( level.nukeincoming ) )
    {
        self iprintlnbold( &"MP_NUKE_ALREADY_INBOUND" );
        return 0;
    }

    if ( maps\mp\_utility::isusingremote() && ( !isdefined( level.gtnw ) || !level.gtnw ) )
        return 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    thread donuke( var_1 );
    self notify( "used_nuke" );
    maps\mp\_matchdata::logkillstreakevent( "nuke", self.origin );
    return 1;
}

delaythread_nuke( var_0, var_1 )
{
    level endon( "nuke_cancelled" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread [[ var_1 ]]();
}

donuke( var_0 )
{
    level endon( "nuke_cancelled" );
    level.nukeinfo.player = self;
    level.nukeinfo.team = self.pers["team"];
    level.nukeincoming = 1;
    setdvar( "ui_bomb_timer", 4 );

    if ( level.teambased )
        thread maps\mp\_utility::teamplayercardsplash( "used_nuke", self, self.team );
    else if ( !level.hardcoremode )
        self iprintlnbold( &"MP_FRIENDLY_TACTICAL_NUKE" );

    level thread delaythread_nuke( level.nuketimer - 3.3, ::nukesoundincoming );
    level thread delaythread_nuke( level.nuketimer, ::nukesoundexplosion );
    level thread delaythread_nuke( level.nuketimer, ::nukeslowmo );
    level thread delaythread_nuke( level.nuketimer, ::nukeeffects );
    level thread delaythread_nuke( level.nuketimer + 0.25, ::nukevision );
    level thread delaythread_nuke( level.nuketimer + 1.5, ::nukedeath );
    level thread delaythread_nuke( level.nuketimer + 1.5, ::nukeearthquake );
    level thread nukeaftermatheffect();
    level thread update_ui_timers();

    if ( level.cancelmode && var_0 )
        level thread cancelnukeondeath( self );

    if ( !isdefined( level.nuke_clockobject ) )
    {
        level.nuke_clockobject = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        level.nuke_clockobject hide();
    }

    if ( !isdefined( level.nuke_soundobject ) )
    {
        level.nuke_soundobject = spawn( "script_origin", ( 0.0, 0.0, 1.0 ) );
        level.nuke_soundobject hide();
    }

    for ( var_1 = level.nuketimer; var_1 > 0; var_1-- )
    {
        level.nuke_clockobject playsound( "ui_mp_nukebomb_timer" );
        wait 1.0;
    }
}

cancelnukeondeath( var_0 )
{
    var_0 common_scripts\utility::waittill_any( "death", "disconnect" );

    if ( isdefined( var_0 ) && level.cancelmode == 2 )
        var_0 thread maps\mp\killstreaks\_emp::emp_use( 0, 0 );

    setdvar( "ui_bomb_timer", 0 );
    level.nukeincoming = undefined;
    level notify( "nuke_cancelled" );
}

nukesoundincoming()
{
    level endon( "nuke_cancelled" );

    if ( isdefined( level.nuke_soundobject ) )
        level.nuke_soundobject playsound( "nuke_incoming" );
}

nukesoundexplosion()
{
    level endon( "nuke_cancelled" );

    if ( isdefined( level.nuke_soundobject ) )
    {
        level.nuke_soundobject playsound( "nuke_explosion" );
        level.nuke_soundobject playsound( "nuke_wave" );
    }
}

nukeeffects()
{
    level endon( "nuke_cancelled" );
    setdvar( "ui_bomb_timer", 0 );
    level.nukedetonated = 1;

    foreach ( var_1 in level.players )
    {
        var_2 = anglestoforward( var_1.angles );
        var_2 = ( var_2[0], var_2[1], 0 );
        var_2 = vectornormalize( var_2 );
        var_3 = 5000;
        var_4 = spawn( "script_model", var_1.origin + var_2 * var_3 );
        var_4 setmodel( "tag_origin" );
        var_4.angles = ( 0, var_1.angles[1] + 180, 90 );
        var_4 thread nukeeffect( var_1 );
    }
}

nukeeffect( var_0 )
{
    level endon( "nuke_cancelled" );
    var_0 endon( "disconnect" );
    common_scripts\utility::waitframe();
    playfxontagforclients( level._effect["nuke_flash"], self, "tag_origin", var_0 );
}

nukeaftermatheffect()
{
    level endon( "nuke_cancelled" );
    level waittill( "spawning_intermission" );
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_0 = var_0[0];
    var_1 = anglestoup( var_0.angles );
    var_2 = anglestoright( var_0.angles );
    playfx( level._effect["nuke_aftermath"], var_0.origin, var_1, var_2 );
}

nukeslowmo()
{
    level endon( "nuke_cancelled" );
    setslowmotion( 1.0, 0.25, 0.5 );
    level waittill( "nuke_death" );
    setslowmotion( 0.25, 1, 2.0 );
}

nukevision()
{
    level endon( "nuke_cancelled" );
    level.nukevisioninprogress = 1;
    visionsetnaked( "mpnuke", 3 );
    level waittill( "nuke_death" );
    visionsetnaked( level.nukevisionset, 5 );
    visionsetpain( level.nukevisionset );
}

nukedeath()
{
    level endon( "nuke_cancelled" );
    level notify( "nuke_death" );
    maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    ambientstop( 1 );

    foreach ( var_1 in level.players )
    {
        if ( level.teambased )
        {
            if ( isdefined( level.nukeinfo.team ) && var_1.team == level.nukeinfo.team )
                continue;
        }
        else if ( isdefined( level.nukeinfo.player ) && var_1 == level.nukeinfo.player )
            continue;

        var_1.nuked = 1;

        if ( isalive( var_1 ) )
            var_1 thread maps\mp\gametypes\_damage::finishplayerdamagewrapper( level.nukeinfo.player, level.nukeinfo.player, 999999, 0, "MOD_EXPLOSIVE", "nuke_mp", var_1.origin, var_1.origin, "none", 0, 0 );
    }

    level thread nuke_empjam();
    level.nukeincoming = undefined;
}

nukeearthquake()
{
    level endon( "nuke_cancelled" );
    level waittill( "nuke_death" );
}

nuke_empjam()
{
    level endon( "game_ended" );
    level maps\mp\killstreaks\_emp::destroyactivevehicles( level.nukeinfo.player, maps\mp\_utility::getotherteam( level.nukeinfo.team ) );
    level notify( "nuke_EMPJam" );
    level endon( "nuke_EMPJam" );

    if ( level.teambased )
        level.teamnukeemped[maps\mp\_utility::getotherteam( level.nukeinfo.team )] = 1;
    else
    {
        level.teamnukeemped[level.nukeinfo.team] = 1;
        level.teamnukeemped[maps\mp\_utility::getotherteam( level.nukeinfo.team )] = 1;
    }

    level notify( "nuke_emp_update" );
    level thread keepnukeemptimeremaining();
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( level.nukeemptimeout );

    if ( level.teambased )
        level.teamnukeemped[maps\mp\_utility::getotherteam( level.nukeinfo.team )] = 0;
    else
    {
        level.teamnukeemped[level.nukeinfo.team] = 0;
        level.teamnukeemped[maps\mp\_utility::getotherteam( level.nukeinfo.team )] = 0;
    }

    foreach ( var_1 in level.players )
    {
        if ( level.teambased && var_1.team == level.nukeinfo.team )
            continue;

        var_1.nuked = undefined;
    }

    level notify( "nuke_emp_update" );
    level notify( "nuke_emp_ended" );
}

keepnukeemptimeremaining()
{
    level notify( "keepNukeEMPTimeRemaining" );
    level endon( "keepNukeEMPTimeRemaining" );
    level endon( "nuke_emp_ended" );

    for ( level.nukeemptimeremaining = int( level.nukeemptimeout ); level.nukeemptimeremaining; level.nukeemptimeremaining-- )
        wait 1.0;
}

nuke_empteamtracker()
{
    level endon( "game_ended" );

    for (;;)
    {
        level common_scripts\utility::waittill_either( "joined_team", "nuke_emp_update" );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team == "spectator" )
                continue;

            if ( level.teambased )
            {
                if ( isdefined( level.nukeinfo.team ) && var_1.team == level.nukeinfo.team )
                    continue;
            }
            else if ( isdefined( level.nukeinfo.player ) && var_1 == level.nukeinfo.player )
                continue;

            if ( !level.teamnukeemped[var_1.team] && !var_1 maps\mp\_utility::isemped() )
            {
                var_1 setempjammed( 0 );
                continue;
            }

            var_1 setempjammed( 1 );
        }
    }
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( level.teamnukeemped[self.team] )
        {
            if ( level.teambased )
                self setempjammed( 1 );
            else if ( !isdefined( level.nukeinfo.player ) || isdefined( level.nukeinfo.player ) && self != level.nukeinfo.player )
                self setempjammed( 1 );
        }

        if ( isdefined( level.nukedetonated ) )
            self visionsetnakedforplayer( level.nukevisionset, 0 );
    }
}

update_ui_timers()
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "nuke_cancelled" );
    level endon( "nuke_death" );
    var_0 = level.nuketimer * 1000 + gettime();
    setdvar( "ui_nuke_end_milliseconds", var_0 );
    level waittill( "host_migration_begin" );
    var_1 = maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

    if ( var_1 > 0 )
        setdvar( "ui_nuke_end_milliseconds", var_0 + var_1 );
}
