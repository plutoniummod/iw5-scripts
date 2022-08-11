// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("script_model");

main()
{
    if ( !isdefined( level._id_1245 ) )
        level._id_1245 = [];

    if ( !isdefined( level._id_0C59 ) )
        level._id_0C59 = [];

    precachemodel( "fxanim_gp_chain_arch_sm_mod" );
    precachemodel( "fxanim_gp_chain_short_mod" );
    precachemodel( "fxanim_gp_chain_arch_sm_mod" );
    precachemodel( "fxanim_gp_chain_short_mod" );
    precachemodel( "fxanim_gp_chain_med_hook_mod" );
    precachemodel( "fxanim_gp_chain_med_pulley_mod" );
    level._id_1245["fxanim"] = #animtree;
    level._id_0C59["fxanim"]["fxanim_gp_chain_arch_sm_anim"][0] = %fxanim_gp_chain_arch_sm_anim;
    level._id_0C59["fxanim"]["fxanim_gp_chain_short_anim"][0] = %fxanim_gp_chain_short_anim;
    level._id_0C59["fxanim"]["fxanim_gp_chain_arch_sm_anim"][0] = %fxanim_gp_chain_arch_sm_anim;
    level._id_0C59["fxanim"]["fxanim_gp_chain_short_anim"][0] = %fxanim_gp_chain_short_anim;
    level._id_0C59["fxanim"]["fxanim_gp_chain_med_hook_anim"][0] = %fxanim_gp_chain_med_hook_anim;
    level._id_0C59["fxanim"]["fxanim_gp_chain_med_pulley_anim"][0] = %fxanim_gp_chain_med_pulley_anim;
    common_scripts\utility::array_thread( getentarray( "spawn_animated_props", "targetname" ), ::_id_3E76 );
    common_scripts\utility::array_thread( getentarray( "level_cleanup", "targetname" ), ::_id_5352 );
}

_id_3E76()
{
    self waittill( "trigger" );
    var_0 = maps\_utility::_id_1BF9( self.target, "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = spawn( "script_model", var_2.origin );
        var_3.angles = var_2.angles;
        var_3 setmodel( var_2.script_modelname );
        var_3._id_1032 = "fxanim";
        var_3 maps\_anim::_id_1244();
        var_3 maps\_utility::delaythread( randomfloatrange( 0, 3 ), maps\_anim::_id_124E, var_3, var_2.animation );
        var_3 thread _id_524A::_id_5201( "level_cleanup" );
        var_2 = undefined;
    }
}

_id_5352()
{
    self waittill( "trigger" );
    level notify( "level_cleanup" );
    self delete();
}
