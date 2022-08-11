// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachemodel( "vehicle_remote_uav" );
    precachemodel( "test_vehicle_little_bird_toy_placement" );
    precachemodel( "test_vehicle_little_bird_toy_placement_failed" );
    precachevehicle( "remote_uav_mp" );
    precacheitem( "uav_remote_mp" );
    precacheitem( "killstreak_remote_uav_mp" );
    precacheshader( "veh_hud_target" );
    precacheshader( "veh_hud_target_marked" );
    precacheshader( "veh_hud_target_unmarked" );
    precacheshader( "compassping_sentry_enemy" );
    precacheshader( "compassping_enemy_uav" );
    precacheshader( "hud_fofbox_hostile_vehicle" );
    precacherumble( "damage_light" );
    precachestring( &"MP_REMOTE_UAV_PLACE" );
    precachestring( &"MP_REMOTE_UAV_CANNOT_PLACE" );
    precachestring( &"SPLASHES_DESTROYED_REMOTE_UAV" );
    precachestring( &"SPLASHES_MARKED_BY_REMOTE_UAV" );
    precachestring( &"SPLASHES_REMOTE_UAV_MARKED" );
    precachestring( &"SPLASHES_TURRET_MARKED_BY_REMOTE_UAV" );
    precachestring( &"SPLASHES_REMOTE_UAV_ASSIST" );
    level.remoteuav_fx["hit"] = loadfx( "impacts/large_metal_painted_hit" );
    level.remoteuav_fx["smoke"] = loadfx( "smoke/remote_heli_damage_smoke_runner" );
    level.remoteuav_fx["explode"] = loadfx( "explosions/bouncing_betty_explosion" );
    level.remoteuav_fx["missile_explode"] = loadfx( "explosions/stinger_explosion" );
    level.remoteuav_dialog["launch"][0] = "ac130_plt_yeahcleared";
    level.remoteuav_dialog["launch"][1] = "ac130_plt_rollinin";
    level.remoteuav_dialog["launch"][2] = "ac130_plt_scanrange";
    level.remoteuav_dialog["out_of_range"][0] = "ac130_plt_cleanup";
    level.remoteuav_dialog["out_of_range"][1] = "ac130_plt_targetreset";
    level.remoteuav_dialog["track"][0] = "ac130_fco_moreenemy";
    level.remoteuav_dialog["track"][1] = "ac130_fco_getthatguy";
    level.remoteuav_dialog["track"][2] = "ac130_fco_guymovin";
    level.remoteuav_dialog["track"][3] = "ac130_fco_getperson";
    level.remoteuav_dialog["track"][4] = "ac130_fco_guyrunnin";
    level.remoteuav_dialog["track"][5] = "ac130_fco_gotarunner";
    level.remoteuav_dialog["track"][6] = "ac130_fco_backonthose";
    level.remoteuav_dialog["track"][7] = "ac130_fco_gonnagethim";
    level.remoteuav_dialog["track"][8] = "ac130_fco_personnelthere";
    level.remoteuav_dialog["track"][9] = "ac130_fco_rightthere";
    level.remoteuav_dialog["track"][10] = "ac130_fco_tracking";
    level.remoteuav_dialog["tag"][0] = "ac130_fco_nice";
    level.remoteuav_dialog["tag"][1] = "ac130_fco_yougothim";
    level.remoteuav_dialog["tag"][2] = "ac130_fco_yougothim2";
    level.remoteuav_dialog["tag"][3] = "ac130_fco_okyougothim";
    level.remoteuav_dialog["assist"][0] = "ac130_fco_goodkill";
    level.remoteuav_dialog["assist"][1] = "ac130_fco_thatsahit";
    level.remoteuav_dialog["assist"][2] = "ac130_fco_directhit";
    level.remoteuav_dialog["assist"][3] = "ac130_fco_rightontarget";
    level.remoteuav_lastdialogtime = 0;
    level.remoteuav_nodeployzones = getentarray( "no_vehicles", "targetname" );
    level.killstreakfuncs["remote_uav"] = ::useremoteuav;
    level.remote_uav = [];
}

useremoteuav( var_0 )
{
    return tryuseremoteuav( var_0, "remote_uav" );
}

teamhasremoteuav( var_0 )
{
    if ( level.gametype == "dm" )
    {
        if ( isdefined( level.remote_uav[var_0] ) || isdefined( level.remote_uav[level.otherteam[var_0]] ) )
            return 1;
        else
            return 0;
    }
    else if ( isdefined( level.remote_uav[var_0] ) )
        return 1;
    else
        return 0;
}

tryuseremoteuav( var_0, var_1 )
{
    common_scripts\utility::_disableusability();

    if ( maps\mp\_utility::isusingremote() || self isusingturret() || isdefined( level.nukeincoming ) )
    {
        common_scripts\utility::_enableusability();
        return 0;
    }

    var_2 = 1;

    if ( teamhasremoteuav( self.team ) || level.littlebirds.size >= 4 )
    {
        self iprintlnbold( &"MP_AIR_SPACE_TOO_CROWDED" );
        common_scripts\utility::_enableusability();
        return 0;
    }
    else if ( maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount + var_2 >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        common_scripts\utility::_enableusability();
        return 0;
    }

    self setplayerdata( "reconDroneState", "staticAlpha", 0 );
    self setplayerdata( "reconDroneState", "incomingMissile", 0 );
    maps\mp\_utility::incrementfauxvehiclecount();
    var_3 = givecarryremoteuav( var_0, var_1 );

    if ( var_3 )
    {
        maps\mp\_matchdata::logkillstreakevent( var_1, self.origin );
        thread maps\mp\_utility::teamplayercardsplash( "used_remote_uav", self );
    }
    else
        maps\mp\_utility::decrementfauxvehiclecount();

    self.iscarrying = 0;
    return var_3;
}

givecarryremoteuav( var_0, var_1 )
{
    var_2 = createcarryremoteuav( var_1, self );
    self takeweapon( "killstreak_uav_mp" );
    maps\mp\_utility::_giveweapon( "killstreak_remote_uav_mp" );
    self switchtoweaponimmediate( "killstreak_remote_uav_mp" );
    setcarryingremoteuav( var_2 );

    if ( isalive( self ) && isdefined( var_2 ) )
    {
        var_3 = var_2.origin;
        var_4 = self.angles;
        var_2.carriedremoteuav delete();
        var_2 delete();
        var_5 = startremoteuav( var_0, var_1, var_3, var_4 );
    }
    else
    {
        var_5 = 0;

        if ( isalive( self ) )
        {
            self takeweapon( "killstreak_remote_uav_mp" );
            maps\mp\_utility::_giveweapon( "killstreak_uav_mp" );
        }
    }

    return var_5;
}

createcarryremoteuav( var_0, var_1 )
{
    var_2 = var_1.origin + anglestoforward( var_1.angles ) * 4 + anglestoup( var_1.angles ) * 50;
    var_3 = spawnturret( "misc_turret", var_2, "sentry_minigun_mp" );
    var_3.origin = var_2;
    var_3.angles = var_1.angles;
    var_3.sentrytype = "sentry_minigun";
    var_3.canbeplaced = 1;
    var_3 setturretmodechangewait( 1 );
    var_3 setmode( "sentry_offline" );
    var_3 makeunusable();
    var_3 maketurretinoperable();
    var_3.owner = var_1;
    var_3 setsentryowner( var_3.owner );
    var_3.scale = 3;
    var_3.inheliproximity = 0;
    var_3 thread carryremoteuav_handleexistence();
    var_3.rangetrigger = getent( "remote_uav_range", "targetname" );

    if ( !isdefined( var_3.rangetrigger ) )
    {
        var_4 = getent( "airstrikeheight", "targetname" );
        var_3.maxheight = var_4.origin[2];
        var_3.maxdistance = 3600;
    }

    var_3.carriedremoteuav = spawn( "script_origin", var_3.origin );
    var_3.carriedremoteuav.angles = var_3.angles;
    var_3.carriedremoteuav.origin = var_3.origin;
    var_3.carriedremoteuav linkto( var_3 );
    var_3.carriedremoteuav playloopsound( "recondrone_idle_high" );
    return var_3;
}

setcarryingremoteuav( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    thread carryremoteuav_ondisconnect( var_0 );
    var_0 thread carryremoteuav_setcarried( self );
    self notifyonplayercommand( "place_carryRemoteUAV", "+attack" );
    self notifyonplayercommand( "place_carryRemoteUAV", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_carryRemoteUAV", "+actionslot 4" );

    for (;;)
    {
        var_1 = common_scripts\utility::waittill_any_return( "place_carryRemoteUAV", "cancel_carryRemoteUAV", "weapon_switch_started", "force_cancel_placement" );
        self forceusehintoff();

        if ( var_1 != "place_carryRemoteUAV" )
        {
            self.iscarrying = 0;
            var_0.carriedremoteuav delete();
            var_0 delete();
            break;
        }

        if ( !var_0.canbeplaced )
        {
            if ( self.team != "spectator" )
                self forceusehinton( &"MP_REMOTE_UAV_CANNOT_PLACE" );

            continue;
        }

        if ( isdefined( level.nukeincoming ) || maps\mp\_utility::isemped() || teamhasremoteuav( self.team ) || maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount >= maps\mp\_utility::maxvehiclesallowed() )
        {
            if ( isdefined( level.nukeincoming ) || maps\mp\_utility::isemped() )
                self iprintlnbold( &"MP_UNAVAILABLE_FOR_N_WHEN_EMP", level.emptimeremaining );
            else
                self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );

            self.iscarrying = 0;
            var_0.carriedremoteuav delete();
            var_0 delete();
            break;
        }

        self.iscarrying = 0;
        var_0.carriedby = undefined;
        var_0 playsound( "sentry_gun_plant" );
        var_0 notify( "placed" );
        break;
    }

    common_scripts\utility::_enableusability();
}

carryremoteuav_setcarried( var_0 )
{
    self setcandamage( 0 );
    self setsentrycarrier( var_0 );
    self setcontents( 0 );
    self.carriedby = var_0;
    var_0.iscarrying = 1;
    var_0 thread updatecarryremoteuavplacement( self );
    self notify( "carried" );
}

carryremoteuav_ondisconnect( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "place_carryRemoteUAV" );
    self endon( "cancel_carryRemoteUAV" );
    self endon( "weapon_switch_started" );
    self endon( "force_cancel_placement" );
    self waittill( "disconnect" );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.carriedremoteuav ) )
            var_0.carriedremoteuav delete();

        var_0 delete();
    }
}

isinremotenodeploy()
{
    if ( isdefined( level.remoteuav_nodeployzones ) && level.remoteuav_nodeployzones.size )
    {
        foreach ( var_1 in level.remoteuav_nodeployzones )
        {
            if ( self istouching( var_1 ) )
                return 1;
        }
    }

    return 0;
}

updatecarryremoteuavplacement( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0.canbeplaced = 1;
    var_1 = -1;

    for (;;)
    {
        var_2 = 18;

        switch ( self getstance() )
        {
            case "stand":
                var_2 = 40;
                break;
            case "crouch":
                var_2 = 25;
                break;
            case "prone":
                var_2 = 10;
                break;
        }

        var_3 = self canplayerplacetank( 22, 22, 50, var_2, 0, 0 );
        var_0.origin = var_3["origin"] + anglestoup( self.angles ) * 27;
        var_0.angles = var_3["angles"];
        var_0.canbeplaced = self isonground() && var_3["result"] && var_0 remoteuav_in_range() && !var_0 isinremotenodeploy();

        if ( var_0.canbeplaced != var_1 )
        {
            if ( var_0.canbeplaced )
            {
                if ( self.team != "spectator" )
                    self forceusehinton( &"MP_REMOTE_UAV_PLACE" );

                if ( self attackbuttonpressed() )
                    self notify( "place_carryRemoteUAV" );
            }
            else if ( self.team != "spectator" )
                self forceusehinton( &"MP_REMOTE_UAV_CANNOT_PLACE" );
        }

        var_1 = var_0.canbeplaced;
        wait 0.05;
    }
}

carryremoteuav_handleexistence()
{
    level endon( "game_ended" );
    self.owner endon( "place_carryRemoteUAV" );
    self.owner endon( "cancel_carryRemoteUAV" );
    self.owner common_scripts\utility::waittill_any( "death", "disconnect", "joined_team", "joined_spectators" );

    if ( isdefined( self ) )
        self delete();
}

removeremoteweapon()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    wait 0.7;
}

startremoteuav( var_0, var_1, var_2, var_3 )
{
    lockplayerforremoteuavlaunch();
    maps\mp\_utility::setusingremote( var_1 );
    maps\mp\_utility::_giveweapon( "uav_remote_mp" );
    self switchtoweaponimmediate( "uav_remote_mp" );
    self visionsetnakedforplayer( "black_bw", 0.0 );
    var_4 = maps\mp\killstreaks\_killstreaks::initridekillstreak( "remote_uav" );

    if ( var_4 != "success" )
    {
        if ( var_4 != "disconnect" )
        {
            self notify( "remoteuav_unlock" );
            self takeweapon( "uav_remote_mp" );
            maps\mp\_utility::clearusingremote();
        }

        return 0;
    }

    if ( teamhasremoteuav( self.team ) || maps\mp\_utility::currentactivevehiclecount() >= maps\mp\_utility::maxvehiclesallowed() || level.fauxvehiclecount >= maps\mp\_utility::maxvehiclesallowed() )
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        self notify( "remoteuav_unlock" );
        self takeweapon( "uav_remote_mp" );
        maps\mp\_utility::clearusingremote();
        return 0;
    }

    self notify( "remoteuav_unlock" );
    var_5 = createremoteuav( var_0, self, var_1, var_2, var_3 );

    if ( isdefined( var_5 ) )
    {
        thread remoteuav_ride( var_0, var_5, var_1 );
        return 1;
    }
    else
    {
        self iprintlnbold( &"MP_TOO_MANY_VEHICLES" );
        self takeweapon( "uav_remote_mp" );
        maps\mp\_utility::clearusingremote();
        return 0;
    }
}

remoteuav_clearrideintro()
{
    if ( isdefined( level.nukedetonated ) )
        self visionsetnakedforplayer( level.nukevisionset, 0 );
    else
        self visionsetnakedforplayer( "", 0 );
}

lockplayerforremoteuavlaunch()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 hide();
    self playerlinkto( var_0 );
    thread clearplayerlockfromremoteuavlaunch( var_0 );
}

clearplayerlockfromremoteuavlaunch( var_0 )
{
    level endon( "game_ended" );
    var_1 = common_scripts\utility::waittill_any_return( "disconnect", "death", "remoteuav_unlock" );

    if ( var_1 != "disconnect" )
        self unlink();

    var_0 delete();
}

createremoteuav( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnhelicopter( var_1, var_3, var_4, "remote_uav_mp", "vehicle_remote_uav" );

    if ( !isdefined( var_5 ) )
        return undefined;

    var_5 maps\mp\killstreaks\_helicopter::addtolittlebirdlist();
    var_5 thread maps\mp\killstreaks\_helicopter::removefromlittlebirdlistondeath();
    var_5 makevehiclesolidcapsule( 18, -9, 18 );
    var_5.lifeid = var_0;
    var_5.team = var_1.team;
    var_5.pers["team"] = var_1.team;
    var_5.owner = var_1;
    var_5.health = 999999;
    var_5.maxhealth = 250;
    var_5.damagetaken = 0;
    var_5.destroyed = 0;
    var_5 setcandamage( 1 );
    var_5.specialdamagecallback = ::callback_vehicledamage;
    var_5.scrambler = spawn( "script_model", var_3 );
    var_5.scrambler linkto( var_5, "tag_origin", ( 0.0, 0.0, -160.0 ), ( 0.0, 0.0, 0.0 ) );
    var_5.scrambler makescrambler( var_1 );
    var_5.smoking = 0;
    var_5.inheliproximity = 0;
    var_5.helitype = "remote_uav";
    var_5.markedplayers = [];
    var_5 thread remoteuav_light_fx();
    var_5 thread remoteuav_explode_on_disconnect();
    var_5 thread remoteuav_explode_on_changeteams();
    var_5 thread remoteuav_explode_on_death();
    var_5 thread remoteuav_clear_marked_on_gameended();
    var_5 thread remoteuav_leave_on_timeout();
    var_5 thread remoteuav_watch_distance();
    var_5 thread remoteuav_watchheliproximity();
    var_5 thread remoteuav_handledamage();
    var_5.numflares = 2;
    var_5.hasincoming = 0;
    var_5.incomingmissiles = [];
    var_5 thread remoteuav_clearincomingwarning();
    var_5 thread remoteuav_handleincomingstinger();
    var_5 thread remoteuav_handleincomingsam();
    level.remote_uav[var_5.team] = var_5;
    return var_5;
}

remoteuav_ride( var_0, var_1, var_2 )
{
    var_1.playerlinked = 1;
    self.restoreangles = self.angles;

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::setthirdpersondof( 0 );

    if ( maps\mp\_utility::isjuggernaut() )
        self.juggernautoverlay.alpha = 0;

    if ( isdefined( self.haslightarmor ) )
        self.combathighoverlay.alpha = 0;

    self cameralinkto( var_1, "tag_origin" );
    self remotecontrolvehicle( var_1 );
    thread remoteuav_playerexit( var_1 );
    thread remoteuav_track( var_1 );
    thread remoteuav_fire( var_1 );
    self.remote_uav_ridelifeid = var_0;
    self.remoteuav = var_1;
    thread remoteuav_delaylaunchdialog( var_1 );
    self visionsetnakedforplayer( "black_bw", 0.0 );

    if ( isdefined( level.nukedetonated ) )
        self visionsetnakedforplayer( level.nukevisionset, 1 );
    else
        self visionsetnakedforplayer( "", 1 );
}

remoteuav_delaylaunchdialog( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    var_0 endon( "end_launch_dialog" );
    wait 3;
    remoteuav_dialog( "launch" );
}

remoteuav_endride( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_0.playerlinked = 0;
        var_0 notify( "end_remote" );
        maps\mp\_utility::clearusingremote();

        if ( getdvarint( "camera_thirdPerson" ) )
            maps\mp\_utility::setthirdpersondof( 1 );

        if ( maps\mp\_utility::isjuggernaut() )
            self.juggernautoverlay.alpha = 1;

        if ( isdefined( self.haslightarmor ) )
            self.combathighoverlay.alpha = 1;

        self cameraunlink( var_0 );
        self remotecontrolvehicleoff( var_0 );
        self thermalvisionoff();
        self setplayerangles( self.restoreangles );
        self switchtoweapon( common_scripts\utility::getlastweapon() );
        self takeweapon( "uav_remote_mp" );
        thread remoteuav_freezebuffer();
    }

    self.remoteuav = undefined;
}

remoteuav_freezebuffer()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    maps\mp\_utility::freezecontrolswrapper( 1 );
    wait 0.5;
    maps\mp\_utility::freezecontrolswrapper( 0 );
}

remoteuav_playerexit( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    wait 2;

    for (;;)
    {
        var_1 = 0;

        while ( self usebuttonpressed() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.75 )
            {
                var_0 thread remoteuav_leave();
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

remoteuav_track( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    var_0.lasttrackingdialogtime = 0;
    self.lockedtarget = undefined;
    self weaponlockfree();
    wait 1;

    for (;;)
    {
        var_1 = var_0 gettagorigin( "tag_turret" );
        var_2 = anglestoforward( self getplayerangles() );
        var_3 = var_1 + var_2 * 1024;
        var_4 = bullettrace( var_1, var_3, 1, var_0 );

        if ( isdefined( var_4["position"] ) )
            var_5 = var_4["position"];
        else
        {
            var_5 = var_3;
            var_4["endpos"] = var_3;
        }

        var_0.trace = var_4;
        var_6 = remoteuav_trackentities( var_0, level.players, var_5 );
        var_7 = remoteuav_trackentities( var_0, level.turrets, var_5 );
        var_8 = undefined;

        if ( level.teambased )
            var_8 = remoteuav_trackentities( var_0, level.uavmodels[level.otherteam[self.team]], var_5 );
        else
            var_8 = remoteuav_trackentities( var_0, level.uavmodels, var_5 );

        var_9 = undefined;

        if ( isdefined( var_6 ) )
            var_9 = var_6;
        else if ( isdefined( var_7 ) )
            var_9 = var_7;
        else if ( isdefined( var_8 ) )
            var_9 = var_8;

        if ( isdefined( var_9 ) )
        {
            if ( !isdefined( self.lockedtarget ) || isdefined( self.lockedtarget ) && self.lockedtarget != var_9 )
            {
                self weaponlockfinalize( var_9 );
                self.lockedtarget = var_9;

                if ( isdefined( var_6 ) )
                {
                    var_0 notify( "end_launch_dialog" );
                    remoteuav_dialog( "track" );
                }
            }
        }
        else
        {
            self weaponlockfree();
            self.lockedtarget = undefined;
        }

        wait 0.05;
    }
}

remoteuav_trackentities( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( level.teambased && ( !isdefined( var_5.team ) || var_5.team == self.team ) )
            continue;

        if ( isplayer( var_5 ) )
        {
            if ( !maps\mp\_utility::isreallyalive( var_5 ) )
                continue;

            if ( var_5 == self )
                continue;

            var_6 = var_5.guid;
        }
        else
            var_6 = var_5.birthtime;

        if ( isdefined( var_5.sentrytype ) || isdefined( var_5.turrettype ) )
        {
            var_7 = ( 0.0, 0.0, 32.0 );
            var_8 = "hud_fofbox_hostile_vehicle";
        }
        else if ( isdefined( var_5.uavtype ) )
        {
            var_7 = ( 0.0, 0.0, -52.0 );
            var_8 = "hud_fofbox_hostile_vehicle";
        }
        else
        {
            var_7 = ( 0.0, 0.0, 26.0 );
            var_8 = "veh_hud_target_unmarked";
        }

        if ( isdefined( var_5.uavremotemarkedby ) )
        {
            if ( !isdefined( var_0.markedplayers[var_6] ) )
            {
                var_0.markedplayers[var_6] = [];
                var_0.markedplayers[var_6]["player"] = var_5;
                var_0.markedplayers[var_6]["icon"] = var_5 maps\mp\_entityheadicons::setheadicon( self, "veh_hud_target_marked", var_7, 10, 10, 0, 0.05, 0, 0, 0, 0 );
                var_0.markedplayers[var_6]["icon"].shader = "veh_hud_target_marked";

                if ( !isdefined( var_5.sentrytype ) || !isdefined( var_5.turrettype ) )
                    var_0.markedplayers[var_6]["icon"] settargetent( var_5 );
            }
            else if ( isdefined( var_0.markedplayers[var_6] ) && isdefined( var_0.markedplayers[var_6]["icon"] ) && isdefined( var_0.markedplayers[var_6]["icon"].shader ) && var_0.markedplayers[var_6]["icon"].shader != "veh_hud_target_marked" )
            {
                var_0.markedplayers[var_6]["icon"].shader = "veh_hud_target_marked";
                var_0.markedplayers[var_6]["icon"] setshader( "veh_hud_target_marked", 10, 10 );
                var_0.markedplayers[var_6]["icon"] setwaypoint( 0, 0, 0, 0 );
            }

            continue;
        }

        if ( isplayer( var_5 ) )
        {
            var_9 = isdefined( var_5.spawntime ) && ( gettime() - var_5.spawntime ) / 1000 <= 5;
            var_10 = var_5 maps\mp\_utility::_hasperk( "specialty_blindeye" );
            var_11 = 0;
            var_12 = 0;
        }
        else
        {
            var_9 = 0;
            var_10 = 0;
            var_11 = isdefined( var_5.carriedby );
            var_12 = isdefined( var_5.isleaving ) && var_5.isleaving == 1;
        }

        if ( !isdefined( var_0.markedplayers[var_6] ) && !var_9 && !var_10 && !var_11 && !var_12 )
        {
            var_0.markedplayers[var_6] = [];
            var_0.markedplayers[var_6]["player"] = var_5;
            var_0.markedplayers[var_6]["icon"] = var_5 maps\mp\_entityheadicons::setheadicon( self, var_8, var_7, 10, 10, 0, 0.05, 0, 0, 0, 0 );
            var_0.markedplayers[var_6]["icon"].shader = var_8;

            if ( !isdefined( var_5.sentrytype ) || !isdefined( var_5.turrettype ) )
                var_0.markedplayers[var_6]["icon"] settargetent( var_5 );
        }

        if ( ( !isdefined( var_3 ) || var_3 != var_5 ) && ( isdefined( var_0.trace["entity"] ) && var_0.trace["entity"] == var_5 && !var_11 && !var_12 ) || distance( var_5.origin, var_2 ) < 200 * var_0.trace["fraction"] && !var_9 && !var_11 && !var_12 || !var_12 && remoteuav_cantargetuav( var_0, var_5 ) )
        {
            var_13 = bullettrace( var_0.origin, var_5.origin + ( 0.0, 0.0, 32.0 ), 1, var_0 );

            if ( isdefined( var_13["entity"] ) && var_13["entity"] == var_5 || var_13["fraction"] == 1 )
            {
                self playlocalsound( "recondrone_lockon" );
                var_3 = var_5;
            }
        }
    }

    return var_3;
}

remoteuav_cantargetuav( var_0, var_1 )
{
    if ( isdefined( var_1.uavtype ) )
    {
        var_2 = anglestoforward( self getplayerangles() );
        var_3 = vectornormalize( var_1.origin - var_0 gettagorigin( "tag_turret" ) );
        var_4 = vectordot( var_2, var_3 );

        if ( var_4 > 0.985 )
            return 1;
    }

    return 0;
}

remoteuav_fire( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "end_remote" );
    wait 1;
    self notifyonplayercommand( "remoteUAV_tag", "+attack" );
    self notifyonplayercommand( "remoteUAV_tag", "+attack_akimbo_accessible" );

    for (;;)
    {
        self waittill( "remoteUAV_tag" );

        if ( isdefined( self.lockedtarget ) )
        {
            self playlocalsound( "recondrone_tag" );
            maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "" );
            thread remoteuav_markplayer( self.lockedtarget );
            thread remoteuav_rumble( var_0, 3 );
            wait 0.25;
            continue;
        }

        wait 0.05;
    }
}

remoteuav_rumble( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "end_remote" );
    var_0 notify( "end_rumble" );
    var_0 endon( "end_rumble" );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self playrumbleonentity( "damage_heavy" );
        wait 0.05;
    }
}

remoteuav_markplayer( var_0 )
{
    level endon( "game_ended" );
    var_0.uavremotemarkedby = self;

    if ( isplayer( var_0 ) && !var_0 maps\mp\_utility::isusingremote() )
    {
        var_0 playlocalsound( "player_hit_while_ads_hurt" );
        var_0 thread maps\mp\_flashgrenades::applyflash( 2.0, 1.0 );
        var_0 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_MARKED_BY_REMOTE_UAV" );
    }
    else if ( isdefined( var_0.uavtype ) )
        var_0.birth_time = var_0.birthtime;
    else if ( isdefined( var_0.owner ) && isalive( var_0.owner ) )
        var_0.owner thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_TURRET_MARKED_BY_REMOTE_UAV" );

    remoteuav_dialog( "tag" );
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_REMOTE_UAV_MARKED" );

    if ( level.gametype != "dm" )
    {
        if ( isplayer( var_0 ) )
        {
            maps\mp\gametypes\_gamescore::giveplayerscore( "kill", self, undefined, 1 );
            thread maps\mp\gametypes\_rank::giverankxp( "kill" );
        }
    }

    if ( isplayer( var_0 ) )
        var_0 setperk( "specialty_radarblip", 1, 0 );
    else
    {
        if ( isdefined( var_0.uavtype ) )
            var_1 = "compassping_enemy_uav";
        else
            var_1 = "compassping_sentry_enemy";

        if ( level.teambased )
        {
            var_2 = maps\mp\gametypes\_gameobjects::getnextobjid();
            objective_add( var_2, "invisible", ( 0.0, 0.0, 0.0 ) );
            objective_onentity( var_2, var_0 );
            objective_state( var_2, "active" );
            objective_team( var_2, self.team );
            objective_icon( var_2, var_1 );
            var_0.remoteuavmarkedobjid01 = var_2;
        }
        else
        {
            var_2 = maps\mp\gametypes\_gameobjects::getnextobjid();
            objective_add( var_2, "invisible", ( 0.0, 0.0, 0.0 ) );
            objective_onentity( var_2, var_0 );
            objective_state( var_2, "active" );
            objective_team( var_2, level.otherteam[self.team] );
            objective_icon( var_2, var_1 );
            var_0.remoteuavmarkedobjid02 = var_2;
            var_2 = maps\mp\gametypes\_gameobjects::getnextobjid();
            objective_add( var_2, "invisible", ( 0.0, 0.0, 0.0 ) );
            objective_onentity( var_2, var_0 );
            objective_state( var_2, "active" );
            objective_team( var_2, self.team );
            objective_icon( var_2, var_1 );
            var_0.remoteuavmarkedobjid03 = var_2;
        }
    }

    var_0 thread remoteuav_unmarkremovedplayer( self.remoteuav );
}

remoteuav_processtaggedassist( var_0 )
{
    remoteuav_dialog( "assist" );
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_REMOTE_UAV_ASSIST" );

    if ( level.gametype != "dm" )
    {
        self.taggedassist = 1;

        if ( isdefined( var_0 ) )
            thread maps\mp\gametypes\_gamescore::processassist( var_0 );
        else
        {
            maps\mp\gametypes\_gamescore::giveplayerscore( "assist", self, undefined, 1 );
            thread maps\mp\gametypes\_rank::giverankxp( "assist" );
        }
    }
}

remoteuav_unmarkremovedplayer( var_0 )
{
    level endon( "game_ended" );
    var_1 = common_scripts\utility::waittill_any_return( "death", "disconnect", "carried", "leaving" );

    if ( var_1 == "leaving" || !isdefined( self.uavtype ) )
        self.uavremotemarkedby = undefined;

    if ( isdefined( var_0 ) )
    {
        if ( isplayer( self ) )
            var_2 = self.guid;
        else if ( isdefined( self.birthtime ) )
            var_2 = self.birthtime;
        else
            var_2 = self.birth_time;

        if ( var_1 == "carried" || var_1 == "leaving" )
        {
            var_0.markedplayers[var_2]["icon"] destroy();
            var_0.markedplayers[var_2]["icon"] = undefined;
        }

        if ( isdefined( var_2 ) && isdefined( var_0.markedplayers[var_2] ) )
        {
            var_0.markedplayers[var_2] = undefined;
            var_0.markedplayers = common_scripts\utility::array_removeundefined( var_0.markedplayers );
        }
    }

    if ( isplayer( self ) )
        self unsetperk( "specialty_radarblip", 1 );
    else
    {
        if ( isdefined( self.remoteuavmarkedobjid01 ) )
            maps\mp\_utility::_objective_delete( self.remoteuavmarkedobjid01 );

        if ( isdefined( self.remoteuavmarkedobjid02 ) )
            maps\mp\_utility::_objective_delete( self.remoteuavmarkedobjid02 );

        if ( isdefined( self.remoteuavmarkedobjid03 ) )
            maps\mp\_utility::_objective_delete( self.remoteuavmarkedobjid03 );
    }
}

remoteuav_clearmarkedforowner()
{
    foreach ( var_1 in self.markedplayers )
    {
        if ( isdefined( var_1["icon"] ) )
        {
            var_1["icon"] destroy();
            var_1["icon"] = undefined;
        }
    }

    self.markedplayers = undefined;
}

remoteuav_operationrumble( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "end_remote" );

    for (;;)
    {
        self playrumbleonentity( "damage_light" );
        wait 0.5;
    }
}

remoteuav_watch_distance()
{
    self endon( "death" );
    self.rangetrigger = getent( "remote_uav_range", "targetname" );

    if ( !isdefined( self.rangetrigger ) )
    {
        var_0 = getent( "airstrikeheight", "targetname" );
        self.maxheight = var_0.origin[2];
        self.maxdistance = 12800;
    }

    self.centerref = spawn( "script_model", level.mapcenter );
    var_1 = self.origin;
    self.rangecountdownactive = 0;

    for (;;)
    {
        if ( !remoteuav_in_range() )
        {
            var_2 = 0;

            while ( !remoteuav_in_range() )
            {
                self.owner remoteuav_dialog( "out_of_range" );

                if ( !self.rangecountdownactive )
                {
                    self.rangecountdownactive = 1;
                    thread remoteuav_rangecountdown();
                }

                if ( isdefined( self.heliinproximity ) )
                {
                    var_3 = distance( self.origin, self.heliinproximity.origin );
                    var_2 = 1 - ( var_3 - 150 ) / 150;
                }
                else
                {
                    var_3 = distance( self.origin, var_1 );
                    var_2 = min( 1, var_3 / 200 );
                }

                self.owner setplayerdata( "reconDroneState", "staticAlpha", var_2 );
                wait 0.05;
            }

            self notify( "in_range" );
            self.rangecountdownactive = 0;
            thread remoteuav_staticfade( var_2 );
        }

        var_1 = self.origin;
        wait 0.05;
    }
}

remoteuav_in_range()
{
    if ( isdefined( self.rangetrigger ) )
    {
        if ( !self istouching( self.rangetrigger ) && !self.inheliproximity )
            return 1;
    }
    else if ( distance2d( self.origin, level.mapcenter ) < self.maxdistance && self.origin[2] < self.maxheight && !self.inheliproximity )
        return 1;

    return 0;
}

remoteuav_staticfade( var_0 )
{
    self endon( "death" );

    while ( remoteuav_in_range() )
    {
        var_0 -= 0.05;

        if ( var_0 < 0 )
        {
            self.owner setplayerdata( "reconDroneState", "staticAlpha", 0 );
            break;
        }

        self.owner setplayerdata( "reconDroneState", "staticAlpha", var_0 );
        wait 0.05;
    }
}

remoteuav_rangecountdown()
{
    self endon( "death" );
    self endon( "in_range" );

    if ( isdefined( self.heliinproximity ) )
        var_0 = 3;
    else
        var_0 = 6;

    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self notify( "death" );
}

remoteuav_explode_on_disconnect()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self notify( "death" );
}

remoteuav_explode_on_changeteams()
{
    self endon( "death" );
    self.owner common_scripts\utility::waittill_any( "joined_team", "joined_spectators" );
    self notify( "death" );
}

remoteuav_clear_marked_on_gameended()
{
    self endon( "death" );
    level waittill( "game_ended" );
    remoteuav_clearmarkedforowner();
}

remoteuav_leave_on_timeout()
{
    self endon( "death" );
    var_0 = 60.0;
    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread remoteuav_leave();
}

remoteuav_leave()
{
    level endon( "game_ended" );
    self endon( "death" );
    self notify( "leaving" );
    self.owner remoteuav_endride( self );
    self notify( "death" );
}

remoteuav_explode_on_death()
{
    level endon( "game_ended" );
    self waittill( "death" );
    self playsound( "recondrone_destroyed" );
    playfx( level.remoteuav_fx["explode"], self.origin );
    remoteuav_cleanup();
}

remoteuav_cleanup()
{
    if ( self.playerlinked == 1 && isdefined( self.owner ) )
        self.owner remoteuav_endride( self );

    if ( isdefined( self.scrambler ) )
        self.scrambler delete();

    if ( isdefined( self.centerref ) )
        self.centerref delete();

    remoteuav_clearmarkedforowner();
    stopfxontag( level.remoteuav_fx["smoke"], self, "tag_origin" );
    level.remote_uav[self.team] = undefined;
    maps\mp\_utility::decrementfauxvehiclecount();
    self delete();
}

remoteuav_light_fx()
{
    playfxontag( level.chopper_fx["light"]["belly"], self, "tag_light_nose" );
    wait 0.05;
    playfxontag( level.chopper_fx["light"]["tail"], self, "tag_light_tail1" );
}

remoteuav_dialog( var_0 )
{
    if ( var_0 == "tag" )
        var_1 = 1000;
    else
        var_1 = 5000;

    if ( gettime() - level.remoteuav_lastdialogtime < var_1 )
        return;

    level.remoteuav_lastdialogtime = gettime();
    var_2 = randomint( level.remoteuav_dialog[var_0].size );
    var_3 = level.remoteuav_dialog[var_0][var_2];
    var_4 = maps\mp\gametypes\_teams::getteamvoiceprefix( self.team ) + var_3;
    self playlocalsound( var_4 );
}

remoteuav_handleincomingstinger()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        level waittill( "stinger_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_1 ) || !isdefined( var_2 ) || var_2 != self )
            continue;

        self.owner playlocalsound( "javelin_clu_lock" );
        self.owner setplayerdata( "reconDroneState", "incomingMissile", 1 );
        self.hasincoming = 1;
        self.incomingmissiles[self.incomingmissiles.size] = var_1;
        var_1.owner = var_0;
        var_1 thread watchstingerproximity( var_2 );
    }
}

remoteuav_handleincomingsam()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        level waittill( "sam_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        var_3 = 0;

        foreach ( var_5 in var_1 )
        {
            if ( isdefined( var_5 ) )
            {
                self.incomingmissiles[self.incomingmissiles.size] = var_5;
                var_5.owner = var_0;
                var_3++;
            }
        }

        if ( var_3 )
        {
            self.owner playlocalsound( "javelin_clu_lock" );
            self.owner setplayerdata( "reconDroneState", "incomingMissile", 1 );
            self.hasincoming = 1;
            level thread watchsamproximity( var_2, var_1 );
        }
    }
}

watchstingerproximity( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self missile_settargetent( var_0 );
    var_1 = vectornormalize( var_0.origin - self.origin );

    while ( isdefined( var_0 ) )
    {
        var_2 = var_0 getpointinbounds( 0, 0, 0 );
        var_3 = distance( self.origin, var_2 );

        if ( var_0.numflares > 0 && var_3 < 4000 )
        {
            var_4 = var_0 deployflares();
            self missile_settargetent( var_4 );
            return;
        }
        else
        {
            var_5 = vectornormalize( var_0.origin - self.origin );

            if ( vectordot( var_5, var_1 ) < 0 )
            {
                self playsound( "exp_stinger_armor_destroy" );
                playfx( level.remoteuav_fx["missile_explode"], self.origin );

                if ( isdefined( self.owner ) )
                    radiusdamage( self.origin, 400, 1000, 1000, self.owner, "MOD_EXPLOSIVE", "stinger_mp" );
                else
                    radiusdamage( self.origin, 400, 1000, 1000, undefined, "MOD_EXPLOSIVE", "stinger_mp" );

                self hide();
                wait 0.05;
                self delete();
            }
            else
                var_1 = var_5;
        }

        wait 0.05;
    }
}

watchsamproximity( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) )
        {
            var_3 missile_settargetent( var_0 );
            var_3.lastvectotarget = vectornormalize( var_0.origin - var_3.origin );
        }
    }

    while ( var_1.size && isdefined( var_0 ) )
    {
        var_5 = var_0 getpointinbounds( 0, 0, 0 );

        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3 ) )
            {
                if ( isdefined( self.markfordetete ) )
                {
                    self delete();
                    continue;
                }

                if ( var_0.numflares > 0 )
                {
                    var_7 = distance( var_3.origin, var_5 );

                    if ( var_7 < 4000 )
                    {
                        var_8 = var_0 deployflares();

                        foreach ( var_10 in var_1 )
                        {
                            if ( isdefined( var_10 ) )
                                var_10 missile_settargetent( var_8 );
                        }

                        return;
                    }

                    continue;
                }

                var_12 = vectornormalize( var_0.origin - var_3.origin );

                if ( vectordot( var_12, var_3.lastvectotarget ) < 0 )
                {
                    var_3 playsound( "exp_stinger_armor_destroy" );
                    playfx( level.remoteuav_fx["missile_explode"], var_3.origin );

                    if ( isdefined( var_3.owner ) )
                        radiusdamage( var_3.origin, 400, 1000, 1000, var_3.owner, "MOD_EXPLOSIVE", "stinger_mp" );
                    else
                        radiusdamage( var_3.origin, 400, 1000, 1000, undefined, "MOD_EXPLOSIVE", "stinger_mp" );

                    var_3 hide();
                    var_3.markfordetete = 1;
                }
                else
                    var_3.lastvectotarget = var_12;
            }
        }

        var_1 = common_scripts\utility::array_removeundefined( var_1 );
        wait 0.05;
    }
}

deployflares()
{
    self.numflares--;
    self.owner thread remoteuav_rumble( self, 6 );
    self playsound( "WEAP_SHOTGUNATTACH_FIRE_NPC" );
    thread playflarefx();
    var_0 = self.origin + ( 0.0, 0.0, -100.0 );
    var_1 = spawn( "script_origin", var_0 );
    var_1.angles = self.angles;
    var_1 movegravity( ( 0.0, 0.0, -1.0 ), 5.0 );
    var_1 thread deleteaftertime( 5.0 );
    return var_1;
}

playflarefx()
{
    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        if ( !isdefined( self ) )
            return;

        playfxontag( level._effect["ac130_flare"], self, "TAG_FLARE" );
        wait 0.15;
    }
}

deleteaftertime( var_0 )
{
    wait(var_0);
    self delete();
}

remoteuav_clearincomingwarning()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < self.incomingmissiles.size; var_1++ )
        {
            if ( isdefined( self.incomingmissiles[var_1] ) && missile_isincoming( self.incomingmissiles[var_1], self ) )
                var_0++;
        }

        if ( self.hasincoming && !var_0 )
        {
            self.hasincoming = 0;
            self.owner setplayerdata( "reconDroneState", "incomingMissile", 0 );
        }

        self.incomingmissiles = common_scripts\utility::array_removeundefined( self.incomingmissiles );
        wait 0.05;
    }
}

missile_isincoming( var_0, var_1 )
{
    var_2 = vectornormalize( var_1.origin - var_0.origin );
    var_3 = anglestoforward( var_0.angles );
    return vectordot( var_2, var_3 ) > 0;
}

remoteuav_watchheliproximity()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        var_0 = 0;

        foreach ( var_2 in level.helis )
        {
            if ( distance( var_2.origin, self.origin ) < 300 )
            {
                var_0 = 1;
                self.heliinproximity = var_2;
            }
        }

        foreach ( var_5 in level.littlebirds )
        {
            if ( var_5 != self && ( !isdefined( var_5.helitype ) || var_5.helitype != "remote_uav" ) && distance( var_5.origin, self.origin ) < 300 )
            {
                var_0 = 1;
                self.heliinproximity = var_5;
            }
        }

        if ( !self.inheliproximity && var_0 )
            self.inheliproximity = 1;
        else if ( self.inheliproximity && !var_0 )
        {
            self.inheliproximity = 0;
            self.heliinproximity = undefined;
        }

        wait 0.05;
    }
}

remoteuav_handledamage()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( self.specialdamagecallback ) )
            self [[ self.specialdamagecallback ]]( undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7 );
    }
}

callback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( self.destroyed == 1 )
        return;

    var_12 = self.team;

    if ( isdefined( var_1.team ) )
        var_13 = var_1.team;
    else
        var_13 = "none";

    if ( !isdefined( var_1 ) || var_1 != self.owner && level.teambased && var_13 == var_12 )
        return;

    if ( isdefined( var_3 ) && var_3 & level.idflags_penetration )
        self.wasdamagedfrombulletpenetration = 1;

    var_14 = var_2;

    if ( isplayer( var_1 ) )
    {
        var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "remote_uav" );

        if ( var_1 maps\mp\_utility::_hasperk( "specialty_armorpiercing" ) )
            var_14 = var_2 * level.armorpiercingmod;
    }

    if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
        var_1.owner maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "remote_uav" );

    if ( isdefined( var_5 ) )
    {
        switch ( var_5 )
        {
            case "ac130_105mm_mp":
            case "ac130_40mm_mp":
            case "remotemissile_projectile_mp":
            case "remote_mortar_missile_mp":
            case "stinger_mp":
            case "javelin_mp":
                self.largeprojectiledamage = 1;
                var_14 = self.maxhealth + 1;
                break;
            case "emp_grenade_mp":
            case "bomb_site_mp":
                self.largeprojectiledamage = 0;
                var_14 = self.maxhealth + 1;
                break;
        }
    }

    if ( isdefined( var_4 ) && var_4 == "MOD_MELEE" )
        var_14 = self.maxhealth + 1;

    self.damagetaken += var_14;
    playfxontagforclients( level.remoteuav_fx["hit"], self, "tag_origin", self.owner );
    self playsound( "recondrone_damaged" );

    if ( self.smoking == 0 && self.damagetaken >= self.maxhealth / 2 )
    {
        self.smoking = 1;
        playfxontag( level.remoteuav_fx["smoke"], self, "tag_origin" );
    }

    if ( self.damagetaken >= self.maxhealth && ( level.teambased && var_12 != var_13 || !level.teambased ) )
    {
        self.destroyed = 1;
        var_15 = undefined;

        if ( isdefined( var_1.owner ) && ( !isdefined( self.owner ) || var_1.owner != self.owner ) )
            var_15 = var_1.owner;
        else if ( !isdefined( self.owner ) || var_1 != self.owner )
            var_15 = var_1;

        if ( !isdefined( var_1.owner ) && var_1.classname == "script_vehicle" )
            var_15 = undefined;

        if ( isdefined( var_1.class ) && var_1.class == "worldspawn" )
            var_15 = undefined;

        if ( var_1.classname == "trigger_hurt" )
            var_15 = undefined;

        if ( isdefined( var_15 ) )
        {
            var_15 notify( "destroyed_killstreak", var_5 );
            thread maps\mp\_utility::teamplayercardsplash( "callout_destroyed_remote_uav", var_15 );
            var_15 thread maps\mp\gametypes\_rank::giverankxp( "kill", 50, var_5, var_4 );
            var_15 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DESTROYED_REMOTE_UAV" );
            thread maps\mp\gametypes\_missions::vehiclekilled( self.owner, self, undefined, var_15, var_2, var_4, var_5 );
        }

        self notify( "death" );
    }
}
