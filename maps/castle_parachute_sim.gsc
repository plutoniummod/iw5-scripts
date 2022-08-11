// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_805F()
{
    self._id_8060 = [];
    self._id_8060["turn_control"] = "right_stick";
    self._id_8060["forward_acceleration"] = 250;
    self._id_8060["lateral_acceleration"] = 500;
    self._id_8060["torque"] = ( 0.0, -40.0, 30.0 );
    self._id_8060["max_roll"] = 45;
    self._id_8060["pendulum_gravity"] = -5000;
    self._id_8060["pendulum_length"] = 101;
    self._id_8060["pendulum_damping"] = 0.6;
    self._id_8060["max_speed"] = 600;
    self._id_8060["min_speed"] = 0;
    self._id_8060["lateral_move_damping"] = 0.5;
    self._id_8060["max_turn_speed"] = 30;
    self._id_8060["max_fall_speed"] = 75;
    self._id_8060["max_flared_fall_speed"] = 400;
    self._id_8060["max_rise_speed"] = 500;
    self._id_8060["max_rise_flared_speed"] = 300;
    self._id_8060["min_stick_turn"] = 0.25;
    self._id_8060["gravity"] = 150;
    self._id_8060["lateral_bank_scale"] = 0.6;
    self._id_8060["left_arc"] = 0;
    self._id_8060["right_arc"] = 0;
    self._id_8060["top_arc"] = 0;
    self._id_8060["bottom_arc"] = 70;
    self._id_8060["disable_move"] = 0;
    self._id_8060["disable_fall"] = 1;
    self._id_8060["disable_flare"] = 0;
    self._id_8060["disable_input"] = 0;

    if ( self._id_8060["turn_control"] == "left_stick" )
    {
        self._id_8060["left_arc"] = 30;
        self._id_8060["right_arc"] = 30;
    }
}

_id_8061()
{
    _id_805F();
    self._id_8062["velocity"] = anglestoforward( self.angles ) * self._id_8060["max_speed"];
    self._id_8062["angular_velocity"] = ( 0.0, 0.0, 0.0 );
    self._id_8062["force"] = ( 0.0, 0.0, 0.0 );
    self._id_8062["flare_state"] = "none";
    self._id_8062["thermal_state"] = "none";
    self._id_8062["ai_controlled"] = 0;
    self._id_8062["goal_velocity"] = 0.0;
    self._id_8063 = maps\_utility::_id_1287( "player_parachute", self.origin + ( 0.0, 0.0, 50.0 ) );
    self._id_8063.angles = self.angles;
    self._id_8063 dontcastshadows();
    self._id_7A48 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    self._id_7A48.angles = self.angles;
    self._id_7A48 dontcastshadows();
    self._id_7A48 linkto( self._id_8063, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self._id_8064 = 0;
    thread _id_807F();
    thread _id_8084();
    thread _id_807E();
    self hideviewmodel();
    self playerlinktodelta( self._id_7A48, "tag_origin", 1, self._id_8060["right_arc"], self._id_8060["left_arc"], self._id_8060["top_arc"], self._id_8060["bottom_arc"], 0 );
    setsaveddvar( "cg_drawCrosshair", 0 );
    self disableweapons();
    thread _id_8071();
}

_id_8065( var_0 )
{
    _id_805F();
    self._id_8060["turn_control"] = "left_stick";
    self._id_8060["max_roll"] = 25;
    self._id_8060["min_stick_turn"] = 0;
    self._id_8060["pendulum_damping"] = 0.575;
    self._id_8060["torque"] = ( 0.0, -720.0, 360.0 );
    self._id_8060["max_turn_speed"] = 360;
    self._id_8060["max_speed"] = 500;
    self._id_8060["pendulum_damping"] = 0.65;
    self._id_8062["velocity"] = ( 0.0, 0.0, 0.0 );
    self._id_8062["angular_velocity"] = ( 0.0, 0.0, 0.0 );
    self._id_8062["force"] = ( 0.0, 0.0, 0.0 );
    self._id_8062["flare_state"] = "none";
    self._id_8062["thermal_state"] = "none";
    self._id_8062["goal_pos"] = undefined;
    self._id_8062["ai_controlled"] = 1;
    self._id_8064 = 0;
    self._id_8063 = maps\_utility::_id_1287( "ai_parachute", self.origin );
    self._id_8063.angles = self.angles;
    self linkto( self._id_8063, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( var_0 ) )
        thread _id_8067( var_0 );

    thread _id_8071();
}

_id_8066( var_0 )
{
    for (;;)
    {
        var_1 = level.player._id_8063.origin;
        var_2 = self._id_8063.origin;
        var_3 = common_scripts\utility::flat_origin( var_1 ) - common_scripts\utility::flat_origin( var_2 );
        var_4 = length( var_3 );

        if ( var_4 > var_0 )
            self._id_8062["goal_pos"] = common_scripts\utility::flat_origin( var_1 );

        wait 0.05;
    }
}

_id_8067( var_0 )
{
    self endon( "death" );
    self endon( "end_parachute" );
    self endon( "end_parachute_sim" );
    var_1 = getvehiclenode( var_0, "targetname" );
    self._id_8063.origin = var_1.origin;
    var_2 = undefined;
    var_3 = var_1;
    var_4 = getvehiclenode( var_3.target, "targetname" );
    var_5 = var_4.origin - var_3.origin;
    var_5 = vectornormalize( var_5 );
    self._id_8062["velocity"] = var_5 * var_3.speed;
    var_6 = vectortoangles( var_5 );
    self._id_8063.angles = var_6 + ( 0.0, 0.0, 45.0 );
    var_7 = 0;

    while ( isdefined( var_4.target ) )
    {
        var_8 = ( 1.0, 0.0, 0.0 );

        if ( isdefined( var_2 ) )
        {
            var_8 = var_3.origin - var_2.origin;
            var_8 = vectornormalize( var_8 );
        }
        else
            var_8 = anglestoforward( self._id_8063.angles );

        var_9 = var_4.origin - var_3.origin;
        var_9 = vectornormalize( var_9 );
        var_10 = getvehiclenode( var_4.target, "targetname" ).origin - var_4.origin;
        var_10 = vectornormalize( var_10 );
        var_11 = var_9 + var_10;
        var_11 = vectornormalize( var_11 );
        var_12 = var_8 + var_9;
        var_12 = vectornormalize( var_12 );
        var_13 = self._id_8063.origin;
        var_14 = var_13 - var_3.origin;
        var_15 = var_4.origin - var_13;
        var_16 = vectordot( var_14, var_12 );
        var_17 = vectordot( var_15, var_11 );

        if ( var_17 < 0 )
        {
            self notify( "reached_node" );

            if ( isdefined( var_3.script_noteworthy ) )
                self notify( var_3.script_noteworthy );

            var_2 = var_3;
            var_3 = var_4;
            var_4 = getvehiclenode( var_3.target, "targetname" );
            continue;
        }
        else if ( var_16 < 0 )
        {
            var_16 = vectordot( var_9, var_14 );

            if ( var_16 < 0 )
                var_7 = 0;
            else
            {
                var_18 = length( var_4.origin - var_3.origin );
                var_19 = length( var_15 );
                var_7 = 1 - var_19 / var_18;
                var_7 = clamp( var_7, 0, 1 );

                if ( var_7 > 0.95 )
                {
                    self notify( "reached_node" );

                    if ( isdefined( var_3.script_noteworthy ) )
                        self notify( var_3.script_noteworthy );

                    var_2 = var_3;
                    var_3 = var_4;
                    var_4 = getvehiclenode( var_3.target, "targetname" );
                    continue;
                }
            }
        }

        var_7 = var_16 / ( var_16 + var_17 );
        var_20 = 0;

        if ( isdefined( self._id_8062["script_speed"] ) )
            var_20 = self._id_8062["script_speed"];
        else
            var_20 = var_3.speed + ( var_4.speed - var_3.speed ) * var_7;

        var_21 = var_3.lookahead + ( var_4.lookahead - var_3.lookahead ) * var_7;
        var_22 = var_3.lookahead * var_20;
        var_23 = length( var_4.origin - var_3.origin );
        var_19 = var_7 * var_23 + var_22;
        var_24 = ( 0.0, 0.0, 0.0 );

        if ( var_19 > var_23 )
        {
            var_25 = var_19 - var_23;
            var_24 = var_4.origin + var_10 * var_25;
        }
        else
            var_24 = var_3.origin + var_9 * var_19;

        var_26 = vectornormalize( var_24 - self._id_8063.origin );
        self._id_8062["goal_pos"] = var_24;
        self._id_8062["velocity"] = var_26 * var_20;
        self._id_8063.origin += self._id_8062["velocity"] * 0.05;
        wait 0.05;
    }
}

_id_8068( var_0 )
{
    self._id_8062["script_speed"] = var_0;
}

_id_8069()
{
    self notify( "end_parachute" );
    self notify( "end_parachute_crash_watcher" );
    self unlink();
    self._id_7A48 unlink();
    self._id_7A48 delete();
    self._id_8063 delete();
    _id_806F();
    self showviewmodel();
    self enableweapons();
    setsaveddvar( "cg_drawCrosshair", 1 );
}

_id_806A()
{
    self notify( "end_parachute" );
    self unlink();
    self._id_8063 notify( "stop" );
}

_id_806B()
{
    self endon( "death" );
    self endon( "end_parachute_crash_watcher" );
    var_0 = 30;

    for (;;)
    {
        var_1 = bullettrace( self.origin, self.origin + ( 0.0, 0.0, -1.0 ) * var_0, 0, self );
        var_2 = bullettrace( self.origin, self.origin + anglestoforward( self.angles ) * var_0, 0, self );

        if ( var_1["fraction"] < 1.0 || var_2["fraction"] < 1.0 )
        {
            self notify( "end_parachute" );
            _id_806C();
            missionfailed();
            self notify( "end_parachute_crash_watcher" );
        }

        wait 0.05;
    }
}
#using_animtree("player");

_id_806C()
{
    self unlink();
    self playerlinktodelta( self._id_7A48, "tag_player", 1, 0, 0, 0, 0, 1 );
    self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "neutral2flare" ), 0 );
    self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ), 0 );
    self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "turn_left2right" ), 0 );
    self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "turn_right2left" ), 0 );
    self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "neutral" ), 0 );
    self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "neutral2flare" ), 0 );
    self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "flare2neutral" ), 0 );
    self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "neutral" ), 0 );
    self._id_7A48 clearanim( %castle_parachute_turning, 0 );
    var_0 = "crash_death";

    if ( self._id_8062["thermal_state"] == "in" )
    {
        var_0 = "fire_death";
        _id_8089();
    }

    self._id_7A48 setanim( self._id_7A48 maps\_utility::_id_1281( var_0 ), 1, 0.1, 1 );
    self._id_8063 setanim( self._id_8063 maps\_utility::_id_1281( var_0 ), 1, 0.1, 1 );
}

_id_806D()
{
    precachemodel( "ctl_parachute_player" );
    precachemodel( "ctl_parachute_ai" );
}

_id_806E()
{
    var_0 = getentarray( "trig_thermal", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_808A );
}

_id_806F()
{
    var_0 = getentarray( "trig_thermal", "targetname" );
    maps\_utility::_id_1F09( var_0, "end_parachute" );
}

_id_8070()
{
    for (;;)
    {
        thread maps\_utility::_id_2657( self._id_8063.origin, 5, 1, 1, 0, self, "stop_parachute_debug" );
        thread maps\_utility::_id_2657( self._id_7A48.origin, 5, 1, 0, 1, self, "stop_parachute_debug" );
        thread common_scripts\utility::draw_line_for_time( self._id_8063.origin, self._id_7A48.origin, 1, 1, 1, 0.05 );
        wait 0.05;
        self notify( "stop_parachute_debug" );
    }
}

_id_8071()
{
    self endon( "death" );
    self endon( "end_parachute" );
    self endon( "end_parachute_sim" );
    self._id_8072 = ( 0.0, 0.0, 0.0 );
    self._id_8073 = ( 0.0, 0.0, 0.0 );
    self._id_8074 = ( 0.0, 0.0, 0.0 );
    var_0 = self._id_8060["turn_control"] == "right_stick";

    for (;;)
    {
        var_1 = self._id_8063.angles;
        var_2 = 0;
        var_3 = 0;
        self._id_8072 = self._id_8073;

        if ( !self._id_8062["ai_controlled"] && !self._id_8060["disable_input"] )
        {
            self._id_8073 = self getnormalizedmovement();
            self._id_8074 = self getnormalizedcameramovement();

            if ( isdefined( self._id_8062["goal_pos"] ) )
            {
                var_4 = common_scripts\utility::flat_origin( self._id_8062["goal_pos"] ) - common_scripts\utility::flat_origin( self._id_8063.origin );
                var_5 = length( var_4 );
                var_4 = vectornormalize( var_4 );

                if ( var_5 > 10 )
                {
                    var_6 = ( 0, angleclamp180( var_1[1] ), 0 );
                    var_7 = anglestoforward( var_6 );
                    var_8 = vectordot( var_7, var_4 );
                    var_9 = 1 - var_8;
                    var_9 *= 5;
                    var_9 = min( var_9, 1 );
                    var_9 /= 3;
                    var_10 = anglestoright( var_6 );
                    var_11 = vectordot( var_4, var_10 );

                    if ( var_11 < 0 )
                        var_9 *= -1;

                    self._id_8074 += ( 0, var_9, 0 );
                }
            }
        }
        else if ( isdefined( self._id_8062["goal_pos"] ) )
        {
            var_4 = common_scripts\utility::flat_origin( self._id_8062["goal_pos"] ) - common_scripts\utility::flat_origin( self._id_8063.origin );
            var_5 = length( var_4 );

            if ( var_5 > 10 )
            {
                var_4 = vectornormalize( var_4 );
                var_6 = ( 0, angleclamp180( var_1[1] ), 0 );
                var_7 = anglestoforward( var_6 );
                var_8 = vectordot( var_7, var_4 );
                var_9 = 1 - var_8;
                var_9 *= 5;
                var_9 = min( var_9, 1 );
                var_10 = anglestoright( var_6 );
                var_11 = vectordot( var_4, var_10 );

                if ( var_11 < 0 )
                    var_9 *= -1;

                if ( isplayer( self ) )
                {
                    var_12 = 0;

                    if ( self._id_8062["goal_pos"][2] > self._id_8063.origin[2] )
                        var_12 = 1;
                    else if ( self._id_8062["goal_pos"][2] < self._id_8063.origin[2] )
                        var_12 = -1;

                    self._id_8073 = ( var_8, var_9, var_12 );
                    self._id_8074 = ( var_8, var_9, 0 );
                }
                else
                    self._id_8073 = ( 0, var_9, 0 );
            }
            else
                self._id_8073 = ( 0.0, 0.0, 0.0 );
        }
        else
            self._id_8073 = ( 0.0, 0.0, 0.0 );

        if ( self._id_8060["turn_control"] == "right_stick" )
        {
            if ( abs( self._id_8074[1] ) > self._id_8060["min_stick_turn"] )
            {
                var_2 = self._id_8074[1];
                var_3 = self._id_8074[1];
            }
            else
            {
                var_2 = 0;

                if ( abs( self._id_8073[1] ) > self._id_8060["min_stick_turn"] )
                    var_3 = self._id_8073[1] * self._id_8060["lateral_bank_scale"];
            }
        }
        else if ( self._id_8060["turn_control"] == "left_stick" )
        {
            if ( abs( self._id_8073[1] ) > self._id_8060["min_stick_turn"] )
            {
                var_2 = self._id_8073[1];
                var_3 = self._id_8073[1];
            }
        }
        else if ( self._id_8060["turn_control"] == "triggers" )
        {
            self disableweapons();

            if ( self attackbuttonpressed() )
            {
                var_2 = 1;
                var_3 = 1;
            }
            else if ( self adsbuttonpressed() )
            {
                var_2 = -1;
                var_3 = -1;
            }
        }

        if ( !self._id_8060["disable_fall"] )
        {
            if ( self._id_8060["turn_control"] != "triggers" && !self._id_8060["disable_flare"] )
            {
                if ( self attackbuttonpressed() && self adsbuttonpressed() )
                {
                    if ( self._id_8062["flare_state"] != "flare_in" )
                        self._id_8062["flare_state"] = "flare_in";
                }
                else if ( self._id_8062["flare_state"] == "flare_in" )
                    self._id_8062["flare_state"] = "flare_out";
            }
        }

        if ( var_2 != 0 )
            self._id_8064 = _id_807A( var_2, self._id_8064, 1.0, 0.05 );
        else if ( var_3 != 0 )
            self._id_8064 = _id_807A( var_3, self._id_8064, 1.0, 0.05 );
        else
        {
            self._id_8064 = _id_807A( 0, self._id_8064, 1.0, 0.05 );

            if ( abs( self._id_8064 ) < 0.1 )
                self._id_8064 = 0;
        }

        if ( var_2 != 0 || var_3 != 0 )
        {
            var_13 = undefined;

            if ( self._id_8062["ai_controlled"] )
                var_13 = vectortoangles( self._id_8062["velocity"] );

            self._id_8062["angular_velocity"] = _id_8076( var_2, var_3, self._id_8062["angular_velocity"], var_1, self._id_8060["max_turn_speed"], self._id_8060["torque"], var_13 );
        }

        self._id_8062["angular_velocity"] = _id_8077( var_1, self._id_8062["angular_velocity"] );
        var_1 += self._id_8062["angular_velocity"] * 0.05;
        var_1 = _id_8078( var_1, self._id_8062["angular_velocity"], self._id_8060["max_roll"] );
        self._id_8063.angles = ( angleclamp180( var_1[0] ), angleclamp180( var_1[1] ), angleclamp180( var_1[2] ) );

        if ( !self._id_8062["ai_controlled"] )
        {
            self._id_8062["velocity"] = _id_8075( self._id_8073, self._id_8062["velocity"], var_1, var_0 );
            self._id_8063.origin += self._id_8062["velocity"] * 0.05;

            if ( isdefined( self._id_8062["goal_pos"] ) )
            {
                var_4 = self._id_8062["goal_pos"] - self._id_8063.origin;
                var_5 = length( var_4 );
                thread common_scripts\utility::draw_line_for_time( self._id_8063.origin, self._id_8062["goal_pos"], 1, 1, 1, 0.05 );

                if ( var_5 < 50 )
                    self notify( "goal" );
            }
        }
        else if ( isplayer( self ) )
        {
            var_4 = self._id_8062["goal_pos"] - self._id_8063.origin;
            var_5 = length( var_4 );

            if ( var_5 < 30 )
            {
                self notify( "goal" );
                self._id_8062["flare_state"] = "flare_out";
            }
            else
                self._id_8062["flare_state"] = "flare_in";

            var_4 = vectornormalize( var_4 );
            self._id_8062["goal_velocity"] += 0.25;

            if ( self._id_8062["goal_velocity"] > self._id_8060["max_speed"] )
                self._id_8062["goal_velocity"] = self._id_8060["max_speed"];

            var_14 = var_5 / 0.05;

            if ( var_14 < self._id_8060["max_speed"] )
                var_15 = var_14;

            self._id_8062["velocity"] = var_4 * self._id_8062["goal_velocity"];
            self._id_8063.origin += self._id_8062["velocity"] * 0.05;
        }
        else
        {

        }

        wait 0.05;
    }
}

_id_8075( var_0, var_1, var_2, var_3 )
{
    if ( self._id_8060["disable_move"] )
        return ( 0.0, 0.0, 0.0 );

    var_4 = anglestoforward( var_2 );
    var_5 = ( var_2[0], var_2[1], 0 );
    var_6 = anglestoright( var_5 );
    var_7 = vectordot( var_1, var_4 );
    var_8 = vectordot( var_1, var_6 );
    var_9 = var_1[2];
    var_10 = var_0[0] * self._id_8060["forward_acceleration"];
    var_11 = 0;

    if ( isdefined( var_3 ) && var_3 == 1 )
        var_11 = var_0[1] * self._id_8060["lateral_acceleration"];

    var_7 += var_10 * 0.05;
    var_8 += var_11 * 0.05;
    var_12 = self._id_8060["max_speed"];

    if ( self._id_8062["thermal_state"] == "in" )
    {
        if ( var_7 < self._id_8060["min_speed"] )
            var_7 = self._id_8060["min_speed"];
        else if ( var_7 > self._id_8060["max_speed"] * 1.25 )
            var_7 = self._id_8060["max_speed"] * 1.25;
    }
    else if ( var_7 < self._id_8060["min_speed"] )
        var_7 = self._id_8060["min_speed"];
    else if ( var_7 > self._id_8060["max_speed"] )
        var_7 *= 0.95;

    var_13 = var_8 * self._id_8060["lateral_move_damping"];
    var_8 -= var_13 * 0.05;
    var_8 = clamp( var_8, self._id_8060["max_speed"] * -1, var_12 );
    var_14 = ( 0.0, 0.0, 1.0 );
    var_15 = self._id_8062["force"] + var_14 * self._id_8060["gravity"] * -1 * 0.05;

    if ( self._id_8060["disable_fall"] == 1 )
    {
        var_15 = ( 0.0, 0.0, 0.0 );

        if ( var_0[2] != 0 )
        {
            if ( self._id_8062["ai_controlled"] && self._id_8062["goal_pos"] != ( 0.0, 0.0, 0.0 ) )
            {
                var_9 += 5.0;
                var_16 = self._id_8062["goal_pos"][2] - self._id_8063.origin[2];
                var_17 = var_16 / 0.05;

                if ( abs( var_17 ) < abs( var_9 ) )
                    var_9 = var_17;
            }
        }
        else
            var_9 = 0;
    }

    var_1 = var_4 * var_7 + var_6 * var_8;
    var_1 += ( 0, 0, var_9 );
    var_1 += var_15;

    if ( self._id_8062["flare_state"] == "flare_in" )
    {
        if ( var_1[2] < 0 && abs( var_1[2] ) > self._id_8060["max_flared_fall_speed"] )
        {
            var_18 = var_1[2] * 0.9;

            if ( abs( var_18 ) < self._id_8060["max_flared_fall_speed"] )
                var_18 = self._id_8060["max_flared_fall_speed"] * -1;

            var_1 = ( var_1[0], var_1[1], var_18 );
        }
        else if ( var_1[2] > 0 && var_1[2] > self._id_8060["max_rise_flared_speed"] )
        {
            var_19 = var_1[2] * 0.7;
            var_1 = ( var_1[0], var_1[1], var_19 );
        }
    }
    else if ( var_1[2] < 0 && abs( var_1[2] ) > self._id_8060["max_fall_speed"] )
    {
        var_18 = var_1[2] * 0.9;
        var_1 = ( var_1[0], var_1[1], var_18 );
    }
    else if ( var_1[2] > 0 && var_1[2] > self._id_8060["max_rise_speed"] )
        var_1 = ( var_1[0], var_1[1], self._id_8060["max_rise_speed"] );

    self._id_8062["force"] = ( 0.0, 0.0, 0.0 );
    return var_1;
}

_id_8076( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = ( 0, var_0, var_1 );
    var_2 += var_7 * var_5 * 0.05;
    var_8 = var_2[1];
    var_8 = clamp( var_8, var_4 * -1, var_4 );
    var_2 = ( var_2[0], var_8, var_2[2] );

    if ( isdefined( var_6 ) )
    {
        var_9 = var_6[1];
        var_9 = angleclamp180( var_9 );
        var_10 = var_3[1];
        var_10 = angleclamp180( var_10 );
        var_11 = var_9 - var_10;
        var_12 = var_11 / 0.05;

        if ( abs( var_12 ) > 0 && abs( var_12 ) < abs( var_2[1] ) )
            var_2 = ( var_2[0], _id_807A( var_12, var_2[1], 1.0, 0.05 ), var_2[2] );
    }

    if ( var_3[2] == self._id_8060["max_roll"] )
    {
        if ( var_2[2] > 0 )
            var_2 = ( var_2[0], var_2[1], var_2[2] * 0.95 );
    }
    else if ( var_3[2] == self._id_8060["max_roll"] * -1 )
    {
        if ( var_2[2] < 0 )
            var_2 = ( var_2[0], var_2[1], var_2[2] * 0.95 );
    }

    return var_2;
}

_id_8077( var_0, var_1 )
{
    var_2 = self._id_8060["pendulum_gravity"] / self._id_8060["pendulum_length"] * 1 * sin( var_0[2] );
    var_3 = var_1;
    var_1 += ( 0, 0, var_2 ) * 0.05;
    var_4 = var_1 * self._id_8060["pendulum_damping"];
    var_1 -= var_4 * 0.05;
    return var_1;
}

_id_8078( var_0, var_1, var_2 )
{
    var_3 = var_0[2];
    var_3 = clamp( var_3, var_2 * -1, var_2 );
    var_0 = ( var_0[0], var_0[1], var_3 );
    return var_0;
}

_id_8079( var_0, var_1 )
{
    var_2 = var_0[1] * var_1[2] - var_0[2] - var_1[1];
    var_3 = var_0[2] * var_1[0] - var_0[0] - var_1[2];
    var_4 = var_0[0] * var_1[1] - var_0[1] - var_1[0];
    return ( var_2, var_3, var_4 );
}

_id_807A( var_0, var_1, var_2, var_3 )
{
    var_4 = 0.0;

    if ( var_2 * var_3 >= 1.0 || var_2 <= 0.0 )
        var_4 = var_0;
    else
    {
        var_5 = var_0 - var_1;
        var_4 = var_1 + var_2 * var_5 * var_3;
    }

    return var_4;
}
#using_animtree("vehicles");

_id_807B()
{
    level._id_1F90["ai_parachute"] = "ctl_parachute_ai";
    level._id_1245["ai_parachute"] = #animtree;
    level._id_0C59["ai_parachute"]["chute_idle"] = %o_castle_1_1_parachute_idl;
    level._id_0C59["ai_parachute"]["chute_left2right"] = %o_castle_1_1_parachute_left2right;
    level._id_0C59["ai_parachute"]["chute_right2left"] = %o_castle_1_1_parachute_right2left;
    level._id_0C59["ai_parachute"]["chute_loop"] = %o_castle_1_1_parachute_idl_new;
    level._id_0C59["ai_parachute"]["chute_right"] = %o_castle_1_1_parachute_leftturn_new;
    level._id_0C59["ai_parachute"]["chute_left"] = %o_castle_1_1_parachute_rightturn_new;
    level._id_0C59["ai_parachute"]["chute_up"] = %o_castle_1_1_parachute_updraft_new;
}
#using_animtree("player");

_id_7059()
{
    level._id_1F90["player_rig"] = level._id_1F5D;
    level._id_1245["player_rig"] = #animtree;
    level._id_0C59["player_rig"]["neutral2flare"] = %castle_player_paraglide_arms_neutral_to_flare;
    level._id_0C59["player_rig"]["flare2neutral"] = %castle_player_paraglide_arms_flare_to_neutral;
    level._id_0C59["player_rig"]["turn_left2right"] = %castle_player_paraglide_arms_l_to_r;
    level._id_0C59["player_rig"]["turn_right2left"] = %castle_player_paraglide_arms_r_to_l;
    level._id_0C59["player_rig"]["neutral"] = %castle_player_paraglide_arms_neutral_idle;
    level._id_0C59["player_rig"]["crash_death"] = %castle_player_paraglide_arms_crashdeath;
    level._id_0C59["player_rig"]["fire_death"] = %castle_player_paraglide_arms_firedeath;
    level._id_0C59["player_rig"]["sleeve_flap"] = %castle_player_paraglide_arms_sleeveflap;
}

_id_807C()
{
    level._id_1245["player_altimeter"] = #animtree;
    level._id_1F90["player_altimeter"] = "ctl_altimeter";
    level._id_0C59["player_altimeter"]["neutral2flare"] = %castle_player_paraglide_altimeter_neutral_to_flare;
    level._id_0C59["player_altimeter"]["flare2neutral"] = %castle_player_paraglide_altimeter_flare_to_neutral;
    level._id_0C59["player_altimeter"]["turn_left2right"] = %castle_player_paraglide_altimeter_l_to_r;
    level._id_0C59["player_altimeter"]["turn_right2left"] = %castle_player_paraglide_altimeter_r_to_l;
    level._id_0C59["player_altimeter"]["neutral"] = %castle_player_paraglide_altimeter_neutral_idle;
    level._id_0C59["player_altimeter"]["crash_death"] = %castle_player_paraglide_altimeter_crashdeath;
    level._id_0C59["player_altimeter"]["fire_death"] = %castle_player_paraglide_altimeter_firedeath;
}

_id_807D()
{
    level._id_1F90["player_parachute"] = "ctl_parachute_player";
    level._id_1245["player_parachute"] = #animtree;
    level._id_0C59["player_parachute"]["neutral2flare"] = %castle_player_paraglide_chute_neutral_to_flare;
    level._id_0C59["player_parachute"]["flare2neutral"] = %castle_player_paraglide_chute_flare_to_neutral;
    level._id_0C59["player_parachute"]["turn_left2right"] = %castle_player_paraglide_chute_l_to_r;
    level._id_0C59["player_parachute"]["turn_right2left"] = %castle_player_paraglide_chute_r_to_l;
    level._id_0C59["player_parachute"]["neutral"] = %castle_player_paraglide_chute_neutral_idle;
    level._id_0C59["player_parachute"]["crash_death"] = %castle_player_paraglide_chute_crashdeath;
    level._id_0C59["player_parachute"]["fire_death"] = %castle_player_paraglide_chute_firedeath;
    _id_807B();
}

_id_807E()
{
    self._id_7A48 setanim( self._id_7A48 maps\_utility::_id_1281( "sleeve_flap" ), 1, 0, 1 );
}

_id_807F()
{
    self endon( "end_parachute" );
    level._id_2AF6 = 0.05;
    level._id_8080 = 0.5;
    level._id_8081 = -1.0;
    level._id_8082 = 1.0;
    level._id_8083 = 5.0;
    self._id_8063 setanim( %castle_parachute_turning, 1, 0, 1.0 );
    self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( "turn_left2right" ), 1.0, 0.5, 0.0 );
    self._id_8063 setanimtime( self._id_8063 maps\_utility::_id_1281( "turn_left2right" ), 0.5 );
    self._id_7A48 setanim( %castle_parachute_turning, 1, 0, 1.0 );
    self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( "turn_left2right" ), 1.0, 0.5, 0.0 );
    self._id_7A48 setanimtime( self._id_7A48 maps\_utility::_id_1281( "turn_left2right" ), 0.5 );
    var_0 = "";
    var_1 = "turn_left2right";
    var_2 = 1;
    var_3 = 1;
    var_4 = 0;

    for (;;)
    {
        var_5 = var_4;
        var_4 = self._id_8064;
        var_4 = clamp( var_4, level._id_8081, level._id_8082 );
        var_6 = var_4 - var_5;

        if ( var_6 < 0 )
        {
            if ( var_1 != "turn_right2left" )
                var_0 = "turn_right2left";
        }
        else if ( var_6 > 0 )
        {
            if ( var_1 != "turn_left2right" )
                var_0 = "turn_left2right";
        }

        if ( self._id_8062["flare_state"] != "none" )
        {
            self._id_8063 clearanim( %castle_parachute_turning, 0 );
            self._id_7A48 clearanim( %castle_parachute_turning, 0 );
            self waittill( "flare_done" );
            self._id_8063 setanim( %castle_parachute_turning, 1, 0, 1 );
            self._id_7A48 setanim( %castle_parachute_turning, 1, 0, 1 );
            var_0 = "";
            var_4 = 0;
            self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( var_1 ), var_2, level._id_8080, 0.0 );
            self._id_8063 setanimtime( self._id_8063 maps\_utility::_id_1281( var_1 ), 0.5 );
            self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( var_1 ), var_2, level._id_8080, 0.0 );
            self._id_7A48 setanimtime( self._id_7A48 maps\_utility::_id_1281( var_1 ), 0.5 );
        }

        if ( var_0 != "" )
        {
            self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( var_1 ), 0 );
            self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( var_1 ), 0 );

            if ( _id_8086( var_0 ) && !_id_8086( var_1 ) )
            {
                self._id_8063 setanim( %castle_parachute_turning, var_2, 0, 1.0 );
                self._id_7A48 setanim( %castle_parachute_turning, var_2, 0, 1.0 );
            }

            var_7 = self._id_8063 getanimtime( self._id_8063 maps\_utility::_id_1281( var_1 ) );
            var_7 = 1.0 - var_7;
            self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( var_0 ), var_2, level._id_8080, 0.0 );
            self._id_8063 setanimtime( self._id_8063 maps\_utility::_id_1281( var_0 ), var_7 );
            self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( var_0 ), var_2, level._id_8080, 0.0 );
            self._id_7A48 setanimtime( self._id_7A48 maps\_utility::_id_1281( var_0 ), var_7 );
            var_1 = var_0;
            var_0 = "";
        }
        else if ( var_1 != "" )
        {
            var_7 = _id_8085( var_4, var_1 );
            var_8 = self._id_8063 getanimtime( self._id_8063 maps\_utility::_id_1281( var_1 ) );
            var_9 = level._id_8083 * 0.05;
            var_10 = var_7 - var_8;

            if ( var_10 < 0 )
                var_9 = 0;
            else if ( var_10 < var_9 )
                var_9 = var_10;

            if ( var_8 > 0.35 && var_8 < 0.65 && var_9 < 0.01 )
            {
                self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( var_1 ), level._id_8080 );
                self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( var_1 ), level._id_8080 );
                self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( "neutral" ), 1, level._id_8080, 1 );
                self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( "neutral" ), 1, level._id_8080, 1 );
            }
            else
            {
                self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "neutral" ), level._id_8080 );
                self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "neutral" ), level._id_8080 );
                self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( var_1 ), var_2, level._id_8080, var_9 );
                self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( var_1 ), var_2, level._id_8080, var_9 );
            }
        }

        wait(level._id_2AF6);
    }
}

_id_8084()
{
    self endon( "end_parachute" );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        if ( self._id_8062["flare_state"] == "flare_in" )
        {
            if ( !var_0 )
            {
                if ( !var_1 )
                    var_2 = 0;
                else
                    var_2 = 1.0 - self._id_8063 getanimtime( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ) );

                self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ), 0 );
                self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "flare2neutral" ), 0 );
                self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( "neutral2flare" ), 1, 0.5, 1.5 );
                self._id_8063 setanimtime( self._id_8063 maps\_utility::_id_1281( "neutral2flare" ), var_2 );
                self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( "neutral2flare" ), 1, 0.5, 1.5 );
                self._id_7A48 setanimtime( self._id_7A48 maps\_utility::_id_1281( "neutral2flare" ), var_2 );
                var_0 = 1;
            }
        }
        else if ( self._id_8062["flare_state"] == "flare_out" )
        {
            if ( var_0 )
            {
                var_2 = 1.0 - self._id_8063 getanimtime( self._id_8063 maps\_utility::_id_1281( "neutral2flare" ) );
                self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "neutral2flare" ), 0 );
                self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "neutral2flare" ), 0 );
                self._id_8063 setanimlimited( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ), 1, 0.5, 1.5 );
                self._id_8063 setanimtime( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ), var_2 );
                self._id_7A48 setanimlimited( self._id_7A48 maps\_utility::_id_1281( "flare2neutral" ), 1, 0.5, 1.5 );
                self._id_7A48 setanimtime( self._id_7A48 maps\_utility::_id_1281( "flare2neutral" ), var_2 );
                var_1 = 1;
                var_0 = 0;
            }
            else
            {
                var_3 = self._id_8063 getanimtime( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ) );

                if ( var_3 >= 1 )
                {
                    self._id_8063 clearanim( self._id_8063 maps\_utility::_id_1281( "flare2neutral" ), 0 );
                    self._id_7A48 clearanim( self._id_7A48 maps\_utility::_id_1281( "flare2neutral" ), 0 );
                    var_1 = 0;
                    self._id_8062["flare_state"] = "none";
                    self notify( "flare_done" );
                }
            }
        }

        wait 0.05;
    }
}

_id_8085( var_0, var_1 )
{
    var_2 = 0;

    if ( _id_8086( var_1 ) )
    {
        var_2 = abs( ( var_0 - level._id_8081 ) / ( level._id_8081 - level._id_8082 ) );

        if ( var_1 == "turn_right2left" )
            var_2 = 1.0 - var_2;
    }

    return var_2;
}

_id_8086( var_0 )
{
    return var_0 == "turn_left2right" || var_0 == "turn_right2left" || var_0 == "chute_left2right" || var_0 == "chute_right2left";
}

_id_8087( var_0, var_1, var_2 )
{
    if ( var_1 > var_2 )
        return _id_8087( var_0, var_2, var_1 );

    if ( isdefined( var_1 ) && var_0 < var_1 )
        return var_1;

    if ( isdefined( var_2 ) && var_0 > var_2 )
        return var_2;

    return var_0;
}

_id_8088()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "fire" )
        playfx( level._effect["fire_field_patch_md"], self.origin, ( 0.0, 0.0, 1.0 ), ( 1.0, 0.0, 0.0 ) );
}

_id_8089()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "tag_origin" );
    var_0 linkto( self._id_7A48, "tag_camera", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( level._effect["fullscreen_fire_death"], var_0, "tag_origin" );
}

_id_808A()
{
    self endon( "end_parachute" );
    self endon( "death" );
    self waittill( "trigger", var_0 );
    var_0 notify( "enter_thermal" );
    playfxontag( common_scripts\utility::getfx( "smoke_push_player" ), level.player._id_7A48, "tag_origin" );
    var_1 = 1;
    var_2 = self.radius;
    var_3 = self.height;
    var_4 = self.origin;

    if ( self.classname != "trigger_radius" )
    {
        var_5 = common_scripts\utility::getstruct( self.target, "targetname" );
        var_4 = ( var_0.origin[0], var_0.origin[1], var_5.origin[2] );
    }

    var_6 = 250;
    var_7 = 150;
    var_8 = 500;
    var_9 = _id_808B();

    if ( isdefined( var_9 ) )
    {
        var_6 = int( var_9[0] );
        var_7 = int( var_9[1] );
        var_8 = int( var_9[2] );
    }

    var_10 = 0;
    var_11 = level.player.origin[2];
    var_12 = self.origin[2];
    var_13 = -9999;

    while ( var_13 < var_12 + self.height && var_1 )
    {
        var_0._id_8062["thermal_state"] = "in";

        if ( var_11 > var_13 )
            var_13 = var_11;

        var_11 = var_0.origin[2];
        var_14 = var_0.origin;
        var_15 = ( var_2, var_2, self.height );
        var_16 = distance( var_14, var_4 );
        var_17 = distance2d( var_4, var_14 );
        var_18 = var_17 / var_2;
        var_18 = max( var_18, 0.01 );
        var_19 = var_16 / length( var_15 );

        if ( var_18 > 1 )
            var_1 = 0;

        var_20 = ( level.player.origin[2] - var_12 ) / self.height;
        var_20 = ( 1.0 - var_20 ) / 1.5;

        if ( var_0._id_8062["flare_state"] == "flare_in" )
            var_10 = var_7;
        else
            var_10 = var_6;

        var_0._id_8062["force"] = ( 0.0, 0.0, 1.0 ) * ( var_10 * var_20 );
        var_21 = var_14 * ( 1.0, 1.0, 0.0 );
        var_22 = anglestoforward( common_scripts\utility::flat_angle( var_0.angles ) );
        var_23 = var_4 * ( 1.0, 1.0, 0.0 );
        var_24 = vectornormalize( var_21 - var_23 );
        var_25 = vectordot( var_22, var_24 );
        earthquake( 0.1, 0.05, level.player.origin, 100 );
        wait 0.05;
    }

    var_26 = var_0._id_8062["velocity"][2];
    var_27 = var_0._id_8060["gravity"];
    var_0._id_8060["gravity"] = var_8;
    var_0._id_8062["thermal_state"] = "none";
    var_0 notify( "exit_thermal_vent" );

    while ( var_26 > 0 )
    {
        var_26 = var_0._id_8062["velocity"][2];
        wait 0.05;
    }

    var_0._id_8060["gravity"] = var_27;
    thread _id_808A();
}

_id_808B()
{
    if ( isdefined( self._id_164F ) )
        return strtok( self._id_164F, ":;, " );
}

_id_808C()
{
    iprintlnbold( "Use LS to move" );
    wait 2.0;
    iprintlnbold( "Use RS to look/turn" );
    wait 2.0;
    iprintlnbold( "Hold RT to flare" );
    wait 2.0;
    iprintlnbold( "Use the thermal vents to gain altitude" );
    wait 2.0;
    self waittill( "enter_thermal" );
    iprintlnbold( "Flare (RT) to control your ascent" );
    wait 2.0;
    iprintlnbold( "Exit the vent when desired altitude is reached" );
}

_id_808D()
{
    self endon( "death" );
    self endon( "end_parachute" );

    for (;;)
    {
        if ( self buttonpressed( "BUTTON_A" ) )
            self._id_8063.origin += ( 0.0, 0.0, 3000.0 );

        wait 1;
    }
}
#using_animtree("generic_human");

_id_808E()
{
    self endon( "end_parachute" );
    self endon( "death" );

    for (;;)
    {
        self setflaggedanimknoball( "right", maps\_utility::_id_1281( "chute_right" ), %root, 1, 0.5, 1 );
        self._id_8063 _id_808F();
        self waittillmatch( "right", "anim_end" );
        self setflaggedanimknoball( "left", maps\_utility::_id_1281( "chute_left" ), %root, 1, 0.5, 1 );
        self._id_8063 _id_8090();
        self waittillmatch( "left", "anim_end" );
    }
}
#using_animtree("vehicles");

_id_808F()
{
    self setanimknoball( maps\_utility::_id_1281( "chute_left" ), %root, 1, 0.5, 1.0 );
}

_id_8090()
{
    self setanimknoball( maps\_utility::_id_1281( "chute_right" ), %root, 1, 0.5, 1.0 );
}

_id_8091()
{
    self setanimknoball( maps\_utility::_id_1281( "chute_up" ), %root, 1, 0.5, 1.0 );
}

_id_8092()
{
    self setanimknoball( maps\_utility::_id_1281( "chute_loop" ), %root, 1, 0.5, 1.0 );
}
