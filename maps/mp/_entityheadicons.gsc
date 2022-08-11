// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( isdefined( level.initedentityheadicons ) )
        return;

    level.initedentityheadicons = 1;
    game["entity_headicon_allies"] = maps\mp\gametypes\_teams::getteamheadicon( "allies" );
    game["entity_headicon_axis"] = maps\mp\gametypes\_teams::getteamheadicon( "axis" );
    precacheshader( game["entity_headicon_allies"] );
    precacheshader( game["entity_headicon_axis"] );

    if ( !level.teambased )
        return;
}

setheadicon( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( self.entityheadicons ) )
        self.entityheadicons = [];

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0.05;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    if ( !isdefined( var_8 ) )
        var_8 = 1;

    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    if ( !isplayer( var_0 ) && var_0 == "none" )
    {
        foreach ( var_13, var_12 in self.entityheadicons )
        {
            if ( isdefined( var_12 ) )
                var_12 destroy();

            self.entityheadicons[var_13] = undefined;
        }
    }
    else
    {
        if ( isplayer( var_0 ) )
        {
            if ( isdefined( self.entityheadicons[var_0.guid] ) )
            {
                self.entityheadicons[var_0.guid] destroy();
                self.entityheadicons[var_0.guid] = undefined;
            }

            if ( var_1 == "" )
                return;

            if ( isdefined( self.entityheadicons[var_0.team] ) )
            {
                self.entityheadicons[var_0.team] destroy();
                self.entityheadicons[var_0.team] = undefined;
            }

            var_12 = newclienthudelem( var_0 );
            self.entityheadicons[var_0.guid] = var_12;
        }
        else
        {
            if ( isdefined( self.entityheadicons[var_0] ) )
            {
                self.entityheadicons[var_0] destroy();
                self.entityheadicons[var_0] = undefined;
            }

            if ( var_1 == "" )
                return;

            foreach ( var_13, var_15 in self.entityheadicons )
            {
                if ( var_13 == "axis" || var_13 == "allies" )
                    continue;

                var_16 = maps\mp\_utility::getplayerforguid( var_13 );

                if ( var_16.team == var_0 )
                {
                    self.entityheadicons[var_13] destroy();
                    self.entityheadicons[var_13] = undefined;
                }
            }

            var_12 = newteamhudelem( var_0 );
            self.entityheadicons[var_0] = var_12;
        }

        if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        {
            var_3 = 10;
            var_4 = 10;
        }

        var_12.archived = var_5;
        var_12.x = self.origin[0] + var_2[0];
        var_12.y = self.origin[1] + var_2[1];
        var_12.z = self.origin[2] + var_2[2];
        var_12.alpha = 0.85;
        var_12 setshader( var_1, var_3, var_4 );
        var_12 setwaypoint( var_7, var_8, var_9, var_10 );
        var_12 thread keeppositioned( self, var_2, var_6 );
        thread destroyiconsondeath();

        if ( isplayer( var_0 ) )
            var_12 thread destroyonownerdisconnect( var_0 );

        if ( isplayer( self ) )
            var_12 thread destroyonownerdisconnect( self );
    }
}

destroyonownerdisconnect( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self destroy();
}

destroyiconsondeath()
{
    self notify( "destroyIconsOnDeath" );
    self endon( "destroyIconsOnDeath" );
    self waittill( "death" );

    foreach ( var_2, var_1 in self.entityheadicons )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 destroy();
    }
}

keeppositioned( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_3 = var_0.origin;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( var_3 != var_0.origin )
        {
            var_3 = var_0.origin;
            self.x = var_3[0] + var_1[0];
            self.y = var_3[1] + var_1[1];
            self.z = var_3[2] + var_1[2];
        }

        if ( var_2 > 0.05 )
        {
            self.alpha = 0.85;
            self fadeovertime( var_2 );
            self.alpha = 0;
        }

        wait(var_2);
    }
}

setteamheadicon( var_0, var_1 )
{
    if ( !level.teambased )
        return;

    if ( !isdefined( self.entityheadiconteam ) )
    {
        self.entityheadiconteam = "none";
        self.entityheadicon = undefined;
    }

    var_2 = game["entity_headicon_" + var_0];
    self.entityheadiconteam = var_0;

    if ( isdefined( var_1 ) )
        self.entityheadiconoffset = var_1;
    else
        self.entityheadiconoffset = ( 0.0, 0.0, 0.0 );

    self notify( "kill_entity_headicon_thread" );

    if ( var_0 == "none" )
    {
        if ( isdefined( self.entityheadicon ) )
            self.entityheadicon destroy();

        return;
    }

    var_3 = newteamhudelem( var_0 );
    var_3.archived = 1;
    var_3.x = self.origin[0] + self.entityheadiconoffset[0];
    var_3.y = self.origin[1] + self.entityheadiconoffset[1];
    var_3.z = self.origin[2] + self.entityheadiconoffset[2];
    var_3.alpha = 0.8;
    var_3 setshader( var_2, 10, 10 );
    var_3 setwaypoint( 0, 0, 0, 1 );
    self.entityheadicon = var_3;
    thread keepiconpositioned();
    thread destroyheadiconsondeath();
}

setplayerheadicon( var_0, var_1 )
{
    if ( level.teambased )
        return;

    if ( !isdefined( self.entityheadiconteam ) )
    {
        self.entityheadiconteam = "none";
        self.entityheadicon = undefined;
    }

    self notify( "kill_entity_headicon_thread" );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self.entityheadicon ) )
            self.entityheadicon destroy();

        return;
    }

    var_2 = var_0.team;
    self.entityheadiconteam = var_2;

    if ( isdefined( var_1 ) )
        self.entityheadiconoffset = var_1;
    else
        self.entityheadiconoffset = ( 0.0, 0.0, 0.0 );

    var_3 = game["entity_headicon_" + var_2];
    var_4 = newclienthudelem( var_0 );
    var_4.archived = 1;
    var_4.x = self.origin[0] + self.entityheadiconoffset[0];
    var_4.y = self.origin[1] + self.entityheadiconoffset[1];
    var_4.z = self.origin[2] + self.entityheadiconoffset[2];
    var_4.alpha = 0.8;
    var_4 setshader( var_3, 10, 10 );
    var_4 setwaypoint( 0, 0, 0, 1 );
    self.entityheadicon = var_4;
    thread keepiconpositioned();
    thread destroyheadiconsondeath();
}

keepiconpositioned()
{
    self endon( "kill_entity_headicon_thread" );
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        if ( var_0 != self.origin )
        {
            updateheadiconorigin();
            var_0 = self.origin;
        }

        wait 0.05;
    }
}

destroyheadiconsondeath()
{
    self endon( "kill_entity_headicon_thread" );
    self waittill( "death" );

    if ( !isdefined( self.entityheadicon ) )
        return;

    self.entityheadicon destroy();
}

updateheadiconorigin()
{
    self.entityheadicon.x = self.origin[0] + self.entityheadiconoffset[0];
    self.entityheadicon.y = self.origin[1] + self.entityheadiconoffset[1];
    self.entityheadicon.z = self.origin[2] + self.entityheadiconoffset[2];
}
