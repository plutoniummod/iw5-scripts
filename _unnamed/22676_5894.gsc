// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_fso_vest_b" );
    codescripts\character::attachhead( "alias_fso_heads", _id_5890::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_fso_vest_b" );
    codescripts\character::precachemodelarray( _id_5890::main() );
}
