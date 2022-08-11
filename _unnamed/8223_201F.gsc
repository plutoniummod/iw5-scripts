// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_gign_paris_lmg" );
    codescripts\character::attachhead( "alias_gign_heads", xmodelalias\alias_gign_heads::main() );
    self.voice = "french";
}

precache()
{
    precachemodel( "body_gign_paris_lmg" );
    codescripts\character::precachemodelarray( xmodelalias\alias_gign_heads::main() );
}
