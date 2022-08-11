// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

gethighestscoringplayer()
{
    updateplacement();

    if ( !level.placement["all"].size )
        return undefined;
    else
        return level.placement["all"][0];
}

getlosingplayers()
{
    updateplacement();
    var_0 = level.placement["all"];
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level.placement["all"][0] )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

giveplayerscore( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = var_1.pers["score"];
    onplayerscore( var_0, var_1, var_2 );

    if ( var_5 == var_1.pers["score"] )
        return;

    if ( !var_1 maps\mp\_utility::rankingenabled() && !level.hardcoremode && !var_4 )
        var_1 thread maps\mp\gametypes\_rank::xppointspopup( var_1.pers["score"] - var_5, 0, ( 0.85, 0.85, 0.85 ), 0 );

    var_1 maps\mp\gametypes\_persistence::statadd( "score", var_1.pers["score"] - var_5 );
    var_1.score = var_1.pers["score"];
    var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "score", var_1.score );

    if ( !level.teambased )
        thread sendupdateddmscores();

    if ( !var_3 )
        var_1 maps\mp\gametypes\_gamelogic::checkplayerscorelimitsoon();

    var_6 = var_1 maps\mp\gametypes\_gamelogic::checkscorelimit();
}

onplayerscore( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::getscoreinfovalue( var_0 );
    var_1.pers["score"] += var_3 * level.objectivepointsmod;
}

_getplayerscore( var_0, var_1 )
{
    if ( var_1 == var_0.pers["score"] )
        return;

    var_0.pers["score"] = var_1;
    var_0.score = var_0.pers["score"];
    var_0 thread maps\mp\gametypes\_gamelogic::checkscorelimit();
}

_setplayerscore( var_0 )
{
    return var_0.pers["score"];
}

giveteamscoreforobjective( var_0, var_1 )
{
    var_1 *= level.objectivepointsmod;
    var_2 = game["teamScores"][var_0];
    var_3 = level.otherteam[var_0];

    if ( game["teamScores"][var_0] > game["teamScores"][var_3] )
        level.waswinning = var_0;
    else if ( game["teamScores"][var_3] > game["teamScores"][var_0] )
        level.waswinning = var_3;

    _setteamscore( var_0, _getteamscore( var_0 ) + var_1 );
    var_4 = "none";

    if ( game["teamScores"][var_0] > game["teamScores"][var_3] )
        var_4 = var_0;
    else if ( game["teamScores"][var_3] > game["teamScores"][var_0] )
        var_4 = var_3;

    if ( !level.splitscreen && var_4 != "none" && var_4 != level.waswinning && gettime() - level.laststatustime > 5000 && maps\mp\_utility::getscorelimit() != 1 )
    {
        level.laststatustime = gettime();
        maps\mp\_utility::leaderdialog( "lead_taken", var_4, "status" );

        if ( level.waswinning != "none" )
            maps\mp\_utility::leaderdialog( "lead_lost", level.waswinning, "status" );
    }

    if ( var_4 != "none" )
        level.waswinning = var_4;
}

getwinningteam()
{
    if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
        return "allies";
    else if ( game["teamScores"]["allies"] < game["teamScores"]["axis"] )
        return "axis";

    return "none";
}

_setteamscore( var_0, var_1 )
{
    if ( var_1 == game["teamScores"][var_0] )
        return;

    game["teamScores"][var_0] = var_1;
    updateteamscore( var_0 );

    if ( game["status"] == "overtime" && !isdefined( level.overtimescorewinoverride ) || isdefined( level.overtimescorewinoverride ) && !level.overtimescorewinoverride )
        thread maps\mp\gametypes\_gamelogic::onscorelimit();
    else
    {
        thread maps\mp\gametypes\_gamelogic::checkteamscorelimitsoon( var_0 );
        thread maps\mp\gametypes\_gamelogic::checkscorelimit();
    }
}

updateteamscore( var_0 )
{
    var_1 = 0;

    if ( !maps\mp\_utility::isroundbased() || !maps\mp\_utility::isobjectivebased() )
        var_1 = _getteamscore( var_0 );
    else
        var_1 = game["roundsWon"][var_0];

    setteamscore( var_0, var_1 );
}

_getteamscore( var_0 )
{
    return game["teamScores"][var_0];
}

sendupdatedteamscores()
{
    level notify( "updating_scores" );
    level endon( "updating_scores" );
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();

    foreach ( var_1 in level.players )
        var_1 updatescores();
}

sendupdateddmscores()
{
    level notify( "updating_dm_scores" );
    level endon( "updating_dm_scores" );
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        level.players[var_0] updatedmscores();
        level.players[var_0].updateddmscores = 1;
    }
}

removedisconnectedplayerfromplacement()
{
    var_0 = 0;
    var_1 = level.placement["all"].size;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( level.placement["all"][var_3] == self )
            var_2 = 1;

        if ( var_2 )
            level.placement["all"][var_3] = level.placement["all"][var_3 + 1];
    }

    if ( !var_2 )
        return;

    level.placement["all"][var_1 - 1] = undefined;

    if ( level.teambased )
    {
        updateteamplacement();
        return;
    }

    var_1 = level.placement["all"].size;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = level.placement["all"][var_3];
        var_4 notify( "update_outcome" );
    }
}

updateplacement()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2.connectedpostgame ) || var_2.pers["team"] != "allies" && var_2.pers["team"] != "axis" )
            continue;

        var_0[var_0.size] = var_2;
    }

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_2 = var_0[var_4];
        var_5 = var_2.score;

        for ( var_6 = var_4 - 1; var_6 >= 0 && getbetterplayer( var_2, var_0[var_6] ) == var_2; var_6-- )
            var_0[var_6 + 1] = var_0[var_6];

        var_0[var_6 + 1] = var_2;
    }

    level.placement["all"] = var_0;

    if ( level.teambased )
        updateteamplacement();
}

getbetterplayer( var_0, var_1 )
{
    if ( var_0.score > var_1.score )
        return var_0;

    if ( var_1.score > var_0.score )
        return var_1;

    if ( var_0.deaths < var_1.deaths )
        return var_0;

    if ( var_1.deaths < var_0.deaths )
        return var_1;

    if ( common_scripts\utility::cointoss() )
        return var_0;
    else
        return var_1;
}

updateteamplacement()
{
    var_0["allies"] = [];
    var_0["axis"] = [];
    var_0["spectator"] = [];
    var_1 = level.placement["all"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_1[var_3];
        var_5 = var_4.pers["team"];
        var_0[var_5][var_0[var_5].size] = var_4;
    }

    level.placement["allies"] = var_0["allies"];
    level.placement["axis"] = var_0["axis"];
}

initialdmscoreupdate()
{
    wait 0.2;
    var_0 = 0;

    for (;;)
    {
        var_1 = 0;
        var_2 = level.players;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_4 = var_2[var_3];

            if ( !isdefined( var_4 ) )
                continue;

            if ( isdefined( var_4.updateddmscores ) )
                continue;

            var_4.updateddmscores = 1;
            var_4 updatedmscores();
            var_1 = 1;
            wait 0.5;
        }

        if ( !var_1 )
            wait 3;
    }
}

processassist( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();

    if ( self.pers["team"] != "axis" && self.pers["team"] != "allies" )
        return;

    if ( self.pers["team"] == var_0.pers["team"] )
        return;

    self thread [[ level.onxpevent ]]( "assist" );
    maps\mp\_utility::incpersstat( "assists", 1 );
    self.assists = maps\mp\_utility::getpersstat( "assists" );
    maps\mp\_utility::incplayerstat( "assists", 1 );
    maps\mp\gametypes\_persistence::statsetchild( "round", "assists", self.assists );
    giveplayerscore( "assist", self, var_0 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "assist" );
    thread maps\mp\gametypes\_missions::playerassist();
}

processshieldassist( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    wait 0.05;
    maps\mp\_utility::waittillslowprocessallowed();

    if ( self.pers["team"] != "axis" && self.pers["team"] != "allies" )
        return;

    if ( self.pers["team"] == var_0.pers["team"] )
        return;

    self thread [[ level.onxpevent ]]( "assist" );
    self thread [[ level.onxpevent ]]( "assist" );
    maps\mp\_utility::incpersstat( "assists", 1 );
    self.assists = maps\mp\_utility::getpersstat( "assists" );
    maps\mp\_utility::incplayerstat( "assists", 1 );
    maps\mp\gametypes\_persistence::statsetchild( "round", "assists", self.assists );
    giveplayerscore( "assist", self, var_0 );
    thread maps\mp\gametypes\_hud_message::splashnotifydelayed( "shield_assist" );
    thread maps\mp\gametypes\_missions::playerassist();
}
