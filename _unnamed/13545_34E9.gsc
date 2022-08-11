// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "russian_presidents_daughter_body_dirty" );
    self attach( "russian_presidents_daughter_head_dirty", "", 1 );
    self.headmodel = "russian_presidents_daughter_head_dirty";
    self.voice = "russian";
}

precache()
{
    precachemodel( "russian_presidents_daughter_body_dirty" );
    precachemodel( "russian_presidents_daughter_head_dirty" );
}
