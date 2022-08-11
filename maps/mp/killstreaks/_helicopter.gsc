// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    var_0 = getentarray( "heli_start", "targetname" );
    var_1 = getentarray( "heli_loop_start", "targetname" );

    if ( !var_0.size && !var_1.size )
        return;

    level.heli_types = [];
    precacheitem( "heli_remote_mp" );
    precachehelicopter( "vehicle_cobra_helicopter_fly_low", "cobra" );
    precachehelicopter( "vehicle_mi24p_hind_mp", "hind" );
    precachevehicle( "cobra_mp" );
    precacheitem( "cobra_20mm_mp" );
    precachehelicopter( "vehicle_pavelow", "pavelow" );
    precachehelicopter( "vehicle_pavelow_opfor", "pavelow" );
    precachevehicle( "pavelow_mp" );
    precacheturret( "pavelow_minigun_mp" );
    precachestring( &"SPLASHES_DESTROYED_PAVELOW" );
    precachestring( &"SPLASHES_DESTROYED_MINIGUNNER" );
    precachestring( &"SPLASHES_DESTROYED_HELICOPTER" );
    level.chopper = undefined;
    level.heli_start_nodes = getentarray( "heli_start", "targetname" );
    level.heli_loop_nodes = getentarray( "heli_loop_start", "targetname" );
    level.heli_leave_nodes = getentarray( "heli_leave", "targetname" );
    level.heli_crash_nodes = getentarray( "heli_crash_start", "targetname" );
    level.heli_missile_rof = 5;
    level.heli_maxhealth = 2000;
    level.heli_debug = 0;
    level.heli_targeting_delay = 0.5;
    level.heli_turretreloadtime = 1.5;
    level.heli_turretclipsize = 40;
    level.heli_visual_range = 3700;
    level.heli_target_spawnprotection = 5;
    level.heli_target_recognition = 0.5;
    level.heli_missile_friendlycare = 256;
    level.heli_missile_target_cone = 0.3;
    level.heli_armor_bulletdamage = 0.3;
    level.heli_attract_strength  = 1000;
    level.heli_attract_range = 4096;
    level.heli_angle_offset = 90;
    level.heli_forced_wait = 0;
    level.chopper_fx["explode"]["death"] = [];
    level.chopper_fx["explode"]["large"] = loadfx( "explosions/helicopter_explosion_secondary_small" );
    level.chopper_fx["explode"]["medium"] = loadfx( "explosions/aerial_explosion" );
    level.chopper_fx["smoke"]["trail"] = loadfx( "smoke/smoke_trail_white_heli" );
    level.chopper_fx["fire"]["trail"]["medium"] = loadfx( "fire/fire_smoke_trail_L_emitter" );
    level.chopper_fx["fire"]["trail"]["large"] = loadfx( "fire/fire_smoke_trail_L" );
    level.chopper_fx["damage"]["light_smoke"] = loadfx( "smoke/smoke_trail_white_heli_emitter" );
    level.chopper_fx["damage"]["heavy_smoke"] = loadfx( "smoke/smoke_trail_black_heli_emitter" );
    level.chopper_fx["damage"]["on_fire"] = loadfx( "fire/fire_smoke_trail_L_emitter" );
    level.chopper_fx["light"]["left"] = loadfx( "misc/aircraft_light_wingtip_green" );
    level.chopper_fx["light"]["right"] = loadfx( "misc/aircraft_light_wingtip_red" );
    level.chopper_fx["light"]["belly"] = loadfx( "misc/aircraft_light_red_blink" );
    level.chopper_fx["light"]["tail"] = loadfx( "misc/aircraft_light_white_blink" );
    level.fx_heli_dust = loadfx( "treadfx/heli_dust_default" );
    level.fx_heli_water = loadfx( "treadfx/heli_water" );
    makehelitype( "cobra", "explosions/helicopter_explosion_cobra_low", ::defaultlightfx );
    addairexplosion( "cobra", "explosions/aerial_explosion_cobra_low_mp" );
    makehelitype( "pavelow", "explosions/helicopter_explosion_pavelow", ::pavelowlightfx );
    addairexplosion( "pavelow", "explosions/aerial_explosion_pavelow_mp" );
    makehelitype( "mi28", "explosions/helicopter_explosion_mi28_flying", ::defaultlightfx );
    addairexplosion( "mi28", "explosions/aerial_explosion_mi28_flying_mp" );
    makehelitype( "hind", "explosions/helicopter_explosion_hind_chernobyl", ::defaultlightfx );
    addairexplosion( "hind", "explosions/aerial_explosion_hind_chernobyl_mp" );
    makehelitype( "apache", "explosions/helicopter_explosion_apache", ::defaultlightfx );
    addairexplosion( "apache", "explosions/aerial_explosion_apache_mp" );
    makehelitype( "littlebird", "explosions/aerial_explosion_littlebird_mp", ::defaultlightfx );
    addairexplosion( "littlebird", "explosions/aerial_explosion_littlebird_mp" );
    level.killstreakfuncs["helicopter"] = ::usehelicopter;
    level.killstreakfuncs["helicopter_blackbox"] = ::usehelicopterblackbox;
    level.killstreakfuncs["helicopter_flares"] = ::usehelicopterflares;
    level.killstreakfuncs["helicopter_minigun"] = ::usehelicopterminigun;
    level.killstreakfuncs["helicopter_mk19"] = ::usehelicoptermk19;
    level.helidialog["tracking"][0] = "ac130_fco_moreenemy";
    level.helidialog["tracking"][1] = "ac130_fco_getthatguy";
    level.helidialog["tracking"][2] = "ac130_fco_guyrunnin";
    level.helidialog["tracking"][3] = "ac130_fco_gotarunner";
    level.helidialog["tracking"][4] = "ac130_fco_personnelthere";
    level.helidialog["tracking"][5] = "ac130_fco_rightthere";
    level.helidialog["tracking"][6] = "ac130_fco_tracking";
    level.helidialog["locked"][0] = "ac130_fco_lightemup";
    level.helidialog["locked"][1] = "ac130_fco_takehimout";
    level.helidialog["locked"][2] = "ac130_fco_nailthoseguys";
    level.lasthelidialogtime = 0;
    maps\mp\_utility::queuecreate( "helicopter" );
}

makehelitype( var_0, var_1, var_2 )
{
    level.chopper_fx["explode"]["death"][var_0] = loadfx( var_1 );
    level.lightfxfunc[var_0] = var_2;
}

addairexplosion( var_0, var_1 )
{
    level.chopper_fx["explode"]["air_death"][var_0] = loadfx( var_1 );
}

pavelowlightfx()
{
    playfxontag( level.chopper_fx["light"]["left"], self, "tag_light_L_wing1" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["right"], self, "tag_light_R_wing1" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail2" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["belly"], self, "tag_light_cockpit01" );
}

defaultlightfx()
{
    playfxontag( level.chopper_fx["light"]["left"], self, "tag_light_L_wing" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["right"], self, "tag_light_R_wing" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail" );
}

usehelicopter( var_0 )
{
    return tryusehelicopter( var_0, "helicopter" );
}

usehelicopterblackbox( var_0 )
{
    return tryusehelicopter( var_0, "blackbox" );
}

usehelicopterflares( var_0 )
{
    return tryusehelicopter( var_0, "flares" );
}

usehelicopterminigun( var_0 )
{
    if ( isdefined( self.laststand ) && !maps\mp\_utility::_hasperk( "specialty_finalstand" ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }

    return tryusehelicopter( var_0, "minigun" );
}

usehelicoptermk19( var_0 )
{
    if ( isdefined( self.laststand ) && !maps\mp\_utility::_hasperk( "specialty_finalstand" ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }

    return tryusehelicopter( var_0, "mk19" );
}

tryusehelicopter( var_0, var_1 )
{
    if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
        return 0;
    }

    if ( maps\mp\_utility::isairdenied() )
        return 0;

    if ( maps\mp\_utility::isemped() )
        return 0;

    var_2 = 1;

    if ( ( !isdefined( var_1 ) || var_1 == "flares" ) && isdefined( level.chopper ) )
    {
        self iprintlnbold( &"MP_HELI_IN_QUEUE" );

        if ( isdefined( var_1 ) )
            var_3 = "helicopter_" + var_1;
        else
            var_3 = "helicopter";

        thread maps\mp\killstreaks\_killstreaks::updatekillstreaks();
        var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_4 hide();
        var_4 thread deleteonentnotify( self, "disconnect" );
        var_4.player = self;
        var_4.lifeid = var_0;
        var_4.helitype = var_1;
        var_4.streakname = var_3;
        maps\mp\_utility::queueadd( "helicopter", var_4 );
        var_5 = undefined;

        if ( !self hasweapon( common_scripts\utility::getlastweapon() ) )
            var_5 = maps\mp\killstreaks\_killstreaks::getfirstprimaryweapon();
        else
            var_5 = common_scripts\utility::getlastweapon();

        var_6 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( "helicopter_flares" );
        thread maps\mp\killstreaks\_killstreaks::waittakekillstreakweapon( var_6, var_5 );
        return 0;
    }
    else if ( isdefined( level.chopper ) )
    {
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_2 >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    var_2 = 1;

    if ( isdefined( var_1 ) && var_1 == "minigun" )
    {
        maps\mp\_utility::setusingremote( "helicopter_" + var_1 );
        var_7 = maps\mp\killstreaks\_killstreaks::initridekillstreak();

        if ( var_7 != "success" )
        {
            if ( var_7 != "disconnect" )
                maps\mp\_utility::clearusingremote();

            return 0;
        }

        if ( isdefined( level.chopper ) )
        {
            maps\mp\_utility::clearusingremote();
            self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
            return 0;
        }
        else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_2 >= maps\mp\_utility::maxvehiclesallowed() )
        {
            maps\mp\_utility::clearusingremote();
            self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
            return 0;
        }
    }

    starthelicopter( var_0, var_1 );
    return 1;
}

deleteonentnotify( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( var_1 );
    self delete();
}

starthelicopter( var_0, var_1 )
{
    maps\mp\_utility::incrementfauxvehiclecount();

    if ( !isdefined( var_1 ) )
        var_1 = "";

    switch ( var_1 )
    {
        case "flares":
            thread pavelowmadeselectionvo();
            var_2 = "helicopter_flares";
            break;
        case "minigun":
            var_2 = "helicopter_minigun";
            break;
        default:
            var_2 = "helicopter";
            break;
    }

    var_3 = self.pers["team"];
    var_4 = level.heli_start_nodes[randomint( level.heli_start_nodes.size )];
    maps\mp\_matchdata::logkillstreakevent( var_2, self.origin );
    thread heli_think( var_0, self, var_4, self.pers["team"], var_1 );
}

precachehelicopter( var_0, var_1 )
{
    var_2 = loadfx( "explosions/tanker_explosion" );
    precachemodel( var_0 );
    level.heli_types[var_0] = var_1;
    level.cobra_missile_models = [];
    level.cobra_missile_models["cobra_Hellfire"] = "projectile_hellfire_missile";
    precachemodel( level.cobra_missile_models["cobra_Hellfire"] );
    level.heli_sound["allies"]["hit"] = "cobra_helicopter_hit";
    level.heli_sound["allies"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level.heli_sound["allies"]["damaged"] = "cobra_helicopter_damaged";
    level.heli_sound["allies"]["spinloop"] = "cobra_helicopter_dying_loop";
    level.heli_sound["allies"]["spinstart"] = "cobra_helicopter_dying_layer";
    level.heli_sound["allies"]["crash"] = "cobra_helicopter_crash";
    level.heli_sound["allies"]["missilefire"] = "weap_cobra_missile_fire";
    level.heli_sound["axis"]["hit"] = "cobra_helicopter_hit";
    level.heli_sound["axis"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level.heli_sound["axis"]["damaged"] = "cobra_helicopter_damaged";
    level.heli_sound["axis"]["spinloop"] = "cobra_helicopter_dying_loop";
    level.heli_sound["axis"]["spinstart"] = "cobra_helicopter_dying_layer";
    level.heli_sound["axis"]["crash"] = "cobra_helicopter_crash";
    level.heli_sound["axis"]["missilefire"] = "weap_cobra_missile_fire";
}

spawn_helicopter( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnhelicopter( var_0, var_1, var_2, var_3, var_4 );

    if ( !isdefined( var_5 ) )
        return undefined;

    var_5.heli_type = level.heli_types[var_4];
    var_5 thread [[ level.lightfxfunc[var_5.heli_type] ]]();
    var_5 addtohelilist();
    var_5.zoffset = ( 0, 0, var_5 gettagorigin( "tag_origin" )[2] - var_5 gettagorigin( "tag_ground" )[2] );
    var_5.attractor = missile_createattractorent( var_5, level.heli_attract_strength , level.heli_attract_range );
    return var_5;
}

heliride( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "helicopter_done" );
    thread maps\mp\_utility::teamplayercardsplash( "used_helicopter_minigun", self );
    self visionsetthermalforplayer( "black_bw", 0 );
    maps\mp\_utility::_giveweapon( "heli_remote_mp" );
    self switchtoweapon( "heli_remote_mp" );
    self visionsetthermalforplayer( game["thermal_vision"], 6 );
    self thermalvisionon();
    self thermalvisionfofoverlayon();
    thread thermalvision( var_1 );

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 0 );

    var_1 vehicleturretcontrolon( self );
    self playerlinkweaponviewtodelta( var_1, "tag_player", 1.0, 180, 180, 0, 180, 1 );
    var_1.gunner = self;
    self.heliridelifeid = var_0;
    thread endrideonhelicopterdone( var_1 );
    thread weaponlockthink( var_1 );

    for (;;)
    {
        var_1 waittill( "turret_fire" );
        var_1 fireweapon();
        earthquake( 0.2, 1, var_1.origin, 1000 );
    }
}

thermalvision( var_0 )
{
    var_0 endon( "helicopter_done" );

    if ( maps\mp\_utility::getintproperty( "ac130_thermal_enabled", 1 ) == 0 )
        return;

    var_1 = 0;
    self visionsetthermalforplayer( level.ac130.enhanced_vision, 1 );
    self.lastvisionsetthermal = level.ac130.enhanced_vision;
    self thermalvisionoff();
    self notifyonplayercommand( "switch thermal", "+usereload" );
    self notifyonplayercommand( "switch thermal", "+activate" );

    for (;;)
    {
        self waittill( "switch thermal" );

        if ( !var_1 )
        {
            self visionsetthermalforplayer( level.ac130.thermal_vision, 0.62 );
            self.lastvisionsetthermal = level.ac130.thermal_vision;
            self thermalvisionon();
        }
        else
        {
            self visionsetthermalforplayer( level.ac130.enhanced_vision, 0.51 );
            self.lastvisionsetthermal = level.ac130.enhanced_vision;
            self thermalvisionoff();
        }

        var_1 = !var_1;
    }
}

weaponlockthink( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "helicopter_done" );

    if ( !isdefined( level.helitargetorigin ) )
    {
        level.helitargetorigin = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        level.helitargetorigin hide();
    }

    for (;;)
    {
        var_1 = bullettrace( self geteye(), self geteye() + anglestoforward( self getplayerangles() ) * 100000, 1, self );
        level.helitargetorigin.origin = var_1["position"];
        var_2 = [];
        var_3 = [];

        foreach ( var_5 in level.players )
        {
            if ( !isalive( var_5 ) )
                continue;

            if ( level.teambased && var_5.team == self.team )
                continue;

            if ( var_5 == self )
                continue;

            if ( var_5 maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
                continue;

            if ( isdefined( var_5.spawntime ) && ( gettime() - var_5.spawntime ) / 1000 <= 5 )
                continue;

            var_5.remotehelilos = 1;

            if ( !bullettracepassed( self geteye(), var_5.origin + ( 0.0, 0.0, 32.0 ), 0, var_0 ) )
            {
                var_3[var_3.size] = var_5;
                continue;
            }

            var_2[var_2.size] = var_5;
        }

        var_7 = [];
        var_7 = var_2;

        foreach ( var_9 in var_3 )
            var_2[var_2.size] = var_9;

        if ( var_7.size != 0 )
        {
            var_11 = sortbydistance( var_7, var_1["position"] );

            if ( distance( var_11[0].origin, var_1["position"] ) < 384 && var_11[0] damageconetrace( var_1["position"] ) )
            {
                self weaponlockfinalize( var_11[0] );
                helidialog( "locked" );
            }
            else
            {
                self weaponlockstart( var_11[0] );
                helidialog( "tracking" );
            }
        }
        else
            self weaponlockfree();

        wait 0.05;
    }
}

helidialog( var_0 )
{
    if ( gettime() - level.lasthelidialogtime < 6000 )
        return;

    level.lasthelidialogtime = gettime();
    var_1 = randomint( level.helidialog[var_0].size );
    var_2 = level.helidialog[var_0][var_1];
    var_3 = maps\mp\gametypes\_teams::getteamvoiceprefix( self.team ) + var_2;
    self playlocalsound( var_3 );
}

endride( var_0 )
{
    self remotecamerasoundscapeoff();
    self thermalvisionoff();
    self thermalvisionfofoverlayoff();
    self unlink();
    self switchtoweapon( common_scripts\utility::getlastweapon() );
    maps\mp\_utility::clearusingremote();

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 1 );

    self visionsetthermalforplayer( game["thermal_vision"], 0 );

    if ( isdefined( var_0 ) )
    {
        var_1 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( "helicopter_minigun" );
        self takeweapon( var_1 );
        var_0 vehicleturretcontroloff( self );
    }

    self notify( "heliPlayer_removed" );
}

endrideonhelicopterdone( var_0 )
{
    self endon( "disconnect" );
    var_0 waittill( "helicopter_done" );
    endride( var_0 );
}

getposnearenemies()
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

        if ( !bullettracepassed( var_2.origin, var_2.origin + ( 0.0, 0.0, 2048.0 ), 0, var_2 ) )
            continue;

        var_2.remotehelidist = 0;
        var_0[var_0.size] = var_2;
    }

    if ( !var_0.size )
        return undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        for ( var_5 = var_4 + 1; var_5 < var_0.size; var_5++ )
        {
            var_6 = distancesquared( var_0[var_4].origin, var_0[var_5].origin );
            var_0[var_4].remotehelidist += var_6;
            var_0[var_5].remotehelidist += var_6;
        }
    }

    var_7 = var_0[0];

    foreach ( var_2 in var_0 )
    {
        if ( var_2.remotehelidist < var_7.remotehelidist )
            var_7 = var_2;
    }

    return var_7.origin;
}

updateareanodes( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_3.validplayers = [];
        var_3.nodescore = 0;
    }

    foreach ( var_6 in level.players )
    {
        if ( !isalive( var_6 ) )
            continue;

        if ( var_6.team == self.team )
            continue;

        foreach ( var_3 in var_0 )
        {
            if ( distancesquared( var_6.origin, var_3.origin ) > 1048576 )
                continue;

            var_3.validplayers[var_3.validplayers.size] = var_6;
        }
    }

    var_10 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        var_12 = getent( var_3.target, "targetname" );

        foreach ( var_6 in var_3.validplayers )
        {
            var_3.nodescore += 1;

            if ( bullettracepassed( var_6.origin + ( 0.0, 0.0, 32.0 ), var_12.origin, 0, var_6 ) )
                var_3.nodescore += 3;
        }

        if ( var_3.nodescore > var_10.nodescore )
            var_10 = var_3;
    }

    return getent( var_10.target, "targetname" );
}

heli_think( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_2.origin;
    var_6 = var_2.angles;

    switch ( var_4 )
    {
        case "minigun":
            var_7 = "cobra_minigun_mp";

            if ( var_1.team == "allies" )
                var_8 = "vehicle_apache_mp";
            else
                var_8 = "vehicle_mi-28_mp";

            break;
        case "flares":
            var_7 = "pavelow_mp";

            if ( var_1.team == "allies" )
                var_8 = "vehicle_pavelow";
            else
                var_8 = "vehicle_pavelow_opfor";

            break;
        default:
            var_7 = "cobra_mp";

            if ( var_1.team == "allies" )
                var_8 = "vehicle_cobra_helicopter_fly_low";
            else
                var_8 = "vehicle_mi24p_hind_mp";

            break;
    }

    var_9 = spawn_helicopter( var_1, var_5, var_6, var_7, var_8 );

    if ( !isdefined( var_9 ) )
        return;

    level.chopper = var_9;
    var_9.helitype = var_4;
    var_9.lifeid = var_0;
    var_9.team = var_3;
    var_9.pers["team"] = var_3;
    var_9.owner = var_1;

    if ( var_4 == "flares" )
        var_9.maxhealth = level.heli_maxhealth * 2;
    else
        var_9.maxhealth = level.heli_maxhealth;

    var_9.targeting_delay = level.heli_targeting_delay;
    var_9.primarytarget = undefined;
    var_9.secondarytarget = undefined;
    var_9.attacker = undefined;
    var_9.currentstate = "ok";
    var_9.empgrenaded = 0;

    if ( var_4 == "flares" || var_4 == "minigun" )
        var_9 thread heli_flares_monitor();

    var_9 thread heli_leave_on_disconnect( var_1 );
    var_9 thread heli_leave_on_changeteams( var_1 );
    var_9 thread heli_leave_on_gameended( var_1 );
    var_9 thread heli_damage_monitor();
    var_9 thread heli_health();
    var_9 thread heli_existance();
    var_9 endon( "helicopter_done" );
    var_9 endon( "crashing" );
    var_9 endon( "leaving" );
    var_9 endon( "death" );

    if ( var_4 == "minigun" )
    {
        var_1 thread heliride( var_0, var_9 );
        var_9 thread heli_leave_on_spawned( var_1 );
    }

    var_10 = getentarray( "heli_attack_area", "targetname" );
    var_11 = level.heli_loop_nodes[randomint( level.heli_loop_nodes.size )];

    switch ( var_4 )
    {
        case "minigun":
            var_9 thread heli_targeting();
            var_9 heli_fly_simple_path( var_2 );
            var_9 thread heli_leave_on_timeout( 40.0 );

            if ( var_10.size )
                var_9 thread heli_fly_well( var_10 );
            else
                var_9 thread heli_fly_loop_path( var_11 );

            break;
        case "flares":
            var_9 thread makegunship();
            thread maps\mp\_utility::teamplayercardsplash( "used_helicopter_flares", var_1 );
            var_9 heli_fly_simple_path( var_2 );
            var_9 thread heli_leave_on_timeout( 60.0 );
            var_9 thread heli_fly_loop_path( var_11 );
            break;
        default:
            var_9 thread attack_targets();
            var_9 thread heli_targeting();
            var_9 heli_fly_simple_path( var_2 );
            var_9 thread heli_leave_on_timeout( 60.0 );
            var_9 thread heli_fly_loop_path( var_11 );
            break;
    }
}

makegunship()
{
    self endon( "death" );
    self endon( "helicopter_done" );
    wait 0.5;
    var_0 = spawnturret( "misc_turret", self.origin, "pavelow_minigun_mp" );
    var_0.lifeid = self.lifeid;
    var_0 linkto( self, "tag_gunner_left", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "weapon_minigun" );
    var_0.owner = self.owner;
    var_0.team = self.team;
    var_0 maketurretinoperable();
    var_0.pers["team"] = self.team;
    var_0.killcament = self;
    self.mgturretleft = var_0;
    self.mgturretleft setdefaultdroppitch( 0 );
    var_0 = spawnturret( "misc_turret", self.origin, "pavelow_minigun_mp" );
    var_0.lifeid = self.lifeid;
    var_0 linkto( self, "tag_gunner_right", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "weapon_minigun" );
    var_0.owner = self.owner;
    var_0.team = self.team;
    var_0 maketurretinoperable();
    var_0.pers["team"] = self.team;
    var_0.killcament = self;
    self.mgturretright = var_0;
    self.mgturretright setdefaultdroppitch( 0 );

    if ( level.teambased )
    {
        self.mgturretleft setturretteam( self.team );
        self.mgturretright setturretteam( self.team );
    }

    self.mgturretleft setmode( "auto_nonai" );
    self.mgturretright setmode( "auto_nonai" );
    self.mgturretleft setsentryowner( self.owner );
    self.mgturretright setsentryowner( self.owner );
    self.mgturretleft setturretminimapvisible( 0 );
    self.mgturretright setturretminimapvisible( 0 );
    self.mgturretleft.chopper = self;
    self.mgturretright.chopper = self;
    self.mgturretleft thread sentry_attacktargets();
    self.mgturretright thread sentry_attacktargets();
    thread deleteturretswhendone();
}

deleteturretswhendone()
{
    self waittill( "helicopter_done" );
    self.mgturretright delete();
    self.mgturretleft delete();
}

sentry_attacktargets()
{
    self endon( "death" );
    self endon( "helicopter_done" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "turretstatechange" );

        if ( self isfiringturret() && !self.chopper.empgrenaded )
        {
            thread sentry_burstfirestart();
            continue;
        }

        thread sentry_burstfirestop();
    }
}

sentry_burstfirestart()
{
    self endon( "death" );
    self endon( "stop_shooting" );
    self endon( "leaving" );
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

            if ( isdefined( var_7 ) && ( !isdefined( var_7.spawntime ) || ( gettime() - var_7.spawntime ) / 1000 > 5 ) )
                self shootturret();

            wait(var_0);
        }

        wait(randomfloatrange( var_3, var_4 ));
    }
}

sentry_burstfirestop()
{
    self notify( "stop_shooting" );
}

heli_existance()
{
    var_0 = self getentitynumber();
    common_scripts\utility::waittill_any( "death", "crashing", "leaving" );
    removefromhelilist( var_0 );
    self notify( "helicopter_done" );
    self notify( "helicopter_removed" );
    var_1 = undefined;
    var_2 = maps\mp\_utility::queueremovefirst( "helicopter" );

    if ( !isdefined( var_2 ) )
        level.chopper = undefined;
    else
    {
        var_1 = var_2.player;
        var_3 = var_2.lifeid;
        var_4 = var_2.streakname;
        var_5 = var_2.helitype;
        var_2 delete();

        if ( isdefined( var_1 ) && ( var_1.sessionstate == "playing" || var_1.sessionstate == "dead" ) )
        {
            var_1 maps\mp\killstreaks\_killstreaks::usedkillstreak( var_4, 1 );
            var_1 starthelicopter( var_3, var_5 );
            return;
        }

        level.chopper = undefined;
    }
}

heli_targeting()
{
    self endon( "death" );
    self endon( "helicopter_done" );

    for (;;)
    {
        var_0 = [];
        self.primarytarget = undefined;
        self.secondarytarget = undefined;
        var_1 = level.players;

        foreach ( var_3 in level.players )
        {
            if ( !cantarget_turret( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        if ( var_0.size )
        {
            for ( var_5 = getbestprimarytarget( var_0 ); !isdefined( var_5 ); var_5 = getbestprimarytarget( var_0 ) )
                wait 0.05;

            self.primarytarget = var_5;
            self notify( "primary acquired" );
        }

        if ( isdefined( level.harriers ) )
        {
            foreach ( var_7 in level.harriers )
            {
                if ( !isdefined( var_7 ) )
                    continue;

                if ( level.teambased && var_7.team != self.team || !level.teambased && var_7.owner != self.owner )
                {
                    self notify( "secondary acquired" );
                    self.secondarytarget = var_7;
                }
            }
        }

        wait 0.5;
    }
}

cantarget_turret( var_0 )
{
    var_1 = 1;

    if ( !isalive( var_0 ) || var_0.sessionstate != "playing" )
        return 0;

    if ( self.helitype == "remote_mortar" )
    {
        if ( var_0 sightconetrace( self.origin, self ) < 1 )
            return 0;
    }
    else if ( self.helitype != "flares" )
    {
        if ( !self vehicle_canturrettargetpoint( var_0.origin + ( 0.0, 0.0, 40.0 ), 1, self ) )
            return 0;
    }

    if ( distance( var_0.origin, self.origin ) > level.heli_visual_range )
        return 0;

    if ( level.teambased && var_0.pers["team"] == self.team )
        return 0;

    if ( var_0 == self.owner )
        return 0;

    if ( isdefined( var_0.spawntime ) && ( gettime() - var_0.spawntime ) / 1000 <= 5 )
        return 0;

    if ( var_0 maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
        return 0;

    var_2 = self.origin + ( 0.0, 0.0, -160.0 );
    var_3 = anglestoforward( self.angles );
    var_4 = var_2 + 144 * var_3;

    if ( var_0 sightconetrace( var_4, self ) < level.heli_target_recognition )
        return 0;

    return var_1;
}

getbestprimarytarget( var_0 )
{
    foreach ( var_2 in var_0 )
        update_player_threat( var_2 );

    var_4 = 0;
    var_5 = undefined;
    var_6 = getentarray( "minimap_corner", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_6.size == 2 )
        {
            var_8 = var_6[0].origin;
            var_9 = var_6[0].origin;

            if ( var_6[1].origin[0] > var_9[0] )
                var_9 = ( var_6[1].origin[0], var_9[1], var_9[2] );
            else
                var_8 = ( var_6[1].origin[0], var_8[1], var_8[2] );

            if ( var_6[1].origin[1] > var_9[1] )
                var_9 = ( var_9[0], var_6[1].origin[1], var_9[2] );
            else
                var_8 = ( var_8[0], var_6[1].origin[1], var_8[2] );

            if ( var_2.origin[0] < var_8[0] || var_2.origin[0] > var_9[0] || var_2.origin[1] < var_8[1] || var_2.origin[1] > var_9[1] )
                continue;
        }

        if ( var_2.threatlevel < var_4 )
            continue;

        var_4 = var_2.threatlevel;
        var_5 = var_2;
    }

    return var_5;
}

update_player_threat( var_0 )
{
    var_0.threatlevel = 0;
    var_1 = distance( var_0.origin, self.origin );
    var_0.threatlevel += ( level.heli_visual_range - var_1 ) / level.heli_visual_range * 100;

    if ( isdefined( self.attacker ) && var_0 == self.attacker )
        var_0.threatlevel += 100;

    var_0.threatlevel += var_0.score * 4;

    if ( isdefined( var_0.antithreat ) )
        var_0.threatlevel -= var_0.antithreat;

    if ( var_0.threatlevel <= 0 )
        var_0.threatlevel = 1;
}

heli_reset()
{
    self cleartargetyaw();
    self cleargoalyaw();
    self vehicle_setspeed( 60, 25 );
    self setyawspeed( 75, 45, 45 );
    self setmaxpitchroll( 30, 30 );
    self setneargoalnotifydist( 256 );
    self setturningability( 0.9 );
}

addrecentdamage( var_0 )
{
    self endon( "death" );
    self.recentdamageamount += var_0;
    wait 4.0;
    self.recentdamageamount -= var_0;
}

heli_damage_monitor()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self.health = 999999;
    self.damagetaken = 0;
    self.recentdamageamount = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_1.class ) && var_1.class == "worldspawn" )
            continue;
        else if ( var_1 == self )
            continue;

        if ( !maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_1 ) )
            continue;

        self.attacker = var_1;
        var_10 = var_0;

        if ( isplayer( var_1 ) )
        {
            var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "" );

            if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
            {
                if ( self.helitype == "flares" )
                    var_10 *= level.heli_armor_bulletdamage;

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

                    switch ( self.helitype )
                    {
                        case "osprey":
                        case "osprey_gunner":
                        case "flares":
                            var_10 = self.maxhealth * 0.07;
                            break;
                        case "littlebird":
                        case "helicopter":
                            var_10 = self.maxhealth * 0.09;
                            break;
                    }

                    break;
                case "emp_grenade_mp":
                    var_10 = 0;
                    thread heli_empgrenaded();
                    break;
                case "osprey_player_minigun_mp":
                    self.largeprojectiledamage = 0;
                    var_10 *= 2;
                    break;
            }
        }

        self.damagetaken += var_10;
        thread addrecentdamage( var_10 );

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( level.teambased && self.team != var_1.team || !level.teambased )
            {
                var_11 = undefined;

                if ( isdefined( var_1.owner ) && ( !isdefined( self.owner ) || var_1.owner != self.owner ) )
                    var_11 = var_1.owner;
                else if ( !isdefined( var_1.owner ) && var_1.classname == "script_vehicle" )
                    return;
                else if ( !isdefined( self.owner ) || var_1 != self.owner )
                    var_11 = var_1;

                if ( isdefined( var_11 ) )
                {
                    var_11 notify( "destroyed_helicopter" );

                    switch ( self.helitype )
                    {
                        case "flares":
                            var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_PAVELOW" );
                            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_helicopter_flares", var_11 );
                            var_12 = 400;
                            break;
                        case "minigun":
                            var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_MINIGUNNER" );
                            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_helicopter_minigun", var_11 );
                            var_12 = 300;
                            break;
                        case "osprey":
                        case "osprey_gunner":
                            var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_OSPREY" );
                            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_osprey", var_11 );
                            var_12 = 300;
                            break;
                        case "littlebird":
                            var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_LITTLE_BIRD" );
                            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_little_bird", var_11 );
                            var_12 = 200;
                        default:
                            var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_HELICOPTER" );
                            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_helicopter", var_11 );
                            var_12 = 200;
                            break;
                    }

                    var_11 thread maps\mp\gametypes\_rank::giverankxp( "kill", var_12, var_9, var_4 );
                    thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_11, var_0, var_4, var_9 );
                }
            }
        }
    }
}

heli_empgrenaded()
{
    self notify( "heli_EMPGrenaded" );
    self endon( "heli_EMPGrenaded" );
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self.empgrenaded = 1;

    if ( isdefined( self.mgturretleft ) )
        self.mgturretleft notify( "stop_shooting" );

    if ( isdefined( self.mgturretright ) )
        self.mgturretright notify( "stop_shooting" );

    wait 3.5;
    self.empgrenaded = 0;

    if ( isdefined( self.mgturretleft ) )
        self.mgturretleft notify( "turretstatechange" );

    if ( isdefined( self.mgturretright ) )
        self.mgturretright notify( "turretstatechange" );
}

heli_health()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self.currentstate = "ok";
    self.laststate = "ok";
    self setdamagestate( 3 );
    var_0 = 3;
    self setdamagestate( var_0 );

    for (;;)
    {
        if ( self.damagetaken >= self.maxhealth * 0.33 && var_0 == 3 )
        {
            var_0 = 2;
            self setdamagestate( var_0 );
            self.currentstate = "light smoke";
            playfxontag( level.chopper_fx["damage"]["light_smoke"], self, "tag_engine_left" );
        }
        else if ( self.damagetaken >= self.maxhealth * 0.66 && var_0 == 2 )
        {
            var_0 = 1;
            self setdamagestate( var_0 );
            self.currentstate = "heavy smoke";
            stopfxontag( level.chopper_fx["damage"]["light_smoke"], self, "tag_engine_left" );
            playfxontag( level.chopper_fx["damage"]["heavy_smoke"], self, "tag_engine_left" );
        }
        else if ( self.damagetaken > self.maxhealth )
        {
            var_0 = 0;
            self setdamagestate( var_0 );
            stopfxontag( level.chopper_fx["damage"]["heavy_smoke"], self, "tag_engine_left" );

            if ( isdefined( self.largeprojectiledamage ) && self.largeprojectiledamage )
                thread heli_explode( 1 );
            else
            {
                playfxontag( level.chopper_fx["damage"]["on_fire"], self, "tag_engine_left" );
                thread heli_crash();
            }
        }

        wait 0.05;
    }
}

heli_crash()
{
    self notify( "crashing" );
    var_0 = level.heli_crash_nodes[randomint( level.heli_crash_nodes.size )];
    thread heli_spin( 180 );
    thread heli_secondary_explosions();
    heli_fly_simple_path( var_0 );
    thread heli_explode();
}

heli_secondary_explosions()
{
    playfxontag( level.chopper_fx["explode"]["large"], self, "tag_engine_left" );
    self playsound( level.heli_sound[self.team]["hitsecondary"] );
    wait 3.0;

    if ( !isdefined( self ) )
        return;

    playfxontag( level.chopper_fx["explode"]["large"], self, "tag_engine_left" );
    self playsound( level.heli_sound[self.team]["hitsecondary"] );
}

heli_spin( var_0 )
{
    self endon( "death" );
    self playsound( level.heli_sound[self.team]["hit"] );
    thread spinsoundshortly();
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self settargetyaw( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

spinsoundshortly()
{
    self endon( "death" );
    wait 0.25;
    self stoploopsound();
    wait 0.05;
    self playloopsound( level.heli_sound[self.team]["spinloop"] );
    wait 0.05;
    self playloopsound( level.heli_sound[self.team]["spinstart"] );
}

heli_explode( var_0 )
{
    self notify( "death" );

    if ( isdefined( var_0 ) && isdefined( level.chopper_fx["explode"]["air_death"][self.heli_type] ) )
    {
        var_1 = self gettagangles( "tag_deathfx" );
        playfx( level.chopper_fx["explode"]["air_death"][self.heli_type], self gettagorigin( "tag_deathfx" ), anglestoforward( var_1 ), anglestoup( var_1 ) );
    }
    else
    {
        var_2 = self.origin;
        var_3 = self.origin + ( 0.0, 0.0, 1.0 ) - self.origin;
        playfx( level.chopper_fx["explode"]["death"][self.heli_type], var_2, var_3 );
    }

    self playsound( level.heli_sound[self.team]["crash"] );
    wait 0.05;

    if ( isdefined( self.killcament ) )
        self.killcament delete();

    maps\mp\_utility::decrementfauxvehiclecount();
    self delete();
}

fire_missile( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_3 = undefined;
    var_4 = undefined;
    var_5 = "cobra_20mm_mp";
    var_6 = [];

    switch ( var_0 )
    {
        case "ffar":
            var_3 = "harrier_FFAR_mp";
            var_6[0] = "tag_store_r_2";
            break;
        default:
            break;
    }

    var_4 = weaponfiretime( var_3 );
    self setvehweapon( var_3 );
    var_7 = -1;

    for ( var_8 = 0; var_8 < var_1; var_8++ )
    {
        var_7++;

        if ( var_7 >= var_6.size )
            var_7 = 0;

        self setvehweapon( "harrier_FFAR_mp" );

        if ( isdefined( var_2 ) )
        {
            var_9 = self fireweapon( var_6[var_7], var_2 );
            var_9 missile_setflightmodedirect();
            var_9 missile_settargetent( var_2 );
        }
        else
        {
            var_9 = self fireweapon( var_6[var_7] );
            var_9 missile_setflightmodedirect();
            var_9 missile_settargetent( var_2 );
        }

        if ( var_8 < var_1 - 1 )
            wait(var_4);
    }
}

check_owner()
{
    if ( !isdefined( self.owner ) || !isdefined( self.owner.pers["team"] ) || self.owner.pers["team"] != self.team )
    {
        thread heli_leave();
        return 0;
    }

    return 1;
}

heli_leave_on_disconnect( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 waittill( "disconnect" );
    thread heli_leave();
}

heli_leave_on_changeteams( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    thread heli_leave();
}

heli_leave_on_spawned( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 waittill( "spawned" );
    thread heli_leave();
}

heli_leave_on_gameended( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    level waittill( "game_ended" );
    thread heli_leave();
}

heli_leave_on_timeout( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread heli_leave();
}

attack_targets()
{
    thread attack_primary();
    thread attack_secondary();
}

attack_secondary()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        if ( isdefined( self.secondarytarget ) )
        {
            self.secondarytarget.antithreat = undefined;
            self.missiletarget = self.secondarytarget;
            var_0 = 0;

            while ( isdefined( self.missiletarget ) && isalive( self.missiletarget ) )
            {
                if ( missile_target_sight_check( self.missiletarget ) )
                    thread missile_support( self.missiletarget, level.heli_missile_rof );
                else
                    break;

                self waittill( "missile ready" );

                if ( !isdefined( self.secondarytarget ) || isdefined( self.secondarytarget ) && self.missiletarget != self.secondarytarget )
                    break;
            }

            if ( isdefined( self.missiletarget ) )
                self.missiletarget.antithreat = undefined;
        }

        self waittill( "secondary acquired" );
        check_owner();
    }
}

missile_target_sight_check( var_0 )
{
    var_1 = vectornormalize( var_0.origin - self.origin );
    var_2 = anglestoforward( self.angles );
    var_3 = vectornormalize( var_2 );
    var_4 = vectordot( var_1, var_3 );

    if ( var_4 >= level.heli_missile_target_cone )
    {
        debug_print3d_simple( "Missile sight: " + var_4, self, ( 0.0, 0.0, -40.0 ), 40 );
        return 1;
    }

    return 0;
}

missile_support( var_0, var_1 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( isdefined( var_0 ) )
    {
        if ( level.teambased )
        {
            if ( isdefined( var_0.owner ) && var_0.team != self.team )
            {
                fire_missile( "ffar", 1, var_0 );
                self notify( "missile fired" );
            }
        }
        else if ( isdefined( var_0.owner ) && var_0.owner != self.owner )
        {
            fire_missile( "ffar", 1, var_0 );
            self notify( "missile fired" );
        }
    }

    wait(var_1);
    self notify( "missile ready" );
    return;
}

attack_primary()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        wait 0.05;

        if ( !isalive( self.primarytarget ) )
            continue;

        var_0 = self.primarytarget;
        var_0.antithreat = 0;

        if ( randomint( 5 ) < 3 )
            var_1 = var_0.angles[1] + randomfloatrange( -30, 30 );
        else
            var_1 = randomint( 360 );

        var_2 = 96;
        var_3 = cos( var_1 ) * var_2;
        var_4 = sin( var_1 ) * var_2;
        self setturrettargetent( var_0, ( var_3, var_4, 40 ) );
        waitontargetordeath( var_0, 3.0 );

        if ( !isalive( var_0 ) || !self vehicle_canturrettargetpoint( var_0.origin + ( 0.0, 0.0, 40.0 ) ) )
            continue;

        var_5 = weaponfiretime( "cobra_20mm_mp" );
        var_6 = 1;
        var_7 = 0;
        self playloopsound( "weap_cobra_20mm_fire_npc" );

        for ( var_8 = 0; var_8 < level.heli_turretclipsize; var_8++ )
        {
            if ( self.empgrenaded )
                break;

            self setvehweapon( "cobra_20mm_mp" );
            self fireweapon( "tag_flash" );

            if ( var_8 < level.heli_turretclipsize - 1 )
                wait(var_5);

            if ( !isdefined( var_0 ) )
                break;

            if ( self vehicle_canturrettargetpoint( var_0.origin + ( 0.0, 0.0, 40.0 ), 1, self ) )
            {
                var_6 = max( var_6 - 0.05, 0 );
                var_7 = 0;
            }
            else
                var_7++;

            if ( var_7 > 10 )
                break;

            var_9 = ( var_3 * var_6 + randomfloatrange( -6, 6 ), var_4 * var_6 + randomfloatrange( -6, 6 ), 40 + randomfloatrange( -6, 6 ) );
            self setturrettargetent( var_0, var_9 );
        }

        self stoploopsound();

        if ( isalive( var_0 ) )
            var_0.antithreat += 100;

        wait(randomfloatrange( 0.5, 2.0 ));
    }
}

waitontargetordeath( var_0, var_1 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    common_scripts\utility::waittill_notify_or_timeout( "turret_on_target", var_1 );
}

firemissile( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( !isdefined( var_0 ) )
        return;

    if ( distance2d( self.origin, var_0.origin ) < 512 )
        return;

    self setvehweapon( "harrier_FFAR_mp" );
    var_1 = self fireweapon( "tag_flash", var_0 );
    var_1 missile_setflightmodedirect();
    var_1 missile_settargetent( var_0 );
}

getoriginoffsets( var_0 )
{
    var_1 = self.origin;
    var_2 = var_0.origin;
    var_3 = 0;
    var_4 = 40;
    var_5 = ( 0.0, 0.0, -196.0 );

    for ( var_6 = bullettrace( var_1 + var_5, var_2 + var_5, 0, self ); distancesquared( var_6["position"], var_2 + var_5 ) > 10 && var_3 < var_4; var_6 = bullettrace( var_1 + var_5, var_2 + var_5, 0, self ) )
    {
        if ( var_1[2] < var_2[2] )
            var_1 += ( 0.0, 0.0, 128.0 );
        else if ( var_1[2] > var_2[2] )
            var_2 += ( 0.0, 0.0, 128.0 );
        else
        {
            var_1 += ( 0.0, 0.0, 128.0 );
            var_2 += ( 0.0, 0.0, 128.0 );
        }

        var_3++;
    }

    var_7 = [];
    var_7["start"] = var_1;
    var_7["end"] = var_2;
    return var_7;
}

traveltonode( var_0 )
{
    var_1 = getoriginoffsets( var_0 );

    if ( var_1["start"] != self.origin )
    {
        if ( isdefined( var_0.script_airspeed ) && isdefined( var_0.script_accel ) )
        {
            var_2 = var_0.script_airspeed;
            var_3 = var_0.script_accel;
        }
        else
        {
            var_2 = 30 + randomint( 20 );
            var_3 = 15 + randomint( 15 );
        }

        self vehicle_setspeed( var_2, var_3 );
        self setvehgoalpos( var_1["start"] + ( 0.0, 0.0, 30.0 ), 0 );
        self setgoalyaw( var_0.angles[1] + level.heli_angle_offset );
        self waittill( "goal" );
    }

    if ( var_1["end"] != var_0.origin )
    {
        if ( isdefined( var_0.script_airspeed ) && isdefined( var_0.script_accel ) )
        {
            var_2 = var_0.script_airspeed;
            var_3 = var_0.script_accel;
        }
        else
        {
            var_2 = 30 + randomint( 20 );
            var_3 = 15 + randomint( 15 );
        }

        self vehicle_setspeed( var_2, var_3 );
        self setvehgoalpos( var_1["end"] + ( 0.0, 0.0, 30.0 ), 0 );
        self setgoalyaw( var_0.angles[1] + level.heli_angle_offset );
        self waittill( "goal" );
    }
}

heli_fly_simple_path( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self notify( "flying" );
    self endon( "flying" );
    heli_reset();

    for ( var_1 = var_0; isdefined( var_1.target ); var_1 = var_2 )
    {
        var_2 = getent( var_1.target, "targetname" );

        if ( isdefined( var_1.script_airspeed ) && isdefined( var_1.script_accel ) )
        {
            var_3 = var_1.script_airspeed;
            var_4 = var_1.script_accel;
        }
        else
        {
            var_3 = 30 + randomint( 20 );
            var_4 = 15 + randomint( 15 );
        }

        self vehicle_setspeed( var_3, var_4 );

        if ( !isdefined( var_2.target ) )
        {
            self setvehgoalpos( var_2.origin + self.zoffset, 1 );
            self waittill( "near_goal" );
            continue;
        }

        self setvehgoalpos( var_2.origin + self.zoffset, 0 );
        self waittill( "near_goal" );
        self setgoalyaw( var_2.angles[1] );
        self waittillmatch( "goal" );
    }
}

heli_fly_loop_path( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self notify( "flying" );
    self endon( "flying" );
    heli_reset();
    thread heli_loop_speed_control( var_0 );

    for ( var_1 = var_0; isdefined( var_1.target ); var_1 = var_2 )
    {
        var_2 = getent( var_1.target, "targetname" );

        if ( isdefined( var_1.script_airspeed ) && isdefined( var_1.script_accel ) )
        {
            self.desired_speed = var_1.script_airspeed;
            self.desired_accel = var_1.script_accel;
        }
        else
        {
            self.desired_speed = 30 + randomint( 20 );
            self.desired_accel = 15 + randomint( 15 );
        }

        if ( self.helitype == "flares" )
        {
            self.desired_speed *= 0.5;
            self.desired_accel *= 0.5;
        }

        if ( isdefined( var_2.script_delay ) && isdefined( self.primarytarget ) && !heli_is_threatened() )
        {
            self setvehgoalpos( var_2.origin + self.zoffset, 1 );
            self waittill( "near_goal" );
            wait(var_2.script_delay);
            continue;
        }

        self setvehgoalpos( var_2.origin + self.zoffset, 0 );
        self waittill( "near_goal" );
        self setgoalyaw( var_2.angles[1] );
        self waittillmatch( "goal" );
    }
}

heli_loop_speed_control( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( isdefined( var_0.script_airspeed ) && isdefined( var_0.script_accel ) )
    {
        self.desired_speed = var_0.script_airspeed;
        self.desired_accel = var_0.script_accel;
    }
    else
    {
        self.desired_speed = 30 + randomint( 20 );
        self.desired_accel = 15 + randomint( 15 );
    }

    var_1 = 0;
    var_2 = 0;

    for (;;)
    {
        var_3 = self.desired_speed;
        var_4 = self.desired_accel;

        if ( self.helitype != "flares" && isdefined( self.primarytarget ) && !heli_is_threatened() )
            var_3 *= 0.25;

        if ( var_1 != var_3 || var_2 != var_4 )
        {
            self vehicle_setspeed( var_3, var_4 );
            var_1 = var_3;
            var_2 = var_4;
        }

        wait 0.05;
    }
}

heli_is_threatened()
{
    if ( self.recentdamageamount > 50 )
        return 1;

    if ( self.currentstate == "heavy smoke" )
        return 1;

    return 0;
}

heli_fly_well( var_0 )
{
    self notify( "flying" );
    self endon( "flying" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        var_1 = get_best_area_attack_node( var_0 );
        traveltonode( var_1 );

        if ( isdefined( var_1.script_airspeed ) && isdefined( var_1.script_accel ) )
        {
            var_2 = var_1.script_airspeed;
            var_3 = var_1.script_accel;
        }
        else
        {
            var_2 = 30 + randomint( 20 );
            var_3 = 15 + randomint( 15 );
        }

        self vehicle_setspeed( var_2, var_3 );
        self setvehgoalpos( var_1.origin + self.zoffset, 1 );
        self setgoalyaw( var_1.angles[1] + level.heli_angle_offset );

        if ( level.heli_forced_wait != 0 )
        {
            self waittill( "near_goal" );
            wait(level.heli_forced_wait);
            continue;
        }

        if ( !isdefined( var_1.script_delay ) )
        {
            self waittill( "near_goal" );
            wait(5 + randomint( 5 ));
            continue;
        }

        self waittillmatch( "goal" );
        wait(var_1.script_delay);
    }
}

get_best_area_attack_node( var_0 )
{
    return updateareanodes( var_0 );
}

heli_leave( var_0 )
{
    self notify( "leaving" );

    if ( isdefined( self.helitype ) && self.helitype == "osprey" && isdefined( self.pathgoal ) )
    {
        self setvehgoalpos( self.pathgoal, 1 );
        common_scripts\utility::waittill_any_timeout( 5, "goal" );
    }

    if ( !isdefined( var_0 ) )
    {
        var_1 = level.heli_leave_nodes[randomint( level.heli_leave_nodes.size )];
        var_0 = var_1.origin;
    }

    var_2 = spawn( "script_origin", var_0 );

    if ( isdefined( var_2 ) )
    {
        self setlookatent( var_2 );
        var_2 thread wait_and_delete( 3.0 );
    }

    heli_reset();
    self vehicle_setspeed( 100, 45 );
    self setvehgoalpos( var_0, 1 );
    self waittillmatch( "goal" );
    self notify( "death" );
    wait 0.05;

    if ( isdefined( self.killcament ) )
        self.killcament delete();

    maps\mp\_utility::decrementfauxvehiclecount();
    self delete();
}

wait_and_delete( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self delete();
}

debug_print3d( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
        thread draw_text( var_0, var_1, var_2, var_3, var_4 );
}

debug_print3d_simple( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
    {
        if ( isdefined( var_3 ) )
            thread draw_text( var_0, ( 0.8, 0.8, 0.8 ), var_1, var_2, var_3 );
        else
            thread draw_text( var_0, ( 0.8, 0.8, 0.8 ), var_1, var_2, 0 );
    }
}

debug_line( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 && !isdefined( var_3 ) )
        thread draw_line( var_0, var_1, var_2 );
    else if ( isdefined( level.heli_debug ) && level.heli_debug == 1.0 )
        thread draw_line( var_0, var_1, var_2, var_3 );
}

draw_text( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 == 0 )
    {
        while ( isdefined( var_2 ) )
            wait 0.05;
    }
    else
    {
        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            if ( !isdefined( var_2 ) )
                break;

            wait 0.05;
        }
    }
}

draw_line( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        for ( var_4 = 0; var_4 < var_3; var_4++ )
            wait 0.05;
    }
    else
    {
        for (;;)
            wait 0.05;
    }
}

addtohelilist()
{
    level.helis[self getentitynumber()] = self;
}

removefromhelilist( var_0 )
{
    level.helis[var_0] = undefined;
}

addtolittlebirdlist()
{
    level.littlebirds[self getentitynumber()] = self;
}

removefromlittlebirdlistondeath()
{
    var_0 = self getentitynumber();
    self waittill( "death" );
    level.littlebirds[var_0] = undefined;
}

exceededmaxlittlebirds( var_0 )
{
    if ( level.littlebirds.size >= 4 || level.littlebirds.size >= 2 && var_0 == "littlebird_flock" )
        return 1;
    else
        return 0;
}

playflarefx()
{
    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        if ( !isdefined( self ) )
            return;

        playfxontag( level._effect["ac130_flare"], self, "TAG_FLARE" );
        wait 0.15;
    }
}

deployflares()
{
    var_0 = spawn( "script_origin", self.origin + ( 0.0, 0.0, -256.0 ) );
    var_0.angles = self.angles;
    var_0 movegravity( ( 0.0, 0.0, -1.0 ), 5.0 );
    var_0 thread deleteaftertime( 5.0 );
    return var_0;
}

heli_flares_monitor()
{
    switch ( self.helitype )
    {
        case "osprey_gunner":
            self.numflares = 2;
            break;
        default:
            self.numflares = 1;
            break;
    }

    thread handleincomingsam();
    thread handleincomingstinger();
}

handleincomingstinger( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    for (;;)
    {
        level waittill( "stinger_fired", var_1, var_2, var_3 );

        if ( !isdefined( var_3 ) || var_3 != self )
            continue;

        if ( isdefined( var_0 ) )
        {
            var_2 thread [[ var_0 ]]( var_1, var_1.team, var_3 );
            continue;
        }

        var_2 thread watchstingerproximity( var_1, var_1.team, var_3 );
    }
}

watchstingerproximity( var_0, var_1, var_2 )
{
    self endon( "death" );

    for (;;)
    {
        if ( !isdefined( var_2 ) )
            break;

        var_3 = var_2 getpointinbounds( 0, 0, 0 );
        var_4 = distance( self.origin, var_3 );

        if ( var_4 < 4000 && var_2.numflares > 0 )
        {
            var_2.numflares--;
            var_2 thread playflarefx();
            var_5 = var_2 deployflares();
            self missile_settargetent( var_5 );
            return;
        }

        wait 0.05;
    }
}

handleincomingsam( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    for (;;)
    {
        level waittill( "sam_fired", var_1, var_2, var_3 );

        if ( !isdefined( var_3 ) || var_3 != self )
            continue;

        if ( isdefined( var_0 ) )
        {
            level thread [[ var_0 ]]( var_1, var_1.team, var_3, var_2 );
            continue;
        }

        level thread watchsamproximity( var_1, var_1.team, var_3, var_2 );
    }
}

watchsamproximity( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    for (;;)
    {
        var_4 = var_2 getpointinbounds( 0, 0, 0 );
        var_5 = [];

        for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        {
            if ( isdefined( var_3[var_6] ) )
                var_5[var_6] = distance( var_3[var_6].origin, var_4 );
        }

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6] ) )
            {
                if ( var_5[var_6] < 4000 && var_2.numflares > 0 )
                {
                    var_2.numflares--;
                    var_2 thread playflarefx();
                    var_7 = var_2 deployflares();

                    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
                    {
                        if ( isdefined( var_3[var_8] ) )
                            var_3[var_8] missile_settargetent( var_7 );
                    }

                    return;
                }
            }
        }

        wait 0.05;
    }
}

deleteaftertime( var_0 )
{
    wait(var_0);
    self delete();
}

pavelowmadeselectionvo()
{
    self endon( "death" );
    self endon( "disconnect" );
    self playlocalsound( game["voice"][self.team] + "KS_hqr_pavelow" );
    wait 3.5;
    self playlocalsound( game["voice"][self.team] + "KS_pvl_inbound" );
}
