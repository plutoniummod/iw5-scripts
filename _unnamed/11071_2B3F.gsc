// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_dubai_male_a" );
    self attach( "head_dubai_male_b", "", 1 );
    self.headmodel = "head_dubai_male_b";
    self.voice = "arab";
}

precache()
{
    precachemodel( "body_dubai_male_a" );
    precachemodel( "head_dubai_male_b" );
}
