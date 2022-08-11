// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7CD0()
{
    maps\_shg_common::move_player_to_start( "outro_player" );

    if ( !isdefined( level.player ) )
    {
        level.player = getentarray( "player", "classname" )[0];
        level.player._id_1032 = "player_rig";
    }

    _id_7CD3();
    maps\prague_escape_code::_id_7A3B( "price", "outro" );
    maps\prague_escape_code::_id_7A4B( "black" );
    maps\prague_escape_code::_id_7A4C( 0.1 );
    maps\prague_escape_code::_id_7A4F();
    maps\prague_escape_code::_id_7A5D();
    maps\_utility::_id_265A();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7CD1()
{
    level._id_2342 = undefined;
    _id_7CD4();
}

_id_7CD2()
{
    common_scripts\utility::flag_init( "begin_outro_anim" );
    common_scripts\utility::flag_init( "price_gun_to_head_dialog_02" );
    common_scripts\utility::flag_init( "price_gun_to_head_dialog_03" );
}

_id_7CD3()
{
    if ( !isdefined( level._id_4877 ) )
        maps\prague_escape_code::_id_7A3B( "price", "outro" );

    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    level._id_7A48 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    level._id_7A48.angles = level.player getplayerangles();
    level._id_7A48 dontcastshadows();
    level._id_7BF7 = [];
    level._id_7BF7[0] = level._id_7A48;
    level._id_7BF7[1] = level._id_4877;
    level._id_4877 maps\_utility::_id_24F5();
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    var_0 maps\_anim::_id_11BF( level._id_7BF7, "gun_to_head" );
}

_id_7CD4()
{
    level thread _id_7CD5();
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    common_scripts\utility::flag_wait( "begin_outro_anim" );
    objective_state_nomessage( level._id_7C0A, "done" );
    level thread maps\prague_escape_code::_id_7A60();
    var_1 = getent( "e_cellar_stream_ent", "targetname" );
    var_1 delete();
    level thread maps\_utility::_id_194E( "prague_bar_cellar_int" );
    level.player playerlinktodelta( level._id_7A48, "tag_player", 0, 10, 10, 7, 7, 1 );
    var_0 maps\_anim::_id_11DD( level._id_7BF7, "gun_to_head" );
}
#using_animtree("generic_human");

_id_7CD5()
{
    common_scripts\utility::flag_set( "begin_outro_anim" );

    if ( isdefined( level._id_7C85 ) )
        level._id_7C85 destroy();

    maps\prague_escape_code::_id_7A4C( 1 );
    maps\prague_escape_code::_id_7A50();
    var_0 = getanimlength( %ch_pragueb_16_1_gun_to_head_price );
    wait(var_0 - 1);
    maps\prague_escape_code::_id_7A4C( 0.8 );
    level thread maps\prague_escape_code::_id_7A4F();
    maps\_utility::_id_195A();
}

_id_7CD6( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_okyuri" );
    common_scripts\utility::flag_wait( "price_gun_to_head_dialog_02" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_boughtyourself" );
    common_scripts\utility::flag_wait( "price_gun_to_head_dialog_03" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_watchingyou" );
}
