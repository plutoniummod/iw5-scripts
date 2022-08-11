// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_shotgun_a" );
    codescripts\character::attachhead( "alias_russian_military_manhattan_heads", _id_0630::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_shotgun_a" );
    codescripts\character::precachemodelarray( _id_0630::main() );
}
