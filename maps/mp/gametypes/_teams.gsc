// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    initscoreboard();
    level.teambalance = getdvarint( "scr_teambalance" );
    level.maxclients = getdvarint( "sv_maxclients" );
    level._effect["thermal_beacon"] = loadfx( "misc/thermal_beacon_inverted" );
    var_0 = level._effect["thermal_beacon"];
    precachefxteamthermal( var_0, "J_Spine4" );
    setplayermodels();
    level.freeplayers = [];

    if ( level.teambased )
    {
        level thread onplayerconnect();
        level thread updateteambalance();
        wait 0.15;
        level thread updateplayertimes();
    }
    else
    {
        level thread onfreeplayerconnect();
        wait 0.15;
        level thread updatefreeplayertimes();
    }
}

initscoreboard()
{
    setdvar( "g_TeamName_Allies", getteamshortname( "allies" ) );
    setdvar( "g_TeamIcon_Allies", getteamicon( "allies" ) );
    setdvar( "g_TeamIcon_MyAllies", getteamicon( "allies" ) );
    setdvar( "g_TeamIcon_EnemyAllies", getteamicon( "allies" ) );
    var_0 = getteamcolor( "allies" );
    setdvar( "g_ScoresColor_Allies", var_0[0] + " " + var_0[1] + " " + var_0[2] );
    setdvar( "g_TeamName_Axis", getteamshortname( "axis" ) );
    setdvar( "g_TeamIcon_Axis", getteamicon( "axis" ) );
    setdvar( "g_TeamIcon_MyAxis", getteamicon( "axis" ) );
    setdvar( "g_TeamIcon_EnemyAxis", getteamicon( "axis" ) );
    var_0 = getteamcolor( "axis" );
    setdvar( "g_ScoresColor_Axis", var_0[0] + " " + var_0[1] + " " + var_0[2] );
    setdvar( "g_ScoresColor_Spectator", ".25 .25 .25" );
    setdvar( "g_ScoresColor_Free", ".76 .78 .10" );
    setdvar( "g_teamTitleColor_MyTeam", ".6 .8 .6" );
    setdvar( "g_teamTitleColor_EnemyTeam", "1 .45 .5" );
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onjoinedteam();
        var_0 thread onjoinedspectators();
        var_0 thread onplayerspawned();
        var_0 thread trackplayedtime();
    }
}

onfreeplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread trackfreeplayedtime();
    }
}

onjoinedteam()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        updateteamtime();
    }
}

onjoinedspectators()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        self.pers["teamTime"] = undefined;
    }
}

trackplayedtime()
{
    self endon( "disconnect" );
    self.timeplayed["allies"] = 0;
    self.timeplayed["axis"] = 0;
    self.timeplayed["free"] = 0;
    self.timeplayed["other"] = 0;
    self.timeplayed["total"] = 0;
    maps\mp\_utility::gameflagwait( "prematch_done" );

    for (;;)
    {
        if ( game["state"] == "playing" )
        {
            if ( self.sessionteam == "allies" )
            {
                self.timeplayed["allies"]++;
                self.timeplayed["total"]++;
            }
            else if ( self.sessionteam == "axis" )
            {
                self.timeplayed["axis"]++;
                self.timeplayed["total"]++;
            }
            else if ( self.sessionteam == "spectator" )
                self.timeplayed["other"]++;
        }

        wait 1.0;
    }
}

updateplayertimes()
{
    if ( !level.rankedmatch )
        return;

    level endon( "game_ended" );

    for (;;)
    {
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();

        foreach ( var_1 in level.players )
            var_1 updateplayedtime();

        wait 1.0;
    }
}

updateplayedtime()
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    if ( self.timeplayed["allies"] )
    {
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedAllies", self.timeplayed["allies"] );
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedTotal", self.timeplayed["allies"] );
        maps\mp\gametypes\_persistence::stataddchildbuffered( "round", "timePlayed", self.timeplayed["allies"] );

        if ( !self.prestigedoublexp )
        {
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 0, self.timeplayed["allies"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 1, self.timeplayed["allies"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 2, self.timeplayed["allies"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] );
        }

        maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "challengeXPMultiplierTimePlayed", 0, self.timeplayed["allies"], self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][0] );
        maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "weaponXPMultiplierTimePlayed", 0, self.timeplayed["allies"], self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][0] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleXpTimePlayed", self.timeplayed["allies"], self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleWeaponXpTimePlayed", self.timeplayed["allies"], self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] );
    }

    if ( self.timeplayed["axis"] )
    {
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedOpfor", self.timeplayed["axis"] );
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedTotal", self.timeplayed["axis"] );
        maps\mp\gametypes\_persistence::stataddchildbuffered( "round", "timePlayed", self.timeplayed["axis"] );

        if ( !self.prestigedoublexp )
        {
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 0, self.timeplayed["axis"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 1, self.timeplayed["axis"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 2, self.timeplayed["axis"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] );
        }

        maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "challengeXPMultiplierTimePlayed", 0, self.timeplayed["axis"], self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][0] );
        maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "weaponXPMultiplierTimePlayed", 0, self.timeplayed["axis"], self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][0] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleXpTimePlayed", self.timeplayed["axis"], self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleWeaponXpTimePlayed", self.timeplayed["axis"], self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] );
    }

    if ( self.timeplayed["other"] )
    {
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedOther", self.timeplayed["other"] );
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedTotal", self.timeplayed["other"] );
        maps\mp\gametypes\_persistence::stataddchildbuffered( "round", "timePlayed", self.timeplayed["other"] );

        if ( !self.prestigedoublexp )
        {
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 0, self.timeplayed["other"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 1, self.timeplayed["other"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 2, self.timeplayed["other"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] );
        }

        maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "challengeXPMultiplierTimePlayed", 0, self.timeplayed["other"], self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][0] );
        maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "weaponXPMultiplierTimePlayed", 0, self.timeplayed["other"], self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][0] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleXpTimePlayed", self.timeplayed["other"], self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleWeaponXpTimePlayed", self.timeplayed["other"], self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] );
    }

    if ( game["state"] == "postgame" )
        return;

    self.timeplayed["allies"] = 0;
    self.timeplayed["axis"] = 0;
    self.timeplayed["other"] = 0;
}

updateteamtime()
{
    if ( game["state"] != "playing" )
        return;

    self.pers["teamTime"] = gettime();
}

updateteambalancedvar()
{
    for (;;)
    {
        var_0 = getdvarint( "scr_teambalance" );

        if ( level.teambalance != var_0 )
            level.teambalance = getdvarint( "scr_teambalance" );

        wait 1;
    }
}

updateteambalance()
{
    level.teamlimit = level.maxclients / 2;
    level thread updateteambalancedvar();
    wait 0.15;

    if ( level.teambalance && maps\mp\_utility::isroundbased() )
    {
        if ( isdefined( game["BalanceTeamsNextRound"] ) )
            iprintlnbold( &"MP_AUTOBALANCE_NEXT_ROUND" );

        level waittill( "restarting" );

        if ( isdefined( game["BalanceTeamsNextRound"] ) )
        {
            level balanceteams();
            game["BalanceTeamsNextRound"] = undefined;
        }
        else if ( !getteambalance() )
            game["BalanceTeamsNextRound"] = 1;
    }
    else
    {
        level endon( "game_ended" );

        for (;;)
        {
            if ( level.teambalance )
            {
                if ( !getteambalance() )
                {
                    iprintlnbold( &"MP_AUTOBALANCE_SECONDS", 15 );
                    wait 15.0;

                    if ( !getteambalance() )
                        level balanceteams();
                }

                wait 59.0;
            }

            wait 1.0;
        }
    }
}

getteambalance()
{
    level.team["allies"] = 0;
    level.team["axis"] = 0;
    var_0 = level.players;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].pers["team"] ) && var_0[var_1].pers["team"] == "allies" )
        {
            level.team["allies"]++;
            continue;
        }

        if ( isdefined( var_0[var_1].pers["team"] ) && var_0[var_1].pers["team"] == "axis" )
            level.team["axis"]++;
    }

    if ( level.team["allies"] > level.team["axis"] + level.teambalance || level.team["axis"] > level.team["allies"] + level.teambalance )
        return 0;
    else
        return 1;
}

balanceteams()
{
    iprintlnbold( game["strings"]["autobalance"] );
    var_0 = [];
    var_1 = [];
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3].pers["teamTime"] ) )
            continue;

        if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "allies" )
        {
            var_0[var_0.size] = var_2[var_3];
            continue;
        }

        if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "axis" )
            var_1[var_1.size] = var_2[var_3];
    }

    var_4 = undefined;

    while ( var_0.size > var_1.size + 1 || var_1.size > var_0.size + 1 )
    {
        if ( var_0.size > var_1.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                if ( isdefined( var_0[var_5].dont_auto_balance ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_0[var_5];
                    continue;
                }

                if ( var_0[var_5].pers["teamTime"] > var_4.pers["teamTime"] )
                    var_4 = var_0[var_5];
            }

            var_4 [[ level.axis ]]();
        }
        else if ( var_1.size > var_0.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            {
                if ( isdefined( var_1[var_5].dont_auto_balance ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_1[var_5];
                    continue;
                }

                if ( var_1[var_5].pers["teamTime"] > var_4.pers["teamTime"] )
                    var_4 = var_1[var_5];
            }

            var_4 [[ level.allies ]]();
        }

        var_4 = undefined;
        var_0 = [];
        var_1 = [];
        var_2 = level.players;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "allies" )
            {
                var_0[var_0.size] = var_2[var_3];
                continue;
            }

            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "axis" )
                var_1[var_1.size] = var_2[var_3];
        }
    }
}

setghilliemodels( var_0 )
{
    level.environment = var_0;

    switch ( var_0 )
    {
        case "desert":
            mptype\mptype_ally_ghillie_desert::precache();
            mptype\mptype_opforce_ghillie_desert::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_desert::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_desert::main;
            break;
        case "arctic":
            mptype\mptype_ally_ghillie_arctic::precache();
            mptype\mptype_opforce_ghillie_arctic::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_arctic::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_arctic::main;
            break;
        case "urban":
            mptype\mptype_ally_ghillie_urban::precache();
            mptype\mptype_opforce_ghillie_urban::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_urban::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_urban::main;
            break;
        case "forest":
            mptype\mptype_ally_ghillie_forest::precache();
            mptype\mptype_opforce_ghillie_forest::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_forest::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_forest::main;
            break;
        case "forest_militia":
            mptype\mptype_ally_ghillie_forest::precache();
            mptype\mptype_opforce_ghillie_militia::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_forest::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_militia::main;
            break;
        case "desert_militia":
            mptype\mptype_ally_ghillie_desert::precache();
            mptype\mptype_opforce_ghillie_militia::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_desert::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_militia::main;
            break;
        case "arctic_militia":
            mptype\mptype_ally_ghillie_arctic::precache();
            mptype\mptype_opforce_ghillie_militia::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_arctic::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_militia::main;
            break;
        case "urban_militia":
            mptype\mptype_ally_ghillie_urban::precache();
            mptype\mptype_opforce_ghillie_militia::precache();
            game["allies_model"]["GHILLIE"] = mptype\mptype_ally_ghillie_urban::main;
            game["axis_model"]["GHILLIE"] = mptype\mptype_opforce_ghillie_militia::main;
            break;
        default:
            break;
    }
}

setteammodels( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "delta_multicam":
            mptype\mptype_delta_multicam_assault::precache();
            mptype\mptype_delta_multicam_lmg::precache();
            mptype\mptype_delta_multicam_smg::precache();
            mptype\mptype_delta_multicam_shotgun::precache();
            mptype\mptype_delta_multicam_sniper::precache();
            mptype\mptype_delta_multicam_riot::precache();
            mptype\mptype_ally_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_delta_multicam_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_delta_multicam_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_delta_multicam_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_delta_multicam_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_delta_multicam_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_delta_multicam_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_ally_juggernaut::main;
            break;
        case "sas_urban":
            mptype\mptype_sas_urban_assault::precache();
            mptype\mptype_sas_urban_lmg::precache();
            mptype\mptype_sas_urban_shotgun::precache();
            mptype\mptype_sas_urban_smg::precache();
            mptype\mptype_sas_urban_sniper::precache();
            mptype\mptype_ally_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_sas_urban_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_sas_urban_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_sas_urban_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_sas_urban_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_sas_urban_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_sas_urban_smg::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_ally_juggernaut::main;
            break;
        case "gign_paris":
            mptype\mptype_gign_paris_assault::precache();
            mptype\mptype_gign_paris_lmg::precache();
            mptype\mptype_gign_paris_shotgun::precache();
            mptype\mptype_gign_paris_smg::precache();
            mptype\mptype_gign_paris_sniper::precache();
            mptype\mptype_gign_paris_riot::precache();
            mptype\mptype_ally_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_gign_paris_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_gign_paris_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_gign_paris_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_gign_paris_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_gign_paris_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_gign_paris_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_ally_juggernaut::main;
            break;
        case "pmc_africa":
            mptype\mptype_pmc_africa_assault::precache();
            mptype\mptype_pmc_africa_lmg::precache();
            mptype\mptype_pmc_africa_smg::precache();
            mptype\mptype_pmc_africa_shotgun::precache();
            mptype\mptype_pmc_africa_sniper::precache();
            mptype\mptype_pmc_africa_riot::precache();
            mptype\mptype_ally_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_pmc_africa_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_pmc_africa_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_pmc_africa_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_pmc_africa_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_pmc_africa_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_pmc_africa_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_ally_juggernaut::main;
            break;
        case "opforce_air":
            mptype\mptype_opforce_air_assault::precache();
            mptype\mptype_opforce_air_lmg::precache();
            mptype\mptype_opforce_air_shotgun::precache();
            mptype\mptype_opforce_air_smg::precache();
            mptype\mptype_opforce_air_sniper::precache();
            mptype\mptype_opforce_air_riot::precache();
            mptype\mptype_opforce_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_opforce_air_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_opforce_air_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_opforce_air_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_opforce_air_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_opforce_air_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_opforce_air_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_opforce_juggernaut::main;
            break;
        case "opforce_snow":
            mptype\mptype_opforce_snow_assault::precache();
            mptype\mptype_opforce_snow_lmg::precache();
            mptype\mptype_opforce_snow_shotgun::precache();
            mptype\mptype_opforce_snow_smg::precache();
            mptype\mptype_opforce_snow_sniper::precache();
            mptype\mptype_opforce_snow_riot::precache();
            mptype\mptype_opforce_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_opforce_snow_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_opforce_snow_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_opforce_snow_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_opforce_snow_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_opforce_snow_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_opforce_snow_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_opforce_juggernaut::main;
            break;
        case "opforce_urban":
            mptype\mptype_opforce_urban_assault::precache();
            mptype\mptype_opforce_urban_lmg::precache();
            mptype\mptype_opforce_urban_shotgun::precache();
            mptype\mptype_opforce_urban_smg::precache();
            mptype\mptype_opforce_urban_sniper::precache();
            mptype\mptype_opforce_urban_riot::precache();
            mptype\mptype_opforce_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_opforce_urban_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_opforce_urban_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_opforce_urban_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_opforce_urban_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_opforce_urban_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_opforce_urban_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_opforce_juggernaut::main;
            break;
        case "opforce_woodland":
            mptype\mptype_opforce_woodland_assault::precache();
            mptype\mptype_opforce_woodland_lmg::precache();
            mptype\mptype_opforce_woodland_shotgun::precache();
            mptype\mptype_opforce_woodland_smg::precache();
            mptype\mptype_opforce_woodland_sniper::precache();
            mptype\mptype_opforce_woodland_riot::precache();
            mptype\mptype_opforce_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_opforce_woodland_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_opforce_woodland_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_opforce_woodland_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_opforce_woodland_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_opforce_woodland_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_opforce_woodland_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_opforce_juggernaut::main;
            break;
        case "opforce_africa":
            mptype\mptype_opforce_africa_assault::precache();
            mptype\mptype_opforce_africa_lmg::precache();
            mptype\mptype_opforce_africa_shotgun::precache();
            mptype\mptype_opforce_africa_smg::precache();
            mptype\mptype_opforce_africa_sniper::precache();
            mptype\mptype_opforce_africa_riot::precache();
            mptype\mptype_opforce_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_opforce_africa_lmg::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_opforce_africa_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_opforce_africa_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_opforce_africa_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_opforce_africa_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_opforce_africa_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_opforce_juggernaut::main;
            break;
        case "opforce_henchmen":
            mptype\mptype_opforce_henchmen_assault::precache();
            mptype\mptype_opforce_henchmen_lmg::precache();
            mptype\mptype_opforce_henchmen_shotgun::precache();
            mptype\mptype_opforce_henchmen_smg::precache();
            mptype\mptype_opforce_henchmen_sniper::precache();
            mptype\mptype_opforce_henchmen_riot::precache();
            mptype\mptype_opforce_juggernaut::precache();
            game[var_0 + "_model"]["SNIPER"] = mptype\mptype_opforce_henchmen_sniper::main;
            game[var_0 + "_model"]["LMG"] = mptype\mptype_opforce_henchmen_lmg::main;
            game[var_0 + "_model"]["ASSAULT"] = mptype\mptype_opforce_henchmen_assault::main;
            game[var_0 + "_model"]["SHOTGUN"] = mptype\mptype_opforce_henchmen_shotgun::main;
            game[var_0 + "_model"]["SMG"] = mptype\mptype_opforce_henchmen_smg::main;
            game[var_0 + "_model"]["RIOT"] = mptype\mptype_opforce_henchmen_riot::main;
            game[var_0 + "_model"]["JUGGERNAUT"] = mptype\mptype_opforce_juggernaut::main;
            break;
    }
}

setplayermodels()
{
    setteammodels( "allies", game["allies"] );
    setteammodels( "axis", game["axis"] );
    setghilliemodels( getmapcustom( "environment" ) );
}

playermodelforweapon( var_0, var_1 )
{
    var_2 = self.team;

    if ( isdefined( game[var_2 + "_model"][var_0] ) )
    {
        [[ game[var_2 + "_model"][var_0] ]]();
        return;
    }

    var_3 = tablelookup( "mp/statstable.csv", 4, var_0, 2 );

    switch ( var_3 )
    {
        case "weapon_smg":
            [[ game[var_2 + "_model"]["SMG"] ]]();
            break;
        case "weapon_assault":
            [[ game[var_2 + "_model"]["ASSAULT"] ]]();
            break;
        case "weapon_sniper":
            if ( level.environment != "" && self isitemunlocked( "ghillie_" + level.environment ) && game[var_2] != "opforce_africa" )
                [[ game[var_2 + "_model"]["GHILLIE"] ]]();
            else
                [[ game[var_2 + "_model"]["SNIPER"] ]]();

            break;
        case "weapon_lmg":
            [[ game[var_2 + "_model"]["LMG"] ]]();
            break;
        case "weapon_riot":
            [[ game[var_2 + "_model"]["RIOT"] ]]();
            break;
        case "weapon_shotgun":
            [[ game[var_2 + "_model"]["SHOTGUN"] ]]();
            break;
        default:
            [[ game[var_2 + "_model"]["ASSAULT"] ]]();
            break;
    }

    if ( maps\mp\_utility::isjuggernaut() )
        [[ game[var_2 + "_model"]["JUGGERNAUT"] ]]();
}

countplayers()
{
    var_0 = level.players;
    var_1 = 0;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3] == self )
            continue;

        if ( isdefined( var_0[var_3].pers["team"] ) && var_0[var_3].pers["team"] == "allies" )
        {
            var_1++;
            continue;
        }

        if ( isdefined( var_0[var_3].pers["team"] ) && var_0[var_3].pers["team"] == "axis" )
            var_2++;
    }

    var_0["allies"] = var_1;
    var_0["axis"] = var_2;
    return var_0;
}

trackfreeplayedtime()
{
    self endon( "disconnect" );
    self.timeplayed["allies"] = 0;
    self.timeplayed["axis"] = 0;
    self.timeplayed["other"] = 0;
    self.timeplayed["total"] = 0;

    for (;;)
    {
        if ( game["state"] == "playing" )
        {
            if ( isdefined( self.pers["team"] ) && self.pers["team"] == "allies" && self.sessionteam != "spectator" )
            {
                self.timeplayed["allies"]++;
                self.timeplayed["total"]++;
            }
            else if ( isdefined( self.pers["team"] ) && self.pers["team"] == "axis" && self.sessionteam != "spectator" )
            {
                self.timeplayed["axis"]++;
                self.timeplayed["total"]++;
            }
            else
                self.timeplayed["other"]++;
        }

        wait 1.0;
    }
}

updatefreeplayertimes()
{
    if ( !level.rankedmatch )
        return;

    var_0 = 0;

    for (;;)
    {
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
            level.players[var_0] updatefreeplayedtime();

        wait 1.0;
    }
}

updatefreeplayedtime()
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    if ( self.timeplayed["allies"] )
    {
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedAllies", self.timeplayed["allies"] );
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedTotal", self.timeplayed["allies"] );
        maps\mp\gametypes\_persistence::stataddchildbuffered( "round", "timePlayed", self.timeplayed["allies"] );

        if ( !self.prestigedoublexp )
        {
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 0, self.timeplayed["allies"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 1, self.timeplayed["allies"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 2, self.timeplayed["allies"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] );
        }

        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleXpTimePlayed", self.timeplayed["allies"], self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleWeaponXpTimePlayed", self.timeplayed["allies"], self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] );
    }

    if ( self.timeplayed["axis"] )
    {
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedOpfor", self.timeplayed["axis"] );
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedTotal", self.timeplayed["axis"] );
        maps\mp\gametypes\_persistence::stataddchildbuffered( "round", "timePlayed", self.timeplayed["axis"] );

        if ( !self.prestigedoublexp )
        {
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 0, self.timeplayed["axis"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 1, self.timeplayed["axis"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 2, self.timeplayed["axis"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] );
        }

        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleXpTimePlayed", self.timeplayed["axis"], self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleWeaponXpTimePlayed", self.timeplayed["axis"], self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] );
    }

    if ( self.timeplayed["other"] )
    {
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedOther", self.timeplayed["other"] );
        maps\mp\gametypes\_persistence::stataddbuffered( "timePlayedTotal", self.timeplayed["other"] );
        maps\mp\gametypes\_persistence::stataddchildbuffered( "round", "timePlayed", self.timeplayed["other"] );

        if ( !self.prestigedoublexp )
        {
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 0, self.timeplayed["other"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 1, self.timeplayed["other"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] );
            maps\mp\gametypes\_persistence::stataddchildbufferedwithmax( "xpMultiplierTimePlayed", 2, self.timeplayed["other"], self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] );
        }

        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleXpTimePlayed", self.timeplayed["other"], self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] );
        maps\mp\gametypes\_persistence::stataddbufferedwithmax( "prestigeDoubleWeaponXpTimePlayed", self.timeplayed["other"], self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] );
    }

    if ( game["state"] == "postgame" )
        return;

    self.timeplayed["allies"] = 0;
    self.timeplayed["axis"] = 0;
    self.timeplayed["other"] = 0;
}

getjointeampermissions( var_0 )
{
    var_1 = 0;
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_0 )
            var_1++;
    }

    if ( var_1 < level.teamlimit )
        return 1;
    else
        return 0;
}

onplayerspawned()
{
    level endon( "game_ended" );

    for (;;)
        self waittill( "spawned_player" );
}

getteamname( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 1 );
}

getteamshortname( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 2 );
}

getteamforfeitedstring( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 4 );
}

getteameliminatedstring( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 3 );
}

getteamicon( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 5 );
}

getteamhudicon( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 6 );
}

getteamheadicon( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 17 );
}

getteamvoiceprefix( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 7 );
}

getteamspawnmusic( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 8 );
}

getteamwinmusic( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 9 );
}

getteamflagmodel( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 10 );
}

getteamflagcarrymodel( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 11 );
}

getteamflagicon( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 12 );
}

getteamflagfx( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 13 );
}

getteamcolor( var_0 )
{
    return ( maps\mp\_utility::stringtofloat( tablelookup( "mp/factionTable.csv", 0, game[var_0], 14 ) ), maps\mp\_utility::stringtofloat( tablelookup( "mp/factionTable.csv", 0, game[var_0], 15 ) ), maps\mp\_utility::stringtofloat( tablelookup( "mp/factionTable.csv", 0, game[var_0], 16 ) ) );
}

getteamcratemodel( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 18 );
}

getteamdeploymodel( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 19 );
}
