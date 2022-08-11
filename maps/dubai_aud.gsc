// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_audio::_id_16F4();
    _id_4ED2();
    _id_4ED3();
    _id_4ED4();
    _id_447D();
    _id_496E();
    _id_447F();
    _id_4480();
    _id_447E();
    _id_447C();
    _id_4ED6();
    maps\_audio_mix_manager::_id_1517( "dubai_level_global_mix" );
}

_id_4ED2()
{
    maps\_audio::_id_1740( "shg" );
    maps\_audio::_id_156E( "med_occlusion" );
    maps\_audio::_id_1735( "shg_default", 20 );
    maps\_audio::_id_1720( "shg_mission_failed_stinger" );
}

_id_4ED3()
{
    common_scripts\utility::flag_init( "1st_elevator_moving" );
    common_scripts\utility::flag_init( "2nd_elevator_moving" );
    common_scripts\utility::flag_init( "turn_off_cove_alarm" );
    common_scripts\utility::flag_init( "turn_off_top_floor_alarm" );
    common_scripts\utility::flag_init( "elevator_glass_broken" );
    common_scripts\utility::flag_init( "aud_heli_crash_impact" );
    common_scripts\utility::flag_init( "aud_finale_jump_succesful" );
}

_id_4ED4()
{
    level._id_16F5._id_763D = [];
    level._id_16F5._id_763D[level._id_16F5._id_763D.size] = ( 2817.0, 13.0, 68.0 );
    level._id_16F5._id_763D[level._id_16F5._id_763D.size] = ( 2717.0, 125.0, 68.0 );
    level._id_16F5._id_763D[level._id_16F5._id_763D.size] = ( 2589.0, 74.0, 68.0 );
    level._id_16F5._id_763D[level._id_16F5._id_763D.size] = ( 2567.0, -44.0, 68.0 );
    level._id_16F5._id_763D[level._id_16F5._id_763D.size] = ( 2650.0, -114.0, 68.0 );
    level._id_16F5._id_763D[level._id_16F5._id_763D.size] = ( 2730.0, -120.0, 68.0 );
    level._id_16F5._id_763E = [];
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1303.0, 245.0, 10.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1296.0, 61.0, 10.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1267.0, -157.0, 10.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1183.0, -186.0, 133.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1188.0, 126.0, 164.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1121.0, 137.0, 219.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1133.0, -162.0, 233.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1020.0, -100.0, 312.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 1046.0, 103.0, 312.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 955.0, 83.0, 327.0 );
    level._id_16F5._id_763E[level._id_16F5._id_763E.size] = ( 953.0, -54.0, 327.0 );
    level._id_16F5._id_763F = [];
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1702.0, 769.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1530.0, 780.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1380.0, 705.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1335.0, 540.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1274.0, 418.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1188.0, 373.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1115.0, 341.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1692.0, -751.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1572.0, -757.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1380.0, 705.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1374.0, -746.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1356.0, -482.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1243.0, -396.0, 0.0 );
    level._id_16F5._id_763F[level._id_16F5._id_763F.size] = ( 1115.0, -331.0, 0.0 );
    level._id_16F5._id_7640 = 0;
    level._id_16F5._id_7641 = 0;
    level._id_16F5._id_7642 = 0;
}

_id_447D()
{
    thread _id_7654();
    thread _id_7651();
    thread _id_7652();
    thread _id_7661();
    thread _id_7664();
}

_id_496E()
{
    if ( isdefined( level._id_1D95 ) && level._id_1D95 )
        return;

    thread _id_7650();
    common_scripts\utility::loop_fx_sound( "dubai_water_fountain_large_lp", ( 2688.0, -12.0, 60.0 ), 1 );
}

_id_447F()
{

}

_id_4480()
{

}

_id_447E()
{

}

_id_447C()
{

}

_id_4ED6()
{
    maps\_audio::_id_174C( ::_id_4481 );
    maps\_audio::_id_174C( ::_id_448C );
}

_id_4481( var_0, var_1 )
{
    var_2 = 1;

    switch ( var_0 )
    {
        case "start_intro":
            maps\_audio_zone_manager::_id_156C( "dubai_inside_truck" );
            maps\_audio_mix_manager::_id_1517( "dubai_inside_truck" );
            maps\_audio_mix_manager::_id_1517( "dubai_mute_player_impact" );
            _id_448B( "mus_intro" );
            thread _id_7645();
            thread _id_4F6C();
            break;
        case "start_exterior":
            maps\_audio_zone_manager::_id_156C( "dubai_walkpath" );
            thread _id_4F6C();
            break;
        case "start_exterior_circle":
            maps\_audio_zone_manager::_id_156C( "dubai_walkpath" );
            _id_448B( "mus_first_combat" );
            thread _id_4F6C();
            maps\_audio_mix_manager::_id_1517( "dubai_mute_player_impact" );
            break;
        case "start_lobby":
            maps\_audio_zone_manager::_id_156C( "dubai_entrance_atrium" );
            _id_448B( "mus_first_combat" );
            thread _id_4F6C();
            maps\_audio_mix_manager::_id_1517( "dubai_mute_player_impact" );
            _id_764B();
            break;
        case "start_elevator":
            maps\_audio_zone_manager::_id_156C( "dubai_second_floor_cove" );
            _id_448B( "mus_board_escalator", 1 );
            thread _id_4F6C();
            maps\_audio_mix_manager::_id_1517( "dubai_mute_player_impact" );
            break;
        case "start_top_floor":
            maps\_audio_zone_manager::_id_156C( "dubai_top_floor" );
            _id_448B( "mus_enter_top_floor", 1 );
            break;
        case "start_restaurant_entrance":
            maps\_audio_zone_manager::_id_156C( "dubai_restaurant" );
            _id_448B( "mus_enter_top_floor", 1 );
            break;
        case "start_restaurant_destruction":
            maps\_audio_zone_manager::_id_156C( "dubai_restaurant" );
            _id_448B( "mus_enter_top_floor", 1 );
            break;
        case "start_restaurant_exit":
            maps\_audio_zone_manager::_id_156C( "dubai_restaurant_blownup" );
            _id_448B( "mus_enter_top_floor", 1 );
            break;
        case "start_finale_chopper_sequence":
            maps\_audio::_id_177F( "audio: start_finale_chopper_sequence" );
            maps\_audio_mix_manager::_id_1517( "dubai_finale" );
            break;
        case "start_finale_crash_site":
            maps\_audio::_id_177F( "audio: start_finale_crash_site" );
            maps\_audio_mix_manager::_id_1517( "dubai_finale" );
            break;
        case "start_finale_beatdown":
            maps\_audio::_id_177F( "audio: start_finale_beatdown" );
            break;
        case "enter_dubai_walkpath":
            var_3 = var_1;
            break;
        case "exit_dubai_walkpath":
            var_4 = var_1;
            break;
        case "enter_dubai_entrance_atrium":
            var_3 = var_1;

            if ( var_3 == "dubai_walkpath" )
                _id_764B();

            break;
        case "exit_dubai_entrance_atrium":
            var_4 = var_1;

            if ( var_4 == "dubai_walkpath" )
            {
                thread _id_764E();
                level notify( "aud_stop_alarm_monitor" );
            }

            break;
        case "enter_dubai_first_floor":
            var_3 = var_1;

            if ( var_3 == "dubai_entrance_atrium" )
            {
                _id_448B( "mus_enter_hotel_lobby" );
                thread _id_765A();
            }

            break;
        case "exit_dubai_first_floor":
            var_4 = var_1;

            if ( var_4 == "dubai_entrance_atrium" )
                level notify( "aud_stop_alarm_monitor" );

            break;
        case "enter_dubai_second_floor":
            var_3 = var_1;
            break;
        case "exit_dubai_second_floor":
            var_4 = var_1;

            if ( var_4 == "dubai_second_floor" )
                _id_448B( "mus_second_floor" );

            break;
        case "enter_dubai_second_floor_cove":
            var_3 = var_1;

            if ( var_3 == "dubai_second_floor" )
                thread _id_764E();

            break;
        case "exit_dubai_second_floor_cove":
            var_4 = var_1;

            if ( var_4 == "dubai_second_floor" )
                _id_764B();

            break;
        case "enter_dubai_elevator":
            var_3 = var_1;

            if ( var_3 == "dubai_second_floor_cove" )
            {
                if ( common_scripts\utility::flag( "elevator_glass_broken" ) )
                    maps\_audio_stream_manager::_id_147D( "amb_dubi_elevator_blownout", 1 );
                else
                {
                    maps\_audio_stream_manager::_id_147D( "amb_dubi_elevator", 1 );
                    maps\_audio::_id_172C();
                    level.player seteq( "aircraft", 0, 0, "lowpass", 0, 1200, 2 );
                    level.player seteq( "aircraft", 1, 0, "lowpass", 0, 1200, 2 );
                }
            }

            break;
        case "exit_dubai_elevator":
            var_4 = var_1;
            break;
        case "enter_dubai_top_floor_open":
            var_3 = var_1;
            break;
        case "exit_dubai_top_floor_open":
            var_4 = var_1;
            break;
        case "enter_dubai_top_floor_windows":
            var_3 = var_1;
            break;
        case "exit_dubai_top_floor_windows":
            var_4 = var_1;
            break;
        case "enter_dubai_restaurant":
            var_3 = var_1;
            break;
        case "exit_dubai_restaurant":
            var_4 = var_1;
            break;
        case "enter_dubai_roof":
            var_3 = var_1;
            break;
        case "exit_dubai_roof":
            var_4 = var_1;
            break;
        case "enter_dubai_roof_stairwell":
            var_3 = var_1;
            break;
        case "exit_dubai_roof_stairwell":
            var_4 = var_1;
            break;
        case "enter_dubai_roof_top":
            var_3 = var_1;
            break;
        case "exit_dubai_roof_top":
            var_4 = var_1;
            break;
        case "aud_start_van_blackout_foley":
            maps\_audio::_id_1794( "dubai_intro_darkfoley" );
            break;
        case "aud_pip_open":
            maps\_audio::_id_1794( "dubai_pip_in" );
            wait 8.8;
            maps\_audio::_id_1794( "dubai_pip_out" );
            break;
        case "aud_pip_close":
            break;
        case "dubai_exit_van":
            maps\_audio_zone_manager::_id_156C( "dubai_walkpath" );
            break;
        case "bridge_suv_start_1":
            var_5 = var_1;
            wait 0.2;
            maps\_audio::_id_15D7( "dubai_SUV_drivein_01", var_5 );
            break;
        case "bridge_suv_start_2":
            var_5 = var_1;
            wait 0.2;
            maps\_audio::_id_15D7( "dubai_SUV_drivein_02", var_5 );
            break;
        case "suv_start_1":
            var_5 = var_1;
            wait 0.2;
            maps\_audio::_id_15D7( "dubai_SUV_drivein_03", var_5 );
            break;
        case "suv_start_2":
            var_5 = var_1;
            wait 0.2;
            maps\_audio::_id_15D7( "dubai_SUV_drivein_04", var_5 );
            break;
        case "suv_04_crash":
            var_6 = var_1;
            wait 3.25;
            maps\_audio::_id_15D7( "dubai_SUV_crash_04", var_6 );
            break;
        case "spawned_hotel_civilian":
            var_7 = var_1;

            if ( isdefined( var_7 ) )
                var_7 common_scripts\utility::play_loop_sound_on_entity( "dub_civilian_walla" );

            break;
        case "hotel_door_fall":
            var_8 = var_1;

            if ( isdefined( var_8 ) )
            {
                wait 0.8;
                maps\_audio::_id_15D7( "dub_hotel_doorfall", var_8 );
            }

            break;
        case "start_elevator_civ_runners":
            var_9 = var_1;

            if ( isarray( var_9 ) )
            {
                if ( isdefined( var_9[0] ) )
                    var_9[0] common_scripts\utility::play_loop_sound_on_entity( "dub_civilian_walla" );
            }

            break;
        case "aud_elevator_glass_destroy":
            var_10 = var_1;
            thread common_scripts\utility::play_sound_in_space( "glass_pane_blowout", var_10.origin );

            if ( !common_scripts\utility::flag( "elevator_glass_broken" ) )
            {
                common_scripts\utility::flag_set( "elevator_glass_broken" );
                var_11 = maps\_audio_zone_manager::_id_1578();

                if ( var_11 == "dubai_elevator" )
                {
                    maps\_audio_stream_manager::_id_147D( "amb_dubi_elevator_blownout", 1 );
                    maps\_audio::_id_172E();
                    level.player deactivateeq( 0, "aircraft" );
                    level.player deactivateeq( 1, "aircraft" );
                }
            }

            break;
        case "aud_elevator_glass_shatter":
            var_10 = var_1;
            thread common_scripts\utility::play_sound_in_space( "glass_pane_shatter", var_10.origin );
            break;
        case "elevator_floor_change":
            var_12 = var_1;

            if ( !isdefined( var_12 ) )
                return;

            if ( !level._id_16F5._id_7640 )
            {
                level._id_16F5._id_7640 = 1;
                return;
            }
            else
                maps\_audio::_id_15D7( "ele_floor_change_beep", var_12 );

            break;
        case "1st_elevator_doors_open":
            var_13 = var_1;

            if ( !isdefined( var_13 ) )
                return;

            thread common_scripts\utility::play_sound_in_space( "ele_bell_ring_lobby", var_13.origin );
            thread common_scripts\utility::play_sound_in_space( "ele_doors_open_lobby", var_13.origin );
            break;
        case "1st_elevator_doors_close":
            var_13 = var_1;
            var_14 = getent( "elevator_initial_model", "script_noteworthy" );
            var_12 = var_14.origin + ( 78.5, -51.0, 82.5 );

            if ( !isdefined( var_13 ) )
                return;

            if ( !level._id_16F5._id_7641 )
            {
                thread common_scripts\utility::play_sound_in_space( "ele_button_punch", var_12 );
                level._id_16F5._id_7641 = 1;
                wait 0.25;
            }

            thread common_scripts\utility::play_sound_in_space( "ele_doors_close_lobby", var_13.origin );
            wait 2.5;
            common_scripts\utility::flag_set( "turn_off_cove_alarm" );
            level notify( "aud_stop_alarm_monitor" );
            _id_764F();
            break;
        case "1st_elevator_platform_start":
            var_14 = var_1;
            common_scripts\utility::flag_set( "1st_elevator_moving" );
            var_14 thread _id_7656( "1" );
            break;
        case "1st_elevator_platform_stop":
            var_15 = var_1;
            common_scripts\utility::flag_clear( "1st_elevator_moving" );
            break;
        case "2nd_elevator_doors_open":
            var_13 = var_1;

            if ( !isdefined( var_13 ) )
                return;

            thread common_scripts\utility::play_sound_in_space( "ele_bell_ring_dry", var_13.origin );
            thread common_scripts\utility::play_sound_in_space( "ele_doors_open_topfloor", var_13.origin );
            thread _id_0050();
            break;
        case "2nd_elevator_platform_start":
            var_15 = var_1;
            var_15 thread _id_7656( "2" );
            wait 8;
            maps\_audio::_id_15D7( "ele_ext_descend", var_15 );
            break;
        case "2nd_elevator_platform_stop":
            var_15 = var_1;
            common_scripts\utility::flag_clear( "2nd_elevator_moving" );
            break;
        case "ambient_elevator_chopper":
            var_16 = var_1;

            if ( isdefined( var_16 ) )
                var_16 thread _id_7655( 0 );

            break;
        case "elevator_attack_chopper":
            var_16 = var_1;

            if ( isdefined( var_16 ) )
                var_16 thread _id_7655( 1 );

            break;
        case "littlebird_missile_ent_fired":
            var_17 = var_1;

            if ( isdefined( var_17 ) )
                var_17 thread maps\_utility::play_sound_on_entity( "littlebird_missile_whizby" );

            var_17 thread _id_7658();
            break;
        case "elevator_heli_crash_start":
            thread _id_765C();
            var_16 = var_1;

            if ( isdefined( var_16 ) )
            {
                var_18 = spawn( "script_origin", var_16.origin );
                var_18 linkto( var_16 );
                var_19 = thread common_scripts\utility::play_sound_in_space( "heli_deathspin_impact", var_18.origin );
                var_20 = thread maps\_audio::_id_15D7( "helicopter_crash_mech", var_18 );
                var_21 = thread maps\_audio::_id_15D7( "helicopter_crash_engine", var_18 );
                var_22 = thread maps\_audio::_id_15D7( "helicopter_crash_blades", var_18 );
                var_23 = thread maps\_audio::_id_15D7( "helicopter_crash_turbine", var_18 );
                var_24 = thread maps\_audio::_id_15D7( "heli_deathspin_secondary_explosion", var_18 );
                var_25 = [ var_19, var_20, var_21, var_22, var_23, var_24 ];
                var_16 thread _id_765D();
                common_scripts\utility::flag_wait( "aud_heli_crash_impact" );

                foreach ( var_27 in var_25 )
                {
                    if ( isdefined( var_27 ) )
                        var_27 stopsounds();
                }
            }

            break;
        case "elevator_heli_crashed":
            common_scripts\utility::flag_set( "aud_heli_crash_impact" );
            maps\_audio::_id_1794( "heli_explo_impact" );
            maps\_audio::_id_1794( "heli_explo_impact_lfe" );
            wait 0.4;
            maps\_audio::_id_1794( "heli_explo_impact_debris" );
            maps\_audio::_id_1795( "heli_explo_metal_tumble", 1.5, 1 );
            maps\_audio::_id_1795( "heli_explo_metal_groan", 2.5, 1 );
            _id_7646();
            wait 20.9;
            maps\_audio::_id_1794( "ele_crash_pre_fall_01" );
            break;
        case "elevator_short_drop":
            var_29 = var_1;
            maps\_audio_mix_manager::_id_1517( "dubai_elevator_crash_se" );
            maps\_audio::_id_1794( "ele_crash_01_metal_snap" );
            maps\_audio::_id_1794( "ele_damage_fall_short_01" );
            maps\_audio::_id_1794( "ele_crash_01_lyr" );
            wait 1;
            maps\_audio::_id_1794( "ele_crash_01_impact" );
            maps\_audio::_id_1794( "ele_crash_01_impact_lyr" );
            maps\_audio::_id_1794( "ele_crash_01_impact_lfe" );
            wait 0.2;
            maps\_audio::_id_1794( "elevator_crash_debris_03" );
            maps\_audio::_id_1794( "ele_crash_pre_fall_groan" );
            break;
        case "elevator_big_drop":
            level notify( "aud_restore_deathsdoor_audio" );
            var_29 = var_1;
            maps\_audio::_id_1794( "ele_damage_fall_short_02" );
            maps\_audio::_id_1794( "ele_crash_02_lyr" );
            wait 1;
            maps\_audio::_id_1794( "ele_crash_02_impact" );
            wait 0.2;
            maps\_audio::_id_1794( "ele_crash_02_impact_lyr" );
            maps\_audio::_id_1794( "elevator_crash_debris_01" );
            wait 1;
            maps\_audio::_id_1794( "ele_crash_03_pre_fall" );
            break;
        case "elevator_freefall":
            var_14 = var_1;

            if ( !common_scripts\utility::flag( "update_obj_pos_elevator_jump_complete" ) )
            {
                maps\_audio::_id_1794( "ele_crash_03_mtl_snap_2d" );
                var_30 = maps\_audio::_id_1794( "ele_freefall_grind_mtl_2d" );
                var_31 = maps\_audio::_id_1794( "ele_freefall_grind_tracks_2d" );
                var_32 = [ var_30, var_31 ];
                level waittill( "aud_elevator_hit_bottom_floor" );

                foreach ( var_34 in var_32 )
                {
                    if ( isdefined( var_34 ) )
                        var_34 stopsounds();
                }

                maps\_audio::_id_1794( "ele_freefall_death_impact" );
            }
            else if ( isdefined( var_14 ) )
            {
                maps\_audio::_id_15D7( "ele_crash_03_mtl_snap_3d", var_14 );
                var_30 = maps\_audio::_id_15D7( "ele_freefall_grind_mtl_3d", var_14 );
                var_31 = maps\_audio::_id_15D7( "ele_freefall_grind_tracks_3d", var_14 );
                var_32 = [ var_30, var_31 ];
                level waittill( "aud_elevator_hit_bottom_floor" );
                thread common_scripts\utility::play_sound_in_space( "ele_freefall_death_impact_3d", var_14.origin );

                foreach ( var_34 in var_32 )
                {
                    if ( isdefined( var_34 ) )
                        var_34 stopsounds();
                }
            }

            maps\_audio_mix_manager::_id_1520( "dubai_elevator_crash_se" );
            break;
        case "aud_elevator_fail_fall":
            level notify( "aud_elevator_hit_bottom_floor" );
            break;
        case "elevator_fire_start":
            var_38 = var_1;
            maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", var_38 + ( -100.0, -100.0, 150.0 ), "elevator_01", 1000, 1.0 );
            maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", var_38 + ( -100.0, -100.0, 150.0 ), "elevator_02", 1000, 1.0 );
            maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", var_38 + ( -100.0, -100.0, 151.0 ), "elevator_03", 1000, 1.0 );
            break;
        case "start_yuri_fire":
            maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", level._id_73D7.origin, "yuri_01", 1000, 1.0 );
            maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", level._id_73D7.origin, "yuri_02", 1000, 1.0 );
            break;
        case "stop_yuri_fire":
            maps\_audio_dynamic_ambi::_id_14A0( "fire_wood_med", "yuri_01", 5 );
            maps\_audio_dynamic_ambi::_id_14A0( "fire_wood_med_tight", "yuri_02", 5 );
            break;
        case "yuri_remove_armor":
            maps\_audio::_id_1795( "dubai_elevse_yuri_remove_plr_armor", 1.9 );
            maps\_audio::_id_1795( "dubai_elevse_yuri_remove_plr_armor_vo", 4.7 );
            break;
        case "top_floor_ambient_chopper":
            if ( !isdefined( var_1 ) )
                return;

            var_39 = maps\_audio::_id_15D7( "restaurant_heli_01_flyby_long", var_1 );
            var_40 = maps\_audio::_id_15D7( "restaurant_heli_01_flyin", var_1 );
            break;
        case "restaurant_chopper":
            if ( !isdefined( var_1 ) )
                return;

            var_40 = maps\_audio::_id_15D7( "restaurant_heli_02_flyin_fast", var_1 );
            var_41 = maps\_audio::_id_15D7( "restaurant_heli_02_flyin", var_1 );
            var_40 scalevolume( 0 );
            wait 0.05;
            var_40 scalevolume( 1, 1 );
            wait 0.3;
            thread maps\_audio_vehicles::_id_15D6( "restaurant_chopper", "dubai_littlebird", var_1 );
            level waittill( "aud_start_restaurant_destruction" );
            thread maps\_audio_vehicles::_id_15F4( "restaurant_chopper", 3.0 );
            break;
        case "restaurant_destruction":
            level notify( "aud_start_restaurant_destruction" );
            _id_448B( "mus_restaurant_destruction" );
            break;
        case "restaurant_destruction_begin":
        case "restaurant_chopper_fire_rocket":
            if ( !isdefined( level._id_16F5._id_7643 ) )
            {
                level._id_16F5._id_7643 = 1;
                maps\_audio_zone_manager::_id_156C( "dubai_restaurant_destruction", 0.05 );
                common_scripts\utility::flag_set( "turn_off_top_floor_alarm" );
            }

            var_42 = var_1;

            if ( isdefined( var_42 ) )
            {
                var_42 thread maps\_utility::play_sound_on_entity( "restaurant_rocket_whizby" );

                if ( isdefined( level._id_16F5._id_7644 ) )
                {
                    var_42 waittill( "death" );
                    maps\_audio::_id_1794( "restaurant_rocket_impact" );
                }
            }

            break;
        case "restaurant_destruction_end":
            break;
        case "finale_se":
            switch ( var_1 )
            {
                case "start_run":
                    _id_448B( "mus_finale_run_to_heli" );
                    break;
                case "start_helo_sequence":
                    thread _id_765E();
                    _id_448B( "mus_finale_heli_sequence" );
                    break;
                case "start_chopper_fire_amb":
                    wait 2;
                    maps\_audio::_id_1794( "dub_finale_helifire_amb" );
                    break;
                case "start_crawl":
                    _id_448B( "mus_finale_crawl" );
                    break;
                case "start_showdown":
                    _id_448B( "mus_finale_showdown" );
                    break;
                case "start_beatdown":
                    _id_448B( "mus_finale_beatdown" );
                    common_scripts\utility::play_loopsound_in_space( "dub_finale_helifire_amb_lp", ( 637.0, -228.0, 8144.0 ) );
                    break;
                case "start_hanging":
                    _id_448B( "mus_finale_hanging" );
                    maps\_utility::delaythread( 18.0, maps\_audio::_id_1794, "dub_finale_makhang_creaks" );
                    break;
                case "start_stranger":
                    _id_448B( "mus_start_stranger" );
                    wait 2.55;
                    level.player thread maps\_audio::_id_170B( "dub_finale_shadowman_enter", 1 );
                    wait 1;
                    maps\_audio::_id_1794( "dub_finale_shadowman_enter" );
                    wait 16.18;
                    var_43 = spawn( "script_origin", level.player.origin );
                    var_43 thread maps\_audio::_id_170B( "dub_finale_shadowman_exit", 1 );
                    wait 1;
                    maps\_audio::_id_1794( "dub_finale_shadowman_exit" );
                    break;
                case "finale_fail":
                    _id_448B( "mus_finale_fail" );
                    break;
                default:
                    break;
            }

            break;
        case "start_finale_chopper":
            var_44 = var_1;

            if ( !isdefined( var_44 ) )
                return;

            thread maps\_audio::_id_1794( "dub_chopper_roofwind" );
            var_44 playsound( "dub_chopper_distant" );
            var_44 playloopsound( "dub_mak_heli_lp" );
            break;
        case "finale_jump_succesful":
            common_scripts\utility::flag_set( "aud_finale_jump_succesful" );
            var_44 = var_1;
            maps\_audio::_id_1795( "dub_chopper_crash_turbine", 21, 1 );

            if ( !isdefined( var_44 ) )
                return;

            var_44 stoploopsound( "dub_mak_heli_lp" );
            break;
        case "makarov_doorclose":
            var_45 = var_1;
            wait 5;

            if ( isdefined( var_45 ) )
                var_45 playsound( "dub_chopper_doorclose" );

            break;
        case "player_chopper_stab":
            thread maps\_audio::_id_1794( "dub_chopper_stab_clear" );
            maps\_audio::_id_1795( "dub_chopper_stab_clear_gun_swtnr", 1 );
            break;
        case "player_chopper_throwguy":
            thread maps\_audio::_id_1794( "dub_finale_chopperthrow_vo" );
            break;
        case "set_stick":
            var_46 = var_1;
            _id_7662( var_46 );
            break;
        case "chopper_crash_finale":
            maps\_audio_mix_manager::_id_1517( "dubai_finale" );
            thread maps\_audio::_id_1794( "finale_crash_impact_punch" );
            thread maps\_audio::_id_1794( "finale_crash_impact_heli_hit_ground" );
            wait 0.3;
            thread maps\_audio::_id_1794( "finale_crash_shake_01" );
            wait 0.2;
            thread maps\_audio::_id_1794( "finale_crash_shake_02" );
            wait 0.2;
            thread maps\_audio::_id_1794( "finale_crash_shake_03" );
            break;
        case "makarov_kneel":
            thread maps\_audio::_id_1794( "dub_finale_mak_kneel" );
            thread maps\_audio::_id_1794( "dub_finale_mak_kneel_vo" );
            break;
        case "makarov_fail_getgun":
            wait 7.1;
            maps\_audio::_id_1794( "dub_finale_makgungrab_failstate" );
            wait 2.3;
            maps\_audio::_id_1794( "dub_finale_mak_gunraise" );
            wait 0.2;
            maps\_audio::_id_1794( "dub_mak_failstate_01" );
            break;
        case "finale_shoot_makarov":
            thread maps\_audio::_id_1794( "dub_finale_shoot_mak" );
            thread maps\_audio::_id_1794( "dub_finale_shoot_mak_sweet" );
            maps\_audio::_id_1795( "dub_finale_shoot_mak_vo", 0.15 );
            break;
        case "finale_showdown_fail":
            wait 0.7;
            maps\_audio::_id_1794( "dub_mak_failstate_01" );
            break;
        case "finale_mak_shoots_failstate":
            maps\_audio::_id_1794( "dub_mak_failstate_02" );
            break;
        case "getup_vo":
            thread maps\_audio::_id_1794( "dub_finale_price_getup_vo" );
            break;
        case "punch1_2_vo":
            thread maps\_audio::_id_1794( "dub_finale_price_punch1_2_vo" );
            break;
        case "punch_3_vo":
            thread maps\_audio::_id_1794( "dub_finale_price_punch_3_vo" );
            break;
        case "slam1_vo":
            thread maps\_audio::_id_1794( "dub_finale_price_slam1_vo" );
            break;
        case "choke_vo":
            wait 0.5;
            thread maps\_audio::_id_1794( "dub_finale_price_choke_vo" );
            break;
        case "slam2_vo":
            wait 0.2;
            thread maps\_audio::_id_1794( "dub_finale_price_slam2_vo" );
            break;
        case "slam3_vo":
            thread maps\_audio::_id_1794( "dub_finale_price_slam3_vo" );
            break;
        case "play_credits_music":
            _id_448B( "mus_play_credits_music_from_front_end" );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_448B( var_0, var_1 )
{
    thread _id_448C( var_0, var_1 );
}

_id_448C( var_0, var_1 )
{
    var_2 = 1;

    if ( getsubstr( var_0, 0, 4 ) != "mus_" )
        return 0;

    level notify( "kill_other_music" );
    level endon( "kill_other_music" );

    switch ( var_0 )
    {
        case "mus_intro":
            maps\_audio_music::_id_15A7( "dubai_intro", 5 );
            break;
        case "mus_first_combat":
            wait 0.2;
            maps\_audio::_id_17A2( 1000, 0.1 );
            maps\_audio_music::_id_15A7( "dubai_first_combat", 1 );
            wait 2;
            maps\_audio::_id_17A2( 1, 30 );
            break;
        case "mus_enter_hotel_lobby":
            maps\_audio_music::_id_15A7( "dubai_enter_hotel", 5 );
            wait 4;
            maps\_audio::_id_17A2( 1, 2 );
            wait 1;
            maps\_audio_music::_id_15A7( "dubai_intro", 5 );
            break;
        case "mus_board_escalator":
            maps\_audio_music::_id_15A7( "dubai_board_escalator", 10 );
            break;
        case "mus_elevator_button_pressed":
            maps\_audio_music::_id_15A8( 10 );
            break;
        case "mus_elevator_heli_attack":
            maps\_audio_music::_id_15A8( 1 );
            break;
        case "mus_elevator_heli_crash":
            wait 2;
            maps\_audio_music::_id_15A7( "dubai_elevator_heli_crash", 5 );
            wait 10;
            maps\_audio_music::_id_15A7( "dubai_drone_d_med", 5 );
            wait 5;
            maps\_audio_music::_id_15A8( 10 );
            break;
        case "mus_elevator_heli_player_jump":
            maps\_audio::_id_17A2( 100, 0.5 );
            maps\_audio_music::_id_15A7( "dubai_elevator_heli_player_jump", 0 );
            wait 5;
            maps\_audio::_id_17A2( 1, 2 );
            maps\_audio_music::_id_15A7( "dubai_enter_elevator", 6 );
            break;
        case "mus_enter_top_floor":
            wait 1;
            maps\_audio_music::_id_15A7( "dubai_enter_top_floor", 0 );
            break;
        case "mus_restaurant_destruction":
            maps\_audio_music::_id_15A8( 1 );
            break;
        case "mus_restaurant_pillar_explodes":
            maps\_audio_music::_id_15A7( "dubai_restaurant_pillar_explodes", 5 );
            break;
        case "mus_dont_let_him_get_away":
            maps\_audio::_id_17A2( 100, 1 );
            maps\_audio_music::_id_15A7( "dubai_dont_let_him_get_away", 0.2, 3 );
            break;
        case "mus_finale_run_to_heli":
            wait 1;
            maps\_audio_music::_id_15A7( "dubai_finale_run_to_heli", 2 );
            break;
        case "mus_finale_heli_sequence":
            maps\_audio_music::_id_15A7( "dubai_finale_heli_sequence", 5 );
            break;
        case "mus_finale_crawl":
            maps\_audio_music::_id_15A7( "dubai_finale_crawl", 5 );
            break;
        case "mus_finale_showdown":
            maps\_audio_music::_id_15A7( "dubai_finale_showdown", 5 );
            break;
        case "mus_finale_beatdown":
            maps\_audio_music::_id_15A7( "dubai_finale_beatdown", 5 );
            break;
        case "mus_finale_hanging":
            maps\_audio_music::_id_15A7( "dubai_finale_hanging", 5 );
            wait 65.8;
            wait 8;
            maps\_audio_music::_id_15A7( "dubai_finale_roll_credits", 5 );
            common_scripts\utility::flag_wait( "atvi_credits_go" );
            maps\_audio_mix_manager::_id_1517( "dubai_credits", 7 );
        case "mus_play_credits_music_from_front_end":
            maps\_audio_music::_id_15A7( "dubai_finale_roll_credits", 0 );
            break;
        case "mus_start_stranger":
            maps\_audio_music::_id_15A8( 10 );
            wait 6;
            maps\_audio_music::_id_15A7( "dubai_finale_stranger_appears", 5 );
            break;
        case "mus_finale_fail":
            maps\_audio_music::_id_15A7( "shg_fail_stinger", 0, 1 );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_7645()
{
    wait 1;
    level.player seteq( "weapon", 0, 0, "lowpass", 0, 1000, 1 );
    level.player seteq( "weapon", 1, 0, "lowpass", 0, 1000, 1 );
    level.player seteq( "bulletimpact", 0, 0, "lowpass", 0, 5000, 1 );
    level.player seteq( "bulletimpact", 1, 0, "lowpass", 0, 5000, 1 );
    level.player seteq( "bulletwhizby", 0, 0, "lowpass", 0, 400, 1 );
    level.player seteq( "bulletwhizby", 1, 0, "lowpass", 0, 400, 1 );
    wait 39;
    level.player deactivateeq( 0, "weapon" );
    level.player deactivateeq( 1, "weapon" );
    level.player deactivateeq( 0, "bulletimpact" );
    level.player deactivateeq( 1, "bulletimpact" );
    level.player deactivateeq( 0, "bulletwhizby" );
    level.player deactivateeq( 1, "bulletwhizby" );
    maps\_audio_mix_manager::_id_1520( "dubai_inside_truck", 1.0 );
}

_id_4F6C()
{
    level endon( "aud_stop_player_impacts" );

    for (;;)
    {
        level.player waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
        level.player playsound( "armor_impact" );
    }
}

_id_7646()
{
    level notify( "aud_stop_player_impacts" );
}

_id_7647()
{
    wait 0.05;

    if ( !isdefined( level._id_16F5._id_7648 ) )
    {
        level._id_16F5._id_7648 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        level._id_16F5._id_7648 maps\_audio::_id_17B4( "dubai_water_fountain_lp", level._id_16F5._id_763D, 20, 0, 200 );
    }
    else
        level._id_16F5._id_7648 maps\_audio::_id_17BD();
}

_id_7649()
{
    if ( isdefined( level._id_16F5._id_7648 ) )
        level._id_16F5._id_7648 maps\_audio::_id_17BC();
}

_id_764A()
{
    if ( isdefined( level._id_16F5._id_7648 ) )
        level._id_16F5._id_7648 delete();
}

_id_764B()
{
    wait 0.1;

    if ( !isdefined( level._id_16F5._id_764C ) )
    {
        level._id_16F5._id_764C = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        level._id_16F5._id_764C maps\_audio::_id_17B4( "dubai_water_fountain_center_lp", level._id_16F5._id_763E, 20, 250, 350 );
        level._id_16F5._id_764D = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        level._id_16F5._id_764D maps\_audio::_id_17B4( "dubai_water_fountain_sides_lp", level._id_16F5._id_763F, 10, 200, 300 );
    }
    else
    {
        level._id_16F5._id_764C maps\_audio::_id_17BD();
        level._id_16F5._id_764D maps\_audio::_id_17BD();
    }
}

_id_764E()
{
    if ( isdefined( level._id_16F5._id_764C ) )
    {
        level._id_16F5._id_764C maps\_audio::_id_17BC();
        level._id_16F5._id_764D maps\_audio::_id_17BC();
    }
}

_id_764F()
{
    if ( isdefined( level._id_16F5._id_764C ) )
    {
        level._id_16F5._id_764C delete();
        level._id_16F5._id_764D delete();
    }
}

_id_7650()
{
    var_0 = spawn( "script_origin", ( 1934.0, 42.0, 220.0 ) );
    var_1 = spawn( "script_origin", ( 282.0, 2.0, 524.0 ) );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_1 thread common_scripts\utility::play_loop_sound_on_entity( "dubai_hotel_alarm_bell" );
    common_scripts\utility::flag_wait( "turn_off_cove_alarm" );
    var_1 thread common_scripts\utility::stop_loop_sound_on_entity( "dubai_hotel_alarm_bell" );
    var_0 thread common_scripts\utility::stop_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_1 delete();
    var_0 delete();
}

_id_0050()
{
    var_0 = spawn( "script_origin", ( -428.0, -4.0, 7931.0 ) );
    var_1 = spawn( "script_origin", ( 1205.0, -934.0, 7905.0 ) );
    var_2 = spawn( "script_origin", ( 1216.0, 961.0, 7905.0 ) );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_2 thread common_scripts\utility::play_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_1 thread common_scripts\utility::play_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    common_scripts\utility::flag_wait( "turn_off_top_floor_alarm" );
    var_0 thread common_scripts\utility::stop_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_2 thread common_scripts\utility::stop_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_1 thread common_scripts\utility::stop_loop_sound_on_entity( "dubai_hotel_alarm_bell_entrance" );
    var_0 delete();
    var_2 delete();
    var_1 delete();
}

_id_7651()
{
    common_scripts\utility::flag_wait( "drop_player_elevator" );
}

_id_7652()
{
    level waittill( "player_elevator_jump_successul" );
}

_id_7653( var_0 )
{

}

_id_7654()
{
    common_scripts\utility::flag_wait( "player_at_top_floor" );
    maps\_audio_zone_manager::_id_156C( "dubai_top_floor" );
}

_id_7655( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( var_0 )
    {
        thread maps\_audio::_id_15D7( "elevator_littlebird_approach", self );
        thread maps\_audio::_id_1788( self, "littlebird_move", 1, 3.0, 1 );
    }
    else
    {
        wait 3;
        thread maps\_audio::_id_15D7( "elevator_littlebird_02_dist_flyby", self );
    }
}

_id_7656( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( var_0 == "1" )
    {
        maps\_audio::_id_1794( "ele_move_startup_2d" );
        var_1 = maps\_audio::_id_15D7( "ele_move_loop_2d", level.player, "loop", "aud_stop_elevator_movement" );
        var_1 scalevolume( 0.0 );
        wait 0.05;
        var_1 scalevolume( 1, 2 );
        common_scripts\utility::flag_waitopen( "1st_elevator_moving" );
        var_1 scalevolume( 0, 1.5 );
    }
    else
    {
        common_scripts\utility::flag_wait( "player_jumped_to_replacement_elevator" );
        maps\_audio::_id_1794( "ele_move_startup_02_2d" );
        var_1 = maps\_audio::_id_15D7( "ele_move_loop_2d", level.player, "loop", "aud_stop_elevator_movement" );
        var_1 scalevolume( 0.0 );
        wait 0.05;
        var_1 scalevolume( 1, 2 );
        thread _id_7657();
        common_scripts\utility::flag_wait( "player_at_top_floor" );
        var_1 scalevolume( 0, 1.5 );
    }
}

_id_7657()
{
    wait 1.5;
    maps\_audio::_id_1794( "ele_metal_knocking_01_2d" );
}

_id_7658()
{
    if ( isdefined( self ) )
    {
        self waittill( "explode", var_0 );
        thread common_scripts\utility::play_sound_in_space( "littlebird_missile_big", var_0 );
    }
}

_id_7659( var_0 )
{
    level endon( "aud_stop_alarm_monitor" );
    var_1 = ( 1420.0, 0.0, 225.0 );
    var_2 = 1000;

    for (;;)
    {
        var_3 = distance( var_1, level.player.origin );
        var_4 = var_3 / var_2;
        var_4 = 1 - clamp( var_4, 0, 1 );
        var_0 scalevolume( var_4, 0.1 );
        wait 0.1;
    }
}

_id_765A()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 = spawn( "script_origin", ( 665.0, 12.0, 800.0 ) );
    thread _id_765B( var_0, var_1 );
    var_0 scalevolume( 0 );
    wait 0.05;
    _id_7659( var_0 );
    var_0 stoploopsound();
    var_1 stoploopsound();
    wait 0.05;
    var_0 delete();
    var_1 delete();
}

_id_765B( var_0, var_1 )
{
    level endon( "aud_stop_alarm_monitor" );

    for (;;)
    {
        var_0 playsound( "dubai_hotel_alarm_wet", "alarm_01_done" );
        var_1 playsound( "dubai_hotel_alarm_dry" );
        var_0 waittill( "alarm_01_done" );
        var_0 playsound( "dubai_hotel_alarm_wet", "alarm_02_done" );
        var_1 playsound( "dubai_hotel_alarm_dry" );
        var_0 waittill( "alarm_02_done" );
        var_0 playsound( "dubai_hotel_announce_wet_us", "announcer_01_done" );
        var_1 playsound( "dubai_hotel_announce_dry_us" );
        var_0 waittill( "announcer_01_done" );
        var_0 playsound( "dubai_hotel_alarm_wet", "alarm_03_done" );
        var_1 playsound( "dubai_hotel_alarm_dry" );
        var_0 waittill( "alarm_03_done" );
        var_0 playsound( "dubai_hotel_alarm_wet", "alarm_04_done" );
        var_1 playsound( "dubai_hotel_alarm_dry" );
        var_0 waittill( "alarm_04_done" );
        var_0 playsound( "dubai_hotel_announce_wet_us", "announcer_02_done" );
        var_1 playsound( "dubai_hotel_announce_dry_us" );
        var_0 waittill( "announcer_02_done" );
    }
}

_id_765C()
{
    maps\_audio::_id_1719();
    soundsettimescalefactor( "norestrict2d", 0 );
    soundsettimescalefactor( "norestrict", 0 );
    soundsettimescalefactor( "grondo2d", 0 );
    soundsettimescalefactor( "grondo3d", 0 );
    soundsettimescalefactor( "voice", 0 );
    soundsettimescalefactor( "music", 0 );
    soundsettimescalefactor( "mission", 0 );
    soundsettimescalefactor( "critical", 0 );
    soundsettimescalefactor( "announcer", 0 );
    level waittill( "aud_restore_deathsdoor_audio" );
    maps\_audio::_id_1717();
}

_id_765D()
{
    level endon( "aud_heli_whoosh_played" );

    if ( !isdefined( self ) )
        return;

    for (;;)
    {
        var_0 = distance( self.origin, level.player.origin );

        if ( var_0 < 1000 && level._id_16F5._id_7642 == 0 )
        {
            level._id_16F5._id_7642 = 1;

            if ( isdefined( self ) )
            {
                var_1 = thread maps\_audio::_id_15D7( "heli_deathspin_explo_whoosh_sweetner", self );
                common_scripts\utility::flag_wait( "aud_heli_crash_impact" );

                if ( isdefined( var_1 ) )
                    var_1 stopsounds();

                level notify( "aud_heli_whoosh_played" );
            }
        }

        wait 0.05;
    }
}

_id_765E()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_rock_lrg", ( -648.0, 252.0, 8148.0 ), "helicopter_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -648.0, 258.0, 8140.0 ), "helicopter_02", 1000, 1.0 );
}

_id_765F()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -945.0, -415.0, 7722.0 ), "restaurant_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1111.0, -264.0, 7643.0 ), "restaurant_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -935.0, -135.0, 7711.0 ), "restaurant_03", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1073.0, 112.0, 7656.0 ), "restaurant_04", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1037.0, 164.0, 7656.0 ), "restaurant_05", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -918.0, 152.0, 7729.0 ), "restaurant_06", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -804.0, -116.0, 7779.0 ), "restaurant_07", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -811.0, -28.0, 7901.0 ), "restaurant_08", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -813.0, 80.0, 7901.0 ), "restaurant_09", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -786.0, 420.0, 7784.0 ), "restaurant_10", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -55.0, 201.0, 7966.0 ), "restaurant_11", 1000, 1.0 );
}

_id_7660()
{
    maps\_audio_dynamic_ambi::_id_149F( "dubai_restaurant_blownup_point_01", ( -302.0, 400.0, 8012.0 ), "blownup_point_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "dubai_restaurant_blownup_point_02", ( -65.0, -264.0, 8001.0 ), "blownup_point_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "dubai_restaurant_blownup_point_03", ( -805.0, 403.0, 7849.0 ), "blownup_point_03", 1000, 1.0 );
    common_scripts\utility::flag_wait( "aud_finale_jump_succesful" );
    maps\_audio_dynamic_ambi::_id_14A0( "dubai_restaurant_blownup_point_01", "blownup_point_01", 3 );
    maps\_audio_dynamic_ambi::_id_14A0( "dubai_restaurant_blownup_point_02", "blownup_point_02", 3 );
    maps\_audio_dynamic_ambi::_id_14A0( "dubai_restaurant_blownup_point_03", "blownup_point_03", 3 );
}

_id_7661()
{
    soundsettimescalefactor( "norestrict2d", 0 );
    soundsettimescalefactor( "norestrict", 0 );
    soundsettimescalefactor( "grondo2d", 0 );
    soundsettimescalefactor( "grondo3d", 0 );
}

_id_7662( var_0 )
{
    if ( !isdefined( level._id_16F5._id_7663 ) )
        level._id_16F5._id_7663 = 0;

    var_1 = sqrt( var_0[0] * var_0[0] + var_0[1] * var_0[1] );
    var_2 = 0.5;

    if ( var_1 > var_2 )
    {
        if ( !level._id_16F5._id_7663 )
        {
            level._id_16F5._id_7663 = 1;
            level.player playsound( "dub_chopper_stick_move" );
        }
    }
    else
        level._id_16F5._id_7663 = 0;
}

_id_7664()
{
    thread _id_7666( 150 );
    thread _id_7665( 151 );
    thread _id_7665( 152 );
    thread _id_7667( 153 );
    thread _id_7668( 191 );
}

_id_7665( var_0 )
{
    level waittill( "exploding_" + var_0 );
    maps\_audio::_id_1794( "restaurant_rocket_impact" );
}

_id_7666( var_0 )
{
    level waittill( "exploding_" + var_0 );
    maps\_audio::_id_1794( "restaurant_breach_transient" );
    maps\_audio::_id_1795( "restaurant_breach_explo_front", 0.05, 1 );
    maps\_audio::_id_1795( "restaurant_breach_bodyfall", 2.0, 1 );
}

_id_7667( var_0 )
{
    level waittill( "exploding_" + var_0 );
    level._id_16F5._id_7644 = 1;
    maps\_audio::_id_1794( "restaurant_big_explo_main" );
    maps\_audio::_id_1795( "restaurant_heli_se_01", 0.863, 1 );
}

_id_7668( var_0 )
{
    level waittill( "exploding_" + var_0 );
    maps\_audio::_id_1794( "restaurant_column_explo_main" );
    maps\_audio::_id_1795( "restaurant_column_explo_front", 0.5, 1 );
    maps\_audio::_id_1795( "restaurant_drop_whoosh_short", 1.4, 1 );
    maps\_audio::_id_1795( "restaurant_drop_imp_front", 1.663, 1 );
    maps\_audio::_id_1795( "restaurant_drop_imp_blast", 1.783, 1 );
    maps\_audio::_id_1795( "restaurant_drop_lfe", 1.8, 1 );
    maps\_audio::_id_1795( "restaurant_drop_crack", 1.8, 1 );
    maps\_audio::_id_1795( "restaurant_drop_slide_debris", 2.03, 1 );
    maps\_audio::_id_1795( "restaurant_drop_slide_front", 3.101, 1 );
    maps\_audio::_id_1795( "restaurant_wine_bottle_roll", 4.78, 1 );
    maps\_audio::_id_1795( "restaurant_city_wind", 5.905, 1 );
    maps\_audio::_id_1795( "restaurant_player_over_edge", 6.075, 1 );
    maps\_audio::_id_1795( "restaurant_cable_grab_front", 7.018, 1 );
    maps\_audio::_id_1795( "restaurant_hand_grip_front", 7.513, 1 );
    maps\_audio::_id_1795( "restaurant_heli_se_02", 7.83, 1 );
    maps\_audio::_id_1795( "restaurant_grabledge", 12.003, 1 );
    maps\_audio::_id_1795( "restaurant_getup_02", 16.523, 1 );
    wait 10;
    thread _id_765F();
    thread _id_7660();
    maps\_audio_zone_manager::_id_156C( "dubai_restaurant_blownup", 2 );
}
