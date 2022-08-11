// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_utility::define_loadout( "london" );
    maps\createart\london_art::main();
    maps\westminster_station_precache::main();
    maps\london_fx::main();
    maps\_utility::_id_26A5( "west_station", maps\london_west::_id_0480, "Westminster Station", maps\london_west::_id_048A );
    maps\_utility::_id_26A5( "west_ending", maps\london_west::_id_0481, "Westminster", maps\london_west::_id_0491 );
    maps\_utility::_id_26A5( "west_ending_stairs", maps\london_west::_id_0482, "Westminster Stairs", maps\london_west::_id_0491 );
    maps\london_starts::main();
    maps\london_code::_id_56FB();
    maps\london_west::pre_load();
    maps\_load::main();
    maps\_drone_civilian::init();
    maps\_drone_ai::init();
    maps\london_code::_id_56F8();
    thread maps\london_starts::_id_794C();
    thread maps\london_starts::_id_794D();
    thread maps\london_starts::_id_794E();
}
