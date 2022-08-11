// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();
    setguns();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread maps\mp\_utility::reinitializematchrulesonmigration();
    }
    else
    {
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        setdynamicdvar( "scr_gun_scorelimit", level.gun_guns.size );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, level.gun_guns.size );
        level thread reinitializescorelimitonmigration();
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 0 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 0 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_randomize = 0;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    setspecialloadout();
    level.teambased = 0;
    level.doprematch = 1;
    level.killstreakrewards = 0;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.onspawnplayer = ::onspawnplayer;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;
    level.ontimelimit = ::ontimelimit;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata( 1 );
    level.matchrules_randomize = getmatchrulesdata( "gunData", "randomize" );
    setdynamicdvar( "scr_gun_scorelimit", level.gun_guns.size );
    maps\mp\_utility::registerscorelimitdvar( level.gametype, level.gun_guns.size );
    setdynamicdvar( "scr_gun_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "gun", 1 );
    setdynamicdvar( "scr_gun_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "gun", 1 );
    setdynamicdvar( "scr_gun_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "gun", 0 );
    setdynamicdvar( "scr_gun_promode", 0 );
}

reinitializescorelimitonmigration()
{
    setdynamicdvar( "scr_gun_scorelimit", level.gun_guns.size );
    maps\mp\_utility::registerscorelimitdvar( level.gametype, level.gun_guns.size );
}

onprecachegametype()
{
    precachestring( &"MP_GUN" );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_DM" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_DM" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DM" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DM" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_DM_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_DM_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_DM_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_DM_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_dm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_dm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "suicide", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "teamkill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "execution", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "avenger", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defender", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "posthumous", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "revenge", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "double", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "triple", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "multi", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "buzzkill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "firstblood", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "comeback", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "longshot", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assistedsuicide", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "knifethrow", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "gained_gun_score", 1 );
    maps\mp\gametypes\_rank::registerscoreinfo( "dropped_gun_score", -1 );
    maps\mp\gametypes\_rank::registerscoreinfo( "gained_gun_rank", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "dropped_enemy_gun_rank", 100 );
    var_0 = [];
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level thread onplayerconnect();
    level.killstreakrewards = 0;
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.gun_firstspawn = 1;
        var_0.gungamegunindex = 0;
        var_0.gungameprevgunindex = 0;
        var_0 initgunhud();

        if ( level.matchrules_randomize )
        {
            var_0.gun_nextguns = level.gun_guns;
            var_0.gun_prevguns = [];
        }

        var_0 thread refillammo();
        var_0 thread refillsinglecountammo();
    }
}

getspawnpoint()
{
    if ( self.gun_firstspawn )
    {
        self.gun_firstspawn = 0;
        self.pers["class"] = "gamemode";
        self.pers["lastClass"] = "";
        self.class = self.pers["class"];
        self.lastclass = self.pers["lastClass"];

        if ( common_scripts\utility::cointoss() )
            maps\mp\gametypes\_menus::addtoteam( "axis", 1 );
        else
            maps\mp\gametypes\_menus::addtoteam( "allies", 1 );
    }

    var_0 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.pers["team"] );
    var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_dm( var_0 );
    return var_1;
}

onspawnplayer()
{
    self.pers["gamemodeLoadout"] = level.gun_loadouts[self.pers["team"]];
    thread waitloadoutdone();
    level notify( "spawned_player" );
}

waitloadoutdone()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level waittill( "player_spawned" );
    maps\mp\_utility::giveperk( "specialty_bling", 0 );
    givenextgun( 1 );
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( var_3 == "MOD_FALLING" || isdefined( var_1 ) && isplayer( var_1 ) )
    {
        if ( var_3 == "MOD_FALLING" || var_1 == self || var_3 == "MOD_MELEE" && var_4 != "riotshield_mp" )
        {
            self playlocalsound( "mp_war_objective_lost" );
            self.gungameprevgunindex = self.gungamegunindex;
            self.gungamegunindex = int( max( 0, self.gungamegunindex - 1 ) );

            if ( self.gungameprevgunindex > self.gungamegunindex )
                maps\mp\gametypes\_gamescore::giveplayerscore( "dropped_gun_score", self, undefined, 1, 1 );

            if ( var_3 == "MOD_MELEE" )
            {
                if ( self.gungameprevgunindex )
                {
                    var_1 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DROPPED_ENEMY_GUN_RANK" );
                    var_1 thread maps\mp\gametypes\_rank::giverankxp( "dropped_enemy_gun_rank" );
                }
            }
        }
        else if ( var_3 == "MOD_PISTOL_BULLET" || var_3 == "MOD_RIFLE_BULLET" || var_3 == "MOD_HEAD_SHOT" || var_3 == "MOD_PROJECTILE" || var_3 == "MOD_PROJECTILE_SPLASH" || var_3 == "MOD_IMPACT" || var_3 == "MOD_GRENADE" || var_3 == "MOD_GRENADE_SPLASH" || var_3 == "MOD_MELEE" && var_4 == "riotshield_mp" )
        {
            if ( var_4 != var_1.primaryweapon )
                return;

            var_1.gungameprevgunindex = var_1.gungamegunindex;
            var_1.gungamegunindex++;
            var_1 thread maps\mp\gametypes\_rank::giverankxp( "gained_gun_rank" );
            maps\mp\gametypes\_gamescore::giveplayerscore( "gained_gun_score", var_1, self, 1, 1 );

            if ( var_1.gungamegunindex == level.gun_guns.size - 1 )
            {
                maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
                level thread maps\mp\_utility::teamplayercardsplash( "callout_top_gun_rank", var_1 );
            }

            if ( var_1.gungamegunindex < level.gun_guns.size )
            {
                var_1 playlocalsound( "mp_war_objective_taken" );
                var_1 givenextgun();
            }
        }
    }
}

givenextgun( var_0 )
{
    var_1 = getnextgun();
    self.gun_curgun = var_1;
    var_1 = addattachments( var_1 );
    self takeallweapons();
    maps\mp\_utility::_giveweapon( var_1 );

    if ( isdefined( var_0 ) )
        self setspawnweapon( var_1 );

    var_2 = strtok( var_1, "_" );

    if ( var_2[0] == "iw5" )
        var_3 = var_2[0] + "_" + var_2[1];
    else if ( var_2[0] == "alt" )
        var_3 = var_2[1] + "_" + var_2[2];
    else
        var_3 = var_2[0];

    self.pers["primaryWeapon"] = var_3;
    self.primaryweapon = var_1;
    self givestartammo( var_1 );
    self switchtoweapon( var_1 );

    if ( self.gungameprevgunindex > self.gungamegunindex )
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DROPPED_GUN_RANK" );
    else if ( self.gungameprevgunindex < self.gungamegunindex )
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_GAINED_GUN_RANK" );

    self.gungameprevgunindex = self.gungamegunindex;
    updategunhud();
}

getnextgun()
{
    if ( level.matchrules_randomize )
    {
        if ( self.gungameprevgunindex < self.gungamegunindex )
        {
            var_0 = randomint( self.gun_nextguns.size );
            var_1 = self.gun_nextguns[var_0];
            self.gun_prevguns[self.gun_prevguns.size] = self.gun_nextguns[var_0];
            self.gun_nextguns[var_0] = undefined;
            self.gun_nextguns = common_scripts\utility::array_removeundefined( self.gun_nextguns );
        }
        else if ( self.gungameprevgunindex > self.gungamegunindex )
        {
            if ( self.gun_prevguns.size > 1 )
            {
                for ( var_2 = 0; var_2 < self.gun_prevguns.size; var_2++ )
                {
                    if ( self.gun_prevguns[var_2] == self.gun_curgun )
                        break;
                }

                self.gun_nextguns[self.gun_nextguns.size] = self.gun_prevguns[var_2];
                self.gun_prevguns[var_2] = undefined;
                self.gun_prevguns = common_scripts\utility::array_removeundefined( self.gun_prevguns );
            }

            var_0 = randomint( self.gun_prevguns.size );
            var_1 = self.gun_prevguns[var_0];
        }
        else if ( self.gun_prevguns.size )
        {
            var_0 = randomint( self.gun_prevguns.size );
            var_1 = self.gun_prevguns[var_0];
        }
        else
        {
            var_0 = randomint( self.gun_nextguns.size );
            var_1 = self.gun_nextguns[var_0];
            self.gun_prevguns[self.gun_prevguns.size] = self.gun_nextguns[var_0];
            self.gun_nextguns[var_0] = undefined;
            self.gun_nextguns = common_scripts\utility::array_removeundefined( self.gun_nextguns );
        }
    }
    else
        var_1 = level.gun_guns[self.gungamegunindex];

    return var_1;
}

addattachments( var_0 )
{
    if ( isdefined( level.gun_attachments[var_0] ) && isdefined( level.gun_attachments[var_0]["attach1"] ) )
        var_1 = level.gun_attachments[var_0]["attach1"];
    else
        var_1 = "none";

    if ( isdefined( level.gun_attachments[var_0] ) && isdefined( level.gun_attachments[var_0]["attach2"] ) )
        var_2 = level.gun_attachments[var_0]["attach2"];
    else
        var_2 = "none";

    var_3 = maps\mp\gametypes\_class::buildweaponname( var_0, var_1, var_2, 0, 0 );
    return var_3;
}

ontimelimit()
{
    level.finalkillcam_winner = "none";
    var_0 = gethighestprogressedplayers();

    if ( !isdefined( var_0 ) || !var_0.size )
        thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["time_limit_reached"] );
    else if ( var_0.size == 1 )
        thread maps\mp\gametypes\_gamelogic::endgame( var_0[0], game["strings"]["time_limit_reached"] );
    else if ( var_0[var_0.size - 1].gungamegunindex > var_0[var_0.size - 2].gungamegunindex )
        thread maps\mp\gametypes\_gamelogic::endgame( var_0[var_0.size - 1], game["strings"]["time_limit_reached"] );
    else
        thread maps\mp\gametypes\_gamelogic::endgame( "tie", game["strings"]["time_limit_reached"] );
}

gethighestprogressedplayers()
{
    var_0 = -1;
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_3.gungamegunindex ) && var_3.gungamegunindex >= var_0 )
        {
            var_0 = var_3.gungamegunindex;
            var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

refillammo()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "reload" );
        self givestartammo( self.primaryweapon );
    }
}

refillsinglecountammo()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( maps\mp\_utility::isreallyalive( self ) && self.team != "spectator" && isdefined( self.primaryweapon ) && self getammocount( self.primaryweapon ) == 0 )
        {
            wait 2;
            self notify( "reload" );
            wait 1;
            continue;
        }

        wait 0.05;
    }
}

initgunhud()
{
    if ( level.splitscreen )
    {
        self.gun_progressdisplay[0] = maps\mp\gametypes\_hud_util::createfontstring( "small", 1.2 );
        self.gun_progressdisplay[0] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 80, 0 );
        self.gun_progressdisplay[0] settext( &"MP_WEAPON" );
        self.gun_progressdisplay[0].alpha = 1;
        self.gun_progressdisplay[0].archived = 0;
        self.gun_progressdisplay[0].hidewheninmenu = 1;
        self.gun_progressdisplay[1] = maps\mp\gametypes\_hud_util::createfontstring( "small", 1.2 );
        self.gun_progressdisplay[1] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 80, 12 );
        self.gun_progressdisplay[1] settext( "1 / " + level.gun_guns.size );
        self.gun_progressdisplay[1].alpha = 1;
        self.gun_progressdisplay[1].archived = 0;
        self.gun_progressdisplay[1].hidewheninmenu = 1;
    }
    else
    {
        self.gun_progressdisplay[0] = maps\mp\gametypes\_hud_util::createfontstring( "small", 1.2 );
        self.gun_progressdisplay[0] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 115, 5 );
        self.gun_progressdisplay[0] settext( &"MP_WEAPON" );
        self.gun_progressdisplay[0].alpha = 1;
        self.gun_progressdisplay[0].archived = 0;
        self.gun_progressdisplay[0].hidewheninmenu = 1;
        self.gun_progressdisplay[1] = maps\mp\gametypes\_hud_util::createfontstring( "small", 1.2 );
        self.gun_progressdisplay[1] maps\mp\gametypes\_hud_util::setpoint( "TOP LEFT", "TOP LEFT", 115, 17 );
        self.gun_progressdisplay[1] settext( "1 / " + level.gun_guns.size );
        self.gun_progressdisplay[1].alpha = 1;
        self.gun_progressdisplay[1].archived = 0;
        self.gun_progressdisplay[1].hidewheninmenu = 1;
    }

    thread hideongameend();
    thread hideinkillcam();
}

updategunhud()
{
    self.gun_progressdisplay[1] settext( self.gungamegunindex + 1 + " / " + level.gun_guns.size );
}

hideinkillcam()
{
    self endon( "disconnect" );
    var_0 = 1;

    for (;;)
    {
        if ( var_0 && ( !isalive( self ) || maps\mp\_utility::isinkillcam() ) )
        {
            self.gun_progressdisplay[0].alpha = 0;
            self.gun_progressdisplay[1].alpha = 0;
            var_0 = 0;
        }
        else if ( !var_0 && ( isalive( self ) && !maps\mp\_utility::isinkillcam() ) )
        {
            self.gun_progressdisplay[0].alpha = 1;
            self.gun_progressdisplay[1].alpha = 1;
            var_0 = 1;
        }

        wait 0.05;
    }
}

hideongameend()
{
    self endon( "disconnect" );
    level waittill( "game_ended" );
    self.gun_progressdisplay[0].alpha = 0;
    self.gun_progressdisplay[1].alpha = 0;
}

setguns()
{
    level.gun_guns = [];
    var_0 = 0;

    if ( isusingmatchrulesdata() )
        var_0 = getmatchrulesdata( "gunData", "numGuns" );

    if ( var_0 )
    {
        for ( var_1 = 0; var_1 < var_0; var_1++ )
            level.gun_guns[var_1] = getmatchrulesdata( "gunData", "guns", var_1 );
    }
    else
    {
        level.gun_guns[0] = "iw5_deserteagle";
        level.gun_guns[1] = "iw5_g18";
        level.gun_guns[2] = "iw5_mp9";
        level.gun_guns[3] = "iw5_mp5";
        level.gun_guns[4] = "iw5_p90";
        level.gun_guns[5] = "iw5_mp7";
        level.gun_guns[6] = "iw5_ak47";
        level.gun_guns[7] = "iw5_scar";
        level.gun_guns[8] = "iw5_pecheneg";
        level.gun_guns[9] = "iw5_mg36";
        level.gun_guns[10] = "iw5_spas12";
        level.gun_guns[11] = "iw5_1887";
        level.gun_guns[12] = "iw5_type95";
        level.gun_guns[13] = "iw5_mk14";
        level.gun_guns[14] = "iw5_barrett";
        level.gun_guns[15] = "iw5_msr";
        level.gun_guns[16] = "xm25";
        level.gun_guns[17] = "javelin";
    }

    level.gun_attachments = [];
    level.gun_attachments["iw5_44magnum"]["attach1"] = "tactical";
    level.gun_attachments["iw5_deserteagle"]["attach1"] = "tactical";
    level.gun_attachments["iw5_mp412"]["attach1"] = "tactical";
    level.gun_attachments["iw5_fmg9"]["attach1"] = "reflex";
    level.gun_attachments["iw5_skorpion"]["attach1"] = "reflex";
    level.gun_attachments["iw5_mp9"]["attach1"] = "reflex";
    level.gun_attachments["iw5_g18"]["attach1"] = "reflex";
    level.gun_attachments["iw5_mp5"]["attach1"] = "reflex";
    level.gun_attachments["iw5_m9"]["attach1"] = "reflex";
    level.gun_attachments["iw5_p90"]["attach1"] = "reflex";
    level.gun_attachments["iw5_pp90m1"]["attach1"] = "reflex";
    level.gun_attachments["iw5_ump45"]["attach1"] = "reflex";
    level.gun_attachments["iw5_mp7"]["attach1"] = "reflex";
    level.gun_attachments["iw5_ak47"]["attach1"] = "reflex";
    level.gun_attachments["iw5_m16"]["attach1"] = "reflex";
    level.gun_attachments["iw5_m4"]["attach1"] = "reflex";
    level.gun_attachments["iw5_fad"]["attach1"] = "reflex";
    level.gun_attachments["iw5_acr"]["attach1"] = "reflex";
    level.gun_attachments["iw5_type95"]["attach1"] = "reflex";
    level.gun_attachments["iw5_mk14"]["attach1"] = "reflex";
    level.gun_attachments["iw5_scar"]["attach1"] = "reflex";
    level.gun_attachments["iw5_g36c"]["attach1"] = "reflex";
    level.gun_attachments["iw5_cm901"]["attach1"] = "reflex";
    level.gun_attachments["iw5_ksg"]["attach1"] = "grip";
    level.gun_attachments["iw5_striker"]["attach1"] = "grip";
    level.gun_attachments["iw5_aa12"]["attach1"] = "grip";
    level.gun_attachments["iw5_usas12"]["attach1"] = "grip";
    level.gun_attachments["iw5_spas12"]["attach1"] = "grip";
    level.gun_attachments["iw5_m60"]["attach1"] = "grip";
    level.gun_attachments["iw5_m60"]["attach2"] = "reflex";
    level.gun_attachments["iw5_mk46"]["attach1"] = "grip";
    level.gun_attachments["iw5_mk46"]["attach2"] = "reflex";
    level.gun_attachments["iw5_pecheneg"]["attach1"] = "grip";
    level.gun_attachments["iw5_pecheneg"]["attach2"] = "reflex";
    level.gun_attachments["iw5_sa80"]["attach1"] = "grip";
    level.gun_attachments["iw5_sa80"]["attach2"] = "reflex";
    level.gun_attachments["iw5_mg36"]["attach1"] = "grip";
    level.gun_attachments["iw5_mg36"]["attach2"] = "reflex";
}

setspecialloadout()
{
    level.gun_loadouts["axis"]["loadoutPrimary"] = "iw5_acr";
    level.gun_loadouts["axis"]["loadoutPrimaryAttachment"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryBuff"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
    level.gun_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondary"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryBuff"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
    level.gun_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
    level.gun_loadouts["axis"]["loadoutEquipment"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutOffhand"] = "none";
    level.gun_loadouts["axis"]["loadoutPerk1"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutPerk2"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutPerk3"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutDeathstreak"] = "specialty_null";
    level.gun_loadouts["axis"]["loadoutJuggernaut"] = 0;
    level.gun_loadouts["allies"] = level.gun_loadouts["axis"];
}
