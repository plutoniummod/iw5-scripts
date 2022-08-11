// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7B3A()
{
    maps\prague_escape_code::_id_7A3B( "soap", "scaffold" );
    maps\prague_escape_code::_id_7A3B( "price", "scaffold" );
    maps\_shg_common::move_player_to_start( "start_scaffold" );
    var_0 = getent( "fxanim_prague2_bell_tower_mod", "targetname" );
    var_0 hide();
    maps\_compass::setupminimap( "compass_map_prague_escape_sniper", "sniper_minimap_corner" );
    var_1 = getent( "bell_tower_sniper_rifle", "targetname" );
    var_1 delete();
    level._id_4877 maps\_utility::_id_2709( "m4m203_reflex", "back" );
    level._id_4877 maps\_utility::_id_104A( "m4m203_reflex", "primary" );
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7B3B()
{
    while ( common_scripts\utility::flag( "sniper_cover_blown" ) )
        wait 0.05;

    _id_7B3C();
    var_0 = _id_7B3D();
    _id_00C9();
    _id_7B3E( var_0 );
    _id_7B40();
    _id_7B48();
}

_id_00C9()
{
    var_0 = [ [ "trash_spiral_far_runner_prague_esc", ( 18745.4, 8796.03, -79.875 ) ], [ "trash_spiral_far_runner_prague_esc", ( 19946.9, 9179.49, -72.0 ) ], [ "trash_spiral_far_runner_prague_esc", ( 18981.3, 8054.98, -80.0 ) ], [ "trash_spiral_far_runner_prague_esc", ( 18303.2, 9894.09, -44.1296 ) ], [ "trash_spiral_far_runner_prague_esc", ( 19846.6, 7593.36, -72.0 ) ], [ "trash_spiral_far_runner_prague_esc", ( 20886.0, 9753.61, -72.0 ) ], [ "small_fire_far_prague_esc", ( 17101.4, 10208.3, -78.8362 ) ], [ "small_fire_far_prague_esc", ( 19566.3, 8045.61, -30.9095 ) ], [ "small_fire_far_prague_esc", ( 19366.6, 9680.44, -79.875 ) ], [ "medium_fire_far_prague_esc", ( 19398.9, 9795.79, -84.8909 ) ], [ "medium_fire_far_prague_esc", ( 18696.3, 8406.62, -83.0 ) ], [ "medium_fire_far_prague_esc", ( 17627.3, 9444.32, -79.875 ) ] ];
    _id_5F9E::_id_5F1A( var_0 );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "scaffold_use_limp_a" );
    common_scripts\utility::flag_init( "scaffold_use_limp_b" );
    common_scripts\utility::flag_init( "soap_injured_dialogue_2" );
    common_scripts\utility::flag_init( "soap_injured_dialogue_3" );
    common_scripts\utility::flag_init( "soap_injured_dialogue_4" );
    common_scripts\utility::flag_init( "scaffolding_fall_dialogue_2" );
    common_scripts\utility::flag_init( "scaffolding_fall_dialogue_3" );
}

_id_7B3C()
{
    maps\prague_escape_code::_id_7A4E();
    var_0 = getaiarray( "axis" );
    maps\_utility::_id_135B( var_0 );
    var_1 = getentarray( "scaffold_price_followers", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_7B59 );
    level.player enableinvulnerability();
}

_id_7B3D()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_belltower", "targetname" );
    var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_1.angles = level.player getplayerangles();
    level.player playerlinktodelta( var_1, "tag_player", 1, 10, 10, 10, 10, 0 );
    var_1 dontcastshadows();
    level._id_7AB4 = spawn( "script_model", var_1 gettagorigin( "tag_weapon" ) );
    level._id_7AB4.angles = var_1 gettagangles( "tag_weapon" );
    level._id_7AB4 setmodel( "viewmodel_rsass_sp_iw5" );
    level._id_7AB4 linkto( var_1, "tag_weapon" );
    level._id_7AB4 hidepart( "tag_clip", "viewmodel_rsass_sp_iw5" );
    level._id_7AB4 hidepart( "TAG_MOTION_TRACKER", "viewmodel_rsass_sp_iw5" );
    var_0 maps\_anim::_id_11CF( var_1, "scaffolding_fall" );
    level._id_4877 maps\_utility::delaythread( 1.6, maps\_utility::_id_168C, "presc_mkv_yurimyfriend" );
    return var_1;
}

_id_7B3E( var_0 )
{
    wait 1;
    level thread _id_7B3F();
    level thread _id_01FA();
    var_1 = common_scripts\utility::getstruct( "anim_align_belltower", "targetname" );
    var_2 = common_scripts\utility::getstruct( "anim_align_scaffold", "targetname" );
    var_3 = maps\_utility::_id_2766( "paris_debris_burnt_wood_panels_05", "debris_rubble_chunk_09", "ny_debris_rubble_chunk_01", "debris_wood_shard_large", "debris_wood_shard_med" );
    var_4 = [];
    var_5 = [];

    for ( var_6 = 0; var_6 < var_3.size; var_6++ )
    {
        var_4[var_6] = maps\_utility::_id_1287( "debris0" + ( var_6 + 1 ), var_2.origin );
        var_4[var_6].angles = var_1.angles;
        var_5[var_6] = spawn( "script_model", var_4[var_6].origin );
        var_5[var_6].angles = var_1.angles;
        var_5[var_6] setmodel( var_3[var_6] );
        var_5[var_6] linkto( var_4[var_6], "origin_animate_jnt" );
    }

    var_2 maps\_anim::_id_11BF( var_4, "scaffolding_fall" );
    var_7 = maps\_utility::_id_2766( var_0, level._id_54E0 );
    level.player maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "scn_prague_player_scaffold_fall" );
    var_8 = getanimlength( level._id_0C59["player_rig"]["scaffolding_fall"] );
    var_1 thread maps\_anim::_id_11DD( var_7, "scaffolding_fall" );
    var_2 thread maps\_anim::_id_11DD( var_4, "scaffolding_fall" );
    musicstop( 1 );
    wait(var_8 - 2);
    level thread maps\prague_escape_code::_id_7A4F();
    wait 2;
    level.player unlink();
    var_0 delete();
    maps\_utility::_id_135B( var_4 );
    maps\_utility::_id_135B( var_5 );
}

_id_01FA()
{
    wait 6.85;
    playfxontag( common_scripts\utility::getfx( "soap_steam" ), level._id_54E0, "J_HEAD" );
    wait 5;
    stopfxontag( common_scripts\utility::getfx( "soap_steam" ), level._id_54E0, "J_HEAD" );
}

_id_7B3F()
{
    var_0 = getanimlength( level._id_0C59["player_rig"]["scaffolding_fall"] );
    wait(var_0 - 5.5);
    level.player shellshock( "prague_escape", 25 );
}

_id_7B40()
{
    common_scripts\utility::exploder( 226 );
    var_0 = common_scripts\utility::getstruct( "anim_align_scaffold", "targetname" );
    var_1 = 2;
    level thread _id_7B47();
    level thread _id_7B45();
    level thread _id_7B44();
    var_2 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_2.angles = level.player getplayerangles();
    level.player._id_7A48 = var_2;
    var_3 = maps\_utility::_id_2766( var_2, level._id_54E0 );
    level.player._id_7A48 dontcastshadows();
    level.player playerlinktodelta( var_2, "tag_player", 1, 20, 20, 10, 10, 1 );
    common_scripts\utility::flag_set( "scaffold_use_limp_a" );
    level thread _id_7B41();
    level thread maps\prague_escape_code::_id_7A50();
    var_4 = getanimlength( level._id_0C59["player_rig"]["fade_in_a"] );
    level thread _id_7B46();
    common_scripts\utility::flag_set( "scaffold_use_limp_b" );
    var_4 = getanimlength( level._id_0C59["player_rig"]["fade_in_b"] );
    var_0 thread maps\_anim::_id_11DD( var_3, "fade_in_b" );
    wait(var_4 - var_1);
    level thread maps\prague_escape_code::_id_7A4F();
    wait(var_1);
    var_4 = getanimlength( level._id_0C59["player_rig"]["scaffold_soap_injured"] );
    var_3 = maps\_utility::_id_0BC3( var_3, level._id_4877 );
    level notify( "start_scaffold_soap_injured" );
    var_0 thread maps\_anim::_id_11DD( var_3, "scaffold_soap_injured" );
    level thread maps\prague_escape_code::_id_7A50();
    wait(var_4);
}

_id_7B41()
{
    maps\_utility::_id_27CA( "fountain_btr", ::_id_7B43 );
    maps\_vehicle::_id_2881( "shellshock_btr" );
    maps\_vehicle::_id_2881( "shellshock_chopper1" );
    maps\_utility::delaythread( 5, maps\_vehicle::_id_2881, "fountain_btr" );
    maps\_utility::delaythread( 5, maps\_vehicle::_id_2881, "shellshock_chopper2" );
    maps\_utility::delaythread( 3, maps\_vehicle::_id_2881, "shellshock_btr" );
    maps\_utility::delaythread( 6, maps\_vehicle::_id_2881, "shellshock_btr" );
    var_0 = common_scripts\utility::getstructarray( "dest_damage", "targetname" );

    foreach ( var_2 in var_0 )
        level thread _id_7B42( var_2.origin );
}

_id_7B42( var_0 )
{
    common_scripts\utility::flag_wait( "soap_picked_up" );
    var_1 = distancesquared( level.player.origin, var_0 );

    while ( var_1 > 90000 )
    {
        var_1 = distancesquared( level.player.origin, var_0 );
        wait 0.15;
    }

    radiusdamage( var_0, 50, 1000, 1000, level.player );
}

_id_7B43()
{
    level endon( "clear_path_loop_started" );
    thread maps\prague_escape_sniper::_id_5EC8( "clear_path_loop_started" );
    common_scripts\utility::flag_wait( "soap_picked_up" );

    for (;;)
    {
        var_0 = randomintrange( 400, 450 );
        self setturrettargetvec( level.player.origin + ( var_0, var_0, 0 ) );
        wait 1;
        _id_53A3();
        wait(randomfloatrange( 0.6, 1.4 ));
    }
}

_id_53A3()
{
    level endon( "clear_path_loop_started" );
    self endon( "death" );
    var_0 = randomintrange( 5, 12 );
    var_1 = 0.1;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        self fireweapon();
        wait(var_1);
    }
}

_id_7B44()
{
    var_0 = getentarray( "scaffold_price_followers", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_166F, 1 );
}

_id_7B45()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_scaffold", "targetname" );
    common_scripts\utility::flag_wait( "scaffold_use_limp_a" );
    var_0 thread maps\_anim::_id_1246( level._id_4877, "limp_a" );
    common_scripts\utility::flag_wait( "scaffold_use_limp_b" );
    var_0 maps\_anim::_id_1246( level._id_4877, "limp_b" );
}

_id_7B46()
{
    wait 3;
    var_0 = common_scripts\utility::getstruct( "scaffold_fall_price_run_start", "targetname" );
    playfx( level._effect["grenade_exp_concrete"], level._id_4877.origin );
}

_id_7B47()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_scaffold", "targetname" );
    var_1 = maps\_utility::_id_2766( "paris_debris_burnt_wood_panels_05", "debris_rubble_chunk_09", "ny_debris_rubble_chunk_01", "debris_wood_shard_large", "debris_wood_shard_med" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_2[var_3] = maps\_utility::_id_1287( "debris0" + ( var_3 + 1 ), var_0.origin );
        var_2[var_3].angles = var_0.angles;
        var_4 = spawn( "script_model", var_2[var_3].origin );
        var_4.angles = var_0.angles;
        var_4 setmodel( var_1[var_3] );
        var_4 linkto( var_2[var_3], "origin_animate_jnt" );
    }

    var_0 maps\_anim::_id_11BF( var_2, "scaffold_soap_injured" );
    level waittill( "start_scaffold_soap_injured" );
    var_0 maps\_anim::_id_11DD( var_2, "scaffold_soap_injured" );
}

_id_7B48()
{
    level.player disableinvulnerability();
}

_id_7B49( var_0 )
{
    settimescale( 0.25 );
}

_id_7B4A( var_0 )
{
    settimescale( 1 );
}

_id_7B4B( var_0 )
{
    var_1 = getent( "fxanim_prague2_bell_tower_mod", "targetname" );
    var_1 show();
}

_id_7B4C( var_0 )
{
    var_1 = getent( "fxanim_prague2_bell_tower_mod", "targetname" );
    var_1._id_1032 = "bell_tower";
    var_1 useanimtree( level._id_1245["script_model"] );
    level._id_54E0 stoploopsound();
    common_scripts\utility::exploder( 210 );
    var_1 maps\_anim::_id_1246( var_1, "bell_tower_explode" );
}

_id_7B4D( var_0 )
{
    var_1 = getent( "fxanim_prague2_bell_tower_scaf_mod", "targetname" );
    var_1._id_1032 = "scaffold";
    var_1 useanimtree( level._id_1245["script_model"] );
    common_scripts\utility::exploder( 227 );
    var_1 thread maps\_anim::_id_1246( var_1, "scaffold_break" );
    wait 5;
    common_scripts\utility::exploder( 224 );
}

_id_7B4E( var_0 )
{
    thread _id_7B4F();
    common_scripts\utility::flag_wait( "scaffolding_fall_dialogue_3" );
    level._id_7AB4 delete();
}

_id_7B4F()
{
    wait 1.5;
    level._id_54E0 playloopsound( "scn_prague_belltower_bomb_beep" );
    common_scripts\utility::exploder( 209 );
}

_id_7B50( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_soap" );
    common_scripts\utility::flag_wait( "soap_injured_dialogue_2" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_igotyouson" );
    common_scripts\utility::flag_wait( "soap_injured_dialogue_3" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_yuri" );
    common_scripts\utility::flag_wait( "soap_injured_dialogue_4" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_grabsoap" );
}

_id_7B51( var_0 )
{
    level.player thread maps\_utility::play_sound_on_entity( "scn_prague_belltower_bell_land" );
    common_scripts\utility::exploder( 225 );
    level thread _id_01FB();
    maps\prague_escape_code::_id_7A52();
}

_id_7B52( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "struct_soap_injured_explosion", "targetname" );
    magicgrenade( "fraggrenade", var_1.origin + ( 0.0, 0.0, 4.0 ), var_1.origin, 0.05 );
}

_id_7B53( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "price_203_car", "targetname" );
    maps\prague_escape_soap_carry::_id_7B38( var_1.origin );
}

_id_7B54( var_0 )
{
    common_scripts\utility::exploder( 220 );
}

_id_7B55( var_0 )
{
    maps\prague_escape_code::_id_7A53();
    common_scripts\utility::exploder( 221 );
}

_id_7B56( var_0 )
{
    maps\prague_escape_code::_id_7A53();
    common_scripts\utility::exploder( 229 );
}

_id_7B57( var_0 )
{
    common_scripts\utility::exploder( 230 );
}

_id_7B58( var_0 )
{
    common_scripts\utility::exploder( 231 );
}

_id_7B59()
{
    self waittill( "goal" );
    maps\prague_escape_code::_id_441E();
}

_id_7B5A( var_0 )
{
    level thread maps\_utility::_id_194E( "prague_city_courtyard_chase" );
}

_id_01FB()
{
    level._id_54E0 character\character_hero_europe_soap_injured::main();
}
