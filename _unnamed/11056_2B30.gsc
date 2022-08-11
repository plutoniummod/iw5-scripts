// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_2B2F::main() );
    self attach( "head_prague_civ_male_drone_a", "", 1 );
    self.headmodel = "head_prague_civ_male_drone_a";
    self.voice = "czech";
}

precache()
{
    codescripts\character::precachemodelarray( _id_2B2F::main() );
    precachemodel( "head_prague_civ_male_drone_a" );
}
