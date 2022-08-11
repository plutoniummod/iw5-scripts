// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5296()
{
    level._id_4877 = self;
    self.name = "Price";
    self._id_1032 = "price";
    _id_6FCA();
    self._id_0AB6 = "pri";
    level.heroes[0] = level._id_4877;
}

_id_684A()
{
    level._id_54E0 = self;
    self.name = "Soap";
    self._id_1032 = "soap";
    _id_6FCA();
    level.heroes[1] = level._id_54E0;
    maps\_utility::_id_0D72( 0 );
}

_id_684C()
{
    level._id_64A5 = self;
    self.name = "Nikolai";
    self._id_1032 = "nikolai";
    _id_6FCA();
    self.voice = "russian";
    maps\_utility::_id_0D72( 0 );
    level.heroes[2] = level._id_64A5;
}

_id_6FCA()
{
    thread maps\_utility::_id_0D04();
    self._id_4B64 = 1;
    self._id_0CBA = 1;
    _id_50B5( 0.4 );
}

setup_friendly_spawner( var_0, var_1 )
{
    var_2 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 maps\_utility::add_spawn_function( var_1 );
}

_id_5FAE( var_0 )
{
    level.heroes = [];
    setup_friendly_spawner( "price", ::_id_5296 );
    setup_friendly_spawner( "soap", ::_id_684A );
    setup_friendly_spawner( "nikolai", ::_id_684C );
    maps\_shg_common::_id_166E( var_0, "price" );
    var_1 = getent( "soap", "script_noteworthy" );
    var_1 maps\_utility::_id_166F( 1 );
    maps\_shg_common::_id_166E( var_0, "nikolai" );
}

_id_6FCC()
{
    maps\_shg_common::_id_1670();
    level.player disableweapons();
    level.player disableoffhandweapons();
    _id_700F();
    var_0 = maps\_utility::_id_1287( "wire1", ( 0.0, 0.0, 0.0 ) );
    var_1 = maps\_utility::_id_1287( "wire2", ( 0.0, 0.0, 0.0 ) );
    var_2 = common_scripts\utility::getstruct( "intro_shot01_wire1", "targetname" );
    var_3 = common_scripts\utility::getstruct( "intro_shot01_wire2", "targetname" );
    var_4 = getent( "intro_shot01_wire1_static", "targetname" );
    var_4 hide();
    var_4 = getent( "intro_shot01_wire2_static", "targetname" );
    var_4 hide();
    var_5 = common_scripts\utility::getstruct( "intro_shot_1", "targetname" );
    var_6 = maps\_utility::_id_1287( "littlebird", ( 0.0, 0.0, 0.0 ) );
    var_6.origin = var_5.origin;
    var_6.angles = var_5.angles;
    var_6._id_1032 = "littlebird";
    var_6 maps\_anim::_id_1244();
    var_6 hidepart( "main_rotor_jnt" );
    var_6 hidepart( "tail_rotor_jnt" );
    maps\_audio::aud_send_msg( "start_gurney_scene_heli", var_6 );
    level._id_51F2 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    level._id_51F2._id_1032 = "player_rig";
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 25, 25, 10, 0 );
    thread maps\intro_fx::_id_6ED1();
    common_scripts\utility::exploder( 7002 );
    level._id_6FCD = maps\_utility::_id_1287( "player_body", ( 0.0, 0.0, 0.0 ) );
    level._id_6FCD._id_1032 = "player_body";
    level._id_6FCD maps\_anim::_id_1244();
    var_7 = maps\_utility::_id_1287( "gurney", ( 0.0, 0.0, 0.0 ) );
    var_8 = [];
    var_8[0] = [ level._id_4877, 0 ];
    var_8[1] = [ level._id_64A5, 0 ];
    var_8[2] = [ level._id_51F2, 0 ];
    var_8[3] = [ level._id_6FCD, 0 ];
    var_8[4] = [ var_7, 0 ];
    thread maps\_introscreen::_id_1D97( 4.8, 0.01 );
    level.player thread _id_7001();
    var_6 thread _id_6FEB();
    wait 4.4;
    level.player shellshock( "intro_opening", 10 );
    thread maps\_introscreen::_id_1D98( 0.5, 0.25, 0.5 );
    maps\_audio::aud_send_msg( "intro_white_fade_in" );
    maps\_audio::aud_send_msg( "intro_shot_1_start" );
    wait 0.6;
    thread _id_6FEF();
    thread _id_6FF0();
    thread _id_6FF2();
    thread _id_6FF1();
    var_9 = 4.3;
    level.player maps\_utility::delaythread( 5, ::_id_6FEE, var_9, 1, 0.5, 0.3 );
    common_scripts\utility::flag_set( "intro_dialog_shot_1" );
    var_2 thread maps\_anim::_id_1246( var_0, "intro_shot01_wires" );
    var_3 thread maps\_anim::_id_1246( var_1, "intro_shot01_wires" );
    var_6 thread maps\_anim::_id_1246( var_6, "intro_opening_shot01" );
    var_10 = getent( "blade_shadow", "targetname" );
    playfxontag( common_scripts\utility::getfx( "intro_helicopter_blade_shadow" ), var_6, "main_rotor_jnt" );
    var_6 maps\_shg_common::_id_16EB( var_8, "intro_opening_shot01", "tag_guy1" );
    level notify( "stop_player_injured_audio" );
    common_scripts\utility::flag_set( "intro_stop_shake" );
    stopfxontag( common_scripts\utility::getfx( "intro_helicopter_blade_shadow" ), var_6, "main_rotor_jnt" );
    var_6 delete();
    var_7 delete();
    var_0 delete();
    var_1 delete();
}

_id_6FCE()
{
    var_0 = getent( "intro_shot_3_civ1", "targetname" );
    level._id_6FCF = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FCF._id_1032 = "bystander1";
    waittillframeend;
    var_0 = getent( "intro_shot_3_civ2", "targetname" );
    level._id_6FD0 = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FD0._id_1032 = "bystander2";
    waittillframeend;
    var_0 = getent( "intro_shot_3_civ3", "targetname" );
    level._id_6FD1 = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FD1._id_1032 = "bystander3";
    level._id_6FD2 = maps\_utility::_id_1287( "wire3", ( 0.0, 0.0, 0.0 ) );
    var_1 = common_scripts\utility::getstruct( "intro_shot02_wire3", "targetname" );
    var_1 thread maps\_anim::_id_11CF( level._id_6FD2, "intro_shot01_wires" );
    var_2 = getent( "intro_shot02_wire3_static", "targetname" );
    var_2 hide();
    var_3 = [];
    var_3[0] = [ level._id_4877, 0 ];
    var_3[1] = [ level._id_64A5, 0 ];
    var_3[2] = [ level._id_51F2, 0 ];
    var_3[3] = [ level._id_6FCD, 0 ];
    var_4 = [];
    var_4[0] = [ level._id_6FCF, 0 ];
    var_4[1] = [ level._id_6FD0, 0 ];
    var_4[2] = [ level._id_6FD1, 0 ];
    var_5 = common_scripts\utility::getstruct( "intro_shot_2", "targetname" );
    var_5 thread _id_6FEC( var_3, "intro_opening_shot02" );
    var_6 = common_scripts\utility::getstruct( "intro_shot_2_bystanders", "targetname" );
    var_6 thread _id_6FEC( var_4, "intro_opening_shot02" );
}

_id_6FD3()
{
    var_0 = [];
    var_0[0] = [ level._id_4877, 0 ];
    var_0[1] = [ level._id_64A5, 0 ];
    var_0[2] = [ level._id_51F2, 0 ];
    var_0[3] = [ level._id_6FCD, 0 ];
    var_1 = [];
    var_1[0] = [ level._id_6FCF, 0 ];
    var_1[1] = [ level._id_6FD0, 0 ];
    var_1[2] = [ level._id_6FD1, 0 ];
    var_2 = common_scripts\utility::getstruct( "intro_shot_2", "targetname" );
    common_scripts\utility::flag_set( "intro_dialog_shot_2" );
    level.player thread _id_7001();
    thread _id_7005();
    maps\_audio::aud_send_msg( "intro_shot_2_start" );
    level.player shellshock( "intro_opening", 10 );
    maps\_utility::_id_2693( 7002 );
    var_3 = getanimlength( level._id_4877 maps\_utility::_id_1281( "intro_opening_shot02" ) );
    level.player maps\_utility::delaythread( 0, ::_id_6FEE, var_3 + 0.65, 0.5, 0.5, 0.7 );
    thread maps\_utility::vision_set_fog_changes( "intro_cinematics_2", 0 );
    thread _id_6FF3();
    var_4 = common_scripts\utility::getstruct( "intro_shot_2_bystanders", "targetname" );
    var_4 thread maps\_shg_common::_id_16EB( var_1, "intro_opening_shot02" );
    var_5 = common_scripts\utility::getstruct( "intro_shot02_wire3", "targetname" );
    var_5 thread maps\_anim::_id_1246( level._id_6FD2, "intro_shot01_wires" );
    level._id_64A5 thread maps\_shg_common::_id_16E9( "intro_opening_shot02_nikolai_face" );
    level._id_4877 thread maps\_shg_common::_id_16E9( "intro_opening_shot02_price_face" );
    var_2 maps\_shg_common::_id_16EB( var_0, "intro_opening_shot02" );
    level notify( "stop_player_injured_audio" );
    level._id_6FD2 delete();
}

_id_6FD4()
{
    var_0 = getent( "intro_shot_3_civ1", "targetname" );
    var_0.count = 1;
    level._id_6FD5 = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FD5._id_1032 = "bystander4";
    var_0 = getent( "intro_shot_3_civ2", "targetname" );
    var_0.count = 1;
    level._id_6FD6 = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FD6._id_1032 = "bystander5";
    var_1 = [];
    var_1[0] = [ level._id_4877, 0 ];
    var_1[1] = [ level._id_64A5, 0 ];
    var_1[2] = [ level._id_51F2, 0 ];
    var_1[3] = [ level._id_6FCF, 0 ];
    var_1[4] = [ level._id_6FD0, 0 ];
    var_1[5] = [ level._id_6FD1, 0 ];
    var_1[6] = [ level._id_6FD5, 0 ];
    var_1[7] = [ level._id_6FD6, 0 ];
    var_1[8] = [ level._id_6FCD, 0 ];
    var_2 = common_scripts\utility::getstruct( "anim_intro_shot_3", "targetname" );
    var_2 _id_6FEC( var_1, "intro_opening_shot03" );
}

_id_6FD7()
{
    var_0 = [];
    var_0[0] = [ level._id_4877, 0 ];
    var_0[1] = [ level._id_64A5, 0 ];
    var_0[2] = [ level._id_51F2, 0 ];
    var_0[3] = [ level._id_6FCF, 0 ];
    var_0[4] = [ level._id_6FD0, 0 ];
    var_0[5] = [ level._id_6FD1, 0 ];
    var_0[6] = [ level._id_6FD5, 0 ];
    var_0[7] = [ level._id_6FD6, 0 ];
    var_0[8] = [ level._id_6FCD, 0 ];
    var_1 = common_scripts\utility::getstruct( "anim_intro_shot_3", "targetname" );
    common_scripts\utility::flag_set( "intro_dialog_shot_3" );
    level.player thread _id_7001();
    thread _id_7005();
    maps\_audio::aud_send_msg( "intro_shot_3_start" );
    level.player shellshock( "intro_opening", 10 );
    var_2 = getanimlength( level._id_4877 maps\_utility::_id_1281( "intro_opening_shot03" ) );
    level.player maps\_utility::delaythread( 0, ::_id_6FEE, var_2 + 0.65, 0.5, 0.5, 1 );
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics_3", 0 );
    thread _id_6FF4();
    var_1 maps\_shg_common::_id_16EB( var_0, "intro_opening_shot03" );
    level notify( "stop_player_injured_audio" );
}

_id_6FD8()
{
    var_0 = getent( "intro_shot_3_civ1", "targetname" );
    var_0.count = 1;
    level._id_6FD9 = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FD9._id_1032 = "bystander6";
    var_0 = getent( "intro_shot_3_civ2", "targetname" );
    var_0.count = 1;
    level._id_6FDA = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FDA._id_1032 = "bystander7";
    level._id_6FD0 delete();
    level._id_6FD1 delete();
    var_1 = [];
    var_1[0] = [ level._id_4877, 0 ];
    var_1[1] = [ level._id_64A5, 0 ];
    var_1[2] = [ level._id_51F2, 0 ];
    var_1[3] = [ level._id_6FCD, 0 ];
    var_1[4] = [ level._id_6FCF, 0 ];
    var_1[5] = [ level._id_6FD5, 0 ];
    var_1[6] = [ level._id_6FD6, 0 ];
    var_1[7] = [ level._id_6FD9, 0 ];
    var_1[8] = [ level._id_6FDA, 0 ];
    var_2 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    var_2 _id_6FEC( var_1, "intro_opening_shot04" );
}

_id_6FDB()
{
    var_0 = [];
    var_0[0] = [ level._id_4877, 0 ];
    var_0[1] = [ level._id_64A5, 0 ];
    var_0[2] = [ level._id_51F2, 0 ];
    var_0[3] = [ level._id_6FCD, 0 ];
    var_0[4] = [ level._id_6FCF, 0 ];
    var_0[5] = [ level._id_6FD5, 0 ];
    var_0[6] = [ level._id_6FD6, 0 ];
    var_0[7] = [ level._id_6FD9, 0 ];
    var_0[8] = [ level._id_6FDA, 0 ];
    var_1 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    common_scripts\utility::flag_set( "intro_dialog_shot_4" );
    level.player thread _id_7001();
    thread _id_7005();
    maps\_audio::aud_send_msg( "intro_shot_4_start" );
    level.player shellshock( "intro_opening", 10 );
    var_2 = getanimlength( level._id_4877 maps\_utility::_id_1281( "intro_opening_shot04" ) );
    level.player maps\_utility::delaythread( 0, ::_id_6FEE, var_2 - 0.5, 0.5, 0.5, 1 );
    level.player maps\_utility::delaythread( 0, ::_id_6FFC, var_2 - 0.5, 0.5, 0.5, 1 );
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics_4", 0 );
    thread _id_6FF5();
    level._id_64A5 thread maps\_shg_common::_id_16E9( "intro_opening_shot04_face" );
    level._id_4877 thread maps\_shg_common::_id_16E9( "intro_opening_shot04_price_face" );
    var_1 maps\_shg_common::_id_16EB( var_0, "intro_opening_shot04" );
    level notify( "stop_player_injured_audio" );
    level._id_6FCF delete();
    level._id_6FD5 delete();
    level._id_6FD6 delete();
    level._id_6FD9 delete();
    level._id_6FDA delete();
}

_id_6FDC()
{
    _id_6FED();
    var_0 = [];
    var_0[0] = [ level._id_4877, 0 ];
    var_0[1] = [ level._id_64A5, 0 ];
    var_0[2] = [ level._id_51F2, 0 ];
    var_0[3] = [ level._id_6FDD, 0 ];
    var_0[4] = [ level._id_6FCD, 0 ];
    var_1 = common_scripts\utility::getstruct( "anim_intro_room_before", "targetname" );
    var_1 _id_6FEC( var_0, "intro_opening_shot05" );
}

_id_6FDE()
{
    var_0 = [];
    var_0[0] = [ level._id_4877, 0 ];
    var_0[1] = [ level._id_64A5, 0 ];
    var_0[2] = [ level._id_51F2, 0 ];
    var_0[3] = [ level._id_6FDD, 0 ];
    var_0[4] = [ level._id_6FCD, 0 ];
    var_1 = common_scripts\utility::getstruct( "anim_intro_room_before", "targetname" );
    common_scripts\utility::flag_set( "intro_dialog_shot_5" );
    level.player thread _id_7001();
    thread _id_7005();
    maps\_audio::aud_send_msg( "intro_shot_5_start" );
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics_5", 0 );
    thread _id_6FF6();
    thread _id_6FDF();
    var_2 = getanimlength( level._id_4877 maps\_utility::_id_1281( "intro_opening_shot05" ) );
    level.player maps\_utility::delaythread( 0, ::_id_6FFB, var_2, 0.5, 0.5, 1 );
    level.player maps\_utility::delaythread( 0, ::_id_6FFC, var_2, 0.5, 0.5, 1 );
    level.player maps\_utility::delaythread( 0, ::_id_6FFD, var_2, 0.5, 0.5, 1 );
    level.player shellshock( "intro_injured", var_2 );
    var_1 maps\_shg_common::_id_16EB( var_0, "intro_opening_shot05" );
    level notify( "stop_player_injured_audio" );
    level._id_6FCD delete();
}

_id_6FDF()
{
    wait 2;
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics_bloody", 1 );
    wait 2;
    setblur( 10, 2 );
}

_id_6FE0()
{
    var_0 = getent( "spot_cinema", "targetname" );
    var_1 = common_scripts\utility::getstruct( "origin_cinema_light_01", "targetname" );
    var_0.origin = var_1.origin;
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = var_2.origin - var_0.origin;
    var_3 = vectornormalize( var_3 );
    var_0.angles = vectortoangles( var_3 );
    var_4 = getent( "yuri", "script_noteworthy" );
    var_5 = var_4 maps\_utility::_id_166F( 1 );
    var_5._id_1032 = "yuri";
    level._id_6FE1 = maps\_utility::_id_1287( "mi28", ( 0.0, 0.0, 0.0 ) );
    level._id_64A5 maps\_utility::_id_257D();
    var_6 = [];
    var_6[0] = [ level._id_4877, 0 ];
    var_6[1] = [ level._id_64A5, 0 ];
    var_6[2] = [ level._id_51F2, 0 ];
    var_6[3] = [ level._id_6FDD, 0 ];
    var_6[4] = [ level._id_6FE1, 0 ];
    var_6[5] = [ var_5, 0 ];
    var_7 = common_scripts\utility::getstruct( "intro_shot_6", "targetname" );
    var_7 _id_6FEC( var_6, "intro_opening_shot06" );
    var_8 = getanimlength( level._id_4877 maps\_utility::_id_1281( "intro_opening_shot06" ) );
    maps\_utility::delaythread( var_8 - 2.05, ::_id_7000 );
    level.player thread _id_7001();
    common_scripts\utility::flag_set( "intro_dialog_shot_6" );
    thread _id_7005();
    thread _id_6FE2();
    var_7 maps\_shg_common::_id_16EB( var_6, "intro_opening_shot06" );
    level notify( "stop_player_injured_audio" );
    var_5 delete();
}

_id_6FE2()
{
    var_0 = _id_703B( "intro_mi28_1" );
    var_0 setmaxpitchroll( 30, 60 );
    wait 1;
    var_1 = _id_703B( "intro_mi28_2" );
    var_1 setmaxpitchroll( 30, 60 );
    wait 4;
    var_2 = _id_703B( "intro_mi28_3" );
    var_2 setmaxpitchroll( 30, 60 );
}

_id_6FE3()
{
    var_0 = getent( "spot_cinema", "targetname" );
    var_1 = common_scripts\utility::getstruct( "origin_cinema_light", "targetname" );
    var_0.origin = var_1.origin;
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = var_2.origin - var_0.origin;
    var_3 = vectornormalize( var_3 );
    var_0.angles = vectortoangles( var_3 );
    level._id_6FE4 = maps\_utility::_id_1287( "gurney", ( 0.0, 0.0, 0.0 ) );
    level._id_6FE5 = maps\_utility::_id_1287( "surgery_cart", ( 0.0, 0.0, 0.0 ) );
    level._id_6FE1 = maps\_utility::_id_1287( "mi28", ( 0.0, 0.0, 0.0 ) );
    level._id_6FE6 = maps\_utility::_id_1287( "forceps", ( 0.0, 0.0, 0.0 ) );
    level._id_6FE7 = maps\_utility::_id_1287( "gauze", ( 0.0, 0.0, 0.0 ) );
    level._id_4877 maps\_utility::_id_257D();
    level._id_64A5 maps\_utility::_id_257D();
    var_4 = getent( "soap", "script_noteworthy" );
    var_4 maps\_utility::_id_166F( 1 );
    var_5 = [];
    var_5[0] = [ level._id_4877, 0 ];
    var_5[1] = [ level._id_64A5, 0 ];
    var_5[2] = [ level._id_51F2, 0 ];
    var_5[3] = [ level._id_6FDD, 0 ];
    var_5[4] = [ level._id_6FE1, 0 ];
    var_5[5] = [ level._id_6FE4, 0 ];
    var_5[6] = [ level._id_54E0, 0 ];
    var_5[7] = [ level._id_6FE6, 0 ];
    var_5[8] = [ level._id_6FE7, 0 ];
    var_6 = common_scripts\utility::getstruct( "anim_intro_room_before", "targetname" );
    var_6 maps\_anim::_id_11CF( level._id_6FE5, "intro_opening_shot08" );
    thread maps\intro_fx::_id_6ED3();
    var_6 _id_6FEC( var_5, "intro_opening_shot07" );
    common_scripts\utility::exploder( "intro_godray" );
    common_scripts\utility::flag_wait( "intro_transition_dialog_end" );
    var_7 = _id_473C( 1 );
    var_7 thread _id_7003( 3, 1 );
    maps\_audio::aud_send_msg( "intro_soap_temple_start" );
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics_7", 0 );
    thread _id_6FF7();
    common_scripts\utility::flag_set( "intro_dialog_shot_7" );
    thread _id_6FE9();
    maps\_audio::aud_send_msg( "intro_shot_7" );
    level.player common_scripts\utility::delaycall( 4.75, ::playrumbleonentity, "damage_heavy" );
    level._id_64A5 thread maps\_shg_common::_id_16E9( "intro_opening_shot07_face" );
    var_6 maps\_shg_common::_id_16EB( var_5, "intro_opening_shot07" );
}

_id_6FE8()
{
    var_0 = maps\_utility::_id_1287( "intro_ceiling_woodbeam_01", ( 0.0, 0.0, 0.0 ) );
    var_1 = maps\_utility::_id_1287( "intro_ceiling_damage_med_01", ( 0.0, 0.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "fire_mi_28" ), level._id_6FE1, "tag_fire" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2 linkto( var_0, "tag_origin", ( -20.0, 0.0, -20.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "fire_line_sm_cheap" ), var_2, "tag_origin" );
    var_3 = [];
    var_3[0] = [ level._id_4877, 0 ];
    var_3[1] = [ level._id_64A5, 0 ];
    var_3[2] = [ level._id_6FDD, 0 ];
    var_3[3] = [ level._id_6FE1, 0 ];
    var_3[4] = [ level._id_6FE4, 0 ];
    var_3[5] = [ level._id_54E0, 0 ];
    var_3[6] = [ level._id_6FE5, 0 ];
    var_3[7] = [ level._id_51F2, 0 ];
    var_3[8] = [ level._id_6FE6, 0 ];
    var_3[9] = [ level._id_6FE7, 0 ];
    var_3[10] = [ var_0, 0 ];
    var_3[11] = [ var_1, 0 ];
    var_4 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    common_scripts\utility::flag_set( "intro_dialog_shot_8" );
    var_4 _id_6FEC( var_3, "intro_opening_shot08" );
    common_scripts\utility::flag_set( "intro_complete" );
    maps\_audio::aud_send_msg( "intro_shot_8" );
    thread _id_6FF9();
    thread _id_6FFA();
    thread _id_700B();
    thread _id_7011();
    level._id_64A5 thread maps\_shg_common::_id_16E9( "intro_opening_shot08_face" );
    maps\_utility::delaythread( 14, common_scripts\utility::flag_set, "intro_dialog_shot_8_complete" );
    var_4 maps\_shg_common::_id_16EB( var_3, "intro_opening_shot08" );
    thread _id_700C();
    thread _id_700D();
    stopfxontag( common_scripts\utility::getfx( "fire_mi_28" ), level._id_6FE1, "tag_fire" );
    stopfxontag( common_scripts\utility::getfx( "fire_line_sm" ), var_2, "tag_origin" );
    var_2 delete();
    level._id_6FE1 delete();
}

_id_6FE9()
{
    wait 6.5;
    maps\_vehicle::_id_2881( "intro_shot7_mi28_1" );
}

_id_6FEA()
{
    var_0 = getent( "intro_shot4_door_left", "targetname" );
    var_0.angles += ( 0.0, 90.0, 0.0 );
    var_1 = getent( "intro_shot4_door_right", "targetname" );
    var_1.angles -= ( 0.0, 90.0, 0.0 );
}

_id_6FEB()
{
    playrumblelooponposition( "mig_rumble", self.origin );

    while ( !common_scripts\utility::flag( "intro_stop_shake" ) )
    {
        earthquake( 0.15, 0.05, self.origin, 1024 );
        wait 0.05;
    }

    stopallrumbles();
}

_id_6FEC( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_0 )
        var_3[var_3.size] = var_5[0];

    maps\_anim::_id_11BF( var_3, var_1, var_2 );
}

_id_6FED()
{
    var_0 = getent( "intro_room_doctor", "targetname" );
    level._id_6FDD = var_0 maps\_utility::_id_166F( 1 );
    level._id_6FDD.ignoreall = 1;
    level._id_6FDD._id_1032 = "doctor";
    level._id_6FDD maps\_utility::_id_2611();
}

_id_6FEE( var_0, var_1, var_2, var_3 )
{
    var_0 -= 1;
    thread _id_6FFB( var_0, var_1, var_2, var_3 );
    wait(var_0);
    level notify( "msg_fx_screenfx_end" );
}

_id_6FEF()
{
    setblur( 10, 0 );
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics_gurnee", 0 );
    wait 0.5;
    setblur( 0, 2 );
    thread maps\_utility::vision_set_fog_changes( "Intro_cinematics", 2 );
}

_id_6FF0()
{
    setsaveddvar( "sm_sunsamplesizenear", 0.1 );
    var_0 = anglestoforward( ( -23.0, 34.0, 0.0 ) );
    setsundirection( var_0 );
    setsunlight( 2.175, 1.575, 1.5 );
    wait 12;
    resetsundirection();
    resetsunlight();
}

_id_6FF1()
{
    level common_scripts\utility::waitframe();
    thread maps\_shg_fx::_id_446D( "lights_intro_sunflare", ( -16.0, 78.0, 0.0 ), 8000 );
    wait 8.5;
    common_scripts\utility::flag_set( "fx_spot_flare_kill" );
    common_scripts\utility::flag_clear( "fx_spot_flare_kill" );
}

_id_6FF2()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 10;
    var_1["nearEnd"] = 500;
    var_1["nearBlur"] = 5;
    var_1["farStart"] = 1000;
    var_1["farEnd"] = 4000;
    var_1["farBlur"] = 4;
    var_2 = [];
    var_2["nearStart"] = 1;
    var_2["nearEnd"] = 10;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 180;
    var_2["farEnd"] = 2000;
    var_2["farBlur"] = 1.5;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 3.5;
    maps\_utility::_id_27C0( var_1, var_2, 0.7 );
    wait 5;
    maps\_utility::_id_27C0( var_2, var_0, 0.5 );
}

_id_6FF3()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 5.0;
    var_1["nearEnd"] = 50;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 200;
    var_1["farEnd"] = 4500;
    var_1["farBlur"] = 6;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 5;
    maps\_utility::_id_27C0( var_1, var_0, 0.1 );
}

_id_6FF4()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 1.0;
    var_1["nearEnd"] = 120;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 180;
    var_1["farEnd"] = 1600;
    var_1["farBlur"] = 6;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 4;
    maps\_utility::_id_27C0( var_1, var_0, 0.1 );
}

_id_6FF5()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 1.0;
    var_1["nearEnd"] = 120;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 180;
    var_1["farEnd"] = 1600;
    var_1["farBlur"] = 6;
    var_2 = [];
    var_2["nearStart"] = 1.0;
    var_2["nearEnd"] = 10;
    var_2["nearBlur"] = 6;
    var_2["farStart"] = 180;
    var_2["farEnd"] = 800;
    var_2["farBlur"] = 6;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 5;
    maps\_utility::_id_27C0( var_1, var_2, 0.5 );
    wait 3;
    maps\_utility::_id_27C0( var_2, var_0, 0.1 );
}

_id_6FF6()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 1.0;
    var_1["nearEnd"] = 120;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 180;
    var_1["farEnd"] = 1600;
    var_1["farBlur"] = 6;
    var_2 = [];
    var_2["nearStart"] = 0;
    var_2["nearEnd"] = 8;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 10;
    var_2["farEnd"] = 85;
    var_2["farBlur"] = 4;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 3;
    maps\_utility::_id_27C0( var_1, var_2, 1 );
    wait 5;
    maps\_utility::_id_27C0( var_2, var_0, 0.1 );
}

_id_6FF7()
{
    level._id_6FF8 = level._id_1436;
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 10;
    var_1["nearEnd"] = 20;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 70;
    var_1["farEnd"] = 800;
    var_1["farBlur"] = 6;
    var_2 = [];
    var_2["nearStart"] = 1;
    var_2["nearEnd"] = 9;
    var_2["nearBlur"] = 6;
    var_2["farStart"] = 10;
    var_2["farEnd"] = 80;
    var_2["farBlur"] = 6;
    var_3 = [];
    var_3["nearStart"] = 20;
    var_3["nearEnd"] = 60;
    var_3["nearBlur"] = 6;
    var_3["farStart"] = 1500;
    var_3["farEnd"] = 8000;
    var_3["farBlur"] = 6;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 1.5;
    maps\_utility::_id_27C0( var_1, var_2, 3.0 );
    wait 6.0;
    maps\_utility::_id_27C0( var_2, var_3, 1.0 );
}

_id_6FF9()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 20;
    var_1["nearEnd"] = 60;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 1500;
    var_1["farEnd"] = 8000;
    var_1["farBlur"] = 6;
    var_2 = [];
    var_2["nearStart"] = 1.4;
    var_2["nearEnd"] = 20;
    var_2["nearBlur"] = 6;
    var_2["farStart"] = 20;
    var_2["farEnd"] = 300;
    var_2["farBlur"] = 2.2;
    maps\_utility::_id_27C0( var_0, var_1, 0.1 );
    wait 4;
    maps\_utility::_id_27C0( var_1, var_2, 1.5 );
    wait 3.5;
    maps\_utility::_id_27C0( var_2, level._id_6FF8, 1.5 );
}

_id_6FFA()
{
    setblur( 8, 0 );
    wait 1;
    setblur( 0, 2 );
}

_id_6FFB( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "fullscreen_bloodsplat_left", 640, 480 );
    var_4.splatter = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.sort = 1;
    var_4.foreground = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_5 = newclienthudelem( self );
    var_5.x = 0;
    var_5.y = 0;
    var_5 setshader( "fullscreen_bloodsplat_right", 640, 480 );
    var_5.splatter = 1;
    var_5.alignx = "left";
    var_5.aligny = "top";
    var_5.sort = 1;
    var_5.foreground = 0;
    var_5.horzalign = "fullscreen";
    var_5.vertalign = "fullscreen";
    var_5.alpha = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_6 = 0.05;

    if ( var_1 > 0 )
    {
        var_7 = 0;
        var_8 = var_3 / ( var_1 / var_6 );

        while ( var_7 < var_3 )
        {
            var_4.alpha = var_7;
            var_5.alpha = var_7;
            var_7 += var_8;
            wait(var_6);
        }
    }

    var_4.alpha = var_3;
    var_5.alpha = var_3;
    wait(var_0 - var_1 + var_2);

    if ( var_2 > 0 )
    {
        var_7 = var_3;
        var_9 = var_3 / ( var_2 / var_6 );

        while ( var_7 > 0 )
        {
            var_4.alpha = var_7;
            var_5.alpha = var_7;
            var_7 -= var_9;
            wait(var_6);
        }
    }

    var_4.alpha = 0;
    var_5.alpha = 0;
    var_4 destroy();
    var_5 destroy();
}

_id_6FFC( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "fullscreen_bloodsplat_bottom", 640, 480 );
    var_4.splatter = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.sort = 1;
    var_4.foreground = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_5 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_6 = 0.05;

    if ( var_1 > 0 )
    {
        var_7 = 0;
        var_8 = var_3 / ( var_1 / var_6 );

        while ( var_7 < var_3 )
        {
            var_4.alpha = var_7;
            var_7 += var_8;
            wait(var_6);
        }
    }

    var_4.alpha = var_3;
    wait(var_0 - var_1 + var_2);

    if ( var_2 > 0 )
    {
        var_7 = var_3;
        var_9 = var_3 / ( var_2 / var_6 );

        while ( var_7 > 0 )
        {
            var_4.alpha = var_7;
            var_7 -= var_9;
            wait(var_6);
        }
    }

    var_4.alpha = 0;
    var_4 destroy();
}

_id_6FFD( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "splatter_alt_sp", 640, 480 );
    var_4.splatter = 1;
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.sort = 1;
    var_4.foreground = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_5 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_6 = 0.05;

    if ( var_1 > 0 )
    {
        var_7 = 0;
        var_8 = var_3 / ( var_1 / var_6 );

        while ( var_7 < var_3 )
        {
            var_4.alpha = var_7;
            var_7 += var_8;
            wait(var_6);
        }
    }

    var_4.alpha = var_3;
    wait(var_0 - var_1 + var_2);

    if ( var_2 > 0 )
    {
        var_7 = var_3;
        var_9 = var_3 / ( var_2 / var_6 );

        while ( var_7 > 0 )
        {
            var_4.alpha = var_7;
            var_7 -= var_9;
            wait(var_6);
        }
    }

    var_4.alpha = 0;
    var_4 destroy();
}

_id_6FFE( var_0, var_1, var_2 )
{
    var_3 = newclienthudelem( self );
    var_3.x = 0;
    var_3.y = 0;
    var_3 setshader( "fullscreen_dirt_right", 640, 480 );
    var_3.splatter = 1;
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3.sort = 1;
    var_3.foreground = 0;
    var_3.horzalign = "fullscreen";
    var_3.vertalign = "fullscreen";
    var_3.alpha = 0;
    var_4 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    while ( var_4 < var_1 )
    {
        var_3.alpha += 0.05;
        var_4 += 0.05;
        wait 0.05;
    }

    var_3.alpha = 1;
    wait(var_0 - var_1 + var_2);
    var_4 = 0;

    while ( var_4 < var_2 )
    {
        var_3.alpha -= 0.05;
        var_4 += 0.05;
        wait 0.05;
    }

    var_3.alpha = 0;
    var_3 destroy();
}

_id_6FFF()
{
    for (;;)
    {
        level endon( "msg_fx_screenfx_end" );
        setblur( randomfloatrange( 8, 10 ), 0.2 );
        wait(randomfloatrange( 0.2, 0.4 ));
        setblur( 0.5, 0.3 );
        wait(randomfloatrange( 1.8, 2.5 ));
    }

    setblur( 0, 0.6 );
}

_id_7000()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.foreground = 1;
    var_0 setshader( "black", 640, 480 );
    var_0.alpha = 0;
    var_0 fadeovertime( 0.4 );
    var_0.alpha = 0.75;
    wait 0.225;
    var_0 fadeovertime( 0.4 );
    var_0.alpha = 0;
    wait 0.6;
    var_0.alpha = 0;
    var_0 fadeovertime( 0.75 );
    var_0.alpha = 1.0;
    wait 0.6;
    var_0 fadeovertime( 1.1 );
    var_0.alpha = 0;
    var_0 destroy();
}

_id_7001()
{
    maps\_audio::aud_send_msg( "start_gurney_heartbeat" );
    level waittill( "stop_player_injured_audio" );
    maps\_audio::aud_send_msg( "stop_gurney_heartbeat" );
}

_id_7002( var_0 )
{
    var_1 = _id_473C();
    var_1 thread _id_473B( 1, 0.25 );
}

_id_6F37( var_0 )
{
    var_1 = _id_473C( 0 );
    var_1 thread _id_473B( 1, 1 );
}

_id_7003( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( isdefined( var_0 ) )
        var_2 = var_0;
    else
        var_2 = 0.25;

    var_3 = _id_473C();
    var_3 thread _id_473B( 0, var_2 );
}

_id_6F36( var_0 )
{
    maps\_audio::aud_send_msg( "intro_fade_out_to_white" );
    var_1 = _id_56AD();
    var_1 thread _id_473B( 1, 0.25 );
}

_id_7004( var_0 )
{
    var_1 = _id_56AD();
    var_1 thread _id_473B( 1, 3 );
}

_id_7005()
{
    maps\_audio::aud_send_msg( "intro_fade_in_from_white" );
    var_0 = _id_56AD();
    var_0 thread _id_473B( 0, 0.25 );
}

_id_7006()
{
    thread _id_46B8( "white", 1, 2, 0 );
}

_id_6F39( var_0 )
{

}

_id_7007( var_0 )
{
    thread _id_7009();
    var_1 = common_scripts\utility::getstruct( "courtyard_intro_room_heli_explode_as_soap", "targetname" );
    playfx( common_scripts\utility::getfx( "slamraam_explosion" ), var_1.origin );
    earthquake( 0.8, 3, var_1.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    wait 0.5;
    thread _id_700A();
}

_id_6F3A( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "courtyard_intro_room_heli_explode_as_soap", "targetname" );
    common_scripts\utility::exploder( 21 );
    thread maps\intro_fx::_id_6ED2();
    level.player playrumbleonentity( "heavy_3s" );
    maps\_utility::_id_2693( "intro_godray" );
    stopfxontag( common_scripts\utility::getfx( "blood_cough" ), level._id_54E0, "J_Jaw" );
    var_2 = getent( "helicrash_wallshards", "script_noteworthy" );
    var_2._id_1032 = "helicrash_wallshards";
    var_2 maps\_anim::_id_1244();
    var_2 thread maps\_anim::_id_1246( var_2, "wallshards" );
    thread maps\_utility::vision_set_fog_changes( "Intro_heli_breach", 0 );
    thread maps\_utility::vision_set_fog_changes( "intro_dark", 1 );
    wait 7.75;
    thread maps\_utility::vision_set_fog_changes( "intro_bright", 1.25 );
    wait 3;
    var_2 hide();
    thread maps\_utility::vision_set_fog_changes( "intro", 2 );
    earthquake( 0.8, 3, var_1.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    common_scripts\utility::flag_wait( "msg_fx_zone7_5" );
    var_2 delete();
}

_id_7008( var_0 )
{
    var_1 = [ "joint_79", "joint_70" ];

    foreach ( var_3 in var_1 )
        var_0 hidepart( var_3 );
}

_id_7009()
{
    var_0 = 0.5;
    maps\_utility::_id_2771();
    maps\_utility::_id_2772( 0.75 );
    maps\_utility::_id_2774( var_0 );
    maps\_utility::_id_2775();
}

_id_700A()
{
    var_0 = 0.5;
    maps\_utility::_id_0A16( var_0 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_700B()
{
    level._id_51F2 waittill( "anim_ended" );
    common_scripts\utility::flag_set( "intro_room_heli_crash_complete" );
    level.player unlink();
    level._id_51F2 delete();
    maps\_shg_common::_id_1671();
    level.player enableweapons();
    level.player enableoffhandweapons();
    waittillframeend;
    maps\_utility::_id_1425( "intro_after_no_control" );
}

_id_700C()
{
    var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    var_0 thread maps\intro_utility::_id_6EC4( [ level._id_6FDD, level._id_6FE7, level._id_6FE6 ], "intro_work_on_soap", "intro_room_doctor_stop_idle" );
    var_0 thread maps\intro_utility::_id_6EC2( level._id_64A5, "intro_work_on_soap", "intro_room_nikolai_stop_idle" );
    var_0 thread maps\intro_utility::_id_6EC2( level._id_54E0, "intro_work_on_soap", "stop_wounded_on_table" );
    var_0 thread maps\_anim::_id_124E( level._id_6FE4, "intro_work_on_soap" );
}

_id_700D()
{
    level._id_4877.ignoreall = 0;
    level._id_4877 maps\_utility::_id_2686();
}

_id_700E()
{
    var_0 = getent( "intro_room_doctor", "targetname" );
    level._id_6FDD = var_0 maps\_utility::_id_166F( 1 );
    waittillframeend;
    level._id_6FDD.ignoreall = 1;
    level._id_6FDD._id_1032 = "doctor";
    var_1 = getent( "soap", "script_noteworthy" );
    var_1 maps\_utility::_id_166F( 1 );
    level._id_6FE4 = maps\_utility::_id_1287( "gurney", ( 0.0, 0.0, 0.0 ) );
    level._id_6FE6 = maps\_utility::_id_1287( "forceps", ( 0.0, 0.0, 0.0 ) );
    level._id_6FE7 = maps\_utility::_id_1287( "gauze", ( 0.0, 0.0, 0.0 ) );
    thread _id_700C();
}

_id_700F()
{
    var_0 = "intro_helicopter_landed_friends";
    var_1 = getentarray( "price", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( isspawner( var_3 ) )
            var_3.count = 1;
    }

    var_5 = getentarray( "nikolai", "script_noteworthy" );

    foreach ( var_3 in var_5 )
    {
        if ( isspawner( var_3 ) )
            var_3.count = 1;
    }

    maps\_shg_common::_id_166E( var_0, "price" );
    maps\_shg_common::_id_166E( var_0, "nikolai" );
    level._id_4877 maps\_utility::_id_123B();
    level._id_4877.ignoreall = 1;
    level._id_4877 maps\_utility::_id_24F5();
    level._id_64A5 maps\_utility::_id_123B();
    level._id_64A5.ignoreall = 1;
    level._id_64A5 maps\_utility::_id_24F5();
}

_id_7010()
{
    var_0 = [];
    var_0[var_0.size] = &"INTRO_INTROSCREEN_LINE1";
    var_0["date"] = &"INTRO_INTROSCREEN_LINE2";
    var_0[var_0.size] = &"INTRO_INTROSCREEN_LINE3";
    var_0[var_0.size] = &"INTRO_INTROSCREEN_LINE4";
    var_0[var_0.size] = &"INTRO_INTROSCREEN_LINE5";
    wait 2;
    maps\_introscreen::_id_1D96( var_0 );
}

_id_7011()
{
    level._id_51F2 waittill( "anim_ended" );
    setsaveddvar( "g_friendlyNameDist", 15000 );
    setsaveddvar( "compass", "1" );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "actionSlotsHide", "0" );
}

_id_7012()
{
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
}

_id_7028()
{
    common_scripts\utility::flag_wait( "courtyard_player_touching_balcony" );
    common_scripts\utility::flag_set( "courtyard_player_on_balcony" );
}

_id_7029()
{
    wait 1;
    _id_7035();
    maps\_utility::_id_1425( "intro_courtyard_save" );
}

_id_702A()
{
    common_scripts\utility::flag_wait( "obj_take_position_on_balcony" );
    var_0 = getnode( "courtyard_price_to_balcony", "targetname" );
    level._id_4877 setgoalnode( var_0 );
    waittillframeend;
    level._id_4877.goalradius = 10;
}

_id_702B()
{
    level.player enableinvulnerability();
    common_scripts\utility::flag_wait( "courtyard_mi28_3_done_firing" );
    level.player disableinvulnerability();
}

_id_702C()
{
    createthreatbiasgroup( "player_group" );
    createthreatbiasgroup( "courtyard_enemies" );
    level.player setthreatbiasgroup( "player_group" );
    level._id_4877 setthreatbiasgroup( "player_group" );
    level._id_64A5 setthreatbiasgroup( "player_group" );
    setignoremegroup( "player_group", "courtyard_enemies" );
}

_id_702D()
{
    var_0 = getentarray( "courtyard_breach_spawn", "targetname" );
    maps\_utility::_id_27C9( var_0, maps\_utility::_id_109B );
    maps\_utility::_id_27C9( var_0, ::_id_7037 );
    maps\_utility::_id_27C9( var_0, maps\_utility::_id_260D );
    common_scripts\utility::flag_wait( "courtyard_start_scene" );
    wait 5;
    common_scripts\utility::flag_set( "courtyard_start_breach" );
    _id_702E();
    var_0 = getentarray( "courtyard_spawn_1", "targetname" );
    maps\_utility::_id_27C9( var_0, ::_id_7037 );
    maps\_utility::_id_27C9( var_0, maps\_utility::_id_260D );
    var_1 = getentarray( "courtyard_spawn_2", "targetname" );
    maps\_utility::_id_27C9( var_1, ::_id_7037 );
    maps\_utility::_id_27C9( var_1, maps\_utility::_id_260D );
    thread maps\_spawner::_id_2135( var_0 );
    thread _id_7033();
    thread _id_7034();
    wait 4;
    var_0 = getentarray( "courtyard_friendly_spawn_2", "targetname" );
    var_2 = maps\_utility::_id_272B( var_0 );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_109B );
    common_scripts\utility::array_thread( var_2, ::_id_7037 );
    wait 2;
    thread maps\_spawner::_id_2135( var_1 );
    wait 7;
    common_scripts\utility::flag_set( "courtyard_combat_done" );
    maps\_spawner::_id_213C( 101 );
    thread maps\intro_vo::_id_6E90();
}

_id_702E()
{
    var_0 = common_scripts\utility::getstruct( "courtyard_animated_breach_org", "targetname" );
    var_1 = [];
    level._id_702F = 0;
    var_2 = getentarray( "courtyard_breach_spawn", "targetname" );
    var_3 = 1;

    foreach ( var_5 in var_2 )
    {
        var_6 = var_5 maps\_utility::_id_166F( 1 );
        var_6._id_1032 = "breacher" + var_3;
        var_6.allowdeath = 1;
        var_6 thread _id_7030();
        var_1[var_1.size] = [ var_6, 0 ];
        var_3++;
    }

    var_0 thread maps\_shg_common::_id_16EB( var_1, "courtyard_breach" );

    while ( level._id_702F < 4 )
        wait 0.1;
}

_id_7030()
{
    self waittill( "death" );
    level._id_702F++;
}

_id_7031()
{
    maps\_utility::_id_27CA( "courtyard_friendly_spawn_1", ::_id_7032 );
    common_scripts\utility::flag_wait( "courtyard_start_scene" );
    wait 1;
    var_0 = getentarray( "courtyard_friendly_spawn_1", "targetname" );
    thread maps\_spawner::_id_2135( var_0 );
}

_id_7032()
{
    maps\_utility::_id_109B();
    thread _id_7037();
}

_id_7033()
{
    common_scripts\utility::flag_wait( "courtyard_spawn_cleanup" );
    maps\_spawner::_id_213C( 101 );
    wait 0.1;
    var_0 = maps\_utility::_id_2641( "courtyard_spawn_1", "script_noteworthy" );
    maps\_utility::_id_2756( var_0, 256 );
    var_1 = maps\_utility::_id_2641( "courtyard_spawn_2", "script_noteworthy" );
    maps\_utility::_id_2756( var_1, 256 );
}

_id_7034()
{
    common_scripts\utility::flag_wait( "regroup_dialog_intro_complete" );
    var_0 = maps\_utility::_id_2641( "courtyard_friendly_spawn_1", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        maps\_utility::_id_2756( var_0, 256 );

    var_1 = maps\_utility::_id_2641( "courtyard_friendly_spawn_2", "script_noteworthy" );

    if ( isdefined( var_1 ) )
        maps\_utility::_id_2756( var_1, 256 );

    var_2 = maps\_utility::_id_2641( "escort_friendly_spawn_1", "script_noteworthy" );

    if ( isdefined( var_2 ) )
        maps\_utility::_id_2756( var_2, 256 );

    var_3 = maps\_utility::_id_2641( "courtyard_cover_pulldown1", "script_noteworthy" );
    maps\_utility::_id_2756( var_3, 256 );
    var_4 = maps\_utility::_id_2641( "courtyard_cover_pulldown2", "script_noteworthy" );
    maps\_utility::_id_2756( var_4, 256 );
}

_id_7035()
{
    var_0 = common_scripts\utility::getstruct( "breach_door_position", "targetname" );

    while ( !maps\_utility::_id_1FBD( var_0.origin ) )
        wait 0.1;
}

_id_7036()
{
    var_0 = getentarray( "breach_fx", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4CCD, "courtyard" );
    thread _id_4BB3( "courtyard_breach_door_left", "courtyard_breach_door_left_destroyed", "courtyard_left_breach_door_collision" );
    thread _id_4BB3( "courtyard_breach_door_right", "courtyard_breach_door_right_destroyed", "courtyard_right_breach_door_collision" );
    common_scripts\utility::flag_wait( "courtyard_start_breach" );
    common_scripts\utility::exploder( "breach_courtyard" );
    maps\_audio::aud_send_msg( "courtyard_start_breach" );
    common_scripts\utility::flag_set( "courtyard_doors_breach" );
    thread maps\intro_vo::_id_6E8F();
}

_id_7037()
{
    self.grenadeammo = 0;
}

_id_7038()
{
    var_0 = getentarray( "courtyard_helicopter_enemies", "script_noteworthy" );
    maps\_utility::_id_27C9( var_0, ::_id_7045 );
    thread _id_703A();
    wait 7;
    var_1 = getent( "courtyard_mi17_1", "targetname" );
    var_2 = var_1 maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "courtyard_heli_Mi17_01", var_2 );
    var_2 setmaxpitchroll( 20, 30 );
    var_2 thread _id_7043();
    var_2 thread _id_714B();
    var_3 = getentarray( "courtyard_mi17_drone1", "targetname" );
    common_scripts\utility::array_thread( var_3, ::_id_7039 );
    wait 6;
    var_3 = getentarray( "courtyard_mi17_drone3", "targetname" );
    common_scripts\utility::array_thread( var_3, ::_id_7039 );
    var_1 = getent( "courtyard_mi17_drone3_kill", "targetname" );
    var_4 = var_1 maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "courtyard_mi17_drone3_kill", var_4 );
    var_4 setmaxpitchroll( 20, 30 );
    var_4 thread _id_714B();
    var_5 = maps\_utility::_id_272C( "courtyard_rpg_attacker" );
    common_scripts\utility::array_thread( var_5, ::_id_703E, var_4 );
}

_id_7039()
{
    var_0 = maps\_vehicle::_id_1F9E();
    var_0 setmaxpitchroll( 30, 60 );
    var_0 thread _id_714B();
}

_id_703A()
{
    var_0 = _id_703B( "courtyard_mi28_1" );
    var_0 setmaxpitchroll( 20, 30 );
    var_0 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_1", var_0 );
    var_1 = _id_703B( "courtyard_mi28_5" );
    var_1 setmaxpitchroll( 30, 60 );
    var_1 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_5", var_1 );
    wait 3;
    var_2 = _id_703B( "courtyard_mi28_6" );
    var_2 setmaxpitchroll( 30, 60 );
    var_2 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_6", var_2 );
    wait 2;
    var_3 = _id_703B( "courtyard_mi28_2" );
    var_3 thread _id_7040();
    var_3 thread _id_703D( "courtyard_mi28_2_2", 25 );
    var_3 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_2", var_3 );
    wait 4;
    thread maps\intro_fx::_id_6EDA();
    wait 15;
    var_4 = _id_703B( "courtyard_mi28_3" );
    var_4 setmaxpitchroll( 20, 50 );
    var_4 thread _id_703D( "courtyard_mi28_3_2", 25 );
    var_4 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_3", var_4 );
    wait 1;
    var_5 = _id_703B( "courtyard_mi28_7", 1, 10 );
    var_5 setmaxpitchroll( 20, 60 );
    var_5 thread _id_703D( "courtyard_mi28_7_2", 25 );
    var_5 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_7", var_5 );
    var_6 = _id_703B( "courtyard_mi28_8", 1, 10 );
    var_6 setmaxpitchroll( 20, 60 );
    var_6 thread _id_703D( "courtyard_mi28_8_2", 25 );
    var_6 thread _id_714B();
    maps\_audio::aud_send_msg( "attack_heli_mi28_8", var_6 );
    wait 20;
    thread _id_7042();
}

_id_703B( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );
    var_4 = var_3 maps\_vehicle::_id_1F9E();
    var_4._id_29CC = 1;

    if ( isdefined( var_1 ) )
        var_4 thread _id_703D( var_0, var_2 );
    else
        var_4 thread _id_703C( var_0 );

    return var_4;
}

_id_703C( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 + "_fire" );
    var_1 = common_scripts\utility::getstruct( var_0 + "_target", "targetname" );
    _id_28E2( var_1, 3, 0.25, "cobra_seeker" );
}

_id_703D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 75;

    self endon( "death" );
    common_scripts\utility::flag_wait( var_0 + "_fire" );
    var_2 = common_scripts\utility::getstruct( var_0 + "_target", "targetname" );
    _id_704B( var_2, var_1, randomfloatrange( 0.05, 0.15 ) );
}

_id_703E( var_0 )
{
    self endon( "death" );
    self._id_4625 = self.weapon;
    maps\_utility::_id_104A( "rpg", "primary" );
    self waittill( "goal" );
    maps\_utility::_id_26F3( 1 );
    self setstablemissile( 1 );
    self setentitytarget( var_0 );
    self.a.rockets = 1;
    self.maxsightdistsqrd = 67108864;
    self._id_238A = 1;

    while ( isalive( var_0 ) )
    {
        wait 0.1;

        if ( self.a.rockets < 1 )
            break;
    }

    self clearentitytarget();
    maps\_utility::_id_104A( self._id_4625, "primary" );
    self._id_1382 = 0;
}

_id_703F( var_0 )
{
    var_1 = getent( "courtyard_rpg_attacker_scripted", "targetname" );
    var_2 = var_1 maps\_utility::_id_166F();
    var_2._id_1032 = "generic";
    var_2 thread maps\_utility::_id_0D04();
    var_2._id_4B64 = 1;
    var_2 _id_460E();
    var_2 maps\_utility::_id_2709( "stinger_speedy", "back" );
    var_2 maps\_utility::_id_123B();
    var_3 = common_scripts\utility::getstruct( "courtyard_rpg_attacker_scripted_anim_pos", "targetname" );
    var_3 maps\_anim::_id_124A( var_2, "fire_rocket" );
    var_2 maps\_utility::_id_2709( "stinger_speedy", "chest" );
    var_3 thread maps\_anim::_id_1246( var_2, "fire_rocket" );
    var_2 waittillmatch( "single anim", "fire rocket" );
    var_4 = var_2 gettagorigin( "TAG_INHAND" );
    var_0 maps\_vehicle::_id_2A13();
    var_5 = magicbullet( "stinger_speedy", var_4, var_0.origin );
    var_6 = [ var_4, var_5 ];
    maps\_audio::aud_send_msg( "courtyard_magic_rpg_01", var_6 );
    var_5 missile_settargetent( var_0 );
    var_2 maps\_utility::_id_2709( "stinger_speedy", "none" );
    var_2 waittillmatch( "single anim", "end" );
    var_2 thread maps\_utility::_id_2686();
    var_2 thread maps\_utility::_id_1902();
    var_2 _id_460C();
}

_id_7040()
{
    self setmaxpitchroll( 10, 60 );
    common_scripts\utility::flag_wait( "courtyard_mi28_2_2_fire" );
    self setmaxpitchroll( 35, 60 );
}

_id_7041()
{
    var_0 = getent( "courtyard_mi28_3", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1._id_29CC = 1;
    var_1 thread _id_7046();
}

_id_7042()
{
    common_scripts\utility::flag_set( "courtyard_attack_helicopter_second_pass" );
    var_0 = getent( "courtyard_mi28_4", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1._id_29CC = 1;
    var_1 setmaxpitchroll( 20, 40 );
    var_1 thread _id_7047();
    var_1 thread _id_7044();
    var_1 thread _id_714B();
}

_id_7043()
{
    common_scripts\utility::flag_wait( "courtyard_helicopter_1_takedown" );
    wait 2;
    thread _id_703F( self );
    wait 10;
    common_scripts\utility::flag_set( "courtyard_helicopter_enemies_delete" );
}

_id_7044()
{
    common_scripts\utility::flag_wait( "courtyard_mi28_4_takedown" );
    var_0 = common_scripts\utility::getstruct( "courtyard_mi28_4_take_down_missile_src_1", "targetname" );
    maps\_vehicle::_id_2A13();
    _id_7100( var_0, undefined, "stinger_speedy" );
    maps\_audio::aud_send_msg( "courtyard_helicopter4_kill", self );
}

_id_7045()
{
    self endon( "death" );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "courtyard_helicopter_enemies_delete" );
    self delete();
}

_id_7046()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "courtyard_mi28_3_fire" );
    var_0 = common_scripts\utility::getstruct( "courtyard_helicopter_slamraam_target", "targetname" );
    _id_28E2( var_0, 3, 0.25, "cobra_seeker" );
    wait 1;
    var_0 = common_scripts\utility::getstruct( "courtyard_helicopter_hotel_target", "targetname" );
    _id_28E2( var_0, 3, 0.25, "cobra_seeker" );
    common_scripts\utility::flag_set( "courtyard_mi28_3_done_firing" );
}

_id_7047()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "courtyard_mi28_4_fire" );
    var_0 = common_scripts\utility::getstruct( "courtyard_helicopter_4_target_1", "targetname" );
    _id_28E2( var_0, 3, 0.25, "cobra_seeker" );
}

_id_28E2( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );

    if ( isdefined( self._id_28E3 ) )
        var_4 = self._id_28E3;
    else
        var_4 = "turret_attackheli";

    var_5 = "missile_attackheli";

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    var_6 = undefined;
    var_7 = [];
    self setvehweapon( var_4 );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_8 = 0;

    if ( !isdefined( var_0.classname ) )
    {
        var_9 = spawn( "script_origin", var_0.origin );
        var_9._id_7048 = 0;
        level thread _id_7049( self, var_9 );
        var_9.targetname = var_0.targetname;
        var_9.origin = var_0.origin;
        var_0 = var_9;
        var_0 thread _id_704E();
        var_8 = 1;
    }

    var_6 = 0.5;
    var_7[0] = "tag_store_L_2_a";
    var_7[1] = "tag_store_R_2_a";
    var_7[2] = "tag_store_L_2_b";
    var_7[3] = "tag_store_R_2_b";
    var_7[4] = "tag_store_L_2_c";
    var_7[5] = "tag_store_R_2_c";
    var_7[6] = "tag_store_L_2_d";
    var_7[7] = "tag_store_R_2_d";
    var_10 = -1;

    for ( var_11 = 0; var_11 < var_1; var_11++ )
    {
        var_10++;

        if ( var_10 >= var_7.size )
            var_10 = 0;

        self setvehweapon( var_5 );
        self._id_2889 = 1;
        var_12 = self fireweapon( var_7[var_10], var_0 );
        maps\_audio::aud_send_msg( "heli_fire_missile", var_12 );

        if ( var_8 )
            level thread _id_704A( var_0, var_12 );

        var_12 thread _id_704C( var_0 );
        var_12 thread vehicle_scripts\_attack_heli::_id_28B3();

        if ( var_11 < var_1 - 1 )
            wait(var_2);
    }

    self._id_2889 = 0;
    self setvehweapon( var_4 );
    self notify( "done_firing_weapons" );
}

_id_7049( var_0, var_1 )
{
    var_1 endon( "death" );
    var_0 common_scripts\utility::waittill_any( "death", "heli_players_dead", "done_firing_weapons" );
    wait 0.05;

    while ( isdefined( var_1._id_7048 ) && var_1._id_7048 > 0 )
        var_1 waittill( "ref_count_updated" );

    var_1 delete();
}

_id_704A( var_0, var_1 )
{
    var_0._id_7048++;
    var_1 waittill( "death" );
    var_0._id_7048--;
    var_0 notify( "ref_count_updated" );
}

_id_704B( var_0, var_1, var_2 )
{
    var_2 = 0.11;
    self endon( "death" );
    self endon( "heli_players_dead" );
    var_3 = 0;

    if ( isdefined( self._id_28E3 ) )
        var_4 = self._id_28E3;
    else
        var_4 = "mi28_turret_intro";

    var_5 = "mi28_turret_intro";
    var_6 = undefined;
    var_7 = [];
    self setvehweapon( var_4 );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_8 = var_0;
    var_9 = undefined;
    var_10 = undefined;

    if ( !isdefined( var_0.classname ) )
    {
        var_11 = spawn( "script_origin", var_0.origin );
        level thread _id_7049( self, var_11 );
        var_3 = 1;
        var_11.targetname = var_0.targetname;
        var_11.origin = var_0.origin;
        var_8 = var_11;
    }

    if ( isdefined( var_0.target ) )
    {
        if ( !isdefined( var_0.classname ) )
        {
            var_12 = common_scripts\utility::getstruct( var_0.target, "targetname" );
            var_13 = distance( var_0.origin, var_12.origin );
            var_14 = vectortoangles( var_12.origin - var_0.origin );
            var_10 = anglestoforward( var_14 );
            var_9 = var_13 / var_1;
        }
    }

    self setturrettargetent( var_8 );
    wait 0.5;

    for ( var_15 = 0; var_15 < var_1; var_15++ )
    {
        if ( !isdefined( var_8 ) )
            break;

        self fireweapon( "tag_flash", var_8 );
        wait(var_2);

        if ( isdefined( var_9 ) && isdefined( var_10 ) )
            var_8.origin += var_10 * var_9;
    }

    self setvehweapon( var_4 );
    self notify( "done_firing_weapons" );
}

_id_704C( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = 512;

    if ( isdefined( var_1 ) && var_1 )
        thread _id_704D( var_0 );

    for (;;)
    {
        var_3 = distance( self.origin, var_0.origin );

        if ( var_3 < var_2 )
        {
            var_0 notify( "missile_hit" );
            self notify( "missile_hit" );
        }

        wait 0.05;
    }
}

_id_704D( var_0 )
{
    var_0 endon( "missile_hit" );
    self waittill( "death" );
    var_0 notify( "missile_hit" );
}

_id_704E()
{
    self waittill( "missile_hit" );

    if ( isdefined( self.targetname ) )
    {
        switch ( self.targetname )
        {
            case "courtyard_mi28_1_target":
                playfx( common_scripts\utility::getfx( "slamraam_explosion" ), self.origin );
                thread maps\intro_fx::_id_6ED9();
                break;
            case "courtyard_mi28_2_target":
                break;
            case "courtyard_mi28_3_target":
                thread _id_704F();
                break;
            case "courtyard_helicopter_4_target_1":
                break;
            case "courtyard_mi28_5_target":
                break;
            case "courtyard_mi28_6_target":
                break;
            case "regroup_gate_uav_target":
                thread _id_70A5();
                break;
            case "javelin_end_point":
                break;
            case "regroup_uav_street_target1":
                thread _id_70A8();
                break;
            case "regroup_uav_street_target2":
                break;
            case "regroup_uav_rural_target1":
                break;
            case "regroup_uav_rural_target2":
                break;
            case "building_slide_run_target2":
                thread _id_711E();
                earthquake( 0.2, 0.5, level.player.origin, 1280 );
                playrumbleonposition( "artillery_rumble", self.origin );
                break;
            case "building_slide_run_target4":
                thread _id_7122();
                playfx( common_scripts\utility::getfx( "intro_sliderun_buildingexp" ), self.origin );
                thread maps\intro_fx::_id_6EFD();
                earthquake( 0.2, 0.5, level.player.origin, 1280 );
                playrumbleonposition( "artillery_rumble", self.origin );
                break;
            case "building_slide_run_target1":
            case "building_slide_run_target3":
            case "building_slide_run_target5":
            case "building_slide_run_target6":
            case "building_slide_run_target7":
            case "building_slide_run_target8":
                earthquake( 0.5, 0.5, level.player.origin, 2048 );
                playrumbleonposition( "artillery_rumble", self.origin );
                break;
            default:
                break;
        }
    }
}

_id_704F()
{
    earthquake( 0.8, 3, self.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    thread maps\intro_fx::_id_6EDB();
    wait 2;
    common_scripts\utility::flag_set( "courtyard_mi28_3_done_firing" );
}

_id_7050()
{
    common_scripts\utility::flag_wait( "courtyard_helicopter_drone_takedown" );
    wait 5;
    var_0 = common_scripts\utility::getstruct( "courtyard_helicopter_takedown_missile_src", "targetname" );
    _id_7100( var_0, undefined, "stinger_speedy" );
}

_id_7051()
{
    maps\_utility::_id_27CA( "courtyard_drone", ::_id_7151, "courtyard_kill_drones", 1 );
    common_scripts\utility::flag_wait( "courtyard_start_breach" );
    level notify( "courtyard_kill_drones" );
}

_id_7052()
{
    var_0 = common_scripts\utility::getstruct( "courtyard_cover_pull_down", "targetname" );
    var_1 = maps\_utility::_id_1287( "cover_object", ( 0.0, 0.0, 0.0 ) );
    var_0 maps\_anim::_id_11CF( var_1, "cover_object_pull_down" );
    var_2 = getent( "courtyard_cover_pulldown_col", "targetname" );
    var_2 notsolid();
    common_scripts\utility::flag_wait( "courtyard_player_touching_balcony" );
    var_3 = getent( "courtyard_cover_pulldown1", "script_noteworthy" );
    var_4 = var_3 maps\_utility::_id_166F( 1 );
    var_4._id_1032 = "object_puller1";
    var_4 thread maps\_utility::_id_0D04();
    var_4 thread _id_7053( var_1 );
    wait 2;
    var_3 = getent( "courtyard_cover_pulldown2", "script_noteworthy" );
    var_5 = var_3 maps\_utility::_id_166F( 1 );
    var_5._id_1032 = "object_puller2";
    var_5 thread maps\_utility::_id_0D04();
    var_5 thread _id_7054();
    wait 3;
    var_2 solid();
}

_id_7053( var_0 )
{
    self endon( "death" );
    var_1 = common_scripts\utility::getstruct( "courtyard_cover_pull_down", "targetname" );
    var_2 = maps\_utility::_id_2766( self, var_0 );
    var_1 thread maps\_anim::_id_11DD( var_2, "cover_object_pull_down" );
    self.a._id_0D26 = "crouch";
    var_3 = getnode( "courtyard_cover_pulldown1_node", "targetname" );
    self setgoalnode( var_3 );
    maps\_utility::_id_1902();
}

_id_7054()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( "courtyard_cover_pull_down", "targetname" );
    var_0 thread maps\_anim::_id_1246( self, "cover_object_pull_down" );
    self.a._id_0D26 = "crouch";
    var_1 = getnode( "courtyard_cover_pulldown2_node", "targetname" );
    self setgoalnode( var_1 );
    maps\_utility::_id_1902();
}

_id_7055()
{
    var_0 = thread _id_703B( "escort_doc_down_mi28", 1, 5 );
    var_0 setmaxpitchroll( 30, 60 );
    var_0 thread _id_714B();
    maps\_audio::aud_send_msg( "escort_doc_down_mi28", var_0 );
    common_scripts\utility::flag_wait( "escort_doc_down_mi28_fire" );
    wait 3;
    var_1 = common_scripts\utility::getstruct( "escort_doc_down_mi28_2_target", "targetname" );
    maps\_audio::aud_send_msg( "mi28_doctor_killed_flyout", var_0 );
    var_0 _id_704B( var_1, 75, 0.07 );
}

_id_7056()
{
    thread _id_705B();
    common_scripts\utility::flag_wait( "escort_player_help_soap" );
    maps\_utility::_id_1425( "intro_help_soap" );
    var_0 = getent( "escort_player_help_soap_use", "targetname" );
    var_0 sethintstring( &"INTRO_HELP_SOAP" );
    var_0 waittill( "trigger" );
    var_0 delete();
    level.player enableinvulnerability();
    thread maps\intro_fx::_id_6EEB();
    _id_7059();
    common_scripts\utility::flag_set( "escort_player_helping_soap" );
    thread _id_7060();
    common_scripts\utility::flag_wait( "escort_help_soap_complete" );
    thread _id_7061();
    common_scripts\utility::flag_set( "obj_exit_hotel" );
}

_id_7057()
{
    var_0 = common_scripts\utility::getstruct( "escort_price_throw_smoke", "targetname" );
    _id_460E();
    self._id_7058 = self.grenadeweapon;
    self.grenadeweapon = "smoke_grenade_intro";
    var_1 = getnode( "courtyard_price_to_balcony", "targetname" );

    if ( !var_1 maps\intro_utility::_id_6BA9( level._id_4877, "exposed_grenadeThrowB", undefined, undefined, 16 ) )
        var_1 maps\_anim::_id_124A( level._id_4877, "exposed_grenadeThrowB" );

    var_1 thread maps\_anim::_id_1246( level._id_4877, "exposed_grenadeThrowB" );
    self waittillmatch( "single anim", "grenade_throw" );
    var_2 = common_scripts\utility::getstruct( "escort_price_throw_smoke_src", "targetname" );
    self magicgrenade( var_2.origin, var_0.origin, 2 );
    self waittillmatch( "single anim", "end" );
    _id_460C();
    self.grenadeweapon = self._id_7058;
    common_scripts\utility::flag_set( "escort_smoke_out" );
}

_id_7059()
{
    maps\_shg_common::_id_1670();
    level.player disableweapons();
    level.player disableweaponswitch();
    level._id_51F2 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    level._id_51F2._id_1032 = "player_rig";
}

_id_705A()
{
    common_scripts\utility::flag_set( "escort_start_nikolai_color" );
    level._id_64A5 waittill( "anim_ended" );
    level._id_54E0 notify( "stop_loop" );
    maps\intro_carry::_id_6F1E( "wounded_idle", "soap_lie_down_idle" );
    maps\intro_carry::_id_6F1E( "pickup_wounded", "pickup_soap" );
    maps\intro_carry::_id_6F1E( "pickup_carrier", "pickup_soap" );
    maps\intro_carry::_id_6F1E( "putdown_wounded", "putdown_soap_init" );
    maps\intro_carry::_id_6F1E( "putdown_carrier", "putdown_soap_init" );
    var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    level._id_54E0 thread maps\intro_carry::_id_406A( var_0 );
    level._id_64A5 thread maps\intro_carry::_id_6F22( level._id_54E0, var_0 );
    level._id_64A5 thread maps\intro_carry::_id_6F20();
    common_scripts\utility::flag_set( "intro_room_soap_to_wounded_idle" );
}

_id_705B()
{
    var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    level._id_6FDD notify( "intro_room_doctor_stop_idle" );
    level._id_64A5 notify( "intro_room_nikolai_stop_idle" );
    level._id_54E0 notify( "stop_wounded_on_table" );
    var_1 = [];
    var_1[0] = [ level._id_6FDD, 0 ];
    var_1[1] = [ level._id_64A5, 0 ];
    var_1[2] = [ level._id_54E0, 0 ];
    var_1[3] = [ level._id_6FE6, 0 ];
    var_1[4] = [ level._id_6FE7, 0 ];
    level._id_6FDD maps\_utility::delaythread( 0.1, ::_id_705C );
    var_0 thread maps\_shg_common::_id_16EB( var_1, "escort_doctor_dies" );
    level._id_6FDD thread _id_705D();
    var_0 waittill( "escort_doctor_dies" );
    var_0 thread maps\intro_utility::_id_6EC2( level._id_64A5, "escort_wait_for_player_idle", "escort_wait_stop_idle" );
    var_0 thread maps\intro_utility::_id_6EC2( level._id_54E0, "escort_wait_for_player_idle", "escort_wait_stop_idle" );
    common_scripts\utility::flag_set( "escort_player_help_soap" );
    common_scripts\utility::flag_wait( "escort_player_starting_courtyard" );
    level._id_6FE6 delete();
    level._id_6FE7 delete();
}

_id_705C()
{
    var_0 = randomintrange( 1, 3 );
    _id_539D( "headshot" + var_0, "tag_eye" );
    animscripts\death::_id_0ECA();
}

_id_705D()
{
    self endon( "death" );
    self waittill( "anim_ended" );
    self.allowdeath = 1;
    self._id_0EC6 = 1;
    self._id_0EC3 = 1;
    thread maps\_utility::_id_0D72( 0 );
    self kill();
}

_id_705E()
{
    level._id_705F = maps\_utility::_id_1287( "syringe", ( 0.0, 0.0, 0.0 ) );
    level._id_705F dontcastshadows();
    var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    var_0 maps\_anim::_id_11CF( level._id_705F, "escort_help_soap" );
}

_id_7060()
{
    level._id_51F2 hide();
    level._id_51F2 dontcastshadows();
    var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    var_0 maps\_anim::_id_11CF( level._id_51F2, "escort_help_soap" );
    level.player playerlinktoblend( level._id_51F2, "tag_player", 0.5, 0.2, 0.2 );
    wait 0.5;
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 12, 5, 15, 0, 1 );
    level._id_51F2 show();
    level._id_64A5 notify( "escort_wait_stop_idle" );
    level._id_54E0 notify( "escort_wait_stop_idle" );
    var_1 = [];
    var_1[0] = level._id_4877;
    var_1[1] = level._id_64A5;
    var_1[2] = level._id_54E0;
    var_1[3] = level._id_51F2;
    var_1[4] = level._id_705F;
    var_0 maps\_anim::_id_11DD( var_1, "escort_help_soap" );
    common_scripts\utility::flag_set( "escort_help_soap_complete" );
    var_0 thread maps\intro_utility::_id_6EC2( level._id_54E0, "soap_lie_down_idle", "stop_loop" );
}

_id_7061()
{
    thread maps\intro_fx::_id_6EDD();
    var_0 = getent( "escort_help_soap_breacher1", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_1._id_1032 = "breacher1";
    var_2 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
    level._id_54E0 notify( "stop_loop" );
    var_3 = [];
    var_3[0] = [ level._id_64A5, 0 ];
    var_3[1] = [ level._id_54E0, 0 ];
    var_3[2] = [ var_1, 0 ];
    var_3[3] = [ level._id_51F2, 0 ];
    var_3[4] = [ level._id_4877, 0.15 ];
    var_3[5] = [ level._id_705F, 0 ];
    level._id_4877 thread maps\_shg_common::_id_16E9( "escort_help_soap_breach_price_face" );
    var_2 thread maps\_shg_common::_id_16EB( var_3, "escort_help_soap_breach" );
    var_2 thread maps\intro_utility::_id_6EC2( level._id_54E0, "soap_lie_down_idle", "stop_loop" );
    thread _id_7062();
    thread _id_7063();
    thread _id_705A();
}

_id_7062()
{
    level._id_51F2 waittill( "anim_ended" );
    level.player unlink();
    level.player disableinvulnerability();
    level._id_51F2 delete();
    level._id_705F delete();
    maps\_shg_common::_id_1671();
    level.player enableweaponswitch();
    level.player enableweapons();
}

_id_7063()
{
    if ( level._id_4877.a._id_0D26 == "prone" )
    {
        level._id_4877 orientmode( "face default" );
        level._id_4877 animscripts\utility::_id_0F7D( 1.0 );
        level._id_4877.a._id_0D29 = undefined;
    }

    level._id_4877.a._id_0D26 = "stand";
    level._id_4877.a._id_0D2B = "run";
    level._id_4877 maps\_utility::_id_109B();
    level._id_4877 waittill( "anim_ended" );
    level._id_4877 maps\_utility::_id_2688();
    var_0 = getent( "trig_price_post_door", "targetname" );
    var_0 notify( "trigger" );
    wait 0.4;
    maps\_utility::_id_1425( "intro_help_soap_complete" );
}

_id_7064()
{
    common_scripts\utility::flag_wait( "escort_player_starting_courtyard" );
    wait 1;

    for (;;)
    {
        var_0 = maps\_utility::_id_2641( "escort_spawn_1", "script_noteworthy" );

        if ( var_0.size < 5 || common_scripts\utility::flag( "escort_player_halfway_through_courtyard" ) )
        {
            maps\_utility::_id_272C( "escort_spawn_2" );
            break;
        }

        wait 0.1;
    }

    for (;;)
    {
        var_0 = maps\_utility::_id_2641( "escort_spawn_2", "script_noteworthy" );

        if ( var_0.size < 2 || common_scripts\utility::flag( "escort_player_halfway_through_courtyard" ) )
        {
            maps\_utility::_id_272C( "escort_spawn_3" );
            break;
        }

        wait 0.1;
    }

    maps\intro_vo::_id_6E98();
}

_id_7065()
{
    self rotateto( self.angles + ( 0.0, -110.0, 0.0 ), 0.5, 0.25, 0 );
    self connectpaths();
    self waittill( "rotatedone" );
}

_id_7066()
{
    self rotateto( self.angles + ( 0.0, 110.0, 0.0 ), 0.5, 0.25, 0 );
    self connectpaths();
    self waittill( "rotatedone" );
}

_id_7067()
{
    common_scripts\utility::flag_wait( "intro_room_soap_to_wounded_idle" );
    level._id_64A5 waittill( "carry_picked_up" );
    maps\intro_carry::_id_6F1E( "wounded_idle", "wounded_idle" );
    level._id_54E0 waittill( "stop_putdown" );
    maps\intro_carry::_id_6F1D();
    thread _id_7070();
}

_id_7068()
{
    thread _id_7069();
}

_id_7069()
{
    common_scripts\utility::flag_wait( "escort_mi28_1_start" );
    wait 3;
    var_0 = getent( "escort_mi28_1", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1 thread _id_714B();
    maps\_audio::aud_send_msg( "escort_mi28_1", var_1 );
    common_scripts\utility::flag_wait( "escort_mi28_1_fire" );
    var_2 = common_scripts\utility::getstruct( "escort_mi28_1_fire_dest1", "targetname" );
    var_1 thread _id_704B( var_2, 75, 0.05 );
}

_id_706B()
{
    maps\_utility::_id_27CA( "escort_rappeler1", ::_id_7037 );
    maps\_utility::_id_27CA( "escort_rappeler1", ::_id_50B5, 0.01 );
    maps\_utility::_id_27CA( "escort_rappeler1", maps\_utility::_id_260D );
    maps\_utility::_id_27CA( "escort_rappeler2", ::_id_7037 );
    maps\_utility::_id_27CA( "escort_rappeler2", ::_id_50B5, 0.01 );
    maps\_utility::_id_27CA( "escort_rappeler2", maps\_utility::_id_260D );
    maps\_utility::_id_27CA( "escort_rappeler3", ::_id_7037 );
    maps\_utility::_id_27CA( "escort_rappeler3", ::_id_50B5, 0.01 );
    maps\_utility::_id_27CA( "escort_rappeler3", maps\_utility::_id_260D );
    common_scripts\utility::flag_wait( "escort_start_rappelers" );
    var_0 = getent( "escort_rappeler3", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_0 = getent( "escort_rappeler1", "targetname" );
    var_2 = var_0 maps\_utility::_id_166F( 1 );
    var_2.allowdeath = 1;
    var_2._id_1032 = "generic";
    var_3 = getentarray( "rappeler1_lattice", "targetname" );
    maps\_utility::delaythread( 3.5, common_scripts\utility::exploder, "rappeler1" );
    maps\_utility::delaythread( 3.55, ::_id_706C, var_3 );
    var_4 = maps\_utility::_id_1287( "rope", ( 0.0, 0.0, 0.0 ) );
    var_5 = common_scripts\utility::getstruct( "escort_rappeler1_anim_pos", "targetname" );
    var_5 thread maps\_anim::_id_11DD( [ var_2, var_4 ], "escort_rappel" );
    wait 1;
    var_0 = getent( "escort_rappeler2", "targetname" );
    var_6 = var_0 maps\_utility::_id_166F( 1 );
    var_6.allowdeath = 1;
    var_6._id_1032 = "generic";
    var_7 = getentarray( "rappeler2_lattice", "targetname" );
    maps\_utility::delaythread( 3.4, common_scripts\utility::exploder, "rappeler2" );
    maps\_utility::delaythread( 3.45, ::_id_706C, var_7 );
    var_8 = maps\_utility::_id_1287( "rope", ( 0.0, 0.0, 0.0 ) );
    var_9 = common_scripts\utility::getstruct( "escort_rappeler2_anim_pos", "targetname" );
    var_9 thread maps\_anim::_id_11DD( [ var_6, var_8 ], "escort_rappel" );
    common_scripts\utility::flag_wait( "escort_player_starting_courtyard" );
    var_4 delete();
    var_8 delete();
}

_id_706C( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_706D()
{
    common_scripts\utility::flag_wait( "escort_rappelers_dead" );
    level._id_4877 maps\_utility::_id_123B();
    level._id_4877 pushplayer( 1 );
    var_0 = getent( "escort_hotel_door_hallway", "targetname" );
    var_1 = getent( "escort_hotel_door_hallway2", "targetname" );
    var_2 = common_scripts\utility::getstruct( "escort_price_open_door_to_stairs", "targetname" );
    var_2 maps\_anim::_id_124A( level._id_4877, "door_kick_in" );
    var_0 maps\_utility::delaythread( 0.4, ::_id_7066 );
    thread maps\intro_fx::_id_6EE7();
    maps\_audio::aud_send_msg( "escort_doorkick", var_1 );
    var_1 maps\_utility::delaythread( 0.4, ::_id_7065 );
    var_2 maps\_anim::_id_1246( level._id_4877, "door_kick_in" );
    level._id_4877 maps\_utility::_id_2686();
    level._id_4877 pushplayer( 0 );
    var_3 = getent( "escort_price_down_stairs", "targetname" );
    var_3 notify( "trigger" );
    level._id_4877 maps\_utility::delaythread( 2, maps\_utility::_id_109E );
}

_id_706E()
{
    common_scripts\utility::array_thread( getentarray( "escort_wounded_spawner_trigger", "targetname" ), ::_id_7157, "regroup_dialog_intro_complete" );
    maps\_utility::_id_27CB( "escort_drone_anim_then_idle", ::_id_7155, "regroup_dialog_intro_complete" );
    maps\_utility::_id_27CB( "escort_drone_anim_then_die", ::_id_7156, "regroup_dialog_intro_complete" );
}

_id_706F()
{
    common_scripts\utility::flag_wait( "escort_player_starting_courtyard" );
}

_id_7070()
{
    common_scripts\utility::flag_wait( "exiting_courtyard" );
    var_0 = getent( "courtyard", "targetname" );
    var_1 = getent( "regroup", "targetname" );
    remapstage( var_0.origin, var_1.origin );
}

_id_7071()
{
    var_0 = common_scripts\utility::getstruct( "regroup_price_to_nikolai_anim_ent", "targetname" );
    var_1 = maps\_utility::_id_1287( "gate", var_0.origin );
    var_0 maps\_anim::_id_11CF( var_1, "price_to_nikolai" );
    common_scripts\utility::flag_wait( "regroup_dialog_intro_start" );
    var_2 = getent( "regroup_start_dialog_check_enemies", "targetname" );

    while ( var_2 maps\_utility::_id_2789( "axis" ).size )
        wait 0.1;

    var_3 = getent( "regroup_price_to_nikolai_col", "targetname" );
    var_4 = maps\_utility::_id_1287( "uav", ( 0.0, 0.0, 0.0 ) );
    level._id_4877 maps\_utility::_id_123B();
    var_0 maps\_anim::_id_124A( level._id_4877, "price_to_nikolai_transition" );
    common_scripts\utility::flag_set( "regroup_dialog_intro_start_all_clear" );
    var_0 maps\_anim::_id_1246( level._id_4877, "price_to_nikolai_transition" );
    maps\_utility::delaythread( 13, common_scripts\utility::flag_set, "regroup_intro_start_sequence" );
    maps\_utility::delaythread( 9, common_scripts\utility::flag_set, "regroup_intro_enemies_start" );
    maps\_utility::delaythread( 13, common_scripts\utility::flag_set, "regroup_start_civilian_run" );
    var_4 maps\_utility::delaythread( 3.75, ::_id_7072 );
    level._id_4877 thread maps\_shg_common::_id_16E9( "price_to_nikolai_face" );
    var_0 thread maps\_anim::_id_11DD( [ level._id_4877, var_1, var_4 ], "price_to_nikolai" );
    maps\_audio::aud_send_msg( "regroup_uav_gate_fly_by", var_4 );
    wait 15.5;
    thread maps\intro_fx::_id_6EDE();
    var_3 thread _id_7074();
    maps\_audio::aud_send_msg( "mus_courtyard_gate_breach" );
    maps\_audio::aud_send_msg( "aud_courtyard_gate_breach" );
    level._id_4877 maps\_utility::_id_2686();
    var_5 = getent( "escort_gate_open_price_move_up", "targetname" );
    var_5 notify( "trigger" );
    maps\_utility::_id_1425( "regroup_start" );
}

_id_7072()
{
    var_0 = getent( "regroup_gate_uav_target", "targetname" );
    var_0 _id_7100( self, "direct" );
}

_id_7073()
{
    var_0 = getent( "regroup_break_and_rake_car", "targetname" );
    var_1 = maps\_utility::_id_1287( "destructible_car", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 thread maps\intro_utility::_id_6EC7();
    var_2 = common_scripts\utility::getstruct( "regroup_break_and_rake", "targetname" );
    var_2 maps\_anim::_id_11CF( var_1, "price_break_and_rake" );
    var_3 = getent( "trigger_price_cover_slide", "targetname" );
    var_3 waittill( "trigger" );
    var_4 = getent( "regroup_price_break_and_rake_complete_color", "targetname" );
    var_4 notify( "trigger" );
    level._id_4877 _id_460E();
    level._id_4877 maps\_utility::_id_123B();
    var_2 maps\_anim::_id_124A( level._id_4877, "price_break_and_rake" );
    var_2 thread maps\_anim::_id_11DD( [ level._id_4877, var_1 ], "price_break_and_rake" );
    maps\_utility::delaythread( 2.65, maps\intro_anim::_id_6F52, var_1 );
    level._id_4877.a._id_0D26 = "crouch";
    level._id_4877 maps\_utility::_id_2686();
    level._id_4877 _id_460C();
}

_id_7074()
{
    self connectpaths();
    self delete();
}

_id_7075()
{
    thread _id_7076();
    thread _id_7077();
}

_id_7076()
{
    maps\_utility::_id_27CA( "regroup_intro_friendlies_init", ::_id_7078 );
    maps\_utility::_id_27CA( "regroup_intro_friendlies_init", ::_id_709E );
    common_scripts\utility::flag_wait( "regroup_intro_friendlies_init_spawn" );
    maps\_utility::_id_272D( "regroup_intro_friendlies_init" );
    maps\_utility::_id_272D( "regroup_intro_friendlies_init_extra" );
}

_id_7077()
{
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    level notify( "kill_color_replacements" );
    var_0 = maps\_utility::_id_2641( "regroup_intro_friendlies_init", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2705 );
    var_0 = maps\_utility::_id_2641( "breachers", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2705 );
}

_id_7078()
{
    thread maps\_utility::_id_139E();
    self endon( "death" );
}

_id_7079()
{
    self endon( "death" );
    self._id_1032 = "generic";
    thread maps\_utility::_id_0D04();
    maps\_utility::_id_123B();
    var_0 = "coverstand_hide_idle_wave01";
    var_1 = getnode( "regroup_russian_friendly_wave_up", "targetname" );
    var_1 maps\_anim::_id_124C( self, var_0 );
    thread _id_707A();
    var_1 maps\_anim::_id_1246( self, var_0 );
    maps\_utility::_id_1902();
    maps\_utility::_id_2686();
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );

    if ( isdefined( self ) )
        thread maps\_utility::_id_2756( [ self ], 256 );
}

_id_707A()
{
    var_0 = getent( "regroup_intro_friendlies_move_up_color", "targetname" );
    var_0 notify( "trigger" );
}

_id_707B()
{
    maps\_utility::_id_27CA( "mg_gunner", ::_id_5319 );
    var_0 = getent( "regroup_rpg_target", "targetname" );
    var_1 = getent( "regroup_rpg_rooftop_spawner", "script_noteworthy" );
    var_1 maps\_utility::add_spawn_function( ::_id_70B9, var_0 );
}

_id_707C()
{
    createthreatbiasgroup( "player_group" );
    createthreatbiasgroup( "regroup_rural_helicopter_enemies" );
    level.player setthreatbiasgroup( "player_group" );
    level._id_4877 setthreatbiasgroup( "player_group" );
    level._id_64A5 setthreatbiasgroup( "player_group" );
    setignoremegroup( "player_group", "regroup_rural_helicopter_enemies" );
}

_id_707D()
{
    self endon( "death" );
    self.grenadeammo = 0;
    self setthreatbiasgroup( "regroup_rural_helicopter_enemies" );
    level waittill( "regroup_rural_helicopter_player_attacked" );
    self setthreatbiasgroup();
}

_id_707E()
{
    self endon( "death" );
    level endon( "regroup_rural_helicopter_player_attacked" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.player )
            level notify( "regroup_rural_helicopter_player_attacked" );
    }
}

_id_707F()
{
    maps\_utility::_id_27CA( "regroup_intro_enemy_initial_fighter", ::_id_7080 );
    common_scripts\utility::flag_wait( "regroup_intro_enemies_start" );
    maps\_utility::_id_272C( "regroup_intro_enemy_initial_fighter" );
    common_scripts\utility::flag_wait( "regroup_casual_killers_dead" );
    common_scripts\utility::flag_set( "regroup_car_start" );
    var_0 = getent( "regroup_spawners0_trigger", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );

    var_0 = getent( "trigger_price_cover_slide", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );
}

_id_7080()
{
    self endon( "death" );
    maps\_casual_killer::_id_6F55();
    self._id_10F7 = 1.5;
    self._id_1382 = 1;
    var_0 = getent( "regroup_casual_killer_target", "targetname" );
    self setentitytarget( var_0 );
    level maps\_utility::_id_09C9( maps\_utility::_id_09CA, "regroup_causal_killer_clear_target" );
    maps\_utility::_id_09C9( maps\_utility::_id_09CA, "damage" );
    maps\_utility::_id_09CB();
    self._id_1382 = undefined;
    self._id_10F7 = 1;
    self clearentitytarget();
    maps\_casual_killer::_id_6F58();
}

_id_7082( var_0 )
{
    maps\_utility::_id_260D();
    thread _id_7037();
    self waittill( "death" );
    level._id_7083++;

    if ( level._id_7083 >= var_0 )
        common_scripts\utility::flag_set( "regroup_intro_enemies_initial_retreat" );
}

_id_7084()
{

}

_id_7085()
{
    maps\_utility::_id_27CB( "regroup_drone_anim_then_delete", ::_id_7152 );
    maps\_utility::_id_27CA( "regroup_filler_drones", ::_id_7154 );
    maps\_utility::_id_27CA( "regroup_filler_drones2", ::_id_7154 );
    maps\_utility::_id_27CA( "regroup_filler_drones3", ::_id_7154 );
    maps\_utility::_id_27CB( "regroup_drone_anim_then_idle", ::_id_7155, "regroup_wounded_spawner_cleanup2" );
    maps\_utility::_id_27CB( "regroup_drone_anim_then_die", ::_id_7156, "maars_control_player_controlling_maars" );
    common_scripts\utility::array_thread( getentarray( "regroup_wounded_spawner_trigger", "targetname" ), ::_id_7157, "regroup_wounded_spawner_cleanup" );
    common_scripts\utility::array_thread( getentarray( "regroup_wounded_spawner_trigger2", "targetname" ), ::_id_7157, "regroup_wounded_spawner_cleanup2" );
    thread _id_7086();
    thread _id_7089();
    thread _id_7087();
}

_id_7086()
{
    common_scripts\utility::flag_wait( "regroup_drone_looping_runners" );
    var_0 = maps\_utility::_id_272C( "regroup_filler_drones" );
    maps\_audio::aud_send_msg( "start_civ_runners_wave1a", var_0 );
    wait 5;
    var_1 = maps\_utility::_id_272C( "regroup_filler_drones2" );
    maps\_audio::aud_send_msg( "start_civ_runners_wave1b", var_1 );
    wait 5;
    var_2 = maps\_utility::_id_272C( "regroup_filler_drones3" );
    maps\_audio::aud_send_msg( "start_civ_runners_wave1b", var_2 );
}

_id_7087()
{
    var_0 = 0;

    for (;;)
    {
        var_1 = 0;

        while ( common_scripts\utility::flag( "regroup_drone_door_peek_looking" ) )
        {
            if ( var_1 > 20 || common_scripts\utility::flag( "regroup_start_civilian_run" ) )
            {
                maps\_utility::_id_272C( "regroup_drone_door_peek", 1 );
                var_0 = 1;
                break;
            }

            var_1++;
            wait 0.1;
        }

        if ( var_0 == 1 )
            break;

        wait 0.05;
    }
}

_id_7088()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self waittill( "goal" );
    self delete();
}

_id_7089()
{
    maps\_utility::_id_27CA( "regroup_filler_drones_real", ::_id_7150, "regroup_delete_runners" );
    maps\_utility::_id_27CA( "regroup_drone_runner", ::_id_7150, "regroup_delete_runners" );
    maps\_utility::_id_27CA( "regroup_drone_runner2", ::_id_7150, "regroup_delete_runners" );
    common_scripts\utility::flag_wait( "regroup_start_civilian_run" );
    thread _id_70AE();
    thread _id_708A();
    wait 2;
    thread _id_708C();
    common_scripts\utility::flag_set( "regroup_helicopters_start" );
}

_id_708A()
{
    common_scripts\utility::flag_set( "regroup_drone_stop_loopers" );
}

_id_708B()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

_id_708C()
{
    var_0 = common_scripts\utility::getstructarray( "regroup_civilian_magic_bullet_org", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "regroup_civilian_magic_bullet_target", "targetname" );
    var_2 = getent( "regroup_civilian_volume", "targetname" );
    var_3 = gettime() + 5000;

    while ( gettime() < var_3 )
    {
        foreach ( var_5 in var_0 )
        {
            var_6 = common_scripts\utility::random( var_1 );

            for ( var_7 = 0; var_7 < 3; var_7++ )
                magicbullet( "dshk_turret_sp", var_5.origin, var_6.origin );

            wait(randomfloatrange( 0, 0.2 ));
        }

        wait(randomfloatrange( 0.05, 0.5 ));
    }
}

_id_708D()
{
    maps\_utility::_id_27CA( "regroup_civilian2", ::_id_708F );
    maps\_utility::_id_27CA( "regroup_civilian2", ::_id_708E );
    common_scripts\utility::flag_wait( "regroup_civilian2_start" );
    maps\_utility::_id_272C( "regroup_civilian2" );
    common_scripts\utility::flag_wait( "regroup_civilian2_stop" );
    level notify( "regroup_civ2_stop_respawn" );
}

_id_708E()
{
    level endon( "regroup_civ2_stop_respawn" );
    self endon( "goal" );
    self waittill( "death" );
    thread _id_7090();
}

_id_708F()
{
    level endon( "regroup_civ2_stop_respawn" );
    self endon( "death" );
    self waittill( "goal" );
    thread _id_7090();

    if ( isdefined( self ) )
        self delete();
}

_id_7090()
{
    level endon( "regroup_civ2_stop_respawn" );
    var_0 = getentarray( "regroup_civilian2", "targetname" );
    var_1 = common_scripts\utility::random( var_0 );
    wait(randomfloatrange( 0.5, 10 ));
    var_1.count = 1;
    var_1 maps\_utility::_id_166F();
}

_id_7091()
{
    common_scripts\utility::flag_wait( "regroup_helicopters_start" );
    common_scripts\utility::flag_wait( "regroup_mi17_1_start" );
    var_0 = getent( "regroup_mi17_1", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "regroup_mi17_1", var_1 );
    var_1 maps\_vehicle::_id_2A12();
    var_1 thread _id_70A3();
    var_1 thread _id_70A2();
    var_1 thread _id_70A1();
    var_1 thread _id_714B();
    thread maps\intro_fx::_id_6ED6();
    common_scripts\utility::flag_wait( "regroup_mi17_unloaded" );
}

_id_7092()
{
    maps\_utility::_id_27CB( "regroup_ending_mg_turret", ::_id_5319, "regroup_ending_player_looking_past_gate", 1 );
    maps\_utility::_id_27CA( "regroup_spawners13", ::_id_7037 );
    thread _id_709D();
    thread _id_709C();
    thread _id_7095();
    thread _id_7094();
    thread _id_7093();
    common_scripts\utility::flag_wait( "regroup_player_at_gate" );
    common_scripts\utility::flag_set( "regroup_ending_shoot_at_player" );
}

_id_7093()
{
    common_scripts\utility::array_thread( getentarray( "regroup_wounded_spawner_trigger3", "targetname" ), ::_id_7157, "maars_control_player_controlling_maars" );
    common_scripts\utility::flag_wait( "regroup_ending_breaching" );
    wait 0.5;
    maps\_utility::_id_272C( "regroup_ending_close_garage" );
}

_id_7094()
{
    common_scripts\utility::flag_wait( "regroup_ending_start" );
    var_0 = getentarray( "regroup_intro_friendlies_init_extra", "script_noteworthy" );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !isspawner( var_2 ) )
            {
                var_2 notify( "_disable_reinforcement" );
                thread maps\_utility::_id_2756( [ var_2 ], 256 );
            }
        }
    }

    var_4 = maps\_utility::_id_272D( "breachers" );
    common_scripts\utility::array_thread( var_4, maps\_utility::_id_2611 );
    var_4[0]._id_1032 = "left_guy";
    var_4[0]._id_4B64 = 1;
    var_4[1]._id_1032 = "right_guy";
    var_4[1]._id_4B64 = 1;
    common_scripts\utility::flag_wait( "regroup_ending_ugv_dialog_end" );
    var_4[0] _id_460E();
    var_4[1] _id_460E();
    thread _id_7096( var_4 );
    thread _id_7098( var_4 );
    wait 2;
}

_id_7095()
{
    common_scripts\utility::flag_wait( "regroup_player_at_gate" );
    var_0 = getent( "regroup_ending_price_arrived", "targetname" );

    for ( var_1 = 0; !level._id_4877 istouching( var_0 ); var_1++ )
    {
        if ( var_1 > 50 )
            break;

        wait 0.1;
    }

    common_scripts\utility::flag_set( "regroup_ending_ugv_dialog_start" );
    common_scripts\utility::flag_wait( "regroup_ending_ugv_dialog_end" );
    common_scripts\utility::flag_set( "regroup_ending_follow_price" );
    level._id_4877 _id_460E();
    var_2 = getent( "regroup_friendly_color_heli_retreat", "targetname" );
    var_2 notify( "trigger" );
    common_scripts\utility::flag_wait( "regroup_ending_first_door_breached" );
    var_2 = getent( "regroup_ending_building_price_after_door", "targetname" );
    var_2 notify( "trigger" );
    common_scripts\utility::flag_wait( "regroup_ending_shotgun_breach_complete" );
    var_2 = getent( "regroup_ending_price_after_shotgun_breach", "targetname" );
    var_2 notify( "trigger" );
    level._id_4877 _id_460C();
}

_id_7096( var_0 )
{
    common_scripts\utility::flag_wait( "regroup_player_at_gate" );
    var_1 = common_scripts\utility::getstruct( "regroup_ending_door_kick_breach", "targetname" );
    var_1 maps\_anim::_id_1249( var_0[0], "breach_kick_stackL1_idle", "breach_kick_stackL1_idle", "end_idle" );
    common_scripts\utility::flag_wait( "regroup_ending_ugv_dialog_end" );
    _id_70BA( var_0 );
    var_1 maps\_anim::_id_124A( var_0[1], "breach_kick" );
    common_scripts\utility::flag_set( "regroup_ending_breaching" );
    thread maps\intro_fx::_id_6EE0();
    var_1 notify( "end_idle" );
    waittillframeend;
    maps\_utility::delaythread( 0.5, ::_id_7097, "regroup_ending_building_door" );
    maps\_audio::aud_send_msg( "mus_civilian_door_breach" );
    maps\_audio::aud_send_msg( "aud_civilian_door_breach" );
    var_1 maps\_anim::_id_11DD( var_0, "breach_kick" );
    common_scripts\utility::flag_set( "regroup_ending_first_door_breached" );
}

_id_7097( var_0 )
{
    thread _id_70BC( 1 );
    setsaveddvar( "sm_spotlimit", 2 );
    var_1 = getent( var_0, "targetname" );
    var_1 rotateto( var_1.angles + ( 0.0, 110.0, 0.0 ), 0.5, 0, 0 );
    var_1 connectpaths();
}

_id_7098( var_0 )
{
    var_1 = maps\_utility::_id_1287( "door" );
    var_2 = getent( "shotgun_breach_door", "targetname" );
    var_2 maps\_anim::_id_11CF( var_1, "door_breach" );
    common_scripts\utility::flag_wait( "regroup_ending_first_door_breached" );
    var_3 = getent( "shotgun_breach", "targetname" );
    var_3 maps\_anim::_id_11FE( var_0, "door_breach_setup", "door_breach_setup_idle", "stop_door_breach_idle" );
    var_3 notify( "stop_door_breach_idle" );
    var_3 maps\_anim::_id_11DD( var_0, "door_breach_setup" );
    var_3 thread maps\_anim::_id_11D6( var_0, "door_breach_idle", "stop_loop" );
    _id_70BA( var_0 );
    var_3 notify( "stop_loop" );
    common_scripts\utility::flag_set( "regroup_ending_shotgun_breach_dialog" );
    var_3 thread maps\_anim::_id_11DD( var_0, "door_breach" );
    thread maps\intro_fx::_id_6EE1();
    wait 1.8;
    var_2 thread maps\_anim::_id_1246( var_1, "door_breach" );
    var_4 = getent( "shotgun_breach_door_col", "targetname" );
    var_4 connectpaths();
    var_4 delete();
    var_1 playsound( "wood_door_kick" );
    maps\_utility::delaythread( 0.5, common_scripts\utility::flag_set, "regroup_ending_shotgun_breach_complete" );
    var_0[0] thread _id_7099( "shotgun_breach_guy_right_target" );
    var_0[1] thread _id_7099( "shotgun_breach_guy_left_target" );
}

_id_7099( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    self setgoalnode( var_1 );
    waittillframeend;
    self.goalradius = 10;
    self waittill( "goal" );
}

_id_709A()
{

}

_id_709B()
{
    var_0 = getent( "regroup_ending_building_door", "targetname" );
    var_0 rotateto( var_0.angles + ( 0.0, 90.0, 0.0 ), 0.3, 0.1, 0 );
    var_0 connectpaths();
}

_id_709C()
{
    common_scripts\utility::flag_wait( "regroup_ending_helicopter_last_street" );
    var_0 = maps\_vehicle::_id_2881( "regroup_mi28_6" );
    maps\_audio::aud_send_msg( "worlds_slowest_helicopter_by", var_0 );
    var_0 setmaxpitchroll( 20, 15 );
    var_0 thread _id_714B();
}

_id_709D()
{
    common_scripts\utility::flag_wait( "regroup_ending_start" );
    var_0 = getent( "regroup_mi28_5", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1 setmaxpitchroll( 20, 15 );
    maps\_audio::aud_send_msg( "regroup_ending_start", var_1 );
    var_1 maps\_vehicle::_id_2A12();
    var_1 thread _id_714B();
    level notify( "regroup_mi28_5_spawned", var_1 );
    common_scripts\utility::flag_wait( "regroup_mi28_5_inposition" );
    wait 1;
    thread _id_709F();
    var_2 = common_scripts\utility::getstruct( "regroup_mi28_5_target", "targetname" );
    var_1 _id_704B( var_2, 50, 0.05 );
    var_3 = getent( "regroup_ending_target_vol", "targetname" );
    var_4 = getentarray( "regroup_ending_player_safe_vol", "targetname" );

    while ( !common_scripts\utility::flag( "maars_control_player_controlling_maars" ) )
    {
        var_5 = var_3 maps\_utility::_id_2789( "allies" );

        if ( !_id_4BEF( var_4 ) && common_scripts\utility::flag( "regroup_ending_shoot_at_player" ) )
        {
            if ( !isdefined( level._id_5317 ) )
                _id_714C();

            var_1 _id_704B( level._id_5317, 5, 0.1 );
        }
        else if ( isdefined( var_5 ) && !_id_4BEF( var_4 ) )
        {
            var_6 = common_scripts\utility::random( var_5 );

            if ( isalive( var_6 ) )
                var_1 _id_704B( var_6, 10, 0.1 );
        }

        wait(randomintrange( 2, 5 ));
    }

    var_1 delete();
}

_id_709E()
{
    self endon( "death" );
    level waittill( "regroup_mi28_5_spawned", var_0 );
    common_scripts\utility::flag_wait( "regroup_mi28_5_insight" );
    self setentitytarget( var_0 );
}

_id_709F()
{
    level endon( "maars_control_player_controlling_maars" );

    if ( !_id_4BEF( getentarray( "regroup_ending_player_in_area", "targetname" ) ) )
        _id_70FF();
    else
    {
        common_scripts\utility::flag_wait( "regroup_ending_player_kill" );
        _id_70FF();
    }
}

_id_70A0()
{
    self endon( "death" );
    self waittill( "missile_hit" );
    self notify( "death" );
}

_id_70A1()
{
    common_scripts\utility::flag_wait( "regroup_mi17_delete_riders" );
    var_0 = getentarray( "regroup_mi17_enemy", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( !isspawner( var_2 ) )
            maps\_utility::_id_2756( [ var_2 ], 512 );
    }
}

_id_70A2()
{
    self endon( "death" );
    level endon( "regroup_mi17_delete_riders" );

    while ( self._id_0A39.size > 1 )
        wait 0.05;

    common_scripts\utility::flag_set( "regroup_mi17_unloaded" );
}

_id_70A3()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "regroup_mi17_unloaded" );
}

_id_70A4()
{
    common_scripts\utility::flag_wait( "regroup_dialog_intro_start" );
    var_0 = getent( "regroup_uav_gate_fly_by", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    common_scripts\utility::flag_wait( "regroup_uav_gate_fly_by_fire" );
    var_2 = common_scripts\utility::getstruct( "regroup_uav_gate_fly_by_target", "targetname" );
    var_1 thread _id_7103( var_2, 2, 2, "viper_tow_intro" );
}

_id_70A5()
{
    playfx( common_scripts\utility::getfx( "slamraam_explosion" ), self.origin );
    earthquake( 0.8, 3, self.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    playfx( common_scripts\utility::getfx( "smoke_large" ), self.origin );
}

_id_70A6()
{
    var_0 = getent( "regroup_trigger_garage_door", "targetname" );
    var_0 thread _id_584E();
}

_id_584E()
{
    self waittill( "trigger" );
    var_0 = getentarray( self.target, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            continue;

        var_2 thread _id_57A1();
        common_scripts\utility::flag_set( "regroup_roll_up_dialog" );
        thread maps\intro_fx::_id_6ED5();
    }
}

_id_57A1()
{
    if ( isdefined( self._id_584F ) )
        return;

    self._id_584F = 1;
    var_0 = 104;
    var_1 = self.origin[2] + var_0;
    var_2 = getentarray( self.target, "targetname" );
    var_3 = [];
    var_4 = undefined;

    foreach ( var_6 in var_2 )
    {
        if ( isspawner( var_6 ) )
        {
            var_3[var_3.size] = var_6;
            continue;
        }

        var_6 linkto( self );
        var_6 thread _id_5850( var_1 );
    }

    if ( var_3.size > 0 )
        common_scripts\utility::array_thread( var_3, maps\_utility::_id_166F );

    var_8 = 48;
    var_9 = 1.5;
    var_10 = var_0 / var_9;
    var_9 = var_8 / var_10;
    thread maps\_utility::play_sound_on_entity( "door_garage_metal_rolling_up" );
    self movez( var_8, var_9, var_9 * 0.8 );
    wait(var_9 - 0.05);
    self connectpaths();
    var_0 -= var_8;
    var_9 = var_0 / var_10;
    self movez( var_0, var_9 );
}

_id_5850( var_0 )
{
    while ( self.origin[2] < var_0 )
        wait 0.05;

    self delete();
}

_id_70A7()
{
    var_0 = getent( "regroup_street_uav_player_lookat", "targetname" );
    var_0 maps\_utility::_id_09C9( maps\_utility::_id_2750, 0.5, 0.98 );
    var_0 maps\_utility::_id_09CB();
    common_scripts\utility::flag_set( "regroup_uav_street_start" );
    var_1 = getent( "regroup_uav_street", "targetname" );
    var_2 = var_1 maps\_vehicle::_id_1F9E();
    maps\_audio::aud_send_msg( "UAV_street_bombing", var_2 );
    common_scripts\utility::flag_wait( "regroup_uav_street_fire" );
    var_3 = common_scripts\utility::getstruct( "regroup_uav_street_target1", "targetname" );
    var_2 thread _id_7103( var_3, 1, 0, "viper_tow_intro" );
    var_3 = common_scripts\utility::getstruct( "regroup_uav_street_target2", "targetname" );
    var_2 thread _id_7103( var_3, 1, 0, "viper_tow_intro" );
}

_id_70A8()
{
    common_scripts\utility::exploder( 666 );
    earthquake( 0.6, 1.5, self.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    var_0 = getentarray( "regroup_building_destruct_a_damaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();
}

_id_70A9()
{
    playfx( common_scripts\utility::getfx( "slamraam_explosion" ), self.origin );
    earthquake( 0.8, 3, self.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    var_0 = getentarray( "regroup_building_destruct_b_undamaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();

    var_0 = getentarray( "market_building_11_removable", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();

    var_0 = getentarray( "regroup_building_destruct_b_damaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 show();

    playfx( common_scripts\utility::getfx( "smoke_large" ), self.origin );
}

_id_70AA()
{
    playfx( common_scripts\utility::getfx( "slamraam_explosion" ), self.origin );
    earthquake( 0.8, 3, self.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    var_0 = getentarray( "regroup_building_destruct_c_undamaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();

    var_0 = getentarray( "regroup_building_destruct_c_damaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 show();

    playfx( common_scripts\utility::getfx( "smoke_large" ), self.origin );
}

_id_70AB()
{
    playfx( common_scripts\utility::getfx( "slamraam_explosion" ), self.origin );
    earthquake( 0.8, 3, self.origin, 1024 );
    level.player playrumbleonentity( "artillery_rumble" );
    var_0 = getentarray( "regroup_building_destruct_d_undamaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();

    var_0 = getentarray( "market_transition_01_removable", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();

    var_0 = getentarray( "regroup_building_destruct_d_damaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 show();

    playfx( common_scripts\utility::getfx( "smoke_large" ), self.origin );
}

_id_70AC()
{
    var_0 = getentarray( "regroup_building_destruct_a_damaged_state", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_2807();
}

_id_70AD()
{
    common_scripts\utility::flag_wait( "regroup_dialog_intro_start" );
    var_0 = _id_703B( "regroup_mi28_3", 1, 25 );
    var_0 setmaxpitchroll( 25, 25 );
    var_0 thread _id_714B();
    maps\_audio::aud_send_msg( "courtyard_exit_flyby_01", var_0 );
    wait 2;
    var_1 = _id_703B( "regroup_mi28_4", 1, 25 );
    var_1 setmaxpitchroll( 25, 25 );
    var_1 thread _id_714B();
    maps\_audio::aud_send_msg( "courtyard_exit_flyby_02", var_1 );
}

_id_70AE()
{
    maps\_utility::_id_272C( "regroup_filler_drones_real" );
    var_0 = maps\_utility::_id_272C( "regroup_drone_runner" );
    maps\_audio::aud_send_msg( "start_civ_runners_wave_2", var_0 );
    wait 3;
}

_id_70AF()
{
    common_scripts\utility::flag_wait( "regroup_car_start" );
    var_0 = maps\_vehicle::_id_2881( "regroup_civ_car" );
    var_0 thread _id_70B0();
    maps\_audio::aud_send_msg( "intro_civ_car_slide", var_0 );
    thread maps\intro_fx::_id_6EDF( var_0 );
    var_1 = common_scripts\utility::getstruct( "regroup_car_magic_bullet_src", "targetname" );

    while ( !common_scripts\utility::flag( "regroup_car_crashed" ) )
    {
        magicbullet( "dshk_turret_sp", var_1.origin, var_0.origin + ( randomintrange( -32, 32 ), randomintrange( -32, 32 ), randomintrange( 32, 100 ) ) );
        wait(randomfloatrange( 0.05, 0.1 ));
    }
}

_id_70B0()
{
    self waittill( "death" );
    playfx( common_scripts\utility::getfx( "vehicle_explosion" ), self.origin );
    maps\_audio::aud_send_msg( "intro_civ_car_explode", self.origin );
    earthquake( 0.2, 3, self.origin, 256 );
    self radiusdamage( self.origin, 128, 200, 100 );
}

_id_70B1()
{
    common_scripts\utility::flag_wait( "regroup_player_moving_down_alleyway" );
    var_0 = getent( "regroup_price_down_alley", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );
}

_id_70B2()
{
    var_0 = common_scripts\utility::getstruct( "regroup_car_cover_car_anim_pos", "targetname" );
    var_1 = getent( "regroup_car_cover_car", "targetname" );
    var_1._id_1032 = "cover_car";
    var_1 maps\_anim::_id_1244();
    var_0 maps\_anim::_id_11CF( var_1, "car_door_cover" );
    var_2 = getent( "regroup_car_door_cover_door_col", "targetname" );
    var_2 notsolid();
    var_3 = getent( "regroup_car_cover_trigger", "targetname" );
    var_3 waittill( "trigger" );

    while ( !common_scripts\utility::flag( "regroup_car_door_cover_door_open" ) )
    {
        var_4 = _id_70B3();
        _id_70B4( var_4 );
        wait(randomintrange( 3, 5 ));
    }
}

_id_70B3()
{
    var_0 = getent( "regroup_car_door_cover_vol", "targetname" );

    for (;;)
    {
        var_1 = var_0 maps\_utility::_id_2789( "axis" );

        if ( var_1.size > 0 )
            return var_1[0];

        wait 0.05;
    }
}

_id_70B4( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "long_death" );
    var_0._id_1032 = "generic";
    var_1 = common_scripts\utility::getstruct( "regroup_car_cover_car_anim_pos", "targetname" );

    while ( isalive( var_0 ) && !var_0 maps\_utility::_id_0D69() )
    {
        var_1 maps\_anim::_id_124A( var_0, "car_door_cover" );

        if ( var_1 maps\intro_utility::_id_6BA9( var_0, "car_door_cover", undefined, undefined, 32 ) )
            break;

        wait 0.05;
    }

    if ( isalive( var_0 ) && !var_0 maps\_utility::_id_0D69() )
        thread _id_70B5( var_0 );
}

_id_70B5( var_0 )
{
    var_0.allowdeath = 1;
    var_1 = common_scripts\utility::getstruct( "regroup_car_cover_car_anim_pos", "targetname" );
    var_2 = getent( "regroup_car_cover_car", "targetname" );
    var_2._id_1032 = "cover_car";
    var_2 maps\_anim::_id_1244();

    if ( isalive( var_0 ) && !var_0 maps\_utility::_id_0D69() )
    {
        var_1 thread maps\_anim::_id_11DD( [ var_2, var_0 ], "car_door_cover" );
        var_0 thread _id_70B6( var_2 );
        var_2 thread _id_70B7( var_0 );
    }
}

_id_70B6( var_0 )
{
    level endon( "regroup_car_door_cover_door_open" );
    self waittill( "death" );
    var_0 notify( "anim_stopped" );
    var_0 maps\_utility::_id_1414();
}

_id_70B7( var_0 )
{
    self endon( "anim_stopped" );
    wait 1;
    common_scripts\utility::flag_set( "regroup_car_door_cover_door_open" );
    var_1 = getent( "regroup_car_door_cover_node_col", "targetname" );
    var_1 connectpaths();
    var_1 delete();
    var_2 = getent( "regroup_car_door_cover_door_col", "targetname" );
    var_2 solid();

    if ( isalive( var_0 ) )
    {
        var_3 = getnode( "regroup_car_door_cover_node", "targetname" );
        var_0 setgoalnode( var_3 );
        var_0.a._id_0D26 = "crouch";
    }
}

_id_70B8()
{
    var_0 = common_scripts\utility::getstructarray( "regroup_damage_car", "targetname" );

    foreach ( var_2 in var_0 )
    {
        radiusdamage( var_2.origin, 64, 250, 150 );
        wait(randomfloatrange( 0, 2 ));
    }
}

_id_70B9( var_0 )
{
    self endon( "death" );
    self._id_4B64 = 1;
    _id_460E();
    thread maps\_utility::_id_2611();
    self._id_4625 = self.weapon;
    maps\_utility::_id_104A( "rpg", "primary" );
    self waittill( "goal" );
    maps\_utility::_id_26F3( 1 );
    self setstablemissile( 1 );
    self setentitytarget( var_0 );
    var_1 = missile_createattractororigin( var_0.origin, 5000, 5000 );
    self.maxsightdistsqrd = 67108864;
    wait 0.1;
    self shoot( 1, var_0.origin );
    thread maps\_utility::_id_1902();
    wait 2;
    _id_460C();
    self clearentitytarget();
    maps\_utility::_id_104A( self._id_4625, "primary" );
    self._id_1382 = 0;
}

_id_70BA( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::_id_09C9( maps\_utility::_id_2750, 0.3 );

    maps\_utility::_id_09CB();
}

_id_70BB()
{
    var_0 = getentarray( "india_hillside_trees_hide", "targetname" );
    common_scripts\utility::array_call( var_0, ::hide );
    common_scripts\utility::flag_wait( "india_hillside_trees_show" );
    common_scripts\utility::array_call( var_0, ::show );
}

_id_70BC( var_0 )
{
    var_1 = getentarray( "india_hillside_mountian_hide", "targetname" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::array_call( var_1, ::show );
    else
        common_scripts\utility::array_call( var_1, ::hide );
}

_id_70BD()
{
    _id_70C0();
}

_id_70BE()
{
    self rotateto( self.angles + ( 0.0, 20.0, 0.0 ), 0.75, 0.5, 0 );
    wait 0.75;
    self rotateto( self.angles + ( 0.0, 70.0, 0.0 ), 1, 0, 0.75 );
    self connectpaths();
}

_id_70BF()
{
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    self.angles -= ( 0.0, 90.0, 0.0 );
    self disconnectpaths();
}

_id_70C0()
{
    var_0 = getent( "maars_control_door", "targetname" );
    var_0 thread _id_70BF();
    var_1 = common_scripts\utility::getstruct( "maars_control_maars_intro", "targetname" );
    _id_70C4();
    var_2 = maps\_utility::_id_1287( "trap_door", ( 0.0, 0.0, 0.0 ) );
    var_3 = maps\_utility::_id_1287( "crate_door", ( 0.0, 0.0, 0.0 ) );
    var_4 = maps\_utility::_id_1287( "rolling_door", ( 0.0, 0.0, 0.0 ) );
    var_1 maps\_anim::_id_11CF( var_2, "intro_weapon_cache_start" );
    var_1 maps\_anim::_id_11CF( var_3, "intro_weapon_cache_pullout" );
    var_1 maps\_anim::_id_11CF( var_4, "intro_weapon_cache_end" );
    var_5 = getent( "maars_control_idle_door_trigger", "targetname" );
    var_5 waittill( "trigger" );
    level._id_4877 maps\_utility::_id_123B();
    level._id_4877 pushplayer( 1 );
    var_1 maps\_anim::_id_124A( level._id_4877, "intro_weapon_cache_upto_shed" );
    common_scripts\utility::flag_set( "maars_shed_price_at_door" );
    var_1 maps\_anim::_id_1246( level._id_4877, "intro_weapon_cache_upto_shed" );
    var_1 thread maps\_anim::_id_124E( level._id_4877, "intro_weapon_cache_upto_shed_idle", "end_idle" );
    common_scripts\utility::flag_wait( "maars_control_open_door_trigger" );
    var_1 notify( "end_idle" );
    common_scripts\utility::flag_set( "maars_control_start_intro" );
    common_scripts\utility::flag_set( "maars_control_reinforcements" );
    level._id_5386 = maps\_utility::_id_1287( "flashlight", ( 0.0, 0.0, 0.0 ) );
    var_6 = maps\_utility::_id_1287( "crowbar", ( 0.0, 0.0, 0.0 ) );
    var_7 = [];
    var_7[0] = [ level._id_4877, 0 ];
    var_7[1] = [ level._id_5386, 0 ];
    var_7[2] = [ var_2, 0 ];
    thread _id_70C3();
    var_0 maps\_utility::delaythread( 0.5, ::_id_70BE );
    var_1 maps\_shg_common::_id_16EB( var_7, "intro_weapon_cache_start" );
    var_8 = maps\_utility::_id_2766( level._id_4877, level._id_5386 );
    var_1 thread maps\_anim::_id_11D6( var_8, "intro_weapon_cache_stairs_idle", "end_idle" );
    common_scripts\utility::flag_wait( "maars_control_player_down_stairs" );
    _id_7147( "ugv_startup" );
    var_1 notify( "end_idle" );
    var_7 = [];
    var_7[0] = [ level._id_4877, 0 ];
    var_7[1] = [ var_6, 0 ];
    var_7[2] = [ var_3, 0 ];
    var_7[3] = [ level._id_70C1, 0 ];
    var_7[4] = [ level._id_5386, 0 ];
    maps\_utility::delaythread( 12, common_scripts\utility::flag_set, "maars_control_dialog_ugv_intro" );
    maps\_utility::delaythread( 10, ::_id_70C2 );
    level._id_4877 thread maps\_shg_common::_id_16E9( "intro_weapon_cache_pullout_face" );
    var_1 maps\_shg_common::_id_16EB( var_7, "intro_weapon_cache_pullout" );
    common_scripts\utility::flag_set( "player_to_maars_control" );
    var_8 = maps\_utility::_id_2766( level._id_4877, level._id_5386 );
    var_1 thread maps\_anim::_id_11D6( var_8, "intro_weapon_cache_idle", "end_idle" );
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    thread _id_70EE();
    common_scripts\utility::flag_wait( "maars_control_boot_up_fading" );
    var_1 notify( "end_idle" );
    maps\_audio::aud_send_msg( "maars_garage_door_opening" );
    maps\_utility::delaythread( 4, ::_id_70CB );
    var_9 = maps\_utility::_id_2766( level._id_4877, level._id_5386, var_4 );
    var_1 maps\_anim::_id_11DD( var_9, "intro_weapon_cache_end" );
    level._id_5386 delete();
    var_6 delete();
    var_1 thread maps\_anim::_id_124E( level._id_4877, "intro_weapon_cache_end_idle", "end_idle" );
    common_scripts\utility::flag_wait( "maars_control_player_out_of_weapons_cache" );
    var_1 notify( "end_idle" );
    level._id_4877 maps\_utility::_id_2686();
    level._id_4877 pushplayer( 0 );
    level._id_4877 maps\_utility::_id_109E();
    level._id_4877 _id_7037();
    var_5 = getent( "maars_control_price_color", "targetname" );
    var_5 notify( "trigger" );
}

_id_70C2()
{
    var_0 = 1;
    var_1 = getent( "maars_control_box_player_clip", "targetname" );
    var_2 = common_scripts\utility::getstruct( "maars_control_maars_pullout_collision", "targetname" );
    var_1 moveto( var_2.origin, var_0, 0, 0 );
}

_id_70C3()
{
    wait 2;
    var_0 = 4;
    var_1 = getent( "maars_control_trap_door_col", "targetname" );
    var_2 = common_scripts\utility::getstruct( "maars_control_player_clip_moveto", "targetname" );
    var_1 moveto( var_2.origin, var_0, 0, 0 );
    wait(var_0 + 7);
    var_1 delete();
}

_id_70C4()
{
    level._id_6F6B = maps\_vehicle::_id_2A99( "player_ugv_robot" );
    waittillframeend;
    level._id_6F6B maps\intro_maars::_id_6F64();
    level._id_70C1 = maps\_utility::_id_1287( "ugv_model", ( 0.0, 0.0, 0.0 ) );
    level._id_70C1._id_1032 = "ugv_model";
    level._id_70C1.origin = level._id_6F6B.origin;
    level._id_70C1.angles = level._id_6F6B.angles;
}

_id_70C5()
{
    common_scripts\utility::flag_wait( "player_to_maars_control" );
    common_scripts\utility::flag_set( "obj_control_ugv" );
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    maps\_audio::aud_send_msg( "player_maars_interact_start" );
    common_scripts\utility::flag_set( "obj_clear_helicopter_area" );
}

_id_70C6()
{
    var_0 = common_scripts\utility::getstruct( "maars_control_mount_zoom_to", "targetname" );
    common_scripts\utility::flag_wait( "player_to_maars_control" );
    level._id_6F6B thread _id_70CC( var_0 );
    level._id_6F6B makeunusable();
    _id_70C7();
    level.player enableinvulnerability();
    maps\_audio::aud_send_msg( "maars_computer_boot_up" );
    thread _id_70BC();
    setsaveddvar( "sm_spotlightscoremodelscale", "1" );
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingame( "ugv_startup" );
    common_scripts\utility::flag_set( "maars_control_player_controlling_maars" );
    common_scripts\utility::flag_set( "maars_fail_on_death" );
    var_1 = getent( "maars_control_box_clip", "targetname" );
    var_1 delete();
    var_2 = getent( "maars_control_box_player_clip", "targetname" );
    var_2 delete();
    thread maps\_utility::vision_set_fog_changes( "intro_maars_control", 2 );
    level._id_6F6B maps\intro_maars::_id_6F65( level._id_70C1, var_0 );
    level.player disableinvulnerability();
    maps\_utility::_id_25F3( "maars_control" );
}

_id_70C7()
{
    var_0 = getent( "trigger_use_maars", "targetname" );
    var_0 sethintstring( &"INTRO_USE_UGV" );
    var_0 usetriggerrequirelookat();
    var_0 thread _id_70C8( "enable_mount_maars_trigger" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::trigger_off();
}

_id_70C8( var_0 )
{
    self endon( "trigger" );

    for (;;)
    {
        common_scripts\utility::trigger_off();
        common_scripts\utility::flag_wait( var_0 );
        common_scripts\utility::trigger_on();
        common_scripts\utility::flag_waitopen( var_0 );
    }
}

_id_70C9()
{
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
}

_id_70CA()
{
    var_0 = getent( "maars_control_trap_door_col", "targetname" );
    var_0 delete();
}

_id_70CB()
{
    var_0 = getent( "maars_garage_door_col", "targetname" );
    maps\_audio::aud_send_msg( "maars_control_door_open", var_0 );
    var_0 connectpaths();
    var_0 delete();
    common_scripts\utility::flag_set( "maars_control_door_open" );
}

_id_70CC( var_0 )
{
    common_scripts\utility::flag_wait( "maars_control_uav_complete" );
    thread maps\intro_maars::_id_6F6E( level._id_70C1, var_0 );
}

_id_70CD()
{
    thread _id_70DB();
    thread _id_70D8();
    level._id_70CE = [];
    level._id_70CF = 0;
    level._id_70D0 = 0;
    level._id_70D1 = 0;
    level._id_70D2 = 15;
    maps\_utility::_id_27CA( "maars_control_friendly_drone", ::_id_70DA );
    maps\_utility::_id_27CA( "maars_control_friendly_target", ::_id_70D9 );
    maps\_utility::_id_27CA( "maars_control_initial_mg_turret", ::_id_714D, "maars_control_player_attacked_runner", "maars_control_mg_gunner_initial_detach" );
    maps\_utility::_id_27CA( "maars_control_initial_mg_turret", ::_id_70D4 );
    maps\_utility::_id_27CB( "maars_control_initial_runner", ::_id_70D5 );
    maps\_utility::_id_27CA( "maars_control_mg_gunner", ::_id_714D );
    maps\_utility::_id_27CA( "maars_control_mg_gunner", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_mg_gunner2", ::_id_714D );
    maps\_utility::_id_27CA( "maars_control_mg_gunner2", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn1", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn1", ::_id_70DE );
    maps\_utility::_id_27CA( "maars_control_spawn2_a", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn2", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn3", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn4", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn5", ::_id_70D3 );
    maps\_utility::_id_27CA( "maars_control_spawn5", ::_id_70DC );
    maps\_utility::_id_27CA( "maars_control_mg_gunner2", ::_id_70DC );
    thread _id_70DD();
    common_scripts\utility::flag_wait( "maars_control_door_open" );
    maps\_utility::_id_272C( "maars_control_friendly_target" );
    maps\_utility::_id_272C( "maars_control_friendly_drone", 1 );
    maps\_utility::_id_272C( "maars_control_initial_runner", 1 );
    maps\_utility::_id_272C( "maars_control_initial_mg_turret", 1 );

    for (;;)
    {
        if ( level._id_70CF > 5 )
            break;

        wait 0.1;
    }

    var_0 = getent( "maars_control_spawn1_trigger", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );

    for (;;)
    {
        if ( level._id_70D0 > 5 )
        {
            common_scripts\utility::flag_set( "maars_control_spawn1_retreat" );
            break;
        }

        wait 0.1;
    }

    var_0 = getent( "maars_control_spawn2_trigger", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 notify( "trigger" );
}

_id_70D3()
{
    self endon( "death" );
    thread maps\_utility::_id_260D();
    self._id_100A = 1;
    self.dropweapon = 0;
    self.favoriteenemy = level.player;
    self setthreatbiasgroup( "maars_enemies" );
    self._id_0D45 = ::_id_70DF;
    _id_7037();

    if ( !isdefined( level._id_0058 ) )
        _id_0059();

    self setentitytarget( level._id_0058 );
}

_id_0059()
{
    var_0 = level._id_6F6B.mgturret[0] gettagorigin( "tag_barrel" );
    level._id_0058 = spawn( "script_origin", var_0 + ( 0.0, 0.0, 10.0 ) );
    level._id_0058 linkto( level._id_6F6B.mgturret[0] );
}

_id_70D4()
{
    thread _id_70D6();
    self setthreatbiasgroup( "maars_enemies" );
    self.dropweapon = 0;
    _id_7037();
}

_id_70D5()
{
    self endon( "death" );
    thread _id_70D6();
    thread _id_70D7();
    thread maps\_utility::_id_260D();
    self._id_100A = 1;
    self.dropweapon = 0;
    self.favoriteenemy = level.player;
    self setthreatbiasgroup( "maars_enemies" );
    self._id_0D45 = ::_id_70DF;

    if ( !common_scripts\utility::flag( "maars_control_player_attacked_runner" ) )
    {
        var_0 = getentarray( "maars_control_initial_spawn_target", "targetname" );
        self setentitytarget( common_scripts\utility::random( var_0 ) );
    }

    common_scripts\utility::flag_wait( "maars_control_player_attacked_runner" );
    self clearentitytarget();
    self setentitytarget( level._id_6F6B );
}

_id_70D6()
{
    self waittill( "damage", var_0, var_1 );

    if ( var_1 == level.player )
        common_scripts\utility::flag_set( "maars_control_player_attacked_runner" );
}

_id_70D7()
{
    self waittill( "death" );
    level._id_70CF++;
}

_id_70D8()
{
    common_scripts\utility::flag_wait( "maars_control_player_attacked_runner" );
    level.player setthreatbiasgroup();
}

_id_70D9()
{
    self.grenadeammo = 0;
    thread maps\_utility::_id_0D04();
    common_scripts\utility::flag_wait( "maars_control_player_out_of_weapons_cache" );
    maps\_utility::_id_1902();
}

_id_70DA()
{
    level endon( "maars_control_player_out_of_weapons_cache" );
    var_0 = self.spawner;
    maps\_utility::_id_218C();
    self waittill( "death" );
    var_0 maps\_utility::_id_166F();
}

_id_70DB()
{
    createthreatbiasgroup( "friendly_group" );
    createthreatbiasgroup( "maars_enemies" );
    level._id_4877 setthreatbiasgroup( "friendly_group" );
    level._id_64A5 setthreatbiasgroup( "friendly_group" );
    level.player setthreatbiasgroup( "friendly_group" );
    setignoremegroup( "friendly_group", "maars_enemies" );
}

_id_70DC()
{
    self waittill( "death" );
    level._id_70D1++;
}

_id_70DD()
{
    while ( level._id_70D1 < level._id_70D2 )
        wait 0.1;

    common_scripts\utility::flag_set( "maars_control_end_enemies_dead" );
    wait 15;
    thread maps\_spawner::_id_213C( 205 );
}

_id_70DE()
{
    var_0 = self.spawner;
    self waittill( "death" );
    level._id_70D0++;
}

_id_70DF()
{
    if ( isdefined( self.attacker ) && self.attacker == level.player && self.damagetaken > 150 )
    {
        var_0 = animscripts\death::_id_0ED9();

        if ( isdefined( var_0 ) )
            self._id_0D50 = var_0;
    }

    return 0;
}

_id_70E0()
{
    level endon( "maars_control_smoke_off" );
    common_scripts\utility::flag_wait( "maars_control_smoke_on" );
    var_0 = common_scripts\utility::getstructarray( "magic_smoke_grenade", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2.origin;
        thread maps\intro_fx::_id_6ED8();
        thread common_scripts\utility::play_sound_in_space( "smokegrenade_explode_default", var_3 );
    }
}

_id_70E1()
{
    thread _id_70E2();
    thread _id_70E3();
    var_0 = getent( "maars_control_littlebird", "targetname" );
    var_0 hidepart( "main_rotor_jnt" );
    var_0 hidepart( "tail_rotor_jnt" );
}

_id_70E2()
{
    maps\_utility::_id_27CB( "maars_control_helicopter_enemies", ::_id_70D3 );
    common_scripts\utility::flag_wait( "maars_control_mi17_1" );
    var_0 = getent( "maars_control_mi17_1", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1 thread _id_70E4();
    maps\_audio::aud_send_msg( "maars_transport_chopper", var_1 );
    var_1.script_bulletshield = 0;
    var_1 thread maps\intro_maars::_id_6FB9( "vehicle_mi17_woodland_ugv_hitbox" );
    common_scripts\utility::flag_wait( "maars_control_mi17_1" );
    var_2 = getent( "maars_control_mi17_2", "targetname" );
    var_3 = var_2 maps\_vehicle::_id_1F9E();
    var_3 thread _id_70E4();
    maps\_audio::aud_send_msg( "maars_transport_chopper", var_3 );
    var_3.script_bulletshield = 0;
    var_3 thread maps\intro_maars::_id_6FB9( "vehicle_mi17_woodland_ugv_hitbox" );
}

_id_70E3()
{
    var_0 = getent( "maars_control_mi28_4", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    var_1 thread _id_70E4();
    maps\_audio::aud_send_msg( "maars_attack_chopper", var_1 );
    var_1 thread maps\intro_maars::_id_6FB9( "vehicle_mi-28_ugv_hitbox" );
    var_1 thread _id_70E7();
    var_1 thread _id_70E8();
    var_1 thread _id_70E9();
    var_1 setmaxpitchroll( 5, 20 );
    common_scripts\utility::flag_wait( "maars_control_mi28_1" );
    var_2 = getent( "maars_control_mi28_1", "targetname" );
    var_3 = var_2 maps\_vehicle::_id_1F9E();
    var_3 thread _id_70E4();
    maps\_audio::aud_send_msg( "maars_attack_chopper", var_3 );
    var_3 thread maps\intro_maars::_id_6FB9( "vehicle_mi-28_ugv_hitbox" );
    var_3 thread _id_70EA();
    var_3 setmaxpitchroll( 15, 20 );
    common_scripts\utility::flag_wait( "maars_control_mi28_3" );
    wait 5;
    var_2 = getent( "maars_control_mi28_3", "targetname" );
    var_4 = var_2 maps\_vehicle::_id_1F9E();
    var_4 thread _id_70E4();
    maps\_audio::aud_send_msg( "maars_attack_chopper", var_4 );
    var_4 thread maps\intro_maars::_id_6FB9( "vehicle_mi-28_ugv_hitbox" );
    var_4 thread _id_70EB();
    var_4 setmaxpitchroll( 15, 20 );
}

_id_70E4()
{
    var_0 = _id_70E6();

    if ( isdefined( var_0 ) && var_0 )
        return;

    if ( !isdefined( level._id_70E5 ) )
        level._id_70E5 = 0;

    level._id_70E5++;

    if ( level._id_70E5 == 5 )
        level.player thread maps\_utility::_id_1E39( "WHAT_GOES_UP" );
}

_id_70E6()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_1 ) && var_1 == level.player )
        {
            if ( !isdefined( var_9 ) || !issubstr( var_9, "m203" ) )
                return 1;
        }
    }
}

_id_70E7()
{
    self endon( "death" );
    var_0 = common_scripts\utility::getstruct( "maars_control_mi28_4_target", "targetname" );

    while ( !common_scripts\utility::flag( "maars_control_player_attacked_runner" ) )
    {
        _id_704B( var_0, 50, 0.05 );
        wait(randomintrange( 2, 5 ));
    }

    wait 3;

    if ( !isdefined( level._id_5317 ) )
        _id_714C();

    while ( !common_scripts\utility::flag( "maars_control_mi28_4_detour" ) )
    {
        _id_704B( level._id_5317, randomintrange( 20, 50 ), 0.05 );
        wait(randomintrange( 2, 5 ));
    }

    common_scripts\utility::flag_wait( "maars_control_mi28_4_clear_to_crash" );
    self._id_2940 = "helicopter";
    common_scripts\utility::flag_wait( "maars_control_mi28_4_detour_complete" );

    for (;;)
    {
        _id_704B( level._id_5317, randomintrange( 50, 75 ), 0.05 );
        wait(randomintrange( 1, 2 ));
    }
}

_id_70E8()
{
    self waittill( "death" );

    if ( common_scripts\utility::flag( "maars_control_mi28_4_clear_to_crash" ) )
        return;

    self._id_256C = 1;
    self notify( "newpath" );
    var_0 = common_scripts\utility::getstruct( "maars_control_mi28_4_death_go_to", "targetname" );
    var_1 = 60;
    self vehicle_setspeed( var_1, 15, 10 );
    self setneargoalnotifydist( var_0.radius );
    self setvehgoalpos( var_0.origin, 0 );
    common_scripts\utility::waittill_any( "goal", "near_goal" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self setneargoalnotifydist( var_0.radius );
    self setvehgoalpos( var_0.origin, 0 );
    common_scripts\utility::waittill_any( "goal", "near_goal" );
    self notify( "deathspin" );
    thread maps\_vehicle::_id_29E4();
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self setneargoalnotifydist( var_0.radius );
    self setvehgoalpos( var_0.origin, 0 );
    common_scripts\utility::waittill_any( "goal", "near_goal" );
    self notify( "crash_done" );
    self notify( "stop_crash_loop_sound" );
}

_id_70E9()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "maars_control_mi28_4_detour" );
    var_0 = common_scripts\utility::getstruct( "maars_control_mi28_4_detour", "script_noteworthy" );
    var_0.target = "maars_control_mi28_4_detour_go_to";
}

_id_70EA()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "maars_control_mi28_start_firing" );

    if ( !isdefined( level._id_5317 ) )
        _id_714C();

    self setlookatent( level._id_5317 );

    for (;;)
    {
        _id_704B( level._id_5317, 50, 0.05 );
        wait(randomintrange( 2, 5 ));
    }
}

_id_70EB()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "maars_control_mi28_3_fire1" );
    wait 3;

    if ( !isdefined( level._id_5317 ) )
        _id_714C();

    self setlookatent( level._id_5317 );

    for (;;)
    {
        if ( common_scripts\utility::cointoss() )
        {
            _id_704B( level._id_5317, 25, 0.05 );
            wait(randomintrange( 3, 5 ));
            continue;
        }

        thread maps\intro_maars::_id_6FC2();
        wait 0.5;
        _id_28E2( level._id_6F6B, 2, 0.25, "viper_tow_intro" );
        wait(randomintrange( 3, 5 ));
    }
}

_id_70EC()
{
    common_scripts\utility::flag_wait( "maars_control_player_at_helicopter" );
    common_scripts\utility::flag_set( "maars_control_price_at_chopper" );
    common_scripts\utility::flag_wait( "maars_control_soap_at_helicopter" );
    common_scripts\utility::flag_clear( "maars_fail_on_death" );
    thread maps\_spawner::_id_213C( 205 );
    common_scripts\utility::flag_set( "maars_control_uav_start_dialog" );
    common_scripts\utility::flag_wait( "maars_control_drone_inbound" );
    thread maps\intro_maars::_id_6FC2();
    maps\_audio::aud_send_msg( "maars_control_drone_inbound" );
    common_scripts\utility::flag_wait( "maars_control_uav_start" );
    _id_70ED();
    common_scripts\utility::flag_wait( "maars_control_uav_complete" );
    thread _id_70EF();
    common_scripts\utility::flag_set( "obj_clear_helicopter_area_complete" );
}

_id_70ED()
{
    level._id_6F6B notify( "start_ugv_death" );
    thread maps\_utility::vision_set_fog_changes( "intro_shack_yard", 1 );
    var_0 = maps\_utility::_id_1287( "uav", ( 0.0, 0.0, 0.0 ) );
    var_0._id_1032 = "uav";
    var_0 maps\_anim::_id_1244();
    maps\_audio::aud_send_msg( "uav_kill_maars", var_0 );
    maps\_audio::aud_send_msg( "mus_ugv_destroyed" );
    setsaveddvar( "sm_spotlightscoremodelscale", "0" );
    var_1 = _id_7105();
    playfx( level._effect["mortar"]["dirt"], var_1 );
    thread common_scripts\utility::play_sound_in_space( "clusterbomb_explode_default", var_1 );
    level.player playrumbleonentity( "artillery_rumble" );
    level._id_6F6B maps\intro_maars::_id_6F64();
    var_2 = level.player getplayerangles();
    var_3 = maps\_utility::_id_1287( "ugv" );
    var_3.origin = level._id_6F6B.origin;
    var_3.angles = level._id_6F6B.angles;
    var_3.angles = ( var_3.angles[0], var_2[1], var_3.angles[2] );
    var_3 maps\_anim::_id_11CF( var_3, "ugv_death_pos" );
    var_4 = maps\_utility::_id_1287( "ugv_turret", ( 0.0, 0.0, 0.0 ) );
    var_4.origin = var_3 gettagorigin( "tag_gun" );
    var_4.angles = var_3 gettagangles( "tag_gun" );
    var_4 maps\_anim::_id_11CF( var_4, "ugv_death_pos" );
    var_5 = maps\_utility::_id_1287( "ugv_grenade_launcher", ( 0.0, 0.0, 0.0 ) );

    for ( var_6 = 7; var_6 >= level._id_6F6B._id_6F9B; var_6-- )
    {
        var_7 = var_6 + 3;
        var_5 hidepart( "ammo" + var_7 );
    }

    var_8 = var_4 gettagorigin( "tag_player" );
    var_9 = var_4 gettagangles( "tag_player" );
    var_10 = spawnstruct();
    var_10.origin = var_8;
    var_10.angles = var_9;
    level.player disableweapons();
    level._id_6F6B.mgturret[0] setturretdismountorg( var_8 );
    level._id_6F6B maps\intro_maars::_id_6F6F();
    level.player playerlinktodelta( var_4, "tag_player", 1, 0, 0, 0, 0, 1 );
    var_11 = [];
    var_11[0] = var_0;
    var_11[1] = var_3;
    var_11[2] = var_4;
    var_11[3] = var_5;
    var_11 thread maps\intro_fx::_id_6EF9();
    level.player notify( "maars_player_damage_disable" );
    level.player digitaldistortsetparams( 0.76, 1.48 );
    level.player thread maps\intro_maars::_id_0363();
    var_10 maps\_anim::_id_11DD( var_11, "ugv_death" );
    common_scripts\utility::flag_set( "maars_control_uav_complete" );
    var_0 delete();
    level waittill( "dismount_maars" );
    var_3 delete();
    var_4 delete();
    var_5 delete();
}

_id_70EE()
{
    var_0 = getentarray( "regroup_spawners13_drones", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::array_thread( var_0, maps\_utility::_id_2705 );

    maps\_spawner::_id_213C( 13 );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_2705 );
}

_id_70EF()
{
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, maps\_utility::_id_2705 );
}

_id_70F0()
{
    var_0 = getent( "maars_control_traversal_blocker", "targetname" );
    var_0 notsolid();
    var_0 connectpaths();
    common_scripts\utility::flag_wait( "maars_control_player_controlling_maars" );
    var_1 = getnode( "regroup_soap_wounded_put_down7", "targetname" );
    var_2 = common_scripts\utility::getstruct( "maars_control_nikolai_teleport", "targetname" );
    level._id_64A5 maps\intro_carry::_id_6F35( level._id_54E0, var_1, var_2 );
    level._id_6F27 = 1;
    common_scripts\utility::flag_wait( "maars_control_soap_wounded_put_down5" );
    common_scripts\utility::flag_wait( "maars_control_end_enemies_dead" );
    var_0 solid();
    var_0 disconnectpaths();
    level._id_6F27 = undefined;
    level._id_64A5 notify( "stop_carry_by_color" );
    thread _id_7145( "maars_control_soap_wounded_put_down5" );
    thread _id_70F4();
}

_id_70F1()
{
    var_0 = getentarray( "maars_control_retreat", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_70F2 );
}

_id_70F2()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_2 = var_0 maps\_utility::_id_2789( "axis" );
    _id_7140( var_2, var_1 );
}

_id_70F3()
{
    var_0 = getent( "building_slide_player_clip", "targetname" );
    var_0 notsolid();
}

_id_70F4()
{
    common_scripts\utility::flag_wait( "maars_control_loading_helicopter" );
    var_0 = common_scripts\utility::getstruct( "maars_control_load_helicopter", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_4877, "intro_ugv_helicopter" );
    var_0 maps\_anim::_id_1246( level._id_4877, "intro_ugv_helicopter" );
    var_0 maps\_anim::_id_124E( level._id_4877, "intro_ugv_helicopter_idle", "end_idles" );
}

_id_70F5()
{
    common_scripts\utility::flag_wait( "maars_control_hillside_show" );
    thread _id_70BC( 1 );
}

_id_70F6( var_0 )
{
    var_1 = getent( "maars_control_box_clip_top", "targetname" );

    if ( isdefined( var_0 ) )
        var_1 solid();
    else
        var_1 notsolid();
}

_id_70F7()
{
    level.player disableoffhandweapons();
    setsaveddvar( "player_sprintUnlimited", 1 );
    thread _id_70F9();
    wait 1;
    maps\_utility::_id_1425( "maars_control_complete" );
    thread maps\intro_fx::_id_6EEC();
    thread maps\intro_fx::_id_6EE9();
    maps\_audio::aud_send_msg( "mus_run_to_heli" );
}

_id_70F8()
{
    var_0 = getent( "building_slide_player_clip", "targetname" );
    var_0 solid();
}

_id_70F9()
{
    var_0 = undefined;

    if ( level.xenon )
        var_0 = "sprint";
    else
        var_0 = "sprint_pc";

    var_1 = maps\intro_utility::_id_6EBB( var_0 );
    level.player endon( var_1 );
    wait 1;
    thread maps\intro_utility::_id_6EBC( var_0, undefined, 1, var_1 );
}

_id_70FA()
{
    common_scripts\utility::flag_wait( "building_slide_player_starting_run" );
    var_0 = thread _id_70FC();
    thread _id_70FB( var_0 );
    var_1 = var_0;
    var_2 = getent( "building_slide_run_trigger1", "targetname" );
    var_2 _id_70FD( 8, var_1 );
    common_scripts\utility::flag_set( "building_slide_missile1" );
    common_scripts\utility::flag_set( "building_slide_missile2" );
    var_2 = getent( "building_slide_run_trigger2", "targetname" );
    var_2 _id_70FD( 4, var_1 );
    common_scripts\utility::flag_set( "building_slide_missile3" );
    var_2 = getent( "building_slide_run_trigger3", "targetname" );
    var_2 _id_70FD( 4, var_1 );
    common_scripts\utility::flag_set( "building_slide_missile4" );
    var_2 = getent( "building_slide_run_trigger4", "targetname" );
    var_2 _id_70FD( 4, var_1 );
    common_scripts\utility::flag_set( "building_slide_missile5" );
    var_2 = getent( "building_slide_run_trigger5", "targetname" );
    var_2 _id_70FD( 4, var_1 );
    common_scripts\utility::flag_set( "building_slide_missile6" );
    common_scripts\utility::flag_set( "building_slide_missile7" );
    var_2 = getent( "building_slide_run_trigger6", "targetname" );
    var_2 _id_70FD( 4, var_1 );
    common_scripts\utility::flag_set( "building_slide_missile8" );
    var_2 = getent( "building_slide_run_trigger7", "targetname" );
    var_2 _id_70FD( 4, var_1 );
}

_id_70FB( var_0 )
{
    common_scripts\utility::flag_wait( "building_slide_missile2" );
    var_1 = var_0;
    var_2 = ( 0.0, 0.0, -300.0 );
    var_3 = getent( "building_slide_run_target2", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    wait 1;
    common_scripts\utility::flag_wait( "building_slide_missile1" );
    var_3 = getent( "building_slide_run_target1", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    thread maps\intro_fx::_id_6EE8();
    common_scripts\utility::flag_wait( "building_slide_missile3" );
    var_3 = getent( "building_slide_run_target3", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    common_scripts\utility::flag_wait( "building_slide_missile4" );
    var_3 = getent( "building_slide_run_target4", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    common_scripts\utility::flag_wait( "building_slide_missile5" );
    var_3 = getent( "building_slide_run_target5", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    common_scripts\utility::flag_wait( "building_slide_missile6" );
    var_3 = getent( "building_slide_run_target6", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    wait 1;
    common_scripts\utility::flag_wait( "building_slide_missile7" );
    var_3 = getent( "building_slide_run_target7", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
    wait 1;
    common_scripts\utility::flag_wait( "building_slide_missile8" );
    var_3 = getent( "building_slide_run_target7", "targetname" );
    var_3 thread _id_7100( var_1, "direct", "stinger_speedy_intro", var_2 );
}

_id_70FC()
{
    var_0 = getent( "building_slide_run_uav", "targetname" );
    var_1 = var_0 maps\_vehicle::_id_1F9E();
    return var_1;
}

_id_70FD( var_0, var_1 )
{
    self endon( "trigger" );

    if ( isdefined( var_0 ) )
        wait(var_0);
    else
        wait 3;

    _id_70FE( var_1 );
}

_id_70FE( var_0 )
{
    self endon( "trigger" );

    for (;;)
    {
        var_1 = level.player.origin + ( randomintrange( -128, 128 ), randomintrange( -128, 128 ), 0 );
        var_2 = spawn( "script_origin", var_1 );
        var_3 = var_2 thread _id_7100( var_0, "direct", "stinger_speedy_intro", ( 0.0, 0.0, -300.0 ) );
        level thread _id_7049( var_3, var_2 );
        wait(randomfloatrange( 1.5, 4 ));
    }
}

_id_70FF()
{
    var_0 = _id_7105();
    playfx( level._effect["mortar"]["dirt"], var_0 );
    thread common_scripts\utility::play_sound_in_space( "clusterbomb_explode_default", var_0 );
    level.player playrumbleonentity( "artillery_rumble" );
    wait 0.2;
    level.player disableinvulnerability();
    level.player kill();
}

_id_7100( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) )
        var_4 = var_2;
    else
        var_4 = "stinger_speedy_intro";

    if ( isdefined( var_3 ) )
    {
        var_5 = magicbullet( var_4, var_0.origin + var_3, self.origin );
        maps\_audio::aud_send_msg( "finale_missile_incoming", var_5 );
    }
    else
    {
        var_5 = magicbullet( var_4, var_0.origin, self.origin );
        maps\_audio::aud_send_msg( "finale_missile_incoming", var_5 );
    }

    var_5 thread _id_7102( self );
    var_5 missile_settargetent( self );
    thread _id_704E();
    var_5 thread _id_704C( self );

    if ( var_4 == "javelin_berlin" )
    {
        if ( isdefined( var_1 ) && var_1 == "direct" )
            var_5 missile_setflightmodedirect();
        else
            var_5 missile_setflightmodetop();
    }

    return var_5;
}

_id_7101()
{
    if ( !isdefined( level._id_4A50 ) )
        level._id_4A50 = 0;

    var_0 = self.origin + ( 0.0, 0.0, 48.0 );
    var_1 = var_0 - level.player.origin;
    var_2 = length( var_1 );
    var_3 = vectornormalize( var_1 );
    var_4 = vectornormalize( anglestoforward( level.player.angles ) );
    var_5 = vectordot( var_3, var_4 );

    if ( var_5 > 0.3 && var_2 < 700 )
    {
        if ( level.console && level.ps3 || !level.console )
        {
            sethalfresparticles( 1 );
            level._id_4A50++;
        }

        wait 3;

        if ( level.console && level.ps3 || !level.console )
        {
            if ( level._id_4A50 < 2 )
                sethalfresparticles( 0 );

            level._id_4A50--;
        }
    }
}

_id_7102( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( self );
    self waittill( "death" );
    maps\_audio::aud_send_msg( "finale_missile_impact", var_1.origin );
    var_1 thread _id_7101();
    earthquake( 0.3, 0.5, var_1.origin, 512 );
    wait 0.05;
    var_1 delete();
}

_id_7103( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "heli_players_dead" );

    if ( isdefined( self._id_28E3 ) )
        var_5 = self._id_28E3;
    else
        var_5 = "cobra_seeker";

    var_6 = "cobra_seeker";

    if ( isdefined( var_3 ) )
        var_6 = var_3;

    var_7 = undefined;
    var_8 = [];
    self setvehweapon( var_5 );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_9 = 0;

    if ( !isdefined( var_0.classname ) )
    {
        var_10 = spawn( "script_origin", var_0.origin );
        var_10._id_7048 = 0;
        level thread _id_7049( self, var_10 );
        var_10.targetname = var_0.targetname;
        var_10.origin = var_0.origin;
        var_0 = var_10;
        var_9 = 1;
    }

    var_0 thread _id_704E();
    var_7 = 0.5;
    var_8[0] = "tag_missile_right";
    var_8[1] = "tag_missile_left";
    var_11 = -1;

    for ( var_12 = 0; var_12 < var_1; var_12++ )
    {
        var_11++;

        if ( var_11 >= var_8.size )
            var_11 = 0;

        self setvehweapon( var_6 );
        self._id_2889 = 1;
        var_13 = self fireweapon( var_8[var_11], var_0 );
        maps\_audio::aud_send_msg( "uav_fire_missile", var_13 );

        if ( var_9 )
            level thread _id_704A( var_0, var_13 );

        var_13 thread _id_704C( var_0, var_4 );
        var_13 thread vehicle_scripts\_attack_heli::_id_28B3();

        if ( var_12 < var_1 - 1 )
            wait(var_2);
    }

    self._id_2889 = 0;
    self setvehweapon( var_5 );
    self notify( "done_firing_weapons" );
}

_id_7104()
{
    common_scripts\utility::flag_set( "building_slide_building_hit" );
    var_0 = getent( "building_slide_vol", "targetname" );

    if ( !level.player istouching( var_0 ) )
        thread _id_70FF();
    else
        level.player enableinvulnerability();
}

_id_7105()
{
    var_0 = level.player getplayerangles();
    var_0 = ( 0, var_0[1], 0 );
    var_1 = anglestoforward( var_0 );
    var_2 = anglestoright( var_0 );
    var_3 = var_2 * -1;
    var_4 = level.player.origin + var_1 * 96;
    var_4 = maps\_utility::_id_2281( var_4, 200, -200 );
    return var_4;
}

_id_7106()
{
    thread _id_7107();
    maps\_audio::aud_send_msg( "mus_player_slide" );
}

_id_7107()
{
    var_0 = getentarray( "building_slide_hide", "targetname" );
    var_1 = getentarray( "building_slide_roof", "targetname" );

    foreach ( var_3 in var_0 )
        var_3 maps\_utility::_id_2807();

    thread _id_7012();
    thread _id_710D();
    thread maps\intro_fx::_id_6F13( var_0, var_1 );
    thread maps\intro_fx::_id_6EF0();
    thread maps\intro_fx::_id_6EED();
    thread _id_7108();
    thread _id_7109();
    maps\_utility::delaythread( 8.5, ::_id_710A );
    maps\_utility::delaythread( 19.5, ::_id_710B );
}

_id_7108()
{
    setblur( 10, 0 );
    maps\_utility::delaythread( 0.2, maps\_utility::_id_27D3, "intro_slide_sun_bloom", 0 );
    wait 0.25;
    setblur( 0, 0.25 );
    maps\_utility::_id_27D3( "intro_slide", 1 );
}

_id_7109()
{
    setsunflareposition( ( -20.0, 110.0, 0.0 ) );
    thread maps\_shg_fx::_id_446D( "lights_intro_sunflare", ( -20.0, 110.0, 0.0 ), 8000 );
}

_id_710A()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 50;
    var_1["nearEnd"] = 220;
    var_1["nearBlur"] = 5;
    var_1["farStart"] = 1000;
    var_1["farEnd"] = 7000;
    var_1["farBlur"] = 1.75;
    maps\_utility::_id_27C0( var_0, var_1, 0.5 );
    wait 7.5;
    maps\_utility::_id_27C0( var_1, var_0, 0.5 );
}

_id_710B()
{
    setblur( 10, 0 );
    wait 0.5;
    setblur( 0, 1 );
}

_id_710C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6 endon( "stop" );
    var_6 maps\_utility::delaythread( var_5, maps\_utility::_id_1DAA, "stop" );
    var_7 = 0.1;
    var_8 = var_5 / var_7;
    var_9 = var_3 / var_8;
    var_10 = 0;
    var_11 = common_scripts\utility::getfx( var_4 );
    var_12 = randomintrange( -256, 256 );
    var_13 = var_2 * var_12;

    for (;;)
    {
        var_12 = randomintrange( -256, 256 );
        var_13 = var_2 * var_12;
        var_14 = var_0 + var_1 * var_10 + var_13;
        playfx( var_11, var_14 );
        wait(var_7);
        var_10 += var_9;
    }
}

_id_710D()
{
    maps\_shg_common::_id_1670();
    level.player disableweapons();
    level.player disableweaponswitch();
    level._id_51F2 = maps\_utility::_id_1287( "player_rig", ( 0.0, 0.0, 0.0 ) );
    level._id_51F2._id_1032 = "player_rig";
    level._id_51F2 hide();
    level._id_45FA = maps\_utility::_id_1287( "player_legs", ( 0.0, 0.0, 0.0 ) );
    level._id_45FA._id_1032 = "player_legs";
    level._id_45FA hide();
    var_0 = maps\_utility::_id_1287( "uav", ( 0.0, 0.0, 0.0 ) );
    var_0._id_1032 = "uav";
    var_0 maps\_anim::_id_1244();
    level.uav_fx = var_0;
    thread maps\intro_fx::_id_6F0D( level.uav_fx, 68 );
    var_1 = maps\_utility::_id_1287( "landslide_building_water_heater", ( 0.0, 0.0, 0.0 ) );
    var_1._id_1032 = "landslide_building_water_heater";
    level._id_6F03 = var_1;
    var_1 maps\_anim::_id_1244();
    thread maps\intro_fx::_id_6EF1( var_1 );
    var_2 = [];
    var_2[0] = level._id_51F2;
    var_2[1] = level._id_45FA;
    var_2[2] = var_0;
    var_2[3] = var_1;
    var_3 = common_scripts\utility::getstruct( "slide_roof_collapse", "targetname" );
    var_3 maps\_anim::_id_11BF( var_2, "roof_collapse_slide" );
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 10, 10, 10, 10 );
    level._id_51F2 show();
    level._id_45FA show();
    var_4 = "heavy_3s";
    level.player common_scripts\utility::delaycall( 0, ::playrumbleonentity, var_4 );
    level.player common_scripts\utility::delaycall( 3, ::playrumblelooponentity, "subtle_tank_rumble" );
    level.player common_scripts\utility::delaycall( 8.0, ::stoprumble, "subtle_tank_rumble" );
    level.player common_scripts\utility::delaycall( 8.5, ::playrumbleonentity, "artillery_rumble" );
    level.player common_scripts\utility::delaycall( 9, ::playrumblelooponentity, "subtle_tank_rumble" );
    level.player common_scripts\utility::delaycall( 15.5, ::stoprumble, "subtle_tank_rumble" );
    level.player common_scripts\utility::delaycall( 19.5, ::playrumbleonentity, "artillery_rumble" );
    maps\_utility::delaythread( 5, maps\_utility::_id_25F3, "building_slide" );
    maps\_utility::delaythread( 8, ::_id_7118 );
    maps\_utility::delaythread( 9, ::_id_710E );
    maps\_utility::delaythread( 15.5, ::_id_7111 );
    var_3 maps\_anim::_id_11DD( var_2, "roof_collapse_slide" );
    level._id_45FA delete();
    var_0 delete();
    _id_7119();
    common_scripts\utility::flag_set( "building_slide_player_anim_done" );
}

_id_710E()
{
    thread _id_710F();
    level.player disableinvulnerability();
    var_0 = anglestoforward( level.player.angles ) * 100;
    var_1 = var_0 + ( 0.0, 0.0, -10.0 );
    var_2 = 37;
    var_3 = 0.1;
    level.player unlink();
    level._id_51F2 hide();
    level._id_45FA hide();
    common_scripts\utility::array_thread( getentarray( "trigger_hurt", "classname" ), ::_id_7110 );
    waittillframeend;
    level.player _id_7114( var_1, var_2, var_3 );
}

_id_710F()
{
    level.player endon( "stop_sliding" );
    var_0 = 0;
    var_1 = 0.2;

    for (;;)
    {
        earthquake( var_1, 0.05, level.player.origin, 512 );
        var_0++;
        wait 0.05;
    }
}

_id_7110()
{
    self waittill( "trigger" );
    level.player dodamage( self.dmg, level.player.origin );
    earthquake( 0.5, 2, level.player.origin, 512 );
    level.player playrumbleonentity( "damage_heavy" );
    level.player freezecontrols( 1 );
    level.player notify( "stop_sliding" );
    level.player._id_27A3 stopmoveslide();
}

_id_7111()
{
    if ( !isalive( level.player ) )
        return;

    var_0 = 0.25;
    level.player notify( "stop_sliding" );
    level.player unlink();

    if ( isdefined( level._id_7112 ) )
    {
        level._id_7112 unlink();
        level._id_7112 delete();
    }

    if ( isdefined( level._id_7113 ) )
    {
        level._id_7113 unlink();
        level._id_7113 delete();
    }

    level.player playerlinktoblend( level._id_51F2, "tag_player", var_0, 0, 0 );
    wait(var_0);
    level._id_51F2 show();
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 10, 10, 10, 10 );
}

_id_6ABF( var_0, var_1, var_2 )
{
    var_3 = self.origin;
    var_4 = self.angles;
    var_5 = var_0 gettagorigin( var_1 );
    var_6 = var_0 gettagangles( var_1 );
    var_7 = anglestoup( var_6 );
    var_8 = anglestoright( var_6 );
    var_9 = anglestoforward( var_6 );
    var_10 = undefined;
    var_11 = undefined;

    if ( !isdefined( var_2 ) )
    {
        self.origin = ( 0.0, 0.0, 0.0 );
        self.angles = ( 0.0, 0.0, 0.0 );
        var_10 = self gettagorigin( var_1 );
        var_11 = self gettagangles( var_1 );
        self.origin = var_3;
        self.angles = var_4;
    }
    else
    {
        var_2.origin = ( 0.0, 0.0, 0.0 );
        var_2.angles = ( 0.0, 0.0, 0.0 );
        var_10 = var_2 gettagorigin( var_1 );
        var_11 = var_2 gettagangles( var_1 );
    }

    var_12 = var_5 - var_10[0] * var_9 - var_10[1] * var_8 - var_10[2] * var_7;
    var_13 = var_6;
    var_14["origin"] = var_12;
    var_14["angles"] = var_13;
    return var_14;
}

_id_692D( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_6ABF( var_0, var_1, var_3 );
    self.origin = var_4["origin"];
    self.angles = var_4["angles"];

    if ( var_2 )
        self linktoblendtotag( var_0, var_1 );
}

_id_7114( var_0, var_1, var_2 )
{
    var_3 = level.player;
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4.origin = var_3.origin;
    var_4.angles = level._id_51F2 gettagangles( "tag_player" );
    var_3._id_27A3 = var_4;
    var_5 = isdefined( level._id_27A4 );

    if ( var_5 )
        var_3 playerlinktoblend( var_4, undefined, 1 );
    else
        var_3 playerlinktodelta( var_4, "tag_origin", 1, 10, 30, 20, 20 );

    var_3._id_27A3 moveslide( ( 0.0, 0.0, 15.0 ), 15, var_0 );
    var_3 thread _id_142F( var_4, var_1, var_2 );
}

_id_7115( var_0 )
{
    level.player endon( "stop_sliding" );
    level._id_7112 linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_7113 linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );

    for (;;)
    {
        var_1 = level.player getplayerangles();
        var_2 = var_1[1] - var_0.angles[1];
        level._id_7112 linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0, var_2, 0 ) );
        level._id_7113 linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0, var_2, 0 ) );
        wait 0.05;
    }
}

_id_142F( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "stop_sliding" );
    var_3 = self;
    var_4 = undefined;
    level._id_7116 = 23;
    childthread _id_7117();

    for (;;)
    {
        var_5 = var_3 getnormalizedmovement();
        var_6 = anglestoforward( var_3.angles );
        var_7 = anglestoright( var_3.angles );
        var_5 = ( var_5[1] * var_7[0] * var_1 + level._id_7116 * var_6[0], var_5[1] * var_7[1] * var_1 + level._id_7116 * var_6[1], 0 );
        var_0.slidevelocity += var_5;
        wait 0.05;
        var_0.slidevelocity *= ( 1 - var_2 );
    }
}

_id_7117()
{
    var_0 = 40;
    var_1 = 23;
    var_2 = common_scripts\utility::getstruct( "slide_roof_collapse", "targetname" );
    var_3 = distance( level.player.origin, level._id_51F2 gettagorigin( "tag_player" ) ) + 0.01;
    wait 1;

    for (;;)
    {
        var_4 = distance( var_2.origin, level._id_51F2 gettagorigin( "tag_player" ) );
        var_5 = distance( var_2.origin, level.player.origin );
        var_6 = distance( level.player.origin, level._id_51F2 gettagorigin( "tag_player" ) );
        var_7 = var_6 / var_3;

        if ( var_4 > var_5 && var_6 > 10 && level._id_7116 < var_0 )
            level._id_7116 += 4;
        else if ( var_4 < var_5 && var_6 > 10 && level._id_7116 > var_1 )
            level._id_7116 -= 4;

        var_3 = var_6 + 0.01;
        wait 0.05;
    }
}

_id_7118()
{
    var_0 = 0;

    if ( level.console )
    {
        var_1 = getsticksconfig();
        var_2 = "";

        if ( issubstr( var_1, "southpaw" ) )
        {
            var_0 = 1;
            maps\_utility::_id_1F61( "control_slide_l", 3 );
        }
    }

    if ( !var_0 )
        maps\_utility::_id_1F61( "control_slide", 3 );

    while ( isdefined( level._id_13DD ) )
    {
        var_3 = "control_slide";
        var_1 = getsticksconfig();

        if ( issubstr( var_1, "southpaw" ) )
            var_3 = "control_slide_l";

        level._id_13DD settext( level._id_1E9D[var_3] );
        wait 0.05;
    }
}

_id_7119()
{
    var_0 = maps\_utility::_id_1287( "landslide_building_water_heater", ( 0.0, 0.0, 0.0 ) );
    var_0._id_1032 = "landslide_building_water_heater";
    var_0 maps\_anim::_id_1244();
    var_1 = getent( "intro_landslide_small_01", "targetname" );
    var_1._id_1032 = "landslide_building_small_01";
    var_1 maps\_anim::_id_1244();
    var_2 = maps\_utility::_id_1287( "littlebird", ( 0.0, 0.0, 0.0 ) );
    var_2._id_1032 = "littlebird";
    var_2 maps\_anim::_id_1244();
    var_2 hidepart( "static_rotor_jnt" );
    var_2 hidepart( "static_tail_rotor_jnt" );
    level._id_54E0._id_406B notify( "stop_wounded_idle" );
    var_3 = [];
    var_3[0] = var_0;
    var_3[1] = var_1;
    var_3[2] = var_2;
    var_4 = common_scripts\utility::getstruct( "slide_roof_collapse", "targetname" );
    var_4 maps\_anim::_id_11BF( var_3, "river_ride" );
    var_5 = [];
    var_5[0] = [ level._id_51F2, 0 ];
    var_5[1] = [ var_0, 0 ];
    var_5[2] = [ var_1, 0 ];
    var_5[3] = [ var_2, 0 ];
    level.player common_scripts\utility::delaycall( 6, ::playrumbleonentity, "artillery_rumble" );
    level.player common_scripts\utility::delaycall( 7, ::playrumblelooponentity, "subtle_tank_rumble" );
    level.player common_scripts\utility::delaycall( 9, ::playrumbleonentity, "light_1s" );
    level.player common_scripts\utility::delaycall( 13, ::playrumbleonentity, "heavy_3s" );
    level.player common_scripts\utility::delaycall( 17.5, ::stoprumble, "subtle_tank_rumble" );
    var_2 common_scripts\utility::delaycall( 13, ::hide );
    thread _id_711A();
    thread _id_711B();
    thread _id_711C();
    var_4 maps\_shg_common::_id_16EB( var_5, "river_ride" );
    common_scripts\utility::flag_set( "building_slide_complete" );
}

_id_711A()
{
    wait 30;
    maps\_audio::aud_send_msg( "mus_emerge_from_river" );
    thread maps\_utility::vision_set_fog_changes( "intro_slide_sun_bloom", 3 );
    wait 0.2;
    setblur( 20, 3 );
    thread _id_7004();
}

_id_711B()
{
    setsunflareposition( ( -32.0, 65.0, 0.0 ) );
    common_scripts\utility::flag_set( "fx_spot_flare_kill" );
    common_scripts\utility::flag_clear( "fx_spot_flare_kill" );
    wait 24;
    thread maps\_shg_fx::_id_446D( "lights_intro_sunflare", ( -32.0, 65.0, 0.0 ), 8000 );
}

_id_711C()
{
    wait 24;
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 1.5;
    var_1["nearEnd"] = 6.5;
    var_1["nearBlur"] = 6;
    var_1["farStart"] = 24;
    var_1["farEnd"] = 90;
    var_1["farBlur"] = 1.3;
    maps\_utility::_id_27C0( var_0, var_1, 1 );
}

_id_711D()
{
    var_0 = getent( "building_slide_tree_fall_col", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
}

_id_711E()
{
    var_0 = getent( "building_slide_destructible_tree", "targetname" );
    var_1 = maps\_utility::_id_1287( "animated_tree", ( 0.0, 0.0, 0.0 ) );
    var_1._id_1032 = "animated_tree";
    var_1 maps\_anim::_id_1244();
    var_2 = common_scripts\utility::getstruct( "building_slide_tree_fall_anim_pos", "targetname" );
    wait 0.4;
    playfx( common_scripts\utility::getfx( "uav_attack_tree_missile_impact" ), self.origin );
    thread maps\intro_fx::_id_6ED4( var_1 );
    wait 0.1;
    var_0 hide();
    var_2 thread maps\_anim::_id_1246( var_1, "tree_fall" );
    var_3 = getent( "building_slide_tree_fall_col", "targetname" );
    var_3 solid();
}

_id_711F( var_0, var_1 )
{
    var_2 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    var_3 = var_0.origin[2] - var_2.origin[2];
    var_4 = sqrt( var_3 / 39.3701 / 4.9 );
    var_5 = randomfloatrange( 0.2, 0.3 );
    wait 0.3;

    if ( isdefined( var_1 ) )
        earthquake( var_5, var_1, level.player.origin, 500 );

    wait 0.3;
    thread _id_7120( var_2 );
    var_0 rotateto( var_2.angles, var_4, var_4, 0 );
    var_0 moveto( var_2.origin, var_4, var_4, 0 );

    if ( isdefined( var_2._id_164F ) )
    {
        wait(var_4);
        playfx( common_scripts\utility::getfx( var_2._id_164F ), var_2.origin );
    }
}

_id_7120( var_0 )
{
    if ( isdefined( var_0.target ) )
    {
        var_1 = common_scripts\utility::getstruct( var_0.target, "targetname" );

        if ( isdefined( var_1.target ) )
            thread _id_7120( var_1 );

        if ( isdefined( var_1.script_delay ) )
            wait(var_1.script_delay);

        var_2 = "rock_falling";

        if ( isdefined( var_1._id_164F ) )
            var_2 = var_1._id_164F;

        playfx( common_scripts\utility::getfx( var_2 ), var_1.origin );
    }
}

_id_7121()
{
    var_0 = getent( "landslide_area_building_01_damaged", "targetname" );
    var_0 hide();
    var_0 notsolid();
    var_1 = getent( "landslide_area_building_01_damaged_collapse", "targetname" );
    var_1 hide();
    var_1 notsolid();
    var_2 = getentarray( "landslide_area_building_01_damaged_collapse_windows", "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_4 hide();
        var_4 linkto( var_1 );
    }
}

_id_7122()
{
    var_0 = common_scripts\utility::getstructarray( "building_slide_building_destruct_fx1", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "building_slide_building_destruct_fx2", "targetname" );
    var_2 = common_scripts\utility::getstructarray( "building_slide_building_destruct_fx3", "targetname" );
    var_3 = common_scripts\utility::getstructarray( "building_slide_building_destruct_fx4", "targetname" );

    foreach ( var_5 in var_0 )
        playfx( common_scripts\utility::getfx( "intro_sliderun_debrisexp1" ), var_5.origin );

    foreach ( var_5 in var_1 )
        playfx( common_scripts\utility::getfx( "intro_sliderun_debrisexp2" ), var_5.origin, ( 0.0, -1.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );

    wait 0.5;

    foreach ( var_5 in var_2 )
        playfx( common_scripts\utility::getfx( "intro_sliderun_wallexp1" ), var_5.origin, ( 0.0, -1.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );

    wait 1.5;

    foreach ( var_5 in var_3 )
    {
        playfx( common_scripts\utility::getfx( "intro_sliderun_wallexp2" ), var_5.origin, ( 0.0, -1.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
        wait 1;
    }
}

_id_7123( var_0 )
{
    maps\_utility::_id_25F3( "river_ride" );
    wait 11;
    thread _id_7138();
    var_1 = spawnstruct();
    var_1._id_7124 = 0;
    var_1._id_7125 = 6;
    var_1._id_7126 = 1;
    var_1._id_7127 = 0.75;
    var_1._id_1E43 = 0.065;
    var_1._id_298F = 0.03;
    var_1._id_7128 = 4;
    var_1._id_7129 = 1;
    var_1._id_712A = 1;
    var_1._id_712B = 70;
    var_1._id_712C = 90;
    var_1._id_712D = "light_3s";
    var_1 _id_712E( var_0 );
}

_id_712E( var_0 )
{
    var_1 = _id_7131();
    var_2 = 0;
    var_3 = 0;
    var_4 = level._id_51F2 maps\_utility::_id_1281( var_0 );
    var_5 = spawnstruct();
    var_5 thread _id_7132( self );
    level._id_712F = var_5;
    thread _id_7134( var_0 );
    var_6 = 0;
    var_7 = 500;
    var_8 = 0;
    var_9 = abs( var_7 - var_8 );
    var_10 = spawnstruct();
    var_11 = 2;
    var_12 = 5;
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    var_16 = 0;

    for (;;)
    {
        var_17 = _id_7131();
        var_18 = 0;
        var_3 = 0;

        if ( var_17 && !var_1 )
        {
            if ( !var_16 )
            {
                var_16 = 1;
                level.player playrumblelooponentity( self._id_712D );
            }

            if ( randomint( 100 ) > self._id_712C )
                level.player playrumbleonentity( "damage_heavy" );
            else if ( randomint( 100 ) > self._id_712B )
                level.player playrumbleonentity( "damage_light" );

            var_5._id_7130[var_5._id_7130.size] = gettime();
            var_2 = gettime();
            var_3 = ( sin( gettime() * 0.2 ) + 1 ) * 0.5;
            var_3 *= self._id_298F;
            var_3 += self._id_1E43;
            var_18 = 1;

            if ( level._id_51F2 getanimtime( var_4 ) > 0.05 )
            {

            }
        }

        if ( var_16 && gettime() > var_2 + 300 )
        {
            var_16 = 0;
            level.player stoprumble( self._id_712D );
        }

        var_1 = var_17;
        var_19 = 0;
        var_15 = undefined;
        var_15 = level._id_51F2 getanimtime( var_4 );

        if ( var_15 >= 0.45 )
            var_19 = 1;

        if ( isdefined( self._id_7129 ) )
        {
            var_5._id_7128 = 1 - var_15;
            var_5._id_7128 *= 7;
            var_5._id_7128 = clamp( var_5._id_7128, 7, 1 );
        }

        var_20 = abs( var_14 - var_15 );

        if ( var_20 > 0.05 )
        {
            _id_713D( var_15 );
            var_14 = var_15;
        }

        if ( var_19 )
            break;

        wait 0.05;
    }

    var_5 notify( "stop" );
    level.player stoprumble( self._id_712D );
    thread _id_7139( 0.25 );
    level._id_712F = undefined;
    _id_17CC( 1 );
}

_id_7131()
{
    return level.player usebuttonpressed();
}

_id_7132( var_0 )
{
    self endon( "stop" );
    var_1 = 1500;
    self._id_7130 = [];
    var_2 = 7;

    for (;;)
    {
        waittillframeend;

        for ( var_3 = 0; var_3 < self._id_7130.size; var_3++ )
        {
            var_4 = self._id_7130[var_3];

            if ( var_4 < gettime() - var_1 )
                continue;

            break;
        }

        for ( var_5 = []; var_3 < self._id_7130.size; var_3++ )
            var_5[var_5.size] = self._id_7130[var_3];

        self._id_7130 = var_5;
        var_6 = ( self._id_7130.size - var_0._id_7128 ) * 0.03;
        var_6 *= 10;
        var_6 = clamp( var_6, 0, 1.0 );
        self._id_7133 = var_6;
        wait 0.05;
    }
}

_id_7134( var_0 )
{
    level._id_712F endon( "stop" );
    wait 3;
    var_1 = _id_473C();
    var_2 = 0;
    var_3 = -30;

    for (;;)
    {
        var_4 = level._id_712F._id_7130.size >= 2;

        if ( var_4 )
            var_2 += 2;
        else
            var_2 -= 1;

        if ( var_2 <= var_3 )
            break;

        var_2 = clamp( var_2, var_3, 20 );
        var_5 = var_2;
        var_5 /= var_3;
        var_5 = clamp( var_5, 0, 1 );
        var_1 fadeovertime( 0.2 );
        var_1.alpha = var_5;
        var_6 = var_2 / var_3;
        var_6 = 1 - var_6;
        var_6 = clamp( var_6, 0, 1 );
        maps\_anim::_id_127B( level._id_51F2, var_0, var_6 );
        wait 0.05;
    }

    var_1 fadeovertime( 0.2 );
    var_1.alpha = 1;
    wait 0.2;
    maps\_utility::_id_1826();
}

_id_7135( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1.5;

    if ( !isdefined( level._id_7136 ) )
        _id_7137();

    foreach ( var_2 in level._id_7136 )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0.95;
    }
}

_id_7137()
{
    var_0 = 90;
    var_1 = 35;
    var_2 = level.player maps\_hud_util::createserverclientfontstring( "default", 3 );
    var_2.horzalign = "right";
    var_2.alignx = "right";
    var_2 _id_713A();
    var_2 settext( &"INTRO_RIVER_RIDE_HINT" );
    var_3 = [];
    var_3["text"] = var_2;
    level._id_7136 = var_3;
}

_id_7138()
{
    level notify( "fade_out_mash_hint" );
    level endon( "fade_out_mash_hint" );

    if ( !isdefined( level._id_7136 ) )
        _id_7137();

    var_0 = 0.1;
    var_1 = 0.2;

    foreach ( var_3 in level._id_7136 )
    {
        var_3 fadeovertime( 0.1 );
        var_3.alpha = 0.95;
    }

    wait 0.1;
    var_5 = level._id_7136["text"];

    for (;;)
    {
        var_5 fadeovertime( 0.01 );
        var_5.alpha = 0.95;
        var_5 changefontscaleovertime( 0.01 );
        var_5.fontscale = 3;
        wait 0.05;
        var_5 fadeovertime( var_0 );
        var_5.alpha = 0.0;
        var_5 changefontscaleovertime( var_0 );
        var_5.fontscale = 0.25;
        wait(var_1);
        var_6 = 6;

        while ( isdefined( level._id_712F ) )
        {
            if ( level._id_712F._id_7130.size < var_6 )
                break;

            foreach ( var_3 in level._id_7136 )
                var_3.alpha = 0;

            wait 0.05;
        }
    }
}

_id_7139( var_0 )
{
    level notify( "fade_out_mash_hint" );

    if ( !isdefined( var_0 ) )
        var_0 = 1.5;

    if ( !isdefined( level._id_7136 ) )
        _id_7137();

    foreach ( var_2 in level._id_7136 )
    {
        var_2 fadeovertime( var_0 );
        var_2.alpha = 0;
    }
}

_id_713A()
{
    self.alignx = "center";
    self.aligny = "middle";
    self.horzalign = "center";
    self.vertalign = "middle";
    self.hidewhendead = 1;
    self.hidewheninmenu = 1;
    self.sort = 205;
    self.foreground = 1;
    self.alpha = 0;
}

_id_17CC( var_0 )
{
    if ( level._id_16C9 )
        return;

    level notify( "now_fade_in" );
    var_1 = _id_473C();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 0;
}

_id_713B()
{
    var_0 = _id_7131();

    for (;;)
    {
        if ( !var_0 && _id_7131() )
            break;

        var_0 = _id_7131();
        wait 0.05;
    }

    level.player notify( "pressed_use" );
}

_id_713C()
{
    if ( !isdefined( level._id_7136 ) )
        return 0;

    foreach ( var_1 in level._id_7136 )
        return var_1.alpha > 0.8;

    return 0;
}

_id_09FA( var_0 )
{
    var_1 = _id_473C();

    if ( var_0 )
        var_1 fadeovertime( var_0 );

    var_1.alpha = 1;
}

_id_713D( var_0 )
{
    if ( isdefined( self._id_713E ) )
        var_0 = self._id_713E;

    var_1 = var_0 + 0.37;
    var_1 *= 0.22;
    earthquake( var_1, 5, level.player.origin, 5000 );
}

_id_713F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.5;

    level notify( "new_hurt" );
    level endon( "new_hurt" );

    if ( isdefined( self._id_713E ) )
        var_1 = self._id_713E;

    var_2 = level.player.origin + common_scripts\utility::randomvector( 1000 );
    var_3 = var_0 * 2.9;
    var_4 = var_0 * 0.25;
    setblur( var_3, 0 );
    setblur( 0, var_4 );
    var_5 = var_0 * 0.05;
    var_5 = clamp( var_5, 0, 0.4 );
    var_6 = var_0 * 0.02;
    var_6 = clamp( var_6, 0, 0.25 );
    var_7 = clamp( var_0, 0, 0.85 );
    var_8 = 0.2;
    var_9 = 0.75;
    var_10 = abs( var_8 - var_9 );
    var_11 = 1 - var_1;
    var_12 = var_11 * var_10 + var_8;
    var_13 = var_1 * 2;
    var_13 = clamp( var_13, 0.5, 2.0 );
    var_14 = randomfloatrange( 0.2, 0.6 );
    var_15 = "aftermath_hurt";

    if ( var_13 > 1.35 )
        var_15 = "aftermath_dying";

    maps\_utility::set_vision_set( var_15, var_12 );

    if ( randomint( 100 ) > 70 )
    {
        wait 0.15;
        var_14 = randomfloatrange( 0.16, 0.22 );
        maps\_utility::set_vision_set( "aftermath_walking", var_14 );
    }

    wait(var_13);
    maps\_utility::set_vision_set( "aftermath_walking", var_14 );
}

_id_4BB3( var_0, var_1, var_2 )
{
    var_0 = getent( var_0, "targetname" );
    var_3 = getent( var_1, "targetname" );
    var_4 = maps\_utility::_id_1287( "breach_door_model", ( 0.0, 0.0, 0.0 ) );
    var_4._id_1032 = "breach_door_model";
    var_4 hide();
    var_3 maps\_anim::_id_11CF( var_4, "breach" );
    common_scripts\utility::flag_wait( "courtyard_start_breach" );
    var_2 = getent( var_2, "targetname" );
    var_2 connectpaths();
    var_2 delete();
    var_3 thread maps\_anim::_id_1246( var_4, "breach" );
    var_4 show();
    var_0 delete();
}

_id_4CCD( var_0 )
{
    var_1 = self.script_fxid;
    var_2 = common_scripts\utility::createexploder( var_1 );
    var_2.v["origin"] = self.origin;
    var_2.v["angles"] = self.angles;
    var_2.v["fxid"] = var_1;
    var_2.v["delay"] = 0;
    var_2.v["exploder"] = "breach_" + var_0;
    var_2.v["soundalias"] = "clusterbomb_explode_default";
    var_2.v["forward"] = anglestoforward( self.angles );
    var_2.v["up"] = anglestoup( self.angles );
}

_id_64DD()
{
    var_0 = bullettrace( self.origin + ( 0.0, 0.0, 32.0 ), self.origin, 0, undefined );
    self.origin = var_0["position"];
}

_id_50B5( var_0, var_1 )
{
    self endon( "death" );
    var_2 = undefined;

    if ( isdefined( self.accuracy ) )
        var_2 = self.accuracy;

    if ( isdefined( var_0 ) )
        self.accuracy = var_0;
    else
        self.accuracy = 0.2;

    if ( isdefined( var_1 ) )
    {
        common_scripts\utility::flag_wait( var_1 );

        if ( isdefined( var_2 ) )
            self.accuracy = var_2;
        else
            self.accuracy = 0.8;
    }
}

_id_7140( var_0, var_1 )
{
    var_2 = var_0;
    var_3 = 0;

    for ( var_4 = var_2.size - 1; var_4 >= 0; var_4-- )
    {
        if ( isalive( var_2[var_4] ) && !isdefined( var_2[var_4]._id_7141 ) )
        {
            if ( isarray( var_1 ) )
            {
                if ( var_1.size > 1 )
                {
                    var_5 = maps\_utility::_id_0AE9( var_2[var_4].origin, var_1 );
                    var_2[var_4] setgoalpos( var_5.origin );
                }
                else
                    var_2[var_4] setgoalpos( var_1[0].origin );
            }
            else
                var_2[var_4] setgoalpos( var_1.origin );

            var_2[var_4] notify( "retreat" );
            var_2[var_4] thread _id_7142();
            var_3++;
        }

        if ( var_3 > 3 )
        {
            wait 3;
            var_3 = 0;
        }
    }
}

_id_7142()
{
    self endon( "death" );
    self.goalradius = 256;
    self.ignoreall = 1;
    common_scripts\utility::waittill_either( "goal", "damage" );
    self.goalradius = 512;
    self.ignoreall = 0;
}

_id_4BEF( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( level.player istouching( var_2 ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

_id_473B( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

_id_473C( var_0 )
{
    if ( !isdefined( level._id_473D ) )
    {
        level._id_473D = maps\_hud_util::_id_09A7( "black", 0, level.player );
        level._id_473D.sort = -1;
    }

    if ( isdefined( var_0 ) )
        level._id_473D.foreground = var_0;

    return level._id_473D;
}

_id_56AD()
{
    if ( !isdefined( level._id_56AE ) )
        level._id_56AE = maps\_hud_util::_id_09A7( "white", 0, level.player );

    level._id_56AE.sort = -1;
    level._id_56AE.foreground = 0;
    return level._id_56AE;
}

_id_473E( var_0, var_1 )
{
    setblur( var_0, var_1 );
}

_id_46B8( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1.5;

    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.foreground = 1;
    var_4 setshader( var_0, 640, 480 );

    if ( isdefined( var_3 ) && var_3 > 0 )
    {
        var_4.alpha = 0;
        var_4 fadeovertime( var_3 );
        var_4.alpha = 1;
        wait(var_3);
    }

    wait(var_1);

    if ( var_2 > 0 )
        var_4 fadeovertime( var_2 );

    var_4.alpha = 0;
    wait(var_2);
    var_4 destroy();
}

_id_460E()
{
    self._id_4B64 = 0;
    self.ignoreall = 1;
    self._id_100A = 1;
    self.ignoresuppression = 1;
    self._id_460D = self.suppressionwait;
    self.suppressionwait = 0;
    maps\_utility::_id_0EEC();
    self.ignorerandombulletdamage = 1;
    maps\_utility::_id_2714();
    maps\_utility::_id_1057();
    maps\_utility::_id_280D();
    self.grenadeawareness = 0;
    self.ignoreme = 1;
    maps\_utility::_id_27CC();
    self._id_1106 = 1;
}

_id_4BF4()
{
    return self._id_4B64;
}

_id_460C()
{
    self._id_4B64 = 1;
    self.ignoreall = 0;
    self._id_100A = undefined;
    self.ignoresuppression = 0;
    self.suppressionwait = self._id_460D;
    self._id_460D = undefined;
    maps\_utility::_id_27B8();
    self.ignorerandombulletdamage = 0;
    maps\_utility::_id_2715();
    maps\_utility::_id_1071();
    self.grenadeawareness = 1;
    self.ignoreme = 0;
    maps\_utility::_id_27CD();
    self._id_1106 = undefined;
}

_id_4E7A( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = var_3;
    else
        var_4 = "color_volume_advance_stop";

    thread _id_4E7E( var_4 );
    level endon( var_4 );
    var_5 = "allies";

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    for ( var_6 = var_2; var_6 <= var_1; var_6++ )
    {
        var_7 = var_0 + "_" + var_6;
        var_8 = getent( var_7, "targetname" );
        var_9 = getent( var_8.target, "targetname" );

        if ( !isdefined( var_8.trigger_off ) || var_8.trigger_off == 1 )
        {
            var_8 waittill( "trigger" );
            var_8 common_scripts\utility::trigger_off_proc();
        }

        var_10 = var_9 maps\_colors::_id_1355( var_9._id_1341, var_5 );
        var_11 = var_10["colorCodes"];
        var_12 = var_10["colorCodesByColorIndex"];
        var_13 = var_10["colors"];
        var_14 = [];

        foreach ( var_16 in var_11 )
        {
            var_17 = spawnstruct();
            var_17._id_4E7B[0] = var_16;
            var_18 = getsubstr( var_16, 0, 1 );
            var_17._id_4E7C[0] = var_18;
            var_17._id_4E7D[var_18] = var_12[var_18];
            var_17.name = var_7;
            var_17._id_1542 = var_9;
            var_14[var_14.size] = var_17;
        }

        common_scripts\utility::array_thread( var_14, ::_id_4E81, var_4 );
    }
}

_id_4E7E( var_0 )
{
    level waittill( "color_endon" );
    level._id_4E7F = undefined;
}

_id_4E80( var_0, var_1 )
{
    level endon( var_1 );

    for (;;)
    {
        if ( level._id_4E7F[var_0].size )
        {
            var_2 = level._id_4E7F[var_0][0];
            var_2 _id_4E83( var_1 );
            continue;
        }

        level waittill( "color_flag_advance_queue_updated" );
    }
}

_id_4E81( var_0 )
{
    var_1 = self._id_4E7C[0];

    if ( !isdefined( level._id_4E7F ) )
        level._id_4E7F = [];

    var_2 = getarraykeys( level._id_4E7F );
    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        if ( var_5 == var_1 )
        {
            var_3 = 1;
            break;
        }
    }

    if ( !var_3 )
    {
        level._id_4E7F[var_1] = [];
        thread _id_4E80( var_1, var_0 );
    }

    level._id_4E7F[var_1][level._id_4E7F[var_1].size] = self;
    level notify( "color_flag_advance_queue_updated" );
}

_id_4E82()
{
    var_0 = self._id_4E7C[0];
    level._id_4E7F[var_0] = common_scripts\utility::array_remove( level._id_4E7F[var_0], self );
}

_id_4E83( var_0 )
{
    level endon( var_0 );
    self._id_1542 maps\_utility::_id_27E4();
    thread maps\_colors::_id_135F( self._id_4E7B, self._id_4E7C, "allies", self._id_4E7D );

    if ( isdefined( self._id_1542.script_noteworthy ) )
    {
        var_1 = getentarray( self._id_1542.script_noteworthy, "script_noteworthy" );

        foreach ( var_3 in var_1 )
        {
            if ( var_3.classname == "trigger_multiple" )
                var_3 common_scripts\utility::trigger_off();
        }
    }

    _id_4E82();
}

_id_4E84( var_0, var_1 )
{
    if ( !var_0.size )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_4E7B[0] == var_1 )
            return 1;
    }

    return 0;
}

_id_7143()
{
    var_0 = getspawnerteamarray( "allies" );
    level._id_1349 = [];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "regroup_intro_friendlies_init" )
            level._id_1349[var_2.classname] = var_2;
    }
}

_id_7144()
{
    switch ( level._id_1F19 )
    {
        case "courtyard":
            var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
            break;
        case "escort":
            var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
            break;
        case "regroup":
            var_0 = getnode( "regroup_soap_wounded_put_down1", "targetname" );
            break;
        case "maars shed":
            var_0 = getnode( "regroup_soap_wounded_put_down6", "targetname" );
            break;
        case "maars control":
            var_0 = getnode( "regroup_soap_wounded_put_down6", "targetname" );
            break;
        case "slide":
            var_0 = getnode( "maars_control_soap_wounded_put_down1", "targetname" );
            break;
        default:
            var_0 = common_scripts\utility::getstruct( "anim_intro_room", "targetname" );
            break;
    }

    level._id_54E0 maps\intro_carry::_id_406A( var_0 );
    level._id_64A5 thread maps\intro_carry::_id_6F20();
    level._id_64A5 thread maps\intro_carry::_id_6F22( level._id_54E0, var_0 );
}

_id_7145( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    maps\intro_carry::_id_6F32( var_1 );
}

_id_7146( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    maps\intro_carry::_id_6F32( var_1 );
}

_id_7147( var_0 )
{
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingame( var_0, 1 );
    level._id_7148 = var_0;
}

_id_7149( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        maps\_audio::aud_send_msg( "begin_cinematic", var_0 );

    if ( isdefined( level._id_7148 ) )
    {
        pausecinematicingame( 0 );
        setsaveddvar( "cg_cinematicFullScreen", "1" );
        level._id_7148 = undefined;
    }
    else
        cinematicingame( var_0 );

    if ( !isdefined( var_2 ) || !var_2 )
        setsaveddvar( "cg_cinematicCanPause", "1" );

    wait 1;

    while ( iscinematicplaying() )
        wait 0.05;

    if ( !isdefined( var_2 ) || !var_2 )
        setsaveddvar( "cg_cinematicCanPause", "0" );

    if ( !isdefined( var_1 ) )
        maps\_audio::aud_send_msg( "end_cinematic", var_0 );
}

_id_714A()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = getaiarray( "axis" );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 istouching( var_0 ) && distance2d( var_4.origin, level.player.origin ) > 128 && !maps\_utility::_id_0B20( var_4 ) )
        {
            var_4 notify( "killanimscript" );
            var_4 delete();
            var_2++;
        }
    }

    self delete();
}

_id_714B()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( var_1 == level.player )
            maps\_utility::_id_1F61( "hint_heli_dmg" );
    }
}

_id_714C()
{
    level._id_5317 = common_scripts\utility::spawn_tag_origin();
    level._id_5317.origin = level.player.origin + ( 0.0, 0.0, 16.0 );
    level._id_5317 linkto( level.player );
}

_id_714D( var_0, var_1 )
{
    waittillframeend;
    self endon( "death" );

    if ( !isdefined( level._id_5317 ) )
        thread _id_714C();

    self allowedstances( "stand" );
    self.ignoreme = 1;
    self.fixednode = 1;
    self.goalradius = 70;
    self.combatmode = "ambush";
    maps\_utility::_id_260D();
    var_2 = common_scripts\utility::get_target_ent();
    self setgoalpos( var_2.origin );
    self waittill( "goal" );
    self useturret( var_2 );
    var_2 makeunusable();
    var_2 setturretteam( "axis" );

    if ( isdefined( var_2.target ) && isdefined( var_1 ) )
    {
        var_3 = getnode( var_2.target, "targetname" );
        thread _id_714E( var_3, var_1 );
    }

    var_2 turretfireenable();
    thread _id_531B( var_2, var_0, 1 );
    self setgoalpos( var_2.origin );
    var_2 setconvergencetime( 7, "yaw" );
    var_2 setconvergencetime( 3, "pitch" );
    var_2 setaispread( 8 );
    self waittill( "damage" );
    self.ignoreme = 0;
}

_id_714E( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_1 );
    self notify( "using_turret" );
    self setgoalnode( var_0 );
    self.goalradius = 4;
    self waittill( "goal" );
    self.goalradius = 512;
}

_id_5319( var_0, var_1 )
{
    waittillframeend;
    self endon( "death" );

    if ( !isdefined( level._id_5317 ) )
        thread _id_714C();

    self allowedstances( "stand" );
    self.ignoreme = 1;
    self.fixednode = 1;
    self.goalradius = 70;
    self.combatmode = "ambush";
    maps\_utility::_id_260D();
    var_2 = common_scripts\utility::get_target_ent();
    var_2 hidepart( "tag_ground" );
    self setgoalpos( var_2.origin );
    self waittill( "goal" );
    self useturret( var_2 );
    var_2 makeunusable();
    var_2 setturretteam( "axis" );
    var_2 setturretcanaidetach( 0 );

    if ( isdefined( var_1 ) )
    {
        var_2 turretfiredisable();
        thread _id_714F( var_2, var_0 );
    }
    else
    {
        var_2 turretfireenable();
        thread _id_531B( var_2, var_0 );
    }

    self setgoalpos( var_2.origin );
    maps\_utility::_id_262C( "mg_trigger" );
    wait 0.05;
    var_2 setconvergencetime( 7, "yaw" );
    var_2 setconvergencetime( 3, "pitch" );
    var_2 setaispread( 8 );
    self waittill( "damage" );
    self.ignoreme = 0;
}

_id_714F( var_0, var_1 )
{
    self notify( "using_turret" );
    self endon( "death" );
    self endon( "using_turret" );
    common_scripts\utility::flag_wait( var_1 );
    var_0 turretfireenable();
    var_0 setmode( "manual_ai" );
    var_0 settargetentity( level._id_5317 );
    wait(randomfloatrange( 4, 8 ));
    var_0 cleartargetentity();
    var_0 turretfiredisable();
    thread _id_714F( var_0, var_1 );
}

_id_531A( var_0, var_1, var_2 )
{
    self notify( "using_turret" );
    self endon( "death" );
    self endon( "using_turret" );
    var_0 setmode( "manual_ai" );
    var_0 settargetentity( level._id_5317 );
    wait(randomfloatrange( 4, 8 ));

    if ( isdefined( var_2 ) )
        thread _id_531A( var_0, var_1, var_2 );
    else
        thread _id_531B( var_0, var_1, var_2 );
}

_id_531B( var_0, var_1, var_2 )
{
    self notify( "using_turret" );
    self endon( "death" );
    self endon( "using_turret" );
    var_0 cleartargetentity();
    var_0 setmode( "auto_ai" );
    wait(randomfloatrange( 1, 4 ));

    if ( !isdefined( var_1 ) )
        thread _id_531A( var_0, undefined, var_2 );
    else if ( common_scripts\utility::flag( var_1 ) )
        thread _id_531A( var_0, var_1, var_2 );
    else
        thread _id_531B( var_0, var_1, var_2 );
}
#using_animtree("generic_human");

_id_7150( var_0 )
{
    self._id_0FC6 = randomfloatrange( 0.8, 1.2 );

    if ( !isai( self ) )
    {
        self._id_2044 = level._id_52AC[randomintrange( 0, level._id_52AC.size )];

        if ( self.weapon != "none" )
            maps\_utility::_id_24F5();

        if ( isdefined( self.script_noteworthy ) )
        {
            if ( self.script_noteworthy == "idle_on_goal" )
            {
                self._id_2018 = %civilain_crouch_hide_idle_loop;
                _id_539B( level._id_539C, 1 );
                thread _id_5201( var_0 );
                self endon( "death" );
                self waittill( "goal" );
                self._id_0EC3 = 1;
                self._id_0EC6 = 1;
                thread _id_5310();
            }
            else if ( self.script_noteworthy == "die_on_goal" )
                _id_539B( level._id_5E78 );
        }
    }
    else
    {
        self waittill( "goal" );
        self delete();
    }
}

_id_7151( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( isdefined( var_1 ) )
        self.ignoreall = 1;

    _id_539B( var_2, 1 );
    level waittill( var_0 );

    if ( isdefined( var_1 ) )
        self.ignoreall = 0;

    wait(randomfloatrange( 0, 0.1 ));
    self dodamage( self.health + 200, ( 0.0, 0.0, 0.0 ) );
}

_id_7152()
{
    thread _id_5201();
    self._id_0EC6 = 1;
    self endon( "death" );
    thread _id_5310();

    if ( isdefined( self.script_bulletshield ) )
        thread maps\_utility::_id_2611();

    if ( isdefined( self.target ) )
        var_0 = common_scripts\utility::get_target_ent();
    else
        var_0 = self;

    _id_5312( var_0.animation );
    _id_526F( var_0 );

    if ( isai( self ) && isdefined( self._id_530D ) )
        var_0 maps\_anim::_id_11C4( self, var_0.animation );

    if ( issubstr( var_0.animation, "door" ) )
    {
        var_1 = var_0 common_scripts\utility::get_target_ent();
        var_1 maps\_utility::_id_2629( "door_peek" );
        var_1._id_1032 = "door_peek";
        var_1 thread maps\_anim::_id_1246( var_1, var_0.animation + "_door" );
    }

    if ( issubstr( var_0.animation, "garage" ) )
    {
        var_1 = var_0 common_scripts\utility::get_target_ent();
        var_2 = anglestoforward( var_0.angles ) * -32;
        var_0.origin += var_2;
        var_1.origin += ( 0.0, 0.0, 51.013 );
        var_0 maps\_anim::_id_11C0( self, var_0.animation );

        if ( isdefined( var_0._id_1288 ) )
            common_scripts\utility::flag_wait( var_0._id_1288 );

        thread _id_7153( var_1 );
    }

    var_0 maps\_anim::_id_11C1( self, var_0.animation );
    self delete();
}

_id_7153( var_0 )
{
    wait 1;
    var_0 linkto( self, "TAG_WEAPON_CHEST" );
    self waittillmatch( "single anim", "end" );
    var_0 unlink();
}

_id_7154()
{
    var_0 = self.spawner;
    self._id_0FC6 = randomfloatrange( 0.8, 1.2 );
    self._id_2044 = level._id_52AC[randomintrange( 0, level._id_52AC.size )];
    _id_539B( level._id_5E78 );
    self waittill( "death" );

    if ( !common_scripts\utility::flag( "regroup_drone_stop_loopers" ) )
        var_0 maps\_utility::_id_166F();
}

_id_7155( var_0 )
{
    thread _id_5201( var_0 );
    self._id_0EC6 = 1;
    self endon( "death" );
    thread _id_5310();

    if ( isdefined( self.script_bulletshield ) )
        thread maps\_utility::_id_2611();

    if ( isdefined( self.target ) )
        var_1 = common_scripts\utility::get_target_ent();
    else
        var_1 = self;

    _id_526F( var_1 );
    _id_5312( var_1.animation );
    var_1 maps\_anim::_id_11C1( self, var_1.animation );

    if ( isdefined( var_1._id_205B ) )
        self._id_0D50 = maps\_utility::_id_270F( var_1._id_205B );

    if ( isdefined( var_1._id_2057 ) )
        common_scripts\utility::flag_set( var_1._id_2057 );

    if ( isdefined( self._id_164F ) && self._id_164F == "idle_self" )
        maps\_anim::_id_11C8( self, var_1.animation + "_idle" );
    else
        var_1 maps\_anim::_id_11C8( self, var_1.animation + "_idle" );
}

_id_7156( var_0 )
{
    thread _id_5201( var_0 );
    self._id_0EC6 = 1;
    self endon( "death" );
    thread _id_5310();

    if ( isdefined( self.target ) )
        var_1 = common_scripts\utility::get_target_ent();
    else
        var_1 = self;

    if ( isdefined( self.script_bulletshield ) )
        thread maps\_utility::_id_0D04();

    self._id_0D50 = maps\_utility::_id_270F( var_1.animation + "_death" );
    _id_5312( var_1.animation );
    _id_526F( var_1 );
    thread _id_5249();

    if ( issubstr( var_1.animation, "crawl" ) )
    {
        self.a = spawnstruct();
        self.a._id_0D26 = "prone";
        maps\_utility::delaythread( 0.1, animscripts\pain::_id_0D57 );
    }

    var_1 maps\_anim::_id_11C1( self, var_1.animation );

    if ( isdefined( self.script_bulletshield ) )
        maps\_utility::_id_1902();

    self._id_0EC6 = 1;
    self kill();
}

_id_7157( var_0 )
{
    self waittill( "trigger" );
    var_1 = getentarray( self.target, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = common_scripts\utility::getstructarray( var_3.script_noteworthy, "targetname" );

        foreach ( var_6 in var_4 )
        {
            var_3.origin = var_6.origin;
            var_3.angles = var_6.angles;

            if ( isdefined( var_6.target ) )
                var_3.target = var_6.target;

            var_7 = var_3 maps\_utility::_id_166F( 1 );
            var_7.script = "drone";
            _id_53B4( var_7 );
            var_7._id_0EC3 = 1;
            var_7._id_0EC6 = 1;
            var_7 thread _id_5310();

            if ( isdefined( var_6.script_bulletshield ) )
                var_7 thread maps\_utility::_id_2611();

            var_7 thread _id_5201( var_0 );
            var_7 thread _id_526F( var_6 );

            if ( isdefined( var_6._id_205B ) )
                var_7._id_0D50 = maps\_utility::_id_270F( var_6._id_205B );

            if ( isdefined( var_6.script_noteworthy ) )
            {
                if ( var_6.script_noteworthy == "explosion_death" )
                {

                }
                else
                {
                    var_7 thread maps\_drone::_id_2036( var_6.script_noteworthy, var_6 );

                    if ( issubstr( var_6.animation, "death" ) )
                    {
                        var_7._id_0D50 = maps\_utility::_id_270F( var_6.animation );

                        if ( issubstr( var_6.animation, "stagger" ) )
                            var_7 thread _id_53B8();
                    }
                }
            }

            if ( isdefined( var_6.animation ) )
            {
                if ( issubstr( var_6.animation, "prague_resistance_cover" ) )
                    var_7 thread _id_7158( var_6 );
                else if ( !isdefined( var_6.script_noteworthy ) || var_6.script_noteworthy == "explosion_death" )
                {
                    var_7 _id_5312( var_6.animation );

                    if ( isdefined( var_6.script_delay ) && var_6.script_delay == 0 )
                        var_6 thread maps\_anim::_id_11C8( var_7, var_6.animation );
                    else
                        var_6 maps\_utility::delaythread( randomfloatrange( 0, 1 ), maps\_anim::_id_11C8, var_7, var_6.animation );
                }
            }

            var_3.target = undefined;
        }
    }
}

_id_7158( var_0 )
{
    self endon( "death" );

    if ( issubstr( var_0.animation, "_l" ) && !issubstr( var_0.animation, "_l2r" ) )
        var_1 = "_l";
    else
        var_1 = "_r";

    var_2 = [ "prague_resistance_cover_idle_once", "prague_resistance_cover_shoot" ];
    var_3 = randomintrange( 0, var_2.size );
    var_0 thread maps\_anim::_id_11C8( self, "prague_resistance_cover_idle" + var_1 );

    if ( isdefined( var_0._id_1288 ) )
        common_scripts\utility::flag_wait( var_0._id_1288 );

    var_0 maps\_utility::script_delay();
    var_0 notify( "stop_loop" );

    for (;;)
    {
        var_0 maps\_anim::_id_11C1( self, var_2[var_3] + var_1 );
        var_3 += 1;
        var_3 %= var_2.size;
    }
}

_id_53A7()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::get_target_ent();
    var_1 = common_scripts\utility::getstructarray( var_0.script_noteworthy, "script_noteworthy" );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        var_5 = var_0 maps\_utility::_id_166F();
        var_5.origin = var_4.origin;
        var_5.angles = var_4.angles;
        var_5 setcandamage( 0 );
        var_6 = level._id_0C59["generic"][var_4.animation];

        if ( isarray( var_6 ) )
            var_6 = var_6[0];

        var_5 _id_5312( var_4.animation );
        var_5 animscripted( "endanim", var_4.origin, var_4.angles, var_6 );

        if ( isdefined( var_4._id_164F ) )
        {
            if ( var_4._id_164F == "notsolid" )
                var_5 notsolid();
        }

        if ( issubstr( var_4.animation, "death" ) )
            var_5 common_scripts\utility::delaycall( 0.05, ::setanimtime, var_6, 1.0 );

        var_2[var_2.size] = var_5;
    }

    var_8 = var_0 common_scripts\utility::get_target_ent();
    var_8 waittill( "trigger" );
    common_scripts\utility::array_thread( var_2, maps\_utility::_id_2705 );
}

_id_539B( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_539C;

    self._id_0D50 = var_0[randomintrange( 0, var_0.size )];
    self._id_0EC6 = 1;

    if ( !isdefined( var_1 ) )
        self notsolid();

    if ( !isdefined( self._id_0FC6 ) )
        self._id_0FC6 = 1.0;

    var_2 = self._id_0FC6;
    self._id_0FC6 = randomfloatrange( var_2 * 0.8, var_2 );
    thread _id_5249();
}

_id_5249()
{
    common_scripts\utility::waittill_either( "death", "damage" );

    if ( !isdefined( self ) || isdefined( self._id_5328 ) )
        return;

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

_id_5312( var_0 )
{
    if ( maps\_utility::_id_0AD1( level._id_5313, var_0 ) && self.weapon != "none" )
        maps\_utility::_id_24F5();
    else if ( !isai( self ) )
    {
        self.script = "drone";
        _id_53B4( self );
    }
}

_id_53B4( var_0 )
{
    var_0._id_2037 = undefined;
    var_1 = randomintrange( 1, 4 );

    if ( var_1 == 1 )
        var_0._id_2037 = "drone_ak47_fire_npc";
    else if ( var_1 == 2 )
        var_0._id_2037 = "drone_g36c_fire_npc";

    if ( var_1 == 3 )
        var_0._id_2037 = "drone_fnp90_fire_npc";
}

_id_5310()
{
    self waittill( "death", var_0 );

    if ( self.type == "civilian" )
    {
        if ( isdefined( var_0 ) && var_0 == level.player )
        {
            if ( !isalive( level.player ) )
                return;

            if ( isdefined( level._id_16C9 ) && level._id_16C9 )
                return;

            setsaveddvar( "hud_missionFailed", 1 );

            if ( isdefined( level.player._id_1EF4 ) )
                return;

            setdvar( "ui_deadquote", &"SCRIPT_MISSIONFAIL_CIVILIAN_KILLED" );
            setblur( 30, 2 );
            maps\_utility::_id_1826();
        }
    }
}

_id_5201( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "level_cleanup";

    self endon( "death" );
    level waittill( var_0 );

    if ( isdefined( self._id_0D04 ) && self._id_0D04 )
        maps\_utility::_id_1902();

    self delete();
}

_id_526F( var_0 )
{
    if ( !isdefined( var_0._id_164F ) )
        return;

    if ( issubstr( var_0._id_164F, "notsolid" ) )
        self notsolid();

    if ( issubstr( var_0._id_164F, "cold_breath" ) )
    {
        self.a = spawnstruct();
        self.a._id_0D2B = "stop";
        thread animscripts\utility::_id_24A1();
    }
}

_id_53B8()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    var_0 = getanimlength( self._id_0D50 ) * 0.3;
    _id_53B9( var_0 );
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
