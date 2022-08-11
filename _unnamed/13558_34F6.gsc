// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_india_male_a" );
    self attach( "head_india_male_a", "", 1 );
    self.headmodel = "head_india_male_a";
    self.voice = "arab";
}

precache()
{
    precachemodel( "body_india_male_a" );
    precachemodel( "head_india_male_a" );
}
