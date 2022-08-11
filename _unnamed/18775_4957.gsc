// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_4956::main() );
    codescripts\character::attachhead( "alias_russian_naval_heads", _id_05D7::main() );
    self.voice = "russian";
}

precache()
{
    codescripts\character::precachemodelarray( _id_4956::main() );
    codescripts\character::precachemodelarray( _id_05D7::main() );
}
