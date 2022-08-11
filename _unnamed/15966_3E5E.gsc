// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_president" );
    self attach( "head_russian_president", "", 1 );
    self.headmodel = "head_russian_president";
    self.voice = "russian";
}

precache()
{
    precachemodel( "body_russian_president" );
    precachemodel( "head_russian_president" );
}
