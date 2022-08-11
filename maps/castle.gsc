// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56FB();
    _id_4D6D();
    _id_766A();
    maps\castle_precache::main();
    maps\createart\castle_art::main();
    maps\castle_fx::main();
    maps\castle_anim::main();
    maps\_load::main();
    maps\_stealth::main();
    maps\_patrol_anims::main();
    maps\_drone_civilian::init();
    thread maps\castle_amb::main();
    maps\castle_courtyard_battle::_id_81DF();
    maps\castle_courtyard_battle::_id_81E0();
    thread _id_0164();
    maps\castle_code::_id_606E();
    _id_64AB();
    _id_7D75();
    level.player maps\_stealth_utility::_id_4218();
    level thread _id_766C();
    level thread _id_467B();
    level thread _id_467C();
    level thread _id_467D();
    level thread _id_4681();
    level thread _id_0238();
    level.player thread maps\castle_code::_id_5CA6();
    maps\castle_code::_id_5CAE();
    maps\castle_code::_id_5D0C();
    maps\castle_code::_id_63FF();
    var_0 = getentarray( "dungeon_light", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setlightintensity( 0.1 );

    var_4 = getent( "cage_pad_light", "targetname" );
    var_4 setlightintensity( 0.1 );
    maps\castle_code::_id_8100( "startvista", 0 );
    _id_4682();
    maps\_utility::_id_265B( "axis" );
    level._id_81E9 = [];
    level._id_2000 = maps\castle_prison_battle::_id_787E;
}

_id_0164()
{
    if ( level._id_1F19 == "intro" )
    {
        setsaveddvar( "ui_hideMap", "1" );
        setsaveddvar( "hud_showStance", "0" );
        common_scripts\utility::flag_wait( "player_landed" );
        setsaveddvar( "ui_hideMap", "0" );
        setsaveddvar( "hud_showStance", "1" );
    }

    maps\_compass::setupminimap( "compass_map_castle" );
}

_id_56FB()
{
    precacheitem( "mp5" );
    precacheitem( "mp5_silencer_reflex_castle" );
    precacheitem( "c4" );
    precacheitem( "freerunner" );
    precacheitem( "rpg_straight" );
    precacheitem( "hellfire_missile_af_caves_end" );
    precacheitem( "flash_grenade" );
    precacheitem( "uzi" );
    precacheitem( "ak74u_acog" );
    precacheitem( "btr80_turret_castle" );
    precacherumble( "minigun_rumble" );
    precacherumble( "subtle_tank_rumble" );
    precacherumble( "grenade_rumble" );
    precacheshader( "stinger_emplacement_override_white" );
    precacheshader( "stinger_emplacement_override_red" );
    precacheshader( "stinger_emplacement_loading" );
    precacheshader( "stinger_emplacement_ready" );
    precacheshader( "stinger_emplacement_missile_full" );
    precacheshader( "stinger_emplacement_missile_empty" );
    precacheshader( "overlay_rain" );
    precacheshader( "overlay_rain_large" );
    precacheshader( "overlay_rain_large_02" );
    precacheshader( "overlay_rain_small" );
    precacheshader( "overlay_rain_small_02" );
    precachemodel( "body_price_europe_assault_a" );
    precachemodel( "ctl_missile_emplacement_obj" );
    precachemodel( "ctl_weapon_rpg7_obj" );
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "ctl_parachute_handle_backup" );
    precachemodel( "ctl_spotlight_modern_3x_on" );
    precachemodel( "ctl_spotlight_modern_3x_destroyed" );
    precachemodel( "ctl_foliage_tree_pine_tall_c" );
    precachemodel( "ctl_foliage_tree_pine_tall_b" );
    precachemodel( "paris_catacombs_door_pry_kick_rigged" );
    precachemodel( "vehicle_uaz_open_player_ride_door_backl_obj" );
    precachemodel( "generic_prop_raven" );
    precachemodel( "weapon_usp_silencer" );
    precachemodel( "weapon_commando_knife" );
    precachemodel( "head_price_europe_c_nvg" );
    maps\_load::_id_1F5C( "viewhands_player_yuri_europe" );
    maps\castle_parachute_sim::_id_806D();
    maps\_c4::main();
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "display_nvg_on_hint" );
    common_scripts\utility::flag_init( "display_nvg_off_hint" );
    common_scripts\utility::flag_init( "start_water_splash_fx" );
    common_scripts\utility::flag_init( "stop_water_splash_fx" );
    common_scripts\utility::flag_init( "re_start_water_splash_fx" );
    common_scripts\utility::flag_init( "castle_intro_fog" );
    common_scripts\utility::flag_init( "castle_intro_a_fog" );
    common_scripts\utility::flag_init( "castle_courtyard_fog" );
    common_scripts\utility::flag_init( "castle_dungeon_dark" );
    common_scripts\utility::flag_init( "castle_flare_room" );
    common_scripts\utility::flag_init( "castle_bridge_crossing_fog" );
    common_scripts\utility::flag_init( "castle_bridge_crossing_a_fog" );
    common_scripts\utility::flag_init( "castle_interior_exterior_fog" );
    common_scripts\utility::flag_init( "castle_control_room_fog" );
    common_scripts\utility::flag_init( "castle_courtyard_battle_fog" );
    common_scripts\utility::flag_init( "castle_courtyard_battle_a_fog" );
    common_scripts\utility::flag_init( "castle_bridge_explosion_fog" );
    common_scripts\utility::flag_init( "castle_bridge_explosion_jump_fog" );
    common_scripts\utility::flag_init( "castle_escape_fog" );
    common_scripts\utility::flag_init( "price_blew_bridge" );
    maps\castle_parachute::_id_7AA9();
    maps\castle_ruins::_id_7AA9();
    maps\castle_courtyard_stealth::_id_7AA9();
    maps\castle_courtyard_activity::_id_7AA9();
    maps\castle_prison_battle::_id_7AA9();
    maps\castle_bridge_crossing::_id_7AA9();
    maps\castle_into_wet_wall::_id_7AA9();
    maps\castle_kitchen_battle::_id_7AA9();
    maps\castle_prison_battle::_id_7AA9();
    maps\castle_interior::_id_7AA9();
    maps\castle_inner_courtyard::_id_7AA9();
    maps\castle_courtyard_battle::_id_7AA9();
    maps\castle_escape_new::_id_7AA9();
}

_id_64AB()
{
    maps\castle_ruins::_id_64AB();
    maps\castle_courtyard_stealth::_id_64AB();
    maps\castle_prison_battle::_id_64AB();
}

_id_7D75()
{
    maps\castle_code::_id_7A3F( "landing" );
    maps\castle_code::_id_7A3F( "ruins_middle" );
    maps\castle_code::_id_7A3F( "anim_align_dropdown" );
    maps\castle_code::_id_7A3F( "anim_align_helipad" );
    maps\castle_code::_id_7A3F( "anim_align_road" );
    maps\castle_code::_id_7A3F( "backward_crawl" );
    maps\castle_code::_id_7A3F( "security_room" );
    maps\castle_code::_id_7A3F( "align_dungeon_enter" );
    maps\castle_code::_id_7A3F( "dungeon_cell" );
    maps\castle_code::_id_7A3F( "align_multipath" );
    maps\castle_code::_id_7A3F( "align_u_room" );
    maps\castle_code::_id_7A3F( "align_flare_room" );
    maps\castle_code::_id_7A3F( "align_dungeon_exit" );
    maps\castle_code::_id_7A3F( "spiderclimb" );
    maps\castle_code::_id_7A3F( "kitchen_battle" );
    maps\castle_code::_id_7A3F( "price_talk" );
    maps\castle_code::_id_7A3F( "generator_room" );
    maps\castle_code::_id_7A3F( "foyer" );
    maps\castle_code::_id_7A3F( "inner_courtyard" );
    maps\castle_code::_id_7A3F( "bridge_overlook" );
    maps\castle_code::_id_7A3F( "castle_bridge" );
    maps\castle_code::_id_7A3F( "outer_courtyard" );
    maps\castle_code::_id_7A3F( "anim_align_end_run" );
    maps\castle_code::_id_7A3F( "anim_align_end_jump" );
    maps\castle_code::_id_7A3F( "anim_align_end_land" );
}

_id_766A()
{
    maps\_utility::_id_26A9( "intro" );
    maps\_utility::_id_1E74( "intro", maps\castle_parachute::_id_5872, "Level Intro", maps\castle_parachute::main );
    maps\_utility::_id_1E74( "ruins", maps\castle_ruins::_id_811C, "Ruins Start", maps\castle_ruins::_id_811D );
    maps\_utility::_id_1E74( "courtyard_activity", maps\castle_courtyard_activity::start, "Courtyard Activity", maps\castle_courtyard_activity::main );
    maps\_utility::_id_1E74( "platform_crawl", maps\castle_courtyard_stealth::_id_8096, "Platform Crawl", maps\castle_courtyard_stealth::main );
    maps\_utility::_id_1E74( "security_office", maps\castle_prison_battle::_id_8231, "Security Office", maps\castle_prison_battle::_id_8234 );
    maps\_utility::_id_1E74( "prison_battle_start", maps\castle_prison_battle::_id_8232, "Prison Battle Start", maps\castle_prison_battle::_id_8235 );
    maps\_utility::_id_1E74( "prison_battle_flare_room", maps\castle_prison_battle::_id_8233, "Prison Battle Flare Room", maps\castle_prison_battle::_id_8236 );
    maps\_utility::_id_1E74( "bridge_crossing", maps\castle_bridge_crossing::_id_4EDE, "Bridge Crossing", maps\castle_bridge_crossing::_id_4EDF );
    maps\_utility::_id_1E74( "destroy_wet_wall", maps\castle_into_wet_wall::_id_81E2, "Destroy Wet Wall", maps\castle_into_wet_wall::_id_81E4 );
    maps\_utility::_id_1E74( "into_wet_wall", maps\castle_into_wet_wall::_id_81E3, "Into Wet Wall", maps\castle_into_wet_wall::_id_81E5 );
    maps\_utility::_id_1E74( "kitchen_battle", maps\castle_kitchen_battle::_id_4EEA, "Kitchen Battle", maps\castle_kitchen_battle::_id_4EEB );
    maps\_utility::_id_1E74( "interior", maps\castle_interior::_id_72FA, "Interior", maps\castle_interior::_id_72FB );
    maps\_utility::_id_1E74( "inner_courtyard", maps\castle_inner_courtyard::_id_4EFB, "Inner Courtyard", maps\castle_inner_courtyard::_id_4EFC );
    maps\_utility::_id_1E74( "bridge_explode", maps\castle_courtyard_battle::_id_81B3, "Bridge Explode", maps\castle_courtyard_battle::_id_81B6 );
    maps\_utility::_id_1E74( "courtyard_battle", maps\castle_courtyard_battle::_id_81B4, "Courtyard Battle", maps\castle_courtyard_battle::_id_81B8 );
    maps\_utility::_id_1E74( "escape", maps\castle_escape_new::_id_8163, "Escape", maps\castle_escape_new::_id_8168 );
    maps\_utility::_id_1E74( "cliff", maps\castle_escape_new::_id_8167, "Cliff", maps\castle_escape_new::_id_8168 );
}

_id_766C()
{
    waittillframeend;
    _id_766D();
    var_0 = maps\_utility::_id_2816( "motorpool_melee" );
    var_1 = maps\_utility::_id_2816( "platform_bomb_plant" );
    var_2 = maps\_utility::_id_2816( "courtyard_stealth" );
    var_3 = maps\_utility::_id_2816( "prison_clear" );
    var_4 = maps\_utility::_id_2816( "bridge_bomb" );
    var_5 = maps\_utility::_id_2816( "wall_charge" );
    var_6 = maps\_utility::_id_2816( "comm_room" );
    var_7 = maps\_utility::_id_2816( "detonate_bridge" );
    var_8 = maps\_utility::_id_2816( "destroy_btr" );
    var_9 = maps\_utility::_id_2816( "escape_castle" );
    var_10 = maps\_utility::_id_2816( "parachute_to_safety" );
    common_scripts\utility::flag_wait( "player_landed" );
    objective_add( var_2, "current", &"CASTLE_OBJECTIVE_COURTYARD_STEALTH" );
    objective_onentity( var_2, level._id_4877 );
    common_scripts\utility::flag_wait( "objective_motorpool_melee" );
    objective_add( var_0, "current", &"CASTLE_OBJECTIVE_MOTORPOOL_MELEE" );

    if ( isdefined( level._id_80B7 ) )
        objective_state( var_2, "active" );

    common_scripts\utility::flag_wait( "objective_motorpool_melee_complete" );

    if ( !common_scripts\utility::flag( "stealth_not_following_price1" ) && !common_scripts\utility::flag( "price_kill_melee_guard" ) )
        objective_state( var_0, "done" );
    else
        objective_state( var_0, "failed" );

    objective_state( var_2, "current" );
    common_scripts\utility::flag_wait( "objective_bomb_plant" );
    objective_add( var_1, "current", &"CASTLE_OBJECTIVE_PLANT_BOMB" );

    if ( isdefined( level._id_809E ) )
    {
        level._id_809E show();
        objective_position( var_1, level._id_809E.origin );
    }

    common_scripts\utility::flag_wait( "platform_bomb_planted" );

    if ( !common_scripts\utility::flag( "stealth_not_following_price1" ) && !common_scripts\utility::flag( "Price_Plant_bomb_instead" ) )
        objective_state( var_1, "done" );
    else
        objective_state( var_1, "failed" );

    common_scripts\utility::flag_wait( "security_office_cleared" );
    objective_state( var_2, "done" );
    common_scripts\utility::flag_wait( "objective_clear_prison" );
    objective_add( var_6, "current", &"CASTLE_OBJECTIVE_COMM_ROOM" );
    objective_onentity( var_6, level._id_4877 );
    common_scripts\utility::flag_wait( "player_entered_prison" );
    level thread _id_467A( var_6, "prison_obj_marker" );
    common_scripts\utility::flag_wait( "meatshield_done" );
    objective_onentity( var_6, level._id_4877 );
    objective_setpointertextoverride( var_6, &"CASTLE_FOLLOW" );
    common_scripts\utility::flag_wait( "objective_comm_room" );
    common_scripts\utility::flag_wait( "objective_plant_bomb_bridge" );
    objective_add( var_4, "current", &"CASTLE_OBJECTIVE_PLANT_BOMB_BRIDGE" );

    if ( isdefined( level._id_81BE ) )
        objective_position( var_4, level._id_81BE.origin );

    common_scripts\utility::flag_wait( "bomb_has_been_planted" );
    objective_state( var_4, "done" );
    common_scripts\utility::flag_wait( "objective_time_wall_charge" );
    objective_add( var_5, "current", &"CASTLE_OBJECTIVE_TIME_WALL_CHARGE" );
    objective_onentity( var_5, level._id_4877 );
    common_scripts\utility::flag_wait( "wet_wall_destroyed" );

    if ( !common_scripts\utility::flag( "wet_wall_goofed" ) )
        objective_state( var_5, "done" );
    else
        objective_state( var_5, "failed" );

    common_scripts\utility::flag_wait( "peephole_start" );
    objective_state( var_6, "done" );
    common_scripts\utility::flag_wait( "kitchen_start" );
    objective_add( var_9, "current", &"CASTLE_OBJECTIVE_ESCAPE_CASTLE" );
    objective_onentity( var_9, level._id_4877 );
    common_scripts\utility::flag_wait( "inner_courtyard_initial_wave" );
    objective_setpointertextoverride( var_9, &"CASTLE_SUPPORT" );
    common_scripts\utility::flag_wait( "inner_courtyard_door_kick" );
    objective_position( var_9, getent( "obj_leave_innercourtyard", "targetname" ).origin );
    objective_setpointertextoverride( var_9, "" );
    common_scripts\utility::flag_wait( "give_bridge_detonator" );
    objective_add( var_7, "current", &"CASTLE_OBJECTIVE_DETONATE_BRIDGE" );
    objective_onentity( var_9, level._id_4877 );
    objective_setpointertextoverride( var_9, &"CASTLE_FOLLOW" );
    common_scripts\utility::flag_wait( "bridge_detonated" );

    if ( !common_scripts\utility::flag( "price_blew_bridge" ) )
        objective_state( var_7, "done" );
    else
        objective_state( var_7, "failed" );

    wait 2;
    objective_position( var_9, getent( "obj_leave_balcony", "targetname" ).origin );
    objective_setpointertextoverride( var_9, "" );
    common_scripts\utility::flag_wait( "jumped_to_bridge" );
    objective_onentity( var_9, level._id_4877 );
    objective_setpointertextoverride( var_9, &"CASTLE_FOLLOW" );
    common_scripts\utility::flag_wait( "get_to_escape_truck" );
    objective_setpointertextoverride( var_9, "" );
    objective_position( var_9, getent( "escape_truck_use_target", "targetname" ).origin );
    common_scripts\utility::flag_wait( "player_entering_truck" );
    objective_position( var_9, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "through_escape_doors" );
    wait 2.0;
    objective_state( var_9, "done" );
    common_scripts\utility::flag_wait( "escape_chute_ready" );
    objective_add( var_10, "current", &"CASTLE_OBJECTIVE_PARACHUTE_TO_SAFETY", ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "player_chute_opens" );
    wait 1.0;
    objective_state( var_10, "done" );
}

_id_467A( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        level endon( var_2 );

    var_3 = common_scripts\utility::getstruct( var_1, "targetname" );

    while ( isdefined( var_3 ) )
    {
        objective_position( var_0, var_3.origin );
        var_4 = 16384;

        if ( isdefined( var_3.radius ) )
            var_4 = var_3.radius * var_3.radius;

        while ( distancesquared( level.player.origin, var_3.origin ) > var_4 )
            wait 0.1;

        if ( isdefined( var_3.target ) )
        {
            var_3 = common_scripts\utility::getstruct( var_3.target, "targetname" );
            continue;
        }

        var_3 = undefined;
    }
}

_id_467B()
{
    maps\_utility::_id_1428( "castle_fight_music_01" );
    common_scripts\utility::flag_wait( "player_landed" );
    maps\_utility::_id_1428( "castle_sneak_music_01", 3.0 );
    common_scripts\utility::flag_wait( "kitchen_start" );
    maps\_utility::_id_1428( "castle_mombasa_music_01", 1.0 );
}

_id_766D()
{
    if ( maps\_utility::_id_1451() )
        return;

    var_0 = level._id_1F19;

    if ( var_0 == "intro" )
        return;

    common_scripts\utility::flag_set( "player_landing" );
    common_scripts\utility::flag_set( "player_landed" );

    if ( var_0 == "ruins" )
        return;

    common_scripts\utility::flag_set( "castle_intro_fog" );

    if ( var_0 == "courtyard_activity" )
        return;

    common_scripts\utility::flag_set( "objective_motorpool_melee" );
    common_scripts\utility::flag_set( "objective_motorpool_melee_complete" );
    common_scripts\utility::flag_set( "castle_intro_a_fog" );
    common_scripts\utility::flag_set( "castle_courtyard_fog" );

    if ( var_0 == "platform_crawl" )
        return;

    common_scripts\utility::flag_set( "objective_motorpool_melee" );
    common_scripts\utility::flag_set( "objective_motorpool_melee_complete" );
    common_scripts\utility::flag_set( "player_in_backcrawl" );
    common_scripts\utility::flag_set( "objective_bomb_plant" );
    common_scripts\utility::flag_set( "platform_bomb_planted" );
    maps\_stealth_utility::_id_4342();
    common_scripts\utility::flag_set( "castle_courtyard_a_fog" );

    if ( var_0 == "security_office" )
        return;

    common_scripts\utility::flag_set( "security_office_closed" );
    common_scripts\utility::flag_set( "security_office_cleared" );
    common_scripts\utility::flag_set( "objective_clear_prison" );
    common_scripts\utility::flag_set( "prison_start" );
    maps\castle_courtyard_stealth::_id_80F9();

    if ( var_0 == "prison_battle_start" )
        return;

    level thread maps\castle_prison_battle::_id_72F1();
    common_scripts\utility::flag_set( "entered_security_office_cage" );
    common_scripts\utility::flag_set( "price_activate_switch" );
    common_scripts\utility::flag_set( "player_entered_prison" );

    if ( var_0 == "prison_battle_flare_room" )
        return;

    common_scripts\utility::flag_set( "objective_comm_room" );
    common_scripts\utility::flag_set( "meatshield_done" );
    level thread maps\castle_prison_battle::_id_72F2();
    common_scripts\utility::flag_set( "exited_prison" );
    common_scripts\utility::flag_set( "castle_flare_room" );
    common_scripts\utility::flag_set( "castle_bridge_crossing_fog" );

    if ( var_0 == "bridge_crossing" )
        return;

    common_scripts\utility::flag_set( "objective_comm_room" );
    common_scripts\utility::flag_set( "objective_plant_bomb_bridge" );
    common_scripts\utility::flag_set( "bomb_has_been_planted" );
    common_scripts\utility::flag_set( "wet_wall_start" );
    common_scripts\utility::flag_set( "castle_bridge_crossing_a_fog" );

    if ( var_0 == "destroy_wet_wall" )
        return;

    common_scripts\utility::flag_set( "objective_time_wall_charge" );
    common_scripts\utility::flag_set( "wet_wall_destroyed" );

    if ( var_0 == "into_wet_wall" )
        return;

    common_scripts\utility::flag_set( "peephole_start" );
    common_scripts\utility::flag_set( "stop_peeping" );

    if ( var_0 == "kitchen_battle" )
        return;

    common_scripts\utility::flag_set( "kitchen_start" );
    level notify( "security_office_closed" );

    if ( var_0 == "interior" )
        return;

    common_scripts\utility::flag_set( "castle_interior_exterior_fog" );
    common_scripts\utility::flag_set( "castle_control_room_fog" );

    if ( var_0 == "inner_courtyard" )
        return;

    common_scripts\utility::flag_set( "inner_courtyard_initial_wave" );
    common_scripts\utility::flag_set( "inner_courtyard_done" );
    common_scripts\utility::flag_set( "castle_courtyard_battle_fog" );
    common_scripts\utility::flag_set( "castle_courtyard_battle_a_fog" );

    if ( var_0 == "bridge_explode" )
        return;

    common_scripts\utility::flag_set( "inner_courtyard_door_kick" );
    common_scripts\utility::flag_set( "give_bridge_detonator" );
    common_scripts\utility::flag_set( "bridge_detonated" );
    common_scripts\utility::flag_set( "castle_bridge_explosion_fog" );
    common_scripts\utility::flag_set( "castle_bridge_explosion_jump_fog" );

    if ( var_0 == "courtyard_battle" )
        return;

    common_scripts\utility::flag_set( "get_to_escape_truck" );
    common_scripts\utility::flag_set( "courtyard_btr_alive" );
    common_scripts\utility::flag_set( "courtyard_btr_destroyed" );

    if ( var_0 == "escape" )
        return;

    common_scripts\utility::flag_set( "castle_escape_fog" );
}

_id_467C()
{
    common_scripts\utility::flag_wait( "player_landed" );
    common_scripts\utility::exploder( 920 );
    common_scripts\utility::flag_wait( "peephole_start" );
    maps\_utility::_id_261A( 920 );
}

_id_467D( var_0 )
{
    thread _id_467E();

    if ( !isdefined( var_0 ) )
        var_0 = getdvar( "start" );

    switch ( var_0 )
    {
        case "escape":
        case "courtyard_battle":
        case "cliff":
            common_scripts\utility::flag_set( "re_start_water_splash_fx" );
        case "kitchen_battle":
        case "inner_courtyard":
        case "prison_battle_start":
        case "prison_battle_flare_room":
        case "bridge_crossing":
        case "destroy_wet_wall":
        case "into_wet_wall":
        case "interior":
        case "bridge_explode":
            common_scripts\utility::flag_set( "stop_water_splash_fx" );
        case "intro":
        case "ruins":
        case "courtyard_activity":
        case "platform_crawl":
        case "security_office":
            common_scripts\utility::flag_set( "start_water_splash_fx" );
        default:
            break;
    }
}

_id_467E()
{
    common_scripts\utility::flag_wait( "start_water_splash_fx" );
    common_scripts\utility::exploder( 9100 );
    common_scripts\utility::exploder( 9250 );
    common_scripts\utility::exploder( 5500 );
    common_scripts\utility::exploder( 530 );
    common_scripts\utility::exploder( 5700 );
    common_scripts\utility::flag_wait( "stop_water_splash_fx" );
    maps\_utility::_id_261A( 9100 );
    maps\_utility::_id_261A( 5500 );
    maps\_utility::_id_261A( 5800 );
    maps\_utility::_id_261A( 530 );
    maps\_utility::_id_261A( 5700 );
    common_scripts\utility::exploder( 8000 );
    common_scripts\utility::exploder( 3500 );
    common_scripts\utility::exploder( 1234 );
    maps\_utility::_id_261A( 9250 );
    common_scripts\utility::flag_wait( "re_start_water_splash_fx" );
    common_scripts\utility::exploder( 9100 );
    common_scripts\utility::exploder( 530 );
    maps\_utility::_id_261A( 3500 );
    maps\_utility::_id_261A( 5000 );
    maps\_utility::_id_261A( 1234 );
}

_id_467F( var_0 )
{
    var_1 = "";

    if ( isdefined( var_0 ) )
        var_1 = var_0;
    else if ( isdefined( level.player._id_1AE2 ) )
        var_1 = level.player._id_1AE2._id_1AE3;
    else
        var_1 = level._id_1AE2._id_1AE3;

    return level._id_1AE4[var_1];
}

_id_4680( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0.transitiontime;

    maps\_utility::_id_1AF7( var_0, var_1 );
    wait(var_1);
}

_id_4681()
{
    common_scripts\utility::flag_wait( "castle_intro_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 80;
    var_0._id_1AF5 = 90;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_intro_a_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 84;
    var_0._id_1AF5 = 92;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_courtyard_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 85;
    var_0._id_1AF5 = 95;
    var_0._id_1AF6 = 8;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_courtyard_a_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 80;
    var_0._id_1AF5 = 95;
    var_0._id_1AF6 = 5;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_bridge_crossing_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 70;
    var_0._id_1AF5 = 110;
    _id_4680( var_0, 0.5 );
    common_scripts\utility::flag_wait( "castle_bridge_crossing_a_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 70;
    var_0._id_1AF5 = 90;
    var_0._id_1AF6 = 5;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_interior_exterior_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 70;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_control_room_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 70;
    var_0._id_1AF6 = 5;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_courtyard_battle_fog" );
    var_0 = _id_467F( "castle_courtyard" );
    var_0._id_1AF4 = 80;
    var_0._id_1AF5 = 90;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_courtyard_battle_a_fog" );
    var_0 = _id_467F( "castle_courtyard" );
    var_0._id_1AF4 = 80;
    var_0._id_1AF5 = 95;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_bridge_explosion_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 45;
    var_0._id_1AF5 = 75;
    _id_4680( var_0, 1 );
    common_scripts\utility::flag_wait( "castle_bridge_explosion_jump_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0._id_1AF4 = 75;
    var_0._id_1AF5 = 90;
    _id_4680( var_0, 4 );
    common_scripts\utility::flag_wait( "castle_escape_fog" );
    var_0 = _id_467F( "castle_exterior" );
    var_0.startdist = 1000;
    var_0.halfwaydist = 10000;
    var_0.maxopacity = 0.4;
    var_0.sunfogenabled = 0;
    _id_4680( var_0, 1.5 );
}

_id_4682()
{
    var_0 = getentarray( "set_ents_visible", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_4683, 1 );
    var_1 = getentarray( "set_ents_hidden", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::_id_4683, 0 );
}

_id_4683( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger" );
        maps\castle_code::_id_8100( self._id_164F, var_0 );
    }
}

_id_0238()
{
    var_0 = getentarray( "spotlight_generator", "targetname" );

    foreach ( var_2 in var_0 )
    {
        playfxontag( common_scripts\utility::getfx( "gen_lamp_glow_white" ), var_2, "tag_fx_bulb_1" );
        playfxontag( common_scripts\utility::getfx( "gen_lamp_glow_white" ), var_2, "tag_fx_bulb_2" );
        playfxontag( common_scripts\utility::getfx( "gen_lamp_glow_white" ), var_2, "tag_fx_bulb_3" );
    }
}
