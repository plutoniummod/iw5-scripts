// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_president_dirty" );
    self attach( "head_russian_president_dirty", "", 1 );
    self.headmodel = "head_russian_president_dirty";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_president_dirty" );
    precachemodel( "head_russian_president_dirty" );
}
