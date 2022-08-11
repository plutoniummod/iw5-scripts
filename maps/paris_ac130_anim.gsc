// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_47D9();
    _id_637D();
    _id_56D9();
    _id_637E();
    _id_637F();
    _id_6380();
    _id_6381();
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_arms"] = #animtree;
    level._id_1F90["player_arms"] = "viewhands_player_delta";
    level._id_0C59["player_arms"]["hummer_exit"] = %paris_ac130_run_around_humvee_player;
    common_scripts\utility::flag_init( "notetrack_flag_sandman_start" );
    maps\_anim::_id_1267( "player_arms", "sandman_start", "notetrack_flag_sandman_start", "hummer_exit" );
}
#using_animtree("script_model");

_id_637D()
{
    level._id_1245["player_dragged"] = #animtree;
    level._id_0C59["player_dragged"]["ANIM_player_dragged_top"] = %paris_ac130_osprey_crash_player;
    level._id_0C59["player_dragged"]["ANIM_player_dragged_bottom"] = %paris_ac130_osprey_crash_player_legs;
}
#using_animtree("generic_human");

_id_56D9()
{
    level._id_1245["generic"] = #animtree;
    level._id_0C59["generic"]["dying_crawl_looping"] = %dying_crawl_looping;
    level._id_0C59["generic"]["RPG_conceal_2_standL"] = %rpg_conceal_2_standl;
    level._id_0C59["generic"]["RPG_conceal_2_standR"] = %rpg_conceal_2_standr;
    level._id_0C59["generic"]["RPG_standR_2_conceal"] = %rpg_standr_2_conceal;
    level._id_0C59["generic"]["RPG_standL_2_conceal"] = %rpg_standl_2_conceal;
    level._id_0C59["generic"]["RPG_conceal_idle"] = %rpg_conceal_idle;
    level._id_0C59["generic"]["RPG_stand_twitch_v1"] = %rpg_stand_twitch_v1;
    level._id_1245["drone"] = #animtree;
    level._id_0C59["generic"]["patrol_jog"] = %patrol_jog;
    level._id_0C59["generic"]["patrol_walk"] = %active_patrolwalk_v1;
    level._id_0C59["generic"]["patrol_bored_idle"] = %patrol_bored_idle;
    level._id_0C59["generic"]["run_lowready_F"] = %run_lowready_f;
    level._id_0C59["generic"]["hunted_tunnel_guy1_lookup"] = %hunted_tunnel_guy1_lookup;
    level._id_0C59["generic"]["unarmed_crouch_idle1"] = %unarmed_crouch_idle1;
    level._id_0C59["generic"]["unarmed_crouch_twitch1"] = %unarmed_crouch_twitch1;
    level._id_0C59["generic"]["run_n_gun_F"] = %run_n_gun_f;
    level._id_0C59["generic"]["favela_escape_bigjump_soap"] = %favela_escape_bigjump_soap;
    level._id_0C59["generic"]["death_run_onfront"] = %death_run_onfront;
    level._id_0C59["generic"]["death_run_onleft"] = %death_run_onleft;
    level._id_0C59["generic"]["death_run_forward_crumple"] = %death_run_forward_crumple;
    level._id_0C59["generic"]["africa_body_flying_explosion"] = %crouch_cover_stand_aim_straight;
    level._id_0C59["generic"]["exposed_death_headshot"] = %africa_body_flying_explosion;
    level._id_0C59["generic"]["exposed_death_headshot"] = %exposed_death_headshot;
    level._id_0C59["generic"]["exposed_death_headtwist"] = %exposed_death_headtwist;
    level._id_0C59["generic"]["run_react_stumble_non_loop"] = %run_react_stumble_non_loop;
    level._id_0C59["generic"]["prone_aim_5"][0] = %prone_aim_5;
    level._id_0C59["generic"]["prone_aim_5"][1] = %prone_aim_5;
    level._id_0C59["generic"]["corner_standR_explosion_divedown"] = %corner_standr_explosion_divedown;
    level._id_0C59["generic"]["corner_standR_explosion_idle"] = %corner_standr_explosion_idle;
    level._id_0C59["generic"]["corner_standR_explosion_standup"] = %corner_standr_explosion_standup;
    level._id_0C59["generic"]["ANIM_intro_delta_shock_1"] = %exposed_flashbang_v1;
    level._id_0C59["generic"]["ANIM_intro_delta_shock_2"] = %exposed_flashbang_v2;
    level._id_0C59["generic"]["ANIM_intro_delta_shock_3"] = %exposed_flashbang_v3;
    level._id_0C59["generic"]["ANIM_intro_delta_shock_4"] = %exposed_flashbang_v4;
    level._id_0C59["generic"]["ANIM_intro_hvt_shock"] = %exposed_flashbang_v5;
    level._id_0C59["generic"]["ANIM_hvt_escape_dive_and_capture_hvt"] = %traverse_window_m_2_dive;
    level._id_0C59["generic"]["ANIM_intro_sandman_opening"] = %paris_ac130_sandman_opening;
    level._id_0C59["generic"]["ANIM_intro_sandman_dragging_player"] = %paris_ac130_osprey_crash_sandman_dragplayer;
    level._id_0C59["generic"]["ANIM_intro_sandman_call_air_support"] = %paris_ac130_sandman_rescue_talk;
    level._id_0C59["generic"]["ANIM_intro_player_dragged"] = %airport_civ_dying_groupb_wounded_relative;
    level._id_0C59["generic"]["setup_pose"] = %casual_stand_idle;
    level._id_0C59["generic"]["ANIM_throw_grenade"] = %coverstand_grenadea;
    level._id_0C59["generic"]["hostage_stand_fall"] = %hostage_stand_fall;
    level._id_0C59["generic"]["hostage_knees_fall"] = %hostage_knees_fall;
    level._id_0C59["generic"]["paris_ac130_hostage_run"] = %paris_ac130_hostage_run;
    level._id_0C59["generic"]["ANIM_hvt_escape_traversal_into_building"] = %traverse_window_m_2_stop;
    level._id_0C59["generic"]["ANIM_hvt_idle_loop"][0] = %wounded_carry_closet_idle_wounded;
    level._id_0C59["hvt"]["intro_hvt_idle"][0] = %paris_ac130_hvt_idle_b;
    level._id_0C59["guard"]["intro_hvt_idle"][0] = %paris_ac130_hvt_idle_a;
    level._id_0C59["guard"]["intro_hvt_arrive_guard"] = %paris_ac130_hvt_setdown_l_a;
    level._id_0C59["hvt"]["intro_hvt_arrive_hvt"] = %paris_ac130_hvt_setdown_l_b;
    level._id_0C59["generic"]["ANIM_guard_cover_idle_loop"][0] = %paris_ac130_guard_cover_idle;
    level._id_0C59["generic"]["ANIM_guard_cover_out"] = %paris_ac130_guard_cover_out;
    level._id_0C59["generic"]["ANIM_guard_run_loop"] = %paris_ac130_guard_run;
    level._id_0C59["generic"]["ANIM_guard_cover_into"] = %paris_ac130_guard_cover_into;
    level._id_0C59["generic"]["ANIM_hostage_cover_idle_loop"][0] = %paris_ac130_hostage_cover_idle;
    level._id_0C59["generic"]["ANIM_hostage_cover_out"] = %paris_ac130_hostage_cover_out;
    level._id_0C59["generic"]["ANIM_hostage_run_loop"][0] = %paris_ac130_hostage_run_relative;
    level._id_0C59["generic"]["ANIM_hostage_cover_into"] = %paris_ac130_hostage_cover_into;
    level._id_0C59["generic"]["ANIM_hostage_wounded_idle"][0] = %wounded_carry_closet_idle_wounded;
    level._id_0C59["generic"]["ANIM_hostage_wounded_pickup"] = %wounded_carry_pickup_closet_wounded_straight;
    level._id_0C59["generic"]["ANIM_hostage_wounded_walk_loop"][0] = %wounded_carry_sprint_wounded_relative;
    level._id_0C59["generic"]["ANIM_hostage_wounded_putdown"] = %wounded_carry_putdown_closet_wounded;
    level._id_0C59["generic"]["ANIM_guard_carrier_pickup"] = %wounded_carry_pickup_closet_carrier_straight;
    level._id_0C59["generic"]["ANIM_guard_carrier_walk_loop"] = %wounded_carry_sprint_carrier;
    level._id_0C59["generic"]["ANIM_guard_carrier_putdown"] = %wounded_carry_putdown_closet_carrier;
    level._id_0C59["crawl_death_1"]["crawl"] = %civilian_crawl_1;
    level._id_0C59["crawl_death_1"]["death"][0] = %civilian_crawl_1_death_a;
    level._id_0C59["crawl_death_1"]["death"][1] = %civilian_crawl_1_death_b;
    level._id_0C59["crawl_death_1"]["blood_fx_rate"] = 0.5;
    level._id_0C59["crawl_death_1"]["blood_fx"] = "blood_drip";
    level._id_0C59["crawl_death_2"]["crawl"] = %civilian_crawl_2;
    level._id_0C59["crawl_death_2"]["death"][0] = %civilian_crawl_2_death_a;
    level._id_0C59["crawl_death_2"]["death"][1] = %civilian_crawl_2_death_b;
    level._id_0C59["crawl_death_2"]["blood_fx_rate"] = 0.25;
    level._id_0C59["generic"]["dying_stand_2_crawl_v3"] = %dying_stand_2_crawl_v3;
    level._id_0C59["generic"]["dying_crawl_death_v3"] = %dying_crawl_death_v3;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_flyin_pilot"] = %paris_ac130_osprey_flyin_pilot;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_flyin_copilot"] = %paris_ac130_osprey_flyin_copilot;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_flyin_gunner"] = %paris_ac130_osprey_flyin_gunner;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_idle_pilot"] = %paris_ac130_osprey_idle_pilot;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_idle_copilot"] = %paris_ac130_osprey_idle_copilot;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_idle_gunner"] = %paris_ac130_osprey_idle_gunner;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_crash_pilot"] = %paris_ac130_osprey_crash_pilot;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_crash_copilot"] = %paris_ac130_osprey_crash_copilot;
    level._id_0C59["generic"]["ANIM_paris_ac130_osprey_crash_gunner"] = %paris_ac130_osprey_crash_gunner;
}
#using_animtree("vehicles");

_id_637E()
{
    level._id_0C59["missle_boat_a"]["paris_ac130_ship_sink"] = %paris_ac130_ship_sink;
    level._id_1245["missle_boat_a"] = #animtree;
    level._id_0C59["barge_a"]["paris_ac130_barge_sink"] = %paris_ac130_barge_sink;
    level._id_1245["barge_a"] = #animtree;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_opeing_a"] = %paris_ac130_osprey_opeing_a;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_opeing_b"] = %paris_ac130_osprey_opeing_b;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_opeing_c"] = %paris_ac130_osprey_opeing_c;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_crash"] = %paris_ac130_osprey_crash;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_crash"] = %paris_ac130_osprey_crash;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_crash_vehicle1"] = %paris_ac130_osprey_crash_vehicle1;
    level._id_0C59["v22_osprey"]["paris_ac130_osprey_crash_vehicle2"] = %paris_ac130_osprey_crash_vehicle2;
    level._id_0C59["v22_osprey"]["ANIM_paris_ac130_osprey_crash_v2"] = %paris_ac130_osprey_crash_v2;
    level._id_0C59["v22_osprey"]["ANIM_paris_ac130_osprey_flyin"] = %paris_ac130_osprey_flyin;
    level._id_0C59["v22_osprey"]["ANIM_paris_ac130_osprey_idle"] = %paris_ac130_osprey_idle;
    level._id_1245["v22_osprey"] = #animtree;
    maps\_anim::_id_1265( "v22_osprey", "rpg_impact", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_air_explosion", "tag_body" );
    maps\_anim::_id_1265( "v22_osprey", "engine_blow", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_engine_explosion", "J_Blades_RI" );
    maps\_anim::_id_1265( "v22_osprey", "engine_blow2", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_engine_explosion_sm", "J_Blades_RI" );
    maps\_anim::_id_1265( "v22_osprey", "crash_ground_engine", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_crash_ground_engine", "J_Pivot_LE" );
    maps\_anim::_id_1265( "v22_osprey", "blade_1_hit", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_blade_1_hit", "tag_blade1_ri_end_fx" );
    maps\_anim::_id_1265( "v22_osprey", "blade_2_hit", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_blade_2_hit", "tag_blade2_ri_end_fx" );
    maps\_anim::_id_1265( "v22_osprey", "blade_3_hit", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_blade_3_hit", "tag_blade3_ri_end_fx" );
    maps\_anim::_id_1265( "v22_osprey", "skid_settle", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_dirt_kickup_settle", "TAG_SIDE_FX2" );
    maps\_anim::_id_1265( "v22_osprey", "settle_lean", "ANIM_paris_ac130_osprey_crash_v2", "FX_osprey_dirt_kickup_settle_small", "TAG_FRONT_FX1" );
    maps\_anim::_id_1265( "v22_osprey", "side_skid_off", "ANIM_paris_ac130_osprey_crash_v2", "crash_heli_dustwave", "tag_body" );
    level._id_1245["car"] = #animtree;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_1"] = %paris_ac130_osprey_crash_car_01;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_2"] = %paris_ac130_osprey_crash_car_02;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_3"] = %paris_ac130_osprey_crash_car_03;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_4"] = %paris_ac130_osprey_crash_car_04;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_5"] = %paris_ac130_osprey_crash_car_05;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_6"] = %paris_ac130_osprey_crash_car_06;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_7"] = %paris_ac130_osprey_crash_car_07;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_8"] = %paris_ac130_osprey_crash_car_08;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_9"] = %paris_ac130_osprey_crash_car_09;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_10"] = %paris_ac130_osprey_crash_car_10;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_11"] = %paris_ac130_osprey_crash_car_11;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_12"] = %paris_ac130_osprey_crash_car_12;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_13"] = %paris_ac130_osprey_crash_car_13;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_14"] = %paris_ac130_osprey_crash_car_14;
    level._id_0C59["car"]["paris_ac130_osprey_crash_car_15"] = %paris_ac130_osprey_crash_car_15;
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_1", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_1", "car_explosion_ac130_car1", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_2", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_3", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_4", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_4", "car_explosion_ac130_car2", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_5", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_6", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_7", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_7", "car_explosion_ac130_car3", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_8", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_8", "car_explosion_ac130_car2", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_9", "FX_osprey_car_crash", "tag_origin" );
    maps\_anim::_id_1265( "car", "car_hit", "paris_ac130_osprey_crash_car_9", "car_explosion_ac130_car1", "tag_origin" );
    level._id_1245["hummer"] = #animtree;
    level._id_0C59["hummer"]["hummer_crash"] = %paris_ac130_bridge_humvee_crash_car_01;
    level._id_0C59["hummer"]["hummer_exit"] = %paris_ac130_run_around_humvee_door;
    maps\_anim::_id_1264( "v22_osprey", "rpg_impact", maps\paris_ac130_slamzoom::_id_6146, "ANIM_paris_ac130_osprey_crash_v2" );
    maps\_anim::_id_1264( "v22_osprey", "crash_ground", maps\paris_ac130_slamzoom::_id_6147, "ANIM_paris_ac130_osprey_crash_v2" );
    maps\_anim::_id_1264( "v22_osprey", "rpg_impact", maps\paris_ac130_slamzoom::_id_6148, "ANIM_paris_ac130_osprey_crash_v2" );
    maps\_anim::_id_1264( "v22_osprey", "engine_blow", maps\paris_ac130_slamzoom::_id_6149, "ANIM_paris_ac130_osprey_crash_v2" );
    maps\_anim::_id_1264( "v22_osprey", "side_skid_on", ::_id_6382, "ANIM_paris_ac130_osprey_crash_v2" );
    maps\_anim::_id_1264( "v22_osprey", "side_skid_off", ::_id_6383, "ANIM_paris_ac130_osprey_crash_v2" );
}
#using_animtree("script_model");

_id_637F()
{
    level._id_0C59["radar_maz_a"]["ac130_radartower_crash"] = %ac130_radartower_crash;
    level._id_1245["radar_maz_a"] = #animtree;
}

_id_6380()
{
    level._id_1245["angel_flare_rig"] = #animtree;
    level._id_1F90["angel_flare_rig"] = "angel_flare_rig";
    level._id_0C59["angel_flare_rig"]["ac130_angel_flares"][0] = %ac130_angel_flares01;
    level._id_0C59["angel_flare_rig"]["ac130_angel_flares"][1] = %ac130_angel_flares02;
    level._id_0C59["angel_flare_rig"]["ac130_angel_flares"][2] = %ac130_angel_flares03;
}

_id_6381()
{
    level._id_1245["left_curtain"] = #animtree;
    level._id_1F90["left_curtain"] = "com_curtains_left";
    level._id_0C59["left_curtain"]["left_curtain_wind"][0] = %ac_prs_curtain_le_wind;
    level._id_1245["right_curtain"] = #animtree;
    level._id_1F90["right_curtain"] = "com_curtains_right";
    level._id_0C59["right_curtain"]["right_curtain_wind"][0] = %ac_prs_curtain_ri_wind;
}

_id_6382( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "FX_osprey_side_skid" ), var_0, "TAG_SIDE_FX2" );
}

_id_6383( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "FX_osprey_side_skid" ), var_0, "TAG_SIDE_FX2" );
}
