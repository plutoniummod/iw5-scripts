// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.wave_table = "sp/so_survival/tier_4.csv";
    level.loadout_table = "sp/so_survival/tier_4.csv";
    maps\mp\mp_alpha_precache::main();
    maps\createart\mp_alpha_art::main();
    maps\mp\mp_alpha_fx::main();
    maps\createfx\mp_alpha_fx::main();
    maps\_so_survival::_id_3F65();
    maps\_load::main();
    ambientplay( "ambient_mp_alpha" );
    maps\_utility::set_vision_set( "mp_alpha", 0 );
    maps\_so_survival::_id_3F66();
    maps\_compass::setupminimap( "compass_map_mp_alpha" );
    maps\_so_survival::_id_3F67();
}
