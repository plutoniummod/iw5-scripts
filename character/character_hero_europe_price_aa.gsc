// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_price_europe_assault_aa" );
    self attach( "head_price_europe_a_boonie", "", 1 );
    self.headmodel = "head_price_europe_a_boonie";
    self.voice = "taskforce";
}

precache()
{
    precachemodel( "body_price_europe_assault_aa" );
    precachemodel( "head_price_europe_a_boonie" );
}
