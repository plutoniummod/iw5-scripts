// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2, var_3, var_4 )
{
    maps\_vehicle::_id_2AC2( "blackhawk_minigun", var_0, var_1, var_2 );
    maps\_vehicle::_id_2AD2( ::_id_2B1D );
    maps\_vehicle::_id_2AC1( %bh_rotors, undefined, 0 );

    if ( !isdefined( var_3 ) )
    {
        var_5 = [];
        var_5["vehicle_blackhawk_minigun_low"] = "explosions/helicopter_explosion";
        var_5["vehicle_blackhawk_minigun_hero"] = "explosions/helicopter_explosion";
        var_5["vehicle_blackhawk_minigun_player"] = "explosions/helicopter_explosion";
        var_5["vehicle_blackhawk_minigun_player_so_ac130"] = "explosions/helicopter_explosion";
        var_5["vehicle_ny_blackhawk"] = "explosions/helicopter_explosion";
        maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_secondary_small", "tag_engine_left", "blackhawk_helicopter_hit", undefined, undefined, undefined, 0.2, 1 );
        maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_secondary_small", "elevator_jnt", "blackhawk_helicopter_secondary_exp", undefined, undefined, undefined, 0.5, 1 );
        maps\_vehicle::_id_2A02( "fire/fire_smoke_trail_L", "elevator_jnt", "blackhawk_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1 );
        maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_secondary_small", "tag_engine_right", "blackhawk_helicopter_secondary_exp", undefined, undefined, undefined, 2.5, 1 );
        maps\_vehicle::_id_2A02( "explosions/helicopter_explosion_secondary_small", "tag_deathfx", "blackhawk_helicopter_secondary_exp", undefined, undefined, undefined, 4.0 );
        maps\_vehicle::_id_2A02( var_5[var_0], undefined, "blackhawk_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
        maps\_vehicle::_id_2A04( "explosions/aerial_explosion_heli_large", "tag_deathfx", "blackhawk_helicopter_crash", undefined, undefined, undefined, undefined, 1, undefined, 0 );
    }

    maps\_vehicle::_id_2AC5();
    maps\_vehicle::_id_2ACE( 999, 500, 1500 );
    maps\_vehicle::_id_2AC6( "allies" );
    maps\_vehicle::_id_2ACA( ::_id_3A9D, ::_id_3A9C );
    maps\_vehicle::_id_2ACC( ::_id_3E84 );
    maps\_vehicle::_id_2ACD( ::_id_3E58 );
    var_6 = randomfloatrange( 0, 1 );
    maps\_vehicle::_id_2AAD( var_0, "cockpit_blue_cargo01", "tag_light_cargo01", "misc/aircraft_light_cockpit_red", "interior", 0.0 );
    maps\_vehicle::_id_2AAD( var_0, "cockpit_blue_cockpit01", "tag_light_cockpit01", "misc/aircraft_light_cockpit_blue", "interior", 0.0 );
    maps\_vehicle::_id_2AAD( var_0, "white_blink", "tag_light_belly", "misc/aircraft_light_white_blink", "running", var_6 );
    maps\_vehicle::_id_2AAD( var_0, "white_blink_tail", "tag_light_tail", "misc/aircraft_light_white_blink", "running", var_6 );
    maps\_vehicle::_id_2AAD( var_0, "wingtip_green", "tag_light_L_wing", "misc/aircraft_light_wingtip_green", "running", var_6 );
    maps\_vehicle::_id_2AAD( var_0, "wingtip_red", "tag_light_R_wing", "misc/aircraft_light_wingtip_red", "running", var_6 );

    if ( isdefined( var_4 ) )
        maps\_vehicle::_id_2A4A( var_4, "tag_doorgun", "weapon_blackhawk_minigun", undefined, undefined, 0.2, 20, -14 );
}

_id_2B1D()
{
    if ( maps\_utility::_id_1E25() )
    {
        self._id_295E = distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );
        self._id_295A = 762;
    }
    else
        self._id_295A = 762 + distance( self gettagorigin( "tag_origin" ), self gettagorigin( "tag_ground" ) );

    self._id_2941 = 0;
}

_id_3A9C( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_2523 = %bh_idle;

    return var_0;
}
#using_animtree("generic_human");

_id_3A9D()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 8; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_0F59 = %bh_pilot_idle;
    var_0[1]._id_0F59 = %bh_copilot_idle;
    var_0[2]._id_0F59 = %bh_1_idle;
    var_0[3]._id_0F59 = %bh_2_idle;
    var_0[4]._id_0F59 = %bh_4_idle;
    var_0[5]._id_0F59 = %bh_5_idle;
    var_0[6]._id_0F59 = %bh_8_idle;
    var_0[7]._id_0F59 = %bh_6_idle;
    var_0[0]._id_24F2 = "tag_detach";
    var_0[1]._id_24F2 = "tag_detach";
    var_0[2]._id_24F2 = "tag_detach";
    var_0[3]._id_24F2 = "tag_detach";
    var_0[4]._id_24F2 = "tag_detach";
    var_0[5]._id_24F2 = "tag_detach";
    var_0[6]._id_24F2 = "tag_detach";
    var_0[7]._id_24F2 = "tag_detach";
    var_0[2]._id_257C = %bh_1_drop;
    var_0[3]._id_257C = %bh_2_drop;
    var_0[4]._id_257C = %bh_4_drop;
    var_0[5]._id_257C = %bh_5_drop;
    var_0[6]._id_257C = %bh_8_drop;
    var_0[7]._id_257C = %bh_6_drop;
    var_0[2]._id_259A = "crouch";
    var_0[3]._id_259A = "crouch";
    var_0[4]._id_259A = "crouch";
    var_0[5]._id_259A = "crouch";
    var_0[6]._id_259A = "crouch";
    var_0[7]._id_259A = "crouch";
    var_0[2]._id_2571 = 1;
    var_0[3]._id_2571 = 1;
    var_0[4]._id_2571 = 1;
    var_0[5]._id_2571 = 1;
    var_0[6]._id_2571 = 1;
    var_0[7]._id_2571 = 1;
    var_0[2]._id_2592 = %fastrope_fall;
    var_0[3]._id_2592 = %fastrope_fall;
    var_0[4]._id_2592 = %fastrope_fall;
    var_0[5]._id_2592 = %fastrope_fall;
    var_0[6]._id_2592 = %fastrope_fall;
    var_0[7]._id_2592 = %fastrope_fall;
    var_0[1]._id_2590 = 1;
    var_0[2]._id_2590 = 1;
    var_0[3]._id_2590 = 1;
    var_0[4]._id_2590 = 1;
    var_0[5]._id_2590 = 1;
    var_0[6]._id_2590 = 1;
    var_0[7]._id_2590 = 1;
    var_0[2]._id_258D = "fastrope_loop_npc";
    var_0[3]._id_258D = "fastrope_loop_npc";
    var_0[4]._id_258D = "fastrope_loop_npc";
    var_0[5]._id_258D = "fastrope_loop_npc";
    var_0[6]._id_258D = "fastrope_loop_npc";
    var_0[7]._id_258D = "fastrope_loop_npc";
    var_0[2]._id_256A = "TAG_FastRope_RI";
    var_0[3]._id_256A = "TAG_FastRope_RI";
    var_0[4]._id_256A = "TAG_FastRope_LE";
    var_0[5]._id_256A = "TAG_FastRope_LE";
    var_0[6]._id_256A = "TAG_FastRope_RI";
    var_0[7]._id_256A = "TAG_FastRope_LE";
    return var_0;
}

_id_3E58()
{
    var_0 = [];
    var_0["left"] = [];
    var_0["right"] = [];
    var_0["both"] = [];
    var_0["left"][var_0["left"].size] = 4;
    var_0["left"][var_0["left"].size] = 5;
    var_0["left"][var_0["left"].size] = 7;
    var_0["right"][var_0["right"].size] = 2;
    var_0["right"][var_0["right"].size] = 3;
    var_0["right"][var_0["right"].size] = 6;
    var_0["both"][var_0["both"].size] = 2;
    var_0["both"][var_0["both"].size] = 3;
    var_0["both"][var_0["both"].size] = 4;
    var_0["both"][var_0["both"].size] = 5;
    var_0["both"][var_0["both"].size] = 6;
    var_0["both"][var_0["both"].size] = 7;
    var_0["default"] = var_0["both"];
    return var_0;
}

_id_3E84()
{
    var_0 = [];
    var_0["TAG_FastRope_LE"] = spawnstruct();
    var_0["TAG_FastRope_LE"].model = "rope_test";
    var_0["TAG_FastRope_LE"].tag = "TAG_FastRope_LE";
    var_0["TAG_FastRope_LE"]._id_2018 = %bh_rope_idle_le;
    var_0["TAG_FastRope_LE"]._id_2577 = %bh_rope_drop_le;
    var_0["TAG_FastRope_RI"] = spawnstruct();
    var_0["TAG_FastRope_RI"].model = "rope_test_ri";
    var_0["TAG_FastRope_RI"].tag = "TAG_FastRope_RI";
    var_0["TAG_FastRope_RI"]._id_2018 = %bh_rope_idle_ri;
    var_0["TAG_FastRope_RI"]._id_2577 = %bh_rope_drop_ri;
    var_1 = getarraykeys( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        precachemodel( var_0[var_1[var_2]].model );

    return var_0;
}

_id_459B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level.player;

    self._id_4552 = var_1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    thread _id_4595( var_2 );
    var_1 allowprone( 0 );
    var_1 allowcrouch( 0 );

    if ( !isdefined( var_0 ) )
    {
        var_1 disableweapons();
        maps\_utility::_id_270A( var_1, "tag_player", 1, 1, 30, 30, 30, 30 );
    }

    self useby( var_1 );
    var_3 = self gettagangles( "tag_player" );
    var_1 setplayerangles( var_3 + ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_set( "player_on_minigun" );
    thread _id_063D::_id_454E();
}

_id_4884()
{
    self useby( self._id_4552 );
    self._id_4552 unlink();
    level notify( "player_off_blackhawk_gun" );
}

_id_4595( var_0 )
{
    wait 0.05;

    if ( var_0 )
    {
        setsaveddvar( "ui_hidemap", 1 );
        setsaveddvar( "hud_showStance", "0" );
        setsaveddvar( "compass", "0" );
        setdvar( "old_compass", "0" );
        setsaveddvar( "ammoCounterHide", "1" );
    }
    else
    {
        setsaveddvar( "ui_hidemap", 0 );
        setsaveddvar( "hud_drawhud", "1" );
        setsaveddvar( "hud_showStance", "1" );
        setsaveddvar( "compass", "1" );
        setdvar( "old_compass", "1" );
        setsaveddvar( "ammoCounterHide", "0" );
    }
}
