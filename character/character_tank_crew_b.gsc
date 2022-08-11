// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_tank_crew_b" );
    self attach( "head_tank_a", "", 1 );
    self.headmodel = "head_tank_a";
    self.voice = "american";
}

precache()
{
    precachemodel( "body_tank_crew_b" );
    precachemodel( "head_tank_a" );
}
