// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "t72", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_t72_tank", "vehicle_t72_tank_d_body", 3.7 );
    maps\_vehicle::_id_2ABE( "vehicle_t72_tank_low", "vehicle_t72_tank_d_body", 3.7 );
    maps\_vehicle::_id_2ABE( "vehicle_t72_tank_woodland", "vehicle_t72_tank_d_woodland_body", 3.7 );
    maps\_vehicle::_id_2ABE( "vehicle_t72_tank_woodland_low", "vehicle_t72_tank_d_woodland_body", 3.7 );
    maps\_vehicle::_id_2ABF( "tankblast" );
    maps\_vehicle::_id_2AC1( %abrams_movement, %abrams_movement_backwards, 10 );
    maps\_vehicle::_id_2A02( "explosions/vehicle_explosion_t72", "tag_deathfx", "exp_armor_vehicle", undefined, undefined, undefined, 0 );
    maps\_vehicle::_id_2A02( "fire/firelp_large_pm", "tag_deathfx", "fire_metal_medium", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_2A4A( "t72_turret2", "tag_turret2", "vehicle_t72_tank_pkt_coaxial_mg" );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_29F5( "tank_rumble", 0.15, 4.5, 600, 1, 1 );
    maps\_vehicle::_id_2AC6( "allies" );
    maps\_vehicle::_id_2AC7();
    maps\_vehicle::_id_2ACB( 0.33 );
}

_id_2B1D()
{

}

_id_3A9C( var_0 )
{
    return var_0;
}

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 11; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_259B = 1;
    return var_0;
}
