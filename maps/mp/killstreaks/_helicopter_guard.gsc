// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs["littlebird_support"] = ::tryuselbsupport;
    level.heliguardsettings = [];
    level.heliguardsettings["littlebird_support"] = spawnstruct();
    level.heliguardsettings["littlebird_support"].timeout = 60.0;
    level.heliguardsettings["littlebird_support"].health = 999999;
    level.heliguardsettings["littlebird_support"].maxhealth = 2000;
    level.heliguardsettings["littlebird_support"].streakname = "littlebird_support";
    level.heliguardsettings["littlebird_support"].weaponinfo = "attack_littlebird_mp";
    level.heliguardsettings["littlebird_support"].weaponinfo = "littlebird_guard_minigun_mp";
    level.heliguardsettings["littlebird_support"].weaponmodelleft = "vehicle_little_bird_minigun_left";
    level.heliguardsettings["littlebird_support"].weaponmodelright = "vehicle_little_bird_minigun_right";
    level.heliguardsettings["littlebird_support"].weapontagleft = "tag_minigun_attach_left";
    level.heliguardsettings["littlebird_support"].weapontagright = "tag_minigun_attach_right";
    level.heliguardsettings["littlebird_support"].sentrymode = "auto_nonai";
    level.heliguardsettings["littlebird_support"].modelbase = "vehicle_little_bird_armed";
    level.heliguardsettings["littlebird_support"].teamsplash = "used_littlebird_support";

    foreach ( var_1 in level.heliguardsettings )
    {
        precachevehicle( var_1.weaponinfo );
        precacheturret( var_1.weaponinfo );
        precachemodel( var_1.weaponmodelleft );
        precachemodel( var_1.weaponmodelright );
        precachemodel( var_1.modelbase );
    }

    lbsupport_setairstartnodes();
    lbsupport_setairnodemesh();
}

tryuselbsupport( var_0 )
{
    var_1 = "littlebird_support";
    var_2 = 1;

    if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
        return 0;
    }
    else if ( maps\mp\_utility::isusingremote() )
        return 0;
    else if ( isdefined( level.littlebirdguard ) || maps\mp\killstreaks\_helicopter::exceededmaxlittlebirds( var_1 ) )
    {
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( !level.air_node_mesh.size )
    {
        self iprintlnbold( &"MP_UNAVAILABLE_IN_LEVEL" );
        return 0;
    }
    else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_2 >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    maps\mp\_utility::incrementfauxvehiclecount();
    var_3 = createlbguard( var_1 );

    if ( !isdefined( var_3 ) )
    {
        maps\mp\_utility::decrementfauxvehiclecount();
        return 0;
    }

    thread startlbsupport( var_3 );
    level thread maps\mp\_utility::teamplayercardsplash( level.heliguardsettings[var_1].teamsplash, self, self.team );
    return 1;
}

createlbguard( var_0 )
{
    var_1 = lbsupport_getcloseststartnode( self.origin );

    if ( isdefined( var_1.angles ) )
        var_2 = var_1.angles;
    else
        var_2 = ( 0.0, 0.0, 0.0 );

    var_3 = maps\mp\killstreaks\_airdrop::getflyheightoffset( self.origin );
    var_4 = lbsupport_getclosestnode( self.origin );
    var_4 = lbsupport_tu0_new_incoming_position( var_4 );
    var_5 = anglestoforward( self.angles );
    var_6 = var_4.origin * ( 1.0, 1.0, 0.0 ) + ( 0.0, 0.0, 1.0 ) * var_3 + var_5 * -100;
    var_7 = var_1.origin;
    var_8 = spawnhelicopter( self, var_7, var_2, level.heliguardsettings[var_0].weaponinfo, level.heliguardsettings[var_0].modelbase );

    if ( !isdefined( var_8 ) )
        return;

    var_8 maps\mp\killstreaks\_helicopter::addtolittlebirdlist();
    var_8 thread maps\mp\killstreaks\_helicopter::removefromlittlebirdlistondeath();
    var_8.health = level.heliguardsettings[var_0].health;
    var_8.maxhealth = level.heliguardsettings[var_0].maxhealth;
    var_8.damagetaken = 0;
    var_8.speed = 100;
    var_8.followspeed = 40;
    var_8.owner = self;
    var_8.team = self.team;
    var_8 setmaxpitchroll( 45, 45 );
    var_8 vehicle_setspeed( var_8.speed, 100, 40 );
    var_8 setyawspeed( 120, 60 );
    var_8 setneargoalnotifydist( 512 );
    var_8.killcount = 0;
    var_8.helitype = "littlebird";
    var_8.heliguardtype = "littlebird_support";
    var_8.targettingradius = 2000;
    var_8.targetpos = var_6;
    var_8.currentnode = var_4;
    var_9 = spawnturret( "misc_turret", var_8.origin, level.heliguardsettings[var_0].weaponinfo );
    var_9 linkto( var_8, level.heliguardsettings[var_0].weapontagleft, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_9 setmodel( level.heliguardsettings[var_0].weaponmodelleft );
    var_9.angles = var_8.angles;
    var_9.owner = var_8.owner;
    var_9.team = self.team;
    var_9 maketurretinoperable();
    var_9.vehicle = var_8;
    var_8.mgturretleft = var_9;
    var_8.mgturretleft setdefaultdroppitch( 0 );
    var_10 = var_8.origin + ( anglestoforward( var_8.angles ) * -100 + anglestoright( var_8.angles ) * -100 ) + ( 0.0, 0.0, 50.0 );
    var_9.killcament = spawn( "script_model", var_10 );
    var_9.killcament setscriptmoverkillcam( "explosive" );
    var_9.killcament linkto( var_8, "tag_origin" );
    var_9 = spawnturret( "misc_turret", var_8.origin, level.heliguardsettings[var_0].weaponinfo );
    var_9 linkto( var_8, level.heliguardsettings[var_0].weapontagright, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_9 setmodel( level.heliguardsettings[var_0].weaponmodelright );
    var_9.angles = var_8.angles;
    var_9.owner = var_8.owner;
    var_9.team = self.team;
    var_9 maketurretinoperable();
    var_9.vehicle = var_8;
    var_8.mgturretright = var_9;
    var_8.mgturretright setdefaultdroppitch( 0 );
    var_10 = var_8.origin + ( anglestoforward( var_8.angles ) * -100 + anglestoright( var_8.angles ) * 100 ) + ( 0.0, 0.0, 50.0 );
    var_9.killcament = spawn( "script_model", var_10 );
    var_9.killcament setscriptmoverkillcam( "explosive" );
    var_9.killcament linkto( var_8, "tag_origin" );

    if ( level.teambased )
    {
        var_8.mgturretleft setturretteam( self.team );
        var_8.mgturretright setturretteam( self.team );
    }

    var_8.mgturretleft setmode( level.heliguardsettings[var_0].sentrymode );
    var_8.mgturretright setmode( level.heliguardsettings[var_0].sentrymode );
    var_8.mgturretleft setsentryowner( self );
    var_8.mgturretright setsentryowner( self );
    var_8.mgturretleft thread lbsupport_attacktargets();
    var_8.mgturretright thread lbsupport_attacktargets();
    var_8.attract_strength = 10000;
    var_8.attract_range = 150;
    var_8.attractor = missile_createattractorent( var_8, var_8.attract_strength, var_8.attract_range );
    var_8.hasdodged = 0;
    var_8.empgrenaded = 0;
    var_8 thread lbsupport_handledamage();
    var_8 thread lbsupport_watchdeath();
    var_8 thread lbsupport_watchtimeout();
    var_8 thread lbsupport_watchownerloss();
    var_8 thread lbsupport_watchownerdamage();
    var_8 thread lbsupport_watchroundend();
    var_8 thread lbsupport_lightfx();
    level.littlebirdguard = var_8;
    var_8.owner maps\mp\_matchdata::logkillstreakevent( level.heliguardsettings[var_8.heliguardtype].streakname, var_8.targetpos );
    return var_8;
}

lbsupport_lightfx()
{
    playfxontag( level.chopper_fx["light"]["left"], self, "tag_light_nose" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail1" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail2" );
}

startlbsupport( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 setlookatent( self );
    var_0 setvehgoalpos( var_0.targetpos );
    var_0 waittill( "near_goal" );
    var_0 vehicle_setspeed( var_0.speed, 60, 30 );
    var_0 waittill( "goal" );
    var_0 setvehgoalpos( var_0.currentnode.origin, 1 );
    var_0 waittill( "goal" );
    var_0 thread lbsupport_followplayer();
    var_0 thread maps\mp\killstreaks\_helicopter::handleincomingsam( ::lbsupport_watchsamproximity );
    var_0 thread maps\mp\killstreaks\_helicopter::handleincomingstinger( ::lbsupport_watchstingerproximity );
}

lbsupport_followplayer()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( self.owner ) )
    {
        thread lbsupport_leave();
        return;
    }

    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    self vehicle_setspeed( self.followspeed, 20, 20 );

    for (;;)
    {
        if ( isdefined( self.owner ) && isalive( self.owner ) )
        {
            var_0 = lbsupport_getclosestlinkednode( self.owner.origin );

            if ( isdefined( var_0 ) && var_0 != self.currentnode )
            {
                self.currentnode = var_0;
                lbsupport_movetoplayer();
                continue;
            }
        }

        wait 1;
    }
}

lbsupport_movetoplayer()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    self notify( "lbSupport_moveToPlayer" );
    self endon( "lbSupport_moveToPlayer" );
    self.intransit = 1;
    self setvehgoalpos( self.currentnode.origin, 1 );
    self waittill( "goal" );
    self.intransit = 0;
    self notify( "hit_goal" );
}

lbsupport_watchdeath()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );
    thread helidestroyed();
}

lbsupport_watchtimeout()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    var_0 = level.heliguardsettings[self.heliguardtype].timeout;
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread lbsupport_leave();
}

lbsupport_watchownerloss()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner common_scripts\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    thread lbsupport_leave();
}

lbsupport_watchownerdamage()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );

    for (;;)
    {
        self.owner waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isplayer( var_1 ) )
        {
            if ( var_1 != self.owner && distance2d( var_1.origin, self.origin ) <= self.targettingradius && !var_1 maps\mp\_utility::_hasperk( "specialty_blindeye" ) && !( level.hardcoremode && level.teambased && var_1.team == self.team ) )
            {
                self setlookatent( var_1 );
                self.mgturretleft settargetentity( var_1 );
                self.mgturretright settargetentity( var_1 );
            }
        }
    }
}

lbsupport_watchroundend()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level waittill( "round_end_finished" );
    thread lbsupport_leave();
}

lbsupport_leave()
{
    self endon( "death" );
    self notify( "leaving" );
    level.littlebirdguard = undefined;
    self clearlookatent();
    var_0 = maps\mp\killstreaks\_airdrop::getflyheightoffset( self.origin );
    var_1 = self.origin + ( 0, 0, var_0 );
    self vehicle_setspeed( self.speed, 60 );
    self setmaxpitchroll( 45, 180 );
    self setvehgoalpos( var_1 );
    self waittill( "goal" );
    var_1 += anglestoforward( self.angles ) * 15000;
    var_2 = spawn( "script_origin", var_1 );

    if ( isdefined( var_2 ) )
    {
        self setlookatent( var_2 );
        var_2 thread wait_and_delete( 3.0 );
    }

    self setvehgoalpos( var_1 );
    self waittill( "goal" );
    self notify( "gone" );
    removelittlebird();
}

wait_and_delete( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self delete();
}

lbsupport_handledamage()
{
    self endon( "death" );
    level endon( "game_ended" );
    self setcandamage( 1 );

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
            if ( var_1 != self.owner && distance2d( var_1.origin, self.origin ) <= self.targettingradius && !var_1 maps\mp\_utility::_hasperk( "specialty_blindeye" ) && !( level.hardcoremode && level.teambased && var_1.team == self.team ) )
            {
                self setlookatent( var_1 );
                self.mgturretleft settargetentity( var_1 );
                self.mgturretright settargetentity( var_1 );
            }

            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "helicopter" );

            if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
            {
                if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
                    var_10 += var_0 * level.armorpiercingmod;
            }
        }

        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "helicopter" );

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
                case "sam_projectile_mp":
                    self.largeprojectiledamage = 1;
                    var_10 = self.maxhealth * 0.25;
                    break;
                case "emp_grenade_mp":
                    var_10 = 0;
                    thread lbsupport_empgrenaded();
                    break;
                case "osprey_player_minigun_mp":
                    self.largeprojectiledamage = 0;
                    var_10 *= 2;
                    break;
            }
        }

        self.damagetaken += var_10;

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
            {
                var_1 notify( "destroyed_helicopter" );
                var_1 notify( "destroyed_killstreak", var_9 );
                thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_little_bird", var_1 );
                var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", 300, var_9, var_4 );
                var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_LITTLE_BIRD" );
                thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_1, var_0, var_4, var_9 );
            }

            if ( isdefined( self.owner ) )
                self.owner thread maps\mp\_utility::leaderdialogonplayer( "lbguard_destroyed" );

            self notify( "death" );
            return;
        }
    }
}

lbsupport_empgrenaded()
{
    self notify( "lbSupport_EMPGrenaded" );
    self endon( "lbSupport_EMPGrenaded" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self.empgrenaded = 1;
    self.mgturretright notify( "stop_shooting" );
    self.mgturretleft notify( "stop_shooting" );

    if ( isdefined( level._effect["ims_sensor_explode"] ) )
    {
        playfxontag( common_scripts\utility::getfx( "ims_sensor_explode" ), self.mgturretright, "tag_aim" );
        playfxontag( common_scripts\utility::getfx( "ims_sensor_explode" ), self.mgturretleft, "tag_aim" );
    }

    wait 3.5;
    self.empgrenaded = 0;
    self.mgturretright notify( "turretstatechange" );
    self.mgturretleft notify( "turretstatechange" );
}

helidestroyed()
{
    level.littlebirdguard = undefined;

    if ( !isdefined( self ) )
        return;

    self vehicle_setspeed( 25, 5 );
    thread lbspin( randomintrange( 180, 220 ) );
    wait(randomfloatrange( 0.5, 1.5 ));
    lbexplode();
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

removelittlebird()
{
    level.lbstrike = 0;

    if ( isdefined( self.mgturretleft ) )
    {
        if ( isdefined( self.mgturretleft.killcament ) )
            self.mgturretleft.killcament delete();

        self.mgturretleft delete();
    }

    if ( isdefined( self.mgturretright ) )
    {
        if ( isdefined( self.mgturretright.killcament ) )
            self.mgturretright.killcament delete();

        self.mgturretright delete();
    }

    if ( isdefined( self.marker ) )
        self.marker delete();

    maps\mp\_utility::decrementfauxvehiclecount();
    self delete();
}

lbsupport_watchsamproximity( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( isdefined( var_3[var_4] ) && !var_2.hasdodged )
        {
            var_2.hasdodged = 1;
            var_5 = spawn( "script_origin", var_2.origin );
            var_5.angles = var_2.angles;
            var_5 movegravity( anglestoright( var_3[var_4].angles ) * -1000, 0.05 );
            var_5 thread maps\mp\killstreaks\_helicopter::deleteaftertime( 5.0 );

            for ( var_6 = 0; var_6 < var_3.size; var_6++ )
            {
                if ( isdefined( var_3[var_6] ) )
                    var_3[var_6] missile_settargetent( var_5 );
            }

            var_7 = var_2.origin + anglestoright( var_3[var_4].angles ) * 200;
            var_2 vehicle_setspeed( var_2.speed, 100, 40 );
            var_2 setvehgoalpos( var_7, 1 );
            wait 2.0;
            var_2 vehicle_setspeed( var_2.followspeed, 20, 20 );
            break;
        }
    }
}

lbsupport_watchstingerproximity( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    if ( isdefined( self ) && !var_2.hasdodged )
    {
        var_2.hasdodged = 1;
        var_3 = spawn( "script_origin", var_2.origin );
        var_3.angles = var_2.angles;
        var_3 movegravity( anglestoright( self.angles ) * -1000, 0.05 );
        var_3 thread maps\mp\killstreaks\_helicopter::deleteaftertime( 5.0 );
        self missile_settargetent( var_3 );
        var_4 = var_2.origin + anglestoright( self.angles ) * 200;
        var_2 vehicle_setspeed( var_2.speed, 100, 40 );
        var_2 setvehgoalpos( var_4, 1 );
        wait 2.0;
        var_2 vehicle_setspeed( var_2.followspeed, 20, 20 );
    }
}

lbsupport_getcloseststartnode( var_0 )
{
    var_1 = undefined;
    var_2 = 999999;

    foreach ( var_4 in level.air_start_nodes )
    {
        var_5 = distance( var_4.origin, var_0 );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

lbsupport_getclosestnode( var_0 )
{
    var_1 = undefined;
    var_2 = 999999;

    foreach ( var_4 in level.air_node_mesh )
    {
        var_5 = distance( var_4.origin, var_0 );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

lbsupport_getclosestlinkednode( var_0 )
{
    var_1 = undefined;
    var_2 = distance2d( self.currentnode.origin, var_0 );
    var_3 = var_2;

    foreach ( var_5 in self.currentnode.neighbors )
    {
        var_6 = distance2d( var_5.origin, var_0 );

        if ( var_6 < var_2 && var_6 < var_3 )
        {
            var_1 = var_5;
            var_3 = var_6;
        }
    }

    return var_1;
}

lbsupport_arraycontains( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

lbsupport_getlinkedstructs()
{
    var_0 = [];

    if ( isdefined( self.script_linkto ) )
    {
        var_1 = common_scripts\utility::get_links();

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = common_scripts\utility::getstruct( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

lbsupport_setairstartnodes()
{
    level.air_start_nodes = common_scripts\utility::getstructarray( "chopper_boss_path_start", "targetname" );

    foreach ( var_1 in level.air_start_nodes )
        var_1.neighbors = var_1 lbsupport_getlinkedstructs();
}

lbsupport_setairnodemesh()
{
    level.air_node_mesh = common_scripts\utility::getstructarray( "so_chopper_boss_path_struct", "script_noteworthy" );
    lbsupport_tu0_raise_positions();

    foreach ( var_1 in level.air_node_mesh )
    {
        var_1.neighbors = var_1 lbsupport_getlinkedstructs();

        foreach ( var_3 in level.air_node_mesh )
        {
            if ( var_1 == var_3 )
                continue;

            if ( !lbsupport_arraycontains( var_1.neighbors, var_3 ) && lbsupport_arraycontains( var_3 lbsupport_getlinkedstructs(), var_1 ) )
                var_1.neighbors[var_1.neighbors.size] = var_3;
        }
    }
}

lbsupport_tu0_raise_positions()
{
    switch ( getdvar( "mapname" ) )
    {
        case "mp_lambeth":
            var_0 = [];
            var_0[var_0.size] = ( -291.1, 1587.3, 184.0 );
            var_0[var_0.size] = ( -947.1, 1859.3, 376.0 );
            var_0[var_0.size] = ( -1155.1, 1187.3, 344.0 );
            var_0[var_0.size] = ( -467.1, -316.7, 184.0 );
            var_0[var_0.size] = ( 956.9, 2931.3, 216.0 );
            var_0[var_0.size] = ( 2748.9, 963.3, 328.0 );
            var_0[var_0.size] = ( 2732.9, 83.3, 376.0 );
            var_1 = [];
            var_1[var_1.size] = ( -1027.1, -1180.7, 312.0 );

            for ( var_2 = 0; var_2 < level.air_node_mesh.size; var_2++ )
            {
                foreach ( var_4 in var_0 )
                {
                    if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_4[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_4[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_4[2] ) )
                    {
                        level.air_node_mesh[var_2].origin += ( 0.0, 0.0, 192.0 );
                        break;
                    }
                }

                foreach ( var_4 in var_1 )
                {
                    if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_4[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_4[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_4[2] ) )
                    {
                        level.air_node_mesh[var_2].origin += ( 0.0, 0.0, 300.0 );
                        break;
                    }
                }
            }

            break;
        case "mp_village":
            var_8 = [];
            var_8[var_8.size] = ( 684.9, 2227.3, 680.0 );
            var_8[var_8.size] = ( 60.9, 1363.3, 728.0 );
            var_8[var_8.size] = ( 972.9, 163.3, 744.0 );
            var_8[var_8.size] = ( 1756.9, -444.7, 744.0 );
            var_8[var_8.size] = ( 412.9, 67.3, 680.0 );
            var_9 = [];
            var_9[var_9.size] = ( 352.0, 800.0, 736.0 );
            var_9[var_9.size] = ( 1600.0, 352.0, 752.0 );
            var_10 = [];
            var_10[var_10.size] = ( 1100.9, 1155.3, 632.0 );
            var_11 = ( -1155.1, -1260.7, 1096.0 );

            for ( var_2 = 0; var_2 < level.air_node_mesh.size; var_2++ )
            {
                foreach ( var_4 in var_8 )
                {
                    if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_4[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_4[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_4[2] ) )
                    {
                        level.air_node_mesh[var_2].origin += ( 0.0, 0.0, 200.0 );
                        break;
                    }
                }

                foreach ( var_4 in var_9 )
                {
                    if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_4[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_4[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_4[2] ) )
                    {
                        level.air_node_mesh[var_2].origin += ( 0.0, 0.0, 250.0 );
                        break;
                    }
                }

                foreach ( var_4 in var_10 )
                {
                    if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_4[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_4[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_4[2] ) )
                    {
                        level.air_node_mesh[var_2].origin += ( 0.0, 0.0, 400.0 );
                        break;
                    }
                }

                if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_11[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_11[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_11[2] ) )
                {
                    level.air_node_mesh[var_2].origin = ( -1003.0, -1035.0, 986.0 );
                    continue;
                }
            }

            break;
        case "mp_interchange":
            var_18 = [];
            var_18[var_18.size] = ( -755.1, -1788.7, 360.0 );

            for ( var_2 = 0; var_2 < level.air_node_mesh.size; var_2++ )
            {
                foreach ( var_4 in var_18 )
                {
                    if ( int( level.air_node_mesh[var_2].origin[0] ) == int( var_4[0] ) && int( level.air_node_mesh[var_2].origin[1] ) == int( var_4[1] ) && int( level.air_node_mesh[var_2].origin[2] ) == int( var_4[2] ) )
                    {
                        level.air_node_mesh[var_2].origin += ( 0.0, 0.0, 100.0 );
                        break;
                    }
                }
            }

            break;
        default:
            break;
    }
}

lbsupport_tu0_new_incoming_position( var_0 )
{
    switch ( getdvar( "mapname" ) )
    {
        case "mp_interchange":
            var_1 = [];
            var_2 = [];
            var_1[var_2.size][0] = ( 1340.9, 1299.3, 360.0 );
            var_1[var_2.size][1] = ( 2220.9, 115.3, 408.0 );
            var_2[var_2.size] = ( 1884.9, 787.3, 312.0 );
            var_1[var_2.size][0] = ( -755.1, -588.7, 728.0 );
            var_1[var_2.size][1] = ( -2563.1, -1580.7, 1192.0 );
            var_2[var_2.size] = ( -1363.1, -1164.7, 472.0 );
            var_1[var_2.size][0] = ( -35.1, -2492.7, 488.0 );
            var_1[var_2.size][1] = ( 396.9, -1884.7, 696.0 );
            var_2[var_2.size] = ( -755.1, -1788.7, 460.0 );
            var_3 = randomintrange( 0, 100 ) > 50;

            for ( var_4 = 0; var_4 < var_2.size; var_4++ )
            {
                if ( int( var_0.origin[0] ) == int( var_2[var_4][0] ) && int( var_0.origin[1] ) == int( var_2[var_4][1] ) && int( var_0.origin[2] ) == int( var_2[var_4][2] ) )
                {
                    for ( var_5 = 0; var_5 < level.air_node_mesh.size; var_5++ )
                    {
                        if ( int( level.air_node_mesh[var_5].origin[0] ) == int( var_1[var_4][var_3][0] ) && int( level.air_node_mesh[var_5].origin[1] ) == int( var_1[var_4][var_3][1] ) && int( level.air_node_mesh[var_5].origin[2] ) == int( var_1[var_4][var_3][2] ) )
                            return level.air_node_mesh[var_5];
                    }
                }
            }

            break;
        default:
            break;
    }

    return var_0;
}

lbsupport_attacktargets()
{
    self.vehicle endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "turretstatechange" );

        if ( self isfiringturret() && !self.vehicle.empgrenaded )
        {
            thread lbsupport_burstfirestart();
            continue;
        }

        thread lbsupport_burstfirestop();
    }
}

lbsupport_burstfirestart()
{
    self.vehicle endon( "death" );
    self.vehicle endon( "leaving" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    var_0 = 0.1;
    var_1 = 40;
    var_2 = 80;
    var_3 = 1.0;
    var_4 = 2.0;

    for (;;)
    {
        var_5 = randomintrange( var_1, var_2 + 1 );

        for ( var_6 = 0; var_6 < var_5; var_6++ )
        {
            var_7 = self getturrettarget( 0 );

            if ( isdefined( var_7 ) && ( !isdefined( var_7.spawntime ) || ( gettime() - var_7.spawntime ) / 1000 > 5 ) && ( isdefined( var_7.team ) && var_7.team != "spectator" ) && maps\mp\_utility::isreallyalive( var_7 ) )
            {
                self.vehicle setlookatent( var_7 );
                self shootturret();
            }

            wait(var_0);
        }

        wait(randomfloatrange( var_3, var_4 ));
    }
}

lbsupport_burstfirestop()
{
    self notify( "stop_shooting" );

    if ( isdefined( self.vehicle.owner ) )
        self.vehicle setlookatent( self.vehicle.owner );
}
