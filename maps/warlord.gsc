// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "warlord" );
    level.friendlyfiredisabled = 0;
    level.cosine["45"] = cos( 45 );
    level.confrontation_weapon = "fnfiveseven_warlord_end";
    setsaveddvar( "r_specularcolorscale", 2 );
    setsaveddvar( "sm_sunshadowscale", 0.8 );
    precachestring( &"VARIABLE_SCOPE_SNIPER_MAG" );
    precachestring( &"VARIABLE_SCOPE_SNIPER_ZOOM" );
    precachestring( &"WARLORD_INTROSCREEN_LINE1" );
    precachestring( &"WARLORD_INTROSCREEN_LINE2" );
    precachestring( &"WARLORD_INTROSCREEN_LINE3" );
    precachestring( &"WARLORD_INTROSCREEN_LINE4" );
    precachestring( &"WARLORD_INTROSCREEN_LINE5" );
    precachestring( &"WARLORD_OBJ_FOLLOW_PRICE" );
    precachestring( &"WARLORD_OBJ_COVER_PRICE_AND_SOAP" );
    precachestring( &"WARLORD_OBJ_MOVE_THROUGH_SHANTY" );
    precachestring( &"WARLORD_OBJ_COMMANDEER_TECHNICAL" );
    precachestring( &"WARLORD_OBJ_EVADE_MORTAR_FIRE" );
    precachestring( &"WARLORD_OBJ_COVER_PRICE" );
    precachestring( &"WARLORD_OBJ_ENTER_COMPOUND" );
    precachestring( &"WARLORD_OBJ_DESTROY_TECHNICAL" );
    precachestring( &"WARLORD_OBJ_CAPTURE_WARLORD" );
    precachestring( &"WARLORD_OBJ_POINTER_PROTECT" );
    precachestring( &"WARLORD_OBJ_POINTER_CAPTURE" );
    precachestring( &"WARLORD_OBJ_POINTER_DESTROY" );
    precachestring( &"WARLORD_HINT_CROUCH" );
    precachestring( &"WARLORD_MORTAR_DEATH" );
    precachestring( &"WARLORD_PRONE_DEATH" );
    precachestring( &"WARLORD_STEALTH_DEATH" );
    precachemodel( "viewmodel_m14_ebr" );
    precachemodel( "projectile_rpg7" );
    precachemodel( "weapon_truck_m2_50cal_mg_viewmodel" );
    precachemodel( "com_folding_chair" );
    precachemodel( "accessories_gas_canister_highrez" );
    precachemodel( "com_crate01" );
    precachemodel( "afr_pipe_gate_01" );
    precachemodel( "paris_crowbar_01" );
    precachemodel( "afr_chem_crate_01" );
    precachemodel( "weapon_machette" );
    precachemodel( "viewhands_yuri" );
    precachemodel( "viewhands_player_yuri" );
    precachemodel( "africa_civ_male_notburned" );
    precachemodel( "africa_civ_male_burned" );
    precachemodel( "vehicle_mi17_africa_palette" );
    precacheitem( "ak47_silencer_reflex" );
    precacheitem( level.confrontation_weapon );
    precacheitem( "fnfiveseven" );
    precacheshellshock( "slowview" );
    precacherumble( "falling_land" );
    precacherumble( "subtle_tank_rumble" );
    precacherumble( "viewmodel_small" );
    precacherumble( "viewmodel_medium" );
    precacherumble( "viewmodel_large" );
    maps\_utility::_id_1E74( "start_stealth_intro", ::_id_6E67, "", ::_id_6E68 );
    maps\_utility::_id_1E74( "start_log_encounter", ::_id_6E69, "", ::_id_6E6A );
    maps\_utility::_id_1E74( "start_burn_encounter", ::_id_6E6B, "", ::_id_6E6C );
    maps\_utility::_id_1E74( "start_river_big_moment", ::_id_6E6D, "", ::_id_6E6E );
    maps\_utility::_id_1E74( "start_infiltration", ::_id_6E72, "", ::_id_6E73 );
    maps\_utility::_id_1E74( "start_advance", ::_id_6E74, "", ::_id_6E75 );
    maps\_utility::_id_1E74( "start_technical", ::_id_6E76, "", ::_id_6E77 );
    maps\_utility::_id_1E74( "start_mortar_run", ::_id_6E78, "", ::_id_6E79 );
    maps\_utility::_id_1E74( "start_player_mortar", ::_id_6E7A, "", ::_id_6E7B );
    maps\_utility::_id_1E74( "start_assault", ::_id_5FBB, "", ::_id_6E7C );
    maps\_utility::_id_1E74( "start_super_technical", ::_id_6E7D, "", ::_id_6E7E );
    maps\_utility::_id_1E74( "start_confrontation", ::_id_6E7F, "", ::_id_6E80 );
    maps\warlord_precache::main();
    maps\createart\warlord_art::main();
    maps\_load::_id_1F5C( "viewhands_player_yuri" );
    common_scripts\utility::flag_init( "allies_spawned" );
    common_scripts\utility::flag_init( "play_river_dialogue" );
    common_scripts\utility::flag_init( "warlord_advance" );
    common_scripts\utility::flag_init( "warlord_technical" );
    common_scripts\utility::flag_init( "warlord_mortar_run" );
    common_scripts\utility::flag_init( "warlord_player_mortar" );
    common_scripts\utility::flag_init( "warlord_assault" );
    common_scripts\utility::flag_init( "warlord_protect" );
    common_scripts\utility::flag_init( "compound_technical_dead" );
    common_scripts\utility::flag_init( "church_breach_complete" );
    common_scripts\utility::flag_init( "mortar_technical" );
    common_scripts\utility::flag_init( "church_side_door_open" );
    common_scripts\utility::flag_init( "river_encounter_done" );
    common_scripts\utility::flag_init( "price_past_log" );
    common_scripts\utility::flag_init( "price_ready_to_reach_door" );
    common_scripts\utility::flag_init( "soap_ready_to_reach_door" );
    common_scripts\utility::flag_init( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_init( "river_encounter_3_begin" );
    common_scripts\utility::flag_init( "river_encounter_3_complete" );
    common_scripts\utility::flag_init( "river_house_burn_execution_setup" );
    common_scripts\utility::flag_init( "river_house_burn_execution" );
    common_scripts\utility::flag_init( "river_burn_interrupted" );
    common_scripts\utility::flag_init( "jeer_guy_leave" );
    common_scripts\utility::flag_init( "price_post_bridge" );
    common_scripts\utility::flag_init( "soap_post_bridge" );
    common_scripts\utility::flag_init( "end_river_big_moment" );
    common_scripts\utility::flag_init( "clean_up_river" );
    common_scripts\utility::flag_init( "inf_stealth_spotted" );
    common_scripts\utility::flag_init( "start_inf_door_open" );
    common_scripts\utility::flag_init( "infiltration_over" );
    common_scripts\utility::flag_init( "inf_factory_breach" );
    common_scripts\utility::flag_init( "inf_factory_breach_done" );
    common_scripts\utility::flag_init( "advance_done" );
    common_scripts\utility::flag_init( "technical_combat_door_open" );
    common_scripts\utility::flag_init( "delete_destroyed_technicals" );
    common_scripts\utility::flag_init( "mortar_timer_done" );
    common_scripts\utility::flag_init( "mortar_introduce" );
    common_scripts\utility::flag_init( "mortar_fight_shot_2" );
    common_scripts\utility::flag_init( "compound_truck_left" );
    common_scripts\utility::flag_init( "price_moving_to_pipe" );
    common_scripts\utility::flag_init( "ready_to_open_grate" );
    common_scripts\utility::flag_init( "breach_starting" );
    common_scripts\utility::flag_init( "river_allies_stand" );
    common_scripts\utility::flag_init( "player_show_gun" );
    maps\_patrol_anims::main();
    maps\warlord_anim::main();
    maps\_drone_civilian::init();
    maps\_drone_ai::init();
    maps\warlord_aud::main();
    maps\warlord_fx::main();
    maps\_load::main();
    maps\_stealth::main();
    maps\warlord_stealth::_id_6BB3();

    if ( !level.console )
        setsaveddvar( "r_ssaostrength", 0 );

    maps\warlord_vo::main();
    maps\_utility::add_hint_string( "neck_stab_hint", &"SCRIPT_PLATFORM_OILRIG_HINT_STEALTH_KILL", maps\warlord_code::_id_6D3C );
    maps\_utility::add_hint_string( "crouch_hint", &"WARLORD_HINT_CROUCH", maps\warlord_code::_id_6C8B );
    maps\_utility::add_hint_string( "crouch_hint_stance", &"WARLORD_HINT_CROUCH_STANCE", maps\warlord_code::_id_6C8B );
    maps\_utility::add_hint_string( "crouch_hint_toggle", &"WARLORD_HINT_CROUCH_TOGGLE", maps\warlord_code::_id_6C8B );
    maps\_utility::add_hint_string( "crouch_hint_hold", &"WARLORD_HINT_CROUCH_HOLD", maps\warlord_code::_id_6C8B );
    maps\_utility::add_hint_string( "prone_hint", &"WARLORD_HINT_PRONE", maps\warlord_code::_id_6CFB );
    maps\_utility::add_hint_string( "prone_hint_stance", &"WARLORD_HINT_PRONE_STANCE", maps\warlord_code::_id_6CFB );
    maps\_utility::add_hint_string( "prone_hint_toggle", &"WARLORD_HINT_PRONE_TOGGLE", maps\warlord_code::_id_6CFB );
    maps\_utility::add_hint_string( "prone_hint_hold", &"WARLORD_HINT_PRONE_HOLD", maps\warlord_code::_id_6CFB );
    maps\_utility::add_hint_string( "switch_hint", &"WARLORD_HINT_WEAPON_SWITCH", maps\warlord_code::_id_6D68 );
    level.hint_binding_map = [];
    level.hint_binding_map["crouch"][0] = [ "togglecrouch", "crouch_hint_toggle" ];
    level.hint_binding_map["crouch"][1] = [ "+stance", "crouch_hint_stance" ];
    level.hint_binding_map["crouch"][2] = [ "gocrouch", "crouch_hint" ];
    level.hint_binding_map["crouch"][3] = [ "+movedown", "crouch_hint_hold" ];
    level.hint_binding_map["prone"][0] = [ "toggleprone", "prone_hint_toggle" ];
    level.hint_binding_map["prone"][1] = [ "+stance", "prone_hint_stance" ];
    level.hint_binding_map["prone"][2] = [ "goprone", "prone_hint" ];
    level.hint_binding_map["prone"][3] = [ "+prone", "prone_hint_hold" ];
    maps\warlord_utility::_id_6B83();
    maps\_weapon_mortar60mm::main( &"WARLORD_HINT_USE_MORTAR", 32, 41, 9, 5, 448, 200, 15000, 150, 0.4, 256, 3100, 3100, undefined, 0 );
    thread maps\warlord_obj::_id_6BEB();
    level.variable_scope_weapons = [ "m14ebr_scoped_silenced_warlord" ];
    thread maps\_shg_common::_id_1676();
    maps\_compass::setupminimap( "compass_map_warlord" );
    maps\warlord_utility::_id_6BAD();
}

_id_6E67()
{
    maps\_audio::aud_send_msg( "start_stealth_intro" );
}

_id_6E68()
{
    level.player maps\warlord_stealth::_id_6BB5();
    maps\warlord_stealth::_id_6BC3();
    maps\warlord_code::_id_6C54();
    thread maps\warlord_code::_id_6C5B();
    thread maps\warlord_code::_id_6C52();
    thread maps\warlord_code::_id_6C61();
    thread maps\warlord_code::_id_6C8E();
}

_id_6E69()
{
    maps\_audio::aud_send_msg( "start_river_big_moment" );
    _id_6E6F( "player_log_start", "price_log_start", "soap_log_start" );
    maps\_utility::vision_set_fog_changes( "warlord_intro", 0 );
    level.player maps\warlord_stealth::_id_6BB5();
    maps\warlord_stealth::_id_6BD5();
    maps\warlord_stealth::_id_6BD3();
    thread maps\warlord_code::_id_6C5B();
    common_scripts\utility::flag_set( "obj_first_follow_price" );
    maps\_utility::delaythread( 2, maps\warlord_code::_id_6C8F );
    maps\_utility::delaythread( 4, maps\warlord_code::_id_6C90 );
}

_id_6E6A()
{
    thread maps\warlord_code::_id_6CAB();
    thread maps\warlord_code::_id_6C91();
}

_id_6E6B()
{
    maps\_audio::aud_send_msg( "start_river_big_moment" );
    _id_6E6F( "player_burn_start", "price_burn_start", "soap_burn_start" );
    maps\_utility::vision_set_fog_changes( "warlord_intro", 0 );
    level.player maps\warlord_stealth::_id_6BB5();
    maps\warlord_stealth::_id_6BD5();
    maps\warlord_stealth::_id_6BD3();
    common_scripts\utility::flag_set( "obj_first_follow_price" );
    thread maps\warlord_code::_id_6C5B();
    thread maps\warlord_code::_id_6CAB();
    wait 2;
    common_scripts\utility::flag_set( "river_prone_encounter_spawn" );
    common_scripts\utility::flag_set( "price_ready_to_reach_door" );
    common_scripts\utility::flag_set( "soap_ready_to_reach_door" );
    common_scripts\utility::flag_set( "river_house_door_open" );
    common_scripts\utility::flag_set( "river_encounter_3_complete" );
}

_id_6E6C()
{
    thread maps\warlord_code::_id_6CA7();
    thread maps\warlord_code::_id_6CB0();
    thread maps\warlord_code::_id_6CCA();
    thread maps\warlord_code::_id_6CAC();
}

_id_6E6D()
{
    maps\_audio::aud_send_msg( "start_river_big_moment" );
    _id_6E6F( "player_river_start", "price_river_start", "soap_river_start" );
    maps\_utility::vision_set_fog_changes( "warlord_intro", 0 );
    level.player maps\warlord_stealth::_id_6BB5();
    maps\warlord_stealth::_id_6BD5();
    maps\warlord_stealth::_id_6BD3();
    thread maps\warlord_code::_id_6CA1();
    common_scripts\utility::flag_set( "obj_first_follow_price" );
    maps\_utility::delaythread( 2, maps\_utility::_id_26BF, "trig_path_to_big_moment" );
}

_id_6E6E()
{
    thread maps\warlord_code::_id_6CDD();
    thread maps\warlord_code::_id_6CCB();
    thread maps\warlord_code::_id_6D02();
    thread maps\warlord_code::_id_6D18();
    thread maps\warlord_code::_id_0135();
    thread maps\warlord_code::_id_6D38();
    var_0 = getent( "start_infiltration_trigger", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "end_river_big_moment" );
    wait 0.05;
}

_id_6E6F( var_0, var_1, var_2 )
{
    maps\warlord_code::spawn_allies();
    maps\_shg_common::move_player_to_start( var_0 );

    if ( isdefined( var_1 ) )
    {
        level._id_4877 maps\warlord_utility::_id_6B8D( var_1 );
        level._id_4877 setgoalpos( maps\_utility::_id_2281( level._id_4877.origin ) );
    }

    if ( isdefined( var_2 ) )
    {
        level._id_54E0 maps\warlord_utility::_id_6B8D( var_2 );
        level._id_54E0 setgoalpos( maps\_utility::_id_2281( level._id_54E0.origin ) );
    }
}

_id_6E70()
{
    maps\_stealth_utility::_id_4342();
    level._id_54E0 maps\_utility::_id_104A( "ak47_reflex", "primary" );
    level._id_4877 maps\_utility::_id_104A( "ak47_reflex", "primary" );
}

_id_6E71()
{
    level.player maps\warlord_utility::_id_6B9D( "m14ebr_scoped_silenced_warlord", level.player._id_1005 );
}

_id_6E72()
{
    maps\_audio::aud_send_msg( "start_infiltration" );
    _id_6E6F( "player_infiltration_start", "price_infiltration_start", "soap_infiltration_start" );
    maps\_utility::vision_set_fog_changes( "warlord_shanty", 0 );
    level.player maps\warlord_stealth::_id_6BB5();
    maps\warlord_stealth::_id_6BCD();
    maps\warlord_stealth::_id_6BD5();
    maps\warlord_stealth::_id_6BD3();
    common_scripts\utility::flag_set( "infiltrate_encounter_1" );
    common_scripts\utility::flag_set( "price_post_bridge" );
    common_scripts\utility::flag_set( "soap_post_bridge" );
    thread maps\warlord_code::_id_6D38();
}

_id_6E73()
{
    common_scripts\utility::flag_init( "start_inf_snipe_encounter_1" );
    maps\_utility::_id_1C32();
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level._id_4877.ignoreall = 1;
        level._id_54E0.ignoreall = 1;
    }

    level.player._id_1FE1 = 0;
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    thread maps\warlord_code::_id_6D23();
    thread maps\warlord_code::_id_6D26();
    thread maps\warlord_code::_id_6D53();
    var_0 = getent( "inf_fence_down", "targetname" );
    var_1 = var_0.origin;
    var_0.origin = ( 0.0, 0.0, 0.0 );
    thread maps\warlord_code::_id_6D4C( var_0, var_1 );
    common_scripts\utility::flag_wait( "start_inf_door_open" );
    maps\_utility::_id_1C32();
    thread maps\warlord_code::_id_6D47();
    thread maps\warlord_code::_id_6D63();
    thread maps\warlord_code::_id_6D4B();
    thread maps\warlord_code::_id_6D5B();
    thread maps\warlord_code::_id_6D66();
    thread maps\warlord_code::_id_6D65();
}

_id_6E74()
{
    maps\_audio::aud_send_msg( "start_advance" );
    _id_6E6F( "player_advance_start", "price_advance_start", "soap_advance_start" );
    maps\_utility::vision_set_fog_changes( "warlord_shanty", 0 );
    _id_6E70();
    common_scripts\utility::flag_set( "obj_move_through_shanty_given" );
    common_scripts\utility::flag_set( "inf_factory_breach_done" );
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();
    level._id_4877 maps\warlord_code::_id_6E35( "node_price_inf_6" );
    common_scripts\utility::flag_set( "warlord_advance" );
}

_id_6E75()
{
    common_scripts\utility::flag_wait( "warlord_advance" );
    _id_6E81( "advance_start" );
    level._id_4877 maps\_utility::_id_109E();
    level._id_54E0 maps\_utility::_id_109E();
    thread maps\warlord_code::_id_6D69();
    thread maps\warlord_code::_id_6D6F();
    thread maps\warlord_code::_id_6D74();
    common_scripts\utility::flag_wait( "advance_done" );
    common_scripts\utility::flag_set( "warlord_technical" );
}

_id_6E76()
{
    maps\_audio::aud_send_msg( "start_technical" );
    _id_6E6F( "player_technical_start", "price_technical_start", "soap_technical_start" );
    maps\_utility::vision_set_fog_changes( "warlord_shanty", 0 );
    _id_6E70();
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();
    level._id_4877._id_6D75 = 1;
    level._id_54E0._id_6D75 = 1;
    common_scripts\utility::flag_set( "advance_go_loud_complete" );
    common_scripts\utility::flag_set( "obj_move_through_shanty_given" );
    common_scripts\utility::flag_set( "obj_go_loud_given" );
    common_scripts\utility::flag_set( "obj_follow_price_advance_given" );
    common_scripts\utility::flag_set( "warlord_technical" );
    common_scripts\utility::flag_set( "inf_factory_breach_done" );
    maps\_audio::aud_send_msg( "mus_to_technical" );
}

_id_6E77()
{
    common_scripts\utility::flag_wait( "warlord_technical" );
    common_scripts\utility::flag_init( "move_anim_technical_clip" );
    common_scripts\utility::flag_init( "technical_gunner_dead" );
    common_scripts\utility::flag_init( "mortar_technical_hit" );
    common_scripts\utility::flag_init( "player_on_technical" );
    common_scripts\utility::flag_init( "player_get_on_technical_abort" );
    common_scripts\utility::flag_init( "player_boarding_technical" );
    common_scripts\utility::flag_init( "technical_combat_started" );
    var_0 = getent( "technical_ground", "targetname" );
    var_0 hide();
    level.exploderfunction = maps\warlord_utility::_id_6B85;
    level._id_54E0.goalradius = 1024;
    level thread maps\warlord_code::_id_6D7A();
    level thread maps\warlord_code::_id_6D77();
    level thread maps\warlord_code::_id_6D8B();
    level thread maps\warlord_code::_id_6D95();
    thread maps\warlord_code::_id_6DB3();
    thread maps\warlord_code::_id_6D90();
    var_1 = getentarray( "mortar_rubble", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    common_scripts\utility::flag_wait( "turret_ready_to_use" );
    common_scripts\utility::flag_set( "player_technical_dialogue" );
    common_scripts\utility::flag_wait( "technical_combat_started" );
    level._id_6D79 thread maps\warlord_code::_id_6DA8( level._id_6BF1 );
    common_scripts\utility::flag_set( "obj_follow_price_advance_complete" );
    common_scripts\utility::flag_set( "obj_commandeer_technical_given" );
    level waittill( "turret_finished" );
    common_scripts\utility::flag_set( "warlord_mortar_run" );
    level.exploderfunction = common_scripts\utility::exploder_after_load;
}

_id_6E78()
{
    maps\_audio::aud_send_msg( "start_mortar_run" );
    _id_6E6F( "player_mortar_run_start", "price_mortar_run_start", "soap_mortar_run_start" );
    maps\_utility::vision_set_fog_changes( "warlord_shanty", 0 );
    _id_6E70();
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();
    thread _id_6E71();
    var_0 = getentarray( "mortar_rubble", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 show();

    var_4 = getentarray( "technical_blocker_graph", "targetname" );

    foreach ( var_6 in var_4 )
    {
        var_6 connectpaths();
        var_6 delete();
    }

    common_scripts\utility::flag_set( "warlord_mortar_run" );
}

_id_6E79()
{
    common_scripts\utility::flag_wait( "warlord_mortar_run" );
    common_scripts\utility::flag_set( "mortar_run_dialogue" );
    _id_6E81( "mortar_run_start" );
    level._id_54E0 maps\warlord_code::_id_6DB9();
    level._id_4877 maps\warlord_code::_id_6DB9();
    thread maps\warlord_code::_id_6DBA();
    thread maps\warlord_code::_id_6DDE();
}

_id_6E7A()
{
    maps\_audio::aud_send_msg( "start_player_mortar" );
    _id_6E6F( "player_player_mortar_start", "price_player_mortar_start", "soap_player_mortar_start" );
    maps\_utility::vision_set_fog_changes( "warlord_shanty", 0 );
    _id_6E70();
    level.player _id_6E71();
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();
    level._id_54E0 maps\warlord_utility::_id_460E();
    common_scripts\utility::flag_set( "warlord_player_mortar" );
    common_scripts\utility::flag_set( "mortar_operator_off" );
    common_scripts\utility::flag_set( "flag_mortar_obj_2" );
    common_scripts\utility::flag_set( "flag_mortar_obj_3" );
    common_scripts\utility::flag_set( "flag_mortar_obj_mortar" );
}

_id_6E7B()
{
    common_scripts\utility::flag_wait( "warlord_player_mortar" );
    level notify( "warlord_player_mortar" );
    _id_6E81( "player_mortar_start" );
    thread maps\warlord_code::_id_6DE0();
    thread maps\warlord_code::_id_6DE1();
    thread maps\warlord_code::_id_6DEC();
    thread maps\warlord_code::_id_6DED();
    thread maps\warlord_code::_id_6DEE();
    level._id_54E0 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2713();
    level._id_4877 maps\_utility::_id_2520();
    level._id_4877 maps\_utility::_id_2713();
}

_id_5FBB()
{
    maps\_audio::aud_send_msg( "start_assault" );
    _id_6E6F( "player_assault_start", "price_assault_start", "soap_assault_start" );
    maps\_utility::vision_set_fog_changes( "warlord_camp", 0 );
    _id_6E70();
    level.player _id_6E71();
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();
    level._id_54E0 maps\warlord_utility::_id_460E();
    common_scripts\utility::flag_set( "warlord_assault" );
    common_scripts\utility::flag_set( "price_moving_to_pipe" );
    common_scripts\utility::flag_set( "assault_run_to_pipe" );
}

_id_6E7C()
{
    common_scripts\utility::flag_wait( "warlord_assault" );
    _id_6E81( "assault_start" );
    maps\_audio::aud_send_msg( "warlord_assault" );
    thread maps\warlord_code::_id_6DF1();
    thread maps\warlord_code::_id_6DF3();
    thread maps\warlord_code::_id_6DF7();
    thread maps\warlord_code::_id_6DF8();
    thread maps\warlord_code::_id_6DFA();
    thread maps\warlord_code::_id_6DFB();
}

_id_6E7D()
{
    maps\_audio::aud_send_msg( "start_super_technical" );
    _id_6E6F( "player_super_technical_start", "price_super_technical_start", "soap_super_technical_start" );
    maps\_utility::vision_set_fog_changes( "warlord_camp", 0 );
    _id_6E70();
    level.player _id_6E71();
    level._id_4877 maps\_utility::_id_2520();
    level._id_54E0 maps\_utility::_id_2520();
    maps\_utility::_id_26BF( "trig_price_enter_compound_house" );
    maps\_utility::_id_26BF( "trig_soap_enter_compound_house" );
}

_id_6E7E()
{
    level.player thread maps\warlord_code::_id_6E01();
    thread maps\warlord_code::_id_0136();
    thread maps\warlord_code::_id_6E02();
    thread maps\warlord_code::_id_6E13();
    thread maps\warlord_code::_id_6E10();
    thread maps\warlord_code::_id_6E11();
    thread maps\warlord_code::_id_6E12();
    thread maps\warlord_code::_id_6E14();
    thread maps\warlord_code::_id_6E15();
    thread maps\warlord_code::_id_6E1D();
    thread maps\warlord_code::_id_6E22();
}

_id_6E7F()
{
    maps\_audio::aud_send_msg( "start_player_breach" );
    _id_6E6F( "player_confrontation_start", "price_confrontation_start", "soap_confrontation_start" );
    maps\_utility::vision_set_fog_changes( "warlord_church", 0 );
    _id_6E70();
    level.player _id_6E71();
    common_scripts\utility::flag_set( "warlord_player_breach" );
    common_scripts\utility::flag_set( "church_breach_complete" );
}

_id_6E80()
{
    common_scripts\utility::flag_wait( "warlord_player_breach" );
    common_scripts\utility::flag_set( "aud_warlord_player_breach" );
    level notify( "warlord_church_breach" );
    _id_6E81( "player_breach_start" );
    thread maps\warlord_code::_id_6E1F();
    thread _id_00E9();
    thread maps\warlord_code::_id_6E2C();
}

_id_00E9()
{
    common_scripts\utility::flag_wait( "exiting_courtyard" );
    var_0 = getent( "church", "targetname" );
    var_1 = getent( "yard", "targetname" );
    remapstage( var_0.origin, var_1.origin );
}

_id_6E81( var_0 )
{
    wait 0.05;
    maps\_utility::_id_1425( var_0 );
}
