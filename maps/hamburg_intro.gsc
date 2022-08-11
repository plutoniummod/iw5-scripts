// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7F12()
{
    if ( isdefined( level._id_7F12 ) )
        return;

    level._id_7F12 = 1;
    level._id_13AC = 1;
    maps\_utility::_id_1A5A( "allies", ::_id_7F15 );
    var_0 = getentarray( "intro_rocket", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_7F4C );
    var_1 = getentarray( "activate_on_vehiclenode_trigger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::_id_7F4D );
    maps\_utility::_id_27CB( "intro_rocket", ::_id_7F1E );
    maps\_utility::_id_27CB( "nearby_hovercraft", ::_id_7F18 );
    maps\_utility::_id_27CB( "distant_hovercraft", ::_id_7F1B );
    precacherumble( "damage_heavy" );
    precacherumble( "damage_light" );
    precacherumble( "grenade_rumble" );
    thread _id_7F13();
}

_id_7F13()
{
    var_0 = common_scripts\utility::getstruct( "rockety_dodge", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread _id_7F14();
    var_2 = maps\_vehicle::_id_2A9A( "dodgy_rocket" );
    common_scripts\utility::array_thread( var_2, ::_id_7F1E );
}

_id_7F14()
{
    wait 0.5;

    for ( var_0 = 0; var_0 < 14; var_0++ )
    {
        playfxontag( common_scripts\utility::getfx( "flares_rockety_dodge" ), self, "tag_light_belly" );
        wait 0.05;
    }
}

_id_7F15()
{
    if ( !isdefined( self._id_134B ) )
        return;

    maps\_utility::_id_139E();
}

_id_577D()
{
    common_scripts\utility::flag_set( "intro_complete" );
    level notify( "kill_color_replacements" );
    level._id_13A9 = undefined;
    level._id_7ED0 = undefined;
    level._id_13AC = undefined;
}
#using_animtree("vehicles");

_id_7F16()
{
    setsaveddvar( "sm_sunsamplesizenear", 1.0 );
    var_0 = getvehiclenode( "hover_craft_one_exit", "targetname" );
    var_1 = level._id_7E04;
    var_2 = getvehiclenode( "tank_track_e1_a_pre", "targetname" );

    if ( isdefined( var_2 ) )
    {
        var_1._id_291A = var_2;
        var_1 attachpath( var_2 );
    }

    var_3 = maps\_vehicle::_id_2A99( "craft_2_tank2" );
    maps\_utility::_id_282D( var_3, "craft_2_tank2" );
    var_4 = maps\_vehicle::_id_2881( "hover_craft_one" );
    var_4 maps\hamburg_hovercraft_code::_id_7EC0();
    level._id_7F17 = var_4;
    var_4 vehicle_setspeed( 0, 100 );
    var_4 setanim( %hovercraft_rocking );
    var_4 maps\_vehicle::_id_2A12();
    var_3 maps\_vehicle::_id_2A12();
    var_1 maps\_vehicle::_id_2A12();
    var_4 maps\hamburg_hovercraft_code::_id_7EBA( var_1, var_3 );
    var_5 = var_1 maps\_vehicle::get_dummy();
}

_id_7F18()
{
    waittillframeend;
    self._id_7F19 = 1;
    self._id_7F1A = 1;
    var_0 = self._id_29C7;
    var_0._id_7E33["water_big"] = common_scripts\utility::getfx( "hovercraft_side_spray" );
    _id_7F1C();
}

_id_7F1B()
{
    _id_7F1C();
}

_id_7F1C()
{
    if ( !isdefined( level._id_7F1D ) )
        level._id_7F1D = [];

    level._id_7F1D[level._id_7F1D.size] = self;
}

_id_7F1E()
{
    self setmodel( "projectile_rpg7" );
    var_0 = common_scripts\utility::getfx( "rpg_trail" );
    playfxontag( var_0, self, "tag_origin" );

    if ( isdefined( self.script_sound ) )
    {
        if ( isdefined( self._id_2133 ) )
            common_scripts\utility::delaycall( self._id_2133, ::playsound, self.script_sound );
        else
            self playsound( self.script_sound );
    }
    else
        self playloopsound( "weap_rpg_loop" );

    if ( isdefined( self._id_7F1F ) )
    {
        if ( self._id_7F1F == "near_player" )
            _id_7F20();
    }

    self waittill( "reached_end_node" );

    if ( isdefined( self.script_exploder ) )
        common_scripts\utility::exploder( self.script_exploder );
    else if ( isdefined( self.script_fxid ) )
        playfx( common_scripts\utility::getfx( self.script_fxid ), self.origin, anglestoforward( self.angles ) );
    else if ( isdefined( self._id_164F ) )
    {
        if ( self._id_164F == "flak_burst" )
            _id_7F40( self.origin );
    }

    self delete();
}

_id_7F20()
{
    if ( !isdefined( level._id_7F21 ) )
        level._id_7F21 = [];

    level._id_7F21 = common_scripts\utility::array_removeundefined( level._id_7F21 );
    level._id_7F21[level._id_7F21.size] = self;
}

_id_7F22()
{
    var_0 = "missile_lock_alarm";
    var_1 = 0;

    while ( !common_scripts\utility::flag( "intro_complete" ) )
    {
        if ( !isdefined( level._id_7F21 ) )
        {
            wait 0.5;
            continue;
        }

        level._id_7F21 = common_scripts\utility::array_removeundefined( level._id_7F21 );

        if ( level._id_7F21.size > 0 && !var_1 )
        {
            var_1 = 1;
            thread common_scripts\utility::play_loop_sound_on_entity( var_0 );
        }
        else if ( level._id_7F21.size == 0 && var_1 )
        {
            wait 2;
            var_1 = 0;
            self notify( "stop sound" + var_0 );
        }

        wait 0.5;
    }
}

_id_7F23()
{
    var_0 = getent( "beach_reinforcement_counter", "targetname" );
    var_1 = gettime();

    while ( !common_scripts\utility::flag( "intro_complete" ) )
    {
        var_2 = getaiarray( "allies" );
        var_3 = [];

        foreach ( var_5 in var_2 )
        {
            if ( var_5 istouching( var_0 ) )
                var_3[var_3.size] = var_5;
        }

        if ( var_3.size >= 3 || gettime() > var_1 + 10000 )
        {
            if ( var_3.size > 0 )
            {
                _id_7F24( var_3 );
                var_1 = gettime();
            }
        }

        wait 1;
    }

    var_2 = getaiarray( "allies" );

    foreach ( var_5 in var_2 )
    {
        if ( var_5 istouching( var_0 ) )
            var_5 delete();
    }

    var_0 delete();
    var_0 = getent( "beach_reinforcement_trigger", "script_noteworthy" );
    var_0 delete();
}

_id_7F24( var_0 )
{
    var_1 = maps\_vehicle::_id_2881( "beach_reinforcement_blackhawk" );

    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_4 > 5 )
            break;

        var_1 thread maps\_vehicle_aianim::_id_24E5( var_3 );
    }

    var_1 waittill( "unloaded" );
}

_id_7F25()
{
    _id_7F12();
    _id_7F16();
    maps\_compass::setupminimap( "compass_map_hamburg", "city_minimap_corner" );
    setsaveddvar( "ui_hideMap", "1" );
    var_0 = common_scripts\utility::getstructarray( "fire_at_random_targets", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_7F39 );
    thread _id_7F31();
    thread maps\hamburg_landing_zone::_id_000A();
    level.player disableweapons();
    level._id_1DBD = 1;
    level._id_4133 = 1;
    level._id_4139 = ( 0.0, 50.0, 0.0 );
    thread maps\_utility::delaythread( 0, maps\_mortar::_id_413F, 1 );
    thread maps\_utility::delaythread( 15, maps\_mortar::_id_413F, 2 );
    thread _id_7F28();
    thread _id_7F2F();
    thread _id_7F3B();
    thread _id_7F3C();
    level._id_7F17 setanim( %hovercraft_rocking );
    thread maps\hamburg_hovercraft_code::_id_7EBE( "hover_craft_four", "craft_4_tank1", "craft_4_tank2" );
    thread maps\hamburg_hovercraft_code::_id_7EBF( "hover_craft_two" );
    level._id_7F17 setanim( %hovercraft_rocking );
    level._id_7F17 resumespeed( 100 );
    maps\_utility::delaythread( 6, ::_id_7F32 );
    level._id_7E04 waittill( "exited_hovercraft" );
    maps\_mortar::_id_4140( 1 );
    maps\_utility::delaythread( 2, maps\_utility::_id_1427, 2 );
}

_id_7F26( var_0 )
{
    var_1 = maps\_vehicle::_id_2881( var_0 );
    var_1 setmaxpitchroll( 30, 60 );
    var_1 setyawspeedbyname( "slow" );
    var_1._id_2963 = 1;
    var_1._id_2950 = 1;
    var_1 _id_7F2D();

    if ( var_0 == "intro_crash_blackhawk" )
        var_1 thread _id_7F27();

    var_1 thread _id_770C( "dropoff_osprey_go", ( -300.0, 0.0, -200.0 ), ( 300.0, 0.0, 200.0 ) );
}

_id_7F27()
{
    var_0 = common_scripts\utility::getstruct( "intro_crash_blackhawk_death_spot", "targetname" );
    self._id_29DC = var_0;
    self._id_29DD = -800;
    self._id_29E0 = 0;
    self._id_25A6 = 1;
    maps\_utility::_id_1402( "do_fake_death" );
    maps\_utility::_id_1654( "do_fake_death" );
    playfxontag( common_scripts\utility::getfx( "blackhawk_explosion" ), self, "tag_engine_left" );
    self dodamage( self.health, self.origin );
    level.player playrumbleonentity( "grenade_rumble" );
    var_1 = self._id_0A39;

    foreach ( var_3 in self._id_0A39 )
        thread maps\_vehicle_aianim::_id_2549( var_3, var_3._id_2252, 1 );

    wait 0.3;
    thread maps\hamburg_code::_id_7E96( "tank_bhp2_imhit" );
    common_scripts\utility::flag_set( "helix_three_two_hit" );
    var_1 = maps\_utility::_id_0B53( var_1 );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( !isalive( var_3 ) )
            continue;

        if ( var_3._id_2252 == 0 || var_3._id_2252 == 1 )
        {
            var_3 delete();
            continue;
        }

        var_3 unlink();
        var_3 notify( "newanim" );
        var_3 stopanimscripted();
        var_3._id_0EC3 = 1;
        var_3 kill();
        var_3 startragdoll();
        wait(randomfloatrange( 0.1, 0.4 ));
    }
}

_id_7F28()
{
    thread _id_7F33();
    _id_7F26( "intro_crash_blackhawk" );
    _id_7F26( "intro_extra_blackhawk" );
    var_0 = getentarray( "intro_apache", "script_noteworthy" );
    _id_7F2C( var_0 );
    common_scripts\utility::flag_wait( "ospreys_go" );
    wait 1;
    thread maps\hamburg_code::_id_7E96( "tank_op1_eta30sec" );
    thread maps\hamburg_code::_id_7E96( "hamburg_op2_raptorinbound" );
    thread maps\hamburg_code::_id_7E96( "tank_op1_onthedeck" );
    maps\_utility::delaythread( 12, ::_id_7F29 );
    var_1 = maps\_vehicle::_id_2881( "extra_osprey" );
    var_1 thread _id_6142();
    var_2 = getentarray( "intro_osprey", "script_noteworthy" );
    _id_7F2C( var_2 );
}

_id_7F29()
{
    var_0 = maps\_vehicle::_id_2A9A( "intro_f15" );
    common_scripts\utility::array_thread( var_0, ::_id_7F2A );
    maps\hamburg_code::_id_7E96( "tank_f16_egressingnorth" );
    maps\_utility::delaythread( 4, maps\hamburg_code::_id_7E96, "tank_f16_impact" );
}

_id_7F2A()
{
    self endon( "death" );
    self waittill( "f15_shoot" );

    for ( var_0 = 0; var_0 < 2; var_0++ )
    {
        thread _id_7F2B();
        wait(randomfloatrange( 0.25, 0.5 ));
    }
}

_id_7F2B()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self.origin + ( 0.0, 0.0, -180.0 );
    var_1 = 14000;
    var_2 = 30000;
    var_3 = var_2 / var_1;
    var_4 = common_scripts\utility::getfx( "f15_missile_trail" );
    playfxontag( var_4, var_0, "tag_origin" );
    var_0 moveto( var_0.origin + ( 0, var_2, 0 ), var_3 );
    var_0 waittill( "movedone" );
    var_0 delete();
}

_id_7F2C( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isspawner( var_2 ) )
            continue;

        var_3 = var_2 maps\_vehicle::_id_1F9E();
        var_3._id_2963 = 1;
        var_3 _id_7F2D();
    }
}

_id_7F2D()
{
    if ( !isdefined( level._id_7F2E ) )
        level._id_7F2E = [];

    level._id_7F2E[level._id_7F2E.size] = self;
}

_id_7F2F()
{
    var_0 = [ "hover_craft_five", "hover_craft_seven", "hover_craft_nine" ];
    var_1 = [];

    foreach ( var_3 in var_0 )
        thread maps\_vehicle::_id_2A9A( var_3 );
}

_id_6142()
{
    self endon( "death" );
    maps\_utility::_id_1402( "hit" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    var_5 = "J_Pivot_RI";
    var_6 = common_scripts\utility::getfx( "osprey_trail" );
    var_7 = common_scripts\utility::getfx( "osprey_explosion" );
    playfx( var_7, var_3 );
    playfxontag( common_scripts\utility::getfx( "blackhawk_explosion" ), self, var_5 );
    level.player playrumbleonentity( "grenade_rumble" );
    thread _id_7F30();
    var_8 = gettime();
    var_9 = 0;
    var_10[0] = var_8 + 1500;
    var_10[1] = var_8 + 2500;
    var_10[2] = var_8 + 2700;
    var_10[3] = var_8 + 4000;
    var_10[4] = var_8 + 5000;

    for (;;)
    {
        playfxontag( var_6, self, var_5 );
        wait 0.05;

        if ( var_9 > var_10.size - 1 )
            continue;

        if ( gettime() > var_10[var_9] )
        {
            var_9++;
            playfxontag( var_7, self, var_5 );
            self playsound( "blackhawk_helicopter_secondary_exp" );
        }
    }
}

_id_7F30()
{
    self waittill( "splash" );
    var_0 = common_scripts\utility::getfx( "osprey_splash" );
    var_1 = -178;
    playfx( var_0, ( self.origin[0], self.origin[1], var_1 ) );
    thread common_scripts\utility::play_sound_in_space( "scn_hamburg_osprey_water_splash1", ( self.origin[0], self.origin[1], var_1 ) );
}

_id_7F31()
{
    common_scripts\utility::flag_wait( "dropoff_osprey_go" );
    var_0 = maps\_vehicle::_id_2881( "intro_heli_drop_off" );
    var_0 maps\_utility::_id_1402( "guys_unloaded" );
    var_0 _id_7F2D();
    var_0 waittill( "unloaded" );
    var_0 maps\_utility::_id_13DC( "guys_unloaded" );
    var_0._id_2950 = 1;
}

_id_7F32()
{
    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        wait(randomfloatrange( 0.5, 1 ));
        common_scripts\utility::exploder( "intro_flak_at_player" );
    }
}

_id_7F33()
{
    var_0 = maps\_vehicle::_id_2881( "player_blackhawk" );
    var_0._id_2963 = 1;
    var_0 maps\_vehicle::_id_2A12();
    var_0 setmaxpitchroll( 20, 60 );
    var_0._id_2950 = 1;
    level._id_7F34 = var_0;
    var_0 vehicleusealtblendedaudio( 1 );
    var_0 thread _id_7F22();
    var_0 _id_7F2D();
    var_0 maps\hamburg_landing_zone::_id_7F08();
    thread _id_7F35();
    var_0._id_7797 = common_scripts\utility::spawn_tag_origin();
    var_0._id_7797 linkto( var_0, "tag_player", ( 23.0, 0.0, -10.0 ), ( 0.0, -60.0, 0.0 ) );
    level.player allowcrouch( 0 );
    level.player playerlinktodelta( var_0._id_7797, "tag_player", 0.8, 35, 20, 30, 20, 0 );
    level.player setplayerangles( ( 0, var_0.angles[1] - 60, 0 ) );
    level thread _id_7F36();
    var_0 thread _id_770C( "dropoff_osprey_go", ( 100.0, 0.0, -50.0 ), ( 300.0, 0.0, 50.0 ) );
    var_0 thread _id_770C( "dropoff_osprey_go", ( 100.0, 0.0, -100.0 ), ( 300.0, 0.0, 100.0 ) );
    var_1 = vehicle_getarray();
    var_1 = common_scripts\utility::array_remove( var_1, var_0 );

    foreach ( var_3 in var_1 )
        var_3 vehicle_turnengineoff();

    var_0 waittill( "unloaded" );
    var_0 vehicleusealtblendedaudio( 0 );
    var_1 = vehicle_getarray();
    var_1 = common_scripts\utility::array_remove( var_1, var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( !var_3 maps\_vehicle::_id_2A40() && distance( var_3.origin, level.player.origin ) < 5000 )
            var_3 vehicle_turnengineon();
    }

    maps\hamburg_landing_zone::_id_7F09( 4, getdvarfloat( "sm_sunsamplesizenear" ), 0.25 );
    maps\_utility::_id_194E( "hamburg_beach" );
    thread _id_7F38();
    common_scripts\utility::flag_set( "player_unloading" );
    level.player maps\_utility::_id_13E4( ( 1608.04, -4347.19, -139.875 ), ( 0.0, 17.5388, 0.0 ), 1 );
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowjump( 1 );
    common_scripts\utility::flag_set( "player_unloaded" );
}

_id_7F35()
{
    common_scripts\utility::getstruct( "turn_on_vehicle_sounds", "script_noteworthy" ) waittill( "trigger" );
    common_scripts\utility::flag_set( "over_hovercrafts" );
    var_0 = getentarray( "script_vehicle_hovercraft", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            continue;

        var_2 vehicle_turnengineon();
    }
}

_id_7F36()
{
    level endon( "player_unloading" );

    for (;;)
    {
        var_0 = randomfloatrange( 0.05, 0.1 );
        earthquake( var_0, 0.5, level.player.origin, 200 );
        wait 0.2;
    }
}

_id_7F37()
{
    var_0 = maps\_utility::_id_2642( "player_blackhawk", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 maps\_vehicle::_id_2514();
}

_id_7F38()
{
    var_0 = maps\_utility::_id_2642( "crane_apache", "targetname" );
    var_0 notify( "stop_apache_fire_at_targets" );
    var_0 thread maps\hamburg_landing_zone::_id_7F05( "missile_chain_crane", 5, "hot_buildings_destroyed", "apache_zippy" );
    var_1 = getent( "exploding_crane_trigger", "targetname" );
    var_1 waittill( "trigger" );
    var_2 = getent( "exploding_crane", "targetname" );
    var_2._id_1032 = "crane";
    var_2 maps\_anim::_id_1244();
    var_2 maps\_anim::_id_1246( var_2, "crash" );
}

_id_7F39()
{
    self waittill( "trigger", var_0 );
    var_1 = maps\_utility::_id_0B53( common_scripts\utility::getstructarray( "event1_ac130_targets", "targetname" ) );
    var_2 = 4;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2; var_4++ )
        var_3[var_4] = var_1[var_4];

    var_1 = var_3;
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_0 thread _id_7F3A( var_5, var_1 );
}

_id_7F3A( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_apache_fire_at_targets" );
    var_0 thread maps\hamburg_code::_id_7E7B( thisthread, ::delete );
    self setlookatent( var_0 );

    foreach ( var_3 in var_1 )
    {
        var_0.origin = var_3.origin;
        wait(randomfloatrange( 2, 3 ));

        if ( self.vehicletype == "apache" )
        {
            if ( isdefined( level._id_7ED0 ) )
            {
                if ( !level._id_7ED0 )
                {
                    level._id_7ED0 = 1;
                    maps\_helicopter_globals::fire_missile( "apache_zippy", 4, var_0, 0.1 );
                    level thread maps\hamburg_landing_zone::_id_7ED1();
                }
            }
            else
                maps\_helicopter_globals::fire_missile( "apache_zippy", 4, var_0, 0.1 );

            continue;
        }

        maps\_helicopter_globals::fire_missile( "mi28_zippy", 5, var_0, 0.3 );
    }

    thread maps\hamburg_landing_zone::_id_7EF1();
}

_id_770C( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( common_scripts\utility::flag_exist( "start_beach_defense" ) )
        common_scripts\utility::flag_wait( "start_beach_defense" );

    var_3 = _id_7F45();
    var_4 = self.origin + ( var_2[0], 0, var_1[2] );
    var_5 = undefined;

    while ( !common_scripts\utility::flag( var_0 ) )
    {
        _id_7F47();
        var_6 = self.origin;
        var_7 = _id_7F4A( var_1, var_2 );

        if ( !isdefined( var_5 ) )
        {
            var_5 = var_7;
            continue;
        }

        var_8 = distance( var_5, var_7 );
        var_9 = 100;
        var_10 = var_8 / var_9;
        var_11 = int( var_10 * 20 );
        var_11 = max( var_11, 1 );
        var_12 = ( var_7 - var_5 ) / var_11;
        var_13 = var_5;

        for ( var_14 = 0; var_14 < var_11; var_14++ )
        {
            var_13 += var_12;
            var_4 = self.origin + var_13;
            var_4 = ( var_4[0], self.origin[1], var_4[2] );
            var_15 = anglestoforward( ( 0, self.angles[1], 0 ) );
            var_16 = var_4 + var_15 * 2000;
            var_17 = var_4 + var_15 * -1 * 2000;

            if ( gettime() > var_3 )
            {
                var_3 = _id_7F45();
                magicbullet( "ak47_acog", var_16, var_17 );
                bullettracer( var_16, var_17, 1 );
            }

            wait 0.05;
        }

        var_18 = var_7;
    }
}

_id_7F3B()
{
    if ( common_scripts\utility::flag_exist( "start_beach_defense" ) )
        common_scripts\utility::flag_wait( "start_beach_defense" );

    level endon( "player_unloaded" );
    var_0 = 0;

    for (;;)
    {
        _id_7F48();

        if ( var_0 == level._id_7F1D.size )
        {
            var_0 = 0;
            level._id_7F1D = maps\_utility::_id_0B53( level._id_7F1D );
        }

        var_1 = level._id_7F1D[var_0];
        var_0++;

        if ( !isdefined( var_1 ) )
            continue;

        while ( isdefined( var_1 ) )
        {
            var_2 = randomfloatrange( 700, 4000 );
            var_3 = randomfloatrange( 30, 330 );
            var_4 = anglestoforward( var_1.angles + ( 0, var_3, 0 ) );
            var_5 = var_1.origin + var_4 * var_2;

            if ( _id_7F43( var_5, var_1 ) )
            {
                _id_6DC5( var_5, var_1 );
                break;
            }

            wait 0.05;
        }
    }
}

_id_7F3C()
{
    if ( common_scripts\utility::flag_exist( "start_beach_defense" ) )
        common_scripts\utility::flag_wait( "start_beach_defense" );

    var_0 = 0;

    while ( !common_scripts\utility::flag( "player_unloaded" ) )
    {
        _id_7F41();

        if ( var_0 == level._id_7F2E.size )
        {
            var_0 = 0;
            level._id_7F2E = maps\_utility::_id_0B53( level._id_7F2E );
        }

        var_1 = level._id_7F2E[var_0];
        var_0++;

        if ( !isdefined( var_1 ) )
            continue;

        while ( isdefined( var_1 ) )
        {
            var_2 = randomfloatrange( 1500, 4000 );
            var_3 = anglestoforward( _id_7F4A( ( 0.0, 0.0, 0.0 ), ( 360.0, 360.0, 360.0 ) ) );
            var_4 = var_1.origin + var_3 * var_2;
            var_4 = ( var_4[0], var_4[1], max( var_4[2], 500 ) );

            if ( var_1 _id_7F42( var_4 ) )
            {
                _id_7F40( var_4 );
                break;
            }

            wait 0.05;
        }
    }
}

_id_7F3D()
{
    var_0 = ( -9000.0, -29000.0, 1000.0 );
    var_1 = ( 23000.0, -6700.0, 5000.0 );
    var_2 = -178;
    var_3 = _id_7F3E();
    var_4 = _id_7F3F();

    while ( !common_scripts\utility::flag( "glory_tank_ready_for_death" ) )
    {
        var_5 = gettime();

        if ( var_5 > var_3 )
        {
            var_6 = _id_7F4A( var_0, var_1 );
            var_6 = ( var_6[0], var_6[1], var_2 );
            _id_6DC5( var_6 );
            var_3 = _id_7F3E();
        }

        if ( var_5 > var_4 )
        {
            var_6 = _id_7F4A( var_0, var_1 );
            _id_7F40( var_6 );
            var_4 = _id_7F3F();
        }

        wait 0.05;
    }
}

_id_7F3E()
{
    return gettime() + randomfloatrange( 1000, 3000 );
}

_id_7F3F()
{
    return gettime() + randomfloatrange( 500, 1300 );
}

_id_6DC5( var_0, var_1 )
{
    var_2 = "water";

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1._id_7F19 ) )
        {
            var_3 = var_0 + ( 0.0, 0.0, 150.0 );
            var_4 = var_0 - ( 0.0, 0.0, 300.0 );
            var_5 = bullettrace( var_3, var_4, 0, var_1 );

            if ( isdefined( level._effect["mortar"][var_5["surfacetype"]] ) )
                var_2 = var_5["surfacetype"];
        }
    }

    var_6 = level._effect["mortar"][var_2];
    playfx( var_6, var_0 );
    var_7 = distancesquared( level.player.origin, var_0 );

    if ( var_7 < 9000000 )
    {
        var_8 = level.scr_sound["mortar"][var_2];
        thread common_scripts\utility::play_sound_in_space( var_8, var_0 );
        earthquake( 0.5, 0.5, var_0, 2000 );
    }
}

_id_7F40( var_0 )
{
    var_1 = common_scripts\utility::getfx( "ride_in_near_aa_explose" );
    playfx( var_1, var_0 );
    var_2 = distancesquared( level.player.origin, var_0 );

    if ( var_2 < 9000000 )
    {
        thread common_scripts\utility::play_sound_in_space( "aagun_skyburst_close", var_0 );
        earthquake( 0.75, 0.5, var_0, 3000 );
    }
}

_id_7F41()
{
    var_0 = _id_7F46();
    var_1 = _id_7F49( 0.1, 0.3, var_0 );
    var_2 = _id_7F49( 0.5, 0.75, var_0 );
    wait(randomfloatrange( var_1, var_2 ));
}

_id_7F42( var_0 )
{
    foreach ( var_2 in level._id_7F2E )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( distancesquared( var_2.origin, var_0 ) < 2250000 )
            return 0;
    }

    return 1;
}

_id_7F43( var_0, var_1 )
{
    foreach ( var_3 in level._id_7F1D )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( !var_3 _id_7F44( var_0 ) )
            return 0;
    }

    return 1;
}

_id_7F44( var_0 )
{
    var_1 = 80000;
    var_2 = 700;
    var_2 *= var_2;
    var_3 = anglestoforward( self.angles );
    var_4 = self.origin + var_3 * -1000;
    var_5 = var_0 - var_4;
    var_6 = vectordot( var_3, var_5 );

    if ( var_6 < 0 )
        return 1;

    if ( var_6 > var_1 )
        return 1;

    var_7 = length( var_5 );
    var_8 = abs( var_7 * var_7 - var_6 * var_6 );

    if ( var_8 > var_2 )
        return 1;

    return 0;
}

_id_4E3D( var_0, var_1 )
{
    var_0 = int( var_0 * var_1 ) / var_1;
    return var_0;
}

_id_7F45()
{
    var_0 = _id_7F46();
    var_1 = _id_7F49( 0.05, 1, var_0 );
    var_2 = _id_7F49( 0.3, 1.5, var_0 );
    return gettime() + randomfloatrange( var_1, var_2 ) * 1000;
}

_id_7F46()
{
    var_0 = -49500;
    var_1 = -12000;
    var_2 = var_1 - var_0;
    var_3 = var_1 - level.player.origin[1];
    var_4 = var_3 / var_2;
    var_4 = clamp( var_4, 0, 1 );
    return var_4;
}

_id_7F47()
{
    var_0 = _id_7F46();
    var_1 = _id_7F49( 0.5, 2, var_0 );
    var_2 = _id_7F49( 2, 5, var_0 );
    wait(randomfloatrange( var_1, var_2 ));
}

_id_7F48()
{
    var_0 = _id_7F46();
    var_1 = _id_7F49( 0.3, 0.75, var_0 );
    var_2 = _id_7F49( 0.7, 2.5, var_0 );
    wait(randomfloatrange( var_1, var_2 ));
}

_id_7F49( var_0, var_1, var_2 )
{
    return var_0 + ( var_1 - var_0 ) * var_2;
}

_id_7F4A( var_0, var_1 )
{
    var_2 = _id_7F4B( var_0[0], var_1[0] );
    var_3 = _id_7F4B( var_0[1], var_1[1] );
    var_4 = _id_7F4B( var_0[2], var_1[2] );
    return ( var_2, var_3, var_4 );
}

_id_7F4B( var_0, var_1 )
{
    if ( var_0 == var_1 )
        return var_0;

    return randomfloatrange( var_0, var_1 );
}

_id_7F4C()
{
    var_0 = common_scripts\utility::getstruct( self.targetname, "target" );
    var_0 waittill( "trigger" );
    maps\_utility::script_delay();
    maps\_vehicle::_id_1F9E();
}

_id_7F4D()
{
    level endon( "halfway_up_beach" );
    var_0 = getvehiclenode( self.targetname, "target" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_2703();
}

_id_7F4E()
{
    _id_7F12();
    _id_7F58();
    thread _id_7F23();
    thread _id_7F3D();
    thread tank_stop_moving_bug_fix();
    maps\hamburg_code::_id_7E68( 7000 );
    var_0 = maps\_utility::_id_2642( "craft_4_tank1", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        var_0 = maps\_vehicle::_id_2881( "craft_4_tank1" );
        var_1 = maps\_vehicle::_id_2881( "craft_4_tank2" );
        var_0 maps\_vehicle::_id_2A12();
        var_1 maps\_vehicle::_id_2A12();
        var_2 = level._id_7E1B;
        var_3 = getvehiclenode( "friend_path_off_hovercraft", "targetname" );
        var_2._id_291A = var_3;
        var_2 attachpath( var_3 );
        var_2 thread maps\_vehicle::_id_26A1( var_3 );
        var_2 resumespeed( 15 );
    }
    else
    {
        var_0 maps\hamburg_code::_id_7E63();
        var_0 maps\_vehicle::_id_2A13();
    }

    maps\_utility::delaythread( 0.25, maps\_utility::_id_1425, "landing_to_get_orders" );

    if ( maps\_utility::_id_275F( "ride_in" ) )
    {
        level._id_7E1B maps\hamburg_code::_id_7E42( "friend_path_off_hovercraft" );
        level._id_7E26 maps\hamburg_code::_id_7E42( "craft_2_tank1_path_one" );
        level._id_7E04 maps\hamburg_code::_id_7E42( "tank_track_e1_a_pre" );
    }

    thread _id_7F50();
    thread _id_7F4F();
    var_4 = common_scripts\utility::getstruct( "friend_smoke_beach", "targetname" );
    level._id_7E1B._id_29C6 = var_4.origin;
    _id_7F56();
    _id_7F57();
    common_scripts\utility::flag_wait( "end_of_beach" );
    maps\_mortar::_id_4140( 2 );
    _id_577D();
}

tank_stop_moving_bug_fix()
{
    level.player endon( "death" );

    while ( level.player.origin[1] < 1760 )
        wait 0.5;

    if ( !common_scripts\utility::flag( "two_tanks_in_alley" ) )
        maps\_utility::_id_26BF( "two_tanks_in_alley" );
}

_id_7F4F()
{
    var_0 = getvehiclenode( "tank_shoots_building_left", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_1 vehicle_setspeed( 0, 15, 15 );
    var_1 maps\_vehicle::_id_29C3( "tank_shoots_building_left", 10, 10 );
    var_2 = common_scripts\utility::getstruct( var_0.targetname, "target" );
    var_1 maps\hamburg_tank_ai::_id_7DBC();
    var_1 setturrettargetvec( var_2.origin );
    var_1 waittill( "turret_on_target" );
    var_1 fireweapon();
    common_scripts\utility::exploder( "tank_blows_up_building_left_exploder" );
    var_1 thread maps\hamburg_tank_ai::_id_7D9C();
    var_1 maps\hamburg_code::_id_7E63();
    var_1 maps\_vehicle::_id_2A13();
    var_1 maps\_vehicle::_id_2B1C( "tank_shoots_building_left" );
}

_id_7F50()
{
    common_scripts\utility::flag_wait( "player_on_beach" );
    maps\hamburg_code::_id_7E96( "tank_bhp1_chalkdeployed" );
    common_scripts\utility::flag_set( "pause_sentry_turrets" );
    thread _id_7F51();
    thread _id_7F55();
    thread _id_7F53();
    maps\_spawner::_id_2121( "post_beach_pool_spawner" );
}

_id_7F51()
{
    thread _id_7F52();
    wait 2;
    common_scripts\utility::flag_wait( "tank_out_of_left" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_t90rightside" );
    var_0 = maps\_utility::_id_2642( "tank_out_of_left", "script_noteworthy" ) maps\_vehicle::_id_2A13();
    common_scripts\utility::flag_wait( "hind_hind" );
    maps\hamburg_code::_id_7E96( "hamburg_rhg_hind" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_movewithtanks" );
    maps\hamburg_code::_id_7E96( "tank_ag2_mortars" );
    maps\hamburg_code::_id_7E96( "tank_ag3_pinneddown" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_whatevercover" );
    maps\hamburg_code::_id_7E96( "tank_ag2_behindrocks" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_getoffbeach" );
    maps\hamburg_code::_id_7E96( "tank_ag3_offthebeach" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_dontslowdown" );
    maps\hamburg_code::_id_7E96( "tank_ag1_rallypoint" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_movemove" );
}

_id_7F52()
{
    for (;;)
    {
        level._id_7E04 waittill( "weapon_fired" );

        if ( randomint( 100 ) > 25 )
            continue;

        wait 1;
        maps\hamburg_code::_id_7E96( "hamburg_rhg_loading", 0.3 );
        wait 4;
        maps\hamburg_code::_id_7E96( "hamburg_rhg_up", 0.3 );

        if ( common_scripts\utility::cointoss() )
            maps\hamburg_code::_id_7E96( "hamburg_rhg_aquiring", 0.3 );
    }
}

_id_7F53()
{
    var_0 = common_scripts\utility::getstructarray( "beach_flood_spawners", "targetname" );
    var_1 = gettime() + 5000;

    while ( gettime() < var_1 )
    {
        var_2 = maps\_utility::_id_0B53( var_0 );

        foreach ( var_4 in var_0 )
        {
            if ( !var_4.count )
                continue;

            if ( isdefined( var_4._id_7F54 ) )
            {
                if ( isalive( var_4._id_7F54 ) && !var_4._id_7F54 maps\_utility::_id_0D69() )
                    continue;
            }

            var_5 = maps\_spawner::_id_2125( var_4, 1 );
            var_5.count = 1;
            var_6 = var_5 maps\_utility::_id_166F();

            if ( !maps\_utility::_id_13AF( var_6 ) )
            {
                var_4._id_7F54 = var_6;
                var_4.count--;
            }

            wait(randomfloatrange( 1, 3 ));
        }

        if ( !common_scripts\utility::flag( "halfway_up_beach" ) )
            var_1 = gettime() + 5000;

        wait 0.1;
    }
}

_id_7F55()
{
    maps\_vehicle::_id_2881( "heli_enemy_beach_right" );
    common_scripts\utility::flag_set( "hind_hind" );
    wait 5.5;
    thread maps\hamburg_landing_zone::_id_7ECF( "event1_forward_heli_nine", [ "heli_enemy_beach_right" ], undefined, 1 );
    wait 2;
    thread maps\hamburg_landing_zone::_id_7ECF( "event1_forward_heli_one", [ "heli_enemy_beach_right" ], undefined, 1 );
    wait 2;
    thread maps\hamburg_landing_zone::_id_7ECF( "crane_apache", [ "heli_enemy_beach_right" ], undefined, 1 );
    thread maps\hamburg_landing_zone::_id_7ECF( "heli_enemy_beach_right", [ "event1_forward_heli_nine", "crane_apache", "event1_forward_heli_one" ], undefined, 1 );
}

_id_7F56()
{
    thread maps\hamburg_landing_zone::_id_7ED2();
    thread maps\_utility::delaythread( 0, maps\_mortar::_id_4140, 1 );
    level._id_7E1B thread maps\hamburg_tank_ai::_id_7D9C();
    level._id_7E04 thread maps\hamburg_tank_ai::_id_7D9C();
    maps\_utility::delaythread( 1, maps\_utility::_id_1425, "beach_landed" );
}

_id_7F57()
{
    maps\_utility::delaythread( 1, maps\_utility::_id_1425, "over_mound" );
}

_id_7F58()
{
    var_0 = getentarray( "beach_color_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_7F59 );
}

_id_7F59()
{
    var_0 = getentarray( self.target, "targetname" );
    _id_7F5A( var_0 );
    maps\_utility::_id_2703();
    maps\_utility::_id_135B( var_0 );
}

_id_7F5A( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4.script_delay ) )
        {
            var_1 = var_4;
            continue;
        }

        var_2 = var_4;
    }

    var_2 endon( "trigger" );

    for (;;)
    {
        var_1 waittill( "trigger" );
        var_6 = gettime() + var_1.script_delay * 1000;

        while ( level.player istouching( var_1 ) )
        {
            if ( gettime() > var_6 )
                return;

            wait 0.05;
        }
    }
}
