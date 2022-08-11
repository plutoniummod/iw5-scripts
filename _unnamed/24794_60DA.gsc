// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_rpg_a_airborne" );
    self attach( "head_russian_military_c", "", 1 );
    self.headmodel = "head_russian_military_c";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_rpg_a_airborne" );
    precachemodel( "head_russian_military_c" );
}
