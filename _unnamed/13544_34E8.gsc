// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_fso_vest_e" );
    self attach( "head_fso_commander_hat", "", 1 );
    self.headmodel = "head_fso_commander_hat";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_fso_vest_e" );
    precachemodel( "head_fso_commander_hat" );
}
