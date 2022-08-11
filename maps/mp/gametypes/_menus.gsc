// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        game["menu_team"] = "team_marinesopfor";
        game["menu_class_allies"] = "class_marines";
        game["menu_changeclass_allies"] = "changeclass_marines";
        game["menu_initteam_allies"] = "initteam_marines";
        game["menu_class_axis"] = "class_opfor";
        game["menu_changeclass_axis"] = "changeclass_opfor";
        game["menu_initteam_axis"] = "initteam_opfor";
        game["menu_class"] = "class";
        game["menu_changeclass"] = "changeclass";
        game["menu_controls"] = "ingame_controls";

        if ( !level.console )
        {
            game["menu_muteplayer"] = "muteplayer";
            precachemenu( game["menu_muteplayer"] );
        }
        else
        {
            game["menu_leavegame"] = "popup_leavegame";

            if ( level.splitscreen )
            {
                game["menu_team"] += "_splitscreen";
                game["menu_class_allies"] += "_splitscreen";
                game["menu_changeclass_allies"] += "_splitscreen";
                game["menu_class_axis"] += "_splitscreen";
                game["menu_changeclass_axis"] += "_splitscreen";
                game["menu_class"] += "_splitscreen";
                game["menu_controls"] += "_splitscreen";
                game["menu_leavegame"] += "_splitscreen";
                game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
                game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
                precachemenu( game["menu_changeclass_defaults_splitscreen"] );
                precachemenu( game["menu_changeclass_custom_splitscreen"] );
            }

            precachemenu( game["menu_controls"] );
            precachemenu( game["menu_leavegame"] );
        }

        precachemenu( "scoreboard" );
        precachemenu( game["menu_team"] );
        precachemenu( game["menu_class_allies"] );
        precachemenu( game["menu_changeclass_allies"] );
        precachemenu( game["menu_initteam_allies"] );
        precachemenu( game["menu_class_axis"] );
        precachemenu( game["menu_changeclass_axis"] );
        precachemenu( game["menu_class"] );
        precachemenu( game["menu_changeclass"] );
        precachemenu( game["menu_initteam_axis"] );
        precachestring( &"MP_HOST_ENDED_GAME" );
        precachestring( &"MP_HOST_ENDGAME_RESPONSE" );
    }

    level thread onplayerconnect();
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onmenuresponse();
    }
}

isoptionsmenu( var_0 )
{
    if ( var_0 == game["menu_changeclass"] )
        return 1;

    if ( var_0 == game["menu_team"] )
        return 1;

    if ( var_0 == game["menu_controls"] )
        return 1;

    if ( issubstr( var_0, "pc_options" ) )
        return 1;

    return 0;
}

onmenuresponse()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "menuresponse", var_0, var_1 );

        if ( var_1 == "back" )
        {
            self closepopupmenu();
            self closeingamemenu();

            if ( isoptionsmenu( var_0 ) )
            {
                if ( self.pers["team"] == "allies" )
                    self openpopupmenu( game["menu_class_allies"] );

                if ( self.pers["team"] == "axis" )
                    self openpopupmenu( game["menu_class_axis"] );
            }

            continue;
        }

        if ( var_1 == "changeteam" )
        {
            self closepopupmenu();
            self closeingamemenu();
            self openpopupmenu( game["menu_team"] );
        }

        if ( var_1 == "changeclass_marines" )
        {
            self closepopupmenu();
            self closeingamemenu();
            self openpopupmenu( game["menu_changeclass_allies"] );
            continue;
        }

        if ( var_1 == "changeclass_opfor" )
        {
            self closepopupmenu();
            self closeingamemenu();
            self openpopupmenu( game["menu_changeclass_axis"] );
            continue;
        }

        if ( var_1 == "changeclass_marines_splitscreen" )
            self openpopupmenu( "changeclass_marines_splitscreen" );

        if ( var_1 == "changeclass_opfor_splitscreen" )
            self openpopupmenu( "changeclass_opfor_splitscreen" );

        if ( var_1 == "endgame" )
        {
            if ( level.splitscreen )
            {
                endparty();

                if ( !level.gameended )
                    level thread maps\mp\gametypes\_gamelogic::forceend();
            }

            continue;
        }

        if ( var_1 == "endround" )
        {
            if ( !level.gameended )
                level thread maps\mp\gametypes\_gamelogic::forceend();
            else
            {
                self closepopupmenu();
                self closeingamemenu();
                self iprintln( &"MP_HOST_ENDGAME_RESPONSE" );
            }

            continue;
        }

        if ( var_0 == game["menu_team"] )
        {
            switch ( var_1 )
            {
                case "allies":
                    self [[ level.allies ]]();
                    break;
                case "axis":
                    self [[ level.axis ]]();
                    break;
                case "autoassign":
                    self [[ level.autoassign ]]();
                    break;
                case "spectator":
                    self [[ level.spectator ]]();
                    break;
            }

            continue;
        }

        if ( var_0 == game["menu_changeclass"] || isdefined( game["menu_changeclass_defaults_splitscreen"] ) && var_0 == game["menu_changeclass_defaults_splitscreen"] || isdefined( game["menu_changeclass_custom_splitscreen"] ) && var_0 == game["menu_changeclass_custom_splitscreen"] )
        {
            self closepopupmenu();
            self closeingamemenu();
            self.selectedclass = 1;
            self [[ level.class ]]( var_1 );
            continue;
        }

        if ( !level.console )
        {
            if ( var_0 == game["menu_quickcommands"] )
            {
                maps\mp\gametypes\_quickmessages::quickcommands( var_1 );
                continue;
            }

            if ( var_0 == game["menu_quickstatements"] )
            {
                maps\mp\gametypes\_quickmessages::quickstatements( var_1 );
                continue;
            }

            if ( var_0 == game["menu_quickresponses"] )
                maps\mp\gametypes\_quickmessages::quickresponses( var_1 );
        }
    }
}

getteamassignment()
{
    var_0[0] = "allies";
    var_0[1] = "axis";

    if ( !level.teambased )
        return var_0[randomint( 2 )];

    if ( self.sessionteam != "none" && self.sessionteam != "spectator" && self.sessionstate != "playing" && self.sessionstate != "dead" )
        var_1 = self.sessionteam;
    else
    {
        var_2 = maps\mp\gametypes\_teams::countplayers();

        if ( var_2["allies"] == var_2["axis"] )
        {
            if ( getteamscore( "allies" ) == getteamscore( "axis" ) )
                var_1 = var_0[randomint( 2 )];
            else if ( getteamscore( "allies" ) < getteamscore( "axis" ) )
                var_1 = "allies";
            else
                var_1 = "axis";
        }
        else if ( var_2["allies"] < var_2["axis"] )
            var_1 = "allies";
        else
            var_1 = "axis";
    }

    return var_1;
}

menuautoassign()
{
    maps\mp\_utility::closemenus();
    var_0 = getteamassignment();

    if ( isdefined( self.pers["team"] ) && ( self.sessionstate == "playing" || self.sessionstate == "dead" ) )
    {
        if ( var_0 == self.pers["team"] )
        {
            beginclasschoice();
            return;
        }
        else
        {
            self.switching_teams = 1;
            self.joining_team = var_0;
            self.leaving_team = self.pers["team"];
            self suicide();
        }
    }

    addtoteam( var_0 );
    self.pers["class"] = undefined;
    self.class = undefined;

    if ( !isalive( self ) )
        self.statusicon = "hud_status_dead";

    self notify( "end_respawn" );
    beginclasschoice();
}

beginclasschoice( var_0 )
{
    var_1 = self.pers["team"];

    if ( maps\mp\_utility::allowclasschoice() )
        self openpopupmenu( game["menu_changeclass_" + var_1] );
    else
        thread bypassclasschoice();

    if ( !isalive( self ) )
        thread maps\mp\gametypes\_playerlogic::predictabouttospawnplayerovertime( 0.1 );
}

bypassclasschoice()
{
    self.selectedclass = 1;
    self [[ level.class ]]( "class0" );
}

beginteamchoice()
{
    self openpopupmenu( game["menu_team"] );
}

showmainmenuforteam()
{
    var_0 = self.pers["team"];
    self openpopupmenu( game["menu_class_" + var_0] );
}

menuallies()
{
    maps\mp\_utility::closemenus();

    if ( self.pers["team"] != "allies" )
    {
        if ( level.teambased && !maps\mp\gametypes\_teams::getjointeampermissions( "allies" ) )
        {
            self openpopupmenu( game["menu_team"] );
            return;
        }

        if ( level.ingraceperiod && !self.hasdonecombat )
            self.hasspawned = 0;

        if ( self.sessionstate == "playing" )
        {
            self.switching_teams = 1;
            self.joining_team = "allies";
            self.leaving_team = self.pers["team"];
            self suicide();
        }

        addtoteam( "allies" );
        self.pers["class"] = undefined;
        self.class = undefined;
        self notify( "end_respawn" );
    }

    beginclasschoice();
}

menuaxis()
{
    maps\mp\_utility::closemenus();

    if ( self.pers["team"] != "axis" )
    {
        if ( level.teambased && !maps\mp\gametypes\_teams::getjointeampermissions( "axis" ) )
        {
            self openpopupmenu( game["menu_team"] );
            return;
        }

        if ( level.ingraceperiod && !self.hasdonecombat )
            self.hasspawned = 0;

        if ( self.sessionstate == "playing" )
        {
            self.switching_teams = 1;
            self.joining_team = "axis";
            self.leaving_team = self.pers["team"];
            self suicide();
        }

        addtoteam( "axis" );
        self.pers["class"] = undefined;
        self.class = undefined;
        self notify( "end_respawn" );
    }

    beginclasschoice();
}

menuspectator()
{
    maps\mp\_utility::closemenus();

    if ( isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self.switching_teams = 1;
        self.joining_team = "spectator";
        self.leaving_team = self.pers["team"];
        self suicide();
    }

    addtoteam( "spectator" );
    self.pers["class"] = undefined;
    self.class = undefined;
    thread maps\mp\gametypes\_playerlogic::spawnspectator();
}

menuclass( var_0 )
{
    maps\mp\_utility::closemenus();

    if ( var_0 == "demolitions_mp,0" && self getplayerdata( "featureNew", "demolitions" ) )
        self setplayerdata( "featureNew", "demolitions", 0 );

    if ( var_0 == "sniper_mp,0" && self getplayerdata( "featureNew", "sniper" ) )
        self setplayerdata( "featureNew", "sniper", 0 );

    if ( !isdefined( self.pers["team"] ) || self.pers["team"] != "allies" && self.pers["team"] != "axis" )
        return;

    var_1 = maps\mp\gametypes\_class::getclasschoice( var_0 );
    var_2 = maps\mp\gametypes\_class::getweaponchoice( var_0 );

    if ( var_1 == "restricted" )
    {
        beginclasschoice();
        return;
    }

    if ( isdefined( self.pers["class"] ) && self.pers["class"] == var_1 && ( isdefined( self.pers["primary"] ) && self.pers["primary"] == var_2 ) )
        return;

    if ( self.sessionstate == "playing" )
    {
        if ( isdefined( self.pers["lastClass"] ) && isdefined( self.pers["class"] ) )
        {
            self.pers["lastClass"] = self.pers["class"];
            self.lastclass = self.pers["lastClass"];
        }

        self.pers["class"] = var_1;
        self.class = var_1;
        self.pers["primary"] = var_2;

        if ( game["state"] == "postgame" )
            return;

        if ( level.ingraceperiod && !self.hasdonecombat )
        {
            maps\mp\gametypes\_class::setclass( self.pers["class"] );
            self.tag_stowed_back = undefined;
            self.tag_stowed_hip = undefined;
            maps\mp\gametypes\_class::giveloadout( self.pers["team"], self.pers["class"] );
        }
        else
            self iprintlnbold( game["strings"]["change_class"] );
    }
    else
    {
        if ( isdefined( self.pers["lastClass"] ) && isdefined( self.pers["class"] ) )
        {
            self.pers["lastClass"] = self.pers["class"];
            self.lastclass = self.pers["lastClass"];
        }

        self.pers["class"] = var_1;
        self.class = var_1;
        self.pers["primary"] = var_2;

        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !maps\mp\_utility::isinkillcam() )
            thread maps\mp\gametypes\_playerlogic::spawnclient();
    }

    thread maps\mp\gametypes\_spectating::setspectatepermissions();
}

addtoteam( var_0, var_1 )
{
    if ( isdefined( self.team ) )
        maps\mp\gametypes\_playerlogic::removefromteamcount();

    self.pers["team"] = var_0;
    self.team = var_0;

    if ( !maps\mp\_utility::matchmakinggame() || isdefined( self.pers["isBot"] ) || !maps\mp\_utility::allowteamchoice() )
    {
        if ( level.teambased )
            self.sessionteam = var_0;
        else if ( var_0 == "spectator" )
            self.sessionteam = "spectator";
        else
            self.sessionteam = "none";
    }

    if ( game["state"] != "postgame" )
        maps\mp\gametypes\_playerlogic::addtoteamcount();

    maps\mp\_utility::updateobjectivetext();

    if ( isdefined( var_1 ) && var_1 )
        waittillframeend;

    maps\mp\_utility::updatemainmenu();

    if ( var_0 == "spectator" )
    {
        self notify( "joined_spectators" );
        level notify( "joined_team" );
    }
    else
    {
        self notify( "joined_team" );
        level notify( "joined_team" );
    }
}
