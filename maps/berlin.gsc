// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "berlin" );
    precachemodel( "berlin_traffic_signal_2x_01_green_on" );
    precachemodel( "berlin_traffic_signal_2x_01_red_on" );
    precachemodel( "berlin_traffic_signal_2x_01_yellow_on" );
    level._id_4E86 = "m14ebr_scope";
    precacheitem( level._id_4E86 );
    level._id_1C72 = "acr_hybrid_berlin";
    level._id_1C73 = "m14ebr_scope";
    level._id_732A = "fnfiveseven_reverse_breach";
    precacheitem( level._id_1C72 );
    precacheitem( level._id_1C73 );
    precacheitem( level._id_732A );
    precacheitem( "leopard_2a7_sabot" );
    precacheitem( "ninebang_grenade" );
    precacheitem( "flash_grenade" );
    level._id_736F = "m14ebr_scope";
    precacheshellshock( "berlin_intro" );
    precacheitem( "a10_designator_ads" );
    precacheitem( "rpg" );
    precacheitem( "javelin_berlin" );
    precacheitem( "rpg_straight" );
    precacheitem( "stinger_speedy" );
    precachemodel( "weapon_m14_sp_iw5_obj" );
    precachemodel( "weapon_rpg7_obj" );
    precachemodel( "vehicle_a10_warthog" );
    precacheitem( "a10_30mm" );
    level._id_71C3[1] = "cobra_20mm";
    level._id_71C4[1][0] = "tag_flash";
    precacheitem( level._id_71C3[1] );
    level._id_71C3[2] = "cobra_Hellfire";
    level._id_71C4[2][0] = "tag_flash_2";
    level._id_71C4[2][1] = "tag_flash_11";
    precacheitem( level._id_71C3[2] );
    level._id_71C3[3] = "cobra_Sidewinder_berlin";
    level._id_71C4[3][0] = "tag_flash_3";
    level._id_71C4[3][1] = "tag_flash_22";
    precacheitem( level._id_71C3[3] );
    precacheitem( "rpg_cheap" );
    level.cosine["sniper"] = cos( 5 );
    precacheshader( "dpad_soflam_static" );
    precacheshader( "dpad_soflam_inactive" );
    precachemodel( "viewhands_delta_dirty" );
    precacheshader( "hint_mantle" );
    precacherumble( "heavy_3s" );
    precacherumble( "light_1s" );
    level.scr_sound["detpack_explo_main"] = "detpack_explo_main";
    precacheshellshock( "berlin_building" );
    precacheshader( "black" );
    precachemodel( "body_delta_woodland_assault_aa_dusty" );
    precachemodel( "body_hero_sandman_delta_dusty" );
    precachemodel( "body_hero_truck_delta_dusty" );
    maps\berlin_a10::_id_4E32();
    maps\_utility::_id_1E74( "Intro", ::_id_5872, undefined, ::_id_73A2 );
    maps\_utility::_id_1E74( "Heli_Ride", ::_id_7391, undefined, ::_id_73A3 );
    maps\_utility::_id_1E74( "Chopper_Crash", ::_id_7392, undefined, ::_id_73A4 );
    maps\_utility::_id_1E74( "Clear_Roof", ::_id_7393, undefined, ::_id_73A5 );
    maps\_utility::_id_1E74( "Sniper", ::_id_7395, undefined, ::_id_73A6 );
    maps\_utility::_id_1E74( "Rappel", ::_id_5EAB, undefined, ::_id_73A7 );
    maps\_utility::_id_1E74( "Rappel_Complete", ::_id_7396, undefined, ::_id_73A8 );
    maps\_utility::_id_1E74( "Clear_Bridge", ::_id_7398, undefined, ::_id_73A9 );
    maps\_utility::_id_1E74( "Advance_pkwy", ::_id_7399, undefined, ::_id_73AA );
    maps\_utility::_id_1E74( "Building_Collapse", ::_id_739B, undefined, ::_id_73AB );
    maps\_utility::_id_1E74( "Traverse_Building", ::_id_739C, undefined, ::_id_73AC );
    maps\_utility::_id_1E74( "Emerge", ::_id_739E, undefined, ::_id_73AD );
    maps\_utility::_id_1E74( "Last_Stand", ::_id_739F, undefined, ::_id_73AE );
    maps\_utility::_id_1E74( "Reverse Breach", ::_id_73A0, undefined, ::_id_73AF );
    precachestring( &"VARIABLE_SCOPE_SNIPER_MAG" );
    precachestring( &"VARIABLE_SCOPE_SNIPER_ZOOM" );
    precachestring( &"BERLIN_INTROSCREEN_20MINS" );
    precachestring( &"BERLIN_INTROSCREEN_LINE1" );
    precachestring( &"BERLIN_INTROSCREEN_LINE2" );
    precachestring( &"BERLIN_INTROSCREEN_LINE3" );
    precachestring( &"BERLIN_INTROSCREEN_LINE4" );
    precachestring( &"BERLIN_INTROSCREEN_LINE5" );
    precachestring( &"BERLIN_OVERWATCH" );
    precachestring( &"BERLIN_SNIPE_B" );
    precachestring( &"BERLIN_AIR_SUPPORT" );
    precachestring( &"BERLIN_RAPPEL_OBJ" );
    precachestring( &"BERLIN_SUPPORT_SANDMAN" );
    precachestring( &"BERLIN_DESTROY_TANKS_OBJ" );
    precachestring( &"BERLIN_ADVANCE_OBJ" );
    precachestring( &"BERLIN_TRAVERSE_BUILDING_OBJ" );
    precachestring( &"BERLIN_FALL_BACK_TO_ROOF" );
    precachestring( &"BERLIN_TARGETS" );
    precachestring( &"BERLIN_PROTECT" );
    precachestring( &"BERLIN_DESTROY" );
    precachestring( &"BERLIN_RAPPEL" );
    precachestring( &"BERLIN_BREACH" );
    precachestring( &"BERLIN_RAPPEL_HINT" );
    precachestring( &"BERLIN_BREACH_HINT" );
    maps\_utility::add_hint_string( "rpg_secondary", &"BERLIN_RPG_HINT", maps\berlin_code::_id_727F );
    maps\_utility::add_hint_string( "damage_leapard_hint", &"BERLIN_FRIENDLY_TANK_FIRE_WARNING" );
    precachestring( &"BERLIN_DIRECT_A10" );
    precachestring( &"BERLIN_ACTIVATE_A10" );
    precachestring( &"BERLIN_DIRECT_A10_POINTS" );
    precachestring( &"BERLIN_DIRECT_A10_STATIC" );
    precachestring( &"BERLIN_SNIPER_FAIL_QUOTE" );
    precachestring( &"BERLIN_SNIPER_TANK_FAIL_QUOTE" );
    precachestring( &"BERLIN_BRIDGE_BATTLE_FAIL_QUOTE" );
    precachestring( &"BERLIN_LAST_STAND_FAIL" );
    common_scripts\utility::flag_init( "is_intro" );
    common_scripts\utility::flag_init( "falling_column_fell" );
    common_scripts\utility::flag_init( "intro_dialogue_complete" );
    common_scripts\utility::flag_init( "start_intro_fade_2_white" );
    common_scripts\utility::flag_init( "intro_outro_full_white" );
    common_scripts\utility::flag_init( "intro_sequence_complete" );
    common_scripts\utility::flag_init( "intro_lone_star_facial_anim_complete" );
    common_scripts\utility::flag_init( "intro_start_on_path" );
    common_scripts\utility::flag_init( "start_sandman_vo" );
    common_scripts\utility::flag_init( "intro_heli_hit" );
    common_scripts\utility::flag_init( "start_level_ambient" );
    common_scripts\utility::flag_init( "player_unloaded_from_intro_flight" );
    common_scripts\utility::flag_init( "rpg_attacker_fires" );
    common_scripts\utility::flag_init( "lone_star_near_building_throw" );
    common_scripts\utility::flag_init( "patroller_alerted" );
    common_scripts\utility::flag_init( "sniper_hotel_roof_clear" );
    common_scripts\utility::flag_init( "delta_support_squad_heli_check_failure" );
    common_scripts\utility::flag_init( "delta_support_squad_heli_stop_firing" );
    common_scripts\utility::flag_init( "sniper_rooftop_fire_rocket" );
    common_scripts\utility::flag_init( "aa_building_level4_dead" );
    common_scripts\utility::flag_init( "sniper_hotel_roof_spawn_helis" );
    common_scripts\utility::flag_init( "sniper_delta_support_squad_unloaded" );
    common_scripts\utility::flag_init( "spawn_sniper_patrol_wave2" );
    common_scripts\utility::flag_init( "bravo_team_spawned" );
    common_scripts\utility::flag_init( "bravo_team_unloaded" );
    common_scripts\utility::flag_init( "delta_support_squad_roof_advance_1" );
    common_scripts\utility::flag_init( "delta_support_squad_roof_advance_2" );
    common_scripts\utility::flag_init( "delta_support_breach_kick" );
    common_scripts\utility::flag_init( "snipe_hotel_roof_complete" );
    common_scripts\utility::flag_init( "sniper_tank_1_reached_path_end" );
    common_scripts\utility::flag_init( "sniper_tank_2_reached_path_end" );
    common_scripts\utility::flag_init( "bravo_team_begin_rappel" );
    common_scripts\utility::flag_init( "bravo_team_reached_lower_rooftop" );
    common_scripts\utility::flag_init( "delta_support_in_hotel" );
    common_scripts\utility::flag_init( "sniper_complete" );
    common_scripts\utility::flag_init( "mainstreet_battle_start" );
    common_scripts\utility::flag_init( "bravo_team_planted_c4" );
    common_scripts\utility::flag_init( "bravo_team_ground_enemies1_dead" );
    common_scripts\utility::flag_init( "bravo_team_ground_enemies1_2_dead" );
    common_scripts\utility::flag_init( "delta_support_street_enemies4" );
    common_scripts\utility::flag_init( "sniper_tanks_one_dead" );
    common_scripts\utility::flag_init( "sniper_tanks_two_dead" );
    common_scripts\utility::flag_init( "start_parkway_tank" );
    common_scripts\utility::flag_init( "parkway_tank_dead" );
    common_scripts\utility::flag_init( "sniper_delta_support_guys_dead" );
    common_scripts\utility::flag_init( "allies_in_sniping_position" );
    common_scripts\utility::flag_init( "sniper_victim_heli_shoot" );
    common_scripts\utility::flag_init( "sniper_vo_complete" );
    common_scripts\utility::flag_init( "begin_rappel_vo" );
    common_scripts\utility::flag_init( "sniper_tank_2_mission_failing" );
    common_scripts\utility::flag_init( "player_looking_at_granite" );
    common_scripts\utility::flag_init( "spawn_hotel_rooftop_enemies_complete" );
    common_scripts\utility::flag_init( "spawn_sniper_tanks_complete" );
    common_scripts\utility::flag_init( "granite_team_dead" );
    common_scripts\utility::flag_init( "lone_star_sniping_position_complete" );
    common_scripts\utility::flag_init( "grinch_sniping_position_complete" );
    common_scripts\utility::flag_init( "truck_sniping_position_complete" );
    common_scripts\utility::flag_init( "rappel_teleport_dudes" );
    common_scripts\utility::flag_init( "stop_sniper_glow" );
    common_scripts\utility::flag_init( "paint_targets_vo" );
    common_scripts\utility::flag_init( "rappel_end" );
    common_scripts\utility::flag_init( "rappel_complete" );
    common_scripts\utility::flag_init( "vo_check_wounded_soldier" );
    common_scripts\utility::flag_init( "vo_downed_apache_complete" );
    common_scripts\utility::flag_init( "stop_chopper_blade" );
    common_scripts\utility::flag_init( "downed_apache_paired_guy_dead" );
    common_scripts\utility::flag_init( "clean_up_downed_apache" );
    common_scripts\utility::flag_init( "player_passed_apache" );
    common_scripts\utility::flag_init( "bridge_deadtank_dead" );
    common_scripts\utility::flag_init( "stop_rpg_glow" );
    common_scripts\utility::flag_init( "bridge_rpg_picked_up" );
    common_scripts\utility::flag_init( "bridge_fighters_start_fighting" );
    common_scripts\utility::flag_init( "tank_turret_target_player" );
    common_scripts\utility::flag_init( "bridge_one_tank_destroyed" );
    common_scripts\utility::flag_init( "rus_all_tanks_dead" );
    common_scripts\utility::flag_init( "rus_all_tanks_dead_delay" );
    common_scripts\utility::flag_init( "bridge_combat_dudes_dead" );
    common_scripts\utility::flag_init( "trig_path_heroes_bridge_02_triggered" );
    common_scripts\utility::flag_init( "parkway_tank_left_pause_01" );
    common_scripts\utility::flag_init( "parkway_tank_right_pause_01" );
    common_scripts\utility::flag_init( "lone_star_going_down" );
    common_scripts\utility::flag_init( "player_interacting_with_wounded_lonestar" );
    common_scripts\utility::flag_init( "player_teleport_after_collapse_complete" );
    common_scripts\utility::flag_init( "ambush_after_building_collapse_start" );
    common_scripts\utility::flag_init( "sandman_start_aftermath" );
    common_scripts\utility::flag_init( "swivel_fades_out" );
    common_scripts\utility::flag_init( "swivel_ends" );
    common_scripts\utility::flag_init( "not_random_blur" );
    common_scripts\utility::flag_init( "player_limping" );
    common_scripts\utility::flag_init( "stop_being_stunned" );
    common_scripts\utility::flag_init( "aftermath_se_complete" );
    common_scripts\utility::flag_init( "vo_building_collapse_complete" );
    common_scripts\utility::flag_init( "lone_star_at_ceiling_collapse" );
    common_scripts\utility::flag_init( "start_intro_vo" );
    common_scripts\utility::flag_init( "clean_up_tank_corpse" );
    common_scripts\utility::flag_init( "collapse_roof" );
    common_scripts\utility::flag_init( "ceiling_collapse_complete" );
    common_scripts\utility::flag_init( "lone_star_at_emerge_door" );
    common_scripts\utility::flag_init( "truck_at_emerge_door" );
    common_scripts\utility::flag_init( "emerge_door_in_position" );
    common_scripts\utility::flag_init( "emerge_door_open" );
    common_scripts\utility::flag_init( "emerge_dialogue_done" );
    common_scripts\utility::flag_init( "emerge_door_begin_open" );
    common_scripts\utility::flag_init( "last_stand_player_outside" );
    common_scripts\utility::flag_init( "last_stand_tanks_stopped_firing" );
    common_scripts\utility::flag_init( "tank_killed_player" );
    common_scripts\utility::flag_init( "door_hotel_stairs_1_open" );
    common_scripts\utility::flag_init( "door_hotel_stairs_2_open" );
    common_scripts\utility::flag_init( "exfil_hallway_dudes_dead" );
    common_scripts\utility::flag_init( "reverse_breach_ready" );
    common_scripts\utility::flag_init( "breach_weapon_drawn" );
    common_scripts\utility::flag_init( "reverse_breach_start" );
    common_scripts\utility::flag_init( "reverse_breach_door_blown" );
    common_scripts\utility::flag_init( "reverse_breach_complete" );
    common_scripts\utility::flag_init( "reverse_breach_player_back_in_business" );
    common_scripts\utility::flag_init( "lone_star_wounded" );
    common_scripts\utility::flag_init( "reverse_breach_ending_vo_complete" );
    common_scripts\utility::flag_init( "reverse_breach_getup_slowmo_start" );
    common_scripts\utility::flag_init( "start_bridge_battle" );
    level.objective_count = 0;
    maps\sp_berlin_precache::main();
    maps\berlin_anim::main();
    maps\createart\berlin_art::main();
    maps\berlin_fx::main();
    maps\berlin_aud::main();
    maps\_load::main();
    thread maps\berlin_util::_id_4426();
    maps\_drone_ai::init();
    maps\berlin_vo::_id_50E2();
    thread maps\berlin_vo::_id_6E3C();
    maps\_shg_common::_id_16B0();
    setsaveddvar( "r_specularcolorscale", 1.8 );
    level._id_2A76 = maps\berlin_code::_id_7352;
    level.variable_scope_weapons = [ "m14ebr_scope" ];
    thread maps\_shg_common::_id_1676();
    level._id_169F = [];
    var_0 = getentarray( "delete_enemies_in_volume", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\berlin_code::_id_714A );
    common_scripts\utility::flag_init( "off_fire_light" );
    thread _id_73B0();
    common_scripts\utility::array_thread( getentarray( "traffic_light_green_off_blinky", "targetname" ), ::_id_73B1 );
    common_scripts\utility::array_thread( getentarray( "traffic_light_red_off_blinky", "targetname" ), ::_id_73B2 );
    common_scripts\utility::array_thread( getentarray( "traffic_light_yellow_off_blinky", "targetname" ), ::_id_73B3 );
    common_scripts\utility::array_thread( getentarray( "traffic_light_yellow_green_blinky", "targetname" ), ::_id_73B4 );
    maps\_compass::setupminimap( "compass_map_berlin" );
    anim._id_20E3["AI_ninebang_grenade"] = 0;
    maps\_utility::_id_1A5A( "axis", maps\berlin_a10::a10_add_target );
    maps\_utility::_id_1A5A( "axis", maps\berlin_a10::a10_remove_target_ondeath );
    maps\_utility::_id_1A5A( "allies", maps\berlin_a10::a10_add_target );
    maps\_utility::_id_1A5A( "allies", maps\berlin_a10::a10_remove_target_ondeath );
    level.pipesdamage = 0;
    var_1 = getent( "falling_column_ai_clip", "targetname" );
    var_1 hide();
}

_id_5872()
{
    level.heroes = [];
    maps\berlin_code::setup_friendly_spawner( "lone_star", maps\berlin_code::setup_lone_star );
    maps\berlin_code::setup_friendly_spawner( "essex", maps\berlin_code::setup_essex );
    maps\berlin_code::setup_friendly_spawner( "truck", maps\berlin_code::setup_truck );
}

_id_7391()
{
    level.heroes = [];
    maps\berlin_code::setup_friendly_spawner( "lone_star", maps\berlin_code::setup_lone_star );
    maps\berlin_code::setup_friendly_spawner( "essex", maps\berlin_code::setup_essex );
    maps\berlin_code::setup_friendly_spawner( "truck", maps\berlin_code::setup_truck );
    common_scripts\utility::flag_set( "intro_outro_full_white" );
}

_id_7392()
{
    maps\_audio::aud_send_msg( "start_chopper_crash" );
    thread maps\_utility::vision_set_fog_changes( "berlin", 0 );
    maps\_shg_common::move_player_to_start( "player_start_chopper_crash" );
    common_scripts\utility::flag_set( "player_unloaded_from_intro_flight" );
    maps\_audio::aud_send_msg( "mus_player_unloaded_from_intro_flight" );
    var_0 = getent( "aa_building_hit0", "targetname" );
    var_0 delete();
    var_0 = getent( "aa_building_hit1", "targetname" );
    var_0 delete();
    var_0 = getent( "aa_building_hit2", "targetname" );
    var_0 delete();
    maps\berlin_code::spawn_berlin_friendlies( "player_start_chopper_crash" );
}

_id_7393()
{
    maps\_audio::aud_send_msg( "start_clear_roof" );
    thread maps\_utility::vision_set_fog_changes( "berlin", 0 );
    maps\_shg_common::move_player_to_start( "player_start_sam_destroyed" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_sam_destroyed" );
    var_0 = getent( "aa_building_level1_spawn", "target" );
    var_0 delete();
    common_scripts\utility::flag_set( "player_on_roof" );
    common_scripts\utility::flag_set( "aa_building_level4_dead" );
    var_1 = common_scripts\utility::getstruct( "aa_building_obj_loc_3", "targetname" );
    level.over_obj_num = level.objective_count;
    objective_add( level.over_obj_num, "current", &"BERLIN_OVERWATCH", var_1.origin );
    level.objective_count++;
    thread maps\berlin_code::kill_player_triggers( "kill_player_sniper", "player_rappels" );
}

_id_7395()
{
    maps\_audio::aud_send_msg( "start_sniper" );
    common_scripts\utility::flag_set( "mainstreet_battle_start" );
    common_scripts\utility::flag_set( "aa_building_level4_dead" );
    maps\_shg_common::move_player_to_start( "player_start_sniper" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_sniper" );
    thread maps\_utility::vision_set_fog_changes( "berlin", 0 );
    thread maps\berlin_code::_id_71E9();
    thread maps\berlin_code::_id_71D8();
    thread maps\berlin_code::kill_player_triggers( "kill_player_sniper", "player_rappels" );
    maps\berlin_code::_id_7249();
    var_0 = getent( "aa_building_level1_spawn", "target" );
    var_0 delete();
    var_1 = common_scripts\utility::getstruct( "aa_building_obj_loc_3", "targetname" );
    level.over_obj_num = level.objective_count;
    objective_add( level.over_obj_num, "current", &"BERLIN_OVERWATCH", var_1.origin );
    level.objective_count++;
}

_id_5EAB()
{
    maps\_audio::aud_send_msg( "start_rappel" );
    var_0 = getent( "snipe_player_in_position_trigger", "targetname" );
    var_0 delete();
    maps\_shg_common::move_player_to_start( "start_point_rappel" );
    maps\berlin_code::spawn_berlin_friendlies( "start_point_rappel" );
    thread maps\_utility::vision_set_fog_changes( "berlin", 0 );
    maps\berlin_code::_id_7249();
    common_scripts\utility::flag_set( "lone_star_sniping_position_complete" );
    common_scripts\utility::flag_set( "grinch_sniping_position_complete" );
    common_scripts\utility::flag_set( "truck_sniping_position_complete" );
    common_scripts\utility::flag_set( "sniper_complete" );
    common_scripts\utility::flag_set( "begin_rappel_vo" );
}

_id_7396()
{
    maps\_audio::aud_send_msg( "start_rappel_complete" );
    thread maps\_utility::vision_set_fog_changes( "berlin_rappel_complete", 0 );
    maps\_shg_common::move_player_to_start( "player_start_rappel_complete" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_rappel_complete" );
    common_scripts\utility::flag_set( "rappel_complete" );
    var_0 = common_scripts\utility::getstruct( "obj_rappel_loc", "targetname" );
    level._id_7397 = level.objective_count;
    objective_add( level._id_7397, "current", &"BERLIN_RAPPEL_OBJ", var_0.origin );
    objective_setpointertextoverride( level._id_7397, &"BERLIN_RAPPEL" );
    level.objective_count++;
}

_id_7398()
{
    maps\_audio::aud_send_msg( "start_clear_bridge" );
    thread maps\_utility::vision_set_fog_changes( "berlin_pre_parkway", 0 );
    maps\_shg_common::move_player_to_start( "player_start_clear_bridge" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_clear_bridge" );
    var_0 = common_scripts\utility::getstruct( "obj_advance_to_bridge", "targetname" );
    level._id_7286 = level.objective_count;
    objective_add( level._id_7286, "current", &"BERLIN_SUPPORT_SANDMAN" );
    objective_onentity( level._id_7286, level._id_4E8F );
    level.objective_count++;
    common_scripts\utility::flag_set( "start_bridge_battle" );
    common_scripts\utility::flag_set( "vo_downed_apache_complete" );
}

_id_7399()
{
    maps\_audio::aud_send_msg( "start_advance_parkway" );
    level._id_7293 = [];
    thread maps\_utility::vision_set_fog_changes( "berlin_parkway", 0 );
    var_0 = common_scripts\utility::getstruct( "start_parkway_objective", "targetname" );
    level._id_739A = level.objective_count;
    objective_add( level._id_739A, "current", &"BERLIN_ADVANCE_OBJ", var_0.origin );
    level.objective_count++;
    maps\_shg_common::move_player_to_start( "player_start_advance_parkway" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_advance_parkway" );
    thread maps\berlin_code::_id_7292();
    common_scripts\utility::flag_set( "usa_tanks_start_bridge_advance" );
    common_scripts\utility::flag_set( "bridge_one_tank_destroyed" );
    common_scripts\utility::flag_set( "rus_all_tanks_dead" );
}

_id_739B()
{
    level._id_7293 = [];
    maps\_audio::aud_send_msg( "start_building_collapse" );
    thread maps\_utility::vision_set_fog_changes( "berlin_parkway", 0 );
    maps\_shg_common::move_player_to_start( "player_start_building_collapse" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_building_collapse" );
    level._id_739A = level.objective_count;
    var_0 = common_scripts\utility::getstruct( "obj_advance_to_collapse", "targetname" );
    objective_add( level._id_739A, "current", &"BERLIN_ADVANCE_OBJ", var_0.origin );
    level.objective_count++;
}

_id_739C()
{
    maps\_audio::aud_send_msg( "start_traverse_building" );
    thread maps\_utility::vision_set_fog_changes( "berlin_traverse_building", 0 );
    maps\_shg_common::move_player_to_start( "player_start_traverse_building" );
    var_0 = getent( "building_to_destroy", "script_noteworthy" );
    var_0 delete();
    maps\berlin_code::spawn_berlin_friendlies( "player_start_traverse_building" );
    common_scripts\utility::flag_set( "building_collapse_player_safe" );
    common_scripts\utility::flag_set( "not_intro" );
    common_scripts\utility::flag_set( "vo_building_collapse_complete" );
    level._id_739D = level.objective_count;
    objective_add( level._id_739D, "current", &"BERLIN_TRAVERSE_BUILDING_OBJ" );
    objective_onentity( level._id_739D, level._id_4E8F );
    level.objective_count++;
    level._id_4E8F maps\_utility::_id_109B();
    level._id_71A0 maps\_utility::_id_109B();
    level._id_45C4 maps\_utility::_id_109B();
}

_id_739E()
{
    maps\_audio::aud_send_msg( "start_emerge" );
    thread maps\_utility::vision_set_fog_changes( "berlin_traverse_building", 0 );
    maps\_shg_common::move_player_to_start( "player_start_emerge" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_emerge" );
    level._id_739D = level.objective_count;
    objective_add( level._id_739D, "current", &"BERLIN_TRAVERSE_BUILDING_OBJ" );
    objective_onentity( level._id_739D, level._id_4E8F );
    level.objective_count++;
    var_0 = getent( "building_to_destroy", "script_noteworthy" );
    var_0 delete();
    common_scripts\utility::flag_set( "lone_star_at_emerge_door" );
    common_scripts\utility::flag_set( "truck_at_emerge_door" );
}

_id_739F()
{
    maps\_audio::aud_send_msg( "start_last_stand" );
    thread maps\_utility::vision_set_fog_changes( "berlin_emerge", 0 );
    maps\_shg_common::move_player_to_start( "player_start_last_stand" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_last_stand" );
    level._id_739D = level.objective_count;
    objective_add( level._id_739D, "current", &"BERLIN_TRAVERSE_BUILDING_OBJ" );
    objective_onentity( level._id_739D, level._id_4E8F );
    level.objective_count++;
    var_0 = getent( "building_to_destroy", "script_noteworthy" );
    var_0 delete();
    common_scripts\utility::flag_set( "emerge_dialogue_done" );
    common_scripts\utility::flag_set( "emerge_door_begin_open" );
    thread maps\berlin_code::_id_72DD();
}

_id_73A0()
{
    maps\_audio::aud_send_msg( "start_reverse_breach" );
    thread maps\_utility::vision_set_fog_changes( "berlin_emerge_hotelhall", 0 );
    maps\_shg_common::move_player_to_start( "player_start_reverse_breach" );
    maps\berlin_code::spawn_berlin_friendlies( "player_start_reverse_breach" );
    level._id_7332 = level.objective_count;
    common_scripts\utility::flag_set( "exfil_hallway_dudes_dead" );
}

_id_73A1()
{
    var_0 = getent( "breach_spot_light", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    wait 2.25;
    var_1 = 0.16;
    var_2 = 0.001;

    while ( var_2 < 2.75 )
    {
        var_2 += var_1;
        var_0 setlightintensity( var_2 );
        wait 0.05;
    }

    var_0 setlightintensity( 2.75 );
}

_id_73A2()
{
    maps\_audio::aud_send_msg( "start_berlin_intro" );
    thread maps\_utility::_id_265A( "allies" );
    var_0 = common_scripts\utility::getstruct( "player_teleport", "targetname" );
    maps\_utility::_id_1FDF( var_0 );
    level.player disableweapons();
    maps\_shg_common::_id_166E( "intro_lonestar_teleport", "lone_star", 0 );
    maps\_shg_common::_id_166E( "intro_essex_teleport", "essex", 0 );
    maps\_shg_common::_id_166E( "intro_truck_teleport", "truck", 0 );
    var_1 = common_scripts\utility::getstruct( "lone_star_teleport", "targetname" );
    level._id_4E8F forceteleport( var_1.origin, var_1.angles );
    level._id_4E8F maps\_utility::_id_2713();
    var_2 = common_scripts\utility::getstruct( "essex_teleport", "targetname" );
    level._id_71A0 forceteleport( var_2.origin, var_2.angles );
    var_3 = common_scripts\utility::getstruct( "truck_teleport", "targetname" );
    level._id_45C4 forceteleport( var_3.origin, var_3.angles );
    level._id_71A0 maps\_shg_common::_id_16B3( "body_delta_woodland_assault_aa_dusty" );
    level._id_45C4 maps\_shg_common::_id_16B3( "body_hero_truck_delta_dusty" );
    level._id_4E8F maps\_shg_common::_id_16B3( "body_hero_sandman_delta_dusty" );
    common_scripts\utility::flag_set( "is_intro" );
    thread maps\_utility::_id_2797( 75 );
    thread maps\berlin_code::_id_72AD();
    thread maps\berlin_code::_id_72B2();
    thread maps\berlin_code::_id_72B4();
    maps\_utility::delaythread( 8, maps\berlin_code::_id_72BB, 1 );
    thread maps\berlin_code::_id_72C7();
    thread maps\berlin_code::_id_72D2( 1 );
    thread maps\berlin_code::_id_71A2();
    thread maps\berlin_code::_id_71A9();
    thread maps\berlin_code::_id_71A6();
    thread maps\berlin_code::_id_71A5();
    common_scripts\utility::flag_wait( "intro_dialogue_complete" );
    wait 5;
    thread maps\berlin_code::_id_71A3();
    wait 2;
    common_scripts\utility::flag_set( "start_intro_fade_2_white" );
    level.player allowfire( 0 );
    level.player allowmelee( 0 );
    level.player enableinvulnerability();
    level notify( "building_traverse_end" );
    common_scripts\utility::flag_wait( "intro_outro_full_white" );

    foreach ( var_5 in level.heroes )
    {
        level.heroes = common_scripts\utility::array_remove( level.heroes, var_5 );
        var_5 maps\_utility::_id_1902();
        var_5 delete();
    }

    common_scripts\utility::flag_wait( "intro_sequence_complete" );
    level.player disableinvulnerability();
    level.player allowmelee( 1 );
    level.player allowfire( 1 );
    level.player enableoffhandweapons();
    thread maps\_utility::_id_2797( 100 );
    maps\_utility::_id_1425( "berlin_intro_01" );
}

_id_73A3()
{
    maps\_audio::aud_send_msg( "start_heli_ride" );
    thread maps\berlin_code::_id_71AA();
    thread maps\berlin_code::_id_71AC();
    var_0 = maps\berlin_code::_id_71AE();
    var_1 = maps\berlin_code::_id_71AF();
    var_2 = maps\berlin_code::_id_71B0();
    thread maps\berlin_code::_id_71B1();
    thread maps\berlin_fx::_id_4EB0();
    setsaveddvar( "g_friendlyNameDist", 100 );
    setsaveddvar( "compass", "0" );
    level.player givestartammo( level._id_1C72 );
    level.player setweaponammoclip( level._id_1C72, weaponclipsize( level._id_1C72 ) );
    level.player givestartammo( level._id_1C73 );
    level.player setweaponammoclip( level._id_1C73, weaponclipsize( level._id_1C73 ) );
    level.player giveweapon( "fraggrenade" );
    level.player giveweapon( "ninebang_grenade" );
    level.player switchtoweapon( level._id_1C72 );
    maps\_shg_common::_id_1670();
    level.player disableweapons();
    var_1 maps\_utility::_id_270A( level.player, "TAG_GUY2", 0.05, 1, -90, 65, 20, 20 );
    var_1 thread maps\_utility::_id_0D04();
    setsaveddvar( "sm_sunsamplesizenear", 0.05 );
    level.player setplayerangles( ( 0.0, 88.0, 0.0 ) );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3 linkto( var_1, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    thread maps\berlin_code::_id_71B3();
    common_scripts\utility::flag_wait( "intro_start_on_path" );
    maps\_vehicle::_id_1FA6( var_0 );
    maps\_vehicle::_id_1FA6( var_1 );
    maps\_vehicle::_id_1FA6( var_2 );
    thread maps\berlin_code::_id_71B4( var_2 );
    level.player enableinvulnerability();
    common_scripts\utility::flag_set( "start_level_ambient" );
    thread maps\berlin_code::_id_71C0( var_0, var_2 );
    thread maps\berlin_code::_id_71C5( var_1 );
    var_4 = getaiarray( "axis" );

    foreach ( var_6 in var_4 )
        var_6.ignoreall = 1;

    maps\_utility::_id_1A5A( "axis", maps\berlin_code::_id_7347 );
    wait 21;
    level.player enableweapons();
    setsaveddvar( "g_friendlyNameDist", 15000 );
    var_1 waittill( "unloaded" );
    maps\_utility::delaythread( 0.75, maps\_utility::_id_26BF, "trig_path_truck_grinch_post_heli_land" );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );
    common_scripts\utility::flag_wait( "player_unloaded_from_intro_flight" );
    level.player disableinvulnerability();
    level.player enabledeathshield( 1 );
    maps\_audio::aud_send_msg( "mus_player_unloaded_from_intro_flight" );
    maps\_shg_common::_id_1671();
    setsaveddvar( "compass", "1" );
    level.player common_scripts\utility::delaycall( 3, ::enabledeathshield, 0 );
    maps\_utility::_id_26BB( "axis", maps\berlin_code::_id_7347 );
    var_4 = getaiarray( "axis" );

    foreach ( var_6 in var_4 )
        var_6.ignoreall = 0;

    maps\berlin_code::_id_71BF();
    var_10 = getentarray( "little_bird_friendlies", "script_noteworthy" );

    foreach ( var_6 in var_10 )
    {
        if ( !isspawner( var_6 ) )
            var_6 thread maps\_utility::_id_1902();
    }

    var_1 maps\_utility::_id_1902();
}

_id_73A4()
{
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_2724, 200 );
    maps\_utility::_id_265B( "allies" );
    thread maps\berlin_code::_id_71CB();
    thread maps\berlin_code::_id_71CC();
    thread maps\berlin_code::_id_71CF();
    thread maps\berlin_code::_id_71D8();
    thread maps\berlin_code::_id_71D7();
    thread maps\berlin_code::kill_player_triggers( "kill_player_sniper", "player_rappels" );
    var_0 = common_scripts\utility::getstruct( "aa_building_obj_loc_1", "targetname" );
    level.over_obj_num = level.objective_count;
    objective_add( level.over_obj_num, "current", &"BERLIN_OVERWATCH", var_0.origin );
    level.objective_count++;
    thread maps\berlin_code::_id_71E3();
    common_scripts\utility::flag_wait( "aa_building_obj_loc_2" );
    var_0 = common_scripts\utility::getstruct( "aa_building_obj_loc_2", "targetname" );
    objective_position( level.over_obj_num, var_0.origin );
    common_scripts\utility::flag_wait( "aa_building_obj_loc_3" );
    var_0 = common_scripts\utility::getstruct( "aa_building_obj_loc_3", "targetname" );
    objective_position( level.over_obj_num, var_0.origin );
}

_id_73A5()
{
    common_scripts\utility::flag_wait( "player_on_roof" );
    maps\_utility::_id_1425( "clear_roof_01" );
    maps\berlin_code::_id_7249();
    thread maps\berlin_code::_id_71E9();
}

_id_73A6()
{
    common_scripts\utility::array_thread( level.heroes, maps\_utility::_id_109E );
    common_scripts\utility::array_thread( level.heroes, maps\berlin_code::_id_5F09, 1 );
    common_scripts\utility::flag_wait( "snipe_player_in_position" );
    maps\_utility::_id_2727( level.over_obj_num );
    thread maps\berlin_code::_id_71FB();
    common_scripts\utility::flag_wait( "paint_targets_vo" );
    maps\_utility::_id_1425( "berlin_sniper_01" );
    common_scripts\utility::flag_wait( "parkway_tank_dead" );
    level._id_4E25 = 1;
    thread maps\berlin_a10::_id_4DE1();
    common_scripts\utility::flag_wait( "bravo_team_reached_lower_rooftop" );
    thread maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_wait( "sniper_complete" );
}

_id_73A7()
{
    var_0 = common_scripts\utility::getstruct( "obj_rappel_loc", "targetname" );
    level._id_7397 = level.objective_count;
    objective_add( level._id_7397, "current", &"BERLIN_RAPPEL_OBJ", var_0.origin );
    objective_setpointertextoverride( level._id_7397, &"BERLIN_RAPPEL" );
    level.objective_count++;
    thread maps\berlin_code::_id_724A();
    wait 1;
    maps\_utility::_id_1425( "sniper_complete_01" );
    common_scripts\utility::flag_wait( "player_rappels" );
    common_scripts\utility::flag_wait( "rappel_end" );
    common_scripts\utility::array_thread( level.heroes, maps\berlin_code::_id_5F09 );
}

_id_73A8()
{
    thread maps\berlin_code::_id_7263();
    thread maps\berlin_code::_id_7354();
    common_scripts\utility::flag_wait( "rappel_complete" );
    thread maps\berlin_code::_id_7333( "delete_pipes_volume" );
    maps\_utility::_id_2727( level._id_7397 );
    var_0 = common_scripts\utility::getstruct( "obj_advance_to_bridge", "targetname" );
    level._id_7286 = level.objective_count;
    var_1 = common_scripts\utility::getstruct( "bridge_battle_objective_location", "targetname" );
    objective_add( level._id_7286, "current", &"BERLIN_SUPPORT_SANDMAN", var_1.origin );
    level.objective_count++;
}

_id_73A9()
{
    thread maps\berlin_code::_id_7267();
    thread maps\berlin_code::_id_7292();
    thread maps\berlin_code::_id_7289();
    thread maps\berlin_code::_id_7282();
    common_scripts\utility::flag_wait( "player_at_bridge_battle" );
    level._id_4E25 = 0;
    common_scripts\utility::flag_set( "stop_chopper_blade" );
    maps\_utility::_id_265B( "allies" );
    maps\_utility::_id_2727( level._id_7286 );
    thread maps\berlin_code::_id_727D( level._id_7269 );
    common_scripts\utility::flag_wait( "rus_all_tanks_dead" );
    maps\_audio::aud_send_msg( "mus_bridge_battle_all_tanks_dead" );
    maps\_utility::_id_2727( level._id_727E );
    maps\_utility::_id_1425( "berlin_clear_bridge_01" );
    var_0 = common_scripts\utility::getstruct( "start_parkway_objective", "targetname" );
    level._id_739A = level.objective_count;
    objective_add( level._id_739A, "current", &"BERLIN_ADVANCE_OBJ", var_0.origin );
    level.objective_count++;
}

_id_73AA()
{
    thread maps\berlin_code::_id_7283();
    common_scripts\utility::flag_wait( "usa_tanks_start_parkway" );
    var_0 = getentarray( "end_of_parkway_allies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\_utility::_id_0D04 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\berlin_code::_id_7313, 0 );
    thread maps\berlin_code::_id_728D();
    thread maps\berlin_code::_id_7290();
    thread maps\berlin_code::_id_7346( "parkway_tracer_south", "parkway_tracer_north", "lone_star_wounded" );
    common_scripts\utility::flag_wait( "update_parkway_obj_loc_1" );
    var_1 = common_scripts\utility::getstruct( "obj_advance_to_collapse", "targetname" );
    objective_position( level._id_739A, var_1.origin );
}

_id_73AB()
{
    thread maps\berlin_code::_id_72AA();
    thread maps\berlin_code::_id_72A3();
    common_scripts\utility::flag_wait( "player_interacting_with_wounded_lonestar" );
    objective_position( level._id_739A, ( 0.0, 0.0, 0.0 ) );
    maps\_audio::aud_send_msg( "mus_start_building_collapse" );
    thread maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_set( "not_intro" );
    common_scripts\utility::flag_set( "parkway_retreat_start" );
    objective_position( level._id_739A, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "player_teleport_after_collapse_complete" );
    maps\_audio::aud_send_msg( "mus_player_teleport_after_building_collapse" );
    thread maps\_utility::_id_2797( 75 );
    thread maps\berlin_code::_id_72AD();
    thread maps\berlin_code::_id_72B2();
    thread maps\berlin_code::_id_72B4();
    maps\_utility::delaythread( 8, maps\berlin_code::_id_72BB, 0 );
    wait 8;
    maps\_utility::_id_2727( level._id_739A );
    level._id_739D = level.objective_count;
    var_0 = common_scripts\utility::getstruct( "off_street_obj", "targetname" );
    objective_add( level._id_739D, "current", &"BERLIN_TRAVERSE_BUILDING_OBJ", var_0.origin );
    level.objective_count++;
}

_id_73AC()
{
    thread maps\berlin_code::_id_72D1();
    thread maps\berlin_code::_id_72D2( 0 );
    thread maps\berlin_code::_id_72C7();
    common_scripts\utility::flag_wait( "building_collapse_player_safe" );
    objective_onentity( level._id_739D, level._id_4E8F );
    thread maps\berlin_code::_id_72BE( 0 );
    thread maps\berlin_code::_id_72D9();
    thread maps\berlin_code::_id_72DB();
}

_id_73AD()
{
    thread maps\berlin_code::_id_72DD();
    thread maps\berlin_code::_id_72DF();
    common_scripts\utility::flag_wait( "building_traverse_end" );
    common_scripts\utility::flag_wait( "emerge_door_open" );
    thread maps\_utility::_id_2797( 100, 2 );
    var_0 = common_scripts\utility::getstruct( "hotel_obj_marker", "targetname" );
    objective_position( level._id_739D, var_0.origin );
    thread maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait( "emerge_hotel_in_view" );
}

_id_73AE()
{
    common_scripts\utility::flag_wait( "start_last_stand" );
    maps\_utility::_id_1425( "berlin_last_stand_1" );
    thread maps\berlin_code::_id_7303();
    thread maps\berlin_code::_id_7312();
    maps\_utility::_id_2727( level._id_739D );
    level._id_7332 = level.objective_count;
    var_0 = common_scripts\utility::getstruct( "last_stand_obj_marker_1", "targetname" );
    objective_add( level._id_7332, "current", &"BERLIN_FALL_BACK_TO_ROOF" );
    objective_position( level._id_7332, var_0.origin );
    level.objective_count++;
    common_scripts\utility::flag_wait( "obj_last_stand_advance_1" );
    var_0 = common_scripts\utility::getstruct( "last_stand_obj_marker_2", "targetname" );
    objective_position( level._id_7332, var_0.origin );
    common_scripts\utility::flag_wait( "door_hotel_stairs_1_open" );
    var_0 = common_scripts\utility::getstruct( "last_stand_obj_marker_3", "targetname" );
    objective_position( level._id_7332, var_0.origin );
    common_scripts\utility::flag_wait( "player_top_of_hotel_stairwell" );
}

_id_73AF()
{
    thread maps\berlin_code::_id_731B();
    var_0 = common_scripts\utility::getstruct( "reverse_breach_objective_origin", "targetname" );
    objective_onentity( level._id_7332, level._id_4E8F );
    common_scripts\utility::flag_wait( "reverse_breach_ready" );
    objective_position( level._id_7332, var_0.origin );
    objective_setpointertextoverride( level._id_7332, &"BERLIN_BREACH" );
    common_scripts\utility::flag_wait( "reverse_breach_start" );
    var_1 = common_scripts\utility::getstruct( "exfil_objective_origin", "targetname" );
    objective_position( level._id_7332, var_1.origin );
    objective_setpointertextoverride( level._id_7332, "" );
    thread _id_73A1();
    thread maps\_utility::_id_265A( "allies" );
    thread maps\berlin_code::_id_7331();
    common_scripts\utility::flag_wait( "reverse_breach_complete" );
    objective_position( level._id_7332, ( 0.0, 0.0, 0.0 ) );
}

_id_73B0()
{
    level endon( "fx_zone_3000_deactivating" );
    var_0 = getent( "berlin_carfire_rappel", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    level waittill( "fx_zone_3000_activating" );
    var_0 setlightintensity( 3 );
    var_0 thread maps\_lights::_id_1640( ( 0.952941, 0.807843, 0.462745 ), ( 0.6, 0.32549, 0.05098 ), 0.005, 0.085 );
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = var_0.radius;
    var_4 = 10;
    var_5 = 10;
    var_6 = 10;
    var_7 = 2;
    var_8 = 0.15;
    var_9 = 0.35;

    for (;;)
    {
        var_10 = randomfloatrange( var_8, var_9 );
        var_11 = randomfloatrange( 0.1, 1 );
        var_12 = var_4 * randomfloatrange( 0.1, 1 );
        var_13 = var_5 * randomfloatrange( 0.1, 1 );
        var_14 = var_6 * randomfloatrange( 0.1, 1 );
        var_15 = var_7 * randomfloatrange( 0.1, 1 );
        var_16 = var_1 + ( var_12, var_13, var_14 );
        var_17 = var_3 - var_15;
        var_0 moveto( var_16, var_10 );
        var_0 setlightradius( var_17 );
        wait(var_10);
    }

    var_0 setlightintensity( 0 );
}

_id_73B1()
{
    wait(randomfloatrange( 0.05, 1 ));
    self endon( "death" );

    for (;;)
    {
        self setmodel( "berlin_traffic_signal_2x_01_green_on" );
        wait 0.75;
        self setmodel( "berlin_traffic_signal_2x_01_off" );
        wait 0.75;
    }
}

_id_73B2()
{
    wait(randomfloatrange( 0.05, 1 ));
    self endon( "death" );

    for (;;)
    {
        self setmodel( "berlin_traffic_signal_2x_01_red_on" );
        wait 0.75;
        self setmodel( "berlin_traffic_signal_2x_01_off" );
        wait 0.75;
    }
}

_id_73B3()
{
    wait(randomfloatrange( 0.05, 1 ));
    self endon( "death" );

    for (;;)
    {
        self setmodel( "berlin_traffic_signal_2x_01_yellow_on" );
        wait 0.5;
        self setmodel( "berlin_traffic_signal_2x_01_off" );
        wait 0.25;
    }
}

_id_73B4()
{
    wait(randomfloatrange( 0.05, 1 ));
    self endon( "death" );

    for (;;)
    {
        self setmodel( "berlin_traffic_signal_2x_01_yellow_on" );
        wait 0.75;
        self setmodel( "berlin_traffic_signal_2x_01_green_on" );
        wait 0.75;
    }
}
