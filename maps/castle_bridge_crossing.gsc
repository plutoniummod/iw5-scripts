// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4EDE()
{
    maps\_shg_common::move_player_to_start( "start_bridge_crossing" );
    maps\castle_code::_id_8094( "start_bridge_crossing" );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "objective_comm_room" );
    common_scripts\utility::flag_init( "objective_plant_bomb_bridge" );
    common_scripts\utility::flag_init( "bomb_plant_start" );
    common_scripts\utility::flag_init( "bomb_has_been_planted" );
    common_scripts\utility::flag_init( "on_scaffolding" );
    common_scripts\utility::flag_init( "price_teleported" );
    common_scripts\utility::flag_init( "shimmy_start" );
    common_scripts\utility::flag_init( "shimmy_middle" );
    common_scripts\utility::flag_init( "price_shimmies" );
    common_scripts\utility::flag_init( "price_shimmy_done" );
    common_scripts\utility::flag_init( "price_across_bridge" );
    common_scripts\utility::flag_init( "alert_bridge_end_guys" );
}

_id_4EDF()
{
    maps\castle_code::_id_80A1( 3, 10 );
    maps\castle_code::_id_80A0( 6 );
    level thread maps\castle_into_wet_wall::_id_81E6();
    maps\_compass::setupminimap( "compass_map_castle" );
    level._id_4877 pushplayer( 1 );
    common_scripts\utility::flag_set( "objective_comm_room" );
    level._id_81BE = getent( "bridge_bomb", "targetname" );
    level._id_4877 thread _id_4EE6();
    level._id_4877 thread _id_4EE4();
    level thread _id_4EE0();
    level thread _id_80C4();
    level thread _id_4EE2();
    level thread _id_4EE3();
    common_scripts\utility::flag_wait( "shimmy_start" );
    level thread _id_4EE9();
    level thread maps\castle_code::_id_76F4( "wall_climb_start" );
    common_scripts\utility::flag_wait( "wet_wall_start" );
    level._id_4877 pushplayer( 0 );
    level notify( "price_stealth_end" );
}

_id_4EE0()
{
    var_0 = maps\_vehicle::_id_296C( 910 )[0];
    level._id_4877.ignoreme = 1;
    level._id_4877.ignoreall = 1;
    level._id_4877.alertlevel = "noncombat";
    level.player.ignoreme = 1;
    maps\_audio::aud_send_msg( "btr_drives_across_bridge", var_0 );
    var_0 thread _id_4EE1();
    var_0 waittill( "reached_end_node" );
    common_scripts\utility::flag_wait( "shimmy_start" );
    var_1 = getvehiclenode( "nd_bomb_btr_leave", "targetname" );
    var_0 startpath( var_1 );
    common_scripts\utility::flag_wait( "wet_wall_start" );
    level._id_4877.ignoreme = 0;
    level._id_4877.ignoreall = 0;
    level.player.ignoreme = 0;
    var_0 delete();
}

_id_4EE1()
{
    self endon( "death" );

    for (;;)
    {
        self playrumbleonentity( "subtle_tank_rumble" );
        wait 0.2;
    }
}

_id_4EE2()
{
    var_0 = getentarray( "fxanim_castle_scaff_sm_mod", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_1032 = "bridge_scaffolding_small";
        var_2 maps\_utility::_id_2629();
        var_2 thread maps\_anim::_id_124E( var_2, "shake" );
        wait(randomfloatrange( 0.5, 3.0 ));
    }

    var_4 = getentarray( "fxanim_castle_scaff_lrg_x_mod", "targetname" );

    foreach ( var_2 in var_4 )
    {
        var_2._id_1032 = "bridge_scaffolding_large";
        var_2 maps\_utility::_id_2629();
        var_2 thread maps\_anim::_id_124E( var_2, "shake" );
        wait(randomfloatrange( 0.5, 3.0 ));
    }

    common_scripts\utility::flag_wait( "bridge_tarp_fly" );
    var_7 = getent( "fxanim_castle_bridge_tarp06_mod", "targetname" );
    var_7._id_1032 = "bridge_tarp";
    var_7 maps\_utility::_id_2629();
    var_7 thread maps\_anim::_id_1246( var_7, "gone_with_the_wind" );
    common_scripts\utility::flag_wait( "wet_wall_start" );

    foreach ( var_2 in var_0 )
        var_2 notify( "stop_loop" );

    foreach ( var_2 in var_4 )
        var_2 notify( "stop_loop" );
}

_id_4EE3()
{
    common_scripts\utility::flag_wait( "on_scaffolding" );
    common_scripts\utility::exploder( 910 );
    common_scripts\utility::flag_wait( "bomb_plant_start" );
    common_scripts\utility::exploder( 911 );
    common_scripts\utility::flag_wait( "shimmy_middle" );
    common_scripts\utility::exploder( 914 );
    common_scripts\utility::flag_wait( "passed_bomb" );
    common_scripts\utility::exploder( 912 );
}

_id_4EE4()
{
    self endon( "death" );
    var_0 = maps\castle_code::_id_7A41( "castle_bridge" );
    common_scripts\utility::flag_wait_any( "bomb_plant_start", "bomb_has_been_planted" );
    level._id_4877 maps\_utility::_id_123B();
    common_scripts\utility::flag_set( "objective_plant_bomb_bridge" );

    if ( !common_scripts\utility::flag( "bomb_has_been_planted" ) )
        var_0 _id_4EE5( level._id_4877 );

    var_1 = distance( level.player.origin, level._id_4877.origin );

    if ( var_1 > 250 )
    {
        level._id_4877 notify( "killanimscript" );
        var_2 = common_scripts\utility::getstruct( "bridge_price_teleport", "targetname" );
        level._id_4877 forceteleport( var_2.origin, var_2.angles );
        common_scripts\utility::flag_set( "price_teleported" );
    }

    var_0 maps\_anim::_id_124A( level._id_4877, "bridge_shimmy" );

    if ( !common_scripts\utility::flag( "price_teleported" ) )
        wait 3.0;
    else
        wait 1.25;

    common_scripts\utility::flag_set( "price_shimmies" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( level._id_4877, "bridge_shimmy" );
    common_scripts\utility::flag_set( "price_shimmy_done" );
    level._id_4877 maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "passed_bomb" );
    wait 3;
    var_0 maps\_anim::_id_124A( level._id_4877, "bridge_mantle" );
    var_0 maps\_anim::_id_1247( level._id_4877, "bridge_mantle" );
    level._id_4877 maps\_utility::_id_2686();
    common_scripts\utility::flag_set( "price_across_bridge" );
}

_id_4EE5( var_0 )
{
    level endon( "bomb_has_been_planted" );
    maps\_anim::_id_124A( var_0, "bridge_instruct_bombplant" );
    maps\_anim::_id_1246( var_0, "bridge_instruct_bombplant" );
    maps\_anim::_id_124E( var_0, "bridge_instruct_idle" );
}

_id_80C4()
{
    var_0 = getent( "trig_bridge_bomb", "targetname" );
    var_0 usetriggerrequirelookat();
    var_0 waittill( "trigger" );
    var_0 delete();
    maps\_audio::aud_send_msg( "player_plant_c4_bridge" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    common_scripts\utility::flag_set( "bomb_has_been_planted" );
    level._id_81BE hide();
    var_1 = maps\castle_code::_id_7A41( "castle_bridge" );
    var_1 thread maps\castle_code::_id_7A47( "bridge_bomb_plant", undefined, 1, 0.5 );
    level.player._id_7A48 attach( "weapon_c4", "tag_weapon", 1 );
    var_1 waittill( "bridge_bomb_plant" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level._id_81BE setmodel( "weapon_c4" );
    level._id_81BE show();
}

_id_4EE6()
{
    level endon( "bridge_stealth_broken" );
    common_scripts\utility::flag_wait( "on_scaffolding" );
    thread _id_4EE7();
    common_scripts\utility::flag_wait( "bomb_plant_start" );
    maps\_utility::_id_168C( "castle_pri_thisbridge2" );
    maps\_utility::_id_168C( "castle_pri_c4oncolumn" );
    thread _id_4EE8();
}

_id_4EE7()
{
    level endon( "bomb_has_been_planted" );
    level endon( "bridge_stealth_broken" );
    self waittill( "goal" );
    wait 3;

    if ( !common_scripts\utility::flag( "on_scaffolding" ) )
        return;
}

_id_4EE8()
{
    var_0[0] = "castle_pri_plantc4hurry";
    var_0[1] = "castle_pri_plantc4hurry";
    var_0[2] = "castle_pri_plantc4hurry";
    maps\castle_code::_id_80E2( var_0, "bomb_has_been_planted", 10, 0, 0 );
    common_scripts\utility::flag_wait( "bomb_has_been_planted" );
    wait 3.0;
    common_scripts\utility::flag_wait( "price_shimmies" );
    wait 3.0;
    maps\_utility::_id_168C( "castle_pri_abouttocollapse" );
    wait 0.5;
    maps\_utility::_id_168C( "castle_pri_sotakeitslow" );
    wait 6;

    if ( !common_scripts\utility::flag( "shimmy_creak2" ) )
        maps\_utility::_id_168C( "castle_pri_alittletooslow" );
}

_id_4EE9()
{
    common_scripts\utility::flag_wait( "shimmy_creak1" );
    level.player playrumbleonentity( "grenade_rumble" );
    maps\_audio::aud_send_msg( "player_shimmy_boards" );
    common_scripts\utility::flag_wait( "shimmy_creak2" );
    level.player playrumbleonentity( "grenade_rumble" );
    maps\_audio::aud_send_msg( "player_shimmy_boards" );
    common_scripts\utility::flag_wait( "shimmy_creak3" );
    level.player playrumbleonentity( "grenade_rumble" );
    maps\_audio::aud_send_msg( "player_shimmy_boards" );
}
