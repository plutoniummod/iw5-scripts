// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_dubai_male_b" );
    self attach( "head_dubai_male_d", "", 1 );
    self.headmodel = "head_dubai_male_d";
    self.voice = "arab";
}

precache()
{
    precachemodel( "body_dubai_male_b" );
    precachemodel( "head_dubai_male_d" );
}
