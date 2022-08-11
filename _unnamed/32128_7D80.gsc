// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_b_airborne" );
    codescripts\character::attachhead( "alias_russian_military_germany_heads", _id_7D7E::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_b_airborne" );
    codescripts\character::precachemodelarray( _id_7D7E::main() );
}
