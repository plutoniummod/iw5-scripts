// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
        maps\createfx\innocent_fx::main();

    _id_56D1();
    _id_03E3();
    _id_4780();
}

_id_56D1()
{
    level._effect["carbomb_large_innocent"] = loadfx( "explosions/carbomb_large_innocent" );
    level._effect["carbomb_large_innocent_gas_merge"] = loadfx( "explosions/carbomb_large_innocent_gas_merge" );
    level._effect["poison_gas_attack_innocent"] = loadfx( "smoke/poison_gas_attack_innocent" );
    level._effect["poisonous_gas_spillage_innocent"] = loadfx( "smoke/poisonous_gas_spillage_innocent" );
    level._effect["poisonous_gas_sides_innocent"] = loadfx( "smoke/poisonous_gas_sides_innocent" );
    level._effect["poisonous_gas_ground_london_player_innocent"] = loadfx( "smoke/poisonous_gas_ground_london_player_innocent" );
    level._effect["poisonous_gas_spillage_innocent_dood"] = loadfx( "smoke/poisonous_gas_spillage_innocent_dood" );
}

_id_03E3()
{
    level._effect["carbomb_large"] = loadfx( "explosions/carbomb_large" );
    level._effect["cloud_ash_lite_london"] = loadfx( "weather/cloud_ash_lite_london" );
    level._effect["electrical_transformer_spark_runner_lon"] = loadfx( "explosions/electrical_transformer_spark_runner_lon" );
    level._effect["electrical_transformer_spark_runner_loop"] = loadfx( "explosions/electrical_transformer_spark_runner_loop" );
    level._effect["fire_falling_runner_london"] = loadfx( "fire/fire_falling_runner_london" );
    level._effect["fire_falling_runner_point"] = loadfx( "fire/fire_falling_runner_point" );
    level._effect["fire_falling_runner_point_far"] = loadfx( "fire/fire_falling_runner_point_far" );
    level._effect["fire_sprinkler"] = loadfx( "water/fire_sprinkler" );
    level._effect["fire_sprinkler_wide"] = loadfx( "water/fire_sprinkler_wide" );
    level._effect["fire_tree_distortion_london"] = loadfx( "fire/fire_tree_distortion_london" );
    level._effect["fire_tree_embers_london"] = loadfx( "fire/fire_tree_embers_london" );
    level._effect["fire_tree_london"] = loadfx( "fire/fire_tree_london" );
    level._effect["fire_tree_slow_london"] = loadfx( "fire/fire_tree_slow_london" );
    level._effect["firelp_med_pm"] = loadfx( "fire/firelp_med_pm" );
    level._effect["firelp_med_pm_cheap"] = loadfx( "fire/firelp_med_pm_cheap" );
    level._effect["firelp_small_pm"] = loadfx( "fire/firelp_small_pm" );
    level._effect["glass_shatter_london"] = loadfx( "misc/glass_shatter_london" );
    level._effect["ground_fog_london_river"] = loadfx( "smoke/ground_fog_london_river" );
    level._effect["heli_dust_poisonous_gas_london"] = loadfx( "treadfx/heli_dust_poisonous_gas_london" );
    level._effect["heli_dust_poisonous_gas_london2"] = loadfx( "treadfx/heli_dust_poisonous_gas_london2" );
    level._effect["light_blink_london_police_car"] = loadfx( "lights/light_blink_london_police_car" );
    level._effect["light_blink_london_police_car_gassy"] = loadfx( "lights/light_blink_london_police_car_gassy" );
    level._effect["light_blink_london_police_car_gassy_sat"] = loadfx( "lights/light_blink_london_police_car_gassy_sat" );
    level._effect["poison_gas_attack"] = loadfx( "smoke/poison_gas_attack" );
    level._effect["poisonous_gas_bubbling_left"] = loadfx( "smoke/poisonous_gas_bubbling_left" );
    level._effect["poisonous_gas_bubbling_right"] = loadfx( "smoke/poisonous_gas_bubbling_right" );
    level._effect["poisonous_gas_bubbling_small_left"] = loadfx( "smoke/poisonous_gas_bubbling_small_left" );
    level._effect["poisonous_gas_bubbling_small_right"] = loadfx( "smoke/poisonous_gas_bubbling_small_right" );
    level._effect["poisonous_gas_bubbling_start_left"] = loadfx( "smoke/poison_gas_attack" );
    level._effect["poisonous_gas_bubbling_start_right"] = loadfx( "smoke/poisonous_gas_bubbling_start_right" );
    level._effect["poisonous_gas_carbomb_cheap"] = loadfx( "explosions/poisonous_gas_carbomb_cheap" );
    level._effect["poisonous_gas_carbomb_cheap_loop"] = loadfx( "explosions/poisonous_gas_carbomb_cheap_loop" );
    level._effect["poisonous_gas_ground_london_player"] = loadfx( "smoke/poisonous_gas_ground_london_player" );
    level._effect["poisonous_gas_ground_z_fill"] = loadfx( "smoke/poisonous_gas_ground_z_fill" );
    level._effect["poisonous_gas_linger_large_subtle"] = loadfx( "smoke/poisonous_gas_linger_large_subtle" );
    level._effect["poisonous_gas_linger_large_thin"] = loadfx( "smoke/poisonous_gas_linger_large_thin" );
    level._effect["poisonous_gas_linger_low_thin"] = loadfx( "smoke/poisonous_gas_linger_low_thin" );
    level._effect["poisonous_gas_linger_medium_thick_killer"] = loadfx( "smoke/poisonous_gas_linger_medium_thick_killer" );
    level._effect["poisonous_gas_linger_medium_thick_killer_ins"] = loadfx( "smoke/poisonous_gas_linger_medium_thick_killer_instant" );
    level._effect["poisonous_gas_linger_medium_thick_killer_pulse"] = loadfx( "smoke/poisonous_gas_linger_medium_thick_killer_pulse" );
    level._effect["poisonous_gas_linger_medium_thick_sat"] = loadfx( "smoke/poisonous_gas_linger_medium_thick_sat" );
    level._effect["rain_london"] = loadfx( "weather/rain_london" );
    level._effect["rain_splash_lite_128x128"] = loadfx( "weather/rain_splash_lite_128x128" );
    level._effect["rain_splash_subtle_128x128"] = loadfx( "weather/rain_splash_subtle_128x128" );
    level._effect["rain_splash_subtle_64x64"] = loadfx( "weather/rain_splash_subtle_64x64" );
    level._effect["room_smoke_200"] = loadfx( "smoke/room_smoke_200" );
    level._effect["room_smoke_400"] = loadfx( "smoke/room_smoke_400" );
    level._effect["smoke_fill_linger_subway"] = loadfx( "smoke/smoke_fill_linger_subway" );
    level._effect["smoke_fill_linger_subway_gap"] = loadfx( "smoke/smoke_fill_linger_subway_gap" );
    level._effect["smoke_fill_linger_subway_rolling"] = loadfx( "smoke/smoke_fill_linger_subway_rolling" );
    level._effect["smoke_fill_subway"] = loadfx( "smoke/smoke_fill_subway" );
    level._effect["sparks_falling_runner_loop"] = loadfx( "explosions/sparks_falling_runner_loop" );
    level._effect["trash_spiral_runner"] = loadfx( "misc/trash_spiral_runner" );
    level._effect["sparks_car_scrape_line"] = loadfx( "misc/sparks_car_scrape_line" );
    level._effect["sparks_car_scrape_point"] = loadfx( "misc/sparks_car_scrape_point" );
    level._effect["lit_poster"] = loadfx( "explosions/tv_flatscreen_explosion" );
}

_id_4780()
{
    var_0 = "treadfx/heli_dust_default";
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "brick", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "bark", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "carpet", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "cloth", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "concrete", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "dirt", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "flesh", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "foliage", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "glass", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "grass", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "gravel", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "ice", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "metal", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "mud", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "paper", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "plaster", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "rock", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "sand", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "snow", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "water", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "wood", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "asphalt", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "ceramic", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "plastic", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "rubber", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "cushion", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "fruit", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "painted metal", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "default", var_0 );
    maps\_treadfx::_id_28EF( "script_vehicle_littlebird_bench", "none", var_0 );
}
