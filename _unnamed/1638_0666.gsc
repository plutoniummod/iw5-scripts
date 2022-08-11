// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_london_male_b" );
    codescripts\character::attachhead( "alias_civilian_heads_male_drone", _id_0664::main() );
    self.voice = "british";
}

precache()
{
    precachemodel( "body_london_male_b" );
    codescripts\character::precachemodelarray( _id_0664::main() );
}
