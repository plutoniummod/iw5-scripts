// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self endon( "death" );
    self notify( "killanimscript" );
    self notify( "clearSuppressionAttack" );
    self.a._id_20AB = 0;
    self._id_3B66["root"] = %body;
    self endon( "end_sequence" );
    self startscriptedanim( self._id_3B66["notifyName"], self._id_3B66["origin"], self._id_3B66["angles"], self._id_3B66["anim"], self._id_3B66["animMode"], self._id_3B66["root"] );
    self._id_3B66 = undefined;

    if ( isdefined( self._id_3FE4 ) || isdefined( self._id_3FE5 ) )
    {
        animscripts\face::_id_0C46( self._id_3FE5, self._id_3FE4, 0.9, "scripted_anim_facedone" );
        self._id_3FE5 = undefined;
        self._id_3FE4 = undefined;
    }

    if ( isdefined( self._id_3B67 ) )
        self._id_3B68 = self._id_3B67;

    self waittill( "killanimscript" );
}

init( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self._id_3B66["notifyName"] = var_0;
    self._id_3B66["origin"] = var_1;
    self._id_3B66["angles"] = var_2;
    self._id_3B66["anim"] = var_3;

    if ( isdefined( var_4 ) )
        self._id_3B66["animMode"] = var_4;
    else
        self._id_3B66["animMode"] = "normal";

    if ( isdefined( var_5 ) )
        self._id_3B66["root"] = var_5;
    else
        self._id_3B66["root"] = %body;
}
