// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshellshock( "flashbang_mp" );
    thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread monitorempgrenade();
    }
}

monitorempgrenade()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self.empendtime = 0;

    for (;;)
    {
        self waittill( "emp_grenaded", var_0 );

        if ( !isalive( self ) )
            continue;

        if ( isdefined( self.usingremote ) )
            continue;

        if ( maps\mp\_utility::_hasperk( "specialty_empimmune" ) )
            continue;

        var_1 = 1;
        var_2 = 0;

        if ( level.teambased && isdefined( var_0 ) && isdefined( var_0.pers["team"] ) && var_0.pers["team"] == self.pers["team"] && var_0 != self )
        {
            if ( level.friendlyfire == 0 )
                continue;
            else if ( level.friendlyfire == 1 )
            {
                var_2 = 0;
                var_1 = 1;
            }
            else if ( level.friendlyfire == 2 )
            {
                var_1 = 0;
                var_2 = 1;
            }
            else if ( level.friendlyfire == 3 )
            {
                var_2 = 1;
                var_1 = 1;
            }
        }
        else if ( isdefined( var_0 ) )
        {
            var_0 notify( "emp_hit" );

            if ( var_0 != self )
                var_0 maps\mp\gametypes\_missions::processchallenge( "ch_onthepulse" );
        }

        if ( var_1 && isdefined( self ) )
            thread applyemp();

        if ( var_2 && isdefined( var_0 ) )
            var_0 thread applyemp();
    }
}

applyemp()
{
    self notify( "applyEmp" );
    self endon( "applyEmp" );
    self endon( "death" );
    wait 0.05;
    self.empduration = 10;
    self.empgrenaded = 1;
    self shellshock( "flashbang_mp", 1 );
    self.empendtime = gettime() + self.empduration * 1000;
    thread emprumbleloop( 0.75 );
    self setempjammed( 1 );
    thread empgrenadedeathwaiter();
    wait(self.empduration);
    self notify( "empGrenadeTimedOut" );
    checktoturnoffemp();
}

empgrenadedeathwaiter()
{
    self notify( "empGrenadeDeathWaiter" );
    self endon( "empGrenadeDeathWaiter" );
    self endon( "empGrenadeTimedOut" );
    self waittill( "death" );
    checktoturnoffemp();
}

checktoturnoffemp()
{
    self.empgrenaded = 0;

    if ( level.teambased && ( level.teamemped[self.team] || level.teamnukeemped[self.team] ) || !level.teambased && isdefined( level.empplayer ) && level.empplayer != self || !level.teambased && isdefined( level.nukeinfo.player ) && level.nukeinfo.player != self )
        return;

    self setempjammed( 0 );
}

emprumbleloop( var_0 )
{
    self endon( "emp_rumble_loop" );
    self notify( "emp_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self playrumbleonentity( "damage_heavy" );
        wait 0.05;
    }
}

isempgrenaded()
{
    return isdefined( self.empendtime ) && gettime() < self.empendtime;
}
