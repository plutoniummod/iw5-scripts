// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "uk_utility_truck", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2AD0( var_0, "vehicle_uk_truck" );
    maps\_vehicle::_id_2A02( "explosions/large_vehicle_explosion", undefined, "car_explode_utility_truck", undefined, undefined, undefined, 0 );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 32.0 ), 300, 200, 100, 0 );
    maps\_vehicle::_id_2AC1( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    maps\_vehicle::_id_29F8( 1, 1.6, 500 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "axis" );
    var_3 = maps\_vehicle::_id_2B1A( var_0, var_2 );
    maps\_vehicle::_id_2AAD( var_3, "headlight_truck_left", "tag_headlight_left", "misc/uk_utility_truck_headlight", "headlights" );
    maps\_vehicle::_id_2AAD( var_3, "headlight_truck_right", "tag_headlight_right", "misc/uk_utility_truck_headlight", "headlights" );
    maps\_vehicle::_id_2AAD( var_3, "taillight_truck_right", "TAG_TAIL_LIGHT_RIGHT", "misc/car_taillight_bm21", "headlights" );
    maps\_vehicle::_id_2AAD( var_3, "taillight_truck_left", "TAG_TAIL_LIGHT_LEFT", "misc/car_taillight_bm21", "headlights" );
    maps\_vehicle::_id_2AAD( var_3, "brakelight_troops_right", "TAG_TAIL_LIGHT_RIGHT", "misc/car_taillight_bm21", "brakelights" );
    maps\_vehicle::_id_2AAD( var_3, "brakelight_troops_left", "TAG_TAIL_LIGHT_LEFT", "misc/car_taillight_bm21", "brakelights" );
    var_4 = ::_id_3A9D;
    maps\_vehicle::_id_2ACA( var_4, ::_id_3A9C );
    maps\_vehicle::_id_2ABD( "script_vehicle_uk_utility_truck_no_rail", [ "TAG_RAIL" ] );
    maps\_vehicle::_id_2ABD( "script_vehicle_uk_utility_truck_no_rail_player", [ "TAG_RAIL" ] );
}

_id_2B1D()
{

}

_id_3E58()
{
    var_0 = [];
    var_1 = "passengers";
    var_0[var_1] = [];
    var_0[var_1][var_0[var_1].size] = 1;
    var_1 = "all";
    var_0[var_1] = [];
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0["default"] = var_0["all"];
    return var_0;
}

_id_3A9C( var_0 )
{
    var_0[0]._id_2523 = %uaz_passenger_exit_into_stand_door;
    var_0[1]._id_2523 = %uaz_driver_exit_into_stand_door;
    var_0[0]._id_257F = 0;
    var_0[1]._id_257F = 0;
    var_0[0]._id_2522 = %london_utilitytruck_driver_mount_door;
    var_0[1]._id_2522 = %london_utilitytruck_passenger_mount_door;
    var_0[0]._id_2581 = "uk_utility_door_open";
    var_0[1]._id_2581 = "uk_utility_door_open";
    var_0[0]._id_2527 = "uk_utility_door_close";
    var_0[1]._id_2527 = "uk_utility_door_close";
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 3; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_24F2 = "tag_driver";
    var_0[1]._id_24F2 = "tag_passenger";
    var_0[2]._id_24F2 = "tag_gunner";
    var_0[0]._id_0F59[0] = %london_utilitytruck_driver_idle;
    var_0[0]._id_0F59[1] = %london_utilitytruck_driver_idle_bumpy;
    var_0[0]._id_0F59[2] = %london_utilitytruck_driver_flinch;
    var_0[0]._id_0F59[3] = %london_utilitytruck_driver_quickturnl;
    var_0[0]._id_0F59[4] = %london_utilitytruck_driver_quickturnr;
    var_0[0]._id_254D[0] = 450;
    var_0[0]._id_254D[1] = 100;
    var_0[0]._id_254D[2] = 100;
    var_0[0]._id_254D[3] = 100;
    var_0[0]._id_254D[4] = 100;
    var_0[1]._id_0F59[0] = %london_utilitytruck_passenger_idle_bumpy;
    var_0[1]._id_0F59[1] = %london_utilitytruck_passenger_idle_bumpy;
    var_0[1]._id_254D[0] = 100;
    var_0[1]._id_254D[1] = 100;
    var_0[0]._id_2519 = %london_utilitytruck_driver_mount;
    var_0[1]._id_2519 = %london_utilitytruck_passenger_mount;
    var_0[2]._id_2519 = %london_utilitytruck_gunner_mount;
    var_0[0]._id_257C = %uaz_passenger_exit_into_stand;
    var_0[1]._id_257C = %uaz_driver_exit_into_stand;
    var_0[0]._id_1048 = %uaz_driver_death;
    var_0[1]._id_1048 = %uaz_rear_driver_death;
    var_0[0]._id_24F1 = 1;
    var_0[1]._id_24F1 = 1;
    return var_0;
}
