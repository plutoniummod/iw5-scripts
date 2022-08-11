// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "fullbody_gign_paris_hero" );
    self attach( "head_gign_saber_gasmask", "", 1 );
    self.headmodel = "head_gign_saber_gasmask";
    self.voice = "french";
}

precache()
{
    precachemodel( "fullbody_gign_paris_hero" );
    precachemodel( "head_gign_saber_gasmask" );
}
