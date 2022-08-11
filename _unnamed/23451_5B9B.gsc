// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_africa_militia_lmg_a" );
    codescripts\character::attachhead( "alias_africa_militia_heads_a", _id_05B9::main() );

    if ( isendstr( self.headmodel, "_hat" ) )
        codescripts\character::attachhat( "alias_africa_militia_hats_a", _id_05BA::main() );

    self.voice = "african";
}

precache()
{
    precachemodel( "body_africa_militia_lmg_a" );
    codescripts\character::precachemodelarray( _id_05B9::main() );
    codescripts\character::precachemodelarray( _id_05BA::main() );
}
