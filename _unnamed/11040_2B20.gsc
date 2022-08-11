// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_pmc_africa_shotgun_a" );
    codescripts\character::attachhead( "alias_pmc_africa_heads", xmodelalias\alias_pmc_africa_heads::main() );
    self.voice = "pmc";
}

precache()
{
    precachemodel( "body_pmc_africa_shotgun_a" );
    codescripts\character::precachemodelarray( xmodelalias\alias_pmc_africa_heads::main() );
}
