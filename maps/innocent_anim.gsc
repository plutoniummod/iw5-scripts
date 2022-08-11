// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_03E9();
    _id_03EE();
    _id_043C();
    _id_03EC();
    _id_7A0D();
    _id_7A0F();
    _id_03ED();
    _id_56DE();
    _id_4CBB();
}
#using_animtree("generic_human");

_id_03E9()
{
    level._id_0C59["wife"]["idle"][0] = %civilian_stand_idle;
    level._id_0C59["wife"]["anim_1"] = %london_ending_a_wife;
    level._id_0C59["wife"]["anim_1_idle"] = %london_ending_a_wife_idle;
    level._id_0C59["wife"]["anim_1_nag"] = %london_ending_a_wife_nag;
    level._id_0C59["daughter"]["anim_1"] = %london_ending_a_girl;
    maps\_anim::_id_1264( "daughter", "ps_london_wif_bigben", maps\innocent::_id_03EA, "anim_1" );
    level._id_0C59["daughter"]["anim_1_idle"] = %london_ending_a_girl_idle;
    level._id_0C59["daughter"]["anim_1_nag"] = %london_ending_a_girl_nag;
    level.scr_sound["wife"]["london_wif_honey"] = "london_wif_honey";
    level.scr_sound["wife"]["london_wif_getcloser"] = "london_wif_getcloser";
    level._id_0C59["drone_man"]["couple_walk"] = %innocent_civ_couple_walk_man;
    level._id_0C59["drone_girl"]["couple_walk"] = %innocent_civ_couple_walk_woman;
    level._id_0C59["wife"]["anim_2"] = %london_ending_b_wife;
    level._id_0C59["wife"]["anim_2_idle"] = %london_ending_b_wife_idle;
    level._id_0C59["wife"]["anim_2_nag"] = %london_ending_b_wife_nag;
    maps\_anim::_id_1264( "wife", "ps_london_wif_fromyou", maps\innocent::_id_03EB, "anim_2" );
    level._id_0C59["daughter"]["anim_2"] = %london_ending_b_girl;
    level._id_0C59["daughter"]["anim_2_idle"] = %london_ending_b_girl_idle;
    level.scr_sound["wife"]["london_wif_overhere"] = "london_wif_overhere";
    level.scr_sound["wife"]["london_wif_recording"] = "london_wif_recording";
    level.scr_sound["wife"]["london_wif_hereweare"] = "london_wif_hereweare";
    level.scr_sound["daughter"]["london_dtr_whencan"] = "london_dtr_whencan";
    level.scr_sound["wife"]["london_wif_icecream"] = "london_wif_icecream";
    level.scr_sound["wife"]["london_wif_bigben"] = "london_wif_bigben";
    level.scr_sound["daughter"]["london_dtr_lookoverhere"] = "london_dtr_lookoverhere";
    level.scr_sound["daughter"]["london_dtr_lookatme"] = "london_dtr_lookatme";
    level.scr_sound["daughter"]["london_dtr_whatsdaddy"] = "london_dtr_whatsdaddy";
    level.scr_sound["wife"]["london_wif_cmere"] = "london_wif_cmere";
    level.scr_sound["daughter"]["london_dtr_laugh"] = "london_dtr_laugh";
    level.scr_sound["wife"]["london_wif_cantbelieve"] = "london_wif_cantbelieve";
    level.scr_sound["daughter"]["london_dtr_birds"] = "london_dtr_birds";
    level.scr_sound["wife"]["london_wif_dontgofar"] = "london_wif_dontgofar";
    level.scr_sound["daughter"]["london_dtr_laugh2"] = "london_dtr_laugh2";
    level.scr_sound["wife"]["london_wif_thatsyour"] = "london_wif_thatsyour";
    level.scr_sound["wife"]["london_wif_fromyou"] = "london_wif_fromyou";
    level._id_0C59["generic"]["unarmed_run"] = %unarmed_scared_run_delta;
}

_id_03EC()
{
    level._id_0C59["civilian"]["idle_combat"][0] = %civilian_stand_idle;
    level._id_0C59["civilian"]["walk"] = %civilian_walk_cool;
    level._id_0C59["civilian"]["run"] = %london_police_jog;
}

_id_03ED()
{

}

_id_4CBB()
{
    level._id_11BB["london_com_doyoucopy"] = "london_com_doyoucopy";
    level._id_11BB["london_com_status"] = "london_com_status";
    level._id_11BB["london_com_rendevous"] = "london_com_rendevous";
}

_id_56DE()
{
    level._id_0C59["sas_leader"]["stumble"] = %london_truckcrash_crawl;
    level.scr_sound["sas_leader"]["london_ldr_burnsalright"] = "london_ldr_burnsalright";
    level.scr_sound["sas_leader"]["london_ldr_burnsalright"] = "london_ldr_burnsalright";
    level.scr_sound["sas_leader"]["london_ldr_scrapmetal2"] = "london_ldr_scrapmetal2";
    level.scr_sound["sas_leader"]["london_ldr_nothingwecando"] = "london_ldr_nothingwecando";
}

_id_03EE()
{
    level._id_0C59["generic"]["death_explosion_stand_B_v2"] = %death_explosion_stand_b_v2;
    level._id_0C59["generic"]["london_gas_hero_death_2"] = %london_gas_hero_death_2;
    level._id_0C59["generic"]["camera_guy_death"] = %london_ending_dad;
}
#using_animtree("chicken");

_id_043C()
{
    level._id_1245["pigeon"] = #animtree;
    level._id_0C59["pigeon"]["idle"][0] = %pigeon_idle;
    level._id_0C59["pigeon"]["idleweight"][0] = 1;
    level._id_0C59["pigeon"]["idle"][1] = %pigeon_idle_twitch_1;
    level._id_0C59["pigeon"]["idleweight"][1] = 0.3;
    level._id_0C59["pigeon"]["flying"] = %pigeon_flying_cycle;
}
#using_animtree("player");

_id_7A0D()
{
    level._id_1245["player_rig_tunnel_crash_teleport"] = #animtree;
    level._id_1F90["player_rig_tunnel_crash_teleport"] = "viewhands_player_sas";
    level._id_0C59["player_rig_tunnel_crash_teleport"]["train_crash"] = %london_player_bail;
    maps\_anim::_id_1267( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_light_start", "smoke_fill", "train_crash" );
    maps\_anim::_id_1264( "player_rig_tunnel_crash_teleport", "transition", maps\london_west::_id_0489, "train_crash" );
    maps\_anim::_id_1264( "player_rig_tunnel_crash_teleport", "dirt_kickup_head_start", maps\westminster_code::_id_79DC, "train_crash" );
    maps\_anim::_id_1267( "player_rig_tunnel_crash_teleport", "dirt_kickup_hands_stop", "train_crash_tumble_stops", "train_crash" );
}
#using_animtree("vehicles");

_id_7A0F()
{
    level._id_0C59["player_car"]["train_crash"] = %london_player_truck;
    level._id_1F90["player_car"] = "vehicle_uk_utility_truck_destructible";
    level._id_1245["player_car"] = #animtree;
    level._id_0C59["player_car_mirrored"]["train_crash"] = %london_player_truck;
    maps\_anim::_id_1264( "player_car_mirrored", "truck_slowing_1_start", ::_id_7A1B, "train_crash" );
    level._id_1F90["player_car_mirrored"] = "vehicle_uk_utility_truck_destructible";
    level._id_1245["player_car_mirrored"] = #animtree;
}

_id_7A1B( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "sparks_truck_scrape_line_short_diminishing" ), var_0, "TAG_TAIL_LIGHT_LEFT" );
}
