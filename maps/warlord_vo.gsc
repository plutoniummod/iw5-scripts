// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::flag_init( "dialogue_in_progress" );
    common_scripts\utility::flag_init( "intro_line_1" );
    common_scripts\utility::flag_init( "intro_line_2" );
    common_scripts\utility::flag_init( "river_dialogue" );
    common_scripts\utility::flag_init( "river_intro_vo_done" );
    common_scripts\utility::flag_init( "dont_be_stupid_dialogue" );
    common_scripts\utility::flag_init( "river_technical_dialogue" );
    common_scripts\utility::flag_init( "second_beat_move_dialogue" );
    common_scripts\utility::flag_init( "river_technicals_move_dialogue" );
    common_scripts\utility::flag_init( "prone_encounter_start_dialogue" );
    common_scripts\utility::flag_init( "prone_encounter_well_done_dialogue" );
    common_scripts\utility::flag_init( "tire_necklace_dialogue" );
    common_scripts\utility::flag_init( "off_the_road_dialogue" );
    common_scripts\utility::flag_init( "river_big_moment_done_dialogue" );
    common_scripts\utility::flag_init( "river_spotted_dialogue" );
    common_scripts\utility::flag_init( "church_mouse_dialogue" );
    common_scripts\utility::flag_init( "bridge_go_loud_dialogue" );
    common_scripts\utility::flag_init( "bridge_guys_dead_dialogue" );
    common_scripts\utility::flag_init( "victim_burn_vo" );
    common_scripts\utility::flag_init( "technical_steal_broken_vo" );
    common_scripts\utility::flag_init( "cover_us_dialogue" );
    common_scripts\utility::flag_init( "multiple_guards_dialogue" );
    common_scripts\utility::flag_init( "more_militia_dialogue" );
    common_scripts\utility::flag_init( "push_forward_dialogue" );
    common_scripts\utility::flag_init( "rally_on_me_dialogue" );
    common_scripts\utility::flag_init( "go_noisy_dialogue" );
    common_scripts\utility::flag_init( "inf_both_moving_dialogue" );
    common_scripts\utility::flag_init( "large_militia_dialogue" );
    common_scripts\utility::flag_init( "inf_spotted_dialogue" );
    common_scripts\utility::flag_init( "large_group_dialogue" );
    common_scripts\utility::flag_init( "breaching_factory_dialogue" );
    common_scripts\utility::flag_init( "breaching_factory_dialogue_done" );
    common_scripts\utility::flag_init( "inf_encounter_2_vo_done" );
    common_scripts\utility::flag_init( "inf_nice_shot_vo" );
    common_scripts\utility::flag_init( "no_ak_vo" );
    common_scripts\utility::flag_init( "player_technical_dialogue" );
    common_scripts\utility::flag_init( "technical_1_dialogue" );
    common_scripts\utility::flag_init( "roof_right_dialogue" );
    common_scripts\utility::flag_init( "contact_front_1_dialogue" );
    common_scripts\utility::flag_init( "contact_left_1_dialogue" );
    common_scripts\utility::flag_init( "contact_left_2_dialogue" );
    common_scripts\utility::flag_init( "technical_2_dialogue" );
    common_scripts\utility::flag_init( "contact_front_2_dialogue" );
    common_scripts\utility::flag_init( "contact_right_1_dialogue" );
    common_scripts\utility::flag_init( "contact_left_3_dialogue" );
    common_scripts\utility::flag_init( "contact_left_4_dialogue" );
    common_scripts\utility::flag_init( "contact_front_3_dialogue" );
    common_scripts\utility::flag_init( "technical_ahead_dialogue" );
    common_scripts\utility::flag_init( "militia_vo_done" );
    common_scripts\utility::flag_init( "mortar_run_dialogue" );
    common_scripts\utility::flag_init( "mortar_door_dialogue" );
    common_scripts\utility::flag_init( "mortar_roof_fall_dialogue" );
    common_scripts\utility::flag_init( "head_to_mortar_dialogue" );
    common_scripts\utility::flag_init( "keep_firing_mortar" );
    common_scripts\utility::flag_init( "regroup_dialogue" );
    common_scripts\utility::flag_init( "mortar_targets_dialogue" );
    common_scripts\utility::flag_init( "house_door_dialogue" );
    common_scripts\utility::flag_init( "player_rpg_dialogue" );
    common_scripts\utility::flag_init( "getting_away_dialogue" );
    common_scripts\utility::flag_init( "cleanupcrew_dialogue" );
    common_scripts\utility::flag_init( "defensive_positions_dialogue" );
    common_scripts\utility::flag_init( "secure_dialogue" );
    common_scripts\utility::flag_init( "beautiful_relationship_dialogue" );
    common_scripts\utility::flag_init( "money_wired_dialogue" );
    common_scripts\utility::flag_init( "fast_pay_dialogue" );
    common_scripts\utility::flag_init( "confrontation_vo_finished" );
    common_scripts\utility::flag_init( "church_breach_ally_dialogue" );
    level._id_6E3B = 0;
    _id_50E2();
    thread _id_6E3C();
}

_id_50E2()
{
    level._id_11BB["warlord_nik_onehour"] = "warlord_nik_onehour";
    level.scr_sound["soap"]["warlord_pri_lowprofile"] = "warlord_pri_lowprofile";
    level.scr_sound["price"]["warlord_pri_trynottodie"] = "warlord_pri_trynottodie";
    level.scr_sound["soap"]["warlord_mct_rogerthat"] = "warlord_mct_rogerthat";
    level.scr_sound["soap"]["warlord_pri_somuch"] = "warlord_pri_somuch";
    level.scr_sound["militia"]["warlord_mlt1_everyonedead"] = "warlord_mlt1_everyonedead";
    level.scr_sound["militia"]["warlord_mlt2_notall"] = "warlord_mlt2_notall";
    level.scr_sound["militia"]["warlord_mlt1_findothers"] = "warlord_mlt1_findothers";
    level.scr_sound["soap"]["warlord_mct_tangosapproaching"] = "warlord_mct_tangosapproaching";
    level.scr_sound["price"]["warlord_pri_duck"] = "warlord_pri_duck";
    level.scr_sound["price"]["warlord_pri_move3"] = "warlord_pri_move3";
    level.scr_sound["soap"]["warlord_pri_twoxrays"] = "warlord_pri_twoxrays";
    level.scr_sound["price"]["warlord_pri_welldoneyuri"] = "warlord_pri_welldoneyuri";
    level.scr_sound["soap"]["warlord_mct_clear2"] = "warlord_mct_clear2";
    level.scr_sound["militia"]["warlord_mlt1_didyouknow"] = "warlord_mlt1_didyouknow";
    level.scr_sound["militia"]["warlord_mlt2_ohreally"] = "warlord_mlt2_ohreally";
    level.scr_sound["militia"]["warlord_mlt1_walkedright"] = "warlord_mlt1_walkedright";
    level.scr_sound["militia"]["warlord_mlt1_poppedhim"] = "warlord_mlt1_poppedhim";
    level.scr_sound["militia"]["warlord_mlt3_wasanidiot"] = "warlord_mlt3_wasanidiot";
    level.scr_sound["militia"]["warlord_mlt1_whydidthey"] = "warlord_mlt1_whydidthey";
    level.scr_sound["militia"]["warlord_mlt3_ratherbehere"] = "warlord_mlt3_ratherbehere";
    level.scr_sound["militia"]["warlord_mlt1_thatstrue"] = "warlord_mlt1_thatstrue";
    level.scr_sound["militia"]["warlord_mlt3_howmuch"] = "warlord_mlt3_howmuch";
    level.scr_sound["militia"]["warlord_mlt1_cigarette"] = "warlord_mlt1_cigarette";
    level.scr_sound["militia"]["warlord_mlt3_makeitlast"] = "warlord_mlt3_makeitlast";
    level.scr_sound["militia"]["warlord_mlt1_sob"] = "warlord_mlt1_sob";
    level.scr_sound["militia"]["warlord_mlt3_butyourwife"] = "warlord_mlt3_butyourwife";
    level.scr_sound["militia"]["warlord_mlt2_outsmart"] = "warlord_mlt2_outsmart";
    level.scr_sound["victim"]["warlord_civ_notlikethat"] = "warlord_civ_notlikethat";
    level.scr_sound["victim"]["warlord_civ_scream"] = "warlord_civ_scream";
    level.scr_sound["price"]["warlord_pri_handlethemlater"] = "warlord_pri_handlethemlater";
    level.scr_sound["militia_1"]["warlord_mlt2_wouldnt"] = "warlord_mlt2_wouldnt";
    level.scr_sound["civ_1"]["warlord_civ_myfamily"] = "warlord_civ_myfamily";
    level.scr_sound["militia_1"]["warlord_mlt2_timetopay"] = "warlord_mlt2_timetopay";
    level.scr_sound["civ_3"]["warlord_civ_noplease"] = "warlord_civ_noplease";
    level.scr_sound["militia_1"]["warlord_mlt2_whathewanted"] = "warlord_mlt2_whathewanted";
    level.scr_sound["price"]["warlord_pri_toomany"] = "warlord_pri_toomany";
    level.scr_sound["soap"]["warlord_mct_execution"] = "warlord_mct_execution";
    level.scr_sound["price"]["warlord_pri_yourcall"] = "warlord_pri_yourcall";
    level.scr_sound["soap"]["warlord_mct_bastards"] = "warlord_mct_bastards";
    level.scr_sound["price"]["warlord_pri_takethemout"] = "warlord_pri_takethemout";
    level.scr_sound["price"]["warlord_pri_bastards"] = "warlord_pri_bastards";
    level.scr_sound["price"]["warlord_pri_moveup2"] = "warlord_pri_moveup2";
    level.scr_sound["price"]["warlord_pri_alrightgetready"] = "warlord_pri_alrightgetready";
    level.scr_sound["price"]["warlord_pri_getdownnow"] = "warlord_pri_getdownnow";
    level.scr_sound["price"]["warlord_pri_getoffroad"] = "warlord_pri_getoffroad";
    level.scr_sound["price"]["warlord_pri_easy"] = "warlord_pri_easy";
    level.scr_sound["militia"]["warlord_mlt1_stormcoming"] = "warlord_mlt1_stormcoming";
    level.scr_sound["militia"]["warlord_mlt2_saywhen"] = "warlord_mlt2_saywhen";
    level.scr_sound["militia"]["warlord_mlt1_today"] = "warlord_mlt1_today";
    level.scr_sound["price"]["warlord_pri_allclear"] = "warlord_pri_allclear";
    level.scr_sound["soap"]["warlord_mct_holdup"] = "warlord_mct_holdup";
    level.scr_sound["soap"]["warlord_mct_2moreonbridge"] = "warlord_mct_2moreonbridge";
    level.scr_sound["price"]["warlord_pri_waitfortruck"] = "warlord_pri_waitfortruck";
    level.scr_sound["price"]["warlord_pri_dropem"] = "warlord_pri_dropem";
    level.scr_sound["price"]["warlord_pri_moveup"] = "warlord_pri_moveup";
    level.scr_sound["soap"]["warlord_pri_uptheroad"] = "warlord_pri_uptheroad";
    level.scr_sound["price"]["warlord_pri_coverus"] = "warlord_pri_coverus";
    level.scr_sound["price"]["warlord_pri_getupladder"] = "warlord_pri_getupladder";
    level.scr_sound["price"]["warlord_pri_getinposition"] = "warlord_pri_getinposition";
    level.scr_sound["price"]["warlord_pri_twohostiles"] = "warlord_pri_twohostiles";
    level.scr_sound["soap"]["warlord_pri_multipleguards"] = "warlord_pri_multipleguards";
    level.scr_sound["price"]["warlord_pri_militia"] = "warlord_pri_militia";
    level.scr_sound["soap"]["warlord_mct_boundingup"] = "warlord_mct_boundingup";
    level.scr_sound["price"]["warlord_pri_moving"] = "warlord_pri_moving";
    level.scr_sound["price"]["warlord_pri_move2"] = "warlord_pri_move2";
    level.scr_sound["soap"]["warlord_mct_moving"] = "warlord_mct_moving";
    level.scr_sound["price"]["warlord_pri_bounding"] = "warlord_pri_bounding";
    level.scr_sound["soap"]["warlord_mct_bounding2"] = "warlord_mct_bounding2";
    level.scr_sound["price"]["warlord_pri_breachingfactory"] = "warlord_pri_breachingfactory";
    level.scr_sound["price"]["warlord_mct_clear"] = "warlord_mct_clear";
    level.scr_sound["soap"]["warlord_mct_bloodyempty"] = "warlord_mct_bloodyempty";
    level._id_11BB["warlord_pri_dryhole"] = "warlord_pri_dryhole";
    level._id_11BB["warlord_kgr_rvthere"] = "warlord_kgr_rvthere";
    level.scr_sound["price"]["warlord_pri_hopetheydid"] = "warlord_pri_hopetheydid";
    level.scr_sound["soap"]["warlord_mct_headsup"] = "warlord_mct_headsup";
    level.scr_sound["price"]["warlord_pri_compromised"] = "warlord_pri_compromised";
    level.scr_sound["price"]["warlord_pri_yurirun"] = "warlord_pri_yurirun";
    level.scr_sound["price"]["warlord_pri_rallyonme2"] = "warlord_pri_rallyonme2";
    level.scr_sound["price"]["warlord_pri_pushforward"] = "warlord_pri_pushforward";
    level.scr_sound["price"]["warlord_pri_contactfront"] = "warlord_pri_contactfront";
    level.scr_sound["price"]["warlord_pri_magazine"] = "warlord_pri_magazine";
    level.scr_sound["price"]["warlord_pri_switchtoak"] = "warlord_pri_switchtoak";
    level.scr_sound["soap"]["warlord_mct_changingmags"] = "warlord_mct_changingmags";
    level.scr_sound["soap"]["warlord_mct_magazine"] = "warlord_mct_magazine";
    level.scr_sound["soap"]["warlord_mct_throughhere"] = "warlord_mct_throughhere";
    level.scr_sound["soap"]["warlord_mct_theyknow"] = "warlord_mct_theyknow";
    level.scr_sound["price"]["warlord_pri_makarovscargo"] = "warlord_pri_makarovscargo";
    level.scr_sound["price"]["warlord_pri_technical"] = "warlord_pri_technical";
    level.scr_sound["price"]["warlord_pri_man50cal"] = "warlord_pri_man50cal";
    level.scr_sound["price"]["warlord_pri_geton50"] = "warlord_pri_geton50";
    level.scr_sound["price"]["warlord_pri_enemyrooftop"] = "warlord_pri_enemyrooftop";
    level.scr_sound["price"]["warlord_pri_enemyrooftop"] = "warlord_pri_enemyrooftop";
    level.scr_sound["price"]["warlord_pri_contactleft"] = "warlord_pri_contactleft";
    level.scr_sound["price"]["warlord_pri_technicalincoming"] = "warlord_pri_technicalincoming";
    level.scr_sound["price"]["warlord_pri_putfire"] = "warlord_pri_putfire";
    level.scr_sound["soap"]["warlord_mct_contactleft"] = "warlord_mct_contactleft";
    level.scr_sound["soap"]["warlord_mct_rightright"] = "warlord_mct_rightright";
    level.scr_sound["price"]["warlord_pri_yurioverhere"] = "warlord_pri_yurioverhere";
    level.scr_sound["soap"]["warlord_mct_mortarfire"] = "warlord_mct_mortarfire";
    level.scr_sound["soap"]["warlord_mct_wholemilitia"] = "warlord_mct_wholemilitia";
    level.scr_sound["price"]["warlord_pri_gogogo"] = "warlord_pri_gogogo";
    level.scr_sound["price"]["warlord_pri_triangulating"] = "warlord_pri_triangulating";
    level.scr_sound["price"]["warlord_pri_move"] = "warlord_pri_move";
    level.scr_sound["price"]["warlord_pri_keepmoving"] = "warlord_pri_keepmoving";
    level.scr_sound["price"]["warlord_pri_go2"] = "warlord_pri_go2";
    level.scr_sound["price"]["warlord_pri_run"] = "warlord_pri_run";
    level.scr_sound["price"]["warlord_pri_dontstopmoving"] = "warlord_pri_dontstopmoving";
    level.scr_sound["price"]["warlord_pri_mortarincoming"] = "warlord_pri_mortarincoming";
    level.scr_sound["price"]["warlord_pri_incomingleft"] = "warlord_pri_incomingleft";
    level.scr_sound["price"]["warlord_pri_mortarleft"] = "warlord_pri_mortarleft";
    level.scr_sound["price"]["warlord_pri_incomingright"] = "warlord_pri_incomingright";
    level.scr_sound["price"]["warlord_pri_mortarright"] = "warlord_pri_mortarright";
    level.scr_sound["soap"]["warlord_mct_yurisdown"] = "warlord_mct_yurisdown";
    level.scr_sound["price"]["warlord_pri_keepmoving2"] = "warlord_pri_keepmoving2";
    level.scr_sound["price"]["warlord_pri_lostyou"] = "warlord_pri_lostyou";
    level.scr_sound["price"]["warlord_pri_slotmortar"] = "warlord_pri_slotmortar";
    level.scr_sound["soap"]["warlord_mct_mortardown"] = "warlord_mct_mortardown";
    level.scr_sound["price"]["warlord_pri_properwelcome"] = "warlord_pri_properwelcome";
    level.scr_sound["soap"]["warlord_pri_mortartube"] = "warlord_pri_mortartube";
    level.scr_sound["price"]["warlord_pri_takecontrol"] = "warlord_pri_takecontrol";
    level.scr_sound["price"]["warlord_pri_hosedown"] = "warlord_pri_hosedown";
    level.scr_sound["price"]["warlord_pri_lightemup"] = "warlord_pri_lightemup";
    level.scr_sound["price"]["warlord_pri_shellsdownrange"] = "warlord_pri_shellsdownrange";
    level.scr_sound["soap"]["warlord_mct_keepfiringmortar"] = "warlord_mct_keepfiringmortar";
    level.scr_sound["price"]["warlord_pri_targetsinvillage"] = "warlord_pri_targetsinvillage";
    level.scr_sound["soap"]["warlord_mct_sewerpipe"] = "warlord_mct_sewerpipe";
    level.scr_sound["price"]["warlord_pri_regroup"] = "warlord_pri_regroup";
    level.scr_sound["price"]["warlord_pri_hitthechurch"] = "warlord_pri_hitthechurch";
    level.scr_sound["price"]["warlord_pri_youcertain"] = "warlord_pri_youcertain";
    level._id_11BB["warlord_kgr_gotconfirmation"] = "warlord_kgr_gotconfirmation";
    level.scr_sound["soap"]["warlord_mct_letshope"] = "warlord_mct_letshope";
    level._id_11BB["warlord_kgr_weaponsinchurch"] = "warlord_kgr_weaponsinchurch";
    level.scr_sound["soap"]["warlord_mct_areaclear"] = "warlord_mct_areaclear";
    level.scr_sound["price"]["warlord_pri_otherside"] = "warlord_pri_otherside";
    level.scr_sound["price"]["warlord_pri_thereschurch"] = "warlord_pri_thereschurch";
    level.scr_sound["price"]["warlord_pri_pushtochurch"] = "warlord_pri_pushtochurch";
    level.scr_sound["soap"]["warlord_pri_justflewover"] = "warlord_pri_justflewover";
    level.scr_sound["price"]["warlord_pri_gettothatchurch"] = "warlord_pri_gettothatchurch";
    level.scr_sound["price"]["warlord_pri_keepmoving3"] = "warlord_pri_keepmoving3";
    level.scr_sound["price"]["warlord_pri_alrightlads"] = "warlord_pri_alrightlads";
    level.scr_sound["soap"]["warlord_mct_churchisclear"] = "warlord_mct_churchisclear";
    level.scr_sound["price"]["warlord_pri_outoftime"] = "warlord_pri_outoftime";
    level.scr_sound["price"]["warlord_pri_stackupletsgo"] = "warlord_pri_stackupletsgo";
    level.scr_sound["price"]["warlord_pri_getoverhere"] = "warlord_pri_getoverhere";
    level.scr_sound["price"]["warlord_pri_kamarashome"] = "warlord_pri_kamarashome";
    level._id_11BB["warlord_kgr_karamaalive"] = "warlord_kgr_karamaalive";
    level._id_11BB["warlord_kgr_onourway"] = "warlord_kgr_onourway";
    level._id_11BB["warlord_kgr_bulletmagnet"] = "warlord_kgr_bulletmagnet";
    level.scr_sound["kruger"]["warlord_kgr_loadup"] = "warlord_kgr_loadup";
    level.scr_sound["kruger"]["warlord_kgr_moneywired"] = "warlord_kgr_moneywired";
    level._id_11BB["warlord_nik_whatabout"] = "warlord_nik_whatabout";
    level._id_11BB["warlord_nik_sendingbird"] = "warlord_nik_sendingbird";
    level.scr_sound["price"]["warlord_pri_werespotted"] = "warlord_pri_werespotted";
    level.scr_sound["price"]["warlord_pri_theyveseen"] = "warlord_pri_theyveseen";
    level.scr_sound["price"]["warlord_pri_yurithisway"] = "warlord_pri_yurithisway";
}

_id_6E3C()
{
    common_scripts\utility::flag_wait( "allies_spawned" );
    thread _id_6E3E();
    thread _id_6E40();
    thread _id_0138();
    thread _id_6E45();
    thread _id_6E46();
    thread _id_6E47();
    thread _id_6E48();
    thread _id_6E49();
    thread _id_6E4A();
    thread _id_615A();
    thread _id_6E4B();
    thread _id_6E4D();
    thread _id_6E50();
    thread _id_6E52();
    thread _id_6E53();
    thread _id_6E55();
    thread _id_6E57();
    thread _id_6E58();
    thread _id_6E5B();
    thread _id_6E5E();
    thread _id_6E61();
    thread _id_6E64();
    thread _id_6E65();
}

_id_586B( var_0 )
{
    if ( isdefined( level._id_6E3B ) && level._id_6E3B == 0 )
        maps\_utility::_id_168C( var_0 );
}

_id_6E3D( var_0 )
{
    if ( !common_scripts\utility::flag( var_0 ) )
    {
        level._id_6E3B = 1;
        level._id_4877 stopsounds();
        level._id_54E0 stopsounds();
        wait 0.5;
    }
}

_id_6E3E()
{
    common_scripts\utility::flag_wait( "play_river_dialogue" );
    wait 14;
    maps\_utility::_id_11F4( "warlord_nik_onehour" );
    wait 4;
    common_scripts\utility::flag_set( "player_show_gun" );
    maps\_audio::aud_send_msg( "mus_stop_intro_music" );
    wait 4;
    level._id_54E0 maps\_utility::_id_168C( "warlord_pri_lowprofile" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_trynottodie" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_rogerthat" );
    common_scripts\utility::flag_set( "river_intro_vo_done" );
    common_scripts\utility::flag_wait( "river_technical_dialogue" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_tangosapproaching" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_duck" );
    common_scripts\utility::flag_wait( "river_technicals_move_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_move3" );
}

_id_6E3F( var_0 )
{
    if ( isdefined( var_0 ) && isalive( var_0 ) && var_0 maps\_utility::_id_1008( "_stealth_normal" ) )
        return 1;

    return 0;
}

_id_6E40()
{
    level endon( "river_encounter_done" );
    common_scripts\utility::flag_wait( "river_technical_militia_dialogue" );

    if ( _id_6E3F( level._id_6C63[0] ) && _id_6E3F( level._id_6C63[1] ) )
        thread _id_6E41();
}

_id_0138()
{
    level endon( "river_encounter_done" );
    common_scripts\utility::flag_wait( "technical_steal_broken_vo" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_werespotted" );
}

_id_6E41()
{
    _id_6E42();
}

_id_6E42()
{
    level endon( "conversation_interrupted" );
    level._id_6C63[0] endon( "death" );
    level._id_6C63[1] endon( "death" );
    level._id_6C63[0] thread _id_6E43();
    level._id_6C63[1] thread _id_6E43();
    level._id_6C63[0] maps\_utility::_id_168C( "warlord_mlt1_everyonedead" );
    level._id_6C63[1] maps\_utility::_id_168C( "warlord_mlt2_notall" );
    level._id_6C63[0] maps\_utility::_id_168C( "warlord_mlt1_findothers" );
}

_id_6E43()
{
    self endon( "death" );
    level endon( "conversation_interrupted" );
    thread _id_6E44();
    maps\_utility::_id_13DB( "_stealth_normal" );
    level notify( "conversation_interrupted" );
}

_id_6E44()
{
    self endon( "death" );
    level waittill( "conversation_interrupted" );
    self stopsounds();
}

_id_6E45()
{
    common_scripts\utility::flag_wait( "prone_encounter_start_dialogue" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_pri_twoxrays" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_welldoneyuri" );
    common_scripts\utility::flag_wait( "river_encounter_3_complete" );
    wait 0.05;

    if ( common_scripts\utility::flag( "prone_encounter_well_done_dialogue" ) )
        level._id_54E0 maps\_utility::_id_168C( "warlord_mct_clear2" );
}

_id_6E46()
{
    common_scripts\utility::flag_wait( "tire_necklace_dialogue" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_execution" );
    wait 1;

    if ( !common_scripts\utility::flag( "river_burn_interrupted" ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_yourcall" );

    common_scripts\utility::flag_wait( "allies_path_to_big_moment" );

    if ( common_scripts\utility::flag( "river_burn_interrupted" ) )
        wait 1;

    level._id_4877 maps\_utility::_id_168C( "warlord_pri_move3" );
}

_id_6E47()
{
    level endon( "river_house_burn_anim_finished" );
    common_scripts\utility::flag_wait( "river_burn_interrupted" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_takethemout" );
}

_id_6E48()
{
    level endon( "river_burn_interrupted" );
    common_scripts\utility::flag_wait( "river_house_burn_anim_finished" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_bastards" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_handlethemlater" );
}

_id_6E49()
{
    level endon( "river_big_moment_stealth_spotted" );
    common_scripts\utility::flag_wait( "flag_player_first_beat" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_moveup2" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_toomany" );
    common_scripts\utility::flag_wait( "dont_be_stupid_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_bastards" );
    wait 9;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_alrightgetready" );
    common_scripts\utility::flag_wait( "second_beat_move_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_move3" );
    common_scripts\utility::flag_wait( "off_road_vo" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_getoffroad" );
    common_scripts\utility::flag_wait( "off_the_road_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_getdownnow" );
    common_scripts\utility::flag_wait( "river_burn_watchers_leave" );
    wait 3;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_easy" );
    wait 9;

    if ( isalive( level._id_6CDC[0] ) )
    {
        level._id_6CDC[0] maps\_utility::_id_168C( "warlord_mlt1_stormcoming" );
        wait 1;

        if ( isalive( level._id_6CDC[1] ) )
        {
            level._id_6CDC[1] maps\_utility::_id_168C( "warlord_mlt2_saywhen" );
            wait 1;

            if ( isalive( level._id_6CDC[0] ) )
                level._id_6CDC[0] maps\_utility::_id_168C( "warlord_mlt1_today" );
        }
    }

    common_scripts\utility::flag_wait( "river_big_moment_done_dialogue" );
    wait 2;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_allclear" );
}

_id_6E4A()
{
    level endon( "price_door_triggered" );
    common_scripts\utility::flag_wait( "river_spotted_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_compromised" );
}

_id_615A()
{
    level endon( "river_spotted_dialogue" );
    common_scripts\utility::flag_wait( "flag_player_at_third_beat" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_holdup" );
    common_scripts\utility::flag_wait( "flag_go_to_bridge" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_clear2" );
    common_scripts\utility::flag_wait( "church_mouse_dialogue" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_2moreonbridge" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_waitfortruck" );
    common_scripts\utility::flag_wait( "bridge_go_loud_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_dropem" );
    common_scripts\utility::flag_wait( "bridge_guys_dead_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_moveup" );
}

_id_6E4B()
{
    level._id_4877 endon( "death" );
    level endon( "inf_stealth_spotted" );
    common_scripts\utility::flag_wait( "large_group_dialogue" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_pri_uptheroad" );
    common_scripts\utility::flag_wait( "cover_us_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_coverus" );
    thread _id_6E4C();
}

_id_6E4C()
{
    level endon( "inf_teleport_allies" );
    level endon( "infiltration_over" );
    level endon( "inf_stealth_spotted" );

    if ( common_scripts\utility::flag( "infiltration_over" ) || common_scripts\utility::flag( "inf_stealth_spotted" ) )
        return;

    var_0 = "warlord_pri_getinposition";

    for ( var_1 = "warlord_pri_getupladder"; !common_scripts\utility::flag( "inf_teleport_allies" ); var_1 = var_2 )
    {
        wait 5;
        level._id_4877 maps\_utility::_id_168C( var_0 );
        var_2 = var_0;
        var_0 = var_1;
    }
}

_id_6E4D()
{
    thread _id_6E4E();
    thread _id_6E4F();
}

_id_6E4E()
{
    level endon( "infiltration_over" );
    level endon( "inf_stealth_spotted" );
    common_scripts\utility::flag_wait( "multiple_guards_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_twohostiles" );
    common_scripts\utility::flag_set( "inf_encounter_2_vo_done" );
    common_scripts\utility::flag_wait( "inf_ramp_guys_dead" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_pri_multipleguards" );
    common_scripts\utility::flag_wait_all( "inf_ramp_guys_dead", "inf_talkers_dead" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_boundingup" );
    common_scripts\utility::flag_wait( "more_militia_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_militia" );
    common_scripts\utility::flag_wait( "inf_both_moving_dialogue" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_moving" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_moving" );
    wait 1;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_breachingfactory" );
}

_id_6E4F()
{
    common_scripts\utility::flag_wait( "breaching_factory_dialogue" );
    wait 1;
    level._id_4877 maps\_utility::_id_168C( "warlord_mct_clear" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_bloodyempty" );
    maps\_utility::_id_11F4( "warlord_pri_dryhole" );
    maps\_utility::_id_11F4( "warlord_kgr_rvthere" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_hopetheydid" );

    if ( !common_scripts\utility::flag( "inf_stealth_spotted" ) )
        level._id_54E0 maps\_utility::_id_168C( "warlord_mct_headsup" );

    wait 1;
    common_scripts\utility::flag_set( "breaching_factory_dialogue_done" );
}

_id_6E50()
{
    level._id_54E0 endon( "death" );
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait_any( "breaching_factory_dialogue_done", "inf_stealth_spotted" );
    maps\_audio::aud_send_msg( "mus_go_hot" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_compromised" );
    wait 3;
    var_0 = level.player getweaponslist( "primary" );
    common_scripts\utility::flag_set( "no_ak_vo" );

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2, "ak47" ) )
            common_scripts\utility::flag_clear( "no_ak_vo" );
    }

    var_4 = level.player getcurrentprimaryweapon();

    if ( issubstr( var_4, "ak47" ) )
        common_scripts\utility::flag_set( "no_ak_vo" );

    if ( !common_scripts\utility::flag( "no_ak_vo" ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_switchtoak" );

    wait 3;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_yurirun" );
    wait 3;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_rallyonme2" );
}

_id_6E51()
{
    if ( common_scripts\utility::flag( "player_technical_spawn" ) )
        return;

    common_scripts\utility::flag_wait( "advance_combat_complete" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_areaclear" );
    thread _id_0139();
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_throughhere" );
    common_scripts\utility::flag_wait( "player_technical_spawn" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_theyknow" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_makarovscargo" );
}

_id_0139()
{
    var_0 = [];
    var_0[0] = "warlord_pri_yurioverhere";
    var_0[1] = "warlord_pri_yurithisway";
    thread maps\_shg_common::_id_168B( level._id_4877, "player_technical_spawn", var_0, 5, 10 );
}

_id_6E52()
{
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait( "go_noisy_dialogue" );
    thread _id_6E51();
    common_scripts\utility::flag_wait( "push_forward_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_pushforward" );
    common_scripts\utility::flag_wait( "technical_ahead_dialogue" );

    if ( isdefined( level._id_4877._id_6D75 ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_technical" );
}

_id_6E53()
{
    level._id_54E0 endon( "death" );
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait( "player_technical_dialogue" );

    if ( isdefined( level._id_4877._id_6D75 ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_man50cal" );

    thread _id_6E56();
    common_scripts\utility::flag_wait( "technical_1_dialogue" );

    if ( isdefined( level._id_4877._id_6D75 ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_putfire" );

    common_scripts\utility::flag_wait( "roof_right_dialogue" );

    if ( isdefined( level._id_4877._id_6D75 ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_enemyrooftop" );

    thread _id_6E54( level._id_4877, "contact_front_1_dialogue", "warlord_pri_contactfront" );
    thread _id_6E54( level._id_4877, "contact_left_1_dialogue", "warlord_pri_contactleft" );
    thread _id_6E54( level._id_54E0, "contact_left_2_dialogue", "warlord_mct_contactleft" );
    thread _id_6E54( level._id_4877, "contact_front_2_dialogue", "warlord_pri_contactfront" );
    thread _id_6E54( level._id_54E0, "contact_right_1_dialogue", "warlord_mct_rightright" );
    thread _id_6E54( level._id_4877, "contact_left_3_dialogue", "warlord_pri_contactleft" );
    thread _id_6E54( level._id_4877, "contact_left_4_dialogue", "warlord_pri_contactleft" );
    thread _id_6E54( level._id_4877, "contact_front_3_dialogue", "warlord_pri_contactfront" );
}

_id_6E54( var_0, var_1, var_2 )
{
    level endon( "technical_combat_complete" );
    common_scripts\utility::flag_wait( var_1 );

    if ( isdefined( var_0._id_6D75 ) )
        var_0 maps\_utility::_id_168C( var_2 );
}

_id_6E55()
{
    common_scripts\utility::flag_wait( "technical_2_dialogue" );

    if ( isdefined( level._id_4877._id_6D75 ) )
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_technicalincoming" );
}

_id_6E56()
{
    level endon( "player_boarding_technical" );
    level endon( "technical_turret_combat_timer_complete" );
    level endon( "technical_stalled_combat_complete" );
    var_0 = 0;

    while ( !common_scripts\utility::flag( "player_boarding_technical" ) && var_0 < 3 )
    {
        wait 5;

        if ( !common_scripts\utility::flag( "player_boarding_technical" ) )
        {
            if ( isdefined( level._id_4877._id_6D75 ) )
                level._id_4877 maps\_utility::_id_168C( "warlord_pri_geton50" );

            var_0++;
        }
    }
}

_id_6E57()
{
    level._id_54E0 endon( "death" );
    common_scripts\utility::flag_wait( "player_technical_dialogue" );
    common_scripts\utility::flag_wait( "mortar_technical" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_mortarfire" );

    if ( common_scripts\utility::flag( "player_on_technical" ) )
    {
        common_scripts\utility::flag_wait( "mortar_technical_hit" );
        wait 10;
        common_scripts\utility::flag_set( "militia_vo_done" );
    }

    if ( !common_scripts\utility::flag( "player_on_technical" ) )
    {
        wait 2.5;
        level._id_54E0 maps\_utility::_id_168C( "warlord_mct_wholemilitia" );
        common_scripts\utility::flag_set( "militia_vo_done" );
    }
}

_id_6E58()
{
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait( "mortar_run_dialogue" );
    wait 2;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_triangulating" );
    common_scripts\utility::flag_wait( "mortar_roof_fall_dialogue" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_yurisdown" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_keepmoving2" );
    common_scripts\utility::flag_wait( "mortar_door_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_lostyou" );
    common_scripts\utility::flag_wait( "mortar_fight_shot" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_slotmortar" );
    common_scripts\utility::flag_wait( "mortar_operator_off" );
    common_scripts\utility::flag_waitopen( "dialogue_in_progress" );
    common_scripts\utility::flag_set( "dialogue_in_progress" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_mortardown" );
    common_scripts\utility::flag_clear( "dialogue_in_progress" );
}

_id_6E59( var_0 )
{
    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        var_1 = randomint( var_0.size );
        level._id_6E5A = var_0[var_1];
        var_0 = maps\_utility::array_remove_index( var_0, var_1 );
        return var_0;
    }

    return undefined;
}

_id_6E5B()
{
    level.player endon( "death" );
    level endon( "mortar_roof_fall_dialogue" );
    var_0 = [];
    var_0[var_0.size] = "warlord_pri_move";
    var_0[var_0.size] = "warlord_pri_keepmoving";
    var_0[var_0.size] = "warlord_pri_go2";
    var_0[var_0.size] = "warlord_pri_run";
    var_0[var_0.size] = "warlord_pri_dontstopmoving";
    var_0[var_0.size] = "warlord_pri_gogogo";
    var_1 = [];
    var_1[var_1.size] = "warlord_pri_mortarincoming";
    var_2 = [];
    var_2[var_2.size] = "warlord_pri_incomingleft";
    var_2[var_2.size] = "warlord_pri_mortarleft";
    var_3 = [];
    var_3[var_3.size] = "warlord_pri_incomingright";
    var_3[var_3.size] = "warlord_pri_mortarright";
    var_4 = 3000;
    var_5 = var_4 * -2;
    common_scripts\utility::flag_wait( "mortar_run_dialogue" );

    for (;;)
    {
        var_6 = _id_6E5C();
        level._id_6E5A = undefined;

        if ( isdefined( var_6 ) )
        {
            if ( var_6 == "right_side" )
                var_3 = _id_6E59( var_3 );
            else if ( var_6 == "left_side" )
                var_2 = _id_6E59( var_2 );
            else if ( var_6 == "no_side" )
                var_1 = _id_6E59( var_1 );
            else
            {

            }
        }

        if ( !isdefined( level._id_6E5A ) )
            var_0 = _id_6E59( var_0 );

        if ( isdefined( level._id_6E5A ) )
        {
            if ( gettime() - var_5 > var_4 )
            {
                level._id_4877 maps\_utility::_id_168C( level._id_6E5A );
                var_5 = gettime();
            }
        }
    }
}

_id_6E5C()
{
    level endon( "mortar_line_timeout" );
    thread _id_6E5D();
    level waittill( "mortar_incoming_dialogue", var_0 );
    return var_0;
}

_id_6E5D()
{
    level endon( "mortar_incoming_dialogue" );
    wait 5;
    level notify( "mortar_line_timeout" );
}

_id_6E5E()
{
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait( "head_to_mortar_dialogue" );
    waittillframeend;
    common_scripts\utility::flag_waitopen( "dialogue_in_progress" );
    common_scripts\utility::flag_set( "dialogue_in_progress" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_pri_mortartube" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_properwelcome" );
    common_scripts\utility::flag_clear( "dialogue_in_progress" );
    thread _id_6E5F();
    common_scripts\utility::flag_wait( "player_at_mortar" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_shellsdownrange" );
    wait 2.0;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_hosedown" );
    common_scripts\utility::flag_wait( "mortar_targets_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_lightemup" );
    wait 2.0;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_targetsinvillage" );
    common_scripts\utility::flag_wait( "keep_firing_mortar" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_keepfiringmortar" );
}

_id_6E5F()
{
    level endon( "player_at_mortar" );

    if ( common_scripts\utility::flag( "player_at_mortar" ) )
        return;

    for (;;)
    {
        wait 8;
        level._id_4877 maps\_utility::_id_168C( "warlord_pri_takecontrol" );
    }
}

_id_6E61()
{
    thread _id_6E62();
    thread _id_6E63();
}

_id_6E62()
{
    level._id_4877 endon( "death" );
    common_scripts\utility::flag_wait( "regroup_dialogue" );
    maps\_audio::aud_send_msg( "mus_player_mortar_done" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_regroup" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_hitthechurch" );
    common_scripts\utility::flag_wait( "assault_run_to_pipe" );
    wait 2.0;
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_sewerpipe" );
}

_id_6E63()
{
    common_scripts\utility::flag_wait( "sewer_pipe_vo" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_youcertain" );
    maps\_utility::_id_11F4( "warlord_kgr_gotconfirmation" );
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_letshope" );
    common_scripts\utility::flag_wait( "assault_all_clear" );
    var_0 = getaiarray( "axis" );

    if ( !common_scripts\utility::flag( "assault_compound_failsafe" ) && var_0.size == 0 )
    {
        wait 2;
        level._id_54E0 maps\_utility::_id_168C( "warlord_mct_areaclear" );
    }

    common_scripts\utility::flag_wait( "house_door_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_otherside" );
}

_id_6E64()
{
    common_scripts\utility::flag_wait( "theres_church_dialogue" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_thereschurch" );
    wait 2;
    level._id_54E0 maps\_utility::_id_168C( "warlord_pri_justflewover" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_gettothatchurch" );
    thread _id_00E7();
    common_scripts\utility::flag_wait( "church_breach_complete" );
    wait 1;
    level._id_54E0 maps\_utility::_id_168C( "warlord_mct_churchisclear" );
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_outoftime" );
    wait 1;
    level._id_4877 maps\_utility::_id_168C( "warlord_pri_alrightlads" );
    thread _id_00E8();
}

_id_00E7()
{
    var_0 = [];
    var_0[0] = "warlord_pri_pushtochurch";
    var_0[1] = "warlord_pri_pushforward";
    var_0[2] = "warlord_pri_keepmoving3";
    thread maps\_shg_common::_id_168B( level._id_4877, "end_church_nag_vo", var_0, 7, 10 );
}

_id_00E8()
{
    var_0 = [];
    var_0[0] = "warlord_pri_kamarashome";
    var_0[1] = "warlord_pri_stackupletsgo";
    var_0[2] = "warlord_pri_getoverhere";
    wait 5;
    thread maps\_shg_common::_id_168B( level._id_4877, "breach_starting", var_0, 5, 6 );
}

_id_6E65()
{
    common_scripts\utility::flag_wait( "getting_away_dialogue" );
    maps\_utility::_id_11F4( "warlord_nik_whatabout" );
    wait 7;
    common_scripts\utility::flag_set( "confrontation_vo_finished" );
}
