// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread precachefx();
    _id_5146::main();
    maps\_shg_fx::_id_4445();
    common_scripts\utility::flag_init( "game_fx_started" );
    common_scripts\utility::flag_init( "flag_catacombs_enemy_gate_gag_vfx" );
    common_scripts\utility::flag_init( "player_rooftop_jump_complete" );
    common_scripts\utility::flag_init( "msg_fx_staircase_helis" );
    common_scripts\utility::flag_init( "msg_fx_chase_start_helis" );
    common_scripts\utility::flag_init( "msg_fx_canal_helis" );
    common_scripts\utility::flag_init( "msg_fx_hood_impacts" );
    common_scripts\utility::flag_init( "flag_player_in_truck" );
    common_scripts\utility::flag_init( "msg_fx_landing_hit" );
    common_scripts\utility::flag_init( "msg_fx_umbrella1" );
    common_scripts\utility::flag_init( "msg_fx_umbrella2" );
    common_scripts\utility::flag_init( "msg_fx_umbrella3" );
    common_scripts\utility::flag_init( "flag_final_crash_wall_impact_1" );
    common_scripts\utility::flag_init( "enable_distant_bomb_shakes" );
    common_scripts\utility::flag_init( "flag_slide_sparks_end" );
    common_scripts\utility::flag_init( "msg_fx_end_drag_glass" );
    common_scripts\utility::flag_init( "msg_fx_sedan_sparks_left_start" );
    common_scripts\utility::flag_init( "msg_fx_sedan_sparks_left_stop" );
    common_scripts\utility::flag_init( "msg_fx_sedan_sparks_right_start" );
    common_scripts\utility::flag_init( "msg_fx_sedan_sparks_right_stop" );
    thread maps\_shg_fx::_id_445E( 5900, "msg_fx_zone5900" );
    thread maps\_shg_fx::_id_445E( 6000, "msg_fx_zone6000" );
    thread maps\_shg_fx::_id_445E( 6100, "msg_fx_zone6100" );
    thread maps\_shg_fx::_id_445E( 6200, "msg_fx_zone6200" );
    thread maps\_shg_fx::_id_445E( 6300, "msg_fx_zone6300" );
    thread maps\_shg_fx::_id_445E( 6400, "msg_fx_zone6400" );
    thread maps\_shg_fx::_id_445E( 6500, "msg_fx_zone6500" );
    thread maps\_shg_fx::_id_445E( 7000, "msg_fx_zone7000" );
    thread maps\_shg_fx::_id_445E( 8000, "msg_fx_zone8000" );
    thread maps\_shg_fx::_id_445E( 8100, "msg_fx_zone8100" );
    thread maps\_shg_fx::_id_445E( 8200, "msg_fx_zone8200" );
    thread maps\_shg_fx::_id_445E( 8300, "msg_fx_zone8300" );
    thread maps\_shg_fx::_id_445E( 8400, "msg_fx_zone8400" );
    thread maps\_shg_fx::_id_445E( 8500, "msg_fx_zone8500" );
    thread maps\_shg_fx::_id_445E( 8600, "msg_fx_zone8600" );
    thread maps\_shg_fx::_id_445E( 8700, "msg_fx_zone8700" );
    thread maps\_shg_fx::_id_445E( 9000, "msg_fx_zone9000" );
    thread _id_5024();
    thread _id_4AC4();
    thread _id_514B();
    thread _id_514C();
    thread _id_501F();
    thread _id_5162();
    thread _id_515E();
    thread _id_515F( "umbrella1" );
    thread _id_515F( "umbrella3" );
    thread _id_4780();
    thread _id_5147();
    thread _id_5148();
    thread _id_514D();
    thread _id_4743();
    thread _id_5149();
    thread _id_5161();
    thread _id_5163();
    thread _id_5165();
    thread _id_5153();
    precacheshellshock( "default" );
}

precachefx()
{
    level._effect["wall_destruction"] = loadfx( "explosions/transformer_explosion" );
    level._effect["large_column"] = loadfx( "props/dcburning_pillars" );
    level._effect["large_vehicle_explosion"] = loadfx( "explosions/large_vehicle_explosion" );
    level._effect["glass_shatter_large"] = loadfx( "misc/glass_falling_shatter" );
    level._effect["ground_smoke_dcburning1200x1200"] = loadfx( "smoke/ground_smoke1200x1200_dcburning" );
    level._effect["firelp_small_pm"] = loadfx( "fire/firelp_small_pm" );
    level._effect["firelp_med_pm"] = loadfx( "fire/firelp_med_pm" );
    level._effect["firelp_large_pm"] = loadfx( "fire/firelp_large_pm" );
    level._effect["heli_strafe_impact"] = loadfx( "impacts/large_ac130_concrete_paris" );
    level._effect["flashlight_ai"] = loadfx( "misc/flashlight_lensflare" );
    level._effect["flashlight"] = loadfx( "misc/flashlight_spotlight_paris" );
    level._effect["flashlight_bounce"] = loadfx( "misc/flashlight_pointlight_paris" );
    level._effect["falling_dirt_catacomb"] = loadfx( "dust/falling_dirt_light" );
    level._effect["pipe_steam"] = loadfx( "impacts/pipe_steam_small" );
    level._effect["pipe_steam_looping"] = loadfx( "impacts/pipe_steam_looping" );
    level._effect["pipe_steam_looping_small"] = loadfx( "impacts/pipe_steam_looping_small" );
    level._effect["falling_dirt_dark_2_paris"] = loadfx( "dust/falling_dirt_dark_2_paris" );
    level._effect["falling_dirt_dark_2_runner_paris"] = loadfx( "dust/falling_dirt_dark_2_runner_paris" );
    level._effect["falling_dirt_light_2_runner_paris"] = loadfx( "dust/falling_dirt_light_2_runner_paris" );
    level._effect["elevator_shaft_junk"] = loadfx( "maps/paris/elevator_shaft_junk" );
    level._effect["flare_catacombs"] = loadfx( "misc/flare_ambient_paris" );
    level._effect["flare_catacombs_moving"] = loadfx( "misc/flare_ambient_paris_moving" );
    level._effect["flare_catacombs_mist"] = loadfx( "misc/flare_ambient_paris_mist" );
    level._effect["lights_spotlight_fan_shadow"] = loadfx( "lights/lights_spotlight_fan_shadow" );
    level._effect["lights_uplight_haze_large"] = loadfx( "lights/lights_uplight_haze_large" );
    level._effect["lights_conelight_smokey"] = loadfx( "lights/lights_conelight_smokey" );
    level._effect["lights_worklight_flare"] = loadfx( "lights/lights_worklight_flare" );
    level._effect["lights_tvlight_smokey_catacombs"] = loadfx( "maps/paris/lights_tvlight_smokey_catacombs" );
    level._effect["light_glow_walllight_white"] = loadfx( "misc/light_glow_walllight_white" );
    level._effect["light_glow_walllight_white_flicker"] = loadfx( "misc/light_glow_walllight_white_flicker" );
    level._effect["door_kick"] = loadfx( "dust/door_kick_catacombs" );
    level._effect["falling_dirt_groundspawn"] = loadfx( "dust/falling_dirt_groundspawn" );
    level._effect["ambush_gate_dust"] = loadfx( "maps/paris/ambush_gate_dust" );
    level._effect["table_flip_dust"] = loadfx( "maps/paris/table_flip_dust" );
    level._effect["large_brick_impact"] = loadfx( "impacts/expRound_brick" );
    level._effect["water_noise"] = loadfx( "weather/water_noise" );
    level._effect["water_drips_fat_fast_speed"] = loadfx( "water/water_drips_fat_fast_speed" );
    level._effect["water_drips_fat_slow_speed"] = loadfx( "water/water_drips_fat_slow_speed" );
    level._effect["water_drips_fat_slow_speed_catacombs"] = loadfx( "water/water_drips_fat_slow_speed_catacombs" );
    level._effect["drips_fast"] = loadfx( "misc/drips_fast" );
    level._effect["drips_slow"] = loadfx( "misc/drips_slow" );
    level._effect["drips_splash_tiny"] = loadfx( "water/drips_splash_tiny" );
    level._effect["mist_drifting_catacomb"] = loadfx( "smoke/mist_drifting_catacomb" );
    level._effect["waterfall_drainage_splash_dcemp_dark"] = loadfx( "water/waterfall_drainage_splash_dcemp_dark" );
    level._effect["falling_water_trickle_infrequent"] = loadfx( "water/falling_water_trickle_infrequent" );
    level._effect["water_pipe_spray_dark"] = loadfx( "water/water_pipe_spray_dark" );
    level._effect["powerline_runner_sewer_paris"] = loadfx( "maps/paris/powerline_runner_sewer_paris" );
    level._effect["water_flow_sewage_catacomb"] = loadfx( "water/water_flow_sewage_catacomb" );
    level._effect["waterfall_splash_large"] = loadfx( "water/waterfall_splash_large" );
    level._effect["waterfall_drainage_splash_falling_dark"] = loadfx( "water/waterfall_drainage_splash_falling_dark" );
    level._effect["waterfall_splash_large_drops"] = loadfx( "water/waterfall_splash_large_drops" );
    level._effect["waterfall_splash_falling_mist"] = loadfx( "water/waterfall_splash_falling_mist" );
    level._effect["waterfall_splash_medium_dark"] = loadfx( "water/waterfall_splash_medium_dark" );
    level._effect["waterfall_drainage_distortion"] = loadfx( "water/waterfall_drainage_distortion" );
    level._effect["waterfall_mist"] = loadfx( "water/waterfall_mist" );
    level._effect["waterfall_drainage_short_dcemp_dark"] = loadfx( "water/waterfall_drainage_short_dcemp_dark" );
    level._effect["waterfall_splash_falling_mist_dark"] = loadfx( "water/waterfall_splash_falling_mist_dark" );
    level._effect["ground_dust_narrow_light"] = loadfx( "dust/ground_dust_narrow_light" );
    level._effect["ground_mist_narrow_dark"] = loadfx( "dust/ground_mist_narrow_dark" );
    level._effect["ground_mist_warm"] = loadfx( "dust/ground_mist_warm" );
    level._effect["fog_ground_200_light_lit"] = loadfx( "smoke/fog_ground_200_light_lit" );
    level._effect["smoke_warm_room_linger_s"] = loadfx( "smoke/smoke_warm_room_linger_s" );
    level._effect["rat_scurry_x10"] = loadfx( "animals/rat_scurry_x10" );
    level._effect["rat_scurry_x10_leftturn"] = loadfx( "animals/rat_scurry_x10_leftturn" );
    level._effect["catacombs_mist_wake"] = loadfx( "smoke/catacombs_mist_wake" );
    level._effect["amb_dust_small"] = loadfx( "smoke/amb_dust_small" );
    level._effect["lighthaze_sewer_ladder"] = loadfx( "maps/paris/lighthaze_sewer_ladder" );
    level._effect["lighthaze_sewer_ladder_distant"] = loadfx( "maps/paris/lighthaze_sewer_ladder_distant" );
    level._effect["lighthaze_sewer_ladder_bottom"] = loadfx( "maps/paris/lighthaze_sewer_ladder_bottom" );
    level._effect["falling_dirt_light_2_paris"] = loadfx( "dust/falling_dirt_light_2_paris" );
    level._effect["lights_godray_default"] = loadfx( "lights/lights_conelight_default" );
    level._id_28F0["tankcrush"]["window_med"] = loadfx( "props/car_glass_med" );
    level._id_28F0["tankcrush"]["window_large"] = loadfx( "props/car_glass_large" );
    level._effect["littlebird_exhaust"] = loadfx( "distortion/littlebird_exhaust" );
    level._effect["scripted_flashbang"] = loadfx( "explosions/flashbang" );
    level._effect["bmp_flash_wv"] = loadfx( "muzzleflashes/bmp_flash_wv" );
    level._effect["tread_dust_paris"] = loadfx( "treadfx/tread_dust_paris" );
    level._effect["tread_dust_paris_small"] = loadfx( "treadfx/tread_dust_paris_small" );
    level._effect["heli_dust_ambush"] = loadfx( "treadfx/heli_dust_ambush" );
    level._effect["heli_water_paris"] = loadfx( "treadfx/heli_water_paris" );
    level._effect["no_effect"] = loadfx( "misc/no_effect" );
    level._effect["truck_sparks"] = loadfx( "misc/vehicle_scrape_sparks_smokey" );
    level._effect["sedan_skidmarks"] = loadfx( "treadfx/vehicle_skidmarks" );
    level._effect["dust_wind_fast_paper_oneshot"] = loadfx( "dust/dust_wind_fast_paper_oneshot" );
    level._effect["van_hood_impacts"] = loadfx( "maps/paris/van_hood_impacts" );
    level._effect["van_dashboard_glass"] = loadfx( "maps/paris/van_dashboard_glass" );
    level._effect["van_dashboard_glass_move"] = loadfx( "maps/paris/van_dashboard_glass_move" );
    level._effect["van_peelout"] = loadfx( "maps/paris/van_peelout" );
    level._effect["van_door_kick"] = loadfx( "maps/paris/van_door_kick" );
    level._effect["van_blockade_impact"] = loadfx( "maps/paris/van_blockade_impact" );
    level._effect["van_crash_1"] = loadfx( "maps/paris/van_crash_1" );
    level._effect["van_final_crash"] = loadfx( "maps/paris/van_final_crash" );
    level._effect["van_fence_impact"] = loadfx( "maps/paris/van_fence_impact" );
    level._effect["car_decal_spawner"] = loadfx( "maps/paris/car_decal_spawner" );
    level._effect["sedan_tire_smoketrail"] = loadfx( "maps/paris/sedan_tire_smoketrail" );
    level._effect["van_grill_smoke"] = loadfx( "maps/paris/van_grill_smoke" );
    level._effect["abrams_flash_wv_brightlite"] = loadfx( "muzzleflashes/abrams_flash_wv_brightlite" );
    level._effect["tankfall_dust_large"] = loadfx( "impacts/tankfall_dust_large" );
    level._effect["glass_punch_paris"] = loadfx( "maps/paris/glass_punch_paris" );
    level._effect["tank_shell_aftermath_paris"] = loadfx( "maps/paris/tank_shell_aftermath_paris" );
    level._effect["tread_burnout_reverse"] = loadfx( "treadfx/tread_burnout_reverse" );
    level._effect["window_hit_hood"] = loadfx( "maps/paris/window_hit_hood" );
    level._effect["van_behindview_impact_planters"] = loadfx( "maps/paris/van_behindview_impact_planters" );
    level._effect["van_behindview_impact_flowers"] = loadfx( "maps/paris/van_behindview_impact_flowers" );
    level._effect["van_behindview_impact_diningset"] = loadfx( "maps/paris/van_behindview_impact_diningset" );
    level._effect["van_behindview_impact_topiaryright"] = loadfx( "maps/paris/van_behindview_impact_topiaryright" );
    level._effect["van_behindview_impact_topiaryleft"] = loadfx( "maps/paris/van_behindview_impact_topiaryleft" );
    level._effect["van_behindview_impact_fenceleft"] = loadfx( "maps/paris/van_behindview_impact_fenceleft" );
    level._effect["topiary_explosion_crash"] = loadfx( "maps/paris/topiary_explosion_crash" );
    level._effect["behindview_impact_fenceright"] = loadfx( "maps/paris/van_behindview_impact_fenceright" );
    level._effect["galleria_gate_open_1"] = loadfx( "maps/paris/galleria_gate_open_1" );
    level._effect["phone_kiosk_dest_sparks"] = loadfx( "props/phone_kiosk_dest_sparks" );
    level._effect["tankShellImpact"] = loadfx( "explosions/tankshell_wallImpact" );
    level._effect["fire_line_sm"] = loadfx( "fire/fire_line_sm" );
    level._effect["parking_lot_gate_down_dest"] = loadfx( "props/parking_lot_gate_down_dest" );
    level._effect["paris_gallery_metal_gates"] = loadfx( "props/paris_gallery_metal_gates" );
    level._effect["tire_blowout_parent"] = loadfx( "explosions/tire_blowout_parent" );
    level._effect["fire_falling_localized_runner_paris"] = loadfx( "fire/fire_falling_localized_runner_paris" );
    level._effect["blood_gaz_driver"] = loadfx( "misc/blood_gaz_driver" );
    level._effect["van_window_broken"] = loadfx( "props/car_glass_med" );
    level._effect["sedan_trunk_papers"] = loadfx( "maps/paris/sedan_trunk_papers" );
    level._effect["car_glass_large_moving"] = loadfx( "props/car_glass_large_moving" );
    level._effect["car_glass_med_moving"] = loadfx( "props/car_glass_med_moving" );
    level._effect["car_glass_med"] = loadfx( "props/car_glass_med" );
    level._effect["car_glass_sunroof"] = loadfx( "maps/paris/car_glass_sunroof" );
    level._effect["sedan_body_impact"] = loadfx( "maps/paris/sedan_body_impact" );
    level._effect["sedan_skid_sparks"] = loadfx( "maps/paris/sedan_skid_sparks" );
    level._effect["drag_glass_trail"] = loadfx( "maps/paris/drag_glass_trail" );
    level._effect["body_drag_trail"] = loadfx( "maps/paris/body_drag_trail" );
    level._effect["oil_drip_small_continuous"] = loadfx( "misc/oil_drip_small_continuous" );
    level._effect["van_damage_whitesmoke_looping"] = loadfx( "maps/paris/van_damage_whitesmoke_looping" );
    level._effect["crash_debris"] = loadfx( "maps/paris/crash_debris" );
    level._effect["smoke_after_crash_smoulder"] = loadfx( "maps/paris/smoke_after_crash_smoulder" );
    level._effect["highrise_glass_56x59"] = loadfx( "maps/paris/highrise_glass_56x59_cheap_paris" );
    level._effect["guard_blood_splat"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["gallery_archway_01_dest"] = loadfx( "props/gallery_archway_01_dest" );
    level._effect["paris_glass_panel1"] = loadfx( "props/paris_glass_panel1" );
    level._effect["paris_glass_panel2"] = loadfx( "props/paris_glass_panel2" );
    level._effect["paris_chandelier_dest"] = loadfx( "props/paris_chandelier_dest" );
    level._effect["lights_godray_beam_gallery"] = loadfx( "maps/paris/lights_godray_beam_gallery" );
    level._effect["paris_fruit_cart"] = loadfx( "props/paris_fruit_cart" );
    level._effect["ambient_explosion"] = loadfx( "maps/paris/ambient_explosion_paris" );
    level._effect["building_explosion_gulag"] = loadfx( "explosions/building_explosion_gulag" );
    level._effect["belltower_explosion"] = loadfx( "explosions/belltower_explosion" );
    level._effect["smoke_column_skybox_paris"] = loadfx( "maps/paris/smoke_column_skybox_paris" );
    level._effect["thick_fakelit_smoke_paris"] = loadfx( "maps/paris/thick_fakelit_smoke_paris" );
    level._effect["antiair_runner_flak_day"] = loadfx( "misc/antiair_runner_flak_day" );
    level._effect["antiair_runner_cloudy_paris"] = loadfx( "maps/paris/antiair_runner_cloudy_paris" );
    level._effect["skybox_mig29_flyby"] = loadfx( "misc/skybox_mig29_flyby" );
    level._effect["skybox_hind_flyby"] = loadfx( "misc/skybox_hind_flyby" );
    level._effect["leaves_fall_gentlewind_paris"] = loadfx( "misc/leaves_fall_gentlewind_paris" );
    level._effect["leaves_heliblown_paris"] = loadfx( "misc/leaves_heliblown_paris" );
    level._effect["leaves_runner_1"] = loadfx( "misc/leaves_runner_1" );
    level._effect["leaves_fall_gentlewind"] = loadfx( "misc/leaves_fall_gentlewind" );
    level._effect["moth_runner"] = loadfx( "misc/moth_runner" );
    level._effect["battlefield_smk_directional_white_m_cheap"] = loadfx( "smoke/battlefield_smk_directional_white_m_cheap" );
    level._effect["battlefield_smk_directional_grey_m_cheap"] = loadfx( "smoke/battlefield_smk_directional_grey_m_cheap" );
    level._effect["amb_smoke_distant_paris"] = loadfx( "smoke/amb_smoke_distant_paris" );
    level._effect["flesh_hit"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["flesh_hit_small"] = loadfx( "impacts/flesh_hit" );
}

_id_4743()
{
    setsaveddvar( "fx_alphathreshold", 10 );
}

_id_4780()
{
    wait 0.1;
    var_0 = "treadfx/tread_dust_paris";
    var_1 = "misc/no_effect";
    var_2[0] = "script_vehicle_t72_tank";
    var_2[1] = "script_vehicle_gaz_tigr_harbor";
    var_2[2] = "script_vehicle_gaz_tigr_turret_physics";
    var_2[3] = "script_vehicle_armored_van";
    var_2[4] = "script_vehicle_paris_escape_sedan";

    foreach ( var_4 in var_2 )
    {
        maps\_treadfx::_id_28EF( var_4, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_4, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_4, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_4, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_4, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_4, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_4, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_4, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_4, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_4, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_4, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_4, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_4, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_4, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_4, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_4, "plaster", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_4, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_4, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_4, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_4, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_4, "ceramic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_4, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_4, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_4, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_0 );
        maps\_treadfx::_id_28EF( var_4, "riotshield", var_0 );
        maps\_treadfx::_id_28EF( var_4, "slush", var_0 );
        maps\_treadfx::_id_28EF( var_4, "default", var_0 );
        maps\_treadfx::_id_28EF( var_4, "none" );
    }

    var_0 = "treadfx/tread_dust_paris_small";
    var_1 = "misc/no_effect";
    var_2[0] = "script_vehicle_paris_escape_sedan";

    foreach ( var_4 in var_2 )
    {
        maps\_treadfx::_id_28EF( var_4, "brick", var_0 );
        maps\_treadfx::_id_28EF( var_4, "bark", var_0 );
        maps\_treadfx::_id_28EF( var_4, "carpet", var_0 );
        maps\_treadfx::_id_28EF( var_4, "cloth", var_0 );
        maps\_treadfx::_id_28EF( var_4, "concrete", var_0 );
        maps\_treadfx::_id_28EF( var_4, "dirt", var_0 );
        maps\_treadfx::_id_28EF( var_4, "flesh", var_0 );
        maps\_treadfx::_id_28EF( var_4, "foliage", var_0 );
        maps\_treadfx::_id_28EF( var_4, "glass", var_0 );
        maps\_treadfx::_id_28EF( var_4, "grass", var_0 );
        maps\_treadfx::_id_28EF( var_4, "gravel", var_0 );
        maps\_treadfx::_id_28EF( var_4, "ice", var_0 );
        maps\_treadfx::_id_28EF( var_4, "metal", var_0 );
        maps\_treadfx::_id_28EF( var_4, "mud", var_0 );
        maps\_treadfx::_id_28EF( var_4, "paper", var_0 );
        maps\_treadfx::_id_28EF( var_4, "plaster", var_1 );
        maps\_treadfx::_id_28EF( var_4, "rock", var_0 );
        maps\_treadfx::_id_28EF( var_4, "sand", var_0 );
        maps\_treadfx::_id_28EF( var_4, "snow", var_0 );
        maps\_treadfx::_id_28EF( var_4, "wood", var_0 );
        maps\_treadfx::_id_28EF( var_4, "asphalt", var_0 );
        maps\_treadfx::_id_28EF( var_4, "ceramic", var_1 );
        maps\_treadfx::_id_28EF( var_4, "plastic", var_0 );
        maps\_treadfx::_id_28EF( var_4, "rubber", var_0 );
        maps\_treadfx::_id_28EF( var_4, "cushion", var_0 );
        maps\_treadfx::_id_28EF( var_4, "fruit", var_0 );
        maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_0 );
        maps\_treadfx::_id_28EF( var_4, "riotshield", var_0 );
        maps\_treadfx::_id_28EF( var_4, "slush", var_0 );
        maps\_treadfx::_id_28EF( var_4, "default", var_0 );
        maps\_treadfx::_id_28EF( var_4, "none" );
    }

    var_4 = "script_vehicle_mi24p_hind_woodland";
    var_0 = "treadfx/heli_dust_ambush";
    var_8 = "treadfx/heli_water_paris";
    maps\_treadfx::_id_28EF( var_4, "brick", var_0 );
    maps\_treadfx::_id_28EF( var_4, "bark", var_0 );
    maps\_treadfx::_id_28EF( var_4, "carpet", var_0 );
    maps\_treadfx::_id_28EF( var_4, "cloth", var_0 );
    maps\_treadfx::_id_28EF( var_4, "concrete", var_0 );
    maps\_treadfx::_id_28EF( var_4, "dirt", var_0 );
    maps\_treadfx::_id_28EF( var_4, "flesh", var_0 );
    maps\_treadfx::_id_28EF( var_4, "foliage", var_0 );
    maps\_treadfx::_id_28EF( var_4, "glass", var_0 );
    maps\_treadfx::_id_28EF( var_4, "grass", var_0 );
    maps\_treadfx::_id_28EF( var_4, "gravel", var_0 );
    maps\_treadfx::_id_28EF( var_4, "ice", var_0 );
    maps\_treadfx::_id_28EF( var_4, "metal", var_0 );
    maps\_treadfx::_id_28EF( var_4, "mud", var_0 );
    maps\_treadfx::_id_28EF( var_4, "paper", var_0 );
    maps\_treadfx::_id_28EF( var_4, "plaster", var_1 );
    maps\_treadfx::_id_28EF( var_4, "rock", var_0 );
    maps\_treadfx::_id_28EF( var_4, "sand", var_0 );
    maps\_treadfx::_id_28EF( var_4, "snow", var_0 );
    maps\_treadfx::_id_28EF( var_4, "water", var_8 );
    maps\_treadfx::_id_28EF( var_4, "wood", var_0 );
    maps\_treadfx::_id_28EF( var_4, "asphalt", var_0 );
    maps\_treadfx::_id_28EF( var_4, "ceramic", var_1 );
    maps\_treadfx::_id_28EF( var_4, "plastic", var_0 );
    maps\_treadfx::_id_28EF( var_4, "rubber", var_0 );
    maps\_treadfx::_id_28EF( var_4, "cushion", var_0 );
    maps\_treadfx::_id_28EF( var_4, "fruit", var_0 );
    maps\_treadfx::_id_28EF( var_4, "paintedmetal", var_0 );
    maps\_treadfx::_id_28EF( var_4, "riotshield", var_0 );
    maps\_treadfx::_id_28EF( var_4, "slush", var_0 );
    maps\_treadfx::_id_28EF( var_4, "default", var_0 );
    maps\_treadfx::_id_28EF( var_4, "none" );
}

_id_501B()
{

}

_id_5147()
{
    wait 6;
    common_scripts\utility::flag_waitopen( "msg_fx_zone7000" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8000" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8100" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8200" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8300" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8400" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8500" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8600" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8700" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone9000" );
    _id_501E( level.player );
    wait 7;
}

_id_5148()
{
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_waitopen( "msg_fx_zone6500" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone7000" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8000" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8100" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8200" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8300" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8400" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8500" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8600" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone8700" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone9000" );
    setsaveddvar( "sm_dynlightAllSmodels", 1 );
    common_scripts\utility::flag_wait( "msg_fx_zone6500" );
    setsaveddvar( "sm_dynlightAllSmodels", 0 );
}

_id_501E( var_0, var_1 )
{
    if ( level.createfx_enabled )
        return 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    maps\_audio::aud_send_msg( "generic_building_bomb_shake" );
    maps\_shg_fx::_id_444F( "falling_dirt_dark_2_paris", "viewmodel_medium", 0.127, 2, 0.3, 0.53, 1, var_1 );
}

_id_5024()
{
    var_0 = getentarray( "manual_bombshake", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_5025 );
}

_id_5025()
{
    self waittill( "trigger", var_0 );
    _id_501E( level.player, 1 );
}

_id_5149()
{
    common_scripts\utility::flag_wait( "msg_fx_chase_start_helis" );
    common_scripts\utility::flag_clear( "enable_distant_bomb_shakes" );
}

_id_514A()
{
    wait 6.6;
    common_scripts\utility::exploder( 6105 );
}

_id_514B()
{
    common_scripts\utility::flag_wait( "flag_catacombs_enemy_gate_gag_vfx" );
    wait 0.45;
    common_scripts\utility::exploder( 6210 );
}

_id_4AC4()
{
    var_0 = getentarray( "poison_wake_volume", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4AC5 );
}

_id_4AC5()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 maps\_utility::_id_133C( "in_poison_volume" ) )
        {

        }
        else
            var_0 maps\_utility::_id_1402( "in_poison_volume" );

        if ( distancesquared( var_0.origin, level.player.origin ) < 9250000 )
        {
            if ( var_0 maps\_utility::_id_1008( "in_poison_volume" ) )
                continue;

            var_0 thread _id_4AC6( self );
            var_0 maps\_utility::_id_13DC( "in_poison_volume" );
        }
    }
}

_id_4AC6( var_0 )
{
    self endon( "death" );
    var_1 = 200;

    for (;;)
    {
        if ( self istouching( var_0 ) )
        {
            if ( var_1 > 0 )
                wait(max( 1 - var_1 / 120, 0.1 ));
            else
                wait 0.15;

            var_2 = var_0.script_fxid;

            if ( isplayer( self ) )
            {
                var_1 = distance( self getvelocity(), ( 0.0, 0.0, 0.0 ) );

                if ( var_1 < 5 )
                    var_2 = "null";
            }

            if ( isai( self ) )
            {
                var_1 = distance( self.velocity, ( 0.0, 0.0, 0.0 ) );

                if ( var_1 < 5 )
                    var_2 = "null";
            }

            if ( var_2 != "null" )
            {
                var_3 = self.origin + ( 0.0, 0.0, 64.0 );
                var_4 = self.origin - ( 0.0, 0.0, 150.0 );
                var_5 = bullettrace( var_3, var_4, 0, undefined );
                var_6 = common_scripts\utility::getfx( var_2 );
                var_3 = var_5["position"];
                var_7 = ( 0, self.angles[1], 0 );
                var_8 = anglestoforward( var_7 );
                var_9 = anglestoup( var_7 );
                playfx( var_6, var_3, var_9, var_8 );
            }

            continue;
        }

        maps\_utility::_id_13DE( "in_poison_volume" );
        return;
    }
}

_id_514C()
{
    wait 0.2;

    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_fx_chase_start_helis" );
        wait 18;
        common_scripts\utility::exploder( 7099 );
    }
}

_id_501F()
{
    wait 0.2;
    common_scripts\utility::flag_waitopen( "msg_fx_zone6000" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone6100" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone6200" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone6300" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone6400" );
    common_scripts\utility::flag_waitopen( "msg_fx_zone6500" );
    common_scripts\utility::exploder( 10001 );
}

_id_514D()
{
    var_0 = getentarray( "fruit_cart_exploder", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_514E );
}

_id_514E()
{
    self waittill( "trigger", var_0 );
    physicsexplosionsphere( self.origin, 100, 100, 1.2 );
    radiusdamage( self.origin, 150, 5000, 5000 );
}

_id_514F( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "van_dashboard_glass" ), var_0, "body_animate_jnt" );
    common_scripts\utility::flag_wait( "msg_fx_hood_impacts" );
    playfxontag( common_scripts\utility::getfx( "van_hood_impacts" ), var_0, "tag_engine_left" );
}

_id_5150( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "van_dashboard_glass" ), var_0, "body_animate_jnt" );
    playfxontag( common_scripts\utility::getfx( "van_dashboard_glass_move" ), var_0, "body_animate_jnt" );
    playfxontag( common_scripts\utility::getfx( "van_peelout" ), var_0, "tag_wheel_front_right" );
}

_id_5151( var_0 )
{
    wait 0.15;
    common_scripts\utility::exploder( 7001 );
    wait 0.65;
    playfxontag( common_scripts\utility::getfx( "tread_burnout_reverse" ), var_0, "tag_wheel_front_right" );
    playfxontag( common_scripts\utility::getfx( "tread_burnout_reverse" ), var_0, "tag_wheel_front_left" );
}

_id_5152( var_0, var_1 )
{
    wait(2.2 / var_1);
    maps\paris_shared::_id_50DD();
    playfxontag( common_scripts\utility::getfx( "van_blockade_impact" ), var_0, "tag_engine_left" );
    setblur( 2.0, 0.1 / var_1 );
    wait 0.5;
    setblur( 0, 0.4 / var_1 );
    playfxontag( common_scripts\utility::getfx( "van_grill_smoke" ), var_0, "body_animate_jnt" );
    wait 5;
}

_id_5153()
{
    level common_scripts\utility::waitframe();

    if ( !common_scripts\utility::flag_exist( "flag_canal_combat_01" ) )
        common_scripts\utility::flag_init( "flag_canal_combat_01" );

    common_scripts\utility::flag_wait( "flag_canal_combat_01" );
    setsaveddvar( "r_dlightlimit", 1 );

    if ( !common_scripts\utility::flag_exist( "flag_chase_canal_uaz_02" ) )
        common_scripts\utility::flag_init( "flag_chase_canal_uaz_02" );

    common_scripts\utility::flag_wait( "flag_chase_canal_uaz_02" );
    setsaveddvar( "r_dlightlimit", 4 );

    if ( !common_scripts\utility::flag_exist( "flag_final_crash_begin" ) )
        common_scripts\utility::flag_init( "flag_final_crash_begin" );

    common_scripts\utility::flag_wait( "flag_final_crash_begin" );
    setsaveddvar( "r_dlightlimit", 1 );
}

_id_5154( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "abrams_flash_wv_brightlite" ), var_0, "tag_flash" );
    wait 0.06;
    earthquake( 0.5, 2.0, level.player.origin, 1600 );
    wait 0.25;
    common_scripts\utility::exploder( 999 );
}

_id_5155( var_0 )
{
    common_scripts\utility::exploder( 8101 );
    wait 0.25;

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    common_scripts\utility::exploder( 8102 );
    wait 0.05;
    earthquake( 0.65, 1.0, level.player.origin, 1600 );
    var_1 = ( -8587.0, 3573.0, 330.0 );
    radiusdamage( var_1, 128, 301, 301 );
    setblur( 2.0, 0.1 );
    wait 0.1;
    level.player maps\_utility::dirteffect( var_1 );
    wait 0.15;
    setblur( 0, 0.4 );
    wait 6;

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_5156( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.3;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_planters" ), level._id_5157, "tag_origin" );
    wait 0.1;
    earthquake( var_0, 2.3, level.player.origin, 1600 );
}

_id_5158( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.2;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_flowers" ), level._id_5157, "tag_origin" );
    wait 0.1;
    earthquake( var_0, 2.0, level.player.origin, 1600 );
}

_id_5159( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.2;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_diningset" ), level._id_5157, "tag_origin" );
    wait 0.12;
    earthquake( var_0, 1.3, level.player.origin, 1600 );
}

_id_515A( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.15;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_topiaryright" ), level._id_5157, "tag_origin" );
    wait 0.1;
    earthquake( var_0, 0.5, level.player.origin, 1600 );
}

_id_515B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.15;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_topiaryleft" ), level._id_5157, "tag_origin" );
    wait 0.1;
    earthquake( var_0, 0.5, level.player.origin, 1600 );
}

_id_515C( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.15;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_fenceleft" ), level._id_5157, "tag_origin" );
    wait 0.1;
    earthquake( var_0, 0.4, level.player.origin, 1600 );
}

_id_515D( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.2;

    playfxontag( common_scripts\utility::getfx( "van_behindview_impact_fenceright" ), level._id_5157, "tag_origin" );
}

_id_515E()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "msg_fx_zone8500" );
        var_0 = 0.06;
        var_1 = vectornormalize( anglestoforward( level._id_5157.angles ) );
        var_2 = level._id_5157.origin - var_1 * 250;
        var_3 = var_1 * var_0 + ( 0.0, 0.0, 0.075 );
        physicsjolt( var_2, 90, 75, var_3 );
        wait 0.05;
    }
}

_id_515F( var_0 )
{
    common_scripts\utility::flag_wait( "msg_fx_" + var_0 );
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        var_1 rotatevelocity( ( 0.0, -180.0, 0.0 ), 3, 0, 2.75 );
}

_id_5160( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_wheel_back_right", ( 0.0, 0.0, 13.0 ), ( 0.0, -120.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( "tire_blowout_parent" ), var_1, "tag_origin" );
    maps\_audio::aud_send_msg( "player_shot_sedan_ending", var_0 );
    var_0 showpart( "wheel_A_KR_D" );
    var_0 hidepart( "wheel_A_KR" );

    while ( !common_scripts\utility::flag( "flag_final_crash_wall_impact_1" ) )
    {
        playfxontag( common_scripts\utility::getfx( "truck_sparks" ), var_0, "tag_wheel_back_right" );
        common_scripts\utility::waitframe();
    }

    var_2 = 0;
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3 linkto( var_0, "tag_wheel_back_left", ( 0.0, 0.0, 0.0 ), ( -90.0, 0.0, 0.0 ) );
    var_4 = common_scripts\utility::spawn_tag_origin();
    var_4 linkto( var_0, "tag_wheel_front_left", ( 0.0, 0.0, 0.0 ), ( -90.0, 0.0, 0.0 ) );
    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5 linkto( var_0, "tag_wheel_front_right", ( 0.0, 0.0, 0.0 ), ( -90.0, 0.0, 0.0 ) );

    while ( var_2 < 30 )
    {
        playfxontag( common_scripts\utility::getfx( "sedan_skidmarks" ), var_3, "tag_origin" );
        playfxontag( common_scripts\utility::getfx( "sedan_skidmarks" ), var_4, "tag_origin" );
        playfxontag( common_scripts\utility::getfx( "sedan_skidmarks" ), var_5, "tag_origin" );
        wait 0.03;
        var_2++;
    }

    var_4 delete();
    var_3 delete();
    var_5 delete();
}

_id_5161()
{
    var_0 = getentarray( "final_crash_skidmarks", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 hide();
}

_id_5162()
{
    common_scripts\utility::flag_wait( "msg_fx_staircase_helis" );
    wait 0.6;
    _id_515C();
    wait 0.15;
    _id_515C();
    wait 0.15;
    _id_515C();
    wait 0.15;
    _id_515C();
    wait 0.15;
    _id_515C();
    wait 0.15;
    _id_515C();
}

_id_5163()
{
    wait 1;
    common_scripts\utility::flag_wait( "msg_fx_sedan_sparks_left_start" );

    if ( !common_scripts\utility::flag( "flag_player_shot_sedan_ending" ) )
    {
        maps\_audio::aud_send_msg( "pars_volk_escape_failstate" );
        var_0 = common_scripts\utility::spawn_tag_origin();
        var_0 linkto( level._id_5164, "tag_wheel_front_right", ( 0.0, 0.0, 0.0 ), ( -90.0, 0.0, 0.0 ) );

        while ( !common_scripts\utility::flag( "msg_fx_sedan_sparks_left_stop" ) )
        {
            playfxontag( common_scripts\utility::getfx( "truck_sparks" ), level._id_5164, "tag_door_left_front" );
            playfxontag( common_scripts\utility::getfx( "sedan_skidmarks" ), var_0, "tag_origin" );
            wait 0.03;
        }

        var_0 delete();
    }
}

_id_5165()
{
    wait 1;
    common_scripts\utility::flag_wait( "msg_fx_sedan_sparks_right_start" );

    if ( !common_scripts\utility::flag( "flag_player_shot_sedan_ending" ) )
    {
        var_0 = common_scripts\utility::spawn_tag_origin();
        var_0 linkto( level._id_5166, "tag_wheel_back_left", ( 0.0, 0.0, 0.0 ), ( -90.0, 0.0, 0.0 ) );
        var_1 = common_scripts\utility::spawn_tag_origin();
        var_1 linkto( level._id_5164, "tag_wheel_front_left", ( 0.0, 0.0, 0.0 ), ( -90.0, 0.0, 0.0 ) );

        while ( !common_scripts\utility::flag( "msg_fx_sedan_sparks_right_stop" ) )
        {
            playfxontag( common_scripts\utility::getfx( "truck_sparks" ), level._id_5164, "tag_door_right_back" );
            playfxontag( common_scripts\utility::getfx( "sedan_skidmarks" ), var_0, "tag_origin" );
            playfxontag( common_scripts\utility::getfx( "sedan_skidmarks" ), var_1, "tag_origin" );
            wait 0.03;
        }

        var_0 delete();
        var_1 delete();
    }
}
