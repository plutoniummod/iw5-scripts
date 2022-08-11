// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.persistentdatainfo = [];
    maps\mp\gametypes\_class::init();
    maps\mp\gametypes\_rank::init();
    maps\mp\gametypes\_missions::init();
    maps\mp\gametypes\_playercards::init();
    level thread updatebufferedstats();
    level thread uploadglobalstatcounters();
}

initbufferedstats()
{
    self.bufferedstats = [];
    self.bufferedstats["totalShots"] = self getplayerdata( "totalShots" );
    self.bufferedstats["accuracy"] = self getplayerdata( "accuracy" );
    self.bufferedstats["misses"] = self getplayerdata( "misses" );
    self.bufferedstats["hits"] = self getplayerdata( "hits" );
    self.bufferedstats["timePlayedAllies"] = self getplayerdata( "timePlayedAllies" );
    self.bufferedstats["timePlayedOpfor"] = self getplayerdata( "timePlayedOpfor" );
    self.bufferedstats["timePlayedOther"] = self getplayerdata( "timePlayedOther" );
    self.bufferedstats["timePlayedTotal"] = self getplayerdata( "timePlayedTotal" );
    self.bufferedchildstats = [];
    self.bufferedchildstats["round"] = [];
    self.bufferedchildstats["round"]["timePlayed"] = self getplayerdata( "round", "timePlayed" );
    self.bufferedchildstats["xpMultiplierTimePlayed"] = [];
    self.bufferedchildstats["xpMultiplierTimePlayed"][0] = self getplayerdata( "xpMultiplierTimePlayed", 0 );
    self.bufferedchildstats["xpMultiplierTimePlayed"][1] = self getplayerdata( "xpMultiplierTimePlayed", 1 );
    self.bufferedchildstats["xpMultiplierTimePlayed"][2] = self getplayerdata( "xpMultiplierTimePlayed", 2 );
    self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"] = [];
    self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][0] = self getplayerdata( "xpMaxMultiplierTimePlayed", 0 );
    self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][1] = self getplayerdata( "xpMaxMultiplierTimePlayed", 1 );
    self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][2] = self getplayerdata( "xpMaxMultiplierTimePlayed", 2 );
    self.bufferedchildstats["challengeXPMultiplierTimePlayed"] = [];
    self.bufferedchildstats["challengeXPMultiplierTimePlayed"][0] = self getplayerdata( "challengeXPMultiplierTimePlayed", 0 );
    self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"] = [];
    self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][0] = self getplayerdata( "challengeXPMaxMultiplierTimePlayed", 0 );
    self.bufferedchildstats["weaponXPMultiplierTimePlayed"] = [];
    self.bufferedchildstats["weaponXPMultiplierTimePlayed"][0] = self getplayerdata( "weaponXPMultiplierTimePlayed", 0 );
    self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"] = [];
    self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][0] = self getplayerdata( "weaponXPMaxMultiplierTimePlayed", 0 );
    self.bufferedstats["prestigeDoubleXp"] = self getplayerdata( "prestigeDoubleXp" );
    self.bufferedstats["prestigeDoubleXpTimePlayed"] = self getplayerdata( "prestigeDoubleXpTimePlayed" );
    self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] = self getplayerdata( "prestigeDoubleXpMaxTimePlayed" );
    self.bufferedstats["prestigeDoubleWeaponXp"] = self getplayerdata( "prestigeDoubleWeaponXp" );
    self.bufferedstats["prestigeDoubleWeaponXpTimePlayed"] = self getplayerdata( "prestigeDoubleWeaponXpTimePlayed" );
    self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] = self getplayerdata( "prestigeDoubleWeaponXpMaxTimePlayed" );
}

statget( var_0 )
{
    return self getplayerdata( var_0 );
}

statset( var_0, var_1 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    self setplayerdata( var_0, var_1 );
}

statadd( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    if ( isdefined( var_2 ) )
    {
        var_3 = self getplayerdata( var_0, var_2 );
        self setplayerdata( var_0, var_2, var_1 + var_3 );
    }
    else
    {
        var_3 = self getplayerdata( var_0 );
        self setplayerdata( var_0, var_1 + var_3 );
    }
}

statgetchild( var_0, var_1 )
{
    return self getplayerdata( var_0, var_1 );
}

statsetchild( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    self setplayerdata( var_0, var_1, var_2 );
}

stataddchild( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    var_3 = self getplayerdata( var_0, var_1 );
    self setplayerdata( var_0, var_1, var_3 + var_2 );
}

statgetchildbuffered( var_0, var_1 )
{
    return self.bufferedchildstats[var_0][var_1];
}

statsetchildbuffered( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    self.bufferedchildstats[var_0][var_1] = var_2;
}

stataddchildbuffered( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    var_3 = statgetchildbuffered( var_0, var_1 );
    statsetchildbuffered( var_0, var_1, var_3 + var_2 );
}

stataddbufferedwithmax( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    var_3 = statgetbuffered( var_0 ) + var_1;

    if ( var_3 > var_2 )
        var_3 = var_2;

    if ( var_3 < statgetbuffered( var_0 ) )
        var_3 = var_2;

    statsetbuffered( var_0, var_3 );
}

stataddchildbufferedwithmax( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    var_4 = statgetchildbuffered( var_0, var_1 ) + var_2;

    if ( var_4 > var_3 )
        var_4 = var_3;

    if ( var_4 < statgetchildbuffered( var_0, var_1 ) )
        var_4 = var_3;

    statsetchildbuffered( var_0, var_1, var_4 );
}

statgetbuffered( var_0 )
{
    return self.bufferedstats[var_0];
}

statsetbuffered( var_0, var_1 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    self.bufferedstats[var_0] = var_1;
}

stataddbuffered( var_0, var_1 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    var_2 = statgetbuffered( var_0 );
    statsetbuffered( var_0, var_2 + var_1 );
}

updatebufferedstats()
{
    wait 0.15;
    var_0 = 0;

    while ( !level.gameended )
    {
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
        {
            level.players[var_0] writebufferedstats();
            level.players[var_0] updateweaponbufferedstats();
        }

        wait 2.0;
    }

    foreach ( var_2 in level.players )
    {
        var_2 writebufferedstats();
        var_2 updateweaponbufferedstats();
    }
}

writebufferedstats()
{
    foreach ( var_2, var_1 in self.bufferedstats )
        self setplayerdata( var_2, var_1 );

    foreach ( var_2, var_1 in self.bufferedchildstats )
    {
        foreach ( var_6, var_5 in var_1 )
            self setplayerdata( var_2, var_6, var_5 );
    }
}

incrementweaponstat( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::iskillstreakweapon( var_0 ) )
        return;

    if ( maps\mp\_utility::rankingenabled() )
    {
        var_3 = self getplayerdata( "weaponStats", var_0, var_1 );
        self setplayerdata( "weaponStats", var_0, var_1, var_3 + var_2 );
    }
}

incrementattachmentstat( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::rankingenabled() )
    {
        var_3 = self getplayerdata( "attachmentsStats", var_0, var_1 );
        self setplayerdata( "attachmentsStats", var_0, var_1, var_3 + var_2 );
    }
}

updateweaponbufferedstats()
{
    if ( !isdefined( self.trackingweaponname ) )
        return;

    if ( self.trackingweaponname == "" || self.trackingweaponname == "none" )
        return;

    var_0 = self.trackingweaponname;

    if ( maps\mp\_utility::iskillstreakweapon( var_0 ) || maps\mp\_utility::isenvironmentweapon( var_0 ) )
        return;

    var_1 = strtok( var_0, "_" );

    if ( var_1[0] == "iw5" )
        var_1[0] = var_1[0] + "_" + var_1[1];

    if ( var_1[0] == "alt" )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == "gl" || var_3 == "gp25" || var_3 == "m320" )
            {
                var_1[0] = "gl";
                break;
            }

            if ( var_3 == "shotgun" )
            {
                var_1[0] = "shotgun";
                break;
            }
        }

        if ( var_1[0] == "alt" )
            var_1[0] = var_1[1] + "_" + var_1[2];
    }

    if ( var_1[0] == "gl" || var_1[0] == "shotgun" )
    {
        if ( self.trackingweaponshots > 0 )
        {
            incrementattachmentstat( var_1[0], "shots", self.trackingweaponshots );
            maps\mp\_matchdata::logattachmentstat( var_1[0], "shots", self.trackingweaponshots );
        }

        if ( self.trackingweaponkills > 0 )
        {
            incrementattachmentstat( var_1[0], "kills", self.trackingweaponkills );
            maps\mp\_matchdata::logattachmentstat( var_1[0], "kills", self.trackingweaponkills );
        }

        if ( self.trackingweaponhits > 0 )
        {
            incrementattachmentstat( var_1[0], "hits", self.trackingweaponhits );
            maps\mp\_matchdata::logattachmentstat( var_1[0], "hits", self.trackingweaponhits );
        }

        if ( self.trackingweaponheadshots > 0 )
        {
            incrementattachmentstat( var_1[0], "headShots", self.trackingweaponheadshots );
            maps\mp\_matchdata::logattachmentstat( var_1[0], "headShots", self.trackingweaponheadshots );
        }

        if ( self.trackingweapondeaths > 0 )
        {
            incrementattachmentstat( var_1[0], "deaths", self.trackingweapondeaths );
            maps\mp\_matchdata::logattachmentstat( var_1[0], "deaths", self.trackingweapondeaths );
        }

        self.trackingweaponname = "none";
        self.trackingweaponshots = 0;
        self.trackingweaponkills = 0;
        self.trackingweaponhits = 0;
        self.trackingweaponheadshots = 0;
        self.trackingweapondeaths = 0;
        return;
    }

    if ( !maps\mp\_utility::iscacprimaryweapon( var_1[0] ) && !maps\mp\_utility::iscacsecondaryweapon( var_1[0] ) )
        return;

    if ( self.trackingweaponshots > 0 )
    {
        incrementweaponstat( var_1[0], "shots", self.trackingweaponshots );
        maps\mp\_matchdata::logweaponstat( var_1[0], "shots", self.trackingweaponshots );
    }

    if ( self.trackingweaponkills > 0 )
    {
        incrementweaponstat( var_1[0], "kills", self.trackingweaponkills );
        maps\mp\_matchdata::logweaponstat( var_1[0], "kills", self.trackingweaponkills );
    }

    if ( self.trackingweaponhits > 0 )
    {
        incrementweaponstat( var_1[0], "hits", self.trackingweaponhits );
        maps\mp\_matchdata::logweaponstat( var_1[0], "hits", self.trackingweaponhits );
    }

    if ( self.trackingweaponheadshots > 0 )
    {
        incrementweaponstat( var_1[0], "headShots", self.trackingweaponheadshots );
        maps\mp\_matchdata::logweaponstat( var_1[0], "headShots", self.trackingweaponheadshots );
    }

    if ( self.trackingweapondeaths > 0 )
    {
        incrementweaponstat( var_1[0], "deaths", self.trackingweapondeaths );
        maps\mp\_matchdata::logweaponstat( var_1[0], "deaths", self.trackingweapondeaths );
    }

    var_1 = strtok( var_0, "_" );

    if ( var_1[0] != "none" )
    {
        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            if ( var_1[var_5] == "mp" || var_1[var_5] == "scope1" || var_1[var_5] == "scope2" || var_1[var_5] == "scope3" || var_1[var_5] == "scope4" || var_1[var_5] == "scope5" || var_1[var_5] == "scope6" || var_1[var_5] == "scope7" || var_1[var_5] == "scope8" || var_1[var_5] == "scope9" || var_1[var_5] == "scope10" )
                continue;

            if ( issubstr( var_1[var_5], "camo" ) )
                continue;

            if ( issubstr( var_1[var_5], "scope" ) && !issubstr( var_1[var_5], "vz" ) )
                continue;

            if ( var_1[var_5] == "alt" )
            {
                var_5 += 2;
                continue;
            }

            if ( var_1[var_5] == "iw5" )
            {
                var_5 += 1;
                continue;
            }

            var_1[var_5] = maps\mp\_utility::validateattachment( var_1[var_5] );

            if ( var_1[var_5] == "gl" || var_1[var_5] == "shotgun" )
                continue;

            if ( issubstr( var_1[var_5], "scope" ) && issubstr( var_1[var_5], "vz" ) )
                var_1[var_5] = "vzscope";

            if ( var_5 == 0 && ( var_1[var_5] != "iw5" && var_1[var_5] != "alt" ) )
                continue;

            if ( self.trackingweaponshots > 0 )
            {
                incrementattachmentstat( var_1[var_5], "shots", self.trackingweaponshots );
                maps\mp\_matchdata::logattachmentstat( var_1[var_5], "shots", self.trackingweaponshots );
            }

            if ( self.trackingweaponkills > 0 )
            {
                incrementattachmentstat( var_1[var_5], "kills", self.trackingweaponkills );
                maps\mp\_matchdata::logattachmentstat( var_1[var_5], "kills", self.trackingweaponkills );
            }

            if ( self.trackingweaponhits > 0 )
            {
                incrementattachmentstat( var_1[var_5], "hits", self.trackingweaponhits );
                maps\mp\_matchdata::logattachmentstat( var_1[var_5], "hits", self.trackingweaponhits );
            }

            if ( self.trackingweaponheadshots > 0 )
            {
                incrementattachmentstat( var_1[var_5], "headShots", self.trackingweaponheadshots );
                maps\mp\_matchdata::logattachmentstat( var_1[var_5], "headShots", self.trackingweaponheadshots );
            }

            if ( self.trackingweapondeaths > 0 )
            {
                incrementattachmentstat( var_1[var_5], "deaths", self.trackingweapondeaths );
                maps\mp\_matchdata::logattachmentstat( var_1[var_5], "deaths", self.trackingweapondeaths );
            }
        }
    }

    self.trackingweaponname = "none";
    self.trackingweaponshots = 0;
    self.trackingweaponkills = 0;
    self.trackingweaponhits = 0;
    self.trackingweaponheadshots = 0;
    self.trackingweapondeaths = 0;
}

uploadglobalstatcounters()
{
    level waittill( "game_ended" );

    if ( !maps\mp\_utility::matchmakinggame() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    foreach ( var_7 in level.players )
        var_5 += var_7.timeplayed["total"];

    incrementcounter( "global_minutes", int( var_5 / 60 ) );

    if ( !maps\mp\_utility::waslastround() )
        return;

    wait 0.05;

    foreach ( var_7 in level.players )
    {
        var_0 += var_7.kills;
        var_1 += var_7.deaths;
        var_2 += var_7.assists;
        var_3 += var_7.headshots;
        var_4 += var_7.suicides;
    }

    incrementcounter( "global_kills", var_0 );
    incrementcounter( "global_deaths", var_1 );
    incrementcounter( "global_assists", var_2 );
    incrementcounter( "global_headshots", var_3 );
    incrementcounter( "global_suicides", var_4 );
    incrementcounter( "global_games", 1 );
}
