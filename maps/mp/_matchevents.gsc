// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.match_events_fx["smoke"] = loadfx( "smoke/smoke_grenade_11sec_mp" );
    level.match_events_fx["tracer"] = loadfx( "misc/tracer_incoming" );
    level.match_events_fx["explosion"] = loadfx( "explosions/building_explosion_huge_gulag" );
    level.matchevents["mortar"] = ::domortar;
    level.matchevents["smoke"] = ::dosmoke;
    level.matchevents["airstrike"] = ::doairstrike;
    level.matchevents["pavelow"] = ::dopavelow;
    level.matchevents["heli_insertion"] = ::doheliinsertion;
    level.matchevents["osprey_insertion"] = ::doospreyinsertion;
    level.matcheventstarted = 0;
}

onplayerconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "matchevent_started" );
    self waittill( "spawned_player" );

    if ( level.matcheventstarted == 0 )
    {
        level.matcheventstarted = 1;

        if ( common_scripts\utility::cointoss() )
            self thread [[ common_scripts\utility::random( level.matchevents ) ]]();

        level notify( "matchevent_started" );
    }
}

getmapcenter()
{
    if ( isdefined( level.mapcenter ) )
        return level.mapcenter;

    var_0 = getentarray( "mp_tdm_spawn_allies_start", "classname" );
    var_1 = getentarray( "mp_tdm_spawn_axis_start", "classname" );

    if ( isdefined( var_0 ) && isdefined( var_0[0] ) && isdefined( var_1 ) && isdefined( var_1[0] ) )
    {
        var_2 = distance( var_0[0].origin, var_1[0].origin ) / 2;
        var_3 = vectortoangles( var_0[0].origin - var_1[0].origin );
        var_3 = vectornormalize( var_3 );
        return var_0[0].origin + var_3 * var_2;
    }

    return ( 0.0, 0.0, 0.0 );
}

getstartspawns()
{
    var_0 = getentarray( "mp_tdm_spawn_allies_start", "classname" );
    var_1 = getentarray( "mp_tdm_spawn_axis_start", "classname" );

    if ( isdefined( var_0 ) && isdefined( var_0[0] ) && isdefined( var_1 ) && isdefined( var_1[0] ) )
    {
        var_2 = [];
        var_2["axis"] = var_1;
        var_2["allies"] = var_0;
        return var_2;
    }
    else
        return undefined;
}

domortar()
{
    var_0 = getmapcenter();
    var_1 = 1;

    for ( var_2 = 0; var_2 < 5; var_2++ )
    {
        var_3 = var_0 + ( randomintrange( 100, 600 ) * var_1, randomintrange( 100, 600 ) * var_1, 0 );
        var_4 = bullettrace( var_3 + ( 0.0, 0.0, 500.0 ), var_3 - ( 0.0, 0.0, 500.0 ), 0 );

        if ( isdefined( var_4["position"] ) )
        {
            playfx( level.match_events_fx["tracer"], var_3 );
            thread maps\mp\_utility::playsoundinspace( "fast_artillery_round", var_3 );
            wait(randomfloatrange( 0.5, 1.5 ));
            playfx( level.match_events_fx["explosion"], var_3 );
            playrumbleonposition( "grenade_rumble", var_3 );
            earthquake( 1.0, 0.6, var_3, 2000 );
            thread maps\mp\_utility::playsoundinspace( "exp_suitcase_bomb_main", var_3 );
            physicsexplosionsphere( var_3 + ( 0.0, 0.0, 30.0 ), 250, 125, 2 );
            var_1 *= -1;
        }
    }
}

dosmoke()
{
    var_0 = getmapcenter();
    var_1 = 1;

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        var_3 = var_0 + ( randomintrange( 100, 600 ) * var_1, randomintrange( 100, 600 ) * var_1, 0 );
        playfx( level.match_events_fx["smoke"], var_3 );
        var_1 *= -1;
        wait 2;
    }
}

doairstrike()
{
    level endon( "game_ended" );
    var_0 = 1;
    var_1 = getmapcenter();

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        var_3 = var_1 + ( randomintrange( 100, 600 ) * var_0, randomintrange( 100, 600 ) * var_0, 0 );
        var_4 = bullettrace( var_3 + ( 0.0, 0.0, 500.0 ), var_3 - ( 0.0, 0.0, 500.0 ), 0 );

        if ( isdefined( var_4["position"] ) )
        {
            thread doairstrikeflyby( var_4["position"] );
            var_0 *= -1;
            wait(randomintrange( 2, 4 ));
        }
    }
}

doairstrikeflyby( var_0 )
{
    var_1 = randomint( level.spawnpoints.size - 1 );
    var_2 = level.spawnpoints[var_1].origin * ( 1.0, 1.0, 0.0 );
    var_3 = 8000;
    var_4 = 8000;
    var_5 = getent( "airstrikeheight", "targetname" );
    var_6 = ( 0, 0, var_5.origin[2] + randomintrange( -100, 600 ) );
    var_7 = anglestoforward( ( 0, randomint( 45 ), 0 ) );
    var_8 = var_2 + var_6 + var_7 * var_3 * -1;
    var_9 = var_2 + var_6 + var_7 * var_4;
    var_10 = var_8 + ( randomintrange( 400, 500 ), randomintrange( 400, 500 ), randomintrange( 200, 300 ) );
    var_11 = var_9 + ( randomintrange( 400, 500 ), randomintrange( 400, 500 ), randomintrange( 200, 300 ) );
    var_12 = spawnplane( self, "script_model", var_8 );
    var_13 = spawnplane( self, "script_model", var_10 );

    if ( common_scripts\utility::cointoss() )
    {
        var_12 setmodel( "vehicle_av8b_harrier_jet_mp" );
        var_13 setmodel( "vehicle_av8b_harrier_jet_mp" );
    }
    else
    {
        var_12 setmodel( "vehicle_av8b_harrier_jet_opfor_mp" );
        var_13 setmodel( "vehicle_av8b_harrier_jet_opfor_mp" );
    }

    var_12.angles = vectortoangles( var_9 - var_8 );
    var_12 playloopsound( "veh_mig29_dist_loop" );
    var_12 thread playplanefx();
    var_13.angles = vectortoangles( var_9 - var_10 );
    var_13 playloopsound( "veh_mig29_dist_loop" );
    var_13 thread playplanefx();
    var_14 = distance( var_8, var_9 );
    var_12 moveto( var_9 * 2, var_14 / 2000, 0, 0 );
    wait(randomfloatrange( 0.25, 0.5 ));
    var_13 moveto( var_11 * 2, var_14 / 2000, 0, 0 );
    wait(var_14 / 2000);
    var_12 delete();
    var_13 delete();
}

playplanefx()
{
    self endon( "death" );
    wait 0.5;
    playfxontag( level.fx_airstrike_afterburner, self, "tag_engine_right" );
    wait 0.5;
    playfxontag( level.fx_airstrike_afterburner, self, "tag_engine_left" );
    wait 0.5;
    playfxontag( level.fx_airstrike_contrail, self, "tag_right_wingtip" );
    wait 0.5;
    playfxontag( level.fx_airstrike_contrail, self, "tag_left_wingtip" );
}

dopavelow()
{
    var_0 = getmapcenter();
    var_1 = bullettrace( var_0 + ( 0.0, 0.0, 500.0 ), var_0 - ( 0.0, 0.0, 500.0 ), 0 );

    if ( isdefined( var_1["position"] ) )
    {
        if ( common_scripts\utility::cointoss() )
            var_2 = "vehicle_pavelow";
        else
            var_2 = "vehicle_pavelow_opfor";

        var_3 = spawnhelicopter( self, var_1["position"] + ( 0.0, 0.0, 1000.0 ), ( 0.0, 0.0, 0.0 ), "pavelow_mp", var_2 );

        if ( !isdefined( var_3 ) )
            return;

        var_3.team = self.pers["team"];
        var_3.heli_type = level.heli_types[var_2];
        var_3 thread [[ level.lightfxfunc[level.heli_types[var_2]] ]]();
        var_3.zoffset = ( 0, 0, var_3 gettagorigin( "tag_origin" )[2] - var_3 gettagorigin( "tag_ground" )[2] );
        wait 1;
        playfxontag( level.chopper_fx["damage"]["on_fire"], var_3, "tag_engine_left" );
        var_3 thread maps\mp\killstreaks\_helicopter::heli_crash();
    }
}

doheliinsertion()
{
    var_0 = getstartspawns();

    if ( isdefined( var_0 ) )
    {
        var_1 = 200;
        var_2 = 200;
        var_3 = 1000;
        var_4 = anglestoforward( var_0["allies"][0].angles ) * 300;
        var_5 = anglestoup( var_0["allies"][0].angles ) * var_1;
        var_6 = anglestoright( var_0["allies"][0].angles ) * 200;
        var_7 = anglestoright( var_0["allies"][0].angles ) * -200;
        var_8 = var_0["allies"][0].origin + var_4 + var_5 + var_6;
        var_9 = var_0["allies"][0].origin + var_4 + var_5 + var_7;
        var_10 = spawnhelicopter( self, var_8, var_0["allies"][0].angles, "attack_littlebird_mp", "vehicle_little_bird_bench" );
        var_11 = spawnhelicopter( self, var_9, var_0["allies"][0].angles, "attack_littlebird_mp", "vehicle_little_bird_bench" );
        var_12 = anglestoforward( var_0["axis"][0].angles ) * 300;
        var_13 = anglestoup( var_0["axis"][0].angles ) * var_1;
        var_14 = anglestoright( var_0["axis"][0].angles ) * 200;
        var_15 = anglestoright( var_0["axis"][0].angles ) * -200;
        var_16 = var_0["axis"][0].origin + var_12 + var_13 + var_14;
        var_17 = var_0["axis"][0].origin + var_12 + var_13 + var_15;
        var_18 = spawnhelicopter( self, var_16, var_0["axis"][0].angles, "attack_littlebird_mp", "vehicle_little_bird_bench" );
        var_19 = spawnhelicopter( self, var_17, var_0["axis"][0].angles, "attack_littlebird_mp", "vehicle_little_bird_bench" );
        var_10 vehicle_setspeed( 20, 10 );
        var_10 setyawspeed( 3, 3, 3, 0.3 );
        var_10 setvehgoalpos( var_8 + ( 0, 0, var_2 ), 1 );
        var_11 vehicle_setspeed( 20, 10 );
        var_11 setyawspeed( 3, 3, 3, 0.3 );
        var_11 setvehgoalpos( var_9 + ( 0, 0, var_2 ), 1 );
        var_18 vehicle_setspeed( 20, 10 );
        var_18 setyawspeed( 3, 3, 3, 0.3 );
        var_18 setvehgoalpos( var_16 + ( 0, 0, var_2 ), 1 );
        var_19 vehicle_setspeed( 20, 10 );
        var_19 setyawspeed( 3, 3, 3, 0.3 );
        var_19 setvehgoalpos( var_17 + ( 0, 0, var_2 ), 1 );
        var_10 waittill( "goal" );
        wait 2;
        var_10 vehicle_setspeed( 80, 60 );
        var_10 setyawspeed( 30, 15, 15, 0.3 );
        var_10 setvehgoalpos( var_8 + ( 0, 0, var_3 ) + var_6 * 2, 1 );
        var_11 vehicle_setspeed( 80, 60 );
        var_11 setyawspeed( 30, 15, 15, 0.3 );
        var_11 setvehgoalpos( var_9 + ( 0, 0, var_3 ) + var_7 * 2, 1 );
        var_18 vehicle_setspeed( 80, 60 );
        var_18 setyawspeed( 30, 15, 15, 0.3 );
        var_18 setvehgoalpos( var_16 + ( 0, 0, var_3 ) + var_14 * 2, 1 );
        var_19 vehicle_setspeed( 80, 60 );
        var_19 setyawspeed( 30, 15, 15, 0.3 );
        var_19 setvehgoalpos( var_17 + ( 0, 0, var_3 ) + var_15 * 2, 1 );
        var_10 waittill( "goal" );
        var_10 vehicle_setspeed( 120, 120 );
        var_10 setyawspeed( 60, 40, 40, 0.3 );
        var_10 setvehgoalpos( var_8 + ( 0, 0, var_3 ) + var_6 * 2 + var_4 * -20, 1 );
        var_11 vehicle_setspeed( 120, 120 );
        var_11 setyawspeed( 60, 40, 40, 0.3 );
        var_11 setvehgoalpos( var_9 + ( 0, 0, var_3 ) + var_7 * 2 + var_4 * -20, 1 );
        var_18 vehicle_setspeed( 120, 120 );
        var_18 setyawspeed( 60, 40, 40, 0.3 );
        var_18 setvehgoalpos( var_16 + ( 0, 0, var_3 ) + var_14 * 2 + var_12 * -20, 1 );
        var_19 vehicle_setspeed( 120, 120 );
        var_19 setyawspeed( 60, 40, 40, 0.3 );
        var_19 setvehgoalpos( var_17 + ( 0, 0, var_3 ) + var_15 * 2 + var_12 * -20, 1 );
        var_10 waittill( "goal" );
        var_10 delete();
        var_11 delete();
        var_18 delete();
        var_19 delete();
    }
}

doospreyinsertion()
{
    var_0 = getstartspawns();

    if ( isdefined( var_0 ) )
    {
        var_1 = 200;
        var_2 = 200;
        var_3 = 1000;
        var_4 = anglestoforward( var_0["allies"][0].angles ) * 300;
        var_5 = anglestoup( var_0["allies"][0].angles ) * var_1;
        var_6 = var_0["allies"][0].origin + var_4 + var_5;
        var_7 = spawnhelicopter( self, var_6, var_0["allies"][0].angles, "osprey_minigun_mp", "vehicle_v22_osprey_body_mp" );
        var_8 = anglestoforward( var_0["axis"][0].angles ) * 300;
        var_9 = anglestoup( var_0["axis"][0].angles ) * var_1;
        var_10 = var_0["axis"][0].origin + var_8 + var_9;
        var_11 = spawnhelicopter( self, var_10, var_0["axis"][0].angles, "osprey_minigun_mp", "vehicle_v22_osprey_body_mp" );
        var_7 thread maps\mp\killstreaks\_escortairdrop::airshippitchpropsup();
        var_11 thread maps\mp\killstreaks\_escortairdrop::airshippitchpropsup();
        var_7 thread maps\mp\killstreaks\_escortairdrop::airshippitchhatchdown();
        var_11 thread maps\mp\killstreaks\_escortairdrop::airshippitchhatchdown();
        var_7 vehicle_setspeed( 20, 10 );
        var_7 setyawspeed( 3, 3, 3, 0.3 );
        var_7 setvehgoalpos( var_6 + ( 0, 0, var_2 ), 1 );
        var_11 vehicle_setspeed( 20, 10 );
        var_11 setyawspeed( 3, 3, 3, 0.3 );
        var_11 setvehgoalpos( var_10 + ( 0, 0, var_2 ), 1 );
        var_7 waittill( "goal" );
        var_7 thread maps\mp\killstreaks\_escortairdrop::airshippitchhatchup();
        var_11 thread maps\mp\killstreaks\_escortairdrop::airshippitchhatchup();
        wait 2;
        var_7 vehicle_setspeed( 80, 60 );
        var_7 setyawspeed( 30, 15, 15, 0.3 );
        var_7 setvehgoalpos( var_6 + ( 0, 0, var_3 ), 1 );
        var_11 vehicle_setspeed( 80, 60 );
        var_11 setyawspeed( 30, 15, 15, 0.3 );
        var_11 setvehgoalpos( var_10 + ( 0, 0, var_3 ), 1 );
        var_7 waittill( "goal" );
        var_7 thread maps\mp\killstreaks\_escortairdrop::airshippitchpropsdown();
        var_11 thread maps\mp\killstreaks\_escortairdrop::airshippitchpropsdown();
        var_7 vehicle_setspeed( 120, 120 );
        var_7 setyawspeed( 100, 100, 40, 0.3 );
        var_7 setvehgoalpos( var_6 + ( 0, 0, var_3 ) + var_4 * -20, 1 );
        var_11 vehicle_setspeed( 120, 120 );
        var_11 setyawspeed( 100, 100, 40, 0.3 );
        var_11 setvehgoalpos( var_10 + ( 0, 0, var_3 ) + var_8 * -20, 1 );
        var_7 waittill( "goal" );
        var_7 delete();
        var_11 delete();
    }
}
