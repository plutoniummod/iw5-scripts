// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_7A28();
}
#using_animtree("generic_human");

_id_7A28()
{
    var_0 = [];
    var_0["traverseAnim"] = %london_warehouse_slide;
    thread _id_7A29();
    thread _id_7A2A();
    animscripts\traverse\shared::_id_3FEB( var_0 );
}

_id_7A29()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "traverseAnim", var_0 );

        if ( var_0 == "end" )
            break;

        var_1 = getsubstr( var_0, 0, 3 );

        if ( var_1 == "ps_" )
        {
            var_2 = getsubstr( var_0, 3 );
            thread maps\_utility::play_sound_on_tag( var_2, undefined, 1 );
            continue;
        }
    }
}

_id_7A2A()
{
    var_0 = self getnegotiationstartnode();

    if ( !isdefined( var_0._id_16A5 ) )
        return;

    wait 0.2;
    var_1 = "traverse_glass_";
    var_2 = anglestoforward( var_0.angles );
    var_3 = getglassarray( var_1 + var_0._id_16A5 );

    foreach ( var_5 in var_3 )
        destroyglass( var_5, var_2 );
}
