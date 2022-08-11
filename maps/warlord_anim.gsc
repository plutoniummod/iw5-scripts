// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_6B5B();
    _id_683E();
    _id_6B5C();
    _id_6B5D();
    _id_6B5E();
    thread _id_6B5F();
    maps\_props::_id_4183( "generic" );
    maps\_props::_id_417E( "generic" );
    _id_6B76( "generic" );
}
#using_animtree("generic_human");

_id_6B5B()
{
    _id_60D5::_id_60D4();
    level._id_0C59["generic"]["london_dock_soldier_walk"] = %london_dock_soldier_walk;
    level._id_0C59["price"]["sniper_open_door"] = %hunted_open_barndoor_flathand;
    level._id_0C59["generic"]["DRS_sprint"] = %sprint1_loop;
    level._id_0C59["price"]["water_crouch_idle"][0] = %africa_price_submerge_idle;
    level._id_0C59["price"]["water_emerge"] = %africa_price_emerge_slow;
    level._id_11B7["price"]["price_emerge_lines"] = %africa_price_emerge_slow_face;
    level.scr_sound["price"]["price_emerge_lines"][0] = "warlord_pri_secureweapons";
    level.scr_sound["price"]["price_emerge_lines"][1] = "warlord_pri_karamasarmy";
    level._id_0C59["soap"]["water_crouch_idle"][0] = %africa_soap_submerge_idle;
    level._id_0C59["soap"]["water_emerge"] = %africa_soap_emerge_slow;
    level._id_0C59["soap"]["africa_soap_pulldown_entrance_guy1"] = %africa_soap_pulldown_entrance_guy1;
    level._id_0C59["soap"]["africa_soap_pulldown_crouch_idle_guy1"][0] = %africa_soap_pulldown_crouch_idle_guy1;
    level._id_0C59["soap"]["river_pulldown"] = %africa_soap_pulldown_kill_guy1;
    maps\_anim::_id_1264( "soap", "show_knife", ::_id_6B69, "river_pulldown" );
    maps\_anim::_id_1264( "soap", "hide_knife", ::_id_6B6C, "river_pulldown" );
    level._id_0C59["militia"]["river_pulldown"] = %africa_soap_pulldown_kill_guy2;
    level._id_0C59["price"]["price_log_duck"] = %africa_soap_touches_tree;
    level._id_0C59["soap"]["soap_log_duck"] = %africa_price_touches_tree;
    level._id_0C59["generic"]["react_behind"] = %stand_cover_reaction_b;
    level._id_0C59["generic"]["react_behind_2"] = %payback_sstorm_reaction_guard1;
    level._id_0C59["generic"]["react_ahead"] = %payback_sstorm_guard_shoot_reaction_1;
    level._id_0C59["generic"]["react_ahead_2"] = %exposed_idle_reacta;
    level._id_0C59["generic"]["react_ahead_3"] = %exposed_idle_reactb;
    level._id_0C59["price"]["CornerStndR_alert_signal_enemy_spotted"] = %cornerstndr_alert_signal_enemy_spotted;
    level._id_0C59["generic"]["parabolic_leaning_guy_trans2smoke"][0] = %parabolic_leaning_guy_trans2smoke;
    level._id_0C59["generic"]["patrol_bored_idle_smoke"][0] = %patrol_bored_idle_smoke;
    level._id_0C59["generic"]["patrol_bored_walk"][0] = %patrol_bored_patrolwalk;
    level._id_0C59["generic"]["patrol_bored_walk"][1] = %patrol_bored_patrolwalk_twitch;
    level._id_0C59["generic"]["patrol_london_walk"][0] = %london_dock_soldier_walk;
    level._id_0C59["generic"]["patrol_warlord_walk"][0] = %patrolwalk_swagger;
    level._id_0C59["generic"]["patrol_warlord_walk"][1] = %patrolwalk_bounce;
    level._id_0C59["generic"]["patrol_warlord_walk"][2] = %patrolwalk_tired;
    level._id_0C59["generic"]["patrol_warlord_walk_1"][0] = %africa_npc_patrol_alt1_loop;
    level._id_0C59["generic"]["patrol_warlord_walk_2"][0] = %africa_npc_patrol_alt2_loop;
    level._id_0C59["militia"]["pulldown_walk"][0] = %africa_npc_patrol_alt2_loop;
    level._id_0C59["soap"]["soap_burn_in"] = %africa_roll_from_crouch_guy1_in;
    level._id_0C59["soap"]["soap_burn_idle"][0] = %africa_roll_from_crouch_guy1_idle;
    level._id_0C59["soap"]["soap_burn_out"] = %africa_roll_from_crouch_guy1_out;
    level._id_0C59["price"]["price_burn_in"] = %africa_roll_from_crouch_guy2_in;
    level._id_0C59["price"]["price_burn_idle"][0] = %africa_roll_from_crouch_guy2_idle;
    level._id_0C59["price"]["price_burn_out"] = %africa_roll_from_crouch_guy2_out;
    level._id_0C59["militia"]["burn"] = %africa_militia_torture_burn_militia;
    level._id_0C59["victim"]["burn"] = %africa_militia_torture_burn_victim;
    maps\_anim::_id_1264( "victim", "burn", ::_id_6B67, "burn" );
    level._id_0C59["victim"]["burn_escape"] = %africa_militia_torture_victim_escape;
    level._id_0C59["generic"]["civilian_run_hunched_C"] = %civilian_run_hunched_c;
    level._id_0C59["generic"]["africa_technical_passenger_back_idle_stopped"][0] = %africa_technical_passenger_back_idle_stopped;
    level._id_0C59["generic"]["africa_technical_passenger_backside_idle_stopped"][0] = %africa_technical_passenger_backside_idle_stopped;
    level._id_0C59["generic"]["africa_technical_passenger_lside_idle_stopped"][0] = %africa_technical_passenger_lside_idle_stopped;
    level._id_0C59["generic"]["africa_technical_passenger_rside_idle_stopped"][0] = %africa_technical_passenger_rside_idle_stopped;
    level._id_0C59["militia_1"]["river_execution"] = %africa_execution_soldier_1;
    level._id_0C59["militia_2"]["river_execution"] = %africa_execution_soldier_2;
    level._id_0C59["civ_1"]["river_execution"] = %africa_execution_prisoner_1;
    level._id_0C59["civ_2"]["river_execution"] = %africa_execution_prisoner_2;
    level._id_0C59["civ_3"]["river_execution"] = %africa_execution_prisoner_3;
    level._id_0C59["civ_1"]["execution_loop_1"][0] = %africa_execution_prisoner_1_loop;
    level._id_0C59["civ_2"]["execution_loop_2"][0] = %africa_execution_prisoner_2_loop;
    level._id_0C59["civ_3"]["execution_loop_3"][0] = %africa_execution_prisoner_3_loop;
    level._id_0C59["generic"]["civ_crouch_death"] = %covercrouch_death_1;
    level._id_0C59["generic"]["civ_crouch_death2"] = %exposed_crouch_death_fetal;
    level._id_0C59["price"]["prone_dive"] = %hunted_dive_2_pronehide_v2;
    level._id_0C59["soap"]["prone_dive"] = %hunted_dive_2_pronehide_v2;
    level._id_0C59["generic"]["prone_search_1"] = %africa_look_into_brush_guy1;
    level._id_0C59["generic"]["prone_search_2"] = %africa_look_into_brush_guy2;
    level._id_0C59["generic"]["africa_pullbody_offbridge_guy1_deathIdle"] = %africa_pullbody_offbridge_guy1_deathidle;
    level._id_0C59["generic"]["africa_pullbody_offbridge_guy2_deathIdle"] = %africa_pullbody_offbridge_guy2_deathidle;
    level._id_0C59["militia"]["burn_dragger_drag"] = %africa_burning_men_burner_drag;
    level._id_0C59["militia"]["burn_dragger_idle"][0] = %africa_burning_men_burner_idle;
    level._id_0C59["militia"]["burn_watcher_watch"] = %africa_burning_men_watcher_watch;
    level._id_0C59["militia"]["burn_watcher_idle"][0] = %africa_burning_men_watcher_idle;
    level._id_0C59["civ_1"]["burn_dragger_drag"] = %africa_burnbody_carried1;
    level._id_0C59["civ_2"]["burn_dragger_drag"] = %africa_burnbody_carried2;
    level._id_0C59["generic"]["africa_burnbody_1"][0] = %africa_burnbody_1;
    level._id_0C59["generic"]["africa_burnbody_2"][0] = %africa_burnbody_2;
    level._id_0C59["generic"]["africa_burnbody_3"][0] = %africa_burnbody_3;
    level._id_0C59["generic"]["africa_burnbody_4"][0] = %africa_burnbody_4;
    level._id_0C59["generic"]["africa_burnbody_5"][0] = %africa_burnbody_5;
    level._id_0C59["generic"]["dead_body_floating_1"] = %dead_body_floating_1;
    level._id_0C59["generic"]["favela_escape_crucified_idle"] = %favela_escape_crucified_idle;
    level._id_0C59["soap"]["cqb_crouch_exit_8"] = %cqb_crouch_start_8;
    level._id_0C59["soap"]["soap_wall_cover_enter"] = %africa_stack_on_wall_in;
    level._id_0C59["soap"]["soap_wall_cover_idle"][0] = %africa_stack_on_wall_idle;
    level._id_0C59["soap"]["soap_wall_cover_exit"] = %africa_stack_on_wall_out;
    level._id_0C59["generic"]["coup_guard1_jeer"][0] = %coup_guard1_jeer;
    level._id_0C59["generic"]["civ_captured"][0] = %prague_resistance_walk_01;
    level._id_0C59["generic"]["casual_killer_walk_f"][0] = %casual_killer_walk_f;
    level._id_0C59["generic"]["jeer_loop_1"][0] = %coup_guard1_jeer;
    level._id_0C59["generic"]["jeer_loop_1"][1] = %patrol_bored_idle_smoke;
    level._id_0C59["generic"]["jeer_loop_2"][0] = %patrol_bored_twitch_checkphone;
    level._id_0C59["generic"]["jeer_loop_3"][0] = %patrol_bored_idle_smoke;
    level._id_0C59["generic"]["bridge_death_1"] = %africa_pullbody_offbridge_death_guy1;
    level._id_0C59["generic"]["bridge_pulloff_1"] = %africa_pullbody_offbridge_guy1;
    level._id_0C59["generic"]["float_idle_1"] = %africa_pullbody_offbridge_guy1_deathidle;
    level._id_0C59["generic"]["bridge_death_2"] = %africa_pullbody_offbridge_death_guy2;
    level._id_0C59["generic"]["bridge_pulloff_2"] = %africa_pullbody_offbridge_guy2;
    level._id_0C59["generic"]["float_idle_2"] = %africa_pullbody_offbridge_guy2_deathidle;
    level._id_0C59["price"]["bridge_pulloff_1"] = %africa_pullbody_offbridge_price;
    level._id_0C59["soap"]["bridge_pulloff_2"] = %africa_pullbody_offbridge_soap;
    maps\_anim::_id_1264( "generic", "splash", ::_id_6B79, "bridge_pulloff_1" );
    maps\_anim::_id_1264( "generic", "splash", ::_id_6B7A, "bridge_pulloff_2" );
    level._id_0C59["price"]["price_corner_kill"] = %africa_price_paired_corner_kill_hero;
    level._id_0C59["generic"]["price_corner_kill"] = %africa_price_paired_corner_kill_enemy;
    maps\_anim::_id_1264( "price", "showKnife", ::_id_6B68, "price_corner_kill" );
    maps\_anim::_id_1264( "price", "hideKnife", ::_id_6B6C, "price_corner_kill" );
    maps\_anim::_id_1264( "price", "stab", ::_id_6B6D, "price_corner_kill" );
    maps\_anim::_id_1264( "generic", "kill", ::_id_539A, "price_corner_kill" );
    level._id_0C59["generic"]["sleep_idle"][0] = %parabolic_guard_sleeper_idle;
    level._id_0C59["generic"]["sleep_react"] = %parabolic_guard_sleeper_react;
    level._id_0C59["generic"]["throat_stab"] = %africa_tower_throat_stab_npc;
    maps\_anim::_id_1264( "generic", "knife_in", ::_id_6B6F, "throat_stab" );
    level._id_0C59["soap"]["soap_door_kill"] = %africa_soap_paired_door_stab_push_hero;
    level._id_0C59["generic"]["soap_door_kill"] = %africa_soap_paired_door_stab_push_enemy;
    level._id_0C59["price"]["price_corner_kill_2"] = %cornersdr_melee_wind_defender;
    level._id_0C59["generic"]["price_corner_kill_2"] = %cornersdr_melee_wind_attacker;
    level._id_0C59["price"]["factory_breach"] = %breach_kick_kickerr1_enter;
    level._id_0C59["soap"]["factory_breach"] = %breach_kick_stackl1_enter;
    maps\_anim::_id_1264( "price", "kick", ::_id_67AC, "factory_breach" );
    level._id_0C59["soap"]["dive_over_cover"] = %africa_soap_dive_over_cover;
    level._id_0C59["soap"]["CornerCrL_alert_idle"][0] = %cornercrl_alert_idle;
    level._id_0C59["generic"]["technical_gunner_death"] = %warlord_pickup_gunner_death;
    level._id_0C59["generic"]["get_on_technical"] = %warlord_pickup_gunner_push_off;
    level._id_0C59["generic"]["technical_driver_pull_out"] = %africa_soap_pull_dead_driver_driver;
    level._id_0C59["soap"]["technical_driver_pull_out"] = %africa_soap_pull_dead_driver_soap;
    level._id_0C59["soap"]["technical_driver_pull_out_idle"][0] = %africa_soap_pull_dead_driver_soap_idle;
    level._id_0C59["soap"]["technical_driver_dive_out"] = %africa_soap_dive_from_truck;
    level._id_0C59["soap"]["knock_off_technical"] = %warlord_pickup_soap_assist;
    level._id_11B7["soap"]["knock_off_technical_lines"] = %warlord_pickup_soap_assist_facial;
    level.scr_sound["soap"]["knock_off_technical_lines"][0] = "warlord_mct_holdon";
    level.scr_sound["soap"]["knock_off_technical_lines"][1] = "warlord_mct_getup";
    level.scr_sound["soap"]["knock_off_technical_lines"][2] = "warlord_mct_wholemilitia";
    level._id_0C59["price"]["run_react_flinch"] = %run_react_flinch;
    level._id_0C59["price"]["run_react_stumble"] = %run_react_stumble;
    level._id_0C59["soap"]["run_react_flinch"] = %run_react_flinch;
    level._id_0C59["soap"]["run_react_stumble"] = %run_react_stumble;
    level._id_0C59["price"]["run_react_explosion1"] = %africa_explosion_react_guy1;
    level._id_0C59["price"]["run_react_explosion2"] = %africa_explosion_react_guy2;
    level._id_0C59["soap"]["run_react_explosion1"] = %africa_explosion_react_guy1;
    level._id_0C59["soap"]["run_react_explosion2"] = %africa_explosion_react_guy2;
    level._id_0C59["soap"]["soap_melee_kill"] = %africa_soap_melee_kill;
    level._id_0C59["generic"]["soap_melee_kill"] = %africa_soap_melee_kill_victim;
    level._id_0C59["price"]["soap_door_kickin"] = %africa_soap_kickin_door;
    maps\_anim::_id_1264( "price", "door_open", ::_id_6B65, "soap_door_kickin" );
    level._id_0C59["militia"]["africa_pc_roof_jump_attacker"] = %africa_pc_roof_jump_attacker;
    maps\_anim::_id_1264( "militia", "kill_VM", ::_id_6B7F, "africa_pc_roof_jump_attacker" );
    level._id_0C59["militia"]["africa_pc_roof_jump_attacker_death"] = %africa_pc_roof_jump_attacker_death;
    level._id_0C59["militia"]["africa_machette_idle"] = %africa_machette_idle;
    level._id_0C59["generic"]["mortar_idle"][0] = %africa_militia_mortar_idle;
    level._id_0C59["generic"]["explosion_flying_react"] = %africa_body_flying_explosion;
    level._id_0C59["generic"]["death_rooftop_A"] = %death_rooftop_a;
    level._id_0C59["soap"]["approach_rip_sewer"] = %africa_soap_rip_sewer_enter;
    level._id_0C59["soap"]["rip_sewer_idle"][0] = %africa_soap_rip_sewer_idle;
    level._id_0C59["soap"]["rip_sewer_grate"] = %africa_soap_rip_sewer_guy_1;
    level._id_0C59["soap"]["shoulder_charge_door"] = %africa_soap_shoulder_charge_door;
    maps\_anim::_id_1264( "soap", "impact_door", ::_id_6B72, "shoulder_charge_door" );
    level._id_0C59["generic"]["breach_chair_hide_reaction_v1"] = %breach_chair_hide_reaction_v1;
    level._id_0C59["generic"]["breach_react_desk_v2"] = %breach_react_desk_v2;
    level._id_0C59["generic"]["exposed_idle_reactA"] = %exposed_idle_reacta;
    level._id_0C59["generic"]["breach_react_push_guy1"] = %breach_react_push_guy1;
    level._id_0C59["generic"]["breach_react_push_guy2"] = %breach_react_push_guy2;
    level._id_0C59["generic"]["breach_react_guntoss_v2_guy1"] = %breach_react_guntoss_v2_guy1;
    level._id_0C59["generic"]["breach_react_guntoss_v2_guy2"] = %breach_react_guntoss_v2_guy2;
    level._id_0C59["soap"]["doorkick"] = %door_kick_in;
    maps\_anim::_id_1264( "soap", "kick", ::_id_6B71, "doorkick" );
    level._id_0C59["generic"]["africa_hyena_hold"] = %africa_hyena_guy1;
    level._id_0C59["generic"]["africa_hyena_release"] = %africa_hyena_release_guy1;
    level._id_0C59["price"]["warlord_standoff"] = %warlord_standoff_price;
    level._id_0C59["warlord"]["warlord_standoff"] = %warlord_standoff_warlord;
    level._id_0C59["price"]["warlord_standoff_new"] = %warlord_standoff_price;
    level._id_0C59["warlord"]["warlord_standoff_new"] = %warlord_standoff_warlord;
    level._id_0C59["price"]["warlord_ending"] = %warlord_standoff_price_pt2;
    level._id_11B7["price"]["price_ending_lines"] = %warlord_standoff_price_pt2_face;
    level.scr_sound["price"]["price_ending_lines"][0] = "warlord_pri_hesgettingaway";
    level.scr_sound["price"]["price_ending_lines"][1] = "warlord_pri_damn";
    level.scr_sound["price"]["price_ending_lines"][2] = "warlord_pri_missedwindow";
    level.scr_sound["price"]["price_ending_lines"][3] = "warlord_pri_arunner";
    level.scr_sound["price"]["price_ending_lines"][4] = "warlord_pri_wellask";
    level._id_0C59["soap"]["warlord_ending"] = %warlord_standoff_soap_pt2;
    level._id_11B7["soap"]["warlord_mct_empty"] = %warlord_standoff_soap_pt2_face;
    level.scr_sound["soap"]["warlord_mct_empty"] = "warlord_mct_empty";
    level._id_0C59["warlord"]["warlord_ending"] = %warlord_standoff_warlord_pt2;
    maps\_anim::_id_1264( "warlord", "blood", ::_id_6B80, "warlord_ending" );
}
#using_animtree("player");

_id_683E()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_yuri";
    level._id_0C59["player_rig"]["water_emerge"] = %africa_player_emerge_slow;
    level._id_0C59["player_rig"]["get_on_technical"] = %warlord_pickup_player_geton;
    level._id_0C59["player_rig"]["knock_off_technical"] = %warlord_pickup_player_knockoff;
    maps\_anim::_id_1264( "player_rig", "timescale_start", ::_id_6B62, "knock_off_technical" );
    maps\_anim::_id_1264( "player_rig", "timescale_end", ::_id_6B63, "knock_off_technical" );
    maps\_anim::_id_1264( "player_rig", "rumble_small", ::_id_012A, "knock_off_technical" );
    maps\_anim::_id_1264( "player_rig", "rumble_meduim", ::_id_012B, "knock_off_technical" );
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "knock_off_technical" );
    level._id_0C59["player_rig"]["throat_stab"] = %africa_tower_throat_stab_player;
    maps\_anim::_id_1264( "player_rig", "knife_in", ::_id_6B6E, "throat_stab" );
    level._id_0C59["player_rig"]["roof_fall"] = %africa_pc_roof_jump;
    maps\_anim::_id_1264( "player_rig", "ps_warl_rooffall_land", ::_id_6B7B, "roof_fall" );
    maps\_anim::_id_1264( "player_rig", "start_slomo", ::_id_6B7C, "roof_fall" );
    maps\_anim::_id_1264( "player_rig", "spawn_machetteguy", ::_id_6B7D, "roof_fall" );
    maps\_anim::_id_1264( "player_rig", "viewmodel_on", ::_id_6B7E, "roof_fall" );
    maps\_anim::_id_1264( "player_rig", "rumble_small", ::_id_012A, "roof_fall" );
    maps\_anim::_id_1264( "player_rig", "rumble_medium", ::_id_012B, "roof_fall" );
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "roof_fall" );
    level._id_0C59["player_legs"]["roof_fall"] = %africa_pc_roof_jump_legs;
    level._id_0C59["player_rig"]["warlord_standoff_new"] = %warlord_standoff_player_start;
    maps\_anim::_id_1264( "player_rig", "kick_door", ::_id_6B70, "warlord_standoff_new" );
    maps\_anim::_id_1264( "player_rig", "hide_legs", ::_id_6B73, "warlord_standoff_new" );
    maps\_anim::_id_1264( "player_rig", "rumble_small", ::_id_012A, "warlord_standoff_new" );
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "warlord_standoff_new" );
    level._id_0C59["player_rig"]["warlord_standoff_loop"][0] = %warlord_standoff_player_loop;
    level._id_0C59["player_rig"]["warlord_standoff_end"] = %warlord_standoff_player_end;
    maps\_anim::_id_1264( "player_rig", "rumble_large", ::_id_012C, "warlord_standoff_end" );
    level._id_1245["player_legs"] = #animtree;
    level._id_1F90["player_legs"] = "viewlegs_generic";
    level._id_0C59["player_legs"]["warlord_standoff_new"] = %warlord_standoff_player_legs_start;
}
#using_animtree("vehicles");

_id_6B5C()
{
    level._id_1245["turret"] = #animtree;
    level._id_0C59["turret"]["get_on_technical"] = %warlord_pickup_m2_50cal_push_off;
    level._id_0C59["turret"]["technical_gunner_death"] = %warlord_pickup_m2_50cal_death;
    level._id_0C59["turret"]["technical_turret_hands_idle"] = %warlord_pickup_player_m2_50cal_idle;
    level._id_0C59["turret"]["technical_turret_hands_fire"] = %warlord_pickup_player_m2_50cal_fire;
    level._id_0C59["turret"]["technical_turret_hands_idle2fire"] = %warlord_pickup_player_m2_50cal_idle_to_fire;
    level._id_0C59["turret"]["technical_turret_hands_fire2idle"] = %warlord_pickup_player_m2_50cal_fire_to_idle;
    level._id_0C59["turret"]["technical_turret_gun_idle"] = %viewmodel_pickup_m2_50cal_idle;
    level._id_0C59["turret"]["technical_turret_gun_fire"] = %viewmodel_pickup_m2_50cal_fire;
    level._id_0C59["turret"]["technical_turret_gun_idle2fire"] = %viewmodel_pickup_m2_50cal_idle_to_fire;
    level._id_0C59["turret"]["technical_turret_gun_fire2idle"] = %viewmodel_pickup_m2_50cal_fire_to_idle;
    maps\_anim::_id_1264( "turret", "swap_model", ::_id_6B61, "get_on_technical" );
    level._id_1245["mi17"] = #animtree;
    level._id_0C59["mi17"]["warlord_ending"] = %warlord_standoff_mi17;
    level._id_0C59["mi17"]["mi17_idle"][0] = %warlord_standoff_mi17_idle;
    level._id_0C59["mi17"]["mi17_rotors"] = %warlord_standoff_mi17_idle_rotors;
    level._id_1245["technical"] = #animtree;
    level._id_0C59["technical"]["open_gate"][0] = %africa_technical_passenger_back_idle_tailgate;
}
#using_animtree("script_model");

_id_6B5D()
{
    level._id_1245["sniper_rifle"] = #animtree;
    level._id_1F90["sniper_rifle"] = "viewmodel_m14_ebr";
    level._id_0C59["sniper_rifle"]["water_emerge"] = %africa_weapon_emerge_slow;
    level._id_1245["chair"] = #animtree;
    level._id_1F90["chair"] = "com_folding_chair";
    level._id_0C59["chair"]["sleep_react"] = %parabolic_guard_sleeper_react_chair;
    level._id_1245["beretta"] = #animtree;
    level._id_1F90["beretta"] = "viewmodel_fn_five_seven_sp_iw5";
    level._id_0C59["beretta"]["warlord_standoff_new"] = %warlord_standoff_beretta;
    level._id_0C59["beretta"]["warlord_standoff_end"] = %warlord_standoff_beretta_end;
    level._id_1245["sewer_grate"] = #animtree;
    level._id_1F90["sewer_grate"] = "afr_pipe_gate_01";
    level._id_0C59["sewer_grate"]["rip_sewer_grate"] = %africa_soap_rip_sewer_grate;
    level._id_1245["crowbar"] = #animtree;
    level._id_1F90["crowbar"] = "paris_crowbar_01";
    level._id_0C59["crowbar"]["warlord_ending"] = %warlord_standoff_crowbar;
    level._id_1245["crate"] = #animtree;
    level._id_1F90["crate"] = "afr_chem_crate_01";
    level._id_0C59["crate"]["warlord_ending"] = %warlord_standoff_crate;
    level._id_1245["turret_model"] = #animtree;
    level._id_1F90["turret_model"] = "weapon_truck_m2_50cal_mg";
    level._id_0C59["turret_model"]["knock_off_technical"] = %warlord_pickup_m2_50cal_explode;
    level._id_1245["technical_model"] = #animtree;
    level._id_1F90["technical_model"] = "vehicle_pickup_technical_pb_destroyed";
    level._id_0C59["technical_model"]["knock_off_technical"] = %warlord_pickup_technical_explode;
    level._id_1245["pallet"] = #animtree;
    level._id_1F90["pallet"] = "vehicle_mi17_africa_palette";
    level._id_0C59["pallet"]["warlord_ending"] = %warlord_standoff_pallet;
    level._id_0C59["pallet"]["pallet_idle"][0] = %warlord_standoff_pallet_idle;
}
#using_animtree("dog");

_id_6B5E()
{
    level._id_0C59["dog"]["dog_eat"][0] = %africa_hyena_german_shepherd_eating_b;
    level._id_0C59["dog"]["dog_growl"] = %german_shepherd_attackidle_growl;
    level._id_0C59["dog"]["africa_hyena_hold"] = %africa_hyena_hyena;
    level._id_0C59["dog"]["africa_hyena_release"] = %africa_hyena_release_hyena;
    level._id_0C59["dog"]["warlord_standoff_new"] = %warlord_standoff_hyena_start;
    level._id_0C59["dog"]["warlord_standoff_loop"][0] = %warlord_standoff_hyena_loop;
    level._id_0C59["dog"]["warlord_standoff_end"] = %warlord_standoff_hyena_end;
}

_id_6B5F()
{
    wait 0.05;
    level._id_6B60 = maps\_utility::_id_1287( "sewer_grate" );
    var_0 = common_scripts\utility::getstruct( "org_rip_sewer_grate", "targetname" );
    var_0 maps\_anim::_id_11CF( level._id_6B60, "rip_sewer_grate" );
}

_id_6B61( var_0 )
{
    var_0 setmodel( "weapon_truck_m2_50cal_mg_viewmodel" );
}

_id_6B62( var_0 )
{
    maps\_utility::_id_2772( 0.3 );
    maps\_utility::_id_2774( 0.2 );
    maps\_utility::_id_2775();
}

_id_6B63( var_0 )
{
    maps\_utility::_id_0A16( 0.3 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_6B64( var_0 )
{
    var_0.allowdeath = 1;
    var_0.a._id_0D55 = 1;
    var_0._id_0EC6 = 1;
    var_0.diequietly = 1;
    var_0 thread maps\_utility::_id_0D72( 0 );
    var_0.dropweapon = 1;
    var_0 animscripts\shared::_id_23C8();
}

_id_539A( var_0 )
{
    var_0.dropweapon = 1;
    var_0 animscripts\shared::_id_23C8();
    var_0 thread maps\_utility::_id_0D72( 0 );
    wait 0.15;
    var_0.allowdeath = 1;
    var_0.a._id_0D55 = 1;
    var_0._id_0EC6 = 1;
    var_0.diequietly = 1;
    var_0 kill();
}

_id_6B65( var_0 )
{
    var_1 = getentarray( "mortar_door_kickin", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 rotateyaw( 180, 0.2, 0.1, 0.1 );
        var_3 connectpaths();
    }
}

_id_6B66( var_0, var_1, var_2, var_3 )
{
    self notify( "turret_anim_change" );
    self endon( "turret_anim_change" );
    var_4 = maps\_utility::_id_1281( var_0 );
    var_5 = maps\_utility::_id_1281( var_1 );
    var_6 = maps\_utility::_id_1281( var_2 );
    var_7 = maps\_utility::_id_1281( var_3 );
    self clearanim( self._id_4589, 0 );
    self clearanim( self._id_458A, 0 );
    self._id_4589 = var_4;
    self._id_458A = var_6;
    self setanim( var_6, 1, 0.1, 1 );
    self setflaggedanim( var_0, var_4, 1, 0.1, 1 );
    self waittillmatch( var_0, "end" );
    self clearanim( var_4, 0 );
    self clearanim( var_6, 0 );
    self._id_4589 = var_5;
    self._id_458A = var_7;
    self setanim( var_5, 1, 0.1, 1 );
    self setanim( var_7, 1, 0.1, 1 );
}

_id_6B67( var_0 )
{
    var_0 notify( "victim_on_fire" );
    common_scripts\utility::flag_set( "victim_burn_vo" );
}

_id_6B68( var_0 )
{
    _id_6B6A( var_0 );
    wait 3.0;
    common_scripts\utility::exploder( 999 );
}

_id_6B69( var_0 )
{
    _id_6B6A( var_0 );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "intro_knife_throat_fx" ), var_0, "tag_knife_fx" );
    wait 1.2;
    common_scripts\utility::exploder( 9999 );
}

_id_6B6A( var_0 )
{
    var_0._id_6B6B = 1;
    var_0 attach( "weapon_parabolic_knife", "TAG_INHAND", 1 );
}

_id_6B6C( var_0 )
{
    if ( isdefined( var_0._id_6B6B ) && var_0._id_6B6B )
    {
        var_0 detach( "weapon_parabolic_knife", "TAG_INHAND", 1 );
        var_0._id_6B6B = undefined;
    }
}

_id_6B6D( var_0 )
{
    if ( isdefined( var_0._id_6B6B ) && var_0._id_6B6B )
        playfxontag( common_scripts\utility::getfx( "knife_attack_fx" ), var_0, "tag_knife_fx" );
}

_id_6B6E( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "knife_attack_throat_fx" ), var_0, "tag_knife_fx" );
}

_id_6B6F( var_0 )
{
    _id_6B64( var_0 );
    playfxontag( common_scripts\utility::getfx( "knife_attack_throat_fx2" ), var_0, "J_Neck" );
}

_id_6B70( var_0 )
{
    var_1 = getent( "door_warlord_room", "targetname" );
    var_1 rotateyaw( -140, 0.2, 0.1, 0.1 );
    var_1 connectpaths();
}

_id_6B71( var_0 )
{
    var_1 = getent( "church_side_door_left", "targetname" );
    var_2 = getent( "church_side_door_right", "targetname" );
    var_1 rotateyaw( 180, 0.2, 0.1, 0.1 );
    var_2 rotateyaw( -180, 0.2, 0.1, 0.1 );
    var_1 connectpaths();
    var_2 connectpaths();
}

_id_6B72( var_0 )
{
    var_1 = getent( "compound_door", "targetname" );
    var_1 rotateyaw( 110, 0.2, 0.1, 0.1 );
    var_1 connectpaths();
    common_scripts\utility::exploder( 997 );
}

_id_6B73( var_0 )
{
    if ( isdefined( level._id_45FA ) )
        level._id_45FA hide();
}

_id_6B74( var_0 )
{
    var_1 = 3.5;
    level notify( "slowmo_go" );
    level endon( "slowmo_go" );
    var_2 = 0.5;
    var_3 = 0.75;
    var_4 = 0.2;
    level.player thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    level.player thread _id_6B75::_id_4BCB();
    thread _id_6B75::_id_4D23( var_2 * 2, var_3 / 2 );
    common_scripts\utility::flag_clear( "can_save" );
    maps\_utility::_id_2772( 0.4 );
    maps\_utility::_id_2774( var_2 );
    maps\_utility::_id_2775();
    level.player setmovespeedscale( var_4 );
    var_5 = gettime();
    var_6 = var_5 + var_1 * 1000;

    while ( gettime() < var_6 )
        wait 0.05;

    level notify( "slowmo_breach_ending", var_3 );
    level notify( "stop_player_heartbeat" );
    level.player thread maps\_utility::play_sound_on_entity( "slomo_whoosh" );
    maps\_utility::_id_0A16( var_3 );
    maps\_utility::_id_0A17();
    common_scripts\utility::flag_set( "can_save" );

    if ( isdefined( level._id_4BCF ) )
        level.player setmovespeedscale( level._id_4BCF );
    else
        level.player setmovespeedscale( 1 );

    setsaveddvar( "objectiveHide", 0 );
}

_id_67AC( var_0 )
{
    var_1 = getent( "factory_door", "targetname" );
    var_1 rotateyaw( 110, 0.2, 0.1, 0.1 );
    var_1 connectpaths();
    common_scripts\utility::exploder( 998 );
}

_id_6B76( var_0 )
{
    if ( maps\_props::_id_417C( var_0, "add_warlord_smoking_notetracks" ) )
        return;

    maps\_anim::_id_1264( var_0, "attach cigar", maps\_props::_id_4187 );
    maps\_anim::_id_1264( var_0, "puff", maps\_props::_id_418E );
    maps\_anim::_id_1264( var_0, "exhale", maps\_props::_id_418F );
    level._effect["cigar_glow"] = loadfx( "fire/cigar_glow_far" );
    level._effect["cigar_glow_puff"] = loadfx( "fire/cigar_glow_puff" );
    level._effect["cigar_smoke_puff"] = loadfx( "smoke/cigarsmoke_puff_far" );
    level._effect["cigar_exhale"] = loadfx( "smoke/cigarsmoke_exhale_far" );
    level._id_1F90["cigar"] = "prop_price_cigar";
}

_id_6B79( var_0 )
{
    common_scripts\utility::exploder( 63 );
}

_id_6B7A( var_0 )
{
    common_scripts\utility::exploder( 62 );
}

_id_6B7B( var_0 )
{
    var_1 = getentarray( "mortar_roof_pieces", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3.angles;
        var_5 = var_3.origin;
        playfx( common_scripts\utility::getfx( "warlord_panel4x8_dest" ), var_5, anglestoforward( var_4 ) );
        var_3 delete();
    }
}

_id_6B7C( var_0 )
{
    setslowmotion( 1.0, 0.8 );
    common_scripts\utility::flag_wait( "roof_machete_guy_dead" );
    setslowmotion( 0.8, 1 );
}

_id_6B7D( var_0 )
{
    var_1 = getent( "roof_machete_guy", "targetname" );
    var_0 = var_1 maps\_utility::_id_166F( 1 );
    var_0._id_1032 = "militia";
    var_0.health = 1;
    var_0.allowdeath = 1;
    var_0 maps\_utility::_id_128B( "africa_pc_roof_jump_attacker_death" );
    var_2 = spawn( "script_model", var_0.origin );
    var_2 setmodel( "weapon_machette" );
    var_2.origin = var_0 gettagorigin( "TAG_INHAND" );
    var_2.angles = var_0 gettagangles( "TAG_INHAND" );
    var_2 linkto( var_0, "TAG_INHAND" );
    var_2 show();
    var_0 maps\_utility::_id_24F5();
    var_3 = common_scripts\utility::getstruct( "org_fall_through_roof", "targetname" );
    var_3 maps\_anim::_id_1246( var_0, "africa_pc_roof_jump_attacker" );
}

_id_6B7E( var_0 )
{
    level.player enableweapons();
    level.player enableoffhandweapons();
    level.player allowsprint( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowmelee( 1 );
}

_id_6B7F( var_0 )
{
    if ( isdefined( var_0 ) && isalive( var_0 ) )
        level.player kill();

    var_0 maps\_anim::_id_1246( var_0, "africa_machette_idle" );
}

_id_6B80( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "warlord_chestshot_blood" ), var_0, "J_SpineUpper" );
}

_id_012A( var_0 )
{
    level.player playrumbleonentity( "viewmodel_small" );
}

_id_012B( var_0 )
{
    level.player playrumbleonentity( "viewmodel_medium" );
}

_id_012C( var_0 )
{
    level.player playrumbleonentity( "viewmodel_large" );
}
