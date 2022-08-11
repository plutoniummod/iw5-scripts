// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_henchmen_shotgun_a" );
    self attach( "head_vil_makarov", "", 1 );
    self.headmodel = "head_vil_makarov";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_henchmen_shotgun_a" );
    precachemodel( "head_vil_makarov" );
}
