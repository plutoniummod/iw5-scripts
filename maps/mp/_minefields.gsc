// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

minefields()
{
    var_0 = getentarray( "minefield", "targetname" );

    if ( var_0.size > 0 )
        level._effect["mine_explosion"] = loadfx( "explosions/grenadeExp_dirt" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread minefield_think();
}

minefield_think()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
            var_0 thread minefield_kill( self );
    }
}

minefield_kill( var_0 )
{
    if ( isdefined( self.minefield ) )
        return;

    self.minefield = 1;
    self playsound( "minefield_click" );
    wait 0.5;
    wait(randomfloat( 0.5 ));

    if ( isdefined( self ) && self istouching( var_0 ) )
    {
        var_1 = self getorigin();
        var_2 = 300;
        var_3 = 2000;
        var_4 = 50;
        self playsound( "explo_mine" );
        playfx( level._effect["mine_explosion"], var_1 );
        radiusdamage( var_1, var_2, var_3, var_4 );
    }

    self.minefield = undefined;
}
