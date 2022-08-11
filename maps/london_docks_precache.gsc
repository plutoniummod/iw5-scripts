// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_56C9::main( "vehicle_forklift", undefined, "script_vehicle_forklift" );
    _id_56C9::main( "vehicle_forklift", "forklift_physics", "script_vehicle_forklift_physics" );
    vehicle_scripts\_littlebird::main( "vehicle_little_bird_armed", undefined, "script_vehicle_littlebird_bench" );
    vehicle_scripts\_uk_delivery_truck::main( "vehicle_uk_delivery_truck_flir", "uk_delivery_truck_physics", "script_vehicle_uk_delivery_truck_flir_physics" );
    _id_56CA::main( "vehicle_van_sas_dark_silver", "sas_van_physics", "script_vehicle_sas_van_physics" );
    vehicle_scripts\_ucav::main( "vehicle_ucav", undefined, "script_vehicle_ucav" );
    common_scripts\_destructible_types_anim_airconditioner::main();
    common_scripts\_destructible_types_anim_generator::main();
    common_scripts\_destructible_types_anim_light_fluo_single::main();
}
