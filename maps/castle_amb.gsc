// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_audio::_id_173F();
    thread maps\_utility::_id_194E( "castle_ruins_rain1" );
    maps\_audio::_id_16F4();
    maps\_audio::_id_1735( "default" );
    maps\_audio::_id_156E( "default" );
    _id_4ED3();
    _id_4ED4();
    _id_496E();
    _id_4ED6();
}

_id_4ED3()
{
    common_scripts\utility::flag_init( "aud_chute_deployed" );
}

_id_4ED4()
{

}

_id_496E()
{
    thread _id_4988();
}

_id_4ED6()
{
    maps\_audio::_id_174C( ::_id_54B9 );
}

_id_54B9( var_0, var_1 )
{
    var_2 = 1;

    switch ( var_0 )
    {
        case "map_start":
            thread _id_54BA();
            break;
        case "turn_off_fake_nvg":
            level.player thread maps\_utility::play_sound_on_entity( "nightvision_remove_plr_default" );
            level.player thread maps\_utility::play_sound_on_entity( "item_nightvision_off" );
            break;
        case "btr_sequence_start":
            wait 24;
            common_scripts\utility::play_sound_in_space( "cstl_drop_btr", ( 1485.0, -841.0, 154.0 ) );
            break;
        case "price_sets_c4":
            wait 3.3;
            level._id_4877 maps\_utility::play_sound_on_entity( "cstl_detpack_c4_plant_metal" );
            break;
        case "player_stealth_kill":
            wait 0.7;
            common_scripts\utility::play_sound_in_space( "cstl_stealthkill_player", level.player.origin );
            break;
        case "price_drag_body":
            var_3 = spawn( "script_origin", level._id_4877.origin );
            var_3 linkto( level._id_4877 );
            var_3 maps\_audio::_id_170B( "cstl_body_drag_mud" );
            wait 2;
            var_3 maps\_utility::play_sound_on_entity( "cstl_body_drag_mud" );
            wait 5;
            var_3 maps\_audio::_id_170F( "cstl_body_drag_mud" );
            wait 1;
            var_3 delete();
            break;
        case "player_plant_c4_platform":
            wait 0.5;
            level.player maps\_utility::play_sound_on_entity( "cstl_detpack_c4_plant_metal2d" );
            break;
        case "guard_jumps_down":
            var_1 thread maps\_audio::_id_170B( "cstl_cig_put_out" );
            wait 0.9;
            var_1 thread maps\_utility::play_sound_on_entity( "cstl_land_mud" );
            wait 1.93;
            var_1 thread maps\_utility::play_sound_on_entity( "cstl_cig_put_out" );
            wait 4;
            var_1 maps\_audio::_id_170F( "cstl_cig_put_out" );
            break;
        case "price_enters_security_office":
            wait 1;
            level._id_4877 playsound( "cstl_price_gun_foley" );
            wait 1.6;
            level._id_4877 playsound( "cstl_price_pre_door" );
            wait 5;
            common_scripts\utility::play_sound_in_space( "cstl_price_door_slam", ( 540.0, -296.0, 132.0 ) );
            break;
        case "price_use_dead_guard_hand":
            var_4 = spawn( "script_origin", ( 741.0, -18.0, 128.0 ) );
            wait 10.65;
            level._id_4877 playsound( "cstl_price_gun_foley" );
            wait 1.446;
            level._id_4877 playsound( "cstl_price_sec_drag" );
            wait 1.561;
            thread common_scripts\utility::play_sound_in_space( "cstl_sec_beep", ( 756.0, -14.0, 132.0 ) );
            wait 0.33;
            var_4 playsound( "cstl_sec_door" );
            var_4 moveto( ( 685.0, -20.0, 128.0 ), 2 );
            wait 0.19;
            level._id_4877 playsound( "cstl_price_sec_drag_2" );
            wait 5;
            var_4 delete();
            break;
        case "price_cut_lights":
            var_3 = spawn( "script_origin", level._id_4877.origin );
            var_3 playsound( "cstl_panel_off" );
            var_3 playloopsound( "cstl_fusebox_sparks" );
            wait 1.3;
            var_3 stoploopsound();
            wait 1;
            var_3 delete();
            break;
        case "toss_flare":
            var_5 = var_1;
            var_5 thread maps\_utility::play_sound_on_tag( "cstl_flare_start", "TAG_FIRE_FX" );
            var_5 thread maps\_utility::_id_258E( "cstl_flare_loop", "TAG_FIRE_FX" );
            break;
        case "price_open_prison_exit_door":
            wait 3;
            common_scripts\utility::play_sound_in_space( "cstl_prison_bolt", ( 35.0, 465.0, -223.0 ) );
            wait 0.2;
            common_scripts\utility::play_sound_in_space( "cstl_prison_door", ( 35.0, 465.0, -223.0 ) );
            break;
        case "player_plant_c4_bridge":
            wait 1.2;
            level.player maps\_utility::play_sound_on_entity( "cstl_detpack_wall_plant" );
            break;
        case "btr_drives_across_bridge":
            var_3 = spawn( "script_origin", var_1.origin );
            var_3 linkto( var_1 );
            var_3 playloopsound( "cstl_btr_idling_01" );
            common_scripts\utility::flag_wait( "wet_wall_start" );
            var_3 stoploopsound();
            wait 0.5;
            var_3 delete();
            break;
        case "player_shimmy_boards":
            level.player playsound( "bridge_wood_creak" );
            break;
        case "price_set_detcord":
            thread _id_54BB();
            break;
        case "price_start_climb":
            level._id_4877 maps\_audio::_id_170B( "cstl_price_climb_wall" );
            wait 9.2;
            level._id_4877 playloopsound( "cstl_price_climb_wall" );
            wait 14.9;
            level._id_4877 stoploopsound();
            wait 1;
            break;
        case "price_start_climb2":
            level._id_4877 playsound( "cstl_price_climb_wall_2" );
            wait 17;
            break;
        case "player_start_climb":
            wait 3.5;
            level._id_4877 stoploopsound();
            level._id_4877 maps\_audio::_id_170F( "cstl_price_climb_wall" );
            level._id_4877 maps\_audio::_id_170B( "cstl_price_climb_wall_2" );
            break;
        case "play_alarm":
            thread _id_54BD();
            break;
        case "player_wetwall_jump":
            thread _id_54BE();
            break;
        case "player_crash_to_kitchen":
            thread _id_54C0();
            break;
        case "enemy_roll_cart":
            var_1 playloopsound( "cstl_kitchen_cart_roll" );
            break;
        case "cart_impact":
            var_1 stoploopsound();
            common_scripts\utility::play_sound_in_space( "cstl_kitchen_cart_impact", var_1.origin );
            break;
        case "rpg_hits_spire":
            thread common_scripts\utility::play_sound_in_space( "cstl_spire_crumble", ( -468.0, 3533.0, 367.0 ) );
            thread common_scripts\utility::play_sound_in_space( "cstl_spire_crumble_2", ( -468.0, 3533.0, 367.0 ) );
            break;
        case "bridge_detonate":
            var_1 playsound( "cstl_btr_metal_fall" );
            break;
        case "player_jumped_to_bridge":
            wait 0.5;
            level.player maps\_utility::play_sound_on_entity( "cstl_land_truck" );
            break;
        case "price_enter_vehicle_start":
            thread _id_54C3();
            break;
        case "price_in_truck":
            thread _id_54C4();
            break;
        case "player_enters_truck":
            thread _id_54C6();
            break;
        case "start_driving":
            thread _id_54C7();
            break;
        case "truck_ride_start":
            thread _id_54C9();
            break;
        case "detonate_c4":
            thread _id_54CC();
            break;
        case "truck_doors_crash":
            thread _id_54CD();
            break;
        case "fence_debris":
            thread _id_54CF();
            break;
        case "truck_off_cliff":
            thread _id_54D0();
            thread _id_54D4();
            wait 0.5;
            thread _id_54D5();
            wait 2.5;

            if ( common_scripts\utility::flag( "aud_chute_deployed" ) )
            {
                thread _id_54D6();
                wait 2;
                thread _id_4EDD( "player_landed_on_bank", 0 );
            }

            break;
        case "escape_truck_explodes":
            thread _id_54D3();
            break;
        case "chute_deployed":
            thread _id_4EDC();
            common_scripts\utility::flag_set( "aud_chute_deployed" );
            break;
        default:
            maps\_audio::_id_177E( "castle_aud_msg_handler() unhandled message: " + var_0 );
            var_2 = 0;
            break;
    }

    return var_2;
}

_id_54BA()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_parachute_intro_plr", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_54BB()
{
    level._id_54BC = spawn( "script_origin", level._id_4877.origin );
    level._id_54BC playsound( "cstl_price_wires_bomb", "sounddone" );
    level._id_54BC linkto( level._id_4877 );
    thread maps\_audio::_id_1783( level._id_54BC );
}

_id_54BD()
{
    var_0 = spawn( "script_origin", ( 841.0, 3286.0, 603.0 ) );
    var_0 playloopsound( "cstl_wetwall_siren" );
    common_scripts\utility::flag_wait( "stop_peeping" );
    wait 2;
    maps\_audio::_id_15F3( var_0, 1.5 );
}

_id_54BE()
{
    level._id_54BF = spawn( "script_origin", level.player.origin );
    level._id_54BF playsound( "cstl_wetwall_fall_01", "sounddone" );
    thread maps\_audio::_id_1783( level._id_54BF );
}

_id_54C0()
{
    level._id_54C1 = spawn( "script_origin", level.player.origin );
    level._id_54C1 playsound( "cstl_wetwall_fall_02", "sounddone" );
    level._id_54C2 = spawn( "script_origin", level.player.origin );
    level._id_54C2 playsound( "cstl_wetwall_fall_03", "sounddone" );
    thread maps\_audio::_id_1783( level._id_54C1 );
    thread maps\_audio::_id_1783( level._id_54C2 );
    maps\_audio_zone_manager::_id_156C( "castle_kitchen_int" );
}

_id_4988()
{
    soundsettimescalefactor( "norestrict2d", 0 );
    soundsettimescalefactor( "grondo2d", 0 );
}

_id_54C3()
{
    wait 0.4;
    level._id_4877 playsound( "cstl_price_into_jeep" );
}

_id_54C4()
{
    level._id_54C5 = spawn( "script_origin", level._id_4877.origin );
    level._id_54C5 playloopsound( "cstl_jeep_engine_no_start", "sounddone" );
}

_id_54C6()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_player_into_jeep", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_54C7()
{
    if ( isdefined( level._id_54C5 ) )
    {
        level._id_54C5 stoploopsound();
        thread maps\_audio::_id_1783( level._id_54C5 );
    }

    level._id_54C8 = spawn( "script_origin", level._id_4877.origin );
    level._id_54C8 linkto( level._id_4877 );
    level._id_54C8 playsound( "cstl_jeep_engine_start", "sounddone" );
    thread maps\_audio::_id_1783( level._id_54C8 );
    maps\_audio_music::_id_15A8( 2.5 );
}

_id_54C9()
{
    level._id_54CA = spawn( "script_origin", level.player.origin );
    level._id_54CA playloopsound( "cstl_escape_engine_01", "sounddone" );
    level._id_54CB = spawn( "script_origin", level.player.origin );
    level._id_54CB playloopsound( "cstl_escape_tires_01", "sounddone" );
    maps\_utility::_id_1428( "castle_mx_escape" );
}

_id_54CC()
{
    var_0 = spawn( "script_origin", ( -246.0, -1237.0, 228.0 ) );
    var_0 playsound( "cstl_c4_expl_ending" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_54CD()
{
    level._id_54CB stoploopsound();
    thread maps\_audio::_id_1783( level._id_54CB );
    level._id_54CE = spawn( "script_origin", level.player.origin );
    level._id_54CE playloopsound( "cstl_escape_tires_02", "sounddone" );
    level._id_819D = spawn( "script_origin", level.player.origin );
    level._id_819D playsound( "cstl_escape_doors", "sounddone" );
    thread maps\_audio::_id_1783( level._id_819D );
}

_id_54CF()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_escape_fence_sml", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_54D0()
{
    level._id_54CA stoploopsound();
    level._id_54CE stoploopsound();
    level._id_54D1 = spawn( "script_origin", level.player.origin );
    level._id_54D1 playsound( "cstl_escape_fence", "sounddone" );
    thread maps\_audio::_id_1783( level._id_54D1 );
    level._id_54D2 = spawn( "script_origin", level.player.origin );
    level._id_54D2 playsound( "cstl_escape_engine_02", "sounddone" );
    thread maps\_audio::_id_1783( level._id_54D2 );
    wait 1.5;
    thread maps\_audio::_id_1783( level._id_54CA );
    thread maps\_audio::_id_1783( level._id_54CE );
}

_id_54D3()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_jeep_explosion", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_54D4()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_fence_break", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_54D5()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playloopsound( "cstl_wind_falling" );
    wait 3;
    var_0 stoploopsound();
    wait 1;
    var_0 delete();
}

_id_54D6()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 playsound( "cstl_chute_deploy", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
    maps\_utility::_id_1428( "castle_mx_ending" );
}

_id_4EDC()
{
    var_0 = spawn( "script_origin", level.player.origin );
    wait 0.75;
    var_0 playsound( "cstl_chute_ripcord", "sounddone" );
    var_0 waittill( "sounddone" );
    var_0 delete();
}

_id_4EDD( var_0, var_1 )
{
    var_2 = spawn( "script_origin", level.player.origin );
    var_2 playloopsound( "cstl_chute_glide_loop" );
    common_scripts\utility::flag_wait( var_0 );
    wait(var_1);
    maps\_audio::_id_15F3( var_2, 1 );
}
