// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_spetsnaz_vlad" );
    self attach( "head_sp_spetsnaz_vlad_vladbody", "", 1 );
    self.headmodel = "head_sp_spetsnaz_vlad_vladbody";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_sp_spetsnaz_vlad" );
    precachemodel( "head_sp_spetsnaz_vlad_vladbody" );
}
