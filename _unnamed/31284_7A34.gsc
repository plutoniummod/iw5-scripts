// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_africa_militia_assault_c" );
    self attach( "head_africa_militia_a_hat", "", 1 );
    self.headmodel = "head_africa_militia_a_hat";
    self.voice = "african";
}

precache()
{
    precachemodel( "body_africa_militia_assault_c" );
    precachemodel( "head_africa_militia_a_hat" );
}
