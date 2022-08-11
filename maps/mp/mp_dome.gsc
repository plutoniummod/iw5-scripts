// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_dome_precache::main();
    maps\createart\mp_dome_art::main();
    maps\mp\mp_dome_fx::main();
    maps\mp\_explosive_barrels::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_dome" );
    maps\mp\_compass::setupminimap( "compass_map_mp_dome" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    audio_settings();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "quarry", 0.15, 0.9, 2 );
}
