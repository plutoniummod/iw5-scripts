// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_prague_civ_male_a" );
    self attach( "head_prague_civ_male_a_hat", "", 1 );
    self.headmodel = "head_prague_civ_male_a_hat";

    if ( isendstr( self.headmodel, "_hat" ) )
        codescripts\character::attachhat( "alias_prague_civilian_hooded_hats", _id_7A7E::main() );

    self.voice = "czech";
}

precache()
{
    precachemodel( "body_prague_civ_male_a" );
    precachemodel( "head_prague_civ_male_a_hat" );
    codescripts\character::precachemodelarray( _id_7A7E::main() );
}
