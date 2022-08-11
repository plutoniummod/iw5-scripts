// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_hero_sandman_seal_udt_b" );
    self attach( "head_seal_udt_e_iw5", "", 1 );
    self.headmodel = "head_seal_udt_e_iw5";
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_hero_sandman_seal_udt_b" );
    precachemodel( "head_seal_udt_e_iw5" );
}
