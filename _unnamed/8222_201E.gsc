// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_delta_elite_shotgun_a" );
    self attach( "head_hero_grinch_gasmask_delta", "", 1 );
    self.headmodel = "head_hero_grinch_gasmask_delta";
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_delta_elite_shotgun_a" );
    precachemodel( "head_hero_grinch_gasmask_delta" );
}
