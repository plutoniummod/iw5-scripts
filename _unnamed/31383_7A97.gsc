// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_airport_com_c" );
    self attach( "head_airport_a", "", 1 );
    self.headmodel = "head_airport_a";
    self.voice = "seal";
}

precache()
{
    precachemodel( "body_airport_com_c" );
    precachemodel( "head_airport_a" );
}
