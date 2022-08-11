// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_2B2C::main() );
    self attach( "head_prague_civ_male_a_hat", "", 1 );
    self.headmodel = "head_prague_civ_male_a_hat";

    if ( isendstr( self.headmodel, "_hat" ) )
        codescripts\character::attachhat( "alias_prague_civilian_nonhood_hats", _id_2B2D::main() );

    self.voice = "czech";
}

precache()
{
    codescripts\character::precachemodelarray( _id_2B2C::main() );
    precachemodel( "head_prague_civ_male_a_hat" );
    codescripts\character::precachemodelarray( _id_2B2D::main() );
}
