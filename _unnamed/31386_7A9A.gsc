// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_spetsnaz_demetry" );
    self attach( "head_sp_spetsnaz_demetry_demetrybody", "", 1 );
    self.headmodel = "head_sp_spetsnaz_demetry_demetrybody";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_sp_spetsnaz_demetry" );
    precachemodel( "head_sp_spetsnaz_demetry_demetrybody" );
}
