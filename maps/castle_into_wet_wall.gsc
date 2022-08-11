// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_81E2()
{
    maps\_shg_common::move_player_to_start( "start_into_wet_wall" );
    maps\castle_code::_id_8094( "start_into_wet_wall" );
    common_scripts\utility::flag_set( "price_across_bridge" );
    level thread _id_81E6();
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_81E3()
{
    maps\_shg_common::move_player_to_start( "start_into_wet_wall" );
    maps\castle_code::_id_8094( "start_into_wet_wall" );
    maps\castle_code::_id_80A1( 7, 10, ( 330.0, 315.0, 0.0 ), "lightning_wet_wall" );
    level thread _id_81E6();
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "objective_time_wall_charge" );
    common_scripts\utility::flag_init( "wet_wall_start" );
    common_scripts\utility::flag_init( "price_ready_for_lightning" );
    common_scripts\utility::flag_init( "okay_to_detonate" );
    common_scripts\utility::flag_init( "wet_wall_goofed" );
    common_scripts\utility::flag_init( "wet_wall_destroyed" );
    common_scripts\utility::flag_init( "going_to_die" );
    common_scripts\utility::flag_init( "wall_climb_start" );
    common_scripts\utility::flag_init( "waiting_for_input" );
    common_scripts\utility::flag_init( "price_climb_wait_end" );
    common_scripts\utility::flag_init( "peephole_start" );
    common_scripts\utility::flag_init( "player_slips" );
    common_scripts\utility::flag_init( "tv_off" );
    common_scripts\utility::flag_init( "peephole_react" );
    common_scripts\utility::flag_init( "stop_peeping" );
    common_scripts\utility::flag_init( "price_say_discover_wet_wall" );
    common_scripts\utility::flag_init( "price_say_time_explosion" );
}

_id_81E4()
{
    var_0 = getentarray( "wet_wall_destroyed", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    var_4 = getent( "fxanim_castle_enter_wall_mod", "targetname" );
    var_4 hide();
    var_5 = getent( "kitchen_wall_destroyed", "targetname" );
    var_5 hide();
    common_scripts\utility::flag_wait_all( "price_across_bridge", "wet_wall_start" );
    common_scripts\utility::exploder( 1030 );
    maps\castle_code::_id_80A1( 7, 10, ( 330.0, 315.0, 0.0 ), "lightning_wet_wall" );
    level thread _id_81E6();
    level thread _id_81E7();
    level._id_4877 thread _id_822A();
    level _id_81EB();
}

_id_81E5()
{
    common_scripts\utility::flag_wait( "wet_wall_destroyed" );
    level thread _id_8225();
    common_scripts\utility::exploder( 1001 );
    var_0 = getent( "fxanim_castle_enter_wall_mod", "targetname" );
    var_0 show();
    var_0._id_1032 = "wet_wall";
    var_0 maps\_utility::_id_2629();
    var_0 thread maps\_anim::_id_1246( var_0, "detonate" );

    if ( distance( var_0.origin, level.player.origin ) < 50 )
        level.player dodamage( 1000, var_0.origin );

    if ( distance( var_0.origin, level.player.origin ) > 50 && distance( var_0.origin, level.player.origin ) < 150 )
    {
        level.player dodamage( 100, var_0.origin );
        level.player stunplayer( 4.0 );
        level.player shellshock( "default", 4.0 );
    }

    var_1 = getentarray( "wet_wall_destroyed", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 show();

    var_5 = getentarray( "wet_wall_full", "targetname" );

    foreach ( var_7 in var_5 )
        var_7 delete();

    earthquake( 0.4, 0.8, level.player.origin, 2000 );
    level.player playrumbleonentity( "damage_heavy" );

    if ( common_scripts\utility::flag( "wet_wall_goofed" ) )
        common_scripts\utility::flag_waitopen( "wet_wall_goofed" );

    level thread _id_81F0();
    common_scripts\utility::flag_wait( "wall_climb_start" );
    maps\castle_code::_id_80A1( 5, 10 );
    level thread _id_8229();
}

_id_81E6()
{
    level endon( "wall_climb_start" );
    var_0 = getent( "thunder_loc", "targetname" );

    for (;;)
    {
        level waittill( "lightning_bolt" );
        wait 2.0;

        if ( common_scripts\utility::flag( "price_ready_for_lightning" ) )
        {
            var_0 playsound( "scn_castle_detcord_wall_thunder" );
            continue;
        }

        var_0 playsound( "elm_thunder_strike" );
    }
}

_id_81E7()
{
    level endon( "peephole_start" );

    for (;;)
    {
        common_scripts\utility::flag_clear( "show_wetwall_lightning" );
        common_scripts\utility::flag_wait( "show_wetwall_lightning" );
        maps\castle_code::_id_80A1( 7, 10, ( 330.0, 315.0, 0.0 ), "lightning_wet_wall" );
        common_scripts\utility::flag_clear( "hide_wetwall_lightning" );
        common_scripts\utility::flag_wait( "hide_wetwall_lightning" );
        maps\castle_code::_id_824A( "lightning_wet_wall" );
    }
}

_id_81EB()
{
    level._id_4877 endon( "death" );
    var_0 = maps\castle_code::_id_7A41( "spiderclimb" );
    var_0 maps\_anim::_id_124A( level._id_4877, "wet_wall_investigate" );
    maps\_audio::aud_send_msg( "price_set_detcord" );
    common_scripts\utility::flag_set( "price_say_discover_wet_wall" );
    var_1 = maps\_utility::_id_1287( "camera" );
    var_2 = [ level._id_4877, var_1 ];
    var_0 maps\_anim::_id_11DD( var_2, "wet_wall_investigate" );
    var_1 delete();
    var_3 = maps\_utility::_id_1287( "detcord" );
    var_2 = [ level._id_4877, var_3 ];
    var_0 maps\_anim::_id_11DD( var_2, "wet_wall_place_detcord" );
    level thread maps\_utility::_id_1425( "timing detcord" );
    maps\_utility::_id_261A( 1030 );
    common_scripts\utility::flag_set( "price_say_time_explosion" );
    var_0 maps\_anim::_id_124A( level._id_4877, "wet_wall_signal_move_to_window" );
    var_0 thread maps\_anim::_id_1246( level._id_4877, "wet_wall_signal_move_to_window" );
    wait 3.25;
    level.player thread _id_81EE();
    level._id_4877 waittillmatch( "single anim", "end" );
    level._id_4877 thread _id_81ED( var_0 );
    common_scripts\utility::flag_wait( "price_ready_for_lightning" );
    common_scripts\utility::flag_wait( "wet_wall_destroyed" );
    maps\castle_code::_id_80A1( 7, 10, ( 330.0, 315.0, 0.0 ) );
    var_3 delete();
    var_0 notify( "end_signal_idle" );

    if ( common_scripts\utility::flag( "wet_wall_goofed" ) )
    {
        var_4 = undefined;

        if ( level.player.origin[1] > 3000 )
        {
            var_5 = getentarray( "spawn_wetwall_alerted_south", "targetname" );
            var_4 = "wetwall_alert_south";
            common_scripts\utility::array_thread( var_5, maps\_utility::_id_166F );
        }
        else
        {
            var_5 = getentarray( "spawn_wetwall_alerted_north", "targetname" );
            var_4 = "wetwall_alert_north";
            common_scripts\utility::array_thread( var_5, maps\_utility::_id_166F );
        }

        level thread _id_81EC( var_4 );
    }
}

_id_81EC( var_0 )
{
    maps\_utility::_id_263A( var_0 );
    common_scripts\utility::flag_clear( "wet_wall_goofed" );
}

_id_81ED( var_0 )
{
    level endon( "wet_wall_destroyed" );

    while ( !common_scripts\utility::flag( "wet_wall_destroyed" ) )
    {
        var_0 thread maps\_anim::_id_124E( self, "wet_wall_signal_idle", "end_signal_idle" );
        common_scripts\utility::flag_wait( "price_ready_for_lightning" );
        level waittill( "lightning_bolt" );
        wait 2.0;
        var_0 notify( "end_signal_idle" );
        var_0 maps\_anim::_id_1246( self, "wet_wall_signal_flash" );
    }
}

_id_81EE()
{
    common_scripts\utility::flag_set( "objective_time_wall_charge" );
    level.player maps\_c4::_id_4626();
    level.player waittill( "detonate" );
    level.player thread maps\_c4::_id_4624();

    if ( !common_scripts\utility::flag( "okay_to_detonate" ) && !common_scripts\utility::flag( "going_to_die" ) )
        common_scripts\utility::flag_set( "wet_wall_goofed" );

    common_scripts\utility::flag_set( "wet_wall_destroyed" );
}

_id_81EF()
{
    level._id_4877 maps\_utility::_id_1902();
    level._id_4877 waittill( "death", var_0 );
    var_1 = undefined;

    if ( isplayer( var_0 ) )
        var_1 = &"SCRIPT_MISSIONFAIL_KILLTEAM_BRITISH";
    else
        var_1 = &"CASTLE_YOUR_ACTIONS_GOT_PRICE";

    setdvar( "ui_deadquote", var_1 );
    maps\_utility::_id_1826();
}

_id_81F0()
{
    level thread _id_81F4();
    level._id_4877 thread _id_81F2();
    maps\_utility::_id_265A( "axis" );
    level thread _id_8203();
    common_scripts\utility::flag_wait( "peephole_react" );
}

_id_81F1()
{
    var_0 = getent( "wetwall_player_clip", "targetname" );
    var_0 delete();
}

_id_81F2()
{
    self endon( "death" );
    var_0 = maps\castle_code::_id_7A41( "spiderclimb" );
    maps\_utility::_id_109B();
    var_0 maps\_anim::_id_124A( self, "spiderclimb_enter" );
    maps\_utility::delaythread( 6.25, maps\_utility::_id_168C, "castle_pri_climbuphere" );
    maps\_utility::delaythread( 12, ::_id_81F1 );
    var_0 thread maps\_anim::_id_1246( self, "spiderclimb_enter" );
    maps\_utility::_id_109E();
    maps\_audio::aud_send_msg( "price_start_climb" );
    common_scripts\utility::waittill_any_ents( level, "player_started_climbing", var_0, "spiderclimb_enter" );
    var_0 thread maps\_anim::_id_124E( self, "spiderclimb_wait_idle" );
    common_scripts\utility::flag_wait( "price_climb_wait_end" );
    maps\_audio::aud_send_msg( "price_start_climb2" );
    var_0 notify( "stop_loop" );

    if ( common_scripts\utility::flag( "wet_wall_goofed" ) )
        level._id_4877 thread maps\_utility::_id_0D04();

    var_0 maps\_anim::_id_1246( self, "spiderclimb_climb_up" );
    var_0 thread maps\_anim::_id_124E( self, "peep_show_wait_idle" );
    common_scripts\utility::flag_wait( "peephole_start" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( self, "peep_show" );
}

_id_0151( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_makarov" );
}

_id_0152( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_timetogo" );
}

_id_0153( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_thebodies" );
}

_id_0154( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_withthis" );
}

_id_81F4()
{
    var_0 = maps\castle_code::_id_7A41( "spiderclimb" );
    common_scripts\utility::flag_wait( "wall_climb_start" );

    if ( isdefined( level.player._id_522C ) )
    {
        level.player setactionslot( 1, "" );
        var_1 = level.player getcurrentweapon();
        level.player forceviewmodelanimation( var_1, "nvg_up" );
        level.player nightvisiongogglesforceoff();
        wait 1;
        level.player setactionslot( 1, "nightvision" );
    }

    level.player disableweapons();
    wait 0.25;
    level thread maps\_utility::_id_1424( "player_started_climbing", 3 );
    level.player freezecontrols( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
    maps\_audio::aud_send_msg( "player_start_climb" );
    var_0 thread maps\castle_code::_id_81F5( "wall_climb_start", undefined, 0, 0.5, 1, 1, 0, 0, 0, 0 );
    level.player._id_7A48 dontcastshadows();
    var_0 waittill( "wall_climb_start" );
    level.player freezecontrols( 0 );
    var_0 _id_81F7();
    level.player playerlinktoblend( level.player._id_7A48, "tag_player", 0.75 );
    var_0 thread maps\_anim::_id_1246( level.player._id_7A48, "wall_climb_peek_start" );
    wait 0.05;
    var_0 waittill( "wall_climb_peek_start" );
    level.player playerlinktoblend( level.player._id_7A48, "tag_player", 1.0 );
    level.player playerlinktodelta( level.player._id_7A48, "tag_player", 1.0, 30, 45, 25, 15 );
    var_0 thread maps\_anim::_id_124E( level.player._id_7A48, "wall_climb_peek_idle" );
    common_scripts\utility::flag_wait( "player_slips" );
    level.player unlink();
    var_0 notify( "stop_loop" );
    common_scripts\utility::flag_set( "stop_peeping" );
    maps\_audio::aud_send_msg( "player_wetwall_jump" );
}
#using_animtree("script_model");

_id_81F6()
{
    var_0 = getent( "fxanim_castle_peep_hole_boards_mod", "targetname" );
    var_0._id_1032 = "peep_hole_fx";
    var_0 useanimtree( #animtree );
    var_0 thread maps\_anim::_id_1246( var_0, "wall_climb_peek_slip" );
}

_id_81F7()
{
    var_0 = level._id_0C59["player_rig"]["wall_climb_full"];
    var_1 = var_0;
    var_2 = var_0;
    var_3 = level.player._id_7A48;
    var_3 thread _id_81FD();
    var_3 stopanimscripted();
    var_3 setflaggedanim( "wall_climb_full", var_1, 1, 0, 0 );
    var_3 setanimtime( var_1, 0 );
    level.player unlink();
    level.player playerlinktoblend( level.player._id_7A48, "tag_player", 0.2 );
    level.player playerlinktodelta( level.player._id_7A48, "tag_player", 1.0, 30, 30, 25, 30 );
    var_4 = 0;
    var_5 = 1.5;

    while ( var_4 < 1 || var_1 != var_0 )
    {
        wait 0.05;

        if ( common_scripts\utility::flag( "waiting_for_input" ) || !isalive( level.player ) )
            var_6 = 0;
        else
        {
            var_7 = level.player getnormalizedmovement();
            var_6 = 1 + var_7[0] * 0.5;
        }

        var_4 = var_3 getanimtime( var_1 );

        if ( var_1 != var_2 )
        {
            var_8 = 1 - var_4;
            var_3 clearanim( var_1, 0 );
            var_3 setflaggedanim( "wall_climb_full", var_2, 1, 0, clamp( abs( var_6 ), 0, var_5 ) );
            var_3 setanimtime( var_2, var_8 );
            var_1 = var_2;
            var_4 = var_8;
            continue;
        }

        var_3 setflaggedanim( "wall_climb_full", var_1, 1, 0, clamp( abs( var_6 ), 0, var_5 ) );
    }
}

_id_81F8( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "spiderclimb", "targetname" );
    var_2 = anglestoforward( var_1.angles + ( 0.0, -90.0, 0.0 ) );
    var_3 = var_0 gettagorigin( "J_Wrist_RI" );
    playfx( level._effect["wall_hand_plant"], var_3, var_2 );
    level.player playrumbleonentity( "damage_light" );
}

_id_81F9( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "spiderclimb", "targetname" );
    var_2 = anglestoforward( var_1.angles + ( 0.0, -90.0, 0.0 ) );
    var_3 = var_0 gettagorigin( "J_Wrist_LE" );
    playfx( level._effect["wall_hand_plant"], var_3, var_2 );
    level.player playrumbleonentity( "damage_light" );
}

_id_81FA()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_wetwall_grip", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_81FB()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_wetwall_step", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_81FC()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_wetwall_foley", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_81FD()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "wall_climb_full", var_0 );

        switch ( var_0 )
        {
            case "left_hand_on":
                level thread _id_81F9( self );
                continue;
            case "right_hand_on":
                level thread _id_81F8( self );
                continue;
            case "input_left":
                common_scripts\utility::flag_set( "waiting_for_input" );
                _id_8201();
                continue;
            case "input_right":
                common_scripts\utility::flag_set( "waiting_for_input" );
                _id_8201();
                common_scripts\utility::flag_set( "price_climb_wait_end" );
                continue;
            case "input_both":
                common_scripts\utility::flag_set( "waiting_for_input" );
                _id_8201();
                continue;
            case "ps_cstl_wetwall_grip":
                thread _id_81FA();
                continue;
            case "ps_cstl_wetwall_step":
                thread _id_81FB();
                continue;
            case "ps_cstl_wetwall_foley":
                thread _id_81FC();
                continue;
        }
    }
}

_id_81FE( var_0 )
{
    var_1 = spawn( "script_origin", level.player.origin );
    var_1.angles = var_0.angles;
    var_2 = 0;

    while ( !common_scripts\utility::flag( "peephole_start" ) )
    {
        if ( var_2 == 0 )
            _id_81FF( "RT", var_1, "wall_climb_start_idle", "wall_climb_right_hand" );
        else
            _id_81FF( "RT", var_1, "wall_climb_idle", "wall_climb_right_hand" );

        _id_81FF( "LT", var_1, "wall_climb_right_hand_idle", "wall_climb_left_hand" );
        _id_81FF( "LT+RT", var_1, "wall_climb_both_hands_idle", "wall_climb_both_hands_push_up" );
        var_2++;

        switch ( var_2 )
        {
            case 1:
                common_scripts\utility::flag_set( "price_climb_wait_end" );
                level.player unlink();
                level.player playerlinktodelta( level.player._id_7A48, "tag_player", 0.9, 30, 30, 25, 30 );
                continue;
            case 2:
                level.player unlink();
                level.player playerlinktodelta( level.player._id_7A48, "tag_player", 0.7, 30, 30, 25, 30 );
                continue;
            case 3:
                level.player unlink();
                level.player playerlinktodelta( level.player._id_7A48, "tag_player", 0.4, 30, 30, 25, 30 );
                continue;
            case 4:
                continue;
        }
    }

    var_1 notify( "stop_idle" );
    var_1 delete();
}

_id_81FF( var_0, var_1, var_2, var_3 )
{
    var_4 = "stop_idle";

    if ( !common_scripts\utility::flag( "peephole_start" ) )
    {
        level thread _id_8200( var_0, var_1, var_4 );
        var_1.origin = level.player._id_7A48.origin;
        var_1 maps\_anim::_id_124E( level.player._id_7A48, var_2, var_4 );
    }

    var_1.origin = level.player._id_7A48.origin;
    var_1 maps\_anim::_id_1246( level.player._id_7A48, var_3 );
}

_id_8200( var_0, var_1, var_2 )
{
    var_3 = "";

    switch ( var_0 )
    {
        case "LT":
            var_3 = &"CASTLE_HINT_CLIMB_LEFT";
            break;
        case "RT":
            var_3 = &"CASTLE_HINT_CLIMB_RIGHT";
            break;
        case "LT+RT":
            var_3 = &"CASTLE_HINT_CLIMB_UP";
            break;
    }

    level thread maps\_utility::_id_27BB( var_3 );
    var_4 = 0;
    var_5 = 0;

    while ( !var_4 || var_5 )
    {
        switch ( var_0 )
        {
            case "LB":
                var_4 = level.player secondaryoffhandbuttonpressed();
                break;
            case "RB":
                var_4 = level.player fragbuttonpressed();
                break;
            case "LT":
                var_4 = level.player adsbuttonpressed();
                break;
            case "RT":
                var_4 = level.player attackbuttonpressed();
                break;
            case "LT+RT":
                var_4 = level.player adsbuttonpressed() && level.player attackbuttonpressed();
                break;
        }

        if ( var_5 && !var_4 )
            var_5 = 0;

        wait 0.05;
    }

    level thread maps\_utility::_id_27BD();
    common_scripts\utility::flag_clear( "waiting_for_input" );
}

_id_8201()
{
    var_0 = 0;
    level thread _id_8202();

    while ( var_0 < 0.25 )
    {
        var_1 = level.player getnormalizedmovement();
        var_0 = var_1[0];
        wait 0.05;
    }

    level notify( "stop_hint" );
    level thread maps\_utility::_id_27BD();
    common_scripts\utility::flag_clear( "waiting_for_input" );
}

_id_8202()
{
    level endon( "stop_hint" );
    wait 2.0;
    level thread maps\_utility::_id_27BB( &"CASTLE_HINT_CLIMB" );
}

_id_8203()
{
    var_0 = maps\castle_code::_id_7A41( "spiderclimb" );
    var_1 = getentarray( "tv_room_guy", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_8208, var_0 );
    maps\_utility::_id_2703( "trig_tv_room_guys", "targetname" );
    common_scripts\utility::flag_wait( "peephole_start" );
    var_2 = getentarray( "lightning_wet_wall", "targetname" );
    level._id_81E9 = common_scripts\utility::array_remove_array( level._id_81E9, var_2 );

    foreach ( var_4 in var_2 )
        var_4 setlightintensity( 0 );

    level._id_8204 thread maps\_anim::_id_1246( level._id_8204, "tv_scene" );
    level._id_8205 thread maps\_anim::_id_1246( level._id_8205, "tv_scene" );
    var_0 thread maps\_anim::_id_1246( level._id_8206, "peep_show" );
    var_6 = maps\_utility::_id_263E( "tv_room_guys" );
    var_0 maps\_anim::_id_11DD( var_6, "peep_show" );
    common_scripts\utility::flag_set( "peephole_react" );
    var_0 maps\_anim::_id_11DD( var_6, "peep_show_react" );
}

_id_8207( var_0 )
{
    common_scripts\utility::flag_set( "player_slips" );
}

_id_8208( var_0 )
{
    self.ignoreall = 1;
    self._id_1032 = self.script_noteworthy;

    switch ( self._id_1032 )
    {
        case "president":
            level._id_8204 = self;
            break;
        case "makarov":
            level._id_8205 = self;
            break;
        case "alexi":
            level._id_8223 = self;
            break;
        case "tv_room_guy1":
            level._id_022A = self;
            break;
        case "tv_room_guy2":
            level._id_022B = self;
            break;
        case "tv_room_guy3":
            level._id_022C = self;
            break;
        case "tv_room_guy4":
            level._id_8206 = self;
    }

    maps\_utility::_id_282D( self, "wet_wall" );
}

_id_8224( var_0 )
{

}

_id_8225()
{
    common_scripts\utility::flag_wait( "tv_start_static" );
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingameloopresident( "castle_static" );
    common_scripts\utility::flag_wait( "peephole_start" );
    cinematicingame( "castle_tv" );
    level._id_8223 waittillmatch( "single anim", "alarm_start" );
    cinematicingameloopresident( "castle_static" );
    common_scripts\utility::flag_wait( "tv_off" );
    stopcinematicingame();
}

_id_8226( var_0 )
{
    maps\_audio::aud_send_msg( "play_alarm" );
}

_id_8228( var_0 )
{
    var_1 = maps\_utility::_id_1287( "peep_hole_grenade" );
    var_2 = maps\castle_code::_id_7A41( "spiderclimb" );
    var_3 = getent( "wetwall_grenade", "targetname" );
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_3.origin;
    var_4.angles = var_3.angles;
    var_2 thread maps\_anim::_id_11CF( var_1, "wall_climb_grenade_toss" );
    var_5 = var_1 gettagorigin( "J_prop_1" );
    var_6 = var_1 gettagangles( "J_prop_1" );
    var_3.origin = var_5;
    var_3.angles = var_6;
    var_3 linkto( var_1, "J_prop_1" );
    var_2 thread maps\_anim::_id_1246( var_1, "wall_climb_grenade_toss" );
    var_1 waittillmatch( "single anim", "grenade_bounce" );
    var_4 playsound( "grenade_bounce_concrete" );
    var_1 waittillmatch( "single anim", "grenade_bounce2" );
    var_4 playsound( "grenade_bounce_concrete" );
    var_1 waittillmatch( "single anim", "bounce_to_roll" );
    var_4 playsound( "grenade_bounce_concrete" );
    var_1 waittillmatch( "single anim", "grenade_explode" );
    var_4 playsound( "grenade_explode_concrete" );
    common_scripts\utility::exploder( 834 );
}

_id_8229()
{
    common_scripts\utility::flag_wait( "kitchen_start" );
    maps\_utility::_id_282E( "wet_wall" );
    common_scripts\utility::flag_set( "tv_off" );
}

_id_822A()
{
    self endon( "death" );
    level endon( "going_to_die" );
    common_scripts\utility::flag_wait( "price_say_discover_wet_wall" );
    maps\_utility::_id_168C( "castle_pri_holdon" );
    wait 3.5;
    maps\_utility::_id_168C( "castle_pri_changeofplan" );
    wait 0.75;
    maps\_utility::_id_168C( "castle_pri_justaboveus" );
    wait 2.5;
    maps\_utility::_id_168C( "castle_pri_shootourway" );
    common_scripts\utility::flag_wait( "price_say_time_explosion" );
    maps\castle_code::_id_80A1( 6.0, 7.0, ( 330.0, 315.0, 0.0 ) );
    maps\_utility::_id_168C( "castle_pri_waitformysignal2" );
    common_scripts\utility::flag_set( "price_ready_for_lightning" );
    level._id_4877 _id_822B();

    if ( common_scripts\utility::flag( "wet_wall_goofed" ) )
    {
        maps\_utility::_id_168C( "castle_pri_pisspoor" );
        maps\castle_code::_id_80F8( -5 );
    }
    else
        maps\castle_code::_id_80F8( 5 );
}

_id_822B()
{
    level endon( "wet_wall_destroyed" );
    level._id_822C = 0;

    while ( !common_scripts\utility::flag( "wet_wall_destroyed" ) )
    {
        level waittill( "lightning_bolt" );
        wait 2.0;
        common_scripts\utility::flag_set( "okay_to_detonate" );
        var_0 = randomintrange( 0, 3 );

        switch ( var_0 )
        {
            case 0:
                maps\_utility::_id_168C( "castle_pri_now3" );
                break;
            case 1:
                maps\_utility::_id_168C( "castle_pri_go3" );
                break;
            case 2:
                maps\_utility::_id_168C( "castle_pri_blowit" );
                break;
            case 3:
                maps\_utility::_id_168C( "castle_pri_doit2" );
                break;
        }

        wait 1.5;
        common_scripts\utility::flag_clear( "okay_to_detonate" );
        level._id_822C++;

        switch ( level._id_822C )
        {
            case 1:
                maps\_utility::_id_168C( "castle_pri_areyoudim" );
                continue;
            case 3:
                maps\_utility::_id_168C( "castle_pri_focusyuri" );
                maps\castle_code::_id_80F8( -1 );
                continue;
            case 5:
                maps\_utility::_id_168C( "castle_pri_payattention" );
                maps\castle_code::_id_80F8( -1 );
                continue;
        }
    }
}

_id_822D( var_0 )
{
    level._id_8223 maps\_utility::_id_168C( "castle_alx_checkwith" );
}

_id_822E( var_0 )
{
    level._id_8223 maps\_utility::_id_168C( "castle_alx_yessir" );
}

_id_822F( var_0 )
{
    level._id_8223 maps\_utility::_id_168C( "castle_alx_thedaughter" );
}

_id_022D( var_0 )
{
    level._id_8223 maps\_utility::_id_168C( "castle_alx_whatgoingon" );
}

_id_022E( var_0 )
{
    level._id_022C maps\_utility::_id_168C( "castle_ru1_noresponse" );
}

_id_022F( var_0 )
{
    level._id_022A maps\_utility::_id_168C( "castle_ru1_grenade" );
}
