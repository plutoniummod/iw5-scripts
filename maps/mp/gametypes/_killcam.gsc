// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"PLATFORM_PRESS_TO_SKIP" );
    precachestring( &"PLATFORM_PRESS_TO_RESPAWN" );
    precachestring( &"PLATFORM_PRESS_TO_COPYCAT" );
    level.killcam = maps\mp\gametypes\_tweakables::gettweakablevalue( "game", "allowkillcam" );
}

killcam( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    level endon( "game_ended" );

    if ( var_0 < 0 )
        return;

    if ( getdvar( "scr_killcam_time" ) == "" )
    {
        if ( var_3 == "artillery_mp" || var_3 == "stealth_bomb_mp" || var_3 == "remote_mortar_missile_mp" )
            var_10 = ( gettime() - var_2 ) / 1000 - var_4 - 0.1;
        else if ( level.showingfinalkillcam )
            var_10 = 4.0;
        else if ( var_3 == "apache_minigun_mp" )
            var_10 = 3.0;
        else if ( var_3 == "javelin_mp" || var_3 == "uav_strike_projectile_mp" )
            var_10 = 8;
        else if ( issubstr( var_3, "remotemissile_" ) )
            var_10 = 5;
        else if ( !var_6 || var_6 > 5.0 )
            var_10 = 5.0;
        else if ( var_3 == "frag_grenade_mp" || var_3 == "frag_grenade_short_mp" || var_3 == "semtex_mp" )
            var_10 = 4.25;
        else
            var_10 = 2.5;
    }
    else
        var_10 = getdvarfloat( "scr_killcam_time" );

    if ( isdefined( var_7 ) )
    {
        if ( var_10 > var_7 )
            var_10 = var_7;

        if ( var_10 < 0.05 )
            var_10 = 0.05;
    }

    if ( getdvar( "scr_killcam_posttime" ) == "" )
        var_11 = 2;
    else
    {
        var_11 = getdvarfloat( "scr_killcam_posttime" );

        if ( var_11 < 0.05 )
            var_11 = 0.05;
    }

    var_12 = var_10 + var_11;

    if ( isdefined( var_7 ) && var_12 > var_7 )
    {
        if ( var_7 < 2 )
            return;

        if ( var_7 - var_10 >= 1 )
            var_11 = var_7 - var_10;
        else
        {
            var_11 = 1;
            var_10 = var_7 - 1;
        }

        var_12 = var_10 + var_11;
    }

    var_13 = var_10 + var_4;
    var_14 = gettime();
    self notify( "begin_killcam", var_14 );

    if ( isdefined( var_8 ) )
        var_8 visionsyncwithplayer( var_9 );

    self.sessionstate = "spectator";
    self.forcespectatorclient = var_0;
    self.killcamentity = -1;

    if ( var_1 >= 0 )
        thread setkillcamentity( var_1, var_13, var_2 );

    self.archivetime = var_13;
    self.killcamlength = var_12;
    self.psoffsettime = var_5;
    self allowspectateteam( "allies", 1 );
    self allowspectateteam( "axis", 1 );
    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );

    if ( isdefined( var_8 ) && level.showingfinalkillcam )
    {
        self openmenu( "killedby_card_display" );
        self setcarddisplayslot( var_8, 7 );
    }

    thread endedkillcamcleanup();
    wait 0.05;

    if ( self.archivetime < var_13 )
    {

    }

    var_10 = self.archivetime - 0.05 - var_4;
    var_12 = var_10 + var_11;
    self.killcamlength = var_12;

    if ( var_10 <= 0 )
    {
        self.sessionstate = "dead";
        self.forcespectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self notify( "killcam_ended" );
        return;
    }

    if ( level.showingfinalkillcam )
        thread dofinalkillcamfx( var_10 );

    self.killcam = 1;
    initkcelements();

    if ( !( level.splitscreen || self issplitscreenplayer() ) )
    {
        self.kc_timer.alpha = 1;
        self.kc_timer settenthstimer( var_10 );
    }

    if ( var_6 && !level.gameended )
        maps\mp\_utility::setlowermessage( "kc_info", &"PLATFORM_PRESS_TO_SKIP", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
    else if ( !level.gameended )
        maps\mp\_utility::setlowermessage( "kc_info", &"PLATFORM_PRESS_TO_RESPAWN", undefined, undefined, undefined, undefined, undefined, undefined, 1 );

    if ( !level.showingfinalkillcam )
        self.kc_skiptext.alpha = 1;
    else
        self.kc_skiptext.alpha = 0;

    self.kc_othertext.alpha = 0;
    self.kc_icon.alpha = 0;
    thread spawnedkillcamcleanup();

    if ( self == var_9 && var_9 maps\mp\_utility::_hasperk( "specialty_copycat" ) && isdefined( var_9.pers["copyCatLoadout"] ) && !var_8 maps\mp\_utility::isjuggernaut() )
        thread waitkccopycatbutton( var_8 );

    if ( !level.showingfinalkillcam )
        thread waitskipkillcambutton( var_6 );
    else
        self notify( "showing_final_killcam" );

    thread endkillcamifnothingtoshow();
    waittillkillcamover();

    if ( level.showingfinalkillcam )
    {
        thread maps\mp\gametypes\_playerlogic::spawnendofgame();
        return;
    }

    thread calculatekillcamtime( var_14 );
    thread killcamcleanup( 1 );
}

dofinalkillcamfx( var_0 )
{
    if ( isdefined( level.doingfinalkillcamfx ) )
        return;

    level.doingfinalkillcamfx = 1;
    var_1 = var_0;

    if ( var_1 > 1.0 )
    {
        var_1 = 1.0;
        wait(var_0 - 1.0);
    }

    setslowmotion( 1.0, 0.25, var_1 );
    wait(var_1 + 0.5);
    setslowmotion( 0.25, 1, 1.0 );
    level.doingfinalkillcamfx = undefined;
}

calculatekillcamtime( var_0 )
{
    var_1 = int( gettime() - var_0 );
    maps\mp\_utility::incplayerstat( "killcamtimewatched", var_1 );
}

waittillkillcamover()
{
    self endon( "abort_killcam" );
    wait(self.killcamlength - 0.05);
}

setkillcamentity( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    var_3 = gettime() - var_1 * 1000;

    if ( var_2 > var_3 )
    {
        wait 0.05;
        var_1 = self.archivetime;
        var_3 = gettime() - var_1 * 1000;

        if ( var_2 > var_3 )
            wait(( var_2 - var_3 ) / 1000);
    }

    self.killcamentity = var_0;
}

waitskipkillcambutton( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    while ( self usebuttonpressed() )
        wait 0.05;

    while ( !self usebuttonpressed() )
        wait 0.05;

    if ( !maps\mp\_utility::matchmakinggame() )
        maps\mp\_utility::incplayerstat( "killcamskipped", 1 );

    if ( var_0 <= 0 )
        maps\mp\_utility::clearlowermessage( "kc_info" );

    self notify( "abort_killcam" );
}

waitkccopycatbutton( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    waitcopycatbutton( var_0 );
    self notify( "abort_killcam" );
}

waitdeathcopycatbutton( var_0 )
{
    self endon( "disconnect" );
    initkcelements();
    var_1 = waitcopycatbutton( var_0 );

    if ( !isdefined( var_1 ) )
    {
        self.kc_icon.alpha = 0;
        self.kc_othertext.alpha = 0;
    }
}

waitcopycatbutton( var_0 )
{
    self endon( "spawned_player" );
    self endon( "death_delay_finished" );
    self.kc_icon setshader( "specialty_copycat", 48, 48 );
    self.kc_othertext settext( &"PLATFORM_PRESS_TO_COPYCAT" );
    self.kc_othertext.alpha = 1;
    self.kc_icon.alpha = 1;
    self notifyonplayercommand( "use_copycat", "weapnext" );
    self waittill( "use_copycat" );
    self.pers["copyCatLoadout"]["inUse"] = 1;
    self.pers["copyCatLoadout"]["owner"] = var_0;
    self.kc_othertext fadeovertime( 0.5 );
    self.kc_othertext.alpha = 0;
    self.kc_icon fadeovertime( 0.25 );
    self.kc_icon scaleovertime( 0.25, 512, 512 );
    self.kc_icon.alpha = 0;

    if ( isdefined( var_0 ) )
        var_0 thread maps\mp\gametypes\_hud_message::playercardsplashnotify( "copied", self );

    self playlocalsound( "copycat_steal_class" );
    return 1;
}

waitskipkillcamsafespawnbutton()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    if ( !maps\mp\gametypes\_playerlogic::mayspawn() )
        return;

    while ( self fragbuttonpressed() )
        wait 0.05;

    while ( !self fragbuttonpressed() )
        wait 0.05;

    self.wantsafespawn = 1;
    self notify( "abort_killcam" );
}

endkillcamifnothingtoshow()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    for (;;)
    {
        if ( self.archivetime <= 0 )
            break;

        wait 0.05;
    }

    self notify( "abort_killcam" );
}

spawnedkillcamcleanup()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    self waittill( "spawned" );
    thread killcamcleanup( 0 );
}

endedkillcamcleanup()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    level waittill( "game_ended" );
    thread killcamcleanup( 1 );
}

killcamcleanup( var_0 )
{
    if ( isdefined( self.kc_skiptext ) )
        self.kc_skiptext.alpha = 0;

    if ( isdefined( self.kc_timer ) )
        self.kc_timer.alpha = 0;

    if ( isdefined( self.kc_icon ) )
        self.kc_icon.alpha = 0;

    if ( isdefined( self.kc_othertext ) )
        self.kc_othertext.alpha = 0;

    self.killcam = undefined;

    if ( !level.gameended )
        maps\mp\_utility::clearlowermessage( "kc_info" );

    thread maps\mp\gametypes\_spectating::setspectatepermissions();
    self notify( "killcam_ended" );

    if ( !var_0 )
        return;

    self.sessionstate = "dead";
    maps\mp\_utility::clearkillcamstate();
}

cancelkillcamonuse()
{
    self.cancelkillcam = 0;
    thread cancelkillcamonuse_specificbutton( ::cancelkillcamusebutton, ::cancelkillcamcallback );
}

cancelkillcamusebutton()
{
    return self usebuttonpressed();
}

cancelkillcamsafespawnbutton()
{
    return self fragbuttonpressed();
}

cancelkillcamcallback()
{
    self.cancelkillcam = 1;
}

cancelkillcamsafespawncallback()
{
    self.cancelkillcam = 1;
    self.wantsafespawn = 1;
}

cancelkillcamonuse_specificbutton( var_0, var_1 )
{
    self endon( "death_delay_finished" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !self [[ var_0 ]]() )
        {
            wait 0.05;
            continue;
        }

        var_2 = 0;

        while ( self [[ var_0 ]]() )
        {
            var_2 += 0.05;
            wait 0.05;
        }

        if ( var_2 >= 0.5 )
            continue;

        var_2 = 0;

        while ( !self [[ var_0 ]]() && var_2 < 0.5 )
        {
            var_2 += 0.05;
            wait 0.05;
        }

        if ( var_2 >= 0.5 )
            continue;

        self [[ var_1 ]]();
        return;
    }
}

initkcelements()
{
    if ( !isdefined( self.kc_skiptext ) )
    {
        self.kc_skiptext = newclienthudelem( self );
        self.kc_skiptext.archived = 0;
        self.kc_skiptext.x = 0;
        self.kc_skiptext.alignx = "center";
        self.kc_skiptext.aligny = "top";
        self.kc_skiptext.horzalign = "center_adjustable";
        self.kc_skiptext.vertalign = "top_adjustable";
        self.kc_skiptext.sort = 1;
        self.kc_skiptext.font = "default";
        self.kc_skiptext.foreground = 1;
        self.kc_skiptext.hidewheninmenu = 1;

        if ( level.splitscreen || self issplitscreenplayer() )
        {
            self.kc_skiptext.y = 20;
            self.kc_skiptext.fontscale = 1.2;
        }
        else
        {
            self.kc_skiptext.y = 32;
            self.kc_skiptext.fontscale = 1.8;
        }
    }

    if ( !isdefined( self.kc_othertext ) )
    {
        self.kc_othertext = newclienthudelem( self );
        self.kc_othertext.archived = 0;
        self.kc_othertext.y = 18;
        self.kc_othertext.alignx = "left";
        self.kc_othertext.aligny = "top";
        self.kc_othertext.horzalign = "center";
        self.kc_othertext.vertalign = "middle";
        self.kc_othertext.sort = 10;
        self.kc_othertext.font = "small";
        self.kc_othertext.foreground = 1;
        self.kc_othertext.hidewheninmenu = 1;

        if ( level.splitscreen )
        {
            self.kc_othertext.x = 16;
            self.kc_othertext.fontscale = 1.2;
        }
        else
        {
            self.kc_othertext.x = 62;
            self.kc_othertext.fontscale = 1.6;
        }
    }

    if ( !isdefined( self.kc_icon ) )
    {
        self.kc_icon = newclienthudelem( self );
        self.kc_icon.archived = 0;
        self.kc_icon.x = 16;
        self.kc_icon.y = 16;
        self.kc_icon.alignx = "left";
        self.kc_icon.aligny = "top";
        self.kc_icon.horzalign = "center";
        self.kc_icon.vertalign = "middle";
        self.kc_icon.sort = 1;
        self.kc_icon.foreground = 1;
        self.kc_icon.hidewheninmenu = 1;
    }

    if ( !( level.splitscreen || self issplitscreenplayer() ) )
    {
        if ( !isdefined( self.kc_timer ) )
        {
            self.kc_timer = maps\mp\gametypes\_hud_util::createfontstring( "hudbig", 1.0 );
            self.kc_timer.archived = 0;
            self.kc_timer.x = 0;
            self.kc_timer.alignx = "center";
            self.kc_timer.aligny = "middle";
            self.kc_timer.horzalign = "center_safearea";
            self.kc_timer.vertalign = "top_adjustable";
            self.kc_timer.y = 42;
            self.kc_timer.sort = 1;
            self.kc_timer.font = "hudbig";
            self.kc_timer.foreground = 1;
            self.kc_timer.color = ( 0.85, 0.85, 0.85 );
            self.kc_timer.hidewheninmenu = 1;
        }
    }
}
