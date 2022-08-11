// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56D0::main();
    _id_56D3();
    _id_56D1();
    _id_56D2();
}

_id_56D1()
{
    level._effect["forklift_blinklight"] = loadfx( "misc/light_blink_forklift" );
    level._effect["forklift_headlight"] = loadfx( "misc/car_headlight_forklift" );
    level._effect["chase_heli_spotlight"] = loadfx( "misc/chase_heli_spotlight_model" );
    level._effect["chase_heli_spotlight_cheap"] = loadfx( "misc/docks_heli_spotlight_model_cheap" );
    level._effect["docks_heli_spotlight"] = loadfx( "misc/docks_heli_spotlight_model" );
    level._effect["docks_heli_spotlight_cheap"] = loadfx( "misc/docks_heli_spotlight_model_cheap" );
    level._effect["chopper_flares"] = loadfx( "misc/flares_cobra" );
    level._effect["impact_fx"] = loadfx( "impacts/flesh_hit_body_fatal_exit" );
    level._effect["impact_fx_nonfatal"] = loadfx( "impacts/flesh_hit_body_nonfatal" );
    level._effect["rpg_trail"] = loadfx( "smoke/smoke_geotrail_rpg" );
    level._effect["rpg_muzzle"] = loadfx( "muzzleflashes/at4_flash" );
    level._effect["rpg_explode"] = loadfx( "explosions/rpg_wall_impact" );
    level._effect["interactive_tv_light"] = loadfx( "props/interactive_tv_light" );
    level._effect["clouds_predator"] = loadfx( "misc/clouds_predator" );
    level._effect["silencer_flash"] = loadfx( "muzzleflashes/m4m203_silencer" );
    level._effect["minigun_shells"] = loadfx( "shellejects/20mm_cargoship" );
}

_id_56D2()
{
    level._effect["waterfall_drainage_short_london"] = loadfx( "water/waterfall_drainage_short_london" );
    level._effect["waterfall_splash_medium_london"] = loadfx( "water/waterfall_splash_medium_london" );
    level._effect["drainpipe_runoff"] = loadfx( "water/drainpipe_runoff" );
    level._effect["drainpipe_runoff_splash"] = loadfx( "water/drainpipe_runoff_splash" );
    level._effect["ride_parallax_debris"] = loadfx( "misc/ride_parallax_debris" );
    level._effect["light_glow_white_london"] = loadfx( "misc/light_glow_white_london" );
    level._effect["mist_drifting"] = loadfx( "smoke/mist_drifting" );
    level._effect["mist_distant_drifting"] = loadfx( "smoke/mist_distant_drifting" );
    level._effect["mist_drifting_groundfog"] = loadfx( "smoke/mist_drifting_groundfog" );
    level._effect["mist_drifting_london_docks"] = loadfx( "smoke/mist_drifting_london_docks" );
    level._effect["ground_fog_london_river"] = loadfx( "smoke/ground_fog_london_river" );
    level._effect["room_smoke_200"] = loadfx( "smoke/room_smoke_200" );
    level._effect["room_smoke_400"] = loadfx( "smoke/room_smoke_400" );
    level._effect["rain_london"] = loadfx( "weather/rain_london" );
    level._effect["rain_london_fill"] = loadfx( "weather/rain_london_fill" );
    level._effect["rain_noise_splashes"] = loadfx( "weather/rain_noise_splashes" );
    level._effect["rain_splash_subtle_64x64"] = loadfx( "weather/rain_splash_subtle_64x64" );
    level._effect["rain_splash_subtle_128x128"] = loadfx( "weather/rain_splash_subtle_128x128" );
    level._effect["rain_splash_lite_64x64"] = loadfx( "weather/rain_splash_lite_64x64" );
    level._effect["rain_splash_lite_128x128"] = loadfx( "weather/rain_splash_lite_128x128" );
    level._effect["lighthaze_london"] = loadfx( "misc/lighthaze_london" );
    level._effect["firelp_med_pm"] = loadfx( "fire/firelp_med_pm" );
    level._effect["firelp_med_pm_cheap"] = loadfx( "fire/firelp_med_pm_cheap" );
    level._effect["firelp_small_pm"] = loadfx( "fire/firelp_small_pm" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["steam_vent_large_wind"] = loadfx( "smoke/steam_vent_large_wind" );
    level._effect["fire_tree_london"] = loadfx( "fire/fire_tree_london" );
    level._effect["fire_tree_slow_london"] = loadfx( "fire/fire_tree_slow_london" );
    level._effect["fire_falling_runner_london"] = loadfx( "fire/fire_falling_runner_london" );
    level._effect["fire_tree_embers_london"] = loadfx( "fire/fire_tree_embers_london" );
    level._effect["fire_tree_distortion_london"] = loadfx( "fire/fire_tree_distortion_london" );
    level._effect["collumn_explosion"] = loadfx( "explosions/collumn_explosion" );
    level._effect["collumn_explosion_dense"] = loadfx( "explosions/collumn_explosion_dense" );
    level._effect["uk_utility_truck_debris"] = loadfx( "misc/uk_utility_truck_debris" );
    level._effect["uk_utility_truck_spew"] = loadfx( "misc/uk_utility_truck_spew" );
    level._effect["truck_explosion_subway"] = loadfx( "explosions/truck_explosion_subway" );
    level._effect["smoke_fill_subway"] = loadfx( "smoke/smoke_fill_subway" );
    level._effect["smoke_fill_linger_subway"] = loadfx( "smoke/smoke_fill_linger_subway" );
    level._effect["smoke_fill_linger_subway_rolling"] = loadfx( "smoke/smoke_fill_linger_subway_rolling" );
    level._effect["smoke_fill_linger_subway_gap"] = loadfx( "smoke/smoke_fill_linger_subway_gap" );
    level._effect["sparks_car_scrape_line"] = loadfx( "misc/sparks_car_scrape_line" );
    level._effect["sparks_car_scrape_point"] = loadfx( "misc/sparks_car_scrape_point" );
    level._effect["debris_subway_fallover"] = loadfx( "misc/debris_subway_fallover" );
    level._effect["debris_subway_fallover_sparky"] = loadfx( "misc/debris_subway_fallover_sparky" );
    level._effect["debris_subway_impact_line"] = loadfx( "misc/debris_subway_impact_line" );
    level._effect["debris_subway_scrape_line"] = loadfx( "misc/debris_subway_scrape_line" );
    level._effect["debris_subway_scrape_line_short"] = loadfx( "misc/debris_subway_scrape_line_short" );
    level._effect["debris_subway_scrape_line_short_heavy"] = loadfx( "misc/debris_subway_scrape_line_short_heavy" );
    level._effect["debris_subway_scrape_player"] = loadfx( "misc/debris_subway_scrape_player" );
    level._effect["sparks_subway_scrape_line"] = loadfx( "misc/sparks_subway_scrape_line" );
    level._effect["sparks_subway_scrape_line_short"] = loadfx( "misc/sparks_subway_scrape_line_short" );
    level._effect["sparks_subway_scrape_line_short_diminishing"] = loadfx( "misc/sparks_subway_scrape_line_short_diminishing" );
    level._effect["sparks_subway_scrape_line_short_heavy"] = loadfx( "misc/sparks_subway_scrape_line_short_heavy" );
    level._effect["sparks_subway_scrape_player"] = loadfx( "misc/sparks_subway_scrape_player" );
    level._effect["sparks_subway_scrape_point"] = loadfx( "misc/sparks_subway_scrape_point" );
    level._effect["sparks_subway_scrape_point_wheels"] = loadfx( "misc/sparks_subway_scrape_point_wheels" );
    level._effect["sparks_subway_truck_collision"] = loadfx( "misc/sparks_subway_truck_collision" );
    level._effect["sparks_truck_scrape_line_short_diminishing"] = loadfx( "misc/sparks_truck_scrape_line_short_diminishing" );
    level._effect["hand_dirt_drag"] = loadfx( "smoke/hand_dirt_drag" );
    level._effect["vehicle_sever_subway"] = loadfx( "explosions/vehicle_sever_subway" );
    level._effect["light_blink_subway"] = loadfx( "lights/light_blink_subway" );
    level._effect["light_blink_london_police_car"] = loadfx( "lights/light_blink_london_police_car" );
    level._effect["light_blink_london_police_car_gassy"] = loadfx( "lights/light_blink_london_police_car_gassy" );
    level._effect["light_blink_london_police_car_gassy_sat"] = loadfx( "lights/light_blink_london_police_car_gassy_sat" );
    level._effect["sparks_falling_runner_loop"] = loadfx( "explosions/sparks_falling_runner_loop" );
    level._effect["transformer_spark_runner_loop"] = loadfx( "explosions/transformer_spark_runner_loop" );
    level._effect["generator_spark_runner_loop"] = loadfx( "explosions/generator_spark_runner_loop" );
    level._effect["electrical_transformer_spark_runner_loop"] = loadfx( "explosions/electrical_transformer_spark_runner_loop" );
    level._effect["electrical_transformer_spark_runner_lon"] = loadfx( "explosions/electrical_transformer_spark_runner_lon" );
    level._effect["tread_dust_london_loop"] = loadfx( "treadfx/tread_dust_london_loop" );
    level._effect["cloud_ash_lite_london"] = loadfx( "weather/cloud_ash_lite_london" );
    level._effect["falling_dirt_frequent_runner"] = loadfx( "dust/falling_dirt_frequent_runner" );
    level._effect["fire_sprinkler"] = loadfx( "water/fire_sprinkler" );
    level._effect["fire_sprinkler_wide"] = loadfx( "water/fire_sprinkler_wide" );
    level._effect["water_pipe_spray_splash_z"] = loadfx( "water/water_pipe_spray_splash_z" );
    level._effect["dirt_kickup_hands"] = loadfx( "misc/dirt_kickup_hands" );
    level._effect["dirt_kickup_hands_light"] = loadfx( "misc/dirt_kickup_hands_light" );
    level._effect["dirt_kickup_head"] = loadfx( "misc/dirt_kickup_head" );
    level._effect["glass_shatter_cone"] = loadfx( "misc/glass_shatter_cone" );
    level._effect["large_vehicle_explosion_london"] = loadfx( "explosions/large_vehicle_explosion_london" );
    level._effect["wood_barrier_debris"] = loadfx( "explosions/wood_barrier_debris" );
    level._effect["large_glass_london_kick"] = loadfx( "misc/large_glass_london_kick" );
    level._effect["med_glass_london_kick"] = loadfx( "misc/med_glass_london_kick" );
    level._effect["poison_gas_attack"] = loadfx( "smoke/poison_gas_attack" );
    level._effect["dirt_kickup_concrete_cylinder_loop"] = loadfx( "misc/dirt_kickup_concrete_cylinder_loop" );
    level._effect["dirt_kickup_concrete_cylinder"] = loadfx( "misc/dirt_kickup_concrete_cylinder" );
}

_id_56D3()
{
    animscripts\utility::_id_24BB( "asphalt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BB( "brick", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BB( "concrete", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BB( "dirt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BB( "mud", loadfx( "impacts/footstep_mud" ) );
    animscripts\utility::_id_24BB( "rock", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BB( "sand", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BB( "water", loadfx( "impacts/footstep_water" ) );
    animscripts\utility::_id_24BC( "asphalt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "brick", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "concrete", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "dirt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "mud", loadfx( "impacts/footstep_mud" ) );
    animscripts\utility::_id_24BC( "rock", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "sand", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BC( "water", loadfx( "impacts/footstep_water" ) );
    animscripts\utility::_id_24BD( "bodyfall small", "J_SpineLower", "dirt", loadfx( "impacts/bodyfall_dust_small_runner" ), "bodyfall_", "_small" );
    animscripts\utility::_id_24BD( "bodyfall small", "J_SpineLower", "concrete", loadfx( "impacts/bodyfall_default_small_runner" ), "bodyfall_", "_small" );
    animscripts\utility::_id_24BD( "bodyfall small", "J_SpineLower", "asphalt", loadfx( "impacts/bodyfall_default_small_runner" ), "bodyfall_", "_small" );
    animscripts\utility::_id_24BD( "bodyfall small", "J_SpineLower", "rock", loadfx( "impacts/bodyfall_default_small_runner" ), "bodyfall_", "_small" );
    animscripts\utility::_id_24BD( "bodyfall large", "J_SpineLower", "dirt", loadfx( "impacts/bodyfall_dust_large_runner" ), "bodyfall_", "_large" );
    animscripts\utility::_id_24BD( "bodyfall large", "J_SpineLower", "concrete", loadfx( "impacts/bodyfall_default_large_runner" ), "bodyfall_", "_large" );
    animscripts\utility::_id_24BD( "bodyfall large", "J_SpineLower", "asphalt", loadfx( "impacts/bodyfall_default_large_runner" ), "bodyfall_", "_large" );
    animscripts\utility::_id_24BD( "bodyfall large", "J_SpineLower", "rock", loadfx( "impacts/bodyfall_default_large_runner" ), "bodyfall_", "_large" );
    animscripts\utility::_id_24BD( "knee fx left", "J_Knee_LE", "dirt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx left", "J_Knee_LE", "concrete", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx left", "J_Knee_LE", "asphalt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx left", "J_Knee_LE", "rock", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx left", "J_Knee_LE", "mud", loadfx( "impacts/footstep_mud" ) );
    animscripts\utility::_id_24BD( "knee fx right", "J_Knee_RI", "dirt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx right", "J_Knee_RI", "concrete", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx right", "J_Knee_RI", "asphalt", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx right", "J_Knee_RI", "rock", loadfx( "impacts/footstep_dust" ) );
    animscripts\utility::_id_24BD( "knee fx right", "J_Knee_RI", "mud", loadfx( "impacts/footstep_mud" ) );
}

_id_56D4( var_0, var_1 )
{
    if ( _id_56D6() )
    {
        animscripts\notetracks::_id_20D0( var_0, "water" );
        return 1;
    }

    return 0;
}

_id_56D5( var_0, var_1 )
{
    if ( _id_56D6() )
    {
        animscripts\notetracks::_id_20CE( var_0, "water" );
        return 1;
    }

    return 0;
}

_id_56D6()
{
    foreach ( var_1 in level._id_56D7 )
    {
        if ( !isdefined( var_1 ) )
        {
            level._id_56D7 = common_scripts\utility::array_remove( level._id_56D7, var_1 );
            continue;
        }

        if ( self istouching( var_1 ) )
            return 1;
    }

    return 0;
}
