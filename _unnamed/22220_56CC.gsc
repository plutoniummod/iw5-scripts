// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "uk_delivery_truck", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( var_0, "vehicle_uk_delivery_truck_destroyed" );
    maps\_vehicle::_id_2A02( "explosions/large_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0 );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 32.0 ), 300, 200, 100, 0 );
    maps\_vehicle::_id_2AC1( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    maps\_vehicle::_id_29F8( 1, 1.6, 500 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "axis" );
    var_3 = ::_id_3A9D;
    maps\_vehicle::_id_2ACA( var_3, ::_id_3A9C );
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
    var_0[0]._id_2523 = %uaz_driver_exit_into_run_door;
    var_0[0]._id_257F = 0;
    var_0[1]._id_2523 = %innocent_truck_exit_passenger_fwd_truck;
    var_0[1]._id_257F = 0;
    var_0[0]._id_2522 = %humvee_mount_frontl_door;
    var_0[1]._id_2522 = %humvee_mount_frontr_door;
    var_0[0]._id_2581 = "ukdelivery_door_open";
    var_0[1]._id_2581 = "ukdelivery_door_open";
    var_0[0]._id_2527 = "ukdelivery_door_close";
    var_0[1]._id_2527 = "ukdelivery_door_close";
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 4; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_24F2 = "tag_driver";
    var_0[1]._id_24F2 = "tag_passenger";
    var_0[0]._id_24F4 = 0;
    var_0[0]._id_0F59 = %technical_driver_idle;
    var_0[1]._id_0F59 = %technical_passenger_idle;
    var_0[0]._id_257C = %pickup_passenger_climb_out;
    var_0[1]._id_257C = %innocent_truck_exit_passenger_fwd;
    var_0[0]._id_2519 = %pickup_driver_climb_in;
    var_0[1]._id_2519 = %pickup_passenger_climb_in;
    return var_0;
}
