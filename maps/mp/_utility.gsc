// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

exploder_sound()
{
    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    self playsound( level.scr_sound[self.script_sound] );
}

_beginlocationselection( var_0, var_1, var_2, var_3 )
{
    self setclientdvar( "ui_selecting_location", "1" );
    self beginlocationselection( var_1, var_2, var_3 );
    self.selectinglocation = 1;
    self setblurforplayer( 10.3, 0.3 );
    thread endselectiononaction( "cancel_location" );
    thread endselectiononaction( "death" );
    thread endselectiononaction( "disconnect" );
    thread endselectiononaction( "used" );
    self endon( "stop_location_selection" );
    thread endselectiononendgame();
    thread endselectiononemp();

    if ( isdefined( var_0 ) && self.team != "spectator" )
    {
        if ( isdefined( self.streakmsg ) )
            self.streakmsg destroy();

        if ( self issplitscreenplayer() )
        {
            self.streakmsg = maps\mp\gametypes\_hud_util::createfontstring( "hudbig", 0.65 );
            self.streakmsg maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, -98 );
        }
        else
        {
            self.streakmsg = maps\mp\gametypes\_hud_util::createfontstring( "bigfixed", 0.8 );
            self.streakmsg maps\mp\gametypes\_hud_util::setpoint( "CENTER", "CENTER", 0, -190 );
        }

        var_4 = tablelookupistring( "mp/killstreakTable.csv", 1, var_0, 2 );
        self.streakmsg settext( var_4 );
    }
}

stoplocationselection( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( !var_0 )
    {
        self setblurforplayer( 0, 0.3 );
        self endlocationselection();
        self.selectinglocation = undefined;

        if ( isdefined( self.streakmsg ) )
            self.streakmsg destroy();
    }

    self notify( "stop_location_selection", var_1 );
}

endselectiononemp()
{
    self endon( "stop_location_selection" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !isemped() )
            continue;

        thread stoplocationselection( 0, "emp" );
        return;
    }
}

endselectiononaction( var_0 )
{
    self endon( "stop_location_selection" );
    self waittill( var_0 );
    thread stoplocationselection( var_0 == "disconnect", var_0 );
}

endselectiononendgame()
{
    self endon( "stop_location_selection" );
    level waittill( "game_ended" );
    thread stoplocationselection( 0, "end_game" );
}

isattachment( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 4, var_0, 0 );

    if ( isdefined( var_1 ) && var_1 != "" )
        return 1;
    else
        return 0;
}

getattachmenttype( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 4, var_0, 2 );
    return var_1;
}

delaythread( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    thread delaythread_proc( var_1, var_0, var_2, var_3, var_4, var_5, var_6 );
}

delaythread_proc( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    wait(var_1);

    if ( !isdefined( var_2 ) )
        thread [[ var_0 ]]();
    else if ( !isdefined( var_3 ) )
        thread [[ var_0 ]]( var_2 );
    else if ( !isdefined( var_4 ) )
        thread [[ var_0 ]]( var_2, var_3 );
    else if ( !isdefined( var_5 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( !isdefined( var_6 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
}

getplant()
{
    var_0 = self.origin + ( 0.0, 0.0, 10.0 );
    var_1 = 11;
    var_2 = anglestoforward( self.angles );
    var_2 *= var_1;
    var_3[0] = var_0 + var_2;
    var_3[1] = var_0;
    var_4 = bullettrace( var_3[0], var_3[0] + ( 0.0, 0.0, -18.0 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4["position"];
        var_5.angles = orienttonormal( var_4["normal"] );
        return var_5;
    }

    var_4 = bullettrace( var_3[1], var_3[1] + ( 0.0, 0.0, -18.0 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4["position"];
        var_5.angles = orienttonormal( var_4["normal"] );
        return var_5;
    }

    var_3[2] = var_0 + ( 16.0, 16.0, 0.0 );
    var_3[3] = var_0 + ( 16.0, -16.0, 0.0 );
    var_3[4] = var_0 + ( -16.0, -16.0, 0.0 );
    var_3[5] = var_0 + ( -16.0, 16.0, 0.0 );
    var_6 = undefined;
    var_7 = undefined;

    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
    {
        var_4 = bullettrace( var_3[var_8], var_3[var_8] + ( 0.0, 0.0, -1000.0 ), 0, undefined );

        if ( !isdefined( var_6 ) || var_4["fraction"] < var_6 )
        {
            var_6 = var_4["fraction"];
            var_7 = var_4["position"];
        }
    }

    if ( var_6 == 1 )
        var_7 = self.origin;

    var_5 = spawnstruct();
    var_5.origin = var_7;
    var_5.angles = orienttonormal( var_4["normal"] );
    return var_5;
}

orienttonormal( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    var_2 = length( var_1 );

    if ( !var_2 )
        return ( 0.0, 0.0, 0.0 );

    var_3 = vectornormalize( var_1 );
    var_4 = var_0[2] * -1;
    var_5 = ( var_3[0] * var_4, var_3[1] * var_4, var_2 );
    var_6 = vectortoangles( var_5 );
    return var_6;
}

deleteplacedentity( var_0 )
{
    var_1 = getentarray( var_0, "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

playsoundonplayers( var_0, var_1, var_2 )
{
    if ( level.splitscreen )
    {
        if ( isdefined( level.players[0] ) )
            level.players[0] playlocalsound( var_0 );
    }
    else if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_2 ) )
        {
            for ( var_3 = 0; var_3 < level.players.size; var_3++ )
            {
                var_4 = level.players[var_3];

                if ( var_4 issplitscreenplayer() && !var_4 issplitscreenplayerprimary() )
                    continue;

                if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 && !isexcluded( var_4, var_2 ) )
                    var_4 playlocalsound( var_0 );
            }

            return;
        }

        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            var_4 = level.players[var_3];

            if ( var_4 issplitscreenplayer() && !var_4 issplitscreenplayerprimary() )
                continue;

            if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
                var_4 playlocalsound( var_0 );
        }

        return;
    }
    else if ( isdefined( var_2 ) )
    {
        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            if ( level.players[var_3] issplitscreenplayer() && !level.players[var_3] issplitscreenplayerprimary() )
                continue;

            if ( !isexcluded( level.players[var_3], var_2 ) )
                level.players[var_3] playlocalsound( var_0 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            if ( level.players[var_3] issplitscreenplayer() && !level.players[var_3] issplitscreenplayerprimary() )
                continue;

            level.players[var_3] playlocalsound( var_0 );
        }
    }
}

sortlowermessages()
{
    for ( var_0 = 1; var_0 < self.lowermessages.size; var_0++ )
    {
        var_1 = self.lowermessages[var_0];
        var_2 = var_1.priority;

        for ( var_3 = var_0 - 1; var_3 >= 0 && var_2 > self.lowermessages[var_3].priority; var_3-- )
            self.lowermessages[var_3 + 1] = self.lowermessages[var_3];

        self.lowermessages[var_3 + 1] = var_1;
    }
}

addlowermessage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = undefined;

    foreach ( var_11 in self.lowermessages )
    {
        if ( var_11.name == var_0 )
        {
            if ( var_11.text == var_1 && var_11.priority == var_3 )
                return;

            var_9 = var_11;
            break;
        }
    }

    if ( !isdefined( var_9 ) )
    {
        var_9 = spawnstruct();
        self.lowermessages[self.lowermessages.size] = var_9;
    }

    var_9.name = var_0;
    var_9.text = var_1;
    var_9.time = var_2;
    var_9.addtime = gettime();
    var_9.priority = var_3;
    var_9.showtimer = var_4;
    var_9.shouldfade = var_5;
    var_9.fadetoalpha = var_6;
    var_9.fadetoalphatime = var_7;
    var_9.hidewhenindemo = var_8;
    sortlowermessages();
}

removelowermessage( var_0 )
{
    if ( isdefined( self.lowermessages ) )
    {
        for ( var_1 = self.lowermessages.size; var_1 > 0; var_1-- )
        {
            if ( self.lowermessages[var_1 - 1].name != var_0 )
                continue;

            var_2 = self.lowermessages[var_1 - 1];

            for ( var_3 = var_1; var_3 < self.lowermessages.size; var_3++ )
            {
                if ( isdefined( self.lowermessages[var_3] ) )
                    self.lowermessages[var_3 - 1] = self.lowermessages[var_3];
            }

            self.lowermessages[self.lowermessages.size - 1] = undefined;
        }

        sortlowermessages();
    }
}

getlowermessage()
{
    return self.lowermessages[0];
}

setlowermessage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0.85;

    if ( !isdefined( var_7 ) )
        var_7 = 3.0;

    if ( !isdefined( var_8 ) )
        var_8 = 0;

    addlowermessage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    updatelowermessage();
}

updatelowermessage()
{
    var_0 = getlowermessage();

    if ( !isdefined( var_0 ) )
    {
        self.lowermessage.alpha = 0;
        self.lowertimer.alpha = 0;
    }
    else
    {
        self.lowermessage settext( var_0.text );
        self.lowermessage.alpha = 0.85;
        self.lowertimer.alpha = 1;
        self.lowermessage.hidewhenindemo = var_0.hidewhenindemo;

        if ( var_0.shouldfade )
        {
            self.lowermessage fadeovertime( min( var_0.fadetoalphatime, 60 ) );
            self.lowermessage.alpha = var_0.fadetoalpha;
        }

        if ( var_0.time > 0 && var_0.showtimer )
            self.lowertimer settimer( max( var_0.time - ( gettime() - var_0.addtime ) / 1000, 0.1 ) );
        else
        {
            if ( var_0.time > 0 && !var_0.showtimer )
            {
                self.lowertimer settext( "" );
                self.lowermessage fadeovertime( min( var_0.time, 60 ) );
                self.lowermessage.alpha = 0;
                thread clearondeath( var_0 );
                thread clearafterfade( var_0 );
                return;
            }

            self.lowertimer settext( "" );
        }
    }
}

clearondeath( var_0 )
{
    self notify( "message_cleared" );
    self endon( "message_cleared" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    clearlowermessage( var_0.name );
}

clearafterfade( var_0 )
{
    wait(var_0.time);
    clearlowermessage( var_0.name );
    self notify( "message_cleared" );
}

clearlowermessage( var_0 )
{
    removelowermessage( var_0 );
    updatelowermessage();
}

clearlowermessages()
{
    for ( var_0 = 0; var_0 < self.lowermessages.size; var_0++ )
        self.lowermessages[var_0] = undefined;

    if ( !isdefined( self.lowermessage ) )
        return;

    updatelowermessage();
}

printonteam( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_3.team != var_1 )
            continue;

        var_3 iprintln( var_0 );
    }
}

printboldonteam( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];

        if ( isdefined( var_3.pers["team"] ) && var_3.pers["team"] == var_1 )
            var_3 iprintlnbold( var_0 );
    }
}

printboldonteamarg( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
            var_4 iprintlnbold( var_0, var_2 );
    }
}

printonteamarg( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
            var_4 iprintln( var_0, var_2 );
    }
}

printonplayers( var_0, var_1 )
{
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == var_1 )
                var_2[var_3] iprintln( var_0 );

            continue;
        }

        var_2[var_3] iprintln( var_0 );
    }
}

printandsoundoneveryone( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = isdefined( var_4 );
    var_8 = 0;

    if ( isdefined( var_5 ) )
        var_8 = 1;

    if ( level.splitscreen || !var_7 )
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.pers["team"];

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 && isdefined( var_2 ) )
                {
                    var_10 iprintln( var_2, var_6 );
                    continue;
                }

                if ( var_11 == var_1 && isdefined( var_3 ) )
                    var_10 iprintln( var_3, var_6 );
            }
        }

        if ( var_7 )
            level.players[0] playlocalsound( var_4 );
    }
    else if ( var_8 )
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.pers["team"];

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 iprintln( var_2, var_6 );

                    var_10 playlocalsound( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 iprintln( var_3, var_6 );

                    var_10 playlocalsound( var_5 );
                }
            }
        }
    }
    else
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.pers["team"];

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 iprintln( var_2, var_6 );

                    var_10 playlocalsound( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 iprintln( var_3, var_6 );
                }
            }
        }
    }
}

printandsoundonteam( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( var_4.team != var_0 )
            continue;

        var_4 printandsoundonplayer( var_1, var_2 );
    }
}

printandsoundonplayer( var_0, var_1 )
{
    self iprintln( var_0 );
    self playlocalsound( var_1 );
}

_playlocalsound( var_0 )
{
    if ( level.splitscreen && self getentitynumber() != 0 )
        return;

    self playlocalsound( var_0 );
}

dvarintvalue( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarint( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

dvarfloatvalue( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarfloat( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

play_sound_on_tag( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        playsoundatpos( self gettagorigin( var_1 ), var_0 );
    else
        playsoundatpos( self.origin, var_0 );
}

getotherteam( var_0 )
{
    if ( var_0 == "allies" )
        return "axis";
    else if ( var_0 == "axis" )
        return "allies";
}

wait_endon( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    wait(var_0);
}

initpersstat( var_0 )
{
    if ( !isdefined( self.pers[var_0] ) )
        self.pers[var_0] = 0;
}

getpersstat( var_0 )
{
    return self.pers[var_0];
}

incpersstat( var_0, var_1 )
{
    self.pers[var_0] += var_1;
    maps\mp\gametypes\_persistence::statadd( var_0, var_1 );
}

setpersstat( var_0, var_1 )
{
    self.pers[var_0] = var_1;
}

initplayerstat( var_0, var_1 )
{
    if ( !isdefined( self.stats["stats_" + var_0] ) )
    {
        if ( !isdefined( var_1 ) )
            var_1 = 0;

        self.stats["stats_" + var_0] = spawnstruct();
        self.stats["stats_" + var_0].value = var_1;
    }
}

incplayerstat( var_0, var_1 )
{
    var_2 = self.stats["stats_" + var_0];
    var_2.value += var_1;
}

setplayerstat( var_0, var_1 )
{
    var_2 = self.stats["stats_" + var_0];
    var_2.value = var_1;
    var_2.time = gettime();
}

getplayerstat( var_0 )
{
    return self.stats["stats_" + var_0].value;
}

getplayerstattime( var_0 )
{
    return self.stats["stats_" + var_0].time;
}

setplayerstatifgreater( var_0, var_1 )
{
    var_2 = getplayerstat( var_0 );

    if ( var_1 > var_2 )
        setplayerstat( var_0, var_1 );
}

setplayerstatiflower( var_0, var_1 )
{
    var_2 = getplayerstat( var_0 );

    if ( var_1 < var_2 )
        setplayerstat( var_0, var_1 );
}

updatepersratio( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_persistence::statget( var_1 );
    var_4 = maps\mp\gametypes\_persistence::statget( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    maps\mp\gametypes\_persistence::statset( var_0, int( var_3 * 1000 / var_4 ) );
}

updatepersratiobuffered( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_persistence::statgetbuffered( var_1 );
    var_4 = maps\mp\gametypes\_persistence::statgetbuffered( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    maps\mp\gametypes\_persistence::statsetbuffered( var_0, int( var_3 * 1000 / var_4 ) );
}

waittillslowprocessallowed( var_0 )
{
    if ( level.lastslowprocessframe == gettime() )
    {
        if ( isdefined( var_0 ) && var_0 )
        {
            while ( level.lastslowprocessframe == gettime() )
                wait 0.05;
        }
        else
        {
            wait 0.05;

            if ( level.lastslowprocessframe == gettime() )
            {
                wait 0.05;

                if ( level.lastslowprocessframe == gettime() )
                {
                    wait 0.05;

                    if ( level.lastslowprocessframe == gettime() )
                        wait 0.05;
                }
            }
        }
    }

    level.lastslowprocessframe = gettime();
}

waitfortimeornotify( var_0, var_1 )
{
    self endon( var_1 );
    wait(var_0);
}

isexcluded( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

leaderdialog( var_0, var_1, var_2, var_3 )
{
    if ( level.splitscreen )
        return;

    if ( var_0 == "null" )
        return;

    if ( !isdefined( var_1 ) )
        leaderdialogbothteams( var_0, "allies", var_0, "axis", var_2, var_3 );
    else
    {
        if ( level.splitscreen )
        {
            if ( level.players.size )
                level.players[0] leaderdialogonplayer( var_0, var_2 );

            return;
        }

        if ( isdefined( var_3 ) )
        {
            for ( var_4 = 0; var_4 < level.players.size; var_4++ )
            {
                var_5 = level.players[var_4];

                if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == var_1 && !isexcluded( var_5, var_3 ) )
                {
                    if ( var_5 issplitscreenplayer() && !var_5 issplitscreenplayerprimary() )
                        continue;

                    var_5 leaderdialogonplayer( var_0, var_2 );
                }
            }

            return;
        }

        for ( var_4 = 0; var_4 < level.players.size; var_4++ )
        {
            var_5 = level.players[var_4];

            if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == var_1 )
            {
                if ( var_5 issplitscreenplayer() && !var_5 issplitscreenplayerprimary() )
                    continue;

                var_5 leaderdialogonplayer( var_0, var_2 );
            }
        }
    }
}

leaderdialogbothteams( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( level.splitscreen )
        return;

    if ( level.splitscreen )
    {
        if ( level.players.size )
            level.players[0] leaderdialogonplayer( var_0, var_4 );
    }
    else
    {
        if ( isdefined( var_5 ) )
        {
            for ( var_6 = 0; var_6 < level.players.size; var_6++ )
            {
                var_7 = level.players[var_6];
                var_8 = var_7.pers["team"];

                if ( !isdefined( var_8 ) )
                    continue;

                if ( isexcluded( var_7, var_5 ) )
                    continue;

                if ( var_7 issplitscreenplayer() && !var_7 issplitscreenplayerprimary() )
                    continue;

                if ( var_8 == var_1 )
                {
                    var_7 leaderdialogonplayer( var_0, var_4 );
                    continue;
                }

                if ( var_8 == var_3 )
                    var_7 leaderdialogonplayer( var_2, var_4 );
            }

            return;
        }

        for ( var_6 = 0; var_6 < level.players.size; var_6++ )
        {
            var_7 = level.players[var_6];
            var_8 = var_7.pers["team"];

            if ( !isdefined( var_8 ) )
                continue;

            if ( var_7 issplitscreenplayer() && !var_7 issplitscreenplayerprimary() )
                continue;

            if ( var_8 == var_1 )
            {
                var_7 leaderdialogonplayer( var_0, var_4 );
                continue;
            }

            if ( var_8 == var_3 )
                var_7 leaderdialogonplayer( var_2, var_4 );
        }
    }
}

leaderdialogonplayers( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_1 )
        var_4 leaderdialogonplayer( var_0, var_2 );
}

leaderdialogonplayer( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = self.pers["team"];

    if ( level.splitscreen )
        return;

    if ( !isdefined( var_3 ) )
        return;

    if ( var_3 != "allies" && var_3 != "axis" )
        return;

    if ( isdefined( var_1 ) )
    {
        if ( self.leaderdialoggroup == var_1 )
        {
            if ( var_2 )
            {
                self stoplocalsound( self.leaderdialogactive );
                thread playleaderdialogonplayer( var_0, var_3 );
            }

            return;
        }

        var_4 = isdefined( self.leaderdialoggroups[var_1] );
        self.leaderdialoggroups[var_1] = var_0;
        var_0 = var_1;

        if ( var_4 )
            return;
    }

    if ( self.leaderdialogactive == "" )
        thread playleaderdialogonplayer( var_0, var_3 );
    else
        self.leaderdialogqueue[self.leaderdialogqueue.size] = var_0;
}

playleaderdialogonplayer( var_0, var_1 )
{
    self endon( "disconnect" );
    self notify( "playLeaderDialogOnPlayer" );
    self endon( "playLeaderDialogOnPlayer" );

    if ( isdefined( self.leaderdialoggroups[var_0] ) )
    {
        var_2 = var_0;
        var_0 = self.leaderdialoggroups[var_2];
        self.leaderdialoggroups[var_2] = undefined;
        self.leaderdialoggroup = var_2;
    }

    if ( issubstr( game["dialog"][var_0], "null" ) )
        return;

    self.leaderdialogactive = game["voice"][var_1] + game["dialog"][var_0];
    self playlocalsound( game["voice"][var_1] + game["dialog"][var_0] );
    wait 3.0;
    self.leaderdialoglocalsound = "";
    self.leaderdialogactive = "";
    self.leaderdialoggroup = "";

    if ( self.leaderdialogqueue.size > 0 )
    {
        var_3 = self.leaderdialogqueue[0];

        for ( var_4 = 1; var_4 < self.leaderdialogqueue.size; var_4++ )
            self.leaderdialogqueue[var_4 - 1] = self.leaderdialogqueue[var_4];

        self.leaderdialogqueue[var_4 - 1] = undefined;
        thread playleaderdialogonplayer( var_3, var_1 );
    }
}

updatemainmenu()
{
    if ( self.pers["team"] == "spectator" )
        self setclientdvar( "g_scriptMainMenu", game["menu_team"] );
    else
        self setclientdvar( "g_scriptMainMenu", game["menu_class_" + self.pers["team"]] );
}

updateobjectivetext()
{
    if ( self.pers["team"] == "spectator" )
        self setclientdvar( "cg_objectiveText", "" );
    else
    {
        if ( getwatcheddvar( "scorelimit" ) > 0 && !isobjectivebased() )
        {
            if ( level.splitscreen )
            {
                self setclientdvar( "cg_objectiveText", getobjectivescoretext( self.pers["team"] ) );
                return;
            }

            self setclientdvar( "cg_objectiveText", getobjectivescoretext( self.pers["team"] ), getwatcheddvar( "scorelimit" ) );
            return;
            return;
        }

        self setclientdvar( "cg_objectiveText", getobjectivetext( self.pers["team"] ) );
    }
}

setobjectivetext( var_0, var_1 )
{
    game["strings"]["objective_" + var_0] = var_1;
    precachestring( var_1 );
}

setobjectivescoretext( var_0, var_1 )
{
    game["strings"]["objective_score_" + var_0] = var_1;
    precachestring( var_1 );
}

setobjectivehinttext( var_0, var_1 )
{
    game["strings"]["objective_hint_" + var_0] = var_1;
    precachestring( var_1 );
}

getobjectivetext( var_0 )
{
    return game["strings"]["objective_" + var_0];
}

getobjectivescoretext( var_0 )
{
    return game["strings"]["objective_score_" + var_0];
}

getobjectivehinttext( var_0 )
{
    return game["strings"]["objective_hint_" + var_0];
}

gettimepassed()
{
    if ( !isdefined( level.starttime ) || !isdefined( level.discardtime ) )
        return 0;

    if ( level.timerstopped )
        return level.timerpausetime - level.starttime - level.discardtime;
    else
        return gettime() - level.starttime - level.discardtime;
}

getsecondspassed()
{
    return gettimepassed() / 1000;
}

getminutespassed()
{
    return getsecondspassed() / 60;
}

clearkillcamstate()
{
    self.forcespectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
}

isinkillcam()
{
    return self.forcespectatorclient != -1 || self.killcamentity != -1;
}

isvalidclass( var_0 )
{
    return isdefined( var_0 ) && var_0 != "";
}

getvalueinrange( var_0, var_1, var_2 )
{
    if ( var_0 > var_2 )
        return var_2;
    else if ( var_0 < var_1 )
        return var_1;
    else
        return var_0;
}

waitfortimeornotifies( var_0 )
{
    var_1 = gettime();
    var_2 = ( gettime() - var_1 ) / 1000;

    if ( var_2 < var_0 )
    {
        wait(var_0 - var_2);
        return var_0;
    }
    else
        return var_2;
}

closemenus()
{
    self closepopupmenu();
    self closeingamemenu();
}

logxpgains()
{
    if ( !isdefined( self.xpgains ) )
        return;

    var_0 = getarraykeys( self.xpgains );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = self.xpgains[var_0[var_1]];

        if ( !var_2 )
            continue;

        self logstring( "xp " + var_0[var_1] + ": " + var_2 );
    }
}

registerroundswitchdvar( var_0, var_1, var_2, var_3 )
{
    registerwatchdvarint( "roundswitch", var_1 );
    var_0 = "scr_" + var_0 + "_roundswitch";
    level.roundswitchdvar = var_0;
    level.roundswitchmin = var_2;
    level.roundswitchmax = var_3;
    level.roundswitch = getdvarint( var_0, var_1 );

    if ( level.roundswitch < var_2 )
        level.roundswitch = var_2;
    else if ( level.roundswitch > var_3 )
        level.roundswitch = var_3;
}

registerroundlimitdvar( var_0, var_1 )
{
    registerwatchdvarint( "roundlimit", var_1 );
}

registerwinlimitdvar( var_0, var_1 )
{
    registerwatchdvarint( "winlimit", var_1 );
}

registerscorelimitdvar( var_0, var_1 )
{
    registerwatchdvarint( "scorelimit", var_1 );
}

registertimelimitdvar( var_0, var_1 )
{
    registerwatchdvarfloat( "timelimit", var_1 );
    makedvarserverinfo( "ui_timelimit", gettimelimit() );
}

registerhalftimedvar( var_0, var_1 )
{
    registerwatchdvarint( "halftime", var_1 );
    makedvarserverinfo( "ui_halftime", gethalftime() );
}

registernumlivesdvar( var_0, var_1 )
{
    registerwatchdvarint( "numlives", var_1 );
}

setovertimelimitdvar( var_0 )
{
    makedvarserverinfo( "overtimeTimeLimit", var_0 );
}

get_damageable_player( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.isplayer = 1;
    var_2.isadestructable = 0;
    var_2.entity = var_0;
    var_2.damagecenter = var_1;
    return var_2;
}

get_damageable_sentry( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.isplayer = 0;
    var_2.isadestructable = 0;
    var_2.issentry = 1;
    var_2.entity = var_0;
    var_2.damagecenter = var_1;
    return var_2;
}

get_damageable_grenade( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.isplayer = 0;
    var_2.isadestructable = 0;
    var_2.entity = var_0;
    var_2.damagecenter = var_1;
    return var_2;
}

get_damageable_mine( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.isplayer = 0;
    var_2.isadestructable = 0;
    var_2.entity = var_0;
    var_2.damagecenter = var_1;
    return var_2;
}

get_damageable_player_pos( var_0 )
{
    return var_0.origin + ( 0.0, 0.0, 32.0 );
}

getstancecenter()
{
    if ( self getstance() == "crouch" )
        var_0 = self.origin + ( 0.0, 0.0, 24.0 );
    else if ( self getstance() == "prone" )
        var_0 = self.origin + ( 0.0, 0.0, 10.0 );
    else
        var_0 = self.origin + ( 0.0, 0.0, 32.0 );

    return var_0;
}

get_damageable_grenade_pos( var_0 )
{
    return var_0.origin;
}

getdvarvec( var_0 )
{
    var_1 = getdvar( var_0 );

    if ( var_1 == "" )
        return ( 0.0, 0.0, 0.0 );

    var_2 = strtok( var_1, " " );

    if ( var_2.size < 3 )
        return ( 0.0, 0.0, 0.0 );

    setdvar( "tempR", var_2[0] );
    setdvar( "tempG", var_2[1] );
    setdvar( "tempB", var_2[2] );
    return ( getdvarfloat( "tempR" ), getdvarfloat( "tempG" ), getdvarfloat( "tempB" ) );
}

strip_suffix( var_0, var_1 )
{
    if ( var_0.size <= var_1.size )
        return var_0;

    if ( getsubstr( var_0, var_0.size - var_1.size, var_0.size ) == var_1 )
        return getsubstr( var_0, 0, var_0.size - var_1.size );

    return var_0;
}

_takeweaponsexcept( var_0 )
{
    var_1 = self getweaponslistall();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            continue;
        else
            self takeweapon( var_3 );
    }
}

savedata()
{
    var_0 = spawnstruct();
    var_0.offhandclass = self getoffhandsecondaryclass();
    var_0.actionslots = self.saved_actionslotdata;
    var_0.currentweapon = self getcurrentweapon();
    var_1 = self getweaponslistall();
    var_0.weapons = [];

    foreach ( var_3 in var_1 )
    {
        if ( weaponinventorytype( var_3 ) == "exclusive" )
            continue;

        if ( weaponinventorytype( var_3 ) == "altmode" )
            continue;

        var_4 = spawnstruct();
        var_4.name = var_3;
        var_4.clipammor = self getweaponammoclip( var_3, "right" );
        var_4.clipammol = self getweaponammoclip( var_3, "left" );
        var_4.stockammo = self getweaponammostock( var_3 );

        if ( isdefined( self.throwinggrenade ) && self.throwinggrenade == var_3 )
            var_4.stockammo--;

        var_0.weapons[var_0.weapons.size] = var_4;
    }

    self.script_savedata = var_0;
}

restoredata()
{
    var_0 = self.script_savedata;
    self setoffhandsecondaryclass( var_0.offhandclass );

    foreach ( var_2 in var_0.weapons )
    {
        _giveweapon( var_2.name, int( tablelookup( "mp/camoTable.csv", 1, self.loadoutprimarycamo, 0 ) ) );
        self setweaponammoclip( var_2.name, var_2.clipammor, "right" );

        if ( issubstr( var_2.name, "akimbo" ) )
            self setweaponammoclip( var_2.name, var_2.clipammol, "left" );

        self setweaponammostock( var_2.name, var_2.stockammo );
    }

    foreach ( var_6, var_5 in var_0.actionslots )
        _setactionslot( var_6, var_5.type, var_5.item );

    if ( self getcurrentweapon() == "none" )
    {
        var_2 = var_0.currentweapon;

        if ( var_2 == "none" )
            var_2 = common_scripts\utility::getlastweapon();

        self setspawnweapon( var_2 );
        self switchtoweapon( var_2 );
    }
}

_setactionslot( var_0, var_1, var_2 )
{
    self.saved_actionslotdata[var_0].type = var_1;
    self.saved_actionslotdata[var_0].item = var_2;
    self setactionslot( var_0, var_1, var_2 );
}

isfloat( var_0 )
{
    if ( int( var_0 ) != var_0 )
        return 1;

    return 0;
}

registerwatchdvarint( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level.watchdvars[var_2] = spawnstruct();
    level.watchdvars[var_2].value = getdvarint( var_2, var_1 );
    level.watchdvars[var_2].type = "int";
    level.watchdvars[var_2].notifystring = "update_" + var_0;
}

registerwatchdvarfloat( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level.watchdvars[var_2] = spawnstruct();
    level.watchdvars[var_2].value = getdvarfloat( var_2, var_1 );
    level.watchdvars[var_2].type = "float";
    level.watchdvars[var_2].notifystring = "update_" + var_0;
}

registerwatchdvar( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level.watchdvars[var_2] = spawnstruct();
    level.watchdvars[var_2].value = getdvar( var_2, var_1 );
    level.watchdvars[var_2].type = "string";
    level.watchdvars[var_2].notifystring = "update_" + var_0;
}

setoverridewatchdvar( var_0, var_1 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;
    level.overridewatchdvars[var_0] = var_1;
}

getwatcheddvar( var_0 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( isdefined( level.overridewatchdvars ) && isdefined( level.overridewatchdvars[var_0] ) )
        return level.overridewatchdvars[var_0];

    return level.watchdvars[var_0].value;
}

updatewatcheddvars()
{
    while ( game["state"] == "playing" )
    {
        var_0 = getarraykeys( level.watchdvars );

        foreach ( var_2 in var_0 )
        {
            if ( level.watchdvars[var_2].type == "string" )
                var_3 = getproperty( var_2, level.watchdvars[var_2].value );
            else if ( level.watchdvars[var_2].type == "float" )
                var_3 = getfloatproperty( var_2, level.watchdvars[var_2].value );
            else
                var_3 = getintproperty( var_2, level.watchdvars[var_2].value );

            if ( var_3 != level.watchdvars[var_2].value )
            {
                level.watchdvars[var_2].value = var_3;
                level notify( level.watchdvars[var_2].notifystring, var_3 );
            }
        }

        wait 1.0;
    }
}

isroundbased()
{
    if ( !level.teambased )
        return 0;

    if ( getwatcheddvar( "winlimit" ) != 1 && getwatcheddvar( "roundlimit" ) != 1 )
        return 1;

    return 0;
}

islastround()
{
    if ( !level.teambased )
        return 1;

    if ( getwatcheddvar( "roundlimit" ) > 1 && game["roundsPlayed"] >= getwatcheddvar( "roundlimit" ) - 1 )
        return 1;

    if ( getwatcheddvar( "winlimit" ) > 1 && game["roundsWon"]["allies"] >= getwatcheddvar( "winlimit" ) - 1 && game["roundsWon"]["axis"] >= getwatcheddvar( "winlimit" ) - 1 )
        return 1;

    return 0;
}

wasonlyround()
{
    if ( !level.teambased )
        return 1;

    if ( isdefined( level.onlyroundoverride ) )
        return 0;

    if ( getwatcheddvar( "winlimit" ) == 1 && hitwinlimit() )
        return 1;

    if ( getwatcheddvar( "roundlimit" ) == 1 )
        return 1;

    return 0;
}

waslastround()
{
    if ( level.forcedend )
        return 1;

    if ( !level.teambased )
        return 1;

    if ( hitroundlimit() || hitwinlimit() )
        return 1;

    return 0;
}

hitroundlimit()
{
    if ( getwatcheddvar( "roundlimit" ) <= 0 )
        return 0;

    return game["roundsPlayed"] >= getwatcheddvar( "roundlimit" );
}

hitscorelimit()
{
    if ( isobjectivebased() )
        return 0;

    if ( getwatcheddvar( "scorelimit" ) <= 0 )
        return 0;

    if ( level.teambased )
    {
        if ( game["teamScores"]["allies"] >= getwatcheddvar( "scorelimit" ) || game["teamScores"]["axis"] >= getwatcheddvar( "scorelimit" ) )
            return 1;
    }
    else
    {
        for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        {
            var_1 = level.players[var_0];

            if ( isdefined( var_1.score ) && var_1.score >= getwatcheddvar( "scorelimit" ) )
                return 1;
        }
    }

    return 0;
}

hitwinlimit()
{
    if ( getwatcheddvar( "winlimit" ) <= 0 )
        return 0;

    if ( !level.teambased )
        return 1;

    if ( getroundswon( "allies" ) >= getwatcheddvar( "winlimit" ) || getroundswon( "axis" ) >= getwatcheddvar( "winlimit" ) )
        return 1;

    return 0;
}

getscorelimit()
{
    if ( isroundbased() )
    {
        if ( getwatcheddvar( "roundlimit" ) )
            return getwatcheddvar( "roundlimit" );
        else
            return getwatcheddvar( "winlimit" );
    }
    else
        return getwatcheddvar( "scorelimit" );
}

getroundswon( var_0 )
{
    return game["roundsWon"][var_0];
}

isobjectivebased()
{
    return level.objectivebased;
}

gettimelimit()
{
    if ( inovertime() && ( !isdefined( game["inNukeOvertime"] ) || !game["inNukeOvertime"] ) )
    {
        var_0 = int( getdvar( "overtimeTimeLimit" ) );

        if ( isdefined( var_0 ) )
        {
            return var_0;
            return;
        }

        return 1;
        return;
    }
    else if ( isdefined( level.dd ) && level.dd && isdefined( level.bombexploded ) && level.bombexploded > 0 )
        return getwatcheddvar( "timelimit" ) + level.bombexploded * level.ddtimetoadd;
    else
        return getwatcheddvar( "timelimit" );
}

gethalftime()
{
    if ( inovertime() )
        return 0;
    else if ( isdefined( game["inNukeOvertime"] ) && game["inNukeOvertime"] )
        return 0;
    else
        return getwatcheddvar( "halftime" );
}

inovertime()
{
    return isdefined( game["status"] ) && game["status"] == "overtime";
}

gamehasstarted()
{
    if ( level.teambased )
        return level.hasspawned["axis"] && level.hasspawned["allies"];
    else
        return level.maxplayercount > 1;
}

getaverageorigin( var_0 )
{
    var_1 = ( 0.0, 0.0, 0.0 );

    if ( !var_0.size )
        return undefined;

    foreach ( var_3 in var_0 )
        var_1 += var_3.origin;

    var_5 = int( var_1[0] / var_0.size );
    var_6 = int( var_1[1] / var_0.size );
    var_7 = int( var_1[2] / var_0.size );
    var_1 = ( var_5, var_6, var_7 );
    return var_1;
}

getlivingplayers( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( level.teambased && isdefined( var_0 ) )
        {
            if ( var_0 == var_3.pers["team"] )
                var_1[var_1.size] = var_3;

            continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

setusingremote( var_0 )
{
    if ( isdefined( self.carryicon ) )
        self.carryicon.alpha = 0;

    self.usingremote = var_0;
    common_scripts\utility::_disableoffhandweapons();
    self notify( "using_remote" );
}

getremotename()
{
    return self.usingremote;
}

freezecontrolswrapper( var_0 )
{
    if ( isdefined( level.hostmigrationtimer ) )
    {
        self freezecontrols( 1 );
        return;
    }

    self freezecontrols( var_0 );
}

clearusingremote()
{
    if ( isdefined( self.carryicon ) )
        self.carryicon.alpha = 1;

    self.usingremote = undefined;
    common_scripts\utility::_enableoffhandweapons();
    var_0 = self getcurrentweapon();

    if ( var_0 == "none" || iskillstreakweapon( var_0 ) )
        self switchtoweapon( common_scripts\utility::getlastweapon() );

    freezecontrolswrapper( 0 );
    self notify( "stopped_using_remote" );
}

isusingremote()
{
    return isdefined( self.usingremote );
}

queuecreate( var_0 )
{
    if ( !isdefined( level.queues ) )
        level.queues = [];

    level.queues[var_0] = [];
}

queueadd( var_0, var_1 )
{
    level.queues[var_0][level.queues[var_0].size] = var_1;
}

queueremovefirst( var_0 )
{
    var_1 = undefined;
    var_2 = [];

    foreach ( var_4 in level.queues[var_0] )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_4;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    level.queues[var_0] = var_2;
    return var_1;
}

_giveweapon( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = -1;

    if ( issubstr( var_0, "_akimbo" ) || isdefined( var_2 ) && var_2 == 1 )
        self giveweapon( var_0, var_1, 1 );
    else
        self giveweapon( var_0, var_1, 0 );
}

_hasperk( var_0 )
{
    if ( isdefined( self.perks[var_0] ) )
        return 1;

    return 0;
}

giveperk( var_0, var_1 )
{
    if ( issubstr( var_0, "_mp" ) )
    {
        switch ( var_0 )
        {
            case "frag_grenade_mp":
                self setoffhandprimaryclass( "frag" );
                break;
            case "throwingknife_mp":
                self setoffhandprimaryclass( "throwingknife" );
                break;
            case "trophy_mp":
                self setoffhandsecondaryclass( "flash" );
                break;
        }

        _giveweapon( var_0, 0 );
        self givestartammo( var_0 );
        _setperk( var_0, var_1 );
        return;
    }

    if ( issubstr( var_0, "specialty_weapon_" ) )
    {
        _setperk( var_0, var_1 );
        return;
    }

    _setperk( var_0, var_1 );
    _setextraperks( var_0 );
}

_setperk( var_0, var_1 )
{
    self.perks[var_0] = 1;

    if ( isdefined( level.perksetfuncs[var_0] ) )
        self thread [[ level.perksetfuncs[var_0] ]]();

    self setperk( var_0, !isdefined( level.scriptperks[var_0] ), var_1 );
}

_setextraperks( var_0 )
{
    if ( var_0 == "specialty_coldblooded" )
        giveperk( "specialty_heartbreaker", 0 );

    if ( var_0 == "specialty_fasterlockon" )
        giveperk( "specialty_armorpiercing", 0 );

    if ( var_0 == "specialty_spygame" )
        giveperk( "specialty_empimmune", 0 );

    if ( var_0 == "specialty_rollover" )
        giveperk( "specialty_assists", 0 );
}

_unsetperk( var_0 )
{
    self.perks[var_0] = undefined;

    if ( isdefined( level.perkunsetfuncs[var_0] ) )
        self thread [[ level.perkunsetfuncs[var_0] ]]();

    self unsetperk( var_0, !isdefined( level.scriptperks[var_0] ) );
}

_unsetextraperks( var_0 )
{
    if ( var_0 == "specialty_bulletaccuracy" )
        _unsetperk( "specialty_steadyaimpro" );

    if ( var_0 == "specialty_coldblooded" )
        _unsetperk( "specialty_heartbreaker" );

    if ( var_0 == "specialty_fasterlockon" )
        _unsetperk( "specialty_armorpiercing" );

    if ( var_0 == "specialty_spygame" )
        _unsetperk( "specialty_empimmune" );

    if ( var_0 == "specialty_rollover" )
        _unsetperk( "specialty_assists" );
}

_clearperks()
{
    foreach ( var_2, var_1 in self.perks )
    {
        if ( isdefined( level.perkunsetfuncs[var_2] ) )
            self [[ level.perkunsetfuncs[var_2] ]]();
    }

    self.perks = [];
    self clearperks();
}

quicksort( var_0 )
{
    return quicksortmid( var_0, 0, var_0.size - 1 );
}

quicksortmid( var_0, var_1, var_2 )
{
    var_3 = var_1;
    var_4 = var_2;

    if ( var_2 - var_1 >= 1 )
    {
        var_5 = var_0[var_1];

        while ( var_4 > var_3 )
        {
            while ( var_0[var_3] <= var_5 && var_3 <= var_2 && var_4 > var_3 )
                var_3++;

            while ( var_0[var_4] > var_5 && var_4 >= var_1 && var_4 >= var_3 )
                var_4--;

            if ( var_4 > var_3 )
                var_0 = swap( var_0, var_3, var_4 );
        }

        var_0 = swap( var_0, var_1, var_4 );
        var_0 = quicksortmid( var_0, var_1, var_4 - 1 );
        var_0 = quicksortmid( var_0, var_4 + 1, var_2 );
    }
    else
        return var_0;

    return var_0;
}

swap( var_0, var_1, var_2 )
{
    var_3 = var_0[var_1];
    var_0[var_1] = var_0[var_2];
    var_0[var_2] = var_3;
    return var_0;
}

_suicide()
{
    if ( isusingremote() && !isdefined( self.fauxdead ) )
        thread maps\mp\gametypes\_damage::playerkilled_internal( self, self, self, 10000, "MOD_SUICIDE", "frag_grenade_mp", ( 0.0, 0.0, 0.0 ), "none", 0, 1116, 1 );
    else if ( !isusingremote() && !isdefined( self.fauxdead ) )
        self suicide();
}

isreallyalive( var_0 )
{
    if ( isalive( var_0 ) && !isdefined( var_0.fauxdead ) )
        return 1;

    return 0;
}

playdeathsound()
{
    var_0 = randomintrange( 1, 8 );

    if ( self.team == "axis" )
        self playsound( "generic_death_russian_" + var_0 );
    else
        self playsound( "generic_death_american_" + var_0 );
}

rankingenabled()
{
    return level.rankedmatch && !self.usingonlinedataoffline;
}

privatematch()
{
    return level.onlinegame && getdvarint( "xblive_privatematch" );
}

matchmakinggame()
{
    return level.onlinegame && !getdvarint( "xblive_privatematch" );
}

setaltsceneobj( var_0, var_1, var_2, var_3 )
{

}

endsceneondeath( var_0 )
{
    self endon( "altscene" );
    var_0 waittill( "death" );
    self notify( "end_altScene" );
}

getgametypenumlives()
{
    return getwatcheddvar( "numlives" );
}

givecombathigh( var_0 )
{
    self.combathigh = var_0;
}

arrayinsertion( var_0, var_1, var_2 )
{
    if ( var_0.size != 0 )
    {
        for ( var_3 = var_0.size; var_3 >= var_2; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];
    }

    var_0[var_2] = var_1;
}

getproperty( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvar( var_0, var_1 );
    return var_2;
}

getintproperty( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarint( var_0, var_1 );
    return var_2;
}

getfloatproperty( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarfloat( var_0, var_1 );
    return var_2;
}

statusmenu( var_0 )
{
    self endon( "disconnect" );

    if ( !isdefined( self._statusmenu ) )
        self.statusmenu = 0;

    if ( self.statusmenu )
        return;

    self.statusmenu = 1;
    self openpopupmenu( "status_update" );
    wait(var_0);
    self closepopupmenu( "status_update" );
    wait 10.0;
    self.statusmenu = 0;
}

ischangingweapon()
{
    return isdefined( self.changingweapon );
}

killshouldaddtokillstreak( var_0 )
{
    if ( _hasperk( "specialty_explosivebullets" ) )
        return 0;

    if ( isdefined( self.isjuggernautrecon ) && self.isjuggernautrecon == 1 )
        return 0;

    if ( isdefined( level.killstreakchainingweapons[var_0] ) )
    {
        for ( var_1 = 1; var_1 < 4; var_1++ )
        {
            if ( isdefined( self.pers["killstreaks"][var_1] ) && isdefined( self.pers["killstreaks"][var_1].streakname ) && self.pers["killstreaks"][var_1].streakname == level.killstreakchainingweapons[var_0] && isdefined( self.pers["killstreaks"][var_1].lifeid ) && self.pers["killstreaks"][var_1].lifeid == self.pers["deaths"] )
                return streakshouldchain( level.killstreakchainingweapons[var_0] );
        }

        return 0;
    }

    return !iskillstreakweapon( var_0 );
}

streakshouldchain( var_0 )
{
    var_1 = maps\mp\killstreaks\_killstreaks::getstreakcost( var_0 );
    var_2 = maps\mp\killstreaks\_killstreaks::getnextstreakname();
    var_3 = maps\mp\killstreaks\_killstreaks::getstreakcost( var_2 );
    return var_1 < var_3;
}

isjuggernaut()
{
    if ( isdefined( self.isjuggernaut ) && self.isjuggernaut == 1 )
        return 1;

    if ( isdefined( self.isjuggernautdef ) && self.isjuggernautdef == 1 )
        return 1;

    if ( isdefined( self.isjuggernautgl ) && self.isjuggernautgl == 1 )
        return 1;

    if ( isdefined( self.isjuggernautrecon ) && self.isjuggernautrecon == 1 )
        return 1;

    return 0;
}

iskillstreakweapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    var_1 = strtok( var_0, "_" );
    var_2 = 0;

    if ( var_0 != "destructible_car" && var_0 != "barrel_mp" )
    {
        foreach ( var_4 in var_1 )
        {
            if ( var_4 == "mp" )
            {
                var_2 = 1;
                break;
            }
        }

        if ( !var_2 )
            var_0 += "_mp";
    }

    if ( issubstr( var_0, "destructible" ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 1;

    if ( maps\mp\killstreaks\_airdrop::isairdropmarker( var_0 ) )
        return 1;

    if ( isdefined( level.killstreakweildweapons[var_0] ) )
        return 1;

    if ( isdefined( weaponinventorytype( var_0 ) ) && weaponinventorytype( var_0 ) == "exclusive" && ( var_0 != "destructible_car" && var_0 != "barrel_mp" ) )
        return 1;

    return 0;
}

isenvironmentweapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "turret_minigun_mp" )
        return 1;

    if ( issubstr( var_0, "_bipod_" ) )
        return 1;

    return 0;
}

getweaponclass( var_0 )
{
    var_1 = strtok( var_0, "_" );

    if ( var_1[0] == "iw5" )
    {
        var_2 = var_1[0] + "_" + var_1[1];
        var_3 = tablelookup( "mp/statstable.csv", 4, var_2, 2 );
    }
    else if ( var_1[0] == "alt" )
    {
        var_2 = var_1[1] + "_" + var_1[2];
        var_3 = tablelookup( "mp/statstable.csv", 4, var_2, 2 );
    }
    else
        var_3 = tablelookup( "mp/statstable.csv", 4, var_1[0], 2 );

    if ( var_3 == "" )
    {
        var_4 = strip_suffix( var_0, "_mp" );
        var_3 = tablelookup( "mp/statstable.csv", 4, var_4, 2 );
    }

    if ( isenvironmentweapon( var_0 ) )
        var_3 = "weapon_mg";
    else if ( iskillstreakweapon( var_0 ) )
        var_3 = "killstreak";
    else if ( isdeathstreakweapon( var_0 ) )
        var_3 = "deathstreak";
    else if ( var_0 == "none" )
        var_3 = "other";
    else if ( var_3 == "" )
        var_3 = "other";

    return var_3;
}

isdeathstreakweapon( var_0 )
{
    if ( var_0 == "c4death_mp" || var_0 == "frag_grenade_short_mp" )
        return 1;
    else
        return 0;
}

getbaseweaponname( var_0 )
{
    var_1 = strtok( var_0, "_" );

    if ( var_1[0] == "iw5" )
        var_1[0] = var_1[0] + "_" + var_1[1];
    else if ( var_1[0] == "alt" )
        var_1[0] = var_1[1] + "_" + var_1[2];

    return var_1[0];
}

fixakimbostring( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3] == "a" && var_0[var_3 + 1] == "k" && var_0[var_3 + 2] == "i" && var_0[var_3 + 3] == "m" && var_0[var_3 + 4] == "b" && var_0[var_3 + 5] == "o" )
        {
            var_2 = var_3;
            break;
        }
    }

    var_0 = getsubstr( var_0, 0, var_2 ) + getsubstr( var_0, var_2 + 6, var_0.size );

    if ( var_1 )
        var_0 += "_akimbo";

    return var_0;
}

playsoundinspace( var_0, var_1 )
{
    playsoundatpos( var_1, var_0 );
}

limitdecimalplaces( var_0, var_1 )
{
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_2 *= 10;

    var_4 = var_0 * var_2;
    var_4 = int( var_4 );
    var_4 /= var_2;
    return var_4;
}

rounddecimalplaces( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "nearest";

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_3 *= 10;

    var_5 = var_0 * var_3;

    if ( var_2 == "up" )
        var_6 = ceil( var_5 );
    else if ( var_2 == "down" )
        var_6 = floor( var_5 );
    else
        var_6 = var_5 + 0.5;

    var_5 = int( var_6 );
    var_5 /= var_3;
    return var_5;
}

playerforclientid( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2.clientid == var_0 )
            return var_2;
    }

    return undefined;
}

isrested()
{
    if ( !rankingenabled() )
        return 0;

    return self getplayerdata( "restXPGoal" ) > self getplayerdata( "experience" );
}

stringtofloat( var_0 )
{
    var_1 = strtok( var_0, "." );
    var_2 = int( var_1[0] );

    if ( isdefined( var_1[1] ) )
    {
        var_3 = 1;

        for ( var_4 = 0; var_4 < var_1[1].size; var_4++ )
            var_3 *= 0.1;

        var_2 += int( var_1[1] ) * var_3;
    }

    return var_2;
}

setselfusable( var_0 )
{
    self makeusable();

    foreach ( var_2 in level.players )
    {
        if ( var_2 != var_0 )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        self enableplayeruse( var_2 );
    }
}

maketeamusable( var_0 )
{
    self makeusable();
    thread _updateteamusable( var_0 );
}

_updateteamusable( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
            {
                self enableplayeruse( var_2 );
                continue;
            }

            self disableplayeruse( var_2 );
        }

        level waittill( "joined_team" );
    }
}

makeenemyusable( var_0 )
{
    self makeusable();
    thread _updateenemyusable( var_0 );
}

_updateenemyusable( var_0 )
{
    self endon( "death" );
    var_1 = var_0.team;

    for (;;)
    {
        if ( level.teambased )
        {
            foreach ( var_3 in level.players )
            {
                if ( var_3.team != var_1 )
                {
                    self enableplayeruse( var_3 );
                    continue;
                }

                self disableplayeruse( var_3 );
            }
        }
        else
        {
            foreach ( var_3 in level.players )
            {
                if ( var_3 != var_0 )
                {
                    self enableplayeruse( var_3 );
                    continue;
                }

                self disableplayeruse( var_3 );
            }
        }

        level waittill( "joined_team" );
    }
}

getnextlifeid()
{
    var_0 = getmatchdata( "lifeCount" );

    if ( var_0 < level.maxlives )
        setmatchdata( "lifeCount", var_0 + 1 );

    return var_0;
}

initgameflags()
{
    if ( !isdefined( game["flags"] ) )
        game["flags"] = [];
}

gameflaginit( var_0, var_1 )
{
    game["flags"][var_0] = var_1;
}

gameflag( var_0 )
{
    return game["flags"][var_0];
}

gameflagset( var_0 )
{
    game["flags"][var_0] = 1;
    level notify( var_0 );
}

gameflagclear( var_0 )
{
    game["flags"][var_0] = 0;
}

gameflagwait( var_0 )
{
    while ( !gameflag( var_0 ) )
        level waittill( var_0 );
}

isprimarydamage( var_0 )
{
    if ( var_0 == "MOD_RIFLE_BULLET" || var_0 == "MOD_PISTOL_BULLET" )
        return 1;

    return 0;
}

isbulletdamage( var_0 )
{
    var_1 = "MOD_RIFLE_BULLET MOD_PISTOL_BULLET MOD_HEAD_SHOT";

    if ( issubstr( var_1, var_0 ) )
        return 1;

    return 0;
}

initlevelflags()
{
    if ( !isdefined( level.levelflags ) )
        level.levelflags = [];
}

levelflaginit( var_0, var_1 )
{
    level.levelflags[var_0] = var_1;
}

levelflag( var_0 )
{
    return level.levelflags[var_0];
}

levelflagset( var_0 )
{
    level.levelflags[var_0] = 1;
    level notify( var_0 );
}

levelflagclear( var_0 )
{
    level.levelflags[var_0] = 0;
    level notify( var_0 );
}

levelflagwait( var_0 )
{
    while ( !levelflag( var_0 ) )
        level waittill( var_0 );
}

levelflagwaitopen( var_0 )
{
    while ( levelflag( var_0 ) )
        level waittill( var_0 );
}

getweaponattachments( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( issubstr( var_4, "scopevz" ) )
            var_2[var_2.size] = "vzscope";

        if ( maps\mp\gametypes\_class::isvalidattachment( var_4, 0 ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

isemped()
{
    if ( self.team == "spectator" )
        return 0;

    if ( level.teambased )
        return level.teamemped[self.team] || isdefined( self.empgrenaded ) && self.empgrenaded || level.teamnukeemped[self.team];
    else
        return isdefined( level.empplayer ) && level.empplayer != self || isdefined( self.empgrenaded ) && self.empgrenaded || isdefined( level.nukeinfo.player ) && self != level.nukeinfo.player && level.teamnukeemped[self.team];
}

isairdenied()
{
    return 0;
}

isnuked()
{
    if ( self.team == "spectator" )
        return 0;

    return isdefined( self.nuked );
}

getplayerforguid( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2.guid == var_0 )
            return var_2;
    }

    return undefined;
}

teamplayercardsplash( var_0, var_1, var_2 )
{
    if ( level.hardcoremode )
        return;

    foreach ( var_4 in level.players )
    {
        if ( isdefined( var_2 ) && var_4.team != var_2 )
            continue;

        var_4 thread maps\mp\gametypes\_hud_message::playercardsplashnotify( var_0, var_1 );
    }
}

iscacprimaryweapon( var_0 )
{
    switch ( getweaponclass( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_riot":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
            return 1;
        default:
            return 0;
    }
}

iscacsecondaryweapon( var_0 )
{
    switch ( getweaponclass( var_0 ) )
    {
        case "weapon_projectile":
        case "weapon_pistol":
        case "weapon_machine_pistol":
            return 1;
        default:
            return 0;
    }
}

getlastlivingplayer( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_0 ) && var_3.team != var_0 )
            continue;

        if ( !isreallyalive( var_3 ) && !var_3 maps\mp\gametypes\_playerlogic::mayspawn() )
            continue;

        var_1 = var_3;
    }

    return var_1;
}

getpotentiallivingplayers()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( !isreallyalive( var_2 ) && !var_2 maps\mp\gametypes\_playerlogic::mayspawn() )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

waittillrecoveredhealth( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    for (;;)
    {
        if ( self.health != self.maxhealth )
            var_2 = 0;
        else
            var_2 += var_1;

        wait(var_1);

        if ( self.health == self.maxhealth && var_2 >= var_0 )
            break;
    }

    return;
}

attachmentmap( var_0, var_1 )
{
    var_2 = tablelookup( "mp/statstable.csv", 4, var_1, 2 );

    switch ( var_2 )
    {
        case "weapon_smg":
            if ( var_0 == "reflex" )
                return "reflexsmg";
            else if ( var_0 == "eotech" )
                return "eotechsmg";
            else if ( var_0 == "acog" )
                return "acogsmg";
            else if ( var_0 == "thermal" )
                return "thermalsmg";
        case "weapon_lmg":
            if ( var_0 == "reflex" )
                return "reflexlmg";
            else if ( var_0 == "eotech" )
                return "eotechlmg";
        case "weapon_machine_pistol":
            if ( var_0 == "reflex" )
                return "reflexsmg";
            else if ( var_0 == "eotech" )
                return "eotechsmg";
        default:
            return var_0;
    }
}

validateattachment( var_0 )
{
    switch ( var_0 )
    {
        case "silencer02":
        case "silencer03":
            return "silencer";
        case "m320":
        case "gp25":
            return "gl";
        case "reflexsmg":
        case "reflexlmg":
            return "reflex";
        case "eotechsmg":
        case "eotechlmg":
            return "eotech";
        case "acogsmg":
            return "acog";
        case "thermalsmg":
            return "thermal";
        default:
            return var_0;
    }
}

_objective_delete( var_0 )
{
    objective_delete( var_0 );

    if ( !isdefined( level.reclaimedreservedobjectives ) )
    {
        level.reclaimedreservedobjectives = [];
        level.reclaimedreservedobjectives[0] = var_0;
    }
    else
        level.reclaimedreservedobjectives[level.reclaimedreservedobjectives.size] = var_0;
}

touchingbadtrigger()
{
    var_0 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( self istouching( var_2 ) )
            return 1;
    }

    var_4 = getentarray( "radiation", "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( self istouching( var_2 ) )
            return 1;
    }

    return 0;
}

setthirdpersondof( var_0 )
{
    if ( var_0 )
        self setdepthoffield( 0, 110, 512, 4096, 6, 1.8 );
    else
        self setdepthoffield( 0, 0, 512, 512, 4, 0 );
}

killtrigger( var_0, var_1, var_2 )
{
    var_3 = spawn( "trigger_radius", var_0, 0, var_1, var_2 );

    for (;;)
    {
        var_3 waittill( "trigger", var_4 );

        if ( !isplayer( var_4 ) )
            continue;

        var_4 suicide();
    }
}

findisfacing( var_0, var_1, var_2 )
{
    var_3 = cos( var_2 );
    var_4 = anglestoforward( var_0.angles );
    var_5 = var_1.origin - var_0.origin;
    var_4 *= ( 1.0, 1.0, 0.0 );
    var_5 *= ( 1.0, 1.0, 0.0 );
    var_5 = vectornormalize( var_5 );
    var_4 = vectornormalize( var_4 );
    var_6 = vectordot( var_5, var_4 );

    if ( var_6 >= var_3 )
        return 1;
    else
        return 0;
}

combinearrays( var_0, var_1 )
{
    if ( !isdefined( var_0 ) && isdefined( var_1 ) )
        return var_1;

    if ( !isdefined( var_1 ) && isdefined( var_0 ) )
        return var_0;

    foreach ( var_3 in var_1 )
        var_0[var_0.size] = var_3;

    return var_0;
}

setrecoilscale( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( self.recoilscale ) )
        self.recoilscale = var_0;
    else
        self.recoilscale += var_0;

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self.recoilscale ) && var_1 < self.recoilscale )
            var_1 = self.recoilscale;

        var_2 = 100 - var_1;
    }
    else
        var_2 = 100 - self.recoilscale;

    if ( var_2 < 0 )
        var_2 = 0;

    if ( var_2 > 100 )
        var_2 = 100;

    if ( var_2 == 100 )
    {
        self player_recoilscaleoff();
        return;
    }

    self player_recoilscaleon( var_2 );
}

cleanarray( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

notusableforjoiningplayers( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( isdefined( var_1 ) && var_1 != var_0 )
            self disableplayeruse( var_1 );
    }
}

isstrstart( var_0, var_1 )
{
    return getsubstr( var_0, 0, var_1.size ) == var_1;
}

validateusestreak()
{
    if ( isdefined( self.laststand ) && !_hasperk( "specialty_finalstand" ) )
    {
        self iprintlnbold( &"MP_UNAVILABLE_IN_LASTSTAND" );
        return 0;
    }
    else if ( isdefined( level.civilianjetflyby ) )
    {
        self iprintlnbold( &"MP_CIVILIAN_AIR_TRAFFIC" );
        return 0;
    }
    else if ( isusingremote() )
        return 0;
    else if ( isemped() )
        return 0;
    else
        return 1;
}

currentactivevehiclecount( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = var_0;

    if ( isdefined( level.helis ) )
        var_1 += level.helis.size;

    if ( isdefined( level.littlebirds ) )
        var_1 += level.littlebirds.size;

    if ( isdefined( level.ugvs ) )
        var_1 += level.ugvs.size;

    return var_1;
}

maxvehiclesallowed()
{
    return 8;
}

incrementfauxvehiclecount()
{
    level.fauxvehiclecount++;
}

decrementfauxvehiclecount()
{
    level.fauxvehiclecount--;

    if ( level.fauxvehiclecount < 0 )
        level.fauxvehiclecount = 0;
}

lightweightscalar()
{
    return 1.1;
}

allowteamchoice()
{
    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 4 ) );
    return var_0;
}

allowclasschoice()
{
    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 5 ) );
    return var_0;
}

isbuffunlockedforweapon( var_0, var_1 )
{
    var_2 = 4;
    var_3 = 0;
    var_4 = 4;
    var_5 = self getplayerdata( "weaponRank", var_1 );
    var_6 = int( tablelookup( "mp/weaponRankTable.csv", var_3, getweaponclass( var_1 ), var_4 ) );
    var_7 = tablelookup( "mp/weaponRankTable.csv", var_6, var_0, var_2 );

    if ( var_7 != "" )
    {
        if ( var_5 >= int( var_7 ) )
            return 1;
    }

    return 0;
}

isbuffequippedonweapon( var_0, var_1 )
{
    if ( isdefined( self.loadoutprimary ) && self.loadoutprimary == var_1 )
    {
        if ( isdefined( self.loadoutprimarybuff ) && self.loadoutprimarybuff == var_0 )
            return 1;
    }
    else if ( isdefined( self.loadoutsecondary ) && self.loadoutsecondary == var_1 )
    {
        if ( isdefined( self.loadoutsecondarybuff ) && self.loadoutsecondarybuff == var_0 )
            return 1;
    }

    return 0;
}

setcommonrulesfrommatchrulesdata( var_0 )
{
    var_1 = getmatchrulesdata( "commonOption", "timeLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_timeLimit", var_1 );
    registertimelimitdvar( level.gametype, var_1 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_scoreLimit", var_2 );
    registerscorelimitdvar( level.gametype, var_2 );
    var_3 = getmatchrulesdata( "commonOption", "numLives" );
    setdynamicdvar( "scr_" + level.gametype + "_numLives", var_3 );
    registernumlivesdvar( level.gametype, var_3 );
    setdynamicdvar( "scr_player_maxhealth", getmatchrulesdata( "commonOption", "maxHealth" ) );
    setdynamicdvar( "scr_player_healthregentime", getmatchrulesdata( "commonOption", "healthRegen" ) );
    level.matchrules_damagemultiplier = 0;
    level.matchrules_vampirism = 0;
    setdynamicdvar( "scr_game_spectatetype", getmatchrulesdata( "commonOption", "spectateModeAllowed" ) );
    setdynamicdvar( "scr_game_allowkillcam", getmatchrulesdata( "commonOption", "showKillcam" ) );
    setdynamicdvar( "scr_game_forceuav", getmatchrulesdata( "commonOption", "radarAlwaysOn" ) );
    setdynamicdvar( "scr_" + level.gametype + "_playerrespawndelay", getmatchrulesdata( "commonOption", "respawnDelay" ) );
    setdynamicdvar( "scr_" + level.gametype + "_waverespawndelay", getmatchrulesdata( "commonOption", "waveRespawnDelay" ) );
    setdynamicdvar( "scr_player_forcerespawn", getmatchrulesdata( "commonOption", "forceRespawn" ) );
    level.matchrules_allowcustomclasses = getmatchrulesdata( "commonOption", "allowCustomClasses" );
    setdynamicdvar( "scr_game_hardpoints", getmatchrulesdata( "commonOption", "allowKillstreaks" ) );
    setdynamicdvar( "scr_game_perks", getmatchrulesdata( "commonOption", "allowPerks" ) );
    setdynamicdvar( "g_hardcore", getmatchrulesdata( "commonOption", "hardcoreModeOn" ) );
    setdynamicdvar( "scr_thirdPerson", getmatchrulesdata( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "camera_thirdPerson", getmatchrulesdata( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "scr_game_onlyheadshots", getmatchrulesdata( "commonOption", "headshotsOnly" ) );

    if ( !isdefined( var_0 ) )
        setdynamicdvar( "scr_team_fftype", getmatchrulesdata( "commonOption", "friendlyFire" ) );

    if ( getmatchrulesdata( "commonOption", "hardcoreModeOn" ) )
    {
        setdynamicdvar( "scr_team_fftype", 1 );
        setdynamicdvar( "scr_player_maxhealth", 30 );
        setdynamicdvar( "scr_player_healthregentime", 0 );
        setdynamicdvar( "scr_player_respawndelay", 10 );
        setdynamicdvar( "scr_game_allowkillcam", 0 );
        setdynamicdvar( "scr_game_forceuav", 0 );
    }
}

reinitializematchrulesonmigration()
{
    for (;;)
    {
        level waittill( "host_migration_begin" );
        [[ level.initializematchrules ]]();
    }
}

reinitializethermal( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self.lastvisionsetthermal ) )
            self visionsetthermalforplayer( self.lastvisionsetthermal, 0 );
    }
}

getmatchrulesspecialclass( var_0, var_1 )
{
    var_2 = [];
    var_2["loadoutPrimaryAttachment2"] = "none";
    var_2["loadoutSecondaryAttachment2"] = "none";
    var_2["loadoutPrimary"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "weapon" );
    var_2["loadoutPrimaryAttachment"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 0 );
    var_2["loadoutPrimaryAttachment2"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 1 );
    var_2["loadoutPrimaryBuff"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "buff" );
    var_2["loadoutPrimaryCamo"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "camo" );
    var_2["loadoutPrimaryReticle"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "reticle" );
    var_2["loadoutSecondary"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "weapon" );
    var_2["loadoutSecondaryAttachment"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 0 );
    var_2["loadoutSecondaryAttachment2"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 1 );
    var_2["loadoutSecondaryBuff"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "buff" );
    var_2["loadoutSecondaryCamo"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "camo" );
    var_2["loadoutSecondaryReticle"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "reticle" );
    var_2["loadoutEquipment"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perks", 0 );
    var_2["loadoutOffhand"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perks", 6 );

    if ( var_2["loadoutOffhand"] == "specialty_null" )
        var_2["loadoutOffhand"] = "none";

    var_2["loadoutPerk1"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perks", 1 );
    var_2["loadoutPerk2"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perks", 2 );
    var_2["loadoutPerk3"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perks", 3 );
    var_3 = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perks", 5 );

    if ( var_3 != "specialty_null" )
    {
        var_2["loadoutStreakType"] = var_3;
        var_2["loadoutKillstreak1"] = maps\mp\gametypes\_class::recipe_getkillstreak( var_0, var_1, var_3, 0 );
        var_2["loadoutKillstreak2"] = maps\mp\gametypes\_class::recipe_getkillstreak( var_0, var_1, var_3, 1 );
        var_2["loadoutKillstreak3"] = maps\mp\gametypes\_class::recipe_getkillstreak( var_0, var_1, var_3, 2 );
    }

    var_2["loadoutDeathstreak"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "deathstreak" );
    var_2["loadoutJuggernaut"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "juggernaut" );
    return var_2;
}

recipeclassapplyjuggernaut()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );

    if ( !isdefined( self.isjuiced ) )
    {
        self.movespeedscaler = 0.7;
        maps\mp\gametypes\_weapons::updatemovespeedscale();
    }

    self.juggmovespeedscaler = 0.7;
    self disableweaponpickup();

    if ( !getdvarint( "camera_thirdPerson" ) )
    {
        self.juggernautoverlay = newclienthudelem( self );
        self.juggernautoverlay.x = 0;
        self.juggernautoverlay.y = 0;
        self.juggernautoverlay.alignx = "left";
        self.juggernautoverlay.aligny = "top";
        self.juggernautoverlay.horzalign = "fullscreen";
        self.juggernautoverlay.vertalign = "fullscreen";
        self.juggernautoverlay setshader( level.juggsettings["juggernaut"].overlay, 640, 480 );
        self.juggernautoverlay.sort = -10;
        self.juggernautoverlay.archived = 1;
        self.juggernautoverlay.hidein3rdperson = 1;
    }

    thread maps\mp\killstreaks\_juggernaut::juggernautsounds();

    if ( level.gametype != "jugg" || isdefined( level.matchrules_showjuggradaricon ) && level.matchrules_showjuggradaricon )
        self setperk( "specialty_radarjuggernaut", 1, 0 );

    if ( isdefined( self.isjuggmodejuggernaut ) && self.isjuggmodejuggernaut )
    {
        var_0 = spawn( "script_model", self.origin );
        var_0.team = self.team;
        var_0 makeportableradar( self );
        self.personalradar = var_0;
        thread maps\mp\killstreaks\_juggernaut::radarmover( var_0 );
    }

    level notify( "juggernaut_equipped", self );
    thread maps\mp\killstreaks\_juggernaut::juggremover();
}
