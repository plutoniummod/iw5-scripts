// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_price_europe_assault_a" );
    self attach( "head_price_europe_b_winter", "", 1 );
    self.headmodel = "head_price_europe_b_winter";
    self.voice = "taskforce";
}

precache()
{
    precachemodel( "body_price_europe_assault_a" );
    precachemodel( "head_price_europe_b_winter" );
}
