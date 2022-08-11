// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_rpg_a_airborne" );
    codescripts\character::attachhead( "alias_russian_military_paris_heads", _id_60D7::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_rpg_a_airborne" );
    codescripts\character::precachemodelarray( _id_60D7::main() );
}
