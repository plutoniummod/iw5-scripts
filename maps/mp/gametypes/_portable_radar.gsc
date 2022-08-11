// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

setportableradar()
{
    self setoffhandsecondaryclass( "flash" );
    maps\mp\_utility::_giveweapon( "portable_radar_mp", 0 );
    self givestartammo( "portable_radar_mp" );
    thread monitorportableradaruse();
}

unsetportableradar()
{
    self notify( "end_monitorPortableRadarUse" );
}

deleteportableradar( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2 ) )
            var_2.inplayerportableradar = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
    self.deployedportableradar = undefined;
}

monitorportableradaruse()
{
    self notify( "end_monitorPortableRadarUse" );
    self endon( "end_monitorPortableRadarUse" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "portabl_radar" || var_1 == "portable_radar_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            if ( isdefined( self.deployedportableradar ) )
                deleteportableradar( self.deployedportableradar );

            var_0 waittill( "missile_stuck" );
            var_2 = var_0.origin;

            if ( isdefined( var_0 ) )
                var_0 delete();

            var_3 = spawn( "script_model", var_2 );
            var_3.health = 100;
            var_3.team = self.team;
            var_3.owner = self;
            var_3 setcandamage( 1 );
            var_3 makeportableradar( self );
            var_3 portableradarsetup( self );
            var_3 thread maps\mp\gametypes\_weapons::createbombsquadmodel( "weapon_radar_bombsquad", "tag_origin", level.otherteam[self.team], self );
            var_3 thread portableradarproximitytracker();
            thread portableradarwatchowner( var_3 );
            self.deployedportableradar = var_3;
        }
    }
}

portableradarsetup( var_0 )
{
    self setmodel( "weapon_radar" );

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( self.team, ( 0.0, 0.0, 20.0 ) );
    else
        maps\mp\_entityheadicons::setplayerheadicon( var_0, ( 0.0, 0.0, 20.0 ) );

    thread portableradardamagelistener( var_0 );
    thread portableradaruselistener( var_0 );
    thread portableradarbeepsounds();
    thread maps\mp\_utility::notusableforjoiningplayers( var_0 );
}

portableradarwatchowner( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators", "spawned_player" );
    level thread deleteportableradar( var_0 );
}

portableradarbeepsounds()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 2.0;
        self playsound( "sentry_gun_beep" );
    }
}

portableradardamagelistener( var_0 )
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

        if ( isdefined( var_10 ) && var_10 == "emp_grenade_mp" )
            self.damagetaken = self.maxhealth + 1;

        if ( isplayer( var_2 ) )
            var_2 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "portable_radar" );

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            self playsound( "sentry_explode" );
            self.deatheffect = playfx( common_scripts\utility::getfx( "equipment_explode" ), self.origin );
            var_2 thread deleteportableradar( self );
        }
    }
}

portableradaruselistener( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"MP_PATCH_PICKUP_PORTABLE_RADAR" );
    maps\mp\_utility::setselfusable( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_1 playlocalsound( "scavenger_pack_pickup" );

        if ( var_1 getammocount( "portable_radar_mp" ) == 0 )
            var_1 setportableradar();

        var_1 thread deleteportableradar( self );
    }
}

portableradarproximitytracker()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 512;

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( level.teambased && var_2.team == self.team )
                continue;

            var_3 = distancesquared( self.origin, var_2.origin );

            if ( distancesquared( var_2.origin, self.origin ) < var_0 * var_0 )
            {
                var_2.inplayerportableradar = self.owner;
                continue;
            }

            var_2.inplayerportableradar = undefined;
        }

        wait 0.05;
    }
}
