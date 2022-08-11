// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_7A2C();
    level._id_7A2B = [];
    maps\london_code::_id_571E( "westminster_anim", maps\westminster_tunnels_anim::main );
    maps\london_code::_id_571E( "force_door_shut", maps\westminster_tunnels_anim::_id_7A10 );
    maps\london_code::_id_571E( "manage_player_position", maps\westminster_truck_movement::_id_7A09 );
    maps\london_code::_id_571E( "stop_manage_player_position", maps\westminster_truck_movement::_id_7A0C );
    maps\createart\london_art::main();
    maps\london_precache::main();
    maps\london_fx::main();
    maps\london_code::_id_56FB();
    maps\london_docks::pre_load();
    maps\westminster_tunnels::pre_load();
    maps\london_docks_script_starts::main();
    maps\westminster_starts::main();
    maps\london_starts::main();
    setsaveddvar( "sm_lightscore_eyeprojectdist", 4000 );
    setsaveddvar( "sm_qualitySpotShadow", 1 );
    setsaveddvar( "r_specularColorScale", 2 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    setnorthyaw( 90 );
    maps\_load::main();
    maps\london_code::_id_56F8();
    maps\london_starts::_id_7949();
}

_id_7A2C()
{

}

_id_7A2D()
{

}
