// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.ospreysettings = [];
    level.ospreysettings["escort_airdrop"] = spawnstruct();
    level.ospreysettings["escort_airdrop"].vehicle = "osprey_mp";
    level.ospreysettings["escort_airdrop"].modelbase = "vehicle_v22_osprey_body_mp";
    level.ospreysettings["escort_airdrop"].modelblades = "vehicle_v22_osprey_blades_mp";
    level.ospreysettings["escort_airdrop"].taghatchl = "tag_le_door_attach";
    level.ospreysettings["escort_airdrop"].taghatchr = "tag_ri_door_attach";
    level.ospreysettings["escort_airdrop"].tagdropcrates = "tag_turret_attach";
    level.ospreysettings["escort_airdrop"].prompt = &"MP_DEFEND_AIRDROP_PACKAGES";
    level.ospreysettings["escort_airdrop"].name = &"KILLSTREAKS_ESCORT_AIRDROP";
    level.ospreysettings["escort_airdrop"].weaponinfo = "osprey_minigun_mp";
    level.ospreysettings["escort_airdrop"].helitype = "osprey";
    level.ospreysettings["escort_airdrop"].droptype = "airdrop_escort";
    level.ospreysettings["escort_airdrop"].maxhealth = level.heli_maxhealth * 2;
    level.ospreysettings["escort_airdrop"].timeout = 60.0;
    level.ospreysettings["osprey_gunner"] = spawnstruct();
    level.ospreysettings["osprey_gunner"].vehicle = "osprey_player_mp";
    level.ospreysettings["osprey_gunner"].modelbase = "vehicle_v22_osprey_body_mp";
    level.ospreysettings["osprey_gunner"].modelblades = "vehicle_v22_osprey_blades_mp";
    level.ospreysettings["osprey_gunner"].taghatchl = "tag_le_door_attach";
    level.ospreysettings["osprey_gunner"].taghatchr = "tag_ri_door_attach";
    level.ospreysettings["osprey_gunner"].tagdropcrates = "tag_turret_attach";
    level.ospreysettings["osprey_gunner"].prompt = &"MP_DEFEND_AIRDROP_PACKAGES";
    level.ospreysettings["osprey_gunner"].name = &"KILLSTREAKS_OSPREY_GUNNER";
    level.ospreysettings["osprey_gunner"].weaponinfo = "osprey_player_minigun_mp";
    level.ospreysettings["osprey_gunner"].helitype = "osprey_gunner";
    level.ospreysettings["osprey_gunner"].droptype = "airdrop_osprey_gunner";
    level.ospreysettings["osprey_gunner"].maxhealth = level.heli_maxhealth * 2;
    level.ospreysettings["osprey_gunner"].timeout = 75.0;

    foreach ( var_1 in level.ospreysettings )
    {
        precachevehicle( var_1.vehicle );
        precacheitem( var_1.weaponinfo );
        precachemodel( var_1.modelbase );
        precachemodel( var_1.modelblades );
        precachestring( var_1.prompt );
        precachestring( var_1.name );
        level.chopper_fx["explode"]["death"][var_1.modelbase] = loadfx( "explosions/helicopter_explosion_osprey" );
        level.chopper_fx["explode"]["air_death"][var_1.modelbase] = loadfx( "explosions/helicopter_explosion_osprey_air_mp" );
        level.chopper_fx["anim"]["blades_anim_up"][var_1.modelbase] = loadfx( "props/osprey_blades_anim_up" );
        level.chopper_fx["anim"]["blades_anim_down"][var_1.modelbase] = loadfx( "props/osprey_blades_anim_down" );
        level.chopper_fx["anim"]["blades_static_up"][var_1.modelbase] = loadfx( "props/osprey_blades_up" );
        level.chopper_fx["anim"]["blades_static_down"][var_1.modelbase] = loadfx( "props/osprey_blades_default" );
        level.chopper_fx["anim"]["hatch_left_static_up"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_left_default" );
        level.chopper_fx["anim"]["hatch_left_anim_down"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_left_anim_open" );
        level.chopper_fx["anim"]["hatch_left_static_down"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_left_up" );
        level.chopper_fx["anim"]["hatch_left_anim_up"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_left_anim_close" );
        level.chopper_fx["anim"]["hatch_right_static_up"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_right_default" );
        level.chopper_fx["anim"]["hatch_right_anim_down"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_right_anim_open" );
        level.chopper_fx["anim"]["hatch_right_static_down"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_right_up" );
        level.chopper_fx["anim"]["hatch_right_anim_up"][var_1.modelbase] = loadfx( "props/osprey_bottom_door_right_anim_close" );
    }

    level.air_support_locs = [];
    level.killstreakfuncs["escort_airdrop"] = ::tryuseescortairdrop;
    level.killstreakfuncs["osprey_gunner"] = ::tryuseospreygunner;
}

tryuseescortairdrop( var_0, var_1 )
{
    var_2 = 1;

    if ( isdefined( self.laststand ) && !maps\mp\_utility::_hasperk( "specialty_finalstand" ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }
    else if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
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
    else if ( maps\mp\_utility::isusingremote() )
        return 0;

    if ( maps\mp\_utility::isairdenied() )
        return 0;

    if ( maps\mp\_utility::isemped() )
        return 0;

    maps\mp\_utility::incrementfauxvehiclecount();
    var_4 = maps\mp\killstreaks\_airdrop::beginairdropviamarker( var_0, var_1, "escort_airdrop" );

    if ( !isdefined( var_4 ) || !var_4 )
    {
        self notify( "markerDetermined" );
        maps\mp\_utility::decrementfauxvehiclecount();
        return 0;
    }

    maps\mp\_matchdata::logkillstreakevent( "escort_airdrop", self.origin );
    return 1;
}

tryuseospreygunner( var_0, var_1 )
{
    var_2 = 1;

    if ( isdefined( self.laststand ) && !maps\mp\_utility::_hasperk( "specialty_finalstand" ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }
    else if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
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
    else if ( maps\mp\_utility::isusingremote() )
        return 0;

    if ( maps\mp\_utility::isairdenied() )
        return 0;

    if ( maps\mp\_utility::isemped() )
        return 0;

    maps\mp\_utility::incrementfauxvehiclecount();
    var_4 = selectdroplocation( var_0, "osprey_gunner", "compass_objpoint_osprey_friendly", "compass_objpoint_osprey_enemy", &"MP_SELECT_MOBILE_MORTAR_LOCATION" );

    if ( !isdefined( var_4 ) || !var_4 )
    {
        maps\mp\_utility::decrementfauxvehiclecount();
        return 0;
    }

    maps\mp\_matchdata::logkillstreakevent( "osprey_gunner", self.origin );
    return 1;
}

finishsupportescortusage( var_0, var_1, var_2, var_3 )
{
    self notify( "used" );
    var_4 = ( 0, var_2, 0 );
    var_5 = 12000;
    var_6 = getent( "airstrikeheight", "targetname" );
    var_7 = var_6.origin[2];
    var_8 = level.heli_start_nodes[randomint( level.heli_start_nodes.size )];
    var_9 = var_8.origin;
    var_10 = ( var_1[0], var_1[1], var_7 );
    var_11 = var_1 + anglestoforward( var_4 ) * var_5;
    var_12 = vectortoangles( var_10 - var_9 );
    var_13 = var_1;
    var_1 = ( var_1[0], var_1[1], var_7 );
    var_14 = createairship( self, var_0, var_9, var_12, var_1, var_3 );
    var_9 = var_8;
    usesupportescortairdrop( var_0, var_14, var_9, var_10, var_11, var_7, var_13 );
}

finishospreygunnerusage( var_0, var_1, var_2, var_3 )
{
    self notify( "used" );
    var_4 = ( 0, var_2, 0 );
    var_5 = 12000;
    var_6 = getent( "airstrikeheight", "targetname" );
    var_7 = var_6.origin[2];
    var_8 = level.heli_start_nodes[randomint( level.heli_start_nodes.size )];
    var_9 = var_8.origin;
    var_10 = ( var_1[0], var_1[1], var_7 );
    var_11 = var_1 + anglestoforward( var_4 ) * var_5;
    var_12 = vectortoangles( var_10 - var_9 );
    var_1 = ( var_1[0], var_1[1], var_7 );
    var_13 = createairship( self, var_0, var_9, var_12, var_1, var_3 );
    var_9 = var_8;
    useospreygunner( var_0, var_13, var_9, var_10, var_11, var_7 );
}

stopselectionwatcher()
{
    self waittill( "stop_location_selection", var_0 );

    switch ( var_0 )
    {
        case "death":
        case "disconnect":
        case "cancel_location":
        case "emp":
            self notify( "customCancelLocation" );
            break;
    }
}

selectdroplocation( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "customCancelLocation" );
    var_5 = undefined;
    var_6 = level.mapsize / 6.46875;

    if ( level.splitscreen )
        var_6 *= 1.5;

    maps\mp\_utility::_beginlocationselection( var_1, "map_artillery_selector", 0, 500 );
    thread stopselectionwatcher();
    self waittill( "confirm_location", var_7, var_8 );
    maps\mp\_utility::stoplocationselection( 0 );
    maps\mp\_utility::setusingremote( var_1 );
    var_9 = maps\mp\killstreaks\_killstreaks::initridekillstreak( var_1 );

    if ( var_9 != "success" )
    {
        if ( var_9 != "disconnect" )
            maps\mp\_utility::clearusingremote();

        return 0;
    }

    if ( isdefined( level.chopper ) )
    {
        maps\mp\_utility::clearusingremote();
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount >= maps\mp\_utility::maxvehiclesallowed() )
    {
        maps\mp\_utility::clearusingremote();
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    thread finishospreygunnerusage( var_0, var_7, var_8, var_1 );
    return 1;
}

showicons( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\mp\gametypes\_hud_util::createfontstring( "bigfixed", 0.5 );
    var_4 maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, -150 );
    var_4 settext( var_2 );
    self.locationobjectives = [];

    for ( var_5 = 0; var_5 < var_3; var_5++ )
    {
        self.locationobjectives[var_5] = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( self.locationobjectives[var_5], "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( self.locationobjectives[var_5], level.air_support_locs[level.script][var_5]["origin"] );
        objective_state( self.locationobjectives[var_5], "active" );
        objective_player( self.locationobjectives[var_5], self getentitynumber() );

        if ( level.air_support_locs[level.script][var_5]["in_use"] == 1 )
        {
            objective_icon( self.locationobjectives[var_5], var_1 );
            continue;
        }

        objective_icon( self.locationobjectives[var_5], var_0 );
    }

    common_scripts\utility::waittill_any( "cancel_location", "picked_location", "stop_location_selection" );
    var_4 maps\mp\gametypes\_hud_util::destroyelem();

    for ( var_5 = 0; var_5 < var_3; var_5++ )
        maps\mp\_utility::_objective_delete( self.locationobjectives[var_5] );
}

createairship( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnhelicopter( var_0, var_2, var_3, level.ospreysettings[var_5].vehicle, level.ospreysettings[var_5].modelbase );

    if ( !isdefined( var_6 ) )
        return undefined;

    var_6.ospreytype = var_5;
    var_6.heli_type = level.ospreysettings[var_5].modelbase;
    var_6.helitype = level.ospreysettings[var_5].helitype;
    var_6.attractor = missile_createattractorent( var_6, level.heli_attract_strength , level.heli_attract_range );
    var_6.lifeid = var_1;
    var_6.team = var_0.pers["team"];
    var_6.pers["team"] = var_0.pers["team"];
    var_6.owner = var_0;
    var_6.maxhealth = level.ospreysettings[var_5].maxhealth;
    var_6.zoffset = ( 0.0, 0.0, 0.0 );
    var_6.targeting_delay = level.heli_targeting_delay;
    var_6.primarytarget = undefined;
    var_6.secondarytarget = undefined;
    var_6.attacker = undefined;
    var_6.currentstate = "ok";
    var_6.droptype = level.ospreysettings[var_5].droptype;
    level.chopper = var_6;
    var_6 maps\mp\killstreaks\_helicopter::addtohelilist();
    var_6 thread maps\mp\killstreaks\_helicopter::heli_flares_monitor();
    var_6 thread maps\mp\killstreaks\_helicopter::heli_leave_on_disconnect( var_0 );
    var_6 thread maps\mp\killstreaks\_helicopter::heli_leave_on_changeteams( var_0 );
    var_6 thread maps\mp\killstreaks\_helicopter::heli_leave_on_gameended( var_0 );
    var_7 = level.ospreysettings[var_5].timeout;
    var_6 thread maps\mp\killstreaks\_helicopter::heli_leave_on_timeout( var_7 );
    var_6 thread maps\mp\killstreaks\_helicopter::heli_damage_monitor();
    var_6 thread maps\mp\killstreaks\_helicopter::heli_health();
    var_6 thread maps\mp\killstreaks\_helicopter::heli_existance();
    var_6 thread airshipfx();

    if ( var_5 == "escort_airdrop" )
    {
        var_8 = var_6.origin + ( anglestoforward( var_6.angles ) * -200 + anglestoright( var_6.angles ) * -200 ) + ( 0.0, 0.0, 200.0 );
        var_6.killcament = spawn( "script_model", var_8 );
        var_6.killcament setscriptmoverkillcam( "explosive" );
        var_6.killcament linkto( var_6, "tag_origin" );
    }

    return var_6;
}

airshipfx()
{
    self endon( "death" );
    wait 0.05;
    playfxontag( level.chopper_fx["anim"]["blades_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
    wait 0.05;
    playfxontag( level.chopper_fx["anim"]["hatch_left_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
    wait 0.05;
    playfxontag( level.chopper_fx["anim"]["hatch_right_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail" );
}

usesupportescortairdrop( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_1 thread airshipflydefense( self, var_2, var_3, var_4, var_5, var_6 );
}

useospreygunner( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread ridegunner( var_0, var_1 );
    var_1 thread airshipflygunner( self, var_2, var_3, var_4, var_5 );
}

ridegunner( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "helicopter_done" );
    thread maps\mp\_utility::teamplayercardsplash( "used_osprey_gunner", self );
    maps\mp\_utility::_giveweapon( "heli_remote_mp" );
    self switchtoweapon( "heli_remote_mp" );

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 0 );

    var_1 vehicleturretcontrolon( self );
    self playerlinkweaponviewtodelta( var_1, "tag_player", 1.0, 0, 0, 0, 0, 1 );
    self setplayerangles( var_1 gettagangles( "tag_player" ) );
    var_1 thread maps\mp\killstreaks\_helicopter::heli_targeting();
    thread maps\mp\killstreaks\_helicopter::weaponlockthink( var_1 );
    var_1.gunner = self;
    self.heliridelifeid = var_0;
    thread endrideonairshipdone( var_1 );
    thread waitsetthermal( 1.0, var_1 );
    thread maps\mp\_utility::reinitializethermal( var_1 );

    for (;;)
    {
        var_1 waittill( "turret_fire" );
        var_1 fireweapon();
        earthquake( 0.2, 1, var_1.origin, 1000 );
    }
}

waitsetthermal( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "death" );
    var_1 endon( "helicopter_done" );
    var_1 endon( "crashing" );
    var_1 endon( "leaving" );
    wait(var_0);
    self visionsetthermalforplayer( level.ac130.enhanced_vision, 0 );
    self.lastvisionsetthermal = level.ac130.enhanced_vision;
    self thermalvisionon();
    self thermalvisionfofoverlayon();
    thread maps\mp\killstreaks\_helicopter::thermalvision( var_1 );
}

showdefendprompt( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "helicopter_done" );
    self.escort_prompt = maps\mp\gametypes\_hud_util::createfontstring( "bigfixed", 1.5 );
    self.escort_prompt maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, -150 );
    self.escort_prompt settext( level.ospreysettings[var_0.ospreytype].prompt );
    wait 6;

    if ( isdefined( self.escort_prompt ) )
        self.escort_prompt maps\mp\gametypes\_hud_util::destroyelem();
}

airshippitchpropsup()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level.chopper_fx["anim"]["blades_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
    playfxontag( level.chopper_fx["anim"]["blades_anim_up"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
    wait 1.0;

    if ( isdefined( self ) )
        playfxontag( level.chopper_fx["anim"]["blades_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
}

airshippitchpropsdown()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level.chopper_fx["anim"]["blades_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
    playfxontag( level.chopper_fx["anim"]["blades_anim_down"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
    wait 1.0;

    if ( isdefined( self ) )
        playfxontag( level.chopper_fx["anim"]["blades_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, "TAG_BLADES_ATTACH" );
}

airshippitchhatchup()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level.chopper_fx["anim"]["hatch_left_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
    playfxontag( level.chopper_fx["anim"]["hatch_left_anim_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
    stopfxontag( level.chopper_fx["anim"]["hatch_right_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    playfxontag( level.chopper_fx["anim"]["hatch_right_anim_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    wait 1.0;

    if ( isdefined( self ) )
    {
        playfxontag( level.chopper_fx["anim"]["hatch_left_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
        playfxontag( level.chopper_fx["anim"]["hatch_right_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    }
}

airshippitchhatchdown()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level.chopper_fx["anim"]["hatch_left_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
    playfxontag( level.chopper_fx["anim"]["hatch_left_anim_down"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
    stopfxontag( level.chopper_fx["anim"]["hatch_right_static_up"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    playfxontag( level.chopper_fx["anim"]["hatch_right_anim_down"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    wait 1.0;

    if ( isdefined( self ) )
    {
        playfxontag( level.chopper_fx["anim"]["hatch_left_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchl );
        playfxontag( level.chopper_fx["anim"]["hatch_right_static_down"][level.ospreysettings[self.ospreytype].modelbase], self, level.ospreysettings[self.ospreytype].taghatchr );
    }

    self notify( "hatch_down" );
}

getbestheight( var_0 )
{
    self endon( "helicopter_removed" );
    self endon( "heightReturned" );
    var_1 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( var_1 ) )
        var_2 = var_1.origin[2];
    else if ( isdefined( level.airstrikeheightscale ) )
        var_2 = 850 * level.airstrikeheightscale;
    else
        var_2 = 850;

    self.bestheight = var_2;
    var_3 = 200;
    var_4 = 0;
    var_5 = 0;

    for ( var_6 = 0; var_6 < 125; var_6++ )
    {
        wait 0.05;
        var_7 = var_6 % 8;
        var_8 = var_6 * 3;

        switch ( var_7 )
        {
            case 0:
                var_4 = var_8;
                var_5 = var_8;
                break;
            case 1:
                var_4 = var_8 * -1;
                var_5 = var_8 * -1;
                break;
            case 2:
                var_4 = var_8 * -1;
                var_5 = var_8;
                break;
            case 3:
                var_4 = var_8;
                var_5 = var_8 * -1;
                break;
            case 4:
                var_4 = 0;
                var_5 = var_8 * -1;
                break;
            case 5:
                var_4 = var_8 * -1;
                var_5 = 0;
                break;
            case 6:
                var_4 = var_8;
                var_5 = 0;
                break;
            case 7:
                var_4 = 0;
                var_5 = var_8;
                break;
            default:
                break;
        }

        var_9 = bullettrace( var_0 + ( var_4, var_5, 1000 ), var_0 + ( var_4, var_5, -10000 ), 1, self );

        if ( var_9["position"][2] > var_3 )
            var_3 = var_9["position"][2];
    }

    self.bestheight = var_3 + 300;
}

airshipflydefense( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "airshipFlyDefense" );
    self endon( "airshipFlyDefense" );
    self endon( "helicopter_removed" );
    self endon( "death" );
    thread getbestheight( var_2 );
    maps\mp\killstreaks\_helicopter::heli_fly_simple_path( var_1 );
    self.pathgoal = var_2;
    var_6 = self.angles;
    self setyawspeed( 30, 30, 30, 0.3 );
    var_7 = self.origin;
    var_8 = self.angles[1];
    var_9 = self.angles[0];
    self.timeout = level.ospreysettings[self.ospreytype].timeout;
    self setvehgoalpos( var_2, 1 );
    var_10 = gettime();
    self waittill( "goal" );
    var_11 = ( gettime() - var_10 ) * 0.001;
    self.timeout -= var_11;
    thread airshippitchpropsup();
    var_12 = var_2 * ( 1.0, 1.0, 0.0 );
    var_12 += ( 0, 0, self.bestheight );
    self vehicle_setspeed( 25, 10, 10 );
    self setyawspeed( 20, 10, 10, 0.3 );
    self setvehgoalpos( var_12, 1 );
    var_10 = gettime();
    self waittill( "goal" );
    var_11 = ( gettime() - var_10 ) * 0.001;
    self.timeout -= var_11;
    self sethoverparams( 65, 50, 50 );
    ospreydropcrateslowimpulse( 1, level.ospreysettings[self.ospreytype].tagdropcrates, var_12 );
    thread killguysnearcrates( var_5 );
    self waittill( "leaving" );
    self notify( "osprey_leaving" );
    thread airshippitchpropsdown();
}

wait_and_delete( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self delete();
}

killguysnearcrates( var_0 )
{
    self endon( "osprey_leaving" );
    self endon( "helicopter_removed" );
    self endon( "death" );
    var_1 = var_0;

    for (;;)
    {
        foreach ( var_3 in level.players )
        {
            wait 0.05;

            if ( !isdefined( self ) )
                return;

            if ( !isdefined( var_3 ) )
                continue;

            if ( !maps\mp\_utility::isreallyalive( var_3 ) )
                continue;

            if ( level.teambased && var_3.team == self.team )
                continue;

            if ( isdefined( self.owner ) && var_3 == self.owner )
                continue;

            if ( var_3 maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
                continue;

            if ( distancesquared( var_1, var_3.origin ) > 500000 )
                continue;

            thread aishootplayer( var_3, var_1 );
            waitforconfirmation();
        }
    }
}

aishootplayer( var_0, var_1 )
{
    self notify( "aiShootPlayer" );
    self endon( "aiShootPlayer" );
    self endon( "helicopter_removed" );
    self endon( "leaving" );
    var_0 endon( "death" );
    self setturrettargetent( var_0 );
    self setlookatent( var_0 );
    thread targetdeathwaiter( var_0 );
    var_2 = 6;
    var_3 = 2;

    for (;;)
    {
        var_2--;
        self fireweapon( "tag_flash", var_0 );
        wait 0.15;

        if ( var_2 <= 0 )
        {
            var_3--;
            var_2 = 6;

            if ( distancesquared( var_0.origin, var_1 ) > 500000 || var_3 <= 0 || !maps\mp\_utility::isreallyalive( var_0 ) )
            {
                self notify( "abandon_target" );
                return;
            }

            wait 1;
        }
    }
}

targetdeathwaiter( var_0 )
{
    self endon( "abandon_target" );
    self endon( "leaving" );
    self endon( "helicopter_removed" );
    var_0 waittill( "death" );
    self notify( "target_killed" );
}

waitforconfirmation()
{
    self endon( "helicopter_removed" );
    self endon( "leaving" );
    self endon( "target_killed" );
    self endon( "abandon_target" );

    for (;;)
        wait 0.05;
}

airshipflygunner( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "airshipFlyGunner" );
    self endon( "airshipFlyGunner" );
    self endon( "helicopter_removed" );
    self endon( "death" );
    thread getbestheight( var_2 );
    maps\mp\killstreaks\_helicopter::heli_fly_simple_path( var_1 );
    thread maps\mp\killstreaks\_helicopter::heli_leave_on_timeout( level.ospreysettings[self.ospreytype].timeout );
    var_5 = self.angles;
    self setyawspeed( 30, 30, 30, 0.3 );
    var_6 = self.origin;
    var_7 = self.angles[1];
    var_8 = self.angles[0];
    self.timeout = level.ospreysettings[self.ospreytype].timeout;
    self setvehgoalpos( var_2, 1 );
    var_9 = gettime();
    self waittill( "goal" );
    var_10 = ( gettime() - var_9 ) * 0.001;
    self.timeout -= var_10;
    thread airshippitchpropsup();
    var_11 = var_2 * ( 1.0, 1.0, 0.0 );
    var_11 += ( 0, 0, self.bestheight );
    self vehicle_setspeed( 25, 10, 10 );
    self setyawspeed( 20, 10, 10, 0.3 );
    self setvehgoalpos( var_11, 1 );
    var_9 = gettime();
    self waittill( "goal" );
    var_10 = ( gettime() - var_9 ) * 0.001;
    self.timeout -= var_10;
    ospreydropcrates( 1, level.ospreysettings[self.ospreytype].tagdropcrates, var_11 );
    var_12 = 1.0;

    if ( isdefined( var_0 ) )
        var_0 common_scripts\utility::waittill_any_timeout( var_12, "disconnect" );

    self.timeout -= var_12;
    self setvehgoalpos( var_2, 1 );
    var_9 = gettime();
    self waittill( "goal" );
    var_10 = ( gettime() - var_9 ) * 0.001;
    self.timeout -= var_10;
    var_13 = getentarray( "heli_attack_area", "targetname" );
    var_14 = level.heli_loop_nodes[randomint( level.heli_loop_nodes.size )];

    if ( var_13.size )
        thread maps\mp\killstreaks\_helicopter::heli_fly_well( var_13 );
    else
        thread maps\mp\killstreaks\_helicopter::heli_fly_loop_path( var_14 );

    self waittill( "leaving" );
    thread airshippitchpropsdown();
}

ospreydropcrateslowimpulse( var_0, var_1, var_2 )
{
    thread airshippitchhatchdown();
    self waittill( "hatch_down" );
    var_3[0] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomint( 10 ), randomint( 10 ), randomint( 10 ) ), undefined, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait(var_0);
    var_3[1] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomint( 100 ), randomint( 100 ), randomint( 100 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait(var_0);
    var_3[2] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomint( 50 ), randomint( 50 ), randomint( 50 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait(var_0);
    var_3[3] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomintrange( -100, 0 ), randomintrange( -100, 0 ), randomintrange( -100, 0 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait(var_0);
    thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomintrange( -50, 0 ), randomintrange( -50, 0 ), randomintrange( -50, 0 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait 1.0;
    thread airshippitchhatchup();
}

ospreydropcrates( var_0, var_1, var_2 )
{
    thread airshippitchhatchdown();
    self waittill( "hatch_down" );
    var_3[0] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomint( 10 ), randomint( 10 ), randomint( 10 ) ), undefined, var_1 );
    wait 0.05;
    self.timeout -= 0.05;
    self notify( "drop_crate" );
    wait(var_0);
    self.timeout -= var_0;
    var_3[1] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomint( 100 ), randomint( 100 ), randomint( 100 ) ), var_3, var_1 );
    wait 0.05;
    self.timeout -= 0.05;
    self notify( "drop_crate" );
    wait(var_0);
    self.timeout -= var_0;
    var_3[2] = thread maps\mp\killstreaks\_airdrop::dropthecrate( undefined, self.droptype, undefined, 0, undefined, self.origin, ( randomint( 50 ), randomint( 50 ), randomint( 50 ) ), var_3, var_1 );
    wait 0.05;
    self.timeout -= 0.05;
    self notify( "drop_crate" );
    wait 1.0;
    thread airshippitchhatchup();
}

endride( var_0 )
{
    if ( isdefined( self.escort_prompt ) )
        self.escort_prompt maps\mp\gametypes\_hud_util::destroyelem();

    self remotecamerasoundscapeoff();
    self thermalvisionoff();
    self thermalvisionfofoverlayoff();
    self unlink();
    maps\mp\_utility::clearusingremote();

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 1 );

    self visionsetthermalforplayer( game["thermal_vision"], 0 );

    if ( isdefined( var_0 ) )
        var_0 vehicleturretcontroloff( self );

    self notify( "heliPlayer_removed" );
    self switchtoweapon( common_scripts\utility::getlastweapon() );
    self takeweapon( "heli_remote_mp" );
}

endrideonairshipdone( var_0 )
{
    self endon( "disconnect" );
    var_0 waittill( "helicopter_done" );
    endride( var_0 );
}
