// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7D59()
{
    maps\_shg_common::move_player_to_start( "start_statue" );
    maps\_compass::setupminimap( "compass_map_prague_escape_escort", "escort_minimap_corner" );

    if ( !isdefined( level.player ) )
        level.player = getentarray( "player", "classname" )[0];

    maps\prague_escape_code::_id_7A3B( "price", "statue" );
    maps\prague_escape_code::_id_7A3B( "soap", "statue" );
    level.player enableweapons();
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level._id_54E0 maps\_utility::_id_104A( "p99", "primary" );
    level._id_7B89 = maps\prague_escape_code::_id_7A44( level._id_54E0, &"PRAGUE_ESCAPE_PROTECT_SOAP", 1, 1, "active", &"PRAGUE_ESCAPE_PROTECT" );
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7D5A()
{
    _id_7D5B();
}
#using_animtree("generic_human");

_id_7D5B()
{
    level thread _id_7D65();
    level thread _id_7D5E();
    var_0 = common_scripts\utility::getstruct( "anim_align_street_run", "targetname" );
    var_1 = maps\_utility::_id_2766( level._id_7D5D, level._id_7D5C );
    var_0 maps\_anim::_id_11BF( var_1, "take_cover" );
    var_2 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    level._id_4877 thread _id_7D62();
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_6_1_through_price" );
    var_0 maps\_anim::_id_11DD( var_2, "thru_building" );
    level thread _id_7D5F();
    level thread _id_7D63();
    common_scripts\utility::flag_set( "vo_yuritakepoint" );
    var_3 = maps\_utility::_id_2766( level._id_4877, level._id_54E0, level._id_7D5D, level._id_7D5C );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_6_1_through_takecover_price" );
    var_0 maps\_anim::_id_11DD( var_3, "take_cover" );
    var_4 = getent( "stand_table_clip", "targetname" );
    var_4 delete();
    var_5 = getent( "table_animate_clip", "targetname" );
    var_5 common_scripts\utility::trigger_on();
    level._id_4877 clearanim( %root, 0 );
    var_2 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    var_0 thread maps\_anim::_id_11D6( var_2, "idle_building" );

    if ( !common_scripts\utility::flag( "spawn_tunnel" ) )
    {
        level thread _id_7D5F();
        _id_51FA( "player_left_statue" );
    }

    common_scripts\utility::flag_wait_any( "spawn_tacticals", "goto_tunnel" );
    common_scripts\utility::flag_set( "spawn_runner" );

    if ( isdefined( level._id_7B1A ) )
    {
        level._id_7B1A notify( "stop_attacking" );
        level._id_7B1A maps\_utility::_id_13DE( "attacking" );
    }

    if ( !common_scripts\utility::flag( "player_left_statue" ) )
        common_scripts\utility::flag_set( "player_left_statue" );

    var_0 notify( "stop_loop" );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_6_1_through_takecover_exit_price" );
    var_0 maps\_anim::_id_11DD( var_2, "cover_exit" );
    level thread _id_7D60();
    common_scripts\utility::flag_wait( "FLAG_street_soap_sitting_by_mailbox" );
    level thread _id_7BC9();
    common_scripts\utility::flag_wait( "goto_bank" );
    level notify( "end_fail_monitor" );
}

_id_51FA( var_0 )
{
    while ( distance2d( level.player.origin, level._id_4877.origin ) > 256 )
        wait 0.1;

    common_scripts\utility::flag_set( var_0 );
    return;
}

_id_7D5E()
{
    var_0 = getent( "trigger_travel_office", "script_noteworthy" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_1425( "office" );
}

_id_7D5F()
{
    if ( distance2d( level.player.origin, level._id_4877.origin ) > 400 )
    {
        common_scripts\utility::flag_set( "goto_tunnel" );
        level._id_4877 maps\_utility::_id_168C( "presc_pri_yurigetoverhere2" );
    }
}

_id_7D60()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_street_run", "targetname" );
    var_1 = maps\_utility::_id_2766( level._id_4877, level._id_54E0 );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_6_2_street_price" );
    var_0 maps\_anim::_id_11DD( var_1, "to_street" );
    var_0 thread maps\_anim::_id_11D6( var_1, "idle_street" );
    common_scripts\utility::flag_set( "FLAG_street_soap_sitting_by_mailbox" );
    common_scripts\utility::flag_clear( "FLAG_soap_walk_blood_drip_hip" );
    maps\_utility::delaythread( 1.0, ::_id_7D61 );
    common_scripts\utility::exploder( 601 );
    common_scripts\utility::flag_wait( "goto_bank" );
    common_scripts\utility::flag_set( "FLAG_soap_walk_blood_drip_hip" );
    var_0 notify( "stop_loop" );
    common_scripts\utility::flag_set( "exit_street" );
}

_id_7D61()
{
    var_0 = common_scripts\utility::getstructarray( "blood_pool", "targetname" );
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "street" ] )[0];
    maps\_utility::_id_283A( var_1 );
    playfx( common_scripts\utility::getfx( "FX_soap_sit_blood_pool_small" ), var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
}

_id_7D62()
{
    common_scripts\utility::flag_wait( "vo_yuritakepoint" );
    wait 3.5;
    level._id_4877 maps\_utility::_id_168C( "presc_pri_cmonnow" );
    common_scripts\utility::flag_wait( "spawn_tunnel" );
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
}

_id_7D63()
{
    wait 3.6;
    playfx( level._effect["lamp_sparks"], level._id_7D64.origin );
}

_id_7D65()
{
    common_scripts\utility::flag_wait( "spawn_runner" );
    maps\_utility::_id_27CA( "flood_filler", ::_id_7D66 );
    var_0 = getentarray( "flood_filler", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\prague_escape_sniper::_id_5EC8, "vo_enemyvehicleahead" );
    maps\_spawner::_id_2135( var_0 );
    var_1 = getent( "tunnel_runner", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F( 1 );
    common_scripts\utility::flag_wait( "spawn_tunnel" );
    var_3 = getentarray( "tunnel_precursor", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::_id_166F );
    level thread _id_7D67();
    common_scripts\utility::flag_wait( "spawn_tacticals" );
    level thread _id_7D68();
    var_4 = getentarray( "tunnel_tactical", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::_id_166F );
    level thread _id_7D69();
}

_id_7D66()
{
    self endon( "death" );
    self.goalradius = randomintrange( 500, 800 );
    self setgoalentity( level.player );
}

_id_5EDD( var_0 )
{

}

_id_7BC9()
{
    var_0 = getent( "vol_tunnel", "targetname" );

    while ( var_0 maps\_utility::_id_2789( "axis" ).size > 1 )
        wait 0.1;

    common_scripts\utility::flag_set( "goto_bank" );
}

_id_7D67()
{
    maps\_utility::_id_263B( "group_precursor", 1 );
    common_scripts\utility::flag_set( "spawn_tacticals" );
}

_id_7D68()
{
    maps\_utility::_id_263B( "group_tactical", 1 );
    common_scripts\utility::flag_set( "tacticals_run" );
}

_id_7D69()
{
    level endon( "goto_bank" );

    for (;;)
    {
        var_0 = maps\_utility::_id_263C( "group_precursor" ) + maps\_utility::_id_263C( "group_tactical" );

        if ( var_0 < 4 )
            common_scripts\utility::flag_set( "goto_bank" );

        wait 0.1;
    }
}

_id_7D6A()
{
    self endon( "death" );
    thread _id_7D6E();
    self.a._id_0D31 = 1;
    var_0 = getent( "vol_tunnel", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "goto_bank" );
    wait(randomfloatrange( 0.8, 2.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_street", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "vo_enemyvehicleahead" );
    wait(randomfloatrange( 0.5, 1.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_bank_entrance", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7D6B()
{
    self endon( "death" );
    thread _id_7D6E();
    self.goalradius = 32;
    self.ignoresuppression = 1;
    self.a._id_0D31 = 1;
    self waittill( "goal" );
    self.ignoresuppression = 0;
    var_0 = getent( "vol_tunnel", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "goto_bank" );
    wait(randomfloatrange( 0.8, 2.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_street", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "vo_enemyvehicleahead" );
    wait(randomfloatrange( 0.5, 1.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_bank_entrance", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7D6C()
{
    self endon( "death" );
    thread _id_7D6D();
    thread _id_7D6E();
    self.goalradius = 32;
    self.ignoresuppression = 1;
    self.a._id_0D31 = 1;
    self waittill( "goal" );
    self.ignoresuppression = 0;
    var_0 = getent( "vol_tunnel", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "goto_bank" );
    wait(randomfloatrange( 0.8, 2.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_street", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "vo_enemyvehicleahead" );
    wait(randomfloatrange( 0.5, 1.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_bank_entrance", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7D6D()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "tacticals_run" );
    maps\_utility::_id_109E();
    self.ignoresuppression = 0;
}

_id_7D6E()
{
    self endon( "death" );

    while ( distance2d( self.origin, level._id_4877.origin ) > 256 )
        wait 0.1;

    var_0 = level._id_4877 gettagorigin( "tag_flash" );
    var_1 = self gettagorigin( "J_Head" );
    magicbullet( "deserteagle", var_0, var_1 );
}

_id_7D6F()
{
    common_scripts\utility::flag_init( "tacticals_run" );
    common_scripts\utility::flag_init( "vo_yuritakepoint" );
    common_scripts\utility::flag_init( "goto_tunnel" );
    common_scripts\utility::flag_init( "exit_street" );
}

_id_7D70()
{
    var_0 = getent( "tunnel_runner", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_7D6A );
    var_1 = getentarray( "tunnel_precursor", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_7D6B );
    var_2 = getentarray( "tunnel_tactical", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_7D6C );
}

_id_7D71()
{
    var_0 = getent( "clip_bank_street", "targetname" );
    var_0 disconnectpaths();
    level._id_7D64 = getent( "soap_lean_lamp", "targetname" );
    level._id_7D72 = getent( "soap_lean_table", "targetname" );
    level._id_7D5D = spawn( "script_model", level._id_7D64.origin );
    level._id_7D5D.angles = level._id_7D64.angles;
    level._id_7D5D setmodel( "tag_origin_animate" );
    level._id_7D5D._id_1032 = "lamp";
    level._id_7D5D useanimtree( level._id_1245["lamp"] );
    level._id_7D64.origin = level._id_7D5D gettagorigin( "origin_animate_jnt" );
    level._id_7D64.angles = level._id_7D5D gettagangles( "origin_animate_jnt" );
    level._id_7D64 linkto( level._id_7D5D, "origin_animate_jnt" );
    level._id_7D5C = spawn( "script_model", level._id_7D72.origin );
    level._id_7D5C.angles = level._id_7D72.angles;
    level._id_7D5C setmodel( "tag_origin_animate" );
    level._id_7D5C._id_1032 = "table";
    level._id_7D5C useanimtree( level._id_1245["table"] );
    level._id_7D72.origin = level._id_7D5C gettagorigin( "origin_animate_jnt" );
    level._id_7D72.angles = level._id_7D5C gettagangles( "origin_animate_jnt" );
    level._id_7D72 linkto( level._id_7D5C, "origin_animate_jnt" );
    var_1 = getent( "table_animate_clip", "targetname" );
    var_1 common_scripts\utility::trigger_off();
}
