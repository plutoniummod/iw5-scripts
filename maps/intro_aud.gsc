// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvarint( "prologue_select" ) )
        maps\_audio::_id_17C1( 0 );
    else
        maps\_audio::_id_17C1( 3 );

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
    maps\_audio_mix_manager::_id_1517( "intro_level_global_mix", 1 );
}

_id_4ED2()
{
    maps\_audio::_id_1740( "shg" );
    maps\_audio::_id_156E( "med_occlusion" );
    maps\_audio::_id_1735( "shg_default", 20 );
}

_id_4ED3()
{
    common_scripts\utility::flag_init( "aud_rear_strafe_stomp" );
    common_scripts\utility::flag_init( "mi28_doctor_kill_flyout" );
    common_scripts\utility::flag_init( "aud_mi28_gun_occlusion_off" );
    common_scripts\utility::flag_init( "aud_maars_shed_heli_swap" );
    common_scripts\utility::flag_init( "aud_mars_dead" );
    common_scripts\utility::flag_init( "aud_stop_maars_impacts" );
}

_id_4ED4()
{
    if ( !isdefined( level._id_16F5 ) )
        level._id_16F5 = spawnstruct();

    if ( getdvarint( "prologue_select" ) )
    {
        level._id_16F5._id_7164 = 0;
        level._id_16F5._id_7165 = [ [ "prolog_flashback1", 3.9 ], [ "prolog_flashback2", 5.13 ], [ "prolog_flashback3", 5.2 ], [ "prolog_flashback4", 5.2 ] ];
        level._id_16F5._id_7166 = undefined;
        level._id_16F5._id_7167 = 0.01;
    }

    level._id_16F5._id_7168 = 0;
    thread _id_4988();
}

_id_447D()
{
    thread _id_7184();
}

_id_496E()
{

}

_id_447F()
{
    level._id_16F5._id_440B["maars_lo_dmg_scale"] = [ [ 0.0, 0.0 ], [ 0.05, 0.1 ], [ 0.1, 0.15 ], [ 0.2, 0.5 ], [ 0.3, 0.6 ], [ 0.4, 0.7 ], [ 0.5, 0.5 ], [ 0.6, 0.4 ], [ 0.8, 0.2 ], [ 1.0, 0.0 ] ];
    level._id_16F5._id_440B["maars_hi_dmg_scale"] = [ [ 0.0, 0.0 ], [ 0.05, 0.0 ], [ 0.1, 0.0 ], [ 0.2, 0.0 ], [ 0.3, 0.0 ], [ 0.4, 0.0 ], [ 0.5, 0.4 ], [ 0.6, 0.6 ], [ 0.8, 0.8 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["maars_mix_dmg_blend"] = [ [ 0.0, 0.0 ], [ 0.05, 0.2 ], [ 0.075, 0.3 ], [ 0.1, 0.4 ], [ 0.14, 0.5 ], [ 0.18, 0.6 ], [ 0.2, 0.8 ], [ 0.25, 1.0 ], [ 1.0, 1.0 ] ];
}

_id_4480()
{

}

_id_447E()
{
    anim._id_1E72["aud_intro_river_sequence"] = ::_id_7183;
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
            maps\_audio_mix_manager::_id_1517( "prolog_intro_mix", 0.1 );
            wait 0.2;
            var_4 = maps\_audio::_id_1794( "prolog_intro" );
            var_4 scalevolume( 0.25 );
            wait 0.05;
            var_4 scalevolume( 1, 6 );
            break;
        case "start_intro_transition":
            maps\_audio_zone_manager::_id_156C( "intro_courtyard_interior" );
            maps\_audio::_id_1794( "india_intro" );
            _id_448B( "mus_start_intro_transition" );
            break;
        case "start_courtyard":
            maps\_audio_zone_manager::_id_156C( "intro_courtyard" );
            break;
        case "start_escourt":
            maps\_audio_zone_manager::_id_156C( "intro_courtyard" );
            _id_448B( "mus_eyes_on_courtyard" );
            break;
        case "start_regroup":
            maps\_audio_zone_manager::_id_156C( "intro_street" );
            _id_448B( "mus_eyes_on_courtyard" );
            break;
        case "start_maars_shed":
            maps\_audio_zone_manager::_id_156C( "intro_street" );
            _id_448B( "mus_courtyard_gate_breach" );
            break;
        case "start_maars_control":
            maps\_audio_zone_manager::_id_156C( "intro_street" );
            _id_448B( "mus_start_point_only_maars_control" );
            break;
        case "start_slide":
            maps\_audio_zone_manager::_id_156C( "intro_shack_underground" );
            break;
        case "enter_intro_temple_hallway":
            var_5 = var_1;
            break;
        case "exit_intro_temple_hallway":
            var_6 = var_1;
            break;
        case "enter_intro_temple_under":
            var_5 = var_1;
            break;
        case "exit_intro_temple_under":
            var_6 = var_1;
            break;
        case "enter_intro_courtyard_ground":
            var_5 = var_1;
            break;
        case "exit_intro_courtyard_ground":
            var_6 = var_1;
            break;
        case "enter_intro_street":
            var_5 = var_1;
            break;
        case "exit_intro_street":
            var_6 = var_1;
            break;
        case "enter_intro_street_room":
            var_5 = var_1;
            break;
        case "exit_intro_street_room":
            var_6 = var_1;
            break;
        case "enter_intro_street_house":
            var_5 = var_1;
            break;
        case "exit_intro_street_house":
            var_6 = var_1;
            break;
        case "enter_intro_shack":
            var_5 = var_1;
            break;
        case "exit_intro_shack":
            var_6 = var_1;
            break;
        case "enter_intro_shack_underground":
            var_5 = var_1;
            break;
        case "exit_intro_shack_underground":
            var_6 = var_1;
            break;
        case "enter_intro_street_maars":
            var_5 = var_1;
            break;
        case "exit_intro_street_maars":
            var_6 = var_1;
            break;
        case "intro_white_fade_in":
            maps\_audio_mix_manager::_id_1520( "prolog_intro_mix", 2 );
            maps\_audio_mix_manager::_id_1517( "prolog_gurney_mix", 2 );
            wait 6;
            maps\_audio_zone_manager::_id_156C( "intro_courtyard", 3 );
            _id_448B( "mus_gurney_scene", 3 );
            wait 3;
            _id_716D();
            break;
        case "start_gurney_scene_heli":
            var_7 = var_1;
            break;
        case "cinematic_sequence_prep":
            level._id_16F5._id_7166 = spawn( "script_origin", level.player.origin );
            _id_7170();
            break;
        case "cinematic_sequence_cleanup":
            level._id_16F5._id_7166 stopsounds();
            wait 0.1;
            level._id_16F5._id_7166 delete();
            level._id_16F5._id_7166 = undefined;
            break;
        case "start_gurney_heartbeat":
            _id_716D();
            break;
        case "stop_gurney_heartbeat":
            _id_716F();
            break;
        case "intro_fade_out_to_white":
            _id_7169();
            break;
        case "intro_fade_in_from_white":
            break;
        case "begin_cinematic":
            if ( 0 )
                iprintln( "begin_cinematic" );

            maps\_audio_mix_manager::_id_1517( "prolog_flashback_mix", 0 );
            var_8 = _id_7172();
            level._id_16F5._id_7166 playsound( var_8 );
            _id_7171();

            if ( var_8 == "prolog_flashback2" )
                thread _id_716B();
            else if ( var_8 == "prolog_flashback3" )
                thread _id_716C();

            var_9 = _id_7173();
            var_9 -= 0.2;
            maps\_utility::delaythread( var_9, ::_id_716A );
            break;
        case "end_cinematic":
            if ( 0 )
                iprintln( "end_cinematic" );

            maps\_audio_mix_manager::_id_1520( "prolog_flashback_mix", 0 );
            _id_7174();
            _id_7170();
            break;
        case "intro_shot_1_start":
            wait 6.3;
            maps\_audio::_id_1794( "prolog_gurney_se_chopper" );
            break;
        case "intro_shot_2_start":
            maps\_audio::_id_1794( "prolog_gurney_se_01" );
            break;
        case "intro_shot_3_start":
            maps\_audio::_id_1794( "prolog_gurney_se_02" );
            break;
        case "intro_shot_4_start":
            maps\_audio::_id_1794( "prolog_gurney_se_03" );
            break;
        case "intro_shot_5_start":
            maps\_audio::_id_1794( "prolog_gurney_se_04" );
            break;
        case "intro_opening_movie_start":
            maps\_audio_mix_manager::_id_150F( "mute_all", 1 );
            break;
        case "intro_soap_temple_start":
            wait 1.2;
            maps\_audio::_id_1794( "intro_soapcough_se" );
            break;
        case "intro_shot_7":
            _id_7180();
            break;
        case "intro_shot_8":
            thread _id_7181();
            wait 11.0;
            maps\_audio_zone_manager::_id_156C( "intro_courtyard" );
            maps\_audio_mix_manager::_id_1517( "intro_courtyard_skybattle" );
            common_scripts\utility::flag_set( "aud_mi28_gun_occlusion_off" );
            break;
        case "courtyard_magic_rpg_01":
            var_10 = var_1[0];
            var_11 = var_1[1];
            thread common_scripts\utility::play_sound_in_space( "heli_missile_launch", var_10 );
            maps\_audio::_id_15D7( "heli_death_missile_incoming", var_11 );
            break;
        case "courtyard_heli_Mi17_01":
            if ( !isdefined( var_1 ) )
                return;

            var_12 = thread maps\_audio::_id_15D7( "mi17_blades_loop", var_1, "loop", "kill_courtyard_heli_Mi17_01_loop" );
            var_1 thread _id_7179( var_12 );
            break;
        case "courtyard_mi17_drone1":
            if ( !isdefined( var_1[0] ) )
                return;

            break;
        case "courtyard_mi17_drone3_kill":
            if ( !isdefined( var_1 ) )
                return;

            wait 7;
            break;
        case "attack_heli_mi28_1":
            if ( !isdefined( var_1 ) )
                return;

            break;
        case "attack_heli_mi28_5":
            if ( !isdefined( var_1 ) )
                return;

            break;
        case "attack_heli_mi28_6":
            if ( !isdefined( var_1 ) )
                return;

            break;
        case "attack_heli_mi28_2":
            if ( !isdefined( var_1 ) )
                return;

            wait 3;
            var_13 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_attack_heli_mi28_2_kill_loop" );
            var_13 scalevolume( 0 );
            wait 0.05;
            var_13 scalevolume( 1, 3 );
            wait 2;
            maps\_audio::_id_15D7( "mi28_1_flyby_quick_1", var_1 );
            thread maps\_audio::_id_1795( "heli_by_lfe_long", 2.3 );
            thread maps\_audio::_id_1795( "heli_by_rattles_05", 2 );
            wait 3;
            var_13 scalevolume( 0, 3 );
            wait 3;
            break;
        case "attack_heli_mi28_3":
            if ( !isdefined( var_1 ) )
                return;

            wait 6;
            maps\_audio::_id_15D7( "mi28_3_long_by", var_1 );
            var_14 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_attack_heli_mi28_3_kill_loop" );
            thread maps\_audio::_id_1795( "heli_by_lfe_long", 5.6 );
            thread maps\_audio::_id_1795( "heli_by_rattles_04", 5.5 );
            wait 4;
            maps\_audio::_id_15D7( "mi28_2_flyby_quick_1", var_1 );
            wait 3;
            var_14 scalevolume( 0.0, 3 );
            wait 3.05;
            level notify( "aud_attack_heli_mi28_3_kill_loop" );
            break;
        case "attack_heli_mi28_8":
            if ( !isdefined( var_1 ) )
                return;

            var_15 = maps\_audio::_id_15D7( "mi28_8_long_by", var_1 );
            wait 17.5;
            var_16 = maps\_audio::_id_15D7( "mi28_8_second_pass", var_1 );
            var_17 = maps\_audio::_id_15D7( "mi28_8_second_pass_close", var_1 );
            wait 3.5;
            thread maps\_audio::_id_1795( "heli_by_lfe_long", 3 );
            thread maps\_audio::_id_1795( "heli_by_rattles_03", 3.2 );
            var_18 = maps\_audio::_id_15D7( "intro_mi28_flyby_quick_3", var_1 );
            break;
        case "attack_heli_mi28_7":
            if ( !isdefined( var_1 ) )
                return;

            maps\_audio::_id_15D7( "mi28_8_long_by", var_1 );
            wait 19.5;
            var_16 = maps\_audio::_id_15D7( "mi28_7_second_pass", var_1 );
            var_17 = maps\_audio::_id_15D7( "mi28_7_second_pass_close", var_1 );
            wait 4;
            var_18 = maps\_audio::_id_15D7( "intro_mi28_flyby_quick_2", var_1 );
            break;
        case "courtyard_helicopter4_kill":
            if ( !isdefined( var_1 ) )
                return;

            var_19 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_courtyard_helicopter4_kill_loop" );
            var_1 waittill( "death" );
            thread common_scripts\utility::play_sound_in_space( "courtyard_helicopter4_kill", var_19.origin );
            break;
        case "escort_doc_down_mi28":
            if ( !isdefined( var_1 ) )
                return;

            wait 3;
            var_19 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_attack_heli_mi28_2_kill_loop" );
            var_19 scalevolume( 0 );
            wait 0.05;
            var_19 scalevolume( 1, 5 );
            wait 2;
            var_20 = maps\_audio::_id_15D7( "mi28_doctor_killer_fly_in", var_1 );
            common_scripts\utility::flag_wait( "mi28_doctor_kill_flyout" );
            var_19 scalevolume( 0.75, 1 );
            wait 3;
            var_19 scalevolume( 0, 5 );
            break;
        case "mi28_doctor_killed_flyout":
            if ( !isdefined( var_1 ) )
                return;

            wait 3;
            thread maps\_audio::_id_1795( "heli_by_lfe_long", 2 );
            thread maps\_audio::_id_1795( "heli_by_rattles_02", 2.5 );
            common_scripts\utility::flag_set( "mi28_doctor_kill_flyout" );
            var_21 = maps\_audio::_id_15D7( "mi28_doctor_killer_flyout", var_1 );
            wait 5;
            maps\_audio_mix_manager::_id_1520( "intro_courtyard_skybattle" );
            break;
        case "escort_doorkick":
            var_22 = var_1;
            wait 0.6;
            var_22 playsound( "intro_preshack_house_doorkick" );
            break;
        case "aud_courtyard_gate_breach":
            wait 0.15;
            common_scripts\utility::play_sound_in_space( "intro_courtyard_gatekick", ( -1534.0, 1634.0, 260.0 ) );
            break;
        case "aud_civilian_door_breach":
            wait 0.38;
            common_scripts\utility::play_sound_in_space( "intro_preshack_house_doorkick", ( -5177.0, 3759.0, -292.0 ) );
            break;
        case "intro_civ_car_slide":
            var_23 = var_1;
            var_23 playsound( "intro_carslide_slide" );
            break;
        case "intro_civ_car_explode":
            var_24 = var_1;
            common_scripts\utility::play_sound_in_space( "intro_carslide_explode", var_24 );
            break;
        case "courtyard_start_breach":
            var_25 = ( -1525.0, 1131.0, 371.0 );
            thread common_scripts\utility::play_sound_in_space( "courtyard_breach_explode_main", var_25 );
            thread common_scripts\utility::play_sound_in_space( "courtyard_breach_explode_wood", var_25 );
            thread common_scripts\utility::play_sound_in_space( "courtyard_breach_explode_dist_verb", var_25 );
            thread common_scripts\utility::play_sound_in_space( "courtyard_breach_debris_long", var_25 );
            break;
        case "start_civ_runners_wave1a":
            var_26 = var_1;

            if ( isarray( var_26 ) )
            {
                if ( isdefined( var_26[0] ) )
                    var_26[0] common_scripts\utility::play_loop_sound_on_entity( "intro_civ_walla_male_01_firstwave" );
            }

            break;
        case "start_civ_runners_wave1b":
            var_27 = var_1;

            if ( isarray( var_27 ) )
            {
                if ( isdefined( var_27[0] ) )
                    var_27[0] common_scripts\utility::play_loop_sound_on_entity( "intro_civ_walla_male_01" );
            }

            break;
        case "start_civ_runners_wave1c":
            var_28 = var_1;

            if ( isarray( var_28 ) )
            {
                if ( isdefined( var_28[0] ) )
                    var_28[0] common_scripts\utility::play_loop_sound_on_entity( "intro_civ_walla_male_02" );
            }

            break;
        case "start_civ_runners_wave_2":
            var_29 = var_1;

            if ( isarray( var_29 ) )
            {
                if ( isdefined( var_29[0] ) )
                    var_29[0] common_scripts\utility::play_loop_sound_on_entity( "intro_civ_walla_male_01_loud" );
            }

            break;
        case "escort_mi28_1":
            if ( !isdefined( var_1 ) )
                return;

            var_19 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_escort_mi28_1_kill_loop" );
            var_19 scalevolume( 0 );
            wait 0.05;
            var_19 scalevolume( 1, 4 );
            wait 2;
            maps\_audio::_id_15D7( "mi28_courtyard_fly_in", var_1 );
            wait 5;
            maps\_audio::_id_15D7( "mi28_courtyard_fly_out", var_1 );
            wait 4;
            common_scripts\utility::flag_clear( "aud_mi28_gun_occlusion_off" );
            break;
        case "courtyard_exit_flyby_01":
            if ( !isdefined( var_1 ) )
                return;

            maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_courtyard_heli_flyby_kill_lp" );
            wait 8;
            maps\_audio::_id_15D7( "mi28_streets_flyover_main", var_1 );
            break;
        case "courtyard_exit_flyby_02":
            if ( !isdefined( var_1 ) )
                return;

            maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "aud_courtyard_heli_flyby_kill_lp" );
            wait 10;
            maps\_audio::_id_15D7( "mi28_streets_flyover_02", var_1 );
            break;
        case "regroup_mi17_1":
            if ( !isdefined( var_1 ) )
                return;

            maps\_audio::_id_15D7( "mi17_streets_fly_in", var_1 );
            var_19 = maps\_audio::_id_15D7( "mi17_streets_blades_loop", var_1, "loop", "aud_regroup_mi17_1_kill_lp" );
            var_19 scalevolume( 0.0 );
            wait 0.05;
            var_19 scalevolume( 1, 3 );
            common_scripts\utility::flag_wait( "regroup_mi17_unloaded" );

            if ( isdefined( var_1 ) )
            {
                wait 0.8;
                var_19 scalevolume( 0.5, 3 );
                maps\_audio::_id_15D7( "mi17_streets_fly_out", var_1 );
            }

            break;
        case "regroup_ending_start":
            if ( !isdefined( var_1 ) )
                return;

            var_13 = maps\_audio::_id_15D7( "mi28_gate_block_blades_loop", var_1, "loop", "kill_gate_heli_loop" );
            wait 3;
            var_30 = maps\_audio::_id_15D7( "mi28_big_gate_inbound", var_1 );
            common_scripts\utility::flag_wait( "aud_maars_shed_heli_swap" );

            if ( isdefined( var_13 ) )
            {
                var_13 scalevolume( 0, 3 );
                wait 3.05;
                level notify( "kill_gate_heli_loop" );
            }

            break;
        case "regroup_uav_gate_fly_by":
            if ( !isdefined( var_1 ) )
                return;

            wait 0.5;
            maps\_audio::_id_15D7( "pred_by_courtyard_01", var_1 );
            break;
        case "UAV_street_bombing":
            if ( !isdefined( var_1 ) )
                return;

            maps\_audio::_id_15D7( "pred_by_streets_bomb_run", var_1 );
            break;
        case "uav_fire_missile":
            if ( !isdefined( var_1 ) )
                return;

            var_1 waittill( "missile_hit" );
            thread common_scripts\utility::play_sound_in_space( "pred_missile_impact_main", var_1.origin );
            break;
        case "worlds_slowest_helicopter_by":
            if ( !isdefined( var_1 ) )
                return;

            maps\_audio::_id_15D7( "mi28_by_slow", var_1, "loop", "aud_slow_flyby_kill_lp" );
            break;
        case "intro_shed_bombshake_01":
            maps\_audio::_id_1794( "intro_shed_bombshake" );
            break;
        case "intro_shed_bombshake_02":
            maps\_audio::_id_1794( "intro_shed_bombshake" );
            break;
        case "maars_garage_door_opening":
            wait 2.75;
            maps\_audio::_id_1794( "intro_shack_metaldoor_up" );
            break;
        case "maars_ugv_start":
            break;
        case "player_maars_interact_start":
            maps\_audio_mix_manager::_id_1517( "intro_maars_control_mix", 2 );
            wait 2.1;
            maps\_audio::_id_1794( "maars_bootcomp" );
            thread _id_717F();
            break;
        case "maars_computer_boot_up":
            maps\_audio::_id_1794( "maars_comp_enter" );
            break;
        case "maars_control_door_open":
            var_22 = var_1;

            if ( !isdefined( var_22 ) )
                return;

            break;
        case "maars_player_control_start":
            level._id_6F6B thread _id_717D();
            level._id_6F6B thread _id_717B();
            break;
        case "maars_grenade_fired":
            var_31 = var_1;
            var_31 thread _id_717E();
            break;
        case "maars_damage_intensity":
            var_32 = var_1;
            level._id_16F5._id_7167 = clamp( var_32, 0, 1 );
            break;
        case "maars_takes_explosive_dmg":
            break;
        case "maars_takes_bullet_dmg":
            break;
        case "digital_distort_death":
            break;
        case "maars_attack_chopper":
            if ( !isdefined( var_1 ) )
                return;

            if ( !level._id_16F5._id_7168 )
            {
                common_scripts\utility::flag_set( "aud_maars_shed_heli_swap" );
                var_12 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "kill_maars_attack_chopper_loop" );
                var_1 thread _id_7179( var_12 );
                var_12 scalevolume( 0 );
                wait 0.05;
                var_12 scalevolume( 0.3, 2 );
                level._id_16F5._id_7168 = 1;
            }
            else
            {
                var_12 = maps\_audio::_id_15D7( "mi28_blades_loop", var_1, "loop", "kill_maars_attack_chopper_loop" );
                var_1 thread _id_7179( var_12 );
            }

            break;
        case "maars_transport_chopper":
            if ( !isdefined( var_1 ) )
                return;

            var_12 = thread maps\_audio::_id_15D7( "mi17_blades_loop_no_oc", var_1, "loop", "kill_maars_attack_chopper_loop" );
            var_1 thread _id_7179( var_12 );
            break;
        case "maars_control_drone_inbound":
            var_33 = var_1;
            wait 1.2;
            maps\_audio::_id_1794( "maars_death_missile_incoming" );
            maps\_audio::_id_1795( "maars_death_short_whoosh", 0.7, 1 );
            wait 0.8;
            maps\_audio_mix_manager::_id_1517( "intro_maars_death_mix", 0.1 );
            break;
        case "uav_kill_maars":
            common_scripts\utility::flag_set( "aud_mars_dead" );
            common_scripts\utility::flag_set( "aud_stop_maars_impacts" );
            maps\_audio_mix_manager::_id_151C( "static_death_blend", 0.2 );
            maps\_audio_mix_manager::_id_1520( "intro_maars_control_mix", 2 );
            level notify( "kill_maars_dmg_ent_lo" );
            level notify( "kill_maars_dmg_ent_hi" );
            var_33 = var_1;
            thread maps\_audio_vehicles::_id_15F4( "ugv_motor_player" );
            thread maps\_audio_vehicles::_id_15F4( "ugv_treads_player" );
            thread maps\_audio_vehicles::_id_15F4( "ugv_idle_player" );
            var_34 = level.player.origin;
            maps\_audio::_id_1794( "maars_death_drone_flyby" );
            maps\_audio::_id_1795( "maars_death_tumble", 1.5, 1 );
            thread common_scripts\utility::play_sound_in_space( "finale_missile_impact_2d", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_missile_impact_3d", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_missile_impact_lyr", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_mortar_lfe", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_missile_debris", var_34 );
            wait 0.25;
            thread common_scripts\utility::play_sound_in_space( "finale_missile_debris_long", var_34 );
            thread _id_7186();
            thread _id_7185();
            break;
        case "heli_fire_missile":
            var_11 = var_1;
            thread common_scripts\utility::play_sound_in_space( "heli_missile_launch", var_11.origin );
            var_11 thread _id_449F();
            break;
        case "aud_heli_missile_explode":
            var_11 = var_1;
            break;
        case "finale_missile_incoming":
            var_11 = var_1;
            thread maps\_audio::_id_15D7( "finale_missile_incoming", var_11 );
            break;
        case "finale_missile_impact":
            var_34 = var_1;
            thread common_scripts\utility::play_sound_in_space( "finale_missile_impact_3d", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_missile_impact_lyr", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_mortar_lfe", var_34 );
            thread common_scripts\utility::play_sound_in_space( "finale_missile_debris", var_34 );
            wait 0.25;
            thread common_scripts\utility::play_sound_in_space( "finale_missile_debris_long", var_34 );
            break;
        case "building_event_start":
            _id_7182();
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
        case "mus_gurney_scene":
            maps\_audio_music::_id_15A7( "intro_gurney_scene", 0 );
            break;
        case "mus_start_intro_transition":
            wait 2;
            maps\_audio_music::_id_15A7( "india_intro_transition", 5 );
            break;
        case "mus_vo_nik_yurioverhere":
            maps\_audio::_id_17A2( 0.6, 10 );
            break;
        case "mus_eyes_on_courtyard":
            maps\_audio::_id_17A2( 1, 3 );
            maps\_audio_music::_id_15A7( "india_courtyard_combat", 3 );
            break;
        case "mus_halfway_through_courtyard":
            maps\_audio_music::_id_15A7( "india_courtyard_half_way", 8 );
            break;
        case "vo_price_moveup":
            maps\_audio_music::_id_15A8( 20 );
            break;
        case "mus_courtyard_gate_breach":
            maps\_audio::_id_17A2( 100, 1 );
            maps\_audio_music::_id_15A7( "india_streets", 3 );
            break;
        case "mus_civilian_door_breach":
            maps\_audio_music::_id_15A7( "india_streets_end", 3 );
            maps\_audio::_id_17A2( 1, 5 );
            break;
        case "mus_start_point_only_maars_control":
            break;
        case "mus_ugv_start":
            maps\_audio::_id_17A2( 100, 5 );
            maps\_audio_music::_id_15A7( "india_ugv_control", 3 );
            break;
        case "mus_ugv_destroyed":
            maps\_audio::_id_17A2( 1, 5 );
            maps\_audio_music::_id_15A7( "india_ugv_destroyed", 3 );
            break;
        case "mus_run_to_heli":
            maps\_audio::_id_17A2( 100, 5 );
            maps\_audio_music::_id_15A7( "india_run_to_heli", 3 );
            break;
        case "mus_player_slide":
            maps\_audio_music::_id_15A8( 1 );
            maps\_audio::_id_17A2( 1, 5 );
            break;
        case "mus_emerge_from_river":
            maps\_audio_music::_id_15A7( "india_ending1", 5 );
            wait 8;
            maps\_audio_music::_id_15A7( "india_ending2", 5 );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_7169()
{
    maps\_audio::_id_1794( "intro_flashback_in" );
}

_id_716A()
{
    maps\_audio::_id_1794( "intro_flashback_out" );
}

_id_716B()
{
    wait 5.2;
    maps\_audio::_id_1794( "prolog_flashback2_gunshot" );
}

_id_716C()
{
    wait 5.1;
    maps\_audio::_id_1794( "prolog_flashback3_splash" );
}

_id_716D()
{
    if ( !isdefined( level._id_16F5._id_716E ) )
    {
        level._id_16F5._id_716E = spawn( "script_origin", level.player.origin );
        level._id_16F5._id_716E playloopsound( "prolog_hearbeat_loop" );
    }
}

_id_716F()
{
    if ( isdefined( level._id_16F5._id_716E ) )
    {
        level._id_16F5._id_716E scalevolume( 0.0, 0.1 );
        wait 0.1;
        level._id_16F5._id_716E stoploopsound();
        level._id_16F5._id_716E delete();
        level._id_16F5._id_716E = undefined;
    }
}

_id_7170()
{
    var_0 = _id_7172();

    if ( isstring( var_0 ) )
        level._id_16F5._id_7166 thread maps\_audio::_id_170B( var_0, 1 );
}

_id_7171()
{
    var_0 = _id_7172();
    level._id_16F5._id_7166 maps\_audio::_id_170F( var_0 );
}

_id_7172()
{
    var_0 = undefined;
    var_1 = level._id_16F5._id_7165[level._id_16F5._id_7164];

    if ( isdefined( var_1 ) )
        var_0 = var_1[0];

    return var_0;
}

_id_7173()
{
    var_0 = undefined;
    var_1 = level._id_16F5._id_7165[level._id_16F5._id_7164];

    if ( isdefined( var_1 ) )
        var_0 = var_1[1];

    return var_0;
}

_id_7174()
{
    level._id_16F5._id_7164++;
}

_id_7175()
{

}

_id_7176( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self ) )
        return;

    var_4 = 1;
    var_5 = "No_Name";

    if ( isdefined( var_1 ) )
        var_4 = var_1;

    if ( isdefined( var_0 ) )
        var_5 = var_0;

    if ( isdefined( var_3 ) )
    {

    }

    if ( var_4 )
        thread _id_7177( var_5, var_2 );

    if ( !var_4 )
        thread _id_7178( var_5, var_2 );
}

_id_7177( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = "mi28_blades_loop";

    var_2 = maps\_audio::_id_15D7( var_1, self, "loop", "kill_" + var_0 + "_loop" );
    var_2 scalevolume( 0.0 );
    wait 0.05;
    var_2 scalevolume( 1, 3 );
}

_id_7178( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = "mi17_blades_loop";

    var_2 = maps\_audio::_id_15D7( var_1, self, "loop", "kill_" + var_0 + "_loop" );
    var_2 scalevolume( 0.0 );
    wait 0.05;
    var_2 scalevolume( 1, 3 );
}

_id_449F()
{
    if ( !isdefined( self ) )
        return;

    var_0 = maps\_audio::_id_15D7( "heli_missile_loop", self, "loop", "aud_stop_heli_missile_loop" );
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    self waittill( "missile_hit" );
    var_0 delete();
    thread common_scripts\utility::play_sound_in_space( "finale_missile_impact_3d", var_1.origin );
    wait 1.5;
    var_1 delete();
}

_id_7179( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    self waittill( "deathspin" );
    var_2 = thread common_scripts\utility::play_sound_in_space( "intro_helicopter_crash_hit", var_1.origin );
    var_3 = thread maps\_audio::_id_15D7( "intro_helicopter_crash_blades", var_1 );
    var_4 = thread maps\_audio::_id_15D7( "intro_helicopter_crash_engine", var_1 );
    var_5 = thread maps\_audio::_id_15D7( "intro_heli_deathspin_explo_whoosh_sweetner", var_1 );
    var_6 = thread maps\_audio::_id_15D7( "intro_heli_explo_streamer", var_1 );
    var_7 = thread maps\_audio::_id_15D7( "intro_heli_deathspin_secondary_explosion", var_1 );
    var_8 = [ var_2, var_3, var_4, var_5, var_6, var_7 ];
    var_1 playloopsound( "intro_heli_deathspin_engine_whine" );
    self waittill( "death" );
    thread common_scripts\utility::play_sound_in_space( "intro_helicopter_crash_explo", var_1.origin );

    foreach ( var_10 in var_8 )
    {
        if ( isdefined( var_10 ) )
            var_10 stopsounds();
    }

    var_1 stopsounds();
    wait 0.05;
    var_1 delete();
}

_id_717A( var_0 )
{

}

_id_717B()
{
    common_scripts\utility::flag_wait( "maars_control_door_open" );
    thread _id_717C();
    level endon( "aud_mars_dead" );
    var_0 = maps\_audio::_id_15D7( "maars_static_dmg_lo", self, "loop", "kill_maars_dmg_ent_lo" );
    var_1 = maps\_audio::_id_15D7( "maars_static_dmg_hi", self, "loop", "kill_maars_dmg_ent_hi" );
    var_2 = 0.25;
    var_3 = 0.1;
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = 0.1;

    for (;;)
    {
        if ( isdefined( level._id_16F5._id_7167 ) )
        {
            var_8 = level._id_16F5._id_7167;
            var_9 = maps\_audio::_id_178B( var_4, var_8, 0.001 );
            var_4 = var_9;
            var_10 = maps\_audio::_id_178A( var_8, var_3, var_2, level._id_16F5._id_440B["maars_lo_dmg_scale"] );
            var_11 = maps\_audio::_id_178A( var_8, var_3, var_2, level._id_16F5._id_440B["maars_hi_dmg_scale"] );
            var_12 = maps\_audio::_id_178A( var_8, var_3, var_2, level._id_16F5._id_440B["maars_mix_dmg_blend"] );
            var_12 = clamp( var_12, 0, 1 );
            var_0 scalevolume( var_10, 0.3 );
            var_1 scalevolume( var_11, 0.3 );

            if ( !var_5 )
            {
                var_5 = 1;
                maps\_audio_mix_manager::_id_1518( "intro_maars_dying_mix", "static_death_blend", var_12 );
            }
            else if ( var_12 != var_6 )
            {
                var_6 = var_12;
                maps\_audio_mix_manager::_id_151A( "static_death_blend", var_12, var_7 );
            }
        }

        wait(var_7);
    }
}

_id_717C()
{

}

_id_717D()
{
    thread maps\_audio_vehicles::_id_15D6( "ugv_motor_player", "ugv_motor_player", self );
    thread maps\_audio_vehicles::_id_15D6( "ugv_treads_player", "ugv_treads_player", self );
    wait 1;
    thread maps\_audio_vehicles::_id_15D6( "ugv_idle_player", "ugv_idle_player", self, 4.0 );
}

_id_717E()
{
    maps\_audio::_id_1794( "maars_grenade_launcher_kick" );
    self waittill( "explode" );

    if ( isdefined( self.origin ) )
        thread common_scripts\utility::play_sound_in_space( "maars_grenade_explode", self.origin );
}

_id_717F()
{
    level endon( "aud_stop_maars_impacts" );

    for (;;)
    {
        level.player waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
        level.player playsound( "maars_impact_dmg" );
        wait 0.05;
    }
}

_id_4988()
{
    soundsettimescalefactor( "announcer", 0 );
    soundsettimescalefactor( "mission", 0 );
    soundsettimescalefactor( "norestrict2d", 0 );
    soundsettimescalefactor( "grondo2d", 0 );
}

_id_7180()
{
    maps\_audio::_id_1795( "intro_helicrash_lfe", 3.0, 1 );
    maps\_audio::_id_1795( "intro_helicrash_rattle_front", 5.0, 1 );
    maps\_audio::_id_1795( "intro_helicrash_turbine_rear", 5.5, 1 );
    maps\_audio::_id_1795( "intro_helicrash_engine", 7.726, 1 );
    maps\_audio::_id_1795( "intro_helicrash_transient", 9.175, 1 );
    maps\_audio::_id_1795( "intro_helicrash_explo_front", 9.225, 1 );
    maps\_audio::_id_1795( "intro_helicrash_crack_front", 9.521, 1 );
    maps\_audio::_id_1795( "intro_helicrash_imp_front", 10.75, 1 );
}

_id_7181()
{
    maps\_audio_zone_manager::_id_156C( "intro_heli_crash", 0.05 );
    maps\_audio_music::_id_15A8();
    maps\_audio::_id_1795( "intro_helicrash_fall_impact", 0.987, 1 );
    maps\_audio::_id_1795( "intro_helicrash_drop_crack", 1.717, 1 );
    maps\_audio::_id_1795( "intro_helicrash_debris_front", 2.864, 1 );
    maps\_audio::_id_1795( "intro_helicrash_tumble", 2.905, 1 );
    maps\_audio::_id_1795( "intro_helicrash_debris_rear", 4.141, 1 );
    maps\_audio::_id_1795( "intro_helicrash_demo_rear", 5.16, 1 );
    maps\_audio::_id_1795( "intro_helicrash_demo_front", 5.893, 1 );
    maps\_audio::_id_1795( "intro_helicrash_metal_groan", 8.571, 1 );
    maps\_audio::_id_1795( "intro_helicrash_heli_fall_front", 9.552, 1 );
    maps\_audio::_id_1795( "intro_helicrash_heli_slide_rear", 10.1, 1 );
    maps\_audio::_id_1795( "intro_helicrash_mtl_debris", 10.891, 1 );
    maps\_audio::_id_1795( "intro_helicrash_heli_fall_drop", 11.559, 1 );
    maps\_audio::_id_1795( "intro_helicrash_chunk_spin", 12.033, 1 );
    maps\_audio::_id_1795( "intro_helicrash_ground_impact", 12.935, 1 );
    maps\_audio::_id_1795( "intro_helicrash_tbone", 12.953, 1 );
    maps\_audio::_id_1795( "intro_helicrash_drop_imp_front", 13.026, 1 );
}

_id_7182()
{
    maps\_audio_mix_manager::_id_1517( "intro_slide_sequence", 0.05 );
    maps\_audio_zone_manager::_id_156C( "intro_slide", 0.05 );
    maps\_audio_music::_id_15A8();
    maps\_audio::_id_1795( "intro_slide_missile_impact", 0.05, 1 );
    maps\_audio::_id_1795( "intro_slide_initial_blast_01", 0.23, 1 );
    maps\_audio::_id_1795( "intro_slide_initial_crack_front", 0.346, 1 );
    maps\_audio::_id_1795( "intro_slide_initial_blast_03", 0.35, 1 );
    maps\_audio::_id_1795( "intro_slide_initial_blast_02", 0.35, 1 );
    maps\_audio::_id_1795( "intro_slide_drone_flyby", 1.383, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_whoosh_short", 3.5, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_imp_front", 3.763, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_imp_blast", 3.883, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_lfe", 3.9, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_crack", 3.9, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_slide_front", 5.201, 1 );
    maps\_audio::_id_1795( "intro_slide_drop_wind", 7.5, 1 );
    maps\_audio::_id_1795( "intro_slide_chunk_whoosh", 8.006, 1 );
    maps\_audio::_id_1795( "intro_slide_chunk_impact", 8.978, 1 );
    maps\_audio::_id_1795( "intro_slide_house_imp_01", 9.84, 1 );
    maps\_audio::_id_1795( "intro_slide_house_fall_front", 10.486, 1 );
    maps\_audio::_id_1795( "intro_slide_house_fall_impact", 11.465, 1 );
    maps\_audio::_id_1795( "intro_slide_house_fall_sweet", 12.101, 1 );
    maps\_audio::_id_1795( "intro_slide_tube_imp_02", 15.164, 1 );
    maps\_audio::_id_1795( "intro_slide_slab_imp", 15.63, 1 );
    maps\_audio::_id_1795( "intro_slide_slab_whoosh_rear", 17.565, 1 );
    maps\_audio::_id_1795( "intro_slide_slab_splash", 19.301, 1 );
    maps\_audio::_id_1795( "intro_slide_tube_splash", 19.564, 1 );
}

_id_7183( var_0, var_1 )
{
    if ( !isdefined( level._id_16F5._id_7183 ) )
    {
        level._id_16F5._id_7183 = 1;
        wait 0.05;
        maps\_audio::_id_1795( "intro_river_plyr_splash_punch", 0.05, 1 );
        maps\_audio::_id_1795( "intro_river_surface_01", 1.138, 1 );
        maps\_audio::_id_1795( "intro_river_rapids_01_front", 2.834, 1 );
        maps\_audio::_id_1795( "intro_river_heli_flyby", 2.962, 1 );
        maps\_audio::_id_1795( "intro_river_breath_01", 3.278, 1 );
        maps\_audio::_id_1795( "intro_river_hand_splash_01", 4.605, 1 );
        maps\_audio::_id_1795( "intro_river_hand_splash_02", 5.48, 1 );
        maps\_audio::_id_1795( "intro_river_hand_splash_03", 5.938, 1 );
        maps\_audio::_id_1795( "intro_river_uw_drown_front", 5.996, 1 );
        maps\_audio::_id_1795( "intro_river_uw_02_front", 6.228, 1 );
        maps\_audio::_id_1795( "intro_river_surface_02_front", 17.896, 1 );
        maps\_audio::_id_1795( "intro_river_breath_02", 17.998, 1 );
        maps\_audio::_id_1795( "intro_river_bank_rapids_rear", 18.29, 1 );
        maps\_audio::_id_1795( "intro_river_bank_hand_01", 19.365, 1 );
        maps\_audio::_id_1795( "intro_river_surface_02_tail_front", 19.453, 1 );
        maps\_audio::_id_1795( "intro_river_bank_hand_02", 19.94, 1 );
        maps\_audio::_id_1795( "intro_river_bank_slide_01", 22.124, 1 );
        maps\_audio::_id_1795( "intro_river_bank_hand_03", 22.749, 1 );
        maps\_audio::_id_1795( "intro_river_bank_slide_02", 24.04, 1 );
        maps\_audio::_id_1795( "intro_river_bank_hand_04", 25.168, 1 );
        thread _id_0019();
    }
}

_id_0019()
{
    wait 22;
    var_0 = maps\_audio::_id_15D7( "river_heli_pickup_2d", level.player, "loop", "aud_stop_exit_heli_lp" );
    var_0 scalevolume( 0 );
    wait 0.05;
    var_0 scalevolume( 0.9, 8 );
    wait 11;
    var_0 scalevolume( 0, 15 );
    wait 18;
    level notify( "aud_stop_exit_heli_lp" );
}

_id_7184()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1484.0, -117.0, 695.0 ), "temple_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1564.0, -172.0, 701.0 ), "temple_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1666.0, -101.0, 699.0 ), "temple_03", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1649.0, -80.0, 557.0 ), "temple_04", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1539.0, -62.0, 501.0 ), "courtyard_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -1691.0, 53.0, 453.0 ), "heli_01", 1000, 1.0 );
    thread common_scripts\utility::play_loopsound_in_space( "emt_fire_metal_med", ( -1691.0, 53.0, 453.0 ) );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1597.0, 125.0, 466.0 ), "heli_02", 1000, 1.0 );
    thread common_scripts\utility::play_loopsound_in_space( "emt_fire_metal_med", ( -1597.0, 125.0, 466.0 ) );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -1605.0, 277.0, 404.0 ), "heli_03", 1000, 1.0 );
    thread common_scripts\utility::play_loopsound_in_space( "emt_fire_metal_med", ( -1491.0, 323.0, 328.0 ) );
    thread common_scripts\utility::play_loopsound_in_space( "emt_fire_metal_med", ( -1672.0, 202.0, 367.0 ) );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -749.0, 1985.0, 150.0 ), "woodtruck_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -596.0, 2022.0, 198.0 ), "woodtruck_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -2766.0, 2801.0, 201.0 ), "shoeshop_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -2911.0, 2802.0, 36.0 ), "shoeshop_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -2935.0, 2797.0, 201.0 ), "tradeshop_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -2648.0, 2806.0, 42.0 ), "tradeshop_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -2549.0, 2794.0, 19.0 ), "tradeshop_03", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -3397.0, 2463.0, -22.0 ), "crates_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -3498.0, 2380.0, 135.0 ), "crateshop_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( -4246.0, 3717.0, -154.0 ), "housewall_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -3858.0, 3591.0, 1.0 ), "apt_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -4242.0, 3967.0, 93.0 ), "apt_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -4033.0, 4479.0, -114.0 ), "apt_03", 1000, 1.0 );
}

_id_7185()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -7493.0, 2992.0, -417.0 ), "finalhouse_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( -7518.0, 2647.0, -587.0 ), "finalhouse_02", 1000, 1.0 );
}

_id_7186()
{
    var_0 = maps\_audio::_id_15D7( "maars_static_dmg_hi", level.player, "loop", "kill_dead_ugv_static_loop" );
    wait 2;
    maps\_audio_mix_manager::_id_1520( "intro_maars_death_mix", 4 );
    wait 2;
    var_0 scalevolume( 0, 3 );
    wait 3.05;
    level notify( "kill_dead_ugv_static_loop" );
}
