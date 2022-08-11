// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "intro" );
    precachedigitaldistortcodeassets();
    precacheitem( "g36c_reflex" );
    precacheitem( "m4_grunt_eotech" );
    precacheitem( "mg36_grip" );
    precacheitem( "smoke_grenade_intro" );
    precacheitem( "cobra_seeker" );
    precacheitem( "stinger_speedy" );
    precacheitem( "mi28_turret_intro" );
    precacheitem( "viper_tow_intro" );
    precacheitem( "stinger_speedy_intro" );
    precacheshader( "black" );
    precacheshader( "popmenu_bg" );
    precachemodel( "viewhands_player_yuri" );
    precachemodel( "viewlegs_generic" );
    precachemodel( "intro_props_gurney" );
    precachemodel( "vehicle_mi_28_destroyed" );
    precachemodel( "intro_forceps" );
    precachemodel( "intro_gauze" );
    precachemodel( "intro_props_wires_01" );
    precachemodel( "intro_props_wires_02" );
    precachemodel( "intro_props_wires_03" );
    precachemodel( "intro_ceiling_woodbeam_01" );
    precachemodel( "intro_ceiling_damage_med_01" );
    precachemodel( "intro_pillar_cover01" );
    precachemodel( "intro_props_front_gate" );
    precachemodel( "weapon_rappel_rope_long" );
    precachemodel( "vehicle_80s_hatch1_brn_destructible" );
    precachemodel( "vehicle_ugv_robot" );
    precachemodel( "intro_crate_sidewall01" );
    precachemodel( "intro_rollingdoor_01" );
    precachemodel( "intro_trapdoor_01" );
    precachemodel( "paris_crowbar_01" );
    precachemodel( "vehicle_mi-28_ugv_hitbox" );
    precachemodel( "vehicle_mi17_woodland_ugv_hitbox" );
    precachemodel( "foliage_intro_tree_01_destroyed" );
    precachestring( &"INTRO_INTROSCREEN_LINE1" );
    precachestring( &"INTRO_INTROSCREEN_LINE2" );
    precachestring( &"INTRO_INTROSCREEN_LINE3" );
    precacheshellshock( "default" );
    precacheshellshock( "intro_opening" );
    precacheshellshock( "intro_injured" );
    precacherumble( "artillery_rumble" );
    precacherumble( "damage_light" );
    precacherumble( "heavy_3s" );
    precacherumble( "light_1s" );
    precacherumble( "subtle_tank_rumble" );
    precacherumble( "steady_rumble" );
    precacherumble( "light_3s" );
    precacherumble( "damage_heavy" );
    level._id_13AC = 1;

    if ( getdvarint( "prologue_select" ) )
        maps\_utility::_id_1E74( "Intro", ::_id_5872, undefined, ::_id_5119 );

    maps\_utility::_id_1E74( "Intro transition", ::_id_718E, undefined, ::_id_718F );
    maps\_utility::_id_1E74( "Courtyard", ::_id_643A, undefined, ::_id_7190 );
    maps\_utility::_id_1E74( "Escort", ::_id_7191, undefined, ::_id_7192 );
    maps\_utility::_id_1E74( "Regroup", ::_id_7193, undefined, ::_id_7194 );
    maps\_utility::_id_1E74( "MAARS Shed", ::_id_7197, undefined, ::_id_7198 );
    maps\_utility::_id_1E74( "MAARS Control", ::_id_7199, undefined, ::_id_719B );
    maps\_utility::_id_1E74( "Slide", ::_id_719C, undefined, ::_id_404E );
    common_scripts\utility::flag_init( "intro_complete" );
    common_scripts\utility::flag_init( "intro_helicopter_landed_start_dialog" );
    common_scripts\utility::flag_init( "intro_room_soap_to_wounded_idle" );
    common_scripts\utility::flag_init( "intro_room_heli_crash_complete" );
    common_scripts\utility::flag_init( "intro_dialog_shot_1" );
    common_scripts\utility::flag_init( "intro_dialog_shot_2" );
    common_scripts\utility::flag_init( "intro_dialog_shot_3" );
    common_scripts\utility::flag_init( "intro_dialog_shot_4" );
    common_scripts\utility::flag_init( "intro_dialog_shot_5" );
    common_scripts\utility::flag_init( "intro_dialog_shot_6" );
    common_scripts\utility::flag_init( "intro_dialog_shot_7" );
    common_scripts\utility::flag_init( "intro_dialog_shot_8" );
    common_scripts\utility::flag_init( "start_intro_transition_complete" );
    common_scripts\utility::flag_init( "intro_stop_shake" );
    common_scripts\utility::flag_init( "intro_transition_dialog_end" );
    common_scripts\utility::flag_init( "intro_opening_movie_start" );
    common_scripts\utility::flag_init( "intro_dialog_shot_8_complete" );
    common_scripts\utility::flag_init( "courtyard_dialog_balcony_start" );
    common_scripts\utility::flag_init( "courtyard_drones_start" );
    common_scripts\utility::flag_init( "courtyard_player_on_balcony" );
    common_scripts\utility::flag_init( "courtyard_dialog_intro_start" );
    common_scripts\utility::flag_init( "courtyard_dialog_intro_end" );
    common_scripts\utility::flag_init( "courtyard_mi28_3_done_firing" );
    common_scripts\utility::flag_init( "courtyard_helicopter_enemies_delete" );
    common_scripts\utility::flag_init( "courtyard_start_scene" );
    common_scripts\utility::flag_init( "courtyard_start_breach" );
    common_scripts\utility::flag_init( "courtyard_doors_breach" );
    common_scripts\utility::flag_init( "courtyard_combat_done" );
    common_scripts\utility::flag_init( "courtyard_friendly_officer_in_pos" );
    common_scripts\utility::flag_init( "courtyard_attack_helicopter_second_pass" );
    common_scripts\utility::flag_init( "courtyard_price_back_inside" );
    common_scripts\utility::flag_init( "escort_smoke_out" );
    common_scripts\utility::flag_init( "escort_player_help_soap" );
    common_scripts\utility::flag_init( "escort_player_helping_soap" );
    common_scripts\utility::flag_init( "escort_help_soap_breachers_dead" );
    common_scripts\utility::flag_init( "escort_lobby_combat_complete" );
    common_scripts\utility::flag_init( "escort_hotel_door_open" );
    common_scripts\utility::flag_init( "escort_carry_soap_done" );
    common_scripts\utility::flag_init( "escort_start_nikolai_color" );
    common_scripts\utility::flag_init( "regroup_dialog_intro_start_all_clear" );
    common_scripts\utility::flag_init( "regroup_intro_start_sequence" );
    common_scripts\utility::flag_init( "regroup_helicopters_start" );
    common_scripts\utility::flag_init( "regroup_dialog_intro_complete" );
    common_scripts\utility::flag_init( "regroup_intro_enemies_initial_retreat" );
    common_scripts\utility::flag_init( "regroup_mi28_2_attacker_in_position" );
    common_scripts\utility::flag_init( "regroup_mi17_unloaded" );
    common_scripts\utility::flag_init( "regroup_car_door_cover_door_open" );
    common_scripts\utility::flag_init( "mg_event_over" );
    common_scripts\utility::flag_init( "regroup_ending_shoot_at_player" );
    common_scripts\utility::flag_init( "regroup_ending_follow_price" );
    common_scripts\utility::flag_init( "regroup_ending_ugv_dialog_start" );
    common_scripts\utility::flag_init( "regroup_ending_ugv_dialog_end" );
    common_scripts\utility::flag_init( "regroup_ending_first_door_breached" );
    common_scripts\utility::flag_init( "regroup_ending_shotgun_breach_complete" );
    common_scripts\utility::flag_init( "regroup_ending_breaching" );
    common_scripts\utility::flag_init( "regroup_drone_stop_loopers" );
    common_scripts\utility::flag_init( "regroup_intro_enemies_start" );
    common_scripts\utility::flag_init( "regroup_ending_shotgun_breach_dialog" );
    common_scripts\utility::flag_init( "regroup_roll_up_dialog" );
    common_scripts\utility::flag_init( "maars_control_loading_helicopter" );
    common_scripts\utility::flag_init( "maars_control_dialog_ugv_intro" );
    common_scripts\utility::flag_init( "maars_control_door_open" );
    common_scripts\utility::flag_init( "maars_control_player_controlling_maars" );
    common_scripts\utility::flag_init( "maars_control_price_at_chopper" );
    common_scripts\utility::flag_init( "maars_control_uav_start" );
    common_scripts\utility::flag_init( "maars_control_uav_complete" );
    common_scripts\utility::flag_init( "maars_control_soap_at_helicopter" );
    common_scripts\utility::flag_init( "maars_control_spawn1_retreat" );
    common_scripts\utility::flag_init( "maars_control_reinforcements" );
    common_scripts\utility::flag_init( "maars_control_hold_complete" );
    common_scripts\utility::flag_init( "maars_control_uav_start_dialog" );
    common_scripts\utility::flag_init( "maars_control_end_enemies_dead" );
    common_scripts\utility::flag_init( "maars_control_drone_inbound" );
    common_scripts\utility::flag_init( "maars_control_boot_up_fading" );
    common_scripts\utility::flag_init( "maars_shed_price_at_door" );
    common_scripts\utility::flag_init( "building_slide_building_hit" );
    common_scripts\utility::flag_init( "building_slide_complete" );
    common_scripts\utility::flag_init( "building_slide_player_anim_done" );
    common_scripts\utility::flag_init( "building_slide_player_under_second_time" );
    common_scripts\utility::flag_init( "building_slide_missile1" );
    common_scripts\utility::flag_init( "building_slide_missile2" );
    common_scripts\utility::flag_init( "building_slide_missile3" );
    common_scripts\utility::flag_init( "building_slide_missile4" );
    common_scripts\utility::flag_init( "building_slide_missile5" );
    common_scripts\utility::flag_init( "building_slide_missile6" );
    common_scripts\utility::flag_init( "building_slide_missile7" );
    common_scripts\utility::flag_init( "building_slide_missile8" );
    common_scripts\utility::flag_init( "building_slide_pickup" );
    maps\_utility::add_hint_string( "hint_heli_dmg", &"INTRO_HELI_DMG_HINT" );
    maps\_utility::add_hint_string( "control_slide", &"INTRO_PLATFORM_SLIDE_HINT" );
    maps\_utility::add_hint_string( "control_slide_l", &"INTRO_PLATFORM_SLIDE_HINT_L" );
    maps\createart\intro_art::main();
    maps\intro_aud::main();
    maps\intro_fx::main();
    maps\intro_precache::main();
    maps\intro_anim::main();
    maps\_load::main();
    maps\intro_vo::main();
    maps\_drone_ai::init();
    maps\_drone_civilian::init();
    maps\_drone_ai_rambo::init();
    maps\_compass::setupminimap( "compass_map_intro" );
    thread maps\intro_carry::_id_4068();
    thread maps\intro_maars::_id_6F5F();
    thread maps\intro_obj::_id_7159();
    maps\_utility::_id_1DE7();

    if ( level.console )
        level._id_6EBD = 1.6;
    else
        level._id_6EBD = 1.2;

    level._id_648B = "tag_weapon_left";
    var_0 = getentarray( "delete_enemies_in_volume", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\intro_code::_id_714A );
    level._id_2993 = [];
    var_1 = maps\_vehicle::_id_29FA( 0.2, 0.2, 1024, 0.05, 0.05 );
    precacherumble( "mig_rumble" );
    var_1._id_1441 = "mig_rumble";
    level._id_2994["script_vehicle_mi28_flying"] = var_1;
    level._id_2994["script_vehicle_mi17_woodland_fly_cheap_noai"] = var_1;
    level._id_1FF9 = 60;
    anim._id_20D6["drone"] = maps\_drone::_id_2039;
    common_scripts\utility::array_thread( getentarray( "dead_body_spawner_trigger", "targetname" ), maps\intro_code::_id_53A7 );
    maps\intro_utility::_id_6EAF();
    maps\intro_utility::_id_6B83();
}

_id_5872()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    setsaveddvar( "ui_hidemap", 1 );
    maps\_audio::aud_send_msg( "start_intro" );
    maps\intro_code::setup_friendly_spawner( "price", maps\intro_code::_id_5296 );
    maps\intro_code::setup_friendly_spawner( "soap", maps\intro_code::_id_684A );
    maps\intro_code::setup_friendly_spawner( "nikolai", maps\intro_code::_id_684C );
}

_id_5119()
{
    maps\_utility::_id_265A( "allies" );
    thread maps\intro_vo::_id_67F5();
    maps\intro_code::_id_7012();
    maps\_audio::aud_send_msg( "cinematic_sequence_prep" );
    maps\intro_code::_id_7147( "india_flashback_1_1" );
    maps\intro_code::_id_6FCC();
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics", 0 );
    thread maps\intro_code::_id_6FCE();
    maps\intro_code::_id_7149( "india_flashback_1_1" );
    maps\intro_code::_id_7147( "india_flashback_2_1" );
    maps\intro_code::_id_6FD3();
    thread maps\intro_code::_id_6FD4();
    maps\intro_code::_id_7149( "india_flashback_2_1" );
    maps\intro_code::_id_7147( "india_flashback_3_1" );
    maps\intro_code::_id_6FD7();
    thread maps\intro_code::_id_6FEA();
    thread maps\intro_code::_id_6FD8();
    maps\intro_code::_id_7149( "india_flashback_3_1" );
    maps\intro_code::_id_7147( "india_flashback_4_1" );
    maps\intro_code::_id_6FDB();
    thread maps\intro_code::_id_6FDC();
    maps\intro_code::_id_7149( "india_flashback_4_1" );
    maps\intro_code::_id_7147( "opening" );
    maps\intro_code::_id_6FDE();
    maps\_audio::aud_send_msg( "cinematic_sequence_cleanup" );
    common_scripts\utility::flag_wait( "intro_opening_movie_start" );
    maps\_audio::aud_send_msg( "intro_opening_movie_start" );
    maps\intro_code::_id_7149( "opening", 1, 1 );
    maps\_utility::_id_195A();
}

_id_718E()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    setsaveddvar( "ui_hidemap", 1 );
    thread _id_7195();
    thread maps\intro_code::_id_70BB();
    thread maps\intro_code::_id_70BC();
    maps\_audio::aud_send_msg( "start_intro_transition" );
    maps\intro_code::setup_friendly_spawner( "price", maps\intro_code::_id_5296 );
    maps\intro_code::setup_friendly_spawner( "soap", maps\intro_code::_id_684A );
    maps\intro_code::setup_friendly_spawner( "nikolai", maps\intro_code::_id_684C );
    thread maps\intro_code::_id_7012();
    thread maps\_shg_common::_id_1670();
    level.player disableweapons();
    level.player disableoffhandweapons();
    maps\intro_code::_id_700F();
    maps\intro_code::_id_6FED();
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics", 0 );
    level._id_51F2 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    level._id_51F2._id_1032 = "player_rig";
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 10, 10, 5, 0 );
    var_0 = maps\intro_code::_id_473C( 1 );
    var_0.alpha = 1;
    common_scripts\utility::flag_set( "start_intro_transition_complete" );
}

_id_718F()
{
    common_scripts\utility::flag_wait( "start_intro_transition_complete" );
    thread maps\intro_code::_id_7051();
    thread maps\intro_vo::_id_6E82();
    thread maps\_utility::vision_set_fog_changes( "Intro", 0 );
    thread maps\intro_code::_id_705E();
    maps\intro_code::_id_6FE3();
    thread maps\intro_code::_id_6FE8();
    common_scripts\utility::flag_set( "courtyard_drones_start" );
}

_id_643A()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    thread _id_7195();
    maps\_audio::aud_send_msg( "start_courtyard" );
    thread maps\intro_code::_id_70BB();
    thread maps\intro_code::_id_70BC();
    level.heroes = [];
    maps\intro_code::setup_friendly_spawner( "price", maps\intro_code::_id_5296 );
    maps\intro_code::setup_friendly_spawner( "soap", maps\intro_code::_id_684A );
    maps\intro_code::setup_friendly_spawner( "nikolai", maps\intro_code::_id_684C );
    maps\_shg_common::_id_166E( "player_start_escort", "price" );
    maps\_shg_common::_id_166E( "player_start_escort", "nikolai" );
    maps\intro_code::_id_700E();
    common_scripts\utility::flag_set( "intro_complete" );
    common_scripts\utility::flag_set( "courtyard_drones_start" );
    common_scripts\utility::flag_set( "courtyard_dialog_balcony_start" );
    thread maps\_utility::vision_set_fog_changes( "intro_courtyard", 0 );
    thread maps\intro_code::_id_705E();
    thread maps\intro_code::_id_6F3A( undefined );
    thread maps\intro_code::_id_7051();
}

_id_7190()
{
    setsaveddvar( "ui_hidemap", 0 );
    thread maps\intro_code::_id_7010();
    thread maps\intro_vo::_id_6E89();
    thread maps\intro_code::_id_7028();
    thread maps\intro_code::_id_7031();
    thread maps\intro_code::_id_7038();
    thread maps\intro_code::_id_7036();
    thread maps\intro_code::_id_702D();
    thread maps\intro_code::_id_702A();
    thread maps\intro_code::_id_7052();
    common_scripts\utility::flag_set( "courtyard_dialog_intro_start" );
    common_scripts\utility::flag_wait( "courtyard_dialog_intro_end" );
    thread maps\intro_vo::_id_6E8E();
    wait 1;
    common_scripts\utility::flag_set( "courtyard_start_scene" );
}

_id_7191()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    thread _id_7195();
    maps\_audio::aud_send_msg( "start_escourt" );
    thread maps\intro_code::_id_70BB();
    thread maps\intro_code::_id_70BC();
    maps\_shg_common::move_player_to_start( "player_start_escort" );
    level.heroes = [];
    maps\intro_code::setup_friendly_spawner( "price", maps\intro_code::_id_5296 );
    maps\intro_code::setup_friendly_spawner( "soap", maps\intro_code::_id_684A );
    maps\intro_code::setup_friendly_spawner( "nikolai", maps\intro_code::_id_684C );
    maps\_shg_common::_id_166E( "player_start_escort", "price" );
    maps\_shg_common::_id_166E( "player_start_escort", "nikolai" );
    maps\intro_code::_id_700E();
    common_scripts\utility::flag_set( "intro_complete" );
    common_scripts\utility::flag_set( "obj_take_position_on_balcony" );
    thread maps\intro_code::_id_4BB3( "courtyard_breach_door_left", "courtyard_breach_door_left_destroyed", "courtyard_left_breach_door_collision" );
    thread maps\intro_code::_id_4BB3( "courtyard_breach_door_right", "courtyard_breach_door_right_destroyed", "courtyard_right_breach_door_collision" );
    common_scripts\utility::flag_set( "courtyard_start_breach" );
    thread maps\intro_code::_id_7034();
    thread maps\intro_code::_id_705E();
    thread maps\intro_code::_id_6F3A( undefined );
    thread maps\intro_code::_id_702A();
    thread maps\_utility::vision_set_fog_changes( "intro_escort", 0 );
    common_scripts\utility::flag_set( "courtyard_combat_done" );
}

_id_7192()
{
    common_scripts\utility::flag_wait( "courtyard_combat_done" );
    level._id_4877 thread maps\intro_code::_id_7057();
    common_scripts\utility::flag_wait( "escort_smoke_out" );
    thread maps\intro_code::_id_7055();
    common_scripts\utility::flag_wait( "escort_doc_down_mi28_fire" );
    wait 1;
    thread maps\intro_code::_id_706F();
    thread maps\intro_code::_id_7056();
    thread maps\intro_vo::_id_6E91();
    thread maps\intro_code::_id_4E7A( "escort_nikolai_color", 1, 1 );
    thread maps\intro_code::_id_706B();
    thread maps\intro_code::_id_706D();
    thread maps\intro_code::_id_7064();
    thread maps\intro_code::_id_706E();
    thread maps\intro_code::_id_7067();
    thread maps\intro_code::_id_7068();
}

_id_7193()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.1 );
    setsaveddvar( "sm_sunshadowscale", 0.5 );
    thread maps\intro_code::_id_70BB();
    thread maps\intro_code::_id_70BC();
    thread maps\intro_code::_id_7070();
    maps\_audio::aud_send_msg( "start_regroup" );
    maps\_shg_common::move_player_to_start( "player_start_regroup" );
    maps\intro_code::_id_5FAE( "player_start_regroup" );
    common_scripts\utility::flag_set( "intro_complete" );
    thread maps\intro_code::_id_4BB3( "courtyard_breach_door_left", "courtyard_breach_door_left_destroyed", "courtyard_left_breach_door_collision" );
    thread maps\intro_code::_id_4BB3( "courtyard_breach_door_right", "courtyard_breach_door_right_destroyed", "courtyard_right_breach_door_collision" );
    common_scripts\utility::flag_set( "courtyard_start_breach" );
    thread maps\intro_code::_id_7144();
    common_scripts\utility::flag_set( "escort_carry_soap_done" );
    thread maps\_utility::vision_set_fog_changes( "intro_regroup", 0 );
}

_id_7194()
{
    thread maps\intro_vo::_id_6E99();
    thread maps\intro_code::_id_4E7A( "regroup_price_color", 2, 1, "price_stop_color_advance" );
    thread maps\intro_code::_id_4E7A( "regroup_nikolai_color", 5, 1 );
    thread maps\intro_code::_id_7143();
    thread maps\intro_code::_id_707F();
    thread maps\intro_code::_id_7084();
    thread maps\intro_code::_id_7075();
    thread maps\intro_code::_id_707B();
    thread maps\intro_code::_id_7085();
    thread maps\intro_code::_id_70AF();
    thread maps\intro_code::_id_7091();
    thread maps\intro_code::_id_7071();
    thread maps\intro_code::_id_7073();
    thread maps\intro_code::_id_70A6();
    thread maps\intro_code::_id_70A7();
    thread maps\intro_code::_id_70AD();
    thread maps\intro_code::_id_70AC();
    thread maps\intro_code::_id_70B1();
    thread maps\intro_code::_id_70B2();
    thread maps\intro_code::_id_70B8();
    thread maps\intro_code::_id_7092();
    thread _id_7196();
    setsaveddvar( "sm_spotlimit", 2 );
    common_scripts\utility::flag_wait( "regroup_dialog_intro_complete" );
}

_id_7195()
{
    var_0 = getent( "intro_light_tgl", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 setlightintensity( 0.01 );
}

_id_7196()
{
    var_0 = getent( "fire_flicker", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 setlightintensity( 6 );
    var_0 thread maps\_lights::_id_1640( ( 0.972549, 0.67451, 0.345098 ), ( 0.2, 0.166275, 0.0878432 ), 0.005, 0.15 );
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = var_0.radius;
    var_4 = 5;
    var_5 = 5;
    var_6 = 5;
    var_7 = 5;
    var_8 = 0.05;
    var_9 = 0.35;
}

_id_7197()
{
    setsaveddvar( "sm_spotlimit", 0 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    thread maps\intro_code::_id_70BC();
    thread maps\intro_code::_id_7070();
    maps\_audio::aud_send_msg( "start_maars_shed" );
    maps\_shg_common::move_player_to_start( "player_start_maars_shed" );
    maps\intro_code::_id_5FAE( "player_start_maars_shed" );
    common_scripts\utility::flag_set( "intro_complete" );
    thread maps\intro_code::_id_7144();
    thread maps\_utility::vision_set_fog_changes( "intro_shack_yard", 0 );
    common_scripts\utility::flag_set( "regroup_player_moving_down_alleyway" );
    thread maps\intro_code::_id_7092();
    thread maps\intro_vo::_id_6E9D();
    thread maps\intro_code::_id_7077();
    maps\_utility::_id_27CB( "regroup_drone_anim_then_delete", maps\intro_code::_id_7152 );
}

_id_7198()
{
    common_scripts\utility::flag_set( "obj_control_ugv" );
    setsaveddvar( "sm_spotlightscoremodelscale", "1" );
    thread maps\intro_code::_id_70BD();
    thread maps\intro_vo::_id_6E9F();
    common_scripts\utility::flag_wait( "player_to_maars_control" );
}

_id_7199()
{
    setsaveddvar( "sm_spotlimit", 2 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    setsaveddvar( "sm_spotlightscoremodelscale", "1" );
    thread maps\intro_code::_id_70BC();
    maps\_audio::aud_send_msg( "start_maars_control" );
    maps\_shg_common::move_player_to_start( "player_start_maars_control" );
    maps\intro_code::_id_5FAE( "player_start_maars_control" );
    common_scripts\utility::flag_set( "intro_complete" );
    thread maps\intro_code::_id_7144();
    thread maps\_utility::vision_set_fog_changes( "intro_shack", 0 );
    common_scripts\utility::flag_set( "player_to_maars_control" );
    _id_719A();
}

_id_719A()
{
    maps\intro_code::_id_7147( "ugv_startup" );
    var_0 = common_scripts\utility::getstruct( "maars_control_maars_intro", "targetname" );
    maps\intro_code::_id_70C4();
    var_1 = maps\_utility::_id_1287( "rolling_door", ( 0.0, 0.0, 0.0 ) );
    var_0 maps\_anim::_id_11CF( var_1, "intro_weapon_cache_end" );
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    common_scripts\utility::flag_wait( "maars_control_boot_up_fading" );
    maps\_utility::delaythread( 4, maps\intro_code::_id_70CB );
    var_2 = [ level._id_4877, var_1 ];
    var_0 maps\_anim::_id_11DD( var_2, "intro_weapon_cache_end" );
    var_0 thread maps\_anim::_id_124E( level._id_4877, "intro_weapon_cache_end_idle", "end_idle" );
    common_scripts\utility::flag_wait( "maars_control_player_out_of_weapons_cache" );
    var_0 notify( "end_idle" );
    var_3 = getent( "maars_control_price_color", "targetname" );
    var_3 notify( "trigger" );
}

_id_719B()
{
    thread maps\intro_code::_id_70F5();
    thread maps\intro_vo::_id_6EA1();
    thread maps\intro_code::_id_70C5();
    thread maps\intro_code::_id_70C6();
    thread maps\intro_code::_id_70CD();
    thread maps\intro_code::_id_70E1();
    thread maps\intro_code::_id_70EC();
    thread maps\intro_code::_id_70F0();
    thread maps\intro_code::_id_70F3();
    thread maps\intro_code::_id_70C9();
    thread maps\intro_code::_id_711D();
    thread maps\intro_code::_id_70F6();
    common_scripts\utility::flag_wait( "obj_clear_helicopter_area_complete" );
}

_id_719C()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.2 );
    setsaveddvar( "sm_sunshadowscale", 0.4 );
    setsaveddvar( "sm_spotlightscoremodelscale", "0" );
    maps\_audio::aud_send_msg( "start_slide" );
    maps\_shg_common::move_player_to_start( "player_start_slide" );
    maps\intro_code::_id_5FAE( "player_start_slide" );
    common_scripts\utility::flag_set( "intro_complete" );
    thread maps\intro_code::_id_7144();
    thread maps\intro_code::_id_70CB();
    thread maps\intro_code::_id_711D();
    thread maps\_utility::vision_set_fog_changes( "intro_shack_yard", 0 );
    thread maps\_spawner::_id_213C( 201 );
    thread maps\_spawner::_id_213C( 202 );
    thread maps\_spawner::_id_213C( 203 );
    thread maps\_spawner::_id_213C( 204 );
    thread maps\_spawner::_id_213C( 205 );
    common_scripts\utility::flag_set( "obj_clear_helicopter_area_complete" );
}

_id_404E()
{
    thread maps\intro_code::_id_70F6( 1 );
    thread maps\intro_vo::_id_6EA9();
    thread maps\intro_code::_id_70F7();
    thread maps\intro_code::_id_70F8();
    thread maps\intro_code::_id_70FA();
    common_scripts\utility::flag_wait( "building_event_start" );
    maps\_audio::aud_send_msg( "building_event_start" );
    level.player enableinvulnerability();
    thread maps\_utility::vision_set_fog_changes( "intro_slide", 4.5 );
    thread maps\intro_code::_id_7106();
    common_scripts\utility::flag_wait( "building_slide_complete" );
    maps\_utility::_id_195A();
}
