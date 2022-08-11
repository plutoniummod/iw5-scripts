// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_03EF()
{
    maps\_utility::_id_1E74( "train_crash_end", maps\london_west::_id_0539, "Start Ride - Post Crash", maps\london_west::_id_0486 );
    maps\_utility::_id_1E74( "west_station", maps\london_west::_id_0480, "Westminster Station", maps\london_west::_id_048A );
    maps\_utility::_id_1E74( "west_ending", maps\london_west::_id_0481, "Westminster", maps\london_west::_id_0491 );
    maps\_utility::_id_1E74( "west_ending_stairs", maps\london_west::_id_0482, "Westminster Stairs", maps\london_west::_id_0491 );
    maps\_utility::_id_1E74( "innocent", maps\innocent::_id_03F0, "innocent", maps\innocent::_id_03E9 );
}

_id_7949()
{
    thread _id_1479();
    thread _id_479C();
    thread _id_03F1();
}

_id_479C()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "west_station":
        case "train_crash_end":
            common_scripts\utility::flag_wait( "got_contact" );
            objective_add( maps\_utility::_id_2816( "clear_station" ), "current", &"LONDON_OBJECTIVE_CLEAR_STATION" );
            objective_onentity( maps\_utility::_id_2816( "clear_station" ), level._id_56DE );
            common_scripts\utility::flag_wait( "reached_station_exit" );
            objective_state( maps\_utility::_id_2816( "clear_station" ), "done" );
        case "west_ending":
        case "west_ending_stairs":
            common_scripts\utility::flag_wait( "setup_blockade" );
            var_0 = common_scripts\utility::getstruct( "ending_stackup_objective", "targetname" );
            objective_add( maps\_utility::_id_2816( "blockade" ), "current", &"LONDON_OBJECTIVE_SETUP_BLOCKADE", var_0.origin );
            common_scripts\utility::flag_wait( "ending_player_in_position" );
            objective_state( maps\_utility::_id_2816( "blockade" ), "done" );
        case "innocent":
            break;
        default:
    }
}

_id_03F1()
{
    maps\_utility::vision_set_fog_changes( "london_westminster_station", 0 );
    waittillframeend;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1451() )
        return;

    maps\_utility::vision_set_fog_changes( "london_westminster_station", 0 );

    if ( var_0 == "train_crash_end" )
        return;

    if ( var_0 == "west_station" )
        return;

    if ( var_0 == "west_ending" )
        return;

    maps\_utility::vision_set_fog_changes( "london_westminster", 0 );

    if ( var_0 == "west_ending_stairs" )
        return;

    if ( var_0 == "innocent" )
        return;
}

_id_1479()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "west_station":
        case "train_crash_end":
            common_scripts\utility::flag_wait( "start_train_traverse" );
            level notify( "stop_music" );
            musicstop( 3 );
            wait 3;
            common_scripts\utility::flag_wait( "start_station_music" );
            thread maps\_utility::_id_142B( "london_westminster_action1" );
        case "innocent":
        case "west_ending":
        case "west_ending_stairs":
            common_scripts\utility::flag_wait( "truck_explodes" );
            break;
        default:
    }
}
