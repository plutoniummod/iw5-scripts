// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_2B2C::main() );
    codescripts\character::attachhead( "alias_prague_civilian_hero_heads_male", _id_2B31::main() );
    self.voice = "czech";
}

precache()
{
    codescripts\character::precachemodelarray( _id_2B2C::main() );
    codescripts\character::precachemodelarray( _id_2B31::main() );
}
