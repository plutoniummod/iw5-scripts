// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_7AA4();
    _id_7AA5();
    _id_7AA6();
    level thread _id_4780();

    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
        _id_7AA3::main();
}

_id_7AA4()
{
    level._effect["soap_steam"] = loadfx( "smoke/soap_steam" );
    level._effect["paper_fx"] = loadfx( "dust/heli_paper_kickup" );
    level._effect["pigeon_gibs"] = loadfx( "props/chicken_exp_white" );
    level._effect["suv_headlight_l"] = loadfx( "lights/car_headlight_suburban_l" );
    level._effect["suv_headlight_r"] = loadfx( "lights/car_headlight_suburban_r" );
    level._effect["suv_taillight_l"] = loadfx( "lights/car_taillight_suburban_l" );
    level._effect["suv_taillight_r"] = loadfx( "lights/car_taillight_suburban_r" );
    level._effect["tire_smoketrail"] = loadfx( "maps/paris/sedan_tire_smoketrail" );
    level._effect["suv_explosion"] = loadfx( "explosions/vehicle_explosion_t90_cheap" );
    level._effect["grenade_exp_concrete"] = loadfx( "explosions/grenadeExp_concrete_1" );
    level._effect["bullet_geo"] = loadfx( "smoke/smoke_geotrail_barret_prague_esc" );
    level._effect["dust_fall_soap_chest"] = loadfx( "dust/dust_fall_soap_chest" );
    level._effect["blood_cough_heavy"] = loadfx( "misc/blood_cough_heavy" );
    level._effect["blood_cough_mild"] = loadfx( "misc/blood_cough_mild" );
    level._effect["FX_soap_walk_blood_drip"] = loadfx( "misc/blood_drip_walk_heavy_soap" );
    level._effect["FX_soap_walk_blood_smear"] = loadfx( "misc/blood_smear_walk_heavy_soap" );
    level._effect["FX_soap_sit_blood_pool"] = loadfx( "misc/blood_pool_soap" );
    level._effect["FX_soap_sit_blood_pool_small"] = loadfx( "misc/blood_pool_small_soap" );
    level._effect["smoke_grenade_prague"] = loadfx( "smoke/smoke_grenade_cheap" );
    level._effect["smoke_grenade_streamer"] = loadfx( "smoke/smoke_grenade_streamer_prague_escape" );
    level._effect["muzzleflash_heavy"] = loadfx( "muzzleflashes/heavy" );
    level._effect["geotrail_m203"] = loadfx( "smoke/smoke_geotrail_m203_prague_esc" );
    level._effect["geotrail_m203"] = loadfx( "smoke/smoke_geotrail_m203_prague_esc" );
    level._effect["cloud_bank_a"] = loadfx( "weather/cloud_bank_a" );
    level._effect["sunflare_intro_large"] = loadfx( "lights/sunflare_intro_large" );
    level._effect["lamp_sparks"] = loadfx( "props/lamp_table1_sparks" );
    level._effect["btr_cannon_impact_burst"] = loadfx( "impacts/btr_cannon_impact_burst" );
    level._effect["lion_statue_dest"] = loadfx( "misc/statue_lion_break_prague_esc" );
    level._effect["firehydrant_leak"] = loadfx( "props/firehydrant_leak" );
    level._effect["hedgea_dest"] = loadfx( "props/foliage_hedge_rounded_1_dest" );
    level._effect["hedgeb_dest"] = loadfx( "props/foliage_hedge_rounded_2_dest" );
    level._effect["crate_dest"] = loadfx( "props/crate32x48_dest" );
    level._effect["btr_spotlight"] = loadfx( "misc/spotlight_btr80" );
    level._effect["spotlight_btr80_daytime"] = loadfx( "misc/spotlight_btr80_daytime" );
    level._effect["bullet_geo_flashback"] = loadfx( "smoke/smoke_geotrail_barret_prague_esc_fb" );
    level._effect["blood"] = loadfx( "impacts/sniper_escape_blood" );
    level._effect["blood_pool"] = loadfx( "impacts/deathfx_bloodpool" );
    level._effect["zak_arm_blood"] = loadfx( "misc/blood_zakhaev_arm_prague_esc" );
    level._effect["sniper_glint"] = loadfx( "misc/scope_glint_prague_esc" );
    level._effect["glass_exit_car_flashback"] = loadfx( "impacts/glass_exit_car_flashback_prague_esc" );
    level._effect["car_impact_1_flashback"] = loadfx( "impacts/car_impact_1_flashback_prague_esc" );
    level._effect["car_impact_2_flashback"] = loadfx( "impacts/car_impact_2_flashback_prague_esc" );
    level._effect["sniper_muzzle_flash"] = loadfx( "muzzleflashes/bmp_flash_wv" );
    level._effect["chopper_smoke_trail"] = loadfx( "fire/fire_smoke_trail_L" );
    level._effect["heli_aerial_explosion_large"] = loadfx( "explosions/aerial_explosion_large" );
    level._effect["nuked_chopper_explosion"] = loadfx( "explosions/aerial_explosion" );
    level._effect["FX_nuke_background_explosion"] = loadfx( "explosions/cluster_exp_variation_runner_ac130_paris" );
    level._effect["flesh_hit"] = loadfx( "impacts/flesh_hit" );
    level._effect["ai_blood_splash"] = loadfx( "misc/ai_mowdown" );
    level._effect["cobra_treadfx"] = loadfx( "treadfx/heli_dust_looping_prague_esc" );
    level._effect["blood_handprint"] = loadfx( "impacts/blood_smear_hand" );
    level._effect["desert_eagle_flash"] = loadfx( "muzzleflashes/desert_eagle_flash_wv_a" );
    level._effect["FX_airport_civ_headshot_impact"] = loadfx( "maps/dubai/yuri_headshot_blood" );
    level._effect["FX_airport_civ_headshot_trail"] = loadfx( "maps/warlord/execution_blood_fx_2" );
}

_id_7AA5()
{
    level._effect["nuke_explosion"] = loadfx( "explosions/nuke_explosion" );
    level._effect["nuke_flash"] = loadfx( "explosions/nuke_flash" );
    level._effect["nuke_dirt_shockwave"] = loadfx( "explosions/nuke_dirt_shockwave" );
    level._effect["nuke_smoke_fill"] = loadfx( "explosions/nuke_smoke_fill" );
}

_id_7AA6()
{
    level._effect["fx_window_fire_large_smoke"] = loadfx( "fire/window_fire_large_short_smoke" );
    level._effect["fx_firelp_med_pm_dist"] = loadfx( "fire/church_fire_large" );
    level._effect["fx_trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["fx_ambient_ground_smoke"] = loadfx( "weather/ambient_ground_fog_prague_esc" );
    level._effect["fx_fire_generic_atlas"] = loadfx( "fire/fire_generic_atlas" );
    level._effect["fx_fire_generic_ball_thick"] = loadfx( "fire/hotel_window_fire_lg_prague_esc" );
    level._effect["fx_fire_generic_ball_burst_large"] = loadfx( "fire/hotel_window_fire_lg_prague_esc" );
    level._effect["fx_fire_generic_ball_burst"] = loadfx( "fire/hotel_window_fire_sm_prague_esc" );
    level._effect["fx_fire_generic_atlas_smoke"] = loadfx( "fire/fire_generic_atlas_smoke" );
    level._effect["hotel_after_exp_embers"] = loadfx( "fire/hotel_after_exp_embers" );
    level._effect["fire_falling_runner_point_far"] = loadfx( "fire/fire_falling_runner_point_far" );
    level._effect["tower_exp_fire_prague_esc"] = loadfx( "fire/tower_exp_fire_prague_esc" );
    level._effect["firelp_cheap_mp"] = loadfx( "fire/firelp_cheap_mp" );
    level._effect["debris_pile_smoke_hang_hamburg"] = loadfx( "dust/debris_pile_smoke_hang_hamburg" );
    level._effect["wall_breach_prague_esc"] = loadfx( "explosions/wall_breach_prague_esc" );
    level._effect["room_dust_200_mp_vacant"] = loadfx( "dust/room_dust_200_blend_mp_vacant" );
    level._effect["room_dust_200_z150_mp"] = loadfx( "dust/room_dust_200_z150_mp" );
    level._effect["car_fire_mp"] = loadfx( "fire/car_fire_mp" );
    level._effect["thin_black_smoke_hamburg"] = loadfx( "smoke/thin_black_smoke_hamburg" );
    level._effect["insects_light_hunted"] = loadfx( "misc/insects_light_hunted" );
    level._effect["falling_dirt_hamburg_runner"] = loadfx( "dust/falling_dirt_hamburg_runner" );
    level._effect["church_fire_large"] = loadfx( "fire/church_fire_large" );
    level._effect["insects_carcass_flies"] = loadfx( "misc/insects_carcass_flies" );
    level._effect["burned_vehicle_sparks_hamburg"] = loadfx( "fire/burned_vehicle_sparks_hamburg" );
    level._effect["debris_pile_smoke_hang_hamburg"] = loadfx( "dust/debris_pile_smoke_hang_hamburg" );
    level._effect["rpg_wall_impact_prague_esc"] = loadfx( "explosions/rpg_wall_impact_prague_esc" );
    level._effect["falling_dirt_hamburg_runner"] = loadfx( "dust/falling_dirt_hamburg_runner" );
    level._effect["building_fire_thick_tower_prague_esc"] = loadfx( "fire/building_fire_thick_tower_prague_esc" );
    level._effect["nuke_dirt_shockwave_prague_esc"] = loadfx( "explosions/nuke_dirt_shockwave_prague_esc" );
    level._effect["nuke_smoke_fill_prague_esc"] = loadfx( "explosions/nuke_smoke_fill_prague_esc" );
    level._effect["nuke_explosion_prague_esc"] = loadfx( "explosions/nuke_explosion_prague_esc" );
    level._effect["nuke_flash_prague_esc"] = loadfx( "explosions/nuke_flash_prague_esc" );
    level._effect["after_nuke_ash_prague_esc"] = loadfx( "explosions/after_nuke_ash_prague_esc" );
    level._effect["after_nuke_grass_prague_esc"] = loadfx( "explosions/after_nuke_grass_prague_esc" );
    level._effect["dust_spray_detail_oriented_runner"] = loadfx( "dust/dust_spray_detail_oriented_runner" );
    level._effect["building_edge_dust_spray_runner"] = loadfx( "dust/building_edge_dust_spray_runner" );
    level._effect["leaves_fall_gentlewind_prague_esc"] = loadfx( "misc/leaves_fall_gentlewind_prague_esc" );
    level._effect["building_fire_hamburg_thick_tower_small"] = loadfx( "fire/building_fire_hamburg_thick_tower_small" );
    level._effect["falling_dirt_dark_2_runner_prague_esc"] = loadfx( "dust/falling_dirt_dark_2_runner_prague_esc" );
    level._effect["lights_uplight_haze"] = loadfx( "lights/lights_uplight_haze" );
    level._effect["cellar_light_smoke_prague_esc"] = loadfx( "smoke/cellar_light_smoke_prague_esc" );
    level._effect["snow_spray_detail_oriented_runner"] = loadfx( "snow/snow_spray_detail_oriented_runner" );
    level._effect["distant_mushroom_cloud_prague_esc"] = loadfx( "explosions/distant_mushroom_cloud_prague_esc" );
    level._effect["abrams_flare_runner"] = loadfx( "fire/abrams_flare_runner" );
    level._effect["medium_fire_far_prague_esc"] = loadfx( "fire/medium_fire_far_prague_esc" );
    level._effect["small_fire_far_prague_esc"] = loadfx( "fire/small_fire_far_prague_esc" );
    level._effect["trash_spiral_far_runner_prague_esc"] = loadfx( "misc/trash_spiral_far_runner_prague_esc" );
    level._effect["after_tower_exp_debris"] = loadfx( "dust/after_tower_exp_debris" );
    level._effect["leaves_runner_pine"] = loadfx( "misc/leaves_runner_pine" );
    level._effect["dubai_lights_glow_white"] = loadfx( "lights/dubai_lights_glow_white" );
    level._effect["fx_pigeon_plaza_static_sm"] = loadfx( "animals/pigeon_plaza_static_sm" );
    level._effect["fx_hotel_window_smash"] = loadfx( "explosions/window_exp_glass_strong" );
    level._effect["fx_flashbang_hotel"] = loadfx( "explosions/flashbang_prague_escape" );
    level._effect["fx_room_smokey_hotel"] = loadfx( "smoke/room_smoke_200" );
    level._effect["fx_red_light_blink_hotel"] = loadfx( "lights/lights_strobe_red_prague_escape" );
    level._effect["fx_pigeon_plaza_panic_takeoff_lg"] = loadfx( "animals/pigeon_plaza_takeoff_lg" );
    level._effect["fx_pigeon_plaza_takeoff_lg_rt"] = loadfx( "animals/pigeon_plaza_takeoff_lg_rt" );
    level._effect["fx_pigeon_plaza_panic_takeoff_sm"] = loadfx( "animals/pigeon_plaza_takeoff_sm" );
    level._effect["fx_explosion_hotel_main"] = loadfx( "explosions/building_explosion_hotel_prague_esc" );
    level._effect["fx_building_debris_dust_impact_prague_esc"] = loadfx( "dust/building_debris_dust_impact_prague_esc" );
    level._effect["fx_explosion_hotel_filler"] = loadfx( "explosions/building_explosion_london" );
    level._effect["fx_red_light_blink_belltower"] = loadfx( "lights/lights_strobe_red_prague_escape" );
    level._effect["fx_explosion_belltower_main"] = loadfx( "explosions/belltower_exp_prague_esc" );
    level._effect["fx_body_impact_scaffolding"] = loadfx( "impacts/body_fall_scaffolding_prague_esc" );
    level._effect["fx_scaffolding_crash_dust_prague_esc"] = loadfx( "dust/scaffolding_crash_dust_prague_esc" );
    level._effect["fx_bell_ground_impact"] = loadfx( "dust/scaffolding_dust_wood_debris_lg" );
    level._effect["fx_blood_decal_soap_fall"] = loadfx( "misc/blood_decal_soap_fall" );
    level._effect["fx_scaffolding_falling_dust"] = loadfx( "dust/scaffolding_falling_dust" );
    level._effect["fx_dust_debris_unsettled"] = loadfx( "dust/dust_debris_unsettled" );
    level._effect["fx_tankshell_wallImpact"] = loadfx( "explosions/tankshell_wallImpact" );
    level._effect["fx_wall_exp_rpg"] = loadfx( "explosions/wall_exp_rpg" );
    level._effect["fx_blood_smear_back_prague_esc"] = loadfx( "impacts/blood_smear_back_prague_esc" );
    level._effect["fx_door_kick"] = loadfx( "dust/door_kick" );
    level._effect["fx_box_push_body_impact"] = loadfx( "props/box_impact_bodyfall_prague_esc" );
    level._effect["fx_blood_smear_back_rotated_prague_esc"] = loadfx( "impacts/blood_smear_back_rotated_prague_esc" );
    level._effect["fx_fence_crush_lg"] = loadfx( "misc/fence_metal_crush_lg_prague_esc" );
    level._effect["fx_fence_crush_debris"] = loadfx( "misc/fence_metal_kickup_prague_esc" );
    level._effect["fx_metal_hoop_fall"] = loadfx( "misc/metal_hoop_fall_prague_esc" );
    level._effect["fx_window_blowout"] = loadfx( "misc/debris_window_blowout" );
    level._effect["fx_leaf_fall_impact"] = loadfx( "misc/leaves_branch_impact_prague_esc" );
    level._effect["fx_rpg_basketball"] = loadfx( "explosions/rpg_basketball_prague_esc" );
    level._effect["fx_window_shatter_prague_esc"] = loadfx( "breakables/window_shatter_prague_esc" );
    level._effect["fx_window_barrage_blinds_prague_esc"] = loadfx( "impacts/window_barrage_blinds_prague_esc" );
    level._effect["fx_wall_barrage_angled"] = loadfx( "impacts/wall_barrage_angled" );
    level._effect["fx_window_barrage_prague_esc"] = loadfx( "impacts/window_barrage_prague_esc" );
    level._effect["fx_deathfx_bloodpool_soap"] = loadfx( "impacts/deathfx_bloodpool_soap" );
    level._effect["fx_deathfx_bloodpool_soap_loop"] = loadfx( "impacts/deathfx_bloodpool_soap_loop" );
    level._effect["fx_blood_drip_heavy_soap"] = loadfx( "misc/blood_drip_heavy_soap" );
    level._effect["fx_window_godray_blinds_dusty"] = loadfx( "lights/window_godray_blinds_dusty" );
    level._effect["fx_fb_thin_black_smoke_M"] = loadfx( "smoke/thin_black_smoke_M" );
    level._effect["fx_fb_thin_black_smoke_L"] = loadfx( "smoke/thin_black_smoke_L" );
    level._effect["fx_fb_antiair_runner"] = loadfx( "misc/antiair_runner_night" );
    level._effect["fx_fb_firelp_small_dl_a"] = loadfx( "fire/firelp_small_dl_a" );
    level._effect["fx_fb_firelp_small_dl_b"] = loadfx( "fire/firelp_small_dl_b" );
    level._effect["fx_fb_firelp_small_dl_d"] = loadfx( "fire/firelp_small_dl_d" );
    level._effect["fx_fb_battlefield_smokebank_S"] = loadfx( "smoke/battlefield_smokebank_bog_a" );
}

_id_4780()
{
    maps\_treadfx::_id_28EF( "cobra", "dirt", "treadfx/heli_dust_large" );
}
