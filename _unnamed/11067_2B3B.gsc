// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_hero_sandman_delta" );
    self attach( "head_hero_sandman_gasmask", "", 1 );
    self.headmodel = "head_hero_sandman_gasmask";
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_hero_sandman_delta" );
    precachemodel( "head_hero_sandman_gasmask" );
}
