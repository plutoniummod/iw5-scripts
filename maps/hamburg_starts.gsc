// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::_id_1E74( "ride_in" );
    maps\_utility::_id_1E74( "beach_landing" );
    maps\_utility::_id_1E74( "hot_buildings" );
    maps\_utility::_id_1E74( "tank_path_pre_bridge" );
    maps\_utility::_id_1E74( "tank_path_bridge" );
    maps\_utility::_id_1E74( "tank_path_blackout" );
    maps\_utility::_id_1E74( "hamburg_garage" );
    maps\_utility::_id_1E74( "hamburg_garage_post_entrance" );
    maps\_utility::_id_1E74( "hamburg_garage_pre_ramp" );
    maps\_utility::_id_1E74( "hamburg_garage_ramp" );
    maps\_utility::_id_1E74( "hamburg_end_ramp" );
    maps\_utility::_id_1E74( "hamburg_end_street" );
    maps\_utility::_id_1E74( "hamburg_end_streetcorner" );
    maps\_utility::_id_1E74( "hamburg_end_nest" );
    maps\_utility::_id_1E74( "hamburg_end_ambush" );
    maps\_utility::_id_1E74( "hamburg_end" );
    maps\_utility::_id_1E74( "next_level" );
}

_id_7949()
{
    thread _id_7E12();
    thread _id_7E16();
    thread _id_7E0F();
    thread _id_794C();
}

_id_794C()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "ride_in":
        case "beach_landing":
        case "hot_buildings":
        case "tank_path_pre_bridge":
            common_scripts\utility::flag_wait( "player_unloaded" );
            objective_add( maps\_utility::_id_2816( "scout_for_tanks" ), "current", &"HAMBURG_CLEAR_THE_WAY_FOR_TANKS", level._id_45C0.origin );
            objective_onentity( maps\_utility::_id_2816( "scout_for_tanks" ), level._id_45C0 );
        case "hamburg_garage":
        case "hamburg_garage_ramp":
        case "tank_path_bridge":
        case "tank_path_blackout":
        case "hamburg_garage_post_entrance":
        case "hamburg_garage_pre_ramp":
        case "hamburg_end_ramp":
        case "hamburg_end_street":
        case "hamburg_end_streetcorner":
        case "hamburg_end_nest":
        case "hamburg_end_ambush":
        case "hamburg_end":
        case "next_level":
            break;
        default:
    }
}

_id_7E0F()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "ride_in":
        case "beach_landing":
        case "hot_buildings":
            common_scripts\utility::flag_wait( "player_ready_for_hot_buildings" );
        case "tank_path_bridge":
        case "tank_path_pre_bridge":
        case "tank_path_blackout":
            maps\hamburg_code::_id_7E10( "bridge_and_before_garage_area" );
            common_scripts\utility::flag_wait( "player_ready_for_parking_lot" );
            maps\hamburg_code::_id_7E10( "parking_lot_area" );
        case "hamburg_garage":
        case "hamburg_garage_ramp":
        case "hamburg_garage_post_entrance":
        case "hamburg_garage_pre_ramp":
        case "hamburg_end_ramp":
        case "hamburg_end_street":
        case "hamburg_end_streetcorner":
        case "hamburg_end_nest":
        case "hamburg_end_ambush":
        case "hamburg_end":
            common_scripts\utility::flag_wait( "tank_path_bridge" );
            maps\hamburg_code::_id_7E10( "garage_area" );
            common_scripts\utility::flag_wait( "tank_crash_exit" );
            maps\_utility::_id_26BB( "allies", maps\hamburg_code::_id_7E11 );
            maps\hamburg_code::_id_7E10( "hamburg_b_area" );
        case "next_level":
            break;
        default:
    }
}

_id_7E12()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "ride_in":
            thread maps\_utility::_id_1428( "hamburg_intro" );
        case "beach_landing":
            thread maps\hamburg_code::_id_7E13();
        case "hot_buildings":
            thread maps\hamburg_code::_id_7E14();
        case "tank_path_bridge":
        case "tank_path_pre_bridge":
            common_scripts\utility::flag_wait( "player_ready_for_hot_buildings" );
            maps\hamburg_code::_id_7E15();
        case "hamburg_garage":
        case "hamburg_garage_ramp":
        case "tank_path_blackout":
        case "hamburg_garage_post_entrance":
        case "hamburg_garage_pre_ramp":
        case "hamburg_end_ramp":
        case "hamburg_end_street":
        case "hamburg_end_streetcorner":
        case "hamburg_end_nest":
        case "hamburg_end_ambush":
        case "hamburg_end":
        case "next_level":
            break;
        default:
    }
}

_id_7E16()
{
    waittillframeend;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1451() )
        return;

    if ( var_0 == "ride_in" )
        return;

    common_scripts\utility::flag_set( "player_unloaded" );
    maps\_utility::_id_194E( "hamburg_beach" );
    common_scripts\utility::flag_set( "pause_sentry_turrets" );

    if ( var_0 == "beach_landing" )
        return;

    common_scripts\utility::flag_set( "glory_tank_ready_for_death" );

    if ( var_0 == "hot_buildings" )
        return;

    maps\_utility::_id_194E( "hamburg_tankgun_city" );

    if ( var_0 == "tank_path_pre_bridge" )
        return;

    common_scripts\utility::flag_set( "player_ready_for_parking_lot" );

    if ( var_0 == "tank_path_bridge" )
        return;

    common_scripts\utility::flag_set( "tank_path_bridge" );
    maps\_utility::_id_135B( getentarray( "no_mans_land", "targetname" ) );
    maps\hamburg_code::_id_7E17();
    maps\_utility::_id_135B( getentarray( "bridge_spawn_triggers", "targetname" ) );

    if ( var_0 == "tank_path_blackout" )
        return;

    common_scripts\utility::flag_set( "tank_path_before_garage" );
    maps\_utility::_id_194E( "hamburg_tankgun_garage" );

    if ( var_0 == "hamburg_garage" )
        return;

    common_scripts\utility::flag_set( "in_garage" );
    common_scripts\utility::flag_set( "start_garage_section" );

    if ( var_0 == "hamburg_garage_post_entrance" )
        return;

    if ( var_0 == "hamburg_garage_pre_ramp" )
        return;

    if ( var_0 == "hamburg_garage_ramp" )
        return;

    common_scripts\utility::flag_set( "tank_crash_exit" );

    if ( var_0 == "hamburg_end_ramp" )
        return;

    if ( var_0 == "hamburg_end_street" )
        return;

    if ( var_0 == "hamburg_end_streetcorner" )
        return;

    if ( var_0 == "hamburg_end_nest" )
        return;

    if ( var_0 == "hamburg_end_ambush" )
        return;

    if ( var_0 == "hamburg_end" )
        return;

    if ( var_0 == "next_level" )
        return;
}
