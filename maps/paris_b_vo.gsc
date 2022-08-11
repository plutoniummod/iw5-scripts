// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_50E2();
    _id_50E3();
    _id_50E4();
}
#using_animtree("generic_human");

_id_50E2()
{
    maps\paris_shared::_id_47C7( [ "paris_lns_checktoxins", "paris_b_cin_negativecontam" ] );
    maps\paris_shared::_id_509E( "lonestar", [ "paris_lns_masksoff", "paris_lns_onelight", "paris_lns_restofgign", "paris_lns_friendofmine", "paris_lns_incatacombs", "paris_lns_rogerlast", "paris_lns_wontkillyou", "paris_lns_frostmove", "paris_lns_frostoverhere", "paris_lns_keepmoving", "paris_lns_letsgo", "paris_lns_moveout", "paris_lns_thisway", "paris_lns_dontjointhem", "paris_lns_stayfrosty", "paris_lns_thatsvolk", "paris_lns_jackpot", "paris_lns_movemovemove", "paris_lns_uptheladder", "paris_lns_blacksedan", "paris_lns_dontletescape", "paris_lns_hotwirevehicle", "paris_lns_gottaroll", "paris_lns_gettingaway", "paris_lns_layingdown", "paris_lns_gunit", "paris_rno_targetingus", "paris_lns_drive2", "paris_lns_steponit", "paris_lns_anotherrun", "paris_lns_upahead", "paris_lns_rideshotgun", "paris_lns_floorit", "paris_lns_taketheshot", "paris_lns_cargosecure", "paris_lns_arentyou", "paris_lns_hindincoming", "paris_lns_backherenow", "paris_lns_vehicledown", "paris_lns_cmere" ] );
    level._id_11B7["lonestar"]["paris_lns_onelight"] = %paris_a_b_switch_sandman_pt2_facial;
    maps\paris_shared::_id_509E( "reno", [ "paris_rno_downhere", "paris_rno_hewill", "paris_rno_bodies", "paris_rno_flashbang", "paris_rno_gotarunner", "paris_rno_uptheladder", "paris_rno_enemytank", "paris_ggn_shortcut", "paris_ggn_deadahead", "paris_ggn_igothim", "paris_ggn_heshit", "paris_rno_onourway" ] );
    maps\paris_shared::_id_47C7( [ "paris_b_cin_negative" ] );
    maps\paris_shared::_id_509E( "gign_leader", [ "paris_ggn_understood", "paris_ggn_followme", "paris_ggn_chemstrike", "paris_ggn_mustpay", "paris_ggn_bienvenue", "paris_rno_suspectedloc", "paris_ggn_clear", "paris_ggn_allclear", "paris_ggn_keepmoving", "paris_ggn_moveup", "paris_ggn_checkright", "paris_ggn_thisway", "paris_ggn_yougo" ] );
    maps\paris_shared::_id_47C7( [ "paris_hqr_fixonposition", "paris_hqr_sendingqrf", "paris_hqr_capturenokill", "paris_hqr_bringhimin" ] );
    maps\paris_shared::_id_47C7( [ "paris_trk_spinningup" ] );
    common_scripts\utility::flag_init( "flag_conversation_in_progress" );
}

_id_50E3()
{
    common_scripts\utility::flag_init( "flag_intro_cinematic" );
    common_scripts\utility::flag_init( "flag_dialogue_one_light" );
    common_scripts\utility::flag_init( "flag_dialogue_one_light_complete" );
    common_scripts\utility::flag_init( "flag_dialogue_stay_close" );
    common_scripts\utility::flag_init( "flag_dialogue_this_way_post_squeeze" );
    common_scripts\utility::flag_init( "flag_dialogue_catacombs_post_breach" );
    common_scripts\utility::flag_init( "flag_dialogue_catacombs_lets_move" );
    common_scripts\utility::flag_init( "flag_dialogue_everyone_in_truck" );
    common_scripts\utility::flag_init( "flag_dialogue_another_shooter" );
    common_scripts\utility::flag_init( "flag_dialogue_frenchie_signal_clear_sewer" );
    common_scripts\utility::flag_init( "flag_dialogue_frenchie_check_right" );
    common_scripts\utility::flag_init( "flag_dialogue_plant_flares" );
    common_scripts\utility::flag_init( "flag_dialogue_tank_targeting_us" );
    common_scripts\utility::flag_init( "flag_dialogue_use_javelin" );
    common_scripts\utility::flag_init( "flag_dialogue_nice_shootin" );
    common_scripts\utility::flag_init( "flag_dialogue_ac130_player_killed_targets" );
    common_scripts\utility::flag_init( "flag_dialogue_makarov_men" );
    common_scripts\utility::flag_init( "flag_dialogue_in_the_truck" );
}

_id_50E4()
{
    switch ( level._id_1F19 )
    {
        case "intro_cinematic":
            thread _id_7724();
        case "default":
        case "catacombs_start":
            thread _id_7726();
            thread _id_50F2();
            thread _id_772D();
        case "catacombs_skull_chamber":
            thread _id_772E();
            thread _id_7730();
            thread _id_7731();
            thread _id_772F();
            thread _id_7732();
            thread _id_7733();
        case "chase":
            thread _id_7734();
            thread _id_7735();
            thread _id_7736();
            thread _id_7737();
            thread _id_7738();
            thread _id_7739();
            thread _id_773A();
            thread _id_773B();
        case "chase_canal":
            thread _id_773C();
            thread _id_773D();
        case "chase_ending":
            thread _id_773E();
            thread _id_773F();
            thread _id_7740();
            thread _id_7741();
            break;
        default:
    }
}

_id_7724()
{
    common_scripts\utility::flag_wait( "flag_intro_cinematic" );
    wait 8;
    thread maps\_utility::_id_11F4( "paris_lns_checktoxins" );
    wait 12;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_b_cin_negativecontam" );
    maps\paris_shared::_id_50A0();
}

_id_7725( var_0 )
{
    maps\paris_shared::_id_509F();
    level._id_7683 thread maps\_utility::_id_168C( "paris_lns_onelight" );
    wait 3;
    common_scripts\utility::flag_set( "flag_dialogue_one_light_complete" );
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_understood" );
    maps\paris_shared::_id_50A0();
}

_id_7726()
{
    common_scripts\utility::flag_wait( "flag_dialogue_stay_close" );
    maps\paris_shared::_id_509F();
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_followme" );
    maps\paris_shared::_id_50A0();
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_hqr_fixonposition" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_incatacombs" );
    maps\_utility::_id_11F4( "paris_hqr_sendingqrf" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_rogerlast" );
    maps\paris_shared::_id_50A0();
    wait 2;
    maps\paris_shared::_id_509F();
    level._id_7684 maps\_utility::_id_168C( "paris_rno_downhere" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_wontkillyou" );
    maps\paris_shared::_id_50A0();
}

_id_50F2()
{
    common_scripts\utility::flag_wait( "flag_dialogue_frenchie_signal_clear_sewer" );
    maps\paris_shared::_id_509F();
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_allclear" );
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_moveup" );
    maps\paris_shared::_id_50A0();
    common_scripts\utility::flag_wait( "flag_dialogue_follow_me" );
    wait 1;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_restofgign" );
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_chemstrike" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_friendofmine" );
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_mustpay" );
    level._id_7684 maps\_utility::_id_168C( "paris_rno_hewill" );
    maps\paris_shared::_id_50A0();
    maps\_utility::_id_26DE( "flag_dialogue_smells_down_here", 4 );
    common_scripts\utility::flag_wait( "flag_dialogue_this_way_post_squeeze" );
    maps\paris_shared::_id_509F();
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_thisway" );
    wait 1;
    level._id_76BA maps\_utility::_id_168C( "paris_rno_suspectedloc" );
    maps\paris_shared::_id_50A0();
}

_id_7727()
{
    level notify( "catacombs_nag_dialogue_stop" );
    level endon( "catacombs_nag_dialogue_stop" );
    childthread _id_772B();
    var_0 = maps\paris_shared::_id_50BC( [ "paris_ggn_keepmoving", "paris_ggn_moveup", "paris_ggn_thisway" ] );
    var_1 = maps\paris_shared::_id_50BC( [ "paris_lns_frostmove", "paris_lns_frostoverhere", "paris_lns_keepmoving", "paris_lns_letsgo", "paris_lns_moveout", "paris_lns_thisway" ] );

    for (;;)
        _id_7728( var_0, var_1 );
}

_id_7728( var_0, var_1 )
{
    level endon( "catacombs_nag_dialogue_guy_moved" );
    wait(randomfloatrange( 15, 25 ));
    level._id_76BA thread _id_7729( var_0 maps\paris_shared::_id_50BD() );
    wait(randomfloatrange( 25, 35 ));
    level._id_76BA thread _id_7729( var_0 maps\paris_shared::_id_50BD() );
    level waittill( "forever" );
}

_id_7729( var_0 )
{
    maps\paris_shared::_id_509F();
    level._id_772A = 1;
    maps\_utility::_id_168C( var_0 );
    level._id_772A = undefined;
    maps\paris_shared::_id_50A0();
}

_id_772B()
{
    var_0 = level._id_76BA;
    var_1 = 78;
    var_2 = var_0.origin;

    for (;;)
    {
        if ( distance( var_0.origin, var_2 ) > var_1 )
        {
            var_2 = var_0.origin;
            level notify( "catacombs_nag_dialogue_guy_moved" );
        }
        else if ( common_scripts\utility::flag( "flag_conversation_in_progress" ) && !isdefined( level._id_772A ) )
            level notify( "catacombs_nag_dialogue_guy_moved" );

        wait 1;
    }
}

_id_772C()
{
    level notify( "catacombs_nag_dialogue_stop" );
}

_id_772D()
{
    common_scripts\utility::flag_wait( "flag_dialogue_catacombs_post_breach" );
    wait 8;
    maps\paris_shared::_id_509F();
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_bienvenue" );
    wait 0.75;
    level._id_7683 maps\_utility::_id_168C( "paris_lns_stayfrosty" );
    maps\_audio::aud_send_msg( "mus_catacombs_entrance" );
    maps\paris_shared::_id_50A0();
}

_id_772E()
{
    common_scripts\utility::flag_wait( "flag_dialogue_catacombs_bodies" );
    maps\paris_shared::_id_509F();
    level._id_7684 maps\_utility::_id_168C( "paris_rno_bodies" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_dontjointhem" );
    maps\paris_shared::_id_50A0();
}

_id_772F()
{
    common_scripts\utility::flag_wait( "flag_dialogue_catacombs_lets_move" );
    wait 3;

    if ( !common_scripts\utility::flag( "flag_volk_catacombs_escape" ) )
    {
        maps\paris_shared::_id_509F();
        level._id_7683 maps\_utility::_id_168C( "paris_lns_letsgo" );
        maps\paris_shared::_id_50A0();
    }
}

_id_7730()
{
    common_scripts\utility::flag_wait( "flag_volk_catacombs_escape" );
    level._id_7684 maps\_utility::_id_168C( "paris_rno_flashbang" );
}

_id_7731()
{
    common_scripts\utility::flag_wait( "flag_dialogue_makarov_men" );
    wait 2;
    maps\paris_shared::_id_509F();
    level._id_7684 maps\_utility::_id_168C( "paris_rno_gotarunner" );
    maps\_audio::aud_send_msg( "mus_catacombs_chase" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_thatsvolk" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_jackpot" );
    maps\_utility::_id_11F4( "paris_hqr_capturenokill" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_movemovemove" );
    maps\paris_shared::_id_50A0();
}

_id_7732()
{
    common_scripts\utility::flag_wait( "flag_volk_boiler_room_escape" );
    wait 0.5;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_dontletescape" );
    level._id_7684 maps\_utility::_id_168C( "paris_rno_uptheladder" );
    maps\paris_shared::_id_50A0();
}

_id_7733()
{
    common_scripts\utility::flag_wait( "flag_dialogue_get_up_ladder" );

    if ( !common_scripts\utility::flag( "flag_obj_capture_volk_position_change_1" ) )
    {
        maps\paris_shared::_id_509F();
        level._id_7683 maps\_utility::_id_168C( "paris_lns_uptheladder" );
        maps\paris_shared::_id_50A0();
    }
}

_id_7734()
{
    common_scripts\utility::flag_wait( "trigger_found_bomb_truck" );
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_blacksedan" );
    maps\paris_shared::_id_50A0();
}

_id_7735()
{
    common_scripts\utility::flag_wait( "flag_dialogue_in_the_truck" );
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_hotwirevehicle" );
    level._id_76BA maps\_utility::_id_168C( "paris_ggn_yougo" );
    maps\paris_shared::_id_50A0();
    wait 6;

    if ( !common_scripts\utility::flag( "flag_player_in_truck" ) )
    {
        maps\paris_shared::_id_509F();
        level._id_7683 maps\_utility::_id_168C( "paris_lns_gottaroll" );
        maps\paris_shared::_id_50A0();
    }
}

_id_7736()
{
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    wait 1.5;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_gettingaway" );
    wait 3;
    level._id_7683 maps\_utility::_id_168C( "paris_lns_layingdown" );
    maps\paris_shared::_id_50A0();
}

_id_7737()
{
    common_scripts\utility::flag_wait( "flag_player_in_truck" );
    wait 12;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_gunit" );
    maps\paris_shared::_id_50A0();
}

_id_7738()
{
    common_scripts\utility::flag_wait( "flag_crash_gaz_barricade_started" );
    wait 5.5;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_backherenow" );
    maps\paris_shared::_id_50A0();
}

_id_7739()
{
    common_scripts\utility::flag_wait( "spawn_tank_01" );
    wait 1;
    maps\paris_shared::_id_509F();
    level._id_7684 maps\_utility::_id_168C( "paris_rno_enemytank" );
    maps\paris_shared::_id_50A0();
}

_id_773A()
{
    common_scripts\utility::flag_wait( "flag_dialogue_tank_targeting_us" );
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_rno_targetingus" );
    maps\paris_shared::_id_50A0();
}

_id_773B()
{
    common_scripts\utility::flag_wait( "flag_van_slam_storefront_01" );
    wait 5.5;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_steponit" );
    maps\paris_shared::_id_50A0();
}

_id_773C()
{
    common_scripts\utility::flag_wait( "spawn_tank_02" );
    wait 5;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_hindincoming" );
    maps\paris_shared::_id_50A0();
    common_scripts\utility::flag_wait( "flag_heli_canal_pass_01" );
    wait 7;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_drive2" );
    maps\paris_shared::_id_50A0();
    wait 2;
    maps\paris_shared::_id_509F();
    level._id_7684 maps\_utility::_id_168C( "paris_ggn_shortcut" );
    maps\paris_shared::_id_50A0();
}

_id_773D()
{
    common_scripts\utility::flag_wait( "flag_uaz_post_river" );
    wait 0.5;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_anotherrun" );
    maps\paris_shared::_id_50A0();
}

_id_773E()
{
    common_scripts\utility::flag_wait( "flag_dialogue_got_volk_chase" );
    maps\paris_shared::_id_509F();
    level._id_7684 maps\_utility::_id_168C( "paris_ggn_igothim" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_rideshotgun" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_floorit" );
    maps\paris_shared::_id_50A0();
}

_id_773F()
{
    common_scripts\utility::flag_wait( "flag_player_to_the_front_complete" );
    wait 1.25;
    maps\paris_shared::_id_509F();

    if ( !common_scripts\utility::flag( "flag_player_shot_sedan_ending" ) )
        level._id_7684 maps\_utility::_id_168C( "paris_ggn_deadahead" );

    if ( !common_scripts\utility::flag( "flag_player_shot_sedan_ending" ) )
        level._id_7683 maps\_utility::_id_168C( "paris_lns_taketheshot" );

    maps\paris_shared::_id_50A0();
}

_id_7740()
{
    common_scripts\utility::flag_wait( "flag_player_shot_sedan_ending" );

    if ( !common_scripts\utility::flag( "flag_failure_did_not_shoot" ) )
        level._id_7684 maps\_utility::_id_168C( "paris_ggn_heshit" );
}

_id_7741()
{
    common_scripts\utility::flag_wait( "flag_volk_ending_start" );
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_vehicledown" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_cmere" );
    maps\paris_shared::_id_50A0();
    wait 2;
    maps\paris_shared::_id_509F();
    level._id_7683 maps\_utility::_id_168C( "paris_lns_cargosecure" );
    level._id_7683 maps\_utility::_id_168C( "paris_lns_arentyou" );
    maps\_utility::_id_11F4( "paris_hqr_bringhimin" );
    level._id_7684 maps\_utility::_id_168C( "paris_rno_onourway" );
    maps\_utility::_id_11F4( "paris_trk_spinningup" );
    maps\paris_shared::_id_50A0();
}
