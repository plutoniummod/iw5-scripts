// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.scoreinfo = [];
    level.xpscale = getdvarint( "scr_xpscale" );

    if ( level.xpscale > 4 || level.xpscale < 0 )
        exitlevel( 0 );

    level.xpscale = min( level.xpscale, 4 );
    level.xpscale = max( level.xpscale, 0 );
    level.ranktable = [];
    level.weaponranktable = [];
    precacheshader( "white" );
    precachestring( &"RANK_PLAYER_WAS_PROMOTED_N" );
    precachestring( &"RANK_PLAYER_WAS_PROMOTED" );
    precachestring( &"RANK_WEAPON_WAS_PROMOTED" );
    precachestring( &"RANK_PROMOTED" );
    precachestring( &"RANK_PROMOTED_WEAPON" );
    precachestring( &"MP_PLUS" );
    precachestring( &"RANK_ROMANI" );
    precachestring( &"RANK_ROMANII" );
    precachestring( &"RANK_ROMANIII" );
    precachestring( &"SPLASHES_LONGSHOT" );
    precachestring( &"SPLASHES_PROXIMITYASSIST" );
    precachestring( &"SPLASHES_PROXIMITYKILL" );
    precachestring( &"SPLASHES_EXECUTION" );
    precachestring( &"SPLASHES_AVENGER" );
    precachestring( &"SPLASHES_ASSISTEDSUICIDE" );
    precachestring( &"SPLASHES_DEFENDER" );
    precachestring( &"SPLASHES_POSTHUMOUS" );
    precachestring( &"SPLASHES_REVENGE" );
    precachestring( &"SPLASHES_DOUBLEKILL" );
    precachestring( &"SPLASHES_TRIPLEKILL" );
    precachestring( &"SPLASHES_MULTIKILL" );
    precachestring( &"SPLASHES_BUZZKILL" );
    precachestring( &"SPLASHES_COMEBACK" );
    precachestring( &"SPLASHES_KNIFETHROW" );
    precachestring( &"SPLASHES_ONE_SHOT_KILL" );

    if ( level.teambased )
    {
        registerscoreinfo( "kill", 100 );
        registerscoreinfo( "headshot", 100 );
        registerscoreinfo( "assist", 20 );
        registerscoreinfo( "proximityassist", 20 );
        registerscoreinfo( "proximitykill", 20 );
        registerscoreinfo( "suicide", 0 );
        registerscoreinfo( "teamkill", 0 );
    }
    else
    {
        registerscoreinfo( "kill", 50 );
        registerscoreinfo( "headshot", 50 );
        registerscoreinfo( "assist", 0 );
        registerscoreinfo( "suicide", 0 );
        registerscoreinfo( "teamkill", 0 );
    }

    registerscoreinfo( "win", 1 );
    registerscoreinfo( "loss", 0.5 );
    registerscoreinfo( "tie", 0.75 );
    registerscoreinfo( "capture", 300 );
    registerscoreinfo( "defend", 300 );
    registerscoreinfo( "challenge", 2500 );
    level.maxrank = int( tablelookup( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level.maxprestige = int( tablelookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ) );
    var_0 = 0;
    var_1 = 0;

    for ( var_0 = 0; var_0 <= level.maxprestige; var_0++ )
    {
        for ( var_1 = 0; var_1 <= level.maxrank; var_1++ )
            precacheshader( tablelookup( "mp/rankIconTable.csv", 0, var_1, var_0 + 1 ) );
    }

    var_2 = 0;

    for ( var_3 = tablelookup( "mp/ranktable.csv", 0, var_2, 1 ); isdefined( var_3 ) && var_3 != ""; var_3 = tablelookup( "mp/ranktable.csv", 0, var_2, 1 ) )
    {
        level.ranktable[var_2][1] = tablelookup( "mp/ranktable.csv", 0, var_2, 1 );
        level.ranktable[var_2][2] = tablelookup( "mp/ranktable.csv", 0, var_2, 2 );
        level.ranktable[var_2][3] = tablelookup( "mp/ranktable.csv", 0, var_2, 3 );
        level.ranktable[var_2][7] = tablelookup( "mp/ranktable.csv", 0, var_2, 7 );
        precachestring( tablelookupistring( "mp/ranktable.csv", 0, var_2, 16 ) );
        var_2++;
    }

    var_4 = int( tablelookup( "mp/weaponRankTable.csv", 0, "maxrank", 1 ) );

    for ( var_5 = 0; var_5 < var_4 + 1; var_5++ )
    {
        level.weaponranktable[var_5][1] = tablelookup( "mp/weaponRankTable.csv", 0, var_5, 1 );
        level.weaponranktable[var_5][2] = tablelookup( "mp/weaponRankTable.csv", 0, var_5, 2 );
        level.weaponranktable[var_5][3] = tablelookup( "mp/weaponRankTable.csv", 0, var_5, 3 );
    }

    maps\mp\gametypes\_missions::buildchallegeinfo();
    level thread patientzerowaiter();
    level thread onplayerconnect();
}

patientzerowaiter()
{
    level endon( "game_ended" );

    while ( !isdefined( level.players ) || !level.players.size )
        wait 0.05;

    if ( !maps\mp\_utility::matchmakinggame() )
    {
        if ( getdvar( "mapname" ) == "mp_rust" && randomint( 1000 ) == 999 )
            level.patientzeroname = level.players[0].name;
    }
    else if ( getdvar( "scr_patientZero" ) != "" )
        level.patientzeroname = getdvar( "scr_patientZero" );
}

isregisteredevent( var_0 )
{
    if ( isdefined( level.scoreinfo[var_0] ) )
        return 1;
    else
        return 0;
}

registerscoreinfo( var_0, var_1 )
{
    level.scoreinfo[var_0]["value"] = var_1;
}

getscoreinfovalue( var_0 )
{
    var_1 = "scr_" + level.gametype + "_score_" + var_0;

    if ( getdvar( var_1 ) != "" )
        return getdvarint( var_1 );
    else
        return level.scoreinfo[var_0]["value"];
}

getscoreinfolabel( var_0 )
{
    return level.scoreinfo[var_0]["label"];
}

getrankinfominxp( var_0 )
{
    return int( level.ranktable[var_0][2] );
}

getweaponrankinfominxp( var_0 )
{
    return int( level.weaponranktable[var_0][1] );
}

getrankinfoxpamt( var_0 )
{
    return int( level.ranktable[var_0][3] );
}

getweaponrankinfoxpamt( var_0 )
{
    return int( level.weaponranktable[var_0][2] );
}

getrankinfomaxxp( var_0 )
{
    return int( level.ranktable[var_0][7] );
}

getweaponrankinfomaxxp( var_0 )
{
    return int( level.weaponranktable[var_0][3] );
}

getrankinfofull( var_0 )
{
    return tablelookupistring( "mp/ranktable.csv", 0, var_0, 16 );
}

getrankinfoicon( var_0, var_1 )
{
    return tablelookup( "mp/rankIconTable.csv", 0, var_0, var_1 + 1 );
}

getrankinfolevel( var_0 )
{
    return int( tablelookup( "mp/ranktable.csv", 0, var_0, 13 ) );
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.pers["rankxp"] = var_0 maps\mp\gametypes\_persistence::statget( "experience" );

        if ( var_0.pers["rankxp"] < 0 )
            var_0.pers["rankxp"] = 0;

        var_1 = var_0 getrankforxp( var_0 getrankxp() );
        var_0.pers["rank"] = var_1;
        var_0.pers["participation"] = 0;
        var_0.xpupdatetotal = 0;
        var_0.bonusupdatetotal = 0;
        var_2 = var_0 getprestigelevel();
        var_0 setrank( var_1, var_2 );
        var_0.pers["prestige"] = var_2;

        if ( var_0.clientid < level.maxlogclients )
        {
            setmatchdata( "players", var_0.clientid, "rank", var_1 );
            setmatchdata( "players", var_0.clientid, "Prestige", var_2 );
        }

        var_0.postgamepromotion = 0;

        if ( !isdefined( var_0.pers["postGameChallenges"] ) )
            var_0 setclientdvars( "ui_challenge_1_ref", "", "ui_challenge_2_ref", "", "ui_challenge_3_ref", "", "ui_challenge_4_ref", "", "ui_challenge_5_ref", "", "ui_challenge_6_ref", "", "ui_challenge_7_ref", "" );

        var_0 setclientdvar( "ui_promotion", 0 );

        if ( !isdefined( var_0.pers["summary"] ) )
        {
            var_0.pers["summary"] = [];
            var_0.pers["summary"]["xp"] = 0;
            var_0.pers["summary"]["score"] = 0;
            var_0.pers["summary"]["challenge"] = 0;
            var_0.pers["summary"]["match"] = 0;
            var_0.pers["summary"]["misc"] = 0;
            var_0 setclientdvar( "player_summary_xp", "0" );
            var_0 setclientdvar( "player_summary_score", "0" );
            var_0 setclientdvar( "player_summary_challenge", "0" );
            var_0 setclientdvar( "player_summary_match", "0" );
            var_0 setclientdvar( "player_summary_misc", "0" );
        }

        var_0 setclientdvar( "ui_opensummary", 0 );
        var_0 thread maps\mp\gametypes\_missions::updatechallenges();
        var_0.explosivekills[0] = 0;
        var_0.xpgains = [];
        var_0.hud_xppointspopup = var_0 createxppointspopup();
        var_0.hud_xpeventpopup = var_0 createxpeventpopup();
        var_0 thread onplayerspawned();
        var_0 thread onjoinedteam();
        var_0 thread onjoinedspectators();
        var_0 thread setgamesplayed();

        if ( var_0 getplayerdata( "prestigeDoubleXp" ) )
            var_0.prestigedoublexp = 1;
        else
            var_0.prestigedoublexp = 0;

        if ( var_0 getplayerdata( "prestigeDoubleWeaponXp" ) )
        {
            var_0.prestigedoubleweaponxp = 1;
            continue;
        }

        var_0.prestigedoubleweaponxp = 0;
    }
}

setgamesplayed()
{
    self endon( "disconnect" );

    for (;;)
    {
        wait 30;

        if ( !self.hasdonecombat )
            continue;

        maps\mp\gametypes\_persistence::statadd( "gamesPlayed", 1 );
        break;
    }
}

onjoinedteam()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        thread removerankhud();
    }
}

onjoinedspectators()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        thread removerankhud();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
        self waittill( "spawned_player" );
}

roundup( var_0 )
{
    if ( int( var_0 ) != var_0 )
        return int( var_0 + 1 );
    else
        return int( var_0 );
}

giverankxp( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );
    var_5 = "none";

    if ( !maps\mp\_utility::rankingenabled() )
    {
        if ( var_0 == "assist" )
        {
            if ( isdefined( self.taggedassist ) )
                self.taggedassist = undefined;
            else
            {
                var_6 = &"MP_ASSIST";

                if ( maps\mp\_utility::_hasperk( "specialty_assists" ) )
                {
                    if ( !( self.pers["assistsToKill"] % 2 ) )
                        var_6 = &"MP_ASSIST_TO_KILL";
                }

                thread xpeventpopup( var_6 );
            }
        }

        return;
    }

    if ( level.teambased && ( !level.teamcount["allies"] || !level.teamcount["axis"] ) )
        return;
    else if ( !level.teambased && level.teamcount["allies"] + level.teamcount["axis"] < 2 )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = getscoreinfovalue( var_0 );

    if ( !isdefined( self.xpgains[var_0] ) )
        self.xpgains[var_0] = 0;

    var_7 = 0;
    var_8 = 0;

    switch ( var_0 )
    {
        case "kill":
        case "headshot":
        case "shield_damage":
            var_1 *= self.xpscaler;
        case "save":
        case "destroy":
        case "assist":
        case "suicide":
        case "teamkill":
        case "return":
        case "capture":
        case "defend":
        case "assault":
        case "pickup":
        case "plant":
        case "defuse":
        case "kill_confirmed":
        case "kill_denied":
        case "tags_retrieved":
        case "team_assist":
        case "kill_bonus":
        case "kill_carrier":
        case "draft_rogue":
        case "survivor":
        case "final_rogue":
        case "gained_gun_rank":
        case "dropped_enemy_gun_rank":
        case "got_juggernaut":
        case "kill_as_juggernaut":
        case "kill_juggernaut":
        case "jugg_on_jugg":
            if ( maps\mp\_utility::getgametypenumlives() > 0 )
            {
                var_9 = max( 1, int( 10 / maps\mp\_utility::getgametypenumlives() ) );
                var_1 = int( var_1 * var_9 );
            }

            var_10 = 0;
            var_11 = 0;

            if ( self.prestigedoublexp )
            {
                var_12 = self getplayerdata( "prestigeDoubleXpTimePlayed" );

                if ( var_12 >= self.bufferedstatsmax["prestigeDoubleXpMaxTimePlayed"] )
                {
                    self setplayerdata( "prestigeDoubleXp", 0 );
                    self setplayerdata( "prestigeDoubleXpTimePlayed", 0 );
                    self setplayerdata( "prestigeDoubleXpMaxTimePlayed", 0 );
                    self.prestigedoublexp = 0;
                }
                else
                    var_11 = 2;
            }

            if ( !self.prestigedoublexp )
            {
                for ( var_13 = 0; var_13 < 3; var_13++ )
                {
                    if ( self getplayerdata( "xpMultiplierTimePlayed", var_13 ) < self.bufferedchildstatsmax["xpMaxMultiplierTimePlayed"][var_13] )
                        var_10 += int( self getplayerdata( "xpMultiplier", var_13 ) );
                }
            }

            if ( var_11 > 0 )
                var_1 = int( var_1 * level.xpscale * var_11 );
            else if ( var_10 > 0 )
                var_1 = int( var_1 * level.xpscale * var_10 );
            else
                var_1 = int( var_1 * level.xpscale );

            if ( isdefined( level.nukedetonated ) && level.nukedetonated )
            {
                if ( level.teambased && level.nukeinfo.team == self.team )
                    var_1 *= level.nukeinfo._id_0036;
                else if ( !level.teambased && level.nukeinfo.player == self )
                    var_1 *= level.nukeinfo._id_0036;

                var_1 = int( var_1 );
            }

            var_14 = getrestxpaward( var_1 );
            var_1 += var_14;

            if ( var_14 > 0 )
            {
                if ( islastrestxpaward( var_1 ) )
                    thread maps\mp\gametypes\_hud_message::splashnotify( "rested_done" );

                var_8 = 1;
            }

            break;
        case "challenge":
            var_10 = 0;

            if ( self getplayerdata( "challengeXPMultiplierTimePlayed", 0 ) < self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][0] )
            {
                var_10 += int( self getplayerdata( "challengeXPMultiplier", 0 ) );

                if ( var_10 > 0 )
                    var_1 = int( var_1 * var_10 );
            }

            break;
    }

    if ( !var_8 )
    {
        if ( self getplayerdata( "restXPGoal" ) > getrankxp() )
            self setplayerdata( "restXPGoal", self getplayerdata( "restXPGoal" ) + var_1 );
    }

    var_15 = getrankxp();
    self.xpgains[var_0] += var_1;
    incrankxp( var_1 );

    if ( maps\mp\_utility::rankingenabled() && updaterank( var_15 ) )
        thread updaterankannouncehud();

    syncxpstat();
    var_16 = maps\mp\gametypes\_missions::isweaponchallenge( var_4 );

    if ( var_16 )
        var_2 = self getcurrentweapon();

    if ( var_0 == "shield_damage" )
    {
        var_2 = self getcurrentweapon();
        var_3 = "MOD_MELEE";
    }

    if ( weaponshouldgetxp( var_2, var_3 ) || var_16 )
    {
        var_17 = strtok( var_2, "_" );

        if ( var_17[0] == "iw5" )
            var_18 = var_17[0] + "_" + var_17[1];
        else if ( var_17[0] == "alt" )
            var_18 = var_17[1] + "_" + var_17[2];
        else
            var_18 = var_17[0];

        if ( var_17[0] == "gl" )
            var_18 = var_17[1];

        if ( self isitemunlocked( var_18 ) )
        {
            if ( self.primaryweapon == var_2 || self.secondaryweapon == var_2 || weaponaltweaponname( self.primaryweapon ) == var_2 || isdefined( self.tookweaponfrom ) && isdefined( self.tookweaponfrom[var_2] ) )
            {
                var_19 = getweaponrankxp( var_18 );

                switch ( var_0 )
                {
                    case "kill":
                        var_20 = 100;
                        break;
                    default:
                        var_20 = var_1;
                        break;
                }

                if ( self.prestigedoubleweaponxp )
                {
                    var_21 = self getplayerdata( "prestigeDoubleWeaponXpTimePlayed" );

                    if ( var_21 >= self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] )
                    {
                        self setplayerdata( "prestigeDoubleWeaponXp", 0 );
                        self setplayerdata( "prestigeDoubleWeaponXpTimePlayed", 0 );
                        self setplayerdata( "prestigeDoubleWeaponXpMaxTimePlayed", 0 );
                        self.prestigedoubleweaponxp = 0;
                    }
                    else
                        var_20 *= 2;
                }

                if ( self getplayerdata( "weaponXPMultiplierTimePlayed", 0 ) < self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][0] )
                {
                    var_22 = int( self getplayerdata( "weaponXPMultiplier", 0 ) );

                    if ( var_22 > 0 )
                        var_20 *= var_22;
                }

                var_23 = var_19 + var_20;

                if ( !isweaponmaxrank( var_18 ) )
                {
                    var_24 = getweaponmaxrankxp( var_18 );

                    if ( var_23 > var_24 )
                    {
                        var_23 = var_24;
                        var_20 = var_24 - var_19;
                    }

                    if ( !isdefined( self.weaponsused ) )
                    {
                        self.weaponsused = [];
                        self.weaponxpearned = [];
                    }

                    var_25 = 0;
                    var_26 = 999;

                    for ( var_13 = 0; var_13 < self.weaponsused.size; var_13++ )
                    {
                        if ( self.weaponsused[var_13] == var_18 )
                        {
                            var_25 = 1;
                            var_26 = var_13;
                        }
                    }

                    if ( var_25 )
                        self.weaponxpearned[var_26] += var_20;
                    else
                    {
                        self.weaponsused[self.weaponsused.size] = var_18;
                        self.weaponxpearned[self.weaponxpearned.size] = var_20;
                    }

                    self setplayerdata( "weaponXP", var_18, var_23 );
                    maps\mp\_matchdata::logweaponstat( var_18, "XP", var_20 );
                    maps\mp\_utility::incplayerstat( "weaponxpearned", var_20 );

                    if ( maps\mp\_utility::rankingenabled() && updateweaponrank( var_23, var_18 ) )
                        thread updateweaponrankannouncehud();
                }
            }
        }
    }

    if ( !level.hardcoremode )
    {
        if ( var_0 == "teamkill" )
            thread xppointspopup( 0 - getscoreinfovalue( "kill" ), 0, ( 1.0, 0.0, 0.0 ), 0 );
        else
        {
            var_27 = ( 1.0, 1.0, 0.5 );

            if ( var_8 )
                var_27 = ( 1.0, 0.65, 0.0 );

            thread xppointspopup( var_1, var_7, var_27, 0 );

            if ( var_0 == "assist" )
            {
                if ( isdefined( self.taggedassist ) )
                    self.taggedassist = undefined;
                else
                {
                    var_6 = &"MP_ASSIST";

                    if ( maps\mp\_utility::_hasperk( "specialty_assists" ) )
                    {
                        if ( !( self.pers["assistsToKill"] % 2 ) )
                            var_6 = &"MP_ASSIST_TO_KILL";
                    }

                    thread xpeventpopup( var_6 );
                }
            }
        }
    }

    switch ( var_0 )
    {
        case "kill":
        case "assist":
        case "suicide":
        case "teamkill":
        case "headshot":
        case "return":
        case "capture":
        case "defend":
        case "assault":
        case "pickup":
        case "plant":
        case "defuse":
        case "kill_confirmed":
        case "kill_denied":
        case "tags_retrieved":
        case "team_assist":
        case "kill_bonus":
        case "kill_carrier":
        case "draft_rogue":
        case "survivor":
        case "final_rogue":
        case "gained_gun_rank":
        case "dropped_enemy_gun_rank":
        case "got_juggernaut":
        case "kill_as_juggernaut":
        case "kill_juggernaut":
        case "jugg_on_jugg":
            self.pers["summary"]["score"] += var_1;
            self.pers["summary"]["xp"] += var_1;
            break;
        case "win":
        case "loss":
        case "tie":
            self.pers["summary"]["match"] += var_1;
            self.pers["summary"]["xp"] += var_1;
            break;
        case "challenge":
            self.pers["summary"]["challenge"] += var_1;
            self.pers["summary"]["xp"] += var_1;
            break;
        default:
            self.pers["summary"]["misc"] += var_1;
            self.pers["summary"]["match"] += var_1;
            self.pers["summary"]["xp"] += var_1;
            break;
    }
}

weaponshouldgetxp( var_0, var_1 )
{
    if ( self isitemunlocked( "cac" ) && !maps\mp\_utility::isjuggernaut() && isdefined( var_0 ) && isdefined( var_1 ) && !maps\mp\_utility::iskillstreakweapon( var_0 ) )
    {
        if ( maps\mp\_utility::isbulletdamage( var_1 ) )
            return 1;

        if ( isexplosivedamagemod( var_1 ) || var_1 == "MOD_IMPACT" )
        {
            if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_projectile" || maps\mp\_utility::getweaponclass( var_0 ) == "weapon_assault" )
                return 1;
        }

        if ( var_1 == "MOD_MELEE" )
        {
            if ( maps\mp\_utility::getweaponclass( var_0 ) == "weapon_riot" )
                return 1;
        }
    }

    return 0;
}

updaterank( var_0 )
{
    var_1 = getrank();

    if ( var_1 == self.pers["rank"] )
        return 0;

    var_2 = self.pers["rank"];
    self.pers["rank"] = var_1;
    self setrank( var_1 );
    return 1;
}

updateweaponrank( var_0, var_1 )
{
    var_2 = getweaponrank( var_1 );

    if ( var_2 == self.pers["weaponRank"] )
        return 0;

    var_3 = self.pers["weaponRank"];
    self.pers["weaponRank"] = var_2;
    self setplayerdata( "weaponRank", var_1, var_2 );
    thread maps\mp\gametypes\_missions::masterychallengeprocess( var_1 );
    return 1;
}

updaterankannouncehud()
{
    self endon( "disconnect" );
    self notify( "update_rank" );
    self endon( "update_rank" );
    var_0 = self.pers["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !maps\mp\_utility::levelflag( "game_over" ) )
        level common_scripts\utility::waittill_notify_or_timeout( "game_over", 0.25 );

    var_1 = getrankinfofull( self.pers["rank"] );
    var_2 = level.ranktable[self.pers["rank"]][1];
    var_3 = int( var_2[var_2.size - 1] );
    thread maps\mp\gametypes\_hud_message::promotionsplashnotify();

    if ( var_3 > 1 )
        return;

    for ( var_4 = 0; var_4 < level.players.size; var_4++ )
    {
        var_5 = level.players[var_4];
        var_6 = var_5.pers["team"];

        if ( isdefined( var_6 ) && var_5 != self )
        {
            if ( var_6 == var_0 )
                var_5 iprintln( &"RANK_PLAYER_WAS_PROMOTED", self, var_1 );
        }
    }
}

updateweaponrankannouncehud()
{
    self endon( "disconnect" );
    self notify( "update_weapon_rank" );
    self endon( "update_weapon_rank" );
    var_0 = self.pers["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !maps\mp\_utility::levelflag( "game_over" ) )
        level common_scripts\utility::waittill_notify_or_timeout( "game_over", 0.25 );

    thread maps\mp\gametypes\_hud_message::weaponpromotionsplashnotify();
}

endgameupdate()
{
    var_0 = self;
}

createxppointspopup()
{
    var_0 = newclienthudelem( self );
    var_0.horzalign = "center";
    var_0.vertalign = "middle";
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.x = 30;

    if ( level.splitscreen )
        var_0.y = -30;
    else
        var_0.y = -50;

    var_0.font = "hudbig";
    var_0.fontscale = 0.65;
    var_0.archived = 0;
    var_0.color = ( 0.5, 0.5, 0.5 );
    var_0.sort = 10000;
    var_0 maps\mp\gametypes\_hud::fontpulseinit( 3.0 );
    return var_0;
}

xppointspopup( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( var_0 == 0 )
        return;

    self notify( "xpPointsPopup" );
    self endon( "xpPointsPopup" );
    self.xpupdatetotal += var_0;
    self.bonusupdatetotal += var_1;
    wait 0.05;

    if ( self.xpupdatetotal < 0 )
        self.hud_xppointspopup.label = &"";
    else
        self.hud_xppointspopup.label = &"MP_PLUS";

    self.hud_xppointspopup.color = var_2;
    self.hud_xppointspopup.glowcolor = var_2;
    self.hud_xppointspopup.glowalpha = var_3;
    self.hud_xppointspopup setvalue( self.xpupdatetotal );
    self.hud_xppointspopup.alpha = 0.85;
    self.hud_xppointspopup thread maps\mp\gametypes\_hud::fontpulse( self );
    var_4 = max( int( self.bonusupdatetotal / 20 ), 1 );

    if ( self.bonusupdatetotal )
    {
        while ( self.bonusupdatetotal > 0 )
        {
            self.xpupdatetotal += min( self.bonusupdatetotal, var_4 );
            self.bonusupdatetotal -= min( self.bonusupdatetotal, var_4 );
            self.hud_xppointspopup setvalue( self.xpupdatetotal );
            wait 0.05;
        }
    }
    else
        wait 1.0;

    self.hud_xppointspopup fadeovertime( 0.75 );
    self.hud_xppointspopup.alpha = 0;
    self.xpupdatetotal = 0;
}

createxpeventpopup()
{
    var_0 = newclienthudelem( self );
    var_0.children = [];
    var_0.horzalign = "center";
    var_0.vertalign = "middle";
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.x = 55;

    if ( level.splitscreen )
        var_0.y = -20;
    else
        var_0.y = -35;

    var_0.font = "hudbig";
    var_0.fontscale = 0.65;
    var_0.archived = 0;
    var_0.color = ( 0.5, 0.5, 0.5 );
    var_0.sort = 10000;
    var_0.elemtype = "msgText";
    var_0 maps\mp\gametypes\_hud::fontpulseinit( 3.0 );
    return var_0;
}

xpeventpopupfinalize( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self notify( "xpEventPopup" );
    self endon( "xpEventPopup" );

    if ( level.hardcoremode )
        return;

    wait 0.05;

    if ( !isdefined( var_1 ) )
        var_1 = ( 1.0, 1.0, 0.5 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( self ) )
        return;

    self.hud_xpeventpopup.color = var_1;
    self.hud_xpeventpopup.glowcolor = var_1;
    self.hud_xpeventpopup.glowalpha = var_2;
    self.hud_xpeventpopup settext( var_0 );
    self.hud_xpeventpopup.alpha = 0.85;
    wait 1.0;

    if ( !isdefined( self ) )
        return;

    self.hud_xpeventpopup fadeovertime( 0.75 );
    self.hud_xpeventpopup.alpha = 0;
    self notify( "PopComplete" );
}

xpeventpopupterminate()
{
    self endon( "PopComplete" );
    common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    self.hud_xpeventpopup fadeovertime( 0.05 );
    self.hud_xpeventpopup.alpha = 0;
}

xpeventpopup( var_0, var_1, var_2 )
{
    thread xpeventpopupfinalize( var_0, var_1, var_2 );
    thread xpeventpopupterminate();
}

removerankhud()
{
    self.hud_xppointspopup.alpha = 0;
}

getrank()
{
    var_0 = self.pers["rankxp"];
    var_1 = self.pers["rank"];

    if ( var_0 < getrankinfominxp( var_1 ) + getrankinfoxpamt( var_1 ) )
        return var_1;
    else
        return getrankforxp( var_0 );
}

getweaponrank( var_0 )
{
    var_1 = self getplayerdata( "weaponXP", var_0 );
    return getweaponrankforxp( var_1, var_0 );
}

levelforexperience( var_0 )
{
    return getrankforxp( var_0 );
}

weaponlevelforexperience( var_0 )
{
    return getweaponrankforxp( var_0 );
}

getcurrentweaponxp()
{
    var_0 = self getcurrentweapon();

    if ( isdefined( var_0 ) )
        return self getplayerdata( "weaponXP", var_0 );

    return 0;
}

getrankforxp( var_0 )
{
    var_1 = 0;
    var_2 = level.ranktable[var_1][1];

    while ( isdefined( var_2 ) && var_2 != "" )
    {
        if ( var_0 < getrankinfominxp( var_1 ) + getrankinfoxpamt( var_1 ) )
            return var_1;

        var_1++;

        if ( isdefined( level.ranktable[var_1] ) )
        {
            var_2 = level.ranktable[var_1][1];
            continue;
        }

        var_2 = undefined;
    }

    var_1--;
    return var_1;
}

getweaponrankforxp( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_2 = tablelookup( "mp/statstable.csv", 4, var_1, 2 );
    var_3 = int( tablelookup( "mp/weaponRankTable.csv", 0, var_2, 1 ) );

    for ( var_4 = 0; var_4 < var_3 + 1; var_4++ )
    {
        if ( var_0 < getweaponrankinfominxp( var_4 ) + getweaponrankinfoxpamt( var_4 ) )
            return var_4;
    }

    return var_4 - 1;
}

getspm()
{
    var_0 = getrank() + 1;
    return ( 3 + var_0 * 0.5 ) * 10;
}

getprestigelevel()
{
    return maps\mp\gametypes\_persistence::statget( "prestige" );
}

getrankxp()
{
    return self.pers["rankxp"];
}

getweaponrankxp( var_0 )
{
    return self getplayerdata( "weaponXP", var_0 );
}

getweaponmaxrankxp( var_0 )
{
    var_1 = tablelookup( "mp/statstable.csv", 4, var_0, 2 );
    var_2 = int( tablelookup( "mp/weaponRankTable.csv", 0, var_1, 1 ) );
    var_3 = getweaponrankinfomaxxp( var_2 );
    return var_3;
}

isweaponmaxrank( var_0 )
{
    var_1 = self getplayerdata( "weaponXP", var_0 );
    var_2 = getweaponmaxrankxp( var_0 );
    return var_1 >= var_2;
}

incrankxp( var_0 )
{
    if ( !maps\mp\_utility::rankingenabled() )
        return;

    if ( isdefined( self.ischeater ) )
        return;

    var_1 = getrankxp();
    var_2 = int( min( var_1, getrankinfomaxxp( level.maxrank ) ) ) + var_0;

    if ( self.pers["rank"] == level.maxrank && var_2 >= getrankinfomaxxp( level.maxrank ) )
        var_2 = getrankinfomaxxp( level.maxrank );

    self.pers["rankxp"] = var_2;
}

getrestxpaward( var_0 )
{
    if ( !getdvarint( "scr_restxp_enable" ) )
        return 0;

    var_1 = getdvarfloat( "scr_restxp_restedAwardScale" );
    var_2 = int( var_0 * var_1 );
    var_3 = self getplayerdata( "restXPGoal" ) - getrankxp();

    if ( var_3 <= 0 )
        return 0;

    return var_2;
}

islastrestxpaward( var_0 )
{
    if ( !getdvarint( "scr_restxp_enable" ) )
        return 0;

    var_1 = getdvarfloat( "scr_restxp_restedAwardScale" );
    var_2 = int( var_0 * var_1 );
    var_3 = self getplayerdata( "restXPGoal" ) - getrankxp();

    if ( var_3 <= 0 )
        return 0;

    if ( var_2 >= var_3 )
        return 1;

    return 0;
}

syncxpstat()
{
    if ( level.xpscale > 4 || level.xpscale <= 0 )
        exitlevel( 0 );

    var_0 = getrankxp();
    maps\mp\gametypes\_persistence::statset( "experience", var_0 );
}
