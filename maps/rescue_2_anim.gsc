// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4877();
    _id_56D9();
    sounds();
    _id_3E6C();
    _id_3E6D();
    _id_47D9();
    _id_5327();
    _id_78A1();
    _id_56E8();
    _id_0B5A();
    _id_4C08();
    _id_539C();
    _id_0149();
    level._id_5313 = [ "bunker_toss_idle_guy1", "prague_woundwalk_wounded", "prague_civ_door_peek", "prague_civ_door_runin", "prague_resistance_hit_idle", "DC_Burning_bunker_stumble", "dc_burning_bunker_stumble", "civilian_crawl_1", "civilian_crawl_2", "dying_crawl", "DC_Burning_artillery_reaction_v1_idle", "DC_Burning_artillery_reaction_v2_idle", "DC_Burning_artillery_reaction_v3_idle", "DC_Burning_artillery_reaction_v4_idle", "DC_Burning_bunker_sit_idle", "civilain_crouch_hide_idle", "DC_Burning_stop_bleeding_wounded_endidle", "DC_Burning_stop_bleeding_medic_endidle", "DC_Burning_stop_bleeding_wounded_idle", "prague_woundwalk_wounded_idle", "prague_bully_civ_survive_idle", "training_basketball_rest", "prague_mourner_man_idle", "airport_civ_dying_groupB_wounded", "airport_civ_dying_groupB_pull", "training_woundedwalk_soldier_1", "training_woundedwalk_soldier_2" ];
}

_id_4877()
{

}
#using_animtree("generic_human");

_id_56D9()
{
    level._id_0C59["generic"]["rescue_npc_plantcharges_1"] = %rescue_npc_plantcharges_1;
    level._id_0C59["generic"]["rescue_npc_plantcharges_2"] = %rescue_npc_plantcharges_2;
    level._id_0C59["generic"]["rescue_price_plantcharges"] = %rescue_price_plantcharges;
    maps\_anim::_id_1264( "generic", "add_belt", ::_id_3E75, "rescue_npc_plantcharges_1" );
    maps\_anim::_id_1264( "generic", "add_belt", ::_id_3E75, "rescue_npc_plantcharges_2" );
    maps\_anim::_id_1264( "generic", "add_belt", ::_id_3E75, "rescue_price_plantcharges" );
    level._id_0C59["generic"]["rappel_left_mount"] = %rescue_npc_rappel_hookup_left;
    level._id_0C59["generic"]["rappel_right_mount"] = %rescue_npc_rappel_hookup_right;
    level._id_0C59["generic"]["rappel_idle_right"][0] = %rescue_npc_rappel_idle_right;
    level._id_0C59["generic"]["rappel_idle_left"][0] = %rescue_npc_rappel_idle_left;
    level._id_0C59["generic"]["rappel"] = %rescue_npc_rappel_drop;
    level._id_0C59["generic"]["rappel_2"] = %rescue_npc_rappel_drop_2;
    level._id_0C59["generic"]["rappel_skylight_drop"] = %rappel_skylight_drop;
    level._id_0C59["generic"]["bridge_rappel_L"] = %bridge_rappel_l;
    level._id_0C59["generic"]["bridge_rappel_R"] = %bridge_rappel_r;
    level._id_0C59["generic"]["doorkick_2_cqbwalk"] = %doorkick_2_cqbwalk;
    level._id_0C59["delta"]["doorkick_2_cqbwalk"] = %doorkick_2_cqbwalk;
    level._id_0C59["grinch"]["doorkick_2_cqbwalk"] = %doorkick_2_cqbwalk;
    level._id_0C59["truck"]["doorkick_2_cqbwalk"] = %doorkick_2_cqbwalk;
    level._id_0C59["sandman"]["doorkick_2_cqbwalk"] = %doorkick_2_cqbwalk;
    level._id_0C59["price"]["doorkick_2_cqbwalk"] = %doorkick_2_cqbwalk;
    level._id_0C59["generic"]["airport_security_guard_pillar_death_R"] = %airport_security_guard_pillar_death_r;
    level._id_0C59["generic"]["RPG_stand_death_stagger"] = %rpg_stand_death_stagger;
    level._id_0C59["generic"]["coverstand_hide_idle"][0] = %coverstand_hide_idle;
    level._id_0C59["generic"]["covercrouch_hide_idle"][0] = %covercrouch_hide_idle;
    level._id_0C59["generic"]["covercrouch_run_in_R"] = %covercrouch_run_in_r;
    level._id_0C59["generic"]["covercrouch_run_in_L"] = %covercrouch_run_in_l;
    level._id_0C59["generic"]["covercrouch_run_in_ML"] = %covercrouch_run_in_ml;
    level._id_0C59["generic"]["covercrouch_run_in_MR"] = %covercrouch_run_in_mr;
    level._id_0C59["generic"]["covercrouch_run_in_M"] = %covercrouch_run_in_m;
    level._id_0C59["generic"]["stunned1"] = %exposed_flashbang_v1;
    level._id_0C59["generic"]["stunned2"] = %exposed_flashbang_v2;
    level._id_0C59["generic"]["stunned3"] = %exposed_flashbang_v3;
    level._id_0C59["generic"]["stunned4"] = %exposed_flashbang_v4;
    level._id_0C59["generic"]["stunned5"] = %exposed_flashbang_v5;
    level._id_0C59["truck"]["stunned1"] = %exposed_flashbang_v1;
    level._id_0C59["truck"]["stunned1"] = %exposed_flashbang_v1;
    level._id_0C59["generic"]["hijack_generic_stumble_stand1"] = %hijack_generic_stumble_stand1;
    level._id_0C59["generic"]["hijack_generic_stumble_stand2"] = %hijack_generic_stumble_stand2;
    level._id_0C59["generic"]["hijack_generic_stumble_crouch1"] = %hijack_generic_stumble_crouch1;
    level._id_0C59["generic"]["hijack_generic_stumble_crouch2"] = %hijack_generic_stumble_crouch2;
    level._id_0C59["price"]["stunned5"] = %exposed_flashbang_v5;
    level._id_0C59["generic"]["exposed_flashbang_v3"] = %exposed_flashbang_v3;
    level._id_0C59["generic"]["dying_crawl_back"] = %dying_crawl_back;
    level._id_0C59["generic"]["dying_crawl_back_death"] = %dying_back_death_v1;
    level._id_0C59["generic"]["dying_crawl"] = %dying_crawl;
    level._id_0C59["generic"]["dying_crawl_death"] = %dying_crawl_death_v1;
    level._id_0C59["generic"]["civilian_crawl_1"] = %civilian_crawl_1;
    level._id_0C59["generic"]["civilian_crawl_1_death"] = %civilian_crawl_1_death_a;
    level._id_0C59["generic"]["civilian_crawl_2"] = %civilian_crawl_2;
    level._id_0C59["generic"]["civilian_crawl_2_death"] = %civilian_crawl_2_death_a;
    level._id_0C59["generic"]["DC_Burning_bunker_stumble"] = %dc_burning_bunker_stumble;
    level._id_0C59["generic"]["DC_Burning_bunker_stumble_idle"][0] = %dc_burning_bunker_sit_idle;
    level._id_0C59["truck"]["stunned1"] = %exposed_flashbang_v1;
    level._id_0C59["grinch"]["stunned2"] = %exposed_flashbang_v2;
    level._id_0C59["generic"]["stunned3"] = %exposed_flashbang_v3;
    level._id_0C59["sandman"]["stunned4"] = %exposed_flashbang_v4;
    level._id_0C59["price"]["stunned5"] = %exposed_flashbang_v5;
    level._id_0C59["generic"]["airport_civ_dying_groupB_wounded"] = %airport_civ_dying_groupb_wounded;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level._id_0C59["generic"]["airport_civ_dying_groupB_wounded_death"] = %airport_civ_dying_groupb_wounded_death;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull_death"] = %airport_civ_dying_groupb_pull_death;
    level._id_0C59["generic"]["training_woundedwalk_soldier_1"] = %training_woundedwalk_soldier_1;
    level._id_0C59["generic"]["training_woundedwalk_soldier_2"] = %training_woundedwalk_soldier_2;
    level._id_0C59["generic"]["hunted_dazed_walk_A_zombie"] = %hunted_dazed_walk_a_zombie;
    level._id_0C59["generic"]["hunted_dazed_walk_B_blind"] = %hunted_dazed_walk_b_blind;
    level._id_0C59["generic"]["hunted_dazed_walk_C_limp"] = %hunted_dazed_walk_c_limp;
    level._id_0C59["generic"]["doorkick_2_cqbrun"] = %doorkick_2_cqbrun;
    level._id_0C59["generic"]["doorkick_2_stand"] = %doorkick_2_stand;
    level._id_0C59["generic"]["rescue_pres_run"] = %rescue_pres_run;
    level._id_0C59["generic"]["rescue_enemy_breach_run_1"] = %rescue_enemy_breach_run_1;
    level._id_0C59["generic"]["rescue_enemy_breach_run_2"] = %rescue_enemy_breach_run_2;
    level._id_0C59["generic"]["rescue_enemy_breach_run_3"] = %rescue_enemy_breach_run_3;
    level._id_0C59["generic"]["rescue_pres_breach_run_holder"] = %rescue_pres_breach_run_holder;
    level._id_0C59["generic"]["rescue_pres_breach_run_pres"] = %rescue_pres_breach_run_pres;
    level._id_0C59["generic"]["rescue_pres_breach_run_pres_death"] = %rescue_pres_breach_run_pres_death;
    level._id_0C59["generic"]["rescue_pres_breach_run_pres_survives"] = %rescue_pres_getup_fall;
    level._id_0C59["generic"]["breach_react_desk_v2"] = %breach_react_desk_v2;
    level._id_0C59["generic"]["breach_react_push_guy1"] = %breach_react_push_guy1;
    level._id_0C59["generic"]["breach_react_push_guy2"] = %breach_react_push_guy2;
    level._id_0C59["generic"]["breach_react_blowback_v2"] = %breach_react_blowback_v2;
    level._id_0C59["generic"]["breach_react_blowback_v3"] = %breach_react_blowback_v3;
    level._id_0C59["alena"]["rescue_chair_untie"] = %rescue_chair_untie_girl_1;
    level._id_0C59["price"]["rescue_chair_untie"] = %rescue_chair_untie_price;
    maps\_anim::_id_1261( "price", "knife_give", "weapon_parabolic_knife", "tag_inhand", "rescue_chair_untie" );
    maps\_anim::_id_1262( "price", "knife_take", "weapon_parabolic_knife", "tag_inhand", "rescue_chair_untie" );
    level._id_0C59["sandman"]["rescue_chair_untie"] = %rescue_chair_untie_soap;
    level._id_0C59["generic"]["rescue_chair_untie"] = %rescue_chair_untie_soldier;
    level._id_0C59["generic"]["rescue_chair_untie_idle"][0] = %rescue_chair_untie_soldier_idle;
    level._id_0C59["alena"]["rescue_chair_untie_idle"][0] = %rescue_chair_untie_girl_2;
    level._id_0C59["generic"]["exposed_dive_grenade_f"] = %exposed_dive_grenade_f;
    level._id_0C59["generic"]["exposed_dive_grenade_b"] = %exposed_dive_grenade_b;
    level._id_0C59["generic"]["exposed_death_blowback"] = %exposed_death_blowback;
    level._id_0C59["generic"]["stand_death_shoulder_spin"] = %stand_death_shoulder_spin;
    level._id_0C59["generic"]["ch_pragueb_7_5_crosscourt_aimantle_a"] = %ch_pragueb_7_5_crosscourt_aimantle_a;
    level._id_0C59["generic"]["pres_getup_idle"][0] = %rescue_pres_getup_loop;
    level._id_0C59["generic"]["pres_getup_president"] = %rescue_pres_getup_pres;
    level._id_0C59["generic"]["pres_getup_sandman"] = %rescue_pres_getup_price;
    level._id_0C59["generic"]["pres_getup_price"] = %rescue_pres_getup_sandman;
    maps\_anim::_id_1261( "generic", "attach knife", "weapon_parabolic_knife", "tag_inhand", "pres_getup_price" );
    maps\_anim::_id_1262( "generic", "detach knife", "weapon_parabolic_knife", "tag_inhand", "pres_getup_price" );
    level._id_0C59["generic"]["rescue_blocked_door"] = %rescue_blocked_door;
    level._id_0C59["truck"]["breach_kick_kickerR1_enter"] = %breach_kick_kickerr1_enter;
    level._id_0C59["generic"]["breach_sh_stackr1_idle"] = %breach_sh_stackr1_idle;
    level._id_0C59["generic"]["active_patrolwalk_gundown"] = %active_patrolwalk_gundown;
    level._id_0C59["generic"]["afgan_caves_price_slide"] = %afgan_caves_price_slide;
    level._id_0C59["truck"]["afgan_caves_price_slide"] = %afgan_caves_price_slide;
    level._id_0C59["price"]["afgan_caves_price_slide"] = %afgan_caves_price_slide;
    level._id_0C59["grinch"]["afgan_caves_price_slide"] = %afgan_caves_price_slide;
    level._id_0C59["sandman"]["afgan_caves_price_slide"] = %afgan_caves_price_slide;
    level._id_0C59["price"]["rescue_elevator_speaking_price"] = %rescue_elevator_speaking_price;
    level._id_0C59["sandman"]["rescue_elevator_speaking_sandman"] = %rescue_elevator_speaking_sandman;
    level._id_0C59["price"]["melee_f_awin_attack"] = %melee_f_awin_attack;
    level._id_0C59["generic"]["melee_f_awin_defend"] = %melee_f_awin_defend;
    level._id_0C59["truck"]["ny_manhattan_radio_talk_idle"] = %ny_manhattan_radio_talk_idle;
    level._id_0C59["grinch"]["ny_manhattan_radio_talk_idle"] = %ny_manhattan_radio_talk_idle;
    level._id_0C59["delta_two"]["ny_manhattan_radio_talk_idle"] = %ny_manhattan_radio_talk_idle;
    level._id_0C59["truck"]["ny_manhattan_radio_sandman_talk"] = %ny_manhattan_radio_sandman_talk;
    level._id_0C59["grinch"]["ny_manhattan_radio_sandman_talk"] = %ny_manhattan_radio_sandman_talk;
    level._id_0C59["generic"]["ny_manhattan_radio_sandman_talk"] = %ny_manhattan_radio_sandman_talk;
    level._id_0C59["generic"]["corner_standL_alert_idle"][0] = %corner_standl_alert_idle;
}

_id_5327()
{
    level._id_5327 = [];
    level._id_5327[level._id_5327.size] = %death_explosion_stand_b_v1;
    level._id_5327[level._id_5327.size] = %death_explosion_stand_l_v1;
    level._id_5327[level._id_5327.size] = %death_explosion_stand_f_v1;
    level._id_5327[level._id_5327.size] = %death_explosion_stand_r_v1;
    level._id_5327[level._id_5327.size] = %death_explosion_forward_superfar;
}

sounds()
{
    level.scr_sound["launch_chopsaw1"] = "launch_chopsaw1";
    level.scr_sound["launch_chopsaw2"] = "launch_chopsaw2";
}

_id_3E67()
{
    var_0 = vehicle_scripts\_suburban_minigun::_id_3A9D();
    var_0 = _id_3E69( var_0 );
    return var_0;
}

_id_3E68()
{
    var_0 = vehicle_scripts\_suburban::_id_3A9D();
    var_0 = _id_3E69( var_0 );
    var_0[1]._id_1048 = %uaz_rear_driver_death;
    var_0[2]._id_1048 = %uaz_rear_driver_death;
    var_0[3]._id_1048 = %uaz_rear_driver_death;
    return var_0;
}

_id_3E69( var_0 )
{
    var_0[1]._id_3E6A[0] = %uaz_rguy_scan_side_v1;
    var_0[1]._id_3E6A[1] = %uaz_rguy_scan_side_v1;
    var_0[1]._id_3E6B[0] = 500;
    var_0[1]._id_3E6B[1] = 500;
    var_0[2]._id_3E6A[0] = %uaz_rguy_scan_side_v1;
    var_0[2]._id_3E6A[1] = %uaz_rguy_scan_side_v1;
    var_0[2]._id_3E6B[0] = 500;
    var_0[2]._id_3E6B[1] = 500;
    var_0[3]._id_3E6A[0] = %uaz_lguy_fire_side_v1;
    var_0[3]._id_3E6A[1] = %uaz_lguy_fire_side_v2;
    var_0[3]._id_3E6B[0] = 500;
    var_0[3]._id_3E6B[1] = 500;
    return var_0;
}

_id_539C()
{
    level._id_0C59["generic"]["RPG_stand_death_stagger"] = %rpg_stand_death_stagger;
    level._id_0C59["generic"]["run_death_fallonback"] = %run_death_fallonback;
    level._id_0C59["generic"]["run_death_roll"] = %run_death_roll;
    level._id_5E78 = [];
    level._id_5E78[level._id_5E78.size] = %death_run_forward_crumple;
    level._id_5E78[level._id_5E78.size] = %run_death_roll;
    level._id_5E78[level._id_5E78.size] = %run_death_flop;
    level._id_5E78[level._id_5E78.size] = %run_death_fallonback;
    level._id_5E78[level._id_5E78.size] = %death_run_onleft;
    level._id_5E78[level._id_5E78.size] = %death_run_onfront;
}

_id_02C2( var_0 )
{
    var_0 thread maps\rescue_2_code::_id_5D52();
}

_id_02C3( var_0 )
{
    var_0 notify( "stop_sparks" );
}

_id_018E( var_0 )
{
    var_0 thread maps\rescue_2_code::_id_0183();
}

_id_018F( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "ball_bounce_dust" ), var_0, "tag_inhand" );
    playfxontag( common_scripts\utility::getfx( "ball_bounce_dust" ), var_0, "tag_inhand" );
    wait 0.01;
    var_1 = spawn( "script_model", var_0 gettagorigin( "tag_inhand" ) );
    playfx( level._effect["ball_bounce_dust"], var_1.origin, ( -6.0, 0.0, 1.0 ) );
    playfx( level._effect["ball_bounce_dust"], var_1.origin, ( -3.0, 4.0, 1.0 ) );
    var_1.angles = var_0 gettagangles( "tag_inhand" );
    var_1 setmodel( "weapon_saw_rescue" );
}

_id_0147()
{
    waittillframeend;
    maps\_anim::_id_125F( "truck", "rescue_saw_cutter", "scn_rescue_chopsaw_foley" );
}

_id_3E6C()
{
    level._id_0C59["truck"]["saw_side_pickup"] = %saw_side_pickup;
    level._id_0C59["truck"]["saw_side_idleA"] = %saw_side_idlea;
    level._id_0C59["truck"]["saw_side_drop"] = %saw_side_drop;
    level._id_0C59["delta"]["saw_side_pull_idle"] = %saw_side_pull_idle;
    level._id_0C59["delta"]["saw_side_trans_b_2_pull"] = %saw_side_trans_b_2_pull;
    level._id_0C59["delta"]["saw_side_trans_A_2_B"] = %saw_side_trans_a_2_b;
    level._id_0C59["delta"]["saw_side_idleB"] = %saw_side_idleb;
    level._id_0C59["truck"]["rescue_saw_cutter"] = %rescue_saw_cutter;
    thread _id_0147();
    maps\_anim::_id_1261( "truck", "pickup", "weapon_saw_rescue", "TAG_INHAND", "rescue_saw_cutter" );
    maps\_anim::_id_1262( "truck", "chopsaw_drop", "weapon_saw_rescue", "TAG_INHAND", "rescue_saw_cutter" );
    maps\_anim::_id_1264( "truck", "start", ::_id_02C2, "rescue_saw_cutter" );
    maps\_anim::_id_1264( "truck", "stop", ::_id_02C3, "rescue_saw_cutter" );
    maps\_anim::_id_1264( "truck", "start", ::_id_018E, "rescue_saw_cutter" );
    maps\_anim::_id_1264( "truck", "chopsaw_drop", ::_id_018F, "rescue_saw_cutter" );
}

_id_78A1()
{
    level._id_0C59["sandman"]["ending_last_stand"] = %rescue_ending_delta_last_stand_sandman;
    level._id_0C59["grinch"]["ending_last_stand"] = %rescue_ending_delta_last_stand_grinch;
    level._id_0C59["truck"]["ending_last_stand"] = %rescue_ending_delta_last_stand_truck;
    maps\_anim::_id_1264( "sandman", "fire", maps\rescue_2_cavern_code::_id_5E7B, "ending_last_stand" );
    maps\_anim::_id_1264( "grinch", "fire", maps\rescue_2_cavern_code::_id_5E7B, "ending_last_stand" );
    maps\_anim::_id_1264( "truck", "fire", maps\rescue_2_cavern_code::_id_5E7B, "ending_last_stand" );
    level._id_0C59["generic"]["rescue_ending_delta_retreat_sandman"] = %rescue_ending_delta_retreat_sandman;
    maps\_anim::_id_1267( "generic", "old_retreat_start", "old_retreat_start", "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1261( "generic", "knife_pickup", "weapon_parabolic_knife", "TAG_INHAND", "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1262( "generic", "knife_throw", "weapon_parabolic_knife", "TAG_INHAND", "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1261( "generic", "attach clip right", "weapon_m16_clip_iw5", "TAG_INHAND", "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1262( "generic", "detach clip right", "weapon_m16_clip_iw5", "TAG_INHAND", "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1264( "generic", "knife_throw", ::_id_3E72, "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1265( "generic", "knife_stab", "rescue_ending_delta_retreat_sandman", "bodyshot1", "TAG_INHAND" );
    maps\_anim::_id_1265( "generic", "bullet_hit", "rescue_ending_delta_retreat_sandman", "headshot1", "J_SHOULDER_RI" );
    maps\_anim::_id_1264( "generic", "pistol_pickup", ::_id_0148, "rescue_ending_delta_retreat_sandman" );
    level._id_0C59["generic"]["rescue_ending_delta_retreat_sandman_ambusher"] = %rescue_ending_delta_retreat_sandman_ambusher;
    maps\_anim::_id_1265( "generic", "knife_stab", "rescue_ending_delta_retreat_sandman_ambusher", "knife_stab", "J_NECK" );
    maps\_anim::_id_1265( "generic", "knife_pullout", "rescue_ending_delta_retreat_sandman_ambusher", "knife_stab", "J_NECK" );
    level._id_0C59["generic"]["rescue_ending_delta_retreat_truck"] = %rescue_ending_delta_retreat_truck;
    level._id_0C59["generic"]["rescue_ending_delta_retreat_truck_ambusher"] = %rescue_ending_delta_retreat_truck_ambusher;
    level._id_0C59["generic"]["rescue_ending_delta_retreat_grinch_v2"] = %rescue_ending_delta_retreat_grinch_v2;
    maps\_anim::_id_1264( "generic", "sandman_ambusher_start", maps\rescue_2_cavern_code::_id_5E71, "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1264( "generic", "truck_ambusher_start", maps\rescue_2_cavern_code::_id_5E73, "rescue_ending_delta_retreat_truck" );
    maps\_anim::_id_1264( "generic", "fire", maps\rescue_2_cavern_code::_id_5E7B, "rescue_ending_delta_retreat_sandman" );
    maps\_anim::_id_1264( "generic", "fire", maps\rescue_2_cavern_code::_id_5E7B, "rescue_ending_delta_retreat_truck" );
    maps\_anim::_id_1264( "generic", "dropgun", ::_id_3E73, "rescue_ending_delta_retreat_grinch_v2" );
    maps\_anim::_id_1264( "generic", "pistol_pickup", ::_id_3E71, "rescue_ending_delta_retreat_grinch_v2" );
    maps\_anim::_id_1264( "generic", "fire_left", ::_id_3E6F, "rescue_ending_delta_retreat_grinch_v2" );
    maps\_anim::_id_1264( "generic", "fire", maps\rescue_2_cavern_code::_id_5E7B, "rescue_ending_delta_retreat_grinch_v2" );
    level._id_0C59["generic"]["rescue_ending_player_drag_handoff_truck"] = %rescue_ending_player_drag_handoff_truck;
    level._id_0C59["generic"]["rescue_ending_player_drag_handoff_sandman"] = %rescue_ending_player_drag_handoff_sandman;
    level._id_0C59["generic"]["rescue_ending_player_drag_handoff_price"] = %rescue_ending_player_drag_handoff_price;
    maps\_anim::_id_1264( "generic", "fire", maps\rescue_2_cavern_code::_id_5E7B, "rescue_ending_player_drag_handoff_sandman" );
    maps\_anim::_id_1264( "generic", "fire", maps\rescue_2_cavern_code::_id_5E7B, "rescue_ending_player_drag_handoff_price" );
    level._id_0C59["generic"]["BH_getin"] = %rescue_ending_pres_heli_getin_truck;
    level._id_0C59["grinch"]["BH_getin"] = %rescue_ending_pres_heli_getin_grinch;
    level._id_0C59["president"]["BH_getin"] = %rescue_ending_pres_heli_getin_president;
    level._id_0C59["price"]["BH_anim"] = %rescue_ending_player_into_bh_price;
    level._id_0C59["president"]["BH_anim"] = %rescue_ending_player_into_bh_president;
    maps\_anim::_id_1267( "price", "delta_laststand_start", "start_delta_last_stand", "BH_anim" );
    level._id_0C59["price"]["rescue_door_breach_p"] = %rescue_door_breach_price;
    level._id_0C59["sandman"]["rescue_door_breach_s"] = %rescue_door_breach_sandman;
}
#using_animtree("script_model");

_id_3E6D()
{
    level._id_1245["rope_two"] = #animtree;
    level._id_0C59["rope_two"]["coop_bridge_rappel_L"] = %coop_bridge_rappel_l;
    level._id_0C59["rope_two"]["coop_bridge_rappel_R"] = %coop_bridge_rappel_r;
    level._id_0C59["rope_two"]["coop_ropedrop_01"] = %coop_ropedrop_01;
    level._id_1245["rope"] = #animtree;
    level._id_1F90["rope"] = "weapon_rappel_rope_long";
    level._id_0C59["rope"]["rappel_1"] = %rescue_rope_long_rappel_1;
    level._id_0C59["rope"]["rappel_2"] = %rescue_rope_long_rappel_2;
    level._id_1245["carabiner"] = #animtree;
    level._id_1F90["carabiner"] = "weapon_carabiner_thin_rope";
    level._id_0C59["carabiner"]["rappel_1"] = %rescue_rope_carabiner_rappel_1;
    level._id_0C59["carabiner"]["rappel_2"] = %rescue_rope_carabiner_rappel_2;
    level._id_0C59["fxanim"]["fxanim_castle_generator_mod"][0] = %fxanim_castle_generator_anim;
    level._id_0C59["semtex"]["rescue_npc_plantcharges_1"] = %rescue_semtex_belt_npc1;
    level._id_0C59["semtex"]["rescue_npc_plantcharges_2"] = %rescue_semtex_belt_npc2;
    level._id_0C59["semtex"]["rescue_price_plantcharges"] = %rescue_semtex_belt_price;
    level._id_1245["rappelrope"] = #animtree;
    level._id_1F90["rappelrope"] = "rescue2_rappelrope";
    level._id_0C59["rappelrope"]["rappel_left_mount"] = %rescue_npc_rappel_hookup_left_rappelrope;
    level._id_0C59["rappelrope"]["rappel_right_mount"] = %rescue_npc_rappel_hookup_right_rappelrope;
    level._id_0C59["rappelrope"]["rappel_idle_left"][0] = %rescue_npc_rappel_idle_left_rappelrope;
    level._id_0C59["rappelrope"]["rappel_idle_right"][0] = %rescue_npc_rappel_idle_right_rappelrope;
    level._id_0C59["rappelrope"]["rappel"] = %rescue_npc_rappel_drop_rappelrope;
    level._id_1245["flexcuff"] = #animtree;
    level._id_1F90["flexcuff"] = "prop_flex_cuff";
    level._id_0C59["flexcuff"]["rescue_chair_untie"] = %rescue_chair_untie_flex_cuffs;
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_yuri_europe";
    level._id_0C59["player_rig"]["rappel_1"] = %rescue_player_rappel_1;
    level._id_0C59["player_rig"]["rappel_2"] = %rescue_player_rappel_2_mirrored;
    level._id_0C59["generic"]["rescue_ending_player_drag_handoff_player"] = %rescue_ending_player_drag_handoff_player;
    level._id_0C59["generic"]["rescue_ending_player_into_bh_player"] = %rescue_ending_player_into_bh_player;
    level._id_0C59["generic"]["rescue_ending_pres_heli_getin_player"] = %rescue_ending_pres_heli_getin_player;
    level._id_0C59["generic"]["rescue_ending_delta_retreat_player"] = %rescue_ending_delta_retreat_player;
    maps\_anim::_id_1267( "generic", "delta_retreat_start", "start_delta_retreat", "rescue_ending_player_drag_handoff_player" );
    level._id_1245["player_legs"] = #animtree;
    level._id_1F90["player_legs"] = "viewlegs_generic";
    level._id_0C59["player_legs"]["rappel_1"] = %rescue_player_legs_rappel_1;
    level._id_0C59["player_legs"]["rappel_2"] = %rescue_player_legs_rappel_2;
    level._id_0C59["player_rig"]["floor_breach"] = %semtex_belt_deploy_player;
    level._id_1245["semtexbelt"] = #animtree;
    level._id_1F90["semtexbelt"] = "mil_semtex_belt";
    level._id_0C59["semtexbelt"]["floor_breach"] = %semtex_belt_deploy;
    maps\_anim::_id_1265( "semtexbelt", "blinky", "floor_breach", "detonator_light", "tag_fx" );
    maps\_anim::_id_125D( "semtexbelt", "blinky", "floor_breach", "scn_detonator_beep" );
    level._id_1245["semtexbeltnofx"] = #animtree;
    level._id_1F90["semtexbeltnofx"] = "mil_semtex_belt_obj";
    level._id_0C59["semtexbeltnofx"]["floor_breach"] = %semtex_belt_deploy;
}
#using_animtree("animated_props");

_id_56E8()
{
    level._id_1245["swinging_light"] = #animtree;
    level._id_0C59["swinging_light"]["wind_medium"][0] = %payback_const_hanging_light;
}
#using_animtree("vehicles");

_id_0B5A()
{
    level._id_1245["blackhawk"] = #animtree;
    level._id_1F90["blackhawk"] = "vehicle_blackhawk_hero_sas_night";
    level._id_0C59["blackhawk"]["dodge"] = %rescue_blackhawk_dodge_rpg;
    level._id_0C59["blackhawk"]["rescue_ending_pres_heli_getin_blackhawk"] = %rescue_ending_pres_heli_getin_blackhawk;
}
#using_animtree("generic_human");

_id_4C08()
{
    level.scr_sound["grinch"]["rescue_pri_diamondmine"] = "rescue_pri_diamondmine";
    level.scr_sound["sandman"]["rescue_pri_wayacross"] = "rescue_pri_wayacross";
    level.scr_sound["sandman"]["rescue_snd_rogerthat"] = "rescue_snd_rogerthat";
    level._id_11BB["rescue_pri_stillalive"] = "rescue_pri_stillalive";
    level.scr_sound["sandman"]["rescue_snd_stackup"] = "rescue_snd_stackup";
    level.scr_sound["generic"]["rescue_snd_whatwasthat"] = "rescue_snd_whatwasthat";
    level.scr_sound["generic"]["rescue_pri_deathtrap"] = "rescue_pri_deathtrap";
    level.scr_sound["truck"]["rescue_snd_taketopside"] = "rescue_snd_taketopside";
    level.scr_sound["price"]["rescue_pri_onme"] = "rescue_pri_onme";
    level.scr_sound["truck"]["rescue_trk_targetshigh"] = "rescue_trk_targetshigh";
    level.scr_sound["grinch"]["rescue_rno_iseeem"] = "rescue_rno_iseeem";
    level.scr_sound["price"]["rescue_pri_sortemout"] = "rescue_pri_sortemout";
    level.scr_sound["sandman"]["rescue_snd_youreup"] = "rescue_snd_youreup";
    level.scr_sound["truck"]["rescue_trk_onit"] = "rescue_trk_onit";
    level.scr_sound["truck"]["rescue_rno_closingdoors"] = "rescue_rno_closingdoors";
    level.scr_sound["price"]["rescue_pri_keepmoving"] = "rescue_pri_keepmoving";
    level.scr_sound["grinch"]["rescue_rno_needanotherway"] = "rescue_rno_needanotherway";
    level.scr_sound["sandman"]["rescue_snd_takestairwell"] = "rescue_snd_takestairwell";
    level._id_11BB["rescue_snd_bringinsupport"] = "rescue_snd_bringinsupport";
    level._id_11BB["rescue_hqr_chopapredator"] = "rescue_hqr_chopapredator";
    level.scr_sound["sandman"]["rescue_snd_ready"] = "rescue_snd_ready";
    level.scr_sound["price"]["rescue_pri_go"] = "rescue_pri_go";
    level.scr_sound["generic"]["rescue_pri_go"] = "rescue_pri_go";
    level._id_11BB["rescue_snd_takeoutarmor"] = "rescue_snd_takeoutarmor";
    level._id_11BB["rescue_snd_takeoutchoppers"] = "rescue_snd_takeoutchoppers";
    level.scr_sound["sandman"]["rescue_snd_usepredator"] = "rescue_snd_usepredator";
    level._id_11BB["rescue_snd_onedown"] = "rescue_snd_onedown";
    level._id_11BB["rescue_pri_takeoutlastgroup"] = "rescue_pri_takeoutlastgroup";
    level._id_11BB["rescue_pri_wastingtime"] = "rescue_pri_wastingtime";
    level.scr_sound["sandman"]["rescue_snd_nicework"] = "rescue_snd_nicework";
    level._id_11BB["rescue_snd_nicework"] = "rescue_snd_nicework";
    level.scr_sound["price"]["rescue_pri_acrosstheyard"] = "rescue_pri_acrosstheyard";
    level.scr_sound["sandman"]["rescue_snd_letsmove"] = "rescue_snd_letsmove";
    level.scr_sound["grinch"]["rescue_rno_allclear"] = "rescue_rno_allclear";
    level.scr_sound["sandman"]["rescue_snd_letsmove"] = "rescue_snd_letsmove";
    level.scr_sound["price"]["rescue_pri_dooropen"] = "rescue_pri_dooropen";
    level.scr_sound["rescue_pri_predatorback"] = "rescue_pri_predatorback";
    level.scr_sound["sandman"]["rescue_snd_needpredator"] = "rescue_snd_needpredator";
    level.scr_sound["sandman"]["rescue_snd_tookoutuav"] = "rescue_snd_tookoutuav";
    level.scr_sound["sandman"]["rescue_snd_anotherway"] = "rescue_snd_anotherway";
    level.scr_sound["price"]["rescue_pri_getpinneddown"] = "rescue_pri_getpinneddown";
    level.scr_sound["sandman"]["rescue_snd_whereispredator"] = "rescue_snd_whereispredator";
    level.scr_sound["sandman"]["rescue_snd_getinside"] = "rescue_snd_getinside";
    level._id_11BB["rescue_snd_getinside"] = "rescue_snd_getinside";
    level.scr_sound["grinch"]["rescue_rno_12oclock"] = "rescue_rno_12oclock";
    level._id_11BB["rescue_rno_12oclock"] = "rescue_rno_12oclock";
    level.scr_sound["sandman"]["rescue_snd_getdoorsopen"] = "rescue_snd_getdoorsopen";
    level.scr_sound["mccoy"]["rescue_mcy_lookout"] = "rescue_mcy_lookout";
    level._id_11BB["rescue_ru4_outthere"] = "rescue_ru4_outthere";
    level._id_11BB["rescue_ru3_openfire"] = "rescue_ru3_openfire";
    level._id_11BB["rescue_ru2_stayaway"] = "rescue_ru2_stayaway";
    level._id_11BB["rescue_ru1_getready"] = "rescue_ru1_getready";
    level._id_11BB["rescue_snd_holdingcell"] = "rescue_snd_holdingcell";
    level.scr_sound["price"]["rescue_pri_openitup"] = "rescue_pri_openitup";
    level.scr_sound["truck"]["rescue_pri_bloody"] = "rescue_pri_bloody";
    level._id_11BB["rescue_hqr_securedpresident"] = "rescue_hqr_securedpresident";
    level._id_11BB["rescue_snd_foundathena"] = "rescue_snd_foundathena";
    level._id_11BB["rescue_hqr_sendinateam"] = "rescue_hqr_sendinateam";
    level.scr_sound["truck"]["rescue_trk_furtherdown"] = "rescue_trk_furtherdown";
    level.scr_sound["sandman"]["rescue_snd_maybealive"] = "rescue_snd_maybealive";
    level.scr_sound["truck"]["rescue_trk_tryingtosay"] = "rescue_trk_tryingtosay";
    level.scr_sound["price"]["rescue_pri_onthecatwalk"] = "rescue_pri_onthecatwalk";
    level.scr_sound["grinch"]["rescue_rno_thereheis"] = "rescue_rno_thereheis";
    level.scr_sound["price"]["rescue_pri_nottoolate"] = "rescue_pri_nottoolate";
    level.scr_sound["sandman"]["rescue_snd_hookup"] = "rescue_snd_hookup";
    level._id_11BB["rescue_snd_stopwasting"] = "rescue_snd_stopwasting";
    level.scr_sound["sandman"]["rescue_snd_losinghim"] = "rescue_snd_losinghim";
    level.scr_sound["sandman"]["rescue_snd_thisway"] = "rescue_snd_thisway";
    level.scr_sound["price"]["rescue_pri_yurigetbackhere"] = "rescue_pri_yurigetbackhere";
    level.scr_sound["price"]["rescue_pri_whereareyougoing"] = "rescue_pri_whereareyougoing";
    level.scr_sound["grinch"]["rescue_rno_theretheyare"] = "rescue_rno_theretheyare";
    level._id_11BB["rescue_snd_exactlocation"] = "rescue_snd_exactlocation";
    level.scr_sound["price"]["rescue_pri_cantbreak"] = "rescue_pri_cantbreak";
    level.scr_sound["grinch"]["rescue_rno_brightideas"] = "rescue_rno_brightideas";
    level.scr_sound["price"]["rescue_pri_breachuptop"] = "rescue_pri_breachuptop";
    level.scr_sound["grinch"]["rescue_rno_gottago"] = "rescue_rno_gottago";
    level.scr_sound["grinch"]["rescue_rno_clear2"] = "rescue_rno_clear2";
    level.scr_sound["price"]["rescue_pri_chargeshere"] = "rescue_pri_chargeshere";
    level.scr_sound["price"]["rescue_pri_stackup"] = "rescue_pri_stackup";
    level.scr_sound["sandman"]["rescue_snd_stackup2"] = "rescue_snd_stackup2";
    level._id_11BB["rescue_snd_jackpot"] = "rescue_snd_jackpot";
    level._id_11BB["rescue_hqr_extractionpoint"] = "rescue_hqr_extractionpoint";
    level._id_11BB["rescue_snd_bringbirdtous"] = "rescue_snd_bringbirdtous";
    level._id_11BB["rescue_hqr_twobirds"] = "rescue_hqr_twobirds";
    level.scr_sound["sandman"]["rescue_snd_holdposition"] = "rescue_snd_holdposition";
    level.scr_sound["truck"]["rescue_trk_badguys"] = "rescue_trk_badguys";
    level.scr_sound["grinch"]["rescue_rno_enemiesonflank"] = "rescue_rno_enemiesonflank";
    level._id_11BB["rescue_snd_bailusout"] = "rescue_snd_bailusout";
    level._id_11BB["rescue_hp1_almostthere"] = "rescue_hp1_almostthere";
    level._id_11BB["rescue_snd_ourride"] = "rescue_snd_ourride";
    level._id_11BB["rescue_hp1_getouttahere"] = "rescue_hp1_getouttahere";
    level._id_11BB["rescue_snd_soundsgood"] = "rescue_snd_soundsgood";
    level.scr_sound["sandman"]["rescue_snd_letsmove2"] = "rescue_snd_letsmove2";
    level._id_11BB["rescue_hp2_presidenton"] = "rescue_hp2_presidenton";
    level._id_11BB["rescue_hp2_rpgmove"] = "rescue_hp2_rpgmove";
    level._id_11BB["rescue_hp2_hangon"] = "rescue_hp2_hangon";
    level._id_11BB["rescue_hp2_gottaleave"] = "rescue_hp2_gottaleave";
    level._id_11BB["rescue_hp2_toohot"] = "rescue_hp2_toohot";
    level.scr_sound["price"]["rescue_pri_prepexfil"] = "rescue_pri_prepexfil";
    level.scr_sound["price"]["rescue_pri_gethimback"] = "rescue_pri_gethimback";
    level.scr_sound["price"]["rescue_pri_deeperin"] = "rescue_pri_deeperin";
    level.scr_sound["price"]["rescue_pri_shesalive"] = "rescue_pri_shesalive";
    level.scr_sound["price"]["rescue_pri_movemove"] = "rescue_pri_movemove";
    level._id_11BB["rescue_pri_yurisdown"] = "rescue_pri_yurisdown";
    level.scr_sound["price"]["rescue_pri_dontthink"] = "rescue_pri_dontthink";
    level.scr_sound["price"]["rescue_pri_betterbe"] = "rescue_pri_betterbe";
    level.scr_sound["price"]["rescue_pri_timetogo"] = "rescue_pri_timetogo";
    level.scr_sound["price"]["rescue_pri_no"] = "rescue_pri_no";
    level.scr_sound["price"]["rescue_pri_backdown"] = "rescue_pri_backdown";
    level.scr_sound["price"]["rescue_pri_readme"] = "rescue_pri_readme";
    level.scr_sound["price"]["rescue_pri_comein"] = "rescue_pri_comein";
    level.scr_sound["price"]["rescue_pri_doyoucopy"] = "rescue_pri_doyoucopy";
    level.scr_sound["price"]["rescue_pri_stillthere"] = "rescue_pri_stillthere";
    level._id_11B7["price"]["rescue_pri_readme"] = %rescue_ending_player_into_bh_price_vo_readme;
    level._id_11B7["price"]["rescue_pri_backdown"] = %rescue_ending_player_into_bh_price_vo_backdown;
    level._id_11B7["price"]["rescue_pri_comein"] = %rescue_ending_player_into_bh_price_vo_comein;
    level._id_11B7["price"]["rescue_pri_doyoucopy"] = %rescue_ending_player_into_bh_price_vo_doyoucopy;
    level._id_11B7["price"]["rescue_pri_comein"] = %rescue_ending_player_into_bh_price_vo_readme;
    level.scr_sound["generic"]["rescue_aln_mumbles"] = "rescue_aln_mumbles";
    level.scr_sound["sandman"]["rescue_snd_gottago"] = "rescue_snd_gottago";
    level._id_11BB["rescue_snd_toomuchheat"] = "rescue_snd_toomuchheat";
    level.scr_sound["sandman"]["rescue_snd_coverright"] = "rescue_snd_coverright";
    level._id_11BB["rescue_snd_justgo"] = "rescue_snd_justgo";
    level._id_11BB["rescue_snd_goooo"] = "rescue_snd_goooo";
    level.scr_sound["grinch"]["rescue_rno_closingdoors"] = "rescue_rno_closingdoors";
    level.scr_sound["grinch"]["rescue_rno_theretheyare"] = "rescue_rno_theretheyare";
    level.scr_sound["grinch"]["rescue_rno_gettocover"] = "rescue_rno_gettocover";
    level.scr_sound["grinch"]["rescue_rno_help"] = "rescue_rno_help";
    level.scr_sound["grinch"]["rescue_rno_pressecure"] = "rescue_rno_pressecure";
    level._id_11BB["rescue_rno_rpg"] = "rescue_rno_rpg";
    level.scr_sound["truck"]["rescue_trk_whatthe"] = "rescue_trk_whatthe";
    level.scr_sound["truck"]["rescue_trk_rpg"] = "rescue_trk_rpg";
    level._id_11BB["rescue_trk_rpg"] = "rescue_trk_rpg";
    level.scr_sound["truck"]["rescue_trk_igotyou"] = "rescue_trk_igotyou";
    level.scr_sound["truck"]["rescue_trk_imout"] = "rescue_trk_imout";
    level._id_11BB["rescue_hqr_extractionpoint"] = "rescue_hqr_extractionpoint";
    level._id_11BB["rescue_hqr_twobirds"] = "rescue_hqr_twobirds";
    level.scr_sound["president"]["rescue_prs_daughter"] = "rescue_prs_daughter";
    level._id_11BB["rescue_bhp_pullup"] = "rescue_bhp_pullup";
    level._id_11BB["rescue_bhp_hangon"] = "rescue_bhp_hangon";
    level._id_11BB["rescue_bhp_movenow"] = "rescue_bhp_movenow";
    level._id_11BB["rescue_lbp_imhit"] = "rescue_lbp_imhit";
    level._id_11BB["rescue_lbp_goindown"] = "rescue_lbp_goindown";
    level._id_11BB["rescue_nws_gatheredtoday"] = "rescue_nws_gatheredtoday";
    level._id_11BB["rescue_nws_reportsconfirm"] = "rescue_nws_reportsconfirm";
    level._id_11BB["rescue_nws_othernews"] = "rescue_nws_othernews";
    level.scr_sound["truck"]["rescue_trk_throughdoor"] = "rescue_trk_throughdoor";
    level.scr_sound["truck"]["rescue_trk_daughter"] = "rescue_trk_daughter";
    level.scr_sound["truck"]["rescue_trk_blastdoors"] = "rescue_trk_blastdoors";
    level.scr_sound["truck"]["rescue_rno_thereitis"] = "rescue_rno_thereitis";
    level.scr_sound["generic"]["rescue_dlt1_confirmstation"] = "rescue_dlt1_confirmstation";
    level._id_11BB["US_1_threat_rpg"] = "US_1_threat_rpg";
    level.scr_sound["sandman"]["rescue_snd_getdoorsopen"] = "rescue_snd_getdoorsopen";
    level.scr_sound["sandman"]["rescue_snd_status"] = "rescue_snd_status";
    level.scr_sound["sandman"]["rescue_snd_keepmoving"] = "rescue_snd_keepmoving";
    level.scr_sound["sandman"]["rescue_snd_headsup"] = "rescue_snd_headsup";
    level.scr_sound["sandman"]["rescue_snd_sweepleft"] = "rescue_snd_sweepleft";
    level.scr_sound["sandman"]["rescue_snd_getready"] = "rescue_snd_getready";
    level.scr_sound["sandman"]["rescue_snd_hoptherail"] = "rescue_snd_hoptherail";
    level._id_11BB["rescue_snd_tookoutuav"] = "rescue_snd_tookoutuav";
    level._id_11BB["rescue_snd_anotherway"] = "rescue_snd_anotherway";
    level.scr_sound["sandman"]["rescue_snd_sittight"] = "rescue_snd_sittight";
    level.scr_sound["sandman"]["rescue_snd_cutthrough"] = "rescue_snd_cutthrough";
    level.scr_sound["sandman"]["rescue_snd_watchfire"] = "rescue_snd_watchfire";
    level.scr_sound["price"]["rescue_pri_acrosstheyard"] = "rescue_pri_acrosstheyard";
    level.scr_sound["price"]["rescue_pri_getpinneddown"] = "rescue_pri_getpinneddown";
    level.scr_sound["grinch"]["rescue_rno_wereclear"] = "rescue_rno_wereclear";
    level.scr_sound["grinch"]["rescue_rno_wereclear"] = "rescue_rno_wereclear";
    level.scr_sound["truck"]["rescue_rno_imgood"] = "rescue_rno_imgood";
    level._id_11BB["rescue_snd_keepmoving"] = "rescue_snd_keepmoving";
    level._id_11BB["rescue_snd_headsup"] = "rescue_snd_headsup";
    level._id_11BB["rescue_rno_allclear"] = "rescue_rno_allclear";
    level._id_11BB["rescue_snd_shouldbe"] = "rescue_snd_shouldbe";
    level._id_11BB["rescue_rno_secondaries"] = "rescue_rno_secondaries";
    level._id_11BB["rescue_snd_sittight"] = "rescue_snd_sittight";
    level._id_11BB["rescue_rno_hotdamn"] = "rescue_rno_hotdamn";
    level._id_11BB["rescue_rno_hind"] = "rescue_rno_hind";
    level._id_11BB["rescue_snd_thisway"] = "rescue_snd_thisway";
    level._id_11BB["rescue_snd_sittight"] = "rescue_snd_sittight";
    level._id_11BB["rescue_lp1_coverpattern"] = "rescue_lp1_coverpattern";
    level._id_11BB["rescue_lp1_ondeck"] = "rescue_lp1_ondeck";
    level._id_11BB["rescue_lp1_constructionsite"] = "rescue_lp1_constructionsite";
    level._id_11BB["rescue_lp1_gottahind"] = "rescue_lp1_gottahind";
    level._id_11BB["rescue_rno_hotdamn"] = "rescue_rno_hotdamn";
    level._id_11BB["rescue_hqr_fullagms"] = "rescue_hqr_fullagms";
    level._id_11BB["rescue_lp1_engaging"] = "rescue_lp1_engaging";
    level._id_11BB["rescue_lp1_gunshot"] = "rescue_lp1_gunshot";
    level._id_11BB["rescue_lp1_nextarea"] = "rescue_lp1_nextarea";
    level._id_11BB["rescue_lp1_nextarea"] = "rescue_lp1_nextarea";
    level._id_11BB["rescue_hqr_payloadtarget"] = "rescue_hqr_payloadtarget";
    level.scr_sound["price"]["rescue_pri_now"] = "rescue_pri_now";
    level.scr_sound["price"]["rescue_pri_heavyfire"] = "rescue_pri_heavyfire";
    level.scr_sound["price"]["rescue_pri_morelikeit"] = "rescue_pri_morelikeit";
    level._id_11BB["rescue_lp1_gunsguns"] = "rescue_lp1_gunsguns";
}
#using_animtree("script_model");

_id_3E6E()
{
    var_0 = getentarray( "fxanim_castle_generator_mod", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_1032 = "fxanim";
        var_2 useanimtree( #animtree );
        var_2 thread maps\_anim::_id_124E( var_2, "fxanim_castle_generator_mod" );
        wait(randomfloatrange( 0.1, 3 ));
    }
}

_id_3E6F( var_0 )
{
    var_1 = var_0._id_3E70;
    var_2 = var_1 gettagorigin( "tag_flash" );
    var_3 = var_1 gettagangles( "tag_flash" );
    var_4 = anglestoforward( var_3 );
    playfxontag( common_scripts\utility::getfx( "deserteagle_muzzleflash" ), var_1, "tag_flash" );
    magicbullet( "deserteagle", var_2, var_2 + var_4 );
    var_0._id_5E7D = 200;
    maps\rescue_2_cavern_code::_id_5E7B( var_0 );
}

_id_3E71( var_0 )
{
    var_1 = var_0 gettagorigin( "tag_weapon_left" );
    var_2 = spawn( "script_model", var_1 );
    var_2 setmodel( "weapon_desert_eagle_iw5" );
    var_2 hidepart( "tag_silencer" );
    var_2 linkto( var_0, "tag_weapon_left", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0._id_3E70 = var_2;
}

_id_3E72( var_0 )
{
    var_1 = level._id_45C0 gettagorigin( "TAG_INHAND" );
    var_2 = common_scripts\utility::get_target_ent( "sandman_knife_destination" );
    var_3 = spawn( "script_model", var_1 );
    var_3 setmodel( "weapon_parabolic_knife" );
    var_3.angles = vectortoangles( var_2.origin - var_1 );
    var_3 moveto( var_2.origin, 0.15 );
    var_3 waittill( "movedone" );
    var_4 = level._id_5E3D gettagorigin( "tag_eye" );
    var_3.origin = var_4;
    var_3 linkto( level._id_5E3D, "tag_eye" );
    wait 3;
    var_3 delete();
}

_id_3E73( var_0 )
{
    var_1 = var_0.weapon;

    if ( var_1 == "none" )
        return;

    var_0 animscripts\shared::_id_23C1();
    var_2 = var_0.weaponinfo[var_1]._id_2099;

    if ( var_2 != "none" )
        var_0 thread _id_3E74( var_1, var_2 );

    var_0 animscripts\shared::_id_23BE( var_1 );

    if ( var_1 == var_0.weapon )
        var_0.weapon = "none";

    var_0 animscripts\shared::_id_23C4();
}

_id_3E74( var_0, var_1 )
{
    if ( self isragdoll() )
        return "none";

    self.a._id_20A4[var_1] = var_0;
    var_2 = var_0;

    if ( issubstr( tolower( var_2 ), "rpg" ) )
        var_2 = "rpg_player";

    var_3 = self gettagorigin( "tag_weapon_right" );
    var_4 = self gettagangles( "tag_weapon_right" );
    var_5 = spawn( "script_model", var_3 );
    var_5.angles = var_4;
    var_6 = getweaponmodel( var_0 );
    var_5 setmodel( var_6 );
    var_5 physicslaunchclient( var_5.origin, ( 0.0, 0.0, 0.0 ) );
    self endon( "end_weapon_drop_" + var_1 );
    wait 0.1;

    if ( !isdefined( self ) )
        return;

    animscripts\shared::_id_23C1();
    self.a._id_20A4[var_1] = "none";
    animscripts\shared::_id_23C4();
}

_id_3E75( var_0 )
{
    if ( isdefined( var_0._id_4CE9 ) )
        var_0._id_4CE9 show();
}

_id_0148( var_0 )
{
    wait 0.05;
    var_0 animscripts\shared::_id_0C9B( var_0.weapon, "left" );
}

_id_0149()
{
    if ( !isdefined( level._id_11BB ) )
        level._id_11BB = [];

    level._id_3BE0 = 1;
    level._id_11BB["uav_reloading"] = "null";
    level._id_11BB["uav_offline"] = "null";
    level._id_11BB["uav_online"] = "rescue_snd_nicework";
    level._id_11BB["uav_online_repeat"] = "rescue_pri_wastingtime";
    level._id_11BB["uav_down"] = "null";
    level._id_11BB["uav_multi_kill"] = "rescue_hqr_fivepluskills";
    level._id_11BB["uav_multi_kill2"] = "rescue_hqr_fivepluskills";
    level._id_11BB["uav_few_kills"] = "rescue_hqr_goodhit";
    level._id_11BB["uav_3_kills"] = "rescue_hqr_nicework";
    level._id_11BB["uav_1_kill"] = "rescue_hqr_goodhit";
    level._id_11BB["uav_0_kill"] = "rescue_hqr_thatsamiss";
    level._id_11BB["uav_0_kill2"] = "Rescue_Hqr_Zerokills";
    level._id_11BB["uav_multi_vehicle_kill"] = "rescue_hqr_nicework";
    level._id_11BB["uav_multi_vehicle_kill2"] = "rescue_hqr_goodhit";
    level._id_11BB["uav_helo_kill"] = "rescue_hqr_goodhit";
    level._id_11BB["uav_btr_kill"] = "rescue_hqr_nicework";
    level._id_11BB["uav_truck_kill"] = "rescue_hqr_goodhit";
    level._id_11BB["uav_jeep_kill"] = "rescue_hqr_nicework";
    level._id_11BB["uav_direct_hit"] = "null";
}
