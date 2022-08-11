// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

setscrambler()
{
    self setoffhandsecondaryclass( "flash" );
    maps\mp\_utility::_giveweapon( "scrambler_mp", 0 );
    self givestartammo( "scrambler_mp" );
    thread monitorscrambleruse();
}

unsetscrambler()
{
    self notify( "end_monitorScramblerUse" );
}

deletescrambler( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2 ) )
            var_2.inplayerscrambler = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
    self.deployedscrambler = undefined;
    var_4 = [];
    var_4 = maps\mp\_utility::cleanarray( level.scramblers );
    level.scramblers = var_4;
}

monitorscrambleruse()
{
    self notify( "end_monitorScramblerUse" );
    self endon( "end_monitorScramblerUse" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "scrambler" || var_1 == "scrambler_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            var_0 hide();
            var_0 waittill( "missile_stuck" );
            var_2 = 40;

            if ( var_2 * var_2 < distancesquared( var_0.origin, self.origin ) )
            {
                var_3 = bullettrace( self.origin, self.origin - ( 0, 0, var_2 ), 0, self );

                if ( var_3["fraction"] == 1 )
                {
                    var_0 delete();
                    self setweaponammostock( "scrambler_mp", self getweaponammostock( "trophy_mp" ) + 1 );
                    continue;
                }

                var_0.origin = var_3["position"];
            }

            var_0 show();

            if ( isdefined( self.deployedscrambler ) )
                deletescrambler( self.deployedscrambler );

            var_4 = var_0.origin;
            var_5 = spawn( "script_model", var_4 );
            var_5.health = 100;
            var_5.team = self.team;
            var_5.owner = self;
            var_5 setcandamage( 1 );
            var_5 makescrambler( self );
            var_5 scramblersetup( self );
            var_5 thread maps\mp\gametypes\_weapons::createbombsquadmodel( "weapon_jammer_bombsquad", "tag_origin", level.otherteam[self.team], self );
            level.scramblers[level.scramblers.size] = var_5;
            self.deployedscrambler = var_5;
            self.changingweapon = undefined;
            wait 0.05;

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
    }
}

scramblersetup( var_0 )
{
    self setmodel( "weapon_jammer" );

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( self.team, ( 0.0, 0.0, 20.0 ) );
    else
        maps\mp\_entityheadicons::setplayerheadicon( var_0, ( 0.0, 0.0, 20.0 ) );

    thread scramblerdamagelistener( var_0 );
    thread scrambleruselistener( var_0 );
    var_0 thread scramblerwatchowner( self );
    thread scramblerbeepsounds();
    thread maps\mp\_utility::notusableforjoiningplayers( var_0 );
}

scramblerwatchowner( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators", "death" );
    level thread deletescrambler( var_0 );
}

scramblerbeepsounds()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3.0;
        self playsound( "scrambler_beep" );
    }
}

scramblerdamagelistener( var_0 )
{
    self endon( "death" );
    self.health = 999999;
    self.maxhealth = 100;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
        {
            switch ( var_10 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( var_5 == "MOD_MELEE" )
            self.damagetaken += self.maxhealth;

        if ( isdefined( var_9 ) && var_9 & level.idflags_penetration )
            self.wasdamagedfrombulletpenetration = 1;

        self.wasdamaged = 1;
        self.damagetaken += var_1;

        if ( isplayer( var_2 ) )
            var_2 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "scrambler" );

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            self playsound( "sentry_explode" );
            self.deatheffect = playfx( common_scripts\utility::getfx( "equipment_explode" ), self.origin );
            var_2 thread deletescrambler( self );
        }
    }
}

scrambleruselistener( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"MP_PATCH_PICKUP_SCRAMBLER" );
    maps\mp\_utility::setselfusable( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_1 playlocalsound( "scavenger_pack_pickup" );

        if ( var_1 getammocount( "scrambler_mp" ) == 0 )
            var_1 setscrambler();

        var_1 thread deletescrambler( self );
    }
}

scramblerproximitytracker()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    self.scramproxyactive = 0;
    var_0 = 512;

    for (;;)
    {
        wait 0.05;
        self.scramproxyactive = 0;

        foreach ( var_2 in level.scramblers )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( !maps\mp\_utility::isreallyalive( self ) )
                continue;

            var_3 = distancesquared( var_2.origin, self.origin );

            if ( level.teambased && var_2.team != self.team || !level.teambased && isdefined( var_2.owner ) && var_2.owner != self )
            {
                if ( var_3 < var_0 * var_0 )
                    self.inplayerscrambler = var_2.owner;
                else
                    self.inplayerscrambler = undefined;

                continue;
            }

            if ( var_3 < var_0 * var_0 )
            {
                self.scramproxyactive = 1;
                break;
            }
        }

        if ( self.scramproxyactive )
        {
            if ( !maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
            {
                maps\mp\_utility::giveperk( "specialty_blindeye", 0 );
                self.scramproxyperk = 1;
            }

            continue;
        }

        if ( isdefined( self.scramproxyperk ) && self.scramproxyperk )
        {
            if ( !maps\mp\killstreaks\_perkstreaks::isperkstreakon( "specialty_blindeye_ks" ) )
                maps\mp\_utility::_unsetperk( "specialty_blindeye" );

            self.scramproxyperk = 0;
        }
    }
}
