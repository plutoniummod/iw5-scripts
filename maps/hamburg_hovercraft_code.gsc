// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

_id_7EBA( var_0, var_1 )
{
    var_2 = var_0 maps\_vehicle::_id_2A8D();
    var_3 = var_1 maps\_vehicle::_id_2A8D();
    var_0._id_2A1F = 6;
    var_1._id_2A1F = 6;
    var_2 useanimtree( #animtree );
    var_3 useanimtree( #animtree );
    var_2 thermaldrawenable();
    var_3 thermaldrawenable();

    if ( issubstr( var_2.model, "viewmodel" ) )
        var_2 setmodel( "vehicle_m1a1_abrams_viewmodel_tread_stop" );
    else
        var_2 setmodel( "vehicle_m1a1_abrams_minigun_tread_stop" );

    if ( issubstr( var_3.model, "viewmodel" ) )
        var_3 setmodel( "vehicle_m1a1_abrams_viewmodel_tread_stop" );
    else
        var_3 setmodel( "vehicle_m1a1_abrams_minigun_tread_stop" );

    var_2 linkto( self, "TAG_TANK_BACK", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_3 linkto( self, "TAG_TANK_FORWARD", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self._id_7EBB = 2;
    thread _id_7EBC( "hovercraft_tank_back_exit", "TAG_TANK_BACK", var_0 );
    thread _id_7EBC( "hovercraft_tank_forward_exit", "TAG_TANK_FORWARD", var_1 );
}

_id_7EBC( var_0, var_1, var_2 )
{
    var_3 = isdefined( var_2.godmode ) && var_2.godmode;
    var_2 maps\_vehicle::_id_2A12();
    maps\_utility::_id_1654( "hovercraft_unload" );
    setsaveddvar( "ui_hideMap", "0" );
    var_4 = var_2 maps\_vehicle::get_dummy();
    var_4 setmodel( var_2.model );
    var_5 = maps\_utility::_id_26EC( var_0 );
    var_6 = getanimlength( var_5 );
    thread maps\_anim::_id_11C1( var_4, var_0, var_1 );
    wait(var_6 - 0.05);
    var_4 unlink();
    var_4 stopanimscripted();
    var_2 maps\_vehicle::_id_2A91( var_2 );
    var_7 = 176;

    if ( isdefined( var_2.currentnode ) )
        var_7 = var_2.currentnode.speed;
    else if ( isdefined( var_2._id_291A ) )
        var_7 = var_2._id_291A.speed;

    var_4 maps\_utility::_id_2833( var_2.origin, var_2.angles, var_7 );
    var_2 maps\_vehicle::_id_2A95();

    if ( !var_3 )
        var_2 maps\_vehicle::_id_2A13();

    var_2._id_29B8 = 1;
    var_2 maps\hamburg_code::_id_7E42( var_2._id_291A.targetname );
    var_2 thread maps\hamburg_tank_ai::_id_7D9C();
    var_2 notify( "exited_hovercraft" );
    _id_7EBD();
}

_id_7EBD()
{
    self._id_7EBB--;

    if ( !self._id_7EBB )
        self notify( "tanks_exited" );
}

_id_7EBE( var_0, var_1, var_2 )
{
    var_3 = maps\_vehicle::_id_2A99( var_1 );
    var_4 = maps\_vehicle::_id_2A99( var_2 );
    maps\_utility::_id_282D( var_3, var_1 );
    maps\_utility::_id_282D( var_4, var_2 );
    var_3 maps\_vehicle::_id_2A12();
    var_4 maps\_vehicle::_id_2A12();
    var_5 = maps\_vehicle::_id_2881( var_0 );
    var_5 _id_7EC0();
    var_5 maps\_vehicle::_id_2A12();
    var_5 _id_7EBA( var_3, var_4 );
    var_5 vehicle_setspeed( 0, 100 );
    var_5 resumespeed( 100 );
}

_id_7EBF( var_0 )
{
    var_1 = level._id_7E1B;
    var_2 = getvehiclenode( "friend_path_off_hovercraft", "targetname" );
    var_1._id_291A = var_2;
    var_1 attachpath( var_2 );
    var_2 = getvehiclenode( "craft_2_tank1_path_one", "targetname" );
    level._id_7E26._id_291A = var_2;
    level._id_7E26 attachpath( var_2 );
    var_1 maps\_vehicle::_id_2A12();
    var_3 = maps\_vehicle::_id_2881( var_0 );
    var_3 _id_7EC0();
    var_3 maps\_vehicle::_id_2A12();
    var_3 _id_7EBA( level._id_7E26, var_1 );
}

_id_7EC0()
{
    maps\_utility::_id_1402( "hovercraft_unload" );
    maps\_utility::_id_1402( "hovercraft_unloaded" );
    self setanim( %hovercraft_rocking );
    thread _id_7EC1();
}

_id_7EC1()
{
    maps\_utility::_id_1654( "hovercraft_unload" );
    self clearanim( %hovercraft_rocking, 1 );
    var_0 = getanimlength( %lcac_deflate );
    var_1 = gettime();
    self setanim( %lcac_deflate );
    self waittill( "tanks_exited" );
    maps\_utility::_id_1254( var_1, var_0 );
    maps\_utility::_id_13DC( "hovercraft_unloaded" );
    self._id_2950 = 1;
}
