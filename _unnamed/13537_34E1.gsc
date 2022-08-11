// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_fso_vest_b_dirty" );
    codescripts\character::attachhead( "alias_fso_heads_dirty", _id_34DF::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_fso_vest_b_dirty" );
    codescripts\character::precachemodelarray( _id_34DF::main() );
}
