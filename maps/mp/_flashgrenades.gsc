// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precacheshellshock( "flashbang_mp" );
}

startmonitoringflash()
{
    thread monitorflash();
}

stopmonitoringflash( var_0 )
{
    self notify( "stop_monitoring_flash" );
}

flashrumbleloop( var_0 )
{
    self endon( "stop_monitoring_flash" );
    self endon( "flash_rumble_loop" );
    self notify( "flash_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self playrumbleonentity( "damage_heavy" );
        wait 0.05;
    }
}

monitorflash()
{
    self endon( "disconnect" );
    self.flashendtime = 0;

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3 );

        if ( !isalive( self ) )
            continue;

        if ( isdefined( self.usingremote ) )
            continue;

        var_4 = 0;
        var_5 = 1;

        if ( var_2 < 0.25 )
            var_2 = 0.25;
        else if ( var_2 > 0.8 )
            var_2 = 1;

        var_6 = var_1 * var_2 * 5.5;

        if ( isdefined( self.stunscaler ) )
            var_6 *= self.stunscaler;

        if ( var_6 < 0.25 )
            continue;

        var_7 = undefined;

        if ( var_6 > 2 )
            var_7 = 0.75;
        else
            var_7 = 0.25;

        if ( level.teambased && isdefined( var_3 ) && isdefined( var_3.pers["team"] ) && var_3.pers["team"] == self.pers["team"] && var_3 != self )
        {
            if ( level.friendlyfire == 0 )
                continue;
            else if ( level.friendlyfire == 1 )
            {

            }
            else if ( level.friendlyfire == 2 )
            {
                var_6 *= 0.5;
                var_7 *= 0.5;
                var_5 = 0;
                var_4 = 1;
            }
            else if ( level.friendlyfire == 3 )
            {
                var_6 *= 0.5;
                var_7 *= 0.5;
                var_4 = 1;
            }
        }
        else if ( isdefined( var_3 ) )
        {
            var_3 notify( "flash_hit" );

            if ( var_3 != self )
                var_3 maps\mp\gametypes\_missions::processchallenge( "ch_indecentexposure" );
        }

        if ( var_5 && isdefined( self ) )
        {
            thread applyflash( var_6, var_7 );

            if ( isdefined( var_3 ) && var_3 != self )
                var_3 thread maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "flash" );
        }

        if ( var_4 && isdefined( var_3 ) )
            var_3 thread applyflash( var_6, var_7 );
    }
}

applyflash( var_0, var_1 )
{
    if ( !isdefined( self.flashduration ) || var_0 > self.flashduration )
        self.flashduration = var_0;

    if ( !isdefined( self.flashrumbleduration ) || var_1 > self.flashrumbleduration )
        self.flashrumbleduration = var_1;

    wait 0.05;

    if ( isdefined( self.flashduration ) )
    {
        self shellshock( "flashbang_mp", self.flashduration );
        self.flashendtime = gettime() + self.flashduration * 1000;
    }

    if ( isdefined( self.flashrumbleduration ) )
        thread flashrumbleloop( self.flashrumbleduration );

    self.flashduration = undefined;
    self.flashrumbleduration = undefined;
}

isflashbanged()
{
    return isdefined( self.flashendtime ) && gettime() < self.flashendtime;
}
