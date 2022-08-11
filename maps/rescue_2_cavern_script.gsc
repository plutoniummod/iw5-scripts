// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    precacheshader( "compass_map_rescue_start" );
    precacheshader( "compass_map_rescue_outside" );
    precacheshader( "compass_map_rescue_entrance" );
    precacheshader( "compass_map_rescue_ending" );
    precacheshellshock( "default" );
    precacheshellshock( "rescue_chopper_drag" );
    precacheshellshock( "rescue_chopper_drag_2" );
    precachemodel( "prop_flex_cuff" );
    precachemodel( "weapon_desert_eagle_iw5" );
    precachemodel( "viewhands_player_yuri_europe" );
    precachemodel( "viewlegs_generic" );
    precachemodel( "vehicle_blackhawk_hero_sas_night" );
    precachemodel( "weapon_m16_clip_iw5" );
    precachemodel( "weapon_parabolic_knife" );
    precachemodel( "mil_semtex_belt" );
    precachemodel( "mil_semtex_belt_obj" );
    precachemodel( "mil_semtex_belt_des_sequence_02" );
    precachemodel( "mil_semtex_belt_des_sequence_03" );
    precachemodel( "mil_semtex_belt_des_sequence_04" );
    precachemodel( "weapon_m84_flashbang_grenade" );
    precachemodel( "weapon_m84_flashbang_grenade_obj" );
    precachemodel( "weapon_rappel_rope_long" );
    precachemodel( "weapon_rappel_rope_long_obj" );
    precachemodel( "weapon_carabiner_thin_rope" );
    precachemodel( "vehicle_little_bird_minigun_right" );
    precachemodel( "weapon_minigun" );
    precacheitem( "deserteagle" );
    precacheitem( "smoke_grenade_american" );
    precacheitem( "heli_minigun_noai" );
    precacheshader( "hint_mantle" );
    maps\rescue_2_anim_props::main();
    maps\_utility::_id_27CA( "dead_daughter", maps\rescue_2_cavern_code::_id_5E5F );
    maps\_utility::_id_27CA( "rescue_heli", maps\rescue_2_cavern_code::_id_5E29 );
    maps\_utility::_id_27CA( "rescue_heli_backup", maps\rescue_2_cavern_code::_id_5E29 );
    maps\_utility::_id_27CB( "animate", maps\rescue_2_cavern_code::_id_5E46 );
    maps\_utility::_id_27CB( "animate_then_idle", maps\rescue_2_cavern_code::_id_5E47 );
    maps\_utility::_id_27CB( "animate_then_die", maps\rescue_2_cavern_code::_id_5E48 );
    maps\_utility::_id_27CB( "cavern_end_drone", maps\rescue_2_cavern_code::_id_5E77 );
    maps\_utility::_id_27CB( "disable_autoaim", maps\rescue_2_cavern_code::_id_5E7F );
    maps\_utility::_id_27CB( "gimme_deaths", maps\rescue_2_cavern_code::_id_5E81 );
    common_scripts\utility::array_thread( getentarray( "moveup_when_clear", "targetname" ), maps\rescue_2_cavern_code::_id_5E44 );
    common_scripts\utility::array_thread( getentarray( "cleanup_ai_in_volume", "targetname" ), maps\rescue_2_cavern_code::_id_588A );
    common_scripts\utility::array_thread( getentarray( "explosion_trigger", "targetname" ), maps\rescue_2_cavern_code::_id_5E65 );
    common_scripts\utility::array_thread( getentarray( "cavern_shake_trigger", "targetname" ), maps\rescue_2_cavern_code::_id_5E68 );
    common_scripts\utility::array_thread( getentarray( "swinging_light", "targetname" ), maps\rescue_2_cavern_code::_id_5E69 );
    common_scripts\utility::array_thread( getentarray( "primary_fire", "script_noteworthy" ), maps\rescue_2_cavern_code::_id_5E83, "hard_targets_dead" );
    _id_4D6D();
    level._id_5E0E = common_scripts\utility::get_target_ent( "player_rappel_trigger" );
    level._id_5E0E common_scripts\utility::trigger_off();
    thread maps\rescue_2_cavern_code::_id_5E51();
    maps\_readystand_anims::_id_3E77();
    level._id_4BC4 = 8.5;
    level._id_4D34 = "viewhands_player_yuri_europe";
    _id_4D78::_id_4CBC();
    _id_4D78::_id_4D36( ::_id_34CF );
    level._effect["breach_door"] = loadfx( "explosions/breach_door_metal" );
    maps\_utility::_id_26C2( "cavern_breach_exit" );
    maps\rescue_2_cavern_code::_id_5E5C();
    var_0 = common_scripts\utility::get_target_ent( "heli_crash_heli" );
    var_0 hide();
    level._id_5E14 = [];
    var_1 = common_scripts\utility::get_target_ent( "breach_slab_fall" );
    var_1 hide();
    level._id_5E14[level._id_5E14.size] = var_1;
    var_1 = common_scripts\utility::get_target_ent( "breach_slab_fall2" );
    var_1 hide();
    level._id_5E14[level._id_5E14.size] = var_1;
    var_1 = common_scripts\utility::get_target_ent( "breach_slab_fall3" );
    var_1 hide();
    level._id_5E14[level._id_5E14.size] = var_1;
    level._id_5E16 = [];
    var_1 = common_scripts\utility::get_target_ent( "breach_slab_front" );
    var_1 hide();
    level._id_5E16[level._id_5E16.size] = var_1;
    var_1 = common_scripts\utility::get_target_ent( "breach_slab_front2" );
    var_1 hide();
    level._id_5E16[level._id_5E16.size] = var_1;
    var_1 = common_scripts\utility::get_target_ent( "breach_slab_front3" );
    var_1 hide();
    level._id_5E16[level._id_5E16.size] = var_1;
    level._id_5E15 = [];
    var_2 = common_scripts\utility::get_target_ent( "belt_des" );
    var_2 hide();
    level._id_5E15[level._id_5E15.size] = var_2;
    var_3 = var_2 common_scripts\utility::spawn_tag_origin();
    var_3 setmodel( "mil_semtex_belt_des_sequence_03" );
    var_3 hide();
    level._id_5E15[level._id_5E15.size] = var_3;
    var_3 = var_2 common_scripts\utility::spawn_tag_origin();
    var_3 setmodel( "mil_semtex_belt_des_sequence_04" );
    var_3 hide();
    level._id_5E15[level._id_5E15.size] = var_3;
    var_4 = common_scripts\utility::get_target_ent( "player_rappel_bar" );
    var_4 hide();
    level._id_5DF9 = common_scripts\utility::get_target_ent( "floor_breach_charge" );
    level._id_5DF9 hide();
    level._id_5DF9._id_1032 = "semtexbelt";
    level._id_5DF9 maps\_utility::_id_2629( "semtexbelt" );
    level._id_5DF9._id_5DFA = maps\_utility::_id_1287( "semtexbeltnofx", level._id_5DF9.origin );
    level._id_5DF9._id_5DFA.angles = level._id_5DF9.angles;
    level._id_5DF9 thread maps\_anim::_id_1246( level._id_5DF9._id_5DFA, "floor_breach" );
    level._id_5DF9._id_5DFA hide();
    thread _id_34D1();
    var_5 = getent( "cavern_bottom_fan", "targetname" );
    var_5 thread maps\rescue_2_cavern_code::_id_5E7E();
    var_6 = common_scripts\utility::get_target_ent( "cave_entrance_fire" );
    var_6._id_5DE3 = var_6 getlightintensity();
    var_6 setlightintensity( 0 );
    level._id_5DC9 = 9;

    if ( !isdefined( level._id_4080 ) )
    {
        level._id_4080 = 1;
        level._id_0C59["default_civilian"]["run_combat"][0] = %civilian_run_upright;
        level._id_0C59["default_civilian"]["run_hunched_combat"][0] = %civilian_run_hunched_a;
        level._id_0C59["default_civilian"]["run_hunched_combat"][1] = %civilian_run_hunched_c;
        level._id_0C59["default_civilian"]["run_hunched_combat"][2] = %civilian_run_hunched_flinch;
        level._id_0C59["default_civilian"]["run_noncombat"][0] = %civilian_walk_cool;
        var_7 = [];
        var_7[0] = 3;
        var_7[1] = 3;
        var_7[2] = 1;
        level._id_0C59["default_civilian"]["run_hunched_weights"] = common_scripts\utility::get_cumulative_weights( var_7 );
        var_7 = [];
        var_7[0] = 1;
        level._id_0C59["default_civilian"]["run_weights"] = common_scripts\utility::get_cumulative_weights( var_7 );
        level._id_0C59["default_civilian"]["idle_noncombat"][0] = %unarmed_cowerstand_idle;
        level._id_0C59["default_civilian"]["idle_combat"][0] = %unarmed_cowercrouch_idle;
        level._id_0C59["default_civilian"]["idle_combat"][1] = %unarmed_cowercrouch_idle_duck;
        anim._id_400F[0] = %unarmed_cowerstand_react;
        anim._id_400F[1] = %unarmed_cowercrouch_react_a;
        anim._id_400F[2] = %unarmed_cowercrouch_react_b;
    }

    level._id_6115 = "viewhands_player_yuri_europe";
    maps\_dshk_player_rescue::_id_6113();
    var_8 = getent( "cavern_turret", "script_noteworthy" );
    var_8 thread maps\_dshk_player_rescue::_id_6116();
    level._id_2817 = [];
}

_id_3E79()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_cavern" );
    common_scripts\utility::exploder( "cave_door" );

    if ( !isdefined( level._id_02BD ) )
    {
        level._id_02BD = common_scripts\utility::get_target_ent( "new_cave_door_collision" );
        level._id_02BD connectpaths();
        common_scripts\utility::waitframe();
        level._id_02BD delete();
    }

    common_scripts\utility::flag_set( "cavern_door_open" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
}

_id_3E7A()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_cavern_breach" );
    objective_add( maps\_utility::_id_2816( "rescue_prez" ), "current", &"RESCUE_2_OBJ_110" );
    common_scripts\utility::flag_set( "cavern_door_open" );
    common_scripts\utility::flag_set( "start_cavern" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    maps\_utility::_id_26C0( "heroes_stack" );
}

_id_3E7B()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_cavern_top_fight" );
    objective_add( maps\_utility::_id_2816( "rescue_prez" ), "current", &"RESCUE_2_OBJ_110" );
    common_scripts\utility::flag_set( "start_cavern" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_109E );
}

_id_3E7C()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_cavern_rappel" );
    common_scripts\utility::flag_set( "cavern_elevator_going_down_with_prez" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    objective_add( maps\_utility::_id_2816( "rescue_prez" ), "current", &"RESCUE_2_OBJ_110" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_109E );
}

_id_3E7D()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_cavern_bottom_fight_one" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    common_scripts\utility::flag_set( "start_bottom_fight" );
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_109E );
    maps\_utility::_id_26C0( "rappel_color_trigger" );
    thread _id_524A::_id_5213( common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_l" ), common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_r" ) );
}

_id_3E7E()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    maps\rescue_2_code::_id_5DC3( "cavern_president_breach" );
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_set( "price_bang_on_door" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    common_scripts\utility::flag_set( "start_bottom_fight" );
    thread _id_524A::_id_5213( common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_l" ), common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_r" ) );
}

_id_3E7F()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    maps\rescue_2_code::_id_5DC3( "start_cavern_bottom_defend" );
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_set( "start_bottom_fight" );
    common_scripts\utility::flag_set( "start_bottom_defend" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    thread _id_524A::_id_5213( common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_l" ), common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_r" ) );
}

_id_3E80()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    _id_34D0();
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    level._id_5DEF = maps\_vehicle::_id_2A99( "rescue_heli" );
    level._id_5E20 = maps\_vehicle::_id_2A99( "rescue_heli_backup" );
    var_1 = [ level._id_5DEF, level._id_5E20 ];

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 common_scripts\utility::get_target_ent();
        var_4 = var_4 maps\_utility::_id_266B( "struct" );
        var_3 vehicle_teleport( var_4.origin, var_4.angles );
    }

    maps\_spawner::_id_213C( 550 );
    maps\rescue_2_cavern_code::_id_5E5D();
    maps\rescue_2_cavern_code::_id_5E5E();
    maps\rescue_2_code::_id_5DC3( "cavern_bottom_pres_heli" );
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_set( "cavern_run_to_heli" );
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    common_scripts\utility::flag_set( "start_bottom_fight" );
    common_scripts\utility::flag_set( "start_bottom_defend" );
    thread _id_524A::_id_5213( common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_l" ), common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_r" ) );
    thread maps\rescue_2_cavern_code::_id_5E50();
}

_id_34CE()
{
    maps\rescue_2_code::_id_523D();
    maps\rescue_2_code::_id_523E();
    maps\rescue_2_code::_id_5D04();
    maps\rescue_2_code::_id_5D05();
    _id_34D0();
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_set( "start_yard_one" );
    common_scripts\utility::flag_set( "cavern_drop_down" );
    common_scripts\utility::exploder( "bridge_break" );
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    level._id_5DEF = maps\_vehicle::_id_2A99( "rescue_heli" );
    var_1 = common_scripts\utility::get_target_ent( "cavern_heli_land" );
    var_1 = var_1 maps\_utility::_id_266B( "struct" );
    level._id_5DEF vehicle_teleport( var_1.origin, var_1.angles );
    maps\_spawner::_id_213C( 550 );
    maps\rescue_2_code::_id_5DC3( "start_cavern_heli_fly_out" );
    maps\rescue_2_cavern_code::_id_5E6E( 0.05 );
    maps\rescue_2_cavern_code::_id_5E70( level._id_5DEF );
    maps\_utility::_id_26C0( "cavern_run_friendlies_chopper" );
    thread maps\_spawner::_id_2135( getentarray( "cavern_run_chaser", "targetname" ) );
    thread maps\_spawner::_id_2135( getentarray( "cavern_run_chaser_2", "targetname" ) );
    thread _id_524A::_id_5213( common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_l" ), common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_r" ) );
    maps\rescue_2_cavern_code::_id_5E6F( level._id_5DEF );
    level._id_5DEF._id_0A50 notify( "stop_shooting" );
    level._id_5DEF._id_0A50 stopfiring();
    level._id_5DEF clearlookatent();
    common_scripts\utility::flag_set( "cavern_player_gets_on_heli" );
    common_scripts\utility::flag_set( "cavern_player_in_heli" );
    common_scripts\utility::flag_set( "start_delta_last_stand" );
    wait 8;
    var_2 = getentarray( "broken_bridge", "script_noteworthy" );
    common_scripts\utility::array_call( var_2, ::delete );
    maps\rescue_2_cavern_code::_id_5E5D();
    maps\rescue_2_cavern_code::_id_5E5E();
    thread maps\rescue_2_cavern_code::_id_5E50();
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "start_base_alarm" );
    common_scripts\utility::flag_init( "start_chase" );
    common_scripts\utility::flag_init( "bottom_breach_started" );
    common_scripts\utility::flag_init( "cavern_heli_force_land" );
    common_scripts\utility::flag_init( "cavern_drop_down" );
    common_scripts\utility::flag_init( "cavern_door_open" );
    common_scripts\utility::flag_init( "player_mount_rappel" );
    common_scripts\utility::flag_init( "player_starts_rappel" );
    common_scripts\utility::flag_init( "cavern_elevator_going_down_with_prez" );
    common_scripts\utility::flag_init( "price_bang_on_door" );
    common_scripts\utility::flag_init( "start_bottom_defend" );
    common_scripts\utility::flag_init( "cavern_defend_wave_1" );
    common_scripts\utility::flag_init( "cavern_defend_wave_2" );
    common_scripts\utility::flag_init( "cavern_rescue_arrives" );
    common_scripts\utility::flag_init( "cavern_run_to_heli" );
    common_scripts\utility::flag_init( "cavern_heli_landing" );
    common_scripts\utility::flag_init( "rescue_backup_heli_dead" );
    common_scripts\utility::flag_init( "begin_player_shellshock" );
    common_scripts\utility::flag_init( "cavern_player_gets_on_heli" );
    common_scripts\utility::flag_init( "cavern_player_in_heli" );
    common_scripts\utility::flag_init( "the_end" );
    common_scripts\utility::flag_init( "lots_of_time" );
    common_scripts\utility::flag_set( "lots_of_time" );
}

_id_34CF( var_0 )
{
    level notify( "breach_explosion" );
}

_id_34D0()
{
    var_0 = getent( "president", "script_noteworthy" );
    level._id_58BA = var_0 maps\_utility::_id_166F( 1 );
    level._id_58BA._id_1032 = "president";
    level._id_58BA thread maps\_utility::_id_0D04();
}

_id_34D1()
{
    maps\_compass::setupminimap( "compass_map_rescue_start", "start_minimap_corner" );
    maps\_utility::_id_2822( "cavern_hole_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2822( "cavern_holetop_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2822( "cavern_holesnow_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2822( "cavern_holebottom_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2822( "fireroom_fx_trigger" );

    if ( !common_scripts\utility::flag( "hard_targets_dead" ) )
    {
        common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2761, "start_bay_sequence", "step_run_water" );
        level.player thread maps\_utility::_id_2761( "hard_targets_dead", "step_run_plr_water" );
    }

    common_scripts\utility::flag_wait( "open_bay_double_doors" );
    maps\_compass::setupminimap( "compass_map_rescue_outside", "outside_minimap_corner" );
    common_scripts\utility::flag_wait( "hard_targets_dead" );
    common_scripts\utility::flag_set( "start_bay_sequence" );
    level notify( "level_cleanup" );
    wait 0.1;
    common_scripts\utility::flag_wait( "cavern_drop_down" );
    maps\_compass::setupminimap( "compass_map_rescue_entrance", "entrance_minimap_corner" );
    maps\_utility::_id_2822( "mine_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2826( "cavern_hole_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2826( "cavern_holetop_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2826( "cavern_holebottom_fx_trigger" );
    wait 0.1;
    maps\_utility::_id_2826( "cavern_holesnow_fx_trigger" );
    common_scripts\utility::flag_wait( "start_bottom_fight" );
    maps\_compass::setupminimap( "compass_map_rescue_ending", "ending_minimap_corner" );
    level notify( "level_cleanup" );
    wait 0.1;
    common_scripts\utility::flag_wait( "start_bottom_defend" );
    maps\_utility::_id_2822( "cavern_holetop_fx_trigger" );
    wait 0.1;
    common_scripts\utility::flag_wait( "begin_player_shellshock" );
    maps\_utility::_id_2822( "cavern_hole_fx_trigger" );
    wait 0.1;
}
