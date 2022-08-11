// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_74B9()
{
    var_0 = getent( "reflection_background", "targetname" );
    var_0 hide();
    level._id_4553 = level.player maps\_utility::_id_27AB();
    level._id_4553.intensity = 0;
    thread _id_74C1();
    thread _id_74D9();
    thread _id_7521();
    thread maps\dubai_code::_id_74BA();
}

_id_74BB( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_1, "script_noteworthy" );
    var_5 = var_4 maps\_utility::_id_166F( 1 );
    var_5.ignoreall = 1;
    var_5._id_1032 = var_0;
    var_5 maps\_utility::_id_24F5();

    if ( var_3 )
        var_5 maps\_utility::_id_104A( "usp", "primary" );

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_5.headmodel ) )
            var_5 detach( var_5.headmodel );

        var_5 attach( var_2 );
        var_5.headmodel = var_2;
    }

    return var_5;
}

_id_74BC( var_0, var_1, var_2 )
{
    maps\_anim::_id_1246( var_0, var_1, var_2 );

    if ( level._id_01FF )
        var_0 delete();
}

_id_74BD( var_0 )
{

}

_id_74BE( var_0 )
{
    self endon( "death" );
    var_1 = [];
    var_2 = [];
    var_3 = 120;
    var_4 = 0;

    for (;;)
    {
        var_1[var_4] = self gettagangles( var_0 );
        var_2[var_4] = self gettagorigin( var_0 );
        var_5 = var_4 + 1;
        var_6 = var_4;
        var_4++;

        if ( var_4 >= var_3 )
            var_4 = 0;

        if ( var_5 >= var_3 )
            var_5 = 0;

        if ( var_1.size < var_3 )
        {
            var_5 = 0;
            var_6 = var_1.size - 1;
        }

        var_7 = var_5;

        for (;;)
        {
            if ( var_7 != var_5 )
            {

            }

            var_7 = var_5;

            if ( var_5 == var_6 )
                break;

            var_5++;

            if ( var_5 >= var_3 )
                var_5 = 0;
        }

        wait 0.05;
    }
}

_id_74BF()
{
    return 1;
}

_id_74C0()
{
    level.player takeallweapons();
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowstand( 1 );
    level.player setstance( "stand" );
    level.player disableusability();
    setsaveddvar( "compass", "0" );
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "actionSlotsHide", 1 );
    level._id_1C4A = ::_id_74BF;
}

_id_74C1()
{
    maps\_utility::add_hint_string( "hint_stab_copilot", &"DUBAI_HIT_MELEE", ::_id_74D2 );
    maps\_utility::add_hint_string( "hint_throw_pilot", &"DUBAI_HIT_MELEE_THROW", ::_id_0204 );
    level._id_74C2 = 0;
    level._id_74C3 = 0;
    common_scripts\utility::flag_wait( "finale_sequence_begin" );
    maps\_audio::aud_send_msg( "finale_se", "start_run" );

    if ( !isdefined( level._id_74C4 ) )
        thread _id_74E3();

    thread _id_74C9();
    var_0 = getent( "finale_chopper", "targetname" );
    var_0.target = undefined;
    var_1 = maps\_vehicle::_id_2A99( "finale_chopper" );
    var_1 maps\_utility::_id_2629( "md500" );
    maps\_audio::aud_send_msg( "start_finale_chopper", var_1 );
    var_2 = _id_74BB( "pilot", "finale_chopper_pilot", "head_tank_a_pilot", 0 );
    level._id_2858 = var_2;
    var_3 = _id_74BB( "copilot", "finale_chopper_copilot", "head_henchmen_c", 1 );
    level._id_74C5 = var_3;
    var_4 = _id_74BB( "makarov", "makarov_finale_chopper", undefined, 0 );
    level._id_59A6 = var_4;
    var_5 = maps\_utility::_id_1287( "player_rig" );
    var_5 thread _id_7553();
    level._id_51F2 = var_5;
    var_6 = maps\_utility::_id_1287( "player_legs" );
    level._id_45FA = var_6;
    var_7 = maps\_utility::_id_1287( "knife" );
    var_8 = getent( "finale_scripted_node", "targetname" );
    level._id_7416 = var_1;
    thread maps\dubai_fx::_id_7415();
    var_9[0] = var_2;
    var_9[1] = var_3;
    var_9[2] = var_1;
    var_10[0] = var_2;
    var_10[1] = var_3;
    var_10[2] = var_1;
    var_10[3] = var_4;
    var_11[0] = var_5;
    var_11[1] = var_6;
    thread _id_74C7( var_11, var_8 );
    common_scripts\utility::flag_set( "update_obj_pos_finale_chopper" );
    thread _id_74CD( var_1 );
    thread _id_74CF();
    thread _id_74CB( var_10, var_11 );
    thread _id_74C6( var_4, var_8, var_1 );
    var_8 thread maps\_anim::_id_11DD( var_9, "helo_jump_1" );
    thread maps\dubai_fx::_id_7423();
    common_scripts\utility::flag_wait_either( "finale_player_jump_finished", "finale_too_late_to_jump" );

    if ( common_scripts\utility::flag( "finale_player_jump_successful" ) )
    {
        maps\_audio::aud_send_msg( "finale_se", "start_helo_sequence" );
        maps\_audio::aud_send_msg( "finale_jump_succesful", var_1 );
        thread _id_74D3();
        thread maps\dubai_fx::_id_740E();
        var_8 thread maps\_anim::_id_1246( var_7, "helo_jump_2" );
        var_8 thread _id_74BC( var_2, "helo_jump_2" );
        var_9[0] = undefined;
        var_3 linkto( var_1, "tag_guy1" );
        var_1 thread maps\_anim::_id_1246( var_3, "helo_jump_2", "tag_guy1" );
        var_8 maps\_anim::_id_1246( var_1, "helo_jump_2" );

        if ( !level._id_74C2 )
        {
            maps\_audio::aud_send_msg( "finale_se", "fail_helo_sequence" );
            var_7 delete();
            level._id_74C3 = 1;
            var_8 thread _id_4AFF( var_1, "helo_jump_3" );
            var_1 thread _id_4AFF( var_3, "helo_jump_stab_fail", 0.0, "tag_guy1" );
            var_1 thread _id_4AFF( var_5, "helo_jump_stab_fail", 0.0, "tag_guy1" );
            var_3 waittillmatch( "single anim", "fire" );
            thread _id_004F( &"DUBAI_FAILED_TO_STAB_COPILOT" );
            level._id_51F2 linkto( level._id_7416, "tag_player" );

            for (;;)
            {
                level.player playerlinktodelta( level._id_51F2, "tag_player", 1.0, 0, 0, 0, 0, 1 );
                wait 0.05;
            }
        }

        thread maps\dubai_fx::_id_7417();
        thread maps\dubai_fx::_id_7421();
        var_1 thread _id_74BC( var_3, "helo_jump_3", "tag_guy1" );
        var_8 maps\_anim::_id_1246( var_1, "helo_jump_3" );
        var_5 thread _id_74D4();
        var_8 _id_4AFF( var_1, "helo_jump_idle", 0 );
    }
    else
        wait 5;

    common_scripts\utility::flag_wait( "finale_chopper_crash_complete" );
    var_4 delete();
    var_1 delete();

    if ( isdefined( var_7 ) )
        var_7 delete();
}

_id_74C6( var_0, var_1, var_2 )
{
    var_1 thread maps\_anim::_id_1246( var_0, "helo_jump_1" );
    maps\_audio::aud_send_msg( "makarov_doorclose", var_0 );

    for (;;)
    {
        var_3 = var_0 getanimtime( level._id_0C59[var_0._id_1032]["helo_jump_1"] );

        if ( var_3 > 0.99 )
            break;

        wait 0.05;
    }

    var_2 maps\_anim::_id_11CF( var_0, "helo_jump_idle_nl", "tag_player" );
    var_0 linkto( var_2, "tag_player" );
    var_2 maps\_anim::_id_124E( var_0, "helo_jump_idle", "stop_loop", "tag_player" );
}

_id_74C7( var_0, var_1 )
{
    var_0[0] hide();
    var_0[1] hide();
    common_scripts\utility::flag_wait( "finale_player_jump_start" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "hud_showStance", "0" );
    thread maps\dubai_fx::_id_7411();
    thread _id_74C0();
    var_1 maps\_anim::_id_11BF( var_0, "helo_jump_1" );
    var_2 = 0.75;
    level.player playerlinktoblend( var_0[0], "tag_player", var_2, 0.05, 0.05 );
    var_0[0] common_scripts\utility::delaycall( var_2, ::show );
    var_0[1] common_scripts\utility::delaycall( var_2, ::show );
    common_scripts\utility::flag_set( "finale_player_jump_successful" );
    var_1 maps\_anim::_id_11DD( var_0, "helo_jump_1" );

    if ( !common_scripts\utility::flag( "finale_too_late_to_jump" ) )
    {
        common_scripts\utility::flag_set( "finale_player_jump_finished" );
        common_scripts\utility::flag_set( "update_obj_pos_finale_no_marker" );
        var_0[0] linkto( level._id_7416, "tag_guy1" );
        var_0[1] linkto( level._id_7416, "tag_guy1" );
        thread _id_0203();
        level._id_7416 _id_754E( var_0, "helo_jump_2", 0.0, "tag_guy1" );

        if ( level._id_74C2 && level._id_01FF )
            level._id_7416 _id_754E( var_0, "helo_jump_3", 0.0, "tag_guy1" );
        else
            wait 10;
    }

    thread maps\dubai_fx::_id_7412();
    var_0[0] thread _id_74C8( level._id_7416 );
    var_0[1] hide();
    var_0[0] linkto( level._id_7416, "tag_guy1" );
    level._id_7416 _id_4AFF( var_0[0], "helo_jump_idle", 0, "tag_guy1" );
    common_scripts\utility::flag_set( "finale_chopper_crash_complete" );
    wait 2.0;
    var_0[0] delete();
    var_0[1] delete();
}

_id_0201()
{
    var_0 = getanimlength( level._id_0C59["player_rig"]["helo_jump_2"] );
    var_1 = getnotetracktimes( level._id_0C59["player_rig"]["helo_jump_2"], "fail_start" );
    var_2 = var_1[0] * var_0;
    var_3 = 0;
    var_4 = var_2 - 1.5;
    level._id_01FF = 0;
    level._id_0202 = 0;
    var_5 = 0;

    while ( var_3 < var_2 )
    {
        if ( var_3 > var_4 )
        {
            if ( !var_5 )
            {
                var_5 = 1;
                level._id_13D9 = 3;
                maps\_utility::_id_1F61( "hint_throw_pilot" );
                level._id_13D9 = undefined;
            }
            else
            {

            }

            if ( level.player meleebuttonpressed() )
            {
                level._id_01FF = 1;
                return;
            }
        }

        var_3 += 0.05;
        wait 0.05;
    }
}

_id_0203()
{
    thread _id_0201();
    level._id_51F2 waittillmatch( "single anim", "fail_start" );

    if ( !level._id_01FF )
    {
        level._id_0202 = 1;
        var_0[0] = level._id_51F2;
        var_0[1] = level._id_45FA;
        var_0[2] = level._id_74C5;
        var_0[3] = level._id_59A6;
        var_1[0] = level._id_7416;
        var_1[1] = level._id_2858;
        var_2 = getent( "finale_scripted_node", "targetname" );
        level._id_7416 thread maps\_anim::_id_11DD( var_0, "helo_jump_kick_fail", "tag_guy1" );
        var_2 thread maps\_anim::_id_11DD( var_1, "helo_jump_kick_fail" );
        wait 0.75;
        setdvar( "ui_deadquote", &"DUBAI_FAILED_TO_THROW_PILOT" );
        setblur( 30, 2 );
        maps\_utility::_id_1826();
    }
}

_id_74C8( var_0 )
{
    var_1[0] = level._id_0C59["player_rig"]["helo_jump_middle"];
    var_1[1] = level._id_0C59["player_rig"]["helo_jump_pull"];
    var_1[2] = level._id_0C59["player_rig"]["helo_jump_push"];
    var_1[3] = level._id_0C59["player_rig"]["helo_jump_left"];
    var_1[4] = level._id_0C59["player_rig"]["helo_jump_right"];
    var_2[0] = level._id_0C59["md500"]["helo_jump_middle"];
    var_2[1] = level._id_0C59["md500"]["helo_jump_pull"];
    var_2[2] = level._id_0C59["md500"]["helo_jump_push"];
    var_2[3] = level._id_0C59["md500"]["helo_jump_left"];
    var_2[4] = level._id_0C59["md500"]["helo_jump_right"];
    var_3 = [ 0, 0 ];
    var_4 = 1.0;
    level._id_4553.intensity = 1.0;

    while ( !common_scripts\utility::flag( "finale_chopper_crash_complete" ) )
    {
        var_5 = level.player getnormalizedmovement();

        for ( var_6 = 0; var_6 < 2; var_6++ )
        {
            var_7 = var_5[var_6] - var_3[var_6];

            if ( var_7 > var_4 )
                var_7 = var_4;

            if ( var_7 < -1 * var_4 )
                var_7 = -1 * var_4;

            var_3[var_6] += var_7;
        }

        maps\_audio::aud_send_msg( "set_stick", var_3 );
        var_8 = [ 0, 0, 0, 0, 0 ];

        if ( var_3[0] >= 0 )
            var_8[2] = var_3[0];

        if ( var_3[0] < 0 )
            var_8[1] = -1 * var_3[0];

        if ( var_3[1] >= 0 )
            var_8[4] = var_3[1];

        if ( var_3[1] < 0 )
            var_8[3] = -1 * var_3[1];

        var_9 = 0;

        for ( var_6 = 1; var_6 < 5; var_6++ )
            var_9 += var_8[var_6];

        if ( var_9 < 1 )
            var_8[0] = 1 - var_9;

        for ( var_6 = 0; var_6 < 5; var_6++ )
        {
            self setanim( var_1[var_6], var_8[var_6], 0.05 );
            var_0 setanim( var_2[var_6], var_8[var_6], 0.05 );
        }

        wait 0.05;
    }

    for ( var_6 = 0; var_6 < 5; var_6++ )
    {
        self setanim( var_1[var_6], 0, 0.05 );

        if ( isdefined( var_0 ) )
            var_0 setanim( var_2[var_6], 0, 0.05 );
    }

    wait 2;
    level._id_4553.intensity = 0.0;
}

_id_74C9()
{
    level.player endon( "death" );
    level.player.speed = 0;
    level.player._id_74CA = level.player.origin;

    while ( !common_scripts\utility::flag( "finale_too_late_to_jump" ) && !common_scripts\utility::flag( "finale_player_jump_start" ) )
    {
        level.player._id_695C = ( level.player.origin - level.player._id_74CA ) * 20;
        level.player.speed = length( level.player._id_695C );
        level.player._id_74CA = level.player.origin;
        wait 0.05;
    }
}

_id_74CB( var_0, var_1 )
{
    wait 0.05;
    var_2 = getent( "trig_player_chopperjump", "script_noteworthy" );
    var_3 = ( 1800.0, 0.0, 8112.0 );
    var_4 = 5.66667;
    var_5 = var_4 + 1.5;
    var_6 = var_4 / var_5;
    var_7 = 1.2;
    var_8 = [];

    foreach ( var_10 in var_0 )
        var_8[var_8.size] = level._id_0C59[var_10._id_1032]["helo_jump_1"];

    var_12 = [];

    foreach ( var_10 in var_1 )
        var_12[var_12.size] = level._id_0C59[var_10._id_1032]["helo_jump_1"];

    while ( !common_scripts\utility::flag( "finale_too_late_to_jump" ) && !common_scripts\utility::flag( "finale_player_jump_start" ) )
    {
        var_15 = distance( level.player.origin, var_3 );
        var_16 = level.player.speed;
        var_17 = getanimlength( var_8[0] );
        var_18 = var_0[0] getanimtime( var_8[0] );
        var_18 *= var_17;
        var_19 = 5.66667 - var_18;
        var_20 = 1.0;

        if ( var_19 >= 0 )
        {
            if ( var_16 > 0 )
            {
                var_21 = var_15 / var_16;
                var_20 = var_19 / var_21;
            }
            else
                var_20 = 0;
        }
        else
            common_scripts\utility::flag_set( "finale_too_late_to_jump" );

        if ( var_20 < var_6 )
            var_20 = var_6;

        if ( var_20 >= var_7 )
            var_20 = var_7;

        foreach ( var_23, var_10 in var_0 )
            var_10 setanim( var_8[var_23], 1.0, 0.2, var_20 );

        wait 0.05;
    }

    if ( common_scripts\utility::flag( "finale_too_late_to_jump" ) )
    {
        foreach ( var_23, var_10 in var_0 )
            var_10 setanim( var_8[var_23], 1.0, 0.2, 1.0 );
    }
    else if ( common_scripts\utility::flag( "finale_player_jump_start" ) )
    {
        var_25 = getanimlength( var_12[0] );
        var_17 = getanimlength( var_8[0] );
        var_26 = var_17 * ( 1 - var_0[0] getanimtime( var_8[0] ) );
        var_20 = var_26 / var_25;

        foreach ( var_23, var_10 in var_0 )
            var_10 setanim( var_8[var_23], 1.0, 0.2, var_20 );

        for ( var_28 = var_25; var_28 > 0; var_28 -= 0.05 )
        {
            var_26 = var_17 * ( 1 - var_0[0] getanimtime( var_8[0] ) );
            var_29 = var_25 * ( 1 - var_1[0] getanimtime( var_12[0] ) );

            if ( var_29 > 0.1 )
                var_20 = var_26 / var_29;

            foreach ( var_23, var_10 in var_0 )
                var_10 setanim( var_8[var_23], 1.0, 0.2, var_20 );

            wait 0.05;
        }
    }
}

_id_74CC()
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
        common_scripts\utility::flag_set( var_0 );
        wait 0.1;

        while ( !level.player isonground() )
            wait 0.05;

        common_scripts\utility::flag_clear( var_0 );
    }
}

_id_74CD( var_0 )
{
    var_1 = getent( "trig_player_chopperjump", "script_noteworthy" );
    var_2 = anglestoforward( ( 0.0, 0.0, 0.0 ) );
    thread _id_74CC();
    var_3 = var_0 gettagorigin( "tag_guy1" );
    var_3 = var_3;
    var_4 = spawn( "script_origin", var_3 );
    var_4 linkto( var_0, "tag_guy1" );
    var_5 = common_scripts\utility::getstructarray( "struct_chopperjump_alt_lookspot", "targetname" );

    for (;;)
    {
        var_6 = 0;

        while ( level.player istouching( var_1 ) )
        {
            common_scripts\utility::flag_wait( "player_jumping" );

            if ( _id_74CE( var_1, var_4, var_5, var_0 ) )
            {
                var_6 = 1;
                break;
            }

            wait 0.05;
        }

        if ( var_6 )
            break;

        wait 0.05;
    }

    if ( common_scripts\utility::flag( "finale_too_late_to_jump" ) )
        return;

    common_scripts\utility::flag_set( "finale_player_jump_start" );
    maps\_audio::aud_send_msg( "finale_se", "end_run" );
}

_id_74CE( var_0, var_1, var_2, var_3 )
{
    if ( !var_0 istouching( level.player ) )
        return 0;

    if ( level.player getstance() != "stand" )
        return 0;

    if ( level.player isonground() )
        return 0;

    var_4 = var_3 gettagorigin( "tag_guy1" );
    var_5 = vectornormalize( var_4 - level.player.origin );
    var_6 = vectordot( var_5, level.player._id_695C );

    if ( var_6 < 100 )
        return 0;

    if ( var_5[2] < 0 )
        return 0;

    return 1;
}

_id_74CF()
{
    level endon( "finale_player_jump_successful" );
    common_scripts\utility::flag_wait( "finale_too_late_to_jump" );
    _id_74D0();
}

_id_74D0()
{
    setdvar( "ui_deadquote", &"DUBAI_MAKAROV_ESCAPED_FINALE" );
    setblur( 30, 2 );
    maps\_utility::_id_1826();
}

_id_74D2()
{
    return level._id_74C2 || level._id_74C3;
}

_id_0204()
{
    return level._id_01FF || level._id_0202;
}

_id_74D3()
{
    var_0 = getanimlength( level._id_0C59["copilot"]["helo_jump_2"] );
    var_1 = 0;
    var_2 = var_0 - 1.5;
    level._id_74C2 = 0;
    var_3 = 0;
    var_4 = 1;
    var_5 = 0;
    var_6 = 0;

    while ( var_1 < var_0 )
    {
        if ( var_1 > var_2 )
        {
            if ( !var_3 )
            {
                var_3 = 1;
                level._id_13D9 = 3;
                maps\_utility::_id_1F61( "hint_stab_copilot" );
                level._id_13D9 = undefined;
            }
            else
            {

            }

            if ( level.player meleebuttonpressed() )
            {
                level._id_74C2 = 1;
                return;
            }
        }

        var_1 += 0.05;
        wait 0.05;
    }
}

_id_74D4()
{
    self waittillmatch( "single anim", "crash" );
    maps\_audio::aud_send_msg( "chopper_crash_finale" );
    var_0 = _id_74D8();
    var_1 = _id_74D7();
    level.player shellshock( "dubai_ending_no_control", 2 );
    earthquake( 1, 2, level.player.origin, 8000 );
    level.player playrumbleonentity( "damage_heavy" );
    wait 0.5;
    var_0 fadeovertime( 0.05 );
    var_0.alpha = 1.0;
    wait 0.05;
    var_1 fadeovertime( 1 );
    var_1.alpha = 1.0;
    wait 1.0;
    var_0 fadeovertime( 1 );
    var_0.alpha = 0.0;
}

_id_74D5()
{
    pausecinematicingame( 0 );

    for (;;)
    {
        while ( iscinematicplaying() )
            wait 0.5;

        break;
    }
}

_id_74D6()
{
    self._id_4B36 = self.origin;
    self._id_4B19 = self.angles;
    var_0 = ( 3.5, -3.5, 0.0 );
    var_1 = ( 0.0, 1.0, -0.5 );

    for (;;)
    {
        self.origin = self._id_4B36 + var_0;
        self.angles = self._id_4B19 + var_1;
        wait 0.05;
    }
}

_id_74D7()
{
    var_0 = maps\dubai_utils::_id_473C();
    var_0.sort = 1;
    return var_0;
}

_id_74D8()
{
    if ( !isdefined( level._id_56AE ) )
    {
        var_0 = newhudelem();
        var_0.x = 0;
        var_0.y = 0;
        var_0 setshader( "white", 640, 480 );
        var_0.alignx = "left";
        var_0.aligny = "top";
        var_0.horzalign = "fullscreen";
        var_0.vertalign = "fullscreen";
        var_0.alpha = 0;
        var_0.sort = 2;
        level._id_56AE = var_0;
    }

    return level._id_56AE;
}

_id_74D9()
{
    maps\_utility::add_hint_string( "hint_get_the_gun", &"DUBAI_PRESS_DRAG_RIGHT", ::_id_74DD );
    thread _id_750A();
    common_scripts\utility::flag_wait( "finale_chopper_crash_complete" );
    thread _id_74C0();

    if ( !isdefined( level._id_74C4 ) )
        thread _id_74E3();

    level.player freezecontrols( 1 );
    var_0 = _id_74D7();

    if ( isdefined( level._id_74DA ) && level._id_74DA )
        var_0.alpha = 1.0;

    thread maps\dubai_fx::_id_7430();
    maps\_audio::aud_send_msg( "finale_se", "start_chopper_fire_amb" );
    var_1 = getent( "roof_reflection", "targetname" );
    var_1 thread _id_74D6();
    level.player unlink();
    level.player maps\_utility::_id_1FDF( getent( "finale_player_crash_location", "targetname" ) );
    var_2 = gettime();
    thread maps\_utility::_id_25F3( "finale_crash_site" );
    wait 0.1;
    common_scripts\utility::flag_waitopen( "game_saving" );
    wait 0.1;
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingame( "dubai_reflection", 1 );
    var_3 = ( gettime() - var_2 ) / 1000;

    if ( var_3 > 2.5 )
        wait 2.5;
    else
        wait(5 - var_3);

    var_4 = getent( "finale_crash_site_makarov", "script_noteworthy" );
    var_4 maps\_utility::add_spawn_function( ::_id_74F5 );
    level._id_59A6 = var_4 maps\_utility::_id_166F( 1 );
    thread maps\dubai_fx::_id_7428();
    level notify( "fx_mak_light" );
    thread _id_74E6();

    if ( !isdefined( level._id_73D7 ) )
    {
        var_5 = getent( "yuri", "targetname" );
        var_5.script_noteworthy = "yuri";
        var_5 thread maps\_utility::_id_26BD( maps\dubai_code::_id_74DB );
        var_5 thread maps\_utility::add_spawn_function( ::_id_74F3 );
        var_5 maps\_utility::_id_166F( 1 );
    }
    else
    {
        level._id_73D7 thread maps\_utility::_id_1902();
        level._id_73D7 thread _id_74F3();
    }

    level.player freezecontrols( 0 );
    level.player setblurforplayer( 6, 0 );
    level.player thread _id_6FFD( 20, 1, 8, 1 );
    var_0 maps\dubai_utils::_id_7451( 1, 0 );
    wait 0.05;
    level.player setblurforplayer( 3, 0.5 );
    thread _id_74DC();
}

_id_74DC()
{
    wait 9.9;
    level.player shellshock( "dubai_ending_crash_site", 28 );
}

_id_74DD()
{
    return level.player._id_74DE;
}

_id_74DF( var_0, var_1 )
{
    var_2 = gettime() + var_1;

    foreach ( var_4 in var_0 )
    {
        if ( var_4 > var_2 )
            return 1;
    }

    return 0;
}

_id_74E0( var_0 )
{
    return _id_74DF( level._id_74C4, var_0 );
}

_id_74E1( var_0 )
{
    return _id_74DF( level._id_74E2, var_0 );
}

_id_74E3()
{
    level endon( "stop_monitor_button_presses" );
    var_0 = level.player attackbuttonpressed();
    var_1 = level.player usebuttonpressed();
    var_2 = 3;
    level._id_74C4 = [];
    level._id_74E2 = [];

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        level._id_74C4[var_3] = 0;
        level._id_74E2[var_3] = 0;
    }

    for (;;)
    {
        var_4 = level.player attackbuttonpressed();

        if ( !var_0 && var_4 )
        {
            for ( var_3 = var_2 - 1; var_3 > 0; var_3-- )
                level._id_74C4[var_3] = level._id_74C4[var_3 - 1];

            level._id_74C4[0] = gettime();
        }

        var_0 = var_4;
        var_5 = level.player usebuttonpressed();

        if ( !var_1 && var_5 )
        {
            for ( var_3 = var_2 - 1; var_3 > 0; var_3-- )
                level._id_74E2[var_3] = level._id_74E2[var_3 - 1];

            level._id_74E2[0] = gettime();
        }

        var_1 = var_5;
        wait 0.05;
    }
}

_id_74E4()
{
    var_0 = _id_74E0( -500 );

    if ( var_0 )
        return;

    level.player._id_74DE = 0;
    level._id_13D9 = 3;
    maps\_utility::_id_1823( "hint_get_the_gun", 12 );
    level._id_13D9 = undefined;
}

_id_74E5( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_74E0( -500 );
    var_5 = self;
    var_6 = 0;

    if ( !var_4 )
    {
        var_5 thread maps\_anim::_id_124E( var_0, var_1, "stop_player_loop" );
        var_6 = 1;
        level.player._id_74DE = 0;
        level._id_13D9 = 3;

        if ( !isdefined( var_2 ) || !var_2 )
            maps\_utility::_id_1823( "hint_get_the_gun", 12 );

        while ( !var_4 )
        {
            var_4 = _id_74E0( -500 );
            wait 0.05;
        }

        level._id_13D9 = undefined;
    }

    var_5 notify( "stop_player_loop" );

    if ( !isdefined( var_3 ) || !var_3 )
        level.player._id_74DE = 1;
    else
        level.player._id_74DE = 0;
}

_id_004D( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_clear( "wait_for_forward_anim" );
    common_scripts\utility::flag_clear( "wait_for_forward" );
    var_4 = self;
    var_5 = var_0 maps\_utility::_id_1281( var_1 );
    var_6 = getanimlength( var_5 );
    var_7 = var_6 - 0.4;
    var_8 = var_7 / var_6;

    while ( var_0 getanimtime( var_5 ) < var_8 )
        wait 0.05;

    var_9 = _id_74E0( -100 );

    if ( !var_9 )
    {
        level.player._id_74DE = 0;
        level._id_13D9 = 3;
        maps\_utility::_id_1823( "hint_get_the_gun", 12 );
        level._id_13D9 = undefined;
    }

    common_scripts\utility::flag_wait( "wait_for_forward_anim" );
    var_4 _id_74E5( var_0, var_2, 0, var_3 );
    common_scripts\utility::flag_set( "wait_for_forward" );
}

_id_74E6()
{
    level endon( "player_dies" );
    var_0 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    var_0 thread _id_7553();
    level._id_51F2 = var_0;
    level.player playerlinktoblend( var_0, "tag_player", 0.2 );
    var_1 = getent( "finale_scripted_node", "targetname" );
    var_2 = "finale_wake";
    var_1 maps\_anim::_id_124F( var_0, var_2 );
    var_3 = getanimlength( var_0 maps\_utility::_id_1281( var_2 ) );
    maps\_utility::delaythread( var_3 - 1, ::_id_74E4 );
    thread _id_74D5();
    var_0 thread _id_74EA();
    var_1 maps\_anim::_id_1246( var_0, var_2 );
    maps\_audio::aud_send_msg( "finale_se", "end_helo_sequence" );
    common_scripts\utility::flag_init( "wait_for_forward" );
    common_scripts\utility::flag_init( "wait_for_forward_anim" );
    level._id_74E7 = 1;
    level._id_74E8 = "finale_crawl0";
    var_1 _id_74E5( var_0, "finale_wake_idle", 1 );
    thread _id_74F2();
    maps\_audio::aud_send_msg( "finale_se", "start_crawl" );
    var_1 thread _id_004D( var_0, level._id_74E8 + level._id_74E7, "finale_crawl01_idle" );
    var_1 maps\_anim::_id_1246( var_0, level._id_74E8 + level._id_74E7 );
    common_scripts\utility::flag_set( "wait_for_forward_anim" );
    common_scripts\utility::flag_wait( "wait_for_forward" );
    level._id_74E7++;
    var_1 thread _id_004D( var_0, level._id_74E8 + level._id_74E7, "finale_crawl02_idle" );
    var_1 maps\_anim::_id_1246( var_0, level._id_74E8 + level._id_74E7 );
    common_scripts\utility::flag_set( "wait_for_forward_anim" );
    common_scripts\utility::flag_wait( "wait_for_forward" );
    level._id_74E7++;
    var_1 thread _id_004D( var_0, level._id_74E8 + level._id_74E7, "finale_crawl03_idle", level._id_74E9 );
    var_1 maps\_anim::_id_1246( var_0, level._id_74E8 + level._id_74E7 );
    common_scripts\utility::flag_set( "wait_for_forward_anim" );
    common_scripts\utility::flag_wait( "wait_for_forward" );
    level._id_74E7++;
    common_scripts\utility::flag_set( "player_started_draw" );
    level notify( "crawling_finished" );

    if ( isdefined( level._id_74E9 ) && level._id_74E9 )
    {
        var_1 thread _id_74EE( level._id_51F2 );
        var_1 thread maps\_anim::_id_1246( level._id_51F2, "finale_draw_fail" );
        var_4 = level._id_51F2 maps\_utility::_id_1281( "finale_draw_fail_blend" );
        var_0 setflaggedanimknobrestart( "single anim", var_4[0], 1.0, 0.2, 1.0 );
        var_0 thread _id_74EB( var_4 );
        wait(getanimlength( var_4[0] ));
        return;
    }

    maps\_audio::aud_send_msg( "finale_se", "start_showdown" );
    var_1 maps\_anim::_id_1246( var_0, "finale_draw" );
    common_scripts\utility::flag_wait( "start_finale_showdown" );
    var_1 thread maps\_anim::_id_1246( var_0, "finale_showdown" );
    var_0 thread _id_74F0();
}

_id_74EA()
{
    self waittillmatch( "single anim", "dof_on" );
    self waittillmatch( "single anim", "dof_off" );
    level.player setblurforplayer( 0.0, 0.5 );
}

_id_74EB( var_0 )
{
    var_1 = getnotetracktimes( var_0[1], "faila" );
    var_2[0] = var_1[0];
    var_1 = getnotetracktimes( var_0[1], "failb" );
    var_2[1] = var_1[0];
    var_1 = getnotetracktimes( var_0[1], "failc" );
    var_2[2] = var_1[0];
    level._id_74EC = 0;
    level._id_74ED = var_2[0];
    var_3 = 0;
    var_4 = 0;
    var_5 = level._id_51F2 maps\_utility::_id_1281( "finale_draw_fail" );

    while ( var_3 < var_2.size )
    {
        var_6 = self getanimtime( var_5 );

        if ( var_4 <= var_2[var_3] && var_2[var_3] < var_6 )
        {
            level._id_74E7++;
            var_3++;

            if ( var_3 < var_2.size )
            {
                level._id_74EC = level._id_74ED;
                level._id_74ED = var_2[var_3];
            }
        }

        var_4 = var_6;
        wait 0.05;
    }
}

_id_74EE( var_0 )
{
    common_scripts\utility::flag_wait( "finale_crawl_lookup" );
    wait 0.05;
    var_1 = var_0 maps\_utility::_id_1281( "finale_draw_fail" );
    var_2 = var_0 getanimtime( var_1 );
    var_3 = var_0 maps\_utility::_id_1281( "finale_draw_fail_blend" );
    var_0 setflaggedanimknob( "single anim", var_3[1], 1.0, 0.5, 1.0 );
    var_0 setanimtime( var_3[1], var_2 );
}

_id_74EF( var_0, var_1 )
{
    var_2 = maps\_utility::_id_1281( var_0 );
    var_3 = getnotetracktimes( var_2, var_1 );
}

_id_74F0( var_0, var_1, var_2, var_3 )
{
    var_4 = "slowmo_start";
    var_5 = "slowmo_end";

    if ( !isdefined( var_1 ) )
        var_1 = 0.4;

    if ( isdefined( var_0 ) )
    {
        var_4 = var_0 + "_start";
        var_5 = var_0 + "_end";
    }

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0.25;

    self waittillmatch( "single anim", var_4 );
    maps\_utility::_id_2772( var_1 );
    maps\_utility::_id_2774( var_2 );
    maps\_utility::_id_0A16( var_3 );
    maps\_utility::_id_2775();
    self._id_74F1 = 1;
    self waittillmatch( "single anim", var_5 );
    maps\_utility::_id_0A17();
    self._id_74F1 = 0;
}

_id_74F2()
{
    maps\_utility::_id_2772( 0.85 );
    maps\_utility::_id_2774( 0 );
    maps\_utility::_id_0A16( 0.0 );
    maps\_utility::_id_2775();
    level waittill( "crawling_finished" );
    maps\_utility::_id_0A17();
}

_id_74F3()
{
    level._id_73D7 = self;
    self._id_1032 = "yuri";
    var_0 = getent( "finale_scripted_node", "targetname" );
    var_0 maps\_anim::_id_124F( self, "finale_showdown" );
    maps\_utility::_id_24F5();
    wait 1;
    maps\_utility::_id_104A( "usp", "primary" );
    common_scripts\utility::flag_wait( "start_finale_showdown" );
    thread maps\dubai_fx::_id_742A();
    thread maps\dubai_fx::_id_742B();
    var_0 maps\_anim::_id_1246( self, "finale_showdown" );
}

_id_74F4( var_0, var_1 )
{
    var_2 = self;
    var_2 maps\_anim::_id_1246( var_0, "finale_draw" );
    var_3 = "j_wrist_ri";
    var_0 linkto( var_1, var_3 );
    var_1 maps\_anim::_id_1246( var_0, "finale_draw02", var_3 );
}

_id_74F5()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 2; var_1++ )
    {
        for ( var_2 = 0; var_2 < 5; var_2++ )
        {
            level._id_74F6[var_1][var_2] = maps\_utility::_id_1287( "makarov" );
            level._id_74F6[var_1][var_2] hide();
            var_0[var_1][var_2][0] = level._id_74F6[var_1][var_2];
        }
    }

    self._id_1032 = "makarov";
    level._id_59A6 = self;
    level._id_74F7[0] = self;
    level._id_74F7[1] = maps\_utility::_id_1287( "makarov" );
    level._id_74F7[1] hide();
    maps\_utility::_id_24F5();
    var_3 = getent( "finale_scripted_node", "targetname" );
    var_4 = maps\_utility::_id_1287( "deagle" );
    level._id_73CD = var_4;
    level._id_73CD hidepart( "TAG_SILENCER" );
    level._id_73CD hidepart( "TAG_KNIFE" );
    level._id_74F8[0] = var_4;
    level._id_74F8[1] = maps\_utility::_id_1287( "deagle" );
    level._id_74F8[1] hidepart( "TAG_SILENCER" );
    level._id_74F8[1] hidepart( "TAG_KNIFE" );
    level._id_74F8[1] hide();
    var_3 maps\_anim::_id_11CF( var_4, "finale_draw" );
    var_5[0] = self;
    var_6 = "finale_wake";
    var_3 maps\_anim::_id_124F( level._id_59A6, var_6 );
    self linkto( var_3 );
    var_3 maps\_anim::_id_1246( level._id_59A6, var_6 );

    if ( !common_scripts\utility::flag( "player_started_draw" ) )
    {
        var_3 thread maps\_anim::_id_124E( level._id_59A6, "finale_wake_idle", "makarov_loop" );
        var_7 = 3.0;

        while ( !common_scripts\utility::flag( "player_started_draw" ) && var_7 >= 0 )
        {
            var_7 -= 0.05;
            wait 0.05;
        }

        var_3 notify( "makarov_loop" );
    }

    var_8 = !common_scripts\utility::flag( "player_started_draw" );
    level._id_74E9 = var_8;
    common_scripts\utility::flag_set( "vo_finale_roof_start" );

    if ( var_8 )
    {
        level notify( "crawling_finished" );
        level._id_74E8 = "finale_fail_crawl0";
        maps\_audio::aud_send_msg( "finale_se", "fail_crawl" );
        level.player shellshock( "dubai_ending_crash_site", 40 );
        var_5[1] = var_4;
        var_6 = "finale_draw_fail";
        var_9 = var_5[0] maps\_utility::_id_1281( "finale_draw_fail_blend" );
        level._id_74F9 = var_5[0] maps\_utility::_id_1281( var_6 );
        var_5[0] thread _id_74FA();
        var_10 = var_4 maps\_utility::_id_1281( var_6 );
        var_11 = getnotetracktimes( var_10, "mfire" );
        var_12 = var_11[0] * getanimlength( var_10 );

        for ( var_2 = 0; var_2 < 5; var_2++ )
            var_3 thread maps\_anim::_id_11DD( var_0[0][var_2], var_6 );

        wait 0.05;
        var_3 thread maps\_anim::_id_11DD( var_5, var_6 );
        thread _id_7503( 0 );
        var_4 thread _id_7506( var_12 );
        maps\_audio::aud_send_msg( "makarov_fail_getgun" );
        wait(var_12);
        level.player._id_74DE = 1;
        _id_004F( &"DUBAI_MAKAROV_KILLED_YOU" );
    }

    var_3 thread _id_74F4( var_4, level._id_59A6 );
    var_3 _id_754E( var_5, "finale_draw", 1.0 );
    common_scripts\utility::flag_set( "start_finale_showdown" );
    thread _id_7509( var_3 );
    thread maps\_utility::_id_25F3( "finale_showdown" );
    level._id_59A6 thread _id_4AFF( var_4, "finale_showdown", 0, "j_wrist_ri" );
    var_3 _id_754E( var_5, "finale_showdown", 0 );
    var_4 unlink();
    common_scripts\utility::flag_set( "end_finale_showdown" );
    maps\_audio::aud_send_msg( "finale_se", "end_showdown" );
}

_id_74FA()
{
    var_0 = getnotetracktimes( level._id_74F9, "stopcrawl" );
    var_1 = getanimlength( level._id_74F9 );
    wait(var_1 * var_0[0] - 1.33333);
    common_scripts\utility::flag_set( "finale_crawl_lookup" );
}

_id_74FB( var_0, var_1 )
{
    var_2 = angleclamp180( var_1[0] ) - angleclamp180( var_0[0] );
    var_2 = angleclamp180( var_2 );
    var_3 = angleclamp180( var_1[1] ) - angleclamp180( var_0[1] );
    var_3 = angleclamp180( var_3 );
    return ( var_2, var_3, 0 );
}

_id_74FC( var_0, var_1, var_2 )
{
    var_3 = var_1 - var_0;
    var_4 = var_2 - var_0;
    var_5 = maps\_shg_common::_id_1684( var_3, var_4 );
    var_5 = vectornormalize( var_5 );
    var_6 = vectordot( var_5, var_0 );
    return [ var_5, var_6 ];
}

_id_74FD( var_0, var_1 )
{
    var_2 = vectordot( var_0[0], var_1 );

    if ( var_2 >= var_0[1] )
        return 1;
    else
        return -1;
}

_id_74FE( var_0, var_1 )
{
    var_2 = vectordot( var_1[0], var_0 );
    var_2 -= var_1[1];
    var_0 -= var_2 * var_1[0];
    return var_0;
}

_id_74FF( var_0, var_1, var_2 )
{
    var_3 = vectordot( var_1, var_2[0] );

    if ( var_3 == 0 )
        return ( 0.0, 0.0, 0.0 );

    var_4 = var_2[1] * var_2[0];
    var_5 = vectordot( var_4 - var_0, var_2[0] ) / var_3;
    var_4 = var_0 + var_5 * var_1;
    return var_4;
}

_id_7500( var_0, var_1, var_2, var_3 )
{
    var_4[0][0] = var_0[0];
    var_4[0][1] = var_0[1];
    var_4[0][2] = var_0[2];
    var_4[1][0] = var_1[0];
    var_4[1][1] = var_1[1];
    var_4[1][2] = var_1[2];
    var_4[2][0] = var_2[0];
    var_4[2][1] = var_2[1];
    var_4[2][2] = var_2[2];
    var_5 = var_4[0][0] * ( var_4[2][2] * var_4[1][1] - var_4[2][1] * var_4[1][2] ) - var_4[0][1] * ( var_4[2][2] * var_4[1][0] - var_4[1][2] * var_4[2][0] ) + var_4[0][2] * ( var_4[2][1] * var_4[1][0] - var_4[1][1] * var_4[2][0] );

    if ( var_5 != 0 )
    {
        var_6 = 1.0 / var_5;
        var_7[0][0] = var_6 * ( var_4[2][2] * var_4[1][1] - var_4[2][1] * var_4[1][2] );
        var_7[0][1] = -1 * var_6 * ( var_4[2][2] * var_4[0][1] - var_4[2][1] * var_4[0][2] );
        var_7[0][2] = var_6 * ( var_4[1][2] * var_4[0][1] - var_4[1][1] * var_4[0][2] );
        var_7[1][0] = -1 * var_6 * ( var_4[2][2] * var_4[1][0] - var_4[2][0] * var_4[1][2] );
        var_7[1][1] = var_6 * ( var_4[2][2] * var_4[0][0] - var_4[2][0] * var_4[0][2] );
        var_7[1][2] = -1 * var_6 * ( var_4[1][2] * var_4[0][0] - var_4[1][0] * var_4[0][2] );
        var_7[2][0] = var_6 * ( var_4[2][1] * var_4[1][0] - var_4[2][0] * var_4[1][1] );
        var_7[2][1] = -1 * var_6 * ( var_4[2][1] * var_4[0][0] - var_4[2][0] * var_4[0][1] );
        var_7[2][2] = var_6 * ( var_4[1][1] * var_4[0][0] - var_4[1][0] * var_4[0][1] );
        var_8 = undefined;
        var_9 = undefined;

        for ( var_10 = 0; var_10 < 3; var_10++ )
        {
            var_8[var_10] = ( var_7[0][var_10], var_7[1][var_10], var_7[2][var_10] );
            var_9[var_10] = ( var_4[var_10][0], var_4[var_10][1], var_4[var_10][2] );
        }

        var_11[0] = ( vectordot( var_9[0], var_8[0] ), vectordot( var_9[0], var_8[1] ), vectordot( var_9[0], var_8[2] ) );
        var_11[1] = ( vectordot( var_9[1], var_8[0] ), vectordot( var_9[1], var_8[1] ), vectordot( var_9[1], var_8[2] ) );
        var_11[2] = ( vectordot( var_9[2], var_8[0] ), vectordot( var_9[2], var_8[1] ), vectordot( var_9[2], var_8[2] ) );
        var_12 = ( vectordot( var_8[0], var_3 ), vectordot( var_8[1], var_3 ), vectordot( var_8[2], var_3 ) );
        var_13 = var_12[0] * var_0 + var_12[1] * var_1 + var_12[2] * var_2;
        return var_12;
    }
    else
        return ( 1.0, 0.0, 0.0 );
}

_id_7501( var_0, var_1, var_2, var_3 )
{
    var_4 = "tag_flash";
    var_5 = maps\_utility::_id_1281( "finale_draw_fail_blend" );
    var_6 = maps\_utility::_id_1281( "finale_draw_fail" );
    var_7 = 0;
    var_8 = 0.5;

    for (;;)
    {
        var_9 = [];
        var_10 = [];
        var_11 = [];
        var_12 = var_0 gettagorigin( var_4 );
        var_13 = level.player getplayerviewheight();
        var_14 = level.player.origin + ( 0, 0, var_13 );
        var_15 = var_14 - var_12;
        var_16 = var_0 gettagangles( var_4 );
        var_17 = anglestoforward( var_16 );
        var_18 = var_14;
        var_19 = length( var_15 );

        for ( var_20 = 0; var_20 < 5; var_20++ )
        {
            var_9[var_20] = var_2[var_20] gettagorigin( var_4 );
            var_10[var_20] = var_2[var_20] gettagangles( var_4 );
            var_11[var_20] = var_19 * anglestoforward( var_10[var_20] );
        }

        var_21 = var_9[0] + var_11[0];
        var_22[0] = _id_74FC( var_9[0], var_21, var_9[1] );
        var_22[1] = _id_74FC( var_9[0], var_21, var_9[2] );
        var_22[2] = _id_74FC( var_9[0], var_21, var_9[3] );
        var_22[3] = _id_74FC( var_9[0], var_21, var_9[4] );
        var_23 = [ [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ] ];
        var_24 = [ [ 1, -1 ], [ -1, 1 ], [ -1, 1 ], [ 1, -1 ] ];
        var_25 = [];

        for ( var_26 = 0; var_26 < 4; var_26++ )
            var_25[var_26] = _id_74FD( var_22[var_26], var_18 );

        var_27 = undefined;

        for ( var_28 = 0; var_28 < 4; var_28++ )
        {
            var_27 = var_23[var_28];
            var_29 = var_24[var_28];
            var_30 = var_25[var_27[0]] * var_29[0];

            if ( var_30 > 0 )
            {
                var_30 = var_25[var_27[1]] * var_29[1];

                if ( var_30 > 0 )
                    break;
            }
        }

        var_31 = [ 1, 0, 0, 0, 0 ];

        if ( var_28 < 4 )
        {
            var_32 = var_9[0] + var_11[0];
            var_33 = var_9[var_27[0] + 1] + var_11[var_27[0] + 1];
            var_34 = var_9[var_27[1] + 1] + var_11[var_27[1] + 1];
            var_35 = _id_74FC( var_32, var_33, var_34 );
            var_18 = _id_74FF( var_18, var_11[0], var_35 );
            var_36 = _id_7500( var_32, var_33, var_34, var_18 );
            var_31[0] = var_36[0];
            var_31[var_27[0] + 1] = var_36[1];
            var_31[var_27[1] + 1] = var_36[2];
            var_37 = 0;

            for ( var_20 = 0; var_20 < 5; var_20++ )
            {
                if ( var_31[var_20] < 0 )
                    var_31[var_20] = 0;

                var_37 += var_31[var_20];
            }

            if ( var_37 > 0 )
            {
                for ( var_20 = 0; var_20 < 5; var_20++ )
                    var_31[var_20] /= var_37;
            }
        }

        var_38 = self getanimtime( var_6 );

        for ( var_20 = 0; var_20 < 5; var_20++ )
        {
            self setanim( var_5[var_20], var_31[var_20], var_8, 1.0 );
            self setanimtime( var_5[var_20], var_38 );
        }

        var_8 -= 0.1;

        if ( var_8 < 0.05 )
            var_8 = 0.05;

        wait 0.05;
    }
}

_id_7502( var_0, var_1, var_2, var_3 )
{
    var_4 = "j_shoulder_ri";
    var_5 = maps\_utility::_id_1281( "finale_draw_fail_blend" );
    var_6 = maps\_utility::_id_1281( "finale_draw_fail" );
    var_7 = 30;
    var_8 = ( 0.0, 0.0, 0.0 );
    var_9 = 1;
    var_10 = 0;
    var_11 = 0;
    var_12 = 0.5;

    for (;;)
    {
        var_13 = [];
        var_14 = [];
        var_15 = [];
        var_16 = var_0 gettagorigin( var_4 );

        for ( var_17 = 0; var_17 < 5; var_17++ )
        {
            var_13[var_17] = var_2[var_17] gettagorigin( var_4 );
            var_14[var_17] = var_2[var_17] gettagangles( "tag_flash" );
            var_15[var_17] = 120 * anglestoforward( var_14[var_17] );
        }

        var_18 = level.player getplayerviewheight();
        var_19 = level.player.origin + ( 0, 0, var_18 - 6 );
        var_20 = var_19 - var_16;
        var_21 = var_0 gettagangles( "tag_flash" );
        var_22 = anglestoforward( var_21 );
        var_23 = vectortoangles( var_20 );
        var_24 = _id_74FB( var_14[0], var_23 );
        var_25 = var_24[0];
        var_26 = var_24[1];
        var_27 = 0;
        var_28 = undefined;
        var_29 = 0;
        var_30 = undefined;
        var_31 = [ 0, 0, 0, 0, 0 ];

        if ( var_9 )
        {
            if ( var_25 > 0 )
                var_27 = 1;
            else
                var_27 = 2;

            if ( var_26 > 0 )
                var_29 = 3;
            else
                var_29 = 4;

            var_32 = 1;
            var_33 = 0;
            var_34 = [ 0, 0, 0, 0, 0 ];
            var_35 = -1;

            for ( var_36 = 100000; var_32 && var_33 < 4; var_33++ )
            {
                var_31 = [ 0, 0, 0, 0, 0 ];

                if ( ( var_33 & 1 ) == 0 )
                    var_27 = 1;
                else
                    var_27 = 2;

                if ( ( var_33 & 2 ) == 0 )
                    var_29 = 3;
                else
                    var_29 = 4;

                var_28 = _id_74FB( var_14[0], var_14[var_27] );
                var_30 = _id_74FB( var_14[0], var_14[var_29] );
                var_37[0][0] = var_28[0];
                var_37[0][1] = var_28[1];
                var_37[1][0] = var_30[0];
                var_37[1][1] = var_30[1];
                var_38 = var_37[0][0] * var_37[1][1] - var_37[0][1] * var_37[1][0];
                var_32 = 0;

                if ( var_38 != 0 )
                {
                    var_39[0][0] = 1 / var_38 * var_37[1][1];
                    var_39[0][1] = -1 / var_38 * var_37[0][1];
                    var_39[1][0] = -1 / var_38 * var_37[1][0];
                    var_39[1][1] = 1 / var_38 * var_37[0][0];
                    var_31[var_27] = var_39[0][0] * var_24[0] + var_39[1][0] * var_24[1];

                    if ( var_31[var_27] < 0 || 1 < var_31[var_27] )
                        var_32 = 1;

                    var_31[var_29] = var_39[0][1] * var_24[0] + var_39[1][1] * var_24[1];

                    if ( var_31[var_29] < 0 || 1 < var_31[var_29] )
                        var_32 = 1;

                    var_40 = var_31[var_27] * var_28 + var_31[var_29] * var_30;
                    var_8 = var_40 - var_24;

                    if ( var_32 )
                    {
                        if ( var_31[var_27] >= 0 && var_31[var_29] >= 0 )
                        {
                            var_41 = var_31[0] + var_31[1] + var_31[2] + var_31[3] + var_31[4];

                            if ( var_41 < var_36 )
                            {
                                var_34 = var_31;
                                var_35 = var_33;
                                var_36 = var_41;
                            }
                        }
                    }

                    continue;
                }

                var_32 = 1;
            }

            if ( var_32 )
            {
                var_31 = var_34;

                if ( ( var_35 & 1 ) == 0 )
                    var_27 = 1;
                else
                    var_27 = 2;

                if ( ( var_35 & 2 ) == 0 )
                    var_29 = 3;
                else
                    var_29 = 4;
            }

            if ( var_31[var_27] < 0 )
                var_31[var_27] = 0;

            if ( var_31[var_29] < 0 )
                var_31[var_29] = 0;
        }
        else
            var_31[var_10] = 1;

        var_42 = var_31[var_29] + var_31[var_27];

        if ( var_42 < 1 )
            var_31[0] = 1 - var_42;

        var_43 = self getanimtime( var_6 );

        for ( var_17 = 0; var_17 < 5; var_17++ )
        {
            self setanim( var_5[var_17], var_31[var_17], var_12, 1.0 );
            self setanimtime( var_5[var_17], var_43 );
        }

        var_12 -= 0.05;

        if ( var_12 < 0.05 )
            var_12 = 0.05;

        wait 0.05;
    }
}

_id_7503( var_0 )
{
    var_1 = level._id_74F7[var_0] maps\_utility::_id_1281( "finale_draw_fail_blend" );
    var_2 = level._id_74F7[var_0] maps\_utility::_id_1281( "finale_draw_fail" );
    var_3 = getnotetracktimes( var_2, "aimblend" );
    var_4 = var_3[0] * getanimlength( var_2 );
    var_5 = 2.1;
    var_6 = 1.8;
    var_4 -= var_6;

    for ( var_7 = 0; var_7 < 5; var_7++ )
        level._id_74F6[var_0][var_7] setanimrestart( var_1[var_7], 1.0, 0.0, 1.0 );

    level._id_74F7[var_0] setanimrestart( var_1[0], 1.0, 0.2, 1.0 );

    while ( var_4 > 0 )
    {
        for ( var_7 = 0; var_7 < 5; var_7++ )
            level._id_74F6[var_0][var_7] setanim( var_1[var_7], 1.0, 0.0, 1.0 );

        level._id_74F7[var_0] setanim( var_1[0], 1.0, 0.2, 1.0 );
        wait 0.05;
        var_4 -= 0.05;
    }

    level._id_74F8[var_0] stopanimscripted();
    var_8 = "j_wrist_ri";
    level._id_74F8[var_0] linkto( self, var_8 );

    for ( var_7 = 0; var_7 < 5; var_7++ )
    {
        var_9 = "viewmodel_desert_eagle_sp_dubai_finale";
        level._id_74F6[var_0][var_7] attach( var_9, var_8 );
        level._id_74F6[var_0][var_7] hidepart( "TAG_SILENCER", var_9 );
        level._id_74F6[var_0][var_7] hidepart( "TAG_KNIFE", var_9 );
    }

    if ( var_0 == 0 )
        thread _id_7504();

    wait(var_5);
    thread _id_7501( level._id_74F7[var_0], level._id_74F8[var_0], level._id_74F6[var_0] );
}

_id_7504()
{
    var_0 = "j_wrist_ri";
    level._id_74F8[0] hide();
    var_1 = "viewmodel_desert_eagle_sp_dubai_finale";
    level._id_74F7[0] attach( var_1, var_0 );
    level._id_74F7[0] hidepart( "TAG_SILENCER", var_1 );
    level._id_74F7[0] hidepart( "TAG_KNIFE", var_1 );
}

_id_7505()
{
    self waittillmatch( "single anim", "stopcrawl" );
    level notify( "player_dies" );
}

_id_7506( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);
    else
        self waittillmatch( "single anim", "mfire" );
}

_id_7507()
{
    level notify( "release_camera" );
    var_0 = level._id_51F2 maps\_utility::_id_1281( "beatdown_additive" );
    level._id_51F2 setanim( var_0, 0.0, 0.2, 1.0 );
}

_id_7508()
{
    level endon( "release_camera" );
    var_0 = level._id_51F2 maps\_utility::_id_1281( "beatdown_additive" );

    for (;;)
    {
        level._id_51F2 setanim( var_0, 1.0, 0.5, 1.0 );
        wait 0.05;
    }
}

_id_7509( var_0 )
{
    wait 3;
    thread _id_7508();
    thread _id_7548();
    _id_7510( 2 );
    var_0 thread _id_7527();
}

_id_750A()
{
    var_0 = getentarray( "finale_chopper_crash_parts", "targetname" );
    common_scripts\utility::array_call( var_0, ::hide );
    var_1 = getentarray( "finale_spotlight_off", "targetname" );
    common_scripts\utility::array_call( var_1, ::hide );
    common_scripts\utility::flag_wait( "finale_chopper_crash_complete" );
    common_scripts\utility::array_call( var_0, ::show );
    var_2 = getentarray( "finale_spotlight_on", "targetname" );
    common_scripts\utility::array_call( var_2, ::hide );
    common_scripts\utility::array_call( var_1, ::show );
    getent( "finale_chopper_rotor", "script_noteworthy" ) thread _id_750B();
    var_3 = getentarray( "finale_roof_vase", "script_noteworthy" );
    common_scripts\utility::array_call( var_3, ::delete );
}

_id_750B()
{
    thread maps\dubai_fx::_id_7426();

    for (;;)
    {
        self addpitch( 2 );
        wait 0.05;
    }
}

_id_750C()
{
    var_0 = getent( "finale_scripted_node", "targetname" );
    var_1 = "finale_reflection_test";
    var_2 = maps\_utility::_id_1287( "price" );
    var_2 attach( level._id_73B6["price"] );
    var_3[0] = var_2;
    var_2 hide();
    var_0 maps\_anim::_id_11BF( var_3, var_1 );
    var_2 show();

    for (;;)
    {
        var_0 maps\_anim::_id_11BF( var_3, var_1 );
        var_0 maps\_anim::_id_11DD( var_3, var_1 );
    }
}

_id_750D()
{
    var_0 = getent( "finale_scripted_node", "targetname" );
    var_1 = getent( "reflection_background", "targetname" );
    var_1.origin += ( 0.0, 0.0, 120.0 );
    var_1 show();
    var_2 = getentarray( "reflection_sky_light", "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 hide();

    var_6 = "finale_reflection";
    var_7 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    var_7 thread _id_7553();
    level.player playerlinktoblend( var_7, "tag_player", 0.0 );
    var_8 = maps\_utility::_id_1287( "price" );
    var_8 attach( level._id_73B6["price"] );
    level.player disableweapons();
    var_9[0] = var_7;
    var_9[1] = var_8;
    var_8 hide();
    var_0 maps\_anim::_id_11BF( var_9, var_6 );
    maps\_shg_common::_id_1685( "countdown", 300, 300, ( 1.0, 1.0, 1.0 ), "", 5 );
    visionsetnaked( "dubai_roof_nobloom", 0.0 );

    for (;;)
    {
        maps\_shg_common::_id_1688( "countdown", "3" );

        for ( var_10 = 1; var_10 > 0; var_10 -= 0.05 )
        {
            level.player playerlinktoblend( var_7, "tag_player", 0.0 );
            wait 0.05;
        }

        maps\_shg_common::_id_1688( "countdown", "2" );
        wait 1;
        maps\_shg_common::_id_1688( "countdown", "1" );
        wait 1;
        maps\_shg_common::_id_1688( "countdown", "" );
        var_8 show();
        var_0 maps\_anim::_id_11BF( var_9, var_6 );
        var_0 maps\_anim::_id_11DD( var_9, var_6 );
        var_8 hide();
        var_0 maps\_anim::_id_11BF( var_9, var_6 );
        maps\_shg_common::_id_1688( "countdown", "FINISHED" );
        wait 1;
    }
}

_id_750E( var_0 )
{
    level.player shellshock( var_0, 31720 );
}

_id_004E()
{
    var_0 = _id_74D8();
    var_0.alpha = 1.0;
    var_0.color = ( 1.0, 1.0, 1.0 );
    level.player visionsetnakedforplayer( "dubai_hurt", 1 );
    wait 0.05;
    level.player shellshock( "dubai_ending_wounded", 6 );
    var_0 fadeovertime( 1 );
    var_0.alpha = 0.0;
}

_id_004F( var_0 )
{
    _id_004E();
    level notify( "player_dies" );
    setdvar( "ui_deadquote", var_0 );
    maps\_utility::_id_1826();
    wait 100;
}

_id_750F()
{
    thread _id_7549( 0.1 );
    _id_004F( &"DUBAI_MAKAROV_KILLED_YOU" );
}

_id_7510( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 3;

    if ( !isdefined( var_1 ) )
        var_1 = "beatdown_start_success";

    var_2 = 0;

    while ( !common_scripts\utility::flag( "beatdown_failure" ) )
    {
        while ( !level.player usebuttonpressed() )
            wait 0.05;

        var_2++;

        if ( var_2 >= var_0 )
        {
            common_scripts\utility::flag_set( var_1 );
            return;
        }

        while ( level.player usebuttonpressed() )
            wait 0.05;
    }
}

_id_7511()
{
    level notify( "fail_started" );
    level.player shellshock( "dubai_ending_crash_site", 30 );
    setsaveddvar( "hud_missionFailed", 1 );
    var_0[0] = level._id_51F2;
    var_0[1] = level._id_59A6;
    var_0[2] = level._id_73CD;
    level._id_59A6 maps\_utility::_id_24F5();
    var_1 = getent( "finale_scripted_node", "targetname" );
    level.player thread _id_6FFD( 5, 0, 2.5, 0.7 );
    maps\_audio::aud_send_msg( "finale_mak_shoots_failstate" );
    var_2 = _id_74D8();
    var_2.color = ( 0.5, 0.0, 0.0 );
    var_2.alpha = 0.5;
    wait 0.05;
    var_2 fadeovertime( 1.5 );
    var_2.alpha = 0;
    thread maps\dubai_fx::_id_004C();
    var_1 thread _id_754E( var_0, "beatdown_fail_2", 0.0, undefined, level._id_51F2._id_7512 );
    var_0[1] waittillmatch( "single anim", "fire" );
    _id_004F( &"DUBAI_MAKAROV_KILLED_YOU" );
}

_id_7513( var_0, var_1 )
{
    foreach ( var_3 in level._id_7514 )
    {
        var_4 = var_3 maps\_utility::_id_1281( var_0 );
        var_3 setflaggedanim( "single anim", var_4, 1.0, 0.2, var_1 );
    }
}

_id_7515()
{
    level endon( "stop_buttonmashmonitor" );
    level._id_7516 = [];
    level._id_7517 = 0;
    var_0 = [ 1, 2, 4 ];
    var_1 = 20;
    var_2 = 20;
    var_3 = 16;
    var_4 = 10;
    var_5 = 2;
    maps\_shg_common::_id_1685( "left ", var_1, var_2, undefined, undefined, var_5 );
    maps\_shg_common::_id_1685( "right", var_1, var_2 + var_3, undefined, undefined, var_5 );
    maps\_shg_common::_id_1685( "mash ", var_1, var_2 + 2 * var_3, undefined, undefined, var_5 );

    for (;;)
    {
        var_6 = level._id_7517;
        var_7 = level._id_7517 - 1;

        if ( var_7 < 0 )
            var_7 += 20;

        if ( level._id_7516.size < 20 )
        {
            var_6 = 0;
            var_7 = level._id_7516.size;
        }

        var_8 = [ "", "", "" ];

        for ( var_9 = var_6; var_9 != var_7; var_9++ )
        {
            if ( var_9 >= 20 )
                var_9 -= 20;

            var_10 = level._id_7516[var_9];

            for ( var_11 = 0; var_11 < 3; var_11++ )
            {
                var_12 = "_";

                if ( var_10 & var_0[var_11] )
                    var_12 = "|";

                var_8[var_11] += var_12;
            }
        }

        if ( isdefined( var_8[0] ) )
        {
            maps\_shg_common::_id_1688( "left ", var_8[0] );
            maps\_shg_common::_id_1688( "right", var_8[1] );
            maps\_shg_common::_id_1688( "mash ", var_8[2] );
        }

        wait 0.05;
    }
}

_id_7518()
{
    level notify( "stop_buttonmashmonitor" );
    level endon( "stop_buttonmashmonitor" );
    var_0 = 1;
    level._id_7519 = 0;
    level._id_751A = 0;
    level._id_751B = var_0;
    level._id_4553.intensity = 1.0;

    switch ( var_0 )
    {
        case 0:
            var_1 = self usebuttonpressed();
            level._id_751A = 3;

            for (;;)
            {
                var_2 = self usebuttonpressed();
                level._id_7519 = 0;

                if ( !var_1 && var_2 )
                {
                    level._id_7519 = 1;
                    level._id_4553.intensity = 0.0;
                }

                level._id_4553.intensity += 0.05;

                if ( level._id_4553.intensity > 1.0 )
                    level._id_4553.intensity = 1.0;

                var_1 = var_2;
                level waittill( "sample_button_mash" );
            }

            break;
        case 1:
            var_3 = self adsbuttonpressed();
            var_4 = self attackbuttonpressed();
            var_5 = !var_4 && !var_3;

            for (;;)
            {
                var_6 = self adsbuttonpressed();
                var_7 = self attackbuttonpressed();
                var_2 = var_7 && var_6;
                level._id_7519 = 0;

                if ( !var_3 && var_6 )
                {
                    level._id_751A |= 1;
                    level._id_7519 = 1;
                }

                if ( !var_4 && var_7 )
                {
                    level._id_751A |= 2;
                    level._id_7519 = 1;
                }

                var_3 = var_6;
                var_4 = var_7;

                if ( level._id_7519 )
                    level._id_4553.intensity = 0.5;

                level._id_4553.intensity += 0.05;

                if ( level._id_4553.intensity > 1.0 )
                    level._id_4553.intensity = 1.0;

                level waittill( "sample_button_mash" );
            }

            break;
        case 2:
            level._id_751A = 3;

            for (;;)
            {
                var_6 = self adsbuttonpressed();
                var_7 = self attackbuttonpressed();
                var_2 = var_7 && var_6;
                level._id_7519 = var_2;

                if ( level._id_7519 )
                    level._id_4553.intensity = 0.5;

                level._id_4553.intensity += 0.05;

                if ( level._id_4553.intensity > 1.0 )
                    level._id_4553.intensity = 1.0;

                level waittill( "sample_button_mash" );
            }

            break;
    }
}

_id_751C( var_0 )
{
    var_1 = "fail";
    var_2 = "hint";
    var_3 = 0.1;
    var_4 = 0.1;
    var_5 = 0.1;
    var_6 = 0.0;
    var_7 = 0.0;
    var_8 = 1.2;
    var_9 = 0.5;
    var_10 = 1.5;
    var_11 = 0.9;
    var_12 = 1.2;
    var_13 = 0.5;
    var_14 = [];
    var_15 = [];
    var_16 = [];
    var_17 = [];
    var_18 = [];
    var_19 = [];
    var_20 = [];
    var_21 = 0;
    var_22 = [];
    level._id_751D = 0;

    for ( var_23 = 0; var_23 < var_0.size; var_23++ )
    {
        var_22[var_23] = var_21;
        var_14[var_23] = maps\_utility::_id_1281( var_0[var_23] );
        var_24 = getanimlength( var_14[var_23] );
        var_25 = getnotetracktimes( var_14[var_23], var_1 );

        foreach ( var_27 in var_25 )
        {
            var_28 = var_21 + var_27 * var_24;

            if ( var_15.size > 0 && var_15[var_15.size - 1] == var_28 )
                continue;

            var_15[var_15.size] = var_28;
            var_18[var_18.size] = 0;
        }

        var_25 = getnotetracktimes( var_14[var_23], var_2 );

        foreach ( var_27 in var_25 )
        {
            var_28 = var_21 + var_27 * var_24;

            if ( var_16.size > 0 && var_16[var_16.size - 1] == var_28 )
                continue;

            var_16[var_16.size] = var_28;
            var_17[var_17.size] = var_28 - var_4;
        }

        var_25 = getnotetracktimes( var_14[var_23], "mash_start" );

        foreach ( var_27 in var_25 )
        {
            var_28 = var_21 + var_27 * var_24;

            if ( var_19.size > 0 && var_19[var_19.size - 1] == var_28 )
                continue;

            var_19[var_19.size] = var_28;
        }

        var_25 = getnotetracktimes( var_14[var_23], "mash_end" );

        foreach ( var_27 in var_25 )
        {
            var_28 = var_21 + var_27 * var_24;

            if ( var_20.size > 0 && var_20[var_20.size - 1] == var_28 )
                continue;

            var_20[var_20.size] = var_28;
        }

        var_21 += var_24;
    }

    if ( var_16.size == 0 )
    {
        foreach ( var_23, var_27 in var_15 )
        {
            var_16[var_23] = var_27 - var_3;
            var_17[var_23] = var_16[var_23] - var_4;
        }
    }

    var_21 = 0;
    var_37 = level._id_751D;
    var_38 = level.player usebuttonpressed();
    var_39 = self getanimtime( var_14[var_37] );
    var_40 = 0;
    var_41 = 0;
    var_42 = 0;
    var_43 = 0;

    while ( isdefined( var_15 ) && var_15.size && level._id_751D < var_0.size && isdefined( var_18[var_40] ) )
    {
        var_37 = level._id_751D;
        var_24 = getanimlength( var_14[var_37] );
        var_28 = self getanimtime( var_14[var_37] );
        var_28 *= var_24;
        var_28 += var_22[var_37];
        var_44 = level.player usebuttonpressed();
        var_45 = 0;

        if ( !var_38 && var_44 )
            var_45 = 1;

        var_38 = var_44;
        var_46 = var_17[var_40];

        if ( var_46 >= -1 && var_28 > var_46 )
        {
            if ( var_45 )
            {
                var_18[var_40] = 1;
                var_17[var_40] = -1;
            }
        }

        var_47 = var_16[var_40];

        if ( var_39 < var_47 && var_47 <= var_28 )
        {
            if ( !var_18[var_40] )
            {
                if ( var_5 < 1 )
                    thread _id_7513( var_0[var_37], var_5 );

                thread _id_7547();

                if ( var_42 )
                {
                    var_42 = 0;
                    var_41++;
                }
            }
        }

        if ( isdefined( level._id_751E ) && var_18[var_40] )
        {
            if ( var_5 < 1 )
                thread _id_7513( var_0[var_37], 1.0 );

            level._id_751E = undefined;
        }

        var_27 = var_15[var_40];

        if ( var_39 < var_27 && var_27 <= var_28 )
        {
            level._id_751E = undefined;

            if ( var_5 < 1 )
                thread _id_7513( var_0[var_37], 1.0 );

            if ( !var_18[var_40] )
                _id_7511();

            var_40++;
        }

        if ( var_41 < var_19.size )
        {
            var_27 = var_19[var_41];

            if ( var_39 < var_27 && var_27 <= var_28 )
            {
                var_42 = 1;
                level.player thread _id_7518();
                var_48 = var_8;
                var_49 = 3;

                if ( level._id_751B == 0 )
                    thread _id_7548( var_49 );
                else if ( level._id_751B == 1 )
                {
                    thread _id_7542( 1.25, var_49, 0.0 );
                    var_48 = var_10;
                }
                else
                {
                    thread _id_7542( 1.75, var_49, 0.75 );
                    var_48 = var_12;
                }

                var_43 = gettime() + 1000 * var_48;
            }

            var_27 = var_20[var_41];

            if ( var_39 < var_27 && var_27 <= var_28 )
            {
                level notify( "stop_buttonmashmonitor" );
                level._id_4553.intensity = 0.0;

                if ( level._id_751A != 3 )
                {
                    if ( level._id_751B < 1 )
                        thread _id_7549( 0.1 );
                    else
                        thread _id_7543( 0.1 );

                    _id_7511();
                }

                var_42 = 0;

                if ( level._id_751B < 1 )
                    thread _id_7549( 0.2 );
                else
                    thread _id_7543( 0.2 );

                var_41++;
            }
        }

        if ( var_42 )
        {
            var_50 = gettime();
            var_51 = var_9;

            if ( level._id_751B == 1 )
                var_51 = var_11;
            else if ( level._id_751B == 2 )
                var_51 = var_13;

            if ( level._id_7519 )
                var_43 = gettime() + 1000 * var_51;

            if ( var_50 > var_43 )
            {
                if ( level._id_751B < 1 )
                    thread _id_7549( 0.1 );
                else
                    thread _id_7543( 0.1 );

                _id_7511();
            }
        }

        var_39 = var_28;
        level notify( "sample_button_mash" );
        wait 0.05;
    }
}

_id_751F()
{
    return 0;
}

_id_7520( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_origin", self.origin );
    var_4.angles = self.angles;

    if ( isdefined( var_3 ) )
        var_4 thread _id_754F( var_0, var_1, var_2, var_3 );
    else
        var_4 thread maps\_anim::_id_124E( var_0, var_1, var_2 );

    var_0 waittill( var_2 );
    var_4 notify( var_2 );
    var_4 delete();
}

_id_7521()
{
    level endon( "fail_started" );
    thread maps\dubai_fx::_id_7413();
    maps\_utility::add_hint_string( "hint_flash_use", &"DUBAI_FLASH_USE", ::_id_751F );
    maps\_utility::add_hint_string( "hint_flash_choke", &"DUBAI_FLASH_CHOKE", ::_id_751F );
    level._id_7522 = &"DUBAI_FLASH_CHOKE";
    maps\_utility::add_hint_string( "hint_hold_choke", &"DUBAI_HOLD_CHOKE", ::_id_751F );
    level._id_7523 = &"DUBAI_HOLD_CHOKE";

    if ( !level.console )
    {
        maps\_utility::add_hint_string( "hint_flash_choke_pc", &"DUBAI_FLASH_CHOKE_PC", ::_id_751F );
        level._id_7524 = &"DUBAI_FLASH_CHOKE_PC";
        maps\_utility::add_hint_string( "hint_hold_choke_pc", &"DUBAI_HOLD_CHOKE_PC", ::_id_751F );
        level._id_7525 = &"DUBAI_HOLD_CHOKE_PC";
    }

    var_0 = getentarray( "finale_rail_glass_shattered", "script_noteworthy" );
    common_scripts\utility::array_call( var_0, ::hide );
    var_1 = getent( "finale_rail_broken", "script_noteworthy" );
    var_1 hide();
    common_scripts\utility::flag_wait( "end_finale_showdown" );
    level.player fadeoutshellshock();
    common_scripts\utility::exploder( "price_finale_blood" );
    thread _id_74C0();

    if ( !isdefined( level._id_74C4 ) )
        thread _id_74E3();

    if ( !isdefined( level._id_51F2 ) )
    {
        var_2 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
        var_2 thread _id_7553();
        level._id_51F2 = var_2;
        level.player playerlinktoblend( var_2, "tag_player", 0.0 );
    }

    if ( !isdefined( level._id_59A6 ) )
    {
        var_3 = getent( "finale_crash_site_makarov", "script_noteworthy" );
        var_3 maps\_utility::add_spawn_function( ::_id_753B );
        level._id_59A6 = var_3 maps\_utility::_id_166F( 1 );
        level._id_59A6._id_1032 = "makarov";
    }

    if ( !isdefined( level._id_73CD ) )
    {
        level._id_73CD = maps\_utility::_id_1287( "deagle" );
        level._id_73CD hidepart( "TAG_SILENCER" );
        level._id_73CD hidepart( "TAG_KNIFE" );
    }

    if ( !isdefined( level._id_7526 ) )
        level._id_7526 = maps\_utility::_id_1287( "fx_char_light_rig" );

    var_4 = maps\_utility::_id_1287( "ropea" );
    var_5 = maps\_utility::_id_1287( "ropeb" );
    var_6 = getent( "finale_scripted_node", "targetname" );
    var_7[0] = level._id_59A6;
    var_7[1] = level._id_73CD;
    var_7[2] = level._id_7526;
    level._id_7526 thread maps\dubai_fx::_id_7427();
    var_6 thread _id_7520( var_4, "beatdown_idle_1", "stop_loop", 0.0 );
    var_6 thread _id_7538( var_7 );
    var_8[0] = level._id_51F2;
    var_8[1] = level._id_59A6;
    var_8[2] = level._id_73CD;
    var_8[3] = level._id_7526;
    common_scripts\utility::flag_wait( "beatdown_tackle_start" );
    thread _id_7530();
    maps\_audio::aud_send_msg( "finale_se", "start_beatdown" );
    level notify( "fx_beatdown_msg" );
    common_scripts\utility::flag_set( "stop_makarov_blobshadow" );
    level._id_7514 = var_8;
    level._id_51F2 thread _id_751C( [ "beatdown_tackle", "beatdown_choke", "beatdown_slam" ] );
    level._id_51F2._id_7512 = "beatdown_tackle";
    var_6 _id_754E( var_8, "beatdown_tackle" );
    var_8[2] = undefined;
    var_8[4] = var_4;
    var_8[5] = var_5;
    level._id_7514 = var_8;
    level._id_751D++;
    var_4 notify( "stop_loop" );
    level notify( "fx_beatdown_msg_startchoke" );
    level._id_51F2._id_7512 = "beatdown_choke";
    var_6 maps\_anim::_id_11DD( var_8, "beatdown_choke" );
    var_9 = maps\_utility::_id_1287( "player_body" );
    thread maps\dubai_fx::_id_7414();
    var_10 = maps\_utility::_id_1287( "cigar" );
    var_11 = maps\_utility::_id_1287( "zippo" );
    var_8[6] = var_9;
    var_8[7] = var_10;
    var_8[8] = var_11;
    var_8[9] = getent( "dub_finale_railing_glass", "targetname" );

    if ( isdefined( var_8[9] ) )
    {
        var_8[9] show();
        var_8[9]._id_1032 = "floor_glass";
        var_8[9] maps\_anim::_id_1244();
    }

    level._id_7514 = var_8;
    level._id_751D++;
    thread _id_7532();
    var_6 thread _id_7531();
    level notify( "fx_beatdown_msg_startslam" );
    level._id_51F2._id_7512 = "beatdown_slam";
    var_6 maps\_anim::_id_11DD( var_8, "beatdown_slam" );
    var_8[0] = undefined;
    var_8[3] = undefined;
    var_8[6] = undefined;
    var_8[7] = undefined;
    var_8[8] = undefined;
    var_8[9] = undefined;
    var_12[0] = level._id_51F2;
    var_12[1] = var_9;
    var_12[2] = var_10;
    level._id_751D++;
    maps\_audio::aud_send_msg( "finale_se", "end_beatdown" );
    _id_752A( var_8, var_12 );
}

_id_0205()
{
    self waittillmatch( "single anim", "start_credits" );
    common_scripts\utility::flag_set( "level_end" );
}

_id_7527()
{
    level._id_7528 = 1;

    if ( isdefined( level._id_51F2._id_74F1 ) && level._id_51F2._id_74F1 )
    {
        maps\_utility::_id_0A17();
        level._id_51F2._id_74F1 = 0;
    }

    var_0 = self;
    var_1 = level._id_51F2 maps\_utility::_id_1281( "beatdown_tackle_start" );
    level._id_51F2._id_7512 = "beatdown_tackle_start";
    var_0 thread maps\_anim::_id_1246( level._id_51F2, "beatdown_tackle_start" );

    if ( !common_scripts\utility::flag( "beatdown_start_success" ) )
        level._id_51F2 setflaggedanimknob( "single anim", var_1, 1.0, 0.5, 0 );
    else
        level._id_51F2 setflaggedanimknob( "single anim", var_1, 1.0, 0.5, 1.0 );

    if ( isdefined( level._id_7529 ) )
        common_scripts\utility::flag_set( "beatdown_start_success" );

    common_scripts\utility::flag_wait_either( "beatdown_start_success", "beatdown_failure" );

    if ( common_scripts\utility::flag( "beatdown_failure" ) )
    {
        var_0 maps\_anim::_id_1246( level._id_51F2, "beatdown_idle_1_look" );
        wait 100;
    }

    common_scripts\utility::flag_clear( "beatdown_start_success" );
    thread _id_7510( 2 );
    thread _id_7507();
    level._id_51F2 setflaggedanim( "single anim", var_1, 1.0, 0.2, 1 );
    level._id_51F2 waittillmatch( "single anim", "idle2" );

    if ( common_scripts\utility::flag( "beatdown_failure" ) || !common_scripts\utility::flag( "beatdown_start_success" ) )
    {
        thread _id_7508();
        level._id_51F2 setflaggedanim( "single anim", var_1, 1.0, 0.2, 0 );
    }

    if ( common_scripts\utility::flag( "beatdown_failure" ) )
        wait 100;

    common_scripts\utility::flag_wait_either( "beatdown_start_success", "beatdown_failure" );

    if ( common_scripts\utility::flag( "beatdown_failure" ) )
        wait 100;

    level._id_751E = undefined;
    level notify( "start_tackle" );
    thread _id_7507();
    level._id_51F2 setflaggedanim( "single anim", var_1, 1.0, 0.2, 1 );
    level._id_51F2 waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_set( "beatdown_tackle_start" );
}

_id_752A( var_0, var_1, var_2 )
{
    var_3 = !isdefined( var_0 ) && !isdefined( var_2 );
    maps\_audio::aud_send_msg( "finale_se", "start_smoking" );

    if ( !isdefined( level._id_51F2 ) )
    {
        var_4 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
        var_4 thread _id_7553();
        level._id_51F2 = var_4;
        level.player playerlinktoblend( var_4, "tag_player", 0.0 );
    }

    if ( !isdefined( level._id_59A6 ) )
    {
        var_5 = getent( "finale_crash_site_makarov", "script_noteworthy" );
        var_5 maps\_utility::add_spawn_function( ::_id_753B );
        level._id_59A6 = var_5 maps\_utility::_id_166F( 1 );
        level._id_59A6._id_1032 = "makarov";
    }

    var_6 = getent( "finale_scripted_node", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        var_7 = maps\_utility::_id_1287( "ropea" );
        var_8 = maps\_utility::_id_1287( "ropeb" );
        var_0[1] = level._id_59A6;
        var_0[2] = var_7;
        var_0[3] = var_8;
    }

    if ( !isdefined( var_1 ) )
    {
        var_9 = maps\_utility::_id_1287( "player_body" );
        var_10 = maps\_utility::_id_1287( "cigar" );
        var_1[0] = level._id_51F2;
        var_1[1] = var_9;
        var_1[2] = var_10;
    }

    var_6 thread _id_753A( var_0 );

    if ( var_3 )
    {
        var_11 = _id_74D7();
        var_11.alpha = 1.0;
    }
    else
    {
        level._id_51F2 thread _id_0205();

        if ( !isdefined( level._id_752B ) )
        {
            thread _id_752D( level._id_51F2 );
            var_6 maps\_anim::_id_11DD( var_1, "beatdown_smoking_idle" );
        }
        else
            var_6 thread maps\_anim::_id_11DD( var_1, "beatdown_smoking_idle" );
    }

    if ( !isdefined( level._id_752B ) )
        common_scripts\utility::flag_set( "level_end" );
    else
    {
        var_11 = _id_74D7();
        var_11.alpha = 1.0;
        wait 1;
    }

    common_scripts\utility::flag_wait( "end_of_credits" );
    common_scripts\utility::flag_set( "fadeout_at_end_done" );
}

_id_752C()
{
    level notify( "stop_update_dof" );
    level endon( "stop_update_dof" );

    while ( level._id_1B22 )
    {
        level.player setdepthoffield( self._id_1436["nearStart"], self._id_1436["nearEnd"], self._id_1436["farStart"], self._id_1436["farEnd"], self._id_1436["nearBlur"], self._id_1436["farBlur"] );
        wait 0.05;
    }
}

_id_752D( var_0 )
{
    var_1 = [];
    var_2 = var_0 maps\_utility::_id_1281( "beatdown_smoking_idle" );
    var_3 = getnotetracktimes( var_2, "start_fade" );
    var_4 = getnotetracktimes( var_2, "end_fade" );
    var_5 = getanimlength( var_2 );

    foreach ( var_8, var_7 in var_3 )
        var_1[var_8] = var_5 * ( var_4[var_8] - var_7 );

    var_9 = var_5 * var_3[0] - 5;
    wait(var_9);
    level notify( "stop_woozy" );
    wait 4;
    var_10 = _id_74D7();
    var_0 waittillmatch( "single anim", "start_fade" );
    level notify( "stop_button_mash_monitor" );
    var_10 fadeovertime( var_1[0] );
    var_10.alpha = 1.0;
    wait(var_1[0]);
}

_id_752E( var_0 )
{
    var_1 = [];
    var_1["nearStart"] = 5;
    var_1["nearEnd"] = 10.0;
    var_1["nearBlur"] = 4.0;
    var_1["farStart"] = 300;
    var_1["farEnd"] = 1200;
    var_1["farBlur"] = 3.8;
    var_2 = [];
    var_2["nearStart"] = 30;
    var_2["nearEnd"] = 400;
    var_2["nearBlur"] = 5.25;
    var_2["farStart"] = 1200;
    var_2["farEnd"] = 2500;
    var_2["farBlur"] = 1.0;
    var_3 = [];
    var_3["nearStart"] = 1;
    var_3["nearEnd"] = 10;
    var_3["nearBlur"] = 4.1;
    var_3["farStart"] = 300;
    var_3["farEnd"] = 1000;
    var_3["farBlur"] = 4.1;
    var_4 = [];
    var_5 = var_0 maps\_utility::_id_1281( "beatdown_end" );
    var_6 = getnotetracktimes( var_5, "start_fade" );
    var_7 = getnotetracktimes( var_5, "end_fade" );
    var_8 = getanimlength( var_5 );

    foreach ( var_11, var_10 in var_6 )
        var_4[var_11] = var_8 * ( var_7[var_11] - var_10 );

    var_12 = _id_74D7();
    level.player setblurforplayer( 10, 0 );
    var_0 waittillmatch( "single anim", "fade_up" );
    var_12 fadeovertime( 1.0 );
    var_12.alpha = 0.0;
    level.player common_scripts\utility::delaycall( 1, ::setblurforplayer, 0, 2.0 );
    level._id_1B22 = 1;
    level thread _id_752C();
    level._id_1436 = var_1;
    var_0 waittillmatch( "single anim", "focus_change" );
    var_10 = level._id_1436;
    maps\_utility::_id_27C0( var_10, var_2, 2.1 );
    var_0 waittillmatch( "single anim", "focus_change" );
    var_10 = level._id_1436;
    maps\_utility::_id_27C0( var_10, var_3, 2.5 );
    var_0 waittillmatch( "single anim", "start_fade" );
    var_13 = var_4[0] - 2;

    if ( var_13 < 0 )
        var_13 = 1;

    level.player setblurforplayer( 10.0, var_13 );
    wait 2;
    var_12 fadeovertime( 2 );
    var_12.alpha = 1.0;
    wait(var_4[0]);
    level._id_1B22 = 0;
}

_id_752F()
{
    wait 20;
    setblur( 10, 65 );
    wait 20;
    var_0 = _id_74D7();
    var_0 fadeovertime( 25 );
    var_0.alpha = 1.0;
    wait 45;
}

_id_7530()
{
    level._id_51F2 thread _id_74F0( "slomo" );
    level._id_51F2 thread _id_74F0( "slomo1" );
    level._id_51F2 thread _id_74F0( "slomo2" );
    level._id_51F2 thread _id_74F0( "slomo3" );
}

_id_7531()
{
    level._id_51F2 thread _id_74F0( "slomo", 0.25 );
    level._id_51F2 thread _id_74F0( "slomo1" );
    level._id_51F2 thread _id_74F0( "slomo2" );
    level._id_51F2 thread _id_74F0( "slomo3" );
    thread _id_7535();
    thread _id_7533();
    thread _id_7537();
    maps\_audio::aud_send_msg( "finale_se", "start_hanging" );
}

_id_7532()
{
    level._id_51F2 waittillmatch( "single anim", "end_buttonmash" );
    level notify( "stop_button_mash_monitor" );
    thread _id_7549( 0.5 );
}

_id_7533()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "dub_finale_skylight_shards" );
    var_0._id_1032 = "skylight";
    var_0 useanimtree( level._id_1245["skylight"] );
    var_1 = "skylight_shatter";
    var_0 hide();
    thread maps\_anim::_id_11CF( var_0, var_1 );
    thread _id_7534();
    level._id_51F2 waittillmatch( "single anim", "roof_break" );
    var_2 = getent( "skylight_shatter_frame", "script_noteworthy" );
    var_2 setmodel( "dub_roof_top_sky_light_broken" );
    var_3 = getent( "skylight_shatter_glass", "script_noteworthy" );
    var_3 delete();
    var_0 show();
    maps\_anim::_id_1246( var_0, var_1 );
}

_id_7534()
{
    level._id_51F2 waittillmatch( "single anim", "shatter_vfx" );
    common_scripts\utility::exploder( 21010 );
    thread maps\dubai_fx::_id_7420();
}

_id_7535()
{
    level._id_51F2 waittillmatch( "single anim", "balcony_break" );
    var_0 = 10;
    var_1 = 0.05;
    var_2 = 9;
    level.player maps\_utility::delaythread( 0, ::_id_6FFB, var_0, var_1, var_2, 1 );
    level.player maps\_utility::delaythread( 0, ::_id_6FFC, var_0, var_1, var_2, 1 );
    level.player maps\_utility::delaythread( 0, ::_id_6FFD, var_0, var_1, var_2, 1 );
    thread _id_7536();
    maps\_utility::delaythread( 1.3, common_scripts\utility::exploder, 21020 );
    wait 1.0;
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1.0, 5, 20, 20, 0, 1 );
    level.player enableslowaim();
}

_id_7536()
{
    var_0 = getglassarray( "finale_rail_glass" );

    foreach ( var_2 in var_0 )
        deleteglass( var_2 );

    var_4 = getentarray( "finale_rail_glass_shattered", "script_noteworthy" );
    common_scripts\utility::array_call( var_4, ::show );
    var_5 = getent( "finale_rail_intact", "script_noteworthy" );
    var_5 hide();
    var_6 = getent( "finale_rail_broken", "script_noteworthy" );
    var_6 show();
    wait 27;
    objective_state( 1, "done" );
}

_id_7537()
{
    level endon( "stop_woozy" );
    level._id_51F2 waittillmatch( "single anim", "balcony_break" );
    var_0 = 3;

    while ( !common_scripts\utility::flag( "level_end" ) )
    {
        setblur( 2, var_0 );
        wait(var_0);
        setblur( 0.0, var_0 );
        wait(var_0);
    }
}

_id_7538( var_0 )
{
    var_1 = self;
    level endon( "start_tackle" );
    thread _id_7539( var_0[0], var_0[1] );
    maps\_audio::aud_send_msg( "finale_showdown_fail" );
    var_1 thread _id_754E( var_0, "beatdown_idle_1" );
    var_0[0] waittillmatch( "single anim", "fail" );
    common_scripts\utility::flag_set( "beatdown_failure" );

    if ( !isdefined( level._id_7528 ) )
        var_1 thread maps\_anim::_id_1246( level._id_51F2, "beatdown_idle_1_look" );

    var_0[0] waittillmatch( "single anim", "fire" );
    _id_750F();
}

_id_7539( var_0, var_1 )
{
    var_0 waittillmatch( "single anim", "weapon_fire" );
}

_id_753A( var_0 )
{
    var_1 = self;
    var_1 thread _id_7550( var_0, "beatdown_hanging_idle", "stop_loop" );
    common_scripts\utility::flag_wait( "fadeout_at_end_done" );
}

_id_753B()
{
    self._id_1032 = "makarov";
    level._id_59A6 = self;
}

_id_713A()
{
    self.alignx = "center";
    self.aligny = "middle";
    self.horzalign = "center";
    self.vertalign = "middle";
    self.hidewhendead = 1;
    self.hidewheninmenu = 1;
    self.sort = 205;
    self.foreground = 1;
    self.alpha = 0;
}

_id_753C( var_0 )
{
    level endon( "fade_out_choke_hint" );

    for (;;)
    {
        var_1 = 1;
        var_2 = 0;

        if ( !level.console )
        {
            var_3 = getkeybinding( "+speed_throw" );

            if ( !isdefined( var_3 ) || var_3["count"] == 0 )
            {
                var_1 = 0;
                var_3 = getkeybinding( "+toggleads_throw" );

                if ( isdefined( var_3 ) && var_3["count"] > 0 )
                    var_2 = 1;
            }
        }

        if ( var_1 )
            var_0 settext( level._id_7522 );
        else
            var_0 settext( level._id_7524 );

        wait 0.05;
    }
}

_id_753D()
{
    var_0 = 90;
    var_1 = 35;
    var_2 = level.player maps\_hud_util::createserverclientfontstring( "default", 2 );
    var_2.x = var_1 * -1;
    var_2.y = var_0;
    var_2.horzalign = "right";
    var_2.alignx = "right";
    var_2 _id_713A();

    if ( level._id_751B < 2 )
    {
        var_2 settext( level._id_7522 );
        thread _id_753C( var_2 );
    }
    else
        var_2 settext( level._id_7523 );

    var_3 = [];
    var_3["text"] = var_2;
    level._id_753E = var_3;
}

_id_753F()
{
    level endon( "fade_out_choke_hint" );

    while ( isdefined( level._id_7540 ) && level._id_7540 )
        wait 0.05;

    foreach ( var_1 in level._id_753E )
        var_1.alpha = 0;

    level notify( "fade_out_choke_hint" );
}

_id_7541( var_0, var_1 )
{
    level notify( "fade_out_choke_hint" );
    level endon( "fade_out_choke_hint" );

    if ( !isdefined( level._id_753E ) )
        _id_753D();

    var_2 = 0.4;
    var_3 = 0.1;
    level._id_7540 = 1;
    thread _id_753F();

    foreach ( var_5 in level._id_753E )
        var_5.alpha = 0.95;

    var_7 = level._id_753E["text"];
    var_7 fadeovertime( 0.01 );
    var_7.alpha = 0.95;
    var_7 changefontscaleovertime( 0.01 );
    var_7.fontscale = var_1;
    wait 0.1;
    var_7 fadeovertime( var_2 );
    var_7.alpha = 0.0;
    var_7 changefontscaleovertime( var_2 );
    var_7.fontscale = var_0;
    wait(var_3);

    foreach ( var_5 in level._id_753E )
        var_5.alpha = 0;
}

_id_7542( var_0, var_1, var_2 )
{
    level notify( "fade_out_choke_hint" );
    level endon( "fade_out_choke_hint" );

    if ( !isdefined( level._id_753E ) )
        _id_753D();

    var_3 = 0.1;
    var_4 = 0.2;
    level._id_7540 = 1;

    foreach ( var_6 in level._id_753E )
    {
        var_6 fadeovertime( 0.1 );
        var_6.alpha = 0.95;
    }

    wait 0.1;
    var_8 = level._id_753E["text"];

    for (;;)
    {
        if ( isdefined( level._id_753E["icon"] ) )
            level._id_753E["icon"].alpha = 0.95;

        var_8 fadeovertime( 0.01 );
        var_8.alpha = 0.95;
        var_8 changefontscaleovertime( 0.01 );
        var_8.fontscale = var_1;
        wait 0.1;
        var_8 fadeovertime( var_3 );
        var_8.alpha = var_2;
        var_8 changefontscaleovertime( var_3 );
        var_8.fontscale = var_0;
        wait(var_4);

        if ( !isdefined( level._id_7540 ) )
        {
            foreach ( var_6 in level._id_753E )
                var_6.alpha = 0;

            return;
        }
    }
}

_id_7543( var_0 )
{
    level notify( "fade_out_choke_hint" );

    if ( !isdefined( var_0 ) )
        var_0 = 1.5;

    if ( !isdefined( level._id_753E ) )
        _id_753D();

    foreach ( var_2 in level._id_753E )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0;
    }

    level._id_7540 = undefined;
}

_id_7544()
{
    var_0 = 90;
    var_1 = 35;
    var_2 = level.player maps\_hud_util::createserverclientfontstring( "default", 2 );
    var_2.x = var_1 * -1;
    var_2.y = var_0;
    var_2.horzalign = "right";
    var_2.alignx = "right";
    var_2 _id_713A();
    var_2 settext( &"DUBAI_FLASH_USE" );
    var_3 = [];
    var_3["text"] = var_2;
    level._id_7545 = var_3;
}

_id_7546()
{
    level endon( "fade_out_use_hint" );
    var_0 = 0.2;

    while ( isdefined( level._id_751E ) && level._id_751E )
        wait 0.05;

    foreach ( var_2 in level._id_7545 )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0.0;
        var_2 changefontscaleovertime( var_0 );
        var_2.fontscale = 0.25;
    }

    level notify( "fade_out_use_hint" );
}

_id_7547()
{
    level notify( "fade_out_use_hint" );
    level endon( "fade_out_use_hint" );

    if ( !isdefined( level._id_7545 ) )
        _id_7544();

    var_0 = 1.5;
    var_1 = 0.4;
    var_2 = 0.1;
    level._id_751E = 1;
    thread _id_7546();

    foreach ( var_4 in level._id_7545 )
        var_4.alpha = 0.95;

    var_6 = level._id_7545["text"];
    var_6 fadeovertime( 0.01 );
    var_6.alpha = 0.95;
    var_6 changefontscaleovertime( 0.01 );
    var_6.fontscale = 2.0;
    wait(var_0);
    var_6 fadeovertime( var_1 );
    var_6.alpha = 0.0;
    var_6 changefontscaleovertime( var_1 );
    var_6.fontscale = 0.25;
    wait(var_2);

    foreach ( var_4 in level._id_7545 )
        var_4.alpha = 0;
}

_id_7548( var_0 )
{
    level notify( "fade_out_use_hint" );
    level endon( "fade_out_use_hint" );

    if ( !isdefined( var_0 ) )
        var_0 = 3;

    if ( !isdefined( level._id_7545 ) )
        _id_7544();

    var_1 = 0.1;
    var_2 = 0.2;
    level._id_751E = 1;

    foreach ( var_4 in level._id_7545 )
    {
        var_4 fadeovertime( 0.1 );
        var_4.alpha = 0.95;
    }

    wait 0.1;
    var_6 = level._id_7545["text"];

    for (;;)
    {
        if ( isdefined( level._id_7545["icon"] ) )
            level._id_7545["icon"].alpha = 0.95;

        var_6 fadeovertime( 0.01 );
        var_6.alpha = 0.95;
        var_6 changefontscaleovertime( 0.01 );
        var_6.fontscale = var_0;
        wait 0.1;
        var_6 fadeovertime( var_1 );
        var_6.alpha = 0.0;
        var_6 changefontscaleovertime( var_1 );
        var_6.fontscale = 0.25;
        wait(var_2);

        if ( !isdefined( level._id_751E ) )
        {
            foreach ( var_4 in level._id_7545 )
                var_4.alpha = 0;

            return;
        }
    }
}

_id_7549( var_0 )
{
    level notify( "fade_out_use_hint" );

    if ( !isdefined( var_0 ) )
        var_0 = 1.5;

    if ( !isdefined( level._id_7545 ) )
        _id_7544();

    foreach ( var_2 in level._id_7545 )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0;
    }

    level._id_751E = undefined;
}

_id_7131()
{
    return level.player usebuttonpressed();
}

_id_754A()
{
    var_0 = [];
    var_0[0] = level._id_1436;
    var_0[1] = [];
    var_0[1]["nearStart"] = 1;
    var_0[1]["nearEnd"] = 1;
    var_0[1]["nearBlur"] = 6;
    var_0[1]["farStart"] = 40;
    var_0[1]["farEnd"] = 60;
    var_0[1]["farBlur"] = 6;
    var_0[2] = [];
    var_0[2]["nearStart"] = 1;
    var_0[2]["nearEnd"] = 40;
    var_0[2]["nearBlur"] = 6;
    var_0[2]["farStart"] = 100;
    var_0[2]["farEnd"] = 220;
    var_0[2]["farBlur"] = 6;
    level.player._id_754B = 1;
    level.player._id_754C = 0.05;
    return var_0;
}

_id_754D( var_0, var_1, var_2 )
{
    var_3 = self;

    if ( isdefined( var_2 ) )
        var_3 endon( var_2 );

    var_3 thread maps\_anim::_id_124E( var_0, var_1, var_2 );
    var_4 = level._id_0C59[var_0._id_1032][var_1][0];
    var_0 setanim( var_4, 1.0, 0.2, 0.0 );
}

_id_4AFF( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.0;

    var_4 = level._id_0C59[var_0._id_1032][var_1];
    var_5 = getanimlength( var_4 );
    thread maps\_anim::_id_1246( var_0, var_1, var_3 );
    var_0 setflaggedanimknob( "single anim", var_4, 1.0, var_2, 1.0 );
    var_0 waittillmatch( "single anim", "end" );
}

_id_754E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.0;

    var_5 = 0.0;
    var_6 = undefined;

    foreach ( var_6 in var_0 )
    {
        var_8 = var_6 maps\_utility::_id_1281( var_1 );
        var_5 = getanimlength( var_8 );
        thread maps\_anim::_id_1246( var_6, var_1, var_3 );
        var_6 setflaggedanimknob( "single anim", var_8, 1.0, var_2, 1.0 );

        if ( var_2 > 0.2 && isdefined( var_4 ) )
        {
            var_8 = level._id_0C59[var_6._id_1032][var_4];

            if ( isdefined( var_8 ) )
                var_6 setflaggedanim( "single anim", var_8, 0.001, var_2, 1.0 );
        }
    }

    if ( var_2 > 0.2 && isdefined( var_4 ) && var_2 < var_5 )
    {
        wait(var_2);

        foreach ( var_6 in var_0 )
        {
            var_8 = level._id_0C59[var_6._id_1032][var_4];

            if ( isdefined( var_8 ) )
                var_6 clearanim( var_8, 0.0 );
        }

        var_5 -= var_2;
    }

    var_6 waittillmatch( "single anim", "end" );
}

_id_754F( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0.0;

    var_4 = level._id_0C59[var_0._id_1032][var_1][0];
    thread maps\_anim::_id_124E( var_0, var_1, var_2 );
    var_0 setflaggedanimknob( "looping anim", var_4, 1.0, var_3, 1.0 );
}

_id_7550( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0.0;

    thread maps\_anim::_id_11D6( var_0, var_1, var_2 );

    foreach ( var_5 in var_0 )
    {
        var_6 = level._id_0C59[var_5._id_1032][var_1][0];
        var_5 setflaggedanimknob( "looping anim", var_6, 1.0, var_3, 1.0 );
    }
}

_id_7551( var_0, var_1, var_2 )
{
    self notify( "end_" + var_0 + var_2 );
    self endon( "end_" + var_0 + var_2 );

    for (;;)
    {
        self waittillmatch( var_2, var_0 );
        level.player playrumbleonentity( var_1 );
    }
}

_id_7552( var_0 )
{
    self notify( "end_rumble_onoff" );
    self endon( "end_rumble_onoff" );

    for (;;)
    {
        self waittillmatch( var_0, "rumble_on" );

        if ( isdefined( level._id_4553 ) )
            level._id_4553.intensity = 1;

        self waittillmatch( var_0, "rumble_off" );

        if ( isdefined( level._id_4553 ) )
            level._id_4553.intensity = 0;
    }
}

_id_7553()
{
    var_0 = "single anim";
    thread _id_7551( "rumble_light", "damage_light", var_0 );
    thread _id_7551( "rumble_heavy", "damage_heavy", var_0 );
    thread _id_7551( "rumble_small", "viewmodel_small", var_0 );
    thread _id_7551( "rumble_medium", "viewmodel_medium", var_0 );
    thread _id_7551( "rumble_large", "viewmodel_large", var_0 );
    thread _id_7551( "rumble_falling_land", "falling_land", var_0 );
    thread _id_7552( var_0 );
    var_0 = "looping anim";
    thread _id_7551( "rumble_light", "damage_light", var_0 );
    thread _id_7551( "rumble_heavy", "damage_heavy", var_0 );
    thread _id_7551( "rumble_small", "viewmodel_small", var_0 );
    thread _id_7551( "rumble_medium", "viewmodel_medium", var_0 );
    thread _id_7551( "rumble_large", "viewmodel_large", var_0 );
    thread _id_7551( "rumble_falling_land", "falling_land", var_0 );
    thread _id_7552( var_0 );
}

_id_6FFC( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "fullscreen_bloodsplat_bottom", 640, 480 );
    var_4.splatter = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.sort = 1;
    var_4.foreground = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_5 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_6 = 0.05;

    if ( var_1 > 0 )
    {
        var_7 = 0;
        var_8 = var_3 / ( var_1 / var_6 );

        while ( var_7 < var_3 )
        {
            var_4.alpha = var_7;
            var_7 += var_8;
            wait(var_6);
        }
    }

    var_4.alpha = var_3;
    wait(var_0 - var_1 + var_2);

    if ( var_2 > 0 )
    {
        var_7 = var_3;
        var_9 = var_3 / ( var_2 / var_6 );

        while ( var_7 > 0 )
        {
            var_4.alpha = var_7;
            var_7 -= var_9;
            wait(var_6);
        }
    }

    var_4.alpha = 0;
    var_4 destroy();
}

_id_6FFB( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "fullscreen_bloodsplat_left", 640, 480 );
    var_4.splatter = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.sort = 1;
    var_4.foreground = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_5 = newclienthudelem( self );
    var_5.x = 0;
    var_5.y = 0;
    var_5 setshader( "fullscreen_bloodsplat_right", 640, 480 );
    var_5.splatter = 1;
    var_5.alignx = "left";
    var_5.aligny = "top";
    var_5.sort = 1;
    var_5.foreground = 0;
    var_5.horzalign = "fullscreen";
    var_5.vertalign = "fullscreen";
    var_5.alpha = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_6 = 0.05;

    if ( var_1 > 0 )
    {
        var_7 = 0;
        var_8 = var_3 / ( var_1 / var_6 );

        while ( var_7 < var_3 )
        {
            var_4.alpha = var_7;
            var_5.alpha = var_7;
            var_7 += var_8;
            wait(var_6);
        }
    }

    var_4.alpha = var_3;
    var_5.alpha = var_3;
    wait(var_0 - var_1 + var_2);

    if ( var_2 > 0 )
    {
        var_7 = var_3;
        var_9 = var_3 / ( var_2 / var_6 );

        while ( var_7 > 0 )
        {
            var_4.alpha = var_7;
            var_5.alpha = var_7;
            var_7 -= var_9;
            wait(var_6);
        }
    }

    var_4.alpha = 0;
    var_5.alpha = 0;
    var_4 destroy();
    var_5 destroy();
}

_id_6FFD( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "splatter_alt_sp", 640, 480 );
    var_4.splatter = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.sort = 1;
    var_4.foreground = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_5 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_6 = 0.05;

    if ( var_1 > 0 )
    {
        var_7 = 0;
        var_8 = var_3 / ( var_1 / var_6 );

        while ( var_7 < var_3 )
        {
            var_4.alpha = var_7;
            var_7 += var_8;
            wait(var_6);
        }
    }

    var_4.alpha = var_3;
    wait(var_0 - var_1 + var_2);

    if ( var_2 > 0 )
    {
        var_7 = var_3;
        var_9 = var_3 / ( var_2 / var_6 );

        while ( var_7 > 0 )
        {
            var_4.alpha = var_7;
            var_7 -= var_9;
            wait(var_6);
        }
    }

    var_4.alpha = 0;
    var_4 destroy();
}
