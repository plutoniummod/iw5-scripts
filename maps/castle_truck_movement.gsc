// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

_id_7A09( var_0 )
{
    var_0 endon( "stop_manage_player_position" );
    var_0 useanimtree( #animtree );
    var_1 = %castle_truck_escape_player_move_forward;
    var_2 = %castle_truck_escape_player_move_forward;
    var_3 = %castle_truck_escape_player_move_right;
    var_4 = %castle_truck_escape_player_move_right;
    var_5 = %castle_truck_escape_player_move_bob;
    var_0 setanim( var_1, 1, 0, 0 );
    var_0 setanimtime( var_1, 0.08 );
    var_0 setanim( var_3, 1, 0, 0 );
    var_0 setanimtime( var_3, 0.37 );
    var_6 = 0.06;
    var_7 = 2.1;
    var_8 = 1;
    var_9 = 1;
    var_10 = 0;
    level waittill( "start_manage_player_position" );
    var_0 setanim( var_5, 1, 0, 0 );

    for (;;)
    {
        if ( level.player getstance() == "crouch" )
            var_6 = 0.5;
        else
            var_6 = 0.7;

        wait 0.05;
        var_11 = level.player getnormalizedmovement();

        if ( !isalive( level.player ) )
            var_11 = ( 0.0, 0.0, 0.0 );

        var_12 = distance( ( 0.0, 0.0, 0.0 ), var_11 );
        var_11 = ( var_11[0], var_11[1] * -1, var_11[0] );
        var_13 = vectortoangles( var_11 );
        var_14 = level.player getplayerangles();

        if ( isdefined( level._id_5A23 ) )
            var_14 = combineangles( level._id_5A23.angles, var_14 );

        var_15 = combineangles( var_14, var_13 );
        var_16 = vectornormalize( anglestoforward( var_15 ) );
        var_17 = vectornormalize( anglestoforward( var_0 gettagangles( "tag_player" ) ) );
        var_18 = vectornormalize( anglestoright( var_0 gettagangles( "tag_player" ) ) );
        var_19 = vectordot( var_16, var_17 );
        var_20 = vectordot( var_16, var_18 );
        var_21 = var_12 * var_19;
        var_22 = var_12 * var_20;
        var_23 = var_0 getanimtime( var_1 );
        level._id_7A0A = var_23;
        var_24 = getanimlength( var_1 );
        var_25 = var_23;
        var_26 = var_0 getanimtime( var_3 );
        level._id_7A0B = var_0 getanimtime( var_3 );
        var_27 = getanimlength( var_3 );
        var_28 = var_26;
        var_29 = 0.08;

        if ( var_12 == 0 )
        {
            if ( var_9 )
                var_0 setanim( var_1, 1, 0.2, 0 );

            if ( var_10 )
                var_0 setanim( var_3, 1, 0.2, 0 );

            var_9 = 0;
            var_10 = 0;
            continue;
        }
        else if ( var_21 < 0 )
        {
            var_2 = %castle_truck_escape_player_move_back;

            if ( var_1 != var_2 )
                var_25 = 1 - var_25;

            var_25 = clamp( var_25, var_29, 1.0 );
        }
        else
        {
            var_2 = %castle_truck_escape_player_move_forward;

            if ( var_1 != var_2 )
                var_25 = 1 - var_25;

            var_25 = clamp( var_25, 0, 1.0 - var_29 );
        }

        if ( var_22 < 0 )
        {
            var_4 = %castle_truck_escape_player_move_left;

            if ( var_3 != var_4 )
                var_28 = 1 - var_28;
        }
        else
        {
            var_4 = %castle_truck_escape_player_move_right;

            if ( var_3 != var_4 )
                var_28 = 1 - var_28;
        }

        if ( var_9 || var_10 )
        {
            var_30 = 0;

            if ( var_20 > 0.7 && var_28 > 0.9 )
                var_30 = 1;

            if ( var_19 > 0.7 && var_25 > 0.8 )
                var_30 = 1;

            if ( var_20 < -0.7 && var_28 > 0.9 )
                var_30 = 1;

            if ( var_19 < -0.7 && var_25 > 0.9 )
                var_30 = 1;

            var_31 = abs( var_21 ) + abs( var_12 );
            var_31 *= 0.5;
            var_8 = 0;

            if ( var_30 )
            {
                var_0 clearanim( var_5, 0.35 );
                var_8 = 1;
            }
            else if ( var_0 getanimtime( var_5 ) == 1 || var_8 )
                var_0 setanimrestart( var_5, var_6 * var_31, 0.25, var_7 * var_31 );
            else
                var_0 setanim( var_5, var_6 * var_31, 0.15, var_7 * var_31 );
        }
        else
        {
            var_8 = 1;
            var_0 clearanim( var_5, 0.35 );
        }

        var_9 = 1;
        var_10 = 1;

        if ( var_1 != var_2 )
            var_0 clearanim( var_1, 0 );

        if ( var_3 != var_4 )
            var_0 clearanim( var_3, 0 );

        var_0 setanim( var_2, 1, 0, abs( var_21 ) * 2.5 );
        var_0 setanimtime( var_2, var_25 );
        var_1 = var_2;
        var_0 setanim( var_4, 1, 0, abs( var_22 ) * 2.5 );
        var_0 setanimtime( var_4, var_28 );
        var_3 = var_4;
    }
}

_id_7A0C( var_0 )
{
    var_0 notify( "stop_manage_player_position" );
    var_0 setanim( %castle_truck_escape_player_move_forward, 1, 1, 1 );
    var_0 clearanim( %castle_truck_escape_player_move_back, 1 );
    var_0 clearanim( %castle_truck_escape_player_move_right, 1 );
    var_0 clearanim( %castle_truck_escape_player_move_left, 1 );
    wait 1;
    var_0 clearanim( %castle_truck_escape_player_move_forward, 0 );
}

_id_8156()
{
    var_0 = getvehiclenode( "reached_bottom_of_hill", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_1 = %castle_truck_escape_player_view_over_edge;
    var_2 = getanimlength( var_1 );
    self setanim( var_1 );
    wait(var_2);
    self clearanim( var_1, 0.2 );
}

_id_8157( var_0 )
{
    var_1 = %castle_truck_escape_player_view_adjust_at_cliff;
    var_2 = getanimlength( var_1 );
    var_0 setanim( var_1, 1, 0.1, 1.0 );
    wait(var_2 / 2);
    level notify( "swap_trucks" );
    wait(var_2 / 2);
}

_id_8158()
{
    var_0 = %castle_truck_escape_mount_player_truck;
    self setanim( var_0, 1, 0.1, 1.0 );
}

_id_8159()
{
    level.player allowcrouch( 0 );
    level.player setstance( "stand" );
    level._id_815A thread maps\castle_code::_id_7A47( "truck_enter", undefined, 0, 0.6, 1, 0, 0, 0, 0, 0, "TAG_PLAYER1_ROTATE" );
    level.player waittill( "player_anim_started" );
    maps\_audio::aud_send_msg( "player_enters_truck" );
    level._id_815A thread _id_8158();
    level.player._id_7A48 waittillmatch( "single anim", "end" );
}

_id_815B()
{
    level._id_4877 notify( "newanim" );
    level._id_4877 endon( "newanim" );
    level._id_4877 endon( "death" );
    level endon( "truck_swap" );
    level._id_815A thread _id_815C();
    var_0 = maps\_vehicle_aianim::_id_2534( level._id_815A, 0 );
    level._id_815A maps\_anim::_id_1246( level._id_4877, "truck_start_drive", var_0._id_24F2 );
    thread _id_815F();
}

_id_815C()
{
    self setanim( %castle_truck_escape_drive_start_truck, 1, 0.1, 1.0 );
}

_id_815D()
{
    level._id_4877 notify( "newanim" );
    var_0 = maps\_vehicle_aianim::_id_2534( level._id_815A, 0 );
    level._id_815A setanim( %castle_truck_escape_turn_right_truck );
    level._id_815A maps\_anim::_id_1246( level._id_4877, "truck_turn_right", var_0._id_24F2 );
    thread _id_815F();
}

_id_815E()
{
    level._id_4877 notify( "newanim" );
    var_0 = maps\_vehicle_aianim::_id_2534( level._id_815A, 0 );
    level._id_815A setanim( %castle_truck_escape_turn_left_truck );
    level._id_815A maps\_anim::_id_1246( level._id_4877, "truck_turn_left", var_0._id_24F2 );
    thread _id_815F();
}

_id_815F()
{
    level._id_4877 notify( "newanim" );
    level._id_4877 endon( "newanim" );
    level._id_4877 endon( "death" );
    level endon( "truck_swap" );

    for (;;)
    {
        level._id_815A maps\_vehicle_aianim::_id_2549( level._id_4877, 0 );
        level._id_815A setanimtime( %castle_truck_escape_drive_idle_truck, 0 );
    }
}

_id_8160()
{
    level endon( "truck_swap" );
    level._id_4877 notify( "newanim" );
    var_0 = maps\_vehicle_aianim::_id_2534( level._id_815A, 0 );
    level._id_815A maps\_anim::_id_1246( level._id_4877, "truck_hit_react", var_0._id_24F2 );
    thread _id_815F();
}

_id_8161( var_0 )
{
    var_1 = %castle_truck_escape_windshield;
    var_2 = var_0 gettagorigin( "tag_glass_front" );
    var_0 notify( "damage", 100, undefined, ( 1.0, 0.0, 0.0 ), var_2, "mod_impact", undefined, "tag_glass_front", "tag_glass_front" );
    var_0 notify( "damage", 100, undefined, ( 1.0, 0.0, 0.0 ), var_2, "mod_impact", undefined, "tag_glass_front_d", "tag_glass_front_d" );
    level._id_815A hidepart( "tag_glass_front" );
    level._id_815A hidepart( "tag_glass_front_d" );
    var_3 = getanimlength( var_1 );
    var_0 setanim( var_1, 1, 0.1, 1.0 );
    wait(var_3);
    var_0 hidepart( "J_windshield_frame" );
}

_id_8162( var_0 )
{
    var_0 setanim( %castle_truck_escape_hood_loop );
}
