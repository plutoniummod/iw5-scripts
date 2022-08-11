// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

initjavelinusage()
{
    self.javelinstage = undefined;
    self.javelinpoints = undefined;
    self.javelinnormals = undefined;
    self.javelinlockmisses = undefined;
    self.javelintargetpoint = undefined;
    self.javelintargetnormal = undefined;
    self.javelinlockstarttime = undefined;
}

resetjavelinlocking()
{
    if ( !isdefined( self.javelinuseentered ) )
        return;

    self.javelinuseentered = undefined;
    self notify( "stop_lockon_sound" );
    self weaponlockfree();
    self weaponlocktargettooclose( 0 );
    self weaponlocknoclearance( 0 );
    self.currentlylocking = 0;
    self.currentlylocked = 0;
    self.javelintarget = undefined;
    self stoplocalsound( "javelin_clu_lock" );
    self stoplocalsound( "javelin_clu_aquiring_lock" );
    initjavelinusage();
}

eyetraceforward()
{
    var_0 = self geteye();
    var_1 = self getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = var_0 + var_2 * 15000;
    var_4 = bullettrace( var_0, var_3, 0, undefined );

    if ( var_4["surfacetype"] == "none" )
        return undefined;

    if ( var_4["surfacetype"] == "default" )
        return undefined;

    var_5 = var_4["entity"];

    if ( isdefined( var_5 ) )
    {
        if ( var_5 == level.ac130.planemodel )
            return undefined;
    }

    var_6 = [];
    var_6[0] = var_4["position"];
    var_6[1] = var_4["normal"];
    return var_6;
}

lockmissesreset()
{
    self.javelinlockmisses = undefined;
}

lockmissesincr()
{
    if ( !isdefined( self.javelinlockmisses ) )
        self.javelinlockmisses = 1;
    else
        self.javelinlockmisses++;
}

lockmissespassedthreshold()
{
    var_0 = 4;

    if ( isdefined( self.javelinlockmisses ) && self.javelinlockmisses >= var_0 )
        return 1;

    return 0;
}

targetpointtooclose( var_0 )
{
    var_1 = 1100;
    var_2 = distance( self.origin, var_0 );

    if ( var_2 < var_1 )
        return 1;

    return 0;
}

looplocalseeksound( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_lockon_sound" );

    for (;;)
    {
        self playlocalsound( var_0 );
        wait(var_1);
    }
}

topattackpasses( var_0, var_1 )
{
    var_2 = var_0 + var_1 * 10.0;
    var_3 = var_2 + ( 0.0, 0.0, 2000.0 );
    var_4 = bullettrace( var_2, var_3, 0, undefined );

    if ( sighttracepassed( var_2, var_3, 0, undefined ) )
        return 1;

    return 0;
}

javelinusageloop()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 1150;
    var_1 = 25;
    var_2 = 100;
    var_3 = 400;
    var_4 = 12;
    var_5 = 0;
    var_6 = 0;
    self.javelintarget = undefined;
    initjavelinusage();

    for (;;)
    {
        wait 0.05;
        var_7 = 0;

        if ( getdvar( "missileDebugDraw" ) == "1" )
            var_7 = 1;

        var_8 = 0;

        if ( getdvar( "missileDebugText" ) == "1" )
            var_8 = 1;

        var_9 = self getcurrentweapon();

        if ( !issubstr( var_9, "javelin" ) || maps\mp\_utility::isemped() )
        {
            resetjavelinlocking();
            continue;
        }

        if ( self playerads() < 0.95 )
        {
            var_6 = gettime();
            resetjavelinlocking();
            continue;
        }

        self.javelinuseentered = 1;

        if ( !isdefined( self.javelinstage ) )
            self.javelinstage = 1;

        if ( self.javelinstage == 1 )
        {
            var_10 = maps\mp\_stinger::gettargetlist();

            if ( var_10.size != 0 )
            {
                var_11 = [];

                foreach ( var_13 in var_10 )
                {
                    var_14 = self worldpointinreticle_circle( var_13.origin, 65, 40 );

                    if ( var_14 )
                        var_11[var_11.size] = var_13;
                }

                if ( var_11.size != 0 )
                {
                    var_16 = sortbydistance( var_11, self.origin );

                    if ( !vehiclelocksighttest( var_16[0] ) )
                        continue;

                    if ( var_8 )
                    {

                    }

                    self.javelintarget = var_16[0];

                    if ( !isdefined( self.javelinlockstarttime ) )
                        self.javelinlockstarttime = gettime();

                    self.javelinstage = 2;
                    self.javelinlostsightlinetime = 0;
                    javelinlockvehicle( var_0 );
                    self.javelinstage = 1;
                    continue;
                }
            }

            if ( lockmissespassedthreshold() )
            {
                resetjavelinlocking();
                continue;
            }

            var_17 = gettime() - var_6;

            if ( var_17 < var_2 )
                continue;

            var_17 = gettime() - var_5;

            if ( var_17 < var_1 )
                continue;

            var_5 = gettime();
            var_21 = eyetraceforward();

            if ( !isdefined( var_21 ) )
            {
                lockmissesincr();
                continue;
            }

            if ( targetpointtooclose( var_21[0] ) )
            {
                self weaponlocktargettooclose( 1 );
                continue;
            }
            else
                self weaponlocktargettooclose( 0 );

            if ( isdefined( self.javelinpoints ) )
            {
                var_22 = averagepoint( self.javelinpoints );
                var_23 = distance( var_22, var_21[0] );

                if ( var_23 > var_3 )
                {
                    lockmissesincr();
                    continue;
                }
            }
            else
            {
                self.javelinpoints = [];
                self.javelinnormals = [];
            }

            self.javelinpoints[self.javelinpoints.size] = var_21[0];
            self.javelinnormals[self.javelinnormals.size] = var_21[1];
            lockmissesreset();

            if ( self.javelinpoints.size < var_4 )
                continue;

            self.javelintargetpoint = averagepoint( self.javelinpoints );
            self.javelintargetnormal = averagenormal( self.javelinnormals );
            self.javelinlockmisses = undefined;
            self.javelinpoints = undefined;
            self.javelinnormals = undefined;
            self.javelinlockstarttime = gettime();
            self weaponlockstart( self.javelintargetpoint );
            thread looplocalseeksound( "javelin_clu_aquiring_lock", 0.6 );
            self.javelinstage = 2;
        }

        if ( self.javelinstage == 2 )
        {
            var_14 = self worldpointinreticle_circle( self.javelintargetpoint, 65, 45 );

            if ( !var_14 )
            {
                resetjavelinlocking();
                continue;
            }

            if ( targetpointtooclose( self.javelintargetpoint ) )
                self weaponlocktargettooclose( 1 );
            else
                self weaponlocktargettooclose( 0 );

            var_17 = gettime() - self.javelinlockstarttime;

            if ( var_17 < var_0 )
                continue;

            self weaponlockfinalize( self.javelintargetpoint, ( 0.0, 0.0, 0.0 ), 1 );
            self notify( "stop_lockon_sound" );
            self playlocalsound( "javelin_clu_lock" );
            self.javelinstage = 3;
        }

        if ( self.javelinstage == 3 )
        {
            var_14 = self worldpointinreticle_circle( self.javelintargetpoint, 65, 45 );

            if ( !var_14 )
            {
                resetjavelinlocking();
                continue;
            }

            if ( targetpointtooclose( self.javelintargetpoint ) )
                self weaponlocktargettooclose( 1 );
            else
                self weaponlocktargettooclose( 0 );

            continue;
        }
    }
}

debugsightline( var_0, var_1, var_2 )
{

}

vehiclelocksighttest( var_0 )
{
    var_1 = self geteye();
    var_2 = var_0 getpointinbounds( 0, 0, 0 );
    var_3 = sighttracepassed( var_1, var_2, 0, var_0 );
    debugsightline( var_1, var_2, var_3 );

    if ( var_3 )
        return 1;

    var_4 = var_0 getpointinbounds( 1, 0, 0 );
    var_3 = sighttracepassed( var_1, var_4, 0, var_0 );
    debugsightline( var_1, var_4, var_3 );

    if ( var_3 )
        return 1;

    var_5 = var_0 getpointinbounds( -1, 0, 0 );
    var_3 = sighttracepassed( var_1, var_5, 0, var_0 );
    debugsightline( var_1, var_5, var_3 );

    if ( var_3 )
        return 1;

    return 0;
}

javelinlockvehicle( var_0 )
{
    if ( self.javelinstage == 2 )
    {
        self weaponlockstart( self.javelintarget );

        if ( !stillvalidjavelinlock( self.javelintarget ) )
        {
            resetjavelinlocking();
            self.javelinlockstarttime = undefined;
            return;
        }

        var_1 = softsighttest();

        if ( !var_1 )
        {
            self.javelinlockstarttime = undefined;
            return;
        }

        if ( !isdefined( self.currentlylocking ) || !self.currentlylocking )
        {
            thread looplocalseeksound( "javelin_clu_aquiring_lock", 0.6 );
            self.currentlylocking = 1;
        }

        var_2 = gettime() - self.javelinlockstarttime;

        if ( maps\mp\_utility::_hasperk( "specialty_fasterlockon" ) )
        {
            if ( var_2 < var_0 * 0.5 )
                return;
        }
        else if ( var_2 < var_0 )
            return;

        if ( isplayer( self.javelintarget ) )
            self weaponlockfinalize( self.javelintarget, ( 0.0, 0.0, 64.0 ), 0 );
        else
            self weaponlockfinalize( self.javelintarget, ( 0.0, 0.0, 0.0 ), 0 );

        self notify( "stop_lockon_sound" );

        if ( !isdefined( self.currentlylocked ) || !self.currentlylocked )
        {
            self playlocalsound( "javelin_clu_lock" );
            self.currentlylocked = 1;
        }

        self.javelinstage = 3;
    }

    if ( self.javelinstage == 3 )
    {
        var_1 = softsighttest();

        if ( !var_1 )
            return;

        if ( !stillvalidjavelinlock( self.javelintarget ) )
        {
            resetjavelinlocking();
            return;
        }
    }
}

stillvalidjavelinlock( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !self worldpointinreticle_circle( var_0.origin, 65, 85 ) )
        return 0;

    return 1;
}

softsighttest()
{
    var_0 = 500;

    if ( vehiclelocksighttest( self.javelintarget ) )
    {
        self.javelinlostsightlinetime = 0;
        return 1;
    }

    if ( self.javelinlostsightlinetime == 0 )
        self.javelinlostsightlinetime = gettime();

    var_1 = gettime() - self.javelinlostsightlinetime;

    if ( var_1 >= var_0 )
    {
        resetjavelinlocking();
        return 0;
    }

    return 1;
}
