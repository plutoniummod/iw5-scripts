// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_rpg_a" );
    self attach( "head_russian_military_a", "", 1 );
    self.headmodel = "head_russian_military_a";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_rpg_a" );
    precachemodel( "head_russian_military_a" );
}
