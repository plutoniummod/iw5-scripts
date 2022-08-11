// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\paris_ac130_code::_id_56FB();
    maps\_utility::_id_1E74( "start_intro", common_scripts\utility::void, "Start Intro" );
    maps\_utility::_id_1E74( "start_ac130", common_scripts\utility::void, "Start AC130" );
    maps\_utility::_id_1E74( "start_fdr", common_scripts\utility::void, "Start FDR" );
    maps\_utility::_id_1E74( "start_e3", common_scripts\utility::void, "Start E3" );
    maps\_utility::_id_1E74( "start_street", common_scripts\utility::void, "Start Street" );
    maps\_utility::_id_1E74( "start_rpg", common_scripts\utility::void, "Start RPG" );
    maps\_utility::_id_1E74( "start_courtyard", common_scripts\utility::void, "Start Courtyard" );
    maps\_utility::_id_1E74( "start_chase", common_scripts\utility::void, "Start Chase" );
    maps\_utility::_id_1E74( "start_bridge", common_scripts\utility::void, "Start Bridge" );
    maps\_utility::_id_1E74( "start_bridge_collapse", common_scripts\utility::void, "Start Bridge Collapse" );
    _id_5101::main();
    _id_03C5::main();
    _id_03C6::main();
    maps\paris_ac130_snd::main();
    maps\paris_ac130_anim::main();
    thread _id_6388();
    maps\_load::main();
    maps\_compass::setupminimap( "compass_map_paris_ac130_intro", "intro_minimap_corner" );
    maps\_audio::_id_173F();
    maps\_audio::_id_156E( "default" );
    maps\_audio::_id_1735();
    level._id_3E86 = 1;
    _id_0622::main();
    _id_6177::init();
    level._id_6384 = maps\_hud_util::_id_09A7( "black", 1, level.player );
    level.struct = undefined;
    maps\paris_ac130_code::_id_6250();
    setdvar( "pip_enabled", 1 );
    setdvar( "new_intro", 1 );
    setsaveddvar( "fx_alphathreshold", 11 );
    maps\paris_ac130_code::_id_6251();
    maps\paris_ac130_code::_id_6229();
    thread maps\paris_ac130_code::_id_6283();
    thread _id_638A();
    thread _id_638B();
    thread _id_638C();
    thread _id_638D();
    thread _id_638E();
    _id_6387();
    thread _id_6386();
}

_id_6385( var_0 )
{
    switch ( var_0 )
    {
        case "loop_0":
            var_1 = getvehiclenode( "city_area_loop_0_to_1_in", "script_noteworthy" );
            var_1 waittill( "trigger" );
            common_scripts\utility::flag_set( "FLAG_ac130_loop_0" );
            break;
        case "loop_2":
            common_scripts\utility::flag_wait( "FLAG_fdr_ac130_circling_fdr" );
            common_scripts\utility::flag_wait( "FLAG_fdr_enemy_vehicles_killed" );
            var_2 = getvehiclenode( "city_area_loop_0_check", "script_noteworthy" );
            var_2 waittill( "trigger" );
            var_3 = getvehiclenode( "city_area_loop_0_to_1_in", "script_noteworthy" );
            var_1 = getvehiclenode( "city_area_loop_0_to_2_out", "script_noteworthy" );
            level._id_5EB8 _id_5F9E::_id_5F3F( var_3, var_1 );
            common_scripts\utility::flag_set( "FLAG_ac130_loop_0_to_2" );
            var_3 = getvehiclenode( "city_area_loop_2_to_0_in", "script_noteworthy" );
            var_1 = getvehiclenode( "city_area_loop_2_out", "script_noteworthy" );
            level._id_5EB8 _id_5F9E::_id_5F3F( var_3, var_1 );
            common_scripts\utility::flag_set( "FLAG_ac130_loop_2" );
            break;
        case "loop_3":
            common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_move_down" );
            var_2 = getvehiclenode( "city_area_loop_2_check", "script_noteworthy" );
            level._id_5EB8 vehicle_setspeed( 30, 1, 1 );
            var_2 waittill( "trigger" );
            var_3 = getvehiclenode( "city_area_loop_2_to_3_in", "script_noteworthy" );
            var_1 = getvehiclenode( "city_area_loop_2_to_3_out", "script_noteworthy" );
            level._id_5EB8 _id_5F9E::_id_5F3F( var_3, var_1 );
            common_scripts\utility::flag_set( "FLAG_ac130_loop_2_to_3" );
            level._id_5EB8 vehicle_setspeed( 20, 1, 1 );
            var_3 = getvehiclenode( "city_area_loop_3_in", "script_noteworthy" );
            var_1 = getvehiclenode( "city_area_loop_3_out", "script_noteworthy" );
            level._id_5EB8 _id_5F9E::_id_5F3F( var_3, var_1 );
            common_scripts\utility::flag_set( "FLAG_ac130_loop_3" );
            var_1 = getvehiclenode( "city_area_loop_4_out", "script_noteworthy" );
            var_1 waittill( "trigger" );
            common_scripts\utility::flag_set( "FLAG_ac130_loop_4" );
            break;
        case "chase":
            var_3 = getvehiclenode( "chase_start_transition_in", "script_noteworthy" );
            var_1 = getvehiclenode( "chase_start_transition_out", "script_noteworthy" );
            level._id_5EB8 _id_5F9E::_id_5F3F( var_3, var_1 );
            break;
    }
}

_id_6386()
{
    wait 0.05;

    switch ( level._id_1F19 )
    {
        case "default":
            common_scripts\utility::flag_set( "FLAG_start_intro" );
        case "start_intro":
            common_scripts\utility::flag_wait( "FLAG_start_intro" );
            maps\_utility::delaythread( 10.0, ::_id_63A5 );
            thread _id_6396();
            maps\paris_ac130_slamzoom::_id_5872();
            maps\paris_ac130_slamzoom::_id_6141();
            common_scripts\utility::flag_set( "FLAG_start_ac130" );
        case "start_ac130":
            common_scripts\utility::flag_wait( "FLAG_start_ac130" );
            _id_6398();
            common_scripts\utility::flag_set( "FLAG_start_fdr" );
        case "start_fdr":
            common_scripts\utility::flag_wait( "FLAG_start_fdr" );
            _id_63A4();
            common_scripts\utility::flag_set( "FLAG_start_e3" );
        case "start_e3":
            common_scripts\utility::flag_wait( "FLAG_start_e3" );
            _id_63CA();
            common_scripts\utility::flag_set( "FLAG_start_street" );
        case "start_street":
            common_scripts\utility::flag_wait( "FLAG_start_street" );
            _id_63CE();
            common_scripts\utility::flag_set( "FLAG_start_rpg" );
        case "start_rpg":
            common_scripts\utility::flag_wait( "FLAG_start_rpg" );
            _id_6416();
            common_scripts\utility::flag_set( "FLAG_start_courtyard" );
        case "start_courtyard":
            common_scripts\utility::flag_wait( "FLAG_start_courtyard" );
            _id_643A();
            common_scripts\utility::flag_set( "FLAG_start_chase" );
        case "start_chase":
            common_scripts\utility::flag_wait( "FLAG_start_chase" );
            _id_6441();
            common_scripts\utility::flag_set( "FLAG_start_bridge" );
        case "start_bridge":
            common_scripts\utility::flag_wait( "FLAG_start_bridge" );
            _id_646F();
            common_scripts\utility::flag_set( "FLAG_start_bridge_collapse" );
        case "start_bridge_collapse":
            common_scripts\utility::flag_wait( "FLAG_start_bridge_collapse" );
            wait 100000;
            break;
        default:
    }
}

_id_6387()
{
    wait 0.05;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1957() )
    {
        var_0 = "start_e3";
        level._id_1F19 = var_0;
    }

    if ( var_0 == "start_intro" )
    {
        common_scripts\utility::flag_set( "FLAG_start_intro" );
        return;
    }

    _id_639A();

    if ( var_0 == "start_ac130" )
    {
        common_scripts\utility::flag_set( "FLAG_start_ac130" );
        return;
    }

    _id_63A2();

    if ( var_0 == "start_fdr" )
    {
        common_scripts\utility::flag_set( "FLAG_start_fdr" );
        return;
    }

    _id_63C9();

    if ( var_0 == "start_e3" )
    {
        common_scripts\utility::flag_set( "FLAG_start_e3" );
        return;
    }

    _id_63CD();

    if ( var_0 == "start_street" )
    {
        common_scripts\utility::flag_set( "FLAG_start_street" );
        return;
    }

    _id_6415();

    if ( var_0 == "start_rpg" )
    {
        common_scripts\utility::flag_set( "FLAG_start_rpg" );
        return;
    }

    _id_6439();

    if ( var_0 == "start_courtyard" )
    {
        common_scripts\utility::flag_set( "FLAG_start_courtyard" );
        return;
    }

    _id_6440();

    if ( var_0 == "start_chase" )
    {
        common_scripts\utility::flag_set( "FLAG_start_chase" );
        return;
    }

    _id_646E();

    if ( var_0 == "start_bridge" )
    {
        common_scripts\utility::flag_set( "FLAG_start_bridge" );
        return;
    }

    wait 0.05;
    thread maps\paris_ac130_slamzoom::_id_61C6();

    if ( var_0 == "start_bridge_collapse" )
    {
        common_scripts\utility::flag_set( "FLAG_start_bridge_collapse" );
        return;
    }
}

_id_6388()
{
    while ( !isdefined( level._id_1F19 ) )
        wait 0.05;

    if ( level._id_1F19 == "no_game" )
    {
        if ( isdefined( level._id_6384 ) )
            level._id_6384 destroy();
    }
}

_id_6389()
{
    var_0 = 5.0;
    level.player maps\_utility::delaythread( var_0 + 3.0, maps\_utility::_id_1823, "HINT_ac130_thermal_vision", var_0 );
    level.player maps\_utility::delaythread( 2 * var_0 + 3.0, maps\_utility::_id_1823, "HINT_ac130_using_zoom", var_0 );
    level.player maps\_utility::delaythread( 3 * var_0 + 3.0, maps\_utility::_id_1823, "HINT_ac130_change_weapons", var_0 );
}

_id_638A()
{
    var_0 = getent( "sky_thermal", "targetname" );
    var_1 = 1;

    for (;;)
    {
        if ( common_scripts\utility::flag( "FLAG_ac130_player_in_ac130" ) )
        {
            if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) && var_1 )
            {
                var_0 hide();
                var_1 = 0;
            }
            else if ( common_scripts\utility::flag( "FLAG_ac130_enhanced_vision_enabled" ) && !var_1 )
            {
                var_0 show();
                var_1 = 1;
            }
        }
        else if ( !var_1 )
        {
            var_0 show();
            var_1 = 1;
        }

        wait 0.05;
    }
}

_id_638B()
{
    var_0 = getent( "rpg_building", "script_noteworthy" );
    var_0 setcandamage( 0 );
    var_1 = common_scripts\_destructible_types::getinfoindex( "toy_building_collapse_paris_ac130" );

    if ( var_1 > -1 )
        level.destructible_type[var_1].parts[0][0].v["health"] = 1000000;

    var_2 = getentarray( "courtyard_building_des_a_damage", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\paris_ac130_slamzoom::_id_5EA3 );
    common_scripts\utility::flag_wait( "FLAG_chase_started" );
    var_3 = maps\_utility::_id_1BF9( "intro_cleanup", "targetname" );
    var_3 = common_scripts\utility::array_combine( var_3, maps\_utility::_id_1BF9( "fdr_cleanup", "targetname" ) );
    var_3 = common_scripts\utility::array_combine( var_3, maps\_utility::_id_1BF9( "street_cleanup", "targetname" ) );
    var_3 = common_scripts\utility::array_combine( var_3, maps\_utility::_id_1BF9( "courtyard_cleanup", "targetname" ) );
    var_4 = [];
    var_5 = getentarray();

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( var_7 ) )
            continue;

        foreach ( var_9 in var_3 )
        {
            if ( _id_5F9E::_id_5F11( var_9.origin, var_7.origin, var_9.radius, 1500 ) )
            {
                var_4[var_4.size] = var_7;
                continue;
            }
        }
    }

    foreach ( var_7 in var_4 )
    {
        if ( !isdefined( var_7 ) || maps\_utility::is_in_array( level._id_6132, var_7 ) || var_7 == level._id_6127 || var_7 _id_5F9E::_id_5F0A( "targetname", "city_area_rpg_building_debris_1" ) || var_7 _id_5F9E::_id_5F0A( "targetname", "city_area_rpg_building_debris_2" ) || var_7 _id_5F9E::_id_5F0A( "targetname", "chase_player_focus" ) || var_7 _id_5F9E::_id_5F0A( "targetname", "chase_pfr_t72" ) || var_7 _id_5F9E::_id_5F0A( "targetname", "chase_pfr_mi17" ) || var_7 _id_5F9E::_id_5F0A( "script_noteworthy", "intelligence_item" ) || var_7 _id_5F9E::_id_5F0A( "script_noteworthy", "rpg_building" ) )
            continue;

        var_7 notify( "death" );
        var_7 notify( "stopfiring" );
        var_7 notify( "stop_using_built_in_burst_fire" );
        wait 0.05;

        if ( isdefined( var_7 ) )
        {
            var_7 delete();
            animscripts\battlechatter::_id_0BF5();
        }
    }
}

_id_638C()
{
    var_0 = getentarray( "city_area_rpg_building_debris_1", "targetname" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "city_area_rpg_building_debris_2", "targetname" ) );

    foreach ( var_2 in var_0 )
        var_2 hide();

    var_4 = getentarray( "prs_ac_courtyard_trees_ground", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    var_8 = getentarray( "courtyard_building_des_a_damage", "targetname" );
    var_8 = common_scripts\utility::array_combine( var_8, getentarray( "courtyard_building_des_b_damage", "targetname" ) );
    var_8 = common_scripts\utility::array_combine( var_8, getentarray( "courtyard_building_des_c_damage", "targetname" ) );
    common_scripts\utility::array_call( var_8, ::hide );
    common_scripts\utility::array_call( var_8, ::notsolid );
}

_id_638D()
{

}

_id_638E()
{
    var_0 = [ "script_vehicle_t72_tank_ac130" ];

    foreach ( var_2 in var_0 )
    {
        foreach ( var_5, var_4 in level._id_29CE[var_2] )
            level._id_29CE[var_2][var_5] = undefined;

        level._id_2A01[var_2] = 1;
    }

    level._id_29CE["script_vehicle_t72_tank_ac130"][0] = maps\_vehicle::_id_29FD( "explosions/vehicle_explosion_t72_ac130", "tag_deathfx", undefined, undefined, undefined, undefined, 0 );
    level._id_29CE["script_vehicle_t72_tank_ac130"][1] = maps\_vehicle::_id_29FD( "explosions/ac_prs_fx_flir_debris_explosion_a", "tag_deathfx", undefined, undefined, undefined, undefined, 0 );
}

_id_5EA7()
{
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_goodkill"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_nice"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_yougotem"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_directhits"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_therewego"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_goodshot"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_wicked"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_tvo_damn"];
    var_0[var_0.size] = level.scr_sound["hit"]["ac130_hit_hestoast"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = [];
    var_3[var_3.size] = level.scr_sound["fco"]["ac130_fco_gotthetank"];
    var_3[var_3.size] = level.scr_sound["fco"]["ac130_fco_goinganywhere"];
    var_4 = [];

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
        var_4[var_4.size] = var_2;

    var_5 = [];
    var_5[var_5.size] = level.scr_sound["fco"]["ac130_fco_birddown"];
    var_6 = [];

    for ( var_2 = 0; var_2 < var_5.size; var_2++ )
        var_6[var_6.size] = var_2;

    var_7 = [];
    var_7[var_7.size] = level.scr_sound["fco"]["ac130_fco_btrisdown"];
    var_8 = [];

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
        var_8[var_8.size] = var_2;

    var_9 = [];
    var_9[var_9.size] = level.scr_sound["fco"]["ac130_fco_birddown"];
    var_9[var_9.size] = level.scr_sound["fco"]["ac130_fco_hindistoast"];
    var_10 = [];

    for ( var_2 = 0; var_2 < var_9.size; var_2++ )
        var_10[var_10.size] = var_2;

    var_11 = 0.5;
    var_12 = 0.25;
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    var_16 = 0;
    var_17 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "FLAG_ac130_player_in_ac130" ) && level._id_5EA0 && ( level._id_5E9A || level._id_5E9B ) )
        {
            var_18 = common_scripts\utility::ter_op( _id_5F9E::_id_5EDE( 0.9 ), 1, 0 );

            if ( !var_18 && level._id_5E9B )
            {
                if ( level._id_5E9F )
                {
                    if ( var_4.size == 0 )
                    {
                        for ( var_2 = 0; var_2 < var_3.size; var_2++ )
                            var_4[var_4.size] = var_2;

                        if ( var_4.size > 1 )
                            var_4 = maps\_utility::array_remove_index( var_4, var_14 );
                    }

                    var_14 = randomint( var_4.size );
                    wait(var_12);
                    thread _id_5CFE::playsoundoverradio( var_3[var_4[var_14]], 0, 4.0 );
                    var_4 = maps\_utility::array_remove_index( var_4, var_14 );
                }
                else if ( level._id_5E9E )
                {
                    if ( var_6.size == 0 )
                    {
                        for ( var_2 = 0; var_2 < var_5.size; var_2++ )
                            var_6[var_6.size] = var_2;

                        if ( var_6.size > 1 )
                            var_6 = maps\_utility::array_remove_index( var_6, var_15 );
                    }

                    var_15 = randomint( var_6.size );
                    wait(var_12);
                    thread _id_5CFE::playsoundoverradio( var_5[var_6[var_15]], 0, 4.0 );
                    var_4 = maps\_utility::array_remove_index( var_6, var_15 );
                }
                else if ( level._id_5E9C )
                {
                    if ( var_8.size == 0 )
                    {
                        for ( var_2 = 0; var_2 < var_7.size; var_2++ )
                            var_8[var_8.size] = var_2;

                        if ( var_8.size > 1 )
                            var_8 = maps\_utility::array_remove_index( var_8, var_16 );
                    }

                    var_16 = randomint( var_8.size );
                    wait(var_12);
                    thread _id_5CFE::playsoundoverradio( var_7[var_8[var_16]], 0, 4.0 );
                    var_8 = maps\_utility::array_remove_index( var_8, var_16 );
                }
                else if ( level._id_5E9D )
                {
                    if ( var_10.size == 0 )
                    {
                        for ( var_2 = 0; var_2 < var_9.size; var_2++ )
                            var_10[var_10.size] = var_2;

                        if ( var_10.size > 1 )
                            var_10 = maps\_utility::array_remove_index( var_10, var_17 );
                    }

                    var_17 = randomint( var_10.size );
                    wait(var_12);
                    thread _id_5CFE::playsoundoverradio( var_9[var_10[var_17]], 0, 4.0 );
                    var_10 = maps\_utility::array_remove_index( var_10, var_17 );
                }
                else
                {
                    if ( var_1.size == 0 )
                    {
                        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                            var_1[var_1.size] = var_2;

                        if ( var_1.size > 1 )
                            var_1 = maps\_utility::array_remove_index( var_1, var_13 );
                    }

                    var_13 = randomint( var_1.size );
                    wait(var_12);
                    thread _id_5CFE::playsoundoverradio( var_0[var_1[var_13]], 0, 4.0 );
                    var_1 = maps\_utility::array_remove_index( var_1, var_13 );
                }
            }
            else
            {
                if ( var_1.size == 0 )
                {
                    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                        var_1[var_1.size] = var_2;

                    if ( var_1.size > 1 )
                        var_1 = maps\_utility::array_remove_index( var_1, var_13 );
                }

                var_13 = randomint( var_1.size );
                wait(var_12);
                thread _id_5CFE::playsoundoverradio( var_0[var_1[var_13]], 0, 4.0 );
                var_1 = maps\_utility::array_remove_index( var_1, var_13 );
            }

            wait(var_11);
            level._id_5E9A = 0;
            level._id_5E9B = 0;
            level._id_5E9C = 0;
            level._id_5E9D = 0;
            level._id_5E9E = 0;
            level._id_5E9F = 0;
            continue;
        }

        wait 0.05;
    }
}

_id_638F( var_0, var_1 )
{
    common_scripts\utility::flag_clear( "FLAG_delta_spawned" );
    var_2 = "";

    switch ( var_0 )
    {
        case "fdr":
            var_2 = "fdr_delta_fast_point_";
            break;
        case "rpg":
            var_2 = "rpg_delta_fast_point_";
            break;
        case "street":
            var_2 = "street_delta_fast_point_";
            break;
        case "chase":
            var_2 = "chase_delta_fast_point_";
            break;
    }

    var_3 = _id_5F9E::_id_5F90( var_2, "targetname", 0 );

    if ( !isdefined( var_3 ) )
        return;

    foreach ( var_5 in var_3 )
    {
        var_5 notify( "LISETN_stop_ANIM_guard_cover_idle_loop" );
        var_5 notify( "LISTEN_stop_ANIM_guard_cover_out" );
        var_5 notify( "LISTEN_stop_ANIM_guard_run_loop" );
        var_5 notify( "LISTEN_stop_ANIM_guard_cover_into" );
        var_5 notify( "LISTEN_stop_ANIM_hostage_cover_idle_loop" );
        var_5 notify( "LISTEN_stop_ANIM_hostage_cover_out" );
        var_5 notify( "LISTEN_stop_ANIM_hostage_run_loop" );
        var_5 notify( "LISTEN_stop_ANIM_hostage_cover_into" );
    }

    if ( isdefined( level._id_6132 ) && isarray( level._id_6132 ) )
    {
        foreach ( var_8 in level._id_6132 )
        {
            if ( isdefined( var_8 ) )
            {
                var_8 notify( "reach_notify" );
                var_8 notify( "death" );
                var_8 delete();
            }
        }
    }

    var_10 = [ level._id_623F, level._id_6240, level._id_6241, level._id_6242, level._id_6245, level._id_6246, level._id_6243, level._id_6244, level._id_6247, level._id_6248 ];

    foreach ( var_12 in var_10 )
    {
        if ( isdefined( var_12 ) )
            var_12 delete();
    }

    if ( isdefined( level._id_6127 ) )
        level._id_6127 delete();

    wait 0.05;
    level._id_6132 = [];
    _id_5F9E::_id_5F95( "delta_", "targetname", 0, maps\paris_ac130_code::_id_6130 );
    _id_5F9E::_id_5F97( "delta_", "targetname", 0, maps\paris_ac130_code::_id_6131, 1 );
    var_14 = _id_5F9E::_id_5F90( "delta_", "targetname", 0 );

    foreach ( var_19, var_5 in var_3 )
    {
        if ( var_19 < var_3.size - 1 )
        {
            var_14[var_19].count = 1;
            var_14[var_19].origin = var_5.origin;
            var_14[var_19].angles = var_5 _id_5F9E::_id_5F4F( "angles" );
            level._id_6132[var_19] = var_14[var_19] stalingradspawn();
            var_16 = maps\_utility::_id_13AF( level._id_6132[var_19] );
            var_17[0] = "ANIM_guard_cover_idle_loop";
            var_17[1] = [ "ANIM_guard_cover_out" ];
            var_17[2] = "ANIM_guard_run_loop";
            var_17[3] = "ANIM_guard_cover_into";
            level._id_6132[var_19] maps\paris_ac130_code::_id_6340( var_17 );
            level._id_6132[var_19]._id_1032 = "generic";
            continue;
        }

        var_18 = getent( "makarov_number_2", "targetname" );
        var_18 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6130, "makarov_number_2", "targetname" );
        var_18 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6131, 0 );
        var_18.count = 1;
        var_18.origin = var_5.origin;
        var_18.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        level._id_6127 = var_18 stalingradspawn();
        var_16 = maps\_utility::_id_13AF( level._id_6127 );
        level._id_6127 hidepart( "tag_weapon", "defaultweapon" );
        level._id_6127.ignoreall = 1;
        level._id_6127.ignoreme = 1;
        var_17 = [];
        var_17[0] = "ANIM_hostage_cover_idle_loop";
        var_17[1] = [ "ANIM_hostage_cover_out" ];
        var_17[2] = "ANIM_hostage_run_loop";
        var_17[3] = "ANIM_hostage_cover_into";
        level._id_6127 maps\paris_ac130_code::_id_6344( var_5, var_17 );
        level._id_6127._id_1032 = "generic";
    }

    level._id_45C0 = level._id_6132[0];

    if ( isdefined( level._id_45C0 ) )
        level._id_45C0.script_noteworthy = "sandman";

    level._id_6133 = level._id_6132[1];

    if ( isdefined( level._id_6133 ) )
        level._id_6133.script_noteworthy = "frost";

    level._id_6134 = level._id_6132[2];

    if ( isdefined( level._id_6134 ) )
        level._id_6134.script_noteworthy = "hitman";

    level._id_6135 = level._id_6132[3];

    if ( isdefined( level._id_6135 ) )
        level._id_6135.script_noteworthy = "gator";

    level._id_6126 = level._id_6132[4];

    if ( isdefined( level._id_6126 ) )
        level._id_6126.script_noteworthy = "bishop";

    if ( !isdefined( var_1 ) )
    {
        foreach ( var_8 in level._id_6132 )
            var_8 thread _id_5CFE::add_beacon_effect();
    }

    _id_6137();
    common_scripts\utility::flag_set( "FLAG_delta_spawned" );
}

_id_6137()
{
    thread _id_6390();
    thread _id_6391();
    thread _id_6392();
    thread _id_6393();
    thread _id_6394();
    wait 0.05;
}

_id_6390()
{
    level._id_45C0._id_60E6 = level._id_45C0._id_1032;
    level._id_45C0._id_1032 = "generic";
    level._id_45C0 maps\_anim::_id_11CF( level._id_45C0, "setup_pose" );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_45C0.origin, level._id_45C0.angles, ( 12.0, 0.0, 0.0 ) );
    var_1 = level._id_45C0 geteye();
    level._id_623F = spawn( "script_model", ( var_0[0], var_0[1], var_1[2] ) );
    level._id_623F setmodel( "tag_origin" );
    level._id_623F.angles = level._id_45C0.angles;
    level._id_623F linkto( level._id_45C0, "j_neck" );
    var_2 = ( -14.0, -14.0, 63.0 );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_45C0.origin, level._id_45C0.angles, var_2 );
    level._id_6240 = spawn( "script_model", var_0 );
    level._id_6240 setmodel( "tag_origin" );
    level._id_6240.angles = level._id_45C0.angles + ( 0.0, 6.8, 0.0 );
    level._id_6240 linkto( level._id_45C0, "j_neck" );
    level._id_45C0 thread maps\_anim::_id_1246( level._id_45C0, "setup_pose" );
    level._id_45C0 common_scripts\utility::delaycall( 0.05, ::setanimtime, level._id_0C59["generic"]["setup_pose"], 0.99 );
    wait 0.05;
    level._id_45C0._id_1032 = level._id_45C0._id_60E6;
    level._id_45C0._id_60E6 = undefined;
}

_id_6391()
{
    level._id_6133._id_60E6 = level._id_6133._id_1032;
    level._id_6133._id_1032 = "generic";
    level._id_6133 maps\_anim::_id_11CF( level._id_6133, "setup_pose" );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6133.origin, level._id_6133.angles, ( 12.0, 0.0, 0.0 ) );
    var_1 = level._id_6133 geteye();
    level._id_6241 = spawn( "script_model", ( var_0[0], var_0[1], var_1[2] ) );
    level._id_6241 setmodel( "tag_origin" );
    level._id_6241.angles = level._id_6133.angles;
    level._id_6241 linkto( level._id_6133, "j_neck" );
    var_2 = ( -14.0, -14.0, 63.0 );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6133.origin, level._id_6133.angles, var_2 );
    level._id_6242 = spawn( "script_model", var_0 );
    level._id_6242 setmodel( "tag_origin" );
    level._id_6242.angles = level._id_6133.angles + ( 0.0, 6.8, 0.0 );
    level._id_6242 linkto( level._id_6133, "j_neck" );
    level._id_6133 thread maps\_anim::_id_1246( level._id_6133, "setup_pose" );
    level._id_6133 common_scripts\utility::delaycall( 0.05, ::setanimtime, level._id_0C59["generic"]["setup_pose"], 0.99 );
    wait 0.05;
    level._id_6133._id_1032 = level._id_6133._id_60E6;
    level._id_6133._id_60E6 = undefined;
}

_id_6392()
{
    level._id_6134._id_60E6 = level._id_6134._id_1032;
    level._id_6134._id_1032 = "generic";
    level._id_6134 maps\_anim::_id_11CF( level._id_6134, "setup_pose" );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6134.origin, level._id_6134.angles, ( 12.0, 0.0, 0.0 ) );
    var_1 = level._id_6134 geteye();
    level._id_6243 = spawn( "script_model", ( var_0[0], var_0[1], var_1[2] ) );
    level._id_6243 setmodel( "tag_origin" );
    level._id_6243.angles = level._id_6134.angles;
    level._id_6243 linkto( level._id_6134, "j_neck" );
    var_2 = ( -14.0, -14.0, 63.0 );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6134.origin, level._id_6134.angles, var_2 );
    level._id_6244 = spawn( "script_model", var_0 );
    level._id_6244 setmodel( "tag_origin" );
    level._id_6244.angles = level._id_6134.angles + ( 0.0, 6.8, 0.0 );
    level._id_6244 linkto( level._id_6134, "j_neck" );
    level._id_6134 thread maps\_anim::_id_1246( level._id_6134, "setup_pose" );
    level._id_6134 common_scripts\utility::delaycall( 0.05, ::setanimtime, level._id_0C59["generic"]["setup_pose"], 0.99 );
    wait 0.05;
    level._id_6134._id_1032 = level._id_6134._id_60E6;
    level._id_6134._id_60E6 = undefined;
}

_id_6393()
{
    level._id_6135._id_60E6 = level._id_6135._id_1032;
    level._id_6135._id_1032 = "generic";
    level._id_6135 maps\_anim::_id_11CF( level._id_6135, "setup_pose" );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6135.origin, level._id_6135.angles, ( 12.0, 0.0, 0.0 ) );
    var_1 = level._id_6135 geteye();
    level._id_6245 = spawn( "script_model", ( var_0[0], var_0[1], var_1[2] ) );
    level._id_6245 setmodel( "tag_origin" );
    level._id_6245.angles = level._id_6135.angles;
    level._id_6245 linkto( level._id_6135, "j_neck" );
    var_2 = ( -14.0, -14.0, 63.0 );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6135.origin, level._id_6135.angles, var_2 );
    level._id_6246 = spawn( "script_model", var_0 );
    level._id_6246 setmodel( "tag_origin" );
    level._id_6246.angles = level._id_6135.angles + ( 0.0, 6.8, 0.0 );
    level._id_6246 linkto( level._id_6135, "j_neck" );
    level._id_6135 thread maps\_anim::_id_1246( level._id_6135, "setup_pose" );
    level._id_6135 common_scripts\utility::delaycall( 0.05, ::setanimtime, level._id_0C59["generic"]["setup_pose"], 0.99 );
    wait 0.05;
    level._id_6135._id_1032 = level._id_6135._id_60E6;
    level._id_6135._id_60E6 = undefined;
}

_id_6394()
{
    level._id_6126._id_60E6 = level._id_6126._id_1032;
    level._id_6126._id_1032 = "generic";
    level._id_6126 maps\_anim::_id_11CF( level._id_6126, "setup_pose" );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6126.origin, level._id_6126.angles, ( 12.0, 0.0, 0.0 ) );
    var_1 = level._id_6126 geteye();
    level._id_6247 = spawn( "script_model", ( var_0[0], var_0[1], var_1[2] ) );
    level._id_6247 setmodel( "tag_origin" );
    level._id_6247.angles = level._id_6126.angles;
    level._id_6247 linkto( level._id_6126, "j_neck" );
    var_2 = ( -14.0, -14.0, 63.0 );
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_6126.origin, level._id_6126.angles, var_2 );
    level._id_6248 = spawn( "script_model", var_0 );
    level._id_6248 setmodel( "tag_origin" );
    level._id_6248.angles = level._id_6126.angles + ( 0.0, 6.8, 0.0 );
    level._id_6248 linkto( level._id_6126, "j_neck" );
    level._id_6126 thread maps\_anim::_id_1246( level._id_6126, "setup_pose" );
    level._id_6126 common_scripts\utility::delaycall( 0.05, ::setanimtime, level._id_0C59["generic"]["setup_pose"], 0.99 );
    wait 0.05;
    level._id_6126._id_1032 = level._id_6126._id_60E6;
    level._id_6126._id_60E6 = undefined;
}

_id_6395()
{
    var_0 = getent( "building_trigger", "targetname" );
    var_0 thread maps\paris_ac130_code::_id_627E();
    var_0 = getent( "rpg_building_trigger", "targetname" );
    var_0 thread maps\paris_ac130_code::_id_627F();
    thread maps\paris_ac130_code::_id_627D();
    thread maps\paris_ac130_code::_id_6280();
}

_id_6396()
{
    level.player freezecontrols( 1 );
    wait 0.5;
    var_0 = [];
    var_0[var_0.size] = &"PARIS_AC130_INTROSCREEN_LINE_1";
    var_0[var_0.size] = &"PARIS_AC130_INTROSCREEN_LINE_2";
    var_0[var_0.size] = &"PARIS_AC130_INTROSCREEN_LINE_3";
    var_0[var_0.size] = &"PARIS_AC130_INTROSCREEN_LINE_4";
    var_0[var_0.size] = &"PARIS_AC130_INTROSCREEN_LINE_5";
    level thread maps\_introscreen::_id_1D96( var_0 );
    wait 1;
    level._id_6384 fadeovertime( 1 );
    level._id_6384.alpha = 0;
    wait 0.75;
    level.player freezecontrols( 0 );
    wait 0.05;
    level._id_6384 destroy();
}

_id_6397()
{
    maps\_compass::setupminimap( "compass_map_paris_ac130_intro", "intro_minimap_corner" );
}

_id_6398()
{
    thread maps\_utility::_id_1C43();
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_finished" );
    var_0 = level.player.origin;
    common_scripts\utility::flag_wait( "FLAG_intro_slamout_start" );
    var_1 = getent( "ac130_vehicle", "targetname" );
    var_2 = getvehiclenode( "ac130_slamout", "targetname" );
    var_1.origin = var_2.origin;
    var_1.angles = var_2 _id_5F9E::_id_5F4F( "angles" );
    thread _id_6395();
    _id_639C();
    _id_639D();
    level._id_5EB8 _id_5F9E::_id_5F3C( var_2 );
    level.player freezecontrols( 1 );
    level.player common_scripts\utility::delaycall( 0.05, ::freezecontrols, 0 );
    level.player setplayerangles( ( 43.4379, 27.3719, 0.0 ) );
    _id_5CFE::_id_5CD0( 0, 0, 0, 30, 45, 30, 10 );
    _id_5F9E::_id_5EE3( 10.0, _id_5CFE::_id_5CD0, [ 20, 10, 10, 45, 45, 35, 55 ] );
    _id_5F9E::_id_5EE3( 30.0, _id_5CFE::_id_5CD0, [ 20, 10, 10, 65, 65, 45, 65 ] );
    thread _id_5F9E::_id_5EEF( "sm_sunsamplesizenear", 1.5, 30 );
    var_3 = getaiarray( "axis" );

    foreach ( var_5 in var_3 )
    {
        var_5 notify( "death" );
        var_5 delete();
    }

    _id_5CFE::_id_5CE8( 0 );
    maps\_utility::_id_142B( "paris_ac130_flyover_war_mx" );
    common_scripts\utility::flag_set( "FLAG_building_trigger_mission_failed_on" );
    common_scripts\utility::flag_set( "FLAG_delta_ac130_mission_fail" );
    common_scripts\utility::flag_set( "FLAG_intro_dialogue_finished" );
    common_scripts\utility::flag_set( "FLAG_ac130_context_sensitive_dialog_filler" );
    common_scripts\utility::flag_set( "FLAG_ac130_context_sensitive_dialog_kill" );
    common_scripts\utility::flag_set( "FLAG_ac130_context_sensitive_dialog_guy_pain" );
    level._id_5EA0 = 1;
    thread _id_5EA7();
    thread _id_6389();
    thread _id_6385( "loop_0" );
    thread _id_639E();
    thread _id_6399();
    common_scripts\utility::flag_set( "FLAG_war_finished" );
}

_id_6399()
{
    common_scripts\utility::flag_wait( "FLAG_intro_dialogue_finished" );
    common_scripts\utility::flag_set( "FLAG_ac130_clear_to_engage" );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_descending"], 1, 10.0 );
    wait 0.25;
    thread _id_5CFE::_id_5C94();
    common_scripts\utility::flag_set( "FLAG_fdr_mark_enemy_targets" );
    common_scripts\utility::flag_set( "FLAG_fdr_mark_friendly_targets" );
    wait 0.25;

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_seefriendlies"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_whitediamonds"], 1, 10.0 );

    wait 0.5;

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_stillinside"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_donotfire"], 1, 10.0 );

    wait 0.5;

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_eyesonhammer"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_strobeson"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_cleartoshoot"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_wegotcha"], 1, 10.0 );

    wait 0.5;

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_engageany"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_firesouth"], 1, 10.0 );

    common_scripts\utility::flag_set( "FLAG_war_dialogue_finished" );
}

_id_639A()
{
    wait 0.05;
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    common_scripts\utility::flag_set( "FLAG_intro_opening_jet_dog_fight_starting" );
    common_scripts\utility::flag_set( "FLAG_intro_opening_jet_dog_fight_finished" );
    common_scripts\utility::flag_set( "FLAG_intro_ambient_jet_dog_fights_active" );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_event" );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_crash_ready" );
    common_scripts\utility::flag_set( "FLAG_intro_player_knockout_start" );
    common_scripts\utility::flag_set( "FLAG_intro_player_knockout_started" );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_minigun_stop" );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_crash_start" );
    common_scripts\utility::flag_set( "FLAG_intro_osprey_1_crash_finished" );
    common_scripts\utility::flag_set( "FLAG_intro_slamout_start" );
    common_scripts\utility::flag_set( "FLAG_intro_ambient_jet_dog_fights_end" );
    common_scripts\utility::flag_set( "FLAG_intro_dialogue_finished" );
    thread _id_639B();

    if ( isdefined( level._id_6384 ) && !maps\_utility::_id_1957() )
        level._id_6384 destroy();

    wait 0.05;
}

_id_639B()
{
    thread _id_63A5();
    common_scripts\utility::flag_wait( "FLAG_fdr_t72s_spawned" );
    common_scripts\utility::flag_clear( "FLAG_delta_spawned" );
    wait 0.05;
    common_scripts\utility::flag_set( "FLAG_delta_spawned" );
}

_id_639C()
{
    var_0 = getent( "ac130_vehicle", "targetname" );
    level._id_5EB8 = maps\_vehicle::_id_211F( var_0 );
    wait 0.05;
    level._id_5EB8.targetname = "ac130_vehicle";
    level._id_5EB8 hide();
    var_0 delete();
}

_id_639D()
{
    _id_5CFE::_id_5CD6( "paris_ac130" );
    _id_5CFE::_id_5CD4( "paris_ac130_thermal" );
    _id_5CFE::_id_5CD5( "paris_ac130_enhanced" );
    _id_5CFE::_id_5CD2( "paris_ac130_thermal" );
    _id_5CFE::_id_5CD3( "paris_ac130_enhanced" );
    level._id_5EB8 _id_5CFE::_id_5C6F( level.player );
    level._id_5C37 = maps\paris_ac130_code::_id_5C37;
    setsaveddvar( "sm_sunenable", 1.0 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
}

_id_639E()
{
    var_0 = [ [ "cloud_bank_paris_ac130_start", ( 0.0, 0.0, 0.0 ) ], [ "cloud_bank_paris_ac130_start", ( 63404.5, 25485.0, 8559.67 ) ], [ "cloud_bank_paris_ac130_start", ( 67451.3, 24379.0, 8732.65 ) ], [ "FX_smoke_signal_osprey_blowing", ( 4854.65, 46882.4, -25.0024 ) ], [ "FX_c130_paratroop_aircaft", ( -6844.95, 49043.9, 4389.57 ) ], [ "FX_horizon_flash_runner_harbor", ( 9508.63, 63816.3, 170.905 ) ], [ "FX_horizon_flash_runner_harbor", ( 23345.0, 55156.8, 1394.84 ) ], [ "courtyard_fire", ( 2677.99, 45474.4, 83.0253 ) ], [ "firelp_cheap_mp", ( 2811.44, 45462.9, 288.065 ) ], [ "firelp_cheap_mp", ( 2845.4, 45453.4, 257.434 ) ], [ "firelp_cheap_mp", ( 2792.94, 45391.9, 205.851 ) ], [ "gazsmfire", ( 3081.28, 45625.3, 172.126 ) ], [ "gazsmfire", ( 3021.24, 45626.6, 158.354 ) ], [ "gazsmfire", ( 3033.23, 45614.6, 235.752 ) ], [ "fire_falling_runner_point_infrequent", ( 3067.53, 45622.3, 155.13 ) ], [ "fire_falling_runner_point", ( 2818.42, 45419.5, 203.23 ) ], [ "FX_ac_prs_smoke_amb_1", ( 3113.66, 45256.4, 39.4966 ) ], [ "FX_ac_prs_smoke_amb_1", ( 2525.91, 45228.1, 23.8144 ) ], [ "fire_falling_runner_point", ( 0.0, 0.0, 0.0 ) ], [ "fire_falling_runner_point_infrequent", ( 0.0, 0.0, 0.0 ) ], [ "battlefield_smokebank_S_warm", ( 0.0, 0.0, 0.0 ) ], [ "test_effect", ( 0.0, 0.0, 0.0 ) ] ];
    _id_5F9E::_id_5F1A( var_0 );
}

_id_639F()
{
    var_0 = getvehiclenode( "war_clean_up", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "FLAG_war_clean_up" );
}

_id_63A0()
{
    var_0 = [];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_2 notify( "death" );
            var_2 delete();
        }
    }

    _id_63A1();
}

_id_63A1()
{
    var_0 = [];
    thread maps\_utility::_id_2122( var_0, 0.2 );
}

_id_63A2()
{
    wait 0.05;
    common_scripts\utility::flag_set( "FLAG_ac130_clear_to_engage" );
    common_scripts\utility::flag_set( "FLAG_building_trigger_mission_failed_on" );
    common_scripts\utility::flag_set( "FLAG_delta_ac130_mission_fail" );
    common_scripts\utility::flag_set( "FLAG_ac130_intro" );
    common_scripts\utility::flag_set( "FLAG_war_clean_up" );
    common_scripts\utility::flag_set( "FLAG_war_finished" );
    common_scripts\utility::flag_set( "FLAG_war_dialogue_finished" );
    common_scripts\utility::flag_set( "FLAG_fdr_mark_enemy_targets" );
    common_scripts\utility::flag_set( "FLAG_fdr_mark_friendly_targets" );
    thread _id_63A0();
    _id_639C();
    _id_639D();
    _id_639E();
    thread _id_5CFE::_id_5C94();
    level._id_5EA0 = 1;
    thread _id_5EA7();
    thread _id_6395();
    var_0 = getvehiclenode( "city_area_loop_0_check", "script_noteworthy" );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_0 );
    thread _id_6385( "loop_0" );
}

_id_63A3()
{
    var_0 = spawn( "script_origin", ( -40208.0, 65820.0, 0.0 ) );
    var_0.targetname = "compass_map_paris_ac130";
    var_1 = spawn( "script_origin", ( 24176.0, -6244.0, 0.0 ) );
    var_1.targetname = "compass_map_paris_ac130";
    maps\_compass::setupminimap( "compass_map_paris_ac130", "compass_map_paris_ac130" );
    setsaveddvar( "ui_hideMap", "1" );
}

_id_63A4()
{
    common_scripts\utility::flag_wait( "FLAG_war_finished" );
    _id_63A3();
    thread _id_5CFE::_id_5C78();
    objective_add( maps\_utility::_id_2816( "OBJ_FDR_Clear_Area" ), "current", &"PARIS_AC130_OBJ_FDR_CLEAR_AREA_FOR_KILO_1_1" );
    _id_5CFE::_id_5CE8( 0 );
    _id_63B3();
    _id_63B4();
    _id_5CFE::_id_5CD0( 15, 0, 0, 65, 65, 45, 55 );
    var_0 = "FLAG_fdr_ac130_circling_fdr";
    level._id_5EB8 thread _id_5F9E::_id_5F88( "city_area_loop_0_circling_fdr", "script_noteworthy", var_0 );
    thread _id_6385( "loop_2" );
    thread _id_63A6();
    thread _id_63A7();
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_jets" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_mi17s" );
    common_scripts\utility::flag_set( "FLAG_ac130_intro" );
    thread _id_63A9();
    thread _id_63B5();
    thread _id_63A8();
    thread _id_63B7();
    thread _id_63BB();
    thread _id_63BE();
    thread _id_63C4();
    thread _id_63BD();
    thread _id_63C5();
    thread _id_63B6();
    common_scripts\utility::flag_wait( "FLAG_fdr_enemy_vehicles_killed" );
}

_id_63A5()
{
    thread _id_63B8();
    thread _id_63B9();
    thread _id_63C2();
}

_id_63A6()
{
    var_0 = 5.0;

    if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
        level.player maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

    var_1 = 30.0;

    while ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
            level.player maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

        wait(var_1);
    }
}

_id_63A7()
{
    common_scripts\utility::flag_wait( "FLAG_ac130_loop_0" );
    var_0 = 5.0;
    level.player thread maps\_utility::_id_1823( "HINT_ac130_using_zoom", var_0 );
}

_id_63A8()
{
    common_scripts\utility::flag_wait( "FLAG_war_dialogue_finished" );
    common_scripts\utility::flag_set( "FLAG_fdr_intro_dialogue_finished" );
    common_scripts\utility::flag_wait( "FLAG_fdr_enemy_vehicles_killed" );

    if ( !common_scripts\utility::flag( "FLAG_fdr_carpet_bombing_timeout" ) )
    {
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_thanks"], 1, 10.0 );
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_solidcopy"], 1, 10.0 );
    }

    common_scripts\utility::flag_set( "FLAG_fdr_dialogue_finished" );
}

_id_63A9()
{
    maps\_utility::delaythread( 0.1, ::_id_63AA );
    maps\_utility::delaythread( 0.2, ::_id_63AB );
    maps\_utility::delaythread( 0.3, ::_id_63AC );
    maps\_utility::delaythread( 0.4, ::_id_63AD );
    maps\_utility::delaythread( 0.6, ::_id_63AF );
    maps\_utility::delaythread( 0.7, ::_id_63B0 );
}

_id_63AA()
{
    var_0 = maps\_utility::_id_1BF9( "ambient_aa_fire_short", "targetname", 0.25 );
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        var_1[var_4][0] = var_3;
        var_1[var_4][1] = maps\_utility::_id_283B( var_3.target, "targetname" );
    }

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) )
        {
            var_5 = common_scripts\utility::getfx( "FX_aa_fire_short_" + ( randomint( 4 ) + 1 ) );
            var_4 = randomint( var_1.size );
            var_6 = var_1[var_4][0].origin;
            var_7 = vectornormalize( var_1[var_4][1].origin - var_1[var_4][0].origin );
            playfx( var_5, var_6, var_7 );
            wait(level._id_623A);
            continue;
        }

        wait 0.05;
    }
}

_id_63AB()
{
    var_0 = maps\_utility::_id_1BF9( "ambient_aa_fire_tracer", "targetname", 0.25 );
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        var_1[var_4][0] = var_3;
        var_1[var_4][1] = maps\_utility::_id_283B( var_3.target, "targetname" );
    }

    var_5 = [];

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_5[var_5.size] = var_4;

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) )
        {
            if ( var_5.size == 0 )
            {
                for ( var_4 = 0; var_4 < var_0.size; var_4++ )
                    var_5[var_5.size] = var_4;
            }

            var_6 = randomint( var_5.size );
            var_7 = common_scripts\utility::getfx( "FX_aa_fire_" + ( randomint( 3 ) + 1 ) );
            var_8 = var_1[var_5[var_6]][0].origin;
            var_9 = vectornormalize( var_1[var_5[var_6]][1].origin - var_1[var_5[var_6]][0].origin );
            thread _id_5F9E::_id_5F07( var_7, var_8, var_9, randomint( 4 ) + 1, 0.1 );
            wait(level._id_623B);
            var_5 = maps\_utility::array_remove_index( var_5, var_6 );
            continue;
        }

        wait 0.05;
    }
}

_id_63AC()
{
    var_0 = _id_5F9E::_id_5F52( "ambient_aa_fire_flash" );
    thread maps\_utility::_id_2122( var_0, 0.25 );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) )
        {
            if ( var_1.size == 0 )
            {
                for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                    var_1[var_1.size] = var_2;
            }

            var_3 = randomint( var_1.size );
            var_4 = common_scripts\utility::getfx( "FX_aa_fire_flash" );
            var_5 = var_0[var_1[var_3]].origin;
            var_6 = ( 0.0, 0.0, 1.0 );
            playfx( var_4, var_5, var_6 );
            wait(level._id_623C);
            var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            continue;
        }

        wait 0.05;
    }
}

_id_63AD()
{
    var_0 = _id_5F9E::_id_5F52( "ambient_clouds" );
    thread maps\_utility::_id_2122( var_0, 0.25 );
    var_1 = common_scripts\utility::getfx( "FX_cloud_single" );
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
    {
        var_2[var_5] = spawn( "script_model", var_4.origin );
        var_2[var_5] setmodel( "tag_origin" );
    }

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        common_scripts\utility::flag_wait( "FLAG_ambient_ac130_effects" );

        foreach ( var_7 in var_2 )
            playfxontag( var_1, var_7, "tag_origin" );

        common_scripts\utility::flag_waitopen( "FLAG_ambient_ac130_effects" );

        foreach ( var_7 in var_2 )
            stopfxontag( var_1, var_7, "tag_origin" );
    }
}

_id_63AE()
{
    var_0 = _id_5F9E::_id_5F52( "open_area_slamzoom_out_out" );
    var_1 = _id_5F9E::_id_5F51( 1, "script_index", var_0 )[0];
    var_2 = "FLAG_ac130_intro";
    level._id_5EB8 thread _id_5F9E::_id_5F88( var_1.targetname, "targetname", var_2 );
    common_scripts\utility::flag_wait( "FLAG_ac130_intro" );
    level._id_6249 = "intro";
    level._id_624A = 1;
    common_scripts\utility::flag_wait( "FLAG_fdr_ac130_circling_fdr" );
    level._id_6249 = "loop_0";
    level._id_624A = 2;
    var_3 = _id_5F9E::_id_5F52( "city_area_loop_0_out" );
    var_4 = [];

    for ( var_5 = 1; var_5 <= 4; var_5++ )
        var_4[var_5] = _id_5F9E::_id_5F51( var_5, "script_index", var_3 )[0];

    for ( var_5 = 3; !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ); var_5++ )
    {
        var_5 = common_scripts\utility::ter_op( var_5 > 4, 1, var_5 );
        var_4[var_5] waittill( "trigger" );
        level._id_624A = var_5;
    }

    common_scripts\utility::flag_wait( "FLAG_ac130_loop_0_to_2" );
    level._id_6249 = "loop_0_to_2";
    level._id_624A = 1;
    common_scripts\utility::flag_wait( "FLAG_ac130_loop_2" );
    level._id_6249 = "loop_2";
    level._id_624A = 2;
    var_6 = _id_5F9E::_id_5F52( "city_area_loop_2_out" );
    var_4 = [];

    for ( var_5 = 1; var_5 <= 4; var_5++ )
        var_4[var_5] = _id_5F9E::_id_5F51( var_5, "script_index", var_6 )[0];

    var_5 = 3;

    for ( var_7 = 25.0; !common_scripts\utility::flag( "FLAG_street_ma_3_delta_move_down" ); var_5++ )
    {
        var_5 = common_scripts\utility::ter_op( var_5 > 4, 1, var_5 );
        var_4[var_5] common_scripts\utility::waittill_any_timeout( var_7, "trigger" );
        level._id_624A = var_5;
    }

    common_scripts\utility::flag_wait( "FLAG_ac130_loop_2_to_3" );
    level._id_6249 = "loop_2_to_3";
    level._id_624A = 1;
    common_scripts\utility::flag_wait( "FLAG_ac130_loop_3" );
    level._id_6249 = "loop_3";
    level._id_624A = 2;
    var_8 = _id_5F9E::_id_5F52( "city_area_loop_3_out" );
    var_4 = [];

    for ( var_5 = 1; var_5 <= 4; var_5++ )
        var_4[var_5] = _id_5F9E::_id_5F51( var_5, "script_index", var_8 )[0];

    var_5 = 3;

    for ( var_7 = 25.0; !common_scripts\utility::flag( "FLAG_rpg_ac130_angel_flare_start" ); var_5++ )
    {
        var_5 = common_scripts\utility::ter_op( var_5 > 4, 1, var_5 );
        var_4[var_5] common_scripts\utility::waittill_any_timeout( var_7, "trigger" );
        level._id_624A = var_5;
    }

    common_scripts\utility::flag_wait( "FLAG_ac130_loop_4" );
    level._id_6249 = "loop_4";
    level._id_624A = 3;
    var_9 = _id_5F9E::_id_5F52( "city_area_loop_4_out" );
    var_4 = [];

    for ( var_5 = 1; var_5 <= 4; var_5++ )
        var_4[var_5] = _id_5F9E::_id_5F51( var_5, "script_index", var_9 )[0];

    var_5 = 3;

    for ( var_7 = 60.0; !common_scripts\utility::flag( "FLAG_courtyard_slamzoom_out_finished" ); var_5++ )
    {
        var_5 = common_scripts\utility::ter_op( var_5 > 4, 1, var_5 );
        var_4[var_5] common_scripts\utility::waittill_any_timeout( var_7, "trigger" );
        level._id_624A = var_5;
    }

    level._id_6249 = "loop_5";
    level._id_624A = 1;
    var_10 = _id_5F9E::_id_5F52( "chase_start_friendly_vehicles" );
    var_4 = [];

    for ( var_5 = 1; var_5 <= 3; var_5++ )
        var_4[var_5] = _id_5F9E::_id_5F51( var_5, "script_index", var_9 )[0];

    var_7 = 60.0;

    for ( var_5 = 1; var_5 <= 3; var_5++ )
    {
        var_4[var_5] common_scripts\utility::waittill_any_timeout( var_7, "trigger" );
        level._id_624A = var_5;
        var_5++;
    }

    common_scripts\utility::flag_wait( "FLAG_chase_started" );
}

_id_63AF()
{
    var_0 = 14000;
    var_1 = 7000;
    var_2 = 20000;
    var_3 = -2048;
    var_4 = -3600;
    var_5 = 80000;
    var_6 = 7500;
    var_7 = var_5 * 1 / var_6;
    var_8 = 5;
    var_9 = [ 64, 256, 64 ];
    var_10 = 1;
    var_11 = 15.0;
    var_12 = 10.0;

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) && common_scripts\utility::flag( "FLAG_ambient_ac130_close_jets" ) )
        {
            var_13 = level._id_5C13 getturrettarget( 0 );
            var_14 = level.ac130.angles[2];

            if ( isdefined( var_13 ) )
                var_14 = vectortoyaw( var_13.origin - level._id_5C13.origin );

            var_14 = _id_5F9E::_id_5F36( var_14, 360 );
            var_15 = _id_5F9E::_id_5F0F( _id_5F9E::_id_5F36( var_14 - level._id_5C2E - var_8, 360 ), 1 );
            var_16 = _id_5F9E::_id_5F0F( _id_5F9E::_id_5F36( var_14 + level._id_5C2F + var_8, 360 ), 1 );

            if ( var_15 == var_16 )
            {
                var_15--;
                var_16++;
            }

            var_17 = common_scripts\utility::ter_op( var_16 > var_15, var_16, var_15 );
            var_18 = common_scripts\utility::ter_op( var_16 < var_15, var_16, var_15 );
            var_19 = ( 0, randomfloatrange( var_17, var_17 + 360 - var_18 ), 0 );
            var_20 = level.ac130.origin + var_2 * anglestoforward( var_19 );
            var_21 = level.ac130.origin + randomfloatrange( var_1, var_0 ) * anglestoforward( ( 0, level.ac130.angles[1], 0 ) );
            var_22 = vectortoangles( var_21 - var_20 ) + ( 0, randomfloatrange( -1 * var_10, var_10 ), 0 );
            var_23 = anglestoforward( var_22 );
            var_24 = anglestoright( var_22 );
            var_25 = anglestoup( var_22 );
            var_26 = [];
            var_27 = 1;
            var_28 = randomint( 100 );

            if ( var_28 <= 4 )
                var_27 = 4;
            else if ( var_28 <= 8 )
                var_27 = 3;
            else if ( var_28 <= 35 )
                var_27 = 2;

            var_29 = var_20;
            var_29 += ( 0, 0, randomfloatrange( var_4, var_3 ) );

            for ( var_30 = 0; var_30 < var_27; var_30++ )
            {
                var_26[var_30] = var_29;
                var_26[var_30] += _id_5F9E::_id_5EFC() * randomfloatrange( 16, 32 ) * var_25;
                var_26[var_30] -= randomfloatrange( 1024, 2048 ) * var_23;
                var_26[var_30] += _id_5F9E::_id_5EFC() * randomfloatrange( 512, 1024 ) * var_24;
                var_29 = var_26[var_30];
            }

            var_31 = [];

            foreach ( var_33 in var_26 )
                var_31[var_31.size] = var_33 + var_5 * var_23;

            var_35 = [];
            var_36 = [];
            var_37 = var_22;

            foreach ( var_30, var_33 in var_26 )
            {
                var_35[var_30] = var_33;
                var_35[var_30] += common_scripts\utility::ter_op( randomint( 2 ), var_9[0], -1 * var_9[0] ) * var_23;
                var_35[var_30] += common_scripts\utility::ter_op( randomint( 2 ), var_9[1], -1 * var_9[1] ) * var_24;
                var_35[var_30] += common_scripts\utility::ter_op( randomint( 2 ), var_9[1], -1 * var_9[2] ) * var_25;
                var_36[var_30] = var_35[var_30] + var_5 * var_23;
            }

            foreach ( var_30, var_33 in var_35 )
            {
                var_40 = spawn( "script_model", var_33 );
                var_40.angles = var_37;
                var_40 setmodel( "vehicle_mig29_low" );
                var_40 thread maps\paris_ac130_code::_id_6328();
                var_28 = randomfloatrange( 0.25, 0.45 );
                var_40 thread maps\paris_ac130_code::_id_632A( var_28 * var_7 );
                var_41 = _id_5F9E::_id_5F58( var_28, var_33, var_36[var_30] );
                var_40 thread maps\paris_ac130_code::_id_632B( var_41, "veh_paris_ac130_jet_sonic_boom" );
                var_40 moveto( var_36[var_30], var_7, 0.05, 0.05 );
                var_40 rotateroll( randomfloat( 360 * randomintrange( 2, 6 ) ), var_7 );
                var_40 thread maps\paris_ac130_code::_id_6335( var_7 );

                if ( _id_5F9E::_id_5EDE( 0.02 ) )
                    var_40 maps\_utility::delaythread( 0.15 * var_7, maps\paris_ac130_code::_id_632C );

                wait 0.05;
            }

            wait 0.5;

            foreach ( var_30, var_33 in var_26 )
            {
                var_43 = spawn( "script_model", var_33 );
                var_43.angles = var_22;
                var_43 setmodel( "vehicle_f15_low" );
                var_43 thread maps\paris_ac130_code::_id_62B1();
                var_28 = randomfloatrange( 0.25, 0.45 );
                var_43 thread maps\paris_ac130_code::_id_62B7( var_28 * var_7 );
                var_41 = _id_5F9E::_id_5F58( var_28, var_33, var_31[var_30] );
                var_43 thread maps\paris_ac130_code::_id_62B8( var_41, "veh_paris_ac130_jet_sonic_boom" );
                var_43 moveto( var_31[var_30], var_7, 0.05, 0.05 );

                if ( _id_5F9E::_id_5EDE( 0.1 ) )
                    var_43 thread maps\paris_ac130_code::_id_62B5();

                var_43 rotateroll( randomfloat( 360 * randomintrange( 2, 6 ) ), var_7 );
                var_43 thread maps\paris_ac130_code::_id_62BE( var_7 );
                wait 0.05;
            }

            wait(randomfloatrange( var_12, var_11 ));
            continue;
        }

        wait 0.05;
    }
}

_id_63B0()
{
    var_0 = 20000;
    var_1 = 12000;
    var_2 = 30000;
    var_3 = -3400;
    var_4 = -3600;
    var_5 = 90000;
    var_6 = 7500;
    var_7 = var_5 * 1 / var_6;
    var_8 = 5;
    var_9 = [ 64, 256, 64 ];
    var_10 = 1;
    var_11 = 20.0;
    var_12 = 12.0;

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) )
        {
            var_13 = level._id_5C13 getturrettarget( 0 );
            var_14 = level.ac130.angles[2];

            if ( isdefined( var_13 ) )
                var_14 = vectortoyaw( var_13.origin - level._id_5C13.origin );

            var_14 = _id_5F9E::_id_5F36( var_14, 360 );
            var_15 = _id_5F9E::_id_5F0F( _id_5F9E::_id_5F36( var_14 - level._id_5C2E - var_8, 360 ), 1 );
            var_16 = _id_5F9E::_id_5F0F( _id_5F9E::_id_5F36( var_14 + level._id_5C2F + var_8, 360 ), 1 );

            if ( var_15 == var_16 )
            {
                var_15--;
                var_16++;
            }

            var_17 = common_scripts\utility::ter_op( var_16 > var_15, var_16, var_15 );
            var_18 = common_scripts\utility::ter_op( var_16 < var_15, var_16, var_15 );
            var_19 = ( 0, randomfloatrange( var_17, var_17 + 360 - var_18 ), 0 );
            var_20 = level.ac130.origin + var_2 * anglestoforward( var_19 );
            var_21 = level.ac130.origin + randomfloatrange( var_1, var_0 ) * anglestoforward( ( 0, level.ac130.angles[1], 0 ) );
            var_22 = vectortoangles( var_21 - var_20 ) + ( 0, randomfloatrange( -1 * var_10, var_10 ), 0 );
            var_23 = anglestoforward( var_22 );
            var_24 = anglestoright( var_22 );
            var_25 = anglestoup( var_22 );
            var_26 = [];
            var_27 = 1;
            var_28 = randomint( 100 );

            if ( var_28 <= 4 )
                var_27 = 4;
            else if ( var_28 <= 8 )
                var_27 = 3;
            else if ( var_28 <= 35 )
                var_27 = 2;

            var_29 = var_20;
            var_29 += ( 0, 0, randomfloatrange( var_4, var_3 ) );

            for ( var_30 = 0; var_30 < var_27; var_30++ )
            {
                var_26[var_30] = var_29;
                var_26[var_30] += _id_5F9E::_id_5EFC() * randomfloatrange( 16, 32 ) * var_25;
                var_26[var_30] -= randomfloatrange( 1024, 2048 ) * var_23;
                var_26[var_30] += _id_5F9E::_id_5EFC() * randomfloatrange( 512, 1024 ) * var_24;
                var_29 = var_26[var_30];
            }

            var_31 = [];

            foreach ( var_33 in var_26 )
                var_31[var_31.size] = var_33 + var_5 * var_23;

            var_35 = [];
            var_36 = [];
            var_37 = var_22;

            foreach ( var_30, var_33 in var_26 )
            {
                var_35[var_30] = var_33;
                var_35[var_30] += common_scripts\utility::ter_op( randomint( 2 ), var_9[0], -1 * var_9[0] ) * var_23;
                var_35[var_30] += common_scripts\utility::ter_op( randomint( 2 ), var_9[1], -1 * var_9[1] ) * var_24;
                var_35[var_30] += common_scripts\utility::ter_op( randomint( 2 ), var_9[1], -1 * var_9[2] ) * var_25;
                var_36[var_30] = var_35[var_30] + var_5 * var_23;
            }

            foreach ( var_30, var_33 in var_35 )
            {
                var_40 = spawn( "script_model", var_33 );
                var_40.angles = var_37;
                var_40 setmodel( "vehicle_mig29_low" );
                var_40 thread maps\paris_ac130_code::_id_6328();
                var_40 thread maps\paris_ac130_code::_id_632A( randomfloatrange( 0.25, 0.45 ) * var_7 );
                var_41 = _id_5F9E::_id_5F58( randomfloatrange( 0.25, 0.45 ), var_33, var_36[var_30] );
                var_40 moveto( var_36[var_30], var_7, 0.05, 0.05 );
                var_40 rotateroll( randomfloat( 360 * randomintrange( 2, 6 ) ), var_7 );
                var_40 thread maps\paris_ac130_code::_id_6335( var_7 );
                wait 0.05;
            }

            wait 0.5;

            foreach ( var_30, var_33 in var_26 )
            {
                var_43 = spawn( "script_model", var_33 );
                var_43.angles = var_22;
                var_43 setmodel( "vehicle_f15_low" );
                var_43 thread maps\paris_ac130_code::_id_62B1();
                var_43 thread maps\paris_ac130_code::_id_62B7( randomfloatrange( 0.25, 0.45 ) * var_7 );
                var_41 = _id_5F9E::_id_5F58( randomfloatrange( 0.25, 0.45 ), var_33, var_31[var_30] );
                var_43 moveto( var_31[var_30], var_7, 0.05, 0.05 );

                if ( _id_5F9E::_id_5EDE( 0.1 ) )
                    var_43 thread maps\paris_ac130_code::_id_62B5();

                var_43 rotateroll( randomfloat( 360 * randomintrange( 2, 6 ) ), var_7 );
                var_43 thread maps\paris_ac130_code::_id_62BE( var_7 );
                wait 0.05;
            }

            wait(randomfloatrange( var_12, var_11 ));
            continue;
        }

        wait 0.05;
    }
}

_id_63B1()
{
    var_0 = getent( "ambient_close_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E5 );
    var_1 = maps\_utility::_id_1BF9( "ambient_close_mi17", "targetname", 0.25 );
    var_2 = getent( "ambient_close_mi17_parent", "targetname" );
    var_3 = maps\_utility::_id_1BF9( "ambient_close_mi17_parent", "targetname", 0.25 );
    var_4 = getent( "ambient_close_mi17_pilot", "targetname" );
    var_5 = [];
    var_6 = 8.0;
    var_7 = 64;
    var_8 = 4;

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        var_5 = common_scripts\utility::array_removeundefined( var_5 );

        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) && common_scripts\utility::flag( "FLAG_ambient_ac130_close_mi17s" ) )
        {
            if ( var_7 - vehicle_getarray().size < var_8 )
            {
                wait 0.05;
                continue;
            }

            if ( isdefined( level._id_6249 ) && isdefined( level._id_624A ) )
            {
                var_9 = [];

                foreach ( var_11 in var_1 )
                {
                    if ( var_11 _id_5F9E::_id_5F0A( "script_noteworthy", level._id_6249 ) && var_11 _id_5F9E::_id_5F0A( "script_group", level._id_624A ) )
                        var_9[var_9.size] = var_11;
                }

                var_9 = maps\_utility::_id_27EC( var_9 );
                var_13 = [];

                foreach ( var_11 in var_3 )
                {
                    if ( var_11 _id_5F9E::_id_5F0A( "script_group", level._id_624A ) )
                        var_13[var_13.size] = var_11;
                }

                var_13 = maps\_utility::_id_27EC( var_13 );

                foreach ( var_19, var_11 in var_9 )
                {
                    if ( var_7 - vehicle_getarray().size < var_8 )
                    {
                        wait 0.05;
                        continue;
                    }

                    var_2.count = 1;
                    var_2.origin = var_13[var_19].origin;
                    var_2.angles = var_13[var_19] _id_5F9E::_id_5F4F( "angles" );
                    var_2.target = var_13[var_19].target;
                    var_17 = var_2 maps\_utility::_id_1FA3();
                    var_18 = spawn( "script_model", var_11.origin );
                    var_18.angles = var_11 _id_5F9E::_id_5F4F( "angles" );
                    var_18.target = var_13[var_19].target;
                    var_18 setmodel( "vehicle_mi17_woodland_fly_cheap" );
                    var_5[var_5.size] = var_18;
                    wait 0.05;
                    var_18 maps\paris_ac130_code::_id_62E6( var_17 );
                    var_18 maps\paris_ac130_code::_id_62E9( randomint( 4 ) );
                    var_17 maps\_utility::delaythread( var_19 * 0.75, maps\_vehicle::_id_1FA6 );
                    wait 0.05;
                }

                wait(common_scripts\utility::ter_op( var_9.size > 0, var_6, 0.05 ));
            }
            else
                wait 0.05;

            continue;
        }

        wait 0.05;
    }

    var_0 delete();
    var_4 delete();
    var_5 = common_scripts\utility::array_removeundefined( var_5 );
    _id_5F9E::_id_5F7E( var_5, "death", 120.0 );

    foreach ( var_11 in var_1 )
        thread maps\_utility::_id_2122( _id_5F9E::_id_5F52( var_11.target ), 0.25 );
}

_id_63B2()
{
    var_0 = getent( "ambient_far_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E5 );
    var_1 = maps\_utility::_id_1BF9( "ambient_far_mi17", "targetname", 0.25 );
    var_2 = getent( "ambient_far_mi17_pilot", "targetname" );
    var_3 = [];
    var_4 = 25.0;

    while ( !common_scripts\utility::flag( "FLAG_end_ambient_ac130_effects" ) )
    {
        var_3 = common_scripts\utility::array_removeundefined( var_3 );

        if ( common_scripts\utility::flag( "FLAG_ambient_ac130_effects" ) )
        {
            var_5 = var_1[randomint( var_1.size )];
            var_6 = [];

            foreach ( var_8 in var_1 )
            {
                if ( _id_5F9E::_id_5F0B( [ var_8, var_5 ], "script_index" ) )
                    var_6[var_6.size] = var_8;
            }

            foreach ( var_12, var_8 in var_6 )
            {
                var_0.count = 1;
                var_0.origin = var_8.origin;
                var_0.angles = var_8 _id_5F9E::_id_5F4F( "angles" );
                var_0.target = var_8.target;
                var_3[var_3.size] = var_0 maps\_utility::_id_1FA3();
                wait 0.05;
                var_11 = var_3.size - 1;
                var_3[var_11] maps\paris_ac130_code::_id_62F3( var_2 );
                var_3[var_11] maps\_utility::delaythread( var_12 * 0.75, maps\paris_ac130_code::_id_62F8 );
                wait 0.05;
            }

            wait(common_scripts\utility::ter_op( var_6.size > 0, var_4, 0.05 ));
            continue;
        }

        wait 0.05;
    }

    var_0 delete();
    var_2 delete();
    var_3 = common_scripts\utility::array_removeundefined( var_3 );
    _id_5F9E::_id_5F7E( var_3, "death", 120.0 );

    foreach ( var_8 in var_1 )
        thread maps\_utility::_id_2122( _id_5F9E::_id_5F52( var_8.target ), 0.25 );
}

_id_63B3()
{
    var_0 = maps\_utility::_id_283B( "fdr_osprey", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0 _id_5F9E::_id_5F4F( "angles" );
    var_1 setmodel( "vehicle_v22_osprey" );
    var_2 = maps\_utility::_id_1BF9( "fdr_car", "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_5 = spawn( "script_model", var_4.origin );
        var_5.angles = var_4 _id_5F9E::_id_5F4F( "angles" );
        var_5 setmodel( "vehicle_luxurysedan_2008_destroy" );
    }
}

_id_63B4()
{
    _id_638F( "fdr" );
}

_id_63B5()
{
    common_scripts\utility::flag_wait( "FLAG_fdr_mark_friendly_targets" );
    _id_5CFE::_id_5C9F();
    var_0 = common_scripts\utility::add_to_array( level._id_6132, level._id_6127 );

    foreach ( var_2 in var_0 )
        thread _id_5F9E::_id_5EEE( var_2, 100, 60, 20 );
}

_id_63B6()
{
    var_0 = common_scripts\utility::getfx( "FX_signal_evac_hot" );
    var_1 = maps\_utility::_id_283B( "fdr_signal_ac130", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1 _id_5F9E::_id_5F4F( "angles" );
    var_2 setmodel( "tag_origin" );
    playfxontag( var_0, var_2, "tag_origin" );
    wait 5.0;
    common_scripts\utility::flag_wait( "FLAG_fdr_carpet_bombing_finished" );
    stopfxontag( var_0, var_2, "tag_origin" );
    var_2 delete();
}

_id_63B7()
{
    common_scripts\utility::flag_wait( "FLAG_fdr_ac130_circling_fdr" );
    common_scripts\utility::flag_wait( "FLAG_fdr_enemy_vehicles_killed" );
    level._id_5EB8 vehicle_setspeed( 50, 3, 3 );
    var_0 = _id_5F9E::_id_5F52( "city_area_loop_0_out" );
    var_1 = _id_5F9E::_id_5F51( 4, "script_index", var_0 )[0];
    var_1 waittill( "trigger" );
    level._id_5EB8 vehicle_setspeed( 30, 1, 1 );
}

_id_63B8()
{
    var_0 = getent( "fdr_t72", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62D7, "fdr_t72", "targetname", 4 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62DC, common_scripts\utility::add_to_array( level._id_6132, level._id_6127 ) );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "t72" );
    var_1 = maps\_utility::_id_1BF9( "fdr_t72", "targetname", 0.25 );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_4.origin;
        var_0.angles = var_4 _id_5F9E::_id_5F4F( "angles" );
        var_0.target = var_4.target;
        var_0._id_2941 = common_scripts\utility::ter_op( isdefined( var_4._id_2941 ), var_4._id_2941, var_0._id_2941 );
        var_2[var_5] = var_0 maps\_utility::_id_1FA3();
        wait 0.05;
        var_2[var_5]._id_16A5 = var_4._id_16A5;
        var_2[var_5].script_noteworthy = var_4.script_noteworthy;
        level._id_623E = common_scripts\utility::add_to_array( level._id_623E, var_2[var_5] );
        wait 0.05;
    }

    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_finished" );

    foreach ( var_7 in var_2 )
    {
        if ( isdefined( var_7 ) && isdefined( var_7.target ) )
            var_7 thread maps\_vehicle::_id_1FA6();
    }

    common_scripts\utility::flag_set( "FLAG_fdr_t72s_spawned" );
    var_9 = [];

    foreach ( var_7 in var_2 )
    {
        if ( var_7._id_16A5 == 1 || var_7._id_16A5 == 2 || var_7._id_16A5 == 11 )
            var_9[var_9.size] = var_7;
    }

    thread maps\paris_ac130_code::_id_0051( var_9 );
    common_scripts\utility::flag_waitopen( "FLAG_delta_spawned" );

    foreach ( var_7 in var_2 )
    {
        if ( isdefined( var_7 ) )
            var_7 notify( "LISTEN_end_t72_randomly_shoot_canon_fake2" );
    }

    common_scripts\utility::flag_wait( "FLAG_delta_spawned" );

    foreach ( var_7 in var_2 )
    {
        if ( isdefined( var_7 ) )
            var_7 thread maps\paris_ac130_code::_id_62DC( common_scripts\utility::add_to_array( level._id_6132, level._id_6127 ) );
    }

    common_scripts\utility::flag_wait( "FLAG_fdr_mark_enemy_targets" );
    var_16 = common_scripts\utility::array_removeundefined( var_2 );
    var_16 = _id_5F9E::_id_5EFF( var_16, [ "script_noteworthy" ] );
    thread _id_5CFE::_id_5C97( var_16, common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_start_e3" ), 0.05, 0.25 ) );
    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );

    foreach ( var_7 in var_2 )
    {
        if ( isdefined( var_7 ) && isalive( var_7 ) )
        {
            var_7 maps\_vehicle::_id_2A13();
            var_7 dodamage( 100000, var_7.origin );
        }
    }

    var_0 delete();
}

_id_63B9()
{
    var_0 = getent( "fdr_btr", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62CE, "fdr_btr", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "btr" );
    var_1 = maps\_utility::_id_1BF9( "fdr_btr", "targetname", 0.25 );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = getent( "fdr_btr_target", "targetname" );
    var_3 = [];

    foreach ( var_6, var_5 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_5.origin;
        var_0.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_0.target = var_5.target;
        var_3[var_6] = var_0 maps\_utility::_id_1FA3();
        wait 0.05;
        var_3[var_6] maps\paris_ac130_code::_id_62D6( [ ::_id_63BA ] );
        level._id_623E = common_scripts\utility::add_to_array( level._id_623E, var_3[var_6] );
        wait 0.05;
    }

    var_7 = getent( "fdr_btr_enemy", "targetname" );
    var_7 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6361 );
    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_finished" );

    foreach ( var_9 in var_3 )
    {
        var_9 thread maps\_vehicle::_id_2A3E();
        var_9 thread maps\paris_ac130_code::_id_62D2( common_scripts\utility::array_combine( level._id_6132, [ level._id_6127 ] ) );
        var_9 setturrettargetent( var_2 );
    }

    var_3[1] maps\paris_ac130_code::_id_62D3( var_7, 3, 1 );
    var_3[2] maps\paris_ac130_code::_id_62D3( var_7, 3, 1 );
    var_11 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_start_e3" ), 4, 15 );
    var_12 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_start_e3" ), 5, 20 );
    var_3[1] maps\_utility::delaythread( var_11, maps\paris_ac130_code::_id_62D5 );
    var_3[2] maps\_utility::delaythread( var_12, maps\paris_ac130_code::_id_62D5 );

    foreach ( var_9 in var_3 )
    {
        if ( isdefined( var_9 ) && isdefined( var_9.target ) )
            var_9 thread maps\_vehicle::_id_1FA6();
    }

    common_scripts\utility::flag_set( "FLAG_fdr_btrs_spawned" );
    common_scripts\utility::flag_wait( "FLAG_fdr_mark_enemy_targets" );
    _id_5CFE::_id_5C97( var_3, 0.1 );
    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );

    foreach ( var_9 in var_3 )
    {
        if ( isdefined( var_9 ) && isalive( var_9 ) )
        {
            var_9 maps\_vehicle::_id_2A13();
            var_9 dodamage( 100000, var_9.origin );
        }
    }

    var_0 delete();
    var_2 delete();
}

_id_63BA()
{
    self endon( "death" );
    var_0 = level._id_6132[randomint( level._id_6132.size )];
    thread maps\paris_ac130_code::_id_636F( var_0, "entity", "unload", 128, 256, 6 );
    self waittill( "unload" );
    thread _id_5CFE::_id_5C97( [ self ] );
    thread maps\paris_ac130_code::_id_5EA4();
    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );
    self dodamage( 10000, self.origin );
}

_id_63BB()
{
    common_scripts\utility::flag_wait( "FLAG_fdr_btrs_spawned" );
    common_scripts\utility::flag_wait( "FLAG_fdr_t72s_spawned" );
    thread _id_63BC();
    var_0 = "FLAG_fdr_enemy_vehicles_killed";
    _id_5F9E::_id_5F7F( 5, level._id_623E, "death", var_0 );
    level._id_623E = undefined;
}

_id_63BC()
{
    common_scripts\utility::flag_wait( "FLAG_fdr_intro_dialogue_finished" );
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_hitthoseguys"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_cleanthoseup"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_enemyarmor"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_goforvehicles"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_goahead"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_lightemup"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 7.0;
    var_4 = 0;
    wait 4.5;

    while ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
    {
        if ( var_1.size == 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                var_1[var_1.size] = var_2;

            if ( var_1.size > 1 )
                var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        }

        var_4 = randomint( var_1.size );
        _id_5CFE::playsoundoverradio( var_0[var_1[var_4]], 0 );
        var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        wait(var_3);
    }
}

_id_63BD()
{
    var_0 = 90;
    var_1 = 0;

    while ( var_1 < var_0 && !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
    {
        var_1 += 0.05;
        wait 0.05;
    }

    if ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        common_scripts\utility::flag_set( "FLAG_fdr_carpet_bombing_timeout" );

    common_scripts\utility::flag_set( "FLAG_fdr_enemy_vehicles_killed" );
}

_id_63BE()
{
    var_0 = getent( "fdr_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E1, "fdr_mi17", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "mi17" );
    var_1 = spawnstruct();
    var_1._id_63BF = [];
    var_1._id_63BF[1] = 0;
    var_1._id_63BF[2] = 0;
    var_1._id_63BF[3] = 0;
    var_1._id_63BF[4] = 0;
    var_2 = common_scripts\utility::getstructarray( "fdr_mi17", "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
        var_3[var_5._id_16A5] = common_scripts\utility::add_to_array( var_3[var_5._id_16A5], var_5 );

    var_7 = getent( "fdr_mi17_pilot", "targetname" );
    var_8 = getent( "fdr_mi17_enemy", "targetname" );
    var_8 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6361 );
    var_9 = 10.0;
    var_10 = 1;
    var_11 = 0;
    var_12 = [];
    var_13 = 64;
    var_14 = 4;

    while ( !common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
    {
        if ( var_13 - vehicle_getarray().size < var_14 )
        {
            wait 0.05;
            continue;
        }

        var_15 = 0;

        foreach ( var_17, var_5 in var_1._id_63BF )
        {
            if ( !var_5 )
            {
                var_10 = var_17;
                var_15 = 1;
                break;
            }
        }

        if ( var_15 )
        {
            var_18 = 0;

            while ( !var_18 )
            {
                foreach ( var_17, var_5 in var_3[var_10] )
                {
                    if ( !maps\_utility::_id_26AD( var_5.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
                    {
                        var_11 = var_17;
                        var_18 = 1;
                        break;
                    }
                }

                wait 0.05;
            }

            var_20 = 32;
            var_21 = getaiarray().size;

            if ( var_20 - var_21 > 3 )
            {
                var_22[var_10] = 1;
                var_0.count = 1;
                var_0.angles = var_3[var_10][var_11] _id_5F9E::_id_5F4F( "angles" );
                var_0.origin = var_3[var_10][var_11].origin;
                var_0.target = var_3[var_10][var_11].target;
                var_23 = var_0 maps\_utility::_id_1FA3();
                var_12[var_12.size] = var_23;
                wait 0.05;
                var_23 thread maps\paris_ac130_code::_id_62F3( var_7 );
                var_23 thread maps\paris_ac130_code::_id_62F4( var_8, randomintrange( 2, 4 ) );
                var_24 = [ ::_id_63C1, maps\paris_ac130_code::_id_6281 ];
                var_23 maps\paris_ac130_code::_id_62FB( var_24 );
                var_23 thread maps\paris_ac130_code::_id_62F0();
                thread _id_63C0( var_23, var_1, var_10 );
                _id_5CFE::_id_5C97( [ var_23 ] );
                wait(var_9);
            }
        }

        wait 0.05;
    }

    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );
    wait 0.1;

    foreach ( var_23 in var_12 )
    {
        if ( isdefined( var_23 ) )
            var_23 dodamage( 100000, var_23.origin );
    }

    common_scripts\utility::flag_wait( "FLAG_fdr_carpet_bombing_finished" );

    foreach ( var_5 in var_3 )
    {
        thread maps\_utility::_id_2122( var_5, 0.25 );

        foreach ( var_29 in var_5 )
            thread maps\_utility::_id_2122( _id_5F9E::_id_5F52( var_29.target ), 0.25 );
    }

    var_7 delete();
    var_8 delete();
    var_0 delete();
}

_id_63C0( var_0, var_1, var_2 )
{
    var_2 = _id_5F9E::_id_5F0F( var_2, 0 );
    var_1._id_63BF[var_2] = 1;
    var_0 common_scripts\utility::waittill_any( "death", "LISTEN_helicopter_resume_path" );
    var_1._id_63BF[var_2] = 0;
}

_id_63C1()
{
    self endon( "death" );
    var_0 = level._id_6132[randomint( level._id_6132.size )];
    thread maps\paris_ac130_code::_id_636F( var_0, "entity", "jumpedout", 384, 512, 2 );
    thread maps\paris_ac130_code::_id_5EA4();
    maps\_utility::delaythread( 3.0, _id_5CFE::_id_5C97, [ self ] );
    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );
    self dodamage( 10000, self.origin );
}

_id_63C2()
{
    var_0 = getent( "fdr_bm21", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6307, "fdr_bm21", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285 );
    var_1 = maps\_utility::_id_1BF9( "fdr_bm21", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = [];
    var_3 = getent( "fdr_btr_enemy", "targetname" );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6361 );

    foreach ( var_6, var_5 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_5.origin;
        var_0.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_0.target = var_5.target;
        var_2[var_6] = var_0 maps\_utility::_id_1FA3();
        wait 0.05;
        var_2[var_6] maps\paris_ac130_code::_id_6313( [ ::_id_63C3 ] );
        wait 0.05;
    }

    common_scripts\utility::flag_wait( "FLAG_intro_osprey_1_crash_finished" );

    foreach ( var_8 in var_2 )
        var_8 maps\paris_ac130_code::_id_6311( var_3, 5, 1 );

    var_10 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_start_e3" ), 4, 12 );
    var_11 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_start_e3" ), 5, 18 );
    var_2[1] maps\_utility::delaythread( var_10, maps\paris_ac130_code::_id_6312 );
    var_2[2] maps\_utility::delaythread( var_11, maps\paris_ac130_code::_id_6312 );
    common_scripts\utility::flag_wait( "FLAG_fdr_carpet_bombing_finished" );

    foreach ( var_8 in var_2 )
    {
        if ( isdefined( var_8 ) )
        {
            var_8 notify( "death" );
            var_8 delete();
        }
    }

    var_0 delete();
    var_3 delete();
}

_id_63C3()
{
    self endon( "death" );
    var_0 = level._id_6132[randomint( level._id_6132.size )];
    thread maps\paris_ac130_code::_id_636F( var_0, "entity", "unload", 128, 256, 6 );
    self waittill( "unload" );
    thread _id_5CFE::_id_5C97( [ self ] );
    thread maps\paris_ac130_code::_id_5EA4();
    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );
    self dodamage( 10000, self.origin );
}

_id_63C4()
{
    var_0 = getent( "fdr_enemy", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_5EA4 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6361 );
    var_1 = maps\_utility::_id_1BF9( "fdr_enemy_spot", "targetname", 0.25 );
    var_2 = level._id_6132[randomint( level._id_6132.size )];
    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_5.origin;
        var_0.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_6 = var_0 maps\_utility::_id_166F( 1 );
        var_3[var_3.size] = var_6;

        if ( isdefined( var_6 ) )
        {
            var_6 maps\_utility::_id_2724( randomfloatrange( 384, 512 ) );
            var_6 maps\_utility::delaythread( randomfloatrange( 0, 6 ), maps\_utility::_id_1237, var_2.origin );
            wait 0.05;
        }
    }

    common_scripts\utility::flag_wait( "FLAG_fdr_mark_enemy_targets" );
    thread _id_5CFE::_id_5C97( var_3, 0.25 );
    common_scripts\utility::flag_wait( "FLAG_fdr_delta_ready_to_move_to_street" );

    foreach ( var_9 in var_3 )
    {
        if ( isdefined( var_9 ) && target_istarget( var_9 ) )
            target_remove( var_9 );
    }

    common_scripts\utility::flag_wait( "FLAG_fdr_kill_all_enemies" );

    foreach ( var_9 in var_3 )
    {
        if ( isdefined( var_9 ) )
            var_9 dodamage( 10000, var_9.origin );
    }

    var_0 delete();
}

_id_63C5()
{
    var_0 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_start_e3" ), 3, 1 );
    common_scripts\utility::flag_wait( "FLAG_fdr_enemy_vehicles_killed" );
    common_scripts\utility::flag_wait( "FLAG_fdr_dialogue_finished" );
    common_scripts\utility::flag_wait( "FLAG_ac130_loop_0" );
    common_scripts\utility::flag_clear( "FLAG_ambient_ac130_close_jets" );
    common_scripts\utility::flag_clear( "FLAG_ambient_ac130_close_mi17s" );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_greenlight"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["hqr"]["ac130_hqr_bombrun"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_friendlybirds"], 1, 10.0 );
    var_1 = getent( "fdr_a10", "targetname" );
    var_1 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62BF );
    var_1 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62C1, "scn_ac130_bomber_sonic_boom" );
    var_1 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62C4 );
    var_2 = maps\_utility::_id_1BF9( "fdr_a10", "targetname" );
    var_2 = maps\_utility::_id_27EC( var_2 );
    var_3 = [];

    foreach ( var_6, var_5 in var_2 )
    {
        var_1.count = 1;
        var_1.origin = var_5.origin;
        var_1.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_1.target = var_5.target;
        var_3[var_6] = var_1 maps\_utility::_id_1FA3();
        wait 0.1;
    }

    var_3[1] maps\_utility::delaythread( 0.05, maps\_vehicle::_id_1FA6 );
    var_3[2] maps\_utility::delaythread( 0.5, maps\_vehicle::_id_1FA6 );
    var_3[3] maps\_utility::delaythread( 1.0, maps\_vehicle::_id_1FA6 );
    maps\_utility::delaythread( 6.0, common_scripts\utility::flag_set, "FLAG_fdr_kill_all_enemies" );
    maps\_utility::delaythread( 0.5, common_scripts\utility::flag_set, "FLAG_fdr_delta_ready_to_move_to_street" );
    wait 4.25;
    common_scripts\utility::exploder( "bombing_run" );
    common_scripts\utility::flag_set( "FLAG_fdr_carpet_bombing_start" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_jets" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_mi17s" );
    wait 3.0;
    _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_fireworks"], 1, 10.0 );
    thread _id_5CFE::_id_5C78();
    thread _id_5F9E::_id_5EEF( "sm_sunsamplesizenear", 1.0, 5 );
    common_scripts\utility::flag_set( "FLAG_fdr_carpet_bombing_finished" );
    objective_state( maps\_utility::_id_2816( "OBJ_FDR_Clear_Area" ), "done" );
    var_1 delete();
}

_id_63C6()
{

}

_id_63C7()
{
    var_0 = [];
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "fdr_t72", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "fdr_btr", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "fdr_btr_target", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "fdr_mi17", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "fdr_mi17_pilot", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "fdr_mi17_enemy", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "fdr_bm21", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "fdr_enemy", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "fdr_a10", "targetname" ) );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_2 notify( "death" );
            var_2 delete();
        }
    }

    _id_63C8();
}

_id_63C8()
{
    var_0 = [];
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "fdr_signal_ac130", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "fdr_t72", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "fdr_btr", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "fdr_bm21", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "fdr_enemy_spot", "targetname" ) );
    var_1 = common_scripts\utility::getstructarray( "fdr_mi17", "targetname" );

    foreach ( var_3 in var_1 )
        var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F52( var_3.target ) );

    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "fdr_a10", "targetname" ) );
    thread maps\_utility::_id_2122( var_0, 0.2 );
}

_id_63C9()
{

}

_id_63CA()
{
    if ( common_scripts\utility::flag( "FLAG_fdr_enemy_vehicles_killed" ) )
        return;

    common_scripts\utility::flag_set( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_jets" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_mi17s" );
    level._id_5EA0 = 1;
    thread _id_63A9();
    setdvar( "pip_enabled", 0 );
    _id_5F9E::_id_5F32( 0, 1 );

    if ( isdefined( level._id_6384 ) )
        level._id_6384 common_scripts\utility::delaycall( 0.05, ::destroy );

    level.player freezecontrols( 1 );
    _id_638F( "fdr" );
    _id_5CFE::_id_5C9F();
    common_scripts\utility::flag_set( "FLAG_fdr_mark_enemy_targets" );
    common_scripts\utility::flag_set( "FLAG_fdr_mark_friendly_targets" );
    thread _id_63B6();
    thread _id_63B8();
    thread _id_63B9();
    thread _id_63BE();
    thread _id_63C2();
    thread _id_63C4();
    var_0 = _id_5F9E::_id_5F51( 4, "script_index", _id_5F9E::_id_5F52( "city_area_loop_0_out" ) )[0];
    level._id_5EB8 _id_5F9E::_id_5F3C( var_0 );
    level._id_5EB8 vehicle_setspeedimmediate( 20, 1, 1 );
    thread _id_6385( "loop_2" );
    _id_63CB();
    var_1 = maps\_utility::_id_283B( "e3_player_focus", "targetname" );
    level.player setplayerangles( vectortoangles( var_1.origin - level.player.origin ) );
    wait 1.0;
    _id_5F9E::_id_5F33( 1, 0 );
    level.player freezecontrols( 0 );
    objective_add( maps\_utility::_id_2816( "OBJ_FDR_Clear_Area" ), "current", &"PARIS_AC130_OBJ_FDR_CLEAR_AREA_FOR_KILO_1_1" );
    thread _id_63C5();
    common_scripts\utility::flag_set( "FLAG_fdr_ac130_circling_fdr" );
    common_scripts\utility::flag_set( "FLAG_fdr_enemy_vehicles_killed" );
}

_id_63CB()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_thanks"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_solidcopy"], 1, 10.0 );
    common_scripts\utility::flag_set( "FLAG_fdr_dialogue_finished" );
}

_id_63CC()
{
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_enemy_", "targetname", 1 );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "city_area_pfr_enemy_1", "targetname" ) );
    var_1 = [];
    var_1["after_spawn"] = [];
    var_1["after_spawn"]["pass_value"] = [];
    var_1["after_spawn"]["pass_value"][0] = maps\paris_ac130_code::_id_625E;
    var_1["after_spawn"]["caller"] = [];
    var_1["after_spawn"]["caller"][0] = maps\paris_ac130_code::_id_6360;
    var_1["after_spawn"]["caller"][1] = maps\paris_ac130_code::_id_636C;
    var_1["after_spawn"]["caller"][2] = maps\paris_ac130_code::_id_636B;
    var_1["after_spawn"]["caller"][3] = maps\paris_ac130_code::_id_6281;
    var_1["after_spawn"]["caller"][4] = maps\paris_ac130_code::_id_5EA4;
    var_1["after_spawn"]["caller"][5] = maps\paris_ac130_code::_id_6366;
    var_1["before_spawner_cleanup"] = [];
    var_1["before_spawner_cleanup"]["pass_value"] = [];

    if ( !common_scripts\utility::flag( "FLAG_street_ma_1_delta_reached" ) )
    {
        var_0[0]._id_6276 = [];
        var_0[0]._id_6275 = 6;
        var_0[0]._id_627A = 0.75;
        var_0[0]._id_627B = 6;
        var_0[0]._id_627C = 1.0;
        var_0[0]._id_6279 = var_1;
        var_0[0]._id_6279["after_spawn"]["pass_value"][1] = maps\paris_ac130_code::_id_6265;
        var_0[0]._id_6279["before_spawner_cleanup"]["pass_value"][0] = maps\paris_ac130_code::_id_6266;
        var_0[0] thread maps\paris_ac130_code::_id_6274( "FLAG_street_ma_1_delta_reached" );
    }

    if ( !common_scripts\utility::flag( "FLAG_street_ma_2_flank_spawned" ) )
    {
        var_0[1]._id_6276 = [];
        var_0[1]._id_6275 = 8;
        var_0[1]._id_627A = 0.75;
        var_0[1]._id_627B = 8;
        var_0[1]._id_627C = 1.0;
        var_0[1]._id_6279 = var_1;
        var_0[1] thread maps\paris_ac130_code::_id_6274( "FLAG_street_ma_2_flank_spawned" );
    }

    if ( !common_scripts\utility::flag( "FLAG_street_ma_3_delta_reached" ) )
    {
        var_0[2]._id_6276 = [];
        var_0[2]._id_6275 = 5;
        var_0[2]._id_627A = 0.3;
        var_0[2]._id_627B = 6;
        var_0[2]._id_627C = 0.3;
        var_0[2]._id_6279 = var_1;
        var_0[2] thread maps\paris_ac130_code::_id_6274( "FLAG_street_ma_3_delta_reached" );
    }

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_destroyed" ) )
    {
        var_0[3]._id_6276 = [];
        var_0[3]._id_6275 = 2;
        var_0[3]._id_627A = 1.5;
        var_0[3]._id_627B = 2;
        var_0[3]._id_627C = 1.5;
        var_0[3]._id_6279 = var_1;
        var_0[3] thread maps\paris_ac130_code::_id_6274( "FLAG_rpg_building_destroyed" );
    }

    if ( !common_scripts\utility::flag( "FLAG_chase_started" ) )
    {
        var_0[4]._id_6276 = [];
        var_0[4]._id_6275 = 0;
        var_0[4]._id_627A = 1.5;
        var_0[4]._id_627B = 0;
        var_0[4]._id_627C = 1.5;
        var_0[4]._id_6279 = var_1;
        var_0[4] thread maps\paris_ac130_code::_id_6274( "FLAG_chase_started" );
    }
}

_id_63CD()
{
    wait 0.05;
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_jets" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_close_mi17s" );
    common_scripts\utility::flag_set( "FLAG_fdr_ac130_circling_fdr" );
    common_scripts\utility::flag_set( "FLAG_fdr_intro_dialogue_finished" );
    common_scripts\utility::flag_set( "FLAG_fdr_delta_ready_to_move_to_street" );
    common_scripts\utility::flag_set( "FLAG_fdr_enemy_vehicles_killed" );
    common_scripts\utility::flag_set( "FLAG_ac130_intro" );
    common_scripts\utility::flag_set( "FLAG_ac130_loop_0_to_2" );
    common_scripts\utility::flag_set( "FLAG_ac130_loop_2" );
    objective_add( maps\_utility::_id_2816( "OBJ_FDR_Clear_Area" ), "current", &"PARIS_AC130_OBJ_FDR_CLEAR_AREA_FOR_KILO_1_1" );
    objective_state( maps\_utility::_id_2816( "OBJ_FDR_Clear_Area" ), "done" );
    thread _id_63A9();
    maps\_utility::delaythread( 7.0, ::_id_63C7 );
    _id_638F( "street" );
    _id_5CFE::_id_5C9F();
    var_0 = getvehiclenode( "city_area_loop_2_out", "script_noteworthy" );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_0 );
}

_id_63CE()
{
    thread _id_5CFE::_id_5C78();
    setthreatbias( "axis", "team3", -10000 );
    setthreatbias( "team3", "axis", -10000 );
    setignoremegroup( "axis", "team3" );
    setignoremegroup( "team3", "axis" );
    _id_5CFE::_id_5CE8( 15 );
    common_scripts\utility::flag_wait( "FLAG_fdr_delta_ready_to_move_to_street" );
    thread _id_63D0();
    thread _id_6385( "loop_3" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_delta_reached" );
    objective_add( maps\_utility::_id_2816( "OBJ_STREET_Clear_Area" ), "current", &"PARIS_AC130_OBJ_STREET_CLEAR_STREET_FOR_KILO_1_1" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_2_delta_move_down" );
    thread _id_63DD();
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_move_down" );
    common_scripts\utility::flag_wait( "FLAG_city_area_ma_2_dialogue_finished" );
    thread _id_63E5();
    thread _id_641A();
}

_id_63CF()
{
    var_0 = 5.0;

    if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
        level.player thread maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

    wait 8.0;
    level.player maps\_utility::_id_1823( "HINT_ac130_using_zoom", var_0 );
}

_id_63D0()
{
    thread _id_63DA();
    thread _id_63D3();
    thread _id_63D1();
    var_0 = _id_5F9E::_id_5F90( "street_ma_friendly_cover_0_", "targetname", 0 );
    var_1 = "FLAG_street_ma_1_delta_reached";
    var_2 = 20;
    thread _id_5F9E::_id_5F7C( level._id_6132, "LISTEN_ai_goal_reached", var_1, var_2 );
    level._id_6126 thread maps\paris_ac130_code::_id_6348( level._id_6127, var_0[4], 1 );

    foreach ( var_6, var_4 in level._id_6132 )
    {
        if ( var_6 < 4 )
        {
            var_4 setcandamage( 0 );
            var_4 thread maps\paris_ac130_code::_id_633C( 15.0 );
            var_4 maps\_utility::_id_2053( var_0[var_6] );
        }

        var_5 = 8.0;
        thread _id_5F9E::_id_5F6D( var_4, var_0[var_6], var_5, "LISTEN_ai_goal_reached" );
    }

    common_scripts\utility::flag_wait( "FLAG_street_ma_1_delta_reached" );

    foreach ( var_4 in level._id_6132 )
        var_4 setcandamage( 1 );
}

_id_63D1()
{
    level._id_45C0 waittill( "LISTEN_ai_goal_reached" );
    var_0 = common_scripts\utility::getfx( "FX_signal_ac130" );
    var_1 = maps\_utility::_id_283B( "street_ma_1_signal_ac130", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1 _id_5F9E::_id_5F4F( "angles" );
    var_2 setmodel( "tag_origin" );
    var_3 = vectortoangles( var_1.origin - level._id_45C0.origin );
    var_4 = spawn( "script_model", level._id_45C0.origin );
    var_4.angles = level._id_45C0.angles;
    var_4 setmodel( "tag_origin" );
    level._id_45C0 linkto( var_4, "tag_origin" );
    var_4 rotateyaw( var_3[1] - 180, 0.25 );
    wait 0.25;
    var_4 delete();
    level._id_45C0 thread maps\_anim::_id_11C1( level._id_45C0, "ANIM_throw_grenade" );
    wait 2.33;
    magicgrenade( "fraggrenade", level._id_45C0 gettagorigin( "tag_weapon_right" ), var_1.origin, 2.5 );

    if ( !common_scripts\utility::flag( "FLAG_street_ma_1_encounter_complete" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_clearedhot"], 1, 10.0 );

    playfxontag( var_0, var_2, "tag_origin" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_2_delta_move_down" );
    stopfxontag( var_0, var_2, "tag_origin" );
    var_2 delete();
}

_id_63D2()
{
    common_scripts\utility::flag_wait( "FLAG_fdr_carpet_bombing_finished" );

    if ( !common_scripts\utility::flag( "FLAG_street_ma_1_encounter_complete" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_enemyactivity"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_street_ma_1_encounter_complete" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_rogerwilco"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_street_ma_1_encounter_complete" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_thoseguys"], 1, 10.0 );

    common_scripts\utility::flag_set( "FLAG_street_ma_1_dialogue_finished" );
}

_id_63D3()
{
    common_scripts\utility::flag_set( "FLAG_street_ma_1_encounter_start" );
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_badplace_0_", "targetname", 0 );

    foreach ( var_2 in var_0 )
        badplace_cylinder( var_2.targetname, 0, var_2.origin, 256, 128, "axis" );

    _id_5F9E::_id_5F54( "FLAG_street_ma_1_delta_reached", ::_id_63D5 );
    maps\_utility::delaythread( 1.0, ::_id_63D2 );
    thread _id_63CC();
    maps\_utility::delaythread( 5.0, ::_id_63D6 );
}

_id_63D4()
{
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_dialogue_finished" );
    wait 5.0;
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_hitthoseguys"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_goahead"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_lightemup"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepfiring"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepitcoming"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepitup"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_guysmoving"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_armedeast"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_guysinopen"];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_crossingopen"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_gotakeemout"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 5.0;
    var_4 = 0;

    while ( !common_scripts\utility::flag( "FLAG_street_ma_1_encounter_complete" ) )
    {
        if ( var_1.size == 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                var_1[var_1.size] = var_2;

            if ( var_1.size > 1 )
                var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        }

        var_4 = randomint( var_1.size );
        _id_5CFE::playsoundoverradio( var_0[var_1[var_4]], 0 );
        var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        wait(var_3);
    }
}

_id_63D5()
{
    maps\paris_ac130_code::_id_6254( 15000 );
    thread maps\paris_ac130_code::_id_6252( 90.0 );
    maps\paris_ac130_code::_id_625A( 1 );
    maps\paris_ac130_code::_id_6257( 1 );
    thread _id_63D4();
    thread maps\paris_ac130_code::_id_6263( 4, "FLAG_street_ma_1_encounter_complete" );
    thread maps\paris_ac130_code::_id_625C( 6, "FLAG_street_ma_1_encounter_complete" );
    common_scripts\utility::flag_wait_or_timeout( "FLAG_street_ma_1_encounter_complete", 60.0 );
    maps\paris_ac130_code::_id_6253();
    maps\paris_ac130_code::_id_6254( 15000 );
    maps\paris_ac130_code::_id_6269( 1.0 );
    common_scripts\utility::flag_set( "FLAG_street_ma_2_delta_move_down" );
    var_0 = getent( "city_area_ma_enemy_4", "targetname" );
    var_0._id_6275 = 2;
    var_0._id_627B = 2;
    var_1 = _id_5F9E::_id_5F90( "city_area_ma_badplace_0_", "targetname", 0 );

    foreach ( var_3 in var_1 )
        badplace_delete( var_3.targetname );

    maps\_utility::_id_2122( var_1 );
}

_id_63D6()
{
    var_0 = getent( "city_area_ma_btr", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "btr" );
    var_1 = _id_5F9E::_id_5F52( "city_area_ma_btr" );
    var_2 = var_0 maps\_utility::_id_1FA3();
    _id_5CFE::_id_5C97( [ var_2 ] );
    var_2 maps\_vehicle::_id_1FA6();
    var_3 = "FLAG_street_ma_1_btr_reached_end_of_path";
    var_4 = 128.0;
    thread _id_5F9E::_id_5F66( var_2, var_1[var_1.size - 1], var_4, var_3 );
    thread _id_63D7( var_2 );
    thread _id_63D8( var_2, var_1[var_1.size - 1] );
    var_2 thread _id_63D9( 60.0 );
    wait 0.05;
    var_0 delete();
    var_5 = level._id_6132;
    var_5[var_5.size] = level._id_6127;
    var_2 thread maps\paris_ac130_code::_id_62CE( "city_area_ma_btr", "script_noteworthy" );
    var_2 thread maps\paris_ac130_code::_id_62D2( var_5 );
    var_2 waittill( "death" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_btr_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_btr_reached_end_of_path" );
}

_id_63D7( var_0 )
{
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_dialogue_finished" );
    var_1 = 0;

    while ( !common_scripts\utility::flag( "FLAG_street_ma_1_btr_killed" ) && !common_scripts\utility::flag( "FLAG_street_ma_1_btr_reminder" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ac130_loop_0_to_2" ) )
        {
            if ( !var_1 )
            {
                if ( maps\_utility::within_fov( level.player geteye(), level.player getplayerangles(), var_0.origin, cos( 40 ) ) )
                    var_1 = 1;
            }

            if ( var_1 )
            {
                _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_btrdownalley"], 1, 10.0 );
                break;
            }
        }

        wait 0.05;
    }
}

_id_63D8( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_dialogue_finished" );
    var_2 = [];
    var_2[var_2.size] = level.scr_sound["snd"]["ac130_snd_btrneutralized"];
    var_2[var_2.size] = level.scr_sound["snd"]["ac130_snd_takeoutbtr"];
    var_2[var_2.size] = level.scr_sound["snd"]["ac130_snd_needbtrdown"];
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_3[var_3.size] = var_4;

    var_5 = 7.5;
    var_6 = 0;
    var_7 = level._id_6132;
    var_7[var_7.size] = level._id_6127;
    var_8 = 0;
    var_9 = 0;
    var_10 = 512.0;
    var_0 thread _id_5F9E::_id_5F6F( var_0, var_1, var_10, "LISTEN_btr_close_to_goal" );

    while ( !common_scripts\utility::flag( "FLAG_street_ma_1_btr_killed" ) )
    {
        if ( !var_8 )
        {
            var_0 waittill( "LISTEN_btr_close_to_goal" );
            common_scripts\utility::flag_set( "FLAG_street_ma_1_btr_reminder" );
            var_8 = 1;

            if ( !common_scripts\utility::flag( "FLAG_street_ma_1_btr_killed" ) )
                _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_enemyarmor"], 0 );

            if ( !common_scripts\utility::flag( "FLAG_street_ma_1_btr_killed" ) )
                _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_enemyarmor"], 0 );

            wait 5.0;
        }
        else
        {
            if ( var_3.size == 0 )
            {
                for ( var_4 = 0; var_4 < var_2.size; var_4++ )
                    var_3[var_3.size] = var_4;

                if ( var_3.size > 1 )
                    var_3 = maps\_utility::array_remove_index( var_3, var_6 );
            }

            var_6 = randomint( var_3.size );
            _id_5CFE::playsoundoverradio( var_2[var_3[var_6]], 0 );
            var_3 = maps\_utility::array_remove_index( var_3, var_6 );
            wait(var_5);
        }

        wait 0.05;
    }
}

_id_63D9( var_0 )
{
    self endon( "death" );
    var_0 = common_scripts\utility::ter_op( var_0 < 0, 10, var_0 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_btr_reached_end_of_path" );
    wait(var_0);
    _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_HVI_KILLED" );
}

_id_63DA()
{
    var_0 = getent( "street_ma1_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E1, "street_ma1_mi17", "targetname", "STATE_air" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "mi17" );
    var_1 = maps\_utility::_id_1BF9( "street_ma1_mi17", "targetname" );
    var_2 = getent( "street_ma1_mi17_pilot", "targetname" );
    var_3 = getent( "street_ma1_mi17_enemy", "targetname" );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6369 );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6281 );
    var_4 = var_1[0];

    foreach ( var_6 in var_1 )
    {
        if ( !maps\_utility::_id_26AD( var_6.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
        {
            var_4 = var_6;
            break;
        }
    }

    var_0.count = 1;
    var_0.angles = var_4 _id_5F9E::_id_5F4F( "angles" );
    var_0.origin = var_4.origin;
    var_0.target = var_4.target;
    var_8 = var_0 maps\_utility::_id_1FA3();
    wait 0.05;
    var_8 maps\_utility::delaythread( 1.0, ::_id_63DC );
    var_8 maps\_utility::delaythread( 1.0, ::_id_63DB );
    var_8 thread maps\paris_ac130_code::_id_62F3( var_2 );
    var_8 thread maps\paris_ac130_code::_id_62F4( var_3, 3 );
    var_8 thread maps\paris_ac130_code::_id_62F1();
    common_scripts\utility::flag_wait( "FLAG_fdr_carpet_bombing_finished" );

    if ( isdefined( var_8 ) && isalive( var_8 ) )
        _id_5CFE::_id_5C97( [ var_8 ] );

    var_0 delete();
    var_8 waittill( "death" );

    foreach ( var_6 in var_1 )
        maps\_utility::_id_2122( _id_5F9E::_id_5F52( var_6.target ), 0.25 );
}

_id_63DB()
{
    var_0 = self._id_62EB;
    maps\_utility::_id_1654( "FLAG_helicopter_passengers_unloading" );
    var_1 = getnodearray( "city_area_ma_enemy_cover_4", "targetname" );

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) && isai( var_3 ) )
        {
            var_3 thread maps\paris_ac130_code::_id_6281();
            var_4 = undefined;

            foreach ( var_6 in var_1 )
            {
                if ( !isdefined( var_6.owner ) )
                {
                    var_4 = var_6;
                    break;
                }
            }

            if ( isdefined( var_4 ) )
                var_3 maps\_utility::_id_2053( var_4 );
        }
    }

    maps\_utility::delaythread( 3.0, _id_5CFE::_id_5C97, var_0 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_2_delta_move_down" );

    if ( isdefined( var_0 ) )
    {
        thread maps\paris_ac130_code::_id_6266( var_0 );

        while ( !_id_5F9E::_id_5F4B( 1.0, var_0 ) && !common_scripts\utility::flag( "FLAG_street_ma_1_helicopter_enemies_killed" ) )
            wait 0.05;
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_1_helicopter_enemies_killed" );
}

_id_63DC()
{
    self waittill( "death" );

    if ( !maps\_utility::_id_1008( "FLAG_helicopter_passengers_unloaded" ) )
        common_scripts\utility::flag_set( "FLAG_street_ma_1_helicopter_enemies_killed" );

    common_scripts\utility::flag_set( "FLAG_street_ma_1_helicopter_killed" );
}

_id_63DD()
{
    thread _id_63DE();
    var_0 = level._id_6132;
    var_1 = _id_5F9E::_id_5F92( "city_area_ma_friendly_cover_1_", "targetname", 0, 4 );
    var_2 = "FLAG_street_ma_2_delta_reached";
    var_3 = 10;
    thread _id_5F9E::_id_5F7C( var_0, "LISTEN_ai_goal_reached", var_2, var_3 );
    level._id_6126 thread maps\paris_ac130_code::_id_6348( level._id_6127, var_1[4], 1 );

    foreach ( var_7, var_5 in var_0 )
    {
        if ( var_7 < 4 )
            var_5 maps\_utility::_id_2053( var_1[var_7] );

        var_6 = 8.0;
        thread _id_5F9E::_id_5F6D( var_5, var_1[var_7], var_6, "LISTEN_ai_goal_reached" );
    }

    maps\_utility::delaythread( 5.0, ::_id_63E0 );
    maps\_utility::delaythread( 5.0, ::_id_63DF );
    common_scripts\utility::flag_wait( "FLAG_street_ma_2_delta_reached" );
}

_id_63DE()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_moveup"], 1, 5.0 );
    wait 2.0;
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_dangerclose"], 1, 5.0 );
}

_id_63DF()
{
    level._id_45C0 waittill( "LISTEN_ai_goal_reached" );
    var_0 = common_scripts\utility::getfx( "FX_signal_ac130" );
    var_1 = maps\_utility::_id_283B( "street_ma_2_signal_ac130", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1 _id_5F9E::_id_5F4F( "angles" );
    var_2 setmodel( "tag_origin" );
    var_3 = vectortoangles( var_1.origin - level._id_45C0.origin );
    var_4 = spawn( "script_model", level._id_45C0.origin );
    var_4.angles = level._id_45C0.angles;
    var_4 setmodel( "tag_origin" );
    level._id_45C0 linkto( var_4, "tag_origin" );
    var_4 rotateyaw( var_3[1] - 180, 0.25 );
    wait 0.25;
    var_4 delete();
    level._id_45C0 thread maps\_anim::_id_11C1( level._id_45C0, "ANIM_throw_grenade" );
    wait 2.33;
    magicgrenade( "fraggrenade", level._id_45C0 gettagorigin( "tag_weapon_right" ), var_1.origin, 2.5 );
    playfxontag( var_0, var_2, "tag_origin" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_move_down" );
    stopfxontag( var_0, var_2, "tag_origin" );
    var_2 delete();
}

_id_63E0()
{
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_badplace_1_", "targetname", 0 );

    foreach ( var_2 in var_0 )
        badplace_cylinder( var_2.targetname, 0, var_2.origin, 256, 128, "axis" );

    _id_5F9E::_id_5F54( "FLAG_street_ma_2_flank_spawned", ::_id_63E2 );
    maps\_utility::delaythread( 5.0, ::_id_63E4 );
}

_id_63E1()
{
    wait 5.0;
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_hitthoseguys"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_goahead"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_lightemup"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepfiring"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepitcoming"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepitup"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_guysmoving"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_armedeast"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_guysinopen"];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_crossingopen"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_gotakeemout"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 5.0;
    var_4 = 0;

    while ( !common_scripts\utility::flag( "FLAG_street_ma_2_encounter_complete" ) )
    {
        if ( var_1.size == 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                var_1[var_1.size] = var_2;

            if ( var_1.size > 1 )
                var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        }

        var_4 = randomint( var_1.size );
        _id_5CFE::playsoundoverradio( var_0[var_1[var_4]], 0 );
        var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        wait(var_3);
    }
}

_id_63E2()
{
    var_0 = getent( "city_area_ma_enemy_2", "targetname" );
    var_0._id_6279["after_spawn"]["pass_value"][1] = maps\paris_ac130_code::_id_6265;
    var_0._id_6279["before_spawner_cleanup"]["pass_value"][0] = maps\paris_ac130_code::_id_6266;
    maps\paris_ac130_code::_id_6254( 15000 );
    thread maps\paris_ac130_code::_id_6252( 90.0 );
    maps\paris_ac130_code::_id_6257( 2 );
    maps\paris_ac130_code::_id_6267();
    maps\paris_ac130_code::_id_625F();
    thread _id_63E1();
    thread maps\paris_ac130_code::_id_6263( 3, "FLAG_street_ma_2_encounter_complete" );
    thread maps\paris_ac130_code::_id_6264( 0.75, "FLAG_street_ma_2_encounter_complete" );
    thread maps\paris_ac130_code::_id_625C( 6, "FLAG_street_ma_2_encounter_complete" );
    common_scripts\utility::flag_wait_or_timeout( "FLAG_street_ma_2_encounter_complete", 60.0 );
    maps\paris_ac130_code::_id_6253();
    maps\paris_ac130_code::_id_6254( 15000 );
    maps\paris_ac130_code::_id_6269( 1.0 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_helicopter_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_delta_move_down" );
    var_0 = getent( "city_area_ma_enemy_4", "targetname" );
    var_0._id_6275 = 9;
    var_0._id_627B = 9;
    var_1 = _id_5F9E::_id_5F90( "city_area_ma_badplace_1_", "targetname", 0 );

    foreach ( var_3 in var_1 )
        badplace_delete( var_3.targetname );

    maps\_utility::_id_2122( var_1 );
}

_id_63E3()
{
    if ( !common_scripts\utility::flag( "FLAG_street_ma_2_flank_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_onourflank"], 1, 10.0 );

    wait 1.0;

    if ( !common_scripts\utility::flag( "FLAG_street_ma_2_encounter_complete" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_gettinghit"], 1, 10.0 );

    common_scripts\utility::flag_set( "FLAG_city_area_ma_2_dialogue_finished" );
}

_id_63E4()
{
    maps\_utility::delaythread( 8.0, ::_id_63E3 );
    var_0 = getent( "city_area_ma_2_enemy_3", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6281 );
    var_1 = _id_5F9E::_id_5F90( "street_ma_friendly_cover_0_", "targetname", 0 );
    var_2 = [];

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_0.count = 1;
        var_4 = var_0 stalingradspawn();

        if ( !maps\_utility::_id_13AF( var_4 ) )
        {
            var_2[var_3] = var_4;
            var_2[var_3] maps\_utility::_id_2053( var_1[var_3] );
            var_2[var_3] thread maps\paris_ac130_code::_id_6367();
            var_2[var_3] thread maps\paris_ac130_code::_id_636C();
            var_2[var_3] thread maps\paris_ac130_code::_id_636B();
            var_2[var_3] maps\_utility::delaythread( 15.0, maps\paris_ac130_code::_id_636A, 45.0, 10.0 );
            wait 2.0;
            _id_5CFE::_id_5C97( [ var_2[var_3] ] );
        }
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_2_flank_spawned" );
    _id_5F9E::_id_5F7C( var_2, "death", "FLAG_street_ma_2_flank_killed", 30.0 );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4 ) && isalive( var_4 ) )
        {
            var_4 dodamage( 10000, var_4.origin );
            wait 1.5;
        }
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_2_flank_killed" );
}

_id_63E5()
{
    thread _id_63E6();
    var_0 = level._id_6132;
    var_0[var_0.size] = level._id_6127;
    var_1 = _id_5F9E::_id_5F90( "city_area_ma_friendly_cover_2_", "targetname", 0 );
    var_2 = "FLAG_street_ma_3_delta_reached";
    var_3 = 10;
    thread _id_5F9E::_id_5F7C( var_0, "LISTEN_ai_goal_reached", var_2, var_3 );
    level._id_6126 thread maps\paris_ac130_code::_id_6348( level._id_6127, var_1[4], 1 );

    foreach ( var_7, var_5 in var_0 )
    {
        if ( var_7 < 4 )
            var_5 maps\_utility::_id_2053( var_1[var_7] );

        var_6 = 8.0;
        thread _id_5F9E::_id_5F6D( var_5, var_1[var_7], var_6, "LISTEN_ai_goal_reached" );
    }

    maps\_utility::delaythread( 0.05, ::_id_63E8 );
    maps\_utility::delaythread( 0.05, ::_id_63E7 );
    maps\_utility::delaythread( 0.05, ::_id_640B );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_reached" );
}

_id_63E6()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_goodwork"], 1, 5.0 );
    wait 2.0;
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_aheadofyou"], 1, 5.0 );
}

_id_63E7()
{
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_reached" );
    var_0 = common_scripts\utility::getfx( "FX_signal_ac130" );
    var_1 = maps\_utility::_id_283B( "street_ma_3_signal_ac130", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1 _id_5F9E::_id_5F4F( "angles" );
    var_2 setmodel( "tag_origin" );
    var_3 = vectortoangles( var_1.origin - level._id_45C0.origin );
    var_4 = spawn( "script_model", level._id_45C0.origin );
    var_4.angles = level._id_45C0.angles;
    var_4 setmodel( "tag_origin" );
    level._id_45C0 linkto( var_4, "tag_origin" );
    var_4 rotateyaw( var_3[1] - 180, 0.25 );
    wait 0.25;
    var_4 delete();
    level._id_45C0 thread maps\_anim::_id_11C1( level._id_45C0, "ANIM_throw_grenade" );
    wait 2.33;
    magicgrenade( "fraggrenade", level._id_45C0 gettagorigin( "tag_weapon_right" ), var_1.origin, 2.5 );
    playfxontag( var_0, var_2, "tag_origin" );
    common_scripts\utility::flag_wait( "FLAG_rpg_ac130_angel_flare_start" );
    stopfxontag( var_0, var_2, "tag_origin" );
    var_2 delete();
}

_id_63E8()
{
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_badplace_2_", "targetname", 0 );

    foreach ( var_2 in var_0 )
        badplace_cylinder( var_2.targetname, 0, var_2.origin, 256, 128, "axis" );

    thread _id_640A();
}

_id_6409()
{
    wait 5.0;
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_hitthoseguys"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_goahead"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_lightemup"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keephittinem"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepfiring"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepitcoming"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_keepitup"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_guysmoving"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_armedeast"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_guysinopen"];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_crossingopen"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_gotakeemout"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 4.0;
    var_4 = 0;

    while ( !common_scripts\utility::flag( "FLAG_street_ma_3_encounter_complete" ) )
    {
        if ( var_1.size == 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                var_1[var_1.size] = var_2;

            if ( var_1.size > 1 )
                var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        }

        var_4 = randomint( var_1.size );
        _id_5CFE::playsoundoverradio( var_0[var_1[var_4]], 0 );
        var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        wait(var_3);
    }
}

_id_640A()
{
    var_0 = getent( "city_area_ma_enemy_3", "targetname" );
    var_0._id_6279["after_spawn"]["pass_value"][1] = maps\paris_ac130_code::_id_6265;
    var_0._id_6279["before_spawner_cleanup"]["pass_value"][0] = maps\paris_ac130_code::_id_6266;
    maps\paris_ac130_code::_id_6254( 15000 );
    thread maps\paris_ac130_code::_id_6252( 90.0 );
    maps\paris_ac130_code::_id_6257( 3 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_btr_killed" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_reached" );
    maps\paris_ac130_code::_id_6267();
    maps\paris_ac130_code::_id_625F();
    thread _id_6409();
    thread maps\paris_ac130_code::_id_6263( 2, "FLAG_street_ma_3_encounter_complete" );
    thread maps\paris_ac130_code::_id_6264( 0.5, "FLAG_street_ma_3_encounter_complete" );
    thread maps\paris_ac130_code::_id_625C( 4, "FLAG_street_ma_3_encounter_complete" );
    common_scripts\utility::flag_wait_or_timeout( "FLAG_street_ma_3_encounter_complete", 60.0 );
    maps\paris_ac130_code::_id_6254( 15000 );
    maps\paris_ac130_code::_id_6253();
    maps\paris_ac130_code::_id_6254( 15000 );
    maps\paris_ac130_code::_id_6269( 1.0 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_helicopter_1_enemies_killed" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_helicopter_2_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_rpg_delta_move_down" );
    var_0 = getent( "city_area_ma_enemy_4", "targetname" );
    var_0._id_6275 = 14;
    var_0._id_627B = 14;
}

_id_640B()
{
    var_0 = getent( "street_ma3_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E1, "city_area_ma3_helicopter", "targetname", "STATE_air" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "mi17" );
    var_1 = maps\_utility::_id_1BF9( "street_ma3_mi17", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = getent( "street_ma3_mi17_pilot", "targetname" );
    var_3 = getent( "street_ma3_mi17_enemy", "targetname" );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6369 );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6281 );
    var_4 = [];
    var_4[0] = var_1[0];
    var_4[1] = var_1[1];

    foreach ( var_7, var_6 in var_1 )
    {
        if ( !( var_7 % 2 ) )
        {
            if ( !maps\_utility::_id_26AD( var_6.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
            {
                var_4[0] = var_6;
                var_4[1] = var_1[var_7 + 1];
                break;
            }
        }
    }

    var_8 = [];

    foreach ( var_7, var_6 in var_4 )
    {
        var_0.count = 1;
        var_0.angles = var_6 _id_5F9E::_id_5F4F( "angles" );
        var_0.origin = var_6.origin;
        var_0.target = var_6.target;
        var_8[var_7] = var_0 maps\_utility::_id_1FA3();
        wait 0.05;
        _id_5CFE::_id_5C97( [ var_8[var_7] ] );

        switch ( var_7 )
        {
            case 0:
                var_8[0] maps\_utility::delaythread( 1.0, ::_id_640F );
                var_8[0] maps\_utility::delaythread( 1.0, ::_id_640E );
                break;
            case 1:
                var_8[1] maps\_utility::delaythread( 1.0, ::_id_6411 );
                var_8[1] maps\_utility::delaythread( 1.0, ::_id_6410 );
                break;
        }

        var_8[var_7] thread maps\paris_ac130_code::_id_62F3( var_2 );
        var_8[var_7] thread maps\paris_ac130_code::_id_62F4( var_3, 2 );
        var_8[var_7] thread maps\paris_ac130_code::_id_62F1();
        wait 2.0;
    }

    thread _id_640D( var_8 );
    thread _id_640C();
    var_0 delete();
}

_id_640C()
{
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_helicopter_1_killed" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_helicopter_2_killed" );

    if ( !common_scripts\utility::flag( "FLAG_rpg_delta_fallback" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_vehiclesneutralized"], 0 );
}

_id_640D( var_0 )
{
    while ( !common_scripts\utility::flag( "FLAG_street_ma_3_helicopter_sighted" ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( maps\_utility::_id_26AD( var_2.origin, cos( 55 ) ) )
            {
                common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_sighted" );
                break;
            }
        }

        wait 0.05;
    }

    wait 4.0;

    if ( !common_scripts\utility::flag( "FLAG_street_ma_3_helicopter_1_killed" ) && !common_scripts\utility::flag( "FLAG_street_ma_3_helicopter_2_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_twobirds"], 1, 10.0 );
}

_id_640E()
{
    var_0 = self._id_62EB;
    maps\_utility::_id_1654( "FLAG_helicopter_passengers_unloading" );
    var_1 = getnodearray( "city_area_ma_enemy_cover_4", "targetname" );

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) && isai( var_3 ) )
        {
            var_3 thread maps\paris_ac130_code::_id_6281();
            var_4 = undefined;

            foreach ( var_6 in var_1 )
            {
                if ( !isdefined( var_6.owner ) )
                {
                    var_4 = var_6;
                    break;
                }
            }

            if ( isdefined( var_4 ) )
                var_3 maps\_utility::_id_2053( var_4 );
        }
    }

    maps\_utility::delaythread( 3.0, _id_5CFE::_id_5C97, var_0 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_move_down" );

    if ( isdefined( var_0 ) )
    {
        thread maps\paris_ac130_code::_id_6266( var_0 );

        while ( !_id_5F9E::_id_5F4B( 1.0, var_0 ) && !common_scripts\utility::flag( "FLAG_street_ma_3_helicopter_1_enemies_killed" ) )
            wait 0.05;
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_enemies_killed" );
}

_id_640F()
{
    var_0 = common_scripts\utility::waittill_any_return( "death", "LISTEN_helicopter_passengers_unloaded" );

    if ( var_0 == "LISTEN_helicopter_passengers_unloaded" )
    {
        common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_unloaded" );
        self waittill( "death" );
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_unloaded" );
}

_id_6410()
{
    var_0 = self._id_62EB;
    maps\_utility::_id_1654( "FLAG_helicopter_passengers_unloading" );
    var_1 = getnodearray( "city_area_ma_enemy_cover_4", "targetname" );

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) && isai( var_3 ) )
        {
            var_3 thread maps\paris_ac130_code::_id_6281();
            var_4 = undefined;

            foreach ( var_6 in var_1 )
            {
                if ( !isdefined( var_6.owner ) )
                {
                    var_4 = var_6;
                    break;
                }
            }

            if ( isdefined( var_4 ) )
                var_3 maps\_utility::_id_2053( var_4 );
        }
    }

    maps\_utility::delaythread( 3.0, _id_5CFE::_id_5C97, var_0 );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_move_down" );

    if ( isdefined( var_0 ) )
    {
        thread maps\paris_ac130_code::_id_6266( var_0 );

        while ( !_id_5F9E::_id_5F4B( 1.0, var_0 ) && !common_scripts\utility::flag( "FLAG_street_ma_3_helicopter_2_enemies_killed" ) )
            wait 0.05;
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_enemies_killed" );
}

_id_6411()
{
    var_0 = common_scripts\utility::waittill_any_return( "death", "LISTEN_helicopter_passengers_unloaded" );

    if ( var_0 == "LISTEN_helicopter_passengers_unloaded" )
    {
        common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_unloaded" );
        self waittill( "death" );
    }

    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_unloaded" );
}

_id_6412()
{

}

_id_6413()
{
    var_0 = [];
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "city_area_ma_btr", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "street_ma1_mi17", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "street_ma1_mi17_pilot", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "street_ma1_mi17_enemy", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "street_ma3_mi17", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "street_ma3_mi17_pilot", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "street_ma3_mi17_enemy", "targetname" ) );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_2 notify( "death" );
            var_2 delete();
        }
    }

    _id_6414();
}

_id_6414()
{
    var_0 = [];
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "street_ma_1_signal_ac130", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F90( "city_area_ma_badplace_0_", "targetname", 0 ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "street_ma1_mi17", "targetname" ) );
    var_1 = common_scripts\utility::getstructarray( "street_ma1_mi17", "targetname" );

    foreach ( var_3 in var_1 )
        var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F52( var_3.target ) );

    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "street_ma3_mi17", "targetname" ) );
    var_1 = common_scripts\utility::getstructarray( "street_ma3_mi17", "targetname" );

    foreach ( var_3 in var_1 )
        var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F52( var_3.target ) );

    thread maps\_utility::_id_2122( var_0, 0.2 );
}

_id_6415()
{
    wait 0.05;
    common_scripts\utility::flag_set( "FLAG_fdr_delta_ready_to_move_to_street" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_encounter_start" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_btr_reached_end_of_path" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_btr_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_helicopter_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_helicopter_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_encounter_complete" );
    common_scripts\utility::flag_set( "FLAG_street_ma_1_delta_reached" );
    common_scripts\utility::flag_set( "FLAG_street_ma_2_delta_move_down" );
    common_scripts\utility::flag_set( "FLAG_street_ma_2_delta_reached" );
    common_scripts\utility::flag_set( "FLAG_street_ma_2_flank_spawned" );
    common_scripts\utility::flag_set( "FLAG_street_ma_2_flank_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_2_encounter_complete" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_delta_move_down" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_delta_reached" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_unloaded" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_1_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_unloaded" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_helicopter_2_enemies_killed" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_encounter_complete" );
    common_scripts\utility::flag_set( "FLAG_rpg_delta_move_down" );
    common_scripts\utility::flag_set( "FLAG_ac130_loop_2_to_3" );
    common_scripts\utility::flag_set( "FLAG_ac130_loop_3" );
    objective_add( maps\_utility::_id_2816( "OBJ_STREET_Clear_Area" ), "current", &"PARIS_AC130_OBJ_STREET_CLEAR_STREET_FOR_KILO_1_1" );
    objective_state( maps\_utility::_id_2816( "OBJ_STREET_Clear_Area" ), "done" );
    thread _id_6413();
    var_0 = [];
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "city_area_fdr_btr", "script_noteworthy" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "intro_fdr_btr", "script_noteworthy" ) );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_vehicle::_id_2A13();
        var_2 dodamage( 10000, ( 0.0, 0.0, 0.0 ), level.player );
    }

    _id_638F( "rpg" );
    _id_5CFE::_id_5C9F();
    wait 0.05;
    thread _id_63CC();
    var_4 = getvehiclenode( "city_area_loop_3_out", "script_noteworthy" );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_4 );
    thread _id_641A();
}

_id_6416()
{
    thread _id_5CFE::_id_5C78();
    thread _id_6417();
    common_scripts\utility::flag_wait( "FLAG_rpg_delta_move_down" );
    thread _id_6425();
    common_scripts\utility::flag_wait( "FLAG_rpg_building_valid_target" );
    objective_add( maps\_utility::_id_2816( "OBJ_RPG_Destroy_Building" ), "current", &"PARIS_AC130_OBJ_RPG_DESTROY_RPG_BUILDING" );
    common_scripts\utility::flag_wait( "FLAG_rpg_building_dialgoue_finished" );
    objective_state( maps\_utility::_id_2816( "OBJ_RPG_Destroy_Building" ), "done" );
    thread _id_5CFE::_id_5C78();
    common_scripts\utility::flag_wait( "FLAG_ac130_flare_event_finished" );
    objective_state( maps\_utility::_id_2816( "OBJ_STREET_Clear_Area" ), "done" );
}

_id_6417()
{
    var_0 = 5.0;

    if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
        level.player thread maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

    wait 8.0;
    level.player maps\_utility::_id_1823( "HINT_ac130_using_zoom", var_0 );
}

_id_6418()
{
    thread _id_643D();
    _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_flaresflares"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_flaresaway"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_cleanupsignal"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["j25"]["ac130_j25_inpursuit"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["j24"]["ac130_j24_stayonhim"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["j25"]["ac130_j25_missilelock"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["j24"]["ac130_j24_clearout"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_copythat24"], 1, 10.0 );
    thread _id_6419();
    common_scripts\utility::flag_set( "FLAG_ac130_flare_event_finished" );
}

_id_6419()
{
    _id_5CFE::_id_5CD0( 3, 1.5, 1.5, 0, 0, 15, 0 );
    wait 3.0;
    _id_5CFE::_id_5CD0( 1, 0.5, 0.5, 30, 30, 30, 30 );
}

_id_641A()
{
    level endon( "LISTEN_end_rpg_angel_flare_moment" );
    thread _id_6422();
    var_0 = _id_5F9E::_id_5F52( "city_area_loop_3_out" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3._id_164F ) )
            var_1[var_1.size] = var_3;
    }

    var_5 = getvehiclenodearray( "city_area_loop_3_angel_flare_out", "targetname" );
    var_6 = [];

    foreach ( var_3 in var_5 )
        var_6[var_3._id_164F] = var_3;

    for ( var_9 = 1; !common_scripts\utility::flag( "FLAG_ac130_flare_event_started" ); var_9++ )
    {
        var_9 = common_scripts\utility::ter_op( var_9 >= var_1.size, 0, var_9 );
        var_1[var_9] waittill( "trigger" );

        if ( common_scripts\utility::flag( "FLAG_rpg_ac130_angel_flare_start" ) )
        {
            level._id_5EB8 _id_5F9E::_id_5F3D( var_6[var_1[var_9]._id_164F] );
            _id_641B( var_1[var_9]._id_164F );
            var_10 = getvehiclenode( "city_area_loop_3_to_4_angel_flare_in", "script_noteworthy" );
            level._id_5EB8 _id_5F9E::_id_5F3C( var_10 );
            thread maps\paris_ac130_code::_id_6287( "city_area_loop_3_to_4_angel_flare", var_9 );
            thread _id_6418();
            break;
        }
    }
}

_id_641B( var_0 )
{
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, "1" );
    maps\_utility::delaythread( 0.05, ::_id_641F );
    thread _id_6420();
    thread _id_6421();
    wait 3.0;
}

_id_641C()
{
    maps\_utility::delaythread( 3.0, ::_id_641D );
    maps\_utility::delaythread( 7.0, ::_id_641E );
    maps\_utility::delaythread( 5.0, maps\paris_ac130_code::_id_6289, "city_area_loop_3_angel_flare" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_ac130_avoid_missile_rev" );
    var_0 = getent( "rpg_f15", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62AC );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62B9, "scn_ac130_bomber_sonic_boom" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62BC );
    var_1 = maps\_utility::_id_1BF9( "rpg_f15", "targetname", 0.25 );
    var_2 = getent( "rpg_mig", "targetname" );
    var_2 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6324 );
    var_2 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_632D, "scn_ac130_bomber_sonic_boom" );
    var_2 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6333 );
    var_3 = maps\_utility::_id_1BF9( "rpg_mig", "targetname", 0.25 );
    var_4 = 0.5;
    var_5 = [];

    foreach ( var_7 in var_1 )
    {
        if ( var_7 _id_5F9E::_id_5F0A( "script_index", level._id_624A ) )
            var_5[var_5.size] = var_7;
    }

    foreach ( var_22, var_10 in var_5 )
    {
        var_11 = undefined;

        foreach ( var_7 in var_3 )
        {
            if ( var_7 _id_5F9E::_id_5F0A( "script_index", var_10._id_16A5 ) )
            {
                var_11 = var_7;
                break;
            }
        }

        var_14 = 1.5;
        var_15 = 0;
        var_16 = var_10.origin;
        var_17 = var_16 + 100 * anglestoforward( var_10 _id_5F9E::_id_5F4F( "angles" ) );
        var_18 = vectornormalize( var_17 - var_16 );

        while ( var_15 < var_14 )
        {
            playfx( common_scripts\utility::getfx( "FX_jet_20mm_tracer_close_ac130" ), var_16 + _id_5F9E::_id_5F41( -64, 64 ), var_18 );
            var_15 += 0.05;
            wait 0.05;
        }

        var_19 = undefined;

        if ( isdefined( var_11 ) )
        {
            var_2.count = 1;
            var_2.origin = var_11.origin;
            var_2.angles = var_11 _id_5F9E::_id_5F4F( "angles" );
            var_2.target = var_11.target;
            var_19 = var_2 maps\_utility::_id_1FA3();
            var_19 maps\_utility::delaythread( 0.05, maps\_vehicle::_id_1FA6 );
        }

        var_20 = undefined;

        if ( isdefined( var_10 ) )
        {
            var_0.count = 1;
            var_0.origin = var_10.origin;
            var_0.angles = var_10 _id_5F9E::_id_5F4F( "angles" );
            var_0.target = var_10.target;
            var_20 = var_0 maps\_utility::_id_1FA3();
            var_20 maps\_utility::delaythread( 0.75, maps\_vehicle::_id_1FA6 );
        }

        var_21 = common_scripts\utility::ter_op( isdefined( var_20 ) || isdefined( var_19 ), var_4, 0.1 );
        var_21 = common_scripts\utility::ter_op( var_22 == var_5.size, 0.05, var_4 );
        wait(var_21);
    }

    var_0 delete();
    var_2 delete();
}

_id_641D()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["j25"]["ac130_j25_miginbound"], 1, 10.0 );
    wait 2.0;
    _id_5CFE::playsoundoverradio( level.scr_sound["j25"]["ac130_j25_brokelock"], 1, 10.0 );
}

_id_641E()
{
    level.player thread common_scripts\utility::play_loop_sound_on_entity( "missile_warning" );
    thread _id_5CFE::_id_5C92( 0.1 );
}

_id_641F()
{
    level.player freezecontrols( 1 );
    var_0 = 0;

    if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
    {
        level.player notify( "LISTEN_ac130_change_vision" );
        var_0 += 0.05;
    }

    setdvar( "ac130_zoom_enabled", 0 );
    level._id_5C35 = 55;
    setsaveddvar( "cg_fov", level._id_5C35 );
    level.player lerpfov( level._id_5C35, 0.0166667 );
    wait(var_0);
    setdvar( "ac130_zoom_enabled", 1 );
    level.player freezecontrols( 0 );
}

_id_6420()
{
    level.player playrumblelooponentity( "damage_light" );
    _id_5F9E::_id_5F34( 0.25, 1.0, level.player, 1000 );
    level.player stoprumble( "damage_light" );
    level.player playrumblelooponentity( "damage_light" );
    _id_5F9E::_id_5F34( 0.1, 3.0, level.player, 1000 );
    level.player stoprumble( "damage_light" );
    level.player playrumblelooponentity( "damage_heavy" );
    _id_5F9E::_id_5F34( 0.5, 0.75, level.player, 1000 );
    level.player stoprumble( "damage_heavy" );
    level.player playrumblelooponentity( "damage_light" );
    _id_5F9E::_id_5F34( 0.1, 0.75, level.player, 1000 );
    level.player stoprumble( "damage_light" );
}

_id_6421()
{
    _id_5CFE::_id_5CC4( 0.5, 1 );
    wait 2.0;
    level.player freezecontrols( 1 );
    _id_5CFE::_id_50E0();
    level.player setblurforplayer( 10, 0 );
    _id_5CFE::_id_5CA2( 5.0 );
    _id_5CFE::_id_5CC2( 5.0 );
    common_scripts\utility::flag_set( "FLAG_ac130_angel_flare_teleport" );
    wait 1.5;
    var_0 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ), level._id_5C62, level._id_5C64 );
    level.player setblurforplayer( var_0, 0 );
    _id_5CFE::_id_5CA2( 0.0 );
    var_1 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ), level._id_5C63, level._id_5C65 );
    _id_5CFE::_id_5CC2( var_1 );
    var_2 = common_scripts\utility::ter_op( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ), "thermal", "enhanced" );
    _id_5CFE::_id_50E1( var_2 );
    setdvar( "ac130_zoom_enabled", 0 );
    level._id_5C35 = 55;
    setsaveddvar( "cg_fov", level._id_5C35 );
    level.player lerpfov( level._id_5C35, 0.0166667 );
    level.player freezecontrols( 0 );
}

_id_6422()
{
    thread _id_6423();
    common_scripts\utility::flag_wait( "FLAG_street_ma_1_btr_killed" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_delta_reached" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_helicopter_1_unloaded" );
    common_scripts\utility::flag_wait( "FLAG_street_ma_3_helicopter_2_unloaded" );
    common_scripts\utility::flag_set( "FLAG_street_ma_3_encounter_complete" );

    if ( !common_scripts\utility::flag( "FLAG_ac130_loop_3" ) )
        level._id_5EB8 vehicle_setspeed( 45, 5, 5 );

    common_scripts\utility::flag_wait( "FLAG_rpg_building_falling_down" );
    _id_5CFE::_id_5CD0( 2.0, 1.0, 1.0, 65, 65, 35, 55 );

    if ( !common_scripts\utility::flag( "FLAG_ac130_flare_event_finished" ) )
    {
        common_scripts\utility::flag_wait( "FLAG_rpg_building_dialgoue_finished" );
        _id_641C();
        common_scripts\utility::flag_set( "FLAG_rpg_ac130_angel_flare_start" );
        level._id_5EB8 vehicle_setspeed( 40, 5, 5 );
    }
}

_id_6423()
{
    common_scripts\utility::flag_wait( "FLAG_ac130_loop_3" );
    level._id_6249 = "loop_3";
    level._id_624A = 2;
    var_0 = _id_5F9E::_id_5F52( "city_area_loop_3_out" );
    var_1 = [];

    for ( var_2 = 1; var_2 <= 4; var_2++ )
        var_1[var_2] = _id_5F9E::_id_5F51( var_2, "script_index", var_0 )[0];

    var_2 = 3;

    for ( var_3 = 25.0; !common_scripts\utility::flag( "FLAG_rpg_ac130_angel_flare_start" ); var_2++ )
    {
        var_2 = common_scripts\utility::ter_op( var_2 > 4, 1, var_2 );
        var_1[var_2] common_scripts\utility::waittill_any_timeout( var_3, "trigger" );
        level._id_624A = var_2;
    }
}

_id_6424()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_movinnow"], 1, 10.0 );
}

_id_6425()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_cleartomoveup"], 1, 10.0 );
    var_0 = getaiarray( "axis" );
    var_0 = common_scripts\utility::array_combine( var_0, getaiarray( "team3" ) );
    var_1 = common_scripts\utility::getstruct( "rpg_street_enemy_goal", "targetname" );

    foreach ( var_3 in var_0 )
    {
        var_3 maps\_utility::_id_2724( randomfloatrange( 256, 512 ) );
        var_3 setgoalpos( var_1.origin );
    }

    var_5 = getent( "city_area_ma_enemy_4", "targetname" );
    var_5._id_6279["after_spawn"]["caller"][6] = ::_id_6426;
    thread _id_6429();
    thread _id_6424();
    var_6 = common_scripts\utility::getstructarray( "rpg_friendly_point", "targetname" );
    var_6 = maps\_utility::_id_27EC( var_6 );
    var_7 = getent( "rpg_building_look_at", "targetname" );

    foreach ( var_9 in level._id_6132 )
        var_9 setlookatentity( var_7 );

    level._id_45C0 common_scripts\utility::delaycall( 1.0, ::setgoalpos, var_6[0].origin );
    level._id_6133 setgoalpos( var_6[1].origin );
    level._id_6134 setgoalpos( var_6[2].origin );
    level._id_6135 setgoalpos( var_6[3].origin );
    thread _id_6427();
    level._id_6126 maps\paris_ac130_code::_id_6348( level._id_6127, var_6[4], 1 );
    var_6 = common_scripts\utility::getstructarray( "rpg_friendly_scatter_point", "targetname" );
    var_6 = maps\_utility::_id_27EC( var_6 );

    foreach ( var_12, var_9 in level._id_6132 )
    {
        if ( var_12 < 4 )
            var_9 setgoalpos( var_6[var_12].origin );
    }

    level._id_6126 maps\paris_ac130_code::_id_6348( level._id_6127, var_6[4], 1 );
    var_13 = _id_5F9E::_id_5F90( "city_area_ma_friendly_cover_2_", "targetname", 0 );
    level._id_6126 thread maps\paris_ac130_code::_id_6348( level._id_6127, var_13[4], 1 );

    foreach ( var_12, var_9 in level._id_6132 )
    {
        if ( var_12 < 4 )
            var_9 maps\_utility::_id_2053( var_13[var_12] );
    }

    common_scripts\utility::flag_set( "FLAG_rpg_delta_fallback" );
    common_scripts\utility::flag_wait( "FLAG_ac130_flare_event_started" );
    var_6 = maps\_utility::_id_1BF9( "building_friendly_point", "targetname" );
    var_6 = maps\_utility::_id_27EC( var_6 );
    level._id_6133 invisiblenotsolid();
    level._id_6133 hide();

    if ( target_istarget( level._id_6133 ) )
        target_remove( level._id_6133 );

    level._id_6126 maps\paris_ac130_code::_id_6342();
    level._id_6127 maps\paris_ac130_code::_id_6173();
    wait 0.05;
    var_15 = [ level._id_45C0, level._id_6134, level._id_6135, level._id_6126, level._id_6127 ];

    foreach ( var_12, var_9 in var_15 )
    {
        var_9 setgoalpos( var_6[var_12].origin );
        var_9 forceteleport( var_6[var_12].origin, var_6[var_12] _id_5F9E::_id_5F4F( "angles" ) );
    }

    if ( target_istarget( level._id_6126 ) )
        target_remove( level._id_6126 );

    if ( target_istarget( level._id_6127 ) )
        target_remove( level._id_6127 );
}

_id_6426()
{
    self endon( "death" );
    wait(randomfloatrange( 1.0, 3.0 ));
    var_0 = common_scripts\utility::getstruct( "rpg_street_enemy_goal", "targetname" );
    maps\_utility::_id_2724( randomfloatrange( 256, 512 ) );
    self setgoalpos( var_0.origin );
}

_id_6427()
{
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_badplace_2_", "targetname", 0 );

    foreach ( var_2 in var_0 )
        badplace_delete( var_2.targetname );

    maps\_utility::_id_2122( var_0 );
    var_4 = getent( "city_area_ma_enemy_4", "targetname" );
    var_4._id_6275 = 12;
    var_4._id_627B = 12;
    maps\_utility::delaythread( 0.05, ::_id_6434 );
    maps\_utility::delaythread( 0.05, _id_5F9E::_id_5EF0, [ "FLAG_ac130_loop_3" ], [ "FLAG_rpg_building_valid_target" ] );
    maps\_utility::delaythread( 5.5, ::_id_6428 );
    level._id_5EB8 common_scripts\utility::delaycall( 2.0, ::vehicle_setspeed, 20, 1, 1 );
    thread _id_642A();
    maps\_utility::delaythread( 9.0, ::_id_642F );
    thread _id_6433();
}

_id_6428()
{
    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_woah"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_rpgfire3"], 1, 10.0 );
}

_id_6429()
{
    level._id_45C0 maps\_utility::_id_2612( 1 );
    level._id_45C0 maps\_utility::_id_0A23( 1 );
    level._id_45C0 setcandamage( 0 );
    level._id_45C0 maps\_utility::_id_2714();
    level._id_45C0 _id_5F9E::_id_5F08( 0 );
    level._id_45C0 maps\_utility::_id_1058( 1 );
    level._id_45C0 _id_5F9E::_id_5F09( 1 );
    level._id_45C0 maps\_utility::_id_251F();
    level._id_45C0 maps\_utility::_id_271F();
    level._id_45C0 maps\_utility::_id_1057();
    level._id_45C0 maps\_utility::_id_0EEC();
    level._id_45C0 maps\_utility::_id_280D();
    level._id_45C0 maps\_utility::_id_26F3( 1 );
    wait 2.0;
    level.ac130player thread maps\_utility::play_sound_on_entity( "scn_ac130_pip_onfoot" );
    level._id_3EDA.clipdistance = 5000;
    level._id_3EDA.dofnear = ( 0.0, 0.0, 10.0 );
    level._id_3EDA.doffar = ( 4000.0, 10000.0, 4.0 );
    level._id_3EDA.blurradius = 1;

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_60E5( level._id_623F );

    wait 5.5;

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_6104();

    level._id_3EDA.clipdistance = 0;
    level._id_45C0 maps\_utility::_id_2612( 0 );
    level._id_45C0 maps\_utility::_id_0A23( 0 );
    level._id_45C0 setcandamage( 1 );
    level._id_45C0 maps\_utility::_id_2715();
    level._id_45C0 _id_5F9E::_id_5F08( 1 );
    level._id_45C0 maps\_utility::_id_1058( 0 );
    level._id_45C0 _id_5F9E::_id_5F09( undefined );
    level._id_45C0 maps\_utility::_id_2520();
    level._id_45C0 maps\_utility::_id_2720();
    level._id_45C0 maps\_utility::_id_1071();
    level._id_45C0 maps\_utility::_id_2178( 0 );
    level._id_45C0 maps\_utility::_id_26F3( 0 );
}

_id_642A()
{
    common_scripts\utility::flag_wait( "FLAG_rpg_building_valid_target" );
    thread _id_6430();
    thread _id_642C();
    var_0 = getent( "rpg_building", "script_noteworthy" );
    thread _id_642E();
    common_scripts\utility::flag_wait( "FLAG_rpg_building_damaged" );
    var_0 setcandamage( 1 );
    var_0 dodamage( 1000000, var_0.origin );
    thread common_scripts\utility::exploder( "rpg_building_collapse" );
    var_1 = maps\_utility::_id_283B( "rpg_building_sound", "targetname" );
    level thread common_scripts\utility::play_sound_in_space( "scn_ac130_rpg_building_destruct", var_1.origin );
    var_2 = getentarray( "rpg_building_com_units", "targetname" );

    foreach ( var_4 in var_2 )
        var_4 delete();

    common_scripts\utility::flag_set( "FLAG_rpg_building_falling_down" );
    common_scripts\utility::flag_set( "FLAG_rpg_building_destroyed" );
    var_6 = maps\_utility::_id_283B( "rpg_badplace", "targetname" );
    badplace_cylinder( var_6.targetname, 0, var_6.origin, 1280, 128, "axis" );
    thread _id_642B( var_6.origin, 10.0 );
    common_scripts\utility::flag_wait( "FLAG_ac130_angel_flare_teleport" );
    var_7 = getentarray( "city_area_rpg_building_debris_1", "targetname" );

    foreach ( var_9 in var_7 )
        var_9 show();

    var_11 = getentarray( "city_area_rpg_building_debris_2", "targetname" );

    foreach ( var_9 in var_11 )
        var_9 show();

    var_14 = getentarray( "city_area_rpg_building_debris_3", "targetname" );

    foreach ( var_9 in var_14 )
        var_9 delete();

    badplace_delete( var_6.targetname );
}

_id_642B( var_0, var_1 )
{
    var_1 = _id_5F9E::_id_5F0F( var_1, 0.05 );
    var_2 = 0.5;

    for ( var_3 = 0; var_3 < var_1; var_3 += var_2 )
    {
        var_4 = getaiarray( "axis" );
        var_4 = common_scripts\utility::array_combine( var_4, getaiarray( "team3" ) );

        foreach ( var_6 in var_4 )
        {
            if ( _id_5F9E::_id_5F11( var_0, var_6.origin, 1536 ) )
            {
                var_6 maps\paris_ac130_code::_id_636E();
                var_6 dodamage( 10000, var_6.origin );
            }
        }

        wait(var_2);
    }
}

_id_642C()
{
    common_scripts\utility::flag_wait_or_timeout( "FLAG_rpg_building_falling_down", 180 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_DELTA_KILLED" );
}

_id_642D()
{
    var_0 = 1;
    var_1 = 0;
    var_2 = 5;

    while ( isdefined( self ) && var_0 && !common_scripts\utility::flag( "FLAG_rpg_building_damaged" ) )
    {
        self waittill( "damage", var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
        var_13 = common_scripts\_destructible_types::getinfoindex( "toy_building_collapse_paris_ac130" );

        if ( var_13 > -1 )
            level.destructible_type[var_13].parts[0][0].v["health"] = 1000000;

        if ( _id_5F9E::_id_5F0D( var_4, level.player ) && _id_5F9E::_id_5F0D( var_7, "MOD_PROJECTILE" ) )
        {
            if ( var_3 > 990 )
            {
                var_0 = 0;
                continue;
            }

            if ( var_3 > 200 )
            {
                var_1++;

                if ( var_1 > var_2 )
                    var_0 = 0;
            }
        }
    }

    common_scripts\utility::flag_set( "FLAG_rpg_building_damaged" );
}

_id_642E()
{
    var_0 = getent( "rpg_building_trigger", "targetname" );
    var_1 = 1;
    var_2 = 0;
    var_3 = 5;

    while ( var_1 && !common_scripts\utility::flag( "FLAG_rpg_building_damaged" ) )
    {
        var_0 waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

        if ( _id_5F9E::_id_5F0D( var_5, level.player ) && _id_5F9E::_id_5F0D( var_8, "MOD_PROJECTILE" ) )
        {
            if ( var_4 > 990 )
            {
                var_1 = 0;
                continue;
            }

            if ( var_4 > 200 )
            {
                var_2++;

                if ( var_2 > var_3 )
                    var_1 = 0;
            }
        }
    }

    common_scripts\utility::flag_set( "FLAG_rpg_building_damaged" );
}

_id_642F()
{
    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_smoketrails"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
    {
        common_scripts\utility::flag_set( "FLAG_rpg_building_marked" );
        thread _id_6432();
    }

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_rpgfire"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["hqr"]["ac130_hqr_copystandby"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        wait 1.0;

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["hqr"]["ac130_hqr_anybuildings"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_cornerbuilding"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
        thread _id_6431();

    common_scripts\utility::flag_set( "FLAG_rpg_building_callout_dialgoue_finished" );
    common_scripts\utility::flag_wait( "FLAG_rpg_building_falling_down" );
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_filler" );
    wait 0.05;
    _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_buildingsdone"], 1, 10.0 );
    thread _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_cutthrough"], 1, 10.0 );
    common_scripts\utility::flag_set( "FLAG_rpg_building_dialgoue_finished" );
}

_id_6430()
{
    common_scripts\utility::flag_wait( "FLAG_rpg_building_callout_dialgoue_finished" );
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_rpgfire3"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_levelit"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_hitbuilding"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_rpgfire2"];
    var_0[var_0.size] = level.scr_sound["tvo"]["ac130_tvo_fireonbuilding"];
    var_0[var_0.size] = level.scr_sound["fco"]["ac130_fco_oneohfive"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 2.0;
    var_4 = 0;

    while ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
    {
        if ( var_1.size == 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                var_1[var_1.size] = var_2;

            if ( var_1.size > 1 )
                var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        }

        var_4 = randomint( var_1.size );
        _id_5CFE::playsoundoverradio( var_0[var_1[var_4]], 0 );
        var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        wait(var_3);
    }
}

_id_6431()
{
    var_0 = 5.0;

    if ( !issubstr( level._id_5C3E, "105" ) )
        level.player maps\_utility::_id_1823( "HINT_ac130_change_weapons", var_0 );

    var_1 = 30.0;

    while ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
    {
        if ( !issubstr( level._id_5C3E, "105" ) )
            level.player maps\_utility::_id_1823( "HINT_ac130_change_weapons", var_0 );

        wait(var_1);
    }
}

_id_6432()
{
    var_0 = 5.0;

    if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
        level.player maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

    var_1 = 30.0;

    while ( !common_scripts\utility::flag( "FLAG_rpg_building_falling_down" ) )
    {
        if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
            level.player maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

        wait(var_1);
    }
}

_id_6433()
{
    maps\paris_ac130_code::_id_6267();
    maps\paris_ac130_code::_id_625F();
}

_id_6434()
{
    var_0 = _id_5F9E::_id_5F90( "city_area_ma_4_enemy_", "targetname", 2 );
    var_1 = [];
    var_1["after_spawn"] = [];
    var_1["after_spawn"]["pass_value"] = [];
    var_1["after_spawn"]["pass_value"][0] = ::_id_6435;
    var_1["before_spawner_cleanup"] = [];
    var_1["before_spawner_cleanup"]["caller"] = [];
    var_1["before_spawner_cleanup"]["caller"][0] = _id_5F9E::_id_5F43;
    var_2 = "FLAG_rpg_building_falling_down";

    foreach ( var_5, var_4 in var_0 )
    {
        var_4 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_634D, var_4.targetname, "targetname" );
        var_4 maps\_utility::delaythread( var_5 * 0.5 + 0.05, maps\paris_ac130_code::_id_6272, 1, 0.05, 1, 6.0, var_2, var_1 );
    }
}

_id_6435( var_0 )
{
    common_scripts\utility::flag_wait( "FLAG_rpg_building_marked" );
    _id_5CFE::_id_5C97( [ var_0 ] );
}

_id_6436()
{

}

_id_6437()
{
    var_0 = getent( "rpg_building", "script_noteworthy" );
    var_0 setcandamage( 1 );
    var_0 dodamage( 10000, var_0.origin );
    var_1 = getentarray( "city_area_rpg_building_debris_1", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();

    var_5 = getentarray( "city_area_rpg_building_debris_2", "targetname" );

    foreach ( var_3 in var_5 )
        var_3 show();

    var_8 = [];
    var_8 = common_scripts\utility::add_to_array( var_8, getent( "rpg_building_look_at", "targetname" ) );
    var_8 = common_scripts\utility::array_combine( var_8, getentarray( "rpg_building_com_units", "targetname" ) );
    var_8 = common_scripts\utility::array_combine( var_8, getentarray( "city_area_rpg_building_debris_3", "targetname" ) );

    foreach ( var_10 in var_8 )
    {
        if ( isdefined( var_10 ) )
        {
            var_10 notify( "death" );
            var_10 delete();
        }
    }

    _id_6438();
}

_id_6438()
{
    var_0 = [];
    var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F90( "rpg_friendly_point_", "targetname", 0 ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "building_friendly_point", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "courtyard_building_entrance", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F90( "city_area_ma_4_enemy_", "targetname", 2 ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "rpg_ma_4_enemy_rpg_target_1", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "rpg_ma_4_enemy_rpg_target_2", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "city_area_ma_4_enemy_2_start", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "city_area_ma_4_enemy_3_start", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "city_area_ma_4_enemy_4_start", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "city_area_ma_4_enemy_5_start", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "rpg_badplace", "targetname" ) );
    thread maps\_utility::_id_2122( var_0, 0.2 );
}

_id_6439()
{
    common_scripts\utility::flag_set( "FLAG_ac130_flare_event_finished" );
    common_scripts\utility::flag_set( "FLAG_rpg_building_falling_down" );
    common_scripts\utility::flag_set( "FLAG_rpg_building_destroyed" );
    level notify( "LISTEN_end_rpg_angel_flare_moment" );
    objective_add( maps\_utility::_id_2816( "OBJ_RPG_Destroy_Building" ), "current", &"PARIS_AC130_OBJ_RPG_DESTROY_RPG_BUILDING" );
    objective_state( maps\_utility::_id_2816( "OBJ_RPG_Destroy_Building" ), "done" );
    var_0 = [ getent( "city_area_ma_enemy_1", "targetname" ), getent( "city_area_ma_enemy_2", "targetname" ), getent( "city_area_ma_enemy_3", "targetname" ), getent( "city_area_ma_enemy_4", "targetname" ) ];

    foreach ( var_2 in var_0 )
    {
        var_2._id_6275 = 0;
        var_2._id_627A = 0.05;
        var_2._id_627B = 0;
        var_2._id_627C = 0.05;
    }

    wait 2.0;
    var_4 = getaiarray( "axis" );
    var_4 = common_scripts\utility::array_combine( var_4, getaiarray( "team3" ) );

    foreach ( var_6 in var_4 )
    {
        var_6 notify( "death" );
        var_6 delete();
    }

    var_8 = maps\_utility::_id_1BF9( "building_friendly_point", "targetname" );
    var_8 = maps\_utility::_id_27EC( var_8 );
    level._id_6133 invisiblenotsolid();
    level._id_6133 hide();

    if ( target_istarget( level._id_6133 ) )
        target_remove( level._id_6133 );

    wait 0.05;
    var_9 = [ level._id_45C0, level._id_6134, level._id_6135, level._id_6126, level._id_6127 ];

    foreach ( var_12, var_11 in var_9 )
    {
        var_11 setgoalpos( var_8[var_12].origin );
        var_11 forceteleport( var_8[var_12].origin, var_8[var_12] _id_5F9E::_id_5F4F( "angles" ) );
    }

    wait 0.05;
    var_13 = getvehiclenode( "city_area_loop_4_out", "script_noteworthy" );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_13 );
    common_scripts\utility::flag_set( "FLAG_ac130_loop_4" );
}

_id_643A()
{
    thread _id_5CFE::_id_5C78();
    common_scripts\utility::flag_clear( "FLAG_building_trigger_mission_failed_on" );
    level._id_6126 maps\paris_ac130_code::_id_6342();
    level._id_6127 maps\paris_ac130_code::_id_6173();
    common_scripts\utility::flag_clear( "FLAG_delta_ac130_mission_fail" );
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_filler" );
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_kill" );
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_guy_pain" );
    thread maps\paris_ac130_slamzoom::_id_61E7();
    common_scripts\utility::flag_wait( "player_shot_yellow_building" );
    _id_643B();
    _id_643C();
    common_scripts\utility::flag_clear( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_wait( "FLAG_hvt_escape_hvt_captured" );
    _id_643F();
}

_id_643B()
{
    var_0 = [ [ "fire_falling_runner_point_nocull", ( 331.269, 38772.7, 1361.35 ) ] ];
    _id_5F9E::_id_5F1A( var_0 );
}

_id_643C()
{
    var_0 = spawn( "script_origin", ( 736.0, 42464.0, 0.0 ) );
    var_0.targetname = "compass_map_paris_ac130_courtyard";
    var_1 = spawn( "script_origin", ( 5888.0, 37696.0, 0.0 ) );
    var_1.targetname = "compass_map_paris_ac130_courtyard";
    maps\_compass::setupminimap( "compass_map_paris_ac130_courtyard", "compass_map_paris_ac130_courtyard" );
    setsaveddvar( "ui_hideMap", "0" );
}

_id_643D()
{
    var_0 = common_scripts\utility::getstructarray( "city_area_pfr_enemy_1", "targetname" );
    var_0 = maps\_utility::_id_27EC( var_0 );
    var_0[1].script_noteworthy = "city_area_pfr_enemy_cover_1";
    var_0[2].script_noteworthy = "city_area_pfr_enemy_cover_1";
    var_0[3].script_noteworthy = "city_area_pfr_enemy_cover_0";
    var_0[4].script_noteworthy = "city_area_pfr_enemy_cover_0";
    var_0[5].script_noteworthy = "city_area_pfr_enemy_cover_0";
    var_1 = getent( "city_area_pfr_enemy_1", "targetname" );
    var_1._id_6275 = 0;
    var_1._id_627B = 0;
    var_2 = 4.0;
    var_3 = 0;

    while ( var_3 < var_2 )
    {
        var_4 = getaiarray( "axis" );
        var_4 = common_scripts\utility::array_combine( var_4, getaiarray( "team3" ) );

        foreach ( var_6 in var_4 )
        {
            var_6 notify( "death" );
            var_6 delete();
        }

        var_3 += 0.05;
        wait 0.05;
    }
}

_id_643E()
{
    level.player takeallweapons();
    level.player setviewmodel( "viewmodel_base_viewhands" );
    level.player giveweapon( "m4m203_reflex" );
    level.player givemaxammo( "m4m203_reflex" );
    level.player giveweapon( "usp_no_knife" );
    level.player givemaxammo( "usp_no_knife" );
    level.player setoffhandprimaryclass( "frag" );
    level.player giveweapon( "fraggrenade" );
    level.player setoffhandsecondaryclass( "flash" );
    level.player giveweapon( "flash_grenade" );
    level.player switchtoweapon( "m4m203_reflex" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );
}

_id_643F()
{
    level._id_5EB8 vehicle_setspeedimmediate( 0, 5, 5 );
    var_0 = getvehiclenode( "chase_start_friendly_vehicles", "script_noteworthy" );
    level._id_5EB8 vehicle_teleport( var_0.origin, var_0.angles );
    thread _id_6446();
    level.player freezecontrols( 1 );
    level._id_5EB8 _id_5CFE::_id_5C6F( level.player );
    wait 0.05;
    level._id_5EB8 vehicle_setspeedimmediate( 30, 5, 5 );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_0 );
    var_1 = getent( "chase_player_focus", "targetname" );
    level._id_5C13 snaptotargetentity( var_1 );
    wait 0.2;
    setsaveddvar( "sm_sunenable", 1.0 );
    setsaveddvar( "sm_sunsamplesizenear", 1.0 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    common_scripts\utility::flag_set( "FLAG_courtyard_slamzoom_out_finished" );
}

_id_6440()
{
    common_scripts\utility::flag_set( "FLAG_rpg_ac130_angel_flare_start" );
    common_scripts\utility::flag_set( "FLAG_courtyard_slamzoom_out_finished" );
    common_scripts\utility::flag_set( "FLAG_hvt_escape_hvt_captured" );
    common_scripts\utility::flag_set( "FLAG_interact_button_pressed" );
    var_0 = [ getent( "city_area_ma_enemy_1", "targetname" ), getent( "city_area_ma_enemy_2", "targetname" ), getent( "city_area_ma_enemy_3", "targetname" ), getent( "city_area_pfr_enemy_1", "targetname" ) ];

    foreach ( var_2 in var_0 )
    {
        var_2._id_6275 = 0;
        var_2._id_627A = 0.05;
        var_2._id_627B = 0;
        var_2._id_627C = 0.05;
    }

    wait 5.0;
    var_4 = getaiarray( "axis" );
    var_4 = common_scripts\utility::array_combine( var_4, getaiarray( "team3" ) );

    foreach ( var_6 in var_4 )
    {
        var_6 notify( "death" );
        var_6 delete();
    }

    thread _id_6446();
    var_8 = getvehiclenode( "chase_start_friendly_vehicles", "script_noteworthy" );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_8 );
    var_9 = getent( "chase_player_focus", "targetname" );
    level._id_5C13 snaptotargetentity( var_9 );
    wait 0.2;
}

_id_6441()
{
    thread _id_5CFE::_id_5C78();
    objective_add( maps\_utility::_id_2816( "OBJ_CHASE_Escort" ), "current", &"PARIS_AC130_OBJ_CHASE_ESCORT_KILO_1_1" );
    common_scripts\utility::flag_wait( "FLAG_courtyard_slamzoom_out_finished" );
    common_scripts\utility::flag_set( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_set( "FLAG_building_trigger_mission_failed_on" );
    common_scripts\utility::flag_set( "FLAG_delta_ac130_mission_fail" );
    common_scripts\utility::flag_set( "FLAG_ac130_context_sensitive_dialog_kill" );
    common_scripts\utility::flag_set( "FLAG_ac130_context_sensitive_dialog_guy_pain" );
    maps\_compass::setupminimap( "compass_map_paris_ac130", "compass_map_paris_ac130" );
    setsaveddvar( "ui_hideMap", "1" );
    level._id_5C36 = 0;
    var_0 = common_scripts\utility::getstruct( "courtyard_building_exit", "targetname" );
    _id_5CFE::_id_5CD0( 0, 0, 0, 0, 0, 0, 0 );
    wait 0.05;
    level.player freezecontrols( 0 );
    _id_638F( "chase" );
    thread _id_6444( var_0 );
    thread _id_6442();
    thread _id_644C();
    maps\_utility::delaythread( 0.05, ::_id_644E );
    maps\_utility::delaythread( 0.05, ::_id_644F );
    common_scripts\utility::flag_wait( "FLAG_chase_rb_delta_exiting_building" );
    thread _id_6450();
    thread _id_6447();
    _id_5CFE::_id_5CE8( 5 );
    _id_6452();
    thread _id_6454();
    thread _id_645A();
    common_scripts\utility::flag_wait( "FLAG_chase_started" );
    level._id_5C36 = 1;
    thread _id_6442();
    thread _id_6443();
    var_1 = "FLAG_chase_end_chase";
    level._id_5EB8 thread _id_5F9E::_id_5F88( "chase_end_transition_out", "script_noteworthy", var_1 );
    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );
    thread _id_646B();
}

_id_6442()
{
    var_0 = 5.0;

    if ( common_scripts\utility::flag( "FLAG_ac130_thermal_enabled" ) )
        level.player thread maps\_utility::_id_1823( "HINT_ac130_enhanced_vision", var_0 );

    wait 8.0;
    level.player thread maps\_utility::_id_1823( "HINT_ac130_using_zoom", var_0 );
    wait 13.0;

    if ( !issubstr( level._id_5C3E, "25" ) )
        level.player thread maps\_utility::_id_1823( "HINT_ac130_use_25", var_0 );
}

_id_6443()
{
    _id_5CFE::playsoundoverradio( level.scr_sound["hmv"]["ac130_hmv_movingout"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_copythat24"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["hit"]["ac130_hit_damnclose"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_getonthat50"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["hit"]["ac130_hit_onit"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_twovehicles"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_interesting"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["hmv"]["ac130_hmv_offourtail"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_takeemout2"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_goinleft"], 1, 10.0 );
    wait 1.0;

    if ( !common_scripts\utility::flag( "FLAG_chase_vehicles_1_2_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_armorbehind"], 1, 10.0 );
    else
        wait 2.0;

    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_makinhardleft"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_armoruproad"], 1, 10.0 );
    wait 3.5;
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_goinleft"], 1, 10.0 );

    if ( !common_scripts\utility::flag( "FLAG_chase_vehicles_7_8_killed" ) )
        _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_rightonus"], 1, 10.0 );
    else
        wait 2.0;

    _id_5CFE::_id_5CD0( 2, 1.25, 1.25, 65, 65, 30, 55 );
    wait 1.0;
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_makinhardleft"], 1, 10.0 );
    wait 3.5;
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_gorightgoright"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_birdsinbound"], 1, 10.0 );
    wait 1.5;
    _id_5CFE::_id_5CD0( 2, 1.25, 1.25, 70, 70, 30, 55 );
    _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_engagingconvoy"], 1, 10.0 );
    wait 1.0;
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_clearshot"], 1, 10.0 );
    _id_5CFE::_id_5CD0( 2, 1.25, 1.25, 65, 65, 30, 55 );
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_floorit"], 1, 10.0 );
    common_scripts\utility::flag_set( "FLAG_chase_dialogue_finished" );
}

_id_6444( var_0 )
{
    var_1 = common_scripts\utility::array_combine( level._id_6132, [ level._id_6127 ] );

    foreach ( var_3 in var_1 )
        var_3 thread _id_5F9E::_id_5F71( var_3, var_0, 96.0, ::_id_6445, 15 );
}

_id_6445()
{
    _id_5CFE::_id_5C97( [ self ] );
}

_id_6446()
{
    thread _id_6448();
    thread _id_6449();
    thread _id_644A();
}

_id_6447()
{
    maps\paris_ac130_code::_id_6267();
    var_0 = 1;

    switch ( level.gameskill )
    {
        case 0:
            var_0 = 1;
            break;
        case 2:
            var_0 = 3;
            break;
        case 3:
            var_0 = 6;
            break;
    }

    thread maps\paris_ac130_code::_id_6263( var_0, "FLAG_chase_pfr_encounter_complete" );
    common_scripts\utility::flag_wait( "FLAG_chase_pfr_encounter_check" );

    if ( !common_scripts\utility::flag( "FLAG_chase_pfr_encounter_complete" ) )
        _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_HUMVEE_SUPPORT" );
}

_id_6448()
{
    var_0 = getaiarray( "axis" );
    var_0 = common_scripts\utility::array_combine( var_0, getaiarray( "team3" ) );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_4 = [];
    var_4 = common_scripts\utility::array_combine( var_4, getnodearray( "city_area_pfr_enemy_cover_0", "targetname" ) );
    var_4 = common_scripts\utility::array_combine( var_4, getnodearray( "city_area_pfr_enemy_cover_1", "targetname" ) );
    var_4 = maps\_utility::_id_0B53( var_4 );
    var_5 = _id_5F9E::_id_5F52( "chase_pfr_enemy_spot" );
    maps\_utility::_id_2122( var_5 );
    var_6 = getent( "city_area_pfr_enemy_1", "targetname" );
    var_7 = [ getent( var_6.targetname + "_AR", "targetname" ), getent( var_6.targetname + "_SMG", "targetname" ), getent( var_6.targetname + "_RPG", "targetname" ) ];
    var_8 = _id_5F9E::_id_5F10( var_5.size, var_4.size );
    var_9 = 0;

    while ( var_9 < var_8 )
    {
        var_10 = common_scripts\utility::ter_op( _id_5F9E::_id_5EDE( 0.3 ), var_7[2], var_7[randomint( 2 )] );
        var_10.count = 1;
        var_10.origin = var_5[var_9].origin;
        var_10.angles = var_5[var_9] _id_5F9E::_id_5F4F( "angles" );
        var_2 = var_10 stalingradspawn();

        if ( !maps\_utility::_id_13AF( var_2 ) )
        {
            thread _id_5CFE::_id_5C97( [ var_2 ] );
            var_6._id_6276 = common_scripts\utility::add_to_array( var_6._id_6276, var_2 );
            maps\paris_ac130_code::_id_625E( var_2 );
            maps\paris_ac130_code::_id_6265( var_2 );
            var_2 maps\_utility::_id_2724( 192.0 );
            var_2 setgoalpos( var_4[var_9].origin );
            var_2 maps\_utility::_id_2736( 0.01 );
            var_9++;
        }

        wait 0.05;
    }

    var_6._id_6275 = 18;
    var_6._id_627B = 18;
    var_6._id_6279["after_spawn"]["pass_value"][1] = maps\paris_ac130_code::_id_6265;
    var_6._id_6279["before_spawner_cleanup"]["pass_value"][0] = maps\paris_ac130_code::_id_6266;
}

_id_6449()
{
    var_0 = getent( "chase_pfr_t72", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62D7, "chase_pfr_t72", "targetname", 4 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "t72" );
    var_1 = maps\_utility::_id_1BF9( "chase_pfr_t72", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = [];
    var_3 = [];

    foreach ( var_6, var_5 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_5.origin;
        var_0.angles = var_5 _id_5F9E::_id_5F4F( "angles" );
        var_0.target = var_5.target;
        var_2[var_6] = var_0 maps\_utility::_id_1FA3();
        wait 0.05;
        _id_5CFE::_id_5C97( [ var_2[var_6] ] );
        maps\paris_ac130_code::_id_6265( var_2[var_6] );
        wait 0.05;
    }

    foreach ( var_8 in var_2 )
        var_8 thread maps\_vehicle::_id_1FA6();

    var_10 = _id_5F9E::_id_5F52( "chase_pfr_tank_target_1" );
    var_11 = _id_5F9E::_id_5F52( "chase_pfr_tank_target_2" );
    var_12 = _id_5F9E::_id_5F52( "chase_pfr_tank_target_3" );
    var_2[1] maps\_utility::delaythread( 6.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[3] maps\_utility::delaythread( 8.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[1] maps\_utility::delaythread( 10.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[3] maps\_utility::delaythread( 10.25, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[1] maps\_utility::delaythread( 14.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[3] maps\_utility::delaythread( 15.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[1] maps\_utility::delaythread( 20.0, maps\paris_ac130_code::_id_62DD, var_11[randomint( var_11.size )] );
    var_2[3] maps\_utility::delaythread( 21.0, maps\paris_ac130_code::_id_62DD, var_11[randomint( var_11.size )] );
    var_2[2] maps\_utility::delaythread( 22.0, maps\paris_ac130_code::_id_62DD, var_11[randomint( var_11.size )] );
    var_2[4] maps\_utility::delaythread( 24.5, maps\paris_ac130_code::_id_62DD, var_11[randomint( var_11.size )] );
    var_2[2] maps\_utility::delaythread( 26.0, maps\paris_ac130_code::_id_62DD, var_11[randomint( var_11.size )] );
    var_2[4] maps\_utility::delaythread( 27.5, maps\paris_ac130_code::_id_62DD, var_11[randomint( var_11.size )] );
    var_2[1] maps\_utility::delaythread( 30.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[3] maps\_utility::delaythread( 31.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[2] maps\_utility::delaythread( 34.0, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[4] maps\_utility::delaythread( 35.5, maps\paris_ac130_code::_id_62DD, var_10[randomint( var_10.size )] );
    var_2[1] maps\_utility::delaythread( 36.0, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[3] maps\_utility::delaythread( 37.0, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[2] maps\_utility::delaythread( 37.5, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[4] maps\_utility::delaythread( 38.5, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[1] maps\_utility::delaythread( 40.0, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[3] maps\_utility::delaythread( 41.0, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[2] maps\_utility::delaythread( 41.5, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[4] maps\_utility::delaythread( 42.5, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[1] maps\_utility::delaythread( 44.0, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[3] maps\_utility::delaythread( 45.0, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[2] maps\_utility::delaythread( 45.5, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    var_2[4] maps\_utility::delaythread( 46.5, maps\paris_ac130_code::_id_62DD, var_12[randomint( var_12.size )] );
    common_scripts\utility::flag_wait( "FLAG_chase_started" );

    foreach ( var_8 in var_2 )
    {
        if ( isdefined( var_8 ) && target_istarget( var_8 ) )
            target_remove( var_8 );
    }

    wait 20.0;

    foreach ( var_8 in var_2 )
    {
        if ( isdefined( var_8 ) )
        {
            var_8 maps\_vehicle::_id_2A13();
            var_8 dodamage( 10000, var_8.origin );
        }
    }

    common_scripts\utility::flag_wait( "FLAG_start_bridge" );
    var_2 = common_scripts\utility::array_removeundefined( var_2 );

    foreach ( var_8 in var_2 )
    {
        if ( isdefined( var_8 ) )
        {
            var_8 notify( "death" );
            var_8 delete();
        }
    }

    var_0 delete();
}

_id_644A()
{
    var_0 = getent( "chase_pfr_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E1, "chase_pfr_mi17", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "mi17" );
    var_1 = maps\_utility::_id_1BF9( "chase_pfr_mi17", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = getent( "chase_pfr_mi17_pilot", "targetname" );
    var_3 = getent( "chase_pfr_mi17_enemy", "targetname" );
    var_4 = [];
    var_5 = [ -1, 0, 18.0, 0, 0 ];

    foreach ( var_9, var_7 in var_1 )
    {
        var_0.count = 1;
        var_0.angles = var_7 _id_5F9E::_id_5F4F( "angles" );
        var_0.origin = var_7.origin;
        var_0.target = var_7.target;
        var_8 = var_0 maps\_utility::_id_1FA3();
        var_4[var_4.size] = var_8;
        wait 0.05;
        maps\_utility::delaythread( var_5[var_9], _id_5CFE::_id_5C97, [ var_8 ] );
        var_8 thread maps\paris_ac130_code::_id_62F3( var_2 );
        var_8 thread maps\paris_ac130_code::_id_62F4( var_3, 1 );
        var_8 maps\paris_ac130_code::_id_62FB( [ ::_id_644B ] );
        var_8 thread maps\paris_ac130_code::_id_62F0();
        maps\paris_ac130_code::_id_6265( var_8 );
        wait(common_scripts\utility::ter_op( var_9 < 4, 0.05, 10 ));
    }

    common_scripts\utility::flag_wait( "FLAG_chase_started" );

    foreach ( var_8 in var_4 )
    {
        if ( isdefined( var_8 ) && target_istarget( var_8 ) )
            target_remove( var_8 );
    }

    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );
    wait 20;
    var_2 delete();
    var_3 delete();
    var_0 delete();
    _id_5F9E::_id_5EE2( var_4, [ "death", "newpath", "crash_done" ] );

    foreach ( var_7 in var_1 )
        maps\_utility::_id_2122( _id_5F9E::_id_5F52( var_7.target ) );
}

_id_644B()
{
    self endon( "death" );
    maps\_utility::delaythread( 3.0, _id_5CFE::_id_5C97, [ self ] );

    if ( !common_scripts\utility::flag( "FLAG_chase_started" ) )
    {
        maps\paris_ac130_code::_id_625E( self );
        maps\paris_ac130_code::_id_6265( self );
    }

    common_scripts\utility::flag_wait( "FLAG_chase_started" );

    if ( target_istarget( self ) )
        target_remove( self );

    wait 5.0;
    self dodamage( 10000, self.origin );
}

_id_644C()
{
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_filler" );
    thread _id_644D();
    _id_5CFE::playsoundoverradio( level.scr_sound["hmv"]["ac130_hmv_enroute"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_almost"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_crossingopen"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_beforedelta"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_donotfire"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_friendlyvehicles"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_lotsofguys"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_attention"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["hmv"]["ac130_hmv_getamoveon"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_volkinhumvee"], 1, 10.0 );
    wait 1.5;
    _id_5CFE::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_fastaswecan"], 1, 10.0 );
    common_scripts\utility::flag_wait( "FLAG_chase_main_vehicle_arrived" );
    common_scripts\utility::flag_wait( "FLAG_chase_second_vehicle_arrived" );
    common_scripts\utility::flag_wait( "FLAG_chase_delta_ready_to_enter_vehicles" );
    level._id_5EB8 vehicle_setspeed( 80, 5, 5 );
    wait 2.0;
    common_scripts\utility::flag_set( "FLAG_chase_pfr_encounter_check" );
    _id_5CFE::playsoundoverradio( level.scr_sound["hmv"]["ac130_hmv_wesecure"], 1, 10.0 );
    _id_5CFE::playsoundoverradio( level.scr_sound["snd"]["ac130_snd_letsroll"], 1, 10.0 );
    thread _id_5CFE::_id_5C78();
}

_id_644D()
{
    var_0 = getent( "chase_player_focus", "targetname" );
    var_1 = maps\_utility::_id_283B( "courtyard_building_exit", "targetname" );
    var_2 = maps\_utility::_id_283B( "fdr_center", "targetname" );
    var_0 moveto( var_1.origin, 2.0, 1.0, 1.0 );
    wait 2.0;
    var_0 moveto( var_2.origin, 5.0, 2.5, 2.5 );
    _id_5CFE::_id_5CD0( 2, 1.25, 1.25, 90, 90, 30, 65 );
    common_scripts\utility::flag_wait( "FLAG_chase_pfr_encounter_check" );
    var_0 moveto( level._id_614D.origin, 1.25, 0.5, 0.5 );
    wait 1.3;
    var_0 linkto( level._id_614D );
    wait 2.0;
    _id_5CFE::_id_5CD0( 5.5, 2.5, 2.5, 0, 0, 0, 0 );
    wait 5.55;
    var_0 thread _id_5F9E::_id_5F5E( level._id_5C11, 1.0, ( 0.0, 0.0, 0.0 ), "tag_origin" );
    _id_5CFE::_id_5CD0( 2, 1.25, 1.25, 60, 60, 25, 40 );
}

_id_644E()
{
    var_0 = _id_5F9E::_id_5F90( "city_area_rb_building_exit_", "targetname", 0 );
    var_1 = _id_5F9E::_id_5F90( "chase_delta_fast_point_", "targetname", 0 );

    foreach ( var_4, var_3 in level._id_6132 )
    {
        level._id_6132[var_4] maps\paris_ac130_code::_id_633E();
        level._id_6132[var_4] forceteleport( var_0[var_4].origin, var_1[var_4].angles );
        level._id_6132[var_4] maps\paris_ac130_code::_id_6342();
        level._id_6132[var_4] show();
    }

    level._id_6127 forceteleport( var_0[var_0.size - 1].origin, var_0[var_0.size - 1].angles );
    var_5 = _id_5F9E::_id_5F52( "hvt_carry_fountain" );

    foreach ( var_7 in var_5 )
    {
        var_7 notify( "stop_carried_loop" );
        var_7 notify( "stop_wounded_idle" );
    }

    level._id_6127 notify( "stop_carried_loop" );
    level._id_6127 notify( "stop_wounded_idle" );
    level._id_6126 endon( "end_carry_ai" );
    level._id_6126 maps\_utility::_id_26FD();
    var_9 = maps\_utility::_id_283B( "hvt_escape_hvt_downed", "targetname" );
    var_9 notify( "LISTEN_stop_ANIM_hvt_idle_loop" );
    var_9 notify( "stop_wounded_idle" );
    wait 0.05;
    level._id_6127 maps\paris_ac130_code::_id_6173();
    var_10 = var_0[var_0.size - 1];
    var_11 = [];
    var_11[0] = "ANIM_hostage_cover_idle_loop";
    var_11[1] = [ "ANIM_hostage_cover_out" ];
    var_11[2] = "ANIM_hostage_run_loop";
    var_11[3] = "ANIM_hostage_cover_into";
    level._id_6127._id_1032 = undefined;
    level._id_6127 maps\paris_ac130_code::_id_6344( var_10, var_11 );
    wait 0.05;
    var_11[0] = "ANIM_guard_cover_idle_loop";
    var_11[1] = [ "ANIM_guard_cover_out" ];
    var_11[2] = "ANIM_guard_run_loop";
    var_11[3] = "ANIM_guard_cover_into";
    level._id_6126._id_1032 = undefined;
    level._id_6126 maps\paris_ac130_code::_id_6340( var_11 );
    wait 0.05;
    level._id_6126 maps\paris_ac130_code::_id_6347( level._id_6127 );
    common_scripts\utility::flag_set( "FLAG_chase_rb_delta_exiting_building" );
}

_id_644F()
{
    wait 1.0;
    var_0 = getent( "rpg_building_look_at", "targetname" );
    level._id_45C0 setlookatentity( var_0 );
    level._id_45C0 maps\_utility::_id_2612( 1 );
    level._id_45C0 maps\_utility::_id_0A23( 1 );
    level._id_45C0 setcandamage( 0 );
    level._id_45C0 maps\_utility::_id_2714();
    level._id_45C0 _id_5F9E::_id_5F08( 0 );
    level._id_45C0 maps\_utility::_id_1058( 1 );
    level._id_45C0 _id_5F9E::_id_5F09( 1 );
    level._id_45C0 maps\_utility::_id_251F();
    level._id_45C0 maps\_utility::_id_271F();
    level._id_45C0 maps\_utility::_id_1057();
    level._id_45C0 maps\_utility::_id_0EEC();
    level._id_45C0 maps\_utility::_id_280D();
    level._id_45C0 maps\_utility::_id_26F3( 1 );
    wait 1;
    level.ac130player thread maps\_utility::play_sound_on_entity( "scn_ac130_pip_humvee_1" );
    level._id_3EDA.clipdistance = 5000;
    level._id_3EDA.dofnear = ( 0.0, 0.0, 10.0 );
    level._id_3EDA.doffar = ( 4000.0, 10000.0, 4.0 );
    level._id_3EDA.blurradius = 1;

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_60E5( level._id_623F );

    wait 6;

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_6104();

    level._id_3EDA.clipdistance = 0;
    level._id_45C0 setlookatentity();
    var_0 delete();
    level._id_45C0 maps\_utility::_id_2612( 0 );
    level._id_45C0 maps\_utility::_id_0A23( 0 );
    level._id_45C0 setcandamage( 1 );
    level._id_45C0 maps\_utility::_id_2715();
    level._id_45C0 _id_5F9E::_id_5F08( 1 );
    level._id_45C0 maps\_utility::_id_1058( 0 );
    level._id_45C0 _id_5F9E::_id_5F09( undefined );
    level._id_45C0 maps\_utility::_id_2520();
    level._id_45C0 maps\_utility::_id_2720();
    level._id_45C0 maps\_utility::_id_1071();
    level._id_45C0 maps\_utility::_id_2178( 0 );
    level._id_45C0 maps\_utility::_id_26F3( 0 );
}

_id_6450()
{
    var_0 = level._id_6132;
    var_1 = _id_5F9E::_id_5F90( "city_area_pf_friendly_cover_0_", "targetname", 0 );
    var_2 = "FLAG_city_area_pfr_delta_move_down";
    thread _id_5F9E::_id_5F7B( var_0, "LISTEN_ai_goal_reached", var_2 );
    thread _id_6451();

    foreach ( var_6, var_4 in var_0 )
    {
        if ( var_6 < 4 )
        {
            var_4.fixednode = 1;
            var_4.ignoreall = 1;
            var_5 = 4.0;
            thread _id_5F9E::_id_5F6D( var_4, var_1[var_6], var_5, "LISTEN_ai_goal_reached" );
        }
    }

    level._id_45C0 common_scripts\utility::delaycall( 1.0, ::setgoalnode, var_1[0] );
    level._id_6133 setgoalnode( var_1[1] );
    level._id_6134 setgoalnode( var_1[2] );
    level._id_6135 setgoalnode( var_1[3] );
    var_7 = common_scripts\utility::getstruct( "city_area_pfr_frost_cover_point", "targetname" );
    thread _id_5F9E::_id_5F6D( level._id_6126, var_7, 4.0, "LISTEN_ai_goal_reached" );
    level._id_6127 setgoalpos( var_7.origin );
    level._id_6126 maps\paris_ac130_code::_id_6348( level._id_6127, var_7, 1 );
    level._id_6127 maps\paris_ac130_code::_id_6173();
    level._id_6126 maps\paris_ac130_code::_id_6342();
    maps\_utility::_id_283A( var_7 );
    common_scripts\utility::flag_set( "FLAG_chase_delta_ready_to_enter_vehicles" );
}

_id_6451()
{
    common_scripts\utility::flag_wait( "FLAG_city_area_pfr_delta_move_down" );
    var_0 = common_scripts\utility::getfx( "FX_signal_ac130" );
    var_1 = maps\_utility::_id_283B( "chase_pfr_signal_ac130", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1 _id_5F9E::_id_5F4F( "angles" );
    var_2 setmodel( "tag_origin" );
    playfxontag( var_0, var_2, "tag_origin" );
    common_scripts\utility::flag_wait( "FLAG_chase_started" );
    stopfxontag( var_0, var_2, "tag_origin" );
    var_2 delete();
}

_id_6452()
{
    maps\_treadfx::_id_28EF( "script_vehicle_hummer", "concrete", "treadfx/tread_concrete_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_hummer_minigun_ac130", "concrete", "treadfx/tread_concrete_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_bm21_mobile_bed_troops", "concrete", "treadfx/tread_concrete_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_gaz_tigr_turret_physics", "concrete", "treadfx/tread_concrete_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_hummer", "water", "treadfx/tread_water_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_hummer_minigun_ac130", "water", "treadfx/tread_water_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_bm21_mobile_bed_troops", "water", "treadfx/tread_water_ac130" );
    maps\_treadfx::_id_28EF( "script_vehicle_gaz_tigr_turret_physics", "water", "treadfx/tread_water_ac130" );
    var_0 = [ "script_vehicle_bm21_mobile_bed_troops", "script_vehicle_gaz_tigr_turret_physics" ];

    foreach ( var_2 in var_0 )
    {
        foreach ( var_5, var_4 in level._id_29CE[var_2] )
            level._id_29CE[var_2][var_5] = undefined;

        level._id_2A01[var_2] = 1;
    }
}

_id_6453()
{
    var_0 = [ [ "battlefield_smokebank_S_warm", ( 2757.76, 40713.3, -25.0 ) ], [ "fire_falling_runner_point", ( 2469.52, 41063.7, 174.875 ) ], [ "fire_falling_runner_point_infrequent", ( 2484.91, 41129.1, 183.239 ) ], [ "fire_falling_runner_point_infrequent", ( 2609.44, 41162.6, 103.012 ) ], [ "firelp_small_pm_a_nolight", ( 2473.85, 41067.8, 164.875 ) ], [ "firelp_small_pm_a_nolight", ( 2540.01, 41098.3, 16.0206 ) ], [ "fire_falling_runner_point_infrequent", ( 2609.44, 41162.6, 103.012 ) ], [ "firelp_small_pm_a_nolight", ( 2473.85, 41067.8, 164.875 ) ], [ "firelp_small_pm_a_nolight", ( 2540.01, 41098.3, 16.0206 ) ], [ "firelp_small_pm_a_nolight", ( 2601.78, 41159.5, 95.901 ) ], [ "firelp_small_pm_a_nolight", ( 2601.42, 41161.1, 136.441 ) ], [ "firelp_small_pm_a_nolight", ( 2432.19, 41022.5, 33.1685 ) ], [ "firelp_small_pm_a_nolight", ( 2601.78, 41159.5, 95.901 ) ], [ "firelp_small_pm_a_nolight", ( 2601.42, 41161.1, 136.441 ) ], [ "firelp_small_pm_a_nolight", ( 2432.19, 41022.5, 33.1685 ) ], [ "firelp_small_pm_a_nolight", ( 2484.71, 41072.0, 175.128 ) ], [ "insect_trail_runner_icbm", ( 2561.92, 40854.7, -22.4893 ) ], [ "insect_trail_runner_icbm", ( 2702.27, 40961.8, -0.875 ) ], [ "firelp_small_pm_a_nolight", ( 2492.03, 41072.6, 190.128 ) ], [ "insect_trail_runner_icbm", ( 2561.92, 40854.7, -22.4893 ) ], [ "insect_trail_runner_icbm", ( 2702.27, 40961.8, -0.875 ) ], [ "insect_trail_runner_icbm", ( 2650.09, 40504.1, 5.77715 ) ], [ "insect_trail_runner_icbm", ( 3177.67, 40521.3, 0.34885 ) ], [ "insect_trail_runner_icbm", ( 3587.48, 39773.8, -25.0 ) ], [ "insect_trail_runner_icbm", ( 2467.44, 39433.8, -25.0 ) ], [ "insect_trail_runner_icbm", ( 2591.95, 40263.9, -23.5519 ) ], [ "leaves_fall_gentlewind", ( 2365.74, 39661.4, 182.265 ) ], [ "leaves_fall_gentlewind", ( 2322.06, 39208.6, 176.378 ) ], [ "insect_trail_runner_icbm", ( 0.0, 0.0, 0.0 ) ], [ "leaves_fall_gentlewind", ( 2454.9, 40648.3, 129.621 ) ], [ "insect_trail_runner_icbm", ( 2591.95, 40263.9, -23.5519 ) ], [ "leaves_fall_gentlewind", ( 2365.74, 39661.4, 182.265 ) ], [ "leaves_fall_gentlewind", ( 2322.06, 39208.6, 176.378 ) ], [ "leaves_fall_gentlewind", ( 2454.9, 40648.3, 129.621 ) ], [ "leaves_fall_gentlewind", ( 3436.7, 40177.4, 163.563 ) ], [ "leaves_fall_gentlewind", ( 3713.07, 39843.0, 183.618 ) ], [ "battlefield_smokebank_S_warm", ( 3000.0, 39834.1, 6.37475 ) ], [ "leaves_fall_gentlewind", ( 3436.7, 40177.4, 163.563 ) ], [ "leaves_fall_gentlewind", ( 3713.07, 39843.0, 183.618 ) ], [ "battlefield_smokebank_S_warm", ( 3000.0, 39834.1, 6.37475 ) ], [ "battlefield_smokebank_S_warm", ( 2457.7, 39874.9, -26.2166 ) ], [ "battlefield_smokebank_S_warm", ( 3428.63, 40787.0, -24.9592 ) ], [ "battlefield_smokebank_S_warm", ( 2457.7, 39874.9, -26.2166 ) ], [ "battlefield_smokebank_S_warm", ( 3428.63, 40787.0, -24.9592 ) ], [ "battlefield_smokebank_S_warm", ( 3654.0, 39693.0, -25.0 ) ], [ "battlefield_smokebank_S_warm", ( 2649.3, 38588.6, -22.0 ) ], [ "insects_light_invasion", ( 2765.12, 41228.3, -26.9327 ) ], [ "insects_light_invasion", ( 2411.51, 40946.2, -27.9369 ) ], [ "insects_light_invasion", ( 0.0, 0.0, 0.0 ) ], [ "battlefield_smokebank_S_warm", ( 3654.0, 39693.0, -25.0 ) ], [ "battlefield_smokebank_S_warm", ( 2649.3, 38588.6, -22.0 ) ], [ "insects_light_invasion", ( 3546.77, 41566.2, 18.0 ) ], [ "insects_light_invasion", ( 3711.28, 40772.6, 4.81613 ) ], [ "room_smoke_200", ( 2457.38, 41196.1, 43.5921 ) ], [ "firelp_med_pm_cheap_nolight", ( 2458.21, 41090.2, -9.95584 ) ], [ "firelp_small_pm_a_nolight", ( 2427.72, 41072.4, -13.3787 ) ], [ "firelp_small_pm_a_nolight", ( 2419.92, 41152.2, -15.5087 ) ], [ "firelp_small_pm_a_nolight", ( 2477.3, 41128.5, -8.13709 ) ], [ "firelp_small_pm_a_nolight", ( 2437.64, 41017.8, 130.863 ) ], [ "firelp_small_pm_a_nolight", ( 2445.98, 41105.4, 174.875 ) ], [ "firelp_med_pm_cheap_nolight", ( 2448.96, 41104.5, 194.382 ) ], [ "firelp_med_pm_cheap_nolight", ( 3391.24, 46811.2, 623.654 ) ], [ "firelp_med_pm_cheap_nolight", ( 3254.92, 46806.1, 904.973 ) ], [ "firelp_med_pm_cheap_nolight", ( 3459.64, 46789.1, 638.125 ) ], [ "firelp_med_pm_cheap_nolight", ( 3401.75, 46860.3, 916.125 ) ], [ "FX_firelight", ( 2242.61, 41164.1, -6.87499 ) ], [ "firelp_med_pm_cheap_nolight", ( 2270.65, 41146.0, -21.875 ) ], [ "firelp_med_pm_cheap_nolight", ( 2260.76, 41277.8, -19.7228 ) ], [ "FX_lights_firelight_small", ( 2349.81, 41266.9, -19.0447 ) ] ];
    _id_5F9E::_id_5F1A( var_0 );
}

_id_6454()
{
    var_0 = getent( "chase_main_vehicle", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62A2, "chase_main_vehicle", "targetname" );
    level._id_614D = var_0 maps\_utility::_id_1FA3();
    var_1 = getentarray( "delta_group_1", "targetname" );
    maps\_utility::_id_27C9( var_1, maps\paris_ac130_code::_id_633F );
    var_2 = [];

    foreach ( var_4 in var_1 )
        var_2[var_2.size] = var_4 stalingradspawn();

    wait 0.05;
    level._id_614D maps\paris_ac130_code::_id_62A9( var_2 );
    level._id_614D._id_2955 = 1;
    var_6 = getvehiclenodearray( "chase_main_vehicle_slide", "script_noteworthy" );

    if ( isdefined( var_6 ) )
    {
        foreach ( var_8 in var_6 )
            level._id_614D thread maps\paris_ac130_code::_id_62A8( var_8 );
    }

    var_10 = getent( "chase_second_vehicle", "targetname" );
    var_10 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62A2, "chase_second_vehicle", "targetname" );
    level._id_614E = var_10 maps\_utility::_id_1FA3();
    _id_6456();
    maps\_utility::delaythread( 0.2, ::_id_6455 );
    var_1 = getentarray( "delta_group_2", "targetname" );
    maps\_utility::_id_27C9( var_1, maps\paris_ac130_code::_id_633F );
    var_2 = [];

    foreach ( var_4 in var_1 )
        var_2[var_2.size] = var_4 stalingradspawn();

    wait 0.05;
    level._id_614E maps\paris_ac130_code::_id_62A9( var_2 );
    level._id_614E._id_2955 = 1;
    var_6 = getvehiclenodearray( "chase_second_vehicle_slide", "script_noteworthy" );

    if ( isdefined( var_6 ) )
    {
        foreach ( var_8 in var_6 )
            level._id_614E thread maps\paris_ac130_code::_id_62A8( var_8 );
    }

    level._id_614E thread maps\paris_ac130_code::_id_62A7();
    level._id_614E thread _id_6459();
    _id_5CFE::_id_5C97( [ level._id_614D, level._id_614E ] );
    maps\_utility::delaythread( 0.05, maps\_vehicle::_id_1FA6, level._id_614D );
    maps\_utility::delaythread( 0.5, maps\_vehicle::_id_1FA6, level._id_614E );
    var_15 = "FLAG_chase_main_vehicle_arrived";
    level._id_614D thread _id_5F9E::_id_5F88( "chase_main_vehicle_pickup_in", "script_noteworthy", var_15 );
    var_15 = "FLAG_chase_second_vehicle_arrived";
    level._id_614E thread _id_5F9E::_id_5F88( "chase_second_vehicle_pickup_in", "script_noteworthy", var_15 );
    common_scripts\utility::flag_wait( "FLAG_chase_main_vehicle_arrived" );
    common_scripts\utility::flag_wait( "FLAG_chase_second_vehicle_arrived" );
    common_scripts\utility::flag_wait( "FLAG_chase_delta_ready_to_enter_vehicles" );
    level._id_6133 maps\paris_ac130_code::_id_6342();
    level._id_6127 maps\paris_ac130_code::_id_6173();
    var_16 = level._id_6132;
    var_16[var_16.size] = level._id_6127;

    foreach ( var_18 in var_16 )
    {
        var_18 notify( "LISTEN_end_ai_scripts" );
        var_18.fixednode = 0;
        var_18.accuracy = var_2[0].accuracy;
        var_18._id_20AF = var_2[0]._id_20AF;
        var_18.health = var_2[0].health;
        var_18._id_6339 = undefined;
        var_18 maps\_utility::_id_2724( var_2[0].goalradius );
        var_18 thread _id_6458();
        var_18 maps\_utility::_id_2612( 1 );
        var_18 setcandamage( 0 );
        var_18 maps\_utility::_id_2714();
        var_18 _id_5F9E::_id_5F08( 0 );
        var_18 maps\_utility::_id_1058( 1 );
        var_18 _id_5F9E::_id_5F09( 1 );
        var_18 maps\_utility::_id_251F();
        var_18 maps\_utility::_id_271F();
        var_18 maps\_utility::_id_1057();
        var_18 maps\_utility::_id_0EEC();
        var_18 maps\_utility::_id_280D();
        var_18 maps\_utility::_id_26F3( 1 );
    }

    var_15 = "FLAG_chase_delta_entered_chase_vehicles";
    thread _id_5F9E::_id_5F7B( var_16, "enteredvehicle", var_15 );
    var_20 = [ level._id_6135, level._id_6126, level._id_6127 ];
    level._id_614D thread maps\_vehicle::_id_2515( var_20 );

    foreach ( var_18 in var_20 )
        var_18 thread _id_5F9E::_id_5F6F( var_18, level._id_614D, 96, "LISTEN_ai_near_vehicle" );

    var_23 = [ level._id_45C0, level._id_6133, level._id_6134 ];
    level._id_614E thread maps\_vehicle::_id_2515( var_23 );

    foreach ( var_18 in var_23 )
        var_18 thread _id_5F9E::_id_5F6F( var_18, level._id_614E, 96, "LISTEN_ai_near_vehicle" );

    common_scripts\utility::flag_wait_or_timeout( "FLAG_chase_delta_entered_chase_vehicles", 10 );
    common_scripts\utility::flag_set( "FLAG_chase_delta_entered_chase_vehicles" );

    foreach ( var_18 in var_16 )
    {
        var_18 maps\_utility::_id_2612( 0 );
        var_18 setcandamage( 1 );
        var_18 maps\_utility::_id_2715();
        var_18 _id_5F9E::_id_5F08( 1 );
        var_18 maps\_utility::_id_1058( 0 );
        var_18 _id_5F9E::_id_5F09( undefined );
        var_18 maps\_utility::_id_2520();
        var_18 maps\_utility::_id_2720();
        var_18 maps\_utility::_id_1071();
        var_18 maps\_utility::_id_27B8();
        var_18 maps\_utility::_id_2178( 0 );
        var_18 maps\_utility::_id_26F3( 0 );
    }

    _id_6385( "chase" );
    common_scripts\utility::flag_set( "FLAG_chase_started" );
    common_scripts\utility::flag_clear( "FLAG_building_trigger_mission_failed_on" );
    level notify( "LISTEN_end_monitor_mission_fail_points" );
    thread _id_6453();
    maps\_utility::delaythread( 5.0, _id_5F9E::_id_5EEF, "sm_sunsamplesizenear", 2.0, 2 );
    maps\_utility::_id_142B( "paris_ac130_chase_mx" );
    level._id_614D thread maps\paris_ac130_code::_id_62A4();
    level._id_614E thread maps\paris_ac130_code::_id_62A4();
    level._id_623A = 0.25;
    level._id_623B = 0.25;
    level._id_623C = 0.25;
    thread _id_6457();
    var_8 = getvehiclenode( "chase_main_vehicle_pickup_out", "script_noteworthy" );
    level._id_614D maps\_utility::delaythread( 0.05, _id_5F9E::_id_5F3C, var_8 );
    var_8 = getvehiclenode( "chase_second_vehicle_pickup_out", "script_noteworthy" );
    level._id_614E maps\_utility::delaythread( 0.5, _id_5F9E::_id_5F3C, var_8 );
}

_id_6455()
{
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_614E.origin, level._id_614E.angles, ( -25.0, -5.0, 100.0 ) );
    var_1 = spawn( "script_origin", var_0 );
    var_1.angles = level._id_614E.angles + ( 6.0, 0.0, 0.0 );
    var_1.targetname = "chase_gunner_pip";
    var_1 linkto( level._id_614E.mgturret[0], "TAG_BARREL" );
}

_id_6456()
{
    var_0 = maps\paris_ac130_slamzoom::_id_570B( level._id_614E.origin, level._id_614E.angles, ( 8.0, 36.0, 66.0 ) );
    var_1 = spawn( "script_origin", var_0 );
    var_1.angles = level._id_614E.angles + ( 0.0, 328.0, 0.0 );
    var_1.targetname = "chase_vehicle_pip";
    var_1 linkto( level._id_614E );
}

_id_6457()
{
    var_0 = getent( "chase_gunner_pip", "targetname" );
    var_1 = getent( "chase_vehicle_pip", "targetname" );

    while ( level._id_614E._id_0A39.size != 5 )
        wait 0.05;

    var_2 = level._id_614E._id_0A39[4];

    foreach ( var_4 in level._id_614E._id_0A39 )
    {
        if ( isdefined( var_4._id_251B ) && var_4._id_251B == 4 )
            var_2 = var_4;
    }

    var_2 maps\_utility::_id_0A23( 1 );
    var_2 setcandamage( 0 );
    var_2 maps\_utility::_id_2714();
    var_2 _id_5F9E::_id_5F08( 0 );
    var_2 maps\_utility::_id_1058( 1 );
    var_2 _id_5F9E::_id_5F09( 1 );
    var_2 maps\_utility::_id_251F();
    var_2 maps\_utility::_id_271F();
    var_2 maps\_utility::_id_1057();
    var_2 maps\_utility::_id_0EEC();
    var_2 maps\_utility::_id_280D();
    var_2 maps\_utility::_id_26F3( 1 );
    var_6 = 10;
    var_7 = 1;
    level.ac130player thread maps\_utility::play_sound_on_entity( "scn_ac130_pip_humvee_2" );
    level._id_3EDA.clipdistance = 6000;
    level._id_3EDA.dofnear = ( 0.0, 0.0, 10.0 );
    level._id_3EDA.doffar = ( 5000.0, 10000.0, 4.0 );
    level._id_3EDA.blurradius = 1;

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_60E5( var_1, undefined, undefined, 65 );

    wait(var_6);

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_6104();

    wait 0.05;
    level._id_3EDA.clipdistance = 4000;
    level._id_3EDA.dofnear = ( 0.0, 0.0, 10.0 );
    level._id_3EDA.doffar = ( 3500.0, 10000.0, 4.0 );
    level._id_3EDA.blurradius = 1;
    level.ac130player thread maps\_utility::play_sound_on_entity( "scn_ac130_pip_50cal" );

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_60E5( var_0, undefined, undefined, 60 );

    wait(var_6);

    if ( getdvarint( "pip_enabled", 0 ) )
        maps\paris_ac130_pip::_id_6104();

    level._id_3EDA.clipdistance = 0;
    var_2 maps\_utility::_id_0A23( 0 );
    var_2 setcandamage( 1 );
    var_2 maps\_utility::_id_2715();
    var_2 _id_5F9E::_id_5F08( 1 );
    var_2 maps\_utility::_id_1058( 0 );
    var_2 _id_5F9E::_id_5F09( undefined );
    var_2 maps\_utility::_id_2520();
    var_2 maps\_utility::_id_2720();
    var_2 maps\_utility::_id_1071();
    var_2 maps\_utility::_id_2178( 0 );
    var_2 maps\_utility::_id_26F3( 0 );
    var_0 delete();
    var_1 delete();
}

_id_6458()
{
    self waittill( "LISTEN_ai_near_vehicle" );
    _id_5CFE::_id_5CA0( [ self ] );
}

_id_6459()
{
    while ( !common_scripts\utility::flag( "FLAG_chase_started" ) )
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
            level._id_614E maps\paris_ac130_code::_id_62A6( var_2 );

        wait 0.05;
    }

    maps\paris_ac130_code::_id_6261( 0.05 );
}

_id_645A()
{
    common_scripts\utility::flag_wait( "FLAG_chase_started" );
    thread _id_6465();
    thread _id_6460();
    thread _id_645F();
    maps\_utility::delaythread( 15.0, ::_id_6466 );
    maps\_utility::delaythread( 1.0, ::_id_6467 );
    maps\_utility::delaythread( 1.0, ::_id_6468 );
    maps\_utility::delaythread( 5.0, ::_id_6469 );
    maps\_utility::delaythread( 12.0, ::_id_645C );
    maps\_utility::delaythread( 7.0, ::_id_645D );
}

_id_645D()
{
    var_0 = "PARIS_AC130_DEADQUOTE_CHASE_1";
    var_1 = 2;

    switch ( level.gameskill )
    {
        case 0:
            var_1 = 1;
            break;
        case 2:
            var_1 = 3;
            break;
        case 3:
            var_1 = 4;
            var_0 = "PARIS_AC130_DEADQUOTE_CHASE_2";
            break;
    }

    maps\_utility::_id_282C( "FLAG_chase_encounter_1_complete", var_1 );
    var_2 = _id_5F9E::_id_5F51( "check_fail", "script_noteworthy", _id_5F9E::_id_5F52( level._id_614E.target ) )[0];
    var_2 waittill( "trigger" );

    if ( !common_scripts\utility::flag( "FLAG_chase_encounter_1_complete" ) )
        _id_5F9E::_id_5F3A( "@" + var_0 );

    thread _id_5CFE::_id_5C78();
}

_id_0052( var_0, var_1 )
{
    self waittill( var_0 );
    maps\_utility::_id_282B( var_1 );
}

_id_0053( var_0, var_1 )
{
    self waittill( var_0 );
    maps\_utility::_id_282B( var_1 );
}

_id_645E( var_0 )
{
    var_1 = 1;

    switch ( level.gameskill )
    {
        case 0:
            var_1 = 1;
            break;
        case 2:
            var_1 = 2;
            break;
        case 3:
            var_1 = 4;
            break;
    }

    maps\_utility::_id_282C( "FLAG_chase_encounter_2_complete", var_1 );
    common_scripts\utility::flag_wait( "FLAG_chase_encounter_2_check" );

    if ( !common_scripts\utility::flag( "FLAG_chase_encounter_2_complete" ) )
        _id_5F9E::_id_5F3A( "@PARIS_AC130_MISSION_FAIL_HUMVEE_SUPPORT" );
}

_id_645F()
{
    var_0 = getent( "chase_rpg_enemy", "targetname" );
    var_1 = maps\_utility::_id_1BF9( "chase_rpg_enemy", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_4.origin;
        var_0.angles = var_4 _id_5F9E::_id_5F4F( "angles" );
        var_0.target = var_4.target;
        var_2[var_5] = var_0 spawndrone();
        wait 0.05;
        var_2[var_5] thread maps\paris_ac130_code::_id_6354();
    }

    var_6 = [];

    foreach ( var_5, var_4 in var_1 )
        var_6[var_5] = maps\_utility::_id_283B( var_4.target, "targetname" );

    var_2[1] maps\_utility::delaythread( 19.0, maps\paris_ac130_code::_id_6352, var_6[1] );
    var_2[2] maps\_utility::delaythread( 19.5, maps\paris_ac130_code::_id_6352, var_6[2] );
    var_2[3] maps\_utility::delaythread( 20.0, maps\paris_ac130_code::_id_6352, var_6[3] );
    var_2[4] maps\_utility::delaythread( 20.5, maps\paris_ac130_code::_id_6352, var_6[4] );
    var_2[5] maps\_utility::delaythread( 21.0, maps\paris_ac130_code::_id_6352, var_6[5] );
    var_2[6] maps\_utility::delaythread( 22.0, maps\paris_ac130_code::_id_6352, var_6[6] );
    var_2[7] maps\_utility::delaythread( 22.5, maps\paris_ac130_code::_id_6352, var_6[7] );
    var_2[8] maps\_utility::delaythread( 23.0, maps\paris_ac130_code::_id_6352, var_6[8] );
    var_2[9] maps\_utility::delaythread( 23.5, maps\paris_ac130_code::_id_6352, var_6[9] );
    var_2[10] maps\_utility::delaythread( 25.0, maps\paris_ac130_code::_id_6352, var_6[10] );
    var_2[11] maps\_utility::delaythread( 25.5, maps\paris_ac130_code::_id_6352, var_6[11] );
    var_2[12] maps\_utility::delaythread( 29.0, maps\paris_ac130_code::_id_6352, var_6[12] );
    var_2[13] maps\_utility::delaythread( 29.5, maps\paris_ac130_code::_id_6352, var_6[13] );
    var_2[14] maps\_utility::delaythread( 30.0, maps\paris_ac130_code::_id_6352, var_6[14] );
    var_2[15] maps\_utility::delaythread( 30.5, maps\paris_ac130_code::_id_6352, var_6[15] );
    var_2[16] maps\_utility::delaythread( 41.5, maps\paris_ac130_code::_id_6352, var_6[16] );
    var_2[17] maps\_utility::delaythread( 42.0, maps\paris_ac130_code::_id_6352, var_6[17] );
    var_2[18] maps\_utility::delaythread( 42.5, maps\paris_ac130_code::_id_6352, var_6[18] );
    var_2[19] maps\_utility::delaythread( 43.0, maps\paris_ac130_code::_id_6352, var_6[19] );
    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );

    foreach ( var_9 in var_2 )
    {
        if ( isdefined( var_9 ) )
        {
            var_9 notify( "death" );
            var_9 delete();
        }
    }

    var_0 delete();
}

_id_6460()
{
    var_0 = getent( "chase_gaz", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62FC );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6305, level._id_614E );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285 );
    var_1 = getent( "chase_gaz_enemy", "targetname" );
    var_1 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_634C );
    var_1 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6281 );
    var_2 = getent( "chase_bm21", "targetname" );
    var_2 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_630C );
    var_2 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_2 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285 );
    var_3 = getent( "chase_bm21_enemy", "targetname" );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_634C );
    var_3 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6281 );
    var_4 = maps\_utility::_id_1BF9( "chase_vehicle", "targetname" );
    var_4 = maps\_utility::_id_27EC( var_4 );
    maps\_utility::delaythread( 2.05, ::_id_6462, var_0, var_4[1], var_1 );
    maps\_utility::delaythread( 2.75, ::_id_6462, var_2, var_4[2], var_3 );
    maps\_utility::delaythread( 3.0, ::_id_6461, 1, 2 );
    maps\_utility::delaythread( 8.55, ::_id_6462, var_0, var_4[3], var_1 );
    maps\_utility::delaythread( 9.25, ::_id_6462, var_2, var_4[4], var_3 );
    maps\_utility::delaythread( 10.0, ::_id_6461, 3, 4 );
    maps\_utility::delaythread( 10.05, ::_id_6462, var_0, var_4[5], var_1 );
    maps\_utility::delaythread( 10.05, ::_id_6462, var_2, var_4[6], var_3 );
    maps\_utility::delaythread( 11.0, ::_id_6461, 5, 6 );
    maps\_utility::delaythread( 20.05, ::_id_6462, var_0, var_4[7], var_1 );
    maps\_utility::delaythread( 20.5, ::_id_6462, var_2, var_4[8], var_3 );
    maps\_utility::delaythread( 21.0, ::_id_6461, 7, 8 );
    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );
    var_0 delete();
    var_1 delete();
    var_2 delete();
    var_3 delete();
}

_id_6461( var_0, var_1 )
{
    var_2 = vehicle_getarray();
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( ( var_5 _id_5F9E::_id_5F0A( "script_index", var_0 ) || var_5 _id_5F9E::_id_5F0A( "script_index", var_1 ) ) && ( var_5 _id_5F9E::_id_5F0A( "script_parameters", "gaz" ) || var_5 _id_5F9E::_id_5F0A( "script_parameters", "bm21" ) ) )
            var_3 = common_scripts\utility::add_to_array( var_3, var_5 );
    }

    thread _id_5F9E::_id_5F7B( var_3, "death", "FLAG_chase_vehicles_" + var_0 + "_" + var_1 + "_killed" );
}

_id_6462( var_0, var_1, var_2 )
{
    var_0.count = 1;
    _id_5F9E::_id_5EFE( [ var_0 ], var_1, [ "origin", "angles", "target" ] );
    var_3 = var_0 maps\_utility::_id_1FA3();
    wait 0.05;
    _id_5F9E::_id_5EFE( [ var_3 ], var_1, [ "script_index", "script_parameters" ] );
    var_3 thread _id_0052( "LISTEN_killed_by_player", "FLAG_chase_encounter_1_complete" );
    level._id_614E maps\paris_ac130_code::_id_62A6( var_3 );
    var_4 = getvehiclenodearray( "chase_enemy_vehicle_" + var_1._id_16A5 + "_slide", "script_noteworthy" );

    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_4 )
        {
            if ( var_1 _id_5F9E::_id_5F0A( "script_parameters", "gaz" ) )
            {
                var_3 thread maps\paris_ac130_code::_id_6306( var_6 );
                continue;
            }

            var_3 thread maps\paris_ac130_code::_id_6317( var_6 );
        }
    }

    if ( var_1 _id_5F9E::_id_5F0A( "script_parameters", "gaz" ) )
        var_3 thread maps\paris_ac130_code::_id_6302( var_2, 2 );
    else
        var_3 thread maps\paris_ac130_code::_id_6311( var_2, 10 );

    var_8 = var_1.script_noteworthy + "_";
    var_9 = _id_5F9E::_id_5F8C( var_8, "script_noteworthy", 1, "_in" );

    for ( var_10 = 1; var_10 < var_9.size; var_10++ )
    {
        if ( var_1 _id_5F9E::_id_5F0A( "script_parameters", "gaz" ) )
        {
            var_3 thread maps\paris_ac130_code::_id_6303( var_8 + var_10 );
            continue;
        }

        var_3 thread maps\paris_ac130_code::_id_6315( var_8 + var_10 );
    }

    if ( var_1 _id_5F9E::_id_5F0A( "script_parameters", "gaz" ) )
        var_3 thread maps\paris_ac130_code::_id_6304( var_8 + var_9.size );
    else
        var_3 thread maps\paris_ac130_code::_id_6316( var_8 + var_9.size );

    thread maps\_vehicle::_id_1FA6( var_3 );
    _id_5CFE::_id_5C97( [ var_3 ] );
}

_id_645C()
{
    var_0 = getent( "chase_hind", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6318, "chase_hind" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "hind" );
    var_1 = maps\_utility::_id_1BF9( "chase_hind", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = getent( "chase_hind_pilot", "targetname" );
    var_3 = getent( "chase_enemy_hind_look_at", "targetname" );
    var_4 = maps\_utility::_id_1BF9( "chase_enemy_hind_rocket_point", "targetname" );
    var_4 = maps\_utility::_id_0B53( var_4 );

    foreach ( var_6 in level._id_6230 )
        var_6 notify( "LISTEN_end_monitor_encounter_primary_enemy_on_death" );

    var_8 = [];

    foreach ( var_11, var_10 in var_1 )
    {
        var_0.count = 1;
        _id_5F9E::_id_5EFE( [ var_0 ], var_10, [ "origin", "angles", "target" ] );
        var_8[var_11] = var_0 maps\_utility::_id_1FA3();
        wait 0.05;
        var_8[var_11] thread maps\paris_ac130_code::_id_631E( var_2 );
        var_8[var_11] thread _id_0053( "LISTEN_killed_by_player", "FLAG_chase_encounter_2_complete" );

        if ( var_11 <= 2 )
        {
            var_8[var_11] thread maps\paris_ac130_code::_id_6323();
            var_8[var_11] thread maps\paris_ac130_code::_id_6320( var_3, [ var_4[var_11 % var_4.size] ] );
        }

        wait(common_scripts\utility::ter_op( var_11 > 2, 1.0, 0.05 ));
    }

    thread _id_645E( var_8 );
    var_8[3] maps\_utility::delaythread( 18.0, maps\paris_ac130_code::_id_6323 );
    var_8[4] maps\_utility::delaythread( 17.5, maps\paris_ac130_code::_id_6323 );
    _id_5CFE::_id_5C97( var_8 );
    var_12 = "FLAG_chase_hinds_killed";
    thread _id_5F9E::_id_5F7B( var_8, "death", var_12 );
    thread _id_6464();
    var_13 = "LISTEN_hind_finished_shooting_rockets";
    var_12 = "FLAG_chase_hinds_finished_shooting_rockets";
    thread _id_5F9E::_id_5F7B( [ var_8[1], var_8[2] ], var_13, var_12 );
    common_scripts\utility::flag_wait( "FLAG_chase_hinds_finished_shooting_rockets" );
    level._id_614E maps\paris_ac130_code::_id_62A6( var_8[1] );
    level._id_614E maps\paris_ac130_code::_id_62A6( var_8[2] );

    foreach ( var_11, var_15 in var_8 )
    {
        if ( isdefined( var_15 ) && isalive( var_15 ) )
        {
            switch ( var_11 )
            {
                case 1:
                    var_15 setlookatent( level._id_614D );
                    continue;
                case 2:
                    var_15 setlookatent( level._id_614E );
                    continue;
                default:
                    var_16 = common_scripts\utility::ter_op( randomint( 2 ), level._id_614D, level._id_614E );
                    var_15 setlookatent( var_16 );
                    var_15 thread maps\paris_ac130_code::_id_6322( var_16 );
                    continue;
            }
        }
    }

    wait 4.0;
    thread _id_6463();

    if ( isdefined( var_8[1] ) && isalive( var_8[1] ) )
    {
        var_8[1] maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_6322, level._id_614E );
        var_8[1] common_scripts\utility::delaycall( 3.0, ::vehicle_setspeedimmediate, 35, 7, 7 );
        var_17 = _id_5F9E::_id_5F52( "chase_enemy_hind_1_rocket_points" );
        maps\_utility::_id_2122( var_17 );
        var_8[1] maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_631F, var_17[0] );
        var_8[1] maps\_utility::delaythread( 3.0, maps\paris_ac130_code::_id_631F, var_17[1] );
        var_8[1] maps\_utility::delaythread( 5.0, maps\paris_ac130_code::_id_631F, var_17[2] );
        var_8[1] maps\_utility::delaythread( 7.0, maps\paris_ac130_code::_id_631F, var_17[3] );
    }

    if ( isdefined( var_8[2] ) && isalive( var_8[2] ) )
    {
        var_8[2] maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_6322, level._id_614E );
        var_8[2] common_scripts\utility::delaycall( 3.25, ::vehicle_setspeedimmediate, 35, 7, 7 );
        var_18 = _id_5F9E::_id_5F52( "chase_enemy_hind_2_rocket_points" );
        maps\_utility::_id_2122( var_18 );
        var_8[2] maps\_utility::delaythread( 2.0, maps\paris_ac130_code::_id_631F, var_18[0] );
        var_8[2] maps\_utility::delaythread( 4.0, maps\paris_ac130_code::_id_631F, var_18[1] );
        var_8[2] maps\_utility::delaythread( 6.0, maps\paris_ac130_code::_id_631F, var_18[2] );
        var_8[2] maps\_utility::delaythread( 8.0, maps\paris_ac130_code::_id_631F, var_18[3] );
    }

    foreach ( var_11, var_15 in var_8 )
    {
        if ( isdefined( var_15 ) && isalive( var_15 ) && var_11 > 2 )
            var_15 common_scripts\utility::delaycall( 2.0, ::vehicle_setspeedimmediate, 62, 30, 30 );
    }

    if ( isdefined( var_8[3] ) && isalive( var_8[3] ) )
    {
        var_20 = _id_5F9E::_id_5F52( "chase_enemy_hind_3_rocket_points" );
        maps\_utility::_id_2122( var_20 );
        var_8[3] maps\_utility::delaythread( 14.0, maps\paris_ac130_code::_id_631F, var_20[0] );
        var_8[3] maps\_utility::delaythread( 18.0, maps\paris_ac130_code::_id_631F, var_20[1] );
    }

    if ( isdefined( var_8[4] ) && isalive( var_8[4] ) )
    {
        var_21 = _id_5F9E::_id_5F52( "chase_enemy_hind_4_rocket_points" );
        maps\_utility::_id_2122( var_21 );
        var_8[4] maps\_utility::delaythread( 16.0, maps\paris_ac130_code::_id_631F, var_21[0] );
        var_8[4] maps\_utility::delaythread( 20.0, maps\paris_ac130_code::_id_631F, var_21[1] );
    }

    common_scripts\utility::flag_wait( "FLAG_chase_hinds_killed" );
    var_0 delete();
    var_2 delete();

    foreach ( var_10 in var_1 )
        maps\_utility::_id_2122( _id_5F9E::_id_5F52( var_10.target ) );
}

_id_6463()
{
    var_0 = 5.0;

    if ( !issubstr( level._id_5C3E, "25" ) )
        level.player maps\_utility::_id_1823( "HINT_ac130_use_25", var_0 );
}

_id_6464()
{
    common_scripts\utility::flag_wait( "FLAG_chase_dialogue_finished" );
    var_0 = [];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_choppersoffass"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_hitbirdsnow"];
    var_0[var_0.size] = level.scr_sound["snd"]["ac130_snd_takeoutchoppers"];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    var_3 = 4.0;
    var_4 = 0;

    while ( !common_scripts\utility::flag( "FLAG_chase_hinds_killed" ) )
    {
        if ( var_1.size == 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
                var_1[var_1.size] = var_2;

            if ( var_1.size > 1 )
                var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        }

        var_4 = randomint( var_1.size );
        _id_5CFE::playsoundoverradio( var_0[var_1[var_4]], 0 );
        var_1 = maps\_utility::array_remove_index( var_1, var_4 );
        wait(var_3);
    }
}

_id_6465()
{
    var_0 = getent( "chase_t72", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62D7, "chase_t72", "targetname", 1 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "t72" );
    var_1 = maps\_utility::_id_1BF9( "chase_t72", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
    {
        var_0.count = 1;
        var_0.origin = var_4.origin;
        var_0.angles = var_4 _id_5F9E::_id_5F4F( "angles" );
        var_0.target = var_4.target;
        var_2[var_5] = var_0 maps\_utility::_id_1FA3();
        wait 0.1;
        var_2[var_5] thread _id_0052( "LISTEN_killed_by_player", "FLAG_chase_encounter_1_complete" );
        var_2[var_5]._id_16A5 = var_4._id_16A5;
    }

    thread maps\paris_ac130_code::_id_0051( [ var_2[2], var_2[3], var_2[4] ] );
    thread maps\paris_ac130_code::_id_0051( [ var_2[5], var_2[6], var_2[7] ] );
    var_6 = getent( "chase_enemy_tank_look_at_1", "targetname" );
    var_2[1] setturrettargetent( var_6 );
    var_2[2] setturrettargetent( var_6 );
    var_2[3] setturrettargetent( var_6 );
    var_2[4] setturrettargetent( var_6 );
    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );

    foreach ( var_8 in var_2 )
    {
        if ( isdefined( var_8 ) )
        {
            var_8 notify( "death" );
            var_8 delete();
        }
    }

    var_0 delete();
    var_6 delete();
}

_id_6466()
{
    var_0 = getentarray( "chase_t72", "targetname" );
    var_0 = maps\_utility::_id_27EC( var_0 );
    thread maps\paris_ac130_code::_id_6286( var_0[1] );
    thread maps\paris_ac130_code::_id_6286( var_0[2] );

    if ( level.gameskill == 3 )
    {
        maps\_utility::delaythread( 4.0, _id_5CFE::_id_5C97, [ var_0[1], var_0[2] ] );
        maps\_utility::delaythread( 25.0, _id_5CFE::_id_5CA0, [ var_0[1], var_0[2] ] );
    }

    wait 6.5;
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_0 = maps\_utility::_id_1361( var_0 );
    var_0 = maps\_utility::_id_27EC( var_0 );
    maps\_utility::delaythread( 15.0, _id_5CFE::_id_5C97, [ var_0[3], var_0[4] ] );
    maps\_utility::delaythread( 30.0, _id_5CFE::_id_5CA0, [ var_0[3], var_0[4] ] );
    var_1 = _id_5F9E::_id_5F8D( "chase_enemy_tank_", "targetname", 1, "_shoot_at_1" );
    var_0[1] maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_62DD, var_1[1] );
    var_0[2] maps\_utility::delaythread( 1.25, maps\paris_ac130_code::_id_62DD, var_1[2] );
    var_0[3] maps\_utility::delaythread( 1.5, maps\paris_ac130_code::_id_62DD, var_1[3] );
    var_0[4] maps\_utility::delaythread( 2.5, maps\paris_ac130_code::_id_62DD, var_1[4] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 1, 2, "_shoot_at_2" );
    var_0[1] maps\_utility::delaythread( 9.5, maps\paris_ac130_code::_id_62DD, var_1[1] );
    var_0[2] maps\_utility::delaythread( 4.5, maps\paris_ac130_code::_id_62DD, var_1[2] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 1, 2, "_shoot_at_3" );
    var_0[1] maps\_utility::delaythread( 12.5, maps\paris_ac130_code::_id_62DD, var_1[1] );
    var_0[2] maps\_utility::delaythread( 11.5, maps\paris_ac130_code::_id_62DD, var_1[2] );
    var_2 = [ var_0[1], var_0[2] ];

    foreach ( var_4 in var_2 )
    {
        var_5 = getvehiclenode( var_4.targetname + "_" + var_4._id_16A5 + "_in", "script_noteworthy" );
        var_6 = getvehiclenode( var_4.targetname + "_" + var_4._id_16A5 + "_out", "script_noteworthy" );
        var_4 thread _id_5F9E::_id_5F3E( var_5, var_6 );
    }

    maps\_utility::delaythread( 16.5, maps\paris_ac130_code::_id_6286, var_0[3] );
    maps\_utility::delaythread( 16.5, maps\paris_ac130_code::_id_6286, var_0[4] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 3, 4, "_shoot_at_2" );
    var_0[3] maps\_utility::delaythread( 20.0, maps\paris_ac130_code::_id_62DD, var_1[3] );
    var_0[4] maps\_utility::delaythread( 21.5, maps\paris_ac130_code::_id_62DD, var_1[4] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 3, 4, "_shoot_at_3" );
    var_0[3] maps\_utility::delaythread( 22.5, maps\paris_ac130_code::_id_62DD, var_1[3] );
    var_0[4] maps\_utility::delaythread( 24.0, maps\paris_ac130_code::_id_62DD, var_1[4] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 3, 4, "_shoot_at_4" );
    var_0[3] maps\_utility::delaythread( 25.5, maps\paris_ac130_code::_id_62DD, var_1[3] );
    var_0[4] maps\_utility::delaythread( 26.5, maps\paris_ac130_code::_id_62DD, var_1[4] );
}

_id_6467()
{
    var_0 = getentarray( "chase_t72", "targetname" );
    var_0 = maps\_utility::_id_27EC( var_0 );
    maps\_utility::delaythread( 0.05, maps\paris_ac130_code::_id_6286, var_0[5] );
    maps\_utility::delaythread( 2.5, maps\paris_ac130_code::_id_6286, var_0[6] );
    maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_6286, var_0[7] );
    wait 33.0;
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_0 = maps\_utility::_id_1361( var_0 );
    var_0 = maps\_utility::_id_27EC( var_0 );
    _id_5CFE::_id_5C97( [ var_0[5], var_0[6], var_0[7] ] );
    maps\_utility::delaythread( 10.0, _id_5CFE::_id_5CA0, [ var_0[5], var_0[6], var_0[7] ] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 5, 7, "_shoot_at_1" );
    var_0[5] maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_62DD, var_1[5] );
    var_0[6] maps\_utility::delaythread( 1.25, maps\paris_ac130_code::_id_62DD, var_1[6] );
    var_0[7] maps\_utility::delaythread( 1.5, maps\paris_ac130_code::_id_62DD, var_1[7] );
    var_1 = _id_5F9E::_id_5F8F( "chase_enemy_tank_", "targetname", 5, 7, "_shoot_at_2" );
    var_0[5] maps\_utility::delaythread( 5.0, maps\paris_ac130_code::_id_62DD, var_1[5] );
    var_0[6] maps\_utility::delaythread( 5.25, maps\paris_ac130_code::_id_62DD, var_1[6] );
    var_0[7] maps\_utility::delaythread( 5.5, maps\paris_ac130_code::_id_62DD, var_1[7] );
}

_id_6468()
{
    var_0 = getentarray( "chase_t72", "targetname" );
    var_0 = maps\_utility::_id_27EC( var_0 );
    wait 5.0;
    maps\_utility::delaythread( 0.05, maps\paris_ac130_code::_id_6286, var_0[8] );
    maps\_utility::delaythread( 2.5, maps\paris_ac130_code::_id_6286, var_0[9] );
    maps\_utility::delaythread( 1.0, maps\paris_ac130_code::_id_6286, var_0[10] );
    wait 18.0;
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_0 = maps\_utility::_id_1361( var_0 );
    var_0 = maps\_utility::_id_27EC( var_0 );
    _id_5CFE::_id_5C97( [ var_0[8], var_0[9], var_0[10] ] );
    maps\_utility::delaythread( 15.0, _id_5CFE::_id_5CA0, [ var_0[8], var_0[9], var_0[10] ] );
}

_id_6469()
{
    var_0 = getent( "chase_mi17", "targetname" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62E1, "chase_mi17", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6282 );
    var_0 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_6285, "mi17" );
    var_1 = maps\_utility::_id_1BF9( "chase_mi17", "targetname" );
    var_2 = getent( "chase_mi17_pilot", "targetname" );
    var_3 = getent( "chase_mi17_enemy", "targetname" );
    var_4 = [ "1", "2", "3" ];
    var_5 = [ 7.0, 0.05, 0.05 ];

    foreach ( var_18, var_7 in var_4 )
    {
        var_8 = 1;
        var_9 = 0;

        while ( !var_9 )
        {
            foreach ( var_11 in var_1 )
            {
                if ( var_11 _id_5F9E::_id_5F0A( "script_parameters", var_7 ) && !maps\_utility::_id_26AD( var_11.origin, cos( getdvarfloat( "cg_fov" ) ) ) )
                {
                    var_8 = common_scripts\utility::ter_op( isdefined( var_11._id_16A5 ), var_11._id_16A5, var_8 );
                    var_9 = 1;
                    break;
                }
            }

            wait 0.05;
        }

        var_13 = 0;
        var_14 = 2.0;

        foreach ( var_11 in var_1 )
        {
            if ( var_11 _id_5F9E::_id_5F0A( "script_parameters", var_7 ) && var_11 _id_5F9E::_id_5F0A( "script_index", var_8 ) )
            {
                var_0.count = 1;
                var_0.angles = var_11 _id_5F9E::_id_5F4F( "angles" );
                var_0.origin = var_11.origin;
                var_0.target = var_11.target;
                var_16 = var_0 maps\_utility::_id_1FA3();
                wait 0.05;

                if ( level.gameskill == 3 )
                {
                    maps\_utility::delaythread( 6.0, _id_5CFE::_id_5C97, [ var_16 ] );
                    maps\_utility::delaythread( 32.0, _id_5CFE::_id_5CA0, [ var_16 ] );
                }

                var_16 thread _id_0052( "LISTEN_killed_by_player", "FLAG_chase_encounter_1_complete" );
                var_16 thread maps\paris_ac130_code::_id_62F3( var_2 );
                var_16 thread maps\paris_ac130_code::_id_62F4( var_3, 1 );
                var_16 maps\paris_ac130_code::_id_62FB( [ ::_id_646A ] );
                var_16 thread maps\paris_ac130_code::_id_62F0();
                var_13++;
                wait(var_13 * var_14);
            }
        }

        wait(var_5[var_18]);
    }

    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );
    var_0 delete();
    var_2 delete();
    var_3 delete();
}

_id_646A()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "FLAG_chase_end_chase" );
    self dodamage( 10000, self.origin );
}

_id_646B()
{
    var_0 = [];
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "city_area_ma_enemy_1", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "city_area_ma_enemy_2", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "city_area_ma_enemy_3", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "city_area_ma_enemy_4", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "city_area_pfr_enemy_1", "targetname" ) );
    thread maps\_utility::_id_2122( var_0, 0.2 );
}

_id_646C()
{
    var_0 = [];
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "city_area_pfr_enemy_1", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_pfr_t72", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_pfr_mi17", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_pfr_mi17_pilot", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_pfr_mi17_enemy", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_rpg_enemy", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_gaz", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_gaz_enemy", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_bm21", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_bm21_enemy", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_hind", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_hind_pilot", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_enemy_hind_look_at", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_t72", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_enemy_tank_look_at_1", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_mi17", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_mi17_pilot", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "chase_mi17_enemy", "targetname" ) );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_2 notify( "death" );
            var_2 delete();
        }
    }

    _id_646D();
}

_id_646D()
{
    var_0 = [];
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "courtyard_building_exit", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "chase_pfr_signal_ac130", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, common_scripts\utility::getstruct( "city_area_pfr_frost_cover_point", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F52( "chase_pfr_enemy_spot" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_pfr_t72", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_pfr_mi17", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_rpg_enemy", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_vehicle", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_hind", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_enemy_hind_rocket_point", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F91( "chase_enemy_hind_1_rocket_point_", "targetname", 1 ) );
    var_0 = common_scripts\utility::array_combine( var_0, _id_5F9E::_id_5F91( "chase_enemy_hind_2_rocket_point_", "targetname", 1 ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_t72", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_t72", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, common_scripts\utility::getstructarray( "chase_mi17", "targetname" ) );
    thread maps\_utility::_id_2122( var_0, 0.2 );
}

_id_646E()
{
    wait 0.05;
    common_scripts\utility::flag_set( "FLAG_chase_end_chase" );
    objective_add( maps\_utility::_id_2816( "OBJ_CHASE_Escort" ), "current", &"PARIS_AC130_OBJ_CHASE_ESCORT_KILO_1_1" );
    wait 1.0;
    common_scripts\utility::flag_set( "FLAG_chase_started" );
    var_0 = getaiarray( "axis" );
    var_0 = common_scripts\utility::array_combine( var_0, getaiarray( "team3" ) );

    foreach ( var_2 in var_0 )
        _id_5F9E::_id_5F56( var_2 );

    var_4 = getvehiclenode( "chase_end_transition_out", "script_noteworthy" );
    level._id_5EB8 _id_5F9E::_id_5F3C( var_4 );
    wait 0.05;
    var_5 = getent( "chase_main_vehicle", "targetname" );
    var_5 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62A2, "chase_main_vehicle", "targetname" );
    level._id_614D = var_5 maps\_utility::_id_1FA3();
    var_6 = getentarray( "delta_group_1", "targetname" );
    maps\_utility::_id_27C9( var_6, maps\paris_ac130_code::_id_633F );
    var_7 = [];

    foreach ( var_9 in var_6 )
        var_7[var_7.size] = var_9 stalingradspawn();

    wait 0.05;
    level._id_614D maps\paris_ac130_code::_id_62A9( var_7 );
    var_11 = getent( "chase_second_vehicle", "targetname" );
    var_11 maps\_utility::add_spawn_function( maps\paris_ac130_code::_id_62A2, "chase_second_vehicle", "targetname" );
    level._id_614E = var_11 maps\_utility::_id_1FA3();
    var_6 = getentarray( "delta_group_2", "targetname" );
    maps\_utility::_id_27C9( var_6, maps\paris_ac130_code::_id_633F );
    var_7 = [];

    foreach ( var_9 in var_6 )
        var_7[var_7.size] = var_9 stalingradspawn();

    wait 0.05;
    level._id_614E maps\paris_ac130_code::_id_62A9( var_7 );
    wait 5.0;
    level._id_6133 maps\paris_ac130_code::_id_6342();
    level._id_6127 maps\paris_ac130_code::_id_6173();
    var_14 = level._id_6132;
    var_14[var_14.size] = level._id_6127;

    foreach ( var_16 in var_14 )
    {
        var_16 notify( "LISTEN_end_ai_scripts" );
        var_16.accuracy = var_7[0].accuracy;
        var_16._id_20AF = var_7[0]._id_20AF;
        var_16.health = var_7[0].health;
        var_16._id_6339 = undefined;
        var_16 maps\_utility::_id_2724( var_7[0].goalradius );
        var_16.ignoreme = 1;
        var_16.ignoreall = 1;
    }

    var_18 = "FLAG_chase_delta_entered_chase_vehicles";
    thread _id_5F9E::_id_5F7B( var_14, "enteredvehicle", var_18 );
    var_19 = [ level._id_6135, level._id_6126, level._id_6127 ];
    var_20 = getvehiclenode( "chase_second_vehicle_pickup_out", "script_noteworthy" );
    level._id_614D vehicle_teleport( var_20.origin, var_20.angles );
    level._id_614D maps\paris_ac130_code::_id_62A9( var_19 );
    var_21 = [ level._id_45C0, level._id_6133, level._id_6134 ];
    var_20 = getvehiclenode( "chase_main_vehicle_pickup_out", "script_noteworthy" );
    level._id_614E vehicle_teleport( var_20.origin, var_20.angles );
    level._id_614E maps\paris_ac130_code::_id_62A9( var_21 );
    var_4 = getvehiclenode( "chase_end_main_vehicle_transition_out", "script_noteworthy" );
    level._id_614D _id_5F9E::_id_5F3C( var_4 );
    level._id_614D maps\paris_ac130_code::_id_62AA();
    var_4 = getvehiclenode( "chase_end_second_vehicle_transition_out", "script_noteworthy" );
    level._id_614E _id_5F9E::_id_5F3C( var_4 );
    level._id_614E maps\paris_ac130_code::_id_62AA();
    var_22 = getent( "chase_player_focus", "targetname" );

    if ( isdefined( var_22 ) )
    {
        var_23 = getent( "bridge_player_focus", "targetname" );

        if ( isdefined( var_23 ) )
        {
            var_22.origin = var_23.origin;
            _id_5CFE::_id_5CD0( 0, 0.05, 0.05, 65, 65, 25, 55 );
        }
    }
}

_id_646F()
{
    objective_state( maps\_utility::_id_2816( "OBJ_CHASE_Escort" ), "done" );
    level._id_614D notify( "LISTEN_end_hummer_mission_failed" );
    level._id_614E notify( "LISTEN_end_hummer_mission_failed" );
    level._id_614D maps\paris_ac130_code::_id_62AA();
    level._id_614E maps\paris_ac130_code::_id_62AA();
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_filler" );
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_kill" );
    common_scripts\utility::flag_clear( "FLAG_ac130_context_sensitive_dialog_guy_pain" );
    common_scripts\utility::flag_clear( "FLAG_ambient_ac130_effects" );
    common_scripts\utility::flag_clear( "FLAG_delta_ac130_mission_fail" );
    common_scripts\utility::flag_set( "FLAG_end_ambient_ac130_effects" );
    maps\_utility::delaythread( 13.0, common_scripts\utility::flag_set, "FLAG_chase_encounter_2_check" );
    maps\_utility::delaythread( 13.5, _id_5CFE::_id_5C78 );
    level notify( "LISTEN_end_monitor_interact_button" );
    thread maps\paris_ac130_slamzoom::_id_614C();
    common_scripts\utility::flag_wait( "bridge_tanks_spawned" );
    thread _id_5F9E::_id_5EEF( "sm_sunsamplesizenear", 1.0, 1.0 );
    common_scripts\utility::flag_wait( "player_shot_tank" );
    _id_6470();
}

_id_6470()
{
    maps\_compass::setupminimap( "compass_map_paris_ac130_bridge", "bridge_minimap_corner" );
    setsaveddvar( "ui_hideMap", "0" );
}

_id_6471()
{

}
