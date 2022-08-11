// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_LASE_TARGET_FOR_GUIDED_MORTAR" );
    precachestring( &"MP_WAIT_FOR_MORTAR_READY" );
    precachestring( &"MP_MORTAR_ROUNDS_DEPLETED" );
    precachestring( &"SPLASHES_DESTROYED_REMOTE_MORTAR" );
    precachemodel( "vehicle_predator_b" );
    precacheitem( "remote_mortar_missile_mp" );
    precacheitem( "mortar_remote_mp" );
    precacheitem( "mortar_remote_zoom_mp" );
    precacheshader( "compass_waypoint_bomb" );
    precacheshader( "viper_locked_box" );
    precacheminimapicon( "compass_objpoint_reaper_friendly" );
    precacheminimapicon( "compass_objpoint_reaper_enemy" );
    level.remote_mortar_fx["laserTarget"] = loadfx( "misc/laser_glow" );
    level.remote_mortar_fx["missileExplode"] = loadfx( "explosions/bouncing_betty_explosion" );
    level.killstreakfuncs["remote_mortar"] = ::tryuseremotemortar;
    level.remote_mortar = undefined;
}

tryuseremotemortar( var_0 )
{
    if ( isdefined( level.remote_mortar ) )
    {
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( !maps\mp\_utility::validateusestreak() )
        return 0;

    maps\mp\_utility::setusingremote( "remote_mortar" );
    var_1 = maps\mp\killstreaks\_killstreaks::initridekillstreak( "remote_mortar" );

    if ( var_1 != "success" )
    {
        if ( var_1 != "disconnect" )
            maps\mp\_utility::clearusingremote();

        return 0;
    }
    else if ( isdefined( level.remote_mortar ) )
    {
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        maps\mp\_utility::clearusingremote();
        return 0;
    }

    maps\mp\_matchdata::logkillstreakevent( "remote_mortar", self.origin );
    return startremotemortar( var_0 );
}

startremotemortar( var_0 )
{
    var_1 = spawnremote( var_0, self );

    if ( !isdefined( var_1 ) )
        return 0;

    level.remote_mortar = var_1;
    remoteride( var_1 );
    thread maps\mp\_utility::teamplayercardsplash( "used_remote_mortar", self );
    return 1;
}

spawnremote( var_0, var_1 )
{
    var_2 = spawnplane( var_1, "script_model", level.uavrig gettagorigin( "tag_origin" ), "compass_objpoint_reaper_friendly", "compass_objpoint_reaper_enemy" );

    if ( !isdefined( var_2 ) )
        return undefined;

    var_2 setmodel( "vehicle_predator_b" );
    var_2.lifeid = var_0;
    var_2.team = var_1.team;
    var_2.owner = var_1;
    var_2.numflares = 1;
    var_2 setcandamage( 1 );
    var_2 thread damagetracker();
    var_2.helitype = "remote_mortar";
    var_2.uavtype = "remote_mortar";
    var_2 maps\mp\killstreaks\_uav::adduavmodel();
    var_3 = 6300;
    var_4 = randomint( 360 );
    var_5 = 6100;
    var_6 = cos( var_4 ) * var_5;
    var_7 = sin( var_4 ) * var_5;
    var_8 = vectornormalize( ( var_6, var_7, var_3 ) );
    var_8 *= 6100;
    var_2 linkto( level.uavrig, "tag_origin", var_8, ( 0, var_4 - 90, 10 ) );
    var_1 setclientdvar( "ui_reaper_targetDistance", -1 );
    var_1 setclientdvar( "ui_reaper_ammoCount", 14 );
    var_2 thread handledeath( var_1 );
    var_2 thread handletimeout( var_1 );
    var_2 thread handleownerchangeteam( var_1 );
    var_2 thread handleownerdisconnect( var_1 );
    var_2 thread handleincomingstinger();
    var_2 thread handleincomingsam();
    return var_2;
}

lookcenter( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    wait 0.05;
    var_1 = vectortoangles( level.uavrig.origin - var_0 gettagorigin( "tag_player" ) );
    self setplayerangles( var_1 );
}

remoteride( var_0 )
{
    maps\mp\_utility::_giveweapon( "mortar_remote_mp" );
    self switchtoweapon( "mortar_remote_mp" );
    thread waitsetthermal( 1.0, var_0 );
    thread maps\mp\_utility::reinitializethermal( var_0 );

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 0 );

    self playerlinkweaponviewtodelta( var_0, "tag_player", 1.0, 40, 40, 25, 40 );
    thread lookcenter( var_0 );
    common_scripts\utility::_disableweaponswitch();
    thread remotetargeting( var_0 );
    thread remotefiring( var_0 );
    thread remotezoom( var_0 );
}

waitsetthermal( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "death" );
    wait(var_0);
    self visionsetthermalforplayer( level.ac130.enhanced_vision, 0 );
    self.lastvisionsetthermal = level.ac130.enhanced_vision;
    self thermalvisionfofoverlayon();
}

remotetargeting( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "remote_done" );
    var_0 endon( "death" );
    var_0.targetent = spawnfx( level.remote_mortar_fx["laserTarget"], ( 0.0, 0.0, 0.0 ) );

    for (;;)
    {
        var_1 = self geteye();
        var_2 = anglestoforward( self getplayerangles() );
        var_3 = var_1 + var_2 * 15000;
        var_4 = bullettrace( var_1, var_3, 0, var_0.targetent );

        if ( isdefined( var_4["position"] ) )
        {
            var_0.targetent.origin = var_4["position"];
            triggerfx( var_0.targetent );
        }

        wait 0.05;
    }
}

remotefiring( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "remote_done" );
    var_0 endon( "death" );
    var_1 = gettime();
    var_2 = var_1 - 2200;
    var_3 = 14;
    self.firingreaper = 0;

    for (;;)
    {
        var_1 = gettime();

        if ( self attackbuttonpressed() && var_1 - var_2 > 3000 )
        {
            var_3--;
            self setclientdvar( "ui_reaper_ammoCount", var_3 );
            var_2 = var_1;
            self.firingreaper = 1;
            self playlocalsound( "reaper_fire" );
            self playrumbleonentity( "damage_heavy" );
            var_4 = self geteye();
            var_5 = anglestoforward( self getplayerangles() );
            var_6 = anglestoright( self getplayerangles() );
            var_7 = var_4 + var_5 * 100 + var_6 * -100;
            var_8 = magicbullet( "remote_mortar_missile_mp", var_7, var_0.targetent.origin, self );
            earthquake( 0.3, 0.5, var_4, 256 );
            var_8 missile_settargetent( var_0.targetent );
            var_8 missile_setflightmodedirect();
            var_8 thread remotemissiledistance( var_0 );
            var_8 thread remotemissilelife( var_0 );
            var_8 waittill( "death" );
            self setclientdvar( "ui_reaper_targetDistance", -1 );
            self.firingreaper = 0;

            if ( var_3 == 0 )
                break;
        }
        else
            wait 0.05;
    }

    self notify( "removed_reaper_ammo" );
    remoteendride( var_0 );
    var_0 thread remoteleave();
}

handletogglezoom( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "remote_done" );
    var_0 endon( "death" );
    self notifyonplayercommand( "remote_mortar_toggleZoom1", "+ads_akimbo_accessible" );

    for (;;)
    {
        var_1 = common_scripts\utility::waittill_any_return( "remote_mortar_toggleZoom1" );

        if ( !isdefined( self.remote_mortar_togglezoom ) )
            self.remote_mortar_togglezoom = 0;

        self.remote_mortar_togglezoom = 1 - self.remote_mortar_togglezoom;
    }
}

remotezoom( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "remote_done" );
    var_0 endon( "death" );
    self.remote_mortar_togglezoom = undefined;
    thread handletogglezoom( var_0 );
    var_0.zoomed = 0;
    var_1 = 0;

    for (;;)
    {
        if ( self adsbuttonpressed() )
        {
            wait 0.05;

            if ( isdefined( self.remote_mortar_togglezoom ) )
                var_1 = 1;

            break;
        }

        wait 0.05;
    }

    for (;;)
    {
        if ( !var_1 && self adsbuttonpressed() || var_1 && self.remote_mortar_togglezoom )
        {
            if ( var_0.zoomed == 0 )
            {
                maps\mp\_utility::_giveweapon( "mortar_remote_zoom_mp" );
                self switchtoweapon( "mortar_remote_zoom_mp" );
                var_0.zoomed = 1;
            }
        }
        else if ( !var_1 && !self adsbuttonpressed() || var_1 && !self.remote_mortar_togglezoom )
        {
            if ( var_0.zoomed == 1 )
            {
                maps\mp\_utility::_giveweapon( "mortar_remote_mp" );
                self switchtoweapon( "mortar_remote_mp" );
                var_0.zoomed = 0;
            }
        }

        wait 0.05;
    }
}

remotemissiledistance( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "remote_done" );
    self endon( "death" );

    for (;;)
    {
        var_1 = distance( self.origin, var_0.targetent.origin );
        var_0.owner setclientdvar( "ui_reaper_targetDistance", int( var_1 / 12 ) );
        wait 0.05;
    }
}

remotemissilelife( var_0 )
{
    self endon( "death" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 6 );
    playfx( level.remote_mortar_fx["missileExplode"], self.origin );
    self delete();
}

remoteendride( var_0 )
{
    if ( !maps\mp\_utility::isusingremote() )
        return;

    if ( isdefined( var_0 ) )
        var_0 notify( "helicopter_done" );

    self thermalvisionoff();
    self thermalvisionfofoverlayoff();
    self visionsetthermalforplayer( game["thermal_vision"], 0 );

    if ( isdefined( level.nukedetonated ) )
        self visionsetnakedforplayer( level.nukevisionset, 0 );
    else
        self visionsetnakedforplayer( "", 0 );

    self unlink();
    maps\mp\_utility::clearusingremote();

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 1 );

    self switchtoweapon( common_scripts\utility::getlastweapon() );
    var_1 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( "remote_mortar" );
    self takeweapon( var_1 );
    self takeweapon( "mortar_remote_zoom_mp" );
    self takeweapon( "mortar_remote_mp" );
    common_scripts\utility::_enableweaponswitch();
}

handletimeout( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "removed_reaper_ammo" );
    self endon( "death" );
    var_1 = 40.0;
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_1 );

    while ( var_0.firingreaper )
        wait 0.05;

    if ( isdefined( var_0 ) )
        var_0 remoteendride( self );

    thread remoteleave();
}

handledeath( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self endon( "remote_removed" );
    self endon( "remote_done" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 remoteendride( self );

    level thread removeremote( self );
}

handleownerchangeteam( var_0 )
{
    level endon( "game_ended" );
    self endon( "remote_done" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "removed_reaper_ammo" );
    var_0 common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );

    if ( isdefined( var_0 ) )
        var_0 remoteendride( self );

    thread remoteleave();
}

handleownerdisconnect( var_0 )
{
    level endon( "game_ended" );
    self endon( "remote_done" );
    self endon( "death" );
    var_0 endon( "removed_reaper_ammo" );
    var_0 waittill( "disconnect" );
    thread remoteleave();
}

removeremote( var_0 )
{
    self notify( "remote_removed" );

    if ( isdefined( var_0.targetent ) )
        var_0.targetent delete();

    if ( isdefined( var_0 ) )
    {
        var_0 delete();
        var_0 maps\mp\killstreaks\_uav::removeuavmodel();
    }

    level.remote_mortar = undefined;
}

remoteleave()
{
    level endon( "game_ended" );
    self endon( "death" );
    self notify( "remote_done" );
    self unlink();
    var_0 = self.origin + anglestoforward( self.angles ) * 20000;
    self moveto( var_0, 30 );
    playfxontag( level._effect["ac130_engineeffect"], self, "tag_origin" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 3 );
    self moveto( var_0, 4, 4, 0.0 );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 4 );
    level thread removeremote( self );
}

remoteexplode()
{
    self notify( "death" );
    self hide();
    var_0 = anglestoright( self.angles ) * 200;
    playfx( level.uav_fx["explode"], self.origin, var_0 );
}

damagetracker()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self.health = 999999;
    self.maxhealth = 1500;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_1 ) )
            continue;

        if ( !isdefined( self ) )
            return;

        if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
            self.wasdamagedfrombulletpenetration = 1;

        self.wasdamaged = 1;
        var_10 = var_0;

        if ( isplayer( var_1 ) )
        {
            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "" );

            if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
            {
                if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                    var_10 += var_0 * level.armorpiercingmod;
            }
        }

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "stinger_mp":
                case "javelin_mp":
                    self.largeprojectiledamage = 1;
                    var_10 = self.maxhealth + 1;
                    break;
                case "sam_projectile_mp":
                    self.largeprojectiledamage = 1;
                    break;
            }
        }

        self.damagetaken += var_10;

        if ( isdefined( self.owner ) )
            self.owner playlocalsound( "reaper_damaged" );

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
            {
                var_1 notify( "destroyed_killstreak", var_9 );
                thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_remote_mortar", var_1 );
                var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 50, var_9, var_4 );
                var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_REMOTE_MORTAR" );
                thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_1, var_0, var_4, var_9 );
            }

            thread remoteexplode();
            return;
        }
    }
}

handleincomingstinger()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "remote_done" );

    for (;;)
    {
        level waittill( "stinger_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        var_1 thread stingerproximitydetonate( var_2, var_0 );
    }
}

stingerproximitydetonate( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );

    if ( isdefined( var_0.owner ) )
        var_0.owner playlocalsound( "missile_incoming" );

    self missile_settargetent( var_0 );
    var_2 = distance( self.origin, var_0 getpointinbounds( 0, 0, 0 ) );
    var_3 = var_0 getpointinbounds( 0, 0, 0 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            var_4 = var_3;
        else
            var_4 = var_0 getpointinbounds( 0, 0, 0 );

        var_3 = var_4;
        var_5 = distance( self.origin, var_4 );

        if ( var_5 < 3000 && var_0.numflares > 0 )
        {
            var_0.numflares--;
            var_0 thread maps\mp\killstreaks\_helicopter::playflarefx();
            var_6 = var_0 maps\mp\killstreaks\_helicopter::deployflares();
            self missile_settargetent( var_6 );
            var_0 = var_6;

            if ( isdefined( var_0.owner ) )
                var_0.owner stoplocalsound( "missile_incoming" );

            return;
        }

        if ( var_5 < var_2 )
            var_2 = var_5;

        if ( var_5 > var_2 )
        {
            if ( var_5 > 1536 )
                return;

            if ( isdefined( var_0.owner ) )
            {
                var_0.owner stoplocalsound( "missile_incoming" );

                if ( level.teambased )
                {
                    if ( var_0.team != var_1.team )
                        radiusdamage( self.origin, 1000, 1000, 1000, var_1, "MOD_EXPLOSIVE", "stinger_mp" );
                }
                else
                    radiusdamage( self.origin, 1000, 1000, 1000, var_1, "MOD_EXPLOSIVE", "stinger_mp" );
            }

            self hide();
            wait 0.05;
            self delete();
        }

        wait 0.05;
    }
}

handleincomingsam()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "remote_done" );

    for (;;)
    {
        level waittill( "sam_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        level thread samproximitydetonate( var_2, var_0, var_1 );
    }
}

samproximitydetonate( var_0, var_1, var_2 )
{
    var_0 endon( "death" );

    if ( isdefined( var_0.owner ) )
        var_0.owner playlocalsound( "missile_incoming" );

    var_3 = 150;
    var_4 = 1000;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        if ( isdefined( var_2[var_6] ) )
        {
            var_5[var_6] = distance( var_2[var_6].origin, var_0 getpointinbounds( 0, 0, 0 ) );
            continue;
        }

        var_5[var_6] = undefined;
    }

    for (;;)
    {
        var_7 = var_0 getpointinbounds( 0, 0, 0 );
        var_8 = [];

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            if ( isdefined( var_2[var_6] ) )
                var_8[var_6] = distance( var_2[var_6].origin, var_7 );
        }

        for ( var_6 = 0; var_6 < var_8.size; var_6++ )
        {
            if ( isdefined( var_8[var_6] ) )
            {
                if ( var_8[var_6] < 3000 && var_0.numflares > 0 )
                {
                    var_0.numflares--;
                    var_0 thread maps\mp\killstreaks\_helicopter::playflarefx();
                    var_9 = var_0 maps\mp\killstreaks\_helicopter::deployflares();

                    for ( var_10 = 0; var_10 < var_2.size; var_10++ )
                    {
                        if ( isdefined( var_2[var_10] ) )
                            var_2[var_10] missile_settargetent( var_9 );
                    }

                    if ( isdefined( var_0.owner ) )
                        var_0.owner stoplocalsound( "missile_incoming" );

                    return;
                }

                if ( var_8[var_6] < var_5[var_6] )
                    var_5[var_6] = var_8[var_6];

                if ( var_8[var_6] > var_5[var_6] )
                {
                    if ( var_8[var_6] > 1536 )
                        continue;

                    if ( isdefined( var_0.owner ) )
                    {
                        var_0.owner stoplocalsound( "missile_incoming" );

                        if ( level.teambased )
                        {
                            if ( var_0.team != var_1.team )
                                radiusdamage( var_2[var_6].origin, var_4, var_3, var_3, var_1, "MOD_EXPLOSIVE", "sam_projectile_mp" );
                        }
                        else
                            radiusdamage( var_2[var_6].origin, var_4, var_3, var_3, var_1, "MOD_EXPLOSIVE", "sam_projectile_mp" );
                    }

                    var_2[var_6] hide();
                    wait 0.05;
                    var_2[var_6] delete();
                }
            }
        }

        wait 0.05;
    }
}
