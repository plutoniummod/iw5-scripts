// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4E1C( var_0 )
{
    level endon( var_0 );
    var_1 = common_scripts\utility::getfx( "a10_muzzle_flash" );

    for (;;)
    {
        playfxontag( var_1, self, "tag_gun" );
        wait 0.05;
    }
}

_id_4E61( var_0, var_1 )
{
    level.player playfx( level._effect["a10_impact"], var_0.origin );
    var_0 radiusdamage( var_0.origin, 512, 500, 100, level.player );
}

_id_4E62()
{
    var_0 = common_scripts\utility::getfx( "f15_missile" );
    playfxontag( var_0, self, "tag_origin" );
}

_id_4E63()
{
    iprintln( "berlin rappel has been disabled, remove this and include a glock to enable!" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "hud_drawhud", 0 );
    level.player disableweapons();
    level.player disableoffhandweapons();
    level.player disableweaponswitch();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_0 = level.player getstance();
    level.player setstance( "stand" );

    if ( var_0 != "stand" )
        wait 0.5;

    var_1 = level.player getcurrentweapon();
    level.player giveweapon( level._id_4E64 );
    level.player givemaxammo( level._id_4E64 );
    level.player switchtoweapon( level._id_4E64 );
    var_2 = getent( "rappel_animent", "targetname" );
    var_3 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_3 dontcastshadows();
    var_4 = maps\_utility::_id_1287( "rope_rappel", level.player.origin );
    var_4 dontcastshadows();
    var_5[0] = var_3;
    var_5[1] = var_4;
    common_scripts\utility::flag_set( "player_hooking_up" );
    _id_4E69( var_2, var_5 );
    common_scripts\utility::flag_set( "player_hooked_up" );
    var_6 = getent( "trigger_rappel_end", "targetname" );
    common_scripts\utility::flag_set( "descending" );
    var_7 = getent( "rappel_start", "targetname" );
    var_7.origin = level.player.origin;
    var_4.origin = level.player.origin;
    var_4 linkto( var_7 );
    var_3 unlink();
    var_3.origin = level.player.origin;
    var_3 linkto( var_7 );
    var_8 = 0.05;
    level.player._id_4E65 = "starting";
    level.player._id_4E66 = 0;
    var_3 _id_4E68( 0, var_8, var_5 );
    var_9 = level.player.angles;
    level.player playerlinkto( var_7, undefined, 1, 60, 10, 90, 20 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player playersetgroundreferenceent( var_7 );
    level.player setplayerangles( ( 0.0, 0.0, 0.0 ) );
    thread _id_4E67( var_6 );
    level.player enableweapons();
    var_10 = 10 / var_8;
    var_11 = distance( var_7.origin, var_6.origin );
    var_12 = var_11 / var_10;

    while ( !common_scripts\utility::flag( "rappel_over" ) && level.player.origin[2] > 0 )
    {
        var_13 = level.player adsbuttonpressed();
        var_14 = var_12;

        if ( var_13 )
            var_14 /= 1.5;

        var_3 _id_4E68( var_13, var_8, var_5 );
        var_15 = var_7.origin;
        var_15 -= ( 0, 0, var_14 );
        var_7.origin = var_15;
        var_3.origin = var_7.origin;
        var_4.origin = var_7.origin;
        wait(var_8);
    }

    common_scripts\utility::flag_set( "rappel_over" );
    level.player disableweapons();
    _id_4E6A( var_6 );
    level.player switchtoweapon( var_1 );
    level.player takeweapon( level._id_4E64 );
    level.player enableoffhandweapons();
    level.player enableweaponswitch();
    level.player playersetgroundreferenceent( undefined );
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player unlink();
    var_3 unlink();
    wait 0.8;
    level.player unlink();
    var_3 delete();
    var_4 delete();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "actionSlotsHide", 0 );
    setsaveddvar( "hud_showStance", 1 );
    setsaveddvar( "hud_drawhud", 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player enableweapons();
}

_id_4E67( var_0 )
{
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "rappel_over" );
}

_id_4E68( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
    {
        var_2 = [];
        var_2[0] = self;
    }

    var_3 = 0.5;
    var_4 = 0.5;
    level.player._id_4E66 += var_1;
    var_5 = level.player._id_4E65;
    var_6 = level.player._id_4E66;

    if ( var_0 )
    {
        if ( var_5 == "stopped" )
        {

        }
        else if ( var_5 == "stopping" )
        {
            if ( var_6 > var_4 )
            {
                var_5 = "stopped";
                var_6 = 0;
                self notify( "stop_idle" );
                thread maps\_utility::_id_1414();
                thread maps\_anim::_id_11D6( var_2, "stop_idle" );
            }
        }
        else if ( var_5 == "starting" )
        {
            var_5 = "stopping";
            var_6 = 0;
            thread maps\_utility::_id_1414();
            thread maps\_anim::_id_11DD( var_2, "walk_to_stop" );
        }
        else if ( var_5 == "walking" )
        {
            var_5 = "stopping";
            var_6 = 0;
            thread maps\_utility::_id_1414();
            thread maps\_anim::_id_11DD( var_2, "walk_to_stop" );
        }
    }
    else if ( var_5 == "stopped" )
    {
        var_5 = "starting";
        var_6 = 0;
        thread maps\_utility::_id_1414();
        thread maps\_anim::_id_11DD( var_2, "stop_to_walk" );
    }
    else if ( var_5 == "stopping" )
    {
        var_5 = "starting";
        var_6 = 0;
        thread maps\_utility::_id_1414();
        thread maps\_anim::_id_11DD( var_2, "stop_to_walk" );
    }
    else if ( var_5 == "starting" )
    {
        if ( var_6 > var_4 )
        {
            var_5 = "walking";
            var_6 = 0;
            self notify( "stop_idle" );
            thread maps\_utility::_id_1414();
            thread maps\_anim::_id_11D6( var_2, "walk_idle" );
        }
    }
    else if ( var_5 == "walking" )
    {

    }

    level.player._id_4E65 = var_5;
    level.player._id_4E66 = var_6;
}

_id_4E69( var_0, var_1 )
{
    var_2 = maps\_utility::_id_1287( "player_legs", level.player.origin );
    var_2 dontcastshadows();
    var_3 = maps\_utility::_id_1287( "rope_hookup", level.player.origin );
    var_3 dontcastshadows();
    var_4 = maps\_utility::_id_1287( "rope_coil", level.player.origin );
    var_4 dontcastshadows();
    var_1[var_1.size] = var_2;
    var_1[var_1.size] = var_3;
    var_1[var_1.size] = var_4;
    level.player playerlinktoblend( var_1[0], "tag_player", 0.5, 0.2, 0.2 );

    foreach ( var_6 in var_1 )
        thread debug_line( var_6, var_0.origin, 10 );

    var_0 maps\_anim::_id_11DD( var_1, "rappel_hookup" );
    level.player unlink();
    level notify( "clear_rappel_debug" );
    var_2 delete();
    var_3 delete();
    var_4 delete();
}

_id_4E6A( var_0 )
{
    var_1 = maps\_utility::_id_1287( "player_rig", var_0.origin );
    var_1 hide();
    var_2 = maps\_utility::_id_1287( "rope_rappel", var_0.origin );
    var_2 hide();
    var_2 linkto( var_1 );
    var_3[0] = var_1;
    var_3[1] = var_2;
    var_1 common_scripts\utility::delaycall( 0.6, ::show );
    var_2 common_scripts\utility::delaycall( 0.6, ::show );
    level.player setplayerangles( var_1.angles );
    level.player playerlinktoblend( var_1, "tag_player", 0.5, 0.2, 0.2 );
    var_0 maps\_anim::_id_11DD( var_3, "rappel_unhook" );
    level notify( "clear_rappel_debug" );
    level.player unlink();
    level.player setplayerangles( var_1.angles );
    var_1 delete();
    var_2 delete();
}

debug_line( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 1.0, 1.0, 1.0 );

    for ( var_4 = 0; var_4 < var_2 * 20; var_4++ )
    {
        if ( !isdefined( var_0 ) )
            break;

        wait 0.05;
    }
}

_id_4E6B()
{
    wait 1.0;
    level endon( "stop_drone_spawner" );
    var_0 = undefined;
    var_1 = getent( self.script_noteworthy, "targetname" );
    thread _id_4E6D();

    for (;;)
    {
        if ( !isdefined( self._id_4E6C ) || !isalive( self._id_4E6C ) )
        {
            self.count++;
            self._id_4E6C = maps\_utility::_id_166F();
            self._id_4E6C.spawner = self;
            self._id_4E6C thread _id_4E6E( var_1 );
        }

        wait 8.0;
    }
}

_id_4E6D()
{
    level waittill( "stop_drone_spawner" );

    if ( isdefined( self._id_4E6C ) )
        self._id_4E6C delete();

    self._id_4E6C = undefined;
}

_id_4E6E( var_0 )
{
    self endon( "death" );
    self._id_4E6F = 350;

    if ( isdefined( self._id_16A6 ) )
        self._id_4E6F = self._id_16A6;

    self._id_4E70 = 45;

    if ( isdefined( self._id_16A5 ) )
        self._id_4E70 = self._id_16A5;

    self._id_4E71 = var_0;
    thread _id_4E73();
    childthread _id_2043();
    childthread _id_4E72();
    childthread _id_4E76();
}

_id_4E72()
{
    self waittill( "goal" );
}

_id_4E73()
{
    self waittill( "death" );
    wait 5.0;

    if ( isdefined( self ) )
        self delete();
}

_id_4E74( var_0 )
{
    var_1 = self.team;

    if ( !isdefined( var_1 ) )
        var_1 = self.script_team;

    if ( var_1 == "axis" )
        return "allies";

    return "axis";
}

_id_4E75( var_0 )
{
    var_1 = var_0 maps\_utility::_id_278A( _id_4E74() );
    return var_1;
}

_id_4E76()
{
    for (;;)
    {
        self waittill( "firing" );
        var_0 = _id_4E78();

        if ( isdefined( var_0 ) )
        {
            var_1 = 1;
            var_2 = vectornormalize( var_0.origin - self.origin );
            var_3 = vectortoangles( var_2 );
            self rotateto( var_3, var_1, var_1 / 3, var_1 / 3 );
            var_4 = self._id_4E70;
            var_0 dodamage( var_4, self.origin, self );
        }
    }
}

_id_2043()
{
    while ( !isdefined( self._id_2046 ) || !self._id_2046 )
        wait 0.25;

    for (;;)
    {
        if ( isdefined( _id_4E78() ) )
        {
            if ( !isdefined( self._id_4E77 ) || !self._id_4E77 )
            {
                self notify( "drone_stop" );
                thread maps\_drone::_id_2015( self._id_2047, self.origin );
                self._id_4E77 = 1;
            }

            wait 3.0;
        }
        else if ( isdefined( self._id_4E77 ) && self._id_4E77 )
        {
            self notify( "stop_drone_fighting" );

            if ( isdefined( self._id_2047["target"] ) )
            {
                self.target = self._id_2047["target"];
                thread maps\_drone::_id_2043();
            }

            self._id_4E77 = 0;
        }

        wait(randomfloatrange( 0.9, 1.5 ));
    }
}

_id_4E78()
{
    var_0 = self.origin + anglestoforward( self.angles ) * self._id_4E6F / 3;
    var_1 = _id_4E75( self._id_4E71 );
    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( !isalive( var_4 ) )
            continue;

        if ( distance2d( var_0, var_4.origin ) < self._id_4E6F )
        {
            if ( sighttracepassed( self.origin + ( 0.0, 0.0, 64.0 ), var_4.origin + ( 0.0, 0.0, 40.0 ), 0, self ) )
            {
                var_2 = var_4;
                break;
            }

            wait 0.05;
        }
    }

    return var_2;
}

_id_4E79( var_0, var_1 )
{
    level endon( "stop_battlefield_effects" );

    if ( !isdefined( var_1 ) )
        var_1 = 100;

    for (;;)
    {
        if ( randomfloat( 100 ) <= var_1 )
        {
            var_2 = level._effect["small_vehicle_explosion_nofire"];
            var_3 = 100;
            var_4 = 512;
            var_5 = 50;

            if ( common_scripts\utility::cointoss() )
            {
                if ( common_scripts\utility::cointoss() )
                {
                    var_3 = 200;
                    var_5 = 100;
                    var_4 = 256;
                    var_2 = level._effect["small_vehicle_explosion_nofire"];
                }
                else
                {
                    var_3 = 50;
                    var_5 = 50;
                    var_4 = 128;
                    var_2 = level._effect["small_vehicle_explosion_nofire"];
                }
            }
            else if ( common_scripts\utility::cointoss() )
            {
                var_3 = 80;
                var_5 = 150;
                var_4 = 128;
                var_2 = level._effect["small_vehicle_explosion_nofire"];
            }
            else
            {
                var_3 = 150;
                var_5 = 300;
                var_4 = 512;
                var_2 = level._effect["a10_strike"];
            }

            var_6 = var_0 maps\_utility::_id_278A();

            if ( var_6.size > 0 )
            {
                var_7 = randomfloatrange( 0, 360 );
                var_8 = ( 0, var_7, 0 );
                var_8 = anglestoforward( var_8 );
                var_9 = var_6[randomint( var_6.size )];
                var_10 = var_9.origin + var_8 * var_3;
                level.player playfx( var_2, var_10 );
                wait 0.5;
                var_9 radiusdamage( var_10, var_4, var_5, var_5 / 5 );
            }
        }

        wait(randomfloatrange( 5.0, 10.0 ));
    }
}

_id_4E7A( var_0, var_1, var_2 )
{
    thread _id_4E7E();
    level endon( "color_volume_advance_stop" );
    var_3 = "allies";

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    for ( var_4 = var_2; var_4 <= var_1; var_4++ )
    {
        var_5 = var_0 + "_" + var_4;
        var_6 = getent( var_5, "targetname" );
        var_7 = getent( var_6.target, "targetname" );

        if ( !isdefined( var_6.trigger_off ) || var_6.trigger_off == 1 )
        {
            var_6 waittill( "trigger" );
            var_6 common_scripts\utility::trigger_off_proc();
        }

        var_8 = var_7 maps\_colors::_id_1355( var_7._id_1341, var_3 );
        var_9 = var_8["colorCodes"];
        var_10 = var_8["colorCodesByColorIndex"];
        var_11 = var_8["colors"];
        var_12 = [];

        foreach ( var_14 in var_9 )
        {
            var_15 = spawnstruct();
            var_15._id_4E7B[0] = var_14;
            var_16 = getsubstr( var_14, 0, 1 );
            var_15._id_4E7C[0] = var_16;
            var_15._id_4E7D[var_16] = var_10[var_16];
            var_15.name = var_5;
            var_15._id_1542 = var_7;
            var_12[var_12.size] = var_15;
        }

        common_scripts\utility::array_thread( var_12, ::_id_4E81 );
    }
}

_id_4E7E()
{
    level waittill( "color_volume_advance_stop" );
    level._id_4E7F = undefined;
}

_id_4E80( var_0 )
{
    level endon( "color_volume_advance_stop" );

    for (;;)
    {
        if ( level._id_4E7F[var_0].size )
        {
            var_1 = level._id_4E7F[var_0][0];
            var_1 _id_4E83();
            continue;
        }

        level waittill( "color_flag_advance_queue_updated" );
    }
}

_id_4E81()
{
    var_0 = self._id_4E7C[0];

    if ( !isdefined( level._id_4E7F ) )
        level._id_4E7F = [];

    var_1 = getarraykeys( level._id_4E7F );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 == var_0 )
        {
            var_2 = 1;
            break;
        }
    }

    if ( !var_2 )
    {
        level._id_4E7F[var_0] = [];
        thread _id_4E80( var_0 );
    }

    level._id_4E7F[var_0][level._id_4E7F[var_0].size] = self;
    level notify( "color_flag_advance_queue_updated" );
}

_id_4E82()
{
    var_0 = self._id_4E7C[0];
    level._id_4E7F[var_0] = common_scripts\utility::array_remove( level._id_4E7F[var_0], self );
}

_id_4E83()
{
    level endon( "color_volume_advance_stop" );
    self._id_1542 maps\_utility::_id_27E4();
    thread maps\_colors::_id_135F( self._id_4E7B, self._id_4E7C, "allies", self._id_4E7D );

    if ( isdefined( self._id_1542.script_noteworthy ) )
    {
        var_0 = getentarray( self._id_1542.script_noteworthy, "script_noteworthy" );

        foreach ( var_2 in var_0 )
        {
            if ( var_2.classname == "trigger_multiple" )
                var_2 common_scripts\utility::trigger_off();
        }
    }

    _id_4E82();
}

_id_4E84( var_0, var_1 )
{
    if ( !var_0.size )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_4E7B[0] == var_1 )
            return 1;
    }

    return 0;
}

_id_4E85( var_0, var_1 )
{
    wait 1.0;
    level endon( var_1 );
    level.cosine["35"] = cos( 35 );

    for (;;)
    {
        var_2 = getent( var_0, "targetname" );
        var_3 = getaiarray( "axis" );
        var_4 = [];

        foreach ( var_6 in var_3 )
        {
            if ( var_6 istouching( var_2 ) )
                var_4 = maps\_utility::_id_0BC3( var_4, var_6 );
        }

        if ( var_4.size > 0 )
        {
            var_8 = common_scripts\utility::getstructarray( var_2.target, "targetname" );
            var_8 = maps\_utility::_id_0B53( var_8 );
            var_9 = var_8[0];
            var_4 = maps\_utility::_id_0B53( var_4 );

            foreach ( var_6 in var_4 )
            {
                if ( maps\_utility::within_fov( level.player geteye(), level.player getplayerangles(), var_6.origin, level.cosine["35"] ) )
                {
                    var_11 = ( 0, 0, randomint( 64 ) + 32 );
                    magicbullet( level._id_4E86, var_9.origin, var_6.origin + var_11 );
                    break;
                }
            }
        }

        wait 5;
    }
}

_id_4E87( var_0, var_1, var_2, var_3, var_4 )
{
    thread _id_4E90();

    if ( !isdefined( level._id_4E88 ) )
        _id_4E8A();

    var_5 = [];
    var_5["entity"] = self;
    var_5["vo_up"] = var_1;
    var_5["vo_down"] = var_0;
    var_5["vo_right"] = var_3;
    var_5["vo_left"] = var_2;
    var_5["angle"] = cos( var_4 );
    level._id_4E89 = maps\_utility::_id_0BC3( level._id_4E89, var_5 );
}

_id_4E8A()
{
    level._id_4E88 = 1;
    level._id_4E89 = [];
    level thread _id_4E8D();
}

_id_4E8B( var_0 )
{
    if ( var_0 > 180 )
        return var_0 - 360;

    return var_0;
}

_id_4E8C()
{
    var_0 = undefined;
    var_1 = 1410065407;
    var_2 = level.player getplayerangles();
    var_3 = level.player geteye();

    foreach ( var_5 in level._id_4E89 )
    {
        if ( !isdefined( var_5["entity"] ) )
            continue;

        var_6 = var_5["entity"].origin;
        var_7 = vectortoangles( var_6 - var_3 );
        var_8 = var_7 - var_2;
        var_9 = _id_4E8B( var_8[0] );
        var_10 = _id_4E8B( var_8[1] );
        var_11 = _id_4E8B( var_8[2] );
        var_12 = abs( var_9 ) + abs( var_10 ) + abs( var_11 );

        if ( var_12 < var_1 )
        {
            var_0 = var_5;
            var_1 = var_12;
        }
    }

    return var_0;
}

_id_4E8D()
{
    level endon( "stop_aim_vo_feedback" );
    level endon( "stop_processing_aim_vo_feedback" );
    level.player notifyonplayercommand( "player_fired", "+attack" );

    for (;;)
    {
        level.player waittill( "player_fired" );

        if ( level.player getcurrentweapon() != level.player getcurrentprimaryweapon() )
            continue;

        if ( isdefined( level._id_4E8E ) )
            continue;

        var_0 = _id_4E8C();

        if ( !isdefined( var_0 ) )
            continue;

        var_1 = level.player getplayerangles();
        var_2 = var_0["angle"];
        var_3 = var_0["entity"];

        if ( maps\_utility::within_fov( level.player.origin, var_1, var_3.origin, var_2 ) )
        {
            var_4 = level.player geteye();
            var_5 = anglestoforward( var_1 );
            var_6 = var_4 + var_5 * 7000;
            var_7 = bullettrace( var_4, var_6, 1, level.player );
            var_8 = var_7["entity"];

            if ( isdefined( var_8 ) )
            {
                var_7["position"] = var_8.origin;

                if ( var_8 == var_3 )
                    continue;
            }

            var_9 = vectortoangles( var_3.origin - var_4 );
            var_10 = 0;
            var_11 = 0;

            for ( var_12 = 0; var_12 < 2; var_12++ )
            {
                var_13 = var_9[var_12];

                if ( var_13 > 180 )
                    var_13 -= 360;

                var_14 = var_1[var_12];

                if ( var_14 > 180 )
                    var_14 -= 360;

                var_15 = var_13 - var_14;

                if ( abs( var_15 ) > abs( var_11 ) )
                {
                    var_10 = var_12;
                    var_11 = var_15;
                }
            }

            var_16 = var_11 > 0;
            var_17 = "";

            if ( var_10 == 0 )
            {
                var_17 = var_0["vo_up"];

                if ( var_16 )
                    var_17 = var_0["vo_down"];
            }
            else
            {
                var_17 = var_0["vo_right"];

                if ( var_16 )
                    var_17 = var_0["vo_left"];
            }

            if ( isdefined( level.scr_sound["lone_star"][var_17] ) )
                level._id_4E8F thread maps\_utility::_id_168C( var_17 );
            else
                thread maps\_utility::_id_27BB( var_17, 1 );
        }

        wait 1;
    }
}

_id_4E90()
{
    if ( isai( self ) )
    {
        thread _id_4E91( self, "death" );
        self endon( "death" );
    }

    thread _id_4E91( self, "deleted" );
    thread _id_4E91( level, "stop_aim_vo_feedback" );
    thread _id_4E91( self, "clean_up_vo_feedback" );
}

_id_4E91( var_0, var_1 )
{
    var_0 waittill( var_1 );

    if ( isdefined( level._id_4E88 ) )
    {
        level._id_4E8E = 1;
        waittillframeend;
        var_2 = [];

        foreach ( var_4 in level._id_4E89 )
        {
            if ( var_4["entity"] != var_0 )
                var_2[var_2.size] = var_4;
        }

        level._id_4E89 = var_2;
        level._id_4E8E = undefined;

        if ( level._id_4E89.size == 0 )
        {
            level notify( "stop_processing_aim_vo_feedback" );
            level._id_4E89 = undefined;
            level._id_4E88 = undefined;
            return;
        }
    }
    else
    {

    }
}

_id_4E92()
{
    self notify( "clean_up_vo_feedback" );
}

_id_4E93( var_0 )
{
    if ( isdefined( var_0 ) )
        level endon( var_0 );

    level endon( "stop_monitoring_reload" );
    var_1 = level.player isreloading();

    for (;;)
    {
        var_2 = level.player isreloading();

        if ( var_2 == var_1 )
        {

        }
        else if ( var_2 )
        {
            level notify( "start_reload" );
            wait 0.5;
        }
        else
            level notify( "finish_reload" );

        wait 0.05;
        var_1 = var_2;
    }
}

_id_4E94( var_0, var_1 )
{
    var_2 = 0;
    thread _id_4E95( var_1 );

    if ( isdefined( self ) && isdefined( var_0 ) && isdefined( var_1 ) )
    {
        while ( !common_scripts\utility::flag( var_1 ) )
        {
            var_3 = 0;
            var_4 = ( 0.0, 0.0, 0.0 );

            foreach ( var_6 in var_0 )
            {
                if ( isdefined( var_6 ) && isalive( var_6 ) )
                {
                    var_4 += var_6.origin;
                    var_3++;
                }
            }

            if ( var_3 > 0 )
            {
                var_4 /= var_3;

                if ( var_2 )
                    self moveto( var_4, 0.2 );
                else
                {
                    var_2 = 1;
                    self.origin = var_4;
                }
            }

            wait 0.2;
        }
    }
}

_id_4E95( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );
    self delete();
}

_id_4E96()
{
    self notify( "start_dynamic_run_speed" );
    self endon( "death" );
    self endon( "stop_dynamic_run_speed" );
    self endon( "start_dynamic_run_speed" );

    if ( maps\_utility::_id_133C( "_stealth_custom_anim" ) )
        maps\_utility::_id_13DB( "_stealth_custom_anim" );

    self._id_1403 = "";
    _id_4E99();
    var_0 = 144;
    var_1 = [ "sprint", "run" ];
    var_2 = [];
    var_2["player_sprint"]["sprint"][0] = 225 * var_0;
    var_2["player_sprint"]["sprint"][1] = 900 * var_0;
    var_2["player_sprint"]["run"][0] = 900 * var_0;
    var_2["player_sprint"]["run"][1] = 900 * var_0;
    var_2["player_run"]["sprint"][0] = 225 * var_0;
    var_2["player_run"]["sprint"][1] = 400 * var_0;
    var_2["player_run"]["run"][0] = 400 * var_0;
    var_2["player_run"]["run"][1] = 625 * var_0;
    var_2["player_crouch"]["run"][0] = 4 * var_0;
    var_2["player_crouch"]["run"][1] = 100 * var_0;
    var_3 = 123;
    var_4 = 189;
    var_5 = 283;

    for (;;)
    {
        wait 0.2;

        if ( isdefined( self._id_4E97 ) )
        {
            _id_4E9A( self._id_4E97 );
            continue;
        }

        var_6 = vectornormalize( anglestoforward( self.angles ) );
        var_7 = vectornormalize( self.origin - level.player.origin );
        var_8 = vectordot( var_6, var_7 );
        var_9 = distancesquared( self.origin, level.player.origin );

        if ( isdefined( self._id_109A ) && self._id_109A )
            self._id_0FC6 = 1;

        if ( common_scripts\utility::flag_exist( "_stealth_spotted" ) && common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            _id_4E9A( "run" );
            continue;
        }

        if ( var_8 < -0.25 && var_9 > 225 * var_0 )
        {
            _id_4E9A( "sprint" );
            continue;
        }

        _id_4E9A( "cqb" );
    }
}

_id_4E98()
{
    self endon( "death" );
    self notify( "stop_dynamic_run_speed" );
    _id_4E99();
}

_id_4E99()
{
    self endon( "death" );
    maps\_utility::_id_109E();
    self._id_0FC6 = 1;
    maps\_utility::_id_140C();
    self notify( "stop_loop" );
}

_id_4E9A( var_0 )
{
    if ( self._id_1403 == var_0 )
        return;

    self._id_1403 = var_0;

    switch ( var_0 )
    {
        case "sprint":
            if ( isdefined( self._id_109A ) && self._id_109A )
                self._id_0FC6 = 1;
            else
                self._id_0FC6 = 1;

            maps\_utility::_id_140B( "DRS_sprint" );
            maps\_utility::_id_109E();
            self notify( "stop_loop" );
            break;
        case "run":
            self._id_0FC6 = 1;
            maps\_utility::_id_140C();
            maps\_utility::_id_109E();
            self notify( "stop_loop" );
            break;
        case "jog":
            self._id_0FC6 = 1;
            maps\_utility::_id_140B( "DRS_combat_jog" );
            maps\_utility::_id_109E();
            self notify( "stop_loop" );
            break;
        case "cqb":
            self._id_0FC6 = 1;
            maps\_utility::_id_109B();
            self notify( "stop_loop" );
            break;
    }
}

_id_4E9B( var_0, var_1, var_2 )
{
    var_3 = var_0.allowpain;
    var_0 maps\_utility::_id_1057();
    _id_4E9C( var_0, "gravity", var_1, var_2 );

    if ( var_3 )
        var_0 maps\_utility::_id_1071();
}

_id_4E9C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = maps\_anim::_id_1202( var_3 );
    var_6 = var_5["origin"];
    var_7 = var_5["angles"];
    thread maps\_anim::_id_11D4( var_0, var_1, var_2, var_6, var_7, self._id_1032, 0, var_4 );
    var_0 maps\_anim::_id_11CB( var_2 );
    self notify( var_2 );
}

_id_4E9D( var_0, var_1, var_2 )
{
    var_3 = self gettagorigin( "tag_flash" );
    var_4 = 0;
    playfxontag( common_scripts\utility::getfx( "t90_flash_berlin_closeup" ), self, "tag_flash" );

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        var_6 = var_2;

        if ( var_5 == 0 )
            var_6 = 1;

        var_7 = var_0.origin + _id_4E9E( var_2 ) + var_0 _id_4E9F();
        magicbullet( "acr_hybrid_berlin", var_3, var_7 );
        var_8 = var_0.origin + _id_4E9E( var_2 );
        bullettracer( var_3, var_8 );
        var_8 = var_0.origin + _id_4E9E( var_2 );
        bullettracer( var_3, var_8 );
    }

    if ( isalive( var_0 ) )
        var_0 kill( self.origin, self );

    physicsexplosionsphere( var_3 + var_0 _id_4E9F(), 512, 1, 1 );
}

_id_4E9E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    if ( !isdefined( var_2 ) )
        var_2 = var_1;

    var_3 = -1;
    return ( randomintrange( var_3 * var_0, var_0 ), randomintrange( var_3 * var_1, var_1 ), randomintrange( var_3 * var_2, var_2 ) );
}

_id_4E9F()
{
    var_0 = ( 0.0, 0.0, 0.0 );

    if ( isai( self ) )
    {
        if ( self.a.stance == "stand" )
            var_0 = ( 0.0, 0.0, 48.0 );
        else if ( self.a.stance == "crouch" )
            var_0 = ( 0.0, 0.0, 32.0 );
        else if ( self.a.stance == "prone" )
            var_0 = ( 0.0, 0.0, 16.0 );
        else
        {

        }
    }

    return var_0;
}

_id_4426()
{
    var_0 = getentarray( "trigger_ignore_suppression", "targetname" );

    foreach ( var_2 in var_0 )
        level thread _id_4427( var_2 );
}

_id_4427( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && isai( var_1 ) && !var_1 isbadguy() )
            var_1 thread _id_4428( var_0 );
    }
}

_id_4428( var_0 )
{
    self notify( "ignore_suppression_trigger_ai_think_stop" );
    self endon( "ignore_suppression_trigger_ai_think_stop" );
    self endon( "death" );
    maps\_utility::_id_26F3( 1 );

    while ( self istouching( var_0 ) )
        wait 0.5;

    maps\_utility::_id_26F3( 0 );
}
