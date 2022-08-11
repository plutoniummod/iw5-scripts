// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    codescripts\character::setmodelfromarray( _id_2B36::main() );
    self attach( "head_russian_military_f", "", 1 );
    self.headmodel = "head_russian_military_f";
    self.voice = "russian";
}

precache()
{
    codescripts\character::precachemodelarray( _id_2B36::main() );
    precachemodel( "head_russian_military_f" );
}
