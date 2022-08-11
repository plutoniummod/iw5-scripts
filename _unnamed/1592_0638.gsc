// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_delta_elite_assault_aa" );
    codescripts\character::attachhead( "alias_air_crew_heads", _id_0637::main() );
    self.voice = "american";
}

precache()
{
    precachemodel( "body_delta_elite_assault_aa" );
    codescripts\character::precachemodelarray( _id_0637::main() );
}
