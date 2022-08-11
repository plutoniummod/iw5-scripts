// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_chemwar_russian_assault_ee" );
    codescripts\character::attachhead( "alias_chemwar_russian_heads", _id_7939::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_chemwar_russian_assault_ee" );
    codescripts\character::precachemodelarray( _id_7939::main() );
}
