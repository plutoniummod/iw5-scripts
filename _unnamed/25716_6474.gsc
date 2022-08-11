// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "osprey", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_v22_osprey" );
    maps\_vehicle::_id_2ABE( "vehicle_v22_osprey_fly" );
    maps\_vehicle::_id_2A02( "explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    maps\_vehicle::_id_2A04( "explosions/aerial_explosion_apache_mp", "tag_deathfx", "apache_helicopter_crash", undefined, undefined, undefined, undefined, 1, undefined, 0, 5 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "allies" );
    maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
    maps\_vehicle::_id_2AC1( %v22_osprey_props, undefined, 0 );
    maps\_vehicle::_id_2ACD( ::_id_3E58 );
    var_3 = randomfloatrange( 0, 1 );
    var_4 = maps\_vehicle::_id_2B1A( var_0, var_2 );
    maps\_vehicle::_id_2AAD( var_4, "cockpit_red_cargo02", "tag_light_cargo02", "misc/aircraft_light_cockpit_red", "interior", 0.0 );
    maps\_vehicle::_id_2AAD( var_4, "cockpit_blue_cockpit01", "tag_light_cockpit01", "misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    maps\_vehicle::_id_2AAD( var_4, "white_blink", "tag_light_belly", "misc/aircraft_light_red_blink", "running", var_3 );
    maps\_vehicle::_id_2AAD( var_4, "white_blink_tail", "tag_light_tail", "misc/aircraft_light_red_blink", "running", var_3 );
    thread _id_6472();
}

_id_6472()
{
    level waittill( "load_finished" );
    var_0 = getvehiclenodearray( "osprey_landing", "script_noteworthy" );
    var_1 = getvehiclenodearray( "osprey_take_off", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::_id_6473, 1 );
    common_scripts\utility::array_thread( var_1, ::_id_6473, 0 );
}

_id_6473( var_0 )
{
    var_1 = %v22_osprey_wings_down;
    var_2 = %v22_osprey_wings_up;

    if ( !var_0 )
    {
        var_1 = %v22_osprey_wings_up;
        var_2 = %v22_osprey_wings_down;
    }

    for (;;)
    {
        self waittill( "trigger", var_3 );
        var_3 endon( "death" );
        var_3 clearanim( var_1, 1 );
        wait 1;
        var_3 setanimrestart( var_2, 1, 0, 0.15 );

        if ( !var_0 )
        {
            var_3 notify( "stop_kicking_up_dust" );
            var_3 clearanim( %v22_osprey_hatch_down, 0.2 );
            wait 0.2;
            var_3 setanimrestart( %v22_osprey_hatch_up );
            continue;
        }

        var_3 thread maps\_vehicle::_id_2A9B();
    }
}

_id_2B1D()
{
    self._id_2998 = 1;
    self._id_295E = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_2941 = 0;
    self._id_29CC = 1;
    wait 0.05;
    self notify( "stop_kicking_up_dust" );
    maps\_vehicle::_id_2AB3( "running" );
}

_id_3A9C( var_0 )
{
    var_0[1]._id_2523 = %v22_osprey_hatch_down;
    var_0[1]._id_257F = 0;
    var_0[1]._id_2522 = %v22_osprey_hatch_up;
    var_0[1]._id_2525 = 0;
    var_0[1]._id_2581 = "osprey_door_open";
    var_0[1]._id_2527 = "osprey_door_close";
    var_0[1].delay = getanimlength( %v22_osprey_hatch_down ) - 1.7;
    var_0[2].delay = getanimlength( %v22_osprey_hatch_down ) - 1.7;
    var_0[3].delay = getanimlength( %v22_osprey_hatch_down ) - 1.7;
    var_0[4].delay = getanimlength( %v22_osprey_hatch_down ) - 1.7;
    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_0F59[0] = %seaknight_pilot_idle;
    var_0[0]._id_0F59[1] = %seaknight_pilot_switches;
    var_0[0]._id_0F59[2] = %seaknight_pilot_twitch;
    var_0[0]._id_254D[0] = 1000;
    var_0[0]._id_254D[1] = 400;
    var_0[0]._id_254D[2] = 200;
    var_0[0]._id_24F4 = 0;
    var_0[5]._id_24F4 = 0;
    var_0[1]._id_0F59 = %ch46_unload_1_idle;
    var_0[2]._id_0F59 = %ch46_unload_2_idle;
    var_0[3]._id_0F59 = %ch46_unload_3_idle;
    var_0[4]._id_0F59 = %ch46_unload_4_idle;
    var_0[5]._id_0F59[0] = %seaknight_copilot_idle;
    var_0[5]._id_0F59[1] = %seaknight_copilot_switches;
    var_0[5]._id_0F59[2] = %seaknight_copilot_twitch;
    var_0[5]._id_254D[0] = 1000;
    var_0[5]._id_254D[1] = 400;
    var_0[5]._id_254D[2] = 200;
    var_0[0]._id_24F2 = "tag_detach_pilots";
    var_0[1]._id_24F2 = "tag_detach";
    var_0[2]._id_24F2 = "tag_detach";
    var_0[3]._id_24F2 = "tag_detach";
    var_0[4]._id_24F2 = "tag_detach";
    var_0[5]._id_24F2 = "tag_detach_pilots";
    var_0[1]._id_257C = %ch46_unload_1;
    var_0[2]._id_257C = %ch46_unload_2;
    var_0[3]._id_257C = %ch46_unload_3;
    var_0[4]._id_257C = %ch46_unload_4;
    var_0[1]._id_2519 = %ch46_load_1;
    var_0[2]._id_2519 = %ch46_load_2;
    var_0[3]._id_2519 = %ch46_load_3;
    var_0[4]._id_2519 = %ch46_load_4;
    return var_0;
}

_id_3E58()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["passengers"][var_0["passengers"].size] = 1;
    var_0["passengers"][var_0["passengers"].size] = 2;
    var_0["passengers"][var_0["passengers"].size] = 3;
    var_0["passengers"][var_0["passengers"].size] = 4;
    var_0["default"] = var_0["passengers"];
    return var_0;
}

_id_3E84()
{

}
