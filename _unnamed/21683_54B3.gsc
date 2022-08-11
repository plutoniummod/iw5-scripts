// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    _id_54AA::_id_54A7( var_0, var_1, var_2, "weapon_m2_50cal_center", "50cal_turret_technical" );
    _id_54AA::_id_54A8();
    _id_54AB( var_2 );
}

_id_54AB( var_0 )
{
    maps\_vehicle::_id_2ABE( "vehicle_pickup_technical_pb_rusted", "vehicle_pickup_technical_pb_destroyed", 1, var_0 );
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm_nolight_15sec", "tag_fx_tank", "smallfire", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_2A02( "explosions/ammo_cookoff", "tag_fx_bed", undefined, undefined, undefined, undefined, 0.5 );
    maps\_vehicle::_id_2A02( "explosions/Vehicle_Explosion_Pickuptruck", "tag_deathfx", "car_explode", undefined, undefined, undefined, 0.9 );
    maps\_vehicle::_id_2A02( "fire/firelp_small_pm_a_15sec", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 1 );
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm_nolight_15sec", "tag_fx_cab", "fire_metal_medium", undefined, undefined, 1, 1.01 );
    maps\_vehicle::_id_2A02( "fire/firelp_small_pm_a_15sec", "tag_engine_left", "smallfire", undefined, undefined, 1, 1.01 );
    maps\_vehicle::_id_2AEA( 0.5, 3, 512, 700, "axis", "allies" );
    maps\_vehicle::_id_2AEB( 0.9 );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 53.0 ), 512, 300, 20, 1, 0.9 );
}
