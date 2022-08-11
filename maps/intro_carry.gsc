// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4068()
{
    _id_4069();
}
#using_animtree("generic_human");

_id_4069()
{
    level._id_0C59["soap"]["wounded_idle"][0] = %intro_fireman_carry_lie_idle_carried;
    level._id_0C59["soap"]["pickup_wounded"] = %intro_fireman_carry_lift_guy_carried;
    level._id_0C59["nikolai"]["pickup_carrier"] = %intro_fireman_carry_lift_guy_carrier;
    level._id_0C59["soap"]["wounded_walk_loop"][0] = %wounded_carry_fastwalk_wounded_relative;
    level._id_0C59["nikolai"]["carrier_walk_loop"] = %wounded_carry_fastwalk_carrier;
    level._id_0C59["nikolai"]["carrier_stairs_down_loop"] = %intro_fireman_carry_stairs_carrier;
    level._id_0C59["soap"]["putdown_wounded"] = %intro_fireman_carry_drop_guy_carried;
    level._id_0C59["nikolai"]["putdown_carrier"] = %intro_fireman_carry_drop_guy_carrier;
    level._id_0C59["soap"]["carry_idle"][0] = %intro_fireman_carry_idle_carried;
    level._id_0C59["nikolai"]["carry_idle"][0] = %intro_fireman_carry_idle_carrier;
    level._id_6F1C = spawnstruct();
    _id_6F1D();
}

_id_6F1D()
{
    level._id_6F1C._id_4069 = [];
    level._id_6F1C._id_4069["wounded_idle"] = "wounded_idle";
    level._id_6F1C._id_4069["pickup_wounded"] = "pickup_wounded";
    level._id_6F1C._id_4069["pickup_carrier"] = "pickup_carrier";
    level._id_6F1C._id_4069["putdown_wounded"] = "putdown_wounded";
    level._id_6F1C._id_4069["putdown_carrier"] = "putdown_carrier";
}

_id_6F1E( var_0, var_1 )
{
    level._id_6F1C._id_4069[var_0] = var_1;
}

_id_6F1F( var_0 )
{
    return level._id_6F1C._id_4069[var_0];
}

_id_406A( var_0 )
{
    self._id_406B = var_0;
    self._id_406B thread maps\_anim::_id_124E( self, _id_6F1F( "wounded_idle" ), "stop_wounded_idle" );
}

_id_6F20()
{
    self endon( "stop_carry_by_color" );
    var_0 = "c";
    var_1 = "allies";

    for (;;)
    {
        if ( isdefined( level._id_1346[var_1][var_0] ) )
        {
            var_2 = level._id_1346[var_1][var_0];
            level._id_6F21 = level._id_133E[var_1][var_2][0];
        }

        wait 0.1;
    }
}

_id_6F22( var_0, var_1 )
{
    self endon( "stop_wounded_node_monitor" );
    level._id_6F23 = var_1;
    level._id_6F21 = var_1;

    for (;;)
    {
        if ( isdefined( self._id_6F24 ) )
        {
            if ( level._id_6F23 != level._id_6F21 )
            {
                level._id_6F23 = level._id_6F21;

                if ( !isdefined( level._id_6F23.type ) )
                    self setgoalpos( level._id_6F23.origin );
                else
                    self setgoalnode( level._id_6F23 );

                thread _id_6F28( var_0 );
            }
        }

        if ( !isdefined( var_0._id_6F25 ) )
        {
            if ( level._id_6F23 != level._id_6F21 )
            {
                level._id_6F23 = level._id_6F21;
                thread _id_6F26( var_0, level._id_6F23 );
            }
        }

        wait 0.05;
    }
}

_id_6F26( var_0, var_1 )
{
    var_0._id_6F25 = 1;
    _id_406F( var_0, var_1 );
    _id_4071( var_0, var_1 );
}

_id_406F( var_0, var_1 )
{
    self endon( "end_carry_ai" );

    if ( !var_0._id_406B maps\intro_utility::_id_6BA9( self, _id_6F1F( "pickup_carrier" ), undefined, self._id_1032, 10 ) )
        var_0._id_406B maps\_anim::_id_124A( self, _id_6F1F( "pickup_carrier" ) );

    var_0 notify( "stop_wounded_idle" );
    var_0._id_406B notify( "stop_wounded_idle" );
    var_0._id_406B thread maps\_anim::_id_1246( var_0, _id_6F1F( "pickup_wounded" ) );
    var_0._id_406B maps\_anim::_id_1246( self, _id_6F1F( "pickup_carrier" ) );
    self._id_100A = 1;
    var_0 notsolid();
    thread _id_6F2C( var_0 );
    self notify( "carry_picked_up" );
}

_id_4071( var_0, var_1 )
{
    self endon( "end_carry_ai" );
    wait 0.05;
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    self animmode( "none" );
    self.allowpain = 0;
    self._id_0EEE = 1;
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.grenadeawareness = 0;
    maps\_utility::_id_1058( 1 );
    self._id_1099 = 1;
    self._id_117F = 1;
    self._id_1199 = 1;
    self.nododgemove = 1;
    maps\_utility::_id_109E();
    self._id_4073 = self.goalradius;
    self pushplayer( 1 );

    if ( isdefined( level._id_6F23 ) )
    {
        self.ignoresuppression = 1;
        self._id_117F = 1;
        self.goalradius = 128;

        if ( !isdefined( level._id_6F23.type ) )
        {
            self setgoalpos( level._id_6F23.origin );
            self.goalradius = 10;
        }
        else
        {
            self setgoalnode( level._id_6F23 );

            if ( isdefined( level._id_6F27 ) )
                self.goalradius = 10;
            else
                self.goalradius = 128;
        }

        self._id_6F24 = 1;
        thread _id_6F28( var_0 );
    }
}

_id_6F28( var_0 )
{
    self notify( "new_carrier_goal" );
    self endon( "new_carrier_goal" );
    self waittill( "goal" );

    if ( isdefined( level._id_6F27 ) )
        return;

    if ( isdefined( level._id_6F23.script_noteworthy ) && level._id_6F23.script_noteworthy == "no_putdown" )
        return;

    self._id_6F24 = undefined;

    if ( isdefined( level._id_6F23.script_noteworthy ) && level._id_6F23.script_noteworthy == "maars_control_load_helicopter" )
    {
        common_scripts\utility::flag_set( "maars_control_loading_helicopter" );
        _id_6F2A( var_0 );
    }
    else
        _id_6F29( var_0 );

    if ( isdefined( var_0._id_6F25 ) )
        var_0._id_6F25 = undefined;
}

_id_6F29( var_0 )
{
    level._id_6F23 maps\_anim::_id_124A( self, _id_6F1F( "putdown_carrier" ) );
    var_0._id_406B = level._id_6F23;
    thread _id_6F34( var_0 );
    self.ignoresuppression = 0;
    self._id_117F = 0;
    self.goalradius = self._id_4073;
    var_0._id_406B thread maps\_anim::_id_1246( self, _id_6F1F( "putdown_carrier" ) );
    var_0._id_406B maps\_anim::_id_1246( var_0, _id_6F1F( "putdown_wounded" ) );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    self.allowpain = 1;
    self._id_0EEE = 0;
    self.ignoreall = 0;
    self.grenadeawareness = 1;
    maps\_utility::_id_1058( 0 );
    self._id_100A = undefined;
    self._id_1099 = undefined;
    self._id_117F = undefined;
    self._id_1199 = undefined;
    self.nododgemove = 0;
    self pushplayer( 0 );
    var_0 solid();
    var_0._id_406B thread maps\_anim::_id_124E( var_0, _id_6F1F( "wounded_idle" ), "stop_wounded_idle" );
    var_0 notify( "stop_putdown" );
}

_id_6F2A( var_0 )
{
    level._id_6F23 = common_scripts\utility::getstruct( level._id_6F23.script_noteworthy, "targetname" );
    self notify( "stop_wouned_node_monitor" );
    level._id_6F23 maps\_anim::_id_124A( self, "intro_ugv_helicopter" );
    var_0._id_406B = level._id_6F23;
    thread _id_6F34( var_0 );
    self.ignoresuppression = 0;
    self._id_117F = 0;
    self.goalradius = self._id_4073;
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "maars_control_soap_at_helicopter" );
    thread _id_6F2B( var_0 );
    var_0._id_406B maps\_anim::_id_1246( var_0, "intro_ugv_helicopter" );
    var_0 solid();
    var_0._id_406B thread maps\_anim::_id_124E( var_0, "intro_ugv_helicopter_idle", "stop_wounded_idle" );
    var_0 notify( "stop_putdown" );
}

_id_6F2B( var_0 )
{
    var_0._id_406B maps\_anim::_id_1246( self, "intro_ugv_helicopter" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    self.allowpain = 1;
    self._id_0EEE = 0;
    self.ignoreall = 0;
    self.grenadeawareness = 1;
    maps\_utility::_id_1058( 0 );
    self._id_100A = undefined;
    self._id_1099 = undefined;
    self._id_117F = undefined;
    self._id_1199 = undefined;
    self.nododgemove = 0;
    self pushplayer( 0 );
    var_0._id_406B thread maps\_anim::_id_124E( self, "intro_ugv_helicopter_idle", "stop_wounded_idle" );
}

_id_6F2C( var_0 )
{
    self endon( "death" );
    self endon( "stop_carry_wounded_anims" );
    var_0 endon( "death" );
    var_0 linkto( self, "tag_origin" );
    thread _id_6F33( var_0 );
    thread _id_6F2F();

    for (;;)
    {
        if ( !isdefined( self._id_6F2D ) || self._id_6F2D != self.movemode )
        {
            if ( self.movemode == "stop" || self.movemode == "stop_soon" )
            {
                if ( !isdefined( var_0._id_6F2E ) )
                {
                    var_0._id_6F2E = 1;
                    thread _id_6F30( var_0 );
                }
            }
            else if ( isdefined( var_0._id_6F2E ) )
            {
                var_0._id_6F2E = undefined;
                self notify( "stop_carry_idle" );
                var_0 thread maps\_anim::_id_124E( var_0, "wounded_walk_loop", "stop_wounded_walk_loop" );
            }
        }

        self._id_6F2D = self.movemode;
        wait 0.05;
    }
}

_id_6F2F()
{
    self endon( "stop_specialidle" );

    for (;;)
    {
        thread maps\_utility::_id_26FB( "carry_idle" );
        self._id_10F7 = 1;
        self waittill( "clearing_specialIdleAnim" );
    }
}

_id_6F30( var_0 )
{
    var_0 notify( "stop_wounded_walk_loop" );
    self._id_10F7 = 1;
    thread maps\_anim::_id_124E( var_0, "carry_idle", "stop_carry_idle" );
    thread _id_6F31( var_0 );
}

_id_6F31( var_0 )
{
    self endon( "stop_carry_idle" );
    var_1 = maps\_utility::_id_1281( "carry_idle" );
    var_2 = var_1[0];
    var_3 = var_0 maps\_utility::_id_1281( "carry_idle" );
    var_4 = var_3[0];

    for (;;)
    {
        var_5 = self getanimtime( var_2 );

        if ( isdefined( var_5 ) && var_5 > 0 )
        {
            var_0 setanimtime( var_4, var_5 );
            break;
        }

        wait 0.05;
    }
}

_id_6F32( var_0 )
{
    level._id_6F21 = var_0;
}

_id_6F33( var_0 )
{
    self endon( "death" );
    self endon( "stop_move_wounded_anims" );
    thread maps\_utility::_id_26F7( "carrier_walk_loop", 1 );
    var_1 = self.stairsstate;

    for (;;)
    {
        if ( var_1 != self.stairsstate )
        {
            if ( self.stairsstate == "none" )
                thread maps\_utility::_id_26F7( "carrier_walk_loop", 1 );
            else if ( self.stairsstate == "up" )
                thread maps\_utility::_id_26F7( "carrier_walk_loop", 1 );
            else if ( self.stairsstate == "down" )
                thread maps\_utility::_id_26F7( "carrier_stairs_down_loop", 1 );

            var_1 = self.stairsstate;
            self notify( "move_loop_restart" );
        }

        wait 0.05;
    }
}

_id_6F34( var_0 )
{
    self notify( "stop_carry_wounded_anims" );
    self notify( "stop_move_wounded_anims" );
    thread maps\_utility::_id_140C();

    if ( isdefined( self._id_10F6 ) )
    {
        self._id_10F6 = undefined;
        self notify( "stop_specialidle" );
    }

    var_0 notify( "stop_wounded_walk_loop" );
    self notify( "stop_carry_idle" );
    self._id_6F2D = undefined;
    var_0._id_6F2E = undefined;

    if ( var_0 islinked() )
        var_0 unlink();
}

_id_6F35( var_0, var_1, var_2 )
{
    level notify( "color_volume_advance_stop" );
    thread _id_6F34( var_0 );
    var_0._id_6F25 = undefined;
    var_0._id_6F2E = undefined;
    var_0 notify( "stop_wounded_idle" );
    var_0._id_406B notify( "stop_wounded_idle" );
    var_0 maps\_utility::_id_1414();
    var_0 _id_406A( var_1 );
    var_0 solid();
    self notify( "end_carry_ai" );
    maps\_utility::_id_1414();
    self._id_6F24 = undefined;
    self.ignoresuppression = 0;
    self._id_117F = 0;
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    self.allowpain = 1;
    self._id_0EEE = 0;
    self.ignoreall = 0;
    self.grenadeawareness = 1;
    maps\_utility::_id_1058( 0 );
    self._id_100A = undefined;
    self._id_1099 = undefined;
    self._id_117F = undefined;
    self._id_1199 = undefined;
    self.nododgemove = 0;
    self pushplayer( 0 );
    level._id_6F23 = level._id_6F21;
    self forceteleport( var_2.origin, var_2.angles );
    maps\_utility::_id_1237( var_2.origin );
}
