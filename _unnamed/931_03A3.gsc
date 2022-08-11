// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
    {
        if ( !isdefined( level.createfxent ) )
            level.createfxent = [];
    }

    _id_73CF::main();
    maps\_shg_fx::_id_4445();
    common_scripts\utility::flag_init( "restaurant_drop_section_falling" );
    common_scripts\utility::flag_init( "restaurant_tilt" );
    common_scripts\utility::flag_init( "restaurant_destruction_floor_done" );
    common_scripts\utility::flag_init( "finale_player_jump_start" );
    common_scripts\utility::flag_init( "off_flag" );
    common_scripts\utility::flag_init( "stop_makarov_blobshadow" );
    thread precachefx();
    thread _id_059F::_id_43EB( "hard" );
    thread _id_73D5();
    thread _id_4743();
    thread _id_73EC();
    thread _id_73DE();
    thread _id_4780();
    thread _id_73E5();
    thread _id_73E6();
    thread _id_73E7();
    thread _id_03A2();
    thread maps\_shg_fx::_id_445E( 1000, "msg_fx_zone1000" );
    thread maps\_shg_fx::_id_445E( 1500, "msg_fx_zone1000", "msg_fx_zone1500" );
    thread maps\_shg_fx::_id_445E( 2000, "msg_fx_zone2000" );
    thread maps\_shg_fx::_id_445E( 3000, "msg_fx_zone3000" );
    thread maps\_shg_fx::_id_445E( 4000, "msg_fx_zone4000" );
    thread maps\_shg_fx::_id_445E( 5000, "msg_fx_zone5000", "msg_fx_zone5000", "off_flag" );
    thread maps\_shg_fx::_id_445E( 15050, "msg_fx_zone15050" );
    thread maps\_shg_fx::_id_445E( 6000, "msg_fx_zone6000" );
}

_id_03A2()
{
    level common_scripts\utility::waitframe();
    var_0 = maps\_shg_fx::_id_446B( -11 );

    foreach ( var_2 in var_0 )
    {
        var_3 = spawn( "script_model", var_2.v["origin"] );
        var_3.origin = var_2.v["origin"];
        var_3.angles = vectortoangles( vectornormalize( var_2.v["origin"] - level.player.origin ) * -1 );
        var_3 setmodel( "fx_db_clouds" );
    }
}

precachefx()
{
    level._effect["db_head_shadow2"] = loadfx( "maps/dubai/db_head_shadow2" );
    level._effect["db_body_shadow2"] = loadfx( "maps/dubai/db_body_shadow2" );
    level._effect["db_leg_shadow2"] = loadfx( "maps/dubai/db_leg_shadow2" );
    level._effect["dubai_lights_rest_yuririm"] = loadfx( "maps/dubai/dubai_lights_rest_yuririm" );
    level._effect["dubai_lights_rest_yurikey"] = loadfx( "maps/dubai/dubai_lights_rest_yurikey" );
    level._effect["db_blade_shadow"] = loadfx( "maps/dubai/db_blade_shadow" );
    level._effect["db_dmg_dust"] = loadfx( "maps/dubai/db_dmg_dust" );
    level._effect["db_heli_rooftread"] = loadfx( "maps/dubai/db_heli_rooftread" );
    level._effect["dubai_lights_finale_rim1"] = loadfx( "lights/dubai_lights_finale_rim1" );
    level._effect["db_blade_fire"] = loadfx( "maps/dubai/db_blade_fire" );
    level._effect["db_fire_line_sm"] = loadfx( "maps/dubai/db_fire_line_sm" );
    level._effect["db_helifire_embers"] = loadfx( "maps/dubai/db_helifire_embers" );
    level._effect["db_leg_shadow"] = loadfx( "maps/dubai/db_leg_shadow" );
    level._effect["db_head_shadow"] = loadfx( "maps/dubai/db_head_shadow" );
    level._effect["db_body_shadow"] = loadfx( "maps/dubai/db_body_shadow" );
    level._effect["db_mak_light"] = loadfx( "maps/dubai/db_mak_light" );
    level._effect["db_helifire_bg"] = loadfx( "maps/dubai/db_helifire_bg" );
    level._effect["db_helifire"] = loadfx( "maps/dubai/db_helifire" );
    level._effect["door_truck_kick_dubai"] = loadfx( "dust/door_truck_kick_dubai" );
    level._effect["ceiling_dust_truck_dubai"] = loadfx( "dust/ceiling_dust_truck_dubai" );
    level._effect["door_gate_breach_dubai_line"] = loadfx( "dust/door_gate_breach_dubai_line" );
    level._effect["door_breach_truck_dubai"] = loadfx( "dust/door_breach_truck_dubai" );
    level._effect["glass_dust_trail_child_dubai"] = loadfx( "dust/glass_dust_trail_child_dubai" );
    level._effect["glass_dust_trail_parent_dubai"] = loadfx( "dust/glass_dust_trail_parent_dubai" );
    level._effect["truck_dubai_ambient_dust"] = loadfx( "dust/truck_dubai_ambient_dust" );
    level._effect["light_shaft_dust_dubai"] = loadfx( "dust/light_shaft_dust_dubai" );
    level._effect["vehicle_exp_fire_spwn_child"] = loadfx( "fire/vehicle_exp_fire_spwn_child" );
    level._effect["vehicle_exp_fire_spwn_child_nodeath"] = loadfx( "fire/vehicle_exp_fire_spwn_child_nodeath" );
    level._effect["vehicle_exp_fire_spwn_child_sm"] = loadfx( "fire/vehicle_exp_fire_spwn_child_sm" );
    level._effect["spotlight"] = loadfx( "maps/dubai/spotlight_large" );
    level._effect["lighthaze_dubai"] = loadfx( "misc/lighthaze_dubai" );
    level._effect["dubai_lights_glow_white"] = loadfx( "lights/dubai_lights_glow_white" );
    level._effect["lights_conelight_smokey"] = loadfx( "lights/lights_conelight_smokey" );
    level._effect["dubai_lantern_lights_glow"] = loadfx( "lights/dubai_lantern_lights_glow" );
    level._effect["light_blink_paris_police"] = loadfx( "lights/light_blink_paris_police" );
    level._effect["light_blink_suv_dubai_top"] = loadfx( "lights/light_blink_suv_dubai_top" );
    level._effect["lights_godray_beam"] = loadfx( "lights/lights_godray_beam" );
    level._effect["car_suburban_combined_emission"] = loadfx( "misc/car_suburban_combined_emission" );
    level._effect["car_suburban_bottom_front_strobe_l"] = loadfx( "misc/car_suburban_bottom_front_strobe_l" );
    level._effect["car_suburban_bottom_front_strobe_r"] = loadfx( "misc/car_suburban_bottom_front_strobe_r" );
    level._effect["car_sedan_headlight_r"] = loadfx( "misc/car_sedan_headlight_r" );
    level._effect["car_sedan_headlight_l"] = loadfx( "misc/car_sedan_headlight_l" );
    level._effect["car_sedan_taillights_combined_emission"] = loadfx( "misc/car_sedan_taillights_combined_emission" );
    level._effect["dubai_godray_skylight"] = loadfx( "maps/dubai/dubai_godray_skylight" );
    level._effect["dubai_godray_destroyed_restaurant"] = loadfx( "maps/dubai/dubai_godray_destroyed_restaurant" );
    level._effect["dubai_godray_destroyed_restaurant_large"] = loadfx( "maps/dubai/dubai_godray_destroyed_restaurant_large" );
    level._effect["dubai_searchlight_flare"] = loadfx( "lights/dubai_searchlight_flare" );
    level._effect["dubai_helicopter_console_light"] = loadfx( "maps/dubai/dubai_helicopter_console_light" );
    level._effect["dubai_helicopter_console_light_2"] = loadfx( "maps/dubai/dubai_helicopter_console_light_2" );
    level._effect["dubai_lights_atrium"] = loadfx( "lights/dubai_lights_atrium" );
    level._effect["restaurant_destruction_character_light"] = loadfx( "maps/dubai/restaurant_destruction_character_light" );
    level._effect["suburban_strobe_centered_r"] = loadfx( "misc/suburban_strobe_centered_r" );
    level._effect["suburban_strobe_centered_l"] = loadfx( "misc/suburban_strobe_centered_l" );
    level._effect["db_crashsite_fill_light"] = loadfx( "maps/dubai/db_crashsite_fill_light" );
    level._effect["db_crashsite_fill_light_sm"] = loadfx( "maps/dubai/db_crashsite_fill_light_sm" );
    level._effect["db_crashsite_gun_light_ground"] = loadfx( "maps/dubai/db_crashsite_gun_light_ground" );
    level._effect["db_atrium_godray"] = loadfx( "maps/dubai/db_atrium_godray" );
    level._effect["db_crashsite_gun_light_pickup"] = loadfx( "maps/dubai/db_crashsite_gun_light_pickup" );
    level._effect["dubai_bg_fog"] = loadfx( "maps/dubai/dubai_bg_fog" );
    level._effect["dubai_bg_fog_dark"] = loadfx( "maps/dubai/dubai_bg_fog_dark" );
    level._effect["dubai_bg_fog_xlarge"] = loadfx( "maps/dubai/dubai_bg_fog_xlarge" );
    level._effect["elevator_explosion"] = loadfx( "maps/dubai/elevator_crash" );
    level._effect["dubai_lights_elevator_flare"] = loadfx( "lights/dubai_lights_elevator_flare" );
    level._effect["dubai_elevator_light"] = loadfx( "maps/dubai/dubai_elevator_light" );
    level._effect["fire_smoke_trail_m_emitter"] = loadfx( "fire/fire_smoke_trail_m_emitter" );
    level._effect["heli_engine_fire"] = loadfx( "fire/heli_engine_fire" );
    level._effect["elevator_sparks"] = loadfx( "maps/dubai/elevator_sparks" );
    level._effect["elevator_smoke"] = loadfx( "maps/dubai/elevator_smoke" );
    level._effect["elevator_brake_sparks"] = loadfx( "maps/dubai/elevator_brake_sparks" );
    level._effect["elevator_heli_crash"] = loadfx( "maps/dubai/elevator_heli_crash" );
    level._effect["elevator_drop"] = loadfx( "maps/dubai/elevator_drop" );
    level._effect["elevator_drop_2"] = loadfx( "maps/dubai/elevator_drop_2" );
    level._effect["elevator_drop_sparks"] = loadfx( "maps/dubai/elevator_drop_sparks" );
    level._effect["fire_yuri_body"] = loadfx( "maps/dubai/fire_yuri_body" );
    level._effect["fire_yuri_limb"] = loadfx( "maps/dubai/fire_yuri_limb" );
    level._effect["fire_yuri_limb_2"] = loadfx( "maps/dubai/fire_yuri_limb_2" );
    level._effect["fire_yuri_limb_3"] = loadfx( "maps/dubai/fire_yuri_limb_3" );
    level._effect["fire_player_limb"] = loadfx( "maps/dubai/fire_player_limb" );
    level._effect["limb_fire_off"] = loadfx( "maps/dubai/limb_fire_off" );
    level._effect["body_fire_off"] = loadfx( "maps/dubai/body_fire_off" );
    level._effect["player_fire_off"] = loadfx( "maps/dubai/player_fire_off" );
    level._effect["player_helmet_fire_off"] = loadfx( "maps/dubai/player_helmet_fire_off" );
    level._effect["blackhawk_flash_armada"] = loadfx( "muzzleflashes/blackhawk_flash_armada" );
    level._effect["dubai_elevator_num_l"] = loadfx( "maps/dubai/dubai_elevator_num_l" );
    level._effect["dubai_elevator_num_g"] = loadfx( "maps/dubai/dubai_elevator_num_g" );
    level._effect["dubai_elevator_num_0"] = loadfx( "maps/dubai/dubai_elevator_num_0" );
    level._effect["dubai_elevator_num_1"] = loadfx( "maps/dubai/dubai_elevator_num_1" );
    level._effect["dubai_elevator_num_2"] = loadfx( "maps/dubai/dubai_elevator_num_2" );
    level._effect["dubai_elevator_num_3"] = loadfx( "maps/dubai/dubai_elevator_num_3" );
    level._effect["dubai_elevator_num_4"] = loadfx( "maps/dubai/dubai_elevator_num_4" );
    level._effect["dubai_elevator_num_5"] = loadfx( "maps/dubai/dubai_elevator_num_5" );
    level._effect["dubai_elevator_num_6"] = loadfx( "maps/dubai/dubai_elevator_num_6" );
    level._effect["dubai_elevator_num_7"] = loadfx( "maps/dubai/dubai_elevator_num_7" );
    level._effect["dubai_elevator_num_8"] = loadfx( "maps/dubai/dubai_elevator_num_8" );
    level._effect["dubai_elevator_num_9"] = loadfx( "maps/dubai/dubai_elevator_num_9" );
    level._effect["dubai_fountain_splash"] = loadfx( "maps/dubai/dubai_fountain_splash" );
    level._effect["dubai_fountain_splash_l"] = loadfx( "maps/dubai/dubai_fountain_splash_l" );
    level._effect["dubai_fountain_rock_splash"] = loadfx( "maps/dubai/dubai_fountain_rock_splash" );
    level._effect["dubai_water_fountain"] = loadfx( "maps/dubai/dubai_water_fountain" );
    level._effect["dubai_water_fountain_plume_runner"] = loadfx( "maps/dubai/dubai_water_fountain_plume_runner" );
    level._effect["dubai_falling_leaves"] = loadfx( "maps/dubai/dubai_falling_leaves" );
    level._effect["dubai_ocean_rock_splash"] = loadfx( "maps/dubai/dubai_ocean_rock_splash" );
    level._effect["dubai_ocean_rock_splash_2"] = loadfx( "maps/dubai/dubai_ocean_rock_splash_2" );
    level._effect["dubai_vista_glow_green"] = loadfx( "maps/dubai/dubai_vista_glow_green" );
    level._effect["dubai_vista_glow_yellow"] = loadfx( "maps/dubai/dubai_vista_glow_yellow" );
    level._effect["dubai_vista_glow_yellow_s"] = loadfx( "maps/dubai/dubai_vista_glow_yellow_s" );
    level._effect["dubai_vista_glow_yellow_s_2"] = loadfx( "maps/dubai/dubai_vista_glow_yellow_s_2" );
    level._effect["dubai_vista_glow_yellow_s_3"] = loadfx( "maps/dubai/dubai_vista_glow_yellow_s_3" );
    level._effect["dubai_vista_glow_green_l"] = loadfx( "maps/dubai/dubai_vista_glow_green_l" );
    level._effect["dubai_vista_glow_blue"] = loadfx( "maps/dubai/dubai_vista_glow_blue" );
    level._effect["dubai_vista_glow_blue_l"] = loadfx( "maps/dubai/dubai_vista_glow_blue_l" );
    level._effect["dubai_vista_glow_purple"] = loadfx( "maps/dubai/dubai_vista_glow_purple" );
    level._effect["dubai_vista_glow_red"] = loadfx( "maps/dubai/dubai_vista_glow_red" );
    level._effect["boat_red_glow"] = loadfx( "maps/dubai/boat_red_glow" );
    level._effect["dubai_vista_glow_red_2"] = loadfx( "maps/dubai/dubai_vista_glow_red_2" );
    level._effect["dubai_vista_glow_white"] = loadfx( "maps/dubai/dubai_vista_glow_white" );
    level._effect["dubai_vista_glow_white_2"] = loadfx( "maps/dubai/dubai_vista_glow_white_2" );
    level._effect["vista_traffic_car"] = loadfx( "maps/dubai/vista_traffic_car" );
    level._effect["vista_traffic_car_2"] = loadfx( "maps/dubai/vista_traffic_car_2" );
    level._effect["vista_traffic_car_short"] = loadfx( "maps/dubai/vista_traffic_car_short" );
    level._effect["vista_traffic_car_u"] = loadfx( "maps/dubai/vista_traffic_car_u" );
    level._effect["dust_spiral_dubai"] = loadfx( "dust/dust_spiral_dubai" );
    level._effect["amb_dust_battlefield"] = loadfx( "dust/amb_dust_battlefield" );
    level._effect["amb_smoke_add_dubai"] = loadfx( "smoke/amb_smoke_add_dubai" );
    level._effect["pool_splash_fountain"] = loadfx( "maps/dubai/pool_splash_fountain" );
    level._effect["birds_takeof_runner"] = loadfx( "maps/dubai/dubai_bird_runner" );
    level._effect["dubai_wind"] = loadfx( "maps/dubai/dubai_wind" );
    level._effect["amb_smoke_add_dubai_light"] = loadfx( "smoke/amb_smoke_add_dubai_light" );
    level._effect["flesh_hit"] = loadfx( "impacts/flesh_hit" );
    level._effect["grand_piano_exp"] = loadfx( "props/grand_piano_exp" );
    level._effect["rest_flower_vase"] = loadfx( "props/rest_flower_vase" );
    level._effect["foliage_dub_potted_palm_01"] = loadfx( "props/foliage_dub_potted_palm_01" );
    level._effect["dub_vase_02"] = loadfx( "props/dub_vase_02" );
    level._effect["foliage_dub_potted_spikey_plant"] = loadfx( "props/foliage_dub_potted_spikey_plant" );
    level._effect["rest_plates"] = loadfx( "props/rest_plates" );
    level._effect["rest_plates_vase"] = loadfx( "props/rest_plates_vase" );
    level._effect["dubai_elevator_glass"] = loadfx( "breakables/dubai_elevator_glass" );
    level._effect["bottles_brandy_destruct"] = loadfx( "props/bottles_brandy_destruct" );
    level._effect["bottles_wine_destruct"] = loadfx( "props/bottles_wine_destruct" );
    level._effect["bottles_vodka_destruct"] = loadfx( "props/bottles_vodka_destruct" );
    level._effect["bottles_water_destruct"] = loadfx( "props/bottles_water_destruct" );
    level._effect["bottles_tea_destruct"] = loadfx( "props/bottles_tea_destruct" );
    level._effect["bottles_misc1_destruct"] = loadfx( "props/bottles_misc1_destruct" );
    level._effect["bottles_misc2_destruct"] = loadfx( "props/bottles_misc2_destruct" );
    level._effect["bottles_misc3_destruct"] = loadfx( "props/bottles_misc3_destruct" );
    level._effect["bottles_misc4_destruct"] = loadfx( "props/bottles_misc4_destruct" );
    level._effect["bottles_misc5_destruct"] = loadfx( "props/bottles_misc5_destruct" );
    level._effect["dubai_rest_anim_round_table"] = loadfx( "props/rest_table_rnd_nodressing_dest" );
    level._effect["dubai_rest_anim_sqr_table"] = loadfx( "props/rest_table_sqr_nodressing_dest" );
    level._effect["dubai_rest_anim_sqr_table_solo"] = loadfx( "props/rest_table_square_dest" );
    level._effect["water_pipe_spray"] = loadfx( "water/water_pipe_spray" );
    level._effect["water_drips_fat_fast_speed"] = loadfx( "water/water_drips_fat_fast_speed" );
    level._effect["drips_fast"] = loadfx( "misc/drips_fast" );
    level._effect["drips_slow"] = loadfx( "misc/drips_slow" );
    level._effect["falling_dirt_light_1_runner"] = loadfx( "dust/falling_dirt_light_1_runner" );
    level._effect["smoke_white_room_linger"] = loadfx( "smoke/smoke_white_room_linger" );
    level._effect["powerline_runner"] = loadfx( "explosions/powerline_runner" );
    level._effect["cloud_ash_lite"] = loadfx( "weather/cloud_ash_lite" );
    level._effect["paper_blowing_trash"] = loadfx( "misc/paper_blowing_trash" );
    level._effect["dust_wind_fast_paper"] = loadfx( "dust/dust_wind_fast_paper" );
    level._effect["fire_generic_atlas_curl_nosmoke"] = loadfx( "fire/fire_generic_atlas_curl_nosmoke" );
    level._effect["firelp_med_pm_cheap_nodist_light"] = loadfx( "fire/firelp_med_pm_cheap_nodist_light" );
    level._effect["firelp_med_pm_nolight_nodist"] = loadfx( "fire/firelp_med_pm_nolight_nodist" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "fire/firelp_small_streak_pm_h" );
    level._effect["fire_line_sm"] = loadfx( "fire/fire_line_sm" );
    level._effect["fire_falling_runner_angled"] = loadfx( "fire/fire_falling_runner_angled" );
    level._effect["fire_ceiling_md_slow"] = loadfx( "fire/fire_ceiling_md_slow" );
    level._effect["trash_spirallo_runner"] = loadfx( "misc/trash_spirallo_runner" );
    level._effect["smoldering_smoke_windy"] = loadfx( "smoke/smoldering_smoke_windy" );
    level._effect["smoke_rolling_wind"] = loadfx( "smoke/smoke_rolling_wind" );
    level._effect["smoke_rolling_wind_short"] = loadfx( "smoke/smoke_rolling_wind_short" );
    level._effect["smoke_rolling_wind_dark"] = loadfx( "smoke/smoke_rolling_wind_dark" );
    level._effect["smoke_rolling_wind_thick"] = loadfx( "smoke/smoke_rolling_wind_thick" );
    level._effect["tread_dust_paris_small"] = loadfx( "treadfx/tread_dust_paris_small" );
    level._effect["no_effect"] = loadfx( "misc/no_effect" );
    level._effect["tread_road_sniperescape"] = loadfx( "treadfx/tread_road_sniperescape" );
    level._effect["tread_road_dubai"] = loadfx( "treadfx/tread_road_dubai" );
    level._effect["tread_road_dubai_parent"] = loadfx( "treadfx/tread_road_dubai_parent" );
    level._effect["pb_jeep_trail_road_skid_long"] = loadfx( "treadfx/pb_jeep_trail_road_skid_long" );
    level._effect["pb_jeep_trail_road_skid_long_db01"] = loadfx( "treadfx/pb_jeep_trail_road_skid_long_db01" );
    level._effect["pb_jeep_trail_road_skid_long_db02"] = loadfx( "treadfx/pb_jeep_trail_road_skid_long_db02" );
    level._effect["pb_jeep_trail_road_skid_long_db03"] = loadfx( "treadfx/pb_jeep_trail_road_skid_long_db03" );
    level._effect["pb_jeep_trail_road_skid_long_db04"] = loadfx( "treadfx/pb_jeep_trail_road_skid_long_db04" );
    level._effect["db_rest_dest_wall_explo"] = loadfx( "maps/dubai/db_rest_dest_wall_explo" );
    level._effect["db_rest_dest_metal_structure_explo"] = loadfx( "maps/dubai/db_rest_dest_metal_structure_explo" );
    level._effect["db_rest_dest_window_explo"] = loadfx( "maps/dubai/db_rest_dest_window_explo" );
    level._effect["db_rest_dest_window_ceiling_explo"] = loadfx( "maps/dubai/db_rest_dest_window_ceiling_explo" );
    level._effect["db_rest_dest_debris_flyingout"] = loadfx( "maps/dubai/db_rest_dest_debris_flyingout" );
    level._effect["ceiling_marble_collapse"] = loadfx( "explosions/ceiling_marble_collapse" );
    level._effect["db_rest_dest_fire_line_trailing"] = loadfx( "maps/dubai/db_rest_dest_fire_line_trailing" );
    level._effect["db_rest_dest_dust_rock_fall_wall"] = loadfx( "maps/dubai/db_rest_dest_dust_rock_fall_wall" );
    level._effect["db_rest_dest_dust_rock_fall_ceiling"] = loadfx( "maps/dubai/db_rest_dest_dust_rock_fall_ceiling" );
    level._effect["db_rest_dest_rokt_hit_flr_imp"] = loadfx( "maps/dubai/db_rest_dest_rokt_hit_flr_imp" );
    level._effect["db_rest_dest_marblefall_grn_linger"] = loadfx( "maps/dubai/db_rest_dest_marblefall_grn_linger" );
    level._effect["db_rest_dest_column_shatter_debris"] = loadfx( "maps/dubai/db_rest_dest_column_shatter_debris" );
    level._effect["db_rest_dest_column_shatter2_debris"] = loadfx( "maps/dubai/db_rest_dest_column_shatter2_debris" );
    level._effect["pipe_fire_looping"] = loadfx( "impacts/pipe_fire_looping" );
    level._effect["pipe_steam_looping"] = loadfx( "impacts/pipe_steam_looping" );
    level._effect["column_fall_dust_impact"] = loadfx( "dust/column_fall_dust_impact" );
    level._effect["db_rest_dest_smoldering_smk_grnd"] = loadfx( "maps/dubai/db_rest_dest_smoldering_smk_grnd" );
    level._effect["db_rest_dest_smoldering_smk_grnd_narrow"] = loadfx( "maps/dubai/db_rest_dest_smoldering_smk_grnd_narrow" );
    level._effect["db_rest_dest_falling_debris"] = loadfx( "maps/dubai/db_rest_dest_falling_debris" );
    level._effect["water_generic_explosion"] = loadfx( "water/water_generic_explosion" );
    level._effect["firelp_small_pm_a_nolight"] = loadfx( "fire/firelp_small_pm_a_nolight" );
    level._effect["firelp_small_pm_a"] = loadfx( "fire/firelp_small_pm_a" );
    level._effect["db_rest_dest_debris_rolling"] = loadfx( "maps/dubai/db_rest_dest_debris_rolling" );
    level._effect["db_throw_bottles"] = loadfx( "maps/dubai/db_throw_bottles" );
    level._effect["yuri_blood"] = loadfx( "maps/dubai/yuri_blood" );
    level._effect["yuri_blood_2"] = loadfx( "maps/dubai/yuri_blood_2" );
    level._effect["yuri_blood_3"] = loadfx( "maps/dubai/yuri_blood_3" );
    level._effect["yuri_blood_4"] = loadfx( "maps/dubai/yuri_blood_4" );
    level._effect["yuri_blood_5"] = loadfx( "maps/dubai/yuri_blood_5" );
    level._effect["yuri_blood_floor"] = loadfx( "maps/dubai/yuri_blood_floor" );
    level._effect["yuri_blood_body"] = loadfx( "maps/dubai/yuri_blood_body" );
    level._effect["blood_drip_price_nose"] = loadfx( "maps/dubai/blood_drip_price_nose" );
    level._effect["knife_attack_throat"] = loadfx( "maps/dubai/knife_attack_throat" );
    level._effect["copilot_muzzleflash"] = loadfx( "maps/dubai/copilot_muzzleflash" );
    level._effect["heli_fire"] = loadfx( "maps/dubai/heli_fire" );
    level._effect["db_heli_fire_reflect"] = loadfx( "maps/dubai/db_heli_fire_reflect" );
    level._effect["heli_sparks"] = loadfx( "maps/dubai/heli_sparks" );
    level._effect["punch_pilot"] = loadfx( "maps/dubai/punch_pilot" );
    level._effect["rooftop_heli_crash"] = loadfx( "maps/dubai/rooftop_heli_crash" );
    level._effect["yuri_headshot_blood"] = loadfx( "maps/dubai/yuri_headshot_blood" );
    level._effect["yuri_chestshot_blood"] = loadfx( "maps/dubai/yuri_chestshot_blood" );
    level._effect["generic_chestshot_blood"] = loadfx( "maps/dubai/generic_chestshot_blood" );
    level._effect["yuri_shot_blood_decal"] = loadfx( "maps/dubai/yuri_shot_blood_decal" );
    level._effect["makarov_blood"] = loadfx( "maps/dubai/makarov_blood" );
    level._effect["makarov_blood_floor"] = loadfx( "maps/dubai/makarov_blood_floor" );
    level._effect["makarov_blood_floor_2"] = loadfx( "maps/dubai/makarov_blood_floor_2" );
    level._effect["makarov_blood_floor_3"] = loadfx( "maps/dubai/makarov_blood_floor_3" );
    level._effect["makarov_blood_cough_1"] = loadfx( "maps/dubai/makarov_blood_cough_1" );
    level._effect["makarov_blood_cough_2"] = loadfx( "maps/dubai/makarov_blood_cough_2" );
    level._effect["makarov_muzzle_flash"] = loadfx( "maps/dubai/makarov_muzzle_flash" );
    level._effect["makarov_muzzle_flash_simple"] = loadfx( "maps/dubai/makarov_muzzle_flash_simple" );
    level._effect["makarov_muzzle_flash_simple_nodepth"] = loadfx( "maps/dubai/makarov_muzzle_flash_simple_nodepth" );
    level._effect["yuri_muzzle_flash"] = loadfx( "maps/dubai/yuri_muzzle_flash" );
    level._effect["makarov_punch_r"] = loadfx( "maps/dubai/makarov_punch_r" );
    level._effect["makarov_punch_r2"] = loadfx( "maps/dubai/makarov_punch_r2" );
    level._effect["makarov_punch_l"] = loadfx( "maps/dubai/makarov_punch_l" );
    level._effect["zippo_fire"] = loadfx( "maps/dubai/zippo_fire" );
    level._effect["zippo_sparks"] = loadfx( "maps/dubai/zippo_sparks" );
    level._effect["cigar_lite"] = loadfx( "maps/dubai/cigar_lite" );
    level._effect["cigar_puff"] = loadfx( "maps/dubai/cigar_puff" );
    level._effect["cigar_lite_smoke"] = loadfx( "maps/dubai/cigar_lite_smoke" );
    level._effect["cigar_smoke"] = loadfx( "maps/dubai/cigar_smoke" );
    level._effect["cigar_drop"] = loadfx( "maps/dubai/cigar_drop" );
    level._effect["blob_shadow_character"] = loadfx( "misc/blob_shadow_character" );
    level._effect["blood_smear"] = loadfx( "impacts/blood_smear_decal_dubai" );
    level._effect["blood_pool"] = loadfx( "impacts/deathfx_bloodpool_dubai" );
    level._effect["db_finale_glass_cracks_1"] = loadfx( "maps/dubai/db_finale_glass_cracks_1" );
    level._effect["dub_head_impact_dust"] = loadfx( "dust/dub_head_impact_dust" );
    level._effect["dub_head_impact_bits"] = loadfx( "dust/dub_head_impact_bits" );
    level._effect["dub_head_impact_bits_delay"] = loadfx( "dust/dub_head_impact_bits_delay" );
    level._effect["dub_head_impact_bits_close"] = loadfx( "dust/dub_head_impact_bits_close" );
    level._effect["db_finale_skylight_shatter"] = loadfx( "maps/dubai/db_finale_skylight_shatter" );
    level._effect["db_finale_skylight_glass_impact"] = loadfx( "maps/dubai/db_finale_skylight_glass_impact" );
    level._effect["db_finale_dust_grnd"] = loadfx( "maps/dubai/db_finale_dust_grnd" );
    level._effect["cloud_ash_lite_wind"] = loadfx( "weather/cloud_ash_lite_wind" );
    level._effect["leaves_fall_intense_dubai"] = loadfx( "misc/leaves_fall_intense_dubai" );
    level._effect["leaves_blow_intense_dubai"] = loadfx( "misc/leaves_blow_intense_dubai" );
    level._effect["leaves_blow_intense_dubai_med"] = loadfx( "misc/leaves_blow_intense_dubai_med" );
    level._effect["leaves_blow_intense_dubai_large"] = loadfx( "misc/leaves_blow_intense_dubai_large" );
    level._effect["dust_ground_gust_runner_dubai"] = loadfx( "dust/dust_ground_gust_runner_dubai" );
    level._effect["dust_ground_gust_runner_dubai_tree"] = loadfx( "dust/dust_ground_gust_runner_dubai_tree" );
    level._effect["dust_ground_gust_runner_dubai_slow"] = loadfx( "dust/dust_ground_gust_runner_dubai_slow" );
    level._effect["leaves_blow_tumble_dubai"] = loadfx( "misc/leaves_blow_tumble_dubai" );
    level._effect["light_blue_pulse"] = loadfx( "misc/light_blue_pulse" );
    level._effect["light_blue_pulse_offset"] = loadfx( "misc/light_blue_pulse_offset" );
    level._effect["dubai_lights_elevator_flare_00"] = loadfx( "lights/dubai_lights_elevator_flare_00" );
    level._effect["dust_ground_gust_runner_dubai_billboard"] = loadfx( "dust/dust_ground_gust_runner_dubai_billboard" );
    level._effect["leaves_blow_tumble_dubai_light"] = loadfx( "misc/leaves_blow_tumble_dubai_light" );
    level._effect["light_blue_pulse_light"] = loadfx( "misc/light_blue_pulse_light" );
    level._effect["light_blue_pulse_light_offset"] = loadfx( "misc/light_blue_pulse_light_offset" );
    level._effect["fire_line_sm_cheap_intro"] = loadfx( "fire/fire_line_sm_cheap_intro" );
    level._effect["fire_generic_atlas_small_nocull"] = loadfx( "fire/fire_generic_atlas_small_nocull" );
    level._effect["fire_generic_glow"] = loadfx( "fire/fire_generic_glow" );
    level._effect["fire_generic_atlas_small_decal"] = loadfx( "fire/fire_generic_atlas_small_decal" );
    level._effect["fire_generic_glow_small"] = loadfx( "fire/fire_generic_glow_small" );
    level._effect["fire_generic_atlas_curl"] = loadfx( "fire/fire_generic_atlas_curl" );
    level._effect["electrical_transformer_spark_runner_tight"] = loadfx( "explosions/electrical_transformer_spark_runner_tight" );
    level._effect["spark_fountain"] = loadfx( "misc/spark_fountain" );
    level._effect["amb_smoke_add_dubai_bright"] = loadfx( "smoke/amb_smoke_add_dubai_bright" );
    level._effect["amb_smoke_add_dubai_bright_spot"] = loadfx( "smoke/amb_smoke_add_dubai_bright_spot" );
    level._effect["amb_smoke_add_dubai_bright_end"] = loadfx( "smoke/amb_smoke_add_dubai_bright_end" );
    level._effect["amb_smoke_add_dubai_bright_end_dark"] = loadfx( "smoke/amb_smoke_add_dubai_bright_end_dark" );
    level._effect["amb_smoke_add_dubai_fast_end"] = loadfx( "smoke/amb_smoke_add_dubai_fast_end" );
    level._effect["amb_smoke_add_dubai_dark"] = loadfx( "smoke/amb_smoke_add_dubai_dark" );
    level._effect["dub_ending_godray"] = loadfx( "misc/dub_ending_godray" );
    level._effect["dub_ending_godray_light"] = loadfx( "misc/dub_ending_godray_light" );
    level._effect["foliage_dub_entrace_planter01"] = loadfx( "props/foliage_dub_entrace_planter01" );
    level._effect["dust_specks_ambient_dubai"] = loadfx( "dust/dust_specks_ambient_dubai" );
    level._effect["light_shaft_dust_large_dubai"] = loadfx( "dust/light_shaft_dust_large_dubai" );
    level._effect["field_fire_smolder_dubai"] = loadfx( "fire/field_fire_smolder_dubai" );
    level._effect["fire_generic_ball_burst_large_dubai"] = loadfx( "fire/fire_generic_ball_burst_large_dubai" );
    level._effect["thick_black_smoke_l_dubai"] = loadfx( "smoke/thick_black_smoke_l_dubai" );
    level._effect["embers_finale_dubai"] = loadfx( "fire/embers_finale_dubai" );
    level._effect["amb_smoke_add_dubai_fast"] = loadfx( "smoke/amb_smoke_add_dubai_fast" );
}

_id_4743()
{
    setsaveddvar( "fx_alphathreshold", 10 );
}

_id_73D0( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_wheel_back_left" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( var_0, "tag_wheel_back_left" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "tag_wheel_back_right" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_2 linkto( var_0, "tag_wheel_back_right" );
    wait 2.35;
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db01" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db01" ), var_2, "tag_origin" );
}

_id_73D1( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_wheel_back_left" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( var_0, "tag_wheel_back_left" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "tag_wheel_back_right" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_2 linkto( var_0, "tag_wheel_back_right" );
    wait 2.0;
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db02" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db02" ), var_2, "tag_origin" );
}

_id_73D2( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_wheel_back_left" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( var_0, "tag_wheel_back_left" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "tag_wheel_back_right" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_2 linkto( var_0, "tag_wheel_back_right" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db03" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db03" ), var_2, "tag_origin" );
}

_id_73D3( var_0 )
{
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_wheel_back_left" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( var_0, "tag_wheel_back_left" );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0 gettagorigin( "tag_wheel_back_right" );
    var_2.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_2 linkto( var_0, "tag_wheel_back_right" );
    wait 1.15;
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db04" ), var_1, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "pb_jeep_trail_road_skid_long_db04" ), var_2, "tag_origin" );
}

_id_73D4()
{
    var_0 = getent( "intro_truck", "targetname" );
    wait 24.8;
    playfxontag( common_scripts\utility::getfx( "glass_dust_trail_parent_dubai" ), var_0, "tag_fx4" );
    common_scripts\utility::exploder( 1104 );
    wait 0.1;
    common_scripts\utility::exploder( 1103 );
    wait 0.0;
    common_scripts\utility::exploder( 1100 );
    wait 0.0;
    common_scripts\utility::exploder( 1101 );
    wait 0.1;
    common_scripts\utility::exploder( 1102 );
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
    common_scripts\utility::flag_wait( "parachute_near_window" );
    maps\_utility::_id_27C0( var_1, var_0, 2 );
}

_id_73D5()
{
    common_scripts\utility::waitframe();
    var_0 = maps\_utility::_id_1BF9( "dubai_streetlight_01_FX_origin", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0.size <= 0 )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.angles ) )
            var_2.angles = ( 0.0, 0.0, 0.0 );

        var_3 = spawnfx( common_scripts\utility::getfx( "lighthaze_dubai" ), var_2.origin, anglestoforward( var_2.angles ), anglestoup( var_2.angles ) );
        triggerfx( var_3, -5 );
    }
}

_id_73D6()
{
    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    thread _id_742C();
    maps\_audio::aud_send_msg( "start_yuri_fire" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_body" ), level._id_73D7, "J_MainRoot" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb" ), level._id_73D7, "J_Wrist_RI" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb_3" ), level._id_73D7, "J_Wrist_LE" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb_3" ), level._id_73D7, "J_Knee_RI" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb" ), level._id_73D7, "J_Knee_LE" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb_3" ), level._id_73D7, "J_Ankle_RI" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb_3" ), level._id_73D7, "J_Ankle_LE" );
    playfxontag( common_scripts\utility::getfx( "fire_yuri_limb_2" ), level._id_73D7, "J_Neck" );
    wait 4.2;
    playfxontag( common_scripts\utility::getfx( "limb_fire_off" ), level._id_73D7, "J_Neck" );
    wait 2.0;
    playfxontag( common_scripts\utility::getfx( "body_fire_off" ), level._id_73D7, "J_MainRoot" );
    maps\_audio::aud_send_msg( "stop_yuri_fire" );
}

_id_73D8( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "fire_player_limb" ), var_0, "J_Wrist_RI" );
    playfxontag( common_scripts\utility::getfx( "fire_player_limb" ), var_0, "J_Wrist_LE" );
    wait 5.1;
    stopfxontag( common_scripts\utility::getfx( "fire_player_limb" ), var_0, "J_Wrist_RI" );
    wait 4.1;
    playfxontag( common_scripts\utility::getfx( "player_helmet_fire_off" ), var_0, "J_Elbow_LE" );
    wait 5.7;
    playfxontag( common_scripts\utility::getfx( "player_fire_off" ), var_0, "J_Elbow_LE" );
    thread _id_742D();
}

_id_73D9( var_0 )
{
    maps\_audio::aud_send_msg( "elevator_fire_start", var_0.origin );
    playfx( level._effect["elevator_heli_crash"], var_0.origin );
    playfx( level._effect["elevator_sparks"], var_0.origin );
    wait 10.0;
    playfx( level._effect["elevator_smoke"], var_0.origin );
    wait 3.0;
    playfx( level._effect["elevator_smoke"], var_0.origin );
    wait 3.0;
    playfx( level._effect["elevator_smoke"], var_0.origin );
}

_id_73DA( var_0 )
{
    playfx( level._effect["elevator_drop"], var_0.origin );
    playfx( level._effect["elevator_smoke"], var_0.origin );
}

_id_73DB( var_0 )
{
    playfx( level._effect["elevator_drop_2"], var_0.origin );
    playfx( level._effect["elevator_smoke"], var_0.origin );
}

_id_73DC( var_0 )
{
    playfx( level._effect["elevator_drop_sparks"], var_0.origin );
}

_id_73DD( var_0 )
{
    playfx( level._effect["elevator_brake_sparks"], var_0.origin );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_73DE()
{
    common_scripts\utility::waitframe();
    var_0 = getent( "elevator_initial_model", "script_noteworthy" );
    playfxontag( common_scripts\utility::getfx( "dubai_elevator_light" ), var_0, "tag_light" );
    common_scripts\utility::flag_wait( "elevator_chopper_crash_done" );
    stopfxontag( common_scripts\utility::getfx( "dubai_elevator_light" ), var_0, "tag_light" );
    wait 2;
    var_1 = getent( "elevator_replacement_model", "script_noteworthy" );
    playfxontag( common_scripts\utility::getfx( "dubai_elevator_light" ), var_1, "tag_light" );
}

_id_73DF( var_0 )
{
    common_scripts\utility::exploder( var_0.v["exploder"] );
    var_0.v["numVFX"] += 1;
    wait(var_0.v["vfxLife"]);
    var_0.v["numVFX"] -= 1;
}

_id_73E0( var_0 )
{
    for (;;)
    {
        wait 1.0;
        var_0.v["health"] -= var_0.v["healrate"];

        if ( var_0.v["health"] < 0 )
            var_0.v["health"] = 0;

        if ( common_scripts\utility::flag( "room_dmg_killall" ) )
        {
            var_0.v["health"] = 0;
            maps\_shg_fx::_id_4467( var_0.v["exploder"] );
            var_0.v["numVFX"] = 0;
        }
    }
}

_id_73E1( var_0 )
{
    for (;;)
    {
        wait 7.0;

        if ( var_0.v["health"] > 50 && var_0.v["numVFX"] < 6 )
            thread _id_73DF( var_0 );

        if ( var_0.v["health"] > 150 && var_0.v["numVFX"] < 6 )
            thread _id_73DF( var_0 );

        if ( var_0.v["health"] > 300 && var_0.v["numVFX"] < 6 )
            thread _id_73DF( var_0 );
    }
}

_id_73E2( var_0 )
{
    for (;;)
    {
        var_1 = 0;
        self waittill( "damage", var_1 );
        var_0.v["health"] += clamp( int( var_1 * 0.035 ), 1, 20 );
    }
}

_id_73E3( var_0 )
{
    thread _id_73E0( var_0 );
    thread _id_73E1( var_0 );

    for ( var_1 = 0; var_1 < var_0.v["roomTriggers"].size; var_1++ )
        var_0.v["roomTriggers"][var_1] thread _id_73E2( var_0 );
}

_id_73E4( var_0 )
{
    if ( !common_scripts\utility::flag_exist( "room_dmg_killall" ) )
        common_scripts\utility::flag_init( "room_dmg_killall" );

    var_1 = spawnstruct();

    if ( !isdefined( level._id_4775 ) )
        level._id_4775 = [];

    level._id_4775[level._id_4775.size] = var_1;
    var_1.v["health"] = 0;
    var_1.v["healrate"] = 10;
    var_1.v["numVFX"] = 0;
    var_1.v["vfxLife"] = 10;
    var_1.v["vfxOffset"] = ( 0.0, 0.0, 0.0 );
    var_1.v["fxid"] = "";
    var_1.v["exploder"] = 0;
    var_1.v["roomTriggers"] = var_0;
    return var_1;
}

_id_73E5()
{
    var_0 = getentarray( "dmg_hall1", "targetname" );
    var_1 = _id_73E4( var_0 );
    var_1.v["healrate"] = 10;
    var_1.v["exploder"] = 5100;
    thread _id_73E3( var_1 );
}

_id_73E6()
{
    var_0 = getentarray( "dmg_hall2", "targetname" );
    var_1 = _id_73E4( var_0 );
    var_1.v["healrate"] = 10;
    var_1.v["exploder"] = 5200;
    thread _id_73E3( var_1 );
}

_id_73E7()
{
    var_0 = getentarray( "dmg_hall3", "targetname" );
    var_1 = _id_73E4( var_0 );
    var_1.v["healrate"] = 10;
    var_1.v["exploder"] = 5300;
    thread _id_73E3( var_1 );
}

_id_73E8()
{
    if ( common_scripts\utility::flag_exist( "room_dmg_killall" ) )
        common_scripts\utility::flag_set( "room_dmg_killall" );
}

_id_73E9()
{
    var_0 = self;
    wait 5.0;
    playfxontag( common_scripts\utility::getfx( "dubai_lights_rest_yurikey" ), var_0, "tag_rim" );
    common_scripts\utility::flag_wait( "finale_player_jump_start" );
    stopfxontag( common_scripts\utility::getfx( "dubai_lights_rest_yurikey" ), var_0, "tag_rim" );
}

_id_73EA()
{
    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );
}

_id_73EB()
{
    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_73EC()
{
    common_scripts\utility::flag_wait( "restaurant_destruction" );
    thread _id_742C();
    thread _id_73E8();
    thread _id_73EA();
    thread _id_73EE();
    maps\_utility::delaythread( 2.6, ::_id_73EF );
    wait 2.65;
    maps\_utility::delaythread( 20, ::_id_73EB );
    thread _id_73F6();
    thread _id_73F0();
    thread _id_73F1();
    thread _id_73F2();
    thread _id_73F8();
    thread _id_73FD();
    maps\_utility::delaythread( 0, ::_id_73F3 );
    thread _id_73F7();
    thread _id_73F9();
    thread _id_73FB();
    maps\_utility::delaythread( 3.8, ::_id_7402 );
    maps\_utility::delaythread( 3.5, ::_id_73F4 );
    maps\_utility::delaythread( 3.65, ::_id_73F5 );
    maps\_utility::delaythread( 5.5, ::_id_7400 );
    maps\_utility::delaythread( 4.0, ::_id_73ED );
    maps\_utility::delaythread( 4.3, ::_id_7401 );
    maps\_utility::delaythread( 9.0, ::_id_7405 );
    maps\_utility::delaythread( 9.65, ::_id_7406 );
    maps\_utility::delaythread( 11.0, ::_id_7403 );
    common_scripts\utility::flag_wait( "finale_player_jump_start" );
    thread _id_7404();
}

_id_73ED()
{
    common_scripts\utility::exploder( 5030 );
    wait 6.0;
    maps\_shg_fx::_id_4467( 5030 );
}

_id_73EE()
{
    maps\_utility::delaythread( 0.35, common_scripts\utility::exploder, 10095 );
    wait 0.3;
    common_scripts\utility::exploder( 10096 );
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    wait 4.0;
    maps\_shg_fx::_id_4467( 10096 );
}

_id_73EF()
{
    var_0 = getdvar( "vision_set_current" );
    visionsetnaked( "dubai_restaurant_explosion_flash", 0.1 );
    setblur( 4, 0.1 );
    wait 0.3;
    visionsetnaked( var_0, 0.7 );
    setblur( 0, 0.6 );
}

_id_73F0()
{
    common_scripts\utility::exploder( 10001 );
}

_id_73F1()
{
    common_scripts\utility::exploder( 10004 );
}

_id_73F2()
{
    maps\_utility::delaythread( 0.3, common_scripts\utility::exploder, 10008 );
    maps\_utility::delaythread( 3.8, common_scripts\utility::exploder, 10009 );
    maps\_utility::delaythread( 0.15, common_scripts\utility::exploder, 10006 );
    wait 5.0;
    maps\_shg_fx::_id_4467( 10006 );
}

_id_73F3()
{
    common_scripts\utility::exploder( 10030 );
}

_id_73F4()
{
    maps\_utility::_id_2772( 0.25 );
    maps\_utility::_id_2774( 0.5 );
    maps\_utility::_id_2775();
    wait 0.4;
    maps\_utility::_id_0A16( 0.3 );
    maps\_utility::_id_0A17();
}

_id_73F5()
{
    common_scripts\utility::exploder( 10035 );
}

_id_73F6()
{
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    wait 0.25;
    common_scripts\utility::exploder( "10050" );
}

_id_73F7()
{
    wait 1.0;
    common_scripts\utility::exploder( 15010 );
}

_id_73F8()
{
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    var_0 = spawnstruct();
    _id_73FF( "10100", var_0 );
    var_1 = var_0.v["origins"];
    var_2 = var_0.v["angles"];
    var_3 = var_0.v["ents"];
    var_4 = [];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_4[var_5] = common_scripts\utility::spawn_tag_origin();
        var_4[var_5].origin = var_1[var_5];
        var_4[var_5].angles = var_2[var_5];
        var_4[var_5] linkto( level._id_4A81, "tag_origin" );
    }

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        playfxontag( common_scripts\utility::getfx( "db_rest_dest_fire_line_trailing" ), var_4[var_5], "tag_origin" );

    wait 2.0;

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        stopfxontag( common_scripts\utility::getfx( "db_rest_dest_fire_line_trailing" ), var_4[var_5], "tag_origin" );
        var_4[var_5] delete();
    }
}

_id_73F9()
{
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    wait 0.75;
    var_0 = getentarray( "des_ceilingbeam_fall_01", "script_noteworthy" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    foreach ( var_3 in var_0 )
    {
        if ( var_3.classname == "script_model" )
        {
            var_1 = var_3;
            break;
        }
    }

    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5 linkto( var_1 );
    var_6 = spawnstruct();
    _id_73FF( "10300", var_6 );
    var_7 = var_6.v["origins"];
    var_8 = var_6.v["angles"];
    var_9 = var_6.v["ents"];
    var_10 = [];

    for ( var_11 = 0; var_11 < var_7.size; var_11++ )
    {
        var_10[var_11] = common_scripts\utility::spawn_tag_origin();
        var_10[var_11].origin = var_7[var_11];
        var_10[var_11].angles = var_8[var_11];
        var_10[var_11] linkto( var_5, "tag_origin" );
    }

    for ( var_11 = 0; var_11 < var_7.size; var_11++ )
        playfxontag( common_scripts\utility::getfx( "db_rest_dest_fire_line_trailing" ), var_10[var_11], "tag_origin" );

    common_scripts\utility::flag_wait( "restaurant_destruction_floor_done" );
    wait 4.0;

    for ( var_11 = 0; var_11 < var_7.size; var_11++ )
    {
        stopfxontag( common_scripts\utility::getfx( "db_rest_dest_fire_line_trailing" ), var_10[var_11], "tag_origin" );
        var_10[var_11] delete();
    }

    var_5 delete();
}

_id_73FA()
{
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    wait 0.1;
    var_0 = getentarray( "des_ceilingbeam_fall_01", "script_noteworthy" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    foreach ( var_3 in var_0 )
    {
        if ( var_3.classname == "script_model" )
        {
            var_1 = var_3;
            break;
        }
    }

    var_5 = common_scripts\utility::spawn_tag_origin();
    var_5 linkto( var_1 );
    var_6 = spawnstruct();
    _id_73FF( "10400", var_6 );
    var_7 = var_6.v["origins"];
    var_8 = var_6.v["angles"];
    var_9 = var_6.v["ents"];
    var_10 = [];

    for ( var_11 = 0; var_11 < var_7.size; var_11++ )
    {
        var_10[var_11] = common_scripts\utility::spawn_tag_origin();
        var_10[var_11].origin = var_7[var_11];
        var_10[var_11].angles = var_8[var_11];
        var_10[var_11] linkto( var_5, "tag_origin" );
    }

    for ( var_11 = 0; var_11 < var_7.size; var_11++ )
        playfxontag( common_scripts\utility::getfx( "pipe_steam_looping" ), var_10[var_11], "tag_origin" );

    common_scripts\utility::flag_wait( "restaurant_destruction_floor_done" );
    wait 4.0;

    for ( var_11 = 0; var_11 < var_7.size; var_11++ )
    {
        stopfxontag( common_scripts\utility::getfx( "pipe_steam_looping" ), var_10[var_11], "tag_origin" );
        var_10[var_11] delete();
    }

    var_5 delete();
}

_id_73FB()
{
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    wait 0.5;
    var_0 = spawnstruct();
    _id_73FF( "10200", var_0 );
    var_1 = var_0.v["origins"];
    var_2 = var_0.v["angles"];
    var_3 = var_0.v["ents"];
    var_4 = [];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_4[var_5] = common_scripts\utility::spawn_tag_origin();
        var_4[var_5].origin = var_1[var_5];
        var_4[var_5].angles = var_2[var_5];
        var_4[var_5] linkto( level._id_73FC, "tag_origin" );
    }

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        playfxontag( common_scripts\utility::getfx( "db_rest_dest_fire_line_trailing" ), var_4[var_5], "tag_origin" );

    common_scripts\utility::flag_wait( "restaurant_destruction_floor_done" );
    wait 2.0;

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        stopfxontag( common_scripts\utility::getfx( "db_rest_dest_fire_line_trailing" ), var_4[var_5], "tag_origin" );
        var_4[var_5] delete();
    }
}

_id_73FD()
{
    common_scripts\utility::flag_wait( "restaurant_drop_section_falling" );
    var_0 = spawnstruct();
    _id_73FF( "10500", var_0 );
    var_1 = var_0.v["origins"];
    var_2 = var_0.v["angles"];
    var_3 = var_0.v["ents"];
    var_4 = [];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_4[var_5] = common_scripts\utility::spawn_tag_origin();
        var_4[var_5].origin = var_1[var_5];
        var_4[var_5].angles = var_2[var_5];
        var_4[var_5] linkto( level._id_73FE, "tag_origin" );
    }

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        playfxontag( common_scripts\utility::getfx( "db_rest_dest_smoldering_smk_grnd" ), var_4[var_5], "tag_origin" );

    common_scripts\utility::flag_wait( "restaurant_destruction_floor_done" );
    wait 5.0;

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        stopfxontag( common_scripts\utility::getfx( "db_rest_dest_smoldering_smk_grnd" ), var_4[var_5], "tag_origin" );
        var_4[var_5] delete();
    }
}

_id_73FF( var_0, var_1 )
{
    var_2 = [];
    var_3 = [];
    var_4 = [];
    var_5 = maps\_utility::string( var_0 );
    var_6 = maps\_shg_fx::_id_4446( var_5 );

    if ( isdefined( var_6 ) )
    {
        foreach ( var_8 in var_6 )
        {
            var_2[var_2.size] = var_8.v["origin"];
            var_3[var_3.size] = var_8.v["angles"];
            var_4[var_4.size] = var_8;
        }
    }

    var_1.v["origins"] = var_2;
    var_1.v["angles"] = var_3;
    var_1.v["ents"] = var_4;
}

_id_7400()
{
    common_scripts\utility::exploder( 15111 );
    wait 2.65;
    common_scripts\utility::exploder( "throw_bottle" );
}

_id_7401()
{
    level endon( "restaurant_player_falling_to_death" );
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 5;
    var_1["nearEnd"] = 10;
    var_1["nearBlur"] = 4;
    var_1["farStart"] = 600;
    var_1["farEnd"] = 5500;
    var_1["farBlur"] = 4;
    var_2 = [];
    var_2["nearStart"] = 20;
    var_2["nearEnd"] = 140;
    var_2["nearBlur"] = 8;
    var_2["farStart"] = 800;
    var_2["farEnd"] = 5500;
    var_2["farBlur"] = 1;
    maps\_utility::_id_27C0( var_0, var_2, 0.3 );
    wait 3.0;
    maps\_utility::_id_27C0( var_2, var_1, 0.2 );
    wait 3.1;
    maps\_utility::_id_27C0( var_1, var_0, 0.8 );
}

_id_7402()
{
    common_scripts\utility::exploder( 10600 );
}

_id_7403()
{
    common_scripts\utility::exploder( 15000 );
}

_id_7404()
{
    maps\_shg_fx::_id_4467( 15000 );
    maps\_shg_fx::_id_4467( 15010 );
}

_id_7405()
{
    common_scripts\utility::exploder( 10071 );
}

_id_7406()
{
    common_scripts\utility::exploder( 10072 );
}

_id_7407()
{
    wait 4.0;
    common_scripts\utility::exploder( 98 );
    playfxontag( common_scripts\utility::getfx( "yuri_blood_body" ), level._id_73D7, "J_SpineUpper" );
    wait 1.5;
    playfxontag( common_scripts\utility::getfx( "yuri_blood_4" ), level._id_73D7, "J_Jaw" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "yuri_blood" ), level._id_73D7, "J_Jaw" );
    wait 3.5;
    playfxontag( common_scripts\utility::getfx( "yuri_blood_5" ), level._id_73D7, "J_Jaw" );
    wait 5.0;
    playfxontag( common_scripts\utility::getfx( "yuri_blood_2" ), level._id_73D7, "J_Jaw" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "yuri_blood_3" ), level._id_73D7, "J_Jaw" );
    wait 3.0;
    thread _id_742D();
    common_scripts\utility::exploder( 6500 );
}

_id_7408()
{
    var_0 = getent( "sedan_dest_still_01", "script_noteworthy" );
    playfxontag( common_scripts\utility::getfx( "car_sedan_headlight_l" ), var_0, "tag_light_left_front" );
    playfxontag( common_scripts\utility::getfx( "car_sedan_headlight_r" ), var_0, "tag_light_right_front" );
    playfxontag( common_scripts\utility::getfx( "car_sedan_taillights_combined_emission" ), var_0, "tag_body" );
    var_0 waittill( "exploded" );
    stopfxontag( common_scripts\utility::getfx( "car_sedan_headlight_l" ), var_0, "tag_light_left_front" );
    stopfxontag( common_scripts\utility::getfx( "car_sedan_headlight_r" ), var_0, "tag_light_right_front" );
    stopfxontag( common_scripts\utility::getfx( "car_sedan_taillights_combined_emission" ), var_0, "tag_body" );
}

_id_7409()
{
    var_0 = getent( "sedan_dest_still_02", "script_noteworthy" );
    playfxontag( common_scripts\utility::getfx( "car_sedan_headlight_l" ), var_0, "tag_light_left_front" );
    playfxontag( common_scripts\utility::getfx( "car_sedan_headlight_r" ), var_0, "tag_light_right_front" );
    playfxontag( common_scripts\utility::getfx( "car_sedan_taillights_combined_emission" ), var_0, "tag_body" );
    var_0 waittill( "exploded" );
    stopfxontag( common_scripts\utility::getfx( "car_sedan_headlight_l" ), var_0, "tag_light_left_front" );
    stopfxontag( common_scripts\utility::getfx( "car_sedan_headlight_r" ), var_0, "tag_light_right_front" );
    stopfxontag( common_scripts\utility::getfx( "car_sedan_taillights_combined_emission" ), var_0, "tag_body" );
}

_id_740A()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self gettagorigin( "tag_light_left_front" );
    var_0.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_0 linkto( self, "tag_headlight_left", ( 7.5, 3.0, -13.5 ), ( 0.0, 0.0, 0.0 ) );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = self gettagorigin( "tag_light_right_front" );
    var_1.angles = vectortoangles( ( 0.0, 0.0, 1.0 ) );
    var_1 linkto( self, "tag_headlight_right", ( 7.5, -3.0, -13.5 ), ( 0.0, 0.0, 0.0 ) );
    maps\_vehicle::_id_2B17( "combined" );
    maps\_vehicle::_id_2B17( "strobelights" );
    playfxontag( common_scripts\utility::getfx( "suburban_strobe_centered_l" ), var_1, "tag_origin" );
    wait 0.35;
    playfxontag( common_scripts\utility::getfx( "suburban_strobe_centered_l" ), var_0, "tag_origin" );
    self waittill( "death" );
    maps\_vehicle::_id_2B18( "combined" );
    stopfxontag( common_scripts\utility::getfx( "suburban_strobe_centered_l" ), var_1, "tag_origin" );
    stopfxontag( common_scripts\utility::getfx( "suburban_strobe_centered_l" ), var_0, "tag_origin" );
    maps\_vehicle::_id_2B18( "strobelights" );
}

_id_740B()
{

}

_id_740C()
{

}

_id_740D()
{
    common_scripts\utility::exploder( 7000 );
}

_id_740E()
{
    maps\_shg_fx::_id_4467( 7000 );
}

_id_740F()
{
    common_scripts\utility::exploder( 11000 );
}

_id_7410()
{
    maps\_shg_fx::_id_4467( 11000 );
}

_id_7411()
{
    common_scripts\utility::exploder( 7500 );
}

_id_7412()
{
    maps\_shg_fx::_id_4467( 7500 );
}

_id_7413()
{
    common_scripts\utility::exploder( 5002 );
}

_id_7414()
{
    wait 15.0;
    common_scripts\utility::exploder( 5003 );
}

_id_4780()
{
    wait 0.025;
    var_0 = "treadfx/tread_road_dubai";
    var_1 = "misc/no_effect";
    var_2[0] = "script_vehicle_suburban";

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
}

_id_7415()
{
    common_scripts\utility::waitframe();
    playfxontag( common_scripts\utility::getfx( "dubai_helicopter_console_light" ), level._id_7416, "plane_dial_01" );
}

_id_7417()
{
    wait 1.0;
    stopfxontag( common_scripts\utility::getfx( "dubai_helicopter_console_light" ), level._id_7416, "plane_dial_01" );
    playfxontag( common_scripts\utility::getfx( "dubai_helicopter_console_light_2" ), level._id_7416, "plane_dial_01" );
}

_id_7418( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = self gettagorigin( var_1 );
    var_4 = 20 * var_2;
    playfxontag( common_scripts\utility::getfx( var_0 ), var_3, "tag_origin" );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
    {
        var_3.origin = self gettagorigin( var_1 );
        level common_scripts\utility::waitframe();
    }

    stopfxontag( common_scripts\utility::getfx( var_0 ), var_3, "tag_origin" );
}

_id_7419()
{
    thread _id_7418( "db_body_shadow2", "j_spine4", 60.0 );
    thread _id_7418( "db_head_shadow2", "j_head", 60.0 );
    thread _id_7418( "db_leg_shadow2", "j_hip_le", 60.0 );
}

_id_741A()
{
    var_0 = getent( "rooftop_searchlight_key", "targetname" );
    var_0 setlightcolor( ( 1.2, 1.0, 0.76 ) );
    var_0 thread maps\_lights::_id_1640( ( 1.2, 1.0, 0.76 ), ( 0.3, 0.26, 0.18 ), 0.005, 0.15 );
    var_0 setlightintensity( 2.5 );
    var_0 setlightradius( 390 );
    var_0 setlightfovrange( 95, 90 );
}

_id_741B()
{
    common_scripts\utility::flag_wait( "end_of_credits" );
    var_0 = getent( "mysterious_stranger_rimlight", "targetname" );
    var_0 setlightintensity( 8.0 );
    var_0 setlightfovrange( 35, 15 );
}

_id_741C()
{
    var_0 = getent( "atrium_fire_light_key", "targetname" );
    var_0 setlightcolor( ( 0.9, 0.7, 0.46 ) );
    var_0 thread maps\_lights::_id_1640( ( 0.9, 0.7, 0.46 ), ( 0.5, 0.46, 0.38 ), 0.005, 0.15 );
    var_0 setlightintensity( 2.9 );
    var_0 setlightfovrange( 100, 90 );
    var_0 setlightradius( 265 );
}

_id_741D()
{
    wait 8.8;
    common_scripts\utility::exploder( 20110 );
    common_scripts\utility::flag_wait( "beatdown_tackle_start" );
    maps\_shg_fx::_id_4467( 20110 );
}

_id_741E()
{
    wait 8.6;
    playfxontag( common_scripts\utility::getfx( "db_crashsite_gun_light_pickup" ), level._id_73CD, "TAG_FLASH" );
    common_scripts\utility::flag_wait( "beatdown_tackle_start" );
    stopfxontag( common_scripts\utility::getfx( "db_crashsite_gun_light_pickup" ), level._id_73CD, "TAG_FLASH" );
}

_id_004C()
{
    playfxontag( common_scripts\utility::getfx( "db_crashsite_gun_light_pickup" ), level._id_73CD, "TAG_FLASH" );
}

_id_741F()
{
    common_scripts\utility::exploder( 20222 );
    common_scripts\utility::flag_wait( "player_started_draw" );
    maps\_shg_fx::_id_4467( 20222 );
}

_id_7420()
{
    thread maps\_utility::vision_set_fog_changes( "dubai_cigar_nospec", 3.5 );
    wait 4.0;
    thread maps\_utility::vision_set_fog_changes( "dubai_cigar", 3.5 );
}

_id_01FE()
{
    common_scripts\utility::flag_wait( "beatdown_tackle_start" );
    thread maps\_utility::vision_set_fog_changes( "dubai_fall_nobloom", 3.5 );
}

_id_7421()
{
    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    playfxontag( common_scripts\utility::getfx( "heli_fire" ), level._id_7416, "footPedalB_L" );
    wait 1.5;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "air_climb_dial_01" );
    wait 1.2;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "wind_speed_dial_01" );
    wait 1.4;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "air_climb_dial_01" );
    wait 1.3;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "wind_speed_dial_01" );
    wait 0.9;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "altimeter_dial_01" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "plane_dial_01" );
    wait 0.8;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "horizon_dial_01" );
    wait 0.9;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "altimeter_dial_01" );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "plane_dial_01" );
    wait 0.8;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "altimeter_dial_01" );
    wait 0.4;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "horizon_dial_01" );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "air_climb_dial_01" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "altimeter_dial_01" );
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "plane_dial_01" );
    wait 0.4;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "wind_speed_dial_01" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "plane_dial_01" );
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "altimeter_dial_01" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "horizon_dial_01" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "wind_speed_dial_01" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "horizon_dial_01" );
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "altimeter_dial_01" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "heli_sparks" ), level._id_7416, "horizon_dial_01" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "rooftop_heli_crash" ), level._id_7416, "horizon_dial_01" );
    wait 3.0;

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );
}

_id_7422( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::spawn_tag_origin();
    var_3.origin = level._id_59A6 gettagorigin( var_1 );
    var_4 = 20 * var_2;
    playfxontag( common_scripts\utility::getfx( var_0 ), var_3, "tag_origin" );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
    {
        var_3.origin = level._id_59A6 gettagorigin( var_1 );
        level common_scripts\utility::waitframe();
    }

    stopfxontag( common_scripts\utility::getfx( var_0 ), var_3, "tag_origin" );
}

_id_7423()
{
    var_0 = 210.0;
    var_1 = 398.0;
    wait(( var_1 - var_0 ) / 30.0);
    var_0 = var_1;
    common_scripts\utility::exploder( 21025 );
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = ( level.player.origin[0], level.player.origin[1], 6625.13 );
    var_2.angles = ( 270.0, 0.0, 0.0 );
    playfxontag( common_scripts\utility::getfx( "db_heli_rooftread" ), var_2, "tag_origin" );

    for ( var_3 = 0; var_3 < 100; var_3++ )
    {
        var_4 = 6625.13;
        var_5 = ( level.player.origin[0], level.player.origin[1], var_4 );
        var_2.origin = var_5;
        level common_scripts\utility::waitframe();
    }

    stopfxontag( common_scripts\utility::getfx( "db_heli_rooftread" ), var_2, "tag_origin" );
    var_2 delete();
}

_id_7424( var_0 )
{
    var_1 = 100000;

    for (;;)
    {
        if ( var_1 < 15 )
        {
            playfxontag( common_scripts\utility::getfx( "db_blade_fire" ), var_0, "tag_origin" );
            wait 1.5;
            stopfxontag( common_scripts\utility::getfx( "db_blade_fire" ), var_0, "tag_origin" );
        }

        level common_scripts\utility::waitframe();
        var_1 = distance( var_0.origin, ( 591.584, -262.406, 8179.62 ) );
    }
}

_id_7425( var_0 )
{
    var_1 = 0.5;
    var_2 = ( 613.0, -232.0, 8191.0 );
    var_3 = ( 581.784, -307.321, 8182.8 );
    var_4 = vectornormalize( var_3 - var_2 );

    for (;;)
    {
        if ( var_1 > 0.8 )
        {
            wait 4.5;
            playfxontag( common_scripts\utility::getfx( "db_blade_shadow" ), var_0, "tag_origin" );
            wait 1.5;
            stopfxontag( common_scripts\utility::getfx( "db_blade_shadow" ), var_0, "tag_origin" );
        }

        level common_scripts\utility::waitframe();
        var_5 = var_0 gettagorigin( "tag_origin" );
        var_6 = vectornormalize( var_5 - var_2 );
        var_1 = vectordot( var_6, var_4 );
    }
}

_id_7426()
{
    var_0 = maps\_shg_fx::_id_446B( 20004 );

    foreach ( var_2 in var_0 )
    {
        var_3 = common_scripts\utility::spawn_tag_origin();
        var_3.origin = var_2.v["origin"];
        var_3.angles = var_2.v["angles"];
        var_3 linkto( self );
        thread _id_7424( var_3 );
    }

    var_0 = maps\_shg_fx::_id_446B( 20005 );

    foreach ( var_2 in var_0 )
    {
        var_3 = common_scripts\utility::spawn_tag_origin();
        var_3.origin = var_2.v["origin"];
        var_3.angles = var_2.v["angles"];
        var_3 linkto( self );
        thread _id_7425( var_3 );
    }
}

_id_7427()
{
    var_0 = self;
    playfxontag( common_scripts\utility::getfx( "dubai_lights_finale_rim1" ), var_0, "tag_key" );
    level waittill( "fx_beatdown_msg" );
    level waittill( "fx_beatdown_msg_startchoke" );
    level waittill( "fx_beatdown_msg_startslam" );
}

_id_7428()
{
    thread _id_7429();
    thread _id_741A();
    thread _id_741C();
    thread _id_742E();
    thread _id_742F();
    thread _id_741E();
    thread _id_741D();
    thread maps\_utility::vision_set_fog_changes( "dubai_fall", 0.05 );
    thread _id_01FE();
    common_scripts\utility::exploder( 20000 );
    common_scripts\utility::exploder( 20001 );
    level waittill( "fx_mak_light" );
    level common_scripts\utility::waitframe();
    thread _id_7422( "db_body_shadow", "j_spine4", 33.0 );
    level common_scripts\utility::waitframe();
    thread _id_7422( "db_head_shadow", "j_head", 24.0 );
    thread _id_7422( "db_leg_shadow", "j_hip_le", 24.0 );
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = level._id_59A6 gettagorigin( "j_head" );
    playfxontag( common_scripts\utility::getfx( "db_mak_light" ), var_0, "tag_origin" );
    var_1 = 0;
    var_2 = var_0.origin;
    var_3 = 0;

    for ( var_4 = 0; var_4 / 20.0 < 44.0; var_4++ )
    {
        if ( !var_1 )
            var_0.origin = level._id_59A6 gettagorigin( "j_head" );
        else
        {
            var_5 = level._id_59A6 gettagorigin( "j_head" );
            var_0.origin = ( var_5[0], var_5[1], var_2[2] );
        }

        level common_scripts\utility::waitframe();
        var_3++;

        if ( var_3 / 20.0 > 22 && !var_1 )
        {
            var_1 = 1;
            var_2 = var_0.origin;
        }
    }

    stopfxontag( common_scripts\utility::getfx( "db_mak_light" ), var_0, "tag_origin" );
    var_0 delete();
    level waittill( "fx_beatdown_msg" );
    maps\_shg_fx::_id_4467( 20001 );
    common_scripts\utility::exploder( 20002 );
}

_id_7429()
{
    wait 9.0;
    wait 4.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_1" ), level._id_59A6, "J_Jaw" );
    wait 2.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_2" ), level._id_59A6, "J_Jaw" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_2" ), level._id_59A6, "J_Jaw" );
    wait 2.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_1" ), level._id_59A6, "J_Jaw" );
    wait 2.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_2" ), level._id_59A6, "J_Jaw" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_2" ), level._id_59A6, "J_Jaw" );
    wait 1.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_1" ), level._id_59A6, "J_Jaw" );
    wait 2.0;
    playfxontag( common_scripts\utility::getfx( "makarov_blood_cough_2" ), level._id_59A6, "J_Jaw" );
    wait 0.2;
    common_scripts\utility::exploder( 101 );
}

_id_742A()
{
    wait 0.2;
    playfxontag( common_scripts\utility::getfx( "makarov_blood" ), level._id_59A6, "J_Clavicle_LE" );
    wait 0.4;
    common_scripts\utility::exploder( 99 );
    wait 1.5;
    playfxontag( common_scripts\utility::getfx( "makarov_muzzle_flash" ), level._id_73CD, "TAG_FLASH" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "yuri_chestshot_blood" ), level._id_73D7, "J_Shoulder_RI" );
    wait 0.1;
    common_scripts\utility::exploder( 905 );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "makarov_muzzle_flash" ), level._id_73CD, "TAG_FLASH" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "yuri_headshot_blood" ), level._id_73D7, "J_Clavicle_LE" );
    wait 0.1;
    common_scripts\utility::exploder( 906 );
    wait 0.7;
    playfxontag( common_scripts\utility::getfx( "makarov_muzzle_flash" ), level._id_73CD, "TAG_FLASH" );
    playfxontag( common_scripts\utility::getfx( "yuri_headshot_blood" ), level._id_73D7, "TAG_EYE" );
    wait 0.1;
    common_scripts\utility::exploder( 907 );
}

_id_742B()
{
    wait 0.2;
    playfxontag( common_scripts\utility::getfx( "yuri_muzzle_flash" ), level._id_73D7, "TAG_FLASH" );
    wait 0.9;
    playfxontag( common_scripts\utility::getfx( "yuri_muzzle_flash" ), level._id_73D7, "TAG_FLASH" );
    wait 0.3;
    playfxontag( common_scripts\utility::getfx( "yuri_muzzle_flash" ), level._id_73D7, "TAG_FLASH" );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "yuri_muzzle_flash" ), level._id_73D7, "TAG_FLASH" );
}

_id_742C()
{
    maps\_shg_fx::_id_4449( "vista_traffic_car" );
    maps\_shg_fx::_id_4449( "vista_traffic_car_2" );
    maps\_shg_fx::_id_4449( "vista_traffic_car_short" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_green" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_yellow" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_yellow_s" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_yellow_s_2" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_green_l" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_blue" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_blue_l" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_purple" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_red" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_red_2" );
    maps\_shg_fx::_id_4449( "dubai_vista_glow_white" );
    maps\_shg_fx::_id_4449( "boat_red_glow" );
    maps\_shg_fx::_id_4449( "vista_traffic_car_u" );
}

_id_742D()
{
    maps\_shg_fx::_id_444A( "vista_traffic_car" );
    maps\_shg_fx::_id_444A( "vista_traffic_car_2" );
    maps\_shg_fx::_id_444A( "vista_traffic_car_short" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_green" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_yellow" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_yellow_s" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_yellow_s_2" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_green_l" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_blue" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_blue_l" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_purple" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_red" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_red_2" );
    maps\_shg_fx::_id_444A( "dubai_vista_glow_white" );
    maps\_shg_fx::_id_444A( "boat_red_glow" );
    maps\_shg_fx::_id_4449( "vista_traffic_car_u" );
}

_id_742E()
{
    var_0 = maps\_shg_fx::_id_4446( 20010 );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2.v["type"] != "exploder" )
            continue;

        if ( !isdefined( var_2.v["exploder"] ) )
            continue;

        var_3 = var_2.v["origin"];
        var_4 = var_2.v["fxid"];
        var_2 thread _id_4AB9( var_4, var_3 );
    }
}

_id_4AB9( var_0, var_1 )
{
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_1;
    var_3 = common_scripts\utility::getfx( var_0 );

    if ( isdefined( var_3 ) )
        playfxontag( var_3, var_2, "tag_origin" );

    var_4 = 1;

    while ( var_4 < 1500 )
    {
        var_4 = distance( var_2.origin, level.player.origin );
        var_5 = var_2.origin - level.player geteye();
        var_6 = vectortoangles( var_5 );
        var_2.angles = ( -90, var_6[1], 0 );
        wait 0.05;
    }

    stopfxontag( var_3, var_2, "tag_origin" );
    var_2 delete();
}

_id_742F()
{
    wait 1;
    var_0 = ( 613.0, -232.0, 8191.0 );
    var_1 = 8104;
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.angles = ( 270.0, 0.0, 0.0 );
    playfxontag( common_scripts\utility::getfx( "blob_shadow_character" ), var_2, "tag_origin" );

    while ( !common_scripts\utility::flag( "stop_makarov_blobshadow" ) )
    {
        var_3 = level._id_59A6 gettagorigin( "J_SpineUpper" );
        var_2.origin = ( var_3[0], var_3[1], var_1 );
        var_4 = vectornormalize( var_3 - var_0 );
        var_2.angles = ( 270, var_4[1], 0 );
        wait 0.05;
    }

    stopfxontag( common_scripts\utility::getfx( "blob_shadow_character" ), var_2, "tag_origin" );
    var_2 delete();
}

_id_7430()
{
    wait 3.0;
    var_0 = level.player setcontents( 0 );
    magicbullet( "nosound_magicbullet", ( 889.0, -79.0, 8110.0 ), ( 889.0, -79.0, 7900.0 ), level.player );
    level.player setcontents( var_0 );
    wait 1.0;
    common_scripts\utility::exploder( 22003 );
    wait 2.0;
    common_scripts\utility::exploder( 22003 );
    wait 4.0;
    common_scripts\utility::exploder( 22003 );
    var_0 = level.player setcontents( 0 );
    magicbullet( "nosound_magicbullet", ( 887.0, -81.0, 8110.0 ), ( 887.0, -81.0, 7900.0 ), level.player );
    level.player setcontents( var_0 );
}
