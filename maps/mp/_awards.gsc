// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    initawards();
    level thread onplayerconnect();
    level thread monitormovementdistance();
    level thread monitorenemydistance();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["stats"] ) )
            var_0.pers["stats"] = [];

        var_0.stats = var_0.pers["stats"];

        if ( !var_0.stats.size )
        {
            var_0 setplayerdata( "round", "awardCount", 0 );

            foreach ( var_3, var_2 in level.awards )
            {
                if ( isdefined( level.awards[var_3].defaultvalue ) )
                {
                    var_0 maps\mp\_utility::initplayerstat( var_3, level.awards[var_3].defaultvalue );
                    continue;
                }

                var_0 maps\mp\_utility::initplayerstat( var_3 );
            }
        }

        var_0.prevpos = var_0.origin;
        var_0.previousdeaths = 0;
        var_0.altitudepolls = 0;
        var_0.totalaltitudesum = 0;
        var_0.usedweapons = [];
        var_0 thread onplayerspawned();
        var_0 thread monitorpositioncamping();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread monitorreloads();
        thread monitorshotsfired();
        thread monitorswaps();
        thread monitorexplosionssurvived();
        thread monitorshieldblocks();
        thread monitorflashhits();
        thread monitorstunhits();
        thread monitorstancetime();
    }
}

initawards()
{
    if ( isdefined( level.initgametypeawards ) )
        [[ level.initgametypeawards ]]();

    initawardflag( "10kills", ::isatleast, 10, "kills" );
    initawardflag( "1death", ::isatleast, 1, "deaths" );
    initawardflag( "nodeaths", ::isatmost, 0, "deaths" );
    initawardflag( "nokills", ::isatmost, 0, "kills" );
    initmultiaward( "mvp", "kills", "deaths" );
    initmultiaward( "punisher", "kills", "killstreak" );
    initmultiaward( "overkill", "kills", "headshots" );
    initstataward( "kdratio", 0, ::highestwins );
    initstataward( "kills", 0, ::highestwins );
    initstataward( "higherrankkills", 0, ::highestwins );
    initstataward( "deaths", 0, ::lowestwithhalfplayedtime );
    initstataward( "killstreak", 0, ::highestwins );
    initstataward( "headshots", 0, ::highestwins );
    initstataward( "closertoenemies", 0, ::highestwins );
    initstataward( "throwingknifekills", 0, ::highestwins );
    initstataward( "grenadekills", 0, ::highestwins );
    initstataward( "helicopters", 0, ::highestwins );
    initstataward( "airstrikes", 0, ::highestwins );
    initstataward( "uavs", 0, ::highestwins );
    initstataward( "mostmultikills", 0, ::highestwins );
    initstataward( "multikill", 0, ::highestwins );
    initstataward( "knifekills", 0, ::highestwins );
    initstataward( "flankkills", 0, ::highestwins );
    initstataward( "bulletpenkills", 0, ::highestwins );
    initstataward( "laststandkills", 0, ::highestwins );
    initstataward( "laststanderkills", 0, ::highestwins );
    initstataward( "assists", 0, ::highestwins );
    initstataward( "c4kills", 0, ::highestwins );
    initstataward( "claymorekills", 0, ::highestwins );
    initstataward( "fragkills", 0, ::highestwins );
    initstataward( "semtexkills", 0, ::highestwins );
    initstataward( "explosionssurvived", 0, ::highestwins );
    initstataward( "mosttacprevented", 0, ::highestwins );
    initstataward( "avengekills", 0, ::highestwins );
    initstataward( "rescues", 0, ::highestwins );
    initstataward( "longshots", 0, ::highestwins );
    initstataward( "adskills", 0, ::highestwins );
    initstataward( "hipfirekills", 0, ::highestwins );
    initstataward( "revengekills", 0, ::highestwins );
    initstataward( "longestlife", 0, ::highestwins );
    initstataward( "throwbacks", 0, ::highestwins );
    initstataward( "otherweaponkills", 0, ::highestwins );
    initstataward( "killedsameplayer", 0, ::highestwins, 2 );
    initstataward( "mostweaponsused", 0, ::highestwins, 3 );
    initstataward( "distancetraveled", 0, ::highestwins );
    initstataward( "mostreloads", 0, ::highestwins );
    initstataward( "mostswaps", 0, ::highestwins );
    initstat( "flankdeaths", 0 );
    initstataward( "thermalkills", 0, ::highestwins );
    initstataward( "mostcamperkills", 0, ::highestwins );
    initstataward( "fbhits", 0, ::highestwins );
    initstataward( "stunhits", 0, ::highestwins );
    initstataward( "scopedkills", 0, ::highestwins );
    initstataward( "arkills", 0, ::highestwins );
    initstataward( "arheadshots", 0, ::highestwins );
    initstataward( "lmgkills", 0, ::highestwins );
    initstataward( "lmgheadshots", 0, ::highestwins );
    initstataward( "sniperkills", 0, ::highestwins );
    initstataward( "sniperheadshots", 0, ::highestwins );
    initstataward( "shieldblocks", 0, ::highestwins );
    initstataward( "shieldkills", 0, ::highestwins );
    initstataward( "smgkills", 0, ::highestwins );
    initstataward( "smgheadshots", 0, ::highestwins );
    initstataward( "shotgunkills", 0, ::highestwins );
    initstataward( "shotgunheadshots", 0, ::highestwins );
    initstataward( "pistolkills", 0, ::highestwins );
    initstataward( "pistolheadshots", 0, ::highestwins );
    initstataward( "rocketkills", 0, ::highestwins );
    initstataward( "equipmentkills", 0, ::highestwins );
    initstataward( "mostclasseschanged", 0, ::highestwins );
    initstataward( "lowerrankkills", 0, ::highestwins );
    initstataward( "sprinttime", 0, ::highestwins, 1 );
    initstataward( "crouchtime", 0, ::highestwins );
    initstataward( "pronetime", 0, ::highestwins );
    initstataward( "comebacks", 0, ::highestwins );
    initstataward( "mostshotsfired", 0, ::highestwins );
    initstataward( "timeinspot", 0, ::highestwins );
    initstataward( "killcamtimewatched", 0, ::highestwins );
    initstataward( "greatestavgalt", 0, ::highestwins );
    initstataward( "leastavgalt", 9999999, ::lowestwins );
    initstataward( "weaponxpearned", 0, ::highestwins );
    initstataward( "assaultkillstreaksused", 0, ::highestwins );
    initstataward( "supportkillstreaksused", 0, ::highestwins );
    initstataward( "specialistkillstreaksearned", 0, ::highestwins );
    initstataward( "killsconfirmed", 0, ::highestwins );
    initstataward( "killsdenied", 0, ::highestwins );
    initstataward( "holdingteamdefenderflag", 0, ::highestwins );
    initstataward( "damagedone", 0, ::highestwins );
    initstataward( "damagetaken", 0, ::lowestwins );

    if ( !maps\mp\_utility::matchmakinggame() )
    {
        initstataward( "killcamskipped", 0, ::highestwins );
        initstataward( "killsteals", 0, ::highestwins );

        if ( !maps\mp\_utility::getgametypenumlives() )
            initstataward( "deathstreak", 0, ::highestwins );

        initstataward( "shortestlife", 9999999, ::lowestwins );
        initstataward( "suicides", 0, ::highestwins );
        initstataward( "mostff", 0, ::highestwins );
        initstataward( "shotgundeaths", 0, ::highestwins );
        initstataward( "shielddeaths", 0, ::highestwins );
        initstataward( "flankdeaths", 0, ::highestwins );
    }
}

initbaseaward( var_0 )
{
    level.awards[var_0] = spawnstruct();
    level.awards[var_0].winners = [];
    level.awards[var_0].exclusive = 1;
}

initawardprocess( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        level.awards[var_0].process = var_1;

    if ( isdefined( var_2 ) )
        level.awards[var_0].var1 = var_2;

    if ( isdefined( var_3 ) )
        level.awards[var_0].var2 = var_3;
}

initstat( var_0, var_1 )
{
    initbaseaward( var_0 );
    level.awards[var_0].defaultvalue = var_1;
    level.awards[var_0].type = "stat";
}

initstataward( var_0, var_1, var_2, var_3, var_4 )
{
    initbaseaward( var_0 );
    initawardprocess( var_0, var_2, var_3, var_4 );
    level.awards[var_0].defaultvalue = var_1;
    level.awards[var_0].type = "stat";
}

initderivedaward( var_0, var_1, var_2, var_3 )
{
    initbaseaward( var_0 );
    initawardprocess( var_0, var_1, var_2, var_3 );
    level.awards[var_0].type = "derived";
}

initawardflag( var_0, var_1, var_2, var_3 )
{
    initbaseaward( var_0 );
    initawardprocess( var_0, var_1, var_2, var_3 );
    level.awards[var_0].type = "flag";
}

initmultiaward( var_0, var_1, var_2 )
{
    initbaseaward( var_0 );
    level.awards[var_0].award1_ref = var_1;
    level.awards[var_0].award2_ref = var_2;
    level.awards[var_0].type = "multi";
}

initthresholdaward( var_0, var_1, var_2, var_3 )
{
    initbaseaward( var_0 );
    initawardprocess( var_0, var_1, var_2, var_3 );
    level.awards[var_0].type = "threshold";
}

setmatchrecordifgreater( var_0 )
{
    var_1 = maps\mp\_utility::getplayerstat( var_0 );
    var_2 = maps\mp\_utility::getplayerstattime( var_0 );
    var_3 = getawardrecord( var_0 );
    var_4 = getawardrecordtime( var_0 );

    if ( !isdefined( var_3 ) || var_1 > var_3 )
    {
        clearawardwinners( var_0 );
        addawardwinner( var_0, self.clientid );
        setawardrecord( var_0, var_1, var_2 );
    }
    else if ( var_1 == var_3 )
    {
        if ( isawardexclusive( var_0 ) )
        {
            if ( !isdefined( var_4 ) || var_2 < var_4 )
            {
                clearawardwinners( var_0 );
                addawardwinner( var_0, self.clientid );
                setawardrecord( var_0, var_1, var_2 );
            }
        }
        else
            addawardwinner( var_0, self.clientid );
    }
}

setmatchrecordiflower( var_0 )
{
    var_1 = maps\mp\_utility::getplayerstat( var_0 );
    var_2 = maps\mp\_utility::getplayerstattime( var_0 );
    var_3 = getawardrecord( var_0 );
    var_4 = getawardrecordtime( var_0 );

    if ( !isdefined( var_3 ) || var_1 < var_3 )
    {
        clearawardwinners( var_0 );
        addawardwinner( var_0, self.clientid );
        setawardrecord( var_0, var_1, var_2 );
    }
    else if ( var_1 == var_3 )
    {
        if ( isawardexclusive( var_0 ) )
        {
            if ( !isdefined( var_4 ) || var_2 < var_4 )
            {
                clearawardwinners( var_0 );
                addawardwinner( var_0, self.clientid );
                setawardrecord( var_0, var_1, var_2 );
            }
        }
        else
            addawardwinner( var_0, self.clientid );
    }
}

getdecodedratio( var_0 )
{
    var_1 = getratioloval( var_0 );
    var_2 = getratiohival( var_0 );

    if ( !var_1 )
        return var_2 + 0.001;

    return var_2 / var_1;
}

setpersonalbestifgreater( var_0 )
{
    var_1 = self getplayerdata( "bests", var_0 );
    var_2 = maps\mp\_utility::getplayerstat( var_0 );

    if ( var_1 == 0 || var_2 > var_1 )
    {
        var_2 = getformattedvalue( var_0, var_2 );
        self setplayerdata( "bests", var_0, var_2 );
    }
}

setpersonalbestiflower( var_0 )
{
    var_1 = self getplayerdata( "bests", var_0 );
    var_2 = maps\mp\_utility::getplayerstat( var_0 );

    if ( var_1 == 0 || var_2 < var_1 )
    {
        var_2 = getformattedvalue( var_0, var_2 );
        self setplayerdata( "bests", var_0, var_2 );
    }
}

incplayerrecord( var_0 )
{
    var_1 = self getplayerdata( "awards", var_0 );
    self setplayerdata( "awards", var_0, var_1 + 1 );
}

addawardwinner( var_0, var_1 )
{
    foreach ( var_3 in level.awards[var_0].winners )
    {
        if ( var_3 == var_1 )
            return;
    }

    level.awards[var_0].winners[level.awards[var_0].winners.size] = var_1;
}

getawardwinners( var_0 )
{
    return level.awards[var_0].winners;
}

clearawardwinners( var_0 )
{
    level.awards[var_0].winners = [];
}

setawardrecord( var_0, var_1, var_2 )
{
    level.awards[var_0].value = var_1;
    level.awards[var_0].time = var_2;
}

getawardrecord( var_0 )
{
    return level.awards[var_0].value;
}

getawardrecordtime( var_0 )
{
    return level.awards[var_0].time;
}

assignawards()
{
    foreach ( var_1 in level.players )
    {
        if ( !var_1 maps\mp\_utility::rankingenabled() )
            return;

        var_2 = var_1 maps\mp\_utility::getplayerstat( "kills" );
        var_3 = var_1 maps\mp\_utility::getplayerstat( "deaths" );

        if ( var_3 == 0 )
            var_3 = 1;

        var_1 maps\mp\_utility::setplayerstat( "kdratio", var_2 / var_3 );

        if ( isalive( var_1 ) )
        {
            var_4 = gettime() - var_1.spawntime;
            var_1 maps\mp\_utility::setplayerstatifgreater( "longestlife", var_4 );
        }
    }

    foreach ( var_11, var_7 in level.awards )
    {
        if ( !isdefined( level.awards[var_11].process ) )
            continue;

        var_8 = level.awards[var_11].process;
        var_9 = level.awards[var_11].var1;
        var_10 = level.awards[var_11].var2;

        if ( isdefined( var_9 ) && isdefined( var_10 ) )
        {
            [[ var_8 ]]( var_11, var_9, var_10 );
            continue;
        }

        if ( isdefined( var_9 ) )
        {
            [[ var_8 ]]( var_11, var_9 );
            continue;
        }

        [[ var_8 ]]( var_11 );
    }

    foreach ( var_11, var_7 in level.awards )
    {
        if ( !ismultiaward( var_11 ) )
            continue;

        var_13 = level.awards[var_11].award1_ref;
        var_14 = level.awards[var_11].award2_ref;
        var_15 = getawardwinners( var_13 );
        var_16 = getawardwinners( var_14 );

        if ( !isdefined( var_15 ) || !isdefined( var_16 ) )
            continue;

        foreach ( var_18 in var_15 )
        {
            foreach ( var_20 in var_16 )
            {
                if ( var_18 == var_20 )
                {
                    addawardwinner( var_11, var_18 );
                    var_1 = maps\mp\_utility::playerforclientid( var_18 );
                    var_21 = var_1 maps\mp\_utility::getplayerstat( var_13 );
                    var_22 = var_1 maps\mp\_utility::getplayerstat( var_14 );
                    var_1 maps\mp\_utility::setplayerstat( var_11, encoderatio( var_21, var_22 ) );
                }
            }
        }
    }

    foreach ( var_11, var_7 in level.awards )
    {
        if ( !isawardflag( var_11 ) )
            assignaward( var_11 );
    }

    foreach ( var_1 in level.players )
    {
        var_27 = var_1 getplayerdata( "round", "awardCount" );

        for ( var_28 = 0; var_28 < var_27 && var_28 < 3; var_28++ )
        {
            var_7 = var_1 getplayerdata( "round", "awards", var_28, "award" );
            var_29 = var_1 getplayerdata( "round", "awards", var_28, "value" );
        }
    }
}

assignaward( var_0 )
{
    var_1 = getawardwinners( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    foreach ( var_3 in var_1 )
    {
        foreach ( var_5 in level.players )
        {
            if ( var_5.clientid == var_3 )
                var_5 giveaward( var_0 );
        }
    }
}

getawardtype( var_0 )
{
    if ( isdefined( level.awards[var_0].type ) )
        return level.awards[var_0].type;
    else
        return "none";
}

ismultiaward( var_0 )
{
    return getawardtype( var_0 ) == "multi";
}

isstataward( var_0 )
{
    return getawardtype( var_0 ) == "stat";
}

isthresholdaward( var_0 )
{
    return getawardtype( var_0 ) == "threshold";
}

isawardflag( var_0 )
{
    return getawardtype( var_0 ) == "flag";
}

isawardexclusive( var_0 )
{
    if ( isdefined( level.awards[var_0].exclusive ) )
        return level.awards[var_0].exclusive;
    else
        return 1;
}

hasdisplayvalue( var_0 )
{
    var_1 = getawardtype( var_0 );

    switch ( var_1 )
    {
        case "derived":
            var_2 = 0;
            break;
        case "multi":
        case "stat":
        default:
            var_2 = 1;
            break;
    }

    return var_2;
}

giveaward( var_0 )
{
    var_1 = self getplayerdata( "round", "awardCount" );
    incplayerrecord( var_0 );

    if ( hasdisplayvalue( var_0 ) )
    {
        if ( isstataward( var_0 ) )
        {

        }

        var_2 = maps\mp\_utility::getplayerstat( var_0 );
    }
    else
        var_2 = 1;

    var_2 = getformattedvalue( var_0, var_2 );

    if ( var_1 < 5 )
    {
        self setplayerdata( "round", "awards", var_1, "award", var_0 );
        self setplayerdata( "round", "awards", var_1, "value", var_2 );
    }

    var_1++;
    self setplayerdata( "round", "awardCount", var_1 );
    maps\mp\_matchdata::logaward( var_0 );

    if ( var_1 == 1 )
        maps\mp\_highlights::givehighlight( var_0, var_2 );
}

getformattedvalue( var_0, var_1 )
{
    var_2 = tablelookup( "mp/awardTable.csv", 1, var_0, 7 );

    switch ( var_2 )
    {
        case "float":
            var_1 = maps\mp\_utility::limitdecimalplaces( var_1, 2 );
            var_1 *= 100;
            break;
        case "distance":
        case "none":
        case "count":
        case "time":
        case "multi":
        case "ratio":
        default:
            break;
    }

    var_1 = int( var_1 );
    return var_1;
}

highestwins( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_3 maps\mp\_utility::rankingenabled() && var_3 statvaluechanged( var_0 ) && ( !isdefined( var_1 ) || var_3 maps\mp\_utility::getplayerstat( var_0 ) >= var_1 ) )
        {
            var_3 setmatchrecordifgreater( var_0 );

            if ( !isawardflag( var_0 ) )
                var_3 setpersonalbestifgreater( var_0 );
        }
    }
}

lowestwins( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_3 maps\mp\_utility::rankingenabled() && var_3 statvaluechanged( var_0 ) && ( !isdefined( var_1 ) || var_3 maps\mp\_utility::getplayerstat( var_0 ) <= var_1 ) )
        {
            var_3 setmatchrecordiflower( var_0 );

            if ( !isawardflag( var_0 ) )
                var_3 setpersonalbestiflower( var_0 );
        }
    }
}

lowestwithhalfplayedtime( var_0 )
{
    var_1 = maps\mp\_utility::gettimepassed() / 1000;
    var_2 = var_1 * 0.5;

    foreach ( var_4 in level.players )
    {
        if ( var_4.hasspawned && var_4.timeplayed["total"] >= var_2 )
        {
            var_4 setmatchrecordiflower( var_0 );

            if ( !isawardflag( var_0 ) )
                var_4 setpersonalbestiflower( var_0 );
        }
    }
}

statvaluechanged( var_0 )
{
    var_1 = maps\mp\_utility::getplayerstat( var_0 );
    var_2 = level.awards[var_0].defaultvalue;

    if ( var_1 == var_2 )
        return 0;
    else
        return 1;
}

isatleast( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        var_5 = var_4 maps\mp\_utility::getplayerstat( var_2 );
        var_6 = var_5;

        if ( var_6 >= var_1 )
            addawardwinner( var_0, var_4.clientid );

        if ( isthresholdaward( var_0 ) || isawardflag( var_0 ) )
            var_4 maps\mp\_utility::setplayerstat( var_0, var_5 );
    }
}

isatmost( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        var_5 = var_4 maps\mp\_utility::getplayerstat( var_2 );

        if ( var_5 <= var_1 )
            addawardwinner( var_0, var_4.clientid );
    }
}

isatmostwithhalfplayedtime( var_0, var_1, var_2 )
{
    var_3 = maps\mp\_utility::gettimepassed() / 1000;
    var_4 = var_3 * 0.5;

    foreach ( var_6 in level.players )
    {
        if ( var_6.hasspawned && var_6.timeplayed["total"] >= var_4 )
        {
            var_7 = var_6 maps\mp\_utility::getplayerstat( var_2 );

            if ( var_7 <= var_1 )
                addawardwinner( var_0, var_6.clientid );
        }
    }
}

setratio( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        var_5 = var_4 maps\mp\_utility::getplayerstat( var_1 );
        var_6 = var_4 maps\mp\_utility::getplayerstat( var_2 );

        if ( var_6 == 0 )
        {
            var_4 maps\mp\_utility::setplayerstat( var_0, var_5 );
            continue;
        }

        var_7 = var_5 / var_6;
        var_4 maps\mp\_utility::setplayerstat( var_0, var_7 );
    }
}

getkillstreakawardref( var_0 )
{
    switch ( var_0 )
    {
        case "uav":
        case "double_uav":
        case "triple_uav":
        case "counter_uav":
        case "uav_support":
            return "uavs";
        case "precision_airstrike":
        case "stealth_airstrike":
        case "harrier_airstrike":
        case "airstrike":
        case "super_airstrike":
            return "airstrikes";
        case "helicopter":
        case "helicopter_flares":
        case "littlebird_flock":
        case "littlebird_support":
        case "helicopter_minigun":
        case "helicopter_mk19":
        case "helicopter_blackbox":
            return "helicopters";
        default:
            return undefined;
    }
}

monitorreloads()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "reload" );
        maps\mp\_utility::incplayerstat( "mostreloads", 1 );
    }
}

monitorshotsfired()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "weapon_fired" );
        maps\mp\_utility::incplayerstat( "mostshotsfired", 1 );
    }
}

monitorswaps()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = "none";

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_0 == var_1 )
            continue;

        if ( var_1 == "none" )
            continue;

        if ( !maps\mp\gametypes\_weapons::isprimaryweapon( var_1 ) )
            continue;

        var_0 = var_1;
        maps\mp\_utility::incplayerstat( "mostswaps", 1 );
        var_2 = 0;

        foreach ( var_4 in self.usedweapons )
        {
            if ( var_1 == var_4 )
            {
                var_2 = 1;
                break;
            }
        }

        if ( !var_2 )
        {
            self.usedweapons[self.usedweapons.size] = var_1;
            maps\mp\_utility::incplayerstat( "mostweaponsused", 1 );
        }
    }
}

monitormovementdistance()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( !isalive( var_1 ) )
                continue;

            if ( var_1.deaths != var_1.previousdeaths )
            {
                var_1.prevpos = var_1.origin;
                var_1.previousdeaths = var_1.deaths;
            }

            var_2 = distance( var_1.origin, var_1.prevpos );
            var_1 maps\mp\_utility::incplayerstat( "distancetraveled", var_2 );
            var_1.prevpos = var_1.origin;
            var_1.altitudepolls++;
            var_1.totalaltitudesum += var_1.origin[2];
            var_3 = var_1.totalaltitudesum / var_1.altitudepolls;
            var_1 maps\mp\_utility::setplayerstat( "leastavgalt", var_3 );
            var_1 maps\mp\_utility::setplayerstat( "greatestavgalt", var_3 );
            wait 0.05;
        }

        wait 0.05;
    }
}

monitorpositioncamping()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self.lastcampchecked = gettime();
    self.positionarray = [];
    var_0 = 512;

    for (;;)
    {
        if ( !isalive( self ) )
        {
            wait 0.5;
            self.lastcampchecked = gettime();
            self.positionarray = [];
            continue;
        }

        self.positionarray[self.positionarray.size] = self.origin;

        if ( gettime() - self.lastcampchecked >= 15000 )
        {
            if ( distance( self.positionarray[0], self.origin ) < var_0 && distance( self.positionarray[1], self.positionarray[0] ) < var_0 )
            {
                var_1 = gettime() - self.lastcampchecked;
                maps\mp\_utility::incplayerstat( "timeinspot", var_1 );
            }

            self.positionarray = [];
            self.lastcampchecked = gettime();
        }

        wait 5;
    }
}

encoderatio( var_0, var_1 )
{
    return var_0 + ( var_1 << 16 );
}

getratiohival( var_0 )
{
    return var_0 & 65535;
}

getratioloval( var_0 )
{
    return var_0 >> 16;
}

monitorenemydistance()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( level.players.size < 3 )
        wait 1;

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( !isdefined( var_1 ) )
                continue;

            if ( var_1.team == "spectator" )
                continue;

            if ( !isalive( var_1 ) )
                continue;

            var_2 = sortbydistance( level.players, var_1.origin );

            if ( !var_2.size )
            {
                wait 0.05;
                continue;
            }

            if ( var_2.size < 2 )
            {
                wait 0.05;
                continue;
            }

            if ( var_2[1].team != var_1.team )
                var_1 maps\mp\_utility::incplayerstat( "closertoenemies", 0.05 );

            wait 0.05;
        }

        wait 0.05;
    }
}

monitorexplosionssurvived()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "survived_explosion", var_0 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) && self == var_0 )
            continue;

        maps\mp\_utility::incplayerstat( "explosionssurvived", 1 );
        wait 0.05;
    }
}

monitorshieldblocks()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "shield_blocked" );
        maps\mp\_utility::incplayerstat( "shieldblocks", 1 );
        wait 0.05;
    }
}

monitorflashhits()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "flash_hit" );
        maps\mp\_utility::incplayerstat( "fbhits", 1 );
        wait 0.05;
    }
}

monitorstunhits()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "stun_hit" );
        maps\mp\_utility::incplayerstat( "stunhits", 1 );
        wait 0.05;
    }
}

monitorstancetime()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( self getstance() == "crouch" )
            maps\mp\_utility::incplayerstat( "crouchtime", 500 );
        else if ( self getstance() == "prone" )
            maps\mp\_utility::incplayerstat( "pronetime", 500 );

        wait 0.5;
    }
}
