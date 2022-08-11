// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = getdvar( "ui_play_credits" );

    if ( isdefined( var_0 ) && var_0 != "" )
    {
        setsaveddvar( "ui_hidemap", 1 );
        level._id_1D95 = 1;
    }

    maps\_utility::template_level( "dubai" );
    precacheshader( "black" );
    _id_4D6D();
    level.secondaryweapon = "m4m203_acog";
    _id_766A();
    _id_766B();
    maps\createart\dubai_art::main();
    maps\dubai_fx::main();
    maps\dubai_aud::main();
    maps\dubai_anim::_id_73B5();
    maps\dubai_precache::main();
    maps\_load::main();
    maps\_drone_civilian::init();
    maps\_drone_ai::init();

    if ( isdefined( var_0 ) && var_0 != "" )
        maps\dubai_finale::_id_74C0();

    maps\dubai_vo::_id_50E2();
    thread maps\dubai_vo::_id_6E3C();
    level thread _id_766C();
    thread maps\dubai_code::_id_7568();
    thread maps\dubai_code::_id_7626();
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "objective_kill_makarov" );
    common_scripts\utility::flag_init( "objective_complete_kill_makarov" );
    common_scripts\utility::flag_init( "update_obj_pos_exterior_on_yuri" );
    common_scripts\utility::flag_init( "update_obj_pos_in_elevator" );
    common_scripts\utility::flag_init( "update_obj_pos_elevator_jump" );
    common_scripts\utility::flag_init( "update_obj_pos_elevator_jump_complete" );
    common_scripts\utility::flag_init( "update_obj_pos_top_floor_atrium_landing" );
    common_scripts\utility::flag_init( "update_obj_pos_restaurant_makarov_spotted" );
    common_scripts\utility::flag_init( "update_obj_pos_restaurant_makarov_escaped" );
    common_scripts\utility::flag_init( "update_obj_pos_restaurant_destruction" );
    common_scripts\utility::flag_init( "update_obj_pos_finale_chopper" );
    common_scripts\utility::flag_init( "update_obj_pos_finale_no_marker" );
    common_scripts\utility::flag_init( "intro_truck_left" );
    common_scripts\utility::flag_init( "intro_complete" );
    common_scripts\utility::flag_init( "exterior_initial_enemies" );
    common_scripts\utility::flag_init( "exterior_civilians_initial" );
    common_scripts\utility::flag_init( "exterior_juggernaut_paired_start" );
    common_scripts\utility::flag_init( "exterior_juggernaut_paired_complete" );
    common_scripts\utility::flag_init( "exterior_suv_scene" );
    common_scripts\utility::flag_init( "exterior_rpg_enemies_in_position" );
    common_scripts\utility::flag_init( "remove_exterior_rpg_enemies" );
    common_scripts\utility::flag_init( "player_dynamic_move_speed" );
    common_scripts\utility::flag_init( "remove_player_juggernaut" );
    common_scripts\utility::flag_init( "remove_yuri_juggernaut" );
    common_scripts\utility::flag_init( "yuri_no_juggernaut_spawned" );
    common_scripts\utility::flag_init( "lobby_combat_top_riotshield_enemies" );
    common_scripts\utility::flag_init( "lobby_yuri_to_elevator" );
    common_scripts\utility::flag_init( "yuri_in_elevator" );
    common_scripts\utility::flag_init( "elevator_button_pressed" );
    common_scripts\utility::flag_init( "elevator_doors_closed" );
    common_scripts\utility::flag_init( "elevator_chopper_preattack" );
    common_scripts\utility::flag_init( "elevator_attack_chopper_kill" );
    common_scripts\utility::flag_init( "elevator_chopper_min_time_passed" );
    common_scripts\utility::flag_init( "elevator_chopper_near_crash" );
    common_scripts\utility::flag_init( "elevator_chopper_killed" );
    common_scripts\utility::flag_init( "elevator_chopper_crash_done" );
    common_scripts\utility::flag_init( "elevator_remove_gear_2" );
    common_scripts\utility::flag_init( "elevator_remove_gear_3" );
    common_scripts\utility::flag_init( "elevator_initial_short_drop" );
    common_scripts\utility::flag_init( "elevator_initial_big_drop" );
    common_scripts\utility::flag_init( "elevator_initial_big_drop_done" );
    common_scripts\utility::flag_init( "elevator_yuri_jump" );
    common_scripts\utility::flag_init( "replacement_elevator_in_position" );
    common_scripts\utility::flag_init( "player_jumped_to_replacement_elevator" );
    common_scripts\utility::flag_init( "player_finished_jump_to_replacement_elevator" );
    common_scripts\utility::flag_init( "elevator_player_missed_jump" );
    common_scripts\utility::flag_init( "drop_player_elevator" );
    common_scripts\utility::flag_init( "elevator_replacement_moving_to_top" );
    common_scripts\utility::flag_init( "player_at_top_floor" );
    common_scripts\utility::flag_init( "top_floor_countdown_start" );
    common_scripts\utility::flag_init( "top_floor_yuri_grenade_start" );
    common_scripts\utility::flag_init( "top_floor_yuri_grenade_thrown" );
    common_scripts\utility::flag_init( "top_floor_lounge_combat_3" );
    common_scripts\utility::flag_init( "top_floor_lounge_clear" );
    common_scripts\utility::flag_init( "chopper_restaurant_intro" );
    common_scripts\utility::flag_init( "restaurant_chopper_initial_loop" );
    common_scripts\utility::flag_init( "restaurant_chopper_move_up" );
    common_scripts\utility::flag_init( "chopper_restaurant_outro" );
    common_scripts\utility::flag_init( "restaurant_makarov_spotted" );
    common_scripts\utility::flag_init( "restaurant_destruction" );
    common_scripts\utility::flag_init( "restaurant_destruction_floor_done" );
    common_scripts\utility::flag_init( "restaurant_destruction_player_over_ledge" );
    common_scripts\utility::flag_init( "restaurant_destruction_rolling_soldier" );
    common_scripts\utility::flag_init( "restaurant_drop_section_falling" );
    common_scripts\utility::flag_init( "restaurant_destroyed" );
    common_scripts\utility::flag_init( "restaurant_tilt" );
    common_scripts\utility::flag_init( "restaurant_rubble_fall_on_yuri" );
    common_scripts\utility::flag_init( "yuri_restaurant_dialogue_done" );
    common_scripts\utility::flag_init( "restaurant_sequence_complete" );
    common_scripts\utility::flag_init( "top_floor_corpses" );
    common_scripts\utility::flag_init( "finale_player_jump_start" );
    common_scripts\utility::flag_init( "finale_player_jump_successful" );
    common_scripts\utility::flag_init( "finale_too_late_to_jump" );
    common_scripts\utility::flag_init( "finale_chopper_takeoff_finished" );
    common_scripts\utility::flag_init( "finale_player_jump_finished" );
    common_scripts\utility::flag_init( "finale_chopper_crash_complete" );
    common_scripts\utility::flag_init( "finale_crawl_lookup" );
    common_scripts\utility::flag_init( "finale_fall" );
    common_scripts\utility::flag_init( "finale_fall_complete" );
    common_scripts\utility::flag_init( "finale_lobby" );
    common_scripts\utility::flag_init( "player_started_draw" );
    common_scripts\utility::flag_init( "start_finale_showdown" );
    common_scripts\utility::flag_init( "end_finale_showdown" );
    common_scripts\utility::flag_init( "beatdown_failure" );
    common_scripts\utility::flag_init( "beatdown_start_success" );
    common_scripts\utility::flag_init( "beatdown_tackle_start" );
    common_scripts\utility::flag_init( "end_of_credits" );
    common_scripts\utility::flag_init( "fadeout_at_end_done" );
    common_scripts\utility::flag_init( "player_falling_kill_in_progress" );
    common_scripts\utility::flag_init( "level_end" );
    common_scripts\utility::flag_init( "model_spot_lighting_enabled" );
    common_scripts\utility::flag_init( "model_spot_lighting_disabled" );
    setdvar( "makarov_escaping_time_left", "4" );
    common_scripts\utility::flag_init( "vo_intro_on_black" );
    common_scripts\utility::flag_init( "vo_intro_start" );
    common_scripts\utility::flag_init( "vo_intro_get_ready" );
    common_scripts\utility::flag_init( "vo_streets_start" );
    common_scripts\utility::flag_init( "vo_lobby_start" );
    common_scripts\utility::flag_init( "vo_lobby_near_elevator" );
    common_scripts\utility::flag_init( "vo_elevator_start" );
    common_scripts\utility::flag_init( "vo_elevator_player_falling" );
    common_scripts\utility::flag_init( "vo_elevator_near_top" );
    common_scripts\utility::flag_init( "vo_top_floor_start" );
    common_scripts\utility::flag_init( "vo_restaurant_start" );
    common_scripts\utility::flag_init( "vo_restaurant_destruction_yuri" );
    common_scripts\utility::flag_init( "vo_stairwell_start" );
    common_scripts\utility::flag_init( "vo_finale_roof_start" );
    common_scripts\utility::flag_init( "vo_finale_lobby_start" );
    common_scripts\utility::flag_init( "vo_finale_lobby_final" );
    common_scripts\utility::flag_init( "pip_atrium_start" );
    common_scripts\utility::flag_init( "pip_atrium_end" );
    common_scripts\utility::flag_init( "pip_lounge_start" );
    common_scripts\utility::flag_init( "pip_lounge_end" );
    common_scripts\utility::flag_init( "pip_restaurant_start" );
    common_scripts\utility::flag_init( "pip_restaurant_end" );
    common_scripts\utility::flag_init( "pip_elevator_chopper_start" );
    common_scripts\utility::flag_init( "pip_elevator_chopper_end" );
}

_id_766A()
{
    maps\_utility::_id_1E74( "intro", ::_id_5872 );
    maps\_utility::_id_1E74( "exterior", ::_id_766E );
    maps\_utility::_id_1E74( "exterior_circle", ::_id_766F );
    maps\_utility::_id_1E74( "lobby", ::_id_7670 );
    maps\_utility::_id_1E74( "elevator", ::_id_7671 );
    maps\_utility::_id_1E74( "top_floor", ::_id_7674 );
    maps\_utility::_id_1E74( "restaurant_entrance", ::_id_7675 );
    maps\_utility::_id_1E74( "restaurant_destruction", ::_id_7676 );
    maps\_utility::_id_1E74( "restaurant_exit", ::_id_7677 );
    maps\_utility::_id_1E74( "finale_chopper_sequence", ::_id_7678 );
    maps\_utility::_id_1E74( "finale_crash_site", ::_id_7679 );
    maps\_utility::_id_1E74( "finale_beatdown", ::_id_767A );
    maps\_utility::_id_1E74( "finale_ending", ::_id_767B );
}

_id_766B()
{
    precacheshellshock( "slowview" );
    precacherumble( "damage_light" );
    precacherumble( "damage_heavy" );
    precacherumble( "subtle_tank_rumble" );
    precacherumble( "steady_rumble" );
    precacherumble( "falling_land" );
    precacherumble( "viewmodel_small" );
    precacherumble( "viewmodel_medium" );
    precacherumble( "viewmodel_large" );
    precacheshader( "juggernaut_overlay_half" );
    precacheshader( "juggernaut_damaged_overlay" );
    precachemodel( "viewhands_pmc" );
    precacheitem( "mk46" );
    precacheitem( "usp" );
    precachemodel( "viewmodel_pecheneg_sp_iw5" );
    precachemodel( "dub_juggernaut_helmet" );
    precachemodel( "body_juggernaut_nohelmet" );
    precachemodel( "body_juggernaut_quartergear" );
    precachemodel( "body_juggernaut_nogear" );
    precachemodel( "dub_bldg_elevator_des" );
    precachemodel( "dub_juggernaut_chestarmor" );
    precachemodel( "dub_juggernaut_helmet" );
    precacheturret( "heli_spotlight" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precacheitem( "littlebird_FFAR" );
    precacheitem( "zippy_rockets" );
    precacherumble( "tank_rumble" );
    precacheshader( "overlay_static" );
    precacheshader( "cinematic" );
    precachemodel( "dub_restaurant_column_shatter_02" );
    precachemodel( "dub_restaurant_roundtable_set_sim" );
    precachemodel( "dub_restaurant_squaretable_set_sim" );
    precachemodel( "fx_char_light_rig" );
    precacheitem( "freerunner" );
    precacheitem( "nosound_magicbullet" );
    precacheshellshock( "dubai_ending_wakeup" );
    precacheshellshock( "dubai_ending_wounded" );
    precacheshellshock( "dubai_ending_no_control" );
    precacheshellshock( "dubai_ending_pulling_knife_later" );
    precacheshellshock( "dubai_injured_passout" );
    precacheshellshock( "dubai_ending_crash_site" );
    precachemodel( "head_price_africa" );
    precachemodel( "dub_finale_skylight_shards" );
    precachemodel( "head_tank_a_pilot" );
    precachemodel( "head_henchmen_c" );
    precachemodel( "dub_roof_top_sky_light_broken" );
    precachemodel( "viewmodel_desert_eagle_sp_dubai_finale" );
    precachemodel( "body_fso_suit_a" );
    precachemodel( "head_fso_d" );
    precachemenu( "nopause" );
    precachemenu( "allowpause" );
    precacheshader( "victory_iw5" );
    precacheshader( "victory_menu" );
    precachestring( &"MENU_SP_CONTINUE_TO_SPECIAL_OPS" );
    precachemodel( "axis" );
}

_id_766C()
{
    waittillframeend;
    _id_766D();
    thread maps\dubai_utils::_id_744E( 1 );
    common_scripts\utility::flag_wait( "objective_kill_makarov" );
    objective_add( 1, "current", &"DUBAI_OBJ_KILL_MAKAROV" );
    common_scripts\utility::flag_wait( "update_obj_pos_exterior_on_yuri" );

    if ( isdefined( level._id_73D7 ) )
        objective_onentity( 1, level._id_73D7 );

    common_scripts\utility::flag_wait( "update_obj_pos_lobby_upper_floor" );
    var_0 = getent( "obj_pos_lobby_upper_floor", "targetname" );
    objective_position( 1, var_0.origin );
    common_scripts\utility::flag_wait( "update_obj_pos_lobby_elevator" );
    var_0 = getent( "obj_pos_lobby_elevator", "targetname" );
    objective_position( 1, var_0.origin );
    common_scripts\utility::flag_wait( "update_obj_pos_in_elevator" );
    objective_position( 1, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "update_obj_pos_elevator_jump" );

    if ( isdefined( level._id_73D7 ) )
    {
        objective_position( 1, ( -640, -64, level._id_73D7.origin[2] ) );
        objective_setpointertextoverride( 1, &"DUBAI_JUMP" );
    }

    common_scripts\utility::flag_wait( "update_obj_pos_elevator_jump_complete" );
    objective_position( 1, ( 0.0, 0.0, 0.0 ) );
    objective_setpointertextoverride( 1, "" );
    common_scripts\utility::flag_wait( "update_obj_pos_top_floor_atrium_landing" );
    var_0 = getent( "obj_pos_top_floor_atrium_landing", "targetname" );
    objective_position( 1, var_0.origin );
    thread maps\dubai_utils::_id_744E( 2 );
    common_scripts\utility::flag_wait( "update_obj_pos_top_floor_lounge" );
    var_0 = getent( "obj_pos_top_floor_lounge", "targetname" );
    objective_position( 1, var_0.origin );
    common_scripts\utility::flag_wait( "update_obj_pos_restaurant_entrance" );
    var_0 = getent( "obj_pos_restaurant_entrance", "targetname" );
    objective_position( 1, var_0.origin );
    common_scripts\utility::flag_wait( "update_obj_pos_restaurant_makarov_spotted" );

    if ( isdefined( level._id_59A6 ) )
    {
        objective_onentity( 1, level._id_59A6, ( 0.0, 0.0, 64.0 ) );
        objective_setpointertextoverride( 1, &"DUBAI_KILL" );
    }

    common_scripts\utility::flag_wait( "update_obj_pos_restaurant_makarov_escaped" );
    objective_position( 1, ( 0.0, 0.0, 0.0 ) );
    objective_setpointertextoverride( 1, "" );
    common_scripts\utility::flag_wait( "update_obj_pos_restaurant_destruction" );
    objective_position( 1, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "update_obj_pos_restaurant_exit" );
    var_0 = getent( "obj_pos_restaurant_exit", "targetname" );
    objective_position( 1, var_0.origin );
    thread maps\dubai_utils::_id_744E( 3 );
    common_scripts\utility::flag_wait( "update_obj_pos_stairwell" );
    var_0 = getent( "obj_pos_stairwell", "targetname" );
    objective_position( 1, var_0.origin );
    common_scripts\utility::flag_wait( "update_obj_pos_roof" );
    var_0 = getent( "obj_pos_roof", "targetname" );
    objective_position( 1, var_0.origin );
    common_scripts\utility::flag_wait( "update_obj_pos_finale_chopper" );
    var_1 = undefined;

    if ( isdefined( level._id_7416 ) )
    {
        var_1 = common_scripts\utility::spawn_tag_origin();
        var_1.origin = level._id_7416 gettagorigin( "tag_guy1" );
        var_1 linkto( level._id_7416, "tag_guy1" );
        objective_onentity( 1, var_1 );
        objective_setpointertextoverride( 1, &"DUBAI_JUMP" );
    }

    common_scripts\utility::flag_wait( "update_obj_pos_finale_no_marker" );
    objective_position( 1, ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( var_1 ) )
        var_1 delete();

    common_scripts\utility::flag_wait( "objective_complete_kill_makarov" );
    maps\_utility::_id_2727( 1 );
}

_id_766D()
{
    if ( maps\_utility::_id_1451() )
        return;

    var_0 = level._id_1F19;
    common_scripts\utility::flag_set( "objective_kill_makarov" );
    common_scripts\utility::flag_set( "update_obj_pos_exterior_on_yuri" );

    if ( var_0 == "exterior" )
        return;

    if ( var_0 == "exterior_circle" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_lobby_upper_floor" );

    if ( var_0 == "lobby" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_lobby_elevator" );

    if ( var_0 == "elevator" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_in_elevator" );
    common_scripts\utility::flag_set( "update_obj_pos_elevator_jump" );
    common_scripts\utility::flag_set( "update_obj_pos_elevator_jump_complete" );
    common_scripts\utility::flag_set( "update_obj_pos_top_floor_atrium_landing" );
    level.player setviewmodel( "viewhands_pmc" );

    if ( var_0 == "top_floor" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_top_floor_lounge" );
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_entrance" );
    common_scripts\utility::flag_clear( "model_spot_lighting_disabled" );
    common_scripts\utility::flag_set( "model_spot_lighting_enabled" );

    if ( var_0 == "restaurant_entrance" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_restaurant_makarov_spotted" );
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_makarov_escaped" );

    if ( var_0 == "restaurant_destruction" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_restaurant_destruction" );
    common_scripts\utility::flag_set( "update_obj_pos_restaurant_exit" );

    if ( var_0 == "restaurant_exit" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_stairwell" );
    common_scripts\utility::flag_set( "update_obj_pos_roof" );
    common_scripts\utility::flag_clear( "model_spot_lighting_enabled" );
    common_scripts\utility::flag_set( "model_spot_lighting_disabled" );

    if ( var_0 == "finale_chopper_sequence" )
        return;

    common_scripts\utility::flag_set( "update_obj_pos_finale_chopper" );
    common_scripts\utility::flag_set( "update_obj_pos_finale_no_marker" );

    if ( var_0 == "finale_crash_site" )
        return;

    if ( var_0 == "finale_beatdown" )
        return;

    if ( var_0 == "finale_ending" )
        return;
}

_id_5872()
{
    var_0 = getdvar( "ui_play_credits" );

    if ( isdefined( var_0 ) && var_0 != "" )
    {
        maps\dubai_finale::_id_74C0();
        maps\_audio::aud_send_msg( "play_credits_music" );
        setsaveddvar( "compass", 0 );
        _id_767F();
        return;
    }

    maps\_audio::aud_send_msg( "start_intro" );
    maps\dubai_code::_id_756B();
    thread maps\dubai_code::_id_5119();
}

_id_766E()
{
    maps\_audio::aud_send_msg( "start_exterior" );
    maps\_shg_common::move_player_to_start( "player_start_exterior" );
    maps\dubai_code::_id_756B( "player_start_exterior" );
    common_scripts\utility::flag_set( "intro_complete" );
    common_scripts\utility::flag_set( "exterior_initial_enemies" );
    thread maps\dubai_code::_id_7576();
}

_id_766F()
{
    maps\_audio::aud_send_msg( "start_exterior_circle" );
    maps\_shg_common::move_player_to_start( "player_start_exterior_circle" );
    maps\dubai_code::_id_756B( "player_start_exterior_circle" );
    common_scripts\utility::flag_set( "intro_complete" );
    thread maps\dubai_code::_id_7576();
}

_id_7670()
{
    maps\_audio::aud_send_msg( "start_lobby" );
    maps\_shg_common::move_player_to_start( "player_start_lobby" );
    maps\dubai_code::_id_756B( "player_start_lobby" );
    thread maps\dubai_code::_id_7576();
}

_id_7671()
{
    maps\_audio::aud_send_msg( "start_elevator" );
    maps\_shg_common::move_player_to_start( "player_start_elevator" );
    maps\dubai_code::_id_756B( "player_start_elevator" );
    level notify( "vo_lobby_near_elevator" );
    thread maps\dubai_code::_id_7576();
    common_scripts\utility::flag_set( "lobby_yuri_to_elevator" );
    common_scripts\utility::flag_set( "ocean_vista" );
}

_id_7672()
{
    maps\_shg_common::move_player_to_start( "player_start_elevator" );
    maps\dubai_code::_id_756B( "player_start_elevator" );
    level notify( "vo_lobby_near_elevator" );
    thread maps\dubai_code::_id_7576();
    common_scripts\utility::flag_set( "lobby_yuri_to_elevator" );
    common_scripts\utility::flag_set( "ocean_vista" );
}

_id_7673()
{

}

_id_7674()
{
    maps\_audio::aud_send_msg( "start_top_floor" );
    maps\_shg_common::move_player_to_start( "player_start_top_floor" );
    maps\dubai_code::_id_756B( "player_start_top_floor" );
    var_0 = getent( "top_floor_yuri_grenade_location", "targetname" );
    level._id_73D7 forceteleport( var_0.origin, var_0.angles );
    level._id_73D7 thread maps\dubai_code::_id_75DE( var_0, 1 );
    common_scripts\utility::flag_set( "player_at_top_floor" );
    common_scripts\utility::flag_set( "elevator_replacement_moving_to_top" );
    setdvar( "makarov_escaping_time_left", "3.5" );
    common_scripts\utility::flag_set( "top_floor_countdown_start" );
    var_1 = level._id_75A4 common_scripts\_elevator::get_outer_leftdoor( 1 );
    var_2 = level._id_75A4 common_scripts\_elevator::get_outer_rightdoor( 1 );
    var_1 connectpaths();
    var_2 connectpaths();
    level.player switchtoweapon( level.secondaryweapon );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
}

_id_7675()
{
    maps\_audio::aud_send_msg( "start_restaurant_entrance" );
    maps\_shg_common::move_player_to_start( "player_start_restaurant_entrance" );
    maps\dubai_code::_id_756B( "player_start_restaurant_entrance" );
    setdvar( "makarov_escaping_time_left", "1" );
    common_scripts\utility::flag_set( "top_floor_countdown_start" );
    level.player switchtoweapon( level.secondaryweapon );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
}

_id_7676()
{
    maps\_audio::aud_send_msg( "start_restaurant_destruction" );
    maps\_shg_common::move_player_to_start( "player_start_restaurant_destruction" );
    maps\dubai_code::_id_756B( "player_start_restaurant_destruction" );
    common_scripts\utility::flag_set( "chopper_restaurant_intro" );
    common_scripts\utility::flag_set( "vo_restaurant_start" );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
}

_id_7677()
{
    maps\_audio::aud_send_msg( "start_restaurant_exit" );
    maps\_shg_common::move_player_to_start( "player_start_restaurant_exit" );
    thread maps\dubai_code::_id_7611();
    common_scripts\utility::exploder( 250 );
    common_scripts\utility::exploder( 300 );
    common_scripts\utility::exploder( 500 );
    common_scripts\utility::exploder( 600 );
    thread maps\dubai_code::_id_7613();
    common_scripts\utility::flag_set( "restaurant_drop_section_falling" );
    common_scripts\utility::flag_set( "restaurant_destroyed" );
    level.player maps\_utility::_id_1FDF( getent( "restaurant_sequence_player_end_point", "targetname" ) );
    thread maps\dubai_code::_id_761E();
    level._id_1C4C = 0;
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
    thread maps\dubai_utils::_id_744F();
}

_id_7678()
{
    maps\_audio::aud_send_msg( "start_finale_chopper_sequence" );
    var_0 = common_scripts\utility::getstruct( "player_start_finale_chopper_sequence", "targetname" );

    if ( !isdefined( var_0._id_2A94 ) )
    {
        var_0._id_2A94 = var_0.origin;
        var_0.origin += ( 0.0, 0.0, 12.0 );
    }

    maps\_shg_common::move_player_to_start( "player_start_finale_chopper_sequence" );
    thread maps\dubai_code::_id_761E();
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
    thread maps\dubai_utils::_id_744F();
}

_id_7679()
{
    maps\_audio::aud_send_msg( "start_finale_crash_site" );
    level.player takeallweapons();
    level._id_74DA = 1;
    common_scripts\utility::flag_set( "finale_chopper_crash_complete" );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
    thread maps\dubai_utils::_id_744F();
}

_id_767A()
{
    level._id_7529 = 1;
    maps\_audio::aud_send_msg( "start_finale_crash_site" );
    level.player takeallweapons();
    common_scripts\utility::flag_set( "end_finale_showdown" );
    common_scripts\utility::flag_set( "beatdown_tackle_start" );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
    thread maps\dubai_fx::_id_741A();
    thread maps\dubai_fx::_id_741C();
    thread maps\_utility::vision_set_fog_changes( "dubai_fall", 0.05 );
    thread maps\dubai_utils::_id_744F();
}

_id_767B()
{
    level._id_752B = 1;
    maps\_audio::aud_send_msg( "start_finale_crash_site" );
    thread maps\dubai_finale::_id_74C0();
    thread maps\dubai_fx::_id_741A();
    thread maps\dubai_fx::_id_741C();
    thread maps\dubai_fx::_id_741B();
    thread maps\_utility::vision_set_fog_changes( "dubai_cigar", 1 );
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    common_scripts\utility::flag_set( "ocean_vista" );
    thread maps\dubai_finale::_id_752A( undefined, undefined, 1 );
    common_scripts\utility::flag_set( "end_of_credits" );
    thread maps\dubai_finale::_id_7536();
    thread maps\dubai_utils::_id_744F();
}

_id_767C()
{
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    thread maps\dubai_finale::_id_750D();
}

_id_767D()
{
    setdvar( "ui_char_museum_mode", "credits_2" );
    level.player takeallweapons();
    _id_767F();
}

_id_767E()
{
    setdvar( "ui_char_museum_mode", "credits_black" );
    level.player takeallweapons();
    _id_767F();
}

_id_767F()
{
    common_scripts\utility::flag_set( "elevator_doors_closed" );
    level._id_7625 = maps\dubai_utils::_id_473C();
    level._id_7625.alpha = 1;
    var_0 = getdvar( "ui_char_museum_mode" );

    if ( var_0 != "credits_black" )
        thread maps\dubai_finale::_id_752A();
    else
        common_scripts\utility::flag_set( "level_end" );
}
