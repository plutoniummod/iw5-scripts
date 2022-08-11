// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    animscripts\setposemovement::_id_0FC1();
    animscripts\utility::_id_247B();
    self endon( "killanimscript" );
    self traversemode( "noclip" );
    var_0 = self getnegotiationstartnode();
    self orientmode( "face angle", var_0.angles[1] );
    self setflaggedanimknoballrestart( "crawlanim", %prone_crawl, %body, 1, 0.1, 1 );
    animscripts\shared::_id_0C51( "crawlanim" );
    self.a._id_0D2B = "run";
    self.a._id_0D26 = "crouch";
}
