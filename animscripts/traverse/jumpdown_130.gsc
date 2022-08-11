// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self.type == "dog" )
        animscripts\traverse\shared::_id_3FF8( 7, 0.7 );
    else
        _id_4009();
}
#using_animtree("generic_human");

_id_4009()
{
    var_0 = [];
    var_0["traverseAnim"] = %traverse_jumpdown_130;
    animscripts\traverse\shared::_id_3FEB( var_0 );
}
