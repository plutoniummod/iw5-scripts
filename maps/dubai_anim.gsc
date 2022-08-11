// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_73B5()
{
    _id_47D9();
    _id_5004();
    _id_6F3E();
    _id_73B9();
    _id_47DE();
    _id_4CAC();
}
#using_animtree("player");

_id_47D9()
{
    level._id_1F90["player_rig_juggernaut"] = "viewhands_player_juggernaut_ally";
    level._id_1245["player_rig_juggernaut"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_pmc";
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_legs"] = "viewlegs_juggernaut";
    level._id_1245["player_legs"] = #animtree;
    level._id_0C59["player_rig_juggernaut"]["intro"] = %dubai_intro_player;
    level._id_0C59["player_rig_juggernaut"]["remove_gear_player"] = %dubai_removing_grear_player;
    level._id_0C59["player_rig"]["remove_gear_player_2"] = %dubai_removing_grear_player_2;
    level._id_0C59["player_rig"]["elevator_jump_player"] = %dubai_jump_to_elevator_player;
    level._id_0C59["player_rig"]["elevator_jump_player_early"] = %dubai_jump_to_elevator_early_player;
    level._id_0C59["player_rig"]["restaurant_destruction"] = %dubai_restaurant_player_view;
    level._id_0C59["player_rig"]["helo_jump_1"] = %dubai_helo_jump_player_1;
    level._id_0C59["player_rig"]["helo_jump_2"] = %dubai_helo_jump_player_2;
    level._id_0C59["player_rig"]["helo_jump_3"] = %dubai_helo_jump_player_3;
    level._id_0C59["player_rig"]["helo_jump_kick_fail"] = %dubai_helo_jump_player_kick_fail;
    level._id_0C59["player_rig"]["helo_jump_stab_fail"] = %dubai_helo_jump_player_stab_fail;
    level._id_0C59["player_legs"]["helo_jump_1"] = %dubai_helo_jump_player_leg_1;
    level._id_0C59["player_legs"]["helo_jump_2"] = %dubai_helo_jump_player_leg_2;
    level._id_0C59["player_legs"]["helo_jump_3"] = %dubai_helo_jump_player_leg_3;
    level._id_0C59["player_legs"]["helo_jump_kick_fail"] = %dubai_helo_jump_player_leg_kick_fail;
    level._id_0C59["player_rig"]["helo_jump_idle"] = %dubai_helo_jump_player_idle;
    level._id_0C59["player_rig"]["helo_jump_middle"] = %dubai_helo_jump_player_middle;
    level._id_0C59["player_rig"]["helo_jump_pull"] = %dubai_helo_jump_player_pull;
    level._id_0C59["player_rig"]["helo_jump_push"] = %dubai_helo_jump_player_push;
    level._id_0C59["player_rig"]["helo_jump_left"] = %dubai_helo_jump_player_left;
    level._id_0C59["player_rig"]["helo_jump_right"] = %dubai_helo_jump_player_right;
    level._id_0C59["player_rig"]["finale_wake"] = %dubai_finale_wake_player;
    level._id_0C59["player_rig"]["finale_wake_idle"][0] = %dubai_finale_wake_idle_player;
    level._id_0C59["player_rig"]["finale_crawl01"] = %dubai_finale_crawl01_player;
    level._id_0C59["player_rig"]["finale_fail_crawl01"] = %dubai_finale_fail_crawl01_player;
    level._id_0C59["player_rig"]["finale_crawl01_idle"][0] = %dubai_finale_crawl01_idle_player;
    level._id_0C59["player_rig"]["finale_crawl02"] = %dubai_finale_crawl02_player;
    level._id_0C59["player_rig"]["finale_fail_crawl02"] = %dubai_finale_fail_crawl02_player;
    level._id_0C59["player_rig"]["finale_crawl02_idle"][0] = %dubai_finale_crawl02_idle_player;
    level._id_0C59["player_rig"]["finale_crawl03"] = %dubai_finale_crawl03_player;
    level._id_0C59["player_rig"]["finale_fail_crawl03"] = %dubai_finale_fail_crawl03_player;
    level._id_0C59["player_rig"]["finale_crawl03_idle"][0] = %dubai_finale_crawl03_idle_player;
    level._id_0C59["player_rig"]["finale_draw"] = %dubai_finale_draw_player;
    level._id_0C59["player_rig"]["finale_draw_fail"] = %dubai_finale_draw_fail_player;
    level._id_0C59["player_rig"]["finale_draw_fail_blend"][0] = %dubai_finale_draw_fail_blend_player;
    level._id_0C59["player_rig"]["finale_draw_fail_blend"][1] = %dubai_finale_draw_fail_blend_look_player;
    level._id_0C59["player_rig"]["finale_showdown"] = %dubai_finale_showdown_player;
    maps\_anim::_id_1264( "player_rig", "fx_start_nose_bleed", ::_id_73BF, "finale_wake" );
    maps\_anim::_id_1264( "player_rig", "fx_shift_focus", ::_id_73CB, "finale_wake" );
    level._id_0C59["player_rig"]["beatdown_idle_1"][0] = %dubai_final_beatdown_player_idle_1;
    level._id_0C59["player_rig"]["beatdown_idle_1_look"] = %dubai_final_beatdown_player_idle_1_look;
    level._id_0C59["player_rig"]["beatdown_idle_2_getup"] = %dubai_final_beatdown_player_idle_2_getup;
    level._id_0C59["player_rig"]["beatdown_getup_idle"][0] = %dubai_final_beatdown_player_getup_idle;
    level._id_0C59["player_rig"]["beatdown_tackle_start"] = %dubai_final_beatdown_player_tackle_start;
    level._id_0C59["player_rig"]["beatdown_tackle"] = %dubai_final_beatdown_player_tackle;
    level._id_0C59["player_rig"]["beatdown_tackle_alt"] = %dubai_final_beatdown_player_tackle_alt;
    level._id_0C59["player_rig"]["beatdown_fail_2"] = %dubai_final_beatdown_player_fail_2;
    maps\_anim::_id_1264( "player_rig", "crack0", ::_id_73C1, "beatdown_tackle" );
    level._id_0C59["player_rig"]["beatdown_choke"] = %dubai_final_beatdown_player_choke;
    level._id_0C59["player_rig"]["beatdown_slam"] = %dubai_final_beatdown_player_slam;
    maps\_anim::_id_1264( "player_rig", "crack1", ::_id_73C2, "beatdown_slam" );
    maps\_anim::_id_1264( "player_rig", "crack2", ::_id_73C3, "beatdown_slam" );
    level._id_0C59["player_rig"]["beatdown_smoking_idle"] = %dubai_final_beatdown_player_smoking_idle;
    level._id_0C59["player_rig"]["beatdown_end"] = %dubai_final_beatdown_player_end;
    level._id_0C59["player_rig"]["beatdown_fail"] = %dubai_final_beatdown_player_fail;
    level._id_0C59["player_rig"]["beatdown_additive"] = %dubai_final_beatdown_player_additive;
    level._id_0C59["player_rig"]["beatdown_fail"] = %dubai_final_beatdown_player_fail;
    level._id_0C59["player_rig"]["finale_reflection"] = %dubai_finale_reflection_player;
}
#using_animtree("generic_human");

_id_5004()
{
    level._id_1F90["player_body_jugg"] = "fullbody_juggernaut";
    level._id_1245["player_body_jugg"] = #animtree;
    level._id_0C59["player_body_jugg"]["intro"] = %dubai_intro_player_body;
    level._id_1F90["player_body"] = "body_juggernaut_nogear";
    level._id_1245["player_body"] = #animtree;
    level._id_0C59["player_body"]["restaurant_destruction"] = %dubai_restaurant_player_body;
    level._id_0C59["player_body"]["beatdown_slam"] = %dubai_final_beatdown_playerbody_slam;
    level._id_0C59["player_body"]["beatdown_smoking_idle"] = %dubai_final_beatdown_playerbody_smoking_idle;
    level._id_0C59["player_body"]["beatdown_end"] = %dubai_final_beatdown_playerbody_end;
    maps\_anim::_id_1267( "player_body", "yuri_idle", "restaurant_destruction_player_over_ledge", "restaurant_destruction" );
    maps\_anim::_id_1267( "player_body", "rolling_soldier_start", "restaurant_destruction_rolling_soldier", "restaurant_destruction" );
    maps\_anim::_id_1267( "player_body", "floor_done_tilting", "restaurant_destruction_floor_done", "restaurant_destruction" );
    level._id_0C59["generic"]["intro_guy1_death"] = %dubai_intro_guy1_death;
    level._id_0C59["generic"]["intro_guy2_death"] = %dubai_intro_guy2_death;
    level._id_0C59["generic"]["intro_guy3_death"] = %dubai_intro_guy3_death;
    level._id_0C59["generic"]["intro_guy4_death"] = %dubai_intro_guy4_death;
    level._id_0C59["generic"]["intro_guy5_death"] = %dubai_intro_guy5_death;
    level._id_0C59["generic"]["intro_guy6_death"] = %dubai_intro_guy6_death;
    maps\_anim::_id_1264( "generic", "start_ragdoll", ::_id_73BE, "intro_guy1_death" );
    maps\_anim::_id_1264( "generic", "start_ragdoll", ::_id_73BE, "intro_guy2_death" );
    maps\_anim::_id_1264( "generic", "start_ragdoll", ::_id_73BE, "intro_guy3_death" );
    maps\_anim::_id_1264( "generic", "start_ragdoll", ::_id_73BE, "intro_guy4_death" );
    maps\_anim::_id_1264( "generic", "start_ragdoll", ::_id_73BE, "intro_guy5_death" );
    maps\_anim::_id_1264( "generic", "start_ragdoll", ::_id_73BE, "intro_guy6_death" );
    level._id_0C59["generic"]["exterior_juggernaut_paired"] = %dubai_juggernaut_paired_guy2;
    maps\_anim::_id_1264( "generic", "ignoreall", ::_id_73BC, "exterior_juggernaut_paired" );
    maps\_anim::_id_1264( "generic", "dropgun", ::_id_73BE, "exterior_juggernaut_paired" );
    maps\_anim::_id_1264( "generic", "blood", ::_id_73C4, "exterior_juggernaut_paired" );
    level._id_0C59["generic"]["restaurant_rolling_soldier"] = %dubai_restaurant_rolling_soldier;
    level._id_0C59["yuri"]["intro_yuri"] = %dubai_intro_price;
    maps\_anim::_id_1267( "yuri", "dialog_intro", "vo_intro_start", "intro_yuri" );
    maps\_anim::_id_1267( "yuri", "dialog_getready", "vo_intro_get_ready", "intro_yuri" );
    maps\_anim::_id_1267( "yuri", "ram_door", "intro_truck_left", "intro_yuri" );
    level._id_0C59["yuri"]["exterior_juggernaut_paired"] = %dubai_juggernaut_paired_guy1;
    level._id_0C59["yuri"]["elevator_enter"] = %dubai_jugg_elevator_enter;
    level._id_0C59["yuri"]["elevator_enter_idle"][0] = %dubai_jugg_elevator_idle;
    level._id_0C59["yuri"]["elevator_press_button"] = %dubai_jugg_elevator_button;
    level._id_0C59["yuri"]["elevator_idle_scan"][0] = %dubai_jugg_elevator_idle_scan;
    level._id_0C59["yuri"]["chopper_react"] = %dubai_helo_react_price;
    level._id_0C59["yuri"]["remove_gear"] = %dubai_removing_grear_price;
    level._id_0C59["yuri"]["remove_gear_2"] = %dubai_removing_grear_price_2;
    level._id_11B7["yuri"]["dubai_pri_shredded"] = %dubai_removing_grear_price_face;
    level._id_0C59["yuri"]["elevator_jump"] = %dubai_jump_to_elevator_guy1;
    level._id_0C59["yuri"]["elevator_jump_idle"] = %dubai_jump_to_elevator_guy1_idle;
    level._id_0C59["yuri"]["elevator_idle_post_jump"][0] = %dubai_npc_elevator_idle;
    level._id_0C59["yuri"]["elevator_grenade_throw"] = %dubai_npc_elevator_exit;
    level._id_0C59["yuri"]["restaurant_wounded"] = %dubai_restaurant_yuri_start;
    level._id_11B7["yuri"]["dubai_yur_dontlethim"] = %dubai_restaurant_yuri_start_facial;
    level._id_0C59["yuri"]["restaurant_idle"][0] = %dubai_restaurant_yuri_idle;
    level._id_0C59["yuri"]["finale_showdown"] = %dubai_finale_showdown_yuri;
    maps\_anim::_id_1264( "yuri", "dropgun", ::_id_73BD, "finale_showdown" );
    level._id_1F90["makarov"] = "body_villain_makarov_prague";
    level._id_1245["makarov"] = #animtree;
    level._id_0C59["makarov"]["helo_jump_1"] = %dubai_helo_jump_makarov;
    level._id_0C59["makarov"]["helo_jump_idle"][0] = %dubai_helo_jump_makarov_idle;
    level._id_0C59["makarov"]["helo_jump_idle_nl"] = %dubai_helo_jump_makarov_idle;
    level._id_0C59["makarov"]["helo_jump_kick_fail"] = %dubai_helo_jump_makarov_kick_fail;
    level._id_0C59["makarov"]["finale_wake"] = %dubai_finale_wake_makarov;
    level._id_0C59["makarov"]["finale_wake_idle"][0] = %dubai_finale_wake_idle_makarov;
    level._id_0C59["makarov"]["finale_showdown"] = %dubai_finale_showdown_makarov;
    level._id_0C59["makarov"]["finale_draw"] = %dubai_finale_draw_makarov;
    level._id_0C59["makarov"]["finale_draw_fail"] = %dubai_finale_draw_fail_makarov03;
    level._id_0C59["makarov"]["finale_draw_fail_blend"][0] = %dubai_finale_draw_fail_blend_makarov03;
    level._id_0C59["makarov"]["finale_draw_fail_blend"][1] = %dubai_finale_draw_fail_blend_makarov_down;
    level._id_0C59["makarov"]["finale_draw_fail_blend"][2] = %dubai_finale_draw_fail_blend_makarov_up;
    level._id_0C59["makarov"]["finale_draw_fail_blend"][3] = %dubai_finale_draw_fail_blend_makarov_left;
    level._id_0C59["makarov"]["finale_draw_fail_blend"][4] = %dubai_finale_draw_fail_blend_makarov_right;
    level._id_0C59["makarov"]["beatdown_idle_0"][0] = %dubai_final_beatdown_makarov_idle_2;
    level._id_0C59["makarov"]["beatdown_idle_1"] = %dubai_final_beatdown_makarov_idle_1;
    level._id_0C59["makarov"]["beatdown_tackle"] = %dubai_final_beatdown_makarov_tackle;
    level._id_0C59["makarov"]["beatdown_choke"] = %dubai_final_beatdown_makarov_choke;
    level._id_0C59["makarov"]["beatdown_slam"] = %dubai_final_beatdown_makarov_slam;
    level._id_0C59["makarov"]["beatdown_fail_2"] = %dubai_final_beatdown_makarov_fail_2;
    level._id_0C59["makarov"]["beatdown_hanging_idle"][0] = %dubai_final_beatdown_makarov_hanging_idle;
    maps\_anim::_id_1264( "makarov", "punch_r", ::_id_73C5, "beatdown_tackle" );
    maps\_anim::_id_1264( "makarov", "punch_r2", ::_id_73C6, "beatdown_tackle" );
    maps\_anim::_id_1264( "makarov", "punch_l", ::_id_73C7, "beatdown_tackle" );
    maps\_anim::_id_1264( "makarov", "pistol_fire", ::_id_73CC, "finale_draw_fail" );
    maps\_anim::_id_1264( "makarov", "pistol_fire", ::_id_73CC, "finale_draw_fail_blend" );
    maps\_anim::_id_1264( "makarov", "pistol_fire", ::_id_73CC, "beatdown_fail_2" );
    maps\_anim::_id_1264( "makarov", "fire", ::_id_73CC, "beatdown_idle_1" );
    level._id_0C59["pilot"]["helo_jump_1"] = %dubai_helo_jump_pilot_1;
    level._id_0C59["pilot"]["helo_jump_2"] = %dubai_helo_jump_pilot_2;
    level._id_0C59["pilot"]["helo_jump_kick_fail"] = %dubai_helo_jump_pilot_kick_fail;
    maps\_anim::_id_1264( "pilot", "blood", ::_id_73BB, "helo_jump_2" );
    level._id_0C59["copilot"]["helo_jump_1"] = %dubai_helo_jump_copilot_1;
    level._id_0C59["copilot"]["helo_jump_2"] = %dubai_helo_jump_copilot_2;
    level._id_0C59["copilot"]["helo_jump_3"] = %dubai_helo_jump_copilot_3;
    level._id_0C59["copilot"]["helo_jump_kick_fail"] = %dubai_helo_jump_copilot_kick_fail;
    level._id_0C59["copilot"]["helo_jump_stab_fail"] = %dubai_helo_jump_copilot_stab_fail;
    maps\_anim::_id_1264( "copilot", "gunshot", ::_id_73BA, "helo_jump_3" );
    maps\_anim::_id_1264( "copilot", "fire", ::_id_73CE, "helo_jump_stab_fail" );
    level._id_1F90["stranger"] = "body_fso_suit_a";
    level._id_73B6["stranger"] = "head_fso_d";
    level._id_1245["stranger"] = #animtree;
    level._id_0C59["stranger"]["beatdown_end"] = %dubai_final_beatdown_guy_end;
    level._id_1F90["price"] = "body_juggernaut_nogear";
    level._id_73B6["price"] = "head_price_africa";
    level._id_1245["price"] = #animtree;
    level._id_0C59["price"]["finale_reflection"] = %dubai_finale_reflection_guy1;
    level._id_0C59["price"]["finale_reflection_test"] = %dubai_finale_wake_reflection;
    level._id_0C59["makarov"]["pip_scene_atrium"] = %prague_soap_walk_under_grate;
    level._id_0C59["makarov"]["pip_scene_lounge"] = %patrol_jog_look_up_once;
    level._id_0C59["makarov"]["pip_scene_restaurant"] = %patrol_jog_orders_once;
}

_id_6F3E()
{
    level._id_0C59["generic"]["civilain_crouch_hide_idle_loop"][0] = %civilain_crouch_hide_idle_loop;
    level._id_0C59["generic"]["DC_Burning_artillery_reaction_v1_idle"][0] = %dc_burning_artillery_reaction_v1_idle;
    level._id_0C59["generic"]["DC_Burning_artillery_reaction_v2_idle"][0] = %dc_burning_artillery_reaction_v2_idle;
    level._id_0C59["generic"]["prague_resistance_hit_idle"][0] = %prague_resistance_hit_idle;
    level._id_0C59["generic"]["civilian_crawl_1_death_A"] = %civilian_crawl_1_death_a;
    level._id_73B7 = [];
    level._id_73B7[level._id_73B7.size] = %exposed_death;
    level._id_73B7[level._id_73B7.size] = %exposed_death_02;
    level._id_73B8 = [];
    level._id_73B8[level._id_73B8.size] = %run_death_roll;
    level._id_73B8[level._id_73B8.size] = %run_death_skid;
    level._id_73B8[level._id_73B8.size] = %run_death_flop;
    level._id_0C59["generic"]["corner_standR_deathA"] = %corner_standr_deatha;
    level._id_0C59["generic"]["corner_standR_deathB"] = %corner_standr_deathb;
    level._id_0C59["generic"]["coverstand_death_left"] = %coverstand_death_left;
    level._id_0C59["generic"]["coverstand_death_right"] = %coverstand_death_right;
    level._id_0C59["generic"]["covercrouch_death_1"] = %covercrouch_death_1;
    level._id_0C59["generic"]["prone_death_quickdeath"] = %prone_death_quickdeath;
    level._id_0C59["generic"]["death_shotgun_back_v1"] = %death_shotgun_back_v1;
}

_id_73B9()
{
    level._id_0C59["generic"]["civilian_run_hunched_A_relative"] = %civilian_run_hunched_a_relative;
    level._id_0C59["generic"]["civilian_run_hunched_C_relative"] = %civilian_run_hunched_c_relative;
    level._id_0C59["generic"]["civilian_run_upright_relative"] = %civilian_run_upright_relative;
    level._id_0C59["generic"]["unarmed_scared_run"] = %unarmed_scared_run;
}
#using_animtree("vehicles");

_id_47DE()
{
    level._id_1F90["intro_truck"] = "vehicle_dubai_intro_truck";
    level._id_1245["intro_truck"] = #animtree;
    level._id_0C59["intro_truck"]["intro"] = %dubai_intro_truck;
    level._id_1F90["md500"] = "vehicle_md_500_little_bird";
    level._id_1245["md500"] = #animtree;
    level._id_0C59["md500"]["restaurant_destruction"] = %dubai_restaurant_md_500_little_bird;
    level._id_0C59["md500"]["helo_jump_1"] = %dubai_helo_jump_helo_1;
    level._id_0C59["md500"]["helo_jump_2"] = %dubai_helo_jump_helo_2;
    level._id_0C59["md500"]["helo_jump_3"] = %dubai_helo_jump_helo_3;
    level._id_0C59["md500"]["helo_jump_idle"] = %dubai_helo_jump_helo_idle;
    level._id_0C59["md500"]["helo_jump_kick_fail"] = %dubai_helo_jump_helo_kick_fail;
    level._id_0C59["md500"]["helo_jump_stab_fail"] = %dubai_helo_jump_helo_stab_fail;
    level._id_0C59["md500"]["helo_jump_middle"] = %dubai_helo_jump_helo_handle_middle;
    level._id_0C59["md500"]["helo_jump_pull"] = %dubai_helo_jump_helo_handle_pull;
    level._id_0C59["md500"]["helo_jump_push"] = %dubai_helo_jump_helo_handle_push;
    level._id_0C59["md500"]["helo_jump_left"] = %dubai_helo_jump_helo_handle_left;
    level._id_0C59["md500"]["helo_jump_right"] = %dubai_helo_jump_helo_handle_right;
}
#using_animtree("script_model");

_id_4CAC()
{
    level._id_1245["intro_player_gun"] = #animtree;
    level._id_0C59["intro_player_gun"]["intro"] = %dubai_intro_player_rifle;
    level._id_1245["intro_yuri_helmet"] = #animtree;
    level._id_0C59["intro_yuri_helmet"]["intro_yuri"] = %dubai_intro_price_helmet;
    level._id_1245["elevator_gear"] = #animtree;
    level._id_0C59["elevator_gear"]["remove_gear"] = %dubai_removing_grear_grear;
    level._id_0C59["elevator_gear"]["remove_gear_2"] = %dubai_removing_grear_grear_2;
    level._id_1245["restaurant_floor"] = #animtree;
    level._id_1F90["restaurant_floor"] = "dub_restaurant_floor_rigged";
    level._id_0C59["restaurant_floor"]["restaurant_destruction_floor"] = %dubai_restaurant_floor;
    level._id_1245["restaurant_column"] = #animtree;
    level._id_0C59["restaurant_column"]["restaurant_column_shatter_1"] = %dubai_restaurant_column_shatter_1;
    level._id_0C59["restaurant_column"]["restaurant_column_shatter_2"] = %dubai_restaurant_column_shatter_2;
    level._id_1245["dub_restaurant_roundtable_set_sim"] = #animtree;
    level._id_0C59["dub_restaurant_roundtable_set_sim"]["dubai_restaurant_round_table_sim"] = %dubai_restaurant_round_table_sim;
    level._id_1245["dub_restaurant_squaretable_set_sim"] = #animtree;
    level._id_0C59["dub_restaurant_squaretable_set_sim"]["dubai_restaurant_square_table_sim"] = %dubai_restaurant_square_table_sim;
    level._id_1F90["fx_char_light_rig"] = "fx_char_light_rig";
    level._id_1245["fx_char_light_rig"] = #animtree;
    level._id_0C59["fx_char_light_rig"]["restaurant_wounded"] = %dubai_restaurant_yuri_lightrig_start;
    level._id_0C59["fx_char_light_rig"]["restaurant_idle"][0] = %dubai_restaurant_yuri_lightrig_idle;
    level._id_0C59["fx_char_light_rig"]["beatdown_idle_1"] = %dubai_final_beatdown_lighting_idle_1;
    level._id_0C59["fx_char_light_rig"]["beatdown_slam"] = %dubai_final_beatdown_lighting_slam;
    level._id_0C59["fx_char_light_rig"]["beatdown_tackle"] = %dubai_final_beatdown_lighting_tackle;
    level._id_0C59["fx_char_light_rig"]["beatdown_choke"] = %dubai_final_beatdown_lighting_choke;
    level._id_0C59["floor_glass"]["beatdown_slam"] = %dubai_final_beatdown_balcony_slam;
    level._id_1245["floor_glass"] = #animtree;
    level._id_1245["knife"] = #animtree;
    level._id_1F90["knife"] = "weapon_spyderco_folding_knife";
    level._id_0C59["knife"]["helo_jump_2"] = %dubai_helo_jump_knife;
    level._id_1245["deagle"] = #animtree;
    level._id_1F90["deagle"] = "viewmodel_desert_eagle_sp_iw5";
    level._id_0C59["deagle"]["finale_draw"] = %dubai_finale_draw_deagle;
    level._id_0C59["deagle"]["finale_draw02"] = %dubai_finale_draw_deagle02;
    level._id_0C59["deagle"]["finale_draw_fail"] = %dubai_finale_draw_fail_deagle03;
    level._id_0C59["deagle"]["finale_showdown"] = %dubai_finale_showdown_deagle;
    level._id_0C59["deagle"]["beatdown_fail"] = %dubai_final_beatdown_weapon_fail;
    level._id_0C59["deagle"]["beatdown_idle_1"] = %dubai_final_beatdown_weapon_idle_1;
    level._id_0C59["deagle"]["beatdown_tackle"] = %dubai_final_beatdown_weapon_tackle;
    level._id_0C59["deagle"]["beatdown_fail_2"] = %dubai_final_beatdown_weapon_fail_2;
    level._id_1245["ropea"] = #animtree;
    level._id_1F90["ropea"] = "weapon_finale_cable_a";
    level._id_0C59["ropea"]["beatdown_choke"] = %dubai_final_beatdown_ropea_choke;
    level._id_0C59["ropea"]["beatdown_hanging_idle"][0] = %dubai_final_beatdown_ropea_hanging_idle;
    level._id_0C59["ropea"]["beatdown_idle_1"][0] = %dubai_final_beatdown_ropea_idle_1;
    level._id_0C59["ropea"]["beatdown_idle_3"][0] = %dubai_final_beatdown_ropea_idle_3;
    level._id_0C59["ropea"]["beatdown_slam"] = %dubai_final_beatdown_ropea_slam;
    level._id_1245["ropeb"] = #animtree;
    level._id_1F90["ropeb"] = "weapon_finale_cable_b";
    level._id_0C59["ropeb"]["beatdown_choke"] = %dubai_final_beatdown_ropeb_choke;
    level._id_0C59["ropeb"]["beatdown_hanging_idle"][0] = %dubai_final_beatdown_ropeb_hanging_idle;
    level._id_0C59["ropeb"]["beatdown_idle_3"][0] = %dubai_final_beatdown_ropeb_idle_3;
    level._id_0C59["ropeb"]["beatdown_slam"] = %dubai_final_beatdown_ropeb_slam;
    level._id_1245["skylight"] = #animtree;
    level._id_1F90["skylight"] = "dub_finale_skylight_shards";
    level._id_0C59["skylight"]["skylight_shatter"] = %dubai_final_skylight_sim;
    level._id_1245["cigar"] = #animtree;
    level._id_1F90["cigar"] = "dub_cigar_";
    level._id_0C59["cigar"]["beatdown_slam"] = %dubai_final_beatdown_cigar_slam;
    level._id_0C59["cigar"]["beatdown_smoking_idle"] = %dubai_final_beatdown_cigar_smoking_idle;
    level._id_0C59["cigar"]["beatdown_end"] = %dubai_final_beatdown_cigar_end;
    maps\_anim::_id_1264( "cigar", "cigar_smoke", ::_id_73CA, "beatdown_slam" );
    level._id_1245["zippo"] = #animtree;
    level._id_1F90["zippo"] = "weapon_lighter";
    level._id_0C59["zippo"]["beatdown_slam"] = %dubai_final_beatdown_zippo_slam;
    maps\_anim::_id_1264( "zippo", "zipp_spark", ::_id_73C8, "beatdown_slam" );
    maps\_anim::_id_1264( "zippo", "zipp_fire", ::_id_73C9, "beatdown_slam" );
}

_id_73BA( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "copilot_muzzleflash" ), var_0, "TAG_FLASH" );
    wait 1.3;
    playfxontag( common_scripts\utility::getfx( "knife_attack_throat" ), var_0, "J_Neck" );
}

_id_73BB( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "punch_pilot" ), var_0, "J_Lip_Bot_LE" );
}

_id_73BC( var_0 )
{
    var_0.allowdeath = 0;
    common_scripts\utility::flag_set( "exterior_juggernaut_paired_complete" );
}

_id_73BD( var_0 )
{
    wait 1;
    _id_73BE( var_0 );
}

_id_73BE( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0.allowdeath = 1;
    var_0.a._id_0D55 = 1;
    var_0 maps\_utility::_id_0D72( 0 );
    wait 0.05;
    var_0 kill();
}

_id_73BF( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_camera", ( 0.0, 0.0, 0.0 ), ( 0.0, 180.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "blood_drip_price_nose" ), var_1, "tag_origin" );
}

_id_73C0( var_0 )
{

}

_id_73C1( var_0 )
{
    wait 0.05;
    var_1 = level.player setcontents( 0 );
    magicbullet( "nosound_magicbullet", ( 621.0, -116.0, 8110.0 ), ( 621.0, -116.0, 7900.0 ), level.player );
    level.player setcontents( var_1 );
    common_scripts\utility::exploder( 22000 );
    common_scripts\utility::exploder( 22001 );
    wait 3.0;
    wait 6.5;
    common_scripts\utility::exploder( 22002 );
}

_id_73C2( var_0 )
{
    var_1 = level.player setcontents( 0 );
    magicbullet( "nosound_magicbullet", ( 619.933, -116.0, 8110.0 ), ( 619.933, -116.0, 7900.0 ), level.player );
    level.player setcontents( var_1 );
    common_scripts\utility::exploder( 22001 );
}

_id_73C3( var_0 )
{
    var_1 = level.player setcontents( 0 );
    magicbullet( "nosound_magicbullet", ( 620.5, -104.5, 8110.0 ), ( 620.5, -104.5, 7900.0 ), level.player );
    level.player setcontents( var_1 );
    common_scripts\utility::exploder( 22001 );
}

_id_73C4( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "generic_chestshot_blood" ), var_0, "J_SpineUpper" );
}

_id_73C5( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "makarov_punch_r" ), var_0, "J_Jaw" );
    common_scripts\utility::exploder( 903 );
    common_scripts\utility::exploder( 22001 );
}

_id_73C6( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "makarov_punch_r2" ), var_0, "J_Jaw" );
    common_scripts\utility::exploder( 904 );
    common_scripts\utility::exploder( 22001 );
}

_id_73C7( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "makarov_punch_l" ), var_0, "J_Jaw" );
    common_scripts\utility::exploder( 902 );
    common_scripts\utility::exploder( 22001 );
}

_id_73C8( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "zippo_sparks" ), var_0, "TAG_FX" );
}

_id_73C9( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "zippo_fire" ), var_0, "TAG_FX" );
    wait 6.3;
    stopfxontag( common_scripts\utility::getfx( "zippo_fire" ), var_0, "TAG_FX" );
}

_id_73CA( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "cigar_lite" ), var_0, "cigarTip" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "cigar_puff" ), var_0, "TAG_ORIGIN" );
    wait 1.2;
    playfxontag( common_scripts\utility::getfx( "cigar_puff" ), var_0, "TAG_ORIGIN" );
    wait 2.5;
    playfxontag( common_scripts\utility::getfx( "cigar_lite_smoke" ), var_0, "cigarTip" );
    wait 14.0;
    common_scripts\utility::exploder( 910 );
    wait 20.0;

    if ( !common_scripts\utility::flag_exist( "off_flag" ) )
        common_scripts\utility::flag_init( "off_flag" );

    common_scripts\utility::flag_set( "off_flag" );
    wait 0.1;
    maps\_shg_fx::_id_4467( 5000 );
    wait 0.1;
    maps\_shg_fx::_id_4467( 5002 );
    wait 0.1;
    maps\_shg_fx::_id_4467( 5003 );
    wait 0.1;
    common_scripts\utility::exploder( 5004 );
    common_scripts\utility::flag_wait( "end_of_credits" );
    wait 30.7;
    playfxontag( common_scripts\utility::getfx( "cigar_drop" ), var_0, "cigarTip" );
}

_id_73CB( var_0 )
{
    var_1 = level._id_1436;
    var_2 = [];
    var_2["nearStart"] = 50;
    var_2["nearEnd"] = 200;
    var_2["nearBlur"] = 4;
    var_2["farStart"] = 500;
    var_2["farEnd"] = 900;
    var_2["farBlur"] = 3;
    maps\_utility::_id_27C0( var_1, var_2, 1.0 );
    wait 4.5;
    maps\_utility::_id_27C0( var_2, var_1, 4 );
}

_id_73CC( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "makarov_muzzle_flash_simple" ), level._id_73CD, "TAG_FLASH" );
}

_id_73CE( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "makarov_muzzle_flash_simple_nodepth" ), var_0, "TAG_FLASH" );
}
