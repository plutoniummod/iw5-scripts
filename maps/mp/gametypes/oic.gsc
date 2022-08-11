// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::setupcallbacks();
    maps\mp\gametypes\_globallogic::setupcallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread maps\mp\_utility::reinitializematchrulesonmigration();
    }
    else
    {
        maps\mp\_utility::registertimelimitdvar( level.gametype, 10 );
        maps\mp\_utility::registerscorelimitdvar( level.gametype, 0 );
        maps\mp\_utility::registerroundlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registerwinlimitdvar( level.gametype, 1 );
        maps\mp\_utility::registernumlivesdvar( level.gametype, 2 );
        maps\mp\_utility::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
        level.matchrules_oneshotkill = 0;
        level.matchrules_initialammo = 2;
        level.matchrules_rewardammo = 2;
    }

    setdynamicdvar( "scr_player_maxhealth", 100 );
    setdynamicdvar( "scr_game_onlyheadshots", 0 );
    setdynamicdvar( "scr_game_hardpoints", 0 );
    setdynamicdvar( "scr_player_healthregentime", 5 );
    setgun();
    setspecialloadouts();
    level.teambased = 0;
    level.doprematch = 1;
    level.killstreakrewards = 0;
    level.onstartgametype = ::onstartgametype;
    level.onspawnplayer = ::onspawnplayer;
    level.getspawnpoint = ::getspawnpoint;
    level.onplayerkilled = ::onplayerkilled;
    level.ononeleftevent = ::ononeleftevent;

    if ( level.matchrules_oneshotkill )
        level.modifyplayerdamage = ::modifyplayerdamage;
}

initializematchrules()
{
    maps\mp\_utility::setcommonrulesfrommatchrulesdata( 1 );
    level.matchrules_initialammo = getmatchrulesdata( "oicData", "initialAmmoCount" );
    level.matchrules_rewardammo = getmatchrulesdata( "oicData", "killRewardAmmoCount" );
    level.matchrules_oneshotkill = getmatchrulesdata( "oicData", "oneShotKill" );
    level.matchrules_damagemultiplier = 0;
    level.matchrules_vampirism = 0;
    setdynamicdvar( "scr_oic_winlimit", 1 );
    maps\mp\_utility::registerwinlimitdvar( "oic", 1 );
    setdynamicdvar( "scr_oic_roundlimit", 1 );
    maps\mp\_utility::registerroundlimitdvar( "oic", 1 );
    setdynamicdvar( "scr_oic_halftime", 0 );
    maps\mp\_utility::registerhalftimedvar( "oic", 0 );
    setdynamicdvar( "scr_oic_promode", 0 );
    setdynamicdvar( "scr_player_maxhealth", 100 );
    setdynamicdvar( "scr_game_onlyheadshots", 0 );
    setdynamicdvar( "scr_game_hardpoints", 0 );
    setdynamicdvar( "scr_player_healthregentime", 5 );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    maps\mp\_utility::setobjectivetext( "allies", &"OBJECTIVES_OIC" );
    maps\mp\_utility::setobjectivetext( "axis", &"OBJECTIVES_OIC" );

    if ( level.splitscreen )
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_OIC" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_OIC" );
    }
    else
    {
        maps\mp\_utility::setobjectivescoretext( "allies", &"OBJECTIVES_OIC_SCORE" );
        maps\mp\_utility::setobjectivescoretext( "axis", &"OBJECTIVES_OIC_SCORE" );
    }

    maps\mp\_utility::setobjectivehinttext( "allies", &"OBJECTIVES_OIC_HINT" );
    maps\mp\_utility::setobjectivehinttext( "axis", &"OBJECTIVES_OIC_HINT" );
    level.spawnmins = ( 0.0, 0.0, 0.0 );
    level.spawnmaxs = ( 0.0, 0.0, 0.0 );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "allies", "mp_dm_spawn" );
    maps\mp\gametypes\_spawnlogic::addspawnpoints( "axis", "mp_dm_spawn" );
    level.mapcenter = maps\mp\gametypes\_spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_0 = [];
    maps\mp\gametypes\_gameobjects::main( var_0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "suicide", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "teamkill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "survivor", 25 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level thread onplayerconnect();
    level thread watchelimination();
    level.killstreakrewards = 0;
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0.oic_firstspawn = 1;
    }
}

getspawnpoint()
{
    if ( self.oic_firstspawn )
    {
        self.oic_firstspawn = 0;
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
    if ( isdefined( self.oic_rewardammo ) && self.oic_rewardammo )
        giveammo();
    else
        self.oic_rewardammo = 0;

    self.pers["gamemodeLoadout"] = level.oic_loadouts[self.pers["team"]];
    thread waitloadoutdone();
    level notify( "spawned_player" );
}

waitloadoutdone()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level waittill( "player_spawned" );
    self takeallweapons();
    maps\mp\_utility::giveperk( "specialty_bling", 0 );
    var_0 = addattachments( level.oic_gun );
    maps\mp\_utility::_giveweapon( var_0 );
    self switchtoweapon( var_0 );
    self setspawnweapon( var_0 );
    var_1 = strtok( var_0, "_" );

    if ( var_1[0] == "iw5" )
        var_2 = var_1[0] + "_" + var_1[1];
    else if ( var_1[0] == "alt" )
        var_2 = var_1[1] + "_" + var_1[2];
    else
        var_2 = var_1[0];

    self.pers["primaryWeapon"] = var_2;
    self.primaryweapon = var_0;
    var_3 = weaponclipsize( var_0 );

    if ( level.matchrules_initialammo > var_3 )
    {
        self setweaponammoclip( self.primaryweapon, var_3 );
        self setweaponammostock( self.primaryweapon, level.matchrules_initialammo - var_3 );
    }
    else
    {
        self setweaponammoclip( self.primaryweapon, level.matchrules_initialammo );
        self setweaponammostock( self.primaryweapon, 0 );
    }
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

modifyplayerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( var_3 == "MOD_PISTOL_BULLET" || var_3 == "MOD_RIFLE_BULLET" || var_3 == "MOD_HEAD_SHOT" )
        var_2 = 999;

    return var_2;
}

onplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) && self != var_1 )
    {
        var_1.oic_rewardammo += level.matchrules_rewardammo;

        if ( self attackbuttonpressed() )
            var_1 thread waitgiveammo();
        else
            var_1 giveammo();
    }
}

ononeleftevent( var_0 )
{
    var_1 = maps\mp\_utility::getlastlivingplayer();
    logstring( "last one alive, win: " + var_1.name );
    level.finalkillcam_winner = "none";
    level thread maps\mp\gametypes\_gamelogic::endgame( var_1, &"MP_ENEMIES_ELIMINATED" );
}

waitgiveammo()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "oic_waitGiveAmmo" );
    self endon( "oic_waitGiveAmmo" );

    while ( self attackbuttonpressed() )
        wait 0.05;

    giveammo();
}

giveammo()
{
    var_0 = self getcurrentweapon();
    var_1 = self getweaponammoclip( var_0 );
    var_2 = weaponclipsize( var_0 );

    if ( var_1 + self.oic_rewardammo > var_2 )
    {
        self setweaponammoclip( var_0, var_2 );
        self setweaponammostock( var_0, var_1 + self.oic_rewardammo - var_2 );
    }
    else
        self setweaponammoclip( var_0, var_1 + self.oic_rewardammo );

    self playlocalsound( "scavenger_pack_pickup" );
    self.oic_rewardammo = 0;
}

watchelimination()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_eliminated", var_0 );
        thread maps\mp\_utility::teamplayercardsplash( "callout_eliminated", var_0 );
        var_1 = [];

        foreach ( var_0 in level.players )
        {
            if ( isdefined( var_0 ) && ( isalive( var_0 ) || var_0.pers["lives"] > 0 ) )
            {
                var_1[var_1.size] = var_0;
                var_0 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_SURVIVOR" );
                maps\mp\gametypes\_gamescore::giveplayerscore( "survivor", var_0, undefined, 1 );
                var_0 thread maps\mp\gametypes\_rank::giverankxp( "survivor" );
            }
        }

        if ( var_1.size > 2 )
        {
            maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );
            continue;
        }

        if ( var_1.size == 2 )
        {
            maps\mp\_utility::playsoundonplayers( "mp_obj_captured" );
            var_1[0] thread maps\mp\gametypes\_hud_message::playercardsplashnotify( "callout_lastenemyalive", var_1[1] );
            var_1[1] thread maps\mp\gametypes\_hud_message::playercardsplashnotify( "callout_lastenemyalive", var_1[0] );
        }
    }
}

setgun()
{
    level.oic_gun = undefined;
    var_0 = "none";

    if ( isusingmatchrulesdata() )
        var_0 = getmatchrulesdata( "oicData", "weapon" );

    if ( isdefined( var_0 ) && var_0 != "none" )
        level.oic_gun = var_0;
    else
        level.oic_gun = "iw5_deserteagle";

    if ( level.oic_gun == "iw5_type95" || level.oic_gun == "iw5_m16" )
    {
        level.matchrules_initialammo *= 3;
        level.matchrules_rewardammo *= 3;
    }
}

setspecialloadouts()
{
    level.oic_loadouts["axis"]["loadoutPrimary"] = "iw5_acr";
    level.oic_loadouts["axis"]["loadoutPrimaryAttachment"] = "none";
    level.oic_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
    level.oic_loadouts["axis"]["loadoutPrimaryBuff"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
    level.oic_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
    level.oic_loadouts["axis"]["loadoutSecondary"] = "none";
    level.oic_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
    level.oic_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
    level.oic_loadouts["axis"]["loadoutSecondaryBuff"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
    level.oic_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
    level.oic_loadouts["axis"]["loadoutEquipment"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutOffhand"] = "none";
    level.oic_loadouts["axis"]["loadoutPerk1"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutPerk2"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutPerk3"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutDeathstreak"] = "specialty_null";
    level.oic_loadouts["axis"]["loadoutJuggernaut"] = 0;
    level.oic_loadouts["allies"] = level.oic_loadouts["axis"];
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
