// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_a_woodland" );
    self attach( "head_makarov_b_young", "", 1 );
    self.headmodel = "head_makarov_b_young";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_a_woodland" );
    precachemodel( "head_makarov_b_young" );
}
