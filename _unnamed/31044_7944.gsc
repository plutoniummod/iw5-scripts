// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_7942::main() );
    codescripts\character::attachhead( "alias_civilian_heads_female", _id_7943::main() );
    self.voice = "british";
}

precache()
{
    codescripts\character::precachemodelarray( _id_7942::main() );
    codescripts\character::precachemodelarray( _id_7943::main() );
}
