// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_05B7::main() );
    self attach( "head_opforce_arab_c", "", 1 );
    self.headmodel = "head_opforce_arab_c";
    self.voice = "russian";
}

precache()
{
    codescripts\character::precachemodelarray( _id_05B7::main() );
    precachemodel( "head_opforce_arab_c" );
}
