// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "paris_a" );
    _id_4D6D();
    _id_7714::main();
    _id_038F::main();
    _id_035D::main();
    precacheitem( "minigun_littlebird_spinnup" );
    precacheitem( "ninebang_grenade" );
    precacheitem( "rpg" );
    precachestring( &"PARIS_INTROSCREEN_LINE1" );
    precachestring( &"PARIS_INTROSCREEN_LINE2" );
    precachestring( &"PARIS_INTROSCREEN_LINE3" );
    precachestring( &"PARIS_INTROSCREEN_LINE4" );
    precachestring( &"PARIS_INTROSCREEN_LINE5" );
    precachestring( &"PARIS_PROTECT_TIMER" );
    precachestring( &"PARIS_USE_MANHOLE" );
    precacherumble( "steady_rumble" );
    precacherumble( "viewmodel_small" );
    precacheshader( "gasmask_overlay_delta2_top" );
    precacheshader( "gasmask_overlay_delta2_bottom" );
    maps\_utility::add_hint_string( "air_support_hint", &"PARIS_AIR_SUPPORT_HINT", maps\paris_a_code::_id_5138 );
    maps\_utility::add_hint_string( "air_support_fire_hint", &"PARIS_AIR_SUPPORT_THROW_HINT", maps\paris_a_code::_id_76D7 );
    maps\_utility::add_hint_string( "air_support_fire_hint_pc", &"PARIS_AIR_SUPPORT_THROW_HINT_PC", maps\paris_a_code::_id_76D7 );
    maps\_utility::_id_1F1B( ::_id_7715 );
    maps\_utility::_id_1E74( "rooftops", ::_id_7715, "Rooftops", ::_id_771A );
    maps\_utility::_id_1E74( "stairwell", ::_id_7716, "Stairwell", ::_id_771B );
    maps\_utility::_id_1E74( "restaurant_approach", ::_id_7717, "Restaurant Approach", ::_id_771C );
    maps\_utility::_id_1E74( "ac_moment", ::_id_7718, "AC Moment", ::_id_771D );
    maps\_utility::_id_1E74( "sewer_entrance", ::_id_7719, "Sewer Entrance", ::_id_771E );
    maps\paris_aud::main();
    maps\_load::main();
    _id_0622::main();
    maps\_compass::setupminimap( "compass_map_paris_a" );
    setsaveddvar( "compassMaxRange", 2200 );
    level._id_1441 = maps\_utility::_id_27AB( "steady_rumble" );
    level._id_1441.intensity = 0;
    maps\paris_shared::_id_5077();
    thread maps\paris_shared::_id_50B7();
    maps\paris_a_anim::main();
    maps\paris_a_vo::main();
    level._id_76EB = common_scripts\utility::getstruct( "struct_move_manhole", "script_noteworthy" );
    level._id_76EA = getent( "model_manhole", "script_noteworthy" );
    level._id_76EC = getent( "manhole_blocker", "script_noteworthy" );
    level._id_76EA._id_1032 = "manhole";
    level._id_76EA maps\_utility::_id_2629();
    level._id_76EB maps\_anim::_id_11CF( level._id_76EA, "delta_pull_movemanhole" );
    level._id_76EC disconnectpaths();
    maps\paris_a_code::_id_76AA();
    var_0 = maps\paris_shared::_id_5076( "ac130_spawner", "script_noteworthy" ) maps\_utility::_id_1FA3();
    var_0 maps\_vehicle::_id_1FA6();
    _id_0622::_id_3EA1( var_0, 12000, "tag_40mm" );
    thread maps\paris_shared::_id_4426();
    thread maps\paris_a_code::_id_7698();
    thread maps\paris_a_code::_id_7699();
    thread maps\paris_a_code::_id_76B6();
    thread maps\paris_a_code::_id_76B7();
    thread maps\paris_a_code::_id_76B8();
    thread maps\paris_a_code::_id_76C9();
    thread maps\paris_a_code::_id_76CC();
    thread maps\paris_a_code::_id_76CD();
    thread maps\paris_a_code::_id_3EB8();
    thread maps\paris_a_code::_id_76B9();
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), _id_5167::_id_3E81 );
    thread _id_4830();
    maps\paris_shared::_id_5076( "lone_star", "targetname" )._id_1032 = "lonestar";
    maps\paris_shared::_id_5076( "reno", "targetname" )._id_1032 = "reno";
    maps\paris_shared::_id_5076( "frenchie", "targetname" )._id_1032 = "gign_leader";
    maps\paris_shared::_id_5076( "redshirt", "targetname" )._id_1032 = "redshirt";

    foreach ( var_2 in getspawnerarray() )
        var_2 maps\_utility::add_spawn_function( maps\paris_a_code::_id_64EC );

    maps\paris_shared::_id_5074();

    foreach ( var_5 in getentarray( "trigger_hurt", "classname" ) )
        var_5 thread maps\paris_a_code::_id_7110();
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "game_fx_started" );
    common_scripts\utility::flag_init( "intro_screen_complete" );
    common_scripts\utility::flag_init( "flag_little_bird_landed" );
    common_scripts\utility::flag_init( "flag_move_debris_guy2_begin" );
    common_scripts\utility::flag_init( "flag_move_debris_guy2_commited" );
    common_scripts\utility::flag_init( "flag_move_debris_guy2_stop_idle" );
    common_scripts\utility::flag_init( "flag_stairwell_reaction_start" );
    common_scripts\utility::flag_init( "flag_bookstore_straglers" );
    common_scripts\utility::flag_init( "flag_bookstore_exit_start" );
    common_scripts\utility::flag_init( "flag_restaurant_meeting_start" );
    common_scripts\utility::flag_init( "flag_restaurant_meeting_complete" );
    common_scripts\utility::flag_init( "flag_conversation_blocker_leave" );
    common_scripts\utility::flag_init( "heli_crash_start" );
    common_scripts\utility::flag_init( "flag_ai_initial_top_retreat" );
    common_scripts\utility::flag_init( "bookstore_combat_interior_rear_done" );
    common_scripts\utility::flag_init( "flag_tanks_side_alley_aggro" );
    common_scripts\utility::flag_init( "flag_ac130_moment_friendlies_in_position" );

    if ( !common_scripts\utility::flag_exist( "flag_ac130_moment_complete" ) )
        common_scripts\utility::flag_init( "flag_ac130_moment_complete" );

    common_scripts\utility::flag_init( "btr_cortyard_killed" );
    common_scripts\utility::flag_init( "courtyard_1_cleared" );
    common_scripts\utility::flag_init( "courtyard_1_wave_2" );
    common_scripts\utility::flag_init( "flag_courtyard_2_combat_finished" );
    common_scripts\utility::flag_init( "flag_frenchie_manhole_ready" );
    common_scripts\utility::flag_init( "flag_player_manhole_ready" );
    common_scripts\utility::flag_init( "flag_catacombs_gate_finished" );
    common_scripts\utility::flag_init( "flag_obj_01_position_change_1" );
    common_scripts\utility::flag_init( "flag_obj_01_position_change_2" );
    common_scripts\utility::flag_init( "flag_obj_01_position_change_3" );
    common_scripts\utility::flag_init( "flag_obj_01_position_change_4" );
    common_scripts\utility::flag_init( "flag_obj_01_position_change_5" );
    common_scripts\utility::flag_init( "flag_obj_01_position_change_6" );
}

_id_7715()
{
    maps\_audio::aud_send_msg( "debug_start_rooftops" );
    common_scripts\utility::flag_set( "game_fx_started" );
}

_id_7716()
{
    maps\_audio::aud_send_msg( "debug_start_stairwell" );
    maps\_utility::_id_265B( "allies" );
    level._id_7683 = maps\_utility::_id_272F( "lone_star" );
    level._id_7684 = maps\_utility::_id_272F( "reno" );
    level._id_7683 maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level.player thread maps\paris_shared::_id_50A8( 0 );
    common_scripts\utility::flag_set( "game_fx_started" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_1" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_2" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_3" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_4" );
    maps\paris_shared::_id_5075( "checkpoint_stairwell" );
    common_scripts\utility::flag_set( "player_rooftop_jump_complete" );
    thread maps\paris_a_code::_id_76F1();
}

_id_7717()
{
    maps\_audio::aud_send_msg( "debug_start_restaurant_approach" );
    maps\_utility::_id_265B( "allies" );
    level._id_7683 = maps\_utility::_id_272F( "lone_star" );
    level._id_7684 = maps\_utility::_id_272F( "reno" );
    level._id_7683 maps\_utility::_id_2712();
    level._id_7684 maps\_utility::_id_2712();
    level._id_7683 maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_7683 thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2, 0.25 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level.player thread maps\paris_shared::_id_50A8( 0 );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\paris_shared::_id_5075( "checkpoint_restaurant_approach" );
    level.player setmovespeedscale( 0.8 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    thread maps\paris_shared::_id_5093( "dead_bodies_back_alley" );
    thread maps\paris_a_code::_id_76C5();
    thread maps\paris_a_code::_id_76B0( "guy_bookstore_death_1", "struct_bookstore_alley_shooting_1", "bookstore_alley_shooting_1" );
    thread maps\paris_a_code::_id_76B0( "guy_bookstore_death_2", "struct_bookstore_alley_shooting_2", "bookstore_alley_shooting_2" );
    thread maps\paris_a_code::_id_76B3();
    thread maps\paris_a_code::_id_76AF();
    thread maps\paris_a_code::_id_76B2();
}

_id_7718()
{
    maps\_audio::aud_send_msg( "debug_start_ac_moment" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_a", 0 );
    common_scripts\utility::flag_set( "flag_spawn_corpses_ac_alley" );
    level._id_7683 = maps\_utility::_id_272F( "lone_star" );
    level._id_76BA = maps\_utility::_id_272F( "frenchie" );
    level._id_7684 = maps\_utility::_id_272F( "reno" );
    level._id_76BB = maps\_utility::_id_272F( "redshirt" );
    level._id_7683 thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2, 0.25 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level._id_76BA thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2, 0.25 );
    level._id_76BB thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level.player thread maps\paris_shared::_id_50A8( 0 );
    level._id_7683 maps\_utility::_id_2611();
    level._id_76BA maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_76BB maps\_utility::_id_2611();
    maps\paris_shared::_id_5075( "checkpoint_ac_moment" );
}

_id_7719()
{
    maps\_audio::aud_send_msg( "debug_start_sewer_entrance" );
    maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_a", 0 );
    level._id_7683 = maps\_utility::_id_272F( "lone_star" );
    level._id_76BA = maps\_utility::_id_272F( "frenchie" );
    level._id_7684 = maps\_utility::_id_272F( "reno" );
    level._id_76BB = maps\_utility::_id_272F( "redshirt" );
    level._id_7683 maps\_utility::_id_2611();
    level._id_76BA maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_76BB maps\_utility::_id_2611();
    level.player thread maps\paris_shared::_id_50A8( 0 );
    maps\paris_shared::_id_5075( "checkpoint_catacombs_entrance" );
}

_id_771A()
{
    level._id_7683 = maps\_utility::_id_272F( "lone_star" );
    level._id_7684 = maps\_utility::_id_272F( "reno" );
    level._id_7683 maps\_utility::_id_109B();
    level._id_7684 maps\_utility::_id_109B();
    level._id_7683 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    level._id_7683 maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    thread maps\paris_shared::_id_5093( "dead_civ_rooftops" );
    maps\paris_a_code::_id_768C();
    thread maps\_utility::_id_265A( "allies" );
    level.player setmovespeedscale( 0.7 );
    thread maps\paris_a_code::_id_76F1();
    thread maps\paris_a_code::_id_7681();
    thread maps\paris_a_code::_id_76F4();
    maps\paris_a_code::_id_7682();
    maps\paris_a_code::_id_7690();
    level.player setmovespeedscale( 1 );
}

_id_771B()
{
    level._id_7683 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    thread maps\paris_a_code::_id_769E();
    thread maps\paris_a_code::_id_76A3();
    thread maps\paris_a_code::_id_76A4();
    thread maps\paris_a_code::_id_76A5();
    thread maps\paris_a_code::_id_76B4();
    common_scripts\utility::array_thread( [ level._id_7683, level._id_7684 ], maps\paris_a_code::_id_769D );
    maps\paris_a_code::_id_769A();
    level notify( "player_shimmy_stop" );
    level._id_7683 thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2, 0.25 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    maps\paris_a_code::_id_76AC();
}

_id_771C()
{
    common_scripts\utility::flag_wait( "trigger_restaurant_meeting" );
    maps\paris_a_code::_id_76BD();
    level._id_76BB maps\_utility::_id_2686();

    foreach ( var_1 in level._id_76BC )
    {
        if ( isalive( var_1 ) )
            var_1 maps\_utility::_id_2686();
    }

    maps\_audio::aud_send_msg( "meet_gign" );
    common_scripts\utility::flag_wait( "flag_cross_courtyard_complete" );
}

_id_771D()
{
    common_scripts\utility::flag_wait( "trigger_ac130_moment" );
    thread maps\paris_a_code::_id_76CE();
    common_scripts\utility::flag_wait( "flag_courtyard_2_combat_start" );
    thread maps\paris_a_code::_id_76D9();
    common_scripts\utility::flag_wait( "flag_ai_clean_up_ac130_moment" );
    thread maps\paris_a_code::_id_76D8();
    common_scripts\utility::flag_wait( "flag_courtyard_2_combat_finished" );
}

_id_771E()
{
    maps\paris_a_code::_id_76E9();
    level.player _id_0622::_id_3E8F();
}

_id_4830()
{
    _id_771F();

    switch ( level._id_1F19 )
    {
        case "default":
        case "rooftops":
        case "stairwell":
        case "restaurant_approach":
            _id_7720();
        case "ac_moment":
            _id_7721();
            _id_7722();
        case "sewer_entrance":
            _id_7723();
            break;
        default:
    }
}

_id_771F()
{
    if ( level._id_1F19 == "default" )
        return;

    if ( level._id_1F19 == "rooftops" )
        return;

    if ( level._id_1F19 == "stairwell" )
        return;

    common_scripts\utility::flag_set( "flag_obj_01_position_change_1" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_2" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_3" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_4" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_5" );
    common_scripts\utility::flag_set( "flag_obj_01_position_change_6" );

    if ( level._id_1F19 == "restaurant_approach" )
        return;

    objective_add( 1, "invisible", &"PARIS_OBJECTIVE_MEET_GIGN" );
    objective_state_nomessage( 1, "done" );
    common_scripts\utility::flag_set( "flag_restaurant_meeting_complete" );
    common_scripts\utility::flag_set( "flag_cross_courtyard_complete" );

    if ( level._id_1F19 == "ac_moment" )
        return;

    objective_add( 1, "invisible", &"PARIS_OBJECTIVE_MEET_GIGN" );
    objective_state_nomessage( 1, "done" );
    objective_add( 2, "invisible", &"PARIS_OBJECTIVE_FOLLOW_GIGN" );
    objective_state_nomessage( 2, "done" );
    objective_add( 3, "invisible", &"PARIS_OBJECTIVE_DESTROY_BTR" );
    objective_state_nomessage( 3, "done" );

    if ( level._id_1F19 == "sewer_entrance" )
        return;
}

_id_7720()
{
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_1" );
    var_0 = 1;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_MEET_GIGN" );
    objective_current( var_0 );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_01_gign_target_1", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_2" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_01_gign_target_2", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_3" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_01_gign_target_3", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_4" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_01_gign_target_4", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_5" );
    common_scripts\utility::flag_set( "flag_ai_initial_top_retreat" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_01_gign_target_5", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_6" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_01_gign_target_6", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_restaurant_meeting_start" );
    maps\_utility::_id_2727( var_0 );
}

_id_7721()
{
    common_scripts\utility::flag_wait( "flag_restaurant_meeting_complete" );
    var_0 = 2;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_FOLLOW_GIGN" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_cross_courtyard", "targetname" ).origin );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "flag_cross_courtyard_complete" );

    while ( !isdefined( level._id_76BA ) )
        common_scripts\utility::waitframe();

    objective_onentity( var_0, level._id_76BA );
    common_scripts\utility::flag_wait_any( "flag_obj_btr_courtyard", "flag_dialogue_heli_unloading", "flag_mi17_courtyard_02_dead" );
    wait 5.5;
}

_id_7722()
{
    while ( !isdefined( level._id_3EB8 ) )
        common_scripts\utility::waitframe();

    wait 4;
    var_0 = 3;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_DESTROY_BTR" );
    maps\paris_shared::_id_50A1( var_0, level._id_3EB8, ( 0.0, 0.0, 64.0 ) );
    objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_BTR" );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "btr_cortyard_killed" );
    wait 2;
    maps\_utility::_id_2727( var_0 );
}

_id_7723()
{
    objective_delete( 2 );
    var_0 = 4;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_FOLLOW_GIGN" );

    while ( !isdefined( level._id_76BA ) )
        common_scripts\utility::waitframe();

    objective_onentity( var_0, level._id_76BA );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "flag_player_manhole_ready" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_enter_sewers", "targetname" ).origin );
    objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_ENTER" );
    common_scripts\utility::flag_wait( "flag_player_manhole" );
    maps\_utility::_id_2727( var_0 );
}
