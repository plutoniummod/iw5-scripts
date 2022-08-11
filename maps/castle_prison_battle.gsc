// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8231()
{
    common_scripts\utility::flag_set( "ruins_done" );
    maps\_shg_common::move_player_to_start( "start_security_office" );
    maps\castle_code::_id_8094( "start_security_office" );
    maps\_utility::_id_265A( "allies" );
    level._id_4877 thread maps\castle_code::_id_8093();
    maps\castle_code::_id_80A0( 6 );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
}

_id_8232()
{
    maps\_shg_common::move_player_to_start( "start_prison_battle_start" );
    maps\castle_code::_id_8094( "start_prison_battle_start" );
    level thread _id_7DD7( 1 );
    maps\_utility::_id_265A( "allies" );
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_8233()
{
    maps\_shg_common::move_player_to_start( "start_prison_battle_flare_room" );
    maps\castle_code::_id_8094( "start_prison_battle_flare_room" );
    maps\_compass::setupminimap( "compass_map_castle_dungeon", "dungeon_minimap_corner" );
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "seal" );
    maps\_utility::vision_set_fog_changes( "castle_interior", 0 );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "objective_clear_prison" );
    common_scripts\utility::flag_init( "objective_clear_prison_cleared" );
    common_scripts\utility::flag_init( "enter_security_office" );
    common_scripts\utility::flag_init( "inside_security_office" );
    common_scripts\utility::flag_init( "security_office_react" );
    common_scripts\utility::flag_init( "security_office_cleared" );
    common_scripts\utility::flag_init( "security_office_closed" );
    common_scripts\utility::flag_init( "security_office_react_done" );
    common_scripts\utility::flag_init( "chair_react_done" );
    common_scripts\utility::flag_init( "chair_guy_dead" );
    common_scripts\utility::flag_init( "non_chair_guys_dead" );
    common_scripts\utility::flag_init( "start_price_drag" );
    common_scripts\utility::flag_init( "entered_security_office_cage" );
    common_scripts\utility::flag_init( "prison_start" );
    common_scripts\utility::flag_init( "price_open_door" );
    common_scripts\utility::flag_init( "price_shot_chair_guard" );
    common_scripts\utility::flag_init( "inner_door_open" );
    common_scripts\utility::flag_init( "player_outside_office_alert" );
    common_scripts\utility::flag_init( "do_not_stop_price_anim" );
    common_scripts\utility::flag_init( "do_not_stop_guard_anim" );
    common_scripts\utility::flag_init( "at_power_switch" );
    common_scripts\utility::flag_init( "price_say_ready" );
    common_scripts\utility::flag_init( "harasser_damaged" );
    common_scripts\utility::flag_init( "player_impulsive" );
    common_scripts\utility::flag_init( "price_activate_switch" );
    common_scripts\utility::flag_init( "covercrouch_blindfire_1_alerted" );
    common_scripts\utility::flag_init( "guard_stumble_shot" );
    common_scripts\utility::flag_init( "harass_guard_dead" );
    common_scripts\utility::flag_init( "guard_stumble_dead" );
    common_scripts\utility::flag_init( "stop_prison_nvg_nag" );
    common_scripts\utility::flag_init( "path_selected" );
    common_scripts\utility::flag_init( "multipath_end" );
    common_scripts\utility::flag_init( "start_flare_room" );
    common_scripts\utility::flag_init( "start_price_nag_before_meatshield" );
    common_scripts\utility::flag_init( "meatshield_done" );
    common_scripts\utility::flag_init( "guard_died" );
    common_scripts\utility::flag_init( "prisoner_died" );
    common_scripts\utility::flag_init( "exited_prison" );
    common_scripts\utility::flag_init( "neither_died" );
    common_scripts\utility::flag_init( "price_say_door_open" );
    common_scripts\utility::flag_init( "price_say_inner_door" );
    common_scripts\utility::flag_init( "price_say_endtheirdays" );
    common_scripts\utility::flag_init( "price_say_waitforlights" );
    common_scripts\utility::flag_init( "price_say_split_up" );
    common_scripts\utility::flag_init( "price_say_flare" );
    common_scripts\utility::flag_init( "price_say_finddead" );
}

_id_64AB()
{
    maps\_utility::_id_27CA( "guard_security_office", ::_id_7DD8 );
    level._id_0155 = [];
    maps\_utility::_id_27CA( "spawn_prison_halls_a", ::_id_7888 );
    maps\_utility::_id_27CA( "prison_ambient_runners", ::_id_5214 );
}

_id_8234()
{
    level thread _id_8237();
    common_scripts\utility::flag_wait( "security_office_cleared" );
}

_id_8235()
{
    level thread _id_823F();
    common_scripts\utility::flag_wait( "start_flare_room" );
}

_id_8236()
{
    level _id_8248();
}

_id_8237()
{
    common_scripts\utility::exploder( 701 );
    var_0 = getent( "cage_pad_light", "targetname" );
    var_0 setlightintensity( 1.0 );
    var_1 = getent( "player_security_door_clip", "targetname" );
    var_1 common_scripts\utility::trigger_off();
    var_2 = getent( "player_security_entrance_clip", "targetname" );
    var_2 common_scripts\utility::trigger_off();
    var_3 = getent( "dead_security_gun", "targetname" );
    var_3 common_scripts\utility::trigger_off();
    level thread _id_7DDB();
    level._id_8238 = getent( "top_right_destructible", "script_noteworthy" );
    level._id_8238 hide();
    level._id_8238 setcandamage( 0 );
    level._id_8239 = getent( "bottom_left_destructible", "script_noteworthy" );
    level._id_8239 hide();
    level._id_8239 setcandamage( 0 );
    level._id_823A = getent( "bottom_right_destructible", "script_noteworthy" );
    level._id_823A hide();
    level._id_823A setcandamage( 0 );
    level._id_823B = getent( "right_top_right_destructible", "script_noteworthy" );
    level._id_823B setcandamage( 0 );
    level._id_823C = getent( "right_top_left_destructible", "script_noteworthy" );
    level._id_823C setcandamage( 0 );
    level._id_823D = getent( "right_bottom_left_destructible", "script_noteworthy" );
    level._id_823D setcandamage( 0 );
    level._id_823E = getent( "right_bottom_right_destructible", "script_noteworthy" );
    level._id_823E setcandamage( 0 );
    level thread _id_824C();
    level thread _id_7DD7();
    level._id_4877 thread _id_8209();
    level._id_4877 thread _id_72F3();
    level thread _id_8218();
    common_scripts\utility::flag_wait( "at_power_switch" );
    level thread _id_72F1();
}

_id_823F()
{
    maps\_utility::_id_265A( "axis" );
    maps\_compass::setupminimap( "compass_map_castle_dungeon", "dungeon_minimap_corner" );
    maps\castle_code::_id_80A1( 3, 8, ( 14.0, 289.0, -35.0 ), "lightning_multipath_room" );
    var_0 = getentarray( "dungeon_light", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setlightintensity( 2.0 );

    var_4 = getentarray( "dungeon_light_model_off", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 hide();

    level._id_8240 = getent( "prison_path_end_left", "targetname" );
    level._id_8240 common_scripts\utility::trigger_off();
    level._id_8241 = getent( "prison_path_end_mid_right", "targetname" );
    level._id_8241 common_scripts\utility::trigger_off();
    level._id_8242 = getentarray( "darkness_target", "targetname" );
    level._id_8243 = 100;
    level.player._id_8244 = level.player.maxvisibledist;
    level.player.maxvisibledist = level._id_8243;
    level.player._id_8245 = 0;
    level._id_4877._id_8244 = level._id_4877.maxvisibledist;
    level._id_4877.maxvisibledist = level._id_8243;
    level._id_4877._id_8245 = 0;
    level._id_4877 thread _id_72F7();
    level._id_4877 thread _id_8247();
    level._id_4877 thread _id_72EE();
    thread _id_7DDA();
    common_scripts\utility::flag_wait( "entered_security_office_cage" );
    var_8 = maps\_utility::_id_272F( "spawner_harass_guard" );
    var_9 = maps\_utility::_id_272F( "prisoner1" );
    var_10 = maps\_utility::_id_272F( "prisoner3" );
    level._id_0230 = [];
    level._id_0230[0] = var_9;
    level._id_0230[1] = var_10;
    var_9 thread _id_7880( "prisoner1" );
    var_10 thread _id_7880( "prisoner3" );
    var_8 thread _id_7881();
    var_11 = maps\_utility::_id_272F( "guard_stumble" );
    var_11 thread _id_7890();
    var_12 = maps\_utility::_id_272F( "covercrouch_blindfire" );
    var_12 thread _id_7893();
    level._id_8246 = getent( "find_wall_guard_lookat_trig", "targetname" );
    level._id_8246 common_scripts\utility::trigger_off();
    thread _id_788A();
    thread _id_788C();
    thread _id_788E();
    thread _id_7DDE();
    level thread _id_7886();
    level thread _id_015A();
    level thread _id_787D();
    common_scripts\utility::flag_wait( "start_flare_room" );
    level notify( "notify_flareroom" );
    maps\_utility::_id_265B( "axis" );
    level.player.maxvisibledist = level.player._id_8244;
    level.player._id_8244 = undefined;
    level._id_4877.maxvisibledist = level._id_4877._id_8244;
    level._id_4877._id_8244 = undefined;
    level.player.maxvisibledist = 8196;
    level._id_4877.maxvisibledist = 8196;
    maps\_utility::_id_1425( "flare_room" );
}

_id_8247()
{
    common_scripts\utility::flag_wait( "prison_start" );
    level._id_4877 maps\_utility::_id_2612( 1 );
    level._id_4877 maps\_utility::_id_0A23( 1 );
    maps\_utility::_id_2703( "price_to_power_switch", "targetname" );
    common_scripts\utility::flag_set( "price_say_endtheirdays" );
    maps\_utility::_id_1425( "heading_down_to_prison" );
    level._id_4877 thread _id_7DD9();
    var_0 = maps\castle_code::_id_7A41( "dungeon_cell" );
    var_0 maps\_anim::_id_124A( level._id_4877, "goto_power_switch" );
    var_0 thread maps\_anim::_id_1246( level._id_4877, "goto_power_switch" );
    var_1 = level._id_4877 maps\_utility::_id_1281( "goto_power_switch" );

    while ( level._id_4877 getanimtime( var_1 ) < 0.65 )
        wait 0.05;

    maps\_anim::_id_127B( level._id_4877, "goto_power_switch", 1.8 );
    level._id_4877 waittillmatch( "single anim", "end" );
    var_0 thread maps\_anim::_id_124E( level._id_4877, "power_switch_wait", "stop_wait" );
    common_scripts\utility::flag_wait( "at_power_switch" );
    common_scripts\utility::flag_set( "price_say_ready" );
    var_0 notify( "stop_wait" );
    var_0 thread maps\_anim::_id_1246( level._id_4877, "power_switch_off" );
    thread maps\_anim::_id_127B( level._id_4877, "power_switch_off", 1.5 );

    while ( level._id_4877 getanimtime( level._id_4877 maps\_utility::_id_1281( "power_switch_off" ) ) < 0.35 )
        wait 0.05;

    maps\_anim::_id_127F( [ level._id_4877 ], "power_switch_off", 0.6 );
    level._id_4877 waittillmatch( "single anim", "end" );
    level._id_4877 maps\_utility::_id_2686();
    level._id_4877 maps\_utility::_id_2612( 0 );
    level._id_4877 maps\_utility::_id_0A23( 0 );
    level._id_4877 thread _id_787A();
}

_id_8248()
{
    maps\castle_code::_id_80A1( 0, 0 );
    level._id_8249 = [];
    level._id_4877 notify( "notify_flareroom" );
    level.player notify( "notify_flareroom" );
    level.player.maxvisibledist = 8196;
    level._id_4877.maxvisibledist = 8196;
    var_0 = getent( "prison_exit_door", "targetname" );
    var_0._id_1032 = "door";
    var_0 maps\_utility::_id_2629();
    var_1 = getent( "prison_exit_clip", "targetname" );
    var_1 linkto( var_0, "origin_animate_jnt" );
    var_2 = maps\castle_code::_id_7A41( "align_dungeon_exit" );
    var_2 maps\_anim::_id_11CF( var_0, "prison_exit_briefing_open" );
    var_3 = getent( "prison_exit_blocker", "targetname" );
    var_3 notsolid();
    var_4 = getent( "dungeon_door1_model", "targetname" );
    var_5 = getent( "dungeon_door1", "targetname" );
    var_5 linkto( var_4 );
    var_6 = getent( "dungeon_door2_model", "targetname" );
    var_7 = getent( "dungeon_door2", "targetname" );
    var_7 linkto( var_6 );
    level thread _id_72E3();
    level thread _id_72E4();
    level._id_4877 _id_72EF( "flare_room" );
    level._id_4877 thread _id_72F8();
    level._id_4877 maps\_utility::_id_2686();
    maps\_utility::_id_2703( "price_into_flareroom", "targetname" );
    var_8 = getent( "t_flare_room_wave_1", "targetname" );
    var_8 waittill( "trigger" );
    level thread _id_7899();
    wait 0.1;
    var_9 = maps\_utility::_id_263E( "flare_room_wave_1" );
    maps\_utility::_id_2636( var_9, var_9.size - 1 );
    var_10 = getnode( "n_flare_room_top", "targetname" );
    var_11 = getent( "prison_back_office_goalvol", "targetname" );
    var_12 = getaiarray( "axis" );
    var_13 = maps\_utility::_id_263E( "flare_room_wave_1" );

    foreach ( var_15 in var_13 )
    {
        var_15 setgoalnode( var_10 );
        var_15 setgoalvolume( var_11 );
    }

    maps\_utility::_id_2703( "t_flare_room_wave_2", "targetname" );
    wait 1.0;
    var_17 = maps\_utility::_id_263E( "flare_room_wave_2" );
    maps\_utility::_id_2636( var_17, var_17.size - 1 );
    maps\_utility::_id_2703( "t_prison_final_wave", "targetname" );
    wait 1.0;
    maps\_utility::_id_2703( "price_into_back_office", "targetname" );
    maps\_utility::_id_2636( var_17, var_17.size - 1 );
    maps\_utility::_id_2703( "price_into_back_office_2", "targetname" );
    var_18 = maps\_utility::_id_263E( "final_wave" );
    maps\_utility::_id_2636( var_18, var_18.size );
    maps\_utility::_id_2703( "price_into_rec_room", "targetname" );
    level._id_4877 waittill( "goal" );
    common_scripts\utility::flag_set( "start_price_nag_before_meatshield" );
    common_scripts\utility::flag_wait( "meatshield_start" );
    common_scripts\utility::flag_wait( "meatshield_done" );
    maps\castle_code::_id_80A1( 3, 8, ( 18.0, 269.0, 0.0 ), "lightning_prison_exit_hall", 3.25, ( 1.0, 1.0, 1.0 ) );
    maps\castle_code::_id_80A0( 6 );
    maps\_utility::_id_2703( "price_into_exit", "targetname" );
    level._id_4877 maps\_utility::_id_109E();
    level._id_4877 maps\_utility::_id_2712();
    level._id_4877 waittill( "goal" );
    level._id_4877 maps\_utility::_id_109B();
    level._id_4877 maps\_utility::_id_2713();
    var_19 = maps\_utility::_id_2766( level._id_4877, var_0 );
    var_2 maps\_anim::_id_124A( level._id_4877, "prison_exit_briefing_open" );
    common_scripts\utility::flag_set( "price_say_finddead" );
    maps\_audio::aud_send_msg( "price_open_prison_exit_door" );
    var_2 maps\_anim::_id_11DD( var_19, "prison_exit_briefing_open" );
    var_2 thread maps\_anim::_id_11D6( var_19, "prison_exit_briefing_open_idle", "end_prison_exit_briefing_open_idle" );
    common_scripts\utility::flag_wait( "exited_prison" );
    level notify( "exited_prison" );
    visionsetnight( "castle_nvg_grain" );
    common_scripts\utility::flag_set( "objective_clear_prison_cleared" );
    maps\castle_code::_id_824A( "lightning_prison_exit_hall" );
    var_2 notify( "end_prison_exit_briefing_open_idle" );
    var_3 solid();
    var_2 maps\_anim::_id_11DD( var_19, "prison_exit_briefing_close" );
    level._id_4877 maps\_utility::_id_2686();
    maps\_utility::_id_2703( "price_onto_bridge", "targetname" );
    maps\_utility::_id_282E( "prison" );
    level _id_72F2();
    maps\_utility::_id_1425( "under_bridge" );
}

_id_824B()
{

}

_id_824C()
{
    level endon( "kill_security_cinematic" );
    setsaveddvar( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        cinematicingameloopresident( "castle_securitycam" );

        while ( iscinematicplaying() )
            wait 1;

        wait 0.05;
    }
}

_id_8209()
{
    level._id_820A = getent( "security_front_door", "targetname" );
    self endon( "death" );
    level endon( "player_outside_office_alert" );
    thread _id_820B();
    common_scripts\utility::flag_set( "objective_clear_prison" );
    maps\_utility::_id_2703( "spawn_security_office", "targetname" );
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    maps\_utility::_id_1414();
    var_0 maps\_anim::_id_124A( self, "security_office_run_up" );
    var_0 maps\_anim::_id_1246( self, "security_office_run_up" );
    var_0 thread maps\_anim::_id_124E( self, "security_office_entry_idle" );
    var_1 = getent( "front_door_clip", "targetname" );
    level._id_820A._id_1032 = "door";
    level._id_820A maps\_utility::_id_2629();
    var_1 linkto( level._id_820A, "origin_animate_jnt" );
    maps\_utility::_id_2709( "mp5_silencer", "chest" );
    level._id_820A thread _id_820B();
    common_scripts\utility::flag_wait( "enter_security_office" );
    common_scripts\utility::flag_set( "price_say_door_open" );
    thread _id_820C( var_0, var_1 );
    maps\_audio::aud_send_msg( "price_enters_security_office" );
    var_0 notify( "stop_loop" );
    var_2 = maps\_utility::_id_2766( self, level._id_820A );
    common_scripts\utility::flag_set( "price_open_door" );
    var_0 maps\_anim::_id_11DD( var_2, "security_office_entry" );
    var_1 connectpaths();
    common_scripts\utility::flag_wait( "inside_security_office" );
    maps\_utility::_id_2612( 0 );
    maps\_utility::_id_0A23( 0 );
    self.goalradius = 8;
    self setgoalpos( self.origin );
    common_scripts\utility::flag_wait( "security_office_cleared" );
    level._id_4877 _id_7DCF();
}

_id_820B()
{
    self endon( "death" );
    level endon( "prison_start" );

    if ( self != level._id_4877 )
        level endon( "do_not_stop_guard_anim" );

    for (;;)
    {
        if ( !common_scripts\utility::flag( "inside_security_office" ) )
        {
            if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            {
                if ( !common_scripts\utility::flag( "do_not_stop_price_anim" ) )
                {
                    level notify( "player_outside_office_alert" );
                    common_scripts\utility::flag_set( "player_outside_office_alert" );

                    if ( self == level._id_820A )
                        maps\_utility::_id_1414();
                    else if ( isalive( self ) )
                    {
                        maps\_utility::_id_1414();

                        if ( isdefined( self._id_0D04 ) )
                            maps\_utility::_id_1902();

                        if ( self != level._id_4877 )
                        {

                        }
                        else
                        {
                            maps\_utility::_id_109E();
                            self.pacifist = 0;
                            self.ignoreme = 0;
                            var_0 = getnode( "security_office_stealth_spotted_node", "targetname" );
                            self setgoalnode( var_0 );
                            self.goalradius = 30;
                            self.allowdeath = 1;
                            self.health = 1;
                        }
                    }

                    return;
                }
            }
        }

        wait 0.03;
    }
}

_id_820C( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "inside_security_office" );

    if ( !common_scripts\utility::flag( "player_outside_office_alert" ) && !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        var_2 = getent( "player_security_entrance_clip", "targetname" );
        var_2 common_scripts\utility::trigger_on();
        var_0 thread maps\_anim::_id_1246( level._id_820A, "security_office_entry_door_close" );
        maps\_anim::_id_127B( level._id_820A, "security_office_entry_door_close", 50 );
        var_2 delete();
        var_1 disconnectpaths();
        common_scripts\utility::flag_set( "security_office_closed" );
        common_scripts\utility::flag_set( "stop_water_splash_fx" );
        level._id_823B setcandamage( 1 );
        level._id_823C setcandamage( 1 );
        level._id_823E setcandamage( 1 );
        level._id_823D setcandamage( 1 );
        level notify( "price_stealth_end" );
        common_scripts\utility::flag_set( "security_office_cleared" );
    }
}

_id_820D( var_0 )
{
    level._id_668D = spawn( "script_model", level._id_4877 gettagorigin( "TAG_WEAPON_RIGHT" ) );
    level._id_668D setmodel( "weapon_usp_silencer" );
    level._id_668D linkto( level._id_4877, "TAG_WEAPON_RIGHT", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_820E = spawn( "script_model", level._id_4877 gettagorigin( "TAG_INHAND" ) );
    level._id_820E setmodel( "weapon_commando_knife" );
    level._id_820E linkto( level._id_4877, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

_id_820F( var_0 )
{
    level._id_4877 playsound( "hijk_cockpit_bash" );
}

_id_8210( var_0 )
{
    level._id_4877 playsound( "hijk_cockpit_bash" );
    wait 4;
    common_scripts\utility::flag_set( "security_office_react" );
}

_id_8211( var_0 )
{
    playfxontag( level._effect["pistol_muzzle_flash"], level._id_668D, "TAG_FLASH" );
    playfxontag( level._effect["pistol_shell_eject"], level._id_668D, "TAG_BRASS" );
    level._id_668D thread maps\_utility::play_sound_on_tag( "weap_usp45sd_fire_npc", "TAG_FLASH" );
    common_scripts\utility::flag_set( "price_shot_chair_guard" );
}

_id_8212( var_0 )
{
    playfxontag( level._effect["pistol_muzzle_flash"], level._id_668D, "TAG_FLASH" );
    playfxontag( level._effect["pistol_shell_eject"], level._id_668D, "TAG_BRASS" );
    level._id_668D thread maps\_utility::play_sound_on_tag( "weap_usp45sd_fire_npc", "TAG_FLASH" );
    level._id_8213 kill();
}

_id_8214( var_0 )
{
    playfxontag( level._effect["pistol_muzzle_flash"], level._id_668D, "TAG_FLASH" );
    playfxontag( level._effect["pistol_shell_eject"], level._id_668D, "TAG_BRASS" );
    level._id_668D thread maps\_utility::play_sound_on_tag( "weap_usp45sd_fire_npc", "TAG_FLASH" );
    level._id_8215 kill();
}

_id_8121( var_0 )
{
    level._id_668D delete();
    common_scripts\utility::flag_clear( "do_not_stop_price_anim" );
    level._id_4877._id_80B8 = 0;
}

_id_8216( var_0 )
{
    level._id_820E delete();
}

_id_8217( var_0 )
{
    level._id_4877 maps\_utility::_id_2709( "mp5_silencer", "right" );
}

_id_8218()
{
    common_scripts\utility::flag_wait( "enter_security_office" );
    var_0 = maps\_utility::_id_263E( "security_office" );

    foreach ( var_2 in var_0 )
    {
        var_2 maps\_utility::_id_0EEC();

        if ( var_2.script_noteworthy == "security_guard_chair" )
        {
            var_2 thread _id_7DCA();
            level._id_8219 = var_2;
            continue;
        }

        if ( var_2.script_noteworthy == "security_guard_3" )
        {
            var_2 thread _id_8220();
            level._id_821A = var_2;
            continue;
        }

        if ( var_2.script_noteworthy == "security_guard_2" )
        {
            var_2 thread _id_821F();
            level._id_8215 = var_2;
            continue;
        }

        if ( var_2.script_noteworthy == "security_guard_1" )
        {
            var_2 thread _id_821E();
            level._id_8213 = var_2;
        }
    }

    common_scripts\utility::flag_wait_either( "security_office_react", "inside_security_office" );
    wait 5.0;
    common_scripts\utility::flag_set( "security_office_react_done" );
}

_id_821B()
{
    self endon( "death" );
    common_scripts\utility::waittill_any( "flashbang", "grenade danger", "explode", "bulletwhizby" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
    maps\_utility::_id_1414();
}

_id_821C()
{
    self endon( "death" );
    level endon( "price_activate_switch" );
    common_scripts\utility::waittill_any( "flashbang", "grenade danger", "explode", "bulletwhizby", "pain_death" );
    common_scripts\utility::flag_set( "player_impulsive" );
    maps\_utility::_id_1414();
}

_id_821D()
{
    self endon( "death" );
    common_scripts\utility::waittill_any( "flashbang", "explode" );
    maps\_utility::_id_1414();
}

_id_821E()
{
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    self._id_0EC6 = 1;
    maps\_utility::_id_26F6( 1 );
    var_0 thread maps\_anim::_id_124E( self, "security_office_idle" );
    common_scripts\utility::flag_wait( "security_office_react" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( self, "security_office_react" );
    _id_72F0( 0, 256 );
}

_id_821F()
{
    common_scripts\utility::flag_wait( "security_office_react" );
    self._id_0EC6 = 1;
    self._id_0D50 = maps\_utility::_id_1281( "generic_death" );
    maps\_anim::_id_1246( self, "security_office_react" );
}

_id_8220()
{
    thread _id_820B();
    maps\_utility::_id_24F5();
    maps\_utility::_id_0D04();
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    common_scripts\utility::flag_wait( "price_open_door" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    var_0 maps\_anim::_id_1246( self, "security_office_entry_guard" );

    if ( common_scripts\utility::flag( "do_not_stop_guard_anim" ) )
    {
        if ( isdefined( self._id_0D04 ) )
            maps\_utility::_id_1902();

        if ( isalive( self ) )
        {
            self.allowdeath = 1;
            self.a._id_0D55 = 1;
            self.diequietly = 1;
            self._id_0EC6 = 1;
            self kill();
        }
    }
}

_id_8221( var_0 )
{
    level._id_4877 playsound( "temp_stab" );
    level._id_821A.team = "neutral";
    level._id_821A setcandamage( 0 );
    level._id_821A.ignoreme = 1;
    common_scripts\utility::flag_set( "do_not_stop_price_anim" );
    common_scripts\utility::flag_set( "do_not_stop_guard_anim" );
    level._id_4877._id_80B8 = 1;
}

_id_8222( var_0 )
{
    level._id_4877 playsound( "temp_gurgle" );
}

_id_7DC8( var_0 )
{

}

_id_7DC9( var_0 )
{

}

_id_7DCA()
{
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    level._id_7DCB = self;
    var_1 = getent( "guard_chair", "targetname" );
    var_1._id_1032 = "chair";
    var_1 maps\_utility::_id_2629();
    var_1 thread _id_7DCE();
    var_2 = maps\_utility::_id_2766( level._id_7DCB, var_1 );
    var_0 thread maps\_anim::_id_11D6( var_2, "security_office_guard_chair_idle" );
    common_scripts\utility::flag_wait( "security_office_react" );
    var_0 notify( "stop_loop" );
    var_0 maps\_anim::_id_1246( self, "security_office_react" );
    common_scripts\utility::flag_set( "chair_react_done" );
    var_0 thread maps\_anim::_id_1246( self, "security_office_react_stand" );
    maps\_utility::_id_2611();
    maps\_utility::_id_1057();
    thread maps\castle_anim::_id_7DCC();
    var_0 maps\_anim::_id_11CF( level._id_7DCD, "security_office_react_death" );
    maps\_utility::_id_0A23( 1 );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "price_shot_chair_guard" );
    wait 0.05;
    maps\_anim::_id_127F( [ self ], "security_office_react_stand", 0.98 );
    self.dropweapon = 1;
    animscripts\shared::_id_23C8();
    wait 0.1;
    level._id_7DCD show();
    self delete();
    var_0 maps\_anim::_id_1246( level._id_7DCD, "security_office_react_death" );
    common_scripts\utility::flag_set( "chair_guy_dead" );
    var_3 = getent( "dead_security_gun", "targetname" );
    var_3 common_scripts\utility::trigger_on();
    var_0 thread maps\_anim::_id_124E( level._id_7DCD, "security_office_guard_chair_death_idle", "end_death_loop" );
    common_scripts\utility::flag_wait( "security_office_cleared" );
    var_0 notify( "end_death_loop" );
}

_id_7DCE()
{
    common_scripts\utility::waittill_any_ents( level, "chair_react_done", level._id_7DCB, "damage" );
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    var_0 maps\_anim::_id_1246( self, "security_office_guard_chair_move" );
    var_0 maps\_anim::_id_124E( self, "security_office_guard_chair_death_idle" );
}

_id_7DCF()
{
    self endon( "death" );
    var_0 = maps\castle_code::_id_7A41( "security_room" );
    var_1 = getent( "security_door_1", "targetname" );
    var_1._id_1032 = "airlock_door";
    var_1 maps\_utility::_id_2629();
    var_2 = getent( "cage_door_clip", "targetname" );
    var_2 linkto( var_1, "origin_animate_jnt" );
    level thread _id_7DD0();
    var_0 maps\_anim::_id_124A( self, "security_office_drag" );
    common_scripts\utility::flag_set( "start_price_drag" );
    maps\_audio::aud_send_msg( "price_use_dead_guard_hand" );
    var_0 maps\_anim::_id_11DD( maps\_utility::_id_2766( self, level._id_7DCD, var_1 ), "security_office_drag" );
    common_scripts\utility::flag_set( "prison_start" );
    common_scripts\utility::flag_set( "price_say_inner_door" );
    common_scripts\utility::flag_wait( "entered_security_office_cage" );
    var_0 maps\_anim::_id_1246( var_1, "security_office_door_close" );
}

_id_7DD0()
{
    common_scripts\utility::flag_wait( "entered_security_office_cage" );
    var_0 = getent( "player_security_door_clip", "targetname" );
    var_0 common_scripts\utility::trigger_on();
}

_id_7DD1( var_0 )
{
    maps\_utility::_id_261A( 701 );
    common_scripts\utility::exploder( 702 );
    var_1 = getent( "cage_pad_light", "targetname" );
    var_1 setlightcolor( ( 0.0, 1.0, 0.0 ) );
}

_id_7DD2( var_0 )
{
    common_scripts\utility::flag_set( "inner_door_open" );
}

_id_7DD3( var_0 )
{
    level._id_8238 show();
    var_1 = getent( "top_right", "script_noteworthy" );
    var_1 delete();
    level._id_8238 setcandamage( 1 );
    level._id_8239 show();
    var_2 = getent( "bottom_left", "script_noteworthy" );
    var_2 delete();
    level._id_8239 setcandamage( 1 );
    level._id_823A show();
    var_3 = getent( "bottom_right", "script_noteworthy" );
    var_3 delete();
    level._id_823A setcandamage( 1 );
}

_id_7DD4( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_camerasout" );
}

_id_7DD5( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_knock" );
}

_id_7DD6( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "castle_pri_cheers" );
}

_id_7DD7( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = getent( "prison_enter_door", "targetname" );
    var_1._id_1032 = "door";
    var_1 maps\_utility::_id_2629();
    var_2 = getent( "inner_door_clip", "targetname" );
    var_2 linkto( var_1, "origin_animate_jnt" );
    var_3 = maps\castle_code::_id_7A41( "align_dungeon_enter" );
    var_3 maps\_anim::_id_11CF( var_1, "prison_exit_briefing_open" );

    if ( !var_0 )
        common_scripts\utility::flag_wait( "inner_door_open" );

    var_3 thread maps\_anim::_id_1246( var_1, "prison_exit_briefing_open" );

    if ( var_0 )
        maps\_anim::_id_127B( var_1, "prison_exit_briefing_open", 50 );

    var_2 connectpaths();
}

_id_7DD8()
{
    _id_72F0( 1, 32 );
    self._id_1032 = self.script_noteworthy;
}

_id_7DD9()
{
    level endon( "price_activate_switch" );
    level endon( "player_entered_prison" );
    var_0 = getent( "price_light_switch", "targetname" );
    var_0 waittill( "trigger", var_1 );

    if ( var_1 == level._id_4877 )
        common_scripts\utility::flag_set( "price_say_waitforlights" );
}

_id_2ABA( var_0 )
{
    common_scripts\utility::flag_set( "price_activate_switch" );
}

_id_7DDA()
{
    common_scripts\utility::flag_wait_any( "price_activate_switch", "player_entered_prison" );
    level thread _id_7DDC();
    common_scripts\utility::exploder( 703 );
    var_0 = getentarray( "dungeon_light", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setlightintensity( 0.1 );

    var_4 = getentarray( "dungeon_light_model_off", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 show();

    var_8 = getentarray( "dungeon_light_model_on", "targetname" );

    foreach ( var_10 in var_8 )
        var_10 delete();

    visionsetnaked( "castle_light_switch", 0 );
}

_id_7DDB()
{
    var_0 = maps\castle_code::_id_7A41( "dungeon_cell" );
    var_1 = getent( "power_switch_handle", "targetname" );
    var_1._id_1032 = "power_switch";
    var_1 maps\_utility::_id_2629();
    var_0 thread maps\_anim::_id_11CF( var_1, "power_off" );
}

_id_7DDC()
{
    var_0 = maps\castle_code::_id_7A41( "dungeon_cell" );
    var_1 = getent( "power_switch_handle", "targetname" );
    var_1._id_1032 = "power_switch";
    var_1 maps\_utility::_id_2629();
    maps\_audio::aud_send_msg( "price_cut_lights" );
    var_0 thread maps\_anim::_id_1246( var_1, "power_off" );
}

_id_7DDD( var_0 )
{
    if ( common_scripts\utility::flag( "nvg_on" ) )
        return;

    level endon( "nvg_on" );
    wait(var_0);
    level.player maps\_utility::_id_1F61( "nvg" );
    common_scripts\utility::flag_wait_or_timeout( "nvg_on", 5 );
}

_id_7DDE()
{
    level._id_7DDF = getent( "prison_path_left", "targetname" );
    level._id_7DE0 = getent( "prison_path_middle", "targetname" );
    level._id_7DE1 = getent( "prison_path_right", "targetname" );
    var_0 = getentarray( "path", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_7898 );
    level._id_7DE2 = undefined;
    common_scripts\utility::flag_wait( "path_selected" );

    if ( level._id_7DE2 == level._id_7DDF )
    {
        if ( isdefined( level._id_7DE0 ) )
            level._id_7DE0 delete();

        if ( isdefined( level._id_7DE1 ) )
            level._id_7DE1 delete();
    }

    if ( level._id_7DE2 == level._id_7DE0 )
    {
        if ( isdefined( level._id_7DDF ) )
            level._id_7DDF delete();

        if ( isdefined( level._id_7DE1 ) )
            level._id_7DE1 delete();
    }

    if ( level._id_7DE2 == level._id_7DE1 )
    {
        if ( isdefined( level._id_7DE0 ) )
            level._id_7DE0 delete();

        if ( isdefined( level._id_7DDF ) )
            level._id_7DDF delete();
    }
}

_id_787A()
{
    maps\_utility::_id_2612( 0 );
    maps\_utility::_id_0A23( 0 );
    maps\_utility::_id_26F3( 1 );
    thread _id_787B();
    common_scripts\utility::flag_wait( "path_selected" );
    var_0 = "price_target_left";

    if ( level._id_7DE2 == level._id_7DDF )
        var_0 = "price_target_right";

    if ( level._id_7DE2 == level._id_7DE0 )
        var_0 = "price_target_left";

    if ( level._id_7DE2 == level._id_7DE1 )
        var_0 = "price_target_left";

    self waittill( "goal" );
    self.ignoreme = 1;
    var_1 = getent( var_0, "targetname" );

    for ( var_2 = 0; var_2 < 4; var_2++ )
    {
        if ( common_scripts\utility::flag( "multipath_end" ) )
            break;

        level._id_4877 _id_787C( var_1 );
    }

    self clearentitytarget();
    common_scripts\utility::flag_wait( "multipath_end" );
    wait 1;
    maps\_utility::_id_2703( "price_move_to_path_end", "targetname" );
}

_id_787B()
{
    common_scripts\utility::flag_wait( "harass_guard_dead" );
    maps\_utility::_id_2703( "prison_halls_a", "targetname" );
    common_scripts\utility::flag_set( "price_say_split_up" );
}

_id_787C( var_0 )
{
    level endon( "multipath_end" );

    for ( var_1 = 1; var_1; var_1 = bullettracepassed( level.player geteye(), var_0.origin, 0, undefined ) )
        wait 0.1;

    self setentitytarget( var_0, 0.7 );
    wait(randomfloatrange( 1.5, 2.0 ));
    self clearentitytarget();
    wait(randomfloatrange( 1.0, 2.0 ));
}

_id_787D()
{
    level endon( "start_flare_event" );
    common_scripts\utility::flag_wait( "start_ambient_runners" );
    maps\_utility::_id_2703( "spawn_ambient_runners", "targetname" );
}

_id_5214()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

_id_787E()
{
    self._id_2016 = 1;
    self._id_2017 = ::_id_787F;
    self.name = "";
    self.team = "neutral";
}

_id_787F()
{

}

_id_7880( var_0 )
{
    wait 0.5;
    self._id_1032 = var_0;
    thread maps\_anim::_id_124E( self, "harass_loop" );
    common_scripts\utility::flag_wait_any( "price_activate_switch", "player_impulsive", "harasser_damaged", "player_entered_prison" );

    if ( isalive( self ) )
    {
        maps\_utility::_id_1414();
        thread _id_7883();
    }
}

_id_7881( var_0 )
{
    wait 0.5;
    var_1 = maps\castle_code::_id_7A41( "dungeon_cell" );
    self.allowdeath = 1;
    self._id_1032 = "guard3";
    thread _id_821C();
    thread _id_7885();
    level thread _id_7884( self );
    var_2 = maps\_utility::_id_1287( "baton" );
    maps\_utility::_id_282D( var_2, "prison" );
    var_1 thread maps\_anim::_id_124E( var_2, "harass_loop", "stop_loop" );
    var_1 thread maps\_anim::_id_124E( self, "harass_loop", "stop_loop" );
    common_scripts\utility::flag_wait_any( "price_activate_switch", "player_impulsive", "harasser_damaged", "player_entered_prison" );
    maps\_utility::_id_1414();
    var_1 notify( "stop_loop" );
    thread _id_7882( var_1, var_2 );

    if ( isalive( self ) )
    {
        thread maps\_utility::_id_168C( "castle_ru2_whatthehell" );
        thread _id_821D();
        thread _id_7895();
        var_1 maps\_anim::_id_1246( self, "harass_react" );
    }

    if ( isalive( self ) )
        thread maps\_anim::_id_124E( self, "blinded_react_loop" );
}

_id_7882( var_0, var_1 )
{
    var_0 maps\_anim::_id_1246( var_1, "harass_drop" );
    var_0 thread maps\_anim::_id_124E( var_1, "harass_drop_idle" );
}

_id_7883()
{
    self endon( "death" );

    if ( isdefined( level._id_0C59[self._id_1032]["harass_react"] ) )
    {
        maps\_anim::_id_1246( self, "harass_react" );
        thread maps\_anim::_id_124E( self, "harass_end_loop" );
    }
}

_id_7884( var_0 )
{
    level endon( "path_selected" );
    self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
    common_scripts\utility::flag_set( "harasser_damaged" );
}

_id_7885()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "harass_guard_dead" );

    if ( !common_scripts\utility::flag( "price_activate_switch" ) )
        common_scripts\utility::flag_set( "player_impulsive" );
}

_id_7886()
{
    level._id_7887 = [];
    var_0 = getent( "prisoner_spawner_multipath", "targetname" );
    var_1 = common_scripts\utility::getstructarray( "struct_cell_prisoner", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_0 maps\_utility::_id_212D();
        wait 0.05;
        level._id_7887 = maps\_utility::_id_0BC3( level._id_7887, var_4 );
        maps\_utility::_id_282D( var_4, "prison" );
        var_4.name = "";
        var_4._id_1032 = "generic";
        var_3 thread maps\_anim::_id_11C8( var_4, var_3.script_noteworthy );
    }

    thread _id_0231();
    thread _id_0156();
}

_id_0156()
{
    level._id_0157 = 0;
    level._id_0158 = 4;
    level.friendlyfire["friend_kill_points"] = 0;
    level.friendlyfire["enemy_kill_points"] = 0;

    for ( var_0 = 0; var_0 < level._id_7887.size; var_0++ )
        level._id_7887[var_0] thread _id_0159();

    common_scripts\utility::flag_wait( "start_flare_room" );
    level._id_0157 = 0;
}

_id_0159()
{
    level endon( "exited_prison" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        level.friendlyfire["friend_kill_points"] = 0;
        level._id_0157++;

        if ( level._id_0157 > level._id_0158 )
        {
            setdvar( "ui_deadquote", &"CASTLE_KILLED_TOO_MANY_PRISONERS" );
            level thread maps\_utility::_id_1826();
        }
    }
}

_id_0231()
{
    var_0 = [];
    var_0[0] = "castle_rup3_innocents";
    var_0[1] = "castle_rup2_doctor";
    var_0[2] = "castle_rup2_letusout";
    var_0[3] = "castle_rup3_helpusplease";
    var_0[4] = "castle_rup1_help";
    var_1 = [];
    var_1[0] = "castle_cop1_whatshappening";
    var_1[1] = "castle_cop1_whoarethose";
    var_1[2] = "castle_cop1_setusfree";
    var_1[3] = "castle_cop1_getusout";
    var_1[4] = "castle_cop1_abouttime";
    var_1[5] = "castle_rup1_whatsgoingon";
    var_1[6] = "castle_rup2_outthere";
    var_2 = [];
    var_2[0] = "castle_cop1_hurray";
    var_2[1] = "castle_cop1_yeah";
    var_2[2] = "castle_cop1_shootthe";
    var_2[3] = "castle_rup1_hereforus";
    var_2[4] = "castle_rup2_wecanhelp";
    var_2[5] = "castle_rup3_deathtomakarov";
    var_2[6] = "castle_rup1_overhere";
    var_2[7] = "castle_rup3_openthedoors";
    var_2[8] = "castle_rup1_yes";
    var_2[9] = "castle_rup2_killthem";
    level._id_0232 = [];
    level._id_0232 = common_scripts\utility::array_combine( level._id_0232, var_0 );
    level._id_0233 = 5.0;
    level._id_0234 = 7.0;
    thread _id_0235();
    common_scripts\utility::flag_wait( "player_entered_prison" );
    level._id_0232 = common_scripts\utility::array_combine( level._id_0232, var_1 );

    for ( var_3 = 1; var_3 <= level._id_7887.size - 20; var_3++ )
        level._id_0230 = common_scripts\utility::add_to_array( level._id_0230, level._id_7887[var_3] );

    level._id_0233 = 2.0;
    level._id_0234 = 3.5;
    common_scripts\utility::flag_wait( "start_flare_room" );
    level._id_0232 = common_scripts\utility::array_combine( level._id_0232, var_2 );

    for ( var_3 = 1; var_3 <= level._id_7887.size - 10; var_3++ )
        level._id_0230 = common_scripts\utility::add_to_array( level._id_0230, level._id_7887[var_3] );

    level._id_0233 = 0.75;
    level._id_0234 = 1.5;
}

_id_0235()
{
    level endon( "exited_prison" );
    var_0 = -1;

    for ( level._id_0230 = maps\_utility::_id_1361( level._id_0230 ); level._id_0230.size > 0; level._id_0230 = maps\_utility::_id_1361( level._id_0230 ) )
    {
        var_1 = randomint( level._id_0232.size );

        if ( var_1 == var_0 )
        {
            var_1++;

            if ( var_1 >= level._id_0232.size )
                var_1 = 0;
        }

        var_2 = level._id_0232[var_1];
        common_scripts\utility::play_sound_in_space( var_2, level._id_0230[randomint( level._id_0230.size )].origin );
        var_0 = var_1;
        wait(randomfloatrange( level._id_0233, level._id_0234 ));
    }
}

_id_015A()
{
    var_0 = [];
    var_0[0] = "castle_ru1_intruders";
    var_0[1] = "castle_ru1_soundalarm";
    var_0[2] = "castle_ru3_alertcommander";
    var_0[3] = "castle_ru1_lockdown";
    var_0[4] = "castle_ru2_powerback";
    var_1 = [];
    var_1[0] = "castle_ru1_gunfire";
    var_1[1] = "castle_ru2_spreadout";
    var_1[2] = "castle_ru3_wherearethey";
    var_1[3] = "castle_ru1_findthem";
    var_1[4] = "castle_ru2_unidentified";
    common_scripts\utility::flag_wait( "price_activate_switch" );
    level._id_015B = [];
    level._id_015B = common_scripts\utility::array_combine( level._id_015B, var_0 );
    level._id_015C = 7.0;
    level._id_015D = 12.0;
    thread _id_015E();
    common_scripts\utility::flag_wait( "harass_guard_dead" );
    level._id_015B = common_scripts\utility::array_combine( level._id_015B, var_1 );
}

_id_015E()
{
    level endon( "notify_flareroom" );
    var_0 = -1;

    for (;;)
    {
        level._id_0155 = maps\_utility::_id_1361( level._id_0155 );

        if ( level._id_0155.size > 0 )
        {
            var_1 = randomint( level._id_015B.size );

            if ( var_1 == var_0 )
            {
                var_1++;

                if ( var_1 >= level._id_015B.size )
                    var_1 = 0;
            }

            var_2 = level._id_015B[var_1];
            common_scripts\utility::play_sound_in_space( var_2, level._id_0155[randomint( level._id_0155.size )].origin );
            var_0 = var_1;
            wait(randomfloatrange( level._id_015C, level._id_015D ));
            continue;
        }

        return;
    }
}

_id_7888()
{
    self endon( "death" );
    maps\_utility::_id_109B();
    maps\_utility::_id_260D();
    self._id_1032 = "generic";
    self.allowdeath = 1;
    self.allowpain = 1;
    self.ignoreme = 1;
    thread _id_7889();
    level._id_0155 = common_scripts\utility::add_to_array( level._id_0155, self );
    var_0 = self.animation + "_single";

    if ( isalive( self ) && isdefined( self.animation ) )
        thread maps\_anim::_id_11C0( self, var_0 );

    common_scripts\utility::flag_wait( "player_entered_prison" );

    if ( isalive( self ) && isdefined( self.animation ) )
    {
        wait(randomfloatrange( 0.5, 1.5 ));
        thread maps\_anim::_id_11C8( self, self.animation );
        thread _id_821D();
        thread _id_7895();
    }
}

_id_7889()
{
    maps\_utility::_id_262C( "price_into_prison" );
    level._id_4877 waittill( "goal" );

    if ( isalive( self ) )
        self.ignoreme = 0;
}

_id_788A()
{
    common_scripts\utility::flag_wait( "player_entered_prison" );
    var_0 = maps\_utility::_id_272F( "stair_stumble_forward_guard" );
    var_1 = maps\castle_code::_id_7A41( "dungeon_cell" );
    var_0 thread _id_788B( var_1 );
}

_id_788B( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_109B();
    maps\_utility::_id_260D();
    self._id_1032 = "generic";
    self.allowdeath = 1;
    self._id_0EC6 = 1;
    self.ignoreme = 1;

    if ( isalive( self ) )
        var_0 thread maps\_anim::_id_11C0( self, "stair_stumble_forward_guard" );

    common_scripts\utility::flag_wait_any( "stair_stumble_forward_guard_mid_trig", "stair_stumble_forward_guard_left_trig", "stair_stumble_forward_guard_right_trig" );

    if ( common_scripts\utility::flag( "stair_stumble_forward_guard_mid_trig" ) )
    {
        var_1 = getent( "stair_stumble_forward_guard_left_targetname", "targetname" );
        var_2 = getent( "stair_stumble_forward_guard_right_targetname", "targetname" );
        var_1 delete();
        var_2 delete();

        if ( isalive( self ) )
        {
            var_0 thread maps\_anim::_id_1246( self, "stair_stumble_forward_guard" );
            wait 0.05;
            maps\_anim::_id_127F( [ self ], "stair_stumble_forward_guard", 0.25 );
            self.ignoreme = 0;
            thread _id_821D();
            thread _id_7895();
            self waittillmatch( "single anim", "end" );
            maps\_anim::_id_124E( self, "corner_standR_alert_idle" );
            return;
        }
    }
    else if ( common_scripts\utility::flag( "stair_stumble_forward_guard_left_trig" ) )
    {
        var_1 = getent( "stair_stumble_forward_guard_mid_targetname", "targetname" );
        var_2 = getent( "stair_stumble_forward_guard_right_targetname", "targetname" );
        var_1 delete();
        var_2 delete();

        if ( isalive( self ) )
        {
            var_0 thread maps\_anim::_id_1246( self, "stair_stumble_forward_guard" );
            self.ignoreme = 0;
            thread _id_821D();
            thread _id_7895();
            self waittillmatch( "single anim", "end" );
            maps\_anim::_id_124E( self, "corner_standR_alert_idle" );
            return;
        }
    }
    else if ( common_scripts\utility::flag( "stair_stumble_forward_guard_right_trig" ) )
    {
        var_1 = getent( "stair_stumble_forward_guard_mid_targetname", "targetname" );
        var_2 = getent( "stair_stumble_forward_guard_left_targetname", "targetname" );
        var_1 delete();
        var_2 delete();

        if ( isalive( self ) )
        {
            var_0 thread maps\_anim::_id_1246( self, "stair_stumble_forward_guard" );
            self.ignoreme = 0;
            thread _id_821D();
            thread _id_7895();
            self waittillmatch( "single anim", "end" );
            maps\_anim::_id_124E( self, "corner_standR_alert_idle" );
        }
    }
}

_id_788C()
{
    level endon( "end_find_wall_guard_trig" );
    common_scripts\utility::flag_wait( "find_wall_guard_spawn_trig" );
    var_0 = maps\_utility::_id_272F( "find_wall_guard" );
    level._id_8246 common_scripts\utility::trigger_on();
    var_1 = maps\castle_code::_id_7A41( "dungeon_cell" );
    var_1 thread maps\_anim::_id_11C0( var_0, "find_wall_guard" );
    var_0 thread _id_788D( var_1 );
}

_id_788D( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_109B();
    maps\_utility::_id_260D();
    self._id_1032 = "generic";
    self.allowdeath = 1;
    common_scripts\utility::flag_wait( "find_wall_guard_lookat" );

    if ( isalive( self ) )
    {
        var_0 thread maps\_anim::_id_1246( self, "find_wall_guard" );
        thread _id_821D();
        thread _id_7895();
    }
}

_id_788E()
{
    common_scripts\utility::flag_wait_any( "stair_stumble_back_guard_mid_spawn", "stair_stumble_back_guard_right_spawn", "stair_stumble_back_guard_left_spawn" );

    if ( common_scripts\utility::flag( "stair_stumble_back_guard_mid_spawn" ) )
    {
        var_0 = getent( "stair_stumble_back_guard_right_spawn_targetname", "targetname" );
        var_0 delete();
        var_0 = getent( "stair_stumble_back_guard_left_spawn_targetname", "targetname" );
        var_0 delete();
        level._id_8241 common_scripts\utility::trigger_on();
        level._id_8240 delete();
    }
    else if ( common_scripts\utility::flag( "stair_stumble_back_guard_right_spawn" ) )
    {
        var_0 = getent( "stair_stumble_back_guard_mid_spawn_targetname", "targetname" );
        var_0 delete();
        var_0 = getent( "stair_stumble_back_guard_left_spawn_targetname", "targetname" );
        var_0 delete();
        level._id_8241 common_scripts\utility::trigger_on();
        level._id_8240 delete();
    }
    else if ( common_scripts\utility::flag( "stair_stumble_back_guard_left_spawn" ) )
    {
        var_0 = getent( "stair_stumble_back_guard_mid_spawn_targetname", "targetname" );
        var_0 delete();
        var_0 = getent( "stair_stumble_back_guard_right_spawn_targetname", "targetname" );
        var_0 delete();
        level._id_8240 common_scripts\utility::trigger_on();
        level._id_8241 delete();
    }

    var_1 = maps\_utility::_id_272F( "stair_stumble_back_guard" );
    var_1.ignoreme = 1;
    var_2 = maps\castle_code::_id_7A41( "dungeon_cell" );
    var_1 thread _id_788F( var_2 );
    common_scripts\utility::flag_wait( "multipath_end" );

    if ( isalive( var_1 ) )
        var_1.ignoreme = 0;
}

_id_788F( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_109B();
    maps\_utility::_id_260D();
    self._id_1032 = "generic";
    self.allowdeath = 1;

    if ( isalive( self ) )
    {
        var_0 thread maps\_anim::_id_1246( self, "stair_stumble_back_guard" );
        thread _id_821D();
        thread _id_7895();
        self waittillmatch( "single anim", "end" );
        maps\_anim::_id_124E( self, "castle_dungeon_blind_idle_guard" );
    }
}

_id_7890()
{
    self endon( "death" );
    maps\_utility::_id_109B();
    maps\_utility::_id_260D();
    self._id_1032 = "generic";
    self.allowdeath = 1;
    self.ignoreme = 1;
    self.health = 1;
    thread _id_7891();
    var_0 = self.animation + "_single";

    if ( isalive( self ) && isdefined( self.animation ) )
        thread maps\_anim::_id_11C0( self, var_0 );

    common_scripts\utility::flag_wait( "stumble_guy_go" );

    if ( isalive( self ) && isdefined( self.animation ) )
    {
        wait(randomfloatrange( 0.0, 2.0 ));
        thread maps\_anim::_id_11C8( self, self.animation );
        thread _id_821D();
        thread _id_7892();
        common_scripts\utility::flag_wait_or_timeout( "guard_stumble_shot", 1.5 );
        self.ignoreme = 0;
        wait 6.5;

        if ( isalive( self ) )
            self kill();
    }
}

_id_7891()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "guard_stumble_dead" );
}

_id_7892()
{
    self endon( "death" );
    level endon( "guard_stumble_shot" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
            common_scripts\utility::flag_set( "guard_stumble_shot" );
    }
}

_id_7893()
{
    self endon( "death" );
    maps\_utility::_id_109B();
    maps\_utility::_id_260D();
    self._id_1032 = "generic";
    self.allowdeath = 1;
    thread _id_7894();
    thread _id_821D();
    thread _id_7895();
    common_scripts\utility::flag_wait( "covercrouch_blindfire_trigger" );

    if ( isalive( self ) && isdefined( self.animation ) )
    {
        self notify( "stop_looping_anim" );
        maps\_anim::_id_1246( self, self.animation );
        thread _id_7894();
    }
}

_id_7894()
{
    self endon( "death" );
    level endon( "covercrouch_blindfire_trigger" );
    level endon( "covercrouch_blindfire_1_alerted" );

    for (;;)
    {
        thread maps\_anim::_id_11C8( self, "covercrouch_hide_idle", "stop_looping_anim" );
        wait(randomfloatrange( 0.5, 3.5 ));
        self notify( "stop_looping_anim" );

        if ( common_scripts\utility::flag( "covercrouch_blindfire_trigger" ) )
            var_0 = "cover_twitch_0" + randomintrange( 1, 3 );
        else
            var_0 = "cover_twitch_01";

        maps\_anim::_id_1246( self, var_0 );
    }
}

_id_7895()
{
    self endon( "notify_flareroom" );
    self endon( "death" );
    var_0 = level._id_8243 * level._id_8243;
    var_1 = [ level.player ];

    for (;;)
    {
        foreach ( var_3 in var_1 )
        {
            if ( distancesquared( self.origin, var_3.origin ) <= var_0 && self cansee( var_3 ) )
            {
                if ( isdefined( self.animation ) && self.animation == "covercrouch_blindfire_1" )
                {
                    var_4 = self.animation + "_alerted";
                    common_scripts\utility::flag_set( var_4 );
                    self notify( "stop_looping_anim" );
                }

                maps\_utility::_id_1414();
                maps\_utility::_id_123B();
                self setgoalentity( var_3 );
                self.goalradius = 30;
                var_3 thread _id_7896();
                continue;
            }
        }

        wait 0.25;
    }
}

_id_7896()
{
    self endon( "notify_flareroom" );
    self endon( "death" );
    self._id_8245++;
    self.maxvisibledist = 800;
    wait(randomfloatrange( 4.0, 6.0 ));
    self._id_8245--;

    if ( self._id_8245 == 0 )
        self.maxvisibledist = level._id_8243;
}

_id_7897()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_impulsive" );
    _id_72F0( 0, 384 );
    maps\_utility::_id_123B();
    self.ignoresuppression = 1;
    self._id_0F3C = 1;

    if ( self._id_2149 == "prison_halls_a" )
    {
        level.player _id_7896();
        level._id_4877 _id_7896();
        maps\_utility::_id_2736( 0.5 );
        var_0 = getent( "prison_ambush_goalvol", "targetname" );
        self.goalradius = 512;
        self.combatmode = "ambush";
        self getenemyinfo( level.player );
        self setgoalpos( var_0.origin );
        self setgoalvolume( var_0 );
    }
    else
    {
        self setgoalentity( level.player, 2 );
        self.goalradius = 384;
    }
}

_id_7898()
{
    self endon( "death" );
    self waittill( "trigger" );
    level._id_7DE2 = self;
    common_scripts\utility::flag_set( "path_selected" );
    common_scripts\utility::flag_set( "stop_prison_nvg_nag" );
}

_id_7899()
{
    level thread _id_789A( "flare_toss_6", "light_flare_6" );
    level thread _id_789A( "flare_toss_5", "light_flare_5" );
    level thread _id_789A( "flare_toss_4", "light_flare_4" );
    level thread _id_789A( "align_flare_room", "light_flare_3", "guard_flare_toss3" );
}

_id_789A( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::getstruct( var_0, "targetname" );

    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, "targetname" );

    var_4 = spawn( "script_model", var_3.origin );
    var_4 setmodel( "ctl_emergency_flare_animated" );
    maps\_utility::_id_0BC3( level._id_8249, var_4 );
    maps\_utility::_id_282D( var_4, "prison" );
    var_4 maps\_utility::_id_1402( "landed" );
    maps\_audio::aud_send_msg( "toss_flare", var_4 );
    playfxontag( level._effect["fx_flare_trail"], var_4, "TAG_FIRE_FX" );

    if ( isdefined( var_2 ) )
    {
        var_4._id_1032 = "flare";
        var_4 maps\_utility::_id_2629();
        var_5 = maps\castle_code::_id_7A41( var_0 );
        var_5 maps\_anim::_id_1246( var_4, var_2 );
    }
    else
    {
        var_6 = 1.0;

        while ( isdefined( var_3.target ) )
        {
            var_7 = common_scripts\utility::getstruct( var_3.target, "targetname" );

            if ( isdefined( var_3._id_72E2 ) )
                var_6 = var_3._id_72E2;
            else
                var_6 = 1.0;

            var_4 moveto( var_7.origin, var_6 );

            if ( isdefined( var_7.angles ) )
                var_4 rotateto( var_7.angles, var_6 );

            var_3 = var_7;
            wait(var_6);
        }
    }

    wait 0.05;
    stopfxontag( level._effect["fx_flare_trail"], var_4, "TAG_FIRE_FX" );
    playfxontag( level._effect["fx_flare_ambient"], var_4, "TAG_FIRE_FX" );
    common_scripts\utility::exploder( 833 );
    var_4 maps\_utility::_id_13DC( "landed" );
    var_8 = getent( var_1, "targetname" );

    if ( isdefined( var_8 ) )
        var_8 thread _id_77F8();
}

_id_72E3()
{
    wait 0.5;
    var_0 = getent( "enemy_flare_throw", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F();

    if ( maps\_utility::_id_13AF( var_1 ) )
        return;

    var_1 maps\_utility::_id_0A23( 1 );
    var_1._id_1032 = "generic";
    var_2 = maps\castle_code::_id_7A41( "align_flare_room" );
    var_2 thread maps\_anim::_id_1246( var_1, "guard_flare_toss" );
    common_scripts\utility::flag_set( "price_say_flare" );
    level _id_789A( "align_flare_room", "light_flare_1", "guard_flare_toss" );

    if ( common_scripts\utility::flag( "nvg_on" ) )
        thread _id_015F( 1 );
    else
        thread _id_015F();

    var_1 setgoalvolumeauto( getent( "prison_B2", "targetname" ) );
    var_1 maps\_utility::_id_0A23( 0 );
    var_3 = getentarray( "enemy_flare_throw_support", "targetname" );

    foreach ( var_5 in var_3 )
        var_5 maps\_utility::_id_166F();

    level thread _id_789A( "align_flare_room", "light_flare_2", "guard_flare_toss2" );
}

_id_015F( var_0 )
{
    level endon( "exited_prison" );

    if ( isdefined( var_0 ) )
        visionsetnight( "castle_nvg_blowout", 0.5 );

    for (;;)
    {
        level.player waittill( "night_vision_on" );
        visionsetnight( "castle_nvg_blowout" );
        level.player waittill( "night_vision_off" );
        wait 0.05;
    }
}

_id_77F8()
{
    level endon( "exited_prison" );
    self setlightcolor( ( 0.9, 0.44, 0.44 ) );
    var_0 = self getlightcolor();
    var_1 = ( 1.0, 0.5, 0.5 );
    var_2 = 2000;
    var_3 = gettime();

    for (;;)
    {
        if ( var_0 != var_1 )
        {
            var_4 = ( gettime() - var_3 ) / var_2;

            if ( var_4 >= 1.0 )
                var_0 = var_1;
            else
                var_0 = vectorlerp( var_0, var_1, var_4 );

            self setlightcolor( var_0 );
        }

        if ( level.player maps\_utility::_id_1008( "nightvision_on" ) )
            self setlightintensity( randomfloatrange( 4.0, 6.2 ) );
        else
            self setlightintensity( randomfloatrange( 1.3, 2.0 ) );

        wait(randomfloatrange( 0.05, 0.1 ));
    }
}

_id_72E4()
{
    var_0 = maps\castle_code::_id_7A41( "align_flare_room" );
    var_1 = getent( "spawner_meatshield_guard", "targetname" );
    var_2 = getent( "spawner_meatshield_prisoner", "targetname" );
    common_scripts\utility::flag_wait( "meatshield_start" );
    level thread _id_72E7();
    maps\_utility::_id_1425( "meatshield_room" );
    var_3 = var_1 maps\_utility::_id_166F();
    var_4 = var_2 maps\_utility::_id_166F();

    if ( maps\_utility::_id_13AF( var_3 ) || maps\_utility::_id_13AF( var_4 ) )
        return;

    var_3._id_1032 = "meatshield_guard";
    var_3 maps\_utility::_id_0A23( 1 );
    var_3 maps\_utility::_id_2611();
    var_4._id_1032 = "meatshield_prisoner";
    var_4 maps\_utility::_id_0A23( 1 );
    var_4 maps\_utility::_id_2611();
    var_4.name = "";
    var_4.team = "neutral";
    level thread _id_72E8( var_0, var_3, var_4 );
    level thread _id_72EA( var_0, var_3, var_4 );
    level thread _id_72EB( var_0, var_3, var_4 );
    level thread _id_72EC( var_0, var_3, var_4 );
    level thread _id_72E6( var_3 );
    level thread _id_72E5( var_3 );
}

_id_72E5( var_0 )
{
    level endon( "meatshield_done" );
    var_0 endon( "death" );
    var_0 common_scripts\utility::waittill_any( "flashbang", "grenade danger" );
    common_scripts\utility::flag_set( "neither_died" );
}

_id_72E6( var_0 )
{
    level endon( "meatshield_done" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( distancesquared( level.player.origin, var_0.origin ) < 62500 )
        {
            common_scripts\utility::flag_set( "neither_died" );
            return;
        }

        wait 0.05;
    }
}

_id_72E7()
{
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_2 kill();
            wait 1;
        }
    }
}

_id_72E8( var_0, var_1, var_2 )
{
    level endon( "meatshield_done" );
    var_1 thread _id_72E9();
    var_3 = [ var_1, var_2 ];
    var_0 maps\_anim::_id_11DD( var_3, "meatshield_start" );
    var_0 thread maps\_anim::_id_11D6( var_3, "meatshield_idle", "stop_meatshield_idle" );
}

_id_72E9()
{
    self endon( "damage" );
    self endon( "death" );
    level endon( "meatshield_done" );

    for (;;)
    {
        var_0 = level.player geteye();
        var_1 = bullettracepassed( var_0, self geteye(), 0, undefined );

        if ( var_1 )
        {
            var_2 = randomintrange( 2, 6 );

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                self shoot( 1.0, var_0 );
                wait 0.05;
            }
        }

        wait(randomfloatrange( 0.5, 2.0 ));
    }
}

_id_72EA( var_0, var_1, var_2 )
{
    level endon( "meatshield_done" );
    var_1 waittill( "damage" );
    common_scripts\utility::flag_set( "guard_died" );
}

_id_72EB( var_0, var_1, var_2 )
{
    level endon( "meatshield_done" );
    var_2 waittill( "damage" );
    common_scripts\utility::flag_set( "prisoner_died" );
}

_id_72EC( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait_any( "guard_died", "prisoner_died", "neither_died" );
    wait 0.1;
    common_scripts\utility::flag_set( "meatshield_done" );
    var_1 maps\_utility::_id_1902();
    var_2 maps\_utility::_id_1902();
    var_0 notify( "stop_meatshield_idle" );

    if ( common_scripts\utility::flag( "guard_died" ) && common_scripts\utility::flag( "prisoner_died" ) )
    {
        var_1 thread _id_72ED( "meatshield_double_kill" );
        var_2 thread _id_72ED( "meatshield_double_kill" );
    }
    else if ( common_scripts\utility::flag( "guard_died" ) && !common_scripts\utility::flag( "prisoner_died" ) )
    {
        var_1 maps\_utility::_id_1414();
        var_1 maps\_utility::_id_2749();
        var_2 maps\_utility::_id_1414();
    }
    else if ( common_scripts\utility::flag( "neither_died" ) )
    {
        var_1 maps\_utility::_id_1414();
        var_2 maps\_utility::_id_1414();
    }
    else
    {
        var_1 maps\_utility::_id_1414();
        var_2 thread _id_72ED( "meatshield_dies" );
    }
}

_id_72ED( var_0 )
{
    self._id_0EC6 = 1;
    maps\_utility::_id_26F6( 1 );
    maps\_utility::_id_2749();
}

_id_72EE()
{
    maps\_utility::_id_109B();
    self.pacifist = 0;
    maps\_utility::_id_1057();
    maps\_utility::_id_0EEC();
    maps\_utility::_id_2714();
    maps\_utility::_id_26F3( 1 );
    self._id_0F3C = 1;
    level._id_4877 _id_72EF( "prison_tame" );
    common_scripts\utility::flag_wait( "harass_guard_dead" );
    level._id_4877 _id_72EF( "prison_beast" );
    common_scripts\utility::flag_wait( "guard_stumble_dead" );
    level._id_4877 _id_72EF( "prison_tame" );
}

_id_72EF( var_0 )
{
    switch ( var_0 )
    {
        case "flare_room":
            maps\_utility::_id_109B();
            self.pacifist = 0;
            maps\_utility::_id_1071();
            maps\_utility::_id_27B8();
            maps\_utility::_id_2715();
            maps\_utility::_id_26F3( 0 );
            self._id_0F3C = 0;
            self._id_20AF = 1;
            self.ignoreme = 0;
            break;
        case "prison_tame":
            self._id_20AF = 0.5;
            break;
        default:
            self._id_20AF = 100;
            break;
    }
}

_id_72F0( var_0, var_1 )
{
    if ( !isalive( self ) )
        return;

    maps\_utility::_id_2724( var_1 );

    if ( var_0 )
    {
        maps\_utility::_id_2612( 1 );
        maps\_utility::_id_0D72( 0 );
    }
    else
    {
        maps\_utility::_id_2612( 0 );
        maps\_utility::_id_0D72( 1 );
    }
}

_id_72F1()
{
    var_0 = getentarray( "cleanup_security_office", "script_noteworthy" );
    var_1 = getentarray( "guard_security_office", "targetname" );
    var_2 = maps\_utility::_id_263E( "security_office" );
    var_0 = maps\_shg_common::_id_1690( var_0, var_1 );
    var_0 = maps\_shg_common::_id_1690( var_0, var_2 );

    if ( isdefined( level._id_7DCD ) )
        level._id_7DCD delete();

    maps\_utility::_id_135B( var_0 );
    level notify( "kill_security_cinematic" );
    stopcinematicingame();
}

_id_72F2()
{
    var_0 = getentarray( "cleanup_prison", "script_noteworthy" );
    var_1 = getentarray( "spawner_harass_scene", "targetname" );
    var_0 = maps\_shg_common::_id_1690( var_0, var_1 );

    if ( isdefined( level._id_7887 ) )
        var_0 = maps\_shg_common::_id_1690( var_0, level._id_7887 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2] ) )
            var_0[var_2] delete();
    }

    maps\_utility::_id_261A( 831 );
    maps\_utility::_id_261A( 832 );
    maps\_utility::_id_261A( 833 );
    maps\_utility::_id_261A( 702 );
    level thread maps\castle_courtyard_activity::_id_810D( level._id_4877 );
}

_id_72F3()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "objective_clear_prison" );
    var_0 = maps\_utility::_id_2766( "castle_pri_cmon", "castle_pri_overhere" );
    maps\castle_code::_id_80E2( var_0, "price_say_door_open", 15, 0, 0 );
    maps\_utility::_id_168C( "castle_pri_illhandle" );
}

_id_72F4()
{
    self endon( "death" );
    level endon( "player_impulsive" );
    level endon( "player_entered_prison" );
    common_scripts\utility::flag_wait( "price_say_waitforlights" );
    maps\_utility::_id_168C( "castle_pri_nightvisionon" );
    level._id_4877._id_0160 = level._id_4877.headmodel;
    thread _id_0162( "head_price_europe_c_nvg", "start_flare_room" );
    thread _id_72F5();
    maps\_utility::_id_168C( "castle_pri_takecare" );
    common_scripts\utility::flag_wait( "price_say_ready" );
    maps\_utility::_id_168C( "castle_pri_ready" );
}

_id_72F5( var_0 )
{
    wait 1;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( var_0 )
    {
        if ( common_scripts\utility::flag( "nvg_on" ) )
            level.player thread maps\_utility::_id_1823( "disable_nvg", 3 );
    }
    else if ( !var_0 )
    {
        if ( !common_scripts\utility::flag( "nvg_on" ) )
        {
            level.player maps\_utility::_id_1F61( "nvg" );
            common_scripts\utility::flag_wait_or_timeout( "nvg_on", 3 );
        }
    }
}

_id_72F6()
{
    self endon( "death" );
    common_scripts\utility::flag_wait_any( "price_activate_switch", "player_impulsive", "player_entered_prison" );

    if ( common_scripts\utility::flag( "price_activate_switch" ) )
    {
        wait 1;
        maps\_utility::_id_168C( "castle_pri_weaponsfree" );
    }
    else
    {
        if ( !common_scripts\utility::flag( "player_impulsive" ) )
            common_scripts\utility::flag_set( "player_impulsive" );

        common_scripts\utility::flag_set( "at_power_switch" );
    }
}

_id_72F7()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "price_say_endtheirdays" );
    wait 1.5;
    maps\_utility::_id_168C( "castle_pri_quiet" );
    level._id_4877 thread _id_72F4();
    level._id_4877 _id_72F6();
    level endon( "price_say_flare" );
    common_scripts\utility::flag_wait( "price_say_split_up" );
    wait 2.0;
    maps\_utility::_id_168C( "castle_pri_sweepthrough" );
    maps\_utility::_id_168C( "castle_pri_howfew" );
    maps\_utility::_id_265A( "allies" );
    level._id_4877 maps\_utility::_id_265E( "seal" );
}

_id_72F8()
{
    common_scripts\utility::flag_wait( "price_say_flare" );
    wait 3.0;
    maps\_utility::_id_168C( "castle_pri_usingflares" );
    wait 1.0;
    maps\_utility::_id_168C( "castle_pri_oldway" );

    if ( isdefined( level._id_4877._id_0160 ) && level._id_4877.headmodel == "head_price_europe_c_nvg" )
        thread _id_0162( level._id_4877._id_0160, "exited_prison" );

    thread _id_72F5( 1 );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait( "price_say_wave2" );
    maps\_utility::_id_168C( "castle_pri_reinforcements2" );
    thread _id_0161();
    common_scripts\utility::flag_wait( "meatshield_start" );
    common_scripts\utility::flag_wait_any( "prisoner_died", "guard_died", "neither_died" );

    if ( common_scripts\utility::flag( "prisoner_died" ) )
        maps\_utility::_id_168C( "castle_pri_nevermind" );
    else if ( common_scripts\utility::flag( "guard_died" ) )
        maps\_utility::_id_168C( "castle_pri_getoutofhere2" );

    common_scripts\utility::flag_wait( "price_say_finddead" );
    maps\_utility::_id_168C( "castle_pri_tenminutes" );
    wait 10.5;

    if ( !common_scripts\utility::flag( "exited_prison" ) )
        maps\_utility::_id_168C( "castle_pri_fallbehind" );
}

_id_0161()
{
    common_scripts\utility::flag_wait( "start_price_nag_before_meatshield" );

    if ( !common_scripts\utility::flag( "meatshield_start" ) )
    {
        maps\_utility::_id_168C( "castle_pri_onpoint" );
        var_0 = maps\_utility::_id_2766( "castle_pri_startmoving", "castle_pri_onpoint" );
        maps\castle_code::_id_80E2( var_0, "meatshield_start", 15, 0, 0 );
    }
}

_id_0162( var_0, var_1 )
{
    level endon( var_1 );
    var_2 = 0;

    while ( !var_2 )
    {
        if ( !maps\_utility::_id_26AB( level.player.origin, level.player.angles, self.origin, cos( 45 ) ) )
        {
            var_2 = 1;
            continue;
        }

        wait 0.1;
    }

    level._id_4877 detach( level._id_4877.headmodel, "" );
    level._id_4877 attach( var_0, "", 1 );
    level._id_4877.headmodel = var_0;
}

_id_72F9()
{
    var_0 = level._id_5228;
    level._id_5228 = level._effect["nvg_dlight"];
    common_scripts\utility::flag_wait( "exited_prison" );
    level._id_5228 = var_0;
}
