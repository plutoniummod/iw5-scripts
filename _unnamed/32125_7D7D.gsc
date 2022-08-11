// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_7D7B::main() );
    codescripts\character::attachhead( "alias_tank_crew_heads", _id_7D7C::main() );
    self.voice = "american";
}

precache()
{
    codescripts\character::precachemodelarray( _id_7D7B::main() );
    codescripts\character::precachemodelarray( _id_7D7C::main() );
}
