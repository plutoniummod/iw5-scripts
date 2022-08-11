// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "ny_manhattan" );
    level._id_46EA = 1;
    level._id_456C = 1;
    level.vision_uav = "ny_manhattan_predator";
    level._id_3C1E = "tag_camera";
    level._id_3BD7 = "remote_missile_ny";
    common_scripts\utility::flag_init( "entering_hind" );
    common_scripts\utility::flag_init( "player_on_hindgun" );
    common_scripts\utility::flag_init( "briefing_done" );
    common_scripts\utility::flag_init( "manhattan_battle_complete" );
    common_scripts\utility::flag_init( "heat_battle_initial_complete" );
    common_scripts\utility::flag_init( "broad_squad_moveup" );
    common_scripts\utility::flag_init( "broad_squad_moveup_again" );
    common_scripts\utility::flag_init( "broad_hind_strafe_setup" );
    common_scripts\utility::flag_init( "broad_hind_strafe" );
    common_scripts\utility::flag_init( "obj_broad_marker_off" );
    common_scripts\utility::flag_init( "finished_hide_ride" );
    common_scripts\utility::flag_init( "heat_combat_humvees" );
    common_scripts\utility::flag_init( "hind_hover_waves_complete" );
    common_scripts\utility::flag_init( "player_shot_or_advanced" );
    common_scripts\utility::flag_init( "player_shot" );
    common_scripts\utility::flag_init( "player_advanced" );
    common_scripts\utility::flag_init( "player_used_hybrid" );
    common_scripts\utility::flag_init( "hind_start_point" );
    common_scripts\utility::flag_init( "flashbang_start" );
    common_scripts\utility::flag_init( "sandman_kick_start" );
    common_scripts\utility::flag_init( "flashbang_done" );
    common_scripts\utility::flag_init( "punish_player" );
    common_scripts\utility::flag_init( "intro_rubble_impact" );
    common_scripts\utility::flag_init( "reno_truck_take_left" );
    common_scripts\utility::flag_init( "start_open_manhole_cinematic" );
    common_scripts\utility::flag_init( "jammer1_dead" );
    common_scripts\utility::flag_init( "jammer2_dead" );
    common_scripts\utility::flag_init( "allies_into_chopper" );
    common_scripts\utility::flag_init( "out_of_sewer" );
    common_scripts\utility::flag_init( "show_pda" );
    common_scripts\utility::flag_init( "hide_pda" );
    common_scripts\utility::flag_init( "no_briefing_start" );
    common_scripts\utility::flag_init( "sandman_ambush_lines" );
    common_scripts\utility::flag_init( "lobby_delta2_in_position" );
    common_scripts\utility::flag_init( "lobby_sandman_in_position" );
    common_scripts\utility::flag_init( "flashbang_open_door" );
    common_scripts\utility::flag_init( "thermite_planted" );
    common_scripts\utility::flag_init( "thermite_detonated" );
    common_scripts\utility::flag_init( "has_usp" );
    common_scripts\utility::flag_init( "players_first_shot" );
    common_scripts\utility::flag_init( "mulekick_done" );
    common_scripts\utility::flag_init( "give_predator" );
    common_scripts\utility::flag_init( "broad_humvee_dead" );
    common_scripts\utility::flag_init( "broad_hind_attractor_first_time" );
    common_scripts\utility::flag_init( "broad_humvee_explosion" );
    common_scripts\utility::flag_init( "exchange_humvee_go" );
    common_scripts\utility::flag_init( "bravo_defended" );
    common_scripts\utility::flag_init( "predator_defend_complete" );
    common_scripts\utility::flag_init( "rooftop_defend_complete" );
    common_scripts\utility::flag_init( "predator_phase2" );
    common_scripts\utility::flag_init( "blackhawk_at_rooftop" );
    common_scripts\utility::flag_init( "predator_wave1_dead" );
    common_scripts\utility::flag_init( "predator_wave2_dead" );
    common_scripts\utility::flag_init( "bravo_killed" );
    common_scripts\utility::flag_init( "predator_hind_deadly" );
    common_scripts\utility::flag_init( "predator_hind_dead" );
    common_scripts\utility::flag_init( "player_used_predator" );
    common_scripts\utility::flag_init( "predator_player_ranaway" );
    common_scripts\utility::flag_init( "predator_player_ranaway_clear" );
    common_scripts\utility::flag_init( "predator_hit_line_success" );
    common_scripts\utility::flag_init( "obj_predator_given" );
    common_scripts\utility::flag_init( "hind_finale_start" );
    common_scripts\utility::flag_init( "jammer_guys_dead" );
    common_scripts\utility::flag_init( "predator_lookat_changed" );
    common_scripts\utility::flag_init( "nyse_start_point" );
    common_scripts\utility::flag_init( "trk_lookout" );
    common_scripts\utility::flag_init( "snd_werehit" );
    common_scripts\utility::flag_init( "rno_hangon" );
    common_scripts\utility::flag_init( "trk_goingdown" );
    common_scripts\utility::flag_init( "snd_pressureinpedals" );
    common_scripts\utility::flag_init( "rno_braceforimpact" );
    common_scripts\utility::flag_init( "snd_enroute" );
    common_scripts\utility::flag_init( "spawn_bravo_early" );
    common_scripts\utility::flag_init( "15broad_highguys_dead" );
    common_scripts\utility::flag_init( "uav_in_use" );
    common_scripts\utility::flag_init( "squad_at_roof" );
    common_scripts\utility::flag_init( "player_has_xm" );
    common_scripts\utility::flag_init( "sandman_on_blackhawk" );
    common_scripts\utility::flag_init( "player_can_jump_on_blackhawk" );
    common_scripts\utility::flag_init( "sandman_animating" );
    common_scripts\utility::flag_init( "player_backtracked" );
    common_scripts\utility::flag_init( "hind_dmg_hint" );
    common_scripts\utility::flag_init( "player_used_xm25" );
    common_scripts\utility::flag_init( "player_used_ads" );
    common_scripts\utility::flag_init( "fb_leader_flashbanged" );
    common_scripts\utility::flag_init( "nyse_player_up_top" );
    common_scripts\utility::flag_init( "level_started_fx" );
    common_scripts\utility::flag_init( "obj_follow_to_hind_given" );
    common_scripts\utility::flag_init( "obj_broad_given" );
    common_scripts\utility::flag_init( "obj_broad_complete" );
    common_scripts\utility::flag_init( "obj_follow_to_exchange_complete" );
    common_scripts\utility::flag_init( "obj_capturehind_given" );
    common_scripts\utility::flag_init( "obj_capturehind_complete" );
    common_scripts\utility::flag_init( "obj_follow_through_buildings_given" );
    common_scripts\utility::flag_init( "obj_follow_through_buildings_complete" );
    common_scripts\utility::flag_init( "obj_nyse_rally_given" );
    common_scripts\utility::flag_init( "obj_nyse_rally_complete" );
    common_scripts\utility::flag_init( "obj_follow_to_roof_given" );
    common_scripts\utility::flag_init( "obj_follow_to_roof_complete" );
    common_scripts\utility::flag_init( "obj_climb_ladder_given" );
    common_scripts\utility::flag_init( "obj_climb_ladder_complete" );
    common_scripts\utility::flag_init( "obj_jammer_given" );
    common_scripts\utility::flag_init( "obj_jammer_complete" );
    setsaveddvar( "r_specularcolorscale", "2.5" );
    setdvarifuninitialized( "demo_itiot", 0 );
    level._id_2070 = 64;
    level._id_4807 = 0;
    level._id_4808 = getent( "hind_target", "targetname" );
    level._id_4809 = getent( "start_manhattan_battle", "targetname" );
    precachemodel( "weapon_blackhawk_minigun" );
    precachemodel( "weapon_blackhawk_minigun_viewmodel" );
    precachemodel( "viewmodel_magnifier" );
    thread _id_4815();
    _id_062C::main();
    _id_03C9::main();
    _id_03CA::main();
    maps\ny_manhattan_aud::main();
    maps\ny_manhattan_anim::main();
    maps\_compass::setupminimap( "compass_map_dcemp_static" );
    maps\_predator2::main();
    _id_066D::init();
    precachestring( &"NY_MANHATTAN_INTROSCREEN_LINE1" );
    precachestring( &"NY_MANHATTAN_INTROSCREEN_LINE2" );
    precachestring( &"NY_MANHATTAN_INTROSCREEN_LINE3" );
    precachestring( &"NY_MANHATTAN_INTROSCREEN_LINE4" );
    precachestring( &"NY_MANHATTAN_INTROSCREEN_LINE5" );
    precachestring( &"NY_MANHATTAN_BRAVO_KILLED" );
    precachestring( &"NY_MANHATTAN_OBJ_CLIMB_TO_ROOF" );
    precachestring( &"NY_MANHATTAN_OBJ_BROAD" );
    precachestring( &"NY_MANHATTAN_OBJ_ROOF" );
    precachestring( &"NY_MANHATTAN_OBJ_RALLY_LOBBY" );
    precachestring( &"NY_MANHATTAN_OBJ_JAMMER" );
    precachestring( &"NY_MANHATTAN_OBJ_USEREAPER" );
    precachestring( &"NY_MANHATTAN_FLASHBANG" );
    precachestring( &"NY_MANHATTAN_PREDATOR" );
    precachestring( &"INVASION_DRONE_PICKUP" );
    precachestring( &"NY_MANHATTAN_ITIOT" );
    precachestring( &"NY_MANHATTAN_HINT_ADS" );
    precachestring( &"NY_MANHATTAN_HINT_ADS_TOGGLE" );
    precachestring( &"NY_MANHATTAN_HINT_FRAG" );
    precachestring( &"NY_MANHATTAN_HINT_XM25" );
    precachestring( &"NY_MANHATTAN_HINT_SNAPTO" );
    precachestring( &"NY_MANHATTAN_HINT_HYBRID" );
    precachestring( &"NY_MANHATTAN_HINT_HIND_DMG" );
    precachestring( &"NY_MANHATTAN_HINT_HIND_DMG_PRED" );
    precachestring( &"NY_MANHATTAN_HINT_OBJECTIVE" );
    precachestring( &"NY_MANHATTAN_DEATH_BROAD_HIND" );
    precachestring( &"NY_MANHATTAN_HINT_THERMITE_SWITCH" );
    precachestring( &"NY_MANHATTAN_HINT_THERMITE_DETONATE" );
    precachestring( &"NY_MANHATTAN_HINT_SHOOT_PREDATOR" );
    precachestring( &"NY_MANHATTAN_WARN_BACKTRACK" );
    maps\_utility::add_hint_string( "hint_flashbang", &"NY_MANHATTAN_FLASHBANG" );
    maps\_utility::add_hint_string( "hint_predator", &"NY_MANHATTAN_PREDATOR", ::_id_4816 );
    maps\_utility::add_hint_string( "hint_ads", &"NY_MANHATTAN_HINT_ADS", ::_id_480A );
    maps\_utility::add_hint_string( "hint_ads_toggle", &"NY_MANHATTAN_HINT_ADS_TOGGLE", ::_id_480A );
    maps\_utility::add_hint_string( "hint_ads_empty", "", ::_id_480A );
    maps\_utility::add_hint_string( "hint_frag", &"NY_MANHATTAN_HINT_FRAG" );
    maps\_utility::add_hint_string( "hint_xm25", &"NY_MANHATTAN_HINT_XM25", ::_id_480B );
    maps\_utility::add_hint_string( "hint_snapto", &"NY_MANHATTAN_HINT_SNAPTO", ::_id_480C );
    maps\_utility::add_hint_string( "hint_hybrid", &"NY_MANHATTAN_HINT_HYBRID", ::_id_480D );
    maps\_utility::add_hint_string( "hint_hind_dmg", &"NY_MANHATTAN_HINT_HIND_DMG", ::_id_480E );
    maps\_utility::add_hint_string( "hint_hind_dmg_predator", &"NY_MANHATTAN_HINT_HIND_DMG_PRED", ::_id_480E );
    maps\_utility::add_hint_string( "hint_predator_shoot", &"NY_MANHATTAN_HINT_SHOOT_PREDATOR", ::_id_4812 );
    maps\_utility::add_hint_string( "hint_thermite_detonate", &"NY_MANHATTAN_HINT_THERMITE_DETONATE", ::_id_4810 );
    maps\_utility::add_hint_string( "hint_thermite_switch", &"NY_MANHATTAN_HINT_THERMITE_SWITCH", ::_id_4811 );
    maps\_utility::add_hint_string( "hint_obj", &"NY_MANHATTAN_HINT_OBJECTIVE", ::_id_480F );
    maps\_utility::add_hint_string( "hint_backtrack", &"NY_MANHATTAN_WARN_BACKTRACK", ::_id_4813 );
    precacheitem( "m4_grunt_reflex" );
    precacheitem( "m4_grunt_reflex_optim" );
    precacheitem( "m4_hybrid_grunt_optim" );
    precacheitem( "m4_hybrid_grunt_reflex_optim" );
    precacheitem( "rpg_straight" );
    precacheitem( "rpg_cheap" );
    precacheitem( "tomahawk_missile" );
    precacheitem( "ssn12_missile" );
    precacheitem( "zippy_rockets" );
    precacheitem( "usp" );
    precacheitem( "ninebang_grenade" );
    precacheitem( "claymore" );
    precacheitem( "remote_missile_detonator" );
    precacherumble( "c130_flyby" );
    precacherumble( "damage_heavy" );
    precacherumble( "steady_rumble" );
    precacherumble( "falling_land" );
    precacheshellshock( "default" );
    precachemodel( "body_delta_elite_assault_aa" );
    precacheshader( "dpad_thermite_bomb_static" );
    maps\_utility::_id_1E74( "Intro", ::_id_4809, "Intro", ::_id_4827 );
    maps\_utility::_id_1E74( "Manhattan Skip Briefing", ::_id_481D, "Manhattan Skip Briefing", ::_id_4828 );
    maps\_utility::_id_1E74( "15 Broad", ::_id_481E, "15 Broad", ::_id_4829 );
    maps\_utility::_id_1E74( "Tiffanys", ::_id_4823, "Tiffanys", ::_id_482A );
    maps\_utility::_id_1E74( "Stock Exchange", ::_id_481F, "Stock Exchange", ::_id_482B );
    maps\_utility::_id_1E74( "Jammer", ::_id_4820, "Jammer", ::_id_482C );
    maps\_utility::_id_1E74( "Hind Ride", ::_id_4825, "Hind Ride", ::_id_482E );
    maps\_utility::_id_1E74( "Hind Finale", ::_id_4826, "Hind Finale", ::_id_482F );
    common_scripts\utility::flag_init( "off_fire_light" );
    thread _id_483F();
    thread _id_483D();
    thread _id_483E();
    thread _id_483C();
    _id_063D::main();
    maps\_load::main();
    maps\_c4::main( "thermite", "weapon_thermite_device", "weapon_thermite_device_obj" );
    maps\_remotemissile::init();
    thread _id_483A();
    thread maps\ny_manhattan_code_intro::_id_4612();
    thread maps\ss_util::_id_4426();
    thread _id_4814();
    thread _id_4818();
    level._id_1441 = maps\_utility::_id_27AB( "steady_rumble" );
    level._id_1441.intensity = 0;
    level.friendlyfire["max_participation"] = 2000;
    level.friendlyfire["point_loss_interval"] = 2.5;
    level.player._id_1FE1 = 2000;
    maps\_utility::_id_1A5A( "axis", maps\ny_manhattan_code_intro::_id_45B1 );
    maps\_utility::_id_1A5A( "allies", maps\ny_manhattan_code_intro::_id_45B1 );
    var_0 = getaiarray();

    foreach ( var_2 in var_0 )
        var_2.drawoncompass = 0;

    setsaveddvar( "compassmaxrange", 6000 );
    _id_4830();

    if ( !isdefined( level._id_456C ) )
        level._id_4483 thread maps\ny_blackhawk::_id_456B( 0 );

    level._id_4599 = maps\_utility::_id_1287( "player_rig" );
    level._id_45FA = maps\_utility::_id_1287( "player_legs" );
    level._id_4599 hide();
    level._id_45FA hide();
}

_id_480A()
{
    if ( level.player buttonpressed( "BUTTON_LTRIG" ) )
        return 1;

    return 0;
}

_id_480B()
{
    var_0 = level.player getcurrentprimaryweapon();

    if ( issubstr( var_0, "xm25" ) )
        return 1;

    return 0;
}

_id_480C()
{
    if ( level.player getlocalplayerprofiledata( "autoAim" ) == 0 )
        return 1;

    return 0;
}

_id_480D()
{
    if ( common_scripts\utility::flag( "backtrack_warn" ) || common_scripts\utility::flag( "player_used_hybrid" ) )
        return 1;

    if ( level.player getcurrentweapon() != "alt_m4_hybrid_grunt_optim" )
        return 1;

    return 0;
}

_id_480E()
{
    if ( isdefined( level._id_4431 ) && level._id_4431 == 1 )
        return 1;

    if ( common_scripts\utility::flag( "uav_in_use" ) )
        return 1;

    if ( common_scripts\utility::flag( "predator_hind_dead" ) )
        return 1;

    return 0;
}

_id_480F()
{
    if ( common_scripts\utility::flag( "hind_dmg_hint" ) )
        return 1;

    if ( common_scripts\utility::flag( "broad_hind_strafe_setup" ) )
        return 1;

    return 0;
}

_id_4810()
{
    if ( common_scripts\utility::flag( "thermite_detonated" ) )
        return 1;

    if ( level.player getcurrentweapon() != "thermite" )
        return 1;

    return 0;
}

_id_4811()
{
    if ( level.player getcurrentweapon() == "thermite" )
        return 1;

    return 0;
}

_id_4812()
{
    if ( level.player attackbuttonpressed() )
        return 1;

    if ( !common_scripts\utility::flag( "uav_in_use" ) )
        return 1;

    return 0;
}

_id_4813()
{
    if ( !common_scripts\utility::flag( "backtrack_warn" ) )
        return 1;

    return 0;
}

_id_4814()
{
    for (;;)
    {
        level.player waittill( "weapon_change", var_0 );

        if ( var_0 == "m4_hybrid_grunt_optim" )
        {
            common_scripts\utility::flag_set( "player_used_hybrid" );
            break;
        }
    }
}

_id_4815()
{
    var_0 = isgodmode( level.player );

    for (;;)
    {
        if ( isdefined( level._id_4483 ) )
        {
            if ( isgodmode( level.player ) != var_0 )
            {
                var_0 = isgodmode( level.player );
                level._id_4483.godmode = var_0;
            }
        }

        wait 0.5;
    }
}

_id_4816()
{
    if ( common_scripts\utility::flag( "uav_in_use" ) )
        return 1;

    if ( common_scripts\utility::flag( "hind_dmg_hint" ) )
        return 1;

    if ( common_scripts\utility::flag( "entering_hind" ) )
        return 1;

    if ( common_scripts\utility::flag( "predator_hind_dead" ) )
        return 1;

    if ( common_scripts\utility::flag( "backtrack_warn" ) )
        return 1;

    return 0;
}

_id_4817()
{
    return common_scripts\utility::flag( "start_open_manhole_cinematic" );
}

_id_4818()
{
    level._id_4819 = 0;
    maps\_utility::_id_1A5A( "axis", ::_id_481A );
}

_id_481A()
{
    if ( !isalive( self ) )
        return;

    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_2 ) && issubstr( var_2, "xm25" ) )
    {
        level._id_4819++;

        if ( level._id_4819 == 30 )
            level.player maps\_utility::_id_1E39( "THIS_IS_MY_BOOMSTICK" );
    }
}

_id_481B()
{
    wait 3;
    maps\_audio::aud_send_msg( "play_random_temp_vo", 5 );
}

_id_481C( var_0 )
{
    level._id_45A3 = [];
    var_1 = getentarray( "squad_1", "targetname" );
    var_2 = [];
    var_2[var_2.size] = getent( var_0 + "_1", "targetname" );
    var_2[var_2.size] = getent( var_0 + "_2", "targetname" );
    var_2[var_2.size] = getent( var_0 + "_3", "targetname" );
    var_3 = 0;

    foreach ( var_5 in var_1 )
    {
        var_6 = var_5 maps\_utility::_id_166F();

        if ( var_6.script_noteworthy == "leader" )
        {
            level._id_45C0 = var_6;
            level._id_45C0._id_1032 = "lonestar";
        }
        else if ( var_6.script_noteworthy == "truck" )
        {
            level._id_45C4 = var_6;
            level._id_45C4._id_1032 = "truck";
        }
        else
        {
            level._id_45A6 = var_6;
            level._id_45A6._id_1032 = "reno";
        }

        var_6 maps\_utility::_id_279F( var_2[var_3] );
        var_6 maps\_utility::_id_0D04();
        level._id_45A3[level._id_45A3.size] = var_6;
        var_3++;
    }

    var_8 = getent( var_0, "targetname" );
    level.player maps\_utility::_id_279F( var_8 );
    maps\ny_manhattan_code_intro::_id_3F72( level._id_46EA );
    thread maps\ny_manhattan_code_intro::_id_45A2();
}

_id_4809()
{
    maps\_audio::aud_send_msg( "start_manhattan_battle" );
    common_scripts\utility::flag_set( "level_started_fx" );
    level.player setchannelvolume( "ambdist1", 0 );
    level.player setchannelvolume( "ambdist2", 0 );
}

_id_481D()
{
    maps\_audio::aud_send_msg( "start_no_briefing" );
    common_scripts\utility::flag_set( "briefing_done" );
    common_scripts\utility::flag_set( "out_of_sewer" );
    common_scripts\utility::flag_set( "sandman_sewer_exit_moveup" );
    common_scripts\utility::flag_set( "no_briefing_start" );
    common_scripts\utility::flag_set( "level_started_fx" );
    common_scripts\utility::flag_set( "player_shot_or_advanced" );
    _id_481C( "start_post_sewer" );
    maps\_utility::_id_26BF( "ally_colors_first_combat" );
    maps\_utility::_id_26BF( "ally_colors_first_combat_blue" );
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan", 0 );
    thread maps\ny_manhattan_code_intro::_id_45AF();
    level._id_45C0.name = "Sandman";
}

_id_481E()
{
    maps\_audio::aud_send_msg( "start_fifteen_broad" );
    common_scripts\utility::flag_set( "level_started_fx" );
    thread maps\ny_manhattan_code_intro::_id_45F3();
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan_15broad", 0 );
    setsaveddvar( "sm_spotlimit", 4 );
    level._id_4485 = maps\_vehicle::_id_2881( "broad_hind" );
    level._id_4485 thread maps\ny_manhattan_code_intro::_id_45CE();
    thread maps\ny_manhattan_code_intro::_id_45C6();
    _id_481C( "start_15broad" );
    common_scripts\utility::flag_set( "obj_follow_through_buildings_given" );
    common_scripts\utility::flag_set( "broad_squad_moveup" );
    thread maps\ny_manhattan_code_intro::_id_45C3();
    thread maps\ny_manhattan_code_intro::_id_4615();
    level._id_45C0.name = "Sandman";
}

_id_481F()
{
    maps\_audio::aud_send_msg( "start_nyse" );
    common_scripts\utility::flag_set( "level_started_fx" );
    var_0 = getent( "d2_leader", "script_noteworthy" );
    level._id_4639 = var_0 maps\_utility::_id_166F( 1 );
    level._id_4639._id_1032 = "delta2_leader";
    common_scripts\utility::flag_set( "obj_nyse_rally_given" );
    common_scripts\utility::flag_set( "nyse_start_point" );
    common_scripts\utility::flag_set( "broad_squad_moveup" );
    common_scripts\utility::flag_set( "give_xm25" );
    createthreatbiasgroup( "sandman_15_broad" );
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan_nyse", 0 );
    setsaveddvar( "sm_spotlimit", 4 );
    _id_481C( "start_nyse" );
    thread maps\ny_manhattan_code_downtown::_id_4629();
    thread maps\ny_manhattan_code_hind::_id_46BF();
    thread maps\ny_manhattan_code_hind::_id_471B();
    thread maps\ny_manhattan_code_intro::_id_4615();
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_set( "obj_follow_to_roof_given" );
    level._id_45C0.name = "Sandman";
}

_id_4820()
{
    maps\_audio::aud_send_msg( "start_jammer" );
    common_scripts\utility::flag_set( "level_started_fx" );
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan", 0 );
    setsaveddvar( "sm_spotlimit", 1 );
    _id_481C( "start_jammer" );
    var_0 = getent( "start_nyse_grizzly", "targetname" );
    var_1 = getent( "start_nyse_worm", "targetname" );
    var_2 = getent( "start_nyse_thumper", "targetname" );
    level._id_4638 = [];
    var_3 = getentarray( "delta2_spawners", "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = var_5 stalingradspawn();
        var_6 thread maps\_utility::_id_0D04( 1 );
        var_6 maps\_utility::_id_13A4( "r" );
        level._id_4638[level._id_4638.size] = var_6;

        if ( var_6.script_noteworthy == "d2_leader" )
        {
            level._id_4639 = var_6;
            level._id_4639._id_1032 = "delta2_leader";
            continue;
        }

        if ( var_6.script_noteworthy == "worm" )
        {
            level._id_4821 = var_6;
            continue;
        }

        if ( var_6.script_noteworthy == "thumper" )
            level._id_4822 = var_6;
    }

    level._id_4639 maps\_utility::_id_279F( var_0 );
    level._id_4821 maps\_utility::_id_279F( var_1 );
    level._id_4822 maps\_utility::_id_279F( var_2 );
    wait 0.05;
    var_8 = getnode( "node_d2_lobby", "targetname" );
    level._id_4639 maps\_utility::_id_13A4( "o" );
    level._id_4639 setgoalnode( var_8 );
    maps\_utility::_id_26BF( "jammer_start_r_colors" );
    thread maps\ny_manhattan_code_downtown::_id_4629();
    thread maps\ny_manhattan_code_hind::_id_46BF();
    thread maps\ny_manhattan_code_hind::_id_471B();
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_set( "obj_jammer_given" );
    level._id_45C0.name = "Sandman";
}

_id_4823()
{
    common_scripts\utility::flag_set( "level_started_fx" );
    common_scripts\utility::flag_set( "flashbang_done" );
    common_scripts\utility::flag_set( "obj_follow_through_buildings_given" );
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan_alley", 0 );
    setsaveddvar( "sm_spotlimit", 2 );
    setsaveddvar( "sm_qualityspotshadow", 0 );
    maps\_audio::aud_send_msg( "start_stephanies_battle" );
    _id_481C( "start_stephanies_battle" );
    level._id_45C0.name = "Sandman";
}

_id_4824()
{
    maps\_audio::aud_send_msg( "start_hind_ride" );
    common_scripts\utility::flag_set( "level_started_fx" );
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.8 );
    setsaveddvar( "sm_sunshadowscale", 0.65 );
    var_0 = common_scripts\utility::getstruct( "blackhawk_hover", "targetname" );
    var_1 = common_scripts\utility::getstruct( "blackhawk_startpath", "targetname" );
    level._id_4483 = maps\_vehicle::_id_2A99( "hind_vehicle" );
    level._id_4483 vehicle_teleport( var_0 );
    var_2 = level._id_4483;
    var_2.health = 99999;
    maps\ny_manhattan_code_hind::_id_46C2();
    maps\_utility::_id_1FDF( var_2 );
    thread maps\ny_manhattan_code_hind::_id_471B( 1 );
    common_scripts\utility::flag_set( "entering_hind" );
    thread maps\_compass::setupminimap( "compass_map_ny_manhattan" );
    level._id_45C0.name = "Sandman";
}

_id_4825()
{
    common_scripts\utility::flag_init( "end_new_orders_dialogue" );
    common_scripts\utility::flag_set( "level_started_fx" );
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.8 );
    setsaveddvar( "sm_sunshadowscale", 0.65 );
    var_0 = common_scripts\utility::getstruct( "blackhawk_hover", "targetname" );
    var_1 = common_scripts\utility::getstruct( "blackhawk_startpath", "targetname" );
    level._id_4483 = maps\_vehicle::_id_2A99( "hind_vehicle" );
    maps\_audio::aud_send_msg( "start_hind_ride_flight" );
    level._id_4483 thread maps\ny_blackhawk::_id_4591( 1 );
    wait 0.05;
    level._id_4483 vehicle_teleport( var_0.origin, ( 0.0, 0.0, 0.0 ) );
    var_2 = level._id_4483;
    wait 0.05;
    var_2.health = 99999;
    maps\ny_manhattan_code_hind::_id_46C2();
    maps\_utility::_id_1FDF( var_2 );
    common_scripts\utility::flag_set( "hind_start_point" );
    thread maps\ny_manhattan_code_hind::_id_471B( 1 );
    common_scripts\utility::flag_set( "entering_hind" );
    level._id_45C0.name = "Sandman";
}

_id_4826()
{
    common_scripts\utility::flag_init( "end_new_orders_dialogue" );
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.8 );
    setsaveddvar( "sm_sunshadowscale", 0.65 );
    var_0 = maps\_vehicle::_id_2A99( "hind_vehicle" );
    var_0.health = 99999;
    level._id_4483 = var_0;
    maps\_audio::aud_send_msg( "start_hind_finale" );
    level._id_4483 thread maps\ny_blackhawk::_id_4591( 1 );
    maps\ny_manhattan_code_hind::_id_46C2();
    maps\_utility::_id_1FDF( var_0 );
    common_scripts\utility::flag_set( "hind_start_point" );
    thread maps\ny_manhattan_code_hind::_id_471B( 1, 1 );
    level._id_472A = 1;
    common_scripts\utility::flag_set( "entering_hind" );
    var_1 = common_scripts\utility::getstruct( "get_to_player_anim_pos", "targetname" );
    var_2 = common_scripts\utility::getstruct( "get_to_enemy_anim_pos", "targetname" );
    common_scripts\utility::flag_set( "surprise_follower" );
    level._id_4483 maps\_vehicle::_id_2699();
    wait 0.2;
    level._id_4483 notify( "newpath" );
    level._id_4711 notify( "newpath" );
    level._id_4483 setgoalyaw( common_scripts\utility::flat_angle( var_1.angles )[1] );
    level._id_4483 setvehgoalpos( var_1.origin, 1 );
    wait 0.2;
    level._id_4483 vehicle_teleport( var_1.origin, var_1.angles );
    level._id_4711 vehicle_teleport( var_2.origin, var_2.angles );
    wait 0.2;
    common_scripts\utility::flag_set( "start_finale" );
    level._id_45C0.name = "Sandman";
}

_id_4827()
{
    if ( !level._id_4807 )
    {
        thread maps\_introscreen::_id_1D97( 8.5, 5 );
        var_0 = getentarray( "squad_1", "targetname" );
        level._id_45A3 = [];

        foreach ( var_2 in var_0 )
        {
            var_3 = var_2 maps\_utility::_id_166F( 1 );
            level._id_45A3[level._id_45A3.size] = var_3;

            if ( var_3.script_noteworthy == "leader" )
            {
                level._id_45C0 = var_3;
                level._id_45C0._id_1032 = "lonestar";
            }
            else if ( var_3.script_noteworthy == "truck" )
            {
                level._id_45C4 = var_3;
                level._id_45C4._id_1032 = "truck";
            }
            else
                level._id_45A6 = var_3;

            level._id_45A6._id_1032 = "reno";
        }

        thread maps\ny_manhattan_code_intro::_id_45F9();
        maps\ny_manhattan_code_intro::_id_3F72();
        level.player freezecontrols( 1 );
        level.player setplayerangles( ( 15.0, 81.0, 0.0 ) );
        level.player disableweapons();
        wait 4;
        var_5 = [];
        var_5[var_5.size] = &"NY_MANHATTAN_INTROSCREEN_LINE1";
        var_5[var_5.size] = &"NY_MANHATTAN_INTROSCREEN_LINE2";
        var_5[var_5.size] = &"NY_MANHATTAN_INTROSCREEN_FROST";
        var_5[var_5.size] = &"NY_MANHATTAN_INTROSCREEN_LINE3";
        var_5[var_5.size] = &"NY_MANHATTAN_INTROSCREEN_LINE5";
        maps\_introscreen::_id_1D96( var_5 );
    }

    maps\ny_manhattan_code_intro::_id_45A2();
    thread maps\ny_manhattan_code_intro::_id_45AF();
    common_scripts\utility::flag_set( "obj_follow_to_hind_given" );
    thread maps\ny_manhattan_code_intro::_id_45A7();
    common_scripts\utility::flag_wait( "player_at_stephanies" );
    common_scripts\utility::flag_set( "manhattan_battle_complete" );
    thread maps\_autosave::_id_1C41( 0 );
}

_id_4828()
{
    return;
}

_id_4829()
{
    return;
}

_id_482A()
{
    thread maps\ny_manhattan_code_downtown::_id_4629();
    thread maps\ny_manhattan_code_hind::_id_46BF();
    thread maps\ny_manhattan_code_hind::_id_471B();
}

_id_482B()
{
    return;
}

_id_482C()
{
    return;
}

_id_482D()
{
    level waittill( "player_entered_hind" );
    maps\_utility::_id_1425( "starting_blackhawk" );
    common_scripts\utility::flag_wait( "finished_hide_ride" );
}

_id_482E()
{
    thread _id_482D();
    common_scripts\utility::flag_wait( "finished_hide_ride" );
}

_id_482F()
{
    thread _id_482D();
    common_scripts\utility::flag_wait( "finished_hide_ride" );
}

_id_4830()
{
    thread _id_4831();
    thread _id_4832();
    thread _id_4833();
    thread _id_4834();
    thread _id_4835();
    thread _id_4836();
    thread _id_4837();
    thread _id_4838();
    thread _id_4839();
}

_id_4831()
{
    var_0 = getent( "exchange_marker", "targetname" );
    common_scripts\utility::flag_wait( "sandman_sewer_exit_moveup" );
    wait 0.05;
    objective_add( maps\_utility::_id_2816( "obj_follow_to_exchange" ), "active", &"NY_MANHATTAN_OBJ_BROAD", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
}

_id_4832()
{
    var_0 = getent( "broad_marker", "targetname" );
    common_scripts\utility::flag_wait( "obj_broad_given" );
    wait 0.05;
    objective_add( maps\_utility::_id_2816( "obj_follow_to_exchange" ), "active", &"NY_MANHATTAN_OBJ_BROAD", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    common_scripts\utility::flag_wait_either( "obj_broad_marker_off", "broad_hind_start" );
    objective_position( maps\_utility::_id_2816( "obj_follow_to_exchange" ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "obj_follow_through_buildings_given" );
    var_0 = getent( "broad_marker_2", "targetname" );
    objective_add( maps\_utility::_id_2816( "obj_follow_to_exchange" ), "active", &"NY_MANHATTAN_OBJ_BROAD", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
}

_id_4833()
{
    common_scripts\utility::flag_wait( "player_reached_15_broad" );
    common_scripts\utility::flag_wait( "squad_reached_15_broad" );
    wait 0.05;
    objective_delete( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    objective_add( maps\_utility::_id_2816( "obj_follow_to_exchange" ), "active", &"NY_MANHATTAN_OBJ_FOLLOW_THROUGH_BUILDINGS", ( 0.0, 0.0, 0.0 ) );
    objective_onentity( maps\_utility::_id_2816( "obj_follow_to_exchange" ), level._id_45A4 );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
}

_id_4834()
{
    var_0 = getent( "wall_marker", "targetname" );
    common_scripts\utility::flag_wait_either( "tiff_fight_01a", "tiff_guys_dead" );
    wait 0.05;
    objective_delete( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    objective_add( maps\_utility::_id_2816( "obj_follow_to_exchange" ), "active", &"NY_MANHATTAN_OBJ_BROAD", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );
}

_id_4835()
{
    var_0 = getent( "marker_nyse_rally", "targetname" );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );
    wait 0.05;
    objective_delete( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    objective_add( maps\_utility::_id_2816( "obj_follow_to_exchange" ), "active", &"NY_MANHATTAN_OBJ_RALLY_LOBBY", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    common_scripts\utility::flag_wait( "obj_nyse_rally_complete" );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "obj_follow_to_exchange" ) );
    common_scripts\utility::flag_set( "obj_follow_to_roof_given" );
}

_id_4836()
{
    var_0 = getent( "paw_marker", "targetname" );
    var_1 = getent( "marker_nyse_stairs", "targetname" );
    var_2 = getent( "marker_ladder", "targetname" );
    var_3 = getent( "marker_roof", "targetname" );
    common_scripts\utility::flag_wait( "obj_follow_to_roof_given" );
    wait 0.05;
    objective_add( maps\_utility::_id_2816( "obj_follow_to_roof" ), "active", &"NY_MANHATTAN_OBJ_ROOF", var_1.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_roof" ) );
    common_scripts\utility::flag_wait( "dialog_head_up_top" );
    objective_add( maps\_utility::_id_2816( "obj_follow_to_roof" ), "active", &"NY_MANHATTAN_OBJ_ROOF", var_2.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_roof" ) );
    common_scripts\utility::flag_wait( "obj_get_to_ladder" );
    objective_add( maps\_utility::_id_2816( "obj_follow_to_roof" ), "active", &"NY_MANHATTAN_OBJ_CLIMB_TO_ROOF", var_3.origin );
    objective_current( maps\_utility::_id_2816( "obj_follow_to_roof" ) );
    common_scripts\utility::flag_wait( "obj_climb_ladder_complete" );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "obj_follow_to_roof" ) );
    common_scripts\utility::flag_set( "obj_jammer_given" );
}

_id_4837()
{
    var_0 = getent( "jammer", "targetname" );
    common_scripts\utility::flag_wait( "obj_jammer_given" );
    wait 0.05;
    objective_add( maps\_utility::_id_2816( "obj_jammer" ), "active", &"NY_MANHATTAN_OBJ_JAMMER", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_jammer" ) );
    common_scripts\utility::flag_wait( "thermite_planted" );
    objective_add( maps\_utility::_id_2816( "obj_jammer" ), "active", &"NY_MANHATTAN_DETONATE_THERMITE", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_jammer" ) );
    common_scripts\utility::flag_wait( "obj_jammer_complete" );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "obj_jammer" ) );
}

_id_4838()
{
    common_scripts\utility::flag_wait( "obj_predator_given" );
    objective_add( maps\_utility::_id_2816( "obj_predator" ), "active", &"NY_MANHATTAN_OBJ_USEREAPER" );
    objective_current( maps\_utility::_id_2816( "obj_predator" ) );
    common_scripts\utility::flag_wait( "predator_lookat_changed" );
    objective_delete( maps\_utility::_id_2816( "obj_predator" ) );
    objective_add( maps\_utility::_id_2816( "obj_predator" ), "active", &"NY_MANHATTAN_PREDATOR_HIND" );
    objective_current( maps\_utility::_id_2816( "obj_predator" ) );
    objective_onentity( maps\_utility::_id_2816( "obj_predator" ), level._id_4697 );
    objective_setpointertextoverride( maps\_utility::_id_2816( "obj_predator" ), &"NY_MANHATTAN_OBJ_DOT_HIND" );
    common_scripts\utility::flag_wait( "predator_defend_complete" );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "obj_predator" ) );
}

_id_4839()
{
    var_0 = getent( "marker_get_on_blackhawk", "targetname" );
    common_scripts\utility::flag_wait( "blackhawk_at_rooftop" );
    maps\_audio::aud_send_msg( "blackhawk_at_roof" );
    wait 0.05;
    objective_add( maps\_utility::_id_2816( "obj_capturehind" ), "active", &"NY_MANHATTAN_OBJ_CAPTURE_HIND", var_0.origin );
    objective_current( maps\_utility::_id_2816( "obj_capturehind" ) );
    common_scripts\utility::flag_wait( "obj_capturehind_complete" );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "obj_capturehind" ) );
}

_id_483A()
{
    var_0 = getent( "nyse_flag", "targetname" );
    var_0._id_1032 = "nyse_flag";
    var_0 maps\_anim::_id_1244();
    var_0 maps\_anim::_id_124E( var_0, "flag_flap", "stop_loop" );
}

_id_483B()
{
    var_0 = getent( "ny_manhattan_exchange_fire", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 setlightintensity( 2.5 );
    var_0 thread maps\_lights::_id_1640( ( 1.0, 0.831373, 0.439216 ), ( 0.2, 0.166275, 0.0878432 ), 0.005, 0.15 );
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = var_0.radius;
    var_4 = 5;
    var_5 = 5;
    var_6 = 5;
    var_7 = 5;
    var_8 = 0.075;
    var_9 = 0.35;

    while ( !common_scripts\utility::flag( "off_fire_light" ) )
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

_id_483C()
{
    var_0 = getent( "ny_manhattan_intro_fire", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 setlightintensity( 1.5 );
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

    while ( !common_scripts\utility::flag( "off_fire_light" ) )
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

_id_483D()
{
    var_0 = getent( "ny_manhattan_15broad_hallway", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 setlightintensity( 0.9 );
    var_0 thread maps\_lights::_id_1640( ( 0.968628, 0.705882, 0.509804 ), ( 0.409804, 0.243137, 0.043137 ), 0.005, 0.15 );
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = var_0.radius;
    var_4 = 3;
    var_5 = 3;
    var_6 = 3;
    var_7 = 3;
    var_8 = 0.075;
    var_9 = 0.35;

    while ( !common_scripts\utility::flag( "off_fire_light" ) )
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

_id_483E()
{
    var_0 = getent( "ny_manhattan_15broad_lobby", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 setlightintensity( 1.15 );
    var_0 thread maps\_lights::_id_1640( ( 0.929412, 0.570588, 0.28625 ), ( 0.2, 0.166275, 0.0878432 ), 0.005, 0.15 );
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = var_0.radius;
    var_4 = 2;
    var_5 = 2;
    var_6 = 2;
    var_7 = 2;
    var_8 = 0.075;
    var_9 = 0.35;

    while ( !common_scripts\utility::flag( "off_fire_light" ) )
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

_id_483F()
{
    var_0 = getentarray( "ny_manhattan_15broad_tv", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in var_0 )
    {
        var_2 setlightintensity( 1.7 );
        var_2 thread maps\_lights::_id_1640( ( 0.690196, 0.8, 1.0 ), ( 0.337255, 0.368627, 0.411765 ), 0.002, 0.05 );
        var_2 thread maps\_lights::_id_1641( "trigger_static_tv" );
    }
}
