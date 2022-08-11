// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_51F0()
{
    common_scripts\utility::array_thread( getentarray( "death_trigger", "targetname" ), ::_id_521A );
    common_scripts\utility::array_thread( getentarray( "magic_bullet_trigger", "targetname" ), ::_id_5215 );
}

_id_51F1()
{
    if ( !isdefined( level._id_51F2 ) )
    {
        level._id_51F2 = maps\_utility::_id_1287( "player_rig" );
        level._id_51F2.origin = level.player.origin;
        level._id_51F2.angles = level.player.angles;
    }

    return level._id_51F2;
}

_id_51F3( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 30;

    if ( !isdefined( var_1 ) )
        var_1 = 30;

    if ( !isdefined( var_2 ) )
        var_2 = 30;

    if ( !isdefined( var_3 ) )
        var_3 = 30;

    var_4 = _id_51F1();
    var_4 show();
    level.player playerlinktoabsolute( var_4, "tag_player" );
    level.player playerlinktodelta( var_4, "tag_player", 1, var_0, var_1, var_2, var_3, 1 );
}

_id_51F4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.7;

    var_1 = _id_51F1();
    var_1 show();
    level.player playerlinktoblend( var_1, "tag_player", var_0 );
}

_id_51F5( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1024;

    if ( distance2d( self.origin, level.player.origin ) <= var_1 )
        maps\_utility::_id_11F4( var_0 );
}

_id_51F6( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    if ( isdefined( self._id_0D04 ) && self._id_0D04 )
        maps\_utility::_id_1902();

    var_0 notify( "animation_killed_me" );
    wait 0.05;
    var_0.a._id_0D55 = 1;
    var_0.allowpain = 1;
    var_0.allowdeath = 1;
    var_0 kill();
}

_id_51F7( var_0 )
{
    var_0 endon( "end_reaction" );
    var_0 endon( "animation_killed_me" );
    var_0 common_scripts\utility::waittill_any( "damage", "_stealth_bad_event_listener", "enemy" );
    var_0 stopanimscripted();
    self notify( "stop_loop" );
}

_id_51F8( var_0 )
{
    var_0 endon( "end_reaction" );
    var_0 endon( "animation_killed_me" );
    var_0 waittill( "damage" );
    var_0 stopanimscripted();
    self notify( "stop_loop" );
}

_id_51F9( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_path" );
    self notify( "follow_path" );
    self endon( "follow_path" );
    wait 0.1;
    var_2 = var_0;
    var_3 = undefined;
    var_4 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 300;

    while ( isdefined( var_2 ) )
    {
        if ( isdefined( level.struct_class_names["targetname"][var_2.targetname] ) )
            var_4 = ::_id_51FD;
        else if ( isdefined( var_2.classname ) )
            var_4 = ::_id_51FC;
        else
            var_4 = ::_id_51FB;

        if ( isdefined( var_2.radius ) && var_2.radius != 0 )
            self.goalradius = var_2.radius;

        if ( self.goalradius < 16 )
            self.goalradius = 16;

        if ( isdefined( var_2.height ) && var_2.height != 0 )
            self.goalheight = var_2.height;

        var_5 = self.goalradius;
        self childthread [[ var_4 ]]( var_2 );

        if ( isdefined( var_2.animation ) )
            var_2 waittill( var_2.animation );
        else
        {
            for (;;)
            {
                self waittill( "goal" );

                if ( distance( var_2.origin, self.origin ) < var_5 + 10 )
                    break;
            }
        }

        var_2 notify( "trigger", self );

        if ( !isdefined( var_2._id_21A8 ) && var_1 > 0 )
        {
            while ( isalive( level.player ) )
            {
                if ( _id_51FA( var_2, var_1 ) )
                    break;

                if ( isdefined( var_2.animation ) )
                {
                    self.goalradius = var_5;
                    self setgoalpos( self.origin );
                }

                wait 0.05;
            }
        }

        if ( !isdefined( var_2.target ) )
            break;

        var_2 maps\_utility::script_delay();
        var_2 = var_2 common_scripts\utility::get_target_ent();
    }

    self notify( "path_end_reached" );
}

_id_51FA( var_0, var_1 )
{
    if ( distance( level.player.origin, var_0.origin ) < distance( self.origin, var_0.origin ) )
        return 1;

    var_2 = undefined;
    var_2 = anglestoforward( self.angles );
    var_3 = vectornormalize( level.player.origin - self.origin );

    if ( isdefined( var_0.target ) )
    {
        var_4 = common_scripts\utility::get_target_ent( var_0.target );
        var_2 = vectornormalize( var_4.origin - var_0.origin );
    }
    else if ( isdefined( var_0.angles ) )
        var_2 = anglestoforward( var_0.angles );
    else
        var_2 = anglestoforward( self.angles );

    if ( vectordot( var_2, var_3 ) > 0 )
        return 1;

    if ( distance( level.player.origin, self.origin ) < var_1 )
        return 1;

    return 0;
}

_id_51FB( var_0 )
{
    self notify( "follow_path_new_goal" );

    if ( isdefined( var_0.animation ) )
    {
        var_0 maps\_anim::_id_11C4( self, var_0.animation );
        self notify( "starting_anim" );
        var_0 maps\_anim::_id_11C3( self, var_0.animation );
        self setgoalpos( self.origin );
    }
    else
        maps\_utility::_id_2053( var_0 );
}

_id_51FC( var_0 )
{
    self notify( "follow_path_new_goal" );

    if ( isdefined( var_0.animation ) )
    {
        var_0 maps\_anim::_id_11C4( self, var_0.animation );
        self notify( "starting_anim" );
        var_0 maps\_anim::_id_11C3( self, var_0.animation );
        self setgoalpos( self.origin );
    }
    else
        maps\_utility::_id_2052( var_0 );
}

_id_51FD( var_0 )
{
    self notify( "follow_path_new_goal" );

    if ( isdefined( var_0.animation ) )
    {
        var_0 maps\_anim::_id_11C4( self, var_0.animation );
        self notify( "starting_anim" );
        var_0 maps\_anim::_id_11C3( self, var_0.animation );
        self setgoalpos( self.origin );
    }
    else
        maps\_utility::_id_1237( var_0.origin );
}

_id_51FE( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !var_1.size )
        return;

    var_2 = undefined;

    if ( var_1.size > 1 )
    {
        common_scripts\utility::array_thread( var_1, ::_id_5200, var_0 );
        level waittill( var_0, var_2 );
    }
    else
        var_1[0] waittill( "trigger", var_2 );

    return var_2;
}

_id_51FF( var_0, var_1 )
{
    return lengthsquared( ( var_0[0] - var_1[0], var_0[1] - var_1[1], 0 ) );
}

_id_5200( var_0 )
{
    self endon( var_0 );
    self waittill( "trigger", var_1 );
    level notify( var_0, var_1 );
}

_id_17CC( var_0 )
{
    if ( level._id_16C9 )
        return;

    level notify( "now_fade_in" );
    var_1 = _id_473C();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 0;
    wait(var_0);
}

_id_09FA( var_0 )
{
    var_1 = _id_473C();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 1;
    wait(var_0);
}

_id_473C()
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D.sort = -1;
    level._id_473D.foreground = 0;
    return level._id_473D;
}

_id_5201( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "level_cleanup";

    self endon( "death" );
    level waittill( var_0 );

    if ( common_scripts\utility::flag_exist( "_stealth_spotted" ) )
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );

    if ( isdefined( self._id_0D04 ) && self._id_0D04 )
        maps\_utility::_id_1902();

    self delete();
}

_id_5202( var_0, var_1, var_2 )
{
    level endon( "level_cleanup" );
    var_0 endon( "stop_flicker" );
    var_0._id_1646 = [];
    var_0._id_5203 = 0;

    if ( isdefined( var_0.script_linkto ) )
    {
        var_3 = var_0 common_scripts\utility::get_linked_ents();
        var_0._id_5204 = [];
        var_0._id_5205 = [];

        foreach ( var_5 in var_3 )
        {
            if ( var_5.script_noteworthy == "off" )
            {
                var_0._id_5205 = maps\_utility::_id_0BC3( var_0._id_5205, var_5 );
                continue;
            }

            var_0._id_5204 = maps\_utility::_id_0BC3( var_0._id_5204, var_5 );
        }

        foreach ( var_8 in var_0._id_5204 )
        {
            if ( isdefined( var_8.script_linkto ) )
            {
                var_9 = var_8 common_scripts\utility::get_linked_ent();
                var_8._id_164E = common_scripts\utility::createoneshoteffect( var_9.script_fxid );
                var_8._id_164E.v["origin"] = var_9.origin;
                var_8._id_164E.v["angles"] = var_9.angles;
            }
        }

        var_0._id_5203 = 1;
    }

    for (;;)
    {
        var_11 = randomfloatrange( var_1, var_2 );
        var_0 setlightintensity( var_11 );

        if ( var_11 > 0.4 )
            var_0 _id_5206();
        else
            var_0 _id_5207();

        wait(randomfloatrange( 0.1, 0.2 ));
    }
}

_id_5206()
{
    if ( !self._id_5203 )
        return;

    foreach ( var_1 in self._id_5204 )
        var_1 show();

    foreach ( var_1 in self._id_5205 )
        var_1 hide();
}

_id_5207()
{
    if ( !self._id_5203 )
        return;

    foreach ( var_1 in self._id_5204 )
        var_1 hide();

    foreach ( var_1 in self._id_5205 )
        var_1 show();
}

_id_5208( var_0, var_1 )
{
    level endon( "level_cleanup" );
    var_0 endon( "stop_movement" );
    var_2 = var_0.origin;

    for (;;)
    {
        var_3 = 0.05 + randomint( 4 ) / 10;
        var_0 moveto( var_2 - ( randomint( var_1 ), randomint( var_1 ), randomint( var_1 ) ), var_3 );
        wait(var_3);
    }
}

_id_5209( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    self.fixednode = 0;
    self.ignoreall = 0;
    self.favoriteenemy = var_0;
    self getenemyinfo( var_0 );
    var_0.health = 1;
    wait 0.3;
    var_0._id_0FA0 = undefined;
    wait 0.3;
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_0 gettagorigin( "j_head" );
    var_3 = bullettrace( var_1, var_2, 1 );

    while ( !isdefined( self.a._id_0C6D ) || self.a._id_0C6D["single"].size <= 0 )
        wait 0.05;

    var_4 = randomint( self.a._id_0C6D["single"].size );
    var_5 = self.a._id_0C6D["single"][var_4];
    var_6 = 0.1 / weaponfiretime( self.weapon );
    self setflaggedanimknobrestart( "fire_notify", var_5, 1, 0.05, 1.0 );
    wait 0.1;
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_0 gettagorigin( "j_head" );
    magicbullet( self.weapon, var_1, var_2 );
    wait 0.2;
    var_0 kill();
}

_id_520A( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstructarray( var_0, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        var_6 = common_scripts\utility::spawn_tag_origin();
        var_6.origin = var_5.origin;

        if ( isdefined( var_5.script_delay ) )
            var_6.script_delay = var_5.script_delay;

        var_3[var_3.size] = var_6;
        var_6 thread _id_520B( "kill_" + var_0, var_1 );
    }

    level waittill( "kill_" + var_0 );
    wait 0.1;

    foreach ( var_6 in var_3 )
        var_6 delete();
}

_id_520B( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 20;

    if ( isdefined( var_0 ) )
        level endon( var_0 );

    maps\_utility::script_delay();

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "smoke_grenade" ), self, "tag_origin" );
        wait(var_1);
    }
}

_id_520C( var_0 )
{
    self notify( var_0 );
}

_id_520D( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( var_0 );
    var_2 = var_1 common_scripts\utility::get_linked_ents();

    foreach ( var_4 in var_2 )
        var_4 linkto( var_1 );

    return var_1;
}

_id_520E( var_0, var_1 )
{
    var_2 = common_scripts\utility::get_target_ent( var_0 );

    for (;;)
    {
        if ( _id_520F( var_2, var_1 ) )
            break;

        wait 0.2;
    }
}

_id_520F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = getaiarray( "axis" );
    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        if ( var_5 istouching( var_0 ) )
        {
            var_3 += 1;

            if ( var_3 > var_1 )
                return 0;
        }
    }

    return 1;
}

_id_5210( var_0 )
{
    wait 1.5;

    if ( isdefined( var_0 ) )
        self playsound( var_0 );
    else
        self playsound( "wood_door_kick" );

    self rotateto( self.angles + ( 0.0, 30.0, 0.0 ), 0.4, 0, 0.4 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, 55.0, 0.0 ), 1.2, 0, 0.4 );
}

_id_5211( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        wait 0.4;

    if ( isdefined( var_0 ) )
        self playsound( var_0 );
    else
        self playsound( "wood_door_kick" );

    self rotateto( self.angles + ( 0.0, 100.0, 0.0 ), 0.3, 0.2, 0.1 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles - ( 0.0, 5.0, 0.0 ), 0.1, 0.0, 0.1 );
    self waittill( "rotatedone" );
    self disconnectpaths();
}

_id_5212( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        wait 0.4;

    if ( isdefined( var_0 ) )
        self playsound( var_0 );
    else
        self playsound( "wood_door_kick" );

    self rotateto( self.angles - ( 0.0, 100.0, 0.0 ), 0.3, 0.2, 0.1 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, 5.0, 0.0 ), 0.1, 0.0, 0.1 );
}

_id_5213( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_3 ) )
        wait(var_3);
    else
        wait 0.5;

    if ( isdefined( var_2 ) )
        var_0 playsound( var_2 );
    else
        var_0 playsound( "wood_door_kick" );

    if ( isdefined( var_4 ) )
    {
        if ( !isdefined( var_4.script_fxid ) )
            var_4.script_fxid = "door_kick";

        if ( !isdefined( var_4.angles ) )
            var_4.angles = ( 0.0, 0.0, 0.0 );

        playfx( common_scripts\utility::getfx( var_4.script_fxid ), var_4.origin, anglestoforward( var_4.angles ) );
    }

    var_0 rotateto( var_0.angles + ( 0.0, 100.0, 0.0 ), 0.4, 0.2, 0.1 );
    var_1 rotateto( var_1.angles - ( 0.0, 100.0, 0.0 ), 0.4, 0.2, 0.1 );
    var_0 waittill( "rotatedone" );
    var_1 connectpaths();
    var_0 connectpaths();
    var_0 rotateto( var_0.angles - ( 0.0, 5.0, 0.0 ), 0.2, 0.0, 0.1 );
    var_1 rotateto( var_1.angles + ( 0.0, 5.0, 0.0 ), 0.2, 0.0, 0.1 );
    var_0 waittill( "rotatedone" );
    var_1 disconnectpaths();
    var_0 disconnectpaths();
}

_id_5214()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

_id_5215()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( self.script_delay ) )
            maps\_utility::script_delay();

        var_0 = self.script_delay_min;
        var_1 = self.script_delay_max;
        var_2 = self._id_1662;
        var_3 = self.script_noteworthy;
        var_3 = strtok( var_3, " " );
        var_4 = common_scripts\utility::get_target_ent();
        var_5 = var_4 common_scripts\utility::get_target_ent();
        var_6 = var_4.radius;
        var_7 = var_5.radius;

        if ( !isdefined( var_6 ) )
            var_6 = 0.1;

        if ( !isdefined( var_7 ) )
            var_7 = 0.1;

        var_8 = 0;
        var_9 = [ "molotov", "fraggrenade", "flashbang" ];

        if ( !isdefined( var_2 ) )
        {
            if ( maps\_utility::_id_0AD1( var_9, var_3[0] ) )
                magicgrenade( var_3[0], var_4.origin, var_5.origin );
            else
                magicbullet( var_3[0], var_4.origin, var_5.origin );

            break;
        }
        else
        {
            while ( var_8 < var_2 )
            {
                if ( maps\_utility::_id_0AD1( var_9, var_3[0] ) )
                    magicgrenade( var_3[randomintrange( 0, var_3.size )], var_4.origin + ( randomfloatrange( -1 * var_6, var_6 ), randomfloatrange( -1 * var_6, var_6 ), randomfloatrange( -1 * var_6, var_6 ) ), var_5.origin + ( randomfloatrange( -1 * var_7, var_7 ), randomfloatrange( -1 * var_7, var_7 ), randomfloatrange( -1 * var_7, var_7 ) ) );
                else
                    magicbullet( var_3[randomintrange( 0, var_3.size )], var_4.origin + ( randomfloatrange( -1 * var_6, var_6 ), randomfloatrange( -1 * var_6, var_6 ), randomfloatrange( -1 * var_6, var_6 ) ), var_5.origin + ( randomfloatrange( -1 * var_7, var_7 ), randomfloatrange( -1 * var_7, var_7 ), randomfloatrange( -1 * var_7, var_7 ) ) );

                var_10 = randomfloatrange( var_0, var_1 );
                var_8 += var_10;
                wait(var_10);
            }
        }

        if ( isdefined( self._id_5216 ) )
            break;
    }
}

_id_5217( var_0, var_1, var_2, var_3, var_4 )
{
    if ( maps\_utility::_id_2625() )
        return;

    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_5 endon( "death" );
    self._id_5218 = var_5;
    thread maps\_utility::_id_2624( var_5, "sounddone" );

    if ( isdefined( var_1 ) )
        var_5 linkto( self, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    else
    {
        var_5.origin = self.origin;
        var_5.angles = self.angles;
        var_5 linkto( self );
    }

    var_5 playsound( var_0, "sounddone" );

    if ( isdefined( var_2 ) )
    {
        if ( !isdefined( maps\_utility_code::_id_13EC( var_5 ) ) )
            var_5 stopsounds();

        wait 0.05;
    }
    else
        var_5 waittill( "sounddone" );

    if ( isdefined( var_3 ) )
        self notify( var_3 );

    var_5 delete();
}

_id_5219()
{
    playfxontag( common_scripts\utility::getfx( "flashlight" ), self, "TAG_FLASH" );
}

_id_521A()
{
    level.player endon( "death" );
    self waittill( "trigger" );
    maps\_utility::script_delay();
    level.player disableinvulnerability();
    level.player kill();
}

_id_521B()
{
    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent();
    else
        var_0 = self;

    var_0 thread maps\_anim::_id_11C8( self, self.animation );
}

_id_521C( var_0 )
{
    level endon( var_0 );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( var_0 );
}

_id_521D( var_0 )
{
    thread _id_521E( var_0 );
}

_id_521E( var_0 )
{
    self endon( "death" );
    self endon( "clear_idle_anim" );

    for (;;)
    {
        maps\_utility::_id_26FA( var_0 );
        self waittill( "clearing_specialIdleAnim" );
    }
}

_id_521F( var_0 )
{
    common_scripts\utility::waittill_either( "death", "damage" );
    common_scripts\utility::flag_set( var_0 );
}

_id_5220( var_0, var_1, var_2, var_3 )
{
    maps\_anim::_id_11C4( var_0, var_1, var_2 );
    self notify( "starting_anim" );
    var_0 notify( "starting_anim" );

    if ( isdefined( var_3 ) )
        maps\_anim::_id_11CC( var_0, var_3, var_1, var_2 );
    else
        maps\_anim::_id_11C1( var_0, var_1, var_2 );
}

_id_5221( var_0, var_1 )
{
    self endon( var_0 );
    common_scripts\utility::flag_wait( var_1 );
}

_id_5222( var_0 )
{
    var_0 waittill( "death" );
    self delete();
}

_id_5223()
{
    for (;;)
    {
        self waittill( "trigger" );
        maps\_utility::script_delay();
        var_0 = anglestoforward( level.player.angles );
        level.player dodamage( 50, level.player.origin + var_0 );
        wait 1;
    }
}
