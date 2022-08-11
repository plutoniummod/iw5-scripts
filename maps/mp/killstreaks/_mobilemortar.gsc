// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachemodel( "vehicle_bradley" );
    precachemodel( "vehicle_bradley_destroyed" );
    precacheshader( "compass_objpoint_tank_friendly" );
    precacheshader( "compass_objpoint_tank_enemy" );
    precacheshader( "compass_objpoint_mortar_target" );
    precachestring( &"KILLSTREAKS_MOBILE_MORTAR" );
    precachestring( &"MP_GROUND_APPROACHES_TOO_CROWDED" );
    precachestring( &"MP_SELECT_MOBILE_MORTAR_LOCATION" );
    level.tankfire = loadfx( "props/barrelexp" );
    level.tankexplode = loadfx( "explosions/large_vehicle_explosion" );
    level.tankflash = loadfx( "muzzleflashes/ac130_105mm" );
    level.tankdust1 = loadfx( "smoke/ground_smoke_launch_a" );
    level.tankdust2 = loadfx( "smoke/ground_smoke_launch_a" );
    level.ground_support_locs = [];
    level.ground_support_locs["mp_alpha"][0]["origin"] = ( -2748.91, 2921.33, 125.394 );
    level.ground_support_locs["mp_alpha"][0]["angles"] = ( 0.0, 16.0, 0.0 );
    level.ground_support_locs["mp_alpha"][1]["origin"] = ( 707.795, -499.191, -7.875 );
    level.ground_support_locs["mp_alpha"][1]["angles"] = ( 0.0, 90.0, 0.0 );
    level.ground_support_locs["mp_alpha"][2]["origin"] = ( 81.8557, 2343.87, -7.875 );
    level.ground_support_locs["mp_alpha"][2]["angles"] = ( 0.0, -90.1, 0.0 );
    level.ground_support_locs["mp_bravo"][0]["origin"] = ( -761.529, 1221.7, 1212.13 );
    level.ground_support_locs["mp_bravo"][0]["angles"] = ( 0.0, -92.373, 0.0 );
    level.ground_support_locs["mp_bravo"][1]["origin"] = ( 1474.99, 971.865, 1140.13 );
    level.ground_support_locs["mp_bravo"][1]["angles"] = ( 0.0, -178.401, 0.0 );
    level.ground_support_locs["mp_bravo"][2]["origin"] = ( -1366.57, -370.995, 975.807 );
    level.ground_support_locs["mp_bravo"][2]["angles"] = ( 0.0, 0.807495, 0.0 );
    level.ground_support_locs["mp_dome"][0]["origin"] = ( 960.279, -482.564, -388.872 );
    level.ground_support_locs["mp_dome"][0]["angles"] = ( 0.0, 100.536, 0.0 );
    level.ground_support_locs["mp_dome"][1]["origin"] = ( -921.941, 166.449, -418.131 );
    level.ground_support_locs["mp_dome"][1]["angles"] = ( 0.0, 25.4524, 0.0 );
    level.ground_support_locs["mp_dome"][2]["origin"] = ( 43.3564, 2102.85, -290.875 );
    level.ground_support_locs["mp_dome"][2]["angles"] = ( 0.0, -95.0347, 0.0 );
    level.ground_support_locs["mp_plaza2"][0]["origin"] = ( -1579.34, -2349.41, 556.125 );
    level.ground_support_locs["mp_plaza2"][0]["angles"] = ( 0.0, 5.32288, 0.0 );
    level.ground_support_locs["mp_plaza2"][1]["origin"] = ( -135.286, 1622.04, 607.13 );
    level.ground_support_locs["mp_plaza2"][1]["angles"] = ( 0.0, 173.639, 0.0 );
    level.ground_support_locs["mp_plaza2"][2]["origin"] = ( -1544.55, 1966.84, 632.024 );
    level.ground_support_locs["mp_plaza2"][2]["angles"] = ( 0.0, 0.796509, 0.0 );
    level.ground_support_locs["mp_radar"][0]["origin"] = ( 896.685, 2692.74, 1208.13 );
    level.ground_support_locs["mp_radar"][0]["angles"] = ( 0.0, -178.313, 0.0 );
    level.ground_support_locs["mp_radar"][1]["origin"] = ( -2455.87, 1564.41, 1308.9 );
    level.ground_support_locs["mp_radar"][1]["angles"] = ( 0.0, 1.93471, 0.0 );
    level.ground_support_locs["mp_radar"][2]["origin"] = ( 1609.0, -1098.99, 1162.13 );
    level.ground_support_locs["mp_radar"][2]["angles"] = ( 0.0, 170.421, 0.0 );
    level.ground_support_locs["mp_interchange"][0]["origin"] = ( -2067.08, 1218.17, -82.0487 );
    level.ground_support_locs["mp_interchange"][0]["angles"] = ( 0.0, -26.2946, 0.0 );
    level.ground_support_locs["mp_interchange"][1]["origin"] = ( -1198.2, -1782.62, 103.665 );
    level.ground_support_locs["mp_interchange"][1]["angles"] = ( 0.0, 23.3544, 0.0 );
    level.ground_support_locs["mp_interchange"][2]["origin"] = ( 2391.95, 899.034, 87.7839 );
    level.ground_support_locs["mp_interchange"][2]["angles"] = ( 0.0, -136.134, 0.0 );
    level.ground_support_locs["mp_lambeth"][0]["origin"] = ( 1641.37, -1318.01, -260.173 );
    level.ground_support_locs["mp_lambeth"][0]["angles"] = ( 0.0, 133.329, 0.0 );
    level.ground_support_locs["mp_lambeth"][1]["origin"] = ( -1346.56, -880.226, -191.875 );
    level.ground_support_locs["mp_lambeth"][1]["angles"] = ( 0.0, 0.432892, 0.0 );
    level.ground_support_locs["mp_lambeth"][2]["origin"] = ( 1403.95, 3083.4, -287.354 );
    level.ground_support_locs["mp_lambeth"][2]["angles"] = ( 0.0, -106.321, 0.0 );
    level.ground_support_locs["mp_paris"][0]["origin"] = ( -2427.42, 619.217, 188.826 );
    level.ground_support_locs["mp_paris"][0]["angles"] = ( 0.0, -2.90588, 0.0 );
    level.ground_support_locs["mp_paris"][1]["origin"] = ( 2066.95, 796.542, -88.322 );
    level.ground_support_locs["mp_paris"][1]["angles"] = ( 0.0, 177.292, 0.0 );
    level.ground_support_locs["mp_paris"][2]["origin"] = ( 506.406, -2165.36, -64.1201 );
    level.ground_support_locs["mp_paris"][2]["angles"] = ( 0.0, 89.5715, 0.0 );
    level.ground_support_locs["mp_hardhat"][0]["origin"] = ( 2033.65, -1428.62, 299.86 );
    level.ground_support_locs["mp_hardhat"][0]["angles"] = ( 0.0, 177.979, 0.0 );
    level.ground_support_locs["mp_hardhat"][1]["origin"] = ( -1044.73, 82.9179, 181.022 );
    level.ground_support_locs["mp_hardhat"][1]["angles"] = ( 0.0, -2.68066, 0.0 );
    level.ground_support_locs["mp_hardhat"][2]["origin"] = ( 1248.95, 1322.56, 304.125 );
    level.ground_support_locs["mp_hardhat"][2]["angles"] = ( 0.0, -93.4772, 0.0 );
    level.ground_support_locs["mp_carbon"][0]["origin"] = ( -47.1408, -2841.26, 3940.01 );
    level.ground_support_locs["mp_carbon"][0]["angles"] = ( 0.0, -101.667, 0.0 );
    level.ground_support_locs["mp_carbon"][1]["origin"] = ( -1686.2, -4727.09, 3756.16 );
    level.ground_support_locs["mp_carbon"][1]["angles"] = ( 0.0, 87.6436, 0.0 );
    level.ground_support_locs["mp_carbon"][2]["origin"] = ( -3761.18, -3716.69, 3568.91 );
    level.ground_support_locs["mp_carbon"][2]["angles"] = ( 0.0, -4.20761, 0.0 );
    level.ground_support_locs["mp_seatown"][0]["origin"] = ( 1339.87, 763.592, 175.114 );
    level.ground_support_locs["mp_seatown"][0]["angles"] = ( 0.0, 178.551, 0.0 );
    level.ground_support_locs["mp_seatown"][1]["origin"] = ( 1317.92, -725.589, 232.125 );
    level.ground_support_locs["mp_seatown"][1]["angles"] = ( 0.0, 177.738, 0.0 );
    level.ground_support_locs["mp_seatown"][2]["origin"] = ( -961.699, -1581.56, 144.125 );
    level.ground_support_locs["mp_seatown"][2]["angles"] = ( 0.0, 90.0176, 0.0 );
    level.ground_support_locs["mp_bootleg"][0]["origin"] = ( -988.964, 1833.74, -99.9509 );
    level.ground_support_locs["mp_bootleg"][0]["angles"] = ( 0.0, -78.8909, 0.0 );
    level.ground_support_locs["mp_bootleg"][1]["origin"] = ( 1105.84, -1116.13, -72.3048 );
    level.ground_support_locs["mp_bootleg"][1]["angles"] = ( 0.0, 176.558, 0.0 );
    level.ground_support_locs["mp_bootleg"][2]["origin"] = ( -2027.31, 84.2235, -51.875 );
    level.ground_support_locs["mp_bootleg"][2]["angles"] = ( 0.0, -5.12868, 0.0 );
    level.ground_support_locs["mp_meteora"][0]["origin"] = ( -590.972, 1667.65, -99.6187 );
    level.ground_support_locs["mp_meteora"][0]["angles"] = ( 0.0, -89.7745, 0.0 );
    level.ground_support_locs["mp_meteora"][1]["origin"] = ( -1371.02, -1095.66, 4.125 );
    level.ground_support_locs["mp_meteora"][1]["angles"] = ( 0.0, 179.879, 0.0 );
    level.ground_support_locs["mp_meteora"][2]["origin"] = ( 938.851, -1376.99, -60.0877 );
    level.ground_support_locs["mp_meteora"][2]["angles"] = ( 0.0, 110.545, 0.0 );
    level.killstreakfuncs["mobile_mortar"] = ::tryusemobilemortar;
}

tryusemobilemortar( var_0, var_1 )
{
    if ( !isdefined( level.ground_support_locs[level.script] ) )
    {
        self iprintlnbold( &"MP_UNAVAILABLE_IN_LEVEL" );
        return 0;
    }

    if ( isdefined( self.laststand ) && !maps\mp\_utility::_hasperk( "specialty_finalstand" ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }
    else if ( isdefined( level.mobilemortar ) )
    {
        self iprintlnbold( &"MP_GROUND_APPROACHES_TOO_CROWDED" );
        return 0;
    }
    else if ( maps\mp\_utility::isusingremote() )
        return 0;

    var_2 = selectentrancelocation();

    if ( !isdefined( var_2 ) )
        return 0;
    else
        thread maps\mp\_utility::stoplocationselection( 0 );

    var_3 = createmobilemortar( self, var_2 );

    if ( !isdefined( var_3 ) )
        return 0;

    var_3 thread movetoposition( "entrance" );
    return 1;
}

selectentrancelocation()
{
    var_0 = undefined;

    for (;;)
    {
        thread showicons();
        maps\mp\_utility::_beginlocationselection( "mobile_mortar", "map_artillery_selector", 0, 500 );
        self endon( "stop_location_selection" );
        self waittill( "confirm_location", var_1 );

        for ( var_2 = 0; var_2 < 3; var_2++ )
        {
            var_3 = level.ground_support_locs[level.script][var_2]["origin"] * ( 1.0, 1.0, 0.0 );
            var_4 = distancesquared( var_1, var_3 );

            if ( var_4 < 60000 )
            {
                var_0 = var_2;
                break;
            }
        }

        if ( isdefined( var_0 ) )
        {
            for ( var_2 = 0; var_2 < 3; var_2++ )
            {
                if ( var_2 == var_0 )
                {
                    objective_icon( self.locationobjectives[var_2], "compass_objpoint_mortar_target" );
                    continue;
                }

                objective_state( self.locationobjectives[var_2], "invisible" );
            }
        }
        else
        {
            for ( var_2 = 0; var_2 < 3; var_2++ )
                objective_icon( self.locationobjectives[var_2], "compass_objpoint_tank_enemy" );
        }

        wait 0.5;
        self notify( "picked_location" );
        wait 0.05;

        if ( isdefined( var_0 ) )
            break;
    }

    return var_0;
}

showicons()
{
    var_0 = maps\mp\gametypes\_hud_util::createfontstring( "bigfixed", 0.5 );
    var_0 maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, -150 );
    var_0 settext( &"MP_SELECT_MOBILE_MORTAR_LOCATION" );
    self.locationobjectives = [];

    for ( var_1 = 0; var_1 < 3; var_1++ )
    {
        self.locationobjectives[var_1] = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( self.locationobjectives[var_1], "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( self.locationobjectives[var_1], level.ground_support_locs[level.script][var_1]["origin"] );
        objective_state( self.locationobjectives[var_1], "active" );
        objective_team( self.locationobjectives[var_1], self.team );
        objective_icon( self.locationobjectives[var_1], "compass_objpoint_tank_friendly" );
    }

    common_scripts\utility::waittill_any( "cancel_location", "picked_location", "stop_location_selection" );
    var_0 maps\mp\gametypes\_hud_util::destroyelem();

    for ( var_1 = 0; var_1 < 3; var_1++ )
        maps\mp\_utility::_objective_delete( self.locationobjectives[var_1] );
}

createmobilemortar( var_0, var_1 )
{
    var_2 = maps\mp\killstreaks\_airdrop::getflyheightoffset( level.ground_support_locs[level.script][var_1]["origin"] );
    var_3 = bullettrace( level.ground_support_locs[level.script][var_1]["origin"] + ( 0, 0, var_2 ), level.ground_support_locs[level.script][var_1]["origin"] - ( 0, 0, var_2 ), 0 );
    var_4 = var_3["position"] + anglestoforward( level.ground_support_locs[level.script][var_1]["angles"] ) * -1000;
    var_5 = spawn( "script_model", var_4 );

    if ( !isdefined( var_5 ) )
        return undefined;

    var_5.angles = level.ground_support_locs[level.script][var_1]["angles"];
    var_5 setmodel( "vehicle_bradley" );
    var_5 setcandamage( 1 );
    var_5.maxhealth = level.heli_maxhealth * 2;
    var_5.health = var_5.maxhealth;
    var_5.owner = var_0;
    var_5.playersattacked = [];
    var_5.lasttarget = var_5.origin;

    if ( level.teambased )
        var_5.team = var_0.team;

    var_5.lowx = level.spawnpoints[0].origin[0];
    var_5.highx = level.spawnpoints[0].origin[0];
    var_5.lowy = level.spawnpoints[0].origin[1];
    var_5.highy = level.spawnpoints[0].origin[1];
    var_6 = 200;

    if ( level.spawnpoints.size > 1 )
    {
        for ( var_7 = 1; var_7 < level.spawnpoints.size; var_7++ )
        {
            if ( level.spawnpoints[var_7].origin[0] < var_5.lowx )
                var_5.lowx = level.spawnpoints[var_7].origin[0];
            else if ( level.spawnpoints[var_7].origin[0] > var_5.highx )
                var_5.highx = level.spawnpoints[var_7].origin[0];

            if ( level.spawnpoints[var_7].origin[1] < var_5.lowy )
            {
                var_5.lowy = level.spawnpoints[var_7].origin[1];
                continue;
            }

            if ( level.spawnpoints[var_7].origin[1] > var_5.highy )
                var_5.highy = level.spawnpoints[var_7].origin[1];
        }
    }
    else
        var_6 = -2000;

    var_5.lowx += var_6;
    var_5.highx -= var_6;
    var_5.lowy += var_6;
    var_5.highy -= var_6;

    if ( level.teambased )
    {
        var_8 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_8, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( var_8, var_3["position"] );
        objective_state( var_8, "active" );
        objective_team( var_8, var_5.team );
        objective_icon( var_8, "compass_objpoint_tank_friendly" );
        var_5.objidfriendly = var_8;
        var_8 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_8, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( var_8, var_3["position"] );
        objective_state( var_8, "active" );
        objective_team( var_8, level.otherteam[var_5.team] );
        objective_icon( var_8, "compass_objpoint_tank_enemy" );
        var_5.objidenemy = var_8;
    }

    var_5 thread watchtimeout();
    var_5 thread maps\mp\killstreaks\_helicopter::heli_damage_monitor();
    var_5 thread watchdeath();
    var_5 thread watchproximity();
    level.mobilemortar = var_5;
    return var_5;
}

movetoposition( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );

    if ( var_0 == "entrance" )
        var_1 = self.origin + anglestoforward( self.angles ) * 1000;
    else
    {
        self notify( "leaving" );
        var_1 = self.origin + anglestoforward( self.angles ) * -1000;
    }

    var_2 = 3.0;
    self moveto( var_1, var_2, var_2 * 0.6, var_2 * 0.4 );
    wait(var_2);

    if ( var_0 == "entrance" )
        thread mortarattack();
    else
    {
        stopfxontag( level.tankdust1, self.fxent, "tag_origin" );
        stopfxontag( level.tankdust2, self.fxent, "tag_origin" );
        self.fxent delete();
        maps\mp\_utility::_objective_delete( self.objidfriendly );
        maps\mp\_utility::_objective_delete( self.objidenemy );
        level.mobilemortar = undefined;
        self delete();
    }
}

findtarget()
{
    var_0 = undefined;

    foreach ( var_2 in level.players )
    {
        if ( var_2 == self.owner )
            continue;

        if ( var_2 maps\mp\_utility::_hasperk( "specialty_blindeye" ) )
            continue;

        if ( level.teambased && var_2.team == self.owner.team )
            continue;

        if ( distancesquared( self.origin, var_2.origin ) < 1000000 )
            continue;

        for ( var_3 = 0; var_3 < self.playersattacked.size; var_3++ )
        {
            if ( var_2 == self.playersattacked[var_3] )
                continue;
        }

        if ( distancesquared( var_2.origin, self.lasttarget ) < 500000 )
            continue;

        if ( level.teambased )
        {
            var_4 = 0;

            for ( var_3 = 0; var_3 < level.players.size; var_3++ )
            {
                if ( level.players[var_3].team != var_2.team && distancesquared( var_2.origin, level.players[var_3].origin ) < 250000 )
                {
                    var_4 = 1;
                    break;
                }
            }

            if ( var_4 == 1 )
                continue;
        }

        wait 0.05;
        var_5 = bullettrace( var_2.origin + ( 0, 0, var_2 maps\mp\killstreaks\_airdrop::getflyheightoffset( var_2.origin ) ), var_2.origin + ( 0.0, 0.0, 100.0 ), 0 );

        if ( var_5["surfacetype"] != "none" )
            continue;

        var_0 = var_2.origin;
        self.lasttarget = var_2.origin;
        self.playersattacked[self.playersattacked.size] = var_2;
        break;
    }

    return var_0;
}

findrandomtarget()
{
    var_0 = undefined;

    for ( var_1 = 0; var_1 < 20; var_1++ )
    {
        var_2 = ( randomfloatrange( self.lowx, self.highx ), randomfloatrange( self.lowy, self.highy ), 0 );

        if ( distancesquared( self.origin * ( 1.0, 1.0, 0.0 ), var_2 ) < 1000000 )
            continue;

        if ( distancesquared( self.owner.origin * ( 1.0, 1.0, 0.0 ), var_2 ) < 250000 )
            continue;

        if ( distancesquared( self.origin * ( 1.0, 1.0, 0.0 ), self.lasttarget ) < 500000 )
            continue;

        var_3 = 0;

        if ( level.teambased )
        {
            foreach ( var_5 in level.players )
            {
                if ( var_5.team == self.owner.team && distancesquared( var_5.origin * ( 1.0, 1.0, 0.0 ), var_2 ) < 250000 )
                {
                    var_3 = 1;
                    break;
                }
            }
        }

        if ( var_3 == 0 )
        {
            var_0 = var_2;
            self.lasttarget = var_2;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        var_0 = ( randomfloatrange( self.lowx, self.highx ), randomfloatrange( self.lowy, self.highy ), 0 );

    return var_0;
}

mortarattack()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    var_0 = 0;
    self.fxent = spawn( "script_model", self.origin );
    self.fxent setmodel( "tag_origin" );
    self.fxent.angles = self.angles;
    self.fxent addpitch( -90 );

    for (;;)
    {
        var_1 = findtarget();

        if ( !isdefined( var_1 ) )
            var_1 = findrandomtarget();

        var_2 = self.origin[2] + 3500;
        var_3 = bullettrace( var_1 + ( 0, 0, var_2 ), var_1 - ( 0, 0, var_2 ), 0 );
        var_4 = var_1 + ( 0, 0, var_2 );
        var_5 = var_1 + ( 0, 0, var_3["position"][2] );
        self playsound( "bmp_fire" );
        playfx( level.tankflash, self.origin + anglestoforward( self.angles ) * 50 );

        if ( var_0 < 3 )
        {
            playfxontag( level.tankdust1, self.fxent, "tag_origin" );
            playfxontag( level.tankdust2, self.fxent, "tag_origin" );
            var_0++;
        }

        thread mortarrecoil();
        level thread firemortar( self, var_4, var_5 );
        self waittill( "mortar_fire_done" );
        wait 2.5;
    }
}

firemortar( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_3 = var_0.owner;
    var_4 = magicbullet( "javelin_mp", var_0.origin + ( 0.0, 0.0, 150.0 ), var_1, var_3 );
    var_5 = maps\mp\gametypes\_gameobjects::getnextobjid();
    objective_add( var_5, "invisible", ( 0.0, 0.0, 0.0 ) );
    objective_position( var_5, var_2 );
    objective_state( var_5, "active" );
    objective_team( var_5, var_0.team );
    objective_icon( var_5, "compass_objpoint_mortar_target" );
    var_4.objidfriendly = var_5;
    var_6 = maps\mp\gametypes\_gameobjects::getnextobjid();
    objective_add( var_6, "invisible", ( 0.0, 0.0, 0.0 ) );
    objective_position( var_6, var_2 );
    objective_state( var_6, "active" );
    objective_team( var_6, level.otherteam[var_0.team] );
    objective_icon( var_6, "compass_objpoint_mortar_target" );
    var_4.objidenemy = var_6;
    var_7 = 0;

    for (;;)
    {
        if ( !isdefined( var_4 ) || var_7 > 115 || distancesquared( var_4.origin, var_1 ) < 500 )
            break;
        else
            wait 0.05;

        var_7++;
    }

    if ( isdefined( var_4 ) )
        var_4 delete();

    if ( isdefined( var_3 ) )
        var_8 = magicbullet( "javelin_mp", var_1 + ( 0.0, 0.0, 200.0 ), var_2, var_3 );
    else
        var_8 = magicbullet( "javelin_mp", var_1 + ( 0.0, 0.0, 200.0 ), var_2 );

    var_8.objidfriendly = var_5;
    var_8.objidenemy = var_6;
    var_8 thread watchprojectileonminimap( var_0 );
}

watchprojectileonminimap( var_0 )
{
    level endon( "game_ended" );
    self waittill( "death" );
    maps\mp\_utility::_objective_delete( self.objidfriendly );
    maps\mp\_utility::_objective_delete( self.objidenemy );

    if ( isdefined( var_0 ) )
        var_0 notify( "mortar_fire_done" );
}

mortarrecoil()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    var_0 = self.origin + anglestoforward( self.angles ) * -20;
    var_1 = self.origin;
    var_2 = self.angles;
    self moveto( var_0, 0.1 );
    self rotatepitch( -3, 0.1 );
    wait 0.1;
    self moveto( var_1, 0.15 );
    self rotateto( var_2, 0.15 );
    wait 0.15;
}

watchtimeout()
{
    level endon( "game_ended" );
    self endon( "death" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 90.0 );
    self setcandamage( 0 );
    thread movetoposition( "exit" );
}

watchproximity()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    for (;;)
    {
        radiusdamage( self.origin, 200, 20, 20 );
        wait 1;
    }
}

watchdeath()
{
    level endon( "game_ended" );
    self endon( "leaving" );
    self waittill( "death" );
    playfx( level.tankfire, self.origin );
    playfx( level.tankexplode, self.origin );
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "vehicle_bradley_destroyed" );
    var_0.angles = self.angles;
    stopfxontag( level.tankdust1, self.fxent, "tag_origin" );
    stopfxontag( level.tankdust2, self.fxent, "tag_origin" );
    maps\mp\_utility::_objective_delete( self.objidfriendly );
    maps\mp\_utility::_objective_delete( self.objidenemy );
    self.fxent delete();
    self delete();
    wait 3.5;
    var_0 delete();
    level.mobilemortar = undefined;
}

watchdamage()
{
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( self.health < 0 )
            break;
    }
}
