// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    vehicle_scripts\_subway::main( "vehicle_subway_cart_destructible", undefined, "script_vehicle_subway_cart_destructible" );
    vehicle_scripts\_subway::main( "vehicle_subway_cart_destructible", "subway_engine", "script_vehicle_subway_engine_destructible" );
    vehicle_scripts\_uk_utility_truck::main( "vehicle_uk_utility_truck_destructible", undefined, "script_vehicle_uk_utility_truck" );
    vehicle_scripts\_uk_utility_truck::main( "vehicle_uk_utility_truck_destructible", "uk_utility_truck_player", "script_vehicle_uk_utility_truck_no_rail_player" );
    common_scripts\_destructible_types_anim_airconditioner::main();
    common_scripts\_destructible_types_anim_generator::main();
    common_scripts\_destructible_types_anim_light_fluo_single::main();
}
