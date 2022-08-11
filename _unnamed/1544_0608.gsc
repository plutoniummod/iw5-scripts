// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_assault_b_woodland" );
    codescripts\character::attachhead( "alias_so_hardened_ar_heads", _id_05DC::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_assault_b_woodland" );
    codescripts\character::precachemodelarray( _id_05DC::main() );
}
