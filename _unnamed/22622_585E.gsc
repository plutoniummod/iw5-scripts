// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.players;

    thread _id_5227( var_0, var_1 );
}

_id_5227( var_0, var_1 )
{
    var_1 = common_scripts\utility::ter_op( isdefined( var_1 ), var_1, 1 );
    precachenightvisioncodeassets();
    precacheshellshock( "nightvision" );
    level._id_5228 = loadfx( "misc/NV_dlight" );
    level._id_5229 = loadfx( "misc/ir_tapeReflect" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 maps\_utility::_id_1402( "nightvision_enabled" );
        var_3 maps\_utility::_id_1402( "nightvision_on" );
        var_3 maps\_utility::_id_13DC( "nightvision_enabled" );
        var_3 maps\_utility::_id_1402( "nightvision_dlight_enabled" );
        var_3 maps\_utility::_id_13DC( "nightvision_dlight_enabled" );
        var_3 maps\_utility::_id_13DE( "nightvision_dlight_enabled" );
        var_3 setactionslot( var_1, "nightvision" );
    }

    visionsetnight( "default_night" );
    waittillframeend;
    wait 0.05;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 thread _id_522A();
    }
}

_id_522A()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "night_vision_on" );
        _id_522D();
        self waittill( "night_vision_off" );
        _id_5232();
        wait 0.05;
    }
}

_id_522B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.player;

    return isdefined( var_0._id_522C );
}

_id_522D()
{
    self._id_522E = 1;
    wait 1.0;
    maps\_utility::_id_13DC( "nightvision_on" );
    self._id_522C = 1;
    var_0 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_0, ::_id_522F );

    if ( !maps\_utility::_id_26BC( "allies", ::_id_522F ) )
        maps\_utility::_id_1A5A( "allies", ::_id_522F );
}

_id_522F()
{
    if ( !isai( self ) )
        return;

    if ( isdefined( self._id_0CDE ) )
        return;

    animscripts\shared::_id_0CE0();
    thread _id_5230();
}

_id_5230()
{
    level endon( "night_vision_off" );
    self endon( "death" );

    for (;;)
    {
        playfxontag( level._id_5229, self, "tag_reflector_arm_le" );
        playfxontag( level._id_5229, self, "tag_reflector_arm_ri" );
        wait 0.1;
    }
}

_id_5231()
{
    if ( isdefined( self._id_0CDE ) )
        return;

    stopfxontag( level._id_5229, self, "tag_reflector_arm_le" );
    stopfxontag( level._id_5229, self, "tag_reflector_arm_ri" );
}

_id_5232()
{
    self._id_522E = undefined;
    wait 0.4;
    level notify( "night_vision_off" );

    if ( isdefined( level._id_5233 ) )
        level._id_5233 delete();

    self notify( "nightvision_shellshock_off" );
    maps\_utility::_id_13DE( "nightvision_on" );
    self._id_522C = undefined;
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( _id_522B( level.players[var_1] ) )
            var_0 = 1;
    }

    if ( !var_0 )
        maps\_utility::_id_26BB( "allies", ::_id_522F );

    thread _id_5234();
}

_id_5234()
{
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_5235 = undefined;
        var_2 animscripts\shared::_id_0CE0();
        var_2 _id_5231();
    }
}

_id_5236()
{
    return isdefined( self._id_522E );
}

_id_5237()
{
    return !isdefined( self._id_522E );
}
