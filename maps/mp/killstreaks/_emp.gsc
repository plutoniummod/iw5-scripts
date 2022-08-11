// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._effect["emp_flash"] = loadfx( "explosions/emp_flash_mp" );
    level.teamemped["allies"] = 0;
    level.teamemped["axis"] = 0;
    level.empplayer = undefined;
    level.emptimeout = 60.0;
    level.emptimeremaining = int( level.emptimeout );

    if ( level.teambased )
        level thread emp_teamtracker();
    else
        level thread emp_playertracker();

    level.killstreakfuncs["emp"] = ::emp_use;
    level thread onplayerconnect();
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

        if ( level.teambased && level.teamemped[self.team] || !level.teambased && isdefined( level.empplayer ) && level.empplayer != self )
            self setempjammed( 1 );
    }
}

emp_use( var_0 )
{
    if ( !maps\mp\_utility::validateusestreak() )
        return 0;

    var_1 = self.pers["team"];
    var_2 = level.otherteam[var_1];

    if ( level.teambased )
        thread emp_jamteam( var_2 );
    else
        thread emp_jamplayers( self );

    maps\mp\_matchdata::logkillstreakevent( "emp", self.origin );
    self notify( "used_emp" );
    return 1;
}

emp_jamteam( var_0 )
{
    level endon( "game_ended" );
    thread maps\mp\_utility::teamplayercardsplash( "used_emp", self );
    level notify( "EMP_JamTeam" + var_0 );
    level endon( "EMP_JamTeam" + var_0 );

    foreach ( var_2 in level.players )
    {
        var_2 playlocalsound( "emp_activate" );

        if ( var_2.team != var_0 )
            continue;

        if ( var_2 maps\mp\_utility::_hasperk( "specialty_localjammer" ) )
            var_2 radarjamoff();
    }

    visionsetnaked( "coup_sunblind", 0.1 );
    thread empeffects();
    wait 0.1;
    visionsetnaked( "coup_sunblind", 0 );

    if ( isdefined( level.nukedetonated ) )
        visionsetnaked( level.nukevisionset, 3.0 );
    else
        visionsetnaked( "", 3.0 );

    level.teamemped[var_0] = 1;
    level notify( "emp_update" );
    level destroyactivevehicles( self, var_0 );
    level thread keepemptimeremaining();
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( level.emptimeout );
    level.teamemped[var_0] = 0;

    foreach ( var_2 in level.players )
    {
        if ( var_2.team != var_0 )
            continue;

        if ( var_2 maps\mp\_utility::_hasperk( "specialty_localjammer" ) )
            var_2 radarjamon();
    }

    level notify( "emp_update" );
}

emp_jamplayers( var_0 )
{
    level notify( "EMP_JamPlayers" );
    level endon( "EMP_JamPlayers" );

    foreach ( var_2 in level.players )
    {
        var_2 playlocalsound( "emp_activate" );

        if ( var_2 == var_0 )
            continue;

        if ( var_2 maps\mp\_utility::_hasperk( "specialty_localjammer" ) )
            var_2 radarjamoff();
    }

    visionsetnaked( "coup_sunblind", 0.1 );
    thread empeffects();
    wait 0.1;
    visionsetnaked( "coup_sunblind", 0 );

    if ( isdefined( level.nukedetonated ) )
        visionsetnaked( level.nukevisionset, 3.0 );
    else
        visionsetnaked( "", 3.0 );

    level notify( "emp_update" );
    level.empplayer = var_0;
    level.empplayer thread empplayerffadisconnect();
    level destroyactivevehicles( var_0 );
    level notify( "emp_update" );
    level thread keepemptimeremaining();
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( level.emptimeout );

    foreach ( var_2 in level.players )
    {
        if ( var_2 == var_0 )
            continue;

        if ( var_2 maps\mp\_utility::_hasperk( "specialty_localjammer" ) )
            var_2 radarjamon();
    }

    level.empplayer = undefined;
    level notify( "emp_update" );
    level notify( "emp_ended" );
}

keepemptimeremaining()
{
    level notify( "keepEMPTimeRemaining" );
    level endon( "keepEMPTimeRemaining" );
    level endon( "emp_ended" );

    for ( level.emptimeremaining = int( level.emptimeout ); level.emptimeremaining; level.emptimeremaining-- )
        wait 1.0;
}

empplayerffadisconnect()
{
    level endon( "EMP_JamPlayers" );
    level endon( "emp_ended" );
    self waittill( "disconnect" );
    level notify( "emp_update" );
}

empeffects()
{
    foreach ( var_1 in level.players )
    {
        var_2 = anglestoforward( var_1.angles );
        var_2 = ( var_2[0], var_2[1], 0 );
        var_2 = vectornormalize( var_2 );
        var_3 = 20000;
        var_4 = spawn( "script_model", var_1.origin + ( 0.0, 0.0, 8000.0 ) + var_2 * var_3 );
        var_4 setmodel( "tag_origin" );
        var_4.angles += ( 270.0, 0.0, 0.0 );
        var_4 thread empeffect( var_1 );
    }
}

empeffect( var_0 )
{
    var_0 endon( "disconnect" );
    wait 0.5;
    playfxontagforclients( level._effect["emp_flash"], self, "tag_origin", var_0 );
}

emp_teamtracker()
{
    level endon( "game_ended" );

    for (;;)
    {
        level common_scripts\utility::waittill_either( "joined_team", "emp_update" );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team == "spectator" )
                continue;

            if ( !level.teamemped[var_1.team] && !var_1 maps\mp\_utility::isemped() )
            {
                var_1 setempjammed( 0 );
                continue;
            }

            var_1 setempjammed( 1 );
        }
    }
}

emp_playertracker()
{
    level endon( "game_ended" );

    for (;;)
    {
        level common_scripts\utility::waittill_either( "joined_team", "emp_update" );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team == "spectator" )
                continue;

            if ( isdefined( level.empplayer ) && level.empplayer != var_1 )
            {
                var_1 setempjammed( 1 );
                continue;
            }

            if ( !var_1 maps\mp\_utility::isemped() )
                var_1 setempjammed( 0 );
        }
    }
}

destroyactivevehicles( var_0, var_1 )
{
    thread destroyactivehelis( var_0, var_1 );
    thread destroyactivelittlebirds( var_0, var_1 );
    thread destroyactiveturrets( var_0, var_1 );
    thread destroyactiverockets( var_0, var_1 );
    thread destroyactiveuavs( var_0, var_1 );
    thread destroyactiveimss( var_0, var_1 );
    thread destroyactiveugvs( var_0, var_1 );
    thread destroyactiveac130( var_0, var_1 );
}

destroyactivehelis( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    foreach ( var_12 in level.helis )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {
            if ( isdefined( var_12.team ) && var_12.team != var_1 )
                continue;
        }
        else if ( isdefined( var_12.owner ) && var_12.owner == var_0 )
            continue;

        var_12 notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
        wait 0.05;
    }
}

destroyactivelittlebirds( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    foreach ( var_12 in level.littlebirds )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {
            if ( isdefined( var_12.team ) && var_12.team != var_1 )
                continue;
        }
        else if ( isdefined( var_12.owner ) && var_12.owner == var_0 )
            continue;

        var_12 notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
        wait 0.05;
    }
}

destroyactiveturrets( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    foreach ( var_12 in level.turrets )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {
            if ( isdefined( var_12.team ) && var_12.team != var_1 )
                continue;
        }
        else if ( isdefined( var_12.owner ) && var_12.owner == var_0 )
            continue;

        var_12 notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
        wait 0.05;
    }
}

destroyactiverockets( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    foreach ( var_12 in level.rockets )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {
            if ( isdefined( var_12.team ) && var_12.team != var_1 )
                continue;
        }
        else if ( isdefined( var_12.owner ) && var_12.owner == var_0 )
            continue;

        playfx( level.remotemissile_fx["explode"], var_12.origin );
        var_12 delete();
        wait 0.05;
    }
}

destroyactiveuavs( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;
    var_11 = level.uavmodels;

    if ( level.teambased && isdefined( var_1 ) )
        var_11 = level.uavmodels[var_1];

    foreach ( var_13 in var_11 )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {

        }
        else if ( isdefined( var_13.owner ) && var_13.owner == var_0 )
            continue;

        var_13 notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
        wait 0.05;
    }
}

destroyactiveimss( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    foreach ( var_12 in level.ims )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {
            if ( isdefined( var_12.team ) && var_12.team != var_1 )
                continue;
        }
        else if ( isdefined( var_12.owner ) && var_12.owner == var_0 )
            continue;

        var_12 notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
        wait 0.05;
    }
}

destroyactiveugvs( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    foreach ( var_12 in level.ugvs )
    {
        if ( level.teambased && isdefined( var_1 ) )
        {
            if ( isdefined( var_12.team ) && var_12.team != var_1 )
                continue;
        }
        else if ( isdefined( var_12.owner ) && var_12.owner == var_0 )
            continue;

        var_12 notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
        wait 0.05;
    }
}

destroyactiveac130( var_0, var_1 )
{
    var_2 = "MOD_EXPLOSIVE";
    var_3 = "killstreak_emp_mp";
    var_4 = 5000;
    var_5 = ( 0.0, 0.0, 0.0 );
    var_6 = ( 0.0, 0.0, 0.0 );
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = undefined;

    if ( level.teambased && isdefined( var_1 ) )
    {
        if ( isdefined( level.ac130player ) && isdefined( level.ac130player.team ) && level.ac130player.team == var_1 )
            level.ac130.planemodel notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
    }
    else if ( isdefined( level.ac130player ) )
    {
        if ( !isdefined( level.ac130.owner ) || isdefined( level.ac130.owner ) && level.ac130.owner != var_0 )
            level.ac130.planemodel notify( "damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );
    }
}
