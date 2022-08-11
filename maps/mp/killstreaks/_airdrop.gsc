// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachevehicle( "littlebird_mp" );
    precachemodel( "com_plasticcase_friendly" );
    precachemodel( "com_plasticcase_enemy" );
    precachemodel( "com_plasticcase_trap_friendly" );
    precachemodel( "com_plasticcase_trap_bombsquad" );
    precachemodel( "vehicle_little_bird_armed" );
    precachemodel( "vehicle_ac130_low_mp" );
    precachemodel( "sentry_minigun_folded" );
    precachestring( &"PLATFORM_GET_RANDOM" );
    precachestring( &"PLATFORM_GET_KILLSTREAK" );
    precachestring( &"PLATFORM_CALL_NUKE" );
    precachestring( &"MP_CAPTURING_CRATE" );
    precacheshader( "compassping_friendly_mp" );
    precacheshader( "compassping_enemy" );
    precacheitem( "airdrop_trap_explosive_mp" );
    precachemodel( maps\mp\gametypes\_teams::getteamcratemodel( "allies" ) );
    precachemodel( maps\mp\gametypes\_teams::getteamcratemodel( "axis" ) );
    precachemodel( "prop_suitcase_bomb" );
    precacheshader( maps\mp\gametypes\_teams::getteamhudicon( "allies" ) );
    precacheshader( maps\mp\gametypes\_teams::getteamhudicon( "axis" ) );
    precacheshader( "waypoint_ammo_friendly" );
    precacheshader( "compass_objpoint_ammo_friendly" );
    precacheshader( "compass_objpoint_trap_friendly" );
    precacheshader( "compass_objpoint_ammo_enemy" );
    precacheminimapicon( "compass_objpoint_c130_friendly" );
    precacheminimapicon( "compass_objpoint_c130_enemy" );
    game["strings"]["ammo_hint"] = &"MP_AMMO_PICKUP";
    game["strings"]["explosive_ammo_hint"] = &"MP_EXPLOSIVE_AMMO_PICKUP";
    game["strings"]["uav_hint"] = &"MP_UAV_PICKUP";
    game["strings"]["counter_uav_hint"] = &"MP_COUNTER_UAV_PICKUP";
    game["strings"]["sentry_hint"] = &"MP_SENTRY_PICKUP";
    game["strings"]["juggernaut_hint"] = &"MP_JUGGERNAUT_PICKUP";
    game["strings"]["airdrop_juggernaut_hint"] = &"MP_JUGGERNAUT_PICKUP";
    game["strings"]["airdrop_juggernaut_def_hint"] = &"MP_JUGGERNAUT_PICKUP";
    game["strings"]["airdrop_juggernaut_gl_hint"] = &"MP_JUGGERNAUT_PICKUP";
    game["strings"]["airdrop_juggernaut_recon_hint"] = &"MP_JUGGERNAUT_PICKUP";
    game["strings"]["trophy_hint"] = &"MP_PICKUP_TROPHY";
    game["strings"]["predator_missile_hint"] = &"MP_PREDATOR_MISSILE_PICKUP";
    game["strings"]["airstrike_hint"] = &"MP_AIRSTRIKE_PICKUP";
    game["strings"]["precision_airstrike_hint"] = &"MP_PRECISION_AIRSTRIKE_PICKUP";
    game["strings"]["harrier_airstrike_hint"] = &"MP_HARRIER_AIRSTRIKE_PICKUP";
    game["strings"]["helicopter_hint"] = &"MP_HELICOPTER_PICKUP";
    game["strings"]["helicopter_flares_hint"] = &"MP_HELICOPTER_FLARES_PICKUP";
    game["strings"]["stealth_airstrike_hint"] = &"MP_STEALTH_AIRSTRIKE_PICKUP";
    game["strings"]["helicopter_minigun_hint"] = &"MP_HELICOPTER_MINIGUN_PICKUP";
    game["strings"]["ac130_hint"] = &"MP_AC130_PICKUP";
    game["strings"]["emp_hint"] = &"MP_EMP_PICKUP";
    game["strings"]["littlebird_support_hint"] = &"MP_LITTLEBIRD_SUPPORT_PICKUP";
    game["strings"]["littlebird_flock_hint"] = &"MP_LITTLEBIRD_FLOCK_PICKUP";
    game["strings"]["uav_strike_hint"] = &"MP_UAV_STRIKE_PICKUP";
    game["strings"]["light_armor_hint"] = &"MP_LIGHT_ARMOR_PICKUP";
    game["strings"]["minigun_turret_hint"] = &"MP_MINIGUN_TURRET_PICKUP";
    game["strings"]["team_ammo_refill_hint"] = &"MP_TEAM_AMMO_REFILL_PICKUP";
    game["strings"]["deployable_vest_hint"] = &"MP_DEPLOYABLE_VEST_PICKUP";
    game["strings"]["deployable_exp_ammo_hint"] = &"MP_DEPLOYABLE_EXP_AMMO_PICKUP";
    game["strings"]["gl_turret_hint"] = &"MP_GL_TURRET_PICKUP";
    game["strings"]["directional_uav_hint"] = &"MP_DIRECTIONAL_UAV_PICKUP";
    game["strings"]["ims_hint"] = &"MP_IMS_PICKUP";
    game["strings"]["heli_sniper_hint"] = &"MP_HELI_SNIPER_PICKUP";
    game["strings"]["heli_minigunner_hint"] = &"MP_HELI_MINIGUNNER_PICKUP";
    game["strings"]["remote_mortar_hint"] = &"MP_REMOTE_MORTAR_PICKUP";
    game["strings"]["remote_uav_hint"] = &"MP_REMOTE_UAV_PICKUP";
    game["strings"]["littlebird_support_hint"] = &"MP_LITTLEBIRD_SUPPORT_PICKUP";
    game["strings"]["osprey_gunner_hint"] = &"MP_OSPREY_GUNNER_PICKUP";
    game["strings"]["remote_tank_hint"] = &"MP_REMOTE_TANK_PICKUP";
    game["strings"]["triple_uav_hint"] = &"MP_TRIPLE_UAV_PICKUP";
    game["strings"]["remote_mg_turret_hint"] = &"MP_REMOTE_MG_TURRET_PICKUP";
    game["strings"]["sam_turret_hint"] = &"MP_SAM_TURRET_PICKUP";
    game["strings"]["escort_airdrop_hint"] = &"MP_ESCORT_AIRDROP_PICKUP";
    level.airdropcrates = getentarray( "care_package", "targetname" );
    level.oldairdropcrates = getentarray( "airdrop_crate", "targetname" );

    if ( !level.airdropcrates.size )
    {
        level.airdropcrates = level.oldairdropcrates;
        level.airdropcratecollision = getent( level.airdropcrates[0].target, "targetname" );
    }
    else
    {
        foreach ( var_1 in level.oldairdropcrates )
            var_1 deletecrate();

        level.airdropcratecollision = getent( level.airdropcrates[0].target, "targetname" );
        level.oldairdropcrates = getentarray( "airdrop_crate", "targetname" );
    }

    if ( level.airdropcrates.size )
    {
        foreach ( var_1 in level.airdropcrates )
            var_1 deletecrate();
    }

    level.numdropcrates = 0;
    level.killstreakfuncs["airdrop_assault"] = ::tryuseassaultairdrop;
    level.killstreakfuncs["airdrop_support"] = ::tryusesupportairdrop;
    level.killstreakfuncs["airdrop_mega"] = ::tryusemegaairdrop;
    level.killstreakfuncs["airdrop_predator_missile"] = ::tryuseairdroppredatormissile;
    level.killstreakfuncs["airdrop_sentry_minigun"] = ::tryuseairdropsentryminigun;
    level.killstreakfuncs["airdrop_juggernaut"] = ::tryusejuggernautairdrop;
    level.killstreakfuncs["airdrop_juggernaut_def"] = ::tryusejuggernautdefairdrop;
    level.killstreakfuncs["airdrop_juggernaut_gl"] = ::tryusejuggernautglairdrop;
    level.killstreakfuncs["airdrop_juggernaut_recon"] = ::tryusejuggernautreconairdrop;
    level.killstreakfuncs["airdrop_trophy"] = ::tryusetrophyairdrop;
    level.killstreakfuncs["airdrop_trap"] = ::tryuseairdroptrap;
    level.killstreakfuncs["airdrop_remote_tank"] = ::tryuseairdropremotetank;
    level.killstreakfuncs["ammo"] = ::tryuseammo;
    level.killstreakfuncs["explosive_ammo"] = ::tryuseexplosiveammo;
    level.killstreakfuncs["explosive_ammo_2"] = ::tryuseexplosiveammo;
    level.killstreakfuncs["light_armor"] = ::tryuselightarmor;
    level.littlebirds = [];
    level.cratetypes = [];
    addcratetype( "airdrop_assault", "uav", 10, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "ims", 20, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "predator_missile", 20, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "sentry", 20, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "precision_airstrike", 6, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "helicopter", 4, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "littlebird_support", 4, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "littlebird_flock", 4, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "remote_mortar", 3, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "remote_tank", 3, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "helicopter_flares", 2, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "ac130", 2, ::killstreakcratethink );
    addcratetype( "airdrop_assault", "airdrop_juggernaut", 1, ::juggernautcratethink );
    addcratetype( "airdrop_assault", "osprey_gunner", 1, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "uav", 10, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "ims", 20, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "predator_missile", 20, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "sentry", 20, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "precision_airstrike", 8, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "littlebird_flock", 8, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "remote_mortar", 5, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "remote_tank", 2, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "helicopter_flares", 2, ::killstreakcratethink );
    addcratetype( "airdrop_osprey_gunner", "airdrop_juggernaut", 1, ::juggernautcratethink );
    addcratetype( "airdrop_osprey_gunner", "ac130", 1, ::killstreakcratethink );
    addcratetype( "airdrop_support", "uav", 9, ::killstreakcratethink );
    addcratetype( "airdrop_support", "counter_uav", 9, ::killstreakcratethink );
    addcratetype( "airdrop_support", "deployable_vest", 8, ::killstreakcratethink );
    addcratetype( "airdrop_support", "sam_turret", 6, ::killstreakcratethink );
    addcratetype( "airdrop_support", "remote_uav", 5, ::killstreakcratethink );
    addcratetype( "airdrop_support", "remote_mg_turret", 5, ::killstreakcratethink );
    addcratetype( "airdrop_support", "stealth_airstrike", 4, ::killstreakcratethink );
    addcratetype( "airdrop_support", "triple_uav", 3, ::killstreakcratethink );
    addcratetype( "airdrop_support", "airdrop_juggernaut_recon", 2, ::juggernautcratethink );
    addcratetype( "airdrop_support", "escort_airdrop", 1, ::killstreakcratethink );
    addcratetype( "airdrop_support", "emp", 1, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "airdrop_trap", 10, ::trapcratethink );
    addcratetype( "airdrop_escort", "uav", 8, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "counter_uav", 8, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "deployable_vest", 7, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "sentry", 7, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "ims", 7, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "sam_turret", 6, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "stealth_airstrike", 5, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "airdrop_juggernaut_recon", 5, ::juggernautcratethink );
    addcratetype( "airdrop_escort", "remote_uav", 5, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "triple_uav", 3, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "remote_mg_turret", 3, ::killstreakcratethink );
    addcratetype( "airdrop_escort", "emp", 1, ::killstreakcratethink );
    addcratetype( "airdrop_trapcontents", "ims", 6, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "predator_missile", 7, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "sentry", 7, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "precision_airstrike", 7, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "helicopter", 8, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "littlebird_support", 8, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "littlebird_flock", 8, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "remote_mortar", 9, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "remote_tank", 9, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "helicopter_flares", 10, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "ac130", 10, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "airdrop_juggernaut", 10, ::trapnullfunc );
    addcratetype( "airdrop_trapcontents", "osprey_gunner", 10, ::trapnullfunc );
    addcratetype( "airdrop_grnd", "uav", 25, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "counter_uav", 25, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "deployable_vest", 21, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "sentry", 21, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "remote_mg_turret", 17, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "ims", 17, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "triple_uav", 13, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "predator_missile", 13, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "airdrop_trap", 11, ::trapcratethink );
    addcratetype( "airdrop_grnd", "precision_airstrike", 9, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "stealth_airstrike", 9, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "helicopter", 9, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "remote_tank", 7, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "sam_turret", 7, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "remote_uav", 7, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "littlebird_support", 4, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "airdrop_juggernaut_recon", 4, ::juggernautcratethink );
    addcratetype( "airdrop_grnd", "littlebird_flock", 2, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "helicopter_flares", 2, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "remote_mortar", 2, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "ac130", 2, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "airdrop_juggernaut", 1, ::juggernautcratethink );
    addcratetype( "airdrop_grnd", "osprey_gunner", 1, ::killstreakcratethink );
    addcratetype( "airdrop_grnd", "emp", 1, ::killstreakcratethink );
    addcratetype( "airdrop_sentry_minigun", "sentry", 100, ::killstreakcratethink );
    addcratetype( "airdrop_juggernaut", "airdrop_juggernaut", 100, ::juggernautcratethink );
    addcratetype( "airdrop_juggernaut_recon", "airdrop_juggernaut_recon", 100, ::juggernautcratethink );
    addcratetype( "airdrop_trophy", "airdrop_trophy", 100, ::trophycratethink );
    addcratetype( "airdrop_trap", "airdrop_trap", 100, ::trapcratethink );
    addcratetype( "littlebird_support", "littlebird_support", 100, ::killstreakcratethink );
    addcratetype( "airdrop_remote_tank", "remote_tank", 100, ::killstreakcratethink );

    foreach ( var_10, var_6 in level.cratetypes )
    {
        level.cratemaxval[var_10] = 0;

        foreach ( var_9, var_8 in level.cratetypes[var_10] )
        {
            if ( !var_8 )
                continue;

            level.cratemaxval[var_10] += var_8;
            level.cratetypes[var_10][var_9] = level.cratemaxval[var_10];
        }
    }

    var_11 = getentarray( "mp_tdm_spawn", "classname" );
    var_12 = undefined;

    foreach ( var_14 in var_11 )
    {
        if ( !isdefined( var_12 ) || var_14.origin[2] < var_12.origin[2] )
            var_12 = var_14;
    }

    level.lowspawn = var_12;
}

addcratetype( var_0, var_1, var_2, var_3 )
{
    level.cratetypes[var_0][var_1] = var_2;
    level.cratefuncs[var_0][var_1] = var_3;
}

getrandomcratetype( var_0 )
{
    var_1 = randomint( level.cratemaxval[var_0] );

    if ( isdefined( self.owner ) && self.owner maps\mp\_utility::_hasperk( "specialty_luckycharm" ) )
        var_2 = 1;
    else
        var_2 = 0;

    var_3 = undefined;

    foreach ( var_6, var_5 in level.cratetypes[var_0] )
    {
        if ( !var_5 )
            continue;

        var_3 = var_6;

        if ( var_5 > var_1 )
        {
            if ( var_2 )
            {
                var_2 = 0;
                continue;
            }

            break;
        }
    }

    return var_3;
}

getcratetypefordroptype( var_0 )
{
    switch ( var_0 )
    {
        case "airdrop_sentry_minigun":
            return "sentry";
        case "airdrop_predator_missile":
            return "predator_missile";
        case "airdrop_juggernaut":
            return "airdrop_juggernaut";
        case "airdrop_juggernaut_def":
            return "airdrop_juggernaut_def";
        case "airdrop_juggernaut_gl":
            return "airdrop_juggernaut_gl";
        case "airdrop_juggernaut_recon":
            return "airdrop_juggernaut_recon";
        case "airdrop_trap":
            return "airdrop_trap";
        case "airdrop_trophy":
            return "airdrop_trophy";
        case "airdrop_remote_tank":
            return "remote_tank";
        case "airdrop_assault":
        case "airdrop_mega":
        case "airdrop_escort":
        case "airdrop_support":
        case "airdrop_grnd":
        case "airdrop_grnd_mega":
        default:
            return getrandomcratetype( var_0 );
    }
}

drawline( var_0, var_1, var_2 )
{
    var_3 = int( var_2 * 20 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

tryuseassaultairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_assault" );
}

tryusesupportairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_support" );
}

tryuseairdroppredatormissile( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_predator_missile" );
}

tryuseairdropsentryminigun( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_sentry_minigun" );
}

tryusejuggernautairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_juggernaut" );
}

tryusejuggernautglairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_juggernaut_gl" );
}

tryusejuggernautreconairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_juggernaut_recon" );
}

tryusejuggernautdefairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_juggernaut_def" );
}

tryusetrophyairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_trophy" );
}

tryusemegaairdrop( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_mega" );
}

tryuseairdroptrap( var_0, var_1 )
{
    if ( tryuseairdrop( var_0, var_1, "airdrop_trap" ) )
    {
        if ( level.teambased )
            thread maps\mp\_utility::leaderdialog( level.otherteam[self.team] + "_enemy_airdrop_assault_inbound", level.otherteam[self.team] );
        else
        {
            var_2[0] = self;
            thread maps\mp\_utility::leaderdialog( level.otherteam[self.team] + "_enemy_airdrop_assault_inbound", undefined, undefined, var_2 );
        }

        return 1;
    }
    else
        return 0;
}

tryuseairdropremotetank( var_0, var_1 )
{
    return tryuseairdrop( var_0, var_1, "airdrop_remote_tank" );
}

tryuseammo( var_0 )
{
    if ( maps\mp\_utility::isjuggernaut() )
        return 0;
    else
    {
        refillammo( 1 );
        return 1;
    }
}

tryuseexplosiveammo( var_0 )
{
    if ( maps\mp\_utility::isjuggernaut() )
        return 0;
    else
    {
        refillammo( 0 );
        maps\mp\_utility::giveperk( "specialty_explosivebullets", 0 );
        return 1;
    }
}

tryuselightarmor( var_0 )
{
    if ( maps\mp\_utility::isjuggernaut() )
        return 0;
    else
    {
        thread maps\mp\perks\_perkfunctions::givelightarmor();
        return 1;
    }
}

tryuseairdrop( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( !isdefined( var_2 ) )
        var_2 = "airdrop_assault";

    var_4 = 1;

    if ( ( level.littlebirds.size >= 4 || level.fauxvehiclecount >= 4 ) && var_2 != "airdrop_mega" && !issubstr( tolower( var_2 ), "juggernaut" ) )
    {
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_4 >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }
    else if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
        return 0;
    }
    else if ( maps\mp\_utility::isusingremote() )
        return 0;
    else if ( !maps\mp\_utility::validateusestreak() )
        return 0;

    if ( var_2 != "airdrop_mega" && !issubstr( tolower( var_2 ), "juggernaut" ) )
        thread watchdisconnect();

    if ( !issubstr( var_2, "juggernaut" ) )
        maps\mp\_utility::incrementfauxvehiclecount();

    var_3 = beginairdropviamarker( var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) || !var_3 )
    {
        self notify( "markerDetermined" );
        maps\mp\_utility::decrementfauxvehiclecount();
        return 0;
    }

    if ( var_2 == "airdrop_mega" )
        thread maps\mp\_utility::teamplayercardsplash( "used_airdrop_mega", self );

    self notify( "markerDetermined" );
    maps\mp\_matchdata::logkillstreakevent( var_2, self.origin );
    return 1;
}

watchdisconnect()
{
    self endon( "markerDetermined" );
    self waittill( "disconnect" );
    return;
}

beginairdropviamarker( var_0, var_1, var_2 )
{
    self notify( "beginAirdropViaMarker" );
    self endon( "beginAirdropViaMarker" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.threwairdropmarker = undefined;
    thread watchairdropweaponchange( var_0, var_1, var_2 );
    thread watchairdropmarkerusage( var_0, var_1, var_2 );
    thread watchairdropmarker( var_0, var_1, var_2 );
    var_3 = common_scripts\utility::waittill_any_return( "notAirDropWeapon", "markerDetermined" );

    if ( isdefined( var_3 ) && var_3 == "markerDetermined" )
        return 1;
    else if ( !isdefined( var_3 ) && isdefined( self.threwairdropmarker ) )
        return 1;

    return 0;
}

watchairdropweaponchange( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self notify( "watchAirDropWeaponChange" );
    self endon( "watchAirDropWeaponChange" );
    self endon( "disconnect" );
    self endon( "markerDetermined" );

    while ( maps\mp\_utility::ischangingweapon() )
        wait 0.05;

    var_3 = self getcurrentweapon();

    if ( isairdropmarker( var_3 ) )
        var_4 = var_3;
    else
        var_4 = undefined;

    while ( isairdropmarker( var_3 ) )
    {
        self waittill( "weapon_change", var_3 );

        if ( isairdropmarker( var_3 ) )
            var_4 = var_3;
    }

    if ( isdefined( self.threwairdropmarker ) )
    {
        var_5 = maps\mp\killstreaks\_killstreaks::getkillstreakweapon( self.pers["killstreaks"][self.killstreakindexweapon].streakname );
        self takeweapon( var_5 );
        self notify( "markerDetermined" );
    }
    else
        self notify( "notAirDropWeapon" );
}

watchairdropmarkerusage( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self notify( "watchAirDropMarkerUsage" );
    self endon( "watchAirDropMarkerUsage" );
    self endon( "disconnect" );
    self endon( "markerDetermined" );

    for (;;)
    {
        self waittill( "grenade_pullback", var_3 );

        if ( !isairdropmarker( var_3 ) )
            continue;

        common_scripts\utility::_disableusability();
        beginairdropmarkertracking();
    }
}

watchairdropmarker( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self notify( "watchAirDropMarker" );
    self endon( "watchAirDropMarker" );
    self endon( "disconnect" );
    self endon( "markerDetermined" );

    for (;;)
    {
        self waittill( "grenade_fire", var_3, var_4 );

        if ( !isairdropmarker( var_4 ) )
            continue;

        self.threwairdropmarker = 1;
        var_3 thread airdropdetonateonstuck();
        var_3.owner = self;
        var_3.weaponname = var_4;
        var_3 thread airdropmarkeractivate( var_2 );
    }
}

beginairdropmarkertracking()
{
    level endon( "game_ended" );
    self notify( "beginAirDropMarkerTracking" );
    self endon( "beginAirDropMarkerTracking" );
    self endon( "death" );
    self endon( "disconnect" );
    common_scripts\utility::waittill_any( "grenade_fire", "weapon_change" );
    common_scripts\utility::_enableusability();
}

airdropmarkeractivate( var_0, var_1 )
{
    level endon( "game_ended" );
    self notify( "airDropMarkerActivate" );
    self endon( "airDropMarkerActivate" );
    self waittill( "explode", var_2 );
    var_3 = self.owner;

    if ( !isdefined( var_3 ) )
        return;

    if ( var_3 maps\mp\_utility::isemped() )
        return;

    if ( var_3 maps\mp\_utility::isairdenied() )
        return;

    if ( issubstr( tolower( var_0 ), "escort_airdrop" ) && isdefined( level.chopper ) )
        return;

    wait 0.05;

    if ( issubstr( tolower( var_0 ), "juggernaut" ) )
        level doc130flyby( var_3, var_2, randomfloat( 360 ), var_0 );
    else if ( issubstr( tolower( var_0 ), "escort_airdrop" ) )
        var_3 maps\mp\killstreaks\_escortairdrop::finishsupportescortusage( var_1, var_2, randomfloat( 360 ), "escort_airdrop" );
    else
        level doflyby( var_3, var_2, randomfloat( 360 ), var_0 );
}

initairdropcrate()
{
    self.inuse = 0;
    self hide();

    if ( isdefined( self.target ) )
    {
        self.collision = getent( self.target, "targetname" );
        self.collision notsolid();
    }
    else
        self.collision = undefined;
}

deleteonownerdeath( var_0 )
{
    wait 0.25;
    self linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 waittill( "death" );
    self delete();
}

crateteammodelupdater()
{
    self endon( "death" );
    self hide();

    foreach ( var_1 in level.players )
    {
        if ( var_1.team != "spectator" )
            self showtoplayer( var_1 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_1 in level.players )
        {
            if ( var_1.team != "spectator" )
                self showtoplayer( var_1 );
        }
    }
}

cratemodelteamupdater( var_0 )
{
    self endon( "death" );
    self hide();

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == var_0 )
            self showtoplayer( var_2 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
                self showtoplayer( var_2 );
        }
    }
}

cratemodelplayerupdater( var_0, var_1 )
{
    self endon( "death" );
    self hide();

    foreach ( var_3 in level.players )
    {
        if ( var_1 && isdefined( var_0 ) && var_3 != var_0 )
            continue;

        if ( !var_1 && isdefined( var_0 ) && var_3 == var_0 )
            continue;

        self showtoplayer( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_3 in level.players )
        {
            if ( var_1 && isdefined( var_0 ) && var_3 != var_0 )
                continue;

            if ( !var_1 && isdefined( var_0 ) && var_3 == var_0 )
                continue;

            self showtoplayer( var_3 );
        }
    }
}

crateuseteamupdater( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        setusablebyteam( var_0 );
        level waittill( "joined_team" );
    }
}

crateusejuggernautupdater()
{
    if ( !issubstr( self.cratetype, "juggernaut" ) )
        return;

    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "juggernaut_equipped", var_0 );
        self disableplayeruse( var_0 );
        thread crateusepostjuggernautupdater( var_0 );
    }
}

crateusepostjuggernautupdater( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 waittill( "death" );
    self enableplayeruse( var_0 );
}

createairdropcrate( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_model", var_3 );
    var_4.curprogress = 0;
    var_4.usetime = 0;
    var_4.userate = 0;
    var_4.team = self.team;

    if ( isdefined( var_0 ) )
        var_4.owner = var_0;
    else
        var_4.owner = undefined;

    var_4.cratetype = var_2;
    var_4.droptype = var_1;
    var_4.targetname = "care_package";
    var_4 setmodel( maps\mp\gametypes\_teams::getteamcratemodel( var_4.team ) );
    var_4 thread crateteammodelupdater();
    var_5 = "com_plasticcase_friendly";

    if ( var_2 == "airdrop_trap" )
    {
        var_5 = "com_plasticcase_trap_friendly";
        var_4 thread trap_createbombsquadmodel();
    }

    var_4.friendlymodel = spawn( "script_model", var_3 );
    var_4.friendlymodel setmodel( var_5 );
    var_4.enemymodel = spawn( "script_model", var_3 );
    var_4.enemymodel setmodel( "com_plasticcase_enemy" );
    var_4.friendlymodel thread deleteonownerdeath( var_4 );

    if ( level.teambased )
        var_4.friendlymodel thread cratemodelteamupdater( var_4.team );
    else
        var_4.friendlymodel thread cratemodelplayerupdater( var_0, 1 );

    var_4.enemymodel thread deleteonownerdeath( var_4 );

    if ( level.teambased )
        var_4.enemymodel thread cratemodelteamupdater( level.otherteam[var_4.team] );
    else
        var_4.enemymodel thread cratemodelplayerupdater( var_0, 0 );

    var_4.inuse = 0;
    var_4 clonebrushmodeltoscriptmodel( level.airdropcratecollision );
    var_4.killcament = spawn( "script_model", var_4.origin + ( 0.0, 0.0, 300.0 ) );
    var_4.killcament setscriptmoverkillcam( "explosive" );
    var_4.killcament linkto( var_4 );
    level.numdropcrates++;
    var_4 thread dropcrateexistence();
    return var_4;
}

dropcrateexistence()
{
    level endon( "game_ended" );
    self waittill( "death" );
    level.numdropcrates--;
}

trap_createbombsquadmodel()
{
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 hide();
    var_1 = level.otherteam[self.team];
    var_0 thread maps\mp\gametypes\_weapons::bombsquadvisibilityupdater( var_1, self.owner );
    var_0 setmodel( "com_plasticcase_trap_bombsquad" );
    var_0 linkto( self );
    var_0 setcontents( 0 );
    self waittill( "death" );
    var_0 delete();
}

cratesetupforuse( var_0, var_1, var_2 )
{
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( var_0 );
    self makeusable();
    self.mode = var_1;

    if ( level.teambased || isdefined( self.owner ) )
    {
        var_3 = maps\mp\gametypes\_gameobjects::getnextobjid();
        objective_add( var_3, "invisible", ( 0.0, 0.0, 0.0 ) );
        objective_position( var_3, self.origin );
        objective_state( var_3, "active" );
        var_4 = "compass_objpoint_ammo_friendly";

        if ( var_1 == "trap" )
            var_4 = "compass_objpoint_trap_friendly";

        objective_icon( var_3, var_4 );

        if ( !level.teambased && isdefined( self.owner ) )
            objective_playerteam( var_3, self.owner getentitynumber() );
        else
            objective_team( var_3, self.team );

        self.objidfriendly = var_3;
    }

    var_3 = maps\mp\gametypes\_gameobjects::getnextobjid();
    objective_add( var_3, "invisible", ( 0.0, 0.0, 0.0 ) );
    objective_position( var_3, self.origin );
    objective_state( var_3, "active" );
    objective_icon( var_3, "compass_objpoint_ammo_enemy" );

    if ( !level.teambased && isdefined( self.owner ) )
        objective_playerenemyteam( var_3, self.owner getentitynumber() );
    else
        objective_team( var_3, level.otherteam[self.team] );

    self.objidenemy = var_3;

    if ( var_1 == "trap" )
        thread crateuseteamupdater( maps\mp\_utility::getotherteam( self.team ) );
    else
    {
        thread crateuseteamupdater();

        if ( issubstr( self.cratetype, "juggernaut" ) )
        {
            foreach ( var_6 in level.players )
            {
                if ( var_6 maps\mp\_utility::isjuggernaut() )
                    thread crateusepostjuggernautupdater( var_6 );
            }
        }

        if ( level.teambased )
            maps\mp\_entityheadicons::setheadicon( self.team, var_2, ( 0.0, 0.0, 24.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
        else if ( isdefined( self.owner ) )
            maps\mp\_entityheadicons::setheadicon( self.owner, var_2, ( 0.0, 0.0, 24.0 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
    }

    thread crateusejuggernautupdater();
}

setusablebyteam( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( issubstr( self.cratetype, "juggernaut" ) && var_2 maps\mp\_utility::isjuggernaut() )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( !level.teambased && self.mode == "trap" )
        {
            if ( isdefined( self.owner ) && var_2 == self.owner )
                self disableplayeruse( var_2 );
            else
                self enableplayeruse( var_2 );

            continue;
        }

        if ( !isdefined( var_0 ) || var_0 == var_2.team )
        {
            self enableplayeruse( var_2 );
            continue;
        }

        self disableplayeruse( var_2 );
    }
}

dropthecrate( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = [];
    self.owner endon( "disconnect" );

    if ( !isdefined( var_4 ) )
    {
        if ( isdefined( var_7 ) )
        {
            var_10 = undefined;
            var_11 = undefined;

            for ( var_12 = 0; var_12 < 100; var_12++ )
            {
                var_11 = getcratetypefordroptype( var_1 );
                var_10 = 0;

                for ( var_13 = 0; var_13 < var_7.size; var_13++ )
                {
                    if ( var_11 == var_7[var_13] )
                    {
                        var_10 = 1;
                        break;
                    }
                }

                if ( var_10 == 0 )
                    break;
            }

            if ( var_10 == 1 )
                var_11 = getcratetypefordroptype( var_1 );
        }
        else
            var_11 = getcratetypefordroptype( var_1 );
    }
    else
        var_11 = var_4;

    if ( !isdefined( var_6 ) )
        var_6 = ( randomint( 5 ), randomint( 5 ), randomint( 5 ) );

    var_9 = createairdropcrate( self.owner, var_1, var_11, var_5 );

    switch ( var_1 )
    {
        case "airdrop_juggernaut":
        case "airdrop_juggernaut_recon":
        case "airdrop_mega":
        case "nuke_drop":
            var_9 linkto( self, "tag_ground", ( 64.0, 32.0, -128.0 ), ( 0.0, 0.0, 0.0 ) );
            break;
        case "airdrop_escort":
        case "airdrop_osprey_gunner":
            var_9 linkto( self, var_8, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
            break;
        default:
            var_9 linkto( self, "tag_ground", ( 32.0, 0.0, 5.0 ), ( 0.0, 0.0, 0.0 ) );
            break;
    }

    var_9.angles = ( 0.0, 0.0, 0.0 );
    var_9 show();
    var_14 = self.veh_speed;
    thread waitfordropcratemsg( var_9, var_6, var_1, var_11 );
    return var_11;
}

waitfordropcratemsg( var_0, var_1, var_2, var_3 )
{
    self waittill( "drop_crate" );
    var_0 unlink();
    var_0 physicslaunchserver( ( 0.0, 0.0, 0.0 ), var_1 );
    var_0 thread physicswaiter( var_2, var_3 );

    if ( isdefined( var_0.killcament ) )
    {
        var_0.killcament unlink();
        var_4 = bullettrace( var_0.origin, var_0.origin + ( 0.0, 0.0, -10000.0 ), 0, var_0 );
        var_5 = distance( var_0.origin, var_4["position"] );
        var_6 = var_5 / 800;
        var_0.killcament moveto( var_4["position"] + ( 0.0, 0.0, 300.0 ), var_6 );
    }
}

physicswaiter( var_0, var_1 )
{
    self waittill( "physics_finished" );
    self thread [[ level.cratefuncs[var_0][var_1] ]]( var_0 );
    level thread droptimeout( self, self.owner, var_1 );

    if ( abs( self.origin[2] - level.lowspawn.origin[2] ) > 3000 )
        deletecrate();
}

droptimeout( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( var_0.droptype == "nuke_drop" )
        return;

    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 90.0 );

    while ( var_0.curprogress != 0 )
        wait 1;

    var_0 deletecrate();
}

getpathstart( var_0, var_1 )
{
    var_2 = 100;
    var_3 = 15000;
    var_4 = ( 0, var_1, 0 );
    var_5 = var_0 + anglestoforward( var_4 ) * ( -1 * var_3 );
    var_5 += ( ( randomfloat( 2 ) - 1 ) * var_2, ( randomfloat( 2 ) - 1 ) * var_2, 0 );
    return var_5;
}

getpathend( var_0, var_1 )
{
    var_2 = 150;
    var_3 = 15000;
    var_4 = ( 0, var_1, 0 );
    var_5 = var_0 + anglestoforward( var_4 + ( 0.0, 90.0, 0.0 ) ) * var_3;
    var_5 += ( ( randomfloat( 2 ) - 1 ) * var_2, ( randomfloat( 2 ) - 1 ) * var_2, 0 );
    return var_5;
}

getflyheightoffset( var_0 )
{
    var_1 = 850;
    var_2 = getent( "airstrikeheight", "targetname" );

    if ( !isdefined( var_2 ) )
    {
        if ( isdefined( level.airstrikeheightscale ) )
        {
            if ( level.airstrikeheightscale > 2 )
            {
                var_1 = 1500;
                return var_1 * level.airstrikeheightscale;
            }

            return var_1 * level.airstrikeheightscale + 256 + var_0[2];
        }
        else
            return var_1 + var_0[2];
    }
    else
        return var_2.origin[2];
}

doflyby( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_6 = getflyheightoffset( var_1 );

    if ( isdefined( var_4 ) )
        var_6 += var_4;

    foreach ( var_8 in level.littlebirds )
    {
        if ( isdefined( var_8.droptype ) )
            var_6 += 128;
    }

    var_10 = var_1 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_6 );
    var_11 = getpathstart( var_10, var_2 );
    var_12 = getpathend( var_10, var_2 );
    var_10 += anglestoforward( ( 0, var_2, 0 ) ) * -50;
    var_13 = helisetup( var_0, var_11, var_10 );
    var_13 endon( "death" );

    if ( !isdefined( var_5 ) )
        var_5 = undefined;

    var_13.droptype = var_3;
    var_13 setvehgoalpos( var_10, 1 );
    var_13 thread dropthecrate( var_1, var_3, var_6, 0, var_5, var_11 );
    wait 2;
    var_13 vehicle_setspeed( 75, 40 );
    var_13 setyawspeed( 180, 180, 180, 0.3 );
    var_13 waittill( "goal" );
    wait 0.1;
    var_13 notify( "drop_crate" );
    var_13 setvehgoalpos( var_12, 1 );
    var_13 vehicle_setspeed( 300, 75 );
    var_13.leaving = 1;
    var_13 waittill( "goal" );
    var_13 notify( "leaving" );
    var_13 notify( "delete" );
    maps\mp\_utility::decrementfauxvehiclecount();
    var_13 delete();
}

domegaflyby( var_0, var_1, var_2, var_3 )
{
    level thread doflyby( var_0, var_1, var_2, var_3, 0 );
    wait(randomintrange( 1, 2 ));
    level thread doflyby( var_0, var_1 + ( 128.0, 128.0, 0.0 ), var_2, var_3, 128 );
    wait(randomintrange( 1, 2 ));
    level thread doflyby( var_0, var_1 + ( 172.0, 256.0, 0.0 ), var_2, var_3, 256 );
    wait(randomintrange( 1, 2 ));
    level thread doflyby( var_0, var_1 + ( 64.0, 0.0, 0.0 ), var_2, var_3, 0 );
}

doc130flyby( var_0, var_1, var_2, var_3 )
{
    var_4 = 18000;
    var_5 = 3000;
    var_6 = vectortoyaw( var_1 - var_0.origin );
    var_7 = ( 0, var_6, 0 );
    var_8 = getflyheightoffset( var_1 );
    var_9 = var_1 + anglestoforward( var_7 ) * ( -1 * var_4 );
    var_9 = var_9 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_8 );
    var_10 = var_1 + anglestoforward( var_7 ) * var_4;
    var_10 = var_10 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_8 );
    var_11 = length( var_9 - var_10 );
    var_12 = var_11 / var_5;
    var_13 = c130setup( var_0, var_9, var_10 );
    var_13.veh_speed = var_5;
    var_13.droptype = var_3;
    var_13 playloopsound( "veh_ac130_dist_loop" );
    var_13.angles = var_7;
    var_14 = anglestoforward( var_7 );
    var_13 moveto( var_10, var_12, 0, 0 );
    var_15 = distance2d( var_13.origin, var_1 );
    var_16 = 0;

    for (;;)
    {
        var_17 = distance2d( var_13.origin, var_1 );

        if ( var_17 < var_15 )
            var_15 = var_17;
        else if ( var_17 > var_15 )
            break;

        if ( var_17 < 320 )
            break;
        else if ( var_17 < 768 )
        {
            earthquake( 0.15, 1.5, var_1, 1500 );

            if ( !var_16 )
            {
                var_13 playsound( "veh_ac130_sonic_boom" );
                var_16 = 1;
            }
        }

        wait 0.05;
    }

    wait 0.05;
    var_18 = ( 0.25, 0.0, 0.0 );
    var_19[0] = var_13 thread dropthecrate( var_1, var_3, var_8, 0, undefined, var_9, var_18 );
    wait 0.05;
    var_13 notify( "drop_crate" );
    var_20 = var_1 + anglestoforward( var_7 ) * ( var_4 * 1.5 );
    var_13 moveto( var_20, var_12 / 2, 0, 0 );
    wait 6;
    var_13 delete();
}

domegac130flyby( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 24000;
    var_6 = 2000;
    var_7 = vectortoyaw( var_1 - var_0.origin );
    var_8 = ( 0, var_7, 0 );
    var_9 = anglestoforward( var_8 );

    if ( isdefined( var_4 ) )
        var_1 += var_9 * var_4;

    var_10 = getflyheightoffset( var_1 );
    var_11 = var_1 + anglestoforward( var_8 ) * ( -1 * var_5 );
    var_11 = var_11 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_10 );
    var_12 = var_1 + anglestoforward( var_8 ) * var_5;
    var_12 = var_12 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_10 );
    var_13 = length( var_11 - var_12 );
    var_14 = var_13 / var_6;
    var_15 = c130setup( var_0, var_11, var_12 );
    var_15.veh_speed = var_6;
    var_15.droptype = var_3;
    var_15 playloopsound( "veh_ac130_dist_loop" );
    var_15.angles = var_8;
    var_9 = anglestoforward( var_8 );
    var_15 moveto( var_12, var_14, 0, 0 );
    var_16 = distance2d( var_15.origin, var_1 );
    var_17 = 0;

    for (;;)
    {
        var_18 = distance2d( var_15.origin, var_1 );

        if ( var_18 < var_16 )
            var_16 = var_18;
        else if ( var_18 > var_16 )
            break;

        if ( var_18 < 256 )
            break;
        else if ( var_18 < 768 )
        {
            earthquake( 0.15, 1.5, var_1, 1500 );

            if ( !var_17 )
            {
                var_15 playsound( "veh_ac130_sonic_boom" );
                var_17 = 1;
            }
        }

        wait 0.05;
    }

    wait 0.05;
    var_19[0] = var_15 thread dropthecrate( var_1, var_3, var_10, 0, undefined, var_11 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 0.05;
    var_19[1] = var_15 thread dropthecrate( var_1, var_3, var_10, 0, undefined, var_11, undefined, var_19 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 0.05;
    var_19[2] = var_15 thread dropthecrate( var_1, var_3, var_10, 0, undefined, var_11, undefined, var_19 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 0.05;
    var_19[3] = var_15 thread dropthecrate( var_1, var_3, var_10, 0, undefined, var_11, undefined, var_19 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 4;
    var_15 delete();
}

dropnuke( var_0, var_1, var_2 )
{
    var_3 = 24000;
    var_4 = 2000;
    var_5 = randomint( 360 );
    var_6 = ( 0, var_5, 0 );
    var_7 = getflyheightoffset( var_0 );
    var_8 = var_0 + anglestoforward( var_6 ) * ( -1 * var_3 );
    var_8 = var_8 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_7 );
    var_9 = var_0 + anglestoforward( var_6 ) * var_3;
    var_9 = var_9 * ( 1.0, 1.0, 0.0 ) + ( 0, 0, var_7 );
    var_10 = length( var_8 - var_9 );
    var_11 = var_10 / var_4;
    var_12 = c130setup( var_1, var_8, var_9 );
    var_12.veh_speed = var_4;
    var_12.droptype = var_2;
    var_12 playloopsound( "veh_ac130_dist_loop" );
    var_12.angles = var_6;
    var_13 = anglestoforward( var_6 );
    var_12 moveto( var_9, var_11, 0, 0 );
    var_14 = 0;
    var_15 = distance2d( var_12.origin, var_0 );

    for (;;)
    {
        var_16 = distance2d( var_12.origin, var_0 );

        if ( var_16 < var_15 )
            var_15 = var_16;
        else if ( var_16 > var_15 )
            break;

        if ( var_16 < 256 )
            break;
        else if ( var_16 < 768 )
        {
            earthquake( 0.15, 1.5, var_0, 1500 );

            if ( !var_14 )
            {
                var_12 playsound( "veh_ac130_sonic_boom" );
                var_14 = 1;
            }
        }

        wait 0.05;
    }

    var_12 thread dropthecrate( var_0, var_2, var_7, 0, "nuke", var_8 );
    wait 0.05;
    var_12 notify( "drop_crate" );
    wait 4;
    var_12 delete();
}

stoploopafter( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self stoploopsound();
}

playlooponent( var_0 )
{
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 hide();
    var_1 endon( "death" );
    thread common_scripts\utility::delete_on_death( var_1 );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 linkto( self );
    var_1 playloopsound( var_0 );
    self waittill( "stop sound" + var_0 );
    var_1 stoploopsound( var_0 );
    var_1 delete();
}

c130setup( var_0, var_1, var_2 )
{
    var_3 = vectortoangles( var_2 - var_1 );
    var_4 = spawnplane( var_0, "script_model", var_1, "compass_objpoint_c130_friendly", "compass_objpoint_c130_enemy" );
    var_4 setmodel( "vehicle_ac130_low_mp" );

    if ( !isdefined( var_4 ) )
        return;

    var_4.owner = var_0;
    var_4.team = var_0.team;
    level.c130 = var_4;
    return var_4;
}

helisetup( var_0, var_1, var_2 )
{
    var_3 = vectortoangles( var_2 - var_1 );
    var_4 = spawnhelicopter( var_0, var_1, var_3, "littlebird_mp", "vehicle_little_bird_armed" );

    if ( !isdefined( var_4 ) )
        return;

    var_4 maps\mp\killstreaks\_helicopter::addtolittlebirdlist();
    var_4 thread maps\mp\killstreaks\_helicopter::removefromlittlebirdlistondeath();
    var_4.health = 999999;
    var_4.maxhealth = 500;
    var_4.damagetaken = 0;
    var_4 setcandamage( 1 );
    var_4.owner = var_0;
    var_4.team = var_0.team;
    var_4.isairdrop = 1;
    var_4 thread watchtimeout();
    var_4 thread heli_existence();
    var_4 thread helidestroyed();
    var_4 thread heli_handledamage();
    var_4 setmaxpitchroll( 45, 85 );
    var_4 vehicle_setspeed( 250, 175 );
    var_4.helitype = "airdrop";
    var_4.specialdamagecallback = ::callback_vehicledamage;
    return var_4;
}

watchtimeout()
{
    level endon( "game_ended" );
    self endon( "leaving" );
    self endon( "helicopter_gone" );
    self endon( "death" );
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 25.0 );
    self notify( "death" );
}

heli_existence()
{
    common_scripts\utility::waittill_any( "crashing", "leaving" );
    self notify( "helicopter_gone" );
}

heli_handledamage()
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
                var_12 = self.maxhealth * 0.5;
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

helidestroyed()
{
    self endon( "leaving" );
    self endon( "helicopter_gone" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self vehicle_setspeed( 25, 5 );
    thread lbspin( randomintrange( 180, 220 ) );
    wait(randomfloatrange( 0.5, 1.5 ));
    self notify( "drop_crate" );
    lbexplode();
}

lbexplode()
{
    var_0 = self.origin + ( 0.0, 0.0, 1.0 ) - self.origin;
    playfx( level.chopper_fx["explode"]["death"]["cobra"], self.origin, var_0 );
    self playsound( "cobra_helicopter_crash" );
    self notify( "explode" );
    self delete();
}

lbspin( var_0 )
{
    self endon( "explode" );
    playfxontag( level.chopper_fx["explode"]["medium"], self, "tail_rotor_jnt" );
    playfxontag( level.chopper_fx["fire"]["trail"]["medium"], self, "tail_rotor_jnt" );
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self settargetyaw( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

nukecapturethink()
{
    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_0 );

        if ( !var_0 isonground() )
            continue;

        if ( !useholdthink( var_0 ) )
            continue;

        self notify( "captured", var_0 );
    }
}

crateothercapturethink( var_0 )
{
    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( self.owner ) && var_1 == self.owner )
            continue;

        if ( !validateopenconditions( var_1 ) )
            continue;

        var_1.iscapturingcrate = 1;
        var_2 = createuseent();
        var_3 = var_2 useholdthink( var_1, undefined, var_0 );

        if ( isdefined( var_2 ) )
            var_2 delete();

        if ( !var_3 )
        {
            var_1.iscapturingcrate = 0;
            continue;
        }

        var_1.iscapturingcrate = 0;
        self notify( "captured", var_1 );
    }
}

crateownercapturethink( var_0 )
{
    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
            continue;

        if ( !validateopenconditions( var_1 ) )
            continue;

        var_1.iscapturingcrate = 1;

        if ( !useholdthink( var_1, 500, var_0 ) )
        {
            var_1.iscapturingcrate = 0;
            continue;
        }

        var_1.iscapturingcrate = 0;
        self notify( "captured", var_1 );
    }
}

validateopenconditions( var_0 )
{
    if ( ( self.cratetype == "airdrop_juggernaut_def" || self.cratetype == "airdrop_juggernaut" ) && var_0 maps\mp\_utility::isjuggernaut() )
        return 0;

    var_1 = var_0 getcurrentweapon();

    if ( maps\mp\_utility::iskillstreakweapon( var_1 ) && !issubstr( var_1, "jugg_mp" ) )
        return 0;

    if ( isdefined( var_0.changingweapon ) && maps\mp\_utility::iskillstreakweapon( var_0.changingweapon ) && !issubstr( var_0.changingweapon, "jugg_mp" ) )
        return 0;

    return 1;
}

killstreakcratethink( var_0 )
{
    self endon( "death" );

    if ( isdefined( game["strings"][self.cratetype + "_hint"] ) )
        var_1 = game["strings"][self.cratetype + "_hint"];
    else
        var_1 = &"PLATFORM_GET_KILLSTREAK";

    cratesetupforuse( var_1, "all", maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( self.cratetype ) );
    thread crateothercapturethink();
    thread crateownercapturethink();

    for (;;)
    {
        self waittill( "captured", var_2 );

        if ( isdefined( self.owner ) && var_2 != self.owner )
        {
            if ( !level.teambased || var_2.team != self.team )
            {
                switch ( var_0 )
                {
                    case "airdrop_assault":
                    case "airdrop_escort":
                    case "airdrop_osprey_gunner":
                    case "airdrop_support":
                        var_2 thread maps\mp\gametypes\_missions::genericchallenge( "hijacker_airdrop" );
                        var_2 thread hijacknotify( self, "airdrop" );
                        break;
                    case "airdrop_sentry_minigun":
                        var_2 thread maps\mp\gametypes\_missions::genericchallenge( "hijacker_airdrop" );
                        var_2 thread hijacknotify( self, "sentry" );
                        break;
                    case "airdrop_remote_tank":
                        var_2 thread maps\mp\gametypes\_missions::genericchallenge( "hijacker_airdrop" );
                        var_2 thread hijacknotify( self, "remote_tank" );
                        break;
                    case "airdrop_mega":
                        var_2 thread maps\mp\gametypes\_missions::genericchallenge( "hijacker_airdrop_mega" );
                        var_2 thread hijacknotify( self, "emergency_airdrop" );
                        break;
                }
            }
            else
            {
                self.owner thread maps\mp\gametypes\_rank::giverankxp( "killstreak_giveaway", int( maps\mp\killstreaks\_killstreaks::getstreakcost( self.cratetype ) / 10 * 50 ) );
                self.owner thread maps\mp\gametypes\_hud_message::splashnotifydelayed( "sharepackage", int( maps\mp\killstreaks\_killstreaks::getstreakcost( self.cratetype ) / 10 * 50 ) );
            }
        }

        var_2 playlocalsound( "ammo_crate_use" );
        var_2 thread maps\mp\killstreaks\_killstreaks::givekillstreak( self.cratetype, 0, 0, self.owner );
        deletecrate();
    }
}

nukecratethink( var_0 )
{
    self endon( "death" );
    cratesetupforuse( &"PLATFORM_CALL_NUKE", "nukeDrop", maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( self.cratetype ) );
    thread nukecapturethink();

    for (;;)
    {
        self waittill( "captured", var_1 );
        var_1 thread [[ level.killstreakfuncs[self.cratetype] ]]( level.gtnw );
        level notify( "nukeCaptured", var_1 );

        if ( isdefined( level.gtnw ) && level.gtnw )
            var_1.capturednuke = 1;

        var_1 playlocalsound( "ammo_crate_use" );
        deletecrate();
    }
}

trophycratethink( var_0 )
{
    self endon( "death" );
    cratesetupforuse( game["strings"]["trophy_hint"], "all", maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( self.cratetype ) );
    thread crateothercapturethink();
    thread crateownercapturethink();

    for (;;)
    {
        self waittill( "captured", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
        {
            if ( !level.teambased || var_1.team != self.team )
                var_1 thread hijacknotify( self, "trophy" );
            else
            {
                self.owner thread maps\mp\gametypes\_rank::giverankxp( "killstreak_giveaway", int( maps\mp\killstreaks\_killstreaks::getstreakcost( "airdrop_trophy" ) / 10 ) * 50 );
                self.owner maps\mp\gametypes\_hud_message::playercardsplashnotify( "giveaway_trophy", var_1 );
            }
        }

        var_1 playlocalsound( "ammo_crate_use" );
        var_1 thread givelocaltrophy( var_0 );
        deletecrate();
    }
}

juggernautcratethink( var_0 )
{
    self endon( "death" );
    cratesetupforuse( game["strings"]["juggernaut_hint"], "all", maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( self.cratetype ) );
    thread crateothercapturethink();
    thread crateownercapturethink();

    for (;;)
    {
        self waittill( "captured", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
        {
            if ( !level.teambased || var_1.team != self.team )
                var_1 thread hijacknotify( self, "juggernaut" );
            else
            {
                self.owner thread maps\mp\gametypes\_rank::giverankxp( "killstreak_giveaway", int( maps\mp\killstreaks\_killstreaks::getstreakcost( self.cratetype ) / 10 ) * 50 );
                self.owner maps\mp\gametypes\_hud_message::playercardsplashnotify( "giveaway_juggernaut", var_1 );
            }
        }

        var_1 playlocalsound( "ammo_crate_use" );
        var_2 = "juggernaut";

        switch ( self.cratetype )
        {
            case "airdrop_juggernaut":
                var_2 = "juggernaut";
                break;
            case "airdrop_juggernaut_recon":
                var_2 = "juggernaut_recon";
                break;
        }

        var_1 thread maps\mp\killstreaks\_juggernaut::givejuggernaut( var_2 );
        deletecrate();
    }
}

sentrycratethink( var_0 )
{
    self endon( "death" );
    cratesetupforuse( game["strings"]["sentry_hint"], "all", maps\mp\killstreaks\_killstreaks::getkillstreakcrateicon( self.cratetype ) );
    thread crateothercapturethink();
    thread crateownercapturethink();

    for (;;)
    {
        self waittill( "captured", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
        {
            if ( !level.teambased || var_1.team != self.team )
            {
                if ( issubstr( var_0, "airdrop_sentry" ) )
                    var_1 thread hijacknotify( self, "sentry" );
                else
                    var_1 thread hijacknotify( self, "emergency_airdrop" );
            }
            else
            {
                self.owner thread maps\mp\gametypes\_rank::giverankxp( "killstreak_giveaway", int( maps\mp\killstreaks\_killstreaks::getstreakcost( "sentry" ) / 10 ) * 50 );
                self.owner maps\mp\gametypes\_hud_message::playercardsplashnotify( "giveaway_sentry", var_1 );
            }
        }

        var_1 playlocalsound( "ammo_crate_use" );
        var_1 thread sentryusetracker();
        deletecrate();
    }
}

trapnullfunc()
{

}

trapcratethink( var_0 )
{
    self endon( "death" );
    var_1 = getrandomcratetype( "airdrop_trapcontents" );
    cratesetupforuse( game["strings"][var_1 + "_hint"], "trap", "none" );
    self.bomb = spawn( "script_model", self.origin );
    var_2 = bullettrace( self.bomb.origin, self.bomb.origin + ( 100.0, 100.0, 128.0 ), 0, self.bomb );
    self.bomb.killcament = spawn( "script_model", var_2["position"] );
    self.bomb.killcament setscriptmoverkillcam( "explosive" );
    thread crateothercapturethink();

    for (;;)
    {
        self waittill( "captured", var_3 );
        var_3 thread detonatetrap( self.bomb, self, self.owner );
    }
}

detonatetrap( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_0 rotatevelocity( ( 0.0, 300.0, 0.0 ), 3 );
    var_0 setmodel( "prop_suitcase_bomb" );
    var_3 = var_1.origin;
    thread common_scripts\utility::play_sound_in_space( "javelin_clu_lock", var_3 );
    wait 1.0;
    var_4 = var_3 + ( 0.0, 0.0, 1.0 ) - var_3;
    playfx( level.chopper_fx["explode"]["death"]["cobra"], var_3, var_4 );
    thread common_scripts\utility::play_sound_in_space( "cobra_helicopter_crash", var_3 );

    if ( isdefined( var_2 ) )
        var_0 radiusdamage( var_3, 400, 200, 50, var_2, "MOD_EXPLOSIVE", "airdrop_trap_explosive_mp" );
    else
        var_0 radiusdamage( var_3, 400, 200, 50, undefined, "MOD_EXPLOSIVE", "airdrop_trap_explosive_mp" );

    var_1 deletecrate();
}

deletecrate()
{
    if ( isdefined( self.objidfriendly ) )
        maps\mp\_utility::_objective_delete( self.objidfriendly );

    if ( isdefined( self.objidenemy ) )
        maps\mp\_utility::_objective_delete( self.objidenemy );

    if ( isdefined( self.bomb ) && isdefined( self.bomb.killcament ) )
        self.bomb.killcament delete();

    if ( isdefined( self.bomb ) )
        self.bomb delete();

    if ( isdefined( self.killcament ) )
        self.killcament delete();

    self delete();
}

sentryusetracker()
{
    if ( !maps\mp\killstreaks\_autosentry::givesentry( "sentry_minigun" ) )
        maps\mp\killstreaks\_killstreaks::givekillstreak( "sentry" );
}

givelocaltrophy( var_0 )
{
    self.activetrophy = 1;
    self.trophyammo = 6;
    thread personaltrophyactive();
}

hijacknotify( var_0, var_1 )
{
    self notify( "hijacker", var_1, var_0.owner );
}

refillammo( var_0 )
{
    var_1 = self getweaponslistall();

    if ( var_0 )
    {
        if ( maps\mp\_utility::_hasperk( "specialty_tacticalinsertion" ) && self getammocount( "flare_mp" ) < 1 )
            maps\mp\_utility::giveperk( "specialty_tacticalinsertion", 0 );

        if ( maps\mp\_utility::_hasperk( "specialty_scrambler" ) && self getammocount( "scrambler_mp" ) < 1 )
            maps\mp\_utility::giveperk( "specialty_scrambler", 0 );

        if ( maps\mp\_utility::_hasperk( "specialty_portable_radar" ) && self getammocount( "portable_radar_mp" ) < 1 )
            maps\mp\_utility::giveperk( "specialty_portable_radar", 0 );
    }

    foreach ( var_3 in var_1 )
    {
        if ( issubstr( var_3, "grenade" ) || getsubstr( var_3, 0, 2 ) == "gl" )
        {
            if ( !var_0 || self getammocount( var_3 ) >= 1 )
                continue;
        }

        self givemaxammo( var_3 );
    }
}

useholdthink( var_0, var_1, var_2 )
{
    var_0 playerlinkto( self );
    var_0 playerlinkedoffsetenable();
    var_0 common_scripts\utility::_disableweapon();
    self.curprogress = 0;
    self.inuse = 1;
    self.userate = 0;

    if ( isdefined( var_1 ) )
        self.usetime = var_1;
    else
        self.usetime = 3000;

    var_0 thread personalusebar( self, var_2 );
    var_3 = useholdthinkloop( var_0 );

    if ( isalive( var_0 ) )
    {
        var_0 common_scripts\utility::_enableweapon();
        var_0 unlink();
    }

    if ( !isdefined( self ) )
        return 0;

    self.inuse = 0;
    self.curprogress = 0;
    return var_3;
}

personalusebar( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = maps\mp\gametypes\_hud_util::createprimaryprogressbar( 0, 25 );
    var_3 = maps\mp\gametypes\_hud_util::createprimaryprogressbartext( 0, 25 );

    if ( !isdefined( var_1 ) )
        var_1 = &"MP_CAPTURING_CRATE";

    var_3 settext( var_1 );
    var_4 = -1;

    while ( maps\mp\_utility::isreallyalive( self ) && isdefined( var_0 ) && var_0.inuse && !level.gameended )
    {
        if ( var_4 != var_0.userate )
        {
            if ( var_0.curprogress > var_0.usetime )
                var_0.curprogress = var_0.usetime;

            var_2 maps\mp\gametypes\_hud_util::updatebar( var_0.curprogress / var_0.usetime, 1000 / var_0.usetime * var_0.userate );

            if ( !var_0.userate )
            {
                var_2 maps\mp\gametypes\_hud_util::hideelem();
                var_3 maps\mp\gametypes\_hud_util::hideelem();
            }
            else
            {
                var_2 maps\mp\gametypes\_hud_util::showelem();
                var_3 maps\mp\gametypes\_hud_util::showelem();
            }
        }

        var_4 = var_0.userate;
        wait 0.05;
    }

    var_2 maps\mp\gametypes\_hud_util::destroyelem();
    var_3 maps\mp\gametypes\_hud_util::destroyelem();
}

useholdthinkloop( var_0 )
{
    while ( !level.gameended && isdefined( self ) && maps\mp\_utility::isreallyalive( var_0 ) && var_0 usebuttonpressed() && self.curprogress < self.usetime )
    {
        self.curprogress += 50 * self.userate;

        if ( isdefined( self.objectivescaler ) )
            self.userate = 1 * self.objectivescaler;
        else
            self.userate = 1;

        if ( self.curprogress >= self.usetime )
            return maps\mp\_utility::isreallyalive( var_0 );

        wait 0.05;
    }

    return 0;
}

isairdropmarker( var_0 )
{
    switch ( var_0 )
    {
        case "airdrop_marker_mp":
        case "airdrop_mega_marker_mp":
        case "airdrop_sentry_marker_mp":
        case "airdrop_juggernaut_mp":
        case "airdrop_juggernaut_def_mp":
        case "airdrop_tank_marker_mp":
        case "airdrop_trap_marker_mp":
        case "airdrop_escort_marker_mp":
            return 1;
        default:
            return 0;
    }
}

createuseent()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0.curprogress = 0;
    var_0.usetime = 0;
    var_0.userate = 3000;
    var_0.inuse = 0;
    var_0 thread deleteuseent( self );
    return var_0;
}

deleteuseent( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

airdropdetonateonstuck()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    self detonate();
}

projectileexplode( var_0 )
{
    self endon( "death" );
    var_1 = var_0.origin;
    var_2 = var_0.model;
    var_3 = var_0.angles;
    var_0 delete();
    playfx( level.mine_explode, var_1, anglestoforward( var_3 ), anglestoup( var_3 ) );
    radiusdamage( var_1, 65, 75, 10, self );
}

personaltrophyactive()
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        if ( !isdefined( level.grenades ) || level.grenades.size < 1 )
        {
            wait 0.05;
            continue;
        }

        var_1 = maps\mp\_utility::combinearrays( level.grenades, level.missiles );

        foreach ( var_3 in var_1 )
        {
            wait 0.05;

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3 == self )
                continue;

            if ( isdefined( var_3.weaponname ) && var_3.weaponname == "trophy_mp" )
                continue;

            if ( var_3.model == "weapon_parabolic_knife" )
                continue;

            if ( !isdefined( var_3.owner ) )
                var_3.owner = getmissileowner( var_3 );

            if ( isdefined( var_3.owner ) && level.teambased && var_3.owner.team == self.team )
                continue;

            var_4 = distancesquared( var_3.origin, self.origin );

            if ( var_4 < 147456 )
            {
                if ( bullettracepassed( var_3.origin, self.origin, 0, self ) )
                {
                    playfx( level.sentry_fire, self.origin + ( 0.0, 0.0, 32.0 ), var_3.origin - self.origin, anglestoup( self.angles ) );
                    thread projectileexplode( var_3 );
                    self.trophyammo--;

                    if ( self.trophyammo <= 0 )
                        return;
                }
            }
        }
    }
}
