// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_7942::main() );
    codescripts\character::attachhead( "alias_civilian_dubai_heads_female", _id_2B45::main() );
    self.voice = "arab";
}

precache()
{
    codescripts\character::precachemodelarray( _id_7942::main() );
    codescripts\character::precachemodelarray( _id_2B45::main() );
}
