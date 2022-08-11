// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7D08()
{
    maps\_shg_common::move_player_to_start( "flashback_airport_player" );

    if ( !isdefined( level.player ) )
    {
        level.player = getentarray( "player", "classname" )[0];
        level.player._id_1032 = "player_rig";
    }

    common_scripts\utility::flag_set( "start_betray_me_scene" );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_airport", 0 );
    maps\prague_escape_code::_id_7A5D();
    level.player enabledeathshield( 1 );
    level.player takeallweapons();
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level._id_7C85 = newclienthudelem( level.player );
    level._id_7C85.horzalign = "fullscreen";
    level._id_7C85.vertalign = "fullscreen";
    level._id_7C85 setshader( "overlay_flashback_blur", 640, 480 );
    level._id_7C85.archive = 1;
    level._id_7C85.sort = 10;
    maps\_utility::_id_265A();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7D09()
{
    common_scripts\utility::flag_init( "FLAG_adsing" );
    common_scripts\utility::flag_init( "start_betray_me_scene" );
    common_scripts\utility::flag_init( "FLAG_betray_me_scene_paused" );
    common_scripts\utility::flag_init( "FLAG_betray_me_scene_finished" );
    common_scripts\utility::flag_init( "start_gunshot_blackout" );
    common_scripts\utility::flag_init( "FLAG_airport_player_collapsed_in_elevator" );
    common_scripts\utility::flag_init( "makarov_shoots_yuri" );
    common_scripts\utility::flag_init( "start_elevator_hand" );
    common_scripts\utility::flag_init( "player_hits_button" );
    common_scripts\utility::flag_init( "FLAG_airport_player_exits_elevator" );
    common_scripts\utility::flag_init( "player_grabbed_pistol" );
    common_scripts\utility::flag_init( "start_blackout_anim" );
    common_scripts\utility::flag_init( "open_elevator_doors" );
    common_scripts\utility::flag_init( "close_elevator_doors" );
    common_scripts\utility::flag_init( "stairs_go_up" );
    common_scripts\utility::flag_init( "setup_emt_anim" );
    common_scripts\utility::flag_init( "emt_begin" );
    common_scripts\utility::flag_init( "emt_end" );
    common_scripts\utility::flag_init( "play_hand_print" );
    common_scripts\utility::flag_init( "stop_hand_print" );
    common_scripts\utility::flag_init( "play_falling_tiles" );
    common_scripts\utility::flag_init( "elevator_is_up" );
    common_scripts\utility::flag_init( "FLAG_airport_player_blackout_at_end" );
    common_scripts\utility::flag_init( "FLAG_airport_player_blackout_ended" );
    common_scripts\utility::flag_init( "good_state_heart" );
    common_scripts\utility::flag_init( "mild_state_heart" );
    common_scripts\utility::flag_init( "bad_state_heart" );
    common_scripts\utility::flag_init( "mak_betray_dialog_02" );
    common_scripts\utility::flag_init( "mak_betray_dialog_03" );
    common_scripts\utility::flag_init( "mak_betray_dialog_04" );
    common_scripts\utility::flag_init( "mak_betray_dialog_05" );
    common_scripts\utility::flag_init( "start_emt_dialogue" );
    setdvarifuninitialized( "pause", 0 );
}

_id_7D0A()
{
    level.player shellshock( "prague_escape_flashback", 10 );
    thread maps\_utility::_id_194E( "prague_flashback_airportgarage" );
    maps\_autosave::_id_1C3F();
    var_0 = getent( "button_off", "targetname" );
    var_0 show();
    var_1 = getent( "button_on", "targetname" );
    var_1 hide();
    level.player enabledeathshield( 1 );
    level.player takeallweapons();
    level.player allowsprint( 0 );
    level.player allowjump( 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player maps\_utility::_id_2797( 40 );
    level.player._id_7D04 = 0.4;
    _id_7D0B();
    _id_7D0F();
    _id_75B7();
    common_scripts\utility::flag_wait( "emt_end" );
}

_id_7D0B()
{
    var_0 = getent( "ai_airport_kiril", "targetname" );
    var_1 = getent( "ai_airport_lev", "targetname" );
    var_2 = getent( "airport_makarov", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_7D0E );
    var_1 maps\_utility::add_spawn_function( ::_id_7D0E );
    var_2 maps\_utility::add_spawn_function( ::_id_7D0E );
    level._id_7D0C = var_0 maps\_utility::_id_166F( 1 );
    level._id_7D0D = var_1 maps\_utility::_id_166F( 1 );
    level._id_59A6 = var_2 maps\_utility::_id_166F( 1 );
    level._id_7D0C._id_1032 = "kiril";
    level._id_7D0D._id_1032 = "lev";
    level._id_59A6._id_1032 = "makarov";
    level._id_59A6 maps\_utility::_id_24F5();
    level._id_59A6 maps\_utility::_id_104A( "deserteagle", "primary" );
    thread _id_00CE();
}

_id_00CE()
{
    wait 0.1;
    level._id_7D0C hidepart_allinstances( "tag_weapon" );
    level._id_7D0C hidepart_allinstances( "tag_sight_on" );
    level._id_7D0D hidepart_allinstances( "tag_weapon" );
    level._id_7D0D hidepart_allinstances( "tag_sight_on" );
    level._id_7D0D hidepart_allinstances( "tag_clip" );
}

_id_7D0E()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.goalradius = 32;
}

_id_7D0F()
{
    thread _id_7D55();
    var_0 = common_scripts\utility::getstruct( "anim_align_elevator", "targetname" );
    level._id_51F2 = maps\_utility::_id_1287( "player_rig_airport", level.player.origin );
    level._id_51F2.angles = level.player getplayerangles();
    level._id_51F2._id_1032 = "player_rig";
    var_1 = [ level._id_59A6, level._id_7D0C, level._id_7D0D, level._id_51F2 ];
    var_0 maps\_anim::_id_11BF( var_1, "betray_me" );
    common_scripts\utility::flag_wait( "start_betray_me_scene" );
    setdvar( "pause", 0 );
    level.player lerpfov( 60, 0.05 );
    level.player.ignoreme = 1;
    thread maps\prague_escape_code::_id_7A60();
    maps\_utility::delaythread( 3.0, maps\_utility::_id_1428, "prague_escape_airport_makarov_intro" );
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 15, 15, 10, 0, 1 );
    level.player common_scripts\utility::delaycall( 10, ::lerpviewangleclamp, 3, 1.5, 1.5, 0, 0, 0, 0 );
    level.player common_scripts\utility::delaycall( 13.05, ::lerpviewangleclamp, 0, 0.05, 0.05, 15, 15, 10, 0 );
    thread _id_7D16();
    thread _id_7D15();
    thread _id_7D12();
    level.player thread maps\_utility::play_sound_on_entity( "ch_pragueb_15_1_betray_me_makarov" );
    var_0 maps\_anim::_id_11DD( var_1, "betray_me" );

    if ( common_scripts\utility::flag( "FLAG_betray_me_scene_paused" ) )
        level waittill( "forever" );

    common_scripts\utility::array_thread( var_1, maps\_utility::_id_2705 );
    common_scripts\utility::flag_set( "FLAG_betray_me_scene_finished" );
    var_2 = getent( "e_airport_stream_ent", "targetname" );
    var_2 delete();
}

_id_7D12()
{
    var_0 = gettime();

    while ( !common_scripts\utility::flag( "FLAG_betray_me_scene_finished" ) && !getdvarint( "pause", 0 ) )
        wait 0.05;

    if ( common_scripts\utility::flag( "FLAG_betray_me_scene_finished" ) || !isdefined( level._id_51F2 ) )
        return;

    common_scripts\utility::flag_set( "FLAG_betray_me_scene_paused" );
    var_1 = gettime();
    level notify( "LISTEN_end_script" );
    maps\prague_escape_code::_id_7A4C( 0.05 );
    maps\prague_escape_code::_id_7A4F();
    maps\prague_escape_code::_id_7A50();
    var_2 = ( var_1 - var_0 ) / 1000;
    thread _id_5F9E::_id_5F9C( level._id_51F2, var_2, "betray_me" );
    var_3 = getent( "airport_makarov", "targetname" );
    thread _id_5F9E::_id_5F9D( level._id_59A6, var_3, var_2, "betray_me" );
    var_3 = getent( "ai_airport_kiril", "targetname" );
    thread _id_5F9E::_id_5F9D( level._id_7D0C, var_3, var_2, "betray_me" );
    var_3 = getent( "ai_airport_lev", "targetname" );
    thread _id_5F9E::_id_5F9D( level._id_7D0D, var_3, var_2, "betray_me" );
}

_id_7D13( var_0 )
{
    level.player maps\_utility::play_sound_on_entity( "prague_escape_yri_groanexert" );
}

_id_7D14( var_0 )
{
    level.player maps\_utility::play_sound_on_entity( "prague_escape_yri_groanpain" );
}

_id_7D15()
{
    level endon( "LISTEN_end_script" );
    wait 1;
    level.player playrumbleonentity( "damage_heavy" );
    wait 1.5;
    level.player playrumbleonentity( "damage_heavy" );
    wait 1.5;
    level.player playrumbleonentity( "damage_heavy" );
    wait 1.5;
    level.player playrumbleonentity( "damage_heavy" );
    common_scripts\utility::flag_wait( "makarov_shoots_yuri" );
    level.player thread maps\_utility::play_sound_on_entity( "prague_escape_yri_groanpain" );
    playfxontag( common_scripts\utility::getfx( "desert_eagle_flash" ), level._id_59A6, "tag_flash" );
    var_0 = common_scripts\utility::getstruct( "makarov_bullet_start", "targetname" );
    magicbullet( "deserteagle", var_0.origin, level.player.origin + ( 0.0, 0.0, 40.0 ) );
    level.player dodamage( 99, var_0.origin );
    level.player playrumbleonentity( "grenade_rumble" );
    _id_7D17();
    wait 1;
    level.player thread maps\_utility::play_sound_on_entity( "breathing_hurt" );
    _id_7D17();
    wait 1;
    _id_7D17();
}

_id_7D16()
{
    level endon( "LISTEN_end_script" );
    maps\prague_escape_code::_id_7A4B( "black" );
    maps\prague_escape_code::_id_7A4C( 2.5 );
    common_scripts\utility::flag_wait( "start_gunshot_blackout" );
    level.player dodamage( 200, level.player.origin );
    level.player playrumbleonentity( "grenade_rumble" );
    level.player thread maps\_utility::play_sound_on_entity( "breathing_hurt" );
    wait 5;
    level.player setblurforplayer( 3, 2 );
    maps\prague_escape_code::_id_7A4F();
}

_id_7D17( var_0 )
{
    maps\prague_escape_code::_id_7A4B( "black" );
    maps\prague_escape_code::_id_7A4C( 0.5 );
    level.player setblurforplayer( 3, 2 );
    maps\prague_escape_code::_id_7A4F();
    maps\prague_escape_code::_id_7A4C( 1 );
    maps\prague_escape_code::_id_7A50();
    level.player setblurforplayer( 0, 4 );
}

_id_7D18( var_0 )
{
    maps\prague_escape_code::_id_7A4B( "black" );
    maps\prague_escape_code::_id_7A4C( 0.5 );
    level.player setblurforplayer( 3, 2 );
    maps\prague_escape_code::_id_7A4F();
    maps\prague_escape_code::_id_7A4C( 2.5 );
    wait 1;
    maps\prague_escape_code::_id_7A50();
    level.player setblurforplayer( 0, 4 );
}

_id_75B7()
{
    thread _id_7D45();
    thread _id_7D51();
    thread _id_7D31();
    thread maps\prague_escape_flashback_airport_code::_id_7CF0();
    thread maps\prague_escape_flashback_airport_code::_id_7CF1();
    thread maps\prague_escape_flashback_airport_code::_id_7CF2();
    var_0 = getent( "airport_elevator", "targetname" );
    var_1 = common_scripts\utility::getstruct( "anim_align_elevator", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin );
    level._id_53C3 = spawn( "script_origin", var_0.origin );
    level._id_53C3.angles = var_0.angles;
    level._id_51F2 = maps\_utility::_id_1287( "player_rig_airport", level.player.origin );
    level._id_51F2.angles = level.player getplayerangles();
    level._id_51F2._id_1032 = "player_rig";
    level._id_51F2 dontcastshadows();
    level._id_51F2 hide();
    var_0 linkto( level._id_53C3 );
    level._id_51F2 linkto( level._id_53C3 );
    var_2 linkto( level._id_53C3 );
    thread _id_7D19();
    level.player maps\prague_escape_flashback_airport_code::_id_7D01();
    level.player thread maps\prague_escape_flashback_airport_code::_id_4BCB();
    thread _id_7D1A();
    _id_7D1E();
    common_scripts\utility::flag_wait( "elevator_is_up" );
    thread _id_7D29();
    _id_7D24();
    thread _id_7D3C();
    thread _id_7D39();
    _id_7D28();
    level.player notify( "LISTEN_end_player_limp" );

    if ( common_scripts\utility::flag( "FLAG_airport_player_blackout_at_end" ) )
        return;

    common_scripts\utility::flag_set( "FLAG_airport_player_exits_elevator" );
    thread _id_7D3D();
    thread _id_7D3A();
    thread _id_7D40();
    wait 0.5;
    var_2 notify( "stop_loop" );
    thread _id_02F3();
    var_2 thread maps\_anim::_id_1246( level._id_51F2, "elevator_crawl_out" );
    thread maps\_utility::_id_194E( "prague_flashback_airportterminal" );
    wait 0.25;
    var_3 = 1.0;
    level.player playerlinktoblend( level._id_51F2, "tag_player", var_3, var_3 * 0.5, var_3 * 0.5 );
    wait(var_3);
    level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 15, 15, 10, 10, 1 );
    level._id_51F2 show();
    level._id_51F2 castshadows();
    var_4 = getanimlength( level._id_51F2 maps\_utility::_id_1281( "elevator_crawl_out" ) );
    wait(var_4 - var_3 - 0.25);
    level._id_51F2 delete();
    objective_add( maps\_utility::_id_2816( "OBJ_STOP_MASSACRE" ), "current", &"PRAGUE_ESCAPE_STOP_MASSACRE" );
    common_scripts\utility::flag_set( "player_grabbed_pistol" );
    level.player unlink();
    level.player allowads( 1 );
    level.player enableweapons();
    level.player setviewmodel( "viewhands_yuri_airport" );
    level.player giveweapon( "p99_airport_flashback" );
    level.player switchtoweapon( "p99_airport_flashback" );
    level.player setweaponammoclip( "p99_airport_flashback", 12 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "cg_drawCrosshair", 1 );
    thread _id_7D3B();
    _id_7D2E();
    thread _id_7D2F();
}

_id_7D19()
{
    level.player freezecontrols( 1 );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_airport_crawl_to_elevator", 0 );
    wait 2.0;
    level.player freezecontrols( 0 );
    maps\prague_escape_code::_id_7A50();
    level.player setblurforplayer( 0, 4 );
}

_id_7D1A()
{
    var_0 = maps\_utility::_id_283B( "airport_makarov_exit_elevator_sound_spot", "targetname" );
    level.player maps\_utility::play_sound_on_entity( "prague_escape_radio_crawl" );
}

_id_7D1B()
{
    var_0 = [ [ "prague_escape_ru_conv4_2", 0.5 ], [ "prague_escape_ru_conv6_3", 0 ], [ "prague_escape_ru_conv4_5", 1.0 ], [ "prague_escape_ru_conv9_2", 0 ], [ "prague_escape_ru_conv9_4", 1.0 ], [ "prague_escape_ru_conv1_1", 0.5 ], [ "prague_escape_ru_conv2_6", 1.0 ], [ "prague_escape_ru_conv4_1", 0 ], [ "prague_escape_ru_conv4_9", 1.0 ], [ "prague_escape_ru_conv4_8", 0 ], [ "prague_escape_ru_conv4_4", 1.0 ], [ "prague_escape_ru_conv4_18", 0.5 ], [ "prague_escape_ru_conv4_14", 0.25 ], [ "prague_escape_ru_conv4_16", 1.0 ], [ "prague_escape_ru_conv2_1", 0.25 ], [ "prague_escape_ru_conv8_4", 1.0 ] ];

    for ( var_1 = 0; !common_scripts\utility::flag( "FLAG_airport_player_collapsed_in_elevator" ); var_1++ )
    {
        var_1 %= var_0.size;
        level.player maps\_utility::play_sound_on_entity( var_0[var_1][0] );
        wait(var_0[var_1][1]);
    }
}

_id_7D1C()
{
    while ( !common_scripts\utility::flag( "FLAG_airport_player_collapsed_in_elevator" ) )
    {
        level.player maps\_utility::play_sound_on_entity( "prague_escape_elevator_pass_floor_beep" );
        wait 1.0;
    }
}

_id_7D1D()
{
    var_0 = [ "weap_m203_chamber_open_plr", "weap_ak74_clift_plr", "weap_mg36_lift_plr", "weap_sa80_lift_plr", "weap_mp7_lift_plr", "weap_p90_lift_plr", "weap_glock_first_lift_chamber_plr", "weap_mk46_chamber_plr", "weap_m60_chamber_plr", "weap_smaw_raise_plr", "weap_smaw_drop_plr", "weap_miniuzi_clipin_plr", "weap_m60_clipin_plr", "weap_m16_clipout_plr", "weap_mg36_clipout_plr" ];
    var_0 = maps\_utility::_id_0B53( var_0 );

    while ( !common_scripts\utility::flag( "FLAG_airport_player_collapsed_in_elevator" ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !common_scripts\utility::flag( "FLAG_airport_player_collapsed_in_elevator" ) )
                level.player maps\_utility::play_sound_on_entity( var_2 );
        }
    }
}

_id_7D1E()
{
    level.player maps\_utility::_id_13DC( "FLAG_player_heartbeat_sound" );
    level.player setviewkickscale( 0 );
    level._id_7D1F = maps\_utility::_id_1287( "player_rig_airport_alt", level.player.origin );
    level._id_7D1F.angles = level.player getplayerangles();
    level._id_7D1F._id_1032 = "player_rig";
    level.player playerlinktodelta( level._id_7D1F, "tag_player", 1, 0, 0, 0, 0, 1 );
    var_0 = maps\_utility::_id_283B( "airport_align_to_elevator", "targetname" );
    var_1 = [ maps\prague_escape_flashback_airport_code::_id_7CF4, maps\prague_escape_flashback_airport_code::_id_7CF3 ];
    var_2 = [ "HINT_crawl_left", "HINT_crawl_right" ];
    var_3 = spawnstruct();
    thread maps\prague_escape_flashback_airport_code::_id_7CF5( var_3, var_1, var_2 );
    level notify( "stop_heart" );
    var_4 = 0;

    for ( var_5 = 1; var_5 < 7; var_5++ )
    {
        var_0 thread maps\_anim::_id_11D6( [ level._id_7D1F ], "gun_crawl_0" + var_5 + "_idle", "stop_crawl" );
        var_6 = maps\prague_escape_flashback_airport_code::_id_7CF9( var_1, var_3, var_4 );
        var_0 notify( "stop_crawl" );
        var_7 = randomfloatrange( 0.9, 1.1 );
        earthquake( 0.16, var_7, level.player.origin, 5000 );
        var_8 = getanimlength( level._id_7D1F maps\_utility::_id_1281( "gun_crawl_0" + var_5 ) );
        maps\_utility::delaythread( var_8 - 0.25, maps\prague_escape_flashback_airport_code::_id_7CF8 );
        var_4++;
        var_4 %= var_1.size;

        if ( var_6 )
        {
            maps\prague_escape_flashback_airport_code::_id_09FA( 0.5 );
            level.player.health = 100;
            level.player maps\_utility::_id_13DE( "FLAG_player_heartbeat_sound" );
            common_scripts\utility::flag_set( "FLAG_attack_button_pressed" );
            common_scripts\utility::flag_set( "FLAG_ads_button_pressed" );
            wait 1.5;
            common_scripts\utility::flag_clear( "FLAG_attack_button_pressed" );
            common_scripts\utility::flag_clear( "FLAG_ads_button_pressed" );
            break;
        }

        if ( var_5 != 6 )
        {
            level.player dodamage( 50, level.player.origin );
            var_0 maps\_anim::_id_11DD( [ level._id_7D1F ], "gun_crawl_0" + var_5 );
            continue;
        }

        var_0 thread maps\_anim::_id_11DD( [ level._id_7D1F ], "gun_crawl_0" + var_5 );
        level.player thread maps\_utility::play_sound_on_entity( "prague_escape_yri_groanexert2" );
        wait 0.05;
        maps\prague_escape_flashback_airport_code::_id_09FA( 0.5 );
        level.player.health = 100;
        level.player maps\_utility::_id_13DE( "FLAG_player_heartbeat_sound" );
        wait 1.5;
    }

    level.player thread maps\prague_escape_flashback_airport_code::_id_51E2();
    common_scripts\utility::flag_set( "FLAG_airport_player_collapsed_in_elevator" );
    thread _id_7D20();
    level._id_7D1F hide();
    wait 9.0;
}

_id_7D20()
{
    maps\_utility::_id_1427( 1.0 );
    wait 1.0;
    level.player thread maps\_utility::play_sound_on_entity( "prague_escape_elevator_reach_floor_ring" );
    wait 3.5;
    level.player maps\_utility::play_sound_on_entity( "prague_escape_mkv_no_russian" );
    wait 2.0;
    var_0 = getent( "airport_in_elevator_sound_spot", "targetname" );
    thread _id_7D21( "weap_ak47_fire_npc", var_0, 3, 3, 0.085 );
    maps\_utility::delaythread( 0.75, ::_id_7D22, var_0 );
    maps\_utility::delaythread( 1.5, ::_id_7D21, "weap_m240_fire_npc", var_0, 3, 3, 0.075 );
    maps\_utility::delaythread( 2.0, ::_id_7D21, "weap_shotgunattach_fire_npc", var_0, 3, 7, 0.5, 1.5 );
    common_scripts\utility::flag_wait( "FLAG_airport_player_exits_elevator" );
    var_1 = maps\_utility::_id_283B( "airport_exit_elevator_sound_spot", "targetname" );
    var_0 moveto( var_1.origin, 10.0 );
    common_scripts\utility::flag_wait( "FLAG_airport_player_blackout_ended" );
    var_0 stopsounds();
}

_id_7D21( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_2 = _id_5F9E::_id_5F0F( var_2, 0.05 );
    var_3 = _id_5F9E::_id_5F0F( var_3, 0.05 );
    var_4 = common_scripts\utility::ter_op( isdefined( var_4 ), var_4, 0.05 );
    var_5 = common_scripts\utility::ter_op( isdefined( var_5 ), var_5, 0.05 );
    var_5 = common_scripts\utility::ter_op( var_4 != var_5 && var_4 > var_5, var_4 + 0.05, var_5 );

    while ( !common_scripts\utility::flag( "FLAG_airport_player_blackout_ended" ) )
    {
        var_6 = var_4;
        var_7 = 0;

        while ( var_7 < var_2 && !common_scripts\utility::flag( "FLAG_airport_player_blackout_ended" ) )
        {
            var_8 = gettime();
            var_1 thread maps\_utility::play_sound_on_entity( var_0 );

            if ( var_4 != var_5 )
                var_6 = randomfloatrange( var_4, var_5 );

            var_7 += ( var_6 + ( gettime() - var_8 ) * 1000 );
            wait(var_6);
        }

        wait(var_3);
    }
}

_id_7D22( var_0 )
{
    while ( !common_scripts\utility::flag( "FLAG_airport_player_blackout_ended" ) )
        var_0 maps\_utility::play_sound_on_entity( "prague_escape_airport_civ_scream", "LISTEN_stop_sounds" );
}

_id_7D24()
{
    thread maps\_utility::_id_1428( "prague_escape_airport_elevator", 1 );
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_airport_exit_elevator", 0 );
    var_0 = maps\_utility::_id_283B( "airport_align_to_exit_elevator", "targetname" );
    level._id_7D1F.origin = var_0.origin;
    level._id_7D1F.angles = var_0.angles;
    level.player playerlinktodelta( level._id_7D1F, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player lerpfov( 65, 0.05 );
    thread maps\_utility::_id_194E( "prague_flashback_airportelevator" );
    var_1 = 1.0;
    level._id_7D1F _id_5F9E::_id_5F9B( level._id_7D1F maps\_utility::_id_1281( "wakeup" ), "root", 1.0, 0, var_1 );
    wait 0.05;
    var_2 = 0.6;
    level._id_7D1F setanimtime( level._id_7D1F maps\_utility::_id_1281( "wakeup" ), var_2 );
    level._id_7D1F show();
    maps\prague_escape_flashback_airport_code::_id_17CC( 1.25 );
    level.player maps\_utility::_id_13DC( "FLAG_player_heartbeat_sound" );
    maps\_utility::delaythread( 2.0, ::_id_7D2D );
    level.player maps\_utility::delaythread( 1.0, maps\_utility::play_sound_on_entity, "prague_escape_yri_groanexert" );
    maps\_utility::delaythread( 3.5, ::_id_7D25 );
    maps\_utility::delaythread( 4.5, ::_id_7D27 );
    var_3 = ( 1 - var_2 ) * getanimlength( level._id_7D1F maps\_utility::_id_1281( "wakeup" ) );
    wait(_id_5F9E::_id_5F0F( var_3 / var_1 - 4.0, 0 ));
    common_scripts\utility::flag_set( "open_elevator_doors" );
    var_4 = maps\_utility::_id_283B( "airport_elevator_walkup_end", "targetname" );
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5.origin = var_4.origin;
    var_5.angles = var_4.angles;
    var_6 = 1.0;
    level.player playerlinktoblend( var_5, "tag_origin", var_6, var_6 * 0.5, var_6 * 0.5 );
    wait(var_6);
    level.player playerlinktodelta( var_5, "tag_origin", 1, 0, 0, 0, 0 );
    level.player unlink();
    var_5 delete();
    level._id_7D1F delete();
}

_id_7D25()
{
    var_0 = "head_city_civ_female_a_drone";
    var_1 = maps\_utility::_id_283B( "airport_civ_falling_dead", "targetname" );
    var_2 = maps\_utility::_id_1287( "falling_civ", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 attach( var_0, "", 1 );
    var_2 thread maps\_anim::_id_1246( var_2, "death" );
    wait 0.5;
    var_3 = _id_5F9E::_id_5F52( "airport_shoot_civ_falling_dead" );
    thread _id_7D26( var_3[0].origin, var_3[1].origin );
    var_4 = spawn( "script_model", var_2 gettagorigin( "j_head" ) );
    var_4.angles = var_2 gettagangles( "j_head" ) + ( 25.0, 180.0, 0.0 );
    var_4 setmodel( "tag_origin" );
    var_4 linkto( var_2, "j_head" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "FX_airport_civ_headshot_impact" ), var_4, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "FX_airport_civ_headshot_trail" ), var_4, "tag_origin" );
}

_id_7D26( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        magicbullet( "ak74u", var_0, var_1 );
        wait 0.1;
    }
}

_id_7D27()
{
    var_0 = "head_city_civ_male_a_drone";
    var_1 = maps\_utility::_id_283B( "airport_civ_crawling_dead", "targetname" );
    var_2 = maps\_utility::_id_1287( "crawling_civ", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 attach( var_0, "", 1 );
    var_3 = getanimlength( var_2 maps\_utility::_id_1281( "crawl" ) );
    var_2 thread maps\_anim::_id_1246( var_2, "crawl" );
    var_2 maps\_utility::delaythread( var_3, maps\_anim::_id_1246, var_2, "death" );
    var_4 = 0.25;
    var_5 = common_scripts\utility::getfx( "crawling_death_blood_smear" );

    for ( var_6 = 0; var_6 < var_3; var_6 += var_4 )
    {
        var_7 = var_2 gettagorigin( "J_SpineLower" );
        var_8 = var_2 gettagangles( "tag_origin" );
        var_9 = anglestoright( var_8 );
        var_10 = anglestoforward( ( 270.0, 0.0, 0.0 ) );
        playfx( var_5, var_7, var_10, var_9 );
        wait(var_4);
    }

    wait(_id_5F9E::_id_5F0F( var_3 - var_6, 0 ));
}

_id_7D28()
{
    var_0 = getent( "airport_player_exit_elevator_trigger", "targetname" );

    while ( !level.player istouching( var_0 ) && !common_scripts\utility::flag( "FLAG_airport_player_blackout_at_end" ) )
        wait 0.05;

    var_0 delete();
}

_id_02F3()
{
    var_0 = level._id_51F2 maps\_utility::_id_1281( "elevator_crawl_out" );
    var_1 = getanimlength( var_0 );
    level.player maps\_utility::delaythread( var_1 - 2.3, maps\prague_escape_flashback_airport_code::_id_51E2 );
    wait(var_1 - 0.4);
    maps\prague_escape_code::_id_7A4B( "black" );
    maps\prague_escape_code::_id_7A4C( 0.5 );
    level.player setblurforplayer( 3, 6 );
    maps\prague_escape_code::_id_7A4F();
    maps\prague_escape_code::_id_7A4C( 2.5 );
    maps\prague_escape_code::_id_7A50();
    level.player setblurforplayer( 0, 4 );
}

_id_02F4()
{
    var_0 = getentarray( "airport_airplane", "targetname" );
    var_1 = maps\_utility::_id_283B( "airport_airplane_root", "targetname" );
    var_2 = var_1 common_scripts\utility::spawn_tag_origin();

    foreach ( var_4 in var_0 )
        var_4 linkto( var_2, "tag_origin" );

    var_6 = getent( "airport_airplane_trigger", "targetname" );

    while ( !level.player istouching( var_6 ) )
        wait 0.05;

    var_6 delete();
    var_7 = _id_5F9E::_id_5F52( "airport_airplane_start" );
    maps\_utility::_id_2122( var_7 );
    var_2 moveto( var_7[0].origin, 0.05 );
    wait 0.1;
    var_8 = 10;
    var_2 moveto( var_7[1].origin, 10 );
    var_2 rotateto( vectortoangles( var_7[1].origin - var_7[0].origin ), 10 );
    var_2 thread maps\_utility::play_sound_on_entity( "prague_escape_airplane_flyby" );
}

_id_7D29()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_airport_entrance", "targetname" );
    var_1 = "head_city_civ_female_a_drone";
    var_2 = "head_city_civ_male_a_drone";
    var_3 = "head_secret_service_b";
    level thread _id_7D2A( var_0, var_3 );
    var_4 = common_scripts\utility::getstruct( "s_anim_crawling_wounded_2", "targetname" );
    var_5 = maps\_utility::_id_1287( "hurt_officer_1", var_4.origin );
    var_5 thread _id_7D2B( var_4, var_3 );
    var_6 = common_scripts\utility::getstruct( "s_anim_crawling_wounded_1", "targetname" );
    var_7 = maps\_utility::_id_1287( "hurt_officer_2", var_6.origin );
    var_7 thread _id_7D2B( var_6, var_3 );
    var_8 = common_scripts\utility::getstruct( "airport_neck_wound_civ", "targetname" );
    var_9 = maps\_utility::_id_1287( "neck_wound_civ", var_8.origin );
    var_9.angles = var_8.angles;
    var_9 _id_5F9E::_id_5F9A( var_9 maps\_utility::_id_1281( "death" ), "root", 1, 0, 1 );
    var_10 = getanimlength( var_9 maps\_utility::_id_1281( "death" ) );
    var_9 common_scripts\utility::delaycall( 0.05, ::setanimtime, var_9 maps\_utility::_id_1281( "death" ), 3 / var_10 );
    var_9 attach( var_2, "", 1 );
    var_9.headmodel = var_2;
    var_11 = common_scripts\utility::getstruct( "airport_crying_civ", "targetname" );
    var_12 = maps\_utility::_id_1287( "crying_civ", var_11.origin );
    var_12.angles = var_11.angles;
    var_12 _id_5F9E::_id_5F9A( var_12 maps\_utility::_id_1281( "death" ), "root", 1, 0, 1 );
    var_12 attach( var_1, "", 1 );
    var_12.headmodel = var_1;
    var_13 = maps\_utility::_id_1287( "wounded_shoulder", var_0.origin );
    var_14 = common_scripts\utility::getstruct( "s_wounded_shoulder_civ_align", "targetname" );
    var_14 thread maps\_anim::_id_11D0( var_13, "wounded_civ" );
    var_13 attach( var_2, "", 1 );
    var_13.headmodel = var_2;
    var_15 = maps\_utility::_id_1287( "headwound_civ", var_0.origin );
    var_16 = common_scripts\utility::getstruct( "s_headwound_civ_align", "targetname" );
    var_16 thread maps\_anim::_id_11D0( var_15, "wounded_civ" );
    var_15 attach( var_1, "", 1 );
    var_15.headmodel = var_1;
}

_id_7D2A( var_0, var_1 )
{
    var_2 = maps\_utility::_id_1287( "wounded_officer", var_0.origin );
    var_2 attach( var_1, "", 1 );
    var_2.headmodel = var_1;
    var_3 = spawn( "script_model", var_2 gettagorigin( "tag_weapon_right" ) );
    var_3.angles = var_2 gettagangles( "tag_weapon_right" );
    var_3 setmodel( "weapon_walther_p99" );
    var_3 linkto( var_2, "tag_weapon_right" );
    var_3 dontcastshadows();
    var_3 hidepart( "TAG_SILENCER" );
    var_0 maps\_anim::_id_11CF( var_2, "wounded_officer" );
    common_scripts\utility::flag_wait( "FLAG_airport_player_exits_elevator" );
    wait 0.5;
    var_0 maps\_anim::_id_1246( var_2, "wounded_officer" );
    var_0 thread maps\_anim::_id_11D0( var_2, "wounded_officer" );
    common_scripts\utility::flag_wait( "player_grabbed_pistol" );
    var_3 delete();
    common_scripts\utility::flag_wait( "emt_end" );
    var_2 delete();
}

_id_7D2B( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_1 ) )
    {
        self attach( var_1, "", 1 );
        self.headmodel = var_1;
    }

    self setcandamage( 0 );
    var_0 thread maps\_anim::_id_124E( self, "wounded_civ_loop" );
    common_scripts\utility::flag_wait( "emt_end" );
    var_0 notify( "stop_loop" );
    self delete();
}

_id_7D2D()
{
    var_0 = [];
    var_0[var_0.size] = &"PRAGUE_ESCAPE_INTRO_AIRPORT_1";
    var_0[var_0.size] = &"PRAGUE_ESCAPE_INTRO_AIRPORT_2";
    var_0[var_0.size] = &"PRAGUE_ESCAPE_INTRO_AIRPORT_3";
    maps\_introscreen::_id_1D96( var_0 );
}

_id_7D2E()
{
    var_0 = getent( "fxanim_prague2_airport_light_mod", "targetname" );
    var_0._id_1032 = "swinging_light";
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0 thread maps\_anim::_id_1246( var_0, "airport_light" );
}

_id_7D2F()
{
    var_0 = getent( "fxanim_prague2_airport_tiles_mod", "targetname" );
    var_0._id_1032 = "falling_tiles";
    var_0 useanimtree( level._id_1245["script_model"] );
    common_scripts\utility::flag_wait_or_timeout( "play_falling_tiles", 10 );
    wait 1;
    var_0 thread maps\_anim::_id_1246( var_0, "airport_tiles" );
}

_id_7D30()
{
    level endon( "stop_hand_print" );
    common_scripts\utility::flag_wait( "play_hand_print" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "blood_handprint" ), self, "J_Wrist_RI" );
        wait 0.2;
    }
}

_id_7D31()
{
    var_0 = getent( "ai_makarov_stairs", "targetname" );
    var_1 = getent( "ai_viktor_stairs", "targetname" );
    var_2 = getent( "ai_lev_stairs", "targetname" );
    var_3 = getent( "ai_kiril_stairs", "targetname" );
    var_4 = getent( "ai_mw2_player_stairs", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_7D36 );
    var_1 maps\_utility::add_spawn_function( ::_id_7D36 );
    var_2 maps\_utility::add_spawn_function( ::_id_7D36 );
    var_3 maps\_utility::add_spawn_function( ::_id_7D36 );
    var_4 maps\_utility::add_spawn_function( ::_id_7D36 );
    level._id_59A6 = var_0 maps\_utility::_id_166F( 1 );
    level._id_7D32 = var_1 maps\_utility::_id_166F( 1 );
    level._id_7D33 = var_2 maps\_utility::_id_166F( 1 );
    level._id_7D34 = var_3 maps\_utility::_id_166F( 1 );
    level._id_7D35 = var_4 maps\_utility::_id_166F( 1 );
    common_scripts\utility::flag_wait( "player_grabbed_pistol" );
    var_5 = getnode( "makarov", "script_noteworthy" );
    var_6 = getnode( "m4", "script_noteworthy" );
    var_7 = getnode( "saw", "script_noteworthy" );
    var_8 = getnode( "shotgun", "script_noteworthy" );
    var_9 = getnode( "mw2_player", "script_noteworthy" );
    var_10 = spawn( "script_origin", maps\_utility::_id_283B( "airport_makarov_target", "targetname" ).origin );
    var_11 = spawn( "script_origin", maps\_utility::_id_283B( "airport_viktor_target", "targetname" ).origin );
    var_12 = spawn( "script_origin", maps\_utility::_id_283B( "airport_lev_target", "targetname" ).origin );
    var_13 = spawn( "script_origin", maps\_utility::_id_283B( "airport_kiril_target", "targetname" ).origin );
    var_14 = spawn( "script_origin", maps\_utility::_id_283B( "airport_mw2_target", "targetname" ).origin );
    level._id_59A6 thread _id_7D37( var_10, var_5 );
    level._id_7D32 thread _id_7D37( var_11, var_6 );
    level._id_7D33 thread _id_7D37( var_12, var_7 );
    level._id_7D34 thread _id_7D37( var_13, var_8 );
    level._id_7D35 thread _id_7D37( var_14, var_9 );
    common_scripts\utility::flag_wait( "start_blackout_anim" );
    var_15 = getnode( "makarov_delete_node", "targetname" );
    var_16 = getnode( "viktor_delete_node", "targetname" );
    var_17 = getnode( "lev_delete_node", "targetname" );
    var_18 = getnode( "kiril_delete_node", "targetname" );
    var_19 = getnode( "player_delete_node", "targetname" );
    level._id_59A6 thread _id_7D38( var_15 );
    level._id_7D32 thread _id_7D38( var_16 );
    level._id_7D33 thread _id_7D38( var_17 );
    level._id_7D34 thread _id_7D38( var_18 );
    level._id_7D35 thread _id_7D38( var_19 );
}

_id_7D36()
{
    self endon( "death" );
    self setcandamage( 0 );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.ignoresuppression = 1;
    self.goalradius = 32;
    maps\_casual_killer::_id_6F55();
    self.team = "axis";
    maps\_utility::_id_1057();
}

_id_7D37( var_0, var_1 )
{
    self endon( "death" );
    self.ignoreall = 0;
    self.ignoreme = 0;
    self._id_0FC6 = 1.0;
    self._id_238A = 1;
    maps\_utility::_id_251F();
    self setentitytarget( var_0 );
    wait(randomfloatrange( 1.5, 3.0 ));
    self clearentitytarget( var_0 );
    var_0 delete();
    thread maps\_utility::_id_278D( var_1, 5000 );
    var_1 waittill( "trigger" );
    maps\_casual_killer::_id_6F58();
    maps\_utility::_id_2800();
    waittillframeend;
    maps\_utility::_id_140C();
    maps\_utility::delaythread( 1, maps\_utility::_id_2520 );
    self waittill( "reached_path_end" );
    maps\_casual_killer::_id_6F55();
    wait(randomfloatrange( 0.25, 1.0 ));
    var_2 = randomfloatrange( 1, 4 );
    var_3 = randomfloatrange( 1, 4 );
    var_4 = randomfloatrange( 1, 4 );
    self stopanimscripted();
    var_1 = getnode( var_1.target, "targetname" );
    self orientmode( "face angle", var_1.angles[1] );
    thread _id_7D49( var_3, var_2, var_4 );
    common_scripts\utility::flag_wait( "start_blackout_anim" );
    self notify( "stop_spray_and_pray" );
}

_id_7D38( var_0 )
{
    self endon( "death" );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self delete();
}

_id_7D39()
{
    var_0 = 90.0;

    for ( var_1 = 0; var_1 < var_0 && !common_scripts\utility::flag( "FLAG_airport_player_exits_elevator" ); var_1 += 0.05 )
        wait 0.05;

    if ( var_1 >= var_0 )
        common_scripts\utility::flag_set( "FLAG_airport_player_blackout_at_end" );
}

_id_7D3A()
{
    var_0 = getent( "airport_force_blackout_trigger", "targetname" );

    while ( !common_scripts\utility::flag( "start_blackout_anim" ) && !level.player istouching( var_0 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "FLAG_airport_player_blackout_at_end" );
}

_id_7D3B()
{
    while ( !common_scripts\utility::flag( "start_blackout_anim" ) && level.player getammocount( "p99" ) > 0 )
        wait 0.05;

    common_scripts\utility::flag_set( "FLAG_airport_player_blackout_at_end" );
}

_id_7D3C()
{
    common_scripts\utility::flag_wait( "FLAG_airport_player_blackout_at_end" );
    common_scripts\utility::flag_set( "start_blackout_anim" );
    level.player thread maps\_utility::play_sound_on_entity( "presc_yri_soldierofrussia" );
    level.player notify( "LISTEN_end_player_limp" );
    level notify( "LISTEN_end_random_blur" );
    var_0 = undefined;
    var_1 = 0;
    var_2 = getent( "trig_right_metal_detector", "targetname" );

    if ( level.player istouching( var_2 ) )
    {
        var_0 = "right_detector_passout";
        var_1 = 1;
    }

    var_3 = getent( "trig_left_metal_detector", "targetname" );

    if ( level.player istouching( var_3 ) )
    {
        var_0 = "left_detector_passout";
        var_1 = 1;
    }

    if ( var_1 )
    {
        setblur( 0, 0.05 );
        level.player freezecontrols( 1 );
        level.player disableweapons();
        level._id_51F2 = maps\_utility::_id_1287( "player_rig_airport", level.player.origin );
        level._id_51F2.angles = level.player getplayerangles();
        level._id_51F2._id_1032 = "player_rig";
        level._id_51F2 dontcastshadows();
        var_4 = common_scripts\utility::getstruct( "anim_align_airport_entrance", "targetname" );
        var_4 maps\_anim::_id_11CF( level._id_51F2, var_0 );
        level._id_51F2 hide();
        var_5 = 0.25;
        level.player playerlinktoblend( level._id_51F2, "tag_player", var_5, var_5 * 0.25, var_5 * 0.25 );
        wait(var_5);
        level._id_51F2 show();
        level.player playerlinktodelta( level._id_51F2, "tag_player", 1, 15, 15, 10, 10, 1 );
        var_4 thread maps\_anim::_id_1246( level._id_51F2, var_0 );

        if ( common_scripts\utility::flag( "screen_fade_out_active" ) )
        {
            common_scripts\utility::flag_wait( "screen_fade_out_end" );
            maps\prague_escape_code::_id_7A4C( 0.3 );
            maps\prague_escape_code::_id_7A50();
        }
        else if ( common_scripts\utility::flag( "screen_fade_in_active" ) )
            common_scripts\utility::flag_wait( "screen_fade_in_end" );

        thread _id_7D43();
        thread _id_7D41();
    }
    else
        thread _id_7D3E();
}

_id_7D3D()
{
    var_0 = getent( "no_blackout_area", "targetname" );
    var_1 = 180;

    for ( var_2 = 0; !common_scripts\utility::flag( "start_blackout_anim" ) && var_2 < var_1; var_2 += 0.05 )
        wait 0.05;

    while ( !common_scripts\utility::flag( "start_blackout_anim" ) && level.player istouching( var_0 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "FLAG_airport_player_blackout_at_end" );
}

_id_7D3E()
{
    wait(randomfloatrange( 0.5, 1.0 ));
    level.player freezecontrols( 1 );
    level.player disableweapons();
    setblur( 0, 0.05 );
    var_0 = spawn( "script_model", level.player.origin );
    var_0.angles = level.player.angles;
    var_0 setmodel( "tag_origin" );
    level.player playerlinktodelta( var_0, "tag_origin", 1, 0, 0, 0, 0 );

    if ( !common_scripts\utility::flag( "FLAG_airport_player_exits_elevator" ) )
    {
        var_1 = maps\_utility::_id_283B( "airport_elevator_center", "targetname" );
        var_2 = 0.5;
        var_0 moveto( var_1.origin, var_2, var_2 * 0.5, var_2 * 0.5 );
        maps\prague_escape_flashback_airport_code::_id_09FA( 0.25 );
        level.player thread maps\_utility::play_sound_on_entity( "breathing_hurt" );
        wait(var_2);
        maps\prague_escape_flashback_airport_code::_id_17CC( 0.25 );
    }

    var_3 = maps\_utility::_id_1287( "player_rig_airport", level.player.origin );
    var_3.angles = level.player getplayerangles();
    var_3._id_1032 = "player_rig";
    var_3 dontcastshadows();

    if ( common_scripts\utility::flag( "FLAG_airport_player_exits_elevator" ) )
    {
        var_4 = spawn( "script_model", var_3 gettagorigin( "tag_weapon" ) );
        var_4.angles = var_3 gettagangles( "tag_weapon" );
        var_4 setmodel( "viewmodel_walther_p99" );
        var_4 linkto( var_3, "tag_weapon" );
        var_4 hidepart( "TAG_KNIFE" );
        var_4 hidepart( "TAG_SILENCER" );
    }

    var_0 maps\_anim::_id_11CF( var_3, "player_force_blackout" );
    level.player playerlinktodelta( var_3, "tag_player", 1, 15, 15, 10, 10, 1 );
    var_0 thread maps\_anim::_id_1246( var_3, "player_force_blackout" );

    if ( common_scripts\utility::flag( "screen_fade_out_active" ) )
    {
        common_scripts\utility::flag_wait( "screen_fade_out_end" );
        maps\prague_escape_code::_id_7A4C( 0.3 );
        maps\prague_escape_code::_id_7A50();
    }
    else if ( common_scripts\utility::flag( "screen_fade_in_active" ) )
        common_scripts\utility::flag_wait( "screen_fade_in_end" );

    thread _id_7D3F();
    thread _id_7D41();
}

_id_7D3F()
{
    level thread maps\_utility::_id_25F3( "test_emt_save" );
    wait 1;
    _id_7D17();
    wait 1;
    _id_7D17();
    wait 0.25;
    _id_7D17();
    wait 0.1;
    common_scripts\utility::flag_set( "FLAG_airport_player_blackout_ended" );
    maps\prague_escape_code::_id_7A4F();
    level.player maps\_utility::vision_set_fog_changes( "prague_escape_airport_revive", 0 );
    common_scripts\utility::flag_set( "setup_emt_anim" );
    wait 3.0;
    level thread _id_0005();
}

_id_0005()
{
    common_scripts\utility::flag_set( "emt_begin" );
    maps\prague_escape_code::_id_7A50();
    wait 2;
    _id_7D17();
    wait 1.15;
    maps\prague_escape_code::_id_7A4B( "white" );
    maps\prague_escape_code::_id_7A4C( 0.5 );
    level.player playsound( "scn_prague_flash_airlift" );
    maps\prague_escape_code::_id_7A4F();
    level.player unlink();
    common_scripts\utility::flag_set( "emt_end" );
}

_id_7D40()
{
    var_0 = getent( "airport_monitor_shooting_enemies", "targetname" );

    while ( !common_scripts\utility::flag( "FLAG_airport_player_blackout_at_end" ) && !level.player istouching( var_0 ) )
        wait 0.05;

    var_0 delete();
    var_1 = [ level._id_59A6, level._id_7D32, level._id_7D33, level._id_7D34, level._id_7D35 ];
    var_2 = cos( 17 );
    var_3 = 0;
    var_4 = 2;

    while ( !common_scripts\utility::flag( "FLAG_airport_player_blackout_at_end" ) )
    {
        level.player waittill( "LISTEN_attack_button_pressed" );

        foreach ( var_6 in var_1 )
        {
            var_7 = vectornormalize( var_6.origin - level.player geteye() );
            var_8 = anglestoforward( level.player getplayerangles() );
            var_9 = vectordot( var_8, var_7 );

            if ( var_9 >= var_2 )
            {
                var_3++;

                if ( var_3 >= var_4 )
                {
                    common_scripts\utility::flag_set( "FLAG_airport_player_blackout_at_end" );
                    return;
                }

                break;
            }
        }
    }
}

_id_7D41()
{
    var_0 = common_scripts\utility::getstruct( "s_emt_align", "targetname" );
    common_scripts\utility::flag_wait( "setup_emt_anim" );
    var_1 = getent( "airport_in_elevator_sound_spot", "targetname" );
    var_1 notify( "LISTEN_stop_sounds" );
    maps\prague_escape_outro::_id_7CD3();
    var_2 = getent( "e_cellar_stream_ent", "targetname" );
    level._id_7D42 = maps\_utility::_id_1287( "emt", var_0.origin );
    var_3 = "head_prague_civ_hero_male_d";
    level._id_7D42 attach( var_3, "", 1 );
    level._id_7D42.headmodel = var_3;
    var_4 = maps\_utility::_id_1287( "player_rig_airport", level.player.origin );
    var_4.angles = level.player getplayerangles();
    var_4._id_1032 = "player_rig";
    var_4 dontcastshadows();
    var_0 maps\_anim::_id_11CF( var_4, "emt_assist" );
    common_scripts\utility::flag_wait( "emt_begin" );
    var_5 = common_scripts\utility::getstruct( "anim_align_airport_escalators", "targetname" );
    var_5 thread _id_7D52( "price_stream_model", "head_hero_price_desert" );
    level.player playerlinktodelta( var_4, "tag_player", 1, 15, 15, 10, 10, 1 );
    var_6 = maps\_utility::_id_1287( "oxygen_mask" );
    var_6._id_1032 = "oxygen_mask";
    var_6 useanimtree( level._id_1245["oxygen_mask"] );
    var_7 = [ var_4, level._id_7D42, var_6 ];
    thread _id_7D53();
    common_scripts\utility::flag_set( "start_emt_dialogue" );
    level.player common_scripts\utility::delaycall( 2, ::playersetstreamorigin, var_2.origin );
    var_0 maps\_anim::_id_11DD( var_7, "emt_assist" );
    common_scripts\utility::array_thread( var_7, maps\_utility::_id_2705 );
}

_id_7D43()
{
    _id_7D17();
    wait 1;
    _id_7D17();
    wait 1;
    common_scripts\utility::flag_set( "FLAG_airport_player_blackout_ended" );
    maps\prague_escape_code::_id_7A4F();
    common_scripts\utility::flag_set( "setup_emt_anim" );
    wait 3;
    level thread _id_0005();
}

_id_7D44()
{
    self endon( "death" );
    self setcandamage( 0 );
    self._id_1032 = "emt";
    self.goalradius = 32;
    self.ignoreme = 1;
    self.ignoreall = 1;
    maps\_utility::_id_24F5();
}

_id_7D45()
{
    var_0 = [];
    var_0["left"] = getent( "intro_elevator_door_left", "targetname" );
    var_0["right"] = getent( "intro_elevator_door_right", "targetname" );
    _id_7D46( var_0 );
    var_1 = spawn( "script_origin", var_0["left"]._id_5E54 );
    var_2 = spawn( "script_origin", var_0["left"]._id_5E54 );
    var_3 = getent( "button_on", "targetname" );
    var_3 show();
    _id_7D47( var_0, var_1 );
    common_scripts\utility::flag_wait( "FLAG_airport_player_collapsed_in_elevator" );
    _id_7D48( var_0, var_1 );
    var_4 = getentarray( "airport_elevator_models", "targetname" );
    _id_5F9E::_id_5EE0( var_4, ::movez, [ 144, 5, 2.5, 0.05 ] );
    level._id_53C3 movez( 144, 0.05 );
    var_0["left"] movez( 144, 0.05 );
    var_0["right"] movez( 144, 0.05 );
    level._id_53C3 waittill( "movedone" );
    common_scripts\utility::flag_set( "elevator_is_up" );
    common_scripts\utility::flag_wait( "open_elevator_doors" );
    _id_7D47( var_0, var_1 );
}

_id_7D46( var_0 )
{
    var_0["left"]._id_5E54 = var_0["left"].origin;
    var_0["right"]._id_5E54 = var_0["right"].origin;
    var_1 = ( -38.0, 0.0, 0.0 );
    var_0["left"]._id_5E55 = var_0["left"].origin - var_1;
    var_0["right"]._id_5E55 = var_0["right"].origin + var_1;
}

_id_7D47( var_0, var_1 )
{
    var_1 playsound( "elev_door_open" );
    var_0["left"] connectpaths();
    var_0["right"] connectpaths();
    var_2 = 14;
    var_3 = var_0["left"]._id_5E54;
    var_4 = abs( distance( var_0["left"]._id_5E55, var_3 ) );
    var_5 = var_4 / var_2 * 0.5;
    var_6 = ( var_0["left"]._id_5E55[0], var_0["left"]._id_5E55[1], var_0["left"].origin[2] );
    var_7 = ( var_0["right"]._id_5E55[0], var_0["right"]._id_5E55[1], var_0["right"].origin[2] );
    var_0["left"] moveto( var_6, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["right"] moveto( var_7, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["left"] waittill( "movedone" );
}

_id_7D48( var_0, var_1, var_2 )
{
    var_1 playsound( "elev_door_close" );
    var_0["left"] disconnectpaths();
    var_0["right"] disconnectpaths();

    if ( !isdefined( var_2 ) )
        var_2 = 14;

    var_3 = var_0["left"]._id_5E54;
    var_4 = abs( distance( var_0["left"]._id_5E55, var_3 ) );
    var_5 = var_4 / var_2;
    var_0["left"] moveto( var_3, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["right"] moveto( var_3, var_5, var_5 * 0.1, var_5 * 0.25 );
    var_0["left"] waittill( "movedone" );
}

_id_7D49( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    common_scripts\utility::flag_waitopen( "friendly_fire_warning" );
    level endon( "friendly_fire_warning" );
    var_6 = "stop_spray_and_pray";
    self endon( var_6 );
    var_7 = _id_7D4F( var_0, var_1, var_2, var_3, var_4, var_5 );
    thread _id_7D50( var_7["target"], var_6 );
    self._id_7D4A = var_7["target"];
    self setentitytarget( self._id_7D4A );
    self._id_7D4B = self._id_1151;
    self._id_1151 = 1;
    _id_7D4C( var_7 );
}

_id_7D4C( var_0 )
{
    for (;;)
    {
        var_1 = distance( var_0["node_origin"], var_0["target"].origin );
        var_2 = var_1 / var_0["speed"];
        var_0["target"] moveto( var_0["node_origin"], var_2, var_2 * 0.1, var_2 * 0.1 );
        wait(var_2);

        if ( var_0["node_origin"] == var_0["start_origin"] )
        {
            var_0["node_origin"] = var_0["end_origin"];
            continue;
        }

        var_0["node_origin"] = var_0["start_origin"];
    }
}

_id_7D4D( var_0 )
{
    var_1 = var_0["node"];

    for (;;)
    {
        var_1 = common_scripts\utility::getstruct( var_1.target, "targetname" );
        var_2 = distance( var_1.origin, var_0["target"].origin );
        var_3 = var_2 / var_0["speed"];
        var_0["target"] moveto( var_1.origin, var_3, var_3 * 0.1, var_3 * 0.1 );
        wait(var_3);
    }
}

_id_7D4E( var_0, var_1, var_2 )
{
    var_3 = [];

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    wait(var_0);
    var_3["speed"] = 50 * var_1;
    var_3["node"] = var_2;
    var_3["target"] = spawn( "script_origin", var_2.origin );
    return var_3;
}

_id_7D4F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 38;

    if ( !isdefined( var_5 ) )
        var_5 = 64;

    wait(var_0);
    var_7 = self gettagorigin( "tag_flash" );
    var_6["speed"] = 50 * var_1;
    var_8 = ( self.origin[0], self.origin[1], var_7[2] );
    var_9 = var_8 + anglestoforward( self.angles ) * var_5 + ( 0, 0, var_3 );
    var_6["start_origin"] = var_8 + anglestoforward( self.angles + ( 0, var_4, 0 ) ) * var_5 + ( 0, 0, var_3 );
    var_6["end_origin"] = var_8 + anglestoforward( self.angles + ( 0, var_4 * -1, 0 ) ) * var_5 + ( 0, 0, var_3 );

    if ( var_2 )
        var_6["node_origin"] = var_6["end_origin"];
    else
        var_6["node_origin"] = var_6["start_origin"];

    var_6["target"] = spawn( "script_origin", var_9 );
    return var_6;
}

_id_7D50( var_0, var_1 )
{
    self waittill( var_1 );
    self._id_1151 = self._id_7D4B;
    self clearentitytarget();
    var_0 delete();
}

_id_7D51()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_airport_entrance", "targetname" );
    var_1 = common_scripts\utility::getstruct( "anim_align_airport_escalators", "targetname" );
    var_0 thread _id_7D52( "airport_male_suit" );
    var_0 thread _id_7D52( "male_blue_khaki", "head_city_civ_male_a_drone" );
    var_0 thread _id_7D52( "male_red_blue", "head_city_civ_male_a_drone" );
    var_0 thread _id_7D52( "female_gray_blue", "head_city_civ_female_a_drone" );
    var_0 thread _id_7D52( "male_green_blue", "head_city_civ_male_a_drone" );
    var_0 thread _id_7D52( "male_red_stripes", "head_city_civ_male_a_drone" );
    var_0 thread _id_7D52( "security", "head_city_civ_male_a_drone" );
    var_1 thread _id_7D52( "escalator_male_suit" );
    var_1 thread _id_7D52( "escalator_female_green", "head_city_civ_female_a_drone" );
    var_1 thread _id_7D52( "escalator_male_red", "head_city_civ_male_a_drone" );
    var_1 thread _id_7D52( "escalator_male_blue", "head_city_civ_male_a_drone" );
}

_id_7D52( var_0, var_1 )
{
    var_2 = getarraykeys( level._id_0C59[var_0] );

    for ( var_3 = 0; var_3 < level._id_0C59[var_0].size; var_3++ )
    {
        var_4 = maps\_utility::_id_1287( var_0, self.origin );
        var_4.script_noteworthy = "setup_emt_anim";

        if ( isdefined( var_1 ) )
        {
            var_4 attach( var_1, "", 1 );
            var_4.headmodel = var_1;
        }

        var_5 = var_2[var_3];
        var_4 setcandamage( 0 );
        thread maps\_anim::_id_124E( var_4, var_5 );
    }
}

_id_7D53()
{
    var_0 = getentarray( "setup_emt_anim", "script_noteworthy" );
    common_scripts\utility::flag_wait( "setup_emt_anim" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_7D54( var_0 )
{
    level._id_59A6 maps\_utility::_id_168C( "presc_mkv_iknowwhat" );
    common_scripts\utility::flag_wait( "mak_betray_dialog_02" );
    level._id_59A6 maps\_utility::_id_168C( "presc_mkv_myfriend" );
    common_scripts\utility::flag_wait( "mak_betray_dialog_03" );
    level._id_59A6 maps\_utility::_id_168C( "presc_mkv_changeforever" );
    common_scripts\utility::flag_wait( "mak_betray_dialog_04" );
    level._id_59A6 maps\_utility::_id_168C( "presc_mkv_nothingcanstop" );
    common_scripts\utility::flag_wait( "mak_betray_dialog_05" );
    level._id_59A6 maps\_utility::_id_168C( "presc_mkv_notevenyou" );
}

_id_7D55()
{
    common_scripts\utility::flag_wait( "emt_begin" );
    wait 3;
    level._id_7D42 maps\_utility::_id_168C( "presc_med_liveone" );
}
