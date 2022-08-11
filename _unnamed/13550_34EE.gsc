// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_hero_soap_wounded" );
    self attach( "head_hero_soap", "", 1 );
    self.headmodel = "head_hero_soap";
    self.voice = "taskforce";
}

precache()
{
    precachemodel( "body_hero_soap_wounded" );
    precachemodel( "head_hero_soap" );
}
