// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_FIRSTPLACE_NAME" );
    precachestring( &"MP_SECONDPLACE_NAME" );
    precachestring( &"MP_THIRDPLACE_NAME" );
    precachestring( &"MP_MATCH_BONUS_IS" );
    precachemenu( "splash" );
    precachemenu( "challenge" );
    precachemenu( "defcon" );
    precachemenu( "killstreak" );
    precachemenu( "perk_display" );
    precachemenu( "perk_hide" );
    precachemenu( "killedby_card_display" );
    precachemenu( "killedby_card_hide" );
    precachemenu( "youkilled_card_display" );
    game["menu_endgameupdate"] = "endgameupdate";

    if ( level.splitscreen )
        game["menu_endgameupdate"] += "_splitscreen";

    precachemenu( game["menu_endgameupdate"] );
    game["strings"]["draw"] = &"MP_DRAW";
    game["strings"]["round_draw"] = &"MP_ROUND_DRAW";
    game["strings"]["round_win"] = &"MP_ROUND_WIN";
    game["strings"]["round_loss"] = &"MP_ROUND_LOSS";
    game["strings"]["victory"] = &"MP_VICTORY";
    game["strings"]["defeat"] = &"MP_DEFEAT";
    game["strings"]["halftime"] = &"MP_HALFTIME";
    game["strings"]["overtime"] = &"MP_OVERTIME";
    game["strings"]["roundend"] = &"MP_ROUNDEND";
    game["strings"]["intermission"] = &"MP_INTERMISSION";
    game["strings"]["side_switch"] = &"MP_SWITCHING_SIDES";
    game["strings"]["match_bonus"] = &"MP_MATCH_BONUS_IS";
    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread hintmessagedeaththink();
        var_0 thread lowermessagethink();
        var_0 thread initnotifymessage();
    }
}

hintmessage( var_0 )
{
    var_1 = spawnstruct();
    var_1.notifytext = var_0;
    var_1.glowcolor = ( 0.3, 0.6, 0.3 );
    notifymessage( var_1 );
}

initnotifymessage()
{
    if ( level.splitscreen || self issplitscreenplayer() )
    {
        var_0 = 1.5;
        var_1 = 1.25;
        var_2 = 24;
        var_3 = "default";
        var_4 = "TOP";
        var_5 = "BOTTOM";
        var_6 = 0;
        var_7 = 0;
    }
    else
    {
        var_0 = 2.5;
        var_1 = 1.75;
        var_2 = 30;
        var_3 = "objective";
        var_4 = "TOP";
        var_5 = "BOTTOM";
        var_6 = 50;
        var_7 = 0;
    }

    self.notifytitle = maps\mp\gametypes\_hud_util::createfontstring( var_3, var_0 );
    self.notifytitle maps\mp\gametypes\_hud_util::setpoint( var_4, undefined, var_7, var_6 );
    self.notifytitle.glowcolor = ( 0.2, 0.3, 0.7 );
    self.notifytitle.glowalpha = 1;
    self.notifytitle.hidewheninmenu = 1;
    self.notifytitle.archived = 0;
    self.notifytitle.alpha = 0;
    self.notifytext = maps\mp\gametypes\_hud_util::createfontstring( var_3, var_1 );
    self.notifytext maps\mp\gametypes\_hud_util::setparent( self.notifytitle );
    self.notifytext maps\mp\gametypes\_hud_util::setpoint( var_4, var_5, 0, 0 );
    self.notifytext.glowcolor = ( 0.2, 0.3, 0.7 );
    self.notifytext.glowalpha = 1;
    self.notifytext.hidewheninmenu = 1;
    self.notifytext.archived = 0;
    self.notifytext.alpha = 0;
    self.notifytext2 = maps\mp\gametypes\_hud_util::createfontstring( var_3, var_1 );
    self.notifytext2 maps\mp\gametypes\_hud_util::setparent( self.notifytitle );
    self.notifytext2 maps\mp\gametypes\_hud_util::setpoint( var_4, var_5, 0, 0 );
    self.notifytext2.glowcolor = ( 0.2, 0.3, 0.7 );
    self.notifytext2.glowalpha = 1;
    self.notifytext2.hidewheninmenu = 1;
    self.notifytext2.archived = 0;
    self.notifytext2.alpha = 0;
    self.notifyicon = maps\mp\gametypes\_hud_util::createicon( "white", var_2, var_2 );
    self.notifyicon maps\mp\gametypes\_hud_util::setparent( self.notifytext2 );
    self.notifyicon maps\mp\gametypes\_hud_util::setpoint( var_4, var_5, 0, 0 );
    self.notifyicon.hidewheninmenu = 1;
    self.notifyicon.archived = 0;
    self.notifyicon.alpha = 0;
    self.notifyoverlay = maps\mp\gametypes\_hud_util::createicon( "white", var_2, var_2 );
    self.notifyoverlay maps\mp\gametypes\_hud_util::setparent( self.notifyicon );
    self.notifyoverlay maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, 0 );
    self.notifyoverlay.hidewheninmenu = 1;
    self.notifyoverlay.archived = 0;
    self.notifyoverlay.alpha = 0;
    self.doingsplash = [];
    self.doingsplash[0] = undefined;
    self.doingsplash[1] = undefined;
    self.doingsplash[2] = undefined;
    self.doingsplash[3] = undefined;
    self.splashqueue = [];
    self.splashqueue[0] = [];
    self.splashqueue[1] = [];
    self.splashqueue[2] = [];
    self.splashqueue[3] = [];
}

oldnotifymessage( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6.titletext = var_0;
    var_6.notifytext = var_1;
    var_6.iconname = var_2;
    var_6.glowcolor = var_3;
    var_6.sound = var_4;
    var_6.duration = var_5;
    notifymessage( var_6 );
}

notifymessage( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !isdefined( var_0.slot ) )
        var_0.slot = 0;

    var_1 = var_0.slot;

    if ( !isdefined( var_0.type ) )
        var_0.type = "";

    if ( !isdefined( self.doingsplash[var_1] ) )
    {
        thread shownotifymessage( var_0 );
        return;
    }

    self.splashqueue[var_1][self.splashqueue[var_1].size] = var_0;
}

dispatchnotify( var_0 )
{
    var_1 = self.splashqueue[var_0][0];

    for ( var_2 = 1; var_2 < self.splashqueue[var_0].size; var_2++ )
        self.splashqueue[var_0][var_2 - 1] = self.splashqueue[var_0][var_2];

    self.splashqueue[var_0][var_2 - 1] = undefined;

    if ( isdefined( var_1.name ) )
        actionnotify( var_1 );
    else
        shownotifymessage( var_1 );
}

promotionsplashnotify()
{
    self endon( "disconnect" );
    var_0 = spawnstruct();
    var_0.name = "promotion";
    var_0.type = "rank";
    var_0.sound = "mp_level_up";
    var_0.slot = 0;
    thread actionnotify( var_0 );
}

weaponpromotionsplashnotify()
{
    self endon( "disconnect" );
    var_0 = spawnstruct();
    var_0.name = "promotion_weapon";
    var_0.type = "weaponRank";
    var_0.sound = "mp_level_up";
    var_0.slot = 0;
    thread actionnotify( var_0 );
}

shownotifymessage( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0.slot;

    if ( level.gameended )
    {
        if ( isdefined( var_0.type ) && var_0.type == "rank" )
        {
            self setclientdvar( "ui_promotion", 1 );
            self.postgamepromotion = 1;
        }

        if ( self.splashqueue[var_1].size )
            thread dispatchnotify( var_1 );

        return;
    }

    self.doingsplash[var_1] = var_0;
    waitrequirevisibility( 0 );

    if ( isdefined( var_0.duration ) )
        var_2 = var_0.duration;
    else if ( level.gameended )
        var_2 = 2.0;
    else
        var_2 = 4.0;

    thread resetoncancel();

    if ( isdefined( var_0.sound ) )
        self playlocalsound( var_0.sound );

    if ( isdefined( var_0.leadersound ) )
        maps\mp\_utility::leaderdialogonplayer( var_0.leadersound );

    if ( isdefined( var_0.glowcolor ) )
        var_3 = var_0.glowcolor;
    else
        var_3 = ( 0.3, 0.6, 0.3 );

    var_4 = self.notifytitle;

    if ( isdefined( var_0.titletext ) )
    {
        if ( isdefined( var_0.titlelabel ) )
            self.notifytitle.label = var_0.titlelabel;
        else
            self.notifytitle.label = &"";

        if ( isdefined( var_0.titlelabel ) && !isdefined( var_0.titleisstring ) )
            self.notifytitle setvalue( var_0.titletext );
        else
            self.notifytitle settext( var_0.titletext );

        self.notifytitle setpulsefx( int( 25 * var_2 ), int( var_2 * 1000 ), 1000 );
        self.notifytitle.glowcolor = var_3;
        self.notifytitle.alpha = 1;
    }

    if ( isdefined( var_0.textglowcolor ) )
        var_3 = var_0.textglowcolor;

    if ( isdefined( var_0.notifytext ) )
    {
        if ( isdefined( var_0.textlabel ) )
            self.notifytext.label = var_0.textlabel;
        else
            self.notifytext.label = &"";

        if ( isdefined( var_0.textlabel ) && !isdefined( var_0._id_12F4 ) )
            self.notifytext setvalue( var_0.notifytext );
        else
            self.notifytext settext( var_0.notifytext );

        self.notifytext setpulsefx( 100, int( var_2 * 1000 ), 1000 );
        self.notifytext.glowcolor = var_3;
        self.notifytext.alpha = 1;
        var_4 = self.notifytext;
    }

    if ( isdefined( var_0.notifytext2 ) )
    {
        self.notifytext2 maps\mp\gametypes\_hud_util::setparent( var_4 );

        if ( isdefined( var_0.text2label ) )
            self.notifytext2.label = var_0.text2label;
        else
            self.notifytext2.label = &"";

        self.notifytext2 settext( var_0.notifytext2 );
        self.notifytext2 setpulsefx( 100, int( var_2 * 1000 ), 1000 );
        self.notifytext2.glowcolor = var_3;
        self.notifytext2.alpha = 1;
        var_4 = self.notifytext2;
    }

    if ( isdefined( var_0.iconname ) )
    {
        self.notifyicon maps\mp\gametypes\_hud_util::setparent( var_4 );

        if ( level.splitscreen || self issplitscreenplayer() )
            self.notifyicon setshader( var_0.iconname, 30, 30 );
        else
            self.notifyicon setshader( var_0.iconname, 60, 60 );

        self.notifyicon.alpha = 0;

        if ( isdefined( var_0.iconoverlay ) )
        {
            self.notifyicon fadeovertime( 0.15 );
            self.notifyicon.alpha = 1;
            var_0._id_36E9 = 0;
            self.notifyoverlay maps\mp\gametypes\_hud_util::setparent( self.notifyicon );
            self.notifyoverlay maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, var_0._id_36E9 );
            self.notifyoverlay setshader( var_0.iconoverlay, 512, 512 );
            self.notifyoverlay.alpha = 0;
            self.notifyoverlay.color = ( 1.0, 0.0, 0.0 );
            self.notifyoverlay fadeovertime( 0.4 );
            self.notifyoverlay.alpha = 0.85;
            self.notifyoverlay scaleovertime( 0.4, 32, 32 );
            waitrequirevisibility( var_2 );
            self.notifyicon fadeovertime( 0.75 );
            self.notifyicon.alpha = 0;
            self.notifyoverlay fadeovertime( 0.75 );
            self.notifyoverlay.alpha = 0;
        }
        else
        {
            self.notifyicon fadeovertime( 1.0 );
            self.notifyicon.alpha = 1;
            waitrequirevisibility( var_2 );
            self.notifyicon fadeovertime( 0.75 );
            self.notifyicon.alpha = 0;
        }
    }
    else
        waitrequirevisibility( var_2 );

    self notify( "notifyMessageDone" );
    self.doingsplash[var_1] = undefined;

    if ( self.splashqueue[var_1].size )
        thread dispatchnotify( var_1 );
}

killstreaksplashnotify( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    waittillframeend;

    if ( level.gameended )
        return;

    var_3 = spawnstruct();

    if ( isdefined( var_2 ) )
        var_3.name = var_0 + "_" + var_2;
    else
        var_3.name = var_0;

    var_3.type = "killstreak";
    var_3.optionalnumber = var_1;
    var_3.sound = maps\mp\killstreaks\_killstreaks::getkillstreaksound( var_0 );
    var_3.leadersound = var_0;
    var_3.leadersoundgroup = "killstreak_earned";
    var_3.slot = 0;
    thread actionnotify( var_3 );
}

defconsplashnotify( var_0, var_1 )
{

}

challengesplashnotify( var_0 )
{
    self endon( "disconnect" );
    waittillframeend;
    wait 0.05;
    var_1 = maps\mp\gametypes\_hud_util::ch_getstate( var_0 ) - 1;
    var_2 = maps\mp\gametypes\_hud_util::ch_gettarget( var_0, var_1 );

    if ( var_2 == 0 )
        var_2 = 1;

    if ( var_0 == "ch_longersprint_pro" )
        var_2 = int( var_2 / 5280 );

    var_3 = spawnstruct();
    var_3.type = "challenge";
    var_3.optionalnumber = var_2;
    var_3.name = var_0;
    var_3.sound = tablelookup( "mp/splashTable.csv", 0, var_3.name, 9 );
    var_3.slot = 0;
    thread actionnotify( var_3 );
}

splashnotify( var_0, var_1 )
{
    self endon( "disconnect" );
    wait 0.05;
    var_2 = spawnstruct();
    var_2.name = var_0;
    var_2.optionalnumber = var_1;
    var_2.sound = tablelookup( "mp/splashTable.csv", 0, var_2.name, 9 );
    var_2.slot = 0;
    thread actionnotify( var_2 );
}

splashnotifydelayed( var_0, var_1 )
{
    if ( level.hardcoremode )
        return;

    self endon( "disconnect" );
    waittillframeend;

    if ( level.gameended )
        return;

    var_2 = spawnstruct();
    var_2.name = var_0;
    var_2.optionalnumber = var_1;
    var_2.sound = tablelookup( "mp/splashTable.csv", 0, var_2.name, 9 );
    var_2.slot = 0;
    thread actionnotify( var_2 );
}

playercardsplashnotify( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    waittillframeend;

    if ( level.gameended )
        return;

    var_3 = spawnstruct();
    var_3.name = var_0;
    var_3.optionalnumber = var_2;
    var_3.sound = tablelookup( "mp/splashTable.csv", 0, var_3.name, 9 );
    var_3.playercardplayer = var_1;
    var_3.slot = 1;
    thread actionnotify( var_3 );
}

actionnotify( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = var_0.slot;

    if ( !isdefined( var_0.type ) )
        var_0.type = "";

    if ( !isdefined( self.doingsplash[var_1] ) )
    {
        thread actionnotifymessage( var_0 );
        return;
    }
    else if ( var_0.type == "killstreak" && self.doingsplash[var_1].type != "challenge" && self.doingsplash[var_1].type != "rank" )
    {
        self.notifytext.alpha = 0;
        self.notifytext2.alpha = 0;
        self.notifyicon.alpha = 0;
        thread actionnotifymessage( var_0 );
        return;
    }
    else if ( var_0.type == "challenge" && self.doingsplash[var_1].type != "killstreak" && self.doingsplash[var_1].type != "challenge" && self.doingsplash[var_1].type != "rank" )
    {
        self.notifytext.alpha = 0;
        self.notifytext2.alpha = 0;
        self.notifyicon.alpha = 0;
        thread actionnotifymessage( var_0 );
        return;
    }

    if ( var_0.type == "challenge" || var_0.type == "killstreak" )
    {
        if ( var_0.type == "killstreak" )
            removetypefromqueue( "killstreak", var_1 );

        for ( var_2 = self.splashqueue[var_1].size; var_2 > 0; var_2-- )
            self.splashqueue[var_1][var_2] = self.splashqueue[var_1][var_2 - 1];

        self.splashqueue[var_1][0] = var_0;
    }
    else
        self.splashqueue[var_1][self.splashqueue[var_1].size] = var_0;
}

removetypefromqueue( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < self.splashqueue[var_1].size; var_3++ )
    {
        if ( self.splashqueue[var_1][var_3].type != "killstreak" )
            var_2[var_2.size] = self.splashqueue[var_1][var_3];
    }

    self.splashqueue[var_1] = var_2;
}

actionnotifymessage( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0.slot;

    if ( level.gameended )
    {
        wait 0;

        if ( isdefined( var_0.type ) && ( var_0.type == "rank" || var_0.type == "weaponRank" ) )
        {
            self setclientdvar( "ui_promotion", 1 );
            self.postgamepromotion = 1;
        }
        else if ( isdefined( var_0.type ) && var_0.type == "challenge" )
        {
            self.pers["postGameChallenges"]++;
            self setclientdvar( "ui_challenge_" + self.pers["postGameChallenges"] + "_ref", var_0.name );
        }

        if ( self.splashqueue[var_1].size )
            thread dispatchnotify( var_1 );

        return;
    }

    if ( tablelookup( "mp/splashTable.csv", 0, var_0.name, 0 ) != "" )
    {
        if ( isdefined( var_0.playercardplayer ) )
            self setcarddisplayslot( var_0.playercardplayer, 5 );

        if ( isdefined( var_0.optionalnumber ) )
            self showhudsplash( var_0.name, var_0.slot, var_0.optionalnumber );
        else
            self showhudsplash( var_0.name, var_0.slot );

        self.doingsplash[var_1] = var_0;
        var_2 = maps\mp\_utility::stringtofloat( tablelookup( "mp/splashTable.csv", 0, var_0.name, 4 ) );

        if ( isdefined( var_0.sound ) )
            self playlocalsound( var_0.sound );

        if ( isdefined( var_0.leadersound ) )
        {
            if ( isdefined( var_0.leadersoundgroup ) )
                maps\mp\_utility::leaderdialogonplayer( var_0.leadersound, var_0.leadersoundgroup, 1 );
            else
                maps\mp\_utility::leaderdialogonplayer( var_0.leadersound );
        }

        self notify( "actionNotifyMessage" + var_1 );
        self endon( "actionNotifyMessage" + var_1 );
        wait(var_2 - 0.05);
        self.doingsplash[var_1] = undefined;
    }

    if ( self.splashqueue[var_1].size )
        thread dispatchnotify( var_1 );
}

waitrequirevisibility( var_0 )
{
    var_1 = 0.05;

    while ( !canreadtext() )
        wait(var_1);

    while ( var_0 > 0 )
    {
        wait(var_1);

        if ( canreadtext() )
            var_0 -= var_1;
    }
}

canreadtext()
{
    if ( maps\mp\_flashgrenades::isflashbanged() )
        return 0;

    return 1;
}

resetondeath()
{
    self endon( "notifyMessageDone" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    resetnotify();
}

resetoncancel()
{
    self notify( "resetOnCancel" );
    self endon( "resetOnCancel" );
    self endon( "notifyMessageDone" );
    self endon( "disconnect" );
    level waittill( "cancel_notify" );
    resetnotify();
}

resetnotify()
{
    self.notifytitle.alpha = 0;
    self.notifytext.alpha = 0;
    self.notifyicon.alpha = 0;
    self.notifyoverlay.alpha = 0;
    self.doingsplash[0] = undefined;
    self.doingsplash[1] = undefined;
    self.doingsplash[2] = undefined;
    self.doingsplash[3] = undefined;
}

hintmessagedeaththink()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "death" );

        if ( isdefined( self.hintmessage ) )
            self.hintmessage maps\mp\gametypes\_hud_util::destroyelem();
    }
}

lowermessagethink()
{
    self endon( "disconnect" );
    self.lowermessages = [];
    self.lowermessage = maps\mp\gametypes\_hud_util::createfontstring( "default", level.lowertextfontsize );
    self.lowermessage settext( "" );
    self.lowermessage.archived = 0;
    self.lowermessage.sort = 10;

    if ( level.splitscreen || self issplitscreenplayer() )
    {
        self.lowermessage maps\mp\gametypes\_hud_util::setpoint( "CENTER", level.lowertextyalign, 0, level.lowertexty );
        var_0 = 0.5;
    }
    else
    {
        self.lowermessage maps\mp\gametypes\_hud_util::setpoint( "CENTER", level.lowertextyalign, 0, level.lowertexty - 40 );
        var_0 = 0.75;
    }

    self.lowertimer = maps\mp\gametypes\_hud_util::createfontstring( "hudbig", var_0 );
    self.lowertimer maps\mp\gametypes\_hud_util::setparent( self.lowermessage );
    self.lowertimer maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, 0 );
    self.lowertimer settext( "" );
    self.lowertimer.archived = 0;
    self.lowertimer.sort = 10;
}

outcomeoverlay( var_0 )
{
    if ( level.teambased )
    {
        if ( var_0 == "tie" )
            matchoutcomenotify( "draw" );
        else if ( var_0 == self.team )
            matchoutcomenotify( "victory" );
        else
            matchoutcomenotify( "defeat" );
    }
    else if ( var_0 == self )
        matchoutcomenotify( "victory" );
    else
        matchoutcomenotify( "defeat" );
}

matchoutcomenotify( var_0 )
{
    var_1 = self.team;
    var_2 = maps\mp\gametypes\_hud_util::createfontstring( "bigfixed", 1.0 );
    var_2 maps\mp\gametypes\_hud_util::setpoint( "TOP", undefined, 0, 50 );
    var_2.foreground = 1;
    var_2.glowalpha = 1;
    var_2.hidewheninmenu = 0;
    var_2.archived = 0;
    var_2 settext( game["strings"][var_0] );
    var_2.alpha = 0;
    var_2 fadeovertime( 0.5 );
    var_2.alpha = 1;

    switch ( var_0 )
    {
        case "victory":
            var_2.glowcolor = ( 0.6, 0.9, 0.6 );
            break;
        default:
            var_2.glowcolor = ( 0.9, 0.6, 0.6 );
            break;
    }

    var_3 = maps\mp\gametypes\_hud_util::createicon( game["icons"][var_1], 64, 64 );
    var_3 maps\mp\gametypes\_hud_util::setparent( var_2 );
    var_3 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, 30 );
    var_3.foreground = 1;
    var_3.hidewheninmenu = 0;
    var_3.archived = 0;
    var_3.alpha = 0;
    var_3 fadeovertime( 0.5 );
    var_3.alpha = 1;
    wait 3.0;
    var_2 maps\mp\gametypes\_hud_util::destroyelem();
    var_3 maps\mp\gametypes\_hud_util::destroyelem();
}

isdoingsplash()
{
    if ( isdefined( self.doingsplash[0] ) )
        return 1;

    if ( isdefined( self.doingsplash[1] ) )
        return 1;

    if ( isdefined( self.doingsplash[2] ) )
        return 1;

    if ( isdefined( self.doingsplash[3] ) )
        return 1;

    return 0;
}

teamoutcomenotify( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self notify( "reset_outcome" );
    wait 0.5;
    var_3 = self.pers["team"];

    if ( !isdefined( var_3 ) || var_3 != "allies" && var_3 != "axis" )
        var_3 = "allies";

    while ( isdoingsplash() )
        wait 0.05;

    self endon( "reset_outcome" );

    if ( level.splitscreen || self issplitscreenplayer() )
    {
        var_4 = 1;
        var_5 = -76;
        var_6 = 0.667;
        var_7 = 12;
        var_8 = 0.833;
        var_9 = 46;
        var_10 = 40;
        var_11 = 30;
        var_12 = 0;
        var_13 = 60;
        var_14 = "hudbig";
    }
    else
    {
        var_4 = 1.5;
        var_5 = -134;
        var_6 = 1.0;
        var_7 = 18;
        var_8 = 1.25;
        var_9 = 70;
        var_10 = 60;
        var_11 = 45;
        var_12 = 0;
        var_13 = 90;
        var_14 = "hudbig";
    }

    var_15 = 60000;
    var_16 = maps\mp\gametypes\_hud_util::createfontstring( var_14, var_4 );
    var_16 maps\mp\gametypes\_hud_util::setpoint( "CENTER", undefined, 0, var_5 );
    var_16.foreground = 1;
    var_16.glowalpha = 1;
    var_16.hidewheninmenu = 0;
    var_16.archived = 0;
    var_17 = maps\mp\gametypes\_hud_util::createfontstring( var_14, var_6 );
    var_17 maps\mp\gametypes\_hud_util::setparent( var_16 );
    var_17.foreground = 1;
    var_17 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_7 );
    var_17.glowalpha = 1;
    var_17.hidewheninmenu = 0;
    var_17.archived = 0;

    if ( var_0 == "halftime" )
    {
        var_16.glowcolor = ( 0.2, 0.3, 0.7 );
        var_16 settext( game["strings"]["halftime"] );
        var_16.color = ( 1.0, 1.0, 1.0 );
        var_0 = "allies";
    }
    else if ( var_0 == "intermission" )
    {
        var_16.glowcolor = ( 0.2, 0.3, 0.7 );
        var_16 settext( game["strings"]["intermission"] );
        var_16.color = ( 1.0, 1.0, 1.0 );
        var_0 = "allies";
    }
    else if ( var_0 == "roundend" )
    {
        var_16.glowcolor = ( 0.2, 0.3, 0.7 );
        var_16 settext( game["strings"]["roundend"] );
        var_16.color = ( 1.0, 1.0, 1.0 );
        var_0 = "allies";
    }
    else if ( var_0 == "overtime" )
    {
        var_16.glowcolor = ( 0.2, 0.3, 0.7 );
        var_16 settext( game["strings"]["overtime"] );
        var_16.color = ( 1.0, 1.0, 1.0 );
        var_0 = "allies";
    }
    else if ( var_0 == "tie" )
    {
        var_16.glowcolor = ( 0.2, 0.3, 0.7 );

        if ( var_1 )
            var_16 settext( game["strings"]["round_draw"] );
        else
            var_16 settext( game["strings"]["draw"] );

        var_16.color = ( 1.0, 1.0, 1.0 );
        var_0 = "allies";
    }
    else if ( isdefined( self.pers["team"] ) && var_0 == var_3 )
    {
        var_16.glowcolor = ( 0.0, 0.0, 0.0 );

        if ( var_1 )
            var_16 settext( game["strings"]["round_win"] );
        else
            var_16 settext( game["strings"]["victory"] );

        var_16.color = ( 0.6, 0.9, 0.6 );
    }
    else
    {
        var_16.glowcolor = ( 0.0, 0.0, 0.0 );

        if ( var_1 )
            var_16 settext( game["strings"]["round_loss"] );
        else
            var_16 settext( game["strings"]["defeat"] );

        var_16.color = ( 0.7, 0.3, 0.2 );
    }

    var_17.glowcolor = ( 0.2, 0.3, 0.7 );
    var_17 settext( var_2 );
    var_16 setpulsefx( 100, var_15, 1000 );
    var_17 setpulsefx( 100, var_15, 1000 );

    if ( maps\mp\_utility::getintproperty( "useRelativeTeamColors", 0 ) )
        var_18 = maps\mp\gametypes\_hud_util::createicon( game["icons"][var_3] + "_blue", var_9, var_9 );
    else
        var_18 = maps\mp\gametypes\_hud_util::createicon( game["icons"][var_3], var_9, var_9 );

    var_18 maps\mp\gametypes\_hud_util::setparent( var_17 );
    var_18 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", var_10 * -1, var_11 );
    var_18.foreground = 1;
    var_18.hidewheninmenu = 0;
    var_18.archived = 0;
    var_18.alpha = 0;
    var_18 fadeovertime( 0.5 );
    var_18.alpha = 1;

    if ( maps\mp\_utility::getintproperty( "useRelativeTeamColors", 0 ) )
        var_19 = maps\mp\gametypes\_hud_util::createicon( game["icons"][level.otherteam[var_3]] + "_red", var_9, var_9 );
    else
        var_19 = maps\mp\gametypes\_hud_util::createicon( game["icons"][level.otherteam[var_3]], var_9, var_9 );

    var_19 maps\mp\gametypes\_hud_util::setparent( var_17 );
    var_19 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", var_10, var_11 );
    var_19.foreground = 1;
    var_19.hidewheninmenu = 0;
    var_19.archived = 0;
    var_19.alpha = 0;
    var_19 fadeovertime( 0.5 );
    var_19.alpha = 1;
    var_20 = maps\mp\gametypes\_hud_util::createfontstring( var_14, var_8 );
    var_20 maps\mp\gametypes\_hud_util::setparent( var_18 );
    var_20 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_12 );

    if ( maps\mp\_utility::getintproperty( "useRelativeTeamColors", 0 ) )
        var_20.glowcolor = game["colors"]["blue"];
    else
        var_20.glowcolor = game["colors"][var_3];

    var_20.glowalpha = 1;

    if ( !maps\mp\_utility::isroundbased() || !maps\mp\_utility::isobjectivebased() )
        var_20 setvalue( maps\mp\gametypes\_gamescore::_getteamscore( var_3 ) );
    else
        var_20 setvalue( game["roundsWon"][var_3] );

    var_20.foreground = 1;
    var_20.hidewheninmenu = 0;
    var_20.archived = 0;
    var_20 setpulsefx( 100, var_15, 1000 );
    var_21 = maps\mp\gametypes\_hud_util::createfontstring( var_14, var_8 );
    var_21 maps\mp\gametypes\_hud_util::setparent( var_19 );
    var_21 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_12 );

    if ( maps\mp\_utility::getintproperty( "useRelativeTeamColors", 0 ) )
        var_21.glowcolor = game["colors"]["red"];
    else
        var_21.glowcolor = game["colors"][level.otherteam[var_3]];

    var_21.glowalpha = 1;

    if ( !maps\mp\_utility::isroundbased() || !maps\mp\_utility::isobjectivebased() )
        var_21 setvalue( maps\mp\gametypes\_gamescore::_getteamscore( level.otherteam[var_3] ) );
    else
        var_21 setvalue( game["roundsWon"][level.otherteam[var_3]] );

    var_21.foreground = 1;
    var_21.hidewheninmenu = 0;
    var_21.archived = 0;
    var_21 setpulsefx( 100, var_15, 1000 );
    var_22 = undefined;

    if ( isdefined( self.matchbonus ) )
    {
        var_22 = maps\mp\gametypes\_hud_util::createfontstring( var_14, var_6 );
        var_22 maps\mp\gametypes\_hud_util::setparent( var_17 );
        var_22 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_9 + var_13 + var_20.height );
        var_22.glowalpha = 1;
        var_22.foreground = 1;
        var_22.hidewheninmenu = 0;
        var_22.color = ( 1.0, 1.0, 0.5 );
        var_22.archived = 0;
        var_22.label = game["strings"]["match_bonus"];
        var_22 setvalue( self.matchbonus );
    }

    thread resetteamoutcomenotify( var_16, var_17, var_18, var_19, var_20, var_21, var_22 );
}

outcomenotify( var_0, var_1 )
{
    self endon( "disconnect" );
    self notify( "reset_outcome" );

    while ( isdoingsplash() )
        wait 0.05;

    self endon( "reset_outcome" );

    if ( level.splitscreen || self issplitscreenplayer() )
    {
        var_2 = 2.0;
        var_3 = 1.5;
        var_4 = 1.5;
        var_5 = 30;
        var_6 = 2;
        var_7 = "default";
    }
    else
    {
        var_2 = 3.0;
        var_3 = 2.0;
        var_4 = 1.5;
        var_5 = 30;
        var_6 = 20;
        var_7 = "objective";
    }

    var_8 = 60000;
    var_9 = level.placement["all"];
    var_10 = var_9[0];
    var_11 = var_9[1];
    var_12 = var_9[2];
    var_13 = maps\mp\gametypes\_hud_util::createfontstring( var_7, var_2 );
    var_13 maps\mp\gametypes\_hud_util::setpoint( "TOP", undefined, 0, var_6 );
    var_14 = 0;

    if ( isdefined( var_10 ) && self.score == var_10.score && self.deaths == var_10.deaths )
    {
        if ( self != var_10 )
            var_14 = 1;
        else if ( isdefined( var_11 ) && var_11.score == var_10.score && var_11.deaths == var_10.deaths )
            var_14 = 1;
    }

    if ( var_14 )
    {
        var_13 settext( game["strings"]["tie"] );
        var_13.glowcolor = ( 0.2, 0.3, 0.7 );
    }
    else if ( isdefined( var_10 ) && self == var_10 )
    {
        var_13 settext( game["strings"]["victory"] );
        var_13.glowcolor = ( 0.2, 0.3, 0.7 );
    }
    else
    {
        var_13 settext( game["strings"]["defeat"] );
        var_13.glowcolor = ( 0.7, 0.3, 0.2 );
    }

    var_13.glowalpha = 1;
    var_13.foreground = 1;
    var_13.hidewheninmenu = 0;
    var_13.archived = 0;
    var_13 setpulsefx( 100, var_8, 1000 );
    var_15 = maps\mp\gametypes\_hud_util::createfontstring( var_7, 2.0 );
    var_15 maps\mp\gametypes\_hud_util::setparent( var_13 );
    var_15 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, 0 );
    var_15.glowalpha = 1;
    var_15.foreground = 1;
    var_15.hidewheninmenu = 0;
    var_15.archived = 0;
    var_15.glowcolor = ( 0.2, 0.3, 0.7 );
    var_15 settext( var_1 );
    var_16 = maps\mp\gametypes\_hud_util::createfontstring( var_7, var_3 );
    var_16 maps\mp\gametypes\_hud_util::setparent( var_15 );
    var_16 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_6 );
    var_16.glowcolor = ( 0.3, 0.7, 0.2 );
    var_16.glowalpha = 1;
    var_16.foreground = 1;
    var_16.hidewheninmenu = 0;
    var_16.archived = 0;

    if ( isdefined( var_10 ) )
    {
        var_16.label = &"MP_FIRSTPLACE_NAME";
        var_16 setplayernamestring( var_10 );
        var_16 setpulsefx( 100, var_8, 1000 );
    }

    var_17 = maps\mp\gametypes\_hud_util::createfontstring( var_7, var_4 );
    var_17 maps\mp\gametypes\_hud_util::setparent( var_16 );
    var_17 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_6 );
    var_17.glowcolor = ( 0.2, 0.3, 0.7 );
    var_17.glowalpha = 1;
    var_17.foreground = 1;
    var_17.hidewheninmenu = 0;
    var_17.archived = 0;

    if ( isdefined( var_11 ) )
    {
        var_17.label = &"MP_SECONDPLACE_NAME";
        var_17 setplayernamestring( var_11 );
        var_17 setpulsefx( 100, var_8, 1000 );
    }

    var_18 = maps\mp\gametypes\_hud_util::createfontstring( var_7, var_4 );
    var_18 maps\mp\gametypes\_hud_util::setparent( var_17 );
    var_18 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_6 );
    var_18 maps\mp\gametypes\_hud_util::setparent( var_17 );
    var_18.glowcolor = ( 0.2, 0.3, 0.7 );
    var_18.glowalpha = 1;
    var_18.foreground = 1;
    var_18.hidewheninmenu = 0;
    var_18.archived = 0;

    if ( isdefined( var_12 ) )
    {
        var_18.label = &"MP_THIRDPLACE_NAME";
        var_18 setplayernamestring( var_12 );
        var_18 setpulsefx( 100, var_8, 1000 );
    }

    var_19 = maps\mp\gametypes\_hud_util::createfontstring( var_7, 2.0 );
    var_19 maps\mp\gametypes\_hud_util::setparent( var_18 );
    var_19 maps\mp\gametypes\_hud_util::setpoint( "TOP", "BOTTOM", 0, var_6 );
    var_19.glowalpha = 1;
    var_19.foreground = 1;
    var_19.hidewheninmenu = 0;
    var_19.archived = 0;

    if ( isdefined( self.matchbonus ) )
    {
        var_19.label = game["strings"]["match_bonus"];
        var_19 setvalue( self.matchbonus );
    }

    thread updateoutcome( var_16, var_17, var_18 );
    thread resetoutcomenotify( var_13, var_15, var_16, var_17, var_18, var_19 );
}

resetoutcomenotify( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );
    self waittill( "reset_outcome" );

    if ( isdefined( var_0 ) )
        var_0 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_1 ) )
        var_1 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_2 ) )
        var_2 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_3 ) )
        var_3 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_4 ) )
        var_4 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_5 ) )
        var_5 maps\mp\gametypes\_hud_util::destroyelem();
}

resetteamoutcomenotify( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "disconnect" );
    self waittill( "reset_outcome" );

    if ( isdefined( var_0 ) )
        var_0 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_1 ) )
        var_1 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_2 ) )
        var_2 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_3 ) )
        var_3 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_4 ) )
        var_4 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_5 ) )
        var_5 maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( var_6 ) )
        var_6 maps\mp\gametypes\_hud_util::destroyelem();
}

updateoutcome( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "reset_outcome" );

    for (;;)
    {
        self waittill( "update_outcome" );
        var_3 = level.placement["all"];
        var_4 = var_3[0];
        var_5 = var_3[1];
        var_6 = var_3[2];

        if ( isdefined( var_0 ) && isdefined( var_4 ) )
            var_0 setplayernamestring( var_4 );
        else if ( isdefined( var_0 ) )
            var_0.alpha = 0;

        if ( isdefined( var_1 ) && isdefined( var_5 ) )
            var_1 setplayernamestring( var_5 );
        else if ( isdefined( var_1 ) )
            var_1.alpha = 0;

        if ( isdefined( var_2 ) && isdefined( var_6 ) )
        {
            var_2 setplayernamestring( var_6 );
            continue;
        }

        if ( isdefined( var_2 ) )
            var_2.alpha = 0;
    }
}

canshowsplash( var_0 )
{

}
