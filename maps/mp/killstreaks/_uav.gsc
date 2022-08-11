// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_WAR_RADAR_ACQUIRED" );
    precachestring( &"MP_WAR_RADAR_ACQUIRED_ENEMY" );
    precachestring( &"MP_WAR_RADAR_EXPIRED" );
    precachestring( &"MP_WAR_RADAR_EXPIRED_ENEMY" );
    precachestring( &"MP_WAR_COUNTER_RADAR_ACQUIRED" );
    precachestring( &"MP_WAR_COUNTER_RADAR_ACQUIRED_ENEMY" );
    precachestring( &"MP_WAR_COUNTER_RADAR_EXPIRED" );
    precachestring( &"MP_WAR_COUNTER_RADAR_EXPIRED_ENEMY" );
    precachestring( &"MP_LASE_TARGET_FOR_PREDATOR_STRIKE" );
    precachemodel( "vehicle_uav_static_mp" );
    precachemodel( "vehicle_phantom_ray" );
    precacheitem( "uav_strike_marker_mp" );
    precacheitem( "uav_strike_projectile_mp" );
    level.radarviewtime = 30;
    level.uavblocktime = 30;
    level.uav_fx["explode"] = loadfx( "explosions/uav_advanced_death" );
    level.uav_fx["trail"] = loadfx( "smoke/advanced_uav_contrail" );
    level.killstreakfuncs["uav"] = ::tryuseuav;
    level.killstreakfuncs["uav_support"] = ::tryuseuavsupport;
    level.killstreakfuncs["uav_2"] = ::tryuseuav;
    level.killstreakfuncs["double_uav"] = ::tryusedoubleuav;
    level.killstreakfuncs["triple_uav"] = ::tryusetripleuav;
    level.killstreakfuncs["counter_uav"] = ::tryusecounteruav;
    level.killstreakfuncs["uav_strike"] = ::tryuseuavstrike;
    level.killstreaksetupfuncs["uav_strike"] = ::uavstrikesetup;
    level.killstreakfuncs["directional_uav"] = ::tryusedirectionaluav;
    level._effect["laserTarget"] = loadfx( "misc/laser_glow" );
    var_0 = getentarray( "minimap_corner", "targetname" );

    if ( var_0.size )
        var_1 = maps\mp\gametypes\_spawnlogic::findboxcenter( var_0[0].origin, var_0[1].origin );
    else
        var_1 = ( 0.0, 0.0, 0.0 );

    level.uavrig = spawn( "script_model", var_1 );
    level.uavrig setmodel( "c130_zoomrig" );
    level.uavrig.angles = ( 0.0, 115.0, 0.0 );
    level.uavrig hide();
    level.uavrig.targetname = "uavrig_script_model";
    level.uavrig thread rotateuavrig();

    if ( level.teambased )
    {
        level.radarmode["allies"] = "normal_radar";
        level.radarmode["axis"] = "normal_radar";
        level.activeuavs["allies"] = 0;
        level.activeuavs["axis"] = 0;
        level.activecounteruavs["allies"] = 0;
        level.activecounteruavs["axis"] = 0;
        level.uavmodels["allies"] = [];
        level.uavmodels["axis"] = [];
    }
    else
    {
        level.radarmode = [];
        level.activeuavs = [];
        level.activecounteruavs = [];
        level.uavmodels = [];
        level thread onplayerconnect();
    }

    level thread uavtracker();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        level.activeuavs[var_0.guid] = 0;
        level.activeuavs[var_0.guid + "_radarStrength"] = 0;
        level.activecounteruavs[var_0.guid] = 0;
        level.radarmode[var_0.guid] = "normal_radar";
    }
}

rotateuavrig()
{
    for (;;)
    {
        self rotateyaw( -360, 60 );
        wait 60;
    }
}

launchuav( var_0, var_1, var_2, var_3 )
{
    if ( var_3 == "counter_uav" )
        var_4 = 1;
    else
        var_4 = 0;

    var_5 = spawn( "script_model", level.uavrig gettagorigin( "tag_origin" ) );
    var_5.value = 1;

    if ( var_3 == "double_uav" )
        var_5.value = 2;
    else if ( var_3 == "triple_uav" )
        var_5.value = 3;

    if ( var_5.value != 3 )
    {
        var_5 setmodel( "vehicle_uav_static_mp" );
        var_5 thread damagetracker( var_4, 0 );
    }
    else
    {
        var_5 setmodel( "vehicle_phantom_ray" );
        var_5 thread spawnfxdelay( level.uav_fx["trail"], "tag_jet_trail" );
        var_5 thread damagetracker( var_4, 1 );
    }

    var_5.team = var_1;
    var_5.owner = var_0;
    var_5.timetoadd = 0;
    var_5 thread handleincomingstinger();
    var_5 adduavmodel();
    var_6 = randomintrange( 3000, 5000 );

    if ( isdefined( level.spawnpoints ) )
        var_7 = level.spawnpoints;
    else
        var_7 = level.startspawnpoints;

    var_8 = var_7[0];

    foreach ( var_10 in var_7 )
    {
        if ( var_10.origin[2] < var_8.origin[2] )
            var_8 = var_10;
    }

    var_12 = var_8.origin[2];
    var_13 = level.uavrig.origin[2];

    if ( var_12 < 0 )
    {
        var_13 += var_12 * -1;
        var_12 = 0;
    }

    var_14 = var_13 - var_12;

    if ( var_14 + var_6 > 8100.0 )
        var_6 -= ( var_14 + var_6 - 8100.0 );

    var_15 = randomint( 360 );
    var_16 = randomint( 2000 ) + 5000;
    var_17 = cos( var_15 ) * var_16;
    var_18 = sin( var_15 ) * var_16;
    var_19 = vectornormalize( ( var_17, var_18, var_6 ) );
    var_19 *= randomintrange( 6000, 7000 );
    var_5 linkto( level.uavrig, "tag_origin", var_19, ( 0, var_15 - 90, 0 ) );
    var_5 thread updateuavmodelvisibility();

    if ( var_4 )
    {
        var_5.uavtype = "counter";
        var_5 addactivecounteruav();
    }
    else
    {
        var_5 addactiveuav();
        var_5.uavtype = "standard";
    }

    if ( isdefined( level.activeuavs[var_1] ) )
    {
        foreach ( var_21 in level.uavmodels[var_1] )
        {
            if ( var_21 == var_5 )
                continue;

            if ( var_21.uavtype == "counter" && var_4 )
            {
                var_21.timetoadd += 5;
                continue;
            }

            if ( var_21.uavtype == "standard" && !var_4 )
                var_21.timetoadd += 5;
        }
    }

    level notify( "uav_update" );

    switch ( var_3 )
    {
        case "uav_strike":
            var_2 = 2;
            break;
        default:
            var_2 -= 7;
            break;
    }

    var_5 waittill_notify_or_timeout_hostmigration_pause( "death", var_2 );

    if ( var_5.damagetaken < var_5.maxhealth )
    {
        var_5 unlink();
        var_23 = var_5.origin + anglestoforward( var_5.angles ) * 20000;
        var_5 moveto( var_23, 60 );
        playfxontag( level._effect["ac130_engineeffect"], var_5, "tag_origin" );
        var_5 waittill_notify_or_timeout_hostmigration_pause( "death", 3 );

        if ( var_5.damagetaken < var_5.maxhealth )
        {
            var_5 notify( "leaving" );
            var_5.isleaving = 1;
            var_5 moveto( var_23, 4, 4, 0.0 );
        }

        var_5 waittill_notify_or_timeout_hostmigration_pause( "death", 4 + var_5.timetoadd );
    }

    if ( var_4 )
        var_5 removeactivecounteruav();
    else
        var_5 removeactiveuav();

    var_5 delete();
    var_5 removeuavmodel();

    if ( var_3 == "directional_uav" )
    {
        var_0.radarshowenemydirection = 0;

        if ( level.teambased )
        {
            foreach ( var_25 in level.players )
            {
                if ( var_25.pers["team"] == var_1 )
                    var_25.radarshowenemydirection = 0;
            }
        }
    }

    level notify( "uav_update" );
}

spawnfxdelay( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait 0.5;
    playfxontag( var_0, self, var_1 );
}

monitoruavstrike()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = common_scripts\utility::waittill_any_return( "death", "uav_strike_cancel", "uav_strike_successful" );

        if ( var_0 == "uav_strike_successful" )
            return 1;
        else
            return 0;
    }
}

showlazemessage()
{
    var_0 = maps\mp\gametypes\_hud_util::createfontstring( "bigfixed", 0.75 );
    var_0 maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, 150 );
    var_0 settext( &"MP_LASE_TARGET_FOR_PREDATOR_STRIKE" );
    common_scripts\utility::waittill_any_timeout( 4.0, "death", "uav_strike_cancel", "uav_strike_successful" );
    var_0 maps\mp\gametypes\_hud_util::destroyelem();
}

waitforlazediscard()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "uav_strike_used" );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 != "uav_strike_marker_mp" )
        {
            self notify( "uav_strike_cancel" );
            break;
        }
        else
            wait 0.05;
    }
}

waitforlazedtarget()
{
    level endon( "game_ended" );
    self endon( "death" );
    thread showlazemessage();
    thread waitforlazediscard();
    var_0 = common_scripts\utility::getlastweapon();
    var_1 = undefined;
    var_2 = self getweaponslistprimaries();

    foreach ( var_4 in var_2 )
    {
        if ( var_4 != var_0 )
        {
            var_1 = var_4;
            self takeweapon( var_1 );
            break;
        }
    }

    maps\mp\_utility::_giveweapon( "uav_strike_marker_mp" );
    self switchtoweapon( "uav_strike_marker_mp" );
    var_6 = undefined;

    for (;;)
    {
        var_7 = common_scripts\utility::waittill_any_return( "weapon_fired", "uav_strike_cancel" );

        if ( var_7 == "uav_strike_cancel" )
            break;

        var_8 = self geteye();
        var_9 = anglestoforward( self getplayerangles() );
        var_10 = var_8 + var_9 * 15000;
        var_6 = bullettrace( var_8, var_10, 1, self );

        if ( isdefined( var_6["position"] ) )
            break;
    }

    if ( isdefined( var_6 ) )
    {
        self notify( "uav_strike_used" );
        var_11 = var_6["position"];
        var_12 = spawnfx( level._effect["laserTarget"], var_11 );
        triggerfx( var_12 );
        var_12 thread waitfxentdie();
        magicbullet( "uav_strike_projectile_mp", var_11 + ( 0.0, 0.0, 4000.0 ), var_11, self );
    }

    self takeweapon( "uav_strike_marker_mp" );

    if ( var_7 != "uav_strike_cancel" )
        self switchtoweapon( var_0 );

    if ( isdefined( var_1 ) )
        maps\mp\_utility::_giveweapon( var_1 );

    if ( isdefined( var_6 ) )
        self notify( "uav_strike_successful" );
}

waitfxentdie()
{
    wait 2;
    self delete();
}

waittill_notify_or_timeout_hostmigration_pause( var_0, var_1 )
{
    self endon( var_0 );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_1 );
}

updateuavmodelvisibility()
{
    self endon( "death" );

    for (;;)
    {
        level common_scripts\utility::waittill_either( "joined_team", "uav_update" );
        self hide();

        foreach ( var_1 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_1.team != self.team )
                    self showtoplayer( var_1 );

                continue;
            }

            if ( isdefined( self.owner ) && var_1 == self.owner )
                continue;

            self showtoplayer( var_1 );
        }
    }
}

damagetracker( var_0, var_1 )
{
    level endon( "game_ended" );
    self setcandamage( 1 );
    self.health = 999999;

    if ( var_1 )
        self.maxhealth = 2000;
    else
        self.maxhealth = 1000;

    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );

        if ( !isplayer( var_3 ) )
        {
            if ( !isdefined( self ) )
                return;
        }
        else
        {
            if ( isdefined( var_10 ) && var_10 & level.idflags_penetration )
                self.wasdamagedfrombulletpenetration = 1;

            self.wasdamaged = 1;
            var_12 = var_2;

            if ( isplayer( var_3 ) )
            {
                var_3 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "" );

                if ( var_6 == "MOD_RIFLE_BULLET" || var_6 == "MOD_PISTOL_BULLET" )
                {
                    if ( var_3 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                        var_12 += var_2 * level.armorpiercingmod;
                }
            }

            if ( isdefined( var_11 ) )
            {
                switch ( var_11 )
                {
                    case "stinger_mp":
                    case "javelin_mp":
                        self.largeprojectiledamage = 1;
                        var_12 = self.maxhealth + 1;
                        break;
                    case "sam_projectile_mp":
                        self.largeprojectiledamage = 1;
                        var_13 = 0.25;

                        if ( var_1 )
                            var_13 = 0.15;

                        var_12 = self.maxhealth * var_13;
                        break;
                }
            }

            self.damagetaken += var_12;

            if ( self.damagetaken >= self.maxhealth )
            {
                if ( isplayer( var_3 ) && ( !isdefined( self.owner ) || var_3 != self.owner ) )
                {
                    self hide();
                    var_14 = anglestoright( self.angles ) * 200;
                    playfx( level.uav_fx["explode"], self.origin, var_14 );

                    if ( isdefined( self.uavtype ) && self.uavtype == "remote_mortar" )
                        thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_remote_mortar", var_3 );
                    else if ( var_0 )
                        thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_counter_uav", var_3 );
                    else
                        thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_uav", var_3 );

                    thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_3, var_2, var_6, var_11 );
                    var_3 thread maps\mp\gametypes\_rank::giverankxp( "kill", 50, var_11, var_6 );
                    var_3 notify( "destroyed_killstreak" );

                    if ( isdefined( self.uavremotemarkedby ) && self.uavremotemarkedby != var_3 )
                        self.uavremotemarkedby thread maps\mp\killstreaks\_remoteuav::remoteuav_processtaggedassist();
                }

                self notify( "death" );
                return;
            }
        }
    }
}

tryuseuav( var_0 )
{
    return useuav( "uav" );
}

tryuseuavsupport( var_0 )
{
    return useuav( "uav_support" );
}

tryusedoubleuav( var_0 )
{
    return useuav( "double_uav" );
}

tryusetripleuav( var_0 )
{
    return useuav( "triple_uav" );
}

tryusecounteruav( var_0 )
{
    return useuav( "counter_uav" );
}

uavstrikesetup()
{
    self.usedstrikeuav = 0;
}

tryuseuavstrike( var_0 )
{
    if ( self.usedstrikeuav == 0 )
    {
        self.usedstrikeuav = 1;
        useuav( "uav_strike" );
    }

    thread waitforlazedtarget();
    return monitoruavstrike();
}

tryusedirectionaluav( var_0 )
{
    return useuav( "directional_uav" );
}

useuav( var_0 )
{
    if ( !maps\mp\_utility::validateusestreak() )
        return 0;

    maps\mp\_matchdata::logkillstreakevent( var_0, self.origin );
    var_1 = self.pers["team"];
    var_2 = level.radarviewtime;
    level thread launchuav( self, var_1, var_2, var_0 );

    switch ( var_0 )
    {
        case "counter_uav":
            self notify( "used_counter_uav" );
            break;
        case "double_uav":
            self notify( "used_double_uav" );
            break;
        case "triple_uav":
            level thread maps\mp\_utility::teamplayercardsplash( "used_triple_uav", self, var_1 );
            self notify( "used_triple_uav" );
            break;
        case "directional_uav":
            self.radarshowenemydirection = 1;

            if ( level.teambased )
            {
                foreach ( var_4 in level.players )
                {
                    if ( var_4.pers["team"] == var_1 )
                        var_4.radarshowenemydirection = 1;
                }
            }

            level thread maps\mp\_utility::teamplayercardsplash( "used_directional_uav", self, var_1 );
            self notify( "used_directional_uav" );
            break;
        default:
            self notify( "used_uav" );
            break;
    }

    return 1;
}

uavtracker()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "uav_update" );

        if ( level.teambased )
        {
            updateteamuavstatus( "allies" );
            updateteamuavstatus( "axis" );
            continue;
        }

        updateplayersuavstatus();
    }
}

_getradarstrength( var_0 )
{
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level.uavmodels[var_0] )
    {
        if ( var_4.uavtype == "counter" )
            continue;

        if ( var_4.uavtype == "remote_mortar" )
            continue;

        var_1 += var_4.value;
    }

    foreach ( var_4 in level.uavmodels[level.otherteam[var_0]] )
    {
        if ( var_4.uavtype != "counter" )
            continue;

        var_2 += var_4.value;
    }

    if ( var_2 > 0 )
        var_8 = -3;
    else
        var_8 = var_1;

    var_9 = getuavstrengthmin();
    var_10 = getuavstrengthmax();

    if ( var_8 <= var_9 )
        var_8 = var_9;
    else if ( var_8 >= var_10 )
        var_8 = var_10;

    return var_8;
}

updateteamuavstatus( var_0 )
{
    var_1 = _getradarstrength( var_0 );
    setteamradarstrength( var_0, var_1 );

    if ( var_1 >= getuavstrengthlevelneutral() )
        unblockteamradar( var_0 );
    else
        blockteamradar( var_0 );

    if ( var_1 <= getuavstrengthlevelneutral() )
    {
        setteamradarwrapper( var_0, 0 );
        updateteamuavtype( var_0 );
        return;
    }

    if ( var_1 >= getuavstrengthlevelshowenemyfastsweep() )
        level.radarmode[var_0] = "fast_radar";
    else
        level.radarmode[var_0] = "normal_radar";

    updateteamuavtype( var_0 );
    setteamradarwrapper( var_0, 1 );
}

updateplayersuavstatus()
{
    var_0 = getuavstrengthmin();
    var_1 = getuavstrengthmax();
    var_2 = getuavstrengthlevelshowenemydirectional();

    foreach ( var_4 in level.players )
    {
        var_5 = level.activeuavs[var_4.guid + "_radarStrength"];

        foreach ( var_7 in level.players )
        {
            if ( var_7 == var_4 )
                continue;

            var_8 = level.activecounteruavs[var_7.guid];

            if ( var_8 > 0 )
            {
                var_5 = -3;
                break;
            }
        }

        if ( var_5 <= var_0 )
            var_5 = var_0;
        else if ( var_5 >= var_1 )
            var_5 = var_1;

        var_4.radarstrength = var_5;

        if ( var_5 >= getuavstrengthlevelneutral() )
            var_4.isradarblocked = 0;
        else
            var_4.isradarblocked = 1;

        if ( var_5 <= getuavstrengthlevelneutral() )
        {
            var_4.hasradar = 0;
            var_4.radarshowenemydirection = 0;
            continue;
        }

        if ( var_5 >= getuavstrengthlevelshowenemyfastsweep() )
            var_4.radarmode = "fast_radar";
        else
            var_4.radarmode = "normal_radar";

        var_4.radarshowenemydirection = var_5 >= var_2;
        var_4.hasradar = 1;
    }
}

blockplayeruav()
{
    self endon( "disconnect" );
    self notify( "blockPlayerUAV" );
    self endon( "blockPlayerUAV" );
    self.isradarblocked = 1;
    wait(level.uavblocktime);
    self.isradarblocked = 0;
}

updateteamuavtype( var_0 )
{
    var_1 = _getradarstrength( var_0 ) >= getuavstrengthlevelshowenemydirectional();

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == "spectator" )
            continue;

        var_3.radarmode = level.radarmode[var_3.team];

        if ( var_3.team == var_0 )
            var_3.radarshowenemydirection = var_1;
    }
}

useplayeruav( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "usePlayerUAV" );
    self endon( "usePlayerUAV" );

    if ( var_0 )
        self.radarmode = "fast_radar";
    else
        self.radarmode = "normal_radar";

    self.hasradar = 1;
    wait(var_1);
    self.hasradar = 0;
}

setteamradarwrapper( var_0, var_1 )
{
    setteamradar( var_0, var_1 );
    level notify( "radar_status_change", var_0 );
}

handleincomingstinger()
{
    level endon( "game_ended" );
    self endon( "death" );

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

        if ( var_5 < var_2 )
            var_2 = var_5;

        if ( var_5 > var_2 )
        {
            if ( var_5 > 1536 )
                return;

            radiusdamage( self.origin, 1536, 600, 600, var_1, "MOD_EXPLOSIVE", "stinger_mp" );
            playfx( level.stingerfxid, self.origin );
            self hide();
            self notify( "deleted" );
            wait 0.05;
            self delete();
            var_1 notify( "killstreak_destroyed" );
        }

        wait 0.05;
    }
}

adduavmodel()
{
    if ( level.teambased )
        level.uavmodels[self.team][level.uavmodels[self.team].size] = self;
    else
        level.uavmodels[self.owner.guid + "_" + gettime()] = self;
}

removeuavmodel()
{
    var_0 = [];

    if ( level.teambased )
    {
        var_1 = self.team;

        foreach ( var_3 in level.uavmodels[var_1] )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        level.uavmodels[var_1] = var_0;
    }
    else
    {
        foreach ( var_3 in level.uavmodels )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        level.uavmodels = var_0;
    }
}

addactiveuav()
{
    if ( level.teambased )
        level.activeuavs[self.team]++;
    else
    {
        level.activeuavs[self.owner.guid]++;
        level.activeuavs[self.owner.guid + "_radarStrength"] = level.activeuavs[self.owner.guid + "_radarStrength"] + self.value;
    }
}

addactivecounteruav()
{
    if ( level.teambased )
        level.activecounteruavs[self.team]++;
    else
        level.activecounteruavs[self.owner.guid]++;
}

removeactiveuav()
{
    if ( level.teambased )
    {
        level.activeuavs[self.team]--;

        if ( !level.activeuavs[self.team] )
            return;
    }
    else if ( isdefined( self.owner ) )
    {
        level.activeuavs[self.owner.guid]--;
        level.activeuavs[self.owner.guid + "_radarStrength"] = level.activeuavs[self.owner.guid + "_radarStrength"] - self.value;
    }
}

removeactivecounteruav()
{
    if ( level.teambased )
    {
        level.activecounteruavs[self.team]--;

        if ( !level.activecounteruavs[self.team] )
            return;
    }
    else if ( isdefined( self.owner ) )
        level.activecounteruavs[self.owner.guid]--;
}
