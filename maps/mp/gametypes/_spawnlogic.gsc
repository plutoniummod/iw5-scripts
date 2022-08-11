// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

findboxcenter( var_0, var_1 )
{
    var_2 = ( 0.0, 0.0, 0.0 );
    var_2 = var_1 - var_0;
    var_2 = ( var_2[0] / 2, var_2[1] / 2, var_2[2] / 2 ) + var_0;
    return var_2;
}

expandmins( var_0, var_1 )
{
    if ( var_0[0] > var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] > var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] > var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

expandmaxs( var_0, var_1 )
{
    if ( var_0[0] < var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] < var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] < var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

addspawnpoints( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = [];

    if ( level.teamspawnpoints[var_0].size )
        var_3 = level.teamspawnpoints[var_0];

    level.teamspawnpoints[var_0] = getspawnpointarray( var_1 );

    if ( !level.teamspawnpoints[var_0].size && !var_2 )
    {
        maps\mp\gametypes\_callbacksetup::abortlevel();
        wait 1;
        return;
    }

    if ( !isdefined( level.spawnpoints ) )
        level.spawnpoints = [];

    for ( var_4 = 0; var_4 < level.teamspawnpoints[var_0].size; var_4++ )
    {
        var_5 = level.teamspawnpoints[var_0][var_4];

        if ( !isdefined( var_5.inited ) )
        {
            var_5 spawnpointinit();
            level.spawnpoints[level.spawnpoints.size] = var_5;
        }
    }

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_6 = var_3[var_4].origin;
        level.spawnmins = expandmins( level.spawnmins, var_6 );
        level.spawnmaxs = expandmaxs( level.spawnmaxs, var_6 );
        level.teamspawnpoints[var_0][level.teamspawnpoints[var_0].size] = var_3[var_4];
    }
}

placespawnpoints( var_0 )
{
    var_1 = getspawnpointarray( var_0 );

    if ( !var_1.size )
    {
        maps\mp\gametypes\_callbacksetup::abortlevel();
        wait 1;
        return;
    }

    if ( !isdefined( level.startspawnpoints ) )
        level.startspawnpoints = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] spawnpointinit();
        level.startspawnpoints[level.startspawnpoints.size] = var_1[var_2];
    }
}

getspawnpointarray( var_0 )
{
    var_1 = getentarray( var_0, "classname" );

    if ( !isdefined( level.extraspawnpoints ) || !isdefined( level.extraspawnpoints[var_0] ) )
        return var_1;

    for ( var_2 = 0; var_2 < level.extraspawnpoints[var_0].size; var_2++ )
        var_1[var_1.size] = level.extraspawnpoints[var_0][var_2];

    return var_1;
}

expandspawnpointbounds( var_0 )
{
    var_1 = getspawnpointarray( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        level.spawnmins = expandmins( level.spawnmins, var_1[var_2].origin );
        level.spawnmaxs = expandmaxs( level.spawnmaxs, var_1[var_2].origin );
    }
}

setmapcenterforreflections()
{
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    expandspawnpointbounds( "mp_tdm_spawn_allies_start" );
    expandspawnpointbounds( "mp_tdm_spawn_axis_start" );
    level.mapcenter = findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

spawnpointinit()
{
    var_0 = self;
    var_1 = var_0.origin;
    level.spawnmins = expandmins( level.spawnmins, var_1 );
    level.spawnmaxs = expandmaxs( level.spawnmaxs, var_1 );
    var_0 placespawnpoint();
    var_0.forward = anglestoforward( var_0.angles );
    var_0.sighttracepoint = var_0.origin + ( 0.0, 0.0, 50.0 );
    var_0.lastspawnedplayer = var_0;
    var_0.lastspawntime = gettime();
    var_2 = 1024;
    var_0.outside = 1;

    if ( !bullettracepassed( var_0.sighttracepoint, var_0.sighttracepoint + ( 0, 0, var_2 ), 0, undefined ) )
    {
        var_3 = var_0.sighttracepoint + var_0.forward * 100;

        if ( !bullettracepassed( var_3, var_3 + ( 0, 0, var_2 ), 0, undefined ) )
            var_0.outside = 0;
    }

    var_4 = anglestoright( var_0.angles );
    var_0.alternates = [];
    addalternatespawnpoint( var_0, var_0.origin + var_4 * 45 );
    addalternatespawnpoint( var_0, var_0.origin - var_4 * 45 );
    spawnpointupdate( var_0 );
    var_0.inited = 1;
}

addalternatespawnpoint( var_0, var_1 )
{
    var_2 = playerphysicstrace( var_0.origin, var_0.origin + ( 0.0, 0.0, 18.0 ), 0, undefined );
    var_3 = var_2[2] - var_0.origin[2];
    var_4 = ( var_1[0], var_1[1], var_1[2] + var_3 );
    var_5 = playerphysicstrace( var_2, var_4, 0, undefined );

    if ( var_5 != var_4 )
        return;

    var_6 = playerphysicstrace( var_4, var_1 );
    var_0.alternates[var_0.alternates.size] = var_6;
}

getteamspawnpoints( var_0 )
{
    return level.teamspawnpoints[var_0];
}

getspawnpoint_final( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( var_0 ) || var_0.size == 0 )
        return undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
        var_2 = getbestweightedspawnpoint( var_0 );
    else
    {
        var_3 = getentarray( "care_package", "targetname" );

        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( isdefined( self.lastspawnpoint ) && self.lastspawnpoint == var_0[var_4] )
                continue;

            if ( positionwouldtelefrag( var_0[var_4].origin ) )
                continue;

            if ( var_3.size && !canspawn( var_0[var_4].origin ) )
                continue;

            var_2 = var_0[var_4];
            break;
        }

        if ( !isdefined( var_2 ) )
        {
            if ( isdefined( self.lastspawnpoint ) && !positionwouldtelefrag( self.lastspawnpoint.origin ) )
            {
                for ( var_4 = 0; var_4 < var_0.size; var_4++ )
                {
                    if ( var_0[var_4] == self.lastspawnpoint )
                    {
                        var_2 = var_0[var_4];
                        break;
                    }
                }
            }
        }
    }

    if ( !isdefined( var_2 ) )
    {
        if ( var_1 )
            var_2 = var_0[randomint( var_0.size )];
        else
            var_2 = var_0[0];
    }

    return var_2;
}

finalizespawnpointchoice( var_0 )
{
    var_1 = gettime();
    self.lastspawnpoint = var_0;
    self.lastspawntime = var_1;
    var_0.lastspawnedplayer = self;
    var_0.lastspawntime = var_1;
}

getbestweightedspawnpoint( var_0 )
{
    var_1 = maps\mp\_utility::getotherteam( self.team );
    var_2 = 0;

    for (;;)
    {
        var_3 = [];
        var_3[0] = var_0[0];
        var_4 = var_0[0].weight;

        for ( var_5 = 1; var_5 < var_0.size; var_5++ )
        {
            var_6 = var_0[var_5];

            if ( var_6.weight > var_4 )
            {
                var_3 = [];
                var_3[0] = var_6;
                var_4 = var_6.weight;
                continue;
            }

            if ( var_6.weight == var_4 )
                var_3[var_3.size] = var_6;
        }

        var_7 = var_3[randomint( var_3.size )];

        if ( var_2 >= 3 )
            return var_7;

        var_8 = 0;

        if ( level.teambased )
            var_8 = var_7.sights[var_1];
        else
            var_8 = var_7.sights;

        if ( var_8 > 0 )
            return var_7;

        if ( isdefined( var_7.lastsighttracetime ) && var_7.lastsighttracetime == gettime() )
            return var_7;

        var_9 = lastminutesighttraces( var_7 );

        if ( var_9 == 0 )
            return var_7;

        var_9 = adjustsightvalue( var_9 );

        if ( level.teambased )
            var_7.sights[var_1] += var_9;
        else
            var_7.sights += var_9;

        var_10 = getlospenalty() * var_9;
        var_7.weight -= var_10;
        var_7.lastsighttracetime = gettime();
        var_2++;
    }
}

getspawnpoint_random( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = randomint( var_0.size );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    if ( isdefined( self.predictedspawnpoint ) )
    {
        for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        {
            if ( var_0[var_1] == self.predictedspawnpoint )
            {
                var_4 = var_0[0];
                var_0[0] = var_0[var_1];
                var_0[var_1] = var_4;
                break;
            }
        }
    }

    return getspawnpoint_final( var_0, 0 );
}

getallotherplayers()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( !isdefined( level.players[var_1] ) )
            continue;

        var_2 = level.players[var_1];

        if ( var_2.sessionstate != "playing" || var_2 == self )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

initweights( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].weight = 0;
}

getspawnpoint_nearteam( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    spawnlogic_begin();
    initweights( var_0 );
    var_2 = 2;
    var_3 = self.team;
    var_4 = maps\mp\_utility::getotherteam( var_3 );
    var_5 = getentarray( "care_package", "targetname" );

    foreach ( var_7 in var_0 )
    {
        if ( var_7.numplayersatlastupdate > 0 )
        {
            var_8 = var_7.weighteddistsum[var_3];
            var_9 = var_7.distsum[var_4];
            var_7.weight = ( var_9 - var_2 * var_8 ) / var_7.numplayersatlastupdate;

            if ( isdefined( level.favorclosespawnent ) )
            {
                if ( !isdefined( level.favorclosespawnscalar ) )
                    level.favorclosespawnscalar = 1;

                var_10 = distance( var_7.origin, level.favorclosespawnent.origin );
                var_7.weight -= var_10 * level.favorclosespawnscalar;
            }
        }
        else
            var_7.weight = 0;

        if ( var_5.size && !canspawn( var_7.origin ) )
            var_7.weight -= 500000;
    }

    if ( isdefined( var_1 ) )
    {
        for ( var_12 = 0; var_12 < var_1.size; var_12++ )
            var_1[var_12].weight += 50000;
    }

    if ( isdefined( self.predictedspawnpoint ) && isdefined( self.predictedspawnpoint.weight ) )
        self.predictedspawnpoint.weight += 100;

    avoidsamespawn();
    avoidweapondamage( var_0 );
    avoidvisibleenemies( var_0, 1 );

    if ( isdefined( self.lastdeathpos ) && level.gametype != "dom" )
        avoidrevengespawn( var_0, self.lastdeathpos );

    var_13 = getspawnpoint_final( var_0 );
    return var_13;
}

getspawnpoint_safespawn( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    spawnlogic_begin();
    var_1 = undefined;
    var_2 = undefined;
    var_3 = maps\mp\_utility::getotherteam( self.team );

    if ( !level.teambased )
        var_3 = "all";

    var_4 = 250000;

    foreach ( var_6 in var_0 )
    {
        var_7 = var_6.mindist[var_3];

        foreach ( var_9 in level.grenades )
        {
            if ( !isdefined( var_9 ) )
                continue;

            if ( distancesquared( var_6.origin, var_9.origin ) < var_4 )
            {
                var_10 = distance( var_6.origin, var_9.origin ) - 220;

                if ( var_10 < var_7 )
                {
                    if ( var_10 < 0 )
                        var_10 = 0;

                    var_7 = var_10;
                }
            }
        }

        if ( positionwouldtelefrag( var_6.origin ) )
            var_7 -= 200;

        if ( isdefined( level.artillerydangercenters ) )
        {
            var_12 = maps\mp\killstreaks\_airstrike::getairstrikedanger( var_6.origin );

            if ( var_12 > 0 )
                var_7 = 0;
        }

        if ( level.teambased )
        {
            if ( var_6.sights[var_3] > 0 )
                var_7 = 0;
        }
        else if ( var_6.sights > 0 )
            var_7 = 0;

        if ( !isdefined( var_1 ) || var_7 > var_2 )
        {
            var_1 = var_6;
            var_2 = var_7;
        }
    }

    if ( !isdefined( var_1 ) )
    {
        var_1 = var_0[randomint( var_0.size )];
        var_1.safespawndangerdist = 500;
    }
    else
        var_1.safespawndangerdist = var_2;

    return var_1;
}

getspawnpoint_dm( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    spawnlogic_begin();
    initweights( var_0 );
    var_1 = getallotherplayers();
    var_2 = 1600;
    var_3 = 1200;

    if ( var_1.size > 0 )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            var_5 = 0;
            var_6 = 0;

            for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            {
                var_8 = distance( var_0[var_4].origin, var_1[var_7].origin );

                if ( var_8 < var_3 )
                    var_6 += ( var_3 - var_8 ) / var_3;

                var_9 = abs( var_8 - var_2 );
                var_5 += var_9;
            }

            var_10 = var_5 / var_1.size;
            var_11 = ( var_2 - var_10 ) / var_2;
            var_0[var_4].weight = var_11 - var_6 * 2 + randomfloat( 0.2 );
        }
    }

    var_12 = getentarray( "care_package", "targetname" );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( var_12.size && !canspawn( var_0[var_4].origin ) )
            var_0[var_4].weight -= 500000;
    }

    if ( isdefined( self.predictedspawnpoint ) && isdefined( self.predictedspawnpoint.weight ) )
        self.predictedspawnpoint.weight += 100;

    avoidsamespawn();
    avoidweapondamage( var_0 );
    avoidvisibleenemies( var_0, 0 );
    return getspawnpoint_final( var_0 );
}

spawnlogic_begin()
{

}

init()
{
    setupkillstreakspawnshield();
    level.spawnlogic_deaths = [];
    level.spawnlogic_spawnkills = [];
    level.players = [];
    level.grenades = [];
    level.pipebombs = [];
    level.turrets = [];
    level.helis = [];
    level.tanks = [];
    level.scramblers = [];
    level.ims = [];
    level.ugvs = [];
    level.teamspawnpoints["axis"] = [];
    level.teamspawnpoints["allies"] = [];
    level thread trackgrenades();
    level thread trackmissiles();
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );

    if ( isdefined( level.safespawns ) )
    {
        for ( var_0 = 0; var_0 < level.safespawns.size; var_0++ )
            level.safespawns[var_0] spawnpointinit();
    }
}

sightcheckcost()
{
    var_0 = 30;

    for (;;)
    {
        var_1 = getdvar( "scr_debugcost" );

        if ( var_1 == "bullet" && isdefined( level.players[0] ) )
        {
            for ( var_2 = 0; var_2 < var_0; var_2++ )
                bullettracepassed( level.players[0].origin + ( 0.0, 0.0, 50.0 ), ( 0.0, 0.0, 0.0 ), 0, undefined );
        }
        else if ( var_1 == "damagecone" && isdefined( level.players[0] ) )
        {
            for ( var_2 = 0; var_2 < var_0; var_2++ )
                level.players[0] damageconetrace( ( 0.0, 0.0, 0.0 ) );
        }
        else if ( var_1 == "sightcone" && isdefined( level.players[0] ) )
        {
            for ( var_2 = 0; var_2 < var_0; var_2++ )
                level.players[0] sightconetrace( ( 0.0, 0.0, 0.0 ) );
        }
        else
            wait 1.0;

        wait 0.05;
    }
}

watchspawnprofile()
{
    for (;;)
    {
        while ( getdvar( "scr_spawnprofile" ) == "" || getdvar( "scr_spawnprofile" ) == "0" )
            wait 0.05;

        thread spawnprofile();

        while ( getdvar( "scr_spawnprofile" ) != "" && getdvar( "scr_spawnprofile" ) != "0" )
            wait 0.05;

        level notify( "stop_spawn_profile" );
    }
}

spawnprofile()
{
    level endon( "stop_spawn_profile" );
    var_0 = spawnstruct();

    for (;;)
    {
        var_1 = getdvar( "scr_spawnprofile" );

        if ( var_1 != "allies" && var_1 != "axis" )
        {
            if ( common_scripts\utility::cointoss() )
                var_1 = "allies";
            else
                var_1 = "axis";
        }

        var_0.team = var_1;
        var_0.pers["team"] = var_1;
        var_0 getspawnpoint_nearteam( level.spawnpoints );
        wait 0.05;
    }
}

spawngraphcheck()
{
    for (;;)
    {
        if ( getdvarint( "scr_spawngraph" ) < 1 )
        {
            wait 3;
            continue;
        }

        thread spawngraph();

        while ( getdvarint( "scr_spawngraph" ) >= 1 )
        {
            wait 0.2;
            continue;
        }

        level notify( "end_spawn_graph" );
        level notify( "spawn_graph_stop_draw" );
    }
}

spawngraph()
{
    level endon( "end_spawn_graph" );
    var_0 = 20;
    var_1 = 20;
    var_2 = 0.1;
    var_3 = [];
    var_4 = getentarray( "minimap_corner", "targetname" );

    if ( var_4.size != 2 )
        return;

    var_5 = var_4[0].origin;
    var_6 = var_4[0].origin;

    if ( var_4[1].origin[0] > var_6[0] )
        var_6 = ( var_4[1].origin[0], var_6[1], var_6[2] );
    else
        var_5 = ( var_4[1].origin[0], var_5[1], var_5[2] );

    if ( var_4[1].origin[1] > var_6[1] )
        var_6 = ( var_6[0], var_4[1].origin[1], var_6[2] );
    else
        var_5 = ( var_5[0], var_4[1].origin[1], var_5[2] );

    var_7 = 0;

    for ( var_8 = 0; var_8 < var_1; var_8++ )
    {
        var_9 = var_8 / ( var_1 - 1 );

        for ( var_10 = 0; var_10 < var_0; var_10++ )
        {
            var_11 = var_10 / ( var_0 - 1 );
            var_3[var_7] = spawnstruct();
            var_3[var_7].origin = ( var_5[0] * var_11 + var_6[0] * ( 1 - var_11 ), var_5[1] * var_9 + var_6[1] * ( 1 - var_9 ), var_5[2] );
            var_3[var_7].angles = ( 0.0, 0.0, 0.0 );
            var_3[var_7].forward = anglestoforward( var_3[var_7].angles );
            var_3[var_7].sighttracepoint = var_3[var_7].origin;
            var_3[var_7].outside = 1;
            var_3[var_7].secondfloor = 0;
            var_3[var_7].fake = 1;
            var_7++;
        }
    }

    var_12 = 0;

    for (;;)
    {
        var_13 = 0;
        var_14 = 10;

        for ( var_7 = 0; var_7 < var_14; var_7++ )
        {
            if ( !level.players.size || !isdefined( level.players[0].team ) || level.players[0].team == "spectator" || !isdefined( level.players[0].class ) )
                break;

            var_15 = var_13 + var_3.size / var_14;

            if ( var_7 == var_14 - 1 )
                var_15 = var_3.size;

            while ( var_13 < var_15 )
            {
                spawnpointupdate( var_3[var_13] );
                var_13++;
            }

            wait 0.05;
        }

        if ( !level.players.size || !isdefined( level.players[0].team ) || level.players[0].team == "spectator" || !isdefined( level.players[0].class ) )
        {
            wait 1;
            continue;
        }

        level.players[0] getspawnpoint_nearteam( var_3 );

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
            setupspawngraphpoint( var_3[var_7], var_2 );

        var_12 = 1;
        level.players[0] drawspawngraph( var_3, var_0, var_1, var_2 );
        wait 0.05;
    }
}

drawspawngraph( var_0, var_1, var_2, var_3 )
{
    level notify( "spawn_graph_stop_draw" );
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        var_6 = var_5 / ( var_2 - 1 );

        for ( var_7 = 0; var_7 < var_1; var_7++ )
        {
            var_8 = var_7 / ( var_1 - 1 );

            if ( var_5 > 0 )
                thread spawngraphline( var_0[var_4], var_0[var_4 - var_1], var_3 );

            if ( var_7 > 0 )
                thread spawngraphline( var_0[var_4], var_0[var_4 - 1], var_3 );

            var_4++;
        }
    }
}

setupspawngraphpoint( var_0, var_1 )
{
    var_0.visible = 1;

    if ( var_0.weight < -1000 / var_1 )
        var_0.visible = 0;
}

spawngraphline( var_0, var_1, var_2 )
{
    if ( !var_0.visible || !var_1.visible )
        return;

    var_3 = var_0.origin + ( 0, 0, var_0.weight * var_2 + 100 );
    var_4 = var_1.origin + ( 0, 0, var_1.weight * var_2 + 100 );
    level endon( "spawn_graph_stop_draw" );

    for (;;)
    {
        wait 0.05;
        waittillframeend;
    }
}

loopbotspawns()
{
    for (;;)
    {
        if ( getdvarint( "scr_killbots" ) < 1 )
        {
            wait 3;
            continue;
        }

        if ( !isdefined( level.players ) )
        {
            wait 0.05;
            continue;
        }

        var_0 = [];

        for ( var_1 = 0; var_1 < level.players.size; var_1++ )
        {
            if ( !isdefined( level.players[var_1] ) )
                continue;

            if ( level.players[var_1].sessionstate == "playing" && issubstr( level.players[var_1].name, "bot" ) )
                var_0[var_0.size] = level.players[var_1];
        }

        if ( var_0.size > 0 )
        {
            if ( getdvarint( "scr_killbots" ) == 1 )
            {
                var_2 = var_0[randomint( var_0.size )];
                var_3 = var_0[randomint( var_0.size )];
                var_3 thread [[ level.callbackplayerdamage ]]( var_2, var_2, 1000, 0, "MOD_RIFLE_BULLET", "none", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "none", 0 );
            }
            else
            {
                var_4 = getdvarint( "scr_killbots" );
                var_5 = undefined;

                for ( var_6 = 0; var_6 < var_4; var_6++ )
                {
                    var_2 = var_0[randomint( var_0.size )];

                    for ( var_3 = var_0[randomint( var_0.size )]; isdefined( var_5 ) && var_3 == var_5; var_3 = var_0[randomint( var_0.size )] )
                    {

                    }

                    var_3 thread [[ level.callbackplayerdamage ]]( var_2, var_2, 1000, 0, "MOD_RIFLE_BULLET", "none", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "none", 0 );
                    var_5 = var_3;
                }
            }
        }

        if ( getdvarfloat( "scr_killbottimer" ) > 0.05 )
        {
            wait(getdvarfloat( "scr_killbottimer" ));
            continue;
        }

        wait 0.05;
    }
}

trackgrenades()
{
    for (;;)
    {
        level.grenades = getentarray( "grenade", "classname" );
        wait 0.05;
    }
}

trackmissiles()
{
    for (;;)
    {
        level.missiles = getentarray( "rocket", "classname" );
        wait 0.05;
    }
}

ispointvulnerable( var_0 )
{
    var_1 = self.origin + level.claymoremodelcenteroffset;
    var_2 = var_0 + ( 0.0, 0.0, 32.0 );
    var_3 = distancesquared( var_1, var_2 );
    var_4 = anglestoforward( self.angles );

    if ( var_3 < level.claymoredetectionradius * level.claymoredetectionradius )
    {
        var_5 = vectornormalize( var_2 - var_1 );
        var_6 = acos( vectordot( var_5, var_4 ) );

        if ( var_6 < level.claymoredetectionconeangle )
            return 1;
    }

    return 0;
}

avoidweapondamage( var_0 )
{
    var_1 = 100000;

    if ( getdvar( "scr_spawnpointweaponpenalty" ) != "" && getdvar( "scr_spawnpointweaponpenalty" ) != "0" )
        var_1 = getdvarfloat( "scr_spawnpointweaponpenalty" );

    var_2 = 62500;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        for ( var_4 = 0; var_4 < level.grenades.size; var_4++ )
        {
            if ( !isdefined( level.grenades[var_4] ) )
                continue;

            if ( distancesquared( var_0[var_3].origin, level.grenades[var_4].origin ) < var_2 )
                var_0[var_3].weight -= var_1;
        }

        foreach ( var_6 in level.mines )
        {
            if ( !isdefined( var_6 ) )
                continue;

            if ( distancesquared( var_0[var_3].origin, var_6.origin ) < var_2 )
                var_0[var_3].weight -= var_1;
        }

        if ( !isdefined( level.artillerydangercenters ) )
            continue;

        var_8 = maps\mp\killstreaks\_airstrike::getairstrikedanger( var_0[var_3].origin );

        if ( var_8 > 0 )
        {
            var_9 = var_8 * var_1;
            var_0[var_3].weight -= var_9;
        }
    }
}

spawnperframeupdate()
{
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( level.spawnpoints ) )
            return;

        var_0 = ( var_0 + 1 ) % level.spawnpoints.size;

        if ( getdvar( "scr_spawnpoint_forceindex" ) != "" )
            var_0 = getdvarint( "scr_spawnpoint_forceindex" );

        var_1 = level.spawnpoints[var_0];
        spawnpointupdate( var_1 );
    }
}

adjustsightvalue( var_0 )
{
    if ( var_0 <= 0 )
        return 0;

    if ( var_0 >= 1 )
        return 1;

    return var_0 * 0.5 + 0.25;
}

spawnpointupdate( var_0 )
{
    if ( level.teambased )
    {
        var_0.sights["axis"] = 0;
        var_0.sights["allies"] = 0;
    }
    else
        var_0.sights = 0;

    var_1 = var_0.forward;
    var_2 = 0;
    var_0.distsum["all"] = 0;
    var_0.distsum["allies"] = 0;
    var_0.distsum["axis"] = 0;
    var_0.weighteddistsum["all"] = 0;
    var_0.weighteddistsum["allies"] = 0;
    var_0.weighteddistsum["axis"] = 0;
    var_0.mindist["all"] = 9999999;
    var_0.mindist["allies"] = 9999999;
    var_0.mindist["axis"] = 9999999;
    var_0.numplayersatlastupdate = 0;
    var_3["all"] = 0;
    var_3["allies"] = 0;
    var_3["axis"] = 0;
    var_4["all"] = 0;
    var_4["allies"] = 0;
    var_4["axis"] = 0;
    var_5 = undefined;
    var_6 = gettime();
    var_7 = "all";
    var_8 = level.teambased;

    foreach ( var_10 in level.players )
    {
        if ( var_10.sessionstate != "playing" )
            continue;

        var_11 = var_10.origin - var_0.origin;
        var_11 = ( var_11[0], var_11[1], 0 );
        var_12 = 1.0;
        var_13 = length( var_11 );

        if ( var_8 )
            var_7 = var_10.team;

        if ( var_13 < var_0.mindist[var_7] )
            var_0.mindist[var_7] = var_13;

        if ( var_10.wasti && var_6 - var_10.spawntime < 15000 )
            var_12 *= 0.1;

        if ( var_10.issniper )
            var_12 *= 0.5;

        var_4[var_7] += var_12;
        var_0.weighteddistsum[var_7] += var_13 * var_12;
        var_0.distsum[var_7] += var_13;
        var_0.numplayersatlastupdate++;
        var_3[var_7]++;
        var_14 = anglestoforward( var_10.angles );

        if ( vectordot( var_1, var_11 ) < 0 && vectordot( var_14, var_11 ) > 0 )
            continue;

        var_15 = spawnsighttrace( var_0, var_0.sighttracepoint, var_10.origin + ( 0.0, 0.0, 50.0 ) );
        var_0.lastsighttracetime = gettime();

        if ( var_15 > 0 )
        {
            var_15 = adjustsightvalue( var_15 );

            if ( var_8 )
            {
                var_0.sights[var_7] += var_15;
                continue;
            }

            var_0.sights += var_15;
        }
    }

    var_17 = maps\mp\_utility::getfloatproperty( "scr_spawn_enemyavoiddist", 2000 );
    var_18 = 2000;

    foreach ( var_7, var_20 in var_4 )
    {
        if ( var_4[var_7] )
            var_0.weighteddistsum[var_7] = var_0.weighteddistsum[var_7] / var_4[var_7] * var_3[var_7];

        var_21 = 0;

        if ( var_0.mindist[var_7] < var_17 )
            var_21 = var_18 * ( 1 - var_0.mindist[var_7] / var_17 );

        var_0.nearbypenalty[var_7] = var_21;
    }

    foreach ( var_23 in level.tanks )
    {
        var_15 = spawnsighttrace( var_0, var_0.sighttracepoint, var_23.origin + ( 0.0, 0.0, 50.0 ) );
        var_0.lastsighttracetime = gettime();

        if ( var_15 <= 0 )
            continue;

        var_15 = adjustsightvalue( var_15 );

        if ( var_8 )
        {
            var_0.sights[var_23.team] += var_15;
            continue;
        }

        var_0.sights += var_15;
    }

    foreach ( var_26 in level.turrets )
    {
        if ( !isdefined( var_26 ) )
            continue;

        var_15 = spawnsighttrace( var_0, var_0.sighttracepoint, var_26.origin + ( 0.0, 0.0, 50.0 ) );
        var_0.lastsighttracetime = gettime();

        if ( var_15 <= 0 )
            continue;

        var_15 = adjustsightvalue( var_15 );

        if ( var_8 )
        {
            var_0.sights[var_26.team] += var_15;
            continue;
        }

        var_0.sights += var_15;
    }

    foreach ( var_29 in level.ims )
    {
        if ( !isdefined( var_29 ) )
            continue;

        if ( !isdefined( var_29.attackheightpos ) )
            continue;

        var_15 = spawnsighttrace( var_0, var_0.sighttracepoint, var_29.attackheightpos );
        var_0.lastsighttracetime = gettime();

        if ( var_15 <= 0 )
            continue;

        var_15 = adjustsightvalue( var_15 );

        if ( var_8 )
        {
            var_0.sights[var_29.team] += var_15;
            continue;
        }

        var_0.sights += var_15;
    }

    foreach ( var_32 in level.ugvs )
    {
        if ( !isdefined( var_32 ) )
            continue;

        var_15 = spawnsighttrace( var_0, var_0.sighttracepoint, var_32.origin + ( 0.0, 0.0, 50.0 ) );
        var_0.lastsighttracetime = gettime();

        if ( var_15 <= 0 )
            continue;

        var_15 = adjustsightvalue( var_15 );

        if ( var_8 )
        {
            var_0.sights[var_32.team] += var_15;
            continue;
        }

        var_0.sights += var_15;
    }
}

getlospenalty()
{
    if ( getdvar( "scr_spawnpointlospenalty" ) != "" && getdvar( "scr_spawnpointlospenalty" ) != "0" )
        return getdvarfloat( "scr_spawnpointlospenalty" );

    return 100000;
}

lastminutesighttraces( var_0 )
{
    var_1 = undefined;
    var_2 = 100000000.0;
    var_3 = undefined;
    var_4 = 100000000.0;

    foreach ( var_6 in level.players )
    {
        if ( var_6.team == self.team && level.teambased )
            continue;

        if ( var_6.sessionstate != "playing" )
            continue;

        if ( var_6 == self )
            continue;

        var_7 = distancesquared( var_0.origin, var_6.origin );

        if ( var_7 < var_2 )
        {
            var_3 = var_1;
            var_4 = var_2;
            var_1 = var_6;
            var_2 = var_7;
            continue;
        }

        if ( var_7 < var_4 )
        {
            var_3 = var_6;
            var_4 = var_7;
        }
    }

    if ( isdefined( var_1 ) )
    {
        var_9 = spawnsighttrace( var_0, var_0.sighttracepoint, var_1.origin + ( 0.0, 0.0, 50.0 ) );

        if ( var_9 > 0 )
        {
            var_9 = adjustsightvalue( var_9 );
            return var_9;
        }
    }

    if ( isdefined( var_3 ) )
    {
        var_9 = spawnsighttrace( var_0, var_0.sighttracepoint, var_3.origin + ( 0.0, 0.0, 50.0 ) );

        if ( var_9 > 0 )
        {
            var_9 = adjustsightvalue( var_9 );
            return var_9;
        }
    }

    return 0;
}

getrevengespawnpenalty()
{
    var_0 = getdvarfloat( "scr_revengespawnpenalty", 25000 );
    return var_0;
}

getrevengespawndistancesq()
{
    var_0 = getdvarfloat( "scr_revengespawndist", 1200 );
    return var_0 * var_0;
}

avoidrevengespawn( var_0, var_1 )
{
    var_2 = getrevengespawndistancesq();
    var_3 = getrevengespawnpenalty();

    foreach ( var_5 in var_0 )
    {
        var_6 = distancesquared( var_5.origin, var_1 );

        if ( var_6 < var_2 )
            var_5.weight -= var_3;
    }

    if ( isdefined( self.lastattacker ) && isdefined( self.lastattacker.origin ) )
        avoidrevengespawnstage2( var_0, self.lastattacker.origin );
}

avoidrevengespawnstage2( var_0, var_1 )
{
    var_2 = getrevengespawndistancesq();
    var_3 = getrevengespawnpenalty();

    foreach ( var_5 in var_0 )
    {
        var_6 = distancesquared( var_5.origin, var_1 );

        if ( var_6 < var_2 )
            var_5.weight -= var_3;
    }
}

avoidvisibleenemies( var_0, var_1 )
{
    var_2 = getlospenalty();
    var_3 = "axis";

    if ( self.team == "axis" )
        var_3 = "allies";

    if ( var_1 )
    {
        foreach ( var_5 in var_0 )
        {
            var_6 = var_2 * var_5.sights[var_3];
            var_5.weight -= var_6;
        }
    }
    else
    {
        foreach ( var_5 in var_0 )
        {
            var_6 = var_2 * var_5.sights;
            var_5.weight -= var_6;
        }

        var_3 = "all";
    }

    foreach ( var_5 in var_0 )
    {
        var_5.weight -= var_5.nearbypenalty[var_3];

        if ( positionwouldtelefrag( var_5.origin ) )
        {
            var_11 = 1;

            foreach ( var_13 in var_5.alternates )
            {
                if ( positionwouldtelefrag( var_13 ) )
                {
                    var_11++;
                    continue;
                }

                break;
            }

            var_6 = 100000;

            if ( var_11 < var_5.alternates.size + 1 )
            {
                var_6 = 1500 * var_11;

                if ( isdefined( self.forcespawnnearteammates ) )
                    var_6 = 0;
            }

            var_5.weight -= var_6;
        }
    }
}

avoidspawnreuse( var_0, var_1 )
{
    var_2 = gettime();
    var_3 = 10000;
    var_4 = 1048576;

    foreach ( var_6 in var_0 )
    {
        var_7 = var_6.lastspawnedplayer;

        if ( !isalive( var_7 ) )
            continue;

        if ( var_1 && var_6.lastspawnedplayer.team == self.team )
            continue;

        if ( var_6.lastspawnedplayer == self )
            continue;

        var_8 = var_2 - var_6.lastspawntime;

        if ( var_8 < var_3 )
        {
            var_9 = distancesquared( var_6.lastspawnedplayer.origin, var_6.origin );

            if ( var_9 < var_4 )
            {
                var_10 = 5000 * ( 1 - var_9 / var_4 ) * ( 1 - var_8 / var_3 );
                var_6.weight -= var_10;
            }
            else
                var_6.lastspawnedplayer = undefined;

            continue;
        }

        var_6.lastspawnedplayer = undefined;
    }
}

avoidsamespawn()
{
    var_0 = self.lastspawnpoint;

    if ( !isdefined( var_0 ) || !isdefined( var_0.weight ) )
        return;

    var_0.weight -= 1000;
}

setupkillstreakspawnshield()
{
    level.killstreakspawnshield = 5000;

    if ( getdvar( "killstreakSpawnShield" ) != "" )
    {
        var_0 = getdvarint( "killstreakSpawnShield" );

        if ( var_0 >= 0 && var_0 <= 10000 )
            level.killstreakspawnshield = var_0;
    }
}
