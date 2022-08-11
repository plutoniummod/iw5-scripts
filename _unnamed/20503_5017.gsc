// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("animated_props");

main()
{
    if ( !isdefined( level.anim_prop_models ) )
        level.anim_prop_models = [];

    if ( !isdefined( level._id_1E40 ) )
        level._id_1E40 = [];

    var_0 = tolower( getdvar( "mapname" ) );
    var_1 = 1;

    if ( common_scripts\utility::string_starts_with( var_0, "mp_" ) )
        var_1 = 0;

    var_2 = "foliage_paris_tree_plane_medium_animated";

    if ( var_1 )
    {
        level._id_1E40[var_2] = ::_id_5015;
        level.anim_prop_models[var_2]["idle"] = %paris_tree_plane_medium_idle;
        level.anim_prop_models[var_2]["windy_idle"] = %paris_tree_plane_medium_windy_idle;
    }
    else
        level.anim_prop_models[var_2]["idle"] = "paris_tree_plane_medium_idle";
}

_id_5015()
{
    self useanimtree( #animtree );
    var_0 = level.anim_prop_models[self.model]["idle"];
    self setanim( var_0, 1, 0.2, 1 );
    self setanimtime( var_0, randomfloatrange( 0, 1 ) );
}
