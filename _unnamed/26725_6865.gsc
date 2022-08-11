// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_naval_captain_a" );
    self attach( "head_russian_naval_captain_a", "", 1 );
    self.headmodel = "head_russian_naval_captain_a";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_naval_captain_a" );
    precachemodel( "head_russian_naval_captain_a" );
}
