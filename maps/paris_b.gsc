// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "paris_b" );
    common_scripts\utility::noself_delaycall( 0.05, ::setdvar, "paris_transition_movie", "" );
    _id_4D6D();
    _id_7826::main();
    _id_03A5::main();
    _id_0355::main();
    vehicle_scripts\_hind::main( "vehicle_mi24p_hind_woodland", undefined, "script_vehicle_hind_woodland" );
    precacheitem( "scar_h_acog" );
    precacheitem( "sa80lmg_fastreload_reflex" );
    precacheitem( "ninebang_grenade" );
    precacheitem( "flash_grenade" );
    precacheitem( "chopper_gunner_minigun_paris" );
    precachemodel( "viewmodel_gasmask" );
    precacheitem( "rpg" );
    precacheshellshock( "default" );
    precacheshellshock( "paris_scripted_flashbang" );
    precacherumble( "viewmodel_small" );
    precacherumble( "viewmodel_medium" );
    precacherumble( "viewmodel_large" );
    precacherumble( "heavy_1s" );
    precacherumble( "heavy_2s" );
    precacherumble( "heavy_3s" );
    precacheshader( "gasmask_overlay_delta2_top" );
    precacheshader( "gasmask_overlay_delta2_bottom" );
    precachemodel( "armored_van_passengerDoor_obj" );
    precachemodel( "armored_van_rearDoorR" );
    precachemodel( "armored_van_rearDoorL" );
    precachemodel( "paris_crowbar_01" );
    precachemodel( "mil_emergency_flare" );
    precachestring( &"PARIS_FAIL_CAPTURE_VOLK_ALIVE" );
    precachestring( &"PARIS_FAIL_DONT_KILL_VOLK" );
    precachestring( &"PARIS_FAIL_KILL_VOLKS_GUARDS" );
    precachestring( &"PARIS_FAIL_SHOOT_VOLKS_CAR" );
    maps\_utility::_id_1E74( "intro_cinematic", ::_id_7828, "Intro cinematic", ::_id_782E );
    maps\_utility::_id_1E74( "catacombs_start", ::_id_7829, "Catacombs Start", ::_id_782F );
    maps\_utility::_id_1E74( "catacombs_skull_chamber", ::_id_782A, "Catacombs Skull Chamber", ::_id_7831 );
    maps\_utility::_id_1E74( "chase", ::_id_782B, "Chase", ::_id_7832 );
    maps\_utility::_id_1E74( "chase_canal", ::_id_782C, "Chase Canal", ::_id_7833 );
    maps\_utility::_id_1E74( "chase_ending", ::_id_782D, "Chase Ending", ::_id_7834 );
    maps\_utility::_id_26A9( "catacombs_start" );
    maps\_load::main();
    maps\paris_aud::main();
    maps\paris_b_anim::main();
    maps\paris_b_code::_id_77E5();
    maps\paris_shared::_id_5077();
    level.scr_sound["breach_wooden_door"] = "detpack_explo_main";
    level.scr_sound["breach_wood_door_kick"] = "wood_door_kick";
    maps\paris_b_vo::main();
    maps\paris_b_code::_id_775D();
    thread maps\paris_shared::_id_4426();
    level._id_778E = getent( "car_chemical_ali", "targetname" );
    level._id_778E._id_1032 = "escape_sedan";
    level._id_778E maps\paris_b_code::_id_77CE();
    level._id_778F = common_scripts\utility::getstruct( "struct_ali_car_fishtail", "script_noteworthy" );
    level._id_778F maps\_anim::_id_11CF( level._id_778E, "sedan_escape" );
    level._id_7779 = getent( "volk_escape_table", "script_noteworthy" );
    level._id_7779._id_1032 = "volk_escape_table";
    level._id_7779 maps\_utility::_id_2629();
    level._id_777A = getent( "volk_escape_table_props", "script_noteworthy" );
    level._id_777A._id_1032 = "volk_escape_table_props";
    level._id_777A maps\_utility::_id_2629();
    level._id_777B = common_scripts\utility::getstruct( "struct_volk_escape_moment", "script_noteworthy" );
    level._id_777B maps\_anim::_id_11BF( [ level._id_7779, level._id_777A ], "volk_escape" );
    var_0 = getent( "catacombs_gate_origin", "script_noteworthy" );
    var_1 = getent( "catacombs_gate_model", "script_noteworthy" );
    var_1._id_1032 = "catacombs_gate";
    var_1 maps\_utility::_id_2629();
    var_0 maps\_anim::_id_11CF( var_1, "catacombs_gate_enter" );
    maps\paris_shared::_id_5076( "catacombs_gate_brushmodel", "script_noteworthy" ) disconnectpaths();
    level._id_774E = maps\paris_shared::_id_5076( "final_crash_fence", "script_noteworthy" );
    level._id_774E hide();
    level._id_774E._id_1032 = "final_crash_fence";
    level._id_774E maps\_utility::_id_2629();
    common_scripts\utility::getstruct( "struct_final_crash_start", "script_noteworthy" ) maps\_anim::_id_11CF( level._id_774E, "chase_final_crash" );

    foreach ( var_3 in getentarray( "final_crash_fence_broken_base", "script_noteworthy" ) )
        var_3 hide();

    thread maps\paris_b_code::_id_7820();
    thread maps\paris_b_code::_id_77A4();
    thread maps\paris_b_code::_id_77A6();
    thread maps\paris_b_code::_id_77B3();
    thread maps\paris_b_code::_id_77A0();
    thread maps\paris_b_code::_id_77A1();
    thread maps\paris_b_code::_id_77B4();
    thread maps\paris_b_code::_id_77B5();
    thread maps\paris_b_code::_id_77B6();
    thread maps\paris_b_code::_id_77B2();
    thread maps\paris_b_code::_id_77A2();
    thread maps\paris_b_code::_id_77C2();
    thread maps\paris_b_code::_id_7772();
    thread maps\paris_b_code::_id_7773();
    thread maps\paris_b_code::_id_7776();
    thread maps\paris_b_code::_id_518C();
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), _id_5167::_id_3E81 );
    thread _id_4830();
    maps\paris_shared::_id_5076( "lone_star", "targetname" )._id_1032 = "lonestar";
    maps\paris_shared::_id_5076( "reno", "targetname" )._id_1032 = "reno";
    maps\paris_shared::_id_5076( "redshirt", "targetname" )._id_1032 = "redshirt";
    maps\paris_shared::_id_5076( "frenchie", "targetname" )._id_1032 = "gign_leader";
    maps\paris_shared::_id_5076( "lone_star_gasmask", "targetname" )._id_1032 = "lonestar";
    maps\paris_shared::_id_5076( "redshirt_gasmask", "targetname" )._id_1032 = "redshirt";

    foreach ( var_6 in getentarray( "ai_enemy_chase_encounter_05", "script_noteworthy" ) )
        var_6 maps\_utility::add_spawn_function( maps\paris_b_code::_id_7795 );

    var_8 = [ "ak47", "ak47", "ak47_acog", "ak47_eotech", "ak47_grenadier", "ak47_reflex", "ak74u", "ak74u_reflex", "ak74u_silencer", "coltanaconda", "deserteagle", "fnfiveseven", "g36c", "g36c_acog", "g36c_reflex", "g36c_silencer", "m16_acog", "m16_basic", "m16_grenadier", "m203", "m203_m4", "m4_grenadier", "mk46", "mk46_acog", "mk46_grip", "mk46_reflex", "ninebang_grenade", "mp5", "mp5_eotech", "mp5_reflex", "mp5_silencer", "mp5_silencer_reflex", "p99", "pecheneg", "pecheneg_acog", "pecheneg_reflex", "pp90m1", "pp90m1_reflex", "pp90m1_silencer", "rpg", "rpg_straight", "rpg_player", "saw_bipod_crouch", "saw_bipod_prone", "saw_bipod_stand", "scar_h", "spas12", "usp_no_knife", "usp_silencer" ];

    foreach ( var_10 in var_8 )
        precacheitem( var_10 );

    var_12 = maps\_loadout::_id_1C7C( "paris", 1 );

    if ( !var_12 )
        maps\paris_shared::_id_5074();
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "game_fx_started" );
    common_scripts\utility::flag_init( "flag_gasmasks_off" );
    common_scripts\utility::flag_init( "van_ride_complete" );
    common_scripts\utility::flag_init( "flag_intro_cinematic_done" );
    common_scripts\utility::flag_init( "flag_catacombs_gate_frenchie_idling" );
    common_scripts\utility::flag_init( "flag_catacombs_gate_redshirt_idling" );
    common_scripts\utility::flag_init( "flag_catacombs_gate_begin" );
    common_scripts\utility::flag_init( "flag_npc_in_squeeze_corridor" );
    common_scripts\utility::flag_init( "flag_frenchie_fallen_corridor_committed" );
    common_scripts\utility::flag_init( "flag_redshirt_fallen_corridor_committed" );
    common_scripts\utility::flag_init( "flag_lone_star_past_fallen_corridor" );
    common_scripts\utility::flag_init( "flag_reno_past_fallen_corridor" );
    common_scripts\utility::flag_init( "set_flare_3" );
    common_scripts\utility::flag_init( "flag_volk_boiler_room_escape_complete" );
    common_scripts\utility::flag_init( "flag_player_in_truck" );
    common_scripts\utility::flag_init( "flag_chase_gaz_barricade_01" );
    common_scripts\utility::flag_init( "flag_crash_gaz_barricade_started" );
    common_scripts\utility::flag_init( "flag_player_to_the_front_complete" );
    common_scripts\utility::flag_init( "flag_van_180_skid_start" );
    common_scripts\utility::flag_init( "flag_get_in_van" );
    common_scripts\utility::flag_init( "flag_tank_moment_ai_move_up" );
    common_scripts\utility::flag_init( "flag_player_shot_sedan_ending" );
    common_scripts\utility::flag_init( "flag_final_crash_begin" );
    common_scripts\utility::flag_init( "flag_failure_did_not_shoot" );
    common_scripts\utility::flag_init( "flag_volk_ending_start" );
    common_scripts\utility::flag_init( "flag_stair_impact" );
    common_scripts\utility::flag_init( "flag_combat_staging_room" );
    common_scripts\utility::flag_init( "flag_obj_capture_volk_complete" );
}

_id_7827()
{
    _id_7829();
}

_id_7828()
{
    maps\_audio::aud_send_msg( "debug_start_catacombs_start" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
}

_id_7829()
{
    maps\_audio::aud_send_msg( "debug_start_catacombs_start" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
}

_id_782A()
{
    maps\_audio::aud_send_msg( "debug_start_catacombs_skull_chamber" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
    level._id_7683 = maps\_utility::_id_272F( "lone_star", 1 );
    level._id_76BA = maps\_utility::_id_272F( "frenchie", 1 );
    level._id_7684 = maps\_utility::_id_272F( "reno", 1 );
    level._id_76BB = maps\_utility::_id_272F( "redshirt", 1 );
    level._id_7683 maps\_utility::_id_13A4( "b" );
    level._id_7684 maps\_utility::_id_13A4( "o" );
    level._id_76BB maps\_utility::_id_13A4( "y" );
    level._id_76BA maps\_utility::_id_13A4( "r" );
    level._id_7683 maps\_utility::_id_2611();
    level._id_76BA maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_76BB maps\_utility::_id_2611();
    setsaveddvar( "ai_friendlyFireBlockDuration", 1.25 );
    maps\paris_shared::_id_5075( "checkpoint_catacombs_skull_chamber" );

    for ( var_0 = 1; var_0 <= 5; var_0++ )
    {
        var_1 = maps\paris_shared::_id_5076( "flare_light_" + var_0, "script_noteworthy" );
        var_2 = common_scripts\utility::getstruct( "flare_plant_" + var_0, "script_noteworthy" );
        var_1 maps\paris_b_code::_id_77F6( var_2 );
    }

    level._id_76BA maps\paris_b_code::_id_776D();
    level._id_76BA._id_0F3C = 1;
    wait 1;

    foreach ( var_4 in [ level._id_7684, level._id_7683, level._id_76BA, level._id_76BB ] )
    {
        var_4 maps\_utility::_id_109B();
        var_4 maps\_utility::_id_2686();
    }
}

_id_782B()
{
    maps\_audio::aud_send_msg( "debug_start_chase" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
    level._id_7683 = maps\_utility::_id_272F( "lone_star", 1 );
    level._id_76BA = maps\_utility::_id_272F( "frenchie", 1 );
    level._id_7684 = maps\_utility::_id_272F( "reno", 1 );
    level._id_76BB = maps\_utility::_id_272F( "redshirt", 1 );
    level._id_7683 maps\_utility::_id_13A4( "b" );
    level._id_7684 maps\_utility::_id_13A4( "o" );
    level._id_76BB maps\_utility::_id_13A4( "y" );
    level._id_76BA maps\_utility::_id_13A4( "r" );
    level._id_7683 maps\_utility::_id_2611();
    level._id_76BA maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_76BB maps\_utility::_id_2611();
    maps\paris_shared::_id_5075( "checkpoint_chase" );
    setsaveddvar( "compassMaxRange", 1500 );
}

_id_782C()
{
    maps\_audio::aud_send_msg( "debug_start_chase_canal" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
    level._id_7683 = maps\_utility::_id_272F( "lone_star", 1 );
    level._id_7684 = maps\_utility::_id_272F( "reno", 1 );
    level._id_7683 maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_7683 maps\_utility::_id_13A4( "b" );
    level._id_7684 maps\_utility::_id_13A4( "r" );
    level._id_50DE maps\paris_b_code::_id_781C( "door_KR" );
    level._id_50DE maps\paris_b_code::_id_781C( "door_KL" );
    level._id_50DE setanim( level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ), 1, 0, 0 );
    level._id_50DE setanimtime( level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ), 1 );
    maps\paris_shared::_id_50DD();
    maps\paris_b_code::_id_77FE();
    var_0 = getvehiclenode( "debug_start_chase_canal_vehicle_node", "script_noteworthy" );
    level._id_5157 vehicle_teleport( var_0.origin, var_0.angles );
    level._id_5157 thread maps\_vehicle::_id_26A1( var_0, 0 );
    level._id_5157 startpath( var_0 );
    level._id_7797 = common_scripts\utility::spawn_tag_origin();
    level._id_7797 linkto( level._id_50DE, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\paris_b_code::_id_7796( 0, 105, 100, 40, 40 );
    thread maps\paris_b_code::_id_51D7();
    level.player allowcrouch( 1 );
    level.player common_scripts\utility::delaycall( 0.5, ::setstance, "crouch" );
    level.player common_scripts\utility::delaycall( 0.05, ::setplayerangles, level._id_50DE gettagangles( "tag_player" ) );
    level._id_7683 thread maps\paris_b_code::_id_7807();
    level._id_7684 thread maps\paris_b_code::_id_7806();
    common_scripts\utility::flag_set( "trigger_minimap_chase" );
    level._id_5157._id_2941 = 0;
    setsaveddvar( "compassMaxRange", 3500 );
}

_id_782D()
{
    maps\_audio::aud_send_msg( "debug_start_chase_ending" );
    common_scripts\utility::flag_set( "game_fx_started" );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
    level._id_7683 = maps\_utility::_id_272F( "lone_star", 1 );
    level._id_7684 = maps\_utility::_id_272F( "reno", 1 );
    level._id_7683 maps\_utility::_id_2611();
    level._id_7684 maps\_utility::_id_2611();
    level._id_7683 maps\_utility::_id_13A4( "b" );
    level._id_7684 maps\_utility::_id_13A4( "r" );
    level._id_50DE maps\paris_b_code::_id_781C( "door_KR" );
    level._id_50DE maps\paris_b_code::_id_781C( "door_KL" );
    level._id_50DE setanim( level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ), 1, 0, 0 );
    level._id_50DE setanimtime( level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ), 1 );
    maps\paris_shared::_id_50DD();
    maps\paris_b_code::_id_77FE();
    var_0 = getvehiclenode( "debug_start_chase_ending_vehicle_node", "script_noteworthy" );
    level._id_5157 vehicle_teleport( var_0.origin, var_0.angles );
    level._id_5157 thread maps\_vehicle::_id_26A1( var_0, 0 );
    level._id_5157 startpath( var_0 );
    level._id_7797 = common_scripts\utility::spawn_tag_origin();
    level._id_7797 linkto( level._id_50DE, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\paris_b_code::_id_7796( 0, 105, 100, 40, 40 );
    thread maps\paris_b_code::_id_51D7();
    level.player allowcrouch( 1 );
    level.player common_scripts\utility::delaycall( 0.5, ::setstance, "crouch" );
    level.player common_scripts\utility::delaycall( 0.05, ::setplayerangles, level._id_50DE gettagangles( "tag_player" ) );
    level._id_7683 thread maps\paris_b_code::_id_7807();
    level._id_7684 thread maps\paris_b_code::_id_7806();
    common_scripts\utility::flag_set( "trigger_minimap_chase" );
    setsaveddvar( "compassMaxRange", 3500 );
}

_id_782E()
{
    level._id_7683 = maps\_utility::_id_272F( "lone_star_gasmask", 1 );
    level._id_76BB = maps\_utility::_id_272F( "redshirt_gasmask", 1 );
    common_scripts\utility::flag_set( "flag_intro_cinematic" );
    level._id_7683 maps\_utility::_id_09C9( maps\paris_b_code::_id_775F );
    level._id_76BB maps\_utility::_id_09C9( maps\paris_b_code::_id_7760 );
    maps\_utility::_id_09C9( maps\paris_b_code::_id_7761 );
    maps\_utility::_id_275B();
    level._id_7683 delete();
    level._id_76BB delete();
    common_scripts\utility::flag_set( "flag_intro_cinematic_done" );
}

_id_782F()
{
    level._id_7683 = maps\_utility::_id_272F( "lone_star", 1 );
    level._id_76BB = maps\_utility::_id_272F( "redshirt", 1 );
    level._id_76BA = maps\_utility::_id_272F( "frenchie", 1 );
    level._id_7684 = maps\_utility::_id_272F( "reno", 1 );
    thread maps\paris_b_code::_id_776F();
    thread maps\paris_b_code::_id_7771();
    thread maps\paris_b_vo::_id_7727();
    thread maps\paris_b_code::_id_7762();
    thread maps\_utility::_id_265A( "allies" );
    level.player setmovespeedscale( 0.7 );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 2 );
    level._id_7683 maps\_utility::_id_09C9( maps\paris_b_code::_id_7765 );
    level._id_76BA maps\_utility::_id_09C9( maps\paris_b_code::_id_7766 );
    level._id_7684 maps\_utility::_id_09C9( maps\paris_b_code::_id_7767 );
    level._id_76BB maps\_utility::_id_09C9( maps\paris_b_code::_id_7768 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 1.25 );
    maps\_utility::_id_09C9( ::_id_7830 );
    maps\_utility::_id_275B();
}

_id_7830()
{
    common_scripts\utility::flag_wait( "flag_catacombs_gate_frenchie_idling" );
    common_scripts\utility::flag_wait( "flag_catacombs_gate_redshirt_idling" );
    common_scripts\utility::flag_wait( "trigger_catacombs_gate_player_nearby" );
    common_scripts\utility::flag_set( "flag_catacombs_gate_begin" );
    common_scripts\utility::flag_set( "flag_dialogue_catacombs_post_breach" );
    thread _id_03A5::_id_514A();
    thread maps\paris_b_code::_id_7769();
    thread maps\paris_b_code::_id_776A();
    thread maps\paris_b_code::_id_776B();
    common_scripts\utility::flag_wait( "flag_frenchie_fallen_corridor_committed" );
    common_scripts\utility::flag_wait( "flag_redshirt_fallen_corridor_committed" );
    thread maps\paris_b_code::_id_7770();
}

_id_7831()
{
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
    thread maps\_utility::_id_265A( "allies" );
    level._id_7683 thread maps\paris_shared::_id_50AE( -234, 0.8, 1.2 );
    level._id_7684 thread maps\paris_shared::_id_50AE( -156, 0.8, 1.2 );
    level._id_76BB thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    level._id_76BA thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2 );
    level.player setmovespeedscale( 0.7 );
    common_scripts\utility::flag_wait( "flag_volk_catacombs_escape" );
    thread maps\paris_b_code::_id_7777();
    var_0 = [ level._id_7684, level._id_7683, level._id_76BA, level._id_76BB ];

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::_id_109E();
        var_2._id_0FC6 = 1;
    }

    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait( "flag_catacombs_bomb_3" );
    thread maps\paris_b_code::_id_7785();
    common_scripts\utility::flag_wait( "flag_ai_catacombs_exit" );
    thread maps\paris_b_code::_id_7786();
    common_scripts\utility::flag_wait( "flag_volk_boiler_room_escape" );
    thread maps\paris_b_code::_id_7782();
    maps\paris_b_vo::_id_772C();
    common_scripts\utility::flag_wait( "flag_ai_boiler_room_runners" );
    thread maps\paris_b_code::_id_7789();
    common_scripts\utility::flag_wait( "flag_volk_apartment_escape" );
    thread maps\paris_b_code::_id_7783();
    common_scripts\utility::flag_wait( "flag_catacombs_ally_exit" );
    thread maps\paris_b_code::_id_7788();
    level._id_76BA maps\paris_b_code::_id_776E();
    level._id_76BA._id_0F3C = undefined;
    maps\_utility::vision_set_fog_changes( "paris_b", 2 );
    common_scripts\utility::flag_wait( "flag_ai_boiler_room_exit" );
    maps\_audio::aud_send_msg( "mus_catacombs_chase_end" );
    thread maps\paris_b_code::_id_778A();
}

_id_7832()
{
    common_scripts\utility::flag_wait( "trigger_found_bomb_truck" );
    var_0 = getentarray( "trigger_chase_scripting_on", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_off();

    thread maps\paris_shared::_id_5093( "dead_gign_chase_1" );
    thread maps\paris_b_code::_id_778C();
    thread maps\paris_b_code::_id_77FF();
    wait 6;
    common_scripts\utility::flag_set( "flag_get_in_van" );
    maps\paris_b_code::_id_7794();
    maps\paris_b_code::_id_77EF();
    thread maps\paris_b_code::_id_778B();
    thread maps\paris_b_code::_id_7802();
    thread maps\paris_b_code::_id_77B9();
    thread maps\paris_b_code::_id_77BC();
    thread maps\paris_b_code::_id_77BA();
    thread maps\paris_b_code::_id_77BB();
}

_id_7833()
{
    thread maps\paris_b_code::_id_77BD();
    common_scripts\utility::flag_wait( "spawn_tank_02" );
    maps\paris_b_code::_id_77B7();
    thread maps\paris_b_code::_id_77BE();
    thread maps\paris_b_code::_id_77BF();
    thread maps\paris_b_code::_id_77B8();
    thread maps\paris_b_code::_id_77C0();
    thread maps\paris_b_code::_id_77C1();
    thread maps\paris_b_code::_id_77C7();
    thread maps\paris_b_code::_id_77CA();
}

_id_7834()
{
    thread maps\paris_b_code::_id_77C9();
    maps\paris_b_code::_id_77CC();
    maps\paris_b_code::_id_77F1();
    maps\paris_b_code::_id_77E0();
}

_id_4830()
{
    _id_771F();

    switch ( level._id_1F19 )
    {
        case "intro_cinematic":
            common_scripts\utility::flag_wait( "flag_intro_cinematic_done" );
        case "default":
        case "catacombs_start":
        case "catacombs_skull_chamber":
            _id_7835();
        case "chase":
            _id_7836();
            _id_7838();
        case "chase_canal":
        case "chase_ending":
            _id_7839();
            break;
        default:
    }
}

_id_771F()
{
    objective_add( 1, "invisible", &"PARIS_OBJECTIVE_MEET_GIGN" );
    objective_state_nomessage( 1, "done" );
    objective_add( 2, "invisible", &"PARIS_OBJECTIVE_DESTROY_BTR" );
    objective_state_nomessage( 2, "done" );
    objective_add( 3, "invisible", &"PARIS_OBJECTIVE_FOLLOW_GIGN" );
    objective_state_nomessage( 3, "done" );

    if ( level._id_1F19 == "intro_cinematic" )
        return;

    if ( level._id_1F19 == "default" )
        return;

    if ( level._id_1F19 == "catacombs_start" )
        return;

    if ( level._id_1F19 == "catacombs_skull_chamber" )
        return;

    objective_add( 11, "invisible", &"PARIS_OBJECTIVE_FOLLOW_GIGN_CATACOMBS" );
    objective_state_nomessage( 11, "done" );
    common_scripts\utility::flag_set( "flag_obj_capture_volk_position_change_1" );
    common_scripts\utility::flag_set( "flag_obj_capture_volk_position_change_2" );

    if ( level._id_1F19 == "chase" )
        return;

    if ( level._id_1F19 == "chase_canal" )
        return;

    objective_add( 12, "invisible", &"PARIS_OBJECTIVE_CAPTURE_VOLK" );
    objective_add( 13, "invisible", &"PARIS_OBJECTIVE_GET_IN_VAN" );
    objective_state_nomessage( 6, "done" );

    if ( level._id_1F19 == "chase_ending" )
        return;
}

_id_7835()
{
    var_0 = 11;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_FOLLOW_GIGN_CATACOMBS" );

    while ( !isdefined( level._id_76BA ) )
        common_scripts\utility::waitframe();

    maps\paris_shared::_id_50A1( var_0, level._id_76BA );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "flag_volk_catacombs_escape" );
    maps\_utility::_id_2727( var_0 );
}

_id_7836()
{
    while ( !isdefined( level._id_7778 ) )
        common_scripts\utility::waitframe();

    wait 1.5;
    var_0 = 12;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_CAPTURE_VOLK" );
    objective_onentity( var_0, level._id_7778, ( 0.0, 0.0, 64.0 ) );
    objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_CAPTURE" );
    objective_current( var_0 );

    for (;;)
    {
        if ( isalive( level._id_7778 ) )
        {
            if ( level._id_7778.origin[2] > 472 )
            {
                if ( isdefined( level._id_7837 ) )
                {
                    objective_position( var_0, level._id_7837 );
                    objective_setpointertextoverride( var_0, "" );
                }

                break;
            }
            else
            {
                level._id_7837 = level._id_7778.origin + ( 0.0, 0.0, 64.0 );
                objective_onentity( var_0, level._id_7778, ( 0.0, 0.0, 64.0 ) );
                objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_CAPTURE" );
            }
        }
        else
        {
            objective_position( var_0, level._id_7837 );
            objective_setpointertextoverride( var_0, "" );
        }

        common_scripts\utility::waitframe();
    }

    common_scripts\utility::flag_wait( "flag_obj_capture_volk_position_change_1" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_capture_volk_target_1", "targetname" ).origin );
    common_scripts\utility::flag_wait( "flag_obj_capture_volk_position_change_2" );
    objective_position( var_0, common_scripts\utility::getstruct( "obj_capture_volk_target_2", "targetname" ).origin );
    common_scripts\utility::flag_wait( "trigger_found_bomb_truck" );

    while ( !isdefined( level._id_7778 ) )
        common_scripts\utility::waitframe();

    maps\paris_shared::_id_50A1( var_0, level._id_7778, ( 0.0, 0.0, 64.0 ) );
    objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_CAPTURE" );

    while ( isdefined( level._id_7778 ) && !common_scripts\utility::flag( "flag_get_in_van" ) )
        common_scripts\utility::waitframe();
}

_id_7838()
{
    var_0 = 13;
    objective_add( var_0, "active", &"PARIS_OBJECTIVE_GET_IN_VAN", common_scripts\utility::getstruct( "obj_05_truck_target", "targetname" ).origin );
    objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_ENTER" );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    maps\_utility::_id_2727( var_0 );
}

_id_7839()
{
    objective_delete( 12 );
    var_0 = 14;
    objective_string_nomessage( var_0, &"PARIS_OBJECTIVE_CAPTURE_VOLK" );
    objective_current_nomessage( var_0 );
    common_scripts\utility::flag_wait( "flag_player_to_the_front" );

    while ( !isdefined( level._id_7778 ) )
        common_scripts\utility::waitframe();

    maps\paris_shared::_id_50A1( var_0, level._id_7778, ( 0.0, 0.0, 64.0 ) );
    objective_setpointertextoverride( var_0, &"PARIS_OBJECTIVE_CAPTURE" );
    common_scripts\utility::flag_wait( "flag_obj_capture_volk_complete" );
    wait 2;
    maps\_utility::_id_2727( var_0 );
}
