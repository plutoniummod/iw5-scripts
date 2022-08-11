// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

_id_775D()
{
    level._id_5157 = maps\paris_shared::_id_5076( "bomb_truck", "script_noteworthy" );
    level._id_5157._id_1032 = "bomb_truck";
    level._id_5157 maps\_vehicle::_id_2A12();
    level._id_5157._id_5097 = %armored_van_scripted;
    level._id_5157 hideallparts();
    level._id_50DE = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level._id_50DE setmodel( level._id_5157.model );
    level._id_50DE._id_1032 = level._id_5157._id_1032;
    level._id_50DE maps\_utility::_id_2629();
    level._id_50DE thread _id_781A();
    level._id_50DE thread _id_781B();
    level._id_50DE thread _id_781E( 4 );
    level._id_50DE thread _id_781E( 5 );
    level._id_50DE._id_775E = -1 * level._id_50DE gettagorigin( "tag_body" );
    level._id_50DE linkto( level._id_5157, "tag_body", level._id_50DE._id_775E, ( 0.0, 0.0, 0.0 ) );
}

_id_775F()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "electronics_pda_big" );
    var_0 linkto( level._id_7683, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 = common_scripts\utility::getstruct( "struct_a_b_switch", "script_noteworthy" );
    var_1 maps\_anim::_id_1246( self, "a_b_switch_pt1" );
    var_0 delete();
}

_id_7760()
{
    var_0 = common_scripts\utility::getstruct( "struct_a_b_switch", "script_noteworthy" );
    var_0 maps\_anim::_id_1246( self, "a_b_switch_pt1" );
}

_id_7761()
{
    maps\paris_shared::_id_50E0();
    var_0 = getdvarint( "g_friendlyNameDist" );
    setsaveddvar( "g_friendlyNameDist", 0 );
    level.player maps\paris_shared::_id_50A8( 0 );
    level.player disableweapons();
    level.player setstance( "crouch" );
    level.player allowstand( 0 );
    level.player allowcrouch( 1 );
    level.player allowprone( 0 );
    var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2 linkto( var_1, "tag_player", ( 0.0, 0.0, 20.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playerlinktodelta( var_2, "tag_origin", 1, 0, 0, 0, 0, 1 );
    var_3 = common_scripts\utility::getstruct( "struct_a_b_switch", "script_noteworthy" );
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_3.origin;
    var_4.angles = var_3.angles;
    var_5 = 0.5;
    var_6 = 5.21875;
    var_4 common_scripts\utility::delaycall( getanimlength( var_1 maps\_utility::_id_1281( "a_b_switch_pt1" ) ) - var_5 - 0.1, ::moveto, var_4.origin + ( 0, 0, var_6 ), var_5 );
    var_1 linkto( var_4, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 maps\_anim::_id_1246( var_1, "a_b_switch_pt1" );
    level.player unlink();
    level.player maps\paris_shared::_id_50A5();
    var_1 delete();
    var_2 delete();
    var_4 delete();
    maps\_utility::delaythread( 1, maps\paris_shared::_id_50E1 );
    setsaveddvar( "g_friendlyNameDist", var_0 );
}

_id_7762()
{
    thread maps\_introscreen::_id_1D97( 0.25, 0.5 );
    level.player disableweapons();
    level.player setstance( "crouch" );
    level.player common_scripts\utility::delaycall( 0.05, ::setstance, "crouch" );
    level.player allowstand( 0 );
    level.player allowcrouch( 1 );
    level.player allowprone( 0 );
    var_0 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_1 = maps\_utility::_id_1287( "player_gasmask", level.player.origin );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2 linkto( var_0, "tag_player", ( 0.0, 0.0, 20.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playerlinktodelta( var_2, "tag_origin", 1, 0, 0, 0, 0, 1 );
    var_3 = common_scripts\utility::getstruct( "struct_a_b_switch", "script_noteworthy" );
    var_4 = 5.21875;
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5.origin = var_3.origin + ( 0, 0, var_4 );
    var_5.angles = var_3.angles;
    var_0 linkto( var_5, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_6 = 0.4;
    var_7 = getanimlength( var_0 maps\_utility::_id_1281( "a_b_switch_pt2" ) ) - var_6;
    maps\_utility::delaythread( var_7, ::_id_7763, var_6, var_0, var_1 );
    var_5 thread maps\_anim::_id_1246( var_1, "a_b_switch_pt2" );
    var_5 maps\_anim::_id_1246( var_0, "a_b_switch_pt2" );
    var_8 = var_0 gettagangles( "tag_player" );
    level.player unlink();
    level.player maps\paris_shared::_id_50A5();
    var_0 delete();
    var_1 delete();
    var_2 delete();
    var_5 delete();
    thread _id_7764();
}

_id_7763( var_0, var_1, var_2 )
{
    var_1 hide();
    var_2 hide();
    level.player maps\paris_shared::_id_50A5();
    level.player maps\paris_shared::_id_50D9( var_0, 0, 0, 0, 0 );
    level.player unlink();
}

_id_7764()
{
    var_0 = 5.25;
    level.player endon( "death" );
    wait 0.25;
    var_1 = gettime() + var_0 * 1000;

    while ( length( level.player getnormalizedmovement() ) < 0.001 && level.player getstance() == "crouch" && gettime() < var_1 )
        common_scripts\utility::waitframe();

    if ( level.player getstance() == "crouch" )
        level.player setstance( "stand" );
}

_id_7742( var_0 )
{
    level.player maps\paris_shared::_id_50A9();
}

_id_7765()
{
    maps\_utility::_id_2611();
    thread maps\_audio::_id_170B( level.scr_sound["lonestar"]["paris_lns_onelight"] );
    var_0 = common_scripts\utility::getstruct( "struct_a_b_switch", "script_noteworthy" );
    var_0 maps\_anim::_id_1247( self, "a_b_switch_pt2" );
    maps\_utility::_id_13A4( "b" );
    thread maps\paris_shared::_id_50AE( -234, 0.8, 1.2 );
    maps\_utility::_id_109B();
    common_scripts\utility::flag_wait( "set_flare_1" );
    _id_77F4( maps\paris_shared::_id_5076( "flare_light_1", "script_noteworthy" ), common_scripts\utility::getstruct( "flare_plant_1", "script_noteworthy" ) );
    common_scripts\utility::flag_wait( "set_flare_2" );
    _id_77F4( maps\paris_shared::_id_5076( "flare_light_2", "script_noteworthy" ), common_scripts\utility::getstruct( "flare_plant_2", "script_noteworthy" ) );
    common_scripts\utility::flag_wait( "trigger_catacombs_gate" );
    common_scripts\utility::flag_wait( "set_flare_3" );
    _id_77F4( maps\paris_shared::_id_5076( "flare_light_3", "script_noteworthy" ), common_scripts\utility::getstruct( "flare_plant_3", "script_noteworthy" ) );
    common_scripts\utility::flag_wait( "flag_catacombs_player_past_squeeze_corridor" );
    _id_776C( undefined, 5 );
    common_scripts\utility::flag_set( "flag_lone_star_past_fallen_corridor" );
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait_any( "set_flare_4", "flag_catacombs_enemy_gate" );

    if ( common_scripts\utility::flag( "flag_catacombs_enemy_gate" ) )
    {
        maps\paris_shared::_id_50DA( "flare_plant_4", 0 );
        return;
    }

    _id_77F4( maps\paris_shared::_id_5076( "flare_light_4", "script_noteworthy" ), common_scripts\utility::getstruct( "flare_plant_4", "script_noteworthy" ) );
    common_scripts\utility::flag_wait_any( "set_flare_5", "flag_catacombs_enemy_gate" );

    if ( common_scripts\utility::flag( "flag_catacombs_enemy_gate" ) )
    {
        maps\paris_shared::_id_50DA( "flare_plant_5", 0 );
        return;
    }

    _id_77F4( maps\paris_shared::_id_5076( "flare_light_5", "script_noteworthy" ), common_scripts\utility::getstruct( "flare_plant_5", "script_noteworthy" ) );
}

_id_7766()
{
    thread maps\paris_shared::_id_50AE( -156, 0.8, 1.2 );
    maps\_utility::_id_2611();
    maps\_utility::_id_123B();
    maps\_utility::_id_109B();
    self._id_0F3C = 1;
    maps\paris_shared::_id_5085( getnode( "node_sewer_intro_frenchie", "targetname" ), 0 );
    wait 4.5;
    maps\paris_shared::_id_50DA( "frenchie_flashlight_on", 1, self );
    thread _id_776D();
    wait 1.5;
    common_scripts\utility::flag_set( "flag_dialogue_stay_close" );
    maps\_utility::_id_1417( "onme" );
    maps\_utility::_id_13A4( "r" );
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "flag_sewer_sabre_signal_stop_pos" );
    maps\_utility::_id_123B();
    var_0 = common_scripts\utility::getstruct( "struct_catacombs_signal_quick_stop", "script_noteworthy" );
    var_0 maps\_anim::_id_11C4( self, "catacombs_signal_quick_stop" );
    var_0 maps\_anim::_id_11C0( self, "catacombs_signal_quick_stop" );
    common_scripts\utility::flag_wait( "flag_sewer_sabre_signal_stop_start" );
    var_0 maps\_anim::_id_11C3( self, "catacombs_signal_quick_stop" );
    maps\paris_shared::_id_50DA( "catacombs_signal_look", 1, self, 1 );
    maps\_anim::_id_11DD( [ self ], "catacombs_signal_look", undefined, 1.0, "generic" );
    common_scripts\utility::flag_set( "flag_dialogue_frenchie_signal_clear_sewer" );
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "trigger_catacombs_gate" );
    maps\_utility::_id_123B();
    var_0 = getent( "catacombs_gate_origin", "script_noteworthy" );
    var_0 maps\_anim::_id_124A( self, "catacombs_gate_enter_enter" );
    var_0 maps\_anim::_id_1246( self, "catacombs_gate_enter_enter" );
    var_0 thread maps\_anim::_id_124E( self, "catacombs_gate_enter_idle", "frenchie_ender" );
    common_scripts\utility::flag_set( "flag_catacombs_gate_frenchie_idling" );
    common_scripts\utility::flag_wait( "flag_catacombs_gate_begin" );
    wait 5.7;
    var_0 notify( "frenchie_ender" );
    var_0 maps\_anim::_id_1247( self, "catacombs_gate_enter" );
    thread maps\paris_shared::_id_50AF();
    self._id_0FC6 = 0.7;
    _id_776C( "flag_frenchie_fallen_corridor_committed", 0.5 );
    common_scripts\utility::flag_set( "flag_dialogue_frenchie_check_right" );
    maps\paris_shared::_id_5085( "node_frenchie_past_squeeze_corridor", 1 );
    thread maps\paris_shared::_id_50AE( -156, 0.8, 1.2 );
    common_scripts\utility::flag_wait( "flag_catacombs_player_past_squeeze_corridor" );
    maps\_utility::_id_1417( "go" );
    wait 1;
    common_scripts\utility::flag_set( "flag_dialogue_this_way_post_squeeze" );
    maps\_utility::_id_2686();
}

_id_7767()
{
    thread maps\paris_shared::_id_50AE( -156, 0.8, 1.2 );
    maps\_utility::_id_2611();
    maps\_utility::_id_123B();
    maps\_utility::_id_109B();
    maps\paris_shared::_id_5085( getnode( "node_sewer_intro_reno", "targetname" ), 0 );
    wait 7.5;
    maps\_utility::_id_13A4( "o" );
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "flag_catacombs_player_past_squeeze_corridor" );
    wait 3;
    _id_776C( undefined, 5 );
    common_scripts\utility::flag_set( "flag_reno_past_fallen_corridor" );
    maps\_utility::_id_2686();
}

_id_7768()
{
    maps\_utility::_id_2611();
    var_0 = common_scripts\utility::getstruct( "struct_a_b_switch", "script_noteworthy" );
    var_0 maps\_anim::_id_1247( self, "a_b_switch_pt2" );
    maps\_utility::_id_13A4( "y" );
    thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    maps\_utility::_id_109B();
    common_scripts\utility::flag_wait( "trigger_catacombs_gate" );
    maps\_utility::_id_123B();
    var_0 = getent( "catacombs_gate_origin", "script_noteworthy" );
    var_0 maps\_anim::_id_124A( self, "catacombs_gate_enter_enter" );
    var_0 maps\_anim::_id_1246( self, "catacombs_gate_enter_enter" );
    var_0 thread maps\_anim::_id_124E( self, "catacombs_gate_enter_idle", "redshirt_ender" );
    common_scripts\utility::flag_set( "flag_catacombs_gate_redshirt_idling" );
    common_scripts\utility::flag_wait( "flag_catacombs_gate_begin" );
    thread maps\paris_shared::_id_50AF();
    var_0 notify( "redshirt_ender" );
    maps\_utility::delaythread( 0.5, animscripts\notetracks::_id_23E3 );
    maps\paris_shared::_id_50DA( "catacombs_gate_enter", 1, self, 4 );
    var_0 maps\_anim::_id_1247( self, "catacombs_gate_enter" );
    thread maps\paris_shared::_id_50AF();
    self._id_0FC6 = 0.7;
    maps\paris_shared::_id_5085( "node_catacombs_gate_guy1_wait", 0 );
    _id_776C( "flag_redshirt_fallen_corridor_committed" );
    thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    maps\paris_shared::_id_5085( "node_redshirt_past_squeeze_corridor", 1 );
    common_scripts\utility::flag_wait( "flag_catacombs_player_past_squeeze_corridor" );
    wait 2;
    maps\_utility::_id_2686();
}

_id_7769()
{
    var_0 = getent( "catacombs_gate_model", "script_noteworthy" );
    var_1 = getent( "catacombs_gate_origin", "script_noteworthy" );
    var_1 maps\_anim::_id_1246( var_0, "catacombs_gate_enter" );
}

_id_776A()
{
    wait 8;
    var_0 = maps\paris_shared::_id_5076( "catacombs_gate_brushmodel", "script_noteworthy" );
    var_0 connectpaths();
    var_0 delete();
}

_id_776B()
{
    var_0 = maps\_utility::_id_1287( "crowbar" );
    var_0 hide();
    var_0 common_scripts\utility::delaycall( 0.3, ::show );
    var_1 = getent( "catacombs_gate_origin", "script_noteworthy" );
    var_1 maps\_anim::_id_1246( var_0, "catacombs_gate_enter" );
    var_0 delete();
}

_id_776C( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 4;

    var_2 = common_scripts\utility::getstruct( "struct_catacombs_squeeze_moment", "script_noteworthy" );
    var_2 maps\_anim::_id_124A( self, "squeeze_through_fallen_corridor" );
    self._id_0FC6 = 1;
    common_scripts\utility::flag_waitopen( "flag_npc_in_squeeze_corridor" );
    common_scripts\utility::flag_set( "flag_npc_in_squeeze_corridor" );
    maps\_utility::delaythread( var_1, common_scripts\utility::flag_clear, "flag_npc_in_squeeze_corridor" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_set( var_0 );

    maps\paris_shared::_id_50DA( "fallen_corridor_" + self._id_1032, 1, self, 3 );
    var_2 maps\_anim::_id_1247( self, "squeeze_through_fallen_corridor" );
}

_id_776D()
{
    _id_77E6();
    self._id_107E = 1;
    thread _id_77E9();
}

_id_776E()
{
    _id_77E8();
    self notify( "flashlight_control_stop" );
    self._id_107E = undefined;
}

_id_776F()
{
    common_scripts\utility::flag_wait( "flag_catacombs_bomb_1" );
    maps\_audio::aud_send_msg( "catacombs_bomb_1" );
    earthquake( 0.3, 3, level.player.origin, 850 );
    var_0 = getent( "origin_catacombs_bomb_1", "targetname" );
    playfx( level._effect["falling_dirt_catacomb"], var_0.origin );
}

_id_7770()
{
    var_0 = getent( "blocker_corridor", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    wait 3.5;
    var_1 = common_scripts\utility::getstruct( "struct_catacombs_squeeze_moment", "script_noteworthy" );
    var_2 = maps\_utility::_id_1287( "player_rig" );
    var_2 hide();
    var_1 maps\_anim::_id_11CF( var_2, "fallen_corridor_f" );
    maps\_audio::aud_send_msg( "aud_prime_catacombs_squeeze" );
    level.player maps\paris_shared::_id_508D( getstartorigin( var_1.origin, var_1.angles, var_2 maps\_utility::_id_1281( "fallen_corridor_f" ) ), 32, 0.5 );
    var_3 = 0.5;
    level.player playerlinktoblend( var_2, "tag_player", var_3, var_3 / 3, var_3 / 3 );
    level.player common_scripts\utility::delaycall( var_3, ::playerlinktodelta, var_2, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player maps\paris_shared::_id_50A4();
    var_2 common_scripts\utility::delaycall( 0.5, ::show );
    maps\_audio::aud_send_msg( "aud_start_catacombs_squeeze" );
    wait(var_3);
    var_4 = 0.3;
    level.player maps\_utility::delaythread( getanimlength( var_2 maps\_utility::_id_1281( "fallen_corridor_f" ) ) - var_4, maps\paris_shared::_id_50D9, var_4, 0, 0, 0, 0 );
    var_1 maps\_anim::_id_1246( var_2, "fallen_corridor_f" );
    level.player unlink();
    level.player maps\paris_shared::_id_50A5();
    var_2 delete();
}

_id_4C6B()
{
    playfxontag( common_scripts\utility::getfx( "flashlight_ai" ), self, "tag_flash" );
    self._id_51D5 = 1;
}

_id_7771()
{
    common_scripts\utility::flag_wait( "flag_catacombs_bomb_2" );
    maps\_audio::aud_send_msg( "catacombs_bomb_2" );
    earthquake( 0.1, 3, level.player.origin, 850 );
    var_0 = getent( "origin_catacombs_bomb_2", "targetname" );
    playfx( level._effect["falling_dirt_catacomb"], var_0.origin );
}

_id_7772()
{
    common_scripts\utility::flag_wait( "flag_shadow_gag_main_room" );
    maps\_audio::aud_send_msg( "shadow_gag_main_room" );
    var_0 = getent( "guy_shadow_gag_1", "script_noteworthy" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1 endon( "death" );
    maps\paris_shared::_id_50DA( "shadow_gag_shadow", 1, var_1.origin + ( -78.0, -312.0, 4.0 ), 1 );
    maps\paris_shared::_id_50DA( "shadow_gag_guy", 1, var_1, 1.25 );
    var_1 maps\_utility::_id_2612( 1 );
    var_1 maps\_utility::_id_0A23( 1 );
    var_1 maps\_utility::_id_109B();
    var_1.goalradius = 8;
    var_2 = getnode( "goal_shadow_gag_1", "targetname" );
    var_1 setgoalnode( var_2 );
    var_1 waittill( "goal" );
    var_1 delete();
}

_id_7773()
{
    _id_7774();
    common_scripts\utility::flag_wait( "flag_catacombs_enemy_gate" );
    maps\_utility::_id_265B( "allies" );
    _id_7775();

    if ( !common_scripts\utility::flag( "flag_catacombs_enemy_gate_gag_vfx" ) )
        maps\paris_shared::_id_50DA( "catacombs_enemy_gate_gag", 0 );

    foreach ( var_1 in [ level._id_7684, level._id_76BA, level._id_7683, level._id_76BB ] )
    {
        var_1 maps\_utility::_id_109E();
        var_1._id_0FC6 = 1;
    }
}

_id_7774()
{
    var_0 = common_scripts\utility::getstruct( "catacombs_gate_ambush", "script_noteworthy" );
    var_1 = maps\paris_shared::_id_5076( "catacombs_gate_ambush_door", "script_noteworthy" );
    var_1._id_1032 = "ambush_gate";
    var_1 maps\_utility::_id_2629();
    var_0 maps\_anim::_id_11CF( var_1, "gate_ambush" );
}

_id_7775()
{
    level endon( "flag_volk_catacombs_escape" );
    var_0 = common_scripts\utility::getstruct( "catacombs_gate_ambush", "script_noteworthy" );
    var_1 = maps\paris_shared::_id_5076( "catacombs_gate_ambush_door", "script_noteworthy" );
    level._id_76BA maps\paris_shared::_id_460E();
    level._id_76BA maps\_utility::_id_123B();
    var_0 maps\_anim::_id_124A( level._id_76BA, "gate_ambush" );
    common_scripts\utility::flag_set( "flag_combat_staging_room" );

    if ( !common_scripts\utility::flag( "flag_catacombs_enemy_gate_abort" ) )
    {
        maps\paris_shared::_id_50DA( "catacombs_enemy_gate_gag", 1, level._id_76BA );
        common_scripts\utility::flag_set( "flag_catacombs_enemy_gate_gag_vfx" );
        maps\_audio::aud_send_msg( "enemy_gate_gag", var_1 );
        var_2 = maps\paris_shared::_id_5076( "guy_catacombs_enemy_gate_1", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
        var_0 thread maps\_anim::_id_11C1( var_2, "gate_ambush" );
        var_0 thread maps\_anim::_id_1246( var_1, "gate_ambush" );
        var_0 maps\_anim::_id_1247( level._id_76BA, "gate_ambush" );
        var_3 = getent( "blocker_catacombs_gate", "script_noteworthy" );

        if ( isdefined( var_3 ) )
            var_3 delete();

        if ( isdefined( var_2 ) )
        {
            var_2._id_0EC0 = 1;
            var_2 kill();
        }

        common_scripts\utility::flag_set( "flag_dialogue_catacombs_lets_move" );
    }

    foreach ( var_5 in [ level._id_7684, level._id_76BA, level._id_7683, level._id_76BB ] )
    {
        var_5 maps\_utility::_id_109E();
        var_5._id_0FC6 = 1;
    }

    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    common_scripts\utility::noself_delaycall( 10, ::setsaveddvar, "ai_friendlyFireBlockDuration", 2000 );
    level._id_76BA maps\paris_shared::_id_460C();
    level._id_76BA maps\paris_shared::_id_5085( getnode( "node_frenchie_post_ambush", "targetname" ), 1 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    level._id_76BA maps\_utility::delaythread( 1, maps\_utility::_id_1417, "moveup" );
    level._id_76BA maps\_utility::_id_2686();
}

_id_7776()
{
    common_scripts\utility::flag_wait( "flag_combat_staging_room" );
    maps\_utility::_id_265B( "allies" );
    var_0 = getentarray( "ai_staging_room", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::add_spawn_function( ::_id_4C6B );
        var_2 maps\_utility::_id_166F( 1 );
    }

    maps\_audio::aud_send_msg( "mus_catacombs_ambush" );
}

_id_7777()
{
    level.player endon( "death" );
    maps\paris_shared::_id_50E0();
    var_0 = 1.3;
    var_1 = 600;
    var_2 = 0.2;
    var_3 = 0.2;
    var_4 = 0.3;
    var_5 = 1;
    var_6 = 1.5;
    common_scripts\utility::flag_set( "flag_dialogue_makarov_men" );
    common_scripts\utility::flag_set( "flag_combat_staging_room" );
    var_7 = getentarray( "ai_staging_room_runners", "script_noteworthy" );

    foreach ( var_9 in var_7 )
        var_9 maps\_utility::_id_166F( 1 );

    foreach ( var_12 in getaiarray( "axis" ) )
        var_12 thread _id_777C( 3 );

    var_14 = getent( "volk_catacombs", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_14 maps\_utility::_id_104A( "deserteagle", "primary" );
    var_14._id_20A3 = "none";
    var_14.secondaryweapon = "none";
    var_14._id_1005 = "none";
    level._id_7778 = var_14;
    var_14._id_1032 = "volk";
    var_14 thread _id_7784();
    var_14 maps\_utility::_id_2712();
    var_14 maps\_utility::_id_2611();
    var_14 maps\paris_shared::_id_460E();
    var_15 = getent( "volk_escape_guard_spawner", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_15._id_1032 = "guard";
    var_15 maps\_utility::_id_0D04();
    var_16 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_16 hide();
    level._id_777B maps\_anim::_id_11BF( [ var_16, var_14, level._id_7779, level._id_777A, var_15 ], "volk_escape" );
    thread _id_7780();
    var_17 = var_16 common_scripts\utility::spawn_tag_origin();
    var_16 linkto( var_17, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_18 = common_scripts\utility::getstruct( "struct_flashbang_origin", "script_noteworthy" );
    var_19 = common_scripts\utility::getstruct( var_18.target, "targetname" );
    var_20 = magicgrenademanual( "flash_grenade", var_18.origin, vectornormalize( var_19.origin - var_18.origin ) * var_1, 100 );
    common_scripts\utility::flag_wait_or_timeout( "flag_volk_catacombs_escape_flash", var_0 );
    level._id_7683 maps\_utility::_id_123B();
    level._id_76BA maps\_utility::_id_123B();
    level._id_7684 maps\_utility::_id_123B();
    level._id_76BB maps\_utility::_id_123B();
    maps\paris_shared::_id_50DA( "scripted_flashbang", 1, var_20.origin );
    maps\_audio::aud_send_msg( "scripted_flashbang", var_20.origin );
    playfx( common_scripts\utility::getfx( "scripted_flashbang" ), var_20.origin, ( 1.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    var_20 delete();
    level.player maps\paris_shared::_id_50A4( 0 );
    level.player hideviewmodel();
    level.player enableinvulnerability();
    level.player _id_69BB();
    setslowmotion( 1.0, var_2, var_3 );
    level.player common_scripts\utility::noself_delaycall( var_3 + var_4, ::setslowmotion, var_2, 1.0, var_5 );
    level.player shellshock( "paris_scripted_flashbang", 3 );
    level._id_76BA maps\paris_shared::_id_460C();
    level._id_76BA maps\_utility::_id_1414();
    common_scripts\utility::waitframe();
    level.player playerlinktodelta( var_16, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player lerpviewangleclamp( 0.2, 0, 0, 2, 2, 7, 7 );
    var_16 show();
    var_21 = 6;
    var_17 common_scripts\utility::delaycall( 0.05, ::movez, var_21, 0.1 );
    var_15 maps\_utility::_id_1902();
    common_scripts\utility::exploder( 62002 );
    var_22 = getstartorigin( level._id_777B.origin, level._id_777B.angles, level._id_76BA maps\_utility::_id_1281( "volk_escape" ) );
    badplace_cylinder( "", 15, var_22, 117, 100, "axis" );
    thread _id_777E( level._id_777B, var_14 );
    level._id_777B thread maps\_anim::_id_1246( var_15, "volk_escape" );
    var_23 = 0.3;
    level.player maps\_utility::delaythread( getanimlength( var_16 maps\_utility::_id_1281( "volk_escape" ) ) - var_23, maps\paris_shared::_id_50D9, var_23, 2, 2, 7, 7 );
    level._id_777B maps\_anim::_id_11DD( [ var_16, level._id_76BA, level._id_7779, level._id_777A ], "volk_escape" );
    level.player unlink();
    level.player maps\paris_shared::_id_50A5();
    level.player showviewmodel();
    level.player common_scripts\utility::delaycall( var_6, ::disableinvulnerability );
    var_16 delete();
    var_17 delete();
    maps\paris_shared::_id_50E1();
    level.player setmovespeedscale( 0.85 );
    level._id_7683 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    level._id_76BB thread maps\paris_shared::_id_50AE( 156, 0.8, 1.2 );
    level._id_76BA thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2 );
    thread _id_77ED( 30, &"PARIS_FAIL_VOLK_ESCAPED" );
    thread _id_777D();
}

_id_777C( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_1058( 1 );
    wait(var_0);
    maps\_utility::_id_1058( 0 );
}

_id_777D()
{
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level._id_76BA maps\_utility::_id_2686();
    wait 1.3;
    level._id_7683 maps\_utility::_id_2686();
    wait 1.3;
    level._id_7684 maps\_utility::_id_2686();
    wait 1.3;
    level._id_76BB maps\_utility::_id_2686();
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
}

_id_777E( var_0, var_1 )
{
    var_1 maps\_utility::_id_1902();
    thread maps\_utility::_id_273C( 0.1, 40 );
    maps\_utility::delaythread( 2, maps\_utility::_id_273C, 1.5, 65 );
    var_0 maps\_anim::_id_1247( var_1, "volk_escape" );
    var_1 thread _id_777F();
    var_1 maps\paris_shared::_id_5085( getnode( "node_volk_catacombs_escape", "targetname" ), 1 );
    var_1 notify( "stop_fail_if_volk_dies" );
    maps\paris_shared::_id_50DA( "jank_volk_catacombs_escape_delete", 1, var_1 );
    var_1 delete();
}

_id_777F()
{
    self endon( "death" );
    wait 3;
    self._id_0FC6 = 1.3;
    wait 2;
    self._id_0FC6 = 1.5;
}

_id_7780()
{
    thread _id_7781();
    wait 3.5;
    var_0 = getent( "ai_staging_room_volk_guard_1", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_0 maps\paris_shared::_id_5085( getnode( "node_ai_staging_room_volk_guard_1", "targetname" ), 0 );
    wait 2;
    var_1 = getent( "ai_staging_room_volk_guard_2", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_1.ignoreall = 1;
    var_1 maps\paris_shared::_id_5085( getnode( "node_ai_staging_room_volk_guard_2", "targetname" ), 1 );
    var_2 = getent( "info_v_infrastructure_hall", "targetname" );

    if ( isalive( var_1 ) )
        var_1 setgoalvolumeauto( var_2 );

    wait 4;

    if ( isalive( var_1 ) )
        var_1.ignoreall = 0;
}

_id_7781()
{
    wait 0.45;
    var_0 = getent( "ai_staging_room_volk_guard_3", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_0 endon( "death" );
    var_0.ignoreall = 1;
    var_0 maps\paris_shared::_id_5085( getnode( "node_ai_staging_room_volk_guard_3", "targetname" ), 1 );
    var_0.ignoreall = 0;
    wait 1;
    var_1 = getent( "info_v_infrastructure_hall", "targetname" );
    var_0 cleargoalvolume();
    var_0 setgoalvolumeauto( var_1 );
}

_id_7782()
{
    var_0 = getent( "volk_boiler_room_escape", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    level._id_7778 = var_0;
    maps\paris_shared::_id_50DA( "jank_volk_boiler_room_escape_spawn", 1, var_0 );
    var_0 thread _id_7784();
    var_0._id_0FC6 = 1.5;
    var_0 maps\_utility::_id_2611();
    var_0 maps\paris_shared::_id_460E();
    maps\_utility::_id_1425( "boiler_room_escape" );
    thread _id_77ED( 50, &"PARIS_FAIL_VOLK_ESCAPED" );
    var_0 maps\paris_shared::_id_5085( getnode( "node_volk_boiler_room_escape", "targetname" ), 1 );
    var_1 = 0.85;
    level.player thread maps\paris_shared::_id_50DC( var_1, 1, 4 );
    var_0 notify( "stop_fail_if_volk_dies" );
    maps\paris_shared::_id_50DA( "jank_volk_boiler_room_escape_delete", 1, var_0 );
    var_0 delete();
    common_scripts\utility::flag_set( "flag_volk_boiler_room_escape_complete" );
}

_id_7783()
{
    var_0 = getent( "volk_apartment_escape", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    level._id_7778 = var_0;
    maps\paris_shared::_id_50DA( "jank_volk_apartment_escape_spawn", 1, var_0 );
    var_0 thread _id_7784();
    var_0 maps\paris_shared::_id_460E();
    var_0 maps\paris_shared::_id_5085( getnode( "node_volk_apartment_escape", "targetname" ), 1 );
    var_0 notify( "stop_fail_if_volk_dies" );
    maps\paris_shared::_id_50DA( "jank_volk_apartment_escape_delete", 1, var_0 );
    var_0 delete();
}

_id_7784()
{
    self endon( "stop_fail_if_volk_dies" );
    self waittill( "death" );
    setdvar( "ui_deadquote", &"PARIS_FAIL_CAPTURE_VOLK_ALIVE" );
    maps\_utility::_id_1826();
}

_id_7785()
{
    maps\_audio::aud_send_msg( "catacombs_bomb_3" );
    earthquake( 0.3, 3, level.player.origin, 850 );
    var_0 = getent( "origin_catacombs_bomb_3", "targetname" );
    playfx( level._effect["falling_dirt_catacomb"], var_0.origin );
}

_id_7786()
{
    var_0 = getentarray( "ai_catacombs_exit", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::add_spawn_function( ::_id_4C6B );
        var_2 maps\_utility::_id_166F( 1 );
    }

    common_scripts\utility::waitframe();
    var_4 = [ "ai_boiler_room_runners", "ai_catacombs_exit", "ai_boiler_room" ];
    maps\paris_shared::_id_507F( 4, var_4, 1 );
    common_scripts\utility::flag_set( "flag_ai_boiler_room_runners" );
}

_id_7787()
{
    level._id_7683 maps\_utility::_id_2712();
    level._id_76BA maps\_utility::_id_2712();
    level._id_7684 maps\_utility::_id_2712();
    level._id_76BB maps\_utility::_id_2712();
}

_id_7788()
{
    level._id_7683 maps\_utility::_id_2713();
    level._id_76BA maps\_utility::_id_2713();
    level._id_7684 maps\_utility::_id_2713();
    level._id_76BB maps\_utility::_id_2713();
}

_id_7789()
{
    var_0 = getentarray( "ai_boiler_room_runners", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::add_spawn_function( ::_id_4C6B );
        var_2 maps\_utility::_id_166F( 1 );
    }

    common_scripts\utility::waitframe();
    var_4 = [ "ai_boiler_room_runners", "ai_catacombs_exit", "ai_boiler_room" ];
    maps\paris_shared::_id_507F( 3, var_4, 1 );
    maps\paris_shared::_id_50DF( "trigger_color_corridor_2", 1 );
    maps\paris_shared::_id_507F( 0, var_4, 1 );
    maps\paris_shared::_id_50DF( "trigger_color_corridor_3", 1 );
    thread _id_7787();
}

_id_778A()
{
    var_0 = getentarray( "ai_boiler_room_exit", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );
}

_id_778B()
{
    common_scripts\utility::flag_wait( "flag_chase_gaz_barricade_01" );
    maps\paris_shared::_id_5083( "enemy_ai_catacombs_exit", 128 );
    maps\paris_shared::_id_5083( "enemy_ai_catacombs_exit_flood", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_01", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_01_hind", 128 );
    maps\_utility::_id_2756( [ level._id_76BB, level._id_76BA ], 512 );
}

_id_778C()
{
    var_0 = getent( "blocker_ai_volk_sedan_escape", "targetname" );
    var_0 disconnectpaths();
    var_1 = getentarray( "enemy_ai_catacombs_exit", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 maps\_utility::_id_166F( 1 );

    var_5 = getentarray( "enemy_ai_catacombs_exit_flood", "script_noteworthy" );

    if ( var_5.size > 0 )
        maps\_spawner::_id_2135( var_5 );

    thread _id_7793();
    var_6 = getent( "ali_convoy_1", "targetname" );
    var_7 = getent( "ali_convoy_2", "targetname" );
    maps\_utility::_id_1425( "chemical_ali_escape" );
    thread _id_77ED( 45, &"PARIS_FAIL_GET_TO_VAN" );
    thread _id_778D( var_6, var_7 );
}

_id_778D( var_0, var_1 )
{
    var_2 = getent( "ali_guard_02", "script_noteworthy" );
    var_3 = var_2 maps\_utility::_id_166F( 1 );
    var_4 = getent( "chemical_ali", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    level._id_7778 = var_4;
    var_4._id_1032 = "volk";
    var_3._id_1032 = "sedan_guard";

    if ( level._id_1F19 != "chase" )
        maps\paris_shared::_id_50DA( "jank_volk_enter_car_spawn", 1, level._id_778E.origin + ( 0.0, 0.0, 64.0 ) );

    foreach ( var_6 in [ var_4, var_3 ] )
    {
        var_6 maps\_utility::_id_0A23( 1 );
        var_6 maps\_utility::_id_2612( 1 );
        var_6 maps\_utility::_id_1057();
        var_6 maps\_utility::_id_2712();
        var_6 maps\_utility::_id_2611();
    }

    var_3 linkto( level._id_778E, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_778E thread maps\_anim::_id_124E( var_3, "sedan_escape_passengers_loop", "ender", "tag_body" );
    var_4 linkto( level._id_778E, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\paris_shared::_id_50DA( "volk_enter_car", 1, var_4, 2 );
    level._id_778E thread maps\_anim::_id_1246( var_4, "sedan_escape", "tag_body" );
    thread _id_7790();
    thread _id_7791( var_0 );
    thread _id_7792( var_1 );
    maps\_utility::delaythread( 0.75, _id_03A5::_id_5151, level._id_778E );
    var_8 = getvehiclenode( level._id_778E.target, "targetname" );
    maps\_audio::aud_send_msg( "volk_escape", level._id_778E );
    level._id_778E maps\paris_shared::_id_5096( level._id_778F, "sedan_escape", 1, 0, var_8, 1, 1 );
    level._id_778E thread maps\_anim::_id_124E( var_4, "sedan_escape_loop", "ender", "tag_body" );
    level._id_778E waittill( "death" );

    if ( isdefined( var_3 ) )
        var_3 delete();

    if ( isdefined( var_4 ) )
        var_4 delete();
}

_id_7790()
{
    wait 6;
    var_0 = getent( "blocker_ai_volk_sedan_escape", "targetname" );
    var_0 connectpaths();
    var_0 delete();
}

_id_7791( var_0 )
{
    wait 1.5;
    var_0 maps\_vehicle::_id_1FA6();
    wait 7;
    var_0 maps\_vehicle::_id_2A3D();
}

_id_7792( var_0 )
{
    wait 2;
    var_0 maps\_vehicle::_id_1FA6();
}

_id_7793()
{
    var_0 = maps\_vehicle::_id_2A9A( "mi17_01_escape_ambient" );
    maps\_audio::aud_send_msg( "mi17_01_escape_ambient", var_0 );
    var_1 = maps\_vehicle::_id_2A9A( "mi17_02_escape_ambient" );
    maps\_audio::aud_send_msg( "mi17_02_escape_ambient", var_1 );
    var_2 = maps\_vehicle::_id_2A9A( "mi17_03_escape_ambient" );
    maps\_audio::aud_send_msg( "mi17_03_escape_ambient", var_2 );
    wait 2.0;
    var_3 = maps\_vehicle::_id_2A9A( "mi17_01_escape" );
    maps\_audio::aud_send_msg( "mi17_01_escape", var_3 );
}

_id_7794()
{
    level.player endon( "death" );
    common_scripts\utility::flag_set( "flag_dialogue_in_the_truck" );
    common_scripts\utility::flag_set( "spawn_initial_vehicle_wave" );
    maps\paris_shared::_id_5081( "enemy_ai_catacombs_exit_flood" );
    thread _id_779F();
    _id_77F9();
    thread _id_03A5::_id_5150( level._id_50DE );
    level._id_5157 thread maps\_vehicle::_id_1FA6();
    maps\_audio::aud_send_msg( "bomb_truck_start", level._id_5157 );
    common_scripts\utility::flag_set( "flag_chase_gaz_barricade_01" );
    level.player enableweapons();
    thread _id_51D7();
}

_id_7795()
{
    maps\_utility::_id_2712();
}

_id_51D7()
{
    level endon( "player_exits_bomb_truck" );
    level._id_5157 endon( "death" );
    var_0 = 40;

    for (;;)
    {
        var_1 = min( level._id_5157 vehicle_getspeed(), var_0 );

        if ( var_1 > 5 )
        {
            var_2 = 0.125 * var_1 / 25;
            earthquake( var_2, 2, level.player.origin, 512 );
        }

        wait(randomfloatrange( 0.1, 0.3 ));
    }
}

_id_7796( var_0, var_1, var_2, var_3, var_4 )
{
    level.player endon( "death" );

    if ( !isalive( level.player ) )
        return;

    level._id_7797._id_7798 = var_1;
    level._id_7797._id_7799 = var_2;
    level._id_7797._id_779A = var_3;
    level._id_7797._id_779B = var_4;

    if ( level.player islinked() )
    {
        level.player notify( "stop_adjust_view_fraction_during_ride" );
        level.player lerpviewangleclamp( var_0, var_0 / 3, var_0 / 3, var_1, var_2, var_3, var_4 );
    }
    else
        level.player playerlinktoblend( level._id_7797, "tag_player", var_0, var_0 / 3, var_0 / 3 );

    level.player maps\_utility::delaythread( var_0, ::_id_779C, level._id_50DE, 1 );
}

_id_779C( var_0, var_1 )
{
    level.player endon( "death" );
    level.player endon( "adjust_view_fraction_during_ride_stop" );
    var_2 = 25;
    var_3 = 85;
    var_4 = 0.6;
    var_5 = 1.0;
    var_6 = 0.3;
    var_7 = 1.0;
    var_8 = 0.2;
    level.player notify( "stop_adjust_view_fraction_during_ride" );
    level.player endon( "stop_adjust_view_fraction_during_ride" );
    var_9 = -1;
    var_10 = anglestoforward( var_0.angles );

    while ( self islinked() )
    {
        if ( isdefined( self._id_779D ) )
        {
            var_11 = self._id_779D;
            var_12 = 0.0001;
        }
        else
        {
            var_13 = self playerads();
            var_14 = anglestoforward( var_0.angles );
            var_15 = acos( clamp( vectordot( var_14, var_10 ), -1, 1 ) ) * 20;
            var_10 = var_14;
            var_16 = ( -1.0 * vectordot( var_14, anglestoforward( level.player getplayerangles() ) ) + 1 ) * 0.5;
            var_16 = maps\paris_shared::_id_50B1( var_16, 0, 1, 1 - var_8, 1 );
            var_17 = clamp( ( var_15 - var_2 ) / ( var_3 - var_2 ), 0, 1 ) * var_16;
            var_11 = maps\_utility::_id_281D( var_13, maps\_utility::_id_281D( var_17, var_4, var_5 ), maps\_utility::_id_281D( var_17, var_6, var_7 ) );
            var_12 = 0.2;
        }

        if ( abs( var_11 - var_9 ) >= var_12 )
        {
            self playerlinktodelta( level._id_7797, "tag_origin", var_11, level._id_7797._id_7798, level._id_7797._id_7799, level._id_7797._id_779A, level._id_7797._id_779B, var_1 );
            var_9 = var_11;
        }

        common_scripts\utility::waitframe();
    }
}

_id_779E()
{
    level.player notify( "adjust_view_fraction_during_ride_stop" );
}

_id_779F()
{
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    var_0 = getentarray( "trigger_chase_scripting_on", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 common_scripts\utility::trigger_on();

    wait 2;
    var_4 = getent( "ai_enemy_1_chase_shoot_at_van", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_5 = getentarray( "ai_enemy_2_chase_shoot_at_van", "script_noteworthy" );

    foreach ( var_7 in var_5 )
    {
        var_8 = var_7 maps\_utility::_id_166F( 1 );
        var_8 maps\_utility::_id_2712();
    }

    var_5 = getentarray( "ai_enemy_5_chase_shoot_at_van", "script_noteworthy" );
    wait 1;

    foreach ( var_7 in var_5 )
    {
        var_8 = var_7 maps\_utility::_id_166F( 1 );
        var_8 maps\_utility::_id_2712();
        var_8 maps\_utility::_id_2612( 1 );
        var_8 maps\_utility::_id_0A23( 1 );
    }

    wait 2;
    _id_77A3();
    wait 5;
    var_12 = getent( "ai_enemy_3_chase_shoot_at_van", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_13 = getent( "ai_enemy_4_chase_shoot_at_van", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
}

_id_77A0()
{
    common_scripts\utility::flag_wait( "chase_uaz_01" );
    wait 1;
    maps\_audio::aud_send_msg( "chase_uaz_01" );
    var_0 = maps\_vehicle::_id_2881( "chase_uaz_01" );
    var_0 endon( "death" );
    var_0 maps\_vehicle::_id_2A12();
    wait 3;
    var_0 maps\_vehicle::_id_2A13();
    maps\_audio::aud_send_msg( "gaz_death", var_0 );
    common_scripts\utility::flag_wait( "flag_chase_fake_rpg_2" );
    var_0 maps\_vehicle::_id_2A3D();
}

_id_77A1()
{
    common_scripts\utility::flag_wait( "flag_ai_enemy_chase_encounter_04" );
    var_0 = maps\_vehicle::_id_2A99( "gaz_chase_3" );
    common_scripts\utility::flag_wait( "flag_gaz_chase_2" );
    var_0 maps\_vehicle::_id_1FA6();
    maps\_audio::aud_send_msg( "chase_gaz_02", var_0 );
    var_0 thread maps\paris_shared::_id_50CF();
    var_0 thread maps\paris_shared::_id_50D7( 5, 3, 3 );
    maps\_audio::aud_send_msg( "gaz_death", var_0 );
}

_id_77A2()
{
    common_scripts\utility::flag_wait( "spawn_initial_vehicle_wave" );
    wait 1.0;
    maps\_vehicle::_id_2A9A( "chase_uaz_initial_02" );
    wait 6.0;
    maps\_vehicle::_id_2A9A( "chase_uaz_initial_03" );
}

_id_77A3()
{
    var_0 = common_scripts\utility::getstruct( "org_start_fake_rpg_1", "targetname" );
    var_1 = common_scripts\utility::getstruct( "org_target_fake_rpg_1", "targetname" );
    var_2 = missile_createrepulsorent( level.player, 1000, 512 );
    var_3 = magicbullet( "rpg_straight", var_0.origin, var_1.origin );
    var_4 = [ var_3, var_0.origin, var_1.origin ];
    maps\_audio::aud_send_msg( "aud_rpg_3d_short", var_4 );
}

_id_77A4()
{
    common_scripts\utility::flag_wait( "spawn_tank_01" );
    level._id_77A5 = maps\_vehicle::_id_2A99( "tank_01" );
    level._id_77A5._id_1032 = "tank";
    level._id_77A5 maps\_vehicle::_id_2A12();
    level._id_77A5 maps\_vehicle::_id_2A3D();
    level._id_77A5 maps\_vehicle::_id_1FA6();
    level._id_77A5 thread _id_77AA();
    maps\_audio::aud_send_msg( "pars_chase_tank_start" );
    var_0 = getent( "tank_crush_sedan", "script_noteworthy" );
    var_0._id_1032 = "sedan";
    var_0 maps\_anim::_id_1244();
    var_1 = getvehiclenode( "tank_crush_end_node", "script_noteworthy" );
    level._id_77A5 maps\paris_shared::_id_5095( var_0, "tank_crush" );
    maps\_audio::aud_send_msg( "pars_chase_tank_smash" );
    level._id_77A5 notify( "start_aiming_at_player" );
    level._id_77A5 thread maps\paris_shared::_id_5096( var_0, "tank_crush", 1, 0, var_1, 1.07, 1 );
    var_0 thread maps\_anim::_id_1246( var_0, "tank_crush" );
    var_0 thread maps\_vehicle::_id_2AA2( "tag_window_left_glass_fx", level._id_28F0["tankcrush"]["window_med"], "veh_glass_break_small", 0.1 );
    var_0 thread maps\_vehicle::_id_2AA2( "tag_window_right_glass_fx", level._id_28F0["tankcrush"]["window_med"], "veh_glass_break_small", 0.1 );
    var_0 thread maps\_vehicle::_id_2AA2( "tag_windshield_back_glass_fx", level._id_28F0["tankcrush"]["window_large"], "veh_glass_break_large", 0.05 );
    var_0 thread maps\_vehicle::_id_2AA2( "tag_windshield_front_glass_fx", level._id_28F0["tankcrush"]["window_large"], "veh_glass_break_large", 0.2 );
    wait 1.25;
    level._id_7683 thread _id_780E( "van_ride_lightslam_left" );
    wait 2;
    level._id_7683 thread _id_780E( "van_ride_hardslam_left" );
    thread _id_77B0();
    thread _id_77B1();
}

_id_77A6()
{
    common_scripts\utility::flag_wait( "flag_van_climb_paired_moment" );
    wait 1.75;
    var_0 = maps\paris_shared::_id_5076( "van_climb_paired_guy", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = level._id_50DE gettagorigin( "tag_guy" );
    var_1.angles = level._id_50DE gettagangles( "tag_guy" );
    var_2 = getanimlength( var_0 maps\_utility::_id_26EC( "van_climb_paired" ) );
    var_0.forceragdollimmediate = 1;
    var_0._id_0D45 = ::_id_77A9;
    maps\paris_shared::_id_50DA( "van_climb_paired", 1, var_0, 2 );
    level._id_7683 thread _id_780E( "van_climb_paired" );
    var_0 thread _id_77A7();
    var_1 thread maps\_anim::_id_11C1( var_0, "van_climb_paired", "tag_origin" );
    var_3 = 1.2;
    wait(var_2 - var_3);

    if ( isalive( var_0 ) )
    {
        var_0.allowdeath = 1;
        var_0 kill();
    }

    wait(var_3);
    maps\_utility::delaythread( 4, common_scripts\utility::flag_set, "flag_tank_moment_ai_move_up" );
    common_scripts\utility::flag_set( "flag_van_climb_paired_done" );
    maps\_utility::delaythread( 1, ::_id_77A8 );
}

_id_77A7()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_1 == level.player )
        {
            self.allowdeath = 1;
            self._id_0D45 = undefined;
            self kill();
        }
    }
}

_id_77A8()
{
    level.player enableinvulnerability();
    level.player.health = level.player.maxhealth;
    thread maps\_utility::_id_1C43();
    wait 3;
    level.player disableinvulnerability();
}

_id_77A9()
{
    animscripts\shared::_id_0D73();
    self startragdoll();
    wait 1;
}

_id_77AA()
{
    level._id_77A5 thread maps\_vehicle::_id_2B12();
    thread _id_77AF( -2, -40 );
    self waittill( "start_aiming_at_player" );
    self notify( "stop_tank_hold_turret_fixed" );
    var_0 = getent( "origin_tank_01_fire_over_player", "targetname" );
    level._id_77A5 _id_77AE( var_0, ( 0.0, 0.0, 0.0 ), 3 );
    level._id_77A5 setturrettargetent( var_0 );
    common_scripts\utility::flag_wait( "tank_01_fire_over_player" );
    level.player playrumbleonentity( "heavy_2s" );
    thread _id_7819();
    thread _id_03A5::_id_5154( level._id_77A5 );
    maps\_audio::aud_send_msg( "pars_chase_tank_shoot_01" );
    level._id_77A5 maps\_vehicle::_id_2A3E();
    wait 3;
    var_1 = getent( "origin_tank_02_fire_over_player", "targetname" );
    level._id_77A5 setturrettargetent( var_1 );
    wait 2.5;
    thread _id_03A5::_id_5155( level._id_77A5 );
    maps\_audio::aud_send_msg( "pars_chase_tank_shoot_02" );
    wait 0.3;
    maps\_audio::aud_send_msg( "pars_chase_tank_impact_02" );
    earthquake( 0.3, 3, level.player.origin, 850 );
    level.player playrumbleonentity( "heavy_3s" );
    level._id_77A5 maps\_vehicle::_id_2A13();
}

_id_77AB( var_0 )
{
    var_1 = self gettagorigin( "tag_turret" );
    var_2 = combineangles( self.angles, var_0 );
    self setturrettargetvec( var_1 + 100000 * anglestoforward( var_2 ) );
}

_id_77AC( var_0 )
{
    var_1 = self gettagorigin( "tag_turret" );
    var_2 = vectortoangles( var_0 - var_1 );
    var_3 = transformmove( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), self.origin, self.angles, var_1, var_2 );
    return var_3["angles"];
}

_id_77AD()
{
    var_0 = transformmove( ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), self.origin, self.angles, self gettagorigin( "tag_turret" ), self gettagangles( "tag_turret" ) );
    return var_0["angles"];
}

_id_77AE( var_0, var_1, var_2 )
{
    var_3 = gettime() + var_2 * 1000;

    for (;;)
    {
        var_4 = ( var_3 - gettime() ) / 1000;
        var_5 = ( 0.0, 0.0, 0.0 );

        if ( isdefined( var_1 ) )
            var_5 += var_1;

        if ( isdefined( var_0 ) && isdefined( var_0.origin ) )
            var_5 += var_0.origin;

        var_6 = _id_77AD();
        var_7 = _id_77AC( var_5 );
        var_8 = clamp( 0.05 / max( var_4, 0.05 ), 0, 1 );
        var_9 = maps\paris_shared::_id_50B3( var_6, var_7, var_8 );
        _id_77AB( var_9 );

        if ( var_4 < 0 )
            return;

        common_scripts\utility::waitframe();
    }
}

_id_77AF( var_0, var_1 )
{
    self endon( "stop_tank_hold_turret_fixed" );

    for (;;)
    {
        _id_77AB( ( var_0, var_1, 0 ) );
        common_scripts\utility::waitframe();
    }
}

_id_77B0()
{

}

_id_77B1()
{
    common_scripts\utility::flag_wait( "flag_van_slam_storefront_01" );
    level._id_5157._id_2941 = 0;
    maps\_audio::aud_send_msg( "van_slam_storefront_01" );
    wait 0.1;
    level.player playrumbleonentity( "heavy_2s" );
    earthquake( 0.5, 0.5, level.player.origin, 850 );
    setblur( 2.0, 0.1 );
    wait 0.3;
    setblur( 0, 0.2 );
    maps\_audio::aud_send_msg( "start_engine_03" );
    var_0 = getentarray( "origin_van_slam_storefront_01", "targetname" );

    foreach ( var_0 in var_0 )
        maps\_audio::aud_send_msg( "van_storefront_destroy_glass", var_0.origin );
}

_id_77B2()
{
    common_scripts\utility::flag_wait( "flag_ai_enemy_chase_encounter_04" );
    maps\_utility::_id_272D( "ai_enemy_chase_encounter_04", 1 );
    maps\_utility::_id_272D( "ai_enemy_chase_encounter_04_runners", 1 );
}

_id_77B3()
{
    common_scripts\utility::flag_wait( "spawn_gaz_02" );
    var_0 = getentarray( "ai_enemy_chase_tank_moment", "script_noteworthy" );
    var_1 = maps\_vehicle::_id_2A99( "gaz_02" );
    var_1 thread maps\paris_shared::_id_50CF();
    maps\_audio::aud_send_msg( "gaz_death", var_1 );
    common_scripts\utility::flag_wait( "flag_gaz_02_gopath" );

    foreach ( var_3 in var_0 )
        var_4 = var_3 maps\_utility::_id_166F( 1 );

    wait 9;
    var_1 maps\_vehicle::_id_1FA6();
    var_1 thread maps\paris_shared::_id_50D7( 13, 4, 4 );
}

_id_77B4()
{
    common_scripts\utility::flag_wait( "flag_canal_combat_01" );
    var_0 = getentarray( "ai_enemy_chase_encounter_05", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_3 = var_2 maps\_utility::_id_166F( 1 );
}

_id_77B5()
{
    common_scripts\utility::flag_wait( "flag_canal_runners_01" );
    var_0 = getentarray( "ai_enemy_chase_encounter_06", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_3 = var_2 maps\_utility::_id_166F( 1 );
}

_id_77B6()
{
    common_scripts\utility::flag_wait( "flag_canal_combat_02" );
    var_0 = getentarray( "ai_enemy_chase_encounter_07", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 maps\_utility::_id_166F( 1 );
        var_3 maps\_utility::_id_2712();
    }
}

_id_77B7()
{
    var_0 = getent( "blocker_path_canal_end", "targetname" );
    var_0 disconnectpaths();
    var_1 = maps\_vehicle::_id_2881( "chase_canal_uaz_01" );
    var_1 thread maps\paris_shared::_id_50CF();
    var_1 thread maps\paris_shared::_id_50D7( 7, 2, 8.5 );
    maps\_audio::aud_send_msg( "gaz_death", var_1 );
    maps\_vehicle::_id_2A9A( "jet_canal_01" );
    maps\_vehicle::_id_2A9A( "jet_canal_02" );
}

_id_77B8()
{
    common_scripts\utility::flag_wait( "flag_chase_canal_uaz_02" );
    var_0 = maps\_vehicle::_id_2881( "chase_canal_uaz_02" );
    var_0 endon( "death" );
    maps\_audio::aud_send_msg( "uaz_jump_bridge", var_0 );
    maps\_audio::aud_send_msg( "gaz_death", var_0 );
    var_0 thread maps\paris_shared::_id_50CF();
    var_0 maps\_vehicle::_id_2A3D();
    wait 3;
    var_0 maps\_vehicle::_id_2A3E();
    var_0 thread maps\paris_shared::_id_50D7( 10, 5, 7.5 );
}

_id_77B9()
{
    common_scripts\utility::flag_wait( "flag_chase_fake_rpg_2" );
    var_0 = common_scripts\utility::getstruct( "org_start_fake_rpg_2", "targetname" );
    var_1 = common_scripts\utility::getstruct( "org_target_fake_rpg_2", "targetname" );
    var_2 = common_scripts\utility::getstruct( "org_start_fake_rpg_3", "targetname" );
    var_3 = common_scripts\utility::getstruct( "org_target_fake_rpg_3", "targetname" );
    var_4 = missile_createrepulsorent( level._id_77A5, 1000, 512 );
    var_5 = magicbullet( "rpg_straight", var_0.origin, var_1.origin );
    var_6 = [ var_5, var_0.origin, var_1.origin ];
    maps\_audio::aud_send_msg( "aud_rpg_2d", var_6 );
    wait 1;
    var_7 = magicbullet( "rpg_straight", var_2.origin, var_3.origin );
    var_8 = [ var_7, var_2.origin, var_3.origin ];
    maps\_audio::aud_send_msg( "aud_rpg_3d", var_8 );
}

_id_77BA()
{
    common_scripts\utility::flag_wait( "kill_ai_enemy_chase_encounter_02" );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_02", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_gaz_1", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_gaz_2", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_gaz_3", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_03", 128 );
}

_id_77BB()
{
    common_scripts\utility::flag_wait( "flag_gaz_02_gopath" );
    maps\paris_shared::_id_5083( "ai_enemy_1_chase_shoot_at_van" );
    maps\paris_shared::_id_5083( "ai_enemy_2_chase_shoot_at_van" );
    maps\paris_shared::_id_5083( "ai_enemy_3_chase_shoot_at_van" );
    maps\paris_shared::_id_5083( "ai_enemy_4_chase_shoot_at_van" );
    maps\paris_shared::_id_5083( "ai_enemy_5_chase_shoot_at_van" );
}

_id_77BC()
{
    common_scripts\utility::flag_wait( "kill_ai_enemy_chase_encounter_02" );
    common_scripts\utility::flag_set( "flag_dialogue_tank_targeting_us" );
    var_0 = common_scripts\utility::getstruct( "org_start_fake_rpg_4", "targetname" );
    var_1 = common_scripts\utility::getstruct( "org_target_fake_rpg_4", "targetname" );
    var_2 = missile_createrepulsorent( level.player, 1000, 512 );
    var_3 = magicbullet( "rpg_straight", var_0.origin, var_1.origin );
    var_4 = [ var_3, var_0.origin, var_1.origin ];
    maps\_audio::aud_send_msg( "aud_rpg_3d", var_4 );
}

_id_77BD()
{
    common_scripts\utility::flag_wait( "spawn_tank_02" );
    wait 2;
    var_0 = common_scripts\utility::getstruct( "org_start_fake_rpg_5", "targetname" );
    var_1 = common_scripts\utility::getstruct( "org_target_fake_rpg_5", "targetname" );
    var_2 = missile_createrepulsorent( level.player, 1000, 512 );
    var_3 = magicbullet( "rpg", var_0.origin, var_1.origin );
    var_4 = [ var_3, var_0.origin, var_1.origin ];
    maps\_audio::aud_send_msg( "aud_rpg_3d", var_4 );
    wait 2;
    var_0 = common_scripts\utility::getstruct( "org_start_fake_rpg_6", "targetname" );
    var_1 = common_scripts\utility::getstruct( "org_target_fake_rpg_6", "targetname" );
    var_2 = missile_createrepulsorent( level.player, 1000, 512 );
    var_3 = magicbullet( "rpg", var_0.origin, var_1.origin );
    var_4 = [ var_3, var_0.origin, var_1.origin ];
    maps\_audio::aud_send_msg( "aud_rpg_3d", var_4 );
}

_id_77BE()
{
    common_scripts\utility::flag_wait( "kill_ai_enemy_chase_encounter_04" );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_04", 128 );
}

_id_77BF()
{
    common_scripts\utility::flag_wait( "kill_ai_enemy_chase_encounter_04_runners" );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_04_runners", 128 );
}

_id_77C0()
{
    common_scripts\utility::flag_wait( "kill_ai_enemy_chase_encounter_05" );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_05", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_06", 128 );
    maps\paris_shared::_id_5083( "ai_enemy_chase_gaz_4" );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_mid_canal" );
}

_id_77C1()
{
    common_scripts\utility::flag_wait( "flag_ai_clean_up_galleria" );
    maps\paris_shared::_id_5083( "ai_enemy_chase_encounter_07" );
}

_id_77C2()
{
    common_scripts\utility::flag_wait( "flag_heli_post_river" );
    var_0 = maps\_vehicle::_id_211F( getent( "heli_post_river", "script_noteworthy" ) );
    var_0 maps\_vehicle::_id_2A12();
    missile_createrepulsorent( var_0, 7500, 1500 );
    var_0 setairresistance( 10 );
    var_0 setjitterparams( ( 30.0, 30.0, 20.0 ), 0.5, 1.5 );
    var_0 setmaxpitchroll( 30, 30 );
    var_0._id_2950 = 1;
    var_0 maps\_vehicle::_id_1FA6();
    maps\_audio::aud_send_msg( "paris_b_chase_hind_spawn", var_0 );
    thread _id_77C3( var_0 );
    thread _id_77C4( var_0 );
    thread _id_77C5( var_0 );
    thread _id_77C6( var_0 );
    common_scripts\utility::flag_wait( "flag_uaz_post_river" );
    var_1 = maps\_vehicle::_id_211F( getent( "uaz_post_river", "script_noteworthy" ) );
    var_1 maps\_vehicle::_id_1FA6();
    var_2 = maps\paris_shared::_id_5076( "brush_gallery", "targetname" );
    var_2 delete();
    common_scripts\utility::flag_wait( "flag_heli_post_river_starts_shooting" );
    level.player enabledeathshield( 1 );
    var_3 = common_scripts\utility::getstruct( "heli_post_river_target_start", "script_noteworthy" );
    var_4 = common_scripts\utility::getstruct( "heli_post_river_target_end", "script_noteworthy" );
    var_0 thread _id_3D19( var_3.origin, var_4.origin, 6 );
    wait 5.5;
    level.player enabledeathshield( 0 );
}

_id_77C3( var_0 )
{
    common_scripts\utility::flag_wait( "flag_heli_canal_pass_01" );
    var_1 = common_scripts\utility::getstruct( "heli_river_target_04_start", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "heli_river_target_04_end", "script_noteworthy" );
    var_0 thread _id_3D19( var_1.origin, var_2.origin, 1.25 );
}

_id_77C4( var_0 )
{
    common_scripts\utility::flag_wait( "flag_heli_canal_pass_02" );
    var_1 = common_scripts\utility::getstruct( "heli_river_target_01_start", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "heli_river_target_01_end", "script_noteworthy" );
    var_0 thread _id_3D19( var_1.origin, var_2.origin, 2.5 );
}

_id_77C5( var_0 )
{
    common_scripts\utility::flag_wait( "flag_heli_canal_pass_03" );
    var_1 = common_scripts\utility::getstruct( "heli_river_target_02_start", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "heli_river_target_02_end", "script_noteworthy" );
    var_0 thread _id_3D19( var_1.origin, var_2.origin, 1.75 );
}

_id_77C6( var_0 )
{
    common_scripts\utility::flag_wait( "flag_heli_canal_pass_04" );
    var_1 = common_scripts\utility::getstruct( "heli_river_target_03_start", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "heli_river_target_03_end", "script_noteworthy" );
    var_0 thread _id_3D19( var_1.origin, var_2.origin, 1 );
    level.player common_scripts\utility::delaycall( 1.0, ::playrumbleonentity, "viewmodel_large" );
}

_id_3D19( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = "chopper_gunner_minigun_paris";
    self setvehweapon( var_3 );
    var_4 = var_2 * 1000;
    var_5 = 1000;
    var_6 = 60 / var_5;
    var_7 = gettime();
    var_8 = 0;

    for (;;)
    {
        var_9 = gettime() - var_7;

        if ( var_9 > var_4 )
            break;

        var_10 = self gettagorigin( "tag_flash" );
        var_11 = maps\_utility::_id_281D( var_9 / var_4, var_0, var_1 );
        var_12 = vectornormalize( var_11 - var_10 );
        var_13 = var_10 + var_12 * 64;
        var_14 = var_11 + common_scripts\utility::flat_origin( common_scripts\utility::randomvector( 64 ) );
        self setturrettargetvec( var_14 );
        var_15 = magicbullet( var_3, var_13, var_14 );
        maps\_audio::aud_send_msg( "chase_hind_fire", self );
        maps\_audio::aud_send_msg( "chase_hind_bullet_impact", var_15 );
        playfxontag( common_scripts\utility::getfx( "bmp_flash_wv" ), self, "tag_flash" );

        if ( var_8 % 5 == 0 )
        {
            var_16 = vectornormalize( var_14 - var_13 );
            var_17 = var_14 - var_16 * 128;
            var_18 = var_14 + var_16 * 2048;
            var_19 = bullettrace( var_17, var_18, 0, 0 );

            if ( isdefined( var_19["position"] ) )
                playfx( common_scripts\utility::getfx( "heli_strafe_impact" ), var_19["position"] );
        }

        wait(var_6);
        var_8++;
    }

    self clearturrettarget();
}

_id_77C7()
{
    common_scripts\utility::flag_wait( "flag_gallery_gate_enter" );
    thread _id_7818();
    level.player playrumbleonentity( "viewmodel_medium" );
    thread _id_77C8();
}

_id_77C8()
{
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_01" );
    thread _id_03A5::_id_5156();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_02" );
    thread _id_03A5::_id_5159();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_03" );
    thread _id_03A5::_id_515B();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_04" );
    thread _id_03A5::_id_515A();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_05" );
    thread _id_03A5::_id_5159();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_06" );
    thread _id_03A5::_id_515B();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_07" );
    thread _id_03A5::_id_515A();
    common_scripts\utility::flag_wait( "flag_gallery_van_hits_props_08" );
    thread _id_03A5::_id_515A();
}

_id_77C9()
{
    common_scripts\utility::flag_wait( "flag_player_to_the_front" );
    maps\_audio::aud_send_msg( "player_to_front_of_truck" );
    var_0 = maps\paris_shared::_id_50A3( level._id_50DE, "tag_passenger", "player_back_to_front" );
    level._id_7797 linkto( var_0, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    _id_7796( 1, 0, 0, 0, 0 );
    level.player maps\paris_shared::_id_50A4();
    level.player _id_69BB();
    level.player common_scripts\utility::delaycall( 0.25, ::hideviewmodel );
    var_0 common_scripts\utility::delaycall( 0.25, ::show );
    level._id_50DE maps\_anim::_id_1246( var_0, "player_back_to_front", "tag_passenger" );
    level._id_7797 linkto( level._id_50DE, "tag_passenger", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    _id_7796( 1, 105, 100, 40, 40 );
    var_0 delete();
    level.player enableweapons();
    level.player showviewmodel();
    common_scripts\utility::flag_set( "flag_player_to_the_front_complete" );
}

_id_77CA()
{
    common_scripts\utility::flag_wait( "flag_gallery_gate_exit" );
    thread _id_7818();
    level.player playrumbleonentity( "heavy_1s" );
    maps\_audio::aud_send_msg( "gallery_gate_crash_exit" );
}

_id_77CB()
{
    self endon( "death" );
    var_0 = maps\_vehicle::_id_2881( "gaz_01_volk_chase" );
    var_0 thread maps\paris_shared::_id_50CF();
    maps\_audio::aud_send_msg( "gaz_death", var_0 );
    var_0._id_1032 = "gaz";
    var_1 = common_scripts\utility::getstruct( "struct_escort_gaz_crash", "script_noteworthy" );
    var_0 maps\paris_shared::_id_5095( var_1, "escort_gaz_crash" );
    var_0 thread maps\paris_shared::_id_5096( var_1, "escort_gaz_crash", 1, 0, undefined, 1.25, 1 );
    var_0 vehicle_teleport( var_0.origin, var_0.angles );
}

_id_77CC()
{
    common_scripts\utility::flag_wait( "flag_player_to_the_front" );
    common_scripts\utility::flag_init( "flag_final_crash_slowmo_start" );
    thread maps\_utility::_id_265A( "axis" );
    thread maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_init( "flag_final_crash_slowmo_end" );
    common_scripts\utility::flag_init( "flag_final_crash_must_kill_guards" );
    common_scripts\utility::flag_init( "flag_final_crash_guards_dead" );
    _id_77CD();
    level._id_5164 = maps\_vehicle::_id_2881( "car_volk_chase" );
    var_0 = level._id_5164;
    var_0._id_1032 = "escape_sedan";
    var_0 hidepart( "tag_origin" );
    var_1 = var_0 maps\_vehicle::_id_2A8D();
    level._id_5166 = var_1;
    var_1._id_1032 = var_0._id_1032;
    var_1 linkto( var_0, "tag_body" );
    var_1._id_1032 = "escape_sedan";
    var_0 _id_77CE();
    var_1 _id_77CE();
    var_2 = maps\paris_shared::_id_5076( "chemical_ali", "script_noteworthy" );
    var_2.count++;
    var_3 = var_2 maps\_utility::_id_166F( 1 );
    var_3.takedamage = 0;
    var_3 maps\_utility::_id_0D04();
    var_3.health = 5;
    level._id_7778 = var_3;
    var_3 maps\_utility::_id_24F5();
    var_3._id_1032 = "volk";
    thread _id_77D6( var_3 );
    var_4 = common_scripts\utility::getstruct( "struct_final_crash_start", "script_noteworthy" );
    thread _id_77D3();
    level._id_5157 maps\paris_shared::_id_5095( var_4, "chase_final_crash" );

    if ( !common_scripts\utility::flag( "flag_player_shot_sedan_ending" ) )
    {
        _id_77D5();
        return;
    }

    common_scripts\utility::flag_set( "flag_final_crash_begin" );
    thread _id_77CF();
    level._id_5157 vehicle_setspeedimmediate( 0, 100, 100 );
    var_5 = 0.5;
    var_6 = var_0 maps\_utility::_id_1281( "chase_final_crash" );
    var_7 = var_1 maps\paris_shared::_id_50A6( var_6 ) common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_7, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 animscripted( "animdone", var_7.origin, var_7.angles, var_6 );
    var_7 thread maps\_anim::_id_0C62( var_1, "animdone", "chase_final_crash" );
    var_7 thread maps\_anim::_id_0C61( var_1, "animdone", "chase_final_crash", "escape_sedan" );
    var_7 moveto( var_4.origin, var_5, var_5 / 4, var_5 / 4 );
    var_7 rotateto( var_4.angles, var_5, var_5 / 4, var_5 / 4 );
    level._id_50DE unlink();
    var_8 = level._id_5157 maps\_utility::_id_1281( "chase_final_crash" );
    var_9 = level._id_50DE maps\paris_shared::_id_50A6( var_8 ) common_scripts\utility::spawn_tag_origin();
    level._id_50DE linkto( var_9, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_50DE animscripted( "animdone", var_9.origin, var_9.angles, var_8, "normal", level._id_5157._id_5097 );
    var_9 thread maps\_anim::_id_0C62( level._id_50DE, "animdone", "chase_final_crash" );
    var_9 thread maps\_anim::_id_0C61( level._id_50DE, "animdone", "chase_final_crash", "bomb_truck" );
    var_9 moveto( var_4.origin, var_5, var_5 / 4, var_5 / 4 );
    var_9 rotateto( var_4.angles, var_5, var_5 / 4, var_5 / 4 );
    var_4 thread maps\_anim::_id_1246( level._id_774E, "chase_final_crash" );
    level._id_5157 maps\paris_shared::_id_5096( var_4, "chase_final_crash", 1, 0, undefined, 1, 1 );
    level._id_5157 vehicle_teleport( level._id_5157.origin, level._id_5157.angles );
    level._id_5157 notify( "newpath" );
}

_id_77CD()
{
    foreach ( var_1 in getaiarray( "axis", "neutral" ) )
    {
        if ( !isdefined( var_1._id_0D04 ) || !var_1._id_0D04 )
            var_1 delete();
    }
}

_id_77CE()
{
    var_0 = [ "hitA", "hitB", "hitC", "hitD", "trunk", "TAG_GLASS_BACK", "TAG_GLASS_FRONT", "TAG_GLASS_LEFT_FRONT", "TAG_GLASS_LEFT_BACK", "TAG_GLASS_RIGHT_FRONT", "TAG_GLASS_RIGHT_BACK", "TAG_GLASS_ROOF", "wheel_A_KL", "wheel_A_KR", "wheel_A_FL", "wheel_A_FR", "doorC_FL", "doorC_KL", "doorC_FR", "doorC_KR" ];

    foreach ( var_2 in var_0 )
        self hidepart( var_2 + "_D" );
}

_id_77CF()
{
    level.player endon( "death" );
    var_0 = maps\paris_shared::_id_50A3( level._id_50DE, "tag_passenger", "chase_final_crash" );
    level._id_7797 linkto( var_0, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 thread _id_77D0();
    level._id_50DE maps\_anim::_id_1246( var_0, "chase_final_crash", "tag_passenger" );
    var_0 delete();
}

_id_77D0()
{
    level.player endon( "death" );
    thread _id_77D2();
    level.player._id_779D = 1;
    _id_7796( 1, 50, 50, 40, 40 );
    self waittillmatch( "single anim", "slomo_start" );
    level.player _id_69BB( 1 );
    common_scripts\utility::flag_set( "flag_final_crash_slowmo_start" );
    level.player._id_779D = 0;
    thread _id_77D1();
    self waittillmatch( "single anim", "slomo_end" );
    common_scripts\utility::flag_set( "flag_final_crash_slowmo_end" );
    common_scripts\utility::flag_set( "flag_final_crash_must_kill_guards" );
}

_id_77D1()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "flag_final_crash_guards_dead" );
    maps\paris_shared::_id_50E0();
    level.player disableweapons();
    _id_7796( 0.5, 0, 0, 0, 0 );
    wait 0.5;
    self show();
    level.player._id_779D = 1;
}

_id_77D2()
{
    self waittillmatch( "single anim", "slomo_fail" );
    common_scripts\utility::flag_set( "flag_final_crash_must_kill_guards" );
}

_id_77D3()
{
    for (;;)
    {
        level._id_5164 waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1 ) && var_1 == level.player && isdefined( var_4 ) && var_4 != "MOD_IMPACT" && var_4 != "MOD_GRENADE" && var_4 != "MOD_GRENADE_SPLASH" )
            break;
    }

    if ( common_scripts\utility::flag( "flag_failure_did_not_shoot" ) )
        return;

    common_scripts\utility::flag_set( "flag_player_shot_sedan_ending" );
    thread _id_03A5::_id_5160( level._id_5166 );
    thread _id_77D4();
}

_id_77D4()
{
    var_0 = 0.1;
    var_1 = 0.5;
    var_2 = -4;
    var_3 = 8;
    var_4 = 0.8;
    var_5 = 180;
    var_6 = 3;
    var_7 = 1;
    var_8 = 0.5;
    var_9 = -1 * level._id_5164 maps\_shg_common::_id_1683( level._id_5164 gettagorigin( "tag_body" ) );
    var_10 = 0.05;
    var_11 = 0;

    while ( !common_scripts\utility::flag( "flag_final_crash_begin" ) )
    {
        var_12 = maps\paris_shared::_id_50B1( var_11, 0, var_0, 0, 1 ) * var_2 + maps\paris_shared::_id_50B1( var_11, 0, var_1, 0, 1 ) * var_3 * cos( var_11 * 360 * var_4 + var_5 );
        var_13 = maps\paris_shared::_id_50B1( var_11, 0, var_7, 0, 1 ) * var_6;
        var_14 = var_12 * var_8;
        level._id_5166 linkto( level._id_5164, "tag_body", var_9, ( var_13, var_12, var_14 ) );
        var_11 += var_10;
        common_scripts\utility::waitframe();
    }
}

_id_77D5()
{
    common_scripts\utility::flag_set( "flag_failure_did_not_shoot" );
    wait 4;
    setdvar( "ui_deadquote", &"PARIS_FAIL_SHOOT_VOLKS_CAR" );
    maps\_utility::_id_1826();
    level waittill( "forever" );
}

_id_77D6( var_0 )
{
    var_1 = maps\paris_shared::_id_5076( "volk_sedan_ending_driver", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_2 = maps\paris_shared::_id_5076( "volk_sedan_ending_guard_r", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_3 = maps\paris_shared::_id_5076( "volk_sedan_ending_guard_l", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_1 thread _id_77D9();
    var_2 thread _id_77DB();
    var_3 thread _id_77DC();
    var_1 setcanradiusdamage( 0 );
    var_3 setcanradiusdamage( 0 );
    var_2 setcanradiusdamage( 0 );
    var_0 thread _id_77DA();
    common_scripts\utility::flag_wait( "flag_final_crash_slowmo_start" );
    var_0 thread _id_7784();
    var_0.allowdeath = 1;
    var_0.takedamage = 1;
    var_0 maps\_utility::_id_1902();
    var_0._id_0D45 = ::_id_7822;
    thread _id_77D8();
    var_4 = 0;

    for (;;)
    {
        var_5 = 0;

        if ( isalive( var_1 ) && !isdefined( var_1._id_77D7 ) )
            var_5++;

        if ( isalive( var_2 ) && !isdefined( var_2._id_77D7 ) )
            var_5++;

        if ( isalive( var_3 ) && !isdefined( var_3._id_77D7 ) )
            var_5++;

        if ( var_5 < 2 )
        {
            var_4 = 1;
            break;
        }

        if ( common_scripts\utility::flag( "flag_final_crash_must_kill_guards" ) )
            break;

        common_scripts\utility::waitframe();
    }

    if ( var_4 )
    {
        common_scripts\utility::flag_set( "flag_final_crash_guards_dead" );

        foreach ( var_7 in [ var_1, var_2, var_3 ] )
        {
            if ( isalive( var_7 ) )
                var_7 common_scripts\utility::delaycall( 0.3, ::dodamage, var_7.health, var_7.origin );
        }
    }
    else
    {
        setdvar( "ui_deadquote", "" );
        _id_7796( 0.2, 30, 30, 30, 30 );
        var_0 notify( "stop_fail_if_volk_dies" );
        var_7 = undefined;

        if ( isalive( var_2 ) )
            var_7 = var_2;

        if ( isalive( var_3 ) )
            var_7 = var_3;

        if ( isdefined( var_7 ) )
        {
            var_9 = 0.05;
            var_10 = 10;

            for ( var_11 = 0; var_11 < var_10 && isalive( var_7 ); var_11++ )
            {
                var_12 = var_7 gettagorigin( "tag_flash" );
                magicbullet( var_7.weapon, var_12, level.player getshootatpos() );
                level.player dodamage( 20, var_12, var_7 );
                wait(var_9);
            }
        }

        level.player kill();
        common_scripts\utility::waitframe();
        maps\_utility::_id_1826();
        level waittill( "forever" );
    }
}

_id_77D8()
{
    soundsettimescalefactor( "Music", 0 );
    soundsettimescalefactor( "Menu", 0 );
    soundsettimescalefactor( "local3", 0.0 );
    soundsettimescalefactor( "Mission", 0.0 );
    soundsettimescalefactor( "Announcer", 0.0 );
    soundsettimescalefactor( "Bulletimpact", 0.6 );
    soundsettimescalefactor( "Voice", 0.4 );
    soundsettimescalefactor( "effects2", 0.2 );
    soundsettimescalefactor( "local", 0.4 );
    soundsettimescalefactor( "physics", 0.2 );
    soundsettimescalefactor( "ambient", 0.5 );
    soundsettimescalefactor( "auto", 0.5 );
    var_0 = 4;
    var_1 = 0.25;
    var_2 = 0.75;
    var_3 = 0.2;
    var_4 = level.player;
    var_4 thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    var_4 thread _id_4BCB();
    thread _id_4D23( var_1 * 2, var_2 / 2 );
    thread _id_4D22();
    maps\_utility::_id_2771();
    var_4 allowmelee( 0 );
    maps\_utility::_id_2772( 0.2 );
    maps\_utility::_id_2774( var_1 );
    maps\_utility::_id_2775();
    common_scripts\utility::flag_wait( "flag_final_crash_slowmo_end" );
    level notify( "stop_player_heartbeat" );
    var_4 thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    maps\_utility::_id_0A16( var_2 );
    maps\_utility::_id_0A17();
    var_4 allowmelee( 1 );
    maps\_utility::_id_0A18();
}

_id_4BCB()
{
    level endon( "stop_player_heartbeat" );

    for (;;)
    {
        self playlocalsound( "breathing_heartbeat" );
        wait 0.5;
    }
}

_id_4D22()
{
    var_0 = getdvar( "bg_viewKickScale" );
    var_1 = getdvar( "bg_viewKickMax" );
    setsaveddvar( "bg_viewKickScale", 0.3 );
    setsaveddvar( "bg_viewKickMax", "15" );
    setsaveddvar( "bullet_penetration_damage", 0 );
    level waittill( "slowmo_breach_ending" );
    setsaveddvar( "bg_viewKickScale", var_0 );
    setsaveddvar( "bg_viewKickMax", var_1 );
    wait 2;
    setsaveddvar( "bullet_penetration_damage", 1 );
}

_id_4D23( var_0, var_1 )
{
    if ( !isdefined( level._id_4D24 ) )
        return;

    visionsetnaked( "slomo_breach", var_0 );
    level waittill( "slowmo_breach_ending", var_2 );

    if ( isdefined( var_2 ) )
        var_1 = var_2;

    wait 1;
    visionsetnaked( level._id_4D24, var_1 );
}

_id_77D9()
{
    maps\_utility::_id_0D04();
    self._id_1032 = "sedan_driver";
    maps\_utility::_id_0A23( 1 );
    self linkto( level._id_5166, "tag_driver", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_5166 maps\_anim::_id_1246( self, "ending_breach_death", "tag_driver" );

    while ( !common_scripts\utility::flag( "flag_final_crash_begin" ) )
    {
        level._id_5166 maps\_anim::_id_127F( [ self ], "ending_breach_death", 0.9 );
        common_scripts\utility::waitframe();
    }

    level._id_5166 maps\_anim::_id_1246( self, "ending_breach_intro", "tag_driver" );
    self.team = "neutral";
    level._id_5166 maps\_anim::_id_1246( self, "ending_breach_death", "tag_driver" );

    for (;;)
    {
        level._id_5166 maps\_anim::_id_127F( [ self ], "ending_breach_death", 0.9 );
        common_scripts\utility::waitframe();
    }
}

_id_77DA()
{
    self endon( "death" );
    self linkto( level._id_5166, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_5166 thread maps\_anim::_id_124E( self, "ending_breach_driving_loop", "volk_ender", "tag_body" );
    common_scripts\utility::flag_wait( "flag_final_crash_begin" );
    level._id_5166 notify( "volk_ender" );
    self linkto( level._id_5166, "tag_passenger", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_5166 maps\_anim::_id_1246( self, "ending_breach_intro", "tag_passenger" );

    if ( !common_scripts\utility::flag( "flag_volk_ending_start" ) )
    {
        self linkto( level._id_5166, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        level._id_5166 thread maps\_anim::_id_124E( self, "ending_breach_driving_loop", "volk_ender", "tag_body" );
    }
}

_id_77DB()
{
    maps\_utility::_id_0D04();
    self._id_1032 = "sedan_guard_r";
    maps\_utility::_id_0A23( 1 );
    animscripts\shared::_id_0C9B( self.weapon, "none" );
    self linkto( level._id_5166, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_5166 thread maps\_anim::_id_124E( self, "ending_breach_driving_loop", "guard_right_ender", "tag_body" );
    common_scripts\utility::flag_wait( "flag_final_crash_begin" );
    level._id_5166 notify( "guard_right_ender" );
    self linkto( level._id_5166, "tag_guy1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_5166 thread maps\_anim::_id_1246( self, "ending_breach_intro", "tag_guy1" );
    common_scripts\utility::flag_wait( "flag_final_crash_slowmo_start" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

    if ( common_scripts\utility::flag( "flag_final_crash_must_kill_guards" ) )
        return;

    self.team = "neutral";

    if ( isdefined( var_3 ) )
        playfx( common_scripts\utility::getfx( "guard_blood_splat" ), var_3 );

    self._id_77D7 = 1;
    level._id_5166 maps\_anim::_id_1246( self, "ending_breach_death", "tag_guy1" );
    level._id_5166 maps\_anim::_id_124E( self, "ending_breach_death_pose", "ender", "tag_guy1" );
}

_id_77DC()
{
    maps\_utility::_id_0D04();
    self._id_1032 = "sedan_guard_l";
    maps\_utility::_id_0A23( 1 );
    self linkto( level._id_5166, "tag_body", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_5166 thread maps\_anim::_id_124E( self, "ending_breach_driving_loop", "guard_left_ender", "tag_body" );
    common_scripts\utility::flag_wait( "flag_final_crash_begin" );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = level._id_5166 gettagorigin( "tag_guy0" );
    var_0.angles = level._id_5166 gettagangles( "tag_guy0" );
    var_0 linkto( level._id_5166, "tag_guy0", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 thread _id_77DF();
    level._id_5166 notify( "guard_left_ender" );
    self linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 thread maps\_anim::_id_1246( self, "ending_breach_intro", "tag_origin" );
    common_scripts\utility::flag_wait( "flag_final_crash_slowmo_start" );
    wait 0.1;
    var_1 = gettime();
    self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

    if ( common_scripts\utility::flag( "flag_final_crash_must_kill_guards" ) )
        return;

    self.team = "neutral";

    if ( isdefined( var_5 ) )
        playfx( common_scripts\utility::getfx( "guard_blood_splat" ), var_5 );

    self._id_77D7 = 1;
    self._id_23E1 = 1;
    var_0 thread maps\_anim::_id_1246( self, "ending_breach_death", "tag_origin" );
    thread _id_77DE( var_0 );

    if ( gettime() - var_1 >= 1300 )
    {
        var_7 = level._id_5166 maps\_utility::_id_1281( "chase_final_crash" );
        var_8 = getnotetracktimes( var_7, "stair_impact" )[0] * getanimlength( var_7 );
        var_9 = level._id_774E maps\_utility::_id_1281( "chase_final_crash" );
        var_10 = getanimlength( var_9 );
        var_11 = level._id_774E getanimtime( var_9 ) * var_10;

        if ( var_11 < var_8 )
        {
            var_12 = 0.1;
            var_13 = min( var_11 + var_12, var_8 );
            level._id_774E setanimtime( var_9, var_13 / var_10 );
            maps\_utility::delaythread( var_8 - var_13, maps\paris_b_anim::_id_774D );
        }
    }

    wait 0.1;
    var_14 = gettime() - var_1;
    var_15 = 0;

    if ( var_14 <= 150 )
        var_15 = 1.5;
    else if ( var_14 <= 200 )
        var_15 = 1.5;
    else if ( var_14 <= 400 )
        var_15 = 1.3;
    else if ( var_14 <= 600 )
        var_15 = 0.5;
    else if ( var_14 <= 800 )
        var_15 = 0.25;
    else if ( var_14 <= 1000 )
        var_15 = 0.1;
    else if ( var_14 <= 1200 )
        var_15 = 0;
    else if ( var_14 <= 1400 )
        var_15 = 0;
    else if ( var_14 <= 1600 )
        var_15 = 0.1;

    var_0 unlink();
    var_0.origin += var_0._id_77DD * 0.05;
    var_16 = var_0._id_77DD + var_15 * vectornormalize( var_0.origin - level.player geteye() ) * length( var_0._id_77DD );
    var_16 = ( var_16[0], var_16[1], var_16[2] * 0.25 );
    var_17 = 5;
    var_0 moveto( var_0.origin + var_16 * var_17, var_17 );
    common_scripts\utility::flag_wait( "flag_stair_impact" );
    self._id_0EC0 = 1;
    maps\_utility::_id_1902();
    self kill();
    self startragdoll();
    wait 1;
    var_0 delete();
}

_id_77DE( var_0 )
{
    var_1 = gettime();

    while ( gettime() - var_1 < 5000 )
    {
        physicsexplosionsphere( level._id_50DE.origin, 128, 0, 10 );
        var_2 = level._id_5166 gettagorigin( "tag_guy0" );
        var_3 = 128;

        if ( isdefined( var_0 ) )
            var_3 = clamp( distance( var_0.origin, var_2 ), 48, 128 );

        physicsexplosionsphere( var_2, var_3, 0, 5 );
        physicsexplosionsphere( level.player geteye(), 96, 64, 10 );
        common_scripts\utility::waitframe();
    }
}

_id_77DF()
{
    self endon( "death" );
    self._id_77DD = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        var_0 = self.origin;
        common_scripts\utility::waitframe();
        self._id_77DD = ( self.origin - var_0 ) * 20;
    }
}

_id_77E0()
{
    var_0 = level._id_7778;

    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );
    var_0 maps\_utility::_id_0A23( 1 );
    var_0._id_100A = 1;
    var_0._id_0D45 = ::_id_76B1;
    common_scripts\utility::flag_set( "flag_volk_ending_start" );
    var_1 = level._id_5166;
    var_1._id_1032 = "escape_sedan";
    var_2 = level._id_50DE maps\paris_shared::_id_50A6( "chase_ending_start" );
    thread _id_77E2( var_2 );
    thread _id_77E3();
    thread _id_77E4( var_2 );
    level._id_5166 notify( "enemy_ender" );
    level._id_5166 notify( "volk_ender" );
    var_0 unlink();
    var_2 maps\_anim::_id_11DD( [ var_0, level._id_5166 ], "chase_ending_start" );
    maps\paris_shared::_id_50DA( "chase_ending_moment", 1, var_0 );
    var_2 thread _id_77E1( level._id_5166, "chase_ending_end" );
    var_2 thread _id_77E1( var_0, "chase_ending_end" );
    wait(getanimlength( var_0 maps\_utility::_id_1281( "chase_ending_end" ) ) - 2);
    _id_51B5();
}

_id_77E1( var_0, var_1, var_2 )
{
    var_3 = var_0 maps\_utility::_id_1281( var_1 );
    var_4 = getanimlength( var_3 ) - 0.2;
    var_0 common_scripts\utility::delaycall( var_4, ::setflaggedanim, "single anim", var_3, 1, 0, 0 );
    thread maps\_anim::_id_1246( var_0, var_1, var_2 );
    wait(var_4);
}

_id_77E2( var_0 )
{
    var_1 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_2 = maps\_utility::_id_1287( "player_rig_feet" );
    var_2 hide();
    var_0 maps\_anim::_id_11BF( [ var_1, var_2 ], "chase_ending_start" );
    var_3 = 0.25;
    _id_7796( var_3, 0, 0, 0, 0 );
    maps\_utility::delaythread( var_3, ::_id_779E );
    level._id_7797 linkto( var_1, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player maps\paris_shared::_id_50A4();
    var_2 common_scripts\utility::delaycall( var_3, ::show );
    level._id_50DE animscripted( "notify", var_0.origin, var_0.angles, level._id_5157 maps\_utility::_id_1281( "chase_ending_start" ), "normal", level._id_5157._id_5097 );
    var_4 = 0.3;
    level.player maps\_utility::delaythread( getanimlength( var_1 maps\_utility::_id_1281( "chase_ending_start" ) ) - var_4, maps\paris_shared::_id_50D9, var_4, 0, 0, 0, 0 );
    var_0 maps\_anim::_id_11DD( [ var_1, var_2 ], "chase_ending_start" );
    level.player unlink();
    level.player maps\paris_shared::_id_50A5();
    var_1 delete();
    var_2 delete();
    level._id_7797 delete();
    common_scripts\utility::flag_set( "flag_obj_capture_volk_complete" );
    maps\paris_shared::_id_50E1();
}

_id_77E3()
{
    var_0 = common_scripts\utility::getstruct( "struct_frenchie_exit_van", "script_noteworthy" );
    level._id_7684 notify( "frenchie_drives_truck_stop" );
    level._id_50DE notify( "driver_ender" );
    level._id_7684 unlink();
    level._id_7684 maps\_utility::_id_257D();
    level._id_7684 forceteleport( var_0.origin, var_0.angles );
    level._id_7684 maps\paris_shared::_id_5085( "node_frenchie_exit_van_target", 0 );
}

_id_77E4( var_0 )
{
    level._id_7683 notify( "lonestar_exit_truck" );
    level._id_7683 unlink();
    level._id_7683 maps\_utility::_id_24F5();
    var_0 maps\_anim::_id_1246( level._id_7683, "chase_ending_start" );
    var_0 _id_77E1( level._id_7683, "chase_ending_end" );
}

_id_51B5()
{
    thread maps\paris_shared::_id_46B8( "black", 999, 0, 2 );
    wait 2;
    level.player disableweapons();
    level.player freezecontrols( 1 );
    level.player enableinvulnerability( 1 );
    wait 9;
    maps\_utility::_id_195A();
}

_id_77E5()
{
    level._id_648B = "j_head";
}

_id_77E6()
{
    self._id_77E7 = common_scripts\utility::spawn_tag_origin();
    self._id_77E7 linkto( self, level._id_648B, ( 2.35, 1.5, -5.0 ), ( 0.0, 80.0, 0.0 ) );
    common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "flashlight" ), self._id_77E7, "tag_origin" );
    maps\_audio::aud_send_msg( "aud_flashlight_on" );
}

_id_77E8()
{
    stopfxontag( common_scripts\utility::getfx( "flashlight" ), self._id_77E7, "tag_origin" );
}

_id_77E9()
{
    var_0 = 15;
    self endon( "death" );
    self endon( "flashlight_control_stop" );
    childthread _id_77EC();
    var_1 = undefined;
    var_2 = undefined;
    var_3 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        waittillframeend;

        if ( isdefined( self._id_77EA ) )
            var_1 = self._id_77EA;

        if ( !animscripts\utility::_id_0CB2() || !isdefined( var_1 ) )
        {
            var_2 = undefined;
            var_3 = ( 0.0, 0.0, 0.0 );
            self._id_0CB9 = undefined;
        }
        else
        {
            if ( !isdefined( var_2 ) )
                var_2 = self gettagorigin( "tag_flash" ) + anglestoforward( self gettagangles( "tag_flash" ) ) * 64;

            var_4 = var_1 - var_2;
            var_5 = var_4 * 20 - var_3 * 2;
            var_6 = var_2 + ( var_3 + var_5 * 0.05 ) * 0.05;
            var_7 = self gettagorigin( "tag_flash" );

            if ( !isdefined( var_7 ) )
            {

            }
            else
            {
                var_8 = length( var_7 - var_6 );
                var_9 = var_6 + _id_77EB() * ( var_8 * 0.035 );
                var_10 = var_9 - var_7;
                var_11 = length( var_10 );

                if ( var_11 > 0.01 )
                {
                    var_12 = vectortoangles( vectornormalize( var_10 ) );
                    var_12 = ( angleclamp( clamp( angleclamp180( var_12[0] ), -90, var_0 ) ), var_12[1], var_12[2] );

                    if ( isdefined( self.stairsstate ) && self.stairsstate == "down" )
                        var_12 += ( 20.0, -40.0, 0.0 );

                    var_12 = ( angleclamp( var_12[0] ), angleclamp( var_12[1] ), angleclamp( var_12[2] ) );
                    var_9 = var_7 + anglestoforward( var_12 ) * var_11;
                }

                if ( var_6 != var_6 || var_6[0] != var_6[0] )
                    return;

                self._id_0CB9 = var_9;
                var_3 = ( var_6 - var_2 ) * 20;
                var_2 = var_6;
            }
        }

        common_scripts\utility::waitframe();
    }
}

_id_77EB()
{
    var_0 = gettime();
    var_1 = ( ( var_0, var_0, var_0 ) / 1000 + ( 0.0, 42.5, 121.3 ) ) * 180;
    return ( sin( var_1[0] * 2.0 ) * 0.7 + sin( var_1[0] * 5.0 ) * 0.3, sin( var_1[1] * 1.8 ) * 0.7 + sin( var_1[1] * 4.6 ) * 0.3, sin( var_1[2] * 2.2 ) * 0.7 + sin( var_1[2] * 5.4 ) * 0.3 );
}

_id_77EC()
{
    for (;;)
    {
        var_0 = [];
        var_1 = level.player geteye();
        var_2 = var_1 + anglestoforward( level.player getplayerangles() ) * 1024;
        var_3 = bullettrace( var_1, var_2, 0, undefined );

        if ( isdefined( var_3 ) && isdefined( var_3["position"] ) )
            var_0[var_0.size] = var_3["position"];

        var_0[var_0.size] = level.player geteye();

        if ( isdefined( self.goalpos ) )
            var_0[var_0.size] = self.goalpos + ( 0.0, 0.0, 32.0 );

        self._id_77EA = undefined;

        foreach ( var_5 in var_0 )
        {
            if ( maps\_utility::_id_26AB( self.origin, self.angles, var_5, cos( 45 ) ) && distance2d( self.origin, var_5 ) > 64 )
            {
                self._id_77EA = var_5;
                break;
            }
        }

        wait(randomfloatrange( 0.3, 1.0 ));
    }
}

_id_77ED( var_0, var_1 )
{
    level notify( "escape_timer_countdown_stop" );
    level endon( "escape_timer_countdown_stop" );
    common_scripts\utility::flag_wait_or_timeout( "flag_volk_escaped", var_0 );
    setdvar( "ui_deadquote", var_1 );
    maps\_utility::_id_1826();
}

_id_77EE()
{
    level notify( "escape_timer_countdown_stop" );
}

_id_77EF()
{
    var_0 = 0.18;
    level.player._id_77F0 = _id_77F2();
    level.player maps\_utility::_id_27E9( level.player._id_77F0 * var_0 );

    foreach ( var_2 in maps\_vehicle::_id_26A4() )
        var_2 maps\_utility::add_spawn_function( ::_id_77F3 );

    foreach ( var_5 in maps\_utility::_id_27BA() )
        var_5 _id_77F3();
}

_id_77F1()
{
    if ( isdefined( level.player._id_77F0 ) )
        level.player maps\_utility::_id_27E9( level.player._id_77F0 );

    level notify( "reduce_turret_accuracy_stop" );

    foreach ( var_1 in maps\_vehicle::_id_26A4() )
        var_1 maps\_utility::_id_26BD( ::_id_77F3 );
}

_id_77F2()
{
    if ( isdefined( level.player._id_20F2.attackeraccuracy ) )
        return level.player._id_20F2.attackeraccuracy;

    return level.player.attackeraccuracy;
}

_id_77F3()
{
    if ( isdefined( self.mgturret ) )
    {
        foreach ( var_1 in self.mgturret )
        {
            if ( isdefined( var_1 ) )
                var_1 setaispread( 10 );
        }
    }
}

_id_77F4( var_0, var_1 )
{
    maps\_utility::_id_123B();
    _id_77F5( var_0, var_1 );
    maps\_utility::_id_2686();
}

_id_77F5( var_0, var_1 )
{
    level endon( "flag_catacombs_enemy_gate" );
    var_1 maps\_anim::_id_11C4( self, "plant_flare" );
    var_2 = 1.3;
    maps\_audio::aud_send_msg( "road_flare_start", var_0 );
    var_3 = maps\_utility::_id_1287( "catacombs_flare" );
    var_3 hide();
    maps\_utility::delaythread( 0.1, maps\_anim::_id_127D, "plant_flare", var_2, "generic" );
    var_3 maps\_utility::delaythread( 0.1, maps\_anim::_id_127D, "plant_flare", var_2 );
    maps\paris_shared::_id_50DA( var_1.script_noteworthy, 1, self, 1 );
    var_1 thread maps\_anim::_id_11C3( self, "plant_flare" );
    var_1 thread maps\_anim::_id_1246( var_3, "plant_flare" );
    self waittillmatch( "single anim", "show_flare" );
    var_3 show();
    var_3 waittillmatch( "single anim", "show_sparks" );
    playfxontag( common_scripts\utility::getfx( "flare_catacombs_moving" ), var_3, "tag_fire_fx" );
    var_3 waittillmatch( "single anim", "flare_planted" );
    stopfxontag( common_scripts\utility::getfx( "flare_catacombs" ), var_3, "tag_fire_fx" );
    var_0 _id_77F6( var_1, var_3 );
    var_3 waittillmatch( "single anim", "end" );
    var_1 thread maps\_anim::_id_124E( var_3, "plant_flare_idle" );
}

_id_77F6( var_0, var_1 )
{
    thread _id_77F8();
    self._id_3E99 = common_scripts\utility::spawn_tag_origin();

    if ( isdefined( var_0.origin ) )
        self._id_3E99.origin = var_0.origin;

    self._id_3E99.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );

    if ( isdefined( var_0.angles ) )
        self._id_3E99.angles = combineangles( var_0.angles, self._id_3E99.angles );

    maps\_audio::aud_send_msg( "road_flare_lp", self );
    playfxontag( common_scripts\utility::getfx( "flare_catacombs" ), self._id_3E99, "tag_origin" );

    if ( common_scripts\utility::flag( "msg_fx_zone6100" ) )
        playfxontag( common_scripts\utility::getfx( "flare_catacombs_mist" ), self._id_3E99, "tag_origin" );
}

_id_77F7()
{
    self notify( "stop_flare_flicker" );
    self setlightintensity( 0 );
    self._id_3E99 delete();
    self._id_3E99 = undefined;
}

_id_77F8()
{
    self endon( "stop_flare_flicker" );

    for (;;)
    {
        self setlightintensity( randomfloatrange( 0.6, 1.0 ) );
        common_scripts\utility::waitframe();
    }
}

_id_77F9()
{
    common_scripts\utility::flag_set( "flag_dialogue_everyone_in_truck" );
    _id_77FE();
    maps\_utility::_id_09C9( ::_id_77FA );
    maps\_utility::_id_09C9( ::_id_77FB );
    maps\_utility::_id_09C9( ::_id_77FC );
    maps\_utility::_id_275B();
}

_id_77FA()
{
    level._id_7684 maps\_utility::_id_26F3( 1 );
    level._id_7684 maps\_utility::_id_1057();
    level._id_7684 maps\paris_shared::_id_50AF();
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    wait 2;
    level._id_7684 maps\paris_shared::_id_460E();
    var_0 = getnode( "node_frenchie_teleport_to_van", "targetname" );
    level._id_7684 maps\_utility::_id_123B();
    level._id_7684 maps\_utility::_id_2712();
    level._id_7684 maps\_utility::_id_2612( 1 );
    level._id_7684 maps\_utility::_id_27A1( var_0 );
    level._id_7684 animscripted( "notify", var_0.origin, var_0.angles, maps\_utility::_id_26EC( "catacombs_signal_stop" ) );
    wait 1;
    level._id_7684 stopanimscripted();
    level._id_50DE maps\_anim::_id_124A( level._id_7684, "van_driver_enter", "tag_driver" );
    level._id_7684 maps\_utility::_id_24F5();
    level._id_7684 linkto( level._id_50DE, "tag_driver", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_50DE setflaggedanimrestart( "vehicle_anim_flag", level._id_5157 maps\_utility::_id_1281( "van_driver_enter" ) );
    level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_enter", "tag_driver" );
    level._id_50DE clearanim( level._id_5157 maps\_utility::_id_1281( "van_driver_enter" ), 0.25 );
    level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_start_engine", "tag_driver" );
    thread _id_7806();
}

_id_77FB()
{
    var_0 = level._id_7683;
    var_0 maps\_utility::_id_1057();
    var_0 maps\_utility::_id_2712();
    var_0 maps\_utility::_id_2612( 1 );
    var_0 maps\_utility::_id_123B();
    var_0 maps\_utility::_id_26F3( 1 );
    var_0 maps\paris_shared::_id_50AF();
    var_1 = maps\paris_shared::_id_5076( "van_door_blocker", "script_noteworthy" );
    var_1 linkto( level._id_50DE, "door_KR" );
    var_1 solid();
    level._id_50DE maps\_utility::_id_09C9( maps\_anim::_id_124A, var_0, "van_ride_enter", "tag_guy" );
    maps\_utility::_id_09C9( common_scripts\utility::flag_wait, "flag_player_in_truck" );
    maps\_utility::_id_09CB();
    var_0 maps\_utility::_id_0A23( 1 );
    level._id_50DE setflaggedanimrestart( "vehicle_anim_flag", level._id_5157 maps\_utility::_id_1281( "van_ride_enter" ) );
    level._id_50DE maps\_anim::_id_1246( var_0, "van_ride_enter", "tag_guy" );
    level._id_50DE clearanim( level._id_5157 maps\_utility::_id_1281( "van_ride_enter" ), 0.25 );
    var_0 linkto( level._id_50DE, "tag_guy", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 delete();
    level._id_50DE thread maps\_anim::_id_124E( var_0, "van_ride_enter_idle", "enter_idle_ender", "tag_guy" );
}

_id_77FC()
{
    level.player endon( "death" );
    thread _id_03A5::_id_514F( level._id_50DE );
    var_0 = maps\paris_shared::_id_50A3( level._id_50DE, "tag_passenger", "player_enter_van" );
    thread _id_77FD();
    var_1 = maps\paris_shared::_id_5076( "trigger_player_held_x_to_enter_truck", "script_noteworthy" );
    var_1 sethintstring( &"PARIS_ENTER_VAN_HINT" );
    common_scripts\utility::flag_clear( "flag_player_held_x_to_enter_truck" );
    common_scripts\utility::flag_wait( "flag_player_held_x_to_enter_truck" );
    var_1 sethintstring( "" );
    common_scripts\utility::flag_set( "flag_player_in_truck" );
    maps\paris_shared::_id_50E0();
    var_2 = maps\paris_shared::_id_5076( "van_sight_blocker", "script_noteworthy" );
    var_2 delete();
    _id_77EE();
    maps\_utility::_id_26C1( "trigger_flag_volk_escaped" );
    level.player.health = level.player.maxhealth;
    level.player enableinvulnerability();
    var_3 = 0.4;
    level._id_7797 = common_scripts\utility::spawn_tag_origin();
    level._id_7797 linkto( var_0, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    _id_7796( var_3, 10, 10, 10, 10 );
    level.player maps\paris_shared::_id_50A4( 1 );
    level.player _id_69BB();
    wait(var_3);
    var_0 show();
    level._id_50DE setflaggedanimrestart( "vehicle_anim_flag", level._id_5157 maps\_utility::_id_1281( "player_enter_van" ) );
    level._id_50DE setflaggedanimrestart( "vehicle_anim_flag", level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ) );
    level._id_50DE maps\_anim::_id_1246( var_0, "player_enter_van", "tag_passenger" );
    level._id_50DE clearanim( level._id_5157 maps\_utility::_id_1281( "player_enter_van" ), 0 );
    level._id_50DE setanim( level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ), 1, 0, 0 );
    level._id_50DE setanimtime( level._id_5157 maps\_utility::_id_1281( "player_enter_van_glass" ), 1 );
    level._id_7797 linkto( level._id_50DE, "tag_passenger", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 delete();
    _id_7796( 1, 105, 100, 40, 40 );
    level.player enableweapons();
    maps\paris_shared::_id_50E1();
    thread maps\_utility::_id_1C43();
    level.player common_scripts\utility::delaycall( 3, ::disableinvulnerability );
}

_id_77FD()
{
    maps\paris_shared::_id_50C0( &"PARIS_DEADQUOTE_GET_IN_VAN" );
    level._id_50DE _id_781C( "door_FR" );
    var_0 = spawn( "script_model", level._id_50DE gettagorigin( "door_FR" ) );
    var_0 linkto( level._id_50DE, "door_FR", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "armored_van_passengerDoor_obj" );
    var_0 _id_6EC6();
    var_0 _id_6ECA( level._id_50DE, 8 );
    level._id_50DE thread _id_781B( var_0 );
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    maps\paris_shared::_id_50C2();
    var_0 delete();
    level._id_50DE _id_781D( "door_FR" );
}

_id_77FE()
{
    var_0 = "sa80lmg_fastreload_reflex";
    var_1 = spawn( "weapon_" + var_0, level._id_50DE gettagorigin( "tag_player" ) );
    var_1 itemweaponsetammo( weaponclipsize( var_0 ), weaponstartammo( var_0 ) - weaponclipsize( var_0 ) );
    var_1 linkto( level._id_50DE );
    var_1 hide();
}

_id_77FF()
{
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    var_0 = common_scripts\utility::getstruct( "struct_chase_barricade_moment", "script_noteworthy" );
    var_1 = getvehiclenode( "van_path_post_barricade", "script_noteworthy" );
    var_2 = maps\_vehicle::_id_2A99( "chase_uaz_02_blocker" );
    wait 3.5;
    var_3 = maps\_vehicle::_id_2881( "chase_uaz_01_blocker" );
    var_3 maps\paris_shared::_id_50D7( 10, 50, 10 );
    var_3 maps\_vehicle::_id_2A12();
    var_2 maps\_vehicle::_id_2A12();
    var_3._id_1032 = "gaz1";
    var_2._id_1032 = "gaz2";
    common_scripts\utility::flag_wait( "gaz_1_barricade_ready" );
    var_4 = maps\paris_shared::_id_5076( "ai_enemy_barricade_roadkill", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_4 maps\_utility::_id_2611();
    var_4 maps\paris_shared::_id_460E();
    var_0 maps\_anim::_id_11C0( var_4, "chase_gaz_barricade" );
    level._id_5157 maps\paris_shared::_id_5095( var_0, "chase_gaz_barricade" );
    common_scripts\utility::flag_set( "flag_crash_gaz_barricade_started" );
    thread _id_03A5::_id_5152( level._id_50DE, 1 );
    thread _id_7800();
    maps\_audio::aud_send_msg( "start_engine_02" );
    var_0 thread maps\_anim::_id_11C1( var_4, "chase_gaz_barricade" );
    level._id_5157 maps\paris_shared::_id_509D( maps\paris_shared::_id_5096, [ var_0, "chase_gaz_barricade", 1, 0, var_1, 1, 0 ] );
    var_3 maps\paris_shared::_id_509D( maps\paris_shared::_id_5096, [ var_0, "chase_gaz_barricade", 1, 0, undefined, 1, 1 ] );
    var_2 maps\paris_shared::_id_509D( maps\paris_shared::_id_5096, [ var_0, "chase_gaz_barricade", 1, 0, undefined, 1, 0 ] );
    maps\_utility::_id_275B();
    var_3 maps\_vehicle::_id_2A13();
    var_2 maps\_vehicle::_id_2A13();
    var_3 dodamage( var_3.health + 2000, ( 0.0, 0.0, 0.0 ) );
    var_2 dodamage( var_2.health + 2000, ( 0.0, 0.0, 0.0 ) );
    var_4 delete();
}

_id_7800()
{
    var_0 = maps\paris_shared::_id_50A3( level._id_50DE, "tag_passenger", "player_gaz_barricade" );
    thread _id_7801( var_0 );
    maps\_utility::delaythread( 2.25, ::_id_7818 );
    level.player common_scripts\utility::delaycall( 2.25, ::playrumbleonentity, "heavy_2s" );
    level._id_50DE maps\_anim::_id_1246( var_0, "player_gaz_barricade", "tag_passenger" );
    level._id_7797 linkto( level._id_50DE, "tag_passenger" );
    var_0 delete();
    _id_7796( 1, 105, 100, 40, 40 );
}

_id_7801( var_0 )
{
    level._id_7797 linkto( var_0, "tag_player" );
    _id_7796( 0.75, 0, 0, 0, 0 );
    wait 0.75;
    level.player disableweapons();
    level.player enabledeathshield( 1 );
    level.player _id_69BB();
    wait 0.5;
    level.player hideviewmodel();
    var_0 show();
}

_id_7802()
{
    common_scripts\utility::flag_wait( "flag_player_move_to_back" );
    common_scripts\utility::flag_set( "flag_dialogue_another_shooter" );
    thread _id_7803();
    wait 1;
    var_0 = maps\_utility::_id_1287( "player_rig_feet", level.player.origin );
    var_0 hide();
    level._id_50DE maps\_anim::_id_11CF( var_0, "player_front_to_back", "tag_passenger" );
    var_0 linkto( level._id_50DE, "tag_passenger", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 = maps\paris_shared::_id_50A3( level._id_50DE, "tag_passenger", "player_front_to_back" );
    level._id_7797 linkto( var_1, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    _id_7796( 0.25, 10, 10, 10, 10 );
    var_1 common_scripts\utility::delaycall( 0.25, ::show );
    var_0 common_scripts\utility::delaycall( 0.25, ::show );
    level._id_50DE setflaggedanimrestart( "vehicle_anim_flag", level._id_5157 maps\_utility::_id_1281( "player_front_to_back" ) );
    level._id_7683 thread _id_7807();
    level._id_50DE thread _id_781F();
    level._id_50DE maps\_anim::_id_11DD( [ var_1, var_0 ], "player_front_to_back", "tag_passenger" );
    level._id_50DE clearanim( level._id_5157 maps\_utility::_id_1281( "player_front_to_back" ), 0.2 );
    thread _id_7804();
    var_0 delete();
    level._id_7797 linkto( level._id_50DE, "tag_player", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 delete();
    _id_7796( 0.25, 105, 100, 40, 40 );
    level.player enableweapons();
    level.player showviewmodel();
    level.player enabledeathshield( 0 );
    level.player setstance( "crouch" );
    level.player allowcrouch( 1 );
}

_id_7803()
{
    if ( maps\_utility::_id_229D() == "fu" )
    {
        setsaveddvar( "player_damageMultiplier", 0.6 );
        common_scripts\utility::flag_wait( "flag_van_climb_paired_done" );
        setsaveddvar( "player_damageMultiplier", 0.8 );
        common_scripts\utility::flag_wait( "flag_ai_clean_up_galleria" );
        setsaveddvar( "player_damageMultiplier", 1 );
    }
}

_id_7804()
{
    thread _id_7805( "door_KR", "armored_van_rearDoorR", "r_door_rip_off", 5 );
    thread _id_7805( "door_KL", "armored_van_rearDoorL", "l_door_rip_off", 4 );
    level._id_50DE setflaggedanimrestart( "van_back_door", level._id_5157 maps\_utility::_id_1281( "van_back_door_idle" ) );
    wait 8;
    level._id_50DE clearanim( level._id_5157 maps\_utility::_id_1281( "van_back_door_idle" ), 0 );
    level._id_50DE setflaggedanimrestart( "van_back_door", level._id_5157 maps\_utility::_id_1281( "van_back_door_rip_off" ) );
    level._id_50DE waittillmatch( "van_back_door", "end" );
    level._id_50DE clearanim( level._id_5157 maps\_utility::_id_1281( "van_back_door_rip_off" ), 0 );
}

_id_7805( var_0, var_1, var_2, var_3 )
{
    level._id_50DE _id_7753( level._id_50DE, var_3, 1 );
    var_4 = spawn( "script_model", level._id_50DE gettagorigin( var_0 ) );
    var_4.angles = level._id_50DE gettagangles( var_0 );
    var_4 hide();
    var_4 setmodel( var_1 );
    var_4 linkto( level._id_50DE, var_0, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::waitframe();
    level._id_50DE _id_781C( var_0 );
    var_4 show();
    level._id_50DE waittillmatch( "van_back_door", var_2 );
    var_4 unlink();
    var_5 = 3000;
    var_4 physicslaunchclient( var_4 getpointinbounds( 0, 0, 0 ), anglestoforward( level._id_50DE.angles + ( 0.0, 180.0, 0.0 ) ) * var_5 );
    wait 30;
    var_4 delete();
}

_id_7806()
{
    level endon( "frenchie_drives_truck_stop" );
    level._id_7684 linkto( level._id_50DE, "tag_driver", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_7684 maps\_utility::_id_24F5();

    switch ( level._id_1F19 )
    {
        default:
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_driving" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_driving", "driver_ender", "tag_driver" );
            common_scripts\utility::flag_wait( "flag_crash_gaz_barricade_started" );
            level._id_50DE notify( "driver_ender" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_driving_braced" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_driving_braced", "driver_ender", "tag_driver" );
            wait 2;
            level._id_50DE notify( "driver_ender" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_impact_big" ) );
            level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_impact_big", "tag_driver" );
        case "chase_canal":
        case "chase_ending":
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_driving" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_driving", "driver_ender", "tag_driver" );
            common_scripts\utility::flag_wait( "flag_player_to_the_front" );
            wait 1.5;
            level._id_50DE notify( "driver_ender" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_turn_full_right" ) );
            level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_turn_full_left", "tag_driver" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_driving" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_driving", "driver_ender", "tag_driver" );
            wait 1;
            level._id_50DE notify( "driver_ender" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_turn_full_left" ) );
            level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_turn_full_left", "tag_driver" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_driving" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_driving", "driver_ender", "tag_driver" );
            var_0 = common_scripts\utility::flag_wait_either_return( "flag_final_crash_begin", "flag_failure_did_not_shoot" );

            if ( var_0 == "flag_failure_did_not_shoot" )
            {
                wait 2;
                level._id_50DE notify( "driver_ender" );
                level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_turn_full_left" ) );
                level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_turn_full_left", "tag_driver" );
                level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_idle" ) );
                level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_idle", "driver_ender", "tag_driver" );
                return;
            }

            level._id_50DE notify( "driver_ender" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_turn_full_right" ) );
            level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_turn_full_right", "tag_driver" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_driving_braced" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_driving_braced", "driver_ender", "tag_driver" );
            wait 1.5;
            level._id_50DE notify( "driver_ender" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_impact_big" ) );
            level._id_50DE maps\_anim::_id_1246( level._id_7684, "van_driver_impact_big", "tag_driver" );
            level._id_50DE setanimknobrestart( level._id_50DE maps\_utility::_id_1281( "van_driver_idle" ) );
            level._id_50DE thread maps\_anim::_id_124E( level._id_7684, "van_driver_idle", "driver_ender", "tag_driver" );
    }
}

_id_7807()
{
    var_0 = level._id_7683;
    var_0 endon( "death" );
    level._id_50DE notify( "enter_idle_ender" );
    var_0 maps\_utility::_id_0A23( 0 );
    var_0 linkto( level._id_50DE, "tag_guy", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_50DE maps\_anim::_id_1246( var_0, "van_ride_to_combat", "tag_guy" );
    var_0._id_17D3 = 1;
    var_0._id_240B = 1;
    var_0 thread _id_7813();
    var_0 thread _id_7808();
    var_0 waittill( "lonestar_exit_truck" );
    var_0 clearentitytarget();
    level._id_50DE notify( "lonestar_stop_idle" );
    level._id_50DE notify( "lonestar_stop_fire" );
    var_0 unlink();
}

_id_7808()
{
    self endon( "death" );
    self endon( "lonestar_exit_truck" );
    self endon( "lonestar_anim_fire" );
    self endon( "lonestar_anim_scripted" );
    level._id_50DE endon( "death" );
    var_0 = undefined;

    for (;;)
    {
        var_1 = length( level._id_5157 vehicle_getvelocity() ) > 88.0;

        if ( !isdefined( var_0 ) || var_0 != var_1 )
        {
            if ( var_1 )
            {
                if ( isdefined( self._id_7809 ) )
                    childthread _id_780C( _id_7811( self._id_7809 ) );
                else
                    childthread _id_780C( "van_ride_idle_fwd" );
            }
            else
                childthread _id_780C( "van_noneride_idle" );
        }

        var_0 = var_1;
        wait 0.5;
    }
}

_id_780A()
{
    var_0 = gettime();

    if ( isdefined( self._id_780B ) && self._id_780B == var_0 )
        common_scripts\utility::waitframe();

    self._id_780B = var_0;
}

_id_780C( var_0 )
{
    level._id_50DE notify( "lonestar_stop_idle" );
    level._id_50DE notify( "lonestar_stop_fire" );
    _id_780A();
    level._id_50DE maps\_anim::_id_124E( self, var_0, "lonestar_stop_idle", "tag_guy" );
}

_id_780D( var_0 )
{
    self endon( "death" );
    self endon( "lonestar_exit_truck" );
    self endon( "lonestar_anim_scripted" );
    self notify( "lonestar_anim_fire" );

    if ( isdefined( self._id_780E ) )
        return;

    var_1 = _id_7810( self._id_7809 );
    _id_780A();
    self._id_780F = gettime();
    level._id_50DE notify( "lonestar_stop_idle" );
    level._id_50DE notify( "lonestar_stop_fire" );
    level._id_50DE thread maps\_anim::_id_124E( self, var_1, "lonestar_stop_fire", "tag_guy" );
    wait(randomfloatrange( 0.4, 0.8 ));
    level._id_50DE notify( "lonestar_stop_fire" );
    thread _id_7808();
}

_id_780E( var_0 )
{
    self endon( "death" );
    self endon( "lonestar_exit_truck" );
    self notify( "lonestar_anim_scripted" );
    self._id_780E = 1;
    _id_780A();
    level._id_50DE maps\_anim::_id_1246( self, var_0, "tag_guy" );
    self._id_780E = undefined;
    thread _id_7808();
}

_id_7810( var_0 )
{
    var_1 = [ "van_ride_fire_right", "van_ride_fire_fwd", "van_ride_fire_left" ];
    var_2 = [ 15, 45, 70 ];
    return _id_7812( var_1, var_2, var_0 );
}

_id_7811( var_0 )
{
    var_1 = [ "van_ride_idle_right", "van_ride_idle_fwd", "van_ride_idle_left" ];
    var_2 = [ 15, 45, 70 ];
    return _id_7812( var_1, var_2, var_0 );
}

_id_7812( var_0, var_1, var_2 )
{
    var_3 = maps\_shg_common::_id_1683( var_2 );
    var_4 = vectortoyaw( var_3 );
    var_5 = 360;
    var_6 = undefined;

    for ( var_7 = 0; var_7 < var_0.size; var_7++ )
    {
        var_8 = abs( angleclamp180( var_1[var_7] - angleclamp180( var_4 ) ) );

        if ( var_8 < var_5 )
        {
            var_5 = var_8;
            var_6 = var_7;
        }
    }

    return var_0[var_6];
}

_id_7813()
{
    self endon( "death" );
    self endon( "lonestar_exit_truck" );

    for (;;)
    {
        self._id_7814 = undefined;
        var_0 = anglestoforward( self.angles );
        var_1 = self geteye();
        var_2 = getaiarray( "axis" );
        var_3 = maps\paris_shared::_id_5082( vehicle_getarray(), ::_id_7815 );
        var_4 = common_scripts\utility::array_combine( var_2, var_3 );
        var_4 = sortbydistance( var_4, var_1 );

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            var_6 = var_4[var_5];
            var_7 = var_6 getshootatpos();
            var_8 = maps\_shg_common::_id_1683( var_7 );
            var_9 = angleclamp180( vectortoyaw( var_8 ) );

            if ( var_9 > 0 && var_9 < 85 )
            {
                if ( bullettracepassed( self getmuzzlepos(), var_7, 0, undefined ) )
                {
                    self._id_7814 = var_6;
                    self._id_7809 = var_7;
                    break;
                }
            }
        }

        if ( isdefined( self._id_7814 ) )
            thread _id_780D( self._id_7809 );

        if ( var_4.size > 3 )
        {
            wait(randomfloatrange( 0.5, 1 ));
            continue;
        }

        wait(randomfloatrange( 0.5, 3 ));
    }
}

_id_7815( var_0 )
{
    return !isdefined( var_0.script_team ) || var_0.script_team == "axis";
}

_id_7743( var_0 )
{
    var_0.a._id_0AA7 = gettime();

    if ( gettime() - var_0._id_780F < 300.0 )
        return;

    if ( isdefined( var_0._id_7814 ) && isalive( var_0._id_7814 ) )
        var_0._id_7816 = var_0._id_7814 getshootatpos();

    if ( isdefined( var_0._id_7816 ) )
    {
        var_1 = 1.0;

        if ( isdefined( var_0._id_7817 ) )
            var_1 = var_0._id_7817;

        var_0 shoot( var_1, var_0._id_7816 );
    }
}

_id_7818()
{
    earthquake( 0.5, 3, level.player.origin, 850 );
}

_id_7819()
{
    earthquake( 0.25, 3, level.player.origin, 850 );
}

_id_69BB( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.75;

    var_1 = self getcurrentweapon();

    if ( isdefined( var_1 ) && var_1 != "none" )
    {
        var_2 = weaponclass( var_1 );

        if ( var_2 != "rocketlauncher" && var_2 != "grenade" )
        {
            var_3 = self getweaponammoclip( var_1 );
            var_4 = weaponclipsize( var_1 );

            if ( var_4 > 0 && var_3 / var_4 < var_0 )
            {
                setsaveddvar( "ammoCounterHide", "1" );
                common_scripts\utility::noself_delaycall( 1, ::setsaveddvar, "ammoCounterHide", "0" );
                var_5 = var_4 - var_3;
                var_6 = self getweaponammostock( var_1 );
                var_7 = var_5;
                self setweaponammoclip( var_1, var_3 + var_7 );
                self setweaponammostock( var_1, int( max( var_6 - var_7, 0 ) ) );
            }
        }
    }
}

_id_6EC6()
{
    self.maxhealth = 20000;
    self setnormalhealth( self.maxhealth );
    self setcandamage( 1 );
}

_id_781A()
{
    _id_6EC6();
    self._id_6EC9 = [];

    for ( var_0 = 0; var_0 < 9; var_0++ )
    {
        self._id_6EC9[var_0] = spawnstruct();
        self._id_6EC9[var_0].v["currentState"] = 0;
        self._id_6EC9[var_0].v["health"] = 40;
        self._id_6EC9[var_0].v["invul"] = 0;
        _id_6ECA( self, var_0 );
    }
}

_id_6ECA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_3 = [ "glass", "glass_shattered", "glass_broken" ];

    foreach ( var_7, var_5 in var_3 )
    {
        var_6 = "tag_" + var_5 + "_0" + ( var_1 + 1 );

        if ( var_7 == var_0._id_6EC9[var_1].v["currentState"] )
        {
            self showpart( var_6 );

            if ( isdefined( var_2 ) && var_2 && var_7 == 2 )
                playfxontag( common_scripts\utility::getfx( "van_window_broken" ), self, var_6 );

            continue;
        }

        self hidepart( var_6 );
    }
}

_id_781B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_0 endon( "death" );

    for (;;)
    {
        var_0 setnormalhealth( var_0.maxhealth );
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( isdefined( var_7 ) && var_7 == "" )
        {
            if ( isdefined( var_8 ) && var_8 != "" && var_8 != "tag_body" && var_8 != "body_animate_jnt" )
                var_7 = var_8;
            else
                var_7 = undefined;
        }

        if ( !isdefined( var_7 ) )
            continue;

        if ( var_7.size < 10 )
            continue;

        var_9 = tolower( var_7 );
        var_10 = getsubstr( var_9, 0, 10 );

        if ( var_10 == "tag_glass_" )
        {
            var_11 = getsubstr( var_9, var_9.size - 1, var_9.size );
            var_11 = int( var_11 ) - 1;
            _id_6ECC( var_0, var_11, var_1 );
        }
    }
}

_id_6ECC( var_0, var_1, var_2 )
{
    if ( self._id_6EC9[var_1].v["currentState"] < 2 )
    {
        if ( self._id_6EC9[var_1].v["invul"] )
            return;

        self._id_6EC9[var_1].v["health"] -= var_2;

        if ( self._id_6EC9[var_1].v["health"] < 0 )
        {
            self._id_6EC9[var_1].v["health"] = 40;
            self._id_6EC9[var_1].v["currentState"]++;
            var_0 _id_6ECA( self, var_1, 1 );
        }
    }
}

_id_7753( var_0, var_1, var_2 )
{
    var_3 = var_1 - 1;

    if ( self._id_6EC9[var_3].v["currentState"] < 2 )
    {
        self._id_6EC9[var_3].v["health"] = 40;
        self._id_6EC9[var_3].v["currentState"] = 2;
        var_0 _id_6ECA( self, var_3, var_2 );
    }
}

_id_781C( var_0 )
{
    var_1 = undefined;

    if ( var_0 == "door_KR" )
        var_1 = 5;
    else if ( var_0 == "door_KL" )
        var_1 = 4;
    else if ( var_0 == "door_FR" )
        var_1 = 9;
    else
        return;

    self hidepart( var_0 );
    self hidepart( "tag_glass_0" + var_1 );
    self hidepart( "tag_glass_shattered_0" + var_1 );
    self hidepart( "tag_glass_broken_0" + var_1 );
    self hidepart( "tag_glass_screen_0" + var_1 );
}

_id_781D( var_0 )
{
    var_1 = undefined;

    if ( var_0 == "door_FR" )
        var_1 = 9;
    else
        return;

    self showpart( "door_FR" );
    self showpart( "tag_glass_screen_0" + var_1 );
    _id_6ECA( self, var_1 - 1 );
}

_id_781E( var_0 )
{
    var_1 = var_0 - 1;
    self._id_6EC9[var_1].v["invul"] = 1;
}

_id_781F()
{
    level.player endon( "death" );
    wait 2.35;
    _id_7753( self, 4, 1 );
    _id_7753( self, 5, 1 );
}

_id_7820()
{
    common_scripts\utility::array_thread( getentarray( "launch_object", "targetname" ), ::_id_5966 );
}

_id_7821( var_0, var_1 )
{
    var_2 = anglestoright( var_1 ) * -1;
    var_3 = anglestoforward( var_1 );
    var_4 = anglestoup( var_1 );
    var_5 = var_3 * var_0[0] + var_2 * var_0[1] + var_4 * var_0[2];
    return var_5;
}

_id_5966()
{
    var_0 = getentarray( self.target, "targetname" );
    self waittill( "trigger", var_1 );
    var_2 = [];
    var_2["com_trafficcone01"] = 2;
    var_2["paris_traffic_sign_02"] = 22;
    var_2["paris_street_signs_f"] = 25;
    var_2["paris_traffic_sign_08"] = 25;
    var_2["paris_street_signs_e"] = 25;

    foreach ( var_4 in var_0 )
    {
        if ( var_1 == level._id_5157 )
        {
            level.player playrumbleonentity( "damage_light" );
            continue;
        }

        var_5 = var_1 vehicle_getvelocity();
        var_6 = vectortoangles( var_4.origin + ( 0.0, 0.0, 6.0 ) - var_1.origin );
        var_7 = vectortoangles( var_5 );

        if ( var_0.size > 2 )
        {
            var_8 = ( 0, randomint( 30 ) - 15, 0 );
            var_6 += var_8;
        }

        var_9 = var_6 - var_7;
        var_5 = _id_7821( var_5, var_9 );
        var_10 = 2;

        if ( isdefined( var_2[var_4.model] ) )
            var_10 = var_2[var_4.model];

        if ( isdefined( var_4.script_accel ) )
            var_10 *= var_4.script_accel;

        if ( isdefined( var_4.script_soundalias ) )
            level thread common_scripts\utility::play_sound_in_space( var_4.script_soundalias, var_4.origin );

        var_5 *= var_10;
        var_11 = vectornormalize( var_5 * -1 );
        var_12 = var_4.origin + var_11 * 16;
        var_4 physicslaunchclient( var_12, var_5 );
        var_13 = vectornormalize( var_5 );
    }
}

_id_76B1()
{
    self startragdoll();
}

_id_7822()
{
    self waittill( "forever" );
}

_id_518C()
{
    for (;;)
    {
        maps\_compass::setupminimap( "compass_map_paris_catacombs", "minimap_corner_catacombs" );
        setsaveddvar( "compassMaxRange", 1500 );
        common_scripts\utility::flag_wait( "trigger_minimap_chase" );
        maps\_compass::setupminimap( "compass_map_paris_b", "minimap_corner" );
        setsaveddvar( "compassMaxRange", 3000 );
        common_scripts\utility::flag_clear( "trigger_minimap_catacombs" );
        common_scripts\utility::flag_wait( "trigger_minimap_catacombs" );
        common_scripts\utility::flag_clear( "trigger_minimap_chase" );
    }
}
