// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6108()
{
    if ( self playerads() < 1.0 )
        return 0;

    var_0 = self getcurrentweapon();

    if ( !issubstr( var_0, "javelin" ) )
        return 0;

    return 1;
}

_id_6109( var_0 )
{
    return target_isinrect( var_0, self, 25, 60, 30 );
}

_id_610A( var_0 )
{
    return target_isinrect( var_0, self, 25, 90, 45 );
}

_id_610B()
{
    self notify( "javelin_clu_cleartarget" );
    self notify( "stop_lockon_sound" );
    level.javelinlockstarttime = 0;
    level._id_610C = 0;
    level._id_610D = 0;
    level.javelintarget = undefined;
    self weaponlockfree();
    self weaponlocktargettooclose( 0 );
    self weaponlocknoclearance( 0 );
    self stoplocalsound( "javelin_clu_lock" );
    self stoplocalsound( "javelin_clu_aquiring_lock" );
}

_id_610E()
{
    var_0 = target_getarray();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( _id_6109( var_0[var_2] ) )
            var_1[var_1.size] = var_0[var_2];

        target_setoffscreenshader( var_0[var_2], "javelin_hud_target_offscreen" );
    }

    if ( var_1.size == 0 )
        return undefined;

    var_3 = var_1[0];

    if ( var_1.size > 1 )
    {

    }

    return var_3;
}

_id_55A1( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !target_istarget( var_0 ) )
        return 0;

    if ( !_id_610A( var_0 ) )
        return 0;

    return 1;
}

_id_5BAE( var_0 )
{
    var_1 = 1000;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = distance2d( self.origin, var_0.origin );

    if ( var_2 < var_1 )
        self weaponlocktargettooclose( 1 );
    else
        self weaponlocktargettooclose( 0 );
}

_id_610F()
{
    var_0 = 60;
    var_1 = 10;
    var_2 = 400;
    var_3 = ( 0.0, 1.0, 0.0 );
    var_4 = ( 1.0, 0.0, 0.0 );
    var_5 = [];
    var_5[0] = ( 0.0, 0.0, 80.0 );
    var_5[1] = ( -40.0, 0.0, 120.0 );
    var_5[2] = ( 40.0, 0.0, 120.0 );
    var_5[3] = ( -40.0, 0.0, 40.0 );
    var_5[4] = ( 40.0, 0.0, 40.0 );

    if ( getdvar( "missileDebugDraw" ) == "1" )
        var_6 = 1;
    else
        var_6 = 0;

    var_7 = self getplayerangles();
    var_8 = anglestoforward( var_7 );
    var_9 = anglestoright( var_7 );
    var_10 = anglestoup( var_7 );
    var_11 = self.origin + ( 0, 0, var_0 ) + var_9 * var_1;
    var_12 = 0;

    for ( var_13 = 0; var_13 < var_5.size; var_13++ )
    {
        var_14 = var_11 + var_8 * var_2 + var_10 * var_5[var_13][2] + var_9 * var_5[var_13][0];
        var_15 = bullettrace( var_11, var_14, 0, undefined );

        if ( var_15["fraction"] < 1 )
        {
            var_12 = 1;

            if ( var_6 )
            {

            }
            else
                break;
        }
        else if ( var_6 )
        {

        }
    }

    self weaponlocknoclearance( var_12 );
}

_id_6110()
{
    self endon( "death" );
    self endon( "javelin_clu_off" );
    var_0 = 2000;

    for (;;)
    {
        wait 0.05;
        var_1 = self getcurrentweaponclipammo();

        if ( !var_1 )
        {
            _id_610B();
            continue;
        }

        if ( level._id_610D )
        {
            if ( !_id_55A1( level.javelintarget ) )
            {
                _id_610B();
                continue;
            }

            _id_5BAE( level.javelintarget );
            _id_610F();
            continue;
        }

        if ( level._id_610C )
        {
            if ( !_id_55A1( level.javelintarget ) )
            {
                _id_610B();
                continue;
            }

            var_2 = gettime() - level.javelinlockstarttime;

            if ( var_2 < var_0 )
                continue;

            self notify( "stop_lockon_sound" );
            level._id_610D = 1;
            self weaponlockfinalize( level.javelintarget );
            self playlocalsound( "javelin_clu_lock" );
            _id_5BAE( level.javelintarget );
            _id_610F();
            continue;
        }

        var_3 = _id_610E();

        if ( !isdefined( var_3 ) )
            continue;

        level.javelintarget = var_3;
        level.javelinlockstarttime = gettime();
        level._id_610C = 1;
        self weaponlockstart( var_3 );
        thread looplocalseeksound( "javelin_clu_aquiring_lock", 0.6 );
    }
}

_id_6111()
{
    self endon( "death" );

    for (;;)
    {
        while ( !_id_6108() )
            wait 0.05;

        thread _id_6110();

        while ( _id_6108() )
            wait 0.05;

        self notify( "javelin_clu_off" );
        _id_610B();
    }
}

_id_6112()
{
    for (;;)
    {
        wait 0.05;
        _id_610F();
    }
}

init()
{
    precacheshader( "javelin_hud_target_offscreen" );
    common_scripts\utility::array_thread( level.players, ::_id_610B );
    setsaveddvar( "vehHudTargetSize", 50 );
    setsaveddvar( "vehHudTargetScreenEdgeClampBufferLeft", 120 );
    setsaveddvar( "vehHudTargetScreenEdgeClampBufferRight", 126 );
    setsaveddvar( "vehHudTargetScreenEdgeClampBufferTop", 139 );
    setsaveddvar( "vehHudTargetScreenEdgeClampBufferBottom", 134 );
    common_scripts\utility::array_thread( level.players, ::_id_6111 );
}

looplocalseeksound( var_0, var_1 )
{
    self endon( "stop_lockon_sound" );

    for (;;)
    {
        self playlocalsound( var_0 );
        wait(var_1);
    }
}
