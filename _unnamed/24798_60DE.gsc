// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_delta_urban_assault_ab" );
    codescripts\character::attachhead( "alias_delta_heads_longsleeves", _id_04B6::main() );
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_delta_urban_assault_ab" );
    codescripts\character::precachemodelarray( _id_04B6::main() );
}
