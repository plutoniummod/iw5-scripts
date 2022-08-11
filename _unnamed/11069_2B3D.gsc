// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_gign_paris_assault" );
    self attach( "head_gign_generic_gasmask", "", 1 );
    self.headmodel = "head_gign_generic_gasmask";
    self.voice = "french";
}

precache()
{
    precachemodel( "body_gign_paris_assault" );
    precachemodel( "head_gign_generic_gasmask" );
}
