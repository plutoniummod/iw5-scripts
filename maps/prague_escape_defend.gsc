// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7C11()
{
    common_scripts\utility::flag_init( "chasers" );
    common_scripts\utility::flag_init( "FLAG_defend_court_soap_reached_back_area" );
    common_scripts\utility::flag_init( "soap_carry" );
    common_scripts\utility::flag_init( "uazs_arrive" );
    common_scripts\utility::flag_init( "uaz1_unloaded" );
    common_scripts\utility::flag_init( "uaz2_unloaded" );
    common_scripts\utility::flag_init( "open_fire" );
    common_scripts\utility::flag_init( "advance_done" );
    common_scripts\utility::flag_init( "enter_alley" );
    common_scripts\utility::flag_init( "start_runners" );
    common_scripts\utility::flag_init( "suv_flank_unloaded" );
    common_scripts\utility::flag_init( "suv_final_unloaded" );
    common_scripts\utility::flag_init( "btr_arrives" );
    common_scripts\utility::flag_init( "rpg_fired" );
    common_scripts\utility::flag_init( "kill_resist_window" );
    common_scripts\utility::flag_init( "btr_on_court" );
    common_scripts\utility::flag_init( "FLAG_defend_btr_knocks_down_fence" );
    common_scripts\utility::flag_init( "FLAG_resistance_help_soap_spawned" );
    common_scripts\utility::flag_init( "btr_destroyed" );
    common_scripts\utility::flag_init( "resistance_attacks" );
    common_scripts\utility::flag_init( "resistance_arrival" );
    common_scripts\utility::flag_init( "resistance_mortal" );
    common_scripts\utility::flag_init( "price_soap_leaving" );
    common_scripts\utility::flag_init( "soap_pickedup" );
    common_scripts\utility::flag_init( "clear_table" );
    common_scripts\utility::flag_init( "soap_on_table" );
    common_scripts\utility::flag_init( "in_safehouse" );
    common_scripts\utility::flag_init( "FLAG_soap_death_close_door_to_defend" );
    common_scripts\utility::flag_init( "queue_defend_music" );
}

_id_7C12()
{
    maps\_shg_common::move_player_to_start( "start_defend" );
    maps\_compass::setupminimap( "compass_map_prague_escape_standoff", "standoff_minimap_corner" );
    maps\prague_escape_code::_id_7A3B( "price", "defend" );
    maps\prague_escape_code::_id_7A3B( "soap", "defend" );
    level.player enableweapons();
    level._id_4877 maps\_utility::_id_104A( "deserteagle", "primary" );
    level._id_54E0 maps\_utility::_id_104A( "p99", "primary" );
    level._id_7B89 = maps\prague_escape_code::_id_7A44( level._id_54E0, &"PRAGUE_ESCAPE_PROTECT_SOAP", 1, 1, "active", &"PRAGUE_ESCAPE_PROTECT" );
    common_scripts\utility::flag_set( "queue_sniper_music" );
    common_scripts\utility::flag_set( "queue_player_carry_music" );
    common_scripts\utility::flag_set( "queue_price_carry_music" );
    common_scripts\utility::flag_set( "queue_defend_music" );
    level thread maps\prague_escape::_id_7B5C();
    level._id_7B1A = maps\_vehicle::_id_2A99( "cough_alley_chopper" );
    wait 0.1;
    level._id_7B1A._id_7A69 = undefined;
    var_0 = common_scripts\utility::getstruct( "defend_wait_node", "script_noteworthy" );
    level._id_7B1A vehicle_teleport( var_0.origin, var_0.angles );
    level._id_7B1A._id_291A = var_0;
    level._id_7B1A thread maps\_vehicle::_id_26A1( var_0 );
    level thread maps\prague_escape_store::_id_7B9D();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7C13()
{
    maps\_shg_common::move_player_to_start( "start_resistance_carry" );
    maps\_compass::setupminimap( "compass_map_prague_escape_standoff", "standoff_minimap_corner" );
    level.player giveweapon( "m4m203_reflex" );
    level.player switchtoweapon( "m4m203_reflex" );
    maps\prague_escape_code::_id_7A3B( "price", "resistance_carry" );
    maps\prague_escape_code::_id_7A3B( "soap", "resistance_carry" );
    level._id_4877 maps\_utility::_id_104A( "ak47", "primary" );
    level._id_54E0 maps\_utility::_id_104A( "p99", "primary" );
    level._id_7B89 = maps\prague_escape_code::_id_7A44( level._id_54E0, &"PRAGUE_ESCAPE_PROTECT_SOAP", 1, 1, "active", &"PRAGUE_ESCAPE_PROTECT" );
    _id_7C7D();
    _id_7C11();
    _id_7C50();
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 thread maps\_anim::_id_124E( level._id_54E0, "idle_soap" );
    wait 5;
    thread _id_7C4F();
    thread _id_7C76();
    var_1 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_1 maps\_anim::_id_124A( level._id_4877, "resistancearrive1" );
    common_scripts\utility::flag_set( "btr_destroyed" );
    thread _id_7C1F();
    var_0 notify( "stop_loop" );
    var_2 = [ level._id_4877, level._id_54E0, level._id_7BE3, level._id_7BE2 ];
    level._id_7BE3 thread maps\_utility::play_sound_on_entity( "ch_pragueb_9_2_resistancecarry_leader" );
    var_1 maps\_anim::_id_11DD( var_2, "resistancearrive1" );
    common_scripts\utility::flag_set( "resistance_arrival" );
    var_3 = [ level._id_4877, level._id_54E0, level._id_7BE3, level._id_7BE2 ];
    var_1 thread maps\_anim::_id_11D6( var_3, "idle_carry" );
    wait 8;
    level._id_54E0 maps\_utility::_id_274F();
    var_1 notify( "stop_loop" );
    common_scripts\utility::flag_set( "soap_pickedup" );
    thread _id_7C2A();
    common_scripts\utility::exploder( 801 );
    var_1 maps\_anim::_id_11DD( var_3, "resistancecarry" );
    common_scripts\utility::flag_set( "soap_on_table" );
    common_scripts\utility::flag_wait( "in_safehouse" );
    maps\_utility::_id_265A( "allies" );
    var_4 = getent( "trig_medic_start", "targetname" );
    var_4 common_scripts\utility::trigger_on();
    maps\prague_escape_sniper::_id_7AE5();
}

_id_7C14()
{

}

_id_7C15()
{
    thread _id_7C16();
    thread _id_7C77();
    thread _id_7C76();
    thread _id_7C1F();
    thread _id_7C2D();
    thread _id_7C17();
    thread _id_7C82();
    thread _id_00CD();
}
#using_animtree("generic_human");

_id_7C16()
{
    common_scripts\utility::flag_set( "FLAG_soap_blood_fx" );
    common_scripts\utility::flag_clear( "FLAG_soap_walk_blood_drip_hip" );
    common_scripts\utility::flag_set( "FLAG_soap_walk_blood_drip_elbow" );
    thread _id_7C2E();
    thread _id_7C80();
    thread _id_7C7E();
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    level._id_4877 thread _id_7C4D();
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_7_5_crosscourt_price" );
    var_0 maps\_anim::_id_11DD( [ level._id_4877, level._id_54E0 ], "crosscourt" );
    level._id_54E0 clearanim( %root, 0 );
    level._id_4877 maps\_utility::delaythread( 0.05, maps\_utility::play_sound_on_entity, "ch_pragueb_7_5_crossplaza_price" );
    var_0 maps\_anim::_id_11DD( [ level._id_4877, level._id_54E0 ], "crossplaza" );
    common_scripts\utility::flag_set( "FLAG_defend_court_soap_reached_back_area" );
    level._id_4877 thread _id_7C2B();
    var_0 thread maps\_anim::_id_124E( level._id_54E0, "idle_fire_soap" );
    wait 5.0;
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::_id_124E( level._id_54E0, "idle_soap" );
}

_id_7C17()
{
    common_scripts\utility::flag_wait( "uazs_arrive" );
    thread _id_7C4F();
    common_scripts\utility::flag_wait( "FLAG_defend_court_soap_reached_back_area" );
    maps\_utility::_id_1425( "autosave_soap_reached_end_area" );
    maps\_utility::delaythread( 1.0, ::_id_7C1B );
    common_scripts\utility::flag_clear( "FLAG_soap_walk_blood_drip_elbow" );
    common_scripts\utility::flag_set( "queue_soap_death_music" );
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_0 maps\_anim::_id_124A( level._id_4877, "resistancearrive1" );
    var_1 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_1 notify( "stop_loop" );
    var_2 = getent( "resistance_medic1", "targetname" );
    var_3 = var_2 maps\_utility::_id_166F( 1 );
    var_2 = getent( "resistance_medic2", "targetname" );
    var_4 = var_2 maps\_utility::_id_166F( 1 );
    var_2 = getent( "resistance_medic3", "targetname" );
    var_5 = var_2 maps\_utility::_id_166F( 1 );
    var_2 = getent( "resistance_medic4", "targetname" );
    level._id_7BE2 = var_2 maps\_utility::_id_166F( 1 );
    var_2 = getent( "resistance_leader", "targetname" );
    level._id_7BE3 = var_2 maps\_utility::_id_166F( 1 );
    common_scripts\utility::flag_set( "FLAG_resistance_help_soap_spawned" );
    var_6 = [ var_3, var_4, var_5, level._id_7C18, level._id_7C19 ];
    var_7 = [ level._id_4877, level._id_54E0, level._id_7BE3, level._id_7BE2 ];
    var_0 thread maps\_anim::_id_11DD( var_6, "resistancearrive2" );
    var_0 maps\_anim::_id_11DD( var_7, "resistancearrive1" );
    common_scripts\utility::flag_set( "soap_carry" );
    thread _id_7C2C();
    common_scripts\utility::flag_set( "resistance_arrival" );
    var_8 = [ level._id_4877, level._id_54E0, level._id_7BE3, level._id_7BE2 ];
    var_0 thread maps\_anim::_id_11D6( var_8, "idle_carry" );
    wait 1.0;
    var_9 = 700;
    var_10 = 20.0;
    level._id_4877 thread _id_7C78( var_9, var_10 );
    level._id_54E0 thread _id_7C78( var_9, var_10 );
    thread _id_7C79();
    common_scripts\utility::flag_wait( "price_soap_leaving" );
    level._id_54E0 animscripts\shared::_id_0C9B( level._id_54E0.primaryweapon, "none" );
    thread _id_7C2A();
    thread _id_7C1C();
    common_scripts\utility::exploder( 801 );
    common_scripts\utility::flag_set( "soap_pickedup" );
    common_scripts\utility::flag_set( "FLAG_soap_walk_blood_drip_elbow" );
    common_scripts\utility::flag_set( "FLAG_soap_walk_blood_drip_hip" );
    maps\_utility::_id_1425( "autosave_soap_pickedup" );
    var_11 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_11 notify( "stop_loop" );
    var_0 notify( "stop_loop" );
    common_scripts\utility::array_thread( var_8, ::_id_7C1A, var_0 );
    var_12 = getanimlength( level._id_4877 maps\_utility::_id_1281( "resistancecarry" ) );
    wait(var_12);
    common_scripts\utility::flag_set( "soap_on_table" );
    common_scripts\utility::flag_clear( "FLAG_soap_walk_blood_drip_elbow" );
    common_scripts\utility::flag_clear( "FLAG_soap_walk_blood_drip_hip" );
    maps\_utility::_id_1425( "autosave_soap_on_table" );
    common_scripts\utility::exploder( 1105 );
    common_scripts\utility::flag_wait( "in_safehouse" );
    maps\_utility::_id_265A( "allies" );
    var_13 = getent( "trig_medic_start", "targetname" );
    var_13 common_scripts\utility::trigger_on();
    level notify( "end_fail_monitor" );
}

_id_7C1A( var_0 )
{
    level endon( "FLAG_soap_death_started" );
    var_0 maps\_anim::_id_1246( self, "resistancecarry" );
}

_id_7C1B()
{
    var_0 = common_scripts\utility::getstructarray( "blood_pool", "targetname" );
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "defend" ] )[0];
    playfx( common_scripts\utility::getfx( "FX_soap_sit_blood_pool" ), var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
}

_id_7C1C()
{
    thread _id_7C1D();
    thread _id_7C1E();
}

_id_7C1D()
{
    var_0 = getanimlength( level._id_7BE2 maps\_utility::_id_1281( "resistancecarry" ) );
    wait(var_0);
    var_1 = getnodearray( "resistance_guy", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    level._id_7BE2 setgoalnode( var_1[1] );
}

_id_7C1E()
{
    var_0 = getanimlength( level._id_7BE3 maps\_utility::_id_1281( "resistancecarry" ) );
    wait(var_0 - 4);
    level._id_7BE3 stopanimscripted();
    var_1 = getnodearray( "resistance_guy", "targetname" );
    var_1 = maps\_utility::_id_27EC( var_1 );
    level._id_7BE3 setgoalnode( var_1[2] );
}

_id_7C1F()
{
    thread _id_7C20();
    wait 1.0;
    var_0 = getent( "triggercolor_resistance", "targetname" );
    var_0 notify( "trigger" );
    var_0 = getent( "triggercolor_resistance2", "targetname" );
    var_0 notify( "trigger" );
}

_id_7C20()
{
    maps\prague_escape_medic::_id_7BE7();
    maps\prague_escape_medic::_id_7BEF();
    thread _id_7C21();
    common_scripts\utility::flag_wait( "soap_pickedup" );
    wait 1;
    maps\prague_escape_medic::_id_7BF1();
    maps\prague_escape_medic::_id_7BE6();
    common_scripts\utility::flag_wait( "soap_on_table" );
    thread maps\prague_escape_medic::_id_7BF6();
}

_id_7C21()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_1 = spawnstruct();
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_2 = [ level._id_7C22, level._id_7C23, level._id_7C24, level._id_7C25, level._id_7C26, level._id_7C27, level._id_7C28, level._id_7C29 ];
    var_0 maps\_anim::_id_11BF( var_2, "clear_table" );
    var_1 thread maps\_anim::_id_124E( level._id_7BF0, "idle_clear_table" );
    common_scripts\utility::flag_wait( "clear_table" );
    var_3 = [ level._id_7C22, level._id_7C23, level._id_7C24, level._id_7C25, level._id_7C26, level._id_7C27, level._id_7C28, level._id_7C29, level._id_7BF0 ];
    var_1 notify( "stop_loop" );
    var_1 maps\_anim::_id_11DD( var_3, "clear_table" );
    var_1 maps\_anim::_id_124A( level._id_7BF0, "soap_death_idle" );
    var_1 thread maps\_anim::_id_124E( level._id_7BF0, "soap_death_idle" );
    thread maps\prague_escape_medic::_id_7BFC( var_1 );
}

_id_7C2A()
{
    wait 14;
    common_scripts\utility::flag_set( "clear_table" );
}

_id_7C2B()
{
    self.fixednode = 0;
    var_0 = getent( "vol_price_defend", "targetname" );
    self setgoalvolumeauto( var_0 );
    common_scripts\utility::flag_wait( "btr_on_court" );
    self cleargoalvolume();
    var_1 = getnode( "cover_price_soapcarry", "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    self.fixednode = 1;
    common_scripts\utility::flag_wait( "soap_carry" );
    self.fixednode = 0;
}

_id_7C2C()
{
    var_0 = getent( "trigger_resistance_guards", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "resistance_guard", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_166F );
}

_id_00CD()
{
    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        var_0 = getaiarray( "axis" );
        var_0 = maps\_utility::_id_0B53( var_0 );

        foreach ( var_3, var_2 in var_0 )
        {
            if ( var_3 > var_0.size / 2 )
                break;

            var_2._id_0CD1 = randomint( 2 );
            var_2.a.rockets = 0;
        }

        wait 5;
    }
}

_id_7C2D()
{
    common_scripts\utility::flag_wait( "btr_arrives" );
    var_0 = getentarray( "tactical_alley", "targetname" );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "tactical_alley_cover", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "tactical_alley_backup", "targetname" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "flanker_runner1", "script_noteworthy" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "flanker_runner2", "script_noteworthy" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "flanker_runner3", "script_noteworthy" ) );
    var_0 = common_scripts\utility::add_to_array( var_0, getent( "flanker_runner4", "script_noteworthy" ) );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) && var_1.size > 0 )
    {
        if ( getaiarray().size < 22 )
        {
            var_3 = randomint( var_1.size );

            if ( isdefined( var_0[var_1[var_3]] ) )
                var_0[var_1[var_3]] maps\_utility::_id_166F();

            var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            wait 0.05;
        }

        wait 0.05;
    }

    var_0 = [ getent( "flanker_tennis_point", "targetname" ), getent( "flanker_tennis_fencer", "targetname" ) ];
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) && var_1.size > 0 )
    {
        if ( getaiarray().size < 22 )
        {
            var_3 = randomint( var_1.size );

            if ( isdefined( var_0[var_1[var_3]] ) )
                var_0[var_1[var_3]] maps\_utility::_id_166F();

            var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            wait 0.05;
        }

        wait 0.05;
    }

    var_4 = getent( "spawner_tennis", "script_noteworthy" );
    var_4 notify( "trigger" );
    var_0 = getentarray( "flanker_tennis_backup", "targetname" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) && var_1.size > 0 )
    {
        if ( getaiarray().size < 22 )
        {
            var_3 = randomint( var_1.size );

            if ( isdefined( var_0[var_1[var_3]] ) )
                var_0[var_1[var_3]] maps\_utility::_id_166F();

            var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            wait 0.05;
        }

        wait 0.05;
    }

    var_5 = getent( "spawner_alley", "script_noteworthy" );
    var_5 notify( "trigger" );
    var_0 = getentarray( "flanker_recreation", "targetname" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_2;

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) && var_1.size > 0 )
    {
        if ( getaiarray().size < 22 )
        {
            var_3 = randomint( var_1.size );

            if ( isdefined( var_0[var_1[var_3]] ) )
                var_0[var_1[var_3]] maps\_utility::_id_166F();

            var_1 = maps\_utility::array_remove_index( var_1, var_3 );
            wait 0.05;
        }

        wait 0.05;
    }

    var_6 = getent( "spawner_rec", "script_noteworthy" );
    var_6 notify( "trigger" );
    var_7 = getent( "spawner_bank", "script_noteworthy" );
    var_7 notify( "trigger" );
    var_8 = getent( "spawner_tunnel", "script_noteworthy" );
    var_8 notify( "trigger" );
    common_scripts\utility::flag_wait( "FLAG_resistance_help_soap_spawned" );
    var_0 = getentarray( "defend_enemy", "targetname" );
    var_9 = maps\_utility::_id_283B( "defend_enemy_goal", "targetname" );

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        if ( getaiarray().size < 22 )
        {
            var_10 = var_0[randomint( var_0.size )];
            var_10.count = 1;
            var_11 = var_10 maps\_utility::_id_166F();
            var_11 setgoalpos( var_9.origin );
            var_11 maps\_utility::_id_2724( var_9.radius );
            wait 0.05;
        }

        wait 0.05;
    }

    wait 0.05;
    _id_5F9E::_id_5EE0( getaiarray( "axis" ), ::delete );
}

_id_7C2E()
{
    common_scripts\utility::flag_wait_any( "chasers_go", "chasers_price" );
    thread maps\prague_escape_code::_id_7A61( 1200 );
    thread _id_7C6A();
    thread _id_7C6B();
    var_0 = getent( "clip_bank_street", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    var_1 = getentarray( "court_chaser", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::_id_166F );

    if ( level.player.origin[1] < level._id_4877.origin[1] )
    {
        var_2 = getentarray( "court_chaser_backup", "targetname" );
        common_scripts\utility::array_thread( var_2, maps\_utility::_id_166F );
    }
    else
    {
        var_3 = getentarray( "court_chaser_bank", "targetname" );
        common_scripts\utility::array_thread( var_3, maps\_utility::_id_166F );
    }

    thread _id_7C2F();
    wait 2.0;
    common_scripts\utility::flag_set( "chasers" );
    common_scripts\utility::flag_set( "queue_defend_music" );
}

_id_7C2F()
{
    wait 10;
    thread _id_7C30();
    thread _id_7C34();
    thread _id_7C41();
}

_id_7C30()
{
    var_0 = getent( "uaz1", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( ::_id_7C31 );
    var_1 = getent( "uaz2", "targetname" );
    var_1 thread maps\_utility::add_spawn_function( ::_id_7C32 );
    wait 5.0;
    var_2 = getent( "triggervehicle_uaz", "targetname" );
    var_2 notify( "trigger" );
    wait 20.0;
    common_scripts\utility::flag_set( "uazs_arrive" );
}

_id_7C31()
{
    self endon( "death" );
    thread _id_001B( [ "uaz1_unloaded", "uazs_arrive" ] );
    var_0 = getvehiclenode( "uaz_arrive", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "uazs_arrive" );
    self waittill( "reached_end_node" );
    wait 1;
    maps\_vehicle::_id_2514();
    self waittill( "unloaded" );
    wait 1;
    common_scripts\utility::flag_set( "uaz1_unloaded" );
}

_id_7C32()
{
    self endon( "death" );
    thread _id_001B( [ "uaz2_unloaded" ] );
    self waittill( "reached_end_node" );
    var_0 = maps\_utility::_id_283B( "struct_hydrant_court", "targetname" );
    var_1 = getent( "clip_hydrant_defend", "targetname" );
    var_1 delete();
    wait 0.5;
    radiusdamage( var_0.origin, 35, 450, 350 );
    level notify( "plug_hydrant_leak" );
    wait 0.5;
    maps\_vehicle::_id_2514();
    self waittill( "unloaded" );
    wait 1;
    common_scripts\utility::flag_set( "uaz2_unloaded" );
}

_id_001B( var_0 )
{
    self waittill( "death" );

    foreach ( var_2 in var_0 )
        common_scripts\utility::flag_set( var_2 );
}

_id_7C34()
{
    var_0 = getent( "btr", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( ::_id_7C35 );
    common_scripts\utility::flag_wait( "uazs_arrive" );
    wait 5.0;
    var_1 = getent( "triggervehicle_btr", "targetname" );
    var_1 notify( "trigger" );
    common_scripts\utility::flag_wait( "btr_on_court" );
    wait 10.0;
    var_2 = getent( "defend_btr", "targetname" );
    var_3 = var_2 maps\_utility::_id_1FA3();
    var_3.veh_pathtype = "constrained";
    var_3 thread maps\_vehicle::_id_1FA6();
    var_3 thread _id_7C36();
}

_id_7C35()
{
    self.veh_pathtype = "constrained";
    self.mgturret[0] notify( "stop_burst_fire_unmanned" );
    self setcandamage( 0 );
    self setturrettargetent( level.player );
    self waittill( "reached_end_node" );
    common_scripts\utility::flag_set( "btr_arrives" );
    _id_7C3A();
    wait 1;
    wait 1.0;
    var_0 = getvehiclenode( "btr_turn", "targetname" );
    self attachpath( var_0 );
    var_1 = getvehiclenode( "btr_fence", "targetname" );
    var_1 waittill( "trigger" );
    thread _id_7C72();
    var_2 = getvehiclenode( "btr_on_court", "targetname" );
    var_2 waittill( "trigger" );
    common_scripts\utility::flag_set( "btr_on_court" );
    thread _id_7C49();
    thread _id_7C3C();
    var_3 = getvehiclenode( "btr_end", "targetname" );
    var_3 waittill( "trigger" );
    thread _id_7C39();
    wait 5;
    _id_7C70();
    thread _id_7C4A();
    self notify( "target_resistance" );
    _id_7C3B();
    self notify( "target_building" );
    wait 1.0;
    _id_7C3F();
    thread _id_7C3E();
    wait 2;
    thread _id_7C37();
    common_scripts\utility::flag_wait( "resistance_arrival" );
    wait 2;
    common_scripts\utility::flag_set( "resistance_mortal" );
}

_id_7C36()
{
    self endon( "death" );
    var_0 = self.mgturret[0];
    var_0._id_61B4 = 0.1;
    var_0._id_22A1 = 10;
    self._id_4535["aimspeed"] = 1;
    var_1 = level.player;
    var_0 notify( "stop_burst_fire_unmanned" );
    var_2 = 512;
    var_3 = 10;
    var_4 = 0;

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        wait 1;
        var_4 = _id_5F9E::_id_5F10( var_4 + 1, 20 );
        var_0 thread maps\_mgturret::_id_2278();
        var_5 = randomintrange( 10, 15 );
        var_6 = ( 1 - var_4 / var_3 ) * var_2;
        var_7 = _id_5F9E::_id_5F41( -1 * var_6, var_6 );
        var_7 = ( var_7[0], var_7[1], _id_5F9E::_id_5F0F( var_7[2], 0 ) );

        for ( var_8 = 0; var_8 < var_5; var_8++ )
        {
            self setturrettargetent( var_1, var_7 );
            self waittill( "turret_on_target" );
            self fireweapon();
            wait 0.05;
        }

        var_9 = randomfloatrange( 1.0, 2.0 );
        var_4 = _id_5F9E::_id_5F10( var_4 + var_9, 20 );
        wait(var_9);
        var_0 notify( "stop_burst_fire_unmanned" );
    }
}

_id_7C37()
{
    maps\_utility::_id_274F( 0.9, 0.1, 1, 2 );
    var_0 = [ -1, common_scripts\utility::getstruct( "rpg_start1", "targetname" ), common_scripts\utility::getstruct( "rpg_start2", "targetname" ), common_scripts\utility::getstruct( "rpg_start3", "targetname" ) ];
    magicbullet( "rpg_straight", var_0[1].origin, self.origin + ( 0.0, -50.0, 150.0 ) );
    level thread _id_7C6D();
    common_scripts\utility::flag_set( "rpg_fired" );
    wait 1.5;
    self setcandamage( 1 );
    magicbullet( "rpg_straight", var_0[3].origin, self.origin );
    level notify( "LISTEN_defend_btr_stop_impact_fx" );
    self waittill( "damage" );
    self dodamage( self.health, self.origin );
    wait 1.5;
    magicbullet( "rpg_straight", var_0[2].origin, self.origin + ( 140.0, -100.0, 0.0 ) );
    level thread _id_7C6E();
    common_scripts\utility::flag_set( "btr_destroyed" );
    level thread _id_7C71();
}

_id_7C38()
{
    self endon( "target_building" );
    var_0 = self.mgturret[0];
    var_0 notify( "stop_burst_fire_unmanned" );

    for (;;)
    {
        var_1 = getaiarray( "allies" );
        var_2 = var_1[randomint( var_1.size )];
        wait 1;
        var_0 thread maps\_mgturret::_id_2278();
        var_3 = randomintrange( 5, 9 );

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = common_scripts\utility::ter_op( var_4 == 4, ( 0.0, 0.0, 0.0 ), ( randomintrange( 20, 50 ), randomintrange( -40, -20 ), randomintrange( 50, 100 ) ) );
            self setturrettargetent( var_2, var_5 );
            self waittill( "turret_on_target" );
            self fireweapon();
            wait 0.1;
        }

        var_0 notify( "stop_burst_fire_unmanned" );
        wait(randomfloatrange( 1.5, 2.0 ));
    }
}

_id_7C39()
{
    self endon( "target_resistance" );
    var_0 = self.mgturret[0];
    var_0._id_61B4 = 0.1;
    var_0._id_22A1 = 10;
    self._id_4535["aimspeed"] = 1;
    var_1 = level.player;
    var_0 notify( "stop_burst_fire_unmanned" );

    for (;;)
    {
        var_1 = common_scripts\utility::ter_op( randomint( 2 ), level.player, level._id_4877 );
        wait 1;
        var_0 thread maps\_mgturret::_id_2278();
        var_2 = randomintrange( 5, 9 );

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            var_4 = common_scripts\utility::ter_op( var_3 == 7, ( 0.0, 0.0, 0.0 ), ( randomintrange( 20, 50 ), randomintrange( -40, -20 ), randomintrange( 50, 100 ) ) );
            self setturrettargetent( var_1, var_4 );
            self waittill( "turret_on_target" );
            self fireweapon();
            wait 0.1;
        }

        wait(randomfloatrange( 1.0, 2.0 ));
        var_0 notify( "stop_burst_fire_unmanned" );
    }
}

_id_7C3A()
{
    var_0 = self.mgturret[0];
    var_0._id_61B4 = 0.1;
    var_0 notify( "stop_burst_fire_unmanned" );
    wait 1;
    var_1 = getent( "btr_strafe_target", "targetname" );
    var_2 = 0;
    var_3 = 0;
    level thread _id_7C48();

    for ( var_4 = 0; var_4 < 60; var_4++ )
    {
        self setturrettargetent( var_1, ( var_2, 0, var_3 ) );
        self waittill( "turret_on_target" );
        self fireweapon();
        wait 0.1;
        var_2 += 10;
        var_3 = randomintrange( -35, 25 );
    }
}

_id_7C3B()
{
    var_0 = common_scripts\utility::getstruct( "molotov_start1", "targetname" );
    var_1 = spawn( "script_origin", self.origin + ( -100.0, 40.0, 100.0 ) );
    maps\prague_escape_code::_id_789D( var_0, var_1 );
    var_1 delete();
}

_id_7C3C()
{
    var_0 = self.mgturret[0];
    var_0._id_61B4 = 0.1;
    var_0 notify( "stop_burst_fire_unmanned" );
    wait 1;
    var_1 = common_scripts\utility::getstruct( "resist_rpg1", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin );
    self setturrettargetent( var_2 );
    self waittill( "turret_on_target" );
    thread _id_7C3D();

    for ( var_3 = 0; var_3 < 12; var_3++ )
    {
        self fireweapon();
        wait 0.1;
    }

    self waittill( "death" );
    var_2 delete();
}

_id_7C3D()
{
    var_0 = getent( "tag_rooftop_impact", "targetname" );
    wait 0.6;
    playfxontag( common_scripts\utility::getfx( "btr_cannon_impact_burst" ), var_0, "tag_origin" );
    wait 0.5;
    playfxontag( common_scripts\utility::getfx( "btr_cannon_impact_burst" ), var_0, "tag_origin" );
    var_0 delete();
}

_id_7C3E()
{
    self endon( "death" );
    var_0 = [ -1, getent( "tag_btr_impact2", "targetname" ), getent( "tag_btr_impact3", "targetname" ), getent( "tag_btr_impact4", "targetname" ), getent( "tag_btr_impact5", "targetname" ), getent( "tag_btr_impact6", "targetname" ), getent( "tag_btr_impact7", "targetname" ), getent( "tag_btr_impact8", "targetname" ) ];
    var_0 = maps\_utility::array_remove_index( var_0, 0 );
    var_1 = self.mgturret[0];
    var_1 setmode( "manual" );
    var_2 = randomintrange( 8, 21 );

    while ( isdefined( self ) )
    {
        for ( var_3 = 1; var_3 < 8; var_3++ )
        {
            var_1 startfiring();

            for ( var_4 = 0; var_4 < var_2; var_4++ )
            {
                self setturrettargetent( var_0[var_3], _id_5F9E::_id_5F41( 5, 25 ) );
                var_1 settargetentity( var_0[var_3] );
                level thread _id_7C40( var_0[var_3] );
                self waittill( "turret_on_target" );
                self fireweapon();
                wait 0.1;
            }

            level notify( "LISTEN_defend_btr_stop_impact_fx" );
            var_1 stopfiring();
            wait(randomfloatrange( 1.0, 1.5 ));
        }
    }

    foreach ( var_6 in var_0 )
        var_6 delete();
}

_id_7C3F()
{
    var_0 = common_scripts\utility::getstruct( "rpg_start1", "targetname" );
    var_1 = spawn( "script_origin", var_0.origin );
    thread _id_5FCE( var_1 );
    var_2 = getent( "tag_btr_impact1", "targetname" );
    level thread _id_7C40( var_2 );
    wait 0.5;
    common_scripts\utility::flag_set( "kill_resist_window" );
    common_scripts\utility::exploder( 830 );
}

_id_7C40( var_0 )
{
    level endon( "LISTEN_defend_btr_stop_impact_fx" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "btr_cannon_impact_burst" ), var_0, "tag_origin" );
        wait 2;
    }
}

_id_7C41()
{
    var_0 = getent( "suv_flank", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( ::_id_7C42 );
    var_1 = getentarray( "passenger_side", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_7C46 );
    var_2 = getentarray( "driver_side", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_7C47 );
    common_scripts\utility::flag_wait( "btr_on_court" );
    var_3 = getent( "triggervehicle_flanker_suv", "targetname" );
    var_3 notify( "trigger" );
}

_id_7C42()
{
    self endon( "death" );
    thread _id_7C43();
    thread _id_7C44();
    thread _id_7C45();
    self waittill( "reached_end_node" );
    wait 1.0;
    maps\_vehicle::_id_2514( "passenger_side" );
    self waittill( "unloaded" );
    common_scripts\utility::flag_set( "suv_flank_unloaded" );
    wait 3.0;
    var_0 = getvehiclenode( "tennis_reverse", "targetname" );
    self attachpath( var_0 );
    self.veh_transmission = "reverse";
    maps\_vehicle::_id_2AA8();
    self waittill( "reached_end_node" );
    wait 0.5;
    var_1 = getvehiclenode( "tennis_forward", "targetname" );
    self attachpath( var_1 );
    self.veh_transmission = "forward";
    maps\_vehicle::_id_2AA7();
    self waittill( "reached_end_node" );
    wait 1;
    maps\_vehicle::_id_2514();
    self waittill( "unloaded" );
    common_scripts\utility::flag_set( "suv_final_unloaded" );
}

_id_7C43()
{
    self endon( "death" );
    var_0 = self._id_2189 * 0.5;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( _id_5F9E::_id_5F0D( var_5, "MOD_GRENADE" ) )
        {
            var_6 = ( 0.0, 0.0, 0.0 );

            if ( isdefined( var_2 ) )
                var_6 = var_2.origin;

            self dodamage( var_0, var_6 );
        }
    }
}

_id_7C44()
{
    level endon( "suv_flank_unloaded" );
    self waittill( "death" );
    common_scripts\utility::flag_set( "suv_flank_unloaded" );
}

_id_7C45()
{
    self endon( "death" );
    var_0 = getvehiclenode( "start_safe1", "targetname" );
    var_0 waittill( "trigger" );
    self setcandamage( 0 );
    var_0 = getvehiclenode( "end_safe1", "targetname" );
    var_0 waittill( "trigger" );
    self setcandamage( 1 );
    var_0 = getvehiclenode( "start_safe2", "targetname" );
    var_0 waittill( "trigger" );
    self setcandamage( 0 );
    var_0 = getvehiclenode( "end_safe2", "targetname" );
    var_0 waittill( "trigger" );
    self setcandamage( 1 );
}

_id_7C46()
{
    self endon( "death" );
    self.goalradius = 32;
    self._id_1032 = "enemy";
    self._id_117F = 1;
    common_scripts\utility::flag_wait( "suv_flank_unloaded" );
    thread _id_7C74( 5 );
    self waittill( "goal" );
    self._id_117F = 0;
    var_0 = getent( "vol_price_defend", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7C47()
{
    self endon( "death" );
    self.ignoresuppression = 1;
    self.goalradius = 32;
    common_scripts\utility::flag_wait( "suv_final_unloaded" );
    var_0 = getent( "vol_price_defend", "targetname" );
    self setgoalvolumeauto( var_0 );
    self waittill( "goal" );
    self.ignoresuppression = 0;
}

_id_7C48()
{
    var_0 = getent( "fxanim_prague2_lion_statue_mod", "targetname" );
    var_0 show();
    var_1 = getent( "ctl_statue_lion_stone", "targetname" );
    var_1 delete();
    wait 1;
    var_2 = getent( "tag_lion_statue", "targetname" );
    playfxontag( common_scripts\utility::getfx( "lion_statue_dest" ), var_2, "tag_origin" );
    var_0 useanimtree( level._id_1245["script_model"] );
    var_0._id_1032 = "lion";
    var_0 maps\_anim::_id_1246( var_0, "lion_statue_destroy" );
}

_id_7C49()
{
    var_0 = [ common_scripts\utility::getstruct( "resist_rpg1", "targetname" ), common_scripts\utility::getstruct( "resist_rpg2", "targetname" ), common_scripts\utility::getstruct( "molotov_start2", "targetname" ), common_scripts\utility::getstruct( "molotov_start1", "targetname" ) ];
    magicbullet( "rpg_straight", var_0[0].origin, self.origin + ( 250.0, 150.0, 200.0 ) );
    wait 1;
    magicbullet( "rpg_straight", var_0[0].origin, self.origin + ( -100.0, 0.0, -150.0 ) );
    wait 1.5;
    magicbullet( "rpg_straight", var_0[0].origin, self.origin + ( 0.0, 0.0, 150.0 ) );
    wait 1;
    magicbullet( "rpg_straight", var_0[0].origin, self.origin + ( 0.0, 150.0, 80.0 ) );
    common_scripts\utility::flag_set( "resistance_attacks" );
}

_id_7C4A()
{
    var_0 = maps\_utility::_id_1BF9( "resist_gunfire", "targetname" );

    foreach ( var_2 in var_0 )
    {
        thread _id_7C4B( var_2 );
        thread _id_7C4C( var_2 );
    }
}

_id_7C4B( var_0 )
{
    common_scripts\utility::flag_wait( "resistance_attacks" );
    wait(randomfloatrange( 0.1, 1.3 ));
    var_1 = [ "ak47", "ak74u", "m4m203_reflex", "g36c", "pecheneg" ];

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        var_2 = getaiarray( "axis" );

        if ( var_2.size )
        {
            var_3 = var_2[randomint( var_2.size )];
            var_4 = var_1[randomint( var_1.size )];
            var_5 = randomintrange( 3, 9 );

            for ( var_6 = 0; var_6 < var_5; var_6++ )
            {
                if ( isdefined( var_3 ) )
                {
                    var_7 = _id_5F9E::_id_5F42( -40, 40 );
                    magicbullet( var_4, var_0.origin, var_3.origin + var_7 );

                    if ( common_scripts\utility::cointoss() )
                        bullettracer( var_0.origin, var_3.origin + var_7, 1 );

                    wait 0.2;
                }
            }
        }

        wait(randomintrange( 2, 5 ));
    }
}

_id_7C4C( var_0 )
{
    level endon( "in_safehouse" );
    wait(randomfloatrange( 2.0, 6.0 ));

    while ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        var_1 = getaiarray( "axis" );

        if ( var_1.size )
        {
            var_2 = var_1[randomint( var_1.size )];

            if ( isdefined( var_2 ) && isalive( var_2 ) )
                magicgrenade( "fraggrenade", var_0.origin, var_2.origin + _id_5F9E::_id_5F42( -40, 40 ) );

            wait(randomfloatrange( 5.0, 8.0 ));
        }

        wait 0.05;
    }
}

_id_7C4D()
{
    maps\_utility::_id_168C( "presc_pri_headforthat" );
    common_scripts\utility::flag_wait( "chasers" );
    wait 1;
    maps\_utility::_id_168C( "presc_pri_behindus" );
    wait 0.5;
    maps\_utility::_id_265B( "allies" );
    level._id_4877 maps\_utility::_id_265E( "taskforce" );
    maps\_utility::_id_168C( "presc_pri_coveroursix" );
    wait 4;
    common_scripts\utility::flag_wait( "uazs_arrive" );
    maps\_utility::_id_168C( "presc_pri_uazreinforce" );
    wait 5;
    maps\_utility::_id_168C( "presc_pri_therestoomany" );
    common_scripts\utility::flag_wait( "btr_arrives" );
    common_scripts\utility::flag_wait( "FLAG_defend_btr_knocks_down_fence" );
    maps\_utility::_id_168C( "presc_pri_itstheresistance2" );
    wait 1;
    maps\_utility::_id_168C( "presc_pri_holdemback" );
    common_scripts\utility::flag_wait( "resistance_attacks" );
    wait 1;
    maps\_utility::_id_168C( "presc_pri_movesoap" );
    common_scripts\utility::flag_wait( "price_soap_leaving" );
    maps\_utility::_id_168C( "presc_pri_helphim" );
    common_scripts\utility::flag_wait( "soap_pickedup" );
    thread _id_7C4E();
    wait 3;
    maps\_utility::_id_168C( "presc_pri_wereleaving" );
    wait 7;
    maps\_utility::_id_168C( "presc_pri_gethimontable" );
}

_id_7C4E()
{
    level endon( "in_safehouse" );
    maps\_utility::_id_168C( "presc_pri_letsgoletsgo" );
    var_0 = 500;
    var_1 = 0;

    while ( !common_scripts\utility::flag( "in_safehouse" ) )
    {
        if ( _id_5F9E::_id_5F13( level.player, level._id_54E0, var_0 ) )
        {
            var_2 = randomint( 3 );

            if ( var_2 != var_1 )
            {
                switch ( var_2 )
                {
                    case 0:
                        maps\_utility::_id_168C( "presc_pri_yurimoveyour" );
                        break;
                    case 1:
                        maps\_utility::_id_168C( "presc_pri_yurigetoverhere2" );
                        break;
                    case 2:
                        maps\_utility::_id_168C( "presc_pri_keepup" );
                        break;
                }

                var_1 = var_2;
                wait(randomfloatrange( 4.0, 5.5 ));
            }
        }

        wait 0.1;
    }
}

_id_7C4F()
{
    common_scripts\utility::flag_wait( "soap_on_table" );
    var_0 = getent( "trigger_in_safehouse", "targetname" );

    while ( !level.player istouching( var_0 ) )
        wait 0.05;

    common_scripts\utility::flag_set( "in_safehouse" );
}

_id_7C50()
{
    var_0 = common_scripts\utility::array_combine( getentarray( "court_chaser", "targetname" ), getentarray( "court_chaser_bank", "targetname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "court_chaser_backup", "targetname" ) );
    var_1 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mantleB" ] );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::_id_7BAE, "court_mantle_B" );
    var_2 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mantleC" ] );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::_id_7BAE, "court_mantle_C" );
    var_3 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mantleD" ] );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::_id_7BAE, "court_mantle_D" );
    var_4 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mantleE" ] );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::_id_7BAE, "court_mantle_E" );
    var_5 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mantleF" ] );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::_id_7BAE, "court_mantle_F" );
    var_6 = _id_5F9E::_id_5F02( var_0, [ "script_noteworthy" ], [ "mantleG" ] );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::_id_7BAE, "court_mantle_G" );
    var_7 = getentarray( "uaz_team_alpha", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::_id_7C51, "alpha" );
    var_8 = getentarray( "uaz_team_bravo", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, ::_id_7C51, "bravo" );
    var_9 = getent( "tactical_alley_cover", "targetname" );
    var_9 thread maps\_utility::add_spawn_function( ::_id_7BCF );
    var_10 = getent( "tactical_alley_backup", "targetname" );
    var_10 thread maps\_utility::add_spawn_function( ::_id_7C53 );
    var_11 = getentarray( "tactical_alley", "targetname" );
    common_scripts\utility::array_thread( var_11, maps\_utility::add_spawn_function, ::_id_7C54 );
    var_12 = getent( "alley_sprinter", "script_noteworthy" );
    var_12 thread maps\_utility::add_spawn_function( ::_id_7C55 );
    var_13 = getentarray( "flanker_alley", "targetname" );
    common_scripts\utility::array_thread( var_13, maps\_utility::add_spawn_function, ::_id_7C56 );
    var_14 = getentarray( "flanker_tunnel", "targetname" );
    common_scripts\utility::array_thread( var_14, maps\_utility::add_spawn_function, ::_id_7C57 );
    var_15 = getentarray( "flanker_bank", "targetname" );
    common_scripts\utility::array_thread( var_15, maps\_utility::add_spawn_function, ::_id_7C58 );
    var_16 = getentarray( "flanker_runner", "targetname" );
    common_scripts\utility::array_thread( var_16, maps\_utility::add_spawn_function, ::_id_7C5A );
    var_17 = getent( "flanker_tennis_point", "targetname" );
    var_17 thread maps\_utility::add_spawn_function( ::_id_7C5B );
    var_18 = getent( "flanker_tennis_fencer", "targetname" );
    var_18 thread maps\_utility::add_spawn_function( ::_id_7C5C );
    var_19 = getentarray( "flanker_tennis", "targetname" );
    common_scripts\utility::array_thread( var_19, maps\_utility::add_spawn_function, ::_id_7C5D );
    var_20 = getentarray( "flanker_tennis_backup", "targetname" );
    common_scripts\utility::array_thread( var_20, maps\_utility::add_spawn_function, ::_id_7C5E );
    var_21 = getentarray( "flanker_recreation", "targetname" );
    common_scripts\utility::array_thread( var_21, maps\_utility::add_spawn_function, ::_id_7C5F );
    var_22 = getentarray( "spawner_rec", "targetname" );
    common_scripts\utility::array_thread( var_22, maps\_utility::add_spawn_function, ::_id_7C60 );
    var_23 = getent( "resistance_victim", "targetname" );
    var_23 maps\_utility::add_spawn_function( ::_id_7C61 );
    var_24 = getentarray( "resistance_soldier", "targetname" );
    common_scripts\utility::array_thread( var_24, maps\_utility::add_spawn_function, ::_id_7C64 );
    var_25 = getent( "resist_door_guard", "targetname" );
    var_25 maps\_utility::add_spawn_function( ::_id_7C65 );
    var_26 = getentarray( "resistance_window", "targetname" );
    common_scripts\utility::array_thread( var_26, maps\_utility::add_spawn_function, ::_id_7C66 );
    var_27 = getent( "resistance_medic1", "targetname" );
    var_27 maps\_utility::add_spawn_function( ::_id_7C67, "resistance1" );
    var_28 = getent( "resistance_medic2", "targetname" );
    var_28 maps\_utility::add_spawn_function( ::_id_7C67, "resistance2" );
    var_29 = getent( "resistance_medic3", "targetname" );
    var_29 maps\_utility::add_spawn_function( ::_id_7C67, "resistance3" );
    var_30 = getent( "resistance_medic4", "targetname" );
    var_30 maps\_utility::add_spawn_function( ::_id_7C67, "resistance4" );
    var_31 = getent( "resistance_leader", "targetname" );
    var_31 maps\_utility::add_spawn_function( ::_id_7C68 );
    var_32 = getentarray( "resistance_guard", "targetname" );
    common_scripts\utility::array_thread( var_32, maps\_utility::add_spawn_function, ::_id_7C69 );
}

_id_7BAE( var_0 )
{
    self endon( "death" );
    self.goalradius = 32;
    self.ignoresuppression = 1;
    self.allowdeath = 1;
    self._id_1032 = "enemy";
    self._id_0D31 = 1;
    thread _id_7C74( 5 );
    var_1 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_1 maps\_anim::_id_124A( self, var_0 );
    var_1 maps\_anim::_id_1246( self, var_0 );
    var_2 = getent( "vol_court", "targetname" );
    self setgoalvolumeauto( var_2 );
    self waittill( "goal" );
    self.ignoresuppression = 0;
}

_id_7C51( var_0 )
{
    var_0 = common_scripts\utility::ter_op( isdefined( var_0 ), var_0, "alpha" );
    self endon( "death" );
    self endon( "disperse" );
    thread _id_7C52( var_0 );
    self.ignoresuppression = 1;
    self.allowdeath = 1;
    self._id_1032 = "enemy";
    self._id_0D31 = 1;
    var_1 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_2 = getent( "vol_" + var_0 + "_midcourt", "targetname" );
    var_3 = getent( "vol_" + var_0 + "_sideline", "targetname" );
    var_4 = self._id_251B;
    var_5 = [ "E", "C", "B", "D" ];
    common_scripts\utility::flag_wait( "uaz2_unloaded" );
    var_1 maps\_anim::_id_124A( self, "court_mantle_" + var_5[var_4] );
    var_1 maps\_anim::_id_1246( self, "court_mantle_" + var_5[var_4] );
    maps\_utility::_id_26E3( "on" );
    self.goalradius = 32;
    self setgoalvolumeauto( var_2 );
    self waittill( "goal" );
    self setgoalvolumeauto( var_3 );
    common_scripts\utility::flag_wait( "advance_done" );
    maps\_utility::_id_26E3( "off" );
    self.ignoresuppression = 0;
    var_6 = getent( "vol_defend", "targetname" );
    self setgoalvolumeauto( var_6 );
}

_id_7C52( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_263B( "group_" + var_0, 2 );
    self notify( "disperse" );
    maps\_utility::_id_26E3( "off" );
    self.ignoresuppression = 0;
    var_1 = getent( "vol_alley", "targetname" );
    self setgoalvolumeauto( var_1 );
}

_id_7BCF()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.goalradius = 32;
    self._id_0D31 = 1;
    thread maps\prague_escape_code::_id_6215( "enter_alley" );
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_C" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_C" );
    var_1 = getnode( self.script_noteworthy, "targetname" );
    self setgoalnode( var_1 );
    common_scripts\utility::flag_set( "enter_alley" );
    self waittill( "goal" );
    self.fixednode = 1;
    common_scripts\utility::flag_wait( "start_runners" );
    wait 3.0;
    self.fixednode = 0;
    var_2 = getent( "vol_alley", "targetname" );
    self setgoalvolumeauto( var_2 );
}

_id_7C53()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    self.goalradius = 16;
    self._id_0D31 = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_C" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_C" );
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    self.fixednode = 1;
    common_scripts\utility::flag_wait( "start_runners" );
    wait 3.5;
    self.fixednode = 0;
    var_2 = getent( "vol_alley", "targetname" );
    self setgoalvolumeauto( var_2 );
}

_id_7C54()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    self.ignoresuppression = 1;
    self._id_117F = 1;
    self._id_0D31 = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_C" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_C" );
    self._id_117F = 0;
    self.goalradius = 32;
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    self.ignoresuppression = 0;
    common_scripts\utility::flag_wait( "start_runners" );
    var_2 = getent( "vol_alley", "targetname" );
    self setgoalvolumeauto( var_2 );
}

_id_7C55()
{
    self endon( "death" );
    thread _id_7C74( 7 );
}

_id_7C56()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_C" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_C" );
    var_1 = getent( "vol_alley", "targetname" );
    self setgoalvolumeauto( var_1 );
    _id_7C59();
}

_id_7C57()
{
    self endon( "death" );
    var_0 = getent( "vol_court", "targetname" );
    self setgoalvolumeauto( var_0 );
    _id_7C59();
}

_id_7C58()
{
    self endon( "death" );
    var_0 = getent( "vol_court", "targetname" );
    self setgoalvolumeauto( var_0 );
    _id_7C59();
}

_id_7C59()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "btr_on_court" );
    wait(randomfloatrange( 3.0, 5.0 ));
    self cleargoalvolume();
    var_0 = getent( "vol_defend", "targetname" );
    self setgoalvolumeauto( var_0 );
}

_id_7C5A()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self._id_117F = 1;
    self.ignoresuppression = 1;
    thread _id_7C74( 10 );
    self waittill( "goal" );
    var_0 = getent( "vol_runner", "targetname" );
    self setgoalvolumeauto( var_0 );
    self waittill( "goal" );
    self._id_117F = 0;
    self.ignoresuppression = 0;
    var_1 = getent( "vol_right_flank", "targetname" );
    self setgoalvolumeauto( var_1 );
    self waittill( "goal" );
}

_id_7C5B()
{
    self endon( "death" );
    self.goalradius = 32;
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_A" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_A" );
    thread _id_7C74( 5 );
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    wait 6.0;
    var_2 = getent( "vol_right_flank", "targetname" );
    self setgoalvolumeauto( var_2 );
}

_id_7C5C()
{
    self endon( "death" );
    self.goalradius = 32;
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_B" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_B" );
    thread _id_7C74( 5 );
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    var_0 maps\_anim::_id_124A( self, "fence_traverse" );
    var_0 maps\_anim::_id_1246( self, "fence_traverse" );
    var_2 = getent( "vol_court", "targetname" );
    self setgoalvolumeauto( var_2 );
}

_id_7C5D()
{
    self endon( "death" );
    self.goalradius = 32;
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    self._id_117F = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_A" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_A" );
    thread _id_7C74( 5 );
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    self._id_117F = 0;
    var_2 = getent( "vol_right_flank", "targetname" );
    self setgoalvolumeauto( var_2 );
    _id_7C59();
}

_id_7C5E()
{
    self endon( "death" );
    self._id_1032 = "enemy";
    self.allowdeath = 1;
    var_0 = common_scripts\utility::getstruct( "anim_align_basketball", "targetname" );
    var_0 maps\_anim::_id_124A( self, "box_traverse_A" );
    var_0 maps\_anim::_id_1246( self, "box_traverse_A" );
    thread _id_7C74( 5 );
    self.goalradius = 32;
    var_1 = getnode( self.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    maps\_utility::_id_2718();
    wait 3.0;
    maps\_utility::_id_2719();
    thread _id_7C74( 5 );
    var_2 = getent( "vol_rec", "targetname" );
    self setgoalvolumeauto( var_2 );
    self waittill( "goal" );
    self cleargoalvolume();
    var_3 = getent( "vol_court", "targetname" );
    self setgoalvolumeauto( var_3 );
}

_id_7C5F()
{
    self endon( "death" );
    self.goalradius = 32;
    self waittill( "goal" );
    maps\_utility::_id_2718();
    wait(randomfloatrange( 2.0, 4.0 ));
    maps\_utility::_id_2719();
    var_0 = getent( "vol_court", "targetname" );
    self setgoalvolumeauto( var_0 );
    _id_7C59();
}

_id_7C60()
{
    self endon( "death" );
    var_0 = getent( "vol_right_flank", "targetname" );
    self setgoalvolumeauto( var_0 );
    _id_7C59();
}

_id_7C61()
{
    self endon( "death" );
    self._id_1032 = "btr_victim";
    common_scripts\utility::flag_wait( "kill_resist_window" );
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    self._id_0D45 = ::_id_7C63;
    var_0 maps\_anim::_id_1246( self, "death_window" );
}

_id_7C62( var_0 )
{
    var_0.allowdeath = 1;
    var_0 kill();
}

_id_7C63()
{
    self startragdoll();
    wait 0.05;
}

_id_7C64()
{
    self endon( "death" );
    thread maps\_utility::_id_0D04( 1 );
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    maps\_utility::_id_1902();
    self delete();
}

_id_7C65()
{
    self endon( "death" );
    self.goalradius = 32;
    self.ignoresuppression = 1;
    thread maps\_utility::_id_0D04( 1 );
    self waittill( "goal" );
    maps\_utility::_id_2718();
    self.ignoresuppression = 0;
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    self delete();
}

_id_7C66()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    self delete();
}

_id_7C67( var_0 )
{
    self endon( "death" );
    thread maps\_utility::_id_0D04( 1 );
    self._id_1032 = var_0;

    if ( issubstr( var_0, "4" ) )
        return;

    self.goalradius = 32;
    self.ignoresuppression = 1;
    maps\_utility::_id_2612( 1 );
    common_scripts\utility::flag_wait( "resistance_arrival" );
    self waittill( "goal" );
    self.ignoresuppression = 0;
    maps\_utility::_id_2612( 0 );
    common_scripts\utility::flag_wait( "resistance_mortal" );
    maps\_utility::_id_1902();
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    self delete();
}

_id_7C68()
{
    thread maps\_utility::_id_0D04( 1 );
    self._id_1032 = "resistance_leader";
}

_id_7C69()
{
    self endon( "death" );
    self._id_2130 = "heat";
    self.goalradius = 32;
    thread maps\_utility::_id_0D04( 1 );
    self waittill( "goal" );
    maps\_utility::_id_2718();
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    maps\_utility::_id_2719();
    var_0 = getent( "vol_defend", "targetname" );
    self setgoalvolumeauto( var_0 );
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "FLAG_soap_death_close_door_to_defend" );
    self delete();
}

_id_7C6A()
{
    var_0 = common_scripts\utility::getstruct( "struct_chaser_bullets", "targetname" );
    wait 1.0;

    for ( var_1 = 0; var_1 < 16; var_1++ )
    {
        var_2 = ( randomfloatrange( 30.0, 50.0 ), randomfloatrange( 20.0, 80.0 ), randomfloatrange( -20.0, 72.0 ) );
        var_3 = level.player.origin;
        magicbullet( "ak47", var_0.origin, var_3 + var_2 );
        bullettracer( var_0.origin, var_3 + var_2, 1 );
        wait 0.3;
    }
}

_id_7C6B()
{
    var_0 = common_scripts\utility::getstruct( "struct_chaser_bullets", "targetname" );
    var_1 = maps\_utility::_id_283B( "court_barrel", "targetname" );
    common_scripts\utility::flag_wait( "explode_court_barrel" );

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        magicbullet( "ak47", var_0.origin, var_1.origin );
        bullettracer( var_0.origin, var_1.origin, 1 );
        wait 0.1;
    }

    radiusdamage( var_1.origin, 40, 500, 400 );
}

_id_7C6C( var_0, var_1 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( var_1 );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    wait 0.1;
    self.goalradius = 32;
}

_id_7C6D()
{
    wait 0.6;
    common_scripts\utility::exploder( 860 );
}

_id_7C6E()
{
    wait 0.4;
    common_scripts\utility::exploder( 861 );
}

_id_5FCE( var_0 )
{
    self endon( "death" );
    self endon( "kill_resist_window" );
    self clearturrettarget();
    self setturrettargetent( var_0 );

    for (;;)
    {
        self fireweapon();
        wait 0.1;
    }
}

_id_7C6F()
{
    common_scripts\utility::exploder( 850 );
    wait 2.0;
    common_scripts\utility::exploder( 851 );
    wait 2.0;
    common_scripts\utility::exploder( 852 );
    wait 2.0;
    common_scripts\utility::exploder( 853 );
    wait 2.0;
    common_scripts\utility::exploder( 854 );
    wait 2.0;
    common_scripts\utility::exploder( 855 );
    wait 2.0;
    common_scripts\utility::exploder( 856 );
    wait 2.0;
    common_scripts\utility::exploder( 857 );
}

_id_7C70()
{
    var_0 = getent( "esc_shutter01_left", "targetname" );
    var_1 = getent( "esc_shutter01_right", "targetname" );
    var_2 = getent( "esc_shutter02_left", "targetname" );
    var_3 = getent( "esc_shutter02_right", "targetname" );
    var_4 = getent( "esc_shutter03_left", "targetname" );
    var_5 = getent( "esc_shutter03_right", "targetname" );
    var_6 = getent( "esc_shutter05_left", "targetname" );
    var_7 = getent( "esc_shutter05_right", "targetname" );
    var_8 = getent( "esc_shutter06_left", "targetname" );
    var_9 = getent( "esc_shutter06_right", "targetname" );
    var_10 = getent( "esc_shutter08_left", "targetname" );
    var_11 = getent( "esc_shutter08_right", "targetname" );
    var_12 = getent( "esc_shutter09_left", "targetname" );
    var_13 = getent( "esc_shutter09_right", "targetname" );
    var_14 = getent( "esc_shutter10_left", "targetname" );
    var_15 = getent( "esc_shutter10_right", "targetname" );
    var_16 = getent( "esc_shutter11_left", "targetname" );
    var_17 = getent( "esc_shutter11_right", "targetname" );
    var_18 = getent( "esc_shutter12_left", "targetname" );
    var_19 = getent( "esc_shutter12_right", "targetname" );
    var_20 = getent( "esc_shutter14_left", "targetname" );
    var_21 = getent( "esc_shutter14_right", "targetname" );
    var_18 rotateyaw( -150, 0.25 );
    var_19 rotateyaw( 150, 0.25 );
    wait 0.2;
    var_6 rotateyaw( -150, 0.25 );
    var_7 rotateyaw( 150, 0.25 );
    wait 0.1;
    var_0 rotateyaw( -150, 0.25 );
    var_1 rotateyaw( 150, 0.25 );
    wait 0.1;
    var_14 rotateyaw( -150, 0.25 );
    var_15 rotateyaw( 150, 0.25 );
    var_2 rotateyaw( -150, 0.25 );
    var_3 rotateyaw( 150, 0.25 );
    wait 0.2;
    var_12 rotateyaw( -150, 0.25 );
    var_13 rotateyaw( 150, 0.25 );
    var_4 rotateyaw( -150, 0.25 );
    var_5 rotateyaw( 150, 0.25 );
    wait 0.1;
    var_8 rotateyaw( -150, 0.25 );
    var_9 rotateyaw( 150, 0.25 );
    wait 0.2;
    var_10 rotateyaw( -150, 0.25 );
    var_11 rotateyaw( 150, 0.25 );
    var_16 rotateyaw( -150, 0.25 );
    var_17 rotateyaw( 150, 0.25 );
    wait 0.2;
    var_20 rotateyaw( -150, 0.25 );
    var_21 rotateyaw( 150, 0.25 );
    var_22 = getentarray( "resistance_window", "targetname" );
    common_scripts\utility::array_thread( var_22, maps\_utility::_id_166F );
}

_id_7C71()
{
    level endon( "in_safehouse" );
    wait 2;
    var_0 = [];

    for ( var_1 = 1; var_1 <= 5; var_1++ )
        var_0[var_1] = common_scripts\utility::getstruct( "molotov_start" + var_1, "targetname" );

    var_2 = [];

    for ( var_1 = 1; var_1 <= 10; var_1++ )
        var_2[var_1] = common_scripts\utility::getstruct( "molotov_end" + var_1, "targetname" );

    for (;;)
    {
        maps\prague_escape_code::_id_789D( var_0[1], var_2[1] );
        wait(randomfloatrange( 2.0, 3.0 ));
        maps\prague_escape_code::_id_789D( var_0[2], var_2[2] );
        wait(randomfloatrange( 2.0, 3.0 ));
        maps\prague_escape_code::_id_789D( var_0[3], var_2[3] );
        wait(randomfloatrange( 2.0, 4.0 ));
        maps\prague_escape_code::_id_789D( var_0[4], var_2[4] );
        wait(randomfloatrange( 1.5, 3.0 ));
        maps\prague_escape_code::_id_789D( var_0[5], var_2[5] );
        wait(randomfloatrange( 1.5, 3.5 ));
        maps\prague_escape_code::_id_789D( var_0[1], var_2[6] );
        wait(randomfloatrange( 2.0, 5.0 ));
        maps\prague_escape_code::_id_789D( var_0[2], var_2[7] );
        wait(randomfloatrange( 2.0, 3.5 ));
        maps\prague_escape_code::_id_789D( var_0[3], var_2[8] );
        wait(randomfloatrange( 2.0, 4.5 ));
        maps\prague_escape_code::_id_789D( var_0[4], var_2[9] );
        wait(randomfloatrange( 2.5, 5.5 ));
        maps\prague_escape_code::_id_789D( var_0[5], var_2[10] );
        wait(randomfloatrange( 3.5, 5.5 ));
    }
}

_id_7C72()
{
    var_0 = getvehiclenode( "btr_entrance", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "FLAG_defend_btr_knocks_down_fence" );
    wait 0.5;
    thread _id_7C73();
    var_1 = getent( "fxanim_prague2_basketball_court_mod", "targetname" );
    var_1 useanimtree( level._id_1245["script_model"] );
    var_1._id_1032 = "btr_fence";
    var_1 maps\_anim::_id_1246( var_1, "btr_entrance" );
    var_2 = getent( "defend_fence_clip", "targetname" );
    var_2 delete();
    var_3 = getent( "destroyed_fence_clip", "targetname" );
    var_3 common_scripts\utility::trigger_on();
}

_id_7C73()
{
    common_scripts\utility::exploder( 820 );
    wait 0.5;
    common_scripts\utility::exploder( 822 );
}

_id_7C74( var_0 )
{
    self endon( "death" );
    self endon( "end_sprint" );
    thread _id_7C75();
    maps\_utility::_id_26F7( "sprint" );
    self.ignoresuppression = 1;
    wait(var_0);
    self notify( "end_proximity" );
    maps\_utility::_id_140C();
    self.ignoresuppression = 0;
}

_id_7C75()
{
    self endon( "death" );
    self endon( "end_proximity" );

    while ( distance2d( self.origin, level.player.origin ) > 750 )
        wait 0.05;

    self notify( "end_sprint" );
    maps\_utility::_id_140C();
}

_id_7C76()
{
    var_0 = getent( "clip_resist_gate", "targetname" );
    var_1 = getent( "clip_resist_door", "targetname" );
    var_2 = getent( "clip_player_door", "targetname" );
    var_0 connectpaths();
    var_1 connectpaths();
    var_1 common_scripts\utility::trigger_off();
    var_2 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    var_2 common_scripts\utility::trigger_on();
    common_scripts\utility::flag_set( "FLAG_soap_death_close_door_to_defend" );
    var_1 common_scripts\utility::trigger_on();
    var_1 disconnectpaths();
    level._id_7C19 rotateyaw( -82, 0.5 );
}

_id_7C77()
{
    var_0 = getentarray( "clip_court", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 connectpaths();
        var_2 common_scripts\utility::trigger_off();
    }
}

_id_7C78( var_0, var_1 )
{
    level endon( "price_soap_leaving" );
    var_1 = _id_5F9E::_id_5F0F( var_1, 0.05 );
    var_2 = 0;

    while ( !common_scripts\utility::flag( "price_soap_leaving" ) && var_2 < var_1 )
    {
        if ( maps\_utility::_id_1FBD( self geteye(), 0.92 ) && _id_5F9E::_id_5F12( level.player, self, var_0 ) )
            common_scripts\utility::flag_set( "price_soap_leaving" );

        var_2 += 0.1;
        wait 0.1;
    }

    common_scripts\utility::flag_set( "price_soap_leaving" );
}

_id_7C79()
{
    level endon( "price_soap_leaving" );
    var_0 = getent( "trigger_in_safehouse", "targetname" );

    while ( !level.player istouching( var_0 ) )
        wait 0.1;

    level notify( "end_fail_monitor" );
    common_scripts\utility::flag_set( "price_soap_leaving" );
}

_id_7C7A( var_0 )
{
    if ( getaicount( "axis" ) )
        var_0 shoot();
}

_id_7C7B( var_0 )
{
    var_0 animscripts\shared::_id_0C9B( var_0.primaryweapon, "none" );
}

_id_7C7C( var_0 )
{
    var_1 = getent( "price_ak47_defend", "targetname" );
    var_1 delete();
    var_0 maps\_utility::_id_104A( "ak47", "primary" );
}

_id_7C7D()
{
    var_0 = getent( "destroyed_fence_clip", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "bar_door", "targetname" );
    level._id_7C19 = spawn( "script_model", var_1.origin );
    level._id_7C19.angles = var_1.angles;
    level._id_7C19 setmodel( "tag_origin_animate" );
    level._id_7C19._id_1032 = "resistance_door";
    level._id_7C19 useanimtree( level._id_1245["resistance_door"] );
    var_1.origin = level._id_7C19 gettagorigin( "origin_animate_jnt" );
    var_1.angles = level._id_7C19 gettagangles( "origin_animate_jnt" );
    var_1 linkto( level._id_7C19, "origin_animate_jnt" );
    var_2 = getent( "bar_gate", "targetname" );
    level._id_7C18 = spawn( "script_model", var_2.origin );
    level._id_7C18.angles = var_2.angles;
    level._id_7C18 setmodel( "tag_origin_animate" );
    level._id_7C18._id_1032 = "resistance_gate";
    level._id_7C18 useanimtree( level._id_1245["resistance_gate"] );
    var_2.origin = level._id_7C18 gettagorigin( "origin_animate_jnt" );
    var_2.angles = level._id_7C18 gettagangles( "origin_animate_jnt" );
    var_2 linkto( level._id_7C18, "origin_animate_jnt" );
    var_3 = getent( "clip_resist_gate", "targetname" );
    var_3 linkto( var_2 );
    var_4 = getent( "trig_medic_start", "targetname" );
    var_4 common_scripts\utility::trigger_off();
    var_5 = getent( "fxanim_prague2_lion_statue_mod", "targetname" );
    var_5 hide();
    var_6 = getent( "trig_player_bar_door", "targetname" );
    var_6 common_scripts\utility::trigger_off();
    var_7 = getent( "beer1", "targetname" );
    level._id_7C22 = spawn( "script_model", var_7.origin );
    level._id_7C22.angles = var_7.angles;
    level._id_7C22 setmodel( "tag_origin_animate" );
    level._id_7C22._id_1032 = "beer1";
    level._id_7C22 useanimtree( level._id_1245["beer1"] );
    var_7.origin = level._id_7C22 gettagorigin( "origin_animate_jnt" );
    var_7.angles = level._id_7C22 gettagangles( "origin_animate_jnt" );
    var_7 linkto( level._id_7C22, "origin_animate_jnt" );
    var_8 = getent( "beer2", "targetname" );
    level._id_7C23 = spawn( "script_model", var_8.origin );
    level._id_7C23.angles = var_8.angles;
    level._id_7C23 setmodel( "tag_origin_animate" );
    level._id_7C23._id_1032 = "beer2";
    level._id_7C23 useanimtree( level._id_1245["beer2"] );
    var_8.origin = level._id_7C23 gettagorigin( "origin_animate_jnt" );
    var_8.angles = level._id_7C23 gettagangles( "origin_animate_jnt" );
    var_8 linkto( level._id_7C23, "origin_animate_jnt" );
    var_9 = getent( "beer3", "targetname" );
    level._id_7C24 = spawn( "script_model", var_9.origin );
    level._id_7C24.angles = var_9.angles;
    level._id_7C24 setmodel( "tag_origin_animate" );
    level._id_7C24._id_1032 = "beer3";
    level._id_7C24 useanimtree( level._id_1245["beer3"] );
    var_9.origin = level._id_7C24 gettagorigin( "origin_animate_jnt" );
    var_9.angles = level._id_7C24 gettagangles( "origin_animate_jnt" );
    var_9 linkto( level._id_7C24, "origin_animate_jnt" );
    var_10 = getent( "beer4", "targetname" );
    level._id_7C25 = spawn( "script_model", var_10.origin );
    level._id_7C25.angles = var_10.angles;
    level._id_7C25 setmodel( "tag_origin_animate" );
    level._id_7C25._id_1032 = "beer4";
    level._id_7C25 useanimtree( level._id_1245["beer4"] );
    var_10.origin = level._id_7C25 gettagorigin( "origin_animate_jnt" );
    var_10.angles = level._id_7C25 gettagangles( "origin_animate_jnt" );
    var_10 linkto( level._id_7C25, "origin_animate_jnt" );
    var_11 = getent( "cup1", "targetname" );
    level._id_7C26 = spawn( "script_model", var_11.origin );
    level._id_7C26.angles = var_11.angles;
    level._id_7C26 setmodel( "tag_origin_animate" );
    level._id_7C26._id_1032 = "cup1";
    level._id_7C26 useanimtree( level._id_1245["cup1"] );
    var_11.origin = level._id_7C26 gettagorigin( "origin_animate_jnt" );
    var_11.angles = level._id_7C26 gettagangles( "origin_animate_jnt" );
    var_11 linkto( level._id_7C26, "origin_animate_jnt" );
    var_12 = getent( "cup2", "targetname" );
    level._id_7C27 = spawn( "script_model", var_12.origin );
    level._id_7C27.angles = var_12.angles;
    level._id_7C27 setmodel( "tag_origin_animate" );
    level._id_7C27._id_1032 = "cup2";
    level._id_7C27 useanimtree( level._id_1245["cup2"] );
    var_12.origin = level._id_7C27 gettagorigin( "origin_animate_jnt" );
    var_12.angles = level._id_7C27 gettagangles( "origin_animate_jnt" );
    var_12 linkto( level._id_7C27, "origin_animate_jnt" );
    var_13 = getent( "cup3", "targetname" );
    level._id_7C28 = spawn( "script_model", var_13.origin );
    level._id_7C28.angles = var_13.angles;
    level._id_7C28 setmodel( "tag_origin_animate" );
    level._id_7C28._id_1032 = "cup3";
    level._id_7C28 useanimtree( level._id_1245["cup3"] );
    var_13.origin = level._id_7C28 gettagorigin( "origin_animate_jnt" );
    var_13.angles = level._id_7C28 gettagangles( "origin_animate_jnt" );
    var_13 linkto( level._id_7C28, "origin_animate_jnt" );
    var_14 = getent( "wine", "targetname" );
    level._id_7C29 = spawn( "script_model", var_14.origin );
    level._id_7C29.angles = var_14.angles;
    level._id_7C29 setmodel( "tag_origin_animate" );
    level._id_7C29._id_1032 = "wine";
    level._id_7C29 useanimtree( level._id_1245["wine"] );
    var_14.origin = level._id_7C29 gettagorigin( "origin_animate_jnt" );
    var_14.angles = level._id_7C29 gettagangles( "origin_animate_jnt" );
    var_14 linkto( level._id_7C29, "origin_animate_jnt" );
    var_15 = [ getent( "hedge_a_dest01", "targetname" ), getent( "hedge_a_dest02", "targetname" ), getent( "hedge_a_dest03", "targetname" ), getent( "hedge_a_dest04", "targetname" ), getent( "hedge_b_dest01", "targetname" ), getent( "hedge_b_dest02", "targetname" ), getent( "hedge_b_dest03", "targetname" ) ];
    common_scripts\utility::array_call( var_15, ::hide );
    var_16 = [ getent( "crate_destroyed01", "targetname" ), getent( "crate_destroyed02", "targetname" ), getent( "crate_destroyed03", "targetname" ), getent( "crate_destroyed04", "targetname" ), getent( "crate_destroyed05", "targetname" ), getent( "crate_destroyed06", "targetname" ) ];
    common_scripts\utility::array_call( var_16, ::hide );
}

_id_7C7E()
{
    var_0 = [ getent( "trigger_crate_01", "targetname" ), getent( "trigger_crate_02", "targetname" ), getent( "trigger_crate_03", "targetname" ), getent( "trigger_crate_04", "targetname" ), getent( "trigger_crate_05", "targetname" ), getent( "trigger_crate_06", "targetname" ) ];

    foreach ( var_3, var_2 in var_0 )
        var_2 thread _id_7C7F( var_3 + 1 );
}

_id_7C7F( var_0 )
{
    level endon( "in_safehouse" );
    self waittill( "trigger" );
    var_1 = getent( "crate_clean0" + var_0, "targetname" );
    var_2 = getent( "crate_destroyed0" + var_0, "targetname" );
    var_3 = spawn( "script_model", var_2.origin );
    var_3 setmodel( "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "crate_dest" ), var_3, "tag_origin" );
    wait 0.1;
    var_1 delete();
    var_2 show();
    wait 5.0;
    var_3 delete();
}

_id_7C80()
{
    var_0 = [ getent( "hedge_a_01", "targetname" ), getent( "hedge_a_02", "targetname" ), getent( "hedge_a_03", "targetname" ), getent( "hedge_a_04", "targetname" ), getent( "hedge_b_01", "targetname" ), getent( "hedge_b_02", "targetname" ), getent( "hedge_b_03", "targetname" ) ];
    var_0[0] thread _id_7C81( "a", 1 );
    var_0[1] thread _id_7C81( "a", 2 );
    var_0[2] thread _id_7C81( "a", 3 );
    var_0[3] thread _id_7C81( "a", 4 );
    var_0[4] thread _id_7C81( "b", 1 );
    var_0[5] thread _id_7C81( "b", 2 );
    var_0[6] thread _id_7C81( "b", 3 );
}

_id_7C81( var_0, var_1 )
{
    level endon( "in_safehouse" );
    self waittill( "trigger" );
    var_2 = getent( "hedge_" + var_0 + "_clean0" + var_1, "targetname" );
    var_3 = getent( "hedge_" + var_0 + "_dest0" + var_1, "targetname" );
    var_4 = spawn( "script_model", var_3.origin );
    var_4 setmodel( "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "hedge" + var_0 + "_dest" ), var_4, "tag_origin" );
    wait 0.1;
    var_2 delete();
    var_3 show();
    var_5 = getent( "clip_" + var_0 + "_clean0" + var_1, "targetname" );
    var_5 delete();
    wait 5.0;
    var_4 delete();
}

_id_7C82()
{
    common_scripts\utility::flag_wait( "FLAG_soap_death_started" );
    var_0 = [ level._id_4877, level._id_54E0, level._id_7BF0, level._id_7BE3, level._id_7BE2 ];
    _id_5F9E::_id_5EE2( common_scripts\utility::array_remove_array( getaiarray(), var_0 ) );
}
