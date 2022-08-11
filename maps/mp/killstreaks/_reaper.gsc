// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "c130", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_ac130_low" );
    maps\_vehicle::_id_2A02( "explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "allies" );
    maps\_vehicle::_id_2AC7();
    var_3 = maps\_vehicle::_id_2B1A( var_0, var_2 );
    maps\_vehicle::_id_2AAD( var_3, "wingtip_green", "tag_light_L_wing", "misc/aircraft_light_wingtip_green", "running", 0.0 );
    maps\_vehicle::_id_2AAD( var_3, "wingtip_red", "tag_light_R_wing", "misc/aircraft_light_wingtip_red", "running", 0.05 );
    maps\_vehicle::_id_2AAD( var_3, "tail_red", "tag_light_tail", "misc/aircraft_light_white_blink", "running", 0.05 );
    maps\_vehicle::_id_2AAD( var_3, "white_blink", "tag_light_belly", "misc/aircraft_light_red_blink", "running", 1.0 );
}

_id_2B1D()
{
    maps\_vehicle::_id_2AB3( "running" );
    self hidepart( "tag_25mm" );
    self hidepart( "tag_40mm" );
    self hidepart( "tag_105mm" );
}

_id_3A9C( var_0 )
{
    return var_0;
}

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 1; var_1++ )
        var_0[var_1] = spawnstruct();

    return var_0;
}
