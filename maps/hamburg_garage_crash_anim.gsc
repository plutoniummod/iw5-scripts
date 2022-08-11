// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_0B5A();
    _id_56E8();
    _id_47D9();
    _id_5004();
}
#using_animtree("vehicles");

_id_0B5A()
{
    level._id_1245["post_crash_tank"] = #animtree;
    level._id_1F90["post_crash_tank"] = "vehicle_m1a1_abrams_viewmodel_tread_stop";
    level._id_0C59["post_crash_tank"]["hamburg_tank_crash"] = %hamburg_tank_crash;
    maps\_anim::_id_1264( "post_crash_tank", "Tank_hit", ::_id_00EC, "hamburg_tank_crash" );
    maps\_anim::_id_1264( "post_crash_tank", "car_hit", ::_id_00EC, "hamburg_tank_crash" );
}
#using_animtree("animated_props");

_id_56E8()
{
    level._id_1245["garage_floor"] = #animtree;
    level._id_1F90["garage_floor"] = "hamburg_garage_floor_01";
    level._id_0C59["garage_floor"]["collapse"] = %hamburg_tank_crash_floor;
    level._id_1245["player_rig_gun"] = #animtree;
    level._id_1F90["player_rig_gun"] = "weapon_m4_iw5";
    level._id_0C59["player_rig_gun"]["garage_crash_exit"] = %hamburg_tank_crash_exit_gun;
}
#using_animtree("player");

_id_47D9()
{
    level._id_1245["player_rig"] = #animtree;
    level._id_1F90["player_rig"] = "viewhands_player_delta";
    level._id_0C59["player_rig"]["garage_crash_exit"] = %hamburg_tank_crash_exit_upperbody;
    level._id_1245["player_rig_legs"] = #animtree;
    level._id_1F90["player_rig_legs"] = "viewlegs_generic";
    level._id_0C59["player_rig_legs"]["garage_crash_exit"] = %hamburg_tank_crash_exit_lowerbody;
}
#using_animtree("generic_human");

_id_5004()
{
    level._id_0C59["generic"]["driver_after_fall"] = %hamburg_tank_driver_afterfall;
    level._id_0C59["generic"]["driver_after_fall_loop"][0] = %hamburg_tank_driver_afterfall_loop;
    level._id_0C59["generic"]["loader_after_fall"] = %hamburg_tank_loader_afterfall;
    level._id_0C59["generic"]["loader_after_fall_loop"][0] = %hamburg_tank_loader_afterfall_loop;
    level._id_0C59["generic"]["loader_after_fall_exit"] = %hamburg_tank_loader_climbout;
    level._id_0C59["generic"]["driver_after_fall_exit"] = %hamburg_tank_driver_climbout;
}

_id_00EC( var_0 )
{
    earthquake( 0.4, 0.85, var_0.origin, 1500 );
}
