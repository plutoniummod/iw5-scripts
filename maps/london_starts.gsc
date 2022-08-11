// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::_id_1E74( "start_of_level" );
    maps\_utility::_id_1E74( "post_intro" );
    maps\_utility::_id_1E74( "2nd_alley" );
    maps\_utility::_id_1E74( "warehouse_breach" );
    maps\_utility::_id_1E74( "warehouse_hallway" );
    maps\_utility::_id_1E74( "docks_assault" );
    maps\_utility::_id_1E74( "docks_assault_ambush" );
    maps\_utility::_id_1E74( "docks_assault_streets" );
    maps\_utility::_id_1E74( "train_start" );
    maps\_utility::_id_1E74( "train_start_ride" );
    maps\_utility::_id_1E74( "train_start_first_bend" );
    maps\_utility::_id_1E74( "train_start_civilian_fly_by" );
    maps\_utility::_id_1E74( "train_start_outside" );
    maps\_utility::_id_1E74( "train_start_ghost_station" );
    maps\_utility::_id_1E74( "train_crash_end" );
    maps\_utility::_id_1E74( "west_station" );
    maps\_utility::_id_1E74( "west_ending" );
    maps\_utility::_id_1E74( "west_ending_stairs" );
    maps\_utility::_id_1E74( "west_ending_explosion" );
}

_id_7949()
{
    thread _id_794C();
    thread _id_794D();
    thread _id_794E();
    thread _id_794B();
    thread _id_794A();
    thread _id_794F();
}

_id_794A()
{
    maps\_utility::_id_2822( "westminster_tunnels_fx_volume" );
    maps\_utility::_id_2822( "westminster_tunnels_crash_fx_volume" );
    waittillframeend;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1451() )
        return;

    if ( var_0 == "start_of_level" )
        return;

    if ( var_0 == "post_intro" )
        return;

    if ( var_0 == "2nd_alley" )
        return;

    if ( var_0 == "warehouse_breach" )
        return;

    if ( var_0 == "warehouse_hallway" )
        return;

    if ( var_0 == "docks_assault" )
        return;

    if ( var_0 == "docks_assault_ambush" )
        return;

    var_1 = getentarray( "london_docks_warehouse_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_1 );
    maps\_utility::_id_27DF( var_1 );
    maps\_utility::_id_27E0( var_1 );
    maps\_utility::_id_2822( "london_docks_warehouse_volume" );

    if ( var_0 == "docks_assault_streets" )
        return;

    if ( var_0 == "train_start" )
        return;

    var_2 = getentarray( "london_docks_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_2 );
    maps\_utility::_id_27DF( var_2 );
    maps\_utility::_id_27E0( var_2 );
    maps\_utility::_id_2822( "london_docks_fx_volume" );
    maps\_utility::_id_2826( "westminster_tunnels_fx_volume" );
    maps\_utility::_id_2826( "westminster_tunnels_crash_fx_volume" );

    if ( var_0 == "train_start_ride" )
        return;

    if ( var_0 == "train_start_first_bend" )
        return;

    if ( var_0 == "train_start_civilian_fly_by" )
        return;

    if ( var_0 == "train_start_outside" )
        return;

    if ( var_0 == "train_start_ghost_station" )
        return;

    var_3 = getentarray( "westminster_tunnels_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_3 );
    maps\_utility::_id_27DF( var_3 );
    maps\_utility::_id_27E0( var_3 );
    var_4 = getentarray( "westminster_tunnels_crash_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_4 );
    maps\_utility::_id_27DF( var_4 );
    maps\_utility::_id_27E0( var_4 );
    maps\_utility::_id_2822( "westminster_tunnels_fx_volume" );
    maps\_utility::_id_2822( "westminster_tunnels_crash_fx_volume" );

    if ( var_0 == "train_crash_end" )
        return;

    if ( var_0 == "west_station" )
        return;

    if ( var_0 == "west_ending" )
        return;

    if ( var_0 == "west_ending_stairs" )
        return;

    if ( var_0 == "west_ending_explosion" )
        return;
}

_id_794B()
{
    waittillframeend;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1451() )
        return;

    if ( var_0 == "start_of_level" )
        return;

    common_scripts\utility::flag_set( "start_fence_climb" );
    common_scripts\utility::flag_set( "alley_start" );
    common_scripts\utility::flag_set( "uav_focusing_on_player" );
    common_scripts\utility::flag_set( "uav_slamzoom" );
    common_scripts\utility::flag_set( "uav_slamzoom_done" );

    if ( var_0 == "post_intro" )
        return;

    common_scripts\utility::flag_set( "alley_spawn_enemy_cellphone" );

    if ( var_0 == "2nd_alley" )
        return;

    if ( var_0 == "warehouse_breach" )
        return;

    common_scripts\utility::flag_set( "london_warehouse_door_kicked" );
    common_scripts\utility::flag_set( "warehouse_first_hallway" );

    if ( var_0 == "warehouse_hallway" )
        return;

    if ( var_0 == "docks_assault" )
        return;

    common_scripts\utility::flag_set( "warehouse_complete" );
    common_scripts\utility::flag_set( "warehouse_top" );
    common_scripts\utility::flag_set( "warehouse_exit" );
    common_scripts\utility::flag_set( "docks_entrance" );

    if ( var_0 == "docks_assault_ambush" )
        return;

    common_scripts\utility::flag_set( "docks_truck_door_opened" );
    common_scripts\utility::flag_set( "docks_truck_searched" );
    common_scripts\utility::flag_set( "docks_ambush" );
    common_scripts\utility::flag_set( "docks_almost_to_street" );
    common_scripts\utility::flag_set( "docks_littlebird_strafe" );

    if ( var_0 == "docks_assault_streets" )
        return;

    common_scripts\utility::flag_set( "start_train_encounter" );

    if ( var_0 == "train_start" )
        return;

    common_scripts\utility::flag_set( "ride_without_wait" );
    common_scripts\utility::flag_set( "player_mounts_car" );
    common_scripts\utility::flag_set( "train_goes" );
    common_scripts\utility::flag_set( "player_mount_car_complete" );

    if ( var_0 == "train_start_ride" )
        return;

    common_scripts\utility::flag_set( "riding_train_already" );

    if ( var_0 == "train_start_first_bend" )
        return;

    if ( var_0 == "train_start_civilian_fly_by" )
        return;

    if ( var_0 == "train_start_outside" )
        return;

    if ( var_0 == "train_start_ghost_station" )
        return;

    if ( var_0 == "train_crash_end" )
        return;

    if ( var_0 == "west_station" )
        return;

    if ( var_0 == "west_ending" )
        return;

    if ( var_0 == "west_ending_stairs" )
        return;

    if ( var_0 == "west_ending_explosion" )
        return;
}

_id_794C()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "start_of_level":
        case "post_intro":
        case "2nd_alley":
            var_0 = common_scripts\utility::getstruct( "objective_stack_up", "targetname" );
            objective_add( maps\_utility::_id_2816( "alley_stack_up" ), "current", &"LONDON_OBJECTIVE_STACK_UP" );
        case "warehouse_breach":
            common_scripts\utility::flag_wait( "london_warehouse_door_kicked" );
            maps\_utility::_id_2727( maps\_utility::_id_2816( "alley_stack_up" ) );
            var_0 = common_scripts\utility::getstruct( "objective_clear_warehouse", "targetname" );
            objective_add( maps\_utility::_id_2816( "docks_clear_warehouse" ), "current", &"LONDON_OBJECTIVE_CLEAR_WAREHOUSE" );
        case "warehouse_hallway":
        case "docks_assault":
            common_scripts\utility::flag_wait( "warehouse_top" );
            maps\_utility::_id_2727( maps\_utility::_id_2816( "docks_clear_warehouse" ) );
            common_scripts\utility::flag_wait( "warehouse_exit" );
            var_0 = common_scripts\utility::getstruct( "objective_docks_assault", "targetname" );
            objective_add( maps\_utility::_id_2816( "docks_assault" ), "current", &"LONDON_OBJECTIVE_ASSAULT_DOCKS" );
            common_scripts\utility::flag_wait( "docks_entrance" );
        case "docks_assault_ambush":
            common_scripts\utility::flag_wait( "docks_open_truck_door" );
            objective_state( maps\_utility::_id_2816( "docks_assault" ), "done" );
            var_0 = common_scripts\utility::getstruct( "objective_docks_truck", "targetname" );
            objective_add( maps\_utility::_id_2816( "docks_open_truck" ), "current", &"LONDON_OBJECTIVE_TRUCK_DOOR", var_0.origin );
            common_scripts\utility::flag_wait( "docks_truck_door_opened" );
            objective_state( maps\_utility::_id_2816( "docks_open_truck" ), "done" );
            common_scripts\utility::flag_wait( "docks_ambush" );
        case "docks_assault_streets":
            var_0 = common_scripts\utility::getstruct( "objective_chase_hostiles", "targetname" );
            objective_add( maps\_utility::_id_2816( "chase_hostiles" ), "current", &"LONDON_OBJECTIVE_CHASE_HOSTILES" );
        case "train_start":
            common_scripts\utility::flag_wait( "transition_to_train" );
        case "train_start_ride":
            common_scripts\utility::flag_wait_either( "last_guy_running_to_train", "train_goes" );
            var_1 = getent( "truck_load_use_trigger", "targetname" );
            objective_state( maps\_utility::_id_2816( "train_chase" ), "empty" );
            objective_add( maps\_utility::_id_2816( "get_in_truck" ), "current", &"LONDON_OBJECTIVE_TRAIN_TAILGATE", var_1 getorigin() );
            objective_position( maps\_utility::_id_2816( "get_in_truck" ), var_1 getorigin() );
            common_scripts\utility::flag_wait( "player_mount_car_complete" );
            objective_state( maps\_utility::_id_2816( "get_in_truck" ), "done" );
        case "train_start_first_bend":
        case "train_start_civilian_fly_by":
        case "train_start_outside":
        case "train_start_ghost_station":
            objective_add( maps\_utility::_id_2816( "stop_the_train" ), "current", &"LONDON_OBJECTIVE_TRAIN_STOP_TRAIN" );
            common_scripts\utility::flag_wait( "train_crashed" );
            objective_state( maps\_utility::_id_2816( "stop_the_train" ), "done" );
        case "train_crash_end":
        case "west_station":
            common_scripts\utility::flag_wait( "start_train_traverse" );
            common_scripts\utility::flag_wait( "start_lower_station" );
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
        case "west_ending_explosion":
            break;
        default:
    }
}

_id_794D()
{
    waittillframeend;

    switch ( level._id_1F19 )
    {
        case "default":
        case "start_of_level":
        case "post_intro":
        case "2nd_alley":
        case "warehouse_breach":
            maps\_utility::_id_142B( "london_uav", 0 );
            common_scripts\utility::flag_wait( "london_warehouse_door_kicked" );
            maps\_utility::_id_142B( "london_warehouse" );
        case "warehouse_hallway":
        case "docks_assault_ambush":
        case "docks_assault_streets":
        case "docks_assault":
            common_scripts\utility::flag_wait( "docks_littlebird_strafe" );
            thread maps\_utility::_id_1428( "london_battle_loop" );
        case "train_start":
        case "train_start_ride":
            common_scripts\utility::flag_wait( "train_goes" );
        case "train_start_first_bend":
            thread maps\_utility::_id_1428( "london_train_chase_music" );
        case "train_start_civilian_fly_by":
        case "train_start_outside":
        case "train_start_ghost_station":
        case "train_crash_end":
        case "west_station":
            common_scripts\utility::flag_wait( "start_train_traverse" );
            level notify( "stop_music" );
            musicstop( 3 );
        case "west_ending":
        case "west_ending_stairs":
        case "west_ending_explosion":
            break;
        default:
    }
}

_id_794E()
{
    maps\_utility::vision_set_fog_changes( "london_docks", 0 );
    waittillframeend;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1451() )
        return;

    if ( var_0 == "start_of_level" )
        return;

    if ( var_0 == "post_intro" )
        return;

    if ( var_0 == "2nd_alley" )
        return;

    if ( var_0 == "warehouse_breach" )
        return;

    if ( var_0 == "warehouse_hallway" )
        return;

    if ( var_0 == "docks_assault" )
        return;

    if ( var_0 == "docks_assault_ambush" )
        return;

    maps\_utility::vision_set_fog_changes( "london_construction_street", 20 );

    if ( var_0 == "docks_assault_streets" )
        return;

    if ( var_0 == "train_start" )
        return;

    maps\_utility::vision_set_fog_changes( "westminster_tunnel", 0 );

    if ( var_0 == "train_start_ride" )
        return;

    maps\_utility::vision_set_fog_changes( "westminster_tunnel", 0 );

    if ( var_0 == "train_start_first_bend" )
        return;

    maps\_utility::vision_set_fog_changes( "westminster_tunnel", 0 );

    if ( var_0 == "train_start_civilian_fly_by" )
        return;

    maps\_utility::vision_set_fog_changes( "westminster_tunnel_outside", 0 );

    if ( var_0 == "train_start_outside" )
        return;

    maps\_utility::vision_set_fog_changes( "westminster_tunnel", 0 );

    if ( var_0 == "train_start_ghost_station" )
        return;

    maps\_utility::vision_set_fog_changes( "london_westminster_station", 0 );

    if ( var_0 == "train_crash_end" )
        return;

    if ( var_0 == "west_station" )
        return;

    if ( var_0 == "west_ending" )
        return;

    if ( var_0 == "west_ending_stairs" )
        return;

    maps\_utility::vision_set_fog_changes( "london_westminster", 0 );

    if ( var_0 == "west_ending_explosion" )
        return;
}

_id_794F()
{
    waittillframeend;
    var_0 = level._id_1F19;

    if ( maps\_utility::_id_1451() )
        return;

    if ( var_0 == "start_of_level" )
        return;

    if ( var_0 == "post_intro" )
        return;

    if ( var_0 == "2nd_alley" )
        return;

    if ( var_0 == "warehouse_breach" )
        return;

    if ( var_0 == "warehouse_hallway" )
        return;

    if ( var_0 == "docks_assault" )
        return;

    if ( var_0 == "docks_assault_ambush" )
        return;

    if ( var_0 == "docks_assault_streets" )
        return;

    var_1 = getent( "westminster_tunnels_fx_volume", "script_noteworthy" );
    var_1 maps\_utility::_id_27E1();
    var_1 maps\_utility::_id_27DA();
    var_1 maps\_utility::_id_27DD();
    var_2 = getent( "westminster_tunnels_crash_fx_volume", "script_noteworthy" );
    var_2 maps\_utility::_id_27E1();
    var_2 maps\_utility::_id_27DA();
    var_2 maps\_utility::_id_27DD();

    if ( var_0 == "train_start" )
        return;

    if ( var_0 == "train_start_ride" )
        return;

    if ( var_0 == "train_start_first_bend" )
        return;

    if ( var_0 == "train_start_civilian_fly_by" )
        return;

    if ( var_0 == "train_start_outside" )
        return;

    if ( var_0 == "train_start_ghost_station" )
        return;

    if ( var_0 == "train_crash_end" )
        return;

    if ( var_0 == "west_station" )
        return;

    if ( var_0 == "west_ending" )
        return;

    if ( var_0 == "west_ending_stairs" )
        return;

    if ( var_0 == "west_ending_explosion" )
        return;
}
