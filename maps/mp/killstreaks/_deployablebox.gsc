// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["deployable_vest"] = ::tryusedeployablevest;
    level.boxsettings = [];
    level.boxsettings["deployable_vest"] = spawnstruct();
    level.boxsettings["deployable_vest"].weaponinfo = "deployable_vest_marker_mp";
    level.boxsettings["deployable_vest"].modelbase = "com_deploy_ballistic_vest_friend_world";
    level.boxsettings["deployable_vest"].hintstring = &"MP_LIGHT_ARMOR_PICKUP";
    level.boxsettings["deployable_vest"].capturingstring = &"MP_BOX_GETTING_VEST";
    level.boxsettings["deployable_vest"].eventstring = &"MP_DEPLOYED_VEST";
    level.boxsettings["deployable_vest"].streakname = "deployable_vest";
    level.boxsettings["deployable_vest"].splashname = "used_deployable_vest";
    level.boxsettings["deployable_vest"].shadername = "compass_objpoint_deploy_friendly";
    level.boxsettings["deployable_vest"].lifespan = 60.0;
    level.boxsettings["deployable_vest"].xp = 50;
    level.boxsettings["deployable_vest"].vodestroyed = "ballistic_vest_destroyed";

    foreach ( var_1 in level.boxsettings )
    {
        precacheitem( var_1.weaponinfo );
        precachemodel( var_1.modelbase );
        precachestring( var_1.hintstring );
        precachestring( var_1.capturingstring );
        precachestring( var_1.eventstring );
        precacheshader( var_1.shadername );
    }

    precachestring( &"PLATFORM_HOLD_TO_USE" );
    level._effect["box_explode_mp"] = loadfx( "fire/ballistic_vest_death" );
}

tryusedeployablevest( var_0 )
{
    var_1 = begindeployableviamarker( var_0, "deployable_vest" );

    if ( !isdefined( var_1 ) || !var_1 )
        return 0;

    maps\mp\_matchdata::logkillstreakevent( "deployable_vest", self.origin );
    return 1;
}

begindeployableviamarker( var_0, var_1 )
{
    self endon( "death" );
    self.marker = undefined;
    thread watchmarkerusage( var_0, var_1 );
    var_2 = self getcurrentweapon();

    if ( ismarker( var_2 ) )
        var_3 = var_2;
    else
        var_3 = undefined;

    while ( ismarker( var_2 ) )
    {
        self waittill( "weapon_change", var_2 );

        if ( ismarker( var_2 ) )
            var_3 = var_2;
    }

    self notify( "stopWatchingMarker" );

    if ( !isdefined( var_3 ) )
        return 0;

    return !( self getammocount( var_3 ) && self hasweapon( var_3 ) );
}

watchmarkerusage( var_0, var_1 )
{
    self notify( "watchMarkerUsage" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "watchMarkerUsage" );
    self endon( "stopWatchingMarker" );
    thread watchmarker( var_0, var_1 );

    for (;;)
    {
        self waittill( "grenade_pullback", var_2 );

        if ( !ismarker( var_2 ) )
            continue;

        common_scripts\utility::_disableusability();
        beginmarkertracking();
    }
}

watchmarker( var_0, var_1 )
{
    self notify( "watchMarker" );
    self endon( "watchMarker" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "stopWatchingMarker" );

    for (;;)
    {
        self waittill( "grenade_fire", var_2, var_3 );

        if ( !ismarker( var_3 ) )
            continue;

        if ( !isalive( self ) )
        {
            var_2 delete();
            return;
        }

        var_2.owner = self;
        var_2.weaponname = var_3;
        self.marker = var_2;
        thread takeweapononstuck( var_2, var_3 );
        var_2 thread markeractivate( var_0, var_1, ::box_setactive );
    }
}

takeweapononstuck( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 playsoundtoplayer( "mp_vest_deployed_ui", self );

    if ( self hasweapon( var_1 ) )
    {
        self takeweapon( var_1 );
        self switchtoweapon( common_scripts\utility::getlastweapon() );
    }
}

beginmarkertracking()
{
    self notify( "beginMarkerTracking" );
    self endon( "beginMarkerTracking" );
    self endon( "death" );
    self endon( "disconnect" );
    common_scripts\utility::waittill_any( "grenade_fire", "weapon_change" );
    common_scripts\utility::_enableusability();
}

markeractivate( var_0, var_1, var_2 )
{
    self notify( "markerActivate" );
    self endon( "markerActivate" );
    self waittill( "missile_stuck" );
    var_3 = self.owner;
    var_4 = self.origin;

    if ( !isdefined( var_3 ) )
        return;

    var_5 = createboxforplayer( var_1, var_4, var_3 );
    wait 0.05;
    var_5 thread [[ var_2 ]]();
    self delete();
}

ismarker( var_0 )
{
    switch ( var_0 )
    {
        case "deployable_vest_marker_mp":
            return 1;
        default:
            return 0;
    }
}

createboxforplayer( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_1 );
    var_3 setmodel( level.boxsettings[var_0].modelbase );
    var_3.health = 1000;
    var_3.angles = var_2.angles;
    var_3.boxtype = var_0;
    var_3.owner = var_2;
    var_3.team = var_2.team;
    var_3 box_setinactive();
    var_3 thread box_handleownerdisconnect();
    return var_3;
}

box_setactive()
{
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( level.boxsettings[self.boxtype].hintstring );
    self.inuse = 0;

    if ( level.teambased )
    {
        var_0 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_0, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( var_0, self.origin );
        objective_state( var_0, "active" );
        objective_icon( var_0, level.boxsettings[self.boxtype].shadername );
        objective_team( var_0, self.team );
        self.objidfriendly = var_0;

        foreach ( var_2 in level.players )
        {
            if ( self.team == var_2.team && !var_2 maps\mp\_utility::isjuggernaut() )
                maps\mp\_entityheadicons::setheadicon( var_2, maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( level.boxsettings[self.boxtype].streakname ), ( 0.0, 0.0, 20.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
        }
    }
    else
    {
        var_0 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_0, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( var_0, self.origin );
        objective_state( var_0, "active" );
        objective_icon( var_0, level.boxsettings[self.boxtype].shadername );
        objective_player( var_0, self.owner getentitynumber() );
        self.objidfriendly = var_0;

        if ( !self.owner maps\mp\_utility::isjuggernaut() )
            maps\mp\_entityheadicons::setheadicon( self.owner, maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( level.boxsettings[self.boxtype].streakname ), ( 0.0, 0.0, 20.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
    }

    self makeusable();
    self.isusable = 1;
    self setcandamage( 1 );
    thread box_handledamage();
    thread box_handledeath();
    thread box_timeout();
    thread disablewhenjuggernaut();

    foreach ( var_2 in level.players )
    {
        if ( level.teambased )
        {
            if ( self.team == var_2.team )
            {
                if ( var_2 maps\mp\_utility::isjuggernaut() )
                {
                    self disableplayeruse( var_2 );
                    thread doubledip( var_2 );
                }
                else
                    self enableplayeruse( var_2 );

                thread boxthink( var_2 );
            }
            else
                self disableplayeruse( var_2 );

            thread box_playerjoinedteam( var_2 );
            continue;
        }

        if ( isdefined( self.owner ) && self.owner == var_2 )
        {
            if ( var_2 maps\mp\_utility::isjuggernaut() )
            {
                self disableplayeruse( var_2 );
                thread doubledip( var_2 );
            }
            else
                self enableplayeruse( var_2 );

            thread boxthink( var_2 );
            continue;
        }

        self disableplayeruse( var_2 );
    }

    level thread maps\mp\_utility::teamplayercardsplash( level.boxsettings[self.boxtype].splashname, self.owner, self.team );
    thread box_playerconnected();
}

box_playerconnected()
{
    self endon( "death" );
    level waittill( "connected", var_0 );
    var_0 waittill( "spawned_player" );

    if ( level.teambased )
    {
        if ( self.team == var_0.team )
        {
            self enableplayeruse( var_0 );
            thread boxthink( var_0 );
            maps\mp\_entityheadicons::setheadicon( var_0, maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( level.boxsettings[self.boxtype].streakname ), ( 0.0, 0.0, 20.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
        }
        else
        {
            self disableplayeruse( var_0 );
            maps\mp\_entityheadicons::setheadicon( var_0, "", ( 0.0, 0.0, 0.0 ) );
        }
    }
}

box_playerjoinedteam( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "joined_team" );

        if ( level.teambased )
        {
            if ( self.team == var_0.team )
            {
                self enableplayeruse( var_0 );
                thread boxthink( var_0 );
                maps\mp\_entityheadicons::setheadicon( var_0, maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( level.boxsettings[self.boxtype].streakname ), ( 0.0, 0.0, 20.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
                continue;
            }

            self disableplayeruse( var_0 );
            maps\mp\_entityheadicons::setheadicon( var_0, "", ( 0.0, 0.0, 0.0 ) );
        }
    }
}

box_setinactive()
{
    self makeunusable();
    self.isusable = 0;
    maps\mp\_entityheadicons::setheadicon( "none", "", ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( self.objidfriendly ) )
        maps\mp\_utility::_objective_delete( self.objidfriendly );
}

box_handledamage()
{
    self.health = 999999;
    self.maxhealth = 300;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_1 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( var_4 == "MOD_MELEE" )
            self.damagetaken += self.maxhealth;

        if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
            self.wasdamagedfrombulletpenetration = 1;

        self.wasdamaged = 1;
        var_10 = var_0;

        if ( isplayer( var_1 ) )
        {
            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "deployable_bag" );

            if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
            {
                if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                    var_10 += var_0 * level.armorpiercingmod;
            }
        }

        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "deployable_bag" );

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "ac130_105mm_mp":
                case "ac130_40mm_mp":
                case "remotemissile_projectile_mp":
                case "remote_mortar_missile_mp":
                case "stinger_mp":
                case "javelin_mp":
                    self.largeprojectiledamage = 1;
                    var_10 = self.maxhealth + 1;
                    break;
                case "artillery_mp":
                case "stealth_bomb_mp":
                    self.largeprojectiledamage = 0;
                    var_10 += var_0 * 4;
                    break;
                case "bomb_site_mp":
                    self.largeprojectiledamage = 0;
                    var_10 = self.maxhealth + 1;
                    break;
            }
        }

        self.damagetaken += var_10;

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
            {
                var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 100, var_9, var_4 );
                var_1 notify( "destroyed_killstreak" );
            }

            if ( isdefined( self.owner ) )
                self.owner thread maps\mp\_utility::leaderdialogonplayer( level.boxsettings[self.boxtype].vodestroyed );

            self notify( "death" );
            return;
        }
    }
}

box_handledeath()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    box_setinactive();
    playfx( common_scripts\utility::getfx( "box_explode_mp" ), self.origin );
    wait 0.5;
    self notify( "deleting" );
    self delete();
}

box_handleownerdisconnect()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "box_handleOwner" );
    self endon( "box_handleOwner" );
    self.owner common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

boxthink( var_0 )
{
    self endon( "death" );
    thread boxcapturethink( var_0 );

    for (;;)
    {
        self waittill( "captured", var_1 );

        if ( var_1 != var_0 )
            continue;

        switch ( self.boxtype )
        {
            case "deployable_vest":
                var_0 playlocalsound( "ammo_crate_use" );
                var_0 [[ level.killstreakfuncs["light_armor"] ]]();
                break;
        }

        if ( isdefined( self.owner ) && var_0 != self.owner )
        {
            self.owner thread maps\mp\gametypes\_rank::xpeventpopup( level.boxsettings[self.boxtype].eventstring );
            self.owner thread maps\mp\gametypes\_rank::giverankxp( "support", level.boxsettings[self.boxtype].xp );
        }

        maps\mp\_entityheadicons::setheadicon( var_0, "", ( 0.0, 0.0, 0.0 ) );
        self disableplayeruse( var_0 );
        thread doubledip( var_0 );
    }
}

doubledip( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "death" );

    if ( level.teambased )
    {
        if ( self.team == var_0.team )
        {
            maps\mp\_entityheadicons::setheadicon( var_0, maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( level.boxsettings[self.boxtype].streakname ), ( 0.0, 0.0, 20.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
            self enableplayeruse( var_0 );
        }
    }
    else if ( isdefined( self.owner ) && self.owner == var_0 )
    {
        maps\mp\_entityheadicons::setheadicon( var_0, maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( level.boxsettings[self.boxtype].streakname ), ( 0.0, 0.0, 20.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
        self enableplayeruse( var_0 );
    }
}

boxcapturethink( var_0 )
{
    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( var_1 != var_0 )
            continue;

        if ( !useholdthink( var_0, 2000 ) )
            continue;

        self notify( "captured", var_0 );
    }
}

isfriendlytobox( var_0 )
{
    if ( level.teambased && self.team == var_0.team )
        return 1;

    return 0;
}

box_timeout()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level.boxsettings[self.boxtype].lifespan;

    while ( var_0 )
    {
        wait 1.0;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self.carriedby ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    self notify( "death" );
}

deleteonownerdeath( var_0 )
{
    wait 0.25;
    self linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 waittill( "death" );
    self delete();
}

box_modelteamupdater( var_0 )
{
    self endon( "death" );
    self hide();

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == var_0 )
            self showtoplayer( var_2 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
                self showtoplayer( var_2 );
        }
    }
}

useholdthink( var_0, var_1 )
{
    var_0 playerlinkto( self );
    var_0 playerlinkedoffsetenable();
    var_0 common_scripts\utility::_disableweapon();
    var_0.boxparams = spawnstruct();
    var_0.boxparams.curprogress = 0;
    var_0.boxparams.inuse = 1;
    var_0.boxparams.userate = 0;

    if ( isdefined( var_1 ) )
        var_0.boxparams.usetime = var_1;
    else
        var_0.boxparams.usetime = 3000;

    var_0 thread personalusebar( self );
    var_2 = useholdthinkloop( var_0 );

    if ( isalive( var_0 ) )
    {
        var_0 common_scripts\utility::_enableweapon();
        var_0 unlink();
    }

    if ( !isdefined( self ) )
        return 0;

    var_0.boxparams.inuse = 0;
    var_0.boxparams.curprogress = 0;
    return var_2;
}

personalusebar( var_0 )
{
    self endon( "disconnect" );
    var_1 = maps\mp\gametypes\_hud_util::createprimaryprogressbar( 0, 25 );
    var_2 = maps\mp\gametypes\_hud_util::createprimaryprogressbartext( 0, 25 );
    var_2 settext( level.boxsettings[var_0.boxtype].capturingstring );
    var_3 = -1;

    while ( maps\mp\_utility::isreallyalive( self ) && isdefined( var_0 ) && self.boxparams.inuse && var_0.isusable && !level.gameended )
    {
        if ( var_3 != self.boxparams.userate )
        {
            if ( self.boxparams.curprogress > self.boxparams.usetime )
                self.boxparams.curprogress = self.boxparams.usetime;

            var_1 maps\mp\gametypes\_hud_util::updatebar( self.boxparams.curprogress / self.boxparams.usetime, 1000 / self.boxparams.usetime * self.boxparams.userate );

            if ( !self.boxparams.userate )
            {
                var_1 maps\mp\gametypes\_hud_util::hideelem();
                var_2 maps\mp\gametypes\_hud_util::hideelem();
            }
            else
            {
                var_1 maps\mp\gametypes\_hud_util::showelem();
                var_2 maps\mp\gametypes\_hud_util::showelem();
            }
        }

        var_3 = self.boxparams.userate;
        wait 0.05;
    }

    var_1 maps\mp\gametypes\_hud_util::destroyelem();
    var_2 maps\mp\gametypes\_hud_util::destroyelem();
}

useholdthinkloop( var_0 )
{
    while ( !level.gameended && isdefined( self ) && maps\mp\_utility::isreallyalive( var_0 ) && var_0 usebuttonpressed() && var_0.boxparams.curprogress < var_0.boxparams.usetime )
    {
        var_0.boxparams.curprogress += 50 * var_0.boxparams.userate;

        if ( isdefined( var_0.objectivescaler ) )
            var_0.boxparams.userate = 1 * var_0.objectivescaler;
        else
            var_0.boxparams.userate = 1;

        if ( var_0.boxparams.curprogress >= var_0.boxparams.usetime )
            return maps\mp\_utility::isreallyalive( var_0 );

        wait 0.05;
    }

    return 0;
}

disablewhenjuggernaut()
{
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "juggernaut_equipped", var_0 );
        maps\mp\_entityheadicons::setheadicon( var_0, "", ( 0.0, 0.0, 0.0 ) );
        self disableplayeruse( var_0 );
        thread doubledip( var_0 );
    }
}
