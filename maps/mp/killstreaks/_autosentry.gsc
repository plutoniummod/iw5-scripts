// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.sentrytype = [];
    level.sentrytype["sentry_minigun"] = "sentry";
    level.sentrytype["sam_turret"] = "sam_turret";
    level.killstreakfuncs[level.sentrytype["sentry_minigun"]] = ::tryuseautosentry;
    level.killstreakfuncs[level.sentrytype["sam_turret"]] = ::tryusesam;
    level.sentrysettings = [];
    level.sentrysettings["sentry_minigun"] = spawnstruct();
    level.sentrysettings["sentry_minigun"].health = 999999;
    level.sentrysettings["sentry_minigun"].maxhealth = 1000;
    level.sentrysettings["sentry_minigun"].burstmin = 20;
    level.sentrysettings["sentry_minigun"].burstmax = 120;
    level.sentrysettings["sentry_minigun"].pausemin = 0.15;
    level.sentrysettings["sentry_minigun"].pausemax = 0.35;
    level.sentrysettings["sentry_minigun"].sentrymodeon = "sentry";
    level.sentrysettings["sentry_minigun"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["sentry_minigun"].timeout = 90.0;
    level.sentrysettings["sentry_minigun"].spinuptime = 0.05;
    level.sentrysettings["sentry_minigun"].overheattime = 8.0;
    level.sentrysettings["sentry_minigun"].cooldowntime = 0.1;
    level.sentrysettings["sentry_minigun"].fxtime = 0.3;
    level.sentrysettings["sentry_minigun"].streakname = "sentry";
    level.sentrysettings["sentry_minigun"].weaponinfo = "sentry_minigun_mp";
    level.sentrysettings["sentry_minigun"].modelbase = "sentry_minigun_weak";
    level.sentrysettings["sentry_minigun"].modelplacement = "sentry_minigun_weak_obj";
    level.sentrysettings["sentry_minigun"].modelplacementfailed = "sentry_minigun_weak_obj_red";
    level.sentrysettings["sentry_minigun"].modeldestroyed = "sentry_minigun_weak_destroyed";
    level.sentrysettings["sentry_minigun"].hintstring = &"SENTRY_PICKUP";
    level.sentrysettings["sentry_minigun"].headicon = 1;
    level.sentrysettings["sentry_minigun"].teamsplash = "used_sentry";
    level.sentrysettings["sentry_minigun"].shouldsplash = 0;
    level.sentrysettings["sentry_minigun"].vodestroyed = "sentry_destroyed";
    level.sentrysettings["sam_turret"] = spawnstruct();
    level.sentrysettings["sam_turret"].health = 999999;
    level.sentrysettings["sam_turret"].maxhealth = 1000;
    level.sentrysettings["sam_turret"].burstmin = 20;
    level.sentrysettings["sam_turret"].burstmax = 120;
    level.sentrysettings["sam_turret"].pausemin = 0.15;
    level.sentrysettings["sam_turret"].pausemax = 0.35;
    level.sentrysettings["sam_turret"].sentrymodeon = "sentry";
    level.sentrysettings["sam_turret"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["sam_turret"].timeout = 90.0;
    level.sentrysettings["sam_turret"].spinuptime = 0.05;
    level.sentrysettings["sam_turret"].overheattime = 8.0;
    level.sentrysettings["sam_turret"].cooldowntime = 0.1;
    level.sentrysettings["sam_turret"].fxtime = 0.3;
    level.sentrysettings["sam_turret"].streakname = "sam_turret";
    level.sentrysettings["sam_turret"].weaponinfo = "sam_mp";
    level.sentrysettings["sam_turret"].modelbase = "mp_sam_turret";
    level.sentrysettings["sam_turret"].modelplacement = "mp_sam_turret_placement";
    level.sentrysettings["sam_turret"].modelplacementfailed = "mp_sam_turret_placement_failed";
    level.sentrysettings["sam_turret"].modeldestroyed = "mp_sam_turret";
    level.sentrysettings["sam_turret"].hintstring = &"SENTRY_PICKUP";
    level.sentrysettings["sam_turret"].headicon = 1;
    level.sentrysettings["sam_turret"].teamsplash = "used_sam_turret";
    level.sentrysettings["sam_turret"].shouldsplash = 0;
    level.sentrysettings["sam_turret"].vodestroyed = "sam_destroyed";

    foreach ( var_1 in level.sentrysettings )
    {
        precacheitem( var_1.weaponinfo );
        precachemodel( var_1.modelbase );
        precachemodel( var_1.modelplacement );
        precachemodel( var_1.modelplacementfailed );
        precachemodel( var_1.modeldestroyed );
        precachestring( var_1.hintstring );

        if ( isdefined( var_1.ownerhintstring ) )
            precachestring( var_1.ownerhintstring );
    }

    precacheitem( "sam_projectile_mp" );
    level._effect["sentry_overheat_mp"] = loadfx( "smoke/sentry_turret_overheat_smoke" );
    level._effect["sentry_explode_mp"] = loadfx( "explosions/sentry_gun_explosion" );
    level._effect["sentry_smoke_mp"] = loadfx( "smoke/car_damage_blacksmoke" );
}

tryuseautosentry( var_0 )
{
    var_1 = givesentry( "sentry_minigun" );

    if ( var_1 )
        maps\mp\_matchdata::logkillstreakevent( level.sentrysettings["sentry_minigun"].streakname, self.origin );

    return var_1;
}

tryusesam( var_0 )
{
    var_1 = givesentry( "sam_turret" );

    if ( var_1 )
        maps\mp\_matchdata::logkillstreakevent( level.sentrysettings["sam_turret"].streakname, self.origin );

    return var_1;
}

givesentry( var_0 )
{
    if ( !maps\mp\_utility::validateusestreak() )
        return 0;

    self.last_sentry = var_0;
    var_1 = createsentryforplayer( var_0, self );
    removeperks();
    var_2 = setcarryingsentry( var_1, 1 );
    thread waitrestoreperks();
    self.iscarrying = 0;

    if ( isdefined( var_1 ) )
        return 1;
    else
        return 0;
}

setcarryingsentry( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 sentry_setcarried( self );
    common_scripts\utility::_disableweapon();
    self notifyonplayercommand( "place_sentry", "+attack" );
    self notifyonplayercommand( "place_sentry", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_sentry", "+actionslot 4" );

    for (;;)
    {
        var_2 = common_scripts\utility::waittill_any_return( "place_sentry", "cancel_sentry", "force_cancel_placement" );

        if ( var_2 == "cancel_sentry" || var_2 == "force_cancel_placement" )
        {
            if ( !var_1 && var_2 == "cancel_sentry" )
                continue;

            var_3 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( level.sentrysettings[var_0.sentrytype].streakname );

            if ( isdefined( self.killstreakindexweapon ) && var_3 == maps\mp\killstreaks\_killstreaks::getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname ) && !self getweaponslistitems().size )
            {
                maps\mp\_utility::_giveweapon( var_3, 0 );
                maps\mp\_utility::_setactionslot( 4, "weapon", var_3 );
            }

            var_0 sentry_setcancelled();
            common_scripts\utility::_enableweapon();
            return 0;
        }

        if ( !var_0.canbeplaced )
            continue;

        var_0 sentry_setplaced();
        common_scripts\utility::_enableweapon();
        return 1;
    }
}

removeweapons()
{
    if ( self hasweapon( "riotshield_mp" ) )
    {
        self.restoreweapon = "riotshield_mp";
        self takeweapon( "riotshield_mp" );
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

restoreweapons()
{
    if ( isdefined( self.restoreweapon ) )
    {
        maps\mp\_utility::_giveweapon( self.restoreweapon );
        self.restoreweapon = undefined;
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

createsentryforplayer( var_0, var_1 )
{
    var_2 = spawnturret( "misc_turret", var_1.origin, level.sentrysettings[var_0].weaponinfo );
    var_2.angles = var_1.angles;
    var_2 sentry_initsentry( var_0, var_1 );
    return var_2;
}

sentry_initsentry( var_0, var_1 )
{
    self.sentrytype = var_0;
    self.canbeplaced = 1;
    self setmodel( level.sentrysettings[self.sentrytype].modelbase );
    self.shouldsplash = 1;
    self setcandamage( 1 );

    switch ( var_0 )
    {
        case "minigun_turret":
        case "gl_turret":
            self setleftarc( 80 );
            self setrightarc( 80 );
            self setbottomarc( 50 );
            self setdefaultdroppitch( 0.0 );
            self.originalowner = var_1;
            break;
        case "sam_turret":
            self maketurretinoperable();
            self setleftarc( 180 );
            self setrightarc( 180 );
            self settoparc( 80 );
            self setdefaultdroppitch( -89.0 );
            self.laser_on = 0;
            var_2 = spawn( "script_model", self gettagorigin( "tag_laser" ) );
            var_2 linkto( self );
            self.killcament = var_2;
            self.killcament setscriptmoverkillcam( "explosive" );
            break;
        default:
            self maketurretinoperable();
            self setdefaultdroppitch( -89.0 );
            break;
    }

    self setturretmodechangewait( 1 );
    sentry_setinactive();
    sentry_setowner( var_1 );
    thread sentry_handledamage();
    thread sentry_handledeath();
    thread sentry_timeout();

    switch ( var_0 )
    {
        case "minigun_turret":
            self.momentum = 0;
            self.heatlevel = 0;
            self.overheated = 0;
            thread sentry_heatmonitor();
            break;
        case "gl_turret":
            self.momentum = 0;
            self.heatlevel = 0;
            self.cooldownwaittime = 0;
            self.overheated = 0;
            thread turret_heatmonitor();
            thread turret_coolmonitor();
            break;
        case "sam_turret":
            thread sentry_handleuse();
            thread sentry_beepsounds();
            break;
        default:
            thread sentry_handleuse();
            thread sentry_attacktargets();
            thread sentry_beepsounds();
            break;
    }
}

sentry_handledamage()
{
    self endon( "death" );
    level endon( "game_ended" );
    self.health = level.sentrysettings[self.sentrytype].health;
    self.maxhealth = level.sentrysettings[self.sentrytype].maxhealth;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_1 ) )
            continue;

        if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
            self.wasdamagedfrombulletpenetration = 1;

        switch ( var_9 )
        {
            case "artillery_mp":
            case "stealth_bomb_mp":
                var_0 *= 4;
                break;
            case "bomb_site_mp":
                var_0 = self.maxhealth;
                break;
        }

        if ( var_4 == "MOD_MELEE" )
            self.damagetaken += self.maxhealth;

        var_10 = var_0;

        if ( isplayer( var_1 ) )
        {
            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "sentry" );

            if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                var_10 = var_0 * level.armorpiercingmod;
        }

        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "sentry" );

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
            thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_1, var_0, var_4, var_9 );

            if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
            {
                var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 100, var_9, var_4 );
                var_1 notify( "destroyed_killstreak" );

                if ( isdefined( self.uavremotemarkedby ) && self.uavremotemarkedby != var_1 )
                    self.uavremotemarkedby thread maps\mp\killstreaks\_remoteuav::remoteuav_processtaggedassist();
            }

            if ( isdefined( self.owner ) )
                self.owner thread maps\mp\_utility::leaderdialogonplayer( level.sentrysettings[self.sentrytype].vodestroyed );

            self notify( "death" );
            return;
        }
    }
}

sentry_watchdisabled()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_aim" );
        self setdefaultdroppitch( 40 );
        self setmode( level.sentrysettings[self.sentrytype].sentrymodeoff );
        wait(var_1);
        self setdefaultdroppitch( -89.0 );
        self setmode( level.sentrysettings[self.sentrytype].sentrymodeon );
    }
}

sentry_handledeath()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self setmodel( level.sentrysettings[self.sentrytype].modeldestroyed );
    sentry_setinactive();
    self setdefaultdroppitch( 40 );
    self setsentryowner( undefined );
    self setturretminimapvisible( 0 );

    if ( isdefined( self.ownertrigger ) )
        self.ownertrigger delete();

    self playsound( "sentry_explode" );

    switch ( self.sentrytype )
    {
        case "minigun_turret":
        case "gl_turret":
            self.forcedisable = 1;
            self turretfiredisable();
            break;
        default:
            break;
    }

    if ( isdefined( self.inuseby ) )
    {
        playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_origin" );
        playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
        self.inuseby.turret_overheat_bar maps\mp\gametypes\_hud_util::destroyelem();
        self.inuseby restoreperks();
        self.inuseby restoreweapons();
        self notify( "deleting" );
        wait 1.0;
        stopfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_origin" );
        stopfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
    }
    else
    {
        playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_aim" );
        wait 1.5;
        self playsound( "sentry_explode_smoke" );

        for ( var_0 = 8; var_0 > 0; var_0 -= 0.4 )
        {
            playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
            wait 0.4;
        }

        self notify( "deleting" );
    }

    if ( isdefined( self.killcament ) )
        self.killcament delete();

    self delete();
}

sentry_handleuse()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            continue;

        if ( self.sentrytype == "sam_turret" )
            self setmode( level.sentrysettings[self.sentrytype].sentrymodeoff );

        var_0 setcarryingsentry( self, 0 );
    }
}

turret_handlepickup( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( !isdefined( var_0.ownertrigger ) )
        return;

    var_1 = 0;

    for (;;)
    {
        if ( isalive( self ) && self istouching( var_0.ownertrigger ) && !isdefined( var_0.inuseby ) && !isdefined( var_0.carriedby ) && self isonground() )
        {
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

                var_0 setmode( level.sentrysettings[var_0.sentrytype].sentrymodeoff );
                thread setcarryingsentry( var_0, 0 );
                var_0.ownertrigger delete();
                return;
            }
        }

        wait 0.05;
    }
}

turret_handleuse()
{
    self notify( "turret_handluse" );
    self endon( "turret_handleuse" );
    self endon( "deleting" );
    level endon( "game_ended" );
    self.forcedisable = 0;
    var_0 = ( 1.0, 0.9, 0.7 );
    var_1 = ( 1.0, 0.65, 0.0 );
    var_2 = ( 1.0, 0.25, 0.0 );

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( isdefined( self.carriedby ) )
            continue;

        if ( isdefined( self.inuseby ) )
            continue;

        if ( !maps\mp\_utility::isreallyalive( var_3 ) )
            continue;

        var_3 removeperks();
        var_3 removeweapons();
        self.inuseby = var_3;
        self setmode( level.sentrysettings[self.sentrytype].sentrymodeoff );
        sentry_setowner( var_3 );
        self setmode( level.sentrysettings[self.sentrytype].sentrymodeon );
        var_3 thread turret_shotmonitor( self );
        var_3.turret_overheat_bar = var_3 maps\mp\gametypes\_hud_util::createbar( var_0, 100, 6 );
        var_3.turret_overheat_bar maps\mp\gametypes\_hud_util::setpoint( "CENTER", "BOTTOM", 0, -70 );
        var_3.turret_overheat_bar.alpha = 0.65;
        var_3.turret_overheat_bar.bar.alpha = 0.65;
        var_4 = 0;

        for (;;)
        {
            if ( !maps\mp\_utility::isreallyalive( var_3 ) )
            {
                self.inuseby = undefined;
                var_3.turret_overheat_bar maps\mp\gametypes\_hud_util::destroyelem();
                break;
            }

            if ( !var_3 isusingturret() )
            {
                self notify( "player_dismount" );
                self.inuseby = undefined;
                var_3.turret_overheat_bar maps\mp\gametypes\_hud_util::destroyelem();
                var_3 restoreperks();
                var_3 restoreweapons();
                self sethintstring( level.sentrysettings[self.sentrytype].hintstring );
                self setmode( level.sentrysettings[self.sentrytype].sentrymodeoff );
                sentry_setowner( self.originalowner );
                self setmode( level.sentrysettings[self.sentrytype].sentrymodeon );
                break;
            }

            if ( self.heatlevel >= level.sentrysettings[self.sentrytype].overheattime )
                var_5 = 1;
            else
                var_5 = self.heatlevel / level.sentrysettings[self.sentrytype].overheattime;

            var_3.turret_overheat_bar maps\mp\gametypes\_hud_util::updatebar( var_5 );

            if ( self.forcedisable || self.overheated )
            {
                self turretfiredisable();
                var_3.turret_overheat_bar.bar.color = var_2;
                var_4 = 0;
            }
            else if ( self.heatlevel > level.sentrysettings[self.sentrytype].overheattime * 0.75 && self.sentrytype == "minigun_turret" )
            {
                var_3.turret_overheat_bar.bar.color = var_1;

                if ( randomintrange( 0, 10 ) < 6 )
                    self turretfireenable();
                else
                    self turretfiredisable();

                if ( !var_4 )
                {
                    var_4 = 1;
                    thread playheatfx();
                }
            }
            else
            {
                var_3.turret_overheat_bar.bar.color = var_0;
                self turretfireenable();
                var_4 = 0;
                self notify( "not_overheated" );
            }

            wait 0.05;
        }

        self setdefaultdroppitch( 0.0 );
    }
}

sentry_handleownerdisconnect()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "sentry_handleOwner" );
    self endon( "sentry_handleOwner" );
    self.owner common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

sentry_setowner( var_0 )
{
    self.owner = var_0;
    self setsentryowner( self.owner );
    self setturretminimapvisible( 1, self.sentrytype );

    if ( level.teambased )
    {
        self.team = self.owner.team;
        self setturretteam( self.team );
    }

    thread sentry_handleownerdisconnect();
}

sentry_setplaced()
{
    self setmodel( level.sentrysettings[self.sentrytype].modelbase );

    if ( self getmode() == "manual" )
        self setmode( level.sentrysettings[self.sentrytype].sentrymodeoff );

    self setsentrycarrier( undefined );
    self setcandamage( 1 );

    switch ( self.sentrytype )
    {
        case "minigun_turret":
        case "gl_turret":
            self.angles = self.carriedby.angles;

            if ( isalive( self.originalowner ) )
                self.originalowner maps\mp\_utility::setlowermessage( "pickup_hint", level.sentrysettings[self.sentrytype].ownerhintstring, 3.0, undefined, undefined, undefined, undefined, undefined, 1 );

            self.ownertrigger = spawn( "trigger_radius", self.origin + ( 0.0, 0.0, 1.0 ), 0, 105, 64 );
            self.originalowner thread turret_handlepickup( self );
            thread turret_handleuse();
            break;
        default:
            break;
    }

    sentry_makesolid();
    self.carriedby forceusehintoff();
    self.carriedby = undefined;

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    sentry_setactive();
    self playsound( "sentry_gun_plant" );
    self notify( "placed" );
}

sentry_setcancelled()
{
    self.carriedby forceusehintoff();

    if ( isdefined( self.owner ) )
        self.owner.iscarrying = 0;

    self delete();
}

sentry_setcarried( var_0 )
{
    if ( isdefined( self.originalowner ) )
    {

    }
    else
    {

    }

    self setmodel( level.sentrysettings[self.sentrytype].modelplacement );
    self setsentrycarrier( var_0 );
    self setcandamage( 0 );
    sentry_makenotsolid();
    self.carriedby = var_0;
    var_0.iscarrying = 1;
    var_0 thread updatesentryplacement( self );
    thread sentry_oncarrierdeath( var_0 );
    thread sentry_oncarrierdisconnect( var_0 );
    thread sentry_oncarrierchangedteam( var_0 );
    thread sentry_ongameended();
    self setdefaultdroppitch( -89.0 );
    sentry_setinactive();
    self notify( "carried" );
}

updatesentryplacement( var_0 )
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
                var_0 setmodel( level.sentrysettings[var_0.sentrytype].modelplacement );
                self forceusehinton( &"SENTRY_PLACE" );
            }
            else
            {
                var_0 setmodel( level.sentrysettings[var_0.sentrytype].modelplacementfailed );
                self forceusehinton( &"SENTRY_CANNOT_PLACE" );
            }
        }

        var_1 = var_0.canbeplaced;
        wait 0.05;
    }
}

sentry_oncarrierdeath( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "death" );

    if ( self.canbeplaced )
        sentry_setplaced();
    else
        self delete();
}

sentry_oncarrierdisconnect( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self delete();
}

sentry_oncarrierchangedteam( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    self delete();
}

sentry_ongameended( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    self delete();
}

sentry_setactive()
{
    self setmode( level.sentrysettings[self.sentrytype].sentrymodeon );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( level.sentrysettings[self.sentrytype].hintstring );

    if ( level.sentrysettings[self.sentrytype].headicon )
    {
        if ( level.teambased )
            maps\mp\_entityheadicons::setteamheadicon( self.team, ( 0.0, 0.0, 65.0 ) );
        else
            maps\mp\_entityheadicons::setplayerheadicon( self.owner, ( 0.0, 0.0, 65.0 ) );
    }

    self makeusable();

    foreach ( var_1 in level.players )
    {
        switch ( self.sentrytype )
        {
            case "minigun_turret":
            case "gl_turret":
                self enableplayeruse( var_1 );
                continue;
            default:
                var_2 = self getentitynumber();
                addtoturretlist( var_2 );

                if ( var_1 == self.owner )
                    self enableplayeruse( var_1 );
                else
                    self disableplayeruse( var_1 );

                continue;
        }
    }

    if ( self.shouldsplash )
    {
        level thread maps\mp\_utility::teamplayercardsplash( level.sentrysettings[self.sentrytype].teamsplash, self.owner, self.owner.team );
        self.shouldsplash = 0;
    }

    if ( self.sentrytype == "sam_turret" )
        thread sam_attacktargets();

    thread sentry_watchdisabled();
}

sentry_setinactive()
{
    self setmode( level.sentrysettings[self.sentrytype].sentrymodeoff );
    self makeunusable();
    var_0 = self getentitynumber();

    switch ( self.sentrytype )
    {
        case "gl_turret":
            break;
        default:
            removefromturretlist( var_0 );
            break;
    }

    if ( level.teambased )
        maps\mp\_entityheadicons::setteamheadicon( "none", ( 0.0, 0.0, 0.0 ) );
    else if ( isdefined( self.owner ) )
        maps\mp\_entityheadicons::setplayerheadicon( undefined, ( 0.0, 0.0, 0.0 ) );
}

sentry_makesolid()
{
    self maketurretsolid();
}

sentry_makenotsolid()
{
    self setcontents( 0 );
}

isfriendlytosentry( var_0 )
{
    if ( level.teambased && self.team == var_0.team )
        return 1;

    return 0;
}

addtoturretlist( var_0 )
{
    level.turrets[var_0] = self;
}

removefromturretlist( var_0 )
{
    level.turrets[var_0] = undefined;
}

sentry_attacktargets()
{
    self endon( "death" );
    level endon( "game_ended" );
    self.momentum = 0;
    self.heatlevel = 0;
    self.overheated = 0;
    thread sentry_heatmonitor();

    for (;;)
    {
        common_scripts\utility::waittill_either( "turretstatechange", "cooled" );

        if ( self isfiringturret() )
        {
            thread sentry_burstfirestart();
            continue;
        }

        sentry_spindown();
        thread sentry_burstfirestop();
    }
}

sentry_timeout()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level.sentrysettings[self.sentrytype].timeout;

    while ( var_0 )
    {
        wait 1.0;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self.carriedby ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    if ( isdefined( self.owner ) )
    {
        if ( self.sentrytype == "sam_turret" )
            self.owner thread maps\mp\_utility::leaderdialogonplayer( "sam_gone" );
        else
            self.owner thread maps\mp\_utility::leaderdialogonplayer( "sentry_gone" );
    }

    self notify( "death" );
}

sentry_targetlocksound()
{
    self endon( "death" );
    self playsound( "sentry_gun_beep" );
    wait 0.1;
    self playsound( "sentry_gun_beep" );
    wait 0.1;
    self playsound( "sentry_gun_beep" );
}

sentry_spinup()
{
    thread sentry_targetlocksound();

    while ( self.momentum < level.sentrysettings[self.sentrytype].spinuptime )
    {
        self.momentum += 0.1;
        wait 0.1;
    }
}

sentry_spindown()
{
    self.momentum = 0;
}

sentry_burstfirestart()
{
    self endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    sentry_spinup();
    var_0 = weaponfiretime( level.sentrysettings[self.sentrytype].weaponinfo );
    var_1 = level.sentrysettings[self.sentrytype].burstmin;
    var_2 = level.sentrysettings[self.sentrytype].burstmax;
    var_3 = level.sentrysettings[self.sentrytype].pausemin;
    var_4 = level.sentrysettings[self.sentrytype].pausemax;

    for (;;)
    {
        var_5 = randomintrange( var_1, var_2 + 1 );

        for ( var_6 = 0; var_6 < var_5 && !self.overheated; var_6++ )
        {
            self shootturret();
            self.heatlevel += var_0;
            wait(var_0);
        }

        wait(randomfloatrange( var_3, var_4 ));
    }
}

sentry_burstfirestop()
{
    self notify( "stop_shooting" );
}

turret_shotmonitor( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "player_dismount" );
    var_1 = weaponfiretime( level.sentrysettings[var_0.sentrytype].weaponinfo );

    for (;;)
    {
        var_0 waittill( "turret_fire" );
        var_0.heatlevel += var_1;
        var_0.cooldownwaittime = var_1;
    }
}

sentry_heatmonitor()
{
    self endon( "death" );
    var_0 = weaponfiretime( level.sentrysettings[self.sentrytype].weaponinfo );
    var_1 = 0;
    var_2 = 0;
    var_3 = level.sentrysettings[self.sentrytype].overheattime;
    var_4 = level.sentrysettings[self.sentrytype].cooldowntime;

    for (;;)
    {
        if ( self.heatlevel != var_1 )
            wait(var_0);
        else
            self.heatlevel = max( 0, self.heatlevel - 0.05 );

        if ( self.heatlevel > var_3 )
        {
            self.overheated = 1;
            thread playheatfx();

            switch ( self.sentrytype )
            {
                case "minigun_turret":
                    playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
                    break;
                default:
                    break;
            }

            while ( self.heatlevel )
            {
                self.heatlevel = max( 0, self.heatlevel - var_4 );
                wait 0.1;
            }

            self.overheated = 0;
            self notify( "not_overheated" );
        }

        var_1 = self.heatlevel;
        wait 0.05;
    }
}

turret_heatmonitor()
{
    self endon( "death" );
    var_0 = level.sentrysettings[self.sentrytype].overheattime;

    for (;;)
    {
        if ( self.heatlevel > var_0 )
        {
            self.overheated = 1;
            thread playheatfx();

            switch ( self.sentrytype )
            {
                case "gl_turret":
                    playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
                    break;
                default:
                    break;
            }

            while ( self.heatlevel )
                wait 0.1;

            self.overheated = 0;
            self notify( "not_overheated" );
        }

        wait 0.05;
    }
}

turret_coolmonitor()
{
    self endon( "death" );

    for (;;)
    {
        if ( self.heatlevel > 0 )
        {
            if ( self.cooldownwaittime <= 0 )
                self.heatlevel = max( 0, self.heatlevel - 0.05 );
            else
                self.cooldownwaittime = max( 0, self.cooldownwaittime - 0.05 );
        }

        wait 0.05;
    }
}

playheatfx()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );
    self notify( "playing_heat_fx" );
    self endon( "playing_heat_fx" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "sentry_overheat_mp" ), self, "tag_flash" );
        wait(level.sentrysettings[self.sentrytype].fxtime);
    }
}

playsmokefx()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_aim" );
        wait 0.4;
    }
}

sentry_beepsounds()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3.0;

        if ( !isdefined( self.carriedby ) )
            self playsound( "sentry_gun_beep" );
    }
}

sam_attacktargets()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );
    self.samtargetent = undefined;
    self.sammissilegroups = [];

    for (;;)
    {
        self.samtargetent = sam_acquiretarget();
        sam_fireontarget();
        wait 0.05;
    }
}

sam_acquiretarget()
{
    var_0 = self gettagorigin( "tag_laser" );

    if ( !isdefined( self.samtargetent ) )
    {
        if ( level.teambased )
        {
            foreach ( var_2 in level.uavmodels[level.otherteam[self.team]] )
            {
                if ( isdefined( var_2.isleaving ) && var_2.isleaving )
                    continue;

                if ( sighttracepassed( var_0, var_2.origin, 0, self ) )
                    return var_2;
            }

            foreach ( var_5 in level.littlebirds )
            {
                if ( isdefined( var_5.team ) && var_5.team == self.team )
                    continue;

                if ( sighttracepassed( var_0, var_5.origin, 0, self ) )
                    return var_5;
            }

            foreach ( var_8 in level.helis )
            {
                if ( isdefined( var_8.team ) && var_8.team == self.team )
                    continue;

                if ( sighttracepassed( var_0, var_8.origin, 0, self ) )
                    return var_8;
            }

            if ( level.ac130inuse && isdefined( level.ac130.owner ) && level.ac130.owner.team != self.team )
            {
                if ( sighttracepassed( var_0, level.ac130.planemodel.origin, 0, self ) )
                    return level.ac130.planemodel;
            }

            foreach ( var_2 in level.remote_uav )
            {
                if ( !isdefined( var_2 ) )
                    continue;

                if ( isdefined( var_2.team ) && var_2.team == self.team )
                    continue;

                if ( sighttracepassed( var_0, var_2.origin, 0, self, var_2 ) )
                    return var_2;
            }
        }
        else
        {
            foreach ( var_2 in level.uavmodels )
            {
                if ( isdefined( var_2.isleaving ) && var_2.isleaving )
                    continue;

                if ( isdefined( var_2.owner ) && isdefined( self.owner ) && var_2.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_2.origin, 0, self ) )
                    return var_2;
            }

            foreach ( var_5 in level.littlebirds )
            {
                if ( isdefined( var_5.owner ) && isdefined( self.owner ) && var_5.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_5.origin, 0, self ) )
                    return var_5;
            }

            foreach ( var_8 in level.helis )
            {
                if ( isdefined( var_8.owner ) && isdefined( self.owner ) && var_8.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_8.origin, 0, self ) )
                    return var_8;
            }

            if ( level.ac130inuse && isdefined( level.ac130.owner ) && isdefined( self.owner ) && level.ac130.owner != self.owner )
            {
                if ( sighttracepassed( var_0, level.ac130.planemodel.origin, 0, self ) )
                    return level.ac130.planemodel;
            }

            foreach ( var_2 in level.remote_uav )
            {
                if ( !isdefined( var_2 ) )
                    continue;

                if ( isdefined( var_2.owner ) && isdefined( self.owner ) && var_2.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_2.origin, 0, self, var_2 ) )
                    return var_2;
            }
        }

        self cleartargetentity();
        return undefined;
    }
    else
    {
        if ( !sighttracepassed( var_0, self.samtargetent.origin, 0, self ) )
        {
            self cleartargetentity();
            return undefined;
        }

        return self.samtargetent;
    }
}

sam_fireontarget()
{
    if ( isdefined( self.samtargetent ) )
    {
        if ( self.samtargetent == level.ac130.planemodel && !isdefined( level.ac130player ) )
        {
            self.samtargetent = undefined;
            self cleartargetentity();
            return;
        }

        self settargetentity( self.samtargetent );
        self waittill( "turret_on_target" );

        if ( !isdefined( self.samtargetent ) )
            return;

        if ( !self.laser_on )
        {
            thread sam_watchlaser();
            thread sam_watchcrashing();
            thread sam_watchleaving();
            thread sam_watchlineofsight();
        }

        wait 2.0;

        if ( !isdefined( self.samtargetent ) )
            return;

        if ( self.samtargetent == level.ac130.planemodel && !isdefined( level.ac130player ) )
        {
            self.samtargetent = undefined;
            self cleartargetentity();
            return;
        }

        var_0 = [];
        var_0[0] = self gettagorigin( "tag_le_missile1" );
        var_0[1] = self gettagorigin( "tag_le_missile2" );
        var_0[2] = self gettagorigin( "tag_ri_missile1" );
        var_0[3] = self gettagorigin( "tag_ri_missile2" );
        var_1 = self.sammissilegroups.size;

        for ( var_2 = 0; var_2 < 4; var_2++ )
        {
            if ( !isdefined( self.samtargetent ) )
                return;

            if ( isdefined( self.carriedby ) )
                return;

            self shootturret();
            var_3 = magicbullet( "sam_projectile_mp", var_0[var_2], self.samtargetent.origin, self.owner );
            var_3 missile_settargetent( self.samtargetent );
            var_3 missile_setflightmodedirect();
            var_3.samturret = self;
            var_3.sammissilegroup = var_1;
            self.sammissilegroups[var_1][var_2] = var_3;
            level notify( "sam_missile_fired", self.owner, var_3, self.samtargetent );

            if ( var_2 == 3 )
                break;

            wait 0.25;
        }

        level notify( "sam_fired", self.owner, self.sammissilegroups[var_1], self.samtargetent );
        wait 3.0;
    }
}

sam_watchlineofsight()
{
    level endon( "game_ended" );
    self endon( "death" );

    while ( isdefined( self.samtargetent ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == self.samtargetent )
    {
        var_0 = self gettagorigin( "tag_laser" );

        if ( !sighttracepassed( var_0, self.samtargetent.origin, 0, self, self.samtargetent ) )
        {
            self cleartargetentity();
            self.samtargetent = undefined;
            break;
        }

        wait 0.05;
    }
}

sam_watchlaser()
{
    self endon( "death" );
    self laseron();
    self.laser_on = 1;

    while ( isdefined( self.samtargetent ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == self.samtargetent )
        wait 0.05;

    self laseroff();
    self.laser_on = 0;
}

sam_watchcrashing()
{
    self endon( "death" );
    self.samtargetent endon( "death" );

    if ( !isdefined( self.samtargetent.helitype ) )
        return;

    self.samtargetent waittill( "crashing" );
    self cleartargetentity();
    self.samtargetent = undefined;
}

sam_watchleaving()
{
    self endon( "death" );
    self.samtargetent endon( "death" );

    if ( !isdefined( self.samtargetent.model ) )
        return;

    if ( self.samtargetent.model == "vehicle_uav_static_mp" )
    {
        self.samtargetent waittill( "leaving" );
        self cleartargetentity();
        self.samtargetent = undefined;
    }
}
