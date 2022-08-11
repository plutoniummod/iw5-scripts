// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
        _id_4EA5::main();

    level thread _id_4780();

    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    maps\_shg_fx::_id_4445();
    common_scripts\utility::flag_init( "trigger_vfx_expl_heli_ride" );
    common_scripts\utility::flag_init( "bridge_one_tank_destroyed" );
    common_scripts\utility::flag_init( "player_unloaded_from_intro_flight" );
    common_scripts\utility::flag_init( "sniper_complete" );
    common_scripts\utility::flag_init( "player_interacting_with_wounded_lonestar" );
    common_scripts\utility::flag_init( "lone_star_going_down" );
    common_scripts\utility::flag_init( "rus_all_tanks_dead" );
    common_scripts\utility::flag_init( "player_teleport_after_collapse_complete" );
    common_scripts\utility::flag_init( "ambush_after_building_collapse_start" );
    common_scripts\utility::flag_init( "entered_building_collapse" );
    maps\_utility::_id_2776( "generic_earthquake", 0.35, 0.75, 2000 );
    thread precachefx();
    thread _id_4787();
    thread _id_4EA6();
    thread _id_4EA7();
    thread _id_4EA8();
    thread _id_4EA9();
    thread _id_4ABB();
    thread _id_4EB3();
    thread _id_4EAE();
    thread _id_4EB5();
    thread _id_4EB6();
    thread _id_4EBD();
    thread _id_4B9F();
    thread _id_4743();
    level thread maps\_shg_fx::_id_4456();
    thread maps\_shg_fx::_id_445E( 1000, "msg_vfx_zone1_intro" );
    thread maps\_shg_fx::_id_445E( 2000, "msg_vfx_zone2_aabuilding" );
    thread maps\_shg_fx::_id_445E( 2100, "msg_vfx_zone2_aabuilding_lvl1" );
    thread maps\_shg_fx::_id_445E( 2200, "msg_vfx_zone2_aabuilding_lvl2" );
    thread maps\_shg_fx::_id_445E( 2250, "msg_vfx_zone2_aabuilding_lvl2_stair" );
    thread maps\_shg_fx::_id_445E( 2300, "msg_vfx_zone2_aabuilding_lvl3" );
    thread maps\_shg_fx::_id_445E( 2400, "msg_vfx_zone2_aabuilding_ambExplosion" );
    thread maps\_shg_fx::_id_445E( 3000, "msg_vfx_zone3_cafecourtyard", "msg_vfx_zone3_cafecourtyard1" );
    thread maps\_shg_fx::_id_445E( 4000, "msg_vfx_zone4_riverfront" );
    thread maps\_shg_fx::_id_445E( 5000, "msg_vfx_zone5_parkway", "msg_vfx_zone5_parkway1" );
    thread maps\_shg_fx::_id_445E( 5100, "msg_vfx_zone5_parkway_intersect" );
    thread maps\_shg_fx::_id_445E( 5200, "msg_vfx_zone5_parkway_middle" );
    thread maps\_shg_fx::_id_445E( 5300, "msg_vfx_zone5_parkway_rear" );
    thread maps\_shg_fx::_id_445E( 7000, "msg_vfx_zone7_river_front" );
    thread maps\_shg_fx::_id_445E( 10000, "msg_vfx_zone10_post_collapse" );
    thread maps\_shg_fx::_id_445E( 10100, "msg_vfx_zone10_collapse_1", "msg_vfx_zone10_collapse_1a" );
    thread maps\_shg_fx::_id_445E( 10200, "msg_vfx_zone10_collapse_2" );
    thread maps\_shg_fx::_id_445E( 10300, "msg_vfx_zone10_collapse_3" );
    thread maps\_shg_fx::_id_445E( 10400, "msg_vfx_zone10_collapse_4", "msg_vfx_zone10_collapse_4a" );
    thread maps\_shg_fx::_id_445E( 10500, "msg_vfx_zone10_collapse_5", "msg_vfx_zone10_collapse_5a" );
    thread maps\_shg_fx::_id_445E( 11100, "msg_vfx_zone11_laststand_1", "msg_vfx_zone11_laststand_1a" );
    thread maps\_shg_fx::_id_445E( 11200, "msg_vfx_zone11_laststand_2" );
    thread maps\_shg_fx::_id_445E( 11300, "msg_vfx_zone11_laststand_3" );
    thread maps\_shg_fx::_id_445E( 11400, "msg_vfx_zone11_laststand_4" );
    thread maps\_shg_fx::_id_445E( 11500, "msg_vfx_zone11_laststand_3", "msg_vfx_zone11_laststand_4" );
}

precachefx()
{
    level._effect["f15_missile"] = loadfx( "smoke/smoke_geotrail_sidewinder" );
    level._effect["tank_shot_impact"] = loadfx( "explosions/tank_shell_impact_berlin" );
    level._effect["door_kick"] = loadfx( "dust/door_kick" );
    level._effect["breach_reverse_berlin"] = loadfx( "explosions/breach_reverse_berlin" );
    level._effect["a10_muzzle_flash"] = loadfx( "muzzleflashes/a10_muzzle_flash" );
    level._effect["a10_shells"] = loadfx( "shellejects/a10_shell" );
    level._effect["a10_impact"] = loadfx( "explosions/a10_explosion" );
    level._effect["a10_impact_water"] = loadfx( "water/a10_explosion_water" );
    level._effect["a10_target"] = loadfx( "misc/ui_flagbase_gold" );
    level._effect["a10_point"] = loadfx( "misc/ui_a10_target" );
    level._effect["a10_point_active"] = loadfx( "misc/ui_a10_target_active" );
    level._effect["a10_green_line"] = loadfx( "misc/ui_a10_green_line" );
    level._effect["a10_green_line_active"] = loadfx( "misc/ui_a10_green_line_active" );
    level._effect["a10_green_line_short"] = loadfx( "misc/ui_a10_green_line_short" );
    level._effect["a10_green_line_short_active"] = loadfx( "misc/ui_a10_green_line_short_active" );
    level._effect["a10_red_line"] = loadfx( "misc/ui_a10_red_line" );
    level._effect["a10_red_line_short"] = loadfx( "misc/ui_a10_red_line_short" );
    level._effect["a10_point_invalid"] = loadfx( "misc/ui_a10_target_invalid" );
    level._effect["a10_point_invalid_active"] = loadfx( "misc/ui_a10_target_invalid_active" );
    level._effect["a10_distance_number_0"] = loadfx( "misc/ui_a10_distance_number_0" );
    level._effect["a10_distance_number_1"] = loadfx( "misc/ui_a10_distance_number_1" );
    level._effect["a10_distance_number_2"] = loadfx( "misc/ui_a10_distance_number_2" );
    level._effect["a10_distance_number_3"] = loadfx( "misc/ui_a10_distance_number_3" );
    level._effect["a10_target_square"] = loadfx( "misc/ui_a10_target_square" );
    level._effect["mechanical explosion"] = loadfx( "explosions/grenadeExp_blacktop" );
    level._effect["flesh_hit"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["crash_main_01"] = loadfx( "explosions/javelin_explosion_dcburn" );
    level._effect["crash_end_01"] = loadfx( "explosions/helicopter_explosion_little_bird_dcburn" );
    level._effect["chopper_smoke_trail"] = loadfx( "fire/fire_smoke_trail_L" );
    level._effect["artillery"] = loadfx( "maps/berlin/berlin_artillery_explosion" );
    level._effect["artillery_fake"] = loadfx( "maps/berlin/berlin_artillery_explosion_fake" );
    level._effect["antiair_runner_cloudy_l"] = loadfx( "misc/antiair_runner_cloudy_l" );
    level._effect["antiair_runner_cloudy_short"] = loadfx( "misc/antiair_runner_cloudy_short" );
    level._effect["ground_fog_berlin"] = loadfx( "maps/berlin/ground_fog_berlin" );
    level._effect["battlefield_smokebank_s"] = loadfx( "smoke/battlefield_smokebank_s" );
    level._effect["battlefield_smk_directional_White_S"] = loadfx( "smoke/battlefield_smk_directional_White_S" );
    level._effect["battlefield_smk_directional_White_M"] = loadfx( "smoke/battlefield_smk_directional_White_M" );
    level._effect["battlefield_smk_directional_White_L"] = loadfx( "smoke/battlefield_smk_directional_White_L" );
    level._effect["smoke_large"] = loadfx( "smoke/smoke_large" );
    level._effect["thin_black_smoke_M"] = loadfx( "smoke/thin_black_smoke_M" );
    level._effect["thin_black_smoke_s_fast"] = loadfx( "smoke/thin_black_smoke_s_fast" );
    level._effect["firelp_small"] = loadfx( "fire/firelp_small" );
    level._effect["firelp_tiny"] = loadfx( "fire/firelp_small_pm_a" );
    level._effect["firelp_med_pm_cheap"] = loadfx( "fire/firelp_med_pm_cheap" );
    level._effect["firelp_xlarge_pm"] = loadfx( "fire/firelp_xlarge_pm" );
    level._effect["fire_line_sm"] = loadfx( "fire/fire_line_sm" );
    level._effect["fire_line_sm_cheap"] = loadfx( "fire/fire_line_sm_cheap" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fire/firelp_small_streak_pm_h" );
    level._effect["firelp_small_streak_pm_v_nolight"] = loadfx( "fire/firelp_small_streak_pm_v_nolight" );
    level._effect["fire_med_pm_nolight_atlas"] = loadfx( "fire/fire_med_pm_nolight_atlas" );
    level._effect["firelp_med_pm_far"] = loadfx( "fire/firelp_med_pm_far" );
    level._effect["fire_embers_directional_slow"] = loadfx( "fire/fire_embers_directional_slow" );
    level._effect["fireball_smk_S"] = loadfx( "fire/fireball_lp_smk_S" );
    level._effect["fireball_smk_M"] = loadfx( "fire/fireball_lp_smk_M" );
    level._effect["fireball_smk_M_grounded"] = loadfx( "fire/fireball_lp_smk_M_grounded" );
    level._effect["fireball_smk_M_grounded_lightLOD"] = loadfx( "fire/fireball_lp_smk_M_grounded_lightLOD" );
    level._effect["fireball_smk_L"] = loadfx( "fire/fireball_lp_smk_L" );
    level._effect["fire_ceiling_md_slow"] = loadfx( "fire/fire_ceiling_md_slow" );
    level._effect["embers_trees"] = loadfx( "fire/embers_trees" );
    level._effect["fire_falling_runner_point_infrequent"] = loadfx( "fire/fire_falling_runner_point_infrequent" );
    level._effect["smk_column_giant_berlin"] = loadfx( "maps/berlin/smk_column_giant_berlin" );
    level._effect["smk_column_giant_berlin_stop"] = loadfx( "maps/berlin/smk_column_giant_berlin" );
    level._effect["skybox_hind_flyby_loop"] = loadfx( "misc/skybox_hind_flyby" );
    level._effect["skybox_hind_flyby"] = loadfx( "misc/skybox_hind_flyby" );
    level._effect["lights_godray_beam"] = loadfx( "lights/lights_godray_beam_bright" );
    level._effect["lights_godray_beam_l"] = loadfx( "lights/lights_godray_beam_l" );
    level._effect["lights_uplight_haze"] = loadfx( "lights/lights_uplight_haze" );
    level._effect["lights_conelight_smokey"] = loadfx( "lights/lights_conelight_smokey" );
    level._effect["lights_headlight_harbor"] = loadfx( "lights/lights_headlight_harbor" );
    level._effect["smoke_wall_m_warm_berlin"] = loadfx( "maps/berlin/smoke_wall_m_warm_berlin" );
    level._effect["smk_shadow_m_berlin"] = loadfx( "maps/berlin/smk_shadow_m_berlin" );
    level._effect["fire_generic_atlas"] = loadfx( "fire/fire_generic_atlas" );
    level._effect["fire_generic_atlas_small"] = loadfx( "fire/fire_generic_atlas_small" );
    level._effect["fire_generic_atlas_nolight"] = loadfx( "fire/fire_generic_atlas_nolight" );
    level._effect["bridge_water_splash"] = loadfx( "maps/berlin/bridge_water_splash" );
    level._effect["bridge_water_splash2"] = loadfx( "maps/berlin/bridge_water_splash2" );
    level._effect["amb_dust_small"] = loadfx( "smoke/amb_dust_small" );
    level._effect["ship_edge_foam_oriented"] = loadfx( "water/ship_edge_foam_oriented" );
    level._effect["chinook_red_light"] = loadfx( "misc/berlin_heli_red_blink" );
    level._effect["window_explosion"] = loadfx( "explosions/window_explosion_cheap" );
    level._effect["window_explosion_glassy"] = loadfx( "explosions/window_explosion_glassy" );
    level._effect["window_explosion_glassy_med"] = loadfx( "explosions/window_explosion_glassy_med" );
    level._effect["small_vehicle_explosion_nofire"] = loadfx( "explosions/small_vehicle_explosion_nofire" );
    level._effect["generic_explosion"] = loadfx( "explosions/generic_explosion" );
    level._effect["steam_solar_panels"] = loadfx( "smoke/steam_solar_panels" );
    level._effect["steam_manhole"] = loadfx( "smoke/steam_manhole" );
    level._effect["steam_large_vent_rooftop"] = loadfx( "smoke/steam_large_vent_rooftop" );
    level._effect["paper_falling"] = loadfx( "misc/paper_falling" );
    level._effect["paper_blowing_trash"] = loadfx( "misc/paper_blowing_trash" );
    level._effect["dust_wind_slow_paper"] = loadfx( "dust/dust_wind_slow_paper" );
    level._effect["dust_wind_fast_paper"] = loadfx( "dust/dust_wind_fast_paper" );
    level._effect["powerline_runner"] = loadfx( "explosions/powerline_runner" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner_cheap" );
    level._effect["trash_spiral_runner_far"] = loadfx( "misc/trash_spiral_runner_far" );
    level._effect["cloud_ash_lite"] = loadfx( "weather/cloud_ash_lite" );
    level._effect["smoke_geotrail_genericexplosion"] = loadfx( "smoke/smoke_geotrail_genericexplosion_d" );
    level._effect["water_pipe_spray"] = loadfx( "water/water_pipe_spray" );
    level._effect["water_drips_fat_fast_speed"] = loadfx( "water/water_drips_fat_fast_speed" );
    level._effect["drips_fast"] = loadfx( "misc/drips_fast" );
    level._effect["drips_slow"] = loadfx( "misc/drips_slow" );
    level._effect["falling_dirt_light_1_runner"] = loadfx( "dust/falling_dirt_light_1_runner" );
    level._effect["smoke_white_room_linger"] = loadfx( "smoke/smoke_white_room_linger" );
    level._effect["powerline_runner_berlin"] = loadfx( "explosions/powerline_runner_berlin" );
    level._effect["power_tower_light_red_blink"] = loadfx( "misc/power_tower_light_red_blink" );
    level._effect["room_explode"] = loadfx( "explosions/tankshell_wallImpact" );
    level._effect["tank_shell_impact"] = loadfx( "explosions/tank_shell_impact_berlin" );
    level._effect["smoke_sniper_building_top"] = loadfx( "maps/berlin/smoke_sniper_building_top" );
    level._effect["smoke_sniper_building_bottom"] = loadfx( "maps/berlin/smoke_sniper_building_bottom" );
    level._effect["skybox_smoke_berlin"] = loadfx( "maps/berlin/skybox_smoke_berlin" );
    level._effect["skybox_mist_berlin"] = loadfx( "maps/berlin/skybox_mist_berlin" );
    level._effect["skybox_smoke_wide_berlin"] = loadfx( "maps/berlin/skybox_smoke_wide_berlin" );
    level._effect["t90_flash_berlin_closeup"] = loadfx( "muzzleflashes/t90_flash_berlin_closeup" );
    level._effect["tank_dirt"] = loadfx( "maps/berlin/tank_dirt" );
    level._effect["tank_dirt1"] = loadfx( "maps/berlin/tank_dirt1" );
    level._effect["tank_destroy_cover"] = loadfx( "explosions/tank_shell_impact_cover" );
    level._effect["building_mega_explosion"] = loadfx( "maps/berlin/building_explosion_ground_megasmk_berlin" );
    level._effect["building_explosion_smk_column"] = loadfx( "maps/berlin/building_explosion_smk_column_berlin" );
    level._effect["building_explosion_smk_forward"] = loadfx( "maps/berlin/building_explosion_smk_forward_berlin" );
    level._effect["building_explosion_init_shock"] = loadfx( "maps/berlin/building_explosion_init_shk_berlin" );
    level._effect["building_collapse_glass_explosion1"] = loadfx( "maps/berlin/building_explosion_glass1_berlin" );
    level._effect["building_collapse_glass_explosion2"] = loadfx( "maps/berlin/building_explosion_glass2_berlin" );
    level._effect["building_collapse_rolling_smk"] = loadfx( "maps/berlin/building_collapse_rolling_smk_berlin" );
    level._effect["building_collapse_glassfall_berlin"] = loadfx( "maps/berlin/building_collapse_glassfall_berlin" );
    level._effect["building_explosion_collide"] = loadfx( "maps/berlin/building_explosion_collide_berlin" );
    level._effect["building_collide_smk_shadow_berlin"] = loadfx( "maps/berlin/building_collide_smk_shadow_berlin" );
    level._effect["building_falling_explosion_berlin"] = loadfx( "maps/berlin/building_falling_explosion_berlin" );
    level._effect["fire_smoke_trail_emitter"] = loadfx( "fire/fire_smoke_white_trail_l_emitter_light" );
    level._effect["building_falling_debris_down_berlin"] = loadfx( "maps/berlin/building_falling_debris_down_berlin" );
    level._effect["building_falling_debris_down_berlin_tiny"] = loadfx( "maps/berlin/building_falling_debris_down_berlin_tiny" );
    level._effect["window_explosion_glassy_med_smk_up"] = loadfx( "explosions/window_explosion_glassy_med_smk_up" );
    level._effect["sparks_subway_truck_collision"] = loadfx( "misc/sparks_subway_truck_collision" );
    level._effect["vehicle_explosion_flash"] = loadfx( "explosions/vehicle_explosion_flash" );
    level._effect["smoke_trail_grey_giant_short_emitter"] = loadfx( "smoke/smoke_trail_grey_giant_short_emitter" );
    level._effect["building_explosion_paperfall_berlin"] = loadfx( "maps/berlin/building_explosion_paperfall_berlin" );
    level._effect["window_explosion_glassy_less_fiery"] = loadfx( "explosions/window_explosion_glassy_less_fiery" );
    level._effect["building_collide_ceiling_fall"] = loadfx( "maps/berlin/building_collide_ceiling_fall" );
    level._effect["berlin_dustfall_player_hand"] = loadfx( "maps/berlin/berlin_dustfall_player_hand" );
    level._effect["building_aftermath_street_ash"] = loadfx( "dust/building_collapse_street_dust_ash" );
    level._effect["smk_giant_block_postcollapse_berlin"] = loadfx( "maps/berlin/smk_giant_block_postcollapse_berlin" );
    level._effect["smk_giant_thin_postcollapse_berlin"] = loadfx( "maps/berlin/smk_giant_thin_postcollapse_berlin" );
    level._effect["berlin_postcollapse_ground_dust"] = loadfx( "maps/berlin/berlin_postcollapse_ground_dust" );
    level._effect["berlin_postcollapse_obscure_smk_l"] = loadfx( "maps/berlin/berlin_postcollapse_obscure_smk_l" );
    level._effect["berlin_postcollapse_obscure_smk_m"] = loadfx( "maps/berlin/berlin_postcollapse_obscure_smk_m" );
    level._effect["berlin_postcollapse_obscure_smk_m_thick"] = loadfx( "maps/berlin/berlin_postcollapse_obscure_smk_m_thick" );
    level._effect["berlin_postcollapse_obscure_smk_s"] = loadfx( "maps/berlin/berlin_postcollapse_obscure_smk_s" );
    level._effect["berlin_postcollapse_obscure_smk_v"] = loadfx( "maps/berlin/berlin_postcollapse_obscure_smk_v" );
    level._effect["berlin_postcollapse_obscure_smk_wide"] = loadfx( "maps/berlin/berlin_postcollapse_obscure_smk_wide" );
    level._effect["berlin_postcollapse_grn_haze"] = loadfx( "maps/berlin/berlin_postcollapse_grn_haze" );
    level._effect["berlin_postcollapse_grn_haze_sun"] = loadfx( "maps/berlin/berlin_postcollapse_grn_haze_sun" );
    level._effect["berlin_postcollapse_embers"] = loadfx( "maps/berlin/berlin_postcollapse_embers" );
    level._effect["firelp_med_pm_cheap2"] = loadfx( "maps/berlin/firelp_med_pm_cheap2" );
    level._effect["pipe_fire_looping"] = loadfx( "impacts/pipe_fire_looping" );
    level._effect["berlin_postcollapse_ray"] = loadfx( "maps/berlin/berlin_postcollapse_ray" );
    level._effect["berlin_postcollapse_ray_sm"] = loadfx( "maps/berlin/berlin_postcollapse_ray_sm" );
    level._effect["berlin_postcollapse_powerlines"] = loadfx( "maps/berlin/berlin_postcollapse_powerlines" );
    level._effect["berlin_postcollapse_falling_dirt"] = loadfx( "maps/berlin/berlin_postcollapse_falling_dirt" );
    level._effect["postcollapse_falling_dirt_camShk"] = loadfx( "maps/berlin/berlin_postcollapse_falling_dirt_camShk" );
    level._effect["ceiling_falling_tile"] = loadfx( "dust/ceiling_falling_tile" );
    level._effect["rock_falling"] = loadfx( "misc/rock_falling" );
    level._effect["falling_objects"] = loadfx( "maps/berlin/berlin_postcollapse_office_objects_fall" );
    level._effect["column_fall_dust_impact"] = loadfx( "dust/column_fall_dust_impact" );
    level._effect["column_fall_dust_impact_wide"] = loadfx( "dust/column_fall_dust_impact_wide" );
    level._effect["ibeam_fall_dust_wide_berlin"] = loadfx( "maps/berlin/ibeam_fall_dust_wide_berlin" );
    level._effect["berlin_ceiling_collapse_dust"] = loadfx( "maps/berlin/berlin_ceiling_collapse_dust" );
    level._effect["hallway_collapse_smk_runner_short_lite"] = loadfx( "smoke/hallway_collapse_smk_runner_short_lite" );
    level._effect["falling_water_trickle_infrequent"] = loadfx( "water/falling_water_trickle_infrequent" );
    level._effect["water_faucet_spray"] = loadfx( "water/water_faucet_spray" );
    level._effect["water_flow_sewage_small"] = loadfx( "water/water_flow_sewage_small" );
    level._effect["waterfall_drainage_mp_small"] = loadfx( "water/waterfall_drainage_mp_small" );
    level._effect["ash_aftermath_250x250"] = loadfx( "weather/ash_aftermath_250x250" );
    level._effect["amb_dust_verylight_small_grey"] = loadfx( "dust/amb_dust_verylight_small_grey" );
    level._effect["smoke_dust_poof"] = loadfx( "smoke/smoke_dust_poof" );
    level._effect["heli_dust_berlin"] = loadfx( "treadfx/heli_dust_berlin" );
    level._effect["heli_dust_berlin2"] = loadfx( "treadfx/heli_dust_berlin2" );
    level._effect["heli_water_berlin"] = loadfx( "treadfx/heli_water_berlin" );
    level._effect["tread_dust_berlin"] = loadfx( "treadfx/tread_dust_berlin" );
    level._effect["a10_tread_dust_berlin"] = loadfx( "treadfx/a10_tread_dust_berlin" );
}

_id_4743()
{
    setsaveddvar( "fx_alphathreshold", 5 );
    common_scripts\utility::flag_wait( "trigger_vfx_expl_heli_ride" );
    setsaveddvar( "fx_alphathreshold", 12 );
    level waittill( "building_fall_se_vfx_start" );
    setsaveddvar( "fx_alphathreshold", 15 );
    common_scripts\utility::flag_wait( "ambush_after_building_collapse_start" );
    setsaveddvar( "fx_alphathreshold", 10 );
}

_id_4780()
{
    var_0[0] = "script_vehicle_littlebird_player";
    var_0[1] = "script_vehicle_littlebird_bench";
    var_0[2] = "script_vehicle_apache_dark";
    var_1 = "treadfx/heli_dust_berlin";
    var_2 = "treadfx/heli_water_berlin";
    level._id_2A9C = 5000;

    foreach ( var_4 in var_0 )
    {
        maps\_treadfx::_id_28EF( var_4, "brick", var_1 );
        maps\_treadfx::_id_28EF( var_4, "bark", var_1 );
        maps\_treadfx::_id_28EF( var_4, "carpet", var_1 );
        maps\_treadfx::_id_28EF( var_4, "cloth", var_1 );
        maps\_treadfx::_id_28EF( var_4, "concrete", var_1 );
        maps\_treadfx::_id_28EF( var_4, "dirt", var_1 );
        maps\_treadfx::_id_28EF( var_4, "flesh", var_1 );
        maps\_treadfx::_id_28EF( var_4, "foliage", var_1 );
        maps\_treadfx::_id_28EF( var_4, "glass", var_1 );
        maps\_treadfx::_id_28EF( var_4, "grass", var_1 );
        maps\_treadfx::_id_28EF( var_4, "gravel", var_1 );
        maps\_treadfx::_id_28EF( var_4, "ice", var_1 );
        maps\_treadfx::_id_28EF( var_4, "metal", var_1 );
        maps\_treadfx::_id_28EF( var_4, "mud", var_1 );
        maps\_treadfx::_id_28EF( var_4, "paper", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plaster", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rock", var_1 );
        maps\_treadfx::_id_28EF( var_4, "sand", var_1 );
        maps\_treadfx::_id_28EF( var_4, "snow", var_1 );
        maps\_treadfx::_id_28EF( var_4, "water", var_2 );
        maps\_treadfx::_id_28EF( var_4, "wood", var_1 );
        maps\_treadfx::_id_28EF( var_4, "asphalt", var_1 );
        maps\_treadfx::_id_28EF( var_4, "ceramic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plastic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rubber", var_1 );
        maps\_treadfx::_id_28EF( var_4, "cushion", var_1 );
        maps\_treadfx::_id_28EF( var_4, "fruit", var_1 );
        maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_1 );
        maps\_treadfx::_id_28EF( var_4, "riotshield", var_1 );
        maps\_treadfx::_id_28EF( var_4, "slush", var_1 );
        maps\_treadfx::_id_28EF( var_4, "default", var_1 );
        maps\_treadfx::_id_28EF( var_4, "none" );
    }

    var_6[0] = "script_vehicle_ny_harbor_hind";
    var_6[1] = "script_vehicle_hind_woodland";
    var_1 = "treadfx/heli_dust_berlin2";

    foreach ( var_4 in var_6 )
    {
        maps\_treadfx::_id_28EF( var_4, "brick", var_1 );
        maps\_treadfx::_id_28EF( var_4, "bark", var_1 );
        maps\_treadfx::_id_28EF( var_4, "carpet", var_1 );
        maps\_treadfx::_id_28EF( var_4, "cloth", var_1 );
        maps\_treadfx::_id_28EF( var_4, "concrete", var_1 );
        maps\_treadfx::_id_28EF( var_4, "dirt", var_1 );
        maps\_treadfx::_id_28EF( var_4, "flesh", var_1 );
        maps\_treadfx::_id_28EF( var_4, "foliage", var_1 );
        maps\_treadfx::_id_28EF( var_4, "glass", var_1 );
        maps\_treadfx::_id_28EF( var_4, "grass", var_1 );
        maps\_treadfx::_id_28EF( var_4, "gravel", var_1 );
        maps\_treadfx::_id_28EF( var_4, "ice", var_1 );
        maps\_treadfx::_id_28EF( var_4, "metal", var_1 );
        maps\_treadfx::_id_28EF( var_4, "mud", var_1 );
        maps\_treadfx::_id_28EF( var_4, "paper", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plaster", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rock", var_1 );
        maps\_treadfx::_id_28EF( var_4, "sand", var_1 );
        maps\_treadfx::_id_28EF( var_4, "snow", var_1 );
        maps\_treadfx::_id_28EF( var_4, "water", var_2 );
        maps\_treadfx::_id_28EF( var_4, "wood", var_1 );
        maps\_treadfx::_id_28EF( var_4, "asphalt", var_1 );
        maps\_treadfx::_id_28EF( var_4, "ceramic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plastic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rubber", var_1 );
        maps\_treadfx::_id_28EF( var_4, "cushion", var_1 );
        maps\_treadfx::_id_28EF( var_4, "fruit", var_1 );
        maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_1 );
        maps\_treadfx::_id_28EF( var_4, "riotshield", var_1 );
        maps\_treadfx::_id_28EF( var_4, "slush", var_1 );
        maps\_treadfx::_id_28EF( var_4, "default", var_1 );
        maps\_treadfx::_id_28EF( var_4, "none" );
    }

    var_9[0] = "script_vehicle_leopard_2a7";
    var_9[1] = "script_vehicle_t90_tank_woodland_berlin";
    var_1 = "treadfx/tread_dust_berlin";

    foreach ( var_11 in var_9 )
    {
        maps\_treadfx::_id_28EF( var_11, "brick", var_1 );
        maps\_treadfx::_id_28EF( var_11, "bark", var_1 );
        maps\_treadfx::_id_28EF( var_11, "carpet", var_1 );
        maps\_treadfx::_id_28EF( var_11, "cloth", var_1 );
        maps\_treadfx::_id_28EF( var_11, "concrete", var_1 );
        maps\_treadfx::_id_28EF( var_11, "dirt", var_1 );
        maps\_treadfx::_id_28EF( var_11, "flesh", var_1 );
        maps\_treadfx::_id_28EF( var_11, "foliage", var_1 );
        maps\_treadfx::_id_28EF( var_11, "glass", var_1 );
        maps\_treadfx::_id_28EF( var_11, "grass", var_1 );
        maps\_treadfx::_id_28EF( var_11, "gravel", var_1 );
        maps\_treadfx::_id_28EF( var_11, "ice", var_1 );
        maps\_treadfx::_id_28EF( var_11, "metal", var_1 );
        maps\_treadfx::_id_28EF( var_11, "mud", var_1 );
        maps\_treadfx::_id_28EF( var_11, "paper", var_1 );
        maps\_treadfx::_id_28EF( var_11, "plaster", var_1 );
        maps\_treadfx::_id_28EF( var_11, "rock", var_1 );
        maps\_treadfx::_id_28EF( var_11, "sand", var_1 );
        maps\_treadfx::_id_28EF( var_11, "snow", var_1 );
        maps\_treadfx::_id_28EF( var_11, "wood", var_1 );
        maps\_treadfx::_id_28EF( var_11, "asphalt", var_1 );
        maps\_treadfx::_id_28EF( var_11, "ceramic", var_1 );
        maps\_treadfx::_id_28EF( var_11, "plastic", var_1 );
        maps\_treadfx::_id_28EF( var_11, "rubber", var_1 );
        maps\_treadfx::_id_28EF( var_11, "cushion", var_1 );
        maps\_treadfx::_id_28EF( var_11, "fruit", var_1 );
        maps\_treadfx::_id_28EF( var_11, "paintedmetal", var_1 );
        maps\_treadfx::_id_28EF( var_11, "riotshield", var_1 );
        maps\_treadfx::_id_28EF( var_11, "slush", var_1 );
        maps\_treadfx::_id_28EF( var_11, "default", var_1 );
        maps\_treadfx::_id_28EF( var_11, "none" );
    }

    var_13[0] = "script_vehicle_a10_warthog";
    var_1 = "treadfx/a10_tread_dust_berlin";
    var_2 = "treadfx/heli_water_berlin";
    level._id_2A9C = 3000;

    foreach ( var_4 in var_13 )
    {
        maps\_treadfx::_id_28EF( var_4, "brick", var_1 );
        maps\_treadfx::_id_28EF( var_4, "bark", var_1 );
        maps\_treadfx::_id_28EF( var_4, "carpet", var_1 );
        maps\_treadfx::_id_28EF( var_4, "cloth", var_1 );
        maps\_treadfx::_id_28EF( var_4, "concrete", var_1 );
        maps\_treadfx::_id_28EF( var_4, "dirt", var_1 );
        maps\_treadfx::_id_28EF( var_4, "flesh", var_1 );
        maps\_treadfx::_id_28EF( var_4, "foliage", var_1 );
        maps\_treadfx::_id_28EF( var_4, "glass", var_1 );
        maps\_treadfx::_id_28EF( var_4, "grass", var_1 );
        maps\_treadfx::_id_28EF( var_4, "gravel", var_1 );
        maps\_treadfx::_id_28EF( var_4, "ice", var_1 );
        maps\_treadfx::_id_28EF( var_4, "metal", var_1 );
        maps\_treadfx::_id_28EF( var_4, "mud", var_1 );
        maps\_treadfx::_id_28EF( var_4, "paper", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plaster", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rock", var_1 );
        maps\_treadfx::_id_28EF( var_4, "sand", var_1 );
        maps\_treadfx::_id_28EF( var_4, "snow", var_1 );
        maps\_treadfx::_id_28EF( var_4, "water", var_2 );
        maps\_treadfx::_id_28EF( var_4, "wood", var_1 );
        maps\_treadfx::_id_28EF( var_4, "asphalt", var_1 );
        maps\_treadfx::_id_28EF( var_4, "ceramic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plastic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rubber", var_1 );
        maps\_treadfx::_id_28EF( var_4, "cushion", var_1 );
        maps\_treadfx::_id_28EF( var_4, "fruit", var_1 );
        maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_1 );
        maps\_treadfx::_id_28EF( var_4, "riotshield", var_1 );
        maps\_treadfx::_id_28EF( var_4, "slush", var_1 );
        maps\_treadfx::_id_28EF( var_4, "default", var_1 );
        maps\_treadfx::_id_28EF( var_4, "none" );
    }
}

_id_4EA6()
{
    common_scripts\utility::flag_wait( "player_unloaded_from_intro_flight" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "fireball_smk_M" && var_1.v["type"] == "oneshotfx" || var_1.v["fxid"] == "thin_black_smoke_M" && var_1.v["type"] == "oneshotfx" || var_1.v["fxid"] == "ground_fog_berlin" && var_1.v["type"] == "oneshotfx" || var_1.v["fxid"] == "smk_column_giant_berlin_stop" && var_1.v["type"] == "oneshotfx" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4EA7()
{
    common_scripts\utility::flag_wait( "sniper_complete" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "smk_column_giant_berlin" && var_1.v["type"] == "oneshotfx" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4EA8()
{
    common_scripts\utility::flag_wait( "rus_all_tanks_dead" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "skybox_smoke_berlin" && var_1.v["type"] == "exploder" || var_1.v["fxid"] == "skybox_mist_berlin" && var_1.v["type"] == "exploder" || var_1.v["fxid"] == "skybox_smoke_wide_berlin" && var_1.v["type"] == "exploder" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4EA9()
{
    common_scripts\utility::flag_wait( "lone_star_going_down" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "fireball_smk_M" && var_1.v["type"] == "exploder" || var_1.v["fxid"] == "ground_fog_berlin" && var_1.v["type"] == "exploder" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4787()
{
    common_scripts\utility::flag_wait( "player_interacting_with_wounded_lonestar" );

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["type"] == "oneshotfx" || var_1.v["type"] == "exploder" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4EAA()
{
    playfxontag( common_scripts\utility::getfx( "smoke_trail_grey_giant_short_emitter" ), self, "jnt_building_piece_d_lod01_4" );
    wait 5;
    stopfxontag( common_scripts\utility::getfx( "smoke_trail_grey_giant_short_emitter" ), self, "jnt_building_piece_d_lod01_4" );
}

_id_4EAB()
{
    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    level notify( "building_fall_se_vfx_start" );
    common_scripts\utility::exploder( 501 );
    wait 0.1;
    common_scripts\utility::exploder( 551 );
    wait 0.1;
    common_scripts\utility::exploder( 552 );
    wait 0.45;
    common_scripts\utility::exploder( 510 );
    common_scripts\utility::exploder( 505 );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );

    wait 0.55;
    common_scripts\utility::exploder( 590 );
    wait 1.75;
    common_scripts\utility::exploder( 591 );
    wait 1.75;
    common_scripts\utility::exploder( 592 );
    wait 3.25;
    common_scripts\utility::exploder( 601 );
    wait 0.0;
    common_scripts\utility::exploder( 593 );
    wait 0.35;
    maps\_audio::aud_send_msg( "building_collide" );
    common_scripts\utility::exploder( 599 );
    wait 0;
    common_scripts\utility::exploder( 602 );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    wait 1.95;
    common_scripts\utility::exploder( 594 );
    wait 3.2;
    common_scripts\utility::exploder( 595 );
    wait 3.5;
    common_scripts\utility::exploder( 596 );
    wait 1.3;
    common_scripts\utility::exploder( 597 );
    wait 0.4;
    common_scripts\utility::exploder( 598 );
    common_scripts\utility::flag_wait( "entered_building_collapse" );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_4EAC()
{
    thread _id_4EAD();
    wait 5.5;
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Pinky_RI_0" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Mid_RI_1" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Thumb_RI_1" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Index_RI_2" );
    wait 1.0;
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Mid_RI_1" );
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Thumb_RI_1" );
    wait 1.05;
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Index_RI_2" );
    wait 1.25;
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Pinky_RI_0" );
}

_id_4EAD()
{
    wait 6.55;
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Pinky_LE_0" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Mid_LE_2" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Pinky_LE_2" );
    wait 0.25;
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_PinkyPalm_RI" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Ring_LE_0" );
    playfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Ring_LE_2" );
    wait 4.35;
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Pinky_LE_0" );
    wait 0.25;
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Mid_LE_2" );
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Pinky_LE_2" );
    wait 0.5;
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_PinkyPalm_RI" );
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Ring_LE_0" );
    stopfxontag( common_scripts\utility::getfx( "berlin_dustfall_player_hand" ), self, "J_Ring_LE_2" );
}

_id_4EAE()
{
    common_scripts\utility::flag_wait( "player_teleport_after_collapse_complete" );
    wait 5.0;
    maps\_shg_fx::_id_4467( 602 );
}

_id_4EAF()
{
    playfxontag( common_scripts\utility::getfx( "falling_dirt_light_1_runner" ), self, "jnt_piece02_mid" );
    playfxontag( common_scripts\utility::getfx( "falling_dirt_light_1_runner" ), self, "jnt_piece01_mid" );
    wait 0.3;
    stopfxontag( common_scripts\utility::getfx( "falling_dirt_light_1_runner" ), self, "jnt_piece02_mid" );
    stopfxontag( common_scripts\utility::getfx( "falling_dirt_light_1_runner" ), self, "jnt_piece01_mid" );
    wait 1.38;
    common_scripts\utility::exploder( 10005 );
}

_id_4EB0()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 0.1;
    var_1["nearEnd"] = 0.2;
    var_1["nearBlur"] = 4.0;
    var_1["farStart"] = 1000;
    var_1["farEnd"] = 15000;
    var_1["farBlur"] = 1.25;
    maps\_utility::_id_27C0( var_0, var_1, 0.2 );
    wait 33;
    maps\_utility::_id_27C0( var_1, var_0, 0.5 );
}

_id_4EB1()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 50.0;
    var_1["nearEnd"] = 800;
    var_1["nearBlur"] = 9.0;
    var_1["farStart"] = 1000;
    var_1["farEnd"] = 15000;
    var_1["farBlur"] = 1.25;
    maps\_utility::_id_27C0( var_0, var_1, 0.05 );
    wait 18;
    maps\_utility::_id_27C0( var_1, var_0, 0.25 );
}

_id_4EB2()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 0.1;
    var_1["nearEnd"] = 0.2;
    var_1["nearBlur"] = 4.0;
    var_1["farStart"] = 150;
    var_1["farEnd"] = 1000;
    var_1["farBlur"] = 1.8;
    maps\_utility::_id_27C0( var_0, var_1, 1.2 );
    wait 8.5;
    maps\_utility::_id_27C0( var_1, var_0, 1.0 );
}

_id_4ABB()
{
    wait 0.2;
    common_scripts\utility::exploder( 999 );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "start_bridge_battle" );
        wait 12.0;
        common_scripts\utility::exploder( 999 );
    }
}

_id_4EB3()
{
    wait 0.2;

    for (;;)
    {
        common_scripts\utility::flag_wait_any( "msg_vfx_zone3_cafecourtyard", "msg_vfx_zone3_cafecourtyard1" );
        wait 8.0;
        common_scripts\utility::exploder( 3005 );
    }
}

_id_4EB4( var_0 )
{
    common_scripts\utility::flag_wait( "reverse_breach_door_blown" );
    playfxontag( common_scripts\utility::getfx( "chinook_red_light" ), var_0, "tag_light_cargo01" );
}

_id_4EB5()
{
    wait 1.5;
    thread maps\_shg_fx::_id_4454( 2401, "smoke_geotrail_genericexplosion", 0, 500, 2000, 10, 30, 200, 90, 1200 );
    var_0 = [ ( -1369.81, 13555.2, 2514.43 ), ( -3838.98, 13354.3, 1618.75 ), ( -2065.98, 7277.36, 1238.13 ), ( -4835.05, 9188.86, 805.181 ), ( -5496.43, 9459.58, 1297.62 ), ( -4903.03, 8583.96, 855.278 ), ( 2644.42, 10595.0, 1485.75 ), ( 3187.99, 11704.7, 1679.51 ), ( 2098.51, 12829.1, 1768.11 ), ( 3613.51, 8318.4, 845.943 ), ( 7045.14, 8380.4, 2040.43 ), ( 6080.14, 11559.4, 1579.43 ), ( 2764.97, 12334.5, 1339.39 ), ( 2582.02, 10357.0, 1500.13 ), ( 3826.83, 13539.7, 1900.73 ), ( 3495.43, 10239.9, 1419.98 ), ( 5392.93, 12609.4, 1693.98 ), ( -406.105, 12185.3, 1435.13 ), ( -998.955, 12576.2, 2065.53 ), ( -1115.08, 13750.3, 2717.23 ), ( -3267.8, 13182.6, 1589.47 ), ( -1377.31, 13537.0, 1135.38 ), ( -5929.24, 10441.3, 1535.01 ), ( -3460.5, 13598.2, 1659.74 ), ( -4559.18, 13904.3, 1272.13 ), ( -2090.86, 8000.55, 35.854 ), ( -2340.3, 11785.6, 1062.74 ) ];

    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_vfx_zone2_aabuilding_ambExplosion" );
        var_1 = randomfloatrange( -0.35, 0.35 ) + 1;
        wait(var_1);
        var_2 = [];
        var_3 = level.player getplayerangles();
        var_4 = vectornormalize( anglestoforward( var_3 ) );
        var_5 = maps\_shg_fx::_id_446A( 2401 );
        var_6 = -1;
        var_7 = [];

        for ( var_8 = 0; var_8 < var_0.size; var_8++ )
        {
            if ( !isdefined( var_5 ) )
                continue;

            var_9 = vectornormalize( var_0[var_8] - level.player.origin );

            if ( vectordot( var_4, var_9 ) > 0.45 )
            {
                var_6 = 1;
                var_7[var_7.size] = var_0[var_8];
            }
        }

        if ( var_6 > 0 )
        {
            var_10 = randomint( var_7.size + 1 );

            if ( isdefined( var_10 ) )
            {
                var_5.v["origin"] = var_7[var_10];

                if ( isdefined( var_5.v["origin"] ) && isdefined( var_5 ) )
                    common_scripts\utility::exploder( 2401 );

                maps\_audio::aud_send_msg( "msg_audio_fx_ambientExp", var_7[var_10] );
            }

            wait 2;
        }
    }
}

_id_4EB6()
{
    wait 2.0;
    thread maps\_shg_fx::_id_4454( 2402, "smoke_geotrail_genericexplosion", 0, 500, 2000, 10, 30, 200, 90, 1200 );
    var_0 = [ ( -1090.31, 13627.0, 2063.58 ), ( -3444.3, 12973.4, 1327.57 ), ( -4394.97, 8652.0, 765.306 ), ( -5419.45, 9741.96, 1108.4 ), ( -4710.04, 14298.0, 1988.96 ), ( -275.195, 11501.1, 1133.94 ) ];

    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_vfx_zone2_aabuilding_ambExplosion" );
        var_1 = randomfloatrange( -0.45, 0.45 ) + 1;
        wait(var_1);
        var_2 = [];
        var_3 = level.player getplayerangles();
        var_4 = vectornormalize( anglestoforward( var_3 ) );
        var_5 = maps\_shg_fx::_id_446A( 2402 );
        var_6 = -1;
        var_7 = [];

        for ( var_8 = 0; var_8 < var_0.size; var_8++ )
        {
            if ( !isdefined( var_5 ) )
                continue;

            var_9 = vectornormalize( var_0[var_8] - level.player.origin );

            if ( vectordot( var_4, var_9 ) > 0.45 )
            {
                var_6 = 1;
                var_7[var_7.size] = var_0[var_8];
            }
        }

        if ( var_6 > 0 )
        {
            var_10 = randomint( var_7.size + 1 );

            if ( isdefined( var_10 ) )
            {
                var_5.v["origin"] = var_7[var_10];

                if ( isdefined( var_5.v["origin"] ) && isdefined( var_5 ) )
                    common_scripts\utility::exploder( 2402 );

                maps\_audio::aud_send_msg( "msg_audio_fx_ambientExp", var_7[var_10] );
            }

            wait 2;
        }
    }
}

_id_4EB7()
{
    common_scripts\utility::exploder( 255 );
}

_id_4EB8()
{
    common_scripts\utility::exploder( 256 );
    wait 0.05;
    common_scripts\utility::exploder( 257 );
    wait 0.05;

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "lights_godray_beam" && var_1.v["type"] == "exploder" )
            var_1 common_scripts\utility::pauseeffect();
    }

    wait 40.0;

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["fxid"] == "lights_godray_beam_l" && var_1.v["type"] == "exploder" )
            var_1 common_scripts\utility::pauseeffect();
    }
}

_id_4EB9()
{
    wait 0.4;
    common_scripts\utility::exploder( 258 );
}

_id_4EBA()
{
    wait 0.4;
    common_scripts\utility::exploder( 259 );
}

_id_4EBB( var_0 )
{
    wait 1;
    common_scripts\utility::exploder( 500 );
}

_id_4EBC( var_0 )
{
    wait 5.5;
    common_scripts\utility::exploder( 499 );
}

_id_4EBD()
{
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "bridge_one_tank_destroyed" );
    common_scripts\utility::exploder( 4040 );
}

_id_4BEF( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( level.player istouching( var_2 ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

_id_4B9F()
{
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait_any( "msg_vfx_zone10_collapse_2", "msg_vfx_zone2_aabuilding_lvl1" );
    var_0 = getentarray( "sub_water_sheeting_vol", "targetname" );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::flag_wait_any( "msg_vfx_zone10_collapse_2", "msg_vfx_zone2_aabuilding_lvl1" );

        if ( _id_4BEF( var_0 ) )
        {
            if ( var_1 == 0 )
            {
                level.player setwatersheeting( 1 );
                var_1 = 1;
            }

            wait 0.05;
            continue;
        }

        if ( var_1 == 1 )
        {
            level.player setwatersheeting( 1, 0.5 );
            var_1 = 0;
            wait 0.05;
            continue;
        }

        wait 0.05;
    }
}
