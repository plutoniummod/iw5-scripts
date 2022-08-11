// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_london_male_a" );
    codescripts\character::attachhead( "alias_civilian_heads_male", _id_7945::main() );
    self.voice = "british";
}

precache()
{
    precachemodel( "body_london_male_a" );
    codescripts\character::precachemodelarray( _id_7945::main() );
}
