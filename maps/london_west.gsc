// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

pre_load()
{
    precachestring( &"LONDON_HINT_FLASHBANG" );
    maps\_utility::add_hint_string( "hint_flashbang", &"LONDON_HINT_FLASHBANG", maps\london_west_code::_id_0598 );
    precacheshellshock( "london_gas_nosway" );
    precacheshellshock( "london_gas" );
    precacheshellshock( "london_gas_post" );
    precacheshellshock( "london_explosion" );
    precacheshellshock( "westminster_truck_crash" );
    precacheturret( "heli_spotlight" );
    precacheturret( "player_view_controller_shakeycam" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachemodel( "electronics_camera_pointandshoot_low" );
    precachemodel( "electronics_camera_cellphone_low" );
    precachemodel( "body_sas_urban_smg" );
    precachemodel( "london_injector" );
    precachemodel( "prop_sas_gasmask" );
    precachemodel( "vehicle_uk_delivery_truck_destroyed" );
    precacheitem( "rpg_player" );
    maps\london_west_anim::main();
    maps\_readystand_anims::_id_3E77();
    maps\_drone_ai::init();
    _id_00BA();
    maps\london_west_code::_id_0105();
    common_scripts\utility::flag_init( "train_crashed" );
    common_scripts\utility::flag_init( "escalator_grenade_thrown" );
    common_scripts\utility::flag_init( "start_station_music" );
    common_scripts\utility::flag_init( "start_train_traverse" );
    common_scripts\utility::flag_init( "player_has_flashed" );
    common_scripts\utility::flag_init( "enemy_takedown" );
    common_scripts\utility::flag_init( "truck_spawned" );
    common_scripts\utility::flag_init( "setup_blockade" );
    common_scripts\utility::flag_init( "truck_stopped" );
    common_scripts\utility::flag_init( "truck_hit" );
    common_scripts\utility::flag_init( "truck_explodes" );
    common_scripts\utility::flag_init( "take_down_finished" );
    common_scripts\utility::flag_init( "westminster_entity_cleanup" );
    common_scripts\utility::flag_init( "ending_police_car_stopped" );
    common_scripts\utility::flag_init( "do_innocent" );
    common_scripts\utility::flag_init( "wallcroft_at_stairs" );
}

_id_00BA()
{
    soundsettimescalefactor( "Music", 0 );
    soundsettimescalefactor( "Menu", 0 );
    soundsettimescalefactor( "local3", 0.0 );
    soundsettimescalefactor( "Mission", 0.0 );
    soundsettimescalefactor( "Announcer", 0.0 );
    soundsettimescalefactor( "Bulletimpact", 0.6 );
    soundsettimescalefactor( "Voice", 0.0 );
    soundsettimescalefactor( "effects1", 0.2 );
    soundsettimescalefactor( "effects2", 0.2 );
    soundsettimescalefactor( "local", 0.2 );
    soundsettimescalefactor( "local2", 0.2 );
    soundsettimescalefactor( "physics", 0.2 );
    soundsettimescalefactor( "ambient", 0.5 );
    soundsettimescalefactor( "auto", 0.5 );
}

_id_7ECD()
{
    maps\_utility::_id_27CB( "dead_vendor", maps\london_west_code::_id_0592 );
    maps\_utility::_id_27CB( "remove_fixednode", maps\london_west_code::_id_0589 );
    maps\_utility::_id_27CB( "wait_move_fight", maps\london_west_code::_id_0587 );
    maps\_utility::_id_27CA( "stairs_guys", maps\london_west_code::_id_059A );
    thread maps\_utility::_id_194E( "london_tube_end" );
}

_id_0539()
{

}

_id_053A()
{
    wait 1;
    maps\_utility::_id_11F4( "london_com_doyoucopy" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_burnsalright" );
    maps\_utility::_id_11F4( "london_com_status" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_scrapmetal2" );
    maps\_utility::_id_11F4( "london_com_rendevous" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_nothingwecando" );
}

_id_0480()
{
    maps\london_code::_id_5700( "start_west_station" );
    _id_048B();
}

_id_0481()
{
    maps\london_code::_id_5700( "start_west_ending" );
    _id_048B();
}

_id_0482()
{
    setdvar( "show_wip", "1" );
    maps\london_code::_id_5700( "start_west_ending_stairs" );
    maps\_utility::_id_26BF( "cleared_station_exit" );
    _id_048B();
}

_id_0483()
{
    maps\london_code::_id_5700( "start_west_dad_scene" );
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "reached_station_exit" );
}

_id_0484()
{
    thread maps\_ambient::_id_1946( "london_westminster_ending", level._id_1707 );
}

_id_0485()
{
    maps\london_code::_id_473C();
    level._id_473D.alpha = 1;
    common_scripts\utility::flag_wait( "fade_up" );
    wait 2;
    level._id_473D fadeovertime( 5 );
    level._id_473D.alpha = 0;
    setblur( 5, 0 );
    wait 2;
    setblur( 2, 0.7 );
    wait 0.7;
    setblur( 5, 0.5 );
    wait 0.5;
    setblur( 1, 1 );
    wait 1;
    setblur( 3, 1 );
}

_id_0486()
{
    thread _id_0485();
    common_scripts\utility::flag_set( "fade_up" );
    thread _id_0489();
    thread _id_053A();
    level.player disableweapons();
    var_0 = maps\_utility::_id_1287( "player_rig_tunnel_crash_teleport" );
    level._id_79FD = var_0;
    level._id_79BC = var_0;
    level.player playerlinktodelta( level._id_79BC, "tag_player", 1, 0, 0, 0, 0 );
    thread _id_0487();
    var_1 = common_scripts\utility::getstruct( "train_crash_script_node_damaged_side_player", "targetname" );
    var_1 thread maps\_utility::_id_1255( maps\_anim::_id_1246, level._id_79BC, "train_crash" );
    var_1 thread maps\_utility::_id_1255( common_scripts\utility::flag_set, "train_crashed" );
    var_2 = 0.78;
    var_1 maps\_utility::delaythread( 0.05, maps\_anim::_id_127F, [ level._id_79BC ], "train_crash", var_2 );
    var_3 = common_scripts\utility::getstruct( "train_crash_script_node_damaged_side", "targetname" );
    thread maps\westminster_tunnels::_id_79F9( var_3, 1 );
    thread _id_0488();
    var_4 = getanimlength( var_0 maps\_utility::_id_1281( "train_crash" ) );
    var_4 *= ( 1 - var_2 );
    wait(var_4);
    level._id_79BC delete();
}

_id_0487()
{
    wait 0.5;
    var_0 = 5;
    level.player lerpviewangleclamp( var_0, var_0 * 0.5, var_0 * 0.5, 45, 45, 60, 60 );
}

_id_0488()
{
    common_scripts\utility::flag_wait( "train_crashed" );
    level.player allowsprint( 0 );
    level.player unlink();
    level.player thread maps\_utility::play_sound_on_entity( "breathing_better" );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player.ignoreme = 0;
    level.player allowjump( 0 );
    thread maps\london_code::_id_5717();
    common_scripts\utility::flag_waitopen( "limp" );
    level.player allowsprint( 1 );
    level.player enableweapons();
    level.player allowjump( 1 );
}

_id_0489( var_0 )
{
    level._id_56DE maps\_utility::_id_140C();
    level._id_56DE maps\_utility::_id_109B();
    level._id_56DE maps\_utility::_id_13A4( "b" );
    level._id_56DE.ignoreall = 0;
    var_1 = common_scripts\utility::getstruct( "truck_crash_crawl", "targetname" );
    var_1 thread maps\_anim::_id_11CF( level._id_56DE, "stumble" );
    var_1 maps\_anim::_id_1246( level._id_56DE, "stumble" );
    wait 2;
    common_scripts\utility::flag_set( "start_train_traverse" );
}

_id_048A()
{
    thread maps\london_west_code::_id_05F5();
    common_scripts\utility::flag_wait( "start_train_traverse" );
    thread maps\london_west_code::_id_0593( "wreck_fire_1", 3 );
    thread maps\london_west_code::_id_0593( "wreck_fire_2", 5 );
    thread maps\london_west_code::_id_0593( "wreck_fire_3", 6 );
    maps\london_west_code::_id_0583();
    maps\_utility::_id_265A( "allies" );
    maps\_utility::_id_265A( "axis" );
    var_0 = getentarray( "time_to_move", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\london_west_code::_id_0588 );
    var_0 = getentarray( "delete_enemies_in_volume", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\london_west_code::_id_714A );
    var_0 = getentarray( "grenade_throw", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\london_west_code::_id_058A );
    var_0 = getentarray( "flag_set_when_volume_cleared", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\london_west_code::_id_058B );
    var_0 = getentarray( "vending_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\london_west_code::_id_0594 );
    _id_048B();
    thread maps\london_west_code::_id_05E8();
    thread maps\london_west_code::_id_0527();
    thread maps\london_west_code::_id_05E9();
    thread maps\london_west_code::_id_05F4();
    thread maps\london_west_code::_id_05F0();
    thread _id_048C();
    thread maps\london_west_code::_id_05F3();
    thread maps\london_west_code::_id_05F2();
    thread _id_0496();
    thread _id_0497();
    thread _id_0498();
}

_id_048B()
{
    if ( isdefined( level._id_56DE.init ) )
        return;

    level._id_56DE.init = 1;

    if ( maps\london_code::_id_5712( "west_station" ) )
        level._id_56DE maps\_utility::_id_109B();
    else
        level._id_56DE maps\_utility::_id_0D72( 1 );

    level._id_56DE maps\_utility::_id_140C();
    level._id_56DE maps\_utility::_id_13A4( "b" );
    level._id_56DE.ignoreall = 0;
    level._id_56DE.goalradius = 512;
    level._id_56DE maps\_utility::_id_2194();
    level._id_56DE maps\_utility::_id_1402( "turnstile" );

    if ( maps\_utility::_id_275F( "west_station" ) )
        level._id_56DE maps\_utility::_id_13DC( "turnstile" );
}

_id_048C()
{
    level endon( "dumb_sprinter" );
    common_scripts\utility::flag_wait( "station_reinforcements" );
    _id_048D();
    common_scripts\utility::flag_wait( "approaching_hallway" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_checkcorners2" );
    common_scripts\utility::flag_wait( "watch_for_civilians" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_watchforcivvies" );
    common_scripts\utility::flag_wait( "fallingback_dialogue" );
    _id_048E();
    common_scripts\utility::flag_wait( "cleared_lower_station" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_keeppushing" );
    common_scripts\utility::flag_wait( "escalator1" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_upthestairs" );
    common_scripts\utility::flag_wait( "escalator_grenade_thrown" );
    _id_048F();
    common_scripts\utility::flag_wait( "started_station_exit" );
    _id_0490();
}

_id_048D()
{
    level._id_56DE maps\_utility::_id_168C( "london_ldr_usingthetube" );
    common_scripts\utility::flag_set( "got_contact" );
    maps\_utility::_id_11F4( "london_com_deployteams" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_doubletime" );
    wait 2;
    level._id_56DE maps\_utility::_id_168C( "london_ldr_britishwelcome" );
    level._id_56DE maps\_utility::_id_0D72( 1 );
}

_id_048E()
{
    level._id_56DE maps\_utility::_id_168C( "london_ldr_wheresbackup" );
    maps\_utility::_id_11F4( "london_com_stillenroute" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_stoplarkin" );
}

_id_048F()
{
    level endon( "dumb_sprinter" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_grenade2" );
    wait 5;
    level._id_56DE maps\_utility::_id_168C( "london_ldr_cheekybastards" );
}

_id_0490()
{
    level._id_56DE maps\_utility::_id_168C( "london_ldr_wheresbackup" );
    thread maps\_utility::_id_11F4( "london_com_onscene" );
}

_id_0491()
{
    maps\_utility::_id_27CB( "takedown_spawner", maps\london_west_code::_id_05F6 );

    if ( maps\london_code::_id_5712( "west_ending" ) )
    {
        thread _id_003F();
        thread _id_0499();
    }

    level._id_2985 = maps\london_west_code::_id_052C;
    _id_0493();
    common_scripts\utility::flag_wait( "player_exits_station" );
    level thread maps\london_west_code::_id_0104( "civ" );
    level thread maps\london_west_code::_id_0104( "cop" );
    _id_00BB();
    level.player maps\_utility::_id_2799( 75, 3 );
    thread maps\_utility::_id_11F4( "london_hp2_truckcoming" );
    maps\_vehicle::_id_2A9A( "ending_police_car_1" );
    var_0 = maps\_vehicle::_id_2881( "ending_littlebird_1" );
    var_0 setmaxpitchroll( 35, 50 );
    var_0 setyawspeed( 90, 60 );
    maps\_utility::_id_265A();
    thread maps\london_west_code::_id_056D();
    common_scripts\utility::flag_wait( "setup_blockade" );
    common_scripts\utility::flag_wait( "ending_player_in_position" );
    maps\london_west_code::_id_0570();
    common_scripts\utility::flag_wait( "do_innocent" );
}

_id_00BB()
{
    if ( level._id_56DE.origin[0] < 1800 && level._id_56DE.origin[1] < 1300 )
        return;

    var_0 = getaiarray( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.origin[0] > 2400 )
            var_2 delete();
    }

    level notify( "dumb_sprinter" );
    level._id_56DE notify( "killanimscript" );
    var_4 = getnode( "sas_leader_takedown_hold", "targetname" );
    level._id_56DE forceteleport( var_4.origin, var_4.angles );
    level._id_56DE setgoalpos( var_4.origin );
    level._id_56DE clearenemy();
    level._id_56DE notify( "killanimscript" );
    level._id_56DE notify( "move_interrupt" );
    level._id_56DE maps\_utility::_id_13DC( "turnstile" );
    level._id_56DE maps\_utility::_id_2686();
}

_id_0493()
{
    maps\_utility::_id_27CB( "ending_manstackers", maps\london_west_code::_id_0510 );
    maps\_utility::_id_27CB( "ending_police", maps\london_west_code::_id_050E );
    maps\_utility::_id_27CB( "ending_truck_inspector", maps\london_west_code::_id_0577 );
    maps\_utility::_id_27CB( "sas_blockade_talker", maps\london_west_code::_id_0511 );
    maps\_utility::_id_27CB( "sas_blockade_guy", maps\london_west_code::_id_0512 );
    maps\_utility::_id_27CB( "ending_police_driver", maps\london_west_code::_id_050B );
    maps\_utility::_id_27CB( "ending_police_car", maps\london_west_code::_id_050C );
    var_0 = getentarray( "ending_street_drones", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\london_west_code::_id_0522, maps\london_west_code::_id_0516 );
    thread _id_0495();
}

_id_0494()
{
    for (;;)
    {
        var_0 = maps\_vehicle::_id_2A9A( "ending_chase_vehicles" );
        wait 0.5;

        while ( var_0[0].veh_speed > 0 )
            wait 0.05;

        wait 5;

        if ( isdefined( var_0 ) )
            common_scripts\utility::array_call( var_0, ::delete );
    }
}

_id_0495()
{
    if ( common_scripts\utility::flag( "westminster_entity_cleanup" ) )
        return;

    common_scripts\utility::flag_set( "westminster_entity_cleanup" );
    wait 1;
    var_0 = getentarray( "trigger_multiple", "code_classname" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "trigger_radius", "code_classname" ) );
    var_0 = common_scripts\utility::array_combine( var_0, getspawnerarray() );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_0B54 ) )
            continue;

        if ( var_2.origin[0] > 50000 )
            var_2 delete();
    }
}

_id_0496()
{
    level endon( "dumb_sprinter" );
    common_scripts\utility::flag_wait( "cleared_lower_station" );
    maps\_utility::_id_26BF( "cleared_lower_station" );
}

_id_0497()
{
    level endon( "dumb_sprinter" );
    common_scripts\utility::flag_wait( "cleared_upper_station" );
    maps\_utility::_id_26BF( "cleared_upper_station" );
}

_id_0498()
{
    level endon( "dumb_sprinter" );
    common_scripts\utility::flag_wait( "cleared_station_exit" );
    maps\_utility::_id_26BF( "cleared_station_exit" );
}

_id_0499()
{
    common_scripts\utility::flag_wait( "enemy_takedown" );
    maps\_utility::_id_265A();
    level thread _id_00BD();
    var_0 = common_scripts\utility::getstruct( "fake_kill_origin", "targetname" );

    foreach ( var_2 in level._id_05F7 )
    {
        if ( isdefined( var_2._id_164F ) )
        {
            if ( var_2._id_164F == "keep_alive" )
                continue;
        }

        var_2 maps\_utility::_id_1902();

        if ( var_2.team == "axis" )
            var_2 common_scripts\utility::delaycall( randomfloatrange( 0, 1 ), ::kill, var_0.origin );
    }

    maps\_utility::_id_282C( "take_down_finished", 6 );
    thread maps\london_west_code::_id_05F9( "takedown_anim_node4" );
    thread maps\london_west_code::_id_05F9( "takedown_anim_node3" );
    thread maps\london_west_code::_id_05F9( "takedown_anim_node1" );
}

_id_00BC( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_2 *= var_2;

    while ( distancesquared( var_0.origin, var_1 ) > var_2 )
        wait 0.05;
}

_id_003F()
{
    common_scripts\utility::flag_wait( "started_station_exit" );
    var_0 = getnode( "sas_leader_takedown_hold", "targetname" );
    level._id_56DE maps\_utility::_id_1057();
    level._id_56DE.nododgemove = 1;
    level._id_56DE maps\_utility::_id_2131( 1 );
    _id_00BC( level._id_56DE, var_0.origin, 200 );
    level._id_56DE maps\_utility::_id_1071();
    level._id_56DE maps\_utility::_id_27B9();
    level._id_56DE removeaieventlistener( "gunshot" );
    level._id_56DE removeaieventlistener( "gunshot_teammate" );
    level._id_56DE.nododgemove = 0;
    level._id_56DE.ignoreall = 1;
    level._id_56DE.alertlevel = "noncombat";
    var_0 = getnode( "sas_cleared_station_exit", "targetname" );
    _id_00BC( level._id_56DE, var_0.origin, 340 );
    common_scripts\utility::flag_set( "wallcroft_at_stairs" );
}

_id_00BD()
{
    var_0 = 0;
    wait 2;
    level._id_56DE maps\_utility::_id_168C( "london_ldr_thefuzz" );
    common_scripts\utility::flag_wait( "wallcroft_near_takedown" );
    level._id_56DE maps\_utility::_id_168C( "london_ldr_nicetiming" );
    common_scripts\utility::flag_wait( "wallcroft_at_stairs" );
    var_1 = [];
    var_1[0] = [ "guy", "london_sas1_sir" ];
    var_1[1] = [ "wallcroft", "london_ldr_letsgoburns" ];
    var_2 = 0;

    while ( !common_scripts\utility::flag( "player_exits_station" ) )
    {
        common_scripts\utility::flag_wait( "near_takedown_scene" );

        if ( isdefined( level._id_05F8 ) )
            var_3 = level._id_05F8;
        else
        {
            var_4 = getaiarray( "allies" );
            var_4 = common_scripts\utility::array_remove( var_4, level._id_56DE );
            var_4 = sortbydistance( var_4, level.player.origin );
            var_4 = common_scripts\utility::array_removeundefined( var_4 );
            var_4 = maps\_utility::_id_2672( var_4 );
            var_3 = var_4[0];
        }

        if ( gettime() > var_0 )
        {
            if ( var_1[var_2][0] == "guy" )
                var_3 maps\_utility::_id_26AF( var_1[var_2][1] );
            else
                level._id_56DE maps\_utility::_id_168C( var_1[var_2][1] );

            var_0 = gettime() + 5000 + randomint( 2000 );
            var_2++;
        }

        if ( var_2 == var_1.size )
            var_2 = 0;

        wait 0.05;
    }
}

_id_049A()
{
    var_0 = getent( "big_ben_minute", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_1.angles;
    var_1 delete();
    common_scripts\utility::flag_wait( "the_end" );
    wait 4.5;
    var_0 rotateto( var_2, 0.5, 0.0, 0.5 );
}
