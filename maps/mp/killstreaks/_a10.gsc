// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_WAR_AIRSTRIKE_INBOUND" );
    precachestring( &"SPLASHES_DESTROYED_A10" );
    precachestring( &"KILLSTREAKS_A10_SUPPORT" );
    precachemodel( "vehicle_a10_warthog" );
    precacheitem( "a10_30mm_mp" );
    precachempanim( "MP_A10_strafing_run" );
    precacheshader( "compass_objpoint_a10_friendly" );
    precacheshader( "compass_objpoint_a10_enemy" );
    precacheminimapicon( "compass_objpoint_a10_friendly" );
    precacheminimapicon( "compass_objpoint_a10_enemy" );
    level.a10_fx["bullet_rain"] = loadfx( "misc/warthog_volley_runner" );
    level.a10_fx["bullet_impacts"] = loadfx( "impacts/warthog_volley_runner" );
    level.a10_fx["bullet_dust"] = loadfx( "dust/wing_drop_dust" );
    level.a10_fx["afterburner"] = loadfx( "fire/jet_afterburner" );
    level.a10_fx["contrail"] = loadfx( "smoke/jet_contrail" );
    level.a10_fx["wingtip_light_green"] = loadfx( "misc/aircraft_light_wingtip_green" );
    level.a10_fx["wingtip_light_red"] = loadfx( "misc/aircraft_light_wingtip_red" );
    level.killstreakfuncs["a10_support"] = ::tryusea10strike;
    level.killstreaksetupfuncs["a10_support"] = ::a10supportsetup;
    level.a10maxhealth = 350;
    level.a10speed = 100;
    level.a10speedreduction = 75;
    level.a10startpointoffset = 5000;
    level.a10impactfxdelay = 0.5;
    level.a10damage = 200;
    level.a10damageradius = 384;
    level.a10damagedelay = 0.5;
    level.a10bulletraindelay = 0.5;
    level.a10bulletimpactsdelay = 0.5;
    level.a10earthquakemagnitude = 0.1;
    level.a10earthquakeduration = 0.5;
    level.a10earthquakedelay = 0.5;
    level.a10dirteffectradius = 350;
    level.a10shootinggroundsounddelay = 0.1;
    level.a10startpositionscalar = 2000;
}

a10supportsetup()
{
    self.useduava10 = 0;
}

tryusea10strike( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
        return 0;
    }

    if ( maps\mp\_utility::isusingremote() )
        return 0;

    if ( maps\mp\_utility::isairdenied() )
        return 0;

    if ( maps\mp\_utility::isemped() )
        return 0;

    var_2 = "a10_support";

    if ( !self.useduava10 )
    {
        self.useduava10 = 1;
        maps\mp\killstreaks\_uav::useuav( var_2 );
    }

    var_1 = selecta10strikelocation( var_0, var_2 );

    if ( !isdefined( var_1 ) || !var_1 )
        return 0;

    return 1;
}

selecta10strikelocation( var_0, var_1 )
{
    self playlocalsound( "US_KS_hqr_a10" );
    maps\mp\_utility::_beginlocationselection( var_1, "map_artillery_selector", 1, 500 );
    self endon( "stop_location_selection" );
    self waittill( "confirm_location", var_2, var_3 );
    self playlocalsound( "US_KS_a10_inbound" );
    thread finisha10strikeusage( var_0, var_2, ::calla10strike, var_3 );
    self setblurforplayer( 0, 0.3 );
    return 1;
}

finisha10strikeusage( var_0, var_1, var_2, var_3 )
{
    self notify( "used" );
    wait 0.05;
    thread maps\mp\_utility::stoplocationselection( 0 );
    self thread [[ var_2 ]]( var_0, var_1, var_3 );
    return 1;
}

calla10strike( var_0, var_1, var_2 )
{
    if ( !isdefined( self ) )
        return;

    if ( level.teambased )
    {
        var_3 = level.players;

        foreach ( var_5 in level.players )
        {
            var_6 = var_5.pers["team"];

            if ( isdefined( var_6 ) )
            {
                if ( var_6 == self.team )
                    var_5 iprintln( &"MP_WAR_AIRSTRIKE_INBOUND", self );
            }
        }
    }

    var_8 = ( 0, var_2, 0 );
    var_9 = 12000;
    var_10 = var_1 + anglestoforward( var_8 ) * ( -1 * var_9 );
    var_11 = var_1 + anglestoforward( var_8 ) * ( var_9 * 2 );
    var_10 *= ( 1.0, 1.0, 0.0 );
    var_11 *= ( 1.0, 1.0, 0.0 );
    var_12 = getbestheight( var_10, var_11 );
    var_11 += ( 0, 0, var_12 );
    var_10 += ( 0, 0, var_12 );
    self endon( "disconnect" );
    var_13 = self.lifeid;
    level thread doa10strike( var_0, self, var_13, var_1, var_10, var_11, var_8, 0 );
}

getbestheight( var_0, var_1 )
{
    var_2 = getent( "airstrikeheight", "targetname" );
    var_3 = level.spawnpoints;
    var_4 = var_3[0];

    foreach ( var_6 in var_3 )
    {
        if ( var_6.origin[2] < var_4.origin[2] )
            var_4 = var_6;
    }

    if ( isdefined( var_2 ) )
        var_8 = var_2.origin[2];
    else if ( isdefined( level.airstrikeheightscale ) )
        var_8 = 850 * level.airstrikeheightscale;
    else
        var_8 = 850;

    var_9 = var_8;
    var_10 = var_8;
    var_11 = var_4.origin[2];
    var_12 = undefined;
    var_13 = 0;

    for (;;)
    {
        var_14 = ( var_10 - var_11 ) / 2 + var_11;
        var_15 = bullettrace( var_0 + ( 0, 0, var_14 ), var_1 + ( 0, 0, var_14 ), 0, undefined );

        if ( var_15["surfacetype"] != "none" )
        {
            var_11 = var_14;
            var_13++;

            if ( var_13 > 4 && isdefined( var_12 ) )
            {
                var_8 = var_12;
                break;
            }
            else if ( var_13 > 6 )
            {
                var_8 = var_9;
                break;
            }
        }
        else
        {
            var_12 = var_14;
            var_10 = var_14;

            if ( var_14 < var_4.origin[2] + 512 )
            {
                var_8 = var_4.origin[2] + 512;
                break;
            }
        }

        wait 0.05;
    }

    var_13 = 0;

    for (;;)
    {
        wait 0.05;
        var_16 = bullettrace( var_0 + ( 0, 0, var_8 ), var_1 + ( 0, 0, var_8 ), 0, undefined );
        var_17 = bullettrace( var_0 + ( 50, 50, var_8 + 50 ), var_1 + ( 50, 50, var_8 + 50 ), 0, undefined );
        wait 0.05;
        var_18 = bullettrace( var_0 + ( -50, -50, var_8 - 50 ), var_1 + ( -50, -50, var_8 - 50 ), 0, undefined );
        var_19 = bullettrace( var_0 + ( 50, 50, var_8 - 50 ), var_1 + ( 50, 50, var_8 - 50 ), 0, undefined );
        wait 0.05;
        var_20 = bullettrace( var_0 + ( -50, -50, var_8 + 50 ), var_1 + ( -50, -50, var_8 + 50 ), 0, undefined );

        if ( var_16["surfacetype"] != "none" || var_17["surfacetype"] != "none" || var_18["surfacetype"] != "none" || var_19["surfacetype"] != "none" || var_20["surfacetype"] != "none" )
        {
            var_13++;
            var_8 += 200;

            if ( var_13 > 5 )
            {
                var_8 = var_9;
                break;
            }
        }
        else
            break;
    }

    return var_8 + 175;
}

doa10strike( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_8 = spawna10( var_1, var_4, var_5, var_3, var_7 );
    var_8.lifeid = var_0;
    var_8 playloopsound( "veh_mig29_dist_loop" );
    var_9 = level.spawnpoints;
    var_10 = var_9[0];

    foreach ( var_12 in var_9 )
    {
        if ( var_12.origin[2] > var_10.origin[2] )
            var_10 = var_12;
    }

    var_8.killcament = spawn( "script_model", ( var_8.origin[0], var_8.origin[1], var_10.origin[2] + 5000 ) );
    var_8.killcament linkto( var_8 );
    var_1.a10 = var_8;
    var_8 thread watchtimeout();
    var_8 thread watchdeath();
    var_8 endon( "death" );
    var_8 thread a10startmove();
}

watchtimeout()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self endon( "death" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 35.0 );
    self notify( "death" );
}

a10startmove()
{
    self endon( "death" );
    wait(self.initialdelay);
    var_0 = self.startpoint;
    var_1 = self.attackpoint;
    var_2 = self.endpoint;
    var_1 = ( var_1[0], var_1[1], var_0[2] - level.a10startpointoffset );
    var_3 = distance( var_0, var_1 ) * 0.5;
    var_4 = float( level.a10speed );
    var_5 = var_3 / var_4 / 60.0;
    var_6 = var_0 + vectornormalize( var_1 - var_0 ) * var_3;
    thread a10playenginefx();
    self moveto( var_6, var_5 );
    wait(var_5);
    var_3 = distance( var_0, var_1 ) * 0.5;
    var_4 = float( level.a10speed - level.a10speedreduction );
    var_5 = var_3 / var_4 / 60.0;
    self moveto( var_1, var_5 );
    thread starta10shooting( var_5 );
    thread monitorkills();
    wait(var_5);
    self notify( "stopShooting" );
    var_3 = distance2d( var_1, var_2 );
    var_4 = level.a10speed;
    var_5 = var_3 / var_4 / 60;
    self moveto( var_2, var_5 );
    var_7 = vectortoangles( var_2 - var_1 );
    self waittill( "movedone" );
    self notify( "gone" );
    wait 0.5;
    removea10();
}

a10playenginefx()
{
    self endon( "death" );
    wait 0.5;
    playfxontag( level.a10_fx["afterburner"], self, "tag_engine_right" );
    wait 0.5;
    playfxontag( level.a10_fx["afterburner"], self, "tag_engine_left" );
    wait 0.5;
    playfxontag( level.a10_fx["contrail"], self, "tag_right_wingtip" );
    wait 0.5;
    playfxontag( level.a10_fx["contrail"], self, "tag_left_wingtip" );
    wait 0.5;
    playfxontag( level.a10_fx["wingtip_light_red"], self, "tag_right_wingtip" );
    wait 0.5;
    playfxontag( level.a10_fx["wingtip_light_green"], self, "tag_left_wingtip" );
}

monitorkills()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self endon( "death" );
    self endon( "stopShooting" );

    for (;;)
    {
        self waittill( "killedPlayer" );
        self.killcount++;
    }
}

spawna10( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 += ( 0, 0, level.a10startpointoffset );
    var_5 = vectortoangles( var_2 - var_1 );
    var_6 = spawn( "script_model", var_1 );
    var_7 = spawnplane( var_0, "script_model", var_1, "compass_objpoint_a10_friendly", "compass_objpoint_a10_enemy" );

    if ( !isdefined( var_6 ) )
        return;

    var_7 linkto( var_6 );
    var_6.fakea10 = var_7;
    var_6 setmodel( "vehicle_a10_warthog" );
    var_6.health = 999999;
    var_6.maxhealth = level.a10maxhealth;
    var_6.damagetaken = 0;
    var_6.owner = var_0;
    var_6.team = var_0.team;
    var_6.killcount = 0;
    var_6.startpoint = var_1;
    var_6.endpoint = var_2;
    var_6.attackpoint = var_3;
    var_6.initialdelay = var_4;
    var_6.angles = var_5;
    return var_6;
}

starta10shooting( var_0 )
{
    self endon( "gone" );
    self endon( "death" );
    self endon( "stopShooting" );
    var_1 = level.spawnpoints;
    var_2 = var_1[0];
    var_3 = vectornormalize( self.origin - self.attackpoint ) * level.a10startpositionscalar;
    var_3 = self.attackpoint + ( var_3[0], var_3[1], 0 );
    var_4 = vectornormalize( self.origin - self.attackpoint ) * ( -1 * level.a10startpositionscalar );
    var_4 = self.attackpoint + ( var_4[0], var_4[1], 0 );
    var_5 = vectornormalize( var_4 - var_3 );
    var_6 = distance2d( var_3, var_4 ) / ( var_0 / 0.05 );
    self.a10shootingpos = ( var_3[0], var_3[1], var_2.origin[2] - 128 );
    var_7 = var_5 * var_6;
    thread playbulletrain();
    thread manageshootingloopsound();
    thread manageshootinggroundsound();
    thread a10earthquake();

    while ( var_0 > 0 )
    {
        foreach ( var_9 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_9.team != self.owner.team )
                {
                    var_10 = pointonsegmentnearesttopoint( self.origin, self.a10shootingpos, var_9.origin );

                    if ( distancesquared( var_10, var_9.origin ) < level.a10damageradius * level.a10damageradius )
                        radiusdamage( var_10, level.a10damageradius, level.a10damage, level.a10damage, self, "MOD_RIFLE_BULLET", "a10_30mm_mp" );
                }

                continue;
            }

            var_10 = pointonsegmentnearesttopoint( self.origin, self.a10shootingpos, var_9.origin );

            if ( distancesquared( var_10, var_9.origin ) < level.a10damageradius * level.a10damageradius )
                radiusdamage( var_10, level.a10damageradius, level.a10damage, level.a10damage, self, "MOD_RIFLE_BULLET", "a10_30mm_mp" );
        }

        var_12 = self gettagorigin( "tag_gun" );

        for ( var_13 = 0; var_13 < 1; var_13++ )
            magicbullet( "a10_30mm_mp", var_12, self.a10shootingpos + ( randomintrange( -100, 100 ), randomintrange( -100, 100 ), 0 ), self.owner );

        self.a10shootingpos += ( var_7[0], var_7[1], 0 );
        var_0 -= 0.05;
        wait 0.05;
    }
}

playbulletrain()
{
    self endon( "gone" );
    self endon( "death" );
    self endon( "stopShooting" );

    for (;;)
    {
        var_0 = self gettagorigin( "tag_gun" );
        var_1 = self.a10shootingpos - var_0;
        var_2 = anglestoup( var_1 );
        playfx( level.a10_fx["bullet_rain"], var_0, var_1, var_2 );
        wait(level.a10bulletraindelay);
    }
}

manageshootingloopsound()
{
    var_0 = spawn( "script_origin", self gettagorigin( "tag_gun" ) );

    if ( !isdefined( var_0 ) )
        return;

    var_0 linkto( self, "tag_gun" );
    var_0 playloopsound( "pavelow_mg_loop" );
    common_scripts\utility::waittill_any( "stopShooting", "gone", "death" );
    var_0 stoploopsound( "pavelow_mg_loop" );
    wait 0.5;
    var_0 delete();
}

manageshootinggroundsound()
{
    self endon( "death" );
    self endon( "gone" );
    self endon( "stopShooting" );

    for (;;)
    {
        level thread common_scripts\utility::play_sound_in_space( "bullet_a10warthog_default", self.a10shootingpos );
        wait(level.a10shootinggroundsounddelay);
    }
}

a10earthquake()
{
    self endon( "death" );
    self endon( "gone" );
    self endon( "stopShooting" );

    for (;;)
    {
        playrumbleonposition( "grenade_rumble", self.a10shootingpos );
        earthquake( level.a10earthquakemagnitude, level.a10earthquakeduration, self.a10shootingpos, level.a10damageradius );

        foreach ( var_1 in level.players )
        {
            if ( var_1 maps\mp\_utility::isusingremote() )
                continue;

            if ( distance( self.a10shootingpos, var_1.origin ) > level.a10dirteffectradius )
                continue;

            if ( var_1 damageconetrace( self.a10shootingpos ) )
                var_1 thread maps\mp\gametypes\_shellshock::dirteffect( self.a10shootingpos );
        }

        wait(level.a10earthquakedelay);
    }
}

watchdeath()
{
    self endon( "gone" );
    self waittill( "death" );
    thread a10destroyed();
}

a10destroyed()
{
    self endon( "gone" );

    if ( !isdefined( self ) )
        return;

    wait(randomfloatrange( 0.5, 1.5 ));
    a10explode();
}

a10explode()
{
    self notify( "explode" );
    removea10();
}

removea10()
{
    if ( isdefined( self.killcament ) )
        self.killcament delete();

    if ( isdefined( self.fakea10 ) )
        self.fakea10 delete();

    self delete();
}
