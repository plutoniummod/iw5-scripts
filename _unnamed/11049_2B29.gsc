// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_b_woodland_dusty" );
    codescripts\character::attachhead( "alias_russian_military_heavy_heads", _id_2B21::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_b_woodland_dusty" );
    codescripts\character::precachemodelarray( _id_2B21::main() );
}
