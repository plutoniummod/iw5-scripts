// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level thread onplayerconnect();
    level thread onplayerdisconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.connecttime = gettime();
        var_0.targets = [];
        var_0 thread onweaponfired();
        var_0 thread ondeath();
    }
}

onplayerdisconnect()
{
    for (;;)
    {
        level waittill( "disconnected", var_0 );
        var_0.targets = [];
    }
}

onweaponfired()
{
    level endon( "game_ended" );
    self endon( "disconnected" );

    for (;;)
        self waittill( "weapon_fired" );
}

ondeath()
{
    level endon( "game_ended" );
    self endon( "disconnected" );

    for (;;)
        self waittill( "death" );
}

processkill( var_0, var_1 )
{
    updateskill( var_0, var_1, "war", 1.0 );
}
