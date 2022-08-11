// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_3C1C = ::_id_3C1C;
    level._id_3C2F = ::_id_3C2F;
    level._id_3C1D = ::_id_3C1D;

    if ( isdefined( level._id_47E4 ) && level._id_47E4 )
        level._id_3C1F = ::_id_4804;

    precacheshader( "uav_predator2_dir" );
    precacheshader( "uav_predator2_dirbar" );
    precacheshader( "uav_predator2_xhair" );
    precacheshader( "uav_predator2_horz_bar1" );
    precacheshader( "uav_predator2_l_topleft" );
    precacheshader( "uav_predator2_l_topright" );
    precacheshader( "uav_predator2_l_bottomleft" );
    precacheshader( "uav_predator2_l_bottomright" );
    precacheshader( "uav_predator2_heading_frame" );
    precachestring( &"UAV_M" );
    precachestring( &"UAV_WTR_DVR_ON" );
    precachestring( &"UAV_NAR" );
    precachestring( &"UAV_BLK_WHT" );
    precachestring( &"UAV_KIAS" );
    precachestring( &"UAV_N2" );
    precachestring( &"UAV_W2" );
}

_id_3C1C()
{
    if ( issplitscreen() )
        self._id_47E5 = 0.666667;
    else
        self._id_47E5 = 1.0;

    self._id_47E6 = [];
    self._id_47E6["screen"] = _id_47ED( 1, 1 );
    self._id_47E6["text"] = _id_47F3();
    self._id_47E6["kias"] = _id_47FA();
    self._id_47E6["alt"] = _id_47FD();
    self._id_47E6["heading"] = _id_4801();
    self._id_47E6["crosshair"] = _id_4803();
}

_id_47E7( var_0, var_1, var_2 )
{
    if ( isarray( var_1 ) )
    {
        foreach ( var_4 in var_1 )
        {
            if ( var_0 )
                var_4 fadeovertime( var_2 );

            var_4.alpha = 0;
        }
    }
    else
    {
        if ( var_0 )
            var_1 fadeovertime( var_2 );

        var_1.alpha = 0;
    }
}

_id_47E8( var_0 )
{
    self notify( "uav_cleanup_hud" );

    foreach ( var_2 in self._id_47E6 )
    {
        if ( isdefined( var_2 ) )
            _id_47E7( var_0, var_2, 0.25 );
    }
}

_id_3C2F( var_0 )
{
    if ( var_0 == 0 )
        _id_47E8( 1 );
    else
        _id_47E9();
}

_id_3C1D( var_0 )
{
    if ( var_0 == 0 )
        _id_47E8( 0 );
    else
        _id_47E9();
}

_id_47E9()
{
    self notify( "uav_cleanup_hud" );

    if ( isdefined( self._id_47E6 ) )
    {
        foreach ( var_1 in self._id_47E6 )
        {
            if ( isdefined( var_1 ) )
            {
                if ( isarray( var_1 ) )
                {
                    foreach ( var_3 in var_1 )
                        _id_47EA( var_3 );

                    var_1 = undefined;
                    continue;
                }

                _id_47EA( var_1 );
            }
        }

        self._id_47E6 = undefined;
    }
}

_id_47EA( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_44DF ) )
        var_0._id_44DF destroy();

    if ( isdefined( var_0._id_44E0 ) )
        var_0._id_44E0 destroy();

    var_0 destroy();
}

_id_47EB( var_0 )
{
    if ( issplitscreen() )
        return var_0 * self._id_47E5;
    else
        return var_0;
}

_id_47EC( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = newclienthudelem( self );
    var_9.x = _id_47EB( var_0 );
    var_9.y = _id_47EB( var_1 );
    var_9.alignx = var_7;
    var_9.aligny = var_8;
    var_9.sort = var_5;
    var_9.horzalign = "fullscreen";
    var_9.vertalign = "fullscreen";
    var_9.alpha = var_6;
    var_9 setshader( var_4, var_2, var_3 );
    return var_9;
}

_id_47ED( var_0, var_1 )
{
    var_2[0] = _id_47EC( 140, 135, 21, 32, "uav_predator2_l_topleft", var_0, var_1, "left", "top" );
    var_2[1] = _id_47EC( 499, 135, 21, 32, "uav_predator2_l_topright", var_0, var_1, "right", "top" );
    var_2[2] = _id_47EC( 140, 364, 21, 32, "uav_predator2_l_bottomleft", var_0, var_1, "left", "bottom" );
    var_2[3] = _id_47EC( 499, 364, 21, 32, "uav_predator2_l_bottomright", var_0, var_1, "right", "bottom" );
    return var_2;
}

_id_47EE( var_0 )
{
    self endon( "uav_cleanup_hud" );
    self endon( "death" );
    var_1 = 37200000;

    while ( isdefined( var_0 ) )
    {
        var_2 = gettime() + var_1;
        var_3 = int( var_2 / 1000 );
        var_4 = int( var_3 / 60 );
        var_3 = int( var_3 - 60 * var_4 );
        var_5 = int( var_4 / 60 );
        var_4 = int( var_4 - 60 * var_5 );
        var_5 = animscripts\utility::_id_0D08( var_5, 24 );

        if ( var_5 < 10 )
            var_6 = "0" + var_5;
        else
            var_6 = "" + var_5;

        var_0[0] settext( var_6 );

        if ( var_4 < 10 )
            var_6 = "0" + var_4;
        else
            var_6 = "" + var_4;

        var_0[1] settext( var_6 );

        if ( var_3 < 10 )
            var_6 = "0" + var_3;
        else
            var_6 = "" + var_3;

        var_0[2] settext( var_6 );
        wait 0.05;
    }
}

_id_47EF()
{
    var_0[0] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[0].x = _id_47EB( 288.0 );
    var_0[0].y = _id_47EB( 420 );
    var_0[0].sort = 1;
    var_0[0].horzalign = "fullscreen";
    var_0[0].vertalign = "fullscreen";
    var_0[0].alpha = 1.0;
    var_0[0].color = ( 0.56, 1.0, 0.52 );
    var_0[0] settext( "01" );
    var_0[1] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[1].x = _id_47EB( 304.0 );
    var_0[1].y = _id_47EB( 420 );
    var_0[1].sort = 1;
    var_0[1].horzalign = "fullscreen";
    var_0[1].vertalign = "fullscreen";
    var_0[1].alpha = 1.0;
    var_0[1].color = ( 0.56, 1.0, 0.52 );
    var_0[1].label = ":";
    var_0[1] settext( "23" );
    var_0[2] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[2].x = _id_47EB( 328.0 );
    var_0[2].y = _id_47EB( 420 );
    var_0[2].sort = 1;
    var_0[2].horzalign = "fullscreen";
    var_0[2].vertalign = "fullscreen";
    var_0[2].alpha = 1.0;
    var_0[2].color = ( 0.56, 1.0, 0.52 );
    var_0[2].label = ":";
    var_0[2] settext( "45" );
    thread _id_47EE( var_0 );
    return var_0;
}

_id_47F0( var_0 )
{
    self endon( "uav_cleanup_hud" );
    self endon( "death" );

    while ( isdefined( var_0 ) )
    {
        var_1 = maps\_remotemissile::_id_3C2B();

        if ( isdefined( var_1 ) )
        {
            var_2 = var_1.origin[2];
            var_2 *= 0.0254;
            var_2 = int( var_2 );
            var_0[0] setvalue( var_2 );
            var_3 = 1;

            for ( var_2 /= 10; var_2 > 1; var_2 /= 10 )
                var_3++;

            var_0[1].x = _id_47EB( 480 + 8.0 * var_3 );
        }

        wait 0.05;
    }
}

_id_47F1()
{
    var_0[0] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[0].x = _id_47EB( 480 );
    var_0[0].y = _id_47EB( 70 );
    var_0[0].sort = 1;
    var_0[0].horzalign = "fullscreen";
    var_0[0].vertalign = "fullscreen";
    var_0[0].alpha = 1.0;
    var_0[0].color = ( 0.56, 1.0, 0.52 );
    var_0[0] setvalue( 16 );
    var_0[1] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[1].x = _id_47EB( 488 );
    var_0[1].y = _id_47EB( 70 );
    var_0[1].sort = 1;
    var_0[1].horzalign = "fullscreen";
    var_0[1].vertalign = "fullscreen";
    var_0[1].alpha = 1.0;
    var_0[1].color = ( 0.56, 1.0, 0.52 );
    var_0[1] settext( &"UAV_MSL" );
    thread _id_47F0( var_0 );
    return var_0;
}

_id_47F2()
{
    var_0 = maps\_hud_util::createserverclientfontstring( "default", 1.2 );
    var_0.sort = 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1.0;
    var_0.color = ( 0.56, 1.0, 0.52 );
    return var_0;
}

_id_47F3()
{
    var_0[0] = _id_47F2();
    var_0[0].x = _id_47EB( 50 );
    var_0[0].y = _id_47EB( 109 );
    var_0[0] settext( &"UAV_WTR_DVR_ON" );
    var_0[1] = _id_47F2();
    var_0[1].x = _id_47EB( 50 );
    var_0[1].y = _id_47EB( 121 );
    var_0[1] settext( &"UAV_NAR" );
    var_0[2] = _id_47F2();
    var_0[2].x = _id_47EB( 50 );
    var_0[2].y = _id_47EB( 133 );
    var_0[2] settext( &"UAV_BLK_WHT" );
    var_0[3] = _id_47F2();
    var_0[3].x = _id_47EB( 50 );
    var_0[3].y = _id_47EB( 147 );
    var_0[3] settext( &"UAV_KIAS" );
    var_0[4] = _id_47F2();
    var_0[4].x = _id_47EB( 510 );
    var_0[4].y = _id_47EB( 380 );

    if ( isdefined( level._id_47F4 ) )
        var_0[4] settext( level._id_47F4 );
    else
        var_0[4] settext( &"UAV_N2" );

    var_0[5] = _id_47F2();
    var_0[5].x = _id_47EB( 508 );
    var_0[5].y = _id_47EB( 400 );

    if ( isdefined( level._id_47F5 ) )
        var_0[5] settext( level._id_47F5 );
    else
        var_0[5] settext( &"UAV_W2" );

    var_0[6] = _id_47F2();
    var_0[6].x = _id_47EB( 491 );
    var_0[6].y = _id_47EB( 420 );
    var_0[6] settext( &"UAV_ALT_MSL" );
    return var_0;
}

_id_47F6( var_0 )
{
    self endon( "uav_cleanup_hud" );
    self endon( "death" );

    while ( isdefined( var_0 ) )
    {
        var_1 = _id_0612::_id_3C19();

        if ( isdefined( var_1 ) )
        {
            if ( isdefined( self._id_3C12 ) )
            {
                var_2 = self._id_3C12.origin;
                var_3 = anglestoforward( self._id_3C12.angles );
                var_4 = var_2 + 20000 * var_3;
                var_5 = bullettrace( var_2, var_4, 1, self._id_3C12 );
                var_6 = distance( var_5["position"], self._id_3C12.origin );
            }
            else
            {
                var_2 = var_1.origin;
                var_7 = self getplayerangles();
                var_3 = anglestoforward( var_7 );
                var_2 += 500 * var_3;
                var_4 = var_2 + 20000 * var_3;
                var_5 = bullettrace( var_2, var_4, 1, self );
                var_6 = distance( var_5["position"], var_1.origin );
            }

            var_6 *= 0.0254;
            var_6 = int( var_6 );
            var_0[0] setvalue( var_6 );
            var_8 = 1;

            for ( var_6 /= 10; var_6 > 1; var_6 /= 10 )
                var_8++;

            var_0[0].x = _id_47EB( 320 - 8 * ( var_8 + 1 ) / 2 );
            var_0[1].x = _id_47EB( 320 - 8 * ( var_8 + 1 ) / 2 + 8 * var_8 );
            maps\_audio::aud_send_msg( "predator_dist_update", var_6 );
        }

        wait 0.05;
    }
}

_id_47F7()
{
    var_0[0] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[0].x = _id_47EB( 304.0 );
    var_0[0].y = _id_47EB( 60 );
    var_0[0].sort = 1;
    var_0[0].horzalign = "fullscreen";
    var_0[0].vertalign = "fullscreen";
    var_0[0].alpha = 1.0;
    var_0[0].color = ( 0.56, 1.0, 0.52 );
    var_0[0] setvalue( 215 );
    var_0[1] = maps\_hud_util::createserverclientfontstring( "default", 2.0 );
    var_0[1].x = _id_47EB( 328.0 );
    var_0[1].y = _id_47EB( 60 );
    var_0[1].sort = 1;
    var_0[1].horzalign = "fullscreen";
    var_0[1].vertalign = "fullscreen";
    var_0[1].alpha = 1.0;
    var_0[1].color = ( 0.56, 1.0, 0.52 );
    var_0[1] settext( &"UAV_M" );
    thread _id_47F6( var_0 );
    return var_0;
}

_id_47F8( var_0 )
{
    self endon( "uav_cleanup_hud" );
    self endon( "death" );
    var_1 = maps\_remotemissile::_id_3C2B();
    var_2 = 0;
    var_3 = 0;
    var_4 = 200;

    if ( isdefined( var_1 ) )
    {
        if ( var_1.code_classname == "script_vehicle" )
            var_2 = var_1 vehicle_getspeed();

        var_3 = var_2 - 30;
        var_4 = var_2 + 30;
    }

    var_5 = 0;
    var_6 = 3;
    var_7 = var_6;
    var_8 = 0;
    var_9 = 0;
    var_10 = 25;
    var_11 = 55;
    var_12 = 245;

    while ( isdefined( var_0 ) )
    {
        var_1 = maps\_remotemissile::_id_3C2B();

        if ( isdefined( var_1 ) )
        {
            if ( var_1.code_classname == "script_vehicle" )
                var_2 = var_1 vehicle_getspeed();

            var_13 = ( var_2 - var_3 ) / ( var_4 - var_3 );
            var_13 += var_8;

            if ( var_13 < 0 )
                var_13 = 0;

            if ( var_13 > 1 )
                var_13 = 1;

            var_2 = 80 + var_13 * 30;
            var_14 = var_11 / 2;
            var_15 = var_12 - var_11 * 2;
            var_16 = var_15 + var_14;
            var_17 = var_12 + var_11 * 2;
            var_18 = var_17 - var_14;
            var_19 = var_2 - int( var_2 / var_10 ) * var_10;
            var_20 = var_2 - var_19;
            var_21 = int( var_19 / var_10 * var_11 );
            var_0[0] setvalue( var_20 + var_10 * 2 );
            var_22 = var_12 + var_21 - 2 * var_11;
            var_0[0].y = _id_47EB( var_22 );
            var_0[0].alpha = clamp( ( var_22 - var_15 ) / var_14, 0, 1 );
            var_0[1] setvalue( var_20 + var_10 );
            var_0[1].y = _id_47EB( var_12 + var_21 - var_11 );
            var_0[2] setvalue( var_20 );
            var_0[2].y = _id_47EB( var_12 + var_21 );
            var_0[3] setvalue( var_20 - var_10 );
            var_22 = var_12 + var_21 + var_11;
            var_0[3].y = _id_47EB( var_22 );
            var_0[3].alpha = 1 - clamp( ( var_22 - var_18 ) / var_14, 0, 1 );
            var_0[4] setvalue( int( var_2 ) );
            var_23 = 5;

            for ( var_24 = 0; var_24 < 25; var_24++ )
            {
                var_22 = var_24 * 11 + 135 + var_21 - var_11 + 4;
                var_0[var_23 + var_24].y = int( _id_47EB( var_22 ) );
                var_0[var_23 + var_24].alpha = 1;

                if ( var_22 <= var_16 )
                    var_0[var_23 + var_24].alpha = clamp( ( var_22 - var_15 ) / var_14, 0, 1 );

                if ( var_22 >= var_18 )
                    var_0[var_23 + var_24].alpha = 1 - clamp( ( var_22 - var_18 ) / var_14, 0, 1 );
            }
        }

        var_7 += 0.05;
        var_8 += var_5;

        if ( var_7 >= var_6 )
        {
            var_7 = 0;
            var_25 = var_9;
            var_9 = randomfloatrange( -0.1, 0.1 );
            var_5 = ( var_9 - var_25 ) * 0.05 / var_6;
        }

        wait 0.05;
    }
}

_id_47F9( var_0, var_1 )
{
    var_2 = maps\_hud_util::createserverclientfontstring( "default", 1.0 );
    var_2.x = _id_47EB( var_0 );
    var_2.y = _id_47EB( var_1 );
    var_2.alignx = "right";
    var_2.sort = 1;
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2.alpha = 1.0;
    var_2.color = ( 1.0, 1.0, 1.0 );
    var_2 setvalue( 0 );
    return var_2;
}

_id_47FA()
{
    var_0[0] = _id_47F9( 120, 100 );
    var_0[1] = _id_47F9( 120, 120 );
    var_0[2] = _id_47F9( 120, 140 );
    var_0[3] = _id_47F9( 120, 160 );
    var_0[4] = _id_47F2();
    var_0[4].x = _id_47EB( 80 );
    var_0[4].y = _id_47EB( 147 );
    var_0[4] setvalue( 100 );
    var_1 = 5;
    var_2 = 5;
    var_3 = 1;

    for ( var_4 = 0; var_4 < 25; var_4++ )
    {
        var_0[var_1 + var_4] = newclienthudelem( self );
        var_0[var_1 + var_4].x = _id_47EB( 135 );
        var_0[var_1 + var_4].y = _id_47EB( var_4 * 11 + 135 );
        var_0[var_1 + var_4].alignx = "right";
        var_0[var_1 + var_4].sort = 1;
        var_0[var_1 + var_4].horzalign = "fullscreen";
        var_0[var_1 + var_4].vertalign = "fullscreen";
        var_0[var_1 + var_4].alpha = 1.0;
        var_3 -= 1;

        if ( var_3 == 0 )
        {
            var_0[var_1 + var_4] setshader( "uav_predator2_horz_bar1", 8, 4 );
            var_3 = var_2;
            continue;
        }

        var_0[var_1 + var_4] setshader( "uav_predator2_horz_bar1", 6, 4 );
    }

    thread _id_47F8( var_0 );
    return var_0;
}

_id_47FB( var_0 )
{
    self endon( "uav_cleanup_hud" );
    self endon( "death" );
    var_1 = maps\_remotemissile::_id_3C2B();
    var_2 = 0;
    var_3 = 0;
    var_4 = 1000;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1.origin[2];
        var_3 = var_2 - 100;
        var_4 = var_2 + 100;
    }

    var_5 = 0;
    var_6 = 0;
    var_7 = 0;
    var_8 = 0;
    var_9 = 4;
    var_5 = var_9;
    var_10 = 250;
    var_11 = 55;
    var_12 = 245;

    while ( isdefined( var_0 ) )
    {
        var_1 = maps\_remotemissile::_id_3C2B();

        if ( isdefined( var_1 ) )
        {
            var_2 = var_1.origin[2];
            var_13 = ( var_2 - var_3 ) / ( var_4 - var_3 );
            var_13 += var_7;

            if ( var_13 < 0 )
                var_13 = 0;

            if ( var_13 > 1 )
                var_13 = 1;

            var_2 = var_3 + var_13 * ( var_4 - var_3 );
            var_14 = var_11 / 2;
            var_15 = var_12 - var_11 * 2;
            var_16 = var_15 + var_14;
            var_17 = var_12 + var_11 * 2;
            var_18 = var_17 - var_14;
            var_19 = var_2 - int( var_2 / var_10 ) * var_10;
            var_20 = var_2 - var_19;
            var_21 = int( var_19 / var_10 * var_11 );
            var_0[0] setvalue( var_20 + var_10 * 2 );
            var_22 = var_12 + var_21 - 2 * var_11;
            var_0[0].y = _id_47EB( var_22 );
            var_0[0].alpha = clamp( ( var_22 - var_15 ) / ( var_16 - var_15 ), 0, 1 );
            var_0[1] setvalue( var_20 + var_10 );
            var_0[1].y = _id_47EB( var_12 + var_21 - var_11 );
            var_0[2] setvalue( var_20 );
            var_0[2].y = _id_47EB( var_12 + var_21 );
            var_0[3] setvalue( var_20 - var_10 );
            var_22 = var_12 + var_21 + var_11;
            var_0[3].y = _id_47EB( var_22 );
            var_0[3].alpha = 1 - clamp( ( var_22 - var_18 ) / ( var_17 - var_18 ), 0, 1 );
            var_23 = 4;

            for ( var_24 = 0; var_24 < 25; var_24++ )
            {
                var_22 = var_24 * 11 + 135 + var_21 - var_11 + 4;
                var_0[var_23 + var_24].y = int( _id_47EB( var_22 ) );
                var_0[var_23 + var_24].alpha = 1;

                if ( var_22 <= var_16 )
                    var_0[var_23 + var_24].alpha = clamp( ( var_22 - var_15 ) / var_14, 0, 1 );

                if ( var_22 >= var_18 )
                    var_0[var_23 + var_24].alpha = 1 - clamp( ( var_22 - var_18 ) / var_14, 0, 1 );
            }
        }

        var_5 += 0.05;
        var_7 += var_6;

        if ( var_5 >= var_9 )
        {
            var_5 = 0;
            var_25 = var_8;
            var_8 = randomfloatrange( -0.1, 0.1 );
            var_6 = ( var_8 - var_25 ) * 0.05 / var_9;
        }

        wait 0.05;
    }
}

_id_47FC( var_0, var_1 )
{
    var_2 = maps\_hud_util::createserverclientfontstring( "default", 1.0 );
    var_2.x = _id_47EB( var_0 );
    var_2.y = _id_47EB( var_1 );
    var_2.alignx = "left";
    var_2.sort = 1;
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2.alpha = 1.0;
    var_2.color = ( 1.0, 1.0, 1.0 );
    var_2 setvalue( 0 );
    return var_2;
}

_id_47FD()
{
    var_0[0] = _id_47FC( 525, 100 );
    var_0[1] = _id_47FC( 525, 120 );
    var_0[2] = _id_47FC( 525, 140 );
    var_0[3] = _id_47FC( 525, 160 );
    var_1 = 4;
    var_2 = 5;
    var_3 = 1;

    for ( var_4 = 0; var_4 < 25; var_4++ )
    {
        var_0[var_1 + var_4] = newclienthudelem( self );
        var_0[var_1 + var_4].x = _id_47EB( 505 );
        var_0[var_1 + var_4].y = _id_47EB( var_4 * 11 + 135 );
        var_0[var_1 + var_4].alignx = "left";
        var_0[var_1 + var_4].sort = 1;
        var_0[var_1 + var_4].horzalign = "fullscreen";
        var_0[var_1 + var_4].vertalign = "fullscreen";
        var_0[var_1 + var_4].alpha = 1.0;
        var_3 -= 1;

        if ( var_3 == 0 )
        {
            var_0[var_1 + var_4] setshader( "uav_predator2_horz_bar1", 8, 4 );
            var_3 = var_2;
            continue;
        }

        var_0[var_1 + var_4] setshader( "uav_predator2_horz_bar1", 6, 4 );
    }

    thread _id_47FB( var_0 );
    return var_0;
}

_id_47FE( var_0, var_1 )
{
    self endon( "uav_cleanup_hud" );
    self endon( "death" );
    var_2 = maps\_remotemissile::_id_3C2B();
    var_3 = 0;
    var_4 = 360;

    while ( isdefined( var_0 ) )
    {
        var_2 = maps\_remotemissile::_id_3C2B();

        if ( isdefined( var_2 ) )
        {
            var_5 = var_2.angles[1];
            var_5 = animscripts\utility::_id_0D08( var_5, 360 );
            var_6 = ( var_5 - var_3 ) / ( var_4 - var_3 );

            if ( var_6 < 0 )
                var_6 = 0;

            if ( var_6 > 1 )
                var_6 = 1;

            var_7 = var_0._id_47FF + var_6 * ( var_0._id_4800 - var_0._id_47FF );
            var_0.x = _id_47EB( var_7 );
            var_1 setvalue( var_5 );
        }

        wait 0.05;
    }
}

_id_4801()
{
    var_0[0] = newclienthudelem( self );
    var_0[0].x = _id_47EB( 304 );
    var_0[0].y = _id_47EB( 8 );
    var_0[0].sort = 1;
    var_0[0].horzalign = "fullscreen";
    var_0[0].vertalign = "fullscreen";
    var_0[0].alpha = 1.0;
    var_0[0] setshader( "uav_predator2_dir", 24, 16 );
    var_0[0]._id_47FF = 188;
    var_0[0]._id_4800 = 428;
    var_0[1] = newclienthudelem( self );
    var_0[1].x = _id_47EB( 320 );
    var_0[1].y = _id_47EB( 36 );
    var_0[1].alignx = "center";
    var_0[1].aligny = "middle";
    var_0[1].sort = 1;
    var_0[1].horzalign = "fullscreen";
    var_0[1].vertalign = "fullscreen";
    var_0[1].alpha = 1.0;
    var_0[1] setshader( "uav_predator2_dirbar", 256, 32 );
    var_0[2] = newclienthudelem( self );
    var_0[2].x = _id_47EB( 320 );
    var_0[2].y = _id_47EB( 55 );
    var_0[2].alignx = "center";
    var_0[2].aligny = "middle";
    var_0[2].sort = 1;
    var_0[2].horzalign = "fullscreen";
    var_0[2].vertalign = "fullscreen";
    var_0[2].alpha = 1.0;
    var_0[2] setshader( "uav_predator2_heading_frame", 21, 32 );
    var_0[3] = maps\_hud_util::createserverclientfontstring( "default", 1.2 );
    var_0[3].x = _id_47EB( 320 );
    var_0[3].y = _id_47EB( 55 );
    var_0[3].sort = 1;
    var_0[3].horzalign = "fullscreen";
    var_0[3].vertalign = "fullscreen";
    var_0[3].alignx = "center";
    var_0[3].aligny = "middle";
    var_0[3].alpha = 1.0;
    var_0[3].color = ( 0.56, 1.0, 0.52 );
    var_0[3] setvalue( 215 );
    thread _id_47FE( var_0[0], var_0[3] );
    return var_0;
}

_id_4802()
{
    var_0 = newclienthudelem( self );
    var_0.x = _id_47EB( 272 );
    var_0.y = _id_47EB( 292 );
    var_0.sort = 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1.0;
    var_0 setshader( "uav_predator2_horz", 64, 64 );
    return var_0;
}

_id_4803()
{
    var_0 = newclienthudelem( self );
    var_0.x = _id_47EB( 320 );
    var_0.y = _id_47EB( 240 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.sort = 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1.0;
    var_0 setshader( "uav_predator2_xhair", 205, 205 );
    return var_0;
}

_id_4804( var_0 )
{
    while ( isdefined( var_0 ) )
    {
        if ( self adsbuttonpressed() )
            var_0 thread _id_4805( self );

        wait 0.05;
    }
}

_id_4805( var_0 )
{
    var_0 dodamage( 1, var_0.origin );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    self delete();

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        wait(randomfloatrange( 0.1, 0.3 ));
        var_3 = anglestoforward( var_1.angles );
        var_4 = anglestoright( var_1.angles );
        var_5 = anglestoup( var_1.angles );
        var_6 = randomintrange( -64, 64 );
        var_7 = randomintrange( -64, 64 );
        var_8 = randomintrange( -64, -63 );
        var_9 = magicgrenade( "m203", var_1.origin, var_1.origin + ( var_6 * var_3 + var_7 * var_4 + var_8 * var_5 ) );
        var_9 thread _id_4806();
    }

    var_1 delete();
}

_id_4806()
{
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    while ( isdefined( self ) )
    {
        var_0.origin = self.origin;
        wait 0.05;
    }

    playfx( level._effect["slamraam_explosion"], var_0.origin );
    radiusdamage( var_0.origin + ( 0.0, 0.0, 128.0 ), 512, 200, 200 );
    earthquake( 0.4, 1, var_0.origin, 1000 );
    var_0 playsound( "detpack_explo_main", "sound_done" );
    var_0 delete();
}
