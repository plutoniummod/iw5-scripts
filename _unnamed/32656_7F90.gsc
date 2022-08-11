// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "hovercraft", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_hovercraft" );
    maps\_vehicle::_id_2AC1( %hovercraft_movement, undefined, 0 );
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "allies" );
    level._effect["hovercraft_cheap_water"] = loadfx( "treadfx/hovercraft_cheap" );
}

_id_2B1D()
{
    self._id_2998 = 1;
    thread _id_7F8E();
}

_id_3A9C( var_0 )
{
    return var_0;
}

_id_7F8E()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.angles = ( 0, self.angles[1], 0 );
    var_0 thread _id_7F8F( self );
}

_id_7F8F( var_0 )
{
    self.origin = var_0 common_scripts\utility::tag_project( "tag_origin", -10000 );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "hovercraft_cheap_water" ), self, "tag_origin" );
    self notsolid();
    self hide();
    var_1 = ( 0, var_0.angles[1], 0 );

    while ( isalive( var_0 ) )
    {
        var_2 = var_0.origin;
        self moveto( var_0 gettagorigin( "tag_origin" ) + ( 0.0, 0.0, 16.0 ) + var_0 vehicle_getvelocity() / 0.645161, 1.5 );
        self rotateto( var_1, 1.5 );
        wait 1.55;
        waittillframeend;

        if ( isalive( var_0 ) )
        {
            var_3 = var_0.origin - var_2;
            var_1 = common_scripts\utility::flat_angle( vectortoangles( var_3 ) );
        }
    }

    self delete();
}
