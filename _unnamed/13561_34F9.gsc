// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_india_male_b_alt" );
    self attach( "head_india_male_d", "", 1 );
    self.headmodel = "head_india_male_d";
    self.voice = "arab";
}

precache()
{
    precachemodel( "body_india_male_b_alt" );
    precachemodel( "head_india_male_d" );
}