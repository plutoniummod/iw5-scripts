// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachevehicle( "attack_littlebird_mp" );
    precachemodel( "vehicle_apache_mp" );
    precachemodel( "vehicle_apache_mg" );
    precacheturret( "apache_minigun_mp" );
    precachevehicle( "apache_strafe_mp" );
    level.killstreakfuncs["littlebird_flock"] = ::tryuselbflock;
    level.heli_flock = [];
}

tryuselbflock( var_0, var_1 )
{
    if ( !maps\mp\_utility::validateusestreak() )
        return 0;

    var_2 = 5;

    if ( heliflockactive() || maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_2 >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    maps\mp\_utility::incrementfauxvehiclecount();
    maps\mp\_utility::incrementfauxvehiclecount();
    maps\mp\_utility::incrementfauxvehiclecount();
    maps\mp\_utility::incrementfauxvehiclecount();
    maps\mp\_utility::incrementfauxvehiclecount();
    var_3 = selectlbstrikelocation( var_0, "littlebird_flock" );

    if ( !isdefined( var_3 ) || !var_3 )
    {
        maps\mp\_utility::decrementfauxvehiclecount();
        maps\mp\_utility::decrementfauxvehiclecount();
        maps\mp\_utility::decrementfauxvehiclecount();
        maps\mp\_utility::decrementfauxvehiclecount();
        maps\mp\_utility::decrementfauxvehiclecount();
        return 0;
    }

    level thread maps\mp\_utility::teamplayercardsplash( "used_littlebird_flock", self, self.team );
    return 1;
}

heliflockactive()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.heli_flock.size; var_1++ )
    {
        if ( isdefined( level.heli_flock[var_1] ) )
        {
            var_0 = 1;
            break;
        }
    }

    return var_0;
}

selectlbstrikelocation( var_0, var_1 )
{
    self playlocalsound( game["voice"][self.team] + "KS_lbd_inposition" );
    maps\mp\_utility::_beginlocationselection( var_1, "map_artillery_selector", 1, 500 );
    self endon( "stop_location_selection" );
    self waittill( "confirm_location", var_2, var_3 );

    if ( heliflockactive() || maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        self notify( "cancel_location" );
        return 0;
    }

    level.heli_flock = [];
    level.heli_flock_victims = [];
    thread littlebirdmadeselectionvo();
    thread finishlbstrikeusage( var_0, var_2, ::callstrike, var_3 );
    self setblurforplayer( 0, 0.3 );
    return 1;
}

littlebirdmadeselectionvo()
{
    self endon( "death" );
    self endon( "disconnect" );
    self playlocalsound( game["voice"][self.team] + "KS_hqr_littlebird" );
    wait 3.0;
    self playlocalsound( game["voice"][self.team] + "KS_lbd_inbound" );
}

finishlbstrikeusage( var_0, var_1, var_2, var_3 )
{
    self notify( "used" );
    wait 0.05;
    thread maps\mp\_utility::stoplocationselection( 0 );

    if ( isdefined( self ) )
        self thread [[ var_2 ]]( var_0, var_1, var_3 );
}

callstrike( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_3 = getflightpath( var_1, var_2, 0 );
    var_4 = getflightpath( var_1, var_2, -520 );
    var_5 = getflightpath( var_1, var_2, 520 );
    var_6 = getflightpath( var_1, var_2, -1040 );
    var_7 = getflightpath( var_1, var_2, 1040 );
    level thread dolbstrike( var_0, self, var_3, 0 );
    wait 0.3;
    level thread dolbstrike( var_0, self, var_4, 1 );
    level thread dolbstrike( var_0, self, var_5, 2 );
    wait 0.3;
    level thread dolbstrike( var_0, self, var_6, 3 );
    level thread dolbstrike( var_0, self, var_7, 4 );
    maps\mp\_matchdata::logkillstreakevent( "littlebird_flock", var_1 );
}

getflightpath( var_0, var_1, var_2 )
{
    var_0 *= ( 1.0, 1.0, 0.0 );
    var_3 = ( 0, var_1, 0 );
    var_4 = 12000;
    var_5 = [];

    if ( isdefined( var_2 ) && var_2 != 0 )
        var_0 = var_0 + anglestoright( var_3 ) * var_2 + ( 0, 0, randomint( 300 ) );

    var_6 = var_0 + anglestoforward( var_3 ) * ( -1 * var_4 );
    var_7 = var_0 + anglestoforward( var_3 ) * var_4;
    var_8 = maps\mp\killstreaks\_airdrop::getflyheightoffset( var_0 ) + 256;
    var_5["start"] = var_6 + ( 0, 0, var_8 );
    var_5["end"] = var_7 + ( 0, 0, var_8 );
    return var_5;
}

dolbstrike( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );

    if ( !isdefined( var_1 ) )
        return;

    var_4 = vectortoangles( var_2["end"] - var_2["start"] );
    var_5 = spawnattacklittlebird( var_1, var_2["start"], var_4, var_3 );
    var_5.lifeid = var_0;
    var_5.alreadydead = 0;
    var_5 thread watchtimeout();
    var_5 thread watchdeath();
    var_5 thread flock_handledamage();
    var_5 thread startlbfiring1();
    var_5 thread monitorkills();
    var_5 endon( "death" );
    var_5 setmaxpitchroll( 120, 60 );
    var_5 vehicle_setspeed( 48, 48 );
    var_5 setvehgoalpos( var_2["end"], 0 );
    var_5 waittill( "goal" );
    var_5 setmaxpitchroll( 30, 40 );
    var_5 vehicle_setspeed( 32, 32 );
    var_5 setvehgoalpos( var_2["start"], 0 );
    wait 2;
    var_5 setmaxpitchroll( 100, 60 );
    var_5 vehicle_setspeed( 64, 64 );
    var_5 waittill( "goal" );
    var_5 notify( "gone" );
    var_5 removelittlebird();
}

spawnattacklittlebird( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnhelicopter( var_0, var_1, var_2, "apache_strafe_mp", "vehicle_apache_mp" );

    if ( !isdefined( var_4 ) )
        return;

    var_4 maps\mp\killstreaks\_helicopter::addtolittlebirdlist();
    var_4 thread maps\mp\killstreaks\_helicopter::removefromlittlebirdlistondeath();
    var_4.health = 999999;
    var_4.maxhealth = 2000;
    var_4.damagetaken = 0;
    var_4 setcandamage( 1 );
    var_4.owner = var_0;
    var_4.team = var_0.team;
    var_4.killcount = 0;
    var_4.streakname = "littlebird_flock";
    var_4.helitype = "littlebird";
    var_4.specialdamagecallback = ::callback_vehicledamage;
    var_5 = spawnturret( "misc_turret", var_4.origin, "apache_minigun_mp" );
    var_5 linkto( var_4, "tag_turret", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_5 setmodel( "vehicle_apache_mg" );
    var_5.angles = var_4.angles;
    var_5.owner = var_4.owner;
    var_5.team = var_5.owner.team;
    var_5 maketurretinoperable();
    var_5.vehicle = var_4;
    var_6 = var_4.origin + ( anglestoforward( var_4.angles ) * -200 + anglestoright( var_4.angles ) * -200 ) + ( 0.0, 0.0, 50.0 );
    var_5.killcament = spawn( "script_model", var_6 );
    var_5.killcament setscriptmoverkillcam( "explosive" );
    var_5.killcament linkto( var_4, "tag_origin" );
    var_4.mgturret1 = var_5;
    var_4.mgturret1 setdefaultdroppitch( 0 );
    var_4.mgturret1 setmode( "auto_nonai" );
    var_4.mgturret1 setsentryowner( var_4.owner );

    if ( level.teambased )
        var_4.mgturret1 setturretteam( var_4.owner.team );

    level.heli_flock[var_3] = var_4;
    return var_4;
}

watchtimeout()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self endon( "death" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 60.0 );
    self notify( "death" );
}

monitorkills()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self endon( "death" );
    self endon( "stopFiring" );

    for (;;)
    {
        self waittill( "killedPlayer", var_0 );
        self.killcount++;
        level.heli_flock_victims[level.heli_flock_victims.size] = var_0;
    }
}

startlbfiring1()
{
    self endon( "gone" );
    self endon( "death" );
    self endon( "stopFiring" );

    for (;;)
    {
        self.mgturret1 waittill( "turret_on_target" );
        var_0 = 1;
        var_1 = self.mgturret1 getturrettarget( 0 );

        foreach ( var_3 in level.heli_flock_victims )
        {
            if ( var_1 == var_3 )
            {
                self.mgturret1 cleartargetentity();
                var_0 = 0;
                break;
            }
        }

        if ( var_0 )
            self.mgturret1 shootturret();
    }
}

flock_handledamage()
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

callback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self.alreadydead ) && self.alreadydead )
        return;

    if ( !isdefined( var_1 ) || var_1 == self )
        return;

    if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_1 ) )
        return;

    if ( isdefined( var_3 ) && var_3 & level.idflags_penetration )
        self.wasdamagedfrombulletpenetration = 1;

    self.wasdamaged = 1;
    var_12 = var_2;

    if ( isplayer( var_1 ) )
    {
        var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "helicopter" );

        if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
        {
            if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                var_12 += var_2 * level.armorpiercingmod;
        }
    }

    if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
        var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "helicopter" );

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
                self.largeprojectiledamage = 1;
                var_12 = self.maxhealth + 1;
                break;
            case "sam_projectile_mp":
                self.largeprojectiledamage = 1;
                var_12 = self.maxhealth * 0.25;
                break;
            case "emp_grenade_mp":
                self.largeprojectiledamage = 0;
                var_12 = self.maxhealth + 1;
                break;
        }
    }

    self.damagetaken += var_12;

    if ( self.damagetaken >= self.maxhealth )
    {
        if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
        {
            self.alreadydead = 1;
            var_1 notify( "destroyed_helicopter" );
            var_1 notify( "destroyed_killstreak", var_5 );
            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_helicopter", var_1 );
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 300, var_5, var_4 );
            var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_HELICOPTER" );
            thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_1, var_2, var_4, var_5 );
        }

        self notify( "death" );
    }
}

watchdeath()
{
    self endon( "gone" );
    self waittill( "death" );
    thread helidestroyed();
}

helidestroyed()
{
    self endon( "gone" );

    if ( !isdefined( self ) )
        return;

    self vehicle_setspeed( 25, 5 );
    thread lbspin( randomintrange( 180, 220 ) );
    wait(randomfloatrange( 0.5, 1.5 ));
    lbexplode();
}

lbspin( var_0 )
{
    self endon( "explode" );
    playfxontag( level.chopper_fx["explode"]["medium"], self, "tail_rotor_jnt" );
    thread trail_fx( level.chopper_fx["smoke"]["trail"], "tail_rotor_jnt", "stop tail smoke" );
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self settargetyaw( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

trail_fx( var_0, var_1, var_2 )
{
    self notify( var_2 );
    self endon( var_2 );
    self endon( "death" );

    for (;;)
    {
        playfxontag( var_0, self, var_1 );
        wait 0.05;
    }
}

lbexplode()
{
    var_0 = self.origin + ( 0.0, 0.0, 1.0 ) - self.origin;
    var_1 = self gettagangles( "tag_deathfx" );
    playfx( level.chopper_fx["explode"]["air_death"]["littlebird"], self gettagorigin( "tag_deathfx" ), anglestoforward( var_1 ), anglestoup( var_1 ) );
    self playsound( "cobra_helicopter_crash" );
    self notify( "explode" );
    removelittlebird();
}

removelittlebird()
{
    if ( isdefined( self.mgturret1 ) )
    {
        if ( isdefined( self.mgturret1.killcament ) )
            self.mgturret1.killcament delete();

        self.mgturret1 delete();
    }

    maps\mp\_utility::decrementfauxvehiclecount();
    self delete();
}
