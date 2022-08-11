// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_prague_civ_male_aaa" );
    self attach( "head_prague_civ_male_b_hat", "", 1 );
    self.headmodel = "head_prague_civ_male_b_hat";
    self.voice = "czech";
}

precache()
{
    precachemodel( "body_prague_civ_male_aaa" );
    precachemodel( "head_prague_civ_male_b_hat" );
}
