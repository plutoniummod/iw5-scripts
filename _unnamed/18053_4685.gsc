// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_delta_elite_snow_assault_ab" );
    self attach( "head_hero_grinch_delta", "", 1 );
    self.headmodel = "head_hero_grinch_delta";
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_delta_elite_snow_assault_ab" );
    precachemodel( "head_hero_grinch_delta" );
}
