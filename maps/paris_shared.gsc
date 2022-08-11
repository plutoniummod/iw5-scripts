// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5074()
{

}

_id_5075( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "script_noteworthy" );
    level.player setorigin( var_1.origin );

    if ( isdefined( var_1.angles ) )
        level.player setplayerangles( var_1.angles );

    var_2 = getentarray( "hero", "script_noteworthy" );

    foreach ( var_4 in var_2 )
    {
        if ( isspawner( var_4 ) )
            var_2 = common_scripts\utility::array_remove( var_2, var_4 );
    }

    var_6 = common_scripts\utility::getstructarray( var_1.target, "targetname" );

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
    {
        if ( var_7 < var_6.size )
        {
            var_2[var_7] forceteleport( var_6[var_7].origin, var_6[var_7].angles );
            var_2[var_7] setgoalpos( var_6[var_7].origin );
            continue;
        }

        var_2[var_7] forceteleport( level.player.origin, level.player.angles );
        var_2[var_7] setgoalpos( level.player.origin );
    }
}

_id_5076( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );
    return var_2;
}

_id_5077()
{
    level._id_5078 = [];
    level._id_5079 = [];
    maps\_utility::_id_1A5A( "axis", ::_id_507A );

    foreach ( var_1 in getaiarray( "axis" ) )
    {
        if ( !isspawner( var_1 ) && isalive( var_1 ) )
            var_1 _id_507A();
    }
}

_id_507A()
{
    if ( isdefined( self.script_noteworthy ) )
    {
        if ( isdefined( level._id_5078[self.script_noteworthy] ) )
            level._id_5078[self.script_noteworthy] += 1;
        else
            level._id_5078[self.script_noteworthy] = 1;

        thread _id_507B();
    }
}

_id_507B()
{
    var_0 = self.script_noteworthy;
    self waittill( "death" );

    if ( isdefined( level._id_5079[var_0] ) )
        level._id_5079[var_0] += 1;
    else
        level._id_5079[var_0] = 1;
}

_id_507C( var_0 )
{
    if ( isarray( var_0 ) )
    {
        var_1 = 0;

        foreach ( var_3 in var_0 )
            var_1 += _id_507C( var_3 );

        return var_1;
    }

    if ( isdefined( level._id_5078[var_0] ) )
        return level._id_5078[var_0];
    else
        return 0;
}

_id_507D( var_0 )
{
    if ( isarray( var_0 ) )
    {
        var_1 = 0;

        foreach ( var_3 in var_0 )
            var_1 += _id_507D( var_3 );

        return var_1;
    }

    if ( isdefined( level._id_5079[var_0] ) )
        return level._id_5079[var_0];
    else
        return 0;
}

_id_507E( var_0 )
{
    return _id_507C( var_0 ) - _id_507D( var_0 );
}

_id_507F( var_0, var_1, var_2 )
{
    if ( !isarray( var_1 ) )
        var_1 = [ var_1 ];

    waittillframeend;

    for (;;)
    {
        var_3 = 0;

        foreach ( var_5 in var_1 )
            var_3 += _id_507E( var_5 );

        if ( var_3 <= var_0 )
            break;

        wait 1;
    }
}

_id_5080( var_0, var_1, var_2 )
{
    if ( !isarray( var_1 ) )
        var_1 = [ var_1 ];

    for (;;)
    {
        var_3 = 0;

        foreach ( var_5 in var_1 )
            var_3 += _id_507D( var_5 );

        if ( var_3 >= var_0 )
            break;

        wait 1;
    }
}

_id_5081( var_0 )
{
    if ( !isarray( var_0 ) )
        var_0 = [ var_0 ];

    foreach ( var_2 in var_0 )
    {
        foreach ( var_4 in getentarray( var_2, "script_noteworthy" ) )
        {
            if ( isspawner( var_4 ) )
                var_4 delete();
        }
    }
}

_id_5082( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
    {
        if ( self [[ var_1 ]]( var_4 ) )
            var_2[var_5] = var_4;
    }

    return var_2;
}

_id_5083( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 512;

    var_2 = [];

    foreach ( var_4 in getentarray( var_0, "script_noteworthy" ) )
    {
        if ( isspawner( var_4 ) )
        {
            var_4 delete();
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    thread maps\_utility::_id_2756( var_2, var_1 );
}

_id_5084( var_0, var_1, var_2 )
{
    common_scripts\utility::array_thread( var_0, maps\_anim::_id_127D, var_1, var_2, "generic" );
}

_id_5085( var_0, var_1, var_2 )
{
    self endon( "stop_goto_node" );

    if ( !isdefined( var_2 ) )
        var_2 = 16;

    maps\_utility::_id_2724( var_2 );

    if ( isstring( var_0 ) )
        var_3 = getnode( var_0, "script_noteworthy" );
    else
        var_3 = var_0;

    if ( isdefined( var_3 ) )
        maps\_utility::_id_2053( var_3 );
    else
    {
        var_3 = common_scripts\utility::getstruct( var_0, "script_noteworthy" );
        maps\_utility::_id_1237( var_3.origin );
    }

    if ( var_1 )
        self waittill( "goal" );
}

_id_5086( var_0 )
{
    return !var_0 _id_508A();
}

_id_5087( var_0 )
{
    self._id_404B = self._id_1032;
    self._id_1032 = var_0;
    self._id_5088 = 1;
}

_id_5089()
{
    self._id_1032 = self._id_404B;
    self._id_404B = undefined;
    self._id_5088 = undefined;
}

_id_508A()
{
    return isdefined( self._id_5088 );
}

_id_508B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "(undefined)";

    return var_0 + "";
}

_id_508C( var_0, var_1, var_2 )
{
    waittillframeend;
    maps\_anim::_id_127B( var_0, var_1, var_2 );
    wait 0.05;
    maps\_anim::_id_127B( var_0, var_1, var_2 );
}

_id_508D( var_0, var_1, var_2 )
{
    for (;;)
    {
        var_3 = var_0 - self.origin;
        var_4 = length( var_3 );

        if ( var_4 < var_1 )
            break;

        var_5 = vectordot( self getvelocity(), vectornormalize( var_3 ) );

        if ( var_5 > 0 )
        {
            var_6 = var_4 / var_5;

            if ( var_6 < var_2 )
                break;
        }

        common_scripts\utility::waitframe();
    }
}

_id_508E( var_0 )
{
    self waittill( var_0 );
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

_id_508F()
{
    maps\_utility::_id_1A5A( "axis", ::_id_5091 );

    foreach ( var_1 in getaiarray( "axis" ) )
    {
        if ( isalive( var_1 ) )
            var_1 _id_5091();
    }
}

_id_5090()
{
    maps\_utility::_id_26BB( "axis", ::_id_5091 );

    foreach ( var_1 in getaiarray( "axis" ) )
    {
        if ( isalive( var_1 ) )
            var_1 _id_5092();
    }
}

_id_5091()
{
    if ( isdefined( self.grenadeammo ) && !isdefined( self._id_4237 ) )
        self._id_4237 = self.grenadeammo;

    self.grenadeammo = 0;
}

_id_5092()
{
    if ( isdefined( self._id_4237 ) )
    {
        self.grenadeammo = self._id_4237;
        self._id_4237 = undefined;
    }
}

_id_5093( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in getentarray( var_0, "targetname" ) )
    {
        if ( isspawner( var_4 ) )
        {
            var_5 = var_4.script_noteworthy;

            if ( isdefined( var_1 ) )
                var_5 = var_1;

            var_2[var_2.size] = _id_5094( var_4, var_5, var_4.origin, var_4.angles );
        }
    }

    var_7 = common_scripts\utility::getstructarray( var_0, "targetname" );

    foreach ( var_9 in var_7 )
    {
        var_10 = var_9.script_noteworthy;
        var_11 = getentarray( var_10, "classname" );
        var_12 = undefined;

        foreach ( var_14 in var_11 )
        {
            if ( isspawner( var_14 ) && isdefined( var_14.script_noteworthy ) && var_14.script_noteworthy == "corpse_spawner" )
            {
                var_12 = var_14;
                break;
            }
        }

        if ( isdefined( var_12 ) )
        {
            var_2[var_2.size] = _id_5094( var_12, var_9._id_205B, var_9.origin, var_9.angles );
            continue;
        }
    }

    return var_2;
}

_id_5094( var_0, var_1, var_2, var_3 )
{
    var_0.count++;
    var_4 = undefined;

    for (;;)
    {
        var_4 = var_0 maps\_utility::_id_166F( 1 );

        if ( isdefined( var_4 ) )
            break;

        common_scripts\utility::waitframe();
    }

    if ( isdefined( var_4 ) )
    {
        var_4._id_1032 = "generic";
        var_4 maps\_utility::_id_24F5();
        var_4 forceteleport( var_2, var_3 );
        var_5 = var_4 maps\_utility::_id_1281( var_1 );
        var_4 maps\_anim::_id_11C0( var_4, var_1 );
        var_6 = maps\_vehicle_aianim::_id_25C1( var_4 );
        var_6 setanim( var_5, 1, 0.2 );
        var_6 notsolid();
        return var_6;
    }
}

_id_5095( var_0, var_1 )
{
    if ( isstring( var_1 ) )
        var_1 = maps\_utility::_id_1281( var_1 );

    var_2 = getstartorigin( var_0.origin, var_0.angles, var_1 );
    var_3 = getstartangles( var_0.origin, var_0.angles, var_1 );
    var_4 = anglestoforward( var_3 );

    while ( distance( var_2, self.origin ) > 512 || vectordot( var_2 - self.origin, var_4 ) > 0 )
        common_scripts\utility::waitframe();
}

_id_5096( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( isstring( var_1 ) )
        var_1 = maps\_utility::_id_1281( var_1 );

    var_7 = getstartorigin( var_0.origin, var_0.angles, var_1 );
    var_8 = getstartangles( var_0.origin, var_0.angles, var_1 );
    var_9 = self.origin;
    var_10 = self.angles;

    if ( var_2 )
    {
        if ( var_3 )
            var_10 = ( var_8[0], self.angles[1], var_8[2] );
        else
        {
            var_9 = var_7;
            var_10 = var_8;

            if ( distance( var_9, self.origin ) > 3 )
                self vehicle_teleport( var_9, var_10 );
        }
    }

    var_14 = transformmove( var_9, var_10, var_7, var_8, var_0.origin, var_0.angles );

    if ( isdefined( self._id_5097 ) )
        self animscripted( "vehicle_scripted_animation", var_14["origin"], var_14["angles"], var_1, "normal", self._id_5097 );
    else
        self animscripted( "vehicle_scripted_animation", var_14["origin"], var_14["angles"], var_1 );

    self setflaggedanim( "vehicle_scripted_animation", var_1, 1, 0, var_5 );
    self._id_5098 = self vehicle_getvelocity();
    childthread _id_509A( var_6 );
    self waittillmatch( "vehicle_scripted_animation", "end" );

    if ( isdefined( var_4 ) )
    {
        self stopanimscripted();
        thread maps\_vehicle::_id_26A1( var_4, 0 );
        self startpath( var_4 );
        var_15 = length( self._id_5098 ) / 17.6;
        self vehicle_setspeedimmediate( var_15, 100, 100 );
        self resumespeed( 10 );
    }
}

_id_5099( var_0, var_1, var_2, var_3 )
{
    var_4 = getstartorigin( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_1 );
    var_5 = getstartangles( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_1 );
    var_6 = transformmove( self.origin, self.angles, var_4, var_5, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        self animscripted( var_0, var_6["origin"], var_6["angles"], var_1, var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self animscripted( var_0, var_6["origin"], var_6["angles"], var_1, var_2 );
    else
        self animscripted( var_0, var_6["origin"], var_6["angles"], var_1 );
}

_id_509A( var_0 )
{
    self endon( "death" );
    self endon( "vehicle_scripted_animation_done" );
    var_1 = 0;

    for (;;)
    {
        waittillframeend;

        if ( self isphysveh() )
            self._id_5098 = self vehicle_getvelocity();
        else
        {
            if ( isdefined( self._id_509B ) )
                self._id_5098 = ( self.origin - self._id_509B ) * 20;
            else
                self._id_5098 = ( 0.0, 0.0, 0.0 );

            self._id_509B = self.origin;
        }

        common_scripts\utility::waitframe();
        var_1++;
    }
}

_id_509C( var_0, var_1 )
{
    switch ( var_1.size )
    {
        case 0:
            self [[ var_0 ]]();
            break;
        case 1:
            self [[ var_0 ]]( var_1[0] );
            break;
        case 2:
            self [[ var_0 ]]( var_1[0], var_1[1] );
            break;
        case 3:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2] );
            break;
        case 4:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3] );
            break;
        case 5:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3], var_1[4] );
            break;
        case 6:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3], var_1[4], var_1[5] );
            break;
        case 7:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3], var_1[4], var_1[5], var_1[6] );
            break;
        case 8:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3], var_1[4], var_1[5], var_1[6], var_1[7] );
            break;
        case 9:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3], var_1[4], var_1[5], var_1[6], var_1[7], var_1[8] );
            break;
        case 10:
            self [[ var_0 ]]( var_1[0], var_1[1], var_1[2], var_1[3], var_1[4], var_1[5], var_1[6], var_1[7], var_1[8], var_1[9] );
            break;
        default:
    }
}

_id_509D( var_0, var_1 )
{
    maps\_utility::_id_09C9( ::_id_509C, var_0, var_1 );
}

_id_509E( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        level.scr_sound[var_0][var_3] = var_3;
}

_id_47C7( var_0 )
{
    foreach ( var_2 in var_0 )
        level._id_11BB[var_2] = var_2;
}

_id_509F()
{
    common_scripts\utility::flag_waitopen( "flag_conversation_in_progress" );
    common_scripts\utility::flag_set( "flag_conversation_in_progress" );
}

_id_50A0()
{
    common_scripts\utility::flag_clear( "flag_conversation_in_progress" );
}

_id_50A1( var_0, var_1, var_2 )
{
    thread _id_50A2( var_0, var_1, var_2 );
}

_id_50A2( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        objective_onentity( var_0, var_1, var_2 );
    else
        objective_onentity( var_0, var_1 );

    var_1 waittill( "death" );
    objective_position( var_0, ( 0.0, 0.0, 0.0 ) );
}

_id_460E()
{
    self.ignoreall = 1;
    self._id_100A = 1;
    self.ignoresuppression = 1;
    self._id_460D = self.suppressionwait;
    self.suppressionwait = 0;
    maps\_utility::_id_0EEC();
    self.ignorerandombulletdamage = 1;
    maps\_utility::_id_2714();
    maps\_utility::_id_1057();
    self.grenadeawareness = 0;
    self.ignoreme = 1;
    maps\_utility::_id_27CC();
    self._id_1106 = 1;
    maps\_utility::_id_1058( 1 );
}

_id_460C()
{
    self.ignoreall = 0;
    self._id_100A = undefined;
    self.ignoresuppression = 0;

    if ( isdefined( self._id_460D ) )
    {
        self.suppressionwait = self._id_460D;
        self._id_460D = undefined;
    }

    maps\_utility::_id_27B8();
    self.ignorerandombulletdamage = 0;
    maps\_utility::_id_2715();
    maps\_utility::_id_1071();
    self.grenadeawareness = 1;
    self.ignoreme = 0;
    maps\_utility::_id_27CD();
    self._id_1106 = undefined;
    maps\_utility::_id_1058( 0 );
}

_id_50A3( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_3 hide();
    var_0 maps\_anim::_id_11CF( var_3, var_2, var_1 );

    if ( isdefined( var_0.classname ) && var_0.classname != "script_struct" )
        var_3 linkto( var_0, var_1 );

    return var_3;
}

_id_50A4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self disableweapons();
    self allowstand( 1 );
    self allowcrouch( 0 );
    self allowprone( 0 );
    self allowsprint( 0 );
    self setstance( "stand" );

    if ( var_0 )
    {
        while ( self getstance() != "stand" || self isthrowinggrenade() || self isswitchingweapon() )
            common_scripts\utility::waitframe();
    }
}

_id_50A5()
{
    self enableweapons();
    self allowstand( 1 );
    self allowcrouch( 1 );
    self allowprone( 1 );
    self allowsprint( 1 );
}

_id_50A6( var_0 )
{
    if ( isstring( var_0 ) )
        var_0 = maps\_utility::_id_1281( var_0 );

    var_1 = getstartorigin( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_0 );
    var_2 = getstartangles( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_0 );
    var_3 = transformmove( self.origin, self.angles, var_1, var_2, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 = spawnstruct();
    var_4.origin = var_3["origin"];
    var_4.angles = var_3["angles"];
    return var_4;
}

_id_50A7( var_0 )
{
    self endon( "stop_mask_bob" );
    var_1 = 0;
    var_2 = level.player getplayerangles();
    var_3 = 0;
    var_4 = 0;
    var_5 = var_0.y;
    var_6 = var_0.x;
    var_7 = 0.05;

    for (;;)
    {
        if ( isdefined( var_0 ) )
        {
            var_8 = level.player getplayerangles();
            var_9 = level.player getvelocity();
            var_10 = var_9[2];
            var_9 -= var_9 * ( 0.0, 0.0, 1.0 );
            var_11 = length( var_9 );
            var_12 = level.player getstance();
            var_13 = clamp( var_11, 0, 280 ) / 280;
            var_14 = 0.1 + var_13 * 0.25;
            var_15 = 0.1 + var_13 * 0.25;
            var_16 = 1.0;

            if ( var_12 == "crouch" )
                var_16 = 0.75;

            if ( var_12 == "prone" )
                var_16 = 0.4;

            if ( var_12 == "stand" )
                var_16 = 1.0;

            var_17 = 5.0;
            var_18 = 0.9;
            var_19 = level.player playerads();
            var_20 = var_17 * ( 1.0 - var_19 ) + var_18 * var_19;
            var_20 *= ( 1 + var_13 * 2 );
            var_21 = 5;
            var_22 = var_21 * var_14 * var_16;
            var_23 = var_21 * var_15 * var_16;
            var_1 += var_7 * 1000.0 * var_20;
            var_24 = 57.2958;
            var_25 = sin( var_1 * 0.001 * var_24 );
            var_26 = sin( var_1 * 0.0007 * var_24 );
            var_27 = angleclamp180( var_8[1] - var_2[1] );
            var_27 = clamp( var_27, -10, 10 );
            var_28 = var_27 / 10 * var_21 * ( 1 - var_14 );
            var_29 = var_28 - var_4;
            var_4 += clamp( var_29, -1.0, 1.0 );
            var_30 = clamp( var_10, -200, 200 ) / 200 * var_21 * ( 1 - var_15 );
            var_31 = var_30 - var_3;
            var_3 += clamp( var_31, -0.6, 0.6 );
            var_0 moveovertime( 0.05 );
            var_0.x = var_6 + clamp( var_25 * var_22 + var_4 - var_21, 0 - 2 * var_21, 0 );
            var_0.y = var_5 + clamp( var_26 * var_23 + var_3 - var_21, 0 - 2 * var_21, 0 );
            var_2 = var_8;
        }

        wait(var_7);
    }
}

_id_50A8( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0.25;

    if ( var_0 )
        _id_09FA( var_1 );

    sethudlighting( 1 );
    self._id_4C10 = newclienthudelem( self );
    self._id_4C10.x = 0;
    self._id_4C10.y = 0;
    self._id_4C10.horzalign = "fullscreen";
    self._id_4C10.vertalign = "fullscreen";
    self._id_4C10.foreground = 0;
    self._id_4C10.sort = -1;
    self._id_4C10 setshader( "gasmask_overlay_delta2_top", 650, 138 );
    self._id_4C10.alpha = 1.0;
    self._id_0054 = newclienthudelem( self );
    self._id_0054.x = 0;
    self._id_0054.y = 352;
    self._id_0054.horzalign = "fullscreen";
    self._id_0054.vertalign = "fullscreen";
    self._id_0054.foreground = 0;
    self._id_0054.sort = -1;
    self._id_0054 setshader( "gasmask_overlay_delta2_bottom", 650, 138 );
    self._id_0054.alpha = 1.0;
    level.player maps\_utility::delaythread( 1.0, ::_id_50AA );
    maps\_utility::vision_set_fog_changes( "paris_gasmask", 0.5 );
    thread _id_50A7( self._id_4C10 );
    thread _id_50A7( self._id_0054 );

    if ( var_0 )
    {
        wait(var_3);
        _id_17CC( var_2 );
    }
}

_id_50A9()
{
    _id_09FA( 0.25 );
    self notify( "stop_mask_bob" );

    if ( isdefined( self._id_4C10 ) )
    {
        self._id_4C10 destroy();
        self._id_4C10 = undefined;
    }

    if ( isdefined( self._id_0054 ) )
    {
        self._id_0054 destroy();
        self._id_0054 = undefined;
    }

    sethudlighting( 0 );
    maps\_utility::vision_set_fog_changes( "paris_catacombs", 0 );
    level.player notify( "stop_breathing" );
    wait 0.25;
    _id_17CC( 1.5 );
}

_id_50AA()
{
    var_0 = 1.0;
    self endon( "stop_breathing" );

    for (;;)
    {
        maps\_utility::play_sound_on_entity( "breathing_gasmask" );
        wait(var_0);
    }
}

_id_50AB()
{
    self._id_50AC = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    self._id_50AC setmodel( "prop_sas_gasmask" );
    self._id_50AC linkto( self, "tag_eye", ( -4.0, 0.0, 2.0 ), ( 120.0, 0.0, 0.0 ) );
}

_id_50AD()
{
    if ( isdefined( self._id_50AC ) )
        self._id_50AC delete();
}

_id_50AE( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 0.7;

    if ( !isdefined( var_2 ) )
        var_2 = 1.3;

    if ( !isdefined( var_3 ) )
        var_3 = 0.5;

    self notify( "ally_keep_player_distance_stop" );
    self endon( "ally_keep_player_distance_stop" );
    var_4 = 0.05;
    var_5 = 1.5;
    var_6 = 1 - var_4;

    if ( var_0 > 0 )
    {
        var_7 = var_0 * ( ( 1 - var_1 ) / var_3 + 1 );
        var_8 = var_0 * ( ( 1 - var_2 ) / var_3 + 1 );
    }
    else
    {
        var_7 = -1 * var_0 * ( ( 1 - var_1 ) / var_3 + 1 ) + var_0 * 2;
        var_8 = -1 * var_0 * ( ( 1 - var_2 ) / var_3 + 1 ) + var_0 * 2;
    }

    var_9 = _id_50B1( var_0, var_7, var_8, var_1, var_2 );
    var_10 = self._id_0FC6;

    for (;;)
    {
        if ( isdefined( self.velocity ) && length( self.velocity ) < 0.01 )
        {
            self._id_0FC6 = 1;
            var_10 = 1;
        }
        else
        {
            var_11 = common_scripts\utility::flat_origin( self.origin - level.player.origin );
            var_12 = vectornormalize( var_11 );
            var_13 = anglestoforward( common_scripts\utility::flat_angle( self.angles ) );
            var_14 = anglestoforward( common_scripts\utility::flat_angle( level.player getplayerangles() ) );
            var_15 = ( 0.0, 0.0, 0.0 );

            if ( isdefined( self.goalpos ) && distance( self.goalpos, self.origin ) > 32 )
            {
                var_16 = vectornormalize( common_scripts\utility::flat_origin( self.goalpos - level.player.origin ) );
                var_15 += var_16 * clamp( vectordot( var_16, var_14 ), 0, 1 );
            }

            var_15 += var_13 * clamp( vectordot( var_13, var_14 ), 0, 1 );
            var_15 += -1.0 * var_12 * clamp( -1.0 * vectordot( var_11, var_13 ), 0, 1 );
            var_17 = clamp( length( var_15 ) / var_5, 0, 1 );

            if ( isdefined( self.goalpos ) )
            {
                var_18 = 96;
                var_19 = 64;
                var_17 *= clamp( ( distance( self.goalpos, self.origin ) - var_19 ) / ( var_18 - var_19 ), 0, 1 );
            }

            var_20 = vectornormalize( var_15 );
            var_21 = vectordot( var_11, var_20 );
            var_22 = _id_50B1( var_21, var_7, var_8, var_1, var_2 );
            var_23 = ( var_22 - 1 ) * var_17 + 1;
            var_24 = var_23 * var_4 + var_10 * var_6;
            var_10 = self._id_0FC6;
            self._id_0FC6 = var_24;
        }

        common_scripts\utility::waitframe();
    }
}

_id_50AF()
{
    self notify( "ally_keep_player_distance_stop" );
    self._id_0FC6 = 1;
}

_id_50B0( var_0, var_1, var_2, var_3, var_4 )
{
    return var_3 + ( var_0 - var_1 ) * ( var_4 - var_3 ) / ( var_2 - var_1 );
}

_id_50B1( var_0, var_1, var_2, var_3, var_4 )
{
    return clamp( _id_50B0( var_0, var_1, var_2, var_3, var_4 ), var_3, var_4 );
}

_id_50B2( var_0, var_1, var_2 )
{
    return angleclamp( var_0 + angleclamp180( var_1 - var_0 ) * var_2 );
}

_id_50B3( var_0, var_1, var_2 )
{
    return ( _id_50B2( var_0[0], var_1[0], var_2 ), _id_50B2( var_0[1], var_1[1], var_2 ), _id_50B2( var_0[2], var_1[2], var_2 ) );
}

_id_50B4()
{
    self endon( "death" );
    self.accuracy = 0.08;
    maps\_utility::_id_2131( 1 );
}

_id_50B5()
{
    self endon( "death" );
    self.accuracy = 0.08;
}

_id_441E( var_0 )
{
    self endon( "death" );

    if ( !issentient( self ) || !isalive( self ) )
        return;

    if ( isdefined( self._id_441E ) && self._id_441E )
        return;

    self._id_441E = 1;

    if ( isdefined( var_0 ) )
        wait(randomfloat( var_0 ));

    var_1 = [];
    var_1[0] = "j_hip_le";
    var_1[1] = "j_hip_ri";
    var_1[2] = "j_head";
    var_1[3] = "j_spine4";
    var_1[4] = "j_elbow_le";
    var_1[5] = "j_elbow_ri";
    var_1[6] = "j_clavicle_le";
    var_1[7] = "j_clavicle_ri";

    for ( var_2 = 0; var_2 < 3 + randomint( 5 ); var_2++ )
    {
        var_3 = randomintrange( 0, var_1.size );
        thread _id_50B6( var_1[var_3], undefined );
        wait(randomfloat( 0.1 ));
    }

    self dodamage( self.health + 50, self.origin );
}

_id_50B6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._effect["flesh_hit"];

    playfxontag( var_1, self, var_0 );
}

_id_50B7()
{
    thread _id_50B8();
    var_0 = [];
    var_1 = getentarray( "animated_model", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = getarraykeys( level.anim_prop_models[var_3.model] );

        foreach ( var_6 in var_4 )
        {
            if ( var_6 == "windy_idle" )
                var_0[var_0.size] = var_3;
        }
    }

    for (;;)
    {
        level waittill( "wind_blast", var_9, var_10, var_11, var_12, var_13, var_14 );

        foreach ( var_16 in var_0 )
        {
            var_17 = undefined;

            if ( isdefined( var_14 ) && var_14 )
            {
                var_18 = ( var_16.origin[0], var_16.origin[1], 0 );
                var_19 = ( var_9[0], var_9[1], 0 );
                var_17 = distance( var_18, var_19 );
            }
            else
                var_17 = distance( var_16.origin, var_9 );

            if ( var_17 < var_10 )
                var_16 thread _id_50BA( var_11, var_12, var_13 );
        }
    }
}

_id_50B8()
{
    var_0 = getentarray( "tree_damage_trigger", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_50B9();
}

_id_50B9()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_GRENADE" || var_4 == "MOD_GRENADE_SPLASH" || var_4 == "MOD_PROJECTILE" || var_4 == "MOD_PROJECTILE_SPLASH" || var_4 == "MOD_EXPLOSIVE" )
            level notify( "wind_blast", var_3, 512, 0.2, 0.2, 1 );
    }
}

_id_50BA( var_0, var_1, var_2 )
{
    self notify( "playing_windy_idle" );
    self endon( "playing_windy_idle" );
    var_3 = level.anim_prop_models[self.model]["windy_idle"];
    self setanim( var_3, 1, var_0, 1 );
    wait(var_2);
    self clearanim( var_3, var_1 );
}

_id_50BB( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        level notify( "wind_blast", self.origin, var_0, 0.2, 0.5, 1, var_1 );
        wait 0.5;
    }
}

_id_50BC( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_0C6D = var_0;
    return var_1;
}

_id_50BD()
{
    var_0 = undefined;

    if ( self._id_0C6D.size > 1 && isdefined( self._id_50BE ) )
    {
        var_0 = randomint( self._id_0C6D.size - 1 );

        if ( var_0 >= self._id_50BE )
            var_0++;
    }
    else
        var_0 = randomint( self._id_0C6D.size );

    self._id_50BE = var_0;
    return self._id_0C6D[var_0];
}

_id_50BF()
{
    return common_scripts\utility::random( self._id_0C6D );
}

_id_46B8( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1.5;

    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.foreground = 1;
    var_4 setshader( var_0, 640, 480 );

    if ( isdefined( var_3 ) && var_3 > 0 )
    {
        var_4.alpha = 0;
        var_4 fadeovertime( var_3 );
        var_4.alpha = 1;
        wait(var_3);
    }

    wait(var_1);

    if ( var_2 > 0 )
        var_4 fadeovertime( var_2 );

    var_4.alpha = 0;
    wait(var_2);
    var_4 destroy();
}

_id_50C0( var_0 )
{
    thread _id_50C1( var_0 );
}

_id_50C1( var_0 )
{
    level notify( "new_quote_string" );
    level endon( "new_quote_string" );
    level endon( "mine death" );

    if ( isalive( level.player ) )
        level.player waittill( "death" );

    if ( !level._id_16C9 )
        setdvar( "ui_deadquote", var_0 );
}

_id_50C2()
{
    level thread maps\_quotes::_id_18A8();
}

_id_50C3()
{
    foreach ( var_1 in self._id_24E7 )
    {
        if ( isdefined( var_1._id_0EEA ) && var_1._id_0EEA )
            return var_1;
    }
}

_id_50C4( var_0, var_1, var_2, var_3 )
{
    var_4 = self vehicle_getspeed() * 17.6 * var_3;
    var_5 = squared( var_4 * var_0 );
    var_6 = squared( var_4 * var_1 );
    var_7 = cos( var_2 );
    var_8 = sortbydistance( common_scripts\utility::getstructarray( "vehicle_crash_struct", "script_noteworthy" ), self.origin );

    foreach ( var_10 in var_8 )
    {
        var_11 = distancesquared( var_10.origin, self.origin );

        if ( var_11 < var_5 )
            continue;

        if ( var_11 > var_6 )
            break;

        if ( isdefined( var_10._id_50C5 ) )
            continue;

        if ( vectordot( vectornormalize( var_10.origin - self.origin ), anglestoforward( self.angles ) ) < var_7 )
            continue;

        return var_10;
    }

    return undefined;
}

_id_50C6( var_0 )
{
    thread maps\_utility::_id_1424( "max_time", var_0._id_50C7 );
    thread _id_50C8( var_0 );
    var_1 = common_scripts\utility::waittill_any_return( "max_time", "veh_collision", "script_vehicle_collision", "detect_crash" );

    if ( !isdefined( var_1 ) )
        var_1 = "unknown";

    self notify( "stop_vehicle_detect_crash" );
}

_id_50C8( var_0 )
{
    self endon( "stop_vehicle_detect_crash" );
    waittillframeend;
    var_1 = squared( 234 );

    if ( isdefined( level._id_2989[self.classname] ) && isdefined( level._id_2989[self.classname]._id_298F ) )
        var_1 = squared( level._id_2989[self.classname]._id_298F * 0.75 );

    for (;;)
    {
        if ( abs( angleclamp180( self.angles[0] ) ) > 30 || abs( angleclamp180( self.angles[2] ) ) > 30 )
            break;

        if ( distancesquared( self.origin, level.player.origin ) < var_1 )
            break;

        if ( self vehicle_getspeed() / var_0._id_50C9 < 0.25 )
            break;

        if ( vectordot( var_0._id_50CB - self.origin, var_0._id_50CA ) < 0 )
            break;

        common_scripts\utility::waitframe();
    }

    self notify( "detect_crash" );
}

_id_50CC( var_0 )
{
    var_1 = 45;
    var_2 = 4;
    var_3 = 195;
    var_4 = var_3 * tan( var_1 );
    var_5 = self vehicle_getspeed();
    var_6 = 0;
    self endon( "death" );

    for (;;)
    {
        var_7 = 0;

        if ( vectordot( var_0._id_50CE.origin - self.origin, var_0._id_50CD ) < 0 )
            var_7 = 1;

        var_8 = randomfloat( var_4 );

        if ( var_7 )
            var_8 *= -1;

        var_9 = self.origin + var_0._id_50CA * var_3 + var_0._id_50CD * var_8;
        var_10 = clamp( var_6 / var_2, 0, 1 );
        var_11 = maps\_utility::_id_281D( var_10, var_5, var_0._id_50C9 );
        self vehicledriveto( var_9, var_0._id_50C9 );
        var_12 = randomfloatrange( 0.05, 0.2 );
        var_6 += var_12;
        wait(var_12);
    }
}

_id_50CF()
{
    thread _id_50D0();
    thread _id_50D1();
    thread _id_50D2();
}

_id_50D0()
{
    self endon( "death" );
    self._id_252C = 1;
    var_0 = _id_50C3();

    if ( !isdefined( var_0 ) )
        return;

    var_0 waittill( "death" );

    if ( isdefined( var_0 ) )
        playfxontag( common_scripts\utility::getfx( "blood_gaz_driver" ), var_0, "tag_eye" );

    var_1 = undefined;

    if ( isdefined( var_0 ) )
        var_1 = var_0.lastattacker;

    _id_50D4( var_1 );
}

_id_50D1()
{
    self._id_2A70 = 1;

    while ( self.health > 0 )
    {
        self waittill( "damage" );
        waittillframeend;

        if ( self.health < self._id_163B )
            break;
    }

    _id_50D4( self.attacker );
}

_id_50D2()
{
    self endon( "death" );
    var_0 = 24;
    var_1 = 39;
    var_2 = 156;
    var_3 = undefined;

    for (;;)
    {
        var_4 = self localtoworldcoords( ( var_1, 0, var_0 ) );
        var_5 = self localtoworldcoords( ( var_2, 0, var_0 ) );
        var_6 = bullettrace( var_4, var_5, 0, self );
        var_7 = var_6["entity"];

        if ( isdefined( var_7 ) )
        {
            if ( var_7.code_classname == "script_model" || var_7.code_classname == "script_vehicle" && var_7.health <= 0 )
            {
                var_3 = var_7.attacker;
                break;
            }
        }

        if ( isdefined( self._id_50D3 ) )
            return;

        wait 0.5;
    }

    thread _id_50D4( var_3 );
}

_id_50D4( var_0 )
{
    var_1 = 0.75;
    var_2 = 3;
    var_3 = 60;
    var_4 = 1.5;
    var_5 = 39;
    var_6 = 1.8;

    if ( isdefined( self._id_50D3 ) )
        return;

    self._id_50D3 = 1;
    self notify( "vehicle_crashing_now" );
    var_7 = _id_50C4( var_1, var_2, var_3, var_4 );

    if ( isdefined( var_7 ) )
    {
        var_7._id_50C5 = 1;
        var_8 = spawnstruct();
        var_8._id_50CE = var_7;
        var_8.vehicle = self;
        var_8._id_50D5 = var_8._id_50CE.origin - var_8.vehicle.origin;
        var_8._id_50CA = vectornormalize( var_8._id_50D5 );
        var_8._id_50CD = anglestoright( common_scripts\utility::flat_angle( vectortoangles( var_8._id_50CA ) ) );
        var_8._id_50CB = var_8._id_50CE.origin + vectornormalize( var_8._id_50D5 ) * var_5;
        var_8._id_50D6 = max( self vehicle_getspeed() * 17.6 * var_4, 1 );
        var_8._id_50C9 = var_8._id_50D6 / 17.6;
        var_8._id_50C7 = length( var_8._id_50D5 ) / var_8._id_50D6 * var_6;
        thread _id_50CC( var_8 );
        _id_50C6( var_8 );
    }
    else
    {

    }

    self._id_2A70 = undefined;

    if ( isdefined( var_0 ) )
        self dodamage( self.health + 2000, self.origin, var_0, self );
    else
        self dodamage( self.health + 2000, self.origin );
}

_id_50D7( var_0, var_1, var_2 )
{
    if ( isdefined( self.mgturret ) )
    {
        foreach ( var_4 in self.mgturret )
        {
            if ( isdefined( var_4 ) )
                var_4 thread _id_50D8( var_0, var_1, var_2 );
        }
    }
}

_id_50D8( var_0, var_1, var_2 )
{
    self endon( "death" );

    while ( !isdefined( self._id_0FA3 ) )
        wait 0.05;

    self._id_0FA3 endon( "death" );
    self._id_0FA3.ignoreme = 1;
    self._id_0FA3.ignorerandombulletdamage = 1;
    self setmode( "manual_ai" );
    self settargetentity( level.player, ( 0.0, 0.0, 32.0 ) );

    if ( !isdefined( self._id_4889 ) || self._id_4889 != "fire" )
        self waittill( "startfiring" );

    var_3 = gettime();
    var_4 = var_3 + var_2 * 1000;

    for ( var_5 = 0; var_5 < 1; var_5 = ( gettime() - var_3 ) / ( var_4 - var_3 ) )
    {
        var_6 = ( var_1 - var_0 ) * var_5 + var_0;
        self setaispread( var_6 );
        wait 0.05;
    }

    self setaispread( var_1 );
}

_id_50D9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 90.0;
    var_6 = 55.0;
    var_7 = 260.0;
    var_8 = 90.0;
    var_9 = self getlocalplayerprofiledata( "viewSensitivity" );

    if ( !isdefined( var_9 ) )
        var_9 = 1;

    var_9 = float( var_9 );

    if ( var_9 < 0.001 )
        var_9 = 1;

    var_10 = var_5 * var_9;
    var_11 = var_7 * var_9;
    var_12 = var_0;
    var_12 = min( var_12, 2 * ( 180 - var_1 ) / var_11 );
    var_12 = min( var_12, 2 * ( 180 - var_2 ) / var_11 );
    var_12 = min( var_12, 2 * ( 90 - var_3 ) / var_10 );
    var_12 = min( var_12, 2 * ( 90 - var_4 ) / var_10 );
    var_13 = var_0 - var_12;

    if ( var_13 > 0 )
        wait(var_13);

    if ( isalive( self ) && self islinked() )
        self lerpviewangleclamp( var_12, var_12, 0, min( 180, var_1 + 0.5 * var_12 * var_11 ), min( 180, var_2 + 0.5 * var_12 * var_11 ), min( 90, var_3 + 0.5 * var_12 * var_10 ), min( 90, var_4 + 0.5 * var_12 * var_10 ) );

    wait(var_12);
}

_id_50DA( var_0, var_1, var_2, var_3 )
{
    thread _id_50DB( var_0, var_1, var_2, var_3 );
}

_id_50DB( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( var_1 && !isai( var_2 ) )
        var_4 = var_2;

    if ( isdefined( var_3 ) )
        wait(var_3);

    if ( var_1 && !isdefined( var_4 ) && isai( var_2 ) && isalive( var_2 ) )
        var_4 = var_2 getshootatpos();

    var_5 = 0;

    if ( var_1 && isdefined( var_4 ) )
    {
        if ( level.player maps\_utility::_id_260A( var_4, 0 ) )
            var_5 = 1;
    }

    reconspatialevent( level.player.origin, "script_scripted_sequence: scene %s, played %b, seen %b", var_0, var_1, var_5 );
}

_id_50DC( var_0, var_1, var_2 )
{
    self notify( "lerp_move_speed_scale" );
    self endon( "lerp_move_speed_scale" );
    var_3 = gettime() * 0.001;

    for (;;)
    {
        var_4 = gettime() * 0.001 - var_3;

        if ( var_4 >= var_2 )
            break;

        self setmovespeedscale( maps\_utility::_id_281D( var_4 / var_2, var_0, var_1 ) );
        common_scripts\utility::waitframe();
    }

    self setmovespeedscale( var_1 );
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

_id_46A3()
{
    var_0 = getentarray( "trigger_ignore_all", "targetname" );

    foreach ( var_2 in var_0 )
        level thread _id_46A4( var_2 );
}

_id_46A4( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && var_1 isbadguy() )
            var_1 thread _id_46A5( var_0 );
    }
}

_id_46A5( var_0 )
{
    self notify( "ignore_all_trigger_ai_think_stop" );
    self endon( "ignore_all_trigger_ai_think_stop" );
    self endon( "death" );
    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_1058( 1 );

    while ( self istouching( var_0 ) )
        wait 0.05;

    maps\_utility::_id_2612( 0 );
    maps\_utility::_id_1058( 0 );
}

_id_50DD()
{
    level._id_50DE hidepart( "windshield01" );
    level._id_50DE hidepart( "windshield02" );
    level._id_50DE hidepart( "windshield03" );
    level._id_50DE hidepart( "windshield04" );
    level._id_50DE hidepart( "windshield05" );
}

_id_50DF( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );

    if ( isdefined( var_2 ) )
        var_2 notify( "trigger", level.player );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 && isdefined( var_2 ) )
        var_2 common_scripts\utility::trigger_off();
}

_id_50E0()
{
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showstance", "0" );
    setsaveddvar( "actionSlotsHide", "1" );
}

_id_50E1()
{
    setsaveddvar( "compass", "1" );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "hud_showstance", "1" );
    setsaveddvar( "actionSlotsHide", "0" );
}
