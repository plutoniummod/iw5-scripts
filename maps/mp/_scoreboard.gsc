// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

processlobbyscoreboards()
{
    foreach ( var_1 in level.placement["all"] )
        var_1 setplayerscoreboardinfo();

    if ( level.teambased )
    {
        var_3 = getteamscore( "allies" );
        var_4 = getteamscore( "axis" );

        if ( var_3 == var_4 )
            var_5 = "tied";
        else if ( var_3 > var_4 )
            var_5 = "allies";
        else
            var_5 = "axis";

        if ( var_5 == "tied" )
        {
            buildscoreboardtype( "allies" );
            buildscoreboardtype( "axis" );

            foreach ( var_1 in level.players )
            {
                if ( var_1.pers["team"] == "spectator" )
                {
                    var_1 setplayerdata( "round", "scoreboardType", "allies" );
                    continue;
                }

                var_1 setplayerdata( "round", "scoreboardType", var_1.pers["team"] );
            }
        }
        else
        {
            buildscoreboardtype( var_5 );

            foreach ( var_1 in level.players )
                var_1 setplayerdata( "round", "scoreboardType", var_5 );
        }
    }
    else
    {
        buildscoreboardtype( "neutral" );

        foreach ( var_1 in level.players )
            var_1 setplayerdata( "round", "scoreboardType", "neutral" );
    }

    foreach ( var_1 in level.players )
        var_1 setclientdvars( "player_summary_xp", var_1.pers["summary"]["xp"], "player_summary_score", var_1.pers["summary"]["score"], "player_summary_challenge", var_1.pers["summary"]["challenge"], "player_summary_match", var_1.pers["summary"]["match"], "player_summary_misc", var_1.pers["summary"]["misc"] );
}

setplayerscoreboardinfo()
{
    var_0 = getclientmatchdata( "scoreboardPlayerCount" );

    if ( var_0 <= 24 )
    {
        setclientmatchdata( "players", self.clientmatchdataid, "score", self.pers["score"] );
        var_1 = maps\mp\_utility::getplayerstat( "kills" );
        setclientmatchdata( "players", self.clientmatchdataid, "kills", var_1 );
        var_2 = maps\mp\_utility::getplayerstat( "assists" );
        setclientmatchdata( "players", self.clientmatchdataid, "assists", var_2 );
        var_3 = maps\mp\_utility::getplayerstat( "deaths" );
        setclientmatchdata( "players", self.clientmatchdataid, "deaths", var_3 );
        var_4 = game[self.pers["team"]];
        setclientmatchdata( "players", self.clientmatchdataid, "faction", var_4 );
        var_0++;
        setclientmatchdata( "scoreboardPlayerCount", var_0 );
    }
    else
    {

    }
}

buildscoreboardtype( var_0 )
{
    if ( var_0 == "neutral" )
    {
        var_1 = 0;

        foreach ( var_3 in level.placement["all"] )
        {
            setclientmatchdata( "scoreboards", var_0, var_1, var_3.clientmatchdataid );
            var_1++;
        }
    }
    else
    {
        var_5 = maps\mp\_utility::getotherteam( var_0 );
        var_1 = 0;

        foreach ( var_3 in level.placement[var_0] )
        {
            setclientmatchdata( "scoreboards", var_0, var_1, var_3.clientmatchdataid );
            var_1++;
        }

        foreach ( var_3 in level.placement[var_5] )
        {
            setclientmatchdata( "scoreboards", var_0, var_1, var_3.clientmatchdataid );
            var_1++;
        }
    }
}
