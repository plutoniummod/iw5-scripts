// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6B81( var_0, var_1 )
{
    var_2 = 24;

    for ( var_3 = 0; var_3 < 3; var_3++ )
    {
        var_4 = var_0[0];
        var_5 = var_0[1];
        var_6 = var_0[2];
        var_7 = var_0[0];
        var_8 = var_0[1];
        var_9 = var_0[2];

        if ( var_3 == 0 )
        {
            var_4 -= var_2;
            var_7 += var_2;
        }
        else if ( var_3 == 1 )
        {
            var_5 -= var_2;
            var_8 += var_2;
        }
        else if ( var_3 == 2 )
        {
            var_6 -= var_2;
            var_9 += var_2;
        }

        var_10 = ( var_4, var_5, var_6 );
        var_11 = ( var_7, var_8, var_9 );
    }
}

_id_6B82( var_0, var_1 )
{
    return var_0 + " - " + var_1;
}

_id_6B83()
{
    var_0 = [];

    foreach ( var_9, var_2 in level.createfxexploders )
    {
        var_3 = undefined;

        foreach ( var_5 in var_2 )
        {
            var_6 = "script group not on all parts of exploder: " + var_9 + ", at: " + var_5.v["origin"];

            if ( !isdefined( var_5.model ) || !isdefined( var_5.model._id_16A6 ) )
            {
                var_3 = 0;

                if ( !isdefined( var_0[var_9] ) )
                    var_0[var_9] = [];

                var_0[var_9][var_0[var_9].size] = var_5;
                continue;
            }

            var_3 = 1;
            var_7 = _id_6B82( var_5.model._id_16A6, var_5.model.script_exploder );
            var_5.v["exploder"] = var_7;

            if ( !isdefined( var_0[var_7] ) )
                var_0[var_7] = [];

            var_0[var_7][var_0[var_7].size] = var_5;
        }
    }

    level.createfxexploders = var_0;

    for ( var_10 = 0; var_10 < 6; var_10++ )
    {
        switch ( var_10 )
        {
            case 0:
                var_11 = "trigger_multiple";
                break;
            case 1:
                var_11 = "trigger_once";
                break;
            case 2:
                var_11 = "trigger_use";
                break;
            case 3:
                var_11 = "trigger_radius";
                break;
            case 4:
                var_11 = "trigger_lookat";
                break;
            default:
                var_11 = "trigger_damage";
                break;
        }

        var_12 = getentarray( var_11, "classname" );

        for ( var_13 = 0; var_13 < var_12.size; var_13++ )
        {
            if ( isdefined( var_12[var_13].script_prefab_exploder ) )
                var_12[var_13].script_exploder = var_12[var_13].script_prefab_exploder;

            if ( isdefined( var_12[var_13].script_exploder ) )
            {
                if ( isdefined( var_12[var_13]._id_16A6 ) )
                {
                    level notify( "killexplodertridgers" + var_12[var_13].script_exploder );
                    var_12[var_13].script_exploder = _id_6B82( var_12[var_13]._id_16A6, var_12[var_13].script_exploder );
                    level thread _id_6B84( var_12[var_13] );
                }

                var_2 = level.createfxexploders[var_12[var_13].script_exploder];

                foreach ( var_5 in var_2 )
                {
                    if ( !isdefined( var_5.v["trigger"] ) )
                        var_5.v["trigger"] = [];

                    var_5.v["trigger"][var_5.v["trigger"].size] = var_12[var_13];
                }
            }
        }
    }
}

_id_6B84( var_0 )
{
    level endon( "killexplodertridgers" + var_0.script_exploder );
    var_0 waittill( "trigger", var_1 );

    if ( isdefined( var_1 ) )
    {
        if ( isai( var_1 ) && var_1 isbadguy() || isdefined( var_1.script_team ) && var_1.script_team == "axis" )
        {
            level thread _id_6B84( var_0 );
            return;
        }
    }

    if ( isdefined( var_0.script_chance ) && randomfloat( 1 ) > var_0.script_chance )
    {
        if ( !var_0 maps\_utility::script_delay() )
            wait 4;

        level thread _id_6B84( var_0 );
        return;
    }

    if ( !var_0 maps\_utility::script_delay() && isdefined( var_0._id_1ED3 ) )
        wait(var_0._id_1ED3);

    common_scripts\utility::exploder( var_0.script_exploder );
    level notify( "killexplodertridgers" + var_0.script_exploder );
}

_id_6B85( var_0 )
{
    var_0 += "";
    level notify( "exploding_" + var_0 );

    if ( isdefined( level.createfxexploders ) && !level.createfx_enabled )
    {
        var_1 = level.createfxexploders[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( var_3.v["exploder_type"] == "exploderchunk" || var_3.v["exploder_type"] == "exploderchunk visible" )
                {
                    if ( isdefined( var_3.model ) )
                        var_3.model notsolid();
                }

                var_3 common_scripts\utility::activate_individual_exploder();
            }

            return;
        }
    }
    else
        common_scripts\utility::activate_exploder( var_0 );
}

_id_6B86( var_0, var_1, var_2, var_3 )
{
    var_4 = 2 / var_3;
    var_5 = var_4 * 0.05;
    var_6 = 1 / ( 1 + var_5 + 0.48 * var_5 * var_5 + 0.235 * var_5 * var_5 * var_5 );
    var_7 = var_0 - var_1;
    var_8 = ( var_2._id_695C + var_4 * var_7 ) * 0.05;
    var_2._id_695C = ( var_2._id_695C - var_4 * var_8 ) * var_6;
    return var_1 + ( var_7 + var_8 ) * var_6;
}

_id_6B87( var_0, var_1 )
{
    var_2 = level.player maps\_hud_util::createicon( "hud_grenadeicon", 20, 20 );
    var_2.alpha = 1;
    var_2.archived = 1;
    var_2.sort = 1;
    var_2.foreground = 1;
    var_2 maps\_hud_util::setpoint( "CENTER", undefined, 0, 0 );
    var_2._id_6B88 = 50;
    var_2._id_6B89 = 0;
    var_2._id_6B8A = 0;
    var_2._id_6B8B = 1;
    var_3 = spawnstruct();
    var_3._id_695C = 0;
    var_4 = 0;

    while ( var_4 < var_1 )
    {
        var_5 = level.player getplayerangles();
        var_6 = anglestoforward( var_5 );
        var_6 = ( var_6[0], var_6[1], 0 );
        var_6 = vectornormalize( var_6 );
        var_7 = anglestoright( var_5 );
        var_7 = ( var_7[0], var_7[1], 0 );
        var_7 = vectornormalize( var_7 );
        var_8 = var_0 - level.player.origin;
        var_8 = ( var_8[0], var_8[1], 0 );
        var_8 = vectornormalize( var_8 );
        var_9 = vectordot( var_8, var_6 );
        var_10 = vectordot( var_8, var_7 );
        var_11 = acos( var_9 );

        if ( var_10 < 0 )
            var_11 *= -1;

        if ( abs( angleclamp180( var_11 - var_2._id_6B89 ) ) < 0.01 )
        {

        }
        else
        {
            var_12 = angleclamp180( var_11 - var_2._id_6B89 );
            var_11 = var_2._id_6B89 + var_12;
            var_11 = _id_6B86( var_2._id_6B89, var_11, var_3, 0.25 );
            var_2._id_6B89 = var_11;
            var_2.x = var_2._id_6B88 * sin( var_11 );
            var_2.y = var_2._id_6B88 * cos( var_11 ) * -1;
            var_2 moveovertime( 0.05 );
        }

        var_4 += 0.05;
        wait 0.05;
    }

    var_2 destroy();
}

_id_6B8C( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2 setshader( "hud_grenadeicon", 5, 5 );
    var_2.alpha = 1;
    var_2.color = ( 1.0, 1.0, 1.0 );
    var_2.x = var_0[0];
    var_2.y = var_0[1];
    var_2.z = var_0[2];
    var_2 setwaypoint( 1, 1 );
    wait(var_1);
    var_2 destroy();
}

_id_6B8D( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    self forceteleport( var_1.origin, var_1.angles );
}

_id_6B8E()
{
    while ( level.player usebuttonpressed() )
        wait 0.05;
}

_id_6B8F()
{
    while ( !level.player usebuttonpressed() )
        wait 0.05;
}

_id_4BF3()
{
    if ( !isalive( self ) )
        return;

    self.allowdeath = 1;
    self.a._id_0D55 = 1;
    thread maps\_utility::_id_0D72( 0 );
    self kill();
}

_id_6B90( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::flag_assert( var_0 );
        level endon( var_0 );
    }

    for (;;)
    {
        wait(randomfloatrange( 0.15, 0.3 ));
        var_1 = self.origin + ( 0.0, 0.0, 150.0 );
        var_2 = self.origin - ( 0.0, 0.0, 150.0 );
        var_3 = bullettrace( var_1, var_2, 0, undefined );

        if ( var_3["surfacetype"] != "water" )
            continue;

        var_4 = "warlord_water_movement";

        if ( isplayer( self ) )
        {
            if ( distance( self getvelocity(), ( 0.0, 0.0, 0.0 ) ) < 5 )
                var_4 = "water_stop";
        }
        else if ( isdefined( level._effect["water_" + self.a._id_0D2B] ) )
            var_4 = "water_" + self.a._id_0D2B;

        var_5 = common_scripts\utility::getfx( var_4 );
        var_1 = var_3["position"];
        var_6 = ( 0, self.angles[1], 0 );
        var_7 = anglestoforward( var_6 );
        var_8 = anglestoup( var_6 );
        playfx( var_5, var_1, var_8, var_7 );
    }
}

_id_6B91( var_0, var_1, var_2, var_3 )
{
    var_1 endon( "death" );
    var_0 = maps\_utility::_id_0B53( var_0 );
    var_4 = undefined;

    foreach ( var_6 in var_0 )
    {
        if ( isdefined( var_6._id_164F ) && var_6._id_164F == "kicker" )
        {
            var_4 = var_6;
            break;
        }
    }

    if ( !isdefined( var_4 ) )
        var_4 = var_0[0];

    var_0 = common_scripts\utility::array_remove( var_0, var_4 );
    var_8 = var_4 maps\_utility::_id_166F( 1 );
    var_8.allowdeath = 1;

    if ( var_0.size )
        maps\_utility::delaythread( 0.15, ::_id_6B9B, var_0 );

    var_9 = "door_kick_in";
    var_10 = "kick";

    if ( isdefined( var_2.script_noteworthy ) )
    {
        switch ( var_2.script_noteworthy )
        {
            case "wave":
                var_9 = "doorburst_wave";
                var_10 = "door_kick";
                break;
            case "search":
                var_9 = "doorburst_search";
                var_10 = "door_kick";
                break;
            case "fall":
                var_9 = "doorburst_fall";
                var_10 = "door_kick";
                break;
        }
    }

    var_2 thread maps\_anim::_id_11C1( var_8, var_9 );
    var_8 waittillmatch( "single anim", var_10 );
    thread common_scripts\utility::play_sound_in_space( "door_wood_double_kick", var_1.origin );
    var_1 thread _id_6B92( 0.25, 1 );

    if ( isdefined( var_3 ) )
        physicsexplosioncylinder( var_3.origin, var_3.radius, var_3.radius / 2, 1.0 );

    var_8 waittillmatch( "single anim", "end" );

    if ( isalive( var_8 ) )
    {
        if ( isdefined( var_4._id_218E ) && var_4._id_218E > 0 )
            var_8 _id_6B9A();
        else if ( isdefined( var_4.target ) )
        {
            var_11 = getnode( var_4.target, "targetname" );

            if ( isdefined( var_11 ) )
            {
                var_8 _id_6B99( 96 );
                var_8 setgoalnode( var_11 );
                var_8 common_scripts\utility::waittill_notify_or_timeout( "goal", 5 );

                if ( isalive( var_8 ) )
                    var_8 _id_6B97();
            }
        }
    }
}

_id_6B92( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = getent( self.target, "targetname" );
    self linkto( var_2 );
    self connectpaths();
    var_2._id_6B93 = var_2.angles;
    var_2 rotateto( var_2._id_6B94, var_0 );
    var_2 waittill( "rotatedone" );
    self disconnectpaths();
    self unlink();

    if ( var_1 )
    {
        self notsolid();
        thread _id_6B95();
    }

    self notify( "sbmodel_rotatedone" );
}

_id_6B95()
{
    while ( level.player istouching( self ) )
        wait 0.05;

    self solid();
}

_id_6B96( var_0 )
{
    var_1 = getent( self.target, "targetname" );
    self linkto( var_1 );
    self connectpaths();
    var_1 rotateto( var_1._id_6B93, var_0 );
    var_1 waittill( "rotatedone" );
    self disconnectpaths();
    self unlink();
    self notify( "sbmodel_rotatedone" );
}

_id_6B97()
{
    if ( isdefined( self._id_6B98 ) )
        self.goalradius = self._id_6B98;
}

_id_6B99( var_0 )
{
    if ( !isdefined( self._id_6B98 ) )
        self._id_6B98 = self.goalradius;

    self.goalradius = var_0;
}

_id_6B9A()
{
    self setgoalentity( level.player );
}

_id_6B9B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_0 = maps\_utility::_id_0B53( var_0 );
    var_3 = [];

    foreach ( var_7, var_5 in var_0 )
    {
        var_6 = var_5 maps\_utility::_id_166F();
        var_3[var_3.size] = var_6;

        if ( var_2 )
        {
            if ( var_7 != var_0.size - 1 )
                wait(randomfloatrange( 0.25, 1 ));
        }
    }

    if ( var_1 )
    {

    }

    return var_3;
}

_id_6B9C( var_0 )
{
    self takeweapon( var_0 );
    wait 0.1;

    if ( level.player getcurrentweapon() == "none" )
    {
        var_1 = level.player getweaponslistprimaries();
        var_2 = undefined;

        foreach ( var_4 in var_1 )
        {
            var_2 = var_4;
            break;
        }

        if ( !isdefined( var_2 ) )
        {
            var_6 = level.player getweaponslistoffhands();

            foreach ( var_8 in var_6 )
            {
                var_2 = var_8;
                break;
            }
        }

        if ( isdefined( var_2 ) )
            level.player switchtoweapon( var_2 );
    }
}

_id_6B9D( var_0, var_1 )
{
    var_2 = level.player getweaponslistprimaries();
    var_3 = undefined;

    foreach ( var_5 in var_2 )
    {
        if ( var_5 != var_0 )
        {
            if ( !isdefined( var_1 ) || var_1 == var_0 || var_1 == var_5 )
            {
                var_3 = var_5;
                break;
            }
        }
    }

    if ( !isdefined( var_3 ) )
    {
        var_7 = level.player getweaponslistoffhands();

        foreach ( var_9 in var_7 )
        {
            if ( var_9 != var_0 )
            {
                if ( !isdefined( var_1 ) || var_1 == var_0 || var_1 == var_9 )
                {
                    var_3 = var_9;
                    break;
                }
            }
        }
    }

    if ( isdefined( var_3 ) )
        level.player switchtoweaponimmediate( var_3 );
}

_id_6B9E( var_0, var_1 )
{
    if ( isdefined( var_0 ) && var_0 > 0 )
        wait(var_0);

    var_2 = [ self, var_1 ];
    maps\_audio::aud_send_msg( "door_open_slow", var_2 );
    self rotateto( self.angles + ( 0.0, 70.0, 0.0 ), 2, 0.5, 0 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, 40.0, 0.0 ), 2, 0, 2 );
}

_id_6B9F( var_0, var_1 )
{
    if ( isdefined( var_0 ) && var_0 > 0 )
        wait(var_0);

    var_2 = [ self, var_1 ];
    maps\_audio::aud_send_msg( "door_open_slow_wide", var_2 );
    self rotateto( self.angles + ( 0.0, 70.0, 0.0 ), 2, 0.5, 0 );
    self connectpaths();
    self waittill( "rotatedone" );
    self rotateto( self.angles + ( 0.0, 100.0, 0.0 ), 2, 0, 2 );
}

_id_6BA0()
{
    self rotateto( self.angles - ( 0.0, 170.0, 0.0 ), 0.1 );
    self waittill( "rotatedone" );
    self disconnectpaths();
}

_id_6BA1( var_0, var_1, var_2 )
{
    var_3 = randomint( var_0.size );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = ( var_4 + var_3 ) % var_0.size;
        var_6 = var_0[var_5];

        if ( !isalive( var_6 ) )
            continue;

        var_6 thread _id_6BA2( var_1, var_2 );
    }

    level waittill( "all_targets_killed" );
}

_id_6BA2( var_0, var_1 )
{
    self endon( "death" );
    level endon( "all_targets_killed" );
    var_2 = 1;

    while ( var_2 )
    {
        var_3 = undefined;
        var_2 = 0;
        var_4 = randomint( var_0.size );

        for ( var_5 = 0; var_5 < var_0.size; var_5++ )
        {
            var_6 = ( var_5 + var_4 ) % var_0.size;
            var_7 = var_0[var_6];

            if ( isalive( var_7 ) )
            {
                var_2 = 1;

                if ( !isdefined( var_3 ) )
                    var_3 = var_7;

                if ( !isdefined( var_7._id_6BA3 ) )
                {
                    var_3 = var_7;
                    break;
                }
            }
        }

        if ( isdefined( var_3 ) )
        {
            var_3._id_6BA3 = 1;
            self.a._id_0AA7 = 0;
            _id_6BA4( var_3 );

            if ( isdefined( var_1 ) && var_1 > 0 )
                wait(var_1);
        }
    }

    level notify( "all_targets_killed" );
}

_id_6BA4( var_0 )
{
    if ( isalive( var_0 ) )
    {
        self.alertlevel = "combat";
        var_1 = self._id_20AF;
        var_0._id_0FA0 = undefined;
        _id_6BA7( "dontevershoot" );
        _id_6BA7( "ignoreall" );
        self._id_20AF = 5000;
        self.favoriteenemy = var_0;
        var_0 waittill( "death" );
        self._id_20AF = var_1;
        self.favoriteenemy = undefined;
        _id_6BA5( "ignoreall" );
        _id_6BA5( "dontevershoot" );
    }
}

_id_6BA5( var_0 )
{
    if ( !isdefined( self._id_6BA6 ) )
        self._id_6BA6 = [];

    if ( !isdefined( self._id_6BA6[var_0] ) )
        self._id_6BA6[var_0] = 1;
    else
        self._id_6BA6[var_0]++;

    _id_6BA8( var_0 );
}

_id_6BA7( var_0 )
{
    if ( !isdefined( self._id_6BA6 ) )
        self._id_6BA6 = [];

    if ( !isdefined( self._id_6BA6[var_0] ) )
        self._id_6BA6[var_0] = -1;
    else
        self._id_6BA6[var_0]--;

    _id_6BA8( var_0 );
}

_id_6BA8( var_0 )
{
    if ( !isdefined( self._id_6BA6 ) )
        self._id_6BA6 = [];

    if ( !isdefined( self._id_6BA6[var_0] ) )
        self._id_6BA6[var_0] = 0;

    if ( self._id_6BA6[var_0] > 0 )
    {
        switch ( var_0 )
        {
            case "dontevershoot":
                self._id_0F9F = 1;
                break;
            case "ignoreall":
                self.ignoreall = 1;
                break;
            case "no_pistol_switch":
                self._id_1151 = 1;
                break;
            case "ignoreme":
                if ( isdefined( self._id_0D1B ) )
                    self._id_0D1D = 1;

                self.ignoreme = 1;
                break;
            case "TurretFireDisable":
                self turretfiredisable();
                break;
            default:
                break;
        }
    }
    else
    {
        switch ( var_0 )
        {
            case "dontevershoot":
                self._id_0F9F = undefined;
                break;
            case "ignoreall":
                self.ignoreall = 0;
                break;
            case "no_pistol_switch":
                self._id_1151 = undefined;
                break;
            case "ignoreme":
                if ( isdefined( self._id_0D1B ) )
                    self._id_0D1D = undefined;
                else
                    self.ignoreme = 0;

                break;
            case "TurretFireDisable":
                self turretfireenable();
                break;
            default:
                break;
        }
    }
}

_id_4E96()
{
    self notify( "start_dynamic_run_speed" );
    self endon( "death" );
    self endon( "stop_dynamic_run_speed" );
    self endon( "start_dynamic_run_speed" );

    if ( maps\_utility::_id_133C( "_stealth_custom_anim" ) )
        maps\_utility::_id_13DB( "_stealth_custom_anim" );

    self._id_1403 = "";
    _id_4E99();
    var_0 = 144;
    var_1 = [ "sprint", "run" ];
    var_2 = [];
    var_2["player_sprint"]["sprint"][0] = 225 * var_0;
    var_2["player_sprint"]["sprint"][1] = 900 * var_0;
    var_2["player_sprint"]["run"][0] = 900 * var_0;
    var_2["player_sprint"]["run"][1] = 900 * var_0;
    var_2["player_run"]["sprint"][0] = 225 * var_0;
    var_2["player_run"]["sprint"][1] = 400 * var_0;
    var_2["player_run"]["run"][0] = 400 * var_0;
    var_2["player_run"]["run"][1] = 625 * var_0;
    var_2["player_crouch"]["run"][0] = 4 * var_0;
    var_2["player_crouch"]["run"][1] = 100 * var_0;
    var_3 = 123;
    var_4 = 189;
    var_5 = 283;

    for (;;)
    {
        wait 0.2;

        if ( isdefined( self._id_4E97 ) )
        {
            _id_4E9A( self._id_4E97 );
            continue;
        }

        var_6 = vectornormalize( anglestoforward( self.angles ) );
        var_7 = vectornormalize( self.origin - level.player.origin );
        var_8 = vectordot( var_6, var_7 );
        var_9 = distancesquared( self.origin, level.player.origin );

        if ( isdefined( self._id_109A ) && self._id_109A )
            self._id_0FC6 = 1;

        if ( common_scripts\utility::flag_exist( "_stealth_spotted" ) && common_scripts\utility::flag( "_stealth_spotted" ) )
        {
            _id_4E9A( "run" );
            continue;
        }

        if ( var_8 < -0.25 && var_9 > 225 * var_0 )
        {
            _id_4E9A( "sprint" );
            continue;
        }

        _id_4E9A( "cqb" );
    }
}

_id_4E98()
{
    self endon( "death" );
    self notify( "stop_dynamic_run_speed" );
    _id_4E99();
}

_id_4E99()
{
    self endon( "death" );
    maps\_utility::_id_109E();
    self._id_0FC6 = 1;
    maps\_utility::_id_140C();
    self notify( "stop_loop" );
}

_id_4E9A( var_0 )
{
    if ( self._id_1403 == var_0 )
        return;

    self._id_1403 = var_0;

    switch ( var_0 )
    {
        case "sprint":
            if ( isdefined( self._id_109A ) && self._id_109A )
                self._id_0FC6 = 1;
            else
                self._id_0FC6 = 1.15;

            maps\_utility::_id_140B( "DRS_sprint" );
            maps\_utility::_id_109E();
            self notify( "stop_loop" );
            break;
        case "run":
            self._id_0FC6 = 1;
            maps\_utility::_id_140C();
            maps\_utility::_id_109E();
            self notify( "stop_loop" );
            break;
        case "jog":
            self._id_0FC6 = 1;
            maps\_utility::_id_140B( "DRS_combat_jog" );
            maps\_utility::_id_109E();
            self notify( "stop_loop" );
            break;
        case "cqb":
            self._id_0FC6 = 1;
            maps\_utility::_id_109B();
            self notify( "stop_loop" );
            break;
    }
}

_id_6BA9( var_0, var_1, var_2, var_3 )
{
    if ( isarray( var_0 ) )
    {
        var_4 = 1;

        foreach ( var_6 in var_0 )
            var_4 = var_4 && _id_6BAA( var_6, var_1, var_2, var_3 );

        return var_4;
    }
    else
        return _id_6BAA( var_0, var_1, var_2, var_3 );
}

_id_6BAA( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\_anim::_id_1202( var_2 );
    var_5 = var_4["origin"];
    var_6 = var_4["angles"];

    if ( isdefined( var_3 ) )
        var_7 = var_3;
    else
        var_7 = var_0._id_1032;

    if ( isdefined( level._id_0C59[var_7][var_1] ) )
    {
        if ( isarray( level._id_0C59[var_7][var_1] ) )
            var_8 = getstartorigin( var_5, var_6, level._id_0C59[var_7][var_1][0] );
        else
            var_8 = getstartorigin( var_5, var_6, level._id_0C59[var_7][var_1] );
    }
    else
        var_8 = var_5;

    var_9 = 54.0;
    var_10 = distancesquared( var_0.origin, var_8 );

    if ( var_10 > var_9 * var_9 )
        return 0;

    return 1;
}

_id_460E()
{
    self.ignoreall = 1;
    self._id_100A = 1;
    self._id_460D = self.suppressionwait;
    self.suppressionwait = 0;
    maps\_utility::_id_0EEC();
    self.ignorerandombulletdamage = 1;
    maps\_utility::_id_2714();
    maps\_utility::_id_1057();
    maps\_utility::_id_280D();
    self.grenadeawareness = 0;
    self.ignoreme = 1;
    maps\_utility::_id_27CC();
    self._id_1106 = 1;
}

_id_4BF4()
{
    return self._id_4B64;
}

_id_460C()
{
    self.ignoreall = 0;
    self._id_100A = undefined;
    self.suppressionwait = self._id_460D;
    self._id_460D = undefined;
    maps\_utility::_id_27B8();
    self.ignorerandombulletdamage = 0;
    maps\_utility::_id_2715();
    maps\_utility::_id_1071();
    self.grenadeawareness = 1;
    self.ignoreme = 0;
    maps\_utility::_id_27CD();
    self._id_1106 = undefined;
}

_id_6BAB()
{
    foreach ( var_1 in self._id_0A39 )
    {
        if ( var_1._id_2252 == 0 )
            return var_1;
    }

    return undefined;
}

_id_6BAC( var_0, var_1 )
{
    var_2 = distance( level.player.origin, self.origin );

    while ( animscripts\utility::_id_0C95() || var_2 < 1024 && maps\_utility::within_fov( level.player.origin, level.player getplayerangles(), self.origin, level.cosine["45"] ) )
        wait 0.5;

    thread maps\_utility::_id_104A( var_0, var_1 );
}

_id_6BAD()
{
    var_0 = getentarray( "trigger_bullet_penetrate", "targetname" );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
            var_2 thread _id_6BAE();
    }
}

_id_6BAE()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = var_1.origin - var_0.origin;
    var_3 = length( var_2 );
    var_4 = vectornormalize( var_2 );

    for (;;)
    {
        self waittill( "damage", var_5, var_6, var_7, var_8, var_9 );

        if ( var_9 == "MOD_PISTOL_BULLET" || var_9 == "MOD_RIFLE_BULLET" )
        {
            if ( !isdefined( var_6 ) )
                continue;

            var_10 = var_6 geteye();
            var_11 = vectordot( var_7, var_4 );
            var_12 = undefined;
            var_13 = undefined;

            if ( var_11 > 0 )
            {
                var_12 = _id_6BAF( var_0.origin, var_4, var_10, var_7 );

                if ( isdefined( var_12 ) )
                    var_13 = _id_6BAF( var_1.origin, var_4, var_12, var_7 );
            }
            else
            {
                var_14 = var_4 * -1;
                var_12 = _id_6BAF( var_1.origin, var_14, var_10, var_7 );

                if ( isdefined( var_12 ) )
                    var_13 = _id_6BAF( var_0.origin, var_14, var_12, var_7 );
            }

            if ( isdefined( var_13 ) )
            {
                var_15 = var_13 + var_7 * 1024;
                var_16 = undefined;
                var_17 = "ak47";

                if ( var_6 == level.player )
                    var_16 = level.player;

                if ( isdefined( var_6.weapon ) )
                    var_17 = var_6.weapon;

                if ( isdefined( var_16 ) )
                    magicbullet( var_17, var_13, var_15, var_16 );
                else
                    magicbullet( var_17, var_13, var_15 );
            }
        }
    }
}

_id_6BAF( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0 - var_2;
    var_5 = vectordot( var_4, var_1 );
    var_6 = vectordot( var_3, var_1 );

    if ( var_6 != 0 )
    {
        var_7 = var_5 / var_6;
        var_8 = var_2 + var_3 * var_7;
        return var_8;
    }

    return undefined;
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
    var_1[0] = "j_head";
    thread _id_50B6( var_1[0], undefined );
    self dodamage( self.health + 50, self.origin );
}

_id_50B6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._effect["bodyshot"];

    playfxontag( var_1, self, var_0 );
}

_id_45FD( var_0 )
{
    var_1 = level.scr_sound[self._id_1032][var_0];
    maps\_audio::_id_170B( var_1 );
}

_id_45FF( var_0 )
{
    var_1 = level.scr_sound[self._id_1032][var_0];
    return maps\_audio::_id_170D( var_1 );
}

_id_6BB0( var_0, var_1, var_2 )
{
    level endon( var_2 );

    if ( !isdefined( level._id_6BB1 ) )
        level._id_6BB1 = [];

    var_3 = level._id_6BB1.size;
    level._id_6BB1[var_3] = 0;
    var_4 = getentarray( var_0, "targetname" );

    foreach ( var_6 in var_4 )
        var_6 thread _id_6BB2( var_3, var_2 );

    for (;;)
    {
        level waittill( "flag_trigger_count_update", var_3 );
        waittillframeend;

        if ( level._id_6BB1[var_3] > 0 )
        {
            common_scripts\utility::flag_set( var_1 );
            continue;
        }

        common_scripts\utility::flag_clear( var_1 );
    }
}

_id_6BB2( var_0, var_1 )
{
    level endon( var_1 );

    for (;;)
    {
        self waittill( "trigger" );
        level._id_6BB1[var_0]++;
        level notify( "flag_trigger_count_update", var_0 );

        while ( level.player istouching( self ) )
            wait 0.1;

        level._id_6BB1[var_0]--;
        level notify( "flag_trigger_count_update", var_0 );
    }
}

_id_01F2()
{
    var_0 = 0.25;

    for ( var_1 = 0; var_1 < var_0; var_1 += 0.05 )
    {
        level.player playrumbleonentity( "falling_land" );
        wait 0.05;
    }

    stopallrumbles();
}
