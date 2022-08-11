// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_50E2();
    _id_50E3();
    _id_50E4();
}

_id_50E2()
{
    maps\paris_shared::_id_47C7( [ "paris_lns_stilldirty_r", "paris_lns_stilldirty", "paris_lns_rogerwilco_r", "paris_lns_ondeck", "paris_lns_norook", "paris_lns_patchmethrough", "paris_lns_threeminutes", "paris_lns_gogogo2_r", "paris_lns_acrossthestreet_r", "paris_lns_downthestairs_r", "paris_lns_engageenagage_r", "paris_lns_frostwithme_r", "paris_lns_onbalcony_r", "paris_lns_topfloorclear", "paris_lns_yourstatus", "paris_lns_getingame_r", "paris_lns_getdownhere", "paris_lns_restaurantahead", "paris_lns_watchyourfirenorth", "paris_lns_wheresvolk_r", "paris_lns_gotyourback_r", "paris_lns_linkup", "paris_lns_acrosscourtyard_r", "paris_lns_coverfire_r", "paris_lns_gogogo_r", "paris_lns_topofstairs_r", "paris_lns_howmanywegot", "paris_lns_closeairsupport_r", "paris_lns_markirstrobes_r", "paris_lns_idtargets", "paris_lns_getstrobeson_r", "paris_lns_multiplehits_r", "paris_lns_amiss_r", "paris_lns_nohits_r", "paris_lns_zerokills_r", "paris_lns_directhit_r", "paris_lns_thatsahit_r", "paris_lns_thatsamiss_r", "paris_lns_endofalley_r", "paris_lns_needastrobe_r", "paris_lns_throwsmoke", "paris_lns_putsmoke", "paris_lns_useastrobe_r", "paris_lns_markarmor_r", "paris_lns_tosssmoke", "paris_lns_gunshipcantsee", "paris_lns_markwithsmoke", "paris_lns_designatetarget", "paris_lns_russiansroping", "paris_lns_imiprovise", "paris_lns_btrdestroyed", "paris_lns_thanksforassist", "paris_lns_goodworkbrother_r", "paris_lns_belowground", "paris_lns_getdowntheladder", "paris_lns_downtheladder", "paris_lns_headbelow" ] );
    maps\paris_shared::_id_47C7( [ "paris_rno_lottarooks", "paris_rno_watchyourstep_r", "paris_rno_compromised", "paris_rno_buildingacross", "paris_rno_heavyfire", "paris_rno_checkdoor_r", "paris_rno_clear2_r", "paris_rno_lesamis_r", "paris_rno_allofem", "paris_rno_moving_r", "paris_rno_threeringcircus_r", "paris_rno_tangosinbound_r" ] );
    maps\paris_shared::_id_47C7( [ "paris_ggn_muchlonger", "paris_ggn_threemins", "paris_ggn_gladtosee", "paris_ggn_fourmen", "paris_ggn_downthealley_r", "paris_ggn_movemove_r", "paris_ggn_incatacombs_r", "paris_ggn_entranceahead_r", "paris_ggn_entranceahead2_r", "paris_ggn_overhere2_r" ] );
    maps\paris_shared::_id_47C7( [ "paris_fso_onracetrack" ] );
    maps\paris_shared::_id_47C7( [ "paris_hqr_triagecivilians", "paris_hqr_heavyresistance", "paris_hqr_gignpinned" ] );
    maps\paris_shared::_id_47C7( [ "paris_plt_goinghot", "paris_plt_engaging", "paris_plt_targetconfirmed", "paris_plt_rogermark", "paris_plt_rogerspot", "paris_plt_ontheway", "paris_plt_engaging2", "paris_plt_goodmark", "paris_plt_roundsondeck", "paris_plt_shotoutdangerclose", "paris_plt_firing", "paris_plt_orbitreestablished", "paris_plt_sensorsback", "paris_plt_calltargets", "paris_plt_readyformark", "paris_plt_readyfortargets", "paris_plt_bingofuel" ] );
    maps\paris_shared::_id_47C7( [ "paris_grb_louvre_v2" ] );
    maps\paris_shared::_id_47C7( [ "paris_trk_meetyou" ] );
    maps\paris_shared::_id_47C7( [ "paris_ggn1_thiswayhurry", "paris_ggn1_cmoncmon" ] );
    maps\paris_shared::_id_47C7( [ "paris_ggn2_overhere", "paris_ggn2_hurrycomeon" ] );
    common_scripts\utility::flag_init( "flag_conversation_in_progress" );
}

_id_50E3()
{
    common_scripts\utility::flag_init( "flag_dialogue_opening" );
    common_scripts\utility::flag_init( "flag_dialogue_watch_your_step" );
    common_scripts\utility::flag_init( "flag_dialogue_gign_in_trouble" );
    common_scripts\utility::flag_init( "flag_dialogue_in_the_game" );
    common_scripts\utility::flag_init( "flag_dialogue_down_the_stairs" );
    common_scripts\utility::flag_init( "flag_dialogue_go_hot_complete" );
    common_scripts\utility::flag_init( "flag_dialogue_bookstore_balcony" );
    common_scripts\utility::flag_init( "flag_dialogue_bookstore_top_floor_clear_1" );
    common_scripts\utility::flag_init( "flag_dialogue_bookstore_heavy_fire_1" );
    common_scripts\utility::flag_init( "flag_dialogue_bookstore_heavy_fire_2" );
    common_scripts\utility::flag_init( "flag_dialogue_check_door" );
    common_scripts\utility::flag_init( "flag_dialogue_check_door_complete" );
    common_scripts\utility::flag_init( "flag_dialogue_bookstore_clear" );
    common_scripts\utility::flag_init( "flag_dialogue_press_the_attack_complete" );
    common_scripts\utility::flag_init( "flag_dialogue_restaurant_meeting" );
    common_scripts\utility::flag_init( "flag_rpg_top_of_stairs_dialogue" );
    common_scripts\utility::flag_init( "flag_dialogue_ac130_player_has_strobe" );
    common_scripts\utility::flag_init( "flag_dialogue_down_the_alley" );
    common_scripts\utility::flag_init( "flag_dialogue_heli_courtyard" );
    common_scripts\utility::flag_init( "flag_dialogue_courtyard_2_clear" );
    common_scripts\utility::flag_init( "flag_dialogue_btr_alley" );
    common_scripts\utility::flag_init( "flag_dialogue_destroyed_btr_with_rpg" );
    common_scripts\utility::flag_init( "flag_dialogue_entrance_ahead" );
    common_scripts\utility::flag_init( "flag_dialogue_manhole_prompt" );
    common_scripts\utility::flag_init( "flag_dialogue_catacombs_post_breach" );
    common_scripts\utility::flag_init( "flag_dialogue_everyone_in_truck" );
    common_scripts\utility::flag_init( "flag_dialogue_another_shooter" );
    common_scripts\utility::flag_init( "flag_dialogue_use_javelin" );
    common_scripts\utility::flag_init( "flag_dialogue_nice_shootin" );
    common_scripts\utility::flag_init( "flag_dialogue_ac130_player_killed_targets" );
    common_scripts\utility::flag_init( "flag_dialogue_makarov_men" );
    common_scripts\utility::flag_init( "flag_dialogue_escape_timer_started" );
    common_scripts\utility::flag_init( "flag_dialogue_in_the_truck" );
}

_id_50E4()
{
    switch ( level._id_1F19 )
    {
        case "default":
        case "rooftops":
            thread _id_50E5();
            thread _id_50E6();
            thread _id_50E7();
            thread _id_50E9();
        case "stairwell":
            thread _id_50E8();
            thread _id_50EA();
            thread _id_50EB();
            thread _id_01CC();
            thread _id_01CD();
            thread _id_01CE();
            thread _id_50EC();
            thread _id_50ED();
        case "restaurant_approach":
            thread _id_50EE();
            thread _id_50EF();
            thread _id_50F0();
            thread _id_50F1();
            thread _id_50F2();
            thread _id_5100();
        case "ac_moment":
            thread _id_50F3();
            thread _id_50F5();
            thread _id_50F8();
            thread _id_50F9();
            thread _id_50FB();
            thread _id_0026();
            thread _id_50FD();
        case "sewer_entrance":
            thread _id_50FE();
            break;
        default:
    }
}

_id_50E5()
{
    common_scripts\utility::flag_wait( "flag_dialogue_opening" );
    wait 2.0;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_grb_louvre_v2" );
    wait 0.473;
    maps\_utility::_id_11F4( "paris_hqr_triagecivilians" );
    maps\paris_shared::_id_50A0();
    wait 2.1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_stilldirty" );
    wait 0.15;
    maps\_utility::_id_11F4( "paris_lns_ondeck" );
    maps\_utility::_id_11F4( "paris_trk_meetyou" );
    maps\paris_shared::_id_50A0();
    wait 2;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_hqr_heavyresistance" );
    maps\_utility::_id_11F4( "paris_lns_rogerwilco_r" );
    maps\paris_shared::_id_50A0();
    common_scripts\utility::flag_wait( "flag_check_vitals" );
    wait 2;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_lottarooks" );
    maps\_utility::_id_11F4( "paris_lns_norook" );
    maps\paris_shared::_id_50A0();
}

_id_50E6()
{
    common_scripts\utility::flag_wait( "flag_dialogue_watch_your_step" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_watchyourstep_r" );
    maps\paris_shared::_id_50A0();
}

_id_50E7()
{
    common_scripts\utility::flag_wait( "flag_dialogue_gignpinned" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_hqr_gignpinned" );
    maps\_utility::_id_11F4( "paris_lns_patchmethrough" );
    maps\_utility::_id_11F4( "paris_ggn_muchlonger" );
    maps\_utility::_id_11F4( "paris_lns_threeminutes" );
    maps\_utility::_id_11F4( "paris_ggn_threemins" );
    maps\_utility::_id_11F4( "paris_lns_gogogo2_r" );
    maps\paris_shared::_id_50A0();
}

_id_50E9()
{
    common_scripts\utility::flag_wait( "player_rooftop_jump_complete" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_acrossthestreet_r" );
    maps\paris_shared::_id_50A0();
}

_id_50E8()
{
    common_scripts\utility::flag_wait( "flag_dialogue_in_the_game" );
    wait 0.75;
    maps\paris_shared::_id_509F();
    var_0 = common_scripts\utility::random( [ "paris_rno_buildingacross", "paris_rno_compromised" ] );
    maps\_utility::_id_11F4( var_0 );
    maps\_utility::_id_11F4( "paris_lns_getingame_r" );
    common_scripts\utility::flag_set( "flag_dialogue_go_hot_complete" );
    wait 0.75;
    maps\_utility::_id_11F4( "paris_lns_downthestairs_r" );
    maps\paris_shared::_id_50A0();
}

_id_50EA()
{
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_5" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_frostwithme_r" );
    maps\paris_shared::_id_50A0();
}

_id_50EB()
{
    common_scripts\utility::flag_wait( "flag_dialogue_bookstore_balcony" );

    if ( !common_scripts\utility::flag( "flag_bookstore_combat_top_rear" ) && !common_scripts\utility::flag( "flag_bookstore_combat_interior" ) )
    {
        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_onbalcony_r" );
        maps\paris_shared::_id_50A0();
    }
}

_id_01CC()
{
    common_scripts\utility::flag_wait( "flag_dialogue_bookstore_top_floor_clear_1" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_topfloorclear" );
    maps\paris_shared::_id_50A0();
}

_id_01CD()
{
    common_scripts\utility::flag_wait( "flag_dialogue_bookstore_heavy_fire_1" );
    var_0 = randomfloatrange( 1.5, 3.5 );
    wait(var_0);
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_heavyfire" );
    maps\paris_shared::_id_50A0();
}

_id_01CE()
{
    common_scripts\utility::flag_wait( "flag_dialogue_bookstore_heavy_fire_2" );
    var_0 = randomfloatrange( 1.5, 3.5 );
    wait(var_0);
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_heavyfire" );
    maps\_utility::_id_11F4( "paris_lns_getdownhere" );
    maps\paris_shared::_id_50A0();
}

_id_50ED()
{
    common_scripts\utility::flag_wait( "flag_dialogue_bookstore_clear" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_clear2_r" );
    maps\paris_shared::_id_50A0();
    common_scripts\utility::flag_set( "flag_dialogue_press_the_attack_complete" );
}

_id_50EC()
{
    common_scripts\utility::flag_wait( "flag_dialogue_check_door" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_checkdoor_r" );
    maps\_utility::_id_11F4( "paris_lns_restaurantahead" );
    maps\_utility::_id_11F4( "paris_lns_watchyourfirenorth" );
    maps\_utility::delaythread( 2.5, common_scripts\utility::flag_set, "flag_dialogue_check_door_complete" );
    maps\_utility::_id_11F4( "paris_ggn_gladtosee" );
    maps\paris_shared::_id_50A0();
}

_id_50EE()
{
    common_scripts\utility::flag_wait( "flag_dialogue_lasamis" );
    maps\paris_shared::_id_509F();
    level.player thread maps\_utility::play_sound_on_tag( level._id_11BB["paris_ggn1_thiswayhurry"], undefined, 1 );
    wait 1.35;
    thread maps\_utility::_id_11F4( "paris_rno_lesamis_r" );
    wait 1.25;
    level.player thread maps\_utility::play_sound_on_tag( level._id_11BB["paris_ggn1_cmoncmon"], undefined, 1 );
    wait 1.25;
    thread _id_01CF();
    maps\_utility::_id_11F4( "paris_rno_allofem" );
    maps\paris_shared::_id_50A0();
    wait 2;
    maps\_audio::aud_send_msg( "mus_reached_gign" );
}

_id_01CF()
{
    wait 1.25;
    level.player thread maps\_utility::play_sound_on_tag( level._id_11BB["paris_ggn2_hurrycomeon"], undefined, 1 );
    wait 1.25;
    level.player maps\_utility::play_sound_on_tag( level._id_11BB["paris_ggn2_overhere"], undefined, 1 );
}

_id_50EF()
{
    common_scripts\utility::flag_wait( "flag_dialogue_restaurant_meeting" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_yourstatus" );
    maps\_utility::_id_11F4( "paris_ggn_fourmen" );
    maps\_utility::_id_11F4( "paris_lns_wheresvolk_r" );
    maps\_utility::_id_11F4( "paris_ggn_incatacombs_r" );
    maps\_utility::_id_11F4( "paris_lns_gotyourback_r" );
    maps\_audio::aud_send_msg( "mus_follow_gign" );
    maps\_utility::_id_11F4( "paris_lns_linkup" );
    maps\paris_shared::_id_50A0();
}

_id_50F0()
{
    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_2" );
    maps\paris_shared::_id_509F();
    maps\_audio::aud_send_msg( "mus_cross_courtyard1" );
    maps\_utility::_id_11F4( "paris_lns_acrosscourtyard_r" );
    maps\_utility::_id_11F4( "paris_lns_coverfire_r" );
    maps\_utility::_id_11F4( "paris_rno_moving_r" );
    maps\_utility::_id_11F4( "paris_lns_gogogo_r" );
    maps\paris_shared::_id_50A0();
    common_scripts\utility::flag_set( "flag_rpg_top_of_stairs_dialogue" );
}

_id_50F1()
{
    common_scripts\utility::flag_wait( "flag_rpg_top_of_stairs_dialogue" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_topofstairs_r" );
    maps\paris_shared::_id_50A0();
}

_id_50F2()
{
    common_scripts\utility::flag_wait( "flag_cross_courtyard_complete" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_ggn_entranceahead_r" );
    maps\paris_shared::_id_50A0();
}

_id_5100()
{
    common_scripts\utility::flag_wait( "flag_joga_studio_dialogue" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_acrossthestreet_r" );
    maps\paris_shared::_id_50A0();
}

_id_50F3()
{
    common_scripts\utility::flag_wait( "flag_ac130_moment_dialogue" );
    wait 2.0;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_rno_tangosinbound_r" );
    maps\_utility::_id_11F4( "paris_lns_howmanywegot" );
    maps\_utility::_id_11F4( "paris_rno_threeringcircus_r" );
    maps\_utility::_id_11F4( "paris_lns_closeairsupport_r" );
    maps\_audio::aud_send_msg( "mus_ac130_replies" );
    maps\_utility::_id_11F4( "paris_fso_onracetrack" );
    maps\paris_shared::_id_50A0();
    thread _id_50F4();
}

_id_50F4()
{
    common_scripts\utility::flag_wait( "flag_dialogue_ac130_player_has_strobe" );
    var_0 = undefined;

    while ( !common_scripts\utility::flag( "flag_dialogue_ac130_player_killed_targets" ) )
    {
        wait 1;
        common_scripts\utility::flag_waitopen( "flag_strobes_in_use" );

        if ( common_scripts\utility::flag( "flag_dialogue_ac130_player_killed_targets" ) )
            break;

        maps\paris_shared::_id_509F();

        for (;;)
        {
            var_1 = common_scripts\utility::random( [ "paris_lns_markirstrobes_r", "paris_lns_idtargets", "paris_lns_throwsmoke", "paris_lns_putsmoke", "paris_lns_getstrobeson_r" ] );

            if ( !isdefined( var_0 ) || var_0 != var_1 )
            {
                var_0 = var_1;
                break;
            }
        }

        maps\_utility::_id_11F4( var_1 );
        maps\paris_shared::_id_50A0();
        wait 10;
    }
}

_id_50F5()
{
    var_0 = [ "enemy_courtyard_2_wave_1", "enemy_courtyard_2_wave_2", "enemy_courtyard_2_wave_3", "enemy_courtyard_2_brt_crew", "enemy_ai_initial_ac_moment", "enemy_ai_initial_ac_moment_gaz", "enemy_courtyard_2_heli_crew" ];
    var_1 = undefined;
    var_2 = undefined;

    for (;;)
    {
        var_3 = level common_scripts\utility::waittill_any_return( "air_support_strobe_no_targets", "air_support_strobe_popped", "air_suport_strobe_fired_upon", "air_support_strobe_killed", "air_support_strobe_ready" );

        switch ( var_3 )
        {
            case "air_support_strobe_no_targets":
                continue;
            case "air_support_strobe_popped":
                continue;
            case "air_support_strobe_ready":
                if ( common_scripts\utility::flag( "btr_cortyard_killed" ) && maps\paris_shared::_id_507E( var_0 ) < 4 )
                    continue;

                for (;;)
                {
                    var_4 = common_scripts\utility::random( [ "paris_plt_orbitreestablished", "paris_plt_sensorsback", "paris_plt_calltargets", "paris_plt_readyformark", "paris_plt_readyfortargets" ] );

                    if ( !isdefined( var_1 ) || var_4 != var_1 )
                    {
                        var_1 = var_4;
                        break;
                    }
                }

                maps\_utility::_id_11F4( var_4 );
                continue;
            case "air_suport_strobe_fired_upon":
                for (;;)
                {
                    var_4 = common_scripts\utility::random( [ "paris_plt_goinghot", "paris_plt_engaging", "paris_plt_targetconfirmed", "paris_plt_rogerspot", "paris_plt_ontheway", "paris_plt_engaging2", "paris_plt_goodmark", "paris_plt_roundsondeck", "paris_plt_shotoutdangerclose", "paris_plt_firing", "paris_plt_rogermark" ] );

                    if ( !isdefined( var_2 ) || var_4 != var_2 )
                    {
                        var_2 = var_4;
                        break;
                    }
                }

                maps\_utility::_id_11F4( var_4 );
                continue;
            case "air_support_strobe_killed":
                _id_50F6();
                continue;
        }
    }
}

_id_50F6()
{
    level endon( "stop_air_support_strobe_kill_dialogue" );

    if ( level._id_3EB5 )
        var_0 = "paris_lns_btrdestroyed";
    else
    {
        var_1 = _id_0622::_id_3EB6();

        for (;;)
        {
            switch ( var_1 )
            {
                case 0:
                    var_0 = common_scripts\utility::random( [ "paris_lns_nohits_r", "paris_lns_zerokills_r", "paris_lns_thatsamiss_r" ] );
                    break;
                case 1:
                    var_0 = common_scripts\utility::random( [ "paris_lns_directhit_r", "paris_lns_thatsahit_r" ] );
                    break;
                default:
                    var_0 = common_scripts\utility::random( [ "paris_lns_multiplehits_r", "paris_lns_directhit_r" ] );
            }

            if ( !isdefined( level._id_50F7 ) || var_0 != level._id_50F7 )
            {
                level._id_50F7 = var_0;
                break;
            }
        }
    }

    wait 2;

    if ( !common_scripts\utility::flag( "flag_dialogue_courtyard_2_clear" ) )
        maps\_utility::_id_11F4( var_0 );
}

_id_50F8()
{
    common_scripts\utility::flag_wait( "flag_dialogue_down_the_alley" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_ggn_downthealley_r" );
    maps\_utility::_id_11F4( "paris_lns_gogogo2_r" );
    maps\paris_shared::_id_50A0();
}

_id_50F9()
{
    common_scripts\utility::flag_wait( "flag_dialogue_heli_unloading" );
    wait 1;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_russiansroping" );
    maps\paris_shared::_id_50A0();
}

_id_50FA()
{
    common_scripts\utility::flag_wait( "flag_dialogue_heli_courtyard" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_ggn_entranceahead2_r" );
    maps\paris_shared::_id_50A0();
}

_id_50FB()
{
    common_scripts\utility::flag_wait( "flag_dialogue_btr_alley" );

    if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
        return;

    maps\_utility::_id_11F4( "paris_lns_endofalley_r" );
    _id_50FC( 5, 15 );

    if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
        return;

    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_markarmor_r" );
    maps\paris_shared::_id_50A0();
    _id_50FC( 6, 15 );

    while ( !common_scripts\utility::flag( "btr_cortyard_killed" ) )
    {
        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_needastrobe_r" );
        maps\paris_shared::_id_50A0();
        _id_50FC( 8, 15 );

        if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_useastrobe_r" );
        maps\paris_shared::_id_50A0();
        _id_50FC( 8, 15 );

        if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_tosssmoke" );
        maps\paris_shared::_id_50A0();
        _id_50FC( 8, 15 );

        if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_gunshipcantsee" );
        maps\paris_shared::_id_50A0();
        _id_50FC( 8, 15 );

        if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_markwithsmoke" );
        maps\paris_shared::_id_50A0();
        _id_50FC( 8, 15 );

        if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_designatetarget" );
        maps\paris_shared::_id_50A0();
        _id_50FC( 8, 15 );

        if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
            break;
    }
}

_id_0026()
{
    common_scripts\utility::flag_wait( "flag_dialogue_destroyed_btr_with_rpg" );
    wait 2;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_imiprovise" );
    maps\paris_shared::_id_50A0();
}

_id_50FC( var_0, var_1 )
{
    for (;;)
    {
        maps\_utility::_id_09C9( maps\_utility::_id_09E7, var_0 );
        maps\_utility::_id_09C9( common_scripts\utility::flag_wait, "flag_strobes_in_use" );
        maps\_utility::_id_09CB();

        if ( common_scripts\utility::flag( "flag_strobes_in_use" ) )
        {
            maps\_utility::_id_09C9( maps\_utility::_id_09E7, var_1 );
            maps\_utility::_id_09C9( common_scripts\utility::flag_waitopen, "flag_strobes_in_use" );
            maps\_utility::_id_275B();
            continue;
        }

        break;
    }
}

_id_50FD()
{
    common_scripts\utility::flag_wait( "flag_dialogue_courtyard_2_clear" );
    wait 3;
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_goodworkbrother_r" );
    maps\_utility::_id_11F4( "paris_ggn_entranceahead2_r" );
    wait 1;
    maps\_utility::_id_11F4( "paris_plt_bingofuel" );
    maps\_utility::_id_11F4( "paris_lns_thanksforassist" );
    maps\paris_shared::_id_50A0();
}

_id_50FE()
{
    common_scripts\utility::flag_wait( "flag_dialogue_manhole_prompt" );
    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_ggn_overhere2_r" );
    maps\paris_shared::_id_50A0();
    common_scripts\utility::flag_wait( "flag_player_manhole_ready" );
    wait 2;

    if ( common_scripts\utility::flag( "flag_player_manhole" ) )
        return;

    maps\paris_shared::_id_509F();
    maps\_utility::_id_11F4( "paris_lns_getdowntheladder" );
    maps\paris_shared::_id_50A0();

    while ( !common_scripts\utility::flag( "flag_player_manhole" ) )
    {
        wait 10;
        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_belowground" );
        maps\paris_shared::_id_50A0();
        wait 20;

        if ( common_scripts\utility::flag( "flag_player_manhole" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_downtheladder" );
        maps\paris_shared::_id_50A0();
        wait 30;

        if ( common_scripts\utility::flag( "flag_player_manhole" ) )
            break;

        maps\paris_shared::_id_509F();
        maps\_utility::_id_11F4( "paris_lns_headbelow" );
        maps\paris_shared::_id_50A0();
        wait 20;
    }
}
