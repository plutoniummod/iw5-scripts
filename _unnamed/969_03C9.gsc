// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::flag_init( "msg_start_fx_tiffanys_godrays" );
    common_scripts\utility::flag_init( "exp_playing" );
    common_scripts\utility::flag_init( "enable_distant_bombShakes" );
    common_scripts\utility::flag_init( "msg_stop_amb_exp_hind_1" );
    common_scripts\utility::flag_init( "msg_stop_amb_exp_hind" );
    common_scripts\utility::flag_init( "msg_stop_amb_exp_hind_2" );
    common_scripts\utility::flag_init( "aud_hind_finale_rotor_hit" );
    common_scripts\utility::flag_init( "msg_fx_hindfinale_oxytanks" );
    common_scripts\utility::flag_init( "msg_fx_windowexplosionA" );
    common_scripts\utility::flag_init( "msg_fx_windowexplosionB" );
    common_scripts\utility::flag_init( "msg_fx_windowexplosionC" );
    thread precachefx();
    thread _id_4743();
    thread _id_4753();
    thread _id_4744();
    thread _id_4780();
    _id_063E::main();
    thread _id_4742();
    thread _id_4745();
    thread _id_476B();
    thread _id_4755();
    thread _id_476A();
    thread _id_476D();
    thread _id_476C();
    thread _id_4762();
    thread _id_4769();
    thread _id_4760();
    thread _id_478B();
    thread _id_478C();
    thread _id_4747();
    thread _id_477B();
    thread _id_4773();
    thread _id_4778();
    thread _id_4783();
    thread _id_4789();
    thread _id_478A();
    thread _id_478E();
    thread _id_4781();
    thread _id_4791();
    thread _id_477F();
    thread _id_477E();
    thread _id_4782();
    thread _id_4787();
    thread _id_4758();
    thread _id_01D5();
    thread _id_4770();
    common_scripts\utility::array_thread( getentarray( "traffic_light_green_red_blinky", "targetname" ), ::_id_477C );
    thread maps\_shg_fx::_id_445E( 2000, "msg_fx_zone2", "msg_fx_zone2alt" );
    thread maps\_shg_fx::_id_445E( 2500, "msg_fx_zone2_5" );
    thread maps\_shg_fx::_id_445E( 3000, "msg_fx_zone3", "msg_fx_zone3_1" );
    thread maps\_shg_fx::_id_445E( 3500, "msg_fx_zone3_5" );
    thread maps\_shg_fx::_id_445E( 3600, "msg_fx_zone3_6" );
    thread maps\_shg_fx::_id_445E( 3700, "msg_fx_zone3_7", "msg_fx_zone3_7_1" );
    thread maps\_shg_fx::_id_445E( 4000, "msg_fx_zone4", "msg_fx_zone4_1" );
    thread maps\_shg_fx::_id_445E( 5000, "msg_fx_zone5" );
    thread maps\_shg_fx::_id_4466( 5500, "msg_fx_zone5" );
    thread maps\_shg_fx::_id_445E( 6000, "msg_fx_zone6" );
    thread maps\_shg_fx::_id_445E( 7000, "msg_fx_zone7" );
    thread maps\_shg_fx::_id_445E( 7500, "msg_fx_zone7", "msg_fx_zone8" );
    thread maps\_shg_fx::_id_445E( 8000, "msg_fx_zone8", "msg_fx_zone8_2" );
    thread maps\_shg_fx::_id_445E( 9000, "msg_fx_zone9" );
    thread maps\_shg_fx::_id_445E( 10000, "msg_fx_zone10" );
    thread maps\_shg_fx::_id_445E( 11000, "msg_fx_zone11", "msg_fx_zone11_1" );
    thread maps\_shg_fx::_id_445E( 11500, "msg_fx_zone11_1", "msg_fx_zone3_5" );
    thread maps\_shg_fx::_id_445E( 12000, "msg_fx_zone12" );
    thread maps\_shg_fx::_id_445E( 14000, "msg_fx_zone14" );
    thread maps\_shg_fx::_id_445E( 15000, "msg_fx_zone15" );
    thread maps\_shg_fx::_id_445E( 16000, "msg_fx_zone16" );
    thread maps\_shg_fx::_id_445E( 17000, "msg_fx_zone17" );
    level thread maps\_shg_fx::_id_4456();
    thread _id_4754();
}

_id_4742()
{
    level common_scripts\utility::waitframe();
    var_0 = getent( "gaz_destructable", "script_noteworthy" );
    playfxontag( common_scripts\utility::getfx( "gaz_running_tail_lights" ), var_0, "TAG_BRAKELIGHT_LEFT" );
    var_0 waittill( "stop_taking_damage" );
    stopfxontag( common_scripts\utility::getfx( "gaz_running_tail_lights" ), var_0, "TAG_BRAKELIGHT_LEFT" );
}

_id_4743()
{
    setsaveddvar( "sm_spotlimit", 1 );
    setsaveddvar( "sm_sunshadowscale", 0.85 );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );
    setsaveddvar( "fx_alphathreshold", 9 );
}

_id_4744()
{
    common_scripts\utility::flag_wait( "entering_hind" );
    setsaveddvar( "sm_sunsamplesizenear", 0.8 );
    setsaveddvar( "sm_sunshadowscale", 0.65 );
}

_id_4745()
{
    var_0 = 0;
    var_1 = [ 0, 0, 0 ];
    var_2 = 0;

    while ( var_2 < 2 )
    {
        var_3 = level._id_45D7;

        if ( isdefined( var_3 ) && var_1[0] == 0 )
        {
            var_2++;
            var_1[0] = 1;
            level._id_45D7 thread _id_4746();
        }

        var_3 = level._id_45C9;

        if ( isdefined( var_3 ) && var_1[1] == 0 )
        {
            var_2++;
            var_1[1] = 1;
            level._id_45C9 thread _id_4746();
        }

        var_3 = level._id_45D8;

        if ( isdefined( var_3 ) && var_1[2] == 0 )
        {
            var_2++;
            var_1[2] = 1;
            level._id_45D8 thread _id_4746();
        }

        level common_scripts\utility::waitframe();
    }
}

_id_4746()
{
    self endon( "death" );
    playfxontag( common_scripts\utility::getfx( "ny_stryker_tread" ), self, "tag_wheel_front_left" );
    playfxontag( common_scripts\utility::getfx( "ny_stryker_tread" ), self, "tag_wheel_front_right" );
    playfxontag( common_scripts\utility::getfx( "ny_stryker_tread" ), self, "tag_wheel_back_left" );
    playfxontag( common_scripts\utility::getfx( "ny_stryker_tread" ), self, "tag_wheel_back_right" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "stryker_exhaust" ), self, "tag_engine_left" );
        wait 0.1;
    }
}

_id_4747()
{
    wait 0.1;
    var_0 = getent( "jamming_tower_destroyed", "targetname" );
    var_1 = getent( "org_tower_collapse", "targetname" );
    thread _id_4748();
    common_scripts\utility::flag_wait( "thermite_detonated" );
    physicsexplosionsphere( ( -2067.0, 1417.0, 1614.0 ), 400, 100, 2.0 );
    thread _id_4749();
    var_0 thread _id_474B();
    thread _id_474A();
    wait 0.5;
    physicsexplosionsphere( ( -2067.0, 1417.0, 1614.0 ), 400, 100, 2.0 );
    common_scripts\utility::exploder( 301 );
    wait 0.5;
    common_scripts\utility::exploder( 302 );
    common_scripts\utility::exploder( 303 );
    wait 1.0;
    thread _id_474E();
    thread _id_4750();
    thread _id_474F();
    thread _id_474D();
    thread _id_4751();
    thread _id_4752();
    wait 7.0;
    common_scripts\utility::exploder( 308 );
    wait 1.83;
    common_scripts\utility::exploder( 313 );
    maps\_shg_fx::_id_444E( 0.35, 0.5, 0.1, 0.1 );
}

_id_4748()
{
    var_0 = getentarray( "ny_roof_debris", "targetname" );
    var_1 = [];
    wait 0.1;

    foreach ( var_3 in var_0 )
        var_3 hide();

    common_scripts\utility::flag_wait( "thermite_detonated" );
    var_5 = vectornormalize( anglestoforward( level.player.angles ) );
    var_6 = 0;

    foreach ( var_3 in var_0 )
    {
        var_3 show();
        var_8 = var_3.model;
        var_9 = vectornormalize( level.player.origin + ( 0.0, 0.0, 100.0 ) - var_3.origin );
        var_10 = 85 * ( randomfloatrange( -1, 1 ), randomfloatrange( -1, 1 ), 0 );
        var_9 += ( var_5 * 200 + var_10 + ( 0, 0, 300 + randomfloat( 1 ) * 100 ) + var_9 * ( 670 + 70 * randomfloat( 0.51 ) ) );
        var_3 physicslaunchclient( var_3.origin + ( 0.0, 0.0, 5.0 ), var_9 * 3.5 );
    }

    wait 0.75;
}

_id_4749()
{
    var_0 = getdvar( "vision_set_current" );
    visionsetnaked( "generic_flash", 0.08 );
    wait 0.17;
    visionsetnaked( "ny_manhattan", 0.08 );
}

_id_474A()
{
    wait 3.0;
    common_scripts\utility::exploder( 306 );
    wait 2.2;
    common_scripts\utility::exploder( 307 );
    wait 2.5;
    common_scripts\utility::exploder( 303 );
    wait 0.9;
    common_scripts\utility::exploder( 309 );
    wait 2.6;
    common_scripts\utility::exploder( 305 );
    wait 1.7;
    common_scripts\utility::exploder( 304 );
}

_id_474B()
{
    var_0 = self gettagorigin( "cableC_endStick" );
    var_1 = self gettagorigin( "cableD_endStick" );
    wait 2.0;
    wait 4.23;
    playfxontag( common_scripts\utility::getfx( "single_tower_cable_end" ), self, "cableD_endStick" );
    playfx( common_scripts\utility::getfx( "large_electric_exp" ), var_1, ( 270.0, 0.0, 0.0 ) );
    wait 1.5;
    playfxontag( common_scripts\utility::getfx( "single_tower_cable_end" ), self, "cableC_endStick" );
    playfx( common_scripts\utility::getfx( "large_electric_exp" ), var_0, ( 270.0, 0.0, 0.0 ) );
}

_id_474C( var_0, var_1 )
{
    var_2 = [];
    var_3 = [];
    var_4 = [];

    for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
    {
        var_6 = level.createfxent[var_5];

        if ( !isdefined( var_6 ) )
            continue;

        if ( var_6.v["type"] != "exploder" )
            continue;

        if ( !isdefined( var_6.v["exploder"] ) )
            continue;

        if ( int( var_6.v["exploder"] ) == int( var_0 ) )
        {
            var_2[var_2.size] = var_6.v["origin"];
            var_3[var_3.size] = var_6.v["angles"];
            var_4[var_4.size] = var_6;
        }
    }

    var_1.v["origins"] = var_2;
    var_1.v["angles"] = var_3;
    var_1.v["ents"] = var_4;
}

_id_474D()
{
    wait 6.0;
    var_0 = spawnstruct();
    var_1 = spawnstruct();
    _id_474C( "311", var_0 );
    _id_474C( "314", var_1 );
    var_2 = var_0.v["ents"];
    var_3 = var_1.v["ents"];
    var_4 = [];

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        var_4[var_5] = 0;

    var_6 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_6[var_5] = 0;

    var_7 = 20.0;
    var_8 = 24.0;

    for ( var_9 = 0; var_9 < var_7; var_9++ )
    {
        var_10 = ( -2087.0, 1424.0, 1614.0 );
        var_11 = 1500.0 * var_9 / var_7;

        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        {
            if ( distance( var_2[var_5].v["origin"], var_10 ) < var_11 && var_4[var_5] != 1 )
            {
                var_2[var_5] common_scripts\utility::activate_individual_exploder();
                var_4[var_5] = 1;
            }
        }

        wait(var_8 / var_7);
    }

    for ( var_12 = 0; var_12 < 5; var_12++ )
    {
        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
            var_6[var_5] = 0;

        var_7 = 20.0;
        var_8 = 45.0;

        for ( var_9 = 0; var_9 < var_7; var_9++ )
        {
            var_10 = ( -2087.0, 1424.0, 1614.0 );
            var_11 = 1200.0 * var_9 / var_7;

            for ( var_5 = 0; var_5 < var_3.size; var_5++ )
            {
                if ( distance( var_3[var_5].v["origin"], var_10 ) < var_11 && var_6[var_5] != 1 )
                {
                    var_3[var_5] common_scripts\utility::activate_individual_exploder();
                    var_6[var_5] = 1;
                }
            }

            wait(var_8 / var_7);
        }
    }
}

_id_474E()
{
    var_0 = getent( "jamming_tower_destroyed", "targetname" );
    var_1 = spawnstruct();
    _id_474C( "317", var_1 );
    var_2 = var_1.v["origins"];
    var_3 = var_1.v["angles"];
    var_4 = var_1.v["ents"];
    var_5 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        var_5[var_6] = 0;

    var_7 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_7[var_6] = common_scripts\utility::spawn_tag_origin();
        var_7[var_6].origin = var_2[var_6];
        var_7[var_6].angles = var_3[var_6];
        var_7[var_6] linkto( var_0, "tower01" );
    }

    wait 1.0;

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        if ( var_4[var_6].v["ender"] == "dishA" )
        {
            playfxontag( common_scripts\utility::getfx( "large_electric_exp" ), var_7[var_6], "tag_origin" );
            var_5[var_6] = 1;
        }
    }

    wait 7.0;

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        if ( var_4[var_6].v["ender"] == "dishB" )
        {
            playfxontag( common_scripts\utility::getfx( "large_electric_exp" ), var_7[var_6], "tag_origin" );
            var_5[var_6] = 1;
        }
    }
}

_id_474F()
{
    wait 2.0;
    var_0 = getent( "jamming_tower_destroyed", "targetname" );
    var_1 = spawnstruct();
    _id_474C( "312", var_1 );
    var_2 = var_1.v["origins"];
    var_3 = var_1.v["angles"];
    var_4 = var_1.v["ents"];
    var_5 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        var_5[var_6] = 0;

    var_7 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_7[var_6] = common_scripts\utility::spawn_tag_origin();
        var_7[var_6].origin = var_2[var_6];
        var_7[var_6].angles = var_3[var_6];
        var_7[var_6] linkto( var_0, "tower01" );
    }

    var_8 = 20.0;
    var_9 = 7.3;

    for ( var_10 = 0; var_10 < var_8; var_10++ )
    {
        var_11 = 1708.0;
        var_12 = 2200.0;
        var_13 = var_12 - var_11;
        var_13 *= var_10 / var_8;

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            if ( var_7[var_6].origin[2] < var_13 + var_11 && var_5[var_6] != 1 )
            {
                playfxontag( common_scripts\utility::getfx( "large_electric_exp" ), var_7[var_6], "tag_origin" );
                var_5[var_6] = 1;
            }
        }

        wait(var_9 / var_8);
    }

    wait 14;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        stopfxontag( common_scripts\utility::getfx( "fire_line_sm" ), var_7[var_6], "tag_origin" );
        var_7[var_6] delete();
    }
}

_id_4750()
{
    var_0 = getent( "jamming_tower_destroyed", "targetname" );
    var_1 = spawnstruct();
    _id_474C( "310", var_1 );
    var_2 = var_1.v["origins"];
    var_3 = var_1.v["angles"];
    var_4 = [];

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        var_4[var_5] = 0;

    var_6 = [];

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_6[var_5] = common_scripts\utility::spawn_tag_origin();
        var_6[var_5].origin = var_2[var_5];
        var_6[var_5].angles = var_3[var_5];
        var_6[var_5] linkto( var_0, "tower01" );
    }

    var_7 = 20.0;
    var_8 = 2.0;

    for ( var_9 = 0; var_9 < var_7; var_9++ )
    {
        var_10 = 1708.0;
        var_11 = 1900.0;
        var_12 = var_11 - var_10;
        var_12 *= var_9 / var_7;

        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        {
            if ( var_6[var_5].origin[2] < var_12 + var_10 && var_4[var_5] != 1 )
            {
                playfxontag( common_scripts\utility::getfx( "fire_line_sm_cheap" ), var_6[var_5], "tag_origin" );
                var_4[var_5] = 1;
            }
        }

        wait(var_8 / var_7);
    }

    wait 12;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        stopfxontag( common_scripts\utility::getfx( "fire_line_sm" ), var_6[var_5], "tag_origin" );
        var_6[var_5] delete();
    }
}

_id_4751()
{
    wait 8.6;
    var_0 = getent( "nyse_fence_anim", "targetname" );
    var_1 = getentarray( "nyse_fence_", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 notsolid();
        var_3 setcontents( 0 );
        var_3 linkto( var_0 );
    }

    var_5 = var_0.angles;
    var_0 rotateto( var_5, 0.15, 0.071, 0.071 );
    var_6 = 0;
    var_7 = common_scripts\utility::spawn_tag_origin();
    var_8 = -20;

    for (;;)
    {
        var_9 = abs( var_8 ) * 0.0475;

        if ( var_9 < 0.5 )
            var_9 = 0.25;

        var_0 rotateto( ( var_5[0] + var_8, var_5[1], var_5[2] ), var_9, var_9 * 0.5, var_9 * 0.5 );
        var_8 *= -0.7;
        wait(var_9);

        if ( abs( var_8 ) <= 2 )
            break;
    }
}

_id_4752()
{
    wait 0.3;
    var_0 = getent( "jamming_tower_destroyed", "targetname" );
    var_1 = spawnstruct();
    _id_474C( "315", var_1 );
    var_2 = var_1.v["origins"];
    var_3 = var_1.v["angles"];
    var_4 = var_1.v["ents"];
    var_5 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        var_5[var_6] = 0;

    var_7 = [];

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_7[var_6] = common_scripts\utility::spawn_tag_origin();
        var_7[var_6].origin = var_2[var_6];
        var_7[var_6].angles = var_3[var_6];
    }

    var_8 = 20.0;
    var_9 = 5.0;

    for ( var_10 = 0; var_10 < var_8; var_10++ )
    {
        var_11 = ( -2087.0, 1424.0, 1614.0 );
        var_12 = 900.0 * var_10 / var_8;

        for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        {
            if ( distance( var_4[var_6].v["origin"], var_11 ) < var_12 && var_5[var_6] != 1 )
            {
                var_4[var_6] common_scripts\utility::activate_individual_exploder();
                var_5[var_6] = 1;

                if ( isdefined( var_4[var_6].v["ender"] ) )
                {
                    if ( var_4[var_6].v["ender"] == "msg_fx_lineexp1" )
                    {
                        wait 1.0;
                        level notify( "msg_setoff_nyse_exp1" );
                    }

                    if ( var_4[var_6].v["ender"] == "msg_fx_lineexp2" )
                    {
                        wait 1.0;
                        level notify( "msg_setoff_nyse_exp2" );
                    }
                }
            }
        }

        wait(var_9 / var_8);
    }
}

_id_4753()
{
    wait 0.1;
}

_id_4754()
{
    common_scripts\utility::flag_wait( "entering_hind" );
    thread maps\_shg_fx::_id_446D( "lights_lf_test", ( -29.0, -6.0, 0.0 ), 10000 );
}

_id_4755()
{
    wait 10.0;
    thread maps\_shg_fx::_id_4454( 400, "smoke_geotrail_genericexplosion", 5, 500, 2000, 10, 30, 200, 75, 1200 );
    var_0 = [ ( -4723.47, -3139.63, 2752.6 ), ( -3731.84, -2029.16, 2799.87 ), ( -3911.85, -1136.19, 2797.83 ), ( -3871.81, -295.381, 3432.95 ), ( -3996.06, 742.784, 2986.2 ), ( -4948.13, -4699.07, 2252.31 ), ( -3676.3, -4113.55, 1974.48 ), ( -7745.4, -2947.22, 3413.39 ), ( -7532.97, -3389.05, 3272.03 ), ( -7993.39, -2583.71, 3281.43 ), ( -7825.95, -2735.18, 4114.56 ), ( -9837.14, -3326.57, 4584.54 ), ( -10494.4, -3792.76, 4285.43 ), ( -10421.3, -3647.76, 4619.95 ), ( -10366.3, -3727.49, 3952.17 ), ( -11799.4, -4781.56, 4117.62 ), ( -12397.4, -5939.89, 4185.6 ), ( -12046.1, -5291.72, 5020.61 ), ( -12392.1, -5881.45, 4746.81 ), ( -12629.3, -6285.67, 4452.1 ), ( -10974.6, -8493.58, 3685.14 ), ( -10484.9, -8525.86, 3330.77 ), ( -10484.9, -8525.86, 3330.77 ), ( -9992.39, -8818.68, 3719.72 ), ( -9239.87, -9097.68, 3301.68 ), ( -7978.5, -10026.6, 3788.68 ), ( -7290.33, -9843.54, 3784.12 ), ( -7633.41, -9674.08, 3291.68 ), ( -8090.39, -10067.1, 2821.38 ), ( -6973.91, -9944.56, 2915.12 ), ( -7134.57, -9878.67, 2464.34 ), ( -7043.57, -7480.28, 3256.53 ), ( -6821.67, -7281.61, 3204.43 ), ( -6672.38, -7241.97, 3617.14 ), ( -7083.39, -7724.91, 3588.41 ), ( -6945.34, -7226.35, 2764.36 ), ( -6598.13, -4962.05, 3390.48 ), ( -6700.62, -5037.11, 3012.84 ), ( -6860.98, -4775.1, 3200.37 ), ( -7067.37, -4470.25, 3038.22 ), ( -12010.7, -5280.78, 2460.17 ), ( -12496.2, -6058.87, 2462.49 ), ( -10709.7, -3941.02, 2392.49 ), ( -10709.7, -3941.02, 2392.49 ), ( -12687.2, -2572.97, 2750.06 ), ( -11743.8, -8123.64, 2624.81 ), ( -12476.4, -7868.53, 2647.51 ), ( -14925.6, -6756.64, 3298.52 ), ( -14955.7, -7356.05, 3426.85 ), ( -3807.92, -1962.47, 1717.8 ), ( -4641.78, -2177.37, 1866.32 ), ( -4631.36, -2719.82, 1542.89 ), ( -4609.85, -3399.33, 1866.63 ), ( -3703.84, -3427.87, 1835.05 ), ( -4643.71, -2076.54, 868.674 ), ( -3952.13, -1816.64, 919.216 ), ( -4648.86, -1808.37, 886.547 ), ( -9381.33, -3512.95, 2458.42 ), ( -9839.28, -3746.29, 2226.69 ), ( -9925.82, -3759.75, 2997.53 ), ( -11080.9, -4091.61, 2454.12 ), ( -7548.85, -3154.99, 2698.93 ), ( -7147.64, -3205.07, 2961.14 ), ( -7663.33, -3007.76, 2583.72 ), ( -9743.96, -8922.13, 2796.55 ), ( -10607.5, -8621.42, 3508.83 ), ( -10706.6, -8584.48, 2502.18 ), ( -12291.2, -5725.56, 2837.08 ), ( -7185.32, -7508.32, 2376.36 ), ( -6807.07, -7063.87, 2440.57 ), ( -12494.9, -10857.7, 3844.31 ), ( -13262.9, -10582.6, 3987.45 ), ( -14374.3, -10620.4, 3848.83 ), ( -15234.3, -10163.2, 3843.31 ), ( -15345.9, -9509.54, 3165.93 ), ( -12387.7, -8319.88, 2856.03 ), ( -5587.13, -6339.12, 3191.43 ), ( -5241.26, -5797.22, 3187.48 ), ( -5687.7, -6079.25, 3896.24 ), ( -5626.74, -6432.51, 2556.17 ), ( -5542.88, -5845.09, 2580.03 ), ( -7019.32, -7327.15, 2107.85 ), ( -11871.0, -5042.7, 3207.29 ), ( -12574.1, -6222.49, 3123.79 ), ( -12305.9, -4272.42, 3133.6 ), ( -11873.6, -4770.54, 3113.43 ) ];
    common_scripts\utility::flag_wait( "level_started_fx" );

    for (;;)
    {
        var_1 = randomfloatrange( -0.35, 0.35 ) + 1;
        wait(var_1);
        common_scripts\utility::flag_wait_either( "msg_stop_amb_exp_hind_1", "msg_stop_amb_exp_hind" );
        common_scripts\utility::flag_waitopen( "msg_stop_amb_exp_hind_2" );
        var_2 = [];
        var_3 = level.player getplayerangles();
        var_4 = vectornormalize( anglestoforward( var_3 ) );
        var_5 = maps\_shg_fx::_id_446A( 400 );
        var_6 = -1;
        var_7 = [];

        for ( var_8 = 0; var_8 < var_0.size; var_8++ )
        {
            if ( !isdefined( var_5 ) )
                continue;

            var_9 = vectornormalize( var_0[var_8] - level.player.origin );

            if ( vectordot( var_4, var_9 ) > 0.45 )
            {
                var_6 = 1;
                var_7[var_7.size] = var_0[var_8];
            }
        }

        if ( var_6 > 0 )
        {
            var_10 = randomint( var_7.size + 1 );

            if ( isdefined( var_10 ) )
            {
                var_5.v["origin"] = var_7[var_10];

                if ( isdefined( var_5.v["origin"] ) && isdefined( var_5 ) )
                    common_scripts\utility::exploder( 400 );

                maps\_audio::aud_send_msg( "msg_audio_fx_ambientExp", var_7[var_10] );
            }

            wait 1;
        }
    }
}

_id_4756()
{
    var_0 = ( -3766.11, 661.521, 477.0 );
    var_1 = ( -3904.37, 635.203, 447.0 );
    wait 1.0;
    common_scripts\utility::flag_wait( "obj_broad_complete" );
    level common_scripts\utility::waitframe();

    if ( isdefined( level._id_4485 ) )
    {

    }

    common_scripts\utility::flag_wait( "broad_hind_strafe_setup" );

    if ( isdefined( level._id_4485 ) )
    {

    }

    common_scripts\utility::flag_wait( "broad_hind_strafe" );

    if ( isdefined( level._id_4485 ) )
        return;
}

_id_4757()
{

}

_id_46FA()
{

}

_id_472B()
{
    wait 7.2;
}

_id_4758()
{
    level common_scripts\utility::waitframe();
    level waittill( "spawn_hind06b" );
    setsaveddvar( "r_dlightlimit", 0 );
    level waittill( "start_finale" );
    wait 5;
    setsaveddvar( "r_dlightlimit", 4 );
}

_id_4759()
{
    thread maps\_shg_fx::_id_4454( 1508, "ny_hind_smoketrail", 10, 200, 1000, 10, 30, 200, 180, 800 );
    thread maps\_shg_fx::_id_4454( 1507, "ny_hind_smoketrail", 7, 200, 1000, 10, 30, 200, 180, 800 );
    wait 34.43;
    common_scripts\utility::exploder( 1508 );
    wait 5.6;
    common_scripts\utility::exploder( 1507 );
    common_scripts\utility::exploder( 1547 );
}

_id_475A( var_0, var_1 )
{
    level waittill( var_1 );
    common_scripts\utility::exploder( var_0 );
}

_id_472C()
{
    common_scripts\utility::flag_set( "msg_stop_amb_exp_hind_2" );
    thread _id_4759();
    wait 5.0;

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    wait 20.86;
    var_0 = [];

    for ( var_1 = 401; var_1 < 408; var_1++ )
    {
        var_0[var_0.size] = maps\_shg_fx::_id_446A( var_1 );
        thread _id_475A( var_1, "msg_fx_wait_" + maps\_utility::string( var_1 ) );
    }

    var_2 = vectornormalize( ( -41.0, -270.0, 36.0 ) );
    var_3 = vectornormalize( anglestoforward( self.angles ) );
    var_4 = self gettagorigin( "main_rotor_jnt" );
    var_4 += var_3 * 0;
    var_5 = bullettrace( var_4, var_4 + var_2 * 1200, 0, undefined );
    var_6 = var_5["position"] + ( 0.0, 0.0, 50.0 );
    var_7 = var_5["normal"];
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_8.origin = var_6;
    var_8.angles = vectortoangles( var_7 );
    playfxontag( common_scripts\utility::getfx( "rotor_impact_concrete_sparks" ), var_8, "tag_origin" );

    for ( var_9 = 0; var_9 < 20; var_9++ )
    {
        var_2 = vectornormalize( ( -41.0, -270.0, 36.0 ) );
        var_3 = vectornormalize( anglestoforward( self.angles ) );
        var_4 = self gettagorigin( "main_rotor_jnt" );
        var_4 += var_3 * 0;
        var_5 = bullettrace( var_4, var_4 + var_2 * 1200, 0, undefined );
        var_6 = var_5["position"] + ( 0.0, 0.0, 50.0 );
        var_7 = var_5["normal"];
        var_8.origin = var_6;
        var_8.angles = vectortoangles( var_7 );
        playfx( common_scripts\utility::getfx( "rotor_impact_concrete" ), var_6 - var_2 * 4, var_8.angles );
        maps\_audio::aud_send_msg( "aud_hind_finale_rotor_impact" );
        common_scripts\utility::flag_set( "aud_hind_finale_rotor_hit" );

        for ( var_10 = 0; var_10 < 7; var_10++ )
        {
            var_11 = var_0[var_10].v["origin"];

            if ( var_11[2] < var_6[2] + 80 )
                level notify( "msg_fx_wait_" + maps\_utility::string( var_10 + 401 ) );
        }

        level common_scripts\utility::waitframe();
    }

    stopfxontag( common_scripts\utility::getfx( "rotor_impact_concrete_sparks" ), var_8, "tag_origin" );
    var_8 delete();
}

_id_475B( var_0, var_1, var_2 )
{
    var_3 = var_0;
    var_4 = var_1 - var_3;

    for ( var_5 = 0; var_5 < var_2 * 20; var_5++ )
    {
        var_6 = var_3 + var_4 * float( var_5 + 1 ) / float( var_2 * 20 );
        setsunlight( var_6[0], var_6[1], var_6[2] );
        level common_scripts\utility::waitframe();
    }

    resetsunlight();
}

_id_475C()
{
    wait 0.2;
    var_0 = getdvar( "vision_set_current" );
    var_1 = ( 1.55, 1.48922, 1.34333 );
    thread _id_475B( var_1, ( 4.0, 3.8, 3.5 ), 0.1 );
    wait 22.3;
    thread _id_475B( ( 4.0, 3.8, 3.5 ), var_1, 2.0 );
}

_id_475D( var_0, var_1 )
{
    wait 7.15;
    wait 2.25;
    playfxontag( common_scripts\utility::getfx( "ny_hummerglasswindow" ), var_0, var_1 );
    wait 12.7;
    playfxontag( common_scripts\utility::getfx( "ny_hummerglasswindowfall" ), var_0, var_1 );
}

_id_475E()
{
    wait 0.65;
    var_0 = vectornormalize( anglestoforward( level.player.angles ) );
    var_1 = vectornormalize( ( -4348.0, -3588.0, 786.0 ) - self.origin );
    var_1 += var_1 * 5470;
    self startragdollfromimpact( "torso_upper", var_1 );
}

_id_45FB()
{
    thread _id_475F();
    thread _id_475C();
    var_0 = getent( "intro_humvee", "targetname" );
    wait 1.0;
    thread maps\_shg_fx::_id_4454( 961, "smoke_geotrail_genericexplosion", 7, 500, 2000, 10, 30, 200, 75, 1200 );
    thread maps\_shg_fx::_id_4454( 962, "smoke_geotrail_genericexplosion", 7, 500, 2000, 10, 30, 200, 75, 1200 );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_fx_13", ( 0.0, 40.0, 0.0 ), ( 90.0, 0.0, 0.0 ) );
    common_scripts\utility::exploder( 970 );
    common_scripts\utility::exploder( 973 );
    wait 5.5;
    playfxontag( common_scripts\utility::getfx( "ny_hummerfallingdust" ), var_0, "tag_fx_22" );
    wait 13;
    maps\_shg_fx::_id_4467( 970 );
    wait 0.1;
    common_scripts\utility::exploder( 971 );
    wait 1.1;
    wait 2.1;
    common_scripts\utility::exploder( 962 );
    wait 1.5;
    maps\_shg_fx::_id_4467( 973 );
}

_id_475F()
{
    wait 32.25;
    common_scripts\utility::exploder( 968 );
    maps\_audio::aud_send_msg( "building_chunk", [ 968, 1.0 ] );
    wait 1.0;
    level thread maps\_shg_fx::_id_444E( 0.25, 0.5, 0.15, 0.2 );
    wait 2.5;
    common_scripts\utility::exploder( 965 );
    maps\_audio::aud_send_msg( "building_chunk", [ 965, 1.0 ] );
    wait 0.9;
    level thread maps\_shg_fx::_id_444E( 0.35, 0.5, 0.15, 0.2 );
    wait 0.25;
    common_scripts\utility::exploder( 964 );
    maps\_audio::aud_send_msg( "building_chunk", [ 964, 2.0 ] );
    wait 2.0;
    level thread maps\_shg_fx::_id_444E( 0.3, 0.5, 0.15, 0.2 );
    wait 1.5;
    common_scripts\utility::exploder( 966 );
    maps\_audio::aud_send_msg( "building_chunk", [ 966, 1.0 ] );
    wait 1.0;
    level thread maps\_shg_fx::_id_444E( 0.2, 0.5, 0.15, 0.2 );
    wait 1.5;
    common_scripts\utility::exploder( 967 );
    maps\_audio::aud_send_msg( "building_chunk", [ 967, 1.0 ] );
    wait 1.0;
    level thread maps\_shg_fx::_id_444E( 0.2, 0.5, 0.15, 0.2 );
}

_id_4760()
{
    wait 0.1;

    if ( !level.createfx_enabled )
        return 0;

    var_0 = getent( "sewer_exit_scripted_node", "targetname" );
    var_1 = getent( "intro_humvee", "targetname" );
    var_1._id_1032 = "intro_humvee";
    var_1 maps\_utility::_id_2629();
    var_2 = [];
    var_2[0] = var_1;
    var_0 maps\_anim::_id_11BF( var_2, "ny_intro" );
}

_id_4761()
{

}

_id_4762()
{
    if ( !maps\_utility::_id_0A36() )
    {
        common_scripts\utility::waitframe();
        var_0 = getent( "ny_manhattan_building_exchange_01_facade_des", "targetname" );
        var_0._id_1032 = "building_des";
        var_0 maps\_anim::_id_1244();
    }
}

_id_4763()
{
    wait 6.06;
    level thread maps\_shg_fx::_id_444E( 0.4, 0.52, 0.13, 0.153 );
    var_0 = getdvar( "vision_set_current" );
    visionsetnaked( "generic_flash", 0.2 );
    wait 0.1;
    visionsetnaked( var_0, 0.2 );
}

_id_4764()
{
    var_0 = level._id_1436;
    var_1 = self gettagorigin( "tag_fx14" );
    var_2 = level.player.origin;
    var_3 = length( var_1 - var_2 );
    var_4 = [];
    var_5 = [];
    var_4["nearStart"] = 60;
    var_4["nearEnd"] = 1000;
    var_4["nearBlur"] = 10;
    var_4["farStart"] = var_3 + 1000;
    var_4["farEnd"] = var_3 + 3500;
    var_4["farBlur"] = 1;
    var_5 = var_4;
    var_6 = 100;
    maps\_utility::_id_27C0( var_0, var_4, 0.2 );
    wait 0.15;

    for ( var_7 = 0; var_7 < 25; var_7++ )
    {
        var_1 = self gettagorigin( "tag_fx14" );
        var_2 = level.player.origin;
        var_3 = length( var_1 - var_2 );
        var_4["farStart"] = var_3 + 1000;
        var_4["farEnd"] = var_3 + 3500;
        maps\_utility::_id_27C0( var_5, var_4, 0.2 );
        var_5 = var_4;
        wait 0.2;
    }

    maps\_utility::_id_27C0( var_4, var_0, 0.5 );
}

_id_4765()
{
    wait 0.25;
    maps\_utility::_id_273C( 0.2, 25 );
    wait 2.5;
    maps\_utility::_id_273C( 4, 65 );
}

_id_4766( var_0, var_1, var_2 )
{
    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( isdefined( var_1[var_3] ) )
            {
                var_4 = var_0 gettagangles( var_2[var_3] );
                var_5 = var_0 gettagorigin( var_2[var_3] );
                var_1[var_3].origin = var_5;
                var_1[var_3].angles = var_4;
            }
        }

        level common_scripts\utility::waitframe();
    }
}

_id_4767()
{
    wait 0.25;
    common_scripts\utility::exploder( 959 );
    wait 0.5;
    common_scripts\utility::exploder( 958 );
    common_scripts\utility::exploder( 960 );
}

_id_4768()
{
    common_scripts\utility::flag_wait( "msg_fx_missilehit" );
    common_scripts\utility::exploder( -951 );
}

_id_4769()
{
    common_scripts\utility::flag_init( "msg_fx_zonefiretower" );
    wait 1.0;
    level._effect["contrail12"] = level._effect["smoke_geotrail_missile_shadow"];
    level._effect["contrail"] = level._effect["smoke_geotrail_missile_shadow"];
    var_0 = [];
    var_1 = [];
    var_0[0] = getent( "chunk106", "targetname" );
    var_0[1] = getent( "chunk100_dusty", "targetname" );
    var_0[2] = getent( "chunk102_dusty", "targetname" );
    var_0[3] = getent( "chunk105_dusty", "targetname" );
    var_0[4] = getent( "chunk118_dusty", "targetname" );
    var_0[5] = getent( "chunk119_dusty", "targetname" );
    var_0[6] = getent( "chunk120_dusty", "targetname" );
    var_0[7] = getent( "chunk121_dusty", "targetname" );
    var_0[8] = getent( "chunk143_dusty", "targetname" );
    var_0[9] = getent( "chunk151_dusty", "targetname" );
    var_1[0] = "tag_fx14";
    var_1[1] = "tag_fx8";
    var_1[2] = "tag_fx10";
    var_1[3] = "tag_fx13";
    var_1[4] = "tag_fx26";
    var_1[5] = "tag_fx27";
    var_1[6] = "tag_fx28";
    var_1[7] = "tag_fx29";
    var_1[8] = "tag_fx51";
    var_1[9] = "tag_fx59";
    var_2 = getent( "ny_manhattan_building_exchange_01_facade_des", "targetname" );
    var_3 = getentarray( "ny_manhattan_building_exchange_01_des_brush", "targetname" );
    var_2 hide();
    var_4 = spawnstruct();
    _id_474C( "963", var_4 );
    var_5 = var_4.v["ents"];
    var_6 = [];

    for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        var_6[var_7] = 0;

    var_8 = [];

    for ( var_7 = 0; var_7 < var_5.size; var_7++ )
    {
        var_8[var_7] = common_scripts\utility::spawn_tag_origin();
        var_8[var_7].origin = var_5[var_7].v["origin"];
        var_8[var_7].angles = var_5[var_7].v["angles"];
        var_8[var_7] linkto( var_0[0] );
    }

    thread maps\_shg_fx::_id_4454( 958, "ny_buildingexplosion_trail", 14, 800, 1700, 10, 45, 20, 70, 800 );
    thread maps\_shg_fx::_id_4454( 951, "fire_smoke_trail_s", 2, 800, 1200, 60, 105, 20, 55, 400 );
    thread _id_4768();
    level waittill( "intro_missile_1_hits" );

    foreach ( var_10 in var_3 )
        var_10 delete();

    var_2 show();
    thread _id_4766( var_2, var_0, var_1 );
    var_2 thread maps\_anim::_id_1246( var_2, "manhattan_sewer_exit" );
    common_scripts\utility::exploder( 955 );
    common_scripts\utility::exploder( 950 );
    common_scripts\utility::exploder( 951 );
    thread _id_4767();
    wait 0.25;
    common_scripts\utility::exploder( 969 );
    thread _id_4763();

    for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        playfxontag( common_scripts\utility::getfx( var_5[var_7].v["fxid"] ), var_8[var_7], "tag_origin" );

    wait 0.15;
    common_scripts\utility::exploder( 957 );
    wait 0.85;
    var_2 thread _id_4764();
    level thread maps\_shg_fx::_id_444E( 0.3, 2, 0.3, 0.53 );
    playfxontag( common_scripts\utility::getfx( "chunk_contrail_ny" ), var_2, "tag_fx14" );
    wait 1.05;
    wait 2.8;
    common_scripts\utility::exploder( 954 );
    level thread maps\_shg_fx::_id_444E( 0.3, 0.52, 0.13, 0.153 );
    wait 1.54;
    setblur( 5, 0.125 );
    stopfxontag( common_scripts\utility::getfx( "chunk_contrail_ny" ), var_2, "tag_fx14" );
    common_scripts\utility::exploder( 953 );

    for ( var_12 = 1; var_12 < 10; var_12++ )
        var_0[var_12] delete();

    wait 0.125;
    var_13 = getent( "intro_taxi", "script_noteworthy" );
    var_13 hide();
    setblur( 0, 0.35 );
    wait 1.5;
    common_scripts\utility::exploder( 956 );
    wait 16.0;
    maps\_shg_fx::_id_4467( 956 );
}

_id_476A()
{
    wait 1.0;
    var_0 = getentarray( "fx_flaknode", "targetname" );
    var_1 = maps\_shg_fx::_id_446A( 799 );
    var_2 = maps\_shg_fx::_id_446A( 798 );

    for (;;)
    {
        var_3 = randomfloatrange( -1, 1 ) + 2;
        wait(var_3);
        common_scripts\utility::flag_waitopen( "exp_playing" );
        var_4 = level.player getplayerangles();
        var_5 = vectornormalize( anglestoforward( var_4 ) );
        var_6 = ( 0.0, 0.0, 0.0 );
        var_7 = -1.0;

        for ( var_8 = 0; var_8 < var_0.size; var_8++ )
        {
            var_9 = var_0[var_8] getorigin() + ( 0.0, 0.0, 3000.0 );
            var_10 = vectornormalize( var_9 - level.player.origin );
            var_11 = vectordot( var_5, var_10 );

            if ( var_11 > 0.65 && var_11 > var_7 )
            {
                var_6 = var_9;
                var_7 = var_11;
            }
        }

        var_12 = ( 0.0, 0.0, 0.0 ) + var_6 + vectornormalize( common_scripts\utility::randomvector( 2 ) ) * 2750;
        var_1.v["origin"] = var_12;
        var_2.v["origin"] = var_12;

        if ( var_7 > 0 )
        {
            common_scripts\utility::exploder( 798 );
            wait 0.65;
            common_scripts\utility::exploder( 799 );
            wait 1;
        }
    }
}

_id_476B()
{
    wait 10.0;
    var_0 = [ ( -4187.7, -6955.04, 1965.78 ), ( -3033.99, -8245.14, 3389.71 ), ( -3575.84, -8408.69, 4263.41 ), ( 811.9, 4777.98, 1729.21 ), ( 1304.43, 6871.75, 2361.23 ), ( 2167.09, 9577.33, 2361.58 ), ( -2239.31, -8157.38, 3216.13 ), ( -1767.18, -7948.25, 1893.35 ), ( -1038.06, -8217.92, 4171.56 ), ( -4681.31, 2736.97, 2090.5 ), ( -3619.6, -9270.64, 3002.34 ), ( -4037.59, -9934.14, 4787.15 ), ( -3898.69, 4571.14, 1899.09 ), ( -4717.15, 5422.82, 2262.04 ), ( -4361.88, 6272.97, 3151.94 ), ( -4606.62, 8595.08, 5823.76 ), ( -4627.77, 7595.02, 5929.47 ), ( 1760.04, 7058.97, 2825.0 ), ( 1895.64, 8401.99, 4110.88 ), ( 2368.26, 9237.65, 4167.63 ), ( 1637.58, 9245.96, 6379.27 ), ( 1599.8, 9280.21, 5831.7 ), ( 3012.36, 9540.14, 6484.93 ), ( 3511.33, -808.979, 3015.82 ), ( 4992.68, -106.21, 4695.27 ), ( 5273.71, -1700.75, 5943.67 ), ( 5244.27, -2235.7, 8177.53 ), ( 2033.37, 999.022, 4260.44 ), ( 4827.54, 125.473, 3710.74 ), ( 3866.09, 548.33, 1266.61 ), ( 3862.02, 412.45, 2300.68 ), ( 4123.97, 353.335, 2060.32 ), ( 3616.9, -620.285, 1403.18 ), ( 3934.43, 563.696, 6214.36 ), ( -2730.88, -8034.51, 1873.09 ), ( -3469.97, -8078.36, 1886.72 ), ( -4125.73, -8731.3, 2004.36 ), ( -3732.74, -8142.53, 1118.17 ), ( -4259.3, -6338.27, 1053.16 ), ( -4531.53, -6101.44, 3117.44 ), ( -2940.23, -8599.88, 5167.89 ), ( -4700.34, 3499.22, 2659.31 ), ( -3866.85, 6908.11, 3016.26 ), ( -4540.91, 7185.43, 4532.95 ), ( -4890.23, 6264.49, 3620.93 ), ( -4198.43, 7192.49, 3621.29 ), ( 1859.05, 1296.63, 4863.39 ), ( 3713.3, 803.918, 6259.06 ), ( 3940.47, -1154.09, 5454.34 ), ( 2414.13, 8499.75, 2887.67 ), ( 2451.14, 8504.87, 3553.44 ), ( 2473.76, 9166.14, 4539.4 ), ( 1834.32, 7830.89, 2890.5 ), ( 1054.29, 2353.56, 1287.26 ), ( 738.125, 4247.55, 2890.5 ), ( 715.53, 5078.57, 2541.24 ), ( -2449.77, -11697.9, 3232.45 ), ( -2001.22, -13896.2, 3906.78 ), ( -2331.26, -14562.9, 3274.91 ), ( -3049.43, -18343.6, 3743.02 ), ( -1537.31, -10542.8, 2032.75 ), ( -8092.85, 1132.9, 3769.34 ), ( -7914.71, 770.858, 4552.8 ), ( -7747.38, 90.5198, 4527.27 ), ( -7754.06, 675.826, 5790.95 ), ( -8348.75, -134.581, 5964.13 ), ( -5766.8, 1375.46, 3785.41 ), ( -7466.81, 492.474, 3395.12 ), ( -7926.47, -170.617, 1978.1 ), ( -8006.18, -36.8266, 3203.16 ), ( -4088.9, 2432.67, 2446.66 ), ( -4646.15, 8323.33, 4891.13 ), ( -4607.25, 8643.29, 5495.8 ) ];
    thread maps\_shg_fx::_id_4454( 700, "smoke_geotrail_genericexplosion", 7, 500, 2000, 10, 30, 200, 75, 1200 );
    common_scripts\utility::flag_wait( "level_started_fx" );

    for (;;)
    {
        var_1 = randomfloatrange( -0.5, 0.5 ) + 1.5;
        wait(var_1);
        common_scripts\utility::flag_waitopen( "msg_fx_zone4" );
        common_scripts\utility::flag_waitopen( "msg_fx_zone5" );
        common_scripts\utility::flag_waitopen( "msg_fx_zone10" );
        common_scripts\utility::flag_waitopen( "msg_stop_amb_exp_hind_1" );
        common_scripts\utility::flag_waitopen( "msg_stop_amb_exp_hind" );
        var_2 = [];
        var_3 = level.player getplayerangles();
        var_4 = vectornormalize( anglestoforward( var_3 ) );
        var_5 = maps\_shg_fx::_id_446A( 700 );
        var_6 = -1;
        var_7 = [];

        for ( var_8 = 0; var_8 < var_0.size; var_8++ )
        {
            if ( !isdefined( var_5 ) )
                continue;

            var_9 = vectornormalize( var_0[var_8] - level.player.origin );

            if ( vectordot( var_4, var_9 ) > 0.45 )
            {
                var_6 = 1;
                var_7[var_7.size] = var_0[var_8];
            }
        }

        if ( var_6 > 0 )
        {
            var_10 = randomint( var_7.size + 1 );

            if ( isdefined( var_10 ) )
            {
                var_5.v["origin"] = var_7[var_10];

                if ( isdefined( var_5.v["origin"] ) && isdefined( var_5 ) )
                    common_scripts\utility::exploder( 700 );

                maps\_audio::aud_send_msg( "msg_audio_fx_ambientExp", var_7[var_10] );
            }

            wait 1;
        }
    }
}

_id_476C()
{
    wait 0.1;
    common_scripts\utility::flag_wait( "msg_fx_windowexplosionA" );
    common_scripts\utility::exploder( 980 );
    common_scripts\utility::flag_wait( "msg_fx_windowexplosionB" );
    common_scripts\utility::exploder( 981 );
    common_scripts\utility::flag_wait( "msg_fx_windowexplosionC" );
    common_scripts\utility::exploder( 982 );
}

_id_476D()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self.player getorigin();
    var_0.angles = ( 270.0, 0.0, -45.0 );

    if ( !isdefined( level._id_476E ) )
    {
        level._id_476E = 15;
        level._id_476F = 7;
    }

    wait 15.0;

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "entering_hind" );
        common_scripts\utility::flag_wait( "enable_distant_bombShakes" );
        common_scripts\utility::flag_waitopen( "msg_stop_fx_bombshakes" );

        if ( !common_scripts\utility::flag( "entering_hind" ) && common_scripts\utility::flag( "enable_distant_bombShakes" ) )
        {
            var_1 = 1008;
            var_0.origin = self.player getorigin();
            var_2 = bullettrace( self.player.origin + ( 0.0, 0.0, 12.0 ), self.player.origin + ( 0.0, 0.0, 1200.0 ), 0, undefined );
            var_3 = distance( var_0.origin, var_2["position"] );

            if ( var_3 < 200 )
            {
                maps\_audio::aud_send_msg( "msg_audio_fx_bombshake" );
                maps\_shg_fx::_id_444F( "falling_dirt_light", "viewmodel_medium", 0.127, 2, 0.3, 0.53 );
            }
        }

        var_4 = randomfloatrange( level._id_476F * -1, level._id_476F ) + level._id_476E;
        wait(var_4);
    }
}

_id_4770()
{
    level waittill( "msg_fx_set_surface_visionset" );
    thread maps\_utility::vision_set_fog_changes( "ny_harbor_surface", 3 );
}

_id_4771()
{
    if ( level.player buttonpressed( "space" ) == 1 )
        return 1;
    else
        return 0;
}

_id_4772()
{
    var_0 = common_scripts\utility::spawn_tag_origin();

    for (;;)
    {
        wait 1.0;
        var_1 = 30000;
        var_0.origin = self.player getorigin();
        var_0.origin += vectornormalize( anglestoforward( self.player getplayerangles() ) ) * var_1;
        var_2 = bullettrace( self.player.origin + ( 0.0, 0.0, 24.0 ), self.player.origin + ( 0.0, 0.0, -2000.0 ), 0, undefined );
        playfx( common_scripts\utility::getfx( "" ), var_2["position"] );
    }
}

_id_4773()
{
    for (;;)
    {
        wait 5;
        common_scripts\utility::exploder( 559 );
    }
}

_id_4774()
{
    var_0 = spawnstruct();

    if ( !isdefined( level._id_4775 ) )
        level._id_4775 = [];

    level._id_4775[level._id_4775.size] = var_0;
    var_0.v["health"] = 0;
    var_0.v["healrate"] = 15;
    var_0.v["numVFX"] = 0;
    var_0.v["vfxLife"] = 10;
    var_0.v["vfxOffset"] = ( 0.0, 0.0, 0.0 );
    var_0.v["fxid"] = common_scripts\utility::getfx( "room_dust_nyharbor" );
    var_0.v["roomTrigger"] = self;
    return var_0;
}

_id_4776( var_0 )
{
    var_1 = var_0.v["roomTrigger"];

    for (;;)
    {
        wait 1.0;
        var_0.v["health"] -= var_0.v["healrate"];

        if ( var_0.v["health"] < 0 )
            var_0.v["health"] = 0;
    }
}

_id_4777( var_0 )
{
    playfx( var_0.v["fxid"], var_0.v["roomTrigger"].origin + var_0.v["vfxoffset"], ( 0.0, 0.0, 1.0 ), ( 1.0, 0.0, 0.0 ) );
    var_0.v["numVFX"] += 1;
    wait(var_0.v["vfxLife"]);
    var_0.v["numVFX"] -= 1;
}

_id_4778()
{
    common_scripts\utility::flag_wait( "msg_start_fx_tiffanys_godrays" );
    wait 5.0;
    thread maps\_shg_fx::_id_4469( 558, "msg_fx_zone7" );
    thread maps\_shg_fx::_id_4469( 557, "msg_fx_zone7" );
}

_id_4779( var_0 )
{
    for (;;)
    {
        wait 7.0;

        if ( var_0.v["health"] > 50 && var_0.v["numVFX"] < 6 )
            thread _id_4777( var_0 );

        if ( var_0.v["health"] > 150 && var_0.v["numVFX"] < 6 )
            thread _id_4777( var_0 );

        if ( var_0.v["health"] > 300 && var_0.v["numVFX"] < 6 )
            thread _id_4777( var_0 );
    }
}

_id_477A( var_0 )
{
    var_1 = var_0.v["roomTrigger"];
    thread _id_4776( var_0 );
    thread _id_4779( var_0 );

    for (;;)
    {
        var_1 waittill( "damage" );
        var_0.v["health"]++;
        common_scripts\utility::flag_set( "msg_start_fx_tiffanys_godrays" );
    }
}

_id_477B()
{
    var_0 = getent( "tiffanys_fx_damage_trigger", "targetname" );
    var_1 = var_0 _id_4774();
    var_1.v["fxid"] = common_scripts\utility::getfx( "room_dust_nyharbor" );
    var_1.v["vfxoffset"] = ( 0.0, 0.0, -150.0 );
    var_1.v["healrate"] = 10;
    thread _id_477A( var_1 );
}

_id_477C()
{
    self endon( "death" );

    for (;;)
    {
        self setmodel( "com_traffic_red_light" );
        wait 0.75;
        self setmodel( "com_traffic_green_light" );
        wait 0.75;
    }
}

_id_477D()
{
    self endon( "death" );

    for (;;)
    {
        self setmodel( "com_lightbox_on" );
        wait 0.2;
        self setmodel( "com_lightbox" );
        wait 0.75;
    }
}

precachefx()
{
    level._effect["thick_dark_smoke_giant_nydowntown"] = loadfx( "smoke/thick_dark_smoke_giant_nydowntown" );
    level._effect["gaz_running_tail_lights"] = loadfx( "misc/gaz_running_tail_lights" );
    level._effect["ny_ceiling_collapse_concrete"] = loadfx( "maps/ny_manhattan/ny_ceiling_collapse_concrete" );
    level._effect["falling_dirt_light_1"] = loadfx( "dust/falling_dirt_light_1" );
    level._effect["ny_ladderclimb_dustrungs"] = loadfx( "maps/ny_manhattan/ny_ladderclimb_dustrungs" );
    level._effect["ny_ladderclimb_dust"] = loadfx( "maps/ny_manhattan/ny_ladderclimb_dust" );
    level._effect["ny_hind_windowhit"] = loadfx( "maps/ny_manhattan/ny_hind_windowhit" );
    level._effect["ny_heli_predatorexp"] = loadfx( "maps/ny_manhattan/ny_heli_predatorexp" );
    level._effect["ny_heli_hinddeath"] = loadfx( "maps/ny_manhattan/ny_heli_hinddeath" );
    level._effect["ny_towerambientexp"] = loadfx( "maps/ny_manhattan/ny_towerambientexp" );
    level._effect["firelp_med_pm_cheap_nolight"] = loadfx( "fire/firelp_med_pm_cheap_nolight" );
    level._effect["ny_heli_landing_smokedisturb"] = loadfx( "maps/ny_manhattan/ny_heli_landing_smokedisturb" );
    level._effect["gas_pipe_spray"] = loadfx( "water/gas_pipe_spray" );
    level._effect["ny_mortarexp_dud"] = loadfx( "maps/ny_manhattan/ny_mortarexp_dud" );
    level._effect["ny_initmissilehit"] = loadfx( "maps/ny_manhattan/ny_initmissilehit" );
    level._effect["amb_dust_light_med_graylit"] = loadfx( "dust/amb_dust_light_med_graylit" );
    level._effect["powerline_runner_small2"] = loadfx( "explosions/powerline_runner_small2" );
    level._effect["ny_hind_lastHit"] = loadfx( "maps/ny_manhattan/ny_hind_lastHit" );
    level._effect["ny_papers_heli_landing"] = loadfx( "maps/ny_manhattan/ny_papers_heli_landing" );
    level._effect["ny_nyse_laddermoment"] = loadfx( "maps/ny_manhattan/ny_nyse_laddermoment" );
    level._effect["ny_hind_smoketrail"] = loadfx( "maps/ny_manhattan/ny_hind_smoketrail" );
    level._effect["hind_finale_secondary_explosions"] = loadfx( "maps/ny_manhattan/hind_finale_secondary_explosions" );
    level._effect["generic_explosion_nolight"] = loadfx( "explosions/generic_explosion_nolight" );
    level._effect["oil_drip_small_continuous"] = loadfx( "misc/oil_drip_small_continuous" );
    level._effect["battlefield_smk_directional_White_M_lit"] = loadfx( "smoke/battlefield_smk_directional_White_M_lit" );
    level._effect["fire_ceiling_sm_slow"] = loadfx( "fire/fire_ceiling_sm_slow" );
    level._effect["fire_line_verysmall_cheap"] = loadfx( "fire/fire_line_verysmall_cheap" );
    level._effect["firelp_smokeonly_med"] = loadfx( "fire/firelp_smokeonly_med" );
    level._effect["smoke_geotrail_missile_shadow"] = loadfx( "smoke/smoke_geotrail_missile_shadow" );
    level._effect["window_explosion_glassy"] = loadfx( "explosions/window_explosion_glassy" );
    level._effect["ny_stryker_tread"] = loadfx( "maps/ny_manhattan/ny_stryker_tread" );
    level._effect["tread_road_stryker"] = loadfx( "treadfx/tread_road_stryker" );
    level._effect["stryker_exhaust"] = loadfx( "misc/stryker_exhaust" );
    level._effect["amb_smoke_black_small"] = loadfx( "smoke/amb_smoke_black_small" );
    level._effect["ny_chunkBombs5"] = loadfx( "maps/ny_manhattan/ny_chunkBombs5" );
    level._effect["ny_chunkBombs4"] = loadfx( "maps/ny_manhattan/ny_chunkBombs4" );
    level._effect["ny_chunkBombs3"] = loadfx( "maps/ny_manhattan/ny_chunkBombs3" );
    level._effect["ny_chunkBombs2"] = loadfx( "maps/ny_manhattan/ny_chunkBombs2" );
    level._effect["ny_chunkBombs"] = loadfx( "maps/ny_manhattan/ny_chunkBombs" );
    level._effect["ny_additionalchunks"] = loadfx( "maps/ny_manhattan/ny_additionalchunks" );
    level._effect["ny_hummerglasswindowfall"] = loadfx( "maps/ny_manhattan/ny_hummerglasswindowfall" );
    level._effect["generic_fallingdebris"] = loadfx( "misc/generic_fallingdebris" );
    level._effect["ny_hummerglasswindow"] = loadfx( "maps/ny_manhattan/ny_hummerglasswindow" );
    level._effect["fire_smoke_trail_s"] = loadfx( "fire/fire_smoke_trail_s" );
    level._effect["ny_carhit"] = loadfx( "maps/ny_manhattan/ny_carhit" );
    level._effect["light_hdr_fade"] = loadfx( "lights/light_hdr_fade" );
    level._effect["light_hdr_looper"] = loadfx( "lights/light_hdr_looper" );
    level._effect["fire_smoke_trail_M_ny"] = loadfx( "fire/fire_smoke_trail_M_ny" );
    level._effect["powerline_runner_small"] = loadfx( "explosions/powerline_runner_small" );
    level._effect["ny_hummerlightshaft"] = loadfx( "maps/ny_manhattan/ny_hummerlightshaft" );
    level._effect["ny_hummerfallingdust"] = loadfx( "maps/ny_manhattan/ny_hummerfallingdust" );
    level._effect["ceiling_dust_default"] = loadfx( "dust/ceiling_dust_default" );
    level._effect["ceiling_falling_tile"] = loadfx( "dust/ceiling_falling_tile" );
    level._effect["minigun_projectile"] = loadfx( "misc/minigun_projectile" );
    level._effect["ny_shockwave"] = loadfx( "maps/ny_manhattan/ny_shockwave" );
    level._effect["ny_buildingexplosion_trail"] = loadfx( "maps/ny_manhattan/ny_buildingexplosion_trail" );
    level._effect["folding_table"] = loadfx( "props/folding_table" );
    level._effect["ny_towerfirehit"] = loadfx( "maps/ny_manhattan/ny_towerfirehit" );
    level._effect["ny_towerfall"] = loadfx( "maps/ny_manhattan/ny_towerfall" );
    level._effect["fire_line_sm_cheap"] = loadfx( "fire/fire_line_sm_cheap" );
    level._effect["ny_explosion_debris"] = loadfx( "maps/ny_manhattan/ny_explosion_debris" );
    level._effect["generic_explosion_large"] = loadfx( "explosions/generic_explosion_large" );
    level._effect["ny_explosion_large"] = loadfx( "maps/ny_manhattan/ny_explosion_large" );
    level._effect["firelp_med_spreader_small"] = loadfx( "fire/firelp_med_spreader_small" );
    level._effect["fire_line_sm"] = loadfx( "fire/fire_line_sm" );
    level._effect["fire_ceiling_md_slow"] = loadfx( "fire/fire_ceiling_md_slow" );
    level._effect["large_electric_exp"] = loadfx( "props/large_electric_exp" );
    level._effect["single_tower_cable_end"] = loadfx( "maps/ny_manhattan/single_tower_cable_end" );
    level._effect["lights_godray_beam"] = loadfx( "lights/lights_godray_beam" );
    level._effect["lights_lf_test"] = loadfx( "lights/lights_lf_test" );
    level._effect["lights_lf_sewer"] = loadfx( "lights/lights_lf_sewer" );
    level._effect["falling_dirt_light"] = loadfx( "dust/falling_dirt_light" );
    level._effect["water_noise"] = loadfx( "weather/water_noise" );
    level._effect["waterfall_splash_falling_mist"] = loadfx( "water/waterfall_splash_falling_mist" );
    level._effect["water_pipe_spray"] = loadfx( "water/water_pipe_spray" );
    level._effect["water_faucet_spray"] = loadfx( "water/water_faucet_spray" );
    level._effect["fog_ground_200_heavy_lit"] = loadfx( "smoke/fog_ground_200_heavy_lit" );
    level._effect["pda_glow"] = loadfx( "props/pda_glow" );
    level._effect["smoke_red_lit_expensive"] = loadfx( "smoke/smoke_red_lit_expensive" );
    level._effect["light_red_pinlight"] = loadfx( "lights/light_red_pinlight" );
    level._effect["room_dust_nyharbor"] = loadfx( "dust/room_dust_100_blend_ny_harbor" );
    level._effect["cloud_ash_nyHarborm"] = loadfx( "weather/cloud_ash_nyHarbor" );
    level._effect["cloud_ash_lite_nyHarbor"] = loadfx( "weather/cloud_ash_lite_nyHarbor" );
    level._effect["electrical_transformer_spark_runner"] = loadfx( "explosions/electrical_transformer_spark_runner" );
    level._effect["steam_manhole"] = loadfx( "smoke/steam_manhole" );
    level._effect["bigcity_streetsmoke_obscure"] = loadfx( "smoke/bigcity_streetsmoke_obscure" );
    level._effect["bigcity_streetsmoke_obscure_low"] = loadfx( "smoke/bigcity_streetsmoke_obscure_low" );
    level._effect["bigcity_streetsmoke_obscure_onfire"] = loadfx( "smoke/bigcity_streetsmoke_obscure_onfire" );
    level._effect["firelp_med_pm_nolight"] = loadfx( "fire/firelp_med_pm_nolight" );
    level._effect["firelp_med_pm_far"] = loadfx( "fire/firelp_med_pm_far" );
    level._effect["building_collapse_nyharbor"] = loadfx( "dust/building_collapse_nyharbor" );
    level._effect["thick_dark_smoke_giant2"] = loadfx( "smoke/thick_dark_smoke_giant_nydowntown" );
    level._effect["antiair_runner_flak"] = loadfx( "misc/antiair_runner_flak" );
    level._effect["fireball_lp_smk_l_swirl"] = loadfx( "fire/fireball_lp_smk_l_swirl" );
    level._effect["fireball_lp_smk_l"] = loadfx( "fire/fireball_lp_smk_l" );
    level._effect["fireball_lp_smkonly_l"] = loadfx( "fire/fireball_lp_smkonly_l" );
    level._effect["fire_falling_runner_longlife"] = loadfx( "fire/fire_falling_runner_longlife" );
    level._effect["fire_embers_directional"] = loadfx( "fire/fire_embers_directional" );
    level._effect["fire_embers_directional_slow"] = loadfx( "fire/fire_embers_directional_slow" );
    level._effect["fire_embers_directional_lowvel"] = loadfx( "fire/fire_embers_directional_lowvel" );
    level._effect["generic_explosion"] = loadfx( "explosions/generic_explosion" );
    level._effect["ambient_explosion"] = loadfx( "maps/ny_manhattan/ambient_explosion" );
    level._effect["generic_explosion_distortion"] = loadfx( "maps/ny_manhattan/ny_explosion_distortion" );
    level._effect["generic_explosion_debris"] = loadfx( "explosions/generic_explosion_debris" );
    level._effect["window_explosion_glass_only"] = loadfx( "explosions/window_explosion_glass_only" );
    level._effect["highrise_glass_mullions_74x44"] = loadfx( "props/highrise_glass_mullions_74x44" );
    level._effect["abrams_muzzle_dust"] = loadfx( "dust/abrams_muzzle_dust" );
    level._effect["smoke_geotrail_genericexplosion"] = loadfx( "smoke/smoke_geotrail_genericexplosion_b" );
    level._effect["smoke_geotrail_genericexplosion_c"] = loadfx( "smoke/smoke_geotrail_genericexplosion_c" );
    level._effect["chunk_contrail_ny"] = loadfx( "maps/ny_manhattan/chunk_contrail_ny" );
    level._effect["car_glass_large"] = loadfx( "props/car_glass_large" );
    level._effect["glass_falling_ny"] = loadfx( "maps/ny_manhattan/building_debris_falling_ny" );
    level._effect["water_hydrant"] = loadfx( "water/water_hydrant" );
    level._effect["aa_explosion_super"] = loadfx( "explosions/aa_explosion_super_cloudOnly" );
    level._effect["generic_incoming_aa_shell"] = loadfx( "explosions/generic_incoming_aa_shell" );
    level._effect["ground_dust"] = loadfx( "dust/ground_dust" );
    level._effect["smoke_wall_l_warm_ny"] = loadfx( "smoke/smoke_wall_l_warm_ny" );
    level._effect["smk_shadow_l_ny"] = loadfx( "smoke/smk_shadow_l_ny" );
    level._effect["smoke_wall_m_warm_ny"] = loadfx( "smoke/smoke_wall_m_warm_ny" );
    level._effect["smk_shadow_m_ny"] = loadfx( "smoke/smk_shadow_m_ny" );
    level._effect["smoke_wall_s_warm_ny"] = loadfx( "smoke/smoke_wall_s_warm_ny" );
    level._effect["smk_shadow_s_ny"] = loadfx( "smoke/smk_shadow_s_ny" );
    level._effect["powerline_runner"] = loadfx( "explosions/powerline_runner" );
    level._effect["firelp_small_pm"] = loadfx( "fire/firelp_small_pm" );
    level._effect["dust_spiral_slow_runner"] = loadfx( "dust/dust_spiral_slow_runner_optim" );
    level._effect["battlefield_smk_directional_yel_xs"] = loadfx( "smoke/battlefield_smk_directional_yel_xs" );
    level._effect["battlefield_smk_directional_White_S"] = loadfx( "smoke/battlefield_smk_directional_White_S" );
    level._effect["battlefield_smk_directional_White_M"] = loadfx( "smoke/battlefield_smk_directional_White_M" );
    level._effect["ash_spiral_runner"] = loadfx( "dust/ash_spiral_runner" );
    level._effect["dust_wind_slow_paper_narrow"] = loadfx( "dust/dust_wind_slow_paper_narrow" );
    level._effect["battlefield_smk_linger_l"] = loadfx( "smoke/battlefield_smk_linger_l" );
    level._effect["pipe_steam"] = loadfx( "impacts/pipe_steam" );
    level._effect["pipe_steam_looping"] = loadfx( "impacts/pipe_steam_looping" );
    level._effect["car_steam_looping_sm"] = loadfx( "impacts/car_steam_looping_sm" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["paper_falling_narrow"] = loadfx( "misc/paper_falling_narrow" );
    level._effect["smoke_white_room_linger_l"] = loadfx( "smoke/smoke_white_room_linger_l" );
    level._effect["gasoline_spray"] = loadfx( "distortion/gasoline_spray" );
    level._effect["car_damaged_heat"] = loadfx( "distortion/car_damaged_heat" );
    level._effect["car_damaged_heat_lite"] = loadfx( "distortion/car_damaged_heat_lite" );
    level._effect["water_drips_fat_fast_singlestream"] = loadfx( "water/water_drips_fat_fast_singlestream" );
    level._effect["drips_faucet_slow"] = loadfx( "water/drips_faucet_slow" );
    level._effect["oil_drip_small"] = loadfx( "misc/oil_drip_small" );
    level._effect["tread_smk_road_gaz_front"] = loadfx( "treadfx/tread_smk_road_gaz_front" );
    level._effect["tread_smk_road_gaz_back"] = loadfx( "treadfx/tread_smk_road_gaz_back" );
    level._effect["car_glass_xl"] = loadfx( "props/car_glass_xl" );
    level._effect["fireball_lp_smk_L_quickfalloff"] = loadfx( "fire/fireball_lp_smk_L_quickfalloff" );
    level._effect["building_smoke_simple"] = loadfx( "smoke/building_smoke_simple" );
    level._effect["light_red_steady_dim"] = loadfx( "misc/tower_light_red_steady_dim" );
    level._effect["steam_large_vent_rooftop"] = loadfx( "smoke/steam_large_vent_rooftop" );
    level._effect["cloud_ash_nopaper_nyHarbor"] = loadfx( "weather/cloud_ash_nopaper_nyHarbor" );
    level._effect["cloud_ash_nopaperdark_nyHarbor"] = loadfx( "weather/cloud_ash_nopaperdark_nyHarbor" );
    level._effect["cloud_ash_nopaperdark_localized_nyHarbor"] = loadfx( "weather/cloud_ash_nopaperdark_localized_nyHarbor" );
    level._effect["embers_burst_runner_longlife"] = loadfx( "fire/embers_burst_runner_longlife" );
    level._effect["steam_vent_small"] = loadfx( "smoke/steam_vent_small" );
    level._effect["steam_jet_med_loop"] = loadfx( "smoke/steam_jet_med_loop" );
    level._effect["steam_room_100"] = loadfx( "smoke/steam_room_100" );
    level._effect["steam_hall_200"] = loadfx( "smoke/steam_hall_200" );
    level._effect["insects_carcass_flies"] = loadfx( "misc/insects_carcass_flies" );
    level._effect["insects_carcass_flies_dark"] = loadfx( "misc/insects_carcass_flies_dark" );
    level._effect["falling_dirt_light_runner"] = loadfx( "dust/falling_dirt_light_runner" );
    level._effect["lights_conelight_smokey"] = loadfx( "lights/lights_conelight_smokey" );
    level._effect["lights_godray_default"] = loadfx( "lights/lights_conelight_default" );
    level._effect["lights_tvlight_smokey"] = loadfx( "lights/lights_tvlight_smokey" );
    level._effect["tvlight_smokey_nolight"] = loadfx( "misc/tvlight_smokey_nolight" );
    level._effect["waterfall_drainage_short_dcemp"] = loadfx( "water/waterfall_drainage_short_dcemp" );
    level._effect["waterfall_drainage_splash_dcemp"] = loadfx( "water/waterfall_drainage_splash_dcemp" );
    level._effect["drips_slow"] = loadfx( "misc/drips_slow" );
    level._effect["drips_fast"] = loadfx( "misc/drips_fast" );
    level._effect["falling_water_trickle"] = loadfx( "water/falling_water_trickle" );
    level._effect["ny_manhattan_generic_spotlight_lit"] = loadfx( "misc/ny_manhattan_generic_spotlight_lit" );
    level._effect["room_smoke_warm_flicker"] = loadfx( "smoke/room_smoke_warm_flicker" );
    level._effect["embers_spurt"] = loadfx( "fire/embers_spurt" );
    level._effect["lights_uplight_haze"] = loadfx( "lights/lights_uplight_haze" );
    level._effect["lights_uplight_haze_large"] = loadfx( "lights/lights_uplight_haze_large" );
    level._effect["door_kick_small"] = loadfx( "dust/door_kick_small" );
    level._effect["tiffanys_ceiling_smoke"] = loadfx( "smoke/tiffanys_ceiling_smoke" );
    level._effect["lights_headlight"] = loadfx( "lights/lights_headlight" );
    level._effect["lights_strobe_red"] = loadfx( "lights/lights_strobe_red" );
    level._effect["lights_strobe_blue"] = loadfx( "lights/lights_strobe_blue" );
    level._effect["lights_alarm_strobe"] = loadfx( "lights/lights_alarm_strobe" );
    level._effect["lights_uplight_haze"] = loadfx( "lights/lights_uplight_haze" );
    level._effect["firelp_med_pm_cheap"] = loadfx( "fire/firelp_med_pm_cheap" );
    level._effect["firelp_med_pm_cheap_tiffanies"] = loadfx( "fire/firelp_med_pm_cheap_tiffanies" );
    level._effect["firelp_med_pm_cheap_smoke_pair"] = loadfx( "fire/firelp_med_pm_cheap_smoke_pair" );
    level._effect["firelp_small_streak_pm1_h_nolight"] = loadfx( "fire/firelp_small_streak_pm1_h_nolight" );
    level._effect["heli_crashed_tail_smoke"] = loadfx( "smoke/heli_crashed_tail_smoke" );
    level._effect["lighthaze_skylight"] = loadfx( "misc/lighthaze_skylight" );
    level._effect["ground_smoke_breach_hole"] = loadfx( "smoke/ground_smoke_breach_hole" );
    level._effect["smoke_gush_breach"] = loadfx( "smoke/smoke_gush_breach" );
    level._effect["breach_fire_smoke"] = loadfx( "smoke/breach_fire_smoke" );
    level._effect["falling_dirt_light_runner_tiffanies"] = loadfx( "dust/falling_dirt_light_runner_tiffanies" );
    level._effect["fire_falling_runner_point"] = loadfx( "fire/fire_falling_runner_point" );
    level._effect["cloud_ash_tiffanies"] = loadfx( "weather/cloud_ash_tiffanies" );
    level._effect["smk_column_thin_shaded_ny"] = loadfx( "maps/ny_manhattan/smk_column_thin_shaded_ny" );
    level._effect["smk_column_thin_sunned_ny"] = loadfx( "maps/ny_manhattan/smk_column_thin_sunned_ny" );
    level._effect["smk_column_thick_sunned_ny"] = loadfx( "maps/ny_manhattan/smk_column_thick_sunned_ny" );
    level._effect["fire_smoke_trail_l_emitter"] = loadfx( "fire/fire_smoke_trail_l_emitter" );
    level._effect["smoke_trail_black_heli_emitter"] = loadfx( "smoke/smoke_trail_black_heli_emitter" );
    level._effect["heli_engine_fire"] = loadfx( "fire/heli_engine_fire" );
    level._effect["hind_finale_enemy_tail_hit_ny"] = loadfx( "maps/ny_manhattan/hind_finale_enemy_tail_hit_ny" );
    level._effect["hind_finale_enemy_building_hit_ny"] = loadfx( "maps/ny_manhattan/hind_finale_enemy_building_hit_ny" );
    level._effect["hind_finale_enemy_tail_smk_trail_ny"] = loadfx( "maps/ny_manhattan/hind_finale_enemy_tail_smk_trail_ny" );
    level._effect["hind_finale_building_hit_shkwv_ny"] = loadfx( "maps/ny_manhattan/hind_finale_building_hit_shkwv_ny" );
    level._effect["hind_finale_building_fireball_out_ny"] = loadfx( "maps/ny_manhattan/hind_finale_building_fireball_out_ny" );
    level._effect["hind_finale_building_fire_linger_ny"] = loadfx( "maps/ny_manhattan/hind_finale_building_fire_linger_ny" );
    level._effect["hind_finale_player_smk_rotor_ny"] = loadfx( "maps/ny_manhattan/hind_finale_player_smk_rotor_ny" );
    level._effect["hind_finale_player_beeper"] = loadfx( "maps/ny_manhattan/hind_finale_player_beeper" );
    level._effect["firelp_large_streak_v_nolight"] = loadfx( "fire/firelp_large_streak_v_nolight" );
    level._effect["fuel_med_explosion"] = loadfx( "explosions/fuel_med_explosion" );
    level._effect["hind_finale_player_damage_spark"] = loadfx( "maps/ny_manhattan/hind_finale_player_damage_spark" );
    level._effect["hind_finale_chunk_smk_trail_ny"] = loadfx( "maps/ny_manhattan/hind_finale_chunk_smk_trail_ny" );
    level._effect["rotor_impact_concrete"] = loadfx( "impacts/rotor_impact_concrete" );
    level._effect["rotor_impact_concrete_sparks"] = loadfx( "impacts/rotor_impact_concrete_sparks" );
    level._effect["minigun_shell_eject"] = loadfx( "shellejects/20mm_mp" );
    level._effect["hind_spot"] = loadfx( "misc/aircraft_light_hindspot" );
    level._effect["skybox_hind_flyby"] = loadfx( "misc/skybox_hind_flyby" );
    level._effect["flesh_hit"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );

    if ( getdvarint( "sm_enable" ) && getdvar( "r_zfeather" ) != "0" )
        level._effect["spotlight"] = loadfx( "misc/hunted_spotlight_model" );
    else
        level._effect["spotlight"] = loadfx( "misc/spotlight_large" );

    level._effect["heli_dlight_blue"] = loadfx( "misc/aircraft_light_cockpit_blue" );
    level._effect["light_glow_white_bulb"] = loadfx( "misc/light_glow_white_bulb" );
    level._effect["fluorescent_glow"] = loadfx( "misc/fluorescent_glow" );
    level._effect["whiteout"] = loadfx( "maps/ny_manhattan/whiteout" );
    level._effect["spotlight_btr80_daytime"] = loadfx( "misc/spotlight_btr80_daytime" );
    level._effect["car_taillight_btr80_eye"] = loadfx( "misc/car_taillight_btr80_eye" );
    level._effect["traffic_light_red_blinking"] = loadfx( "misc/traffic_light_red_blinking" );
    level._effect["traffic_light_green_blinking"] = loadfx( "misc/traffic_light_green_blinking" );
    level._effect["aircraft_light_red_blink"] = loadfx( "misc/aircraft_light_red_blink" );
    level._effect["lights_spotlight"] = loadfx( "lights/lights_spotlight" );
    level._effect["ship_explosion"] = loadfx( "impacts/ssn12_concrete_impact" );
    level._effect["thermite_reaction"] = loadfx( "smoke/thermite_reaction" );
}

_id_477E()
{
    self waittill( "msg_fx_start_hindDust" );
}

_id_477F()
{
    common_scripts\utility::flag_wait( "entering_hind" );
    wait 1;
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 5;
    var_1["nearEnd"] = 10;
    var_1["nearBlur"] = 4;
    var_1["farStart"] = 300;
    var_1["farEnd"] = 3500;
    var_1["farBlur"] = 4;
    maps\_utility::_id_27C0( var_0, var_1, 0.3 );
    wait 4.3;
    maps\_utility::_id_27C0( var_1, var_0, 1 );
}

_id_4780()
{
    level._id_2A9C = 3000;
    var_0 = "treadfx/tread_snow_slush";
    var_1 = "treadfx/heli_dust_large";
    var_2 = "treadfx/heli_water_big";
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "brick", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "bark", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "carpet", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "cloth", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "concrete", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "dirt", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "flesh", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "foliage", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "glass", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "grass", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "gravel", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "ice", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "metal", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "mud", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "paper", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "plaster", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "rock", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "sand", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "snow", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "water", var_2 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "wood", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "asphalt", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "ceramic", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "plastic", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "rubber", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "cushion", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "fruit", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "painted metal", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "default", var_1 );
    maps\_treadfx::_id_28EF( "script_vehicle_ny_harbor_hind", "none", var_1 );
}

_id_4781()
{
    wait 1.0;
    common_scripts\utility::flag_wait( "thermite_detonated" );
    wait 15.0;
    common_scripts\utility::exploder( 1512 );
    common_scripts\utility::flag_wait( "entering_hind" );
    wait 15;
    maps\_shg_fx::_id_4467( 1512 );
    common_scripts\utility::exploder( 1513 );
    wait 5;
    maps\_shg_fx::_id_4467( 1513 );
}

_id_4782()
{
    self waittill( "entering_hind" );
    level waittill( "msg_fx_spawn_hindride_fx" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["type"] == "exploder" )
        {
            if ( isdefined( var_1.v["exploder"] ) && var_1.v["exploder"] != "560" )
                var_1 common_scripts\utility::pauseeffect();

            continue;
        }

        var_1 common_scripts\utility::pauseeffect();
    }

    common_scripts\utility::exploder( 560 );
}

_id_4783()
{
    var_0 = getent( "nyse_fx_damage_trigger", "targetname" );
    var_1 = var_0 _id_4784();
    var_1.v["fxid"] = common_scripts\utility::getfx( "smoke_white_room_linger_l" );
    var_1.v["vfxoffset"] = ( 0.0, 0.0, -150.0 );
    var_1.v["healrate"] = 10;
    thread _id_4786( var_1 );
}

_id_4784()
{
    var_0 = spawnstruct();

    if ( !isdefined( level._id_4775 ) )
        level._id_4775 = [];

    level._id_4775[level._id_4775.size] = var_0;
    var_0.v["health"] = 0;
    var_0.v["healrate"] = 15;
    var_0.v["numVFX"] = 0;
    var_0.v["vfxLife"] = 10;
    var_0.v["vfxOffset"] = ( 0.0, 0.0, 0.0 );
    var_0.v["fxid"] = common_scripts\utility::getfx( "smoke_white_room_linger_l" );
    var_0.v["roomTrigger"] = self;
    return var_0;
}

_id_4785( var_0 )
{
    wait 0.25;
    common_scripts\utility::flag_wait( "fx_zone_16000_active" );
    var_0.v["roomTrigger"] waittill( "damage" );
    var_1 = getdvarfloat( "scr_fog_exp_halfplane" );
    var_2 = getdvarfloat( "scr_fog_max_opacity" );
    var_3 = getdvarfloat( "scr_fog_nearplane" );
    var_4 = var_1;
    var_5 = var_2;
    var_6 = ( 0.4, 0.35, 0.3 );
    var_7 = var_3;
    var_8 = 16000;
    var_9 = 300;

    for (;;)
    {
        common_scripts\utility::flag_wait( "fx_zone_16000_active" );

        while ( common_scripts\utility::flag( "fx_zone_16000_active" ) )
        {
            var_10 = min( 1.0, max( 0.0, float( var_0.v["health"] ) / 300.0 ) );

            if ( var_0.v["health"] < 50 )
                var_10 = 0;

            var_4 = var_1 * ( 1 - var_10 ) + var_8 * var_10;
            var_5 = var_2 * ( 1 - var_10 ) + 0.1 * var_10;
            var_7 = 3000 * ( 1 - var_10 ) + var_9 * var_10;
            setexpfog( var_7, var_4, var_6[0], var_6[0], var_6[0], var_5, 2.0 );
            wait 2.1;
            var_8 = max( 1500, var_8 - 1100 );
            var_9 = max( 300, var_9 - 100 );
        }

        var_1 = getdvarfloat( "scr_fog_exp_halfplane" );
        var_2 = getdvarfloat( "scr_fog_max_opacity" );
        wait 0.5;
    }
}

_id_4786( var_0 )
{
    var_1 = var_0.v["roomTrigger"];
    thread _id_4776( var_0 );
    thread _id_4779( var_0 );
    thread _id_4785( var_0 );

    for (;;)
    {
        var_1 waittill( "damage" );
        var_0.v["health"]++;
    }
}

_id_4787()
{
    common_scripts\utility::flag_wait( "entering_hind" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["type"] == "oneshotfx" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4788()
{
    common_scripts\utility::flag_wait( "hind_finale_start" );
    common_scripts\utility::flag_wait( "msg_fx_hindfinale_oxytanks" );
    common_scripts\utility::exploder( 1507 );
    common_scripts\utility::exploder( 1547 );
    wait 2.25;
    earthquake( 0.2, 2.0, level.player.origin, 1600 );
}

_id_4789()
{
    wait 1;
    common_scripts\utility::flag_wait( "msg_fx_zone16" );
    var_0 = [ ( -1911.0, 2197.0, 1086.0 ), ( -1623.0, 2462.0, 1047.0 ), ( -2248.0, 2603.0, 1056.0 ), ( -2442.0, 2072.0, 1059.0 ), ( -1923.0, 1637.0, 1065.0 ), ( -1349.0, 1347.0, 1054.0 ), ( -1166.0, 1750.0, 1066.0 ), ( -1446.0, 2470.0, 1046.0 ), ( -1586.0, 2926.0, 1048.0 ), ( -2256.0, 2728.0, 1061.0 ), ( -1235.0, 1752.0, 1057.0 ), ( -1802.0, 1649.0, 1053.0 ), ( -1335.0, 2061.0, 1062.0 ), ( -1879.0, 1752.0, 1060.0 ), ( -1158.0, 2282.0, 1070.0 ), ( -1836.0, 1909.0, 1084.0 ), ( -1148.0, 1474.0, 1071.0 ), ( -1024.0, 1747.0, 1067.0 ), ( -1704.0, 2227.0, 1107.0 ), ( -1346.0, 2698.0, 1067.0 ), ( -1289.0, 1910.0, 1068.0 ), ( -1867.0, 2233.0, 1095.0 ), ( -2245.0, 2092.0, 1062.0 ), ( -1442.0, 1848.0, 1069.0 ) ];
    wait 3;

    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_fx_zone16" );
        var_1 = randomfloatrange( 2, 4.5 );
        wait(var_1);
        var_2 = maps\_shg_fx::_id_446A( 16001 );
        var_3 = randomint( var_0.size );
        var_2.v["origin"] = var_0[var_3];
        common_scripts\utility::exploder( 16001 );
    }
}

_id_478A()
{
    if ( !maps\_utility::_id_0A36() )
    {
        level waittill( "fx_zone_16000_activating" );
        level waittill( "fx_zone_17000_activating" );
        common_scripts\utility::exploder( 1509 );
        level._id_1441 thread maps\_utility::_id_27AF( 1, 0.1 );
        level._id_1441 maps\_utility::delaythread( 0.5, maps\_utility::_id_27AF, 0, 0.2 );
        maps\_audio::aud_send_msg( "ladder_climb_moment_explosion" );
        maps\_shg_fx::_id_444E( 0.65, 0.75, 0.21, 0.21 );
        setblur( 0.5, 0 );
        wait 0.25;
        setblur( 0, 0.25 );
        wait 0.35;
        var_0 = newclienthudelem( level.player );
        var_0.x = 0;
        var_0.y = 0;
        var_0 setshader( "fullscreen_dirt_bottom", 640, 480 );
        var_0.splatter = 1;
        var_0.alignx = "left";
        var_0.aligny = "top";
        var_0.sort = 1;
        var_0.foreground = 0;
        var_0.horzalign = "fullscreen";
        var_0.vertalign = "fullscreen";
        var_0.alpha = 0.15;

        for ( var_1 = 0; var_1 < 15; var_1++ )
        {
            var_0.alpha = ( 1 - var_1 / 14.0 ) * 0.15;
            level common_scripts\utility::waitframe();
        }

        var_0 destroy();
    }
}

_id_478B()
{
    if ( !common_scripts\utility::flag_exist( "fx_trigger_broad_hallexp" ) )
        common_scripts\utility::flag_init( "fx_trigger_broad_hallexp" );

    level common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "fx_trigger_broad_hallexp" );
    common_scripts\utility::exploder( 1515 );
    level._id_1441 thread maps\_utility::_id_27AF( 0.7, 0.1 );
    level._id_1441 maps\_utility::delaythread( 0.2, maps\_utility::_id_27AF, 0, 0.2 );
    maps\_audio::aud_send_msg( "broad_hallway_explosion" );
    maps\_shg_fx::_id_444E( 0.35, 0.75, 0.21, 0.1 );
}

_id_478C()
{
    if ( !common_scripts\utility::flag_exist( "fx_trigger_stairway_bombshake" ) )
        common_scripts\utility::flag_init( "fx_trigger_stairway_bombshake" );

    level common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "fx_trigger_stairway_bombshake" );
    common_scripts\utility::exploder( 1514 );
    level._id_1441 thread maps\_utility::_id_27AF( 0.7, 0.1 );
    level._id_1441 maps\_utility::delaythread( 0.4, maps\_utility::_id_27AF, 0, 0.2 );
    maps\_audio::aud_send_msg( "stairwell_bombshake_explosion" );
    maps\_shg_fx::_id_444E( 0.55, 0.75, 0.21, 0.21 );
}

_id_478D()
{
    var_0 = maps\_shg_fx::_id_446A( 1510 );
    var_1 = var_0.v["origin"];
    var_2 = 0.01;
    var_3 = 0;

    while ( !common_scripts\utility::flag( "entering_hind" ) )
    {
        var_4 = distance2d( var_1, level.player.origin );
        var_5 = 0.125 * clamp( 1.0 - var_4 / 3000.0, 0.01, 1.0 ) * var_2 / 2.0;
        var_6 = randomfloat( 1.0 ) * 8.0 + 1.0;
        earthquake( var_5, var_6 * 0.5, var_1, 3000 );
        var_2 = clamp( var_2 + var_6 / 20.0, 0.01, 2.0 );
        wait(var_6 / 20.0);
    }
}

_id_478E()
{
    common_scripts\utility::flag_wait( "obj_capturehind_given" );
    wait 5.0;
    common_scripts\utility::exploder( 1511 );
    wait 3.3;
    common_scripts\utility::exploder( 1510 );
    thread _id_478D();
    common_scripts\utility::flag_wait( "entering_hind" );
    maps\_utility::_id_2693( 1510 );
}

_id_478F()
{
    level endon( "msg_fx_end_heliswap" );

    while ( maps\ny_manhattan_code_hind::_id_45EA( self ) )
        level common_scripts\utility::waitframe();

    if ( !maps\ny_manhattan_code_hind::_id_45EA( self ) )
    {
        var_0 = vectornormalize( anglestoforward( self.angles ) ) * -150;
        var_1 = spawn( "script_model", self.origin );
        var_1.angles = self.angles;
        var_1 linkto( self, "tag_body", ( -150.0, 0.0, -25.0 ), ( 0.0, -90.0, 0.0 ) );
        var_1 setmodel( "vehicle_mi24p_hind_ny_destroy" );
        level common_scripts\utility::waitframe();
        var_1 hidepart( "rotor", "vehicle_mi24p_hind_ny_destroy" );
        wait 0.7;
        self hide();
        wait 9;
        var_1 delete();
    }
}

_id_4698()
{
    var_0 = level._id_29CE["script_vehicle_hind_woodland"][5]._id_164E;
    var_1 = level._id_29CE["script_vehicle_hind_woodland"][2]._id_164E;
    var_2 = level._id_29CE["script_vehicle_hind_woodland"][2].tag;
    var_3 = level._id_29CE["script_vehicle_hind_woodland"][2]._id_29EE;
    level._id_29CE["script_vehicle_hind_woodland"][5]._id_164E = common_scripts\utility::getfx( "ny_heli_hinddeath" );
    var_4 = "";

    while ( !common_scripts\utility::flag( "entering_hind" ) )
    {
        if ( !isdefined( level.player._id_2259 ) )
        {
            wait 2.0;
            level._id_29CE["script_vehicle_hind_woodland"][2]._id_164E = var_1;
            level._id_29CE["script_vehicle_hind_woodland"][2].tag = var_2;
            level._id_29CE["script_vehicle_hind_woodland"][2]._id_29EE = var_3;
            level notify( "msg_fx_end_heliswap" );
            level common_scripts\utility::waitframe();
            continue;
        }

        level._id_29CE["script_vehicle_hind_woodland"][2]._id_164E = common_scripts\utility::getfx( "ny_heli_predatorexp" );
        level._id_29CE["script_vehicle_hind_woodland"][2].tag = "tag_deathfx";
        level._id_29CE["script_vehicle_hind_woodland"][2]._id_29EE = 0;
        var_5 = undefined;
        level common_scripts\utility::waitframe();
        thread _id_478F();

        while ( isdefined( level.player._id_2259 ) )
            level common_scripts\utility::waitframe();
    }

    common_scripts\utility::flag_wait( "entering_hind" );
    level notify( "msg_fx_end_heliswap" );
    level._id_29CE["script_vehicle_hind_woodland"][5]._id_164E = var_0;
    level._id_29CE["script_vehicle_hind_woodland"][2]._id_164E = var_1;
    level._id_29CE["script_vehicle_hind_woodland"][2].tag = var_2;
    level._id_29CE["script_vehicle_hind_woodland"][2]._id_29EE = var_3;
}

_id_4790()
{
    common_scripts\utility::flag_wait_either( "obj_capturehind_given", "entering_hind" );
    maps\_shg_fx::_id_4468( "thick_dark_smoke_giant2" );
}

_id_4791()
{
    thread _id_4790();
    level waittill( "fx_zone_17000_activating" );
    maps\_shg_fx::_id_4468( "thick_dark_smoke_giant2" );

    for (;;)
    {
        level waittill( "fx_zone_16000_activating" );
        common_scripts\utility::exploder( 972 );
        level waittill( "fx_zone_17000_activating" );
        maps\_shg_fx::_id_4467( 972 );
    }
}

_id_45F4()
{
    wait 0.9;
    common_scripts\utility::exploder( 777 );
}

_id_01D5()
{
    var_0 = getentarray( "water_sheeting_vol", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_01D6 );
}

_id_01D6()
{
    self waittill( "trigger", var_0 );
    level.player setwatersheeting( 1 );
    var_0 _id_01D7( self );
}

_id_01D7( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( self istouching( var_0 ) )
        {
            wait 0.15;
            continue;
        }

        level.player setwatersheeting( 1, 0.5 );
        var_0 thread _id_01D6();
        return;
    }
}
