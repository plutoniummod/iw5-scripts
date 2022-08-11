// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["remote_tank"] = ::tryuseremotetank;
    level.tanksettings = [];
    level.tanksettings["remote_tank"] = spawnstruct();
    level.tanksettings["remote_tank"].timeout = 60.0;
    level.tanksettings["remote_tank"].health = 99999;
    level.tanksettings["remote_tank"].maxhealth = 1000;
    level.tanksettings["remote_tank"].streakname = "remote_tank";
    level.tanksettings["remote_tank"].mgturretinfo = "ugv_turret_mp";
    level.tanksettings["remote_tank"].glturretinfo = "remote_tank_projectile_mp";
    level.tanksettings["remote_tank"].sentrymodeoff = "sentry_offline";
    level.tanksettings["remote_tank"].weaponinfo = "remote_ugv_mp";
    level.tanksettings["remote_tank"].modelbase = "vehicle_ugv_talon_mp";
    level.tanksettings["remote_tank"].modelmgturret = "vehicle_ugv_talon_gun_mp";
    level.tanksettings["remote_tank"].modelplacement = "vehicle_ugv_talon_obj";
    level.tanksettings["remote_tank"].modelplacementfailed = "vehicle_ugv_talon_obj_red";
    level.tanksettings["remote_tank"].modeldestroyed = "vehicle_ugv_talon_mp";
    level.tanksettings["remote_tank"].stringplace = &"MP_REMOTE_TANK_PLACE";
    level.tanksettings["remote_tank"].stringcannotplace = &"MP_REMOTE_TANK_CANNOT_PLACE";
    level.tanksettings["remote_tank"].laptopinfo = "killstreak_remote_tank_laptop_mp";
    level.tanksettings["remote_tank"].remoteinfo = "killstreak_remote_tank_remote_mp";
    makedvarserverinfo( "ui_remoteTankUseTime", level.tanksettings["remote_tank"].timeout );
    precachemenu( "remotetank_timer" );

    foreach ( var_1 in level.tanksettings )
    {
        precachemodel( var_1.modelbase );
        precachemodel( var_1.modelmgturret );
        precachemodel( var_1.modelplacement );
        precachemodel( var_1.modelplacementfailed );
        precachemodel( var_1.modeldestroyed );
        precacheturret( var_1.mgturretinfo );
        precachevehicle( var_1.weaponinfo );
        precachestring( var_1.stringplace );
        precachestring( var_1.stringcannotplace );
        precacheitem( var_1.laptopinfo );
        precacheitem( var_1.remoteinfo );
        precacheitem( var_1.glturretinfo );
    }

    level._effect["remote_tank_dying"] = loadfx( "explosions/killstreak_explosion_quick" );
    level._effect["remote_tank_explode"] = loadfx( "explosions/bouncing_betty_explosion" );
    level._effect["remote_tank_spark"] = loadfx( "impacts/large_metal_painted_hit" );
    level._effect["remote_tank_antenna_light_mp"] = loadfx( "misc/aircraft_light_red_blink" );
    level._effect["remote_tank_camera_light_mp"] = loadfx( "misc/aircraft_light_wingtip_green" );
    level.remote_tank_armor_bulletdamage = 0.5;
}

tryuseremotetank( var_0 )
{
    var_1 = 1;

    if ( !maps\mp\_utility::validateusestreak() )
        return 0;
    else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_1 >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    maps\mp\_utility::incrementfauxvehiclecount();
    var_2 = givetank( var_0, "remote_tank" );

    if ( var_2 )
    {
        maps\mp\_matchdata::logkillstreakevent( "remote_tank", self.origin );
        thread maps\mp\_utility::teamplayercardsplash( "used_remote_tank", self );
        takekillstreakweapons( "remote_tank" );
    }
    else
        maps\mp\_utility::decrementfauxvehiclecount();

    self.iscarrying = 0;
    return var_2;
}

takekillstreakweapons( var_0 )
{
    var_1 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( level.tanksettings[var_0].streakname );
    maps\mp\killstreaks\_killstreaks::takekillstreakweaponifnodupe( var_1 );
    self takeweapon( level.tanksettings[var_0].laptopinfo );
    self takeweapon( level.tanksettings[var_0].remoteinfo );
}

removeperks()
{
    if ( maps\mp\_utility::_hasperk( "specialty_explosivebullets" ) )
    {
        self.restoreperk = "specialty_explosivebullets";
        maps\mp\_utility::_unsetperk( "specialty_explosivebullets" );
    }
}

restoreperks()
{
    if ( isdefined( self.restoreperk ) )
    {
        maps\mp\_utility::giveperk( self.restoreperk, 0 );
        self.restoreperk = undefined;
    }
}

waitrestoreperks()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    restoreperks();
}

removeweapons()
{
    foreach ( var_1 in self.weaponlist )
    {
        var_2 = strtok( var_1, "_" );

        if ( var_2[0] == "alt" )
        {
            self.restoreweaponclipammo[var_1] = self getweaponammoclip( var_1 );
            self.restoreweaponstockammo[var_1] = self getweaponammostock( var_1 );
            continue;
        }

        self.restoreweaponclipammo[var_1] = self getweaponammoclip( var_1 );
        self.restoreweaponstockammo[var_1] = self getweaponammostock( var_1 );
    }

    self.weaponstorestore = [];

    foreach ( var_1 in self.weaponlist )
    {
        var_2 = strtok( var_1, "_" );

        if ( var_2[0] == "alt" )
            continue;

        self.weaponstorestore[self.weaponstorestore.size] = var_1;
        self takeweapon( var_1 );
    }
}

restoreweapons()
{
    if ( !isdefined( self.restoreweaponclipammo ) || !isdefined( self.restoreweaponstockammo ) || !isdefined( self.weaponstorestore ) )
        return;

    var_0 = [];

    foreach ( var_2 in self.weaponstorestore )
    {
        var_3 = strtok( var_2, "_" );

        if ( var_3[0] == "alt" )
        {
            var_0[var_0.size] = var_2;
            continue;
        }

        maps\mp\_utility::_giveweapon( var_2 );

        if ( isdefined( self.restoreweaponclipammo[var_2] ) )
            self setweaponammoclip( var_2, self.restoreweaponclipammo[var_2] );

        if ( isdefined( self.restoreweaponstockammo[var_2] ) )
            self setweaponammostock( var_2, self.restoreweaponstockammo[var_2] );
    }

    foreach ( var_6 in var_0 )
    {
        if ( isdefined( self.restoreweaponclipammo[var_6] ) )
            self setweaponammoclip( var_6, self.restoreweaponclipammo[var_6] );

        if ( isdefined( self.restoreweaponstockammo[var_6] ) )
            self setweaponammostock( var_6, self.restoreweaponstockammo[var_6] );
    }

    self.restoreweaponclipammo = undefined;
    self.restoreweaponstockammo = undefined;
}

waitrestoreweapons()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    restoreweapons();
}

givetank( var_0, var_1 )
{
    var_2 = createtankforplayer( var_1, self );
    var_2.lifeid = var_0;
    removeperks();
    removeweapons();
    var_3 = setcarryingtank( var_2, 1 );
    thread restoreperks();
    thread restoreweapons();

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    return var_3;
}

createtankforplayer( var_0, var_1 )
{
    var_2 = spawnturret( "misc_turret", var_1.origin + ( 0.0, 0.0, 25.0 ), level.tanksettings[var_0].mgturretinfo );
    var_2.angles = var_1.angles;
    var_2.tanktype = var_0;
    var_2.owner = var_1;
    var_2 setmodel( level.tanksettings[var_0].modelbase );
    var_2 maketurretinoperable();
    var_2 setturretmodechangewait( 1 );
    var_2 setmode( "sentry_offline" );
    var_2 makeunusable();
    var_2 setsentryowner( var_1 );
    return var_2;
}

setcarryingtank( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 thread tank_setcarried( self );
    common_scripts\utility::_disableweapon();
    self notifyonplayercommand( "place_tank", "+attack" );
    self notifyonplayercommand( "place_tank", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_tank", "+actionslot 4" );

    for (;;)
    {
        var_2 = common_scripts\utility::waittill_any_return( "place_tank", "cancel_tank", "force_cancel_placement" );

        if ( var_2 == "cancel_tank" || var_2 == "force_cancel_placement" )
        {
            if ( !var_1 && var_2 == "cancel_tank" )
                continue;

            var_3 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( level.tanksettings[var_0.tanktype].streakname );

            if ( isdefined( self.killstreakindexweapon ) && var_3 == maps\mp\killstreaks\_killstreaks::getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) && !self getweaponslistitems().size )
            {
                maps\mp\_utility::_giveweapon( var_3, 0 );
                maps\mp\_utility::_setactionslot( 4, "weapon", var_3 );
            }

            var_0 tank_setcancelled();
            common_scripts\utility::_enableweapon();
            return 0;
        }

        if ( !var_0.canbeplaced )
            continue;

        var_0 thread tank_setplaced();
        common_scripts\utility::_enableweapon();
        return 1;
    }
}

tank_setcarried( var_0 )
{
    self setmodel( level.tanksettings[self.tanktype].modelplacement );
    self setsentrycarrier( var_0 );
    self setcontents( 0 );
    self setcandamage( 0 );
    self.carriedby = var_0;
    var_0.iscarrying = 1;
    var_0 thread updatetankplacement( self );
    thread tank_oncarrierdeath( var_0 );
    thread tank_oncarrierdisconnect( var_0 );
    thread tank_ongameended();
    self notify( "carried" );
}

updatetankplacement( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0.canbeplaced = 1;
    var_1 = -1;

    for (;;)
    {
        var_2 = self canplayerplacetank( 25.0, 25.0, 50.0, 40.0, 80.0, 0.7 );
        var_0.origin = var_2["origin"];
        var_0.angles = var_2["angles"];
        var_0.canbeplaced = self isonground() && var_2["result"] && abs( var_2["origin"][2] - self.origin[2] ) < 20;

        if ( var_0.canbeplaced != var_1 )
        {
            if ( var_0.canbeplaced )
            {
                var_0 setmodel( level.tanksettings[var_0.tanktype].modelplacement );

                if ( self.team != "spectator" )
                    self forceusehinton( level.tanksettings[var_0.tanktype].stringplace );
            }
            else
            {
                var_0 setmodel( level.tanksettings[var_0.tanktype].modelplacementfailed );

                if ( self.team != "spectator" )
                    self forceusehinton( level.tanksettings[var_0.tanktype].stringcannotplace );
            }
        }

        var_1 = var_0.canbeplaced;
        wait 0.05;
    }
}

tank_oncarrierdeath( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "death" );
    tank_setcancelled();
}

tank_oncarrierdisconnect( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    tank_setcancelled();
}

tank_ongameended( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    tank_setcancelled();
}

tank_setcancelled()
{
    if ( isdefined( self.carriedby ) )
        self.carriedby forceusehintoff();

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    self delete();
}

tank_setplaced()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "placed" );
    self.carriedby forceusehintoff();
    self.carriedby = undefined;

    if ( !isdefined( self.owner ) )
        return 0;

    var_0 = self.owner;
    var_0.iscarrying = 0;
    var_1 = createtank( self );

    if ( !isdefined( var_1 ) )
        return 0;

    var_1 playsound( "sentry_gun_plant" );
    var_1 notify( "placed" );
    var_1 thread tank_setactive();
    self delete();
}

tank_giveweapononplaced()
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;
    var_0 endon( "death" );
    self waittill( "placed" );
    var_0 takekillstreakweapons( self.tanktype );
    var_0 maps\mp\_utility::_giveweapon( level.tanksettings[self.tanktype].laptopinfo );
    var_0 switchtoweaponimmediate( level.tanksettings[self.tanktype].laptopinfo );
}

createtank( var_0 )
{
    var_1 = var_0.owner;
    var_2 = var_0.tanktype;
    var_3 = var_0.lifeid;
    var_4 = spawnvehicle( level.tanksettings[var_2].modelbase, var_2, level.tanksettings[var_2].weaponinfo, var_0.origin, var_0.angles, var_1 );

    if ( !isdefined( var_4 ) )
        return undefined;

    var_5 = var_4 gettagorigin( "tag_turret_attach" );
    var_6 = spawnturret( "misc_turret", var_5, level.tanksettings[var_2].mgturretinfo, 0 );
    var_6 linkto( var_4, "tag_turret_attach", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_6 setmodel( level.tanksettings[var_2].modelmgturret );
    var_6.health = level.tanksettings[var_2].health;
    var_6.owner = var_1;
    var_6.angles = var_1.angles;
    var_6.specialdamagecallback = ::callback_vehicledamage;
    var_6.tank = var_4;
    var_6 makeunusable();
    var_6 setdefaultdroppitch( 0 );
    var_6 setcandamage( 0 );
    var_4.specialdamagecallback = ::callback_vehicledamage;
    var_4.lifeid = var_3;
    var_4.team = var_1.team;
    var_4.owner = var_1;
    var_4.mgturret = var_6;
    var_4.health = level.tanksettings[var_2].health;
    var_4.maxhealth = level.tanksettings[var_2].maxhealth;
    var_4.damagetaken = 0;
    var_4.destroyed = 0;
    var_4 setcandamage( 0 );
    var_4.tanktype = var_2;
    var_6 setturretmodechangewait( 1 );
    var_4 tank_setinactive();
    var_6 setsentryowner( var_1 );
    var_1.using_remote_tank = 0;
    var_1 setplayerdata( "ugvMissile", 1 );
    var_1 setplayerdata( "ugvDamageFade", 1.0 );
    var_1 setplayerdata( "ugvDamaged", 0 );
    var_1 setplayerdata( "ugvDamageState", 0 );
    var_1 setplayerdata( "ugvBullets", 0 );
    var_1 setplayerdata( "ugvMaxBullets", 0 );
    var_4.empgrenaded = 0;
    var_4.damagefade = 1.0;
    var_4 thread tank_incrementdamagefade();
    var_4 thread tank_watchlowhealth();
    var_4 thread tank_giveweapononplaced();
    return var_4;
}

tank_setactive()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self makeunusable();
    self.mgturret maketurretsolid();
    self.mgturret setcandamage( 1 );
    self makevehiclesolidcapsule( 23, 23, 23 );
    self setcandamage( 1 );

    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;
    var_1 = ( 0.0, 0.0, 20.0 );

    if ( level.teambased )
    {
        self.team = var_0.team;
        self.mgturret.team = var_0.team;
        self.mgturret setturretteam( var_0.team );

        foreach ( var_3 in level.players )
        {
            if ( var_3 != var_0 && var_3.team == var_0.team )
            {
                var_4 = self.mgturret maps\mp\_entityheadicons::setheadicon( var_3, maps\mp\gametypes\_teams::getteamheadicon( self.team ), var_1, 10, 10, 0, 0.05, 0, 1, 0, 1 );

                if ( isdefined( var_4 ) )
                    var_4 settargetent( self );
            }
        }
    }

    thread tank_handledisconnect();
    thread tank_handlechangeteams();
    thread tank_handledeath();
    thread tank_handletimeout();
    thread tank_blinkylightantenna();
    thread tank_blinkylightcamera();
    startusingtank();
    var_0 openmenu( "remotetank_timer" );
}

startusingtank()
{
    var_0 = self.owner;
    var_0 maps\mp\_utility::setusingremote( self.tanktype );

    if ( getdvarint( "camera_thirdPerson" ) )
        var_0 maps\mp\_utility::setthirdpersondof( 0 );

    var_0.restoreangles = var_0.angles;
    var_0 maps\mp\_utility::freezecontrolswrapper( 1 );
    var_1 = var_0 maps\mp\killstreaks\_killstreaks::initridekillstreak();

    if ( var_1 != "success" )
    {
        if ( var_1 != "disconnect" )
            var_0 maps\mp\_utility::clearusingremote();

        if ( isdefined( var_0.disabledweapon ) && var_0.disabledweapon )
            var_0 common_scripts\utility::_enableweapon();

        self notify( "death" );
        return 0;
    }

    var_0 maps\mp\_utility::freezecontrolswrapper( 0 );
    var_0 remotecontrolvehicle( self );
    var_0 remotecontrolturret( self.mgturret );
    var_0 thread tank_watchfiring( self );
    var_0 thread tank_firemissiles( self );
    thread tank_earthquake();
    thread tank_playerexit();
    var_0.using_remote_tank = 1;

    if ( var_0 maps\mp\_utility::isjuggernaut() )
        var_0.juggernautoverlay.alpha = 0;

    var_0 maps\mp\_utility::_giveweapon( level.tanksettings[self.tanktype].remoteinfo );
    var_0 switchtoweaponimmediate( level.tanksettings[self.tanktype].remoteinfo );
    thread tank_handledamage();
    self.mgturret thread tank_turret_handledamage();
}

tank_blinkylightantenna()
{
    self endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "remote_tank_antenna_light_mp" ), self.mgturret, "tag_headlight_right" );
        wait 1.0;
        stopfxontag( common_scripts\utility::getfx( "remote_tank_antenna_light_mp" ), self.mgturret, "tag_headlight_right" );
    }
}

tank_blinkylightcamera()
{
    self endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "remote_tank_camera_light_mp" ), self.mgturret, "tag_tail_light_right" );
        wait 2.0;
        stopfxontag( common_scripts\utility::getfx( "remote_tank_camera_light_mp" ), self.mgturret, "tag_tail_light_right" );
    }
}

tank_setinactive()
{
    self.mgturret setmode( level.tanksettings[self.tanktype].sentrymodeoff );

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( "none", ( 0.0, 0.0, 0.0 ) );
    else if ( isdefined( self.owner ) )
        maps\mp\_entityheadicons::setplayerheadicon( undefined, ( 0.0, 0.0, 0.0 ) );

    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;

    if ( isdefined( var_0.using_remote_tank ) && var_0.using_remote_tank )
    {
        var_0 notify( "end_remote" );
        var_0 remotecontrolvehicleoff( self );
        var_0 remotecontrolturretoff( self.mgturret );
        var_0 switchtoweapon( var_0 common_scripts\utility::getlastweapon() );
        var_0 maps\mp\_utility::clearusingremote();
        var_0 setplayerangles( var_0.restoreangles );

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 maps\mp\_utility::setthirdpersondof( 1 );

        if ( isdefined( var_0.disabledusability ) && var_0.disabledusability )
            var_0 common_scripts\utility::_enableusability();

        var_0 takekillstreakweapons( level.tanksettings[self.tanktype].streakname );
        var_0.using_remote_tank = 0;
        var_0 thread tank_freezebuffer();
    }
}

tank_freezebuffer()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    maps\mp\_utility::freezecontrolswrapper( 1 );
    wait 0.5;
    maps\mp\_utility::freezecontrolswrapper( 0 );
}

tank_handledisconnect()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self notify( "death" );
}

tank_handlechangeteams()
{
    self endon( "death" );
    self.owner common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    self notify( "death" );
}

tank_handletimeout()
{
    self endon( "death" );
    var_0 = level.tanksettings[self.tanktype].timeout;
    setdvar( "ui_remoteTankUseTime", var_0 );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self notify( "death" );
}

tank_handledeath()
{
    level endon( "game_ended" );
    var_0 = self getentitynumber();
    addtougvlist( var_0 );
    self waittill( "death" );
    self playsound( "talon_destroyed" );
    removefromugvlist( var_0 );
    self setmodel( level.tanksettings[self.tanktype].modeldestroyed );

    if ( isdefined( self.owner ) && ( self.owner.using_remote_tank || self.owner maps\mp\_utility::isusingremote() ) )
    {
        self.owner setplayerdata( "ugvDamageState", 0 );
        tank_setinactive();
        self.owner.using_remote_tank = 0;

        if ( self.owner maps\mp\_utility::isjuggernaut() )
            self.owner.juggernautoverlay.alpha = 1;
    }

    self.mgturret setdefaultdroppitch( 40 );
    self.mgturret setsentryowner( undefined );
    self playsound( "sentry_explode" );
    playfxontag( level._effect["remote_tank_dying"], self.mgturret, "tag_aim" );
    wait 2.0;
    playfx( level._effect["remote_tank_explode"], self.origin );
    self.mgturret delete();
    maps\mp\_utility::decrementfauxvehiclecount();
    self delete();
}

callback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = self;

    if ( isdefined( self.tank ) )
        var_12 = self.tank;

    if ( isdefined( var_12.alreadydead ) && var_12.alreadydead )
        return;

    if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( var_12.owner, var_1 ) )
        return;

    if ( isdefined( var_3 ) && var_3 & level.idflags_penetration )
        var_12.wasdamagedfrombulletpenetration = 1;

    var_12.wasdamaged = 1;
    var_12.damagefade = 0.0;
    var_12.owner setplayerdata( "ugvDamaged", 1 );
    playfxontagforclients( level._effect["remote_tank_spark"], var_12, "tag_player", var_12.owner );

    switch ( var_5 )
    {
        case "artillery_mp":
        case "stealth_bomb_mp":
            var_2 *= 4;
            break;
    }

    if ( var_4 == "MOD_MELEE" )
        var_2 = var_12.maxhealth * 0.5;

    var_13 = var_2;

    if ( isplayer( var_1 ) )
    {
        var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "remote_tank" );

        if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
        {
            if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                var_13 += var_2 * level.armorpiercingmod;
        }

        if ( isexplosivedamagemod( var_4 ) )
            var_13 += var_2;
    }

    if ( isexplosivedamagemod( var_4 ) && var_5 == "destructible_car" )
        var_13 = var_12.maxhealth;

    if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
        var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "remote_tank" );

    if ( isdefined( var_5 ) )
    {
        switch ( var_5 )
        {
            case "ac130_105mm_mp":
            case "ac130_40mm_mp":
            case "remotemissile_projectile_mp":
            case "remote_mortar_missile_mp":
            case "stinger_mp":
            case "javelin_mp":
                var_12.largeprojectiledamage = 1;
                var_13 = var_12.maxhealth + 1;
                break;
            case "artillery_mp":
            case "stealth_bomb_mp":
                var_12.largeprojectiledamage = 0;
                var_13 = var_12.maxhealth * 0.5;
                break;
            case "bomb_site_mp":
                var_12.largeprojectiledamage = 0;
                var_13 = var_12.maxhealth + 1;
                break;
            case "emp_grenade_mp":
                var_13 = 0;
                var_12 thread tank_empgrenaded();
                break;
            case "ims_projectile_mp":
                var_12.largeprojectiledamage = 1;
                var_13 = var_12.maxhealth * 0.5;
                break;
        }
    }

    var_12.damagetaken += var_13;
    var_12 playsound( "talon_damaged" );

    if ( var_12.damagetaken >= var_12.maxhealth )
    {
        if ( isplayer( var_1 ) && ( !isdefined( var_12.owner ) || var_1 != var_12.owner ) )
        {
            var_12.alreadydead = 1;
            var_1 notify( "destroyed_killstreak", var_5 );
            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_remote_tank", var_1 );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 300, var_5, var_4 );
            var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_REMOTE_TANK" );
            thread maps\mp\gametypes\_missions::vehiclekilled( var_12.owner, var_12, undefined, var_1, var_2, var_4, var_5 );
        }

        var_12 notify( "death" );
    }
}

tank_empgrenaded()
{
    self notify( "tank_EMPGrenaded" );
    self endon( "tank_EMPGrenaded" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self.empgrenaded = 1;
    self.owner setplayerdata( "ugvDamageFade", 0 );
    var_0 = self.owner getplayerdata( "ugvBullets" );
    self.owner setplayerdata( "ugvBullets", 0 );
    self.owner setplayerdata( "ugvMissile", 0 );
    self.mgturret turretfiredisable();
    wait 3.5;
    self.empgrenaded = 0;
    self.owner setplayerdata( "ugvBullets", var_0 );
    self.owner setplayerdata( "ugvMissile", 1 );
    self.mgturret turretfireenable();
}

tank_incrementdamagefade()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( !self.empgrenaded )
        {
            if ( self.damagefade < 1.0 )
            {
                self.owner setplayerdata( "ugvDamageFade", self.damagefade );
                self.damagefade += 0.1;
                var_0 = 1;
            }
            else if ( var_0 )
            {
                self.damagefade = 1.0;
                self.owner setplayerdata( "ugvDamageFade", self.damagefade );
                self.owner setplayerdata( "ugvDamaged", 0 );
                var_0 = 0;
            }
        }

        wait 0.1;
    }
}

tank_watchlowhealth()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 0.1;
    var_1 = 1;
    var_2 = 1;

    for (;;)
    {
        if ( var_2 )
        {
            if ( self.damagetaken > 0 )
            {
                var_2 = 0;
                self.owner setplayerdata( "ugvDamageState", var_1 );
                var_1++;
            }
        }
        else if ( self.damagetaken >= self.maxhealth * ( var_0 * var_1 ) )
        {
            self.owner setplayerdata( "ugvDamageState", var_1 );
            var_1++;
        }

        wait 0.05;
    }
}

tank_handledamage()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( self.specialdamagecallback ) )
            self [[ self.specialdamagecallback ]]( undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7 );
    }
}

tank_turret_handledamage()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( self.specialdamagecallback ) && isdefined( self.tank ) && ( !isexplosivedamagemod( var_4 ) || isdefined( var_9 ) && isexplosivedamagemod( var_4 ) && ( var_9 == "stealth_bomb_mp" || var_9 == "artillery_mp" ) ) )
            self.tank [[ self.specialdamagecallback ]]( undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7 );
    }
}

tank_watchfiring( var_0 )
{
    self endon( "disconnect" );
    self endon( "end_remote" );
    var_0 endon( "death" );
    var_1 = 50;
    var_2 = var_1;
    self setplayerdata( "ugvMaxBullets", var_1 );
    self setplayerdata( "ugvBullets", var_2 );
    var_3 = weaponfiretime( level.tanksettings[var_0.tanktype].mgturretinfo );

    for (;;)
    {
        if ( var_0.mgturret isfiringvehicleturret() )
        {
            var_2--;
            self setplayerdata( "ugvBullets", var_2 );

            if ( var_2 <= 0 )
            {
                var_0.mgturret turretfiredisable();
                wait 2.5;
                var_0 playsound( "talon_reload" );
                self playlocalsound( "talon_reload_plr" );
                var_2 = var_1;
                self setplayerdata( "ugvBullets", var_2 );
                var_0.mgturret turretfireenable();
            }
        }

        wait(var_3);
    }
}

tank_firemissiles( var_0 )
{
    self endon( "disconnect" );
    self endon( "end_remote" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_1 = 0;

    for (;;)
    {
        if ( self fragbuttonpressed() && !var_0.empgrenaded )
        {
            var_2 = var_0.mgturret.origin;
            var_3 = var_0.mgturret.angles;

            switch ( var_1 )
            {
                case 0:
                    var_2 = var_0.mgturret gettagorigin( "tag_missile1" );
                    var_3 = var_0.mgturret gettagangles( "tag_player" );
                    break;
                case 1:
                    var_2 = var_0.mgturret gettagorigin( "tag_missile2" );
                    var_3 = var_0.mgturret gettagangles( "tag_player" );
                    break;
            }

            var_0 playsound( "talon_missile_fire" );
            self playlocalsound( "talon_missile_fire_plr" );
            var_4 = var_2 + anglestoforward( var_3 ) * 100;
            var_5 = magicbullet( level.tanksettings[var_0.tanktype].glturretinfo, var_2, var_4, self );
            var_1 = ( var_1 + 1 ) % 2;
            self setplayerdata( "ugvMissile", 0 );
            wait 5.0;
            var_0 playsound( "talon_rocket_reload" );
            self playlocalsound( "talon_rocket_reload_plr" );
            self setplayerdata( "ugvMissile", 1 );
            continue;
        }

        wait 0.05;
    }
}

tank_earthquake()
{
    self endon( "death" );
    self.owner endon( "end_remote" );

    for (;;)
    {
        earthquake( 0.1, 0.25, self.mgturret gettagorigin( "tag_player" ), 50 );
        wait 0.25;
    }
}

addtougvlist( var_0 )
{
    level.ugvs[var_0] = self;
}

removefromugvlist( var_0 )
{
    level.ugvs[var_0] = undefined;
}

tank_playerexit()
{
    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "end_remote" );
    self endon( "death" );

    for (;;)
    {
        var_1 = 0;

        while ( var_0 usebuttonpressed() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.75 )
            {
                self notify( "death" );
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}
