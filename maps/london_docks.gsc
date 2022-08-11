// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

pre_load()
{
    maps\_vehicle::_id_29FE( "script_vehicle_sas_van_physics", "sas_van_physics", "script_vehicle_sas_van_physics", "explosions/large_vehicle_explosion_london", undefined, "car_explode" );
    maps\_patrol_anims::main();
    maps\london_docks_anim::main();
    maps\london_docks_code::_id_575C();
    maps\london_uav::_id_5731();
}

main()
{
    if ( isdefined( level._id_575D ) )
        return;

    level._id_575D = 1;
    level._id_2981 = 1;
    maps\london_docks_code::_id_575E();
    maps\london_docks_code::_id_575F();
    maps\london_docks_code::_id_5760();
    maps\london_docks_code::_id_5761();
    level thread maps\london_docks_code::_id_0099();
    level thread maps\london_docks_code::_id_5762();
    thread maps\london_docks_code::_id_009A();
    thread maps\london_docks_code::_id_5763();
    thread maps\london_docks_code::_id_5764();
    thread maps\london_docks_code::_id_5765();
    thread maps\london_docks_anim::_id_527E();
    level._id_5766 = maps\_vehicle::_id_2A98( "docks_sas_van" );

    if ( !isdefined( level._id_5763 ) )
        level._id_5763 = 0;

    maps\london_docks_code::_id_5767();
    var_0 = getentarray( "snipers", "targetname" );

    foreach ( var_2 in var_0 )
        var_2._id_2004 = 1;

    var_4 = getent( "docks_truck_clip", "targetname" );
    var_4 connectpaths();
    var_4 common_scripts\utility::trigger_off();
    var_5 = getent( "sewer_pipe_collision", "targetname" );
    var_5 connectpaths();
    var_5 notsolid();
    var_5 hide();
}

_id_5768()
{

}

_id_5769()
{

}

_id_576A( var_0 )
{
    self endon( "death" );
    self notify( "stop_print3d_on_ent" );
    self endon( "stop_print3d_on_ent" );

    for (;;)
        wait 0.05;
}

_id_576B()
{

}

_id_5434()
{
    maps\london_code::_id_5700( "docks_start" );
    thread maps\_utility::_id_194E( "london_docks" );
}

_id_576C()
{
    level._id_5763 = 1;
    maps\london_code::_id_5700( "2nd_alley_start" );
}

_id_576D()
{
    maps\london_code::_id_5700( "warehouse_start" );
}

_id_576E()
{
    maps\london_code::_id_5700( "warehouse_hallway" );
}

_id_576F()
{
    maps\london_code::_id_5700( "docks_assault_start" );
}

_id_5770()
{
    var_0 = maps\_utility::_id_272D( "sas_orange" );

    foreach ( var_2 in var_0 )
    {
        var_2 thread maps\london_docks_code::_id_5771();
        var_2.script_noteworthy = undefined;
    }

    maps\london_code::_id_5700( "docks_assault_ambush", var_0 );
    maps\london_docks_code::_id_5772( "docks_littlebird_spawner", "littlebird_ambush_start" );
}

_id_5773()
{
    var_0 = maps\_utility::_id_272D( "sas_orange" );

    foreach ( var_2 in var_0 )
    {
        var_2 thread maps\london_docks_code::_id_5771();
        var_2.script_noteworthy = undefined;
    }

    if ( getdvar( "test_chopper_rocket" ) != "" )
    {
        common_scripts\utility::flag_set( "docks_street" );
        maps\london_code::_id_5700( "docks_assault_streets", var_0 );
        maps\london_code::_id_5700( "docks_assault_streets_chopper" );
        maps\london_docks_code::_id_5772( "docks_littlebird_spawner", "littlebird_rocket_path" );
        return;
    }

    maps\london_code::_id_5700( "docks_assault_streets", var_0 );
    maps\london_docks_code::_id_5772( "docks_littlebird_spawner", "littlebird_streets_start" );
    var_4 = getent( "docks_gate_door", "targetname" );
    var_4 connectpaths();
    var_4 rotateto( ( 0.0, -112.0, 0.0 ), 1, 0, 0 );
}

_id_5119()
{
    main();
    _id_5781();
    level.player playsound( "scn_london_uav_intro" );
    level thread maps\london_docks_code::_id_5774();
    level thread maps\london_docks_code::_id_5775();
    level thread maps\london_docks_code::_id_5776();
    level._id_5777._id_5778 = level.player.origin;
    level._id_5777._id_5779 = level.player.angles;

    if ( getdvarint( "quick_uav" ) )
    {
        var_0 = getent( "intro_uav", "targetname" );
        var_1 = getvehiclenode( "quick_uav_node", "script_noteworthy" );
        var_0.target = var_1.targetname;
    }

    var_2 = maps\london_uav::_id_5733( "intro_uav", level.player, level._id_5777._id_56E2.origin );
    var_2 thread maps\london_docks_code::_id_577A();
    var_2 maps\_utility::_id_1402( "slamzoom" );
    var_2 maps\_utility::_id_1402( "focus_on_player" );
    level._id_3C2C = var_2;
    common_scripts\utility::flag_wait( "introscreen_complete" );
    maps\_utility::delaythread( 2, maps\london_uav::_id_574E, 4, 10, 10, 5, 5 );
    thread maps\london_docks_code::_id_5240();

    if ( getdvarint( "quick_uav" ) )
    {
        level._id_5777._id_56E2 maps\_utility::_id_1402( "cargo_unloading" );
        common_scripts\utility::flag_set( "uav_focusing_on_player" );
        maps\london_docks_code::_id_577B( var_2 );
        var_2 maps\_utility::_id_1654( "slamzoom" );
        var_2 maps\london_docks_code::_id_577C();
        maps\london_docks_code::_id_577D();
        return;
    }

    maps\london_docks_code::_id_577E( var_2 );
    maps\london_docks_code::_id_577F( var_2 );
    common_scripts\utility::flag_set( "uav_focusing_on_enemies" );
    maps\london_docks_code::_id_5780( var_2 );
    common_scripts\utility::flag_set( "uav_focusing_on_player" );
    maps\london_docks_code::_id_577B( var_2 );
    var_2 maps\_utility::_id_1654( "focus_on_player" );
    level.player lerpfov( 20, 4 );
    maps\london_uav::_id_574E( 2, 0, 0, 0, 0 );
    var_2 maps\_utility::_id_1654( "slamzoom" );
    common_scripts\utility::flag_set( "uav_slamzoom" );
    var_2 maps\london_docks_code::_id_577C();
    common_scripts\utility::flag_set( "uav_slamzoom_done" );
    thread maps\_utility::_id_276D( "sm_sunsamplesizenear", 0.25, 0.5 );
    _id_5785();
    maps\london_docks_code::_id_577D();
}

_id_5781()
{
    level._id_5782 = [];
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.model != "vehicle_luxurysedan_2008_destructible" )
            continue;

        if ( var_2.origin[0] < 75000 )
            continue;

        level._id_5782[level._id_5782.size] = var_2;
    }

    var_0 = getentarray( "docks_truck_flir", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_5783 = "vehicle_uk_delivery_truck_flir";
        level._id_5782[level._id_5782.size] = var_2;
    }

    foreach ( var_2 in level._id_5782 )
    {
        if ( isdefined( var_2._id_5783 ) )
        {
            var_2._id_5784 = var_2.model;
            var_2 setmodel( var_2._id_5783 );
        }

        var_2 thermaldrawenable();
    }
}

_id_5785()
{
    foreach ( var_1 in level._id_5782 )
    {
        if ( isdefined( var_1._id_5784 ) )
        {
            var_1 setmodel( var_1._id_5784 );
            var_1._id_5784 = undefined;
            var_1._id_5783 = undefined;
        }

        var_1 thermaldrawdisable();
    }

    level._id_5782 = undefined;
}

_id_5786()
{
    main();
    maps\london_docks_code::_id_577D();
    thread _id_00A3();
    maps\_utility::_id_265A();
    maps\_utility::_id_2797( 68 );
    level.player disableoffhandweapons();

    if ( maps\london_code::_id_5711( "start_of_level" ) )
        level thread maps\london_docks_code::_id_5775();

    common_scripts\utility::flag_wait( "warehouse_player_lead_8" );
}

_id_00A3()
{
    common_scripts\utility::flag_wait( "uav_slamzoom_done" );
    common_scripts\utility::flag_wait( "uav_dialog_done" );
    wait 1;
    maps\_utility::_id_1425( "post_intro" );
}

_id_5787()
{
    main();
    maps\london_docks_code::_id_577D();
    common_scripts\utility::flag_wait( "warehouse_top" );
    maps\_utility::_id_1425( "warehouse_complete" );
    maps\_utility::_id_2797( 100, 3 );
    level.player enableoffhandweapons();
    level.player.ignoreme = 1;
    common_scripts\utility::array_thread( level._id_56FA, maps\_utility::_id_0A23, 1 );

    if ( level._id_1F19 != "docks_assault_ambush" )
        maps\london_docks_code::_id_5788();

    common_scripts\utility::flag_set( "docks_assault" );
    setsaveddvar( "sm_qualitySpotShadow", 0 );

    if ( level._id_1F19 == "docks_assault_ambush" )
    {
        maps\_vehicle::_id_2A98( "docks_littlebird_spawner" );
        thread _id_578E();
    }
    else
    {
        maps\london_docks_code::_id_5789();
        maps\_utility::delaythread( 5, maps\_vehicle::_id_2A9A, "docks_littlebird_spawner" );
        common_scripts\utility::array_thread( level._id_5766, maps\_vehicle::_id_1FA6 );
        common_scripts\utility::array_thread( level._id_5766, ::_id_578D );
        maps\_utility::delaythread( 2, maps\london_docks_code::_id_578A );
        maps\_utility::_id_26BF( "docks_assault_colors" );
        thread _id_578E();
        thread maps\london_docks_code::_id_578B();
        common_scripts\utility::array_thread( level._id_56FA, maps\london_docks_code::_id_578C );
        maps\_utility::_id_26BF( "docks_sas_leader_colors" );
        common_scripts\utility::flag_wait( "out_of_warehouse" );
        var_0 = getentarray( "docks_floodspawners", "targetname" );
        maps\_spawner::_id_2135( var_0 );
        common_scripts\utility::flag_wait_or_timeout( "docks_entrance", 10 );
        maps\_spawner::_id_213C( 100 );
    }

    level thread _id_5791();
}

_id_578D()
{
    if ( isdefined( self._id_164F ) )
    {
        thread maps\_utility::play_sound_on_entity( "scn_london_rpg_van_arrive" );
        self waittill( "unloading" );
        thread maps\_utility::play_sound_on_entity( "scn_london_rpg_van_doors" );
    }
    else
    {
        wait 1;
        thread maps\_utility::play_sound_on_entity( "scn_london_rpg_van_arrive2" );
    }
}

_id_578E()
{
    common_scripts\utility::flag_wait_or_timeout( "out_of_warehouse", 5 );
    common_scripts\utility::array_thread( level._id_56FA, ::_id_578F );
    level.player.ignoreme = 0;
    maps\_utility::_id_265B();
}

_id_578F()
{
    self.ignoreme = 0;
    self.ignoreall = 0;
    self.nododgemove = 0;
    maps\london_docks_code::_id_5790();
    self.ignoresuppression = 0;
    self.dontavoidplayer = 0;
    maps\_utility::_id_2520();
    maps\_utility::_id_2720();
    maps\_utility::_id_27B8();
    maps\_utility::_id_2803();
}

_id_5791()
{
    main();
    maps\london_docks_code::_id_577D();

    if ( level._id_1F19 != "docks_assault_ambush" )
        maps\_utility::_id_272C( "docks_enemy_group2" );

    level thread _id_5792();
}

_id_5792()
{
    if ( level._id_1F19 != "docks_assault_ambush" )
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
        {
            if ( !isalive( var_2 ) )
                continue;

            if ( var_2.origin[0] > 78900 )
            {
                var_2 kill();
                var_0 = common_scripts\utility::array_remove( var_0, var_2 );
            }
        }

        maps\_utility::_id_2636( var_0 );
    }

    wait 2;

    if ( common_scripts\utility::cointoss() )
        maps\_utility::_id_11F4( "london_sr1_thrubuildings" );
    else
    {
        level._id_56DE maps\_utility::_id_168C( "london_ldr_allclear2" );
        level._id_56FA[1] maps\_utility::_id_168C( "london_gfn_clear2" );
        var_4 = maps\_utility::_id_0AE9( level.player.origin, getaiarray( "allies" ) );
        var_4 maps\_utility::_id_26AF( "london_myr_clearboss" );
    }

    common_scripts\utility::flag_set( "docks_check_truck" );
    var_5 = getentarray( "docks_mid_color_trigger", "targetname" );
    common_scripts\utility::array_thread( var_5, common_scripts\utility::trigger_off );
    _id_5793();
}

_id_5793()
{
    level._id_5794 thread maps\london_code::_id_571F( "littlebird_ambush_path", ::_id_5797 );
    common_scripts\utility::flag_set( "docks_open_truck_door" );
    var_0 = getent( "docks_truck_door_chopper_target", "targetname" );
    maps\london_docks_code::_id_5795( var_0 );
    level._id_5794 setlookatent( var_0 );
    var_0 thread maps\london_docks_code::_id_5796( 50 );
    level._id_56DE thread maps\_utility::_id_168C( "london_ldr_perimetersecure" );
    maps\_utility::_id_26BF( "docks_truck_colors" );
    thread _id_579D();
    _id_5798();
    common_scripts\utility::flag_wait( "docks_truck_searched" );
}

_id_5797()
{
    self endon( "follow_path_done" );
    self endon( "stop_follow_path" );
    level endon( "littlebird_rpg_shot" );
    common_scripts\utility::flag_wait( "docks_warehouse" );
    maps\_utility::_id_13DC( "earlyout" );
}

_id_5798()
{
    level._id_56DE maps\_utility::_id_123B();
    var_0 = common_scripts\utility::getstruct( "dock_truck_anim_spot", "targetname" );
    var_1 = getstartorigin( var_0.origin, var_0.angles, level._id_56DE maps\_utility::_id_1281( "search_truck_entry" ) );
    var_0 maps\_anim::_id_124A( level._id_56DE, "search_truck_entry" );
    var_0 maps\_anim::_id_1246( level._id_56DE, "search_truck_entry" );
    level._id_56DE thread _id_579A( var_0 );
}

_id_579A( var_0 )
{
    thread _id_579C( var_0 );
    common_scripts\utility::flag_wait( "docks_truck_door_opened" );
    var_0 notify( "stop_loop" );
    maps\_utility::_id_1414();
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "docks_truck_searched" );
    level._id_56FA[1] maps\_utility::delaythread( 2.75, maps\_utility::_id_168C, "london_gfn_nickedweapons" );
    thread _id_579B();
    var_0 maps\_anim::_id_1246( self, "search_truck_lookinside" );
    level._id_56DE maps\_utility::_id_2686();
}

_id_579B()
{
    wait 0.1;
    var_0 = maps\_utility::_id_1281( "search_truck_lookinside" );
    var_1 = getanimlength( var_0 );
    self setanimtime( var_0, 0.25 );
}

_id_579C( var_0 )
{
    if ( common_scripts\utility::flag( "docks_truck_door_opened" ) )
        return;

    level endon( "docks_truck_door_opened" );
    var_1 = [ "london_ldr_opendoors", "london_ldr_youdim", "london_ldr_getdoorsopen" ];
    var_2 = 2;

    for (;;)
    {
        var_1 = maps\_utility::_id_0B53( var_1 );

        if ( var_2 == 0 )
        {
            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
            {
                var_4 = randomintrange( 1, 2 );

                for ( var_5 = 0; var_5 < var_4; var_5++ )
                    var_0 maps\_anim::_id_1246( self, "search_truck_idle" );

                level.scr_sound[self._id_1032]["search_truck_point"] = var_1[var_3];
                var_0 maps\_anim::_id_1246( self, "search_truck_point" );
            }
        }

        if ( var_2 > 0 )
            var_2--;

        var_0 maps\_anim::_id_1246( self, "search_truck_idle" );
    }
}

_id_579D()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "player_open_doors" );
    var_0 = getent( "docks_truck", "targetname" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( "vehicle_uk_delivery_truck_glowing" );
    var_2 = maps\london_docks_code::_id_579E();
    var_2 maps\london_code::_id_00FE();
    var_2 delete();
    common_scripts\utility::flag_set( "docks_truck_door_opened" );
    var_0 = getent( "docks_truck", "targetname" );
    var_0._id_1032 = "delivery_truck";
    var_0 maps\_utility::_id_2629();
    var_3 = maps\_utility::_id_1287( "player_rig" );
    var_3 hide();
    var_4 = "tag_guy4";
    var_5 = "player_open_truck_doors";
    var_6 = common_scripts\utility::spawn_tag_origin();
    var_6.origin = var_0 gettagorigin( var_4 ) + ( 0.0, 0.0, 1.0 );
    var_6.angles = var_0 gettagangles( var_4 );
    level.player setstance( "stand" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player disableweapons();
    var_6 maps\_anim::_id_11CF( var_3, var_5, "tag_origin" );
    level thread _id_579F( var_3 );
    var_1 delete();
    var_3 common_scripts\utility::delaycall( 0.4, ::show );
    var_7 = common_scripts\utility::getstruct( "truck_door_sound_spot", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "scn_docks_truck_door_open", var_7.origin );
    var_0 thread maps\_anim::_id_1246( var_0, var_5 );
    var_6 maps\_anim::_id_1246( var_3, var_5, "tag_origin" );
    var_8 = getent( "docks_truck_clip", "targetname" );
    var_8 common_scripts\utility::trigger_on();
    var_8 disconnectpaths();
    wait 3;
    maps\_utility::_id_1425( "docks_ambush" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    var_3 delete();
    var_6 delete();
    level.player unlink();
    level.player enableweapons();
    var_9 = getentarray( "trigger_after_ambush", "script_noteworthy" );
    common_scripts\utility::array_thread( var_9, common_scripts\utility::trigger_on );
    level thread _id_57A0();
}

_id_579F( var_0 )
{
    level.player endon( "death" );
    level.player playerlinktoblend( var_0, "tag_player", 0.4, 0.2, 0.2 );
    wait 0.5;
    level.player playerlinktodelta( var_0, "tag_player", 1, 0, 0, 0, 0 );
    var_1 = 4;
    level.player lerpviewangleclamp( var_1, var_1 * 0.5, var_1 * 0.5, 20, 20, 30, 10 );
    thread maps\london_code::_id_5716();
}

_id_57A0()
{
    var_0 = getent( "docks_gate_door", "targetname" );
    var_0 connectpaths();
    var_0 rotateto( ( 0.0, -112.0, 0.0 ), 1, 0, 0 );
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "docks_ambush" );
    maps\_utility::delaythread( 1, maps\_vehicle::_id_2A9A, "docks_ambush_rpg" );
    maps\_utility::delaythread( 1.3, ::_id_57A3 );
    maps\_utility::_id_26BF( "docks_ambush_colors" );
    maps\_utility::_id_272C( "docks_ambusher" );
    thread _id_57A2();
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "docks_after_ambush" );
    maps\_utility::delaythread( 2, maps\_utility::_id_142B, "london_ambush" );
    var_1 = getentarray( "docks_garage_doors", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\london_docks_code::_id_57A1 );
}

_id_57A2()
{
    common_scripts\utility::flag_wait_or_timeout( "docks_after_ambush", 20 );
    var_0 = getent( "docks_warehouse_door", "targetname" );
    var_0 connectpaths();
    var_0 rotateto( ( 0.0, -175.0, 0.0 ), 1 );
    wait 0.05;
    maps\_utility::_id_272C( "docks_catwalk_spawner" );
}

_id_57A3()
{
    var_0 = maps\_utility::_id_1377( "allies", "r" );
    var_0 = sortbydistance( var_0, level.player.origin );
    var_0[0] thread maps\_utility::_id_26AF( "london_myr_contact" );
    wait 0.1;
    var_0 = maps\_utility::_id_1377( "allies", "r" );
    var_0 = sortbydistance( var_0, level.player.origin );
    var_0[0] maps\_utility::_id_26AF( "london_sasl_gotcompany" );
}

_id_57A4()
{
    main();
    maps\london_docks_code::_id_577D();

    if ( level._id_1F19 == "docks_assault_streets" )
    {
        var_0 = maps\_vehicle::_id_2A98( "docks_littlebird_spawner" );
        thread _id_578E();
        maps\_utility::_id_26C0( "docks_streets_color_trigger" );
        wait 1;
    }

    common_scripts\utility::flag_wait( "docks_littlebird_strafe" );
    level thread _id_57A5();
    common_scripts\utility::flag_wait( "docks_street" );
    common_scripts\utility::flag_wait( "docks_enemy_fallback" );
    wait 3;
    wait 3;
    thread _id_57AA();
}

_id_57A5()
{
    level._id_5794._id_57A6 = 1;
    level._id_5794 notify( "stop_follow_line_path" );
    level._id_5794 thread maps\london_code::_id_571F( "littlebird_strafe_path" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_keepuscovered" );
    maps\_utility::_id_11F4( "london_hp2_wereonit" );
}

_id_57A7()
{
    common_scripts\utility::flag_wait( "docks_sewer_pipes" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_firefromwest" );
    thread maps\_utility::_id_11F4( "london_hp2_backaround" );
    common_scripts\utility::flag_set( "docks_littlebird_rocket" );
    maps\_utility::_id_13DC( "spotlight_on" );
    maps\_utility::_id_1654( "docks_rocket_lockon" );
    var_0 = common_scripts\utility::getstruct( "sewer_pipe_target", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    self.target_ent = var_1;
    maps\london_docks_code::_id_5795( var_1 );
    self setlookatent( var_1 );
    self waittill( "fire_rockets" );
    var_1 thread maps\london_docks_code::_id_57A8( var_0.target, 200 );
    self waittill( "prep_stop_rockets" );
    level thread maps\london_docks_code::_id_56E9();
    maps\london_docks_code::_id_57A9();
    self waittill( "follow_path_done" );
    maps\_utility::_id_13DC( "spotlight_on" );
    var_1 delete();
    var_0 = common_scripts\utility::getstruct( "construction_area_hoverpoint", "targetname" );
    level._id_5794._id_5728._id_572E = var_0;
    level._id_5794._id_57A6 = 0;
}

_id_57AA()
{
    common_scripts\utility::flag_wait( "docks_complete" );
    _id_00A4();
    level._id_5794 thread maps\london_docks_code::_id_57AB( "littlebird_tube_path" );
    wait 3;
    level._id_56FA[1] maps\_utility::_id_168C( "london_gfn_tothetube" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_pursuing" );
    maps\_utility::_id_11F4( "london_com_awaitorders" );
    maps\_utility::_id_11F4( "london_hp2_maintainshadow" );
    wait 1;
    level._id_5794 notify( "stop_follow_line_path" );
    level._id_5794 thread maps\london_code::_id_571F( "littlebird_exit_path" );
    level._id_5794._id_57A6 = 1;
    setsaveddvar( "sm_qualitySpotShadow", 1 );
}

_id_00A4()
{
    var_0 = getent( "sewer_pipe_collision", "targetname" );
    var_0 solid();
    var_0 show();
    var_1 = getent( "sewer_pipe_clip2", "targetname" );
    var_1 delete();
}
