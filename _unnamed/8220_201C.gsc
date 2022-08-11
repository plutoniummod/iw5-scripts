// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_gign_paris_lmg" );
    self attach( "head_gign_generic_gasmask", "", 1 );
    self.headmodel = "head_gign_generic_gasmask";
    self.voice = "french";
}

precache()
{
    precachemodel( "body_gign_paris_lmg" );
    precachemodel( "head_gign_generic_gasmask" );
}
