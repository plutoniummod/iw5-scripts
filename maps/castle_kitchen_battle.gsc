// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4EEA()
{
    maps\_shg_common::move_player_to_start( "start_kitchen_battle" );
    maps\castle_code::_id_8094( "start_kitchen_battle" );
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
    maps\_utility::_id_265A( "axis" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "kitchen_start" );
    common_scripts\utility::flag_init( "launch_cart" );
    common_scripts\utility::flag_init( "cart_stopped" );
    common_scripts\utility::flag_init( "price_say_open_fire" );
}

_id_4EEB()
{
    var_0 = getent( "fxanim_castle_kitchen_wall_mod", "targetname" );
    var_0 hide();
    common_scripts\utility::flag_wait( "stop_peeping" );
    level._id_4877._id_20AF = 1;
    level._id_4877 maps\_utility::_id_1071();
    level._id_4877 maps\_utility::_id_27B8();
    level._id_4877 maps\_utility::_id_2715();
    level._id_4877 maps\_utility::_id_26F3( 0 );
    level._id_4877._id_0F3C = 0;
    var_1 = maps\castle_code::_id_7A41( "spiderclimb" );
    var_1 thread _id_4EED();
    level._id_4877 thread _id_4EF0( var_1 );
    level._id_4877 thread _id_4EF6();
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    maps\_utility::_id_27CA( "kitchen_guys_initial", ::_id_4EEE );
    common_scripts\utility::flag_wait( "kitchen_start" );
    var_2 = getent( "trig_fryer", "targetname" );
    var_2 thread _id_4EF8();
    level thread _id_4EFA();
    maps\_utility::delaythread( 0.7, ::_id_4EEC, var_0 );
    level _id_4EF5();
}

_id_4EEC( var_0 )
{
    common_scripts\utility::exploder( 1100 );
    common_scripts\utility::exploder( 1101 );
    var_0 show();
    var_0._id_1032 = "kitchen_wall";
    var_0 maps\_utility::_id_2629();
    var_0 thread maps\_anim::_id_1246( var_0, "crash_thru" );
    maps\_audio::aud_send_msg( "player_crash_to_kitchen" );
    var_1 = getent( "kitchen_wall_destroyed", "targetname" );
    var_1 show();
    var_2 = getent( "kitchen_wall_full", "targetname" );
    var_2 delete();
    level.player shellshock( "default", 1.5 );
    level.player playrumbleonentity( "damage_heavy" );
    earthquake( 1, 0.5, level.player.origin, 100 );
    setslowmotion( 1.0, 0.25, 0.5 );
    level.player enableslowaim();
    wait 0.75;
    var_3 = common_scripts\utility::getstructarray( "kitchen_pulse", "targetname" );

    foreach ( var_5 in var_3 )
    {
        radiusdamage( var_5.origin, var_5.radius, 100, 100, level.player );
        physicsexplosionsphere( var_5.origin, var_5.radius, var_5.radius, 1 );
    }

    maps\_autosave::_id_1C3F();
    wait 1.25;
    setslowmotion( 0.25, 1.0, 1.0 );
    level.player disableslowaim();
}

_id_4EED()
{
    playfx( level._effect["wall_fall_dust"], level.player.origin, anglestoforward( self.angles ) );
    common_scripts\utility::exploder( 1010 );

    if ( isdefined( level.player._id_7A48 ) )
    {
        level.player playerlinktoabsolute( level.player._id_7A48, "tag_player" );
        maps\_anim::_id_1246( level.player._id_7A48, "wall_climb_peek_fall" );
    }
    else
        maps\castle_code::_id_81F5( "wall_climb_peek_fall", undefined, 0.0, 1 );

    maps\castle_code::_id_5CA5( 0 );
    maps\_utility::_id_265B( "axis" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
}

_id_4EEE()
{
    self._id_1032 = self.script_noteworthy;
    maps\_utility::_id_26F6( 1 );

    if ( self.script_noteworthy == "kitchen_guy1" )
        thread _id_4EEF();

    if ( self.script_noteworthy == "kitchen_guy5" )
    {
        self endon( "death" );
        maps\_utility::_id_12E2( ::_id_0163 );
        maps\_utility::_id_0D04();
        self.ignoreall = 1;
        self waittill( "intro_over" );
        wait 0.4;

        if ( !isdefined( self._id_4EF9 ) )
        {
            self._id_4EF9 = 1;
            maps\_utility::_id_1A2A( ::_id_0163 );

            if ( isdefined( self._id_0D04 ) && self._id_0D04 )
                maps\_utility::_id_1902();
        }

        self waittill( "goal" );
        self.ignoreall = 0;

        if ( isdefined( self._id_0D04 ) && self._id_0D04 )
            maps\_utility::_id_1902();
    }
    else if ( self.script_noteworthy == "kitchen_guy6" )
        thread _id_4EF1();
}

_id_0163( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = getent( "trig_fryer", "targetname" );

    if ( isdefined( var_7 ) && !isdefined( self._id_4EF9 ) )
        var_7 notify( "trigger" );

    self.health = 150;
    var_8 = vectortoangles( var_2 );
    var_9 = anglestoforward( var_8 );
    var_10 = anglestoup( var_8 );
    var_11 = vectortoangles( var_2 ) + ( 0.0, 180.0, 0.0 );
    var_12 = anglestoforward( var_11 );
    playfx( common_scripts\utility::getfx( "flesh_hit" ), var_3, var_12, var_10 );
}

_id_4EEF()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "kitchen_start" );
    maps\_utility::_id_2739( "kitchen_death" );
    self waittill( "intro_over" );
    self.allowdeath = 1;
    self kill();
}
#using_animtree("generic_human");

_id_4EF0( var_0 )
{
    maps\_utility::_id_0EEC();
    common_scripts\utility::flag_set( "price_say_open_fire" );
    var_0 maps\_anim::_id_1246( self, "peep_show_fall" );
    common_scripts\utility::waitframe();
    self clearanim( %root, 0 );
    wait 2;
    maps\_utility::_id_2686();
}

_id_4EF1()
{
    self endon( "death" );
    var_0 = getent( "freezer_cart", "targetname" );
    var_1 = getent( "freezer_cart_clip", "targetname" );
    var_2 = getentarray( "freezer_cart_food", "targetname" );
    var_1 linkto( var_0 );

    foreach ( var_4 in var_2 )
        var_4 linkto( var_0 );

    common_scripts\utility::flag_wait( "launch_cart" );
    maps\_audio::aud_send_msg( "enemy_roll_cart", var_0 );
    var_0 thread _id_4EF2( var_1 );
}

_id_4EF2( var_0 )
{
    self endon( "hit_player" );
    thread _id_4EF4( var_0 );
    var_1 = var_0.origin;
    var_2 = 2.0;
    var_3 = common_scripts\utility::getstruct( "freezer_cart_dest", "targetname" );
    self moveto( var_3.origin, var_2, 0.1 );
    self rotateto( var_3.angles, var_2, 0.1 );
    var_0 connectpaths();
    thread _id_4EF3( var_1, var_2, var_0 );
    wait 2.0;
    maps\_audio::aud_send_msg( "cart_impact", self );
    common_scripts\utility::flag_set( "cart_stopped" );
    var_4 = var_0.origin - var_1;
    var_4 = ( var_4[0], var_4[1], 0 );
    var_4 = vectornormalize( var_4 ) * 25;
    self moveto( self.origin - var_4, 0.5, 0, 0.25 );
    self rotateto( self.angles, 0.5, 0, 0.25 );
    var_0 disconnectpaths();
}

_id_4EF3( var_0, var_1, var_2 )
{
    var_3 = gettime() + var_1 * 1000;
    var_4 = 0;
    var_5 = cos( 30 );

    while ( !common_scripts\utility::flag( "cart_stopped" ) )
    {
        var_6 = var_2 istouching( level.player );

        if ( var_6 )
        {
            var_7 = vectornormalize( level.player.origin - var_2.origin );
            var_4 = vectordot( anglestoforward( self.angles ), var_7 ) < var_5;

            if ( var_4 )
            {
                maps\_audio::aud_send_msg( "cart_impact", self );
                self notify( "hit_player" );
                level.player dodamage( 20, var_2.origin, var_2 );
                var_8 = var_2.origin - var_0;
                var_8 = ( var_8[0], var_8[1], 0 );
                var_8 = vectornormalize( var_8 ) * 25;
                self moveto( self.origin - var_8, 0.5, 0, 0.25 );
                self rotateto( self.angles, 0.5, 0, 0.25 );
                var_2 disconnectpaths();
                common_scripts\utility::flag_set( "cart_stopped" );
                return;
            }
        }

        common_scripts\utility::waitframe();
    }
}

_id_4EF4( var_0 )
{
    level endon( "flash_grenade_spawn" );
    common_scripts\utility::flag_wait( "cart_stopped" );
    var_1 = 1;

    for (;;)
    {
        while ( var_0 istouching( level.player ) )
        {
            if ( var_1 )
            {
                var_1 = 0;
                var_0 notsolid();
                wait 1;
            }

            wait 0.1;
        }

        if ( !var_1 )
        {
            var_1 = 1;
            var_0 solid();
        }

        wait 0.25;
    }
}

_id_4EF5()
{
    var_0 = getent( "trig_kitchen_to_stairs", "targetname" );
    var_0 endon( "trigger" );
    maps\_utility::_id_2703( "kitchen_guys_initial", "target" );
    wait 0.05;
    var_1 = maps\_utility::_id_263E( "kitchen_guys" );
    var_2 = maps\castle_code::_id_7A41( "kitchen_battle" );
    var_2 maps\_anim::_id_11DD( var_1, "wall_break_react" );
    maps\_utility::_id_1F09( var_1, "intro_over" );
    maps\_utility::_id_2636( var_1, 3 );
    maps\_utility::_id_2703( "trig_kitchen_wave2", "targetname" );
    var_3 = getaiarray( "axis" );
    maps\_utility::_id_2636( var_3, var_3.size );
    var_0 maps\_utility::_id_2703();
}

_id_4EF6()
{
    maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_wait( "price_say_open_fire" );
    wait 6.4;
    maps\_utility::_id_168C( "castle_pri_onyourfeet" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait( "price_kitchen_restdialog" );
    maps\_utility::_id_168C( "castle_pri_inberlin" );
    wait 0.2;
    maps\_utility::_id_11F4( "castle_nik_contact" );
    wait 0.2;
    maps\_utility::_id_168C( "castle_pri_willbreak" );
    wait 0.2;
    maps\_utility::_id_11F4( "castle_nik_letyoudown" );
}

_id_4EF7()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = anglestoforward( ( -90.0, 0.0, 0.0 ) );
    var_2 = spawnfx( common_scripts\utility::getfx( "boiling_pot" ), var_0.origin, var_1 );
    triggerfx( var_2 );
    self waittill( "trigger" );
    var_2 delete();
    var_1 = anglestoforward( ( 0.0, 0.0, 0.0 ) );
    playfx( common_scripts\utility::getfx( "pot_water_splash" ), var_0.origin, var_1 );
}

_id_4EF8()
{
    self waittill( "trigger" );

    if ( distance2d( level.player.origin, self.origin ) < 64 )
        level.player dodamage( 50, self.origin );

    common_scripts\utility::exploder( 1110 );
    var_0 = maps\castle_code::_id_7A41( "kitchen_battle" );
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) )
        {
            if ( distance2d( var_3.origin, self.origin ) < 64 )
            {
                if ( !isdefined( var_3._id_0D04 ) || !var_3._id_0D04 )
                    var_3 maps\_utility::_id_0D04();

                var_3._id_4EF9 = 1;
                var_3 thread _id_4EF9();
                var_3 animscripts\shared::_id_23C8();
                var_3.allowdeath = 1;
                var_0 maps\_anim::_id_11C1( var_3, "catch_fire" );

                if ( isdefined( var_3._id_0D04 ) && var_3._id_0D04 )
                    var_3 maps\_utility::_id_1902();

                var_3 notify( "stop_fire" );
                var_3.a._id_0D55 = 1;
                var_3 maps\_utility::_id_2749();
            }
        }
    }
}

_id_4EF9()
{
    self endon( "stop_fire" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "on_fire" ), self, "j_spine4" );
        wait 0.1;
    }
}

_id_4EFA()
{
    var_0 = getentarray( "fxanim_castle_meat_large_mod", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_1032 = "meat";
        var_2 maps\_utility::_id_2629();
        var_2 thread maps\_anim::_id_124E( var_2, "swing" );
        wait(randomfloatrange( 0.1, 1.0 ));
    }
}
