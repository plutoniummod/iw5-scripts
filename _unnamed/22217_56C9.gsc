// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "forklift", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 32.0 ), 150, 200, 50, 0 );
    maps\_vehicle::_id_2AC1( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    maps\_vehicle::_id_29F8( 0.5, 0.5, 500 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "axis" );
    maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
}

_id_2B1D()
{

}

_id_3A9C( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 2; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_24F2 = "TAG_DRIVER";
    var_0[0]._id_0F59 = %uaz_driver_idle_drive;
    return var_0;
}
