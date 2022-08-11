// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_prague_civ_male_c" );
    self attach( "head_prague_civ_male_b_hat", "", 1 );
    self.headmodel = "head_prague_civ_male_b_hat";

    if ( isendstr( self.headmodel, "_hat" ) )
    {
        self.hatmodel = "hat_prague_civ_e";
        self attach( self.hatmodel );
    }

    self.voice = "czech";
}

precache()
{
    precachemodel( "body_prague_civ_male_c" );
    precachemodel( "head_prague_civ_male_b_hat" );
    precachemodel( "hat_prague_civ_e" );
}
