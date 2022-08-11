// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_africa_militia_smg_b" );
    self attach( "head_africa_militia_b_hat", "", 1 );
    self.headmodel = "head_africa_militia_b_hat";

    if ( isendstr( self.headmodel, "_hat" ) )
        codescripts\character::attachhat( "alias_africa_militia_hats_b", _id_05BB::main() );

    self.voice = "african";
}

precache()
{
    precachemodel( "body_africa_militia_smg_b" );
    precachemodel( "head_africa_militia_b_hat" );
    codescripts\character::precachemodelarray( _id_05BB::main() );
}
