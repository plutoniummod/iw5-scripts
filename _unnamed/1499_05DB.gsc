// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_chemwar_russian_assault_dd" );
    codescripts\character::attachhead( "alias_chemwar_russian_heads_so", _id_05D9::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_chemwar_russian_assault_dd" );
    codescripts\character::precachemodelarray( _id_05D9::main() );
}
