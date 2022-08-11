// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread precachefx();
    common_scripts\utility::flag_init( "fx_zone1" );
    common_scripts\utility::flag_init( "fx_zone2" );
    common_scripts\utility::flag_init( "fx_zone3" );
    common_scripts\utility::flag_init( "fx_zone4" );
    common_scripts\utility::flag_init( "fx_zone5" );
    common_scripts\utility::flag_init( "fx_zone6" );
    common_scripts\utility::flag_init( "fx_zone7" );
    common_scripts\utility::flag_init( "fx_technical_splash" );
    common_scripts\utility::flag_init( "msg_fx_stop_rain" );
    common_scripts\utility::flag_init( "river_allies_stand" );
    common_scripts\utility::flag_init( "msg_scaleshadow" );
    thread _id_54FA();
    thread maps\_shg_fx::_id_445E( 1000, "fx_zone_1000" );
    thread maps\_shg_fx::_id_445E( 2000, "fx_zone_2000" );
    thread maps\_shg_fx::_id_445E( 3000, "fx_zone_3000" );
    thread maps\_shg_fx::_id_445E( 5000, "fx_zone_5000", "fx_zone_5001" );
    thread maps\_shg_fx::_id_445E( 6000, "fx_zone_6000" );
    thread maps\_shg_fx::_id_445E( 7000, "fx_zone_7000" );
    thread maps\_shg_fx::_id_445E( 8000, "fx_zone_8000" );
    thread maps\_shg_fx::_id_445E( 9000, "fx_zone_9000", "fx_zone_9001" );
    thread maps\_shg_fx::_id_445E( 10000, "fx_zone_10000" );
    thread _id_5504();
    thread _id_4780();
    thread _id_551B();
    thread _id_551C();
    thread _id_551E();
    thread maps\_shg_fx::_id_4456();
    _id_4AB6();
    thread _id_54DE();
    thread _id_5519();
    thread _id_54E3();
    thread _id_54E4();
    thread _id_54ED( "shanty_55", 400 );
    thread _id_54ED( "shanty_bldg_58", 0, 1 );
    thread _id_54EA( "shanty_4" );
    thread _id_54EA( "shanty_4c" );
    thread _id_54EA( "shanty_4edeck" );
    thread _id_54EA( "shanty_4edeck2" );
    thread _id_54EA( "shanty_4etop" );
    thread _id_54EA( "shanty_39" );
    thread _id_54EA( "shanty_45" );
    thread _id_54EA( "shanty_45_blocker", 0, 1 );
    thread _id_54EA( "shanty_47" );
    thread _id_54EA( "shanty_60" );
    thread _id_54ED( "shanty_01a", 0, 1 );
    thread _id_54EA( "shanty_4b" );
    thread _id_54EA( "shanty_4b_02", 1 );
    _id_54DD::main();
    maps\_shg_fx::_id_4445();
    thread _id_550D();
}

_id_54DE()
{
    setsaveddvar( "fx_alphathreshold", 9 );
}

_id_54DF()
{
    maps\_shg_fx::_id_4449( "amb_dust_verylight_cheap" );
    maps\_shg_fx::_id_4449( "amb_dust_verylight_small" );
    maps\_shg_fx::_id_4449( "leaves_fall_tropical" );
    thread _id_4AC4();
    wait 1.0;
    level.player setwatersheeting( 1, 2.5 );
    wait 2.0;

    if ( isdefined( level._id_54E0 ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge" ), level._id_54E0, "J_Neck" );

    wait 1.0;

    if ( isdefined( level._id_4877 ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_2" ), level._id_4877, "J_Neck" );

    wait 0.3;
    common_scripts\utility::exploder( 59 );
    wait 1.2;

    if ( isdefined( level._id_54E0.weapon ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_weapon" ), level._id_54E0, "TAG_FLASH" );

    wait 1.3;
    common_scripts\utility::exploder( 58 );
    wait 0.9;

    if ( isdefined( level._id_4877.weapon ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_weapon" ), level._id_4877, "TAG_FLASH" );

    maps\_shg_fx::_id_444A( "leaves_fall_tropical" );
    wait 14.3;
    maps\_shg_fx::_id_444A( "amb_dust_verylight_small" );

    if ( isdefined( level._id_54E0 ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_3" ), level._id_54E0, "J_Neck" );

    wait 1.0;

    if ( isdefined( level._id_4877 ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_4" ), level._id_4877, "J_Neck" );
}

_id_54E1( var_0, var_1 )
{
    wait 1.0;

    if ( isdefined( var_0 ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_player_weapon" ), var_0, "TAG_FLASH" );

    if ( isdefined( var_1 ) )
        playfxontag( common_scripts\utility::getfx( "water_emerge_player_hand" ), var_1, "J_Wrist_RI" );
}

_id_54E2()
{
    playfxontag( common_scripts\utility::getfx( "tread_smk_road_suptech_back" ), self, "tag_wheel_back_left" );
    playfxontag( common_scripts\utility::getfx( "tread_smk_road_suptech_back" ), self, "tag_wheel_back_right" );
    self waittill( "death" );
    stopfxontag( common_scripts\utility::getfx( "tread_smk_road_suptech_back" ), self, "tag_wheel_back_left" );
    stopfxontag( common_scripts\utility::getfx( "tread_smk_road_suptech_back" ), self, "tag_wheel_back_right" );
}

_id_54E3()
{
    level waittill( "exploding_shanty_shanty_4b_02" );
    wait 1.5;
    common_scripts\utility::exploder( 104 );
}

_id_54E4()
{
    level waittill( "exploding_shanty_shanty_4etop" );
    common_scripts\utility::exploder( 105 );
}

_id_54E5()
{
    thread maps\_shg_fx::_id_444E( 0.25, 0.9, 0.1, 0.4 );
    setblur( 3, 0.125 );
    wait 0.35;
    setblur( 0, 0.2 );
}

_id_54E6( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_5 = var_4.origin;
        var_6 = 10000;
        var_7 = undefined;

        foreach ( var_9 in var_1 )
        {
            var_10 = distance( var_9.origin, var_5 );

            if ( var_10 < var_6 )
            {
                var_7 = var_9;
                var_6 = var_10;
            }
        }

        var_2[var_2.size] = var_7;
    }

    return var_2;
}

_id_54E7( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_1 + "_part", "targetname" );
    var_4 = [];

    if ( !isdefined( var_3 ) )
        return undefined;

    foreach ( var_6 in var_3 )
    {
        if ( distance( var_0.origin, var_6.origin ) < var_2 )
            var_4[var_4.size] = var_6;
    }

    return var_4;
}

_id_54E8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_54E7( var_0, var_2, var_3 );

    if ( isdefined( var_4 ) )
        var_4 hide();

    var_8 = var_0.origin;
    var_9 = var_0.angles;

    for (;;)
    {
        var_10 = var_1;
        var_10 waittill( "trigger" );
        level notify( "exploding_shanty_" + var_2 );
        playfx( common_scripts\utility::getfx( var_2 + "_death" ), var_8, ( 0.0, 0.0, 1.0 ) );
        physicsexplosionsphere( var_8, 400, 100, 0.1 );

        if ( isdefined( var_5 ) || !isdefined( var_0 ) )
        {
            var_8 = var_5.origin;
            var_9 = var_5.angles;
        }

        playfx( common_scripts\utility::getfx( var_2 + "_dest" ), var_8, anglestoforward( var_9 ) );

        if ( isdefined( var_10 ) )
            var_10 delete();

        level common_scripts\utility::waitframe();

        if ( isdefined( var_0 ) )
            var_0 delete();

        if ( isdefined( var_4 ) )
            var_4 show();

        if ( isdefined( var_7 ) )
        {
            foreach ( var_12 in var_7 )
            {
                if ( isdefined( var_12 ) )
                    var_12 delete();
            }
        }

        if ( var_6 == 1 )
        {
            thread maps\_shg_fx::_id_444E( 0.25, 0.9, 0.1, 0.4 );
            setblur( 0.5, 0.125 );
            wait 0.5;
            setblur( 0, 0.2 );
        }

        return 0;
    }
}

_id_54E9( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    if ( isdefined( var_1 ) )
    {
        foreach ( var_4 in var_2 )
        {
            if ( isdefined( var_4 ) && isdefined( var_4._id_16A6 ) && var_4._id_16A6 == var_1 )
                return var_4;
        }
    }
    else if ( var_2.size == 1 )
        return var_2[0];

    return undefined;
}

_id_54EA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !var_2 )
    {
        level._effect[var_0 + "_death"] = loadfx( "props/" + var_0 + "_death" );
        level._effect[var_0 + "_dest"] = loadfx( "props/" + var_0 + "_dest" );
    }

    var_3 = getentarray( var_0 + "_trigger", "targetname" );

    if ( isdefined( var_3 ) )
    {
        foreach ( var_5 in var_3 )
            var_5 thread _id_54EB( var_0, var_1 );
    }
}

_id_54EB( var_0, var_1 )
{
    var_2 = undefined;

    if ( isdefined( self._id_16A6 ) )
        var_2 = self._id_16A6;

    var_3 = _id_54E9( var_0, var_2 );
    var_4 = _id_54E9( var_0 + "_origin", var_2 );
    self waittill( "trigger" );
    level notify( "exploding_shanty_" + var_0 );

    if ( isdefined( var_3 ) )
    {
        var_5 = var_3.origin;
        var_6 = var_3.angles;
        var_7 = var_5;
        var_8 = var_6;
        playfx( common_scripts\utility::getfx( var_0 + "_death" ), var_5, ( 0.0, 0.0, 1.0 ) );

        if ( isdefined( var_4 ) )
        {
            var_7 = var_4.origin;
            var_8 = var_4.angles;
        }

        playfx( common_scripts\utility::getfx( var_0 + "_dest" ), var_7, anglestoforward( var_8 ) );
        physicsexplosionsphere( var_5, 400, 100, 0.1 );
    }

    wait 0.05;

    if ( isdefined( var_3 ) )
        var_3 delete();

    var_9 = getentarray( var_0 + "_trigger", "script_noteworthy" );

    foreach ( var_11 in var_9 )
    {
        if ( !isdefined( var_11 ) )
            continue;

        if ( isdefined( var_2 ) )
        {
            if ( !isdefined( var_11._id_16A6 ) || var_11._id_16A6 != var_2 )
                continue;
        }

        var_11 notify( "trigger" );
    }

    var_13 = getentarray( var_0 + "_destroy", "script_noteworthy" );

    foreach ( var_15 in var_13 )
    {
        if ( !isdefined( var_15 ) )
            continue;

        if ( isdefined( var_2 ) )
        {
            if ( !isdefined( var_15._id_16A6 ) || var_15._id_16A6 != var_2 )
                continue;
        }

        if ( var_15.health > 0 )
            var_15 dodamage( 9999, ( 0.0, 0.0, 0.0 ) );

        var_15 thread _id_54EC();
    }

    if ( isdefined( var_1 ) && var_1 )
    {
        thread maps\_shg_fx::_id_444E( 0.25, 0.9, 0.1, 0.4 );
        setblur( 0.5, 0.125 );
        wait 0.5;
        setblur( 0, 0.2 );
    }

    self delete();
}

_id_54EC()
{
    wait 2;
    self delete();
}

_id_54ED( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = 0;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    level._effect[var_0 + "_death"] = loadfx( "props/" + var_0 + "_death" );
    level._effect[var_0 + "_dest"] = loadfx( "props/" + var_0 + "_dest" );
    var_5 = getentarray( var_0 + "_trigger", "targetname" );
    var_6 = getentarray( var_0, "targetname" );
    var_7 = getentarray( var_0 + "_state", "targetname" );
    var_8 = getentarray( var_0 + "_origin", "targetname" );
    var_9 = _id_54E6( var_6, var_5 );

    if ( isdefined( var_6 ) )
    {
        for ( var_10 = 0; var_10 < var_6.size; var_10++ )
            thread _id_54E8( var_6[var_10], var_5[var_10], var_0, var_3, var_7[var_10], var_8[var_10], var_4 );
    }
}

_id_54EE()
{
    wait 1.0;
    self dodamage( 500, self.origin );
}

_id_54EF( var_0 )
{
    var_1 = getent( "fence_pivotpoint", "targetname" );
    var_2 = getentarray( "afr_fence_chainlink", "targetname" );
    var_3 = getentarray( "afr_fence_postA", "targetname" );
    var_4 = getent( "afr_fence_wood_hitpoint", "targetname" );
    var_5 = distance( var_0, var_1.origin );

    if ( var_5 > 300.0 )
        return 0;

    common_scripts\utility::exploder( 101 );

    foreach ( var_7 in var_2 )
    {
        var_7 notsolid();
        var_7 setcontents( 0 );
        var_7 linkto( var_1 );
    }

    foreach ( var_7 in var_3 )
    {
        var_7 notsolid();
        var_7 setcontents( 0 );
        var_7 linkto( var_1 );
    }

    var_4 linkto( var_1 );
    thread _id_54E5();
    var_11 = getentarray( "destructible_toy", "targetname" );
    var_12 = [];
    var_13 = vectornormalize( anglestoforward( level.player.angles ) );

    foreach ( var_15 in var_11 )
    {

    }

    var_17 = ( var_1.angles[0], var_1.angles[1] - 10, var_1.angles[2] + 25 );
    var_1 rotateto( var_17, 0.15, 0.071, 0.071 );
    var_18 = 0;
    var_19 = common_scripts\utility::spawn_tag_origin();
    var_19.origin = var_4.origin;
    var_19.angles = var_4.angles;
    var_19 linkto( var_1 );
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "warlord_fence_woodhit" ), var_19, "tag_origin" );
    wait 1.0;
    var_20 = -10;

    for (;;)
    {
        var_21 = abs( var_20 ) * 0.0475;

        if ( var_21 < 0.5 )
            var_21 = 0.25;

        var_1 rotateto( ( var_17[0], var_17[1], var_17[2] + var_20 ), var_21, var_21 * 0.5, var_21 * 0.5 );
        var_20 *= -0.65;
        wait(var_21);

        if ( abs( var_20 ) <= 2 )
            break;
    }
}

_id_54F0()
{
    var_0 = spawnstruct();
    var_0._id_54F1 = 1;

    for (;;)
    {
        common_scripts\utility::flag_wait( "fx_zone1" );
        common_scripts\utility::exploder( 100 );
        var_0._id_54F1 = 1;
        var_0 thread _id_54F3( 150, 8 );
        common_scripts\utility::flag_waitopen( "fx_zone1" );
        var_0._id_54F1 = 0;
        wait 1.0;
    }
}

_id_54F2()
{
    var_0 = spawnstruct();
    var_0._id_54F1 = 1;

    for (;;)
    {
        common_scripts\utility::flag_wait( "fx_zone1" );
        var_0._id_54F1 = 1;
        var_0 thread _id_54F3( 550, 7 );
        common_scripts\utility::exploder( 500 );
        common_scripts\utility::flag_waitopen( "fx_zone1" );
        var_0._id_54F1 = 0;
        wait 1.0;
    }
}

_id_54F3( var_0, var_1 )
{
    while ( self._id_54F1 )
    {
        var_2 = randomint( var_1 ) + var_0;
        common_scripts\utility::exploder( var_2 );
        wait 0.2;
    }
}

_id_54F4( var_0, var_1, var_2, var_3 )
{
    for (;;)
    {
        if ( isdefined( var_3 ) )
            common_scripts\utility::flag_wait_either( var_2, var_3 );
        else
            common_scripts\utility::flag_wait( var_2 );

        var_4 = randomint( var_1 ) + var_0;
        common_scripts\utility::exploder( var_4 );
        wait 0.2;
    }
}

precachefx()
{
    level._effect["warlord_gas_can_spray_cd"] = loadfx( "maps/warlord/warlord_gas_can_spray_cd" );
    level._effect["warlord_gas_can_spray"] = loadfx( "maps/warlord/warlord_gas_can_spray" );
    level._effect["firelp_med_pm_nolight_burst"] = loadfx( "fire/firelp_med_pm_nolight_burst" );
    level._effect["fire_smoke_trail_small_detailed2"] = loadfx( "fire/fire_smoke_trail_small_detailed2" );
    level._effect["fire_smoke_trail_verysmall_detailed"] = loadfx( "fire/fire_smoke_trail_verysmall_detailed" );
    level._effect["tread_smk_road_suptech_back"] = loadfx( "treadfx/tread_smk_road_suptech_back" );
    level._effect["birds_takeof_runner"] = loadfx( "misc/birds_takeof_runner" );
    level._effect["sewer_stream_village_muted"] = loadfx( "distortion/sewer_stream_village_muted" );
    level._effect["dust_ground_gust_warm_runner"] = loadfx( "dust/dust_ground_gust_warm_runner" );
    level._effect["amb_dust_light_fakelit"] = loadfx( "dust/amb_dust_light_fakelit" );
    level._effect["sewer_stream_village"] = loadfx( "maps/warlord/sewer_stream_village" );
    level._effect["water_flow_sewage_small"] = loadfx( "water/water_flow_sewage_small" );
    level._effect["water_flow_sewage_small_2"] = loadfx( "maps/warlord/water_flow_sewage_small" );
    level._effect["sewer_rising_steam"] = loadfx( "maps/warlord/sewer_rising_steam" );
    level._effect["warlord_church_haze"] = loadfx( "maps/warlord/warlord_church_haze" );
    level._effect["warlord_plane_runner"] = loadfx( "maps/warlord/warlord_plane_runner" );
    level._effect["light_glow_white_bulb"] = loadfx( "misc/light_glow_white_bulb" );
    level._effect["godray_sewerpipe"] = loadfx( "maps/warlord/godray_warlord_sewerpipe" );
    level._effect["rain_splash_ripples_64x64"] = loadfx( "weather/rain_splash_ripples_64x64" );
    level._effect["rain_splash_puddles_64x64"] = loadfx( "weather/rain_splash_puddles_64x64" );
    level._effect["rain_warlord"] = loadfx( "maps/warlord/rain_warlord" );
    level._effect["rain_warlord_light"] = loadfx( "maps/warlord/rain_warlord_light" );
    level._effect["amb_dust_verylight_cheap"] = loadfx( "dust/amb_dust_verylight_cheap" );
    level._effect["amb_dust_verylight_small"] = loadfx( "dust/amb_dust_verylight_small" );
    level._effect["sand_storm_intro"] = loadfx( "weather/sand_storm_intro" );
    level._effect["sand_storm_light"] = loadfx( "weather/sand_storm_light" );
    level._effect["sand_storm_distant_oriented"] = loadfx( "weather/sand_storm_distant_oriented" );
    level._effect["sand_spray_detail_runner0x400"] = loadfx( "dust/sand_spray_detail_runner_0x400" );
    level._effect["sand_spray_detail_runner400x400"] = loadfx( "dust/sand_spray_detail_runner_400x400" );
    level._effect["sand_spray_detail_oriented_runner"] = loadfx( "dust/sand_spray_detail_oriented_runner" );
    level._effect["sand_spray_cliff_oriented_runner"] = loadfx( "dust/sand_spray_cliff_oriented_runner" );
    level._effect["firelp_med_pm_nolight_atlas"] = loadfx( "fire/fire_med_pm_nolight_atlas" );
    level._effect["firelp_small_pm_nolight"] = loadfx( "fire/firelp_small_pm_nolight" );
    level._effect["firelp_small_pm_a_nolight"] = loadfx( "fire/firelp_small_pm_a_nolight" );
    level._effect["ash_up_01"] = loadfx( "dust/ash_up_01" );
    level._effect["battlefield_smokebank_s_warm_dense"] = loadfx( "smoke/battlefield_smokebank_s_warm_dense" );
    level._effect["battlefield_smokebank_s_warm_dense_shadow"] = loadfx( "smoke/battlefield_smokebank_s_warm_dense_shadow" );
    level._effect["insects_carcass_flies"] = loadfx( "misc/insects_carcass_flies" );
    level._effect["insects_carcass_flies_dark"] = loadfx( "misc/insects_carcass_flies_dark" );
    level._effect["moth_runner"] = loadfx( "misc/moth_runner" );
    level._effect["insects_dragonfly_runner_a"] = loadfx( "misc/insects_dragonfly_runner_a" );
    level._effect["insects_dragonfly_a_oneshot"] = loadfx( "misc/insects_dragonfly_a_oneshot" );
    level._effect["birds_parrots_a"] = loadfx( "misc/birds_parrots_a" );
    level._effect["leaves_fall_tropical"] = loadfx( "maps/warlord/leaves_fall_tropical" );
    level._effect["dust_ground_gust"] = loadfx( "dust/dust_ground_gust_0" );
    level._effect["water_stop"] = loadfx( "maps/warlord/warlord_parabolic_water_stand" );
    level._effect["player_water_stop"] = loadfx( "maps/warlord/warlord_water_stop" );
    level._effect["water_movement"] = loadfx( "maps/warlord/warlord_parabolic_water_movement" );
    level._effect["footstep_water"] = loadfx( "maps/warlord/warlord_parabolic_water_movement" );
    level._effect["warlord_water_movement"] = loadfx( "misc/warlord_water_walk" );
    level._effect["waterfall_splash_falling_mist"] = loadfx( "water/waterfall_splash_falling_mist_far" );
    level._effect["warlord_church_dust"] = loadfx( "maps/warlord/warlord_church_dust" );
    level._effect["warlord_village_distortion"] = loadfx( "maps/warlord/warlord_village_distortion" );
    level._effect["warlord_village_embers"] = loadfx( "maps/warlord/warlord_village_embers" );
    level._effect["warlord_village_wall_embers"] = loadfx( "maps/warlord/warlord_village_wall_embers" );
    level._effect["firelp_small_streak_pm_v2"] = loadfx( "fire/firelp_small_streak_pm_v2" );
    level._effect["firelp_small_pm_a_nolight_2"] = loadfx( "fire/firelp_small_pm_a_nolight_2" );
    level._effect["fire_generic_atlas"] = loadfx( "maps/warlord/warlord_fire_generic_atlas" );
    level._effect["fire_generic_l_atlas"] = loadfx( "maps/warlord/warlord_fire_generic_l_atlas" );
    level._effect["warlord_fire_woosh"] = loadfx( "maps/warlord/warlord_fire_woosh" );
    level._effect["water_emerge"] = loadfx( "maps/warlord/water_emerge" );
    level._effect["water_emerge_2"] = loadfx( "maps/warlord/water_emerge_2" );
    level._effect["water_emerge_3"] = loadfx( "maps/warlord/water_emerge_3" );
    level._effect["water_emerge_4"] = loadfx( "maps/warlord/water_emerge_4" );
    level._effect["water_emerge_weapon"] = loadfx( "maps/warlord/water_emerge_weapon" );
    level._effect["water_emerge_player_weapon"] = loadfx( "maps/warlord/water_emerge_player_weapon" );
    level._effect["water_emerge_player_hand"] = loadfx( "maps/warlord/water_emerge_player_hand" );
    level._effect["water_emerge_bulge"] = loadfx( "maps/warlord/water_emerge_bulge" );
    level._effect["water_emerge_bulge_2"] = loadfx( "maps/warlord/water_emerge_bulge_2" );
    level._effect["truck_splash"] = loadfx( "maps/warlord/truck_splash" );
    level._effect["factory_smokestack"] = loadfx( "maps/warlord/factory_smokestack" );
    level._effect["warlord_river_junk"] = loadfx( "maps/warlord/warlord_river_junk" );
    level._effect["warlord_river_junk_small"] = loadfx( "maps/warlord/warlord_river_junk_small" );
    level._effect["steam_vent_large_windslow"] = loadfx( "maps/warlord/steam_vent_large_windslow" );
    level._effect["dust_wind_fast"] = loadfx( "dust/dust_wind_fast_afcaves" );
    level._effect["dust_wind_canyon"] = loadfx( "dust/dust_wind_canyon" );
    level._effect["dust_wind_canyon_fade"] = loadfx( "maps/warlord/dust_wind_canyon" );
    level._effect["dust_wind_canyon_ground"] = loadfx( "dust/dust_wind_canyon_ground" );
    level._effect["steam_vent_large_wind"] = loadfx( "smoke/steam_vent_large_wind" );
    level._effect["steam_burnt_ground"] = loadfx( "smoke/steam_burnt_ground" );
    level._effect["thermal_draft_afcaves"] = loadfx( "smoke/thermal_draft_afcaves" );
    level._effect["waterfall_drainage_splash"] = loadfx( "water/waterfall_drainage_splash" );
    level._effect["waterfall_splash_large_drops"] = loadfx( "water/waterfall_splash_large_drops" );
    level._effect["light_shaft_motes_afcaves"] = loadfx( "dust/light_shaft_motes_afcaves" );
    level._effect["warlord_panel2x8_dest"] = loadfx( "maps/warlord/warlord_panel2x8_dest" );
    level._effect["warlord_panel4x4_dest"] = loadfx( "maps/warlord/warlord_panel4x4_dest" );
    level._effect["player_splash"] = loadfx( "maps/warlord/player_splash" );
    level._effect["shanty_01_death"] = loadfx( "props/shanty_01_death" );
    level._effect["warlord_fence_woodhit"] = loadfx( "maps/warlord/warlord_fence_woodhit" );
    level._effect["warlord_falling_debris"] = loadfx( "maps/warlord/warlord_falling_debris" );
    level._effect["warlord_panel4x8_dest"] = loadfx( "maps/warlord/warlord_panel4x8_dest" );
    level._effect["warlord_player_fallthrough"] = loadfx( "maps/warlord/warlord_player_fallthrough" );
    level._effect["mortar_fire_aftermath"] = loadfx( "maps/warlord/mortar_fire_aftermath" );
    level._effect["mortar_fire_aftermath_2"] = loadfx( "maps/warlord/mortar_fire_aftermath_2" );
    level._effect["mortar_fire_truck_aftermath"] = loadfx( "maps/warlord/mortar_fire_truck_aftermath" );
    level._effect["firelp_med_spreader"] = loadfx( "fire/firelp_med_spreader" );
    level._effect["sewer_grate_dust"] = loadfx( "maps/warlord/sewer_grate_dust" );
    level._effect["sewer_grate_dust_2"] = loadfx( "maps/warlord/sewer_grate_dust_2" );
    level._effect["dust_spiral_slow_runner_optim"] = loadfx( "dust/dust_spiral_slow_runner_optim" );
    level._effect["ash_spiral_runner"] = loadfx( "dust/ash_spiral_runner" );
    level._effect["dust_wind_slow_paper_narrow"] = loadfx( "dust/dust_wind_slow_paper_narrow" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["battlefield_smk_directional_white_m_cheap"] = loadfx( "smoke/battlefield_smk_directional_white_m_cheap" );
    level._effect["light_shaft_dust_warmlit"] = loadfx( "dust/light_shaft_dust_warmlit" );
    level._effect["trash_spirallo_runner"] = loadfx( "misc/trash_spirallo_runner" );
    level._effect["dust_ground_gust_runner"] = loadfx( "dust/dust_ground_gust_runner" );
    level._effect["light_shaft_ground_dust_warmlit"] = loadfx( "dust/light_shaft_ground_dust_warmlit" );
    level._effect["drips_slow"] = loadfx( "misc/drips_slow" );
    level._effect["mist_drifting_sewer_narrow"] = loadfx( "maps/warlord/mist_drifting_sewer_narrow" );
    level._effect["light_shaft_dust_medwarmlit"] = loadfx( "dust/light_shaft_dust_medwarmlit" );
    level._effect["burning_man"] = loadfx( "fire/firelp_med_pm_nolight" );
    level._effect["flashlight"] = loadfx( "misc/flashlight" );
    level._effect["pistol_muzzleflash"] = loadfx( "muzzleflashes/pistolflash" );
    level._effect["player_death_explosion"] = loadfx( "explosions/player_death_explosion" );
    level._effect["cave_explosion"] = loadfx( "explosions/cave_explosion" );
    level._effect["cave_explosion_exit"] = loadfx( "explosions/cave_explosion_exit" );
    level._effect["mortar"]["bunker_ceiling"] = loadfx( "dust/ceiling_dust_default" );
    level._effect["ceiling_collapse_dirt1"] = loadfx( "dust/ceiling_collapse_dirt1" );
    level._effect["ceiling_rock_break"] = loadfx( "misc/ceiling_rock_break" );
    level._effect["hallway_collapsing_big"] = loadfx( "misc/hallway_collapsing_big" );
    level._effect["hallway_collapsing_huge"] = loadfx( "misc/hallway_collapsing_huge" );
    level._effect["hallway_collapsing_cavein"] = loadfx( "misc/hallway_collapsing_cavein" );
    level._effect["hallway_collapsing_cavein_short"] = loadfx( "misc/hallway_collapsing_cavein_short" );
    level._effect["hallway_collapsing_burst"] = loadfx( "misc/hallway_collapsing_burst" );
    level._effect["hallway_collapsing_burst_no_linger"] = loadfx( "misc/hallway_collapsing_burst_no_linger" );
    level._effect["hallway_collapsing_major"] = loadfx( "misc/hallway_collapsing_major" );
    level._effect["hallway_collapsing_major_norocks"] = loadfx( "misc/hallway_collapsing_major_norocks" );
    level._effect["building_explosion_metal"] = loadfx( "explosions/building_explosion_metal_gulag" );
    level._effect["tanker_explosion"] = loadfx( "explosions/tanker_explosion" );
    level._effect["airstrip_explosion"] = loadfx( "explosions/airstrip_explosion" );
    level._effect["bunker_ceiling"] = loadfx( "dust/ceiling_dust_default" );
    level._effect["heli_impacts"] = loadfx( "impacts/large_dirt_1" );
    level._effect["welding_small_extended"] = loadfx( "misc/welding_small_extended" );
    level._effect["fire_falling_runner_point"] = loadfx( "fire/fire_falling_runner_point" );
    level._effect["gulag_cafe_spotlight"] = loadfx( "misc/gulag_cafe_spotlight" );
    level._effect["heli_aerial_explosion"] = loadfx( "explosions/aerial_explosion" );
    level._effect["heli_aerial_explosion_large"] = loadfx( "explosions/aerial_explosion_large" );
    level._effect["knife_attack_fx"] = loadfx( "misc/blood_back_stab" );
    level._effect["warlord_chestshot_blood"] = loadfx( "maps/warlord/warlord_chestshot_blood" );
    level._effect["knife_attack_throat_fx"] = loadfx( "misc/blood_throat_stab" );
    level._effect["knife_attack_throat_fx2"] = loadfx( "misc/blood_throat_stab2" );
    level._effect["intro_knife_throat_fx"] = loadfx( "maps/warlord/intro_blood_throat_stab" );
    level._effect["blood_hyena_bite"] = loadfx( "misc/blood_hyena_bite" );
    level._effect["warlord_dust_impact"] = loadfx( "maps/warlord/warlord_dust_impact" );
    level._effect["headshot"] = loadfx( "impacts/flesh_hit_head_fatal_exit" );
    level._effect["bodyshot"] = loadfx( "impacts/flesh_hit" );
    level._effect["hyena_blood_fx"] = loadfx( "maps/warlord/hyena_blood_fx" );
    level._effect["execution_blood_fx"] = loadfx( "maps/warlord/execution_blood_fx" );
    level._effect["execution_blood_fx_2"] = loadfx( "maps/warlord/execution_blood_fx_2" );
    level._effect["hyena_saliva_fx"] = loadfx( "maps/warlord/hyena_saliva_fx" );
    level._effect["hyena_saliva_fx_r"] = loadfx( "maps/warlord/hyena_saliva_fx_r" );
    level._effect["hyena_saliva_fx_2"] = loadfx( "maps/warlord/hyena_saliva_fx_2" );
    level._effect["hyena_saliva_fx_3"] = loadfx( "maps/warlord/hyena_saliva_fx_3" );
    level._effect["hyena_dust"] = loadfx( "maps/warlord/hyena_dust" );
    level._effect["warlord_gnats"] = loadfx( "maps/warlord/warlord_gnats" );
    level._effect["garbage"] = loadfx( "props/garbage_spew" );
    level._effect["garbage_des"] = loadfx( "props/garbage_spew_des" );
    level._effect["door_kick"] = loadfx( "dust/door_kick" );
    level._effect["door_kick_small"] = loadfx( "dust/door_kick_small" );
    level._effect["bird_takeoff"] = loadfx( "misc/bird_takeoff" );
    level._effect["body_water_splash"] = loadfx( "maps/warlord/body_water_splash" );
    level._effect["heli_dust_warlord"] = loadfx( "maps/warlord/heli_dust_warlord" );
    level._effect["truck_dust_warlord"] = loadfx( "maps/warlord/truck_dust_warlord" );
    level._effect["truck_vehicle_explosion"] = loadfx( "maps/warlord/truck_vehicle_explosion" );
    level._effect["fire_truck"] = loadfx( "maps/warlord/fire_truck" );
    level._effect["fire_truck_small"] = loadfx( "maps/warlord/fire_truck_small" );
    level._effect["mortarExp_debris"] = loadfx( "maps/warlord/mortarExp_debris" );
}

_id_54F5( var_0, var_1 )
{
    if ( !common_scripts\utility::flag_exist( "guy_fx_gas_ended" ) )
        common_scripts\utility::flag_init( "guy_fx_gas_ended" );

    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "j_wrist_le" );
    var_2.angles = var_0 gettagangles( "j_wrist_le" );
    var_2 linkto( var_0, "j_wrist_le", ( 15.0, 0.0, -15.0 ), ( 0.0, 0.0, 0.0 ) );
    wait 4.33;

    if ( isdefined( var_1 ) )
    {
        playfxontag( common_scripts\utility::getfx( "warlord_gas_can_spray" ), var_2, "tag_origin" );
        var_3 = spawnstruct();
        var_3.v["ent"] = var_1;
        var_3.v["fx"] = common_scripts\utility::getfx( "warlord_gas_can_spray_cd" );
        var_3.v["looptime"] = 0.04;
        var_3.v["chain"] = "head";
        var_4 = maps\_shg_fx::_id_4474( var_3 );
        var_3.v["chain"] = "l_arm";
        var_5 = maps\_shg_fx::_id_4474( var_3 );
        var_3.v["chain"] = "r_arm";
        var_6 = maps\_shg_fx::_id_4474( var_3 );
        thread _id_54F6( var_4, var_5, var_6, var_2 );
        wait 2.43;
        level notify( var_4 );
        level notify( var_5 );
        level notify( var_6 );
        stopfxontag( common_scripts\utility::getfx( "warlord_gas_can_spray" ), var_2, "tag_origin" );
        wait 5.96;

        if ( isdefined( var_1 ) )
        {
            var_3.v["chain"] = "head";
            var_4 = maps\_shg_fx::_id_4474( var_3 );
            var_3.v["chain"] = "l_arm";
            var_5 = maps\_shg_fx::_id_4474( var_3 );
            var_3.v["chain"] = "r_arm";
            var_6 = maps\_shg_fx::_id_4474( var_3 );
            playfxontag( common_scripts\utility::getfx( "warlord_gas_can_spray" ), var_2, "tag_origin" );
            wait 1.5;
            level notify( var_4 );
            level notify( var_5 );
            level notify( var_6 );
            common_scripts\utility::flag_set( "guy_fx_gas_ended" );
            stopfxontag( common_scripts\utility::getfx( "warlord_gas_can_spray" ), var_2, "tag_origin" );
        }
    }

    wait 3.0;
    maps\_shg_fx::_id_444A( "amb_dust_verylight_cheap" );
}

_id_54F6( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_wait( "river_burn_interrupted" );
    common_scripts\utility::flag_waitopen( "guy_fx_gas_ended" );
    level notify( var_0 );
    level notify( var_1 );
    level notify( var_2 );
    stopfxontag( common_scripts\utility::getfx( "warlord_gas_can_spray" ), var_3, "tag_origin" );
}

_id_54F7()
{
    playfx( common_scripts\utility::getfx( "firelp_med_pm_nolight_burst" ), self.origin, anglestoforward( ( 270.0, 0.0, 0.0 ) ) );
    var_0 = spawnstruct();
    var_0.v["ent"] = self;
    var_0.v["fx"] = common_scripts\utility::getfx( "fire_smoke_trail_verysmall_detailed" );
    var_0.v["chain"] = "all";
    var_0.v["looptime"] = 0.08;
    var_1 = maps\_shg_fx::_id_4474( var_0 );
    var_0.v["ent"] = self;
    var_0.v["fx"] = common_scripts\utility::getfx( "fire_smoke_trail_small_detailed2" );
    var_0.v["chain"] = "torso";
    var_0.v["looptime"] = 0.1;
    var_2 = maps\_shg_fx::_id_4474( var_0 );
    wait 32.0;
    level notify( var_1 );
    level notify( var_2 );
}

_id_54F8()
{
    var_0 = getentarray( "player", "classname" )[0];
    playfx( common_scripts\utility::getfx( "sand_storm_intro" ), var_0.origin );
}

_id_54F9( var_0 )
{
    var_1 = level.global_fx[var_0];
    return level._effect[var_1];
}

_id_4AB6()
{
    animscripts\utility::_id_24BB( "mud", loadfx( "impacts/footstep_mud" ) );
    animscripts\utility::_id_24BB( "dirt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "mud", loadfx( "impacts/footstep_mud" ) );
    animscripts\utility::_id_24BC( "dirt", loadfx( "impacts/footstep_dust" ) );
}

_id_4780()
{
    var_0 = "maps/warlord/tread_sand_warlord";
    var_1[0] = "script_vehicle_pickup_technical";
    var_1[1] = "script_vehicle_pickup_technical_physics";
    var_1[2] = "script_vehicle_pickup_technical_m2";
    var_1[3] = "script_vehicle_pickup_roobars";
    var_1[4] = "script_vehicle_pickup_roobars_physics_instant_death";
    var_1[5] = "script_vehicle_pickup_roobars_physics_instant_death";
    var_1[6] = "script_vehicle_pickup_technical_aa";
    var_1[7] = "script_vehicle_pickup_technical_aa_physics";
    var_1[8] = "script_vehicle_pickup_technical_custom_fx";

    foreach ( var_3 in var_1 )
    {
        maps\_treadfx::_id_28EF( var_3, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_3, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_3, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_3, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_3, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_3, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_3, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_3, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_3, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_3, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_3, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_3, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_3, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_3, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_3, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_3, "plaster", var_0 );
        maps\_treadfx::_id_28EF( var_3, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_3, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_3, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_3, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_3, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_3, "ceramic", var_0 );
        maps\_treadfx::_id_28EF( var_3, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_3, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_3, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_3, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_3, "paintedmetal", var_0 );
        maps\_treadfx::_id_28EF( var_3, "riotshield", var_0 );
        maps\_treadfx::_id_28EF( var_3, "slush", var_0 );
        maps\_treadfx::_id_28EF( var_3, "default", var_0 );
        maps\_treadfx::_id_28EF( var_3, "none" );
    }
}

_id_54FA()
{
    common_scripts\utility::flag_init( "enable_river_dof" );
    thread _id_54FB();
    thread _id_54FF();
}

_id_54FB()
{
    level._id_54FC = 0;
    var_0 = getentarray( "trig_river_dof", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_54FE();

    for (;;)
    {
        level waittill( "river_dof_trigger_count_updated" );
        waittillframeend;

        if ( level._id_54FC > 0 )
        {
            common_scripts\utility::flag_set( "enable_river_dof" );
            continue;
        }

        common_scripts\utility::flag_clear( "enable_river_dof" );
    }
}

_id_54FD()
{
    if ( level.player getstance() != "stand" && !common_scripts\utility::flag( "_stealth_spotted" ) )
        return 1;

    return 0;
}

_id_54FE()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( _id_54FD() )
        {
            level._id_54FC++;
            level notify( "river_dof_trigger_count_updated" );

            while ( level.player istouching( self ) && _id_54FD() )
                wait 0.1;

            level._id_54FC--;
            level notify( "river_dof_trigger_count_updated" );
        }
    }
}

_id_54FF()
{
    wait 0.05;
    var_0 = level._id_1436;
    var_1 = [];
    var_1["start"] = 2;
    var_1["end"] = 8;
    level.player._id_5500 = var_1["start"];
    level.player._id_5501 = var_1["end"];
    level.player setviewmodeldepthoffield( 0, 0 );

    for (;;)
    {
        common_scripts\utility::flag_wait( "enable_river_dof" );
        var_2 = [];
        var_2["nearStart"] = 1;
        var_2["nearEnd"] = 104;
        var_2["nearBlur"] = 4.5;
        var_2["farStart"] = 500;
        var_2["farEnd"] = 500;
        var_2["farBlur"] = 1.8;
        var_3["start"] = 10;
        var_3["end"] = 90;
        _id_5502( var_1, var_3, 1, 0 );
        maps\_utility::_id_27C0( var_0, var_2, 1 );
        common_scripts\utility::flag_waitopen( "enable_river_dof" );
        maps\_utility::_id_27C0( var_2, var_0, 1 );
        _id_5502( var_3, var_1, 1, 1 );
    }
}

_id_5502( var_0, var_1, var_2, var_3 )
{
    if ( var_2 > 0 )
    {
        var_4 = ( var_1["start"] - var_0["start"] ) * 0.05 / var_2;
        var_5 = ( var_1["end"] - var_0["end"] ) * 0.05 / var_2;
        thread _id_5503( var_1, var_4, var_5, var_3 );
    }
    else
    {
        level.player._id_5500 = var_1["start"];
        level.player._id_5501 = var_1["end"];

        if ( var_3 )
            level.player setviewmodeldepthoffield( 0, 0 );
    }
}

_id_5503( var_0, var_1, var_2, var_3 )
{
    level notify( "lerp_viewmodel_dof" );
    level endon( "lerp_viewmodel_dof" );
    var_4 = 0;
    var_5 = 0;

    while ( !var_4 || !var_5 )
    {
        if ( !var_4 )
        {
            level.player._id_5500 += var_1;

            if ( var_1 > 0 && level.player._id_5500 > var_0["start"] || var_1 < 0 && level.player._id_5500 < var_0["start"] )
            {
                level.player._id_5500 = var_0["start"];
                var_4 = 1;
            }
        }

        if ( !var_5 )
        {
            level.player._id_5501 += var_2;

            if ( var_2 > 0 && level.player._id_5501 > var_0["end"] || var_2 < 0 && level.player._id_5501 < var_0["end"] )
            {
                level.player._id_5501 = var_0["end"];
                var_5 = 1;
            }
        }

        level.player setviewmodeldepthoffield( level.player._id_5500, level.player._id_5501 );
        wait 0.05;
    }

    if ( var_3 )
        level.player setviewmodeldepthoffield( 0, 0 );
}

_id_5504()
{
    common_scripts\utility::flag_wait( "msg_fx_stop_rain" );
    maps\_shg_fx::_id_4468( "rain_splash_ripples_64x64" );
    maps\_shg_fx::_id_4468( "rain_warlord" );
    maps\_shg_fx::_id_4468( "rain_warlord_light" );
}

_id_5505()
{
    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["type"] == "oneshotfx" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_5506()
{
    wait 1.0;
    common_scripts\utility::exploder( 996 );
    common_scripts\utility::exploder( 10 );
    common_scripts\utility::flag_init( "hyena_dead" );
}

_id_5507()
{
    var_0 = level.player.origin;
    var_1 = 0.01;
    var_2 = 0;
    var_3 = 600.5;
    var_4 = 40;
    var_5 = 0;

    for ( var_6 = 0.1; var_5 < var_3; var_5 += var_8 )
    {
        common_scripts\utility::flag_waitopen( "fx_shakeon" );
        common_scripts\utility::flag_waitopen( "hyena_dead" );
        var_7 = randomfloat( 1.0 ) * 8.0 + 1.0;
        var_8 = var_7 / 20.0;
        earthquake( randomfloatrange( 0.15, 0.2 ), var_8, level.player.origin, 1024 );
        wait(var_8);
    }
}

_id_5508()
{
    self endon( "death" );
    level._id_5509 = common_scripts\utility::spawn_tag_origin();
    level._id_5509.origin = self gettagorigin( "tag_origin" );
    level._id_5509.angles = self gettagangles( "tag_origin" );
    level._id_5509 linkto( self, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "hyena_dust" ), level._id_5509, "TAG_ORIGIN" );
    playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_r" ), self, "J_Lip_Top_RI" );
    playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx" ), self, "J_Lip_Top_LE" );
    playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_3" ), self, "tag_mouth_fx" );
    wait 3.1;
    common_scripts\utility::flag_init( "fx_shakeon" );
    thread _id_5507();

    for (;;)
    {
        wait 0.2;
        thread _id_550B();
        playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_2" ), self, "tag_mouth_fx" );
        wait 0.3;
        thread _id_550B();
        playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_2" ), self, "tag_mouth_fx" );
        wait 0.5;
        thread _id_550B();
        playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_2" ), self, "tag_mouth_fx" );
        wait 0.2;
        thread _id_550B();
        wait 0.8;
        thread _id_550B();
        playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_3" ), self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( common_scripts\utility::getfx( "hyena_saliva_fx_2" ), self, "tag_mouth_fx" );
        wait 0.5;
    }
}

_id_550A( var_0 )
{
    common_scripts\utility::flag_set( "hyena_dead" );
    wait 1.4;

    if ( isdefined( var_0 ) )
        playfxontag( common_scripts\utility::getfx( "hyena_blood_fx" ), var_0, "TAG_FLASH" );

    wait 0.5;

    if ( isdefined( var_0 ) )
        playfxontag( common_scripts\utility::getfx( "hyena_blood_fx" ), var_0, "TAG_FLASH" );

    wait 0.5;

    if ( isdefined( var_0 ) )
        playfxontag( common_scripts\utility::getfx( "hyena_blood_fx" ), var_0, "TAG_FLASH" );

    level._id_5509 delete();

    foreach ( var_2 in level.createfxent )
    {
        if ( var_2.v["type"] == "oneshotfx" )
            var_2 maps\_utility::_id_1655();
    }

    wait 5.5;
    maps\_shg_fx::_id_4449( "heli_dust_warlord" );
}

_id_550B()
{
    common_scripts\utility::flag_set( "fx_shakeon" );
    earthquake( randomfloatrange( 0.2, 0.4 ), 0.5, level.player.origin, 1024 );
    level common_scripts\utility::waitframe();
    common_scripts\utility::flag_clear( "fx_shakeon" );
}

_id_550C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = var_2 * 20;
    var_7 = var_6 - 1;

    while ( var_5 < var_6 )
    {
        var_8 = ( var_1 - var_0 ) * var_5 / var_7;
        var_8 += var_0;
        setsaveddvar( "sm_sunshadowscale", var_8 );
        var_9 = ( var_4 - var_3 ) * var_5 / var_7;
        var_9 += var_3;
        setsaveddvar( "sm_sunsamplesizenear", var_9 );
        var_5++;
        level common_scripts\utility::waitframe();
    }
}

_id_550D()
{
    wait 0.1;

    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_scaleshadow" );
        var_0 = getdvarfloat( "sm_sunshadowscale" );
        var_1 = getdvarfloat( "sm_sunsamplesizenear" );
        var_2 = 0.25;
        var_3 = 0.08;
        var_4 = 6;
        thread _id_550C( var_0, var_2, var_4, var_1, var_3 );
        wait(var_4);
        common_scripts\utility::flag_waitopen( "msg_scaleshadow" );
        var_0 = getdvarfloat( "sm_sunshadowscale" );
        var_1 = getdvarfloat( "sm_sunsamplesizenear" );
        var_2 = 0.5;
        var_3 = 0.35;
        var_4 = 6;
        thread _id_550C( var_0, var_2, var_4, var_1, var_3 );
        wait(var_4);
    }
}

_id_550E()
{
    common_scripts\utility::exploder( 50 );
}

_id_550F()
{
    wait 0.9;
    common_scripts\utility::exploder( 51 );
}

_id_5510()
{
    common_scripts\utility::exploder( 52 );
}

_id_5511()
{
    wait 0.4;
    common_scripts\utility::exploder( 53 );
}

_id_5512()
{
    common_scripts\utility::exploder( 54 );
}

_id_5513()
{
    common_scripts\utility::exploder( 55 );
}

_id_5514()
{
    wait 1.0;
    common_scripts\utility::exploder( 56 );
}

_id_5515()
{
    wait 1.0;
    common_scripts\utility::exploder( 57 );
}

_id_5516()
{
    wait 2.0;
    common_scripts\utility::exploder( 60 );
    wait 1.5;
    wait 2.5;
    common_scripts\utility::exploder( 61 );
    maps\_shg_fx::_id_4449( "firelp_med_spreader" );
}

_id_5517()
{
    var_0 = 64;
    maps\_audio::aud_send_msg( "pre_truck_explode_fake_mortar_incoming", var_0 );
    wait 0.9;
    common_scripts\utility::exploder( 64 );
    common_scripts\utility::flag_set( "aud_fake_mortar_exploded" );
    maps\_audio::aud_send_msg( "pre_truck_explode_fake_mortar", var_0 );
}

_id_5518()
{
    wait 1.5;
    common_scripts\utility::exploder( 65 );
    wait 0.5;
    common_scripts\utility::exploder( 65 );
    wait 1.0;
    common_scripts\utility::exploder( 65 );
    wait 0.5;
    common_scripts\utility::exploder( 65 );
}

_id_5519()
{
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "river_allies_stand" );
    var_0 = spawnstruct();
    _id_4AC3( 33, var_0 );
    var_1 = var_0.v["ents"];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        thread _id_551A( var_1[var_2] );
}

_id_551A( var_0 )
{
    if ( isdefined( var_0.v["delay"] ) )
        wait(var_0.v["delay"]);

    var_1 = var_0.v["origin"] + ( 0.0, 750.0, 0.0 );
    var_2[0] = var_0.v["origin"];
    var_2[1] = var_1;
    var_2[2] = 4;
    maps\_audio::aud_send_msg( "fx_dragonfly_flyby", var_2 );
    var_0 common_scripts\utility::activate_individual_exploder();
}

_id_4AC3( var_0, var_1 )
{
    var_2 = [];
    var_3 = [];
    var_4 = [];
    var_5 = [];
    var_6 = maps\_shg_fx::_id_4446( var_0 );

    foreach ( var_8 in var_6 )
    {
        var_2[var_2.size] = var_8.v["origin"];
        var_3[var_3.size] = var_8.v["angles"];
        var_4[var_4.size] = var_8;
        var_5[var_2.size] = var_8.v["delay"];
    }

    var_1.v["origins"] = var_2;
    var_1.v["angles"] = var_3;
    var_1.v["ents"] = var_4;
    var_1.v["delay"] = var_5;
}

_id_551B()
{
    level._id_2A9C = 5000;
    var_0 = "maps/warlord/heli_dust_warlord_empty";
    var_1[0] = "script_vehicle_mi17_africa";

    foreach ( var_3 in var_1 )
    {
        maps\_treadfx::_id_28EF( var_3, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_3, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_3, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_3, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_3, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_3, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_3, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_3, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_3, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_3, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_3, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_3, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_3, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_3, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_3, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_3, "plaster", var_0 );
        maps\_treadfx::_id_28EF( var_3, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_3, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_3, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_3, "water", var_0 );
        maps\_treadfx::_id_28EF( var_3, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_3, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_3, "ceramic", var_0 );
        maps\_treadfx::_id_28EF( var_3, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_3, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_3, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_3, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_3, "painted metal", var_0 );
        maps\_treadfx::_id_28EF( var_3, "default", var_0 );
        maps\_treadfx::_id_28EF( var_3, "none", var_0 );
    }
}

_id_551C()
{
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars", "undefined", "vehicle_pickup_roobars", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 1.9, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 2, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 2.01, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 2.01, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical", "undefined", "vehicle_pickup_technical", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 1.9, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 2, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 2.01, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 2.01, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_custom_fx", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_custom_fx", "undefined", "vehicle_pickup_technical", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0.9, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_custom_fx", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_custom_fx", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 1.01, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_custom_fx", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 1.01, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_instant_death", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_instant_death", "undefined", "vehicle_pickup_technical", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_instant_death", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_instant_death", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_instant_death", "undefined", "vehicle_pickup_technical", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_physics_instant_death", "truck_physics", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_physics_instant_death", "truck_physics", "vehicle_pickup_roobars", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_physics_instant_death", "truck_physics", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_physics_instant_death", "truck_physics", "vehicle_pickup_roobars", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_physics_instant_death", "truck_physics", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_instant_death", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_instant_death", "undefined", "vehicle_pickup_roobars", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_instant_death", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_instant_death", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_roobars_instant_death", "undefined", "vehicle_pickup_roobars", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_payback_instant_death", "undefined", "vehicle_pickup_technical_pb_rusted", "maps/warlord/fire_truck_small", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_payback_instant_death", "undefined", "vehicle_pickup_technical_pb_rusted", "maps/warlord/truck_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_payback_instant_death", "undefined", "vehicle_pickup_technical_pb_rusted", "maps/warlord/fire_truck_small", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0.1, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_payback_instant_death", "undefined", "vehicle_pickup_technical_pb_rusted", "maps/warlord/fire_truck", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29FE( "script_vehicle_pickup_technical_payback_instant_death", "undefined", "vehicle_pickup_technical_pb_rusted", "maps/warlord/fire_truck_small", "tag_engine_left", "smallfire", undefined, undefined, 1, 0.11, 1 );
}

_id_4AC4()
{
    var_0 = getentarray( "poison_wake_volume", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4AC5 );
}

_id_4AC5()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 maps\_utility::_id_133C( "in_poison_volume" ) )
        {

        }
        else
            var_0 maps\_utility::_id_1402( "in_poison_volume" );

        if ( isdefined( var_0 ) && distancesquared( var_0.origin, level.player.origin ) < 9250000 )
        {
            if ( var_0 maps\_utility::_id_1008( "in_poison_volume" ) )
                continue;

            var_0 thread _id_4AC6( self );
            var_0 maps\_utility::_id_13DC( "in_poison_volume" );
        }
    }
}

_id_4AC6( var_0 )
{
    self endon( "death" );
    var_1 = 200;

    for (;;)
    {
        if ( self istouching( var_0 ) )
        {
            if ( var_1 > 10 )
                wait(max( 1 - var_1 / 120, 0.1 ));
            else
                wait 0.15;

            var_2 = var_0.script_fxid;

            if ( isplayer( self ) )
            {
                var_1 = distance( self getvelocity(), ( 0.0, 0.0, 0.0 ) );

                if ( var_1 < 10 )
                    var_2 = "player_water_stop";
            }

            if ( isai( self ) )
            {
                var_1 = distance( self.velocity, ( 0.0, 0.0, 0.0 ) );

                if ( var_1 < 10 )
                    var_2 = "player_water_stop";
            }

            var_3 = self.origin + ( 0.0, 0.0, 64.0 );
            var_4 = self.origin - ( 0.0, 0.0, 150.0 );
            var_5 = bullettrace( var_3, var_4, 0, undefined );
            var_6 = common_scripts\utility::getfx( var_2 );
            var_3 = var_5["position"];
            var_7 = vectortoangles( var_5["normal"] );
            var_7 = ( 0, self.angles[1], 0 );
            var_8 = anglestoforward( var_7 );
            var_9 = anglestoup( var_7 );
            playfx( var_6, var_3, var_9, var_8 );
            continue;
        }

        maps\_utility::_id_13DE( "in_poison_volume" );
        return;
    }
}

_id_551D()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getfx( "hyena_saliva_fx_2" );
    var_1 = common_scripts\utility::getfx( "blood_hyena_bite" );

    for (;;)
    {
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 1.5;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 1.0;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 1.1;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 1.0;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 0.4;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_1, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 0.5;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 2.0;
        playfxontag( var_0, self, "tag_mouth_fx" );
        wait 1.0;
    }
}

_id_551E()
{
    common_scripts\utility::flag_wait( "fx_technical_splash" );
    var_0 = level.player.origin;
    maps\_audio::aud_send_msg( "player_technical_splashdown", var_0 );
    playfx( common_scripts\utility::getfx( "player_splash" ), var_0, ( 0.0, 0.0, 1.0 ), ( 0.0, 1.0, 0.0 ) );
}
