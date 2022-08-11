// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_dubai_male_c_alt" );
    self attach( "head_dubai_male_a", "", 1 );
    self.headmodel = "head_dubai_male_a";
    self.voice = "arab";
}

precache()
{
    precachemodel( "body_dubai_male_c_alt" );
    precachemodel( "head_dubai_male_a" );
}
