// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4444();
    _id_6F3D();
    _id_539C();
    _id_6F3E();
    _id_6F3F();
    _id_4443();
    _id_6F3C();
    _id_0B5A();
    destructibles();
    _id_6F3B();
    level._id_5313 = [ "bunker_toss_idle_guy1", "prague_woundwalk_wounded", "prague_civ_door_peek", "prague_civ_door_runin", "prague_resistance_hit_idle", "DC_Burning_bunker_stumble", "dc_burning_bunker_stumble", "civilian_crawl_1", "civilian_crawl_2", "dying_crawl", "DC_Burning_artillery_reaction_v1_idle", "DC_Burning_artillery_reaction_v2_idle", "DC_Burning_artillery_reaction_v3_idle", "DC_Burning_artillery_reaction_v4_idle", "DC_Burning_bunker_sit_idle", "civilain_crouch_hide_idle", "civilain_crouch_hide_idle_loop", "DC_Burning_stop_bleeding_wounded_endidle", "DC_Burning_stop_bleeding_medic_endidle", "DC_Burning_stop_bleeding_wounded_idle", "prague_woundwalk_wounded_idle", "prague_bully_civ_survive_idle", "training_basketball_rest", "prague_mourner_man_idle", "training_locals_kneel", "doorpeek_deathA", "pistol_death_3", "drone_stand_death", "death_run_onfront", "ny_manhattan_wounded_drag_wounded" ];
}
#using_animtree("player");

_id_4444()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_yuri";
    level._id_1245["player_legs"] = #animtree;
    level._id_1F90["player_legs"] = "viewlegs_generic";
    level._id_0C59["player_rig"]["intro_opening_shot01"] = %intro_opening_shot01_player;
    level._id_0C59["player_rig"]["intro_opening_shot02"] = %intro_opening_shot02_player;
    level._id_0C59["player_rig"]["intro_opening_shot03"] = %intro_opening_shot03_player;
    level._id_0C59["player_rig"]["intro_opening_shot04"] = %intro_opening_shot04_player;
    level._id_0C59["player_rig"]["intro_opening_shot05"] = %intro_opening_shot05_player;
    level._id_0C59["player_rig"]["intro_opening_shot06"] = %intro_opening_shot06_player;
    level._id_0C59["player_rig"]["intro_opening_shot07"] = %intro_opening_shot07_player;
    level._id_0C59["player_rig"]["intro_opening_shot08"] = %intro_opening_shot08_player;
    maps\_anim::_id_1264( "player_rig", "fade_black", maps\intro_code::_id_6F36, "intro_opening_shot01" );
    maps\_anim::_id_1264( "player_rig", "slowmo_start", ::_id_6F4C, "intro_opening_shot01" );
    maps\_anim::_id_1264( "player_rig", "slowmo_end", ::_id_6F4D, "intro_opening_shot01" );
    maps\_anim::_id_1264( "player_rig", "fade_black", maps\intro_code::_id_6F36, "intro_opening_shot02" );
    maps\_anim::_id_1264( "player_rig", "fade_black", maps\intro_code::_id_6F36, "intro_opening_shot03" );
    maps\_anim::_id_1264( "player_rig", "fade_black", maps\intro_code::_id_6F36, "intro_opening_shot04" );
    maps\_anim::_id_1264( "player_rig", "fade_black", maps\intro_code::_id_6F37, "intro_opening_shot05" );
    maps\_anim::_id_1264( "player_rig", "fade_white", maps\intro_code::_id_6F39, "intro_opening_shot07" );
    maps\_anim::_id_1264( "player_rig", "slowmo_start", ::_id_6F50, "intro_opening_shot07" );
    maps\_anim::_id_1264( "player_rig", "start_heli_dust", ::_id_6F46, "intro_opening_shot07" );
    maps\_anim::_id_1264( "player_rig", "slowmo_end", ::_id_6F51, "intro_opening_shot08" );
    maps\_anim::_id_1264( "player_rig", "chopper_crash", maps\intro_code::_id_6F3A, "intro_opening_shot07" );
    level._id_0C59["player_rig"]["escort_help_soap"] = %intro_docdown_needle_player;
    level._id_0C59["player_rig"]["escort_help_soap_breach"] = %intro_docdown_breach_player;
    level._id_0C59["player_rig"]["roof_collapse_slide"] = %intro_rooftop_collapse_player;
    level._id_0C59["player_rig"]["river_ride"] = %intro_river_ride_player;
    level._id_0C59["player_legs"]["roof_collapse_slide"] = %intro_rooftop_collapse_player_legs;
    level._id_0C59["player_rig"]["roof_collapse_slide_loop"] = %intro_rooftop_collapse_loop_player;
    level._id_0C59["player_legs"]["roof_collapse_slide_loop"] = %intro_rooftop_collapse_loop_player_legs;
    maps\_anim::_id_1264( "player_rig", "slomo_start", ::_id_6F48, "roof_collapse_slide" );
    maps\_anim::_id_1264( "player_rig", "slowmo_end", ::_id_6F49, "roof_collapse_slide" );
    maps\_anim::_id_1264( "player_legs", "boot_scrape_dust", maps\intro_fx::_id_6EEF, "roof_collapse_slide" );
    maps\_anim::_id_1264( "player_rig", "water_impact", maps\intro_fx::_id_6F14, "roof_collapse_slide" );
    maps\_anim::_id_1264( "player_rig", "slowmo_end", maps\intro_fx::_id_6EEE, "roof_collapse_slide" );
    maps\_anim::_id_1264( "player_rig", "water_emerge_1", maps\intro_fx::_id_6F16, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "water_submerge_1", maps\intro_fx::_id_6F15, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "stop_bubbles", maps\intro_fx::_id_6F18, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "water_emerge_2", maps\intro_fx::_id_6F17, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "exit_river_water", maps\intro_fx::_id_6F1A, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "hand_surface_splash", maps\intro_fx::_id_6F1B, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "dialog_1", maps\intro_vo::_id_6EAA, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "dialog_2", maps\intro_vo::_id_6EAB, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "dialog_3", maps\intro_vo::_id_6EAC, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "dialog_4", maps\intro_vo::_id_6EAD, "river_ride" );
    maps\_anim::_id_1264( "player_rig", "dialog_5", maps\intro_vo::_id_6EAE, "river_ride" );
}
#using_animtree("script_model");

_id_4443()
{
    level._id_1245["wire1"] = #animtree;
    level._id_1F90["wire1"] = "intro_props_wires_01";
    level._id_0C59["wire1"]["intro_shot01_wires"] = %intro_shot01_wires;
    level._id_1245["wire2"] = #animtree;
    level._id_1F90["wire2"] = "intro_props_wires_02";
    level._id_0C59["wire2"]["intro_shot01_wires"] = %intro_shot01_wires;
    level._id_1245["wire3"] = #animtree;
    level._id_1F90["wire3"] = "intro_props_wires_03";
    level._id_0C59["wire3"]["intro_shot01_wires"] = %intro_shot01_wires;
    level._id_1245["gurney"] = #animtree;
    level._id_0C59["gurney"]["intro_opening_shot01"] = %intro_opening_shot01_gurney;
    level._id_0C59["gurney"]["intro_opening_shot07"] = %intro_opening_shot07_gurney;
    level._id_0C59["gurney"]["intro_opening_shot08"] = %intro_opening_shot08_gurney;
    level._id_0C59["gurney"]["intro_work_on_soap"][0] = %intro_docdown_gurney;
    level._id_1F90["gurney"] = "intro_props_gurney";
    level._id_0C59["surgery_cart"]["intro_opening_shot08"] = %intro_opening_shot08_cart;
    level._id_1245["surgery_cart"] = #animtree;
    level._id_1F90["surgery_cart"] = "intro_props_surgery_cart";
    level._id_0C59["forceps"]["intro_opening_shot07"] = %intro_opening_shot07_forceps;
    level._id_0C59["forceps"]["intro_opening_shot08"] = %intro_opening_shot08_forceps;
    level._id_0C59["forceps"]["escort_doctor_dies"] = %intro_docdown_docdie_forceps;
    level._id_0C59["forceps"]["intro_work_on_soap"][0] = %intro_docdown_forceps;
    level._id_1245["forceps"] = #animtree;
    level._id_1F90["forceps"] = "intro_forceps";
    level._id_0C59["gauze"]["intro_opening_shot07"] = %intro_opening_shot07_gauze;
    level._id_0C59["gauze"]["intro_opening_shot08"] = %intro_opening_shot08_gauze;
    level._id_0C59["gauze"]["escort_doctor_dies"] = %intro_docdown_docdie_gauze;
    level._id_0C59["gauze"]["intro_work_on_soap"][0] = %intro_docdown_gauze;
    level._id_1245["gauze"] = #animtree;
    level._id_1F90["gauze"] = "intro_gauze";
    level._id_1245["helicrash_wallshards"] = #animtree;
    level._id_0C59["helicrash_wallshards"]["wallshards"] = %intro_helicrash_wallshards;
    level._id_1245["intro_ceiling_woodbeam_01"] = #animtree;
    level._id_1F90["intro_ceiling_woodbeam_01"] = "intro_ceiling_woodbeam_01";
    level._id_0C59["intro_ceiling_woodbeam_01"]["intro_opening_shot08"] = %intro_opening_shot08_debris_beam;
    level._id_1245["intro_ceiling_damage_med_01"] = #animtree;
    level._id_1F90["intro_ceiling_damage_med_01"] = "intro_ceiling_damage_med_01";
    level._id_0C59["intro_ceiling_damage_med_01"]["intro_opening_shot08"] = %intro_opening_shot08_debris_rubble;
    level._id_0C59["breach_door_model"]["breach"] = %breach_player_door_hinge_v1;
    level._id_1245["breach_door_model"] = #animtree;
    level._id_1F90["breach_door_model"] = "intro_door_piece_hinge5";
    level._id_0C59["cover_object"]["cover_object_pull_down"] = %intro_npc_move_object_cover_object;
    level._id_1245["cover_object"] = #animtree;
    level._id_1F90["cover_object"] = "intro_pillar_cover01";
    maps\_anim::_id_1264( "cover_object", "brick_impact", maps\intro_fx::_id_6EDC, "cover_object_pull_down" );
    level._id_0C59["gate"]["price_to_nikolai"] = %intro_price_reload_door;
    level._id_1245["gate"] = #animtree;
    level._id_1F90["gate"] = "intro_props_front_gate";
    level._id_0C59["rope"]["escort_rappel"] = %intro_rope_rappel;
    level._id_1245["rope"] = #animtree;
    level._id_1F90["rope"] = "weapon_rappel_rope_long";
    level._id_0C59["syringe"]["escort_help_soap"] = %intro_docdown_needle_injector;
    level._id_0C59["syringe"]["escort_help_soap_breach"] = %intro_docdown_breach_injector;
    level._id_1245["syringe"] = #animtree;
    level._id_1F90["syringe"] = "weapon_syringe";
    level._id_0C59["flashlight"]["intro_weapon_cache_start"] = %intro_weapon_cache_flashlight_start;
    level._id_0C59["flashlight"]["intro_weapon_cache_stairs_idle"][0] = %intro_weapon_cache_flashlight_price_idle;
    level._id_0C59["flashlight"]["intro_weapon_cache_idle"][0] = %intro_weapon_cache_flashlight_idle;
    level._id_0C59["flashlight"]["intro_weapon_cache_pullout"] = %intro_weapon_cache_flashlight_price_end;
    level._id_0C59["flashlight"]["intro_weapon_cache_end"] = %intro_weapon_cache_flashlight_end;
    level._id_1245["flashlight"] = #animtree;
    level._id_1F90["flashlight"] = "com_flashlight_on";
    level._id_0C59["crate_door"]["intro_weapon_cache_pullout"] = %intro_weapon_cache_crate_door;
    level._id_1245["crate_door"] = #animtree;
    level._id_1F90["crate_door"] = "intro_crate_sidewall01";
    level._id_0C59["ugv_model"]["intro_weapon_cache_pullout"] = %intro_weapon_cache_ugv_pullout;
    level._id_1245["ugv_model"] = #animtree;
    level._id_1F90["ugv_model"] = "vehicle_ugv_robot";
    level._id_0C59["rolling_door"]["intro_weapon_cache_end"] = %intro_weapon_cache_rollingdoor;
    level._id_1245["rolling_door"] = #animtree;
    level._id_1F90["rolling_door"] = "intro_rollingdoor_01";
    maps\_anim::_id_1264( "rolling_door", "rolling_door_open", maps\intro_fx::_id_6EE6, "intro_weapon_cache_end" );
    level._id_0C59["trap_door"]["intro_weapon_cache_start"] = %intro_weapon_cache_trapdoor;
    level._id_1245["trap_door"] = #animtree;
    level._id_1F90["trap_door"] = "intro_trapdoor_01";
    maps\_anim::_id_1264( "trap_door", "intro_trap_door_open", maps\intro_fx::_id_6EE4, "intro_weapon_cache_start" );
    maps\_anim::_id_1264( "trap_door", "intro_trap_door_impact", maps\intro_fx::_id_6EE5, "intro_weapon_cache_start" );
    level._id_0C59["crowbar"]["intro_weapon_cache_pullout"] = %intro_weapon_cache_crowbar;
    level._id_1245["crowbar"] = #animtree;
    level._id_1F90["crowbar"] = "paris_crowbar_01";
    level._id_1245["animated_tree"] = #animtree;
    level._id_0C59["animated_tree"]["tree_fall"] = %intro_tree_fall;
    level._id_1F90["animated_tree"] = "foliage_intro_tree_01_destroyed";
    level._id_1245["landslide_building_roof"] = #animtree;
    level._id_0C59["landslide_building_roof"]["intro_rooftop_collapse_sim_roof"] = %intro_rooftop_collapse_sim_roof;
    level._id_1245["landslide_building_roof2"] = #animtree;
    level._id_0C59["landslide_building_roof2"]["intro_rooftop_collapse_sim_roof2"] = %intro_rooftop_collapse_sim_roof2;
    level._id_1245["landslide_building_subfloor"] = #animtree;
    level._id_0C59["landslide_building_subfloor"]["intro_rooftop_collapse_sim_subfloor"] = %intro_rooftop_collapse_sim_subfloor;
    level._id_1245["landslide_building_handkey"] = #animtree;
    level._id_0C59["landslide_building_handkey"]["intro_rooftop_collapse_handkey"] = %intro_rooftop_collapse_handkey;
    level._id_1245["landslide_building_small_01"] = #animtree;
    level._id_0C59["landslide_building_small_01"]["intro_landslide_small"] = %intro_rooftop_collapse_small_building;
    level._id_0C59["landslide_building_small_01"]["river_ride"] = %intro_river_ride_small_building;
    level._id_1245["landslide_building_small_02"] = #animtree;
    level._id_0C59["landslide_building_small_02"]["intro_landslide_small"] = %intro_rooftop_collapse_small_building;
    level._id_1245["intro_landslide_building_replaceshards"] = #animtree;
    level._id_0C59["intro_landslide_building_replaceshards"]["intro_rooftop_collapse_replaceshards"] = %intro_rooftop_collapse_replaceshards;
    level._id_1245["landslide_building_water_heater"] = #animtree;
    level._id_0C59["landslide_building_water_heater"]["roof_collapse_slide"] = %intro_rooftop_collapse_heater;
    level._id_0C59["landslide_building_water_heater"]["river_ride"] = %intro_river_ride_heater;
    level._id_1F90["landslide_building_water_heater"] = "com_water_heater_nopipes_rigged";
}
#using_animtree("door");

_id_6F3B()
{
    level._id_0C59["door"]["door_breach"] = %shotgunbreach_door_immediate;
    level._id_1245["door"] = #animtree;
    level._id_1F90["door"] = "com_door_01_handleleft2";
    precachemodel( level._id_1F90["door"] );
}

_id_6F3C()
{

}
#using_animtree("generic_human");

_id_6F3D()
{
    level._id_0C59["nikolai"]["intro_opening_shot01"] = %intro_opening_shot01_nikolai;
    level._id_0C59["price"]["intro_opening_shot01"] = %intro_opening_shot01_price;
    level._id_0C59["player_body"]["intro_opening_shot01"] = %intro_opening_shot01_playerbody;
    level._id_0C59["player_body"]["intro_opening_shot02"] = %intro_opening_shot02_playerbody;
    level._id_0C59["player_body"]["intro_opening_shot03"] = %intro_opening_shot03_playerbody;
    level._id_0C59["player_body"]["intro_opening_shot04"] = %intro_opening_shot04_playerbody;
    level._id_0C59["player_body"]["intro_opening_shot05"] = %intro_opening_shot05_playerbody;
    level._id_1F90["player_body"] = "body_hero_soap_wounded";
    level._id_1245["player_body"] = #animtree;
    level._id_11B7["nikolai"]["intro_opening_shot02_nikolai_face"] = %intro_opening_shot02_nikolai_face;
    level._id_0C59["nikolai"]["intro_opening_shot02"] = %intro_opening_shot02_nikolai;
    level._id_0C59["price"]["intro_opening_shot02"] = %intro_opening_shot02_price;
    level._id_11B7["price"]["intro_opening_shot02_price_face"] = %intro_opening_shot02_price_face;
    level._id_0C59["bystander1"]["intro_opening_shot02"] = %intro_opening_shot02_bystander_1;
    level._id_0C59["bystander2"]["intro_opening_shot02"] = %intro_opening_shot02_bystander_2;
    level._id_0C59["bystander3"]["intro_opening_shot02"] = %intro_opening_shot02_bystander_3;
    level._id_0C59["nikolai"]["intro_opening_shot03"] = %intro_opening_shot03_nikolai;
    level._id_0C59["price"]["intro_opening_shot03"] = %intro_opening_shot03_price;
    level._id_0C59["bystander1"]["intro_opening_shot03"] = %intro_opening_shot03_bystander_1;
    level._id_0C59["bystander2"]["intro_opening_shot03"] = %intro_opening_shot03_bystander_2;
    level._id_0C59["bystander3"]["intro_opening_shot03"] = %intro_opening_shot03_bystander_3;
    level._id_0C59["bystander4"]["intro_opening_shot03"] = %intro_opening_shot03_bystander_4;
    level._id_0C59["bystander5"]["intro_opening_shot03"] = %intro_opening_shot03_bystander_5;
    level._id_0C59["nikolai"]["intro_opening_shot04"] = %intro_opening_shot04_nikolai;
    level._id_11B7["nikolai"]["intro_opening_shot04_face"] = %intro_opening_shot04_nikolai_face;
    level._id_0C59["price"]["intro_opening_shot04"] = %intro_opening_shot04_price;
    level._id_11B7["price"]["intro_opening_shot04_price_face"] = %intro_opening_shot04_price_face;
    level._id_0C59["bystander1"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_1;
    level._id_0C59["bystander2"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_2;
    level._id_0C59["bystander3"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_3;
    level._id_0C59["bystander4"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_4;
    level._id_0C59["bystander5"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_5;
    level._id_0C59["bystander6"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_6;
    level._id_0C59["bystander7"]["intro_opening_shot04"] = %intro_opening_shot04_bystander_7;
    level._id_0C59["nikolai"]["intro_opening_shot05"] = %intro_opening_shot05_nikolai;
    level._id_0C59["price"]["intro_opening_shot05"] = %intro_opening_shot05_price;
    level._id_0C59["doctor"]["intro_opening_shot05"] = %intro_opening_shot05_doc;
    level._id_0C59["nikolai"]["intro_opening_shot06"] = %intro_opening_shot06_nikolai;
    level._id_0C59["price"]["intro_opening_shot06"] = %intro_opening_shot06_price;
    level._id_0C59["doctor"]["intro_opening_shot06"] = %intro_opening_shot06_doc;
    level._id_0C59["yuri"]["intro_opening_shot06"] = %intro_opening_shot06_yuri;
    level._id_0C59["nikolai"]["intro_opening_shot07"] = %intro_opening_shot07_nikolai;
    level._id_11B7["nikolai"]["intro_opening_shot07_face"] = %intro_opening_shot07_nikolai_face;
    level._id_0C59["price"]["intro_opening_shot07"] = %intro_opening_shot07_price;
    level._id_0C59["doctor"]["intro_opening_shot07"] = %intro_opening_shot07_doc;
    level._id_0C59["soap"]["intro_opening_shot07"] = %intro_opening_shot07_soap;
    maps\_anim::_id_1264( "soap", "fx_blood_cough", ::_id_6F47, "intro_opening_shot07" );
    level._id_0C59["nikolai"]["intro_opening_shot08"] = %intro_opening_shot08_nikolai;
    level._id_11B7["nikolai"]["intro_opening_shot08_face"] = %intro_opening_shot08_nikolai_face;
    level._id_0C59["price"]["intro_opening_shot08"] = %intro_opening_shot08_price;
    level._id_0C59["doctor"]["intro_opening_shot08"] = %intro_opening_shot08_doc;
    level._id_0C59["soap"]["intro_opening_shot08"] = %intro_opening_shot08_soap;
    level._id_0C59["doctor"]["intro_work_on_soap"][0] = %intro_docdown_idle1_doc;
    level._id_0C59["nikolai"]["intro_work_on_soap"][0] = %intro_docdown_idle1_nikolai;
    level._id_0C59["soap"]["intro_work_on_soap"][0] = %intro_docdown_idle1_soap;
    level._id_0C59["breacher1"]["courtyard_breach"] = %intro_courtyard_breach_guy1;
    level._id_0C59["breacher2"]["courtyard_breach"] = %intro_courtyard_breach_guy2;
    level._id_0C59["breacher3"]["courtyard_breach"] = %intro_courtyard_breach_guy3;
    level._id_0C59["breacher4"]["courtyard_breach"] = %intro_courtyard_breach_guy4;
    level._id_0C59["breacher5"]["courtyard_breach"] = %intro_courtyard_breach_guy5;
    level._id_0C59["breacher6"]["courtyard_breach"] = %intro_courtyard_breach_guy6;
    level._id_0C59["generic"]["coverstand_hide_idle_wave02"] = %coverstand_hide_idle_wave02;
    level._id_0C59["object_puller1"]["cover_object_pull_down"] = %intro_npc_move_object_for_cover_2;
    level._id_0C59["object_puller2"]["cover_object_pull_down"] = %intro_npc_move_object_for_cover_3;
    level._id_0C59["doctor"]["escort_doctor_dies"] = %intro_docdown_docdie_doc;
    level._id_0C59["nikolai"]["escort_doctor_dies"] = %intro_docdown_docdie_nikolai;
    level._id_0C59["soap"]["escort_doctor_dies"] = %intro_docdown_docdie_soap;
    level._id_0C59["price"]["exposed_grenadeThrowB"] = %exposed_grenadethrowb;
    level._id_0C59["nikolai"]["escort_wait_for_player_idle"][0] = %intro_docdown_idle2_nikolai;
    level._id_0C59["soap"]["escort_wait_for_player_idle"][0] = %intro_docdown_idle2_soap;
    level._id_0C59["nikolai"]["escort_help_soap"] = %intro_docdown_needle_nikolai;
    level._id_0C59["soap"]["escort_help_soap"] = %intro_docdown_needle_soap;
    level._id_0C59["price"]["escort_help_soap"] = %intro_docdown_needle_price;
    level._id_0C59["soap"]["soap_lie_down_idle"][0] = %intro_docdown_idle3_soap;
    maps\_anim::_id_1264( "soap", "fx_soap_stop_bleeding", ::_id_6F54, "escort_help_soap" );
    level._id_0C59["nikolai"]["escort_help_soap_breach"] = %intro_docdown_breach_nikolai;
    level._id_0C59["price"]["escort_help_soap_breach"] = %intro_docdown_breach_price;
    level._id_11B7["price"]["escort_help_soap_breach_price_face"] = %intro_docdown_breach_price_face;
    level._id_0C59["soap"]["escort_help_soap_breach"] = %intro_docdown_breach_soap;
    level._id_0C59["breacher1"]["escort_help_soap_breach"] = %intro_docdown_breach_npc1;
    level._id_0C59["breacher2"]["escort_help_soap_breach"] = %intro_docdown_breach_npc2;
    maps\_anim::_id_1264( "breacher1", "door_breach", ::_id_6F43, "escort_help_soap_breach" );
    maps\_anim::_id_1264( "breacher1", "dropgun", ::_id_6F44, "escort_help_soap_breach" );
    maps\_anim::_id_1264( "breacher1", "die", ::_id_539A, "escort_help_soap_breach" );
    maps\_anim::_id_1264( "price", "chest_2_hand", ::_id_6F45, "escort_help_soap_breach" );
    maps\_anim::_id_1264( "price", "fx_pistolfire", maps\intro_fx::_id_6ED7, "escort_help_soap_breach" );
    level._id_0C59["generic"]["escort_rappel"] = %intro_npc_rappel;
    level._id_0C59["price"]["door_kick_in"] = %doorkick_2_cqbrun;
    level._id_0C59["nikolai"]["pickup_soap"] = %intro_docdown_exit_nikolai;
    level._id_0C59["soap"]["pickup_soap"] = %intro_docdown_exit_soap;
    level._id_0C59["nikolai"]["putdown_soap_init"] = %intro_fireman_carry_drop_guy_carrier_init;
    level._id_0C59["soap"]["putdown_soap_init"] = %intro_fireman_carry_drop_guy_carried_init;
    level._id_0C59["price"]["price_to_nikolai_transition"] = %intro_radio_price_to_idle;
    level._id_0C59["price"]["price_to_nikolai"] = %intro_radio_price_reload;
    level._id_11B7["price"]["price_to_nikolai_face"] = %intro_radio_price_reload_face;
    level._id_0C59["price"]["price_break_and_rake"] = %intro_price_break_and_rake_entrance;
    level._id_0C59["generic"]["coverstand_hide_idle_wave01"] = %coverstand_hide_idle_wave01;
    level._id_0C59["generic"]["intro_wounded_drag_carrier"] = %intro_wounded_drag_carrier;
    level._id_0C59["generic"]["intro_wounded_drag_wounded"] = %intro_wounded_drag_wounded;
    level._id_0C59["generic"]["intro_wounded_drag_carrier_idle"][0] = %intro_wounded_help_carrier;
    level._id_0C59["generic"]["intro_wounded_drag_wounded_idle"][0] = %intro_wounded_help_wounded;
    level._id_0C59["generic"]["regroup_wounded_civ_1"][0] = %arcadia_ending_scenea_dead_civilian;
    level._id_0C59["generic"]["regroup_wounded_civ_2"] = %civilian_crawl_2;
    level._id_0C59["generic"]["regroup_wounded_civ_2_death"] = %civilian_crawl_2_death_a;
    level._id_0C59["generic"]["fire_rocket"] = %contengency_rocket_moment;
    level._id_0C59["guy1"]["car_cover_start"] = %intro_move_from_cover_start_guy1;
    level._id_0C59["guy2"]["car_cover_start"] = %intro_move_from_cover_start_guy2;
    level._id_0C59["generic"]["car_cover_idle1"][0] = %intro_move_from_cover_idle_guy1;
    level._id_0C59["generic"]["car_cover_idle2"][0] = %intro_move_from_cover_idle_guy2;
    level._id_0C59["guy1"]["car_cover_end"] = %intro_move_from_cover_end_guy1;
    level._id_0C59["guy2"]["car_cover_end"] = %intro_move_from_cover_end_guy2;
    level._id_0C59["generic"]["car_door_cover"] = %intro_npc_use_car_door_cover_entrance;
    level._id_0C59["left_guy"]["breach_kick_stackL1_idle"][0] = %breach_kick_stackl1_idle;
    level._id_0C59["left_guy"]["breach_kick"] = %breach_kick_stackl1_enter;
    level._id_0C59["right_guy"]["breach_kick"] = %breach_kick_kickerr1_enter;
    level._id_0C59["right_guy"]["door_breach_setup"] = %intro_breach_shotgun_hinge_v1;
    level._id_0C59["right_guy"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_shoot_hinge_idle;
    level._id_0C59["right_guy"]["door_breach_idle"][0] = %intro_breach_shotgun_hinge_ready_idle_v1;
    level._id_0C59["right_guy"]["door_breach"] = %intro_breach_shotgun_hinge_runin_v1;
    level._id_0C59["left_guy"]["door_breach_setup"] = %intro_breach_stackb_v1;
    level._id_0C59["left_guy"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_stackb_idle;
    level._id_0C59["left_guy"]["door_breach_idle"][0] = %shotgunbreach_v1_stackb_ready_idle;
    level._id_0C59["left_guy"]["door_breach"] = %intro_breach_stackb_runin_v1;
    level._id_0C59["yuri"]["control_ugv"][0] = %intro_weapon_cach_yuri_idle;
    level._id_0C59["price"]["intro_weapon_cache_upto_shed"] = %intro_price_upto_shed;
    level._id_0C59["price"]["intro_weapon_cache_upto_shed_idle"][0] = %intro_price_upto_shed_idle;
    level._id_0C59["price"]["intro_weapon_cache_start"] = %intro_weapon_cache_price_start;
    level._id_0C59["price"]["intro_weapon_cache_stairs_idle"][0] = %intro_weapon_cache_price_stairs_idle;
    level._id_0C59["price"]["intro_weapon_cache_pullout"] = %intro_weapon_cache_price_pullout;
    level._id_11B7["price"]["intro_weapon_cache_pullout_face"] = %intro_weapon_cache_price_pullout_face;
    level._id_0C59["price"]["intro_weapon_cache_idle"][0] = %intro_weapon_cache_price_signal_idle;
    level._id_0C59["price"]["intro_weapon_cache_end"] = %intro_weapon_cache_price_end;
    level._id_0C59["price"]["intro_weapon_cache_end_idle"][0] = %intro_weapon_cache_price_end_idle;
    maps\_anim::_id_1264( "price", "light_on", ::_id_6F41, "intro_weapon_cache_start" );
    maps\_anim::_id_1264( "price", "light_off", ::_id_6F42, "intro_weapon_cache_end" );
    level._id_0C59["soap"]["intro_ugv_helicopter"] = %intro_helicopter_guy1;
    level._id_0C59["nikolai"]["intro_ugv_helicopter"] = %intro_helicopter_guy2;
    level._id_0C59["price"]["intro_ugv_helicopter"] = %intro_helicopter_guy3;
    level._id_0C59["soap"]["intro_ugv_helicopter_idle"][0] = %intro_helicopter_idle_guy1;
    level._id_0C59["nikolai"]["intro_ugv_helicopter_idle"][0] = %intro_helicopter_idle_guy2;
    level._id_0C59["price"]["intro_ugv_helicopter_idle"][0] = %intro_helicopter_idle_guy3;
    level._id_0C59["soap"]["river_ride"] = %intro_river_ride_soap;
    level._id_0C59["nikolai"]["river_ride"] = %intro_river_ride_nikolai;
    level._id_0C59["price"]["river_ride"] = %intro_river_ride_price;
}

_id_6F3E()
{
    level._id_0C59["generic"]["bunker_toss_idle_guy1"][0] = %bunker_toss_idle_guy1;
    level._id_0C59["generic"]["DC_Burning_artillery_reaction_v3_idle"][0] = %dc_burning_artillery_reaction_v3_idle;
    level._id_0C59["generic"]["DC_Burning_bunker_sit_idle"][0] = %dc_burning_bunker_sit_idle;
    level._id_0C59["generic"]["civilain_crouch_hide_idle"][0] = %civilain_crouch_hide_idle;
    level._id_0C59["generic"]["civilain_crouch_hide_idle_loop"][0] = %civilain_crouch_hide_idle_loop;
    level._id_0C59["generic"]["DC_Burning_stop_bleeding_wounded_endidle"][0] = %dc_burning_stop_bleeding_wounded_endidle;
    level._id_0C59["generic"]["DC_Burning_stop_bleeding_medic_endidle"][0] = %dc_burning_stop_bleeding_medic_endidle;
    level._id_0C59["generic"]["DC_Burning_stop_bleeding_wounded_idle"][0] = %dc_burning_stop_bleeding_wounded_idle;
    level._id_0C59["generic"]["death_explosion_run_R_v1"] = %death_explosion_run_r_v1;
    level._id_0C59["generic"]["death_explosion_stand_F_v4"] = %death_explosion_stand_f_v4;
    level._id_0C59["generic"]["stand_death_tumbleback"] = %stand_death_tumbleback;
    level._id_0C59["generic"]["prague_resistance_hit"] = %prague_resistance_hit;
    level._id_0C59["generic"]["prague_resistance_hit_idle"][0] = %prague_resistance_hit_idle;
    level._id_0C59["generic"]["prague_woundwalk_wounded"] = %prague_woundwalk_wounded;
    level._id_0C59["generic"]["prague_woundwalk_helper"] = %prague_woundwalk_helper;
    level._id_0C59["generic"]["prague_woundwalk_wounded_idle"][0] = %prague_woundidle_wounded;
    level._id_0C59["generic"]["prague_woundwalk_helper_idle"][0] = %prague_woundidle_helper;
    level._id_0C59["generic"]["prague_civ_door_peek"] = %prague_civ_door_peek;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level._id_0C59["generic"]["airport_civ_dying_groupB_wounded"] = %airport_civ_dying_groupb_wounded;
    level._id_0C59["generic"]["airport_civ_dying_groupB_pull_death"] = %airport_civ_dying_groupb_pull_death;
    level._id_0C59["generic"]["airport_civ_dying_groupB_wounded_death"] = %airport_civ_dying_groupb_wounded_death;
    level._id_0C59["generic"]["civilian_crawl_2"] = %civilian_crawl_2;
    level._id_0C59["generic"]["civilian_crawl_2_death"] = %civilian_crawl_2_death_a;
    level._id_52AC = [];
    level._id_52AC[level._id_52AC.size] = %civilian_run_hunched_c_relative;
    level._id_52AC[level._id_52AC.size] = %civilian_run_hunched_a_relative;
    level._id_52AC[level._id_52AC.size] = %unarmed_scared_run;
    level._id_52AC[level._id_52AC.size] = %civilian_run_upright_relative;
    level._id_52AC[level._id_52AC.size] = %ny_harbor_running_coughing_guy1_relative;
    level._id_52AC[level._id_52AC.size] = %afchase_shepherd_flee_loop_relative;
    level._id_52AC[level._id_52AC.size] = %prague_bully_civ_run_relative;
    level._id_0C59["generic"]["unarmed_cowercrouch_react_A"] = %unarmed_cowercrouch_react_a;
    level._id_0C59["generic"]["unarmed_cowercrouch_react_A_idle"][0] = %unarmed_cowerstand_pointidle;
    level._id_0C59["generic"]["unarmed_cowercrouch_idle_duck"] = %unarmed_cowercrouch_idle_duck;
    level._id_0C59["generic"]["unarmed_cowercrouch_idle_duck_idle"][0] = %unarmed_cowercrouch_idle;
    level._id_0C59["generic"]["intro_docdown_idle1_soap"][0] = %intro_docdown_idle1_soap;
    level._id_0C59["generic"]["unarmed_close_garage"] = %intro_garage_door_closing;
}

_id_539C()
{
    level._id_539C = [];
    level._id_539C[level._id_539C.size] = %stand_death_tumbleback;
    level._id_539C[level._id_539C.size] = %run_death_fallonback;
    level._id_539C[level._id_539C.size] = %run_death_roll;
    level._id_539C[level._id_539C.size] = %exposed_death_blowback;
    level._id_539C[level._id_539C.size] = %exposed_death_firing_02;
    level._id_5E78 = [];
    level._id_5E78[level._id_5E78.size] = %death_run_forward_crumple;
    level._id_5E78[level._id_5E78.size] = %run_death_roll;
    level._id_5E78[level._id_5E78.size] = %run_death_skid;
    level._id_5E78[level._id_5E78.size] = %run_death_roll_02;
    level._id_5E78[level._id_5E78.size] = %run_death_roll_03;
    level._id_5E78[level._id_5E78.size] = %run_death_legshot;
    level._id_0C59["generic"]["civilian_leaning_death_shot"] = %civilian_leaning_death_shot;
    level._id_0C59["generic"]["CornerCrL_death_side"] = %cornercrl_death_side;
    level._id_0C59["generic"]["pistol_death_3"] = %pistol_death_3;
    level._id_0C59["generic"]["drone_stand_death"] = %drone_stand_death;
    level._id_0C59["generic"]["death_run_onfront"] = %death_run_onfront;
    level._id_0C59["generic"]["doorpeek_deathA"] = %doorpeek_deatha;
    level._id_0C59["generic"]["death_run_onfront"] = %death_run_onfront;
    level._id_0C59["generic"]["arcadia_ending_sceneA_dead_civilian"][0] = %arcadia_ending_scenea_dead_civilian;
    level._id_0C59["generic"]["prague_mourner_woman_idle"][0] = %prague_mourner_woman_idle;
    level._id_0C59["generic"]["prague_mourner_man_idle"][0] = %prague_mourner_man_idle;
}
#using_animtree("script_model");

_id_6F3F()
{
    level._id_1245["door_peek"] = #animtree;
    level._id_0C59["door_peek"]["prague_civ_door_peek_door"] = %prague_civ_door_peek_door;
}
#using_animtree("vehicles");

_id_0B5A()
{
    level._id_0C59["littlebird"]["intro_opening_shot01"] = %intro_opening_shot01_littlebird;
    level._id_0C59["littlebird"]["river_ride"] = %intro_river_ride_littlebird;
    level._id_1245["littlebird"] = #animtree;
    level._id_1F90["littlebird"] = "vehicle_mh_6_little_bird";
    level._id_0C59["mi28"]["intro_opening_shot06"] = %intro_opening_shot06_mi28;
    level._id_0C59["mi28"]["intro_opening_shot07"] = %intro_opening_shot07_mi28;
    level._id_0C59["mi28"]["intro_opening_shot08"] = %intro_opening_shot08_mi28_destroyed;
    maps\_anim::_id_1264( "mi28", "fx_heli_hit_ground", ::_id_6F53, "intro_opening_shot08" );
    level._id_1245["mi28"] = #animtree;
    level._id_1F90["mi28"] = "vehicle_mi_28_destroyed";
    level._id_0C59["cover_car"]["car_door_cover"] = %intro_npc_use_car_door_cover_car;
    level._id_1245["cover_car"] = #animtree;
    level._id_1F90["cover_car"] = "vehicle_80s_hatch1_brn";
    level._id_0C59["uav"]["roof_collapse_slide"] = %intro_rooftop_collapse_uav;
    level._id_0C59["uav"]["ugv_death"] = %ugv_robot_uav_death;
    level._id_0C59["uav"]["price_to_nikolai"] = %intro_price_reload_uav;
    level._id_1245["uav"] = #animtree;
    level._id_1F90["uav"] = "russian_dozor_600";
    level._id_0C59["ugv"]["ugv_death"] = %ugv_robot_death;
    level._id_0C59["ugv"]["ugv_death_pos"] = %ugv_robot_death_pos;
    level._id_1245["ugv"] = #animtree;
    level._id_1F90["ugv"] = "vehicle_ugv_robot_viewmodel";
    level._id_0C59["ugv_turret"]["ugv_death"] = %ugv_robot_turret_death;
    level._id_0C59["ugv_turret"]["ugv_death_pos"] = %ugv_robot_turret_death_pos;
    level._id_0C59["ugv_turret"]["ugv_fire_grenade"] = %ugv_robot_grenade_launcher_fire;
    level._id_1245["ugv_turret"] = #animtree;
    level._id_1F90["ugv_turret"] = "ugv_robot_gun";
    level._id_0C59["ugv_grenade_launcher"]["ugv_death"] = %ugv_robot_grenade_launcher_death;
    level._id_1245["ugv_grenade_launcher"] = #animtree;
    level._id_1F90["ugv_grenade_launcher"] = "ugv_robot_grenade_launcher";
    level._id_0C59["destructible_car"]["price_break_and_rake"] = %intro_price_break_and_rake_car;
    level._id_1245["destructible_car"] = #animtree;
    level._id_1F90["destructible_car"] = "vehicle_80s_hatch1_brn_destructible_mp";
}

destructibles()
{

}

_id_6F40( var_0, var_1 )
{

}

_id_6F41( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "flashlight" ), level._id_5386, "TAG_LIGHT" );
}

_id_6F42( var_0 )
{
    if ( isdefined( level._id_5386 ) )
        stopfxontag( common_scripts\utility::getfx( "flashlight" ), level._id_5386, "TAG_LIGHT" );
}

_id_6F43( var_0 )
{
    var_1 = getent( "escort_hotel_door", "targetname" );
    var_1 rotateto( var_1.angles + ( 0.0, 160.0, 0.0 ), 0.5, 0, 0 );
    var_1 connectpaths();
    common_scripts\utility::flag_set( "escort_hotel_door_open" );
}

_id_6F44( var_0 )
{
    var_0.dropweapon = 1;
    var_0 animscripts\shared::_id_23C8();
}

_id_539A( var_0 )
{
    var_0 maps\intro_utility::_id_4BF3();
}

_id_6F45( var_0 )
{
    var_0 animscripts\shared::_id_0C9B( var_0.weapon, "right" );
}

_id_6F46( var_0 )
{
    common_scripts\utility::exploder( 24 );
    wait 0.5;
    maps\_utility::_id_2693( "intro_godray" );
}

_id_6F47( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "blood_cough" ), var_0, "J_Jaw" );
}

_id_6F48( var_0 )
{
    var_1 = 0.3;
    maps\_utility::_id_2771();
    maps\_utility::_id_2772( 0.3 );
    maps\_utility::_id_2774( var_1 );
    maps\_utility::_id_2775();
}

_id_6F49( var_0 )
{
    var_1 = 0.5;
    maps\_utility::_id_0A16( var_1 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_6F4A( var_0 )
{
    var_1 = 0.5;
    maps\_utility::_id_2771();
    maps\_utility::_id_2772( 0.8 );
    maps\_utility::_id_2774( var_1 );
    maps\_utility::_id_2775();
}

_id_6F4B( var_0 )
{
    var_1 = 0.8;
    maps\_utility::_id_0A16( var_1 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_6F4C( var_0 )
{
    var_1 = 0.5;
    maps\_utility::_id_2771();
    maps\_utility::_id_2772( 0.85 );
    maps\_utility::_id_2774( var_1 );
    maps\_utility::_id_2775();
}

_id_6F4D( var_0 )
{
    var_1 = 2;
    maps\_utility::_id_0A16( var_1 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_6F4E( var_0 )
{
    var_1 = 0.5;
    maps\_utility::_id_2771();
    maps\_utility::_id_2772( 0.8 );
    maps\_utility::_id_2774( var_1 );
    maps\_utility::_id_2775();
}

_id_6F4F( var_0 )
{
    var_1 = 0.8;
    maps\_utility::_id_0A16( var_1 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_6F50( var_0 )
{
    var_1 = 0.7;
    maps\_utility::_id_2771();
    maps\_utility::_id_2772( 0.3 );
    maps\_utility::_id_2774( var_1 );
    maps\_utility::_id_2775();
}

_id_6F51( var_0 )
{
    var_1 = 2;
    maps\_utility::_id_0A16( var_1 );
    maps\_utility::_id_0A17();
    maps\_utility::_id_0A18();
}

_id_6F52( var_0 )
{
    var_0._id_6EC9[3].v["currentState"] = 2;
    var_0 maps\intro_utility::_id_6ECA( var_0, 3, 1 );
}

_id_6F53( var_0 )
{
    common_scripts\utility::exploder( 23 );
}

_id_6F54( var_0 )
{
    level notify( "msg_soap_stop_bleeding" );
}
