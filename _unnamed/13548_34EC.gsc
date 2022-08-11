// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_a_black" );
    codescripts\character::attachhead( "alias_russian_military_black_heads", _id_34EB::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_a_black" );
    codescripts\character::precachemodelarray( _id_34EB::main() );
}
