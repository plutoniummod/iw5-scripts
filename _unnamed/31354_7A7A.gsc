// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_a" );
    codescripts\character::attachhead( "alias_russian_military_prague_heads", _id_7A79::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_a" );
    codescripts\character::precachemodelarray( _id_7A79::main() );
}
