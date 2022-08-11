// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

initstingerusage()
{
    self.stingerstage = undefined;
    self.stingertarget = undefined;
    self.stingerlockstarttime = undefined;
    self.stingerlostsightlinetime = undefined;
    thread resetstingerlockingondeath();
    level.stingertargets = [];
}

resetstingerlocking()
{
    if ( !isdefined( self.stingeruseentered ) )
        return;

    self.stingeruseentered = undefined;
    self notify( "stop_javelin_locking_feedback" );
    self notify( "stop_javelin_locked_feedback" );
    self weaponlockfree();
    initstingerusage();
}

resetstingerlockingondeath()
{
    self endon( "disconnect" );
    self notify( "ResetStingerLockingOnDeath" );
    self endon( "ResetStingerLockingOnDeath" );

    for (;;)
    {
        self waittill( "death" );
        resetstingerlocking();
    }
}

stillvalidstingerlock( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !self worldpointinreticle_circle( var_0.origin, 65, 85 ) )
        return 0;

    if ( self.stingertarget == level.ac130.planemodel && !isdefined( level.ac130player ) )
        return 0;

    return 1;
}

loopstingerlockingfeedback()
{
    self endon( "stop_javelin_locking_feedback" );

    for (;;)
    {
        if ( isdefined( level.chopper ) && isdefined( level.chopper.gunner ) && isdefined( self.stingertarget ) && self.stingertarget == level.chopper.gunner )
            level.chopper.gunner playlocalsound( "missile_locking" );

        if ( isdefined( level.ac130player ) && isdefined( self.stingertarget ) && self.stingertarget == level.ac130.planemodel )
            level.ac130player playlocalsound( "missile_locking" );

        self playlocalsound( "stinger_locking" );
        self playrumbleonentity( "ac130_25mm_fire" );
        wait 0.6;
    }
}

loopstingerlockedfeedback()
{
    self endon( "stop_javelin_locked_feedback" );

    for (;;)
    {
        if ( isdefined( level.chopper ) && isdefined( level.chopper.gunner ) && isdefined( self.stingertarget ) && self.stingertarget == level.chopper.gunner )
            level.chopper.gunner playlocalsound( "missile_locking" );

        if ( isdefined( level.ac130player ) && isdefined( self.stingertarget ) && self.stingertarget == level.ac130.planemodel )
            level.ac130player playlocalsound( "missile_locking" );

        self playlocalsound( "stinger_locked" );
        self playrumbleonentity( "ac130_25mm_fire" );
        wait 0.25;
    }
}

locksighttest( var_0 )
{
    var_1 = self geteye();

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = sighttracepassed( var_1, var_0.origin, 0, var_0 );

    if ( var_2 )
        return 1;

    var_3 = var_0 getpointinbounds( 1, 0, 0 );
    var_2 = sighttracepassed( var_1, var_3, 0, var_0 );

    if ( var_2 )
        return 1;

    var_4 = var_0 getpointinbounds( -1, 0, 0 );
    var_2 = sighttracepassed( var_1, var_4, 0, var_0 );

    if ( var_2 )
        return 1;

    return 0;
}

stingerdebugdraw( var_0 )
{

}

softsighttest()
{
    var_0 = 500;

    if ( locksighttest( self.stingertarget ) )
    {
        self.stingerlostsightlinetime = 0;
        return 1;
    }

    if ( self.stingerlostsightlinetime == 0 )
        self.stingerlostsightlinetime = gettime();

    var_1 = gettime() - self.stingerlostsightlinetime;

    if ( var_1 >= var_0 )
    {
        resetstingerlocking();
        return 0;
    }

    return 1;
}

gettargetlist()
{
    var_0 = [];

    if ( level.teambased )
    {
        if ( isdefined( level.chopper ) && ( level.chopper.team != self.team || level.chopper.owner == self ) )
            var_0[var_0.size] = level.chopper;

        if ( isdefined( level.ac130player ) && level.ac130player.team != self.team )
            var_0[var_0.size] = level.ac130.planemodel;

        if ( isdefined( level.harriers ) )
        {
            foreach ( var_2 in level.harriers )
            {
                if ( isdefined( var_2 ) && ( var_2.team != self.team || isdefined( var_2.owner ) && var_2.owner == self ) )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( level.uavmodels[level.otherteam[self.team]].size )
        {
            foreach ( var_5 in level.uavmodels[level.otherteam[self.team]] )
                var_0[var_0.size] = var_5;
        }

        if ( isdefined( level.littlebirds ) )
        {
            foreach ( var_8 in level.littlebirds )
            {
                if ( !isdefined( var_8 ) )
                    continue;

                if ( self.team != var_8.owner.team || self == var_8.owner )
                    var_0[var_0.size] = var_8;
            }
        }

        if ( isdefined( level.ugvs ) )
        {
            foreach ( var_11 in level.ugvs )
            {
                if ( !isdefined( var_11 ) )
                    continue;

                if ( self.team != var_11.owner.team || self == var_11.owner )
                    var_0[var_0.size] = var_11;
            }
        }
    }
    else
    {
        if ( isdefined( level.chopper ) )
            var_0[var_0.size] = level.chopper;

        if ( isdefined( level.ac130player ) )
            var_0[var_0.size] = level.ac130.planemodel;

        if ( isdefined( level.harriers ) )
        {
            foreach ( var_2 in level.harriers )
            {
                if ( isdefined( var_2 ) )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( level.uavmodels.size )
        {
            foreach ( var_16, var_5 in level.uavmodels )
            {
                if ( isdefined( var_5.owner ) && var_5.owner == self )
                    continue;

                var_0[var_0.size] = var_5;
            }
        }

        if ( isdefined( level.littlebirds ) )
        {
            foreach ( var_8 in level.littlebirds )
            {
                if ( !isdefined( var_8 ) )
                    continue;

                var_0[var_0.size] = var_8;
            }
        }

        if ( isdefined( level.ugvs ) )
        {
            foreach ( var_11 in level.ugvs )
            {
                if ( !isdefined( var_11 ) )
                    continue;

                var_0[var_0.size] = var_11;
            }
        }

        foreach ( var_22 in level.players )
        {
            if ( !isalive( var_22 ) )
                continue;

            if ( level.teambased && var_22.team == self.team )
                continue;

            if ( var_22 == self )
                continue;

            if ( var_22 maps\mp\_utility::isjuggernaut() )
                var_0[var_0.size] = var_22;
        }
    }

    return var_0;
}

stingerusageloop()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 1000;
    initstingerusage();

    for (;;)
    {
        wait 0.05;
        var_1 = self getcurrentweapon();

        if ( var_1 != "stinger_mp" && var_1 != "at4_mp" && var_1 != "iw5_smaw_mp" )
        {
            resetstingerlocking();
            continue;
        }

        if ( self playerads() < 0.95 )
        {
            resetstingerlocking();
            continue;
        }

        self.stingeruseentered = 1;

        if ( !isdefined( self.stingerstage ) )
            self.stingerstage = 0;

        stingerdebugdraw( self.stingertarget );

        if ( self.stingerstage == 0 )
        {
            var_2 = gettargetlist();

            if ( var_2.size == 0 )
                continue;

            var_3 = [];

            foreach ( var_5 in var_2 )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                var_6 = self worldpointinreticle_circle( var_5.origin, 65, 75 );

                if ( var_6 )
                    var_3[var_3.size] = var_5;
            }

            if ( var_3.size == 0 )
                continue;

            var_8 = sortbydistance( var_3, self.origin );

            if ( !locksighttest( var_8[0] ) )
                continue;

            thread loopstingerlockingfeedback();
            self.stingertarget = var_8[0];
            self.stingerlockstarttime = gettime();
            self.stingerstage = 1;
            self.stingerlostsightlinetime = 0;
        }

        if ( self.stingerstage == 1 )
        {
            if ( !stillvalidstingerlock( self.stingertarget ) )
            {
                resetstingerlocking();
                continue;
            }

            var_9 = softsighttest();

            if ( !var_9 )
                continue;

            var_10 = gettime() - self.stingerlockstarttime;

            if ( maps\mp\_utility::_hasperk( "specialty_fasterlockon" ) )
            {
                if ( var_10 < var_0 * 0.5 )
                    continue;
            }
            else if ( var_10 < var_0 )
                continue;

            self notify( "stop_javelin_locking_feedback" );
            thread loopstingerlockedfeedback();

            if ( self.stingertarget.model == "vehicle_av8b_harrier_jet_opfor_mp" || self.stingertarget.model == "vehicle_av8b_harrier_jet_mp" || self.stingertarget.model == "vehicle_little_bird_armed" )
                self weaponlockfinalize( self.stingertarget );
            else if ( isplayer( self.stingertarget ) )
                self weaponlockfinalize( self.stingertarget, ( 100.0, 0.0, 64.0 ) );
            else
                self weaponlockfinalize( self.stingertarget, ( 100.0, 0.0, -32.0 ) );

            self.stingerstage = 2;
        }

        if ( self.stingerstage == 2 )
        {
            var_9 = softsighttest();

            if ( !var_9 )
                continue;

            if ( !stillvalidstingerlock( self.stingertarget ) )
            {
                resetstingerlocking();
                continue;
            }
        }
    }
}
