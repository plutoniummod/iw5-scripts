// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "armored_van", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_armored_van", "vehicle_armored_van_destroyed" );
    maps\_vehicle::_id_2A02( "explosions/large_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0 );
    maps\_vehicle::_id_29F3( ( 0.0, 0.0, 32.0 ), 300, 200, 100, 0 );
    maps\_vehicle::_id_2AC1( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    maps\_vehicle::_id_29F8( 1, 1.6, 500 );
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "axis" );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
    maps\_vehicle::_id_2ACD( ::_id_3E58 );
}

_id_2B1D()
{

}

_id_3A9C( var_0 )
{
    var_0[0]._id_2523 = %russian_swat_van_driver_getout_door;
    var_0[0]._id_2580 = "front_door_left_jnt";
    var_0[0]._id_257F = 1;
    var_0[1]._id_257F = 0;
    var_0[2]._id_257F = 0;
    var_0[3]._id_257F = 0;
    var_0[4]._id_257F = 0;
    var_0[5]._id_257F = 0;
    var_0[6]._id_257F = 0;
    var_0[7]._id_257F = 0;
    var_0[8]._id_257F = 0;
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 9; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_24F2 = "tag_driver";
    var_0[0]._id_0F59 = %russian_swat_van_driver_idle;
    var_0[0]._id_257C = %russian_swat_van_driver_getout;
    var_0[1]._id_24F2 = "tag_detach";
    var_0[1]._id_0F59 = %russian_swat_van_guyl1_idle;
    var_0[1]._id_257C = %russian_swat_van_guyl1_getout;
    var_0[1]._id_2594 = %russian_swat_van_guyl_runoff;
    var_0[1]._id_25A8 = %death_explosion_stand_b_v1;
    var_0[2]._id_24F2 = "tag_detach";
    var_0[2]._id_0F59 = %russian_swat_van_guyr1_idle;
    var_0[2]._id_257C = %russian_swat_van_guyr1_getout;
    var_0[2]._id_2594 = %russian_swat_van_guyr_runoff;
    var_0[2]._id_25A8 = %death_explosion_stand_b_v2;
    var_0[3]._id_24F2 = "tag_detach";
    var_0[3]._id_0F59 = %russian_swat_van_guyl2_idle;
    var_0[3]._id_257C = %russian_swat_van_guyl2_getout;
    var_0[3]._id_2594 = %russian_swat_van_guyl_runoff;
    var_0[3]._id_25A8 = %death_explosion_stand_b_v3;
    var_0[4]._id_24F2 = "tag_detach";
    var_0[4]._id_0F59 = %russian_swat_van_guyr2_idle;
    var_0[4]._id_257C = %russian_swat_van_guyr2_getout;
    var_0[4]._id_2594 = %russian_swat_van_guyr_runoff;
    var_0[4]._id_25A8 = %death_explosion_stand_b_v4;
    var_0[5]._id_24F2 = "tag_detach";
    var_0[5]._id_0F59 = %russian_swat_van_guyl3_idle;
    var_0[5]._id_257C = %russian_swat_van_guyl3_getout;
    var_0[5]._id_2594 = %russian_swat_van_guyl_runoff;
    var_0[5]._id_25A8 = %death_explosion_stand_b_v2;
    var_0[6]._id_24F2 = "tag_detach";
    var_0[6]._id_0F59 = %russian_swat_van_guyr3_idle;
    var_0[6]._id_257C = %russian_swat_van_guyr3_getout;
    var_0[6]._id_2594 = %russian_swat_van_guyr_runoff;
    var_0[6]._id_25A8 = %death_explosion_stand_b_v1;
    var_0[7]._id_24F2 = "tag_detach";
    var_0[7]._id_0F59 = %russian_swat_van_guyl4_idle;
    var_0[7]._id_257C = %russian_swat_van_guyl4_getout;
    var_0[7]._id_2594 = %russian_swat_van_guyl_runoff;
    var_0[7]._id_25A8 = %death_explosion_stand_b_v4;
    var_0[8]._id_24F2 = "tag_detach";
    var_0[8]._id_0F59 = %russian_swat_van_guyr4_idle;
    var_0[8]._id_257C = %russian_swat_van_guyr4_getout;
    var_0[8]._id_2594 = %russian_swat_van_guyr_runoff;
    var_0[8]._id_25A8 = %death_explosion_stand_b_v3;
    return var_0;
}

_id_3E58()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["all"] = [];
    var_1 = "passengers";
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_0[var_1][var_0[var_1].size] = 4;
    var_0[var_1][var_0[var_1].size] = 5;
    var_0[var_1][var_0[var_1].size] = 6;
    var_0[var_1][var_0[var_1].size] = 7;
    var_0[var_1][var_0[var_1].size] = 8;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_0[var_1][var_0[var_1].size] = 4;
    var_0[var_1][var_0[var_1].size] = 5;
    var_0[var_1][var_0[var_1].size] = 6;
    var_0[var_1][var_0[var_1].size] = 7;
    var_0[var_1][var_0[var_1].size] = 8;
    var_0["default"] = var_0["all"];
    return var_0;
}
