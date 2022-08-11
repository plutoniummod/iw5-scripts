// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_rangers_bdu_assault_a" );
    codescripts\character::attachhead( "alias_rangers_heads", _id_0635::main() );
    self.voice = "american";
}

precache()
{
    precachemodel( "body_rangers_bdu_assault_a" );
    codescripts\character::precachemodelarray( _id_0635::main() );
}
