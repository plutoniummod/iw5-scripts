// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_henchmen_assault_c" );
    codescripts\character::attachhead( "alias_henchmen_heads", xmodelalias\alias_henchmen_heads::main() );
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_henchmen_assault_c" );
    codescripts\character::precachemodelarray( xmodelalias\alias_henchmen_heads::main() );
}
