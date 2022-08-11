// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_urban_lmg" );
    codescripts\character::attachhead( "alias_sas_heads", xmodelalias\alias_sas_heads::main() );
    self.voice = "british";
}

precache()
{
    precachemodel( "body_sas_urban_lmg" );
    codescripts\character::precachemodelarray( xmodelalias\alias_sas_heads::main() );
}
