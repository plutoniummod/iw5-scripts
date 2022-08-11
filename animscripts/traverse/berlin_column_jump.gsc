// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self.type == "dog" )
        animscripts\traverse\shared::_id_3FF9( 38.0, 5 );
    else
        _id_4003();
}
#using_animtree("generic_human");

_id_4003()
{
    var_0 = [];
    var_0["traverseAnim"] = %berlin_jumping_column_sandman;
    var_0["traverseHeight"] = 38.0;
    animscripts\traverse\shared::_id_3FEB( var_0 );
}
