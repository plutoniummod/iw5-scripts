// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "coupe", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2AD0( "vehicle_coupe_gold_destructible", "vehicle_coupe_gold" );
    maps\_vehicle::_id_2AD0( "vehicle_coupe_gray_destructible", "vehicle_coupe_gray" );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 32.0 ), 300, 200, 100, 0 );
    maps\_vehicle::_id_2AC1( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    maps\_vehicle::_id_29F8( 1, 1.6, 500 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "allies" );
    maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
}

_id_2B1D()
{

}

_id_3A9C( var_0 )
{
    var_0[0]._id_2523 = %uaz_driver_exit_into_stand_door;
    var_0[1]._id_2523 = %uaz_passenger_exit_into_stand_door;
    var_0[0]._id_257F = 0;
    var_0[1]._id_257F = 0;
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 2; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_24F2 = "tag_driver";
    var_0[0]._id_0F59 = %luxurysedan_driver_idle;
    var_0[0]._id_1048 = %luxurysedan_driver_idle;
    var_0[1]._id_24F2 = "tag_passenger";
    var_0[1]._id_0F59 = %uaz_passenger_idle_drive;
    var_0[1]._id_1048 = %uaz_passenger_idle_drive;
    var_0[0]._id_257C = %humvee_passenger_out_l;
    var_0[1]._id_257C = %humvee_passenger_out_r;
    return var_0;
}
