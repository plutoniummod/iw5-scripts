// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_doctor" );
    self attach( "head_doctor", "", 1 );
    self.headmodel = "head_doctor";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_doctor" );
    precachemodel( "head_doctor" );
}
