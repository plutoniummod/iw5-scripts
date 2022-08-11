// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::template_level( "innocent" );
    maps\createart\innocent_art::main();
    maps\innocent_precache::main();
    maps\innocent_fx::main();
    maps\innocent_anim::main();
    maps\london_west::pre_load();
    maps\_drone_civilian::init();
    maps\innocent_code::_id_56F8();
    maps\innocent_starts::_id_03EF();
    maps\_load::main();
    maps\innocent_code::_id_049C();
    maps\london_west::_id_7ECD();
    maps\innocent_starts::_id_7949();
}

_id_03F0()
{

}

_id_03E9()
{
    _id_03F2();
    maps\_utility::delaythread( 0.25, ::_id_03F6 );
    setsaveddvar( "ui_hidemap", "1" );

    for ( var_0 = 0; var_0 < 16; var_0++ )
        objective_delete( var_0 );

    level._id_2985 = maps\innocent_code::_id_0433;
    thread _id_00C2();
    thread _id_02B7();
    thread maps\innocent_code::_id_00C1();

    if ( !getdvarint( "no_lines" ) == 1 )
    {
        wait 2;
        maps\innocent_code::_id_049F();
    }

    level thread maps\innocent_code::_id_056D();
    level thread maps\innocent_code::_id_043C();
    common_scripts\utility::flag_init( "do_truck_explosion" );
    maps\_utility::_id_265A();
    _id_03F4();
}

_id_03F2()
{
    if ( getdvar( "createfx" ) != "" )
        return;

    maps\innocent_code::_id_473C();
    level._id_473D fadeovertime( 0.1 );
    level._id_473D.alpha = 1;
}

_id_00C2()
{
    wait 0.5;
    var_0 = vehicle_getarray();

    foreach ( var_2 in var_0 )
    {
        if ( var_2.origin[0] < 30000 )
            var_2 delete();
    }

    var_4 = getaiarray();

    foreach ( var_6 in var_4 )
    {
        if ( var_6.origin[0] < 30000 )
        {
            if ( isdefined( var_6._id_0D04 ) )
                var_6 maps\_utility::_id_1902();

            var_6 delete();
        }
    }

    var_8 = getentarray( "script_model", "code_classname" );

    foreach ( var_10 in var_8 )
    {
        if ( var_10.origin[0] > 30000 )
            continue;

        if ( !isdefined( var_10.headmodel ) )
            continue;

        var_10 delete();
    }
}

_id_02B7()
{
    maps\_utility::_id_194E( "innocent", 3 );
    common_scripts\utility::flag_set( "innocent_ambient_switched" );
    maps\_utility::delaythread( 0.5, maps\innocent_code::_id_5700, "start_innocent" );
    thread maps\_audio_mix_manager::_id_150F( "default", 1 );
}

_id_03F4()
{
    thread _id_0B5A();
    common_scripts\utility::flag_wait( "innocent_ambient_switched" );
    maps\_utility::vision_set_fog_changes( "innocent_bloom", 0 );
    _id_03F7();
    thread maps\innocent_code::_id_04B0();
    wait 0.5;
    maps\_utility::delaythread( 1.5, maps\innocent_code::_id_042B );
    wait 1;
    thread maps\_utility::vision_set_fog_changes( "innocent", 2 );
    maps\_utility::delaythread( 0.5, common_scripts\utility::flag_set, "start_the_scene" );
    wait 1;
    maps\innocent_code::_id_0442();
    thread maps\innocent_code::_id_0441();
    thread maps\innocent_code::_id_042D();
    common_scripts\utility::flag_set( "splashscreen_off" );
    thread _id_7A60();
    maps\_utility::_id_194E( "innocent_camera", 1 );
    level.player freezecontrols( 0 );
    level._id_04A8 = maps\innocent_code::_id_04A9();
}

_id_7A60()
{
    var_0 = spawn( "script_origin", level.player geteye() );
    var_1 = 0.5;
    var_2 = [ 0.5, 2.5, 0 ];
    var_3 = [ 50, 55, 53, 55 ];
    setblur( 5, 0 );
    wait(var_1);

    foreach ( var_6, var_5 in var_2 )
    {
        setblur( var_5, var_1 );
        level.player lerpfov( var_3[var_6], var_1 * 0.75 );
        var_0 stoploopsound();

        if ( var_6 % 2 == 0 )
            var_0 playloopsound( "scn_videocamera_zoom_loop2" );
        else
            var_0 playloopsound( "scn_videocamera_zoom_loop" );

        wait(var_1);
    }

    var_0 delete();
}

_id_0B5A()
{
    thread _id_03F5();
    maps\_vehicle::_id_2881( "initial_cab" );
    thread maps\innocent_code::_id_042E();
    common_scripts\utility::flag_wait( "start_the_scene" );
    wait 6;
    maps\_vehicle::_id_2881( "side_street_coupe" );
}

_id_03F5()
{
    wait 3;
    var_0 = maps\_vehicle::_id_2881( "innocent_police_car" );
    var_0 vehicle_turnengineoff();
    var_0 playsound( "scn_london_police_car_final_away" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_origin", ( -22.0, 0.0, 66.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "light_blink_london_police_car" ), var_1, "tag_origin" );
    var_0 waittill( "death" );
    var_1 delete();
}

_id_03F6()
{
    level.player freezecontrols( 1 );
    level.player takeallweapons();
    level.player enableinvulnerability();
    level.player allowcrouch( 0 );
    level.player allowsprint( 0 );
    level.player allowprone( 0 );
    level.player allowjump( 0 );
    level.player setcanradiusdamage( 0 );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
    thread maps\innocent_code::_id_63EF();
}

_id_03F7()
{
    level._id_04A2 = maps\_utility::_id_272F( "wife" );
    level._id_04A2._id_1032 = "wife";
    level._id_04A2.name = "";
    level._id_04A2._id_0EC6 = 1;
    level._id_04A2 setcanradiusdamage( 0 );
    level._id_59E0 = maps\_utility::_id_272F( "daughter" );
    level._id_59E0._id_1032 = "daughter";
    level._id_59E0.name = "";
    level._id_59E0 setcanradiusdamage( 0 );
    level._id_04A2 thread _id_03F9();
    level._id_04A2 thread _id_03F8( "wife_disconnector" );
    level._id_59E0 thread _id_03F8( "daughter_disconnector" );
    level.player thread _id_03F8( "player_disconnector" );
}

_id_03F8( var_0 )
{
    self endon( "death" );
    var_1 = getent( var_0, "targetname" );
    var_1.origin = self.origin;
    var_1 disconnectpaths();

    for (;;)
    {
        if ( distancesquared( var_1.origin, self.origin ) > 20 )
        {
            var_1.origin = self.origin;
            var_1 disconnectpaths();
        }

        wait 0.05;
    }
}

_id_03F9()
{
    var_0 = common_scripts\utility::getstruct( "wife_spot", "targetname" );
    common_scripts\utility::flag_wait( "start_the_scene" );
    var_1 = [ level._id_04A2, level._id_59E0 ];
    var_0 maps\_anim::_id_11DD( var_1, "anim_1" );
    var_0 maps\innocent_code::_id_0437( var_1, "anim_1" );
    common_scripts\utility::flag_set( "after_first_anim_stop" );
    thread _id_03FB();
    level.player setcontents( 0 );
    level._id_59E0 thread _id_03FA();
    var_0 thread maps\_anim::_id_11DD( var_1, "anim_2" );
    level._id_00C0 = 150;
    self.allowdeath = 0;
    common_scripts\utility::flag_wait( "do_truck_explosion" );
    thread _id_03FC();
    var_2 = spawnstruct();
    var_2.origin = self.origin;
    var_2.angles = vectortoangles( level._id_0430.origin - self.origin );
    self._id_0EC6 = 1;
    maps\_utility::_id_1414();
    self._id_0D50 = maps\_utility::_id_270F( "death_explosion_stand_B_v2" );
    level._id_04A7 = level._id_04A2.origin;
    wait 0.5;
    self kill();
}

_id_03FA()
{
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        var_1 = vectornormalize( self.origin - var_0 );
        var_2 = self.origin + var_1 * 60;

        foreach ( var_4 in level._id_043C )
        {
            if ( distancesquared( var_4.origin, var_2 ) < 400 )
                var_4 thread maps\innocent_code::_id_043E();
        }

        var_0 = self.origin;
        wait 0.05;
    }
}

_id_03EA( var_0 )
{
    common_scripts\utility::flag_wait( "after_first_anim_stop" );
    level._id_0430 = maps\_vehicle::_id_2881( "enemy_truck" );

    foreach ( var_2 in level._id_0430._id_0A39 )
    {
        var_2.nododgemove = 1;
        var_2 maps\_utility::_id_140B( "unarmed_run" );
        var_2 maps\_utility::_id_251F();
        var_2 maps\_utility::_id_271F();
    }
}

_id_03FB()
{
    wait 7;
    var_0 = maps\_vehicle::_id_2881( "last_cab" );
    var_0.no_destructible_animation = 1;
    common_scripts\utility::flag_wait( "truck_explodes" );
    var_0 dodamage( 500, var_0.origin );
    var_0 waittill( "reached_end_node" );
    var_0 maps\_utility::_id_2733();
}

_id_03EB( var_0 )
{
    wait 1.4;
    common_scripts\utility::flag_set( "do_truck_explosion" );
}

_id_03FC()
{
    level._id_0430 thread maps\_utility::play_sound_on_entity( "scn_innocent_truckgas_explode" );
    common_scripts\utility::exploder( "truck_bomb" );
    level._id_0430 setmodel( "vehicle_uk_delivery_truck_destroyed" );
    var_0 = common_scripts\utility::getstruct( "scream_speaker1", "targetname" );
    var_1 = common_scripts\utility::getstruct( "scream_speaker2", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "walla_innocent_scream_l", var_0.origin );
    thread common_scripts\utility::play_sound_in_space( "walla_innocent_scream_r", var_1.origin );
    common_scripts\utility::flag_set( "truck_explodes" );
    maps\_utility::_id_194E( "innocent_end", 0.5 );
    level.player maps\_utility::vision_set_fog_changes( "innocent_explosion", 0.2 );
    earthquake( 0.8, 0.5, level._id_0430.origin, 2000 );
    thread maps\innocent_code::_id_04A1();
    thread _id_03FD();
    thread maps\innocent_code::_id_0440();
    level.player maps\_utility::delaythread( 1, maps\_utility::vision_set_fog_changes, "innocent_post_explosion", 10 );
    wait 5;
    maps\innocent_code::_id_04A6();
}

_id_03FD( var_0 )
{
    level._id_04A3 = level._id_59E0.origin;
    level._id_59E0 kill();
    var_1 = level._id_0430;
    var_0 = var_1.origin + ( 0.0, 0.0, 32.0 );
    var_2 = anglestoright( var_1.angles + ( 0.0, 180.0, 0.0 ) );
    var_0 += var_2 * 64;
    radiusdamage( var_0, 512, 300, 200, level._id_0430, "MOD_EXPLOSIVE" );
    wait 0.05;
}

_id_03FE( var_0, var_1 )
{
    var_2 = var_0.origin + ( 0.0, 0.0, 60.0 );
    self.target_ent moveto( var_2, var_1, var_1 * 0.5, var_1 * 0.5 );
    wait(var_1);
}
