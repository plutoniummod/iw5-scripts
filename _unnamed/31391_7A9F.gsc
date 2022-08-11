// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_spetsnaz_boris" );
    self attach( "head_sp_spetsnaz_derik_borisbody", "", 1 );
    self.headmodel = "head_sp_spetsnaz_derik_borisbody";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_sp_spetsnaz_boris" );
    precachemodel( "head_sp_spetsnaz_derik_borisbody" );
}
