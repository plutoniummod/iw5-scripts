// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "btr80", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_btr80", "vehicle_btr80_d", 0.1 );
    maps\_vehicle::_id_2ABE( "vehicle_btr80_snow", "vehicle_btr80_snow_d" );
    maps\_vehicle::_id_2ABE( "vehicle_btr80_low", "vehicle_btr80_d" );
    var_3 = [];
    var_3["vehicle_btr80"] = "explosions/vehicle_explosion_btr80";
    var_3["vehicle_btr80_snow"] = "explosions/vehicle_explosion_btr80_snow";
    var_3["vehicle_btr80_low"] = "explosions/vehicle_explosion_btr80";
    maps\_vehicle::_id_2A02( "fire/firelp_med_pm", "TAG_CARGOFIRE", "fire_metal_medium", undefined, undefined, 1, 0 );
    maps\_vehicle::_id_2A02( var_3[var_0], "tag_deathfx", "exp_armor_vehicle" );
    var_4 = maps\_vehicle::_id_2B1A( var_0, var_2 );
    maps\_vehicle::_id_2AAD( var_4, "headlight_L", "TAG_FRONT_LIGHT_LEFT", "misc/car_headlight_btr80", "running", 0.0 );
    maps\_vehicle::_id_2AAD( var_4, "taillight_L", "TAG_REAR_LIGHT_LEFT", "misc/car_taillight_btr80", "running", 0.1 );
    maps\_vehicle::_id_2AAD( var_4, "taillight_R", "TAG_REAR_LIGHT_RIGHT", "misc/car_taillight_btr80", "running", 0.1 );
    maps\_vehicle::_id_2AAD( var_4, "brakeight_R", "TAG_REAR_LIGHT_RIGHT", "misc/car_brakelight_btr80", "brake", 0.0 );
    maps\_vehicle::_id_2AAD( var_4, "brakelight_L", "TAG_REAR_LIGHT_LEFT", "misc/car_brakelight_btr80", "brake", 0.0 );
    maps\_vehicle::_id_2AAD( var_4, "spotlight", "TAG_FRONT_LIGHT_RIGHT", "misc/spotlight_btr80", "spotlight", 0.2 );
    maps\_vehicle::_id_2AAD( var_4, "spotlight_turret", "TAG_TURRET_LIGHT", "misc/spotlight_btr80", "spotlight_turret", 0.0 );
    maps\_vehicle::_id_2AC1( %btr80_movement, %btr80_movement_backwards, 10 );

    if ( issubstr( var_0, "_snow" ) )
        maps\_vehicle::_id_2A4A( "btr80_turret2", "tag_turret2", "vehicle_btr80_machine_gun_snow" );
    else if ( issubstr( var_2, "_ac130" ) )
        maps\_vehicle::_id_2A4A( "btr80_ac130_turret", "tag_turret2", "vehicle_btr80_machine_gun" );
    else
        maps\_vehicle::_id_2A4A( "btr80_turret2", "tag_turret2", "vehicle_btr80_machine_gun" );

    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 53.0 ), 512, 300, 20, 0 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "axis" );
    maps\_vehicle::_id_2ACD( ::_id_3E58 );
    maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
    maps\_vehicle::_id_2ACB( 0.33 );
    maps\_vehicle::_id_2AC8( 1 );
    maps\_vehicle::_id_2AC9( 1 );
}

_id_2B1D()
{
    maps\_utility::_id_1402( "no_riders_until_unload" );
    maps\_vehicle::_id_2AB3( "running" );
}

_id_53FF()
{
    self endon( "death" );

    for (;;)
    {
        wait 5;
        maps\_vehicle::_id_2AB3( "brake" );
        wait 3;
        maps\_vehicle::_id_2ABA( "brake" );
    }
}

_id_3E58()
{
    var_0 = [];
    var_0["driver_and_rider"] = [];
    var_0["two_riders"] = [];
    var_0["all"] = [];
    var_1 = "driver_and_rider";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_1 = "two_riders";
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_0["default"] = var_0["all"];
    return var_0;
}

_id_3A9C( var_0 )
{
    var_0[0]._id_2523 = %btr80_doorsl_open;
    var_0[1]._id_2523 = %btr80_doorsr_open;
    var_0[2]._id_2523 = %btr80_doorsl_open;
    var_0[3]._id_2523 = %btr80_doorsr_open;
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 4; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_24F2 = "tag_detach";
    var_0[1]._id_24F2 = "tag_detach";
    var_0[2]._id_24F2 = "tag_detach";
    var_0[3]._id_24F2 = "tag_detach";
    var_0[0]._id_0F59 = %btr80_crew_idle;
    var_0[1]._id_0F59 = %btr80_crew_idle;
    var_0[2]._id_0F59 = %btr80_crew_idle;
    var_0[3]._id_0F59 = %btr80_crew_idle;
    var_0[0]._id_257C = %btr80_exit_1;
    var_0[1]._id_257C = %btr80_exit_2;
    var_0[2]._id_257C = %btr80_exit_3;
    var_0[3]._id_257C = %btr80_exit_4;
    var_0[0]._id_2519 = %humvee_driver_climb_in;
    var_0[1]._id_2519 = %humvee_passenger_in_l;
    var_0[2]._id_2519 = %humvee_passenger_in_r;
    var_0[3]._id_2519 = %humvee_passenger_in_r;
    return var_0;
}
