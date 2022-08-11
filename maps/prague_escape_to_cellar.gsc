// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7CC2()
{
    maps\_shg_common::move_player_to_start( "to_cellar_player" );
    maps\_compass::setupminimap( "compass_map_prague_escape_standoff", "standoff_minimap_corner" );

    if ( !isdefined( level.player ) )
    {
        level.player = getentarray( "player", "classname" )[0];
        level.player._id_1032 = "player_rig";
    }

    level.player enabledeathshield( 1 );
    maps\prague_escape_code::_id_7A3B( "price", "to_cellar" );

    if ( !isdefined( level._id_7CC3 ) )
    {
        var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
        level._id_7CC3 = spawnstruct();
        level._id_7CC3.origin = var_0.origin;
        level._id_7CC3.angles = var_0.angles;
        level._id_7CC3 thread maps\_anim::_id_124E( level._id_4877, "price_punch_loop" );
    }

    maps\_utility::_id_265A();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7CC4()
{
    common_scripts\utility::flag_init( "kill_window_bullets" );
    common_scripts\utility::flag_init( "player_opened_door" );
    common_scripts\utility::flag_init( "end_to_cellar" );
    common_scripts\utility::flag_init( "give_punch_headlook" );
    common_scripts\utility::flag_init( "stop_stair_rumble" );
    common_scripts\utility::flag_init( "play_price_door_vo" );
    common_scripts\utility::flag_init( "bottles_go_boom" );
    common_scripts\utility::flag_init( "leader_escape_dialogue02" );
    common_scripts\utility::flag_init( "leader_escape_dialogue03" );
    common_scripts\utility::flag_init( "leader_escape_dialogue04" );
    common_scripts\utility::flag_init( "price_punch_dialog_02" );
    common_scripts\utility::flag_init( "price_punch_dialog_03" );
    common_scripts\utility::flag_init( "start_no_sound_bullets" );
}

_id_7CC5()
{
    if ( !isdefined( level._id_7BE8 ) || !isdefined( level._id_7BE9 ) )
        maps\prague_escape_medic::_id_7BE7();

    level thread _id_7CC9();
    common_scripts\utility::flag_wait( "end_to_cellar" );
}

_id_7CC6( var_0 )
{
    level._id_7BF0 maps\_utility::_id_168C( "presc_rl_price" );
    common_scripts\utility::flag_wait( "leader_escape_dialogue02" );
    level._id_7BF0 maps\_utility::_id_168C( "presc_rl_havetogo" );
    common_scripts\utility::flag_wait( "leader_escape_dialogue03" );
    level._id_7BF0 maps\_utility::_id_168C( "presc_rl_thisway" );
    common_scripts\utility::flag_wait( "leader_escape_dialogue04" );
    level._id_7BF0 maps\_utility::_id_168C( "presc_rl_now" );
}

_id_7CC7()
{
    level endon( "stop_no_sound_bullets" );
    common_scripts\utility::flag_wait( "start_no_sound_bullets" );
    var_0 = common_scripts\utility::getstructarray( "window_bullet_start", "targetname" );

    for (;;)
    {
        var_1 = randomfloatrange( -15, 15 );
        var_2 = randomfloatrange( -15, 15 );
        var_3 = randomfloatrange( -15, 15 );
        var_4 = var_0[randomint( var_0.size )];
        var_5 = common_scripts\utility::getstruct( var_4.target, "targetname" );
        magicbullet( "nosound_magicbullet", var_4.origin, var_5.origin + ( var_1, var_2, var_3 ) );
        wait 0.05;
    }
}

_id_7CC8( var_0 )
{
    level._id_4877 maps\_utility::delaythread( 3.8, maps\_utility::play_sound_on_entity, "scn_prague_de50_chamber_price" );
    common_scripts\utility::flag_wait( "price_punch_dialog_02" );
    var_1 = getentarray( "e_bar_shelf_damage", "targetname" );

    foreach ( var_3 in var_1 )
    {
        radiusdamage( var_3.origin, 50, 50, 25 );
        physicsexplosionsphere( var_3.origin, 50, 25, 5 );
    }

    var_5 = getent( "bar_shelf_collapse", "targetname" );
    var_5 movez( 35, 0.05 );
    var_5 rotatepitch( 90, 0.5 );
    var_5 waittill( "movedone" );
    var_5 movez( -5, 0.05 );
    common_scripts\utility::flag_wait( "price_punch_dialog_03" );
}

_id_7CC9()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_1.angles = level.player getplayerangles();
    var_1 dontcastshadows();
    var_0 maps\_anim::_id_11CF( var_1, "price_punch" );
    var_1 hide();
    level thread _id_7CCA();
    level thread _id_7CCB();
    var_2 = getent( "trig_player_bar_door", "targetname" );
    var_2 common_scripts\utility::trigger_on();
    var_2 waittill( "trigger" );
    var_2 delete();
    common_scripts\utility::flag_set( "player_opened_door" );
    thread maps\_utility::_id_194E( "prague_bar_cellar_int" );
    level thread maps\prague_escape_flashback_sniper::_id_7C88();
    var_3 = getent( "sniper_stream_ent", "targetname" );
    level.player playersetstreamorigin( var_3.origin );
    level.player setstance( "stand" );
    level.player disableweapons();
    level.player takeallweapons();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    level.player allowads( 0 );
    maps\prague_escape_code::_id_7A5D();

    if ( isdefined( level._id_7CC3 ) )
        level._id_7CC3 notify( "stop_loop" );

    level._id_4877 maps\_utility::_id_24F5();
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level thread _id_7CCF();
    var_4 = 0.25;
    level.player playerlinktoblend( var_1, "tag_player", var_4, var_4 * 0.25, var_4 * 0.25 );
    wait(var_4);
    var_1 show();
    level.player playerlinktoabsolute( var_1, "tag_player" );
    level thread _id_7CCE( var_1 );
    var_5 = [];
    var_5[0] = level._id_4877;
    var_5[1] = var_1;
    var_5[2] = level._id_7BE8;
    var_6 = getentarray( "alley_btrs", "targetname" );
    common_scripts\utility::array_thread( var_6, maps\_utility::_id_2705 );
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    level._id_7CC3 = spawnstruct();
    level._id_7CC3.origin = var_0.origin;
    level._id_7CC3.angles = var_0.angles;
    level.player maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "scn_prague_player_downstairs" );
    level._id_7CC3 maps\_anim::_id_11DD( var_5, "price_punch" );
    var_5 = common_scripts\utility::array_remove( var_5, level._id_4877 );
    level._id_7CC3 maps\_anim::_id_11D0( level._id_4877, "price_punch" );
    var_1 delete();
    level._id_7BE8 delete();
    level._id_7BE9 delete();
}

_id_7CCA()
{
    common_scripts\utility::flag_wait( "bottles_go_boom" );
    wait 0.1;
    var_0 = common_scripts\utility::getstruct( "s_physics_0", "targetname" );
    physicsexplosionsphere( var_0.origin, 5, 5, 1 );
    var_1 = common_scripts\utility::getstruct( "s_physics_1", "targetname" );
    physicsexplosionsphere( var_1.origin, 5, 5, 1 );
    wait 0.25;
    var_2 = common_scripts\utility::getstruct( "s_physics_2", "targetname" );
    physicsexplosionsphere( var_2.origin, 5, 5, 1 );
    wait 0.25;
    var_3 = common_scripts\utility::getstruct( "s_physics_3", "targetname" );
    physicsexplosionsphere( var_3.origin, 5, 5, 1 );
}

_id_7CCB()
{
    var_0 = getent( "play_price_door_vo", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    var_1 = common_scripts\utility::getstruct( "s_physics_frame_door", "targetname" );
    physicsexplosionsphere( var_1.origin, 5, 5, 1 );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_yuriopenit" );
}

_id_7CCC( var_0 )
{
    level.player disableinvulnerability();
    maps\_utility::_id_1427( 1 );
    var_1 = common_scripts\utility::getstruct( "s_punch_magic_bullet", "targetname" );
    magicbullet( "nosound_magicbullet", var_1.origin, level.player.origin + ( 0.0, 0.0, 40.0 ) );
    level.player dodamage( 99, var_1.origin );
    maps\_utility::_id_261A( 1100 );
    var_2 = getent( "vh_alley_btr_1", "script_noteworthy" );

    if ( isdefined( var_2 ) )
        var_2 delete();

    var_3 = getent( "vh_alley_btr_2", "script_noteworthy" );

    if ( isdefined( var_3 ) )
        var_3 delete();

    level.player shellshock( "prague_escape", 5 );
    level.player playrumbleonentity( "grenade_rumble" );
    level.player playsound( "scn_prague_price_punch_face" );
    level.player thread maps\_utility::play_sound_on_entity( "breathing_hurt" );
    var_4 = 5;
    maps\prague_escape_code::_id_7A4C( 0.05 );
    level thread maps\prague_escape_code::_id_7A4F();
    maps\_utility::delaythread( 0.25, maps\prague_escape_code::_id_7A50 );
    setblur( 3, 3 );
    wait(var_4);
    setblur( 0, 3 );
    var_5 = common_scripts\utility::getstruct( "stair_top_pulse", "targetname" );
    physicsexplosionsphere( var_5.origin, 5, 5, 1 );
}

_id_7CCD( var_0 )
{
    level.player playrumblelooponentity( "tank_rumble" );
    common_scripts\utility::flag_wait( "stop_stair_rumble" );
    level.player stoprumble( "tank_rumble" );
}

_id_7CCE( var_0 )
{
    common_scripts\utility::flag_wait( "give_punch_headlook" );
    wait 2;
    common_scripts\utility::flag_set( "kill_window_bullets" );
    common_scripts\utility::flag_set( "start_no_sound_bullets" );
    var_1 = 0.25;
    level.player playerlinktoblend( var_0, "tag_player", var_1, var_1 * 0.25, var_1 * 0.25 );
    level.player playerlinktodelta( var_0, "tag_player", 0, 15, 15, 5, 5, 1 );
}

_id_7CCF()
{
    common_scripts\utility::flag_wait( "price_punch_dialog_03" );
    wait 5.3;
    level notify( "stop_no_sound_bullets" );
    level.player playsound( "scn_prague_flash_sniperescape" );
    thread maps\_utility::_id_194E( "prague_flashback_sniperescape" );
    maps\prague_escape_code::_id_7A46( "end_to_cellar", "start_no_time_scene", "prague_escape_sniper_outside", 0.25, 2, "presc_yri_firstmetmakarov" );
}
