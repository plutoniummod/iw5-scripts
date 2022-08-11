// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.spectateoverride["allies"] = spawnstruct();
    level.spectateoverride["axis"] = spawnstruct();
    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onjoinedteam();
        var_0 thread onjoinedspectators();
        var_0 thread onspectatingclient();
    }
}

onjoinedteam()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        setspectatepermissions();
    }
}

onjoinedspectators()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        setspectatepermissions();
    }
}

onspectatingclient()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spectating_cycle" );
        var_0 = self getspectatingplayer();

        if ( isdefined( var_0 ) )
            self setcarddisplayslot( var_0, 6 );
    }
}

updatespectatesettings()
{
    level endon( "game_ended" );

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        level.players[var_0] setspectatepermissions();
}

getotherteam( var_0 )
{
    if ( var_0 == "axis" )
        return "allies";
    else if ( var_0 == "allies" )
        return "axis";
    else
        return "none";
}

setspectatepermissions()
{
    var_0 = self.sessionteam;

    if ( level.gameended && gettime() - level.gameendtime >= 2000 )
    {
        self allowspectateteam( "allies", 0 );
        self allowspectateteam( "axis", 0 );
        self allowspectateteam( "freelook", 0 );
        self allowspectateteam( "none", 1 );
        return;
    }

    var_1 = maps\mp\gametypes\_tweakables::gettweakablevalue( "game", "spectatetype" );

    switch ( var_1 )
    {
        case 0:
            self allowspectateteam( "allies", 0 );
            self allowspectateteam( "axis", 0 );
            self allowspectateteam( "freelook", 0 );
            self allowspectateteam( "none", 0 );
            break;
        case 1:
            if ( !level.teambased )
            {
                self allowspectateteam( "allies", 1 );
                self allowspectateteam( "axis", 1 );
                self allowspectateteam( "none", 1 );
                self allowspectateteam( "freelook", 0 );
            }
            else if ( isdefined( var_0 ) && ( var_0 == "allies" || var_0 == "axis" ) )
            {
                self allowspectateteam( var_0, 1 );
                self allowspectateteam( getotherteam( var_0 ), 0 );
                self allowspectateteam( "freelook", 0 );
                self allowspectateteam( "none", 0 );
            }
            else
            {
                self allowspectateteam( "allies", 0 );
                self allowspectateteam( "axis", 0 );
                self allowspectateteam( "freelook", 0 );
                self allowspectateteam( "none", 0 );
            }

            break;
        case 2:
            self allowspectateteam( "allies", 1 );
            self allowspectateteam( "axis", 1 );
            self allowspectateteam( "freelook", 1 );
            self allowspectateteam( "none", 1 );
            break;
    }

    if ( isdefined( var_0 ) && ( var_0 == "axis" || var_0 == "allies" ) )
    {
        if ( isdefined( level.spectateoverride[var_0].allowfreespectate ) )
            self allowspectateteam( "freelook", 1 );

        if ( isdefined( level.spectateoverride[var_0].allowenemyspectate ) )
            self allowspectateteam( getotherteam( var_0 ), 1 );
    }
}
