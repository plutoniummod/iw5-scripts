// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_7E18()
{
    if ( isai( self ) )
        return;

    self._id_2044 = common_scripts\utility::random( [ %sprint_loop_distant_relative, %run_lowready_f_relative ] );
    self._id_0FC6 = randomfloatrange( 0.95, 1.05 );
}

_id_56FB()
{
    level.destructible_cleans_up_more = 1;
    level._id_2120 = 1;
    level._id_2A6E = 1;
    level._id_2A3C = 1;
    level._id_1EE0 = 1;
    level._id_200E = ::_id_200E;
    level.disablemovementtracker = 1;
    level._id_299D = 1;
    level._id_20F9 = 1;
    level._id_23B8 = 1;
    level._id_412F = 1;
    level._id_2129 = ::_id_2129;
    level._id_2AAB = ::_id_7E97;
    level._id_2A1D = 1;
    maps\hamburg_fx::main();
    precacheitem( "mp5_drone" );
    precacheitem( "t90_turret_bold" );
    precachemodel( "generic_prop_raven" );
    level._id_2987 = 1;
    common_scripts\utility::create_lock( "sentry_drones" );
    vehicle_scripts\_m1a1_player_control::_id_7DFF();
    getent( "garage_crash_light_flicker", "targetname" ) setlightintensity( 0 );
}

_id_00ED( var_0 )
{
    var_0 = self.spawner;
    var_0._id_0AB5 = self.name;
}

_id_56F8()
{
    if ( !isdefined( level._id_7E1A ) )
        level._id_7E1A = 9;

    thread _id_7E92();
    var_0 = getent( "tank_crew_1", "targetname" );
    var_1 = getent( "tank_crew_2", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_00ED );
    var_1 maps\_utility::add_spawn_function( ::_id_00ED );
    maps\_utility::_id_1A5A( "axis", ::_id_7E18 );
    maps\hamburg_tank_ai::_id_7D9A();
    maps\_utility::_id_1A5A( "allies", ::_id_7E11 );
    maps\_drone_ai::init();
    level._id_2A76 = ::_id_7E70;
    precachemodel( "vehicle_m1a1_abrams_minigun_shiny_objective" );
    precachemodel( "vehicle_m1a1_abrams_minigun_shiny_part" );
    precachestring( &"PLATFORM_HOLD_TO_USE" );
    maps\_vehicle::_id_29FE( "script_vehicle_m1a1_abrams_minigun", undefined, "vehicle_m1a1_abrams_minigun", "explosions/vehicle_explosion_t90_cheap", "tag_deathfx", "exp_armor_vehicle" );

    if ( !maps\_utility::_id_275F( "hamburg_garage_ramp" ) )
    {
        level._id_7E04 = maps\_vehicle::_id_2A99( "player_tank" );
        level._id_7E04._id_2A82 = 200;
        level._id_7E04._id_2A83 = 500;
        level._id_7E04._id_2A1F = 6;
        level._id_7E04 setmodel( "vehicle_m1a1_abrams_minigun" );
        level._id_7E04 vehicleusealtblendedaudio( 1 );
        level._id_7E04 maps\_vehicle::_id_2A12();
        level._id_7E04 maps\hamburg_tank_ai::_id_7D9B();
        _id_7967( level._id_7E04 );
        level._id_284F = level._id_7E04;
        level._id_7E04._id_29B7 = 0;
        level._id_7E04._id_2955 = 1;
        level._id_7E04.damageisfromplayer = 1;
        level._id_7E04 thread _id_7E48();
        level._id_7E1B = maps\_vehicle::_id_2A99( "hero_tank" );
        level._id_7E1B._id_2A82 = 200;
        level._id_7E1B._id_2A83 = 500;
        level._id_7E1B._id_29B7 = 0;
        level._id_7E1B maps\_vehicle::_id_2A12();
        level._id_7E1B maps\_utility::_id_1402( "sync_tanks" );
        level._id_7E1B maps\_utility::_id_1402( "stunned_tank" );
        level._id_7E1B._id_2955 = 1;
        level._id_7E1B.damageisfromplayer = 1;
        level._id_7E1B thread _id_7E48();
        level._id_7E1B maps\hamburg_tank_ai::_id_7D9B();
    }

    level._id_282E = [];
    level._id_7DC1 = ::_id_7E60;
    level._id_7D9E = ::_id_7E5F;

    if ( maps\_utility::_id_1451() )
    {
        level._id_7E04._id_29B8 = 1;
        level._id_7E1B._id_29B8 = 1;
    }

    level.fast_destructible_explode = 0;
    _id_7E1E();
    precacheitem( "m1a1_turret_blank" );
    var_2 = [ "script_vehicle_m1a1_abrams", "script_vehicle_m1a1_abrams_player_tm", "script_vehicle_m1a1_abrams_minigun" ];

    foreach ( var_4 in var_2 )
    {
        var_5 = getentarray( var_4, "classname" );

        foreach ( var_7 in var_5 )
            var_7 _id_7E27( ::_id_7E3C );
    }

    var_10 = getent( "sandman_spawner", "targetname" );
    var_10 maps\_utility::add_spawn_function( ::_id_4B63 );
    var_11 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_7 in var_11 )
    {
        if ( isdefined( var_7._id_2A41 ) && var_7._id_2A41 != 0 )
            var_7 _id_7E27( ::_id_7E20 );

        if ( issubstr( var_7.classname, "m1a1" ) || issubstr( var_7.classname, "t90" ) )
            var_7 _id_7E27( ::_id_7E48 );
    }

    maps\hamburg_garage_crash_anim::main();
    common_scripts\utility::array_thread( getentarray( "vehicle_water", "targetname" ), maps\_utility::_id_2830, ::_id_7E3D );
    precacheshader( "black" );
    precachemodel( "vehicle_luxurysedan_2008_crush" );
    precachemodel( "vehicle_luxurysedan_2008_gray_crush" );
    precachemodel( "vehicle_luxurysedan_2008_white_crush" );
    precachemodel( "weapon_m4_iw5" );
    precachemodel( "viewlegs_generic" );
    precacheitem( "t90_turret_fast" );
    precacheitem( "flash_grenade" );
    precacheitem( "javelin" );
    precacheitem( "javelin_no_explode" );
    precacheitem( "javelin_cheap" );
    precacheitem( "m4m203_acog_payback" );
    maps\hamburg_amb::main();
    _id_4D6D();
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "cannon_target_aim", "targetname" ), ::_id_7E46 );
    maps\hamburg_starts::_id_7949();
    var_14 = [ "script_vehicle_t90_tank_woodland", "script_vehicle_t90_tank_woodland_hamburg", "script_vehicle_t90_tank_woodland_hamburg", "script_vehicle_m1a1_abrams_minigun", "script_vehicle_m1a1_abrams_minigun" ];

    foreach ( var_16 in var_14 )
        common_scripts\utility::array_thread( getentarray( var_16, "classname" ), ::_id_7E27, maps\hamburg_tank_ai::_id_7D9B );

    common_scripts\utility::array_thread( getentarray( "script_vehicle_m1a1_abrams_minigun", "classname" ), ::_id_7E27, ::_id_7E24 );
    common_scripts\utility::array_thread( getentarray( "script_vehicle_apache_mg", "classname" ), ::_id_7E27, ::_id_7E66 );
    var_18 = getvehiclenodearray( "bad_place_till_death", "script_noteworthy" );
    common_scripts\utility::array_thread( var_18, ::_id_7E86 );
    var_19 = getentarray( "tank_gate_open", "targetname" );
    common_scripts\utility::array_thread( var_19, ::_id_7E69 );
    var_19 = getvehiclenodearray( "tank_gate_open", "script_noteworthy" );
    common_scripts\utility::array_thread( var_19, ::_id_7E69 );
    maps\_utility::delaythread( 0.2, maps\_utility::_id_2811, 1001, 2.7, 0.7 );
    var_20 = getvehiclenodearray( "crawl_while_axis_alive", "script_noteworthy" );
    common_scripts\utility::array_thread( var_20, maps\_utility::_id_2830, ::_id_7E5E );
    var_20 = getvehiclenodearray( "stop_crawl_while_axis_alive", "script_noteworthy" );
    common_scripts\utility::array_thread( var_20, maps\_utility::_id_2830, ::_id_7E5B );
    var_21 = getentarray( "kill_guys_in_volume", "targetname" );
    common_scripts\utility::array_thread( var_21, maps\_utility::_id_2830, ::_id_7E23 );
    var_22 = getentarray( "script_vehicle_t90_tank_woodland_hamburg", "classname" );
    common_scripts\utility::array_thread( var_22, maps\_utility::add_spawn_function, ::_id_7E22 );
    var_23 = maps\_utility::_id_1BF9( "missile_fires_at_heli", "targetname" );
    common_scripts\utility::array_thread( var_23, ::_id_7E65 );
    var_24 = getentarray( "friend_replenisher", "targetname" );
    common_scripts\utility::array_thread( var_24, ::_id_7E75 );
    var_25 = getvehiclenodearray( "push_color", "script_noteworthy" );
    common_scripts\utility::array_thread( var_25, ::_id_7E74 );
    var_26 = getentarray( "no_mans_land", "targetname" );
    common_scripts\utility::array_thread( var_26, ::_id_7E71 );
    var_27 = getvehiclenodearray( "veh_node_tank_stop_for_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_27, ::_id_7E7C );
    var_28 = getvehiclenodearray( "hard_reverse", "script_noteworthy" );
    common_scripts\utility::array_thread( var_28, ::_id_7E7F );
    var_28 = getvehiclenodearray( "hard_forward", "script_noteworthy" );
    common_scripts\utility::array_thread( var_28, ::_id_7E80 );
    var_29 = getentarray( "setup_new_fake_fire", "targetname" );
    common_scripts\utility::array_thread( var_29, ::_id_7E7D );
    var_30 = getentarray( "trigger_when_ai_clear", "targetname" );
    common_scripts\utility::array_thread( var_30, ::_id_7E7E );
    var_31 = getentarray( "delete_on_goal", "script_noteworthy" );
    common_scripts\utility::array_thread( var_31, maps\_utility::add_spawn_function, ::_id_7E87 );
    thread _id_7E21();
    thread _id_7E1D();
}

_id_7E1D()
{
    waittillframeend;
    soundsettimescalefactor( "Music", 1 );
    soundsettimescalefactor( "Menu", 1 );
    soundsettimescalefactor( "local3", 1 );
    soundsettimescalefactor( "Mission", 1 );
    soundsettimescalefactor( "Announcer", 1 );
    soundsettimescalefactor( "Bulletimpact", 1 );
    soundsettimescalefactor( "Voice", 1 );
    soundsettimescalefactor( "effects2", 1 );
    soundsettimescalefactor( "local", 1 );
    soundsettimescalefactor( "physics", 1 );
    soundsettimescalefactor( "ambient", 1 );
    soundsettimescalefactor( "auto", 1 );
}

_id_7E1E()
{
    var_0 = getentarray( "tank_crushable_car", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_7E59 );
}

_id_7E1F()
{
    if ( level._id_1F19 != self._id_1FDB )
        self delete();
}

_id_7E20()
{
    self vehicle_turnengineoff();
}

_id_7E21()
{
    waittillframeend;
    waittillframeend;
    level.struct = undefined;
    _id_7E82( 1 );
}

_id_7E22()
{
    self setvehweapon( "t90_turret_bold" );
}

_id_7E23( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent();
    var_2 = var_1 maps\_utility::_id_2789( "axis" );

    foreach ( var_4 in var_2 )
        var_4.diequietly = 1;

    maps\_utility::_id_26BE( var_2 );
    var_1 delete();
    self delete();
}

_id_7E24()
{
    self._id_29B4 = 1.2;
    _id_7E25();
}

_id_7E25()
{
    self startusingheroonlylighting();
}

_id_7E14()
{
    level._id_7E26 = maps\_vehicle::_id_2A99( "glory_tank" );
    level._id_7E26.veh_pathtype = "constrained";
    level._id_7E26 maps\_vehicle::_id_2A12();
    level._id_7E26 maps\_utility::_id_1402( "sync_tanks" );
    level._id_7E26._id_2955 = 1;

    if ( maps\_utility::_id_1451() )
        level._id_7E26._id_29B8 = 1;
}

_id_7E27( var_0 )
{
    if ( !isspawner( self ) )
        return;

    maps\_utility::add_spawn_function( var_0 );
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "start_beach_defense" );
    common_scripts\utility::flag_init( "in_garage" );
    common_scripts\utility::flag_init( "flash_bangers" );
    common_scripts\utility::flag_init( "garage_jumpers" );
    common_scripts\utility::flag_init( "intro_complete" );
    common_scripts\utility::flag_init( "hot_buildings_destroyed" );
    common_scripts\utility::flag_init( "hot_buildings_destroyed_2" );
    common_scripts\utility::flag_init( "ospreys_go" );
    common_scripts\utility::flag_init( "dropoff_osprey_go" );
    common_scripts\utility::flag_init( "player_unloaded" );
    common_scripts\utility::flag_init( "player_unloading" );
    common_scripts\utility::flag_init( "helix_three_two_hit" );
    common_scripts\utility::flag_init( "glory_tank_ready_for_death" );
    common_scripts\utility::flag_init( "tank_path_bridge" );
    common_scripts\utility::flag_init( "tank_path_before_garage" );
    common_scripts\utility::flag_init( "tank_crash_exit" );
    common_scripts\utility::flag_init( "player_ready_for_minigun_death" );
    common_scripts\utility::flag_init( "pause_sentry_turrets" );
    common_scripts\utility::flag_init( "over_hovercrafts" );
    common_scripts\utility::flag_init( "start_garage_section" );
    common_scripts\utility::flag_init( "snipey_mc_sniperton_sniped" );
    common_scripts\utility::flag_init( "tanks_entered_garage" );
    common_scripts\utility::flag_init( "hind_hind" );
    common_scripts\utility::flag_init( "player_in_tank" );
}

_id_7E15()
{
    if ( !isdefined( level._id_7E28 ) )
        return;

    maps\_utility::_id_135B( common_scripts\utility::array_removeundefined( level._id_7E28 ) );
}

_id_7E29( var_0 )
{
    if ( !isdefined( level._id_7E2A ) )
        level._id_7E2A = 0;

    level endon( "stop_doing_fake_fire_forever" );
    level endon( "manage_fake_fire_windows_trigger" );
    common_scripts\utility::flag_wait( "player_unloaded" );

    if ( !isdefined( level._id_7E2B ) )
        level._id_7E2B = 0;

    var_1 = maps\_utility::_id_1BF9( var_0, "targetname" );
    var_2 = [];
    var_3 = gettime();

    foreach ( var_5 in var_1 )
    {
        var_5._id_7E2C = _id_7E2E( var_3 );

        if ( !isdefined( var_5.target ) )
            continue;

        var_6 = maps\_utility::_id_1BF9( var_5.target, "targetname" );

        if ( !isdefined( var_6 ) )
            continue;

        var_2 = maps\_utility::_id_1843( var_2, var_6 );
    }

    for (;;)
    {
        var_8 = 2000;
        var_9 = gettime();

        foreach ( var_5 in var_1 )
        {
            var_11 = var_5._id_7E2C;

            if ( var_11 < var_8 )
                var_8 = var_11;

            if ( var_9 > var_11 )
                var_5 thread _id_7E2F( var_2 );
        }

        _id_7E2D( var_8 );
    }
}

_id_7E13()
{
    thread _id_7E29( "event1_ambient_left_bullets" );
    thread _id_7E29( "event1_ambient_right_bullets" );
}

_id_7E2D( var_0 )
{
    if ( var_0 == 0 )
        return;

    wait(var_0 / 1000);
}

_id_7E2E( var_0 )
{
    var_1 = 0;

    if ( level._id_7E2A )
    {
        if ( level.player maps\_utility::_id_1008( "player_has_red_flashing_overlay" ) )
            var_1 = 2400;
        else
            var_1 = 560.0;
    }
    else
        var_1 = randomintrange( 1400, 2400 );

    return var_0 + var_1;
}

_id_7E2F( var_0 )
{
    self._id_7E2C = gettime() + 100000;
    var_1 = randomintrange( 5, 12 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = common_scripts\utility::random( var_0 ).origin + common_scripts\utility::randomvector( 50 );

        if ( level._id_7E2A )
        {
            if ( level.player maps\_utility::_id_1008( "player_has_red_flashing_overlay" ) )
                wait 2.4;

            if ( !level._id_7E2A )
                continue;

            magicbullet( "m4m203_acog_payback", self.origin, level.player getcentroid() );
            wait 0.15;
            continue;
        }
        else
            magicbullet( "mp5_drone", self.origin, var_3 );

        wait(randomfloatrange( 100, 150 ) / 1000);
    }

    self._id_7E2C = _id_7E2E( gettime() );
}

_id_7E30()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
        var_2.diequietly = 1;

    maps\_utility::_id_26BE( var_0 );
}

_id_786F( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    level._id_786A = maps\_utility::_id_2672( level._id_786A );
    var_2 = sortbydistance( level._id_786A, var_1.origin );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) )
        {
            var_4 setgoalpos( var_1.origin );
            wait(randomfloatrange( 1, 2 ));
        }
    }
}

_id_7E31( var_0 )
{
    var_0._id_7E32 = [];
    var_0._id_7E33 = common_scripts\utility::getfx( "tank_water_splash_loop" );
    var_0._id_7E34 = common_scripts\utility::getfx( "tank_water_splash_ring" );
    var_0._id_7E35 = 0.15;
    var_0._id_7E36 = 6;
    var_0._id_7E32 = [ "tag_wheel_back_left", "tag_wheel_back_right", "tag_wheel_front_left", "tag_wheel_front_right", "tag_wheel_middle_left", "tag_wheel_middle_right" ];
}

_id_7E37( var_0 )
{
    if ( isdefined( self._id_7E38 ) )
        return;

    self notify( "water_splash" );
    self endon( "water_splash" );
    self._id_7E38 = 1;

    if ( !isdefined( var_0._id_7E39 ) )
    {
        var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        var_0._id_7E39 = var_1.origin[2];
    }

    if ( !isdefined( self._id_29C5 ) )
    {
        self._id_29C5 = common_scripts\utility::spawn_tag_origin();
        self._id_29C5 linkto( self, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        thread _id_7E3A( self._id_29C5 );
    }

    self._id_29C5 endon( "death" );
    var_2 = maps\_vehicle::get_dummy();
    var_3 = self._id_29C5;

    if ( !isdefined( self._id_29C7 ) )
    {
        var_4 = spawnstruct();
        self._id_29C7 = var_4;
        [[ self._id_29BF ]]( var_4 );
    }
    else
        var_4 = self._id_29C7;

    var_4._id_7E39 = var_0._id_7E39;
    var_5 = var_4._id_7E36;
    var_6 = 1;

    while ( var_3 istouching( var_0 ) )
    {
        wait(var_4._id_7E35);

        for ( var_7 = 0; var_7 < var_4._id_7E32.size; var_7++ )
            _id_7E3B( var_7, var_6 );

        var_2 = maps\_vehicle::get_dummy();

        if ( var_2 != self )
        {
            var_3 = var_2;
            continue;
        }

        var_3 = self._id_29C5;
    }

    self._id_7E38 = undefined;
    [[ self._id_29BF ]]( var_4 );
}

_id_7E3A( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );
    var_0 delete();
}

_id_7E3B( var_0, var_1 )
{
    var_2 = self._id_29C7;
    var_3 = maps\_vehicle::get_dummy();
    var_4 = var_2._id_7E32[var_0];
    var_5 = var_3 gettagorigin( var_4 );
    var_6 = var_5 + ( 0.0, 0.0, 150.0 );
    var_7 = var_5 - ( 0.0, 0.0, 150.0 );
    var_8 = bullettrace( var_6, var_7, 0, self );

    if ( var_8["surfacetype"] != "water" )
        return;

    var_6 = var_8["position"];

    if ( abs( var_6[2] - var_2._id_7E39 ) > 100 && !var_6[2] < var_2._id_7E39 )
        return;

    var_9 = common_scripts\utility::flat_angle( var_3 gettagangles( var_4 ) );
    var_10 = anglestoforward( var_9 );
    var_11 = anglestoup( var_9 );
    playfx( var_2._id_7E33, var_6, var_11, var_10 );

    if ( var_1 )
        playfx( var_2._id_7E34, var_6, var_11, var_10 );
}

_id_7E3C()
{
    self._id_29BE = ::_id_7E37;
    self._id_29BF = ::_id_7E31;
}

_id_7E3D( var_0 )
{
    if ( isdefined( var_0._id_29BE ) )
        var_0 thread [[ var_0._id_29BE ]]( self );

    thread maps\_utility::_id_2830( ::_id_7E3D );
}

_id_7E3E()
{
    maps\_compass::setupminimap( "compass_map_hamburg", "city_minimap_corner" );
    level._id_7E04 notify( "stop_vehicle_shoot_shock" );
    level notify( "stop_doing_fake_fire_forever" );
    level._id_7E04 vehicleusealtblendedaudio( 0 );
    level._id_7E04 setmodel( "vehicle_m1a1_abrams_viewmodel" );
    maps\_utility::_id_194E( "hamburg_tankgun_city" );
    level._id_7E04 thread _id_7E40();
    level._id_7E04 _id_7E3F();
    vehicle_scripts\_m1a1_player_control::_id_7DC0( level._id_7E04 );
    level._id_7E04 thread maps\hamburg_tank_ai::_id_7D9C();
}

_id_7E3F()
{
    if ( isdefined( level._id_7E04.mgturret[1] ) )
        level._id_7E04.mgturret[1] delete();

    level._id_7E04.mgturret = common_scripts\utility::array_removeundefined( level._id_7E04.mgturret );
}

_id_7E40()
{
    _id_7E63();

    foreach ( var_1 in self._id_0A39 )
    {
        if ( isalive( var_1 ) && var_1._id_2252 == 2 )
            var_1 delete();
    }
}

_id_7E41( var_0 )
{
    var_1 = getvehiclenode( var_0, "targetname" );
    self vehicle_teleport( var_1.origin, var_1.angles );
    self._id_29B8 = 1;
}

_id_7E42( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 == 0 )
        var_2 = getvehiclenode( var_0, "targetname" );
    else
        var_2 = getvehiclenode( var_0, "target" );

    if ( var_2 maps\_utility::_id_133C( "doing_path_section" ) )
        return;

    var_2 maps\_utility::_id_1402( "doing_path_section" );

    if ( _id_7E44() )
        _id_7E41( var_0 );

    self attachpath( var_2 );
    self startpath( var_2 );
    thread maps\_vehicle::_id_26A1( var_2 );
    thread _id_7E45( var_2 );
}

_id_7E43( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 == 0 )
        var_2 = getvehiclenode( var_0, "targetname" );
    else
        var_2 = getvehiclenode( var_0, "target" );

    self startpath( var_2 );
    thread maps\_vehicle::_id_26A1( var_2 );
}

_id_7E44()
{
    if ( !isdefined( self._id_29B8 ) )
        return 1;

    return 0;
}

_id_7E45( var_0 )
{
    self waittill( "reached_end_node" );
    var_0 maps\_utility::_id_13DC( "doing_path_section" );
}

_id_7E46()
{
    var_0 = getvehiclenode( self.target, "targetname" );
    var_1 = var_0 maps\_utility_code::_id_144C();
    _id_7E47( var_1, self.origin );
}

_id_7E47( var_0, var_1 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0._id_29C6 = var_1;

    if ( !isdefined( var_0._id_29AD ) )
        var_0._id_29AD = [];

    var_0 maps\hamburg_tank_ai::_id_7DAF();
}

_id_7E48()
{
    self notify( "new_shoot_explode" );
    self endon( "new_shoot_explode" );

    if ( !issubstr( self.classname, "m1a1" ) && !issubstr( self.classname, "t90" ) )
        return;

    thread _id_7E67();
    self setvehweapon( "m1a1_turret_blank" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_fired" );
        maps\_vehicle::_id_25AB( "turret_fire" );
        _id_7E51();
        var_0 = _id_7E4A();
        _id_7E4B( var_0 );
    }
}

_id_7E49( var_0 )
{
    var_1 = [ ( 1.0, 0.0, 0.0 ), ( 0.0, 1.0, 0.0 ), ( -1.0, 0.0, 0.0 ), ( 0.0, -1.0, 0.0 ), ( 0.0, 0.0, 1.0 ), ( 0.0, 0.0, -1.0 ) ];

    foreach ( var_3 in var_1 )
    {
        var_4 = bullettrace( var_0, var_0 + var_3 * 256, 0, self );

        if ( var_4["fraction"] == 1.0 )
            continue;

        if ( !isdefined( var_4["surfacetype"] ) )
            continue;

        var_5 = var_4["surfacetype"];
        var_6 = vectortoangles( var_4["normal"] );
        playfx( common_scripts\utility::getfx( "tank_blast_decal_" + var_5 ), var_4["position"], anglestoforward( var_6 ), anglestoup( var_6 ) );
    }
}

_id_7E4A()
{
    var_0 = self gettagorigin( "tag_flash" );
    var_1 = common_scripts\utility::tag_project( "tag_flash", 99999 );
    var_2 = bullettrace( var_0, var_1, 1, self );
    var_3 = var_2["surfacetype"];
    var_4 = isdefined( var_2["entity"] );

    if ( !isdefined( var_3 ) )
        return var_2;

    if ( var_2["fraction"] == 1 )
        return var_2;

    var_5 = -1 * anglestoforward( self gettagangles( "tag_flash" ) );
    var_6 = vectortoangles( var_2["normal"] );
    var_7 = var_2;

    if ( var_4 )
    {
        var_8 = bullettrace( var_2["position"], var_2["position"] + ( 0.0, 0.0, -10000.0 ), 0, var_2["entity"] );
        var_7 = var_2;

        if ( var_2["entity"].origin[2] - var_8["position"][2] < 54 )
        {
            var_6 = vectortoangles( var_8["normal"] );
            var_7 = var_8;
        }
    }

    if ( isdefined( level._id_7E04 ) && self == level._id_7E04 )
    {
        _id_7E49( var_7["position"] + vectornormalize( var_7["normal"] ) * 77 );
        playfx( common_scripts\utility::getfx( "tank_blast_decal_" + var_3 ), var_7["position"], anglestoforward( var_6 ), anglestoup( var_6 ) );
    }

    var_9 = 500;
    physicsexplosionsphere( var_2["position"], var_9 + 300, var_9 * 0.25, 1 );
    var_6 = vectortoangles( var_5 );
    playfx( common_scripts\utility::getfx( "tank_blast_" + var_3 ), var_2["position"], anglestoforward( var_6 ), anglestoup( var_6 ) );
    thread common_scripts\utility::play_sound_in_space( "grenade_explode_default", var_2["position"] );
    return var_2;
}

_id_7E4B( var_0 )
{
    var_1 = self.script_team == "axis";

    if ( var_1 )
        level.player setcanradiusdamage( 0 );

    var_2 = self;
    var_3 = isdefined( var_0["entity"] );
    radiusdamage( var_0["position"], self._id_29B3, self._id_29B1, self._id_29B2, self );

    if ( var_3 )
    {
        if ( issubstr( var_0["entity"].classname, "t90" ) || issubstr( var_0["entity"].classname, "btr" ) )
        {
            if ( isdefined( var_0["entity"].godmode ) && var_0["entity"].godmode )
            {

            }
            else
                var_0["entity"] kill();
        }
    }

    if ( var_1 )
        level.player setcanradiusdamage( 1 );
}

_id_7E4C( var_0, var_1, var_2 )
{
    self._id_7E4D = self._id_29B3;
    self._id_29B3 = var_0;
    self._id_7E4E = self._id_29B1;
    self._id_29B1 = var_1;
    self._id_7E4F = self._id_29B2;
    self._id_29B2 = var_2;
}

_id_7E50()
{
    self._id_29B3 = self._id_7E4D;
    self._id_29B1 = self._id_7E4E;
    self._id_29B2 = self._id_7E4F;
    self._id_7E4D = undefined;
    self._id_7E4E = undefined;
    self._id_7E4F = undefined;
}
#using_animtree("vehicles");

_id_7E51()
{
    self clearanim( %abrams_shoot_kick, 0 );
    self setanimrestart( %abrams_shoot_kick );
}

_id_7E52()
{
    var_0 = getentarray( "beach_area", "script_noteworthy" );
    wait 1;
    maps\_utility::_id_27DE( var_0, 1 );
    wait 1;
    maps\_utility::_id_27DF( var_0, 1 );
    wait 1;
    maps\_utility::_id_27E0( var_0, 1 );
    wait 1;
    _id_7E55( var_0 );
    wait 1;
    _id_7E56( var_0 );
    wait 1;
    _id_7E53( var_0 );
    wait 1;
    maps\_utility::_id_2822( "beach_area", 1 );
}

_id_7E53( var_0 )
{
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1._id_7DE8 = 1;
    var_2 = [];
    var_3 = 0;
    var_4 = [ "script_model", "script_vehicle", "script_brushmodel", "trigger_multiple" ];

    foreach ( var_6 in var_4 )
    {
        var_7 = getentarray( var_6, "classname" );

        foreach ( var_9 in var_0 )
        {
            foreach ( var_11 in var_7 )
            {
                var_3++;
                var_3 %= 3;

                if ( var_3 == 1 )
                    wait 0.05;

                if ( !isdefined( var_11 ) )
                    continue;

                if ( isspawner( var_11 ) )
                    continue;

                if ( isdefined( var_11.targetname ) )
                {
                    if ( var_11.targetname == "helicopter_crash_location" )
                        continue;

                    if ( var_11.targetname == "tank_crew_2" )
                        continue;

                    if ( var_11.targetname == "tank_crew_1" )
                        continue;

                    if ( var_11.targetname == "intelligence_item" )
                        continue;
                }

                if ( isdefined( var_11.script_noteworthy ) )
                {
                    if ( var_11.script_noteworthy == "special_place_in_my_heart" )
                        continue;
                }

                if ( var_11.classname == "script_vehicle_collmap" )
                    continue;

                if ( isdefined( var_11._id_7DE8 ) )
                    continue;

                var_12 = 0;

                if ( issubstr( var_11.classname, "trigger_multiple_bcs" ) )
                    var_12 = 1;

                var_1.origin = var_11 getorigin();

                if ( !var_1 istouching( var_9 ) )
                    continue;

                if ( maps\_utility::_id_0AD1( var_9.fx, var_11 ) )
                    continue;

                if ( maps\_utility::_id_0AD1( var_0, var_11 ) )
                    continue;

                var_11 delete();

                if ( var_12 )
                    anim._id_0B52 = common_scripts\utility::array_removeundefined( anim._id_0B52 );
            }
        }
    }

    var_1 delete();
}

_id_7E54()
{
    maps\_utility::_id_2822( "bridge_and_before_garage_area", 1 );
    wait 1;
    var_0 = getentarray( "bridge_and_before_garage_area", "script_noteworthy" );
    maps\_utility::_id_27DE( var_0, 1 );
    wait 1;
    maps\_utility::_id_27DF( var_0, 1 );
    wait 1;
    maps\_utility::_id_27E0( var_0, 1 );
    wait 1;
    _id_7E55( var_0 );
    wait 1;
    _id_7E56( var_0 );
    wait 1;
    _id_7E53( var_0 );
    wait 1;
    maps\_utility::delaythread( 1.1, ::_id_7E52 );
}

_id_7E55( var_0 )
{
    var_1 = getaiarray();
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3 = [];
    var_4 = 0;

    foreach ( var_6 in var_0 )
    {
        foreach ( var_8 in var_1 )
        {
            var_4++;
            var_4 %= 5;

            if ( var_4 == 1 )
                wait 0.05;

            if ( !isdefined( var_8 ) )
                continue;

            var_2.origin = var_8 getorigin();

            if ( !var_2 istouching( var_6 ) )
                continue;

            if ( isdefined( var_8._id_7DE8 ) )
                continue;

            var_8 delete();
        }
    }

    var_2 delete();
}

_id_7E56( var_0 )
{
    var_1 = getentarray( "script_vehicle_corpse", "classname" );
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        foreach ( var_7 in var_1 )
        {
            var_2.origin = var_7 getorigin();

            if ( !var_2 istouching( var_5 ) )
                continue;

            if ( isdefined( var_7._id_2AB9 ) )
                var_7._id_2AB9 delete();

            var_7 delete();
        }
    }

    var_2 delete();
}

_id_7E57( var_0 )
{
    level endon( "stop_concrete_cracks" );
    self endon( "death" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    var_1 = 5;
    var_2 = 0;
    var_3 = [ "tag_wheel_front_left", "tag_wheel_front_right" ];
    var_4 = [ "tag_wheel_back_left", "tag_wheel_back_right", "tag_wheel_middle_left", "tag_wheel_middle_right", "tag_wheel_front_left", "tag_wheel_front_right" ];

    for (;;)
    {
        wait 0.15;

        foreach ( var_6 in var_4 )
        {
            var_7 = self gettagorigin( var_6 );
            var_8 = bullettrace( var_7, var_7 + ( 0.0, 0.0, -10000.0 ), 1, self );
            var_9 = vectortoangles( var_8["normal"] );
            playfx( common_scripts\utility::getfx( "tank_concrete_cracks_spitup" ), var_8["position"], anglestoforward( var_9 ), anglestoup( var_9 ) );
        }

        var_2++;
        var_2 %= var_1;

        if ( var_2 )
            continue;

        foreach ( var_6 in var_3 )
        {
            var_7 = self gettagorigin( var_6 );
            var_8 = bullettrace( var_7, var_7 + ( 0.0, 0.0, -10000.0 ), 1, self );
            var_9 = vectortoangles( var_8["normal"] );
            playfx( common_scripts\utility::getfx( "tank_concrete_cracks" ), var_8["position"], anglestoforward( var_9 ), anglestoup( var_9 ) );
        }
    }
}

_id_5091()
{
    if ( !isai( self ) )
        return;

    self.grenadeammo = 0;
}

_id_7E58()
{
    var_0 = common_scripts\utility::get_linked_ents();

    if ( !var_0.size )
        return undefined;

    return var_0[0];
}

_id_7E59()
{
    var_0 = _id_7E58();

    if ( !isdefined( var_0 ) )
        return;

    self endon( "masking_destructible" );
    self notify( "tank_crushable_carthink" );
    self endon( "tank_crushable_carthink" );
    var_1 = undefined;

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( !isdefined( var_1 ) || var_1 != var_2 )
        {
            if ( isdefined( var_0.script_soundalias ) )
            {
                if ( !issubstr( var_0.script_soundalias, "_player_" ) || distance( level.player.origin, self.origin ) < 800 )
                    thread common_scripts\utility::play_sound_in_space( var_0.script_soundalias, self.origin );
            }

            var_1 = var_2;
        }

        wait 2;

        if ( distance( var_2.origin, self.origin ) > 240 )
            continue;

        thread _id_7E60();
        playfx( common_scripts\utility::getfx( "tank_crush" ), self.origin );
        self hide();
        var_3 = common_scripts\utility::spawn_tag_origin();

        if ( issubstr( self.model, "vehicle_luxurysedan_2008" ) )
            var_3 setmodel( "vehicle_luxurysedan_2008_crush" );

        if ( issubstr( self.model, "vehicle_luxurysedan_2008_gray" ) )
            var_3 setmodel( "vehicle_luxurysedan_2008_gray_crush" );

        if ( issubstr( self.model, "vehicle_luxurysedan_2008_white" ) )
            var_3 setmodel( "vehicle_luxurysedan_2008_white_crush" );

        var_3 thread maps\_utility::play_sound_on_entity( "hamburg_crush_tank" );
        var_3 show();
        var_0 delete();
        return;
    }
}

_id_7E5A( var_0 )
{
    if ( !isdefined( level._id_282E ) )
        return;

    if ( !isdefined( level._id_282E[var_0] ) )
        return;

    maps\_utility::_id_282E( var_0 );
}

_id_7E5B( var_0 )
{
    wait(randomfloatrange( 1, 2 ));
    var_0 _id_7E5C( 3 );
    level._id_7E1B _id_7E5C( 3 );
    var_0 notify( "stop_crawl_while_axis_alivethink" );
}

_id_7E5C( var_0 )
{
    if ( isdefined( self._id_29C3 ) )
    {
        if ( self._id_29C3.size )
            return;
    }

    self resumespeed( var_0 );
}

_id_7E5D( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_29C3 ) )
    {
        if ( self._id_29C3.size )
            return;
    }

    self vehicle_setspeed( var_0, var_1, var_2 );
}

_id_7E5E( var_0 )
{
    var_1 = getaiarray( "axis" );

    if ( !var_1.size )
        return;

    var_0 notify( "stop_crawl_while_axis_alivethink" );
    var_0 endon( "stop_crawl_while_axis_alivethink" );
    var_0 _id_7E5D( 3, 15, 15 );
    level._id_7E1B _id_7E5D( 3, 15, 15 );

    while ( getaiarray( "axis" ).size )
    {
        var_2 = getaiarray( "axis" );
        var_3 = 5;

        if ( var_2.size < 6 )
            var_3 = 6;

        if ( var_2.size < 4 )
            var_3 = 8;

        if ( var_2.size < 3 )
            var_3 = 10;

        if ( var_2.size < 2 )
            var_3 = 14;

        var_0 _id_7E5D( var_3, 15, 15 );
        level._id_7E1B _id_7E5D( var_3, 15, 15 );
        wait 0.15;
    }

    _id_7E5B( var_0 );
}

_id_7E5F()
{
    if ( self == level._id_284F || self.script_team == "allies" )
        thread _id_7E60();

    self fireweapon();
}

_id_7E60()
{
    if ( !isdefined( level._id_7E04 ) )
        return;

    level.player endon( "going_inside" );
    level.player notify( "stop_protect_player_for_a_bit" );
    level.player endon( "stop_protect_player_for_a_bit" );
    level.player enableinvulnerability();
    waittillframeend;

    if ( isdefined( level.player._id_7E61 ) && level.player._id_7E61 )
        return;

    level.player disableinvulnerability();
}

_id_7967( var_0 )
{
    foreach ( var_2 in var_0._id_2974 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "player_spot" )
        {
            var_2 notsolid();
            var_0._id_7E62 = var_2;
            var_2 hide();
            return var_2;
        }
    }
}

_id_7E63()
{
    foreach ( var_1 in self._id_0A39 )
    {
        if ( isdefined( var_1._id_0D04 ) )
            var_1 maps\_utility::_id_1902();
    }
}

_id_7E64()
{
    var_0 = common_scripts\utility::get_linked_ents();

    if ( var_0.size > 0 )
        return var_0[0];

    var_0 = common_scripts\utility::get_linked_vehicle_nodes();

    if ( var_0.size > 0 )
        return var_0[0];
}

_id_7E65()
{
    var_0 = _id_7E64();
    var_0 waittill( "trigger" );
    var_1 = maps\_utility::_id_2642( self.target, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    var_1 _id_7E63();

    if ( self.target != "extra_osprey" )
        var_1 maps\_vehicle::_id_2A13();

    var_1._id_29CC = 1;
    var_2 = magicbullet( "javelin_no_explode", self.origin, var_1 getcentroid() );
    var_2 missile_setflightmodedirect();
    var_2 missile_settargetent( var_1 );
}

_id_7E66()
{
    self._id_2955 = 1;
    self sethoverparams( 233, 222, 55 );
    thread maps\hamburg_tank_ai::_id_7DA0();
}

_id_7E67()
{
    self notify( "test_hamburg_tank_anim" );
    self endon( "test_hamburg_tank_anim" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self setanim( %hamburg_tank_explosion );
}

_id_7E68( var_0 )
{
    level._id_7D9D = gettime() + var_0;
}

_id_7E69()
{
    var_0 = common_scripts\utility::get_linked_vehicle_nodes();
    common_scripts\utility::array_thread( var_0, ::_id_7E6D, self );
    self._id_7E6A = 0;
    maps\_utility::_id_2830( ::_id_7E6B );
}

_id_7E6B( var_0 )
{
    self._id_7E6A = 1;

    if ( isdefined( self.classname ) )
        self delete();
}

_id_7E6C()
{
    if ( !isdefined( self.classname ) )
        var_0 = maps\_utility_code::_id_144C();
    else
        self waittill( "trigger", var_0 );

    return var_0;
}

_id_7E6D( var_0 )
{
    self endon( "forced_open" );
    self._id_7E6E = 0;
    self._id_7E6F = var_0;
    var_1 = _id_7E6C();

    if ( !isdefined( var_0 ) || var_0._id_7E6A )
        return;

    var_1 endon( "death" );
    var_2 = self.script_linkname;
    var_1 maps\_vehicle::_id_29C3( "tank_gate_open" + var_2, 15, 15 );
    var_0 _id_7E6C();
    var_1 maps\_vehicle::_id_2B1C( "tank_gate_open" + var_2 );
}

_id_7E70()
{
    if ( !isdefined( self._id_2941 ) )
        return;

    self endon( "kill_badplace_forever" );

    if ( !self isphysveh() )
        self endon( "death" );

    self endon( "delete" );
    var_0 = isdefined( level._id_29D2[self.model] ) && level._id_29D2[self.model];
    var_1 = 17;
    var_2 = 17;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( !isdefined( self._id_2941 ) || !self._id_2941 )
        {
            while ( isdefined( self ) && ( !isdefined( self._id_2941 ) || !self._id_2941 ) )
                wait 0.5;

            if ( !isdefined( self ) )
                return;
        }

        var_3 = self vehicle_getspeed();

        if ( var_3 <= 0 )
        {
            wait 0.5;
            continue;
        }

        if ( var_3 < 5 )
            var_4 = 180;
        else if ( var_3 > 5 && var_3 < 8 )
            var_4 = 230;
        else
            var_4 = 280;

        if ( isdefined( self._id_29B4 ) )
            var_4 *= self._id_29B4;

        if ( var_0 )
            var_5 = anglestoforward( self gettagangles( "tag_turret" ) );
        else
            var_5 = anglestoforward( self.angles );

        var_6 = common_scripts\utility::tag_project( "tag_origin", 148 );
        badplace_arc( self.unique_id + "arc", 0.5, self.origin, var_4 * 1.9, 300, var_5, var_1, var_2, "axis", "team3", "allies" );
        badplace_cylinder( self.unique_id + "cyl", 0.5, var_6, var_4, 300, "axis", "team3", "allies" );
        wait 0.55;
    }
}

_id_7E71()
{
    common_scripts\utility::flag_wait( "player_unloaded" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isai( var_0 ) )
        {
            childthread _id_7E73( var_0 );
            continue;
        }

        if ( isplayer( var_0 ) )
            childthread _id_7E72( var_0 );
    }
}

_id_7E72( var_0 )
{
    if ( isdefined( var_0._id_7E73 ) && var_0._id_7E73 )
        return;

    var_0._id_7E73 = 1;
    wait(randomfloatrange( 0.7, 1.5 ));
    var_1 = [];

    while ( var_0 istouching( self ) )
    {
        if ( var_1.size )
            var_2 = maps\_utility::_id_1EE9( var_0.origin, "allies", var_1 );
        else
            var_2 = maps\_utility::_id_1EE9( var_0.origin, "allies" );

        if ( isdefined( var_2 ) && isdefined( var_2._id_0EF1 ) )
        {
            var_1[var_1.size] = var_2;
            continue;
        }

        if ( !isdefined( var_2 ) || distancesquared( var_2.origin, var_0.origin ) > 202500 )
        {
            level._id_7E2A = 1;
            level.player.attackeraccuracy = 20000;
            level.player.threatbias = 20000;
        }
        else
            _id_7E17();

        wait 0.15;
    }

    _id_7E17();
    var_0._id_7E73 = 0;
}

_id_7E17()
{
    level.player maps\_gameskill::_id_17D2();
    level._id_7E2A = 0;
}

_id_7E73( var_0 )
{
    if ( isdefined( var_0._id_7E73 ) && var_0._id_7E73 )
        return;

    if ( var_0.team == "axis" )
        return;

    var_0._id_7E73 = 1;
    var_0 notify( "no_mans_land_AI" );
    var_0 endon( "no_mans_land_AI" );
    var_0 endon( "death" );
    var_0 maps\_utility::_id_2712();

    while ( var_0 istouching( self ) )
        wait 0.2;

    var_0 maps\_utility::_id_2713();
    var_0._id_7E73 = 0;
}

_id_7E74()
{
    maps\_utility_code::_id_144C();
    var_0 = common_scripts\utility::get_linked_ents();

    if ( var_0.size == 0 )
        return;

    var_0[0] notify( "trigger", level.player );

    if ( isdefined( self.classname ) )
        self delete();
}

_id_7E75()
{
    for (;;)
    {
        self waittill( "trigger" );

        while ( level.player istouching( self ) )
        {
            _id_7E76();
            wait(randomfloatrange( 5, 10 ));
        }
    }
}

_id_7E76()
{
    var_0 = strtok( self._id_134B, " " );
    var_1 = 0;
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_5 = maps\_utility::_id_1377( "allies", var_4 );
        var_1 += var_5.size;
        var_6 = spawnstruct();
        var_6._id_7E77 = var_5.size;
        var_6._id_7E78 = 0;
        var_2[var_4] = var_6;
    }

    var_8 = level._id_7E1A - var_1;

    if ( var_8 <= 0 )
        return;

    for ( var_9 = 0; var_9 < var_8; var_9++ )
    {
        var_10 = 80;
        var_11 = "";

        foreach ( var_4 in var_0 )
        {
            if ( var_2[var_4]._id_7E77 < var_10 )
            {
                var_11 = var_4;
                var_10 = var_2[var_4]._id_7E77;
            }
        }

        var_2[var_11]._id_7E78++;
        var_2[var_11]._id_7E77++;
    }

    foreach ( var_4 in var_0 )
    {
        if ( var_2[var_4]._id_7E78 == 0 )
            continue;

        _id_7E79( var_4, self.target, var_2[var_4]._id_7E78 );
    }
}

_id_7E79( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( !isdefined( var_2 ) )
    {
        var_2 = level._id_7E1A;
        var_3 = 1;
    }

    var_4 = maps\_utility::_id_1377( "allies", var_0 );
    var_5 = common_scripts\utility::getstructarray( var_1, "targetname" );
    var_5 = maps\_utility::_id_0B53( var_5 );

    if ( var_3 )
        var_6 = var_2 - var_4.size;
    else
        var_6 = var_2;

    var_7 = getent( "master_replenish_spawner", "targetname" );

    for ( var_8 = 0; var_8 < var_6; var_8++ )
    {
        var_7.count = 1;
        var_7.origin = var_5[var_8].origin;

        if ( isdefined( var_5[var_8].angles ) )
            var_7.angles = var_5[var_8].angles;

        var_9 = var_7 maps\_utility::_id_166F( 1 );

        if ( !isdefined( var_9 ) )
            continue;

        var_9 thread maps\_utility::_id_13A4( var_0 );
        var_9 thread _id_7E7A();
        wait 0.05;

        if ( maps\_utility::_id_2685().size > level._id_7E1A )
            return;
    }
}

_id_7E7A()
{
    self endon( "death" );
    self.ignoreme = 1;
    maps\_utility::_id_2712();
    wait 3;
    self.ignoreme = 0;
    maps\_utility::_id_2713();
}

_id_7E7B( var_0, var_1 )
{
    while ( isdefined( var_0 ) )
        wait 0.05;

    self call [[ var_1 ]]();
}

_id_7E7C()
{
    var_0 = maps\_utility_code::_id_144C();
    var_0 maps\_vehicle::_id_29C3( "tank_stop_for_enemies", 15, 15 );

    for (;;)
    {
        var_1 = common_scripts\utility::get_linked_ents();
        var_2 = 0;

        foreach ( var_4 in var_1 )
        {
            if ( !isspawner( var_4 ) && isalive( var_4 ) )
            {
                var_2 = 1;
                break;
            }

            if ( isspawner( var_4 ) && !isdefined( var_4._id_2972 ) )
            {
                var_2 = 1;
                break;
            }
        }

        if ( !var_2 )
            break;

        wait(randomfloatrange( 0.5, 2 ));
    }

    var_0 maps\_vehicle::_id_2B1C( "tank_stop_for_enemies" );
}

_id_7E7D()
{
    self waittill( "trigger" );
    level notify( "manage_fake_fire_windows_trigger" );
    thread _id_7E29( self.target );
    self delete();
}

_id_7E7E()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = var_0 common_scripts\utility::get_linked_ent();
    var_1 endon( "trigger" );

    while ( var_0 maps\_utility::_id_2789( "allies" ).size )
        wait 0.1;

    var_1 notify( "trigger" );
    self delete();
}

_id_7E7F()
{
    _id_7E81( "reverse" );
}

_id_7E80()
{
    _id_7E81( "forward" );
}

_id_7E81( var_0 )
{
    var_1 = _id_7E64();
    var_2 = maps\_utility_code::_id_144C();
    wait 0.5;
    var_2.veh_transmission = var_0;
    var_2._id_291B = var_0;
    var_2 vehicle_setspeed( 10, 10, 10 );
    var_2 common_scripts\utility::delaycall( 2, ::resumespeed, 10 );
    var_2 startpath( var_1 );
    var_2 thread maps\_vehicle::_id_26A1( var_1 );
}

_id_7E82( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = maps\_utility::_id_1BF9( "on_foot_start", "targetname" );
    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( var_4._id_1FDB == level._id_1F19 )
        {
            var_2 = var_4;
            continue;
        }

        maps\_utility::_id_1BF9( var_4.target, "targetname" );
    }

    if ( isdefined( var_2 ) )
        return var_2;

    if ( var_0 )
        return;
}

_id_7E83( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );
    maps\_utility::_id_27DB( var_1 );
    maps\_utility::_id_27DC( var_1 );
}

_id_7E10( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 maps\_utility::_id_27E1();

    _id_7E1E();
}

_id_7E84()
{
    if ( isalive( level._id_45C0 ) )
        return level._id_45C0;

    var_0 = getent( "sandman_spawner", "targetname" );
    level._id_45C0 = var_0 maps\_utility::_id_166F( 1 );
    return level._id_45C0;
}

_id_4B63()
{
    self._id_1032 = "sandman";
    level._id_7E85 = self;
    level._id_45C0 = self;
    maps\_utility::_id_26C7();
    maps\_utility::_id_13A4( "red" );
    maps\_utility::_id_0D04();
    self._id_7DE8 = 1;
}

_id_7E86()
{
    var_0 = maps\_utility_code::_id_144C();
    var_0 endon( "death" );

    while ( isalive( var_0 ) )
    {
        badplace_cylinder( var_0.unique_id + "bad_place_till_deaththink", 1, var_0.origin, 600, 600, "allies" );
        wait 1;
    }
}

_id_7E87()
{
    var_0 = self.spawner._id_7E88;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 _id_7E8B() )
        level notify( "goal_think_triggered_new" );

    waittillframeend;

    if ( !isdefined( self ) )
        return;

    level endon( "goal_think_triggered_new" );

    if ( !isdefined( var_0._id_7E89 ) )
        return;

    var_1 = 0;

    if ( !isdefined( var_0._id_7E8A ) )
        var_0._id_7E8A = var_0._id_7E89;

    if ( var_0._id_7E8A == 0 )
    {
        var_0._id_7E8A = undefined;
        return;
    }

    var_0._id_7E8A--;
    self waittill( "death" );
    var_2 = maps\_spawner::_id_2125( var_0, 1 );
    var_2 thread maps\_utility::_id_166F( 0 );
}

_id_7E8B()
{
    var_0 = getentarray( self.targetname, "target" );

    if ( var_0.size )
    {
        foreach ( var_2 in var_0 )
        {
            if ( var_2 maps\_utility::_id_133C( "new_goal_trigger" ) )
                return 0;
            else
                var_2 maps\_utility::_id_1402( "new_goal_trigger" );
        }

        return 1;
    }

    if ( maps\_utility::_id_133C( "new_goal_trigger" ) )
        return 0;

    maps\_utility::_id_1402( "new_goal_trigger" );
    return 1;
}

_id_200E( var_0 )
{
    if ( !isdefined( level._id_7E8C ) )
        level._id_7E8C = 0;

    level._id_7E8C++;
    maps\_drone::_id_2013( var_0, "deathplant" );
    self notsolid();
    thread maps\_drone::_id_2011( 2 );

    if ( isdefined( self ) && isdefined( self._id_200F ) )
        return;

    wait 1;

    while ( isdefined( self ) )
    {
        wait 2;

        if ( _id_7E8D() )
            self delete();
    }

    level._id_7E8C--;
}

_id_7E8D()
{
    if ( distancesquared( level.player.origin, self.origin ) > 1000000 )
        return 1;

    if ( !maps\_utility::within_fov( level.player.origin, level.player.angles, self.origin, 0.5 ) )
        return 1;

    if ( level._id_7E8C > 5 )
        return 1;

    return 0;
}

_id_7E11()
{
    self.suppressionwait = 0;
    self.ignoresuppression = 1;
    self._id_0EEE = 1;
    self._id_0F2D = 1;
    self._id_1106 = 1;
}

_id_7E8E( var_0 )
{
    if ( maps\_vehicle::_id_21ED() )
        return;

    self setturrettargetent( var_0 );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "turret_on_target" );
        self fireweapon();
        self._id_29BB = randomfloatrange( 3, 4 );
        wait(self._id_29BB);
    }
}

_id_7E8F( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] forceteleport( var_1[var_2].origin, ( 0.0, 0.0, 0.0 ) );
}

_id_7E90()
{
    foreach ( var_1 in self.mgturret )
    {
        if ( isdefined( var_1._id_48C4 ) )
        {
            var_1 setmode( var_1._id_48C4 );
            var_1._id_48C4 = undefined;
        }
    }
}

_id_2129( var_0 )
{
    self._id_7E89 = var_0._id_7E89;
    self._id_7E88 = var_0;
}

_id_7E91()
{
    while ( !isdefined( level._id_1FFB ) )
        wait 0.05;

    for (;;)
    {
        foreach ( var_1 in level._id_1FFB["axis"]._id_0C6D )
        {

        }

        wait 0.05;
    }
}

_id_7E92()
{
    wait 0.1;
    var_0 = 12000;

    foreach ( var_2 in level.createfxent )
    {
        var_3 = var_2.v["origin"];

        if ( var_3[1] > var_0 )
            var_2 common_scripts\utility::pauseeffect();
    }

    common_scripts\utility::flag_wait( "tank_crash_exit" );

    foreach ( var_2 in level.createfxent )
    {
        var_3 = var_2.v["origin"];

        if ( var_3[1] > var_0 )
        {
            var_2 maps\_utility::_id_1655();
            continue;
        }

        if ( var_3[1] < var_0 - 1000 )
            var_2 common_scripts\utility::pauseeffect();
    }
}

_id_7E93()
{
    level notify( "putout_fires" );
    var_0 = common_scripts\utility::array_combine( getentarray( "destructible_toy", "targetname" ), getentarray( "destructible_vehicle", "targetname" ) );

    foreach ( var_2 in var_0 )
        var_2 notify( "remove_badplace" );
}

_id_7E94( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( !isdefined( var_7 ) )
        var_7 = 0;

    if ( !isdefined( var_8 ) )
        var_8 = 0;

    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    self playerlinktoblend( var_3, var_4, var_0, var_1, var_2 );
    common_scripts\utility::delaycall( var_0, ::playerlinktodelta, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_5275( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_5369 ) )
    {
        var_4 = level._id_5369;

        if ( isdefined( var_4.entity ) )
        {
            stopfxontag( var_4._id_536B, var_4.entity, var_4._id_536A );

            if ( isdefined( var_4._id_536C ) )
                playfxontag( var_4._id_536C, var_4.entity, var_4._id_536A );
        }

        wait 0.2;
    }

    level notify( "spotlight_changed_owner" );
    common_scripts\utility::waitframe();
    var_4 = spawnstruct();
    var_4._id_536B = common_scripts\utility::getfx( var_0 );

    if ( isdefined( var_1 ) )
        var_4._id_536C = common_scripts\utility::getfx( var_1 );

    var_4.entity = self;
    var_4._id_536A = var_2;
    playfxontag( var_4._id_536B, var_4.entity, var_4._id_536A );

    if ( isdefined( var_3 ) )
        thread _id_536E( var_3 );

    level._id_5369 = var_4;
}

_id_536D()
{
    if ( isdefined( level._id_5369 ) )
    {
        var_0 = level._id_5369;
        stopfxontag( var_0._id_536B, var_0.entity, var_0._id_536A );
        level._id_5369 = undefined;
    }
}

_id_536E( var_0 )
{
    self notify( "new_spot_light_death" );
    self endon( "new_spot_light_death" );
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

_id_7E95( var_0 )
{
    var_1 = maps\_utility::_id_2695( var_0 );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::pauseeffect );
}

_id_7E96( var_0, var_1 )
{
    maps\_utility::_id_2832( var_0 );
    maps\_utility::_id_11F4( var_0, var_1 );
}

_id_7E97()
{
    var_0 = self.model;

    if ( !isdefined( level._id_2A5B[var_0] ) )
        return;

    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_fired" );

        if ( distancesquared( level.player.origin, self.origin ) > 1690000 )
            continue;

        playfxontag( level._id_2A5B[var_0], self, "tag_engine_exhaust" );
        var_1 = self gettagorigin( "tag_flash" );
        var_2 = physicstrace( var_1, var_1 + ( 0.0, 0.0, -128.0 ) );
        physicsexplosionsphere( var_2, 192, 100, 1 );
    }
}

_id_02EB()
{
    var_0 = common_scripts\utility::getfx( "hamburg_tank_red_light" );

    if ( !maps\_utility::_id_133C( "lights_in_tank" ) )
    {
        maps\_utility::_id_1402( "lights_in_tank" );
        maps\_utility::_id_13DC( "lights_in_tank" );
    }
    else if ( maps\_utility::_id_1008( "lights_in_tank" ) )
        return;

    playfxontag( var_0, self, "tag_interior_light_1" );
    wait 0.05;
    playfxontag( var_0, self, "tag_interior_light_2" );
    wait 0.05;
    var_0 = common_scripts\utility::getfx( "hamburg_garage_godray_small" );
    playfxontag( var_0, self, "tag_interior_light_godray" );
}

_id_02EC( var_0 )
{
    var_1 = common_scripts\utility::getfx( "hamburg_tank_red_light" );

    if ( !maps\_utility::_id_133C( "lights_in_tank" ) || !maps\_utility::_id_1008( "lights_in_tank" ) )
        return;

    maps\_utility::_id_13DE( "lights_in_tank" );

    if ( !isdefined( var_0 ) )
    {
        stopfxontag( var_1, self, "tag_interior_light_1" );
        stopfxontag( var_1, self, "tag_interior_light_2" );
    }

    var_1 = common_scripts\utility::getfx( "hamburg_garage_godray_small" );
    stopfxontag( var_1, self, "tag_interior_light_godray" );
}

_id_7E9E()
{
    if ( isdefined( level._id_7E9F ) )
        level._id_7E9F notify( "stop_handler" );

    thread _id_02EB();
    wait 0.1;
    var_0 = common_scripts\utility::getstruct( "garage_crash_light_in_tank", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0.angles = vectortoangles( var_1.origin - var_0.origin );
    var_2 = var_0.angles;
    var_3 = var_0 common_scripts\utility::spawn_tag_origin();
    var_3.angles = var_2;
    var_3 thread _id_5275( "hamburg_garage_godray_small_light", undefined, "tag_origin", var_3 );
    level._id_7EA0 = var_3;
}

_id_00EE()
{
    self notify( "kill_rumble_forever" );
    self stoprumble( "tank_rumble" );
}
