// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4DCE( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    setdvarifuninitialized( "a10_strike_controls", "points" );
    setdvarifuninitialized( "airstrike_weapon", "a10" );
    setdvarifuninitialized( "a10_strike_debug", "0" );
    setdvarifuninitialized( "a10_strike_generate_path", "0" );
    level._id_4DCF = 0;
    level._id_4DD0 = 2;
    level._id_4DD1 = 0.5;
    level._id_4DD2 = 0.15;
    level._id_4DD3 = 0;
    level._id_4DD4 = 1;
    level._id_4DD5 = 1;
    level._id_4DD6 = 3;
    level._id_4DD7 = ( 0.0, 0.0, 512.0 );
    level._id_4DD8 = 512;
    level._id_4DD9 = 512;
    level._id_4DDA = 512;
    level._id_4DDB = 256;
    level._id_4DDC = 0;
    level._id_4DDD = level._id_4DD0 + level._id_4DD1;
    level._id_4DDD = getdvarint( "a10_strike_cooldown", level._id_4DDD );

    if ( !isdefined( level._id_4DDE ) )
    {
        level._id_4DDE = maps\_hud_util::createfontstring( "default", 2 );
        level._id_4DDE maps\_hud_util::setpoint( "TOP", undefined, 0, 80 );
        level._id_4DDE.label = &"BERLIN_ACTIVATE_A10";
        level._id_4DDE.alpha = 1;
        level._id_4DDE.sort = 0.5;
        level._id_4DDE.foreground = 1;
    }

    if ( !isdefined( level._id_4DDF ) )
    {
        level._id_4DDF = maps\_hud_util::createfontstring( "default", 2 );
        level._id_4DDF maps\_hud_util::setpoint( "TOP", undefined, 0, 80 );
        level._id_4DDF.label = &"BERLIN_DIRECT_A10";
        level._id_4DDF.alpha = 0;
        level._id_4DDF.sort = 0.5;
    }

    level.player notifyonplayercommand( "toggle_airstrike", "+actionslot 4" );

    if ( !isdefined( level._id_4DE0 ) )
        level._id_4DE0 = [];

    thread _id_4DE3();
    wait 1;

    if ( !var_0 )
        thread _id_4E24();
}

_id_4DE1()
{
    level._id_4DE2 = 1;
    level.player notify( "turn_off_airstrike" );
    level.player notify( "airstrike_deactivated" );
    _id_4DE7();
    _id_4E21( 0 );
    level.player setweaponhudiconoverride( "actionslot4", "none" );
}

_id_4DE3()
{
    level.player endon( "turn_off_airstrike" );
    level.player notify( "airstrike_available" );
    var_0 = getdvar( "a10_strike_controls" );
    level._id_4DE4 = 1;
    level.player setweaponhudiconoverride( "actionslot4", "dpad_soflam_static" );
    _id_4E21( 0 );
    level.player waittill( "toggle_airstrike" );
    level.player _id_4E40();
    level.player _id_4E30( var_0 );

    if ( level.player getcurrentweapon() != level.player getcurrentprimaryweapon() )
    {
        level.player switchtoweapon( level.player getcurrentprimaryweapon() );
        wait 0.5;
    }

    if ( isdefined( level._id_4DDE ) )
        level._id_4DDE.alpha = 0;

    if ( var_0 == "static" )
        level._id_4DDF.label = &"BERLIN_DIRECT_A10_STATIC";

    level._id_4DDF.alpha = 1;
    childthread _id_4E2E();
    childthread _id_4E2D();
    level.player notifyonplayercommand( "trigger_a10", "+attack" );
    thread _id_4DE5();
    thread _id_4DE6();
    thread _id_4DED( 1 );
}

_id_4DE5()
{
    level.player endon( "airstrike_called" );
    level.player endon( "turn_off_airstrike" );
    level.player waittill( "toggle_airstrike" );
    level.player notify( "airstrike_deactivated" );
    maps\_audio::aud_send_msg( "a10_cancelled" );
    _id_4E21( 0 );
    _id_4DE7();
    wait 0.5;
    thread _id_4DE3();
}

_id_4DE6()
{
    level.player endon( "airstrike_deactivated" );
    level.player endon( "turn_off_airstrike" );
    level.player waittill( "airstrike_called" );
    thread _id_4E23();
    wait(level._id_4DD2);
    _id_4E21( 0 );
    wait 0.7;
    _id_4DE7();
    level.player setweaponhudiconoverride( "actionslot4", "dpad_soflam_inactive" );
    level.player waittill( "a10_anim_complete" );
    wait(level._id_4DDD);
    thread _id_4DE3();
    wait 1;
    thread _id_4E24();
}

_id_4DE7()
{
    var_0 = getdvar( "a10_strike_controls" );
    _id_4E2B();
    level.player _id_4E50();

    if ( !isdefined( level._id_4DE2 ) || level._id_4DE2 == 0 )
        thread _id_4DE9();

    if ( isdefined( level._id_4DE8 ) )
    {
        var_1 = level.player getnormalizedmovement();

        if ( var_1 != ( 0.0, 0.0, 0.0 ) )
            wait 0.5;
        else
            wait 0.3;

        _id_4E2F();
    }
    else
        wait 0.3;

    level.player _id_4E31( var_0 );
    level._id_4DE4 = 0;
}

_id_4DE9()
{
    level.player endon( "turn_off_airstrike" );
    level.player endon( "airstrike_available" );

    for (;;)
    {
        level.player waittill( "toggle_airstrike" );
        _id_4E26();
    }
}

_id_4DEA()
{
    if ( !isdefined( level._id_4DEB ) )
    {
        var_0 = getdvar( "a10_strike_controls" );
        level._id_4DEB = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        level._id_4DEB setmodel( "tag_origin" );
        level._id_4DEB.angles = ( -90.0, 0.0, 0.0 );
        level._id_4DEC = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        level._id_4DEC setmodel( "tag_origin" );

        if ( var_0 == "points" )
            playfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DEB, "tag_origin" );
        else if ( var_0 == "click" )
            playfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DEB, "tag_origin" );
        else
        {
            playfxontag( common_scripts\utility::getfx( "a10_target" ), level._id_4DEB, "tag_origin" );
            thread _id_4DF6();
            thread _id_4DF7();
        }
    }
}

_id_4DED( var_0 )
{
    self endon( "kill_draw_target_aim" );
    level.player endon( "toggle_airstrike" );
    level.player endon( "airstrike_called" );
    level.player endon( "turn_off_airstrike" );
    var_1 = getdvar( "a10_strike_controls" );

    if ( var_1 == "points" )
        level.player endon( "airstrike_set_second_point" );

    if ( !var_0 && isdefined( level._id_4DD5 ) && level._id_4DD5 > 0 )
        wait(level._id_4DD5);

    thread _id_4E01();

    for (;;)
    {
        var_2 = _id_4E20();

        if ( var_2["fraction"] < 1 )
        {
            _id_4DEA();
            level._id_4DEB.origin = var_2["pos"];
            level.player notify( "airstrike_first_point_confirmed" );
            var_1 = getdvar( "a10_strike_controls" );

            if ( var_1 == "ads" )
            {
                if ( level.player adsbuttonpressed() )
                {
                    if ( !isdefined( level._id_4DE8 ) )
                    {
                        level._id_4DE8 = spawn( "script_origin", level.player.origin );
                        level.player playerlinkto( level._id_4DE8 );
                    }

                    _id_4DEE();
                }
                else if ( isdefined( level._id_4DE8 ) )
                    _id_4E2F();
            }
            else if ( var_1 == "static" )
            {
                if ( !isdefined( level._id_4DE8 ) )
                {
                    level._id_4DE8 = spawn( "script_origin", level.player.origin );
                    level.player playerlinkto( level._id_4DE8 );
                }

                _id_4DEE();
            }
            else if ( var_1 == "points" )
            {

            }
        }
        else
        {
            level.player notify( "airstrike_first_point_failure" );
            thread _id_4DFF();
            wait 0.05;
            break;
        }

        wait 0.05;
    }
}

_id_4DEE()
{
    var_0 = level.player getnormalizedmovement();

    if ( var_0 != ( 0.0, 0.0, 0.0 ) )
    {
        var_1 = vectortoangles( var_0 );
        var_2 = combineangles( level.player.angles, -1 * var_1 );
        var_3 = ( level._id_4DEB.angles[0], var_2[1], var_2[2] );
        level._id_4DEB rotateto( var_3, 0.2 );
    }
}

_id_4DEF()
{
    level._id_4DF1 = spawn( "script_model", level._id_4DF0.origin );
    level._id_4DF1 setmodel( "tag_origin" );
    level._id_4DF1.angles = level._id_4DEB.angles;
    level._id_4DF1._id_4DF2 = "green";
    playfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF1, "tag_origin" );
}

_id_4DF3()
{
    if ( isdefined( level._id_4DF1 ) )
    {
        stopfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF1, "tag_origin" );
        stopfxontag( common_scripts\utility::getfx( "a10_point_active" ), level._id_4DF1, "tag_origin" );
        stopfxontag( common_scripts\utility::getfx( "a10_point_invalid" ), level._id_4DF1, "tag_origin" );
        level._id_4DF1 delete();
    }
}

_id_4DF4()
{
    if ( isdefined( level._id_4DF0 ) )
    {
        stopfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF0, "tag_origin" );
        stopfxontag( common_scripts\utility::getfx( "a10_point_active" ), level._id_4DF0, "tag_origin" );
        stopfxontag( common_scripts\utility::getfx( "a10_point_invalid" ), level._id_4DF0, "tag_origin" );
        level._id_4DF0 delete();
    }
}

_id_4DF5()
{
    level.player endon( "toggle_airstrike" );
    level.player endon( "airstrike_called" );
    level.player endon( "turn_off_airstrike" );
    level.player endon( "airstrike_path_fail" );
    var_0 = 128;

    if ( !isdefined( level._id_4DF0 ) )
    {
        level._id_4DF0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        level._id_4DF0 setmodel( "tag_origin" );
        level._id_4DF0.angles = level._id_4DEB.angles;
        level._id_4DF0.origin = level._id_4DEB.origin;
        stopfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DEB, "tag_origin" );
        playfxontag( common_scripts\utility::getfx( "a10_point_active" ), level._id_4DF0, "tag_origin" );
    }

    _id_4DEF();
    thread _id_4DF7();
    var_1 = 0;

    for (;;)
    {
        var_2 = _id_4E20();

        if ( var_2["fraction"] < 1 )
        {
            if ( var_1 )
            {
                _id_4DEF();
                thread _id_4DF7();
                var_1 = 0;
            }

            level._id_4DF1.origin = var_2["pos"];
            var_3 = level._id_4DD9 + level._id_4DDA;

            if ( distance( level._id_4DF0.origin, level._id_4DF1.origin ) > var_3 )
            {
                if ( level._id_4DF1._id_4DF2 == "green" )
                {
                    stopfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF1, "tag_origin" );
                    playfxontag( common_scripts\utility::getfx( "a10_point_invalid" ), level._id_4DF1, "tag_origin" );
                    level._id_4DF1._id_4DF2 = "red";
                }
            }
            else if ( level._id_4DF1._id_4DF2 == "red" )
            {
                stopfxontag( common_scripts\utility::getfx( "a10_point_invalid" ), level._id_4DF1, "tag_origin" );
                playfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF1, "tag_origin" );
                level._id_4DF1._id_4DF2 = "green";
            }

            var_4 = getdvar( "a10_strike_controls" );

            if ( var_4 != "points" )
            {
                var_5 = vectortoangles( level._id_4DF1.origin - level._id_4DF0.origin );
                var_6 = anglestoforward( common_scripts\utility::flat_angle( var_5 ) );
                level._id_4DEB.origin = level._id_4DF0.origin + var_6 * ( level._id_4DD9 - var_0 );
            }

            level.player notify( "airstrike_second_point_confirmed" );
        }
        else
        {
            level.player notify( "airstrike_second_point_failure" );
            _id_4E22( 0 );
            _id_4DF3();
            var_1 = 1;
        }

        wait 0.05;
    }
}

_id_4DF6()
{
    level.player endon( "toggle_airstrike" );
    level.player endon( "airstrike_called" );
    level.player endon( "turn_off_airstrike" );
    level.player endon( "airstrike_path_fail" );
    level._id_4DF0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_4DF0 setmodel( "tag_origin" );
    level._id_4DF0.angles = level._id_4DEB.angles;
    playfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF0, "tag_origin" );
    level._id_4DF1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_4DF1 setmodel( "tag_origin" );
    level._id_4DF1.angles = level._id_4DEB.angles;
    playfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF1, "tag_origin" );

    for (;;)
    {
        var_0 = anglestoforward( common_scripts\utility::flat_angle( level._id_4DEB.angles ) );
        level._id_4DF0.origin = level._id_4DEB.origin - var_0 * level._id_4DD9;
        level._id_4DF1.origin = level._id_4DEB.origin + var_0 * level._id_4DDA;
        wait 0.05;
    }
}

_id_4DF7()
{
    level.player endon( "toggle_airstrike" );
    level.player endon( "airstrike_called" );
    level.player endon( "turn_off_airstrike" );
    level.player endon( "airstrike_path_fail" );
    var_0 = getdvar( "a10_strike_controls" );

    if ( var_0 == "points" )
        level.player endon( "airstrike_second_point_failure" );

    var_1 = level._id_4DD9 + level._id_4DDA;
    var_2 = 64;

    if ( !isdefined( level._id_4DF8 ) )
        level._id_4DF8 = [];

    for (;;)
    {
        var_3 = 64;

        for ( var_4 = distance( level._id_4DF0.origin, level._id_4DF1.origin ); var_3 < var_4; var_3 += var_2 )
        {
            var_5 = vectortoangles( level._id_4DF1.origin - level._id_4DF0.origin );
            var_6 = anglestoforward( var_5 );
            var_7 = var_5 * ( 0.0, 1.0, 1.0 ) + ( 270.0, 90.0, 0.0 );
            var_8 = level._id_4DF0.origin + ( 0.0, 0.0, 10.0 ) + var_6 * var_3;
            var_9 = 1;

            foreach ( var_11 in level._id_4DF8 )
            {
                if ( var_11.dist == var_3 )
                {
                    if ( var_11.origin != var_8 || var_11.angles != var_7 )
                    {
                        var_11.origin = var_8;
                        var_11.angles = var_7;
                    }

                    var_9 = 0;
                }
            }

            if ( var_9 )
            {
                var_13 = common_scripts\utility::spawn_tag_origin();
                var_13.origin = var_8;
                var_13.angles = var_7;
                var_13.dist = var_3;
                var_14 = var_3 / var_2;
                var_15 = int( var_14 ) % 2;
                var_13 _id_4DFD( var_3 < var_1, var_15 );
                var_13._id_4DF9 = 0.1 * var_14;

                if ( var_3 == var_2 )
                    level._id_4DFA = gettime();

                var_13 thread _id_4DFB( var_14 );
                level._id_4DF8 = maps\_utility::_id_0BC3( level._id_4DF8, var_13 );
            }
        }

        foreach ( var_11 in level._id_4DF8 )
        {
            if ( var_11.dist >= var_3 )
                thread _id_4DFE( var_11, 1 );
        }

        wait 0.1;
    }
}

_id_4DFB( var_0 )
{
    var_1 = level._id_4DD5;
    var_2 = var_1 * 1000;
    var_3 = gettime();
    var_4 = var_3 - level._id_4DFA;
    var_5 = var_4 % var_2;

    if ( var_5 > 1000 * self._id_4DF9 )
        self._id_4DF9 += var_1;

    self._id_4DF9 -= var_5 / 1000;
    var_6 = self._id_4DF9;

    if ( var_6 > 0 )
        wait(var_6);

    if ( isdefined( self ) )
    {
        playfxontag( common_scripts\utility::getfx( self._id_4DFC ), self, "tag_origin" );

        if ( var_0 == 2 )
            playfxontag( common_scripts\utility::getfx( "a10_distance_number_0" ), self, "tag_origin" );
        else if ( var_0 == 6 )
            playfxontag( common_scripts\utility::getfx( "a10_distance_number_1" ), self, "tag_origin" );
        else if ( var_0 == 10 )
            playfxontag( common_scripts\utility::getfx( "a10_distance_number_2" ), self, "tag_origin" );
        else if ( var_0 == 14 )
            playfxontag( common_scripts\utility::getfx( "a10_distance_number_3" ), self, "tag_origin" );
    }
}

_id_4DFD( var_0, var_1 )
{
    if ( var_0 )
    {
        self._id_4DF2 = "green";
        self._id_4DFC = "a10_green_line";

        if ( var_1 )
            self._id_4DFC = "a10_green_line_short";
    }
    else
    {
        self._id_4DF2 = "red";
        self._id_4DFC = "a10_red_line";

        if ( var_1 )
            self._id_4DFC = "a10_red_line_short";
    }
}

_id_4DFE( var_0, var_1 )
{
    level._id_4DF8 = common_scripts\utility::array_remove( level._id_4DF8, var_0 );

    if ( level._id_4DD3 || var_1 )
    {
        var_0.origin += ( 0.0, 0.0, -10000.0 );
        wait 0.05;
    }

    if ( var_0._id_4DF2 == "green" )
        stopfxontag( common_scripts\utility::getfx( "a10_green_line" ), var_0, "tag_origin" );
    else
        stopfxontag( common_scripts\utility::getfx( "a10_red_line" ), var_0, "tag_origin" );

    var_0 delete();
}

_id_4DFF()
{
    self notify( "kill_draw_target_aim" );
    level.player endon( "toggle_airstrike" );
    wait 0.05;
    thread _id_4DED( 0 );
}

_id_4E00()
{
    level.player endon( "toggle_airstrike" );
    level.player endon( "turn_off_airstrike" );
    level.player endon( "airstrike_second_point_confirmed" );
    level.player waittill( "airstrike_second_point_failure" );
    self notify( "kill_airstrike_trigger" );
    thread _id_4E01( 1 );
}

_id_4E01( var_0 )
{
    level.player endon( "toggle_airstrike" );
    level.player endon( "turn_off_airstrike" );
    self endon( "kill_airstrike_trigger" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = getdvar( "a10_strike_controls" );

    if ( var_1 == "points" )
        level.player endon( "airstrike_first_point_failure" );

    if ( !var_0 )
        level.player waittill( "trigger_a10" );

    if ( var_1 == "points" )
    {
        if ( !var_0 )
            level.player waittill( "airstrike_first_point_confirmed" );

        maps\_audio::aud_send_msg( "a10_first_point_confirmed" );
        level.player notify( "airstrike_set_second_point" );
        childthread _id_4DF5();
        thread _id_4E2A();
        level.player waittill( "trigger_a10" );

        if ( var_1 == "points" )
            thread _id_4E00();

        level.player waittill( "airstrike_second_point_confirmed" );
    }

    maps\_audio::aud_send_msg( "a10_second_point_confirmed" );
    var_2 = getdvar( "airstrike_weapon", "a10" );

    if ( var_2 == "random" )
    {
        var_3 = [ "a10", "25mm", "40mm", "105mm", "hellfire", "artillery" ];
        var_2 = var_3[randomint( var_3.size )];
    }

    if ( _id_4E05( var_2 ) )
    {
        level.player notify( "airstrike_called" );
        var_4 = level._id_4DEB.origin;
        var_5 = level._id_4DEB.angles;

        if ( var_1 == "points" )
        {
            var_4 = level._id_4DF0.origin;
            var_5 = vectortoangles( level._id_4DF1.origin - level._id_4DF0.origin );
        }

        if ( var_2 == "a10" )
        {
            thread _id_4E13( var_4, var_5 );
            return;
        }

        if ( var_2 == "25mm" || var_2 == "40mm" || var_2 == "105mm" )
        {
            wait(level._id_4DD0);
            level.player notify( "airstrike_on_inbound" );
            var_6 = "ac130_" + var_2;
            var_7 = 300;
            var_8 = 12 + randomint( 4 );
            var_9 = 0.1;
            var_10 = 0;
            var_11 = [];
            var_12 = 1;

            if ( var_2 == "40mm" )
            {
                var_7 = 400;
                var_8 = 3;
                var_9 = 0.75;
                var_10 = 1;
                var_11 = [ 0.5, 0.4 ];
                var_12 = 0;
            }
            else if ( var_2 == "105mm" )
            {
                var_7 = 100;
                var_8 = 1;
                var_9 = 0.05;
                var_10 = 1;
                var_11 = [ 0.8, 0.6 ];
                var_12 = 0;
            }

            for ( var_13 = 0; var_13 < var_8; var_13 += 1 )
            {
                var_14 = var_6;
                var_15 = randomint( 3 );

                if ( var_15 == 1 )
                    var_14 += "_alt";
                else if ( var_15 == 2 )
                    var_14 += "_alt2";

                var_16 = var_4 + ( 0.0, 0.0, 1000.0 );
                var_17 = var_4 + ( randomfloat( var_7 ) - var_7 / 2, randomfloat( var_7 ) - var_7 / 2, 0 );
                magicbullet( var_14, var_16, var_17, level.player );

                if ( var_10 )
                    thread _id_4E03( var_11[0], var_11[1], var_17, 5000 );

                if ( var_12 )
                    thread _id_4E04( var_17, 128, 500, 100, level.player );

                wait(var_9);
            }

            return;
        }

        if ( var_2 == "hellfire" )
        {
            wait(level._id_4DD0);
            level.player notify( "airstrike_on_inbound" );
            var_18 = 200;
            var_8 = randomint( 2 ) + 3;
            var_9 = 0.8;
            var_19 = "hellfire_missile_af_caves_end";
            var_20 = randomint( 360 );
            var_21 = ( cos( var_20 ), sin( var_20 ), 0 );

            for ( var_13 = 0; var_13 < var_8; var_13 += 1 )
            {
                var_16 = var_4 + ( 0.0, 0.0, 1000.0 );
                var_17 = var_4 + ( var_21[0] * var_18 * var_13, var_21[1] * var_18 * var_13, 0 );
                magicbullet( var_19, var_16, var_17, level.player );
                radiusdamage( var_17, 512, 1000, 100, level.player );
                earthquake( 0.5, 0.5, var_17, 5000 );
                wait(var_9);
            }

            return;
        }

        if ( var_2 == "artillery" )
        {
            wait(level._id_4DD0);
            level.player notify( "airstrike_on_inbound" );
            var_7 = 400;
            var_8 = 3;
            var_9 = 1.15;
            var_22 = [ "artillery", "artillery_alt", "artillery_alt2", "artillery_alt3" ];

            for ( var_13 = 0; var_13 < var_8; var_13 += 1 )
            {
                var_17 = var_4 + ( randomfloat( var_7 ) - var_7 / 2, randomfloat( var_7 ) - var_7 / 2, 0 );
                radiusdamage( var_17, 256, 1000, 100, level.player );
                var_23 = level._effect[var_22[randomint( var_22.size )]];
                playfx( var_23, var_17 );
                earthquake( 0.3, 0.7, var_17, 3000 );
                thread common_scripts\utility::play_sound_in_space( "exp_artillery_underground_low", var_17 );
                wait(var_9);
            }

            return;
        }

        return;
        return;
        return;
    }
    else
    {
        thread _id_4E28();

        if ( var_1 == "points" )
        {
            level.player notify( "airstrike_path_fail" );

            if ( isdefined( level._id_4DF0 ) )
                playfxontag( common_scripts\utility::getfx( "a10_point_invalid_active" ), level._id_4DF0, "tag_origin" );

            if ( isdefined( level._id_4DF1 ) )
                playfxontag( common_scripts\utility::getfx( "a10_point_invalid_active" ), level._id_4DF1, "tag_origin" );

            if ( isdefined( level._id_4DF8 ) )
            {
                foreach ( var_25 in level._id_4DF8 )
                    playfx( common_scripts\utility::getfx( "a10_point_invalid_active" ), var_25.origin );
            }

            _id_4E21( 1 );

            if ( isdefined( level._id_4E02 ) )
                level._id_4E02.alpha = 0;

            if ( isdefined( level._id_4DDF ) )
                level._id_4DDF.alpha = 1;

            thread _id_4DED( 0 );
        }
        else
            thread _id_4E01();
    }
}

_id_4E03( var_0, var_1, var_2, var_3 )
{
    wait 0.35;
    earthquake( var_0, var_1, var_2, var_3 );
}

_id_4E04( var_0, var_1, var_2, var_3, var_4 )
{
    wait 0.4;
    radiusdamage( var_0, var_1, var_2, var_3, var_4 );
}

_id_4E05( var_0 )
{
    level.player endon( "toggle_airstrike" );
    var_1 = getdvar( "a10_strike_controls" );
    var_2 = level._id_4DEB.origin;

    if ( var_1 == "points" )
        var_2 = level._id_4DF0.origin;

    if ( var_0 == "a10" )
    {
        var_3 = level._id_4DD6;
        var_4 = level._id_4DEB.angles;

        if ( var_1 == "points" )
            var_4 = vectortoangles( level._id_4DF1.origin - level._id_4DF0.origin );

        var_5 = 1;

        for ( var_6 = undefined; var_5 < 4; var_5++ )
        {
            var_7 = 0;
            var_8 = ( 0.0, 0.0, 0.0 );
            var_9 = 0;
            level._id_4E06 = var_8;

            for ( level._id_4E07 = var_9; var_7 < 4; var_9 += level._id_4DD8 )
            {
                var_6 = _id_4E0B( var_2, var_4, var_8, var_9, var_5 );

                if ( _id_4E10( var_6 ) )
                {
                    level._id_4E08 = var_6;
                    level._id_4E06 = var_8;
                    level._id_4E07 = var_9;
                    break;
                }
                else if ( getdvarint( "a10_strike_debug", 0 ) == 4 )
                {

                }

                var_7++;
                var_6 = undefined;
                var_8 += level._id_4DD7;
            }

            if ( isdefined( var_6 ) )
                break;
        }

        return isdefined( var_6 );
    }
    else if ( var_0 == "25mm" || var_0 == "40mm" || var_0 == "105mm" )
    {
        var_10 = bullettrace( var_2 + ( 0.0, 0.0, 1000.0 ), var_2 + ( 0.0, 0.0, 16.0 ), 0, undefined );
        return var_10["fraction"] > 0.8;
        return 1;
    }

    return 1;
}

_id_4E09( var_0, var_1, var_2 )
{
    level endon( "airstrike_second_point_confirmed" );
    var_3 = anglestoright( common_scripts\utility::flat_angle( var_0 ) );
    var_4 = var_3 * 352;
    var_5 = -1 * var_3 * 352;
    var_6 = ( 0.8, 0.4, 0.2 );

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_1.size - 1; var_7++ )
        {

        }

        wait 0.05;
    }
}

_id_4E0A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_2[0] - var_3[0];
    var_6 = var_2[1] - var_3[1];
    var_7 = var_1 - var_4;
    var_8 = var_5 * cos( var_7[1] ) - var_6 * sin( var_7[1] ) + var_2[0];
    var_9 = var_5 * sin( var_7[1] ) + var_6 * cos( var_7[1] ) + var_2[1];
    var_10 = [];
    var_10[0] = var_0[0] - var_2[0] + var_8;
    var_10[1] = var_0[1] - var_2[1] + var_9;
    var_10[2] = var_3[2];
    return var_10;
}

_id_4E0B( var_0, var_1, var_2, var_3, var_4 )
{
    switch ( var_4 )
    {
        case 1:
            var_5 = _id_4E0E();
            level._id_4E0C = "berlin_a10_strafe_run_02";
            break;
        case 2:
            var_5 = _id_4E0F();
            level._id_4E0C = "berlin_a10_strafe_run_03";
            break;
        case 3:
            var_5 = _id_4E0D();
            level._id_4E0C = "berlin_a10_strafe_run_01";
            break;
        default:
            var_5 = _id_4E0D();
            level._id_4E0C = "berlin_a10_strafe_run_01";
            break;
    }

    var_6 = vectortoangles( ( -1.0, 0.0, 0.0 ) );
    var_7 = anglestoforward( common_scripts\utility::flat_angle( var_1 ) );

    foreach ( var_9 in var_5 )
    {
        if ( !isstring( var_9 ) )
        {
            var_10 = _id_4E0A( var_0, var_1, ( 0.0, 0.0, 0.0 ), var_9.origin, var_6 );
            var_9.origin = ( var_10[0], var_10[1], var_10[2] + var_2[2] ) + -1 * var_7 * var_3;
        }
    }

    return var_5;
}

_id_4E0D()
{
    var_0 = [];
    var_0[0] = spawnstruct();
    var_0[0].origin = ( -10056.9, 13.1325, 3909.61 );
    var_0[1] = spawnstruct();
    var_0[1].origin = ( -9288.56, 28.2926, 4284.37 );
    var_0[2] = spawnstruct();
    var_0[2].origin = ( -8548.17, 26.452, 4561.41 );
    var_0[3] = spawnstruct();
    var_0[3].origin = ( -7788.31, 18.3251, 4736.73 );
    var_0[4] = spawnstruct();
    var_0[4].origin = ( -6989.26, 14.8047, 4819.12 );
    var_0[5] = spawnstruct();
    var_0[5].origin = ( -6177.03, 23.9315, 4790.79 );
    var_0[6] = spawnstruct();
    var_0[6].origin = ( -5367.89, 34.9308, 4624.75 );
    var_0[7] = spawnstruct();
    var_0[7].origin = ( -4570.5, 34.8316, 4224.46 );
    var_0[8] = spawnstruct();
    var_0[8].origin = ( -3783.61, 21.0125, 3497.92 );
    var_0[9] = spawnstruct();
    var_0[9].origin = ( -2993.69, 7.80361, 2642.02 );
    var_0[10] = spawnstruct();
    var_0[10].origin = ( -2188.99, 5.64912, 1936.23 );
    var_0[11] = spawnstruct();
    var_0[11].origin = ( -1369.55, 5.40654, 1306.5 );
    var_0[12] = spawnstruct();
    var_0[12].origin = ( -532.087, 5.53242, 895.056 );
    var_0[13] = spawnstruct();
    var_0[13].origin = ( 327.03, 6.24819, 937.038 );
    var_0[14] = spawnstruct();
    var_0[14].origin = ( 1200.39, 6.99051, 1209.14 );
    var_0[15] = spawnstruct();
    var_0[15].origin = ( 2107.8, 6.3943, 1653.24 );
    var_0[16] = spawnstruct();
    var_0[16].origin = ( 3048.03, 6.18817, 2146.4 );
    var_0[17] = spawnstruct();
    var_0[17].origin = ( 4014.69, 7.72807, 2638.88 );
    var_0[18] = spawnstruct();
    var_0[18].origin = ( 4996.06, 6.71646, 3117.33 );
    var_0[19] = spawnstruct();
    var_0[19].origin = ( 5982.0, -3.48998, 3558.96 );
    var_0[20] = spawnstruct();
    var_0[20].origin = ( 6971.07, -26.779, 4002.91 );
    var_0[21] = spawnstruct();
    var_0[21].origin = ( 7961.54, -28.7748, 4397.24 );
    var_0[22] = spawnstruct();
    var_0[22].origin = ( 8949.47, -25.9104, 4602.09 );
    var_0[23] = spawnstruct();
    var_0[23].origin = ( 9911.91, -28.1551, 4504.06 );
    return var_0;
}

_id_4E0E()
{
    var_0 = [];
    var_0[0] = spawnstruct();
    var_0[0].origin = ( -9091.65, -23.2342, 2924.63 );
    var_0[1] = spawnstruct();
    var_0[1].origin = ( -8429.11, -29.6148, 2884.12 );
    var_0[2] = spawnstruct();
    var_0[2].origin = ( -7754.02, -32.7071, 2793.82 );
    var_0[3] = spawnstruct();
    var_0[3].origin = ( -7045.23, -32.8687, 2669.79 );
    var_0[4] = spawnstruct();
    var_0[4].origin = ( -6319.91, -28.1018, 2518.06 );
    var_0[5] = spawnstruct();
    var_0[5].origin = ( -5587.42, -19.8092, 2349.16 );
    var_0[6] = spawnstruct();
    var_0[6].origin = ( -4854.06, -10.8168, 2174.63 );
    var_0[7] = spawnstruct();
    var_0[7].origin = ( -4124.35, -3.30188, 1995.74 );
    var_0[8] = spawnstruct();
    var_0[8].origin = ( -3392.13, 2.82406, 1793.46 );
    var_0[9] = spawnstruct();
    var_0[9].origin = ( -2654.41, 5.53648, 1600.61 );
    var_0[10] = spawnstruct();
    var_0[10].origin = ( -1912.24, 5.42406, 1436.0 );
    var_0[11] = spawnstruct();
    var_0[11].origin = ( -1167.66, 6.08207, 1285.22 );
    var_0[12] = spawnstruct();
    var_0[12].origin = ( -421.469, 5.42027, 1161.46 );
    var_0[13] = spawnstruct();
    var_0[13].origin = ( 327.288, 6.19893, 1101.52 );
    var_0[14] = spawnstruct();
    var_0[14].origin = ( 1074.6, 7.23231, 1101.37 );
    var_0[15] = spawnstruct();
    var_0[15].origin = ( 1821.74, 5.79744, 1139.21 );
    var_0[16] = spawnstruct();
    var_0[16].origin = ( 2564.38, 8.6126, 1234.25 );
    var_0[17] = spawnstruct();
    var_0[17].origin = ( 3303.87, 18.014, 1399.4 );
    var_0[18] = spawnstruct();
    var_0[18].origin = ( 4043.36, 27.5554, 1619.29 );
    var_0[19] = spawnstruct();
    var_0[19].origin = ( 4785.79, 33.332, 1869.76 );
    var_0[20] = spawnstruct();
    var_0[20].origin = ( 5535.7, 36.2899, 2122.15 );
    var_0[21] = spawnstruct();
    var_0[21].origin = ( 6296.13, 37.8413, 2354.19 );
    var_0[22] = spawnstruct();
    var_0[22].origin = ( 7068.21, 38.9115, 2553.21 );
    var_0[23] = spawnstruct();
    var_0[23].origin = ( 7853.21, 41.6815, 2708.55 );
    var_0[24] = spawnstruct();
    var_0[24].origin = ( 8650.68, 55.0736, 2800.63 );
    return var_0;
}

_id_4E0F()
{
    var_0 = [];
    var_0[0] = spawnstruct();
    var_0[0].origin = ( -9110.42, 29.6127, 4410.74 );
    var_0[1] = spawnstruct();
    var_0[1].origin = ( -8443.64, 24.4333, 4606.25 );
    var_0[2] = spawnstruct();
    var_0[2].origin = ( -7756.91, 18.272, 4606.93 );
    var_0[3] = spawnstruct();
    var_0[3].origin = ( -7037.71, 15.027, 4447.98 );
    var_0[4] = spawnstruct();
    var_0[4].origin = ( -6306.83, 21.478, 4158.94 );
    var_0[5] = spawnstruct();
    var_0[5].origin = ( -5577.11, 32.7816, 3770.47 );
    var_0[6] = spawnstruct();
    var_0[6].origin = ( -4856.11, 36.694, 3312.49 );
    var_0[7] = spawnstruct();
    var_0[7].origin = ( -4144.47, 27.9597, 2822.09 );
    var_0[8] = spawnstruct();
    var_0[8].origin = ( -3437.49, 14.1074, 2332.84 );
    var_0[9] = spawnstruct();
    var_0[9].origin = ( -2721.98, 6.54957, 1871.16 );
    var_0[10] = spawnstruct();
    var_0[10].origin = ( -1989.45, 5.55282, 1466.05 );
    var_0[11] = spawnstruct();
    var_0[11].origin = ( -1242.48, 5.18994, 1144.73 );
    var_0[12] = spawnstruct();
    var_0[12].origin = ( -489.53, 6.17668, 917.271 );
    var_0[13] = spawnstruct();
    var_0[13].origin = ( 275.15, 6.53617, 849.875 );
    var_0[14] = spawnstruct();
    var_0[14].origin = ( 1061.18, 7.11486, 936.346 );
    var_0[15] = spawnstruct();
    var_0[15].origin = ( 1887.17, 6.92493, 1097.46 );
    var_0[16] = spawnstruct();
    var_0[16].origin = ( 2753.27, 6.25139, 1303.29 );
    var_0[17] = spawnstruct();
    var_0[17].origin = ( 3649.27, 7.25302, 1584.16 );
    var_0[18] = spawnstruct();
    var_0[18].origin = ( 4564.32, 8.06856, 1930.43 );
    var_0[19] = spawnstruct();
    var_0[19].origin = ( 5488.54, 4.33213, 2304.48 );
    var_0[20] = spawnstruct();
    var_0[20].origin = ( 6409.78, -7.72615, 2700.24 );
    var_0[21] = spawnstruct();
    var_0[21].origin = ( 7315.35, -26.545, 3221.62 );
    var_0[22] = spawnstruct();
    var_0[22].origin = ( 8193.85, -29.4547, 3775.35 );
    var_0[23] = spawnstruct();
    var_0[23].origin = ( 9038.56, -22.9634, 4201.68 );
    var_0[24] = spawnstruct();
    var_0[24].origin = ( 9823.84, -25.876, 4347.68 );
    return var_0;
}

_id_4E10( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size - 1; var_1++ )
    {
        if ( !_id_4E11( var_0[var_1].origin, var_0[var_1 + 1].origin ) )
            return 0;
    }

    if ( !_id_4E12( var_0 ) )
        return 0;

    return 1;
}

_id_4E11( var_0, var_1 )
{
    if ( !sighttracepassed( var_0, var_1, 0, 0 ) )
        return 0;

    return 1;
}

_id_4E12( var_0 )
{
    var_1 = anglestoright( common_scripts\utility::flat_angle( level._id_4DEB.angles ) );
    var_2 = var_1 * 352;
    var_3 = -1 * var_1 * 352;

    for ( var_4 = 0; var_4 < var_0.size - 1; var_4++ )
    {
        var_5 = var_0[var_4].origin;
        var_6 = var_0[var_4 + 1].origin;

        if ( !_id_4E11( var_5 + var_2, var_6 + var_2 ) )
            return 0;

        if ( !_id_4E11( var_5 + var_3, var_6 + var_3 ) )
            return 0;
    }

    return 1;
}

_id_4E13( var_0, var_1 )
{
    thread maps\_audio::aud_send_msg( "a10_airstrike_requested" );
    stopfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF1, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "a10_point_invalid" ), level._id_4DF1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "a10_point_active" ), level._id_4DF1, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "a10_point" ), level._id_4DF0, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "a10_point_active" ), level._id_4DF0, "tag_origin" );

    if ( isdefined( level._id_4DF8 ) )
    {
        foreach ( var_3 in level._id_4DF8 )
        {
            stopfxontag( common_scripts\utility::getfx( "a10_green_line_active" ), var_3, "tag_origin" );
            stopfxontag( common_scripts\utility::getfx( "a10_red_line" ), var_3, "tag_origin" );
            playfxontag( common_scripts\utility::getfx( "a10_green_line_active" ), var_3, "tag_origin" );
        }
    }

    wait(level._id_4DD2);
    var_5 = var_1;
    var_6 = common_scripts\utility::flat_angle( var_5 );
    var_7 = anglestoforward( var_6 );
    var_8 = var_0 + -1 * var_7 * level._id_4DD9;
    var_9 = var_0 + var_7 * level._id_4DDA;
    var_10 = [ var_8, var_0, var_9 ];
    _id_4E17( var_10, level._id_4DD0 + 4, "allies" );
    wait(level._id_4DD0);
    level.player notify( "airstrike_on_inbound" );
    var_11 = 15700;
    var_12 = 512;
    var_13 = spawn( "script_origin", var_0 + -1 * var_7 * ( var_11 + level._id_4E07 ) + ( 0, 0, var_12 ) + level._id_4E06 );

    if ( !isdefined( level._id_4E14 ) )
        level._id_4E14 = spawnstruct();

    level._id_4E14.origin = var_8;

    if ( !isdefined( level._id_4E15 ) )
        level._id_4E15 = spawnstruct();

    level._id_4E15.origin = var_9;
    var_13.angles = var_6;
    var_15 = getent( "a10_dynamic", "script_noteworthy" );
    level._id_4E16 = var_15 maps\_utility::_id_1FA3();
    level._id_4E16.angles = var_6;
    level._id_4E16._id_1032 = "a10";
    level._id_4E16 thread _id_4E18();
    maps\_utility::delaythread( 0.1, maps\_anim::_id_127B, level._id_4E16, level._id_4E0C, 1.3 );
    maps\_utility::delaythread( 3, ::_id_4E17, var_10, 5, "axis" );
    maps\_audio::aud_send_msg( "a10_airstrike_start", level._id_4E16 );
    var_13 maps\_anim::_id_1246( level._id_4E16, level._id_4E0C );
    level._id_4E16 delete();
    var_13 delete();
    level.player notify( "a10_anim_complete" );
}

_id_4E17( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
        badplace_cylinder( "", var_1, var_4, level._id_4DDB, 64, var_2 );
}

_id_4E18()
{
    var_0 = self.classname;
    var_1 = undefined;

    if ( isdefined( self._id_2992 ) )
        var_1 = self._id_2992;
    else if ( isdefined( level._id_2993 ) && isdefined( level._id_2993[var_0] ) )
        var_1 = level._id_2993;
    else if ( isdefined( level._id_2994[var_0] ) )
        var_1 = level._id_2994[var_0];

    if ( !isdefined( var_1 ) )
        return;

    var_2 = var_1.radius * 2;
    var_3 = -1 * var_1.radius;
    var_4 = spawn( "trigger_radius", self.origin + ( 0, 0, var_3 ), 0, var_1.radius, var_2 );
    var_4 enablelinkto();
    var_4 linkto( self );
    self._id_2991 = var_4;
    self._id_2991 = var_4;
    self endon( "death" );
    level._id_4E19 = self._id_2991;
    var_4.radius = self._id_29A7;

    for (;;)
    {
        var_4 waittill( "trigger" );
        self playrumblelooponentity( var_1._id_1441 );

        while ( level.player istouching( var_4 ) )
        {
            earthquake( self._id_29B6, self._id_29A6, self.origin, self._id_29A7 );
            wait(self._id_29A5 + randomfloat( self._id_29B5 ));
        }

        self stoprumble( var_1._id_1441 );
    }
}

_id_4E1A( var_0 )
{
    var_1 = [];
    wait 0.25;

    while ( isdefined( var_0 ) )
    {
        var_2 = var_0 gettagorigin( "tag_gun" );
        var_1 = maps\_utility::_id_0BC3( var_1, var_2 );
        wait 0.25;
    }

    var_3 = 0;

    foreach ( var_5 in var_1 )
        var_3++;
}

_id_4E1B( var_0 )
{
    var_1 = var_0.angles;
    var_2 = common_scripts\utility::flat_angle( var_1 );
    var_3 = anglestoforward( var_2 );
    var_4 = distance( level._id_4E14.origin, level._id_4E15.origin );
    var_0 thread maps\berlin_util::_id_4E1C( "a10_muzzle_vfx_stop" );
    maps\_audio::aud_send_msg( "a10_airstrike_fire", var_0 );
    thread _id_4E1D();
    var_5 = [];
    var_5["water"] = common_scripts\utility::getfx( "a10_impact_water" );
    var_5["metal"] = common_scripts\utility::getfx( "a10_impact" );
    var_5["asphalt"] = common_scripts\utility::getfx( "a10_impact" );
    var_5["default"] = common_scripts\utility::getfx( "a10_impact" );
    var_6 = 64;
    var_7 = 0;
    var_8 = 0.07;
    var_9 = 0;
    level notify( "a10_muzzle_vfx_stop" );

    for (;;)
    {
        var_10 = level._id_4E14.origin + var_3 * var_7;

        if ( var_9 == 3 )
        {
            var_11 = bullettrace( var_10 + ( 0.0, 0.0, 512.0 ), var_10 - ( 0.0, 0.0, 4096.0 ), 0 );
            var_12 = var_11["surfacetype"];
            var_13 = var_5["default"];

            if ( isdefined( var_5[var_12] ) )
                var_13 = var_5[var_12];

            var_14 = var_11["position"];
            radiusdamage( var_14, 256, 50000, 40000, level.player, "MOD_EXPLOSIVE", level.player._id_1005 );
            playfx( var_13, var_14 );
            maps\_audio::aud_send_msg( "a10_airstrike_ground_impact", var_14 );
            var_9 = 0;
        }

        wait(var_8);
        var_7 += var_6;
        var_9++;

        if ( var_4 < var_7 )
            break;
    }

    level notify( "a10_gound_impacts_stop" );
}

_id_4E1D()
{
    if ( !isdefined( level._id_4E1E ) )
        level._id_4E1E = 0;

    level notify( "stop_a10_kill_watcher" );
    level endon( "stop_a10_kill_watcher" );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::_id_4E1F );
    wait 2;
    level notify( "stop_a10_kill_watcher" );
}

_id_4E1F()
{
    level endon( "stop_a10_kill_watcher" );

    if ( !isalive( self ) )
        return;

    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_1 ) && var_1 == "MOD_EXPLOSIVE" )
    {
        level._id_4E1E++;

        if ( level._id_4E1E == 9 )
            level.player thread maps\_utility::_id_1E39( "NEIN" );
    }
}

_id_4E20()
{
    var_0 = 128;
    var_1 = 6000;
    var_2 = level.player getplayerangles();
    var_3 = anglestoforward( var_2 );
    var_4 = level.player geteye();
    var_4 += var_3 * var_0;
    var_5 = var_4 + var_3 * var_1;
    var_6 = bullettrace( var_4, var_5, 1, level.player );
    var_7 = [];
    var_7["normal"] = ( 0.0, 0.0, 1.0 );
    var_7["pos"] = var_5;
    var_7["fraction"] = var_6["fraction"];

    if ( var_5[2] > 3500 )
        var_7["fraction"] = 1;

    var_7["entity"] = var_6["entity"];

    if ( level._id_4DDC )
    {
        if ( isdefined( var_7["entity"] ) && isdefined( var_7["entity"].team ) && var_7["entity"].team == "allies" )
            var_7["fraction"] = 1;
    }

    if ( var_6["fraction"] < 1 )
        var_7["pos"] = var_6["position"];

    return var_7;
}

_id_4E21( var_0 )
{
    if ( isdefined( level._id_4DEB ) )
        level._id_4DEB delete();

    if ( isdefined( level._id_4DF1 ) && level._id_4DD3 )
        level._id_4DF1.origin += ( 0.0, 0.0, -10000.0 );

    maps\_utility::delaythread( 0.05, ::_id_4DF3 );

    if ( isdefined( level._id_4DF0 ) && level._id_4DD3 )
        level._id_4DF0.origin += ( 0.0, 0.0, -10000.0 );

    maps\_utility::delaythread( 0.05, ::_id_4DF4 );
    _id_4E22( var_0 );
}

_id_4E22( var_0 )
{
    if ( isdefined( level._id_4DF8 ) )
    {
        foreach ( var_2 in level._id_4DF8 )
            thread _id_4DFE( var_2, var_0 );
    }
}

_id_4E23()
{
    level._id_4DCF = 1;
    var_0 = randomintrange( 0, 5 );

    switch ( var_0 )
    {
        case 0:
            maps\_utility::_id_11F4( "berlin_plt_targetaquired" );
            break;
        case 1:
            maps\_utility::_id_11F4( "berlin_plt_tallytarget" );
            break;
        case 2:
            maps\_utility::_id_11F4( "berlin_plt_contact" );
            break;
        case 3:
            maps\_utility::_id_11F4( "berlin_plt_tallyontarget" );
            break;
    }

    level._id_4DCF = 0;
}

_id_4E24()
{
    if ( !isdefined( level._id_4E25 ) || !level._id_4E25 )
    {
        level._id_4DCF = 1;
        var_0 = randomintrange( 0, 4 );

        switch ( var_0 )
        {
            case 0:
                maps\_utility::_id_11F4( "berlin_plt_inposition2" );
                break;
            case 1:
                maps\_utility::_id_11F4( "berlin_plt_standingby3" );
                break;
            case 2:
                maps\_utility::_id_11F4( "berlin_plt_ready" );
                break;
            case 3:
                maps\_utility::_id_11F4( "berlin_plt_standingby4" );
                break;
        }

        level._id_4DCF = 0;
    }
}

_id_4E26()
{
    if ( !isdefined( level._id_4DCF ) || !level._id_4DCF )
    {
        level._id_4E27 = 1;
        level._id_4DCF = 1;
        var_0 = randomintrange( 0, 5 );

        switch ( var_0 )
        {
            case 0:
                maps\_utility::_id_11F4( "berlin_plt_notinposition2" );
                break;
            case 1:
                maps\_utility::_id_11F4( "berlin_plt_negative" );
                break;
            case 2:
                maps\_utility::_id_11F4( "berlin_plt_circleback" );
                break;
            case 3:
                maps\_utility::_id_11F4( "berlin_plt_notinposition" );
                break;
            case 4:
                maps\_utility::_id_11F4( "berlin_plt_holdfast" );
                break;
        }

        level._id_4DCF = 0;
        level._id_4E27 = 0;
    }
}

_id_4E28()
{
    if ( !isdefined( level._id_4E29 ) || !level._id_4E29 )
    {
        level._id_4E29 = 1;
        level._id_4DCF = 1;
        var_0 = randomintrange( 0, 7 );

        switch ( var_0 )
        {
            case 0:
                maps\_utility::_id_11F4( "berlin_plt_altattack" );
                break;
            case 1:
                maps\_utility::_id_11F4( "berlin_plt_maxeffects" );
                break;
            case 2:
                maps\_utility::_id_11F4( "berlin_plt_reciprocal" );
                break;
            case 3:
                maps\_utility::_id_11F4( "berlin_plt_unable" );
                break;
            case 4:
                maps\_utility::_id_11F4( "berlin_plt_newrunin" );
                break;
            case 5:
                maps\_utility::_id_11F4( "berlin_plt_badapproach" );
                break;
            case 6:
                maps\_utility::_id_11F4( "berlin_plt_direction" );
                break;
        }

        level._id_4DCF = 0;
        level._id_4E29 = 0;
    }
}

_id_4E2A()
{
    level._id_4DDF.alpha = 0;

    if ( !isdefined( level._id_4E02 ) )
    {
        level._id_4E02 = maps\_hud_util::createfontstring( "default", 2 );
        level._id_4E02 maps\_hud_util::setpoint( "TOP", undefined, 0, 80 );
        level._id_4E02.label = &"BERLIN_DIRECT_A10_POINTS";
        level._id_4E02.alpha = 1;
        level._id_4E02.sort = 0.5;
    }
    else
        level._id_4E02.alpha = 1;
}

_id_4E2B()
{
    if ( isdefined( level._id_4DDF ) )
        level._id_4DDF.alpha = 0;

    if ( isdefined( level._id_4E02 ) )
        level._id_4E02.alpha = 0;

    if ( isdefined( level._id_4DDE ) )
        level._id_4DDE.alpha = 0;
}

_id_4E2C()
{
    if ( isdefined( level._id_4DDE ) && level._id_4DDF.alpha != 1 )
        level._id_4DDE.alpha = 1;
}

_id_4E2D()
{
    level.player endon( "turn_off_airstrike" );
    level.player endon( "toggle_airstrike" );
    level.player endon( "airstrike_deactivated" );
    level.player endon( "airstrike_called" );
    level.player notifyonplayercommand( "LISTEN_switch_weapons", "weapnext" );
    level.player waittill( "LISTEN_switch_weapons" );
    level.player notify( "toggle_airstrike" );
}

_id_4E2E()
{
    level.player endon( "airstrike_called" );
    level.player endon( "turn_off_airstrike" );
    level.player endon( "toggle_airstrike" );
    level.player endon( "airstrike_deactivated" );

    for (;;)
    {
        if ( level.player getcurrentweapon() != level.player getcurrentprimaryweapon() )
        {
            level.player notify( "toggle_airstrike" );
            break;
        }

        wait 0.05;
    }
}

_id_4E2F()
{
    level.player unlink();
    level._id_4DE8 delete();
    level._id_4DE8 = undefined;
}

_id_4E30( var_0 )
{
    if ( var_0 == "ads" )
        self allowads( 0 );

    self allowfire( 0 );
    self allowmelee( 0 );
}

_id_4E31( var_0 )
{
    self allowmelee( 1 );
    self allowfire( 1 );

    if ( var_0 == "ads" )
        self allowads( 1 );
}

_id_4E32()
{
    level._id_4E33 = 1.25;
    precacheshader( "uav_vertical_meter" );
    precacheshader( "uav_horizontal_meter" );
    precacheshader( "uav_arrow_up" );
    precacheshader( "uav_arrow_left" );
    precacheshader( "uav_vehicle_target" );
    precacheshader( "veh_hud_friendly" );
    precacheshader( "veh_hud_target" );
    precacheshader( "nightvision_overlay_goggles" );
    precacheshader( "laser_designator_overlay_lr" );
    precacheshader( "laser_designator_overlay_hr" );
    precacheshader( "remotemissile_infantry_target" );
    setsaveddvar( "thermalBlurFactorNoScope", 50 );
    common_scripts\utility::flag_init( "a10_interface_enabled" );
}

_id_4E34()
{
    self endon( "death" );
    level endon( "a10_view_disabled" );
    var_0 = 0.2;
    var_1 = 51.5029;
    var_2 = 0.000250787;

    for (;;)
    {
        if ( common_scripts\utility::flag( "a10_interface_enabled" ) )
        {
            if ( isdefined( level._id_4DEB ) )
                var_3 = level._id_4DEB.origin;
            else
                var_3 = ( 0.0, 0.0, 0.0 );
        }

        wait(var_0);
    }
}

_id_4E35( var_0 )
{
    var_1 = self getplayerangles();
    var_2 = self.angles[0] - var_1[0] * -1;
    var_3 = angleclamp180( self.angles[1] );
    _id_4E47( "arrow_left", int( var_2 ) );
    _id_4E47( "arrow_up", int( var_3 ) );
    var_4 = self._id_4E36["vert_meter"];
    var_5 = self._id_4E36["arrow_left"];
    var_2 = clamp( var_2, var_4._id_4E38, var_4._id_4E37 );
    var_6 = abs( var_2 / var_4._id_298F );
    var_7 = var_4._id_4E39 * var_6;
    var_8 = var_7 - var_4._id_4E39 * 0.5;
    var_9 = var_4.y + var_8;
    var_5 moveovertime( 0.2 );
    var_5.y = var_9;
    var_5._id_44DF moveovertime( var_0 );
    var_5._id_44DF.y = var_9;
    var_10 = self._id_4E36["horz_meter"];
    var_11 = self._id_4E36["arrow_up"];
    var_6 = var_3 / var_10._id_298F;
    var_7 = var_10._id_4E39 * var_6;
    var_12 = var_10.x + var_7;
    var_11 moveovertime( 0.2 );
    var_11.x = var_12;
    var_11._id_44DF moveovertime( var_0 );
    var_11._id_44DF.x = var_12;
}

_id_4E3A( var_0 )
{
    if ( var_0 == 0 )
        return 0;

    return var_0 / 12;
}

_id_4E3B( var_0 )
{
    return var_0 * 0.0254;
}

_id_4E3C( var_0 )
{
    return var_0 * 0.000539957;
}

_id_4E3D( var_0, var_1 )
{
    var_0 = int( var_0 * var_1 ) / var_1;
    return var_0;
}

_id_4E3E()
{
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "actionSlotsHide", "0" );
    setsaveddvar( "hud_showStance", "0" );
}

_id_4E3F()
{
    setsaveddvar( "hud_showStance", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
    setsaveddvar( "ammoCounterHide", "1" );
}

_id_4E40()
{
    maps\_utility::delaythread( 0.9, maps\_introscreen::_id_1D97, 0.1, 0.1, 0.1 );
    _id_4E53();
    thread _id_4E41();
    _id_4E3F();
    self._id_4E36 = [];
    var_0 = "laser_designator_overlay_lr";

    if ( level._id_4DD4 )
    {
        sethudlighting( 1 );
        var_0 = "laser_designator_overlay_hr";
    }

    self._id_4E36["static_goggles"] = _id_4E43( var_0, 1, 1 );
    self._id_4E36["static_grain"] = _id_4E43( "nightvision_overlay_goggles", 0, 0.2 );
    common_scripts\utility::flag_set( "a10_interface_enabled" );
    thread _id_4E5F();
    thread _id_4E34();
}

_id_4E41()
{
    self endon( "death" );
    level endon( "a10_view_disabled" );
    var_0 = 0.75;
    var_1 = 0.75;
    var_2 = 0.3;
    var_3 = 0.3;
    var_4 = 0.5;
    var_5 = 0.5;
    var_6 = 1;

    for (;;)
    {
        if ( level.player adsbuttonpressed() && var_6 == 0 )
        {
            setsaveddvar( "cg_playerFovScale0", var_0 );
            level.player enableslowaim( var_2, var_3 );
            var_6 = 1;
        }
        else if ( !level.player adsbuttonpressed() && var_6 == 1 )
        {
            setsaveddvar( "cg_playerFovScale0", var_1 );
            level.player enableslowaim( var_4, var_5 );
            var_6 = 0;
        }

        wait 0.05;
    }
}

_id_4E42()
{
    setsaveddvar( "cg_playerFovScale0", 1 );
    level.player disableslowaim();
}

_id_4E43( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3.sort = var_1;
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = var_2;
    var_3 setshader( var_0, 640, 480 );
    return var_3;
}

_id_4E44()
{
    var_0 = newhudelem();
    var_0.x = 320;
    var_0.y = 80;
    var_0.sort = 0;
    var_0.alignx = "center";
    var_0.aligny = "bottom";
    var_0 setshader( "uav_horizontal_meter", 96, 16 );
    return var_0;
}

_id_4E45()
{
    var_0 = newhudelem();
    var_0.x = 40;
    var_0.y = 240;
    var_0.sort = 0;
    var_0.alignx = "right";
    var_0.aligny = "middle";
    var_0 setshader( "uav_vertical_meter", 16, 96 );
    return var_0;
}

_id_4803()
{
    var_0 = newhudelem();
    var_0.x = 320;
    var_0.y = 240;
    var_0.sort = 0;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0 setshader( "uav_crosshair", 320, 240 );
    return var_0;
}

_id_4E46( var_0, var_1 )
{
    self._id_4E36["lower_right"][var_0]._id_44DF setvalue( var_1 );
}

_id_4E47( var_0, var_1 )
{
    self._id_4E36[var_0]._id_44DF setvalue( var_1 );
}

_id_4E48()
{
    var_0 = [];
    var_0["nar"] = [ "NAR", "none" ];
    var_0["white"] = [ "WHT", "none" ];
    var_0["rate"] = [ "RATE", "none" ];
    var_0["angle"] = [ "ANGLE", "none" ];
    var_0["numbers"] = [ "NUM", "none" ];
    var_0["temp"] = [ "TEMP", "none" ];
    return _id_4E4B( var_0, 10, 80, "left" );
}

_id_4E49()
{
    var_0 = [];
    var_0["acft"] = [ "ACFT", "none" ];
    var_0["long"] = [ "N", "none" ];
    var_0["lat"] = [ "W", "none" ];
    var_0["angle"] = [ "HAT", "none" ];
    return _id_4E4B( var_0, 510, 80, "left" );
}

_id_4E4A()
{
    var_0 = [];
    var_0["long"] = [ &"N", "none" ];
    var_0["lat"] = [ &"W", "none" ];
    var_1 = _id_4E4B( var_0, 500, 335, "left" );
    var_0 = [];
    var_0["brg"] = [ "BRG", "" ];
    var_0["rng_m"] = [ "RNG", "" ];
    var_0["rng_nm"] = [ "RNG", "" ];
    var_0["elv"] = [ "ELV", "" ];
    var_2 = _id_4E4B( var_0, 510, 360, "right" );

    foreach ( var_5, var_4 in var_2 )
        var_1[var_5] = var_4;

    return var_1;
}

_id_4E4B( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_5 = 10 * level._id_4E33;

    foreach ( var_9, var_7 in var_0 )
    {
        var_8 = newhudelem();
        var_8.x = var_1;
        var_8.y = var_2;
        var_8.alignx = var_3;
        var_8.aligny = "middle";
        var_8.color = ( 1.0, 1.0, 1.0 );
        var_8.fontscale = level._id_4E33;
        var_8 settext( var_7[0] );

        if ( isdefined( var_7[1] ) )
        {
            if ( !_id_4E4C( var_7[1], "none" ) )
                var_8 _id_4E4D( var_7[1] );
        }
        else
            var_8 _id_4E4D();

        var_4[var_9] = var_8;
        var_2 += var_5;
    }

    return var_4;
}

_id_4E4C( var_0, var_1 )
{
    if ( isstring( var_0 ) )
    {
        if ( var_0 == var_1 )
            return 1;
    }

    return 0;
}

_id_4E4D( var_0 )
{
    var_1 = 75;

    if ( isdefined( var_0 ) && !_id_4E4C( var_0, "" ) )
    {
        var_2 = newhudelem();
        var_2.x = self.x + var_1;
        var_2.y = self.y;
        var_2.alignx = "right";
        var_2.aligny = "middle";
        var_2.fontscale = level._id_4E33;
        var_2 settext( var_0 );
        self._id_44E0 = var_2;
        var_3 = 1;

        if ( var_0 == "UAV_NM" )
            var_3 = 2;

        var_1 -= 10 * var_3;
    }

    var_4 = newhudelem();
    var_4.x = self.x + var_1;
    var_4.y = self.y;
    var_4.alignx = "right";
    var_4.aligny = "middle";
    var_4.fontscale = level._id_4E33;
    var_4 setvalue( 0 );
    self._id_44DF = var_4;
}

_id_4E4E( var_0 )
{
    if ( var_0 == "up" )
    {
        var_1 = "uav_arrow_up";
        var_2 = self._id_4E36["horz_meter"];
        var_3 = 320;
        var_4 = var_2.y + 10;
        var_5 = "center";
        var_6 = "top";
    }
    else
    {
        var_1 = "uav_arrow_left";
        var_2 = self._id_4E36["vert_meter"];
        var_3 = var_2.x + 10;
        var_4 = 240;
        var_5 = "left";
        var_6 = "middle";
    }

    var_7 = newhudelem();
    var_7.x = var_3;
    var_7.y = var_4;
    var_7.alignx = var_5;
    var_7.aligny = var_6;
    var_7 setshader( var_1, 16, 16 );
    var_7 _id_4E4F( var_0 );
    return var_7;
}

_id_4E4F( var_0 )
{
    if ( var_0 == "up" )
    {
        var_1 = self.x;
        var_2 = self.y + 16;
        var_3 = "center";
        var_4 = "top";
    }
    else
    {
        var_1 = self.x + 16;
        var_2 = self.y;
        var_3 = "left";
        var_4 = "middle";
    }

    var_5 = newhudelem();
    var_5.x = var_1;
    var_5.y = var_2;
    var_5.alignx = var_3;
    var_5.aligny = var_4;
    var_5 setvalue( 0 );
    self._id_44DF = var_5;
}

_id_4E50()
{
    common_scripts\utility::flag_clear( "a10_interface_enabled" );
    level notify( "a10_view_disabled" );
    self disableslowaim();

    if ( self getcurrentweapon() == "a10_designator_ads" )
    {
        thread maps\_introscreen::_id_1D97( 0.1, 0.1, 0.1 );
        wait 0.2;
    }

    _id_4E5E();
    _id_4E3E();

    if ( isdefined( self._id_4E36 ) )
    {
        foreach ( var_1 in self._id_4E36 )
        {
            if ( isdefined( var_1 ) )
            {
                if ( isarray( var_1 ) )
                {
                    foreach ( var_3 in var_1 )
                        _id_4E51( var_3 );

                    var_1 = undefined;
                    continue;
                }

                _id_4E51( var_1 );
            }
        }
    }

    sethudlighting( 0 );
    _id_4E42();
    _id_4E54();
    _id_4E52();
}

_id_4E51( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_44DF ) )
        var_0._id_44DF destroy();

    if ( isdefined( var_0._id_44E0 ) )
        var_0._id_44E0 destroy();

    var_0 destroy();
}

_id_4E52()
{
    self enableweapons();
    self enableoffhandweapons();
    self freezecontrols( 0 );
}

_id_4E53()
{
    self._id_1005 = self getcurrentweapon();
    var_0 = "a10_designator_ads";
    level.player setactionslot( 4, "weapon", var_0 );
    level.player giveweapon( var_0 );
    level.player switchtoweapon( var_0 );
    level.player maps\_utility::_id_0A23( 1 );
    maps\_audio::aud_send_msg( "goggles_on" );
    self disableoffhandweapons();
    wait 1.2;
}

_id_4E54()
{
    var_0 = "a10_designator_ads";

    if ( self getcurrentweapon() == var_0 )
    {
        self switchtoweapon( self._id_1005 );
        level.player maps\_utility::_id_0A23( 0 );
        maps\_audio::aud_send_msg( "goggles_off" );
        wait 1;
    }

    level.player takeweapon( var_0 );
}

_id_4E55( var_0, var_1, var_2 )
{
    self endon( "death" );
    self notify( "stop_a10_target_tracking" );
    self endon( "stop_a10_target_tracking" );
    var_3 = 0.94;
    var_4 = 0.1;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    for (;;)
    {
        var_5 = var_0.origin + ( 0.0, 0.0, 60.0 );

        if ( isdefined( var_2 ) )
        {
            var_6 = anglestoforward( var_0.angles );
            var_5 = var_0.origin + var_6 * var_2;
        }

        var_7 = self.target_ent.origin * var_3 + var_5 * ( 1.0 - var_3 );
        self.target_ent moveto( var_7, var_4 );
        wait(var_4);
    }
}

_id_4E56( var_0 )
{

}

_id_4E57( var_0 )
{
    if ( !isdefined( self._id_4E58 ) )
    {
        if ( !isdefined( level._id_4E59 ) )
            level._id_4E59 = 0;

        self._id_4E58 = level._id_4E59;
        level._id_4E59++;
    }

    return self._id_4E58;
}

a10_add_target()
{
    level._id_4DE0[_id_4E57( self )] = self;
}

a10_remove_target_ondeath()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        _id_4E5C();
}

_id_4E5C()
{
    _id_4E5D();
    level._id_4DE0[_id_4E57( self )] = undefined;
}

_id_4E5D()
{
    if ( isdefined( self._id_3C3D ) )
    {
        self._id_3C3D = undefined;
        target_remove( self );
    }
}

_id_4E5E()
{
    level notify( "stop_draw_a10_targets" );

    foreach ( var_1 in level._id_4DE0 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _id_4E5D();
    }
}

_id_4E5F()
{
    level endon( "stop_draw_a10_targets" );
    var_0 = 4;
    var_1 = 0;
    var_2 = 0.05;

    for (;;)
    {
        foreach ( var_4 in level._id_4DE0 )
        {
            if ( !isdefined( var_4 ) )
                continue;

            var_4 _id_3C3C( level.player );
            var_1++;

            if ( var_1 >= var_0 )
            {
                var_1 = 0;
                wait(var_2);
            }
        }

        wait 0.05;
    }
}

_id_3C3C( var_0 )
{
    if ( isdefined( self._id_3C3D ) && self._id_3C3D )
        return;

    self._id_3C3D = 1;
    target_set( self, ( 0.0, 0.0, 32.0 ) );

    if ( isai( self ) || self.code_classname == "script_model" )
    {
        if ( self.team == "axis" )
            target_setshader( self, "remotemissile_infantry_target" );
        else
            target_setshader( self, "veh_hud_friendly" );
    }
    else if ( isplayer( self ) )
        target_setshader( self, "hud_fofbox_self_sp" );
    else if ( self.code_classname == "script_vehicle" )
    {
        if ( self.script_team == "axis" )
            target_setshader( self, "veh_hud_target" );
        else
            target_setshader( self, "veh_hud_friendly" );
    }
    else
        target_setshader( self, "veh_hud_target" );

    target_showtoplayer( self, var_0 );
}

_id_4E60()
{
    _id_4E5E();

    foreach ( var_1 in level._id_4DE0 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _id_4E5C();
    }

    level._id_4DE0 = [];
}
