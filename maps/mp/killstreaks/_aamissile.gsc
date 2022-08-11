// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheitem( "aamissile_projectile_mp" );
    precacheshader( "ac130_overlay_grain" );
    level.aamissilelaunchvert = 14000;
    level.aamissilelaunchhorz = 30000;
    level.aamissilelaunchtargetdist = 1500;
    level.rockets = [];
    level.killstreakfuncs["aamissile"] = ::tryuseaamissile;
}

tryuseaamissile( var_0 )
{
    if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
        return 0;
    }

    maps\mp\_utility::setusingremote( "aamissile" );
    var_1 = maps\mp\killstreaks\_killstreaks::initridekillstreak();

    if ( var_1 != "success" )
    {
        if ( var_1 != "disconnect" )
            maps\mp\_utility::clearusingremote();

        return 0;
    }

    level thread aa_missile_fire( var_0, self );
    return 1;
}

drawline( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

gettargets()
{
    var_0 = [];
    var_1 = [];

    if ( isdefined( level.littlebirds ) && level.littlebirds.size )
    {
        foreach ( var_3 in level.littlebirds )
        {
            if ( var_3.team != self.team )
                var_0[var_0.size] = var_3;
        }
    }

    if ( isdefined( level.helis ) && level.helis.size )
    {
        foreach ( var_6 in level.helis )
        {
            if ( var_6.team != self.team )
                var_1[var_1.size] = var_6;
        }
    }

    if ( level.ac130inuse && isdefined( level.ac130.owner ) && level.ac130.owner.team != self.team )
        return level.ac130.planemodel;

    if ( isdefined( var_1 ) && var_1.size )
        return var_1[0];
    else if ( isdefined( var_0 ) && var_0.size )
        return var_0[0];
}

aa_missile_fire( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = ( 0, 0, level.aamissilelaunchvert );
    var_4 = level.aamissilelaunchhorz;
    var_5 = level.aammissilelaunchtargetdist;
    var_6 = var_1 gettargets();

    if ( !isdefined( var_6 ) )
        var_7 = ( 0.0, 0.0, 0.0 );
    else
    {
        var_7 = var_6.origin;
        var_3 = ( 0.0, 0.0, 1.0 ) * var_7 + ( 0.0, 0.0, 1000.0 );
    }

    var_8 = anglestoforward( var_1.angles );
    var_9 = var_1.origin + var_3 + var_8 * var_4 * -1;
    var_10 = magicbullet( "aamissile_projectile_mp", var_9, var_7, var_1 );

    if ( !isdefined( var_10 ) )
    {
        var_1 maps\mp\_utility::clearusingremote();
        return;
    }

    var_10.lifeid = var_0;
    var_10.type = "remote";
    missileeyes( var_1, var_10 );
}

missileeyes( var_0, var_1 )
{
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_1 thread rocket_cleanupondeath();
    var_0 thread player_cleanupongameended( var_1 );
    var_0 thread player_cleanuponteamchange( var_1 );
    var_0 visionsetmissilecamforplayer( "black_bw", 0 );
    var_0 endon( "disconnect" );

    if ( isdefined( var_1 ) )
    {
        var_0 visionsetmissilecamforplayer( game["thermal_vision"], 1.0 );
        var_0 thread delayedfofoverlay();
        var_0 cameralinkto( var_1, "tag_origin" );
        var_0 controlslinkto( var_1 );

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 maps\mp\_utility::setthirdpersondof( 0 );

        var_1 waittill( "death" );

        if ( isdefined( var_1 ) )
            var_0 maps\mp\_matchdata::logkillstreakevent( "predator_missile", var_1.origin );

        var_0 controlsunlink();
        var_0 maps\mp\_utility::freezecontrolswrapper( 1 );

        if ( !level.gameended || isdefined( var_0.finalkill ) )
            var_0 thread staticeffect( 0.5 );

        wait 0.5;
        var_0 thermalvisionfofoverlayoff();
        var_0 cameraunlink();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 maps\mp\_utility::setthirdpersondof( 1 );
    }

    var_0 maps\mp\_utility::clearusingremote();
}

delayedfofoverlay()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.15;
    self thermalvisionfofoverlayon();
}

staticeffect( var_0 )
{
    self endon( "disconnect" );
    var_1 = newclienthudelem( self );
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1 setshader( "white", 640, 480 );
    var_1.archive = 1;
    var_1.sort = 10;
    var_2 = newclienthudelem( self );
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2 setshader( "ac130_overlay_grain", 640, 480 );
    var_2.archive = 1;
    var_2.sort = 20;
    wait(var_0);
    var_2 destroy();
    var_1 destroy();
}

player_cleanuponteamchange( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );

    if ( self.team != "spectator" )
    {
        self thermalvisionfofoverlayoff();
        self controlsunlink();
        self cameraunlink();

        if ( getdvarint( "camera_thirdPerson" ) )
            maps\mp\_utility::setthirdpersondof( 1 );
    }

    maps\mp\_utility::clearusingremote();
    level.remotemissileinprogress = undefined;
}

rocket_cleanupondeath()
{
    var_0 = self getentitynumber();
    level.rockets[var_0] = self;
    self waittill( "death" );
    level.rockets[var_0] = undefined;
}

player_cleanupongameended( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    level waittill( "game_ended" );
    self thermalvisionfofoverlayoff();
    self controlsunlink();
    self cameraunlink();

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 1 );
}
