// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_56F8()
{
    level._id_049B = -5;
    level._id_01DC = 1;
    _id_4D6D();
    _id_049D();
    maps\london_code::_id_56F9();
}

_id_049C()
{
    setsaveddvar( "ui_hideMap", "0" );
    maps\_compass::setupminimap( "compass_map_london_station", "station_minimap_corner" );
    maps\_utility::_id_27CB( "innocent_truck_riders", ::_id_049E );
    maps\_audio::_id_173F();
    maps\_audio::_id_156E( "default" );
    maps\_audio::_id_1735();
}

_id_049D()
{
    precacheshader( "overlay_grain" );
    precacheshader( "cam_51ch" );
    precacheshader( "cam_battery" );
    precacheshader( "cam_button_home" );
    precacheshader( "cam_button_options" );
    precacheshader( "cam_button_play" );
    precacheshader( "cam_hdsp" );
    precacheshader( "cam_portrait" );
    precacheshader( "cam_checkerboard" );
    precacheshader( "cam_checkerboard2" );
    precacheshader( "cam_scramble" );
    precacheshader( "cam_splash" );
    precachemodel( "pigeon_fly_iw5" );
}

_id_4D6D()
{
    common_scripts\utility::flag_init( "fade_up" );
    common_scripts\utility::flag_init( "splashscreen_off" );
    common_scripts\utility::flag_init( "truck_explodes" );
    common_scripts\utility::flag_init( "after_first_anim_stop" );
    common_scripts\utility::flag_init( "start_the_scene" );
    common_scripts\utility::flag_init( "cab_passed_side_street" );
    common_scripts\utility::flag_init( "feeder_traffic" );
    common_scripts\utility::flag_init( "couple_past_civilian" );
    common_scripts\utility::flag_set( "feeder_traffic" );
    common_scripts\utility::flag_init( "got_contact" );
    common_scripts\utility::flag_init( "innocent_ambient_switched" );
}

_id_049E()
{
    self waittill( "goal" );
    self delete();
}

_id_049F()
{
    level._id_1DA0 = 0;
    var_0 = [];
    var_0[var_0.size] = &"INNOCENT_LINEFEED_1";
    var_0[var_0.size] = &"INNOCENT_LINEFEED_2";

    foreach ( var_3, var_2 in var_0 )
    {
        thread _id_04A0( var_2, var_0.size - var_3 - 1 );
        wait 1;
    }
}

_id_04A0( var_0, var_1 )
{
    level notify( "new_introscreen_element" );
    level._id_1DA0++;
    var_2 = ( 0.8, 1.0, 0.8 );
    var_3 = ( 0.3, 0.6, 0.3 );
    var_4 = maps\_introscreen::_id_1DA1();
    var_5 = newhudelem();
    var_5.x = 20;
    var_5.y = var_4;
    var_5.alignx = "left";
    var_5.aligny = "bottom";
    var_5.horzalign = "left";
    var_5.vertalign = "bottom";
    var_5.sort = 1;
    var_5.foreground = 1;
    var_5 settext( var_0 );
    var_5.alpha = 0;
    var_5 fadeovertime( 0.2 );
    var_5.alpha = 1;
    var_5.hidewheninmenu = 1;
    var_5.fontscale = 2.0;
    var_5.color = var_2;
    var_5.font = "objective";
    var_5.glowcolor = var_3;
    var_5.glowalpha = 1;
    var_6 = int( var_1 * 1000 + 4000 );
    var_5 setpulsefx( 30, var_6, 700 );
    thread maps\_introscreen::_id_1DA3( var_5 );
}

_id_04A1()
{
    wait 0.2;
    thread _id_04A5();
    level.player viewkick( 60, level._id_04A2.origin );
    level notify( "stop_shakey_cam" );
    level.player freezecontrols( 1 );
    level notify( "stop_camera_ads" );
    level.player lerpfov( 55, 0.2 );
    var_0 = common_scripts\utility::getstruct( "dot_line", "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = vectornormalize( var_0.origin - var_1.origin );
    level._id_5258 rotateto( ( 0.0, 0.0, 0.0 ), 0.2 );
    var_3 = level.player.origin;
    var_4 = level.player geteye() - level.player.origin;
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5.origin = level.player.origin;
    var_5.angles = vectortoangles( level._id_04A3 - level.player.origin );
    var_6 = common_scripts\utility::spawn_tag_origin();
    var_6.angles = var_5.angles;
    var_6.origin = level.player geteye();
    var_5 linkto( var_6 );
    level thread _id_00BF( var_5 );
    var_7 = var_2 * 20;
    var_8 = var_6.origin;
    var_6 moveto( var_8 + var_7 + ( 0.0, 0.0, 20.0 ), 0.1, 0.05, 0.05 );
    wait 0.1;
    var_6 moveto( var_8 + var_7 * 2 + ( 0.0, 0.0, -20.0 ), 0.1, 0.05 );
    wait 0.1;
    var_9 = var_4[2] / 120;
    var_6 moveto( var_3 + var_7 * 3 + ( 0.0, 0.0, 10.0 ), var_9, var_9 );
    var_6 rotateto( var_6.angles + ( 0.0, 0.0, 80.0 ), var_9 );
    wait(var_9 + 0.05);
    earthquake( 0.5, 0.5, var_6.origin, 200 );
    thread _id_04A4( var_6.angles );
    level._id_00BE = var_6.angles;
    var_10 = var_6.angles;
    var_11 = 3;
    var_12 = 0.2;

    for ( var_13 = 0; var_13 < 6; var_13++ )
    {
        var_6 rotateto( var_10 + ( var_11, 0, 0 ), var_12, var_12 * 0.5, var_12 * 0.5 );
        wait(var_12);
        var_11 -= 0.3;
        var_11 *= -1;
        var_12 *= 1.5;
        earthquake( 0.1, var_12 * 2, var_6.origin, 200 );
    }
}

_id_00BF( var_0 )
{
    var_1 = 0.2;
    var_2 = "tag_origin";
    level.player playerlinktoblend( var_0, var_2, var_1, var_1 * 0.9 );
}

_id_04A4( var_0 )
{

}

_id_04A5()
{
    setblur( 5, 0.2 );
    wait 0.5;
    setblur( 0, 2 );
}

_id_04A6()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_1 = anglestoforward( level.player getplayerangles() );
    var_2 = level.player geteye();
    var_3 = spawn( "script_origin", level.player geteye() );
    thread _id_04B2( var_0, "ending" );
    var_4 = distance( level.player.origin, level._id_04A7 );

    for ( var_5 = 0; var_5 < 9; var_5++ )
    {
        if ( var_5 % 2 == 0 )
        {
            var_3 playloopsound( "scn_videocamera_zoom_loop2" );
            var_6 = var_2 + var_1 * randomfloatrange( 0, 32 );
        }
        else
        {
            var_3 playloopsound( "scn_videocamera_zoom_loop" );
            var_6 = var_2 + var_1 * randomfloatrange( var_4 - 25, var_4 + 25 );
        }

        if ( var_5 == 5 )
        {
            var_7 = common_scripts\utility::getfx( "poisonous_gas_spillage_innocent_dood" );
            var_1 = anglestoforward( level._id_00BE );
            var_8 = anglestoforward( level._id_00BE + ( 0.0, 180.0, 0.0 ) );
            var_9 = level.player geteye() + var_1 * 200;
            playfx( var_7, var_9, var_8 );
        }

        var_10 = randomfloatrange( 0.5, 1 );
        var_0 moveto( var_6, var_10 );
        wait(var_10);
        var_3 stoploopsound();
        var_11 = randomfloatrange( 0.2, 0.75 );
        wait(var_11);
    }

    foreach ( var_13 in level._id_04A8 )
        var_13 destroy();

    maps\_utility::_id_27D3( "cheat_invert", 0 );
    wait 0.5;
    var_15 = _id_04AB( "cam_scramble", 800, 600 );
    var_15.x -= 60;
    var_15.y -= 20;
    var_15.alpha = 0.5;
    wait 0.1;
    var_15.x = 0;
    var_15.y = 0;
    var_15.alpha = 0.95;
    var_15.color = ( 0.5, 0.2, 0.2 );
    wait 0.1;
    var_16 = _id_04AB( "cam_checkerboard2", 640, 256 );
    var_16.x += 3;
    var_16.y -= 128;
    var_16.alpha = 0.2;
    var_16.aligny = "top";
    var_16.color = ( 0.238, 0.328, 0.246 );
    var_16.sort += 1;
    wait 0.1;
    var_16 setshader( "cam_checkerboard", 640, 256 );
    var_16.alpha = 0.5;
    var_16.x += 9;
    var_16.y = -64;
    var_16.color = ( 0.015, 0.101, 0.015 );
    var_16.color = ( 1.0, 1.0, 1.0 );
    wait 0.1;
    common_scripts\utility::play_loopsound_in_space( "tinnitus_soft_loop", level.player geteye() );
    var_17 = _id_473C();
    var_17.alpha = 1;
    wait 0.05;
    maps\_audio_mix_manager::_id_150F( "mute_all" );
    wait 0.25;
    maps\_utility::_id_195A();
}

_id_04A9()
{
    var_0 = [];
    var_0["rec"] = _id_04AA();
    var_0["time"] = _id_47EF();
    var_0["btn_home"] = _id_04AD( "cam_button_home", "top_left", 128, 64 );
    var_0["51ch"] = _id_04AD( "cam_51ch", "top_left", 128, 64 );
    var_0["51ch"].y += 60;
    var_0["battery"] = _id_04AD( "cam_battery", "top_left", 256, 64 );
    var_0["battery"].x += 60;
    var_0["hdsp"] = _id_04AD( "cam_hdsp", "top_left", 128, 64 );
    var_0["hdsp"].y += 30;
    var_0["play"] = _id_04AD( "cam_button_play", "bottom_left", 128, 64 );
    var_0["options"] = _id_04AD( "cam_button_options", "bottom_right", 128, 64 );
    var_0["portrait"] = _id_04AD( "cam_portrait", "mid_left", 64, 64 );
    var_0["noise"] = _id_04AE();
    return var_0;
}

_id_04AA()
{
    var_0 = newhudelem();
    var_0.x = 320;
    var_0.y = 50;
    var_0.sort = -5;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.fontscale = 2;
    var_0.font = "objective";
    var_0.color = ( 0.8, 0.0, 0.0 );
    var_0 settext( &"INNOCENT_REC" );
    var_0 thread _id_04AC();
    return var_0;
}

_id_04AB( var_0, var_1, var_2 )
{
    var_3 = newhudelem();
    var_3.x = 0;
    var_3.y = 0;
    var_3 setshader( var_0, var_1, var_2 );
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.sort = -3;
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = 0.2;
    return var_3;
}

_id_04AC()
{
    self endon( "death" );

    for (;;)
    {
        wait 0.8;
        self.alpha = 0;
        wait 1;
        self.alpha = 1;
    }
}

_id_04AD( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    if ( var_1 == "top_left" )
    {
        var_7 = "left";
        var_5 = 0;
        var_6 = 50;
    }
    else if ( var_1 == "bottom_left" )
    {
        var_7 = "left";
        var_5 = 0;
        var_6 = 430;
    }
    else if ( var_1 == "top_right" )
    {
        var_7 = "right";
        var_5 = 640;
        var_6 = 50;
    }
    else if ( var_1 == "bottom_right" )
    {
        var_7 = "right";
        var_5 = 640;
        var_6 = 430;
    }
    else if ( var_1 == "mid_left" )
    {
        var_7 = "left";
        var_5 = 0;
        var_6 = 240;
    }

    var_8 = newhudelem();
    var_8.x = var_5;
    var_8.y = var_6;
    var_8.sort = -5;
    var_8.alignx = var_7;
    var_8.aligny = "middle";

    if ( !isdefined( var_4 ) )
        var_4 = 0.375;

    var_8 setshader( var_0, int( var_2 * var_4 ), int( var_3 * var_4 ) );
    return var_8;
}

_id_04AE()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0.sort = level._id_049B - 1;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0 setshader( "overlay_grain", 640, 480 );
    var_0.alpha = 0.2;
    return var_0;
}

_id_47EF()
{
    var_0 = newhudelem();
    var_0.x = 640;
    var_0.y = 50;
    var_0.sort = level._id_049B;
    var_0.alignx = "right";
    var_0.aligny = "middle";
    var_0.fontscale = 2;
    var_0.font = "objective";
    var_0.color = ( 1.0, 1.0, 1.0 );
    var_0 settimerup( 0 );
}

_id_04AF()
{
    level endon( "stop_shakey_cam" );
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_5258 = var_0;
    level.player playersetgroundreferenceent( var_0 );
    var_1 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        var_2 = var_1 + ( randomfloatrange( -2, 2 ), randomfloatrange( -2, 2 ), randomfloatrange( -2, 2 ) );
        var_3 = randomfloatrange( 0.4, 0.8 );
        var_0 rotateto( var_2, var_3, var_3 * 0.5, var_3 * 0.5 );
        wait(var_3);
    }
}

_id_04B0()
{
    thread _id_04AF();
    thread _id_04B1();

    for (;;)
        wait 0.05;
}

_id_04B1()
{
    level endon( "stop_camera_ads" );
    var_0 = 0;
    var_1 = 35;
    var_2 = 55;
    level.player lerpfov( var_2, 0.5 );

    for (;;)
    {
        if ( level.player adsbuttonpressed() )
        {
            if ( !var_0 )
            {
                var_0 = 1;
                level.player lerpfov( var_1, 0.5 );
            }
        }
        else if ( var_0 )
        {
            var_0 = 0;
            level.player lerpfov( var_2, 0.5 );
        }

        wait 0.05;
    }
}

_id_04B2( var_0, var_1 )
{
    level notify( "stop_dof_think" );
    level endon( "stop_dof_think" );

    if ( var_1 == "ending" )
    {
        var_2 = 128;
        var_3 = 600;
        var_4 = 10;
        var_5 = 2;
    }
    else
    {
        var_2 = 1000;
        var_3 = 600;
        var_4 = 4;
        var_5 = 1.5;
    }

    level._id_0427 = [];

    foreach ( var_8, var_7 in level._id_1436 )
        level._id_0427[var_8] = var_7;

    for (;;)
    {
        var_9 = distance( level.player geteye(), var_0.origin );
        level._id_1436["nearStart"] = var_9 - var_2;
        level._id_1436["nearStart"] = max( 0, level._id_1436["nearStart"] );
        level._id_1436["nearEnd"] = var_9;
        level._id_1436["farStart"] = var_9;
        level._id_1436["farEnd"] = var_9 + var_3;
        level._id_1436["nearBlur"] = var_4;
        level._id_1436["farBlur"] = var_5;
        wait 0.05;
    }
}

_id_0428( var_0 )
{
    if ( !isdefined( level._id_0429 ) )
        level._id_0429 = 20;

    if ( level.player buttonpressed( "=" ) )
        level._id_0429 += 10;
    else if ( level.player buttonpressed( "-" ) )
        level._id_0429 -= 10;

    if ( level.player buttonpressed( "]" ) )
        level._id_1436["nearBlur"] += 0.01;
    else if ( level.player buttonpressed( "[" ) )
        level._id_1436["nearBlur"] -= 0.01;

    if ( level.player buttonpressed( "0" ) )
        level._id_1436["farBlur"] += 0.01;
    else if ( level.player buttonpressed( "9" ) )
        level._id_1436["farBlur"] -= 0.01;

    level._id_1436["nearBlur"] = max( 4, level._id_1436["nearBlur"] );
    level._id_0429 = max( 0, level._id_0429 );
    level._id_1436["nearStart"] = level._id_0429 - 64;
    level._id_1436["nearStart"] = max( 0, level._id_1436["nearStart"] );
    level._id_1436["nearEnd"] = level._id_0429;
    level._id_1436["farStart"] = level._id_0429;
    level._id_1436["farEnd"] = level._id_0429 + 500;
}

_id_042A()
{
    var_0 = newhudelem();
    var_0.sort = level._id_049B + 5;
    var_0.x = 320;
    var_0.y = 240;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.foreground = 1;
    var_0 setshader( "cam_splash", 480, 120 );
    var_0.color = ( 1.0, 1.0, 1.0 );
    var_0.sort = 100;
    return var_0;
}

_id_042B()
{
    thread common_scripts\utility::play_sound_in_space( "scn_videocamera_turn_on", level.player geteye() );
    level._id_042C = _id_042A();
    level._id_042C fadeovertime( 0.2 );
    level._id_042C.alpha = 1;
}

_id_042D()
{
    level._id_473D fadeovertime( 0.4 );
    level._id_473D.alpha = 0;
    wait 1;
    var_0 = 0.4;
    level._id_042C fadeovertime( var_0 );
    level._id_042C.alpha = 0;
    wait(var_0 + 0.05);
    level._id_042C destroy();
}

_id_042E()
{
    level endon( "truck_explodes" );
    var_0 = getentarray( "feeder_traffic", "targetname" );

    for (;;)
    {
        var_0 = maps\_utility::_id_0B53( var_0 );

        foreach ( var_2 in var_0 )
        {
            wait(randomfloatrange( 5, 10 ));

            while ( _id_042F() )
                wait 0.1;

            var_3 = var_2 maps\_vehicle::_id_1F9E();
        }
    }
}

_id_042F()
{
    var_0 = getent( "feeder_traffic_trigger", "targetname" );
    var_1 = vehicle_getarray();

    if ( isdefined( level._id_0430 ) )
        var_1 = common_scripts\utility::array_remove( var_1, level._id_0430 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_0431 ) )
            continue;

        if ( var_3._id_0432 istouching( var_0 ) )
            return 1;
    }

    return 0;
}

_id_0433( var_0 )
{
    var_0._id_0432 = spawn( "script_origin", var_0.origin + ( 0.0, 0.0, 32.0 ) );
    var_0 waittill( "death" );
    var_0._id_0432 delete();
}

_id_5700( var_0, var_1, var_2 )
{
    var_3 = getentarray( "sas_squad", "targetname" );
    var_4 = common_scripts\utility::getstructarray( var_0, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !var_2 )
        var_3[var_3.size] = level.player;

    if ( isdefined( var_1 ) )
        var_3 = common_scripts\utility::array_combine( var_3, var_1 );

    foreach ( var_6 in var_3 )
    {
        foreach ( var_8 in var_4 )
        {
            if ( isdefined( var_8.script_noteworthy ) )
            {
                if ( isdefined( var_6.script_noteworthy ) && var_8.script_noteworthy == var_6.script_noteworthy )
                {
                    var_6 _id_5702( var_8 );
                    break;
                }
                else if ( isplayer( var_6 ) && var_8.script_noteworthy == "player" )
                {
                    var_6 _id_5702( var_8 );
                    break;
                }
            }
        }
    }

    foreach ( var_6 in var_3 )
    {
        if ( isdefined( var_6._id_5701 ) )
            continue;

        foreach ( var_8 in var_4 )
        {
            if ( isdefined( var_8._id_5701 ) )
                continue;

            var_6 _id_5702( var_8 );
            break;
        }
    }

    foreach ( var_6 in var_3 )
        var_6._id_5701 = undefined;

    foreach ( var_8 in var_4 )
        var_8._id_5701 = undefined;
}

_id_5702( var_0 )
{
    if ( isplayer( self ) )
    {
        self setorigin( var_0.origin );
        self setplayerangles( var_0.angles );
    }
    else
    {
        self forceteleport( var_0.origin, var_0.angles );
        self setgoalpos( var_0.origin );

        if ( isdefined( var_0.target ) )
            self.target = var_0.target;
    }

    self._id_5701 = 1;
    var_0._id_5701 = 1;
}

_id_056D()
{
    var_0 = common_scripts\utility::getstructarray( "traffic_start_point", "targetname" );
    var_1 = getentarray( "traffic_model_innocent", "targetname" );

    foreach ( var_3 in var_0 )
    {
        var_3._id_0B5A = [];
        var_3._id_0434 = 0;
    }

    var_5 = [];

    foreach ( var_7 in var_1 )
    {
        var_8 = spawnstruct();
        var_8.model = var_7.model;
        var_8.angles = ( 0.0, 0.0, 0.0 );

        if ( isdefined( var_7._id_6B94 ) )
            var_8.angles = var_7._id_6B94;

        var_8.radius = var_7.radius;
        var_5[var_5.size] = var_8;
        var_7 delete();
    }

    var_10 = spawnstruct();
    var_10._id_15DA = 20;
    var_10.count = 0;

    for (;;)
    {
        if ( var_10.count == var_10._id_15DA )
        {
            wait 1;
            continue;
        }

        var_3 = var_0[randomint( var_0.size )];

        if ( var_10 _id_056E( var_3, var_5 ) )
        {
            wait(randomfloatrange( 0.2, 0.5 ));
            continue;
        }

        wait 0.05;
    }
}

_id_056E( var_0, var_1 )
{
    if ( gettime() < var_0._id_0434 )
        return 0;

    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = var_1[randomint( var_1.size )];

    if ( isdefined( var_0._id_0435 ) )
    {
        var_4 = var_3.radius * var_3.radius + var_0._id_0435.radius * var_0._id_0435.radius;

        if ( distancesquared( var_0.origin, var_0._id_0435.origin ) < var_4 )
            return 0;
    }

    var_5 = spawn( "script_model", var_0.origin );
    var_5 setmodel( var_3.model );
    var_5.angles = vectortoangles( var_2.origin - var_0.origin ) + ( 0, var_3.angles[1], 0 );
    var_5.radius = var_3.radius;
    var_5 thread _id_056F( var_0, var_2, self );
    var_0._id_0435 = var_5;
    self._id_0434 = gettime() + 2000;
    self.count++;
    return 1;
}

_id_056F( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = undefined;

    if ( var_0._id_0B5A.size > 0 )
    {
        var_3 = var_0._id_0B5A[var_0._id_0B5A.size - 1];
        var_4 = self.radius * self.radius + var_3.radius * var_3.radius;
    }

    var_0._id_0B5A[var_0._id_0B5A.size] = self;
    var_5 = randomintrange( 348, 609 );
    var_6 = distance( self.origin, var_1.origin );
    var_7 = var_6 / var_5;
    self.speed = var_5;
    self moveto( var_1.origin, var_7 );
    var_8 = gettime() + var_7 * 1000;

    while ( gettime() < var_8 )
    {
        if ( isdefined( var_3 ) )
        {
            if ( distancesquared( self.origin, var_3.origin ) < var_4 )
            {
                var_4 = distance( self.origin, var_3.origin );
                var_4 *= var_4;
                var_5 = var_3.speed;
                self.speed = var_5;
                var_6 = distance( self.origin, var_1.origin );
                var_7 = var_6 / var_5;
                self moveto( var_1.origin, var_7 );
                var_8 = gettime() + var_7 * 1000;
            }
        }

        wait 0.05;
    }

    var_0._id_0B5A = common_scripts\utility::array_remove( var_0._id_0B5A, self );
    self delete();
    var_2.count--;
}

_id_63EF()
{
    level endon( "truck_explodes" );
    var_0 = 25;
    level.player maps\_utility::_id_2797( var_0 );
    level._id_00C0 = 100;

    for (;;)
    {
        if ( !isdefined( level._id_04A2 ) )
        {
            wait 0.05;
            continue;
        }

        var_1 = _id_0436( level._id_00C0 );
        var_2 = var_1 * 0.01;
        var_2 = clamp( var_2, 0, 1 );
        level.player maps\_utility::_id_2797( var_0 * var_2 );
        wait 0.05;
    }
}

_id_0436( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "dot_line", "targetname" );
    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_3 = vectornormalize( var_2.origin - var_1.origin );
    var_4 = level.player.origin - var_1.origin;
    var_5 = vectordot( var_4, var_3 );
    var_6 = level._id_04A2.origin - var_1.origin;
    var_7 = vectordot( var_6, var_3 );
    var_8 = var_7 - var_0;
    var_9 = var_8 - var_5;
    return var_9;
}

_id_0437( var_0, var_1 )
{
    self._id_0438 = 2;
    self._id_0439 = 0;
    self._id_043A = [ "london_wif_getcloser", "london_wif_honey" ];
    var_2 = 0;

    for (;;)
    {
        if ( _id_0436( 200 ) < 0 )
            break;

        if ( !self._id_0439 )
        {
            self._id_0439 = 1;
            var_3 = var_1 + "_idle";
            self._id_0438--;

            if ( self._id_0438 == 0 )
            {
                self._id_0438 = randomintrange( 2, 4 );
                var_3 = var_1 + "_nag";

                if ( var_2 > self._id_043A.size - 1 )
                {
                    var_2 = 0;
                    self._id_043A = maps\_utility::_id_0B53( self._id_043A );
                }

                var_4 = self._id_043A[var_2];
                level._id_04A2 thread maps\_utility::_id_168C( var_4 );
                var_2++;
            }

            thread _id_043B( var_0, var_3 );
            wait 1;
        }

        wait 0.05;
    }

    common_scripts\utility::array_thread( var_0, maps\_utility::_id_1414 );
}

_id_043B( var_0, var_1 )
{
    maps\_anim::_id_11DD( var_0, var_1 );
    self._id_0439 = 0;
}

_id_043C()
{
    level._id_043C = [];
    var_0 = getvehiclenodearray( "pigeon_node", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = spawn( "script_model", var_2.origin );
        var_3.angles = var_2.angles;
        var_3 setmodel( "pigeon_iw5" );
        var_3.node = var_2;
        level._id_043C[level._id_043C.size] = var_3;
        var_3 thread _id_043D();
    }
}

_id_043D()
{
    wait(randomfloat( 0.5 ));
    var_0 = spawnstruct();
    var_0.origin = self.node.origin;
    var_0.angles = self.node.angles;
    self._id_1032 = "pigeon";
    maps\_anim::_id_1244();
    self.struct = var_0;
    var_0 thread maps\_anim::_id_124E( self, "idle" );
}

_id_043E()
{
    self.struct notify( "stop_loop" );
    maps\_utility::_id_1414();
    level._id_043C = common_scripts\utility::array_remove( level._id_043C, self );
    var_0 = getent( "bird_vehicle", "targetname" );

    while ( isdefined( var_0._id_2973 ) )
        wait 0.05;

    var_1 = maps\_vehicle::_id_211F( var_0 );
    var_1._id_0431 = 1;
    var_1._id_291A = self.node;
    var_1 attachpath( self.node );
    var_1 startpath();
    thread _id_043F();
    self linkto( var_1, "" );
    var_1 thread maps\_vehicle::_id_26A1( self.node );
    var_1._id_2950 = 1;
    var_1 waittill( "death" );
    self delete();
}

_id_043F()
{
    self endon( "death" );
    self setmodel( "pigeon_fly_iw5" );
    var_0 = maps\_utility::_id_1281( "flying" );
    var_1 = 1;
    var_2 = 0.1;
    var_3 = 0.5;

    for ( var_4 = 0; var_4 < 5; var_4++ )
    {
        self clearanim( var_0, 0.5 );
        self setanimrestart( var_0, 1, 0.5, var_1 );
        wait(var_3);
        var_1 -= var_2;
    }
}

_id_0440()
{
    foreach ( var_1 in level._id_043C )
        var_1 delete();
}

_id_0441()
{
    level._id_1FF9 = 50;
    var_0 = getent( "civilian_male_spawner", "script_noteworthy" );
    var_1 = maps\_utility::_id_212D( var_0 );
    var_1._id_1032 = "drone_man";
    var_1._id_2044 = var_1 maps\_utility::_id_1281( "couple_walk" );
    var_2 = getent( "civilian_female_spawner", "script_noteworthy" );
    var_3 = maps\_utility::_id_212D( var_2 );
    var_3._id_1032 = "drone_girl";
    var_3._id_2044 = var_3 maps\_utility::_id_1281( "couple_walk" );
    var_3.origin = getstartorigin( var_1.origin, var_1.angles, var_3._id_2044 );
    var_3.angles = getstartangles( var_1.origin, var_1.angles, var_3._id_2044 );
    var_3 linkto( var_1 );
    var_4 = common_scripts\utility::getstruct( "couple_start_node", "targetname" );
    var_1.target = var_4.target;
    var_1.origin = var_4.origin;
    var_1.angles = var_4.angles;
    var_1 thread maps\_drone::_id_2043();
    wait 0.05;
    var_3 thread maps\_drone::_id_2012( var_3._id_2044, var_3._id_0FC6 );
    var_5 = common_scripts\utility::getstruct( "couple_past_civilian", "script_noteworthy" );

    while ( var_1.origin[1] < var_5.origin[1] )
        wait 0.1;

    common_scripts\utility::flag_set( "couple_past_civilian" );
}

_id_0442()
{
    var_0 = getentarray( "civilian", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_0443 );
}

_id_0443()
{
    maps\_utility::script_delay();
    self._id_2005 = 1;
    self._id_212F = 1;
    var_0 = maps\_utility::_id_166F();
    var_0._id_1032 = "civilian";
    var_0.goalradius = 16;
    var_0 maps\_utility::_id_26F7( "walk" );
    var_0 thread _id_0444();
}

_id_0444()
{
    self endon( "death" );

    if ( !isdefined( self.target ) )
        return;

    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( self._id_1288 ) )
        common_scripts\utility::flag_wait( self._id_1288 );

    maps\_utility::_id_2133();

    for (;;)
    {
        self setgoalnode( var_0 );
        self waittill( "goal" );

        if ( isdefined( var_0._id_205B ) )
            maps\_utility::_id_26F7( var_0._id_205B );

        if ( !isdefined( var_0.target ) )
            break;

        var_0 = getnode( var_0.target, "targetname" );
    }

    self delete();
}

_id_4D6F( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );
    common_scripts\utility::array_call( var_2, ::delete );
}

_id_0445( var_0, var_1, var_2, var_3, var_4 )
{
    level.player lerpviewangleclamp( var_0, var_0 * 0.5, var_0 * 0.5, var_1, var_2, var_3, var_4 );
}

_id_473C()
{
    if ( !isdefined( level._id_473D ) )
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );

    level._id_473D.sort = level._id_049B - 5;
    level._id_473D.foreground = 0;
    return level._id_473D;
}

_id_570B( var_0, var_1, var_2 )
{
    var_3 = cos( var_1[1] );
    var_4 = sin( var_1[1] );
    var_5 = var_2[0] * var_3 - var_2[1] * var_4;
    var_6 = var_2[0] * var_4 + var_2[1] * var_3;
    var_5 += var_0[0];
    var_6 += var_0[1];
    return ( var_5, var_6, var_0[2] + var_2[2] );
}

_id_00C1()
{
    var_0 = "ambient_innocent_camera_wind";
    level.player thread common_scripts\utility::play_loop_sound_on_entity( var_0 );
    common_scripts\utility::flag_wait( "splashscreen_off" );
    level.player notify( "stop sound" + var_0 );
    var_0 = "ambient_innocent_camera_wind_fast";
    level.player thread common_scripts\utility::play_loop_sound_on_entity( var_0 );
}
