// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5760()
{
    maps\_utility::_id_27CB( "dock_enemy", ::_id_57F8 );
    maps\_utility::_id_27CB( "dock_soldier", ::_id_57F8 );
    maps\_utility::_id_27CA( "docks_worker", ::_id_57F9 );
    maps\_utility::_id_27CA( "warehouse_worker", ::_id_57F9 );
    maps\_utility::_id_27CA( "intro_sas", ::_id_57FA );
    maps\_utility::_id_27CB( "intro_truck_door_guy", ::_id_57FB );
    maps\_utility::_id_27CA( "alley_enemy_cellphone", ::_id_57FC );
    maps\_utility::_id_27CA( "alley_enemy_sleeping", ::_id_57FF );
    maps\_utility::_id_27CB( "alley_enemy_warehouse", ::_id_5803 );
    maps\_utility::_id_27CB( "warehouse_hallway_enemy", ::_id_5804 );
    maps\_utility::_id_27CA( "warehouse_sniper_target", ::_id_5807 );
    maps\_utility::_id_27CB( "sas_breacher", ::_id_580B );
    maps\_utility::_id_27CB( "sas_breacher_enemy", ::_id_580C );
    maps\_utility::_id_27CB( "warehouse_melee_enemy", ::_id_580D );
    maps\_utility::_id_27CB( "sewer_pipe_enemy", ::_id_580E );
    maps\_utility::_id_27CB( "sas_orange", ::_id_5771 );
    maps\_utility::_id_27CA( "docks_littlebird_rpger", ::_id_5820 );
    maps\_utility::_id_27CA( "docks_littlebird_spawner", ::_id_581B );
    maps\_utility::_id_27CA( "docks_sas_van", ::_id_5817 );
}

_id_575E()
{
    var_0 = getentarray( "trigger_garage_door", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_584E );
    var_0 = getentarray( "trigger_docks_chopper_hoverpoint", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5831 );
    var_0 = getentarray( "docks_getaway_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_57F3 );
    var_0 = getentarray( "footstep_splash_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5844 );
    var_0 = getentarray( "catchup_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5845 );
    common_scripts\utility::trigger_off( "warehouse_delayed_flag_trigger", "targetname" );
    var_0 = getentarray( "trigger_after_ambush", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    var_1 = getent( "docks_truck_door", "targetname" );
    var_1 common_scripts\utility::trigger_off();
}

_id_575F()
{
    anim._id_20CF = maps\london_fx::_id_56D4;
    anim._id_20CD = maps\london_fx::_id_56D5;
}

_id_575C()
{
    precacheturret( "player_view_controller" );
    precacheturret( "player_view_controller_uav" );
    precachemodel( "tag_turret" );
    precacheturret( "heli_spotlight" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachemodel( "london_porch_rig" );
    precachemodel( "tag_laser" );
    precachemodel( "vehicle_uk_delivery_truck_glowing" );
    precachemodel( "electronics_camera_cellphone_low" );
    precacheshader( "cinematic" );
    precacheshader( "veh_hud_target" );
    precacheshader( "veh_hud_target_offscreen" );
    precacheshader( "remotemissile_infantry_target" );
    precacheshader( "hud_fofbox_self_sp" );
    precacheshader( "veh_hud_friendly" );
    precacheshader( "uav_vehicle_target" );
    precacheshader( "uav_enemy_target" );
    precacheitem( "nosound_magicbullet" );
    precacheitem( "rpg" );
    precachemodel( "com_bolt_cutter_animated" );
    precachemodel( "ch_crate48x64" );
    precachemodel( "com_barrel_black" );
}

_id_0099()
{
    var_0 = getent( "docks_warehouse_light01", "script_noteworthy" );
    var_0 setlightintensity( 0 );
    wait 0.5;
    common_scripts\utility::flag_wait( "uav_slamzoom" );
    var_0 setlightintensity( 1.8 );
}

_id_5761()
{
    var_0 = spawnstruct();
    var_0._id_56E2 = maps\_vehicle::_id_2A99( "forklift_intro" );
    var_0._id_56E2.targetname = "forklift_vehicle";
    var_0._id_56E2._id_0A39[0] common_scripts\utility::assign_unique_id();
    var_0._id_56E2._id_0A39[0] maps\london_uav::_id_5753();
    var_0._id_56E2 _id_57B3();
    var_0._id_56E2 maps\_utility::_id_1402( "cargo_unloading" );
    var_0._id_56E2 maps\_utility::_id_1402( "cargo_unloaded" );
    var_0._id_56E2 maps\_utility::_id_1402( "up" );
    var_0._id_56E2 maps\_utility::_id_1402( "down" );
    var_0._id_56E2 maps\_utility::_id_1402( "doors_closed" );
    var_0._id_57AC = getent( "docks_forklift_static", "targetname" );
    var_0._id_57AC hide();

    if ( level._id_1F19 == "start_of_level" )
    {
        var_0._id_57AD = _id_57B9();

        foreach ( var_2 in var_0._id_57AD )
        {
            if ( isspawner( var_2 ) )
                continue;

            if ( !isdefined( var_2.script_noteworthy ) )
                continue;

            if ( var_2.script_noteworthy == "last_truck" )
            {
                var_2 thermaldrawenable();
                var_0._id_57AE = var_2;
            }
        }
    }

    if ( maps\london_code::_id_5710( "docks_assault_ambush" ) )
    {
        maps\_utility::_id_272C( "docks_worker" );
        maps\_utility::_id_272C( "intro_sas" );
    }

    level._id_5777 = var_0;
}

_id_577D()
{
    if ( !isdefined( level._id_5777 ) )
        return;

    _id_57B0();
    level._id_5777._id_56E2 delete();
    level._id_5777._id_57AC show();

    if ( isdefined( level._id_57AF ) )
    {
        foreach ( var_1 in level._id_57AF )
        {
            if ( !isdefined( var_1 ) )
                continue;

            if ( isdefined( var_1._id_164F ) && var_1._id_164F == "keep" )
            {
                var_1 thread _id_57F8();
                continue;
            }

            var_1 delete();
        }
    }

    level._id_57AF = undefined;
    level._id_5777 = undefined;
}

_id_57B0()
{
    var_0 = level._id_5777._id_56E2._id_53A5;

    if ( !isdefined( var_0 ) )
        return;

    common_scripts\utility::array_call( var_0._id_57B1, ::delete );
    var_0 delete();
}

_id_5240()
{
    wait 1;
    maps\_utility::_id_11F4( "london_ldr_seeingthis" );
    maps\_utility::_id_11F4( "london_com_haveeyes" );
    maps\_utility::_id_11F4( "london_ldr_focusontrucks" );
    wait 0.5;
    maps\_utility::_id_11F4( "london_ldr_trucksaremovin" );
    common_scripts\utility::flag_wait( "trucks_are_moving" );
    maps\_utility::_id_11F4( "london_dlt2_guysay" );
    maps\_utility::_id_11F4( "london_ldr_somethingbig" );
    maps\_utility::_id_11F4( "london_ldr_rollingout" );
    maps\_utility::_id_11F4( "london_dlt1_outallnight" );
    maps\_utility::_id_11F4( "london_ldr_wilco" );
    common_scripts\utility::flag_wait( "uav_focusing_on_enemies" );
    maps\_utility::_id_11F4( "london_trk_packinheat" );
    maps\_utility::_id_11F4( "london_ldr_eyesopen" );
    common_scripts\utility::flag_wait( "uav_focusing_on_player" );
    maps\_utility::_id_11F4( "london_ldr_readytorock" );
    wait 0.5;
    maps\_utility::_id_11F4( "london_com_missionisgo" );
    wait 0.5;
    level._id_56DE maps\_utility::_id_168C( "london_ldr_gettowork" );
    common_scripts\utility::flag_set( "uav_dialog_done" );
}

_id_5774()
{
    if ( !isdefined( level._id_26B0 ) )
    {
        var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_0 linkto( level.player, "", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        level._id_26B0 = var_0;
    }

    maps\_utility::_id_26B1( "london_uav1_tapesrollin" );
    maps\_utility::_id_26B1( "london_uav2_2miles" );
    maps\_utility::_id_26B1( "london_ovl_copy2miles" );
    maps\_utility::_id_26B1( "london_uav1_notcleared" );
    maps\_utility::_id_26B1( "london_ovl_5trucks" );
    maps\_utility::_id_26B1( "london_uav2_tracking" );
    maps\_utility::_id_26B1( "london_uav1_roger" );
    level._id_5777._id_56E2 maps\_utility::_id_1654( "cargo_unloading" );
    maps\_utility::_id_26B1( "london_uav2_rollinout" );
    maps\_utility::_id_26B1( "london_uav1_movingout" );
    maps\_utility::_id_26B1( "london_ovl_twovans" );
    common_scripts\utility::flag_wait( "uav_focusing_on_enemies" );
    maps\_utility::_id_26B1( "london_ovl_squarebuilding" );
    maps\_utility::_id_26B1( "london_uav1_rogerthat" );
    maps\_utility::_id_26B1( "london_uav2_inwindows" );
    maps\_utility::_id_26B1( "london_uav1_visible" );
    maps\_utility::_id_26B1( "london_ovl_identifyweapons" );
    maps\_utility::_id_26B1( "london_uav1_definitelyhot" );
    maps\_utility::_id_26B1( "london_uav2_maderpg" );
}

_id_577E( var_0 )
{
    var_1 = level._id_5777._id_56E2;
    var_1 thread maps\_vehicle::_id_1FA6();
    var_1._id_1032 = "forklift";
    var_1 maps\_utility::_id_2629();
    var_1 _id_57B2();
    var_0 thread maps\london_uav::_id_5752( var_1 );
    var_1 maps\_utility::_id_1654( "up" );
    var_1 maps\london_docks_anim::_id_56E3();
    var_1 maps\_utility::_id_1654( "cargo_unloading" );
    var_1 maps\_utility::_id_13DC( "cargo_unloaded" );
    var_1._id_53A5 unlink();
    var_1 maps\_utility::_id_1654( "down" );
    var_1 maps\london_docks_anim::_id_56E4();
    var_1 maps\_utility::_id_1654( "doors_closed" );
}

_id_57B2()
{
    playfxontag( common_scripts\utility::getfx( "forklift_blinklight" ), self, "TAG_TAIL_LIGHT_CENTER" );
    playfxontag( common_scripts\utility::getfx( "forklift_headlight" ), self, "TAG_HEADLIGHT_LEFT" );
    playfxontag( common_scripts\utility::getfx( "forklift_headlight" ), self, "TAG_HEADLIGHT_RIGHT" );
}

_id_5762()
{
    if ( level._id_1F19 != "start_of_level" )
        return;

    var_0 = getent( "last_truck", "script_noteworthy" );
    var_1 = ( 76711.0, -3562.0, 456.479 );
    var_2 = ( 0.0894979, 12.238, -0.00146479 );
    var_3 = spawn( "script_model", var_1 );
    var_3.angles = var_2;
    var_3 setmodel( var_0.model );
    var_3 thermaldrawenable();
    var_3._id_1032 = "delivery_truck";
    var_3 maps\_utility::_id_2629();
    level thread _id_57B4( var_3 );
    var_4 = level._id_5777._id_56E2;
    var_4 maps\_utility::_id_1654( "down" );
    _id_57B5( var_3 );
    _id_57B0();
    var_0.angles = var_3.angles;
    var_0.origin = var_3.origin;
    var_5 = maps\_vehicle::_id_211F( var_0 );
    var_3 delete();
    level._id_5777._id_57AD = maps\_utility::_id_2673( level._id_5777._id_57AD, var_5, 2 );
    var_4 maps\_utility::_id_13DC( "doors_closed" );
}

_id_57B3()
{
    var_0 = getent( "forklift_pallet", "targetname" );
    var_0._id_57B1 = getentarray( var_0.target, "targetname" );
    common_scripts\utility::array_call( var_0._id_57B1, ::linkto, var_0 );
    var_1 = ( 74.0, 0.0, 1.0 );
    var_0.origin = maps\london_code::_id_570B( self.origin, self.angles, var_1 );
    var_0.angles = ( 5, self.angles[1] + 180, var_0.angles[2] );
    var_2 = "J_Fork_Lift";
    var_3 = var_0.origin - self gettagorigin( var_2 );
    var_4 = var_0.angles - self gettagangles( var_2 );
    var_0 linkto( self, var_2, var_3, var_4 );
    self._id_53A5 = var_0;
}

_id_57B4( var_0 )
{
    var_1 = getentarray( "intro_truck_door_guy_ai", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3._id_1032 = "truck_door_guy" + var_3._id_16A5;
        var_0 thread maps\_anim::_id_124E( var_3, "idle" );
        var_3 maps\_utility::_id_24F5();
    }

    var_0 thread maps\london_docks_anim::_id_56E6();
}

_id_57B5( var_0 )
{
    var_1 = getentarray( "intro_truck_door_guy_ai", "targetname" );
    var_0 notify( "stop_loop" );
    var_2 = spawnstruct();
    var_2.origin = var_0.origin;
    var_2.angles = var_0.angles;
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_1414 );
    common_scripts\utility::array_thread( var_1, ::_id_57B6, var_2 );
    var_0 maps\london_docks_anim::_id_56E7();
}

_id_57B6( var_0 )
{
    var_0 maps\_anim::_id_1246( self, "close_door" );
    maps\_utility::_id_257D();
}

_id_577F( var_0 )
{
    common_scripts\utility::array_thread( level._id_5777._id_57AD, maps\_vehicle::_id_1FA6 );
    common_scripts\utility::flag_set( "trucks_are_moving" );
    var_0 thread maps\london_uav::_id_5752( level._id_5777._id_57AD[2], 0.8, 100 );
    wait 4;
    var_0 thread maps\london_uav::_id_5752( level._id_5777._id_57AD[1], 0.8, 200 );
    wait 3;
    var_0 thread maps\london_uav::_id_5752( level._id_5777._id_57AD[0], 0.8, 300 );
    wait 3;
}

_id_5780( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "uav_warehouse2_lookpoint", "targetname" );
    var_0 thread maps\london_uav::_id_5752( var_1 );
    wait 8;
    maps\_utility::_id_272C( "warehouse_worker" );
    common_scripts\utility::flag_set( "uav_focusing_on_enemies2" );
    var_1 = common_scripts\utility::getstruct( "uav_warehouse_lookpoint", "targetname" );
    var_0 thread maps\london_uav::_id_5752( var_1 );
    wait 10;
}

_id_577B( var_0 )
{
    thread _id_57B7();
    var_1 = spawnstruct();
    var_1.origin = level._id_5777._id_5778;
    var_0 notify( "stop_uav_target_tracking" );
    var_2 = 4;
    var_0.target_ent moveto( var_1.origin, var_2, var_2 * 0.5, var_2 * 0.5 );
    common_scripts\utility::flag_set( "start_fence_climb" );
    wait 2;
}

_id_57B7()
{
    var_0 = getent( "intro_fake_player", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "docks_start", "targetname" );
    var_2 = undefined;

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4.script_noteworthy ) )
            continue;

        if ( var_4.script_noteworthy == "player" )
            var_2 = var_4;
    }

    var_2.origin = maps\_utility::_id_2281( var_2.origin );
    var_0.origin = var_2.origin;
    var_0.angles = var_2.angles;
    var_6 = getaiarray();

    if ( var_6.size == 32 )
    {
        var_7 = sortbydistance( level._id_57AF, var_0.origin );

        foreach ( var_9 in var_7 )
        {
            if ( !isdefined( var_9 ) )
                continue;

            if ( isdefined( var_9._id_164F ) && var_9._id_164F == "keep" )
                continue;

            var_9 delete();
            break;
        }
    }

    var_9 = var_0 maps\_utility::_id_166F( 1 );
    var_9.name = "Sgt. Burns";
    var_2 thread maps\_anim::_id_11C8( var_9, "alert_idle" );
    common_scripts\utility::flag_wait( "slamzoom_rotate" );
    wait 0.4;
    var_9 delete();
}

_id_57B8()
{
    var_0 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_0, maps\london_uav::_id_5753 );
    common_scripts\utility::array_thread( var_0, maps\london_uav::_id_5757 );
}

_id_577A()
{
    self endon( "slamzoom" );

    for (;;)
    {
        wait(randomfloatrange( 2, 3 ));
        var_0 = anglestoforward( self.angles );
        var_1 = anglestoforward( self.angles );
        playfxontag( common_scripts\utility::getfx( "clouds_predator" ), self._id_5735, "tag_aim" );
    }
}

_id_577C()
{
    var_0 = level._id_5777._id_5778;
    var_1 = level._id_5777._id_5779;
    level.player maps\london_uav::_id_56B7( 1 );
    visionsetnaked( "uav_flir_Thermal", 0 );
    maps\london_uav::_id_5756();
    var_0 += ( 0.0, 0.0, 0.0 );
    level.player playersetstreamorigin( var_0 );
    var_2 = spawn( "script_origin", self._id_5735 gettagorigin( "tag_aim" ) );
    var_3 = vectortoangles( var_0 - self._id_5735 gettagorigin( "tag_aim" ) );
    var_2.angles = var_3;
    level.player freezecontrols( 1 );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_3 );
    wait 0.05;
    level.player playerlinkto( var_2, undefined, 1, 0, 0, 0, 0 );
    self._id_5738 delete();
    level.player playsound( "player_slamzoom" );
    var_2 moveto( var_0, 2, 0, 1 );
    level.player lerpfov( 65, 2.5 );
    level.player maps\_utility::delaythread( 1, maps\_utility::vision_set_fog_changes, "london_docks", 2 );
    thread maps\_utility::_id_276D( "sm_cameraoffset", 0, 2 );
    wait 1.0;
    wait 0.5;
    common_scripts\utility::flag_set( "alley_start" );
    common_scripts\utility::flag_set( "slamzoom_rotate" );
    self show();
    var_2 rotateto( var_1, 0.5, 0.25, 0.25 );
    wait 0.5;
    level.player unlink();
    thread maps\_utility::_id_194E( "london_docks" );
    level.player maps\london_uav::_id_574F();
    level.player playerclearstreamorigin();
    var_2 delete();
}

_id_57B9()
{
    var_0 = maps\_vehicle::_id_2A98( "docks_truck1" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.script_noteworthy ) )
        {
            if ( var_3.script_noteworthy == "lead_truck" )
                var_1 = maps\_utility::_id_2673( var_1, var_3, 0 );
            else
                var_1[var_1.size] = var_3;

            continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_009A()
{
    var_0 = 456;
    var_1 = "sm_lightscore_eyeprojectdist";

    while ( !common_scripts\utility::flag( "alley_start" ) )
    {
        var_2 = level.player.origin[2];
        var_3 = var_2 - var_0;
        var_4 = level.player getplayerangles();
        var_5 = var_4[0];
        var_6 = var_3 / cos( 90 - var_5 );
        setsaveddvar( var_1, var_6 );
        wait 0.2;
    }

    setsaveddvar( var_1, 64 );
}

_id_5775()
{
    level._id_56FA[1] thread _id_57BA();
    common_scripts\utility::flag_wait( "start_fence_climb" );

    if ( maps\london_code::_id_5712( "post_intro" ) )
        level thread _id_57C9();

    level._id_56FA[0] thread _id_57BA();
    level._id_56FA[1] thread _id_57F1();
}

_id_57BA()
{
    maps\_utility::_id_2800();
    _id_5858();
    maps\_utility::_id_251F();
    maps\_utility::_id_271F();
    maps\_utility::_id_0EEC();
    self.dontavoidplayer = 1;
    _id_57E8( ::_id_57BB, 1 );
    maps\_utility::_id_2686();
}

_id_57BB( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "alley_climb_in":
            _id_57BC( var_1 );
            break;
        case "alley_comm_check":
            _id_57BD( var_1 );
            break;
        case "alley_enemy_cellphone":
            _id_57BE( var_1 );
            break;
        case "alley_enemy_sleeping":
            _id_57C1( var_1 );
            break;
        case "alley_enemy_warehouse":
            _id_57C3( var_1 );
            break;
        case "last_alley":
            _id_57C4( var_1 );
            break;
        case "alley_sprint":
            _id_57C8( var_1 );
            break;
        case "warehouse_breach_cutter":
            _id_57DD( var_1 );
            break;
        case "warehouse_breach_breacher":
            _id_57DF( var_1 );
            break;
        case "warehouse_hallway":
            _id_57E6( var_1 );
            break;
        case "warehouse_melee1":
            _id_57E2( var_0, var_1 );
            common_scripts\utility::flag_wait( "warehouse_player_lead_0" );
            _id_009C( var_1 );
            level thread _id_57ED();
            break;
    }
}

_id_57BC( var_0 )
{
    common_scripts\utility::flag_wait( "uav_slamzoom" );
    var_0 thread maps\_anim::_id_1246( self, "alley_fence_traverse" );
}

_id_57BD( var_0 )
{
    common_scripts\utility::flag_wait( "alley_start" );
    maps\_utility::_id_1414();
    thread maps\_anim::_id_1246( self, "alley_comm_trans" );
}

_id_5776()
{
    level._id_56DE maps\_anim::_id_1246( level._id_56DE, "alley_comm_check" );

    if ( common_scripts\utility::flag( "alley_start" ) )
        return;

    level._id_56DE thread maps\_anim::_id_124E( level._id_56DE, "alley_comm_idle" );
}

_id_57BE( var_0 )
{
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    self setgoalnode( var_0 );
    self waittill( "goal" );

    if ( level._id_5763 >= 1 )
        return;

    level._id_5763++;
    common_scripts\utility::flag_wait( "alley_spawn_enemy_cellphone" );
    wait 1;
    var_1 = getent( "alley_enemy_cellphone_ai", "targetname" );

    if ( !isdefined( var_1 ) || !isalive( var_1 ) )
        return;

    var_2 = [ self, _id_5856() ];
    thread _id_57C7( var_2, var_1, 1, ::_id_57BF );
}

_id_57BF( var_0, var_1 )
{
    for (;;)
    {
        if ( !isalive( var_1 ) )
            break;

        if ( var_1 getanimtime( var_1 maps\_utility::_id_26EC( "enemy_cellphone" ) ) > 0.7 )
            break;

        if ( isdefined( var_1._id_57C0 ) )
            break;

        wait 0.05;
    }
}

_id_57C1( var_0 )
{
    var_1 = getentarray( "alley_enemy_sleeping_ai", "targetname" );
    var_2 = _id_5856();
    maps\_utility::_id_26E5( var_1[0] );
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    self setgoalnode( var_0 );
    self waittill( "goal" );

    if ( level._id_5763 >= 2 )
        return;

    level._id_5763++;
    var_3 = [ self, var_2 ];
    common_scripts\utility::flag_wait_or_timeout( "alley_enable_sleeper_kill", 10 );

    if ( common_scripts\utility::flag( "alley_enable_sleeper_kill" ) )
        wait(1 + randomfloat( 2 ));

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        if ( !isalive( var_5 ) )
            continue;

        _id_57C7( var_3, var_5, 2, ::_id_57C2 );
    }
}

_id_57C2( var_0, var_1 )
{
    var_1 endon( "death" );

    if ( isdefined( var_1._id_57C0 ) )
        return;

    wait 0.5;
}

_id_57C3( var_0 )
{
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    self setgoalnode( var_0 );
    self waittill( "goal" );

    if ( level._id_5763 >= 3 )
        return;

    level._id_5763++;
    var_1 = getentarray( "alley_enemy_warehouse_ai", "targetname" );
    var_1 = maps\_utility::_id_2672( var_1 );
    var_2 = [ self ];

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isalive( var_4 ) )
            continue;

        _id_57C7( var_2, var_4, 2 );
        wait 0.2;
    }
}

_id_57C4( var_0 )
{
    self setgoalnode( var_0 );
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "alley_go_to_breach" );
    common_scripts\utility::flag_wait( "warehouse2_done" );

    if ( self == level._id_56DE )
    {
        _id_57C6();
        common_scripts\utility::flag_set( "last_alley_dialogue_done" );
    }
    else
        common_scripts\utility::flag_wait( "last_alley_dialogue_done" );

    var_0 maps\_utility::script_delay();

    if ( self == level._id_56FA[1] )
        thread _id_57C5();
}

_id_57C5()
{
    common_scripts\utility::flag_wait( "alley_enemy_warehouse_dead" );
    level._id_56FA[1] maps\_utility::delaythread( 0.5, maps\_utility::_id_168C, "london_trk_alleyclear" );
}

_id_57C6()
{
    var_0 = getentarray( "alley_enemy_warehouse_ai", "targetname" );
    var_0 = maps\_utility::_id_2672( var_0 );

    if ( var_0.size > 0 )
        level._id_56FA[1] maps\_utility::_id_168C( "london_trk_10meters" );

    var_0 = maps\_utility::_id_2672( var_0 );

    if ( var_0.size > 0 )
        level._id_56DE maps\_utility::_id_168C( "london_ldr_onme" );
}

_id_57C7( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) || !isalive( var_1 ) )
        return;

    common_scripts\utility::array_thread( var_0, maps\_utility::_id_26E5, var_1 );

    if ( isdefined( var_3 ) )
        [[ var_3 ]]( var_0, var_1 );

    if ( !isdefined( var_1 ) || !isalive( var_1 ) )
    {
        common_scripts\utility::array_thread( var_0, maps\_utility::_id_26E5, undefined );
        return;
    }

    var_1._id_0FA0 = undefined;

    if ( var_2 == 1 )
        var_1.health = 1;

    var_4 = var_0[0] gettagorigin( "tag_flash" );
    var_5 = var_1 gettagorigin( "j_head" );
    var_6 = bullettrace( var_4, var_5, 1 );

    if ( var_0.size > 1 )
    {
        if ( isdefined( var_6["entity"] ) && var_6["entity"] == level.player )
            var_0 = maps\_utility::_id_2616( var_0 );
    }

    var_7 = randomint( var_0[0].a._id_0C6D["single"].size );
    var_8 = var_0[0].a._id_0C6D["single"][var_7];
    var_9 = 0.1 / weaponfiretime( var_0[0].weapon );

    if ( !isalive( var_1 ) )
    {
        common_scripts\utility::array_thread( var_0, maps\_utility::_id_26E5, undefined );
        return;
    }

    for ( var_10 = 0; var_10 < var_2; var_10++ )
    {
        if ( isalive( var_1 ) )
        {
            var_5 = var_1 gettagorigin( "j_head" );

            if ( var_2 - var_10 == 1 )
                var_1.health = 1;
        }

        var_11 = ( 0.0, 0.0, 0.0 );

        if ( var_2 - var_10 > 1 )
            var_11 = ( 0, 0, randomfloatrange( 5, 15 ) * -1 );

        var_0[0] setflaggedanimknobrestart( "fire_notify", var_8, 1, 0.2, var_9 );
        var_0[0] _id_5853( "fire_notify", "fire", 0.2 );
        var_4 = var_0[0] gettagorigin( "tag_flash" );
        var_0[0] _id_5857( var_4, var_5 + var_11 );

        if ( var_2 - var_10 > 1 )
            wait(0.15 + randomfloat( 0.1 ));
    }

    if ( isalive( var_1 ) )
    {
        if ( isdefined( var_1._id_0D04 ) )
            var_1 maps\_utility::_id_1902();

        var_1 kill();
    }

    common_scripts\utility::array_thread( var_0, maps\_utility::_id_26E5, undefined );
}

_id_57C8( var_0 )
{

}

_id_57C9()
{
    common_scripts\utility::flag_wait( "uav_dialog_done" );
    maps\london_code::_id_56FF();
    level._id_56DE maps\_utility::_id_168C( "london_ldr_youclean" );
}

_id_5763()
{
    var_0 = getent( "alley_enemy_cellphone_door", "targetname" );
    var_0 rotateto( ( 0.0, -90.0, 0.0 ), 0.2 );
    common_scripts\utility::flag_wait( "alley_spawn_enemy_cellphone" );

    if ( level._id_1F19 != "2nd_alley" )
        maps\_utility::_id_272F( "alley_enemy_cellphone" );

    maps\_utility::_id_272C( "alley_enemy_sleeping" );
    level thread _id_5801();
}

_id_57CA( var_0 )
{
    var_1 = self;

    if ( isdefined( self.target ) )
    {
        var_1 = getnode( self.target, "targetname" );

        if ( !isdefined( var_1 ) )
            var_1 = common_scripts\utility::getstruct( self.target, "targetname" );
    }

    if ( !isdefined( self._id_1032 ) )
        self._id_1032 = "generic";

    var_2 = self._id_205B;
    self.fovcosine = 0.5;
    var_3 = 0;

    if ( isdefined( self._id_2006 ) )
        var_3 = 1;

    if ( _id_5855( var_2 + "_death" ) )
    {
        maps\_utility::_id_0D04();
        thread _id_57D0( var_1, var_2 );
    }

    if ( _id_5855( var_2 + "_react" ) )
        thread _id_57DA( var_1, var_2, var_0 );

    if ( isdefined( level._id_1F90[var_2 + "_prop"] ) )
    {
        var_4 = maps\_utility::_id_1287( var_2 + "_prop" );
        self._id_4204 = [ var_4 ];
        var_1 thread maps\_anim::_id_11CF( var_4, var_2 + "_death" );
    }

    if ( var_3 )
        var_1 thread maps\_anim::_id_124E( self, var_2 );
    else
        var_1 thread maps\_anim::_id_1246( self, var_2 );
}

_id_57CB( var_0, var_1 )
{
    if ( !isdefined( self._id_4204 ) )
        return;

    if ( !_id_5855( var_1 ) )
        return;

    var_0 thread maps\_anim::_id_11DD( self._id_4204, var_1 );
}

_id_57CC( var_0 )
{
    if ( !isdefined( level._id_57CD ) )
        level._id_57CD = [];

    if ( !isdefined( level._id_57CD[var_0] ) )
        level._id_57CD[var_0] = [];

    var_1 = level._id_57CD[var_0].size;
    level._id_57CD[var_0][var_1] = self;

    if ( !isdefined( self._id_57CE ) )
        self._id_57CE = [];

    self._id_57CE[self._id_57CE.size] = var_0;
}

_id_57CF( var_0 )
{
    if ( !isdefined( self._id_57CE ) )
        return;

    foreach ( var_2 in self._id_57CE )
    {
        foreach ( var_4 in level._id_57CD[var_2] )
            var_4 notify( "friend_" + var_0 );
    }
}

_id_57D0( var_0, var_1 )
{
    self endon( "stop_conditional_anim_death" );
    var_2 = getanimlength( maps\_utility::_id_1281( var_1 + "_death" ) );
    self waittill( "damage" );
    self notify( "stop_conditional_anim_reaction" );
    thread _id_57CF( "died" );
    var_0 notify( "stop_loop" );

    if ( isdefined( self._id_0D04 ) )
        maps\_utility::_id_1902();

    var_3 = 0.8;

    if ( isdefined( self._id_57D1 ) )
        var_3 = self._id_57D1 * 0.01;

    maps\_utility::delaythread( var_2 * var_3, ::_id_57D2 );
    var_4 = 0;

    if ( isdefined( self._id_164F ) )
        var_4 = self._id_164F == "no_death_node";

    thread _id_57CB( var_0, var_1 + "_death" );
    self notify( "play_death_anim" );

    if ( var_4 )
        maps\_anim::_id_1246( self, var_1 + "_death" );
    else
    {
        var_0 notify( "stop_loop" );
        var_0 maps\_anim::_id_1246( self, var_1 + "_death" );
    }
}

_id_57D2()
{
    if ( isdefined( self._id_0D04 ) )
        maps\_utility::_id_1902();

    var_0 = 0;

    if ( isdefined( self._id_164F ) )
    {
        if ( self._id_164F == "do_ragdoll" )
            var_0 = 1;
    }

    if ( !isdefined( self._id_57D3 ) )
        self._id_57D3 = var_0;

    self._id_0D50 = undefined;
    self._id_0EC0 = undefined;
    self._id_0D45 = ::_id_57D4;
    self.allowdeath = 1;
    self kill();
}

_id_57D4()
{
    animscripts\shared::_id_0D73();
    wait 0.1;

    if ( self._id_57D3 )
        self startragdoll();

    return 1;
}

_id_57D5( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_conditional_anim_reaction" );
    var_2 = _id_57D7();
    _id_57CF();
    self.ignoreall = 0;
    self.fovcosine = 0.1;
    self._id_009B = 1;
    var_3 = 300;

    if ( isdefined( self.script_radius ) )
        var_3 = self.script_radius;

    self.goalradius = var_3;
    self notify( "stop_conditional_anim_death" );

    if ( isdefined( self._id_0D04 ) )
        maps\_utility::_id_1902();

    if ( isdefined( var_1 ) )
        return;

    if ( isdefined( var_0 ) )
        var_0 notify( "stop_loop" );

    maps\_utility::_id_1414();
    self notify( "end_patrol" );
    maps\_utility::_id_140C();
    self allowedstances( "stand", "crouch", "prone" );
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();

    if ( isdefined( self._id_205B ) )
    {
        self.allowdeath = 1;
        self._id_0EC0 = 1;

        if ( isdefined( var_0 ) )
            var_0 maps\_anim::_id_11C1( self, self._id_205B );
        else
            maps\_anim::_id_11C1( self, self._id_205B );

        self._id_0EC0 = undefined;
        return;
    }

    if ( isdefined( self._id_57D6 ) )
        maps\_utility::_id_257D();
}

_id_57D7()
{
    self endon( "death" );

    if ( isdefined( self._id_57D8 ) )
        wait(self._id_57D8);

    thread _id_57DB( "react" );
    thread _id_57DB( "doFlashBanged" );
    thread _id_57DB( "explode" );
    thread _id_57DB( "too_close" );
    thread _id_57DB( "bulletwhizby" );
    thread _id_57DB( "friend_died" );
    thread _id_57DB( "friend_reacted" );
    thread _id_57DC();
    self waittill( "conditional_anim_reaction", var_0 );

    if ( isdefined( self._id_57D9 ) )
        wait(self._id_57D9);

    if ( var_0 == "friend_died" )
        wait(randomfloatrange( 0.4, 0.6 ));

    return var_0;
}

_id_57DA( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "stop_conditional_anim_reaction" );
    var_3 = _id_57D7();
    _id_57CF( "reacted" );
    self notify( "conditional_anim_react" );
    self notify( "stop_conditional_anim_death" );

    if ( isdefined( self._id_0D04 ) )
        maps\_utility::_id_1902();

    var_0 notify( "stop_loop" );

    if ( isdefined( var_2 ) )
        self thread [[ var_2 ]]( var_3 );

    thread _id_57CB( var_0, var_1 + "_death" );

    if ( var_3 != "doFlashBanged" )
    {
        var_4 = 0;

        if ( isdefined( self._id_164F ) )
        {
            if ( self._id_164F == "kill_on_reaction" )
            {
                var_5 = 0.8;

                if ( isdefined( self._id_57D1 ) )
                    var_5 = self._id_57D1 * 0.01;

                var_6 = getanimlength( maps\_utility::_id_1281( var_1 + "_react" ) );
                maps\_utility::delaythread( var_6 * var_5, ::_id_57D2 );
            }

            var_4 = self._id_164F == "no_death_node";
        }

        if ( isstring( level._id_0C59[self._id_1032][var_1 + "_react"] ) )
        {
            var_0 notify( "stop_loop" );
            self notify( "stop_loop" );
            maps\_utility::_id_1414();
        }
        else
        {
            self.allowdeath = 1;
            self._id_0EC0 = 1;

            if ( !isdefined( self._id_0EC4 ) )
                self._id_0EC4 = 500;

            if ( var_4 )
                maps\_anim::_id_1246( self, var_1 + "_react" );
            else
                var_0 maps\_anim::_id_1246( self, var_1 + "_react" );

            self._id_0EC0 = undefined;
        }
    }

    if ( isdefined( self._id_57D6 ) )
        maps\_utility::_id_257D();
}

_id_57DB( var_0 )
{
    self endon( "death" );
    self waittill( var_0 );
    self notify( "conditional_anim_reaction", var_0 );
}

_id_57DC()
{
    self endon( "death" );
    self endon( "conditional_anim_reaction" );
    var_0 = 300;

    if ( isdefined( self.radius ) )
        var_0 = self.radius;

    var_0 *= var_0;
    var_1 = undefined;
    var_2 = getent( self.target, "targetname" );

    if ( isdefined( var_2 ) )
    {
        if ( var_2.code_classname == "trigger_multiple" )
            var_1 = var_2;
    }

    for (;;)
    {
        wait 0.05;

        if ( distancesquared( level.player.origin, self.origin ) < var_0 )
            break;

        if ( !isdefined( var_1 ) )
            continue;

        if ( level.player istouching( var_1 ) )
            break;
    }

    self notify( "too_close" );
}

_id_57DD( var_0 )
{
    var_1 = "warehouse_breach_cut";
    self._id_56F6 = spawn( "script_model", self.origin + ( 0.0, 0.0, -150.0 ) );
    self._id_56F6 setmodel( "com_bolt_cutter_animated" );
    self._id_56F6 hide();
    self._id_56F6._id_1032 = "boltcutters";
    self._id_56F6 maps\_anim::_id_1244();
    var_2 = [ self, self._id_56F6 ];
    var_0 maps\_anim::_id_124A( self, var_1 + "_trans" );
    self._id_56F6 playsound( "scn_london_boltcut_a_entry" );
    var_0 maps\_anim::_id_11DD( var_2, var_1 + "_trans" );
    self._id_56F6 playsound( "scn_london_boltcut_a_idle" );
    var_0 thread maps\_anim::_id_11D6( var_2, var_1 + "_idle" );
    common_scripts\utility::flag_wait( "warehouse_breacher_in_position" );
    maps\_anim::_id_11C1( self, "london_dlt1_ready" );
    common_scripts\utility::trigger_on( "warehouse_delayed_flag_trigger", "targetname" );
    common_scripts\utility::flag_clear( var_0._id_1288 );
    common_scripts\utility::flag_wait( var_0._id_1288 );
    common_scripts\utility::flag_set( "warehouse_breacher_enter" );
    maps\_utility::_id_1425( "warehouse_breach" );
    var_0 notify( "stop_loop" );
    waittillframeend;
    self.ignoreall = 0;
    self._id_56F6 playsound( "scn_london_boltcut_a_breach" );
    var_0 thread maps\_anim::_id_11DD( var_2, var_1 + "_enter" );
    level thread _id_57DE();
}

_id_57DE()
{
    var_0 = getent( "warehouse_door", "targetname" );
    var_1 = getent( "warehouse_padlock_latch2", "targetname" );
    var_1 linkto( var_0 );
    var_2 = getent( "warehouse_padlock", "targetname" );
    var_3 = getent( "warehouse_padlock_latch", "targetname" );
    var_4 = 457;
    wait 1.6;
    var_5 = 0.4;
    var_2 moveto( ( var_2.origin[0], var_2.origin[1] - 10, var_4 ), var_5, var_5 * 0.8, 0 );
    var_2 rotateto( ( 90, randomintrange( -90, 90 ), 0 ), var_5, var_5 * 0.8, 0 );
}

_id_57DF( var_0 )
{
    var_1 = "warehouse_breacher";
    var_0 maps\_anim::_id_124A( self, var_1 + "_trans" );
    var_0 maps\_anim::_id_1246( self, "warehouse_breacher_trans" );
    var_0 thread maps\_anim::_id_124E( self, var_1 + "_idle" );
    thread _id_5847( "stackup_nag", 2, "warehouse_breacher_enter", undefined, undefined, 45 );

    if ( getdvarint( "slow_breach" ) > 0 )
        _id_57E1( self );

    common_scripts\utility::flag_set( "warehouse_breacher_in_position" );
    common_scripts\utility::flag_wait( "warehouse_breacher_enter" );
    var_0 notify( "stop_loop" );
    waittillframeend;
    thread _id_57E0();
    var_0 maps\_anim::_id_1246( self, var_1 + "_enter" );
}

_id_57E0()
{
    wait 3.5;
    maps\_utility::_id_168C( "london_ldr_roomclear" );
    maps\_utility::_id_168C( "london_ldr_upstairs" );
}

_id_57E1( var_0 )
{
    var_1 = ( -40.0, -16.0, 0.0 );
    var_2 = ( 0.0, 20.0, 0.0 );
    var_3 = maps\london_code::_id_570B( var_0.origin, var_0.angles, var_1 );
    var_4 = spawn( "script_origin", var_3 );
    var_4.angles = var_0.angles + var_2;
    var_4 linkto( var_0, "tag_origin" );
    level.player maps\_utility::_id_13E2( var_3, var_0.angles + var_2, 2, 1, 30, 30, 30, 30, 1 );
    level.player playerlinktodelta( var_4, "", 1, 30, 30, 30, 30 );
    common_scripts\utility::flag_wait( "warehouse_breach" );
}

_id_57E2( var_0, var_1 )
{
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    var_2[0] = self;
    var_3 = getentarray( var_1.targetname, "target" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        if ( isspawner( var_6 ) )
            continue;

        var_4 = var_6;
    }

    if ( isdefined( var_4 ) && isalive( var_4 ) && !var_4 maps\_utility::_id_0D69() )
    {
        if ( isdefined( var_4._id_009B ) )
            self.ignoreall = 0;

        var_4._id_1032 = "attacker";
        var_2[var_2.size] = var_4;
        var_4 thread _id_57E5( var_1, var_0 );
        level._id_56FA[1] thread maps\_utility::_id_168C( "london_gfn_gotashadow" );
    }
    else
        common_scripts\utility::flag_set( "warehouse_melee_ready" );

    if ( common_scripts\utility::flag( "warehouse_player_lead_0" ) )
    {
        _id_57E4( var_1 );
        return;
    }

    self setgoalnode( var_1 );
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "warehouse_melee_ready" );
    common_scripts\utility::flag_wait( "warehouse_first_hallway" );
    var_2 = maps\_utility::_id_2672( var_2 );

    if ( var_2.size > 1 )
    {
        self._id_57E3 = self._id_1032;
        self._id_1032 = "defender";
        self._id_56EE = var_4;
        var_4 notify( "stop_conditional_anim_reaction" );
        var_8 = 0;

        if ( isdefined( var_4.goalpos ) )
        {
            if ( distancesquared( var_4.origin, var_4.goalpos ) < 4096 )
                var_8 = 1;
        }

        if ( var_8 )
        {
            var_1 notify( "stop_loop" );
            var_1 maps\_anim::_id_11DD( var_2, var_0 );
        }

        self._id_1032 = self._id_57E3;
        self._id_57E3 = undefined;
    }

    thread maps\_utility::_id_168C( "london_ldr_takepoint" );
    self.ignoreall = 0;
    level thread _id_5849( level._id_56FA, "takepoint_nag", "warehouse_player_lead_1", 10, 20 );
    _id_57E4( var_1 );
}

_id_009C( var_0 )
{
    if ( !isdefined( level._id_009D ) )
        return;

    if ( !isalive( level._id_009D ) )
        return;

    var_1 = level._id_009D;
    var_1.ignoreme = 0;
    maps\_utility::_id_2131( 1 );
    self.ignoreme = 0;
    maps\_utility::_id_1057();
    self setgoalnode( var_0 );
    var_1 waittill( "death" );
    maps\_utility::_id_27B9();
    self.ignoreme = 1;
    maps\_utility::_id_1071();
}

_id_57E4( var_0 )
{
    if ( isdefined( var_0._id_2057 ) )
        common_scripts\utility::flag_set( var_0._id_2057 );
}

_id_57E5( var_0, var_1 )
{
    self endon( "death" );
    thread _id_584A( "warehouse_melee_ready" );
    var_0 maps\_anim::_id_124A( self, var_1 );
    common_scripts\utility::flag_set( "warehouse_melee_ready" );
}

_id_57E6( var_0 )
{
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    self pushplayer( 1 );
    self.goalradius = var_0.script_radius;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self.goalradius = var_0.radius;
    var_1 = getentarray( "warehouse_hallway_ai", "targetname" );
    var_1 = maps\_utility::_id_0B53( var_1 );

    if ( var_1.size > 0 )
    {
        if ( self != level._id_56DE )
            thread maps\_utility::_id_168C( "london_gfn_morningents" );
    }

    var_2 = [ self ];
    var_1 = sortbydistance( var_1, var_2[0].origin );

    foreach ( var_4 in var_1 )
        _id_57C7( var_2, var_4, randomintrange( 2, 3 ) );

    if ( self != level._id_56DE )
        thread maps\_utility::_id_168C( "london_trk_roomclear" );

    if ( self == level._id_56DE )
        maps\_utility::delaythread( 2, maps\_utility::_id_168C, "london_ldr_move" );

    self pushplayer( 0 );
}

_id_5765()
{
    common_scripts\utility::flag_wait( "warehouse_first_hallway" );
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingamesync( "london_football" );
    level thread _id_009F();
    var_0 = getentarray( "warehouse_tv", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_00A0 );
    wait 1;
    common_scripts\utility::flag_wait( "warehouse_complete" );
    stopcinematicingame();

    foreach ( var_2 in var_0 )
    {
        var_2 stoploopsound();

        if ( isdefined( var_2._id_009E ) )
            var_2._id_009E delete();
    }
}

_id_009F()
{
    level endon( "warehouse_complete" );

    for (;;)
    {
        cinematicingameloop( "london_football" );
        wait 5;

        while ( iscinematicplaying() )
            wait 0.5;
    }
}

_id_00A0()
{
    level endon( "warehouse_complete" );
    self playloopsound( "scn_london_soccer_tv_loop" );
    var_0 = self.origin + anglestoforward( self.angles ) * 25;
    self._id_009E = spawnfx( common_scripts\utility::getfx( "interactive_tv_light" ), var_0 );
    triggerfx( self._id_009E );
    self waittill( "death" );
    self stoploopsound();
    self._id_009E delete();
}

_id_578C()
{
    self notify( "stop_scripted_movement" );
}

_id_57E8( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_scripted_movement" );

    if ( !maps\_utility::_id_133C( "scripted_movement" ) )
        maps\_utility::_id_1402( "scripted_movement" );

    maps\_utility::_id_13DC( "scripted_movement" );
    var_2 = undefined;
    var_3 = 0;

    if ( isdefined( self.target ) )
    {
        var_2 = getnode( self.target, "targetname" );
        var_3 = 1;

        if ( !isdefined( var_2 ) )
        {
            var_3 = 0;
            var_2 = common_scripts\utility::getstruct( self.target, "targetname" );
        }
    }

    for (;;)
    {
        var_4 = var_2.script_noteworthy;

        if ( isdefined( var_2._id_57E9 ) )
        {
            maps\_utility::_id_2712();

            if ( var_1 )
                _id_5790();
        }
        else
        {
            maps\_utility::_id_2713();

            if ( var_1 )
                _id_5858();
        }

        self notify( "scripted_movement_next_goal" );

        if ( isdefined( var_4 ) )
            self [[ var_0 ]]( var_4, var_2 );
        else
        {
            if ( _id_57EC( var_2 ) )
            {
                maps\_utility::_id_2520();
                maps\_utility::_id_2720();
            }
            else
            {
                maps\_utility::_id_251F();
                thread _id_57EA();
            }

            _id_57EB( var_2, var_3 );
            self [[ var_0 ]]( var_4, var_2 );
        }

        if ( isdefined( var_2._id_1288 ) )
            common_scripts\utility::flag_wait( var_2._id_1288 );

        var_2 maps\_utility::script_delay();

        if ( isdefined( var_2.script_sound ) )
            thread maps\_utility::_id_168C( var_2.script_sound );

        if ( !isdefined( var_2.target ) )
            break;

        var_5 = var_2.target;
        var_2 = getnode( var_5, "targetname" );
        var_3 = 1;

        if ( !isdefined( var_2 ) )
        {
            var_3 = 0;
            var_2 = common_scripts\utility::getstruct( var_5, "targetname" );
        }
    }

    maps\_utility::_id_13DE( "scripted_movement" );
    self notify( "scripted_movement_done" );
}

_id_57EA()
{
    self endon( "scripted_movement_next_goal" );
    self endon( "scripted_movement_done" );
    wait 2;
    maps\_utility::_id_271F();
}

_id_57EB( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0.radius ) && var_0.radius != 0 )
        self.goalradius = var_0.radius;

    if ( isdefined( var_0._id_1288 ) )
    {
        if ( !common_scripts\utility::flag( var_0._id_1288 ) )
            level endon( var_0._id_1288 );
        else
            return;
    }

    if ( var_1 )
        self setgoalnode( var_0 );
    else
        self setgoalpos( var_0.origin );

    self waittill( "goal" );

    if ( isdefined( var_0._id_2057 ) )
        common_scripts\utility::flag_set( var_0._id_2057 );

    if ( var_2 )
    {
        self.type = undefined;
        self.scriptedarrivalent = undefined;
    }
}

_id_57EC( var_0 )
{
    if ( isdefined( var_0.script_delay ) || isdefined( var_0.script_delay_min ) )
        return 1;

    if ( isdefined( var_0._id_1288 ) )
    {
        if ( !common_scripts\utility::flag( var_0._id_1288 ) )
            return 1;
    }

    if ( isdefined( var_0._id_295D ) )
        return 1;

    return 0;
}

_id_57ED()
{
    common_scripts\utility::flag_wait( "warehouse_player_lead_2" );
    level._id_56DE thread maps\_utility::_id_168C( "london_ldr_checkthosecorners" );
    common_scripts\utility::flag_wait( "warehouse_player_lead_7" );
    maps\_utility::_id_11F4( "london_spt_takingtheshot" );
    common_scripts\utility::flag_wait( "warehouse_player_lead_8" );
    common_scripts\utility::array_thread( level._id_56FA, maps\_utility::_id_2612, 1 );
    common_scripts\utility::flag_wait( "warehouse_snipe_enemies" );
    maps\_utility::_id_11F4( "london_spt_sendthem" );
}

_id_5788()
{
    thread _id_57EE();
}

_id_57EE()
{
    _id_57EF();
    thread _id_57F0();
}

_id_57EF()
{
    level._id_56DE maps\_utility::_id_168C( "london_ldr_bravostatus" );
    level._id_56DE maps\_utility::_id_168C( "london_trk_whatthehell" );
    wait 6;
    level._id_56DE thread _id_5847( "downhere_nag", 4, "warehouse_complete" );
}

_id_57F0()
{
    common_scripts\utility::flag_set( "warehouse_exit" );
    common_scripts\utility::flag_wait( "out_of_warehouse" );
    maps\_utility::_id_26C0( "docks_enable_reinforcements" );
}

_id_57F1()
{
    self waittill( "scripted_movement_done" );
    thread maps\_anim::_id_11C8( self, "window_explosion_reaction_idle" );
    common_scripts\utility::flag_wait( "sas_van_destroyed" );
    wait 0.3;
    self notify( "stop_loop" );
    maps\_anim::_id_11C1( self, "window_explosion_reaction" );
}

_id_57F2()
{
    wait 3;
    common_scripts\utility::flag_wait( "out_of_warehouse" );
    level._id_56FA[1] thread maps\_utility::_id_26AF( "london_spt_rpgloose" );
    var_0 = maps\_vehicle::_id_2881( "docks_van_rpg_hit2" );
    var_0 waittill( "explode", var_1 );
    self setcandamage( 1 );
    playfx( common_scripts\utility::getfx( "rpg_explode" ), var_1 );
    radiusdamage( self.origin, 300, 500, 50 );
    self dodamage( self.health, self.origin );
    common_scripts\utility::play_sound_in_space( "scn_london_window_blowout", self.origin );
    common_scripts\utility::flag_set( "sas_van_destroyed" );
}

_id_579E()
{
    var_0 = getent( "docks_truck_door", "targetname" );
    var_0 common_scripts\utility::trigger_on();
    var_0 usetriggerrequirelookat();
    var_0 sethintstring( &"LONDON_HINT_TRUCK_DOORS" );
    var_0 makeusable();
    return var_0;
}

_id_57F3()
{
    self waittill( "trigger" );

    if ( isdefined( self._id_2057 ) )
        common_scripts\utility::flag_set( self._id_2057 );

    thread _id_57F4( self.target );
}

_id_57F4( var_0 )
{
    level notify( "stop_docks_enemies_getaway" );
    level endon( "stop_docks_enemies_getaway" );
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::flag_wait( "docks_enemy_fallback" );

    for (;;)
    {
        var_1 = maps\_utility::_id_0B53( var_1 );
        var_2 = var_1[0];
        var_3 = _id_57F6( var_2 );

        if ( !isdefined( var_3 ) )
        {
            wait 0.2;
            continue;
        }

        var_3._id_57F5 = var_0;
        var_3 setgoalvolumeauto( var_2 );
        var_4 = maps\_utility::script_delay();

        if ( !var_4 )
            wait(randomfloatrange( 1, 2 ));
    }
}

_id_57F6( var_0 )
{
    if ( !isdefined( level._id_57F7 ) )
        level._id_57F7 = [];

    level._id_57F7 = maps\_utility::_id_2672( level._id_57F7 );

    if ( level._id_57F7.size == 0 )
        return undefined;

    var_1 = sortbydistance( level._id_57F7, var_0.origin );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_57F5 ) && var_1[var_2]._id_57F5 == var_0.targetname )
            continue;

        return var_1[var_2];
    }

    return undefined;
}

_id_57F8()
{
    if ( !isdefined( level._id_57F7 ) )
        level._id_57F7 = [];

    level._id_57F7[level._id_57F7.size] = self;
}

_id_57F9()
{
    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "docks_walker" )
        {
            maps\_utility::_id_24F5();
            self._id_2069 = "walk_casual";
        }
    }

    if ( !isdefined( level._id_57AF ) )
        level._id_57AF = [];

    level._id_57AF[level._id_57AF.size] = self;
    maps\london_uav::_id_5753();
}

_id_57FA()
{
    var_0 = getentarray( "sas_breacher", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_0AB5 ) )
            continue;

        var_2._id_0AB5 = self.name;
        break;
    }

    common_scripts\utility::flag_wait( "uav_focusing_on_player" );
    _id_57E8( ::_id_20C0, 1 );
    common_scripts\utility::flag_wait( "alley_start" );
    wait 3;
    var_4 = getnode( "intro_sas_node", "targetname" );
    maps\_utility::script_delay();
    self.fixednode = 0;
    self.goalradius = 32;
    self setgoalnode( var_4 );
    self waittill( "goal" );
    self delete();
}

_id_57FB()
{
    self.targetname = "intro_truck_door_guy_ai";
}

_id_57FC()
{
    var_0 = getent( "alley_enemy_cellphone_door", "targetname" );
    var_0 common_scripts\utility::delaycall( 1, ::rotateto, ( 0.0, 29.0, 0.0 ), 5, 0, 2 );
    var_0 common_scripts\utility::delaycall( 1, ::playsound, "scn_london_door_slow_open" );
    level._id_56DE maps\_utility::delaythread( 1.2, maps\_utility::_id_168C, "london_ldr_weaponsfree" );
    self.targetname = "alley_enemy_cellphone_ai";
    self._id_0FA0 = 1;
    self attach( "electronics_camera_cellphone_low", "tag_inhand", 1 );
    self._id_57D8 = 4;
    thread _id_57CA( ::_id_57FE );
    thread _id_57FD();
    common_scripts\utility::waittill_either( "play_death_anim", "death" );
    self detach( "electronics_camera_cellphone_low", "tag_inhand" );
    common_scripts\utility::flag_set( "alley_enemy_cellphone_dead" );
}

_id_57FD()
{
    self endon( "death" );
    self endon( "conditional_anim_react" );
    maps\_utility::_id_168C( "cellphone_line1" );
    wait 2.5;
    maps\_utility::_id_168C( "cellphone_line3" );
}

_id_57FE( var_0 )
{
    wait 0.2;
    self.allowdeath = 1;
    self._id_57C0 = 1;
}

_id_57FF()
{
    self.targetname = "alley_enemy_sleeping_ai";
    self._id_0FA0 = 1;
    self._id_0EC6 = 1;
    self._id_57D6 = 1;
    self._id_100A = 1;
    thread _id_5800();
    var_0 = self;

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent( self.target );

    self waittill( "death" );
    common_scripts\utility::flag_set( "alley_enemy_sleeping_dead" );
}

_id_5800()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "alley_enable_sleeper_reaction" );
    thread _id_57CA( ::_id_5802 );

    if ( self._id_205B == "enemy_sleeping" )
    {
        var_0 = ( 80413.5, -3362.51, 482.766 );
        var_1 = ( 288.551, 162.212, -61.5698 );
        var_2 = spawn( "weapon_" + self.weapon, var_0, 1 );
        var_2.angles = var_1;
        self._id_11FA = var_2;
        maps\_utility::_id_24F5();
        self.dropweapon = 0;
    }
}

_id_5801()
{
    common_scripts\utility::flag_wait( "alley_enable_sleeper_reaction" );
    level._id_56FA[1] maps\_utility::_id_168C( "london_trk_dozin" );
    level._id_56FA[0] maps\_utility::_id_168C( "london_ldr_keepemsilent" );
}

_id_5802( var_0 )
{
    thread _id_00A1();
    wait 0.2;
    self._id_57C0 = 1;
}

_id_00A1()
{
    if ( self._id_205B != "enemy_sleeping" )
        return;

    self endon( "death" );

    while ( self getanimtime( maps\_utility::_id_26EC( "enemy_sleeping_react" ) ) < 0.55 )
        wait 0.05;

    var_0 = self._id_11FA.model;
    self._id_11FA delete();
    self attach( var_0, "tag_weapon_left", 1 );

    while ( self getanimtime( maps\_utility::_id_26EC( "enemy_sleeping_react" ) ) < 0.75 )
        wait 0.05;

    self detach( var_0, "tag_weapon_left" );
    maps\_utility::_id_257D();
}

_id_5803()
{
    self._id_2060[0] = "patrol_idle_smoke";
    self._id_2060[1] = "patrol_idle_stretch";
    self._id_2060[2] = "patrol_idle_checkphone";
    self._id_2060[3] = "patrol_idle_phone";
    maps\_utility::_id_260D();
    maps\_utility::_id_109B();
    self.alertlevelint = 1;
    self.fovcosine = 0.99;
    self.ignoreall = 1;
    self.grenadeammo = 0;
    self.ignoresuppression = 1;
    self.targetname = "alley_enemy_warehouse_ai";
    thread _id_57D5();
    self waittill( "death" );
    maps\_utility::_id_282B( "alley_enemy_warehouse_dead" );
}

_id_5771()
{
    if ( isdefined( self._id_251B ) && self._id_251B == 0 )
        return;

    thread maps\_utility::_id_139E();
}

_id_5804()
{
    self._id_57D3 = 1;
    self._id_57D9 = 0.5;
    self.targetname = "warehouse_hallway_ai";
    _id_57CC( "hallway" );
    thread _id_57CA( ::_id_5805 );
}

_id_5805( var_0 )
{
    var_1 = 2;

    switch ( self._id_205B )
    {
        case "warehouse_computer":
            var_1 = 0.6;
            break;
        case "warehouse_tv_watcher1":
            var_1 = 1.8;
            break;
        case "warehouse_tv_watcher2":
            var_1 = 2;
            break;
    }

    self endon( "gun_recalled" );
    self endon( "death" );
    thread _id_5806( var_1 );
    wait 0.2;
    self._id_0EC0 = 1;
    self._id_0EC4 = 1000;
    self.allowdeath = 1;
    self._id_0D50 = maps\_utility::_id_26EC( "standing_death" );
}

_id_5806( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self._id_0EC0 = undefined;
    self notify( "gun_recalled" );
    maps\_utility::_id_1414();
    maps\_utility::_id_257D();
}

_id_5807()
{
    level thread _id_5808( self );
}

_id_5808( var_0 )
{
    common_scripts\utility::flag_wait( "warehouse_snipe_enemies" );

    if ( !isdefined( level._id_5809 ) )
    {
        var_1 = common_scripts\utility::getstruct( "sniper_struct", "targetname" );
        level._id_5809 = spawn( "script_model", var_1.origin );
        level._id_5809 setmodel( "tag_laser" );
        level._id_5809 laserforceon();
        maps\_utility::_id_282D( level._id_5809, "docks_stuff" );
    }

    var_2 = "target1";
    var_3 = getglass( "warehouse_glass_target1" );
    var_4 = 1;
    var_5 = 1.0;
    var_6 = 0.2;

    if ( !common_scripts\utility::flag_exist( "sniped_target1" ) )
        common_scripts\utility::flag_init( "sniped_target1" );

    if ( var_0.script_noteworthy == "warehouse_sniper_target2" )
    {
        var_2 = "target2";
        var_3 = getglass( "warehouse_glass_target2" );
        var_4 = 2;
        var_5 = 1.6667 - var_6 * 2;
    }

    var_0._id_1032 = var_2;
    var_0.allowdeath = 1;
    var_0 thread maps\_anim::_id_124E( var_0, "idle" );

    if ( var_2 == "target2" )
    {
        common_scripts\utility::flag_wait( "sniped_target1" );
        var_0 maps\_utility::_id_1414();
        waittillframeend;

        if ( _id_583B( var_0 ) )
            var_0 thread maps\_anim::_id_1246( var_0, "death" );
    }

    _id_580A( var_0, var_5 );
    var_7 = 0;
    var_8 = 0;
    var_9 = ( 0.0, 90.0, 0.0 );

    for ( var_10 = 0; var_10 < var_4; var_10++ )
    {
        if ( _id_583B( var_0 ) )
        {
            var_11 = var_0 gettagorigin( "j_head" );
            var_9 = vectortoangles( var_11 - level._id_5809.origin );
            level._id_5809 rotateto( var_9, var_6 );
        }

        wait(var_6);

        if ( _id_583B( var_0 ) )
        {
            var_11 = var_0 gettagorigin( "j_head" );
            var_9 = vectortoangles( var_11 - level._id_5809.origin );
            level._id_5809 rotateto( var_9, var_6 );
        }

        common_scripts\utility::flag_set( "sniped_target1" );

        if ( var_2 == "target1" && var_10 == 0 )
        {
            var_0 maps\_utility::_id_1414();
            waittillframeend;

            if ( _id_583B( var_0 ) && !var_7 )
            {
                level thread common_scripts\utility::play_sound_in_space( "scn_london_sniped_bodyfall1", var_0.origin + ( 0.0, 0.0, 32.0 ) );
                var_0 thread maps\_anim::_id_1246( var_0, "death" );
            }
        }

        if ( _id_583B( var_0 ) )
        {
            var_12 = var_0 gettagorigin( "j_head" );
            maps\_utility::delaythread( 0.2, common_scripts\utility::play_sound_in_space, "scn_london_sniped_bulletimpact", var_12 );
            playfx( common_scripts\utility::getfx( "impact_fx" ), var_12 );

            if ( !var_7 )
            {
                level maps\_utility::delaythread( 2, common_scripts\utility::play_sound_in_space, "scn_london_sniped_bodyfall2", var_0.origin + ( 0.0, 0.0, 32.0 ) );
                level maps\_utility::delaythread( 1.8, maps\london_docks_anim::_id_56F1, var_0 );
                level maps\_utility::delaythread( 2, maps\london_docks_anim::_id_56F0, var_0 );
            }

            var_7 = 1;
        }

        if ( !var_8 && _id_583B( var_0 ) )
        {
            var_8 = 1;
            destroyglass( var_3, anglestoforward( var_9 ) );
        }

        if ( var_10 < var_4 - 1 )
            wait(var_6);
    }

    if ( var_2 == "target2" )
    {
        maps\_utility::_id_11F4( "london_ldr_grinchup" );
        level._id_5809 laserforceoff();
        level._id_5809 delete();
        common_scripts\utility::flag_set( "warehouse_sniper_done" );
    }
}

_id_580A( var_0, var_1 )
{
    var_1 *= 0.5;

    for ( var_2 = 0; var_2 < 2; var_2++ )
    {
        if ( _id_583B( var_0 ) )
        {
            var_3 = var_0 gettagorigin( "j_head" );

            if ( var_2 == 0 )
                var_3 += ( 0.0, 0.0, -30.0 );

            var_4 = vectortoangles( var_3 - level._id_5809.origin );
            level._id_5809 rotateto( var_4, var_1, var_1 * 0.5, var_1 * 0.5 );
        }

        wait(var_1);
    }
}

_id_580B()
{
    if ( !common_scripts\utility::flag( "alley_sas_breacher_dialog" ) )
    {
        common_scripts\utility::flag_set( "alley_sas_breacher_dialog" );
        level thread _id_580F();
    }

    maps\_utility::_id_0D04();
    self.targetname = "sas_breacher_ai";
    _id_57E8( ::_id_5811, 1 );
    maps\_utility::_id_1902();
    self delete();
}

_id_580C()
{
    self._id_2060[0] = "patrol_idle_smoke";
    self._id_2060[1] = "patrol_idle_stretch";
    self._id_2060[2] = "patrol_idle_checkphone";
    self._id_2060[3] = "patrol_idle_phone";
    maps\_utility::_id_260D();
    thread _id_57D5();
    self.grenadeammo = 0;
    self.fovcosine = 0.01;
    self.targetname = "sas_breacher_enemy_ai";
}

_id_580D()
{
    level._id_009D = self;
    self endon( "death" );
    maps\_utility::_id_140B( "patrol_walk" );
    maps\_utility::_id_26FA( "patrol_idle_1" );
    self.targetname = "warehouse_melee_enemy_ai";
    maps\_utility::_id_251F();
    maps\_utility::_id_271F();
    maps\_utility::_id_260D();
    self._id_100A = 1;
    self.goalradius = 64;
    var_0 = common_scripts\utility::getstruct( "melee_patrol_spot", "targetname" );
    self setgoalpos( var_0.origin );
    _id_57D5( undefined, 1 );
    maps\_utility::_id_26FD();
    maps\_utility::_id_26FC();
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
}

_id_580E()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "sewer_pipes_done" );
    _id_57F8();
}

_id_580F()
{
    level._id_56DE maps\_anim::_id_1246( level._id_56DE, "london_ldr_bravo9ontime" );
    maps\_utility::_id_11F4( "london_sasl_copy" );
}

_id_5810()
{

}

_id_5811( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "warehouse2_breach_cutter":
            _id_5812( var_1, "warehouse2_cutter_enter" );
            break;
        case "warehouse2_breach_breacher2":
            _id_5812( var_1, "warehouse2_breacher2_enter" );
            break;
        case "warehouse2_breach_breacher":
            _id_5812( var_1, "warehouse2_breacher_trans", 1 );
            break;
        case "warehouse2_wait":
            _id_5813( var_1 );
            break;
    }
}

_id_5812( var_0, var_1, var_2 )
{
    var_0 maps\_anim::_id_11C4( self, var_1 );

    if ( var_1 == "warehouse2_breacher_trans" )
    {
        var_0 maps\_anim::_id_11C1( self, var_1 );
        var_0 thread maps\_anim::_id_11C8( self, "warehouse2_breacher_idle" );
        var_1 = "warehouse2_breacher_enter";
    }

    maps\_utility::_id_282B( "warehouse2_breach_go" );
    common_scripts\utility::flag_wait( "warehouse2_breach_go" );
    common_scripts\utility::flag_wait_or_timeout( "alley_go_to_breach", 10 );

    if ( var_1 == "warehouse2_cutter_enter" )
        common_scripts\utility::flag_set( "warehouse2_breach_go_dialog" );

    common_scripts\utility::flag_wait( "warehouse2_breach_go_dialog" );

    if ( var_1 == "warehouse2_breacher_enter" )
    {
        wait 0.2;
        common_scripts\utility::flag_set( "warehouse2_breach_enter" );
    }

    common_scripts\utility::flag_wait( "warehouse2_breach_enter" );

    if ( isdefined( var_2 ) )
        wait(var_2);

    if ( var_1 == "warehouse2_breacher_enter" )
        var_0 notify( "stop_loop" );

    self.fixednode = 0;
    self.ignoreforfixednodesafecheck = 1;
    thread _id_5814();
    maps\_utility::_id_0EEC();
    self._id_100A = 1;
    self._id_20AF = 5;
    thread _id_5816( var_1 );
    thread _id_5815( var_1 );
    var_0 thread maps\_anim::_id_11C1( self, var_1 );
}

_id_5813( var_0 )
{
    _id_57EB( var_0, 1 );
    var_1 = getentarray( "sas_breacher_enemy_ai", "targetname" );
    var_1 = maps\_utility::_id_2672( var_1 );

    if ( !var_1.size )
        return;

    while ( var_1.size )
    {
        wait 0.05;
        var_1 = maps\_utility::_id_2672( var_1 );
    }

    var_0 maps\_utility::script_delay();
}

_id_5814()
{
    self endon( "death" );
    var_0 = getentarray( "sas_breacher_enemy_ai", "targetname" );
    var_0 = maps\_utility::_id_2672( var_0 );

    if ( !var_0.size )
    {
        if ( !common_scripts\utility::flag( "warehouse2_done" ) )
            common_scripts\utility::flag_set( "warehouse2_done" );

        return;
    }

    if ( var_0.size > 1 )
        var_0 = sortbydistance( var_0, self.origin );

    var_1 = var_0[0];
    var_1.health = 5;
    self.favoriteenemy = var_1;
    var_1 common_scripts\utility::waittill_either( "damage", "death" );
    var_0 = getentarray( "sas_breacher_enemy_ai", "targetname" );
    var_0 = maps\_utility::_id_2672( var_0 );

    if ( !var_0.size )
    {
        if ( !common_scripts\utility::flag( "warehouse2_done" ) )
            common_scripts\utility::flag_set( "warehouse2_done" );

        return;
    }

    var_1 = var_0[0];
    var_1.health = 5;
    self.favoriteenemy = var_1;

    if ( !common_scripts\utility::flag( "warehouse2_done" ) )
        common_scripts\utility::flag_set( "warehouse2_done" );
}

_id_5815( var_0 )
{
    self waittillmatch( "single anim", "end" );
    maps\_utility::_id_2520();
    self.ignoreall = 0;
    self.nododgemove = 1;
    var_1 = getentarray( "sas_breacher_enemy_ai", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_2612, 0 );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_1414 );
}

_id_5816( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "warehouse2_breacher_enter":
            var_1 = 0.72;
            break;
        case "warehouse2_breacher2_enter":
            var_1 = 0.61;
            break;
        default:
            return;
    }

    while ( self getanimtime( maps\_utility::_id_26EC( var_0 ) ) < var_1 )
        wait 0.05;

    maps\_utility::_id_1414();
}

_id_5767()
{
    var_0 = vehicle_getarray();

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.targetname ) && !isdefined( var_2.script_noteworthy ) )
            var_2 vehicle_turnengineoff();
    }

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.targetname ) )
            var_2 vehicle_turnengineoff();
    }
}

_id_5817()
{
    maps\_utility::_id_282D( self, "docks_stuff" );
    self setcandamage( 0 );
    thread _id_5819();
    self waittill( "reached_end_node" );

    if ( isdefined( self._id_164F ) )
    {
        if ( self._id_164F == "sas_orange" )
        {
            level._id_5818 = self;
            thread _id_57F2();
            common_scripts\utility::array_thread( level._id_57F7, ::_id_5846 );
        }
    }
}

_id_5819()
{
    common_scripts\utility::flag_wait( "docks_assault" );

    if ( isdefined( self._id_164F ) )
        self waittill( "unloading" );
}

_id_5789()
{
    var_0 = undefined;

    foreach ( var_2 in level._id_5766 )
    {
        if ( !isdefined( var_2._id_164F ) )
            continue;

        var_0 = var_2;
    }

    var_4 = getvehiclenode( "docks_van_teleport", "script_noteworthy" );
    var_0 vehicle_teleport( var_4.origin, var_4.angles );
    var_0._id_291A = var_4;
    var_0 attachpath( var_4 );
    var_0 thread maps\_vehicle::_id_26A1( var_4 );
}

_id_578A()
{
    common_scripts\utility::array_thread( level._id_57F7, ::_id_581A );
}

_id_581A()
{
    self notify( "end_patrol" );
}

_id_581B()
{
    maps\_utility::_id_1402( "spotlight_on" );
    maps\_utility::_id_1402( "follow_path" );
    maps\_utility::_id_1402( "docks_rocket_lockon" );
    maps\_utility::_id_1402( "earlyout" );
    self._id_2891 = spawnturret( "misc_turret", self gettagorigin( "tag_flash" ), "heli_spotlight" );
    self._id_2891 setmode( "manual" );
    self._id_2891 setmodel( "com_blackhawk_spotlight_on_mg_setup" );
    self._id_2891 linkto( self, "tag_flash" );
    maps\_vehicle::_id_2A3D();
    self._id_57A6 = 0;
    thread _id_5826();
    thread _id_582B();
    level._id_5794 = self;

    if ( isdefined( self._id_581C ) )
        maps\_utility::_id_13DC( "follow_path" );
    else
        self waittill( "reached_dynamic_path_end" );

    var_0 = common_scripts\utility::getstruct( "docks_chopper_hoverpoint_1", "targetname" );
    self setmaxpitchroll( 25, 45 );
    self vehicle_setspeed( 30, 20, 10 );
    self setyawspeed( 90, 45 );
    thread _id_582F( var_0 );
    self._id_581D = missile_createrepulsorent( self, 5000, 1000 );

    if ( isdefined( self._id_581C ) )
    {
        wait 0.05;
        self notify( "reached_dynamic_path_end" );
        maps\_utility::_id_13DC( "spotlight_on" );
    }

    thread _id_5823();
    thread _id_581F();
    thread maps\london_docks::_id_57A7();
    wait 0.05;

    foreach ( var_2 in self.mgturret )
    {
        var_2.script_delay_min = 0.05;
        var_2.script_delay_max = 0.1;
        var_2._id_2279 = 20;
        var_2._id_227A = 30;
        var_2._id_227B = common_scripts\utility::getfx( "minigun_shells" );
        var_2._id_227E = "scn_london_gattling_shells";
        var_2 notify( "stop_burst_fire_unmanned" );
        var_2 thread maps\_mgturret::_id_2278();
    }
}

_id_581E()
{
    maps\_utility::_id_1402( "spotlight_on" );
    maps\_utility::_id_13DE( "spotlight_on" );
    maps\_utility::_id_1402( "follow_path" );
    maps\_utility::_id_1402( "earlyout" );
    self._id_2891 = spawnturret( "misc_turret", self gettagorigin( "tag_flash" ), "heli_spotlight" );
    self._id_2891 setmode( "manual" );
    self._id_2891 setmodel( "com_blackhawk_spotlight_on_mg_setup" );
    self._id_2891 linkto( self, "tag_flash" );
    maps\_vehicle::_id_2A3D();
    thread _id_5826();
    thread _id_582B();
    self sethoverparams( 0, 0, 0 );
    var_0 = common_scripts\utility::getstruct( "docks_chopper_hoverpoint_1", "targetname" );
    self setmaxpitchroll( 25, 45 );
    self vehicle_setspeed( 30, 20, 10 );
    thread _id_582F( var_0 );
    self._id_581D = missile_createrepulsorent( self, 5000, 1000 );
    thread _id_581F();
    wait 0.05;

    foreach ( var_2 in self.mgturret )
    {
        var_2.script_delay_min = 0.05;
        var_2.script_delay_max = 0.1;
        var_2._id_2279 = 20;
        var_2._id_227A = 30;
        var_2._id_227B = common_scripts\utility::getfx( "minigun_shells" );
        var_2._id_227E = "scn_london_gattling_shells";
        var_2 notify( "stop_burst_fire_unmanned" );
        var_2 thread maps\_mgturret::_id_2278();
    }

    level._id_5794 = self;
    maps\london_docks::_id_57A7();
}

_id_5772( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );

    if ( isdefined( var_2.target ) )
    {
        var_3 = getentarray( var_2.target, "targetname" );
        var_4 = [];

        foreach ( var_6 in var_3 )
        {
            if ( issubstr( var_6.code_classname, "actor" ) )
                var_6.targetname = "unique_1616";
        }
    }

    var_8 = common_scripts\utility::getstruct( var_1, "targetname" );
    var_2.origin = var_8.origin;
    var_2.angles = var_8.angles;
    var_2.target = "unique_1616";
    var_2._id_581C = 1;
}

_id_581F()
{
    var_0 = self._id_2891;
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_5820()
{
    level thread _id_5821( self );
    maps\_utility::_id_260D();
    self waittill( "goal" );
    wait 1;
    self.a.rockets = 1;
    var_0 = spawn( "script_origin", level._id_5794.origin + ( 0.0, 0.0, -100.0 ) );
    self setentitytarget( var_0 );
    self.ignoreall = 0;
    self waittill( "shooting" );
    level thread _id_5822();
    var_0 delete();
    common_scripts\utility::flag_set( "littlebird_rpg_shot" );
    self.goalradius = 1024;
    self clearentitytarget();
}

_id_5821( var_0 )
{
    var_0 endon( "shooting" );
    var_0 waittill( "death" );

    if ( !isdefined( level._id_5794 ) )
        return;

    level._id_5794 maps\_utility::_id_13DC( "earlyout" );
}

_id_5822()
{
    thread maps\_utility::_id_26B1( "london_gfn_rpg" );
    wait 0.5;
    maps\_utility::_id_26B1( "london_hp2_pullup" );
}

_id_5823()
{
    common_scripts\utility::flag_wait( "docks_after_ambush" );
    wait 1;
    level._id_56DE maps\_utility::_id_168C( "london_ldr_tangosoncatwalk" );
    thread maps\_utility::_id_11F4( "london_hp2_engaging" );
    common_scripts\utility::flag_set( "docks_shoot_catwalk" );
    var_0 = getent( "littlebird_catwalk_lookat", "targetname" );
    var_1 = anglestoforward( ( 0.0, 90.0, 0.0 ) );
    var_2 = self.origin + var_1 * 300;
    var_3 = spawn( "script_origin", var_0.origin );
    _id_5795( var_3 );

    foreach ( var_5 in self.mgturret )
        var_5 settargetentity( var_3 );

    self setmaxpitchroll( 20, 20 );
    self setlookatent( var_3 );
    maps\_utility::_id_13DE( "earlyout" );
    thread _id_5825( var_3 );
    common_scripts\utility::flag_wait( "littlebird_at_catwalk" );
    thread _id_5828();
    _id_5824();
    self notify( "stop_target_move" );
    maps\_vehicle::_id_2A3D();
    var_3 delete();

    if ( maps\_utility::_id_1008( "earlyout" ) )
        maps\london_code::_id_571F( "littlebird_ambush_earlyout" );
    else
        self waittill( "follow_path_done" );

    if ( !common_scripts\utility::flag( "docks_littlebird_strafe" ) )
        thread _id_57AB( "littlebird_warehouse_line_path", "littlebird_warehouse_line_player_path" );
}

_id_5824()
{
    while ( !common_scripts\utility::flag( "littlebird_rpg_shot" ) && !maps\_utility::_id_1008( "earlyout" ) )
        wait 0.05;
}

_id_5825( var_0, var_1 )
{
    self endon( "stop_target_move" );
    var_1 = getent( "docks_catwalk_area", "targetname" );

    for (;;)
    {
        var_2 = _id_582E( var_1, self );

        if ( var_2.size > 0 )
        {
            var_3 = var_2[0];

            while ( isdefined( var_3 ) && isalive( var_3 ) )
            {
                var_4 = self._id_2891 gettagorigin( "tag_flash" );
                var_5 = vectortoangles( var_3.origin - var_4 );

                if ( var_5[0] > 15 )
                    break;

                if ( abs( var_5[1] ) - 90 > 45 )
                    break;

                var_6 = var_3.origin + ( 0.0, 0.0, 30.0 );
                var_7 = distance( var_0.origin, var_6 );
                var_8 = var_7 / 500;
                var_8 = max( var_8, 0.1 );
                var_0 moveto( var_6, var_8 );
                var_0 waittill( "movedone" );
            }
        }

        wait 0.05;
    }
}

_id_5826()
{
    self endon( "death" );

    for (;;)
    {
        wait 0.05;
        var_0 = self._id_2891 getturrettarget( 0 );

        if ( !_id_5859( var_0 ) && !self._id_57A6 )
            continue;

        if ( !isdefined( self._id_5827 ) )
        {
            var_1 = anglestoforward( self.angles + ( 20.0, 0.0, 0.0 ) );
            var_2 = self gettagorigin( "tag_flash" ) + var_1 * 100;
            self._id_5827 = spawn( "script_origin", var_2 );
            self._id_5827 linkto( self );
        }

        self._id_2891 settargetentity( self._id_5827 );
    }
}

_id_5828()
{
    wait 3;
    maps\_utility::_id_272F( "docks_littlebird_rpger" );
}

_id_5829()
{

}

_id_582A()
{
    self._id_2891 thread maps\london_code::_id_5275( "docks_heli_spotlight", "docks_heli_spotlight_cheap", "tag_flash", self );
}

_id_582B()
{
    self endon( "death" );
    self notify( "stop_littlebird_spotlight" );
    self endon( "stop_littlebird_spotlight" );

    if ( !isdefined( self._id_582C ) )
        self._id_582C = 0;

    for (;;)
    {
        if ( !maps\_utility::_id_1008( "spotlight_on" ) )
        {
            if ( self._id_582C )
            {
                self._id_582C = 1;
                maps\london_code::_id_5730();
            }

            wait 0.2;
            continue;
        }

        self._id_582C = 1;
        _id_582A();

        while ( maps\_utility::_id_1008( "spotlight_on" ) )
        {
            var_0 = undefined;

            if ( isdefined( self._id_582D ) )
            {
                self._id_2891 settargetentity( self._id_582D );

                while ( isdefined( self._id_582D ) )
                    wait 0.5;

                continue;
            }
            else
            {
                var_1 = _id_582E();

                if ( var_1.size > 0 )
                {
                    var_0 = var_1[0];
                    self._id_2891 settargetentity( var_0 );
                }
                else
                {

                }
            }

            if ( isdefined( var_0 ) && isai( var_0 ) )
            {
                var_2 = randomfloatrange( 2, 5 ) * 1000;
                var_3 = gettime() + var_2;

                while ( gettime() < var_3 )
                {
                    if ( !isdefined( var_0 ) || !isalive( var_0 ) )
                        break;

                    wait 0.1;
                }

                continue;
            }

            wait(randomfloatrange( 2, 5 ));
        }
    }
}

_id_5795( var_0 )
{
    level._id_5794._id_582D = var_0;
    level._id_5794 thread _id_582B();
}

_id_57A9()
{
    level._id_5794._id_582D = undefined;
}

_id_582E( var_0, var_1 )
{
    var_2 = maps\_utility::_id_0B53( getaiarray( "axis" ) );
    var_2 = maps\_utility::_id_2672( var_2 );
    var_3 = self._id_2891 gettagorigin( "tag_flash" );
    var_4 = [];

    foreach ( var_6 in var_2 )
    {
        if ( var_6.origin[0] > 78000 )
            continue;

        var_7 = sighttracepassed( var_3, var_6.origin + ( 0.0, 0.0, 60.0 ), 0, self );

        if ( !isdefined( var_7 ) || !var_7 )
            continue;

        if ( self._id_2942 )
        {
            var_8 = vectortoangles( var_6.origin - var_3 );

            if ( var_8[0] > 15 )
                continue;

            if ( abs( var_8[1] ) - 90 > 45 )
                continue;
        }

        if ( isdefined( var_0 ) && !var_6 istouching( var_0 ) )
            continue;

        var_4[var_4.size] = var_6;
    }

    if ( isdefined( var_1 ) )
        var_4 = sortbydistance( var_4, var_1.origin );
    else
        var_4 = sortbydistance( var_4, level.player.origin );

    return var_4;
}

_id_5796( var_0 )
{
    self endon( "death" );

    if ( !isdefined( var_0 ) )
        var_0 = 100;

    var_1 = self.origin;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * -1, var_0 );
        var_3 = randomfloatrange( var_0 * -1, var_0 );
        var_4 = randomfloatrange( var_0 * -1, var_0 );
        var_5 = randomfloatrange( 0.5, 1.5 );
        var_6 = var_1 + ( var_2, var_3, var_4 );
        self moveto( var_6, var_5, var_5 * 0.4, var_5 * 0.4 );
        self waittill( "movedone" );
    }
}

_id_57AB( var_0, var_1 )
{
    maps\_utility::_id_13DC( "follow_path" );
    self endon( "stop_follow_line_path" );
    var_2 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_3 = common_scripts\utility::getstruct( var_2.target, "targetname" );
    var_4 = vectortoangles( var_3.origin - var_2.origin );
    var_5 = var_4[1];
    var_6 = distance( var_2.origin, var_3.origin );
    var_7 = var_3.angles[1] - var_2.angles[1];
    var_8 = var_3.radius - var_2.radius;
    var_9 = 30;
    var_10 = undefined;
    var_11 = undefined;
    var_12 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_10 = common_scripts\utility::getstruct( var_1, "targetname" );
        var_11 = common_scripts\utility::getstruct( var_10.target, "targetname" );
        var_12 = distance( var_10.origin, var_11.origin );
    }

    for (;;)
    {
        var_13 = pointonsegmentnearesttopoint( var_2.origin, var_3.origin, level.player.origin );

        if ( isdefined( var_1 ) )
        {
            var_14 = pointonsegmentnearesttopoint( var_10.origin, var_11.origin, level.player.origin );
            var_15 = distance( var_14, var_10.origin );
            var_16 = var_15 / var_12;
        }
        else
        {
            var_15 = distance( var_13, var_2.origin );
            var_16 = var_15 / var_6;
        }

        var_17 = var_2.angles[1] + var_7 * var_16;
        self settargetyaw( var_17 );
        self setgoalyaw( var_17 );
        var_18 = randomint( 360 );
        var_19 = var_2.radius + var_8 * var_16;
        var_20 = randomfloatrange( 0, var_19 );

        if ( isdefined( var_1 ) )
        {
            var_15 = var_6 * var_16;
            var_21 = var_2.origin + anglestoforward( var_4 ) * var_15;
        }
        else
            var_21 = var_13 + anglestoforward( var_4 ) * var_20;

        self setvehgoalpos( var_21, 1 );
        common_scripts\utility::waittill_either( "near_goal", "goal" );
    }
}

_id_582F( var_0 )
{
    self endon( "death" );
    self._id_5728 = spawnstruct();
    self._id_5728._id_572E = var_0;
    self._id_5728._id_572B = 15;
    self._id_5728.direction = 1;
    self._id_5728._id_5729 = _id_5830( 1 );
    self setneargoalnotifydist( 200 );

    if ( !maps\_utility::_id_1008( "follow_path" ) )
        maps\london_code::_id_5727();

    for (;;)
    {
        if ( maps\_utility::_id_1008( "follow_path" ) )
        {
            wait 0.1;
            continue;
        }

        self._id_5728._id_5729 = maps\london_code::_id_572A( self._id_5728._id_5729["index"] );
        maps\london_code::_id_5727();
    }
}

_id_5830( var_0 )
{
    var_1 = maps\london_code::_id_572C();
    var_2 = distancesquared( var_1[0], self.origin );
    var_3 = var_1[0];
    var_4 = 0;

    foreach ( var_8, var_6 in var_1 )
    {
        var_7 = distancesquared( var_6, self.origin );

        if ( var_7 < var_2 )
        {
            var_3 = var_6;
            var_4 = var_8;
            var_2 = var_7;
        }
    }

    var_9 = [];

    if ( isdefined( var_0 ) )
    {
        var_4 += var_0;

        if ( var_4 > var_1.size + 1 )
            var_4 = var_4 - var_1.size + 1;

        var_9["point"] = maps\london_code::_id_572D( var_4 );
        var_9["index"] = var_4;
    }
    else
    {
        var_9["point"] = var_3;
        var_9["index"] = var_4;
    }

    return var_9;
}

_id_5831()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::get_target_ent();
    level._id_5794._id_5728._id_572E = var_0;
}

_id_578B()
{
    var_0 = getentarray( "snipers", "targetname" );
    common_scripts\utility::array_levelthread( var_0, ::_id_5836 );
    setsaveddvar( "laserrange", 4000 );
    setsaveddvar( "laserradius", 0.4 );
}

_id_5832()
{
    self endon( "death" );
    maps\_utility::_id_1654( "in_position" );
    var_0 = spawn( "script_model", self gettagorigin( "tag_flash" ) );
    var_0 setmodel( "tag_laser" );
    var_0 thread _id_5835( self );
    self._id_5833 = var_0;
    var_0.target_ent = spawn( "script_origin", self gettagorigin( "tag_flash" ) );
    var_0 thread _id_583A();
    thread _id_585A();

    while ( !common_scripts\utility::flag( "docks_warehouse" ) )
    {
        if ( common_scripts\utility::flag( "docks_check_truck" ) && !common_scripts\utility::flag( "docks_ambush" ) )
        {
            wait 0.5;
            var_0 laserforceoff();
            continue;
        }

        var_1 = var_0 _id_583E();

        if ( var_1.size == 0 )
        {
            var_0 laserforceoff();
            wait 1;
            continue;
        }

        if ( common_scripts\utility::flag( "docks_warehouse" ) )
            break;

        var_2 = var_1[0];
        var_2._id_5834 = 1;
        _id_5839( var_0, var_2 );

        if ( _id_583B( var_2 ) )
            var_2._id_5834 = undefined;
    }

    var_0.target_ent delete();
    var_0 delete();
}

_id_5835( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        wait 0.05;
        var_1 = var_0 gettagorigin( "tag_flash" );
        self.origin = var_1;
    }
}

_id_5836( var_0 )
{
    common_scripts\utility::flag_wait( "warehouse_sniper_done" );
    var_0 maps\_utility::script_delay();
    var_1 = var_0 maps\_utility::_id_166F();
    var_1._id_1032 = "drone";
    var_1 maps\_utility::_id_1402( "in_position" );

    if ( !isdefined( var_1.target ) )
        return;

    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_2 _id_5838( var_1, var_2.animation );
    var_1 thread _id_5832();

    for (;;)
    {
        if ( !isdefined( var_2.target ) )
            break;

        var_2 = common_scripts\utility::getstruct( var_2.target, "targetname" );

        if ( isdefined( var_2._id_2006 ) )
        {
            if ( isdefined( var_2.animation ) )
            {
                if ( isdefined( var_2._id_205D ) )
                {
                    var_3 = vectortoangles( var_2.origin - var_1.origin );
                    var_1 rotateto( var_3, 0.5 );
                }

                var_1 _id_5837( var_2.animation );
            }
        }

        if ( distancesquared( var_2.origin, var_1.origin ) > 100 )
        {
            var_4 = 95;
            var_5 = distance( var_1.origin, var_2.origin );
            var_6 = var_5 / var_4;
            var_1 moveto( var_2.origin, var_6 );

            if ( isdefined( var_2._id_205D ) && var_2._id_205D == 2 )
                var_1 common_scripts\utility::delaycall( var_6 * 0.8, ::rotateto, ( 0, var_2.angles[1], 0 ), 0.5 );

            wait(var_6);
        }

        if ( !isdefined( var_2._id_2006 ) )
        {
            if ( isdefined( var_2.animation ) )
            {
                if ( isdefined( var_2._id_205D ) )
                    var_1 rotateto( var_2.angles, 3 );

                var_2 _id_5838( var_1, var_2.animation );
            }
        }

        if ( isdefined( var_2._id_2058 ) )
            var_1 maps\_utility::_id_13DC( var_2._id_2058 );

        if ( isdefined( var_2._id_2057 ) )
            common_scripts\utility::flag_set( var_2._id_2057 );

        if ( isdefined( var_2._id_1288 ) )
            common_scripts\utility::flag_wait( var_2._id_1288 );

        var_2 maps\_utility::script_delay();

        if ( isdefined( var_2._id_214A ) )
        {
            var_1 delete();
            break;
        }
    }
}

_id_5837( var_0 )
{
    var_1 = maps\_utility::_id_1281( "body" );
    self clearanim( var_1, 0.2 );
    self stopanimscripted();
    var_2 = maps\_utility::_id_1281( var_0 );
    self setflaggedanimrestart( "drone_anim", var_2, 1, 0.2, 1 );
}

_id_5838( var_0, var_1, var_2 )
{
    var_3 = maps\_anim::_id_1202();
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];
    var_6 = var_0 maps\_utility::_id_1281( var_1 );

    if ( isdefined( var_2 ) )
        var_0 setflaggedanimknobrestart( "drone_anim", var_6, 1, 0.2 );
    else
        var_0 animscripted( "drone_anim", var_4, var_5, var_6 );

    for (;;)
    {
        var_0 waittill( "drone_anim", var_7 );

        if ( var_7 == "end" )
            break;
    }
}

_id_5839( var_0, var_1 )
{
    level endon( "docks_warehouse" );
    var_0.target_ent moveto( var_1.origin + ( 0.0, 0.0, 32.0 ), 1 );
    var_0.target_ent waittill( "movedone" );

    if ( !var_0 _id_583C( var_1 ) )
        return;

    var_0 laserforceon();
    var_2 = randomintrange( 8, 16 ) * 2;
    var_3 = 0.2;

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        if ( !_id_583B( var_1 ) )
            break;

        var_5 = var_1 gettagorigin( "j_head" );
        var_6 = ( randomfloatrange( -5, 5 ), randomfloatrange( -5, 5 ), randomfloatrange( -5, 5 ) );
        var_0.target_ent moveto( var_5 + var_6, var_3 );
        wait(var_3);
    }

    if ( !var_0 _id_583C( var_1 ) )
        return;

    var_0.target_ent moveto( var_1 gettagorigin( "j_head" ), 0.05 );
    var_7 = var_0.origin;
    var_6 = 10;
    var_8 = randomfloatrange( var_6 * -1, var_6 );
    var_9 = randomfloatrange( var_6 * -1, var_6 );
    var_10 = randomfloatrange( var_6 * -1, var_6 );
    var_11 = var_1 gettagorigin( "j_head" ) + ( var_8, var_9, var_10 );
    thread _id_5838( self, "fire", 1 );
    playfxontag( common_scripts\utility::getfx( "silencer_flash" ), var_0, "tag_laser" );
    magicbullet( "mp5", var_7, var_11 );
    wait 0.5;
    var_0 laserforceoff();
    _id_5838( self, "reload", 1 );
    wait(randomfloatrange( 1, 2 ));
    var_0 laserforceon();
}

_id_583A()
{
    self endon( "death" );
    level endon( "docks_warehouse" );
    var_0 = 0.05;

    for (;;)
    {
        var_1 = vectortoangles( self.target_ent.origin - self.origin );
        self.angles = var_1;
        wait(var_0);
    }
}

_id_583B( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isalive( var_0 ) )
        return 0;

    if ( var_0 maps\_utility::_id_0D69() )
        return 0;

    return 1;
}

_id_583C( var_0, var_1 )
{
    if ( !_id_583B( var_0 ) )
        return 0;

    if ( isdefined( var_1 ) )
        return 1;

    if ( !_id_583D( var_0 ) )
        return 0;

    return 1;
}

_id_583D( var_0 )
{
    var_1 = bullettracepassed( self.origin, var_0 gettagorigin( "j_head" ), 0, self );

    if ( !isdefined( var_1 ) || !var_1 )
        return 0;

    return 1;
}

_id_583E( var_0, var_1 )
{
    var_2 = maps\_utility::_id_0B53( getaiarray( "axis" ) );
    var_2 = maps\_utility::_id_2672( var_2 );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5.origin[0] > 78000 )
            continue;

        if ( !_id_583D( var_5 ) )
            continue;

        if ( isdefined( var_0 ) && !var_5 istouching( var_0 ) )
            continue;

        if ( isdefined( var_5._id_5834 ) )
            continue;

        var_3[var_3.size] = var_5;
    }

    if ( isdefined( var_1 ) )
        var_3 = sortbydistance( var_3, var_1.origin );
    else
        var_3 = sortbydistance( var_3, level.player.origin );

    return var_3;
}

_id_56E9()
{
    var_0 = getent( "sewer_pipes_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( var_2 == level._id_5794 )
            break;
    }

    var_0 delete();
    var_10 = getentarray( "sewer_pipe", "targetname" );
    var_11 = getent( "docks_bulldozer", "targetname" );
    var_10[var_10.size] = var_11;

    foreach ( var_13 in var_10 )
    {
        maps\_utility::_id_282D( var_13, "docks_stuff" );
        var_13._id_1032 = var_13.script_noteworthy;
        var_13 maps\_anim::_id_1244();
        var_13 maps\_utility::_id_1402( "anim_stopped" );
        var_13 thread _id_583F();
    }

    var_15 = common_scripts\utility::getstruct( "sewer_pipes_animnode", "targetname" );
    var_15 thread maps\_anim::_id_11DD( var_10, "sewer_pipe_roll" );
    level thread _id_5841( var_15, var_10 );
    wait 6;
    var_16 = getent( "sewer_pipes_blocker", "targetname" );
    var_16 disconnectpaths();
    common_scripts\utility::flag_set( "sewer_pipes_done" );
}

_id_583F()
{
    self endon( "death" );

    if ( self.targetname != "sewer_pipe" )
        return;

    while ( self.origin[2] > 575 )
        wait 0.05;

    thread _id_5840();

    while ( !maps\_utility::_id_1008( "anim_stopped" ) )
    {
        wait 0.2;
        playfxontag( common_scripts\utility::getfx( "dirt_kickup_concrete_cylinder_loop" ), self, "tag_origin" );
    }
}

_id_5840()
{
    self endon( "death" );
    self waittillmatch( "single anim", "end" );
    maps\_utility::_id_13DC( "anim_stopped" );
}

_id_5841( var_0, var_1 )
{
    var_2 = 6000;
    var_3 = gettime() + var_2;

    while ( gettime() < var_3 )
    {
        wait 0.05;
        var_4 = getaiarray( "axis" );

        if ( isalive( level.player ) )
        {
            foreach ( var_6 in var_1 )
            {
                if ( var_6.script_noteworthy == "sewer_pipe3" )
                    continue;

                if ( var_3 - gettime() > var_2 - 1100 && var_6.script_noteworthy == "sewer_pipe2" )
                    continue;

                if ( level.player _id_5843( var_6 ) )
                    level.player kill( level.player.origin + ( 1000.0, 0.0, 0.0 ) );
            }
        }

        foreach ( var_9 in var_4 )
        {
            foreach ( var_6 in var_1 )
            {
                if ( var_9 _id_5843( var_6 ) )
                {
                    var_9._id_0D45 = ::_id_5842;
                    var_9._id_0D50 = maps\_utility::_id_26EC( "standing_death" );
                    var_9 kill( var_9.origin + ( 1000.0, 0.0, 0.0 ) );
                }
            }
        }
    }
}

_id_5842()
{
    var_0 = anglestoforward( ( 0.0, -180.0, 0.0 ) ) * 5000;
    self startragdollfromimpact( "torso_lower", var_0 );
    wait 0.05;
}

_id_5843( var_0 )
{
    var_1 = 150;
    var_2 = var_0.origin[0] + var_1 * -1;
    var_3 = var_0.origin[0] + var_1 - 80;
    var_4 = 100;
    var_5 = var_0.origin[1] + var_4 * -1;
    var_6 = var_0.origin[1] + var_4;

    if ( self.origin[0] < var_3 && self.origin[0] > var_2 && self.origin[1] < var_6 && self.origin[1] > var_5 )
        return 1;

    return 0;
}

_id_5844()
{
    if ( !isdefined( level._id_56D7 ) )
        level._id_56D7 = [];

    level._id_56D7[level._id_56D7.size] = self;
}

_id_5845()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );

    for (;;)
    {
        self waittill( "trigger", var_2 );

        while ( var_2 istouching( self ) )
        {
            var_3 = vectornormalize( var_1.origin - var_0.origin );
            var_4 = var_2.origin - var_0.origin;
            var_5 = vectordot( var_4, var_3 );

            foreach ( var_7 in level._id_56FA )
            {
                var_8 = var_7.origin - var_0.origin;
                var_9 = vectordot( var_8, var_3 );
                var_10 = var_5 - var_9;
                var_11 = 1 + var_10 * 0.01;
                var_11 = clamp( var_11, 1.1, 1.4 );

                if ( var_11 > 1.1 )
                {
                    var_7._id_0FC6 = var_11;
                    continue;
                }

                var_7._id_0FC6 = 1.1;
            }

            wait 0.05;
        }

        foreach ( var_7 in level._id_56FA )
            var_7._id_0FC6 = 1.1;
    }
}

_id_5764()
{
    common_scripts\utility::flag_wait( "warehouse_complete" );
    var_0 = getentarray( "london_docks_warehouse_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_0 );
    maps\_utility::_id_27DF( var_0 );
    maps\_utility::_id_2822( "london_docks_warehouse_volume" );
    var_1 = getentarray( "trigger_multiple", "code_classname" );
    var_2 = 78944;
    var_3 = 83000;

    foreach ( var_5 in var_1 )
    {
        if ( var_5.classname == "trigger_multiple_fx_volume" )
            continue;

        if ( isdefined( var_5._id_0B54 ) )
            continue;

        if ( var_5.origin[0] > var_2 && var_5.origin[0] < var_3 )
            var_5 delete();
    }

    common_scripts\utility::flag_wait( "docks_street" );
    var_1 = getentarray( "trigger_multiple", "code_classname" );

    foreach ( var_5 in var_1 )
    {
        if ( var_5.classname == "trigger_multiple_friendly_respawn" )
            var_1 = common_scripts\utility::array_remove( var_1, var_5 );

        if ( var_5.classname == "trigger_multiple_fx_volume" )
            var_1 = common_scripts\utility::array_remove( var_1, var_5 );

        if ( var_5.classname == "trigger_multiple_ambient" )
            var_1 = common_scripts\utility::array_remove( var_1, var_5 );

        if ( isdefined( var_5._id_1341 ) )
            var_1 = common_scripts\utility::array_remove( var_1, var_5 );

        if ( isdefined( var_5._id_0B54 ) )
            var_1 = common_scripts\utility::array_remove( var_1, var_5 );
    }

    var_1 = common_scripts\utility::array_combine( var_1, getspawnerarray() );
    var_2 = 75400;
    var_3 = 83000;
    var_9 = -1152;

    foreach ( var_5 in var_1 )
    {
        if ( var_5.origin[0] > var_2 && var_5.origin[1] < var_9 && var_5.origin[0] < var_3 )
            var_5 delete();
    }
}

_id_5846()
{
    if ( !isalive( self ) )
        return;

    self notify( "end_patrol" );
    self.ignoreall = 0;
    self.ignoreme = 0;
    maps\_utility::_id_257D();
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    maps\_utility::_id_140C();
    self.dodangerreact = 1;
    self.dangerreactduration = 1000;
    var_0 = getentarray( "docks_cover_area", "script_noteworthy" );
    var_0 = sortbydistance( var_0, self.origin );
    self setgoalvolumeauto( var_0[0] );

    if ( !isdefined( self.target ) )
        return;

    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    var_1 notify( "stop_loop" );
    maps\_utility::_id_1414();
}

_id_5847( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );

    if ( !isdefined( var_3 ) )
        var_3 = 20;

    if ( !isdefined( var_4 ) )
        var_4 = 30;

    var_6 = [];

    for ( var_7 = 0; var_7 < var_1; var_7++ )
        var_6[var_7] = var_0 + ( var_7 + 1 );

    while ( !common_scripts\utility::flag( var_2 ) )
    {
        var_6 = maps\_utility::_id_0B53( var_6 );

        for ( var_7 = 0; var_7 < var_1; var_7++ )
        {
            wait(randomfloatrange( var_3, var_4 ));

            if ( common_scripts\utility::flag( var_2 ) )
                break;

            maps\_utility::_id_168C( var_6[var_7] );
        }

        if ( isdefined( var_5 ) )
            wait(var_5);
    }
}

_id_5848( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[0] = var_5;
    thread _id_5849( var_5, var_1 );
}

_id_5849( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 20;

    if ( !isdefined( var_4 ) )
        var_4 = 30;

    foreach ( var_6 in var_0 )
    {
        if ( common_scripts\utility::flag( var_2 ) )
            return;

        wait(randomfloatrange( var_3, var_4 ));

        if ( common_scripts\utility::flag( var_2 ) )
            return;

        if ( !isdefined( var_6 ) )
            continue;

        if ( !isalive( var_6 ) || var_6 maps\_utility::_id_0D69() )
            continue;

        var_6 maps\_utility::_id_168C( var_1 );
    }
}

_id_584A( var_0 )
{
    level endon( var_0 );
    self waittill( "death" );
    common_scripts\utility::flag_set( var_0 );
}

_id_584B( var_0 )
{
    if ( !common_scripts\utility::flag_exist( "radio_dialogue_done" ) )
        common_scripts\utility::flag_init( "radio_dialogue_done" );

    common_scripts\utility::flag_clear( "radio_dialogue_done" );
    thread _id_584C( var_0 );
}

_id_584C( var_0 )
{
    _id_584D( var_0 );
    common_scripts\utility::flag_set( "radio_dialogue_done" );
}

_id_584D( var_0 )
{
    if ( !isdefined( level._id_26B0 ) )
        maps\_utility::_id_11F4( var_0 );
    else
        maps\_utility::_id_26B1( var_0 );
}

_id_584E()
{
    self waittill( "trigger" );
    var_0 = getentarray( self.target, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            continue;

        var_2 thread _id_57A1();
    }
}

_id_57A1()
{
    if ( isdefined( self._id_584F ) )
        return;

    self._id_584F = 1;
    maps\_utility::script_delay();
    var_0 = 104;
    var_1 = self.origin[2] + var_0;
    var_2 = getentarray( self.target, "targetname" );
    var_3 = [];
    var_4 = undefined;

    foreach ( var_6 in var_2 )
    {
        if ( isspawner( var_6 ) )
        {
            var_3[var_3.size] = var_6;
            continue;
        }

        var_6 linkto( self );
        var_6 thread _id_5850( var_1 );
    }

    if ( var_3.size > 0 )
        maps\_utility::_id_272B( var_3 );

    var_8 = 48;
    var_9 = 2.5;
    var_10 = var_0 / var_9;
    var_9 = var_8 / var_10;
    maps\_utility::play_sound_on_entity( "door_garage_metal_rolling_up" );
    self movez( var_8, var_9, var_9 * 0.8 );
    wait(var_9 - 0.05);
    self connectpaths();
    var_0 -= var_8;
    var_9 = var_0 / var_10;
    self movez( var_0, var_9 );
}

_id_5850( var_0 )
{
    while ( self.origin[2] < var_0 )
        wait 0.05;

    self delete();
}

_id_5851()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    missile_deleteattractor( self.attractor );
}

_id_5852( var_0, var_1 )
{
    self endon( "death" );
    self waittillmatch( var_0, var_1 );
}

_id_5853( var_0, var_1, var_2 )
{
    self notify( "waittillmatch_timeout" );
    thread _id_5854( var_2 );
    self endon( "waittillmatch_timeout" );
    self endon( "death" );
    self waittillmatch( var_0, var_1 );
    self notify( "waittillmatch_timeout" );
}

_id_5854( var_0 )
{
    self endon( "waittillmatch_timeout" );
    wait(var_0);
    self notify( "waittillmatch_timeout" );
}

_id_5855( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self._id_1032;

    if ( isdefined( level._id_0C59[var_1][var_0] ) )
        return 1;

    return 0;
}

_id_5856()
{
    foreach ( var_1 in level._id_56FA )
    {
        if ( var_1 != self )
            return var_1;
    }

    return undefined;
}

_id_5857( var_0, var_1 )
{
    var_2 = 0;
    var_3 = bullettrace( var_0, var_1, 1 );

    if ( isdefined( var_3["entity"] ) && var_3["entity"] == level.player )
        var_2 = 1;

    if ( isdefined( var_3["fraction"] ) < 0.8 )
        var_2 = 1;

    playfxontag( common_scripts\utility::getfx( "silencer_flash" ), self, "tag_flash" );

    if ( var_2 )
    {
        var_4 = vectortoangles( var_1 - var_0 );
        var_5 = anglestoforward( var_4 );
        var_0 = var_1 + var_5 * -10;
    }

    magicbullet( self.weapon, var_0, var_1 );
}

_id_5858()
{
    maps\_utility::_id_109B();
    self._id_0FC6 = 1.1;
}

_id_5790()
{
    maps\_utility::_id_109E();
    self._id_0FC6 = 1;
}

_id_20C0( var_0, var_1 )
{

}

_id_5859( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( isai( var_0 ) )
    {
        if ( !isalive( var_0 ) )
            return 1;

        if ( var_0 maps\_utility::_id_0D69() )
            return 1;
    }

    return 0;
}

_id_57A8( var_0, var_1 )
{
    self endon( "death" );
    var_2 = common_scripts\utility::getstruct( var_0, "targetname" );

    for ( var_3 = var_2; isdefined( var_3 ); var_3 = common_scripts\utility::getstruct( var_3.target, "targetname" ) )
    {
        var_4 = distance( self.origin, var_3.origin );
        var_5 = var_4 / var_1;
        self moveto( var_3.origin, var_5 );
        wait(var_5);

        if ( !isdefined( var_3.target ) )
            break;
    }
}
#using_animtree("generic_human");

_id_585A()
{
    self endon( "death" );
    self useanimtree( #animtree );
    var_0 = 0.2;
    self setanimknoball( %prone_aim_5, %body, 1, var_0 );
    self setanimlimited( %prone_aim_2_add, 1, var_0 );
    self setanimlimited( %prone_aim_4_add, 1, var_0 );
    self setanimlimited( %prone_aim_6_add, 1, var_0 );
    self setanimlimited( %prone_aim_8_add, 1, var_0 );
    var_1 = %aim_2;
    var_2 = %aim_4;
    var_3 = %aim_6;
    var_4 = %aim_8;
    var_5 = 10;
    var_6 = 30;
    var_7 = 0;
    var_8 = 0;
    var_9 = 1;
    var_10 = var_5;

    while ( !common_scripts\utility::flag( "docks_warehouse" ) )
    {
        var_11 = self gettagorigin( "tag_flash" );
        var_12 = self._id_5833.target_ent.origin;
        var_13 = vectortoangles( var_12 - var_11 );
        var_14 = self.angles - var_13;
        var_15 = var_14[0];
        var_16 = var_14[1];
        var_10 = var_5;
        var_17 = squared( var_10 );
        var_18 = !var_9;

        if ( var_18 )
        {
            var_19 = var_16 - var_7;

            if ( squared( var_19 ) > var_17 )
            {
                var_16 = var_7 + clamp( var_19, -1 * var_10, var_10 );
                var_16 = clamp( var_16, -90, 90 );
            }

            var_20 = var_15 - var_8;

            if ( squared( var_20 ) > var_17 )
            {
                var_15 = var_8 + clamp( var_20, -1 * var_10, var_10 );
                var_15 = clamp( var_15, -60, 60 );
            }
        }

        var_9 = 0;
        var_7 = var_16;
        var_8 = var_15;
        _id_585B( var_1, var_2, var_3, var_4, var_15, var_16 );
        wait 0.05;
    }
}

_id_585B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 1.0;
    var_7 = 0.1;

    if ( var_5 > 0 )
    {
        var_8 = var_5 / 90 * var_6;
        self setanimlimited( var_1, 0, var_7, 1, 1 );
        self setanimlimited( var_2, var_8, var_7, 1, 1 );
    }
    else if ( var_5 < 0 )
    {
        var_8 = var_5 / -90 * var_6;
        self setanimlimited( var_2, 0, var_7, 1, 1 );
        self setanimlimited( var_1, var_8, var_7, 1, 1 );
    }

    if ( var_4 > 0 )
    {
        var_8 = var_4 / 60 * var_6;
        self setanimlimited( var_0, 0, var_7, 1, 1 );
        self setanimlimited( var_3, var_8, var_7, 1, 1 );
    }
    else if ( var_4 < 0 )
    {
        var_8 = var_4 / -60 * var_6;
        self setanimlimited( var_3, 0, var_7, 1, 1 );
        self setanimlimited( var_0, var_8, var_7, 1, 1 );
    }
}
