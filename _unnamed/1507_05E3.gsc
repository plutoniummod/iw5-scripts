// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_london_cop" );
    codescripts\character::attachhead( "alias_london_police_heads", _id_05E1::main() );
    self.voice = "british";
}

precache()
{
    precachemodel( "body_london_cop" );
    codescripts\character::precachemodelarray( _id_05E1::main() );
}
