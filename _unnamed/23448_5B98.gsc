// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_warlord" );
    self attach( "head_warlord", "", 1 );
    self.headmodel = "head_warlord";
    self.voice = "african";
}

precache()
{
    precachemodel( "body_warlord" );
    precachemodel( "head_warlord" );
}
