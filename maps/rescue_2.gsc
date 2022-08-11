// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\createart\rescue_2_art::main();
    maps\rescue_2_fx::main();
    maps\rescue_2_anim::main();
    maps\rescue_2_precache::main();
    maps\_utility::define_loadout( "rescue_2" );
    maps\_utility::_id_2821( "rescue_2" );
    level.vision_uav = "mine_exterior";
    maps\_utility::_id_1E74( "elevator_down", ::_id_34D2, "elevator down", maps\rescue_2_code::_id_5D0D );
    maps\_utility::_id_1E74( "zip_line_cave", ::_id_34D4, "zip line cave", maps\rescue_2_code::_id_5D3E );
    maps\_utility::_id_1E74( "enter_bay", ::_id_34D5, "enter bay", maps\rescue_2_code::_id_5D53 );
    maps\_utility::_id_1E74( "exit_bay_doors_reveal", ::_id_34D8, "exit bay   reveal", maps\rescue_2_code::_id_5D68 );
    maps\_utility::_id_1E74( "yard_one", ::_id_34DC, "yard one", maps\rescue_2_code::_id_5D69 );
    maps\_utility::_id_1E74( "yard_two", ::_id_34DD, "yard two", maps\rescue_2_code::_id_5DB1 );
    maps\_utility::_id_1E74( "cavern_start", maps\rescue_2_cavern_script::_id_3E79, "Cavern start", maps\rescue_2_cavern_code::_id_5DE2 );
    maps\_utility::_id_1E74( "cavern_breach", maps\rescue_2_cavern_script::_id_3E7A, "Cavern breach", maps\rescue_2_cavern_code::_id_5DE4 );
    maps\_utility::_id_1E74( "cavern_top_fight", maps\rescue_2_cavern_script::_id_3E7B, "Cavern top fight", maps\rescue_2_cavern_code::_id_5DE5 );
    maps\_utility::_id_1E74( "cavern_top_rappel", maps\rescue_2_cavern_script::_id_3E7C, "Cavern rappel", maps\rescue_2_cavern_code::_id_5DE6 );
    maps\_utility::_id_1E74( "cavern_bottom_fight", maps\rescue_2_cavern_script::_id_3E7D, "Cavern", maps\rescue_2_cavern_code::_id_5DE7 );
    maps\_utility::_id_1E74( "cavern_bottom_breach", maps\rescue_2_cavern_script::_id_3E7E, "Cavern", maps\rescue_2_cavern_code::_id_5DE9 );
    maps\_utility::_id_1E74( "cavern_bottom_pres_defend", maps\rescue_2_cavern_script::_id_3E7F, "Cavern", maps\rescue_2_cavern_code::_id_5DEC );
    maps\_utility::_id_1E74( "cavern_bottom_pres_heli", maps\rescue_2_cavern_script::_id_3E80, "Cavern", maps\rescue_2_cavern_code::_id_5DED );
    maps\_utility::_id_1E74( "cavern_heli_fly_out", maps\rescue_2_cavern_script::_id_34CE, "Cavern", maps\rescue_2_cavern_code::_id_5DEE );
    maps\_utility::add_hint_string( "hint_predator_shoot", &"RESCUE_2_HINT_SHOOT_PREDATOR", maps\rescue_2_code::_id_4812 );
    maps\_utility::add_hint_string( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::_id_5236 );
    maps\_utility::add_hint_string( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", maps\_nightvision::_id_5237 );
    precachestring( &"SCRIPT_NIGHTVISION_USE" );
    precachestring( &"SCRIPT_NIGHTVISION_STOP_USE" );
    precachestring( &"RESCUE_2_HINT_SHOOT_PREDATOR" );
    precachemodel( "weapon_saw_rescue" );
    precachemodel( "coop_bridge_rappelrope" );
    precacheitem( "remote_missile_invasion" );
    precacheitem( "claymore" );
    precacheitem( "rpd" );
    precacheitem( "littlebird_FFAR" );
    precacheitem( "rpg" );
    precacheitem( "rpg_straight" );
    precacheitem( "remote_missile_snow" );
    precacheitem( "remote_missile_not_player_snow" );
    precacheitem( "remote_missile_not_player_snow_cluster" );
    precacheitem( "g36c_reflex" );
    precacheshader( "veh_hud_friendly" );
    precacheshellshock( "rescue_2_ele_crash" );
    level._id_3BD7 = "remote_missile_snow";
    level._id_3C36 = -800.0;
    level._id_3C37 = 0.0;
    maps\_load::main();
    thread maps\rescue_2_amb::main();
    maps\_remotemissile::init();
    maps\_predator2::main();
    maps\_stinger::init();
    maps\_nightvision::main( level.players );
    common_scripts\_pipes::main();
    maps\_drone_ai::init();
    maps\rescue_2_cavern_script::main();
    level._id_29F9 = "suburban_minigun";
    level._id_29FF = "vehicle_suburban_technical";
    var_0 = level._id_29F9 + level._id_29FF;
    level._id_29CE[var_0] = [];
    maps\_vehicle::_id_2ACA( maps\rescue_2_anim::_id_3E67, vehicle_scripts\_suburban_minigun::_id_3A9C );
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm", "TAG_CAB_FIRE", "fire_metal_medium", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_2A02( "explosions/small_vehicle_explosion", undefined, "car_explode" );
    level._id_29F9 = "suburban";
    level._id_29FF = "vehicle_suburban";
    var_0 = level._id_29F9 + level._id_29FF;
    level._id_29CE[var_0] = [];
    maps\_vehicle::_id_2ACA( maps\rescue_2_anim::_id_3E68, vehicle_scripts\_suburban::_id_3A9C );
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm", "TAG_CAB_FIRE", "fire_metal_medium", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_2A02( "explosions/small_vehicle_explosion", undefined, "car_explode" );
    _id_4D6D();
    maps\_utility::_id_265B( "axis" );
    maps\_utility::_id_265B( "allies" );
    var_1 = getdvar( "vision_set_current" );
    maps\_utility::set_vision_set( var_1, 0 );
    createthreatbiasgroup( "yard_one_top_guys" );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "allies_center" );
    createthreatbiasgroup( "delta" );
    level._id_3C39 = 1;
    level._id_5D9E = 0;
    level._id_5D06 = 0;
    maps\_utility::_id_27CA( "cave_ambush", maps\rescue_2_code::_id_5D28 );
    maps\_utility::_id_27CA( "cave_ambush_support", maps\rescue_2_code::_id_5D2A );
    maps\_utility::_id_27CA( "cave_rappel_ground", maps\rescue_2_code::_id_5D4A );
    maps\_utility::_id_27CA( "cave_rappel", maps\rescue_2_code::_id_5D47 );
    maps\_utility::_id_27CB( "cave_run_to_bay", maps\rescue_2_code::_id_5D4C );
    maps\_utility::_id_27CA( "bay_runner", maps\rescue_2_code::_id_5D4D );
    maps\_utility::_id_27CA( "bay_runner_garage", maps\rescue_2_code::_id_5D57 );
    maps\_utility::_id_27CA( "bay_garage_support", maps\rescue_2_code::_id_5D58 );
    maps\_utility::_id_27CB( "bay_top_outside_two", maps\rescue_2_code::_id_5D5F );
    maps\_utility::_id_27CA( "road_fighters", maps\rescue_2_code::_id_5D60 );
    maps\_utility::_id_27CA( "road_fighters", maps\rescue_2_code::_id_5D9F );
    maps\_utility::_id_27CA( "suburban_road_one_path_one", maps\rescue_2_code::_id_5D97 );
    maps\_utility::_id_27CA( "suburban_road_one_path_two", maps\rescue_2_code::_id_5D97 );
    maps\_utility::_id_27CA( "suburban_road_one_path_three", maps\rescue_2_code::_id_5D97 );
    maps\_utility::_id_27CA( "cave_rappel_rpg", maps\rescue_2_code::_id_5D4B );
    maps\_utility::_id_27CA( "yard_com_support", maps\rescue_2_code::_id_5DBD );
    maps\_utility::_id_27CB( "delta_yard_left", maps\rescue_2_code::_id_5DD4 );
    maps\_utility::_id_27CB( "delta_yard_right", maps\rescue_2_code::_id_5DD3 );
    maps\_utility::_id_27CA( "suburban_road_one_path_three", maps\rescue_2_code::_id_5D97 );
    maps\_utility::_id_27CA( "cave_lead_player_eye_top", maps\rescue_2_code::_id_5D40 );
    maps\_utility::_id_27CA( "elevator_passive_guys", maps\rescue_2_code::_id_5D15 );
    maps\_utility::_id_27CA( "yard_second_flood", maps\rescue_2_code::_id_5DA4 );
    maps\_utility::_id_27CB( "second_yard_runners", maps\rescue_2_code::_id_5DA5 );
    maps\_utility::_id_27CB( "heli_engage_suburb_guys", maps\rescue_2_code::_id_5DAD );
    maps\_utility::_id_27CA( "elevator_rocket_guys", maps\rescue_2_code::_id_5D17 );
    maps\_utility::_id_1A5A( "axis", maps\rescue_2_code::_id_45BD );
    level._id_5D8F = common_scripts\utility::getfx( "snow_light" );
    level._id_5D90 = 0.75;
    level._id_5D8E = ( 0.0, 0.0, 350.0 );
    thread maps\rescue_2_code::_id_479C();
    thread maps\rescue_2_code::_id_53BD();
    thread maps\rescue_2_code::_id_5DC6();
    thread maps\rescue_2_code::_id_5DCF();
    thread maps\rescue_2_code::_id_5D0C();
    maps\rescue_2_code::_id_5D86();
    setsaveddvar( "sm_sunShadowScale", 0.6 );
}

_id_7B5E()
{

}

_id_4D6D()
{
    common_scripts\utility::flag_init( "elevator_one_done_moving" );
    common_scripts\utility::flag_init( "elevator_one_attack_now" );
    common_scripts\utility::flag_init( "elevator_one_done_moving_new_beggining" );
    common_scripts\utility::flag_init( "elevator_one_ambush" );
    common_scripts\utility::flag_init( "start_ambush" );
    common_scripts\utility::flag_init( "ai_use_orange_cnodes" );
    common_scripts\utility::flag_init( "ai_use_red_cnodes" );
    common_scripts\utility::flag_init( "fire_at_elevator" );
    common_scripts\utility::flag_init( "start_bay_runners" );
    common_scripts\utility::flag_init( "start_bay_combat" );
    common_scripts\utility::flag_init( "get_ai_flow_clear" );
    common_scripts\utility::flag_init( "saw_door" );
    common_scripts\utility::flag_init( "saw_door_open" );
    common_scripts\utility::flag_init( "shut_large_bay_doors" );
    common_scripts\utility::flag_init( "cave_runner_close_door" );
    common_scripts\utility::flag_init( "start_bay_sequence" );
    common_scripts\utility::flag_init( "start_yard_one" );
    common_scripts\utility::flag_init( "yard_activate_orange_nodes" );
    common_scripts\utility::flag_init( "activate_second_yard_flood" );
    common_scripts\utility::flag_init( "player_has_predator_drones" );
    common_scripts\utility::flag_init( "open_bay_double_doors" );
    common_scripts\utility::flag_init( "now_spawn_rappel" );
    common_scripts\utility::flag_init( "now_spawn_rappel_two" );
    common_scripts\utility::flag_init( "activate_end_courtyard" );
    common_scripts\utility::flag_init( "courtyard_cleared" );
    common_scripts\utility::flag_init( "middle_yard_color_red" );
    common_scripts\utility::flag_init( "sparks_elevator_one" );
    common_scripts\utility::flag_init( "reset_angles" );
    common_scripts\utility::flag_init( "spawn_middle_yard" );
    common_scripts\utility::flag_init( "middle_yard_blockers" );
    common_scripts\utility::flag_init( "yard_start_heli_drop" );
    common_scripts\utility::flag_init( "hard_targets_dead" );
    common_scripts\utility::flag_init( "top_side_god_off" );
    common_scripts\utility::flag_init( "blow_up_the_door" );
    common_scripts\utility::flag_init( "kill_first_tunnel_guys" );
    common_scripts\utility::flag_init( "stop_ele_sparks" );
    common_scripts\utility::flag_init( "yard_retreat_one_new" );
    common_scripts\utility::flag_init( "yard_start_strafes" );
    common_scripts\utility::flag_init( "turn_off_nvg" );
    common_scripts\utility::flag_init( "spawn_in_last_subs" );
    common_scripts\utility::flag_init( "flow_flag_player_ahead_spawn_enemies" );
    common_scripts\utility::flag_init( "uav_in_use" );
}

_id_34D2()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5D09();
    maps\rescue_2_code::_id_5D0A();
    maps\rescue_2_code::_id_523F( "start_elevator_moving" );
    thread maps\rescue_2_code::_id_5D26();
}

_id_34D3()
{
    common_scripts\utility::flag_set( "elevator_one_done_moving" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_elevator" );
    thread maps\rescue_2_code::_id_5D26();
}

_id_34D4()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    common_scripts\utility::waitframe();
    maps\rescue_2_code::_id_5DC3( "start_zipline_cave_above" );
}

_id_34D5()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    level._id_017E = getent( "small_bay_door_safety_clip", "targetname" );
    level._id_017E delete();
    maps\rescue_2_code::_id_5DC3( "start_garage" );
    common_scripts\utility::flag_set( "start_bay_sequence" );
    level._id_5D46 = getent( "bay_small_door", "targetname" );
    level._id_02B9 = getent( "bay_small_door_breawk", "targetname" );
    level._id_02B9 linkto( level._id_5D46 );
    var_0 = getent( "burn_background", "targetname" );
    var_1 = getentarray( "burns", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_3 linkto( level._id_5D46 );
        var_3 hide();
    }

    var_0 linkto( level._id_5D46 );
    var_0 hide();
}

_id_34D6()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_inside_garage" );
}

_id_34D7()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_large_garage_doors" );
}

_id_34D8()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    common_scripts\utility::flag_set( "open_bay_double_doors" );
    maps\rescue_2_code::_id_5DC3( "start_reveal_one" );
}

_id_34D9()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_after_reveal_one" );
}

_id_34DA()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_outside_of_cave_truck" );
}

_id_34DB()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_outside_of_cave_tunnel" );
}

_id_34DC()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    common_scripts\utility::flag_set( "yard_activate_orange_nodes" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "open_bay_double_doors" );
    maps\rescue_2_code::_id_5DC3( "start_courtyard_one" );
    wait 2;
    level._id_45C0 maps\_utility::_id_109E();
    level._id_45C4 maps\_utility::_id_109E();
    level._id_4D86 maps\_utility::_id_109E();
    level._id_4877 maps\_utility::_id_109E();
}

_id_34DD()
{
    level._id_02BD = common_scripts\utility::get_target_ent( "new_cave_door_collision" );
    level._id_02BD disconnectpaths();
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "open_bay_double_doors" );
    common_scripts\utility::flag_set( "middle_yard_color_red" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_13A4( "r" );

    level._id_5D6A = getent( "yard_blow_power_tower", "targetname" );
    maps\rescue_2_code::_id_5DC3( "start_end_courtyard_one" );
    common_scripts\utility::flag_set( "activate_end_courtyard" );
    var_4 = getent( "last_hind_path", "targetname" );
    common_scripts\utility::waitframe();
    var_5 = getent( "hind_off_spawner", "targetname" );
    level._id_5DA8 = var_5 maps\rescue_2_code::_id_5DDC( var_4 );
    wait 3;
    level._id_5D6A common_scripts\utility::trigger_on();
    thread maps\rescue_2_code::_id_46AD();
    level._id_45C0 maps\_utility::_id_109E();
    level._id_4877 maps\_utility::_id_109E();
    level._id_45C4 maps\_utility::_id_109E();
    level._id_4D86 maps\_utility::_id_109E();
    level._id_45C4 maps\_utility::_id_13A4( "r" );
    level._id_4D86 maps\_utility::_id_13A4( "r" );
    var_6 = maps\_vehicle::_id_2A99( "hind_three_fake_box" );
    var_6 hide();
    var_6 thread maps\rescue_2_code::_id_5DBB();
    var_6 thread _id_0612::_id_3C49();
    level._id_5DA8 waittill( "reached_dynamic_path_end" );
    level._id_5DA8 thread _id_0612::_id_3C49();
    level._id_5DA8 thread maps\rescue_2_code::_id_5DDB();
    level._id_5DA8.target_ent = level.player;
    level._id_5DA8 thread maps\rescue_2_code::_id_5DDA();
    level._id_5DA8 thread maps\rescue_2_code::_id_5DDB();
    level._id_5DA8.target_ent = level.player;
}
