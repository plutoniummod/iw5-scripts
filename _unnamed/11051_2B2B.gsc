// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_hero_kamarov_lmg_a" );
    self attach( "head_hero_kamarov_a", "", 1 );
    self.headmodel = "head_hero_kamarov_a";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_hero_kamarov_lmg_a" );
    precachemodel( "head_hero_kamarov_a" );
}
