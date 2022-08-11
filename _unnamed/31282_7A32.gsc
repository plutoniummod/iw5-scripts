// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_africa_civ_male_c" );
    codescripts\character::attachhead( "alias_africa_civilian_male_heads", _id_7A2F::main() );
    self.voice = "african";
}

precache()
{
    precachemodel( "body_africa_civ_male_c" );
    codescripts\character::precachemodelarray( _id_7A2F::main() );
}
