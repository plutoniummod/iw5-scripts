// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_tank_crew_a" );
    self attach( "head_tank_cc", "", 1 );
    self.headmodel = "head_tank_cc";
    self.voice = "american";
}

precache()
{
    precachemodel( "body_tank_crew_a" );
    precachemodel( "head_tank_cc" );
}
