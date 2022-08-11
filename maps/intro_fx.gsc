// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread precachefx();

    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
    {
        _id_6ECE::main();
        maps\_shg_fx::_id_4445();
    }

    thread maps\_shg_fx::_id_445E( 5001, "msg_fx_zone5_intro", "msg_fx_zone5_1_intro" );
    thread maps\_shg_fx::_id_445E( 6001, "msg_fx_zone6_intro", "msg_fx_zone6_1_intro" );
    thread maps\_shg_fx::_id_445E( 7001, "msg_fx_zone7_intro", "msg_fx_zone7_1_intro" );
    thread maps\_shg_fx::_id_445E( 5000, "msg_fx_zone5", "msg_fx_zone5_1" );
    thread maps\_shg_fx::_id_445E( 5002, "msg_fx_zone5_2" );
    thread maps\_shg_fx::_id_445E( 6000, "msg_fx_zone6", "msg_fx_zone6_1" );
    thread maps\_shg_fx::_id_445E( 7000, "msg_fx_zone7" );
    thread maps\_shg_fx::_id_445E( 7050, "msg_fx_zone7_5" );
    thread _id_6EFC();
    thread _id_4743();
    thread _id_4780();
    thread _id_6EE2();
    thread _id_6EE3();
    thread _id_6ECF();
    common_scripts\utility::flag_init( "fx_maars_hud_up" );
}

_id_6ECF()
{
    for (;;)
    {
        level waittill( "fx_zone_5000_activating" );

        if ( level.console )
            setsaveddvar( "r_dlightlimit", 1 );

        level waittill( "fx_zone_5000_deactivating" );

        if ( level.console )
            setsaveddvar( "r_dlightlimit", 4 );
    }
}

_id_4743()
{
    setsaveddvar( "fx_alphathreshold", 11 );
}

_id_6ED0()
{
    common_scripts\utility::waitframe();
    var_0 = [ "msg_fx_zone5", "msg_fx_zone5_1", "msg_fx_zone6", "msg_fx_zone6_1", "msg_fx_zone7" ];

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2 + "_intro", "targetname" );

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5 ) )
                var_5 common_scripts\utility::trigger_off();
        }
    }
}

_id_6ED1()
{
    var_0 = [ "msg_fx_zone5", "msg_fx_zone5_1", "msg_fx_zone6", "msg_fx_zone6_1", "msg_fx_zone7" ];

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2, "targetname" );
        var_4 = getentarray( var_2 + "_intro", "targetname" );

        foreach ( var_6 in var_4 )
        {
            if ( isdefined( var_6 ) )
                var_6 common_scripts\utility::trigger_on();
        }

        foreach ( var_6 in var_3 )
        {
            if ( isdefined( var_6 ) )
                var_6 common_scripts\utility::trigger_off();
        }
    }
}

_id_6ED2()
{
    var_0 = [ "msg_fx_zone5", "msg_fx_zone5_1", "msg_fx_zone6", "msg_fx_zone6_1", "msg_fx_zone7" ];

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2, "targetname" );
        var_4 = getentarray( var_2 + "_intro", "targetname" );

        foreach ( var_6 in var_4 )
        {
            if ( isdefined( var_6 ) )
                var_6 common_scripts\utility::trigger_off();
        }

        foreach ( var_6 in var_3 )
        {
            if ( isdefined( var_6 ) )
                var_6 common_scripts\utility::trigger_on();
        }
    }
}

_id_4780()
{
    wait 0.025;
    var_0 = "treadfx/tread_dust_default_small";
    var_1 = "treadfx/tread_water_small";
    var_2[0] = "script_vehicle_ugv_robot";
    var_2[1] = "script_vehicle_80s_sedan1_brn";
    var_2[2] = "script_vehicle_80s_hatch1_brn_destructible_mp";

    foreach ( var_4 in var_2 )
    {
        maps\_treadfx::_id_28EF( var_4, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_4, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_4, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_4, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_4, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_4, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_4, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_4, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_4, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_4, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_4, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_4, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_4, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_4, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_4, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_4, "plaster", var_0 );
        maps\_treadfx::_id_28EF( var_4, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_4, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_4, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_4, "water", var_1 );
        maps\_treadfx::_id_28EF( var_4, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_4, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_4, "ceramic", var_0 );
        maps\_treadfx::_id_28EF( var_4, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_4, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_4, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_4, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_0 );
        maps\_treadfx::_id_28EF( var_4, "riotshield", var_0 );
        maps\_treadfx::_id_28EF( var_4, "slush", var_0 );
        maps\_treadfx::_id_28EF( var_4, "default", var_0 );
        maps\_treadfx::_id_28EF( var_4, "none" );
    }
}

_id_6ED3()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0 linkto( level._id_54E0, "J_Collar", ( 0.0, 0.0, 0.0 ), ( 0.0, 270.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "blood_drip_table_soap" ), var_0, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "blood_cough" ), level._id_54E0, "J_Jaw" );
    level waittill( "msg_soap_stop_bleeding" );
    stopfxontag( common_scripts\utility::getfx( "blood_drip_table_soap" ), var_0, "tag_origin" );
    var_0 delete();
}

_id_6ED4( var_0 )
{
    common_scripts\utility::exploder( 711 );
    level common_scripts\utility::waitframe();
    common_scripts\utility::exploder( 716 );
    level common_scripts\utility::waitframe();
    common_scripts\utility::exploder( 718 );
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "destroyed_top_branch5A" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "middle_branch3A" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "destroyed_top_branch8B" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "destroyed_top_branch1B" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "destroyed_top_branch9A" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "destroyed_top_branch21B" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_0, "destroyed_top_branch11A" );
    wait 0.85;
    common_scripts\utility::exploder( 713 );
    wait 0.1;
    common_scripts\utility::exploder( 714 );
    wait 0.7;
    common_scripts\utility::exploder( 712 );
    wait 0.0;
    common_scripts\utility::exploder( 715 );
    wait 0.0;
    common_scripts\utility::exploder( 717 );
}

_id_6ED5()
{
    wait 0.85;
    common_scripts\utility::exploder( 115 );
    wait 0.9;
    common_scripts\utility::exploder( 117 );
    wait 0.18;
    common_scripts\utility::exploder( 116 );
}

_id_6ED6()
{
    wait 8.0;
    common_scripts\utility::exploder( 110 );
    wait 0.85;
    common_scripts\utility::exploder( 110 );
    wait 0.65;
    common_scripts\utility::exploder( 110 );
    wait 1.5;
    common_scripts\utility::exploder( 110 );
    wait 1.0;
    common_scripts\utility::exploder( 110 );
    wait 0.65;
    common_scripts\utility::exploder( 110 );
    wait 0.85;
    common_scripts\utility::exploder( 110 );
    wait 1.0;
    common_scripts\utility::exploder( 110 );
    wait 0.5;
    common_scripts\utility::exploder( 110 );
    wait 1.8;
    common_scripts\utility::exploder( 110 );
    wait 0.7;
    common_scripts\utility::exploder( 110 );
    wait 0.65;
    common_scripts\utility::exploder( 110 );
    wait 0.85;
    common_scripts\utility::exploder( 110 );
    wait 1.0;
    common_scripts\utility::exploder( 110 );
    wait 0.5;
    common_scripts\utility::exploder( 110 );
    wait 1.0;
    common_scripts\utility::exploder( 110 );
    wait 0.8;
    common_scripts\utility::exploder( 110 );
    wait 0.65;
    common_scripts\utility::exploder( 110 );
    wait 0.85;
    common_scripts\utility::exploder( 110 );
}

_id_6ED7( var_0 )
{
    var_1 = getent( "escort_help_soap_breacher1", "targetname" );
    playfxontag( common_scripts\utility::getfx( "pistolflash" ), var_0, "tag_flash" );
    playfxontag( common_scripts\utility::getfx( "headshot" ), var_0, "tag_flash" );
    common_scripts\utility::exploder( 106 );
}

_id_6ED8()
{
    wait 0.0;
    common_scripts\utility::exploder( 9000 );
    wait 0.1;
    common_scripts\utility::exploder( 9001 );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    wait 20;

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_6ED9()
{
    wait 0.1;
    common_scripts\utility::exploder( 8001 );
    wait 1.0;
    common_scripts\utility::exploder( 8000 );
}

_id_6EDA()
{
    wait 2.58;
    common_scripts\utility::exploder( 8018 );
    wait 0.1;
    common_scripts\utility::exploder( 8019 );
    wait 0.1;
    common_scripts\utility::exploder( 8020 );
    wait 0.1;
    common_scripts\utility::exploder( 8021 );
    wait 0.1;
    common_scripts\utility::exploder( 8022 );
    wait 0.1;
    common_scripts\utility::exploder( 8023 );
    wait 0.1;
    common_scripts\utility::exploder( 8024 );
    wait 0.1;
    common_scripts\utility::exploder( 8025 );
    wait 0.1;
    common_scripts\utility::exploder( 8026 );
    wait 0.1;
    common_scripts\utility::exploder( 8027 );
    wait 0.1;
    common_scripts\utility::exploder( 8028 );
}

_id_6EDB()
{
    wait 0.0;
    common_scripts\utility::exploder( 8011 );
    wait 4.0;
    common_scripts\utility::exploder( 8010 );
    wait 1.0;
    common_scripts\utility::exploder( 8012 );
    wait 1.0;
    common_scripts\utility::exploder( 8013 );
}

_id_6EDC( var_0 )
{
    wait 0.0;
    common_scripts\utility::exploder( 8030 );
}

_id_6EDD()
{
    common_scripts\utility::exploder( 105 );
}

_id_6EDE()
{
    wait 0.1;
    common_scripts\utility::exploder( 200 );
}

_id_6EDF( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_wheel_back_left" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( var_0, "tag_wheel_back_left" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "tag_wheel_back_right" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_2 linkto( var_0, "tag_wheel_back_right" );
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long" ), var_2, "tag_origin" );
}

_id_6EE0()
{
    wait 0.45;
    common_scripts\utility::exploder( 1500 );
}

_id_6EE1()
{
    wait 1.75;
    common_scripts\utility::exploder( 1501 );
    wait 0.2;
    common_scripts\utility::exploder( 1502 );
}

_id_6EE2()
{
    level common_scripts\utility::waitframe();

    if ( !common_scripts\utility::flag_exist( "fx_shed_bombshake1" ) )
        common_scripts\utility::flag_init( "fx_shed_bombshake1" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "fx_shed_bombshake1" );
        wait 3;
        common_scripts\utility::exploder( 3101 );
        common_scripts\utility::flag_waitopen( "fx_maars_hud_up" );
        maps\_audio::aud_send_msg( "intro_shed_bombshake_01" );
        level.player playrumbleonentity( "artillery_rumble" );
        maps\_shg_fx::_id_444E( 0.55, 0.75, 0.21, 0.21 );
        var_0 = randomint( 7 );
        wait(var_0);
    }
}

_id_6EE3()
{
    level common_scripts\utility::waitframe();

    if ( !common_scripts\utility::flag_exist( "fx_shed_bombshake2" ) )
        common_scripts\utility::flag_init( "fx_shed_bombshake2" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "fx_shed_bombshake2" );
        wait 5;
        common_scripts\utility::flag_waitopen( "fx_maars_hud_up" );
        common_scripts\utility::exploder( 3102 );
        maps\_audio::aud_send_msg( "intro_shed_bombshake_02" );
        level.player playrumbleonentity( "artillery_rumble" );
        maps\_shg_fx::_id_444E( 0.55, 0.75, 0.21, 0.21 );
        var_0 = randomint( 7 );
        wait(var_0);
    }
}

_id_6EE4( var_0 )
{
    wait 0.05;
    common_scripts\utility::exploder( 2000 );
    maps\_shg_fx::_id_4467( 600 );
    maps\_shg_fx::_id_4467( 666 );
    maps\_shg_fx::_id_4467( 5000 );
    maps\_shg_fx::_id_4467( 8000 );
}

_id_6EE5( var_0 )
{
    common_scripts\utility::exploder( 2001 );
    wait 0.025;
    common_scripts\utility::exploder( 2004 );
    wait 0.025;
    wait 0.1;
    common_scripts\utility::exploder( 2002 );
    wait 0.125;
    common_scripts\utility::exploder( 2003 );
    wait 13.1;
    common_scripts\utility::exploder( 3000 );
    wait 1.05;
    common_scripts\utility::exploder( 3001 );
    wait 2.1;
    common_scripts\utility::exploder( 3002 );
}

_id_6EE6( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "doorsegment1" );
    var_1.angles = vectortoangles( ( 1.0, 0.0, 0.8 ) );
    var_1 linkto( var_0, "doorsegment1" );
    playfxontag( common_scripts\utility::getfx( "lights_reveal_intro_oriented" ), var_1, "tag_origin" );
    common_scripts\utility::exploder( 1000 );
    wait 0.05;
    common_scripts\utility::exploder( 1001 );
    wait 0.0;
    wait 0.7;
    common_scripts\utility::exploder( 1005 );
    wait 0.87;
    common_scripts\utility::exploder( 1002 );
    wait 0.18;
    common_scripts\utility::exploder( 1003 );

    if ( level.console )
        setsaveddvar( "r_dlightlimit", 0 );
}

_id_6EE7()
{
    wait 0.55;
    common_scripts\utility::exploder( 100 );
}

_id_6EE8()
{
    wait 1.1;
    wait 0.1;
    wait 0.2;
    common_scripts\utility::exploder( 709 );
    wait 0.08;
    common_scripts\utility::exploder( 709 );
    wait 0.5;
    common_scripts\utility::exploder( 703 );
    wait 0.15;
    wait 2.0;
    common_scripts\utility::exploder( 705 );
    wait 0.3;
    common_scripts\utility::exploder( 706 );
    thread _id_6EFD();
}

_id_6EE9()
{

}

_id_6EEA()
{
    wait 7.4;
    common_scripts\utility::exploder( 804 );
    wait 0.3;
    common_scripts\utility::exploder( 801 );
    wait 0.3;
    common_scripts\utility::exploder( 815 );
    wait 0.5;
    common_scripts\utility::exploder( 803 );
    wait 0.4;
    wait 0.3;
    common_scripts\utility::exploder( 800 );
    wait 2.5;
    common_scripts\utility::exploder( 815 );
    wait 0.65;
    common_scripts\utility::exploder( 800 );
    common_scripts\utility::exploder( 804 );
    wait 0.2;
    common_scripts\utility::exploder( 805 );
}

_id_6EEB()
{
    common_scripts\utility::exploder( 600 );
}

_id_6EEC()
{
    common_scripts\utility::exploder( 700 );
}

_id_6EED()
{
    maps\_shg_fx::_id_4467( 700 );
}

_id_6EEE( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "J_WristTwist_LE" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 0.0 ) );
    var_1 linkto( var_0, "J_WristTwist_LE" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "J_WristTwist_RI" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 0.0 ) );
    var_2 linkto( var_0, "J_WristTwist_RI" );
    wait 2.9;
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent_small_2" ), var_2, "tag_origin" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent_small" ), var_1, "tag_origin" );
    wait 2.923;
    common_scripts\utility::exploder( 9011 );
    wait 5.0;
    common_scripts\utility::exploder( 9010 );
    wait 6.5;
    maps\_shg_fx::_id_4467( 9010 );
    common_scripts\utility::exploder( 9015 );
}

_id_6EEF( var_0 )
{

}

_id_6EF0()
{
    var_0 = getent( "landslide_tree01", "targetname" );
    var_1 = getent( "landslide_tree02", "targetname" );
    var_2 = getent( "landslide_tree03", "targetname" );
    var_3 = getent( "landslide_tree07", "targetname" );
    var_4 = getent( "landslide_tree02_origin", "targetname" );
    var_5 = getent( "landslide_tree03_origin", "targetname" );
    var_6 = getent( "landslide_tree07_origin", "targetname" );
    var_1 linkto( var_4 );
    var_2 linkto( var_5 );
    var_3 linkto( var_6 );
    wait 8.0;
    var_6 rotateto( var_6.angles + ( -80.0, 0.0, 0.0 ), 2.2, 0.5, 0 );
    wait 0.6;
    common_scripts\utility::exploder( 853 );
    wait 0.1;
    common_scripts\utility::exploder( 854 );
    wait 0.5;
    var_0 rotateto( var_0.angles + ( 0.5, 0.0, -0.5 ), 0.2, 0.1, 0.1 );
    wait 0.22;
    var_0 rotateto( var_0.angles + ( -0.5, 0.0, 0.5 ), 0.1, 0.05, 0.05 );
    wait 1.8;
    var_0 rotateto( var_0.angles + ( 0.5, 0.0, -0.5 ), 0.2, 0.1, 0.1 );
    wait 0.2;
    var_0 rotateto( var_0.angles + ( -120.0, 0.0, 15.0 ), 3.2, 0.5, 0 );
    wait 0.6;
    common_scripts\utility::exploder( 852 );
    wait 0.1;
    common_scripts\utility::exploder( 851 );
    wait 0.9;
    var_5 rotateto( var_5.angles + ( 0.0, 0.0, -80.0 ), 1.5, 0.5, 0 );
    wait 0.4;
    var_4 rotateto( var_4.angles + ( 100.0, 0.0, 45.0 ), 1.0, 0.65, 0 );
    wait 1.0;
    var_4 rotateto( var_4.angles + ( -20.0, 0.0, 0.0 ), 0.3, 0, 0.15 );
    wait 0.31;
    var_4 rotateto( var_4.angles + ( 20.0, 0.0, 0.0 ), 0.7, 0.7, 0.0 );
    wait 0.1;
    common_scripts\utility::exploder( 850 );
}

_id_6EF1( var_0 )
{
    wait 18.585;
    common_scripts\utility::exploder( 953 );
}

_id_6EF2()
{
    wait 16.8;
    common_scripts\utility::exploder( 901 );
    wait 0.4;
    wait 0.1;
    common_scripts\utility::exploder( 902 );
    wait 0.4;
    wait 0.1;
    common_scripts\utility::exploder( 904 );
    wait 0.2;
    common_scripts\utility::exploder( 905 );
}

_id_6EF3( var_0, var_1, var_2 )
{
    wait 13.55;
    wait 3.0;
    common_scripts\utility::exploder( 950 );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.0;
    wait 0.05;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.47;
    common_scripts\utility::exploder( 956 );
    wait 0.0;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    common_scripts\utility::exploder( 951 );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.05;
    common_scripts\utility::exploder( 955 );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.67;
    common_scripts\utility::exploder( 952 );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.118;
    common_scripts\utility::exploder( 954 );
    level common_scripts\utility::waitframe();
    wait 0.02;
    level common_scripts\utility::waitframe();
    wait 0.0;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.05;
    level common_scripts\utility::waitframe();
    wait 0.1;
    level common_scripts\utility::waitframe();
}

_id_6EF4( var_0, var_1, var_2, var_3 )
{
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_3 gettagorigin( "tag_replaceProp_4" );
    var_4 linkto( var_3, "tag_replaceProp_4" );
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5.origin = var_0 gettagorigin( "tag_fx_95" );
    var_5 linkto( var_0, "tag_fx_95" );
    var_6 = common_scripts\utility::spawn_tag_origin();
    var_6.origin = var_0 gettagorigin( "tag_fx_68" );
    var_6 linkto( var_0, "tag_fx_68" );
    var_7 = common_scripts\utility::spawn_tag_origin();
    var_7.origin = var_3 gettagorigin( "tag_replaceProp_9" );
    var_7 linkto( var_3, "tag_replaceProp_9" );
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_8.origin = var_1 gettagorigin( "tag_fx_174" );
    var_8 linkto( var_1, "tag_fx_174" );
    var_9 = common_scripts\utility::spawn_tag_origin();
    var_9.origin = var_0 gettagorigin( "tag_fx_134" );
    var_9 linkto( var_0, "tag_fx_134" );
    wait 15.6;
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_4, "tag_origin" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_5, "tag_origin" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_6, "tag_origin" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_7, "tag_origin" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_8, "tag_origin" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_trail_parent" ), var_9, "tag_origin" );
}

_id_6EF5( var_0, var_1, var_2, var_3 )
{
    wait 13.6;
    wait 3.0;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_94" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_56" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.0;
    wait 0.05;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_95" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.47;
    wait 0.0;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_91" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_143" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_2, "tag_fx_10" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.05;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_3, "tag_replaceProp_7" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_72" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_71" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_57" );
    level common_scripts\utility::waitframe();
    wait 0.7;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro_delay" ), var_1, "tag_fx_174" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.115;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_1, "tag_fx_154" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_1, "tag_fx_154" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_1, "tag_fx_154" );
    level common_scripts\utility::waitframe();
    wait 0.01;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_78" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_3, "tag_replaceProp_9" );
    wait 0.0;
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro_delay" ), var_0, "tag_fx_134" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "body_splash_intro_delay" ), var_3, "tag_replaceProp_4" );
    level common_scripts\utility::waitframe();
    wait 0.05;
    playfxontag( common_scripts\utility::getfx( "body_splash_intro" ), var_0, "tag_fx_68" );
    level common_scripts\utility::waitframe();
    wait 0.1;
    level common_scripts\utility::waitframe();
}

_id_6EF6( var_0 )
{
    wait 16.035;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.0;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.0;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.0;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    wait 0.55;
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
}

_id_6EF7( var_0 )
{
    level common_scripts\utility::waitframe();
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_player" );
    var_1.angles = var_0 gettagangles( "tag_player" );
    level endon( "dismount_maars" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "ugv_fxstate1" );
        playfxontag( common_scripts\utility::getfx( "intro_ugv_state1" ), var_0, "tag_player" );
        common_scripts\utility::flag_waitopen( "ugv_fxstate1" );
        stopfxontag( common_scripts\utility::getfx( "intro_ugv_state1" ), var_0, "tag_player" );
    }
}

_id_6EF8( var_0 )
{
    level common_scripts\utility::waitframe();
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_player" );
    var_1.angles = var_0 gettagangles( "tag_player" );
    level endon( "dismount_maars" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "ugv_fxstate2" );
        stopfxontag( common_scripts\utility::getfx( "intro_ugv_state2smoke" ), var_0, "tag_player" );
        playfxontag( common_scripts\utility::getfx( "intro_ugv_state2" ), var_0, "tag_player" );
        level common_scripts\utility::waitframe();
        level common_scripts\utility::waitframe();
        playfxontag( common_scripts\utility::getfx( "intro_ugv_state2smoke" ), var_0, "tag_player" );
        common_scripts\utility::flag_waitopen( "ugv_fxstate2" );
        stopfxontag( common_scripts\utility::getfx( "intro_ugv_state2" ), var_0, "tag_player" );
        stopfxontag( common_scripts\utility::getfx( "intro_ugv_state2smoke" ), var_0, "tag_player" );
        level common_scripts\utility::waitframe();
        level common_scripts\utility::waitframe();
        playfxontag( common_scripts\utility::getfx( "intro_ugv_state2smoke" ), var_0, "tag_player" );
    }
}

_id_6EF9()
{
    thread _id_6EFD();
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "intro_ugv_death" ), self[2], "tag_weapon" );

    if ( level.console )
        setsaveddvar( "r_dlightlimit", 4 );
}

_id_6EFA( var_0 )
{
    level endon( "dismount_maars" );
    var_1 = level.player.health / level.player.maxhealth;
    var_2 = 0.0;
    common_scripts\utility::flag_init( "ugv_fxstate1" );
    common_scripts\utility::flag_init( "ugv_fxstate2" );
    thread _id_6EF7( var_0 );
    thread _id_6EF8( var_0 );

    for (;;)
    {
        var_3 = level.player._id_6EFB["damage_overlay"].alpha;

        if ( isalive( level.player ) && var_2 < var_3 )
            var_2 = var_3;
        else if ( !isalive( level.player ) )
            var_2 = 1.0;

        if ( var_2 > 0.4 )
            common_scripts\utility::flag_set( "ugv_fxstate2" );
        else
            common_scripts\utility::flag_clear( "ugv_fxstate2" );

        if ( var_2 > 0.05 )
            common_scripts\utility::flag_set( "ugv_fxstate1" );
        else
            common_scripts\utility::flag_clear( "ugv_fxstate1" );

        wait 1.0;

        if ( var_2 > 0.4 )
            var_2 -= 0.0125;
        else
            var_2 -= 0.025;

        var_2 = clamp( var_2, 0, 1 );
    }
}

_id_6EFC()
{
    level common_scripts\utility::waitframe();
    var_0 = getent( "intro_landslide_building_shards", "targetname" );
    var_1 = getent( "intro_landslide_building_shards2", "targetname" );
    var_2 = getent( "intro_landslide_building_subfloor", "targetname" );
    var_3 = getent( "intro_landslide_building_handkey", "targetname" );
    var_4 = common_scripts\utility::getstruct( "slide_roof_collapse", "targetname" );
    var_0._id_1032 = "landslide_building_roof";
    var_0 maps\_anim::_id_1244();
    var_1._id_1032 = "landslide_building_roof2";
    var_1 maps\_anim::_id_1244();
    var_2._id_1032 = "landslide_building_subfloor";
    var_2 maps\_anim::_id_1244();
    var_3._id_1032 = "landslide_building_handkey";
    var_3 maps\_anim::_id_1244();
    var_5 = [ var_0 ];
    var_4 thread maps\_anim::_id_11BF( var_5, "intro_rooftop_collapse_sim_roof" );
    var_6 = [ var_1 ];
    var_4 thread maps\_anim::_id_11BF( var_6, "intro_rooftop_collapse_sim_roof2" );
    var_7 = [ var_2 ];
    var_4 thread maps\_anim::_id_11BF( var_7, "intro_rooftop_collapse_sim_subfloor" );
    var_8 = [ var_3 ];
    var_4 thread maps\_anim::_id_11BF( var_8, "intro_rooftop_collapse_handkey" );
    var_0 hide();
    var_1 hide();
    var_2 hide();
    var_3 hide();
    wait 0.5;
    var_9 = getentarray( "intro_landslide_small_01", "targetname" );
    var_10 = getentarray( "intro_landslide_small_02", "targetname" );
    var_11 = var_9[0];
    var_12 = var_10[0];

    for ( var_13 = 1; var_13 < var_9.size; var_13++ )
    {
        if ( isdefined( var_9[var_13] ) )
            var_9[var_13] delete();

        if ( isdefined( var_10[var_13] ) )
            var_10[var_13] delete();
    }

    var_4 = common_scripts\utility::getstruct( "slide_roof_collapse", "targetname" );
    var_11._id_1032 = "landslide_building_small_01";
    var_11 maps\_anim::_id_1244();
    var_12._id_1032 = "landslide_building_small_02";
    var_12 maps\_anim::_id_1244();
    var_14 = [ var_11, var_12 ];
    var_4 maps\_anim::_id_11BF( var_14, "intro_landslide_small" );
    var_11 hide();
    var_12 hide();
}

_id_6EFD()
{
    var_0 = getdvar( "vision_set_current" );
    visionsetnaked( "generic_flash", 0.2 );
    wait 0.1;
    visionsetnaked( var_0, 0.2 );
}

_id_6EFE( var_0, var_1 )
{
    while ( isdefined( var_0 ) )
    {
        self.origin = var_0 gettagorigin( var_1 );
        level common_scripts\utility::waitframe();
    }
}

_id_6EFF()
{
    self waittillmatch( "single anim", "slide_shake_end" );
    level._id_6F00 = 1000;
    level notify( "killslidequake" );
}

_id_6F01()
{
    self waittillmatch( "single anim", "slide_shake_start" );
    thread _id_6EFF();
    level._id_6F00 = 0.0;
    var_0 = level.player.origin;
    var_1 = 0.01;
    var_2 = 0;
    var_3 = 3.5;
    var_4 = 0;

    for ( var_5 = 2.0; var_4 < var_3 && level._id_6F00 == 0; var_4 += var_9 )
    {
        var_6 = 0.0;
        var_7 = 0.35 * clamp( 1.0 - var_6 / 3000.0, 0.01, 1.0 ) * var_1 / var_5;
        var_8 = randomfloat( 1.0 ) * 8.0 + 1.0;
        earthquake( var_7, var_8 * 0.5, level.player.origin, 3000 );
        var_1 = clamp( var_1 + var_8 / 20, 0.01, var_5 );
        var_9 = var_8 / 20.0;
        wait(var_9);
    }
}

_id_6F02()
{
    self waittillmatch( "single anim", "heater_impact_1" );
    var_0 = level._id_6F03 gettagorigin( "tag_origin" );
    playfx( common_scripts\utility::getfx( "intro_slide_heaterhit_dirt" ), var_0 - ( 0.0, 0.0, 30.0 ), ( 0.0, 0.0, 1.0 ), ( -1.0, 0.0, 0.0 ) );
    self waittillmatch( "single anim", "heater_impact_2" );
    var_0 = level._id_6F03 gettagorigin( "tag_origin" );
    playfx( common_scripts\utility::getfx( "intro_slide_heaterhit_dirt" ), var_0 - ( 0.0, 0.0, 30.0 ), ( 0.0, 0.0, 1.0 ), ( -1.0, 0.0, 0.0 ) );
}

_id_6F04()
{
    self waittillmatch( "single anim", "chunk_impact" );
    common_scripts\utility::exploder( 17 );
    wait 2.0;
    common_scripts\utility::exploder( 18 );
    wait 1;
    common_scripts\utility::exploder( 19 );
}

_id_6F05()
{
    var_0 = getentarray( "small_building_toss", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = 750 * vectornormalize( var_2.origin - ( -10230.0, 2276.0, -2000.0 ) );
        var_2 movegravity( var_3, 1.0 );
        var_2 rotatevelocity( ( randomfloat( 360 ), randomfloat( 360 ), randomfloat( 360 ) ), 2.0 );
    }
}

_id_6F06()
{
    self waittillmatch( "single anim", "chunk_trail_start" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_chunkTrail2" ), self, "jo_go_52" );
    self waittillmatch( "single anim", "chunk_impact" );
    wait 0.1;
    var_0 = self gettagorigin( "jo_go_52" );
    playfx( common_scripts\utility::getfx( "intro_slide_chunkhit_dirt" ), var_0, ( 0.0, 0.0, 1.0 ), ( -1.0, 1.0, 0.0 ) );
    wait 1;
    stopfxontag( common_scripts\utility::getfx( "intro_slide_chunkTrail2" ), self, "jo_go_52" );
    thread _id_6F05();
}

_id_6F07()
{
    wait 10.47;
    var_0 = self gettagorigin( "tag_fx_80" );
    playfx( common_scripts\utility::getfx( "intro_slide_chunkhit_dirt2" ), var_0 - ( 0.0, 0.0, 30.0 ), ( 0.0, 0.0, 1.0 ), ( -1.0, 1.0, 0.0 ) );
    wait 0.46;
    var_0 = self gettagorigin( "tag_fx_99" );
    playfx( common_scripts\utility::getfx( "intro_slide_chunkhit_dirt" ), var_0 - ( 0.0, 0.0, 30.0 ), ( 0.0, 0.0, 1.0 ), ( -1.0, 1.0, 0.0 ) );
}

_id_6F08( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg1" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg2" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg3" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm1" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm2" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm3" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg" );
    level common_scripts\utility::waitframe();
    self waittillmatch( "single anim", "small_building_impact" );
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm" );
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm1" );
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm2" );
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowsm" ), self, "tag_fx_windowsm3" );
    self waittillmatch( "single anim", "window_break_lrg1" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg_exp" ), self, "tag_fx_windowlg" );
    level common_scripts\utility::waitframe();
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg" );
    wait 0.4;
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg_exp" ), self, "tag_fx_windowlg2" );
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg2" );
    wait 0.35;
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg_exp" ), self, "tag_fx_windowlg1" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg_exp" ), self, "tag_fx_windowlg3" );
    level common_scripts\utility::waitframe();
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg1" );
    stopfxontag( common_scripts\utility::getfx( "intro_slide_housewindowlrg" ), self, "tag_fx_windowlg3" );
}

_id_6F09()
{
    wait 9.3;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_23" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_73" );
    common_scripts\utility::exploder( 30 );
    wait 1;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_42" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_23" );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_33" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_66" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust_smallhouse" ), self, "jo_go_86" );
}

_id_6F0A()
{
    self waittillmatch( "single anim", "small_building_impact" );
    common_scripts\utility::exploder( 15 );
    common_scripts\utility::exploder( 31 );
    playfxontag( common_scripts\utility::getfx( "intro_slide_housefall" ), self, "jo_go_10" );
    wait 1.5;
    common_scripts\utility::exploder( 16 );
}

_id_6F0B( var_0, var_1 )
{
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "tag_origin" );
    var_2.angles = var_0 gettagangles( "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_103" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_104" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_101" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_97" );
    wait 0.07;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_86" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_95" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_90" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_85" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_91" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_84" );
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_84" );
    wait 0.2;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_89" );
    wait 2.4;
    playfxontag( common_scripts\utility::getfx( "intro_slide_tumblerocks" ), var_2, "tag_origin" );
    wait 1.86;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_104" );
    wait 0.56;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_86" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "intro_slide_crackdust" ), var_0, "tag_fx_116" );
    wait 10;
    var_2 delete();
}

_id_6F0C()
{
    var_0 = self gettagorigin( "tag_fx_83" );
    var_0 += ( 0.0, 0.0, -100.0 );
    physicsexplosionsphere( var_0, 1000, 100, 3.0 );
}

_id_6F0D( var_0, var_1 )
{
    var_2 = var_1 / 30.0;
    wait(var_2);
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_5 = vectornormalize( anglestoforward( var_0.angles ) );
    var_6 = vectornormalize( anglestoright( var_0.angles ) );
    var_3.origin = var_0 gettagorigin( "tag_origin" ) + var_6 * 150 + var_5 * 50;
    var_4.origin = var_0 gettagorigin( "tag_origin" ) + var_6 * -150 + var_5 * 50;
    playfxontag( common_scripts\utility::getfx( "intro_slide_uavshadow" ), var_3, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "intro_slide_uavshadow" ), var_4, "tag_origin" );

    for ( var_7 = 0; var_7 < 50; var_7++ )
    {
        var_5 = vectornormalize( anglestoforward( var_0.angles ) );
        var_6 = vectornormalize( anglestoright( var_0.angles ) );
        var_3.origin = var_0 gettagorigin( "tag_origin" ) + var_6 * 150 + var_5 * 50;
        var_4.origin = var_0 gettagorigin( "tag_origin" ) + var_6 * -150 + var_5 * 50;
        level common_scripts\utility::waitframe();
    }

    stopfxontag( common_scripts\utility::getfx( "intro_slide_uavshadow" ), var_3, "tag_origin" );
    var_3 delete();
    stopfxontag( common_scripts\utility::getfx( "intro_slide_uavshadow" ), var_4, "tag_origin" );
    var_4 delete();
}

_id_6F0E( var_0, var_1, var_2 )
{
    var_3 = var_2 / 30.0;
    wait(var_3);
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_0 gettagorigin( var_1 );
    playfxontag( common_scripts\utility::getfx( "intro_slide_chunkshadow" ), var_4, "tag_origin" );

    for ( var_5 = 0; var_5 < 50; var_5++ )
    {
        var_4.origin = var_0 gettagorigin( var_1 );
        level common_scripts\utility::waitframe();
    }

    stopfxontag( common_scripts\utility::getfx( "intro_slide_chunkshadow" ), var_4, "tag_origin" );
    var_4 delete();
}

_id_6F0F( var_0, var_1 )
{
    var_2 = [ var_0, self, self, var_0, self, var_1 ];
    var_3 = [ "tag_replaceProp_15", "tag_fx_88", "tag_fx_129", "tag_replaceProp_5", "tag_fx_119", "tag_fx_160" ];
    var_4 = [ 60, 60, 60, 60, 41, 35 ];

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        thread _id_6F0E( var_2[var_5], var_3[var_5], var_4[var_5] );
}

_id_6F10()
{
    wait 0.23;
    var_0 = ( -11263.0, 393.0, 0.0 );
    var_1 = ( -8452.0, 2075.0, -784.0 );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0;
    playfxontag( common_scripts\utility::getfx( "intro_slide_missile_fakeTrail" ), var_2, "tag_origin" );
    var_2 moveto( var_1, 0.17 );
}

_id_6F11( var_0 )
{
    var_1 = [ "bc_military_tire05_big_fx_01", "bc_military_tire05_big_fx_02", "bc_military_tire05_big_fx_03", "machinery_cable_spool3_fx_01", "com_barrel_blue_rust_fx_01", "com_barrel_blue_rust_fx_02", "com_wagon_donkey_nohandle_fx_01", "com_pallet_destroyed_fx_01", "com_pallet_destroyed_fx_02", "ch_dinerboothchair_fx_01", "com_wheelbarrow_fx_01", "com_junktire_fx_01", "com_junktire_fx_02", "junk_wheel_02_fx_01", "junk_wheel_02_fx_02", "intro_construction_pallet_bag_01_fx_01", "intro_construction_pallet_bag_01_fx_03", "intro_construction_pallet_bag_01_fx_04", "pb_lawnchair_red_fx_01", "pb_lawnchair_red_fx_02", "pb_lawnchair_red_fx_03", "com_restaurantchair_2_fx_01" ];
    var_2 = [ "tag_fx_114", "tag_fx_86", "tag_fx_143", "tag_fx_125", "tag_fx_96", "tag_fx_127", "tag_fx_97", "jo_handkey_roofChunk_14", "tag_fx_118", "tag_fx_60", "tag_fx_9", "tag_fx_98", "tag_fx_101", "tag_fx_85", "tag_fx_124", "tag_fx_180", "tag_fx_182", "tag_fx_179", "tag_fx_181", "tag_fx_137" ];
    var_3 = [ "tag_replaceProp_", "tag_replaceProp_1", "tag_replaceProp_2", "tag_replaceProp_3", "tag_replaceProp_4", "tag_replaceProp_5", "tag_replaceProp_6", "tag_replaceProp_7", "tag_replaceProp_8", "tag_replaceProp_9", "tag_replaceProp_10", "tag_replaceProp_12", "tag_replaceProp_13", "tag_replaceProp_14", "tag_replaceProp_15", "tag_replaceProp_16", "tag_replaceProp_18", "tag_replaceProp_19", "tag_replaceProp_20", "tag_replaceProp_21", "tag_replaceProp_22", "tag_replaceProp_23" ];
    var_4 = [ 160, 65, 65, 70, 80, 60, 60, 90, 160, 170, 200, 6, 80, 90, 60, 65, 10, 70, 110, 160, 100, 70 ];

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        thread _id_6F12( var_1[var_5], var_3[var_5], var_4[var_5], var_0 );

    wait 7.23333;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_6 = getent( var_1[var_5], "targetname" );

        if ( isdefined( var_6 ) )
            var_6 hide();
    }

    wait 4.66667;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_6 = getent( var_1[var_5], "targetname" );

        if ( isdefined( var_6 ) && ( var_5 == 0 || var_5 == 1 || var_5 == 7 || var_5 == 13 || var_5 == 16 ) )
            var_6 show();
    }
}

_id_6F12( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) && isdefined( var_1 ) )
    {
        var_4 = getent( var_0, "targetname" );

        if ( isdefined( var_4 ) )
        {
            var_4 hide();
            var_4.origin = var_3 gettagorigin( var_1 );
            var_4 linkto( var_3, var_1 );
            wait(var_2 / 30.0);
            var_3 hidepart( var_1 );
            var_4 show();
        }
    }
}

_id_6F13( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        var_3 hide();

    var_5 = getentarray( "intro_construction_support_poles01_hide", "targetname" );
    var_6 = getentarray( "intro_construction_ceiling_brace01_hide", "targetname" );
    var_7 = getentarray( "intro_railing_hide", "targetname" );
    var_8 = getentarray( "intro_landslide_2x4_hide", "targetname" );
    var_9 = getentarray( "intro_window_frame_wide_construction_01_hide", "targetname" );
    var_10 = getentarray( "intro_window_frame_wide_construction_02_hide", "targetname" );
    var_11 = getentarray( "intro_construction_scaffold_top_hide", "targetname" );
    var_12 = getentarray( "intro_construction_rebar_row_01_hide", "targetname" );
    var_13 = getentarray( "intro_plywood_hide", "targetname" );
    var_14 = getentarray( "intro_misc_hide", "targetname" );

    foreach ( var_16 in var_5 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_6 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_7 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_8 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_10 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_9 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_11 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_12 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_13 )
        var_16 maps\_utility::_id_2807();

    foreach ( var_16 in var_14 )
        var_16 maps\_utility::_id_2807();

    common_scripts\utility::exploder( 10 );

    if ( !level.ps3 )
        common_scripts\utility::exploder( 20 );

    var_36 = getent( "intro_landslide_building_shards", "targetname" );
    var_37 = getent( "intro_landslide_building_shards2", "targetname" );
    var_38 = getent( "intro_landslide_building_subfloor", "targetname" );
    var_39 = getent( "intro_landslide_building_handkey", "targetname" );
    var_40 = getent( "intro_landslide_small_01", "targetname" );
    var_41 = getent( "intro_landslide_small_02", "targetname" );
    var_42 = getent( "intro_landslide_building_replaceshards", "targetname" );
    var_43 = common_scripts\utility::getstruct( "slide_roof_collapse", "targetname" );
    var_36 show();
    var_37 show();
    var_38 show();
    var_39 show();
    var_36._id_1032 = "landslide_building_roof";
    var_36 maps\_anim::_id_1244();
    var_37._id_1032 = "landslide_building_roof2";
    var_37 maps\_anim::_id_1244();
    var_38._id_1032 = "landslide_building_subfloor";
    var_38 maps\_anim::_id_1244();
    var_39._id_1032 = "landslide_building_handkey";
    var_39 maps\_anim::_id_1244();
    var_40._id_1032 = "landslide_building_small_01";
    var_40 maps\_anim::_id_1244();
    var_41._id_1032 = "landslide_building_small_02";
    var_41 maps\_anim::_id_1244();
    var_42._id_1032 = "intro_landslide_building_replaceshards";
    var_42 maps\_anim::_id_1244();
    var_44 = [ var_36 ];
    var_43 thread maps\_anim::_id_11DD( var_44, "intro_rooftop_collapse_sim_roof" );
    var_36 common_scripts\utility::delaycall( 8, ::hide );
    var_36 common_scripts\utility::delaycall( 12.4, ::show );
    var_45 = [ var_37 ];
    var_43 thread maps\_anim::_id_11DD( var_45, "intro_rooftop_collapse_sim_roof2" );
    var_46 = [ var_38 ];
    var_43 thread maps\_anim::_id_11DD( var_46, "intro_rooftop_collapse_sim_subfloor" );
    var_47 = [ var_39 ];
    var_43 thread maps\_anim::_id_11DD( var_47, "intro_rooftop_collapse_handkey" );
    var_48 = [ var_42 ];
    var_43 thread maps\_anim::_id_11DD( var_48, "intro_rooftop_collapse_replaceshards" );
    var_40 = getentarray( "intro_landslide_small_01", "targetname" )[0];
    var_41 = getentarray( "intro_landslide_small_02", "targetname" )[0];
    var_40 show();
    var_41 show();
    var_49 = getentarray( "slide_small_building_hide", "targetname" );

    foreach ( var_51 in var_49 )
        var_51 hide();

    var_48 = [ var_40, var_41 ];
    var_43 thread maps\_anim::_id_11DD( var_48, "intro_landslide_small" );
    thread _id_6F0B( var_36, var_37 );
    var_36 thread _id_6F0C();
    thread _id_6EFD();
    thread _id_6F11( var_42 );
    var_36 thread _id_6F0F( var_42, var_37 );
    var_36 thread _id_6F07();
    var_40 thread _id_6F0A();
    var_41 thread _id_6F08( var_40 );
    var_41 thread _id_6F02();
    var_41 thread _id_6F06();
    var_41 thread _id_6F04();
    var_41 thread _id_6F09();
    thread _id_6EF5( var_36, var_37, var_38, var_42 );
    thread _id_6EF4( var_36, var_37, var_38, var_42 );
    thread _id_6EF3( var_36, var_37, var_38 );
    thread _id_6EF6( var_40 );
    thread _id_6EF2();
    thread _id_6EEA();
    wait 0.5;
    wait 1.7;
    common_scripts\utility::exploder( 12 );
    common_scripts\utility::exploder( 13 );
    common_scripts\utility::exploder( 11 );
    wait 3;

    if ( level.console && level.ps3 )
    {
        sethalfresparticles( 1 );
        setsaveddvar( "r_triangleCull", 0 );
    }

    var_53 = common_scripts\utility::spawn_tag_origin();
    var_53.origin = level._id_51F2 gettagorigin( "tag_origin" );
    var_53.angles = ( 0.0, 90.0, 0.0 ) + vectortoangles( vectornormalize( ( -139.0, 0.0, 2911.0 ) ) );
    var_53 thread _id_6EFE( level._id_51F2, "tag_origin" );
    common_scripts\utility::exploder( 19 );
    wait 1.0;
    maps\_shg_fx::_id_4467( 13 );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "intro_slide_avalanche" ), var_53, "tag_origin" );
    wait 1;
    setblur( 0, 0.2 );
    wait 0.7;
    setblur( 1, 0.325 );
    wait 0.1;
    setblur( 0, 0.2 );
    wait 1.7;
    stopfxontag( common_scripts\utility::getfx( "intro_slide_avalanche" ), var_53, "tag_origin" );
    wait 1.0;

    if ( level.console && level.ps3 )
    {
        sethalfresparticles( 0 );
        setsaveddvar( "r_triangleCull", 1 );
    }

    wait 3.0;

    if ( isalive( level.player ) )
        common_scripts\utility::exploder( 14 );

    wait 3;
    setblur( 0, 0.2 );
}

_id_6F14( var_0 )
{
    thread maps\_utility::vision_set_fog_changes( "intro_slide_water", 0 );
    playfxontag( common_scripts\utility::getfx( "splash_underwater" ), level._id_51F2, "tag_camera" );
    level.player setwatersheeting( 1, 4 );
    level endon( "msg_fx_player_surfaced" );
    playfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    playfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_RI" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "underwater_player_bubbles" ), level._id_51F2, "tag_camera" );
        wait 0.075;
    }
}

_id_6F15( var_0 )
{
    wait 0.2;
    setsaveddvar( "r_specularcolorscale", 2.5 );
    playfxontag( common_scripts\utility::getfx( "underwater_submerge_whiteout" ), level._id_51F2, "tag_camera" );
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_R" ), level._id_51F2, "J_Wrist_RI" );
    thread maps\_utility::vision_set_fog_changes( "intro_slide_water", 0 );
    level.player setwatersheeting( 1, 4 );
    level endon( "msg_fx_player_surfaced" );
    level notify( "msg_fx_player_submerged" );
    common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    playfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_RI" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "underwater_player_bubbles" ), level._id_51F2, "tag_camera" );
        wait 0.075;
    }
}

_id_6F16( var_0 )
{
    thread maps\_utility::vision_set_fog_changes( "intro_slide_water_above", 0 );
    setsaveddvar( "r_specularcolorscale", 4 );
    level notify( "msg_fx_player_surfaced" );
    level.player setwatersheeting( 1, 5 );
    level endon( "msg_fx_player_submerged" );
    stopfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    stopfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_RI" );
    playfxontag( common_scripts\utility::getfx( "splash_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_R" ), level._id_51F2, "J_Wrist_RI" );
    level.player thread _id_6F19( "water_surface_wake" );
}

_id_6F17( var_0 )
{
    thread maps\_utility::vision_set_fog_changes( "intro_slide_water_above", 0 );
    setsaveddvar( "sm_spotlimit", 0 );
    setsaveddvar( "sm_sunsamplesizenear", 0.05 );
    setsaveddvar( "sm_sunshadowscale", 1 );
    setsaveddvar( "r_specularcolorscale", 2.5 );
    level notify( "msg_fx_player_surfaced" );
    level.player setwatersheeting( 1, 6 );
    level endon( "msg_fx_player_submerged" );
    stopfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    stopfxontag( common_scripts\utility::getfx( "bubbles_player_hand" ), level._id_51F2, "J_Wrist_RI" );
    playfxontag( common_scripts\utility::getfx( "splash_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_R" ), level._id_51F2, "J_Wrist_RI" );
    wait 1.0;
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand" ), level._id_51F2, "J_Wrist_LE" );
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_R" ), level._id_51F2, "J_Wrist_RI" );
}

_id_6F18( var_0 )
{
    level notify( "msg_fx_player_surfaced" );
}

_id_6F19( var_0 )
{
    level endon( "msg_fx_player_submerged" );
    var_1 = 200;
    var_2 = common_scripts\utility::spawn_tag_origin();

    for (;;)
    {
        var_3 = level._id_51F2 gettagorigin( "tag_camera" );
        var_4 = ( var_3[0], var_3[1], -3688 );

        if ( var_0 != "" )
        {
            var_5 = common_scripts\utility::getfx( var_0 );
            var_2.origin = var_4;
            var_2.angles = ( 270, self.angles[1], 0 );
            playfxontag( var_5, var_2, "tag_origin" );
        }

        common_scripts\utility::waitframe();
    }
}

_id_6F1A( var_0 )
{
    level notify( "msg_fx_player_submerged" );
}

_id_6F1B( var_0 )
{
    common_scripts\utility::exploder( 9090 );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = level._id_51F2 gettagorigin( "J_Wrist_LE" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( level._id_51F2, "J_Wrist_LE" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = level._id_51F2 gettagorigin( "J_Wrist_RI" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_2 linkto( level._id_51F2, "J_Wrist_RI" );
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_r_strong" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_l_strong" ), var_2, "tag_origin" );
    wait 1.5;
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_r_strong" ), var_1, "tag_origin" );
    wait 0.2;
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_l_strong" ), var_2, "tag_origin" );
    wait 1.1;
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_r_light" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_r_light" ), var_2, "tag_origin" );
    level common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_right_hand" ), var_2, "tag_origin" );
    wait 1.7;
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_r_light" ), var_1, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_r_light" ), var_2, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_right_hand" ), var_2, "tag_origin" );
    wait 2.5;
    playfxontag( common_scripts\utility::getfx( "splash_player_hand_left_hand" ), var_1, "tag_origin" );
    wait 0.55;
    stopfxontag( common_scripts\utility::getfx( "splash_player_hand_left_hand" ), var_1, "tag_origin" );
}

precachefx()
{
    level._effect["intro_ceilingdust_shack_small"] = loadfx( "maps/intro/intro_ceilingdust_shack_small" );
    level._effect["intro_slide_cracktop"] = loadfx( "maps/intro/intro_slide_cracktop" );
    level._effect["intro_slide_crackside"] = loadfx( "maps/intro/intro_slide_crackside" );
    level._effect["intro_sliderun_windowexp1"] = loadfx( "maps/intro/intro_sliderun_windowexp1" );
    level._effect["intro_sliderun_windowexp"] = loadfx( "maps/intro/intro_sliderun_windowexp" );
    level._effect["intro_ceilingdust_shack"] = loadfx( "maps/intro/intro_ceilingdust_shack" );
    level._effect["intro_slide_uavshadow"] = loadfx( "maps/intro/intro_slide_uavshadow" );
    level._effect["intro_slide_missilehit_dist"] = loadfx( "maps/intro/intro_slide_missilehit_dist" );
    level._effect["intro_slide_chunkshadow"] = loadfx( "maps/intro/intro_slide_chunkshadow" );
    level._effect["intro_slide_missile_fakeTrail"] = loadfx( "maps/intro/intro_slide_missile_fakeTrail" );
    level._effect["intro_slide_crackdust_smallhouse"] = loadfx( "maps/intro/intro_slide_crackdust_smallhouse" );
    level._effect["intro_slide_housefall_exp2"] = loadfx( "maps/intro/intro_slide_housefall_exp2" );
    level._effect["intro_ugv_death"] = loadfx( "maps/intro/intro_ugv_death" );
    level._effect["intro_ugv_state2"] = loadfx( "maps/intro/intro_ugv_state2" );
    level._effect["intro_ugv_state1"] = loadfx( "maps/intro/intro_ugv_state1" );
    level._effect["intro_ugv_state2smoke"] = loadfx( "maps/intro/intro_ugv_state2smoke" );
    level._effect["intro_slide_chunkhit_dirt2"] = loadfx( "maps/intro/intro_slide_chunkhit_dirt2" );
    level._effect["intro_slide_missilehit_fallingdebris_side"] = loadfx( "maps/intro/intro_slide_missilehit_fallingdebris_side" );
    level._effect["electrical_transformer_explosion"] = loadfx( "explosions/electrical_transformer_explosion" );
    level._effect["propane_valvefire_looper"] = loadfx( "fire/propane_valvefire_looper" );
    level._effect["intro_slide_tumblerocks"] = loadfx( "maps/intro/intro_slide_tumblerocks" );
    level._effect["intro_slide_crackdust"] = loadfx( "maps/intro/intro_slide_crackdust" );
    level._effect["intro_slide_househitbillowdust"] = loadfx( "maps/intro/intro_slide_househitbillowdust" );
    level._effect["intro_slide_househit2"] = loadfx( "maps/intro/intro_slide_househit2" );
    level._effect["intro_slide_heaterhit_dirt"] = loadfx( "maps/intro/intro_slide_heaterhit_dirt" );
    level._effect["intro_slide_chunkTrail2"] = loadfx( "maps/intro/intro_slide_chunkTrail2" );
    level._effect["intro_slide_housewindowlrg_exp"] = loadfx( "maps/intro/intro_slide_housewindowlrg_exp" );
    level._effect["intro_slide_housewindowsm"] = loadfx( "maps/intro/intro_slide_housewindowsm" );
    level._effect["intro_slide_housewindowlrg"] = loadfx( "maps/intro/intro_slide_housewindowlrg" );
    level._effect["intro_slide_househit"] = loadfx( "maps/intro/intro_slide_househit" );
    level._effect["intro_slide_housefall"] = loadfx( "maps/intro/intro_slide_housefall" );
    level._effect["intro_slide_chunkTrail"] = loadfx( "maps/intro/intro_slide_chunkTrail" );
    level._effect["intro_slide_chunkhit_dirt"] = loadfx( "maps/intro/intro_slide_chunkhit_dirt" );
    level._effect["intro_slide_missilehit_fallingdebris2"] = loadfx( "maps/intro/intro_slide_missilehit_fallingdebris2" );
    level._effect["intro_slide_avalanche"] = loadfx( "maps/intro/intro_slide_avalanche" );
    level._effect["intro_slide_collapsedust"] = loadfx( "maps/intro/intro_slide_collapsedust" );
    level._effect["intro_slide_missilehit_exp"] = loadfx( "maps/intro/intro_slide_missilehit_exp" );
    level._effect["intro_slide_missilehit_fallingdebris"] = loadfx( "maps/intro/intro_slide_missilehit_fallingdebris" );
    level._effect["heli_dust_intro_looping"] = loadfx( "treadfx/heli_dust_intro_looping" );
    level._effect["lights_uplight_haze_lantern"] = loadfx( "lights/lights_uplight_haze_lantern" );
    level._effect["lights_uplight_haze"] = loadfx( "lights/lights_uplight_haze" );
    level._effect["lights_conelight_smokey"] = loadfx( "lights/lights_conelight_smokey" );
    level._effect["lights_conelight_smokey_opaque"] = loadfx( "lights/lights_conelight_smokey_opaque" );
    level._effect["godray_intro_window"] = loadfx( "misc/godray_intro_window" );
    level._effect["godray_intro_window_opaque"] = loadfx( "misc/godray_intro_window_opaque" );
    level._effect["blood_drip_table_soap"] = loadfx( "misc/blood_drip_table_soap" );
    level._effect["blood_chest_wound"] = loadfx( "misc/blood_chest_wound" );
    level._effect["blood_cough"] = loadfx( "maps/intro/intro_soap_blood_cough" );
    level._effect["light_gurney_bloom_out"] = loadfx( "maps/intro/light_gurney_bloom_out" );
    level._effect["light_gurney_bloom"] = loadfx( "maps/intro/light_gurney_bloom" );
    level._effect["intro_helicopter_blade_shadow"] = loadfx( "maps/intro/intro_helicopter_blade_shadow" );
    level._effect["smoke_large"] = loadfx( "smoke/smoke_large_cheap" );
    level._effect["slamraam_explosion"] = loadfx( "explosions/aa_explosion_super" );
    level._effect["intro_helicrash_wall"] = loadfx( "maps/intro/intro_helicrash_wall" );
    level._effect["intro_helicrash_impact_sparks"] = loadfx( "maps/intro/intro_helicrash_impact_sparks" );
    level._effect["intro_heli_approach_room_dust"] = loadfx( "maps/intro/intro_heli_approach_room_dust" );
    level._effect["embers_spurt"] = loadfx( "fire/embers_spurt" );
    level._effect["heli_crashed_tail_smoke"] = loadfx( "smoke/heli_crashed_tail_smoke" );
    level._effect["oil_drip_small"] = loadfx( "misc/oil_drip_small" );
    level._effect["falling_dirt_light_2_runner"] = loadfx( "dust/falling_dirt_light_2_runner" );
    level._effect["fire_mi_28"] = loadfx( "maps/intro/fire_mi_28" );
    level._effect["intro_helicrash_godray_smokey"] = loadfx( "maps/intro/intro_helicrash_godray_smokey" );
    level._effect["godray_intro_window_opaque_shortlife"] = loadfx( "maps/intro/godray_intro_window_opaque_shortlife" );
    level._effect["glow_white"] = loadfx( "misc/light_glow_white_intro" );
    level._effect["point_white"] = loadfx( "lights/lights_point_white_intro" );
    level._effect["point_white_bg"] = loadfx( "lights/lights_point_white_intro_bg" );
    level._effect["spot_white"] = loadfx( "lights/lights_spot_white" );
    level._effect["breach_door"] = loadfx( "explosions/breach_door5" );
    level._effect["breach_room"] = loadfx( "explosions/breach_room" );
    level._effect["breach_room_residual"] = loadfx( "explosions/breach_room_residual" );
    level._effect["c4_explosion"] = loadfx( "explosions/grenadeExp_metal" );
    level._effect["large_ac130_concrete_1"] = loadfx( "impacts/large_ac130_concrete_1" );
    level._effect["pistolflash"] = loadfx( "muzzleflashes/pistolflash_wv_b" );
    level._effect["headshot"] = loadfx( "maps/intro/headshot_closerange" );
    level._effect["blood_smear"] = loadfx( "impacts/blood_smear_decal_heavy_rotated" );
    level._effect["breach_door_intro"] = loadfx( "explosions/breach_door_intro" );
    level._effect["intro_lattice_exp"] = loadfx( "props/intro_lattice_exp" );
    level._effect["door_wood_breach_intro"] = loadfx( "impacts/door_wood_breach_intro" );
    level._effect["door_gate_breach_intro_line"] = loadfx( "dust/door_gate_breach_intro_line" );
    level._effect["door_gate_breach_intro_line_short"] = loadfx( "dust/door_gate_breach_intro_line_short" );
    level._effect["door_gate_breach_intro_out"] = loadfx( "dust/door_gate_breach_intro_out" );
    level._effect["door_gate_breach_intro_line_out"] = loadfx( "dust/door_gate_breach_intro_line_out" );
    level._effect["lights_godray_beam_intro_small"] = loadfx( "lights/lights_godray_beam_intro_small" );
    level._effect["door_gate_breach_intro"] = loadfx( "dust/door_gate_breach_intro" );
    level._effect["vehicle_explosion"] = loadfx( "explosions/small_vehicle_explosion" );
    level._effect["ceiling_smoke_undulating"] = loadfx( "smoke/ceiling_smoke_undulating" );
    level._effect["ceiling_smoke_generic"] = loadfx( "smoke/ceiling_smoke_generic" );
    level._effect["embers_smokecolumn"] = loadfx( "fire/embers_smokecolumn" );
    level._effect["fire_flash_small"] = loadfx( "fire/fire_flash_small" );
    level._effect["fire_falling_localized_runner_paris"] = loadfx( "fire/fire_falling_localized_runner_paris" );
    level._effect["fire_line_sm_cheap"] = loadfx( "fire/fire_line_sm_cheap" );
    level._effect["fire_line_sm"] = loadfx( "fire/fire_line_sm" );
    level._effect["firelp_med_pm"] = loadfx( "fire/firelp_med_pm_cheap" );
    level._effect["firelp_med_pm_noglow"] = loadfx( "fire/firelp_med_pm_noglow" );
    level._effect["firelp_med_pm_nolight"] = loadfx( "fire/firelp_med_pm_cheap_nolight" );
    level._effect["firelp_small"] = loadfx( "fire/firelp_small" );
    level._effect["firelp_small_pm_nolight"] = loadfx( "fire/firelp_small_pm_cheap_nolight" );
    level._effect["firelp_tiny"] = loadfx( "fire/firelp_small_pm_a" );
    level._effect["fire_ceiling_md_slow"] = loadfx( "fire/fire_ceiling_md_slow" );
    level._effect["fireball_lp_smk_L_quickfalloff"] = loadfx( "fire/fireball_lp_smk_L_quickfalloff" );
    level._effect["embers_paris_alley_intro"] = loadfx( "fire/embers_paris_alley_intro" );
    level._effect["cloud_ash_intro"] = loadfx( "weather/cloud_ash_intro" );
    level._effect["thick_building_smoke_white_intro"] = loadfx( "fire/thick_building_smoke_white_intro" );
    level._effect["amb_dust_veryLight_intro"] = loadfx( "dust/amb_dust_veryLight_intro" );
    level._effect["dust_wind_canyon_intro"] = loadfx( "dust/dust_wind_canyon_intro" );
    level._effect["fire_generic_atlas"] = loadfx( "fire/fire_generic_atlas" );
    level._effect["fire_generic_atlas_small"] = loadfx( "fire/fire_generic_atlas_small" );
    level._effect["fire_generic_atlas_small_nosmoke"] = loadfx( "fire/fire_generic_atlas_small_nosmoke" );
    level._effect["birds_takeof_runner"] = loadfx( "misc/birds_takeof_runner" );
    level._effect["insects_carcass_flies_dark"] = loadfx( "misc/insects_carcass_flies_dark" );
    level._effect["insects_light_flies_b_complex"] = loadfx( "misc/insects_light_flies_b_complex" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["trash_spirallo_runner"] = loadfx( "misc/trash_spirallo_runner" );
    level._effect["clouds_cumulus_far"] = loadfx( "misc/clouds_cumulus_far" );
    level._effect["leaves_fall_gentlewind_paris"] = loadfx( "misc/leaves_fall_gentlewind_intro" );
    level._effect["leaves_fall_gentlewind_intro"] = loadfx( "misc/leaves_fall_gentlewind_intro" );
    level._effect["leaves_ground_gentlewind_dust"] = loadfx( "misc/leaves_ground_gentlewind_dust" );
    level._effect["waterfall_drainage_splash"] = loadfx( "water/waterfall_drainage_splash" );
    level._effect["paper_blowing_trash_fast"] = loadfx( "misc/paper_blowing_trash_fast" );
    level._effect["paper_falling_burning"] = loadfx( "misc/paper_falling_burning" );
    level._effect["paper_falling_burning2"] = loadfx( "misc/paper_falling_burning2" );
    level._effect["leaves_runner_pine"] = loadfx( "misc/leaves_runner_pine" );
    level._effect["spark_fountain"] = loadfx( "misc/spark_fountain" );
    level._effect["car_headlight_truck_L"] = loadfx( "misc/car_headlight_truck_L" );
    level._effect["dust_ground_gust_runner"] = loadfx( "dust/dust_ground_gust_runner" );
    level._effect["insects_light_hunted"] = loadfx( "misc/insects_light_hunted" );
    level._effect["electrical_transformer_spark_runner_loop"] = loadfx( "explosions/electrical_transformer_spark_runner_loop" );
    level._effect["fireball_lp_smk_L_quickfalloff_intro"] = loadfx( "fire/fireball_lp_smk_L_quickfalloff_intro" );
    level._effect["trash_spiral_runner_intro"] = loadfx( "misc/trash_spiral_runner_intro" );
    level._effect["paper_blowing_burnt_intro_runner"] = loadfx( "misc/paper_blowing_burnt_intro_runner" );
    level._effect["dust_ground_gust_runner_intro"] = loadfx( "dust/dust_ground_gust_runner_intro" );
    level._effect["sewer_stream_village_muted"] = loadfx( "distortion/sewer_stream_village_muted" );
    level._effect["sewer_stream_village_muted_cull"] = loadfx( "distortion/sewer_stream_village_muted_cull" );
    level._effect["battlefield_smokebank_Large"] = loadfx( "smoke/battlefield_smokebank_Large" );
    level._effect["cloud_bank_gulag_z_feather"] = loadfx( "weather/cloud_bank_gulag_z_feather" );
    level._effect["birds_village_runner"] = loadfx( "misc/birds_village_runner" );
    level._effect["bird_seagull_flock_intro"] = loadfx( "misc/bird_seagull_flock_intro" );
    level._effect["birds_village_runner_intro"] = loadfx( "misc/birds_village_runner_intro" );
    level._effect["paper_blowing_burnt_loop_intro"] = loadfx( "misc/paper_blowing_burnt_loop_intro" );
    level._effect["battlefield_smokebank_large_intro"] = loadfx( "smoke/battlefield_smokebank_large_intro" );
    level._effect["sunflare_intro"] = loadfx( "lights/sunflare_intro" );
    level._effect["amb_dust_veryLight_intro_hills"] = loadfx( "dust/amb_dust_veryLight_intro_hills" );
    level._effect["amb_dust_veryLight_intro_hills_massive"] = loadfx( "dust/amb_dust_veryLight_intro_hills_massive" );
    level._effect["amb_dust_veryLight_intro_hills_massive_bank"] = loadfx( "dust/amb_dust_veryLight_intro_hills_massive_bank" );
    level._effect["amb_dust_veryLight_intro_hills_massive_blue"] = loadfx( "dust/amb_dust_veryLight_intro_hills_massive_blue" );
    level._effect["shadow_intro"] = loadfx( "misc/shadow_intro" );
    level._effect["amb_dust_veryLight_intro_house"] = loadfx( "dust/amb_dust_veryLight_intro_house" );
    level._effect["amb_dust_veryLight_intro_shack"] = loadfx( "dust/amb_dust_veryLight_intro_shack" );
    level._effect["fire_generic_ball_burst"] = loadfx( "fire/fire_generic_ball_burst" );
    level._effect["fire_generic_atlas_curl"] = loadfx( "fire/fire_generic_atlas_curl" );
    level._effect["fire_generic_atlas_smoke"] = loadfx( "fire/fire_generic_atlas_smoke" );
    level._effect["amb_dust_veryLight_intro_hills_massive_oriented"] = loadfx( "dust/amb_dust_veryLight_intro_hills_massive_oriented" );
    level._effect["amb_dust_verylight_intro_hills_massive_shadow"] = loadfx( "dust/amb_dust_verylight_intro_hills_massive_shadow" );
    level._effect["amb_dust_verylight_intro_hills_massive_orie_small"] = loadfx( "dust/amb_dust_verylight_intro_hills_massive_orie_small" );
    level._effect["fire_generic_ball_burst_large"] = loadfx( "fire/fire_generic_ball_burst_large" );
    level._effect["fire_ceiling_med_slow_intro"] = loadfx( "fire/fire_ceiling_med_slow_intro" );
    level._effect["fire_ceiling_med_slow_intro_cheap"] = loadfx( "fire/fire_ceiling_med_slow_intro_cheap" );
    level._effect["fire_generic_atlas_nosmoke"] = loadfx( "fire/fire_generic_atlas_nosmoke" );
    level._effect["fire_generic_atlas_curl_nosmoke"] = loadfx( "fire/fire_generic_atlas_curl_nosmoke" );
    level._effect["fire_generic_ball_thick"] = loadfx( "fire/fire_generic_ball_thick" );
    level._effect["fire_generic_ball_thick_far"] = loadfx( "fire/fire_generic_ball_thick_far" );
    level._effect["door_gate_breach_intro_ugv"] = loadfx( "dust/door_gate_breach_intro_ugv" );
    level._effect["fire_intro_heliswirl"] = loadfx( "fire/fire_intro_heliswirl" );
    level._effect["smoke_large_hot"] = loadfx( "smoke/smoke_large_hot" );
    level._effect["heli_take_off_swirl_intro"] = loadfx( "dust/heli_take_off_swirl_intro" );
    level._effect["embers_plates"] = loadfx( "fire/embers_plates" );
    level._effect["embers_whitehouse"] = loadfx( "fire/embers_whitehouse" );
    level._effect["fire_line_sm_cheap_intro"] = loadfx( "fire/fire_line_sm_cheap_intro" );
    level._effect["tank_shell_impact"] = loadfx( "explosions/tank_shell_impact_intro" );
    level._effect["fireball_smk_S"] = loadfx( "fire/fireball_lp_smk_S" );
    level._effect["drips_faucet_slow_intro"] = loadfx( "water/drips_faucet_slow_intro" );
    level._effect["smoke_large_intro"] = loadfx( "smoke/smoke_large_intro" );
    level._effect["amb_dust_verylight_intro_windy_mist"] = loadfx( "dust/amb_dust_verylight_intro_windy_mist" );
    level._effect["amb_dust_verylight_intro_windy_mist_fast"] = loadfx( "dust/amb_dust_verylight_intro_windy_mist_fast" );
    level._effect["amb_dust_verylight_intro_hills_mist_patch"] = loadfx( "dust/amb_dust_verylight_intro_hills_mist_patch" );
    level._effect["fire_generic_atlas_small_nocull"] = loadfx( "fire/fire_generic_atlas_small_nocull" );
    level._effect["fire_generic_glow"] = loadfx( "fire/fire_generic_glow" );
    level._effect["fire_generic_atlas_small_decal"] = loadfx( "fire/fire_generic_atlas_small_decal" );
    level._effect["fire_generic_glow_small"] = loadfx( "fire/fire_generic_glow_small" );
    level._effect["fire_generic_atlas_ropeburn"] = loadfx( "fire/fire_generic_atlas_ropeburn" );
    level._effect["fire_generic_curl_line"] = loadfx( "fire/fire_generic_curl_line" );
    level._effect["fire_embers_slowfall"] = loadfx( "fire/fire_embers_slowfall" );
    level._effect["light_glow_yellow"] = loadfx( "misc/light_glow_yellow_bulb" );
    level._effect["decal_skid"] = loadfx( "treadfx/decal_skid" );
    level._effect["pb_jeep_trail_road_skid"] = loadfx( "treadfx/pb_jeep_trail_road_skid" );
    level._effect["decal_skid_long"] = loadfx( "treadfx/decal_skid_long" );
    level._effect["pb_jeep_trail_road_skid_long"] = loadfx( "treadfx/pb_jeep_trail_road_skid_long" );
    level._effect["mortar"]["dirt"] = loadfx( "explosions/mortarExp_default" );
    level._effect["smokescreen"] = loadfx( "smoke/smoke_grenade_low_invasion" );
    level._effect["door_drop_dust_intro"] = loadfx( "dust/door_drop_dust_intro" );
    level._effect["door_crack_open_intro"] = loadfx( "dust/door_crack_open_intro" );
    level._effect["door_crack_open_intro_crate"] = loadfx( "dust/door_crack_open_intro_crate" );
    level._effect["door_crack_open_intro_rolling"] = loadfx( "dust/door_crack_open_intro_rolling" );
    level._effect["door_drop_dust_light_intro"] = loadfx( "dust/door_drop_dust_light_intro" );
    level._effect["door_drop_dust_light_intro_rolling"] = loadfx( "dust/door_drop_dust_light_intro_rolling" );
    level._effect["lights_reveal_intro"] = loadfx( "lights/lights_reveal_intro" );
    level._effect["lights_reveal_intro_persist"] = loadfx( "lights/lights_reveal_intro_persist" );
    level._effect["lights_godray_beam_bright_intro"] = loadfx( "lights/lights_godray_beam_bright_intro" );
    level._effect["door_crack_open_intro_crate_slow"] = loadfx( "dust/door_crack_open_intro_crate_slow" );
    level._effect["lights_reveal_intro_oriented"] = loadfx( "lights/lights_reveal_intro_oriented" );
    level._effect["light_hdr_maars_intro"] = loadfx( "lights/light_hdr_maars_intro" );
    level._effect["light_hdr_maars_intro_hud"] = loadfx( "lights/light_hdr_maars_intro_hud" );
    level._effect["light_hdr_maars_intro_hud_endlines"] = loadfx( "lights/light_hdr_maars_intro_hud_endlines" );
    level._effect["grenade_green_gas_intro"] = loadfx( "smoke/grenade_green_gas_intro" );
    level._effect["flashlight"] = loadfx( "misc/flashlight_spotlight_intro" );
    level._effect["maars_grenade_muzzleflash"] = loadfx( "muzzleflashes/maars_grenade_flash_view" );
    level._effect["tread_dust_small"] = loadfx( "treadfx/tread_dust_default_small" );
    level._effect["tread_water_small"] = loadfx( "treadfx/tread_water_small" );
    level._effect["uav_attack_tree_missile_impact"] = loadfx( "explosions/tree_trunk_explosion" );
    level._effect["lighthaze_distant"] = loadfx( "maps/intro/lighthaze_distant" );
    level._effect["lighthaze_distant_alt"] = loadfx( "maps/intro/lighthaze_distant_alt" );
    level._effect["intro_sliderun_debrisexp2"] = loadfx( "maps/intro/intro_sliderun_debrisexp2" );
    level._effect["intro_sliderun_debrisexp1"] = loadfx( "maps/intro/intro_sliderun_debrisexp1" );
    level._effect["intro_sliderun_wallexp2"] = loadfx( "maps/intro/intro_sliderun_wallexp2" );
    level._effect["intro_sliderun_wallexp1"] = loadfx( "maps/intro/intro_sliderun_wallexp1" );
    level._effect["intro_sliderun_buildingexp"] = loadfx( "maps/intro/intro_sliderun_buildingexp" );
    level._effect["hallway_collapse_smoke_swirl_runner"] = loadfx( "smoke/hallway_collapse_smoke_swirl_runner" );
    level._effect["hallway_collapse_ceiling_smoke"] = loadfx( "smoke/hallway_collapse_ceiling_smoke" );
    level._effect["falling_debris_large"] = loadfx( "misc/falling_debris_large" );
    level._effect["pine_impact_intro"] = loadfx( "misc/pine_impact_intro" );
    level._effect["car_glass_large"] = loadfx( "props/car_glass_large" );
    level._effect["car_glass_med"] = loadfx( "props/car_glass_med" );
    level._effect["car_glass_headlight"] = loadfx( "props/car_glass_headlight" );
    level._effect["car_glass_brakelight"] = loadfx( "props/car_glass_brakelight" );
    level._effect["window_explosion_glassy_less_fiery"] = loadfx( "explosions/window_explosion_glassy_less_fiery" );
    level._effect["debris_window_blowout"] = loadfx( "misc/debris_window_blowout" );
    level._effect["generic_fallingdebris"] = loadfx( "misc/generic_fallingdebris" );
    level._effect["missile_impact_intro"] = loadfx( "explosions/missile_impact_intro" );
    level._effect["dust_boot_scrape_intro"] = loadfx( "dust/dust_boot_scrape_intro" );
    level._effect["door_drop_dust_intro_impact"] = loadfx( "dust/door_drop_dust_intro_impact" );
    level._effect["pine_explosion_intro"] = loadfx( "misc/pine_explosion_intro" );
    level._effect["body_splash_intro"] = loadfx( "water/body_splash_intro" );
    level._effect["intro_slide_missilehit_fallingdebris2_splash"] = loadfx( "maps/intro/intro_slide_missilehit_fallingdebris2_splash" );
    level._effect["splash_intro_roil"] = loadfx( "water/splash_intro_roil" );
    level._effect["body_splash_intro_delay"] = loadfx( "water/body_splash_intro_delay" );
    level._effect["intro_slide_trail_parent"] = loadfx( "dust/intro_slide_trail_parent" );
    level._effect["glass_dust_trail_child_intro"] = loadfx( "dust/glass_dust_trail_child_intro" );
    level._effect["dust_hand_scrape_intro"] = loadfx( "dust/dust_hand_scrape_intro" );
    level._effect["tree_drop_dust"] = loadfx( "dust/tree_drop_dust" );
    level._effect["wood_explosion_intro"] = loadfx( "impacts/wood_explosion_intro" );
    level._effect["splash_intro_roil_violent"] = loadfx( "water/splash_intro_roil_violent" );
    level._effect["intro_slide_trail_parent_small"] = loadfx( "dust/intro_slide_trail_parent_small" );
    level._effect["intro_slide_trail_parent_small_2"] = loadfx( "dust/intro_slide_trail_parent_small_2" );
    level._effect["glass_dust_trail_child_small"] = loadfx( "dust/glass_dust_trail_child_small" );
    level._effect["glass_dust_trail_child_small_2"] = loadfx( "dust/glass_dust_trail_child_small_2" );
    level._effect["splash_intro_initial"] = loadfx( "water/splash_intro_initial" );
    level._effect["water_intro_river_wake01"] = loadfx( "water/water_intro_river_wake01" );
    level._effect["water_intro_river_eddy"] = loadfx( "water/water_intro_river_eddy" );
    level._effect["water_intro_river_dressing"] = loadfx( "water/water_intro_river_dressing" );
    level._effect["water_intro_river_dressing_shadow"] = loadfx( "water/water_intro_river_dressing_shadow" );
    level._effect["water_intro_river_dressing_shadow_surface"] = loadfx( "water/water_intro_river_dressing_shadow_surface" );
    level._effect["water_intro_river_dressing_small"] = loadfx( "water/water_intro_river_dressing_small" );
    level._effect["water_intro_river_dressing_small_shadow"] = loadfx( "water/water_intro_river_dressing_small_shadow" );
    level._effect["water_intro_river_dressing_large"] = loadfx( "water/water_intro_river_dressing_large" );
    level._effect["water_intro_river_dressing_large_2"] = loadfx( "water/water_intro_river_dressing_large_2" );
    level._effect["water_mist_ground_intro"] = loadfx( "water/water_mist_ground_intro" );
    level._effect["sea_mist_intro"] = loadfx( "water/sea_mist_intro" );
    level._effect["water_intro_distortion"] = loadfx( "distortion/water_intro_distortion" );
    level._effect["water_intro_river_wake02"] = loadfx( "water/water_intro_river_wake02" );
    level._effect["water_intro_river_wake02_blue"] = loadfx( "water/water_intro_river_wake02_blue" );
    level._effect["water_intro_river_wake02_shadow"] = loadfx( "water/water_intro_river_wake02_shadow" );
    level._effect["body_splash_intro_expensive"] = loadfx( "water/body_splash_intro_expensive" );
    level._effect["body_splash_intro_expensive_heater"] = loadfx( "water/body_splash_intro_expensive_heater" );
    level._effect["water_intro_river_splash_wake"] = loadfx( "water/water_intro_river_splash_wake" );
    level._effect["water_river_hue_shift"] = loadfx( "water/water_river_hue_shift" );
    level._effect["water_intro_river_wake_field"] = loadfx( "water/water_intro_river_wake_field" );
    level._effect["water_intro_river_wake_field_blue"] = loadfx( "water/water_intro_river_wake_field_blue" );
    level._effect["water_intro_river_wake_field_shadow"] = loadfx( "water/water_intro_river_wake_field_shadow" );
    level._effect["water_intro_river_wake02_large"] = loadfx( "water/water_intro_river_wake02_large" );
    level._effect["water_intro_river_dressing_large_v"] = loadfx( "water/water_intro_river_dressing_large_v" );
    level._effect["water_intro_river_dressing_fast"] = loadfx( "water/water_intro_river_dressing_fast" );
    level._effect["sea_mist_intro_light"] = loadfx( "water/sea_mist_intro_light" );
    level._effect["water_intro_river_dressing_large_shadow"] = loadfx( "water/water_intro_river_dressing_large_shadow" );
    level._effect["water_intro_river_dressing_large_shadow_surface"] = loadfx( "water/water_intro_river_dressing_large_shadow_surface" );
    level._effect["lights_intro_sunflare"] = loadfx( "lights/lights_intro_sunflare" );
    level._effect["water_intro_emerge_player_hand"] = loadfx( "water/water_intro_emerge_player_hand" );
    level._effect["splash_underwater"] = loadfx( "water/splash_underwater_intro" );
    level._effect["underwater_submerge_whiteout"] = loadfx( "maps/intro/intro_underwater_submerge_whiteout" );
    level._effect["water_stop"] = loadfx( "misc/parabolic_water_stand" );
    level._effect["water_movement"] = loadfx( "misc/parabolic_water_movement" );
    level._effect["underwater_player_bubbles"] = loadfx( "maps/intro/intro_underwater_player_bubbles" );
    level._effect["splash_player_hand"] = loadfx( "water/splash_player_hand" );
    level._effect["splash_player_hand_R"] = loadfx( "water/splash_player_hand_R" );
    level._effect["splash_player_hand_r_light"] = loadfx( "water/splash_player_hand_r_light" );
    level._effect["splash_player_hand_r_strong"] = loadfx( "water/splash_player_hand_r_strong" );
    level._effect["splash_player_hand_l_strong"] = loadfx( "water/splash_player_hand_l_strong" );
    level._effect["splash_player_hand_right_hand"] = loadfx( "water/splash_player_hand_right_hand" );
    level._effect["splash_player_hand_left_hand"] = loadfx( "water/splash_player_hand_left_hand" );
    level._effect["bubbles_player_hand"] = loadfx( "water/bubbles_player_hand" );
    level._effect["water_surface_wake"] = loadfx( "maps/intro/intro_player_water_wake" );
    level._effect["water_surface_wake_calm"] = loadfx( "maps/intro/intro_player_water_wake_calm" );
    level._effect["underwater_object_bubbles"] = loadfx( "maps/intro/intro_underwater_object_bubbles" );
    level._effect["underwater_silt"] = loadfx( "maps/intro/intro_underwater_silt" );
    level._effect["underwater_current"] = loadfx( "maps/intro/intro_underwater_current" );
    level._effect["underwater_bank_foam"] = loadfx( "maps/intro/intro_underwater_bank_foam" );
    level._effect["surface_hand_splash"] = loadfx( "maps/intro/intro_surface_hand_splash" );
    level._effect["intro_underwater_fog"] = loadfx( "maps/intro/intro_underwater_fog" );
    level._effect["bodyshot1"] = loadfx( "impacts/flesh_hit" );
    level._effect["bodyshot2"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["headshot1"] = loadfx( "impacts/flesh_hit_head_fatal_exit" );
    level._effect["headshot2"] = loadfx( "impacts/flesh_hit_head_fatal_exit_exaggerated" );
    level._effect["intro_scaffolding_1"] = loadfx( "props/intro_scaffolding_1" );
    level._effect["intro_balcony_woodrailing_des01"] = loadfx( "props/intro_balcony_woodrailing_des01" );
}
