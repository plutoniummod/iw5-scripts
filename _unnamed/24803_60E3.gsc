// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_airborne_assault_c" );
    codescripts\character::attachhead( "alias_airborne_heads", _id_044A::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_airborne_assault_c" );
    codescripts\character::precachemodelarray( _id_044A::main() );
}
