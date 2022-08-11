// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_473C()
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D.sort = -1;
    level._id_473D.foreground = 1;
    return level._id_473D;
}

_id_473B( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

_id_7431()
{
    var_0 = level.player.origin;
    var_1 = self.origin + ( 200.0, -5000.0, 0.0 );
    var_2 = self.origin + ( 200.0, 5000.0, 0.0 );
    return pointonsegmentnearesttopoint( var_1, var_2, var_0 );
}

_id_7432()
{
    var_0 = 0;

    if ( level.player.origin[0] < self.origin[0] + 200 )
        var_0 = 1;

    return var_0;
}

_id_7433( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2 = level.elevators[0];
    var_3 = distance( var_2.e["housing"]["mainframe"][0] getorigin(), var_1.origin );

    foreach ( var_5 in level.elevators )
    {
        var_6 = distance( var_5.e["housing"]["mainframe"][0] getorigin(), var_1.origin );

        if ( var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2;
}

_id_7434( var_0, var_1, var_2, var_3 )
{
    var_4 = common_scripts\_elevator::get_housing_mainframe();

    foreach ( var_6 in self.e["housing"]["mainframe"] )
    {
        var_7 = var_6.origin + var_0;
        var_6 moveto( var_7, var_1, var_2, var_3 );
    }

    foreach ( var_6 in common_scripts\_elevator::get_housing_children() )
    {
        var_7 = var_6.origin + var_0;

        if ( !issubstr( var_6.classname, "trigger_" ) )
        {
            var_6 moveto( var_7, var_1, var_2, var_3 );
            continue;
        }

        var_6.origin = var_7;
    }
}

_id_7435( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in self.e["housing"]["mainframe"] )
            var_3 moveto( ( var_3.origin[0], var_3.origin[1], var_3.origin[2] - var_1 ), var_0, var_0, 0 );

        foreach ( var_3 in common_scripts\_elevator::get_housing_children() )
        {
            if ( !issubstr( var_3.classname, "trigger_" ) )
                var_3 moveto( ( var_3.origin[0], var_3.origin[1], var_3.origin[2] - var_1 ), var_0, var_0, 0 );
        }
    }
    else
    {
        foreach ( var_3 in self.e["housing"]["mainframe"] )
            var_3 movegravity( ( 0.0, 0.0, 0.0 ), var_0 );

        foreach ( var_3 in common_scripts\_elevator::get_housing_children() )
        {
            if ( !issubstr( var_3.classname, "trigger_" ) )
                var_3 movegravity( ( 0.0, 0.0, 0.0 ), var_0 );
        }
    }

    wait(var_0);
}

_id_7436( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
    {
        var_1 notify( "trigger" );
        return 1;
    }
    else
        return 0;
}

_id_7437( var_0 )
{
    while ( !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = getentarray( "grenade", "classname" );

        foreach ( var_3 in var_1 )
            var_3 delete();

        wait 0.25;
    }
}

_id_7438( var_0, var_1, var_2, var_3 )
{
    maps\_utility::_id_1402( "spotlight_on" );
    self._id_2891 = spawnturret( "misc_turret", self gettagorigin( "tag_flash" ), "heli_spotlight" );
    self._id_2891 setmode( "manual" );
    self._id_2891 setmodel( "com_blackhawk_spotlight_on_mg_setup" );
    self._id_2891 linkto( self, "tag_flash", ( 0.0, 0.0, -7.0 ), ( -20.0, 0.0, 0.0 ) );
    thread _id_582B( var_0, var_1, var_2, var_3 );
    thread _id_7439();
}

_id_7439()
{
    var_0 = self._id_2891;
    self waittill( "death" );
    var_0 delete();
}

_id_582A()
{
    playfxontag( common_scripts\utility::getfx( "spotlight" ), self._id_2891, "tag_flash" );
}

_id_5730()
{
    stopfxontag( common_scripts\utility::getfx( "spotlight" ), self._id_2891, "tag_flash" );
}

_id_582B( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self notify( "stop_littlebird_spotlight" );
    self endon( "stop_littlebird_spotlight" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( var_0 > 0 )
        maps\_utility::delaythread( var_0, ::_id_582A );
    else
        _id_582A();

    if ( isdefined( var_1 ) && var_1 )
    {
        for (;;)
        {
            self._id_2891 settargetentity( level.player, var_2 + common_scripts\utility::randomvector( var_3 ) );
            wait(randomfloatrange( 2, 3 ));
        }
    }
    else
    {
        var_4 = anglestoforward( self._id_2891.angles );
        var_5 = spawn( "script_origin", self._id_2891.origin + var_4 * 500 + ( 0.0, 0.0, -500.0 ) );
        var_5 linkto( self );
        self._id_2891 settargetentity( var_5, var_2 + common_scripts\utility::randomvector( var_3 ) );
        var_6 = 1;

        for (;;)
        {
            self._id_2891 settargetentity( var_5, var_2 + common_scripts\utility::randomvector( var_3 ) );
            wait(randomfloatrange( 2, 3 ));
        }
    }
}

_id_743A( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        level endon( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 30;

    if ( !isdefined( var_3 ) )
        var_3 = 60;

    self sethoverparams( 512, 20, 5 );
    var_4 = common_scripts\utility::getstructarray( var_0, "script_noteworthy" );
    var_5 = var_4;
    var_6 = 0;

    for (;;)
    {
        var_5 = common_scripts\utility::array_remove( var_4, var_5[var_6] );
        var_6 = randomintrange( 0, var_5.size );
        var_7 = randomfloatrange( 1, 4 );
        self vehicle_setspeed( randomintrange( var_2, var_3 ), 15, 15 );
        var_8 = 0.05;

        for ( var_9 = 0; var_9 < var_7; var_9 += var_8 )
        {
            var_10 = var_5[var_6];
            self setvehgoalpos( var_10.origin, 0 );
            wait(var_8);
        }
    }
}

_id_743B( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[0] = "tag_missile_right";
    var_4[1] = "tag_missile_left";

    if ( !isdefined( var_2 ) )
        var_2 = 1.0;

    self setvehweapon( "littlebird_FFAR" );

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        var_6 = var_0[var_5 % var_0.size];
        self setturrettargetent( var_6 );
        var_7 = self fireweapon( var_4[var_5 % var_4.size], var_6 );
        var_3 = 1;

        if ( isdefined( var_3 ) && var_3 )
            var_7 thread _id_743C();

        maps\_audio::aud_send_msg( "littlebird_missile_ent_fired", var_7 );

        if ( var_2 >= 0 )
            var_7 common_scripts\utility::delaycall( var_2, ::missile_cleartarget );

        if ( isdefined( var_6.script_delay ) )
        {
            wait(var_6.script_delay);
            continue;
        }

        wait(randomfloatrange( 0.2, 0.3 ));
    }
}

_id_743C()
{
    self waittill( "death" );
    level.player playrumbleonentity( "damage_light" );
}

_id_441E( var_0, var_1 )
{
    self endon( "death" );

    if ( !issentient( self ) || !isalive( self ) )
        return;

    if ( isdefined( self._id_441E ) && self._id_441E )
        return;

    self._id_441E = 1;

    if ( isdefined( var_0 ) )
        wait(randomfloat( var_0 ));

    var_2 = [];
    var_2[0] = "j_hip_le";
    var_2[1] = "j_hip_ri";
    var_2[2] = "j_head";
    var_2[3] = "j_spine4";
    var_2[4] = "j_elbow_le";
    var_2[5] = "j_elbow_ri";
    var_2[6] = "j_clavicle_le";
    var_2[7] = "j_clavicle_ri";
    var_3 = getdvarint( "cg_fov" );

    for ( var_4 = 0; var_4 < 3 + randomint( 5 ); var_4++ )
    {
        var_5 = randomintrange( 0, var_2.size );
        thread _id_50B6( var_2[var_5], undefined );
        wait(randomfloat( 0.1 ));

        if ( isdefined( var_1 ) && isai( var_1 ) && isalive( var_1 ) )
        {
            if ( !level.player worldpointinreticle_circle( var_1.origin, var_3, 500 ) )
                var_1 shootblank();
        }
    }

    self dodamage( self.health + 50, self.origin );
}

_id_50B6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._effect["flesh_hit"];

    playfxontag( var_1, self, var_0 );
}

_id_743D( var_0, var_1 )
{
    if ( _id_4D0C( getglassorigin( var_0 ), var_1 ) )
        return 1;

    return 0;
}

_id_4D0C( var_0, var_1 )
{
    var_2 = spawn( "script_origin", var_0 );
    var_3 = 0;

    if ( var_2 istouching( var_1 ) )
        var_3 = 1;

    var_2 delete();
    return var_3;
}

_id_743E( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.965;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !level.player istouching( var_0 ) )
        return 0;

    if ( level.player getstance() != "stand" )
        return 0;

    if ( var_3 && level.player isonground() )
        return 0;

    var_4 = level.player getplayerangles();
    var_4 = ( 0, var_4[1], 0 );
    var_5 = anglestoforward( var_4 );
    var_6 = vectordot( var_5, var_1 );

    if ( var_6 < var_2 )
        return 0;

    var_7 = level.player getvelocity();
    var_8 = distance( ( var_7[0], var_7[1], 0 ), ( 0.0, 0.0, 0.0 ) );

    if ( var_8 < 162 )
        return 0;

    return 1;
}

_id_6741()
{
    level endon( "player_jump_watcher_stop" );
    var_0 = "player_jumping";

    if ( !common_scripts\utility::flag_exist( var_0 ) )
        common_scripts\utility::flag_init( var_0 );
    else
        common_scripts\utility::flag_clear( var_0 );

    notifyoncommand( "playerjump", "+gostand" );
    notifyoncommand( "playerjump", "+moveup" );

    for (;;)
    {
        level.player waittill( "playerjump" );
        wait 0.1;

        if ( !level.player isonground() )
            common_scripts\utility::flag_set( var_0 );

        while ( !level.player isonground() )
            wait 0.05;

        common_scripts\utility::flag_clear( var_0 );
    }
}

_id_743F( var_0 )
{
    var_1 = int( tablelookup( "sp/deathQuoteTable.csv", 1, "size", 0 ) );
    var_2 = randomint( var_1 );
    setdvar( "ui_deadquote", maps\_quotes::_id_18A9( var_2 ) );
    var_3 = "player_falling_kill_in_progress";

    if ( common_scripts\utility::flag( var_3 ) )
        return;
    else
        common_scripts\utility::flag_set( var_3 );

    if ( !isdefined( var_0 ) )
        var_0 = 3;

    common_scripts\utility::flag_clear( "can_save" );
    var_4 = gettime() + var_0 * 1000;

    while ( !level.player isonground() && gettime() < var_4 )
        wait 0.05;

    if ( level.player isonground() )
        level.player kill();
    else
        maps\_utility::_id_1826();
}

_id_7440()
{
    if ( self.classname != "script_model" )
        return;

    if ( !isdefined( level.precachemodeltype["dubai_elevator_glass"] ) )
    {
        level.precachemodeltype["dubai_elevator_glass"] = 1;
        precachemodel( "dub_bldg_elevator_glass_shattered" );
        precachemodel( "dub_bldg_elevator_glass_broken01" );
    }

    self.damagetaken = 0;
    self setcandamage( 1 );
    self endon( "destroyed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_IMPACT" )
            thread _id_7443();

        self.damagetype = var_4;
        self.damageowner = var_1;
        self.damagetaken += var_0;

        if ( self.damagetaken == var_0 )
        {
            thread _id_7442();
            continue;
        }

        if ( self.damagetaken >= level._id_7441 )
            thread _id_7443();
    }
}

_id_7442()
{
    self setmodel( "dub_bldg_elevator_glass_shattered" );
    var_0 = 0;

    if ( self.damagetype == "MOD_GRENADE_SLASH" || self.damagetype == "MOD_GRENADE" || self.damagetaken > level._id_7441 )
        thread _id_7443();
    else
        maps\_audio::aud_send_msg( "aud_elevator_glass_shatter", self );
}

_id_7443()
{
    self notify( "destroyed" );
    maps\_audio::aud_send_msg( "aud_elevator_glass_destroy", self );
    playfx( level._effect["dubai_elevator_glass"], self.origin, anglestoforward( self.angles ), anglestoup( self.angles ) );
    self setmodel( "dub_bldg_elevator_glass_broken01" );
    self setcandamage( 0 );
}

_id_7444()
{
    var_0 = getentarray( "elevator_glass", "targetname" );
    var_1 = common_scripts\_elevator::get_housing_mainframe();

    foreach ( var_3 in var_0 )
    {
        if ( distance( var_3.origin, var_1.origin ) < 1000 )
            var_3 linkto( var_1 );
    }
}

_id_7445()
{
    foreach ( var_1 in self )
    {
        if ( var_1.classname == "script_brushmodel" )
            return var_1.origin;
    }
}

_id_7446()
{
    var_0 = self._id_215B;
    self._id_215B = [];
    self waittill( "anim_complete" );
    self._id_215B = var_0;
}
#using_animtree("generic_human");

_id_7447()
{
    self endon( "death" );

    if ( isdefined( self._id_164F ) )
        self.script_noteworthy = self._id_164F;

    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B8 )[0];
    var_0 = [];
    var_0[var_0.size] = "civilian_run_upright_relative";
    var_0[var_0.size] = "civilian_run_hunched_A_relative";
    var_0[var_0.size] = "civilian_run_hunched_C_relative";
    var_0 = maps\_utility::_id_0B53( var_0 );
    self._id_2044 = maps\_utility::_id_270F( var_0[0] );

    if ( self.weapon != "none" )
        maps\_utility::_id_24F5();

    self._id_2018 = %civilain_crouch_hide_idle_loop;
    thread _id_7448();
    self waittill( "goal" );
    self delete();
}

_id_7448()
{
    self endon( "goal" );
    self endon( "death" );

    while ( isdefined( self ) )
    {
        while ( distance( self.origin, level.player.origin ) > 100 )
            wait 0.1;

        var_0 = self setcontents( 0 );

        while ( distance( self.origin, level.player.origin ) <= 100 )
            wait 0.1;

        self setcontents( var_0 );
    }
}

_id_7449( var_0 )
{
    self endon( "death" );
    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B7 )[0];

    if ( isdefined( self._id_164F ) )
        self.script_noteworthy = self._id_164F;

    if ( self.weapon != "none" )
        maps\_utility::_id_24F5();

    if ( isdefined( self.animation ) )
        self._id_2018 = self.animation;
    else
        self._id_2018 = %civilain_crouch_hide_idle_loop;

    self.spawner thread maps\_anim::_id_11C8( self, self._id_2018 );
    common_scripts\utility::flag_wait( var_0 );
    self delete();
}

_id_744A()
{
    self endon( "death" );
    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B8 )[0];

    if ( isdefined( self.script_delay ) )
        thread maps\_utility::_id_1424( "pause", self.script_delay );

    if ( isdefined( self._id_164F ) )
        self.script_noteworthy = self._id_164F;

    if ( isdefined( self.animation ) )
    {
        self._id_2044 = maps\_utility::_id_270F( self.animation );

        if ( self.weapon != "none" )
            maps\_utility::_id_24F5();

        self._id_2018 = %civilain_crouch_hide_idle_loop;
    }

    self waittill( "pause" );
    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B7 )[0];
    thread maps\_anim::_id_11C8( self, "civilain_crouch_hide_idle_loop", "move" );
    common_scripts\utility::flag_wait( "elevator_drones_flee" );
    wait(randomfloatrange( 0.5, 1 ));
    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B8 )[0];
    self.target = self._id_2047["target"];
    thread maps\_drone::_id_2043();
    common_scripts\utility::flag_wait( "elevator_doors_closed" );
    self delete();
}

_id_744B( var_0 )
{
    self endon( "death" );
    self._id_0EC6 = 1;
    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B8 )[0];

    if ( isdefined( self._id_164F ) )
        self.script_noteworthy = self._id_164F;

    if ( isdefined( self.animation ) )
    {
        self._id_2044 = maps\_utility::_id_270F( self.animation );

        if ( self.weapon != "none" )
            maps\_utility::_id_24F5();

        self._id_2018 = %civilain_crouch_hide_idle_loop;
    }

    thread _id_744C();
    self waittill( "goal" );
    self._id_0D50 = maps\_utility::_id_0B53( level._id_73B7 )[0];
    common_scripts\utility::flag_wait( var_0 );
    self delete();
}

_id_744C()
{
    self endon( "goal" );
    self endon( "death" );

    while ( isdefined( self ) )
    {
        if ( distance( self.origin, level.player.origin ) <= 100 )
        {
            self setcontents( 0 );
            self kill();
            break;
        }

        wait 0.05;
    }
}

_id_744D( var_0, var_1 )
{
    var_2 = getent( var_0, "script_noteworthy" );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = var_2.origin + ( 78.5, -51.0, 82.5 );
    var_3.angles = ( 0.0, 180.0, 0.0 );
    var_3 linkto( var_2 );
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_2.origin + ( 78.5, -53.0, 82.5 );
    var_4.angles = ( 0.0, 180.0, 0.0 );
    var_4 linkto( var_2 );
    var_5 = level._effect["dubai_elevator_num_9"];
    var_6 = level._effect["dubai_elevator_num_9"];
    var_7 = level._effect["dubai_elevator_num_0"];
    var_8 = level._effect["dubai_elevator_num_0"];
    var_9 = 0;
    var_10 = 0;
    var_11 = 1;
    var_12 = 1;
    var_13 = 0;

    while ( !common_scripts\utility::flag( var_1 ) )
    {
        var_14 = int( floor( var_2.origin[2] / 288 ) + 1 );

        if ( var_14 != var_13 )
        {
            var_13 = var_14;
            maps\_audio::aud_send_msg( "elevator_floor_change", var_3 );
            var_15 = floor( var_14 / 10 );
            var_16 = var_14 % 10;

            if ( var_14 > 0 )
            {
                if ( var_15 != var_9 )
                {
                    var_7 = var_5;
                    var_5 = level._effect["dubai_elevator_num_" + var_15];
                    stopfxontag( var_7, var_3, "tag_origin" );

                    if ( var_15 == 2 && var_16 == 8 )
                    {

                    }
                    else if ( var_15 > 0 )
                        playfxontag( var_5, var_3, "tag_origin" );

                    var_9 = var_15;
                }

                if ( var_16 != var_10 )
                {
                    var_8 = var_6;

                    if ( var_15 == 0 && var_16 == 2 )
                        var_6 = level._effect["dubai_elevator_num_l"];
                    else if ( var_15 == 2 && var_16 == 8 )
                    {
                        stopfxontag( var_5, var_3, "tag_origin" );
                        var_6 = level._effect["dubai_elevator_num_g"];
                    }
                    else
                        var_6 = level._effect["dubai_elevator_num_" + var_16];

                    stopfxontag( var_8, var_4, "tag_origin" );
                    playfxontag( var_6, var_4, "tag_origin" );
                    var_10 = var_16;
                }
            }
        }

        wait 0.05;
    }

    stopfxontag( var_5, var_3, "tag_origin" );
    stopfxontag( var_6, var_4, "tag_origin" );
}

_id_744E( var_0 )
{
    switch ( var_0 )
    {
        case 1:
            maps\_compass::setupminimap( "compass_map_dubai", "minimap_corner" );
            setsaveddvar( "compassMaxRange", "3500" );
            break;
        case 2:
            maps\_compass::setupminimap( "compass_map_dubai_2", "minimap_corner_2" );
            setsaveddvar( "compassMaxRange", "2000" );
            break;
        case 3:
            maps\_compass::setupminimap( "compass_map_dubai_3", "minimap_corner_2" );
            setsaveddvar( "compassMaxRange", "2000" );
            break;
    }
}

_id_744F()
{
    var_0 = getglassarray( "muntaha_glass_destroy" );

    foreach ( var_2 in var_0 )
        destroyglass( var_2 );
}

blackout( var_0, var_1 )
{
    _id_7452( var_0, 1, var_1 );
}

_id_7450( var_0, var_1 )
{
    _id_7452( var_0, 0.6, var_1 );
}

_id_7451( var_0, var_1 )
{
    _id_7452( var_0, 0, var_1 );
}

_id_7452( var_0, var_1, var_2 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    setblur( var_2, var_0 );
    wait(var_0);
}
