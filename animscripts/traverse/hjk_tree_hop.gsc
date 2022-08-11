// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self.type == "dog" )
        animscripts\traverse\shared::_id_3FF7( "wallhop", 40 );
    else
        _id_34EA();
}
#using_animtree("generic_human");

_id_34EA()
{
    if ( isdefined( self.type ) && self.type == "civilian" )
        animscripts\traverse\shared::_id_3FE6( %so_hijack_civ_log_jump, 39.875 );
    else
        animscripts\traverse\shared::_id_3FE6( %traverse_wallhop_3, 39.875 );
}
