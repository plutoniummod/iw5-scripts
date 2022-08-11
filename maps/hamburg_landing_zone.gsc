// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

pre_load()
{
    precacheshellshock( "hamburg_blackout" );
    precacheshellshock( "hamburg_garage_crash" );
    precacheitem( "rpg_straight" );
    precacheitem( "rpg_distant" );
    precacheitem( "rpg_straight_distant" );
    precacheitem( "m1a1_turret_blank" );
    precacheitem( "zippy_rockets_apache_cheap" );
    maps\hamburg_landing_zone_anim::main();
    maps\_utility::_id_2776( "tank_quake", 1, 0.7, 400 );
    thread _id_7ECD();
    maps\hamburg_code::_id_7E83( "strafe_building_1_fx_volume" );
    maps\hamburg_code::_id_7E83( "strafe_building_2_fx_volume" );
    maps\hamburg_code::_id_7E83( "hamburg_b_area" );
    maps\hamburg_code::_id_7E83( "garage_area" );
    maps\hamburg_code::_id_7E83( "bridge_and_before_garage_area" );
    maps\hamburg_code::_id_7E83( "parking_lot_area" );
    common_scripts\utility::flag_init( "tank_out_of_left" );
}

_id_7ECD()
{
    level waittill( "load_finished" );
    var_0 = getentarray( "move_hangout_heli", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_7F0F );
    level.struct = undefined;
    thread maps\_mortar::_id_412D();
    maps\_utility::_id_27CB( "sprints_to_goal", ::_id_7ECE );
    maps\_utility::_id_27CB( "tank_out_of_left", common_scripts\utility::flag_set, "tank_out_of_left" );
    var_1 = getentarray( "spawn_mask_tank_ride", "targetname" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_off );
    var_1 = getentarray( "spawn_mask_tank_ride", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_off );
    var_1 = getentarray( "spawn_mask_tank_ride_2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_off );
    var_1 = getentarray( "spawn_mask_tank_ride_2", "targetname" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_off );
    var_2 = getentarray( "spawn_mask_tank_ride_backup", "targetname" );
    common_scripts\utility::array_thread( var_2, common_scripts\utility::trigger_off );
    var_3 = getent( "catchup_allies_helper", "targetname" );
    var_3 thread _id_7F10();
    thread _id_0008();
}

_id_7ECE()
{
    self endon( "death" );
    maps\_utility::_id_2712();
    maps\_utility::_id_0A23( 1 );
    maps\_utility::delaythread( 5, maps\_utility::_id_0A23, 0 );
    self waittill( "goal" );
    maps\_utility::_id_2713();
}

_id_7ECF( var_0, var_1, var_2, var_3 )
{
    var_0 = maps\_utility::_id_2642( var_0, "targetname" );

    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );
    var_4 = [];

    foreach ( var_6 in var_1 )
        var_4[var_4.size] = maps\_utility::_id_2642( var_6, "targetname" );

    if ( isdefined( var_2 ) && var_2 )
        var_4[var_4.size] = level.player;

    foreach ( var_9 in var_4 )
    {
        while ( isalive( var_9 ) && !var_9 maps\_vehicle::_id_29CF() && !maps\_vehicle::_id_29CF() )
        {
            var_9 maps\_vehicle::_id_2A13();
            var_9._id_29CC = 1;
            var_0 setlookatent( var_9 );

            if ( var_9 == level.player )
            {
                level.player endon( "death" );
                wait 6;
            }

            if ( var_0.vehicletype == "apache" )
            {
                var_10 = 1;

                if ( isdefined( level._id_7ED0 ) )
                {
                    if ( !level._id_7ED0 )
                        var_0 maps\_helicopter_globals::fire_missile( "apache_zippy", 3, var_9, 0.4, 0.75 );
                }
                else
                    var_0 maps\_helicopter_globals::fire_missile( "apache_zippy", 3, var_9, 0.4, 0.75 );
            }
            else
                var_0 maps\_helicopter_globals::fire_missile( "mi28_zippy", 3, var_9, 0.4, 0.75 );

            wait(randomfloatrange( 1.3, 2 ));
        }
    }

    var_0 clearlookatent();
}

_id_7ED1()
{
    wait 4;

    if ( !isdefined( level._id_7ED0 ) )
        return;

    level._id_7ED0 = 0;
}

_id_7ED2()
{
    var_0 = common_scripts\utility::getstruct( "friend_smoke_beach", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 waittill( "trigger" );
    maps\hamburg_code::_id_7E96( "tank_rh1_deployingsmoke" );
    var_0 = common_scripts\utility::getstruct( "beach_smoke_org", "targetname" );
    var_2 = vectornormalize( var_0.origin - level._id_7E1B getcentroid() );
    var_3 = var_0.origin + var_2 * 500;
    wait 0.15;
    level._id_7E1B maps\_utility::_id_1402( "fired_smoke_screen" );
    var_4 = level._id_7E1B vehicle_scripts\_m1a1_player_control::_id_7DF1( var_3 );
    level._id_7E1B maps\_utility::_id_1654( "fired_smoke_screen" );
    thread common_scripts\utility::play_sound_in_space( "flashbang_explode_default", var_4 );
    common_scripts\utility::exploder( "shore_smoke" );
    maps\_utility::delaythread( 0.25, ::_id_7EEC );
    thread maps\hamburg_code::_id_7E96( "tank_rh1_youboys" );
    level._id_45C0 thread maps\hamburg_code::_id_7E96( "hamburg_snd_clearapath" );
    var_5 = getent( "beach_smoke_color", "script_noteworthy" );

    if ( isdefined( var_5 ) )
    {
        var_6 = getent( var_5.target, "targetname" );
        var_7 = 17;

        if ( isdefined( var_6 ) )
            var_6 thread maps\_utility::_id_1424( "trigger", var_7 );

        var_5 thread maps\_utility::_id_1424( "trigger", 0.5 );
        maps\_utility::delaythread( var_7 - 8, ::_id_7ED5 );
    }

    maps\_utility::delaythread( 9, ::_id_7ED3 );
}

_id_7ED3()
{
    var_0 = getent( "objective_walker_moveright", "targetname" );

    for ( var_1 = common_scripts\utility::spawn_tag_origin(); isdefined( var_0 ); var_0 = getent( var_2.target, "targetname" ) )
    {
        var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
        _id_7ED4( var_0, var_2, var_1 );

        if ( !isdefined( var_2.target ) )
            return;
    }

    var_1 delete();
}

_id_0008()
{
    var_0 = getent( "allies_to_hot_building_color", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 8;
    maps\hamburg_code::_id_7E96( "hamburg_snd_movemove" );
    common_scripts\utility::flag_wait( "two_tanks_in_alley" );
    maps\hamburg_code::_id_7E96( "tank_rh2_2moret90s" );
    maps\hamburg_code::_id_7E96( "tank_rh1_standclear" );
    maps\hamburg_code::_id_7E96( "tank_rh2_rightbehindyou" );
    wait 5;
    maps\hamburg_code::_id_7E96( "hamburg_snd_movemove" );
    common_scripts\utility::flag_wait( "bridge_spawn_trigger" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_movemove" );
}

_id_7ED4( var_0, var_1, var_2 )
{
    objective_position( maps\_utility::_id_2816( "scout_for_tanks" ), var_1.origin );

    if ( isdefined( var_0._id_164F ) )
    {
        if ( common_scripts\utility::flag( var_0._id_164F ) )
            return;

        level endon( var_0._id_164F );
    }

    var_0 waittill( "trigger" );
}

_id_7ED5()
{
    level endon( "stop_nag_flank_right" );
    var_0 = [ "hamburg_snd_rightflank", "hamburg_snd_goinright", "hamburg_snd_sticktoright" ];
    var_1 = var_0;

    foreach ( var_3 in var_1 )
    {
        level._id_45C0 maps\_utility::_id_168C( var_3 );
        wait(randomfloatrange( 4, 6 ));
    }
}

_id_7ED6()
{
    waittillframeend;
    common_scripts\utility::flag_wait( "glory_tank_ready_for_death" );
    common_scripts\utility::flag_wait( "player_ready_for_hot_buildings" );
    level notify( "goal_think_triggered_new" );
    maps\hamburg_code::_id_7E93();
    var_0 = maps\_utility::_id_283B( "glory_tank_missile_struct", "targetname" );
    var_1 = magicbullet( "javelin_no_explode", var_0.origin, level._id_7E26 getcentroid() + ( 0.0, 0.0, 16.0 ) );
    var_1 missile_setflightmodedirect();
    var_1 missile_settargetent( level._id_7E26 );
    thread maps\hamburg_code::_id_7E96( "hamburg_rhg_incoming", 0.5 );
    var_2 = _id_7F02( "heli_ally_hangout1" );
    var_2 maps\_utility::delaythread( 1, ::_id_7F05, "missile_chain_group_a" );
    maps\_utility::_id_272C( "event1_encounter2B_floodspawners", 0, 1 );
    level._id_7E26 maps\hamburg_code::_id_7E63();
    level._id_7E26 maps\_vehicle::_id_2A13();
    level._id_7E26 common_scripts\utility::waittill_notify_or_timeout( "death", 1.55 );
    level._id_7E26 joltbody( level._id_7E26.origin, 9 );

    if ( isalive( level._id_7E26 ) )
        level._id_7E26 kill();

    thread _id_7EF5();
    earthquake( 1.3, 0.8, level._id_7E04.origin, 400 );
    maps\_utility::_id_1428( "hamburg_glory_tank_dies" );
    maps\_utility::delaythread( 70, maps\_utility::_id_1427, 10 );
    thread _id_7ED7();
}

_id_7ED7()
{
    level._id_7E04 maps\_vehicle::_id_29C3( "hot_buildings_one", 15, 15 );
    thread _id_7EDD();
    thread _id_7ED9();
    thread _id_7EDA();
    common_scripts\utility::exploder( "strafe_building_1_pre" );
    var_0 = getent( "allies_to_hot_building_color", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );

    wait 7;
    maps\_utility::_id_272C( "building_drones_floor_one", 1, undefined, 0 );
    wait 5;
    common_scripts\utility::flag_set( "hot_buildings_destroyed" );
}

_id_7ED8()
{
    var_0 = maps\_utility::_id_1BF9( "javelin_to_hot_help_heli", "targetname" );
    var_1 = [];
    var_2 = maps\_utility::_id_2642( "event1_forward_heli_one", "targetname" );
    var_2._id_29CC = 1;
    var_2 maps\_vehicle::_id_2A13();
    var_1[var_1.size] = var_2;
    var_2 = maps\_utility::_id_2642( "event1_forward_heli_nine", "targetname" );

    if ( isdefined( var_2 ) )
    {
        var_2._id_29CC = 1;
        var_2 maps\_vehicle::_id_2A13();
        var_1[var_1.size] = var_2;
    }

    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        var_2 = var_1[var_3];
        var_3++;

        if ( !isalive( var_2 ) )
            continue;

        var_6 = magicbullet( "javelin_no_explode", var_5.origin, var_2 getcentroid() );
        var_6 missile_setflightmodedirect();
        var_6 missile_settargetent( var_2 );
        var_6 common_scripts\utility::delaycall( 22, ::missile_cleartarget );
    }

    level._id_7E04 maps\_vehicle::_id_29C3( "hot_buildings_two", 5, 5 );
    level._id_7E1B maps\_vehicle::_id_29C3( "hot_buildings_two", 5, 5 );
    thread _id_7EDE();
    thread _id_7EDB();
    thread _id_7EDC();
    common_scripts\utility::exploder( "strafe_building_2_pre" );
    wait 6;
    level._id_7E04 maps\_vehicle::_id_2B1C( "hot_buildings_two" );
    level._id_7E1B maps\_vehicle::_id_2B1C( "hot_buildings_two" );
}

_id_7ED9()
{
    level._id_7E1B maps\hamburg_tank_ai::_id_7DBC();
    level._id_7E1B setvehweapon( "m1a1_turret_blank" );
    level._id_7E1B _id_7EE8( "missile_chain_group_a", "hot_buildings_destroyed" );
    level._id_7E1B _id_7EE8( "missile_chain_group_c", "hot_buildings_destroyed" );
    level._id_7E1B maps\hamburg_code::_id_7E90();
    level._id_7E1B thread maps\hamburg_tank_ai::_id_7D9C();
}

_id_7EDA()
{
    level._id_7E04 setvehweapon( "m1a1_turret_blank" );
    level._id_7E04 maps\hamburg_tank_ai::_id_7DBC();
    level._id_7E04 _id_7EE8( "missile_chain_group_c", "hot_buildings_destroyed" );
    level._id_7E04 _id_7EE8( "missile_chain_group_a", "hot_buildings_destroyed" );
    level._id_7E04 maps\hamburg_code::_id_7E90();
    level._id_7E04 thread maps\hamburg_tank_ai::_id_7D9C();
}

_id_7EDB()
{
    level._id_7E1B maps\hamburg_tank_ai::_id_7DBC();
    level._id_7E1B setvehweapon( "m1a1_turret_blank" );
    level._id_7E1B _id_7EE8( "missile_chain_group_d", "hot_buildings_destroyed_2" );
    level._id_7E1B _id_7EE8( "missile_chain_group_c", "hot_buildings_destroyed_2" );
    level._id_7E1B maps\hamburg_code::_id_7E90();
    level._id_7E1B thread maps\hamburg_tank_ai::_id_7D9C();
}

_id_7EDC()
{
    level._id_7E04 setvehweapon( "m1a1_turret_blank" );
    level._id_7E04 maps\hamburg_tank_ai::_id_7DBC();
    level._id_7E04 _id_7EE8( "missile_chain_group_c", "hot_buildings_destroyed_2" );
    level._id_7E04 _id_7EE8( "missile_chain_group_d", "hot_buildings_destroyed_2" );
    level._id_7E04 maps\hamburg_code::_id_7E90();
    level._id_7E04 thread maps\hamburg_tank_ai::_id_7D9C();
}

_id_7EDD()
{
    var_0 = _id_7F02( "heli_ally_hangout1" );

    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );
    var_1 = var_0 _id_7EDF();
    var_0 _id_7F05( "missile_chain_group_a", 10, "hot_buildings_destroyed", "apache_zippy_nd", var_1 );
    var_0 thread _id_7EF1();
}

_id_7EDE()
{
    var_0 = _id_7F02( "heli_ally_hangout1" );

    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );
    var_1 = var_0 _id_7EDF();
    var_0 _id_7F05( "missile_chain_group_a", 10, "hot_buildings_destroyed_2", "apache_zippy_nd", var_1 );
    var_0 thread _id_7EF1();
}

_id_7EDF()
{
    var_0 = _id_7F03();
    return [ var_0[0], var_0[1], var_0[2], var_0[3] ];
}

_id_7EE0()
{
    thread _id_7ED6();
    thread _id_7EEF();
    common_scripts\utility::flag_wait( "hot_buildings_destroyed" );
    maps\_utility::delaythread( 1, maps\_utility::_id_1425, "down_street" );
    thread _id_7EF0();
    common_scripts\utility::flag_wait( "player_ready_to_cross_street" );
    common_scripts\utility::flag_wait( "two_tanks_in_alley" );
    var_0 = getent( "two_tanks_in_alley", "targetname" );
    var_0 delete();
    var_1 = _id_7F02( "heli_ally_hangout1" );
    maps\_utility::_id_1425( "Down_street_two" );
    var_2 = maps\_vehicle::_id_2881( "tank_out_of_left2" );
}

_id_7EE1()
{

}

_id_7EE2()
{
    level endon( "stop_nag_player_get_on_tank" );
    var_0 = [ "hamburg_snd_onminigun", "hamburg_snd_upyougo", "hamburg_snd_getongun" ];
    var_1 = var_0;

    for (;;)
    {
        var_2 = var_1[0];
        var_1 = common_scripts\utility::array_remove( var_1, var_2 );

        if ( !var_1.size )
        {
            var_1 = maps\_utility::_id_0B53( var_0 );

            if ( var_1[0] == var_2 )
            {
                var_1 = common_scripts\utility::array_remove( var_1, var_2 );
                var_1[var_1.size] = var_2;
            }
        }

        level._id_45C0 maps\_utility::_id_168C( var_2 );
        wait(randomfloatrange( 4, 6 ));
    }
}

_id_7EE3()
{
    common_scripts\utility::flag_set( "tank_path_bridge" );
    maps\hamburg_minigun_death::main();

    while ( level._id_7E04 vehicle_getspeed() > 1 )
        wait 0.05;

    level._id_7E04 maps\hamburg_tank_ai::_id_7DBC();
    maps\_utility::_id_135B( getentarray( "glowy_tank_destroys_no_mans_land", "script_noteworthy" ) );
    level._id_7E2A = 0;
    level._id_7E04 clearturrettarget();
    level._id_7E04 setturrettargetvec( level._id_7E04 common_scripts\utility::tag_project( "tag_body", 100000 ) );
    level._id_7E04 setmodel( "vehicle_m1a1_abrams_minigun_shiny_objective" );
    level._id_7E04 hidepart( "tag_not_shiny_part" );
    var_0 = level._id_7E04 common_scripts\utility::spawn_tag_origin();
    var_0 setmodel( "vehicle_m1a1_abrams_minigun_shiny_part" );
    var_0 show();
    var_0 linkto( level._id_7E04, "tag_shiny_part_attach", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 = getent( "mount_tank_trigger", "targetname" );
    var_1 usetriggerrequirelookat();
    objective_state( maps\_utility::_id_2816( "scout_for_tanks" ), "done" );
    objective_add( maps\_utility::_id_2816( "hop_on_the_tank" ), "active", &"HAMBURG_OBJECTIVE_HOP_ON_THE_TANK", var_1 getcentroid() + ( 0.0, 0.0, 28.0 ) );
    objective_current( maps\_utility::_id_2816( "hop_on_the_tank" ) );
    var_1 setcursorhint( "HINT_ACTIVATE" );
    var_1 sethintstring( &"PLATFORM_HOLD_TO_USE" );
    maps\_utility::_id_135B( getentarray( "no_mans_land", "targetname" ) );
    thread _id_7EE2();
    var_1 waittill( "trigger" );
    level._id_7E04 showpart( "tag_not_shiny_part" );
    var_0 delete();
    var_2 = getent( "let_the_friends_through", "targetname" );
    var_2 connectpaths();
    var_2 delete();
    level notify( "stop_nag_player_get_on_tank" );
    var_3 = getentarray( "spawn_mask_tank_ride_backup", "targetname" );
    maps\_utility::delaythread( 2, common_scripts\utility::array_thread, var_3, common_scripts\utility::trigger_on );
    maps\_utility::_id_2727( maps\_utility::_id_2816( "hop_on_the_tank" ) );
    maps\hamburg_code::_id_7E95( "thin_black_smoke_M_HELICOPTER" );
    _id_7EE4();
    level._id_7E04 clearturrettarget();
    level._id_7E04 thread maps\hamburg_tank_ai::_id_7D9C();
    maps\hamburg_code::_id_7E3E();
    common_scripts\utility::flag_set( "player_in_tank" );
    maps\_utility::delaythread( 1, maps\_utility::_id_1425, "passed_bridge" );
    level._id_7E04 thread maps\hamburg_code::_id_7E43( "tank_player_just_mounted" );
    maps\_utility::delaythread( 2, maps\hamburg_code::_id_7E52 );
    var_4 = getvehiclenode( "helis_come_out", "script_noteworthy" );
    var_4 maps\_utility_code::_id_144C();
    var_5 = maps\_vehicle::_id_2881( "heli_chase_two" );
    maps\_utility::_id_282D( var_5, "pre_garage_vehicles" );
    var_5 maps\_vehicle::_id_2A12();
    var_5 maps\_utility::delaythread( 1.5, ::_id_0009, "heli_chase_two_missile_chain" );
    var_5 maps\_utility::delaythread( 3, maps\_vehicle::_id_2A13 );
    var_5 setlookatent( level._id_7E1B );
    wait 0.05;
    var_6 = maps\_vehicle::_id_2881( "heli_chase_one" );
    maps\_utility::_id_282D( var_6, "pre_garage_vehicles" );
    var_6 maps\_utility::delaythread( 2.5, ::_id_0009, "heli_chase_two_missile_chain_other" );
    var_6 maps\_utility::delaythread( 8, maps\_vehicle::_id_2A13 );
    var_6 maps\_vehicle::_id_2A12();
    var_6 setlookatent( level._id_7E04 );
    thread maps\hamburg_code::_id_7E96( "hamburg_rhg_hind" );
    thread maps\hamburg_code::_id_7E96( "tank_rh1_backitup" );
    maps\_utility::delaythread( 4, maps\hamburg_code::_id_7E96, "hamburg_rhg_trophysys" );
    maps\_utility::delaythread( 5, maps\hamburg_code::_id_7E96, "tank_rh2_getdown" );
    thread _id_7EE6( var_5, var_6 );
    level._id_7E04 waittill( "reached_end_node" );
    level._id_7E1B clearturrettarget();
    level._id_7E1B.mgturret[0] cleartargetentity();
    level._id_7E1B.mgturret[1] cleartargetentity();
    level._id_7E04.veh_transmission = "reverse";
    level._id_7E04._id_291B = "reverse";
    level._id_7E04 thread maps\hamburg_code::_id_7E43( "tank_track_e1_to_e2_e" );
    getvehiclenode( "veh_node_player_gets_smashed", "script_noteworthy" ) waittill( "trigger" );
    var_6 _id_7EFB();
}

_id_0009( var_0 )
{
    _id_7F05( var_0, undefined, undefined, "mi28_zippy_cheap" );
}

_id_7EE4()
{
    var_0 = maps\_utility::_id_1287( "minigun_m1a1" );
    var_1 = maps\_utility::_id_1287( "player_rig" );
    var_2 = maps\_utility::_id_1287( "player_rig_legs" );
    level._id_7E04 setmodel( "vehicle_m1a1_abrams_viewmodel" );
    level._id_7E04 thread maps\hamburg_code::_id_7E40();
    level._id_7E04 maps\_vehicle_aianim::_id_25D9();
    level._id_7E04 maps\hamburg_code::_id_7E3F();
    level._id_7E04 vehicle_scripts\_m1a1_player_control::_id_7DE6();
    var_3 = [];
    var_3[var_3.size] = var_1;
    var_3[var_3.size] = var_2;
    _id_7EE5();
    level.player lerpfov( 55, 3.15 );
    var_4 = level._id_7E04 common_scripts\utility::spawn_tag_origin();
    var_0 linkto( var_4, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 linkto( level._id_7E04, "tag_turret_mg_r", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 thread maps\_anim::_id_1246( var_0, "mount_tank", "tag_origin" );
    level.player playerlinktoblend( var_1, "tag_player", 0.3 );

    foreach ( var_6 in var_3 )
        var_6 linkto( level._id_7E04, "tag_guy0" );

    level._id_7E04 maps\_anim::_id_11DD( var_3, "mount_tank", "tag_guy0" );
    maps\_utility::_id_135B( var_3 );
    var_0 delete();
    var_4 delete();
}

_id_7EE5()
{
    level.player disableweapons();
    level.player dontinterpolate();
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
}

_id_7EE6( var_0, var_1 )
{
    level._id_7E1B maps\hamburg_tank_ai::_id_7DBC();
    level._id_7E04 endon( "reached_end_node" );
    level._id_7E1B _id_7EE7( var_0 );
    level._id_7E1B _id_7EE7( var_1 );
    level._id_7E1B clearturrettarget();
}

_id_7EE7( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    self setturrettargetent( var_0 );
    self.mgturret[0] settargetentity( var_0, ( 0.0, 0.0, 0.0 ) );
    self.mgturret[1] settargetentity( var_0, ( 0.0, 0.0, 0.0 ) );
    var_0 waittill( "death" );
}

_id_7EE8( var_0, var_1 )
{
    self notify( "new_tank_chain" );
    self endon( "new_tank_chain" );

    if ( isdefined( var_1 ) )
    {
        if ( common_scripts\utility::flag( var_1 ) )
            return;

        self endon( var_1 );
    }

    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2 thread maps\hamburg_code::_id_7E7B( thisthread, ::delete );
    thread maps\hamburg_code::_id_7E8E( var_2 );

    foreach ( var_4 in self.mgturret )
    {
        var_4._id_48C4 = var_4 getmode();

        if ( var_4 maps\hamburg_tank_ai::_id_7DA1() )
        {
            var_4 settargetentity( var_2 );
            continue;
        }

        if ( isdefined( var_4 getturretowner() ) )
            var_4 setmode( "manual_ai" );
        else
            var_4 setmode( "manual" );

        var_4 settargetentity( var_2, ( 0.0, 0.0, 0.0 ) );
        var_4 startfiring();
    }

    var_6 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2.origin = var_6.origin;

    for ( var_0 = var_6.target; isdefined( var_0 ); var_0 = var_6.target )
    {
        var_6 = common_scripts\utility::getstruct( var_0, "targetname" );
        var_2 maps\_utility::_id_2833( var_6.origin, ( 0.0, 0.0, 0.0 ), 900 );
    }
}

_id_7EE9()
{
    level._id_7E04 endon( "death" );
    maps\_utility::_id_135B( getentarray( "bridge_spawn_triggers", "targetname" ) );

    if ( maps\_utility::_id_275F( "tank_path_bridge" ) )
    {
        var_0 = getvehiclenode( "tank_avoid_part_2", "targetname" );
        level._id_7E04._id_29B8 = 1;
        level._id_7E04 vehicle_teleport( var_0.origin, combineangles( var_0.angles, ( 0.0, 180.0, 0.0 ) ) );
        level._id_7E04 maps\hamburg_code::_id_7E63();
        level._id_7E1B maps\hamburg_code::_id_7E41( "h_for_blackout" );
        level._id_7E1B maps\hamburg_code::_id_7E43( "h_for_blackout" );
        maps\_vehicle::_id_2881( "heli_chase_two" );
        maps\_vehicle::_id_2A9A( "heli_chase_one" );
        _id_7EEA( "force_gate_open_for_start" );
    }

    var_1 = getentarray( "spawn_mask_tank_ride", "targetname" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_on );
    var_1 = getentarray( "spawn_mask_tank_ride", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_on );
    wait 1.3;
    _id_7EFC();
    _id_7EEB();
    common_scripts\utility::flag_wait( "tanks_entered_garage" );
    level._id_7E04 _id_7F11();
    level._id_7E1B _id_7F11();
}

_id_7EEA( var_0 )
{
    var_1 = getvehiclenode( var_0, "script_noteworthy" );
    var_1 notify( "forced_open" );
}

_id_7EEB()
{
    var_0 = getentarray( "spawn_mask_tank_ride_2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_on );
    var_0 = getentarray( "spawn_mask_tank_ride_2", "targetname" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_on );
    maps\hamburg_code::_id_7E96( "tank_rh1_moreinbound" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_anothert90" );
    wait 5;
    maps\_utility::delaythread( 20, maps\hamburg_code::_id_7E96, "tank_rh2_fallingback" );
    maps\_utility::delaythread( 21, maps\hamburg_code::_id_7E96, "tank_rh1_theyrescared" );
    level._id_7E04._id_291B = "forward";
    level._id_7E04.veh_transmission = "forward";
    level._id_7E04 maps\hamburg_code::_id_7E43( "tank_avoid_part_2" );
}

_id_7EEC()
{
    maps\_utility::_id_272C( "event1_encounter2_floodspawners", 1, undefined, 1 );
    thread _id_7EEE();
    maps\_utility::_id_272C( "event1_encounter2_flow_floodspawners", 1, undefined, 1 );
    thread _id_7EED();
}

_id_7EED()
{
    wait 0.3;
    level._id_786A = maps\_utility::_id_2641( "event1_ecounter1_enemy", "script_noteworthy" );
    level thread maps\hamburg_code::_id_786F( "event1_encounter2_getaway_trigger" );
    wait 0.3;
    level._id_786A = maps\_utility::_id_2641( "event1_ecounter2_enemy", "script_noteworthy" );
    level thread maps\hamburg_code::_id_786F( "event1_encounter2_getaway_trigger" );
    level thread maps\hamburg_code::_id_786F( "event1_encounter2_getaway_trigger" );
}

_id_7EEE()
{
    thread _id_7EF8();
    wait 1.5;
    maps\_vehicle::_id_2881( "event1_t90" );
}

_id_7EEF()
{
    common_scripts\utility::flag_wait( "hot_buildings_destroyed" );
    level._id_7E1B notify( "new_tank_chain" );
    level._id_7E04 notify( "new_tank_chain" );
    wait 3;
    level._id_7E04 maps\_vehicle::_id_2B1C( "hot_buildings_one" );
    var_0 = _id_7F02( "heli_ally_hangout1" );
    var_0 thread _id_7EF1();
    thread _id_7ED8();
    wait 6;
    maps\_vehicle::_id_2881( "event2_tank_test_one" );
    maps\hamburg_code::_id_7E96( "tank_rh1_tanks" );
}

_id_7EF0()
{
    common_scripts\utility::flag_wait( "bridge_spawn_trigger" );
    var_0 = maps\_utility::_id_272C( "event2_bridge_combat_floodspawners", 1 );
}

_id_7EF1( var_0 )
{
    self notify( "heli_attacks_all_enemies" );
    self endon( "heli_attacks_all_enemies" );

    if ( isdefined( var_0 ) )
        level endon( var_0 );

    self endon( "death" );

    for (;;)
    {
        var_1 = getaiarray( "axis" );
        var_1 = common_scripts\utility::array_combine( var_1, level._id_1FFB["axis"]._id_0C6D );
        var_1 = maps\_utility::_id_2616( sortbydistance( var_1, level.player geteye() ) );

        if ( !var_1.size )
            break;

        foreach ( var_3 in var_1 )
        {
            if ( !_id_7EF2( var_3 ) )
                continue;

            if ( isdefined( var_3._id_0EF1 ) )
                continue;

            self setlookatent( var_3 );
            _id_7F06( var_3, 7 );
            wait(randomfloatrange( 1, 2 ));

            if ( !_id_7EF2( var_3 ) )
                continue;

            maps\_helicopter_globals::fire_missile( "apache_zippy", randomintrange( 2, 3 ), var_3, 0.1 );
            wait(randomfloatrange( 8, 15 ));
        }

        wait 1;
    }
}

_id_7EF2( var_0 )
{
    if ( !isalive( var_0 ) )
        return 0;

    var_1 = maps\_utility::_id_1EE9( var_0.origin, "allies" );

    if ( distancesquared( var_1.origin, var_0.origin ) < 2250000 )
        return 0;

    if ( distancesquared( level.player.origin, var_0.origin ) < 2250000 )
        return 0;

    return 1;
}

_id_7EF3()
{
    var_0 = maps\_utility::_id_283B( "event2_axis_drone_spawner", "targetname" );
    var_1 = maps\_utility::_id_283B( "event2_axis_drone_spawner_three", "targetname" );
    var_0 _id_7EF4( 1 );
    var_1 _id_7EF4( 1 );
}

_id_7EF4( var_0 )
{
    var_1 = maps\_spawner::_id_2125( self, 1 );
    var_1 maps\_utility::_id_166F( var_0 );
}

_id_7EF5()
{
    level endon( "three_tanks_dead" );
    childthread _id_7EF3();
}

_id_473C()
{
    if ( isdefined( level._id_473D ) )
        return level._id_473D;

    level._id_473D = maps\_hud_util::_id_09A7( "black", 1, level.player );
    level._id_473D.sort = -1;
}

_id_7EF6( var_0, var_1, var_2 )
{
    var_0 thread maps\_anim::_id_11C1( var_1, var_1.animation );
    var_0 maps\_anim::_id_11C1( var_2, var_2.animation );
}

_id_7EF7()
{
    var_0 = getent( "wounded_guy_a", "targetname" );
    var_1 = var_0 stalingradspawn();
    var_0 delete();
    maps\_utility::_id_13AF( var_1 );
    var_1.ignoreall = 1;
    var_1 maps\_utility::_id_24F5();
    var_2 = getent( "wounded_guy_b", "targetname" );
    var_2 = var_2 stalingradspawn();
    maps\_utility::_id_13AF( var_2 );
    var_2.ignoreall = 1;
    var_2 maps\_utility::_id_24F5();
    var_1._id_0D50 = maps\_utility::_id_270F( "airport_civ_dying_groupB_pull_death" );
    var_2._id_0D50 = maps\_utility::_id_270F( "airport_civ_dying_groupB_wounded_death" );
    var_3 = getnode( "Dragger_node", "targetname" );
    var_1.animation = "airport_civ_dying_groupB_pull";
    var_2.animation = "airport_civ_dying_groupB_wounded";
    thread _id_7EF6( var_3, var_1, var_2 );
    var_3 thread _id_51F7( var_1, var_2 );
    var_3 thread _id_51F7( var_2, var_1 );
}

_id_7EF8()
{
    thread _id_7EF7();
    maps\_utility::_id_272C( "right_sprinters", 1, 1, 1 );
    thread _id_7EF9( "stumble_1", "payback_pmc_sandstorm_stumble_3" );
    thread _id_7EF9( "stumble_2", "hunted_dazed_walk_C_limp" );
    thread _id_7EF9( "stumble_3", "hunted_dazed_walk_A_zombie" );
    thread _id_7EF9( "stumble_4", "hunted_dazed_walk_C_limp" );
    thread _id_7EF9( "stumble_5", "hunted_dazed_walk_C_limp" );
}

_id_7EF9( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = var_2 maps\_utility::_id_166F( 1 );
    var_2 delete();
    var_3 endon( "death" );
    var_3.ignoreall = 1;
    var_3.fixednode = 1;
    var_3._id_1032 = "generic";
    var_3.health = 20;
    var_3 _id_7EFA( var_1 );
    wait(randomfloatrange( 1, 3 ));
    var_3 maps\_utility::_id_140C();
    wait(randomfloatrange( 2, 4 ));
    var_3.ignoreall = 0;
    var_3.fixednode = 0;
}

_id_7EFA( var_0, var_1 )
{
    if ( !isalive( self ) )
        return;

    maps\_utility::_id_26F7( var_0, var_1 );
}

_id_51F7( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 common_scripts\utility::waittill_any( "damage", "_stealth_bad_event_listener", "enemy" );

    if ( isalive( var_1 ) )
        var_1 kill();

    var_0 stopanimscripted();
    self notify( "stop_loop" );
    var_0 kill();
}

_id_7EFB()
{
    level.player enableinvulnerability();
}

_id_7EFC()
{
    maps\hamburg_code::_id_7E30();
    level._id_7E04 maps\_utility::_id_13DC( "stunned_tank" );
    level._id_7E1B maps\_utility::_id_13DC( "stunned_tank" );
    thread maps\_utility::vision_set_fog_changes( "hamburg_garage_inside_tank", 0 );
    level._id_7E04 thread maps\hamburg_code::_id_7E9E();
    level.player enableinvulnerability();
    level.player._id_7E61 = 1;
    var_0 = _id_7F02( "heli_hangout_before_chase_heli" );
    earthquake( 1, 3, level._id_7E04.origin, 400 );
    playfx( common_scripts\utility::getfx( "slamraam_explosion" ), level._id_7E04.origin + ( 0.0, 0.0, 100.0 ) );
    level.player shellshock( "hamburg_blackout", 9 );
    level.player lerpfov( 65, 1 );
    maps\_utility::_id_194E( "hamburg_tankbelly" );
    var_1 = level._id_7E04._id_7DF5;
    level._id_7E04 vehicle_scripts\_m1a1_player_control::_id_7E09();
    maps\hamburg_tank_ai::_id_7DBD();
    level.player unlink();
    common_scripts\utility::exploder( "behind_bus_fire" );
    var_2 = common_scripts\utility::getstruct( "blackout_aimer", "targetname" );
    level._id_7E04 setturrettargetvec( var_2.origin );
    level.player disableweapons();
    var_3 = common_scripts\utility::array_combine( maps\_utility::_id_1377( "allies", "r" ), maps\_utility::_id_1377( "allies", "o" ) );
    var_4 = maps\_utility::_id_1BF9( "teliport_friends_after_tank_smash", "targetname" );
    maps\hamburg_code::_id_7E8F( var_3, var_4 );
    var_5 = getent( "retriet_from_helis_color_trigger", "script_noteworthy" );
    var_6 = getent( var_5.target, "targetname" );
    var_5 notify( "trigger" );
    thread common_scripts\utility::play_sound_in_space( "exp_armor_vehicle", level._id_7E04.origin );
    var_7 = maps\_utility::_id_1287( "player_rig" );
    var_8 = 0.47;
    var_9 = [];
    var_9["player"] = var_7;
    var_9["turret"] = var_1;
    var_10 = common_scripts\utility::spawn_tag_origin();
    var_11 = ( 10.0, 2.0, 0.0 );
    var_10.origin = level._id_7E04 gettagorigin( "tag_guy0" );
    var_10.angles = level._id_7E04 gettagangles( "tag_guy0" );
    var_10 linkto( level._id_7E04, "tag_guy0", var_11, ( 0.0, 0.0, 0.0 ) );
    var_7 linkto( var_10, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_10 maps\_anim::_id_122D( var_9, "player_getin", "tag_origin" );
    var_7 hide();
    var_10 thread _id_7EFF( var_9, "player_getin", "tag_origin" );
    wait 0.05;
    var_10 maps\_anim::_id_127F( var_9, "player_getin", var_8 );
    var_10 maps\_anim::_id_127C( var_9, "player_getin", 0 );
    level.player allowprone( 0 );
    level.player allowcrouch( 1 );
    level.player allowstand( 0 );
    level.player setstance( "crouch" );
    wait 0.5;
    level.player playerlinktodelta( var_7, "tag_player", 1, -5, 55, 30, 32, 0 );
    level.player common_scripts\utility::delaycall( 0.44, ::playerlinktodelta, var_7, "tag_player", 1, 25, 15, 30, 32, 0 );
    level.player lerpfov( 55, 2.15 );
    wait 0.5;
    thread _id_00FA();
    thread _id_7EFE();
    level._id_7E04._id_7EFD = 0.5;
    maps\_utility::delaythread( 0.5, maps\_utility::_id_1425, "blackout" );
    wait 1;
    level.player lerpfov( 55, 2 );
    thread maps\_utility::vision_set_fog_changes( "hamburg", 2 );
    var_7 hide();
    wait 0.4;
    wait 1;
    maps\_vehicle::_id_2881( "event3_tank_three" );
    wait 2;
    thread _id_7F00();
    wait 1;
    var_7 common_scripts\utility::delaycall( 1.2, ::show );
    var_1 maps\_utility::delaythread( 0.2, animscripts\hummer_turret\common::_id_48C9, 1.5 );
    level.player allowstand( 1 );
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player playerlinktoblend( var_7, "tag_player", 0.4, 0.2, 0.2 );
    var_10 maps\_anim::_id_127C( var_9, "player_getin", 1 );
    var_6 notify( "trigger" );
    maps\_utility::_id_194E( "hamburg_tankgun_city" );
    var_12 = maps\_vehicle::_id_2881( "apaches_take_out_enemy_1" );
    var_12 common_scripts\utility::delaycall( 1, ::sethoverparams, 50, 20, 10 );
    var_12 maps\_utility::delaythread( 2, ::_id_7EF1 );
    maps\_utility::_id_282D( var_12, "pre_garage_vehicles" );
    var_12 = maps\_vehicle::_id_2881( "apaches_take_out_enemy_2" );
    var_12 maps\_utility::delaythread( 2, ::_id_7EF1 );
    var_12 common_scripts\utility::delaycall( 1, ::sethoverparams, 50, 20, 10 );
    maps\_utility::_id_282D( var_12, "pre_garage_vehicles" );
    maps\_utility::delaythread( 2, ::_id_7ECF, "event1_forward_heli_one", [ "heli_chase_two", "heli_chase_one" ], 0 );
    maps\_utility::delaythread( 2, ::_id_7ECF, "apaches_take_out_enemy_1", [ "heli_chase_two", "heli_chase_one" ], 0 );
    maps\_utility::delaythread( 2, ::_id_7ECF, "apaches_take_out_enemy_2", [ "heli_chase_one", "heli_chase_two" ], 0 );
    maps\_utility::delaythread( 2, ::_id_7ECF, "heli_chase_two", [ "apaches_take_out_enemy_1", "apaches_take_out_enemy_2", "event1_forward_heli_one" ], 0 );
    maps\_utility::delaythread( 2, ::_id_7ECF, "heli_chase_one", [ "apaches_take_out_enemy_2", "apaches_take_out_enemy_1", "event1_forward_heli_one" ], 0 );
    level._id_7E04 maps\_utility::delaythread( 1.2, maps\hamburg_code::_id_02EC );
    level waittill( "finished_recover_anim" );
    level._id_7E04._id_7EFD = undefined;
    var_7 delete();
    level.player._id_7E61 = 0;
    level.player disableinvulnerability();
    level.player enableusability();
    maps\hamburg_code::_id_7E3E();
    level._id_7E04 thread maps\hamburg_tank_ai::_id_7D9C();
    level._id_7E1B thread maps\hamburg_tank_ai::_id_7D9C();
    level._id_7E04 maps\_utility::_id_13DE( "stunned_tank" );
    level._id_7E1B maps\_utility::_id_13DE( "stunned_tank" );
    maps\hamburg_tank_ai::_id_7DBF();
}

_id_00FA()
{
    maps\hamburg_code::_id_7E96( "tank_rh1_everyoneok" );
    maps\hamburg_code::_id_7E96( "tank_rh1_talktome" );
    maps\hamburg_code::_id_7E96( "tank_rh2_weregood" );
    maps\hamburg_code::_id_7E96( "tank_rh1_alrightletsroll" );
}

_id_7EFE()
{
    wait 0.5;
    level._id_7E04 fireweapon();
    level._id_7E04 maps\_vehicle::_id_25AB( "turret_fire" );
}

_id_7EFF( var_0, var_1, var_2 )
{
    maps\_anim::_id_11DD( var_0, var_1, var_2 );
    level notify( "finished_recover_anim" );
}

_id_7F00()
{
    var_0 = maps\_utility::_id_272C( "event3_encounter1_floodspawners", 1 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2612, 1 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_0A23, 1 );
    common_scripts\utility::array_thread( var_0, maps\_utility::delaythread, 6.5, maps\_utility::_id_2612, 0 );
    common_scripts\utility::array_thread( var_0, maps\_utility::delaythread, 6.5, maps\_utility::_id_0A23, 0 );
}

_id_000A()
{
    thread _id_000B();
    common_scripts\utility::flag_wait( "introscreen_complete" );
    wait 4.4;
    maps\hamburg_code::_id_7E96( "tank_bhp1_1minuteout" );
    maps\hamburg_code::_id_7E96( "tank_hq_copythat" );
    common_scripts\utility::flag_wait( "helix_three_two_hit" );
    maps\hamburg_code::_id_7E96( "tank_hq_hesgoindown" );
    maps\hamburg_code::_id_7E96( "tank_bhp1_staywithit" );
    maps\hamburg_code::_id_7E96( "tank_hq_sarbird" );
    maps\hamburg_code::_id_7E96( "tank_hq_yoursignature" );
    maps\hamburg_code::_id_7E96( "tank_bhp3_movin" );
    maps\hamburg_code::_id_7E96( "tank_app1_mizerone" );
    maps\hamburg_code::_id_7E96( "tank_app2_adjustheading" );
    maps\hamburg_code::_id_7E96( "tank_app1_clearedhot" );
    maps\hamburg_code::_id_7E96( "tank_lcd1_stagingarea" );
    maps\hamburg_code::_id_7E96( "tank_lcd2_ondeck" );
    maps\hamburg_code::_id_7E96( "tank_lcd1_stagingarea" );
    common_scripts\utility::flag_wait( "over_hovercrafts" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_nevermadeit" );
    maps\hamburg_code::_id_7E96( "hamburg_snd_guyshome" );
    maps\hamburg_code::_id_7E96( "tank_rh1_rollinout" );
    maps\hamburg_code::_id_7E96( "tank_rh2_rh2movin" );
    maps\hamburg_code::_id_7E96( "tank_rh3_weremovin" );
    common_scripts\utility::flag_wait( "player_unloaded" );
    wait 0.05;
    thread maps\_utility::_id_1425( "player_unloaded" );
}

_id_000B()
{
    common_scripts\utility::flag_wait( "over_hovercrafts" );
    maps\_utility::delaythread( 0.1, maps\_utility::_id_1425, "pre_landing_autosave" );
    level.player enableweapons();
}

_id_7F02( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "event1_forward_heli_one";

    var_2 = maps\_utility::_id_2642( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = maps\_vehicle::_id_2A99( var_1 );

    var_3 = common_scripts\utility::getstruct( var_0, "targetname" );

    if ( !isdefined( var_3.angles ) )
        var_3.angles = ( 0.0, 90.0, 0.0 );

    if ( maps\_utility::_id_275F( "ride_in" ) )
        var_2 vehicle_teleport( var_3.origin + ( 0.0, 0.0, -32.0 ), var_3.angles );

    var_2 setvehgoalpos( var_3.origin, 1 );

    if ( isdefined( var_3.angles ) )
        var_2 settargetyaw( var_3.angles[1] );

    return var_2;
}

_id_7F03( var_0 )
{
    var_1 = [];

    if ( self.vehicletype == "apache" )
        var_2 = [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1 ];
    else
        var_2 = [ 0.2, 0.3, 0.2 ];

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = spawnstruct();
        var_4.waittime = var_2[var_3];

        if ( isdefined( var_0 ) )
            var_4._id_7F04 = var_0;
        else if ( self.vehicletype == "apache" )
            var_4._id_7F04 = "apache_zippy";
        else
            var_4._id_7F04 = "mi28_zippy";

        var_1[var_3] = var_4;
    }

    return var_1;
}

_id_7F05( var_0, var_1, var_2, var_3, var_4 )
{
    self cleartargetyaw();
    self endon( "death" );
    self notify( "new_missile_chain" );
    self endon( "new_missile_chain" );

    if ( isdefined( var_2 ) )
    {
        if ( common_scripts\utility::flag( var_2 ) )
            return;

        self endon( var_2 );
    }

    if ( !isdefined( var_4 ) )
        var_4 = _id_7F03( var_3 );

    while ( isdefined( var_0 ) )
    {
        var_5 = common_scripts\utility::spawn_tag_origin();
        var_5 thread _id_7F07( self );
        var_6 = common_scripts\utility::getstruct( var_0, "targetname" );
        var_5.origin = var_6.origin;
        self setlookatent( var_5 );
        _id_7F06( var_5, var_1 );
        wait 0.5;
        var_5.origin += ( 0.0, 0.0, -150.0 );
        var_5 moveto( var_5.origin + ( 0.0, 0.0, 150.0 ), 0.7, 0, 0 );

        foreach ( var_8 in var_4 )
        {
            if ( isdefined( level._id_7ED0 ) )
            {
                while ( isdefined( level._id_7ED0 ) && level._id_7ED0 )
                    wait 0.05;

                maps\_helicopter_globals::fire_missile( var_8._id_7F04, 1, var_5, undefined );
            }
            else
                maps\_helicopter_globals::fire_missile( var_8._id_7F04, 1, var_5, undefined );

            wait(var_8.waittime);
        }

        var_0 = var_6.target;
        var_5 delete();
    }

    self clearlookatent();
}

_id_7F06( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 5;

    var_0 endon( "death" );

    for (;;)
    {
        var_2 = vectortoyaw( var_0.origin - self.origin );
        var_2 = angleclamp180( var_2 );
        var_3 = angleclamp180( self.angles[1] );
        var_4 = var_2 - var_3;

        if ( abs( var_4 ) < var_1 )
            return;

        wait 0.05;
    }
}

_id_7F07( var_0 )
{
    self endon( "death" );
    var_0 waittill( "new_missile_chain" );
    self delete();
}

_id_7F08()
{
    maps\hamburg_code::_id_7E84();
    level._id_45C0._id_251B = 2;
    maps\_utility::_id_2683( level._id_45C0 );
}

_id_7F09( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::_id_27C1( ::_id_7F0A, var_1, var_2 );
    var_3.time = var_0;
}

_id_7F0A( var_0, var_1, var_2 )
{
    var_3 = var_1 * ( 1 - var_0 ) + var_2 * var_0;
    setsaveddvar( "sm_sunsamplesizenear", var_3 );
}

_id_7F0B( var_0 )
{
    maps\_compass::setupminimap( "compass_map_hamburg", "city_minimap_corner" );

    if ( !isdefined( var_0 ) )
        var_0 = maps\hamburg_code::_id_7E82();

    var_1 = maps\_utility::_id_1BF9( var_0.target, "targetname" );
    var_2 = getent( "start_on_foot_guy", "targetname" );
    maps\_utility::_id_1FDF( var_0 );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( _id_7F0E( var_1[var_4] ) )
            continue;

        var_3[var_3.size] = var_1[var_4];
    }

    var_1 = var_3;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = var_2;

        if ( var_4 == 0 )
            var_5 = getent( "sandman_spawner", "targetname" );

        var_5.origin = maps\_utility::_id_2281( var_1[var_4].origin, 32 );

        if ( isdefined( var_1[var_4].angles ) )
            var_5.angles = var_1[var_4].angles;

        var_5 _id_7F0D( 1, var_1[var_4] );
        wait 0.05;
    }

    thread _id_7F0C( var_0 );
}

_id_7F0C( var_0 )
{
    waittillframeend;
    var_1 = getvehiclenodearray( var_0.target, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = undefined;

        switch ( var_3.script_noteworthy )
        {
            case "h":
                var_4 = level._id_7E1B;
                break;
            case "p":
                var_4 = level._id_7E04;
                break;
            case "g":
                var_4 = level._id_7E26;
                break;
            default:
                break;
        }

        var_4 thread maps\hamburg_code::_id_7E42( var_3.target, 1 );
    }
}

_id_7F0D( var_0, var_1 )
{
    self.count++;
    var_2 = maps\_utility::_id_166F( 1 );

    if ( isdefined( var_1._id_134B ) )
        var_2 maps\_utility::_id_13A4( var_1._id_134B );
}

_id_7F0E( var_0 )
{
    if ( !isdefined( var_0.script_noteworthy ) )
        return 0;

    if ( var_0.script_noteworthy != "heli_spawn_move_here" )
        return 0;

    var_1 = maps\_utility::_id_26A2( var_0.target );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_1.target = undefined;
    var_2 = maps\_vehicle::_id_211F( var_1 );
    return 1;
}

_id_7F0F()
{
    self waittill( "trigger" );
    var_0 = _id_7F02( self.target, self.script_noteworthy );
    var_0 vehicle_turnengineon();
    var_0 _id_7EF1();

    if ( isdefined( self ) )
        self delete();
}

_id_7F10()
{
    self waittill( "trigger" );
    var_0 = getaiarray( "allies" );
    level._id_7E1B._id_2941 = 0;
    level._id_7E04._id_2941 = 0;
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2712 );
    common_scripts\utility::array_thread( var_0, maps\_utility::delaythread, 25, maps\_utility::_id_2713 );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::delaycall, randomfloatrange( 0, 2 ), ::kill );
}

_id_7F11()
{
    self._id_2941 = 1;
}
