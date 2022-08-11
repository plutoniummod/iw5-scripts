// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5DE2()
{
    common_scripts\utility::flag_wait( "cavern_door_open" );
    common_scripts\utility::flag_set( "hard_targets_dead" );
    maps\_utility::_id_272C( "cavern_dying_guys" );
    thread _id_5E4C();
    thread _id_5E60();
    maps\_utility::_id_2826( "fireroom_fx_trigger" );
    var_0 = common_scripts\utility::get_target_ent( "cave_entrance_fire" );
    var_0 setlightintensity( var_0._id_5DE3 );
    var_0 notify( "stop_movement" );
    var_0 notify( "stop_flicker" );
    var_0 thread _id_5E83();
    thread maps\_utility::_id_11F4( "rescue_snd_getinside" );
    wait 0.1;
    var_1 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_123B );
    wait 0.1;

    if ( !isdefined( level._id_2817["open"] ) )
        objective_add( maps\_utility::_id_2816( "open" ), "current", &"RESCUE_2_OBJ_110" );

    level._id_2817["rescue_prez"] = level._id_2817["open"];
    objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), level._id_4877 );
    thread maps\_utility::_id_1428( "rescue_2_cave_entry", 0.0 );
    maps\_remotemissile::_id_3BE6( 0 );
    var_2 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_109E );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_2714 );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_1057 );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_26F3, 1 );
    maps\_utility::delaythread( 5, common_scripts\utility::array_thread, var_2, maps\_utility::_id_2713 );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_13A4, "r" );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_2736, 999 );
    wait 0.1;
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    maps\_utility::_id_26C0( "friendlies_enter_cavern" );
    maps\_utility::_id_265A( "allies" );
    wait 0.1;
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_2612, 0 );
    var_3 = getaiarray( "axis" );
    common_scripts\utility::flag_wait( "cavern_drop_down" );
    var_3 = maps\_utility::_id_1361( var_3 );
    var_3 = common_scripts\utility::array_removeundefined( var_3 );
    common_scripts\utility::array_call( var_3, ::delete );
    common_scripts\utility::waitframe();
    var_3 = getaiarray( "allies" );
    var_3 = common_scripts\utility::array_remove_array( var_3, var_2 );
    common_scripts\utility::waitframe();
    common_scripts\utility::array_call( var_3, ::delete );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_2715 );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_1071 );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_26F3, 0 );
}

_id_5DE4()
{
    common_scripts\utility::flag_wait( "start_cavern" );
    _id_4D78::_id_4CDD( maps\_utility::_id_2816( "rescue_prez" ), 1 );
    thread _id_5E61();
    thread _id_5DFB();
    level._id_4BC4 = 0.9;
    level._id_4CBE = 1;
    level notify( "stop_snow" );
    var_0 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2736, 0.6 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_109B );
    level waittill( "breaching" );
    maps\_utility::_id_1428( "rescue_2_breach", 1.5 );
    level waittill( "breach_explosion" );
    level.player._id_1FE1 = 0;
    objective_position( maps\_utility::_id_2816( "rescue_prez" ), ( 0.0, 0.0, 0.0 ) );
    level._id_59E0 = maps\_utility::_id_272F( "dead_daughter", 1 );
    level.player thread maps\_utility::_id_273C( 2, 60 );
    var_1 = level._id_4CDC[1];
    var_2 = var_1._id_4CD1._id_4CE8["active_breacher_rig"];
    var_3 = level.player common_scripts\utility::spawn_tag_origin();
    var_3 linkto( var_2, "tag_player" );
    level.player playerlinkto( var_3, "tag_origin", 1, 10, 30, 30, 30 );
    level waittill( "sp_slowmo_breachanim_done" );
    level.player thread maps\_utility::_id_273C( 6, 65 );
    wait 0.1;
    var_3 delete();
}

_id_5DE5()
{
    common_scripts\utility::flag_wait( "start_president_chase" );
    thread _id_5E05();
    thread _id_5DFE();
}

_id_5DE6()
{
    common_scripts\utility::flag_wait( "cavern_elevator_going_down_with_prez" );
    wait 2;
    common_scripts\utility::flag_wait( "start_cavern_rappel" );
    level._id_45C0 thread maps\_utility::_id_168C( "rescue_snd_hookup" );
    thread _id_5E08();
    thread _id_5E01();
    wait 1.5;
}

_id_5DE7()
{
    common_scripts\utility::flag_wait( "start_bottom_fight" );
    thread _id_5E82();
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "start_base_alarm" );
    var_0 = common_scripts\utility::get_target_ent( "cavern_president_breach_player_trigger" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = maps\_utility::_id_26C8();
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_13A4, "r" );
    level._id_4877 maps\_utility::_id_13A4( "p" );
    level._id_45C0 maps\_utility::_id_13A4( "b" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_109E );
    thread _id_524A::_id_5213( common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_l" ), common_scripts\utility::get_target_ent( "cavern_bottom_enemy_door_r" ) );
    maps\_utility::_id_272C( "cavern_bottom_1", 1 );
    thread _id_5DF5();
    thread _id_5DF7();
    wait 1.7;
    var_2 = common_scripts\utility::get_target_ent( "cavern_bottom_rpg_node" );
    var_3 = magicbullet( "rpg", var_2.origin, level.player.origin - ( 0.0, 0.0, 768.0 ) );
    var_4 = missile_createattractorent( level.player, 1200, 2048 );
    wait 5;
    missile_deleteattractor( var_4 );
    maps\_utility::_id_265B( "allies" );
}

_id_5DE8()
{

}

_id_5DE9()
{
    common_scripts\utility::flag_wait( "price_bang_on_door" );
    wait 0.5;
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_109E );
    maps\_utility::_id_262C( "cavern_bottom_player_upstairs" );
    _id_018D( "before_bottom_breach" );
    level._id_4877 maps\_utility::_id_2712();
    var_0 = common_scripts\utility::get_target_ent( "price_bottom_breach_node" );
    thread _id_5DEB( var_0, level._id_4877 );
    var_1 = [ level._id_45C0, level._id_45C4, level._id_4D86 ];
    var_2 = common_scripts\utility::getstructarray( "bottom_breach_plant_nodes", "targetname" );
    thread _id_5DEA();
    wait 3;
    level._id_4877 maps\_utility::_id_2713();

    foreach ( var_4 in var_1 )
    {
        wait 1;
        var_2 = sortbydistance( var_2, var_4.origin );
        var_5 = var_2[0];
        thread _id_5DEB( var_5, var_4 );
        var_2 = common_scripts\utility::array_remove( var_2, var_5 );
    }

    _id_5DF8();
    thread _id_5E11();
    thread _id_5E17();
}

_id_5DEA()
{
    level endon( "breach_explosion" );
    level._id_4877 waittill( "starting_anim" );
    wait 7;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_stackup2" );
}
#using_animtree("script_model");

_id_5DEB( var_0, var_1 )
{
    level endon( "breach_explosion" );
    var_1 maps\_utility::_id_123B();
    var_1._id_4CE9 = var_1 common_scripts\utility::spawn_tag_origin();
    var_1._id_4CE9 hide();
    var_0 thread _id_524A::_id_5220( var_1, var_0.animation );
    var_1 waittill( "starting_anim" );
    var_1._id_4CE9 setmodel( "mil_semtex_belt" );
    var_1._id_4CE9._id_1032 = "semtex";
    var_1._id_4CE9 useanimtree( #animtree );
    var_0 thread maps\_anim::_id_1246( var_1._id_4CE9, var_0.animation );
    var_0 waittill( var_0.animation );
    var_2 = getnodesinradiussorted( var_1.origin, 96, 0, 32 );
    var_1.a._id_0D26 = "crouch";
    var_1 setgoalnode( var_2[0] );
}

_id_5DEC()
{
    common_scripts\utility::flag_wait( "start_bottom_defend" );
    common_scripts\utility::exploder( "bridge_break" );
    maps\_utility::_id_26C2( "cavern_vision_trigger" );
    maps\_utility::_id_265B( "allies" );
    _id_5E5D();
    thread _id_5E1B();
    thread _id_5E1C();
    thread _id_5E1D();
    thread _id_5E1E();
    thread _id_5E5B();
    thread _id_5E6A();
    thread _id_5E84();
}

_id_5DED()
{
    common_scripts\utility::flag_wait( "cavern_run_to_heli" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2714 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2736, 6 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_109E );
    _id_5E5E();
    wait 0.1;
    maps\_utility::_id_26C0( "cavern_run_friendlies_lead" );
    thread maps\_spawner::_id_2135( getentarray( "cavern_run_chaser_2", "targetname" ) );
    thread _id_5E2C();
    thread _id_5E2F();
    thread _id_5E30();
    thread _id_5E41();
}

_id_5DEE()
{
    common_scripts\utility::flag_wait( "cavern_player_gets_on_heli" );
    thread _id_5E39();
    thread _id_5E86();
    common_scripts\utility::flag_wait( "start_delta_last_stand" );
    level.player common_scripts\utility::delaycall( 0, ::fadeoutshellshock );
    maps\_utility::_id_265A( "allies" );
    level._id_45C0 maps\_utility::_id_123B();
    level._id_45C0 maps\_utility::_id_2714();
    level._id_45C0 maps\_utility::_id_26F3( 1 );
    level._id_45C0 maps\_utility::_id_2612( 1 );
    var_0 = maps\_utility::_id_26C8();
    var_0 = common_scripts\utility::array_remove( var_0, level._id_4877 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_1057 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2714 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2736, 200 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_109B );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_13A4, "o" );
    level._id_45C4 maps\_utility::_id_13A4( "y" );
    maps\_utility::_id_26C0( "flyout_delta_pushup" );
    var_1 = common_scripts\utility::get_target_ent( "delta_ending_last_stand" );
    level._id_4D86 maps\_utility::_id_104A( "deserteagle", "sidearm" );
    level._id_45C0 maps\_utility::_id_104A( "deserteagle", "sidearm" );
    level._id_45C0 animscripts\shared::_id_0C9B( level._id_45C0.weapon, "left" );
    var_1 thread maps\_anim::_id_11DD( [ level._id_45C0, level._id_4D86, level._id_45C4 ], "ending_last_stand" );
    common_scripts\utility::flag_wait( "cavern_player_in_heli" );
    level.player disableslowaim();
    level._id_5DEF maps\_vehicle::_id_2A12();
    level._id_5DEF setturningability( 1 );
    level._id_5DEF sethoverparams( 128, 20, 20 );
    level._id_5DEF vehicle_setspeedimmediate( 1, 30, 60 );
    level._id_5DEF maps\_vehicle::_id_26A1( common_scripts\utility::get_target_ent( "cavern_heli_leave" ) );
    wait 3;
    thread _id_5320( "heli_near_miss_1", "rpg_dirt_impact" );
    maps\_utility::delaythread( 0.8, ::_id_5320, "heli_near_miss_2", "rpg_dirt_impact" );
    maps\_utility::delaythread( 1.8, ::_id_5320, "heli_near_miss_3" );
    maps\_utility::delaythread( 2.8, ::_id_5320, "heli_near_miss_4" );
    level.player notify( "stop_breathing" );
    thread _id_524A::_id_17CC( 2 );
    level.player setblurforplayer( 0, 3 );
    wait 0.4;
    level._id_5DEF sethoverparams( 0, 0, 0 );
    var_2 = level._id_5DEF maps\_vehicle::_id_2A8D();
    playfxontag( common_scripts\utility::getfx( "lights_strobe_red_dist_max" ), var_2, "tag_light_cargo01" );
    var_2 thread common_scripts\utility::play_loop_sound_on_entity( "scn_missile_warning" );
    var_2._id_1032 = "blackhawk";
    var_3 = _id_5E75();
    var_3 linkto( var_2, "tag_ground" );
    level.player disableweapons();
    var_2 thread maps\_anim::_id_1246( var_2, "dodge" );
    earthquake( 0.3, 4, level.player.origin, 1024 );
    wait 2;
    var_4 = maps\_utility::_id_272C( "cavern_end_drone_flood" );
    maps\_utility::delaythread( 0, common_scripts\utility::array_thread, var_4, maps\_utility::_id_1DAA, "move" );
    maps\_utility::delaythread( 2.5, common_scripts\utility::exploder, 200 );
    maps\_utility::delaythread( 2.5, common_scripts\utility::exploder, 199 );
    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_5 );
    var_5 rotateto( ( 20.0, 0.0, 0.0 ), 2 );
    wait 2;
    stopfxontag( common_scripts\utility::getfx( "lights_strobe_red_dist_max" ), var_2, "tag_light_cargo01" );
    var_2 common_scripts\utility::stop_loop_sound_on_entity( "scn_missile_warning" );
    level.player common_scripts\utility::delaycall( 2, ::enableweapons );
    var_2 waittill( "dodge" );
    var_6 = var_2 gettagorigin( "origin_animate_jnt" );
    var_7 = var_2 gettagangles( "origin_animate_jnt" );
    level._id_5DEF vehicle_teleport( var_6, var_7 );
    wait 0.05;
    level._id_5DEF maps\_vehicle::_id_2A95();
    var_3 linkto( level._id_5DEF, "tag_ground" );
    wait 1.5;
    var_8 = missile_createrepulsorent( level._id_5DEF, 3000, 5000 );
    level._id_5DEF sethoverparams( 128, 20, 20 );
    wait 0.1;
    level._id_5DEF setturningability( 0.2 );
    level._id_5DEF thread maps\_vehicle::_id_26A1( common_scripts\utility::get_target_ent( "cavern_heli_fly_out" ) );
    level._id_5DEF vehicle_setspeedimmediate( 15, 5, 60 );
    var_9 = getentarray( "cavern_bottom_barriers", "targetname" );
    common_scripts\utility::array_call( var_9, ::delete );
    maps\_utility::_id_272C( "cavern_end_drone_flood_3" );
    maps\_utility::_id_272C( "cavern_run_chaser_3" );
    level._id_5DEF setyawspeedbyname( "fast" );
    maps\_utility::delaythread( 0.2, ::_id_5DF2 );
    maps\_utility::delaythread( 0.2, ::_id_5DF3 );
    maps\_utility::delaythread( 3.2, ::_id_5DF4 );
    maps\_utility::delaythread( 6.2, ::_id_5DF4 );
    wait 2;
    maps\_utility::_id_272C( "prez_heli_ambush" );
    maps\_utility::_id_272C( "cavern_end_drone_flood_2" );
    common_scripts\utility::exploder( 201 );
    level._id_5DEF vehicle_setspeedimmediate( 15, 5, 60 );
    _id_5E21();
    maps\_utility::delaythread( 2, common_scripts\utility::exploder, 202 );
    level.player maps\_utility::delaythread( 5, maps\_utility::vision_set_fog_changes, "mine_exterior", 4 );
    common_scripts\utility::flag_wait( "cavern_restart_snow" );
    common_scripts\utility::exploder( "heli_exit_final" );
    maps\_vehicle::_id_2A9A( "heli_flyout_lb1" );
    level notify( "stop_earthquakes" );
    level._id_5D8E = ( 0.0, 0.0, 0.0 );
    level._id_5D90 = 0.2;
    level._id_5D8F = common_scripts\utility::getfx( "snow_flurry" );
    thread maps\rescue_2_code::_id_5D8D();
    maps\_utility::delaythread( 1.7, common_scripts\utility::exploder, 500 );
    objective_state( maps\_utility::_id_2816( "escape" ), "done" );
    var_10 = getdvarint( "newscast_slow", 0 );
    var_11 = 8;
    common_scripts\utility::array_thread( [ level._id_45C0, level._id_4D86, level._id_45C4 ], maps\_utility::_id_1902 );

    if ( var_10 )
        thread _id_5DF0();

    wait 1.5;
    common_scripts\utility::array_call( [ level._id_45C0, level._id_4D86, level._id_45C4 ], ::delete );
    level.player allowfire( 0 );
    level.player thread maps\_utility::vision_set_fog_changes( "rescue_2_sunblind", var_11 );
    wait 3.5;
    var_12 = maps\_hud_util::_id_09A7( "white", 0, level.player );
    var_12.sort = -1;
    var_12.foreground = 0;
    var_12 fadeovertime( 1 );
    var_12.alpha = 1;
    wait 2;

    if ( !var_10 )
        thread _id_5DF1();
}

_id_5DF0()
{
    maps\_utility::delaythread( 0, ::_id_5E80 );
    wait 1.5;
    settimescale( 0.2 );
    wait 1;
    maps\_utility::_id_11F4( "rescue_nws_gatheredtoday" );
    level._id_5DEF vehicle_turnengineoff();
    wait 0.2;
    maps\_utility::_id_11F4( "rescue_nws_reportsconfirm" );
    wait 0.5;
    maps\_utility::_id_11F4( "rescue_nws_othernews" );
    wait 0.5;
    maps\_utility::_id_195A();
}

_id_5DF1()
{
    maps\_utility::delaythread( 0, ::_id_5E80 );
    maps\_utility::_id_11F4( "rescue_nws_gatheredtoday" );
    wait 0.4;
    maps\_utility::_id_11F4( "rescue_nws_reportsconfirm" );
    wait 1;
    maps\_utility::_id_11F4( "rescue_nws_othernews" );
    wait 1;
    maps\_utility::_id_195A();
}

_id_5DF2()
{
    level endon( "cavern_restart_snow" );

    for (;;)
    {
        var_0 = anglestoright( level._id_5DEF.angles ) * -1;
        thread common_scripts\utility::play_sound_in_space( "scn_prague_tank_alley_exp", level.player.origin + ( 0.0, 0.0, 256.0 ) );
        playfx( common_scripts\utility::getfx( "falling_fire_debris_rescue" ), level._id_5DEF.origin + var_0 * 400 + ( 0.0, 0.0, 512.0 ) );
        playfx( common_scripts\utility::getfx( "ceiling_rock_collapse_big_spread" ), level._id_5DEF.origin + var_0 * 400 + ( 128.0, 128.0, 512.0 ), ( 0.0, 0.0, -1.0 ) );
        playfx( common_scripts\utility::getfx( "ceiling_rock_collapse_big_spread" ), level._id_5DEF.origin + var_0 * 400 + ( -128.0, -128.0, 512.0 ), ( 0.0, 0.0, -1.0 ) );
        wait 1;
    }
}

_id_5DF3()
{
    level endon( "cavern_restart_snow" );

    for (;;)
    {
        var_0 = anglestoright( level._id_5DEF.angles ) * -1;
        var_1 = level._id_5DEF.origin + var_0 * 200;
        var_2 = anglestoforward( level._id_5DEF.angles );
        var_3 = var_1 + var_2 * 150;
        var_4 = var_1 - var_2 * 150;
        playfx( common_scripts\utility::getfx( "cave_mouth_wall_spark_blast_rescue" ), var_3, -1 * var_2 );
        wait 0.1;
        playfx( common_scripts\utility::getfx( "cave_mouth_wall_spark_blast_rescue" ), var_4, var_2 );
        wait 3;
    }
}

_id_5DF4()
{
    var_0 = anglestoright( level._id_5DEF.angles ) * -1;
    var_1 = level._id_5DEF.origin + var_0 * 200;
    var_2 = anglestoforward( level._id_5DEF.angles );
    var_3 = var_1 + var_2 * 150;
    var_4 = var_1 - var_2 * 150;
    playfx( common_scripts\utility::getfx( "ambient_debris_blasts_rescue" ), var_3, -1 * var_2 );
}

_id_5DF5()
{
    level._id_4D86 thread maps\_utility::_id_168C( "rescue_rno_theretheyare" );
    level._id_45C4 maps\_utility::delaythread( 1.3, maps\_utility::_id_168C, "rescue_rno_thereitis" );
    maps\_utility::_id_262C( "bottom_fight_approach" );
    _id_018D( "cavern_bottom" );
    common_scripts\utility::flag_wait( "player_can_see_cavern_door" );
    wait 2;
    level._id_45C4 thread maps\_utility::_id_168C( "rescue_trk_blastdoors" );
}

_id_5DF6()
{
    level endon( "cavern_bottom_search" );
    _id_524A::_id_520E( "bottom_fight_volume" );
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_clear2" );
    common_scripts\utility::flag_set( "cavern_bottom_search" );
}

_id_5DF7()
{
    common_scripts\utility::flag_wait( "cavern_bottom_friendlies_goto_door" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2736, 999 );
    thread _id_5DF6();
    common_scripts\utility::flag_clear( "start_base_alarm" );
    common_scripts\utility::flag_wait( "cavern_bottom_search" );
    _id_018D( "cavern_search" );
    var_0 = common_scripts\utility::get_target_ent( "price_bang_door" );
    level._id_4877.ignoreall = 1;
    level._id_4877 maps\_utility::_id_2712();
    level._id_45C4 maps\_utility::delaythread( 0.5, maps\_utility::_id_168C, "rescue_trk_throughdoor" );
    var_0 maps\_anim::_id_11C4( level._id_4877, "rescue_blocked_door" );
    var_0 thread maps\_anim::_id_11C1( level._id_4877, "rescue_blocked_door" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_123B );
    wait 0.5;
    level._id_4877 maps\_utility::_id_2686();
    wait 0.5;
    maps\_utility::_id_26C0( "cavern_bottom_breach_stack" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_cantbreak" );
    level._id_4877 maps\_utility::_id_2713();
    level._id_4877.ignoreall = 0;
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level._id_4877 pushplayer( 1 );
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_brightideas" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_breachuptop" );
    objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), level._id_4877 );
    maps\_utility::delaythread( 0.5, common_scripts\utility::array_thread, maps\_utility::_id_26C8(), maps\_utility::_id_2686 );
    maps\_utility::_id_26C0( "cavern_bottom_breach_stack" );
    common_scripts\utility::flag_set( "price_bang_on_door" );
    common_scripts\utility::flag_wait( "start_bottom_defend" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2736, 0.5 );
}

_id_5DF8()
{
    var_0 = common_scripts\utility::get_target_ent( "cavern_president_breach_player_trigger" );
    var_0 common_scripts\utility::trigger_on();
    objective_position( maps\_utility::_id_2816( "rescue_prez" ), level._id_5DF9.origin );
    objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), &"SCRIPT_WAYPOINT_BREACH" );
    level._id_5DF9._id_5DFA show();
    level._id_5DF9 hide();
}

_id_5DFB()
{
    common_scripts\utility::flag_wait( "start_chase" );
    _id_5DFC( 60, "start_president_chase", 40 );
    _id_5DFC( 60, "start_cavern_rappel", 25 );
    _id_5DFC( 30, "player_mount_rappel", 6, "rescue_snd_stopwasting" );
    _id_5DFC( 90, "start_bottom_fight", 50 );
    _id_5DFC( 90, "player_can_see_cavern_door", 40 );
    _id_5DFC( 90, "cavern_bottom_friendlies_goto_door", 40 );
    _id_5DFC( 25, "cavern_bottom_search", 0 );
    _id_5DFC( 45, "bottom_breach_started", 25 );
}

_id_5DFC( var_0, var_1, var_2, var_3 )
{
    if ( common_scripts\utility::flag( var_1 ) )
        return;

    level endon( var_1 );
    childthread _id_5DFD( var_2, var_3 );
    common_scripts\utility::flag_set( "lots_of_time" );
    wait(var_0 / 2);
    common_scripts\utility::flag_clear( "lots_of_time" );
    wait(var_0 / 2);
    var_4 = &"RESCUE_2_PRESIDENT_GOT_AWAY";
    setdvar( "ui_deadquote", var_4 );
    maps\_utility::_id_1826();
}

_id_5DFD( var_0, var_1 )
{
    wait(var_0);

    for (;;)
    {
        if ( isdefined( var_1 ) )
        {
            wait 9;
            maps\_utility::_id_11F4( var_1 );
        }

        wait 9;
        level._id_45C0 maps\_utility::_id_168C( "rescue_snd_thisway" );
        wait 9;
        level._id_45C0 maps\_utility::_id_168C( "rescue_snd_losinghim" );
    }
}

_id_5DFE()
{
    common_scripts\utility::flag_wait( "start_president_chase" );
    level._id_5DFF = 0;
    var_0 = maps\_utility::_id_272C( "president_crew" );
    common_scripts\utility::array_thread( var_0, ::_id_5E02 );
    common_scripts\utility::flag_wait( "cavehole_reveal" );

    while ( level._id_5DFF < var_0.size )
        wait 0.05;

    common_scripts\utility::flag_set( "cavern_elevator_going_down_with_prez" );
    level notify( "close_cavern_elevator" );
    wait 0.6;
    level._id_5E00 movez( -4000, 15, 5 );
    level._id_5E00 waittill( "movedone" );
    common_scripts\utility::array_call( var_0, ::delete );
    level._id_5DFF = undefined;

    if ( !common_scripts\utility::flag( "start_cavern_rappel" ) )
    {
        objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), level._id_4877 );
        objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), "" );
    }
}

_id_5E01()
{
    common_scripts\utility::flag_wait( "player_starts_rappel" );
    var_0 = common_scripts\utility::get_target_ent( "president_objective_node" );
    var_0 thread _id_0189();
    var_1 = undefined;
    var_2 = maps\_utility::_id_272C( "president_crew_bottom" );

    foreach ( var_4 in var_2 )
    {
        if ( issubstr( var_4.model, "president" ) )
        {
            var_1 = var_4;
            objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), var_4 );
            objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), &"RESCUE_2_ICON_RESCUE" );
        }
    }

    var_1 waittill( "death" );
    objective_position( maps\_utility::_id_2816( "rescue_prez" ), var_0.origin );
    objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), "" );
    common_scripts\utility::flag_wait( "player_can_see_cavern_door" );
    var_6 = common_scripts\utility::get_target_ent( "cavern_big_door_l" );
    var_7 = var_6 common_scripts\utility::get_linked_ent();
    var_7 linkto( var_6 );
    var_8 = common_scripts\utility::get_target_ent( "cavern_big_door_r" );
    var_7 = var_8 common_scripts\utility::get_linked_ent();
    var_7 linkto( var_8 );
    var_6 rotateyaw( 90, 9, 0, 1 );
    var_8 rotateyaw( -90, 9, 0, 1 );
    wait 4;
    var_0 notify( "doors_closed" );
    wait 7;
    var_9 = getentarray( "redlight", "targetname" );
    common_scripts\utility::array_call( var_9, ::setlightintensity, 0 );
}

_id_0189()
{
    self endon( "doors_closed" );
    var_0 = bullettrace( self.origin, self.origin - ( 0.0, 0.0, 256.0 ), 0 );
    self.trigger = spawn( "trigger_radius", var_0["position"], 0, 700, 128 );
    self.trigger waittill( "trigger" );
    var_1 = anglestoforward( level.player.angles );
    level.player dodamage( 60, level.player.origin + var_1 );
    wait 0.3;
    var_1 = anglestoforward( level.player.angles );
    maps\_fx::grenadeexplosionfx( level.player.origin + var_1 * 128 );
    wait 0.3;
    maps\_fx::grenadeexplosionfx( level.player.origin + var_1 * 128 );
    level.player setstance( "prone" );
    level.player shellshock( "rescue_chopper_drag", 5 );
}

_id_5E02()
{
    if ( issubstr( self.model, "president" ) )
    {
        objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), self );
        objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), &"RESCUE_2_ICON_RESCUE" );
    }

    self notsolid();
    self waittill( "goal" );
    level._id_5DFF += 1;
    self linkto( level._id_5E00 );
}

_id_5E03()
{
    maps\_utility::_id_262B( "cavern_moving_to_rappel", "script_noteworthy" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2736, 999 );
    var_0 = common_scripts\utility::get_target_ent( "cavern_kick_upper_door" );
    var_1 = common_scripts\utility::get_target_ent( "cavern_kick_upper_door_node" );
    level._id_4D86 maps\_utility::_id_123B();
    var_1 maps\_anim::_id_11C4( level._id_4D86, "doorkick_2_cqbrun" );
    var_0 thread _id_524A::_id_5212( undefined, 0.5 );
    var_1 maps\_anim::_id_11C2( level._id_4D86, "doorkick_2_cqbrun" );
    level._id_4D86 maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "start_bottom_fight" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2736, 0.5 );
}

_id_5E04()
{
    var_0 = common_scripts\utility::get_target_ent( "bridge_blocker" );
    var_0 notsolid();
    var_0 connectpaths();
    var_1 = common_scripts\utility::get_target_ent( "heli_crash_heli" );
    common_scripts\utility::flag_wait( "cavern_elevator_going_down_with_prez" );
    var_2 = common_scripts\utility::get_target_ent( "chopper_crash_node" );
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = var_2.origin;
    var_3 maps\_utility::_id_274F( 0.6, 4, 1, 8 );
    var_3 delete();
    common_scripts\utility::exploder( 100 );
    var_4 = common_scripts\utility::get_target_ent( "heli_crash_rpg_node" );
    var_5 = var_4 common_scripts\utility::get_target_ent();
    magicbullet( "rpg", var_4.origin + ( randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ) ), var_5.origin + ( randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ) ) );
    wait 0.3;
    magicbullet( "rpg", var_4.origin + ( randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ) ), var_5.origin + ( randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ) ) );
    wait 0.4;
    magicbullet( "rpg", var_4.origin + ( randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ) ), var_5.origin + ( randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ), randomfloatrange( 0, 200 ) ) );
    wait 0.4;
    maps\_utility::_id_26BF( "spawn_cavern_3" );
    var_1 show();
    var_1 playloopsound( "hind_helicopter_dying_loop" );
    var_1 thread _id_5E43();
    var_1 moveto( var_2.origin, 1.5, 1 );
    var_1 waittill( "movedone" );
    playfx( common_scripts\utility::getfx( "heli_crash" ), var_2.origin );
    common_scripts\utility::exploder( "bridge_break" );
    thread common_scripts\utility::play_sound_in_space( "hind_helicopter_crash_dist", var_1.origin );
    var_0 solid();
    var_0 disconnectpaths();
    var_6 = getaiarray( "axis" );

    foreach ( var_8 in var_6 )
    {
        if ( distance( var_8.origin, var_2.origin ) < 512 )
        {
            var_8._id_0D50 = common_scripts\utility::random( level._id_5327 );
            var_8 kill();
        }
    }

    earthquake( 0.6, 0.5, var_2.origin, 10000 );
    var_2 = var_2 common_scripts\utility::get_target_ent();
    var_1 moveto( var_2.origin, 0.5, 0 );
    var_1 waittill( "movedone" );
    var_1 stoploopsound( "hind_helicopter_dying_loop" );
    thread common_scripts\utility::play_sound_in_space( "hind_helicopter_crash_close", var_1.origin );
    earthquake( 0.9, 0.8, var_2.origin, 10000 );
    playfx( common_scripts\utility::getfx( "heli_explosion" ), var_2.origin );
    var_1 delete();
    _id_018D( "chopper_crash" );
    wait 2;
    var_10 = getcorpsearray();

    foreach ( var_12 in var_10 )
    {
        if ( distance2d( var_12.origin, var_2.origin ) < 1024 )
            var_12 delete();
    }
}

_id_5E05()
{
    common_scripts\utility::flag_wait( "cavehole_reveal" );
    maps\_utility::_id_265A( "allies" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_onthecatwalk" );
    wait 0.2;
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_thereheis" );
    wait 0.2;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_nottoolate" );
    maps\_utility::_id_265B( "allies" );
}

_id_5E06()
{
    self moveto( self.origin, 0.05 );
}

_id_5E07()
{
    level endon( "stop_elevator_sparks" );
    var_0 = maps\_utility::_id_1BF9( "cavern_elevator_spark", "targetname" );

    for (;;)
    {
        var_1 = common_scripts\utility::random( var_0 );
        playfx( common_scripts\utility::getfx( "electrical_transformer_sparks_a" ), var_1.origin );
        thread common_scripts\utility::play_sound_in_space( "scn_spark_explosion", var_1.origin );
        wait(randomfloatrange( 0.1, 0.6 ));
    }
}

_id_5E08()
{
    level._id_5E09 = 0;
    thread _id_5E0D();
    var_0 = maps\_utility::_id_26C8();
    var_1 = maps\_utility::_id_1BF9( "cavern_rappel_nodes", "targetname" );
    var_1 = sortbydistance( var_1, level._id_5E00.origin );
    level._id_018A["left"] = [ "rappel", "rappel_2" ];
    level._id_018A["right"] = [ "rappel", "rappel_2" ];
    common_scripts\utility::array_thread( var_1, ::_id_5E0A );
    var_2 = 0;
    var_0 = sortbydistance( var_0, var_1[0].origin );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_0[var_3] thread _id_5E0F( var_1[var_1.size - var_3 - 1], var_2 );
        var_2 += 0.5;
    }
}

_id_5E0A()
{
    self._id_5E0C = maps\_utility::_id_1287( "rappelrope" );
    thread maps\_anim::_id_11CF( self._id_5E0C, "rappel_" + self.script_noteworthy + "_mount" );
    self._id_5E0C hide();
}

_id_5E0D()
{
    var_0 = common_scripts\utility::get_target_ent( "player_rappel_node" );
    var_1 = common_scripts\utility::get_target_ent( "player_rappel_bar" );
    var_1 show();
    var_2 = common_scripts\utility::get_target_ent( "player_rappel_bar_normal" );
    var_2 hide();
    var_3 = level._id_5E0E common_scripts\utility::get_target_ent();
    objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), "" );
    objective_position( maps\_utility::_id_2816( "rescue_prez" ), var_3.origin );
    level._id_5E0E common_scripts\utility::trigger_on();
    level._id_5E0E sethintstring( &"PLATFORM_HOLD_TO_USE" );
    level._id_5E0E waittill( "trigger" );
    common_scripts\utility::flag_set( "player_mount_rappel" );
    objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), level._id_4877 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
    level._id_5E0E delete();
    level.player disableweapons();
    var_1 delete();
    var_2 show();
    var_4 = maps\_utility::_id_1287( "rope" );
    var_5 = maps\_utility::_id_1287( "carabiner" );
    var_6 = maps\_utility::_id_1287( "player_legs" );
    var_4 show();
    var_7 = _id_524A::_id_51F1();
    var_8 = [ var_7, var_4, var_5, var_6 ];
    level.player playerlinktoblend( var_7, "tag_player", 0.3 );
    var_9 = maps\_utility::_id_26C8();

    foreach ( var_11 in var_9 )
    {
        var_11 common_scripts\utility::delaycall( 1, ::hide );
        var_11 common_scripts\utility::delaycall( 1.5, ::show );
        var_11 maps\_utility::delaythread( 1 + randomfloatrange( 0, 0.5 ), maps\_utility::_id_1DAA, "start_rappel" );
    }

    var_0 maps\_anim::_id_11DD( var_8, "rappel_1" );
    level.player playerlinktodelta( var_7, "tag_player", 1, 20, 20, 40, 40 );
    var_13 = getaiarray( "axis" );
    common_scripts\utility::array_call( var_13, ::delete );
    common_scripts\utility::flag_set( "player_starts_rappel" );
    var_0 maps\_utility::script_delay();
    maps\_utility::delaythread( 3, maps\_utility::_id_194E, "rescue_2_cavern", 4 );
    var_0 thread maps\_anim::_id_11DD( var_8, "rappel_2" );

    while ( var_7 getanimtime( var_7 maps\_utility::_id_1281( "rappel_2" ) ) < 0.865 )
        wait 0.05;

    level.player unlink();
    level.player enableweapons();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    var_7 delete();
    var_6 delete();
    var_8 = common_scripts\utility::array_removeundefined( var_8 );
    _id_018D( "cavern_bottom" );
    wait 10;

    foreach ( var_15 in var_8 )
        var_15 delete();
}

_id_5E0F( var_0, var_1 )
{
    self endon( "start_rappel" );
    thread _id_5E10( var_0 );
    wait(var_1);
    var_2 = "rappel_" + var_0.script_noteworthy + "_mount";
    var_0 maps\_anim::_id_11C4( self, var_2 );
    var_0._id_5E0C common_scripts\utility::delaycall( 1.5, ::show );
    var_0 thread maps\_anim::_id_1246( var_0._id_5E0C, var_2 );
    var_0 maps\_anim::_id_11C1( self, var_2 );
    self notify( "start_rappel" );
}

_id_5E10( var_0 )
{
    self waittill( "start_rappel" );
    var_0._id_5E0C show();
    var_0 thread maps\_anim::_id_124E( var_0._id_5E0C, "rappel_idle_" + var_0.script_noteworthy );
    var_0 thread maps\_anim::_id_11C8( self, "rappel_idle_" + var_0.script_noteworthy );
    level._id_5E09 += 1;
    common_scripts\utility::flag_wait( "player_starts_rappel" );
    var_0 maps\_utility::script_delay();
    var_0 notify( "stop_first_frame" );
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::_id_1246( var_0._id_5E0C, "rappel" );
    var_1 = level._id_018A[var_0.script_noteworthy][0];
    level._id_018A[var_0.script_noteworthy] = common_scripts\utility::array_remove( level._id_018A[var_0.script_noteworthy], var_1 );
    maps\_anim::_id_11C1( self, var_1 );

    if ( var_0.script_noteworthy == "right" )
        maps\_anim::_id_11C1( self, "readystand_trans_2_run_2" );
    else
        maps\_anim::_id_11C3( self, "readystand_trans_2_run_8" );

    wait 20;
    var_0._id_5E0C delete();
}

_id_5E11()
{
    level._id_4BC4 = 8.5;
    level._id_4CBE = 0;
    var_0 = common_scripts\utility::get_target_ent( "cavern_president_breach_player_trigger" );
    var_0 sethintstring( &"SCRIPT_PLATFORM_BREACH_ACTIVATE" );
    var_0 waittill( "trigger" );
    level._id_5DF9._id_5DFA delete();
    objective_position( maps\_utility::_id_2816( "rescue_prez" ), ( 0.0, 0.0, 0.0 ) );
    objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), "" );
    common_scripts\utility::flag_set( "bottom_breach_started" );
    level.player disableweapons();
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2612, 1 );
    var_0 common_scripts\utility::trigger_off();
    var_1 = level._id_5DF9 common_scripts\utility::spawn_tag_origin();
    var_2 = _id_524A::_id_51F1();
    var_2 hide();
    var_1 thread maps\_anim::_id_11CF( var_2, "floor_breach" );
    level notify( "breach_explosion" );
    var_3 = maps\_utility::_id_26C8();

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5._id_4CE9 ) )
            var_5._id_4CE9 delete();
    }

    common_scripts\utility::array_call( maps\_utility::_id_26C8(), ::stopanimscripted );
    maps\_utility::_id_265A( "allies" );
    level._id_4D13 = 0.33;
    var_7 = 0.5;
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
    level.player playerlinktoblend( var_2, "tag_player", 0.5 );
    var_2 common_scripts\utility::delaycall( 0.5, ::show );
    level._id_5DF9 common_scripts\utility::delaycall( 0.5, ::show );
    var_1 maps\_anim::_id_11DD( [ level._id_5DF9, var_2 ], "floor_breach" );
    var_2 hide();
    wait 0.2;
    common_scripts\utility::flag_set( "no_mercy" );
    maps\_utility::_id_27CA( "president_breach_spawners", ::_id_5E57 );
    maps\_utility::_id_272C( "president_breach_spawners" );
    thread _id_4D78::_id_4BC3();
    thread maps\_utility::_id_1427( 2 );
    thread _id_5E13();
    wait 0.5;
    var_8 = maps\_utility::_id_27BA();
    common_scripts\utility::array_call( var_8, ::delete );
    level.player common_scripts\utility::delaycall( 0.3, ::enableweapons );
    var_1 delete();
    var_1 = common_scripts\utility::get_target_ent( "cavern_president_breach_player_node" );
    var_1 = var_1 common_scripts\utility::get_target_ent();
    var_9 = 1.5;
    level.player common_scripts\utility::delaycall( 0.3, ::playerlinktodelta, var_2, "tag_player", 1, 30, 30, 30, 30 );
    var_2 moveto( ( var_2.origin[0], var_2.origin[1], var_1.origin[2] ), var_9, var_9 );
    wait 0.4;
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    var_2 waittill( "movedone" );
    level.player setstance( "crouch" );
    common_scripts\utility::array_thread( [ level._id_4D86, level._id_45C4 ], maps\_utility::_id_2686 );
    maps\_utility::_id_26C0( "cavern_bottom_breach_stack" );
    wait 0.05;
    var_1 = common_scripts\utility::get_target_ent( "price_breach_teleport" );
    level._id_4877 forceteleport( var_1.origin, var_1.angles );
    level._id_4877 setgoalpos( var_1.origin );
    level._id_4877 allowedstances( "stand" );
    var_1 = common_scripts\utility::get_target_ent( "sandman_breach_teleport" );
    level._id_45C0 forceteleport( var_1.origin, var_1.angles );
    level._id_45C0 setgoalpos( var_1.origin );
    level._id_45C0 allowedstances( "stand" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_26F3, 1 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2612, 0 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1057 );
    level.player unlink();
    var_10 = getaiarray( "axis" );

    foreach ( var_12 in var_10 )
    {
        level._id_4877 getenemyinfo( var_12 );
        level._id_45C0 getenemyinfo( var_12 );
    }

    _id_524A::_id_520E( "president_breach_volume" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1071 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_26F3, 0 );
    common_scripts\utility::flag_set( "start_bottom_defend" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level._id_4877 animscripts\weaponlist::_id_0CD0();
    level._id_45C0 animscripts\weaponlist::_id_0CD0();
    wait 1;

    if ( !isalive( level._id_58BA ) )
        return;

    level._id_58BA endon( "death" );
    var_1 = common_scripts\utility::get_target_ent( "president_rescue_node" );
    var_1.origin = level._id_58BA.origin;
    var_1 thread _id_524A::_id_5220( level._id_4877, "pres_getup_price" );
    var_1 thread _id_524A::_id_5220( level._id_45C0, "pres_getup_sandman" );
    level._id_4877 waittill( "starting_anim" );
    level._id_58BA notify( "stop_breach_behavior" );
    level._id_58BA._id_5E12 notify( "stop_loop" );
    var_1 thread maps\_anim::_id_11C3( level._id_58BA, "pres_getup_president" );
    level._id_58BA.a._id_0D26 = "stand";
    level._id_58BA thread _id_5E88();
}

_id_5E13()
{
    common_scripts\utility::exploder( 250 );
    var_0 = 0;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    wait 0.1;
    common_scripts\utility::exploder( "prez_breach" );
    maps\_utility::_id_26BF( "floor_exploder" );
    level._id_5DF9 delete();

    for ( var_0 = 0; var_0 < level._id_5E14.size; var_0++ )
    {
        if ( isdefined( var_1 ) )
        {
            var_1 notsolid();
            var_1 delete();
            var_2 delete();
            var_3 delete();
        }

        var_3 = level._id_5E15[var_0];
        var_1 = level._id_5E14[var_0];
        var_2 = level._id_5E16[var_0];
        var_1 show();
        var_2 show();

        if ( var_0 == level._id_5E14.size - 1 )
            var_3 delete();
        else
            var_3 show();

        wait 0.2;
    }

    var_4 = var_1.origin;
    var_5 = 0;

    while ( var_5 < 2000 )
    {
        var_5 += 4;
        var_1.origin = var_4 - ( 0, 0, var_5 );
        wait 0.05;
    }
}

_id_5E17()
{
    common_scripts\utility::flag_wait( "start_bottom_defend" );
    maps\_utility::_id_26C4( "cavern_breach_exit" );
    level._id_4877 waittill( "starting_anim" );
    thread _id_018B();
    common_scripts\utility::array_call( maps\_utility::_id_26C8(), ::allowedstances, "stand", "crouch", "prone" );
    maps\_utility::_id_11F4( "rescue_snd_jackpot" );
    thread maps\_utility::_id_11F4( "rescue_hqr_extractionpoint" );
    objective_state( maps\_utility::_id_2816( "rescue_prez" ), "done" );
    objective_add( maps\_utility::_id_2816( "escape" ), "current", &"RESCUE_2_OBJ_111" );
    objective_onentity( maps\_utility::_id_2816( "escape" ), level._id_58BA );
    objective_setpointertextoverride( maps\_utility::_id_2816( "escape" ), &"RESCUE_2_ICON_PROTECT" );
    level._id_58BA maps\_utility::_id_13A4( "c" );
    level._id_58BA thread maps\_utility::_id_0D04();
    wait 0.5;
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_26F3, 1 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1057 );
    level._id_58BA maps\_utility::_id_168C( "rescue_prs_daughter" );
}

_id_018B()
{
    wait 6.25;
    _id_5E18();
    wait 0.4;
    common_scripts\utility::array_call( [ level._id_4877, level._id_45C0, level._id_58BA ], ::pushplayer, 1 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2686 );
    maps\_utility::_id_26C0( "cavern_breach_exit" );
    var_0 = getent( "cavern_breach_exit", "script_noteworthy" );
    var_0 common_scripts\utility::trigger_off();
    maps\_utility::_id_1428( "rescue_2_defend" );
    wait 0.1;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_movemove" );
    maps\_utility::_id_265A( "allies" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    common_scripts\utility::flag_set( "cavern_defend_wave_1" );
    _id_018D( "cavern_defend" );
    maps\_utility::_id_11F4( "rescue_snd_bringbirdtous" );
    wait 0.2;
    maps\_utility::_id_11F4( "rescue_hqr_twobirds" );
    wait 1;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_holdposition" );
    wait 1;
    level._id_45C4 maps\_utility::_id_168C( "rescue_trk_badguys" );
    maps\_utility::_id_265B( "allies" );
}

_id_5E18()
{
    thread common_scripts\utility::play_sound_in_space( "scn_prague_tank_alley_exp", level.player.origin + ( 0.0, 0.0, 96.0 ) );
    earthquake( 0.5, 0.65, level.player.origin, 1024 );
    var_0 = common_scripts\utility::spawn_tag_origin();
    level.player playersetgroundreferenceent( var_0 );
    var_0 rotateto( ( -8.0, 0.0, -6.0 ), 0.15, 0, 0.15 );
    var_0 waittill( "rotatedone" );
    var_0 rotateto( ( 0.0, 0.0, 0.0 ), 0.5, 0.5, 0 );
    var_0 waittill( "rotatedone" );
    level.player playersetgroundreferenceent( undefined );
    waittillframeend;
    var_0 delete();
    level._id_45C4 thread maps\_utility::_id_168C( "rescue_trk_whatthe" );
    wait 0.75;
    earthquake( 0.8, 1.5, level.player.origin, 1024 );
    thread _id_5E19();
    var_1 = spawnstruct();
    var_2 = common_scripts\utility::get_target_ent( "president_rescue_node" );
    var_1.origin = var_2.origin + ( 0.0, 0.0, 256.0 );
    var_1 thread _id_5E66();
    thread common_scripts\utility::play_sound_in_space( "scn_prague_tank_alley_exp", level.player.origin + ( 0.0, 0.0, 32.0 ) );
    thread _id_5E4D();
    thread _id_5E50();
    var_3 = getentarray( "prez_cell_light", "targetname" );

    foreach ( var_5 in var_3 )
        var_5 thread _id_5E1A();

    var_7 = maps\_utility::_id_1BF9( "prez_breach_shake", "targetname" );

    foreach ( var_9 in var_7 )
        maps\_utility::delaythread( randomfloatrange( 0.4, 1.5 ), maps\_utility::_id_27D8, var_9.origin, var_9.radius, 500, 500 );

    var_11 = maps\_utility::_id_1BF9( "prez_breach_physics", "targetname" );

    foreach ( var_13 in var_11 )
    {
        physicsexplosionsphere( var_13.origin, 64, 32, 5 );
        wait 0.2;
    }
}

_id_5E19()
{
    wait 0.1;
    level.player disableweapons();
    var_0 = common_scripts\utility::spawn_tag_origin();
    level.player playersetgroundreferenceent( var_0 );
    var_0 rotateto( ( 13.0, 0.0, 6.0 ), 0.5, 0, 0.5 );
    var_0 waittill( "rotatedone" );
    var_0 rotateto( ( 0.0, 0.0, 0.0 ), 1, 0.5, 0 );
    var_0 waittill( "rotatedone" );
    level.player playersetgroundreferenceent( undefined );
    waittillframeend;
    var_0 delete();
    wait 0.6;
    level.player enableweapons();
}

_id_5E1A()
{
    thread _id_524A::_id_5202( self, 0.3, 1 );
    wait(randomfloatrange( 0.1, 1.6 ));
    self notify( "stop_flicker" );
    self setlightintensity( 0 );
    radiusdamage( self.origin, 32, 500, 500 );
}

_id_5E1B()
{
    maps\_utility::_id_262B( "cavern_breach_exit", "script_noteworthy" );
    maps\_utility::_id_272C( "cavern_defend_0" );
    var_0 = [];
    var_1 = maps\_utility::_id_1BF9( "cavern_defend_smoke", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 common_scripts\utility::get_target_ent();
        var_5 = common_scripts\utility::spawn_tag_origin();
        var_5.origin = var_4.origin;
        var_0 = maps\_utility::_id_0BC3( var_0, var_5 );
        magicgrenade( "smoke_grenade_american", var_3.origin, var_4.origin, 1 );
        wait 0.3;
    }

    wait 8;
    maps\_spawner::_id_2135( getentarray( "cavern_defend_1", "targetname" ) );
    maps\_utility::delaythread( 10, common_scripts\utility::array_thread, var_0, _id_524A::_id_520B, "kill_smoke", 40 );
    common_scripts\utility::flag_wait( "cavern_player_is_defending" );
    wait 20;
    common_scripts\utility::flag_set( "cavern_defend_wave_2" );
}

_id_5E1C()
{
    level endon( "cavern_rescue_arrives" );
    common_scripts\utility::flag_wait( "cavern_defend_wave_2" );
    var_0 = [ "l", "r" ];

    for (;;)
    {
        maps\_utility::_id_272C( "cavern_defend_l" );
        wait 5;
        maps\_utility::_id_272C( "cavern_defend_r" );
        wait 13;
    }
}

_id_5E1D()
{
    common_scripts\utility::flag_wait( "cavern_defend_wave_2" );
    maps\_utility::_id_265A( "allies" );
    wait 2;
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_enemiesonflank" );
    wait 2;
    maps\_utility::_id_11F4( "rescue_snd_bailusout" );
    wait 0.2;
    maps\_utility::_id_11F4( "rescue_hp1_almostthere" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait( "cavern_rescue_arrives" );
    wait 15;
    maps\_utility::_id_265A( "allies" );
    maps\_utility::_id_11F4( "rescue_snd_ourride" );
    wait 0.3;
    maps\_utility::_id_11F4( "rescue_hp1_getouttahere" );
    wait 0.3;
    maps\_utility::_id_11F4( "rescue_snd_soundsgood" );
    common_scripts\utility::flag_wait( "cavern_run_to_heli" );
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_letsmove2" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    _id_018D( "run_to_heli" );
}

_id_5E1E()
{
    common_scripts\utility::flag_wait( "cavern_defend_wave_2" );
    var_0 = getentarray( "broken_bridge", "script_noteworthy" );
    common_scripts\utility::array_call( var_0, ::delete );
    wait 8;
    common_scripts\utility::flag_set( "cavern_rescue_arrives" );
    level notify( "kill_smoke" );
    wait 1;
    _id_5E1F();
}

_id_5E1F()
{
    level._id_5DEF = maps\_vehicle::_id_2881( "rescue_heli" );
    level._id_5E20 = maps\_vehicle::_id_2881( "rescue_heli_backup" );
    wait 0.1;
    level._id_5DEF _id_5E76();
    wait 0.1;
    level._id_5E20 _id_5E76();
    level._id_5E20 waittill( "reached_dynamic_path_end" );
    maps\_spawner::_id_213C( 550 );
    common_scripts\utility::flag_set( "cavern_run_to_heli" );
    level._id_58BA maps\_utility::_id_1057();
    level._id_58BA.ignoreme = 1;
    maps\_utility::delaythread( 4, maps\_utility::_id_1427, 8 );
}

_id_5E21()
{
    level._id_5E22 = 0.3;
    level._id_5E23 = 0.4;
    level._id_5E24 = 0.5;
    level._id_5E25 = 0.9;
    level._id_5E26 = 0.1;
    level._id_5E27 = 0.2;
}

_id_5E28()
{
    level._id_5E22 = 0.1;
    level._id_5E23 = 0.2;
    level._id_5E24 = 0.5;
    level._id_5E25 = 0.9;
    level._id_5E26 = 0.1;
    level._id_5E27 = 0.2;
}

_id_5E29()
{
    self makeentitysentient( "allies" );

    if ( issubstr( self.classname, "littlebird" ) )
        playfxontag( common_scripts\utility::getfx( "lights_strobe_red_dist_maxb" ), self, "tag_light_belly" );
    else
        playfxontag( common_scripts\utility::getfx( "dlight_blue" ), self, "tag_light_cockpit01" );

    self._id_0A50 = spawnturret( "misc_turret", self gettagorigin( "tag_turret" ), "heli_minigun_noai" );
    self._id_0A50 setmodel( "weapon_minigun" );
    self._id_0A50 linkto( self, "tag_turret", ( 0.0, 0.0, -5.0 ), ( 0.0, 0.0, 180.0 ) );
    self._id_0A50._id_2A38 = self;
    self._id_0A50 setleftarc( 85 );
    self._id_0A50 setrightarc( 85 );
    self._id_0A50 setbottomarc( 55 );
    self._id_0A50 settoparc( 85 );
    self._id_0A50 setmode( "manual" );
    self._id_0A50.script_team = "allies";
    self._id_0A50 thread maps\_mgturret::_id_2278();
    self._id_0A50 makeunusable();
    self._id_0A50 setturretteam( "allies" );
    self._id_0A50 setdefaultdroppitch( 0 );
    self._id_0A50 thread _id_5E2A();
    self waittill( "death" );
    self._id_0A50 delete();
}

_id_5E2A( var_0 )
{
    self endon( "stop_shooting" );
    self._id_2A38 endon( "death" );
    self endon( "death" );
    self startfiring();

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            var_0 = self.origin;

        var_1 = getaiarray( "axis" );

        if ( var_1.size == 0 )
        {
            self stopfiring();
            wait 2;
            self startfiring();
            var_0 = self.origin;
            continue;
        }

        var_1 = sortbydistance( var_1, var_0 );
        var_2 = var_1[0];
        self settargetentity( var_2 );

        if ( !isdefined( self._id_2A38._id_5E2B ) )
            self._id_2A38 setlookatent( var_2 );

        var_2 common_scripts\utility::waittill_notify_or_timeout( "death", 5 );
        var_0 = var_2.origin;
        wait 0.5;
    }
}

_id_5E2C()
{
    common_scripts\utility::flag_wait( "kill_rescue_heli" );
    var_0 = getent( "cavern_turret", "script_noteworthy" );
    var_0 thread maps\_dshk_player_rescue::_id_0188();
    thread _id_5E85( "cavern_bottom_player_upstairs" );
    maps\_utility::_id_1428( "rescue_2_dark", 5 );
    maps\_utility::_id_272C( "prez_heli_ambush" );
    maps\_utility::_id_272C( "prez_heli_ambush_2" );
    var_1 = common_scripts\utility::get_target_ent( "rescue_heli_rpg" );
    thread _id_5E2D();
    level._id_5E20 maps\_utility::_id_2834( "rescue_backup_heli_dead" );
    level._id_5DEF._id_0A50 notify( "stop_shooting" );
    level._id_5DEF._id_0A50 stopfiring();
    level._id_5DEF maps\_vehicle::_id_2A12();
    level._id_5DEF vehicle_setspeedimmediate( 15, 60, 60 );
    level._id_5DEF thread maps\_vehicle::_id_26A1( common_scripts\utility::get_target_ent( "cavern_heli_breakaway" ) );
    wait 1;
    _id_5E21();
    var_2 = missile_createrepulsorent( level._id_5DEF, 2500, 1024 );
    var_3 = magicbullet( "rpg", var_1.origin, level._id_5DEF.origin - ( 0.0, 0.0, 600.0 ) );
    level._id_5DEF._id_0A50 setaispread( 0.1 );
    var_1 = common_scripts\utility::get_target_ent( "heli_target_after_breakaway" );
    level._id_5DEF._id_0A50 thread _id_5E2A( var_1.origin );
    common_scripts\utility::flag_wait( "cavern_heli_force_land" );
    level._id_5DEF._id_5E2B = 1;
    level._id_5DEF._id_0A50 maps\_utility::delaythread( 5, maps\_utility::_id_1DAA, "stop_shooting" );
    level._id_5DEF._id_0A50 common_scripts\utility::delaycall( 6, ::stopfiring );
    level._id_5DEF clearlookatent();
    level._id_5DEF vehicle_setspeedimmediate( 5, 30, 30 );
    level._id_5DEF sethoverparams( 0, 0, 0 );
    level._id_5DEF setturningability( 1 );
    level._id_5DEF thread maps\_vehicle::_id_26A1( common_scripts\utility::get_target_ent( "cavern_heli_land" ) );
    common_scripts\utility::flag_set( "cavern_heli_landing" );
}

_id_5E2D()
{
    var_0 = common_scripts\utility::get_target_ent( "rescue_heli_rpg" );
    var_1 = missile_createattractorent( level._id_5E20, 9000, 9000 );
    wait 0.05;
    var_2 = magicbullet( "rpg", var_0.origin, level._id_5E20.origin );
    wait 0.5;
    thread _id_5E2E();
    level._id_5E20 vehicle_setspeedimmediate( 15, 60, 60 );
    level._id_5E20 maps\_utility::delaythread( 0.5, maps\_vehicle::_id_26A1, common_scripts\utility::get_target_ent( "cavern_backup_breakaway" ) );
    wait 1;
    missile_deleteattractor( var_1 );

    if ( isdefined( var_2 ) )
    {
        var_2 waittill( "death" );

        if ( isdefined( level._id_5E20 ) )
            level._id_5E20 kill();
    }
}

_id_5E2E()
{
    thread maps\_utility::_id_11F4( "rescue_hp2_rpgmove" );
    common_scripts\utility::flag_wait( "rescue_backup_heli_dead" );
    maps\_utility::_id_26B1( "rescue_lbp_imhit" );
    wait 0.2;
    maps\_utility::_id_11F4( "rescue_lbp_goindown" );
}

_id_5E2F()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "rescue_backup_heli_dead" );
    wait 4;
    var_0 = spawnstruct();
    var_1 = anglestoforward( level.player.angles ) * 75;
    var_0.origin = level.player.origin + var_1 + ( 0.0, 0.0, 64.0 );
    var_0 maps\_utility::delaythread( 0.2, ::_id_5E66 );
    var_0 = spawnstruct();
    var_1 = anglestoforward( level.player.angles ) * 128;
    var_0.origin = level.player.origin + var_1 + ( 0.0, 0.0, 64.0 );
    var_0 thread _id_5E66();
    level.player freezecontrols( 1 );
    level.player disableweapons();
    level.player thread maps\_utility::vision_set_fog_changes( "rescue_2_sunblind", 1 );
    wait 0.5;
    common_scripts\utility::flag_set( "begin_player_shellshock" );
    wait 0.1;
    level.player freezecontrols( 0 );
    level.player thread maps\_utility::vision_set_fog_changes( "rescue2_ending", 0.2 );
}

_id_5E30()
{
    common_scripts\utility::flag_init( "ending_next_stop" );
    var_0 = getdvarint( "animation_debug", 0 );
    level._id_5E31 = ( 0.0, 0.0, -50.0 );
    common_scripts\utility::flag_wait( "begin_player_shellshock" );
    var_1 = common_scripts\utility::get_target_ent( "ending_delta_vignette" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), ::_id_5E87 );
    maps\_utility::_id_265A( "allies" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1057 );
    var_2 = maps\_utility::_id_26C8();

    foreach ( var_4 in var_2 )
        var_4._id_0D28 = 1;

    level._id_58BA maps\_utility::_id_1057();
    level._id_58BA._id_0D28 = 1;
    level.player.ignoreme = 1;
    setsaveddvar( "hud_showStance", "0" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "actionSlotsHide", "1" );
    setsaveddvar( "cg_drawCrosshair", "0" );
    setsaveddvar( "aim_AutoAimRangeScale", 0 );
    setsaveddvar( "aim_aimAssistRangeScale", "1" );
    setblur( 6, 0 );
    level.player disableweapons();
    level.player enableinvulnerability();
    level.player shellshock( "rescue_chopper_drag", 120 );
    _id_524A::_id_09FA( 0.1 );
    var_6 = common_scripts\utility::get_target_ent( "player_shellshock_teleport" );
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setstance( "stand" );
    common_scripts\utility::array_thread( getaiarray(), maps\_utility::_id_2734, 0 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_123B );
    wait 0.3;
    level.player setorigin( var_6.origin );
    level.player setplayerangles( var_6.angles );
    var_7 = _id_524A::_id_51F1();
    var_7 show();
    var_1 thread maps\_anim::_id_11C0( var_7, "rescue_ending_pres_heli_getin_player" );
    var_8 = var_7 common_scripts\utility::spawn_tag_origin();
    var_8.origin = var_7 gettagorigin( "tag_player" );
    var_8.angles = var_7 gettagangles( "tag_player" );
    var_8 linkto( var_7, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_9 = common_scripts\utility::spawn_tag_origin();
    var_9.angles = ( var_8.angles[0], 0, -1 * var_8.angles[2] );

    if ( !var_0 )
    {
        level.player playerlinktodelta( var_7, "tag_player", 1, 20, 30, 30, 0 );
        level.player playersetgroundreferenceent( var_9 );
    }
    else
    {
        level.player playerlinktodelta( var_7, "tag_player", 1, 0, 0, 0, 0 );
        level.player playersetgroundreferenceent( var_9 );
    }

    thread maps\_utility::_id_11F4( "rescue_pri_yurisdown" );
    level._id_5E22 = 0.3;
    level._id_5E23 = 0.4;
    level._id_5E24 = 0.7;
    level._id_5E25 = 1.5;
    level._id_5E26 = 0.5;
    level._id_5E27 = 0.8;
    wait 1;
    var_10 = getcorpsearray();
    common_scripts\utility::array_call( var_10, ::delete );
    var_11 = getweaponarray();
    common_scripts\utility::array_call( var_11, ::delete );
    common_scripts\utility::flag_set( "cavern_heli_force_land" );
    var_12 = common_scripts\utility::get_target_ent( "cavern_bottom_back_volume" );
    var_13 = getaiarray( "axis" );

    foreach ( var_15 in var_13 )
    {
        if ( var_15 istouching( var_12 ) )
            var_15 delete();
    }

    var_1 thread maps\_anim::_id_11C0( level._id_45C4, "BH_getin" );
    var_17 = getnodearray( "cavern_heroes_shellshock_1", "targetname" );

    foreach ( var_19 in var_17 )
    {
        if ( var_19.script_noteworthy == "grinch" )
        {
            level._id_4D86 forceteleport( var_19.origin, var_19.angles );
            level._id_4D86 setgoalnode( var_19 );
        }
    }

    wait 0.05;
    level._id_5E32 = 0.2;
    level._id_5E33 = 0.4;
    level._id_5E34 = 4;
    level._id_5E35 = 8;
    _id_5E28();
    level._id_45C4 setgoalpos( level._id_45C4.origin );
    level._id_45C4.goalradius = 8;
    level._id_45C4 notify( "stop_first_frame" );
    setblur( 0, 4 );
    _id_524A::_id_17CC( 3 );
    maps\_utility::delaythread( 0.6, maps\_utility::_id_11F4, "rescue_hp2_presidenton" );
    thread _id_5E40();
    setblur( 5, 3 );
    wait 1.7;
    _id_524A::_id_09FA( 1.5 );
    level._id_5DEF notify( "newpath" );
    wait 3;
    level._id_58BA._id_1032 = "president";
    level._id_5DEF setyawspeed( 0, 60, 60, 0 );
    level._id_5DEF vehicle_setspeedimmediate( 0, 60, 60 );
    var_21 = level._id_5DEF maps\_vehicle::_id_2A8D();
    var_21._id_1032 = "blackhawk";
    var_1 thread maps\_anim::_id_1246( var_21, "rescue_ending_pres_heli_getin_blackhawk" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1057 );
    var_22 = _id_5E75();
    var_1 thread maps\_anim::_id_11DD( [ level._id_4D86, level._id_58BA ], "BH_getin" );
    var_1 thread maps\_anim::_id_11C1( level._id_45C4, "BH_getin" );
    var_1 thread maps\_anim::_id_11C1( var_7, "rescue_ending_pres_heli_getin_player" );
    var_23 = getanimlength( maps\_utility::_id_270F( "BH_getin" ) );
    maps\_utility::delaythread( var_23 * 0.66, common_scripts\utility::flag_set, "ending_next_stop" );
    maps\_utility::delaythread( var_23 * 0.8, common_scripts\utility::flag_set, "ending_next_stop" );
    var_23 = getanimlength( maps\_utility::_id_270F( "rescue_ending_pres_heli_getin_player" ) );
    maps\_utility::delaythread( var_23, common_scripts\utility::flag_set, "ending_next_stop" );
    setblur( 0, 4 );
    _id_524A::_id_17CC( 2 );
    thread _id_5E3E();
    level._id_4D86 maps\_utility::delaythread( 1.6, maps\_utility::_id_168C, "rescue_rno_pressecure" );
    level._id_45C4 maps\_utility::delaythread( 3, maps\_utility::_id_168C, "rescue_trk_igotyou" );
    maps\_utility::delaythread( 4, maps\_utility::_id_1427, 3 );
    common_scripts\utility::flag_wait( "ending_next_stop" );
    common_scripts\utility::flag_clear( "ending_next_stop" );
    var_19 = common_scripts\utility::get_target_ent( "cavern_heli_land" );
    var_19 = var_19 maps\_utility::_id_266B( "struct" );
    level._id_5DEF maps\_vehicle::_id_2A95();
    level._id_5DEF vehicle_teleport( var_19.origin, var_19.angles );
    var_22 thread maps\_anim::_id_11CF( level._id_58BA, "BH_anim" );
    level._id_58BA linkto( var_22, "tag_origin" );
    maps\_spawner::_id_213C( 700 );
    maps\_utility::_id_26C0( "spawn_end_guys" );
    var_1 thread maps\_anim::_id_11C0( level._id_45C0, "rescue_ending_player_drag_handoff_sandman" );
    var_1 thread maps\_anim::_id_11C0( level._id_4877, "rescue_ending_player_drag_handoff_price" );
    var_9 rotateto( ( 0.0, 0.0, 0.0 ), 0.5 );
    common_scripts\utility::flag_wait( "ending_next_stop" );
    common_scripts\utility::flag_clear( "ending_next_stop" );
    maps\_utility::delaythread( 1, maps\_utility::_id_1428, "rescue_2_ending" );
    level._id_5DEF notify( "stop_kicking_up_dust" );
    thread _id_5E37();
    thread _id_5E3A();
    var_1 thread maps\_anim::_id_11C1( level._id_45C0, "rescue_ending_player_drag_handoff_sandman" );
    var_1 thread maps\_anim::_id_11C1( level._id_4877, "rescue_ending_player_drag_handoff_price" );
    var_1 thread maps\_anim::_id_11C1( level._id_45C4, "rescue_ending_player_drag_handoff_truck" );
    var_23 = getanimlength( maps\_utility::_id_270F( "rescue_ending_player_drag_handoff_truck" ) );
    maps\_utility::delaythread( var_23 * 0.66, common_scripts\utility::flag_set, "ending_next_stop" );
    var_24 = maps\_utility::_id_1287( "player_rig" );
    var_24 hide();
    var_1 thread maps\_anim::_id_11C1( var_24, "rescue_ending_player_drag_handoff_player" );
    common_scripts\utility::flag_wait( "ending_next_stop" );
    common_scripts\utility::flag_clear( "ending_next_stop" );
    var_7 hide();
    level.player thread _id_5E67();
    level.player playerlinktoblend( var_24, "tag_player", 1 );
    level.player common_scripts\utility::delaycall( 1.1, ::playerlinktodelta, var_24, "tag_player", 1, 80, 80, 60, 60 );
    level.player common_scripts\utility::delaycall( 9, ::playerlinktoblend, var_24, "tag_player", 1 );
    common_scripts\utility::flag_wait( "ending_next_stop" );
    common_scripts\utility::flag_clear( "ending_next_stop" );
    var_11 = getweaponarray();
    common_scripts\utility::array_call( var_11, ::delete );
    var_24 common_scripts\utility::delaycall( 1.5, ::show );
    common_scripts\utility::flag_wait( "start_delta_retreat" );
    level._id_4D86._id_2145 = 1;
    var_1 = common_scripts\utility::get_target_ent( "ending_delta_vignette" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1057 );
    var_1 thread maps\_anim::_id_11C1( level._id_45C0, "rescue_ending_delta_retreat_sandman" );
    var_1 thread maps\_anim::_id_11C1( level._id_45C4, "rescue_ending_delta_retreat_truck" );
    var_1 thread maps\_anim::_id_11C1( level._id_4D86, "rescue_ending_delta_retreat_grinch_v2" );
    var_1 thread maps\_anim::_id_11C1( var_7, "rescue_ending_delta_retreat_player" );
    var_23 = getanimlength( maps\_utility::_id_270F( "rescue_ending_delta_retreat_player" ) );
    maps\_utility::delaythread( var_23 - 0.1, common_scripts\utility::flag_set, "ending_next_stop" );
    var_22 thread maps\_anim::_id_11CF( level._id_4877, "BH_anim" );
    level._id_4877 linkto( var_22, "tag_origin" );
    level._id_4877 hide();
    level.player playerlinktoblend( var_7, "tag_player", 1 );
    level.player common_scripts\utility::delaycall( 1.1, ::playerlinktodelta, var_7, "tag_player", 1, 80, 80, 60, 60 );
    var_25 = "deserteagle";
    var_25 = level._id_4877.primaryweapon;
    level.player takeallweapons();
    level.player giveweapon( var_25 );
    level.player givemaxammo( var_25 );
    level.player enableweapons();
    level.player common_scripts\utility::delaycall( 0.2, ::switchtoweapon, var_25 );
    common_scripts\utility::flag_wait( "old_retreat_start" );
    thread _id_5E3B();
    thread _id_5E3C();
    var_24 hide();
    maps\_utility::_id_2772( 0.5 );
    maps\_utility::_id_2774( 0.4 );
    thread maps\_utility::_id_2775();
    wait 1;
    level.player playersetgroundreferenceent( undefined );
    level.player shellshock( "rescue_chopper_drag_2", 120 );
    level.player thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    var_8.origin = var_24 gettagorigin( "tag_player" );
    thread _id_5E36( var_8 );
    maps\_utility::delaythread( 3, common_scripts\utility::exploder, 200 );
    common_scripts\utility::array_thread( getaiarray(), maps\_utility::_id_2734, 0 );
    common_scripts\utility::flag_wait( "ending_next_stop" );
    common_scripts\utility::flag_clear( "ending_next_stop" );
    level._id_5DEF thread maps\_vehicle::_id_2A9B();
    var_22 maps\_anim::_id_11C0( var_24, "rescue_ending_player_into_bh_player", "tag_origin" );
    var_24 linkto( var_22, "tag_origin" );
    level.player playerlinktoblend( var_24, "tag_player", 1 );
    level._id_45C0._id_1005 = level._id_45C0.primaryweapon;
    level._id_4D86._id_1005 = level._id_4D86.primaryweapon;
    common_scripts\utility::flag_set( "cavern_player_gets_on_heli" );
    level.player disableweapons();
    level._id_4877 common_scripts\utility::delaycall( 1, ::show );
    var_24 common_scripts\utility::delaycall( 0.5, ::show );
    var_24 common_scripts\utility::delaycall( 5.2, ::hide );
    level.player common_scripts\utility::delaycall( 6, ::enableweapons );
    maps\_utility::_id_0A16( 1 );
    thread maps\_utility::_id_0A17();
    thread maps\_utility::_id_194E( "rescue_2_chopper", 1 );
    var_22 thread maps\_anim::_id_11DD( [ level._id_4877, level._id_58BA ], "BH_anim" );
    var_22 maps\_anim::_id_11C1( var_24, "rescue_ending_player_into_bh_player", "tag_origin" );
    common_scripts\utility::flag_set( "cavern_player_in_heli" );
    level.player playerlinktodelta( var_24, "tag_player", 1, 25, 25, 80, 80 );
}

_id_5E36( var_0 )
{
    wait 2;
    var_1 = _id_5E74( level._id_45C0.origin, level._id_45C4.origin );
    var_2 = vectortoangles( var_1 - var_0.origin );
    var_0 rotateto( var_2, 4, 1.5, 1.5 );
    var_3 = getentarray( "cavern_end_dummy_right", "targetname" );
    maps\_utility::_id_272B( var_3 );
    var_0 waittill( "rotatedone" );
    wait 0.5;
    var_1 = _id_5E74( level._id_45C0.origin, level._id_4D86.origin );
    var_2 = vectortoangles( var_1 - var_0.origin );
    var_0 rotateto( var_2, 4, 1.5, 1.5 );
    var_3 = getentarray( "cavern_end_dummy_left", "targetname" );
    thread maps\_utility::_id_272C( "end_gimme_leftside_1" );
    var_0 waittill( "rotatedone" );
    var_3 = getentarray( "cavern_end_dummy_right", "targetname" );
    maps\_utility::_id_272B( var_3 );
    var_1 = level._id_45C0.origin;
    var_2 = vectortoangles( var_1 - var_0.origin );
    var_0 rotateto( var_2, 4, 1.5, 1.5 );
    var_0 waittill( "rotatedone" );
}

_id_5E37()
{
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_gottago" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_dontthink" );
    thread maps\_utility::_id_11F4( "rescue_snd_toomuchheat" );
}

_id_5E38()
{
    thread maps\_utility::_id_1926();
    thread maps\_utility::_id_26B3( "rescue_rno_rpg" );
    wait 1.1;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_coverright" );
    wait 0.8;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_betterbe" );
}

_id_5E39()
{
    common_scripts\utility::flag_wait( "cavern_player_in_heli" );
    wait 0.3;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_timetogo" );
    thread maps\_utility::_id_11F4( "rescue_snd_justgo" );
    wait 1.0;
    thread maps\_utility::_id_26B3( "rescue_trk_rpg" );
    wait 0.2;
    maps\_utility::_id_11F4( "rescue_hp2_hangon" );
    wait 0.5;
    maps\_utility::_id_11F4( "rescue_snd_goooo" );
    wait 0.5;
    maps\_utility::_id_11F4( "rescue_hp2_gottaleave" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_no" );
    wait 0.5;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_backdown" );
    maps\_utility::_id_11F4( "rescue_hp2_toohot" );
    wait 0.2;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_readme" );
    wait 0.5;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_comein" );
    wait 0.8;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_doyoucopy" );
    wait 0.9;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_stillthere" );
}

_id_5E3A()
{
    maps\_utility::delaythread( 6.5, ::_id_5E38 );
    maps\_utility::delaythread( 6.5, ::_id_5320, "argue_rpg_1" );
    maps\_utility::delaythread( 7.3, ::_id_5320, "argue_rpg_2", "rpg_dirt_impact" );
    maps\_utility::delaythread( 12.6, ::_id_5320, "argue_rpg_3" );
}

_id_5E3B()
{
    maps\_utility::delaythread( 0.7, ::_id_5320, "retreat_rpg_0", "rpg_dirt_impact" );
    maps\_utility::delaythread( 4.2, ::_id_5320, "retreat_rpg_1", "rpg_dirt_impact" );
    maps\_utility::delaythread( 13.3, ::_id_5320, "retreat_rpg_2", "rpg_dirt_impact" );
}

_id_5E3C()
{
    var_0 = getentarray( "cavern_end_drone_random", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5E7A );
    thread maps\_utility::_id_272C( "end_gimme_rightside_1" );
    maps\_utility::delaythread( 7.6, maps\_utility::_id_272F, "cavern_end_drone_close_1" );
    maps\_utility::delaythread( 11.85, maps\_utility::_id_272F, "cavern_end_drone_close_2" );
    wait 13.05;
    level._id_5E3D = maps\_utility::_id_272F( "cavern_end_drone_close_3" );
    level._id_5E3D waittill( "death" );
}

_id_5E3E()
{
    level.player endon( "stop_breathing" );
    childthread _id_5E3F();
    wait 0.5;

    for (;;)
    {
        level.player maps\_utility::play_sound_on_entity( "breathing_heartbeat" );
        wait 0.5;
    }
}

_id_5E3F()
{
    for (;;)
    {
        thread _id_524A::_id_09FA( 5 );
        level.player setblurforplayer( 1, 2 );
        wait 2;
        level.player setblurforplayer( 0, 4 );
        _id_524A::_id_17CC( 2 );
        wait 2;
    }
}

_id_5E40()
{
    level.player endon( "stop_breathing" );
    level.player maps\_utility::play_sound_on_entity( "breathing_hurt_start" );
    var_0 = 0.2;

    for (;;)
    {
        level.player maps\_utility::play_sound_on_entity( "breathing_hurt" );
        wait(var_0);
        var_0 += 0.3;
    }
}

_id_5E41()
{
    common_scripts\utility::flag_wait( "cavern_heli_landing" );
    maps\_spawner::_id_213C( 600 );
    _id_5E5C();
    _id_5E5E();
    maps\_utility::_id_26C0( "cavern_run_friendlies_chopper" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_1057 );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2736, 15 );
    thread maps\_spawner::_id_2135( getentarray( "cavern_run_chaser", "targetname" ) );
}

_id_5E43()
{
    self endon( "death" );

    for (;;)
    {
        self rotateto( self.angles + ( 5.0, 180.0, 9.0 ), 0.5, 0 );
        self waittill( "rotatedone" );
    }
}

_id_5E44()
{
    var_0 = common_scripts\utility::get_target_ent();
    var_1 = var_0 common_scripts\utility::get_target_ent();
    var_1 endon( "trigger" );
    self waittill( "trigger" );
    _id_524A::_id_520E( var_0.targetname, var_0._id_5E45 );
    var_1 thread maps\_utility::_id_2703();
}

_id_588A()
{
    self waittill( "trigger" );
    var_0 = [];
    var_1 = common_scripts\utility::get_target_ent();
    var_2 = getaiarray( "axis" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 istouching( var_1 ) )
            var_0 = maps\_utility::_id_0BC3( var_0, var_4 );
    }

    maps\_utility::_id_2756( var_0, 256 );
}

_id_5E46()
{
    self endon( "death" );
    self endon( "damage" );
    maps\_utility::_id_0D72( 0 );

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent();
    else
        var_0 = self;

    _id_5312( var_0.animation );

    if ( isai( self ) && isdefined( self._id_530D ) )
        var_0 maps\_anim::_id_11C4( self, var_0.animation );

    var_0 thread maps\_anim::_id_11C0( self, var_0.animation );

    if ( isdefined( self.script_delay ) )
        maps\_utility::script_delay();
    else
        wait(randomfloatrange( 0, 3 ));

    self.allowdeath = 1;
    var_0 maps\_anim::_id_11C1( self, var_0.animation );
    maps\_utility::_id_0D72( 1 );
}

_id_5E47()
{
    self endon( "death" );
    self endon( "damage" );
    maps\_utility::_id_0D72( 0 );
    self.health = 1;
    self.allowdeath = 1;

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent();
    else
        var_0 = self;

    _id_5312( var_0.animation );

    if ( !isai( self ) )
        thread _id_5249();

    var_0 thread maps\_anim::_id_11C0( self, var_0.animation );

    if ( isdefined( self.script_delay ) )
        maps\_utility::script_delay();
    else
        wait(randomfloatrange( 0, 3 ));

    self.allowdeath = 1;
    var_0 maps\_anim::_id_11C1( self, var_0.animation );
    self.allowdeath = 1;
    self._id_0EC0 = 1;
    var_0 maps\_anim::_id_11C8( self, var_0.animation + "_idle" );
}

_id_5E48()
{
    self endon( "death" );
    self endon( "damage" );
    maps\_utility::_id_0D72( 0 );
    self.health = 1;
    self.allowdeath = 1;

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent();
    else
        var_0 = self;

    if ( isdefined( level._id_0C59["generic"][var_0.animation + "_death"] ) )
        self._id_0D50 = maps\_utility::_id_270F( var_0.animation + "_death" );

    _id_5312( var_0.animation );

    if ( issubstr( var_0.animation, "crawl" ) )
    {
        if ( !isdefined( self.a ) )
            self.a = spawnstruct();

        self._id_10F7 = randomfloatrange( 0.7, 1.1 );
        self.a._id_0D26 = "prone";
        maps\_utility::delaythread( 0.1, animscripts\pain::_id_0D57 );
    }

    if ( !isai( self ) )
        thread _id_5249();

    if ( isdefined( self.script_linkto ) )
    {
        var_1 = common_scripts\utility::get_linked_ents();

        foreach ( var_3 in var_1 )
        {
            if ( !isspawner( var_3 ) )
            {
                thread _id_5E49( var_3 );
                var_3 thread _id_5E49( self );
            }
        }
    }

    var_0 thread maps\_anim::_id_11C0( self, var_0.animation );

    if ( isdefined( self.script_delay ) )
        maps\_utility::script_delay();
    else
        wait(randomfloatrange( 0, 3 ));

    self.allowdeath = 1;
    self._id_0EC0 = 1;
    var_0 maps\_anim::_id_11C2( self, var_0.animation );
    self._id_0EC0 = undefined;
    self kill();
}

_id_5E49( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self kill();
}

_id_5312( var_0 )
{
    if ( maps\_utility::_id_0AD1( level._id_5313, var_0 ) && self.weapon != "none" )
        maps\_utility::_id_24F5();
}

_id_5E4A()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( isdefined( self ) )
        playfx( common_scripts\utility::getfx( "bodyshot1" ), var_3 );
}

_id_5249()
{
    self.health = 1;
    thread _id_5E4A();
    thread maps\_drone::_id_2014();
    common_scripts\utility::waittill_either( "death", "damage" );

    if ( !isdefined( self ) || isdefined( self._id_5328 ) )
        return;

    thread common_scripts\utility::play_sound_in_space( "generic_death_falling_scream", self.origin );

    if ( common_scripts\utility::cointoss() )
    {
        var_0 = randomintrange( 1, 3 );
        _id_539D( "bodyshot" + var_0, "J_SpineUpper" );
    }
    else
    {
        var_0 = randomintrange( 1, 3 );
        _id_539D( "headshot" + var_0, "tag_eye" );
    }

    wait 2.0;
    animscripts\death::_id_0ECA();
}

_id_539D( var_0, var_1 )
{
    var_2 = self gettagorigin( var_1 );
    playfx( common_scripts\utility::getfx( var_0 ), var_2 );
}

_id_5E4B()
{
    self.goalradius = 64;
    self.pacifist = 1;
    self.ignoresuppression = 1;
    self waittill( "goal" );
    self.ignoresuppression = 0;
    self.pacifist = 0;
    self.goalradius = 1024;
}

_id_5E4C()
{
    level endon( "start_bottom_fight" );
    var_0 = common_scripts\utility::get_target_ent( "cavern_volume" );
    level._id_5DC7 = "scn_prague_tank_alley_exp";
    level._id_5DC8 = level.player;

    for (;;)
    {
        wait(randomfloatrange( 4, 6 ));

        if ( !level.player istouching( var_0 ) )
            continue;

        var_1 = randomfloatrange( 0.3, 0.6 );
        maps\rescue_2_code::_id_5DCA( var_1, "cavern_dust_source", "cavern_primary_light" );
    }
}

_id_5E4D()
{
    level._id_5DC7 = "scn_prague_tank_alley_exp";
    level._id_5DC8 = level.player;
    level._id_5E34 = 2;
    level._id_5E35 = 4;
    level._id_5E4E = 0.4;
    level._id_5E4F = 0.7;
    level._id_5DC9 = 5;

    for (;;)
    {
        wait(randomfloatrange( level._id_5E34, level._id_5E35 ));
        var_0 = randomfloatrange( level._id_5E4E, level._id_5E4F );
        maps\rescue_2_code::_id_5DCA( var_0, "cavern_bottom_fx", "cavern_bottom_primary", 1 );
        var_1 = randomintrange( 2, 5 );
        var_2 = anglestoforward( level.player.angles );
        var_3 = level.player.origin + var_2 * 256 + ( 0.0, 0.0, 128.0 );
        var_2 = anglestoforward( level.player.angles );
        playfx( common_scripts\utility::getfx( "ceiling_rock_collapse" ), level.player.origin + ( 0.0, 0.0, 128.0 ) + var_2 * 128 );
        playfx( common_scripts\utility::getfx( "ceiling_rock_collapse_big" ), level.player.origin + ( 0.0, 0.0, 256.0 ) + var_2 * 512 );

        for ( var_4 = 0; var_4 < var_1; var_4++ )
        {
            playfx( common_scripts\utility::getfx( "cavern_bottom_collapse_dirt" ), var_3 + ( randomfloatrange( 0, 256 ), randomfloatrange( 0, 256 ), 0 ), ( 0.0, 0.0, -1.0 ) );
            wait(randomfloatrange( 0.2, 0.3 ));
        }

        var_1 = randomintrange( 2, 5 );
        var_2 = anglestoforward( level.player.angles );
        var_3 = level.player.origin + var_2 * 1024 + ( 0.0, 0.0, 128.0 );

        for ( var_4 = 0; var_4 < var_1; var_4++ )
        {
            playfx( common_scripts\utility::getfx( "cavern_bottom_collapse_dirt" ), var_3 + ( randomfloatrange( 0, 512 ), randomfloatrange( 0, 512 ), 0 ), ( 0.0, 0.0, -1.0 ) );
            wait(randomfloatrange( 0.2, 0.3 ));
        }
    }
}

_id_5E50()
{
    level endon( "stop_earthquakes" );
    level._id_5E22 = 0.1;
    level._id_5E23 = 0.2;
    level._id_5E24 = 0.6;
    level._id_5E25 = 1.0;
    level._id_5E26 = 0.5;
    level._id_5E27 = 3;

    for (;;)
    {
        var_0 = randomfloatrange( level._id_5E24, level._id_5E25 );
        earthquake( randomfloatrange( level._id_5E22, level._id_5E23 ), var_0, level.player.origin, 1024 );
        wait(var_0);

        if ( level._id_5E26 > 0 )
            wait(randomfloatrange( level._id_5E26, level._id_5E27 ));
    }
}

_id_5E51()
{
    var_0 = getentarray( "cavern_elevator", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        switch ( var_3.classname )
        {
            case "script_brushmodel":
                level._id_5E00 = var_3;
                continue;
            case "script_model":
                var_1 = maps\_utility::_id_0BC3( var_1, var_3 );
                continue;
        }
    }

    foreach ( var_6 in var_1 )
        var_6 linkto( level._id_5E00 );

    level._id_5E52 = getentarray( "cavern_elevator_door", "targetname" );
    common_scripts\utility::array_thread( level._id_5E52, ::_id_5E53 );
    level notify( "open_cavern_elevator" );
}

_id_5E53()
{
    var_0 = common_scripts\utility::get_target_ent();
    self._id_5E54 = self.origin;
    self._id_5E55 = ( var_0.origin[0], var_0.origin[1], self.origin[2] );
    var_1 = 3;

    for (;;)
    {
        level waittill( "open_cavern_elevator" );
        self moveto( self._id_5E55, var_1, var_1 / 2, var_1 / 2 );
        self connectpaths();
        level waittill( "close_cavern_elevator" );
        self moveto( self._id_5E54, var_1, var_1 / 2, var_1 / 2 );
        self disconnectpaths();
    }
}

_id_5E56( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( var_0 );
    var_2 = var_1 common_scripts\utility::get_linked_ents();

    foreach ( var_4 in var_2 )
        var_4 linkto( var_1 );

    return var_1;
}

_id_5E57()
{
    self endon( "death" );

    if ( self.team != "axis" )
    {
        self endon( "stop_breach_behavior" );
        level._id_58BA = self;
        self._id_0D50 = maps\_utility::_id_270F( self.animation + "_death" );

        if ( self.weapon != "none" )
            maps\_utility::_id_24F5();

        thread _id_5292();
        var_0 = spawnstruct();
        level._id_58BA._id_5E12 = var_0;
        var_0.origin = self.origin;
        var_0.angles = self.angles;
        self.health = 1;
        self.allowdeath = 1;
        wait(level._id_4D13);
        self._id_1032 = "president";
        var_0 thread maps\_anim::_id_11C2( self, self.animation );
        wait 0.1;
        childthread _id_5E59();
    }
    else
    {
        thread _id_4D78::_id_4D25();

        if ( issubstr( self.animation, "execution" ) || issubstr( self.animation, "holder" ) )
        {
            level._id_5E58 = self;
            maps\_utility::_id_104A( "deserteagle", "sidearm" );
        }
    }
}

_id_5E59()
{
    level._id_5E58 waittill( "death" );
    var_0 = common_scripts\utility::get_target_ent( "president_rescue_node" );
    var_0.origin = self.origin;
    var_1 = spawnstruct();
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles + ( 0.0, 90.0, 0.0 );
    var_1 maps\_anim::_id_11C2( self, self.animation + "_survives" );
    maps\_utility::_id_128C();
    thread maps\_anim::_id_11C8( self, "pres_getup_idle" );
    var_2 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_0A23, 0 );
    common_scripts\utility::flag_set( "no_mercy" );
}

_id_5292()
{
    level endon( "missionfailed" );
    level.player endon( "death" );
    self waittill( "death", var_0 );
    maps\_utility::_id_1926();
    wait 0.5;
    var_1 = undefined;

    if ( isplayer( var_0 ) )
        var_1 = &"RESCUE_2_FRIENDLY_FIRE";
    else
        var_1 = &"RESCUE_2_PRESIDENT_WAS_KILLED";

    setdvar( "ui_deadquote", var_1 );
    thread maps\_utility::_id_1826();
}

_id_5E5A()
{
    self endon( "death" );

    if ( isdefined( self.target ) )
        wait(randomfloatrange( 15, 20 ));

    self.favoriteenemy = level.player;

    for (;;)
    {
        self setgoalentity( level.player );
        wait(randomfloatrange( 5, 10 ));
        self.goalradius *= 0.5;
    }
}

_id_5E5B()
{
    common_scripts\utility::flag_wait( "cavern_defend_wave_1" );
    wait 2;
    level endon( "cavern_rescue_arrives" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );

        if ( var_0.size < 1 )
        {
            wait 1;
            continue;
        }

        var_0 = sortbydistance( var_0, level.player.origin );
        var_1 = var_0[0];
        var_1.goalradius = 64;
        var_1 setgoalentity( level.player );
        var_1 waittill( "death" );
    }
}

_id_5E5C()
{
    var_0 = getentarray( "defend_trigger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    var_0 = getentarray( "cavern_run", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
}

_id_5E5D()
{
    maps\_utility::_id_26C4( "cavern_breach_exit" );
    var_0 = getentarray( "defend_trigger_off", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    var_0 = getentarray( "defend_trigger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_on );
}

_id_5E5E()
{
    var_0 = getentarray( "cavern_run", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_on );
}

_id_5E5F()
{
    maps\_utility::_id_24F5();
    thread maps\_utility::_id_2611();
    self._id_0D28 = 1;
    self._id_1032 = "alena";
    var_0 = common_scripts\utility::get_target_ent();
    var_0 thread maps\_anim::_id_1246( self, "rescue_chair_untie" );
}

_id_5E60()
{
    common_scripts\utility::flag_wait( "cavern_drop_down" );
    maps\_utility::_id_11F4( "rescue_snd_holdingcell" );
    maps\_utility::_id_262B( "first_breach_trigger", "script_noteworthy" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_openitup" );
}

_id_5E61()
{
    level waittill( "sp_slowmo_breachanim_done" );
    level._id_4877 maps\_utility::_id_123B();
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_109E );
    thread _id_5E62();
    level._id_45C4 thread maps\_utility::_id_168C( "rescue_pri_bloody" );
    level._id_45C4 thread maps\_utility::_id_168C( "rescue_trk_daughter" );
    wait 3;
    maps\_utility::_id_11F4( "rescue_hqr_securedpresident" );
    wait 0.5;
    maps\_utility::_id_11F4( "rescue_snd_foundathena" );
    wait 0.5;
    maps\_utility::_id_11F4( "rescue_hqr_sendinateam" );
    level._id_59E0 thread maps\_utility::_id_26AF( "rescue_aln_mumbles" );
    wait 1.25;
    level._id_45C4 maps\_utility::_id_168C( "rescue_trk_tryingtosay" );
    wait 1.25;
    level._id_45C4 maps\_utility::_id_168C( "rescue_trk_furtherdown" );
    wait 0.5;
    level._id_45C0.a._id_0D26 = "stand";
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_maybealive" );
}

_id_5E62()
{
    var_0 = maps\_utility::_id_272C( "delta_daughter_exfil", 1 );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_0D72, 0 );
    maps\_utility::_id_26C0( "daughter_exfil_position" );
    var_1 = common_scripts\utility::get_target_ent( "daughter_chair_node" );
    thread _id_5E64();
    var_2 = maps\_utility::_id_1287( "flexcuff" );
    var_1 thread maps\_anim::_id_11DD( [ level._id_4877, level._id_45C0, var_2 ], "rescue_chair_untie" );
    wait 12;
    thread _id_5E63( var_0[0] );
    var_1 = common_scripts\utility::get_target_ent( "price_sees_nothing" );
    level._id_4877 setgoalnode( var_1 );
    objective_onentity( maps\_utility::_id_2816( "rescue_prez" ), level._id_4877 );
    objective_setpointertextoverride( maps\_utility::_id_2816( "rescue_prez" ), "" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_109E );
    var_1 = common_scripts\utility::get_target_ent( "cavern_door_kick_node" );
    var_1 maps\_anim::_id_11C4( level._id_45C0, "doorkick_2_cqbrun" );
    thread _id_524A::_id_5213( _id_5E56( "cavern_door_l" ), _id_5E56( "cavern_door_r" ), "scn_rescue_big_metal_dbl_door_kick", undefined, common_scripts\utility::get_target_ent( "cavern_door_kick_fxnode" ) );
    maps\_utility::_id_26C0( "cavern_top_1_trigger" );
    maps\_utility::delaythread( 0.5, maps\_utility::_id_1428, "rescue_2_assault", 0.0 );
    var_2 delete();
    var_1 maps\_anim::_id_11C1( level._id_45C0, "doorkick_2_cqbrun" );
    common_scripts\utility::array_thread( maps\_utility::_id_26C8(), maps\_utility::_id_2686 );
    maps\_utility::_id_26C0( "heroes_post_breach" );
    maps\_utility::_id_265B( "allies" );
    _id_018D( "post_breach" );
    common_scripts\utility::flag_set( "start_chase" );
}

_id_5E63( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( "daughter_chair_node" );
    var_1 maps\_anim::_id_11C4( var_0, "rescue_chair_untie" );
    var_0 maps\_utility::delaythread( 5.5, maps\_utility::_id_26AF, "rescue_dlt1_confirmstation" );
    var_1 maps\_anim::_id_11C1( var_0, "rescue_chair_untie" );
    var_1 thread maps\_anim::_id_11C8( var_0, "rescue_chair_untie_idle" );
}

_id_5E64()
{
    var_0 = common_scripts\utility::get_target_ent( "daughter_chair_node" );
    var_0 maps\_anim::_id_1246( level._id_59E0, "rescue_chair_untie" );
    var_0 thread maps\_anim::_id_124E( level._id_59E0, "rescue_chair_untie_idle" );
}

_id_5E65()
{
    self waittill( "trigger" );
    var_0 = maps\_utility::_id_1BF9( self.target, "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_5E66();
}

_id_5E66()
{
    maps\_utility::script_delay();

    if ( !isdefined( self.script_fxid ) )
        self.script_fxid = "generic_explosion";

    thread common_scripts\utility::play_sound_in_space( "scn_large_tank_explode" );
    var_0 = ( 0.0, 1.0, 0.0 );

    if ( isdefined( self.angles ) )
        var_0 = anglestoforward( self.angles );

    playfx( common_scripts\utility::getfx( self.script_fxid ), self.origin, var_0 );
    earthquake( randomfloatrange( 0.4, 0.6 ), randomfloatrange( 0.4, 0.6 ), self.origin, 2048 );
}

_id_5E67()
{
    self endon( "stop_blood" );
    var_0 = 0.25;
    var_1 = level._effect["crawling_death_blood_smear"];

    if ( isdefined( self.a._id_0D58 ) )
        var_0 = self.a._id_0D58;

    if ( isdefined( self.a._id_0D59 ) )
        var_1 = level._effect[self.a._id_0D59];

    while ( var_0 )
    {
        var_2 = self geteye();
        var_3 = self.angles;
        var_4 = anglestoright( var_3 );
        var_5 = anglestoforward( ( 270.0, 0.0, 0.0 ) );
        playfx( var_1, var_2, var_5, var_4 );
        wait(var_0);
    }
}

_id_5E68()
{
    self waittill( "trigger" );
    var_0 = 0.5;
    maps\rescue_2_code::_id_5DCA( var_0, "cavern_dust_source", "cavern_primary_light" );
}

_id_5E69()
{
    self._id_1032 = "swinging_light";
    maps\_anim::_id_1244();
    self.light = common_scripts\utility::get_target_ent();
    thread _id_524A::_id_5202( self.light, 1.8, 2 );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0 linkto( self, "J_Hanging_Light_03", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self.light thread maps\_utility::_id_2765( var_0 );
    thread maps\_anim::_id_124E( self, "wind_medium" );
}

_id_5E6A()
{
    common_scripts\utility::flag_wait( "cavern_defend_wave_1" );
    level endon( "kill_rescue_heli" );
    level._id_58BA endon( "death" );
    common_scripts\utility::flag_init( "player_close_to_president" );

    for (;;)
    {
        common_scripts\utility::flag_set( "player_close_to_president" );

        while ( _id_5E6B() )
            wait 0.05;

        common_scripts\utility::flag_clear( "player_close_to_president" );
        childthread _id_5E6C();

        while ( !_id_5E6B() )
            wait 0.05;
    }
}

_id_5E6B()
{
    if ( distance( level.player.origin, level._id_58BA.origin ) < 350 )
        return 1;

    var_0 = maps\_utility::_id_26C8();

    foreach ( var_2 in var_0 )
    {
        if ( distance( level.player.origin, var_2.origin ) < 350 )
            return 1;
    }

    return 0;
}

_id_5E6C()
{
    level endon( "player_close_to_president" );
    wait 3;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_yurigetbackhere" );
    wait 5;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_whereareyougoing" );
    wait 5;
    level._id_58BA maps\_utility::_id_1902();
    level._id_58BA kill();
}

_id_5E6D( var_0, var_1 )
{
    level._id_4877 unlink();
    level._id_51F2 unlink();
    var_0 notify( "stop_price_loop" );
    _id_5E6F( var_1 );
    _id_5E70( var_1 );
}

_id_5E6E( var_0 )
{
    var_1 = _id_524A::_id_51F1();
    var_1 hide();
    level.player playerlinktodelta( var_1, "tag_origin", 1, 120, 60, 20, 80 );
    var_2 = "tag_guy6";
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player enableinvulnerability();
    var_3 = level._id_5DEF gettagorigin( var_2 ) - ( 0.0, 0.0, 30.0 );
    var_4 = level._id_5DEF gettagangles( var_2 ) - ( 0.0, 180.0, 0.0 );
    var_1 moveto( var_3 - anglestoright( var_4 ) * 5, var_0 );
    var_1 rotateto( var_4, var_0 );
    var_1 waittill( "movedone" );
}

_id_5E6F( var_0 )
{
    level._id_4877 linkto( var_0, "tag_detach" );
    var_0 thread maps\_anim::_id_124E( level._id_4877, "bh_idle", "stop_price_loop", "tag_detach" );
}

_id_5E70( var_0 )
{
    var_1 = "tag_guy6";
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_2 = var_0 gettagorigin( var_1 ) - ( 0.0, 0.0, 30.0 );
    var_3 = var_0 gettagangles( var_1 ) - ( 0.0, 180.0, 0.0 );
    level._id_51F2.origin = var_2 - anglestoright( var_3 ) * 5;
    level._id_51F2.angles = var_3;
    level._id_51F2 linkto( var_0, var_1 );
}

_id_5320( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "rpg_straight";

    var_4 = common_scripts\utility::get_target_ent( var_0 );
    var_5 = var_4 common_scripts\utility::get_target_ent();
    var_6 = magicbullet( var_2, var_4.origin, var_5.origin );

    if ( isdefined( var_1 ) )
    {
        var_6 waittill( "death" );
        playfx( common_scripts\utility::getfx( var_1 ), var_6.origin );

        if ( isdefined( var_3 ) )
            common_scripts\utility::do_earthquake( var_3, var_6.origin );
    }
}

_id_5E71( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( "ending_delta_vignette" );
    var_0 = maps\_utility::_id_272F( "vignette_drone" );
    var_0 thread maps\_utility::_id_0D04();
    var_0._id_0D28 = 1;
    var_0._id_5E72 = 1;
    var_0.a._id_0D55 = 1;
    var_1 thread maps\_anim::_id_11C1( var_0, "rescue_ending_delta_retreat_sandman_ambusher" );
    var_2 = getanimlength( maps\_utility::_id_270F( "rescue_ending_delta_retreat_truck_ambusher" ) );
    wait 0.1;
    var_0.allowdeath = 1;
    var_0.a._id_0D55 = 1;
    wait(var_2 * 0.9);

    if ( isalive( var_0 ) )
    {
        var_0 maps\_utility::_id_1902();
        var_0 kill();
    }
}

_id_5E73( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( "ending_delta_vignette" );
    var_0 = maps\_utility::_id_272F( "vignette_drone" );
    var_0 thread maps\_utility::_id_0D04();
    var_0._id_0D28 = 1;
    var_0._id_5E72 = 1;
    var_0.a._id_0D55 = 1;
    var_1 thread maps\_anim::_id_11C1( var_0, "rescue_ending_delta_retreat_truck_ambusher" );
    var_2 = getanimlength( maps\_utility::_id_270F( "rescue_ending_delta_retreat_truck_ambusher" ) );
    wait 0.1;
    var_0 maps\_utility::_id_1902();
    var_0.allowdeath = 1;
    var_0.a._id_0D55 = 1;
    wait(var_2 * 0.9);

    if ( isalive( var_0 ) )
    {
        var_0 maps\_utility::_id_1902();
        var_0 kill();
    }
}

_id_5E74( var_0, var_1 )
{
    return var_0 + ( var_1 - var_0 ) * 0.5;
}

_id_5E75()
{
    if ( isdefined( level._id_5DEF._id_1B4B ) )
        return level._id_5DEF._id_1B4B;

    level._id_5DEF._id_1B4B = common_scripts\utility::spawn_tag_origin();
    level._id_5DEF._id_1B4B.origin = level._id_5DEF gettagorigin( "tag_ground" );
    level._id_5DEF._id_1B4B.angles = level._id_5DEF gettagangles( "tag_ground" );
    level._id_5DEF._id_1B4B linkto( level._id_5DEF, "tag_ground" );
    return level._id_5DEF._id_1B4B;
}

_id_5E76()
{
    var_0 = 0;
    var_1 = common_scripts\utility::get_target_ent( "pilot_spawner" );
    var_2 = maps\_utility::_id_212D( var_1 );
    var_2._id_2511 = var_0;
    maps\_utility::_id_2683( var_2 );
    return var_2;
}

_id_5E77()
{
    _id_526F();
    self.script_noteworthy = "die_on_goal";
    var_0 = common_scripts\utility::get_target_ent();

    if ( !issubstr( self._id_164F, "randompath" ) )
        var_0 = var_0 maps\_utility::_id_266B( "struct" );

    if ( isdefined( var_0.animation ) )
        self._id_0D50 = maps\_utility::_id_270F( var_0.animation );
    else
        self._id_0D50 = common_scripts\utility::random( level._id_5E78 );
}

_id_526F()
{
    if ( !isdefined( self._id_164F ) )
        thread _id_5249();
    else
    {
        if ( issubstr( self._id_164F, "notsolid" ) )
            self notsolid();

        if ( issubstr( self._id_164F, "stagger" ) )
            thread _id_53B8();
        else
        {
            if ( issubstr( self._id_164F, "headshot" ) )
            {
                thread _id_5E79();
                return;
            }

            thread _id_5249();
        }
    }
}

_id_5E79()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = self gettagorigin( "tag_eye" );
    playfx( common_scripts\utility::getfx( "headshot1" ), var_0 );
    wait 2.0;
    animscripts\death::_id_0ECA();
}

_id_53B8()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = getanimlength( self._id_0D50 ) * 0.3;
    _id_53B9( var_0 );
    wait 2.0;
    animscripts\death::_id_0ECA();
}

_id_53B9( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = [ "j_spinelower", "j_spineupper", "j_shoulder_le", "j_shoulder_ri", "j_head" ];

    var_2 = [ "bodyshot1", "bodyshot2", "headshot1", "headshot2" ];

    for ( var_3 = 0; var_0 > var_3; var_3 += var_5 )
    {
        var_4 = var_2[randomintrange( 0, var_2.size )];
        playfxontag( common_scripts\utility::getfx( var_4 ), self, var_1[randomintrange( 0, var_1.size )] );
        var_5 = randomfloatrange( 0.1, 0.2 );
        wait(var_5);
    }
}

_id_5E7A()
{
    var_0 = self;

    for (;;)
    {
        wait(randomfloatrange( 3, 5 ));
        var_1 = var_0 maps\_utility::_id_166F();
        var_1 waittill( "death" );
    }
}

_id_5E7B( var_0 )
{
    if ( !isdefined( self._id_5E7C ) )
    {
        self._id_5E7D = 500;
        self._id_5E7C = -1;
    }

    var_1 = getaiarray( "axis" );
    var_2 = var_0 gettagorigin( "tag_flash" );
    var_3 = var_0 gettagangles( "tag_flash" );
    var_4 = anglestoforward( var_3 );

    if ( common_scripts\utility::cointoss() )
        var_1 = sortbydistance( var_1, var_0.origin );

    if ( gettime() - self._id_5E7C < self._id_5E7D )
        self._id_5E7C = gettime();
    else
        return;

    foreach ( var_6 in var_1 )
    {
        if ( !isdefined( var_6._id_5E72 ) )
        {
            if ( maps\_utility::_id_26AB( var_2, var_3, var_6.origin, cos( 65 ) ) )
            {
                wait 0.1;

                if ( isalive( var_6 ) )
                {
                    var_6 kill();
                    break;
                }
            }
        }
    }
}

_id_5E7E()
{
    for (;;)
    {
        self rotatepitch( 180, 0.6 );
        wait 0.5;
    }
}

_id_5E7F()
{
    self.health = 1;
}

_id_5E80()
{
    thread maps\_ambient::_id_1946( "scn_rescue2_news", level._id_1707 );
}

_id_5E81()
{
    self endon( "death" );
    self._id_5E72 = 1;
    self.health = 1;
    self.goalradius = 1;
    self setgoalpos( self.origin );
    self.favoriteenemy = level.player;
    wait(randomfloatrange( 5, 8 ));
    self kill();
}

_id_5E82()
{
    var_0 = getdvarint( "play_alarm", 1 );

    if ( var_0 )
    {
        common_scripts\utility::flag_wait( "start_base_alarm" );
        var_1 = getent( "origin_sound_alarm", "targetname" );
        var_1 playloopsound( "emt_alarm_base_alert" );
        common_scripts\utility::flag_waitopen( "start_base_alarm" );
        var_1 stoploopsound( "emt_alarm_base_alert" );
    }
}

_id_5E83( var_0 )
{
    wait 0.1;

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    if ( !isdefined( self._id_2184 ) )
        self._id_2184 = 20;

    var_1 = self getlightintensity();

    if ( var_1 <= 0 )
        return;

    thread _id_524A::_id_5202( self, var_1 * 0.6, var_1 );
    thread _id_524A::_id_5208( self, self._id_2184 );
}

_id_5E84()
{
    var_0 = common_scripts\utility::get_target_ent( "defend_player_damage_trigger" );
    level endon( "cavern_run_to_heli" );
    childthread _id_5E85( "defend_player_kill_trigger" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        var_1 = anglestoforward( level.player.angles );
        level.player dodamage( 60, level.player.origin + var_1 );
        wait 1;
    }
}

_id_5E85( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( var_0 );
    var_1 waittill( "trigger" );
    level.player kill();
}

_id_5E86()
{
    maps\_utility::_id_262C( "pipes_fall_1_trigger" );
    wait 0.6;
    var_0 = getentarray( "pipes_fall_1", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = vectornormalize( level.player.origin - var_2.origin );
        var_4 = common_scripts\utility::random( [ 200, 350, 450 ] );
        var_2 movegravity( var_3 * var_4, 10 );
        var_2 rotatevelocity( ( randomfloatrange( -40, 40 ), randomfloatrange( -40, 40 ), randomfloatrange( -40, 40 ) ), 10 );
    }

    maps\_utility::_id_262C( "pipes_fall_2_trigger" );
    wait 1;
    var_0 = getentarray( "pipes_fall_2", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = vectornormalize( level.player.origin - var_2.origin );
        var_4 = common_scripts\utility::random( [ 200, 350, 450 ] );
        var_2 movegravity( var_3 * var_4, 10 );
        var_2 rotatevelocity( ( randomfloatrange( -40, 40 ), randomfloatrange( -40, 40 ), randomfloatrange( -40, 40 ) ), 10 );
    }
}

_id_5E87()
{
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( 0.3, 0.6 ));
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
        {
            if ( !isdefined( var_2._id_5E72 ) && distance2d( var_2.origin, self.origin ) < 200 )
            {
                var_2 kill();
                break;
            }
        }
    }
}

_id_5E88()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = getaiarray( "axis" );

        if ( var_0.size > 0 )
        {
            self getenemyinfo( var_0[0] );
            self.favoriteenemy = var_0[0];
            var_0[0] common_scripts\utility::waittill_notify_or_timeout( "death", 10 );
            continue;
        }

        wait 0.3;
    }
}

_id_018D( var_0 )
{
    wait 0.05;

    if ( common_scripts\utility::flag( "lots_of_time" ) )
        maps\_utility::_id_1425( var_0 );
}
