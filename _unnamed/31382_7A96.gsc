// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_airport_com_b" );
    self attach( "head_airport_d", "", 1 );
    self.headmodel = "head_airport_d";
    self.voice = "seal";
}

precache()
{
    precachemodel( "body_airport_com_b" );
    precachemodel( "head_airport_d" );
}
