// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_hero_truck_delta_snow" );
    self attach( "head_hero_truck_headgear", "", 1 );
    self.headmodel = "head_hero_truck_headgear";
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_hero_truck_delta_snow" );
    precachemodel( "head_hero_truck_headgear" );
}
