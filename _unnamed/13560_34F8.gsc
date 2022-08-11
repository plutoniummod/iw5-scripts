// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_india_male_a_alt" );
    self attach( "head_india_male_c", "", 1 );
    self.headmodel = "head_india_male_c";
    self.voice = "arab";
}

precache()
{
    precachemodel( "body_india_male_a_alt" );
    precachemodel( "head_india_male_c" );
}
