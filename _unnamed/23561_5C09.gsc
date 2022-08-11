// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_rpg_a_arctic" );
    self attach( "head_russian_military_a", "", 1 );
    self.headmodel = "head_russian_military_a";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_rpg_a_arctic" );
    precachemodel( "head_russian_military_a" );
}
