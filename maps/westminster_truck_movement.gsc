// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

_id_7A09( var_0 )
{
    var_0 endon( "stop_manage_player_position" );
    var_0 useanimtree( #animtree );
    var_1 = %london_player_truck_player_move_forward;
    var_2 = %london_player_truck_player_move_forward;
    var_3 = %london_player_truck_player_move_right;
    var_4 = %london_player_truck_player_move_right;
    var_5 = %london_player_truck_player_move_bob;
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
        var_25 = var_23 / var_24;
        var_26 = var_0 getanimtime( var_3 );
        level._id_7A0B = var_0 getanimtime( var_3 );
        var_27 = getanimlength( var_3 );
        var_28 = var_26 / var_27;
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
            var_2 = %london_player_truck_player_move_back;

            if ( var_1 != var_2 )
                var_25 = 1 - var_25;

            var_25 = clamp( var_25, var_29, 1.0 );
        }
        else
        {
            var_2 = %london_player_truck_player_move_forward;

            if ( var_1 != var_2 )
                var_25 = 1 - var_25;

            var_25 = clamp( var_25, 0, 1.0 - var_29 );
        }

        if ( var_22 < 0 )
        {
            var_4 = %london_player_truck_player_move_left;

            if ( var_3 != var_4 )
                var_28 = 1 - var_28;
        }
        else
        {
            var_4 = %london_player_truck_player_move_right;

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

        var_0 setanim( var_2, 1, 0, abs( var_21 ) * 1.0 );
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
    var_0 setanim( %london_player_truck_player_move_forward, 1, 1, 1 );
    var_0 clearanim( %london_player_truck_player_move_back, 1 );
    var_0 clearanim( %london_player_truck_player_move_right, 1 );
    var_0 clearanim( %london_player_truck_player_move_left, 1 );
    wait 1;
    var_0 clearanim( %london_player_truck_player_move_forward, 0 );
}
