// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_fso_suit_a" );
    self attach( "head_fso_f", "", 1 );
    self.headmodel = "head_fso_f";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_fso_suit_a" );
    precachemodel( "head_fso_f" );
}
