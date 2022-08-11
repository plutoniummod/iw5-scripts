// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

codecallback_startgametype()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    if ( !isdefined( level.gametypestarted ) || !level.gametypestarted )
    {
        [[ level.callbackstartgametype ]]();
        level.gametypestarted = 1;
    }
}

codecallback_playerconnect()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self endon( "disconnect" );
    [[ level.callbackplayerconnect ]]();
}

codecallback_playerdisconnect()
{
    self notify( "disconnect" );
    [[ level.callbackplayerdisconnect ]]();
}

codecallback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

codecallback_playerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerkilled ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self.damagecallback ) )
        self [[ self.damagecallback ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self vehicle_finishdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

codecallback_codeendgame()
{
    self endon( "disconnect" );
    [[ level.callbackcodeendgame ]]();
}

codecallback_playerlaststand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level.callbackplayerlaststand ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playermigrated()
{
    self endon( "disconnect" );
    [[ level.callbackplayermigrated ]]();
}

codecallback_hostmigration()
{
    [[ level.callbackhostmigration ]]();
}

setupdamageflags()
{
    level.idflags_radius = 1;
    level.idflags_no_armor = 2;
    level.idflags_no_knockback = 4;
    level.idflags_penetration = 8;
    level.idflags_stun = 16;
    level.idflags_shield_explosive_impact = 32;
    level.idflags_shield_explosive_impact_huge = 64;
    level.idflags_shield_explosive_splash = 128;
    level.idflags_no_team_protection = 256;
    level.idflags_no_protection = 512;
    level.idflags_passthru = 1024;
}

setupcallbacks()
{
    setdefaultcallbacks();
    setupdamageflags();
}

setdefaultcallbacks()
{
    level.callbackstartgametype = maps\mp\gametypes\_gamelogic::callback_startgametype;
    level.callbackplayerconnect = maps\mp\gametypes\_playerlogic::callback_playerconnect;
    level.callbackplayerdisconnect = maps\mp\gametypes\_playerlogic::callback_playerdisconnect;
    level.callbackplayerdamage = maps\mp\gametypes\_damage::callback_playerdamage;
    level.callbackplayerkilled = maps\mp\gametypes\_damage::callback_playerkilled;
    level.callbackcodeendgame = maps\mp\gametypes\_gamelogic::callback_codeendgame;
    level.callbackplayerlaststand = maps\mp\gametypes\_damage::callback_playerlaststand;
    level.callbackplayermigrated = maps\mp\gametypes\_playerlogic::callback_playermigrated;
    level.callbackhostmigration = maps\mp\gametypes\_hostmigration::callback_hostmigration;
}

abortlevel()
{
    level.callbackstartgametype = ::callbackvoid;
    level.callbackplayerconnect = ::callbackvoid;
    level.callbackplayerdisconnect = ::callbackvoid;
    level.callbackplayerdamage = ::callbackvoid;
    level.callbackplayerkilled = ::callbackvoid;
    level.callbackcodeendgame = ::callbackvoid;
    level.callbackplayerlaststand = ::callbackvoid;
    level.callbackplayermigrated = ::callbackvoid;
    level.callbackhostmigration = ::callbackvoid;
    setdvar( "g_gametype", "dm" );
    exitlevel( 0 );
}

callbackvoid()
{

}
