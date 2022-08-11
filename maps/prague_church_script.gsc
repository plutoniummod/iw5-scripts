// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::flag_init( "church_shoot_through_door" );
    common_scripts\utility::flag_init( "church_end_anim_talk" );
    common_scripts\utility::flag_init( "church_player_in_main_hall" );
    common_scripts\utility::flag_init( "on_scaffold" );
    common_scripts\utility::flag_init( "off_scaffold" );
    common_scripts\utility::flag_init( "player_rushed_ending" );
    common_scripts\utility::flag_init( "church_sandman_checks_body" );
    common_scripts\utility::flag_init( "soap_jump_back" );
    common_scripts\utility::flag_init( "church_ambient_chopper_large" );
    common_scripts\utility::flag_init( "pause_shakes_while_in_combat" );
    common_scripts\utility::flag_init( "restart_shakes" );
    common_scripts\utility::flag_init( "church_drop_hint" );
    common_scripts\utility::flag_init( "shoot_at_player_and_soap_now" );
    common_scripts\utility::flag_init( "flag_before_run_in_for_autosave" );
    common_scripts\utility::flag_init( "ai_run_into_the_church_from_outside" );
    common_scripts\utility::flag_init( "on_scaffold_endiing" );
    var_0 = getdvarint( "new_ending", 0 );
    common_scripts\utility::array_thread( getentarray( "church_epic_spawner_trigger", "targetname" ), maps\prague_code::_id_53A6 );
    maps\_utility::_id_27CA( "church_flee_nondrone", ::_id_78E7 );
    maps\_utility::_id_27CA( "church_flee_drone", ::_id_78E6 );
    maps\_utility::_id_27CA( "church_btr", ::_id_78F0 );
    maps\_utility::_id_27CA( "church_patrols", ::_id_78EF );
    maps\_utility::_id_27CA( "church_combat_one", ::_id_78F7 );
    maps\_utility::_id_27CA( "church_combat_one", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CA( "church_combat_two", ::_id_78F7 );
    maps\_utility::_id_27CA( "church_combat_two", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CA( "church_combat_three", ::_id_78FA );
    maps\_utility::_id_27CA( "church_combat_three", maps\prague_courtyard_script_code::_id_786D );
    maps\_utility::_id_27CA( "civs_that_hold_door", ::_id_7912 );
    maps\_utility::_id_27CA( "back_up_vehicle", ::_id_78FC );
    maps\_utility::_id_27CA( "pre_church_flee_drone", ::_id_78E6 );
    maps\_utility::_id_27CA( "runner_one", ::_id_7915 );
    maps\_utility::_id_27CA( "runner_two", ::_id_7915 );
    maps\_utility::_id_27CA( "runner_three", ::_id_7915 );
    maps\_utility::_id_27CA( "runner_four", ::_id_7915 );
    maps\_utility::_id_27CA( "runner_five", ::_id_7915 );
    maps\_utility::_id_27CA( "jeer", ::_id_7914 );
    precacherumble( "light_1s" );
    precacherumble( "light_2s" );
    precacherumble( "light_3s" );
    precachemodel( "weapon_binocular" );
}

_id_5433()
{
    maps\prague_code::_id_523D();
    level.player maps\_utility::vision_set_fog_changes( "prague_redbuilding", 1 );
    maps\prague_code::_id_523F( "start_church" );
    common_scripts\utility::flag_set( "start_sewers" );
    common_scripts\utility::flag_set( "player_out_of_water" );
    common_scripts\utility::flag_set( "start_alcove" );
    common_scripts\utility::flag_set( "start_alley" );
    common_scripts\utility::flag_set( "start_long_convoy" );
    common_scripts\utility::flag_set( "start_courtyard" );
    common_scripts\utility::flag_set( "pre_courtyard_ally_clean_up" );
    common_scripts\utility::flag_set( "start_apartments" );
    common_scripts\utility::flag_set( "start_apartment_fight" );
    common_scripts\utility::flag_set( "start_apartment_exit" );
    common_scripts\utility::flag_set( "start_gallery" );
    common_scripts\utility::flag_set( "gallery_exit" );
    thread _id_524A::_id_520A( "church_smoke" );
    var_0 = _id_524A::_id_520D( "white_building_door" );
    var_0 thread _id_524A::_id_5211();
}

_id_78DD()
{
    common_scripts\utility::flag_wait( "start_church" );
    wait 0.5;
    var_0 = maps\_utility::_id_272C( "pre_church_flee_drone" );
}

_id_78DE()
{
    common_scripts\utility::flag_wait( "start_church" );

    if ( !common_scripts\utility::flag( "btr_spotted" ) )
    {
        var_0 = getaiarray( "axis" );

        foreach ( var_2 in var_0 )
            var_2 maps\_stealth_utility::_id_4344();

        common_scripts\utility::flag_clear( "_stealth_spotted" );
    }

    var_4 = getentarray( "flickering_churchlight", "targetname" );

    foreach ( var_6 in var_4 )
    {
        thread _id_524A::_id_5202( var_6, 0.5, 0.6 );
        thread _id_524A::_id_5208( var_6, 4 );
    }

    var_8 = getentarray( "church_stealth_triggers", "script_noteworthy" );

    foreach ( var_10 in var_8 )
        var_10 common_scripts\utility::trigger_on();

    level._id_45C0 maps\_utility::_id_123B();
    level._id_45C0.goalradius = 128;
    level._id_45C0.goalheight = 16;
    level._id_45C0 maps\_utility::_id_109E();
    thread _id_78E3();
    thread _id_78E4();
    thread _id_78F3();
    thread _id_78F6();
    thread _id_78F5();
    thread _id_78DD();
    thread _id_78FD();
    thread _id_7909();
    thread _id_790B();
    thread _id_78E1();
    thread _id_790E();
    thread _id_7910();
    thread _id_7913();
    maps\_utility::_id_272C( "civs_that_hold_door" );
    thread _id_790C();
    common_scripts\utility::flag_wait( "church_street_clear" );
    var_8 = getentarray( "church_stealth_triggers", "script_noteworthy" );

    foreach ( var_10 in var_8 )
        var_10 common_scripts\utility::trigger_off();
}

_id_78DF()
{
    common_scripts\utility::flag_wait( "flag_before_run_in_for_autosave" );
    maps\_utility::_id_1425( "flag_before_run_in_for_autosave" );
    common_scripts\utility::flag_wait( "player_at_top" );
    maps\_utility::_id_1425( "player_at_top" );
}

_id_78E1()
{
    common_scripts\utility::flag_wait( "church_drop_hint" );
    var_0 = maps\_utility::_id_229D();

    if ( var_0 != "fu" )
        maps\_utility::delaythread( 1, maps\_utility::_id_1823, "hint_prone", 4 );
}

_id_78E2()
{
    var_0 = common_scripts\utility::get_target_ent( "church_run_drop" );
    var_0 maps\_anim::_id_124A( level._id_45C0, "hunted_drop" );
    common_scripts\utility::flag_set( "church_drop" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "hunted_drop" );
    var_0 thread maps\_anim::_id_124E( level._id_45C0, "hunted_drop_idle" );
    common_scripts\utility::flag_wait( "soap_jump_back" );
    var_0 notify( "stop_loop" );
    level._id_45C0 maps\_anim::_id_1246( level._id_45C0, "hunted_pronehide_jumpback" );
    var_1 = getmovedelta( level._id_45C0 maps\_utility::_id_1281( "hunted_pronehide_jumpback" ) );
    var_0 = common_scripts\utility::get_target_ent( "church_run_drop" );
    var_0.origin += var_1;
    var_0 thread maps\_anim::_id_124E( level._id_45C0, "hunted_drop_idle" );
    common_scripts\utility::flag_wait_either( "church_street_clear", "_stealth_spotted" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        wait 2.0;
        thread maps\_utility::_id_11F4( "prague_snd_moveit" );
    }

    thread maps\_utility::_id_1428( "prague_danger_3" );
    var_0 notify( "stop_loop" );
    var_2 = common_scripts\utility::get_target_ent( "pre_enter_church_path" );
    level._id_45C0 thread _id_524A::_id_51F9( var_2 );
    var_0 maps\_anim::_id_11C2( level._id_45C0, "hunted_drop_2_stand" );
    thread _id_78EC();

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level._id_45C0 thread maps\_utility::_id_2712();
        var_2 = var_2 common_scripts\utility::get_target_ent();
        var_2 waittill( "trigger" );
    }

    level._id_45C0 maps\_anim::_id_1246( level._id_45C0, "exposed_crouch_idle_twitch" );
    wait 2;
    level._id_45C0 thread maps\_utility::_id_11F4( "prague_snd_moveit" );
    level._id_45C0.combatmode = "no_cover";
    level._id_45C0.goalradius = 500;
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "enter_church_path" ) );
    var_2 = common_scripts\utility::get_target_ent( "enter_church_path" );
    var_2 waittill( "trigger" );
    level._id_45C0 thread maps\_utility::_id_2713();
    level._id_45C0 waittill( "path_end_reached" );
    thread _id_78EA();
    var_2 = common_scripts\utility::get_target_ent( "enter_church_path" );
    level._id_45C0 thread _id_524A::_id_51F9( var_2 );
}

_id_78E3()
{
    var_0 = common_scripts\utility::get_target_ent( "church_run_drop" );
    var_0 maps\_anim::_id_124A( level._id_45C0, "hunted_drop" );
    common_scripts\utility::flag_set( "church_drop" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "hunted_drop" );
    var_0 thread maps\_anim::_id_124E( level._id_45C0, "hunted_drop_idle" );
    common_scripts\utility::flag_wait( "soap_jump_back" );
    var_0 notify( "stop_loop" );
    var_0 = common_scripts\utility::get_target_ent( "church_run_drop_jumpback" );
    level._id_45C0 maps\_anim::_id_1246( level._id_45C0, "hunted_pronehide_jumpback" );
    var_1 = getmovedelta( level._id_45C0 maps\_utility::_id_1281( "hunted_pronehide_jumpback" ) );
    var_2 = var_0.angles;
    var_3 = vectortoangles( var_1 );
    var_4 = var_2 + var_3;
    var_5 = anglestoforward( var_4 );
    var_6 = distance( var_1, ( 0.0, 0.0, 0.0 ) );
    var_1 = var_5 * var_6;
    var_0 = common_scripts\utility::get_target_ent( "church_run_drop" );
    var_0.origin += var_1;
    var_0 = common_scripts\utility::get_target_ent( "church_run_drop" );
    var_0 thread maps\_anim::_id_124E( level._id_45C0, "hunted_drop_idle" );
    common_scripts\utility::flag_wait_either( "church_street_clear", "_stealth_spotted" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        wait 2.0;
        thread maps\_utility::_id_11F4( "prague_snd_moveit" );
    }

    thread maps\_utility::_id_1428( "prague_danger_3" );
    thread _id_7911();
    thread _id_790D();
    var_0 notify( "stop_loop" );
    var_7 = common_scripts\utility::get_target_ent( "pre_enter_church_path" );
    level._id_45C0 thread _id_524A::_id_51F9( var_7 );
    var_0 maps\_anim::_id_11C2( level._id_45C0, "hunted_drop_2_stand" );
    thread _id_78EC();

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level._id_45C0 thread maps\_utility::_id_2712();
        var_7 = var_7 common_scripts\utility::get_target_ent();
        var_7 waittill( "trigger" );
    }

    common_scripts\utility::flag_set( "ai_run_into_the_church_from_outside" );
    level._id_45C0 maps\_anim::_id_1246( level._id_45C0, "exposed_crouch_idle_twitch" );
    var_8 = maps\_utility::_id_2643( "back_up_vehicle", "script_noteworthy" );

    foreach ( var_10 in var_8 )
        var_10 thread _id_0083();

    level._id_45C0 thread maps\_utility::_id_11F4( "prague_snd_moveit" );
    level._id_45C0.combatmode = "no_cover";
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "enter_church_path_two" ), 200 );
    var_7 = common_scripts\utility::get_target_ent( "enter_church_path_two" );
    var_7 waittill( "trigger" );
    level._id_45C0 thread maps\_utility::_id_2713();
    level._id_45C0 waittill( "path_end_reached" );
}

_id_0083()
{
    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 1000 )
        {
            thread _id_78E9();
            break;
        }

        wait 0.05;
    }
}

_id_78E4()
{
    common_scripts\utility::flag_wait( "church_drop" );
    thread maps\_utility::_id_11F4( "prague_snd_downnow" );
    maps\_utility::delaythread( 2.5, maps\_utility::_id_11F4, "prague_mct_staydown" );
    maps\_utility::_id_272C( "church_flee_nondrone" );
    var_0 = maps\_utility::_id_272C( "church_flee_drone" );
    var_1 = common_scripts\utility::get_target_ent( "run_panic_walla" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2 thread maps\_utility::play_sound_on_tag( "walla_prague_panic_run1" );
    var_1 = var_1 common_scripts\utility::get_target_ent();
    var_2 moveto( var_1.origin, 7.0 );
    common_scripts\utility::flag_wait_or_timeout( "_stealth_spotted", 4.0 );

    foreach ( var_4 in var_0 )
        var_4 solid();

    var_6 = maps\_vehicle::_id_2A9A( "church_btr" );

    foreach ( var_8 in var_6 )
        var_8 maps\_vehicle::_id_2A12();

    thread _id_78E5();

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        wait 0.05;

        foreach ( var_11 in var_6 )
        {
            var_11 resumespeed( 3 );
            var_11 vehicle_setspeedimmediate( 20.0, 5.0 );
            wait 2.0;
            var_11 vehicle_setspeedimmediate( 0.0, 5.0 );
        }
    }
    else
    {
        foreach ( var_11 in var_6 )
        {
            var_11 thread maps\prague_code::_id_533A( common_scripts\utility::getstructarray( "church_btr_targets", "targetname" ) );
            var_11.health = 10000;
        }

        thread _id_78E8();
    }

    wait 6;
    var_6 = maps\_vehicle::_id_2A9A( "back_up_vehicle" );

    foreach ( var_8 in var_6 )
        var_8 maps\_vehicle::_id_2A12();
}

_id_78E5()
{
    var_0 = getent( "tankcrush", "targetname" );
    var_1 = maps\_vehicle::_id_2881( "church_t90" );
    var_1 maps\_vehicle::_id_2A12();
    var_2 = getvehiclenode( "tank_crush_node", "script_noteworthy" );
    var_2 waittill( "trigger" );
    maps\_utility::delaythread( 0.63, common_scripts\utility::flag_set, "soap_jump_back" );
    var_1 vehicle_setspeed( 0, 999999999, 999999999 );
    var_3 = getvehiclenode( "church_t90_path_2", "targetname" );
    var_1 resumespeed( 5 );
    var_1 notify( "newpath" );
    common_scripts\utility::exploder( 1 );
    var_1 maps\_vehicle::_id_2A9F( var_0, var_3, level._id_0C59["tank"]["tank_crush"], level._id_0C59["truck"]["tank_crush"], level._id_1245["tank_crush"], level.scr_sound["tank_crush"] );
    var_1 resumespeed( 5 );
    var_1 maps\_vehicle::_id_1FA6();
}

_id_78E6()
{
    thread maps\prague_code::_id_539B( level._id_5E78 );
    waittillframeend;

    if ( common_scripts\utility::cointoss() )
    {
        maps\_utility::_id_24F5();
        self._id_2044 = level._id_52AC[randomintrange( 0, level._id_52AC.size )];
    }
}

_id_78E7()
{
    self endon( "death" );
    thread maps\_utility::_id_2611();
    maps\_utility::delaythread( 1.0, maps\_utility::_id_1902 );
    var_0 = common_scripts\utility::get_target_ent();
    var_1 = var_0 common_scripts\utility::get_target_ent();
    var_2 = var_0.animation;
    var_3 = self geteye();
    self.ignoresuppression = 1;
    var_0 maps\_anim::_id_11C4( self, var_2 );
    var_0 thread maps\_anim::_id_11C3( self, var_2 );
    waittillframeend;
    self.goalradius = 64;
    self setgoalpos( var_1.origin );
    var_0 thread _id_524A::_id_51F7( self );
    wait 3.0;

    while ( isalive( self ) )
    {
        var_4 = self geteye();
        magicbullet( "pecheneg", var_3 + ( var_4 - var_3 ) * 0.5, var_4 );
        wait 0.1;
    }
}

_id_78E8()
{
    level endon( "_stealth_spotted" );
    level endon( "church_street_clear" );
    wait 3.0;
    var_0 = common_scripts\utility::get_target_ent( "white_building_volume" );

    for (;;)
    {
        wait 0.1;

        if ( level.player istouching( var_0 ) )
            continue;

        if ( level.player getstance() == "prone" )
            continue;

        level._id_45C0 notify( "remove_bulletshield" );
        thread _id_78E9();
        common_scripts\utility::flag_set( "_stealth_spotted" );
    }
}

_id_78E9()
{
    level.player endon( "death" );

    for (;;)
    {
        level.player dodamage( 70, level.player.origin + common_scripts\utility::randomvector( 1 ) );
        wait 1;
    }
}

_id_78EA()
{
    var_0 = getent( "blocker_that_links_to_ai_when_climbing", "targetname" );
    var_1 = getent( "block_player_if_he_tries_to_climb_ahead_of_soap", "targetname" );
    var_2 = maps\_utility::_id_2643( "script_vehicle_btr80", "classname" );

    foreach ( var_4 in var_2 )
        var_4 notify( "stop_random_fire" );

    if ( !isdefined( level._id_4F96 ) )
        thread maps\prague_code::_id_5353( "church_heli" );

    level._id_4F96 maps\prague_code::_id_5371();
    var_6 = common_scripts\utility::get_target_ent( "church_climb_node" );
    thread _id_78EE();
    var_6 maps\_anim::_id_11C4( level._id_45C0, var_6.animation );
    level._id_45C0 maps\_utility::_id_109B();
    level._id_45C0 pushplayer( 0 );
    level._id_45C0.dontavoidplayer = 1;
    thread _id_78EB( var_1 );
    var_0 linkto( level._id_45C0, "tag_inhand", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\_utility::_id_1F61( "hint_scaffold" );

    while ( isdefined( var_6 ) )
    {
        var_6 maps\_anim::_id_11C1( level._id_45C0, var_6.animation );

        if ( isdefined( var_6.target ) )
        {
            var_6 = var_6 common_scripts\utility::get_target_ent();
            continue;
        }

        break;
    }

    var_0 delete();
    level._id_45C0 unlink();
    level._id_45C0.fixednode = 1;

    if ( !common_scripts\utility::flag( "player_at_top" ) )
    {
        level._id_45C0.goalradius = 64;
        level._id_45C0 setgoalpos( level._id_45C0.origin );
    }
}

_id_78EB( var_0 )
{
    wait 3;
    var_0 delete();
}

_id_78EC()
{
    maps\_utility::_id_265A( "allies" );
    var_0 = common_scripts\utility::get_target_ent( "church_open_top_door" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "player_at_top" );
    level._id_45C0.ignoreall = 1;
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "fight_from_above" ), 500 );
    level._id_45C0 waittill( "path_end_reached" );
    common_scripts\utility::flag_wait( "church_shoot_through_door" );
    common_scripts\utility::flag_set( "pause_shakes_while_in_combat" );
    wait 4;
    wait 5;
    wait 6;
    thread maps\_utility::_id_11F4( "prague_mct_now" );
    level._id_45C0.ignoreall = 0;
    level._id_45C0.ignoreme = 0;
    common_scripts\utility::flag_set( "shoot_at_player_and_soap_now" );
    level._id_45C0.accuracy = 0.1;

    for (;;)
    {
        wait 0.05;

        if ( level._id_5DC5 == 0 )
            break;
    }

    var_1 = getent( "top_of_stair_blocker", "targetname" );
    var_1 delete();
    common_scripts\utility::flag_set( "restart_shakes" );
    maps\_utility::_id_1425( "player_ready_to_jump" );
    wait 2.3;
    var_2 = common_scripts\utility::get_target_ent( "church_jump_top" );
    var_2 maps\_anim::_id_124A( level._id_45C0, "jump_across" );
    var_2 maps\_anim::_id_1246( level._id_45C0, "jump_across" );
    level._id_45C0.goalradius = 156;
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "church_upstairs_path" ), 192 );
    level._id_45C0 waittill( "path_end_reached" );
    var_3 = getent( "sandman_church_clear_run_anim", "script_noteworthy" );
    var_3 waittill( "trigger" );
    var_2 = common_scripts\utility::get_target_ent( "kick_boards" );
    level._id_45C0 maps\_utility::_id_109E();
    level._id_45C0 maps\_utility::_id_2712();
    var_2 maps\_anim::_id_124A( level._id_45C0, "kick_grenade" );
    thread _id_78ED();
    anim._id_20D6["scripted"] = ::_id_7906;
    thread common_scripts\utility::play_sound_in_space( "door_wood_double_kick", level._id_45C0.origin );
    var_2 maps\_anim::_id_1246( level._id_45C0, "kick_grenade" );
    wait 0.3;
    wait 0.8;
    level._id_45C0 maps\_utility::_id_109B();
    common_scripts\utility::flag_set( "church_sandman_checks_body" );
    level waittill( "body_checked" );
    var_2 = common_scripts\utility::get_target_ent( "sandman_church_wait_end" );
    level._id_45C0 setgoalnode( var_2 );
    var_0 common_scripts\utility::trigger_on();
    var_0 waittill( "trigger" );
    thread maps\_utility::_id_11F4( "prague_mct_belltower" );
    var_4 = common_scripts\utility::get_target_ent( "church_top_door_l" );
    var_2 = common_scripts\utility::get_target_ent( "sandman_open_church_door" );
    var_2 maps\_anim::_id_11C4( level._id_45C0, "door_slowopen_arrive" );
    var_2 maps\_anim::_id_11C1( level._id_45C0, "door_slowopen_arrive" );
    var_4 thread maps\_utility::_id_273B();
    var_2 maps\_anim::_id_11C3( level._id_45C0, "door_slowopen" );
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "church_hallway" ), 192 );
}

_id_78ED()
{
    var_0 = spawn( "script_origin", ( 21921.0, -5960.0, 363.0 ) );
    wait 0.3;
    playfx( level._effect["ball_bounce_dust"], var_0.origin + ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    playfx( level._effect["ball_bounce_dust"], var_0.origin + ( 0.0, 0.0, 5.0 ), ( 0.0, 0.0, 1.0 ) );
    playfx( level._effect["ball_bounce_dust"], var_0.origin + ( 0.0, 0.0, 8.0 ), ( 0.0, 0.0, 1.0 ) );
    var_1 = spawn( "script_origin", ( 21796.0, -5933.0, 327.0 ) );
    var_2 = spawn( "script_origin", ( 21666.0, -5896.0, 352.0 ) );
    physicsexplosionsphere( var_0.origin, 300, 280, 10 );
    physicsexplosionsphere( var_1.origin, 300, 280, 10 );
    physicsexplosionsphere( var_2.origin, 300, 280, 10 );
}

_id_78EE()
{
    level._id_45C0 endon( "follow_path" );

    for (;;)
    {
        if ( distance( level.player.origin, level._id_45C0.origin ) < 128 )
            break;

        wait 0.05;
    }

    var_0 = common_scripts\utility::get_target_ent( "church_climb_node" );

    while ( isdefined( var_0 ) )
    {
        if ( issubstr( var_0.animation, "loop" ) )
            var_0.animation = var_0.animation;

        if ( isdefined( var_0.target ) )
        {
            var_0 = var_0 common_scripts\utility::get_target_ent();
            continue;
        }

        break;
    }
}

_id_78EF()
{
    self.ignoreme = 1;
    self laserforceon();
    wait 0.05;
    maps\_utility::_id_140C();
    maps\_utility::_id_140B( self.animation );
}

_id_78F0()
{
    thread maps\prague_code::_id_53A0();
    wait 0.05;
    self notify( "awake" );

    foreach ( var_1 in self.mgturret )
    {
        var_1 thread maps\_mgturret::_id_2278();
        var_1 thread maps\_mgturret::_id_22A3( 1, "axis" );
    }
}

_id_78F1()
{
    common_scripts\utility::flag_wait( "church_end_anim_talk" );
    thread _id_78F2();
    common_scripts\utility::flag_wait( "church_player_in_main_hall" );
    maps\_utility::_id_11F4( "prague_mct_inposition" );
    wait 7.0;
    maps\_utility::_id_11F4( "prague_pri_getcomfortable" );
    wait 0.4;
    thread _id_524A::_id_09FA( 5 );
    thread maps\_utility::_id_11F4( "prague_mct_yougotit" );
    wait 2;
    thread maps\_utility::_id_11F4( "prague_mct_getsetup" );
    wait 6;
    maps\_utility::_id_195A();
}

_id_78F2()
{
    var_0 = getent( "end_level_if_player_runs_ahead", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "player_rushed_ending" );
    _id_524A::_id_09FA( 1 );
    maps\_utility::_id_195A();
}

_id_78F3()
{
    var_0 = getent( "church_door_left", "targetname" );
    var_1 = getent( "church_door_right", "targetname" );
    var_0 connectpaths();
    var_0 rotateyaw( -70, 0.5 );
    var_0 waittill( "rotatedone" );
    var_0 disconnectpaths();
}

_id_78F5()
{
    common_scripts\utility::flag_wait( "church_shoot_through_door" );
    var_0 = maps\_utility::_id_2640( "door_holder_three", "script_noteworthy" );
    var_0 maps\_utility::_id_274F( 0.5, 0.5 );
    magicbullet( "ak47", ( 21985.0, -6181.0, 29.0 ), ( 21951.0, -5928.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 21985.0, -6181.0, 29.0 ), ( 21951.0, -5928.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 21974.0, -6142.0, 30.0 ), ( 21901.0, -5806.0, 73.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 21974.0, -6142.0, 30.0 ), ( 21901.0, -5806.0, 73.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22002.0, -6157.0, 37.0 ), ( 21968.0, -5891.0, 37.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22002.0, -6157.0, 37.0 ), ( 21968.0, -5891.0, 37.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22032.0, -6130.0, 59.0 ), ( 21962.0, -5753.0, 77.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22032.0, -6130.0, 59.0 ), ( 21962.0, -5753.0, 77.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22112.0, -6223.0, 29.0 ), ( 22011.0, -5768.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22112.0, -6223.0, 29.0 ), ( 22011.0, -5768.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22042.0, -6118.0, 19.0 ), ( 21992.0, -5903.0, 19.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22042.0, -6118.0, 19.0 ), ( 21992.0, -5903.0, 19.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22059.0, -6138.0, 19.0 ), ( 21955.0, -5769.0, 19.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22059.0, -6138.0, 19.0 ), ( 21955.0, -5769.0, 19.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22074.0, -6136.0, 62.0 ), ( 22024.0, -5860.0, 62.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22074.0, -6136.0, 62.0 ), ( 22024.0, -5860.0, 62.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22074.0, -6136.0, 62.0 ), ( 22024.0, -5860.0, 62.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22147.0, -6253.0, 36.0 ), ( 22053.0, -5804.0, 36.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22127.0, -6268.0, 29.0 ), ( 22060.0, -5838.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22127.0, -6268.0, 29.0 ), ( 22060.0, -5838.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22172.0, -6173.0, 28.0 ), ( 22110.0, -5857.0, 28.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22172.0, -6173.0, 28.0 ), ( 22110.0, -5857.0, 28.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22121.0, -6200.0, 53.0 ), ( 22034.0, -5811.0, 53.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22121.0, -6200.0, 53.0 ), ( 22034.0, -5811.0, 53.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22164.0, -6258.0, 29.0 ), ( 22086.0, -5831.0, 29.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22148.0, -6144.0, 79.0 ), ( 22082.0, -5832.0, 79.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22148.0, -6144.0, 79.0 ), ( 22082.0, -5832.0, 79.0 ) );
    wait 0.005;
    magicbullet( "ak47", ( 22148.0, -6144.0, 79.0 ), ( 22082.0, -5832.0, 79.0 ) );
}

_id_78F6()
{
    level._id_5DC5 = 0;
    common_scripts\utility::flag_wait( "church_shoot_through_door" );
    wait 5.3;
    var_0 = maps\_utility::_id_272C( "church_combat_one" );
    wait 2;
    var_0 = maps\_utility::_id_272C( "church_combat_two" );
    common_scripts\utility::flag_wait( "shoot_at_player_and_soap_now" );
    var_0 = maps\_utility::_id_272C( "church_combat_three" );
}

_id_78F7()
{
    self endon( "death" );
    thread _id_78F8();
    thread _id_78F9();
    self.grenadeammo = 0;
    maps\_utility::_id_265B( "axis" );
    self._id_0D31 = 1;
    self laserforceon();
    self.goalheight = 100;
    common_scripts\utility::waitframe();
    self._id_0FC6 = 0.6;
    common_scripts\utility::waitframe();
    maps\_utility::_id_109B();
    var_0 = getnode( "church_combat_target", "targetname" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_one" )
    {
        self.goalradius = 5;
        common_scripts\utility::waitframe();
        self.goalradius = 50;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_two" )
    {
        self.goalradius = 5;
        wait 1;
        self.goalradius = 50;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_three" )
    {
        self.goalradius = 5;
        wait 2;
        self.goalradius = 50;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_four" )
    {
        self.goalradius = 5;
        common_scripts\utility::waitframe();
        self.goalradius = 50;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_five" )
    {
        self.goalradius = 5;
        wait 1;
        self.goalradius = 50;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_six" )
    {
        self.goalradius = 5;
        wait 2;
        self.goalradius = 50;
    }

    self setgoalnode( var_0 );
}

_id_78F8()
{
    self endon( "death" );
    common_scripts\utility::waittill_either( "death", "damage" );
    common_scripts\utility::flag_set( "shoot_at_player_and_soap_now" );
}

_id_78F9()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "shoot_at_player_and_soap_now" );
    self.goalradius = 1000;
    maps\_utility::_id_109E();
    self._id_0FC6 = 1.0;
    self getenemyinfo( level.player );
    self getenemyinfo( level._id_45C0 );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_one" )
    {
        self.goalradius = 100;
        var_0 = getnode( "combat_marker", "targetname" );
        self setgoalnode( var_0 );
        self.ignoreall = 1;
        wait 3;
        self.ignoreall = 0;
    }
    else if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_two" )
    {
        self.goalradius = 100;
        var_0 = getnode( "combat_marker", "targetname" );
        self setgoalnode( var_0 );
        self.ignoreall = 1;
        wait 3;
        self.ignoreall = 0;
    }
    else if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "church_combat_three" )
    {
        self.goalradius = 100;
        var_0 = getnode( "combat_marker", "targetname" );
        self setgoalnode( var_0 );
        self.ignoreall = 1;
        wait 3;
        self.ignoreall = 0;
    }
}

_id_78FA()
{
    self.grenadeammo = 0;
    self._id_0D31 = 1;
    self laserforceon();
    self.goalheight = 1500;
}

_id_78FB()
{
    self waittill( "trigger" );
    var_0 = common_scripts\utility::get_target_ent();
    var_1 = common_scripts\utility::getstructarray( var_0.script_noteworthy, "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_0 maps\_utility::_id_166F();
        var_4 thread maps\_utility::_id_2611();
        var_4 maps\_utility::_id_27A1( var_3.origin );
        var_4.origin = var_3.origin;
        var_4.angles = var_3.angles;
        var_5 = level._id_0C59["generic"][var_3.animation];

        if ( isarray( var_5 ) )
            var_5 = var_5[0];

        var_4 animscripted( "endanim", var_3.origin, var_3.angles, var_5 );

        if ( isdefined( var_3._id_164F ) && var_3._id_164F == "notsolid" )
            var_4 notsolid();

        if ( issubstr( var_3.animation, "death" ) )
            var_4 common_scripts\utility::delaycall( 0.05, ::setanimtime, var_5, 1.0 );
    }
}

_id_78FC()
{
    maps\_vehicle::_id_2B17( "running spotlight_turret" );
    self vehicle_setspeedimmediate( 2.0, 2.0 );
    thread maps\prague_code::_id_533A( common_scripts\utility::getstructarray( "church_btr_targets", "targetname" ) );
    thread _id_78E8();
    maps\_vehicle::_id_2A3D();
    thread _id_78FE();

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        wait 0.05;
        self resumespeed( 3 );
        self vehicle_setspeedimmediate( 20.0, 5.0 );
        wait 2.0;
        self vehicle_setspeedimmediate( 0.0, 5.0 );
    }
    else
    {
        thread maps\prague_code::_id_533A( common_scripts\utility::getstructarray( "church_btr_targets", "targetname" ) );
        thread _id_78E8();
    }

    for (;;)
    {
        if ( common_scripts\utility::flag( "flag_before_run_in_for_autosave" ) )
        {
            var_0 = maps\_utility::_id_2643( "script_vehicle_btr80", "classname" );

            foreach ( var_2 in var_0 )
                var_2 notify( "stop_random_fire" );

            break;
        }

        wait 0.05;
    }
}

_id_78FD()
{
    var_0 = getent( "church_car", "targetname" );
    var_0.health = 50000;
}

_id_78FE()
{
    var_0 = spawn( "script_origin", ( 23022.0, -12562.0, 32.0 ) );
    var_1 = spawn( "script_origin", ( 18972.0, -11241.0, 649.0 ) );
    var_2 = spawn( "script_origin", ( 19673.0, -8473.0, -17.0 ) );
    var_3 = spawn( "script_origin", ( 23022.0, -12562.0, 32.0 ) );
    self._id_4535["aimspeed"] = 5;

    while ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        self setturrettargetent( var_0 );
        self waittill( "turret_on_target" );
        wait 5;
        self setturrettargetent( var_1 );
        self waittill( "turret_on_target" );
        wait 5;
        self setturrettargetent( var_2 );
        self waittill( "turret_on_target" );
        wait 5;
        self setturrettargetent( var_3 );
        self waittill( "turret_on_target" );
        wait 5;
    }
}

_id_78FF()
{
    while ( !common_scripts\utility::flag( "church_player_in_main_hall" ) )
    {
        if ( distance( level.player.origin, self.origin ) < 600 )
            wait(randomfloatrange( 2, 4 ));

        wait 0.05;
    }
}

_id_7900()
{

}

_id_7903()
{
    var_0 = getent( "church_fall_kill", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "on_scaffold" );
    var_0 common_scripts\utility::trigger_on();
    var_0 waittill( "trigger" );
    level.player kill();
}

_id_7904()
{
    var_0 = 0.15;
    var_1 = 0.25;
    var_2 = var_1 - var_0;
    var_3 = 0.2;
    var_4 = 0.3;
    var_5 = var_4 - var_3;
    var_6 = 1;

    while ( !common_scripts\utility::flag( "off_scaffold" ) )
    {
        var_7 = randomfloat( 1 );

        if ( var_6 )
        {
            var_6 = 0;
            var_7 = 1;
        }

        var_8 = var_0 + var_7 * var_2;
        var_9 = var_3 + var_7 * var_5;
        var_10 = level.player getplayerangles();
        var_11 = anglestoforward( var_10 );
        var_12 = level.player.origin + var_11 * 180;
        var_12 = maps\_utility::_id_27A7( var_12, level.player.origin[2] + 64 );
        var_13 = common_scripts\utility::randomvector( var_9 );

        if ( var_13[2] < 0 )
            var_13 = maps\_utility::_id_27A7( var_13, var_13[2] * -1 );

        physicsjolt( var_12, 350, 250, var_13 );
        wait(randomfloatrange( 0.5, 2 ));
    }
}

_id_7905()
{
    common_scripts\utility::flag_clear( "on_scaffold" );
    thread _id_7904();
    wait 4;
    common_scripts\utility::flag_set( "on_scaffold" );
}

_id_7906()
{

}

_id_7907()
{
    var_0 = common_scripts\utility::get_target_ent( "deadbody_check_church" );
    var_1 = maps\_utility::_id_272F( "deadbody_check_civ_church" );
    maps\_utility::_id_13AF();
    var_1 maps\prague_code::_id_53C0();
    var_0 thread maps\_anim::_id_11C1( var_1, "deadbody_check_body_start" );
    common_scripts\utility::flag_wait( "church_sandman_checks_body" );
    level thread _id_7908();
    var_0 maps\_anim::_id_11C4( level._id_45C0, "deadbody_check" );
    var_0 thread maps\_anim::_id_11C1( var_1, "deadbody_check_body" );
    var_0 maps\_anim::_id_11C1( level._id_45C0, "deadbody_check" );
    var_0 maps\_anim::_id_11C1( level._id_45C0, "deadbody_check_end" );
    level notify( "body_checked" );
}

_id_7908()
{
    wait 7.7;
}

_id_7909()
{
    var_0 = getent( "slow_ladder_movement", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
            level.player maps\_utility::_id_2797( 29 );
        else
            level.player maps\_utility::_id_2797( 100 );

        wait 0.005;
    }
}

_id_790B()
{
    common_scripts\utility::flag_wait( "start_church" );
    wait 1;
    var_0 = maps\_vehicle::_id_2881( "church_ambient_one" );
    var_0 thread maps\prague_code::_id_5358();
    common_scripts\utility::flag_wait( "church_ambient_chopper_large" );
    var_1 = maps\_vehicle::_id_2881( "church_ambient_two" );
    var_1 = maps\_vehicle::_id_2881( "church_ambient_three" );
    wait 1.7;
    var_1 = maps\_vehicle::_id_2881( "church_ambient_four" );
    wait 0.3;
    var_1 = maps\_vehicle::_id_2881( "church_ambient_five" );
    wait 0.3;
    var_1 = maps\_vehicle::_id_2881( "church_ambient_six" );
}

_id_790C()
{
    var_0 = getent( "plank_off_scaffolding", "targetname" );
    var_0 connectpaths();
}

_id_790D()
{
    level.player endon( "death" );
    var_0 = undefined;
    var_1 = common_scripts\utility::get_target_ent( "enter_church_path_two" );

    while ( isdefined( var_1.target ) )
    {
        var_0 = var_1;
        var_1 = var_1 common_scripts\utility::get_target_ent();

        if ( isdefined( var_1.animation ) )
        {
            if ( var_1.animation == "prague_ending_soap_radiotalk" )
                break;
        }
    }

    var_0 waittill( "trigger" );
    level._id_45C0 waittill( "starting_anim" );
    var_1 waittill( "prague_ending_soap_radiotalk" );
    common_scripts\utility::flag_set( "the_end" );
    _id_524A::_id_09FA( 3.3 );
    level.player freezecontrols( 1 );
    wait 1;
    maps\_utility::_id_195A();
}

_id_790E()
{

}

_id_790F()
{

}

_id_7910()
{
    common_scripts\utility::flag_wait( "flag_before_run_in_for_autosave" );
    var_0 = maps\_utility::_id_2643( "back_up_vehicle", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {

    }
}

_id_7911()
{
    wait 3;
}

_id_7912()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "door_holder_four" )
    {
        self.health = 10000;
        var_0 = common_scripts\utility::get_target_ent( "come_on" );
        var_0 maps\_anim::_id_124A( self, "launchfacility_b_blast_door_seq_waveidle" );
        var_0 thread maps\_anim::_id_11C8( self, "launchfacility_b_blast_door_seq_waveidle" );
        thread _id_78FF();
        common_scripts\utility::flag_wait( "church_player_in_main_hall" );
        wait 3.4;
        var_0 notify( "stop_loop" );
        var_0 = common_scripts\utility::get_target_ent( "door_holder_four_spot" );
        self setgoalnode( var_0 );
    }

    level waittill( "ai_run_into_the_church_from_outside" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "outisde_one" )
    {
        var_0 = common_scripts\utility::get_target_ent( "inside_one" );
        self setgoalnode( var_0 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "outisde_two" )
    {
        wait 2;
        var_0 = common_scripts\utility::get_target_ent( "inside_two" );
        self setgoalnode( var_0 );
    }

    common_scripts\utility::flag_wait( "enter_first_room_of_church" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "outisde_three" )
        self kill();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "outisde_delete" )
        self kill();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "door_holder_one" )
        self kill();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "door_holder_two" )
        self kill();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "door_holder_three" )
        self kill();
}

_id_7913()
{
    common_scripts\utility::flag_wait( "flag_before_run_in_for_autosave" );
    maps\_utility::_id_272C( "jeer" );
    maps\_utility::_id_272F( "runner_one" );
    wait 1.7;
    maps\_utility::_id_272F( "runner_two" );
    wait 1.3;
    maps\_utility::_id_272F( "runner_three" );
    wait 0.9;
    maps\_utility::_id_272F( "runner_four" );
    wait 1;
    maps\_utility::_id_272F( "runner_five" );
}

_id_7914()
{
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "jeer_one" )
    {
        for (;;)
        {
            maps\_anim::_id_1246( self, "coup_guard2_jeerA" );
            wait 0.4;
        }
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "jeer_two" )
    {
        for (;;)
        {
            maps\_anim::_id_1246( self, "coup_guard2_jeerA" );
            wait 0.4;
        }
    }
}

_id_7915()
{
    self._id_1032 = "generic";
    playfxontag( common_scripts\utility::getfx( "flashlight" ), self, "TAG_FLASH" );
    thread _id_7916();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runner_one" )
    {
        var_0 = common_scripts\utility::get_target_ent( "runner_spot_one" );
        var_0 maps\_anim::_id_124A( self, "crouch_cover_stand_aim_straight" );
        var_0 thread maps\_anim::_id_11C8( self, "crouch_cover_stand_aim_straight" );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runner_two" )
    {
        var_0 = common_scripts\utility::get_target_ent( "runner_spot_two" );
        var_0 maps\_anim::_id_124A( self, "casual_crouch_v2_idle" );
        var_0 thread maps\_anim::_id_11C8( self, "casual_crouch_v2_idle" );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runner_three" )
    {
        var_0 = common_scripts\utility::get_target_ent( "runner_spot_three" );
        var_0 maps\_anim::_id_124A( self, "casual_crouch_v2_idle" );
        var_0 thread maps\_anim::_id_11C8( self, "casual_crouch_v2_idle" );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runner_four" )
    {
        var_0 = common_scripts\utility::get_target_ent( "runner_spot_four" );
        var_0 maps\_anim::_id_124A( self, "readystand_idle" );
        var_0 thread maps\_anim::_id_11C8( self, "readystand_idle" );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runner_five" )
    {
        var_0 = common_scripts\utility::get_target_ent( "runner_spot_five" );
        var_0 maps\_anim::_id_124A( self, "casual_crouch_idle" );
        var_0 thread maps\_anim::_id_11C8( self, "casual_crouch_idle" );
    }
}

_id_7916()
{
    wait 2.3;
    stopfxontag( common_scripts\utility::getfx( "flashlight" ), self, "TAG_FLASH" );
}
