// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::_id_2AC2( "pavelow_noai", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2ABE( "vehicle_pavelow" );
    maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_secondary_small", "tag_engine_left", "pavelow_helicopter_secondary_exp", undefined, undefined, undefined, 0.0, 1 );
    maps\_vehicle::_id_2A02( "fire/fire_smoke_trail_L", "tag_engine_left", "pavelow_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1 );
    maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_secondary_small", "tag_engine_right", "pavelow_helicopter_secondary_exp", undefined, undefined, undefined, 2.5, 1 );
    maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_pavelow", undefined, "pavelow_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    maps\_vehicle::_id_2A04( "explosions/aerial_explosion_pavelow_mp", "tag_deathfx", "pavelow_helicopter_crash", undefined, undefined, undefined, undefined, 1, undefined, 0 );
    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "allies" );
    maps\_vehicle::_id_2AC1( %bh_rotors, undefined, 0 );
    var_3 = maps\_vehicle::_id_2B1A( var_0, var_2 );
    maps\_vehicle::_id_2AAD( var_3, "cockpit_red_cargo02", "tag_light_cargo02", "misc/aircraft_light_cockpit_red", "interior", 0.0 );
    maps\_vehicle::_id_2AAD( var_3, "cockpit_blue_cockpit01", "tag_light_cockpit01", "misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    maps\_vehicle::_id_2AAD( var_3, "white_blink", "tag_light_belly", "misc/aircraft_light_white_blink", "running", 0.15 );
    maps\_vehicle::_id_2AAD( var_3, "wingtip_green1", "tag_light_L_wing1", "misc/aircraft_light_wingtip_green", "running", 0.3 );
    maps\_vehicle::_id_2AAD( var_3, "wingtip_red1", "tag_light_R_wing1", "misc/aircraft_light_wingtip_red", "running", 0.2 );
    maps\_vehicle::_id_2AAD( var_3, "solid_tail", "tag_light_tail2", "misc/aircraft_light_wingtip_red", "running", 0.25 );
    maps\_vehicle::_id_2AAD( var_3, "white_blink_tail", "tag_light_tail", "misc/aircraft_light_red_blink", "running", 0.05 );
}

_id_2B1D()
{
    self._id_295E = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
    self._id_2941 = 0;
    thread maps\_vehicle::_id_2AB3( "running" );
}
