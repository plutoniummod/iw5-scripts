// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    var_0[var_0.size] = "airdrop_pallet";
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2].script_gameobjectname ) )
        {
            var_3 = 1;
            var_4 = strtok( var_1[var_2].script_gameobjectname, " " );

            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                for ( var_6 = 0; var_6 < var_4.size; var_6++ )
                {
                    if ( var_4[var_6] == var_0[var_5] )
                    {
                        var_3 = 0;
                        break;
                    }
                }

                if ( !var_3 )
                    break;
            }

            if ( var_3 )
                var_1[var_2] delete();
        }
    }
}

init()
{
    level.numgametypereservedobjectives = 0;
    precacheitem( "briefcase_bomb_mp" );
    precacheitem( "briefcase_bomb_defuse_mp" );
    precachemodel( "prop_suitcase_bomb" );
    level.objidstart = 0;
    level thread onplayerconnect();
}

onplayerconnect()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
        var_0 thread onplayerdisconnect();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( self.gameobject_fauxspawn ) )
        {
            self.gameobject_fauxspawn = undefined;
            continue;
        }

        thread ondeath();
        self.touchtriggers = [];
        self.carryobject = undefined;
        self.claimtrigger = undefined;
        self.canpickupobject = 1;
        self.killedinuse = undefined;
    }
}

ondeath()
{
    level endon( "game_ended" );
    self waittill( "death" );

    if ( isdefined( self.carryobject ) )
        self.carryobject thread setdropped();
}

onplayerdisconnect()
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( self.carryobject ) )
        self.carryobject thread setdropped();
}

createcarryobject( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.type = "carryObject";
    var_4.curorigin = var_1.origin;
    var_4.ownerteam = var_0;
    var_4.entnum = var_1 getentitynumber();

    if ( issubstr( var_1.classname, "use" ) )
        var_4.triggertype = "use";
    else
        var_4.triggertype = "proximity";

    var_1.baseorigin = var_1.origin;
    var_4.trigger = var_1;
    var_4.useweapon = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0.0, 0.0, 0.0 );

    var_4.offset3d = var_3;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5].baseorigin = var_2[var_5].origin;
        var_2[var_5].baseangles = var_2[var_5].angles;
    }

    var_4.visuals = var_2;
    var_4.compassicons = [];
    var_4.objidallies = getnextobjid();
    var_4.objidaxis = getnextobjid();
    var_4.objidpingfriendly = 0;
    var_4.objidpingenemy = 0;
    level.objidstart += 2;
    objective_add( var_4.objidallies, "invisible", var_4.curorigin );
    objective_add( var_4.objidaxis, "invisible", var_4.curorigin );
    objective_team( var_4.objidallies, "allies" );
    objective_team( var_4.objidaxis, "axis" );
    var_4.objpoints["allies"] = maps\mp\gametypes\_objpoints::createteamobjpoint( "objpoint_allies_" + var_4.entnum, var_4.curorigin + var_3, "allies", undefined );
    var_4.objpoints["axis"] = maps\mp\gametypes\_objpoints::createteamobjpoint( "objpoint_axis_" + var_4.entnum, var_4.curorigin + var_3, "axis", undefined );
    var_4.objpoints["allies"].alpha = 0;
    var_4.objpoints["axis"].alpha = 0;
    var_4.carrier = undefined;
    var_4.isresetting = 0;
    var_4.interactteam = "none";
    var_4.allowweapons = 0;
    var_4.worldicons = [];
    var_4.carriervisible = 0;
    var_4.visibleteam = "none";
    var_4.carryicon = undefined;
    var_4.ondrop = undefined;
    var_4.onpickup = undefined;
    var_4.onreset = undefined;

    if ( var_4.triggertype == "use" )
        var_4 thread carryobjectusethink();
    else
    {
        var_4.curprogress = 0;
        var_4.usetime = 0;
        var_4.userate = 0;
        var_4.teamusetimes = [];
        var_4.teamusetexts = [];
        var_4.numtouching["neutral"] = 0;
        var_4.numtouching["axis"] = 0;
        var_4.numtouching["allies"] = 0;
        var_4.numtouching["none"] = 0;
        var_4.touchlist["neutral"] = [];
        var_4.touchlist["axis"] = [];
        var_4.touchlist["allies"] = [];
        var_4.touchlist["none"] = [];
        var_4.claimteam = "none";
        var_4.claimplayer = undefined;
        var_4.lastclaimteam = "none";
        var_4.lastclaimtime = 0;
        var_4 thread carryobjectproxthink();
    }

    var_4 thread updatecarryobjectorigin();
    return var_4;
}

carryobjectusethink()
{
    level endon( "game_ended" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( self.isresetting )
            continue;

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            continue;

        if ( !caninteractwith( var_0.pers["team"] ) )
            continue;

        if ( !var_0.canpickupobject )
            continue;

        if ( isdefined( var_0.throwinggrenade ) )
            continue;

        if ( isdefined( self.carrier ) )
            continue;

        if ( var_0 maps\mp\_utility::isusingremote() )
            continue;

        setpickedup( var_0 );
    }
}

carryobjectproxthink()
{
    thread carryobjectproxthinkdelayed();
}

carryobjectproxthinkinstant()
{
    level endon( "game_ended" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( self.isresetting )
            continue;

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            continue;

        if ( !caninteractwith( var_0.pers["team"] ) )
            continue;

        if ( !var_0.canpickupobject )
            continue;

        if ( isdefined( var_0.throwinggrenade ) )
            continue;

        if ( isdefined( self.carrier ) )
            continue;

        setpickedup( var_0 );
    }
}

carryobjectproxthinkdelayed()
{
    level endon( "game_ended" );
    thread proxtriggerthink();

    for (;;)
    {
        if ( self.usetime && self.curprogress >= self.usetime )
        {
            self.curprogress = 0;
            var_0 = getearliestclaimplayer();

            if ( isdefined( self.onenduse ) )
                self [[ self.onenduse ]]( getclaimteam(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) )
                setpickedup( var_0 );

            setclaimteam( "none" );
            self.claimplayer = undefined;
        }

        if ( self.claimteam != "none" )
        {
            if ( self.usetime )
            {
                if ( !self.numtouching[self.claimteam] )
                {
                    if ( isdefined( self.onenduse ) )
                        self [[ self.onenduse ]]( getclaimteam(), self.claimplayer, 0 );

                    setclaimteam( "none" );
                    self.claimplayer = undefined;
                }
                else
                {
                    self.curprogress += 50 * self.userate;

                    if ( isdefined( self.onuseupdate ) )
                        self [[ self.onuseupdate ]]( getclaimteam(), self.curprogress / self.usetime, 50 * self.userate / self.usetime );
                }
            }
            else
            {
                if ( maps\mp\_utility::isreallyalive( self.claimplayer ) )
                    setpickedup( self.claimplayer );

                setclaimteam( "none" );
                self.claimplayer = undefined;
            }
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }
}

pickupobjectdelay( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self.canpickupobject = 0;

    for (;;)
    {
        if ( distancesquared( self.origin, var_0 ) > 4096 )
            break;

        wait 0.2;
    }

    self.canpickupobject = 1;
}

setpickedup( var_0 )
{
    if ( isdefined( var_0.carryobject ) )
    {
        if ( isdefined( self.onpickupfailed ) )
            self [[ self.onpickupfailed ]]( var_0 );

        return;
    }

    var_0 giveobject( self );
    setcarrier( var_0 );

    for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        self.visuals[var_1] hide();

    self.trigger.origin += ( 0.0, 0.0, 10000.0 );
    self notify( "pickup_object" );

    if ( isdefined( self.onpickup ) )
        self [[ self.onpickup ]]( var_0 );

    updatecompassicons();
    updateworldicons();
}

updatecarryobjectorigin()
{
    level endon( "game_ended" );
    var_0 = 5.0;

    for (;;)
    {
        if ( isdefined( self.carrier ) )
        {
            self.curorigin = self.carrier.origin + ( 0.0, 0.0, 75.0 );
            self.objpoints["allies"] maps\mp\gametypes\_objpoints::updateorigin( self.curorigin );
            self.objpoints["axis"] maps\mp\gametypes\_objpoints::updateorigin( self.curorigin );

            if ( ( self.visibleteam == "friendly" || self.visibleteam == "any" ) && isfriendlyteam( "allies" ) && self.objidpingfriendly )
            {
                if ( self.objpoints["allies"].isshown )
                {
                    self.objpoints["allies"].alpha = self.objpoints["allies"].basealpha;
                    self.objpoints["allies"] fadeovertime( var_0 + 1.0 );
                    self.objpoints["allies"].alpha = 0;
                }

                objective_position( self.objidallies, self.curorigin );
            }
            else if ( ( self.visibleteam == "friendly" || self.visibleteam == "any" ) && isfriendlyteam( "axis" ) && self.objidpingfriendly )
            {
                if ( self.objpoints["axis"].isshown )
                {
                    self.objpoints["axis"].alpha = self.objpoints["axis"].basealpha;
                    self.objpoints["axis"] fadeovertime( var_0 + 1.0 );
                    self.objpoints["axis"].alpha = 0;
                }

                objective_position( self.objidaxis, self.curorigin );
            }

            if ( ( self.visibleteam == "enemy" || self.visibleteam == "any" ) && !isfriendlyteam( "allies" ) && self.objidpingenemy )
            {
                if ( self.objpoints["allies"].isshown )
                {
                    self.objpoints["allies"].alpha = self.objpoints["allies"].basealpha;
                    self.objpoints["allies"] fadeovertime( var_0 + 1.0 );
                    self.objpoints["allies"].alpha = 0;
                }

                objective_position( self.objidallies, self.curorigin );
            }
            else if ( ( self.visibleteam == "enemy" || self.visibleteam == "any" ) && !isfriendlyteam( "axis" ) && self.objidpingenemy )
            {
                if ( self.objpoints["axis"].isshown )
                {
                    self.objpoints["axis"].alpha = self.objpoints["axis"].basealpha;
                    self.objpoints["axis"] fadeovertime( var_0 + 1.0 );
                    self.objpoints["axis"].alpha = 0;
                }

                objective_position( self.objidaxis, self.curorigin );
            }

            maps\mp\_utility::wait_endon( var_0, "dropped", "reset" );
            continue;
        }

        self.objpoints["allies"] maps\mp\gametypes\_objpoints::updateorigin( self.curorigin + self.offset3d );
        self.objpoints["axis"] maps\mp\gametypes\_objpoints::updateorigin( self.curorigin + self.offset3d );
        wait 0.05;
    }
}

hidecarryiconongameend()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    level waittill( "game_ended" );

    if ( isdefined( self.carryicon ) )
        self.carryicon.alpha = 0;
}

giveobject( var_0 )
{
    self.carryobject = var_0;
    thread trackcarrier();

    if ( !var_0.allowweapons )
    {
        common_scripts\utility::_disableweapon();
        thread manualdropthink();
    }

    if ( isdefined( var_0.carryicon ) )
    {
        if ( level.splitscreen )
        {
            self.carryicon = maps\mp\gametypes\_hud_util::createicon( var_0.carryicon, 33, 33 );
            self.carryicon maps\mp\gametypes\_hud_util::setpoint( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -78 );
        }
        else
        {
            self.carryicon = maps\mp\gametypes\_hud_util::createicon( var_0.carryicon, 50, 50 );
            self.carryicon maps\mp\gametypes\_hud_util::setpoint( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -65 );
        }

        self.carryicon.hidewheninmenu = 1;
        thread hidecarryiconongameend();
    }
}

returnhome()
{
    self.isresetting = 1;
    self notify( "reset" );

    for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
    {
        self.visuals[var_0].origin = self.visuals[var_0].baseorigin;
        self.visuals[var_0].angles = self.visuals[var_0].baseangles;
        self.visuals[var_0] show();
    }

    self.trigger.origin = self.trigger.baseorigin;
    self.curorigin = self.trigger.origin;

    if ( isdefined( self.onreset ) )
        self [[ self.onreset ]]();

    clearcarrier();
    updateworldicons();
    updatecompassicons();
    self.isresetting = 0;
}

ishome()
{
    if ( isdefined( self.carrier ) )
        return 0;

    if ( self.curorigin != self.trigger.baseorigin )
        return 0;

    return 1;
}

setposition( var_0, var_1 )
{
    self.isresetting = 1;

    for ( var_2 = 0; var_2 < self.visuals.size; var_2++ )
    {
        self.visuals[var_2].origin = self.origin;
        self.visuals[var_2].angles = self.angles;
        self.visuals[var_2] show();
    }

    self.trigger.origin = var_0;
    self.curorigin = self.trigger.origin;
    clearcarrier();
    updateworldicons();
    updatecompassicons();
    self.isresetting = 0;
}

onplayerlaststand()
{
    if ( isdefined( self.carryobject ) )
        self.carryobject thread setdropped();
}

setdropped()
{
    self.isresetting = 1;
    self notify( "dropped" );

    if ( isdefined( self.carrier ) && self.carrier.team != "spectator" )
    {
        var_0 = playerphysicstrace( self.carrier.origin + ( 0.0, 0.0, 20.0 ), self.carrier.origin - ( 0.0, 0.0, 2000.0 ), 0, self.carrier.body );
        var_1 = bullettrace( self.carrier.origin + ( 0.0, 0.0, 20.0 ), self.carrier.origin - ( 0.0, 0.0, 2000.0 ), 0, self.carrier.body );
    }
    else
    {
        var_0 = playerphysicstrace( self.safeorigin + ( 0.0, 0.0, 20.0 ), self.safeorigin - ( 0.0, 0.0, 20.0 ), 0, undefined );
        var_1 = bullettrace( self.safeorigin + ( 0.0, 0.0, 20.0 ), self.safeorigin - ( 0.0, 0.0, 20.0 ), 0, undefined );
    }

    var_2 = self.carrier;
    var_3 = 0;

    if ( isdefined( var_0 ) )
    {
        var_4 = randomfloat( 360 );
        var_5 = var_0;

        if ( var_1["fraction"] < 1 && distance( var_1["position"], var_0 ) < 10.0 )
        {
            var_6 = ( cos( var_4 ), sin( var_4 ), 0 );
            var_6 = vectornormalize( var_6 - var_1["normal"] * vectordot( var_6, var_1["normal"] ) );
            var_7 = vectortoangles( var_6 );
        }
        else
            var_7 = ( 0, var_4, 0 );

        for ( var_8 = 0; var_8 < self.visuals.size; var_8++ )
        {
            self.visuals[var_8].origin = var_5;
            self.visuals[var_8].angles = var_7;
            self.visuals[var_8] show();
        }

        self.trigger.origin = var_5;
        self.curorigin = self.trigger.origin;
        thread pickuptimeout();
    }

    if ( !isdefined( var_0 ) )
    {
        for ( var_8 = 0; var_8 < self.visuals.size; var_8++ )
        {
            self.visuals[var_8].origin = self.visuals[var_8].baseorigin;
            self.visuals[var_8].angles = self.visuals[var_8].baseangles;
            self.visuals[var_8] show();
        }

        self.trigger.origin = self.trigger.baseorigin;
        self.curorigin = self.trigger.baseorigin;
    }

    if ( isdefined( self.ondrop ) )
        self [[ self.ondrop ]]( var_2 );

    clearcarrier();
    updatecompassicons();
    updateworldicons();
    self.isresetting = 0;
}

setcarrier( var_0 )
{
    self.carrier = var_0;
    thread updatevisibilityaccordingtoradar();
}

clearcarrier()
{
    if ( !isdefined( self.carrier ) )
        return;

    self.carrier takeobject( self );
    self.carrier = undefined;
    self notify( "carrier_cleared" );
}

pickuptimeout()
{
    self endon( "pickup_object" );
    self endon( "stop_pickup_timeout" );
    wait 0.05;
    var_0 = getentarray( "minefield", "targetname" );
    var_1 = getentarray( "trigger_hurt", "classname" );
    var_2 = getentarray( "radiation", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !self.visuals[0] istouching( var_2[var_3] ) )
            continue;

        returnhome();
        return;
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !self.visuals[0] istouching( var_0[var_3] ) )
            continue;

        returnhome();
        return;
    }

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !self.visuals[0] istouching( var_1[var_3] ) )
            continue;

        returnhome();
        return;
    }

    if ( isdefined( self.autoresettime ) )
    {
        wait(self.autoresettime);

        if ( !isdefined( self.carrier ) )
            returnhome();
    }
}

takeobject( var_0 )
{
    if ( isdefined( self.carryicon ) )
        self.carryicon maps\mp\gametypes\_hud_util::destroyelem();

    if ( isdefined( self ) )
        self.carryobject = undefined;

    self notify( "drop_object" );

    if ( var_0.triggertype == "proximity" )
        thread pickupobjectdelay( var_0.trigger.origin );

    if ( maps\mp\_utility::isreallyalive( self ) && !var_0.allowweapons )
        common_scripts\utility::_enableweapon();
}

trackcarrier()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    while ( isdefined( self.carryobject ) && maps\mp\_utility::isreallyalive( self ) )
    {
        if ( self isonground() )
        {
            var_0 = bullettrace( self.origin + ( 0.0, 0.0, 20.0 ), self.origin - ( 0.0, 0.0, 20.0 ), 0, undefined );

            if ( var_0["fraction"] < 1 )
                self.carryobject.safeorigin = var_0["position"];
        }

        wait 0.05;
    }
}

manualdropthink()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        while ( self attackbuttonpressed() || self fragbuttonpressed() || self secondaryoffhandbuttonpressed() || self meleebuttonpressed() )
            wait 0.05;

        while ( !self attackbuttonpressed() && !self fragbuttonpressed() && !self secondaryoffhandbuttonpressed() && !self meleebuttonpressed() )
            wait 0.05;

        if ( isdefined( self.carryobject ) && !self usebuttonpressed() )
            self.carryobject thread setdropped();
    }
}

deleteuseobject()
{
    maps\mp\_utility::_objective_delete( self.objidallies );
    maps\mp\_utility::_objective_delete( self.objidaxis );
    maps\mp\gametypes\_objpoints::deleteobjpoint( self.objpoints["allies"] );
    maps\mp\gametypes\_objpoints::deleteobjpoint( self.objpoints["axis"] );
    self.trigger = undefined;
    self notify( "deleted" );
}

createuseobject( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.type = "useObject";
    var_4.curorigin = var_1.origin;
    var_4.ownerteam = var_0;
    var_4.entnum = var_1 getentitynumber();
    var_4.keyobject = undefined;

    if ( issubstr( var_1.classname, "use" ) )
        var_4.triggertype = "use";
    else
        var_4.triggertype = "proximity";

    var_4.trigger = var_1;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5].baseorigin = var_2[var_5].origin;
        var_2[var_5].baseangles = var_2[var_5].angles;
    }

    var_4.visuals = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0.0, 0.0, 0.0 );

    var_4.offset3d = var_3;
    var_4.compassicons = [];
    var_4.objidallies = getnextobjid();
    var_4.objidaxis = getnextobjid();
    objective_add( var_4.objidallies, "invisible", var_4.curorigin );
    objective_add( var_4.objidaxis, "invisible", var_4.curorigin );
    objective_team( var_4.objidallies, "allies" );
    objective_team( var_4.objidaxis, "axis" );
    var_4.objpoints["allies"] = maps\mp\gametypes\_objpoints::createteamobjpoint( "objpoint_allies_" + var_4.entnum, var_4.curorigin + var_3, "allies", undefined );
    var_4.objpoints["axis"] = maps\mp\gametypes\_objpoints::createteamobjpoint( "objpoint_axis_" + var_4.entnum, var_4.curorigin + var_3, "axis", undefined );
    var_4.objpoints["allies"].alpha = 0;
    var_4.objpoints["axis"].alpha = 0;
    var_4.interactteam = "none";
    var_4.worldicons = [];
    var_4.visibleteam = "none";
    var_4.onuse = undefined;
    var_4.oncantuse = undefined;
    var_4.usetext = "default";
    var_4.usetime = 10000;
    var_4.curprogress = 0;

    if ( var_4.triggertype == "proximity" )
    {
        var_4.teamusetimes = [];
        var_4.teamusetexts = [];
        var_4.numtouching["neutral"] = 0;
        var_4.numtouching["axis"] = 0;
        var_4.numtouching["allies"] = 0;
        var_4.numtouching["none"] = 0;
        var_4.touchlist["neutral"] = [];
        var_4.touchlist["axis"] = [];
        var_4.touchlist["allies"] = [];
        var_4.touchlist["none"] = [];
        var_4.userate = 0;
        var_4.claimteam = "none";
        var_4.claimplayer = undefined;
        var_4.lastclaimteam = "none";
        var_4.lastclaimtime = 0;
        var_4 thread useobjectproxthink();
    }
    else
    {
        var_4.userate = 1;
        var_4 thread useobjectusethink();
    }

    return var_4;
}

setkeyobject( var_0 )
{
    self.keyobject = var_0;
}

useobjectusethink()
{
    level endon( "game_ended" );
    self endon( "deleted" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            continue;

        if ( !caninteractwith( var_0.pers["team"] ) )
            continue;

        if ( !var_0 isonground() )
            continue;

        if ( !var_0 maps\mp\_utility::isjuggernaut() && maps\mp\_utility::iskillstreakweapon( var_0 getcurrentweapon() ) )
            continue;

        if ( isdefined( self.keyobject ) && ( !isdefined( var_0.carryobject ) || var_0.carryobject != self.keyobject ) )
        {
            if ( isdefined( self.oncantuse ) )
                self [[ self.oncantuse ]]( var_0 );

            continue;
        }

        if ( !var_0 common_scripts\utility::isweaponenabled() )
            continue;

        var_1 = 1;

        if ( self.usetime > 0 )
        {
            if ( isdefined( self.onbeginuse ) )
                self [[ self.onbeginuse ]]( var_0 );

            if ( !isdefined( self.keyobject ) )
                thread cantusehintthink();

            var_2 = var_0.pers["team"];
            var_1 = useholdthink( var_0 );
            self notify( "finished_use" );

            if ( isdefined( self.onenduse ) )
                self [[ self.onenduse ]]( var_2, var_0, var_1 );
        }

        if ( !var_1 )
            continue;

        if ( isdefined( self.onuse ) )
            self [[ self.onuse ]]( var_0 );
    }
}

cantusehintthink()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self endon( "finished_use" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            continue;

        if ( !caninteractwith( var_0.pers["team"] ) )
            continue;

        if ( isdefined( self.oncantuse ) )
            self [[ self.oncantuse ]]( var_0 );
    }
}

getearliestclaimplayer()
{
    var_0 = self.claimteam;

    if ( maps\mp\_utility::isreallyalive( self.claimplayer ) )
        var_1 = self.claimplayer;
    else
        var_1 = undefined;

    if ( self.touchlist[var_0].size > 0 )
    {
        var_2 = undefined;
        var_3 = getarraykeys( self.touchlist[var_0] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = self.touchlist[var_0][var_3[var_4]];

            if ( maps\mp\_utility::isreallyalive( var_5.player ) && ( !isdefined( var_2 ) || var_5.starttime < var_2 ) )
            {
                var_1 = var_5.player;
                var_2 = var_5.starttime;
            }
        }
    }

    return var_1;
}

useobjectproxthink()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    thread proxtriggerthink();

    for (;;)
    {
        if ( self.usetime && self.curprogress >= self.usetime )
        {
            self.curprogress = 0;
            var_0 = getearliestclaimplayer();

            if ( isdefined( self.onenduse ) )
                self [[ self.onenduse ]]( getclaimteam(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) && isdefined( self.onuse ) )
                self [[ self.onuse ]]( var_0 );

            setclaimteam( "none" );
            self.claimplayer = undefined;
        }

        if ( self.claimteam != "none" )
        {
            if ( self.usetime )
            {
                if ( !self.numtouching[self.claimteam] )
                {
                    if ( isdefined( self.onenduse ) )
                        self [[ self.onenduse ]]( getclaimteam(), self.claimplayer, 0 );

                    setclaimteam( "none" );
                    self.claimplayer = undefined;
                }
                else
                {
                    self.curprogress += 50 * self.userate;

                    if ( isdefined( self.onuseupdate ) )
                        self [[ self.onuseupdate ]]( getclaimteam(), self.curprogress / self.usetime, 50 * self.userate / self.usetime );
                }
            }
            else
            {
                if ( isdefined( self.onuse ) )
                    self [[ self.onuse ]]( self.claimplayer );

                setclaimteam( "none" );
                self.claimplayer = undefined;
            }
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }
}

proxtriggerthink()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    var_0 = self.entnum;

    for (;;)
    {
        self.trigger waittill( "trigger", var_1 );

        if ( !maps\mp\_utility::isreallyalive( var_1 ) )
            continue;

        if ( isdefined( self.carrier ) )
            continue;

        if ( var_1 maps\mp\_utility::isusingremote() || isdefined( var_1.spawningafterremotedeath ) )
            continue;

        if ( isdefined( var_1.classname ) && var_1.classname == "script_vehicle" )
            continue;

        if ( level.gametype == "ctfpro" )
        {
            if ( isdefined( self.type ) && self.type == "carryObject" && isdefined( var_1.carryflag ) )
                continue;
        }

        if ( caninteractwith( var_1.pers["team"], var_1 ) && self.claimteam == "none" )
        {
            if ( !isdefined( self.keyobject ) || isdefined( var_1.carryobject ) && var_1.carryobject == self.keyobject )
            {
                if ( !proxtriggerlos( var_1 ) )
                    continue;

                setclaimteam( var_1.pers["team"] );
                self.claimplayer = var_1;
                var_2 = getrelativeteam( var_1.pers["team"] );

                if ( isdefined( self.teamusetimes[var_2] ) )
                    self.usetime = self.teamusetimes[var_2];

                if ( self.usetime && isdefined( self.onbeginuse ) )
                    self [[ self.onbeginuse ]]( self.claimplayer );
            }
            else if ( isdefined( self.oncantuse ) )
                self [[ self.oncantuse ]]( var_1 );
        }

        if ( self.usetime && maps\mp\_utility::isreallyalive( var_1 ) && !isdefined( var_1.touchtriggers[var_0] ) )
            var_1 thread triggertouchthink( self );
    }
}

proxtriggerlos( var_0 )
{
    if ( !isdefined( self.requireslos ) )
        return 1;

    var_1 = var_0 geteye();
    var_2 = self.trigger.origin + ( 0.0, 0.0, 32.0 );
    var_3 = bullettrace( var_1, var_2, 0, undefined );
    return var_3["fraction"] == 1;
}

setclaimteam( var_0 )
{
    if ( self.claimteam == "none" && gettime() - self.lastclaimtime > 1000 )
        self.curprogress = 0;
    else if ( var_0 != "none" && var_0 != self.lastclaimteam )
        self.curprogress = 0;

    self.lastclaimteam = self.claimteam;
    self.lastclaimtime = gettime();
    self.claimteam = var_0;
    updateuserate();
}

getclaimteam()
{
    return self.claimteam;
}

triggertouchthink( var_0 )
{
    var_1 = self.pers["team"];
    var_0.numtouching[var_1]++;
    var_2 = self.guid;
    var_3 = spawnstruct();
    var_3.player = self;
    var_3.starttime = gettime();
    var_0.touchlist[var_1][var_2] = var_3;

    if ( !isdefined( var_0.nousebar ) )
        var_0.nousebar = 0;

    self.touchtriggers[var_0.entnum] = var_0.trigger;
    var_0 updateuserate();

    while ( maps\mp\_utility::isreallyalive( self ) && isdefined( var_0.trigger ) && self istouching( var_0.trigger ) && !level.gameended && var_0.usetime )
    {
        updateproxbar( var_0, 0 );
        wait 0.05;
    }

    if ( isdefined( self ) )
    {
        updateproxbar( var_0, 1 );
        self.touchtriggers[var_0.entnum] = undefined;
    }

    if ( level.gameended )
        return;

    var_0.touchlist[var_1][var_2] = undefined;
    var_0.numtouching[var_1]--;
    var_0 updateuserate();
}

updateproxbar( var_0, var_1 )
{
    if ( var_1 || !var_0 caninteractwith( self.pers["team"] ) || self.pers["team"] != var_0.claimteam || var_0.nousebar )
    {
        if ( isdefined( self.proxbar ) )
            self.proxbar maps\mp\gametypes\_hud_util::hideelem();

        if ( isdefined( self.proxbartext ) )
            self.proxbartext maps\mp\gametypes\_hud_util::hideelem();

        return;
    }

    if ( !isdefined( self.proxbar ) )
    {
        self.proxbar = maps\mp\gametypes\_hud_util::createprimaryprogressbar();
        self.proxbar.lastuserate = -1;
        self.proxbar.lasthostmigrationstate = 0;
    }

    if ( self.proxbar.hidden )
    {
        self.proxbar maps\mp\gametypes\_hud_util::showelem();
        self.proxbar.lastuserate = -1;
        self.proxbar.lasthostmigrationstate = 0;
    }

    if ( !isdefined( self.proxbartext ) )
    {
        self.proxbartext = maps\mp\gametypes\_hud_util::createprimaryprogressbartext();
        var_2 = var_0 getrelativeteam( self.pers["team"] );

        if ( isdefined( var_0.teamusetexts[var_2] ) )
            self.proxbartext settext( var_0.teamusetexts[var_2] );
        else
            self.proxbartext settext( var_0.usetext );
    }

    if ( self.proxbartext.hidden )
    {
        self.proxbartext maps\mp\gametypes\_hud_util::showelem();
        var_2 = var_0 getrelativeteam( self.pers["team"] );

        if ( isdefined( var_0.teamusetexts[var_2] ) )
            self.proxbartext settext( var_0.teamusetexts[var_2] );
        else
            self.proxbartext settext( var_0.usetext );
    }

    if ( self.proxbar.lastuserate != var_0.userate || self.proxbar.lasthostmigrationstate != isdefined( level.hostmigrationtimer ) )
    {
        if ( var_0.curprogress > var_0.usetime )
            var_0.curprogress = var_0.usetime;

        var_3 = var_0.curprogress / var_0.usetime;
        var_4 = 1000 / var_0.usetime * var_0.userate;

        if ( isdefined( level.hostmigrationtimer ) )
            var_4 = 0;

        self.proxbar maps\mp\gametypes\_hud_util::updatebar( var_3, var_4 );
        self.proxbar.lastuserate = var_0.userate;
        self.proxbar.lasthostmigrationstate = isdefined( level.hostmigrationtimer );
    }
}

updateuserate()
{
    var_0 = self.numtouching[self.claimteam];
    var_1 = 0;
    var_2 = 0;

    if ( self.claimteam != "axis" )
        var_1 += self.numtouching["axis"];

    if ( self.claimteam != "allies" )
        var_1 += self.numtouching["allies"];

    foreach ( var_4 in self.touchlist[self.claimteam] )
    {
        if ( var_4.player.pers["team"] != self.claimteam )
            continue;

        if ( var_4.player.objectivescaler == 1 )
            continue;

        var_0 *= var_4.player.objectivescaler;
        var_2 = var_4.player.objectivescaler;
    }

    self.userate = 0;

    if ( var_0 && !var_1 )
        self.userate = min( var_0, 4 );

    if ( isdefined( self.isarena ) && self.isarena && var_2 != 0 )
        self.userate = 1 * var_2;
    else if ( isdefined( self.isarena ) && self.isarena )
        self.userate = 1;
}

attachusemodel()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "done_using" );
    wait 1.3;
    self attach( "prop_suitcase_bomb", "tag_inhand", 1 );
    self.attachedusemodel = "prop_suitcase_bomb";
}

useholdthink( var_0 )
{
    var_0 notify( "use_hold" );
    var_0 playerlinkto( self.trigger );
    var_0 playerlinkedoffsetenable();
    var_0 clientclaimtrigger( self.trigger );
    var_0.claimtrigger = self.trigger;
    var_1 = self.useweapon;
    var_2 = var_0 getcurrentweapon();

    if ( isdefined( var_1 ) )
    {
        if ( var_2 == var_1 )
            var_2 = var_0.lastnonuseweapon;

        var_0.lastnonuseweapon = var_2;
        var_0 maps\mp\_utility::_giveweapon( var_1 );
        var_0 setweaponammostock( var_1, 0 );
        var_0 setweaponammoclip( var_1, 0 );
        var_0 switchtoweapon( var_1 );
        var_0 thread attachusemodel();
    }
    else
        var_0 common_scripts\utility::_disableweapon();

    self.curprogress = 0;
    self.inuse = 1;
    self.userate = 0;
    var_0 thread personalusebar( self );
    var_3 = useholdthinkloop( var_0, var_2 );

    if ( isdefined( var_0 ) )
    {
        var_0 detachusemodels();
        var_0 notify( "done_using" );
    }

    if ( isdefined( var_1 ) && isdefined( var_0 ) )
        var_0 thread takeuseweapon( var_1 );

    if ( isdefined( var_3 ) && var_3 )
        return 1;

    if ( isdefined( var_0 ) )
    {
        var_0.claimtrigger = undefined;

        if ( isdefined( var_1 ) )
        {
            if ( var_2 != "none" )
                var_0 switchtoweapon( var_2 );
            else
                var_0 takeweapon( var_1 );
        }
        else
            var_0 common_scripts\utility::_enableweapon();

        var_0 unlink();

        if ( !maps\mp\_utility::isreallyalive( var_0 ) )
            var_0.killedinuse = 1;
    }

    self.inuse = 0;
    self.trigger releaseclaimedtrigger();
    return 0;
}

detachusemodels()
{
    if ( isdefined( self.attachedusemodel ) )
    {
        self detach( self.attachedusemodel, "tag_inhand" );
        self.attachedusemodel = undefined;
    }
}

takeuseweapon( var_0 )
{
    self endon( "use_hold" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( self getcurrentweapon() == var_0 && !isdefined( self.throwinggrenade ) )
        wait 0.05;

    self takeweapon( var_0 );
}

useholdthinkloop( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disabled" );
    var_2 = self.useweapon;
    var_3 = 1;
    var_4 = 0;
    var_5 = 1.5;

    while ( maps\mp\_utility::isreallyalive( var_0 ) && var_0 istouching( self.trigger ) && var_0 usebuttonpressed() && !isdefined( var_0.throwinggrenade ) && !var_0 meleebuttonpressed() && self.curprogress < self.usetime && ( self.userate || var_3 ) && !( var_3 && var_4 > var_5 ) )
    {
        var_4 += 0.05;

        if ( !isdefined( var_2 ) || var_0 getcurrentweapon() == var_2 )
        {
            self.curprogress += 50 * self.userate;
            self.userate = 1 * var_0.objectivescaler;
            var_3 = 0;
        }
        else
            self.userate = 0;

        if ( self.curprogress >= self.usetime )
        {
            self.inuse = 0;
            var_0 clientreleasetrigger( self.trigger );
            var_0.claimtrigger = undefined;

            if ( isdefined( var_2 ) )
            {
                var_0 setweaponammostock( var_2, 1 );
                var_0 setweaponammoclip( var_2, 1 );

                if ( var_1 != "none" )
                    var_0 switchtoweapon( var_1 );
                else
                    var_0 takeweapon( var_2 );
            }
            else
                var_0 common_scripts\utility::_enableweapon();

            var_0 unlink();
            return maps\mp\_utility::isreallyalive( var_0 );
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::waittillhostmigrationdone();
    }

    return 0;
}

personalusebar( var_0 )
{
    self endon( "disconnect" );
    var_1 = maps\mp\gametypes\_hud_util::createprimaryprogressbar();
    var_2 = maps\mp\gametypes\_hud_util::createprimaryprogressbartext();
    var_2 settext( var_0.usetext );
    var_3 = -1;
    var_4 = isdefined( level.hostmigrationtimer );

    while ( maps\mp\_utility::isreallyalive( self ) && var_0.inuse && !level.gameended )
    {
        if ( var_3 != var_0.userate || var_4 != isdefined( level.hostmigrationtimer ) )
        {
            if ( var_0.curprogress > var_0.usetime )
                var_0.curprogress = var_0.usetime;

            var_5 = var_0.curprogress / var_0.usetime;
            var_6 = 1000 / var_0.usetime * var_0.userate;

            if ( isdefined( level.hostmigrationtimer ) )
                var_6 = 0;

            var_1 maps\mp\gametypes\_hud_util::updatebar( var_5, var_6 );

            if ( !var_0.userate )
            {
                var_1 maps\mp\gametypes\_hud_util::hideelem();
                var_2 maps\mp\gametypes\_hud_util::hideelem();
            }
            else
            {
                var_1 maps\mp\gametypes\_hud_util::showelem();
                var_2 maps\mp\gametypes\_hud_util::showelem();
            }
        }

        var_3 = var_0.userate;
        var_4 = isdefined( level.hostmigrationtimer );
        wait 0.05;
    }

    var_1 maps\mp\gametypes\_hud_util::destroyelem();
    var_2 maps\mp\gametypes\_hud_util::destroyelem();
}

updatetrigger()
{
    if ( self.triggertype != "use" )
        return;

    if ( self.interactteam == "none" )
        self.trigger.origin -= ( 0.0, 0.0, 50000.0 );
    else if ( self.interactteam == "any" )
    {
        self.trigger.origin = self.curorigin;
        self.trigger setteamfortrigger( "none" );
    }
    else if ( self.interactteam == "friendly" )
    {
        self.trigger.origin = self.curorigin;

        if ( self.ownerteam == "allies" )
            self.trigger setteamfortrigger( "allies" );
        else if ( self.ownerteam == "axis" )
            self.trigger setteamfortrigger( "axis" );
        else
            self.trigger.origin -= ( 0.0, 0.0, 50000.0 );
    }
    else if ( self.interactteam == "enemy" )
    {
        self.trigger.origin = self.curorigin;

        if ( self.ownerteam == "allies" )
            self.trigger setteamfortrigger( "axis" );
        else if ( self.ownerteam == "axis" )
            self.trigger setteamfortrigger( "allies" );
        else
            self.trigger setteamfortrigger( "none" );
    }
}

updateworldicons()
{
    if ( self.visibleteam == "any" )
    {
        updateworldicon( "friendly", 1 );
        updateworldicon( "enemy", 1 );
    }
    else if ( self.visibleteam == "friendly" )
    {
        updateworldicon( "friendly", 1 );
        updateworldicon( "enemy", 0 );
    }
    else if ( self.visibleteam == "enemy" )
    {
        updateworldicon( "friendly", 0 );
        updateworldicon( "enemy", 1 );
    }
    else
    {
        updateworldicon( "friendly", 0 );
        updateworldicon( "enemy", 0 );
    }
}

updateworldicon( var_0, var_1 )
{
    if ( !isdefined( self.worldicons[var_0] ) )
        var_1 = 0;

    var_2 = getupdateteams( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = "objpoint_" + var_2[var_3] + "_" + self.entnum;
        var_5 = maps\mp\gametypes\_objpoints::getobjpointbyname( var_4 );
        var_5 notify( "stop_flashing_thread" );
        var_5 thread maps\mp\gametypes\_objpoints::stopflashing();

        if ( var_1 )
        {
            var_5 setshader( self.worldicons[var_0], level.objpointsize, level.objpointsize );
            var_5 fadeovertime( 0.05 );
            var_5.alpha = var_5.basealpha;
            var_5.isshown = 1;

            if ( isdefined( self.compassicons[var_0] ) )
                var_5 setwaypoint( 1, 1 );
            else
                var_5 setwaypoint( 1, 0 );

            if ( self.type == "carryObject" )
            {
                if ( isdefined( self.carrier ) && !shouldpingobject( var_0 ) )
                    var_5 settargetent( self.carrier );
                else
                    var_5 cleartargetent();
            }
        }
        else
        {
            var_5 fadeovertime( 0.05 );
            var_5.alpha = 0;
            var_5.isshown = 0;
            var_5 cleartargetent();
        }

        var_5 thread hideworldiconongameend();
    }
}

hideworldiconongameend()
{
    self notify( "hideWorldIconOnGameEnd" );
    self endon( "hideWorldIconOnGameEnd" );
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
        self.alpha = 0;
}

updatetimer( var_0, var_1 )
{

}

updatecompassicons()
{
    if ( self.visibleteam == "any" )
    {
        updatecompassicon( "friendly", 1 );
        updatecompassicon( "enemy", 1 );
    }
    else if ( self.visibleteam == "friendly" )
    {
        updatecompassicon( "friendly", 1 );
        updatecompassicon( "enemy", 0 );
    }
    else if ( self.visibleteam == "enemy" )
    {
        updatecompassicon( "friendly", 0 );
        updatecompassicon( "enemy", 1 );
    }
    else
    {
        updatecompassicon( "friendly", 0 );
        updatecompassicon( "enemy", 0 );
    }
}

updatecompassicon( var_0, var_1 )
{
    var_2 = getupdateteams( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_1;

        if ( !var_4 && shouldshowcompassduetoradar( var_2[var_3] ) )
            var_4 = 1;

        var_5 = self.objidallies;

        if ( var_2[var_3] == "axis" )
            var_5 = self.objidaxis;

        if ( !isdefined( self.compassicons[var_0] ) || !var_4 )
        {
            objective_state( var_5, "invisible" );
            continue;
        }

        objective_icon( var_5, self.compassicons[var_0] );
        objective_state( var_5, "active" );

        if ( self.type == "carryObject" )
        {
            if ( maps\mp\_utility::isreallyalive( self.carrier ) && !shouldpingobject( var_0 ) )
            {
                objective_onentity( var_5, self.carrier );
                continue;
            }

            objective_position( var_5, self.curorigin );
        }
    }
}

shouldpingobject( var_0 )
{
    if ( var_0 == "friendly" && self.objidpingfriendly )
        return 1;
    else if ( var_0 == "enemy" && self.objidpingenemy )
        return 1;

    return 0;
}

getupdateteams( var_0 )
{
    var_1 = [];

    if ( var_0 == "friendly" )
    {
        if ( isfriendlyteam( "allies" ) )
            var_1[0] = "allies";
        else if ( isfriendlyteam( "axis" ) )
            var_1[0] = "axis";
    }
    else if ( var_0 == "enemy" )
    {
        if ( !isfriendlyteam( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( !isfriendlyteam( "axis" ) )
            var_1[var_1.size] = "axis";
    }

    return var_1;
}

shouldshowcompassduetoradar( var_0 )
{
    if ( !isdefined( self.carrier ) )
        return 0;

    if ( self.carrier maps\mp\_utility::_hasperk( "specialty_gpsjammer" ) )
        return 0;

    return getteamradar( var_0 );
}

updatevisibilityaccordingtoradar()
{
    self endon( "death" );
    self endon( "carrier_cleared" );

    for (;;)
    {
        level waittill( "radar_status_change" );
        updatecompassicons();
    }
}

setownerteam( var_0 )
{
    self.ownerteam = var_0;
    updatetrigger();
    updatecompassicons();
    updateworldicons();
}

getownerteam()
{
    return self.ownerteam;
}

setusetime( var_0 )
{
    self.usetime = int( var_0 * 1000 );
}

setusetext( var_0 )
{
    self.usetext = var_0;
}

setteamusetime( var_0, var_1 )
{
    self.teamusetimes[var_0] = int( var_1 * 1000 );
}

setteamusetext( var_0, var_1 )
{
    self.teamusetexts[var_0] = var_1;
}

setusehinttext( var_0 )
{
    self.trigger sethintstring( var_0 );
}

allowcarry( var_0 )
{
    self.interactteam = var_0;
}

allowuse( var_0 )
{
    self.interactteam = var_0;
    updatetrigger();
}

setvisibleteam( var_0 )
{
    self.visibleteam = var_0;
    updatecompassicons();
    updateworldicons();
}

setmodelvisibility( var_0 )
{
    if ( var_0 )
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        {
            self.visuals[var_1] show();

            if ( self.visuals[var_1].classname == "script_brushmodel" || self.visuals[var_1].classname == "script_model" )
            {
                foreach ( var_3 in level.players )
                {
                    if ( var_3 istouching( self.visuals[var_1] ) )
                        var_3 maps\mp\_utility::_suicide();
                }

                self.visuals[var_1] thread makesolid();
            }
        }
    }
    else
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        {
            self.visuals[var_1] hide();

            if ( self.visuals[var_1].classname == "script_brushmodel" || self.visuals[var_1].classname == "script_model" )
            {
                self.visuals[var_1] notify( "changing_solidness" );
                self.visuals[var_1] notsolid();
            }
        }
    }
}

makesolid()
{
    self endon( "death" );
    self notify( "changing_solidness" );
    self endon( "changing_solidness" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        {
            if ( level.players[var_0] istouching( self ) )
                break;
        }

        if ( var_0 == level.players.size )
        {
            self solid();
            break;
        }

        wait 0.05;
    }
}

setcarriervisible( var_0 )
{
    self.carriervisible = var_0;
}

setcanuse( var_0 )
{
    self.useteam = var_0;
}

set2dicon( var_0, var_1 )
{
    self.compassicons[var_0] = var_1;
    updatecompassicons();
}

set3dicon( var_0, var_1 )
{
    self.worldicons[var_0] = var_1;
    updateworldicons();
}

set3duseicon( var_0, var_1 )
{
    self.worlduseicons[var_0] = var_1;
}

setcarryicon( var_0 )
{
    self.carryicon = var_0;
}

disableobject()
{
    self notify( "disabled" );

    if ( self.type == "carryObject" )
    {
        if ( isdefined( self.carrier ) )
            self.carrier takeobject( self );

        for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
            self.visuals[var_0] hide();
    }

    self.trigger common_scripts\utility::trigger_off();
    setvisibleteam( "none" );
}

enableobject()
{
    if ( self.type == "carryObject" )
    {
        for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
            self.visuals[var_0] show();
    }

    self.trigger common_scripts\utility::trigger_on();
    setvisibleteam( "any" );
}

getrelativeteam( var_0 )
{
    if ( var_0 == self.ownerteam )
        return "friendly";
    else
        return "enemy";
}

isfriendlyteam( var_0 )
{
    if ( self.ownerteam == "any" )
        return 1;

    if ( self.ownerteam == var_0 )
        return 1;

    return 0;
}

caninteractwith( var_0, var_1 )
{
    switch ( self.interactteam )
    {
        case "none":
            return 0;
        case "any":
            return 1;
        case "friendly":
            if ( var_0 == self.ownerteam )
                return 1;
            else
                return 0;
        case "enemy":
            if ( var_0 != self.ownerteam )
                return 1;
            else
                return 0;
        default:
            return 0;
    }
}

isteam( var_0 )
{
    if ( var_0 == "neutral" )
        return 1;

    if ( var_0 == "allies" )
        return 1;

    if ( var_0 == "axis" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    return 0;
}

isrelativeteam( var_0 )
{
    if ( var_0 == "friendly" )
        return 1;

    if ( var_0 == "enemy" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    return 0;
}

getenemyteam( var_0 )
{
    if ( var_0 == "neutral" )
        return "none";
    else if ( var_0 == "allies" )
        return "axis";
    else
        return "allies";
}

getnextobjid()
{
    if ( !isdefined( level.reclaimedreservedobjectives ) || level.reclaimedreservedobjectives.size < 1 )
    {
        var_0 = level.numgametypereservedobjectives;
        level.numgametypereservedobjectives++;
    }
    else
    {
        var_0 = level.reclaimedreservedobjectives[level.reclaimedreservedobjectives.size - 1];
        level.reclaimedreservedobjectives[level.reclaimedreservedobjectives.size - 1] = undefined;
    }

    if ( var_0 > 31 )
        var_0 = 31;

    return var_0;
}

getlabel()
{
    var_0 = self.trigger.script_label;

    if ( !isdefined( var_0 ) )
    {
        var_0 = "";
        return var_0;
    }

    if ( var_0[0] != "_" )
        return "_" + var_0;

    return var_0;
}
