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
}

_id_447C()
{
    maps\_audio_mix_manager::_id_1509( "berlin_level_global_mix" );
    maps\_audio_mix_manager::_id_1509( "berlin_artillery_ambush_shock" );
    maps\_audio_mix_manager::_id_1509( "berlin_intro_flight" );
    maps\_audio_mix_manager::_id_1509( "berlin_chopper_landing" );
    maps\_audio_mix_manager::_id_1509( "berlin_aa_building" );
    maps\_audio_mix_manager::_id_1509( "berlin_aa_building_stairwell" );
    maps\_audio_mix_manager::_id_1509( "berlin_rooftops_sniping" );
    maps\_audio_mix_manager::_id_1509( "berlin_granite_heli_by" );
    maps\_audio_mix_manager::_id_1509( "berlin_post_rappel" );
    maps\_audio_mix_manager::_id_1509( "berlin_street_bridge_tanks" );
    maps\_audio_mix_manager::_id_1509( "berlin_ally_tanks" );
    maps\_audio_mix_manager::_id_1509( "berlin_tank_shock" );
    maps\_audio_mix_manager::_id_1509( "berlin_building_collapse" );
    maps\_audio_mix_manager::_id_1509( "berlin_building_collapse_transition" );
    maps\_audio_mix_manager::_id_1509( "berlin_artillery_ambush" );
    maps\_audio_mix_manager::_id_1509( "berlin_artillery_ambush_off" );
    maps\_audio_mix_manager::_id_1509( "berlin_artillery_ambush_on" );
    maps\_audio_mix_manager::_id_1509( "berlin_collapse_aftermath" );
    maps\_audio_mix_manager::_id_1509( "berlin_street_prehotel" );
    maps\_audio_mix_manager::_id_1509( "berlin_hotel" );
    maps\_audio_mix_manager::_id_1509( "berlin_reverse_breach_setup" );
    maps\_audio_mix_manager::_id_1509( "berlin_reverse_breach" );
    maps\_audio_mix_manager::_id_1509( "berlin_pistol_boost" );
    maps\_audio_mix_manager::_id_1509( "berlin_finale" );
}

_id_4ED2()
{
    maps\_audio::_id_1740( "shg" );
    maps\_audio::_id_156E( "med_occlusion" );
    maps\_audio::_id_1735();
    maps\_audio_mix_manager::_id_1517( "berlin_level_global_mix" );
}

_id_4ED3()
{
    common_scripts\utility::flag_init( "aud_all_clear" );
    common_scripts\utility::flag_init( "aud_start_deadbird_sounds" );
    common_scripts\utility::flag_init( "aud_intro_flight_landed" );
    common_scripts\utility::flag_init( "aud_kill_ally_tanks" );
    common_scripts\utility::flag_init( "aud_stop_fake_tanks" );
    common_scripts\utility::flag_init( "aud_dist_tank_battle" );
    common_scripts\utility::flag_init( "first_attack_chopper_spawned" );
    common_scripts\utility::flag_init( "aud_ibeam_fall_complete" );
}

_id_4ED4()
{
    level._id_16F5 = spawnstruct();
    level._id_16F5._id_4ED5 = 0;
}

_id_447D()
{
    if ( maps\_audio::_id_17C4() )
        return;

    thread _id_4988();
    thread _id_4F15();
    thread _id_4F09();
    thread _id_4F0A();
    thread _id_4F05();
    thread _id_4F06();
    thread _id_4F07();
    thread _id_4F08();
    thread _id_4F0B();
}

_id_496E()
{

}

_id_447F()
{
    level._id_16F5._id_440B["aud_artillery_ambush_mix_off"] = [ [ 0.0, 0.0 ], [ 0.082, 0.426 ], [ 0.238, 0.736 ], [ 0.408, 0.844 ], [ 0.756, 0.953 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["aud_artillery_ambush_mix_on"] = [ [ 0.0, 0.0 ], [ 0.082, 0.426 ], [ 0.238, 0.736 ], [ 0.408, 0.844 ], [ 0.756, 0.953 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["ally_tank_fire_vol"] = [ [ 0.0, 0.05 ], [ 0.05, 0.1 ], [ 0.1, 0.1 ], [ 0.2, 0.2 ], [ 0.3, 0.3 ], [ 0.4, 0.4 ], [ 0.5, 0.5 ], [ 0.6, 0.6 ], [ 0.8, 0.8 ], [ 1.0, 1.0 ] ];
}

_id_4480()
{
    var_0 = [ [ "aud_artillery_ambush_mix_progress", ::_id_4F03 ] ];
    maps\_audio::_id_175D( var_0 );
}

_id_447E()
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
        case "start_berlin_intro":
            maps\_audio_mix_manager::_id_1517( "berlin_artillery_ambush_shock", 0.05 );
            maps\_audio::_id_1794( "bln_intro_shellshock_bed_front" );
            maps\_audio::_id_1795( "bln_intro_shellshock_voices_front", 0.77, 1 );
            maps\_audio::_id_1795( "bln_intro_shellshock_sandman", 3.35, 1 );
            break;
        case "start_heli_ride":
            var_3 = thread maps\_audio::_id_1712( "bln_intro_flight_music_main", 3 );
            thread _id_4F01( var_3 );
            maps\_audio::_id_1795( "bln_intro_flight_grp_bank_left", 11.17 );

            if ( !isdefined( level._id_16F5._id_4ED7 ) )
            {
                thread maps\_audio::_id_1712( "bln_intro_flight_music_start_sht", 1.0 );
                maps\_audio_mix_manager::_id_1517( "berlin_intro_flight", 0.05 );
                maps\_audio_mix_manager::_id_1517( "intro_flight_player_weapon" );
            }

            break;
        case "start_chopper_crash":
            maps\_audio_zone_manager::_id_156C( "berlin_rooftops_chopperlanding" );
            break;
        case "start_clear_roof":
            maps\_audio_zone_manager::_id_156C( "berlin_rooftops_sniping" );
            break;
        case "start_sniper":
            maps\_audio_zone_manager::_id_156C( "berlin_rooftops_sniping" );
            break;
        case "start_rappel":
            maps\_audio_zone_manager::_id_156C( "berlin_rooftops_sniping" );
            _id_448B( "mus_sniper_complete" );
            break;
        case "start_rappel_complete":
            maps\_audio_zone_manager::_id_156C( "berlin_street_dense_postrappel" );
            _id_448B( "mus_sniper_complete" );
            break;
        case "start_clear_bridge":
            maps\_audio_zone_manager::_id_156C( "berlin_street_dense_postrappel" );
            _id_448B( "mus_sniper_complete" );
            break;
        case "start_advance_parkway":
            maps\_audio_zone_manager::_id_156C( "berlin_street_bridge_tanks" );
            _id_448B( "mus_bridge_battle_all_tanks_dead" );
            break;
        case "start_building_collapse":
            maps\_audio_zone_manager::_id_156C( "berlin_street_bridge_tanks" );
            break;
        case "start_traverse_building":
            maps\_audio_zone_manager::_id_156C( "berlin_collapse_aftermath_exterior" );
            break;
        case "start_emerge":
            maps\_audio_zone_manager::_id_156C( "berlin_collapse_aftermath_interior" );
            _id_448B( "mus_ceiling_collapse_complete" );
            break;
        case "start_last_stand":
            maps\_audio_zone_manager::_id_156C( "berlin_hotel_blownout" );
            _id_448B( "mus_emerge_door_open" );
            break;
        case "start_reverse_breach":
            maps\_audio_zone_manager::_id_156C( "berlin_hotel_interior" );
            _id_448B( "mus_player_at_top_of_hotel_stairwell" );
            break;
        case "enter_berlin_blownout_office":
            var_4 = var_1;
            break;
        case "exit_berlin_blownout_office":
            var_5 = var_1;
            break;
        case "enter_berlin_blownout_office_secondfloor_stairwell":
            var_4 = var_1;
            break;
        case "exit_berlin_blownout_office_secondfloor_stairwell":
            var_5 = var_1;
            break;
        case "enter_berlin_rooftops_sniping":
            var_4 = var_1;
            break;
        case "exit_berlin_rooftops_sniping":
            var_5 = var_1;
            break;
        case "enter_berlin_street_bridge_tanks":
            var_4 = var_1;
            break;
        case "exit_berlin_street_bridge_tanks":
            var_5 = var_1;
            break;
        case "enter_berlin_ottobuilding_interior":
            var_4 = var_1;
            break;
        case "exit_berlin_ottobuilding_interior":
            var_5 = var_1;
            break;
        case "enter_prime_building_collapse":
            break;
        case "exit_prime_building_collapse":
            break;
        case "enter_berlin_collapse_aftermath_interior":
            var_4 = var_1;

            if ( var_4 == "berlin_collapse_aftermath_exterior" )
            {
                thread _id_4F20();
                thread _id_4F21();
                thread _id_4F22();
            }

            break;
        case "exit_berlin_collapse_aftermath_interior":
            var_5 = var_1;
            break;
        case "enter_berlin_aftermath_street_prehotel":
            var_4 = var_1;

            if ( var_4 == "berlin_collapse_aftermath_interior" )
                level notify( "exited_collapse_building" );

            break;
        case "exit_berlin_aftermath_street_prehotel":
            var_5 = var_1;
            break;
        case "enter_berlin_hotel_blownout":
            var_4 = var_1;
            break;
        case "exit_berlin_hotel_blownout":
            var_5 = var_1;
            break;
        case "enter_berlin_hotel_stairwell":
            var_4 = var_1;
            break;
        case "exit_berlin_hotel_stairwell":
            var_5 = var_1;
            break;
        case "enter_berlin_hotel_interior":
            var_4 = var_1;
            break;
        case "exit_berlin_hotel_interior":
            var_5 = var_1;
            break;
        case "enter_berlin_hotel_exterior_heli":
            var_4 = var_1;
            break;
        case "exit_berlin_hotel_exterior_heli":
            var_5 = var_1;
            break;
        case "fade_in_heli_ride":
            break;
        case "spawn_playerbird":
            var_6 = var_1;
            var_6 waittill( "unloading" );
            var_6 waittill( "unloaded" );
            maps\_audio::_id_15D7( "bln_intro_flight_playerbird_out", var_6 );
            break;
        case "spawn_deadbird":
            var_7 = var_1;
            common_scripts\utility::flag_wait( "aud_start_deadbird_sounds" );
            maps\_audio::_id_15D7( "bln_intro_flight_deadbird_move", var_7 );
            break;
        case "intro_javelin_fire_1":
            var_8 = var_1;
            var_8 waittill( "death" );
            break;
        case "intro_javelin_fire_2":
            var_8 = var_1;
            maps\_audio::_id_1795( "bln_intro_flight_javelin_inc_01", 5.25 );
            var_8 waittill( "death" );
            maps\_audio::_id_1794( "bln_intro_flight_javelin_explo_01" );
            common_scripts\utility::flag_set( "aud_start_deadbird_sounds" );
            break;
        case "intro_javelin_fire_3":
            var_8 = var_1;
            maps\_audio::_id_1795( "bln_intro_flight_javelin_inc_02", 5 );
            var_8 waittill( "death" );
            maps\_audio::_id_1794( "bln_intro_flight_javelin_explo_02" );
            maps\_audio_mix_manager::_id_1520( "intro_flight_player_weapon" );
            break;
        case "apache_fires_missiles1":
            var_9 = var_1;
            break;
        case "apache_fires_missiles2":
            var_9 = var_1;
            break;
        case "RPG_fires_at_deadbird":
            var_10 = var_1;
            maps\_audio::_id_15D7( "bln_intro_flight_rpg_fire", var_10 );
            break;
        case "deadbird_hit":
            var_7 = var_1;
            maps\_audio::_id_1794( "bln_intro_flight_deadbird_crash_hit" );
            maps\_audio::_id_1794( "bln_intro_flight_deadbird_crash_front" );
            maps\_audio::_id_1795( "bln_intro_flight_deadbird_impact", 2.4 );
            break;
        case "deadbird_crash":
            var_7 = var_1;
            maps\_audio::_id_1794( "bln_intro_flight_playerbird_land" );
            maps\_audio_mix_manager::_id_1520( "berlin_intro_flight", 3 );
            maps\_audio_zone_manager::_id_156C( "berlin_rooftops_chopperlanding", 3.0 );
            wait 3;
            common_scripts\utility::flag_set( "aud_intro_flight_landed" );
            break;
        case "spawn_aabuilding_a10_flyby":
            var_11 = var_1;
            thread maps\_audio::_id_15D7( "bln_a10_aa_building_flyby", var_11 );
            wait 0.368;
            thread maps\_audio::_id_15D7( "bln_a10_aa_building_jet_flyby", var_11 );
            break;
        case "sam_detonate_player":
            var_12 = var_1;
            var_12 playsound( "exp_remote_missile_dist_sub" );
            var_12 playsound( "exp_remote_missile" );
            maps\_audio::_id_1775( var_12.origin, "explo_move_mixed_01_L", "explo_move_mixed_01_R" );
            break;
        case "team2_sam_detonate":
            break;
        case "hind_flyby_stairwell":
            var_13 = var_1;

            if ( isdefined( var_13 ) )
            {
                var_14 = spawn( "script_origin", var_13.origin );
                var_14 linkto( var_13 );
                thread maps\_audio::_id_1788( var_13, "bln_hind_flyby_stairwell", 1, 1.25 );
                thread maps\_audio::_id_1788( var_13, "bln_hind_flyby_stairwell_loop", 1, 1.25, 1 );
                wait 3;
                var_14 scalevolume( 0.0, 4 );
                wait 4;
                var_14 delete();
            }

            break;
        case "ambient_ally_helis":
            var_15 = var_1;

            foreach ( var_13 in var_15 )
                var_13 vehicle_turnengineoff();

            var_18 = var_15[1];
            var_19 = var_15[3];

            if ( isdefined( var_18 ) )
            {
                thread maps\_audio::_id_15D7( "bln_group_littlebirds_by", var_18 );
                thread maps\_audio_vehicles::_id_163C( var_18, "bln_group_littlebirds_by_doppler", 2000 );
            }

            if ( isdefined( var_19 ) )
            {
                var_20 = spawn( "script_origin", var_19.origin );
                var_20 linkto( var_19 );
                thread maps\_audio::_id_1788( var_20, "bln_group_littlebirds_loop_low", 1, 2.5, 1 );
                var_19 thread _id_4F0E( var_20, 3 );
            }

            break;
        case "warthog_A10_flyby_01":
            var_21 = var_1;

            if ( isarray( var_21 ) )
            {
                if ( isdefined( var_21[0] ) )
                {
                    var_21[0] vehicle_turnengineoff();
                    thread maps\_audio::_id_15D7( "blin_a10_skybattle_flyby_01", var_21[0] );
                }
            }

            break;
        case "warthog_A10_flyby_02":
            var_21 = var_1;

            if ( isarray( var_21 ) )
            {
                if ( isdefined( var_21[0] ) )
                {
                    var_21[0] vehicle_turnengineoff();
                    thread maps\_audio::_id_15D7( "blin_a10_skybattle_flyby_02", var_21[0] );
                }
            }

            break;
        case "missile_hinds":
            var_22 = var_1;

            foreach ( var_24 in var_22 )
            {
                var_24 vehicle_turnengineoff();
                var_24 thread _id_44DA();
            }

            if ( isarray( var_22 ) )
            {
                if ( isdefined( var_22[0] ) )
                {
                    wait 1;
                    thread maps\_audio::_id_15D7( "blin_missile_hind_inbound", var_22[0] );
                    thread maps\_audio_vehicles::_id_163C( var_22[0], "blin_missile_hind_by", 4000 );
                    var_26 = spawn( "script_origin", var_22[0].origin );
                    var_26 linkto( var_22[0] );
                    thread maps\_audio::_id_1788( var_26, "blin_missile_hind_move_loop", 1, 5, 1 );
                    var_22[0] thread _id_4F0E( var_26, 3 );
                }
            }

            break;
        case "mainstreet_hind2":
            var_22 = var_1;

            foreach ( var_24 in var_22 )
                var_24 vehicle_turnengineoff();

            if ( isarray( var_22 ) )
            {
                if ( isdefined( var_22[0] ) )
                    thread maps\_audio::_id_1788( var_22[0], "blin_flyby_hind_pair_by", 1, 4 );
            }

            break;
        case "mainstreet_hind3":
            var_22 = var_1;

            if ( isdefined( var_22[0] ) )
            {
                var_22[0] vehicle_turnengineoff();
                var_22[0] thread _id_44DA();
                thread maps\_audio::_id_15D7( "blin_flyover_hind_single_by", var_22[0] );
                thread maps\_audio_vehicles::_id_163C( var_22[0], "blin_flyover_hind_single_engine", 3000 );
                var_26 = spawn( "script_origin", var_22[0].origin );
                var_26 linkto( var_22[0] );
                thread maps\_audio::_id_1788( var_26, "blin_flyover_hind_single_move_loop", 1, 2, 1 );
                var_22[0] thread _id_4F0E( var_26, 3 );
            }

            break;
        case "hind_attack_apache3_killer":
            var_22 = var_1;

            if ( isdefined( var_22[0] ) )
            {
                var_22[0] vehicle_turnengineoff();
                var_22[0] thread _id_44DA();
                thread maps\_audio::_id_15D7( "blin_flyby_hind_single_by", var_22[0] );
                thread maps\_audio_vehicles::_id_163C( var_22[0], "blin_flyby_hind_single_engine", 2000 );
                var_26 = spawn( "script_origin", var_22[0].origin );
                var_26 linkto( var_22[0] );
                thread maps\_audio::_id_1788( var_26, "blin_flyby_hind_single_move_loop", 1, 1, 1 );
                var_22[0] thread _id_4F0E( var_26, 3 );
            }

            break;
        case "sniper_support_helis":
            var_22 = var_1;

            foreach ( var_13 in var_22 )
                var_13 vehicle_turnengineoff();

            thread maps\_audio::_id_1788( var_22[0], "granite_team_lowend_lp", 1, 2.5, 1 );
            var_22[0] thread _id_44DA();
            var_22[1] thread _id_44DA();
            thread maps\_audio::_id_1788( var_22[2], "granite_team_apache_loop", 1, 2.5, 1 );
            thread maps\_audio::_id_1788( var_22[3], "granite_team_move_loop", 1, 2.5, 1 );
            thread maps\_audio_vehicles::_id_163C( var_22[4], "granite_team_flyby_3", 1000 );
            thread maps\_audio_vehicles::_id_163C( var_22[5], "granite_team_flyby_2", 2500 );
            wait 2;
            maps\_audio_mix_manager::_id_1517( "berlin_granite_heli_by", 2 );
            thread maps\_audio::_id_1788( var_22[1], "granite_team_heli_by", 1, 3 );
            wait 3;
            common_scripts\utility::flag_wait( "sniper_delta_support_squad_unloaded" );
            thread maps\_audio::_id_15D7( "granite_team_apache_fly_out", var_22[2] );
            maps\_audio_mix_manager::_id_1520( "berlin_granite_heli_by", 2 );
            break;
        case "apache_fire_missile":
            thread _id_44DB();
            break;
        case "sniper_tank_01":
            var_31 = var_1;
            var_31 thread _id_4F0F();
            break;
        case "sniper_tank_02":
            var_31 = var_1;
            var_31 thread _id_4F0F();
            break;
        case "sniper_tank_03":
            var_31 = var_1;
            var_31 thread _id_4F0F();
            break;
        case "sniper_tank_hits_building":
            var_32 = var_1;
            var_33 = maps\_audio::_id_17A6( var_32 );
            thread common_scripts\utility::play_sound_in_space( "bln_artillery_explo", var_33.v["origin"] );
            thread common_scripts\utility::play_sound_in_space( "sniper_tank_impact_debris", var_33.v["origin"] );
            break;
        case "goggles_on":
            maps\_audio::_id_1794( "berl_goggles_unsheath" );
            wait 1;
            maps\_audio::_id_1794( "berl_goggles_on" );
            break;
        case "goggles_off":
            maps\_audio::_id_1794( "berl_goggles_off" );
            wait 0.6;
            maps\_audio::_id_1794( "berl_goggles_resheath" );
            break;
        case "a10_airstrike_requested":
            break;
        case "a10_first_point_confirmed":
            maps\_audio::_id_1794( "berl_goggles_target1" );
            level.player thread common_scripts\utility::play_loop_sound_on_entity( "berl_goggles_ui_loop" );
            break;
        case "a10_second_point_confirmed":
            level.player thread common_scripts\utility::stop_loop_sound_on_entity( "berl_goggles_ui_loop" );
            maps\_audio::_id_1794( "berl_goggles_target2" );
            break;
        case "a10_cancelled":
            level.player thread common_scripts\utility::stop_loop_sound_on_entity( "berl_goggles_ui_loop" );
            break;
        case "a10_airstrike_start":
            var_11 = var_1;
            thread maps\_audio::_id_15D7( "bln_a10_airstrike_flyby", var_11 );
            wait 2.2;
            thread maps\_audio::_id_15D7( "bln_a10_jet_flyby", var_11 );
            break;
        case "a10_airstrike_fire":
            var_11 = var_1;
            var_34 = var_11.origin;
            wait 1.5;
            var_35 = thread maps\_audio::_id_179A( "bln_a10_airstrike_roar", var_34 );

            if ( isdefined( var_35 ) )
            {
                var_36 = randomfloatrange( 1, 1.15 );
                var_35 setpitch( var_36, 0.05 );
            }

            break;
        case "a10_airstrike_ground_impact":
            var_37 = var_1;
            thread common_scripts\utility::play_sound_in_space( "bln_a10_airstrike_impact", var_37 );

            if ( !isdefined( level._id_16F5._id_4ED8 ) )
            {
                level._id_16F5._id_4ED8 = 1;
                thread common_scripts\utility::play_sound_in_space( "bln_a10_airstrike_fire", var_37 );
                wait 0.15;
                thread common_scripts\utility::play_sound_in_space( "bln_a10_airstrike_imp_explo", var_37 );
                thread _id_4F04();
                earthquake( 0.5, 1, level.player.origin, 1000 );
                level.player playrumbleonentity( "heavy_3s" );
            }

            break;
        case "prime_granite_breach":
            level._id_16F5._id_4ED9 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
            level._id_16F5._id_4ED9 maps\_audio::_id_170B( "granite_team_door_kick" );
            break;
        case "play_granite_breach":
            thread _id_0039();
            level._id_16F5._id_4ED9 playsound( "granite_team_door_kick", "sounddone" );
            level._id_16F5._id_4ED9 waittill( "sounddone" );
            wait 0.05;
            level._id_16F5._id_4ED9 delete();
            break;
        case "prime_granite_explosion":
            level._id_16F5._id_4EDA = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
            level._id_16F5._id_4EDA maps\_audio::_id_170B( "granite_team_death_explosion" );
            break;
        case "play_granite_explosion":
            level._id_16F5._id_4EDA playsound( "granite_team_death_explosion", "sounddone" );
            level._id_16F5._id_4EDA waittill( "sounddone" );
            wait 0.05;
            level._id_16F5._id_4EDA delete();
            break;
        case "granite_dead_room_explode":
            var_32 = var_1;
            var_33 = maps\_audio::_id_17A6( var_32 );
            thread common_scripts\utility::play_sound_in_space( "granite_team_room_explode", var_33.v["origin"] );
            thread common_scripts\utility::play_sound_in_space( "granite_team_explo_debris_01", var_33.v["origin"] );
            thread common_scripts\utility::play_sound_in_space( "granite_team_explo_debris_02", var_33.v["origin"] );
            thread common_scripts\utility::play_sound_in_space( "granite_team_room_explode_punch", var_33.v["origin"] );
            break;
        case "a10_rappel_fire":
            var_11 = var_1;
            wait 0.3;
            maps\_audio::_id_1794( "bln_a10_rappel_fire" );
            wait 1.7;
            maps\_audio::_id_1794( "bln_a10_rappel_roar" );
            break;
        case "player_rappels":
            thread maps\_audio::_id_1712( "bln_a10_rappel_flyby", 1.7 );
            thread maps\_audio::_id_1712( "bln_a10_rappel_flyby_low", 1.7 );
            wait 4;
            maps\_audio::_id_1794( "bln_a10_rappel_jet_flyby" );
            wait 6;
            common_scripts\utility::flag_set( "aud_dist_tank_battle" );
            break;
        case "bridge_battle_apache_shotdown_spawn":
            var_38 = var_1;
            wait 5;
            var_39 = thread maps\_audio::_id_15D7( "bln_helicopter_crash_heli_inbound", var_38 );
            var_38 waittill( "deathspin" );
            thread maps\_audio::_id_15D7( "bln_helicopter_crash_hit", var_38 );
            thread maps\_audio::_id_15D7( "bln_helicopter_crash_turbine", var_38 );

            if ( isdefined( var_39 ) )
                var_39 stopsounds();

            wait 1.5;
            thread maps\_audio::_id_15D7( "bln_helicopter_crash_engine", var_38 );
            wait 3.3;
            thread common_scripts\utility::play_sound_in_space( "bln_helicopter_crash_explo", ( 4150.0, -12.0, 104.0 ) );
            earthquake( 0.5, 1, level.player.origin, 1000 );
            break;
        case "bridge_battle_apache_shotdown_jav_launch":
            var_8 = var_1;
            wait 2;
            thread maps\_audio::_id_15D7( "bln_helicopter_crash_jav_inc", var_8 );
            break;
        case "bridge_rpg_picked_up":
            break;
        case "destroy_tank_with_rpg_objective":
            var_40 = var_1;
            var_40 waittill( "death" );
            maps\_audio::_id_1794( "bln_rpg_tank_explo" );
            earthquake( 0.5, 1, level.player.origin, 1000 );
            break;
        case "rus_bridge_tanks":
            var_31 = var_1;

            if ( isdefined( var_31 ) )
                var_31 thread _id_4F0F();

            break;
        case "ally_deadtank":
            var_31 = var_1;

            if ( isdefined( var_31 ) )
                var_31 thread _id_4F18();

            if ( isdefined( var_31 ) )
                maps\_audio::_id_15D7( "us_tank_idle_lp", var_31, "loop", "aud_kill_bridge_tank_dist_loop" );

            break;
        case "ally_tank_01":
            thread maps\_audio_mix_manager::_id_1517( "berlin_ally_tanks", 0.01 );
            var_31 = var_1;
            var_41 = "ally_tank_01";
            var_42 = "us_tank_treads_lp_02";
            var_43 = "us_tank_move_low_lp";
            var_44 = "us_tank_idle_lp";
            var_45 = 1;
            var_46 = 3;
            var_31._id_2A84 = 1;
            var_31 thread _id_4F18();
            var_31 thread _id_4409( var_41, var_42, var_43, var_44, var_45, var_46 );
            break;
        case "ally_tank_02":
            var_31 = var_1;
            var_41 = "ally_tank_02";
            var_42 = "us_tank_treads_lp_02";
            var_43 = "us_tank_move_low_lp";
            var_44 = "us_tank_idle_lp";
            var_31._id_2A84 = 1;
            var_31 thread _id_4F18();
            var_31 thread _id_4409( var_41, var_42, var_43, var_44 );
            break;
        case "usa_tank1_start_parkway":
            var_47 = var_1;
            wait 1;

            if ( isdefined( var_47 ) )
            {
                maps\_audio::_id_15D7( "blin_us_tank_over_barricade_01", var_47 );
                wait 1;
                maps\_audio::_id_15D7( "blin_us_tank_barricade_lyr_01", var_47 );
            }

            break;
        case "usa_tank2_start_parkway":
            var_47 = var_1;
            wait 6;

            if ( isdefined( var_47 ) )
            {
                maps\_audio::_id_15D7( "blin_us_tank_over_barricade_02", var_47 );
                wait 0.5;
                maps\_audio::_id_15D7( "blin_us_tank_barricade_lyr_01", var_47 );
            }

            break;
        case "last_stand_tank_scripted":
            thread _id_4F14();
            break;
        case "last_stand_tanks":
            var_48 = var_1;

            foreach ( var_47 in var_48 )
                var_47 thread _id_4F14();

            break;
        case "destroyBuilding":
            maps\_audio_mix_manager::_id_1517( "berlin_building_collapse", 0.05 );
            maps\_audio_mix_manager::_id_1520( "berlin_ally_tanks" );
            maps\_audio_zone_manager::_id_156C( "berlin_building_collapse_transition" );
            maps\_audio::_id_1794( "building_collapse_explo" );
            maps\_audio::_id_1794( "building_collapse_transient" );
            maps\_audio::_id_1795( "building_collapse_explo_punch", 1.16, 1 );
            thread maps\_audio::_id_1712( "building_collapse_front", 3.66, undefined, 1 );
            common_scripts\utility::flag_set( "aud_stop_fake_tanks" );
            common_scripts\utility::flag_set( "aud_kill_ally_tanks" );
            level notify( "aud_kill_bridge_tank_dist_loop" );
            thread _id_4F02( 20, 5 );
            break;
        case "building_collide":
            maps\_audio::_id_1795( "building_collapse_chunk_wsh", 2.45, 1 );
            maps\_audio::_id_1795( "building_collapse_chunk_impact", 3.2, 1 );
            maps\_audio::_id_1795( "building_collapse_chunk", 4.0, 1 );
            maps\_audio::_id_1795( "building_collapse_chunk_transient", 4.1, 1 );
            break;
        case "building_collapse_teleport_complete":
            maps\_audio_mix_manager::_id_1517( "berlin_artillery_ambush_shock", 0.05 );
            maps\_audio::_id_1794( "bln_intro_shellshock_bed_front" );
            maps\_audio::_id_1795( "bln_intro_shellshock_voices_front", 0.77, 1 );
            maps\_audio::_id_1795( "bln_intro_shellshock_sandman", 4, 1 );
            break;
        case "artillery_ambush_first_incoming":
            var_51 = var_1;
            var_52 = var_51[0];
            var_53 = var_51[1];
            maps\_audio::_id_1794( "bln_first_artillery_incoming" );
            break;
        case "artillery_ambush_first_explosion":
            var_52 = var_1;
            maps\_audio::_id_1794( "bln_first_artillery_explo" );
            maps\_audio::_id_1794( "bln_first_artillery_explo_debris" );
            maps\_audio_zone_manager::_id_156C( "berlin_collapse_aftermath_exterior", 0.05 );
            maps\_audio_mix_manager::_id_1520( "berlin_artillery_ambush_shock", 0.05 );
            wait 1;
            maps\_audio::_id_1794( "bln_intro_small_arms_front" );
            break;
        case "artillery_ambush_incoming":
            var_51 = var_1;
            var_52 = var_51[0];
            var_53 = var_51[1];

            if ( var_53 < 0.8 )
                thread maps\_audio::_id_179A( "bln_artillery_incoming_short", var_52, var_53 );
            else
                thread maps\_audio::_id_179A( "bln_artillery_incoming", var_52, var_53 );

            break;
        case "artillery_ambush_explosion":
            var_52 = var_1;
            thread common_scripts\utility::play_sound_in_space( "bln_artillery_explo", var_52 );
            break;
        case "artillery_ambush_final_incoming":
            var_51 = var_1;
            var_52 = var_51[0];
            var_53 = var_51[1];
            maps\_audio::_id_1794( "bln_intro_final_incoming_long" );
            wait 0.638;
            maps\_audio::_id_1794( "bln_intro_final_incoming_short" );
            break;
        case "artillery_ambush_final_explosion":
            var_52 = var_1;
            maps\_audio::_id_1794( "bln_intro_final_explo" );
            thread maps\_audio::_id_1712( "bln_intro_flight_music_start_lng", 1.4 );
            maps\_audio_mix_manager::_id_1517( "berlin_intro_flight", 1 );
            level._id_16F5._id_4ED7 = 1;
            maps\_audio::_id_17BF( 0.2 );
            maps\_audio::_id_1794( "bln_intro_final_debris_front" );
            maps\_audio_mix_manager::_id_1513( 1 );
            maps\_audio_zone_manager::_id_1576( 1 );
            break;
        case "building_falling_column":
            var_54 = var_1;
            thread maps\_audio::_id_15D7( "bln_falling_column_fall", var_54 );
            break;
        case "ceiling_collapse_begins":
            thread maps\_audio::_id_15D7( "bln_ceiling_collapse_start", level.player );
            break;
        case "aftermath_falling_object":
            var_51 = var_1;
            var_0 = var_51[0];
            var_1 = var_51[1];
            thread _id_4F1C( var_0, var_1 );
            break;
        case "start_player_slide_trigger":
            var_55 = var_1;

            if ( isdefined( var_55 ) )
            {
                if ( soundexists( "scn_player_rubble_slide" ) && soundexists( "scn_player_rubble_slide_land" ) )
                {
                    var_56 = maps\_audio::_id_1794( "scn_player_rubble_slide" );
                    var_55 waittill( "aud_player_done_sliding" );
                    thread common_scripts\utility::play_sound_in_space( "scn_player_rubble_slide_land", level.player.origin );

                    if ( isdefined( var_56 ) )
                        var_56 scalevolume( 0.0, 1 );
                }
            }

            break;
        case "end_player_slide_trigger":
            var_55 = var_1;

            if ( isdefined( var_55 ) )
                var_55 notify( "aud_player_done_sliding" );

            break;
        case "building_shake_rumble_lg":
            maps\_audio::_id_1794( "berl_bombshake_lrg" );
            break;
        case "building_shake_rumble_med":
            maps\_audio::_id_1794( "berl_bombshake_med" );
            break;
        case "building_shake_rumble_sm":
            maps\_audio::_id_1794( "berl_bombshake_sml" );
            break;
        case "building_shake_dirt_debris":
            var_52 = var_1;
            break;
        case "building_shake_rock_falling":
            var_52 = var_1;
            break;
        case "US_tanks_destroyed":
            break;
        case "last_stand_door_kick":
            var_57 = var_1;
            wait 0.4;
            var_57 playsound( "berl_emerge_doorbreak_break" );
            break;
        case "reverse_breach_start":
            _id_448B( "mus_reverse_breach_start" );
            maps\_audio_mix_manager::_id_1517( "berlin_reverse_breach_setup", 1.5 );
            wait 0.4;
            maps\_audio::_id_1794( "bln_rvrs_breach_plant" );
            thread _id_4F1F();
            break;
        case "reverse_breach_door_explode":
            _id_4F1D();
            break;
        case "spawn_reverse_breach_heli":
            var_13 = var_1;
            var_13 vehicle_turnengineoff();
            break;
        case "reverse_breach_getup_slowmo":
            maps\_audio_mix_manager::_id_1517( "berlin_finale", 0.05 );
            maps\_audio_mix_manager::_id_1520( "berlin_pistol_boost", 0.05 );
            break;
        case "reverse_breach_getup_regular_speed":
            _id_448B( "mus_reverse_breach_getup_regular_speed" );
            maps\_audio_mix_manager::_id_1520( "berlin_finale", 1.0 );
            break;
        case "artillery_ambush_mix_enter":
            if ( var_1 == "front" )
            {
                maps\_audio_mix_manager::_id_1519( "berlin_artillery_ambush_on", "berlin_artillery_ambush_off", "artillery_blend", 0.0 );
                level._id_16F5._id_4EDB = "artillery_blend";
                level._id_16F5._id_4EFF = "aud_artillery_ambush_mix_off";
            }
            else
            {
                maps\_audio_mix_manager::_id_151A( "artillery_blend", 1.0 );
                level._id_16F5._id_4EDB = "artillery_blend";
                level._id_16F5._id_4EFF = "aud_artillery_ambush_mix_off";
            }

            break;
        case "artillery_ambush_mix_exit":
            if ( var_1 == "front" )
                maps\_audio_mix_manager::_id_151C( "artillery_blend" );
            else
                maps\_audio_mix_manager::_id_151A( "artillery_blend", 1.0 );

            break;
        case "bln_ivan_falling_back":
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
        case "mus_player_unloaded_from_intro_flight":
            wait 14;
            maps\_audio::_id_17A2( 100, 0 );
            maps\_audio_music::_id_15A7( "bln_player_unloaded_from_intro_flight", 0 );
            wait 10;
            maps\_audio::_id_17A2( 1, 20 );
            break;
        case "mus_enter_aa_building_stairwell":
            maps\_audio::_id_17A2( 1, 10 );
            maps\_audio_music::_id_15A7( "bln_enter_aa_building_stairwell", 4 );
            break;
        case "mus_enter_aa_building_combat":
            maps\_audio_music::_id_15A7( "bln_enter_aa_building_combat", 4 );
            break;
        case "mus_aa_building_roof_guys_dead":
            maps\_audio_music::_id_15A7( "bln_aa_building_roof_guys_dead", 2 );
            wait 2;
            maps\_audio_music::_id_15A8( 20 );
            break;
        case "mus_sniper_complete":
            maps\_audio_music::_id_15A7( "bln_sniper_complete", 0.5 );
            break;
        case "mus_player_rappel":
            maps\_audio_music::_id_15A7( "bln_player_rappel", 0.5 );
            break;
        case "mus_bridge_battle_all_tanks_dead":
            maps\_audio_music::_id_15A7( "bln_bridge_battle_all_tanks_dead", 10 );
            wait 10;
            maps\_audio::_id_17A2( 0.2, 45 );
            break;
        case "mus_start_building_collapse":
            maps\_audio_music::_id_15A8( 1 );
            wait 1;
            maps\_audio::_id_17A2( 1, 1 );
            break;
        case "mus_player_teleport_after_building_collapse":
            maps\_audio_music::_id_15A7( "bln_player_teleport_after_building_collapse", 4 );
            break;
        case "mus_ceiling_collapse_complete":
            wait 5;
            maps\_audio_music::_id_15A7( "bln_ceiling_collapse_complete", 6 );
            level._id_16F5._id_4F00 = spawn( "script_origin", level.player.origin );
            level._id_16F5._id_4F00 playloopsound( "amb_blin_building_aftermath_spacey" );
            level._id_16F5._id_4F00 scalevolume( 0.0, 0.05 );
            wait 0.05;
            level._id_16F5._id_4F00 scalevolume( 1.0, 5 );
            break;
        case "mus_emerge_door_open":
            maps\_audio::_id_17A2( 1000 );
            maps\_audio_music::_id_15A7( "bln_theres_the_hotel", 0, 3 );

            if ( isdefined( level._id_16F5._id_4F00 ) )
            {
                level._id_16F5._id_4F00 scalevolume( 0.0, 3 );
                wait 3;
                level._id_16F5._id_4F00 stopsounds();
                wait 0.5;
                level._id_16F5._id_4F00 delete();
            }

            break;
        case "mus_player_at_top_of_hotel_stairwell":
            maps\_audio_music::_id_15A7( "bln_player_at_top_of_hotel_stairwell", 10 );
            break;
        case "mus_reverse_breach_start":
            maps\_audio_music::_id_15A8( 5 );
            break;
        case "mus_reverse_breach_getup_regular_speed":
            maps\_audio_music::_id_15A7( "bln_reverse_breach_getup_regular_speed", 3 );
            break;
        default:
            var_2 = 0;
            maps\_audio::_id_1466( "\\tMUSIC MESSAGE NOT HANDLED: " + var_0 );
            break;
    }

    return var_2;
}

_id_4F01( var_0 )
{
    common_scripts\utility::flag_wait( "aud_intro_flight_landed" );

    if ( isdefined( var_0 ) )
        var_0 scalevolume( 0.65, 8 );
}

_id_4F02( var_0, var_1 )
{
    wait(var_0);
    thread maps\_audio_mix_manager::_id_1520( "berlin_building_collapse", var_1 );
}

_id_4F03( var_0 )
{
    var_1 = maps\_audio::_id_15B3( var_0, level._id_16F5._id_440B[level._id_16F5._id_4EFF] );
    var_2 = 0.01;
    maps\_audio_mix_manager::_id_151A( level._id_16F5._id_4EDB, var_1, var_2 );
}

_id_4F04()
{
    level waittill( "a10_gound_impacts_stop" );
    level._id_16F5._id_4ED8 = undefined;
}

_id_4F05()
{
    common_scripts\utility::loop_fx_sound( "aabuilding_stairwell_window_amb", ( 1892.0, 3891.0, 1315.0 ), 1 );
}

_id_4F06()
{
    common_scripts\utility::loop_fx_sound( "berl_fire_heatcreaks_lp", ( 2493.0, 2640.0, 35.0 ), 1 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_metal_med", ( 2493.0, 2640.0, 35.0 ), "littlebird_metal_01", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 2493.0, 2640.0, 35.0 ), "littlebird_wide_spread_01", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_med", ( 2535.0, 2620.0, 22.0 ), "littlebird_wide_spread_crackle", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 2249.0, 2801.0, 16.0 ), "littlebird_crackle_18", 700, 1.0 );
}

_id_4F07()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 30715.0, 4294.0, 263.0 ), "collapse_entrance_left", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 30656.0, 4333.0, 247.0 ), "collapse_entrance_leftmid", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 30707.0, 4498.0, 276.0 ), "collapse_entrance_rightmid", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_med", ( 30741.0, 4549.0, 294.0 ), "collapse_entrance_right", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_metal_med", ( 31724.0, 5164.0, 180.0 ), "collapse_tank", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 30301.0, 5750.0, 403.0 ), "pre_emerge_left", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 30273.0, 5849.0, 399.0 ), "pre_emerge_right", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_crackle_med", ( 30156.0, 5779.0, 401.0 ), "pre_emerge_center", 600, 1.0 );
    common_scripts\utility::loop_fx_sound( "berl_emt_firejet", ( 31156.0, 5409.0, 310.0 ), 1 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_gas_med_tight", ( 31156.0, 5409.0, 310.0 ), "jet_01", 600, 1.0 );
    common_scripts\utility::loop_fx_sound( "berl_emt_firejet", ( 30634.0, 6078.0, 319.0 ), 1 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_gas_med_tight", ( 30634.0, 6078.0, 319.0 ), "jet_02", 600, 1.0 );
}

_id_4F08()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_metal_med", ( 2772.0, 1408.0, 12.0 ), "car_metal_01", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_metal_med", ( 30718.0, 7159.0, 83.0 ), "car_metal_02", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 29800.0, 7610.0, 158.0 ), "burning_tree", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 30077.0, 7517.0, 386.0 ), "hotel_lobby_L", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med", ( 30239.0, 7361.0, 438.0 ), "hotel_lobby_R", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 30809.0, 8582.0, 225.0 ), "hotel_lobby_farwall", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 29906.0, 8194.0, 649.0 ), "hotel_dresser", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 29997.0, 8037.0, 686.0 ), "hotel_wall", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_wood_med_tight", ( 29849.0, 7789.0, 613.0 ), "hotel_chair", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_rock_sml", ( 30128.0, 8422.0, 587.0 ), "hotel_trashcan", 600, 1.0 );
}

_id_4F09()
{
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips", ( 1700.0, 5363.0, 1052.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips", ( 1566.0, 4743.0, 1051.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_collapse", ( 30137.0, 4572.0, 256.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_bathroom_drips", ( 29938.0, 4578.0, 376.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_collapse", ( 31077.0, 5045.0, 240.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_pipe_spray_ground", ( 1574.0, 4717.0, 1052.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_faucet_spray_splatter", ( 1574.0, 4717.0, 1052.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_bathroom_drips", ( 30805.0, 5072.0, 332.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_splatter_large", ( 30828.0, 4965.0, 256.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_faucet_spray_splatter", ( 30828.0, 4965.0, 256.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_bathroom_sinkleak", ( 30971.0, 5080.0, 303.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_faucet_spray", ( 30763.0, 4882.0, 266.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_bathroom", ( 30660.0, 5023.0, 280.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_bathroom", ( 30793.0, 4922.0, 269.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_bathroom", ( 30797.0, 5041.0, 251.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_bathroom", ( 30761.0, 5278.0, 298.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_toilet_flooding", ( 30937.0, 5009.0, 254.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_drain", ( 30824.0, 5194.0, 240.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_collapse", ( 30465.0, 4474.0, 150.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_collapse", ( 30428.0, 4335.0, 171.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "berlin_emt_water_drips_collapse", ( 31004.0, 5002.0, 271.0 ), 1 );
}

_id_4F0A()
{
    common_scripts\utility::loop_fx_sound( "blin_wind_heavy_lp", ( 1019.0, 5627.0, 1000.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "blin_wind_heavy_lp", ( 1831.0, 3891.0, 1400.0 ), 1 );
}

_id_4F0B()
{
    thread _id_44CA( "berlin_hotel_lobby_tv_trigger", "berlin_hotel_lobby_tv", "berl_hotel_tv_news_lp" );
}

_id_4F0C( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1.origin );
    var_3 linkto( var_1 );
    var_4 = "oneshot";

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( var_4 == "loop" )
        var_3 playloopsound( var_0 );
    else
        var_3 playsound( var_0 );
}

_id_4F0D( var_0 )
{
    var_1 = getaiarray( "bad_guys" );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( isalive( var_4 ) )
        {
            var_5 = distance( level.player.origin, var_4.origin );

            if ( var_5 < var_0 )
                var_2++;
        }
    }

    return var_2;
}

_id_4F0E( var_0, var_1 )
{
    var_2 = 1;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( isdefined( self ) )
    {
        common_scripts\utility::waittill_any( "deathspin", "death" );
        var_0 scalevolume( 0.0, var_2 );
        wait(var_2);
        wait 0.1;
        var_0 stopsounds();
        wait 0.1;
        var_0 delete();
    }
}

_id_44DA()
{
    self endon( "deathspin" );
    self endon( "death" );

    while ( isdefined( self ) )
    {
        self waittill( "missile_fired", var_0 );

        if ( isdefined( var_0 ) )
            var_0 thread _id_44DB();

        wait 0.05;
    }
}

_id_44DB()
{
    thread maps\_audio::_id_15D7( "heli_missile_launch", self );
    self waittill( "explode", var_0 );
    thread common_scripts\utility::play_sound_in_space( "heli_missile_explo", var_0 );
}

_id_4F0F()
{
    if ( isdefined( self ) )
    {
        var_0 = spawn( "script_origin", self.origin );
        var_0 linkto( self );
        var_0 playloopsound( "t90_treads_dist_01" );
        var_0 scalevolume( 0.0, 0.05 );
        wait 0.05;
        var_0 scalevolume( 0.5, 0.5 );
        thread _id_4F10();
        self waittill( "death" );
        wait 0.5;
        var_0 stopsounds();
        wait 0.5;
        var_0 delete();
    }
}

_id_4F10()
{
    if ( isdefined( self ) )
    {
        for (;;)
        {
            self endon( "death" );
            self waittill( "weapon_fired" );
            _id_4F11();
        }
    }
}

_id_4F11()
{
    if ( isdefined( self ) )
    {
        thread common_scripts\utility::play_sound_in_space( "ac130_main_impact_3d", self.origin );
        thread common_scripts\utility::play_sound_in_space( "t90_fire_dist", self.origin );
        thread _id_4F12();
        wait 0.2;
        maps\_audio::_id_1794( "t90_dist_verb" );
    }
}

_id_4F12()
{
    if ( isdefined( self ) )
    {
        thread common_scripts\utility::play_sound_in_space( "t90_whizby_split_01_L", self.origin );
        thread common_scripts\utility::play_sound_in_space( "t90_whizby_split_01_R", ( -2043.0, 8012.0, 14880.0 ) );
    }
}

_id_4F13()
{
    if ( isdefined( self ) )
    {
        for (;;)
        {
            self endon( "death" );
            self waittill( "weapon_fired" );
        }
    }
}

_id_4F14()
{
    level endon( "aud_kill_last_stand_tanks" );
    self endon( "death" );

    if ( isdefined( self ) )
    {
        for (;;)
        {
            self waittill( "weapon_fired" );
            thread _id_4F19();
            var_0 = randomfloatrange( 0.2, 0.4 );
            thread common_scripts\utility::play_sound_in_space( "rus_tank_big_boom", self.origin );
            thread common_scripts\utility::play_sound_in_space( "rus_tank_fire_dist", self.origin );
            thread common_scripts\utility::play_sound_in_space( "rus_tank_fire_close", self.origin );
            thread common_scripts\utility::play_sound_in_space( "rus_tank_fire_hi_ring", self.origin );
            thread common_scripts\utility::play_sound_in_space( "rus_tank_fire_lfe", self.origin );
            wait 0.2;
            thread common_scripts\utility::play_sound_in_space( "rus_tank_dist_verb", self.origin );
            wait(var_0);
            thread _id_4F1B();
        }
    }
}

_id_4F15()
{
    level endon( "aud_stop_fake_tanks" );
    common_scripts\utility::flag_wait( "aud_dist_tank_battle" );
    wait 7;

    for (;;)
    {
        var_0 = maps\_audio_zone_manager::_id_1578();

        if ( var_0 == "berlin_street_dense_postrappel" || var_0 == "berlin_street_dense_postrappel_bookstore" )
        {
            var_1 = randomintrange( 4, 6 );
            thread _id_4F16();
            wait(var_1);
        }

        wait 0.3;
    }
}

_id_4F16()
{
    var_0 = randomint( 7 );
    var_1 = _id_4F17();
    var_2 = [ "01", "02", "03", "04", "05", "06", "07" ];
    var_3 = var_2[var_0];
    thread common_scripts\utility::play_sound_in_space( "dist_tank_battle_L_" + var_3, var_1[0] );
    wait 0.25;
    thread common_scripts\utility::play_sound_in_space( "dist_tank_battle_R_" + var_3, var_1[1] );
}

_id_4F17()
{
    var_0 = randomint( 3 );
    var_1 = [ ( 1922.0, -663.0, 723.0 ), ( 1179.0, 272.0, 723.0 ), ( 3440.0, 1713.0, 620.0 ) ];
    var_2 = [ ( 228.0, 1338.0, 900.0 ), ( 1874.0, 1108.0, 739.0 ), ( 2808.0, 2797.0, 739.0 ) ];
    var_3 = [ ( 5290.0, -755.0, 579.0 ), ( 2933.0, -1226.0, 579.0 ), ( 2808.0, 2797.0, 739.0 ) ];

    if ( var_0 == 0 )
        return var_1;
    else if ( var_0 == 1 )
        return var_2;
    else if ( var_0 == 2 )
        return var_3;
}

_id_4F18()
{
    level endon( "aud_kill_ally_tanks" );
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        self waittill( "weapon_fired" );
        thread _id_4F19();
        var_0 = randomfloatrange( 0.2, 0.4 );
        thread common_scripts\utility::play_sound_in_space( "us_tank_big_boom", self.origin );
        thread common_scripts\utility::play_sound_in_space( "us_tank_fire_dist", self.origin );
        thread common_scripts\utility::play_sound_in_space( "us_tank_fire_close", self.origin );
        thread common_scripts\utility::play_sound_in_space( "us_tank_fire_hi_ring", self.origin );
        thread common_scripts\utility::play_sound_in_space( "us_tank_fire_lfe", self.origin );
        wait 0.2;
        thread common_scripts\utility::play_sound_in_space( "us_tank_dist_verb", self.origin );
        wait(var_0);
        thread _id_4F1B();
    }
}

_id_4F19()
{
    if ( !isdefined( self ) )
        return;

    var_0 = 350;
    var_1 = 1.5;
    var_2 = 2;
    var_3 = 1.5;
    var_4 = distance( level.player.origin, self.origin );

    if ( var_4 < var_0 )
    {
        maps\_audio_mix_manager::_id_1517( "berlin_tank_shock", 0.05 );
        maps\_audio::_id_1570( "berlin_tank_shock", 1 );
        thread _id_4F1A();
        earthquake( 1, 1, level.player.origin, 1000 );
        wait 0.1;
        maps\_audio::_id_1794( "tank_shock_impact" );
        maps\_audio::_id_1794( "tank_shock_impact" );
        wait(var_1);
        maps\_audio_mix_manager::_id_1520( "berlin_tank_shock", var_3 );
        wait(var_2);
        maps\_audio::_id_172B( 1 );
    }
}

_id_4F1A()
{
    wait 0.2;
    var_0 = maps\_audio::_id_1794( "tank_shock_lfe" );
    wait 1.3;
    var_0 scalevolume( 0.0, 2 );
}

_id_4F1B()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 linkto( self );
    var_0 playsound( "us_tank_hydraulics_move", "sounddone" );
    self waittill( "weapon_fired" );
    thread maps\_audio::_id_15F3( var_0, 0.05 );
}

_id_4409( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( self ) )
        return;

    level._id_16F5._id_15D8 = spawn( "script_origin", self.origin );
    var_6 = spawn( "script_origin", self.origin );
    var_7 = spawn( "script_origin", self.origin );
    var_8 = spawn( "script_origin", self.origin );
    level._id_16F5._id_15D8._id_17CC = 1;
    var_9 = level._id_16F5._id_15D8;
    var_10 = level._id_16F5._id_15D8._id_17CC;
    var_6 linkto( self );
    var_8 linkto( self );
    var_7 linkto( self );

    if ( isdefined( var_6 ) || isdefined( var_1 ) )
        var_6 playloopsound( var_1 );

    if ( isdefined( var_7 ) || isdefined( var_2 ) )
        var_7 playloopsound( var_2 );

    if ( isdefined( var_8 ) || isdefined( var_3 ) )
        var_8 playloopsound( var_3 );

    var_6 scalevolume( 0.0 );
    var_7 scalevolume( 0.0 );
    var_8 scalevolume( 0.0 );
    wait 0.3;
    _id_440A( var_9, var_6, var_7, var_8, 1, 5, var_10, var_4, var_5 );
}

_id_440A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( self ) )
        return;

    var_4 = 1;
    var_5 = 5;

    if ( isdefined( var_7 ) )
        var_4 = var_7;

    if ( isdefined( var_8 ) )
        var_5 = var_8;

    thread _id_440D( var_0, var_1, var_2, var_3 );
    thread _id_440C();
    var_0 endon( "instance_killed" );
    var_9 = 0;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_10 = self vehicle_getspeed();
        var_10 = min( var_10, var_5 );
        var_10 = maps\_audio::_id_178B( var_9, var_10, 0.1 );
        var_11 = maps\_audio::_id_178A( var_10, var_4, var_5, level._id_16F5._id_440B["veh_drive_vol"] );
        var_12 = maps\_audio::_id_178A( var_10, var_4, var_5, level._id_16F5._id_440B["veh_idle_vol"] );
        var_2 scalevolume( var_11, 0.1 );
        var_1 scalevolume( var_11, 0.1 );
        var_3 scalevolume( var_12, 0.1 );
        var_9 = var_10;
        wait 0.1;
    }
}

_id_440C()
{
    level._id_16F5._id_440B["veh_drive_vol"] = [ [ 0.0, 0.0 ], [ 0.05, 0.1 ], [ 0.1, 0.1 ], [ 0.2, 0.2 ], [ 0.3, 0.3 ], [ 0.4, 0.4 ], [ 0.5, 0.5 ], [ 0.6, 0.6 ], [ 0.8, 0.8 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["veh_idle_vol"] = [ [ 0.0, 1.0 ], [ 0.05, 0.85 ], [ 0.1, 0.6 ], [ 0.2, 0.5 ], [ 0.3, 0.4 ], [ 0.4, 0.1 ], [ 0.5, 0.0 ], [ 0.6, 0.0 ], [ 0.8, 0.0 ], [ 1.0, 0.0 ] ];
}

_id_440D( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self ) )
        return;

    self waittill( "death" );
    var_0 notify( "instance_killed" );
    thread _id_440F( var_1, 5 );
    thread _id_440F( var_2, 5 );
    thread _id_440F( var_3, 5 );
}

_id_440F( var_0, var_1 )
{
    var_0 scalevolume( 0.0, var_1 );
    wait(var_1 + 0.05);
    var_0 stoploopsound();
    wait 0.05;
    var_0 delete();
}

_id_44A9( var_0 )
{
    self scalevolume( 0.0, var_0 );
}

_id_44AA( var_0, var_1 )
{
    var_2 = 1.0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    self scalevolume( 0.0 );
    wait 0.01;
    self scalevolume( var_2, var_0 );
}

_id_4F1C( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "ceiling_fall_trigger":
            var_2 = var_1;
            thread maps\_audio::_id_15D7( "bln_gravity_ceiling_collapse", var_2 );
            break;
        case "beam_fall_trigger":
            var_2 = var_1;
            thread maps\_audio::_id_15D7( "bln_gravity_beam_fall_01", var_2 );
            break;
        case "falling_office_objects_trigger":
            wait 1.5;
            thread common_scripts\utility::play_sound_in_space( "bln_office_chair_fall_01", ( 31538.0, 5681.0, 93.0 ) );
            break;
        case "ibeam_fall2_trigger":
            var_2 = var_1;
            thread maps\_audio::_id_15D7( "bln_gravity_beam_fall_03", var_2 );
            break;
        case "ibeam_fall_trigger":
            var_2 = var_1;
            var_3 = thread maps\_audio::_id_15D7( "bln_gravity_beam_fall_02", var_2 );

            if ( isdefined( var_3 ) )
            {
                var_3 waittill( "sounddone" );
                common_scripts\utility::flag_set( "aud_ibeam_fall_complete" );
            }

            break;
        case "falling_office_objects_trigger2":
            wait 1.6;
            thread common_scripts\utility::play_sound_in_space( "bln_office_chair_fall_02", ( 30758.0, 5859.0, 231.0 ) );
            break;
        default:
            maps\_audio::_id_1466( "\\tFALLING OBJECT NOT HANDLED: " + var_0 );
    }
}

_id_4988()
{
    soundsettimescalefactor( "announcer", 0 );
    soundsettimescalefactor( "mission", 0 );
    soundsettimescalefactor( "norestrict2d", 0 );
    soundsettimescalefactor( "music", 0 );
    soundsettimescalefactor( "local", 0.25 );
    soundsettimescalefactor( "local3", 0.25 );
    soundsettimescalefactor( "weapon", 0.15 );
    soundsettimescalefactor( "grondo2d", 0 );
    soundsettimescalefactor( "bulletimpact", 0 );
    soundsettimescalefactor( "bulletflesh1", 0 );
    soundsettimescalefactor( "bulletflesh2", 0 );
    soundsettimescalefactor( "bulletwhizby", 0 );
}

_id_4F1D()
{
    maps\_audio_mix_manager::_id_1517( "berlin_reverse_breach", 0.05 );
    maps\_audio_mix_manager::_id_1520( "berlin_reverse_breach_setup", 0.05 );
    maps\_audio::_id_1794( "bln_rvrs_breach_transient" );
    maps\_audio::_id_1795( "bln_rvrs_breach_explo_front", 0.05, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_bodyfall", 2.0, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_debris_front", 2.33, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_synth", 3.48, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_slowmo_heli", 6.48, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_slowmo_outro", 8.67, 1 );
    common_scripts\utility::flag_wait( "breach_weapon_drawn" );
    maps\_audio_mix_manager::_id_1520( "berlin_reverse_breach", 0.05 );
    maps\_audio_mix_manager::_id_1517( "berlin_pistol_boost", 0.05 );
    thread _id_4F1E();
    common_scripts\utility::flag_wait( "reverse_breach_complete" );
    maps\_audio::_id_1795( "bln_rvrs_breach_getup_foley_start", 0.68, 1 );
    thread maps\_audio::_id_1712( "bln_rvrs_breach_getup_foley", 2.68 );
    maps\_audio::_id_1795( "bln_rvrs_breach_getup_slomo_heli", 2.6, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_getup_whoosh_front", 2.79, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_getup_tonal_1", 4.26, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_getup_tonal_2", 5.75, 1 );
    maps\_audio::_id_1795( "bln_rvrs_breach_blowing_paper", 7.0, 1 );
    maps\_audio::_id_17BF( 8.75 );
    common_scripts\utility::play_sound_in_space( "bln_rvrs_breach_getup_heli_flyaway", ( 30504.0, 7019.0, 987.0 ) );
}

_id_4F1E()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 linkto( level.player );
    var_0 playloopsound( "bln_finale_heli_hover" );
    var_0 scalevolume( 0.0 );
    wait 0.01;
    var_0 scalevolume( 1.0, 0.5 );
    common_scripts\utility::flag_wait( "reverse_breach_complete" );
    wait 3;
    var_0 scalevolume( 0.0, 1.5 );
    wait 1.5;
    wait 0.1;
    var_0 stopsounds();
    var_0 delete();
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

_id_4F1F()
{
    common_scripts\utility::flag_wait( "reverse_breach_getup_slowmo_start" );
    wait 1.2;
    maps\_audio::_id_1794( "bln_daughter_scream_exit" );
}

_id_4F20()
{
    level endon( "exited_collapse_building" );

    for (;;)
    {
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy_01", ( 30521.0, 5669.0, -186.0 ) );
        var_0 = randomfloatrange( 1.5, 3.5 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy_02", ( 30521.0, 5669.0, -186.0 ) );
        var_0 = randomfloatrange( 2.5, 5.0 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy_03", ( 30521.0, 5669.0, -186.0 ) );
        var_0 = randomfloatrange( 0.5, 3.0 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy_04", ( 30521.0, 5669.0, -186.0 ) );
        var_0 = randomfloatrange( 0.5, 3.5 );
        wait(var_0);
    }
}

_id_4F21()
{
    level endon( "exited_collapse_building" );

    for (;;)
    {
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy2_01", ( 30544.0, 6110.0, -22.0 ) );
        var_0 = randomfloatrange( 1.5, 3.5 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy2_02", ( 30544.0, 6110.0, -22.0 ) );
        var_0 = randomfloatrange( 2.5, 5.0 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy2_03", ( 30544.0, 6110.0, -22.0 ) );
        var_0 = randomfloatrange( 0.5, 3.0 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy2_04", ( 30544.0, 6110.0, -22.0 ) );
        var_0 = randomfloatrange( 0.5, 3.5 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_guy2_05", ( 30544.0, 6110.0, -22.0 ) );
        var_0 = randomfloatrange( 0.5, 3.5 );
        wait(var_0);
    }
}

_id_4F22()
{
    level endon( "exited_collapse_building" );

    for (;;)
    {
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_german_01", ( 30889.0, 5629.0, -109.0 ) );
        var_0 = randomfloatrange( 1.0, 2.5 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_german_02", ( 30889.0, 5629.0, -109.0 ) );
        var_0 = randomfloatrange( 1.5, 3.0 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_german_03", ( 30889.0, 5629.0, -109.0 ) );
        var_0 = randomfloatrange( 0.5, 1.5 );
        wait(var_0);
        common_scripts\utility::play_sound_in_space( "berl_emt_trapped_german_04", ( 30889.0, 5629.0, -109.0 ) );
        var_0 = randomfloatrange( 0.5, 2.5 );
        wait(var_0);
    }
}

_id_0039()
{
    wait 5.6;
    maps\_audio::_id_1794( "granite_team_subtitle" );
}
