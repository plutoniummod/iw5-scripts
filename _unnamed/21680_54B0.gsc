// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    _id_54A5::_id_54A3( var_0, var_1, var_2 );
    _id_54A6( var_2 );
    maps\_vehicle::_id_2ACE( 2750, 2500, 3000 );
}

_id_54A6( var_0 )
{
    maps\_vehicle::_id_2ABE( "vehicle_pickup_roobars", "vehicle_pickup_roobars_destroyed", 0.1, var_0 );
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm_nolight", "tag_body", "smallfire", undefined, undefined, 1, 0, 1 );
    maps\_vehicle::_id_2A02( "explosions/small_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0.1, 1 );
    maps\_vehicle::_id_2A02( "fire/firelp_small_pm_a", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0.1, 1 );
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm_nolight", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_2A02( "fire/firelp_small_pm_a", "tag_engine_left", "smallfire", undefined, undefined, 1, 0.11, 1 );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 32.0 ), 200, 150, 0, 0, 2 );
}
