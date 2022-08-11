// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7E98()
{
    common_scripts\utility::flag_set( "tank_crash_exit" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( level._id_45C0 ) && var_2 == level._id_45C0 )
            continue;

        var_2 delete();
    }

    var_4 = common_scripts\utility::getstruct( "tank_crash_org", "targetname" );
    var_5 = _id_7EB8();
    thread _id_7EA6( var_5 );
    common_scripts\utility::exploder( "tank_fall_after_sparks" );

    if ( maps\_utility::_id_275F( "hamburg_garage_ramp" ) )
    {
        _id_7EAD();
        _id_7EAC();
        thread _id_7EA1();
        thread maps\_utility::vision_set_fog_changes( "hamburg_garage_inside_tank", 0 );
        level._id_7E99 thread _id_7EAF();
        var_6 = level._id_7E99 maps\_utility::_id_1281( "collapse" );
        level._id_7E99 setanim( var_6, 1 );
        level._id_7E99 setanimtime( var_6, 0.8 );
        var_4 thread maps\_anim::_id_1246( var_5, "hamburg_tank_crash" );
        var_4 maps\_anim::_id_127C( [ var_5 ], "hamburg_tank_crash", 12 );
    }
    else
        var_4 waittill( "hamburg_tank_crash" );

    wait 0.05;

    if ( !isdefined( level._id_7E9A ) )
        level._id_7E9A = [];

    _id_7EAE();
    level._id_7E9A = maps\_utility::_id_0BC3( level._id_7E9A, var_5 );

    foreach ( var_8 in level._id_7E9A )
    {
        if ( isdefined( var_8._id_7E9B ) && issubstr( var_8._id_7E9B, "J_Vehicle_" ) )
            var_8 delete();
    }

    wait 0.05;
    var_10 = maps\_utility::_id_1287( "player_rig", var_4.origin );
    var_11 = maps\_utility::_id_1287( "player_rig_gun", var_4.origin );
    var_12 = maps\_utility::_id_1287( "player_rig_legs", var_4.origin );
    level.player maps\hamburg_code::_id_7E94( 0.3, 0, 0, var_10, "tag_player", 1, 60, 20, 60, 20, 0 );
    var_13 = [ var_10, var_11, var_12 ];
    common_scripts\utility::array_call( var_13, ::hide );
    var_5 maps\_anim::_id_11BF( var_13, "garage_crash_exit", "tag_guy0" );
    maps\_utility::_id_1428( "ham_end_start" );
    var_14 = getaiarray( "axis" );
    common_scripts\utility::array_call( var_14, ::delete );
    _id_7EA7( var_5 );
    common_scripts\utility::exploder( "garage_floor_collapse_dust_hang_after" );
    var_15 = level.player geteye()[2] + 256;

    foreach ( var_17 in level._id_7E9C )
    {
        if ( var_17.origin[2] > var_15 )
            continue;

        var_17 delete();
    }

    maps\_audio::aud_send_msg( "exit_tank" );
    maps\_utility::delaythread( 3, maps\_utility::vision_set_fog_changes, "hamburg_garage", 2.0 );
    _id_7EB8() maps\_utility::delaythread( 3, maps\hamburg_code::_id_02EC, 1 );
    var_19 = maps\_utility::_id_261B( "inside_the_tank_fire" );
    maps\_utility::delaythread( 3, common_scripts\utility::array_thread, var_19, common_scripts\utility::pauseeffect );
    maps\_utility::delaythread( 1.25, ::_id_7EA1 );
    thread _id_7EB5();
    level maps\_utility::_id_1424( "player_on_his_way_out", 0.1 );
    maps\_utility::_id_282E( "bridge_joints" );
    level notify( "stop_flicker_the_light" );
    common_scripts\utility::array_call( var_13, ::show );
    level.player maps\hamburg_code::_id_7E94( 0.5, 0, 0, var_10, "tag_player", 1, 0, 0, 0, 0, 1 );
    var_5 thread maps\_anim::_id_11DD( var_13, "garage_crash_exit", "tag_guy0" );
    thread _id_7EB7( var_5 );
    var_10 waittillmatch( "single anim", "end" );
    level.player maps\_loadout::_id_1C65();
    level.player enableweapons();
    level.player unlink();
    maps\_utility::_id_194E( "hamburg_garage" );
    maps\_utility::_id_135B( var_13 );
    level.player maps\_utility::_id_13E2( maps\_utility::_id_27A7( level.player.origin, -245.875 ), level.player getplayerangles(), 0.3, 1, 5, 5, 5, 5, 0 );
    level.player allowsprint( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    vehicle_scripts\_m1a1_player_control::_id_7E0C();
}

_id_7EA1()
{
    if ( isdefined( level._id_7E9F ) )
    {
        thread _id_7EA2();
        return;
    }

    var_0 = common_scripts\utility::getstruct( "garage_crash_light_exit", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_0.angles = vectortoangles( var_1.origin - var_0.origin );
    var_2 = var_0.angles;
    var_3 = var_0 common_scripts\utility::spawn_tag_origin();
    var_3.angles = var_2;
    level._id_7E9F = var_3;
    var_3 thread maps\hamburg_code::_id_5275( "tank_god_ray_light", undefined, "tag_origin", var_3 );
}

_id_7EA2()
{
    var_0 = getent( "handle_garage_spotlight", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        setsaveddvar( "sm_sunenable", 0 );
        level._id_7E9F thread maps\hamburg_code::_id_5275( "tank_god_ray_light", undefined, "tag_origin", level._id_7E9F );

        while ( level.player istouching( var_0 ) )
            wait 0.05;

        setsaveddvar( "sm_sunenable", 1 );
        wait 2;
        maps\hamburg_code::_id_536D();
        wait 2;
    }
}

_id_7EA3( var_0 )
{
    if ( isdefined( level._id_7EA3 ) )
        return;

    level._id_7EA3 = 1;
    var_1 = _id_7EB1();
    var_2 = _id_7EB3();
    var_1 linkto( var_0 );
    var_2 linkto( var_0 );
    var_1 thread _id_7EA9( var_0 );
    var_2 thread _id_7EAA( var_0 );
}

_id_7EA4()
{
    var_0 = getent( "garage_crash_light_flicker", "targetname" );
    var_0 setlightintensity( 1.0 );
    var_0 _id_7EA5();
    var_0 setlightintensity( 0 );
}

_id_7EA5()
{
    level endon( "stop_flicker_the_light" );
    var_0 = self getlightintensity();
    var_1 = ( 1.0, 0.501961, 0.0 );
    var_2 = ( 1.0, 1.0, 1.0 );

    for (;;)
    {
        var_3 = randomintrange( 2, 6 );

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            self setlightintensity( var_0 * randomfloatrange( 0.7, 1.0 ) );
            self setlightcolor( vectorlerp( var_1, var_2, randomfloatrange( 0.2, 1.0 ) ) );
            wait(randomfloatrange( 0.05, 0.1 ));
            self setlightintensity( 0.1 );
            wait(randomfloatrange( 0.05, 0.2 ));
        }

        wait(randomfloatrange( 1, 3 ));
    }
}

_id_7EA6( var_0 )
{
    thread common_scripts\utility::exploder( "while_in_tank" );
    thread _id_7EA4();
    thread _id_7EA3( var_0 );
}

_id_7EA7( var_0 )
{
    wait 1;
    level._id_45C0 thread maps\_utility::_id_168C( "hamburg_snd_frost" );
    wait 2;
    level.player thread maps\_utility::_id_11F4( "tank_rh1_22comein" );
    wait 0.5;
    var_1 = "exit_tank_button";
    notifyoncommand( var_1, "+activate" );
    notifyoncommand( var_1, "+usereload" );
    _id_7EA8( var_1 );
    thread maps\_utility::_id_27BD();
}

_id_7EA8( var_0 )
{
    var_1 = 0;
    level.player endon( var_0 );

    for (;;)
    {
        if ( gettime() > var_1 )
        {
            thread maps\_utility::_id_27BB( &"SCRIPT_PLATFORM_EXITCRASHTANK", 99 );
            var_1 = gettime() + 100000;
        }

        wait 0.05;
    }
}

_id_7EA9( var_0 )
{
    level endon( "player_on_his_way_out" );
    var_0 maps\_anim::_id_11C1( self, "driver_after_fall", "tag_guy0" );
    var_0 maps\_anim::_id_11C8( self, "driver_after_fall_loop", "player_getting_out_now", "tag_guy0" );
}

_id_7EAA( var_0 )
{
    level endon( "player_on_his_way_out" );
    var_0 maps\_anim::_id_11C1( self, "loader_after_fall", "tag_guy0" );
    var_0 maps\_anim::_id_11C8( self, "loader_after_fall_loop", "player_getting_out_now", "tag_guy0" );
}

_id_7EAB( var_0 )
{
    common_scripts\utility::fileprint_launcher_start_file();
    common_scripts\utility::fileprint_map_start();

    foreach ( var_2 in level._id_7E9A )
    {
        if ( !isdefined( var_2 ) )
            continue;

        common_scripts\utility::fileprint_map_entity_start();
        common_scripts\utility::fileprint_map_keypairprint( "spawnflags", "1" );
        common_scripts\utility::fileprint_map_keypairprint( "origin", common_scripts\utility::fileprint_radiant_vec( var_2.origin ) );
        common_scripts\utility::fileprint_map_keypairprint( "targetname", "delete_on_load" );
        common_scripts\utility::fileprint_map_keypairprint( "_color", "0.686275 0.847059 0.847059" );
        common_scripts\utility::fileprint_map_keypairprint( "classname", "script_model" );
        common_scripts\utility::fileprint_map_keypairprint( "model", var_2.model );

        if ( isdefined( var_2._id_7E9B ) )
            common_scripts\utility::fileprint_map_keypairprint( "tagname", var_2._id_7E9B );

        if ( isdefined( var_2.angles ) )
            common_scripts\utility::fileprint_map_keypairprint( "angles", common_scripts\utility::fileprint_radiant_vec( var_2.angles ) );

        common_scripts\utility::fileprint_map_entity_end();
    }

    common_scripts\utility::fileprint_launcher_end_file( var_0, 0 );
}

_id_7EAC()
{
    var_0 = common_scripts\utility::getstruct( "tank_crash_org", "targetname" );
    var_1 = maps\_utility::_id_1287( "garage_floor", var_0.origin );
    var_1 hide();
    var_1.origin = var_0.origin;
    var_1.angles = ( 0.0, 0.0, 0.0 );
    level._id_7E99 = var_1;
}

_id_7EAD()
{
    common_scripts\utility::exploder( "garage_ramp_1" );
    common_scripts\utility::exploder( "garage_ramp_2" );
    common_scripts\utility::exploder( "garage_floor_collapse_dust_hang" );
    common_scripts\utility::exploder( "garage_ramp_3" );
    maps\_utility::delaythread( 3, common_scripts\utility::exploder, "garage_floor_collapse_dust_hang_during" );
    waittillframeend;
}

_id_7EAE()
{
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
}

_id_7EAF()
{
    var_0 = [ "Ground_02_jnt", "Ground_01_jnt", "Ground_03_jnt", "Ground_04_jnt", "Ground_05_jnt", "Ground_06_jnt", "Ground_07_jnt", "Ground_08_jnt", "Ground_09_jnt", "Ground_010_jnt", "Ground_011_jnt", "Ground_012_jnt", "Ground_013_jnt", "Ground_014_jnt", "Ground_015_jnt", "Ground_016_jnt", "Ground_017_jnt", "Ground_018_jnt", "Ground_019_jnt", "Ground_020_jnt", "Ground_021_jnt", "Ground_022_jnt", "Ground_023_jnt", "Ground_024_jnt", "Ground_025_jnt", "Ground_026_jnt", "Ground_027_jnt", "Ground_028_jnt", "Ground_029_jnt", "Ground_030_jnt", "Ground_031_jnt", "Ground_032_jnt", "Ground_033_jnt", "Ground_034_jnt", "Ground_035_jnt" ];
    var_1 = getentarray( "garage_ramp_piece", "script_noteworthy" );
    level._id_7E9C = var_1;

    foreach ( var_3 in var_0 )
    {
        var_4 = _id_7EB0( self gettagorigin( var_3 ), var_1, 64 );

        if ( !isdefined( var_4 ) )
            continue;

        if ( var_3 == "Ground_08_jnt" )
        {
            var_1 = common_scripts\utility::array_remove( var_1, var_4 );
            var_4 common_scripts\utility::delaycall( 0.25, ::hide );
            continue;
        }

        var_4 notsolid();
        var_5 = common_scripts\utility::spawn_tag_origin();
        var_5 dontinterpolate();
        var_5.origin = self gettagorigin( var_3 );
        var_5.angles = self gettagangles( var_3 );
        var_5 linkto( self, var_3, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        maps\_utility::_id_282D( var_5, "bridge_joints" );
        var_4 linkto( var_5 );
        var_6 = var_4 common_scripts\utility::get_linked_ents();

        foreach ( var_8 in var_6 )
        {
            var_8 linkto( var_5 );
            level._id_7E9C[level._id_7E9C.size] = var_8;
        }
    }

    var_0 = [ "J_Vehicle_1", "J_Vehicle_2", "J_Vehicle_3", "J_Vehicle_4", "J_Vehicle_5" ];
    var_11 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_3 in var_0 )
    {
        var_4 = maps\_utility::_id_0AE9( self gettagorigin( var_3 ), var_11, 64 );

        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( level._id_7E9A ) )
            level._id_7E9A = [];

        var_4._id_7E9B = var_3;
        level._id_7E9A = maps\_utility::_id_0BC3( level._id_7E9A, var_4 );
        var_5 = common_scripts\utility::spawn_tag_origin();
        var_5 dontinterpolate();
        var_5.origin = self gettagorigin( var_3 );
        var_5.angles = self gettagangles( var_3 );
        var_5 linkto( self, var_3, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        maps\_utility::_id_282D( var_5, "bridge_joints" );
        var_4 linkto( var_5 );
    }
}

_id_7EB0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        var_6 = distance( var_5 getcentroid(), var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_7EB1()
{
    if ( !isdefined( level._id_7EB2 ) )
        level._id_7EB2 = maps\_utility::_id_272F( "tank_crew_1", 1 );

    return level._id_7EB2;
}

_id_7EB3()
{
    if ( !isdefined( level._id_7EB4 ) )
        level._id_7EB4 = maps\_utility::_id_272F( "tank_crew_2", 1 );

    return level._id_7EB4;
}

_id_7EB5()
{
    var_0 = common_scripts\utility::getstruct( "sandman_jump_start_high", "targetname" );
    var_1 = maps\hamburg_code::_id_7E84();

    if ( isdefined( var_1._id_0D04 ) )
        var_1 maps\_utility::_id_1902();

    var_1 delete();
    var_1 = maps\hamburg_code::_id_7E84();
    var_1._id_10F7 = 1;
    var_1._id_1165 = 1;
    var_1 forceteleport( var_0.origin, var_0.origin );
    wait 0.5;
    var_0 thread maps\_anim::_id_1246( var_1, "traverse_jumpdown_130" );
    wait 2.4;
    var_1 stopanimscripted();
    var_1 forceteleport( var_0.origin, var_0.origin );
    wait 1.0;
    var_0 = common_scripts\utility::getstruct( "sandman_jump_start_low", "targetname" );
    var_1 forceteleport( var_0.origin, var_0.origin );
    wait 1.35;
    var_1 maps\_utility::_id_13A4( "r" );
    level._id_45C0 = var_1;
    level._id_45C0._id_1032 = "sandman";
    maps\_utility::_id_26BF( "go_sandman_go" );
}

_id_7EB6( var_0 )
{
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_guysok" );
    var_0 maps\_utility::_id_168C( "hamburg_rhg_weregood" );
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_canyoushoot" );
    var_0 maps\_utility::_id_168C( "hamburg_rhg_holdmyown" );
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_basics" );
    level._id_45C0 maps\_utility::_id_168C( "hamburg_snd_movefast" );
}

_id_7EB7( var_0 )
{
    wait 8.5;
    var_1 = _id_7EB3();
    var_2 = _id_7EB1();
    var_1.spawner = getent( "greenend1", "targetname" );
    var_2.spawner = getent( "greenend2", "targetname" );
    var_3 = getaiarray( "allies" );
    var_4 = maps\_utility::_id_2531( var_1 );
    var_5 = maps\_utility::_id_2531( var_2 );
    maps\hamburg_end_ramp::_id_8048();
    var_5._id_1032 = "generic";
    var_4._id_1032 = "generic";
    var_0 thread maps\_anim::_id_11C1( var_4, "loader_after_fall_exit", "tag_guy0" );
    var_0 thread maps\_anim::_id_11C1( var_5, "driver_after_fall_exit", "tag_guy0" );
    wait 0.05;
    var_5 maps\_anim::_id_1280( "driver_after_fall_exit", 0.1 );
    var_6 = var_4 maps\_utility::_id_1281( "loader_after_fall_exit" );
    var_7 = var_5 maps\_utility::_id_1281( "driver_after_fall_exit" );
    maps\_anim::_id_127B( var_4, "loader_after_fall_exit", 1.2 );
    maps\_anim::_id_127B( var_5, "driver_after_fall_exit", 1.2 );
    var_8 = [];
    var_9 = [];
    var_8[var_8.size] = var_4;
    var_8[var_8.size] = var_5;
    var_9[var_9.size] = 0.89;
    var_9[var_9.size] = 0.91;
    var_10 = 0;
    var_11 = 1;
    thread _id_7EB6( var_4 );

    for (;;)
    {
        if ( var_11 && common_scripts\utility::flag( "player_off_tank" ) )
        {
            var_11 = 0;

            if ( var_10 == 0 )
                maps\_anim::_id_127B( var_4, "loader_after_fall_exit", 2 );

            maps\_anim::_id_127B( var_5, "driver_after_fall_exit", 2 );
        }

        var_12 = var_8[var_10] getanimtime( var_6 );

        if ( var_12 >= var_9[var_10] )
        {
            var_8[var_10] stopanimscripted();
            var_10++;

            if ( var_10 >= var_8.size )
                break;

            var_6 = var_8[var_10] maps\_utility::_id_1281( "driver_after_fall_exit" );
        }

        wait 0.05;
    }
}

_id_7EB8()
{
    if ( !isdefined( level._id_7EB9 ) )
        level._id_7EB9 = maps\_utility::_id_1287( "post_crash_tank" );

    return level._id_7EB9;
}
