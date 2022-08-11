// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_delta_elite_snow_assault_aa" );
    codescripts\character::attachhead( "alias_delta_elite_heads_longsleeves", xmodelalias\alias_delta_elite_heads_longsleeves::main() );
    self.voice = "delta";
}

precache()
{
    precachemodel( "body_delta_elite_snow_assault_aa" );
    codescripts\character::precachemodelarray( xmodelalias\alias_delta_elite_heads_longsleeves::main() );
}
