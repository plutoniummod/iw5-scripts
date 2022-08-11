// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_05DE::main() );
    codescripts\character::attachhead( "alias_civilian_heads_female_drone", _id_05DF::main() );
    self.voice = "british";
}

precache()
{
    codescripts\character::precachemodelarray( _id_05DE::main() );
    codescripts\character::precachemodelarray( _id_05DF::main() );
}
