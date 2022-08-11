// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_78AE()
{
    level.player maps\_utility::vision_set_fog_changes( "prague_courtyard2", 1 );
    maps\prague_code::_id_523D();
    maps\prague_code::_id_523F( "start_plaza" );
    common_scripts\utility::flag_set( "start_sewers" );
    common_scripts\utility::flag_set( "player_out_of_water" );
    common_scripts\utility::flag_set( "start_alcove" );
    common_scripts\utility::flag_set( "start_alley" );
    common_scripts\utility::flag_set( "start_long_convoy" );
    common_scripts\utility::flag_set( "start_courtyard" );
    common_scripts\utility::flag_set( "pre_courtyard_ally_clean_up" );
    thread _id_524A::_id_520A( "plaza_smoke" );
    wait 1.0;
}

_id_78AF()
{
    var_0 = common_scripts\utility::get_target_ent( "player_infrontof_apartment_gate" );
    var_0 common_scripts\utility::trigger_off();
    thread _id_55CC();
    thread _id_78B1();
    thread _id_78B3();
    thread _id_78C4();
    thread _id_78BE();
    thread _id_78BA();
    thread _id_78CD();
    thread _id_78CF();
    thread _id_78BF();
    var_1 = common_scripts\utility::getstruct( "rpg_stack_struct", "targetname" );
    thread _id_78D3( var_1 );
    thread _id_78B9();
}

_id_55CC()
{
    common_scripts\utility::flag_wait( "fire_flare" );
    maps\prague_code::_id_5375();
    thread _id_78B2();
    thread _id_78B0::_id_409C( "flare" );
    level waittill( "flare_explodes" );
    var_0 = level.player._id_1AE2._id_1AE3;
    level.player maps\_utility::vision_set_fog_changes( "prague_flare", 1 );
    level waittill( "flare_done" );
    level.player maps\_utility::vision_set_fog_changes( var_0, 2 );
}

_id_78B1()
{
    common_scripts\utility::flag_wait( "fire_flare_two" );
    maps\prague_code::_id_5375();
    thread _id_78B0::_id_409C( "flare_two" );
    level waittill( "flare_explodes" );
    var_0 = level.player._id_1AE2._id_1AE3;
    level.player maps\_utility::vision_set_fog_changes( "prague_flare", 1 );
    level waittill( "flare_done" );
    level.player maps\_utility::vision_set_fog_changes( var_0, 2 );
}

_id_78B2()
{
    wait 2.0;
    thread maps\_utility::_id_1823( "short_scope", 5 );
}

_id_78B3()
{
    level._id_78B4 = spawn( "script_origin", ( 15107.0, -12768.0, -78.5 ) );
    common_scripts\utility::waitframe();
    level._id_78B5 = missile_createrepulsorent( level._id_78B4, 10000, 1048 );
    common_scripts\utility::flag_wait( "plaza_btrs_show_up" );
    var_0 = maps\_vehicle::_id_2881( "plaza_btr_attack_two" );
    level notify( "turn_death_trigger_on_for_btr" );
    var_0.veh_pathtype = "constrained";
    level maps\_utility::delaythread( 7, ::_id_78C2, var_0 );
    wait 1;
    var_0 thread _id_78C9();
    thread maps\_utility::_id_11F4( "prague_pri_gettocover" );
    maps\_utility::delaythread( 3, maps\_utility::_id_11F4, "prague_mct_nowherefast" );
    wait 6;
    var_0 notify( "awake" );
    common_scripts\utility::flag_set( "btr_attack_plaza" );
    common_scripts\utility::flag_wait( "btr_dead_now" );
    objective_onentity( maps\_utility::_id_2816( "fight" ), level._id_45C0, ( 0.0, 0.0, 35.0 ) );
    var_1 = maps\_vehicle::_id_2881( "plaza_tank_attack" );
    var_1 thread _id_78B6();
    var_1 thread _id_78B7();
    var_1.health = 50000;
    var_1 thread maps\_vehicle::_id_2B17();
    var_1 maps\_vehicle::_id_2A3E();
    var_1.veh_pathtype = "constrained";
    var_1 thread _id_78BD();
    var_1 thread _id_524A::_id_5201( "start_apartment_fight" );
    var_2 = getent( "rebel_cover_nodes_six", "targetname" );
    var_2 maps\_utility::_id_2703();
    level._id_45C0 waittill( "goal" );
    common_scripts\utility::flag_set( "spotlight_aim_at_sandman" );
    wait 3;
    var_3 = getnode( "sandman_cover_door_before_under", "targetname" );
    level._id_45C0 setgoalnode( var_3 );
    thread maps\_utility::_id_11F4( "prague_mct_fallback" );
    thread _id_78B8();
    var_4 = common_scripts\utility::getstruct( "sandman_stumble_apt_gate", "targetname" );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "spotlight_aim_at_player" );
    maps\_utility::delaythread( 3, maps\_utility::_id_1427, 3 );
    maps\_spawner::_id_213C( 5000 );
    level._id_45C0._id_20AF = 999;
    level._id_45C0.ignoresuppression = 1;
    level._id_45C0 maps\_utility::_id_1057();
    level._id_45C0 maps\_utility::_id_2714();
    level._id_45C0 maps\_utility::_id_0EEC();
    objective_setpointertextoverride( maps\_utility::_id_2816( "fight" ), "" );
    objective_position( maps\_utility::_id_2816( "fight" ), var_3.origin );
    level._id_45C0 waittill( "goal" );
    var_5 = 300;

    for (;;)
    {
        if ( distance2d( level._id_45C0.origin, level.player.origin ) <= var_5 )
            break;

        wait 0.05;
    }

    var_3 = getnode( "sandman_cover_before_kick", "targetname" );
    level._id_45C0 setgoalnode( var_3 );
    var_5 = 300;

    for (;;)
    {
        if ( distance2d( level._id_45C0.origin, level.player.origin ) <= var_5 )
            break;

        wait 0.05;
    }

    badplace_cylinder( "dont_shoot_from_behind", 300, ( 14256.0, -12582.0, -72.0 ), 800, 200, "axis" );
    level notify( "plaza_player_at_building" );
    objective_onentity( maps\_utility::_id_2816( "fight" ), level._id_45C0, ( 0.0, 0.0, 35.0 ) );
    level._id_45C0.ignoreall = 1;
    level._id_45C0.ignoreme = 1;
    level._id_45C0._id_20AF = 0.5;
    var_3 = common_scripts\utility::get_target_ent( "sandman_kick_apt_gate" );
    thread maps\_utility::_id_11F4( "prague_snd_thisway2" );
    var_3 maps\_anim::_id_124A( level._id_45C0, "door_kick_2_cqbwalk" );
    var_3 thread maps\_anim::_id_11C3( level._id_45C0, "door_kick_2_cqbwalk" );
    var_6 = common_scripts\utility::get_target_ent( "apartment_gate_l" );
    var_7 = common_scripts\utility::get_target_ent( "apartment_gate_r" );
    _id_524A::_id_5213( var_6, var_7, "scn_prague_metal_door_kick", undefined, common_scripts\utility::get_target_ent( "apartment_gate_fxnode" ) );
    var_8 = common_scripts\utility::get_target_ent( "player_infrontof_apartment_gate" );
    var_8 common_scripts\utility::trigger_on();
    level._id_45C0.goalradius = 128;
    level._id_45C0 maps\_utility::_id_109B();
    level._id_45C0 maps\_utility::_id_278F();
    maps\_utility::_id_265A( "allies" );
    level._id_45C0 maps\_utility::_id_0D72( 0 );
    level._id_45C0 maps\_utility::_id_1071();
    level._id_45C0 maps\_utility::_id_2715();
    level._id_45C0 maps\_utility::_id_27B8();
    thread _id_0329();
    maps\prague_code::_id_536D();
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "sandman_apt_enter_path" ) );
    common_scripts\utility::flag_wait( "plaza_move_sandman_up" );
    level._id_45C0 thread _id_524A::_id_51F9( common_scripts\utility::get_target_ent( "sandman_apt_up_stairs" ) );
    level._id_45C0 maps\_utility::_id_109E();
}

_id_0329()
{
    var_0 = maps\_utility::_id_27BA();

    foreach ( var_2 in var_0 )
        var_2 notify( "stop_kicking_up_dust" );
}

_id_78B6()
{
    self endon( "death" );
    wait 60;
    self setturrettargetent( level.player );
    self waittill( "turret_on_target" );

    if ( !common_scripts\utility::flag( "plaza_see" ) )
    {
        self fireweapon();
        level.player kill();
        wait 3;
    }
}

_id_78B7()
{

}

_id_78B8()
{
    level endon( "plaza_player_at_building" );
    level endon( "player_at_gate" );
    wait 5;

    while ( !common_scripts\utility::flag( "player_at_gate" ) )
    {
        var_0 = randomintrange( 0, 4 );

        switch ( var_0 )
        {
            case 0:
                thread maps\_utility::_id_11F4( "prague_mct_goleftgoleft" );
                wait 6.5;
            case 1:
                thread maps\_utility::_id_11F4( "prague_mct_getinbuilding" );
                wait 7;
            case 2:
                thread maps\_utility::_id_11F4( "prague_mct_getoverhere2" );
                wait 7;
            case 3:
                thread maps\_utility::_id_11F4( "prague_pri_yurioffroad" );
                wait 7;
            case 4:
                thread maps\_utility::_id_11F4( "prague_mct_offstreetnow" );
                wait 7;
        }

        wait 0.005;
    }
}

_id_78B9()
{
    common_scripts\utility::flag_wait( "plaza_see" );
    wait 0.3;
    maps\_utility::_id_11F4( "prague_pri_soapstatus" );
    wait 0.3;
    maps\_utility::_id_11F4( "prague_mct_tiptop" );
    wait 0.3;
    maps\_utility::_id_11F4( "prague_mct_findaway" );
    wait 0.3;
    maps\_utility::_id_11F4( "prague_pri_goodluck" );
    wait 1;
    maps\_utility::_id_11F4( "prague_mct_throughhere2" );
}

_id_78BA()
{
    common_scripts\utility::flag_wait( "retreat_three" );
    var_0 = common_scripts\utility::getstructarray( "apt_resistance_drone_scene_under", "targetname" );
    thread _id_78C5( var_0 );
    var_1 = common_scripts\utility::get_target_ent( "player_infrontof_apartment_gate" );
    var_1 waittill( "trigger" );
    common_scripts\utility::flag_set( "player_at_gate" );
    common_scripts\utility::flag_wait( "plaza_see" );
    level notify( "kill_courtyard_smoke" );
    thread _id_78C7();
    var_0 = common_scripts\utility::getstructarray( "apt_resistance_drone_scene_under_one", "targetname" );
    thread _id_78C6( var_0 );
    var_0 = common_scripts\utility::getstructarray( "apt_resistance_drone_scene_under_two", "targetname" );
    thread _id_78C6( var_0 );
    thread _id_78BB();
    common_scripts\utility::flag_wait( "plaza_see_two_two" );
    var_0 = common_scripts\utility::getstructarray( "apt_resistance_drone_scene_under_crawl", "targetname" );
    thread _id_78C6( var_0 );
}

_id_78BB()
{
    wait 0.4;
}

_id_78BC()
{
    self.goalradius = 400;
    self.goalheight = 400;
    self._id_0D11 = 1;
    self.health = 10000;
}

_id_78BD()
{
    var_0 = spawn( "script_origin", ( 15046.0, -11947.0, 12.0 ) );
    var_1 = spawn( "script_origin", ( 14800.0, -11949.0, 292.0 ) );
    var_2 = spawn( "script_origin", ( 15052.5, -11945.5, 311.0 ) );
    var_3 = spawn( "script_origin", ( 14241.4, -12234.6, 38.2986 ) );
    var_4 = spawn( "script_origin", ( 14615.7, -12226.5, 200.996 ) );
    thread _id_78BE();
    wait 5.5;
    self setturrettargetent( var_0 );
    self waittill( "turret_on_target" );
    self fireweapon();
    earthquake( 1, 1, level.player.origin, 400 );
    playfx( level._effect["explosion_type_1"], var_0.origin, ( 0.0, 100.0, 5.0 ) );
    wait 1;
    common_scripts\utility::flag_wait( "tank_attack_building" );
    wait 2;
    self setturrettargetent( var_0 );
    self waittill( "turret_on_target" );
    self fireweapon();
    wait 0.5;
    earthquake( 1, 0.7, level.player.origin, 400 );
    playfx( level._effect["explosion_type_1"], var_0.origin, ( 0.0, 100.0, 5.0 ) );
    wait 3;
    self setturrettargetent( var_1 );
    self waittill( "turret_on_target" );
    self fireweapon();
    playfx( level._effect["explosion_type_1"], var_1.origin, ( 0.0, 100.0, 5.0 ) );
    earthquake( 1, 0.7, level.player.origin, 400 );
    wait 3;
    self setturrettargetent( var_2 );
    self waittill( "turret_on_target" );
    self fireweapon();
    earthquake( 1, 0.7, level.player.origin, 400 );
    playfx( level._effect["explosion_type_1"], var_2.origin, ( 0.0, 100.0, 5.0 ) );
}

_id_78BE()
{
    var_0 = common_scripts\utility::get_target_ent( "player_infrontof_apartment_gate" );
    var_0 waittill( "trigger" );
    level notify( "turn_death_trigger_on" );
    var_1 = spawn( "script_origin", ( 14384.0, -12254.0, 0.0 ) );
    earthquake( 1, 0.7, level.player.origin, 400 );
    var_1 playsound( "scn_prague_tank_explode_building" );
    playfx( common_scripts\utility::getfx( "tank_impact_exaggerated" ), var_1.origin, ( 0.0, 100.0, 5.0 ) );
    common_scripts\utility::flag_wait( "apart_blowup_window_2nd" );
    maps\_spawner::_id_213C( 5002 );
    earthquake( 1, 0.7, level.player.origin, 400 );
    common_scripts\utility::play_sound_in_space( "scn_prague_tank_explode_building", ( 15062.0, -11964.0, 147.0 ) );
}

_id_78BF()
{
    var_0 = getentarray( "courtyard_death_trigger", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_78C0();

    var_4 = getent( "courtyard_kill_player_early", "targetname" );
    var_4 waittill( "trigger" );
    playfx( common_scripts\utility::getfx( "tank_impact_exaggerated" ), level.player.origin );
    wait 0.1;
    level.player kill();
}

_id_78C0()
{
    common_scripts\utility::trigger_off();
    level waittill( "turn_death_trigger_on" );
    common_scripts\utility::trigger_on();
    self waittill( "trigger" );
    playfx( common_scripts\utility::getfx( "tank_impact_exaggerated" ), level.player.origin );
    wait 0.1;
    level.player kill();
}

_id_78C1()
{
    var_0 = getent( "courtyard_tank_killer", "targetname" );
    common_scripts\utility::trigger_off();
    level waittill( "turn_death_trigger_on_for_btr" );
    common_scripts\utility::trigger_on();
    self waittill( "trigger" );
    playfx( common_scripts\utility::getfx( "tank_impact_exaggerated" ), level.player.origin );
    wait 0.1;
    level.player kill();
}

_id_78C2( var_0 )
{
    magicbullet( "rpg_straight", ( 15030.0, -11864.0, -12.0 ), ( 14507.0, -13040.0, 7.0 ) );
    wait 0.7;
    magicbullet( "rpg", ( 14696.0, -11972.0, 192.0 ), ( 15424.0, -12640.0, 64.0 ) );
    wait 1.7;
    magicbullet( "rpg_straight", ( 14689.5, -11972.5, 474.5 ), var_0.origin + ( 0.0, 0.0, 400.0 ) );
    wait 0.6;
    common_scripts\utility::flag_set( "player_take_out_btr" );
    var_0 waittill( "death" );
    common_scripts\utility::flag_set( "btr_dead_now" );
    earthquake( 0.7, 0.7, level.player.origin, 400 );
    thread _id_78D7();
    thread _id_78C3();
    wait 2.5;
    thread maps\_utility::_id_11F4( "prague_mct_itsdown" );
    wait 1.3;
    common_scripts\utility::flag_set( "tank_attack_building" );
}

_id_78C3()
{
    var_0 = maps\_vehicle::_id_2881( "plaza_heli_support_one" );
    var_0 thread maps\prague_code::_id_5358();
    var_0 thread _id_524A::_id_5201( "start_apartment_fight" );
    wait 0.3;
    var_1 = maps\_vehicle::_id_2881( "plaza_heli_support_three" );
    var_1 thread _id_524A::_id_5201( "start_apartment_fight" );
    common_scripts\utility::flag_wait( "spotlight_aim_at_sandman" );
    var_0 maps\prague_code::_id_535E( level._id_45C0 );
    common_scripts\utility::flag_wait( "spotlight_aim_at_player" );
    var_0 maps\prague_code::_id_535E( level.player );
    var_0 waittill( "death" );
    var_0 thread maps\prague_code::_id_5360();
}

_id_78C4()
{
    var_0 = common_scripts\utility::get_target_ent( "player_infrontof_apartment_gate" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "start_apartments" );

    while ( !common_scripts\utility::flag( "apart_blowup_window_2nd" ) )
        wait 0.05;

    thread _id_78C8();
}

_id_78C5( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( "apt_resistance_drone_spawner_under" );

    foreach ( var_3 in var_0 )
    {
        var_1.origin = var_3.origin;
        var_1.angles = var_3.angles;

        if ( isdefined( var_3.target ) )
            var_1.target = var_3.target;

        var_4 = var_1 maps\_utility::_id_166F( 1 );

        if ( isdefined( var_3.script_noteworthy ) )
        {
            var_4 thread maps\_drone::_id_2036( var_3.script_noteworthy, var_3 );

            if ( issubstr( var_3.animation, "death" ) )
                var_4._id_0D50 = maps\_utility::_id_270F( var_3.animation );
        }
        else if ( isdefined( var_3.animation ) )
        {
            switch ( var_3.animation )
            {
                case "roadkill_cover_soldier_idle":
                    break;
                default:
                    var_4 maps\_utility::_id_24F5();
                    break;
            }

            var_3 maps\_utility::delaythread( randomfloatrange( 0, 1 ), maps\_anim::_id_11C8, var_4, var_3.animation );
        }
        else
        {

        }

        var_1.target = undefined;
    }
}

_id_78C6( var_0 )
{
    var_1 = common_scripts\utility::get_target_ent( "apt_resistance_drone_spawner_under" );

    foreach ( var_3 in var_0 )
    {
        var_1.origin = var_3.origin;
        var_1.angles = var_3.angles;
        var_4 = var_1 maps\_utility::_id_166F( 1 );
        var_4._id_1032 = "generic";
        var_4.animation = var_3.animation;

        if ( isdefined( var_3.script_noteworthy ) && var_3.script_noteworthy == "stand_sit" )
        {
            var_4 thread maps\prague_code::_id_530E();
            continue;
        }

        var_4 thread maps\prague_code::_id_530F();
    }
}

_id_78C7()
{
    maps\_utility::_id_272C( "plaza_rebel_hero" );
    var_0 = maps\prague_code::_id_53B5( "apartment_rebel_hero_one", "parameters" );

    foreach ( var_2 in var_0 )
    {
        var_2.goalradius = 10;
        var_2.goalheight = 10;
        var_2 maps\_utility::_id_0D04();
    }
}

_id_78C8()
{
    var_0 = maps\_utility::_id_2642( "plaza_tank_attack", "targetname" );
    var_0 delete();
    level notify( "cleanup_dead_bodies_three" );
    var_1 = maps\_utility::_id_2641( "rooftop_courtyard_apt_resistance", "parameters" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] dodamage( var_1[var_2].health + 300, var_1[var_2].origin );

    var_1 = maps\_utility::_id_2641( "courtyard_apt_resistance_five", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] dodamage( var_1[var_2].health + 300, var_1[var_2].origin );

    var_1 = maps\_utility::_id_2641( "courtyard_apt_resistance_three", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] dodamage( var_1[var_2].health + 300, var_1[var_2].origin );

    var_1 = maps\_utility::_id_2641( "courtyard_apt_resistance_two", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] dodamage( var_1[var_2].health + 300, var_1[var_2].origin );

    var_1 = maps\_utility::_id_2641( "rebels_ground", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] dodamage( var_1[var_2].health + 300, var_1[var_2].origin );

    var_3 = getaiarray( "axis" );

    foreach ( var_5 in var_3 )
        var_5 dodamage( var_5.health + 300, var_5.origin );

    var_7 = getentarray( "courtyard_death_trigger", "targetname" );

    foreach ( var_5 in var_7 )
        var_5 delete();

    var_10 = maps\_utility::_id_2642( "plaza_heli_support_one", "targetname" );

    if ( isalive( var_10 ) )
    {
        var_10 thread maps\prague_code::_id_536D();
        var_10 delete();
    }

    var_11 = maps\_utility::_id_2642( "plaza_heli_support_three", "targetname" );

    if ( isalive( var_11 ) )
        var_11 delete();
}

_id_003C()
{
    var_0 = maps\_utility::_id_229D();

    if ( var_0 == "hard" || var_0 == "fu" )
    {
        foreach ( var_2 in self.mgturret )
        {
            var_2 notify( "stop_burst_fire_unmanned" );
            var_2 settargetentity( level.player );
        }
    }

    for (;;)
    {
        foreach ( var_2 in self.mgturret )
            var_2 maps\_mgturret::_id_227C();

        wait(randomfloatrange( 0.1, 0.2 ));

        if ( common_scripts\utility::cointoss() )
            wait(randomfloatrange( 3, 7 ));
    }
}

_id_78C9()
{
    self endon( "death" );
    self endon( "stop_shooting" );

    if ( isdefined( self._id_52EA ) )
    {
        stopfxontag( common_scripts\utility::getfx( "heli_spotlight_cheap" ), self, self._id_52EA );
        stopfxontag( common_scripts\utility::getfx( "heli_spotlight" ), self, self._id_52EA );
    }

    childthread _id_003C();
    wait 7;
    var_0 = 0;

    while ( isalive( level.player ) )
    {
        if ( _id_78CC() )
        {
            var_0++;

            if ( var_0 <= 3 )
            {
                self setturrettargetent( level.player, ( 0.0, 30.0, 100.0 ) );
                self.mgturret[0].accuracy = 0.2;
                self.mgturret[0]._id_22A2 = 0;
            }
            else if ( var_0 <= 5 )
            {
                self setturrettargetent( level.player, ( 0.0, 15.0, 40.0 ) );
                self.mgturret[0].accuracy = 0.5;
                self.mgturret[0]._id_22A2 = 0;
            }
            else if ( var_0 <= 6 )
            {
                self setturrettargetent( level.player );
                self.mgturret[0].accuracy = 0.7;
                self.mgturret[0]._id_22A2 = 0;
            }
            else if ( var_0 >= 9 )
            {
                self setturrettargetent( level.player );
                self.mgturret[0].accuracy = 99999;
                self.mgturret[0]._id_22A2 = 0;
            }

            self.mgturret[0].favoriteenemy = level.player;
        }
        else if ( !_id_78CC() )
        {
            var_0 = 0;
            self._id_20AF = 0.05;
        }

        wait 0.005;
        _id_78CA();
    }
}

_id_78CA()
{
    var_0 = randomintrange( 3, 7 );
    var_1 = 0.1;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( level._id_78CB == 0 )
        {
            level._id_78CB = 1;
            self fireweapon();
            wait(var_1);
        }

        if ( var_0 >= 3 )
        {
            wait(randomfloatrange( 0.7, 3 ));
            level._id_78CB = 0;
        }
    }
}

_id_78CC()
{
    var_0 = level.player;
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_0 geteye();

    if ( sighttracepassed( var_1, var_2, 0, self ) )
    {
        if ( isdefined( level._id_4BF7 ) )
        {

        }

        return 1;
    }
    else
        return 0;
}

_id_78CD()
{
    var_0 = level._effect["electrical_transformer_spark_runner_lon"];
    var_1 = spawn( "script_origin", ( 14206.1, -11606.3, 6.94517 ) );
    thread _id_78CE( var_1, var_0 );
    var_1 = spawn( "script_origin", ( 14198.1, -11606.2, 46.2516 ) );
    thread _id_78CE( var_1, var_0 );
    var_1 = spawn( "script_origin", ( 14343.8, -11759.6, 18.6523 ) );
    thread _id_78CE( var_1, var_0 );
    var_1 = spawn( "script_origin", ( 14659.2, -11705.1, -27.5403 ) );
    thread _id_78CE( var_1, var_0 );
    var_1 = spawn( "script_origin", ( 14745.4, -11706.5, 26.8936 ) );
    thread _id_78CE( var_1, var_0 );
    var_1 = spawn( "script_origin", ( 14754.8, -11583.3, 20.082 ) );
    thread _id_78CE( var_1, var_0 );
    var_0 = level._effect["smoke_stream"];
    var_1 = getent( "steam_fx_four", "targetname" );
    thread _id_78CE( var_1, var_0 );
    var_1 = getent( "steam_fx_three", "targetname" );
    thread _id_78CE( var_1, var_0 );
    var_1 = getent( "steam_fx_two", "targetname" );
    thread _id_78CE( var_1, var_0 );
    var_1 = getent( "steam_fx_one", "targetname" );
    thread _id_78CE( var_1, var_0 );
}

_id_78CE( var_0, var_1 )
{
    level endon( "apartment_upstairs" );
    var_2 = 240;
    var_3 = 0;

    for (;;)
    {
        if ( var_3 >= 3 )
            var_2 = 400;

        if ( distance2d( level.player.origin, var_0.origin ) <= var_2 )
        {
            var_3++;

            if ( level._effect["electrical_transformer_spark_runner_lon"] == var_1 )
            {
                playfx( level._effect["electrical_transformer_sparks_a"], var_0.origin, ( 0.0, 0.0, 1.0 ) );
                playfx( var_1, var_0.origin, ( 0.0, 0.0, 1.0 ) );
            }
            else if ( level._effect["smoke_stream"] == var_1 )
                playfx( var_1, var_0.origin, anglestoforward( var_0.angles ), anglestoup( var_0.angles ) );

            break;
        }

        wait 0.05;
    }
}

_id_78CF()
{
    level endon( "apartment_upstairs" );
    var_0 = getentarray( "hanging_light_on", "targetname" );
    var_1 = getentarray( "hanging_light_off", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    foreach ( var_6 in var_0 )
        var_6 hide();

    var_8 = common_scripts\utility::get_target_ent( "player_infrontof_apartment_gate" );
    var_8 waittill( "trigger" );

    for (;;)
    {
        var_9 = getentarray( "building_light", "targetname" );

        foreach ( var_11 in var_9 )
        {
            var_11._id_53B1 = var_11 getlightintensity();
            thread _id_524A::_id_5202( var_11, 0.5, 1.3 );
            thread _id_524A::_id_5208( var_11, 4 );
            var_11 thread _id_78D0();
        }

        wait 1.0;

        foreach ( var_11 in var_9 )
        {
            var_11 notify( "stop_flicker" );
            var_11 notify( "stop_movement" );
            var_11 setlightintensity( var_11._id_53B1 * randomfloatrange( 0.7, 1.0 ) );

            foreach ( var_3 in var_1 )
                var_3 hide();

            foreach ( var_6 in var_0 )
                var_6 show();

            if ( common_scripts\utility::cointoss() )
                wait(randomfloatrange( 0, 0.5 ));
        }

        wait 3;
    }
}

_id_78D0()
{
    var_0 = getentarray( "hanging_light_on", "targetname" );
    var_1 = getentarray( "hanging_light_off", "targetname" );
    self endon( "stop_flicker" );
    self endon( "stop_movement" );

    for (;;)
    {
        wait 0.1;

        foreach ( var_3 in var_1 )
            var_3 show();

        foreach ( var_6 in var_0 )
            var_6 hide();

        wait 0.1;

        foreach ( var_3 in var_1 )
            var_3 hide();

        foreach ( var_6 in var_0 )
            var_6 show();
    }
}

_id_78D1()
{
    level thread _id_78D2();
    var_0 = getentarray( "rpgs_glow", "script_noteworthy" );
    common_scripts\utility::waitframe();

    foreach ( var_2 in var_0 )
    {
        var_2._id_032A = spawn( "script_model", var_2.origin );
        var_2._id_032A.angles = var_2.angles;
        var_2._id_032A setmodel( "weapon_rpg7_obj" );
        var_2 thread common_scripts\utility::delete_on_death( var_2._id_032A );
        var_2 thread _id_032B( var_2._id_032A );
    }
}

_id_032B( var_0 )
{
    var_0 endon( "death" );
    self waittill( "trigger" );
    var_0 delete();
}

_id_78D2()
{
    common_scripts\utility::flag_wait( "btr_dead_now" );
    var_0 = getentarray( "rpgs_glow", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
            var_2 delete();
    }
}

_id_78D3( var_0 )
{
    var_1 = getentarray( "rpgs_glow", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 itemweaponsetammo( 1, 1 );

    common_scripts\utility::flag_wait( "player_take_out_btr" );
    maps\_utility::_id_1425( "player_take_out_btr" );
    thread _id_78D1();
    thread _id_78D5();
    thread _id_78D6();
    thread _id_78D4( var_0 );
    missile_deleteattractor( level._id_78B5 );
    badplace_cylinder( "dont_flank_player_while_destoying_btr", 60, ( 13477.0, -12685.0, -64.0 ), 670, 200, "axis" );
    level endon( "btr_dead_now" );

    while ( !common_scripts\utility::flag( "btr_dead_now" ) )
    {
        var_5 = level.player getcurrentprimaryweapon();

        if ( issubstr( var_5, "rpg" ) )
        {
            if ( level.player getweaponammostock( var_5 ) < 1 )
                level.player setweaponammostock( var_5, 1 );
        }

        wait 0.2;
    }
}

_id_78D4( var_0 )
{
    var_1 = spawn( "script_origin", var_0.origin );
    objective_position( maps\_utility::_id_2816( "fight" ), var_1.origin );
    var_2 = maps\_utility::_id_2642( "plaza_btr_attack_two", "targetname" );
    var_3 = 0;

    for (;;)
    {
        var_4 = level.player getcurrentweapon();
        var_5 = level.player getcurrentprimaryweapon();

        if ( isdefined( var_4 ) && var_4 == "rpg_player" || var_5 == "rpg_player_objective" )
        {
            objective_position( maps\_utility::_id_2816( "fight" ), var_2.origin );
            objective_setpointertextoverride( maps\_utility::_id_2816( "fight" ), &"prague_target" );
            common_scripts\utility::flag_set( "player_has_rpg" );
            break;
        }
        else if ( isdefined( var_4 ) && var_3 == 0 && var_4 != "rpg_player" || var_5 != "rpg_player_objective" )
        {
            var_3 = 1;
            objective_position( maps\_utility::_id_2816( "fight" ), var_1.origin );
        }

        wait 0.05;
    }
}

_id_78D5()
{
    level endon( "player_has_rpg" );
    level endon( "btr_dead_now" );
    wait 5;

    while ( !common_scripts\utility::flag( "player_has_rpg" ) )
    {
        thread maps\_utility::_id_11F4( "prague_mct_getanrpg" );
        wait 9;
        thread maps\_utility::_id_11F4( "prague_mct_takeoutarmor" );
        wait 9;
    }
}

_id_78D6()
{
    level endon( "btr_dead_now" );
    common_scripts\utility::flag_wait( "player_has_rpg" );

    while ( !common_scripts\utility::flag( "btr_dead_now" ) )
    {
        thread maps\_utility::_id_11F4( "prague_mct_takeout" );
        wait 9;
        thread maps\_utility::_id_11F4( "prague_mct_userpg" );
        wait 9;
        thread maps\_utility::_id_11F4( "prague_mct_hitthatthing" );
        wait 9;
    }
}

_id_78D7()
{
    if ( !_id_78D8() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = level.player getweaponslistprimaries();
    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        if ( issubstr( var_5, "rpg" ) )
        {
            var_1 = 1;

            if ( issubstr( level.player getcurrentweapon(), "rpg" ) )
            {
                var_3 = 1;
                level.player disableweapons();
                wait 1.5;
            }

            level.player takeweapon( var_5 );
            continue;
        }

        if ( var_5 == level._id_1C68 )
            var_0 = 1;
    }

    if ( !var_1 )
        return;

    level.player enableweapons();

    if ( !var_0 )
        level.player giveweapon( level._id_1C68 );

    if ( var_3 )
        level.player switchtoweapon( level._id_1C68 );
}

_id_78D8()
{
    var_0 = level.player getweaponslistall();

    if ( !isdefined( var_0 ) )
        return 0;

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2, "rpg" ) )
            return 1;
    }

    return 0;
}
