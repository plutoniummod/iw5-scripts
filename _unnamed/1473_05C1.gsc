// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_military_smg_a_airborne" );
    codescripts\character::attachhead( "alias_so_regular_smg_heads", _id_05C0::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_military_smg_a_airborne" );
    codescripts\character::precachemodelarray( _id_05C0::main() );
}
