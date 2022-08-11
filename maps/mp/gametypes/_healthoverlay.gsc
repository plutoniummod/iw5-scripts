// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.healthoverlaycutoff = 0.55;
    var_0 = 5;
    var_0 = maps\mp\gametypes\_tweakables::gettweakablevalue( "player", "healthregentime" );
    level.playerhealth_regularregendelay = var_0 * 1000;
    level.healthregendisabled = level.playerhealth_regularregendelay <= 0;
    level thread onplayerconnect();
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
        thread playerhealthregen();
    }
}

playerhealthregen()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( self.health <= 0 )
        return;

    var_0 = 0;
    var_1 = 0;
    thread playerpainbreathingsound( self.maxhealth * 0.55 );

    for (;;)
    {
        self waittill( "damage" );

        if ( self.health <= 0 )
            return;

        var_1 = gettime();
        var_2 = self.health / self.maxhealth;

        if ( !isdefined( self.healthregenlevel ) )
            self.regenspeed = 1;
        else if ( self.healthregenlevel == 0.33 )
            self.regenspeed = 0.75;
        else if ( self.healthregenlevel == 0.66 )
            self.regenspeed = 0.5;
        else if ( self.healthregenlevel == 0.99 )
            self.regenspeed = 0.3;
        else
            self.regenspeed = 1;

        if ( var_2 <= level.healthoverlaycutoff )
            self.atbrinkofdeath = 1;

        thread healthregeneration( var_1, var_2 );
        thread breathingmanager( var_1, var_2 );
    }
}

breathingmanager( var_0, var_1 )
{
    self notify( "breathingManager" );
    self endon( "breathingManager" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( maps\mp\_utility::isusingremote() )
        return;

    self.breathingstoptime = var_0 + 6000 * self.regenspeed;
    wait(6 * self.regenspeed);

    if ( !level.gameended )
        self playlocalsound( "breathing_better" );
}

healthregeneration( var_0, var_1 )
{
    self notify( "healthRegeneration" );
    self endon( "healthRegeneration" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( level.healthregendisabled )
        return;

    wait(level.playerhealth_regularregendelay / 1000 * self.regenspeed);

    if ( var_1 < 0.55 )
        var_2 = 1;
    else
        var_2 = 0;

    for (;;)
    {
        if ( self.regenspeed == 0.75 )
        {
            wait 0.2;

            if ( self.health < self.maxhealth )
                self.health += 5;
            else
                break;
        }
        else if ( self.regenspeed == 0.5 )
        {
            wait 0.05;

            if ( self.health < self.maxhealth )
                self.health += 2;
            else
                break;
        }
        else if ( self.regenspeed == 0.3 )
        {
            wait 0.15;

            if ( self.health < self.maxhealth )
                self.health += 9;
            else
                break;
        }
        else if ( !isdefined( self.regenspeed ) || self.regenspeed == 1 )
        {
            wait 0.05;

            if ( self.health < self.maxhealth )
            {
                self.health += 1;
                var_1 = self.health / self.maxhealth;
            }
            else
                break;
        }

        if ( self.health > self.maxhealth )
            self.health = self.maxhealth;
    }

    maps\mp\gametypes\_damage::resetattackerlist();

    if ( var_2 )
        maps\mp\gametypes\_missions::healthregenerated();
}

wait_for_not_using_remote()
{
    self notify( "waiting_to_stop_remote" );
    self endon( "waiting_to_stop_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "stopped_using_remote" );

    if ( isdefined( level.nukedetonated ) )
        self visionsetnakedforplayer( level.nukevisionset, 0 );
    else
        self visionsetnakedforplayer( "", 0 );
}

playerpainbreathingsound( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    wait 2;

    for (;;)
    {
        wait 0.2;

        if ( self.health <= 0 )
            return;

        if ( self.health >= var_0 )
            continue;

        if ( level.healthregendisabled && gettime() > self.breathingstoptime )
            continue;

        if ( maps\mp\_utility::isusingremote() )
            continue;

        self playlocalsound( "breathing_hurt" );
        wait 0.784;
        wait(0.1 + randomfloat( 0.8 ));
    }
}
