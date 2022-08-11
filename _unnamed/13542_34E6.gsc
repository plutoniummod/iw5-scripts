// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_fso_suit_advisor" );
    self attach( "head_fso_advisor", "", 1 );
    self.headmodel = "head_fso_advisor";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_fso_suit_advisor" );
    precachemodel( "head_fso_advisor" );
}
