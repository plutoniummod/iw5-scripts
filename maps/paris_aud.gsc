// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_audio::_id_16F4();
    maps\_audio::_id_1740( "shg" );
    maps\_audio::_id_156E( "med_occlusion" );
    maps\_audio::_id_1735();
    common_scripts\utility::flag_init( "aud_intro_heli_exit" );
    common_scripts\utility::flag_init( "aud_ac130_moment_complete" );
    common_scripts\utility::flag_init( "mi17_courtyard_flyby" );
    common_scripts\utility::flag_init( "aud_sewers_start" );
    common_scripts\utility::flag_init( "aud_player_exits_bomb_truck" );
    common_scripts\utility::flag_init( "flag_catacombs_bomb_1" );
    common_scripts\utility::flag_init( "flag_catacombs_bomb_2" );
    common_scripts\utility::flag_init( "flag_catacombs_bomb_3" );
    common_scripts\utility::flag_init( "flag_catacombs_pipe_burst" );
    common_scripts\utility::flag_init( "primed_sound_played" );
    common_scripts\utility::flag_init( "aud_tank_toggle" );
    common_scripts\utility::flag_init( "aud_tank_toggle_2" );
    common_scripts\utility::flag_init( "aud_gaz_jump_stairs" );
    common_scripts\utility::flag_init( "aud_van_stairs_fall_01" );
    common_scripts\utility::flag_init( "aud_van_stairs_fall_02" );
    common_scripts\utility::flag_init( "aud_van_stairs_fall_03" );
    common_scripts\utility::flag_init( "aud_van_pre_tunnel" );
    common_scripts\utility::flag_init( "aud_van_over_ledge" );
    common_scripts\utility::flag_init( "aud_van_enter_tunnel" );
    common_scripts\utility::flag_init( "aud_van_tunnel_stairs_02" );
    common_scripts\utility::flag_init( "aud_van_tunnel_stairs_03" );
    level._id_16F5._id_447B = 0;
    var_0 = [ "aud_gaz_jump", "aud_van_down_big_stairs", "aud_van_to_canal", "aud_van_canal_part_2", "aud_van_entering_tunnel", "aud_van_tunnel_turn", "aud_van_exiting_tunnel", "aud_van_volk_rundown_pt1" ];
    _id_5043( var_0 );
    _id_447D();
    _id_447F();
    _id_4480();
    maps\_audio_mix_manager::_id_1517( "paris_level_global_mix" );
    maps\_audio::_id_178E( 0 );
    maps\_audio::_id_174C( ::_id_5027 );
}

_id_447C()
{
    maps\_audio_mix_manager::_id_1509( "paris_level_global_mix" );
    maps\_audio_mix_manager::_id_1509( "pars_intro_flight" );
    maps\_audio_mix_manager::_id_1509( "pars_rooftop" );
    maps\_audio_mix_manager::_id_1509( "pars_rooftop_interior" );
    maps\_audio_mix_manager::_id_1509( "pars_rooftop_blownout" );
    maps\_audio_mix_manager::_id_1509( "paris_window_break" );
    maps\_audio_mix_manager::_id_1509( "pars_street" );
    maps\_audio_mix_manager::_id_1509( "pars_restaurant_kitchen" );
    maps\_audio_mix_manager::_id_1509( "pars_plaza_battle" );
    maps\_audio_mix_manager::_id_1509( "pars_tank_escape" );
    maps\_audio_mix_manager::_id_1509( "tanks_attenuate_for_fire" );
    maps\_audio_mix_manager::_id_1509( "pars_ac130_street" );
    maps\_audio_mix_manager::_id_1509( "pars_no_ambdist_submix" );
    maps\_audio_mix_manager::_id_1509( "paris_antiaircraft_off" );
    maps\_audio_mix_manager::_id_1509( "paris_sewers" );
    maps\_audio_mix_manager::_id_1509( "paris_pre_catacombs" );
    maps\_audio_mix_manager::_id_1509( "paris_catacombs_main" );
    maps\_audio_mix_manager::_id_1509( "paris_metal_staircase" );
    maps\_audio_mix_manager::_id_1509( "paris_final_chase_street" );
    maps\_audio_mix_manager::_id_1509( "pars_gaz_barricade_explo" );
    maps\_audio_mix_manager::_id_1509( "pars_chase_tank" );
    maps\_audio_mix_manager::_id_1509( "paris_final_chase_canal" );
    maps\_audio_mix_manager::_id_1509( "pars_chase_hind" );
    maps\_audio_mix_manager::_id_1509( "pars_chase_hind_strafe" );
    maps\_audio_mix_manager::_id_1509( "pars_volk_crash" );
    maps\_audio_mix_manager::_id_1509( "pars_volk_foley" );
}

_id_447D()
{
    if ( maps\_audio::_id_17C4() )
        return;

    if ( getdvarint( "r_reflectionProbeGenerate" ) )
        return;

    var_0 = common_scripts\utility::get_template_level();

    if ( var_0 == "paris_a" || var_0 == "so_killspree_paris_a" )
    {
        thread _id_5048();
        thread _id_505B();
        thread _id_5049();
        thread _id_504B();
    }
    else if ( var_0 == "paris_b" )
    {
        thread _id_505A();
        thread _id_505F();
        thread _id_5061();
        thread _id_5062();
        thread _id_5063();
        thread _id_5064();
        thread _id_5065();
        thread _id_5066();
        thread _id_5067();
        thread _id_5068();
        thread _id_5069();
        thread _id_506A();
        thread _id_506B();
        thread _id_506F();
        thread _id_5070();
    }
    else if ( var_0 == "so_jeep_paris_b" )
        return;
}

_id_447F()
{
    level._id_16F5._id_440B["tanks_attenuate_for_fire"] = [ [ 0.0, 0.0 ], [ 0.082, 0.426 ], [ 0.238, 0.736 ], [ 0.408, 0.844 ], [ 0.756, 0.953 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["ac130_2d_attenuate"] = [ [ 0.0, 1.0 ], [ 0.2, 1.0 ], [ 0.4, 0.8 ], [ 0.6, 0.6 ], [ 0.8, 0.4 ], [ 1.0, 0.0 ] ];
    level._id_16F5._id_440B["aud_paris_sewers"] = [ [ 0.0, 0.0 ], [ 0.082, 0.426 ], [ 0.238, 0.736 ], [ 0.408, 0.844 ], [ 0.756, 0.953 ], [ 1.0, 1.0 ] ];
}

_id_4480()
{
    var_0 = [ [ "aud_sewer_river_progress_point", ::_id_5054 ], [ "aud_archfire_submix_progress", ::_id_5052 ] ];
    maps\_audio::_id_175D( var_0 );
}

_id_5027( var_0, var_1 )
{
    var_2 = 1;
    var_3 = 4.0;

    switch ( var_0 )
    {
        case "debug_start_rooftops":
            maps\_audio_zone_manager::_id_156C( "pars_rooftop_exterior" );
            thread _id_503A();
            break;
        case "debug_start_stairwell":
            maps\_audio_zone_manager::_id_156C( "pars_rooftop_apartment" );
            maps\_audio::aud_send_msg( "mus_pre_first_contact" );
            break;
        case "debug_start_restaurant_approach":
            maps\_audio_zone_manager::_id_156C( "pars_green_building_alley" );
            break;
        case "debug_start_ac_moment":
            maps\_audio_zone_manager::_id_156C( "pars_ac130_strobe_street" );
            maps\_audio::aud_send_msg( "mus_courtyard1_crossed" );
            break;
        case "debug_start_sewer_entrance":
            maps\_audio_zone_manager::_id_156C( "pars_ac130_strobe_street" );
            thread _id_5039();
            maps\_audio::aud_send_msg( "mus_courtyard_2_combat_finished" );
            break;
        case "debug_start_catacombs_start":
            maps\_audio_zone_manager::_id_156C( "paris_sewers_entrance" );
            thread _id_504A();
            maps\_audio::aud_send_msg( "mus_sewer1" );
            maps\_audio_mix_manager::_id_1517( "paris_antiaircraft_off" );
            break;
        case "debug_start_catacombs_skull_chamber":
            maps\_audio_zone_manager::_id_156C( "paris_catacombs_main" );
            maps\_audio::aud_send_msg( "mus_catacombs_entrance" );
            maps\_audio_mix_manager::_id_1517( "paris_antiaircraft_off" );
            break;
        case "debug_start_chase":
            maps\_audio_zone_manager::_id_156C( "paris_final_chase_street" );
            break;
        case "debug_start_chase_canal":
            maps\_audio::aud_send_msg( "mus_street_chase" );
            maps\_audio_zone_manager::_id_156C( "paris_final_chase_canal" );
            break;
        case "debug_start_chase_ending":
            maps\_audio::aud_send_msg( "mus_street_chase" );
            maps\_audio_zone_manager::_id_156C( "paris_final_chase_canal" );
            break;
        case "debug_start_protect":
            maps\_audio_zone_manager::_id_156C( "paris_streets" );
            break;
        case "enter_pars_rooftop":
            var_4 = var_1;
            break;
        case "exit_pars_rooftop":
            var_5 = var_1;
            break;
        case "enter_pars_rooftop_ledge":
            var_4 = var_1;
            break;
        case "exit_pars_rooftop_ledge":
            var_5 = var_1;
            break;
        case "enter_pars_rooftop_apartment":
            var_4 = var_1;
            break;
        case "exit_pars_rooftop_apartment":
            var_5 = var_1;
            break;
        case "enter_pars_rooftop_blownout":
            var_4 = var_1;
            break;
        case "exit_pars_rooftop_blownout":
            var_5 = var_1;
            break;
        case "enter_pars_rooftop_stairwell":
            var_4 = var_1;
            break;
        case "exit_pars_rooftop_stairwell":
            var_5 = var_1;
            break;
        case "enter_pars_green_building_street":
            var_4 = var_1;
            break;
        case "exit_pars_green_building_street":
            var_5 = var_1;
            break;
        case "enter_pars_green_building_interior":
            var_4 = var_1;
            break;
        case "exit_pars_green_building_interior":
            var_5 = var_1;
            break;
        case "enter_pars_green_building_alley":
            var_4 = var_1;
            break;
        case "exit_pars_green_building_alley":
            var_5 = var_1;
            break;
        case "enter_pars_restaurant_kitchen":
            var_4 = var_1;
            break;
        case "exit_pars_restaurant_kitchen":
            var_5 = var_1;
            break;
        case "enter_pars_restaurant_blownout":
            var_4 = var_1;
            break;
        case "exit_pars_restaurant_blownout":
            var_5 = var_1;
            break;
        case "enter_pars_restaurant_to_plaza":
            var_4 = var_1;
            break;
        case "exit_pars_restaurant_to_plaza":
            var_5 = var_1;
            break;
        case "enter_pars_plaza_deli":
            var_4 = var_1;
            break;
        case "exit_pars_plaza_deli":
            var_5 = var_1;
            break;
        case "enter_pars_plaza_coffee_shop":
            var_4 = var_1;
            break;
        case "exit_pars_plaza_coffee_shop":
            var_5 = var_1;
            break;
        case "enter_pars_plaza_bistro":
            var_4 = var_1;
            break;
        case "exit_pars_plaza_bistro":
            var_5 = var_1;
            break;
        case "enter_pars_tank_excape_building":
            var_4 = var_1;
            break;
        case "exit_pars_tank_excape_building":
            var_5 = var_1;
            break;
        case "enter_pars_ac130_strobe_street":
            var_4 = var_1;
            break;
        case "exit_pars_ac130_strobe_street":
            var_5 = var_1;
            maps\_audio_mix_manager::_id_151C( "archfire_submix" );
            break;
        case "enter_pars_strobe_street_library":
            var_4 = var_1;
            break;
        case "exit_pars_strobe_street_library":
            var_5 = var_1;
            break;
        case "enter_pars_downed_heli_store":
            var_4 = var_1;
            break;
        case "exit_pars_downed_heli_store":
            var_5 = var_1;
            break;
        case "enter_streets_sewers_entrance":
            var_4 = var_1;

            if ( var_4 == "paris_streets" )
            {

            }

            break;
        case "exit_streets_sewers_entrance":
            break;
        case "progress_streets_sewers_entrance":
            var_6 = var_1;
            break;
        case "enter_sewers_entrance_sewers_stairwell":
            var_4 = var_1;
            break;
        case "exit_sewers_entrance_sewers_stairwell":
            var_5 = var_1;
            break;
        case "progress_sewers_entrance_sewers_stairwell":
            var_6 = var_1;
            break;
        case "enter_sewers_stairwell_sewers":
            var_4 = var_1;

            if ( var_4 == "paris_sewers_stairwell" )
            {
                if ( !isdefined( level._id_16F5._id_5028 ) )
                {
                    maps\_audio_dynamic_ambi::_id_149F( "pars_sewer_pipe_stress", ( 328.0, -377.0, 240.0 ) );
                    thread _id_5073();
                    level._id_16F5._id_5028 = 1;
                }
            }

            break;
        case "exit_sewers_stairwell_sewers":
            var_5 = var_1;
            break;
        case "progress_sewers_stairwell_sewers":
            var_6 = var_1;
            break;
        case "enter_sewers_pre_catacombs":
            var_4 = var_1;

            if ( var_4 == "paris_sewers" )
                maps\_audio::aud_send_msg( "mus_catacombs_entrance" );

            break;
        case "exit_sewers_pre_catacombs":
            var_5 = var_1;
            break;
        case "progress_sewers_pre_catacombs":
            var_6 = var_1;
            break;
        case "enter_pre_catacombs_catacombs_main":
            var_4 = var_1;
            break;
        case "exit_pre_catacombs_catacombs_main":
            var_5 = var_1;

            if ( var_5 == "paris_catacombs_main" )
            {

            }

            break;
        case "progress_pre_catacombs_catacombs_main":
            var_6 = var_1;
            break;
        case "enter_catacombs_main_infrastructure":
            maps\_audio_mix_manager::_id_1517( "paris_metal_staircase", 1 );
            var_4 = var_1;

            if ( var_4 == "paris_catacombs_main" )
            {
                if ( !isdefined( level._id_16F5._id_5029 ) )
                {
                    wait 0.5;
                    level._id_16F5._id_5029 = 1;
                    level.player playsound( "pars_metal_stairs_clangs_1" );
                    wait 3;
                    level.player playsound( "pars_metal_stairs_clangs_2" );
                }
            }

            break;
        case "exit_catacombs_main_infrastructure":
            maps\_audio_mix_manager::_id_1520( "paris_metal_staircase", 2 );
            var_5 = var_1;
            break;
        case "enter_paris_infrastructure_exit_lobby":
            var_4 = var_1;
            break;
        case "exit_paris_infrastructure_exit_lobby":
            var_5 = var_1;
            break;
        case "enter_paris_final_chase_street":
            var_4 = var_1;
            break;
        case "exit_paris_final_chase_street":
            var_5 = var_1;
            break;
        case "progress_catacombs_main_infrastructure":
            var_6 = var_1;
            break;
        case "aud_paris_intro_heli_exit":
            var_7 = var_1;
            thread _id_503B( var_7 );
            break;
        case "fx_skybox_hind":
            _id_502F( var_1 );
            break;
        case "fx_skybox_mig":
            _id_5033( var_1 );
            break;
        case "fx_paratrooper_jet":
            thread _id_5036( var_1 );
            break;
        case "pars_missile_launch":
            var_8 = var_1[0];
            thread maps\_audio::_id_15D7( "dist_missile_travel", var_8, "oneshot" );
            break;
        case "pars_missile_explode":
            var_9 = var_1[0];
            thread common_scripts\utility::play_sound_in_space( "nymn_explosion_mortar_distant", var_9 );
            break;
        case "msg_audio_fx_bombshake":
            if ( level._id_16F5._id_447B )
            {
                var_10 = 3.0;
                var_11 = 0.3;
                var_12 = 2.0;
                maps\_audio::_id_17A7( "sewer_bomb_submix", var_10, var_11, var_12 );
            }

            thread common_scripts\utility::play_sound_in_space( "sewer_bombs", level.player.origin );
            break;
        case "aud_manual_bombshake_triggered":
            wait 0.35;
            common_scripts\utility::play_sound_in_space( "paris_picture_fall", ( 7670.0, 2675.0, 1350.0 ) );
            break;
        case "debris_push_animation":
            wait 10.2;
            common_scripts\utility::play_sound_in_space( "paris_debrispush_crash", ( 7441.0, 2173.0, 996.0 ) );
            break;
        case "start_ledge_footstep":
            level.player playsound( "paris_ledge_debris" );
            level.player playsound( "step_run_plr_concrete" );
            level.player playsound( "gear_rattle_plr_walk" );
            break;
        case "jets_flyby_01":
            var_13 = var_1;
            var_13[0] vehicle_turnengineoff();
            thread maps\_audio_vehicles::_id_163C( var_13[0], "pars_mig_flyby_01", 10000 );
            break;
        case "jets_flyby_02":
            var_13 = var_1;
            var_13[0] vehicle_turnengineoff();
            break;
        case "bookstore_spray_moment":
            maps\_audio_mix_manager::_id_1517( "paris_window_break" );
            wait 3;
            maps\_audio_mix_manager::_id_1520( "paris_window_break", 2 );
            break;
        case "tank_battalion_bookstore":
            var_14 = var_1;
            _id_503D( var_14 );
            break;
        case "jet_flyby_back_alley":
            var_15 = var_1[0];

            if ( isdefined( var_1[0] ) )
            {
                var_16 = maps\_audio::_id_15D7( "pars_jet_flyover_city_long", level.player );
                wait 3.25;
                var_17 = maps\_audio::_id_15D7( "paris_f15_flyby_1", level.player );
                var_18 = maps\_audio::_id_15D7( "pars_jet_flyover_city", level.player );
                wait 1.5;
                var_19 = [ var_17, var_18 ];

                foreach ( var_21 in var_19 )
                    var_21 scalevolume( 0, 4 );
            }

            break;
        case "courtyard_tanks":
            var_14 = var_1;
            _id_503C( var_14 );
            break;
        case "ac130_prepare_inc":
            level._id_16F5._id_502A = 1;
            break;
        case "aud_ac130_bullet":
            thread _id_5042( var_1 );
            break;
        case "msg_audio_fx_ambientExp":
            var_23 = var_1;

            if ( isdefined( var_23 ) )
            {
                var_24 = distance( level.player.origin, var_23 );
                common_scripts\utility::play_sound_in_space( "explo_ambient_building", var_23 );
            }

            break;
        case "ac130_moment_complete":
            common_scripts\utility::flag_set( "aud_ac130_moment_complete" );
            break;
        case "mi17_courtyard_02_start":
            var_25 = var_1;

            if ( isdefined( var_25 ) )
            {
                common_scripts\utility::flag_set( "mi17_courtyard_flyby" );
                var_25 vehicle_turnengineoff();
                wait 0.5;
                maps\_audio::_id_15D7( "pars_heli_by_overhead", var_25 );
                var_25 thread _id_504C();
            }

            break;
        case "courtyard_2_combat_finished":
            thread _id_5039();
            maps\_audio::aud_send_msg( "mus_courtyard_2_combat_finished" );
            break;
        case "aud_btr_courtyard_start":
            var_26 = var_1;

            if ( isdefined( var_26 ) )
            {
                var_26 vehicle_turnengineoff();
                var_26 thread maps\_audio_vehicles::_id_1623( "pars_btr_engine_low_lp", "pars_btr_roll_lp", "pars_btr_idle_lp", "pars_btr_rev", "pars_btr_breaks" );
            }

            break;
        case "volk_escape":
            var_27 = var_1;
            var_27 waittillmatch( "vehicle_scripted_animation", "aud_volk_escape" );
            var_28 = "pars_volk_peel_out_L";
            var_29 = "pars_volk_peel_out_R";
            var_30 = ( -3880.0, -817.0, 896.0 );
            var_31 = ( -3930.0, -205.0, 902.0 );
            _id_5040( var_28, var_29, var_30, var_31 );
            break;
        case "mi17_01_escape_ambient":
            var_13 = var_1;
            var_13[0] vehicle_turnengineoff();
            var_32 = spawn( "script_origin", ( -3791.0, -1476.0, 1615.0 ) );
            var_33 = spawn( "script_origin", ( -3734.0, -451.0, 1615.0 ) );
            var_32 playsound( "pars_mi17_chase_L", "sounddone_L" );
            var_33 playsound( "pars_mi17_chase_R", "sounddone_R" );
            var_32 waittill( "sounddone_L" );
            var_32 delete();
            var_33 waittill( "sounddone_R" );
            var_33 delete();
            break;
        case "mi17_02_escape_ambient":
            var_13 = var_1;
            var_13[0] vehicle_turnengineoff();
            break;
        case "mi17_03_escape_ambient":
            var_13 = var_1;
            var_13[0] vehicle_turnengineoff();
            break;
        case "mi17_01_escape":
            var_13 = var_1;
            var_13[0] vehicle_turnengineoff();
            var_13[0] thread _id_504C();
            break;
        case "delta_pull_movemanhole":
            break;
        case "enter_sewers_stairwell":
            maps\_audio::aud_send_msg( "mus_sewer_stairs" );
            break;
        case "catacombs_bomb_1":
            level.player playsound( "sewer_bombs" );
            maps\_audio::_id_1794( "pars_bomb_shake_extender" );
            wait 0.35;
            maps\_audio::_id_1794( "pars_bomb_shake_extender_small_02" );
            wait 0.4;
            maps\_audio::_id_1794( "pars_bomb_shake_extender_small_03" );
            break;
        case "catacombs_bomb_2":
            level.player playsound( "sewer_bombs" );
            maps\_audio::_id_1794( "pars_bomb_shake_extender" );
            wait 0.4;
            maps\_audio::_id_1794( "pars_bomb_shake_extender_small_01" );
            wait 0.4;
            maps\_audio::_id_1794( "pars_bomb_shake_extender_small_02" );
            break;
        case "catacombs_bomb_3":
            level.player playsound( "sewer_bombs" );
            maps\_audio::_id_1794( "pars_bomb_shake_extender" );
            wait 0.5;
            maps\_audio::_id_1794( "pars_bomb_shake_extender_small_04" );
            break;
        case "catacombs_pipe_burst_bomb_shake":
            _id_506D();
            break;
        case "catacombs_pipe_burst":
            thread _id_505C();
            thread maps\_audio_dynamic_ambi::_id_14A9( "pars_sewer_pipe_stress", 0.2 );
            level._id_16F5._id_502B = 1;
            var_34 = spawn( "script_origin", ( 325.0, -416.0, 185.0 ) );
            thread _id_5058( var_34 );
            wait 2.5;
            var_12 = 1.1;

            if ( level._id_16F5._id_502B )
            {
                var_34 scalevolume( 0.0, var_12 );
                var_34 waittill( "sounddone" );
            }

            var_34 delete();
            maps\_audio::aud_send_msg( "mus_sewer2" );
            break;
        case "aud_prime_catacombs_squeeze":
            level.player maps\_audio::_id_170B( "pars_se_catacombsqueeze" );
            break;
        case "aud_start_catacombs_squeeze":
            level.player playsound( "pars_se_catacombsqueeze" );
            break;
        case "road_flare_start":
            var_35 = var_1;
            wait 0.7;
            var_35 playsound( "road_flare_start" );
            break;
        case "road_flare_lp":
            var_36 = var_1;
            var_36 playloopsound( "road_flare_lp" );
            break;
        case "shadow_gag_main_room":
            break;
        case "enemy_gate_gag":
            var_37 = var_1;
            var_37 playsound( "catacombs_kick_gag_v2" );
            maps\_audio::aud_send_msg( "mus_enemy_gate_gag" );
            break;
        case "scripted_flashbang":
            var_38 = var_1;
            thread common_scripts\utility::play_sound_in_space( "flashbang_explode_default", var_38 );
            maps\_audio::aud_send_msg( "mus_flashbang" );
            break;
        case "heli_crash":
            break;
        case "bomb_truck_start":
            maps\_audio::aud_send_msg( "mus_street_chase" );
            maps\_audio_zone_manager::_id_156C( "paris_streets_escape" );
            maps\_audio_mix_manager::_id_1517( "paris_antiaircraft_off", 3.0 );
            maps\_audio_mix_manager::_id_1517( "pars_gaz_barricade_explo", 2.0 );
            thread _id_5041( var_1 );
            break;
        case "aud_rpg_3d_short":
            var_39 = var_1[0];
            var_40 = var_1[1];
            var_41 = var_1[2];
            var_39 playsound( "pars_3d_rpg_L" );
            break;
        case "aud_rpg_3d":
            var_39 = var_1[0];
            var_40 = var_1[1];
            var_41 = var_1[2];
            thread common_scripts\utility::play_sound_in_space( "pars_3d_rpg_L", var_40 );
            thread common_scripts\utility::play_sound_in_space( "pars_3d_rpg_R", var_41 );
            break;
        case "aud_rpg_2d":
            thread maps\_audio::_id_1794( "pars_2d_rpg" );
            break;
        case "aud_rpg":
            var_39 = var_1[0];
            var_40 = var_1[1];
            var_41 = var_1[2];
            break;
        case "gaz_death":
            var_1 thread _id_5060();
            break;
        case "pars_chase_tank_start":
            wait 1.4;
            maps\_audio::_id_1794( "pars_chase_tank_move" );
            maps\_audio_mix_manager::_id_1517( "pars_chase_tank", 2 );
            maps\_audio_mix_manager::_id_1520( "pars_gaz_barricade_explo", 2 );
            break;
        case "pars_chase_tank_smash":
            maps\_audio::_id_1794( "pars_chase_tank_smash" );
            wait 1.2;
            maps\_audio::_id_1794( "pars_chase_tank_turret" );
            break;
        case "pars_chase_tank_shoot_01":
            maps\_audio::_id_1794( "pars_chase_tank_shoot_01" );
            wait 0.3;
            maps\_audio::_id_1794( "chase_tank_shell_impact" );
            wait 2.5;
            maps\_audio::_id_1794( "chase_tank_building_debris" );
            break;
        case "van_storefront_destroy_glass":
            thread common_scripts\utility::play_sound_in_space( "glass_pane_shatter", var_1 );
            break;
        case "pars_chase_tank_shoot_02":
            maps\_audio::_id_1794( "pars_chase_tank_shoot_02" );
            break;
        case "pars_chase_tank_impact_02":
            maps\_audio::_id_1794( "chase_tank_shell_explode" );
            wait 0.5;
            maps\_audio::_id_1794( "chase_tank_building_debris" );
            wait 2.5;
            maps\_audio::_id_1794( "pars_van_engine_seq_02" );
            maps\_audio_mix_manager::_id_1520( "pars_chase_tank", 1 );
            break;
        case "chase_uaz_01":
            break;
        case "chase_gaz_02":
            var_42 = var_1;
            var_42 playsound( "gaz_tire_slide" );
            break;
        case "van_slam_storefront_01":
            maps\_audio::_id_1794( "pars_storefront_impact" );
            maps\_audio::_id_1794( "pars_van_tunnel_body_hit" );
            maps\_audio::_id_1794( "exp_van_impacts_storefront" );
            break;
        case "paris_b_chase_hind_spawn":
            var_43 = var_1;

            if ( isdefined( var_43 ) )
                thread _id_506E( var_43 );

            break;
        case "chase_hind_fire":
            var_43 = var_1;

            if ( isdefined( var_43 ) )
                thread _id_0023( var_43 );

            break;
        case "chase_hind_bullet_impact":
            var_44 = var_1;

            if ( isdefined( var_44 ) )
            {
                if ( randomint( 5 ) > 2 )
                    thread _id_0024( var_44 );
            }

            break;
        case "player_shot_sedan_ending":
            level.player playsound( "volk_crash_tire_blowout" );
            var_45 = var_1;

            if ( isdefined( var_45 ) )
            {
                var_46 = spawn( "script_origin", var_45.origin );
                var_46 linkto( var_45 );
                var_46 playsound( "volk_crash_tire_grind", "sounddone" );
                common_scripts\utility::flag_wait( "flag_final_crash_wall_impact_1" );
                var_46 scalevolume( 0.0, 0.1 );
                wait 0.2;
                var_46 stopsounds();
                var_46 delete();
            }

            break;
        case "pars_volk_escape_failstate":
            maps\_audio::_id_1794( "pars_volk_escape_failstate" );
            break;
        case "start_engine_02":
            var_47 = spawn( "script_origin", level.player.origin );
            var_47 playsound( "pars_van_engine_seq_02" );
            common_scripts\utility::flag_wait( "aud_van_down_big_stairs" );
            var_47 scalevolume( 0.0, 0.5 );
            wait 0.3;
            var_47 stopsounds();
            var_47 delete();
            break;
        case "start_engine_03":
            break;
        case "player_to_front_of_truck":
            break;
        case "gallery_gate_crash_exit":
            thread common_scripts\utility::play_sound_in_space( "pars_van_gate_impact", level.player.origin );
            thread common_scripts\utility::play_sound_in_space( "gaz_explode_crunch", level.player.origin );
            break;
        case "uaz_jump_bridge":
            var_42 = var_1;
            maps\_audio::_id_1794( "pars_van_engine_seq_04" );
            break;
        case "meet_gign":
            break;
        case "aud_flashlight_on":
            break;
        case "aud_player_exits_bomb_truck":
            common_scripts\utility::flag_set( "aud_player_exits_bomb_truck" );
            break;
        case "mus_post_intro":
            maps\_audio_music::_id_15A7( "pars_post_intro", 10 );
            break;
        case "mus_ledge_walk":
            break;
        case "mus_pre_first_contact":
            maps\_audio_music::_id_15A7( "pars_pre_first_contact", var_3 );
            break;
        case "mus_first_contact":
            wait 1;
            maps\_audio_music::_id_15A7( "pars_first_contact", 0.25 );
            break;
        case "mus_enter_book_store":
            break;
        case "mus_bookstore_clear":
            if ( !isdefined( level._id_16F5._id_502C ) )
            {
                level._id_16F5._id_502C = 1;
                maps\_audio_music::_id_15A7( "pars_enter_book_store_done", 8 );
            }

            break;
        case "mus_reached_gign":
            break;
        case "mus_follow_gign":
            maps\_audio_music::_id_15A7( "pars_follow_gign", var_3 );
            break;
        case "mus_cross_courtyard1":
            maps\_audio::_id_17A2( 1.5, 0 );
            maps\_audio_music::_id_15A7( "pars_cross_courtyard1", var_3 );
            break;
        case "mus_courtyard1_crossed":
            var_48 = 10;
            maps\_audio_music::_id_15A7( "pars_courtyard1_crossed", var_48 );
            wait(var_48);
            maps\_audio_music::_id_15A8( var_48 );
            break;
        case "mus_ac130_replies":
            if ( !isdefined( level._id_16F5._id_502D ) )
                maps\_audio_music::_id_15A7( "pars_ac130_music", 8 );

            break;
        case "mus_cross_courtyard2":
            if ( !isdefined( level._id_16F5._id_502D ) )
            {
                level._id_16F5._id_502D = 1;
                maps\_audio_music::_id_15A7( "pars_cross_courtyard2", var_3 );
            }

            break;
        case "mus_btr_destroyed":
            break;
        case "mus_courtyard_2_combat_finished":
            if ( !isdefined( level._id_16F5._id_502E ) )
            {
                level._id_16F5._id_502D = 1;
                maps\_audio_music::_id_15A7( "pars_cross_courtyard2_ending", 1.25 );
                wait 5;
                maps\_audio_music::_id_15A7( "pars_to_the_sewers", 0.5 );
                wait 4;
                maps\_audio_music::_id_15A8( 50 );
            }

            break;
        case "mus_sewer1":
            maps\_audio_music::_id_15A7( "pars_sewer1", var_3 );
            break;
        case "mus_sewer_stairs":
            break;
        case "mus_sewer2":
            break;
        case "mus_catacombs_entrance":
            maps\_audio_music::_id_15A7( "pars_catacombs_entrance", var_3 );
            break;
        case "mus_catacombs_ambush":
            maps\_audio_music::_id_15A8( 2 );
            wait 1.0;
            maps\_audio_music::_id_15A7( "pars_catacombs_chase_intro", 0, 3 );
            maps\_audio::_id_17A2( 100, 0 );
            break;
        case "mus_flashbang":
            break;
        case "mus_catacombs_chase":
            maps\_audio::_id_17A2( 1, 0 );
            maps\_audio_music::_id_15A7( "pars_catacombs_chase", 0, 6 );
            break;
        case "mus_catacombs_chase_end":
            maps\_audio_music::_id_15A7( "pars_catacombs_chase_end", 3, 5 );
            break;
        case "mus_street_chase":
            maps\_audio::_id_17A2( 100, 0 );
            maps\_audio_music::_id_15A7( "pars_street_chase", 0, 1 );
            break;
        case "mus_street_chase_end":
            maps\_audio_music::_id_15A7( "pars_outro", 0, 3 );
            wait 4;
            maps\_audio::_id_17A2( 0.5, 15 );
            wait 7.5;
            maps\_audio::_id_17A2( 0, 30 );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_502F( var_0 )
{
    if ( common_scripts\utility::flag( "aud_intro_heli_exit" ) )
    {
        var_1 = var_0[0];
        var_2 = var_0[1];
        var_3 = var_0[2];
        var_4 = distance( var_1, level.player.origin );

        if ( var_4 < 20000 )
        {
            if ( !isdefined( level._id_16F5._id_5030 ) )
                level._id_16F5._id_5030 = 0;

            if ( level._id_16F5._id_5030 < 10 )
            {
                level._id_16F5._id_5030++;
                thread _id_5031( var_1, var_2, var_3 );
                _id_5032( var_1, var_2, var_3 );
                level._id_16F5._id_5030--;
            }
        }
    }
}

_id_5031( var_0, var_1, var_2 )
{
    wait 4;
    var_3 = spawn( "script_origin", var_0 );
    var_3 playsound( "vfx_dist_heli", "sounddone" );
    var_3 moveto( var_1, var_2 );
    var_3 waittill( "sounddone" );
    var_3 delete();
}

_id_5032( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_0 );
    var_3 playloopsound( "vfx_dist_heli_lp" );
    var_3 moveto( var_1, var_2 );
    wait(var_2);
    var_3 delete();
}

_id_5033( var_0 )
{
    if ( common_scripts\utility::flag( "aud_intro_heli_exit" ) )
    {
        var_1 = var_0[0];
        var_2 = var_0[1];
        var_3 = var_0[2];

        if ( !isdefined( level._id_16F5._id_5034 ) )
            level._id_16F5._id_5034 = 0;

        if ( level._id_16F5._id_5034 < 10 )
        {
            level._id_16F5._id_5034++;
            var_4 = spawn( "script_origin", var_1 );
            var_4 playsound( "vfx_dist_jet", "sounddone" );
            var_4 moveto( var_2, var_3 );
            var_4 waittill( "sounddone" );
            var_4 scalevolume( 0.0, 0.5 );
            wait 0.5;
            var_4 delete();
            level._id_16F5._id_5034--;
        }
    }
}

_id_5035( var_0, var_1, var_2 )
{
    level endon( "aud_kill_vfx_dist_jet" );
    var_0 playsound( "vfx_dist_jet", "sounddone" );
    var_0 moveto( var_1, var_2 );
    var_0 waittill( "sounddone" );
}

_id_5036( var_0 )
{
    if ( 1 )
    {
        var_1 = var_0[0];
        var_2 = var_0[1];
        var_3 = var_0[2];

        if ( !isdefined( level._id_16F5._id_5037 ) )
        {
            level._id_16F5._id_5037 = [];

            for ( var_4 = 0; var_4 < 3; var_4++ )
                level._id_16F5._id_5037[var_4] = spawnstruct();

            level._id_16F5._id_5038 = 0;
        }

        wait 8;
        var_4 = level._id_16F5._id_5038;

        if ( isdefined( level._id_16F5._id_5037[var_4]._id_14B9 ) )
        {
            var_5 = level._id_16F5._id_5037[var_4]._id_14B9;
            level._id_16F5._id_5037[var_4]._id_14B9 = undefined;
            maps\_audio::_id_15F3( var_5, 3.0 );
        }

        var_6 = spawn( "script_origin", var_1 );
        var_6 playsound( "vfx_dist_paratrooper_jet" );
        var_6 moveto( var_2, var_3 );
        level._id_16F5._id_5037[var_4]._id_14B9 = var_6;
        level._id_16F5._id_5038 = ( level._id_16F5._id_5038 + 1 ) % 3;
    }
}

_id_5039()
{
    wait 1;
    maps\_audio_zone_manager::_id_1572( "pars_ac130_strobe_street", "none" );
    maps\_audio_zone_manager::_id_1572( "pars_strobe_street_library", "none" );
    maps\_audio_zone_manager::_id_1572( "pars_downed_heli_store", "none" );
    maps\_audio_dynamic_ambi::_id_14A6();
}

_id_503A()
{
    thread maps\_audio_mix_manager::_id_1517( "pars_intro_flight", 0.05 );
    thread maps\_audio_mix_manager::_id_1517( "pars_intro_skybattle", 0.05 );
    maps\_audio::_id_1794( "paris_intro_flight_music" );
    maps\_audio::_id_1795( "paris_intro_flight_sfx", 10.5 );
    maps\_audio::_id_1795( "paris_intro_flight_paper", 19 );
}

_id_503B( var_0 )
{
    common_scripts\utility::flag_set( "aud_intro_heli_exit" );
    wait 1.5;
    var_0 thread maps\_utility::play_sound_on_entity( "paris_intro_heli_exit" );
    thread maps\_audio_mix_manager::_id_1520( "pars_intro_skybattle", 10.0 );
    wait 10.0;
    thread maps\_audio_mix_manager::_id_1520( "pars_intro_flight", 6.0 );
    wait 3;
    maps\_audio::aud_send_msg( "mus_post_intro" );
}

_id_503C( var_0 )
{
    var_1 = var_0;
    var_2 = 1;
    var_1[0] vehicle_turnengineoff();
    var_1[1] vehicle_turnengineoff();
    var_1[1] playloopsound( "tank_treads_lp" );
    var_3 = ( 5687.0, -1089.0, 1152.0 );
    var_4 = ( 4843.0, -1972.0, 1080.0 );

    if ( common_scripts\utility::flag( "aud_tank_toggle_2" ) )
    {
        var_2 = 1;
        var_5 = maps\_audio_zone_manager::_id_1578();
        var_6 = "tank_by_long_L_01";
        var_7 = "tank_by_long_R_01";
        common_scripts\utility::flag_clear( "aud_tank_toggle_2" );
        wait 0.5;
        _id_5040( var_6, var_7, var_3, var_4, var_2 );
    }
    else if ( !common_scripts\utility::flag( "aud_tank_toggle_2" ) )
    {
        var_6 = "tank_by_long_L_02";
        var_7 = "tank_by_long_R_02";
        common_scripts\utility::flag_set( "aud_tank_toggle_2" );
        wait 0.5;
        _id_5040( var_6, var_7, var_3, var_4, var_2 );
    }
}

_id_503D( var_0 )
{
    var_1 = var_0;
    var_2 = 1;
    var_1[0] vehicle_turnengineoff();
    var_1[1] vehicle_turnengineoff();
    var_3 = ( 3626.0, 2841.0, 962.0 );
    var_4 = ( 3980.0, 3077.0, 962.0 );

    if ( common_scripts\utility::flag( "aud_tank_toggle" ) )
    {
        var_2 = 1;
        var_5 = maps\_audio_zone_manager::_id_1578();

        if ( var_5 == "pars_green_building_alley" )
            var_2 = 0.3;

        var_6 = "tank_by_short_L_01";
        var_7 = "tank_by_short_R_01";
        common_scripts\utility::flag_clear( "aud_tank_toggle" );
        _id_5040( var_6, var_7, var_3, var_4, var_2 );
    }
    else if ( !common_scripts\utility::flag( "aud_tank_toggle" ) )
    {
        var_6 = "tank_by_short_L_02";
        var_7 = "tank_by_short_R_02";
        common_scripts\utility::flag_set( "aud_tank_toggle" );
        _id_5040( var_6, var_7, var_3, var_4, var_2 );
    }
}

_id_503E( var_0 )
{
    var_1 = var_0;
    var_1 _id_503F();
}

_id_503F()
{
    self vehicle_turnengineoff();
    self playloopsound( "veh_btr_roll_lp" );
    self playloopsound( "veh_btr_idle_lp" );
}

_id_5040( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawn( "script_origin", var_2 );
    var_6 = spawn( "script_origin", var_3 );
    var_5 playsound( var_0, "sounddone" );
    var_6 playsound( var_1, "sounddone" );

    if ( isdefined( var_4 ) )
    {
        var_7 = var_4;
        var_5 scalevolume( var_7 );
        var_6 scalevolume( var_7 );
    }

    thread maps\_audio::_id_1783( var_5 );
    thread maps\_audio::_id_1783( var_6 );
}

_id_44CA( var_0, var_1, var_2 )
{
    var_3 = getent( var_1, "targetname" );

    if ( isdefined( var_3 ) )
    {
        var_3 playloopsound( var_2 );
        maps\_utility::_id_262C( var_0 );
        var_3 stoploopsound();
    }
}

_id_5041( var_0 )
{
    maps\_audio::_id_1794( "pars_van_engine_seq_01" );
    var_1 = var_0;
    self endon( "aud_player_exits_bomb_truck" );
    var_2 = spawn( "script_origin", level.player.origin );

    for (;;)
    {
        var_3 = var_1 vehicle_getspeed();
        var_4 = var_1 vehicle_getbodyvelocity();
        var_2 linkto( var_1 );
        var_5 = var_4[1];
        var_6 = var_4[2];

        if ( var_3 > 20 )
        {
            if ( var_5 < -150.0 )
            {
                var_7 = "ar_van_skid_hard_left";
                var_2 _id_5051( var_7 );
                wait 0.5;
            }
            else if ( var_5 > 150.0 )
            {
                var_7 = "ar_van_skid_hard_right";
                var_2 _id_5051( var_7 );
                wait 0.5;
            }
        }
        else if ( var_3 > 10 )
        {
            if ( var_5 < -95.0 )
            {
                var_7 = "ar_van_skid_hard_left";
                var_2 _id_5051( var_7 );
            }
            else if ( var_5 > 95.0 )
            {
                var_7 = "ar_van_skid_hard_right";
                var_2 _id_5051( var_7 );
            }
        }

        wait 0.5;
    }
}

_id_5042( var_0 )
{
    if ( isdefined( var_0._id_3EAB ) )
    {
        var_1 = var_0._id_3EAB;
        var_2 = var_0._id_3EA9;
        var_3 = 10000;
        var_4 = "ac130_magicbullet_short";
        var_5 = 5000;

        if ( level._id_16F5._id_502A )
        {
            level._id_16F5._id_502A = 0;
            var_3 = 10000;
            var_5 = 4500;
            var_4 = "ac130_magicbullet_long";
        }

        for (;;)
        {
            if ( isdefined( var_1 ) )
            {
                var_6 = distance( var_1.origin, var_2 );
                var_7 = distance2d( var_2, level.player.origin );

                if ( var_6 < var_3 )
                {
                    var_8 = maps\_audio::_id_178A( var_7, 0, var_5, level._id_16F5._id_440B["ac130_2d_attenuate"] );
                    var_9 = spawn( "script_origin", var_1.origin );
                    var_9 linkto( var_1 );
                    var_9 playsound( var_4 );
                    var_9 scalevolume( var_8 );
                    var_1 waittill( "death" );
                    var_10 = var_9.origin;
                    thread _id_5045( var_10 );
                    thread _id_5046( var_10 );
                    var_9 stopsounds();
                    wait 0.05;
                    var_9 delete();
                    return;
                }
                else
                    wait 0.05;

                continue;
            }

            return;
        }
    }
}

_id_5043( var_0 )
{
    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_init( var_2 );
}

_id_5044( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    level.player playsound( var_0 );
}

_id_5045( var_0 )
{
    var_1 = distance2d( var_0, level.player.origin );
    var_2 = spawn( "script_origin", var_0 );
    var_3 = "alias";
    var_4 = 3000;
    var_5 = 1000;
    thread common_scripts\utility::play_sound_in_space( "ac130_dist_exp_3d", var_0 );

    if ( var_1 < var_4 )
    {
        var_6 = maps\_audio::_id_178A( var_1, 500, 3000, level._id_16F5._id_440B["ac130_2d_attenuate"] );
        var_2 playsound( "ac130_main_impact_2d" );
        var_2 playsound( "ac130_layer_2d", "sounddone" );
        var_2 scalevolume( var_6 );
    }
}

_id_5046( var_0 )
{
    if ( isdefined( level._id_16F5._id_5047 ) )
    {
        level._id_16F5._id_5047 stopsounds();
        wait 0.05;

        if ( isdefined( level._id_16F5._id_5047 ) )
            level._id_16F5._id_5047 delete();
    }

    wait 0.05;
    level._id_16F5._id_5047 = spawn( "script_origin", var_0 );
    level._id_16F5._id_5047 playsound( "ac130_debris_lyr_2", "sounddone" );
    level._id_16F5._id_5047 waittill( "sounddone" );

    if ( isdefined( level._id_16F5._id_5047 ) )
        level._id_16F5._id_5047 delete();
}

_id_5048()
{
    common_scripts\utility::play_loopsound_in_space( "ceramic_wind_chimes", ( 8173.0, 3151.0, 1441.0 ) );
    common_scripts\utility::play_loopsound_in_space( "smoldering_wreckage", ( 7684.0, 2490.0, 1413.0 ) );
    common_scripts\utility::play_loopsound_in_space( "smoldering_wreckage", ( 7136.0, 2351.0, 1388.0 ) );
    common_scripts\utility::play_loopsound_in_space( "smoldering_wreckage", ( 6991.0, 2291.0, 1375.0 ) );
    common_scripts\utility::play_loopsound_in_space( "smoldering_wreckage", ( 6116.0, 1396.0, 1119.0 ) );
    common_scripts\utility::play_loopsound_in_space( "emt_doorway_drips_02", ( 6700.0, 2407.0, 1420.0 ) );
    common_scripts\utility::play_loopsound_in_space( "paris_stove_pots", ( 3432.0, 286.0, 941.0 ) );
    common_scripts\utility::play_loopsound_in_space( "paris_stove_pots", ( 3378.0, 300.0, 941.0 ) );
    common_scripts\utility::play_loopsound_in_space( "paris_stove_pots", ( 3431.0, 256.0, 941.0 ) );
    common_scripts\utility::play_loopsound_in_space( "paris_stove_pots", ( 3378.0, 300.0, 941.0 ) );
    common_scripts\utility::play_loopsound_in_space( "paris_stove_pots", ( 3401.0, 124.0, 941.0 ) );
    common_scripts\utility::play_loopsound_in_space( "paris_stove_pots", ( 3363.0, 130.0, 941.0 ) );
}

_id_5049()
{
    thread _id_44CA( "trigger_paris_tv_02", "trigger_paris_tv_02_origin", "emt_tv_static_lp_paris" );
}

_id_504A()
{
    common_scripts\utility::play_loopsound_in_space( "pars_sewer_entrance_tube", ( 990.0, 347.0, 583.0 ) );
    common_scripts\utility::play_loopsound_in_space( "sewer_wind_st_lp", ( 271.0, 326.0, 514.0 ) );
    common_scripts\utility::play_loopsound_in_space( "sewer_wind_st_lp", ( 1421.0, 345.0, 564.0 ) );
    common_scripts\utility::play_loopsound_in_space( "sewer_wind_st_lp", ( 432.0, -1140.0, 109.0 ) );
}

_id_504B()
{
    common_scripts\utility::flag_wait( "aud_ac130_moment_complete" );
    var_0 = maps\_audio::_id_15D7( "pars_heli_circle_overhead", level.player, "loop", "aud_kill_heli_circle_loop" );
    var_0 scalevolume( 0.0 );
    wait 0.05;
    var_0 scalevolume( 1, 3 );
    common_scripts\utility::flag_wait( "mi17_courtyard_flyby" );
    wait 1;
    var_0 scalevolume( 0.0, 3 );
    wait 3.5;
    level notify( "aud_kill_heli_circle_loop" );
}

_id_504C()
{
    if ( isdefined( self ) )
    {
        var_0 = spawn( "script_origin", self.origin );
        var_0 linkto( self );
        maps\_audio::_id_1788( var_0, "pars_heli_blades_loop", 1.0, 5, 1 );
        thread _id_504E( var_0 );
        self waittill( "unloaded" );
        thread maps\_audio::_id_15D7( "pars_heli_take_off_fly_out", self );
        wait 3;
        var_0 thread _id_504D();
    }
}

_id_504D()
{
    wait 0.25;

    if ( isdefined( self ) )
        thread maps\_audio::_id_15F3( self, 8 );
}

_id_504E( var_0 )
{
    common_scripts\utility::waittill_any( "deathspin" );
    thread maps\_audio::_id_15F3( var_0, 0.5 );
}

_id_504F( var_0, var_1 )
{
    var_2 = "paris_a_mi17";
    var_3 = "paris_a_mi17";

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1;
        var_3 = var_1;
    }

    thread maps\_audio_vehicles::_id_15D6( var_3, var_2, var_0 );
    var_0 vehicle_turnengineoff();
    thread _id_5050( var_0, var_2, var_3 );
    var_0 waittill( "unloaded" );
    var_0 thread maps\_utility::play_sound_on_entity( "mi17_fly_away" );
}

_id_5050( var_0, var_1, var_2 )
{
    var_0 common_scripts\utility::waittill_any( "deathspin", "death" );
    thread maps\_audio_vehicles::_id_15F4( var_2, 3.0 );
    maps\_audio_mix_manager::_id_1520( var_1, 3.0 );
}

_id_5051( var_0 )
{
    self playsound( var_0, "sounddone" );
    self waittill( "sounddone" );
}

_id_5052( var_0 )
{
    if ( !isdefined( level._id_16F5._id_5053 ) )
    {
        level._id_16F5._id_5053 = 1;
        maps\_audio_mix_manager::_id_1518( "tanks_attenuate_for_fire", "archfire_submix", var_0 );
    }
    else
    {
        var_1 = maps\_audio::_id_15B3( var_0, level._id_16F5._id_440B["tanks_attenuate_for_fire"] );
        maps\_audio_mix_manager::_id_151A( "archfire_submix", var_1 );
    }
}

_id_5054( var_0 )
{
    if ( !isdefined( level._id_16F5._id_5055 ) )
    {
        level._id_16F5._id_5055 = spawn( "script_origin", var_0 );
        level._id_16F5._id_5055 playloopsound( "pars_sewer_river" );
    }
    else
        level._id_16F5._id_5055 moveto( var_0, 0.3 );
}

_id_5056( var_0 )
{

}

_id_5057()
{
    wait 0.2;
    maps\_audio_mix_manager::_id_1514();
}

_id_5058( var_0 )
{
    var_0 playsound( "pars_sewer_pipe_burst", "sounddone" );
    var_0 waittill( "sounddone" );
    level._id_16F5._id_502B = 0;
}

_id_5059( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_origin", var_0 );
    thread maps\_audio::_id_1788( var_4, var_1, var_2, var_3, 1 );
}

_id_505A()
{
    _id_5059( ( 966.0, -36.0, 0.0 ), "emt_doorway_drips_01", 0.3, 2 );
    _id_5059( ( 969.0, -375.0, 121.0 ), "emt_doorway_drips_01", 0.4, 2 );
    _id_5059( ( 197.0, -644.0, 73.0 ), "emt_doorway_drips_01", 0.3, 2 );
    _id_5059( ( 455.0, -659.0, 77.0 ), "emt_doorway_drips_01", 0.3, 2 );
    _id_5059( ( 342.0, -416.0, 67.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 210.0, -412.0, 123.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( -232.0, -658.0, 20.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 1036.0, 284.0, 480.0 ), "emt_doorway_drips_03", 2, 2 );
    _id_5059( ( 1282.0, 31.0, 352.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 1375.0, 260.0, 358.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 1083.0, 287.0, 275.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 945.0, 288.0, 224.0 ), "emt_catacombs_drips_03", 1, 2 );
    _id_5059( ( 971.0, -23.0, 137.0 ), "emt_catacombs_drips_03", 1, 2 );
    _id_5059( ( -242.0, -379.0, 67.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 654.0, -657.0, 123.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( 895.0, 374.0, 471.0 ), "emt_water_spray_sewer_lp", 1, 2 );
    _id_5059( ( 916.0, 71.0, 479.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( -725.0, -545.0, 23.0 ), "emt_storm_drain_lp", 0.8, 2 );
    _id_5059( ( 392.0, -1007.0, 89.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( 328.0, -1407.0, 92.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( 247.0, -1472.0, 92.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( 536.0, -1493.0, 100.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( 669.0, -1918.0, 71.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( -1572.0, -1214.0, 426.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( -1654.0, -1330.0, 401.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( -2302.0, -1304.0, 429.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( -2346.0, -1223.0, 431.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( -2512.0, -863.0, 700.0 ), "emt_catacombs_drips_02", 1, 2 );
    _id_5059( ( -2532.0, -929.0, 674.0 ), "emt_doorway_drips_03", 1, 2 );
    _id_5059( ( -171.0, -393.0, 184.0 ), "pars_emt_steam_lp_01", 1, 2 );
    _id_5059( ( -2042.0, -1305.0, 514.0 ), "pars_emt_steam_lp_01", 1, 2 );
    _id_5059( ( -2407.0, -658.0, 672.0 ), "pars_emt_steam_lp_01", 1, 2 );
    common_scripts\utility::loop_fx_sound( "pars_sewer_waterfall_splatter_large", ( 171.0, -556.0, 28.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "pars_sewer_pipe_splash_lp", ( 177.0, -560.0, 181.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "pars_emt_light_flicker", ( 136.0, -311.0, 174.0 ), 1 );
}

_id_505B()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 7439.0, 1546.0, 1279.0 ), "paris_aptfire_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_med_tight", ( 2691.0, 746.0, 914.0 ), "paris_alley_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 2485.0, 632.0, 923.0 ), "paris_alley_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3729.0, 313.0, 938.0 ), "pre_alley_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_extra_lrg_tight", ( 3005.0, -320.0, 966.0 ), "paris_wood_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_extra_lrg_tight", ( 3341.0, -408.0, 959.0 ), "paris_bigwood_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 3341.0, -408.0, 959.0 ), "paris_bigwood_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 3150.0, -278.0, 1079.0 ), "paris_wood_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_extra_med_tight", ( 3091.0, -493.0, 1045.0 ), "paris_wood_03", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_metal_med", ( 5023.0, -1314.0, 1098.0 ), "paris_gastruck_metal_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 5023.0, -1314.0, 1098.0 ), "paris_gastruck_flame_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_metal_med", ( 4917.0, -1327.0, 1124.0 ), "paris_gastruck_metal_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 4917.0, -1327.0, 1124.0 ), "paris_gastruck_flame_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 3979.0, -1380.0, 1175.0 ), "paris_wood_04", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 3991.0, -1442.0, 1061.0 ), "paris_wood_05", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_rock_lrg", ( 4076.0, -1409.0, 1170.0 ), "paris_wood_06", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3631.0, -1495.0, 1185.0 ), "paris_ceiling_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3626.0, -1526.0, 1179.0 ), "paris_ceiling_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3617.0, -1617.0, 1176.0 ), "paris_ceiling_03", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3705.0, -1796.0, 1162.0 ), "paris_ceilingbeam_01", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3572.0, -1778.0, 1150.0 ), "paris_ceilingbeam_02", 1000, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 3750.0, -1662.0, 1065.0 ), "paris_ceilingbeam_03", 1000, 1.0 );
}

_id_505C()
{
    var_0 = spawn( "script_origin", ( 202.0, -542.0, 0.0 ) );
    var_1 = spawn( "script_origin", ( 202.0, -542.0, 208.0 ) );
    var_2 = spawn( "script_origin", ( 202.0, -542.0, 209.0 ) );
    thread maps\_audio::_id_1788( var_1, "pars_sewer_pipe_spray_lp", 1.0, 2.0, 1 );
    thread maps\_audio::_id_1788( var_2, "pars_sewer_pipe_spray_02_lp", 1.0, 2.0, 1 );
    thread maps\_audio::_id_1788( var_0, "pars_sewer_pipe_splash_lp", 1.0, 2.0, 1 );
}

_id_505D( var_0, var_1 )
{
    self waittill( "death" );
    thread common_scripts\utility::play_sound_in_space( "rocket_explode_default", self.origin );
    common_scripts\utility::flag_set( "aud_rpg_explo" );
    var_0 stopsounds();
    var_1 stopsounds();
}

_id_505E( var_0 )
{
    self endon( "aud_rpg_dop_start" );

    for (;;)
    {
        var_1 = distance2d( level.player.origin, var_0.origin );

        if ( var_1 < 700 )
            common_scripts\utility::flag_set( "aud_rpg_dop_start" );
    }
}

_id_505F()
{
    common_scripts\utility::flag_wait( "aud_gaz_jump" );
    wait 0.4;
    level.player playsound( "pars_gaz_jump_stairs" );
}

_id_5060()
{
    self waittill( "death" );
    maps\_audio::_id_15D7( "gaz_explode_big", self );
    maps\_audio::_id_15D7( "gaz_explode_crunch", self );
    maps\_audio::_id_15D7( "gaz_explode_metal", self );
}

_id_5061()
{
    common_scripts\utility::flag_wait( "aud_van_down_big_stairs" );
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "pars_van_down_stairs", "sounddone" );
    var_0 scalevolume( 0.0, 0.01 );
    wait 0.5;
    var_0 scalevolume( 1, 0.5 );
    var_0 waittill( "sounddone" );
    var_0 delete();
    maps\_audio_zone_manager::_id_156C( "paris_final_chase_canal", 3 );
}

_id_5062()
{
    common_scripts\utility::flag_wait( "aud_van_to_canal" );
    wait 2;
    maps\_audio::_id_1794( "pars_van_engine_seq_03" );
}

_id_5063()
{
    common_scripts\utility::flag_wait( "aud_van_canal_part_2" );
}

_id_5064()
{
    common_scripts\utility::flag_wait( "aud_van_entering_tunnel" );
    maps\_audio::_id_1794( "pars_van_street_to_tunnel" );
}

_id_5065()
{
    common_scripts\utility::flag_wait( "aud_van_tunnel_turn" );
}

_id_5066()
{
    common_scripts\utility::flag_wait( "aud_van_exiting_tunnel" );
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 linkto( level.player );
    var_0 playsound( "pars_van_tunnel_to_street" );
    thread _id_506C( var_0, "flag_final_crash_wall_impact_1", 1.0 );
}

_id_5067()
{
    common_scripts\utility::flag_wait( "aud_van_volk_rundown_pt1" );
}

_id_5068()
{
    common_scripts\utility::flag_wait( "aud_van_over_ledge" );
    maps\_audio::_id_1794( "pars_van_jump_ledge" );
}

_id_5069()
{
    common_scripts\utility::flag_wait( "aud_van_enter_tunnel" );
    maps\_audio::_id_1794( "pars_van_enter_tunnel_stairs" );
}

_id_506A()
{
    common_scripts\utility::flag_wait( "aud_van_tunnel_stairs_02" );
    maps\_audio::_id_1794( "pars_van_tunnel_turn_01" );
}

_id_506B()
{
    common_scripts\utility::flag_wait( "aud_van_tunnel_stairs_03" );
    maps\_audio::_id_1794( "pars_van_tunnel_turn_02" );
}

_id_506C( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( var_1 );
    var_0 scalevolume( 0.0, var_2 );
    wait(var_2);
    wait 0.1;
    var_0 stopsounds();
    var_0 delete();
}

_id_506D()
{
    maps\_audio::aud_send_msg( "catacombs_bomb_1" );
    earthquake( 0.3, 3, level.player.origin, 850 );
    var_0 = getent( "origin_catacombs_bomb_1", "targetname" );
    playfx( level._effect["falling_dirt_catacomb"], var_0.origin );
}

_id_506E( var_0 )
{
    var_0 vehicle_turnengineoff();
    wait 5;

    if ( isdefined( var_0 ) )
    {
        thread maps\_audio_mix_manager::_id_1517( "pars_chase_hind", 2 );
        thread maps\_audio::_id_15D7( "chase_hind_inbound", var_0 );
        wait 2.0;
        var_1 = spawn( "script_origin", var_0.origin );
        var_1 linkto( var_0 );
        maps\_audio::_id_1788( var_1, "chase_hind_blades_loop", 1.0, 5, 1 );
        wait 12;
        thread maps\_audio_mix_manager::_id_1520( "pars_chase_hind", 4 );
        common_scripts\utility::flag_wait( "aud_van_enter_tunnel" );
        var_1 thread _id_0025();
        thread maps\_audio_mix_manager::_id_1517( "pars_chase_hind_strafe", 2 );
        wait 1.25;
        maps\_audio::_id_1794( "pars_chase_hind_strafe_fronts" );
        wait 5.5;
        maps\_audio::_id_1794( "pars_chase_hind_flyaway" );
        wait 1.0;
        maps\_audio::_id_1794( "pars_chase_hind_strafe_rear2" );
        thread maps\_audio_mix_manager::_id_1520( "pars_chase_hind_strafe", 2 );
    }
}

_id_0021( var_0 )
{
    var_0 waittill( "death" );
    thread maps\_audio::_id_15F3( level._id_16F5._id_0022, 0.5 );
}

_id_0023( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( !isdefined( level._id_16F5._id_0022 ) )
        {
            level._id_16F5._id_0022 = spawn( "script_origin", var_0.origin );
            level._id_16F5._id_0022 linkto( var_0 );
            thread _id_0021( var_0 );
        }

        level._id_16F5._id_0022 playsound( "weap_hind_turret" );
    }
}

_id_0024( var_0 )
{
    var_0 waittill( "death" );
    maps\_audio::_id_1794( "chase_hind_bullet_impact" );
}

_id_0025()
{
    wait 5;

    if ( isdefined( self ) )
        thread maps\_audio::_id_15F3( self, 3 );
}

_id_506F()
{
    common_scripts\utility::flag_wait( "flag_final_crash_begin" );
    wait 0.5;
    maps\_audio::_id_1794( "volk_crash_fruit_cart_1" );
    wait 0.4;
    maps\_audio::_id_1794( "volk_crash_fruit_cart_2" );
    common_scripts\utility::flag_wait( "flag_final_crash_wall_impact_1" );
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 linkto( level.player );
    var_0 playsound( "pars_van_engine_final" );
    var_0 scalevolume( 0.0 );
    wait 0.01;
    var_0 scalevolume( 1.0, 0.5 );
    thread _id_506C( var_0, "flag_final_crash_slowmo_start", 0.1 );
    wait 2.75;
    thread maps\_audio_mix_manager::_id_150F( "pars_volk_crash", 2.0 );
    common_scripts\utility::flag_wait( "flag_final_crash_slowmo_start" );
    maps\_audio::_id_1794( "volk_crash_tbone" );
    maps\_audio_music::_id_15A8( 0.5 );
    common_scripts\utility::flag_wait( "flag_final_crash_slowmo_end" );
    wait 3;
    maps\_audio_mix_manager::_id_1520( "pars_volk_crash", 0.5 );
    maps\_audio::aud_send_msg( "mus_street_chase_end" );
}

_id_5070()
{
    common_scripts\utility::flag_wait( "flag_volk_ending_start" );
    thread maps\_audio_mix_manager::_id_150F( "pars_volk_foley", 1.0 );
}

_id_5071()
{
    var_1 = level.player isocclusionenabled( "voice" );
    level.player seteq( "voice", 0, 0, "highshelf", -8, 1150, 2 );
    level.player seteq( "voice", 1, 0, "highshelf", -8, 1150, 2 );
    maps\_audio::_id_172F( "voice" );
    return var_1;
}

_id_5072( var_0 )
{
    var_1 = maps\_audio::_id_1777( var_0, 1 );
    maps\_audio::_id_1730( "voice" );

    if ( var_1 )
        level.player setocclusion( "voice", 800, "highshelf", -8, 2 );
    else
    {
        level.player deactivateeq( 0, "voice", 0 );
        level.player deactivateeq( 1, "voice", 0 );
    }
}

_id_5073()
{
    wait 8;
    maps\_audio_dynamic_ambi::_id_14A9( "pars_sewer_pipe_stress", 10 );
}
