// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "uk_police_estate", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2AD0( var_0, "vehicle_uk_police_estate" );
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

_id_3A9C( var_0 )
{
    var_0[0]._id_2523 = %london_police_car_exit_2_jog_b_doors;
    var_0[0]._id_2581 = "policeestate_door_open";
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];
    var_0[0] = spawnstruct();
    var_0[0]._id_24F2 = "tag_driver";
    var_0[0]._id_24F4 = 0;
    var_0[0]._id_0F59 = %london_police_drive_idle;
    var_0[0]._id_257C = %london_police_car_exit_2_jog_b;
    return var_0;
}
