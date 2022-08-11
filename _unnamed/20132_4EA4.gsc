// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "t90", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );

    if ( var_2 == "script_vehicle_t90_tank_woodland_hamburg" )
    {
        maps\_vehicle::_id_2ABE( "vehicle_t90_tank_woodland", "vehicle_t90_tank_woodland_dt" );
        maps\_vehicle::_id_2A02( "explosions/vehicle_explosion_t90_cheap", "tag_deathfx", "exp_armor_vehicle", undefined, undefined, undefined, 0, undefined, undefined, undefined, 8 );
    }
    else
    {
        maps\_vehicle::_id_2ABE( "vehicle_t90_tank_woodland", "vehicle_t90_tank_woodland_dt", 0.5 );
        maps\_vehicle::_id_2A02( "explosions/vehicle_explosion_t90", "tag_deathfx", "exp_armor_vehicle", undefined, undefined, undefined, 0 );
        maps\_vehicle::_id_2A02( "fire/t90_death_fire_smoke", "tag_deathfx", "fire_metal_medium", undefined, undefined, 1, 0 );
    }

    maps\_vehicle::_id_2ABF( "tankblast" );
    maps\_vehicle::_id_2AC1( %abrams_movement, %abrams_movement_backwards, 10 );
    var_3 = maps\_vehicle::_id_2B1A( var_0, var_2 );
    maps\_vehicle::_id_2AAD( var_3, "spotlight", "TAG_LIGHT_TOP", "misc/spotlight_btr80", "spotlight_turret", 0.0 );
    maps\_vehicle::_id_2AAD( var_3, "frontlight_L", "TAG_FRONT_LIGHT_LEFT", "misc/car_headlight_bm21", "running", 0.1 );
    maps\_vehicle::_id_2AAD( var_3, "frontlight_R", "TAG_FRONT_LIGHT_RIGHT", "misc/car_headlight_bm21", "running", 0.1 );

    if ( common_scripts\utility::get_template_level() == "hamburg" )
        maps\_vehicle::_id_2A4A( "t90_turret2", "tag_turret2", "vehicle_t90_PKT_Coaxial_MG", undefined, "auto_nonai" );
    else
        maps\_vehicle::_id_2A4A( "t90_turret2", "tag_turret2", "vehicle_t90_PKT_Coaxial_MG" );

    var_4 = issubstr( var_2, "_turret" ) || issubstr( var_2, "berlin" ) || issubstr( var_2, "hamburg" );

    if ( var_4 )
        maps\_vehicle::_id_2A4A( "dshk_gaz", "tag_turret_hatch", "weapon_dshk_turret_t90", 1028, "auto_ai", 0.2, 20, -14 );

    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_29F5( "tank_rumble", 0.15, 4.5, 600, 1, 1 );
    maps\_vehicle::_id_2AC6( "axis" );
    maps\_vehicle::_id_2AC7();
    maps\_vehicle::_id_2ACB( 0.33 );
    maps\_vehicle::_id_2AC8( 1 );

    if ( var_4 )
        maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
}

_id_2B1D()
{

}

_id_3A9C( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];
    var_0[0] = spawnstruct();
    var_0[0]._id_24F2 = "tag_turret_hatch";
    var_0[0]._id_24F3 = ( 0.0, 0.0, -16.0 );
    var_0[0]._id_24F4 = 0;
    var_0[0]._id_0F59 = %gaz_turret_idle;
    var_0[0].mgturret = 1;
    return var_0;
}
