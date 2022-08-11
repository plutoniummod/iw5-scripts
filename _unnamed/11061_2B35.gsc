// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_prague_civ_female_drone_d" );
    self attach( "head_prague_civ_female_drone_a", "", 1 );
    self.headmodel = "head_prague_civ_female_drone_a";
    self.voice = "czech";
}

precache()
{
    precachemodel( "body_prague_civ_female_drone_d" );
    precachemodel( "head_prague_civ_female_drone_a" );
}
