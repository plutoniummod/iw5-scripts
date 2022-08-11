// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    return;
}

spawnarmor( var_0, var_1, var_2 )
{
    var_3 = self dospawn( "tank", var_0 );
    var_3.health = 3000;
    var_3.targeting_delay = 1;
    var_3.team = var_0.team;
    var_3.pers["team"] = var_3.team;
    var_3.owner = var_0;
    var_3 setcandamage( 1 );
    var_3.standardspeed = 12;
    var_3 thread deleteonz();
    var_3 addtotanklist();
    var_3.damagecallback = ::callback_vehicledamage;
    return var_3;
}

deleteonz()
{
    self endon( "death" );
    var_0 = self.origin[2];

    for (;;)
    {
        if ( var_0 - self.origin[2] > 2048 )
        {
            self.health = 0;
            self notify( "death" );
            return;
        }

        wait 1.0;
    }
}

usetank( var_0 )
{
    return tryusetank();
}

tryusetank()
{
    if ( isdefined( level.tankinuse ) && level.tankinuse )
    {
        self iprintlnbold( "Armor support unavailable." );
        return 0;
    }

    if ( !isdefined( getvehiclenode( "startnode", "targetname" ) ) )
    {
        self iprintlnbold( "Tank is currently not supported in this level, bug your friendly neighborhood LD." );
        return 0;
    }

    if ( !vehicle_getspawnerarray().size )
        return 0;

    if ( self.team == "allies" )
        var_0 = level.tankspawner["allies"] spawnarmor( self, "vehicle_bradley" );
    else
        var_0 = level.tankspawner["axis"] spawnarmor( self, "vehicle_bmp" );

    var_0 starttank();
    return 1;
}

starttank( var_0 )
{
    var_1 = getvehiclenode( "startnode", "targetname" );
    var_2 = getvehiclenode( "waitnode", "targetname" );
    self.nodes = getvehiclenodearray( "info_vehicle_node", "classname" );
    level.tankinuse = 1;
    thread tankupdate( var_1, var_2 );
    thread tankdamagemonitor();
    level.tank = self;

    if ( level.teambased )
    {
        var_3 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_3, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_team( var_3, "allies" );
        level.tank.objid["allies"] = var_3;
        var_4 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_4, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_team( var_4, "axis" );
        level.tank.objid["axis"] = var_4;
        var_5 = self.team;
        level.tank.team = var_5;
        level.tank.pers["team"] = var_5;
    }

    var_6 = spawnturret( "misc_turret", self.origin, "abrams_minigun_mp" );
    var_6 linkto( self, "tag_engine_left", ( 0.0, 0.0, -20.0 ), ( 0.0, 0.0, 0.0 ) );
    var_6 setmodel( "sentry_minigun" );
    var_6.angles = self.angles;
    var_6.owner = self.owner;
    var_6 maketurretinoperable();
    self.mgturret = var_6;
    self.mgturret setdefaultdroppitch( 0 );
    var_7 = self.angles;
    self.angles = ( 0.0, 0.0, 0.0 );
    var_8 = self gettagorigin( "tag_flash" );
    self.angles = var_7;
    var_9 = var_8 - self.origin;
    thread waitforchangeteams();
    thread waitfordisco();
    self.timelastfired = gettime();
    var_10 = spawn( "script_origin", self gettagorigin( "tag_flash" ) );
    var_10 linkto( self, "tag_origin", var_9, ( 0.0, 0.0, 0.0 ) );
    var_10 hide();
    self.neutraltarget = var_10;
    thread tankgettargets();
    thread destroytank();
    thread tankgetminitargets();
    thread checkdanger();
    thread watchforthreat();
}

waitforchangeteams()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self.owner waittill( "joined_team" );
    self.health = 0;
    self notify( "death" );
}

waitfordisco()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self.health = 0;
    self notify( "death" );
}

setdirection( var_0 )
{
    if ( self.veh_pathdir != var_0 )
    {
        if ( var_0 == "forward" )
            stoptoforward();
        else
            stoptoreverse();
    }
}

setengagementspeed()
{
    self endon( "death" );
    self notify( "path_abandoned" );

    while ( isdefined( self.changingdirection ) )
        wait 0.05;

    var_0 = 2;
    self vehicle_setspeed( var_0, 10, 10 );
    self.speedtype = "engage";
}

setminiengagementspeed()
{
    self endon( "death" );
    self notify( "path_abandoned" );

    while ( isdefined( self.changingdirection ) )
        wait 0.05;

    var_0 = 2;
    self vehicle_setspeed( var_0, 10, 10 );
    self.speedtype = "engage";
}

setstandardspeed()
{
    self endon( "death" );

    while ( isdefined( self.changingdirection ) )
        wait 0.05;

    self vehicle_setspeed( self.standardspeed, 10, 10 );
    self.speedtype = "standard";
}

setevadespeed()
{
    self endon( "death" );

    while ( isdefined( self.changingdirection ) )
        wait 0.05;

    self vehicle_setspeed( 15, 15, 15 );
    self.speedtype = "evade";
    wait 1.5;
    self vehicle_setspeed( self.standardspeed, 10, 10 );
}

setdangerspeed()
{
    self endon( "death" );

    while ( isdefined( self.changingdirection ) )
        wait 0.05;

    self vehicle_setspeed( 5, 5, 5 );
    self.speedtype = "danger";
}

stoptoreverse()
{
    debugprintln2( "tank changing direction at " + gettime() );
    self vehicle_setspeed( 0, 5, 6 );
    self.changingdirection = 1;

    while ( self.veh_speed > 0 )
        wait 0.05;

    wait 0.25;
    self.changingdirection = undefined;
    debugprintln2( "tank done changing direction" );
    self.veh_transmission = "reverse";
    self.veh_pathdir = "reverse";
    self vehicle_setspeed( self.standardspeed, 5, 6 );
}

stoptoforward()
{
    debugprintln2( "tank changing direction at " + gettime() );
    self vehicle_setspeed( 0, 5, 6 );
    self.changingdirection = 1;

    while ( self.veh_speed > 0 )
        wait 0.05;

    wait 0.25;
    self.changingdirection = undefined;
    debugprintln2( "tank done changing direction" );
    self.veh_transmission = "forward";
    self.veh_pathdir = "forward";
    self vehicle_setspeed( self.standardspeed, 5, 6 );
}

checkdanger()
{
    self endon( "death" );
    var_0 = [];
    var_1 = level.players;
    self.numenemiesclose = 0;

    for (;;)
    {
        foreach ( var_3 in var_1 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.team == self.team )
            {
                wait 0.05;
                continue;
            }

            var_4 = distance2d( var_3.origin, self.origin );

            if ( var_4 < 2048 )
                self.numenemiesclose++;

            wait 0.05;
        }

        if ( isdefined( self.speedtype ) && ( self.speedtype == "evade" || self.speedtype == "engage" ) )
        {
            self.numenemiesclose = 0;
            continue;
        }

        if ( self.numenemiesclose > 1 )
            thread setdangerspeed();
        else
            thread setstandardspeed();

        self.numenemiesclose = 0;
        wait 0.05;
    }
}

tankupdate( var_0, var_1 )
{
    self endon( "tankDestroyed" );
    self endon( "death" );

    if ( !isdefined( level.graphnodes ) )
    {
        self startpath( var_0 );
        return;
    }

    self attachpath( var_0 );
    self startpath( var_0 );
    var_0 notify( "trigger", self, 1 );
    wait 0.05;

    for (;;)
    {
        while ( isdefined( self.changingdirection ) )
            wait 0.05;

        var_2 = getnodenearenemies();

        if ( isdefined( var_2 ) )
            self.endnode = var_2;
        else
            self.endnode = undefined;

        wait 0.65;
    }
}

callback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( ( var_1 == self || var_1 == self.mgturret || isdefined( var_1.pers ) && var_1.pers["team"] == self.team ) && ( var_1 != self.owner || var_4 == "MOD_MELEE" ) )
        return;

    var_12 = modifydamage( var_4, var_2, var_1 );
    self vehicle_finishdamage( var_0, var_1, var_12, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

tankdamagemonitor()
{
    self endon( "death" );
    self.damagetaken = 0;
    var_0 = self vehicle_getspeed();
    var_1 = self.health;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;

    for (;;)
    {
        self waittill( "damage", var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_6.classname ) && var_6.classname == "script_vehicle" )
        {
            if ( isdefined( self.besttarget ) && self.besttarget != var_6 )
            {
                self.forcedtarget = var_6;
                thread explicitabandontarget();
            }
        }
        else if ( isplayer( var_6 ) )
        {
            var_6 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "hitHelicopter" );

            if ( var_6 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
            {
                var_10 = var_5 * level.armorpiercingmod;
                self.health -= int( var_10 );
            }
        }

        if ( self.health <= 0 )
        {
            self notify( "death" );
            return;
        }
        else if ( self.health < var_1 / 4 && var_4 == 0 )
            var_4 = 1;
        else if ( self.health < var_1 / 2 && var_3 == 0 )
            var_3 = 1;
        else if ( self.health < var_1 / 1.5 && var_2 == 0 )
            var_2 = 1;

        if ( var_5 > 1000 )
            handlethreat( var_6 );
    }
}

handlethreat( var_0 )
{
    self endon( "death" );
    var_1 = randomint( 100 );

    if ( isdefined( self.besttarget ) && self.besttarget != var_0 && var_1 > 30 )
    {
        var_2 = [];
        var_2[0] = self.besttarget;
        explicitabandontarget( 1, self.besttarget );
        thread acquiretarget( var_2 );
    }
    else if ( !isdefined( self.besttarget ) && var_1 > 30 )
    {
        var_2 = [];
        var_2[0] = var_0;
        thread acquiretarget( var_2 );
    }
    else if ( var_1 < 30 )
    {
        playfx( level.tankcover, self.origin );
        thread setevadespeed();
    }
    else
    {
        self fireweapon();
        self playsound( "bmp_fire" );
    }
}

handlepossiblethreat( var_0 )
{
    self endon( "death" );
    var_1 = relativeangle( var_0 );
    var_2 = distance( self.origin, var_0.origin );

    if ( randomint( 4 ) < 3 )
        return;

    if ( var_1 == "front" && var_2 < 768 )
        thread setevadespeed();
    else if ( var_1 == "rear_side" || var_1 == "rear" && var_2 >= 768 )
    {
        playfx( level.tankcover, self.origin );
        thread setevadespeed();
    }
    else if ( var_1 == "rear" && var_2 < 768 )
    {
        stoptoreverse();
        setevadespeed();
        wait 4;
        stoptoforward();
    }
    else if ( var_1 == "front_side" || var_1 == "front" )
    {
        playfx( level.tankcover, self.origin );
        stoptoreverse();
        setevadespeed();
        wait 8;
        stoptoforward();
    }
}

relativeangle( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_1 = anglestoforward( self.angles );
    var_2 = var_0.origin - self.origin;
    var_1 *= ( 1.0, 1.0, 0.0 );
    var_2 *= ( 1.0, 1.0, 0.0 );
    var_2 = vectornormalize( var_2 );
    var_1 = vectornormalize( var_1 );
    var_3 = vectordot( var_2, var_1 );

    if ( var_3 > 0 )
    {
        if ( var_3 > 0.9 )
            return "front";
        else
            return "front_side";
    }
    else if ( var_3 < -0.9 )
        return "rear";
    else
        return "rear_side";

    var_0 iprintlnbold( var_3 );
}

watchforthreat()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = [];
        var_1 = level.players;

        foreach ( var_3 in var_1 )
        {
            if ( !isdefined( var_3 ) )
            {
                wait 0.05;
                continue;
            }

            if ( !istarget( var_3 ) )
            {
                wait 0.05;
                continue;
            }

            var_4 = var_3 getcurrentweapon();

            if ( issubstr( var_4, "at4" ) || issubstr( var_4, "stinger" ) || issubstr( var_4, "javelin" ) )
            {
                thread handlepossiblethreat( var_3 );
                wait 8;
            }

            wait 0.15;
        }
    }
}

checkowner()
{
    if ( !isdefined( self.owner ) || !isdefined( self.owner.pers["team"] ) || self.owner.pers["team"] != self.team )
    {
        self notify( "abandoned" );
        return 0;
    }

    return 1;
}

drawline( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

modifydamage( var_0, var_1, var_2 )
{
    if ( var_0 == "MOD_RIFLE_BULLET" )
        return var_1;
    else if ( var_0 == "MOD_PISTOL_BULLET" )
        return var_1;
    else if ( var_0 == "MOD_IMPACT" )
        return var_1;
    else if ( var_0 == "MOD_MELEE" )
        return 0;
    else if ( var_0 == "MOD_EXPLOSIVE_BULLET" )
        return var_1;
    else if ( var_0 == "MOD_GRENADE" )
        return var_1 * 5;
    else if ( var_0 == "MOD_GRENADE_SPLASH" )
        return var_1 * 5;
    else
        return var_1 * 10;
}

destroytank()
{
    self waittill( "death" );

    if ( level.teambased )
    {
        var_0 = level.tank.team;
        objective_state( level.tank.objid[var_0], "invisible" );
        objective_state( level.tank.objid[level.otherteam[var_0]], "invisible" );
    }

    self notify( "tankDestroyed" );
    self vehicle_setspeed( 0, 10, 10 );
    level.tankinuse = 0;
    playfx( level.spawnfire, self.origin );
    playfx( level.tankfire, self.origin );
    removefromtanklist();
    var_1 = spawn( "script_model", self.origin );
    var_1 setmodel( "vehicle_m1a1_abrams_d_static" );
    var_1.angles = self.angles;
    self.mgturret delete();
    self delete();
    wait 4;
    var_1 delete();
}

onhitpitchclamp()
{
    self notify( "onTargOrTimeOut" );
    self endon( "onTargOrTimeOut" );
    self endon( "turret_on_target" );
    self waittill( "turret_pitch_clamped" );
    thread explicitabandontarget( 0, self.besttarget );
}

fireontarget()
{
    self endon( "abandonedTarget" );
    self endon( "killedTarget" );
    self endon( "death" );
    self endon( "targetRemoved" );
    self endon( "lostLOS" );

    for (;;)
    {
        onhitpitchclamp();

        if ( !isdefined( self.besttarget ) )
            continue;

        var_0 = self gettagorigin( "tag_flash" );
        var_1 = bullettrace( self.origin, var_0, 0, self );

        if ( var_1["position"] != var_0 )
            thread explicitabandontarget( 0, self.besttarget );

        var_1 = bullettrace( var_0, self.besttarget.origin, 1, self );
        var_2 = distance( self.origin, var_1["position"] );
        var_3 = distance( self.besttarget.origin, self.origin );

        if ( var_2 < 384 || var_2 + 256 < var_3 )
        {
            wait 0.5;

            if ( var_2 > 384 )
            {
                waitforturretready();
                self fireweapon();
                self playsound( "bmp_fire" );
                self.timelastfired = gettime();
            }

            var_4 = relativeangle( self.besttarget );
            thread explicitabandontarget( 0, self.besttarget );
            return;
        }

        waitforturretready();
        self fireweapon();
        self playsound( "bmp_fire" );
        self.timelastfired = gettime();
    }
}

waitforturretready()
{
    self endon( "abandonedTarget" );
    self endon( "killedTarget" );
    self endon( "death" );
    self endon( "targetRemoved" );
    self endon( "lostLOS" );
    var_0 = gettime() - self.timelastfired;

    if ( var_0 < 1499 )
        wait(1.5 - var_0 / 1000);
}

tankgettargets( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    var_1 = [];

    for (;;)
    {
        var_1 = [];
        var_2 = level.players;

        if ( isdefined( self.forcedtarget ) )
        {
            var_1 = [];
            var_1[0] = self.forcedtarget;
            acquiretarget( var_1 );
            self.forcedtarget = undefined;
        }

        if ( isdefined( level.harrier ) && level.harrier.team != self.team && isalive( level.harrier ) )
        {
            if ( isvehicletarget( level.tank ) )
                var_1[var_1.size] = level.tank;
        }

        if ( isdefined( level.chopper ) && level.chopper.team != self.team && isalive( level.chopper ) )
        {
            if ( isvehicletarget( level.chopper ) )
                var_1[var_1.size] = level.chopper;
        }

        foreach ( var_4 in var_2 )
        {
            if ( !isdefined( var_4 ) )
            {
                wait 0.05;
                continue;
            }

            if ( isdefined( var_0 ) && var_4 == var_0 )
                continue;

            if ( istarget( var_4 ) )
            {
                if ( isdefined( var_4 ) )
                    var_1[var_1.size] = var_4;

                continue;
            }

            continue;
        }

        if ( var_1.size > 0 )
        {
            acquiretarget( var_1 );
            continue;
        }

        wait 1;
    }
}

acquiretarget( var_0 )
{
    self endon( "death" );

    if ( var_0.size == 1 )
        self.besttarget = var_0[0];
    else
        self.besttarget = getbesttarget( var_0 );

    thread setengagementspeed();
    thread watchtargetdeath( var_0 );
    self setturrettargetent( self.besttarget );
    fireontarget();
    thread setnotarget();
}

setnotarget()
{
    self endon( "death" );
    setstandardspeed();
    removetarget();
    self setturrettargetent( self.neutraltarget );
}

getbesttarget( var_0 )
{
    self endon( "death" );
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = self.origin;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = 0;

    foreach ( var_7 in var_0 )
    {
        var_8 = abs( vectortoangles( var_7.origin - self.origin )[1] );
        var_9 = abs( self gettagangles( "tag_flash" )[1] );
        var_8 = abs( var_8 - var_9 );

        if ( isdefined( level.chopper ) && var_7 == level.chopper )
            return var_7;

        if ( isdefined( level.harrier ) && var_7 == level.harrier )
            return var_7;

        var_10 = var_7 getweaponslistitems();

        foreach ( var_12 in var_10 )
        {
            if ( issubstr( var_12, "at4" ) || issubstr( var_12, "jav" ) || issubstr( var_12, "c4" ) )
                var_8 -= 40;
        }

        if ( !isdefined( var_3 ) )
        {
            var_3 = var_8;
            var_4 = var_7;
            continue;
        }

        if ( var_3 > var_8 )
        {
            var_3 = var_8;
            var_4 = var_7;
        }
    }

    return var_4;
}

watchtargetdeath( var_0 )
{
    self endon( "abandonedTarget" );
    self endon( "lostLOS" );
    self endon( "death" );
    self endon( "targetRemoved" );
    var_1 = self.besttarget;
    var_1 endon( "disconnect" );
    var_1 waittill( "death" );
    self notify( "killedTarget" );
    removetarget();
    setstandardspeed();
    thread setnotarget();
}

explicitabandontarget( var_0, var_1 )
{
    self endon( "death" );
    self notify( "abandonedTarget" );
    setstandardspeed();
    thread setnotarget();
    removetarget();

    if ( isdefined( var_1 ) )
    {
        self.badtarget = var_1;
        badtargetreset();
    }

    if ( isdefined( var_0 ) && var_0 )
        return;

    return;
}

badtargetreset()
{
    self endon( "death" );
    wait 1.5;
    self.badtarget = undefined;
}

removetarget()
{
    self notify( "targetRemoved" );
    self.besttarget = undefined;
    self.lastlosttime = undefined;
}

isvehicletarget( var_0 )
{
    if ( distance2d( var_0.origin, self.origin ) > 4096 )
        return 0;

    if ( distance( var_0.origin, self.origin ) < 512 )
        return 0;

    return turretsighttrace( var_0, 0 );
}

istarget( var_0 )
{
    self endon( "death" );
    var_1 = distancesquared( var_0.origin, self.origin );

    if ( !level.teambased && isdefined( self.owner ) && var_0 == self.owner )
        return 0;

    if ( !isalive( var_0 ) || var_0.sessionstate != "playing" )
        return 0;

    if ( var_1 > 16777216 )
        return 0;

    if ( var_1 < 262144 )
        return 0;

    if ( !isdefined( var_0.pers["team"] ) )
        return 0;

    if ( var_0 == self.owner )
        return 0;

    if ( level.teambased && var_0.pers["team"] == self.team )
        return 0;

    if ( var_0.pers["team"] == "spectator" )
        return 0;

    if ( isdefined( var_0.spawntime ) && ( gettime() - var_0.spawntime ) / 1000 <= 5 )
        return 0;

    if ( var_0 maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
        return 0;

    return self vehicle_canturrettargetpoint( var_0.origin, 1, self );
}

turretsighttrace( var_0, var_1 )
{
    var_2 = var_0 sightconetrace( self gettagorigin( "tag_turret" ), self );

    if ( var_2 < 0.7 )
        return 0;

    if ( isdefined( var_1 ) && var_1 )
        thread drawline( var_0.origin, self gettagorigin( "tag_turret" ), 10, ( 1.0, 0.0, 0.0 ) );

    return 1;
}

isminitarget( var_0 )
{
    self endon( "death" );

    if ( !isalive( var_0 ) || var_0.sessionstate != "playing" )
        return 0;

    if ( !isdefined( var_0.pers["team"] ) )
        return 0;

    if ( var_0 == self.owner )
        return 0;

    if ( distancesquared( var_0.origin, self.origin ) > 1048576 )
        return 0;

    if ( level.teambased && var_0.pers["team"] == self.team )
        return 0;

    if ( var_0.pers["team"] == "spectator" )
        return 0;

    if ( isdefined( var_0.spawntime ) && ( gettime() - var_0.spawntime ) / 1000 <= 5 )
        return 0;

    if ( isdefined( self ) )
    {
        var_1 = self.mgturret.origin + ( 0.0, 0.0, 64.0 );
        var_2 = var_0 sightconetrace( var_1, self );

        if ( var_2 < 1 )
            return 0;
    }

    return 1;
}

tankgetminitargets()
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 = [];

    for (;;)
    {
        var_0 = [];
        var_1 = level.players;

        for ( var_2 = 0; var_2 <= var_1.size; var_2++ )
        {
            if ( isminitarget( var_1[var_2] ) )
            {
                if ( isdefined( var_1[var_2] ) )
                    var_0[var_0.size] = var_1[var_2];
            }
            else
                continue;

            wait 0.05;
        }

        if ( var_0.size > 0 )
        {
            acquireminitarget( var_0 );
            return;
        }
        else
            wait 0.5;
    }
}

getbestminitarget( var_0 )
{
    self endon( "death" );
    var_1 = self.origin;
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in var_0 )
    {
        var_6 = distance( self.origin, var_5.origin );
        var_7 = var_5 getcurrentweapon();

        if ( issubstr( var_7, "at4" ) || issubstr( var_7, "jav" ) || issubstr( var_7, "c4" ) || issubstr( var_7, "smart" ) || issubstr( var_7, "grenade" ) )
            var_6 -= 200;

        if ( !isdefined( var_2 ) )
        {
            var_2 = var_6;
            var_3 = var_5;
            continue;
        }

        if ( var_2 > var_6 )
        {
            var_2 = var_6;
            var_3 = var_5;
        }
    }

    return var_3;
}

acquireminitarget( var_0 )
{
    self endon( "death" );

    if ( var_0.size == 1 )
        self.bestminitarget = var_0[0];
    else
        self.bestminitarget = getbestminitarget( var_0 );

    if ( distance2d( self.origin, self.bestminitarget.origin ) > 768 )
        thread setminiengagementspeed();

    self notify( "acquiringMiniTarget" );
    self.mgturret settargetentity( self.bestminitarget, ( 0.0, 0.0, 64.0 ) );
    wait 0.15;
    thread fireminiontarget();
    thread watchminitargetdeath( var_0 );
    thread watchminitargetdistance( var_0 );
    thread watchminitargetthreat( self.bestminitarget );
}

fireminiontarget()
{
    self endon( "death" );
    self endon( "abandonedMiniTarget" );
    self endon( "killedMiniTarget" );
    var_0 = undefined;
    var_1 = gettime();

    if ( !isdefined( self.bestminitarget ) )
        return;

    for (;;)
    {
        if ( !isdefined( self.mgturret getturrettarget( 1 ) ) )
        {
            if ( !isdefined( var_0 ) )
                var_0 = gettime();

            var_2 = gettime();

            if ( var_0 - var_2 > 1 )
            {
                var_0 = undefined;
                thread explicitabandonminitarget();
                return;
            }

            wait 0.5;
            continue;
        }

        if ( gettime() > var_1 + 1000 && !isdefined( self.besttarget ) )
        {
            if ( distance2d( self.origin, self.bestminitarget.origin ) > 768 )
            {
                var_3[0] = self.bestminitarget;
                acquiretarget( var_3 );
            }
        }

        var_4 = randomintrange( 10, 16 );

        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            self.mgturret shootturret();
            wait 0.1;
        }

        wait(randomfloatrange( 0.5, 3.0 ));
    }
}

watchminitargetdeath( var_0 )
{
    self endon( "abandonedMiniTarget" );
    self endon( "death" );

    if ( !isdefined( self.bestminitarget ) )
        return;

    self.bestminitarget waittill( "death" );
    self notify( "killedMiniTarget" );
    self.bestminitarget = undefined;
    self.mgturret cleartargetentity();
    tankgetminitargets();
}

watchminitargetdistance( var_0 )
{
    self endon( "abandonedMiniTarget" );
    self endon( "death" );

    for (;;)
    {
        if ( !isdefined( self.bestminitarget ) )
            return;

        var_1 = bullettrace( self.mgturret.origin, self.bestminitarget.origin, 0, self );
        var_2 = distance( self.origin, var_1["position"] );

        if ( var_2 > 1024 )
        {
            thread explicitabandonminitarget();
            return;
        }

        wait 2;
    }
}

watchminitargetthreat( var_0 )
{
    self endon( "abandonedMiniTarget" );
    self endon( "death" );
    self endon( "killedMiniTarget" );

    for (;;)
    {
        var_1 = [];
        var_2 = level.players;

        for ( var_3 = 0; var_3 <= var_2.size; var_3++ )
        {
            if ( isminitarget( var_2[var_3] ) )
            {
                if ( !isdefined( var_2[var_3] ) )
                    continue;

                if ( !isdefined( var_0 ) )
                    return;

                var_4 = distance( self.origin, var_0.origin );
                var_5 = distance( self.origin, var_2[var_3].origin );

                if ( var_5 < var_4 )
                {
                    thread explicitabandonminitarget();
                    return;
                }
            }

            wait 0.05;
        }

        wait 0.25;
    }
}

explicitabandonminitarget( var_0 )
{
    self notify( "abandonedMiniTarget" );
    self.bestminitarget = undefined;
    self.mgturret cleartargetentity();

    if ( isdefined( var_0 ) && var_0 )
        return;

    thread tankgetminitargets();
    return;
}

addtotanklist()
{
    level.tanks[self getentitynumber()] = self;
}

removefromtanklist()
{
    level.tanks[self getentitynumber()] = undefined;
}

getnodenearenemies()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == "spectator" )
            continue;

        if ( var_2.team == self.team )
            continue;

        if ( !isalive( var_2 ) )
            continue;

        var_2.dist = 0;
        var_0[var_0.size] = var_2;
    }

    if ( !var_0.size )
        return undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        for ( var_5 = var_4 + 1; var_5 < var_0.size; var_5++ )
        {
            var_6 = distancesquared( var_0[var_4].origin, var_0[var_5].origin );
            var_0[var_4].dist += var_6;
            var_0[var_5].dist += var_6;
        }
    }

    var_7 = var_0[0];

    foreach ( var_2 in var_0 )
    {
        if ( var_2.dist < var_7.dist )
            var_7 = var_2;
    }

    var_10 = var_7.origin;
    var_11 = sortbydistance( level.graphnodes, var_10 );
    return var_11[0];
}

setuppaths()
{
    var_0 = [];
    var_1 = [];
    var_2 = [];
    var_3 = [];
    var_4 = getvehiclenode( "startnode", "targetname" );
    var_0[var_0.size] = var_4;
    var_1[var_1.size] = var_4;

    while ( isdefined( var_4.target ) )
    {
        var_5 = var_4;
        var_4 = getvehiclenode( var_4.target, "targetname" );
        var_4.prev = var_5;

        if ( var_4 == var_0[0] )
            break;

        var_0[var_0.size] = var_4;

        if ( !isdefined( var_4.target ) )
            return;
    }

    var_0[0].branchnodes = [];
    var_0[0] thread handlebranchnode( "forward" );
    var_3[var_3.size] = var_0[0];
    var_6 = getvehiclenodearray( "branchnode", "targetname" );

    foreach ( var_8 in var_6 )
    {
        var_4 = var_8;
        var_0[var_0.size] = var_4;
        var_1[var_1.size] = var_4;

        while ( isdefined( var_4.target ) )
        {
            var_5 = var_4;
            var_4 = getvehiclenode( var_4.target, "targetname" );
            var_0[var_0.size] = var_4;
            var_4.prev = var_5;

            if ( !isdefined( var_4.target ) )
                var_2[var_2.size] = var_4;
        }
    }

    foreach ( var_4 in var_0 )
    {
        var_11 = 0;

        foreach ( var_13 in var_1 )
        {
            if ( var_13 == var_4 )
                continue;

            if ( var_13.target == var_4.targetname )
                continue;

            if ( isdefined( var_4.target ) && var_4.target == var_13.targetname )
                continue;

            if ( distance2d( var_4.origin, var_13.origin ) > 80 )
                continue;

            var_13 thread handlecapnode( var_4, "reverse" );
            var_13.prev = var_4;

            if ( !isdefined( var_4.branchnodes ) )
                var_4.branchnodes = [];

            var_4.branchnodes[var_4.branchnodes.size] = var_13;
            var_11 = 1;
        }

        if ( var_11 )
            var_4 thread handlebranchnode( "forward" );

        var_15 = 0;

        foreach ( var_17 in var_2 )
        {
            if ( var_17 == var_4 )
                continue;

            if ( !isdefined( var_4.target ) )
                continue;

            if ( var_4.target == var_17.targetname )
                continue;

            if ( isdefined( var_17.target ) && var_17.target == var_4.targetname )
                continue;

            if ( distance2d( var_4.origin, var_17.origin ) > 80 )
                continue;

            var_17 thread handlecapnode( var_4, "forward" );
            var_17.next = getvehiclenode( var_4.targetname, "targetname" );
            var_17.length = distance( var_17.origin, var_4.origin );

            if ( !isdefined( var_4.branchnodes ) )
                var_4.branchnodes = [];

            var_4.branchnodes[var_4.branchnodes.size] = var_17;
            var_15 = 1;
        }

        if ( var_15 )
            var_4 thread handlebranchnode( "reverse" );

        if ( var_15 || var_11 )
            var_3[var_3.size] = var_4;
    }

    if ( var_3.size < 3 )
    {
        level notify( "end_tankPathHandling" );
        return;
    }

    var_20 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4.branchnodes ) )
            continue;

        var_20[var_20.size] = var_4;
    }

    foreach ( var_24 in var_20 )
    {
        var_4 = var_24;
        var_25 = 0;

        while ( isdefined( var_4.target ) )
        {
            var_26 = var_4;
            var_4 = getvehiclenode( var_4.target, "targetname" );
            var_25 += distance( var_4.origin, var_26.origin );

            if ( var_4 == var_24 )
                break;

            if ( isdefined( var_4.branchnodes ) )
                break;
        }

        if ( var_25 > 1000 )
        {
            var_4 = var_24;
            var_27 = 0;

            while ( isdefined( var_4.target ) )
            {
                var_26 = var_4;
                var_4 = getvehiclenode( var_4.target, "targetname" );
                var_27 += distance( var_4.origin, var_26.origin );

                if ( var_27 < var_25 / 2 )
                    continue;

                var_4.branchnodes = [];
                var_4 thread handlebranchnode( "forward" );
                var_3[var_3.size] = var_4;
                break;
            }
        }
    }

    level.graphnodes = initnodegraph( var_3 );

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4.graphid ) )
            var_4 thread nodetracker();
    }
}

getrandombranchnode( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in self.links )
    {
        if ( self.linkdirs[var_4] != var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1[randomint( var_1.size )];
}

getnextnodeforendnode( var_0, var_1 )
{
    var_2 = level.graphnodes[self.graphid];
    var_3 = generatepath( var_2, var_0, undefined, var_1 );
    var_4 = var_3[0].g;
    var_5 = generatepath( var_2, var_0, undefined, level.otherdir[var_1] );
    var_6 = var_5[0].g;

    if ( !getdvarint( "tankDebug" ) )
        var_6 = 9999999;

    if ( var_4 <= var_6 )
        return var_3[1];
}

handlebranchnode( var_0 )
{
    level endon( "end_tankPathHandling" );

    for (;;)
    {
        self waittill( "trigger", var_1, var_2 );
        var_3 = level.graphnodes[self.graphid];
        var_1.node = self;
        var_4 = undefined;

        if ( isdefined( var_1.endnode ) && var_1.endnode != var_3 )
        {
            var_4 = getnextnodeforendnode( var_1.endnode, var_1.veh_pathdir );

            if ( !isdefined( var_4 ) )
                var_1 thread setdirection( level.otherdir[var_1.veh_pathdir] );
        }

        if ( !isdefined( var_4 ) || var_4 == var_3 )
            var_4 = var_3 getrandombranchnode( var_1.veh_pathdir );

        var_5 = var_3.linkstartnodes[var_4.graphid];

        if ( var_1.veh_pathdir == "forward" )
            var_6 = getnextnode();
        else
            var_6 = getprevnode();

        if ( var_6 != var_5 )
            var_1 startpath( var_5 );
    }
}

handlecapnode( var_0, var_1 )
{
    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( var_2.veh_pathdir != var_1 )
            continue;

        debugprintln2( "tank starting path at join node: " + var_0.graphid );
        var_2 startpath( var_0 );
    }
}

nodetracker()
{
    self.forwardgraphid = getforwardgraphnode().graphid;
    self.reversegraphid = getreversegraphnode().graphid;

    for (;;)
    {
        self waittill( "trigger", var_0, var_1 );
        var_0.node = self;
        var_0.forwardgraphid = self.forwardgraphid;
        var_0.reversegraphid = self.reversegraphid;

        if ( !isdefined( self.target ) || self.targetname == "branchnode" )
            var_2 = "TRANS";
        else
            var_2 = "NODE";

        if ( isdefined( var_1 ) )
        {
            debugprint3d( self.origin, var_2, ( 1.0, 0.5, 0.0 ), 1, 2, 100 );
            continue;
        }

        debugprint3d( self.origin, var_2, ( 0.0, 1.0, 0.0 ), 1, 2, 100 );
    }
}

forcetrigger( var_0, var_1, var_2 )
{
    var_1 endon( "trigger" );
    var_0 endon( "trigger" );
    var_2 endon( "death" );
    var_3 = distancesquared( var_2.origin, var_1.origin );
    var_4 = var_2.veh_pathdir;
    debugprint3d( var_0.origin + ( 0.0, 0.0, 30.0 ), "LAST", ( 0.0, 0.0, 1.0 ), 0.5, 1, 100 );
    debugprint3d( var_1.origin + ( 0.0, 0.0, 60.0 ), "NEXT", ( 0.0, 1.0, 0.0 ), 0.5, 1, 100 );
    var_5 = 0;

    for (;;)
    {
        wait 0.05;

        if ( var_4 != var_2.veh_pathdir )
        {
            debugprintln2( "tank missed node: reversing direction" );
            var_2 thread forcetrigger( var_1, var_0, var_2 );
            return;
        }

        if ( var_5 )
        {
            debugprintln2( "... sending notify." );
            var_1 notify( "trigger", var_2, 1 );
            return;
        }

        var_6 = distancesquared( var_2.origin, var_1.origin );

        if ( var_6 > var_3 )
        {
            var_5 = 1;
            debugprintln2( "tank missed node: forcing notify in one frame..." );
        }

        var_3 = var_6;
    }
}

getforwardgraphnode()
{
    for ( var_0 = self; !isdefined( var_0.graphid ); var_0 = var_0 getnextnode() )
    {

    }

    return var_0;
}

getreversegraphnode()
{
    for ( var_0 = self; !isdefined( var_0.graphid ); var_0 = var_0 getprevnode() )
    {

    }

    return var_0;
}

getnextnode()
{
    if ( isdefined( self.target ) )
        return getvehiclenode( self.target, "targetname" );
    else
        return self.next;
}

getprevnode()
{
    return self.prev;
}

initnodegraph( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = spawnstruct();
        var_4.linkinfos = [];
        var_4.links = [];
        var_4.linklengths = [];
        var_4.linkdirs = [];
        var_4.linkstartnodes = [];
        var_4.node = var_3;
        var_4.origin = var_3.origin;
        var_4.graphid = var_1.size;
        var_3.graphid = var_1.size;
        debugprint3d( var_4.origin + ( 0.0, 0.0, 80.0 ), var_4.graphid, ( 1.0, 1.0, 1.0 ), 0.65, 2, 100000 );
        var_1[var_1.size] = var_4;
    }

    foreach ( var_3 in var_0 )
    {
        var_7 = var_3.graphid;
        var_8 = getvehiclenode( var_3.target, "targetname" );
        var_9 = distance( var_3.origin, var_8.origin );
        var_10 = var_8;

        while ( !isdefined( var_8.graphid ) )
        {
            var_9 += distance( var_8.origin, var_8.prev.origin );

            if ( isdefined( var_8.target ) )
            {
                var_8 = getvehiclenode( var_8.target, "targetname" );
                continue;
            }

            var_8 = var_8.next;
        }

        var_1[var_7] addlinknode( var_1[var_8.graphid], var_9, "forward", var_10 );
        var_8 = var_3.prev;
        var_9 = distance( var_3.origin, var_8.origin );

        for ( var_10 = var_8; !isdefined( var_8.graphid ); var_8 = var_8.prev )
            var_9 += distance( var_8.origin, var_8.prev.origin );

        var_1[var_7] addlinknode( var_1[var_8.graphid], var_9, "reverse", var_10 );

        foreach ( var_12 in var_3.branchnodes )
        {
            var_8 = var_12;
            var_9 = distance( var_3.origin, var_8.origin );
            var_10 = var_8;

            if ( var_8.targetname == "branchnode" )
            {
                while ( !isdefined( var_8.graphid ) )
                {
                    if ( isdefined( var_8.target ) )
                        var_13 = getvehiclenode( var_8.target, "targetname" );
                    else
                        var_13 = var_8.next;

                    var_9 += distance( var_8.origin, var_13.origin );
                    var_8 = var_13;
                }

                var_1[var_7] addlinknode( var_1[var_8.graphid], var_9, "forward", var_10 );
                continue;
            }

            while ( !isdefined( var_8.graphid ) )
            {
                var_9 += distance( var_8.origin, var_8.prev.origin );
                var_8 = var_8.prev;
            }

            var_1[var_7] addlinknode( var_1[var_8.graphid], var_9, "reverse", var_10 );
        }
    }

    return var_1;
}

addlinknode( var_0, var_1, var_2, var_3 )
{
    self.links[var_0.graphid] = var_0;
    self.linklengths[var_0.graphid] = var_1;
    self.linkdirs[var_0.graphid] = var_2;
    self.linkstartnodes[var_0.graphid] = var_3;
    var_4 = spawnstruct();
    var_4.tographnode = var_0;
    var_4.tographid = var_0.graphid;
    var_4.length = var_1;
    var_4.direction = var_2;
    var_4.startnode = var_3;
    self.linkinfos[var_0.graphid] = var_4;
}

generatepath( var_0, var_1, var_2, var_3 )
{
    level.openlist = [];
    level.closedlist = [];
    var_4 = 0;
    var_5 = [];

    if ( !isdefined( var_2 ) )
        var_2 = [];

    var_1.g = 0;
    var_1.h = gethvalue( var_1, var_0 );
    var_1.f = var_1.g + var_1.h;
    addtoclosedlist( var_1 );
    var_6 = var_1;

    for (;;)
    {
        foreach ( var_9, var_8 in var_6.links )
        {
            if ( is_in_array( var_2, var_8 ) )
                continue;

            if ( is_in_array( level.closedlist, var_8 ) )
                continue;

            if ( isdefined( var_3 ) && var_8.linkdirs[var_6.graphid] != var_3 )
                continue;

            if ( !is_in_array( level.openlist, var_8 ) )
            {
                addtoopenlist( var_8 );
                var_8.parentnode = var_6;
                var_8.g = getgvalue( var_8, var_6 );
                var_8.h = gethvalue( var_8, var_0 );
                var_8.f = var_8.g + var_8.h;

                if ( var_8 == var_0 )
                    var_4 = 1;

                continue;
            }

            if ( var_8.g < getgvalue( var_6, var_8 ) )
                continue;

            var_8.parentnode = var_6;
            var_8.g = getgvalue( var_8, var_6 );
            var_8.f = var_8.g + var_8.h;
        }

        if ( var_4 )
            break;

        addtoclosedlist( var_6 );
        var_10 = level.openlist[0];

        foreach ( var_12 in level.openlist )
        {
            if ( var_12.f > var_10.f )
                continue;

            var_10 = var_12;
        }

        addtoclosedlist( var_10 );
        var_6 = var_10;
    }

    for ( var_6 = var_0; var_6 != var_1; var_6 = var_6.parentnode )
        var_5[var_5.size] = var_6;

    var_5[var_5.size] = var_6;
    return var_5;
}

addtoopenlist( var_0 )
{
    var_0.openlistid = level.openlist.size;
    level.openlist[level.openlist.size] = var_0;
    var_0.closedlistid = undefined;
}

addtoclosedlist( var_0 )
{
    if ( isdefined( var_0.closedlistid ) )
        return;

    var_0.closedlistid = level.closedlist.size;
    level.closedlist[level.closedlist.size] = var_0;

    if ( !is_in_array( level.openlist, var_0 ) )
        return;

    level.openlist[var_0.openlistid] = level.openlist[level.openlist.size - 1];
    level.openlist[var_0.openlistid].openlistid = var_0.openlistid;
    level.openlist[level.openlist.size - 1] = undefined;
    var_0.openlistid = undefined;
}

gethvalue( var_0, var_1 )
{
    return distance( var_0.node.origin, var_1.node.origin );
}

getgvalue( var_0, var_1 )
{
    return var_0.parentnode.g + var_0.linklengths[var_1.graphid];
}

is_in_array( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == var_1 )
            return 1;
    }

    return 0;
}

drawpath( var_0 )
{
    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1 - 1];
        var_3 = var_0[var_1];

        if ( var_2.linkdirs[var_3.graphid] == "reverse" )
            level thread drawlink( var_2.node.origin, var_3.node.origin, ( 1.0, 0.0, 0.0 ) );
        else
            level thread drawlink( var_2.node.origin, var_3.node.origin, ( 0.0, 1.0, 0.0 ) );

        var_4 = var_2.linkstartnodes[var_3.graphid];
        level thread drawlink( var_2.node.origin + ( 0.0, 0.0, 4.0 ), var_4.origin + ( 0.0, 0.0, 4.0 ), ( 0.0, 0.0, 1.0 ) );

        if ( var_2.linkdirs[var_3.graphid] == "reverse" )
        {
            while ( !isdefined( var_4.graphid ) )
            {
                var_5 = var_4;
                var_4 = var_4.prev;
                level thread drawlink( var_5.origin + ( 0.0, 0.0, 4.0 ), var_4.origin + ( 0.0, 0.0, 4.0 ), ( 0.0, 1.0, 1.0 ) );
            }

            continue;
        }

        while ( !isdefined( var_4.graphid ) )
        {
            var_5 = var_4;

            if ( isdefined( var_4.target ) )
                var_4 = getvehiclenode( var_4.target, "targetname" );
            else
                var_4 = var_4.next;

            level thread drawlink( var_5.origin + ( 0.0, 0.0, 4.0 ), var_4.origin + ( 0.0, 0.0, 4.0 ), ( 0.0, 1.0, 1.0 ) );
        }
    }
}

drawgraph( var_0 )
{

}

drawlink( var_0, var_1, var_2 )
{
    level endon( "endpath" );

    for (;;)
        wait 0.05;
}

debugprintln2( var_0 )
{

}

debugprint( var_0 )
{

}

debugprint3d( var_0, var_1, var_2, var_3, var_4, var_5 )
{

}

drawtankgraphids()
{

}
