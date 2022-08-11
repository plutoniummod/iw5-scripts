// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_b_arctic" );
    codescripts\character::attachhead( "alias_russian_military_rescue_heads", _id_5C06::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_b_arctic" );
    codescripts\character::precachemodelarray( _id_5C06::main() );
}
