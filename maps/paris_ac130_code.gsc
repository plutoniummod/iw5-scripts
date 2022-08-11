// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_56FB()
{
    precacheshellshock( "default" );
    precacheshellshock( "paris_ac130_thermal" );
    precacheshellshock( "paris_ac130_enhanced" );
    precacheshader( "remotemissile_infantry_target" );
    precacheshader( "ac130_hud_diamond" );
    precacheshader( "ac130_hud_tag" );
    precacheshader( "hud_fofbox_self_sp" );
    precacheshader( "uav_vehicle_target" );
    precacheshader( "veh_hud_target" );
    precacheshader( "overlay_static" );
    precacheshader( "ac130_overlay_pip_vignette" );
    precacheshader( "ac130_overlay_pip_static_a" );
    precacheshader( "ac130_overlay_pip_static_b" );
    precacheshader( "ac130_overlay_pip_static_c" );
    precacheshader( "compass_map_paris_ac130" );
    precacheshader( "compass_map_paris_ac130_intro" );
    precacheshader( "compass_map_paris_ac130_courtyard" );
    precacheshader( "compass_map_paris_ac130_bridge" );
    precachestring( &"PARIS_AC130_PRESS_TO_DROP" );
    precachestring( &"PARIS_AC130_MISSION_FAIL_DELTA_KILLED" );
    precachestring( &"PARIS_AC130_MISSION_FAIL_HVI_KILLED" );
    precachestring( &"PARIS_AC130_MISSION_FAIL_FRIENDLY_KILLED" );
    precachestring( &"PARIS_AC130_MISSION_FAIL_FRIENDLY_SUPPORT" );
    precachestring( &"PARIS_AC130_MISSION_FAIL_BUILDING" );
    precachestring( &"PARIS_AC130_MISSION_FAIL_HUMVEE_SUPPORT" );
    precachestring( &"PARIS_AC130_OBJ_INTRO_GET_TO_OSPREY" );
    precachestring( &"PARIS_AC130_OBJ_FDR_CLEAR_AREA_FOR_KILO_1_1" );
    precachestring( &"PARIS_AC130_OBJ_STREET_CLEAR_STREET_FOR_KILO_1_1" );
    precachestring( &"PARIS_AC130_OBJ_RPG_DESTROY_RPG_BUILDING" );
    precachestring( &"PARIS_AC130_OBJ_CHASE_ESCORT_KILO_1_1" );
    precachestring( &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK" );
    precachestring( &"PARIS_AC130_OBJ_FLANK_MG_NEST" );
    precachestring( &"PARIS_AC130_OBJ_SHOOT_COURTYARD_BUILDING" );
    precachestring( &"PARIS_AC130_OBJ_FIGHT_THROUGH_COURTYARD" );
    precachestring( &"PARIS_AC130_DESTROY_ENEMY_TANKS" );
    precachestring( &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK_JAV_2" );
    precachestring( &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK_JAV_1" );
    precachestring( &"PARIS_AC130_OBJ_BRIDGE_DESTROY_TANK_JAV_COMPLETED" );
    precachestring( &"PARIS_AC130_OBJ_BRIDGE_GET_JAVELIN" );
    precachestring( &"PARIS_AC130_OBJ_BRIDGE_PUSH_LZ" );
    precachestring( &"PARIS_AC130_OBJ_BOARD_THE_LITTLEBIRD" );
    precachestring( &"PARIS_AC130_OBIT_CUSTOM_TANK_DEATH" );
    precachestring( &"PARIS_AC130_OBJ_DEFEND_LZ" );
    precachestring( &"PARIS_AC130_DEATHQUOTE_CHASE_1" );
    precachestring( &"PARIS_AC130_DEATHQUOTE_CHASE_2" );
    precachestring( &"PARIS_AC130_HINT_INTERACT" );
    precachestring( &"PARIS_AC130_INTROSCREEN_LINE_1" );
    precachestring( &"PARIS_AC130_INTROSCREEN_LINE_2" );
    precachestring( &"PARIS_AC130_INTROSCREEN_LINE_3" );
    precachestring( &"PARIS_AC130_INTROSCREEN_LINE_4" );
    precachestring( &"PARIS_AC130_AIR_SUPPORT_HINT" );
    precachestring( &"PARIS_AC130_OBJ_THROW_STROBE" );
    precachestring( &"PARIS_AC130_OBJ_PROTECT" );
    precachestring( &"PARIS_AC130_END_SCRIPT" );
    precachemodel( "vehicle_mig29_low" );
    precachemodel( "vehicle_cobra_helicopter_d" );
    precachemodel( "vehicle_blackhawk_crash" );
    precachemodel( "vehicle_v22_osprey" );
    precachemodel( "test_box" );
    precachemodel( "tag_laser" );
    precachemodel( "weapon_rpg7" );
    precachemodel( "weapon_ak47" );
    precachemodel( "weapon_m16" );
    precachemodel( "weapon_javelin_obj" );
    precachemodel( "angel_flare_rig" );
    precachemodel( "ss_n_12_missile" );
    precachemodel( "weapon_minigun" );
    precachemodel( "viewlegs_generic" );
    precachemodel( "viewhands_player_delta" );
    precachemodel( "viewhands_delta" );
    precachemodel( "vehicle_f15_missile" );
    precachemodel( "projectile_us_smoke_grenade" );
    precachemodel( "vehicle_hummer" );
    precachemodel( "vehicle_mi17_woodland_fly_cheap" );
    precachemodel( "ac_prs_enm_barge_a_1" );
    precachemodel( "ac_prs_enm_barge_a_2" );
    precachemodel( "ac_prs_enm_barge_a_1_dam_animated" );
    precachemodel( "ac_prs_enm_barge_a_2_dam_animated" );
    precachemodel( "ac_prs_enm_barrels_a_1" );
    precachemodel( "ac_prs_enm_barrels_a_2" );
    precachemodel( "ac_prs_enm_cargo_crate_a_1" );
    precachemodel( "ac_prs_enm_con_digger_a" );
    precachemodel( "ac_prs_enm_con_dump_truck_a" );
    precachemodel( "ac_prs_enm_crates_a_1" );
    precachemodel( "ac_prs_enm_crates_a_2" );
    precachemodel( "ac_prs_enm_crates_b_1" );
    precachemodel( "ac_prs_enm_crates_b_2" );
    precachemodel( "ac_prs_enm_fuel_tank_a" );
    precachemodel( "ac_prs_enm_maz_a" );
    precachemodel( "ac_prs_enm_mi26_halo_a" );
    precachemodel( "ac_prs_enm_missile_boat_a" );
    precachemodel( "ac_prs_enm_mobile_crane_a" );
    precachemodel( "ac_prs_enm_mstas_a" );
    precachemodel( "ac_prs_enm_radar_maz_a" );
    precachemodel( "ac_prs_enm_s300v_a" );
    precachemodel( "ac_prs_enm_speed_boat_a" );
    precachemodel( "ac_prs_enm_storage_bld_a_1" );
    precachemodel( "ac_prs_enm_storage_bld_a_2" );
    precachemodel( "ac_prs_enm_storage_bld_b" );
    precachemodel( "ac_prs_enm_tent_a" );
    precachemodel( "ac_prs_enm_tent_b" );
    precachemodel( "ac_prs_enm_tent_c" );
    precachemodel( "ac_prs_enm_truck_a" );
    precachemodel( "ac_prs_enm_watch_tower_a" );
    precachemodel( "weapon_m16" );
    precachemodel( "vehicle_gaz_tigr_harbor_destroyed" );
    precachemodel( "ac_prs_enm_fuel_tank_a_dam" );
    precachemodel( "ac_prs_enm_mi26_halo_a_dam" );
    precachemodel( "ac_prs_enm_storage_bld_a_1_dam" );
    precachemodel( "ac_prs_enm_storage_bld_a_2_dam" );
    precachemodel( "ac_prs_enm_storage_bld_b_dam" );
    precachemodel( "ac_prs_enm_tent_a_dam1" );
    precachemodel( "ac_prs_enm_tent_b_dam1" );
    precachemodel( "ac_prs_enm_tent_c_dam1" );
    precachemodel( "ac_prs_enm_truck_a_dam" );
    precachemodel( "ac_prs_enm_s300v_dam" );
    precacheitem( "m16_ac130_basic" );
    precacheitem( "ak47_ac130" );
    precacheitem( "ac130_sam" );
    precacheitem( "ac130_sam_fast" );
    precacheitem( "apache_ac130_turret" );
    precacheitem( "hydra_ac130_rocket" );
    precacheitem( "rpg" );
    precacheitem( "rpg_player" );
    precacheitem( "rpg_straight" );
    precacheitem( "rpg_straight_ac130" );
    precacheitem( "t72_turret" );
    precacheitem( "btr80_ac130_turret" );
    precacheitem( "f15_20mm" );
    precacheitem( "f15_missile" );
    precacheitem( "t72_125mm" );
    precacheitem( "usp" );
    precacheitem( "usp_no_knife" );
    precacheitem( "fraggrenade" );
    precacheitem( "flash_grenade" );
    precacheitem( "javelin" );
    precacheitem( "msr" );
    precacheitem( "ac130_40mm_air_support_strobe" );
    precacheitem( "ac130_40mm_air_support_strobe_iw" );
    precacheitem( "ac130_40mm" );
    precacheitem( "ac130_25mm" );
    precacheitem( "ac130_105mm" );
    precachemodel( "weapon_javelin" );
    precachemodel( "vehicle_mig29_destroyed_back_version2" );
    precachemodel( "vehicle_mig29_destroyed_front" );
    precachemodel( "vehicle_a10_warthog" );
    maps\_utility::add_hint_string( "HINT_interact_button_pressed", &"PARIS_AC130_HINT_INTERACT", ::_id_6284 );
    maps\_utility::add_hint_string( "air_support_hint", &"PARIS_AC130_AIR_SUPPORT_HINT", maps\paris_ac130_slamzoom::_id_5138 );
}

_id_6227()
{

}

_id_6228()
{

}

_id_6229()
{
    level._id_622A = [];
    level._id_622B = [];
    level._id_622C = [];
    level._id_622D = [];
    level._id_6132 = [];
    level._id_622E = [];
    level._id_622F = [];
    level._id_6230 = [];
    level._id_6231 = [];
    level._id_479C = [];
    level._id_6232 = [];
    level._id_6233 = 0;
    level._id_6234 = 0;
    level._id_6235 = 0;
    level._id_6236 = 0;
    level._id_6237 = 0;
    level._id_6238 = 0;
    level._id_6239 = 1000;
    level._id_623A = 0.15;
    level._id_623B = 0.15;
    level._id_623C = 0.2;
    level._id_45C0 = undefined;
    level._id_6133 = undefined;
    level._id_6134 = undefined;
    level._id_6135 = undefined;
    level._id_6126 = undefined;
    level._id_6127 = undefined;
    level._id_623D = undefined;
    level._id_473D = undefined;
    level._id_5EB8 = undefined;
    level._id_614D = undefined;
    level._id_614E = undefined;
    level._id_623E = [];
    level._id_623F = undefined;
    level._id_6240 = undefined;
    level._id_6241 = undefined;
    level._id_6242 = undefined;
    level._id_6243 = undefined;
    level._id_6244 = undefined;
    level._id_6245 = undefined;
    level._id_6246 = undefined;
    level._id_6247 = undefined;
    level._id_6248 = undefined;
    level._id_6249 = undefined;
    level._id_624A = undefined;
    level._id_5E9A = 0;
    level._id_5E9B = 0;
    level._id_5E9C = 0;
    level._id_5E9D = 0;
    level._id_5E9E = 0;
    level._id_5E9F = 0;
    level._id_5EA0 = 0;
    level._id_624B = 0;
    level._id_624C = 0;
    level._id_624D = 0;
    level._id_624E = [];
    level._id_624E[0] = common_scripts\utility::getstruct( "city_area_fdr_1_battle_line", "targetname" );
    level._id_624E[1] = common_scripts\utility::getstruct( "city_area_ma_1_battle_line", "targetname" );
    level._id_624E[2] = common_scripts\utility::getstruct( "city_area_ma_2_battle_line", "targetname" );
    level._id_624E[3] = common_scripts\utility::getstruct( "city_area_ma_3_battle_line", "targetname" );
    level._id_624E[4] = common_scripts\utility::getstruct( "city_area_rb_1_battle_line", "targetname" );
    level._id_624F = [];
    var_0 = _id_5F9E::_id_5F90( "city_area_fdr_street_line_", "targetname", 0 );
    level._id_624F[0] = ( var_0[1].origin[1] - var_0[0].origin[1] ) / ( var_0[1].origin[0] - var_0[0].origin[0] );
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_street_line_", "targetname", 0 );
    level._id_624F[1] = ( var_0[1].origin[1] - var_0[0].origin[1] ) / ( var_0[1].origin[0] - var_0[0].origin[0] );
    var_0 = _id_5F9E::_id_5F90( "city_area_rb_street_line_", "targetname", 0 );
    level._id_624F[2] = ( var_0[1].origin[1] - var_0[0].origin[1] ) / ( var_0[1].origin[0] - var_0[0].origin[0] );
    maps\paris_ac130_pip::_id_60E4();
}

_id_6250()
{
    setdvarifuninitialized( "mission_fail_enabled", 1 );
    setdvarifuninitialized( "pip_enabled", 1 );
}

_id_6251()
{
    common_scripts\utility::flag_init( "FLAG_start_intro" );
    common_scripts\utility::flag_init( "FLAG_start_ac130" );
    common_scripts\utility::flag_init( "FLAG_start_fdr" );
    common_scripts\utility::flag_init( "FLAG_start_e3" );
    common_scripts\utility::flag_init( "FLAG_start_street" );
    common_scripts\utility::flag_init( "FLAG_start_rpg" );
    common_scripts\utility::flag_init( "FLAG_start_courtyard" );
    common_scripts\utility::flag_init( "FLAG_start_chase" );
    common_scripts\utility::flag_init( "FLAG_start_bridge" );
    common_scripts\utility::flag_init( "FLAG_start_bridge_collapse" );
    common_scripts\utility::flag_init( "FLAG_building_trigger_mission_failed_on" );
    common_scripts\utility::flag_init( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_init( "FLAG_end_ambient_ac130_effects" );
    common_scripts\utility::flag_init( "FLAG_ambient_ac130_close_jets" );
    common_scripts\utility::flag_init( "FLAG_ambient_ac130_close_mi17s" );
    common_scripts\utility::flag_init( "FLAG_intro_opening_jet_dog_fight_starting" );
    common_scripts\utility::flag_init( "FLAG_intro_opening_jet_dog_fight_finished" );
    common_scripts\utility::flag_init( "FLAG_intro_ambient_jet_dog_fights_active" );
    common_scripts\utility::flag_init( "FLAG_intro_osprey_event" );
    common_scripts\utility::flag_init( "FLAG_intro_osprey_1_crash_ready" );
    common_scripts\utility::flag_init( "FLAG_intro_player_knockout_start" );
    common_scripts\utility::flag_init( "FLAG_intro_player_knockout_started" );
    common_scripts\utility::flag_init( "FLAG_intro_osprey_1_minigun_stop" );
    common_scripts\utility::flag_init( "FLAG_intro_osprey_1_crash_start" );
    common_scripts\utility::flag_init( "FLAG_intro_osprey_1_crash_finished" );
    common_scripts\utility::flag_init( "FLAG_intro_slamout_start" );
    common_scripts\utility::flag_init( "FLAG_intro_ambient_jet_dog_fights_end" );
    common_scripts\utility::flag_init( "FLAG_intro_dialogue_finished" );
    common_scripts\utility::flag_init( "FLAG_war_targeting_system" );
    common_scripts\utility::flag_init( "FLAG_war_mark_enemy_targets" );
    common_scripts\utility::flag_init( "FLAG_war_finished" );
    common_scripts\utility::flag_init( "FLAG_war_clean_up" );
    common_scripts\utility::flag_init( "FLAG_war_dialogue_finished" );
    common_scripts\utility::flag_init( "FLAG_fdr_intro_dialogue_finished" );
    common_scripts\utility::flag_init( "FLAG_fdr_mark_enemy_targets" );
    common_scripts\utility::flag_init( "FLAG_fdr_mark_friendly_targets" );
    common_scripts\utility::flag_init( "FLAG_fdr_ac130_circling_fdr" );
    common_scripts\utility::flag_init( "FLAG_fdr_btrs_spawned" );
    common_scripts\utility::flag_init( "FLAG_fdr_t72s_spawned" );
    common_scripts\utility::flag_init( "FLAG_fdr_enemy_vehicles_killed" );
    common_scripts\utility::flag_init( "FLAG_fdr_delta_ready_to_move_to_street" );
    common_scripts\utility::flag_init( "FLAG_fdr_kill_all_enemies" );
    common_scripts\utility::flag_init( "FLAG_fdr_carpet_bombing_timeout" );
    common_scripts\utility::flag_init( "FLAG_fdr_carpet_bombing_start" );
    common_scripts\utility::flag_init( "FLAG_fdr_carpet_bombing_finished" );
    common_scripts\utility::flag_init( "FLAG_fdr_dialogue_finished" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_delta_reached" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_encounter_start" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_encounter_complete" );
    common_scripts\utility::flag_init( "FLAG_street_ma_2_delta_move_down" );
    common_scripts\utility::flag_init( "FLAG_street_ma_2_delta_reached" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_delta_move_down" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_btr_reminder" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_btr_reached_end_of_path" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_btr_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_helicopter_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_helicopter_enemies_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_2_flank_spawned" );
    common_scripts\utility::flag_init( "FLAG_street_ma_2_flank_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_2_encounter_complete" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_sighted" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_1_unloaded" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_1_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_1_enemies_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_2_unloaded" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_2_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_helicopter_2_enemies_killed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_delta_reached" );
    common_scripts\utility::flag_init( "FLAG_street_ma_3_encounter_complete" );
    common_scripts\utility::flag_init( "FLAG_rpg_delta_move_down" );
    common_scripts\utility::flag_init( "FLAG_rpg_delta_fallback" );
    common_scripts\utility::flag_init( "FLAG_rpg_ac130_angel_flare_start" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_valid_target" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_marked" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_damaged" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_falling_down" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_destroyed" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_callout_dialgoue_finished" );
    common_scripts\utility::flag_init( "FLAG_rpg_building_dialgoue_finished" );
    common_scripts\utility::flag_init( "FLAG_courtyard_slamzoom_out_finished" );
    common_scripts\utility::flag_init( "FLAG_hvt_escape_hvt_captured" );
    common_scripts\utility::flag_init( "FLAG_chase_rb_delta_exiting_building" );
    common_scripts\utility::flag_init( "FLAG_chase_delta_ready_to_enter_vehicles" );
    common_scripts\utility::flag_init( "FLAG_chase_pfr_encounter_check" );
    common_scripts\utility::flag_init( "FLAG_chase_pfr_encounter_complete" );
    common_scripts\utility::flag_init( "FLAG_chase_delta_entered_chase_vehicles" );
    common_scripts\utility::flag_init( "FLAG_chase_main_vehicle_arrived" );
    common_scripts\utility::flag_init( "FLAG_chase_second_vehicle_arrived" );
    common_scripts\utility::flag_init( "FLAG_chase_started" );
    common_scripts\utility::flag_init( "FLAG_chase_encounter_1_complete" );
    common_scripts\utility::flag_init( "FLAG_chase_hinds_finished_shooting_rockets" );
    common_scripts\utility::flag_init( "FLAG_chase_hinds_killed" );
    common_scripts\utility::flag_init( "FLAG_chase_encounter_2_check" );
    common_scripts\utility::flag_init( "FLAG_chase_encounter_2_complete" );
    common_scripts\utility::flag_init( "FLAG_chase_transition_to_slamzoom_in" );
    common_scripts\utility::flag_init( "FLAG_chase_main_vehicle_start_end_chase" );
    common_scripts\utility::flag_init( "FLAG_chase_second_vehicle_start_end_chase" );
    common_scripts\utility::flag_init( "FLAG_chase_vehicles_1_2_killed" );
    common_scripts\utility::flag_init( "FLAG_chase_vehicles_3_4_killed" );
    common_scripts\utility::flag_init( "FLAG_chase_vehicles_5_6_killed" );
    common_scripts\utility::flag_init( "FLAG_chase_vehicles_7_8_killed" );
    common_scripts\utility::flag_init( "FLAG_chase_end_chase" );
    common_scripts\utility::flag_init( "FLAG_chase_dialogue_finished" );
    common_scripts\utility::flag_init( "FLAG_city_area_pfr_delta_move_down" );
    common_scripts\utility::flag_init( "FLAG_delta_spawned" );
    common_scripts\utility::flag_init( "FLAG_delta_ac130_mission_fail" );
    common_scripts\utility::flag_init( "FLAG_ac130_flare_event_started" );
    common_scripts\utility::flag_init( "FLAG_ac130_angel_flare_teleport" );
    common_scripts\utility::flag_init( "FLAG_ac130_shoot_angel_flares_start" );
    common_scripts\utility::flag_init( "FLAG_ac130_shoot_angel_flares_finished" );
    common_scripts\utility::flag_init( "FLAG_ac130_flare_event_finished" );
    common_scripts\utility::flag_init( "FLAG_ac130_intro" );
    common_scripts\utility::flag_init( "FLAG_ac130_loop_0" );
    common_scripts\utility::flag_init( "FLAG_ac130_loop_0_to_2" );
    common_scripts\utility::flag_init( "FLAG_ac130_loop_2" );
    common_scripts\utility::flag_init( "FLAG_ac130_loop_2_to_3" );
    common_scripts\utility::flag_init( "FLAG_ac130_loop_3" );
    common_scripts\utility::flag_init( "FLAG_ac130_loop_4" );
    common_scripts\utility::flag_init( "FLAG_open_area_slamzoom_out_out" );
    common_scripts\utility::flag_init( "FLAG_open_area_battle_1_end_transition_out" );
    common_scripts\utility::flag_init( "FLAG_open_area_battle_2_end_transition_out" );
    common_scripts\utility::flag_init( "FLAG_monitor_encounter_enemy" );
    common_scripts\utility::flag_init( "FLAG_monitor_encounter_primary_enemy" );
    common_scripts\utility::flag_init( "FLAG_monitor_encounter_special_ai" );
    common_scripts\utility::flag_init( "FLAG_open_area_drones_panic" );
    common_scripts\utility::flag_init( "FLAG_interact_button_pressed" );
    common_scripts\utility::flag_init( "FLAG_street_ma_1_dialogue_finished" );
    common_scripts\utility::flag_init( "FLAG_city_area_ma_2_dialogue_finished" );
    common_scripts\utility::flag_init( "player_tackled_hvt" );
}

_id_6252( var_0 )
{
    level notify( "LISTEN_timed_mission_failed_end" );
    level endon( "LISTEN_timed_mission_failed_end" );
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 10, var_0 );
    wait(var_0);
    _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_HVI_KILLED" );
}

_id_6253()
{
    level notify( "LISTEN_timed_mission_failed_end" );
}

_id_6254( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 1, 1, var_0 );
    var_1 = level._id_6132;
    var_1[var_1.size] = level._id_6127;

    foreach ( var_3 in var_1 )
        var_3 thread _id_633A( var_0 );
}

_id_6255()
{
    return level._id_624E[level._id_624D].origin;
}

_id_6256( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 0, var_0 );
    var_0 = common_scripts\utility::ter_op( var_0 >= level._id_624E.size, level._id_624E.size - 1, var_0 );
    return level._id_624E[var_0].origin;
}

_id_6257( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 0, var_0 );
    var_0 = common_scripts\utility::ter_op( var_0 >= level._id_624E.size, level._id_624E.size - 1, var_0 );
    level._id_624D = var_0;
}

_id_6258()
{
    return level._id_624F[level._id_624C];
}

_id_6259( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 0, var_0 );
    var_0 = common_scripts\utility::ter_op( var_0 >= level._id_624F.size, level._id_624F.size - 1, var_0 );
    return level._id_624F[var_0];
}

_id_625A( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 0, var_0 );
    var_0 = common_scripts\utility::ter_op( var_0 >= level._id_624F.size, level._id_624F.size - 1, var_0 );
    level._id_624C = var_0;
}

_id_625B( var_0 )
{
    var_1 = level._id_622F.size;
    level._id_6235 = 0;
    common_scripts\utility::flag_set( "FLAG_monitor_encounter_enemy" );

    while ( level._id_6235 < var_1 && !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = level._id_622F.size;
        wait 0.05;
    }

    common_scripts\utility::flag_set( var_0 );
    common_scripts\utility::flag_clear( "FLAG_monitor_encounter_enemy" );
    level._id_6235 = 0;
}

_id_625C( var_0, var_1 )
{
    var_0 = _id_5F9E::_id_5F0F( var_0, 0 );
    level._id_6235 = 0;
    common_scripts\utility::flag_set( "FLAG_monitor_encounter_enemy" );

    while ( level._id_6235 < var_0 && !common_scripts\utility::flag( var_1 ) )
        wait 0.05;

    common_scripts\utility::flag_set( var_1 );
    common_scripts\utility::flag_clear( "FLAG_monitor_encounter_enemy" );
    level._id_6235 = 0;
}

_id_625D( var_0, var_1 )
{
    var_0 = _id_5F9E::_id_5F0F( var_0, 0 );

    while ( !_id_5F9E::_id_5F4B( var_0, level._id_622F ) && !common_scripts\utility::flag( var_1 ) )
        wait 0.05;

    common_scripts\utility::flag_set( var_1 );
}

_id_625E( var_0 )
{
    level._id_622F = common_scripts\utility::add_to_array( level._id_622F, var_0 );
    var_0 thread _id_6260();
}

_id_625F()
{
    level._id_622F = maps\_utility::_id_1361( level._id_622F );
    level._id_622F = common_scripts\utility::array_removeundefined( level._id_622F );
}

_id_6260()
{
    self endon( "LISTEN_end_monitor_encounter_enemy_on_death" );
    self waittill( "death", var_0 );

    if ( ( _id_5F9E::_id_5F0D( var_0, level.player ) || _id_5F9E::_id_5F0D( var_0, self ) ) && common_scripts\utility::flag( "FLAG_monitor_encounter_enemy" ) )
        level._id_6235++;
}

_id_6261( var_0 )
{
    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );

    foreach ( var_2 in level._id_622F )
    {
        if ( isdefined( var_2 ) && isalive( var_2 ) )
        {
            var_2 _id_636E();
            var_2 dodamage( 100000, ( 0.0, 0.0, 0.0 ), level.player );
            wait(var_0);
        }
    }
}

_id_6262( var_0 )
{
    var_1 = level._id_6230.size;
    level._id_6236 = 0;
    common_scripts\utility::flag_set( "FLAG_monitor_encounter_primary_enemy" );

    while ( level._id_6236 < var_1 && !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = level._id_6230.size;
        wait 0.05;
    }

    common_scripts\utility::flag_set( var_0 );
    common_scripts\utility::flag_clear( "FLAG_monitor_encounter_primary_enemy" );
    level._id_6236 = 0;
}

_id_6263( var_0, var_1 )
{
    var_0 = _id_5F9E::_id_5F0F( var_0, 0 );
    level._id_6236 = 0;
    common_scripts\utility::flag_set( "FLAG_monitor_encounter_primary_enemy" );

    while ( level._id_6236 < var_0 && !common_scripts\utility::flag( var_1 ) )
        wait 0.05;

    common_scripts\utility::flag_set( var_1 );
    common_scripts\utility::flag_clear( "FLAG_monitor_encounter_primary_enemy" );
    level._id_6236 = 0;
}

_id_6264( var_0, var_1 )
{
    var_0 = _id_5F9E::_id_5F0F( var_0, 0 );

    while ( !_id_5F9E::_id_5F4B( var_0, level._id_6230 ) && !common_scripts\utility::flag( var_1 ) )
        wait 0.05;

    common_scripts\utility::flag_set( var_1 );
}

_id_6265( var_0 )
{
    level._id_6230 = _id_5F9E::_id_5F48( level._id_6230, var_0 );
    var_0 thread _id_6268();
}

_id_6266( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        level._id_6230 = _id_5F9E::_id_5F48( level._id_6230, var_2 );

        if ( isdefined( var_2 ) && isalive( var_2 ) )
            var_2 thread _id_6268();
    }
}

_id_6267()
{
    level._id_6230 = maps\_utility::_id_1361( level._id_6230 );
    level._id_6230 = common_scripts\utility::array_removeundefined( level._id_6230 );
}

_id_6268()
{
    self endon( "LISTEN_end_monitor_encounter_primary_enemy_on_death" );
    self waittill( "death", var_0 );

    if ( ( _id_5F9E::_id_5F0D( var_0, level.player ) || _id_5F9E::_id_5F0D( var_0, self ) ) && common_scripts\utility::flag( "FLAG_monitor_encounter_primary_enemy" ) )
        level._id_6236++;
}

_id_6269( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0.05, 0.05, var_0 );

    foreach ( var_2 in level._id_6230 )
    {
        if ( isdefined( var_2 ) && isalive( var_2 ) )
        {
            var_2 _id_636E();
            var_2 dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
            wait(var_0);
        }
    }
}

_id_626A()
{
    foreach ( var_1 in level._id_6230 )
    {
        if ( isdefined( var_1 ) && isalive( var_1 ) )
            var_1 thread _id_6365();

        wait 0.05;
    }
}

_id_626B( var_0 )
{
    var_1 = level._id_6231.size;
    level._id_6237 = 0;
    common_scripts\utility::flag_set( "FLAG_monitor_encounter_special_ai" );

    while ( level._id_6237 < var_1 && !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = level._id_6231.size;
        wait 0.05;
    }

    common_scripts\utility::flag_set( var_0 );
    common_scripts\utility::flag_clear( "FLAG_monitor_encounter_special_ai" );
    level._id_6237 = 0;
}

_id_626C( var_0, var_1 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 0, var_0 );
    level._id_6237 = 0;
    common_scripts\utility::flag_set( "FLAG_monitor_encounter_special_ai" );

    while ( level._id_6237 < var_0 && !common_scripts\utility::flag( var_1 ) )
        wait 0.05;

    common_scripts\utility::flag_set( var_1 );
    common_scripts\utility::flag_clear( "FLAG_monitor_encounter_special_ai" );
    level._id_6237 = 0;
}

_id_626D( var_0 )
{
    level._id_6231 = _id_5F9E::_id_5F48( level._id_6231, var_0 );
    var_0 thread _id_6270();
}

_id_626E( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        level._id_6231 = _id_5F9E::_id_5F48( level._id_6231, var_2 );

        if ( isdefined( var_2 ) && isalive( var_2 ) && isai( var_2 ) )
            var_2 thread _id_6270();
    }
}

_id_626F()
{
    level._id_6231 = maps\_utility::_id_2672( level._id_6231 );
    level._id_6231 = common_scripts\utility::array_removeundefined( level._id_6231 );
}

_id_6270()
{
    self waittill( "death", var_0 );

    if ( common_scripts\utility::flag( "FLAG_monitor_encounter_special_ai" ) )
        level._id_6237++;
}

_id_6271( var_0 )
{
    var_0 = common_scripts\utility::ter_op( var_0 < 0.05, 0.05, var_0 );

    foreach ( var_2 in level._id_6231 )
    {
        if ( isdefined( var_2 ) && isalive( var_2 ) )
        {
            var_2 _id_636E();
            var_2 dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
            wait(var_0);
        }
    }
}

_id_6272( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 = _id_5F9E::_id_5F0F( var_0, 0 );
    var_1 = _id_5F9E::_id_5F0F( var_1, 0.05 );
    var_2 = _id_5F9E::_id_5F0F( var_2, var_0 );
    var_3 = _id_5F9E::_id_5F0F( var_3, 0.05 );
    var_6 = [];

    for ( var_7 = 0; var_7 < var_2; var_7++ )
        var_6[var_6.size] = undefined;

    for ( var_7 = 0; var_7 < var_0; var_7++ )
    {
        self.count = 1;
        var_6[var_7] = self stalingradspawn();

        if ( isdefined( var_6[var_7] ) )
        {
            if ( isdefined( var_5 ) && isarray( var_5 ) )
            {
                thread _id_6273( var_5, var_6[var_7], undefined, "after_spawn", "caller" );
                thread _id_6273( var_5, undefined, var_6[var_7], "after_spawn", "pass_value" );
            }

            wait(var_1);
        }
    }

    while ( !common_scripts\utility::flag( var_4 ) )
    {
        var_8 = 0;
        var_7 = -1;

        while ( !var_8 && !common_scripts\utility::flag( var_4 ) )
        {
            foreach ( var_11, var_10 in var_6 )
            {
                if ( !isdefined( var_10 ) || !isalive( var_10 ) )
                {
                    var_8 = 1;
                    var_7 = var_11;
                }
            }

            wait 0.05;
        }

        if ( common_scripts\utility::flag( var_4 ) )
            break;

        wait(var_3);

        if ( common_scripts\utility::flag( var_4 ) )
            break;

        self.count = 1;
        var_6[var_7] = self stalingradspawn();

        if ( isdefined( var_6[var_7] ) && isdefined( var_5 ) && isarray( var_5 ) )
        {
            thread _id_6273( var_5, var_6[var_7], undefined, "after_spawn", "caller" );
            thread _id_6273( var_5, undefined, var_6[var_7], "after_spawn", "pass_value" );
        }
    }

    if ( isdefined( var_5 ) && isarray( var_5 ) )
    {
        foreach ( var_13 in var_6 )
        {
            if ( isdefined( var_13 ) && isalive( var_13 ) )
                var_13 thread _id_6273( var_5, var_13, undefined, "before_spawner_cleanup", "caller" );
        }

        thread _id_6273( var_5, undefined, var_6, "before_spawner_cleanup", "pass_value" );
    }

    self delete();
}

_id_6273( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_0[var_3] ) && isdefined( var_0[var_3][var_4] ) )
    {
        foreach ( var_6 in var_0[var_3][var_4] )
        {
            switch ( var_4 )
            {
                case "caller":
                    var_1 thread [[ var_6 ]]();
                    continue;
                case "pass_value":
                    thread [[ var_6 ]]( var_2 );
                    continue;
            }
        }
    }
}

_id_6274( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( self.targetname, "targetname" );
    var_2 = [ getent( self.targetname + "_AR", "targetname" ), getent( self.targetname + "_SMG", "targetname" ), getent( self.targetname + "_RPG", "targetname" ) ];
    var_3 = 0;

    for ( var_4 = 0; var_4 < self._id_6275; var_4++ )
    {
        var_3 = common_scripts\utility::ter_op( var_3 < var_1.size, var_3, 0 );
        var_5 = getnodearray( var_1[var_3].script_noteworthy, "targetname" );
        var_6 = 0;
        var_7 = undefined;

        while ( !var_6 )
        {
            foreach ( var_9 in var_5 )
            {
                if ( !isdefined( var_9.owner ) )
                {
                    var_6 = 1;
                    var_7 = var_9;
                    break;
                }
            }

            wait 0.05;
        }

        var_11 = common_scripts\utility::ter_op( _id_5F9E::_id_5EDE( 0.5 ), var_2[2], var_2[randomint( 2 )] );
        var_11.count = 1;
        var_11.origin = var_1[var_3].origin;
        var_11.angles = var_1[var_3] _id_5F9E::_id_5F4F( "angles" );
        self._id_6276[var_4] = var_11 stalingradspawn();

        if ( !maps\_utility::_id_13AF( self._id_6276[var_4] ) )
        {
            self._id_6276[var_4] maps\_utility::_id_2053( var_7 );
            self._id_6276[var_4]._id_6277 = var_1[var_3].radius;
            self._id_6276[var_4]._id_6278 = var_1[var_3].origin;

            if ( isdefined( self._id_6279 ) && isarray( self._id_6279 ) )
            {
                thread _id_6273( self._id_6279, self._id_6276[var_4], undefined, "after_spawn", "caller" );
                thread _id_6273( self._id_6279, undefined, self._id_6276[var_4], "after_spawn", "pass_value" );
            }

            wait(self._id_627A);
        }

        var_3++;
    }

    for ( var_3 = 0; !common_scripts\utility::flag( var_0 ); var_3++ )
    {
        var_12 = 0;
        var_4 = -1;

        while ( !var_12 && !common_scripts\utility::flag( var_0 ) )
        {
            self._id_6276 = maps\_utility::_id_1361( self._id_6276 );
            self._id_6276 = common_scripts\utility::array_removeundefined( self._id_6276 );

            if ( self._id_6276.size < self._id_627B )
            {
                var_12 = 1;
                var_4 = self._id_6276.size;
            }

            wait 0.05;
        }

        if ( common_scripts\utility::flag( var_0 ) )
            break;

        wait(self._id_627C);

        if ( common_scripts\utility::flag( var_0 ) )
            break;

        var_3 = common_scripts\utility::ter_op( var_3 < var_1.size, var_3, 0 );
        var_5 = getnodearray( var_1[var_3].script_noteworthy, "targetname" );
        var_6 = 0;
        var_7 = undefined;

        while ( !var_6 && !common_scripts\utility::flag( var_0 ) )
        {
            foreach ( var_9 in var_5 )
            {
                if ( !isdefined( var_9.owner ) )
                {
                    var_6 = 1;
                    var_7 = var_9;
                    break;
                }
            }

            wait 0.05;
        }

        if ( common_scripts\utility::flag( var_0 ) )
            break;

        var_11 = common_scripts\utility::ter_op( _id_5F9E::_id_5EDE( 0.3 ), var_2[2], var_2[randomint( 2 )] );
        var_11.count = 1;
        var_11.origin = var_1[var_3].origin;
        var_11.angles = var_1[var_3] _id_5F9E::_id_5F4F( "angles" );
        self._id_6276[var_4] = var_11 stalingradspawn();

        if ( !maps\_utility::_id_13AF( self._id_6276[var_4] ) )
        {
            self._id_6276[var_4] maps\_utility::_id_2053( var_7 );
            self._id_6276[var_4]._id_6277 = var_1[var_3].radius;
            self._id_6276[var_4]._id_6278 = var_1[var_3].origin;

            if ( isdefined( self._id_6279 ) && isarray( self._id_6279 ) )
            {
                thread _id_6273( self._id_6279, self._id_6276[var_4], undefined, "after_spawn", "caller" );
                thread _id_6273( self._id_6279, undefined, self._id_6276[var_4], "after_spawn", "pass_value" );
            }
        }
    }

    if ( isdefined( self._id_6279 ) && isarray( self._id_6279 ) )
    {
        foreach ( var_16 in self._id_6276 )
        {
            if ( isdefined( var_16 ) && isalive( var_16 ) )
                thread _id_6273( self._id_6279, var_16, undefined, "before_spawner_cleanup", "caller" );
        }

        thread _id_6273( self._id_6279, undefined, self._id_6276, "before_spawner_cleanup", "pass_value" );
    }

    foreach ( var_11 in var_2 )
        var_11 delete();

    self delete();
}

_id_627D()
{
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["plt"]["ac130_plt_donotfire"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_notcleared2"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_watchbuildings"];
    var_0[var_0.size] = level.scr_sound["plt"]["ac130_plt_notauthorized"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 0;
    var_4 = 1.5;

    for (;;)
    {
        if ( common_scripts\utility::flag( "FLAG_building_trigger_mission_failed_on" ) && level._id_624B )
        {
            if ( var_1.size == 0 )
            {
                for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                    var_1[var_1.size] = var_2;

                if ( var_1.size > 1 )
                    var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            }

            var_3 = randomint( var_1.size );
            _id_5CFE::playsoundoverradio( var_0[var_1[var_3]], 1, 4.0 );
            var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            wait(var_4);
            level._id_624B = 0;
            continue;
        }

        wait 0.05;
    }
}

_id_627E()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( common_scripts\utility::flag( "FLAG_building_trigger_mission_failed_on" ) && _id_5F9E::_id_5F0D( var_1, level.player ) && _id_5F9E::_id_5F0D( var_4, "MOD_PROJECTILE" ) )
        {
            if ( var_0 > 990 )
                level._id_6238 += level._id_6239 / 3;
            else if ( var_0 > 200 )
                level._id_6238 += level._id_6239 / 7;

            level._id_624B = 1;
        }
    }
}

_id_627F()
{
    self endon( "death" );

    while ( !common_scripts\utility::flag( "FLAG_rpg_building_valid_target" ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !common_scripts\utility::flag( "FLAG_rpg_building_valid_target" ) && common_scripts\utility::flag( "FLAG_building_trigger_mission_failed_on" ) && _id_5F9E::_id_5F0D( var_1, level.player ) && _id_5F9E::_id_5F0D( var_4, "MOD_PROJECTILE" ) )
        {
            if ( var_0 > 990 )
                level._id_6238 += level._id_6239 / 3;
            else if ( var_0 > 200 )
                level._id_6238 += level._id_6239 / 7;

            level._id_624B = 1;
        }
    }
}

_id_6280()
{
    level endon( "LISTEN_end_monitor_mission_fail_points" );
    var_0 = level._id_6238;
    var_1 = gettime();
    var_2 = 6;

    for (;;)
    {
        if ( level._id_6238 < 0 )
            level._id_6238 = 0;
        else if ( level._id_6238 >= level._id_6239 )
            _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_BUILDING" );

        if ( ( gettime() - var_1 ) / 1000 > var_2 )
        {
            var_1 = gettime();
            level._id_6238 = 0;
        }

        if ( var_0 != level._id_6238 )
        {
            var_1 = gettime();
            var_0 = level._id_6238;
        }

        wait 0.05;
    }
}

_id_6281()
{
    while ( isdefined( self ) && isalive( self ) )
        wait 0.05;

    level._id_6238 -= 50;
}

_id_6282()
{
    while ( isdefined( self ) && isalive( self ) )
        wait 0.05;

    level._id_6238 -= 200;
}

_id_6283()
{
    level endon( "LISTEN_end_monitor_interact_button" );
    notifyoncommand( "LISTEN_interact_button_pressed", "+usereload" );

    for (;;)
    {
        common_scripts\utility::flag_clear( "FLAG_interact_button_pressed" );
        level.player waittill( "LISTEN_interact_button_pressed" );
        common_scripts\utility::flag_set( "FLAG_interact_button_pressed" );
        wait 0.1;
    }
}

_id_6284()
{
    return common_scripts\utility::flag( "FLAG_interact_button_pressed" );
}

_id_5EA4()
{
    self waittill( "death", var_0 );

    if ( _id_5F9E::_id_5F0D( var_0, level.player ) )
        level._id_5E9A = 1;
}

_id_6285( var_0 )
{
    self waittill( "death", var_1 );

    if ( _id_5F9E::_id_5F0D( var_1, level.player ) )
    {
        level._id_5E9B = 1;

        if ( isdefined( var_0 ) )
        {
            switch ( var_0 )
            {
                case "btr":
                    level._id_5E9C = 1;
                    break;
                case "hind":
                    level._id_5E9D = 1;
                    break;
                case "mi17":
                    level._id_5E9E = 1;
                    break;
                case "t72":
                    level._id_5E9F = 1;
                    break;
            }
        }
    }
}

_id_6286( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 endon( "death" );

    if ( isalive( var_0 ) )
        thread maps\_vehicle::_id_1FA6( var_0 );
}

_id_6287( var_0, var_1 )
{
    common_scripts\utility::flag_set( "FLAG_ac130_flare_event_started" );
    level.player lerpviewangleclamp( 0, 0, 0, 15, 15, 10, 0 );
    level._id_5C62 = 0;
    level._id_5C64 = 0;
    var_2 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ), level._id_5C62, level._id_5C64 );
    level.player setblurforplayer( var_2, 0 );
    thread _id_6288( var_0 );
    thread _id_628B( var_0 );
    thread _id_628F( var_0 );
    thread _id_6294( var_0 );
    var_3 = getvehiclenode( var_0 + "_event_finished", "script_noteworthy" );
    var_3 waittill( "trigger" );
    level._id_5C62 = 0.5;
    level._id_5C64 = 0.5;
    var_2 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ), level._id_5C62, level._id_5C64 );
    level.player setblurforplayer( var_2, 0 );
}

_id_6288( var_0 )
{
    level.player playrumblelooponentity( "damage_light" );
    _id_5F9E::_id_5F34( 0.1, 4.0, level.player, 1000 );
    level.player stoprumble( "damage_light" );
    var_1 = getvehiclenode( var_0 + "_rumble", "script_noteworthy" );
    var_1 waittill( "trigger" );
    level.player playrumblelooponentity( "damage_heavy" );
    _id_5F9E::_id_5F34( 0.16, 4.5, level.player, 1000 );
    level.player stoprumble( "damage_heavy" );
}

_id_6289( var_0 )
{
    var_1 = getent( var_0 + "_missile", "targetname" );
    var_2 = maps\_utility::_id_1BF9( var_0 + "_missile", "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( _id_5F9E::_id_5F0D( level._id_624A, int( var_5._id_164F ) ) )
            var_3[var_3.size] = var_5;
    }

    var_7 = [];

    foreach ( var_5 in var_3 )
    {
        var_1.count = 1;
        var_1.origin = var_5.origin;
        var_1.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_1.target = var_5.target;
        var_7[var_5._id_16A5] = var_1 maps\_utility::_id_1FA3();
        wait 0.1;
    }

    wait 0.05;
    var_10 = [];
    var_11 = [];

    foreach ( var_14, var_13 in var_7 )
    {
        var_10[var_14] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_10[var_14] setmodel( "ss_n_12_missile" );
        var_10[var_14].angles = ( -90.0, 0.0, 0.0 );
        var_10[var_14] dontcastshadows();
        var_11[var_14] = spawn( "script_model", var_10[var_14] gettagorigin( "tag_tail" ) );
        var_11[var_14] setmodel( "tag_origin" );
        var_11[var_14].angles = ( -90.0, 0.0, 0.0 );
        var_10[var_14] linkto( var_11[var_14], "tag_origin" );
        var_11[var_14].origin = var_13.origin;
        var_11[var_14].angles = var_13.angles;
        var_11[var_14] linkto( var_13, "tag_origin" );
    }

    var_7[1] maps\_utility::delaythread( 0.05, ::_id_628A, var_10[1], var_11[1] );
    var_7[2] maps\_utility::delaythread( 0.5, ::_id_628A, var_10[2], var_11[2] );
    var_7[3] maps\_utility::delaythread( 0.6, ::_id_628A, var_10[3], var_11[3] );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_missile"], 1, 10 );
    common_scripts\utility::flag_wait( "FLAG_ac130_shoot_angel_flares_finished" );
    var_1 delete();
}

_id_628A( var_0, var_1 )
{
    var_2 = common_scripts\utility::getfx( "FX_mig_missile_trail" );
    playfxontag( var_2, self, "tag_origin" );
    thread maps\_vehicle::_id_1FA6();
    self waittill( "reached_dynamic_path_end" );
    stopfxontag( var_2, self, "tag_origin" );
    var_0 delete();
    var_1 delete();
    self delete();
}

_id_628B( var_0 )
{
    thread _id_628C( var_0 );
    thread _id_628D( var_0 );
    common_scripts\utility::flag_wait( "FLAG_ac130_shoot_angel_flares_start" );
    thread _id_628E( var_0 );
    var_1 = _id_5F9E::_id_5F91( var_0 + "_mig_", "script_noteworthy", 1 );
    var_2 = _id_5F9E::_id_5F91( var_0 + "_f15_", "script_noteworthy", 1 );
    var_1[1] maps\_utility::delaythread( 1.5, maps\_vehicle::_id_1FA6 );
    var_1[2] maps\_utility::delaythread( 3.5, maps\_vehicle::_id_1FA6 );
    var_2[1] maps\_utility::delaythread( 4.0, maps\_vehicle::_id_1FA6 );
    var_2[2] maps\_utility::delaythread( 5.5, maps\_vehicle::_id_1FA6 );
}

_id_628C( var_0 )
{
    var_1 = getent( "angle_flare_mig", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_6324 );
    var_1 maps\_utility::add_spawn_function( ::_id_632D );
    var_1 maps\_utility::add_spawn_function( ::_id_6333 );
    var_2 = _id_5F9E::_id_5F90( var_0 + "_mig_", "targetname", 1 );
    var_3 = [];

    foreach ( var_6, var_5 in var_2 )
    {
        var_1.count = 1;
        var_1.origin = var_5.origin;
        var_1.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_1.target = var_5.target;
        var_3[var_6 + 1] = var_1 maps\_utility::_id_1FA3();
        var_3[var_6 + 1].script_noteworthy = var_5.targetname;
        wait 0.1;
    }

    var_1 delete();
}

_id_628D( var_0 )
{
    var_1 = getent( "angle_flare_f15", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_62AC );
    var_1 maps\_utility::add_spawn_function( ::_id_62B9 );
    var_1 maps\_utility::add_spawn_function( ::_id_62BC );
    var_2 = _id_5F9E::_id_5F90( var_0 + "_f15_", "targetname", 1 );
    var_3 = [];

    foreach ( var_6, var_5 in var_2 )
    {
        var_1.count = 1;
        var_1.origin = var_5.origin;
        var_1.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_1.target = var_5.target;
        var_3[var_6 + 1] = var_1 maps\_utility::_id_1FA3();
        var_3[var_6 + 1].script_noteworthy = var_5.targetname;
        wait 0.1;
    }

    var_1 delete();
}

_id_628E( var_0 )
{
    var_1 = _id_5F9E::_id_5F90( var_0 + "_mig_", "targetname", 1 );
    var_2 = _id_5F9E::_id_5F52( var_1[0].target );
    var_3 = _id_5F9E::_id_5F52( var_1[0].target );
    var_4[0] = _id_5F9E::_id_5F51( "sonic_boom", "script_noteworthy", var_2 )[0];
    var_4[1] = _id_5F9E::_id_5F51( "sonic_boom", "script_noteworthy", var_3 )[0];
    var_5 = 4.0;
    var_6 = 0;
    var_7 = 0.05;

    while ( var_6 < var_5 )
    {
        var_8 = var_1[randomint( var_1.size )].origin;
        var_9 = var_4[randomint( var_4.size )].origin;
        var_10 = vectornormalize( var_9 - var_8 );
        playfx( common_scripts\utility::getfx( "FX_jet_20mm_tracer_close_ac130" ), var_8, var_10 );
        var_6 += var_7;
        wait(var_7);
    }
}

_id_628F( var_0 )
{
    var_1 = getvehiclenode( var_0 + "_fire", "script_noteworthy" );
    var_1 waittill( "trigger" );
    common_scripts\utility::flag_set( "FLAG_ac130_shoot_angel_flares_start" );
    thread _id_6290( 20 );
    maps\_utility::delaythread( 1.5, ::_id_6293 );
    common_scripts\utility::flag_wait( "FLAG_ac130_shoot_angel_flares_finished" );
    level.player maps\_utility::delaythread( 6.0, common_scripts\utility::stop_loop_sound_on_entity, "missile_warning" );
    level.player maps\_utility::delaythread( 6.0, _id_5CFE::_id_5C93 );
}

_id_6290( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        if ( !( var_1 % var_0 ) )
            level.player playsound( "ac130_flare_burst" );

        thread _id_6291();
        wait(randomfloatrange( 0.1, 0.25 ));
    }

    common_scripts\utility::flag_set( "FLAG_ac130_shoot_angel_flares_finished" );
}

_id_6291()
{
    if ( !isdefined( level._id_6292 ) )
        level._id_6292 = 0;

    var_0 = maps\_utility::_id_1287( "angel_flare_rig" );
    var_0.origin = level.player.origin + ( 0.0, 0.0, 32.0 );
    var_0.angles = level.player getplayerangles() + ( 0.0, -45.0, 0.0 );
    var_1 = common_scripts\utility::getfx( "FX_angel_flare_geotrail" );
    var_2 = level._id_0C59["angel_flare_rig"]["ac130_angel_flares"].size;
    var_3 = level._id_0C59["angel_flare_rig"]["ac130_angel_flares"][level._id_6292 % var_2];
    level._id_6292++;
    var_0 setflaggedanim( "flare_anim", var_3, 1, 0, 1 );
    wait 0.1;
    playfxontag( var_1, var_0, "flare_left_top" );
    playfxontag( var_1, var_0, "flare_right_top" );
    wait 0.05;
    playfxontag( var_1, var_0, "flare_left_bot" );
    playfxontag( var_1, var_0, "flare_right_bot" );
    var_0 waittillmatch( "flare_anim", "end" );
    stopfxontag( var_1, var_0, "flare_left_top" );
    stopfxontag( var_1, var_0, "flare_right_top" );
    stopfxontag( var_1, var_0, "flare_left_bot" );
    stopfxontag( var_1, var_0, "flare_right_bot" );
    var_0 delete();
}

_id_6293()
{
    var_0 = _id_5F9E::_id_5F52( "ac130_angel_flare_explosions" );
    maps\_utility::_id_2122( var_0 );
    var_1 = common_scripts\utility::getfx( "FX_angel_flare_explosion" );
    var_2 = 0.5;

    foreach ( var_4 in var_0 )
    {
        var_5 = anglestoforward( var_4 _id_5F9E::_id_5F4F( "angles" ) );
        playfx( var_1, var_4.origin, var_5 );
        level.player playrumblelooponentity( "damage_heavy" );
        level.player common_scripts\utility::delaycall( 0.25, ::stoprumble, "damage_heavy" );
        wait(var_2);
    }
}

_id_6294( var_0 )
{
    var_1 = getvehiclenode( var_0 + "_restore_view", "script_noteworthy" );
    var_1 waittill( "trigger" );
    level.player lerpviewangleclamp( 2, 0.05, 0.05, level._id_5C2A, level._id_5C2B, level._id_5C2C, level._id_5C2D );
    _id_5CFE::_id_5CD1();
    setdvar( "ac130_zoom_enabled", 1 );
    common_scripts\utility::flag_set( "FLAG_ac130_change_weapons_enabled" );
}

_id_6295( var_0, var_1 )
{
    self endon( "kill_rumble_forever" );
    var_2 = undefined;

    if ( isdefined( self._id_2992 ) )
        var_2 = self._id_2992;
    else if ( isdefined( level._id_2993 ) && isdefined( level._id_2993[var_1] ) )
        var_2 = level._id_2993;
    else if ( isdefined( level._id_2994[var_1] ) )
        var_2 = level._id_2994[var_1];

    if ( !isdefined( var_2 ) )
        return;

    var_3 = var_2.radius * 2;
    var_4 = -1 * var_2.radius;
    var_5 = spawn( "trigger_radius", self.origin + ( 0, 0, var_4 ), 0, var_2.radius, var_3 );
    var_5 enablelinkto();
    var_5 linkto( self );
    self._id_2991 = var_5;
    self endon( "death" );

    if ( !isdefined( self._id_29B7 ) )
        self._id_29B7 = 1;

    if ( isdefined( var_2.scale ) )
        self._id_29B6 = var_2.scale;
    else
        self._id_29B6 = 0.15;

    if ( isdefined( var_2.duration ) )
        self._id_29A6 = var_2.duration;
    else
        self._id_29A6 = 4.5;

    if ( isdefined( var_2.radius ) )
        self._id_29A7 = var_2.radius;
    else
        self._id_29A7 = 600;

    if ( isdefined( var_2._id_29FB ) )
        self._id_29A5 = var_2._id_29FB;
    else
        self._id_29A5 = 1;

    if ( isdefined( var_2._id_29FC ) )
        self._id_29B5 = var_2._id_29FC;
    else
        self._id_29B5 = 1;

    var_5.radius = self._id_29A7;

    for (;;)
    {
        var_5 waittill( "trigger" );

        if ( var_0 vehicle_getspeed() == 0 || !self._id_29B7 )
        {
            wait 0.1;
            continue;
        }

        self playrumblelooponentity( var_2._id_1441 );

        while ( level.player istouching( var_5 ) && self._id_29B7 && var_0 vehicle_getspeed() > 0 )
        {
            if ( _id_5F9E::_id_5F15( level.ac130player.origin, self.origin, self._id_29A7 * 0.75 ) )
                common_scripts\utility::flag_set( "FLAG_ac130_rumble" );

            earthquake( self._id_29B6, self._id_29A6, self.origin, self._id_29A7 );
            wait(self._id_29A5 + randomfloat( self._id_29B5 ));
        }

        self stoprumble( var_2._id_1441 );
    }
}

_id_6296( var_0 )
{
    self endon( "kill_rumble_forever" );
    var_1 = undefined;

    if ( isdefined( self._id_2992 ) )
        var_1 = self._id_2992;
    else if ( isdefined( level._id_2993 ) && isdefined( level._id_2993[var_0] ) )
        var_1 = level._id_2993;
    else if ( isdefined( level._id_2994[var_0] ) )
        var_1 = level._id_2994[var_0];

    if ( !isdefined( var_1 ) )
        return;

    var_2 = var_1.radius * 2;
    var_3 = -1 * var_1.radius;
    var_4 = spawn( "trigger_radius", self.origin + ( 0, 0, var_3 ), 0, var_1.radius, var_2 );
    var_4 enablelinkto();
    var_4 linkto( self );
    self._id_2991 = var_4;
    self endon( "death" );

    if ( !isdefined( self._id_29B7 ) )
        self._id_29B7 = 1;

    if ( isdefined( var_1.scale ) )
        self._id_29B6 = var_1.scale;
    else
        self._id_29B6 = 0.15;

    if ( isdefined( var_1.duration ) )
        self._id_29A6 = var_1.duration;
    else
        self._id_29A6 = 4.5;

    if ( isdefined( var_1.radius ) )
        self._id_29A7 = var_1.radius;
    else
        self._id_29A7 = 600;

    if ( isdefined( var_1._id_29FB ) )
        self._id_29A5 = var_1._id_29FB;
    else
        self._id_29A5 = 1;

    if ( isdefined( var_1._id_29FC ) )
        self._id_29B5 = var_1._id_29FC;
    else
        self._id_29B5 = 1;

    var_4.radius = self._id_29A7;

    for (;;)
    {
        var_4 waittill( "trigger" );

        if ( !self._id_29B7 )
        {
            wait 0.1;
            continue;
        }

        self playrumblelooponentity( var_1._id_1441 );

        while ( level.player istouching( var_4 ) && self._id_29B7 )
        {
            if ( _id_5F9E::_id_5F15( level.ac130player.origin, self.origin, self._id_29A7 * 0.35 ) )
                common_scripts\utility::flag_set( "FLAG_ac130_rumble" );

            earthquake( self._id_29B6, self._id_29A6, self.origin, self._id_29A7 );
            wait(self._id_29A5 + randomfloat( self._id_29B5 ));
        }

        self stoprumble( var_1._id_1441 );
    }
}

_id_6297( var_0, var_1 )
{
    maps\_utility::_id_1402( "FLAG_m1a1_init" );
    self.targetname = var_0;
    maps\_vehicle::_id_2A12();
    thread _id_62A1();
    thread _id_5CFE::_id_5CEF( "tag_turret" );
    maps\_utility::_id_13DC( "FLAG_m1a1_init" );
}

_id_6298( var_0 )
{
    self setturrettargetent( var_0 );
    wait 0.05;
    self fireweapon();
}

_id_6299( var_0 )
{
    self notify( "LISTEN_m1a1_end_randomly_target_ents" );
    self endon( "death" );
    self endon( "LISTEN_m1a1_end_randomly_target_ents" );
    var_1 = 3.0;

    for (;;)
    {
        var_2 = _id_5F9E::_id_5F4E( var_0 );
        self setturrettargetent( var_2 );
        wait(var_1);
    }
}

_id_629A( var_0, var_1 )
{
    self notify( "LISTEN_m1a1_end_randomly_shoot_canon" );
    self endon( "death" );
    self endon( "LISTEN_m1a1_end_randomly_shoot_canon" );
    var_2 = maps\_utility::_id_283C( var_0, var_1 );
    var_2 waittill( "trigger", var_3 );
    var_4 = 6.0;
    var_5 = 8.0;
    var_6 = 3.0;
    wait(randomfloatrange( 0.05, 1.5 ));

    for (;;)
    {
        var_7 = 0;

        while ( var_7 < var_4 )
        {
            self fireweapon();
            var_7 += var_6;
            wait(var_6);
        }

        wait(var_5);
        wait 0.05;
    }
}

_id_629B()
{
    self endon( "death" );
    self endon( "LISTEN_m1a1_end_randomly_shoot_canon" );
    var_0 = 6.0;
    var_1 = 8.0;
    var_2 = 3.0;
    wait(randomfloatrange( 0.05, 1.5 ));

    for (;;)
    {
        var_3 = 0;

        while ( var_3 < var_0 )
        {
            self fireweapon();
            var_3 += var_2;
            wait(var_2);
        }

        wait(var_1);
        wait 0.05;
    }
}

_id_629C()
{
    self notify( "LISTEN_m1a1_end_randomly_shoot_canon" );
    self clearturrettarget();
}

_id_629D()
{
    self endon( "death" );
    var_0 = 3.0;
    var_1 = 3.0;

    for (;;)
    {
        thread maps\_vehicle::_id_2A3E();
        wait(var_0);
        thread maps\_vehicle::_id_2A3D();
        wait(var_1);
        wait 0.05;
    }
}

_id_629E( var_0, var_1 )
{
    var_2 = maps\_utility::_id_283C( var_0, var_1 );
    var_2 waittill( "trigger", var_3 );
    self vehicle_setspeed( 0, 5, 5 );
}

_id_629F()
{
    self endon( "death" );
    var_0 = 2.0;

    for (;;)
    {
        var_1 = vectornormalize( anglestoforward( self.angles + ( 0, randomfloatrange( -15, 15 ), 0 ) ) );
        var_2 = self.origin + var_1 * 1024;
        self setturrettargetvec( var_2 );
        wait(var_0);
    }
}

_id_62A0()
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F52( self.target );
    var_1 = _id_5F9E::_id_5F51( "explosion", "script_noteworthy", var_0 )[0];

    if ( isdefined( var_1 ) )
    {
        var_1 waittill( "trigger" );
        var_2 = common_scripts\utility::getfx( "FX_m1a1_explosion" );
        var_3 = self.origin;
        var_4 = ( 0.0, 0.0, 1.0 );
        playfx( var_2, var_3, var_4 );
        maps\_vehicle::_id_2A13();
        wait 0.05;
        self dodamage( 10000, self.origin );
        self notify( "death" );
    }
}

_id_62A1()
{
    self endon( "death" );
    self endon( "LISTEN_end_m1a1_mission_failed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        var_10 = 0;

        if ( isdefined( var_9 ) )
            var_10 = _id_5CFE::_id_5CE7( var_9 );

        if ( var_10 )
            break;
    }

    _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_FRIENDLY_KILLED" );
}

_id_62A2( var_0, var_1 )
{
    maps\_utility::_id_1402( "FLAG_hummer_init" );
    _id_5F9E::_id_5F50( var_0, var_1 );
    self._id_62A3 = [];
    maps\_vehicle::_id_2A12();
    self thermaldrawenable();
    thread _id_62A5();
    maps\_utility::_id_13DC( "FLAG_hummer_init" );
}

_id_62A4()
{
    self endon( "death" );
    self endon( "LISTEN_end_hummer_script" );
    var_0 = common_scripts\utility::getfx( "FX_hummer_mg_ricochet" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( var_2 != level.player && _id_5F9E::_id_5EDE( 0.5 ) )
        {
            var_11 = vectornormalize( anglestoforward( self.angles ) );
            var_12 = 64 * var_11 + var_4;
            playfx( var_0, var_12, -1 * var_3 );
        }
    }
}

_id_62A5()
{
    self endon( "death" );
    self endon( "LISTEN_end_hummer_script" );
    self endon( "LISTEN_end_hummer_mission_failed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( _id_5F9E::_id_5F0D( var_1, level.player ) )
            break;
    }

    _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_FRIENDLY_KILLED" );
}

_id_62A6( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0.script_team ) && var_0.script_team == "allies" )
        return;

    self._id_62A3 = maps\_utility::_id_1361( self._id_62A3 );
    self._id_62A3 = common_scripts\utility::array_removeundefined( self._id_62A3 );
    self._id_62A3 = _id_5F9E::_id_5F48( self._id_62A3, var_0 );
}

_id_62A7()
{
    self endon( "death" );
    self endon( "LISTEN_end_hummer_script" );
    self endon( "LISTEN_hummer_end_fire_mg" );
    var_0 = self.mgturret[0];
    var_0 setmode( "manual_ai" );
    var_1 = 0.05;
    var_2 = 1.0;

    for (;;)
    {
        self._id_62A3 = maps\_utility::_id_1361( self._id_62A3 );
        self._id_62A3 = common_scripts\utility::array_removeundefined( self._id_62A3 );
        var_3 = maps\_utility::_id_0AE9( self.origin, self._id_62A3 );
        var_4 = common_scripts\utility::ter_op( isdefined( var_3 ), var_1, 0.05 );
        var_5 = 0;

        while ( var_5 < var_2 && isdefined( var_3 ) && isalive( var_3 ) )
        {
            var_0 settargetentity( var_3 );
            var_6 = var_0 gettagorigin( "tag_flash" );
            var_7 = common_scripts\utility::ter_op( var_3 _id_5F9E::_id_5F0A( "team", "axis" ), var_3.origin + ( 0.0, 0.0, 64.0 ), var_3.origin ) + _id_5F9E::_id_5F41( -64, 64 );
            magicbullet( "minigun_hummer_ac130", var_6, var_7 );
            var_5 += var_4;
            wait(var_4);
        }

        wait(var_4);
    }
}

_id_62A8( var_0 )
{
    self endon( "death" );
    self endon( "LISTEN_end_hummer_script" );
    var_0 waittill( "trigger", var_1 );
    var_2 = common_scripts\utility::getfx( "FX_hummer_dust_slide" );
    var_3 = self gettagorigin( "tag_wheel_back_left" );
    var_4 = ( 0.0, 0.0, 1.0 );
    playfx( var_2, var_3, var_4 );
    var_3 = self gettagorigin( "tag_wheel_back_right" );
    playfx( var_2, var_3, var_4 );
}

_id_62A9( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_2 notify( "enteredvehicle" );
        maps\_vehicle_aianim::_id_24E5( var_2, 0 );
    }
}

_id_62AA()
{
    self notify( "LISTEN_end_hummer_script" );

    if ( isdefined( self.mgturret ) && isdefined( self.mgturret[0] ) )
        self.mgturret[0] cleartargetentity();

    self clearturrettarget();

    if ( isdefined( self._id_0A39 ) )
    {
        foreach ( var_1 in self._id_0A39 )
        {
            if ( isdefined( var_1 ) && isdefined( var_1._id_251B ) && var_1._id_251B == 4 )
                var_1 delete();
        }
    }
}

_id_62AB()
{
    self endon( "LISTEN_end_hummer_script" );
}

_id_62AC()
{
    self._id_62AD = _id_5F9E::_id_5F52( self.target );
    self._id_62AE = 1;
    self._id_62AF = [];
    self thermaldrawenable();
    self setcandamage( 0 );
    thread _id_62B6();
    thread _id_62B2();
    thread _id_62BB();
}

_id_62B0()
{
    self._id_62AD = _id_5F9E::_id_5F52( self.target );
    self._id_62AE = 1;
    self._id_62AF = [];
    self thermaldrawenable();
    self dontcastshadows();
    thread _id_62B2();
    thread _id_62BB();
    maps\_utility::_id_13DE( "contrails" );
}

_id_62B1()
{
    self thermaldrawenable();
    thread _id_4960::_id_443C();
    thread _id_6296( "script_vehicle_f15_low" );
}

_id_62B2()
{
    self endon( "death" );

    foreach ( var_2, var_1 in self._id_62AD )
    {
        if ( var_2 > 0 )
        {
            var_1 waittill( "trigger" );
            self._id_62AE = var_2;
        }
    }
}

_id_62B3( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "default" );
    var_2 = _id_5F9E::_id_5F0F( var_2, 1 );
    var_3 = ( 76.0, -74.0, 20.0 );
    var_4 = ( 76.0, 74.0, 20.0 );
    var_5 = ( 76.0, -74.0, 25.0 );
    var_6 = ( 76.0, 74.0, 25.0 );
    var_7 = 0.05;
    var_8 = 0;

    for ( var_9 = common_scripts\utility::getfx( common_scripts\utility::ter_op( var_1 == "ac130", "FX_jet_20mm_tracer_ac130", "FX_jet_20mm_tracer" ) ); var_8 < var_0; var_8 += 2 * var_7 )
    {
        var_10 = maps\paris_ac130_slamzoom::_id_570B( self.origin, self.angles, var_4 );
        var_11 = self._id_62AE;
        var_11 += common_scripts\utility::ter_op( var_11 >= self._id_62AD.size - var_2, 0, var_2 );
        var_12 = common_scripts\utility::ter_op( var_1 == "ac130", self.angles, self._id_62AD[var_11].angles );
        var_13 = anglestoforward( var_12 );
        playfx( var_9, var_10, var_13 );
        wait(var_7);
        var_14 = maps\paris_ac130_slamzoom::_id_570B( self.origin, self.angles, var_3 );
        var_11 = self._id_62AE;
        var_11 += common_scripts\utility::ter_op( var_11 >= self._id_62AD.size - var_2, 0, var_2 );
        var_12 = common_scripts\utility::ter_op( var_1 == "ac130", self.angles, self._id_62AD[var_11].angles );
        var_13 = anglestoforward( var_12 );
        playfx( var_9, var_14, var_13 );
        wait(var_7);
    }
}

_id_62B4( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "default" );
    var_2 = _id_5F9E::_id_5F0F( var_2, 1 );
    var_3 = ( 76.0, -74.0, 20.0 );
    var_4 = ( 76.0, 74.0, 20.0 );
    var_5 = ( 76.0, -74.0, 25.0 );
    var_6 = ( 76.0, 74.0, 25.0 );
    var_7 = 0.05;
    var_8 = 0;
    var_9 = common_scripts\utility::ter_op( var_1 == "ac130", "FX_jet_20mm_tracer_ac130", "FX_jet_20mm_tracer" );
    var_10 = common_scripts\utility::getfx( var_9 );

    while ( isdefined( var_0 ) )
    {
        var_11 = maps\paris_ac130_slamzoom::_id_570B( self.origin, self.angles, var_4 );
        var_12 = self._id_62AE;
        var_12 += common_scripts\utility::ter_op( var_12 >= self._id_62AD.size - var_2, 0, var_2 );
        var_13 = common_scripts\utility::ter_op( var_1 == "ac130", self.angles, self._id_62AD[var_12].angles );
        var_14 = anglestoforward( var_13 );
        playfx( var_10, var_11, var_14 );
        wait(var_7);
        var_8 += var_7;

        if ( isdefined( var_0 ) )
        {
            var_15 = maps\paris_ac130_slamzoom::_id_570B( self.origin, self.angles, var_3 );
            var_12 = self._id_62AE;
            var_12 += common_scripts\utility::ter_op( var_12 >= self._id_62AD.size - var_2, 0, var_2 );
            var_13 = common_scripts\utility::ter_op( var_1 == "ac130", self.angles, self._id_62AD[var_12].angles );
            var_14 = anglestoforward( var_13 );
            playfx( var_10, var_11, var_14 );
            wait(var_7);
            var_8 += var_7;
        }
    }
}

_id_62B5()
{
    self endon( "death" );
    var_0 = ( 76.0, -74.0, 20.0 );
    var_1 = ( 76.0, 74.0, 20.0 );
    var_2 = common_scripts\utility::getfx( "FX_jet_20mm_tracer_ac130" );

    for (;;)
    {
        var_3 = maps\paris_ac130_slamzoom::_id_570B( self.origin, self.angles, var_1 );
        var_4 = anglestoforward( self.angles );
        playfx( var_2, var_3, var_4 );
        wait 0.05;
        var_5 = maps\paris_ac130_slamzoom::_id_570B( self.origin, self.angles, var_0 );
        var_4 = anglestoforward( self.angles );
        playfx( var_2, var_5, var_4 );
        wait 0.05;
    }
}

_id_62B6()
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F51( "afterburner", "script_noteworthy", self._id_62AD );

    foreach ( var_2 in var_0 )
    {
        var_2 waittill( "trigger" );
        var_3 = common_scripts\utility::getfx( "FX_jet_afterburner_ignite" );
        playfxontag( var_3, self, "tag_engine_right" );
        playfxontag( var_3, self, "tag_engine_left" );
        var_3 = common_scripts\utility::getfx( "FX_jet_smoke_trail_quick" );
        playfxontag( var_3, self, "tag_engine_right" );
        playfxontag( var_3, self, "tag_engine_left" );
    }
}

_id_62B7( var_0 )
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    wait(var_0);

    if ( !isdefined( self ) )
        return;

    var_1 = common_scripts\utility::getfx( "FX_jet_afterburner_ignite" );
    playfxontag( var_1, self, "tag_engine_right" );
    playfxontag( var_1, self, "tag_engine_left" );
    var_1 = common_scripts\utility::getfx( "FX_jet_smoke_trail_quick" );
    playfxontag( var_1, self, "tag_engine_right" );
    playfxontag( var_1, self, "tag_engine_left" );
}

_id_62B8( var_0, var_1 )
{
    self endon( "death" );
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "veh_paris_ac130_jet_sonic_boom" );
    thread common_scripts\utility::play_loop_sound_on_entity( "veh_f15_dist_loop" );
    _id_5F9E::_id_5F79( self, var_0, 64.0 );
    level thread common_scripts\utility::play_sound_in_space( var_1, var_0 );
}

_id_62B9( var_0 )
{
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, "veh_paris_ac130_jet_sonic_boom" );
    var_1 = _id_5F9E::_id_5F51( "sonic_boom", "script_noteworthy", self._id_62AD );

    foreach ( var_3 in var_1 )
        thread _id_62BA( var_3, var_0 );

    thread common_scripts\utility::play_loop_sound_on_entity( "veh_f15_dist_loop" );
}

_id_62BA( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::play_sound_in_space( var_1 );
}

_id_62BB()
{
    self endon( "death" );
    var_0 = level._id_2994["script_vehicle_f15_low"];

    for (;;)
    {
        if ( isdefined( self._id_2991 ) )
        {
            self._id_2991 waittill( "trigger" );

            if ( self vehicle_getspeed() == 0 || !self._id_29B7 )
            {
                wait 0.1;
                continue;
            }

            while ( level.player istouching( self._id_2991 ) && self._id_29B7 && self vehicle_getspeed() > 0 )
            {
                if ( _id_5F9E::_id_5F15( level.ac130player.origin, self.origin, self._id_29A7 * 0.75 ) )
                    common_scripts\utility::flag_set( "FLAG_ac130_rumble" );

                wait(self._id_29A5 + randomfloat( self._id_29B5 ));
            }

            continue;
        }

        wait 0.05;
    }
}

_id_62BC()
{
    self endon( "death" );

    if ( self._id_62AD.size - 1 > 0 )
        self._id_62AD[self._id_62AD.size - 1] waittill( "trigger" );
    else
        self waittill( "reached_dynamic_path_end" );

    foreach ( var_1 in self._id_62AF )
    {
        if ( isdefined( var_1 ) )
        {
            stopfxontag( common_scripts\utility::getfx( "FX_f15_fake" ), var_1, "tag_origin" );
            var_1 delete();
        }
    }

    if ( isdefined( self._id_62BD ) )
        self._id_62BD delete();

    common_scripts\utility::stop_loop_sound_on_entity( "veh_f15_dist_loop" );
    self delete();
    self notify( "death" );
}

_id_62BE( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    wait(var_0);

    if ( !isdefined( self ) )
        return;

    self notify( "death" );
    self notify( "kill_rumble_forever" );

    if ( isdefined( self._id_443B ) )
        self._id_443B delete();

    if ( isdefined( self._id_495C ) )
        self._id_495C delete();

    if ( isdefined( self._id_2991 ) )
        self._id_2991 delete();

    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_62BF()
{
    self._id_4E08 = _id_5F9E::_id_5F52( self.target );
    self._id_62C0 = 1;
    self thermaldrawenable();
    self setcandamage( 0 );
    thread _id_62C3();
}

_id_62C1( var_0 )
{
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, "veh_paris_ac130_jet_sonic_boom" );
    var_1 = _id_5F9E::_id_5F51( "sonic_boom", "script_noteworthy", self._id_4E08 );

    foreach ( var_3 in var_1 )
        thread _id_62C2( var_3, var_0 );
}

_id_62C2( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::play_sound_in_space( var_1 );
}

_id_62C3()
{
    self endon( "death" );
    var_0 = level._id_2994["script_vehicle_a10_warthog"];

    for (;;)
    {
        if ( isdefined( self._id_2991 ) )
        {
            self._id_2991 waittill( "trigger" );

            if ( self vehicle_getspeed() == 0 || !self._id_29B7 )
            {
                wait 0.1;
                continue;
            }

            while ( level.player istouching( self._id_2991 ) && self._id_29B7 && self vehicle_getspeed() > 0 )
            {
                if ( _id_5F9E::_id_5F15( level.ac130player.origin, self.origin, self._id_29A7 * 0.75 ) )
                    common_scripts\utility::flag_set( "FLAG_ac130_rumble" );

                wait(self._id_29A5 + randomfloat( self._id_29B5 ));
            }

            continue;
        }

        wait 0.05;
    }
}

_id_62C4()
{
    self endon( "death" );

    if ( self._id_4E08.size - 1 > 0 )
        self._id_4E08[self._id_4E08.size - 1] waittill( "trigger" );
    else
        self waittill( "reached_dynamic_path_end" );

    self delete();
    self notify( "death" );
}

_id_62C5( var_0, var_1 )
{
    var_2 = _id_5F9E::_id_5F52( var_0[0].target );
    var_3 = spawn( "script_model", var_0[0].origin );
    var_3 setmodel( "tag_origin" );
    var_3.angles = vectortoangles( var_2[0].origin - var_0[0].origin );
    var_3.targetname = var_0[0].script_noteworthy;
    var_3 endon( "death" );

    foreach ( var_5 in var_0 )
        var_5 linkto( var_3, "tag_origin" );

    var_7 = 0;

    for ( var_1 = common_scripts\utility::ter_op( var_1 <= 0, 100.0, var_1 ); var_7 < var_2.size; var_7++ )
    {
        var_8 = distance2d( var_3.origin, var_2[var_7].origin );
        var_9 = var_8 / var_1;
        var_3 moveto( var_2[var_7].origin, var_9 );
        var_10 = vectortoangles( var_2[var_7].origin - var_3.origin );
        var_3 rotateto( var_10, var_9 );
        wait(var_9 - 0.05);
    }
}

_id_62C6()
{
    self endon( "death" );
    self.health = 100000;
    self setcandamage( 1 );
    var_0 = 500;

    for (;;)
    {
        self waittill( "damage", var_1 );

        if ( var_1 > var_0 )
            break;
    }

    var_2 = common_scripts\utility::getfx( "FX_barge_a_explosion" );
    var_3 = self.origin;
    var_4 = ( 0.0, 0.0, 1.0 );
    playfx( var_2, var_3, var_4 );
    var_5 = getent( self.script_noteworthy, "targetname" );

    if ( isdefined( var_5 ) )
        var_5 delete();

    self hide();
    self notsolid();
    var_6 = spawn( "script_model", self.origin );
    var_6.angles = ( self.angles[0], self.angles[1] - 90, self.angles[2] );
    var_6 setmodel( "ac_prs_enm_barge_a_1_dam_animated" );
    var_6._id_1032 = "barge_a";
    var_6 maps\_anim::_id_1244();
    var_6 maps\_anim::_id_11DD( [ var_6 ], "paris_ac130_barge_sink" );
    wait 5.0;
    var_6 delete();
    self delete();
}

_id_62C7()
{
    self endon( "death" );
    self.health = 100000;
    self setcandamage( 1 );
    var_0 = 500;

    for (;;)
    {
        self waittill( "damage", var_1 );

        if ( var_1 > var_0 )
            break;
    }

    var_2 = common_scripts\utility::getfx( "FX_barge_a_explosion" );
    var_3 = self.origin;
    var_4 = ( 0.0, 0.0, 1.0 );
    playfx( var_2, var_3, var_4 );
    var_5 = getent( self.script_noteworthy, "targetname" );

    if ( isdefined( var_5 ) )
        var_5 delete();

    self hide();
    self notsolid();
    var_6 = spawn( "script_model", self.origin );
    var_6.angles = ( self.angles[0], self.angles[1] - 90, self.angles[2] );
    var_6 setmodel( "ac_prs_enm_barge_a_2_dam_animated" );
    var_6._id_1032 = "barge_a";
    var_6 maps\_anim::_id_1244();
    var_6 maps\_anim::_id_11DD( [ var_6 ], "paris_ac130_barge_sink" );
    wait 5.0;
    var_6 delete();
    self delete();
}

_id_62C8( var_0 )
{
    self endon( "death" );
    var_1 = _id_5F9E::_id_5F52( self.target );
    var_2 = 0;

    for ( var_0 = common_scripts\utility::ter_op( var_0 <= 0, 100.0, var_0 ); var_2 < var_1.size; var_2++ )
    {
        var_3 = distance2d( self.origin, var_1[var_2].origin );
        var_4 = var_3 / var_0;
        self moveto( var_1[var_2].origin, var_4 );
        var_5 = vectortoangles( var_1[var_2].origin - self.origin );
        self rotateto( ( var_5[0], var_5[1] - 90, var_5[2] ), var_4 );
        wait(var_4 - 0.05);
    }
}

_id_62C9()
{
    self endon( "death" );
    self.health = 100000;
    self setcandamage( 1 );
    var_0 = 500;

    for (;;)
    {
        self waittill( "damage", var_1 );

        if ( var_1 > var_0 )
            break;
    }

    var_2 = common_scripts\utility::getfx( "FX_missile_boat_a_explosion" );
    var_3 = self.origin;
    var_4 = ( 0.0, 0.0, 1.0 );
    playfx( var_2, var_3, var_4 );
    self._id_1032 = "missle_boat_a";
    maps\_anim::_id_1244();
    maps\_anim::_id_11DD( [ self ], "paris_ac130_ship_sink" );
}

_id_62CA( var_0, var_1 )
{
    self endon( "death" );
    var_2 = _id_5F9E::_id_5F52( self.target );
    var_3 = 0;

    for ( var_0 = common_scripts\utility::ter_op( var_0 <= 0, 100.0, var_0 ); var_3 < var_2.size; var_3++ )
    {
        var_4 = distance2d( self.origin, var_2[var_3].origin );
        var_5 = var_4 / var_0;
        self moveto( var_2[var_3].origin, var_5 );
        var_6 = vectortoangles( var_2[var_3].origin - self.origin );
        self rotateto( ( var_6[2], var_6[1] - 90, -1 * var_6[0] ), var_5 );
        wait(var_5 - 0.05);
    }

    if ( var_1 )
        self delete();
}

_id_62CB()
{
    self endon( "death" );
    self.health = 100000;
    self setcandamage( 1 );
    self waittill( "damage" );
    var_0 = common_scripts\utility::getfx( "FX_truck_a" );
    var_1 = self.origin;
    var_2 = ( 0.0, 0.0, 1.0 );
    playfx( var_0, var_1, var_2 );
    var_0 = common_scripts\utility::getfx( "FX_truck_a_fire_trail" );
    playfx( var_0, var_1, var_2 );
    var_3 = spawn( "script_model", self.origin );
    var_3 setmodel( "test_box" );

    if ( isdefined( self.angles ) )
        var_3.angles = self.angles;

    self delete();
}

_id_62CC( var_0, var_1 )
{
    self endon( "death" );
    var_2 = _id_5F9E::_id_5F52( self.target );
    var_3 = 0;

    for ( var_0 = common_scripts\utility::ter_op( var_0 <= 0, 100.0, var_0 ); var_3 < var_2.size; var_3++ )
    {
        var_4 = distance2d( self.origin, var_2[var_3].origin );
        var_5 = var_4 / var_0;
        var_6 = var_5 / 10;
        self moveto( var_2[var_3].origin, var_5 );
        var_7 = vectortoangles( var_2[var_3].origin - self.origin );
        self rotateto( ( var_7[0], var_7[1] + 90, var_7[2] ), var_5 - var_6 );
        wait(var_5 - 0.05);
    }

    if ( var_1 )
        self delete();
}

_id_62CD()
{
    self endon( "death" );
    self.health = 100000;
    self setcandamage( 1 );
    self waittill( "damage" );
    var_0 = common_scripts\utility::getfx( "FX_truck_a" );
    var_1 = self.origin;
    var_2 = ( 0.0, 0.0, 1.0 );
    playfx( var_0, var_1, var_2 );
    var_0 = common_scripts\utility::getfx( "FX_truck_a_fire_trail" );
    playfx( var_0, var_1, var_2 );
    var_3 = spawn( "script_model", self.origin );
    var_3 setmodel( "test_box" );

    if ( isdefined( self.angles ) )
        var_3.angles = self.angles;

    self delete();
}

_id_62CE( var_0, var_1 )
{
    maps\_vehicle::_id_2A12();
    _id_5F9E::_id_5F50( var_0, var_1 );
    self._id_62CF = [];
    self thermaldrawenable();
    thread _id_62D0();
    thread _id_62D1();
}

_id_62D0()
{
    self endon( "death" );
    self.health = 10000;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        self.health = 10000;
    }
}

_id_62D1()
{
    self endon( "death" );
    var_0 = 1;
    var_1 = 0;

    for (;;)
    {
        level.player waittill( "projectile_impact", var_2, var_3 );
        var_4 = -1;

        switch ( var_2 )
        {
            case "ac130_40mm_alt2":
                var_4 = 320;
                break;
            case "ac130_105mm_alt2":
                var_4 = 512;
                break;
            default:
                continue;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_3, var_4 ) )
        {
            var_5 = 0;

            switch ( var_2 )
            {
                case "ac130_40mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
                    var_1++;
                    break;
                case "ac130_105mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
                    var_5 = 1;
                    break;
            }

            if ( var_1 >= var_0 )
                var_5 = 1;

            if ( var_5 )
            {
                maps\_vehicle::_id_2A13();
                self dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
                return;
            }
        }
    }
}

_id_62D2( var_0 )
{
    self endon( "death" );
    self endon( "LISTEN_btr_end_randomly_shoot_at_targets" );
    var_1 = 3.0;

    for (;;)
    {
        var_0 = common_scripts\utility::array_removeundefined( var_0 );
        var_0 = maps\_utility::_id_1361( var_0 );

        if ( var_0.size > 0 )
        {
            self setturrettargetent( var_0[randomint( var_0.size )] );
            wait(var_1);
        }

        wait 0.05;
    }
}

_id_62D3( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = 4;
    var_1 = _id_5F9E::_id_5EDF( var_1, 1, var_3 );
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, 0 );
    var_4 = [];
    var_5 = var_0.origin;

    for ( var_6 = 0; var_6 < var_1; var_6++ )
    {
        var_0.count = 1;
        var_0._id_251B = var_6;
        var_0.origin = ( var_5[0], var_5[1] + 64.0, var_5[2] );

        if ( var_0 _id_5F9E::_id_5F0A( "script_drone", 1 ) )
        {
            var_4[var_6] = var_0 spawndrone();
            var_4[var_6] useanimtree( level._id_1245["drone"] );
            var_4[var_6] thermaldrawenable();
        }
        else
        {
            var_4[var_6] = var_0 stalingradspawn();
            maps\_utility::_id_13AF( var_4[var_6] );
        }

        wait 0.05;
    }

    if ( var_2 )
    {
        foreach ( var_8 in var_4 )
        {
            var_8 notify( "enteredvehicle" );
            maps\_vehicle_aianim::_id_24E5( var_8, 0 );
        }
    }
    else
        maps\_vehicle::_id_2515( var_4 );

    self._id_62D4 = var_4;
}

_id_62D5()
{
    self endon( "death" );

    foreach ( var_1 in self._id_62D4 )
    {
        foreach ( var_3 in self._id_62CF )
        {
            if ( isdefined( var_1 ) )
                var_1 thread [[ var_3 ]]();
        }
    }

    maps\_vehicle::_id_2514();
}

_id_62D6( var_0 )
{
    self._id_62CF = var_0;
}

_id_0051( var_0 )
{
    if ( isdefined( level._id_0051 ) && level._id_0051 )
        return;

    level._id_0051 = 0;
    var_1 = 0.25;
    var_2 = [ 0, 0, 0 ];

    while ( !level._id_0051 )
    {
        foreach ( var_4 in var_0 )
        {
            if ( !isdefined( var_4 ) || level._id_0051 )
                return;
        }

        foreach ( var_7, var_4 in var_0 )
        {
            if ( var_2[var_7] == 0 && var_4 maps\_utility::_id_1008( "FLAG_t72_killed_by_105mm" ) )
                var_2[var_7] = gettime();
        }

        if ( var_2[1] != 0 && abs( var_2[0] - var_2[1] ) <= var_1 && abs( var_2[2] - var_2[1] ) <= var_1 )
            level._id_0051 = 1;

        wait 0.05;
    }

    level.player maps\_utility::_id_1E39( "MENAGE_A_TROIS" );
}

_id_62D7( var_0, var_1, var_2 )
{
    maps\_utility::_id_1402( "FLAG_t72_init" );
    maps\_utility::_id_1402( "FLAG_t72_killed_by_40mm" );
    maps\_utility::_id_1402( "FLAG_t72_killed_by_105mm" );
    _id_5F9E::_id_5F50( var_0, var_1 );
    self._id_62D8 = _id_5F9E::_id_5F0F( var_2, 1 );
    maps\_vehicle::_id_2A12();
    self thermaldrawenable();
    thread _id_62D9();
    thread _id_62DA();
    thread _id_62DB();
    maps\_utility::_id_13DC( "FLAG_t72_init" );
}

_id_62D9()
{
    self endon( "death" );
    self.health = 10000;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        self.health = 9999;
    }
}

_id_62DA()
{
    self waittill( "death" );

    if ( isdefined( self ) )
    {
        self joltbody( self.origin + ( 23.0, 33.0, 64.0 ), 10 );
        stopfxontag( common_scripts\utility::getfx( "FX_t72_damaged_smoke" ), self, "tag_deathfx" );
    }
}

_id_62DB()
{
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        level.player waittill( "projectile_impact", var_1, var_2 );
        var_3 = -1;

        switch ( var_1 )
        {
            case "ac130_40mm_alt2":
                var_3 = 128;
                break;
            case "ac130_105mm_alt2":
                var_3 = 512;
                break;
            default:
                continue;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_2, var_3 ) )
        {
            var_4 = 0;

            switch ( var_1 )
            {
                case "ac130_40mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
                    var_0++;
                    break;
                case "ac130_105mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
                    maps\_utility::_id_13DC( "FLAG_t72_killed_by_105mm" );
                    var_4 = 1;
                    break;
            }

            switch ( var_0 )
            {
                case 1:
                    playfxontag( common_scripts\utility::getfx( "FX_t72_damaged_smoke" ), self, "tag_deathfx" );
                    break;
            }

            if ( var_0 >= self._id_62D8 )
            {
                maps\_utility::_id_13DC( "FLAG_t72_killed_by_40mm" );
                var_4 = 1;
            }

            if ( var_4 )
            {
                stopfxontag( common_scripts\utility::getfx( "FX_t72_damaged_smoke" ), self, "tag_deathfx" );
                maps\_vehicle::_id_2A13();
                self dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
                self notify( "LISTEN_killed_by_player" );
            }
        }
    }
}

_id_62DC( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self notify( "LISTEN_end_t72_randomly_shoot_canon_fake2" );
    self endon( "death" );
    self endon( "LISTEN_end_t72_randomly_shoot_canon_fake2" );

    if ( isdefined( self.target ) )
    {
        var_1 = _id_5F9E::_id_5F52( self.target );
        var_2 = _id_5F9E::_id_5F51( "shoot", "script_noteworthy", var_1 )[0];

        if ( isdefined( var_2 ) )
            var_2 waittill( "trigger" );
    }

    while ( isdefined( self ) )
    {
        var_3 = 1.5;
        var_4 = 0;
        var_5 = 4.5;

        while ( isdefined( self ) && var_4 < var_5 )
        {
            var_6 = vectornormalize( anglestoforward( self.angles + ( 0, randomfloatrange( -15, 15 ), 0 ) ) );
            var_7 = self.origin + var_6 * 1024;
            self setturrettargetvec( var_7 );
            var_4 += var_3;
            wait(var_3);
        }

        if ( !isdefined( self ) )
            return;

        var_7 = var_0[randomint( var_0.size )].origin + ( randomfloatrange( -512, 512 ), randomfloatrange( -512, 512 ), randomfloatrange( 128, 256 ) );
        self setturrettargetvec( var_7 );
        wait(randomfloatrange( 3, 8 ));
        var_8 = self gettagorigin( "tag_flash" );
        var_9 = var_8 + anglestoforward( self gettagangles( "tag_flash" ) ) * 10000;
        magicbullet( "t72_125mm", var_8, var_9 );
    }
}

_id_62DD( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self notify( "LISTEN_end_t72_randomly_shoot_canon_fake" );
    self endon( "death" );
    self endon( "LISTEN_end_t72_randomly_shoot_canon_fake" );
    self setturrettargetvec( var_0.origin );
    wait 0.5;
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_1 + anglestoforward( self gettagangles( "tag_flash" ) ) * 10000;
    magicbullet( "t72_125mm", var_1, var_2 );
}

_id_62DE()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = ( 0.0, 0.0, 1.0 );
    var_1 = ( 0.0, 0.0, 0.0 );

    if ( isdefined( self.angles ) )
    {
        var_0 = anglestoforward( self.angles );
        var_1 = anglestoup( self.angles );
    }

    playfx( common_scripts\utility::getfx( "FX_t72_shell_hitting_building" ), self.origin, var_0, var_1 );
}

_id_62DF()
{
    self endon( "death" );
    var_0 = 2.0;

    for (;;)
    {
        var_1 = vectornormalize( anglestoforward( self.angles + ( 0, randomfloatrange( -15, 15 ), 0 ) ) );
        var_2 = self.origin + var_1 * 1024;
        self setturrettargetvec( var_2 );
        wait(var_0);
    }
}

_id_62E0()
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F52( self.target );
    var_1 = _id_5F9E::_id_5F51( "explosion", "script_noteworthy", var_0 )[0];

    if ( isdefined( var_1 ) )
    {
        var_1 waittill( "trigger" );
        var_2 = common_scripts\utility::getfx( "FX_t72_explosion" );
        var_3 = self.origin;
        var_4 = ( 0.0, 0.0, 1.0 );
        playfx( var_2, var_3, var_4 );
        maps\_vehicle::_id_2A13();
        wait 0.05;
        self dodamage( 10000, self.origin );
        self notify( "death" );
    }
}

_id_62E1( var_0, var_1, var_2 )
{
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, "STATE_air" );
    maps\_utility::_id_1402( "FLAG_helicopter_init" );
    maps\_utility::_id_1402( "FLAG_helicopter_pilot_loaded" );
    maps\_utility::_id_1402( "FLAG_helicopter_passengers_loaded" );
    maps\_utility::_id_1402( "FLAG_helicopter_passengers_unloading" );
    maps\_utility::_id_1402( "FLAG_helicopter_passengers_unloaded" );
    maps\_utility::_id_1402( "FLAG_helicopter_drop_off_passengers" );
    maps\_utility::_id_1402( "FLAG_helicopter_instant_death" );
    maps\_utility::_id_1402( "FLAG_helicopter_instant_death_40mm" );
    maps\_utility::_id_1402( "FLAG_helicopter_instant_death_105mm" );
    maps\_utility::_id_1402( "FLAG_helicopter_die" );

    switch ( var_2 )
    {
        case "STATE_air":
        case "STATE_ground":
        case "STATE_ground_loading":
        case "STATE_air_unloading":
            break;
        default:
            var_2 = "STATE_ground";
            break;
    }

    self._id_62E2 = var_2;
    self._id_62E3 = [];
    self._id_62E4 = _id_5F9E::_id_5F52( self.target );
    _id_5F9E::_id_5F50( var_0, "script_noteworthy" );
    self thermaldrawenable();
    thread _id_62EA();
    thread _id_62EC();
    thread _id_62EF();
    maps\_utility::_id_13DC( "FLAG_helicopter_init" );
}

_id_62E5()
{
    maps\_utility::_id_1402( "FLAG_helicopter_init" );
    maps\_utility::_id_1402( "FLAG_helicopter_pilot_loaded" );
    maps\_utility::_id_1402( "FLAG_helicopter_passengers_loaded" );
    self._id_62E2 = "STATE_air";
    self thermaldrawenable();
    maps\_vehicle::_id_2A12();
    self setcandamage( 0 );
    maps\_utility::_id_13DC( "FLAG_helicopter_init" );
    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_loaded" );
}

_id_62E6( var_0 )
{
    self._id_62E7 = var_0;
    self._id_62E8 = [];
    self._id_62E4 = _id_5F9E::_id_5F52( self.target );
    var_0 hide();
    self linkto( var_0 );
    self thermaldrawenable();
    self setcandamage( 0 );
    thread _id_62FA();
}

_id_62E9( var_0 )
{
    var_0 = _id_5F9E::_id_5EDF( var_0, 0, 3 );

    if ( var_0 == 0 )
        return;
    else
    {
        var_1 = anglestoforward( self.angles );
        var_2 = anglestoright( self.angles );
        var_3 = anglestoup( self.angles );
        var_4 = [ [ -1024, -512, 96 ], [ -2048, -256, -96 ], [ -4096, 256, 32 ], [ -6144, 128, -32 ] ];
        var_5 = [];

        for ( var_6 = 0; var_6 < var_0; var_6++ )
        {
            var_5[var_6] = spawn( "script_model", self.origin + var_4[var_6][0] * var_1 + var_4[var_6][1] * var_2 + var_4[var_6][2] * var_3 );
            var_5[var_6].angles = self.angles + ( 0, 0, randomfloatrange( -90, 90 ) );
            var_5[var_6] setmodel( "vehicle_mi17_woodland_fly_cheap" );
            var_5[var_6] thermaldrawenable();
            var_5[var_6] notsolid();
            var_5[var_6] linkto( self, "tag_origin" );
        }

        self._id_62E8 = var_5;
    }
}

_id_62EA()
{
    self endon( "death" );
    self endon( "LISTEN_helicopter_end_on_damage" );
    self.health = 2 * self._id_163B;
    self setcandamage( 1 );
    var_0 = 1500;
    var_1 = 0;

    while ( var_1 < var_0 )
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
        self.health = 2 * self._id_163B;

        if ( _id_5F9E::_id_5F0D( var_3, level.player ) && isdefined( var_11 ) )
        {
            switch ( var_11 )
            {
                case "ac130_25mm_alt2":
                    var_1 += var_2;
                    continue;
                case "ac130_40mm_alt2":
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death_40mm" );
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death" );
                    var_1 = 1500;
                    continue;
                case "ac130_105mm_alt2":
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death_105mm" );
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death" );
                    var_1 = 1500;
                    continue;
                default:
                    continue;
            }
        }
    }

    if ( target_istarget( self ) )
        target_remove( self );

    maps\_utility::_id_13DC( "FLAG_helicopter_die" );

    if ( isdefined( self._id_62EB ) )
    {
        foreach ( var_13 in self._id_62EB )
        {
            if ( isdefined( var_13 ) && isalive( var_13 ) )
            {
                var_13 _id_636E();
                var_13 dodamage( 10000, var_13.origin, level.player );
            }

            wait(randomfloatrange( 2.0, 3.0 ));
        }
    }
}

_id_62EC()
{
    maps\_utility::_id_1654( "FLAG_helicopter_die" );
    self notify( "LISTEN_killed_by_player" );

    switch ( self._id_62E2 )
    {
        case "STATE_ground":
            break;
        case "STATE_ground_loading":
            break;
        case "STATE_air":
            self notify( "LISTEN_helicopter_dying" );

            if ( !maps\_utility::_id_1008( "FLAG_helicopter_instant_death" ) )
            {
                thread maps\_vehicle::_id_29DB();
                self waittill( "crash_done" );
            }

            if ( isdefined( self._id_62ED ) )
            {
                self._id_62ED _id_636E();
                self._id_62ED notify( "death", level.player );
                self._id_62ED delete();
            }

            if ( maps\_utility::_id_1008( "FLAG_helicopter_passengers_unloaded" ) && isdefined( self._id_62EB ) )
            {
                self._id_62EB = maps\_utility::_id_1361( self._id_62EB );
                self._id_62EB = common_scripts\utility::array_removeundefined( self._id_62EB );

                foreach ( var_1 in self._id_62EB )
                {
                    var_1 _id_636E();
                    var_1 dodamage( 10000, var_1.origin );
                }
            }

            break;
        case "STATE_air_unloading":
            if ( !maps\_utility::_id_1008( "FLAG_helicopter_instant_death" ) )
            {
                thread maps\_vehicle::_id_29DB();
                self waittill( "crash_done" );
            }

            break;
    }

    if ( !isdefined( self ) )
        return;

    playfx( common_scripts\utility::getfx( "FX_mi17_explosion" ), self.origin + ( 0.0, 0.0, -64.0 ) );
    playfx( common_scripts\utility::getfx( "FX_40mm_metal_impact_a" ), self.origin + ( 0.0, 0.0, -64.0 ) );
    level thread common_scripts\utility::play_sound_in_space( "scn_ac130_helicopter_exp", self.origin );

    if ( maps\_utility::_id_1008( "FLAG_helicopter_instant_death_40mm" ) )
        level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );

    if ( maps\_utility::_id_1008( "FLAG_helicopter_instant_death_105mm" ) )
        level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );

    self notify( "death", level.player );
    self notify( "newpath" );
    self notify( "crash_done" );
    self delete();
}

_id_62EE()
{
    self endon( "death" );

    while ( !maps\_utility::_id_1008( "FLAG_helicopter_instant_death" ) && !maps\_utility::_id_1008( "FLAG_helicopter_die" ) )
        wait 0.05;

    maps\_utility::_id_13DC( "FLAG_helicopter_die" );
}

_id_62EF()
{
    self endon( "death" );
    thread _id_62EE();

    for (;;)
    {
        level.player waittill( "missile_fire", var_0, var_1 );

        if ( isdefined( var_0 ) && isdefined( var_1 ) )
        {
            switch ( var_1 )
            {
                case "ac130_40mm_alt2":
                    var_2 = [ "FLAG_helicopter_instant_death", "FLAG_helicopter_instant_death_40mm" ];
                    thread _id_5F9E::_id_5F67( var_0, 256, var_2 );
                    break;
                case "ac130_105mm_alt2":
                    var_2 = [ "FLAG_helicopter_instant_death", "FLAG_helicopter_instant_death_105mm" ];
                    thread _id_5F9E::_id_5F67( var_0, 256, var_2 );
                    break;
                default:
                    continue;
            }
        }
    }
}

_id_62F0()
{
    self endon( "death" );
    self endon( "LISTEN_helicopter_dying" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );
    maps\_utility::_id_1654( "FLAG_helicopter_pilot_loaded" );
    maps\_utility::_id_1654( "FLAG_helicopter_passengers_loaded" );
    thread maps\_vehicle::_id_1FA6( self );
    var_0 = _id_5F9E::_id_5F51( "drop_off", "targetname", self._id_62E4 )[0];
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, _id_5F9E::_id_5F51( "drop_off", "script_noteworthy", self._id_62E4 )[0] );
    _id_5F9E::_id_5F76( self, var_0, 32 );
    self vehicle_setspeedimmediate( 0, 30, 30 );
    maps\_utility::_id_25E4( "FLAG_helicopter_drop_off_passengers", 2.0 );
    self._id_62E2 = "STATE_air_unloading";
    maps\_vehicle::_id_2514();
    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_unloading" );

    foreach ( var_2 in self._id_62EB )
    {
        if ( isdefined( var_2 ) )
        {
            foreach ( var_4 in self._id_62E3 )
                var_2 thread [[ var_4 ]]();
        }
    }

    _id_5F9E::_id_5F7E( self._id_62EB, "jumpedout", 15 );
    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_unloaded" );
    self notify( "LISTEN_helicopter_passengers_unloaded" );
    wait 3;
    wait 5;
    var_7 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_8 = var_7 _id_5F9E::_id_5F4F( "speed" );
    var_8 = common_scripts\utility::ter_op( isdefined( var_8 ), var_8, 30 );
    self vehicle_setspeed( var_8, var_8 * 0.5, var_8 * 0.5 );
    self notify( "LISTEN_helicopter_resume_path" );
    self._id_62E2 = "STATE_air";
    var_9 = 30.0;
    common_scripts\utility::waittill_any_timeout( var_9, "reached_dynamic_path_end" );

    while ( maps\_utility::_id_26AD( self.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
        wait 0.05;

    self delete();
}

_id_62F1()
{
    self endon( "death" );
    self endon( "LISTEN_helicopter_dying" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );
    maps\_utility::_id_1654( "FLAG_helicopter_pilot_loaded" );
    maps\_utility::_id_1654( "FLAG_helicopter_passengers_loaded" );
    thread maps\_vehicle::_id_1FA6( self );
    var_0 = _id_5F9E::_id_5F51( "_drop_off", "targetname", self._id_62E4 )[0];
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, _id_5F9E::_id_5F51( "drop_off", "script_noteworthy", self._id_62E4 )[0] );
    _id_5F9E::_id_5F76( self, var_0, 32 );
    self vehicle_setspeedimmediate( 0, 30, 30 );
    maps\_utility::_id_25E4( "FLAG_helicopter_drop_off_passengers", 2.0 );
    self._id_62E2 = "STATE_air_unloading";
    maps\_vehicle::_id_2514();
    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_unloading" );
    _id_5F9E::_id_5F7E( self._id_62EB, "jumpedout", 15 );
    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_unloaded" );
    self notify( "LISTEN_helicopter_passengers_unloaded" );

    if ( isdefined( self._id_62EB ) && isarray( self._id_62EB ) )
    {
        self._id_62EB = maps\_utility::_id_1361( self._id_62EB );
        self._id_62EB = common_scripts\utility::array_removeundefined( self._id_62EB );

        foreach ( var_2 in self._id_62EB )
            var_2 thread _id_6363();
    }

    wait 3;
    wait 5;
    self vehicle_setspeedimmediate( 30, 30, 30 );
    self notify( "LISTEN_helicopter_resume_path" );
    self._id_62E2 = "STATE_air";
    var_4 = 120.0;
    common_scripts\utility::waittill_any_timeout( var_4, "reached_dynamic_path_end" );

    while ( maps\_utility::_id_26AD( self.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
        wait 0.05;

    self notify( "death", level.player );
    self delete();
}

_id_62F2( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );

    if ( isdefined( var_0 ) )
    {
        var_1 = undefined;

        if ( isdefined( var_0._id_212C ) && var_0._id_212C )
        {
            var_1 = var_0 spawndrone();
            var_1 useanimtree( level._id_1245["drone"] );
            var_1 thermaldrawenable();
        }
        else
        {
            var_1 = var_0 stalingradspawn();
            maps\_utility::_id_13AF( var_1 );
        }

        maps\_vehicle::_id_2515( [ var_1 ], 1 );
        self._id_62ED = var_1;
    }

    var_0 delete();
    maps\_utility::_id_13DC( "FLAG_helicopter_pilot_loaded" );
}

_id_62F3( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );

    if ( isdefined( var_0 ) )
    {
        var_0.count = 1;
        var_1 = undefined;

        if ( isdefined( var_0._id_212C ) && var_0._id_212C )
        {
            var_1 = var_0 spawndrone();
            var_1 useanimtree( level._id_1245["drone"] );
            var_1 thermaldrawenable();
        }
        else
        {
            var_1 = var_0 stalingradspawn();
            maps\_utility::_id_13AF( var_1 );
        }

        maps\_vehicle::_id_2515( [ var_1 ], 1 );
        self._id_62ED = var_1;
    }

    maps\_utility::_id_13DC( "FLAG_helicopter_pilot_loaded" );
}

_id_62F4( var_0, var_1 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );
    maps\_utility::_id_1654( "FLAG_helicopter_pilot_loaded" );
    var_1 = _id_5F9E::_id_5F0F( var_1, 1 );
    var_2 = [];
    var_3 = 1;
    var_4 = var_0.origin;

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        var_0.count = 1;
        var_0._id_251B = var_3;
        var_0.origin = ( var_4[0], var_4[1] + 64.0, var_4[2] );

        if ( var_0 _id_5F9E::_id_5F0A( "script_drone", 1 ) )
        {
            var_2[var_5] = var_0 spawndrone();
            var_2[var_5] useanimtree( level._id_1245["drone"] );
            var_2[var_5] thermaldrawenable();
        }
        else
        {
            var_2[var_5] = var_0 stalingradspawn();
            maps\_utility::_id_13AF( var_2[var_5] );
        }

        var_3++;
        wait 0.05;
    }

    maps\_vehicle::_id_2515( var_2 );
    self._id_62EB = var_2;
    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_loaded" );
}

_id_62F5( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );
    maps\_utility::_id_1654( "FLAG_helicopter_pilot_loaded" );
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        var_1[var_4] = var_3 stalingradspawn();
        maps\_utility::_id_13AF( var_1[var_4] );
    }

    waittillframeend;
    var_5 = [];

    foreach ( var_4, var_7 in var_1 )
    {
        var_7 thread _id_635D( self );

        if ( isdefined( var_7.script_noteworthy ) )
        {
            var_8 = getnode( var_7.script_noteworthy + "_dest", "targetname" );

            if ( isdefined( var_8 ) )
            {
                var_5[var_4] = var_8;
                var_8._id_62F6 = "1";
                var_7 maps\_spawner::_id_21AB( var_8 );

                if ( isdefined( var_7._id_62F7 ) )
                    self._id_62F7._id_62F6 = "0";

                self._id_62F7 = var_8;
                continue;
            }
        }
        else
        {

        }
    }

    var_9 = 20;
    var_10 = 16.0;

    foreach ( var_4, var_7 in var_1 )
    {
        if ( isalive( var_7 ) && isdefined( var_5[var_4] ) )
            thread _id_5F9E::_id_5F6D( var_7, var_5[var_4], var_10, "LISTEN_ai_goal_reached" );
    }

    _id_5F9E::_id_5F7E( var_1, "LISTEN_ai_goal_reached", var_9 );
    var_1 = maps\_utility::_id_1361( var_1 );
    var_1 = common_scripts\utility::array_removeundefined( var_1 );

    if ( var_1.size > 0 )
    {
        self._id_62E2 = "STATE_ground_loading";
        maps\_vehicle::_id_2515( var_1 );

        foreach ( var_7 in var_1 )
        {
            if ( var_7 maps\_utility::_id_133C( "FLAG_ai_loaded_in_vehicle" ) )
                var_7 maps\_utility::_id_13DC( "FLAG_ai_loaded_in_vehicle" );
        }

        self._id_62EB = var_1;
    }

    foreach ( var_3 in var_0 )
        var_3 delete();

    maps\_utility::_id_13DC( "FLAG_helicopter_passengers_loaded" );
}

_id_62F8( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_helicopter_init" );
    maps\_utility::_id_1654( "FLAG_helicopter_pilot_loaded" );
    maps\_utility::_id_1654( "FLAG_helicopter_passengers_loaded" );
    wait(randomfloat( _id_5F9E::_id_5F0F( var_0, 0 ) ));
    self._id_62E2 = "STATE_air";
    thread maps\_vehicle::_id_1FA6( self );
    thread _id_62F9();
    var_1 = _id_5F9E::_id_5F52( self.target );
    var_2 = _id_5F9E::_id_5F51( "ready_to_die", "script_noteworthy", var_1 )[0];

    if ( isdefined( var_2 ) )
    {
        var_2 waittill( "trigger" );
        self notify( "LISTEN_helicopter_ready_to_die" );
    }

    while ( maps\_utility::_id_26AD( self.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
        wait 0.05;

    self delete();
    self notify( "death" );
}

_id_62F9()
{
    self endon( "death" );
    self waittill( "reached_dynamic_path_end" );

    if ( isdefined( self._id_62ED ) )
    {
        self._id_62ED _id_636E();
        self._id_62ED notify( "death", level.player );
        self._id_62ED delete();
    }

    if ( isdefined( self._id_62EB ) )
    {
        foreach ( var_1 in self._id_62EB )
        {
            if ( isdefined( var_1 ) )
            {
                var_1 _id_636E();
                var_1 notify( "death", level.player );
                var_1 delete();
            }
        }
    }

    wait 0.05;
    self delete();
    self notify( "death", level.player );
}

_id_62FA()
{
    self endon( "death" );

    if ( self._id_62E4.size - 1 > 0 )
        self._id_62E4[self._id_62E4.size - 1] waittill( "trigger" );

    foreach ( var_1 in self._id_62E8 )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();
    }

    if ( isdefined( self._id_62E7 ) )
        self._id_62E7 delete();

    self delete();
    self notify( "death" );
}

_id_62FB( var_0 )
{
    self._id_62E3 = var_0;
}

_id_62FC()
{
    maps\_utility::_id_1402( "FLAG_gaz_init" );
    maps\_utility::_id_1402( "FLAG_gaz_crash" );
    maps\_vehicle::_id_2A12();
    self.veh_pathtype = "constrained";
    common_scripts\utility::delaycall( 1.0, ::thermaldrawenable );
    thread _id_62FD();
    thread _id_62FF();
    thread _id_62FE();
    maps\_utility::_id_13DC( "FLAG_gaz_init" );
}

_id_62FD()
{
    self endon( "death" );
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( _id_5F9E::_id_5F0D( var_1, level.player ) )
        {
            self notify( "LISTEN_killed_by_player" );
            break;
        }
    }

    if ( !maps\_utility::_id_1008( "FLAG_gaz_crash" ) )
    {
        if ( target_istarget( self ) )
            target_remove( self );

        self thermaldrawdisable();
        var_2 = common_scripts\utility::getfx( "FX_gaz_hurt_explosion" );
        var_3 = self.origin;
        var_4 = ( 0.0, 0.0, 1.0 );
        playfx( var_2, var_3, var_4 );
        var_2 = common_scripts\utility::getfx( "FX_gaz_on_fire" );
        playfxontag( var_2, self, "tag_engine_left" );
        playfxontag( var_2, self, "tag_engine_right" );
        maps\_utility::_id_13DC( "FLAG_gaz_crash" );
    }
}

_id_62FE()
{
    self endon( "death" );

    for (;;)
    {
        level.player waittill( "projectile_impact", var_0, var_1 );
        var_2 = 0;

        switch ( var_0 )
        {
            case "ac130_25mm_alt2":
                var_2 = 128;
                break;
            case "ac130_40mm_alt2":
                var_2 = 320;
                break;
            case "ac130_105mm_alt2":
                var_2 = 768;
                break;
            default:
                continue;
        }

        if ( var_0 == "ac130_40mm_alt2" && _id_5F9E::_id_5F11( self.origin, var_1, 256 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
            self thermaldrawdisable();
            self notify( "death", level.player );
            self notify( "LISTEN_killed_by_player" );
            return;
        }

        if ( var_0 == "ac130_105mm_alt2" && _id_5F9E::_id_5F11( self.origin, var_1, 512 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
            self thermaldrawdisable();
            self notify( "death", level.player );
            self notify( "LISTEN_killed_by_player" );
            return;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_1, var_2 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            self thermaldrawdisable();
            self notify( "LISTEN_killed_by_player" );

            switch ( var_0 )
            {
                case "ac130_40mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
                    break;
                case "ac130_105mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
                    break;
            }

            if ( !maps\_utility::_id_1008( "FLAG_gaz_crash" ) )
            {
                var_3 = common_scripts\utility::getfx( "FX_gaz_hurt_explosion" );
                var_1 = self.origin;
                var_4 = ( 0.0, 0.0, 1.0 );
                playfx( var_3, var_1, var_4 );
                var_3 = common_scripts\utility::getfx( "FX_gaz_on_fire" );
                playfxontag( var_3, self, "tag_engine_left" );
                playfxontag( var_3, self, "tag_engine_right" );
                maps\_utility::_id_13DC( "FLAG_gaz_crash" );
            }

            return;
        }
    }
}

_id_62FF()
{
    self waittill( "death", var_0 );

    if ( isdefined( self._id_6300 ) )
    {
        self._id_6300 = maps\_utility::_id_1361( self._id_6300 );
        self._id_6300 = common_scripts\utility::array_removeundefined( self._id_6300 );

        foreach ( var_2 in self._id_6300 )
        {
            var_2 _id_636E();

            if ( _id_5F9E::_id_5F0D( var_0, level.player ) )
            {
                var_2 dodamage( 10000, var_2.origin, level.player );
                continue;
            }

            var_2 dodamage( 10000, var_2.origin );
        }
    }

    var_4 = common_scripts\utility::getfx( "FX_gaz_death_explosion" );
    var_5 = self.origin;
    var_6 = ( 0.0, 0.0, 1.0 );
    playfx( var_4, var_5, var_6 );
    var_4 = common_scripts\utility::getfx( "FX_gaz_on_fire" );
    stopfxontag( var_4, self, "tag_engine_left" );
    stopfxontag( var_4, self, "tag_engine_right" );
    wait 0.1;
    physicsexplosionsphere( self.origin, 768, 768, 4 );
}

_id_6301( var_0 )
{
    self endon( "death" );
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( isdefined( var_3._id_212C ) && var_3._id_212C )
        {
            var_1[var_1.size] = var_3 spawndrone();
            var_1[var_4] useanimtree( level._id_1245["drone"] );
            var_1[var_4] thermaldrawenable();
            continue;
        }

        var_1[var_1.size] = var_3 stalingradspawn();
    }

    thread maps\_vehicle::_id_2515( var_1 );
    self._id_6300 = var_1;

    foreach ( var_3 in var_0 )
        var_3 delete();
}

_id_6302( var_0, var_1 )
{
    self endon( "death" );
    var_2 = 2;
    var_1 = _id_5F9E::_id_5EDF( var_1, 1, var_2 );
    var_3 = [];
    var_4 = var_0.origin;

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        var_0.count = 1;
        var_0._id_251B = var_5;
        var_0.origin = ( var_4[0], var_4[1] + 64.0, var_4[2] );
        var_3[var_5] = var_0 stalingradspawn();
        maps\_utility::_id_13AF( var_3[var_5] );
        wait 0.05;
    }

    maps\_vehicle::_id_2515( var_3 );
    self._id_6300 = var_3;
}

_id_6303( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_gaz_crash" );
    var_1 = getvehiclenode( var_0 + "_in", "script_noteworthy" );
    var_2 = getvehiclenode( var_0 + "_out", "script_noteworthy" );
    _id_5F9E::_id_5F3F( var_1, var_2 );
    var_3 = getvehiclenode( var_0 + "_end", "script_noteworthy" );
    var_3 waittill( "trigger", var_4 );
    maps\_vehicle::_id_2A13();
    self dodamage( 10000, ( 0.0, 0.0, 0.0 ) );
}

_id_6304( var_0 )
{
    self endon( "death" );

    if ( target_istarget( self ) )
        target_remove( self );

    self thermaldrawdisable();
    var_1 = getvehiclenode( var_0 + "_in", "script_noteworthy" );
    var_2 = getvehiclenode( var_0 + "_out", "script_noteworthy" );
    _id_5F9E::_id_5F3F( var_1, var_2 );

    if ( !maps\_utility::_id_1008( "FLAG_gaz_crash" ) )
    {
        var_3 = common_scripts\utility::getfx( "FX_gaz_hurt_explosion" );
        var_4 = self.origin;
        var_5 = ( 0.0, 0.0, 1.0 );
        playfx( var_3, var_4, var_5 );
        var_3 = common_scripts\utility::getfx( "FX_gaz_on_fire" );
        playfxontag( var_3, self, "tag_engine_left" );
        playfxontag( var_3, self, "tag_engine_right" );
    }

    var_6 = getvehiclenode( var_0 + "_end", "script_noteworthy" );
    var_6 waittill( "trigger", var_7 );
    maps\_vehicle::_id_2A13();
    self dodamage( 10000, ( 0.0, 0.0, 0.0 ) );
}

_id_6305( var_0 )
{
    self endon( "death" );
    var_1 = self.mgturret[0];
    var_1 setmode( "manual_ai" );
    var_1 settargetentity( var_0, ( 0.0, 0.0, 128.0 ) );
    var_2 = 0.1;

    for (;;)
    {
        var_3 = common_scripts\utility::ter_op( isdefined( var_0 ), var_2, 0.05 );

        if ( isdefined( var_0 ) )
        {
            var_4 = var_1 gettagorigin( "tag_flash" );
            var_5 = var_0.origin + ( 0.0, 0.0, 64.0 );
            magicbullet( "btr80_ac130_turret", var_4, var_5 );
        }

        wait(var_3);
    }
}

_id_6306( var_0 )
{
    self endon( "death" );
    var_0 waittill( "trigger", var_1 );
    var_2 = common_scripts\utility::getfx( "FX_gaz_dust_slide" );
    var_3 = self gettagorigin( "tag_wheel_back_left" );
    var_4 = ( 0.0, 0.0, 1.0 );
    playfx( var_2, var_3, var_4 );
    var_3 = self gettagorigin( "tag_wheel_back_right" );
    playfx( var_2, var_3, var_4 );
}

_id_6307( var_0, var_1 )
{
    maps\_utility::_id_1402( "FLAG_bm21_init" );
    maps\_utility::_id_1402( "FLAG_bm21_passengers_loaded" );
    maps\_utility::_id_1402( "FLAG_bm21_passengers_unloaded" );
    self._id_6308 = [];

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
        _id_5F9E::_id_5F50( var_0, var_1 );

    maps\_vehicle::_id_2A12();
    self thermaldrawenable();
    self setcandamage( 1 );
    thread _id_6309();
    thread _id_630A();
    maps\_utility::_id_13DC( "FLAG_bm21_init" );
}

_id_6309()
{
    self endon( "death" );
    self.health = 10000;
    var_0 = 10;
    var_1 = 0;
    var_2 = 0;

    for (;;)
    {
        self waittill( "damage", var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );

        if ( _id_5F9E::_id_5F0D( var_4, level.player ) )
        {
            if ( _id_5F9E::_id_5F0D( var_12, "ac130_105mm_alt2" ) || _id_5F9E::_id_5F0D( var_12, "ac130_40mm_alt2" ) )
                var_2 = 1;
            else if ( _id_5F9E::_id_5F0D( var_12, "ac130_25mm_alt2" ) )
                var_1++;

            if ( var_1 >= var_0 )
                var_2 = 1;

            if ( var_2 )
            {
                maps\_vehicle::_id_2A13();
                self dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
            }

            break;
        }
    }
}

_id_630A()
{
    maps\_utility::_id_1654( "FLAG_bm21_init" );
    self waittill( "death" );

    if ( isdefined( self ) )
    {
        if ( maps\_utility::_id_1008( "FLAG_bm21_passengers_unloaded" ) && isdefined( self._id_630B ) )
        {
            self._id_630B = maps\_utility::_id_1361( self._id_630B );
            self._id_630B = common_scripts\utility::array_removeundefined( self._id_630B );

            foreach ( var_1 in self._id_630B )
            {
                var_1 _id_636E();
                var_1 dodamage( 10000, var_1.origin, level.player );
            }
        }

        var_3 = common_scripts\utility::getfx( "FX_bm21_hurt_explosion" );
        var_4 = self.origin;
        var_5 = ( 0.0, 0.0, 1.0 );
        playfx( var_3, var_4, var_5 );
        var_3 = common_scripts\utility::getfx( "FX_bm21_on_fire" );
        stopfxontag( var_3, self, "tag_engine_left" );
        stopfxontag( var_3, self, "tag_engine_right" );
        wait 0.1;
        physicsexplosionsphere( self.origin, 768, 768, 4 );
        self setmodel( "vehicle_bm21_mobile_bed_dstry" );
        self thermaldrawdisable();
    }
}

_id_630C()
{
    maps\_utility::_id_1402( "FLAG_bm21_init" );
    maps\_utility::_id_1402( "FLAG_bm21_crash" );
    maps\_utility::_id_1402( "FLAG_bm21_passengers_loaded" );
    maps\_utility::_id_1402( "FLAG_bm21_passengers_unloaded" );
    maps\_vehicle::_id_2A12();
    self.veh_pathtype = "constrained";
    self._id_6308 = [];
    self setcandamage( 1 );
    common_scripts\utility::delaycall( 1.0, ::thermaldrawenable );
    thread _id_630D();
    thread _id_630F();
    thread _id_630E();
    maps\_utility::_id_13DC( "FLAG_bm21_init" );
}

_id_630D()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( _id_5F9E::_id_5F0D( var_1, level.player ) )
        {
            self notify( "LISTEN_killed_by_player" );
            break;
        }
    }

    if ( !maps\_utility::_id_1008( "FLAG_bm21_crash" ) )
    {
        if ( target_istarget( self ) )
            target_remove( self );

        self thermaldrawdisable();
        var_10 = common_scripts\utility::getfx( "FX_bm21_hurt_explosion" );
        var_11 = self.origin;
        var_12 = ( 0.0, 0.0, 1.0 );
        playfx( var_10, var_11, var_12 );
        var_10 = common_scripts\utility::getfx( "FX_bm21_on_fire" );
        playfxontag( var_10, self, "tag_engine_left" );
        playfxontag( var_10, self, "tag_engine_right" );
        maps\_utility::_id_13DC( "FLAG_bm21_crash" );
    }
}

_id_630E()
{
    self endon( "death" );

    for (;;)
    {
        level.player waittill( "projectile_impact", var_0, var_1 );
        var_2 = 0;

        switch ( var_0 )
        {
            case "ac130_25mm_alt2":
                var_2 = 128;
                break;
            case "ac130_40mm_alt2":
                var_2 = 320;
                break;
            case "ac130_105mm_alt2":
                var_2 = 768;
                break;
            default:
                continue;
        }

        if ( var_0 == "ac130_40mm_alt2" && _id_5F9E::_id_5F11( self.origin, var_1, 256 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
            self thermaldrawdisable();
            self notify( "death", level.player );
            self notify( "LISTEN_killed_by_player" );
            return;
        }

        if ( var_0 == "ac130_105mm_alt2" && _id_5F9E::_id_5F11( self.origin, var_1, 512 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
            self thermaldrawdisable();
            self notify( "death", level.player );
            self notify( "LISTEN_killed_by_player" );
            return;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_1, var_2 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            self thermaldrawdisable();
            self notify( "LISTEN_killed_by_player" );

            switch ( var_0 )
            {
                case "ac130_40mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
                    break;
                case "ac130_105mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
                    break;
            }

            if ( !maps\_utility::_id_1008( "FLAG_bm21_crash" ) )
            {
                var_3 = common_scripts\utility::getfx( "FX_bm21_hurt_explosion" );
                var_1 = self.origin;
                var_4 = ( 0.0, 0.0, 1.0 );
                playfx( var_3, var_1, var_4 );
                var_3 = common_scripts\utility::getfx( "FX_bm21_on_fire" );
                playfxontag( var_3, self, "tag_engine_left" );
                playfxontag( var_3, self, "tag_engine_right" );
                maps\_utility::_id_13DC( "FLAG_bm21_crash" );
            }
        }
    }
}

_id_630F()
{
    maps\_utility::_id_1654( "FLAG_bm21_init" );
    self waittill( "death", var_0 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
        self notify( "LISTEN_killed_by_player" );

    if ( isdefined( self ) )
    {
        if ( maps\_utility::_id_1008( "FLAG_bm21_passengers_unloaded" ) && isdefined( self._id_630B ) )
        {
            self._id_630B = maps\_utility::_id_1361( self._id_630B );
            self._id_630B = common_scripts\utility::array_removeundefined( self._id_630B );

            foreach ( var_2 in self._id_630B )
            {
                var_2 _id_636E();

                if ( _id_5F9E::_id_5F0D( var_0, level.player ) )
                {
                    var_2 dodamage( 10000, var_2.origin, level.player );
                    continue;
                }

                var_2 dodamage( 10000, var_2.origin );
            }
        }

        var_4 = common_scripts\utility::getfx( "FX_bm21_death_explosion" );
        var_5 = self.origin;
        var_6 = ( 0.0, 0.0, 1.0 );
        playfx( var_4, var_5, var_6 );
        var_4 = common_scripts\utility::getfx( "FX_bm21_on_fire" );
        stopfxontag( var_4, self, "tag_engine_left" );
        stopfxontag( var_4, self, "tag_engine_right" );
        wait 0.1;
        physicsexplosionsphere( self.origin, 768, 768, 4 );
        self setmodel( "vehicle_bm21_mobile_bed_dstry" );
        self thermaldrawdisable();
    }
}

_id_6310( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_bm21_init" );
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_3 _id_5F9E::_id_5F0A( "script_drone", 1 ) )
        {
            var_1[var_4] = var_3 spawndrone();
            var_1[var_4] useanimtree( level._id_1245["drone"] );
            var_1[var_4] thermaldrawenable();
            continue;
        }

        var_1[var_4] = var_3 stalingradspawn();
        maps\_utility::_id_13AF( var_1[var_4] );
    }

    thread maps\_vehicle::_id_2515( var_1 );
    var_5 = "FLAG_bm21_passengers_loaded";
    thread _id_5F9E::_id_5F7C( self._id_62EB, "enteredvehicle", var_5, 15 );
    self._id_630B = var_1;

    foreach ( var_3 in var_0 )
        var_3 delete();
}

_id_6311( var_0, var_1, var_2 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_bm21_init" );
    var_3 = 10;
    var_1 = _id_5F9E::_id_5EDF( var_1, 1, var_3 );
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, 0 );
    var_4 = [];
    var_5 = var_0.origin;

    for ( var_6 = 0; var_6 < var_1; var_6++ )
    {
        var_0.count = 1;
        var_0._id_251B = var_6;
        var_0.origin = ( var_5[0], var_5[1] + 64.0, var_5[2] );

        if ( var_0 _id_5F9E::_id_5F0A( "script_drone", 1 ) )
        {
            var_4[var_6] = var_0 spawndrone();
            var_4[var_6] useanimtree( level._id_1245["drone"] );
            var_4[var_6] thermaldrawenable();
        }
        else
        {
            var_4[var_6] = var_0 stalingradspawn();
            maps\_utility::_id_13AF( var_4[var_6] );
        }

        wait 0.05;
    }

    if ( var_2 )
    {
        foreach ( var_8 in var_4 )
        {
            var_8 notify( "enteredvehicle" );
            maps\_vehicle_aianim::_id_24E5( var_8, 0 );
        }

        maps\_utility::_id_13DC( "FLAG_bm21_passengers_loaded" );
    }
    else
    {
        maps\_vehicle::_id_2515( var_4 );
        var_10 = "FLAG_bm21_passengers_loaded";
        thread _id_5F9E::_id_5F7C( var_4, "enteredvehicle", var_10, 15 );
    }

    self._id_630B = var_4;
}

_id_6312()
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_bm21_init" );

    foreach ( var_1 in self._id_630B )
    {
        foreach ( var_3 in self._id_6308 )
        {
            if ( isdefined( var_1 ) )
                var_1 thread [[ var_3 ]]();
        }
    }

    var_6 = "FLAG_bm21_passengers_unloaded";
    thread _id_5F9E::_id_5F7C( self._id_630B, "unload", var_6, 15 );
    maps\_vehicle::_id_2514();
}

_id_6313( var_0 )
{
    self._id_6308 = var_0;
}

_id_6314()
{
    self endon( "death" );

    if ( isdefined( self.target ) )
    {
        var_0 = getvehiclenode( self.target, "targetname" );
        _id_5F9E::_id_5F3C( var_0 );
    }
    else
        thread maps\_vehicle::_id_1FA6( self );

    maps\_utility::_id_1654( "FLAG_bm21_crash" );
    wait 1.0;
    maps\_vehicle::_id_2A13();
    self dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
}

_id_6315( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_bm21_crash" );
    var_1 = getvehiclenode( var_0 + "_in", "script_noteworthy" );
    var_2 = getvehiclenode( var_0 + "_out", "script_noteworthy" );
    _id_5F9E::_id_5F3F( var_1, var_2 );
    var_3 = getvehiclenode( var_0 + "_end", "script_noteworthy" );
    var_3 waittill( "trigger", var_4 );
    maps\_vehicle::_id_2A13();
    self dodamage( 10000, ( 0.0, 0.0, 0.0 ) );
}

_id_6316( var_0 )
{
    self endon( "death" );

    if ( target_istarget( self ) )
        target_remove( self );

    self thermaldrawdisable();
    var_1 = getvehiclenode( var_0 + "_in", "script_noteworthy" );
    var_2 = getvehiclenode( var_0 + "_out", "script_noteworthy" );
    _id_5F9E::_id_5F3F( var_1, var_2 );

    if ( !maps\_utility::_id_1008( "FLAG_bm21_crash" ) )
    {
        var_3 = common_scripts\utility::getfx( "FX_bm21_hurt_explosion" );
        var_4 = self.origin;
        var_5 = ( 0.0, 0.0, 1.0 );
        playfx( var_3, var_4, var_5 );
        var_3 = common_scripts\utility::getfx( "FX_bm21_on_fire" );
        playfxontag( var_3, self, "tag_engine_left" );
        playfxontag( var_3, self, "tag_engine_right" );
    }

    var_6 = getvehiclenode( var_0 + "_end", "script_noteworthy" );
    var_6 waittill( "trigger", var_7 );
    maps\_vehicle::_id_2A13();
    self dodamage( 10000, ( 0.0, 0.0, 0.0 ) );
}

_id_6317( var_0 )
{
    self endon( "death" );
    var_0 waittill( "trigger", var_1 );
    var_2 = common_scripts\utility::getfx( "FX_bm21_dust_slide" );
    var_3 = self gettagorigin( "tag_wheel_back_left" );
    var_4 = ( 0.0, 0.0, 1.0 );
    playfx( var_2, var_3, var_4 );
    var_3 = self gettagorigin( "tag_wheel_back_right" );
    playfx( var_2, var_3, var_4 );
}

_id_6318( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "targetname" );
        _id_5F9E::_id_5F50( var_0, var_1 );
    }

    maps\_utility::_id_1402( "FLAG_helicopter_die" );
    maps\_utility::_id_1402( "FLAG_helicopter_instant_death" );
    maps\_utility::_id_1402( "FLAG_helicopter_instant_death_40mm" );
    maps\_utility::_id_1402( "FLAG_helicopter_instant_death_105mm" );
    maps\_utility::_id_1402( "FLAG_hind_dying" );
    self._id_6319 = _id_5F9E::_id_5F52( self.target );
    self thermaldrawenable();
    maps\_vehicle::_id_2A12();
    thread _id_631A();
    thread _id_631B();
    thread _id_631D();
}

_id_631A()
{
    self endon( "death" );
    self endon( "LISTEN_helicopter_end_on_damage" );
    self.health = 2 * self._id_163B;
    self setcandamage( 1 );
    var_0 = 1500;
    var_1 = 0;

    while ( var_1 < var_0 )
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
        self.health = 2 * self._id_163B;

        if ( _id_5F9E::_id_5F0D( var_3, level.player ) && isdefined( var_11 ) )
        {
            switch ( var_11 )
            {
                case "ac130_25mm_alt2":
                    var_1 += var_2;
                    continue;
                case "ac130_40mm_alt2":
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death_40mm" );
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death" );
                    var_1 = 1500;
                    continue;
                case "ac130_105mm_alt2":
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death_105mm" );
                    maps\_utility::_id_13DC( "FLAG_helicopter_instant_death" );
                    var_1 = 1500;
                    continue;
                default:
                    continue;
            }
        }
    }

    maps\_vehicle::_id_2A13();

    if ( target_istarget( self ) )
        target_remove( self );

    maps\_utility::_id_13DC( "FLAG_helicopter_die" );
    maps\_utility::_id_13DC( "FLAG_hind_dying" );
}

_id_631B()
{
    maps\_utility::_id_1654( "FLAG_helicopter_die" );

    if ( !maps\_utility::_id_1008( "FLAG_helicopter_instant_death" ) )
    {
        self dodamage( 100000, self.origin, level.player );
        self notify( "LISTEN_killed_by_player" );
        return;
    }

    if ( !isdefined( self ) )
        return;

    playfx( common_scripts\utility::getfx( "FX_mi17_explosion" ), self.origin + ( 0.0, 0.0, -64.0 ) );
    playfx( common_scripts\utility::getfx( "FX_hind_air_explosion" ), self.origin + ( 0.0, 0.0, -64.0 ) );
    level thread common_scripts\utility::play_sound_in_space( "scn_ac130_helicopter_exp", self.origin );

    if ( maps\_utility::_id_1008( "FLAG_helicopter_instant_death_40mm" ) )
        level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );

    if ( maps\_utility::_id_1008( "FLAG_helicopter_instant_death_105mm" ) )
        level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );

    self notify( "death", level.player );
    self notify( "LISTEN_killed_by_player" );
    self notify( "newpath" );
    self notify( "crash_done" );
    self delete();
}

_id_631C()
{
    self endon( "death" );

    while ( !maps\_utility::_id_1008( "FLAG_helicopter_instant_death" ) && !maps\_utility::_id_1008( "FLAG_helicopter_die" ) )
        wait 0.05;

    maps\_utility::_id_13DC( "FLAG_helicopter_die" );
}

_id_631D()
{
    self endon( "death" );
    thread _id_631C();

    for (;;)
    {
        level.player waittill( "missile_fire", var_0, var_1 );

        if ( isdefined( var_0 ) && isdefined( var_1 ) )
        {
            switch ( var_1 )
            {
                case "ac130_40mm_alt2":
                    var_2 = [ "FLAG_helicopter_instant_death", "FLAG_helicopter_instant_death_40mm" ];
                    thread _id_5F9E::_id_5F67( var_0, 256, var_2 );
                    break;
                case "ac130_105mm_alt2":
                    var_2 = [ "FLAG_helicopter_instant_death", "FLAG_helicopter_instant_death_105mm" ];
                    thread _id_5F9E::_id_5F67( var_0, 256, var_2 );
                    break;
                default:
                    continue;
            }
        }
    }
}

_id_631E( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
    {
        var_0.count = 1;
        var_1 = undefined;

        if ( var_0 _id_5F9E::_id_5F0A( "script_drone", 1 ) )
        {
            var_1 = var_0 spawndrone();
            var_1 useanimtree( level._id_1245["drone"] );
            var_1 thermaldrawenable();
        }
        else
        {
            var_1 = var_0 stalingradspawn();
            maps\_utility::_id_13AF( var_1 );
        }

        maps\_vehicle::_id_2515( [ var_1 ], 1 );
    }
}

_id_631F( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( maps\_utility::_id_1008( "FLAG_hind_dying" ) )
        return;

    var_1 = common_scripts\utility::ter_op( randomint( 2 ), self gettagorigin( "tag_flash_side_1" ), self gettagorigin( "tag_flash_side_2" ) );
    var_2 = var_0.origin;
    var_3 = magicbullet( "rpg_straight_ac130", var_1, var_2 );
    var_3 thread _id_6321( var_0 );
}

_id_6320( var_0, var_1 )
{
    self endon( "death" );

    if ( maps\_utility::_id_1008( "FLAG_hind_dying" ) )
        return;

    var_2 = _id_5F9E::_id_5F51( "stop", "script_noteworthy", self._id_6319 )[0];
    self setlookatent( var_0 );
    _id_5F9E::_id_5F76( self, var_2, 64 );
    self vehicle_setspeedimmediate( 0, 30, 30 );
    var_3 = 1.0;

    foreach ( var_5 in var_1 )
    {
        if ( maps\_utility::_id_1008( "FLAG_hind_dying" ) )
            return;

        var_6 = common_scripts\utility::ter_op( randomint( 2 ), self gettagorigin( "tag_flash_side_1" ), self gettagorigin( "tag_flash_side_2" ) );
        var_7 = var_5.origin;
        var_8 = magicbullet( "rpg_straight", var_6, var_7 );
        var_8 thread _id_6321( var_5 );
        wait(var_3);
    }

    self notify( "LISTEN_hind_finished_shooting_rockets" );
}

_id_6321( var_0 )
{
    self waittill( "death" );
    var_1 = -1 * anglestoforward( self.angles );
    var_2 = var_0.origin;
    var_3 = common_scripts\utility::getfx( "FX_hind_rocket_hitting_building" );
    playfx( var_3, var_2, var_1 );
}

_id_6322( var_0 )
{
    self endon( "death" );
    var_1 = 0.1;

    for (;;)
    {
        var_2 = common_scripts\utility::ter_op( isdefined( var_0 ), var_1, 0.05 );

        if ( isdefined( var_0 ) )
        {
            var_3 = self gettagorigin( "tag_flash" );
            var_4 = var_0.origin;
            magicbullet( "btr80_ac130_turret", var_3, var_4 );
        }

        wait(var_2);
    }
}

_id_6323()
{
    self endon( "death" );
    thread maps\_vehicle::_id_1FA6( self );
    var_0 = _id_5F9E::_id_5F51( "die", "script_noteworthy", self._id_6319 )[0];

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );
    else
        self waittill( "reached_dynamic_path_end" );

    if ( target_istarget( self ) )
        target_remove( self );

    self dodamage( 10000, self.origin );
    self notify( "death" );
}

_id_6324()
{
    self._id_6325 = _id_5F9E::_id_5F52( self.target );
    self._id_6326 = [];
    self thermaldrawenable();
    self setcandamage( 0 );
    thread _id_6329();
    thread _id_6332();
}

_id_6327()
{
    self._id_6325 = _id_5F9E::_id_5F52( self.target );
    self._id_6326 = [];
    self thermaldrawenable();
    thread _id_6332();
}

_id_6328()
{
    self thermaldrawenable();
    thread _id_4960::_id_443C();
    thread _id_6296( "script_vehicle_mig29_low" );
}

_id_6329()
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F51( "afterburner", "script_noteworthy", self._id_6325 );

    foreach ( var_2 in var_0 )
    {
        var_2 waittill( "trigger" );
        var_3 = common_scripts\utility::getfx( "FX_jet_afterburner_ignite" );
        playfxontag( var_3, self, "tag_engine_right" );
        playfxontag( var_3, self, "tag_engine_left" );
        var_3 = common_scripts\utility::getfx( "FX_jet_smoke_trail_quick" );
        playfxontag( var_3, self, "tag_engine_right" );
        playfxontag( var_3, self, "tag_engine_left" );
    }
}

_id_632A( var_0 )
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    wait(var_0);

    if ( !isdefined( self ) )
        return;

    var_1 = common_scripts\utility::getfx( "FX_jet_afterburner_ignite" );
    playfxontag( var_1, self, "tag_engine_right" );
    playfxontag( var_1, self, "tag_engine_left" );
    var_1 = common_scripts\utility::getfx( "FX_jet_smoke_trail_quick" );
    playfxontag( var_1, self, "tag_engine_right" );
    playfxontag( var_1, self, "tag_engine_left" );
}

_id_632B( var_0, var_1 )
{
    self endon( "death" );
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, "veh_paris_ac130_jet_sonic_boom" );
    thread common_scripts\utility::play_loop_sound_on_entity( "veh_f15_dist_loop" );
    _id_5F9E::_id_5F79( self, var_0, 64.0 );
    level thread common_scripts\utility::play_sound_in_space( var_1, var_0 );
}

_id_632C()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getfx( "FX_mig29_on_fire" );
    playfxontag( var_0, self, "tag_origin" );
    wait(randomfloatrange( 1.0, 3.0 ));
    var_0 = common_scripts\utility::getfx( "FX_mig29_air_explosion" );
    var_1 = self.origin;
    var_2 = anglestoforward( self.origin );
    playfx( var_0, var_1, var_2 );
    common_scripts\utility::stop_loop_sound_on_entity( "veh_f15_dist_loop" );
    self delete();
    self notify( "death" );
}

_id_632D( var_0 )
{
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, "veh_paris_ac130_jet_sonic_boom" );
    var_1 = _id_5F9E::_id_5F51( "sonic_boom", "script_noteworthy", self._id_6325 );

    foreach ( var_3 in var_1 )
        thread _id_632E( var_3, var_0 );

    thread common_scripts\utility::play_loop_sound_on_entity( "veh_f15_dist_loop" );
}

_id_632E( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::play_sound_in_space( var_1 );
}

_id_632F()
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F51( "fire", "script_noteworthy", self._id_6325 )[0];

    if ( isdefined( var_0 ) )
    {
        var_0 waittill( "trigger" );
        var_1 = common_scripts\utility::getfx( "FX_mig29_on_fire" );
        playfxontag( var_1, self, "tag_origin" );
    }
}

_id_6330()
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F51( "explosion", "script_noteworthy", self._id_6325 )[0];

    if ( isdefined( var_0 ) )
    {
        var_0 waittill( "trigger" );
        var_1 = common_scripts\utility::getfx( "FX_mig29_air_explosion" );
        var_2 = self.origin;
        var_3 = anglestoforward( self.origin );
        playfx( var_1, var_2, var_3 );
        common_scripts\utility::stop_loop_sound_on_entity( "veh_f15_dist_loop" );
        self delete();
        self notify( "death" );
    }
}

_id_6331( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    var_1 = _id_5F9E::_id_5F0F( var_1, 0.05 );
    var_2 = _id_5F9E::_id_5F0F( var_2, 0 );
    wait(var_0);

    if ( _id_5F9E::_id_5EDE( var_2 ) )
    {
        var_3 = common_scripts\utility::getfx( "FX_mig29_on_fire" );
        playfxontag( var_3, self, "tag_origin" );
        wait(var_1);
        var_3 = common_scripts\utility::getfx( "FX_mig29_air_explosion" );
        var_4 = self.origin;
        var_5 = ( 0.0, 0.0, 1.0 );
        playfx( var_3, var_4, var_5 );
        self delete();
        self notify( "death" );
    }
}

_id_6332()
{
    self endon( "death" );
    var_0 = level._id_2994["script_vehicle_f15_low"];

    for (;;)
    {
        if ( isdefined( self._id_2991 ) )
        {
            self._id_2991 waittill( "trigger" );

            if ( self vehicle_getspeed() == 0 || !self._id_29B7 )
            {
                wait 0.1;
                continue;
            }

            while ( level.player istouching( self._id_2991 ) && self._id_29B7 && self vehicle_getspeed() > 0 )
            {
                if ( _id_5F9E::_id_5F15( level.ac130player.origin, self.origin, self._id_29A7 * 0.75 ) )
                    common_scripts\utility::flag_set( "FLAG_ac130_rumble" );

                wait(self._id_29A5 + randomfloat( self._id_29B5 ));
            }

            continue;
        }

        wait 0.05;
    }
}

_id_6333()
{
    self endon( "death" );

    if ( self._id_6325.size - 1 > 0 )
        self._id_6325[self._id_6325.size - 1] waittill( "trigger" );
    else
        self waittill( "reached_dynamic_path_end" );

    foreach ( var_1 in self._id_6326 )
    {
        if ( isdefined( var_1 ) )
        {
            stopfxontag( common_scripts\utility::getfx( "FX_mig29_fake" ), var_1, "tag_origin" );
            var_1 delete();
        }
    }

    if ( isdefined( self._id_6334 ) )
        self._id_6334 delete();

    common_scripts\utility::stop_loop_sound_on_entity( "veh_f15_dist_loop" );
    self delete();
    self notify( "death" );
}

_id_6335( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    wait(var_0);

    if ( !isdefined( self ) )
        return;

    self notify( "death" );
    self notify( "kill_rumble_forever" );

    if ( isdefined( self._id_443B ) )
        self._id_443B delete();

    if ( isdefined( self._id_495C ) )
        self._id_495C delete();

    if ( isdefined( self._id_2991 ) )
        self._id_2991 delete();

    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_6130( var_0, var_1 )
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_1402( "FLAG_ai_scripted" );
    maps\_utility::_id_1402( "FLAG_ai_reached_path_end" );
    self._id_6336 = self.accuracy;
    self._id_6337 = self._id_20AF;
    self._id_6338 = self.goalradius;
    self.accuracy = 1.0;
    self._id_20AF = 500000;
    self.health = 20000;
    _id_5F9E::_id_5F50( var_0, var_1 );
    self._id_6339 = 0;
    maps\_utility::_id_2611();
    maps\_utility::_id_2724( 4.0 );
    maps\_utility::_id_13DC( "FLAG_ai_scripted" );
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_633A( var_0 )
{
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ) && var_0 > 1, var_0, 1 );
    self.health = var_0;
    self.maxhealth = var_0;
    self._id_6339 = 0;
}

_id_6131( var_0 )
{
    self endon( "death" );
    self endon( "LISTEN_end_ai_scripts" );

    while ( self._id_6339 < self.maxhealth )
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( common_scripts\utility::flag( "FLAG_delta_ac130_mission_fail" ) && !_id_5F9E::_id_5F0D( var_2, self ) && !var_2 _id_5F9E::_id_5F0A( "team", "allies" ) && !_id_5F9E::_id_5F0D( var_10, "ac130_25mm_alt2" ) && !_id_5F9E::_id_5F0D( var_10, "ac130_40mm_alt2" ) && !_id_5F9E::_id_5F0D( var_10, "ac130_105mm_alt2" ) )
            self._id_6339 += var_1;
    }

    var_0 = common_scripts\utility::ter_op( var_0 == 0 || var_0 == 1, var_0, 1 );
    var_11 = common_scripts\utility::ter_op( var_0, "@PARIS_AC130_MISSION_FAIL_DELTA_KILLED", "@PARIS_AC130_MISSION_FAIL_HVI_KILLED" );
    _id_5F9E::_id_5F3A( var_11 );
}

_id_633B( var_0, var_1, var_2, var_3 )
{
    self.ignoreme = 1;
    self.ignoreall = 1;
    self._id_117F = 1;
    self._id_1199 = 1;
    _id_6342();
    _id_6173();
    self setgoalpos( var_3 );
    var_1.origin = self.origin;
    var_1 maps\_anim::_id_11C1( self, "corner_standR_explosion_divedown" );

    while ( !common_scripts\utility::flag( var_2 ) )
        maps\_anim::_id_11C1( self, "corner_standR_explosion_idle" );

    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ) && var_0 > 0.05, var_0, 0.05 );
    var_4 = 0;

    for ( var_5 = getanimlength( maps\_utility::_id_26EC( "corner_standR_explosion_idle" ) ); var_4 < var_0; var_4 += var_5 )
        maps\_anim::_id_11C1( self, "corner_standR_explosion_idle" );

    maps\_anim::_id_11C1( self, "corner_standR_explosion_standup" );
    wait 0.05;
}

_id_633C( var_0 )
{
    self notify( "LISTEN_end_ai_friendly_push_forward" );
    self endon( "LISTEN_end_ai_friendly_push_forward" );
    var_0 = _id_5F9E::_id_5F0F( var_0, 0.05 );
    thread _id_6370( var_0 );
    thread _id_6371( var_0 );
    maps\_utility::_id_251E();
    maps\_utility::delaythread( var_0, maps\_utility::_id_2521 );
    _id_5F9E::_id_5F2F( 0 );
    maps\_utility::delaythread( var_0, _id_5F9E::_id_5F31 );
}

_id_633D()
{
    self endon( "death" );
    self endon( "LISTEN_end_ai_scripts" );
    self laseralton();
    var_0 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "FLAG_ac130_player_in_ac130" ) )
        {
            if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) && !var_0 )
            {
                self laserforceon();
                var_0 = 1;
            }
            else if ( common_scripts\utility::flag( "FLAG_ac130_enhanced_vision_enabled" ) && var_0 )
            {
                self laserforceoff();
                var_0 = 0;
            }
        }

        wait 0.05;
    }
}

_id_6136()
{
    maps\_utility::_id_13DE( "FLAG_ai_scripted" );
    self.accuracy = self._id_6336;
    self._id_20AF = self._id_6337;
    self.goalradius = self._id_6338;
}

_id_633E()
{
    maps\_utility::_id_13DC( "FLAG_ai_scripted" );
    self.accuracy = 1.0;
    self._id_20AF = 500000;
    self._id_6339 = 0;
    maps\_utility::_id_2724( 4.0 );
}

_id_633F()
{
    if ( !isdefined( self._id_0D04 ) )
        maps\_utility::_id_2611();
    else if ( !self._id_0D04 )
        maps\_utility::_id_0D04( 1 );
}

_id_6340( var_0 )
{
    self._id_6341 = var_0;
}

_id_6342()
{
    if ( isdefined( self._id_6341 ) )
    {
        foreach ( var_1 in self._id_6341 )
        {
            if ( isarray( var_1 ) )
            {
                foreach ( var_3 in var_1 )
                {
                    if ( isdefined( self._id_6343 ) )
                        self._id_6343 notify( "LISTEN_stop_" + var_3 );

                    self notify( "LISTEN_stop_" + var_3 );
                }

                continue;
            }

            if ( isdefined( self._id_6343 ) )
                self._id_6343 notify( "LISTEN_stop_" + var_1 );

            self notify( "LISTEN_stop_" + var_1 );
        }
    }

    self.allowpain = 1;
    self._id_0EEE = 0;
    self.ignoreall = 0;
    self.grenadeawareness = 1;
    maps\_utility::_id_1058( 0 );
    self._id_100A = undefined;
    self._id_1099 = undefined;
    self._id_117F = undefined;
    self._id_1199 = undefined;
    self.nododgemove = 0;
    self pushplayer( 1 );
    self._id_6341 = undefined;
    self notify( "LISTEN_end_parent_child_ai_behavior" );
}

_id_6344( var_0, var_1 )
{
    animscripts\shared::_id_23C8();
    self._id_6345 = var_0;
    self._id_6346 = var_1;
    var_2 = var_1[0];

    if ( isdefined( self._id_1032 ) )
        var_0 thread maps\_anim::_id_11D6( [ self ], var_2, "LISTEN_stop_" + var_2 );
    else
        var_0 thread maps\_anim::_id_11C8( self, var_2, "LISTEN_stop_" + var_2 );

    self.allowdeath = 1;
}

_id_6173()
{
    if ( isdefined( self._id_6346 ) && isarray( self._id_6346 ) )
    {
        foreach ( var_1 in self._id_6346 )
        {
            if ( isarray( var_1 ) )
            {
                foreach ( var_3 in var_1 )
                {
                    if ( isdefined( self._id_6345 ) )
                        self._id_6345 notify( "LISTEN_stop_" + var_3 );

                    self notify( "LISTEN_stop_" + var_3 );
                }

                continue;
            }

            if ( isdefined( self._id_6345 ) )
                self._id_6345 notify( "LISTEN_stop_" + var_1 );

            self notify( "LISTEN_stop_" + var_1 );
        }
    }

    self._id_6345 = undefined;
    self._id_6346 = undefined;
    self unlink();
    self visiblesolid();
}

_id_6347( var_0 )
{
    self endon( "death" );
    self endon( "LISTEN_end_parent_child_ai_behavior" );
    var_1 = self._id_6341[1];
    var_2 = self._id_6341[0];
    self._id_6343 = var_0._id_6345;
    var_3 = self.goalradius;
    self.goalradius = 64;
    self setgoalpos( var_0._id_6345.origin );
    self waittill( "goal" );

    if ( isdefined( self._id_1032 ) )
    {
        foreach ( var_5 in var_1 )
            var_0._id_6345 maps\_anim::_id_122A( [ self ], var_5 );
    }
    else
    {
        foreach ( var_5 in var_1 )
            var_0._id_6345 maps\_anim::_id_11C4( self, var_5 );
    }

    if ( isdefined( var_2 ) )
        var_0._id_6345 thread maps\_anim::_id_11C8( self, var_2, "LISTEN_stop_" + var_2 );

    self.goalradius = var_3;
    wait 0.05;
}

_id_6348( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "LISTEN_end_parent_child_ai_behavior" );
    var_2 = common_scripts\utility::ter_op( isdefined( var_2 ), var_2, 0 );
    var_0._id_6349 = 1;
    self._id_6343 = var_0._id_6345;

    if ( isdefined( self._id_6341[0] ) )
    {
        self notify( "LISTEN_stop_" + self._id_6341[0] );
        var_0._id_6345 notify( "LISTEN_stop_" + self._id_6341[0] );
    }

    var_0 notify( "LISTEN_stop_" + var_0._id_6346[0] );
    var_0._id_6345 notify( "LISTEN_stop_" + var_0._id_6346[0] );
    wait 0.05;
    var_0.allowdeath = 1;

    foreach ( var_5, var_4 in var_0._id_6346[1] )
    {
        var_0._id_6345 thread maps\_anim::_id_11C1( var_0, var_4 );
        var_0._id_6345 maps\_anim::_id_11C1( self, self._id_6341[1][var_5] );
    }

    self._id_100A = 1;
    var_0 invisiblenotsolid();

    if ( isdefined( self._id_1032 ) )
        thread maps\_utility::_id_26F7( self._id_6341[2], 1 );
    else
        thread maps\_utility::_id_140B( self._id_6341[2], 1 );

    self animmode( "none" );
    self.allowpain = 0;
    self._id_0EEE = 1;
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.grenadeawareness = 0;
    maps\_utility::_id_1058( 1 );
    self._id_1099 = 1;
    self._id_117F = 1;
    self._id_1199 = 1;
    self.nododgemove = 1;
    maps\_utility::_id_109E();
    self._id_4073 = self.goalradius;
    thread _id_634A( var_0 );
    self.ignoresuppression = 1;
    self._id_117F = 1;
    var_6 = [ var_1 ];

    if ( isdefined( var_1.target ) )
        var_6 = common_scripts\utility::array_combine( var_6, _id_5F9E::_id_5F52( var_1.target ) );

    var_6 = common_scripts\utility::array_removeundefined( var_6 );
    self.goalradius = 64;

    foreach ( var_5, var_8 in var_6 )
    {
        if ( var_5 == var_6.size - 1 )
            continue;

        self setgoalpos( var_8.origin );
        self waittill( "goal" );
    }

    var_1 = var_6[var_6.size - 1];
    var_1 maps\_anim::_id_11C4( self, self._id_6341[3] );
    var_0._id_6345 = var_1;
    self._id_6343 = var_0._id_6345;
    var_0 notify( "LISTEN_stop_" + var_0._id_6346[2] );
    var_1 notify( "LISTEN_stop_" + var_0._id_6346[0] );
    wait 0.05;
    var_0 unlink();
    self.ignoresuppression = 0;
    self._id_117F = 0;
    self.goalradius = self._id_4073;
    thread maps\_utility::_id_140C();
    var_0._id_6345 thread maps\_anim::_id_11C1( self, self._id_6341[3] );
    var_0._id_6345 maps\_anim::_id_11C1( var_0, var_0._id_6346[3] );

    if ( var_2 )
    {

    }
    else
    {
        self.allowpain = 1;
        self._id_0EEE = 0;
        self.ignoreall = 0;
        self.grenadeawareness = 1;
        maps\_utility::_id_1058( 0 );
        self._id_100A = undefined;
        self._id_1099 = undefined;
        self._id_117F = undefined;
        self._id_1199 = undefined;
        self.nododgemove = 0;
        self pushplayer( 0 );
    }

    var_0 visiblesolid();
    var_0._id_6345 thread maps\_anim::_id_11C8( var_0, var_0._id_6346[0], "LISTEN_stop_" + var_0._id_6346[0] );
    var_0.allowdeath = 1;
    var_0._id_6349 = undefined;

    if ( var_2 )
        var_0._id_6345 thread maps\_anim::_id_11C8( self, self._id_6341[0], "LISTEN_stop_" + self._id_6341[0] );

    self notify( "LISTEN_parent_and_child_reached_goal" );
}

_id_634A( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 linkto( self, "tag_origin" );
    var_0 thread maps\_anim::_id_11C8( var_0, var_0._id_6346[2], "LISTEN_stop_" + var_0._id_6346[2] );
}

_id_634B( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_1 = _id_5F9E::_id_5F0F( var_1, 0 );
    var_2 = _id_5F9E::_id_5F0F( var_2, 0 );
    var_3 = _id_5F9E::_id_5EDF( var_3, 0, var_2 );
    var_4 = self.fixednode;
    self.fixednode = 0;
    maps\_utility::_id_26F3( 1 );
    thread _id_6370( 3.0 );
    maps\_utility::_id_251E();
    maps\_utility::delaythread( 3.0, maps\_utility::_id_2521 );
    maps\_utility::_id_2724( var_1 );
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
    self.fixednode = var_4;
    maps\_utility::_id_26F3( 0 );
    maps\_utility::_id_2724( randomintrange( var_2, var_3 ) );
}

_id_634C()
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_2611();
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_634D( var_0, var_1 )
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    self.script_noteworthy = var_0;
    self.ignoreall = 1;
    self.ignoreme = 1;
    thread _id_634E();
    thread _id_6350();
    thread _id_634F();
    self thermaldrawenable();
    self setcandamage( 1 );
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_634E()
{

}

_id_634F()
{
    self endon( "death" );
    self endon( "LISTEN_end_ai_monitor_ac130" );

    while ( isdefined( self ) )
    {
        level.player waittill( "projectile_impact", var_0, var_1 );

        if ( !isdefined( self ) )
            return;

        var_2 = -1;

        switch ( var_0 )
        {
            case "ac130_25mm_alt2":
                var_2 = 256;
                break;
            case "ac130_40mm_alt2":
                var_2 = 768;
                break;
            case "ac130_105mm_alt2":
                var_2 = 1536;
                break;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_1, var_2 ) )
            self dodamage( 10000, self.origin );
    }
}

_id_6350()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstructarray( "rpg_ma_4_enemy_rpg_target_1", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "rpg_ma_4_enemy_rpg_target_2", "targetname" );
    var_2 = common_scripts\utility::getstruct( self.script_noteworthy + "_start", "targetname" );
    var_3 = 1;

    for (;;)
    {
        if ( common_scripts\utility::flag( "FLAG_rpg_delta_fallback" ) )
            var_0 = var_1;

        maps\_anim::_id_11C1( self, "RPG_conceal_idle" );
        maps\_anim::_id_11C1( self, "RPG_conceal_2_standL" );

        if ( var_3 )
        {
            var_3 = 0;
            thread maps\_anim::_id_11C1( self, "RPG_stand_twitch_v1" );
        }
        else
        {
            for ( var_4 = randomintrange( 3, 10 ); var_4 > 0; var_4-- )
                maps\_anim::_id_11C1( self, "RPG_stand_twitch_v1" );

            thread maps\_anim::_id_11C1( self, "RPG_stand_twitch_v1" );
        }

        magicbullet( "rpg_straight_ac130", var_2.origin, var_0[randomint( var_0.size )].origin );
        level thread common_scripts\utility::play_sound_in_space( "weap_rpg_fire_npc", self.origin );
        maps\_anim::_id_11C1( self, "RPG_standL_2_conceal" );
    }
}

_id_6351()
{
    self notify( "LISTEN_ai_end_loop_anim" );
    self endon( "death" );
    self endon( "LISTEN_ai_end_loop_anim" );

    while ( isdefined( self ) )
        maps\_anim::_id_11C1( self, "RPG_stand_twitch_v1" );
}

_id_6352( var_0 )
{
    magicbullet( "rpg_straight_ac130", self gettagorigin( "tag_flash" ), var_0.origin );
}

_id_6353()
{
    self endon( "death" );
    var_0 = 1;

    for (;;)
    {
        if ( isdefined( self.a.rockets ) )
            self.a.rockets = var_0;

        wait 0.05;
    }
}

_id_6354()
{
    self attach( "weapon_rpg7", "TAG_WEAPON_RIGHT" );
    self useanimtree( level._id_1245["drone"] );
    self thermaldrawenable();
    self setcandamage( 1 );
    thread _id_6351();
    thread _id_6355();
    thread _id_6356();
}

_id_6355()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( _id_5F9E::_id_5F0D( var_1, level.player ) )
            break;
    }

    if ( target_istarget( self ) )
        target_remove( self );

    self startragdoll();
    wait 10;

    while ( isdefined( self ) )
    {
        if ( !maps\_utility::_id_26AD( self.origin, getdvarfloat( "cg_fov" ) ) )
        {
            self delete();
            self notify( "death", level.player );
        }

        wait 5;
    }
}

_id_6356()
{
    self endon( "death" );
    self endon( "LISTEN_end_ai_monitor_ac130" );

    while ( isdefined( self ) )
    {
        level.player waittill( "projectile_impact", var_0, var_1 );

        if ( !isdefined( self ) )
            return;

        var_2 = -1;

        switch ( var_0 )
        {
            case "ac130_25mm_alt2":
                var_2 = 256;
                break;
            case "ac130_40mm_alt2":
                var_2 = 768;
                break;
            case "ac130_105mm_alt2":
                var_2 = 1536;
                break;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_1, var_2 ) )
        {
            if ( target_istarget( self ) )
                target_remove( self );

            self startragdoll();
            wait 10;

            while ( isdefined( self ) )
            {
                if ( !maps\_utility::_id_26AD( self.origin, getdvarfloat( "cg_fov" ) ) )
                {
                    self delete();
                    self notify( "death", level.player );
                }

                wait 5;
            }

            return;
        }
    }
}

_id_6357( var_0, var_1 )
{
    self.script_noteworthy = var_0;
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_6358( var_0, var_1 )
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_1402( "FLAG_ai_loaded_in_vehicle" );
    maps\_utility::_id_1402( "FLAG_ai_unloaded_from_vehicle" );
    self.script_noteworthy = var_0;
    maps\_utility::_id_2611();
    thread _id_6359();
    thread _id_635B();
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_6359()
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_ai_init" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.player || !_id_5F9E::_id_5F0A( "magic_bullet_shield", 1 ) )
        {
            _id_636E();

            if ( isdefined( self.damageweapon ) )
            {
                switch ( self.damageweapon )
                {
                    case "ac130_25mm_alt2":
                        if ( _id_5F9E::_id_5EDE( 0.5 ) )
                        {
                            var_2 = randomintrange( 2, 3 );
                            var_3 = 0;
                            var_4 = common_scripts\utility::ter_op( randomint( 2 ), level._id_0C59["crawl_death_1"], level._id_0C59["crawl_death_2"] );
                            _id_5F9E::_id_5F47();
                            self endon( "killanimscript" );
                            wait 0.05;
                            maps\_utility::_id_261D( var_3, var_2, var_4 );
                            self notify( "LISTEN_ai_dying" );
                        }

                        break;
                }
            }

            wait 0.05;
            self dodamage( 1000, self.origin, level.player );
        }
    }
}

_id_635A()
{
    self endon( "death" );
    maps\_utility::_id_1654( "FLAG_ai_unloaded_from_vehicle" );
}

_id_635B()
{
    self endon( "death" );
    self endon( "LISTEN_end_ai_monitor_ac130" );
    maps\_utility::_id_1654( "FLAG_ai_init" );

    while ( isalive( self ) )
    {
        self waittill( "LISTEN_projectile_impact", var_0 );

        if ( isdefined( self._id_635C ) )
        {
            var_1 = self._id_635C;
            var_2 = 0;

            switch ( var_1 )
            {
                case "ac130_25mm_alt2":
                    var_2 = 0;
                    break;
                case "ac130_40mm_alt2":
                case "ac130_105mm_alt2":
                    var_3 = 250;
                    var_2 = _id_5F9E::_id_5F15( self.origin, var_0, var_3 );
                    break;
            }

            if ( var_2 )
            {
                var_4 = 20;
                var_5 = 0;
                var_6 = common_scripts\utility::ter_op( randomint( 2 ), level._id_0C59["crawl_death_1"], level._id_0C59["crawl_death_2"] );
                animscripts\shared::_id_0D73();
                maps\_utility::_id_261D( var_5, var_4, var_6 );
                self notify( "LISTEN_ai_dying" );
                wait 0.05;
                self dodamage( 1000, self.origin, level.player );
                return;
            }
        }
    }
}

_id_635D( var_0 )
{
    self endon( "death" );
    var_0 common_scripts\utility::waittill_any( "death", "LISTEN_death", "LISTEN_helicopter_pickup" );

    if ( !maps\_utility::_id_1008( "FLAG_ai_loaded_in_vehicle" ) )
    {
        var_1 = getnode( self.script_noteworthy + "_return", "targetname" );

        if ( isdefined( var_1 ) )
        {
            maps\_utility::_id_2053( var_1 );
            var_2 = 16.0;
            _id_5F9E::_id_5F72( self, var_1, var_2 );
            self delete();
        }
    }
}

_id_635E()
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_2611();
    thread _id_635F();
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_635F()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.player || !_id_5F9E::_id_5F0A( "magic_bullet_shield", 1 ) )
        {
            _id_636E();

            if ( isdefined( self.damageweapon ) )
            {
                switch ( self.damageweapon )
                {
                    case "ac130_25mm_alt2":
                        if ( _id_5F9E::_id_5EDE( 0.5 ) )
                        {
                            var_2 = randomintrange( 2, 3 );
                            var_3 = 0;
                            var_4 = common_scripts\utility::ter_op( randomint( 2 ), level._id_0C59["crawl_death_1"], level._id_0C59["crawl_death_2"] );
                            _id_5F9E::_id_5F47();
                            self endon( "killanimscript" );
                            wait 0.05;
                            maps\_utility::_id_261D( var_3, var_2, var_4 );
                            self notify( "LISTEN_ai_dying" );
                        }

                        break;
                }
            }

            wait 0.05;
            self dodamage( 1000, self.origin, level.player );
        }
    }
}

_id_6360()
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_2611();
    thread _id_6361();
    thread _id_6363();
    thread _id_6362();
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_6361()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( _id_5F9E::_id_5F0D( var_1, level.player ) || _id_5F9E::_id_5F0A( "magic_bullet_shield", 0 ) )
        {
            _id_636E();

            if ( isdefined( self.damageweapon ) )
            {
                switch ( self.damageweapon )
                {
                    case "ac130_25mm_alt2":
                        if ( _id_5F9E::_id_5EDE( 0.75 ) )
                        {
                            var_2 = randomintrange( 2, 3 );
                            var_3 = 0;
                            var_4 = common_scripts\utility::ter_op( randomint( 2 ), level._id_0C59["crawl_death_1"], level._id_0C59["crawl_death_2"] );
                            _id_5F9E::_id_5F47();
                            self endon( "killanimscript" );
                            wait 0.05;
                            maps\_utility::_id_261D( var_3, var_2, var_4 );
                            self notify( "LISTEN_ai_dying" );
                        }

                        break;
                }
            }

            wait 0.05;
            self dodamage( 1000, self.origin, level.player );
        }
    }
}

_id_6362()
{
    self endon( "death" );
    self endon( "LISTEN_end_ai_monitor_ac130" );

    while ( isdefined( self ) )
    {
        level.player waittill( "projectile_impact", var_0, var_1 );

        if ( !isdefined( self ) )
            return;

        var_2 = -1;

        switch ( var_0 )
        {
            case "ac130_40mm_alt2":
                var_2 = 384;
                break;
            case "ac130_105mm_alt2":
                var_2 = 768;
                break;
        }

        if ( _id_5F9E::_id_5F11( self.origin, var_1, var_2, 96.0 ) )
            self dodamage( 10000, self.origin, level.player );
    }
}

_id_6363()
{
    self endon( "death" );
    var_0 = 0;

    while ( !var_0 )
    {
        var_1 = _id_6255();
        var_2 = _id_6258();
        var_3 = var_1[1] - var_2 * var_1[0];
        var_4 = _id_5F9E::_id_5F44( self, var_2, var_3 );

        if ( var_2 > 0 && var_4 || var_2 < 0 && !var_4 )
            var_0 = 1;

        wait 0.05;
    }

    _id_636D();
    common_scripts\utility::delaycall( 10.0, ::dodamage, 10000, self.origin );
}

_id_6364()
{
    self endon( "death" );
    wait 10;
    _id_636D();
    var_0 = getnode( "city_area_run_and_die", "targetname" );
    maps\_utility::_id_2053( var_0 );

    while ( isdefined( self ) )
    {
        if ( !maps\_utility::_id_26AD( self.origin, cos( 55 ) ) )
            self dodamage( 10000, ( 0.0, 0.0, 0.0 ) );

        wait 5;
    }
}

_id_6365()
{
    self endon( "death" );
    var_0 = 0.05;
    var_1 = level._id_624D + 1;
    var_1 = common_scripts\utility::ter_op( var_1 >= level._id_624E.size, level._id_624E.size - 1, var_1 );
    var_2 = _id_6256( var_1 );
    var_3 = 1;

    switch ( var_1 )
    {
        case 1:
        case 2:
        case 3:
            var_3 = 1;
            break;
        case 4:
            var_3 = 2;
            break;
    }

    var_4 = _id_6259( var_3 );
    var_5 = var_2[1] - var_4 * var_2[0];
    var_6 = getnodesinradius( self.origin, 2048.0, 0.0 );
    var_7 = [];
    var_8 = [];

    foreach ( var_10 in var_6 )
    {
        if ( _id_5F9E::_id_5F44( var_10, var_4, var_5 ) )
        {
            if ( isdefined( var_10.targetname ) && issubstr( var_10.targetname, "enemy" ) )
                var_7[var_7.size] = var_10;

            if ( !isdefined( var_10.targetname ) )
                var_8[var_8.size] = var_10;
        }
    }

    var_7 = sortbydistance( var_7, self.origin );
    var_12 = undefined;

    foreach ( var_10 in var_7 )
    {
        if ( !isdefined( var_10.owner ) )
            var_12 = var_10;
    }

    if ( level._id_624D + 1 < level._id_624E.size && isdefined( var_12 ) )
    {
        maps\_utility::_id_2053( var_12 );
        thread _id_636A( 5, 1.0 );
    }
    else if ( var_8.size > 0 )
    {
        var_8 = sortbydistance( var_8, self.origin );
        maps\_utility::_id_2053( var_8[var_8.size - 1] );
        thread _id_636A( 10, 1.0 );
    }
}

_id_6366()
{
    self endon( "death" );

    while ( isdefined( self ) && _id_5F9E::_id_5F11( self.origin, self._id_6278, self._id_6277 ) )
        wait 0.05;

    _id_5CFE::_id_5C97( [ self ] );
}

_id_6367()
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    maps\_utility::_id_2611();
    thread _id_6361();
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_6368()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( self.damagetaken > self.maxhealth )
        {
            _id_636E();

            if ( isdefined( self.damageweapon ) )
            {
                switch ( self.damageweapon )
                {
                    case "ac130_25mm_alt2":
                        if ( _id_5F9E::_id_5EDE( 0.5 ) )
                        {
                            var_2 = randomintrange( 2, 3 );
                            var_3 = 0;
                            var_4 = common_scripts\utility::ter_op( randomint( 2 ), level._id_0C59["crawl_death_1"], level._id_0C59["crawl_death_2"] );
                            _id_5F9E::_id_5F47();
                            self endon( "killanimscript" );
                            wait 0.05;
                            maps\_utility::_id_261D( var_3, var_2, var_4 );
                            self notify( "LISTEN_ai_dying" );
                        }

                        break;
                }
            }
        }

        wait 0.05;
        self dodamage( 1000, self.origin, level.player );
    }
}

_id_6369()
{
    maps\_utility::_id_1402( "FLAG_ai_init" );
    thread _id_6361();
    maps\_utility::_id_13DC( "FLAG_ai_init" );
}

_id_636A( var_0, var_1 )
{
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( var_0 < 0.05, 0.05, var_0 );
    var_1 = common_scripts\utility::ter_op( var_1 < 0.05, 0.05, var_1 );
    _id_636D();
    var_2 = 0;

    while ( isdefined( self ) && var_2 < var_0 )
    {
        if ( !maps\_utility::_id_26AD( self.origin, cos( 55 ) ) )
            self dodamage( 10000, ( 0.0, 0.0, 0.0 ) );

        var_2 += var_1;
        wait(var_1);
    }
}

_id_636B()
{
    self.ignoreall = 1;
    self.ignoreme = 1;
    wait 5.0;

    if ( isdefined( self ) )
    {
        self.ignoreall = 0;
        self.ignoreme = 0;
    }
}

_id_636C()
{
    self.team = "team3";
    wait 5.0;

    if ( isdefined( self ) )
        self.team = "axis";
}

_id_636D()
{
    _id_636E();
    self.health = 1;
}

_id_636E()
{
    if ( _id_5F9E::_id_5F0A( "magic_bullet_shield", 1 ) )
        maps\_utility::_id_1902();
}

_id_636F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_1 = common_scripts\utility::ter_op( _id_5F9E::_id_5F0D( var_1, "position" ), "position", var_1 );
    var_3 = _id_5F9E::_id_5F0F( var_3, 0 );
    var_4 = _id_5F9E::_id_5F0F( var_4, var_3 + 0.05 );
    var_5 = _id_5F9E::_id_5F0F( var_5, 0.05 );
    self endon( "death" );
    self waittill( var_2 );
    wait(var_5);
    maps\_utility::_id_2724( randomfloatrange( var_3, var_4 ) );

    switch ( var_1 )
    {
        case "entity":
            maps\_utility::_id_2052( var_0 );
            break;
        case "node":
            maps\_utility::_id_2053( var_0 );
            break;
        case "position":
            maps\_utility::_id_1237( var_0.origin );
            break;
    }
}

_id_6370( var_0 )
{
    self notify( "LISTEN_end_ai_ignoreall" );
    self endon( "LISTEN_end_ai_ignoreall" );
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, 0.05 );
    var_0 = common_scripts\utility::ter_op( var_0 > 0, var_0, 0.05 );
    maps\_utility::_id_2612( 1 );
    maps\_utility::delaythread( var_0, maps\_utility::_id_2612, 0 );
}

_id_6371( var_0 )
{
    self notify( "LISTEN_end_ai_ignoresuppression" );
    self endon( "LISTEN_end_ai_ignoresuppression" );
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, 0.05 );
    var_0 = common_scripts\utility::ter_op( var_0 > 0, var_0, 0.05 );
    maps\_utility::_id_26F3( 1 );
    maps\_utility::delaythread( var_0, maps\_utility::_id_26F3, 0 );
}

_id_5C37( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_2 = 0;

    if ( isdefined( var_1["position"] ) && isdefined( var_1["surfacetype"] ) && var_1["surfactype"] == "metal" )
    {
        if ( isdefined( var_1["entity"] ) && isdefined( var_1["entity"].classname ) )
        {
            if ( !issubstr( var_1["entity"].classname, "mi17" ) || !issubstr( var_1["entity"].classname, "t72" ) || !issubstr( var_1["entity"].classname, "hind" ) || !issubstr( var_1["entity"].classname, "btr" ) )
                var_2 = 1;
            else
                return;
        }
        else
            var_2 = 1;
    }
    else
        return;

    if ( var_2 )
    {
        self waittill( "death" );

        if ( isdefined( self ) && isdefined( self.origin ) && _id_5F9E::_id_5F15( self.origin, var_1["position"], 128 ) )
        {
            switch ( var_0 )
            {
                case "ac130_40mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_40mm_metal", self.origin );
                    break;
                case "ac130_105mm_alt2":
                    level thread common_scripts\utility::play_sound_in_space( "exp_ac130_105mm_metal", self.origin );
                    break;
            }
        }
    }
}
