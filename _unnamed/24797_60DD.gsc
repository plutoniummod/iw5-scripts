// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_delta_urban_assault_aa" );
    codescripts\character::attachhead( "alias_delta_heads", _id_04B5::main() );
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_delta_urban_assault_aa" );
    codescripts\character::precachemodelarray( _id_04B5::main() );
}
