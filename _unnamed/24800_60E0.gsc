// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_volk_a" );
    self attach( "head_volk_a", "", 1 );
    self.headmodel = "head_volk_a";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_volk_a" );
    precachemodel( "head_volk_a" );
}
