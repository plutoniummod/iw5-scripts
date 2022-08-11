// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.turrettype = [];
    level.turrettype["mg_turret"] = "remote_mg_turret";
    level.killstreakfuncs["remote_mg_turret"] = ::tryuseremotemgturret;
    level.turretsettings = [];
    level.turretsettings["mg_turret"] = spawnstruct();
    level.turretsettings["mg_turret"].sentrymodeon = "manual";
    level.turretsettings["mg_turret"].sentrymodeoff = "sentry_offline";
    level.turretsettings["mg_turret"].timeout = 60.0;
    level.turretsettings["mg_turret"].health = 999999;
    level.turretsettings["mg_turret"].maxhealth = 1000;
    level.turretsettings["mg_turret"].streakname = "remote_mg_turret";
    level.turretsettings["mg_turret"].weaponinfo = "remote_turret_mp";
    level.turretsettings["mg_turret"].modelbase = "mp_remote_turret";
    level.turretsettings["mg_turret"].modelplacement = "mp_remote_turret_placement";
    level.turretsettings["mg_turret"].modelplacementfailed = "mp_remote_turret_placement_failed";
    level.turretsettings["mg_turret"].modeldestroyed = "mp_remote_turret";
    level.turretsettings["mg_turret"].teamsplash = "used_remote_mg_turret";
    level.turretsettings["mg_turret"].hintenter = &"MP_ENTER_REMOTE_TURRET";
    level.turretsettings["mg_turret"].hintexit = &"MP_EARLY_EXIT";
    level.turretsettings["mg_turret"].hintpickup = &"MP_DOUBLE_TAP_TO_CARRY";
    level.turretsettings["mg_turret"].placestring = &"MP_TURRET_PLACE";
    level.turretsettings["mg_turret"].cannotplacestring = &"MP_TURRET_CANNOT_PLACE";
    level.turretsettings["mg_turret"].vodestroyed = "remote_sentry_destroyed";
    level.turretsettings["mg_turret"].laptopinfo = "killstreak_remote_turret_laptop_mp";
    level.turretsettings["mg_turret"].remoteinfo = "killstreak_remote_turret_remote_mp";

    foreach ( var_1 in level.turretsettings )
    {
        precacheitem( var_1.weaponinfo );
        precachemodel( var_1.modelbase );
        precachemodel( var_1.modelplacement );
        precachemodel( var_1.modelplacementfailed );
        precachemodel( var_1.modeldestroyed );
        precachestring( var_1.hintenter );
        precachestring( var_1.hintexit );
        precachestring( var_1.placestring );
        precachestring( var_1.cannotplacestring );
        precacheitem( var_1.laptopinfo );
        precacheitem( var_1.remoteinfo );
    }

    level._effect["sentry_explode_mp"] = loadfx( "explosions/sentry_gun_explosion" );
    level._effect["sentry_smoke_mp"] = loadfx( "smoke/car_damage_blacksmoke" );
    level._effect["antenna_light_mp"] = loadfx( "lights/light_detonator_blink" );
}

tryuseremotemgturret( var_0 )
{
    var_1 = tryuseremoteturret( var_0, "mg_turret" );

    if ( var_1 )
        maps\mp\_matchdata::logkillstreakevent( level.turretsettings["mg_turret"].streakname, self.origin );

    self.iscarrying = 0;
    return var_1;
}

takekillstreakweapons( var_0 )
{
    self takeweapon( level.turretsettings[var_0].laptopinfo );
    self takeweapon( level.turretsettings[var_0].remoteinfo );
}

tryuseremoteturret( var_0, var_1 )
{
    if ( maps\mp\_utility::isusingremote() )
        return 0;

    var_2 = createturretforplayer( var_1, self );
    removeperks();
    setcarryingturret( var_2, 1 );
    thread restoreperks();

    if ( isdefined( var_2 ) )
        return 1;
    else
        return 0;
}

setcarryingturret( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 turret_setcarried( self );
    common_scripts\utility::_disableweapon();
    self notifyonplayercommand( "place_turret", "+attack" );
    self notifyonplayercommand( "place_turret", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_turret", "+actionslot 4" );

    for (;;)
    {
        var_2 = common_scripts\utility::waittill_any_return( "place_turret", "cancel_turret", "force_cancel_placement" );

        if ( var_2 == "cancel_turret" || var_2 == "force_cancel_placement" )
        {
            if ( var_2 == "cancel_turret" && !var_1 )
                continue;

            var_3 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( level.turretsettings[var_0.turrettype].streakname );

            if ( isdefined( self.killstreakindexweapon ) && var_3 == maps\mp\killstreaks\_killstreaks::getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) && !self getweaponslistitems().size )
            {
                maps\mp\_utility::_giveweapon( var_3, 0 );
                maps\mp\_utility::_setactionslot( 4, "weapon", var_3 );
            }

            var_0 turret_setcancelled();
            common_scripts\utility::_enableweapon();
            return 0;
        }

        if ( !var_0.canbeplaced )
            continue;

        var_0 turret_setplaced();
        common_scripts\utility::_enableweapon();
        return 1;
    }
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

turret_setplaced()
{
    self setmodel( level.turretsettings[self.turrettype].modelbase );
    self setsentrycarrier( undefined );
    self setcandamage( 1 );
    self.carriedby forceusehintoff();
    self.carriedby = undefined;

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    self playsound( "sentry_gun_plant" );
    thread turret_setactive();
    self notify( "placed" );
}

turret_setcancelled()
{
    self.carriedby forceusehintoff();

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    self delete();
}

turret_setcarried( var_0 )
{
    self setmodel( level.turretsettings[self.turrettype].modelplacement );
    self setcandamage( 0 );
    self setsentrycarrier( var_0 );
    self setcontents( 0 );
    self.carriedby = var_0;
    var_0.iscarrying = 1;
    var_0 thread updateturretplacement( self );
    thread turret_oncarrierdeath( var_0 );
    thread turret_oncarrierdisconnect( var_0 );
    thread turret_oncarrierchangedteam( var_0 );
    thread turret_ongameended();
    self setdefaultdroppitch( -89.0 );
    turret_setinactive();
    self notify( "carried" );
}

updateturretplacement( var_0 )
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
        var_2 = self canplayerplacesentry();
        var_0.origin = var_2["origin"];
        var_0.angles = var_2["angles"];
        var_0.canbeplaced = self isonground() && var_2["result"] && abs( var_0.origin[2] - self.origin[2] ) < 10;

        if ( var_0.canbeplaced != var_1 )
        {
            if ( var_0.canbeplaced )
            {
                var_0 setmodel( level.turretsettings[var_0.turrettype].modelplacement );
                self forceusehinton( level.turretsettings[var_0.turrettype].placestring );
            }
            else
            {
                var_0 setmodel( level.turretsettings[var_0.turrettype].modelplacementfailed );
                self forceusehinton( level.turretsettings[var_0.turrettype].cannotplacestring );
            }
        }

        var_1 = var_0.canbeplaced;
        wait 0.05;
    }
}

turret_oncarrierdeath( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "death" );

    if ( self.canbeplaced )
        turret_setplaced();
    else
        self delete();
}

turret_oncarrierdisconnect( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self delete();
}

turret_oncarrierchangedteam( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    self delete();
}

turret_ongameended( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    self delete();
}

createturretforplayer( var_0, var_1 )
{
    var_2 = spawnturret( "misc_turret", var_1.origin, level.turretsettings[var_0].weaponinfo );
    var_2.angles = var_1.angles;
    var_2 setmodel( level.turretsettings[var_0].modelbase );
    var_2.owner = var_1;
    var_2.health = level.turretsettings[var_0].health;
    var_2.maxhealth = level.turretsettings[var_0].maxhealth;
    var_2.damagetaken = 0;
    var_2.turrettype = var_0;
    var_2.stunned = 0;
    var_2.stunnedtime = 5.0;
    var_2 setturretmodechangewait( 1 );
    var_2 turret_setinactive();
    var_2 setsentryowner( var_1 );
    var_2 setturretminimapvisible( 1, var_0 );
    var_2 setdefaultdroppitch( -89.0 );
    var_2 thread turret_handleownerdisconnect();
    var_1 setplayerdata( "remoteTurretDamageFade", 1.0 );
    var_1 setplayerdata( "remoteTurretDamaged", 0 );
    var_1 setplayerdata( "remoteTurretDamageState", 0 );
    var_2.damagefade = 1.0;
    var_2 thread turret_incrementdamagefade();
    var_2 thread turret_watchlowhealth();
    return var_2;
}

turret_setactive()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self setdefaultdroppitch( 0.0 );
    self makeunusable();
    self maketurretsolid();

    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;

    if ( isdefined( var_0.remoteturretlist ) )
    {
        foreach ( var_2 in var_0.remoteturretlist )
            var_2 notify( "death" );
    }

    var_0.remoteturretlist = [];
    var_0.remoteturretlist[0] = self;
    var_0.using_remote_turret = 0;
    var_0.pickup_message_deleted = 0;
    var_0.enter_message_deleted = 1;

    if ( isalive( var_0 ) )
        var_0 maps\mp\_utility::setlowermessage( "pickup_remote_turret", level.turretsettings[self.turrettype].hintpickup, undefined, undefined, undefined, undefined, undefined, undefined, 1 );

    var_0 thread watchownermessageondeath( self );

    if ( level.teambased )
    {
        self.team = var_0.team;
        self setturretteam( var_0.team );
        maps\mp\_entityheadicons::setteamheadicon( self.team, ( 0.0, 0.0, 65.0 ) );
    }
    else
        maps\mp\_entityheadicons::setplayerheadicon( self.owner, ( 0.0, 0.0, 65.0 ) );

    self.ownertrigger = spawn( "trigger_radius", self.origin + ( 0.0, 0.0, 1.0 ), 0, 32, 64 );
    var_0 thread turret_handlepickup( self );
    thread watchenterandexit();
    thread turret_handledeath();
    thread turret_handledamage();
    thread turret_timeout();
    thread turret_blinky_light();
}

startusingremoteturret()
{
    var_0 = self.owner;
    var_0 maps\mp\_utility::setusingremote( self.turrettype );
    var_0 maps\mp\_utility::freezecontrolswrapper( 1 );
    var_1 = var_0 maps\mp\killstreaks\_killstreaks::initridekillstreak();

    if ( var_1 != "success" )
    {
        if ( var_1 != "disconnect" )
            var_0 maps\mp\_utility::clearusingremote();

        return 0;
    }

    var_0 maps\mp\_utility::_giveweapon( level.turretsettings[self.turrettype].remoteinfo );
    var_0 switchtoweaponimmediate( level.turretsettings[self.turrettype].remoteinfo );
    var_0 maps\mp\_utility::freezecontrolswrapper( 0 );
    var_0 thread waitsetthermal( 1.0, self );

    if ( isdefined( level.huditem["thermal_mode"] ) )
        level.huditem["thermal_mode"] settext( "" );

    if ( getdvarint( "camera_thirdPerson" ) )
        var_0 maps\mp\_utility::setthirdpersondof( 0 );

    var_0 playerlinkweaponviewtodelta( self, "tag_player", 0, 180, 180, 50, 25, 0 );
    var_0 playerlinkedsetviewznear( 0 );
    var_0 playerlinkedsetusebaseangleforviewclamp( 1 );
    var_0 remotecontrolturret( self );
    var_0 maps\mp\_utility::clearlowermessage( "enter_remote_turret" );
    var_0 maps\mp\_utility::clearlowermessage( "pickup_remote_turret" );
    var_0 maps\mp\_utility::setlowermessage( "early_exit", level.turretsettings[self.turrettype].hintexit, undefined, undefined, undefined, undefined, undefined, undefined, 1 );

    if ( var_0 maps\mp\_utility::isjuggernaut() )
        var_0.juggernautoverlay.alpha = 0;
}

waitsetthermal( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "death" );
    wait(var_0);
    self visionsetthermalforplayer( game["thermal_vision"], 1.5 );
    self thermalvisionon();
    self thermalvisionfofoverlayon();
}

stopusingremoteturret()
{
    var_0 = self.owner;

    if ( var_0 maps\mp\_utility::isusingremote() )
    {
        var_0 thermalvisionoff();
        var_0 thermalvisionfofoverlayoff();
        var_0 remotecontrolturretoff( self );
        var_0 unlink();
        var_0 switchtoweapon( var_0 common_scripts\utility::getlastweapon() );
        var_0 maps\mp\_utility::clearusingremote();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 maps\mp\_utility::setthirdpersondof( 1 );

        var_0 visionsetthermalforplayer( game["thermal_vision"], 0 );
        var_1 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( level.turretsettings[self.turrettype].streakname );
        var_0 maps\mp\killstreaks\_killstreaks::takekillstreakweaponifnodupe( var_1 );
    }

    if ( self.stunned )
        var_0 stopshellshock();

    var_0 maps\mp\_utility::clearlowermessage( "early_exit" );

    if ( !isdefined( var_0.using_remote_turret_when_died ) || !var_0.using_remote_turret_when_died )
        var_0 maps\mp\_utility::setlowermessage( "enter_remote_turret", level.turretsettings[self.turrettype].hintenter, undefined, undefined, undefined, 1, 0.25, 1.5, 1 );

    if ( var_0 maps\mp\_utility::isjuggernaut() )
        var_0.juggernautoverlay.alpha = 1;

    self notify( "exit" );
}

watchownermessageondeath( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    self.using_remote_turret_when_died = 0;

    for (;;)
    {
        if ( isalive( self ) )
            self waittill( "death" );

        maps\mp\_utility::clearlowermessage( "enter_remote_turret" );
        maps\mp\_utility::clearlowermessage( "pickup_remote_turret" );

        if ( self.using_remote_turret )
            self.using_remote_turret_when_died = 1;
        else
            self.using_remote_turret_when_died = 0;

        self waittill( "spawned_player" );

        if ( !self.using_remote_turret_when_died )
        {
            maps\mp\_utility::setlowermessage( "enter_remote_turret", level.turretsettings[var_0.turrettype].hintenter, undefined, undefined, undefined, 1, 0.25, 1.5, 1 );
            continue;
        }

        var_0 notify( "death" );
    }
}

watchenterandexit()
{
    self endon( "death" );
    self endon( "carried" );
    level endon( "game_ended" );
    var_0 = self.owner;

    for (;;)
    {
        var_1 = var_0 getcurrentweapon();

        if ( maps\mp\_utility::iskillstreakweapon( var_1 ) && var_1 != level.turretsettings[self.turrettype].weaponinfo && var_1 != level.turretsettings[self.turrettype].laptopinfo && var_1 != level.turretsettings[self.turrettype].remoteinfo && var_1 != "none" && ( !var_0 maps\mp\_utility::isjuggernaut() || var_0 maps\mp\_utility::isusingremote() ) )
        {
            if ( !isdefined( var_0.enter_message_deleted ) || !var_0.enter_message_deleted )
            {
                var_0.enter_message_deleted = 1;
                var_0 maps\mp\_utility::clearlowermessage( "enter_remote_turret" );
            }

            wait 0.05;
            continue;
        }

        if ( var_0 istouching( self.ownertrigger ) )
        {
            if ( !isdefined( var_0.enter_message_deleted ) || !var_0.enter_message_deleted )
            {
                var_0.enter_message_deleted = 1;
                var_0 maps\mp\_utility::clearlowermessage( "enter_remote_turret" );
            }

            wait 0.05;
            continue;
        }

        if ( isdefined( var_0.empgrenaded ) && var_0.empgrenaded )
        {
            if ( !isdefined( var_0.enter_message_deleted ) || !var_0.enter_message_deleted )
            {
                var_0.enter_message_deleted = 1;
                var_0 maps\mp\_utility::clearlowermessage( "enter_remote_turret" );
            }

            wait 0.05;
            continue;
        }

        if ( isdefined( var_0.enter_message_deleted ) && var_0.enter_message_deleted && var_1 != "none" )
        {
            var_0 maps\mp\_utility::setlowermessage( "enter_remote_turret", level.turretsettings[self.turrettype].hintenter, undefined, undefined, undefined, 1, 0.25, 1.5, 1 );
            var_0.enter_message_deleted = 0;
        }

        var_2 = 0;

        while ( var_0 usebuttonpressed() && !var_0 fragbuttonpressed() && !isdefined( var_0.throwinggrenade ) && !var_0 secondaryoffhandbuttonpressed() && !var_0 isusingturret() && var_0 isonground() && !var_0 istouching( self.ownertrigger ) && ( !isdefined( var_0.empgrenaded ) || !var_0.empgrenaded ) )
        {
            if ( isdefined( var_0.iscarrying ) && var_0.iscarrying )
                break;

            if ( isdefined( var_0.iscapturingcrate ) && var_0.iscapturingcrate )
                break;

            if ( !isalive( var_0 ) )
                break;

            if ( !var_0.using_remote_turret && var_0 maps\mp\_utility::isusingremote() )
                break;

            var_2 += 0.05;

            if ( var_2 > 0.75 )
            {
                var_0.using_remote_turret = !var_0.using_remote_turret;

                if ( var_0.using_remote_turret )
                {
                    var_0 removeweapons();
                    var_0 takekillstreakweapons( self.turrettype );
                    var_0 maps\mp\_utility::_giveweapon( level.turretsettings[self.turrettype].laptopinfo );
                    var_0 switchtoweaponimmediate( level.turretsettings[self.turrettype].laptopinfo );
                    startusingremoteturret();
                    var_0 restoreweapons();
                }
                else
                {
                    var_0 takekillstreakweapons( self.turrettype );
                    stopusingremoteturret();
                }

                wait 2.0;
                break;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

turret_handlepickup( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( !isdefined( var_0.ownertrigger ) )
        return;

    if ( isdefined( self.pers["isBot"] ) && self.pers["isBot"] )
        return;

    var_1 = 0;

    for (;;)
    {
        var_2 = self getcurrentweapon();

        if ( maps\mp\_utility::iskillstreakweapon( var_2 ) && var_2 != "killstreak_remote_turret_mp" && var_2 != level.turretsettings[var_0.turrettype].weaponinfo && var_2 != level.turretsettings[var_0.turrettype].laptopinfo && var_2 != level.turretsettings[var_0.turrettype].remoteinfo && var_2 != "none" && ( !maps\mp\_utility::isjuggernaut() || maps\mp\_utility::isusingremote() ) )
        {
            if ( !isdefined( self.pickup_message_deleted ) || !self.pickup_message_deleted )
            {
                self.pickup_message_deleted = 1;
                maps\mp\_utility::clearlowermessage( "pickup_remote_turret" );
            }

            wait 0.05;
            continue;
        }

        if ( !self istouching( var_0.ownertrigger ) )
        {
            if ( !isdefined( self.pickup_message_deleted ) || !self.pickup_message_deleted )
            {
                self.pickup_message_deleted = 1;
                maps\mp\_utility::clearlowermessage( "pickup_remote_turret" );
            }

            wait 0.05;
            continue;
        }

        if ( maps\mp\_utility::isreallyalive( self ) && self istouching( var_0.ownertrigger ) && !isdefined( var_0.carriedby ) && self isonground() )
        {
            if ( isdefined( self.pickup_message_deleted ) && self.pickup_message_deleted && var_2 != "none" )
            {
                maps\mp\_utility::setlowermessage( "pickup_remote_turret", level.turretsettings[var_0.turrettype].hintpickup, undefined, undefined, undefined, undefined, undefined, undefined, 1 );
                self.pickup_message_deleted = 0;
            }

            if ( self usebuttonpressed() )
            {
                if ( isdefined( self.using_remote_turret ) && self.using_remote_turret )
                    continue;

                var_1 = 0;

                while ( self usebuttonpressed() )
                {
                    var_1 += 0.05;
                    wait 0.05;
                }

                if ( var_1 >= 0.5 )
                    continue;

                var_1 = 0;

                while ( !self usebuttonpressed() && var_1 < 0.5 )
                {
                    var_1 += 0.05;
                    wait 0.05;
                }

                if ( var_1 >= 0.5 )
                    continue;

                if ( !maps\mp\_utility::isreallyalive( self ) )
                    continue;

                if ( isdefined( self.using_remote_turret ) && self.using_remote_turret )
                    continue;

                var_0 setmode( level.turretsettings[var_0.turrettype].sentrymodeoff );
                thread setcarryingturret( var_0, 0 );
                var_0.ownertrigger delete();
                self.remoteturretlist = undefined;
                maps\mp\_utility::clearlowermessage( "pickup_remote_turret" );
                return;
            }
        }

        wait 0.05;
    }
}

turret_blinky_light()
{
    self endon( "death" );
    self endon( "carried" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "antenna_light_mp" ), self, "tag_fx" );
        wait 1.0;
        stopfxontag( common_scripts\utility::getfx( "antenna_light_mp" ), self, "tag_fx" );
    }
}

turret_setinactive()
{
    self setmode( level.turretsettings[self.turrettype].sentrymodeoff );

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( "none", ( 0.0, 0.0, 0.0 ) );
    else if ( isdefined( self.owner ) )
        maps\mp\_entityheadicons::setplayerheadicon( undefined, ( 0.0, 0.0, 0.0 ) );

    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;

    if ( isdefined( var_0.using_remote_turret ) && var_0.using_remote_turret )
    {
        var_0 thermalvisionoff();
        var_0 thermalvisionfofoverlayoff();
        var_0 remotecontrolturretoff( self );
        var_0 unlink();
        var_0 switchtoweapon( var_0 common_scripts\utility::getlastweapon() );
        var_0 maps\mp\_utility::clearusingremote();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 maps\mp\_utility::setthirdpersondof( 1 );

        var_0 maps\mp\killstreaks\_killstreaks::clearrideintro();
        var_0 visionsetthermalforplayer( game["thermal_vision"], 0 );

        if ( isdefined( var_0.disabledusability ) && var_0.disabledusability )
            var_0 common_scripts\utility::_enableusability();

        var_0 takekillstreakweapons( self.turrettype );

        if ( var_0 maps\mp\_utility::isjuggernaut() )
            var_0.juggernautoverlay.alpha = 1;
    }
}

turret_handleownerdisconnect()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "turret_handleOwner" );
    self endon( "turret_handleOwner" );
    self.owner common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

turret_timeout()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level.turretsettings[self.turrettype].timeout;

    while ( var_0 )
    {
        wait 1.0;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self.carriedby ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    if ( isdefined( self.owner ) )
        self.owner thread maps\mp\_utility::leaderdialogonplayer( "sentry_gone" );

    self notify( "death" );
}

turret_handledeath()
{
    self endon( "carried" );
    var_0 = self getentitynumber();
    maps\mp\killstreaks\_autosentry::addtoturretlist( var_0 );
    self waittill( "death" );
    maps\mp\killstreaks\_autosentry::removefromturretlist( var_0 );

    if ( !isdefined( self ) )
        return;

    self setmodel( level.turretsettings[self.turrettype].modeldestroyed );
    turret_setinactive();
    self setdefaultdroppitch( 40 );
    self setsentryowner( undefined );
    self setturretminimapvisible( 0 );

    if ( isdefined( self.ownertrigger ) )
        self.ownertrigger delete();

    var_1 = self.owner;

    if ( isdefined( var_1 ) )
    {
        var_1.using_remote_turret = 0;
        var_1 maps\mp\_utility::clearlowermessage( "enter_remote_turret" );
        var_1 maps\mp\_utility::clearlowermessage( "early_exit" );
        var_1 maps\mp\_utility::clearlowermessage( "pickup_remote_turret" );
        var_1 setplayerdata( "remoteTurretDamageState", 0 );
        var_1 restoreperks();
        var_1 restoreweapons();

        if ( var_1 getcurrentweapon() == "none" )
            var_1 switchtoweapon( var_1 common_scripts\utility::getlastweapon() );
    }

    self playsound( "sentry_explode" );
    playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_aim" );
    wait 1.5;
    self playsound( "sentry_explode_smoke" );

    for ( var_2 = 8; var_2 > 0; var_2 -= 0.4 )
    {
        playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
        wait 0.4;
    }

    self notify( "deleting" );

    if ( isdefined( self.target_ent ) )
        self.target_ent delete();

    self delete();
}

turret_handledamage()
{
    self endon( "death" );
    self endon( "carried" );
    self setcandamage( 1 );

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
                case "flash_grenade_mp":
                    if ( var_4 == "MOD_GRENADE_SPLASH" && self.owner.using_remote_turret )
                    {
                        self.stunned = 1;
                        thread turret_stun();
                    }
                case "smoke_grenade_mp":
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
        self.damagefade = 0.0;
        self.owner setplayerdata( "remoteTurretDamaged", 1 );
        var_10 = var_0;

        if ( isplayer( var_1 ) )
        {
            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "remote_turret" );

            if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                var_10 = var_0 * level.armorpiercingmod;
        }

        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "remote_turret" );

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
                case "emp_grenade_mp":
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
                self.owner thread maps\mp\_utility::leaderdialogonplayer( level.turretsettings[self.turrettype].vodestroyed );

            self notify( "death" );
            return;
        }
    }
}

turret_incrementdamagefade()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( self.damagefade < 1.0 )
        {
            self.owner setplayerdata( "remoteTurretDamageFade", self.damagefade );
            self.damagefade += 0.1;
            var_0 = 1;
        }
        else if ( var_0 )
        {
            self.damagefade = 1.0;
            self.owner setplayerdata( "remoteTurretDamageFade", self.damagefade );
            self.owner setplayerdata( "remoteTurretDamaged", 0 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

turret_watchlowhealth()
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
                self.owner setplayerdata( "remoteTurretDamageState", var_1 );
                var_1++;
            }
        }
        else if ( self.damagetaken >= self.maxhealth * ( var_0 * var_1 ) )
        {
            self.owner setplayerdata( "remoteTurretDamageState", var_1 );
            var_1++;
        }

        wait 0.05;
    }
}

turret_stun()
{
    self notify( "stunned" );
    self endon( "stunned" );
    self endon( "death" );

    while ( self.stunned )
    {
        self.owner shellshock( "concussion_grenade_mp", self.stunnedtime );
        playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_origin" );
        var_0 = 0;

        while ( var_0 < self.stunnedtime )
        {
            var_0 += 0.05;
            wait 0.05;
        }

        self.stunned = 0;
    }
}
