// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56C9::main( "vehicle_forklift", undefined, "script_vehicle_forklift" );
    _id_56C9::main( "vehicle_forklift", "forklift_physics", "script_vehicle_forklift_physics" );
    vehicle_scripts\_littlebird::main( "vehicle_little_bird_armed", undefined, "script_vehicle_littlebird_armed" );
    vehicle_scripts\_littlebird::main( "vehicle_little_bird_bench", undefined, "script_vehicle_littlebird_bench" );
    _id_56CA::main( "vehicle_van_sas_dark_silver", "sas_van_physics", "script_vehicle_sas_van_physics" );
    vehicle_scripts\_subway::main( "vehicle_subway_cart_destructible", undefined, "script_vehicle_subway_cart_destructible" );
    vehicle_scripts\_subway::main( "vehicle_subway_cart_destructible", "subway_engine", "script_vehicle_subway_engine_destructible" );
    vehicle_scripts\_ucav::main( "vehicle_ucav", undefined, "script_vehicle_ucav" );
    vehicle_scripts\_uk_delivery_truck::main( "vehicle_uk_delivery_truck_flir", "uk_delivery_truck_physics", "script_vehicle_uk_delivery_truck_flir_physics" );
    vehicle_scripts\_uk_utility_truck::main( "vehicle_uk_utility_truck_destructible_nobullets", undefined, "script_vehicle_uk_utility_truck_no_col" );
    vehicle_scripts\_uk_utility_truck::main( "vehicle_uk_utility_truck_destructible", undefined, "script_vehicle_uk_utility_truck_no_rail" );
    vehicle_scripts\_uk_utility_truck::main( "vehicle_uk_utility_truck_destructible", "uk_utility_truck_player", "script_vehicle_uk_utility_truck_no_rail_player" );
    common_scripts\_destructible_types_anim_airconditioner::main();
    common_scripts\_destructible_types_anim_generator::main();
    common_scripts\_destructible_types_anim_light_fluo_single::main();
    common_scripts\_destructible_types_anim_lockers::main();
    maps\animated_models\fence_tarp_160x82_med_01::main();
    maps\animated_models\fence_tarp_352x88_med_01::main();
    maps\animated_models\fence_tarp_draping_224x116_01::main();
    _id_56CE::main();
}
