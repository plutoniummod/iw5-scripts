// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5D03()
{
    self.weaponinfo["deserteagle"] = self.weaponinfo[self._id_20A3];
    self._id_20A3 = "deserteagle";
}

_id_523D()
{
    _id_4B63();
    level._id_45C0 maps\_utility::_id_26C7();
    level._id_45C0 _id_5D03();
}

_id_523E()
{
    _id_5296();
    level._id_4877 maps\_utility::_id_26C7();
    level._id_4877 _id_5D03();
}

_id_5D04()
{
    setup_truck();
    level._id_45C4 maps\_utility::_id_26C7();
    level._id_45C4 _id_5D03();
}

_id_5D05()
{
    _id_5D07();
    level._id_4D86 maps\_utility::_id_26C7();
    level._id_4D86 _id_5D03();
}

_id_479C()
{
    level._id_5D06 = 0;
    wait 1.0;
    var_0 = ( 0.0, 0.0, 35.0 );
    common_scripts\utility::flag_wait( "elevator_one_done_moving_new_beggining" );
    wait 1;
    objective_add( maps\_utility::_id_2816( "open" ), "active", &"RESCUE_2_OBJ_110" );
    objective_current( maps\_utility::_id_2816( "open" ) );

    if ( isdefined( level._id_4877 ) )
        objective_onentity( maps\_utility::_id_2816( "open" ), level._id_4877, var_0 );
}

_id_4B63()
{
    level._id_45C0 = maps\_utility::_id_272F( "sandman" );
    common_scripts\utility::waitframe();
    level._id_45C0._id_1032 = "sandman";
    level._id_45C0._id_5290 = 0;
    level._id_45C0 thread maps\_utility::_id_0D04();
    level._id_45C0.goalradius = 64;
    level._id_45C0.dontavoidplayer = 1;
    level._id_45C0.nododgemove = 1;
    level._id_45C0 maps\_utility::_id_13A4( "r" );
    level._id_45C0 maps\_utility::_id_0EEC();
    level._id_45C0 setthreatbiasgroup( "delta" );
    level._id_5291 = getdvarint( "ai_playerADS_LOSRange", 150 );
}

_id_5296()
{
    var_0 = getent( "price", "targetname" );
    level._id_4877 = maps\_utility::_id_272F( "price" );
    common_scripts\utility::waitframe();
    level._id_4877._id_1032 = "price";
    level._id_4877._id_5290 = 0;
    level._id_4877 thread maps\_utility::_id_0D04();
    level._id_4877.goalradius = 64;
    level._id_4877.dontavoidplayer = 1;
    level._id_4877.nododgemove = 1;
    level._id_4877 maps\_utility::_id_13A4( "r" );
    level._id_4877 maps\_utility::_id_0EEC();
    level._id_4877 setthreatbiasgroup( "delta" );
    level._id_5291 = getdvarint( "ai_playerADS_LOSRange", 150 );
}

_id_5D07()
{
    level._id_4D86 = maps\_utility::_id_272F( "grinch" );
    common_scripts\utility::waitframe();
    level._id_4D86._id_1032 = "grinch";
    level._id_4D86._id_5290 = 0;
    level._id_4D86 thread maps\_utility::_id_0D04();
    level._id_4D86.goalradius = 64;
    level._id_4D86.dontavoidplayer = 1;
    level._id_4D86.nododgemove = 1;
    level._id_4D86 maps\_utility::_id_0EEC();
    level._id_4D86 setthreatbiasgroup( "delta" );
    level._id_5291 = getdvarint( "ai_playerADS_LOSRange", 150 );
}

setup_truck()
{
    var_0 = getent( "truck", "targetname" );
    level._id_45C4 = maps\_utility::_id_272F( "truck" );
    common_scripts\utility::waitframe();
    level._id_45C4._id_1032 = "truck";
    level._id_45C4._id_5290 = 0;
    level._id_45C4 thread maps\_utility::_id_0D04();
    level._id_45C4.goalradius = 64;
    level._id_45C4.dontavoidplayer = 1;
    level._id_45C4.nododgemove = 1;
    level._id_45C4 maps\_utility::_id_0EEC();
    level._id_45C4 setthreatbiasgroup( "delta" );
    level._id_5291 = getdvarint( "ai_playerADS_LOSRange", 150 );
}

_id_5D09()
{

}

_id_5D0A()
{
    level._id_5D0B = maps\_utility::_id_272F( "delta_two" );
    level._id_5D0B._id_217A = 1;
    level._id_5D0B._id_1032 = "generic";
    level._id_5D0B._id_5290 = 1;
}

_id_5D0C()
{
    level.player setactionslot( 1, "nightvision" );
    common_scripts\utility::waitframe();
    visionsetnight( "castle_nvg_grain" );
    level.player maps\_utility::_id_13DC( "nightvision_dlight_enabled" );
}

_id_5D0D()
{
    thread _id_5D1B();
    common_scripts\utility::waitframe();
    level._id_5D0E = 0;
    thread _id_0178();
    thread _id_5D11();
    thread _id_5D0F();
    thread _id_5D12();
    thread _id_5D2C();
    thread _id_5D18();
    thread _id_5D1C();
    thread _id_5D24();
    thread _id_5D27();
    common_scripts\utility::flag_wait( "elevator_one_done_moving" );
}

_id_5D0F()
{
    var_0 = maps\_utility::_id_272C( "elevator_tunnel_dead_guys" );

    foreach ( var_2 in var_0 )
        var_2 kill();

    var_4 = maps\_utility::_id_272F( "elevator_dead_guy_one" );
    var_4 linkto( level._id_5D10 );
    var_4._id_2145 = 1;
    var_4.grenadeammo = 0;
    var_4._id_217A = 1;
    var_4._id_0EC6 = 1;
    var_4.ignoreall = 1;
    var_4.ignoreme = 1;
    var_5 = maps\_utility::_id_272F( "elevator_dead_guy_othrow" );
    var_5 linkto( level._id_5D10 );
    var_5._id_1032 = "generic";
    var_4._id_2145 = 1;
    var_4.grenadeammo = 0;
    var_5._id_217A = 1;
    var_5.ignoreall = 1;
    var_5.ignoreme = 1;
    var_5._id_0EC6 = 1;
    wait 5.4;
    var_5 thread maps\_anim::_id_1246( var_5, "melee_f_awin_defend" );
    level._id_4877 thread maps\_anim::_id_1246( level._id_4877, "melee_f_awin_attack" );
    wait 0.7;
    var_4 kill();
    wait 2.5;
    var_5.a._id_0D55 = 1;
    var_5.allowpain = 1;
    var_5.allowdeath = 1;
    var_5 kill();
}

_id_5D11()
{
    common_scripts\utility::waitframe();
    level._id_45C0 allowedstances( "crouch" );
    level._id_4877 allowedstances( "crouch" );
    wait 4;
    level._id_4877 thread maps\_anim::_id_1246( level._id_4877, "rescue_elevator_speaking_price" );
    level._id_45C0 thread maps\_anim::_id_1246( level._id_45C0, "rescue_elevator_speaking_sandman" );
}

_id_5D12()
{
    self endon( "start_bay_runners" );
    var_0 = getent( "no_prone_caves", "targetname" );

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
            level.player allowprone( 0 );
        else
            level.player allowprone( 1 );

        wait 0.05;
    }
}

_id_5D13()
{
    thread _id_5D16();
    maps\_utility::_id_272C( "elevator_passive_guys" );
    common_scripts\utility::flag_wait( "elevator_one_done_moving_new_beggining" );
    common_scripts\utility::waittill_notify_or_timeout( "elevator_one_attack_now", 8.5 );
    common_scripts\utility::flag_set( "elevator_one_attack_now" );
    maps\_utility::_id_265B( "axis" );
    maps\_utility::_id_265B( "allies" );
    var_0 = getentarray( "elevator_rocket_guys_two", "targetname" );
    maps\_spawner::_id_2135( var_0 );
    var_0 = getentarray( "elevator_rocket_guy", "targetname" );
    maps\_spawner::_id_2135( var_0 );
    wait 4;
    level._id_5D0B._id_1032 = "mccoy";
    level._id_5D0B thread maps\_utility::_id_168C( "rescue_mcy_lookout" );
    level._id_45C4 maps\_utility::delaythread( 1, maps\_utility::_id_168C, "rescue_trk_rpg" );
    wait 2;
    var_1 = getent( "elevator_rocket_guy_the_man", "targetname" );
    level._id_5D14 = maps\_utility::_id_272F( "elevator_rocket_guy_the_man", "targetname" );
    common_scripts\utility::waitframe();
    level._id_5D0B._id_1032 = "generic";
    level._id_5D14 allowedstances( "stand" );
    level._id_5D14.health = 10000;
    level._id_5D14.ignoreall = 1;
    level._id_5D14 maps\_utility::_id_1057();
    level._id_5D14.goalradius = 2;
    var_2 = getnodearray( "rocket_random_fire", "targetname" );
    var_3 = 0;
    var_4 = maps\_utility::_id_0B53( var_2 );
    var_5 = randomintrange( 0, 1 );

    switch ( var_5 )
    {
        case 0:
            magicbullet( "rpg_straight", ( 5160.0, -13448.0, -5968.0 ), ( 5474.0, -14397.5, -5900.0 ) );
            level._id_5D14 setgoalnode( var_4[0] );
        case 1:
            magicbullet( "rpg_straight", ( 5592.0, -13400.0, -5980.0 ), ( 5354.0, -14389.5, -5900.0 ) );
            level._id_5D14 setgoalnode( var_4[1] );
    }

    wait 0.3;
    common_scripts\utility::flag_set( "start_ambush" );
    playfx( level._effect["wall_exp_rpg_rescue2"], ( 5474.0, -14397.5, -5850.0 ), ( 0.0, 90.0, 1.0 ) );
    wait 0.7;
    wait 1;

    if ( isalive( level._id_5D14 ) )
        level._id_5D14 kill();
}

_id_5D15()
{
    self endon( "death" );
    self.health = 1;
    self.goalradius = 1;
    self.goalheight = 1;
    self.ignoreall = 1;
    self.ignoreme = 1;

    for (;;)
    {
        if ( level.player attackbuttonpressed() || common_scripts\utility::flag( "elevator_one_attack_now" ) )
        {
            common_scripts\utility::flag_set( "elevator_one_attack_now" );
            self.goalradius = 2048;
            self.goalheight = 20;
            self.ignoreall = 0;
            self.ignoreme = 0;
            wait(randomfloatrange( 0.3, 0.6 ));
            self kill();
            break;
        }

        wait 0.05;
    }
}

_id_5D16()
{
    level endon( "elevator_one_attack_now" );
    level endon( "kill_first_tunnel_guys" );
}

_id_5D17()
{

}

_id_5D18()
{
    wait 1;
    level._id_4877 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevator_takedown" );
    wait 8.3;
    wait 1;
    maps\_utility::_id_1428( "rescue_2_elevator_beg" );
    level._id_5D10 thread maps\_utility::play_sound_on_entity( "elev_run_start" );
    wait 0.5;
    level._id_5D10 thread common_scripts\utility::play_loop_sound_on_entity( "elev_run_loop" );
    common_scripts\utility::flag_wait( "elevator_one_done_moving_new_beggining" );
    level._id_5D10 thread common_scripts\utility::stop_loop_sound_on_entity( "elev_run_loop" );
    common_scripts\utility::waitframe();
    level._id_5D10 thread maps\_utility::play_sound_on_entity( "elev_run_end" );
    common_scripts\utility::waitframe();
    level._id_5D10 thread maps\_utility::play_sound_on_entity( "elev_door_open" );
}

_id_0178()
{
    level.player freezecontrols( 1 );
    wait 6.4;
    level.player freezecontrols( 0 );
}

_id_5D19()
{
    common_scripts\utility::flag_wait( "elevator_one_done_moving" );
}

_id_5D1A()
{
    self.ignoreall = 1;
    var_0 = randomintrange( 0, 2 );
}

_id_5D1B()
{

}

_id_5D1C()
{
    var_0 = getent( "door_r", "targetname" );
    var_1 = getent( "door_l", "targetname" );
    var_2 = getent( "door_r_top", "targetname" );
    var_3 = getent( "door_l_top", "targetname" );
    var_4 = getent( "door_gate_top", "targetname" );
    var_5 = getent( "door_r_bottom", "targetname" );
    var_6 = getent( "door_l_bottom", "targetname" );
    var_7 = getent( "door_gate_bottom_two", "targetname" );
    common_scripts\utility::flag_wait( "elevator_one_done_moving_new_beggining" );
    thread _id_5D13();
    var_2 moveto( var_2.origin + ( 90.0, 0.0, 0.0 ), 13, 1, 0.1 );
    var_3 moveto( var_3.origin + ( -90.0, 0.0, 0.0 ), 13, 1, 0.1 );
    thread _id_0179( var_2, var_3, var_4 );
    level._id_5D10 maps\_utility::delaythread( 12, maps\_utility::play_sound_on_entity, "elev_bell_ding" );
    level._id_4877 maps\_utility::delaythread( 8, maps\_utility::_id_168C, "rescue_pri_now" );
    maps\_utility::delaythread( 10.6, maps\_utility::_id_11F4, "rescue_rno_12oclock" );
    var_8 = getaiarray( "axis" );

    foreach ( var_10 in var_8 )
        var_10 getenemyinfo( level.player );

    wait 2;
    var_4 moveto( var_4.origin + ( 0.0, 0.0, 500.0 ), 900, 0.1, 0.1 );
    var_2 waittill( "movedone" );
    common_scripts\utility::flag_wait( "elevator_one_done_moving" );
    thread _id_5D1D();
    wait 4.1;
    thread _id_017A( var_5, var_6, var_7 );
    level._id_5D10 maps\_utility::delaythread( 0, maps\_utility::play_sound_on_entity, "elev_bell_ding" );
    thread _id_5D1E( var_6 );
    var_5 moveto( var_5.origin + ( 30.0, 0.0, 0.0 ), 3, 1, 0.1 );
    earthquake( 0.1, 6, level.player.origin, 300 );
    var_5 waittill( "movedone" );
    level._id_5D10 maps\_utility::delaythread( 0, maps\_utility::play_sound_on_entity, "elev_bell_ding" );
    wait 0.9;
    earthquake( 0.3, 0.3, level.player.origin, 300 );
    var_5 moveto( var_5.origin + ( 13.0, 0.0, 0.0 ), 0.4, 0.1, 0.1 );
    var_5 waittill( "movedone" );
    var_5 moveto( var_5.origin + ( 90.0, 0.0, 0.0 ), 5, 0.1, 0.1 );
    earthquake( 0.2, 0.2, level.player.origin, 300 );
    wait 1.5;
    var_7 moveto( var_7.origin + ( 0.0, 0.0, 500.0 ), 60, 0.1, 0.1 );
}

_id_0179( var_0, var_1, var_2 )
{
    var_1 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevatordoors_top_open_l" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevatordoors_top_open_r" );
    var_2 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevatordoors_top_open_m" );
}

_id_017A( var_0, var_1, var_2 )
{
    var_1 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevatordoors_bottom_open_l" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevatordoors_bottom_open_r" );
    var_2 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevatordoors_bottom_open_m" );
}

_id_5D1D()
{
    wait 2;
    wait 6;
    maps\_utility::_id_1F61( "nvg" );
    common_scripts\utility::flag_wait( "turn_off_nvg" );
    maps\_utility::_id_1F61( "disable_nvg" );
}

_id_5D1E( var_0 )
{
    var_0 moveto( var_0.origin + ( -30.0, 0.0, 0.0 ), 3, 1, 0.1 );
    var_0 waittill( "movedone" );
    earthquake( 0.3, 0.3, level.player.origin, 300 );
    wait 1.7;
    var_0 moveto( var_0.origin + ( -26.0, 0.0, 0.0 ), 0.2, 0.1, 0.1 );
    var_0 waittill( "movedone" );
    earthquake( 0.2, 0.2, level.player.origin, 300 );
    wait 0.7;
    var_0 moveto( var_0.origin + ( -80.0, 0.0, 0.0 ), 0.7, 0.1, 0.1 );
    var_0 waittill( "movedone" );
    earthquake( 0.4, 0.7, level.player.origin, 300 );
}

_id_5D1F( var_0 )
{
    level._id_5258 = common_scripts\utility::spawn_tag_origin();
    level.player playersetgroundreferenceent( level._id_5258 );

    if ( level._id_5D20 == 0 )
    {
        level._id_5258 rotatepitch( -3, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( 5, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( -2, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
    }
    else if ( level._id_5D20 == 1 )
    {
        level._id_5258 rotatepitch( 3, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( -5, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( 2, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
    }
    else if ( level._id_5D20 == 2 )
    {
        level._id_5258 rotatepitch( 8, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( -6, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( 4, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
    }
    else if ( level._id_5D20 == 3 )
    {
        level._id_5258 rotatepitch( -8, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( 6, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( -4, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
    }
    else if ( level._id_5D20 == 4 )
    {
        level._id_5258 rotatepitch( 14, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( -18, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( 4, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
    }
    else if ( level._id_5D20 == 5 )
    {
        level._id_5258 rotatepitch( -16, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( 12, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
        level._id_5258 rotatepitch( -7, var_0, var_0 / 2, var_0 / 2 );
        level._id_5258 waittill( "rotatedone" );
    }
}

_id_5D21()
{
    var_0 = spawn( "script_origin", level._id_5D10.origin + ( 0.0, 0.0, 0.0 ) );
    var_0 linkto( level._id_5D10 );
    playfx( level._effect["spotlight_dlight"], var_0.origin, ( 0.0, 0.0, 1.0 ) );
}

_id_5D22( var_0 )
{
    var_0 setlightintensity( 1.4 );
    var_0 thread _id_5D23( self );
    var_0 = common_scripts\utility::get_target_ent( "ele_one_light_two" );
    thread maps\jeremy_tools::_id_5202( var_0, 0.3, 1.5 );
    var_0 = common_scripts\utility::get_target_ent( "ele_one_light_three" );
    thread maps\jeremy_tools::_id_5202( var_0, 0.3, 1.5 );
}

_id_5D23( var_0 )
{
    for (;;)
    {
        self moveto( level._id_5D10.origin + ( 0.0, 0.0, 0.0 ), 0.05 );
        wait 0.05;
    }
}
#using_animtree("generic_human");

_id_5D24()
{
    common_scripts\utility::flag_wait( "elevator_one_done_moving_new_beggining" );
    level._id_5D0B.ignoreall = 1;
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
    {

    }

    common_scripts\utility::waitframe();
    level._id_5D0B._id_217A = 1;
    level._id_5D0B._id_0EC6 = 1;
    common_scripts\utility::waitframe();
    common_scripts\utility::flag_wait( "elevator_one_attack_now" );
    common_scripts\utility::waitframe();

    if ( isalive( level._id_5D0B ) )
        level._id_5D0B.ignoreall = 0;

    level._id_45C0.ignoreall = 0;
    level._id_4877.ignoreall = 0;
    level._id_45C4.ignoreall = 0;
    level._id_4D86.ignoreall = 0;
    level._id_45C0.ignoreme = 0;
    level._id_4877.ignoreme = 0;
    level._id_45C4.ignoreme = 0;
    level._id_4D86.ignoreme = 0;

    if ( isalive( level._id_5D0B ) )
        level._id_5D0B._id_0D50 = %stand_death_shoulder_spin;

    wait 0.1;
    wait 0.3;
    wait 6;
    common_scripts\utility::flag_set( "elevator_one_ambush" );
    wait 1.3;

    if ( isalive( level._id_5D0B ) )
        level._id_5D0B kill();
}

_id_5D25()
{
    var_0 = common_scripts\utility::getstruct( "rpd_one", "targetname" );
    var_1 = common_scripts\utility::getstruct( "rpd_two", "targetname" );
    var_2 = common_scripts\utility::getstruct( "rpd_three", "targetname" );
    var_3 = common_scripts\utility::getstruct( "rpd_four", "targetname" );
    var_4 = common_scripts\utility::getstruct( "rpd_t_one", "targetname" );
    var_5 = common_scripts\utility::getstruct( "rpd_t_two", "targetname" );
    var_6 = common_scripts\utility::getstruct( "rpd_t_three", "targetname" );
    var_7 = common_scripts\utility::getstruct( "rpd_t_four", "targetname" );
    var_8 = common_scripts\utility::getstruct( "rpd_t_five", "targetname" );
    var_9 = common_scripts\utility::getstruct( "rpd_t_six", "targetname" );
    var_10 = common_scripts\utility::getstruct( "rpd_t_seven", "targetname" );
    var_11 = common_scripts\utility::getstruct( "rpd_t_eight", "targetname" );
    var_12 = common_scripts\utility::getstruct( "rpd_t_nine", "targetname" );
    var_13 = common_scripts\utility::getstruct( "rpd_t_ten", "targetname" );
    var_14 = common_scripts\utility::getstruct( "rpd_t_eleven", "targetname" );
    magicbullet( "g36c_reflex", var_1.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_11.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_5.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_6.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_10.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_14.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_1.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_6.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_4.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_9.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_14.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_12.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_5.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_6.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_4.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_9.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_10.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_13.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_11.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_9.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_14.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_5.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_13.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_10.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_5.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_11.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_1.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_11.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_5.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_6.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_10.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_14.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_1.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_6.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_4.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_9.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_14.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_12.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_5.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_3.origin, var_6.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_0.origin, var_7.origin );
    wait 0.005;
    magicbullet( "g36c_reflex", var_2.origin, var_8.origin );
    wait 0.005;
}

_id_5D26()
{
    wait 10;
    level._id_017B = getent( "ai_use_orange_cnodes_o0", "targetname" );
    var_0 = getentarray( "cave_ambush_support", "targetname" );
    var_1 = 2;
    var_2 = 4;
    thread _id_017C();
    common_scripts\utility::flag_wait( "elevator_one_done_moving" );
    maps\_utility::_id_272C( "cave_ambush" );
    wait 1;
    _id_5D2B( level._id_017B, undefined, var_0, var_2, var_1, undefined, undefined );
    common_scripts\utility::waitframe();
    thread _id_001C();
    level._id_4877 maps\_utility::_id_26F3( 1 );
    level._id_45C4 maps\_utility::_id_26F3( 1 );
    level._id_45C0 maps\_utility::_id_26F3( 1 );
    level._id_4D86 maps\_utility::_id_26F3( 1 );
    var_3 = common_scripts\utility::get_target_ent( "flow_flag_one" );
    var_2 = 3;
    var_4 = getent( "ai_use_red_cnodes_r1", "targetname" );
    var_5 = getent( "ai_use_orange_cnodes_o1", "targetname" );
    var_1 = 2;
    common_scripts\utility::waitframe();
    wait 4;
    level._id_4877 maps\_utility::_id_26F3( 0 );
    level._id_45C4 maps\_utility::_id_26F3( 0 );
    level._id_45C0 maps\_utility::_id_26F3( 0 );
    level._id_4D86 maps\_utility::_id_26F3( 0 );
    var_6 = getent( "retreat_to_zipline", "targetname" );
    _id_5D2B( var_4, var_5, undefined, var_2, var_1, undefined, var_3 );
}

_id_001C()
{
    wait 6;
    level._id_45C4 maps\_utility::_id_13A4( "o" );
    level._id_4D86 maps\_utility::_id_13A4( "o" );
}

_id_017C()
{
    level._id_017B waittill( "trigger" );
    level._id_017B delete();
}

_id_5D27()
{
    var_0 = getent( "ai_use_red_cnodes_r1", "targetname" );
    var_0 waittill( "trigger" );
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_sweepleft" );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_onme" );
}

_id_5D28()
{
    self endon( "death" );
    common_scripts\utility::flag_clear( "elevator_one_attack_now" );
    self.a._id_0D31 = 1;
    thread _id_5D29();
    self.ignoreall = 1;

    for (;;)
    {
        if ( level.player attackbuttonpressed() || common_scripts\utility::flag( "elevator_one_attack_now" ) )
        {
            common_scripts\utility::flag_set( "elevator_one_attack_now" );
            level._id_4877.ignoreall = 0;
            level._id_45C4.ignoreall = 0;
            level._id_4D86.ignoreall = 0;
            level._id_45C0.ignoreall = 0;
            self.goalradius = 2048;
            self.goalheight = 20;
            self.ignoreall = 0;
            self.ignoreme = 0;
            break;
        }

        wait 0.05;
    }

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) > 800 )
        {
            self.goalradius = 548;
            self setgoalentity( level.player );
            self waittill( "goal" );
            self.goalradius = 2048;
            break;
        }

        wait 0.05;
    }
}

_id_5D29()
{
    wait 8.5;
    common_scripts\utility::flag_set( "elevator_one_attack_now" );
}

_id_5D2A()
{

}

_id_5D2B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    common_scripts\utility::flag_clear( "get_ai_flow_clear" );
    level endon( "get_ai_flow_clear" );

    for (;;)
    {
        var_7 = getaiarray( "axis" );

        if ( isdefined( var_4 ) )
        {
            if ( var_7.size <= var_4 || common_scripts\utility::flag( "flow_flag_player_ahead_spawn_enemies" ) )
            {
                if ( isdefined( var_0 ) )
                    var_0 maps\_utility::_id_2703();

                common_scripts\utility::waitframe();

                if ( isdefined( var_1 ) )
                    var_1 maps\_utility::_id_2703();

                common_scripts\utility::waitframe();

                if ( isdefined( var_3 ) )
                {
                    if ( !common_scripts\utility::flag( "flow_flag_player_ahead_spawn_enemies" ) )
                        wait(var_3);
                }

                if ( isdefined( var_2 ) )
                {
                    foreach ( var_9 in var_2 )
                        var_9 maps\_utility::_id_166F();
                }

                if ( isdefined( var_5 ) )
                {
                    foreach ( var_12 in var_7 )
                    {
                        if ( isalive( var_12 ) )
                            var_12 setgoalvolumeauto( var_5 );
                    }
                }

                if ( isdefined( var_6 ) )
                    var_6 delete();

                common_scripts\utility::flag_clear( "flow_flag_player_ahead_spawn_enemies" );
                common_scripts\utility::flag_set( "get_ai_flow_clear" );
                break;
            }
        }

        wait 0.05;
    }
}

_id_5D2C()
{
    maps\_utility::_id_265A( "allies" );
    maps\_utility::_id_265A( "axis" );
    maps\_utility::_id_2797( 82 );
    level._id_5D10 = getent( "elevator_one", "targetname" );
    var_0 = getent( "script_model_ele_rescue", "targetname" );
    common_scripts\utility::waitframe();
    var_0 linkto( level._id_5D10 );
    level._id_5D2D = getentarray( "sparks_origin", "script_noteworthy" );

    foreach ( var_2 in level._id_5D2D )
        var_2 linkto( level._id_5D10 );

    var_4 = getentarray( "elect_sparks_origin", "script_noteworthy" );

    foreach ( var_2 in var_4 )
        var_2 linkto( level._id_5D10 );

    thread _id_5D21();
    level._id_5D10 thread _id_5D38();

    if ( level._id_5D0E == 0 )
    {
        thread _id_5D32();
        var_7 = getent( "elevator_volume", "targetname" );
        var_8 = getentarray( "destructible_toys", "targetname" );
        var_9 = getentarray( "wires", "targetname" );
        var_10 = getentarray( "handles", "targetname" );
        var_11 = getentarray( "electricle_boxes", "targetname" );

        foreach ( var_13 in var_8 )
        {
            if ( var_13 istouching( var_7 ) )
            {
                var_14 = common_scripts\utility::spawn_tag_origin();
                var_14.origin = var_13.origin;
                var_14 linkto( var_13 );
                var_13 linkto( level._id_5D10 );
            }
        }

        foreach ( var_17 in var_9 )
        {
            if ( var_17 istouching( var_7 ) )
            {
                var_14 = common_scripts\utility::spawn_tag_origin();
                var_14.origin = var_17.origin;
                var_14 linkto( var_17 );
                var_17 linkto( level._id_5D10 );
            }
        }

        foreach ( var_20 in var_10 )
        {
            if ( var_20 istouching( var_7 ) )
            {
                var_14 = common_scripts\utility::spawn_tag_origin();
                var_14.origin = var_20.origin;
                var_14 linkto( var_20 );
                var_20 linkto( level._id_5D10 );
            }
        }

        foreach ( var_20 in var_11 )
            var_20 linkto( level._id_5D10 );

        wait 4;
        thread _id_5D37();
        level._id_45C0.ignoreall = 1;
        level._id_4D86.ignoreall = 1;
        level._id_45C4.ignoreall = 1;
        level._id_4877.ignoreall = 1;
        level.player allowjump( 0 );
        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, 3000.0 ), 0.2, 0.1, 0.1 );
        level._id_5D10 waittill( "movedone" );

        foreach ( var_2 in level._id_5D2D )
            var_2 thread _id_5D3B();

        thread _id_5D3C();
        wait 5;
        wait 0.7;
        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, -1500.0 ), 12.5, 0.1, 3 );
        level._id_5D10 waittill( "movedone" );
        earthquake( 0.2, 4.3, level.player.origin, 1500 );

        foreach ( var_2 in level._id_5D2D )
            var_2 thread _id_5D3B();

        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, -130.0 ), 3, 0.1, 2.9 );
        level._id_5D10 waittill( "movedone" );

        foreach ( var_2 in level._id_5D2D )
            var_2 thread _id_5D3B();

        common_scripts\utility::flag_set( "elevator_one_done_moving_new_beggining" );
        wait 7;
        common_scripts\utility::flag_set( "kill_first_tunnel_guys" );
        common_scripts\utility::flag_set( "start_ambush" );
        common_scripts\utility::flag_wait( "elevator_one_ambush" );
        thread _id_5D33();
        level._id_45C0._id_1032 = "generic";
        level._id_4D86._id_1032 = "generic";
        level._id_45C4._id_1032 = "generic";
        level._id_4877._id_1032 = "generic";
        thread _id_5D34();
        earthquake( 1.3, 0.7, level.player.origin, 300 );
        level.player enableinvulnerability();
        wait 0.3;
        thread _id_5D30();
        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, -90.0 ), 0.4, 0.1, 0.1 );
        level._id_5D10 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevator_crash_groan" );
        thread _id_5D31();
        level._id_5D20 = 2;
        var_30 = 0.8;
        thread _id_5D1F( var_30 );
        level._id_5D10 waittill( "movedone" );
        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, -20.0 ), 1.7, 0.1, 0.1 );

        foreach ( var_2 in level._id_5D2D )
            var_2 thread _id_5D3B();

        playfx( level._effect["wall_exp_rpg_rescue2"], level._id_5D10.origin + ( 0.0, 0.0, 70.0 ), ( 0.0, 270.0, 1.0 ) );
        earthquake( 0.3, 0.7, level.player.origin, 300 );
        level._id_5D2E = 0;
        thread _id_5D35();
        wait 2.5;
        level notify( "fall_1" );
        level._id_4877.ignoreall = 1;
        level._id_45C4.ignoreall = 1;
        level._id_4D86.ignoreall = 1;
        level._id_45C0.ignoreall = 1;
        earthquake( 0.7, 1, level.player.origin, 300 );
        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, -2358.0 ), 3.3, 0.1, 0.1 );
        level._id_5D10 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevator_crash_snap" );
        thread _id_5D35();
        level._id_5D10 waittill( "movedone" );
        playfx( level._effect["wall_exp_rpg_rescue2"], level._id_5D10.origin + ( 0.0, 0.0, -30.0 ), ( 0.0, 270.0, 1.0 ) );
        level.player shellshock( "default", 1 );

        foreach ( var_2 in level._id_5D2D )
            var_2 thread _id_5D3B();

        earthquake( 1.4, 1.4, level.player.origin, 300 );
        level._id_5D20 = 4;
        var_30 = 0.8;
        thread _id_5D1F( var_30 );
        wait 1.3;
        level._id_5D10 moveto( level._id_5D10.origin + ( 0.0, 0.0, -307.0 ), 0.3, 0.1, 0.1 );
        level notify( "fall_3" );
        level._id_5D10 waittill( "movedone" );
        level._id_5D10 thread maps\_utility::play_sound_on_entity( "scn_rescue_elevator_crash_impact" );
        level.player disableweapons();
        level.player shellshock( "rescue_2_ele_crash", 4.5 );
        level.player allowjump( 1 );

        foreach ( var_2 in level._id_5D2D )
            var_2 thread _id_5D3B();

        earthquake( 1.4, 1.4, level.player.origin, 300 );
        thread _id_5D36();
        maps\_utility::_id_1425( "elevator_one_done_moving" );
        level._id_5D20 = 4;
        var_30 = 0.8;
        thread _id_5D1F( var_30 );
        common_scripts\utility::flag_set( "elevator_one_done_moving" );
        maps\_utility::_id_2822( "clean_fx_for_elevator_shaft" );
        level.player disableinvulnerability();
        wait 1;
        var_30 = 0.8;
        level._id_5258 rotatepitch( 8, var_30, var_30 / 2, var_30 / 2 );
        level._id_5258 waittill( "rotatedone" );
        playfx( common_scripts\utility::getfx( "elevator_collapse_impact" ), level._id_5D10.origin + ( 0.0, 0.0, -53.0 ), ( 0.0, 0.0, 1.0 ) );
        wait 0.4;
        var_37 = getent( "sparks_electricle_three", "script_noteworthy" );
        playfx( common_scripts\utility::getfx( "electrical_transformer_spark_runner_loop" ), var_37.origin + ( 147.0, 125.0, -50.0 ), ( 0.0, 0.0, 1.0 ) );
        playfx( common_scripts\utility::getfx( "electrical_transformer_spark_runner_loop" ), var_37.origin + ( -144.0, 125.0, -50.0 ), ( 0.0, 0.0, 1.0 ) );
        wait 3.3;
        level.player enableweapons();
        thread _id_017D();
        common_scripts\utility::flag_wait( "reset_angles" );
        var_30 = 0.3;
        level._id_5258 rotatepitch( -16, var_30, var_30 / 2, var_30 / 2 );
        level._id_5258 waittill( "rotatedone" );
        wait 1;
        maps\_utility::_id_1425( "elevator_one_done_moving" );
    }
}

_id_017D()
{
    level._id_45C0.grenadeawareness = 0;
    level._id_4D86.grenadeawareness = 0;
    level._id_45C4.grenadeawareness = 0;
    level._id_4877.grenadeawareness = 0;
    wait 8;
    level._id_45C0.grenadeawareness = 1;
    level._id_4D86.grenadeawareness = 1;
    level._id_45C4.grenadeawareness = 1;
    level._id_4877.grenadeawareness = 1;
}

_id_5D2F()
{
    musicstop();
    level._id_4877 unlink();
    level._id_45C4 unlink();
    level._id_4D86 unlink();
    level._id_45C0 unlink();
    wait 3.4;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_status" );
    wait 0.2;
    level._id_45C4 maps\_utility::_id_168C( "rescue_rno_imgood" );
    wait 0.3;
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_wereclear" );
    wait 0.3;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_headsup" );
    wait 0.3;
    musicplay( "rescue_2_elevator_crash", 0 );
    level._id_45C0 maps\_utility::_id_109B();
    level._id_45C4 maps\_utility::_id_109B();
    level._id_4D86 maps\_utility::_id_109B();
    level._id_4877 maps\_utility::_id_109B();
    wait 7;
    musicplay( "rescue_2_action_3", 0 );
}

_id_5D30()
{
    level._id_5D10 rotatepitch( -5, 0.3, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( 10, 0.3, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( -7, 0.4, 0.1, 0.1 );
    level waittill( "fall_1" );
    level._id_5D10 rotatepitch( 11, 0.8, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( -10, 0.8, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( 13, 0.8, 0.1, 0.1 );
    level waittill( "fall_3" );
    level._id_5D10 rotatepitch( -10, 0.8, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( 6, 0.8, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( -6, 0.8, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( 10, 0.3, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    level._id_5D10 rotatepitch( -12, 0.3, 0.1, 0.1 );
    level._id_5D10 waittill( "rotatedone" );
    thread _id_5D2F();
}

_id_5D31()
{
    wait 1.7;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_whatwasthat" );
    wait 0.8;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_deathtrap" );
}

_id_5D32()
{
    wait 5;
    var_0 = randomfloatrange( 0.5, 1.3 );
    var_1 = randomfloatrange( 1.7, 2.5 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
    wait(var_1);
    earthquake( 0.2, var_0, level.player.origin, 1500 );
}

_id_5D33()
{
    maps\_spawner::_id_213C( 20 );
    common_scripts\utility::waitframe();
    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            var_2 delete();
    }
}

_id_5D34()
{
    level._id_45C0 thread maps\_anim::_id_1246( level._id_45C0, "stunned2" );
    wait 0.3;
    level._id_4D86 thread maps\_anim::_id_1246( level._id_4D86, "stunned1" );
    wait 0.3;
    level._id_45C4 thread maps\_anim::_id_1246( level._id_45C4, "stunned1" );
    wait 0.2;
    level._id_4877 thread maps\_anim::_id_1246( level._id_4877, "stunned2" );
}

_id_5D35()
{
    level._id_5D2E++;

    if ( level._id_5D2E == 1 )
    {
        level._id_45C0 thread maps\_anim::_id_1246( level._id_45C0, "hijack_generic_stumble_stand1" );
        wait 0.3;
        level._id_4D86 thread maps\_anim::_id_1246( level._id_4D86, "hijack_generic_stumble_crouch1" );
        wait 0.3;
        wait 0.2;
        level._id_4877 thread maps\_anim::_id_1246( level._id_4877, "hijack_generic_stumble_crouch2" );
    }
    else if ( level._id_5D2E == 2 )
    {
        level._id_45C0 thread maps\_anim::_id_1246( level._id_45C0, "hijack_generic_stumble_crouch2" );
        wait 0.3;
        level._id_4D86 thread maps\_anim::_id_1246( level._id_4D86, "hijack_generic_stumble_stand1" );
        wait 0.3;
        level._id_45C4 thread maps\_anim::_id_1246( level._id_45C4, "hijack_generic_stumble_crouch1" );
        wait 0.2;
        level._id_4877 thread maps\_anim::_id_1246( level._id_4877, "hijack_generic_stumble_stand2" );
    }
}

_id_5D36()
{
    level._id_4877 thread maps\_anim::_id_1246( level._id_4877, "stunned2" );
    wait 0.3;
    level._id_4D86 thread maps\_anim::_id_1246( level._id_4D86, "stunned1" );
    wait 0.2;
    level._id_45C0 thread maps\_anim::_id_1246( level._id_45C0, "stunned2" );
    wait 0.1;
    level._id_45C4 thread maps\_anim::_id_1246( level._id_45C4, "stunned1" );
    common_scripts\utility::waitframe();
    level._id_45C0._id_1032 = "sandman";
    level._id_4D86._id_1032 = "grinch";
    level._id_45C4._id_1032 = "truck";
    level._id_4877._id_1032 = "price";
}

_id_5D37()
{
    wait 9;
    level._id_45C0._id_1032 = "sandman";
    level._id_4D86._id_1032 = "grinch";
    level._id_45C4._id_1032 = "truck";
    level._id_4877._id_1032 = "price";
    level._id_4D86 maps\_utility::_id_168C( "rescue_pri_diamondmine" );
    wait 1;
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2._id_0CD1 = 2;

    wait 6.3;
}

_id_5D38()
{
    common_scripts\utility::flag_wait( "elevator_one_ambush" );
    wait 2.3;

    foreach ( var_1 in level._id_5D2D )
    {
        var_2 = common_scripts\utility::spawn_tag_origin();
        var_2 thread maps\_utility::_id_2765( var_1 );
        var_2 thread _id_5D39();
    }

    common_scripts\utility::flag_wait( "elevator_one_done_moving" );
    wait 2;

    foreach ( var_1 in level._id_5D2D )
    {
        if ( var_1.targetname == "sparks_after" )
        {

        }
    }
}

_id_02B8()
{
    while ( !common_scripts\utility::flag( "elevator_one_done_moving_new_beggining" ) )
    {
        var_0 = randomintrange( 0, 8 );

        switch ( var_0 )
        {
            case 0:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[0].origin, ( 0.0, 0.0, 1.0 ) );
            case 1:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[1].origin, ( 0.0, 0.0, 1.0 ) );
            case 2:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[2].origin, ( 0.0, 0.0, 1.0 ) );
            case 3:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[3].origin, ( 0.0, 0.0, 1.0 ) );
            case 4:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[4].origin, ( 0.0, 0.0, 1.0 ) );
            case 5:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[5].origin, ( 0.0, 0.0, 1.0 ) );
            case 6:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[6].origin, ( 0.0, 0.0, 1.0 ) );
            case 7:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[7].origin, ( 0.0, 0.0, 1.0 ) );
            case 8:
                playfx( common_scripts\utility::getfx( "saw_sparks_one" ), level._id_5D2D[8].origin, ( 0.0, 0.0, 1.0 ) );
        }

        wait(randomfloatrange( 0.7, 2 ));
    }
}

_id_5D39()
{
    level endon( "elevator_one_done_moving" );
    playfxontag( common_scripts\utility::getfx( "sparks_falling_runner_elevator" ), self, "tag_origin" );
}

_id_5D3A()
{
    level endon( "elevator_one_done_moving" );

    for (;;)
    {
        playfx( common_scripts\utility::getfx( "saw_sparks_one" ), self.origin, ( 180.0, 0.0, 1.0 ), ( 0.0, 0.0, 270.0 ) );
        wait 0.2;
    }
}

_id_5D3B()
{
    wait(randomfloatrange( 0, 1 ));
    playfx( common_scripts\utility::getfx( "dust_elevator_shake" ), self.origin, ( 0.0, 0.0, 1.0 ) );
}

_id_5D3C()
{
    level._id_45C0 allowedstances( "crouch" );
    level._id_4877 allowedstances( "crouch" );
    wait 3.5;
    level._id_45C4 allowedstances( "crouch" );
    wait 0.3;
    level._id_5D0B allowedstances( "crouch" );
    wait 0.3;
    wait 0.3;
    wait 0.3;
    level._id_4D86 allowedstances( "crouch" );
    wait 2.3;
    level._id_45C4 thread maps\_anim::_id_1246( level._id_45C4, "ny_manhattan_radio_sandman_talk" );
    wait 3.3;
    level._id_4D86 thread maps\_anim::_id_1246( level._id_4D86, "ny_manhattan_radio_talk_idle" );
    common_scripts\utility::flag_wait( "elevator_one_done_moving_new_beggining" );
    level._id_4D86 stopanimscripted();
    level._id_45C4 stopanimscripted();
    level._id_5D0B stopanimscripted();
    common_scripts\utility::flag_wait( "elevator_one_done_moving" );
    level._id_45C4 allowedstances( "crouch", "stand", "prone" );
    level._id_45C0 allowedstances( "crouch", "stand", "prone" );
    level._id_4877 allowedstances( "crouch", "stand", "prone" );
    level._id_4D86 allowedstances( "crouch", "stand", "prone" );
}

_id_5D3D()
{

}

_id_5D3E()
{
    thread _id_5D45();
    thread _id_5D43();
    var_0 = getent( "spawn_rappel", "targetname" );
    var_0 waittill( "trigger" );
    playfx( level._effect["rescue_2_haxon_light"], ( 6262.0, -12214.5, -8535.0 ), ( 0.0, 0.0, 1.0 ) );
    playfx( level._effect["hijack_fxlight_red_blink"], ( 6132.0, -11016.0, -8446.0 ), ( 0.0, 0.0, 1.0 ) );
    playfx( level._effect["hijack_fxlight_red_blink"], ( 5784.0, -11010.0, -8450.0 ), ( 0.0, 0.0, 1.0 ) );
    playfx( level._effect["hijack_fxlight_red_blink"], ( 6490.0, -11522.0, -8498.0 ), ( 0.0, 0.0, 1.0 ) );
    maps\_utility::_id_1425( "zip_line_cave" );
    maps\_utility::_id_272C( "cave_rappel_ground" );
    common_scripts\utility::flag_wait( "now_spawn_rappel" );
    thread _id_5D3F();
    thread _id_5D41();
    thread _id_5D44();
    maps\_utility::_id_272C( "cave_rappel" );
    var_1 = common_scripts\utility::get_target_ent( "flow_flag_two" );
    var_2 = getent( "ai_use_orange_cnodes_o4", "targetname" );
    var_3 = getent( "ai_use_orange_cnodes_r5", "targetname" );
    var_4 = getentarray( "cave_rappel_rpg", "targetname" );
    var_5 = 8;
    _id_5D2B( undefined, undefined, var_4, undefined, var_5, undefined, undefined );
    var_5 = 4;
    var_6 = getent( "retreat_to_cave", "targetname" );
    _id_5D2B( var_2, var_3, undefined, undefined, var_5, undefined, var_1 );
}

_id_5D3F()
{
    maps\_utility::_id_272C( "cave_lead_player_eye_top" );
}

_id_5D40()
{
    var_0 = getnode( "cave_lead_player_eye_top_goal", "targetname" );
    self._id_0FC6 = 0.8;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.health = 200;
    self.goalradius = 20;
    self.goalheight = 20;
    wait 0.5;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self delete();
}

_id_5D41()
{
    maps\_utility::_id_272C( "cave_lead_player_eye_ground_left" );
}

_id_5D42()
{
    var_0 = getnode( "cave_lead_player_eye_ground_left_goal", "targetname" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.health = 1;
    self.goalradius = 20;
    self.goalheight = 20;
    self.combatmode = "no_cover";
    self setgoalentity( var_0 );
    self waittill( "goal" );
    self.ignoreall = 0;
    self.goalradius = 2048;
}

_id_5D43()
{
    var_0 = getent( "ai_use_orange_cnodes_o4", "targetname" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_272C( "cave_rappel_ground_3rd_wave" );
    wait 1.3;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_sortemout" );
    musicstop( 6 );
}

_id_5D44()
{
    wait 4;
    level._id_45C4 maps\_utility::_id_168C( "rescue_trk_targetshigh" );
    wait 0.4;
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_iseeem" );
}

_id_5D45()
{
    level._id_017E = getent( "small_bay_door_safety_clip", "targetname" );
    level._id_5D46 = getent( "bay_small_door", "targetname" );
    level._id_02B9 = getent( "bay_small_door_breawk", "targetname" );
    var_0 = getent( "burn_background", "targetname" );
    var_1 = getentarray( "burns", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_3 linkto( level._id_5D46 );
        var_3 hide();
    }

    var_0 linkto( level._id_5D46 );
    var_0 hide();
    level._id_02B9 linkto( level._id_5D46 );
    level._id_02B9 connectpaths();
    level._id_5D46 rotateyaw( 80, 0.3, 0.1, 0.1 );
    level._id_5D46 connectpaths();
    common_scripts\utility::flag_wait( "cave_runner_close_door" );
    var_5 = getaiarray( "axis" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7.script_noteworthy ) && var_7.script_noteworthy == "up_top" )
            var_7 kill();
    }

    maps\_utility::_id_1425( "cave_runner" );
    level._id_5D46 thread _id_017F();
    wait 6;
    level._id_5D46 rotateyaw( -80, 1, 0.1, 0.1 );
    level._id_5D46 disconnectpaths();
    level._id_02B9 disconnectpaths();
    level._id_5D46 waittill( "rotatedone" );
    level._id_017E delete();
    var_9 = getaiarray( "axis" );

    foreach ( var_7 in var_9 )
    {
        if ( !isalive( var_7 ) )
            continue;

        if ( var_7.origin[1] < -9748 )
            continue;

        var_7 delete();
    }
}

_id_017F()
{
    self endon( "death" );
    var_0 = 0;

    while ( var_0 <= 20 )
    {
        var_0++;

        if ( distance( level.player.origin, self.origin ) < 100 )
        {
            level.player dodamage( level.player.health + 2, level.player.origin );
            wait 0.3;
            playfx( level._effect["wall_exp_rpg_rescue2"], level.player.origin + ( 0.0, 0.0, 20.0 ), ( 0.0, 270.0, 1.0 ) );
            level.player playsound( "grenade_explode_concrete" );
            earthquake( 0.6, 1, level.player.origin, 300 );
            level.player dodamage( level.player.health + 2, level.player.origin );
            wait 0.3;
            level.player kill();
            break;
        }

        wait 0.3;
    }
}

_id_5D47()
{
    self endon( "death" );
    self._id_1032 = "generic";
    self.goalradius = 2;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.health = 1;
    maps\_utility::_id_260D();
    thread _id_02BA();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "straight_1" )
    {
        self allowedstances( "stand" );
        wait 0.1;
        var_0 = common_scripts\utility::get_target_ent( "straight_1" );
        self.ignoreall = 0;
        self.ignoreme = 0;
        self.goalradius = 2000;
        self.goalheight = 100;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "straight_2" )
    {
        wait 2;
        var_0 = common_scripts\utility::get_target_ent( "straight_2" );
        thread maps\jeremy_tools::_id_51F9( var_0, undefined );
        wait 2;
        self.ignoreall = 0;
        self.ignoreme = 0;
        self.goalradius = 2000;
        self.goalheight = 100;
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "straight_3" )
    {
        wait 3;
        var_0 = common_scripts\utility::get_target_ent( "straight_4" );
        thread maps\jeremy_tools::_id_51F9( var_0, undefined );
        wait 2;
        self.ignoreall = 0;
        self.ignoreme = 0;
        self.goalradius = 2000;
        self.goalheight = 100;
    }

    wait 5;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "left_1" )
    {
        wait 4;
        self.ignoreall = 0;
        self.ignoreme = 0;
        var_1 = common_scripts\utility::get_target_ent( "left_1" );

        if ( isdefined( var_1.animation ) )
            thread _id_5D49( var_1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "left_2" )
    {
        wait 5;
        self.ignoreall = 0;
        self.ignoreme = 0;
        wait 5;
        var_1 = common_scripts\utility::get_target_ent( "left_2" );

        if ( isdefined( var_1.animation ) )
            thread _id_5D49( var_1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "left_3" )
    {
        wait 6;
        self.ignoreall = 0;
        self.ignoreme = 0;
        var_1 = common_scripts\utility::get_target_ent( "left_3" );

        if ( isdefined( var_1.animation ) )
            thread _id_5D49( var_1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "right_1" )
    {
        wait 8;
        self.ignoreall = 0;
        self.ignoreme = 0;
        var_1 = common_scripts\utility::get_target_ent( "right_1" );

        if ( isdefined( var_1.animation ) )
            thread _id_5D49( var_1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "right_2" )
    {
        wait 9;
        self.ignoreall = 0;
        self.ignoreme = 0;
        var_1 = common_scripts\utility::get_target_ent( "right_2" );

        if ( isdefined( var_1.animation ) )
            thread _id_5D49( var_1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "right_3" )
    {
        wait 10;
        self.ignoreall = 0;
        self.ignoreme = 0;
        var_1 = common_scripts\utility::get_target_ent( "right_3" );

        if ( isdefined( var_1.animation ) )
            thread _id_5D49( var_1 );
    }
}

_id_02BA()
{
    self endon( "end_reaction" );
    self endon( "animation_killed_me" );
    self waittill( "damage" );
    self stopanimscripted();
}

_id_5D48()
{
    self endon( "death" );
    wait 2.0;

    while ( self getanimtime( maps\_utility::_id_270F( "rappel_skylight_drop" ) ) < 0.96 )
        wait 0.05;

    self notify( "killanimscript" );
}

_id_5D49( var_0 )
{
    self endon( "death" );
    self._id_1032 = "generic";
    var_1 = var_0;
    var_1 maps\_anim::_id_11CF( self, self.animation );
    wait 0.5;
    var_2 = spawn( "script_origin", var_1.origin );
    var_2.angles = var_1.angles;
    var_3 = spawn( "script_model", var_2.origin );
    var_3 setmodel( "coop_bridge_rappelrope" );
    var_3._id_1032 = "rope_two";
    var_3 maps\_utility::_id_2629();
    var_2 maps\_anim::_id_11CF( var_3, "coop_ropedrop_01" );
    var_2 maps\_anim::_id_1246( var_3, "coop_ropedrop_01" );
    self.allowdeath = 1;
    var_2 thread maps\_anim::_id_1246( var_3, "coop_" + self.animation );
    var_1 thread maps\_anim::_id_11C1( self, self.animation );

    if ( isdefined( self._id_250B ) )
    {
        self waittill( "jumpedout" );
        wait 0.5;
    }

    var_3 thread _id_0180();
    self.goalradius = 2048;
    self setgoalentity( level.player );
    self waittill( "goal" );
    self.health = 100;
    self.goalradius = 2048;
    self.goalheight = 200;
}

_id_0180()
{
    wait 4.3;
    var_0 = spawn( "script_origin", self.origin );
    self linkto( var_0 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -500.0 ), 0.3 );
    var_0 waittill( "movedone" );
    var_0 delete();
}

_id_5D4A()
{

}

_id_5D4B()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "up_top" )
        self allowedstances( "stand" );

    self._id_217A = 1;
    self.goalradius = 20;
    self.goalheight = 20;
    self.health = 10;
}

_id_5D4C()
{
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.goalradius = 10;
    self._id_0D11 = 1;
    self.grenadeawareness = 0;
    maps\_utility::_id_1058( 1 );
    self._id_0FC6 = 1.3;
    var_0 = getnode( "bay_runner_delete_me", "targetname" );
    common_scripts\utility::waitframe();
    maps\_utility::_id_2712();
    self setgoalnode( var_0 );
    wait 2;
    self waittill( "goal" );
    maps\_utility::_id_2713();
    self.ignoreme = 0;
    self delete();
}

_id_5D4D()
{
    self.ignoreall = 1;
    self.health = 10;
    self.goalradius = 300;
    wait 0.4;
    var_0 = getnode( "bay_runner_delete_me", "targetname" );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self kill();
}

_id_5D4E()
{
    common_scripts\utility::flag_wait( "saw_door" );
    _id_0182();
    maps\_utility::_id_1425( "saw_door" );
    thread _id_5D4F();
    level._id_45C4 maps\_utility::_id_109E();
    musicplay( "rescue_2_elevator_beg", 0 );
    var_0 = common_scripts\utility::get_target_ent( "ludes_test2" );
    var_0 maps\_anim::_id_124A( level._id_45C4, "rescue_saw_cutter" );
    level._id_02B9 connectpaths();
    level._id_02B9 unlink();
    var_0 thread maps\_anim::_id_1246( level._id_45C4, "rescue_saw_cutter" );
    wait 9;
    var_1 = vectornormalize( level.player.origin - level._id_02B9.origin );
    var_2 = common_scripts\utility::random( [ 200, 350, 450 ] );
    level._id_02B9 movegravity( var_1 * var_2, 10 );
    level._id_02B9 rotatevelocity( ( randomfloatrange( -40, 40 ), randomfloatrange( -40, 40 ), randomfloatrange( -40, 40 ) ), 10 );
    wait 3.26667;
    level._id_45C4 thread _id_0181();
    var_3 = common_scripts\utility::get_target_ent( "kick_door_one" );
    var_3 maps\_anim::_id_124A( level._id_4877, "doorkick_2_cqbwalk" );
    var_3 thread maps\_anim::_id_1246( level._id_4877, "doorkick_2_cqbwalk" );
    var_4 = 100;
    var_5 = common_scripts\utility::getstruct( "saw_door_kick_fxnode", "targetname" );
    level._id_5D46 = getent( "bay_small_door", "targetname" );
    var_6 = level._id_5D46;
    common_scripts\utility::waitframe();
    thread maps\jeremy_tools::_id_5213( var_6, undefined, "scn_rescue_chopsaw_door_kick", 0.5, var_4, var_5 );
    var_6 connectpaths();
    common_scripts\utility::flag_set( "start_bay_sequence" );
    common_scripts\utility::flag_set( "start_bay_runners" );
    level._id_4877._id_1057 = 1;
    level._id_45C4._id_1057 = 1;
    level._id_45C0._id_1057 = 1;
    level._id_4D86._id_1057 = 1;
    level._id_4877 maps\_utility::_id_26F3( 1 );
    level._id_45C4 maps\_utility::_id_26F3( 1 );
    level._id_45C0 maps\_utility::_id_26F3( 1 );
    level._id_4D86 maps\_utility::_id_26F3( 1 );
    level._id_4877 maps\_utility::_id_13A4( "r" );
    level._id_45C4 maps\_utility::_id_13A4( "r" );
    level._id_4D86 maps\_utility::_id_13A4( "r" );
    common_scripts\utility::flag_set( "saw_door_open" );
    maps\_utility::_id_265B( "allies" );
    maps\_utility::delaythread( 0.3, maps\_utility::_id_26BF, "send_allies_through_door" );
    playfx( level._effect["rescue_2_haxon_light"], ( 6055.0, -8260.0, -8440.0 ), ( 0.0, 0.0, 1.0 ) );
    maps\_utility::_id_1425( "saw_in_bay_batle" );
    wait 6;
    level._id_4877._id_1057 = 1;
    level._id_45C4._id_1057 = 1;
    level._id_45C0._id_1057 = 1;
    level._id_4D86._id_1057 = 1;
    level._id_4877 maps\_utility::_id_26F3( 0 );
    level._id_45C4 maps\_utility::_id_26F3( 0 );
    level._id_45C0 maps\_utility::_id_26F3( 0 );
    level._id_4D86 maps\_utility::_id_26F3( 0 );
}

_id_0181()
{
    wait 3;
    level._id_45C4 thread maps\_anim::_id_11C8( level._id_45C4, "corner_standL_alert_idle" );
    common_scripts\utility::flag( "start_bay_runners" );
    wait 9;
    level._id_45C4 maps\_utility::_id_1414();
    level._id_45C4 thread maps\_utility::_id_109B();
}

_id_0182()
{
    level endon( "saw_door_open" );
    var_0 = 0;

    for (;;)
    {
        var_1 = getaiarray( "axis" );

        if ( var_1.size == var_0 )
            return;

        foreach ( var_3 in var_1 )
        {
            if ( !isalive( var_3 ) )
                continue;

            if ( var_3.origin[1] > -10200 || var_3.origin[2] > -8444 )
                continue;

            var_3 thread _id_601D();
        }

        wait 0.5;
    }
}

_id_601D()
{
    self.goalradius = 148;
    self setgoalentity( level.player );
}

_id_0183()
{
    var_0 = common_scripts\utility::get_target_ent( "burn_one" );
    var_1 = common_scripts\utility::get_target_ent( "burn_two" );
    var_2 = common_scripts\utility::get_target_ent( "burn_three" );
    var_3 = common_scripts\utility::get_target_ent( "burn_four" );
    var_4 = common_scripts\utility::get_target_ent( "burn_five" );
    var_5 = common_scripts\utility::get_target_ent( "burn_six" );
    var_6 = getent( "burn_background", "targetname" );
    var_6 show();
    var_0 show();
    wait 0.4;
    var_1 show();
    wait 0.4;
    var_2 show();
    wait 0.4;
    var_3 show();
    wait 0.4;
    var_4 show();
    wait 0.4;
    var_5 show();
}

_id_02BB()
{
    level._id_45C4 thread maps\_anim::_id_11C8( level._id_45C4, "corner_standL_alert_idle" );
    common_scripts\utility::flag( "start_bay_runners" );
    wait 9;
    level._id_45C4 maps\_utility::_id_1414();
    level._id_45C4 thread maps\_utility::_id_109B();
}

_id_5D4F()
{
    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_allclear" );
    wait 0.5;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_youreup" );
    wait 0.5;
    level._id_45C4 maps\_utility::_id_168C( "rescue_trk_onit" );
}

_id_5D51()
{
    var_0 = spawn( "script_origin", self.origin + ( 0.0, 0.0, -350.0 ) );
    self waittill( "vent_drop" );
    thread common_scripts\utility::play_sound_in_space( "launch_grate_falling", var_0.origin );
    var_1 = 2.5;
    var_2 = self.angles + ( 0.0, 0.0, 25.0 );
    self movez( -3500, var_1, var_1 / 3 );
    self rotateto( var_2, 1, 0.2 );
}

_id_5D52()
{
    self endon( "stop_sparks" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "saw_sparks_one" ), self, "TAG_SPARKS" );
        playfxontag( common_scripts\utility::getfx( "saw_sparks_bounce" ), self, "TAG_SPARKS" );
        wait 0.1;
    }
}

_id_5D53()
{
    thread _id_5D4E();
    common_scripts\utility::flag_wait( "start_bay_sequence" );
    thread _id_5D59();
    thread _id_5D54();
    thread _id_5D5C();
}

_id_5D54()
{
    common_scripts\utility::flag_wait( "start_bay_runners" );
    thread _id_5D56();
    maps\_utility::_id_272C( "bay_runner" );
    var_0 = maps\_utility::_id_272C( "bay_runner_stay" );
    common_scripts\utility::array_thread( var_0, ::_id_02BC );
    common_scripts\utility::flag_wait( "start_bay_combat" );
    maps\_utility::_id_272C( "bay_runner_garage" );
    maps\_utility::delaythread( 3, ::_id_5D55 );
    var_1 = getentarray( "bay_garage_support", "targetname" );
    var_2 = 5;
    var_3 = common_scripts\utility::get_target_ent( "flow_flag_three" );
    _id_5D2B( undefined, undefined, var_1, undefined, var_2, undefined, var_3 );
    wait 5;
    var_4 = 2;
    var_5 = getent( "ai_use_red_cnodes_r9", "targetname" );
    var_2 = 4;
    thread _id_5D2B( var_5, undefined, undefined, var_4, var_2, undefined, undefined );
    maps\_utility::_id_265A( "allies" );
}

_id_02BC()
{
    self.health = 20;
    self.accuracy = 0.2;
    maps\_utility::_id_26F3( 1 );
    self allowedstances( "crouch" );
    self.goalradius = 50;
}

_id_5D55()
{
    var_0 = 0;

    while ( var_0 <= 40 )
    {
        var_0++;
        magicbullet( "g36c_reflex", ( 5837.0, -8541.0, -8596.0 ), ( 5855.0, -8611.0, -8596.0 ), level.player );
        common_scripts\utility::waitframe();
    }
}

_id_5D56()
{
    var_0 = getent( "garage_color_node_r11 ", "targetname" );
    var_1 = getent( "ai_use_red_cnodes_r9", "targetname" );
    var_1 waittill( "trigger" );
    musicstop( 8 );
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_keepmoving" );
    wait 14;

    if ( isdefined( level.player._id_522C ) && level.player._id_522C == 1 )
    {
        level.player nightvisiongogglesforceoff();
        level.player setactionslot( 1, "" );
    }
    else
        level.player setactionslot( 1, "" );

    level._id_4D86 maps\_utility::_id_168C( "rescue_rno_needanotherway" );
    thread _id_0031();

    if ( isdefined( var_0 ) )
        var_0 maps\_utility::_id_2703();

    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_takestairwell" );
    level._id_45C0 maps\_utility::_id_109E();
    level._id_45C4 maps\_utility::_id_109E();
    level._id_4D86 maps\_utility::_id_109E();
    level._id_4877 maps\_utility::_id_109E();
    level._id_4877._id_0FC6 = 1.2;
    wait 6;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_0031()
{
    level._id_45C0._id_0CD1 = 2;
    wait 2;
    level._id_4D86._id_0CD1 = 2;
}

_id_5D57()
{
    self endon( "death" );
    self.goalradius = 200;
    var_0 = common_scripts\utility::get_target_ent( "bay_runner_garage_goal_lower" );
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
    self.goalradius = 2048;
}

_id_5D58()
{
    self.goalradius = 500;
    var_0 = common_scripts\utility::get_target_ent( "bay_runner_garage_goal_lower" );
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
}

_id_5D59()
{
    common_scripts\utility::flag_wait( "start_bay_combat" );
    var_0 = maps\_vehicle::_id_2881( "garage_snowmobile_one" );
    var_1 = maps\_utility::_id_2641( "high_threat_spawner", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3.health = 10000;

    var_0._id_5D5A = 1;
    wait 1;
    var_5 = maps\_vehicle::_id_2881( "garage_snowmobile_two" );
    var_1 = maps\_utility::_id_2641( "high_threat_spawner", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3.health = 10000;

    var_5._id_5D5A = 1;
    thread _id_5D5B();
    var_5 thread _id_0184();
}

_id_0184()
{
    self endon( "death" );
    wait 3;

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 400 )
        {
            level.player dodamage( level.player.health + 2, level.player.origin );
            wait 0.3;
            playfx( level._effect["wall_exp_rpg_rescue2"], level.player.origin + ( 0.0, 0.0, 20.0 ), ( 0.0, 270.0, 1.0 ) );
            level.player playsound( "grenade_explode_concrete" );
            earthquake( 0.6, 1, level.player.origin, 300 );
            level.player dodamage( level.player.health + 2, level.player.origin );
            wait 0.3;
            level.player setstance( "crouch" );
            level.player shellshock( "default", 4 );
            break;
        }

        wait 0.05;
    }
}

_id_5D5B()
{
    var_0 = maps\_utility::_id_2641( "high_threat_spawner", "script_noteworthy" );
    wait 12;

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            var_2 kill();
    }

    wait 30;
    var_4 = maps\_utility::_id_2642( "garage_snowmobile_one", "targetname" );
    var_5 = maps\_utility::_id_2642( "garage_snowmobile_two", "targetname" );
    var_4 delete();
    var_5 delete();
}

_id_5D5C()
{
    var_0 = getentarray( "bay_door_r", "targetname" );
    var_1 = getentarray( "bay_door_l", "targetname" );
    common_scripts\utility::waitframe();

    foreach ( var_3 in var_0 )
        var_3 moveto( var_3.origin + ( 252.0, 0.0, 0.0 ), 0.1 );

    foreach ( var_3 in var_1 )
        var_3 moveto( var_3.origin + ( -252.0, 0.0, 0.0 ), 0.1 );

    common_scripts\utility::flag_wait( "start_bay_combat" );

    foreach ( var_3 in var_0 )
        var_3 moveto( var_3.origin + ( -303.5, 0.0, 0.0 ), 13, 1, 0.1 );

    foreach ( var_3 in var_1 )
        var_3 moveto( var_3.origin + ( 303.5, 0.0, 0.0 ), 13, 1, 0.1 );

    wait 8;
}

_id_5D5D()
{
    common_scripts\utility::flag_wait( "open_bay_double_doors" );
    var_0 = maps\_utility::_id_2641( "hallway_guys_before_reveal", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 kill();

    thread _id_5D5E();
    var_4 = common_scripts\utility::get_target_ent( "kick_door_three" );
    var_5 = common_scripts\utility::get_target_ent( "kick_door_two" );
    var_4 maps\_anim::_id_124A( level._id_4877, "rescue_door_breach_p" );
    var_5 maps\_anim::_id_124A( level._id_45C0, "rescue_door_breach_s" );
    level._id_4877._id_1032 = "price";
    level._id_45C0._id_1032 = "sandman";
    common_scripts\utility::waitframe();
    maps\_utility::delaythread( 12.2667, maps\_utility::_id_1428, "rescue_2_reveal" );
    var_4 thread maps\_anim::_id_1246( level._id_4877, "rescue_door_breach_p" );
    var_5 thread maps\_anim::_id_1246( level._id_45C0, "rescue_door_breach_s" );
    maps\_utility::_id_272C( "bay_top_outside_two" );
    maps\_utility::_id_265A( "axis" );
    var_6 = common_scripts\utility::get_target_ent( "exit_bay_door_l" );
    var_7 = common_scripts\utility::get_target_ent( "exit_bay_door_r" );
    var_8 = 170;
    thread _id_0185();
    var_9 = common_scripts\utility::getstruct( "bay_door_kick_fxnode", "targetname" );
    maps\jeremy_tools::_id_5213( var_6, var_7, "scn_rescue_stairs_doubledoor_kick", 13.5667, var_8, var_9 );
    common_scripts\utility::flag_set( "start_yard_one" );
    thread _id_0032();
    maps\_utility::_id_265B( "allies" );
    maps\_utility::_id_265B( "axis" );
    setthreatbias( "allies_center", "yard_one_top_guys", 50000 );
    setthreatbias( "yard_one_top_guys", "allies_center", 50000 );
    level._id_45C0 allowedstances( "crouch" );
    level._id_4877 allowedstances( "crouch" );
    common_scripts\utility::flag_set( "top_side_god_off" );
    setthreatbias( "yard_one_top_guys", "delta", 0 );
    maps\_utility::_id_1425( "open_bay_double_doors" );
    wait 4;
    maps\_utility::_id_26BF( "color_node_r19" );
    level._id_45C4 thread maps\jeremy_tools::_id_5D01( common_scripts\utility::get_target_ent( "truck_top" ) );
    level._id_4D86 thread maps\jeremy_tools::_id_5D01( common_scripts\utility::get_target_ent( "grinch_top" ) );
}

_id_0032()
{
    wait 4;
    var_0 = ( 6038.0, -7376.0, -8200.0 );
    common_scripts\utility::play_sound_in_space( "rescue_ru3_openfire", var_0 + ( 0.0, -100.0, 0.0 ) );
    common_scripts\utility::play_sound_in_space( "rescue_ru2_stayaway", var_0 + ( -100.0, 0.0, 0.0 ) );
    common_scripts\utility::play_sound_in_space( "rescue_ru1_getready", var_0 + ( 100.0, 0.0, 0.0 ) );
}

_id_0185()
{
    wait 13.5667;

    if ( distance( level.player.origin, level._id_4877.origin ) < 400 )
    {
        level.player thread maps\_utility::vision_set_fog_changes( "rescue_2_sunblind", 1.5 );
        level.player maps\_utility::delaythread( 0.43333, maps\_utility::vision_set_fog_changes, "mine_exterior", 4 );
        level._id_13EE = "mine_exterior";
    }
}

_id_5D5E()
{
    level._id_45C0.ignoreall = 1;
    level._id_45C4.ignoreall = 1;
    level._id_4D86.ignoreall = 1;
    level._id_4877.ignoreall = 1;
    level._id_45C0.ignoreme = 1;
    level._id_45C4.ignoreme = 1;
    level._id_4D86.ignoreme = 1;
    level._id_4877.ignoreme = 1;
    level.player.ignoreme = 1;
    common_scripts\utility::flag_wait( "top_side_god_off" );
    level._id_45C0.ignoreall = 0;
    level._id_45C4.ignoreall = 0;
    level._id_4D86.ignoreall = 0;
    level._id_4877.ignoreall = 0;
    level._id_45C0.ignoreme = 0;
    level._id_45C4.ignoreme = 0;
    level._id_4D86.ignoreme = 0;
    level._id_4877.ignoreme = 0;
    level.player.ignoreme = 0;
    wait 8;
    level._id_45C0 allowedstances( "crouch", "stand", "crouch" );
    level._id_4877 allowedstances( "crouch", "stand", "crouch" );
}

_id_5D5F()
{
    thread maps\_utility::_id_0D04();
    self.goalradius = 1;
    self.goalheight = 1;
    maps\_utility::_id_26F3( 1 );
    self allowedstances( "stand" );
    self setthreatbiasgroup( "yard_one_top_guys" );
    common_scripts\utility::flag_wait( "top_side_god_off" );
    thread maps\_utility::_id_1902();
}

_id_5D60()
{
    self endon( "death" );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "top_side_god_off" );
    wait 10;
    self.ignoreall = 0;
    common_scripts\utility::flag_wait( "yard_retreat_one_new" );
    self.health = 1;
    self.ignoreall = 1;
    var_0 = getent( "yard_retreat_one", "script_noteworthy" );
    self setgoalvolumeauto( var_0 );
}

_id_5D61()
{
    thread _id_5D62();
    thread _id_5D63();
    thread _id_5D64();
}

_id_5D62()
{

}

_id_5D63()
{

}

_id_5D64()
{

}

_id_5D65()
{

}

_id_5D66()
{

}

_id_5D67()
{

}

_id_5D68()
{
    common_scripts\utility::flag_set( "ai_use_red_cnodes" );
    thread _id_5D5D();
}

_id_5D69()
{
    thread _id_5D6C();
    common_scripts\utility::flag_wait( "start_yard_one" );
    level._id_02BD = common_scripts\utility::get_target_ent( "new_cave_door_collision" );
    level._id_02BD disconnectpaths();
    maps\_utility::_id_2797( 100 );
    var_0 = getent( "hillside_subs", "targetname" );
    var_0 delete();
    thread _id_5D6B();
    thread _id_5D8D();
    thread _id_5DE1();
    thread _id_5DAA();
    thread _id_5DA9();
    level._id_5D6A = getent( "yard_blow_power_tower", "targetname" );
    thread _id_5D6F();
    thread _id_5D77();
    level._id_138C = getent( "color_node_r23_o13", "targetname" );
    thread _id_5D7B();
    thread _id_5D7A();
    thread _id_5754();
    thread _id_5D87();
    thread _id_5D9B();
    thread _id_5D92();
    thread _id_5D9D();
    thread _id_5D9C();
    thread _id_5D93();
    thread _id_5DA3();
    thread _id_5DAE();
    level._id_45C0 maps\_utility::_id_13A4( "r" );
    level._id_4877 maps\_utility::_id_13A4( "r" );
    level._id_45C4 maps\_utility::_id_13A4( "o" );
    level._id_4D86 maps\_utility::_id_13A4( "o" );
    thread _id_5DA1();
    wait 10;
    level._id_45C0 maps\_utility::_id_109E();
    level._id_45C4 maps\_utility::_id_109E();
    level._id_4D86 maps\_utility::_id_109E();
    level._id_4877 maps\_utility::_id_109E();
}

_id_5D6B()
{
    var_0 = getent( "yard_one_color_node_forward_pre_one_before", "targetname" );
    var_1 = getent( "yard_one_color_node_forward_pre_one", "targetname" );
    var_2 = getent( "yard_one_color_node_forward", "targetname" );
    var_3 = getent( "yard_one_color_node_forward_two", "targetname" );
    self endon( "spawn_middle_yard" );
    common_scripts\utility::flag_wait( "yard_activate_orange_nodes" );
    maps\_utility::_id_2822( "clean_fx_for_first_bottom_cave_one" );
    maps\_utility::_id_2822( "clean_fx_for_first_bottom_cave_two" );
    wait 6;
    var_4 = getent( "yard_retreat_one", "script_noteworthy" );
    var_5 = 1;
    maps\jeremy_tools::_id_520E( var_4, var_5 );
    var_0 maps\_utility::_id_2703();
    wait 4;
    var_4 = getent( "yard_color_node_two", "targetname" );
    var_5 = 1;
    maps\jeremy_tools::_id_520E( var_4, var_5 );
    level._id_45C0 maps\_utility::_id_13A4( "o" );
    level._id_4877 maps\_utility::_id_13A4( "o" );
    var_1 maps\_utility::_id_2703();
    wait 4;
    var_4 = getent( "yard_color_node_three", "targetname" );
    var_5 = 1;
    maps\jeremy_tools::_id_520E( var_4, var_5 );
    var_2 maps\_utility::_id_2703();
    wait 2;
    var_4 = getent( "yard_color_node_three", "targetname" );
    var_5 = 1;
    maps\jeremy_tools::_id_520E( var_4, var_5 );
    var_3 maps\_utility::_id_2703();
}

_id_5D6C()
{
    var_0 = getent( "exca_back", "targetname" );
    var_1 = getent( "exca_arm", "targetname" );
    var_1 linkto( var_0 );
    var_2 = getentarray( "exca_bucket_section", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4.script_noteworthy ) && var_4.script_noteworthy == "origin_piece" )
            level._id_5D6D = spawn( "script_origin", var_4.origin );
    }

    common_scripts\utility::waitframe();

    foreach ( var_4 in var_2 )
        var_4 linkto( level._id_5D6D );

    level._id_5D6D linkto( var_0 );
    var_0 rotateyaw( -90, 0.1 );
    common_scripts\utility::flag_wait( "start_yard_one" );
    var_0 rotateyaw( 60, 90 );
}

_id_5D6E()
{
    for (;;)
    {
        level._id_5D6D rotatepitch( -180, 20 );
        level._id_5D6D waittill( "rotatedone" );
        level._id_5D6D rotatepitch( 180, 20 );
        level._id_5D6D waittill( "rotatedone" );
    }
}

_id_5D6F()
{
    level._id_5D70 = getentarray( "silo_1_pristine", "targetname" );
    level._id_5D71 = getentarray( "metal_railings_prestine", "targetname" );
    level._id_5D72 = getentarray( "silo_1_damage", "targetname" );
    level._id_5D73 = getentarray( "metal_railings_damaged", "targetname" );

    foreach ( var_1 in level._id_5D72 )
        var_1 hide();

    foreach ( var_1 in level._id_5D73 )
        var_1 hide();

    wait 5.0;
    playfx( level._effect["bomb_explosion_ac130_small"], level._id_5D73[0].origin + ( 0.0, 0.0, -800.0 ), ( 0.0, 0.0, 1.0 ) );
    wait 0.4;
    wait 10;
    playfx( level._effect["bomb_explosion_ac130_small"], level._id_5D72[0].origin, ( 0.0, 0.0, 1.0 ) );
    wait 1.7;
    playfx( level._effect["bomb_explosion_ac130_small"], level._id_5D72[1].origin, ( 0.0, 0.0, 1.0 ) );
    wait 3.3;
    wait 1;
    playfx( level._effect["bomb_explosion_ac130"], level._id_5D72[1].origin + ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
}

_id_5D74()
{
    level._id_5D75 = getentarray( "2nd_tier_group_flyby", "targetname" );
    level._id_5D76 = getent( "fake_hind", "targetname" );
    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[2] );
    common_scripts\utility::waitframe();
    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[0] );
    common_scripts\utility::waitframe();
    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[1] );
    wait 2;
    level._id_5D75 = getentarray( "3rd_tier_group_flyby", "targetname" );
    level._id_5D76 = getent( "faker", "targetname" );
    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[2] );
    common_scripts\utility::waitframe();
    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[0] );
    common_scripts\utility::waitframe();
    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[1] );

    while ( !common_scripts\utility::flag( "courtyard_cleared" ) )
    {
        wait(randomfloatrange( 12, 16 ));
        var_0 = 0;
        var_0 = randomintrange( 0, 1 );
        level._id_5D75 = getentarray( "2nd_tier_group_flyby", "targetname" );
        var_1 = randomintrange( 1, 3 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            wait(randomfloatrange( 1, 2 ));
            var_3 = 0;

            switch ( var_3 )
            {
                case 0:
                    level._id_5D76 = getent( "fake_hind", "targetname" );
                    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[0] );
                case 1:
                    level._id_5D76 = getent( "fake_hind", "targetname" );
                    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[1] );
                case 2:
                    level._id_5D76 = getent( "fake_hind", "targetname" );
                    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[2] );
            }
        }

        common_scripts\utility::waitframe();
        level._id_5D76 thread _id_5DAF();
        var_0 = 0;
        var_0 = randomintrange( 0, 1 );

        switch ( var_0 )
        {
            case 0:
                level._id_5D75 = getentarray( "3rd_tier_group_flyby", "targetname" );
            case 1:
                level._id_5D75 = getentarray( "3rd_tier_group_flyby_other_side", "targetname" );
        }

        level._id_5D75 = getentarray( "3rd_tier_group_flyby", "targetname" );
        var_1 = randomintrange( 1, 3 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            wait(randomfloatrange( 1, 2 ));
            var_3 = 0;
            var_3 = randomintrange( 0, 2 );

            switch ( var_3 )
            {
                case 0:
                    level._id_5D76 = getent( "faker", "targetname" );
                    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[0] );
                case 1:
                    level._id_5D76 = getent( "faker", "targetname" );
                    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[1] );
                case 2:
                    level._id_5D76 = getent( "faker", "targetname" );
                    level._id_5D76 = level._id_5D76 _id_5DDC( level._id_5D75[2] );
            }

            common_scripts\utility::waitframe();
            common_scripts\utility::array_thread( level._id_5D76.mgturret, ::_id_5D85 );
            level._id_5D76 thread _id_5DAF();
        }

        wait 20;
    }
}

_id_5D77()
{
    common_scripts\utility::flag_wait( "yard_start_strafes" );
    level._id_45C0 thread maps\_utility::_id_168C( "rescue_snd_cutthrough" );
    var_0 = maps\_vehicle::_id_2881( "faker_4" );
    var_0 thread maps\_utility::delaythread( 1, ::_id_5D9A );
    var_0 notify( "stop_kicking_up_dust" );
    var_0 thread _id_5DAF();
    common_scripts\utility::flag_wait( "spawn_in_last_subs" );
    var_1 = maps\_vehicle::_id_2881( "faker_2" );
    var_1 thread maps\_utility::delaythread( 3, ::_id_5D9A );
    var_1 notify( "stop_kicking_up_dust" );
    var_1 thread _id_5DAF();
    wait 7;
    var_2 = maps\_vehicle::_id_2881( "faker_3" );
    var_2 notify( "stop_kicking_up_dust" );
    var_2 thread maps\_utility::delaythread( 3, ::_id_5D9A );
    var_2 thread _id_5DAF();
}

_id_5D78( var_0 )
{
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_hoptherail" );
    var_0 maps\_utility::_id_2703();
    var_1 = maps\_vehicle::_id_2881( "heli_ally_drop_one" );
    var_1 notify( "stop_kicking_up_dust" );
    var_1._id_0AB5 = "Honey";
    common_scripts\utility::array_thread( var_1.mgturret, ::_id_5D84 );
    var_1 maps\_vehicle::_id_2A12();
    var_1 thread _id_5DAF();
    wait 1.3;
    var_2 = maps\_vehicle::_id_2881( "heli_ally_drop_two" );
    var_2 notify( "stop_kicking_up_dust" );
    var_2._id_0AB5 = "Badger";
    common_scripts\utility::array_thread( var_1.mgturret, ::_id_5D84 );
    var_2 maps\_vehicle::_id_2A12();
    var_2 thread _id_5DAF();
    wait 4.5;
    maps\_utility::_id_11F4( "rescue_lp1_ondeck" );
    maps\_utility::_id_11F4( "rescue_lp1_coverpattern" );
}

_id_5D79()
{
    level._id_4D86.goalradius = 2;
    var_0 = common_scripts\utility::getstruct( "mineyard_slide", "targetname" );
    var_1 = common_scripts\utility::getstruct( "mineyard_slide_two", "targetname" );
    var_2 = getent( "slide_anim_reach", "targetname" );
    var_3 = getent( "slide_two_anim_reawch", "targetname" );
    var_1 thread maps\_anim::_id_1246( level._id_4D86, "afgan_caves_price_slide" );
}

_id_5D7A()
{
    var_0 = getentarray( "road_fighters", "targetname" );
    maps\_spawner::_id_2135( var_0 );
}

_id_5D7B()
{
    wait 4;
    common_scripts\utility::array_thread( getentarray( "littlebird_trigger", "targetname" ), ::_id_5D7F );
    maps\_utility::delaythread( 5, maps\_utility::_id_11F4, "rescue_lp1_gunsguns" );
    level thread _id_5D80();
    var_0 = getent( "amb_fly_by_two", "targetname" );
    var_1 = getent( "littlebird", "targetname" );
    level._id_5D7C = var_1 _id_5DDC( var_0 );
    level._id_5D7C maps\_vehicle::_id_2A12();
    level._id_5D7C notify( "stop_kicking_up_dust" );
    common_scripts\utility::array_thread( level._id_5D7C.mgturret, ::_id_5D84 );
    level._id_5D7C waittill( "reached_dynamic_path_end" );

    if ( isalive( level._id_5D7C ) )
    {
        var_0 = getent( "strafe_one_tier_one_right_side", "targetname" );
        level._id_5D7C thread _id_5DDE( var_0 );
        level._id_5D7C waittill( "reached_dynamic_path_end" );
        var_0 = getent( "strafe_two_tier_one_right_side", "targetname" );
        level._id_5D7C thread _id_5DDE( var_0 );
        level._id_5D7C waittill( "reached_dynamic_path_end" );
        var_2 = getentarray( "right_side_amb_strafs", "targetname" );
        level._id_5D7C thread _id_5D7D( var_2 );
    }
    else if ( !isalive( level._id_5D7C ) )
    {
        var_0 = getent( "amb_fly_by_two", "targetname" );
        var_1 = getent( "littlebird", "targetname" );
        level._id_5D7C = var_1 _id_5DDC( var_0 );
        level._id_5D7C notify( "stop_kicking_up_dust" );
    }
}

_id_5D7D( var_0 )
{
    self vehicle_setspeed( 60, 200, 200 );

    while ( isalive( self ) )
    {
        if ( isalive( self ) )
        {
            var_1 = maps\_utility::_id_0B53( var_0 );
            var_2 = randomintrange( 0, 1 );

            switch ( var_2 )
            {
                case 0:
                    thread _id_5DDE( var_1[0] );
                case 1:
                    thread _id_5DDE( var_1[1] );
            }
        }

        self waittill( "reached_dynamic_path_end" );
    }
}

_id_5D7E()
{
    self endon( "stop_follow_path" );
    self endon( "stop_fire_minigun" );
    self setvehweapon( "turret_attackheli" );
    var_0 = 0.2;
    var_1 = 0;

    for (;;)
    {
        thread vehicle_scripts\_attack_heli::_id_28B7();
        wait(var_0);
        var_1++;
    }
}

_id_5D7F()
{
    level endon( "spawn_littlebird" );
    self waittill( "trigger" );
    level notify( "spawn_littlebird", self.target );
}

_id_5D80()
{
    level waittill( "spawn_littlebird", var_0 );
    maps\_utility::delaythread( 5, maps\_utility::_id_11F4, "rescue_lp1_constructionsite" );
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( "littlebird", "targetname" );
    level._id_4F96 = var_2 _id_5DDC( var_1 );
    level._id_4F96 notify( "stop_kicking_up_dust" );
    level._id_4F96._id_0AB5 = "Viper One";
    level._id_4F96 thread _id_5D82();
    thread _id_5D81();
    common_scripts\utility::array_thread( level._id_4F96.mgturret, ::_id_5D84 );

    for (;;)
    {
        if ( !isalive( level._id_4F96 ) && !common_scripts\utility::flag( "courtyard_cleared" ) )
        {
            var_1 = getent( "strafe_four_now", "targetname" );
            var_2 = getent( "littlebird", "targetname" );
            level._id_4F96 = var_2 _id_5DDC( var_1 );
            level._id_4F96 notify( "stop_kicking_up_dust" );
            level._id_4F96._id_0AB5 = "Viper Two";
            level._id_4F96 vehicle_setspeed( 60, 200, 200 );
            common_scripts\utility::array_thread( level._id_4F96.mgturret, ::_id_5D84 );
            wait 5;
        }

        wait 0.05;
    }
}

_id_5D81()
{
    level._id_4F96 endon( "death" );
    common_scripts\utility::flag_wait( "middle_yard_blockers" );
    maps\_utility::_id_11F4( "rescue_lp1_engaging" );
    level._id_5D06 = 4;

    if ( isalive( level._id_4F96 ) )
    {
        var_0 = getent( "engage_suburban", "targetname" );
        level._id_4F96 thread _id_5DDE( var_0 );
        wait 1;
        maps\_utility::_id_11F4( "rescue_lp1_gunshot" );
        level._id_4F96 vehicle_setspeed( 35, 200, 200 );
    }

    wait 1;
    var_1 = maps\_utility::_id_2641( "heli_engage_suburb_guys", "script_noteworthy" );

    while ( isalive( level._id_4F96 ) )
    {
        if ( level._id_5D06 == 0 )
        {
            var_0 = getent( "strafe_four_now", "targetname" );
            level._id_4F96 thread _id_5DDE( var_0 );
            level._id_4F96 vehicle_setspeed( 35, 200, 200 );
            break;
        }

        wait 0.05;
    }

    level._id_4F96 waittill( "reached_dynamic_path_end" );
    level._id_4F96 vehicle_setspeed( 35, 200, 200 );
    level._id_4F96 waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_three_now", "targetname" );
    level._id_4F96 thread _id_5DDE( var_0 );
    level._id_4F96 waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_five_now", "targetname" );
    level._id_4F96 thread _id_5DDE( var_0 );
}

_id_5D82()
{
    level._id_4F96 endon( "middle_yard_blockers" );
    level._id_4F96 endon( "death" );
    level._id_4F96 waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_two_now", "targetname" );
    level._id_4F96 thread _id_5DDE( var_0 );
    level._id_4F96 waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_four_now", "targetname" );
    level._id_4F96 thread _id_5DDE( var_0 );
    level._id_4F96 waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_three_now", "targetname" );
    level._id_4F96 thread _id_5DDE( var_0 );
    level._id_4F96 waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_five_now", "targetname" );
    level._id_4F96 thread _id_5DDE( var_0 );
}

_id_5D83()
{
    level._id_4F96 endon( "death" );
    common_scripts\utility::waitframe();
    var_0 = getentarray( "escape_hind_middle", "targetname" );
    var_1 = maps\_utility::_id_0B53( var_0 );
    var_2 = randomintrange( 0, 2 );

    switch ( var_2 )
    {
        case 0:
            level._id_4F96 thread _id_5DDE( var_1[0] );
        case 1:
            level._id_4F96 thread _id_5DDE( var_1[1] );
        case 2:
            level._id_4F96 thread _id_5DDE( var_1[2] );
    }
}

_id_5D84()
{
    self setbottomarc( 180 );
    self setrightarc( 20 );
    self setleftarc( 20 );
    self setconvergencetime( 1.5, "yaw" );
    self setconvergencetime( 0.7, "pitch" );
}

_id_5D85()
{
    wait 3;
    wait 1;
}

_id_5D86()
{
    common_scripts\utility::run_thread_on_noteworthy( "fire_missile", vehicle_scripts\_attack_heli::_id_28E5 );
}

_id_5D87()
{
    var_0 = common_scripts\utility::get_target_ent( "kill_spawner_courtyard" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "delta_yard_left", "script_noteworthy" );
    var_2 = getentarray( "delta_yard_right", "script_noteworthy" );
    maps\_spawner::_id_2135( var_1 );
    maps\_spawner::_id_2135( var_2 );
}

_id_5D88()
{
    var_0 = spawn( "script_origin", self.origin );
    self waittill( "damage" );
    radiusdamage( self.origin, 500, 50000, 50000 );
    thread _id_5D89( var_0 );
}

_id_5D89( var_0 )
{
    earthquake( 0.7, 1, level.player.origin, 300 );
    playfx( level._effect["bomb_explosion_ac130_small"], var_0.origin, ( 0.0, 0.0, 1.0 ) );
    wait 2.3;
    playfx( level._effect["bomb_explosion_ac130_small"], var_0.origin + ( 0.0, 1000.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    wait 2.3;
    playfx( level._effect["bomb_explosion_ac130"], var_0.origin + ( 0.0, -1000.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
    wait 1;
    var_0 delete();
}

_id_5754()
{
    var_0 = getentarray( "yard_blow_big_objective", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_5D88();
}

_id_5D8A()
{
    for (;;)
    {
        if ( level._id_5D06 == 1 )
        {
            maps\_utility::_id_11F4( "rescue_pri_diamondmine" );
            break;
        }

        wait 0.05;
    }
}

_id_5D8B()
{
    maps\_utility::_id_13A4( "r" );
    self setthreatbiasgroup( "allies_center" );
}

_id_5D8C()
{
    maps\_utility::_id_13A4( "o" );
    self setthreatbiasgroup( "allies_center" );
}

_id_5D8D()
{
    level endon( "stop_snow" );

    for (;;)
    {
        playfx( level._id_5D8F, level.player.origin + level._id_5D8E );
        wait(level._id_5D90);
    }
}

_id_5D91()
{
    self endon( "death" );
    var_0 = getvehiclenode( "uav_end", "script_noteworthy" );
    var_1 = getvehiclenode( "uav_begin", "script_noteworthy" );

    for (;;)
    {
        self waittill( "reached_end_node " );
        maps\_vehicle::_id_2B1B( var_0, var_1 );
    }
}

_id_5D92()
{

}

_id_5D93()
{
    level._id_5D94 = maps\_vehicle::_id_2881( "heli_one" );
    level._id_5D94 thread _id_5D96();
    level._id_5D94._id_0AB5 = "Hudson One";
    wait 2;
    level._id_5D95 = maps\_vehicle::_id_2881( "heli_one" );
    level._id_5D95 thread _id_5DAF();
    level._id_5D95._id_0AB5 = "Hudson Two";
    wait 1;
    maps\_utility::delaythread( 0, maps\_vehicle::_id_2881, "hind_one" );
    common_scripts\utility::waitframe();
    var_0 = maps\_utility::_id_2642( "hind_one", "targetname" );
    var_0 thread _id_5DAF();
    var_0 thread _id_5D99();
    maps\_vehicle::_id_2881( "suburban_road_one_path_one" );
    maps\_utility::delaythread( 5, maps\_vehicle::_id_2881, "suburban_road_one_path_three" );
    maps\_utility::delaythread( 7, maps\_vehicle::_id_2881, "suburban_road_one_path_three" );
    wait 1.7;
    maps\_vehicle::_id_2881( "suburban_road_one_path_two" );
    thread _id_5D98();
    maps\_utility::delaythread( 1.5, maps\_vehicle::_id_2881, "suburban_road_one_path_two" );
    wait 3;
    var_1 = maps\_vehicle::_id_2881( "suburban_two" );
    var_1.health = 10000;
    var_1 waittill( "reached_end_node" );
    wait 4;
    var_1.health = 390;
    var_0 waittill( "reached_end_node" );
    var_0 delete();
}

_id_5D96()
{
    self waittill( "reached_dynamic_path_end" );
    var_0 = getent( "strafe_one_tier_one_left_side", "targetname" );
    thread _id_5DDE( var_0 );
    self waittill( "reached_dynamic_path_end" );
    var_1 = getentarray( "left_side_amb_strafs", "targetname" );
    thread _id_5D7D( var_1 );
}

_id_5D97()
{
    self waittill( "reached_end_node" );
    self delete();
}

_id_5D98()
{
    wait 5;
    maps\_vehicle::_id_2881( "suburban_road_one_path_three" );
    wait 3;
    maps\_vehicle::_id_2881( "suburban_road_one_path_three" );
    wait 6;
    var_0 = maps\_vehicle::_id_2881( "suburban_road_one_path_three" );
    var_0 waittill( "reached_end_node" );

    while ( !common_scripts\utility::flag( "hard_targets_dead" ) )
    {
        maps\_vehicle::_id_2881( "suburban_road_one_path_three" );
        wait(randomfloatrange( 6, 9 ));
        maps\_vehicle::_id_2881( "suburban_road_one_path_three" );
        wait(randomfloatrange( 9, 13 ));
        var_0 = maps\_vehicle::_id_2881( "suburban_road_one_path_three" );
        var_0 waittill( "reached_end_node" );
        wait(randomfloatrange( 6, 11 ));
    }
}

_id_5D99()
{
    self endon( "death" );
    thread _id_5724();
    wait 3;
    self notify( "stop_fire_rockets" );
    wait 3;
    thread _id_5724();
    wait 2;
    self notify( "stop_fire_rockets" );
    wait 4;
    thread _id_5724();
    wait 2;
    self notify( "stop_fire_rockets" );
    wait 4;
    thread _id_5724();
    wait 2;
    self notify( "stop_fire_rockets" );
}

_id_5D9A()
{
    self endon( "death" );
    thread _id_5724();
    wait 0.4;
    self notify( "stop_fire_rockets" );
    wait 1;
    thread _id_5724();
    wait 0.4;
    self notify( "stop_fire_rockets" );
    wait 1;
    thread _id_5724();
    wait 0.4;
    self notify( "stop_fire_rockets" );
    wait 1;
    thread _id_5724();
    wait 0.5;
    self notify( "stop_fire_rockets" );
}

_id_5D9B()
{
    common_scripts\utility::flag_wait( "middle_yard_blockers" );
    var_0 = maps\_vehicle::_id_2881( "suburban_four" );
    var_0.health = 390;
    wait 2.3;
    var_1 = maps\_vehicle::_id_2881( "suburban_five" );
    var_1.health = 390;
}

_id_5D9C()
{
    var_0 = common_scripts\utility::get_target_ent( "kill_spawner_courtyard" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_1425( "middle_of_yard" );
    maps\_spawner::_id_213C( 1 );
}

_id_5D9D( var_0 )
{
    common_scripts\utility::flag_wait( "open_bay_double_doors" );
    var_1 = common_scripts\utility::get_target_ent( "color_node_o7" );

    for (;;)
    {
        if ( level._id_5D9E == 3 || common_scripts\utility::flag( "hard_targets_dead" ) )
        {
            maps\_spawner::_id_213C( 8 );
            wait 2;
            maps\_utility::_id_0BC3( level._id_3BD4, level.player );
            wait 2;
            common_scripts\utility::flag_set( "yard_retreat_one_new" );
            thread _id_5D78( var_1 );
            wait 19;
            thread _id_46AD();
            maps\_utility::_id_11F4( "rescue_hqr_fullagms" );
            wait 1;
            break;
        }

        wait 0.05;
    }
}

_id_5D9F()
{
    self waittill( "damage", var_0, var_1 );

    if ( var_1 == level.player )
        level._id_5D9E++;
}

_id_5DA0()
{
    self endon( "hard_targets_dead" );
    wait 2;

    while ( !common_scripts\utility::flag( "hard_targets_dead" ) )
        wait 6;
}

_id_5DA1()
{
    common_scripts\utility::flag_wait( "hard_targets_dead" );
    var_0 = getentarray( "yard_one_read_flood", "targetname" );
    maps\_spawner::_id_2135( var_0 );
}

_id_5DA2()
{
    self allowedstances( "stand" );
    wait 3;
    self.goalradius = 2048;
    self.goalheight = 20;
}

_id_5DA3()
{
    common_scripts\utility::flag_wait( "activate_second_yard_flood" );
    var_0 = maps\_utility::_id_2641( "heli_engage_suburb_guys", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            var_2 kill();
    }

    maps\_utility::_id_1425( "activate_second_yard_flood" );
    var_4 = getentarray( "yard_second_flood", "targetname" );
    maps\_spawner::_id_2135( var_4 );
}

_id_5DA4()
{
    self.accuracy = 0.6;
}

_id_5DA5()
{
    self endon( "death" );
    wait 10;
    self.ignoreall = 0;
}

_id_5DA6()
{
    var_0 = getent( "hillside_subs", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = maps\_vehicle::_id_2881( "suburban_hillside_one" );
    common_scripts\utility::flag_wait( "spawn_middle_yard" );
    var_2 = getentarray( "fake_ai_cieling", "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_4 connectpaths();
        common_scripts\utility::waitframe();
        var_4 delete();
    }

    level._id_5DA7 = maps\_vehicle::_id_2881( "hind_two" );
    level._id_5DA7 notify( "stop_kicking_up_dust" );
    thread _id_5DB0();
    wait 4;
    maps\_utility::_id_272C( "yard_snipers" );
    thread _id_5D83();
    wait 3.0;
    wait 2.5;
    wait 1;
    level._id_5DA7 thread _id_5724();
    wait 2.7;
    level._id_5DA7 notify( "stop_fire_rockets" );
    wait 5;
    common_scripts\utility::flag_wait( "middle_yard_color_red" );
    var_6 = getent( "last_hind_path", "targetname" );
    common_scripts\utility::waitframe();

    if ( !common_scripts\utility::flag( "courtyard_cleared" ) )
    {
        var_7 = getent( "hind_off_spawner", "targetname" );
        level._id_5DA8 = var_7 _id_5DDC( var_6 );
        level._id_5DA8 notify( "stop_kicking_up_dust" );
        level._id_5DA8 waittill( "reached_dynamic_path_end" );

        if ( isalive( level._id_5DA8 ) )
        {
            level._id_5DA8 thread _id_0612::_id_3C49();
            level._id_5DA8.script_team = "axis";
            level._id_5DA8 thread _id_5DDA();
            level._id_5DA8 thread _id_5DDB();
            level._id_5DA8.target_ent = level.player;
        }
    }

    if ( isalive( level._id_4F96 ) )
    {
        level._id_4F96 maps\_vehicle::_id_2A13();
        wait 2;

        if ( isalive( level._id_4F96 ) )
        {
            level._id_4F96._id_29CC = 1;
            level._id_4F96 dodamage( level._id_4F96.health + 10000, level._id_4F96.origin );
            level._id_4F96 thread _id_5DAB();
        }
    }
}

_id_5DA9()
{
    var_0 = common_scripts\utility::get_target_ent( "spawn_snowmobile_middle" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_1425( "spawn_snowmobile_middle" );
    thread _id_0186();
    wait 6;
    wait 3;
    common_scripts\utility::waitframe();

    for (;;)
    {
        var_1 = maps\_utility::_id_2641( "yard_focused_combat_squad", "script_noteworthy" );

        if ( var_1.size <= 1 )
        {
            common_scripts\utility::flag_set( "activate_second_yard_flood" );
            level._id_138C maps\_utility::_id_2703();
            break;
        }

        wait 0.05;
    }
}

_id_0186()
{
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_watchfire" );
    maps\_utility::_id_11F4( "rescue_lp1_nextarea" );
}

_id_5DAA()
{
    var_0 = common_scripts\utility::get_target_ent( "spawn_snowmobile_middle" );
    var_0 waittill( "trigger" );
    var_1 = maps\_vehicle::_id_2881( "littlebird_strafe_hillside" );
    var_1 notify( "stop_kicking_up_dust" );
    var_1 thread _id_5DAF();
    var_1.script_team = "allies";
    maps\_spawner::_id_213C( 1000 );
    level._id_45C0 maps\_utility::_id_13A4( "o" );
    level._id_4877 maps\_utility::_id_13A4( "o" );
    thread _id_0187();
    common_scripts\utility::waitframe();
    var_2 = getaiarray( "allies" );

    foreach ( var_4 in var_2 )
    {
        if ( isalive( var_4 ) )
            var_4 maps\_utility::_id_13A4( "o" );
    }

    var_6 = maps\_vehicle::_id_2881( "yard_snowmobile_one" );
    common_scripts\utility::waitframe();
    var_6 phys_disablecrashing();
    var_6.health = 100;
    var_6 vehicle_setspeed( 30, 100, 100 );
    var_6.veh_pathtype = "constrained";
    wait 2;
    var_7 = maps\_vehicle::_id_2881( "yard_snowmobile_three" );
    common_scripts\utility::waitframe();
    var_7 phys_disablecrashing();
    var_7.health = 100;
    var_7 vehicle_setspeed( 30, 100, 100 );
    var_7.veh_pathtype = "constrained";
    wait 5;
    var_6 kill();
    common_scripts\utility::waitframe();
    var_6 delete();
    wait 3;
    var_7 kill();
    common_scripts\utility::waitframe();
    var_7 delete();
}

_id_0187()
{
    var_0 = maps\_utility::_id_2641( "delta_yard_left", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            magicbullet( "g36c_reflex", var_2.origin + ( 0.0, 400.0, 600.0 ), var_2.origin );
            var_2 kill();
        }
    }

    var_4 = maps\_utility::_id_2641( "delta_yard_right", "script_noteworthy" );

    foreach ( var_2 in var_4 )
    {
        if ( isalive( var_2 ) )
        {
            magicbullet( "g36c_reflex", var_2.origin + ( 0.0, 400.0, 600.0 ), var_2.origin );
            var_2 kill();
        }
    }

    var_7 = maps\_utility::_id_2641( "viper_support_crew", "script_noteworthy" );

    foreach ( var_2 in var_4 )
    {
        if ( isalive( var_2 ) )
        {
            magicbullet( "g36c_reflex", var_2.origin + ( 0.0, 400.0, 600.0 ), var_2.origin );
            var_2 kill();
        }
    }
}

_id_5DAB()
{
    var_0 = getentarray( "escape_hind_middle", "script_noteworthy" );
    var_1 = maps\_utility::_id_0B53( var_0 );
    var_2 = randomintrange( 0, 2 );

    switch ( var_2 )
    {
        case 0:
            level._id_4F96._id_29DC = var_1[0];
        case 1:
            level._id_4F96._id_29DC = var_1[1];
        case 2:
            level._id_4F96._id_29DC = var_1[2];
    }
}

_id_5DAC()
{
    self.favoriteenemy = level.player;
    self setlookatentity( level.player );
    createthreatbiasgroup( "player" );
    level.player setthreatbiasgroup( "player" );
    createthreatbiasgroup( "snipers" );
    self setthreatbiasgroup( "snipers" );
    setthreatbias( "snipers", "player", 50000 );
    self laserforceon();
    setsaveddvar( "laserrange", 4000 );
    setsaveddvar( "laserradius", 2 );
    self allowedstances( "stand" );
    thread _id_5DAD();
    level._id_5D06 = 2;

    for (;;)
    {
        if ( level._id_5D06 == 0 )
        {
            level._id_138C maps\_utility::_id_2703();
            break;
        }

        wait 0.05;
    }
}

_id_5DAD()
{
    self waittill( "death" );
    level._id_5D06--;
}

_id_5DAE()
{
    common_scripts\utility::flag_wait( "yard_activate_orange_nodes" );
    var_0 = getent( "drop_off_heli_path_one", "targetname" );
    common_scripts\utility::waitframe();
    var_1 = getent( "m1_one", "targetname" );
    var_2 = var_1 _id_5DDC( var_0 );
    var_2 notify( "stop_kicking_up_dust" );
    wait 5;
    var_0 = getent( "drop_off_heli_path_two", "targetname" );
    common_scripts\utility::waitframe();
    var_1 = getent( "m1_one", "targetname" );
    var_3 = var_1 _id_5DDC( var_0 );
    var_3 notify( "stop_kicking_up_dust" );
    var_2 waittill( "reached_dynamic_path_end" );
    var_2 delete();
    var_3 waittill( "reached_dynamic_path_end" );
    var_3 delete();
}

_id_5DAF()
{
    self waittill( "reached_dynamic_path_end" );
    self delete();
}

_id_5DB0()
{

}

_id_5DB1()
{
    level._id_5DB2 = getent( "delete_me_trigger", "targetname" );
    thread _id_5DB3();
    thread _id_5DC2();
}

_id_5DB3()
{
    common_scripts\utility::flag_wait( "spawn_in_last_subs" );
    var_0 = maps\_utility::_id_2641( "constr_guys", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 kill();

    maps\_utility::_id_1425( "activate_second_yard_flood" );
    thread _id_5DB7();
    level._id_5DB4 = maps\_vehicle::_id_2881( "suburban_end_one" );
    wait 2;
    level._id_5DB5 = maps\_vehicle::_id_2881( "suburban_end_two" );
}

_id_5DB6()
{

}

_id_5DB7()
{
    self endon( "courtyard_cleared" );
    level._id_3BDD = 1;
    level.player maps\_remotemissile::_id_3BE9();

    if ( isdefined( level._id_3C2C ) )
    {
        level._id_3C2C.health = 10;
        level._id_3C2C delete();
    }

    level notify( "uav_destroyed" );
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_tookoutuav" );
    wait 2;
    wait 2;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_anotherway" );
    wait 2;
    level._id_4877 maps\_utility::_id_168C( "rescue_pri_heavyfire" );
    wait 2;
    maps\_utility::_id_11F4( "rescue_hqr_payloadtarget" );
    wait 3;
    level._id_45C0 maps\_utility::_id_168C( "rescue_snd_sittight" );
    maps\_utility::_id_1427( 5 );
    var_0 = getentarray( "yard_com_support", "targetname" );
    maps\_spawner::_id_2135( var_0 );
    wait 5;
    level thread _id_5DB9();
    wait 3;
    thread _id_5DB8();
    wait 3;

    if ( isalive( level._id_4F96 ) )
        level._id_4F96 dodamage( level._id_4F96.health + 10000, level._id_4F96.origin );

    common_scripts\utility::flag_set( "blow_up_the_door" );
    level._id_5D6A = getent( "yard_blow_power_tower", "targetname" );
    level thread _id_5DBC();
}

_id_5DB8()
{
    var_0 = 0;

    while ( var_0 <= 7 )
    {
        var_0++;
        earthquake( 0.6, 0.2, level.player.origin, 300 );
        wait(randomfloatrange( 0.4, 0.7 ));
    }
}

_id_5DB9()
{
    wait 0.2;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 2448.0, -8316.0, -3592.0 ), ( 8854.0, -1186.0, -8452.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
    wait 0.2;
    wait 0.2;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 6908.0, -8988.0, -3592.0 ), ( 8906.0, -1264.0, -8722.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
    wait 0.3;
    wait 0.3;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 1400.0, -7952.0, -8596.0 ), ( 8624.0, -1116.0, -8722.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
    wait 0.3;
    wait 0.3;
    wait 0.2;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 2448.0, -8316.0, -1592.0 ), ( 8854.0, -1186.0, -8452.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
    wait 3;
    wait 0.2;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 6908.0, -8988.0, -3592.0 ), ( 8906.0, -1264.0, -8722.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
    wait 0.3;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 8196.0, -8752.0, -1592.0 ), ( 8250.0, -1180.0, -8722.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
    wait 0.3;
    var_0 = magicbullet( "remote_missile_not_player_snow_cluster", ( 8196.0, -8752.0, -1592.0 ), ( 8250.0, -1180.0, -8722.0 ) );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_rescue_incoming_shell" );
    var_0 thread _id_5DBA();
}

_id_5DBA()
{
    wait 4;

    if ( isdefined( self ) )
        self delete();
}

_id_5DBB()
{
    self waittill( "death" );
    self delete();
}

_id_5DBC()
{
    if ( isalive( level._id_5DA8 ) )
        level._id_5DA8 kill();

    thread _id_5DC1();
    common_scripts\utility::flag_set( "courtyard_cleared" );
    musicstop( 8 );
    thread _id_5DBE();
    wait 10;
    maps\_spawner::_id_213C( 30 );
    maps\_spawner::_id_213C( 5 );
    var_0 = maps\_utility::_id_2641( "kill_on_art_strike", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 kill();

    var_0 = maps\_utility::_id_2641( "yard_com_support", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 kill();
}

_id_5DBD()
{
    self.accuracy = 0.7;
}

_id_5DBE()
{
    var_0 = getent( "power_tower_1", "targetname" );
    var_1 = getent( "power_tower_2", "targetname" );
    var_2 = getent( "power_tower_3", "targetname" );
    var_3 = getent( "power_tower_4", "targetname" );
    var_4 = getent( "power_tower_5", "targetname" );
    var_5 = getent( "power_tower_6", "targetname" );
    var_6 = getent( "woosh_cloud", "targetname" );
    wait 0.6;
    var_7 = getaiarray( "axis" );
    earthquake( 0.8, 1.3, level.player.origin, 300 );
    common_scripts\utility::exploder( "cave_door" );

    if ( distance2d( level.player.origin, level._id_02BD.origin ) < 650 )
    {
        level.player kill();
        return;
    }

    level._id_4877 maps\_utility::_id_168C( "rescue_pri_morelikeit" );
    level._id_02BD connectpaths();
    common_scripts\utility::waitframe();
    level._id_02BD delete();
    earthquake( 0.9, 0.5, level.player.origin, 300 );
    playfx( level._effect["bomb_explosion_ac130"], var_4.origin, ( 0.0, 0.0, 1.0 ) );
    common_scripts\utility::flag_set( "cavern_door_open" );
    wait 3.5;
    earthquake( 0.9, 0.5, level.player.origin, 300 );
    playfx( level._effect["bomb_explosion_ac130"], var_5.origin, ( 0.0, 0.0, 1.0 ) );
}

_id_5DBF()
{
    self endon( "death" );

    if ( !isalive( self ) )
        return;

    for ( var_0 = 0; var_0 < 4; var_0++ )
    {
        var_1 = randomintrange( 0, 5 );

        switch ( var_1 )
        {
            case 0:
                maps\_anim::_id_11C1( self, "hijack_generic_stumble_stand2" );
            case 1:
                maps\_anim::_id_11C1( self, "hijack_generic_stumble_stand1" );
            case 3:
                maps\_anim::_id_11C1( self, "hijack_generic_stumble_crouch1" );
            case 4:
                maps\_anim::_id_11C1( self, "hijack_generic_stumble_crouch2" );
        }
    }
}

_id_5DC0()
{
    self waittill( "death" );
    level._id_5D06--;
}

_id_5DC1()
{
    if ( isdefined( level._id_5DB2 ) )
        level._id_5DB2 delete();

    wait 2;
    var_0 = 0;
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
        var_3.health = 1;

    common_scripts\utility::waitframe();
    wait 0.5;
    wait 4;
    var_5 = getaiarray( "axis" );

    foreach ( var_3 in var_5 )
        self.accuracy = 0.0001;
}

_id_5DC2()
{
    level endon( "cavern_door_open" );
    common_scripts\utility::flag_wait( "middle_yard_color_red" );
    var_0 = getaiarray( "allies" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_13A4( "r" );
}

_id_523F( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        switch ( var_3.script_noteworthy )
        {
            case "player":
                level.player setorigin( var_3.origin );
                level.player setplayerangles( var_3.angles );

                if ( isdefined( level._id_5D10 ) )
                    level.player setorigin( var_3.origin + ( 0.0, 0.0, 5.0 ) );

                continue;
            case "sandman":
                var_3 = common_scripts\utility::getstruct( "elevator_anim_sandman", "targetname" );
                level._id_45C0 forceteleport( var_3.origin, var_3.angles );
                level._id_45C0 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_45C0 linkto( level._id_5D10 );

                continue;
            case "truck":
                level._id_45C4 forceteleport( var_3.origin, var_3.angles );
                level._id_45C4 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_45C4 linkto( level._id_5D10 );

                continue;
            case "price":
                var_3 = common_scripts\utility::getstruct( "elevator_anim_price", "targetname" );
                level._id_4877 forceteleport( var_3.origin, var_3.angles );
                level._id_4877 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_4877 linkto( level._id_5D10 );

                continue;
            case "grinch":
                level._id_4D86 forceteleport( var_3.origin, var_3.angles );
                level._id_4D86 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_4D86 linkto( level._id_5D10 );

                continue;
            case "delta_two":
                if ( isdefined( level._id_5D0B ) )
                    level._id_5D0B forceteleport( var_3.origin, var_3.angles );

                level._id_5D0B setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_5D0B linkto( level._id_5D10 );

                continue;
        }
    }
}

_id_5DC3( var_0 )
{
    var_1 = common_scripts\utility::getstructarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        switch ( var_3.script_noteworthy )
        {
            case "player":
                level.player setorigin( var_3.origin + ( 0.0, 0.0, 20.0 ) );
                level.player setplayerangles( var_3.angles );
                continue;
            case "sandman":
                level._id_45C0 forceteleport( var_3.origin, var_3.angles );
                level._id_45C0 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_45C0 linkto( level._id_5D10 );

                continue;
            case "truck":
                level._id_45C4 forceteleport( var_3.origin, var_3.angles );
                level._id_45C4 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_45C4 linkto( level._id_5D10 );

                continue;
            case "price":
                level._id_4877 forceteleport( var_3.origin, var_3.angles );
                level._id_4877 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_4877 linkto( level._id_5D10 );

                continue;
            case "grinch":
                level._id_4D86 forceteleport( var_3.origin, var_3.angles );
                level._id_4D86 setgoalpos( var_3.origin );

                if ( isdefined( level._id_5D10 ) )
                    level._id_4D86 linkto( level._id_5D10 );

                continue;
        }
    }
}

_id_5DC4( var_0, var_1, var_2, var_3 )
{
    while ( !common_scripts\utility::flag( var_1 ) )
    {
        if ( level._id_5DC5 < var_0 )
        {
            if ( isdefined( var_3 ) )
                var_3 maps\_utility::_id_2703();

            common_scripts\utility::flag_set( var_1 );

            if ( isdefined( var_2 ) )
                var_2 maps\_utility::_id_2703();

            break;
        }

        wait 0.05;
    }

    if ( isdefined( var_3 ) )
        var_3 maps\_utility::_id_2703();

    if ( isdefined( var_2 ) )
        var_2 maps\_utility::_id_2703();
}

_id_5DC6()
{
    level endon( "cave_exit" );
    var_0 = common_scripts\utility::get_target_ent( "cave_shake_volume" );
    level._id_5DC7 = "scn_prague_tank_alley_exp";
    level._id_5DC8 = common_scripts\utility::get_target_ent( "cave_shake_source" );
    level._id_5DC9 = 9;

    for (;;)
    {
        wait(randomfloatrange( 1, 3 ));

        if ( !level.player istouching( var_0 ) )
            continue;

        var_1 = randomfloatrange( 0.3, 0.6 );
        _id_5DCA( var_1, "dust_source", "cave_one_light" );
        wait(randomfloatrange( 1, 3 ));
    }
}

_id_5DCA( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = getentarray( var_2, "targetname" );
    var_5 = common_scripts\utility::getstructarray( var_1, "targetname" );
    var_6 = anglestoforward( level.player.angles ) * 128;
    var_5 = sortbydistance( var_5, level.player.origin + var_6 );
    var_7 = 0;
    thread common_scripts\utility::play_sound_in_space( level._id_5DC7, level._id_5DC8.origin );
    earthquake( var_0, var_0, level.player.origin, 196 );

    foreach ( var_9 in var_5 )
    {
        if ( var_9.origin[2] > level.player.origin[2] || var_3 )
        {
            if ( common_scripts\utility::cointoss() )
            {
                if ( !isdefined( var_9.script_fxid ) )
                    var_9.script_fxid = "ceiling_dust_default";

                var_10 = randomfloatrange( 0, 1.5 );

                if ( isdefined( var_9.angles ) )
                    var_11 = anglestoforward( var_9.angles );
                else
                    var_11 = undefined;

                maps\_utility::delaythread( var_10, ::_id_53B2, common_scripts\utility::getfx( var_9.script_fxid ), var_9.origin, var_11 );

                if ( isdefined( var_9.script_soundalias ) )
                    maps\_utility::delaythread( var_10, common_scripts\utility::play_sound_in_space, var_9.script_soundalias, var_9.origin );

                var_7 += 1;
            }
        }

        if ( var_7 > level._id_5DC9 )
            break;
    }

    foreach ( var_14 in var_4 )
        var_14 thread _id_5DCB();
}

_id_5DCB()
{
    var_0 = self getlightintensity();
    thread _id_524A::_id_5202( self, 0.2, 0.8 );
    wait(randomfloatrange( 0.5, 1 ));
    self notify( "stop_flicker" );
    self setlightintensity( var_0 );
    _id_524A::_id_5206();
}

_id_53B2( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        playfx( var_0, var_1 );
    else
        playfx( var_0, var_1, var_2 );
}

_id_5DCC()
{
    var_0 = 0;

    for (;;)
    {
        level waittill( "remote_missile_exploded" );
        wait 0.1;

        if ( isdefined( level._id_3BF5["ai"] ) )
            var_0 = level._id_3BF5["ai"];

        var_1 = undefined;
        var_2 = 0;
        var_3 = 0;
        var_2 = 0;
        var_4 = 0;
        var_5 = 0;
        var_6 = 0;

        foreach ( var_8, var_0 in level._id_3BF5 )
        {
            if ( var_8 == "ai" )
                continue;

            if ( var_0 > 0 )
            {
                var_3 += var_0;

                if ( var_8 == "btr" )
                {
                    var_2 = var_0;
                    continue;
                }

                if ( var_8 == "helo" )
                {
                    var_4 = var_0;
                    continue;
                }

                if ( var_8 == "jeep" )
                {
                    var_5 = var_0;
                    continue;
                }

                if ( var_8 == "truck" )
                    var_6 = var_0;
            }
        }

        if ( var_0 == 0 && var_3 == 0 )
        {

        }

        var_0 = 0;
    }
}

_id_46AD()
{
    common_scripts\utility::flag_set( "player_has_predator_drones" );
    level.player maps\_remotemissile::_id_3BEB( "remote_missile_detonator" );
    var_0 = getent( "predator_drone_control", "targetname" );
    var_0 hide();
    var_0 makeunusable();
}

_id_02BE()
{
    level endon( "courtyard_cleared" );

    for (;;)
    {
        level waittill( "player_is_controlling_UAV" );
        common_scripts\utility::flag_set( "uav_in_use" );
        thread _id_46B1();
        level waittill( "draw_target_end" );
        common_scripts\utility::flag_clear( "uav_in_use" );
    }
}

_id_46B1()
{
    level endon( "player_fired_remote_missile" );
    level endon( "predator_hind_dead" );
    level endon( "draw_target_end" );
    wait 3;
    maps\_utility::_id_1F61( "hint_predator_shoot" );
}

_id_4812()
{
    if ( level.player attackbuttonpressed() )
        return 1;

    if ( !common_scripts\utility::flag( "uav_in_use" ) )
        return 1;

    return 0;
}

_id_5DCD()
{
    common_scripts\utility::flag_set( "player_has_predator_drones" );
    var_0 = getent( "predator_drone_control", "targetname" );
    var_0 hide();
    var_0 makeunusable();
}

_id_5DCE()
{
    for (;;)
    {
        level._id_3C14 = getent( "target_for_uav", "targetname" );
        wait 1;
    }
}

_id_46B3()
{
    level._id_3C2C endon( "death" );

    for (;;)
    {
        if ( isdefined( level._id_3C14 ) )
            var_0 = level._id_3C14.origin;
        else if ( isdefined( level._id_3C25 ) )
            var_0 = level._id_3C25;
        else
            var_0 = ( 6073.0, -1210.5, -8246.0 );

        var_1 = vectortoangles( var_0 - level._id_3C2C.origin );
        level.uavrig moveto( level._id_3C2C.origin, 0.1, 0, 0 );
        level.uavrig rotateto( var_1, 0.1, 0, 0 );
        wait 0.05;
    }
}

_id_45BD()
{
    if ( isdefined( self.script_noteworthy ) )
    {
        if ( self.script_noteworthy == "paradrop_guy_left" )
            return;

        if ( self.script_noteworthy == "paradrop_guy_right" )
            return;
    }

    if ( isdefined( self._id_0EF1 ) )
    {
        self endon( "death" );
        self waittill( "jumpedout" );
    }

    if ( !isdefined( self.unique_id ) )
        return;

    _id_0612::_id_3C49();
}

_id_53BD()
{
    var_0 = spawn( "script_origin", level.player.origin + ( 0.0, 0.0, 10.0 ) );
    var_0 linkto( level.player );
    level._id_5323 = "structs";
    level._id_53BE = 20;
    level._id_53BF = 30;

    for (;;)
    {
        switch ( level._id_5323 )
        {
            case "off":
                break;
            case "player":
                var_0 thread maps\_utility::play_sound_on_entity( "prague_loud_speaker" );
                break;
            case "vehicle":
                var_1 = level._id_0B5A["axis"];

                if ( var_1.size > 0 )
                {
                    var_1 = sortbydistance( var_1, level.player.origin );
                    var_1[0] thread maps\_utility::play_sound_on_entity( "prague_loud_speaker" );
                    break;
                }
            default:
                var_2 = common_scripts\utility::getstructarray( "speaker_location", "targetname" );
                var_2 = sortbydistance( var_2, level.player.origin );
                thread common_scripts\utility::play_sound_in_space( "prague_loud_speaker", var_2[0].origin );
        }

        level common_scripts\utility::waittill_notify_or_timeout( "play_loud_speaker", randomfloatrange( level._id_53BE, level._id_53BF ) );
    }
}

_id_5DCF()
{
    var_0 = getdvar( "vision_set_current" );
    maps\_utility::set_vision_set( var_0, 0 );
    var_1 = getvehiclenode( "uav_begin", "script_noteworthy" );
    level._id_3C2C = maps\_vehicle::_id_2A99( "uav" );
    thread _id_46B2();
    common_scripts\utility::flag_wait( "start_yard_one" );
    level._id_3C2C startpath( var_1 );
    level._id_3C2C thread _id_5D91();
    level._id_3C2C.health = 50000;
    level._id_3C2C playloopsound( "uav_engine_loop" );
    level.uavrig = spawn( "script_model", level._id_3C2C.origin );
    level.uavrig setmodel( "tag_origin" );
    thread _id_5DCE();
    thread _id_46B3();
}

_id_46AC()
{
    var_0 = getdvar( "vision_set_current" );
    maps\_utility::set_vision_set( var_0, 0 );
    level._id_3C2C = maps\_vehicle::_id_2881( "uav" );
    level._id_3C2C playloopsound( "uav_engine_loop" );
    level.uavrig = spawn( "script_model", level._id_3C2C.origin );
    level.uavrig setmodel( "tag_origin" );
    level._id_3BD8._id_3BD9 = 12;
    level._id_3C2C vehicle_setspeed( 3, 15, 5 );
    thread _id_46B3();
    thread _id_46AD();
    thread _id_46B0();
    level._id_3C2C hide();
}

_id_46B0()
{
    for (;;)
    {
        level waittill( "player_is_controlling_UAV" );
        common_scripts\utility::flag_set( "uav_in_use" );
        thread _id_46B1();
        level waittill( "draw_target_end" );
        common_scripts\utility::flag_clear( "uav_in_use" );
    }
}

_id_46B2()
{
    level endon( "courtyard_cleared" );
    var_0 = spawn( "script_origin", level.player.origin );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2 = undefined;
    var_3 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_3 linkto( level.player );
    var_3 setmodel( "body_delta_elite_snow_assault_ab" );
    level.player thread _id_0612::_id_3C49();
    var_3 hide();

    for (;;)
    {
        while ( !common_scripts\utility::flag( "uav_in_use" ) )
        {
            var_1.origin = level.player.origin;
            var_2 = level.player getplayerangles();
            var_4 = level.player getstance();
            var_3.angles = var_2;
            var_3.origin = level.player.origin;
            wait 0.1;
        }

        while ( common_scripts\utility::flag( "uav_in_use" ) )
        {
            var_3.origin = level.player.origin;
            var_3 show();
            common_scripts\utility::flag_waitopen( "uav_in_use" );
            var_3 hide();
        }
    }
}

_id_5DD0()
{
    if ( isdefined( self._id_1032 ) )
        self._id_57E3 = self._id_1032;

    self._id_1032 = "generic";

    if ( !isdefined( level._id_5DD1 ) )
    {
        level._id_5DD1 = [];
        level._id_5DD1[level._id_5DD1.size] = "stunned1";
        level._id_5DD1[level._id_5DD1.size] = "stunned2";
        level._id_5DD1[level._id_5DD1.size] = "stunned5";
    }

    if ( !isdefined( level._id_5DD2 ) )
        level._id_5DD2 = [];

    var_0 = maps\_utility::_id_0B53( level._id_5DD1 );
    var_1 = common_scripts\utility::random( var_0 );
    maps\_anim::_id_1246( self, var_1 );
    level._id_5DD2 = common_scripts\utility::add_to_array( level._id_5DD2, var_1 );
    level._id_5DD1 = common_scripts\utility::array_remove( level._id_5DD1, var_1 );

    if ( level._id_5DD1.size == 0 )
    {
        level._id_5DD1 = level._id_5DD2;
        level._id_5DD2 = [];
    }

    self._id_1032 = self._id_57E3;
}

spawn_allies()
{
    var_0 = _id_594A( "delta_yard_right" );

    if ( isdefined( var_0 ) )
        var_0 _id_5DD3();
}

_id_5DD3()
{
    maps\_utility::_id_13A4( "r" );
}

_id_5DD4()
{
    maps\_utility::_id_13A4( "o" );
}

_id_594A( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( var_1 ) )
        var_2 = level._id_1F19 + "_" + var_0;
    else
        var_2 = var_1 + "_" + var_0;

    var_3 = _id_594B( var_0, var_2 );
    return var_3;
}

_id_594B( var_0, var_1 )
{
    var_2 = getent( var_0, "script_noteworthy" );
    var_3 = common_scripts\utility::getstruct( var_1, "targetname" );

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
    {
        var_2.origin = var_3.origin;

        if ( isdefined( var_3.angles ) )
            var_2.angles = var_3.angles;

        var_4 = var_2 maps\_utility::_id_166F();
        return var_4;
    }

    return undefined;
}

_id_5DD5( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_4.count = 1;
        var_5 = var_4 maps\_utility::_id_166F( var_1 );

        if ( isdefined( var_5 ) )
            var_2[var_2.size] = var_5;
    }

    return var_2;
}

_id_5DD6( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        var_4.count = 1;
        var_4 maps\_utility::script_delay();
        var_5 = var_4 maps\_utility::_id_166F( var_1 );

        if ( isdefined( var_5 ) )
            var_2[var_2.size] = var_5;
    }

    return var_2;
}

_id_5DD7( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    return _id_5DD5( var_1 );
}

_id_5DD8( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    return _id_5DD6( var_1 );
}

_id_5DD9( var_0, var_1 )
{
    var_2 = _id_5DD7( var_0 );

    foreach ( var_4 in var_2 )
        var_4 setthreatbiasgroup( var_1 );

    return var_2;
}

_id_5724()
{
    self endon( "death" );
    self endon( "stop_follow_path" );
    self endon( "stop_fire_rockets" );
    self setvehweapon( "missile_attackheli" );
    var_0 = 0.2;
    var_1 = 0;

    for (;;)
    {
        if ( var_1 % 2 == 0 )
        {
            var_2 = "tag_missile_left";
            var_3 = anglestoright( ( 0, self.angles[1], 0 ) + ( 0.0, 180.0, 0.0 ) );
        }
        else
        {
            var_2 = "tag_missile_right";
            var_3 = anglestoright( ( 0, self.angles[1], 0 ) );
        }

        var_4 = var_3 * 60;
        self fireweapon( var_2, self.target_ent, var_4 );
        wait(var_0);
        var_1++;
    }
}

_id_572F( var_0, var_1, var_2 )
{
    self endon( "stop_chopper_hover" );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( !isdefined( var_1 ) )
        var_1 = 100;

    for (;;)
    {
        var_3 = randomfloatrange( var_1 * -1, var_1 );
        var_4 = randomfloatrange( var_1 * -1, var_1 );
        var_5 = randomfloatrange( var_1 * -1, var_1 );
        self setvehgoalpos( var_0 + ( var_3, var_4, var_5 ), 1 );
        self vehicle_setspeed( 5 + randomint( 10 ), 3, 3 );
        self waittill( "goal" );
    }
}

_id_5DDA()
{
    self endon( "death" );
    thread _id_572F( self.origin, 100, undefined );
    self setvehgoalpos( self.origin + ( 0.0, 0.0, 1.0 ) );
    self setlookatent( level.player );
    self setvehgoalpos( ( 8924.0, -2640.0, -7840.0 ) );
    self waittill( "reached_dynamic_path_end" );

    while ( isalive( self ) )
    {
        var_0 = randomintrange( 0, 3 );

        switch ( var_0 )
        {
            case 0:
                self setvehgoalpos( ( 8227.0, -3453.0, -7840.0 ) );
                wait 12;
            case 1:
                self setvehgoalpos( ( 9219.0, -1163.0, -7840.0 ) );
                wait 12;
            case 2:
                self setvehgoalpos( ( 8924.0, -2640.0, -7840.0 ) );
                wait 12;
        }

        wait 0.05;
    }
}

_id_5DDB()
{
    self endon( "death" );

    while ( isalive( self ) )
    {
        var_0 = randomintrange( 0, 3 );

        switch ( var_0 )
        {
            case 0:
                thread _id_5724();
                wait 0.1;
                self notify( "stop_fire_rockets" );
                wait(randomfloatrange( 5, 10 ));
            case 1:
                thread _id_5724();
                wait 0.1;
                self notify( "stop_fire_rockets" );
                wait(randomfloatrange( 9, 15 ));
            case 2:
                thread _id_5724();
                wait 0.1;
                self notify( "stop_fire_rockets" );
                wait(randomfloatrange( 7, 11 ));
        }

        wait 0.05;
    }
}

_id_5DDC( var_0 )
{
    self.origin = var_0.origin;

    if ( isdefined( var_0.angles ) )
        self.angles = var_0.angles;

    self.target = var_0.targetname;
    var_1 = thread maps\_vehicle::_id_1F9E();
    return var_1;
}

_id_5DDD( var_0 )
{
    self.origin = var_0.origin;
    self.target = var_0.targetname;
    var_1 = thread maps\_vehicle::_id_1F9E();
    return var_1;
}

_id_5DDE( var_0 )
{
    if ( !maps\_vehicle::_id_21ED() )
        self startpath( var_0 );

    thread maps\_vehicle::_id_26A1( var_0 );
}

_id_5DDF()
{

}

_id_5DE0()
{

}

_id_5DE1()
{
    wait 2;
    var_0 = getentarray( "bay_garage_support", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_4 = getent( "elevator_volume", "targetname" );
    var_4 delete();
    var_5 = getent( "door_l_top", "targetname" );
    var_5 delete();
    var_6 = getent( "door_gate_top", "targetname" );
    var_6 delete();
    var_7 = getent( "door_r_bottom", "targetname" );
    var_7 delete();
    var_8 = getent( "door_l_bottom", "targetname" );
    var_8 delete();
    var_9 = getent( "door_gate_bottom_two", "targetname" );
    var_9 delete();
    var_10 = common_scripts\utility::get_target_ent( "bay_small_door" );
    var_10 delete();
}
