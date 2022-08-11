// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7B94()
{
    common_scripts\utility::flag_set( "door_breached" );
    common_scripts\utility::flag_set( "breach_done" );
    maps\_shg_common::move_player_to_start( "start_store" );
    maps\_compass::setupminimap( "compass_map_prague_escape_escort", "escort_minimap_corner" );

    if ( !isdefined( level.player ) )
        level.player = getentarray( "player", "classname" )[0];

    level.player enableweapons();
    maps\prague_escape_code::_id_7A3B( "price", "store" );
    maps\prague_escape_code::_id_7A3B( "soap", "store" );
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level._id_54E0 maps\_utility::_id_104A( "p99", "primary" );
    var_0 = getent( "door_cafe", "targetname" );
    var_0 rotateyaw( -120, 0.1 );
    var_1 = getent( "clip_door_store", "targetname" );
    var_1 connectpaths();
    var_1 delete();
    level._id_7B89 = maps\prague_escape_code::_id_7A44( level._id_54E0, &"PRAGUE_ESCAPE_PROTECT_SOAP", 1, 1, "active", &"PRAGUE_ESCAPE_PROTECT" );
    maps\prague_escape_sniper::_id_7AE5();
    maps\prague_escape_dumpster::_id_7B7E();
}

_id_7B95()
{
    _id_7B96();
}
#using_animtree("generic_human");

_id_7B96()
{
    common_scripts\utility::flag_wait( "door_breached" );
    var_0 = getent( "price_ak47_drop", "targetname" );
    var_0 hide();
    level thread _id_7B98();
    level thread _id_7B9B();
    common_scripts\utility::flag_wait( "breach_done" );
    level thread maps\prague_escape_code::_id_7A61( 900 );
    var_1 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    var_2 = common_scripts\utility::getstruct( "anim_align_courtyard", "targetname" );
    level._id_4877 thread _id_7BA5();
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_5_1_courtyard_price" );
    var_2 maps\_anim::_id_11DD( var_1, "to_courtyard" );
    level thread _id_7BA2();
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_5_2_statue_price" );
    var_2 maps\_anim::_id_11DD( var_1, "statue" );
    level._id_4877 setgoalpos( level._id_4877.origin );
    level._id_4877.fixednode = 0;
    var_3 = getent( "vol_price_statue", "targetname" );
    level._id_4877 setgoalvolumeauto( var_3 );
    var_2 thread maps\_anim::_id_124E( level._id_54E0, "idle_statue" );
    common_scripts\utility::flag_set( "FLAG_store_soap_sitting_at_statue" );
    common_scripts\utility::flag_clear( "FLAG_soap_walk_blood_drip_hip" );
    thread _id_7B97();
    common_scripts\utility::exploder( 501 );
    common_scripts\utility::flag_wait( "courtyard_leave" );
    level._id_4877 cleargoalvolume();
    var_2 maps\_anim::_id_124A( level._id_4877, "statue_leave" );
    var_2 notify( "stop_loop" );
    common_scripts\utility::flag_set( "FLAG_soap_walk_blood_drip_hip" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_5_2_statueleave_price" );
    var_2 maps\_anim::_id_11DD( var_1, "statue_leave" );
    level._id_4877 clearanim( %root, 0 );
    common_scripts\utility::flag_set( "left_statue" );
    level._id_4877.ignoreme = 0;
    level._id_54E0.ignoreme = 0;
    level._id_4877 notify( "stop_phantom_kills" );
}

_id_7B97()
{
    var_0 = common_scripts\utility::getstructarray( "blood_pool", "targetname" );
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "statue" ] )[0];
    maps\_utility::_id_283A( var_1 );
    playfx( common_scripts\utility::getfx( "FX_soap_sit_blood_pool_small" ), var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
}

_id_7B98()
{
    level thread _id_7BB0();
    var_0 = getent( "courtyard_group_victim1", "targetname" );
    level._id_7B99 = var_0 maps\_utility::_id_166F( 1 );
    level._id_7B99 thread _id_7BB5();
    var_1 = getent( "courtyard_group_victim2", "targetname" );
    level._id_7B9A = var_1 maps\_utility::_id_166F( 1 );
    level._id_7B9A thread _id_7BB5();
    level thread _id_7BB1();
}

_id_7B9B()
{
    level thread _id_7B9D();
    var_0 = getentarray( "suppressor", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F );
    level thread _id_7BA6();
    maps\_utility::_id_263B( "group_suppressor", 2 );
    var_1 = getentarray( "courtyard_reinforcement", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_166F );
    var_2 = getentarray( "courtyard_flanker", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_166F );
    var_3 = getent( "courtyard_2nd_floor", "targetname" );
    level._id_7B9C = var_3 maps\_utility::_id_166F( 1 );
    maps\prague_escape_code::_id_7A64( 2 );
    common_scripts\utility::flag_set( "courtyard_leave" );
    var_4 = getentarray( "china_roof_guys", "targetname" );
    wait 4;
    level thread _id_00CA( var_4 );
    common_scripts\utility::flag_set( "statue_go" );
    wait 6;
    var_5 = getentarray( "china_chaser", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\_utility::_id_166F );
}

_id_00CA( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::_id_166F();
        wait 2;
    }
}

_id_7B9D()
{
    level._id_7B1A maps\_utility::_id_1402( "attacking" );
    level._id_7B1A endon( "death" );
    level thread _id_7B9E();

    if ( level._id_1F19 != "defend" )
    {
        common_scripts\utility::flag_wait( "statue_go" );
        maps\_utility::_id_265A( "axis" );
        level._id_7B1A maps\_utility::delaythread( 2, maps\prague_escape_code::_id_01F3 );
        level._id_7B1A maps\_utility::_id_13DC( "attacking" );
        wait 5;
        maps\_utility::_id_265B( "axis" );
        level._id_7B1A thread _id_7BA0();
        level._id_7B1A setlookatent( level.player );
        wait 5;
        level._id_7B1A._id_7A69 = 100;
        common_scripts\utility::flag_wait( "courtyard_leave" );
        level._id_7B1A._id_7A69 = 10;
        wait 15;
        level._id_7B1A notify( "stop_attacking" );
        wait 0.05;
        level._id_7B1A thread _id_7BA0( 1 );
        common_scripts\utility::flag_wait( "player_left_statue" );
        level._id_7B1A notify( "stop_attacking" );
        level._id_7B1A clearlookatent();
    }

    var_0 = getentarray( "chopper_spot", "targetname" );
    level._id_7B1A._id_7A69 = undefined;
    var_1 = [];
    var_1[0] = level._id_4877;
    var_1[1] = level._id_54E0;
    var_1[2] = level.player;
    var_1 = maps\_utility::_id_0B53( var_1 );
    common_scripts\utility::flag_wait( "btr_arrives" );
    level._id_7B1A maps\_utility::_id_13DC( "attacking" );
    common_scripts\utility::flag_set( "defend_go" );
    level._id_7B1A waittillmatch( "noteworthy", "clear_of_buildings" );
    level._id_7B1A thread _id_7B9F( var_0 );

    while ( !common_scripts\utility::flag( "price_soap_leaving" ) )
    {
        var_2 = common_scripts\utility::random( var_1 );
        level._id_7B1A setlookatent( var_2 );
        level._id_7B1A maps\prague_escape_code::_id_7A68( undefined, var_2 );
        wait(randomfloatrange( 1.5, 3 ));
    }

    level._id_7B1A setlookatent( level.player );
    level._id_7B1A._id_7A69 = 80;
    level._id_7B1A thread _id_7BA0();
    wait 10;
    level._id_7B1A._id_7A69 = 20;
    wait 15;
    level._id_7B1A notify( "stop_attacking" );
    wait 0.05;
    level._id_7B1A thread _id_7BA0( 1 );
}

_id_7B9E()
{
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );

    if ( isdefined( level._id_7B1A ) )
    {
        level._id_7B1A notify( "stop_attacking" );
        level._id_7B1A delete();
    }
}

_id_7B9F( var_0 )
{
    self endon( "death" );
    self sethoverparams( 100, 5, 0.5 );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            self setvehgoalpos( var_2.origin );
            wait(randomintrange( 15, 20 ));
        }
    }
}

_id_7BA0( var_0 )
{
    self endon( "death" );
    self endon( "stop_attacking" );

    if ( !isdefined( self._id_7A69 ) )
        self._id_7A69 = randomintrange( 200, 250 );

    if ( isdefined( var_0 ) )
    {
        var_1 = level.player geteye();
        level._id_7B1A._id_7A69 = 0;
    }
    else
        var_1 = level.player.origin;

    while ( maps\_utility::_id_1008( "attacking" ) )
    {
        if ( isdefined( var_0 ) )
            maps\prague_escape_code::_id_7A68( var_0 );
        else
            maps\prague_escape_code::_id_7A68();

        wait(randomfloatrange( 1.5, 3 ));
    }
}

_id_7BA1( var_0 )
{
    var_1 = getent( "vol_shotby_price", "targetname" );
    var_2 = getaiarray( "axis" );
    var_3 = [];
    var_4 = 0;

    foreach ( var_6 in var_2 )
    {
        if ( var_6 istouching( var_1 ) )
            var_3[var_4] = var_6;
    }

    if ( var_3.size )
    {
        var_8 = sortbydistance( var_3, var_0.origin );
        var_9 = var_8[0];

        if ( isalive( var_9 ) )
        {
            var_10 = var_0 gettagorigin( "tag_flash" );
            var_11 = var_9 gettagorigin( maps\prague_escape_code::_id_7A66() );
            magicbullet( "nosound_magicbullet", var_10, var_11 );
        }
    }
}

_id_7BA2()
{
    wait 5;
    level._id_4877 animscripts\shared::_id_0C9B( level._id_4877.primaryweapon, "none" );
    wait 1;
    level._id_4877 maps\_utility::_id_104A( "ak47", "primary" );
    var_0 = getent( "price_ak47", "targetname" );
    var_0 hide();
}

_id_7BA3( var_0 )
{
    level._id_4877 animscripts\shared::_id_0C9B( level._id_4877.primaryweapon, "none" );
    var_1 = getent( "price_ak47_drop", "targetname" );
    var_1 show();
}

_id_7BA4( var_0 )
{
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level._id_4877 thread maps\prague_escape_code::_id_7A65( 400 );
}

_id_7BA5()
{
    wait 5;
    maps\_utility::_id_168C( "presc_pri_getbehindstatue" );
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    maps\_utility::_id_263B( "group_suppressor", 2 );
    wait 2;
    maps\_utility::_id_168C( "presc_pri_stayonemyuri" );
    common_scripts\utility::flag_wait( "courtyard_leave" );
    maps\_utility::_id_265A( "allies" );
    level._id_54E0 maps\_utility::_id_168C( "presc_pri_ontheroof" );
    maps\_utility::_id_168C( "presc_pri_reinforcementsright" );
}

_id_7BA6()
{
    level.player.ignoreme = 1;
    wait 1.5;
    level.player.ignoreme = 0;
}

_id_7BA7()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.goalradius = 32;
    self.a._id_0D31 = 1;
    maps\_utility::_id_109B();
    common_scripts\utility::flag_wait( "enter_courtyard" );
    self.ignoreall = 0;
}

_id_7BA8()
{
    self endon( "death" );
    thread _id_7BAA();
    thread _id_7BA9();
    self._id_1032 = "enemy";
    self.health = 10000;
    self.a._id_0D31 = 1;
    self.goalradius = 32;
    common_scripts\utility::flag_wait( "spawn_runner" );
    self delete();
}

_id_7BA9()
{
    self endon( "death" );
    var_0 = getnode( "window_statue_side", "targetname" );
    var_1 = getnode( "window_store_side", "targetname" );
    var_2 = getent( "vol_statue_side", "targetname" );
    var_3 = getent( "vol_store_side", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_2 ) )
            self setgoalnode( var_0 );

        wait 2;

        if ( level.player istouching( var_3 ) )
            self setgoalnode( var_1 );

        wait 2;
    }
}

_id_7BAA()
{
    self endon( "death" );
    var_0 = getent( "vol_statue_side", "targetname" );
    var_1 = getent( "vol_store_side", "targetname" );
    var_2 = common_scripts\utility::getstruct( "anim_align_courtyard", "targetname" );
    self waittill( "damage" );

    if ( level.player istouching( var_0 ) )
        var_2 maps\_anim::_id_1246( self, "balcony_death" );

    self dodamage( self.health, self.origin );
    wait 0.05;
    common_scripts\utility::exploder( 607 );
}

_id_7BAB()
{
    self endon( "death" );
    self.goalradius = 32;
    self.a._id_0D31 = 1;
    maps\_utility::_id_26E3( "on" );
    self waittill( "goal" );
    var_0 = getent( "vol_statue_advance", "targetname" );
    self setgoalvolumeauto( var_0 );
    maps\_utility::_id_263B( "group_suppressor", 3 );
    maps\_utility::_id_26E3( "off" );
}

_id_7BAC()
{
    self endon( "death" );
    self.goalradius = 32;
    self.ignoresuppression = 1;
    self.a._id_0D31 = 1;
    self waittill( "goal" );
    self.ignoresuppression = 0;
    var_0 = getent( "vol_statue_advance", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7BAD()
{
    self endon( "death" );
    self.goalradius = 32;
    self.ignoresuppression = 1;
    self.a._id_0D31 = 1;
    self waittill( "goal" );
    wait(randomfloatrange( 1.5, 3.0 ));
    var_0 = getent( "vol_statue", "targetname" );
    self setgoalvolumeauto( var_0 );
    self waittill( "goal" );
    self.ignoresuppression = 0;
    common_scripts\utility::flag_wait( "courtyard_leave" );
    wait(randomfloatrange( 0.3, 1.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_statue_advance", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7BAE()
{
    self endon( "death" );
    self.grenadeammo = 0;
    self.goalradius = 32;
    self.a._id_0D31 = 1;
    var_0 = getent( "vol_china_chaser", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "left_statue" );
    wait(randomfloatrange( 0.3, 1.0 ));
    self cleargoalvolume();
    self._id_20AF = 0.2;
    self.goalradius = 32;
    var_1 = getent( "vol_statue_advance", "targetname" );
    self setgoalvolumeauto( var_1 );
    common_scripts\utility::flag_wait( "exit_street" );

    while ( maps\_utility::_id_0B20( self ) )
        wait 0.15;

    self delete();
}

_id_7BAF()
{
    self endon( "death" );
    maps\_utility::_id_260D();
    self.grenadeammo = 0;
    self._id_20AF = 0.2;
    var_0 = self.origin;
    self.goalradius = 32;

    if ( randomint( 100 ) < 40 )
        self laserforceon();

    common_scripts\utility::flag_wait( "player_left_statue" );
    self setgoalpos( var_0 );
    self.ignoreall = 1;

    while ( maps\_utility::_id_0B20( self ) )
        wait 0.15;

    self delete();
}

_id_7BB0()
{
    common_scripts\utility::flag_wait_any( "price_enter_courtyard", "enter_courtyard" );
    var_0 = common_scripts\utility::getstruct( "struct_statue_gunfire1", "targetname" );
    var_1 = common_scripts\utility::getstruct( "struct_statue_gunfire2", "targetname" );
    var_2 = common_scripts\utility::getstruct( "struct_statue_gunfire3", "targetname" );
    var_3 = common_scripts\utility::getstruct( "struct_statue_gunfire4", "targetname" );
    wait 1;
    var_0 thread _id_7BB2();
    var_1 thread _id_7BB2();
    var_2 thread _id_7BB2();
    wait 1;
    var_3 thread _id_7BB3();
    wait 2;
    level notify( "stop_gunfire" );
}

_id_7BB1()
{
    common_scripts\utility::flag_wait( "price_enter_courtyard" );
    wait 1;

    if ( isalive( level._id_7B99 ) )
        level._id_7B99 dodamage( level._id_7B99.health, level._id_4877.origin );

    wait 1.5;

    if ( isalive( level._id_7B9A ) )
        level._id_7B9A dodamage( level._id_7B9A.health, level._id_4877.origin );
}

_id_7BB2()
{
    level endon( "stop_gunfire" );
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );

    for (;;)
    {
        var_1 = randomfloatrange( -8.0, 8.0 );
        var_2 = randomfloatrange( -16.0, 16.0 );
        var_3 = randomfloatrange( -16.0, 16.0 );
        magicbullet( "ak47", self.origin, var_0.origin + ( var_1, var_2, var_3 ) );
        bullettracer( self.origin, var_0.origin + ( var_1, var_2, var_3 ), 1 );
        wait(randomfloatrange( 0.2, 0.6 ));
    }
}

_id_7BB3()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = 0;

    for ( var_2 = 0; var_2 < 16; var_2++ )
    {
        magicbullet( "ak47", self.origin, var_0.origin + ( 0, var_1, 0 ) );
        var_1 += 24;
        wait 0.1;
    }
}

_id_7BB4( var_0 )
{
    var_1 = getent( "courtyard_door_left", "targetname" );
    var_2 = getent( "courtyard_door_right", "targetname" );
    var_3 = getent( "clip_door_courtyard", "targetname" );
    common_scripts\utility::exploder( 610 );
    var_1 rotateyaw( 120, 0.1 );
    var_2 rotateyaw( -120, 0.1 );
    var_3 connectpaths();
    var_3 delete();
}

_id_7BB5()
{
    createthreatbiasgroup( "enemies" );
    createthreatbiasgroup( "player" );
    setignoremegroup( "player", "enemies" );
    level.player setthreatbiasgroup( "player" );
    self setthreatbiasgroup( "enemies" );
}

_id_7BB6()
{
    common_scripts\utility::flag_init( "courtyard_leave" );
    common_scripts\utility::flag_init( "left_statue" );
}

_id_7BB7()
{
    var_0 = maps\prague_escape_code::_id_7A42( &"PRAGUE_ESCAPE_CLEAR_COURTYARD" );
    common_scripts\utility::flag_wait( "courtyard_leave" );
    maps\prague_escape_code::_id_7A45( var_0 );
    objective_delete( var_0 );
    objective_current( level._id_7B89 );
}

_id_7BB8()
{
    var_0 = getent( "courtyard_group_victim1", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_7BA7 );
    var_1 = getent( "courtyard_group_victim2", "targetname" );
    var_1 maps\_utility::add_spawn_function( ::_id_7BA7 );
    var_2 = getent( "courtyard_2nd_floor", "targetname" );
    var_2 maps\_utility::add_spawn_function( ::_id_7BA8 );
    var_3 = getentarray( "suppressor", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_7BAB );
    var_4 = getentarray( "courtyard_reinforcement", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_7BAC );
    var_5 = getentarray( "courtyard_flanker", "targetname" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_7BAD );
    var_6 = getentarray( "china_chaser", "targetname" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_7BAE );
    var_7 = getentarray( "china_roof_guys", "targetname" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::_id_7BAF );
}
