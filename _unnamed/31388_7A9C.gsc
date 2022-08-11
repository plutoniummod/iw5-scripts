// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_spetsnaz_yuri" );
    self attach( "head_sp_spetsnaz_yuri_yuribody", "", 1 );
    self.headmodel = "head_sp_spetsnaz_yuri_yuribody";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_sp_spetsnaz_yuri" );
    precachemodel( "head_sp_spetsnaz_yuri_yuribody" );
}
