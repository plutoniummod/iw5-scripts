// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = common_scripts\utility::get_target_ent( "courtyard_btr_blocker" );
    var_0 connectpaths();
    var_0 notsolid();
    common_scripts\utility::flag_init( "courtyard_retreat_one" );
    common_scripts\utility::flag_init( "new_courtyard_start" );
    common_scripts\utility::flag_init( "retreat_three" );
    common_scripts\utility::flag_init( "retreat_two" );
    common_scripts\utility::flag_init( "courtyard_air_drop" );
    common_scripts\utility::flag_init( "tunnel_convoy_two" );
    common_scripts\utility::flag_init( "long_convoy_move_two" );
    common_scripts\utility::flag_init( "pre_courtyard_ally_clean_up" );
    common_scripts\utility::flag_init( "plaza_btrs_new_attack" );
    common_scripts\utility::flag_init( "btr_attack_plaza" );
    common_scripts\utility::flag_init( "btr_dead_now" );
    common_scripts\utility::flag_init( "player_take_out_btr" );
    common_scripts\utility::flag_init( "rebels_two" );
    common_scripts\utility::flag_init( "can_shoot_player_courtyard" );
    common_scripts\utility::flag_init( "can_shoot_player" );
    common_scripts\utility::flag_init( "fire_flare" );
    common_scripts\utility::flag_init( "fire_flare_two" );
    common_scripts\utility::flag_init( "sniper_shot" );
    common_scripts\utility::flag_init( "heli_support_courtyard" );
    common_scripts\utility::flag_init( "courtyard_combat_start" );
    common_scripts\utility::flag_init( "roof_all_standing" );
    common_scripts\utility::flag_init( "roof_start_to_stand" );
    common_scripts\utility::flag_init( "apart_blowup_window_2nd" );
    common_scripts\utility::flag_init( "plaza_see" );
    common_scripts\utility::flag_init( "plaza_see_two" );
    common_scripts\utility::flag_init( "plaza_see_two_two" );
    common_scripts\utility::flag_init( "player_at_gate" );
    common_scripts\utility::flag_init( "courtyard_player_moving_too_fast" );
    common_scripts\utility::flag_init( "plaza_move_sandman_up" );
    common_scripts\utility::flag_init( "plaza_move_sandman_up_two" );
    common_scripts\utility::flag_init( "turn_death_trigger_on" );
    common_scripts\utility::flag_init( "tank_attack_building" );
    common_scripts\utility::flag_init( "kill_sniper_nag_lines" );
    common_scripts\utility::flag_init( "turn_death_trigger_on_for_btr" );
    common_scripts\utility::flag_init( "turn_on_laser_moment" );
    common_scripts\utility::flag_init( "sandman_start_first_take_down" );
    common_scripts\utility::flag_init( "soap_over_the_fence" );
    common_scripts\utility::flag_init( "spotlight_aim_at_player" );
    common_scripts\utility::flag_init( "spotlight_aim_at_sandman" );
    precacheshader( "nightvision_overlay_goggles" );
    precacheshellshock( "nightvision" );
    precachemodel( "weapon_usp_silencer" );
    precachemodel( "weapon_rpg7_obj" );
    precachemodel( "weapon_rpg7" );
    precachestring( &"PRAGUE_HINT_USE_SHORT_SCOPE" );
    maps\_utility::add_hint_string( "short_scope", &"PRAGUE_HINT_USE_SHORT_SCOPE", ::_id_78DB );
    common_scripts\utility::array_thread( getentarray( "dead_body_spawner_trigger_ally", "targetname" ), maps\prague_code::_id_53A7 );
    maps\_utility::_id_27CA( "courtyard_puzzle_guys", maps\prague_courtyard_script_code::_id_7861 );
    maps\_utility::_id_27CA( "courtyard_roof_dying_quick_kill", maps\prague_courtyard_script_code::_id_7861 );
    maps\_utility::_id_27CA( "courtyard_heli_flyby", maps\prague_code::_id_523A );
    maps\_utility::_id_27CB( "plaza_loader", maps\prague_courtyard_script_code::_id_7873 );
    maps\_utility::_id_27CB( "plaza_loader", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CB( "courtyard_backup", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CA( "apt_resistance_drone_spawner_under", _id_524A::_id_5201, "cleanup_dead_bodies_three" );
    maps\_utility::_id_27CA( "roof_stealth_one", maps\prague_courtyard_script_code::_id_7857 );
    maps\_utility::_id_27CA( "roof_stealth_two", maps\prague_courtyard_script_code::_id_7857 );
    maps\_utility::_id_27CA( "courtyard_rpg_guy_build_one", maps\prague_code::_id_5314 );
    maps\_utility::_id_27CA( "courtyard_rpg_guy_build_one", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "courtyard_ar_guy_build_one", maps\prague_code::_id_5314 );
    maps\_utility::_id_27CA( "courtyard_ar_guy_build_one", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "courtyard_ar_guy_build_two", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "courtyard_rpg_guy_build_two", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "courtyard_rpg_guy_build_two_third", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "courtyard_ar_guys_build_three", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "courtyard_ar_guys_build_four", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "plaza_resistance_drone_runner_3", maps\prague_plaza_script::_id_78BC );
    maps\_utility::_id_27CA( "plaza_resistance_drone_runner_2", maps\prague_plaza_script::_id_78BC );
    maps\_utility::_id_27CA( "plaza_resistance_drone_runner_1", maps\prague_plaza_script::_id_78BC );
    maps\_utility::_id_27CA( "roof_stealth_epic", maps\prague_courtyard_script_code::_id_7857 );
    maps\_utility::_id_27CA( "roof_stealth_epic", maps\prague_courtyard_script_code::_id_785C );
    maps\_utility::_id_27CA( "plaza_btr_attack", _id_524A::_id_5201, "start_apartment_fight" );
    maps\_utility::_id_27CA( "courtyard_support_ai", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CA( "courtyard_support_ai_two", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CA( "courtyard_support_ai_three", maps\prague_courtyard_script_code::_id_786D );
    level._id_5DC5 = 0;
    level._id_789C = 0;
    level._id_7858 = 0;
    level._id_7847 = 0;
    level._id_78CB = 0;
    level._id_78D9 = 15;
    var_1 = getent( "battle_1_guys", "target" );
    var_1 common_scripts\utility::trigger_off();
}

_id_643A()
{
    level.player maps\_utility::vision_set_fog_changes( "prague_redbuilding", 1 );
    maps\prague_code::_id_523D();
    maps\prague_code::_id_523F( "start_courtyard" );
    common_scripts\utility::flag_set( "start_sewers" );
    common_scripts\utility::flag_set( "player_out_of_water" );
    common_scripts\utility::flag_set( "start_alcove" );
    common_scripts\utility::flag_set( "start_alley" );
    common_scripts\utility::flag_set( "start_long_convoy" );
    common_scripts\utility::flag_set( "fade_up" );
    common_scripts\utility::flag_set( "city_reveal" );
    common_scripts\utility::flag_set( "start_kamarov_scene" );
    common_scripts\utility::flag_set( "start_follow_soap" );
    wait 0.3;
    common_scripts\utility::flag_set( "start_courtyard" );
    maps\prague_code::_id_52E8();
}

_id_78DA()
{
    var_0 = getent( "detect_damage_clear_stealth", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "start_courtyard" );
    thread _id_78DC();
    thread maps\prague_courtyard_script_code::_id_7864();
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    common_scripts\utility::flag_clear( "sandman_killfirms" );
    common_scripts\utility::flag_wait( "new_courtyard_start" );
    level._id_45C0._id_0FC6 = 1;
    thread maps\prague_courtyard_script_code::_id_786C();
    thread maps\prague_courtyard_script_code::_id_7878();
    thread maps\prague_courtyard_script_code::_id_783A();
    thread maps\prague_courtyard_script_code::_id_7840();
    thread maps\prague_courtyard_script_code::_id_7860();
    thread maps\prague_courtyard_script_code::_id_7843();
    thread maps\prague_courtyard_script_code::_id_783B();
    level endon( "player_gonna_die" );
    var_1 = maps\_utility::_id_272C( "courtyard_puzzle_guys" );
    common_scripts\utility::array_thread( var_1, _id_524A::_id_5201, "cleanup_puzzle" );
    maps\_utility::_id_2797( 84 );
    thread _id_524A::_id_520A( "plaza_smoke" );
    level._id_45C0 notify( "stop_path" );
    level._id_45C0 allowedstances( "stand", "crouch", "prone" );

    if ( !common_scripts\utility::flag( "sandman_climb_dumpster" ) )
    {
        level._id_45C0 notify( "clear_idle_anim" );
        level._id_45C0 maps\_utility::_id_26FC();
        level._id_45C0 maps\_utility::_id_109E();
        level._id_45C0 maps\_utility::_id_2712();
        maps\prague_code::_id_52E8();
        level._id_45C0 maps\_utility::_id_2713();
    }

    var_2 = getaiarray( "axis" );
    maps\_utility::delaythread( 3, maps\prague_code::_id_5247, var_2, "ru", 9, 9, 0 );
    thread maps\prague_courtyard_script_code::_id_783D();
    thread maps\prague_courtyard_script_code::_id_783F();
    thread maps\prague_courtyard_script_code::_id_7862();
    thread maps\prague_courtyard_script_code::_id_7842();
    thread maps\prague_courtyard_script_code::_id_783C();
    thread maps\prague_plaza_script::_id_78BF();
    thread maps\prague_courtyard_script_code::_id_7869();
    thread maps\prague_courtyard_script_code::_id_7844();
    thread maps\prague_courtyard_script_code::_id_789E();
}

_id_78DB()
{
    var_0 = level.player getweaponslist( "primary" );
    var_1 = 0;

    foreach ( var_3 in var_0 )
    {
        if ( issubstr( var_3, "hybrid" ) )
        {
            var_1 = 1;
            break;
        }
    }

    var_5 = level.player getcurrentweapon();
    var_6 = issubstr( var_5, "alt_" ) && issubstr( var_5, "hybrid" );
    var_7 = !issubstr( var_5, "silence" );
    return !var_1 || var_6 || var_7;
}

_id_78DC()
{
    var_0 = common_scripts\utility::get_target_ent( "cqbwalk_trigger" );
    var_0 waittill( "trigger" );
    level._id_45C0 maps\_utility::_id_109B();
}
