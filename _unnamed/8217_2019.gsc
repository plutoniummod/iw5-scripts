// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_juggernaut_nohelmet" );
    self attach( "head_hero_yuri_a", "", 1 );
    self.headmodel = "head_hero_yuri_a";
    self.voice = "taskforce";
}

precache()
{
    precachemodel( "body_juggernaut_nohelmet" );
    precachemodel( "head_hero_yuri_a" );
}
