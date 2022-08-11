// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "execution", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "avenger", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defender", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "posthumous", 25 );
    maps\mp\gametypes\_rank::registerscoreinfo( "revenge", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "double", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "triple", 75 );
    maps\mp\gametypes\_rank::registerscoreinfo( "multi", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "buzzkill", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "firstblood", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "comeback", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "longshot", 50 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assistedsuicide", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "knifethrow", 100 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "damage", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "heavy_damage", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "damaged", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "kill", 1 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "killed", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "healed", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "headshot", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "melee", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "backstab", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "longshot", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "assistedsuicide", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "defender", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "avenger", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "execution", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "comeback", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "revenge", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "buzzkill", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "double", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "triple", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "multi", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "assist", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "firstBlood", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "capture", 1 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "assistedCapture", 1 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "plant", 1 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "defuse", 1 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "vehicleDestroyed", 1 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "3streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "4streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "5streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "6streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "7streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "8streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "9streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "10streak", 0 );
    maps\mp\killstreaks\_killstreaks::registeradrenalineinfo( "regen", 0 );
    precacheshader( "crosshair_red" );
    level._effect["money"] = loadfx( "props/cash_player_drop" );
    level.numkills = 0;
    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.killedplayers = [];
        var_0.killedplayerscurrent = [];
        var_0.killedby = [];
        var_0.lastkilledby = undefined;
        var_0.greatestuniqueplayerkills = 0;
        var_0.recentkillcount = 0;
        var_0.lastkilltime = 0;
        var_0.damagedplayers = [];
        var_0 thread monitorcratejacking();
        var_0 thread monitorobjectives();
        var_0 thread monitorhealed();
    }
}

damagedplayer( var_0, var_1, var_2 )
{
    if ( var_1 < 50 && var_1 > 10 )
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "damage" );
    else
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "heavy_damage" );
}

killedplayer( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1.guid;
    var_5 = self.guid;
    var_6 = gettime();
    thread updaterecentkills( var_0 );
    self.lastkilltime = gettime();
    self.lastkilledplayer = var_1;
    self.modifiers = [];
    level.numkills++;
    self.damagedplayers[var_4] = undefined;

    if ( !maps\mp\_utility::iskillstreakweapon( var_2 ) && !maps\mp\_utility::isjuggernaut() && !maps\mp\_utility::_hasperk( "specialty_explosivebullets" ) )
    {
        if ( var_2 == "none" )
            return 0;

        if ( isdefined( self.pers["copyCatLoadout"] ) && isdefined( self.pers["copyCatLoadout"]["owner"] ) )
        {
            if ( var_1 == self.pers["copyCatLoadout"]["owner"] )
                self.modifiers["clonekill"] = 1;
        }

        if ( var_1.attackers.size == 1 && !isdefined( var_1.attackers[var_1.guid] ) )
        {
            var_10 = maps\mp\_utility::getweaponclass( var_2 );

            if ( var_10 == "weapon_sniper" && var_3 != "MOD_MELEE" && gettime() == var_1.attackerdata[self.guid].firsttimedamaged )
            {
                self.modifiers["oneshotkill"] = 1;
                thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_ONE_SHOT_KILL" );
            }
        }

        if ( isdefined( var_1.throwinggrenade ) && var_1.throwinggrenade == "frag_grenade_mp" )
            self.modifiers["cooking"] = 1;

        if ( isdefined( self.assistedsuicide ) && self.assistedsuicide )
            assistedsuicide( var_0, var_2, var_3 );

        if ( level.numkills == 1 )
            firstblood( var_0, var_2, var_3 );

        if ( self.pers["cur_death_streak"] > 3 )
            comeback( var_0, var_2, var_3 );

        if ( var_3 == "MOD_HEAD_SHOT" )
        {
            if ( isdefined( var_1.laststand ) )
                execution( var_0, var_2, var_3 );
            else
                headshot( var_0, var_2, var_3 );
        }

        if ( isdefined( self.wasti ) && self.wasti && gettime() - self.spawntime <= 5000 )
            self.modifiers["jackintheboxkill"] = 1;

        if ( !isalive( self ) && self.deathtime + 800 < gettime() )
            postdeathkill( var_0 );

        var_11 = 0;

        if ( level.teambased && var_6 - var_1.lastkilltime < 500 )
        {
            if ( var_1.lastkilledplayer != self )
                avengedplayer( var_0, var_2, var_3 );
        }

        foreach ( var_14, var_13 in var_1.damagedplayers )
        {
            if ( var_14 == self.guid )
                continue;

            if ( level.teambased && var_6 - var_13 < 500 )
                defendedplayer( var_0, var_2, var_3 );
        }

        if ( isdefined( var_1.attackerposition ) )
            var_15 = var_1.attackerposition;
        else
            var_15 = self.origin;

        if ( islongshot( self, var_2, var_3, var_15, var_1 ) )
            thread longshot( var_0, var_2, var_3 );

        if ( var_1.pers["cur_kill_streak"] > 0 && isdefined( var_1.killstreaks[var_1.pers["cur_kill_streak"] + 1] ) )
            buzzkill( var_0, var_1, var_2, var_3 );

        thread checkmatchdatakills( var_0, var_1, var_2, var_3 );
    }

    if ( !isdefined( self.killedplayers[var_4] ) )
        self.killedplayers[var_4] = 0;

    if ( !isdefined( self.killedplayerscurrent[var_4] ) )
        self.killedplayerscurrent[var_4] = 0;

    if ( !isdefined( var_1.killedby[var_5] ) )
        var_1.killedby[var_5] = 0;

    self.killedplayers[var_4]++;

    if ( self.killedplayers[var_4] > self.greatestuniqueplayerkills )
        maps\mp\_utility::setplayerstat( "killedsameplayer", self.killedplayers[var_4] );

    self.killedplayerscurrent[var_4]++;
    var_1.killedby[var_5]++;
    var_1.lastkilledby = self;
}

islongshot( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isalive( var_0 ) && !var_0 maps\mp\_utility::isusingremote() && ( var_2 == "MOD_RIFLE_BULLET" || var_2 == "MOD_PISTOL_BULLET" || var_2 == "MOD_HEAD_SHOT" ) && !maps\mp\_utility::iskillstreakweapon( var_1 ) && !isdefined( var_0.assistedsuicide ) )
    {
        var_5 = maps\mp\_utility::getweaponclass( var_1 );

        switch ( var_5 )
        {
            case "weapon_pistol":
                var_6 = 800;
                break;
            case "weapon_smg":
            case "weapon_machine_pistol":
                var_6 = 1200;
                break;
            case "weapon_assault":
            case "weapon_lmg":
                var_6 = 1500;
                break;
            case "weapon_sniper":
                var_6 = 2000;
                break;
            case "weapon_shotgun":
                var_6 = 500;
                break;
            case "weapon_projectile":
            default:
                var_6 = 1536;
                break;
        }

        if ( distance( var_3, var_4.origin ) > var_6 )
        {
            if ( var_0 isitemunlocked( "specialty_holdbreath" ) && var_0 maps\mp\_utility::_hasperk( "specialty_holdbreath" ) )
                var_0 maps\mp\gametypes\_missions::processchallenge( "ch_longdistance" );

            return 1;
        }
    }

    return 0;
}

checkmatchdatakills( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\mp\_utility::getweaponclass( var_2 );
    var_5 = 0;
    thread campercheck();

    if ( isdefined( self.lastkilledby ) && self.lastkilledby == var_1 )
    {
        self.lastkilledby = undefined;
        revenge( var_0 );
        playfx( level._effect["money"], var_1 gettagorigin( "j_spine4" ) );
    }

    if ( var_1.idflags & level.idflags_penetration )
        maps\mp\_utility::incplayerstat( "bulletpenkills", 1 );

    if ( self.pers["rank"] < var_1.pers["rank"] )
        maps\mp\_utility::incplayerstat( "higherrankkills", 1 );

    if ( self.pers["rank"] > var_1.pers["rank"] )
        maps\mp\_utility::incplayerstat( "lowerrankkills", 1 );

    if ( isdefined( self.infinalstand ) && self.infinalstand )
        maps\mp\_utility::incplayerstat( "laststandkills", 1 );

    if ( isdefined( var_1.infinalstand ) && var_1.infinalstand )
        maps\mp\_utility::incplayerstat( "laststanderkills", 1 );

    if ( self getcurrentweapon() != self.primaryweapon && self getcurrentweapon() != self.secondaryweapon )
        maps\mp\_utility::incplayerstat( "otherweaponkills", 1 );

    var_6 = gettime() - var_1.spawntime;

    if ( !maps\mp\_utility::matchmakinggame() )
        var_1 maps\mp\_utility::setplayerstatiflower( "shortestlife", var_6 );

    var_1 maps\mp\_utility::setplayerstatifgreater( "longestlife", var_6 );

    if ( var_3 != "MOD_MELEE" )
    {
        switch ( var_4 )
        {
            case "weapon_smg":
            case "weapon_assault":
            case "weapon_sniper":
            case "weapon_lmg":
            case "weapon_shotgun":
            case "weapon_projectile":
            case "weapon_pistol":
                checkmatchdataweaponkills( var_1, var_2, var_3, var_4 );
                break;
            case "weapon_grenade":
            case "weapon_explosive":
                checkmatchdataequipmentkills( var_1, var_2, var_3 );
                break;
            default:
                break;
        }
    }
}

checkmatchdataweaponkills( var_0, var_1, var_2, var_3 )
{
    var_4 = self;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    switch ( var_3 )
    {
        case "weapon_pistol":
            var_5 = "pistolkills";
            var_6 = "pistolheadshots";
            break;
        case "weapon_smg":
            var_5 = "smgkills";
            var_6 = "smgheadshots";
            break;
        case "weapon_assault":
            var_5 = "arkills";
            var_6 = "arheadshots";
            break;
        case "weapon_projectile":
            if ( weaponclass( var_1 ) == "rocketlauncher" )
                var_5 = "rocketkills";

            break;
        case "weapon_sniper":
            var_5 = "sniperkills";
            var_6 = "sniperheadshots";
            break;
        case "weapon_shotgun":
            var_5 = "shotgunkills";
            var_6 = "shotgunheadshots";
            var_7 = "shotgundeaths";
            break;
        case "weapon_lmg":
            var_5 = "lmgkills";
            var_6 = "lmgheadshots";
            break;
        default:
            break;
    }

    if ( isdefined( var_5 ) )
        var_4 maps\mp\_utility::incplayerstat( var_5, 1 );

    if ( isdefined( var_6 ) && var_2 == "MOD_HEAD_SHOT" )
        var_4 maps\mp\_utility::incplayerstat( var_6, 1 );

    if ( isdefined( var_7 ) && !maps\mp\_utility::matchmakinggame() )
        var_0 maps\mp\_utility::incplayerstat( var_7, 1 );

    if ( var_4 playerads() > 0.5 )
    {
        var_4 maps\mp\_utility::incplayerstat( "adskills", 1 );

        if ( var_3 == "weapon_sniper" || issubstr( var_1, "acog" ) )
            var_4 maps\mp\_utility::incplayerstat( "scopedkills", 1 );

        if ( issubstr( var_1, "thermal" ) )
            var_4 maps\mp\_utility::incplayerstat( "thermalkills", 1 );
    }
    else
        var_4 maps\mp\_utility::incplayerstat( "hipfirekills", 1 );
}

checkmatchdataequipmentkills( var_0, var_1, var_2 )
{
    var_3 = self;

    switch ( var_1 )
    {
        case "frag_grenade_mp":
            var_3 maps\mp\_utility::incplayerstat( "fragkills", 1 );
            var_3 maps\mp\_utility::incplayerstat( "grenadekills", 1 );
            var_4 = 1;
            break;
        case "c4_mp":
            var_3 maps\mp\_utility::incplayerstat( "c4kills", 1 );
            var_4 = 1;
            break;
        case "semtex_mp":
            var_3 maps\mp\_utility::incplayerstat( "semtexkills", 1 );
            var_3 maps\mp\_utility::incplayerstat( "grenadekills", 1 );
            var_4 = 1;
            break;
        case "claymore_mp":
            var_3 maps\mp\_utility::incplayerstat( "claymorekills", 1 );
            var_4 = 1;
            break;
        case "throwingknife_mp":
            var_3 maps\mp\_utility::incplayerstat( "throwingknifekills", 1 );
            thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_KNIFETHROW" );
            var_4 = 1;
            break;
        default:
            var_4 = 0;
            break;
    }

    if ( var_4 )
        var_3 maps\mp\_utility::incplayerstat( "equipmentkills", 1 );
}

campercheck()
{
    self.lastkillwascamping = 0;

    if ( !isdefined( self.lastkilllocation ) )
    {
        self.lastkilllocation = self.origin;
        self.lastcampkilltime = gettime();
        return;
    }

    if ( distance( self.lastkilllocation, self.origin ) < 512 && gettime() - self.lastcampkilltime > 5000 )
    {
        maps\mp\_utility::incplayerstat( "mostcamperkills", 1 );
        self.lastkillwascamping = 1;
    }

    self.lastkilllocation = self.origin;
    self.lastcampkilltime = gettime();
}

consolation( var_0 )
{

}

proximityassist( var_0 )
{
    self.modifiers["proximityAssist"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_PROXIMITYASSIST" );
    thread maps\mp\gametypes\_rank::giverankxp( "proximityassist" );
}

proximitykill( var_0 )
{
    self.modifiers["proximityKill"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_PROXIMITYKILL" );
    thread maps\mp\gametypes\_rank::giverankxp( "proximitykill" );
}

longshot( var_0, var_1, var_2 )
{
    self.modifiers["longshot"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_LONGSHOT" );
    thread maps\mp\gametypes\_rank::giverankxp( "longshot", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "longshot" );
    maps\mp\_utility::incplayerstat( "longshots", 1 );
    thread maps\mp\_matchdata::logkillevent( var_0, "longshot" );
}

execution( var_0, var_1, var_2 )
{
    self.modifiers["execution"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_EXECUTION" );
    thread maps\mp\gametypes\_rank::giverankxp( "execution", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "execution" );
    thread maps\mp\_matchdata::logkillevent( var_0, "execution" );
}

headshot( var_0, var_1, var_2 )
{
    self.modifiers["headshot"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_HEADSHOT" );
    thread maps\mp\gametypes\_rank::giverankxp( "headshot", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "headshot" );
    thread maps\mp\_matchdata::logkillevent( var_0, "headshot" );
}

avengedplayer( var_0, var_1, var_2 )
{
    self.modifiers["avenger"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_AVENGER" );
    thread maps\mp\gametypes\_rank::giverankxp( "avenger", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "avenger" );
    thread maps\mp\_matchdata::logkillevent( var_0, "avenger" );
    maps\mp\_utility::incplayerstat( "avengekills", 1 );
}

assistedsuicide( var_0, var_1, var_2 )
{
    self.modifiers["assistedsuicide"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_ASSISTEDSUICIDE" );
    thread maps\mp\gametypes\_rank::giverankxp( "assistedsuicide", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "assistedsuicide" );
    thread maps\mp\_matchdata::logkillevent( var_0, "assistedsuicide" );
}

defendedplayer( var_0, var_1, var_2 )
{
    self.modifiers["defender"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DEFENDER" );
    thread maps\mp\gametypes\_rank::giverankxp( "defender", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "defender" );
    thread maps\mp\_matchdata::logkillevent( var_0, "defender" );
    maps\mp\_utility::incplayerstat( "rescues", 1 );
}

postdeathkill( var_0 )
{
    self.modifiers["posthumous"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_POSTHUMOUS" );
    thread maps\mp\gametypes\_rank::giverankxp( "posthumous" );
    thread maps\mp\_matchdata::logkillevent( var_0, "posthumous" );
}

backstab( var_0 )
{
    self iprintlnbold( "backstab" );
}

revenge( var_0 )
{
    self.modifiers["revenge"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_REVENGE" );
    thread maps\mp\gametypes\_rank::giverankxp( "revenge" );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "revenge" );
    thread maps\mp\_matchdata::logkillevent( var_0, "revenge" );
    maps\mp\_utility::incplayerstat( "revengekills", 1 );
}

multikill( var_0, var_1 )
{
    if ( var_1 == 2 )
    {
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DOUBLEKILL" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "double" );
    }
    else if ( var_1 == 3 )
    {
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_TRIPLEKILL" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "triple" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_3xkill", self );
    }
    else
    {
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_MULTIKILL" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "multi" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_3xpluskill", self );
    }

    thread maps\mp\_matchdata::logmultikill( var_0, var_1 );
    maps\mp\_utility::setplayerstatifgreater( "multikill", var_1 );
    maps\mp\_utility::incplayerstat( "mostmultikills", 1 );
}

firstblood( var_0, var_1, var_2 )
{
    self.modifiers["firstblood"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_FIRSTBLOOD" );
    thread maps\mp\gametypes\_rank::giverankxp( "firstblood", undefined, var_1, var_2 );
    thread maps\mp\_matchdata::logkillevent( var_0, "firstblood" );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "firstBlood" );
    thread maps\mp\_utility::teamplayercardsplash( "callout_firstblood", self );
}

winningshot( var_0 )
{

}

buzzkill( var_0, var_1, var_2, var_3 )
{
    self.modifiers["buzzkill"] = var_1.pers["cur_kill_streak"];
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_BUZZKILL" );
    thread maps\mp\gametypes\_rank::giverankxp( "buzzkill", undefined, var_2, var_3 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "buzzkill" );
    thread maps\mp\_matchdata::logkillevent( var_0, "buzzkill" );
}

comeback( var_0, var_1, var_2 )
{
    self.modifiers["comeback"] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_COMEBACK" );
    thread maps\mp\gametypes\_rank::giverankxp( "comeback", undefined, var_1, var_2 );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "comeback" );
    thread maps\mp\_matchdata::logkillevent( var_0, "comeback" );
    maps\mp\_utility::incplayerstat( "comebacks", 1 );
}

disconnected()
{
    var_0 = self.guid;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( isdefined( level.players[var_1].killedplayers[var_0] ) )
            level.players[var_1].killedplayers[var_0] = undefined;

        if ( isdefined( level.players[var_1].killedplayerscurrent[var_0] ) )
            level.players[var_1].killedplayerscurrent[var_0] = undefined;

        if ( isdefined( level.players[var_1].killedby[var_0] ) )
            level.players[var_1].killedby[var_0] = undefined;
    }
}

monitorhealed()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "healed" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "healed" );
    }
}

updaterecentkills( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "updateRecentKills" );
    self endon( "updateRecentKills" );
    self.recentkillcount++;
    wait 1.0;

    if ( self.recentkillcount > 1 )
        multikill( var_0, self.recentkillcount );

    self.recentkillcount = 0;
}

monitorcratejacking()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "hijacker", var_0, var_1 );
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_HIJACKER" );
        thread maps\mp\gametypes\_rank::giverankxp( "hijacker", 100 );
        var_2 = "hijacked_airdrop";
        var_3 = "ch_hijacker";

        switch ( var_0 )
        {
            case "sentry":
                var_2 = "hijacked_sentry";
                break;
            case "juggernaut":
                var_2 = "hijacked_juggernaut";
                break;
            case "remote_tank":
                var_2 = "hijacked_remote_tank";
                break;
            case "mega":
            case "emergency_airdrop":
                var_2 = "hijacked_emergency_airdrop";
                var_3 = "ch_newjack";
                break;
            default:
                break;
        }

        if ( isdefined( var_1 ) )
            var_1 maps\mp\gametypes\_hud_message::playercardsplashnotify( var_2, self );

        self notify( "process", var_3 );
    }
}

monitorobjectives()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "objective", var_0 );

        if ( var_0 == "captured" )
        {
            maps\mp\killstreaks\_killstreaks::giveadrenaline( "capture" );

            if ( isdefined( self.laststand ) && self.laststand )
            {
                thread maps\mp\gametypes\_hud_message::splashnotifydelayed( "heroic", 100 );
                thread maps\mp\gametypes\_rank::giverankxp( "reviver", 100 );
            }
        }

        if ( var_0 == "assistedCapture" )
            maps\mp\killstreaks\_killstreaks::giveadrenaline( "assistedCapture" );

        if ( var_0 == "plant" )
            maps\mp\killstreaks\_killstreaks::giveadrenaline( "plant" );

        if ( var_0 == "defuse" )
            maps\mp\killstreaks\_killstreaks::giveadrenaline( "defuse" );
    }
}
