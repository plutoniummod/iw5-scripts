// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

pre_load()
{
    maps\westminster_code::setup_pillar_exploders();
    maps\westminster_tunnels_fx::main();
    maps\london_code::callback( "westminster_anim" );
    precachemodel( "vehicle_uk_utility_truck_objective_tailgate" );
    precachemodel( "vehicle_subway_cart_destructible_lights_off" );
    precachemodel( "vehicle_uk_utility_truck_destructible_nobullets" );
    precacheitem( "mp5" );
    precacherumble( "steady_rumble" );
    precacheitem( "nosound_magicbullet" );
    precacheshellshock( "westminster_truck_crash" );
    maps\_utility::add_hint_string( "truck_move", &"PLATFORM_HINT_MOVEONTRUCK", maps\westminster_code::player_pushes_stick_for_a_bit );
}

init_tunnels()
{
    var_0 = getentarray( "hero_light_me", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            var_2 maps\_utility::add_spawn_function( maps\westminster_code::setup_subway_cart_enemy );
    }

    var_4 = getentarray( "train_one_flyby_1", "script_noteworthy" );

    foreach ( var_6 in var_4 )
    {
        if ( isspawner( var_6 ) )
        {
            var_6 maps\_utility::add_spawn_function( maps\westminster_code::train_one_flyby_1_spawn );
            continue;
        }

        var_6 thread maps\westminster_code::train_one_flyby_1_spawn();
    }

    var_8 = getentarray( "train_one_flyby_2", "script_noteworthy" );

    foreach ( var_6 in var_8 )
    {
        if ( isspawner( var_6 ) )
        {
            var_6 maps\_utility::add_spawn_function( maps\westminster_code::train_one_flyby_2_spawn );
            continue;
        }

        var_6 thread maps\westminster_code::train_one_flyby_2_spawn();
    }

    maps\_utility::_id_27CA( "trainride_littlebird_spawner1", maps\westminster_code::_id_79C7 );
    var_11 = getent( "train_goes", "targetname" );
    thread maps\_utility::_id_2633( var_11, "train_goes" );
    var_11 = getent( "truck_load_use_trigger", "targetname" );
    var_11 usetriggerrequirelookat();
    var_11 sethintstring( &"LONDON_HINT_TRUCK_GETIN" );
    var_11 thread truck_trigger_by_jump();
    var_11 thread truck_trigger_by_use();
    var_12 = getvehiclenodearray( "vehicle_start_point", "script_noteworthy" );
    common_scripts\utility::array_thread( var_12, maps\_utility::_id_2830, maps\westminster_code::_id_79CA );
    var_13 = getvehiclenode( "train_civilians_go", "script_noteworthy" );
    var_13 thread maps\westminster_code::_id_79A8();
    var_14 = getentarray( "script_vehicle_subway_engine_destructible", "classname" );

    foreach ( var_6 in var_14 )
    {
        if ( isspawner( var_6 ) )
        {
            var_6 maps\_utility::add_spawn_function( maps\westminster_code::_id_7983 );
            var_6 maps\_utility::add_spawn_function( maps\_utility::_id_12E2, maps\westminster_code::_id_79D2 );
            var_6 maps\_utility::add_spawn_function( maps\westminster_code::_id_7982 );
            continue;
        }

        var_6 thread maps\westminster_code::_id_7982();
        var_6 maps\_utility::_id_12E2( maps\westminster_code::_id_79D2 );
        var_6 maps\westminster_code::_id_7983();
        var_6 maps\westminster_code::_id_797D();
    }

    var_14 = getentarray( "script_vehicle_subway_cart_destructible", "classname" );

    foreach ( var_6 in var_14 )
    {
        if ( isspawner( var_6 ) )
        {
            var_6 maps\_utility::add_spawn_function( maps\westminster_code::_id_7983 );
            var_6 maps\_utility::add_spawn_function( maps\_utility::_id_12E2, maps\westminster_code::_id_79D2 );
            continue;
        }

        var_6 maps\_utility::_id_12E2( maps\westminster_code::_id_79D2 );
        var_6 maps\westminster_code::_id_7983();
    }

    var_19 = getvehiclenodearray( "veh_node_player_truck_spot_on", "script_noteworthy" );
    common_scripts\utility::array_thread( var_19, maps\_utility::_id_2830, maps\westminster_code::_id_797C );
    var_20 = [];
    var_20[var_20.size] = "spawn_train_guys";
    var_20[var_20.size] = "spawn_train_door_guys";

    foreach ( var_22 in var_20 )
        common_scripts\utility::array_thread( getvehiclenodearray( var_22, "script_noteworthy" ), maps\westminster_code::_id_7993 );

    var_24 = [];
    var_24[var_24.size] = "switch_door_guys";

    foreach ( var_22 in var_24 )
        common_scripts\utility::array_thread( getvehiclenodearray( var_22, "script_noteworthy" ), maps\westminster_code::_id_798C );

    var_27 = getvehiclenode( "vehicle_node_car_crash", "script_noteworthy" );
    var_27 thread maps\westminster_code::_id_79A7();
    maps\westminster_code::_id_7987();
    var_28 = getvehiclenodearray( "radio_sound_node", "script_noteworthy" );
    common_scripts\utility::array_thread( var_28, maps\_utility::_id_2830, maps\westminster_code::_id_79C4 );
    var_29 = getvehiclenode( "vehicle_node_civs_cleanup", "script_noteworthy" );
    var_29 maps\_utility::_id_2830( maps\westminster_code::_id_79C1 );
    var_30 = getvehiclenode( "vehicle_node_player_fast_detour_start", "script_noteworthy" );
    var_30 maps\_utility::_id_2830( maps\westminster_code::_id_79C2 );
    var_31 = getentarray( "rocky_road", "targetname" );
    common_scripts\utility::array_thread( var_31, maps\_utility::_id_2830, maps\westminster_code::_id_79CE );
    var_32 = getvehiclenodearray( "friendly_ignore_off", "script_noteworthy" );
    common_scripts\utility::array_thread( var_32, maps\_utility::_id_2830, ::_id_7A08 );
    var_33 = getvehiclenodearray( "friendly_ignore_on", "script_noteworthy" );
    common_scripts\utility::array_thread( var_33, maps\_utility::_id_2830, ::_id_7A07 );
    var_34 = getvehiclenodearray( "veh_node_close_subway_door", "script_noteworthy" );
    common_scripts\utility::array_thread( var_34, maps\_utility::_id_2830, maps\westminster_code::_id_79DA );
    var_35 = getvehiclenode( "scn_london_subway_truck_trans", "script_noteworthy" );
    var_35 maps\_utility::_id_2830( ::scn_london_subway_truck_trans );
    var_28 = getvehiclenodearray( "rpg", "script_noteworthy" );
    common_scripts\utility::array_thread( var_28, maps\_utility::_id_2830, maps\westminster_code::_id_79C5 );
    var_36 = getvehiclenodearray( "spawn_littlebird", "script_noteworthy" );
    common_scripts\utility::array_thread( var_36, maps\_utility::_id_2830, maps\westminster_code::_id_79C6 );
    var_36 = getvehiclenodearray( "switch_minimap", "script_noteworthy" );
    common_scripts\utility::array_thread( var_36, maps\_utility::_id_2830, maps\westminster_code::_id_0B1A );
}

truck_trigger_by_jump()
{
    self endon( "death" );
    level endon( "player_mounts_car" );
    level.player notifyonplayercommand( "jump_pressed", "+gostand" );

    while ( !common_scripts\utility::flag( "player_mounts_car" ) )
    {
        level.player waittill( "jump_pressed" );

        if ( level.player istouching( self ) )
        {
            self notify( "trigger" );
            wait 0.05;
        }
    }
}

truck_trigger_by_use()
{
    self endon( "death" );
    level endon( "player_mounts_car" );
    maps\london_code::_id_00FE();
    common_scripts\utility::flag_set( "player_mounts_car" );
}

scn_london_subway_truck_trans( var_0 )
{
    if ( !maps\westminster_code::_id_79C9( var_0 ) )
    {
        maps\_utility::_id_2830( ::scn_london_subway_truck_trans );
        return;
    }

    level.player maps\_utility::play_sound_on_entity( "scn_london_subway_truck_trans" );
}

position_friendlies_at_fight_to_train()
{
    var_0 = [];
    level.tunnels_godmode_guys = [];
    var_1 = getnode( "sas_leader_node_at_train", "targetname" );
    var_0 = maps\_utility::_id_1377( "allies", "o" );
    var_0 = common_scripts\utility::array_combine( var_0, level._id_56FA );
    var_2 = getentarray( "sas_orange_truck_riders", "script_noteworthy" );

    for ( var_3 = 5; var_0.size < var_3; var_0 = maps\_utility::_id_0BC3( var_0, var_4 ) )
    {
        var_4 = var_2[0] maps\_utility::_id_166F( 1 );
        var_2 = common_scripts\utility::array_remove( var_2, var_2[0] );
    }

    var_5 = 0;

    foreach ( var_4 in var_0 )
    {
        thread position_friendlies_at_fight_to_train_thread( var_4, var_1 );

        if ( var_4 == level._id_56DE )
            continue;

        if ( var_4 == level._id_56FA[1] )
            continue;

        if ( isdefined( var_4._id_100C ) )
            continue;

        if ( var_5 < var_3 )
        {
            if ( !isdefined( var_4._id_0D04 ) )
                var_4 maps\_utility::_id_0D04();

            level.tunnels_godmode_guys = maps\_utility::_id_0BC3( level.tunnels_godmode_guys, var_4 );
        }

        var_5++;
    }
}

position_friendlies_at_fight_to_train_thread( var_0, var_1 )
{
    level endon( "stop_position_friendlies_at_fight_to_train_thread" );
    common_scripts\utility::flag_wait( "transition_to_train" );
    var_0 maps\_utility::_id_123B();
    var_0 maps\_utility::_id_2612( 0 );
    var_0 maps\_utility::_id_2719();
    var_0 maps\_utility::_id_26F3( 1 );
    var_0._id_0EEE = 1;
    var_0 maps\_utility::_id_1237( var_1.origin );
    var_0 maps\_utility::_id_2724( var_1.radius );
}

cleanup_junk_from_docs()
{
    if ( isdefined( level._id_282E["docks_stuff"] ) )
    {
        var_0 = level._id_282E["docks_stuff"];

        foreach ( var_2 in var_0 )
        {
            if ( isai( var_2 ) && isdefined( var_2._id_0D04 ) )
                var_2 maps\_utility::_id_1902();

            if ( isdefined( var_2._id_0A39 ) )
            {
                foreach ( var_4 in var_2._id_0A39 )
                {
                    if ( isai( var_4 ) && isdefined( var_4._id_0D04 ) )
                        var_4 maps\_utility::_id_1902();
                }
            }
        }

        maps\_utility::_id_282E( "docks_stuff" );
    }

    var_7 = getentarray( "london_docks_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_7 );
    maps\_utility::_id_27DF( var_7 );
}

truck_start_work_around()
{
    if ( level._id_1F19 == "train_start" )
    {
        var_0 = spawn( "script_origin", level.player.origin );
        var_1 = common_scripts\utility::getstruct( "truck_start_move_point", "targetname" );
        level.player playerlinkto( var_0 );
        var_0 moveto( var_1.origin, 2 );
        var_0 waittill( "movedone" );
        var_0 delete();
    }
}

train_chase_intro()
{
    common_scripts\utility::flag_wait( "start_train_encounter" );
    level.player maps\_utility::_id_1402( "train_chase_introd" );
    var_0 = 5;
    maps\_utility::delaythread( var_0, maps\westminster_code::_id_79D9 );
    level.player maps\_utility::delaythread( var_0 + 1.63333, maps\_utility::_id_13DC, "train_chase_introd" );
}

train_chase()
{
    common_scripts\utility::flag_wait( "start_train_encounter" );
    var_0 = getent( "westminster_tunnels_fx_volume", "script_noteworthy" );
    var_0 maps\_utility::_id_27E1();
    var_0 maps\_utility::_id_27DA();
    var_0 maps\_utility::_id_27DD();
    var_1 = getent( "westminster_tunnels_crash_fx_volume", "script_noteworthy" );
    var_1 maps\_utility::_id_27E1();
    var_1 maps\_utility::_id_27DA();
    var_1 maps\_utility::_id_27DD();

    if ( !common_scripts\utility::flag( "riding_train_already" ) )
    {
        var_2 = maps\_utility::_id_272D( "subway_enemy" );

        foreach ( var_4 in var_2 )
            var_4._id_7965 = 0;

        thread guys_trickle_into_train( var_2 );
    }

    position_friendlies_at_fight_to_train();
    maps\_utility::_id_2826( "westminster_tunnels_fx_volume" );
    maps\_utility::_id_2826( "westminster_tunnels_crash_fx_volume" );
    init_tunnels();
    var_6 = getentarray( "train_test", "script_noteworthy" );
    var_7 = var_6[0];

    if ( common_scripts\utility::flag( "riding_train_already" ) )
    {
        foreach ( var_9 in var_6 )
        {
            if ( isspawner( var_9 ) )
                var_7 = var_9;
        }
    }

    thread start_train_on_track( var_7 );
    _id_79F5();
}

train_chase_transition()
{

}

guys_trickle_into_train( var_0 )
{
    level endon( "stop_guys_trickle_into_train" );
    common_scripts\utility::flag_wait( "train_fight_trigger" );
    var_0 = common_scripts\utility::array_removeundefined( var_0 );
    var_0 = maps\_utility::_id_2672( var_0 );

    if ( isdefined( level._id_57F7 ) )
        var_0 = common_scripts\utility::array_combine( var_0, level._id_57F7 );

    var_1 = getnodearray( "node_train_spot_runto", "targetname" );
    var_2 = maps\_utility::_id_2780( var_1 );
    var_3 = gettime();

    while ( var_0.size > 0 && var_1.size > 0 )
    {
        var_0 = maps\_utility::_id_2672( var_0 );

        if ( var_0.size == 0 )
            break;

        var_0 = sortbydistance( var_0, var_2 );
        var_4 = var_0[0];
        var_0 = common_scripts\utility::array_remove( var_0, var_4 );
        var_5 = var_1[0];
        var_1 = common_scripts\utility::array_remove( var_1, var_5 );

        if ( var_1.size == 0 )
            return;

        var_5 = common_scripts\utility::random( var_1 );
        var_4 thread maps\westminster_code::_id_7963( var_5 );

        if ( !( var_0.size > 0 && var_1.size > 0 ) )
            break;

        wait 0.25;
    }

    common_scripts\utility::flag_set( "last_guy_running_to_train" );
    maps\_utility::_id_1254( var_3, 10 );
    common_scripts\utility::flag_set( "train_goes" );
}

start_train_on_track( var_0 )
{
    var_1 = undefined;

    if ( common_scripts\utility::flag( "riding_train_already" ) )
        var_1 = var_0._id_2644;
    else
        var_1 = var_0 maps\_utility::_id_1FA3();

    var_1 maps\_vehicle::_id_2A12();
    var_2 = var_1.origin;
    level._id_798D = var_1;
    maps\_utility::_id_282D( var_1, "train" );
    var_1._id_7957 = [];
    var_1._id_7958 = 1;
    var_1 thread maps\westminster_code::_id_7955();
    var_3 = undefined;
    var_4 = getvehiclenode( var_1.target, "targetname" );

    for ( var_5 = var_4 maps\westminster_code::_id_7954(); isdefined( var_5 ); var_0.origin = var_10 )
    {
        var_6 = getentarray( var_5.targetname, "target" );
        var_0 = var_6[0];

        if ( common_scripts\utility::flag( "riding_train_already" ) )
        {
            foreach ( var_8 in var_6 )
            {
                if ( isspawner( var_8 ) )
                    var_0 = var_8;
            }
        }

        var_10 = var_0.origin;
        var_0.origin = var_5.origin;
        var_0.target = var_5.targetname;

        if ( common_scripts\utility::flag( "riding_train_already" ) )
        {
            if ( isdefined( var_0._id_7981 ) )
                var_3 = var_0._id_2644;
            else
                var_3 = maps\_vehicle::_id_211F( var_0 );
        }
        else
        {
            foreach ( var_12 in var_6 )
            {
                if ( isspawner( var_12 ) )
                {
                    var_3 = maps\_vehicle::_id_211F( var_12 );
                    continue;
                }

                var_3 = var_12;
            }
        }

        var_3._id_7958 = 0;
        var_1._id_7957 = maps\_utility::_id_0BC3( var_1._id_7957, var_3 );
        maps\_utility::_id_282D( var_3, "train" );
        var_5 = var_5 maps\westminster_code::_id_7954();
    }

    common_scripts\utility::flag_wait( "train_goes" );
    thread close_doors_of_enemy_train_on_track();
    thread maps\westminster_code::_id_7985();
    maps\westminster_code::_id_7970();
    var_1 maps\_vehicle::_id_1FA6();

    foreach ( var_3 in var_1._id_7957 )
    {
        var_3 maps\_vehicle::_id_1FA6();
        var_1 thread maps\westminster_code::_id_7956();
    }
}

close_doors_of_enemy_train_on_track()
{
    wait 1;

    if ( !isalive( level.player ) )
        return;

    if ( level.player maps\_utility::_id_133C( "train_chase_introd" ) )
        level.player maps\_utility::_id_1654( "train_chase_introd" );

    maps\westminster_code::_id_79DA();
}

player_ride_link_player( var_0, var_1 )
{
    var_2 = maps\westminster_code::_id_7967( var_0 );
    var_2 hide();
    thread maps\london_code::callback( "manage_player_position", var_2 );
    maps\westminster_code::_id_79BD( var_2, "tag_player", ( 0.0, 180.0, 0.0 ) );
    level.player allowsprint( 0 );

    if ( common_scripts\utility::flag( "riding_train_already" ) )
        level.player setplayerangles( combineangles( var_2 gettagangles( "tag_player" ), ( 0.0, 180.0, 0.0 ) ) );

    level.player_crash_truck = var_2;
    level.player_origin_before = level.player.origin;
    maps\westminster_code::_id_79D0();

    if ( isdefined( var_1 ) )
        var_1 delete();

    level.player_origin_after = level.player.origin;
    level notify( "start_manage_player_position" );
    level.player playersetgroundreferenceent( level._id_5A23 );
}

player_ride_headlight( var_0 )
{
    var_1 = maps\westminster_code::_id_7967( var_0 );
    var_2 = maps\westminster_code::_id_7969( var_0 );
    level.players_truck_headlight = var_2;

    if ( !common_scripts\utility::flag( "ride_without_wait" ) )
        var_0 maps\_utility::_id_1654( "loaded" );

    var_1 maps\_vehicle::_id_2B17( "all", var_0.classname );
    var_2 unlink();
    var_2 linkto( var_1 );
    var_2 thread maps\london_code::_id_5275( "spotlight_truck_player", "spotlight_truck_player_cheap", "tag_origin", var_1 );
}

player_uses_truck( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "player_mounts_car" );
    thread _id_79F3();
    level.player enableinvulnerability();
    getent( "truck_load_use_trigger", "targetname" ) delete();
    maps\_utility::_id_135B( maps\_utility::_id_2831() );

    foreach ( var_3 in var_0._id_2974 )
    {
        if ( var_3.model == "weapon_mp5" )
        {
            var_0._id_2974 = common_scripts\utility::array_remove( var_0._id_2974, var_3 );
            var_3 delete();
        }
    }

    var_5 = undefined;

    if ( !common_scripts\utility::flag( "riding_train_already" ) )
    {
        level.player allowcrouch( 0 );
        level.player allowprone( 0 );
        level.player setstance( "stand" );
        var_5 = maps\_utility::_id_1287( "player_mount_truck" );
        maps\westminster_code::_id_79BD( var_5, "tag_player" );
        var_0 thread maps\_anim::_id_11CF( var_5, "truck_mount", "tag_guy1" );
        level.player playerlinktoblend( var_5, "tag_player", 0.3, 0, 0 );
        level.player playersetgroundreferenceent( level._id_5A23 );
        level.player freezecontrols( 1 );
        level.player disableweapons();
        level.player playsound( "scn_london_enter_truck_plr" );
        wait 0.44;
        level.player common_scripts\utility::delaycall( 2.5, ::enableweapons );
        var_0 maps\_anim::_id_1246( var_5, "truck_mount", "tag_guy1" );
        level.player allowcrouch( 1 );
        var_5 hide();
    }
    else
        level.player playersetgroundreferenceent( level._id_5A23 );

    player_ride_link_player( var_0, var_5 );
    common_scripts\utility::flag_set( "player_mount_car_complete" );
    level.player disableinvulnerability();
}

_id_79F3()
{
    while ( !common_scripts\utility::flag( "train_crash_explode" ) )
    {
        wait 1;
        _id_79F4( 0.25, 1.5 );
    }
}

_id_79F4( var_0, var_1 )
{
    var_2 = level.player getweaponslist( "primary" );

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_1 ) )
        {
            level.player givemaxammo( var_4 );
            continue;
        }

        var_5 = level.player getfractionmaxammo( var_4 );

        if ( var_5 < var_0 )
        {
            var_6 = level.player getweaponammostock( var_4 );
            var_6 += level.player getweaponammoclip( var_4 );
            var_6 = max( var_6, 70 );
            level.player setweaponammostock( var_4, int( var_6 * var_1 ) );
        }
    }
}

_id_79F5( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    if ( !isdefined( level._id_797B ) )
        level._id_797B = maps\_vehicle::_id_2A99( "player_truck" );

    var_0 = level._id_797B;
    var_0._id_2955 = 1;
    var_0 maps\_vehicle::_id_2A12();
    var_3 = var_0.model;
    var_4 = maps\westminster_code::_id_7967( var_0 );
    var_4 maps\westminster_code::_id_79B6();
    var_4 setmodel( "vehicle_uk_utility_truck_destructible_nobullets" );
    var_4 hide();

    if ( !common_scripts\utility::flag( "riding_train_already" ) )
    {
        if ( !isdefined( level._id_797A ) )
            level._id_797A = maps\_vehicle::_id_2A99( "player_truck_ghost" );

        var_1 = level._id_797A;
        var_1 maps\_vehicle::_id_2A12();
        var_1 hide();
        var_1 vehicle_turnengineoff();

        if ( !isdefined( level._id_7978 ) )
            level._id_7978 = maps\_vehicle::_id_2A99( "friend_truck_ghost" );

        var_2 = level._id_7978;
        var_2 maps\_vehicle::_id_2A12();
        var_2 hide();
        var_2 vehicle_turnengineoff();
    }

    if ( !isdefined( level._id_7979 ) )
        level._id_7979 = maps\_vehicle::_id_2A99( "friend_truck" );

    var_5 = maps\westminster_code::_id_7969( level._id_7979 );
    level._id_7979 vehicle_turnengineoff();
    level._id_797B vehicle_turnengineoff();
    var_6 = maps\westminster_code::_id_7968( level._id_7979 );
    var_6 hide();
    var_7 = level._id_7979;
    var_7 maps\_vehicle::_id_2A12();
    thread player_uses_truck( var_0, var_3 );
    thread player_ride_headlight( var_0 );
    common_scripts\utility::flag_wait_either( "last_guy_running_to_train", "train_goes" );
    common_scripts\utility::flag_clear( "can_save" );
    var_8 = spawn( "script_model", var_0.origin );
    var_8 setmodel( "vehicle_uk_utility_truck_objective_tailgate" );
    var_8 linkto( var_0, "TAG_ORIGIN", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_9 = level._id_56FA[1];
    var_9._id_251B = 1;
    level._id_56DE._id_251B = 0;
    var_10 = level.tunnels_godmode_guys[0];
    var_11 = level.tunnels_godmode_guys[1];
    var_12 = level.tunnels_godmode_guys[2];
    level notify( "stop_position_friendlies_at_fight_to_train_thread" );

    if ( !common_scripts\utility::flag( "ride_without_wait" ) )
    {
        var_0 thread maps\westminster_code::_id_7972( [ level._id_56DE, var_9 ] );
        level._id_56DE thread maps\westminster_code::_id_7984( "friendly_truck_fast_load", 1, level._id_797B );
        var_9 thread maps\westminster_code::_id_7984( "friendly_truck_fast_load", 0, level._id_797B );
    }
    else
    {
        common_scripts\utility::flag_set( "friendly_truck_fast_load" );
        common_scripts\utility::flag_set( "friendly_truck_other_fast_load" );
        var_0 maps\_utility::_id_2683( level._id_56DE );
        var_0 maps\_utility::_id_2683( var_9 );
    }

    level._id_79F6 = var_12;
    var_12._id_0F2D = 1;
    var_10._id_251B = 0;
    var_11._id_251B = 1;
    var_12._id_251B = 2;

    if ( !common_scripts\utility::flag( "ride_without_wait" ) )
    {
        var_2._id_2941 = 0;
        var_1._id_2941 = 0;
        var_0._id_2941 = 0;
        var_7._id_2941 = 0;
        var_12 thread maps\westminster_code::_id_7973();
        var_7 thread maps\westminster_code::_id_7972( [ var_10, var_11, var_12 ] );
    }
    else
    {
        var_7 maps\_utility::_id_2683( var_10 );
        var_7 maps\_utility::_id_2683( var_11 );
        var_7 maps\_utility::_id_2683( var_12 );
        var_12 thread maps\westminster_code::_id_7974();
    }

    common_scripts\utility::flag_wait( "train_goes" );

    if ( !common_scripts\utility::flag( "riding_train_already" ) )
    {
        level._id_56DE thread maps\_utility::_id_168C( "london_ldr_inthetrucks" );
        thread _id_79F8();
        var_1 maps\_utility::delaythread( 1.75, maps\_vehicle::_id_1FA6 );
        var_2 thread maps\_vehicle::_id_1FA6();
        var_2 hide();
        var_1 hide();
    }

    common_scripts\utility::flag_wait( "player_mounts_car" );
    level._id_56DE maps\_utility::delaythread( 2.0, maps\westminster_code::_id_79C3, "teleport_player_driver_struct" );
    var_9 maps\_utility::delaythread( 2.0, maps\westminster_code::_id_79C3, "teleport_player_passenger_struct" );
    common_scripts\utility::flag_wait( "player_mount_car_complete" );
    common_scripts\utility::flag_set( "can_save" );
    badplace_cylinder( "player_spot", 15, level.player.origin + ( 0.0, 0.0, -500.0 ), 2000, 3000, "axis" );

    if ( !common_scripts\utility::flag( "ride_without_wait" ) )
    {
        var_2._id_2941 = 1;
        var_1._id_2941 = 1;
        var_0._id_2941 = 1;
        var_7._id_2941 = 1;
    }

    cleanup_junk_from_docs();
    var_10 maps\westminster_code::_id_79C3( "teleport_friend_driver_struct" );
    var_12 maps\westminster_code::_id_79C3( "teleport_friend_gunner_struct" );
    var_10 thread _id_79F7();
    var_11 thread _id_79F7();
    var_7 thread maps\london_code::callback( "force_door_shut" );
    level._id_56DE notify( "goal" );
    var_12 notify( "goal" );
    level.enable_ai_shotgun_destructible_damage = 1;
    var_13 = gettime();

    if ( !common_scripts\utility::flag( "riding_train_already" ) )
    {
        var_7 thread maps\_utility::play_sound_on_tag( "scn_london_utility_truck_startup_npc", "TAG_DRIVER" );
        wait 0.5;
        var_7 vehicle_turnengineon();
        wait 0.5;
        var_7 maps\_vehicle::_id_1FA6();
        var_6 maps\_vehicle::_id_2B17( "all", "script_vehicle_uk_utility_truck" );
        var_7 maps\westminster_code::_id_797D();
        var_7 thread maps\westminster_code::_id_795D( var_2 );
    }
    else
    {
        var_6 maps\_vehicle::_id_2B17( "all", "script_vehicle_uk_utility_truck" );
        var_7 vehicle_turnengineon();
    }

    var_14 = ( gettime() - var_13 ) / 1000;
    var_15 = clamp( var_14, 1.75 - var_14, 1.75 );
    common_scripts\utility::flag_wait( "friendly_truck_fast_load" );
    var_0 thread maps\_utility::play_sound_on_tag( "scn_london_utility_truck_startup", "TAG_DRIVER" );

    if ( !common_scripts\utility::flag( "riding_train_already" ) )
    {
        var_0 maps\_utility::delaythread( var_15 + 0.2, maps\_utility::play_sound_on_entity, "scn_london_utilitytruck_peelout" );
        var_0 maps\_utility::delaythread( var_15, maps\_vehicle::_id_1FA6 );
        var_0 maps\_utility::delaythread( var_15, maps\westminster_code::_id_795D, var_1 );
        maps\_utility::delaythread( clamp( var_15 - 1, 0.05, var_15 ), maps\_utility::_id_11F4, "london_ldr_holdon" );
    }

    if ( isdefined( level._id_5794 ) )
        level._id_5794 delete();

    var_8 delete();
    var_16 = getvehiclenode( "vehicle_node_transition_to_crash", "script_noteworthy" );
    var_16 waittill( "trigger", var_17 );
    maps\_utility::delaythread( 23, maps\london_code::callback, "stop_manage_player_position", var_4 );
    _id_79FC( var_0 );
}

_id_79F7()
{
    self notify( "goal" );
    wait 0.05;
    self notify( "animontagdone", "end" );
}

_id_79F8()
{
    var_0 = 15;

    for ( var_1 = var_0; var_1 > 0; var_1-- )
    {
        if ( common_scripts\utility::flag( "player_mounts_car" ) )
            return;

        if ( var_1 == 11 )
            level._id_56DE thread maps\_utility::_id_168C( "london_ldr_burnsintruck" );

        if ( var_1 == 7 )
            level._id_56DE thread maps\_utility::_id_168C( "london_ldr_arseintruck" );

        if ( var_1 == 5 )
            level._id_56DE thread maps\_utility::_id_168C( "london_ldr_burnsintruck" );

        wait 1;
    }

    if ( common_scripts\utility::flag( "player_mounts_car" ) )
        return;

    setdvar( "ui_deadquote", &"LONDON_SUBWAY_CART_GOT_AWAY" );
    maps\_utility::_id_1826();
}

_id_79F9( var_0, var_1 )
{
    var_2 = maps\_utility::_id_1287( "player_car_mirrored" );
    level._id_79DB = var_2;
    var_2 maps\westminster_code::_id_79B6();
    var_2 hidepart( "TAG_TAIL_GATE" );
    var_2 hidepart( "TAG_RAIL" );

    if ( !isdefined( var_1 ) )
    {
        var_2 hide();
        var_2 notsolid();
    }

    var_0 maps\_anim::_id_124F( var_2, "train_crash" );
    var_2 maps\_vehicle::_id_2B17( "all", "script_vehicle_uk_utility_truck_no_rail_player" );
    var_0 thread maps\_anim::_id_1246( var_2, "train_crash" );

    if ( isdefined( var_1 ) )
    {
        wait 0.05;
        var_0 maps\_anim::_id_127F( [ var_2 ], "train_crash", 1 );
        return;
    }
    else
        common_scripts\utility::flag_wait( "teleport_to_west" );

    maps\london_code::_id_536D();
}

_id_79FA( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_2 in var_0._id_798F )
        {

        }

        foreach ( var_5 in var_0._id_2974 )
        {

        }

        wait 0.05;
    }
}

_id_79FB()
{
    foreach ( var_1 in self._id_798F )
    {
        if ( isdefined( var_1._id_7998 ) )
        {
            var_2 = var_1._id_7998;
            var_1 linkto( var_2, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        }
    }
}

_id_79FC( var_0 )
{
    common_scripts\utility::flag_set( "train_crashing" );
    var_1 = getentarray( "westminster_tunnels_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_1 );
    maps\_utility::_id_27DF( var_1 );
    maps\_utility::_id_2822( "westminster_tunnels_fx_volume" );
    common_scripts\utility::array_thread( level._id_7962, maps\westminster_code::_id_795F );
    level.player.ignoreme = 1;
    level.player enableinvulnerability();
    level notify( "stop_manage_players_attacker_accuracy" );
    level.player thread maps\_gameskill::_id_22FF();
    level.player.ignorerandombulletdamage = 0;
    common_scripts\utility::array_thread( getaiarray( "axis" ), maps\_utility::_id_2613, level._id_79F6 );
    var_2 = 1;
    thread _id_79FE();
    var_3 = common_scripts\utility::getstruct( "train_crash_script_node", "targetname" );
    var_4 = spawnstruct();
    var_4.angles = var_3.angles;
    var_4.origin = var_3.origin;
    level._id_798D common_scripts\utility::delaycall( 1, ::hide );

    foreach ( var_6 in level._id_798D._id_7957 )
        var_6 common_scripts\utility::delaycall( 1, ::hide );

    var_8 = [];
    var_9 = maps\_utility::_id_1287( "train_car1" );
    var_10 = maps\_utility::_id_1287( "train_car1_broken" );
    var_11 = maps\_utility::_id_1287( "train_car2" );
    var_12 = maps\_utility::_id_1287( "train_car3" );
    var_13 = maps\_utility::_id_1287( "train_car4" );
    var_14 = maps\_utility::_id_1287( "player_rig_tunnel_crash" );
    var_15 = maps\_utility::_id_1287( "player_rig_tunnel_crash_teleport" );
    var_15 hide();
    var_14 hide();
    level._id_79FD = var_15;
    level._id_79BC = var_14;
    var_9 maps\westminster_code::_id_79B5();
    var_11 maps\westminster_code::_id_79B5();
    var_12 maps\westminster_code::_id_79B5();
    var_13 maps\westminster_code::_id_79B5();
    var_16 = level._id_79F6;
    var_16 notify( "stop_orient_to_player" );
    var_16 maps\westminster_code::_id_796A();
    var_16 maps\_utility::_id_1902();
    var_16 = maps\_vehicle_aianim::_id_25C1( var_16, 0 );
    var_16._id_1032 = "truck_gunner";
    getvehiclenode( "all_enemies_target_friend_gunner", "script_noteworthy" ) thread _id_79FF( var_16 );
    level._id_7979._id_2955 = 1;
    var_17 = maps\westminster_code::_id_7968( level._id_7979 );
    var_17 unlink();
    var_17 show();

    foreach ( var_19 in level._id_7979._id_0A39 )
    {
        if ( isdefined( var_19._id_0D04 ) )
            var_19 maps\_utility::_id_1902();
    }

    level._id_7979.modeldummy = var_17;
    level._id_7979 maps\_vehicle::_id_2A96( var_17 );
    level._id_7979 maps\_vehicle::_id_2A91( var_17 );
    level._id_7979 hide();
    var_17._id_1032 = "truck";
    var_17 maps\_utility::_id_2629();
    var_21 = maps\_utility::_id_1287( "truck_wrecked" );
    var_21 hidepart( "TAG_RAIL" );

    if ( isdefined( level.player_crash_truck ) )
    {
        var_22 = level.player_crash_truck;
        var_22._id_1032 = "player_car";
        var_22 maps\_utility::_id_2629();
    }
    else
        var_22 = maps\_utility::_id_1287( "player_car" );

    var_22 show();
    var_22 maps\westminster_code::_id_79B6();
    var_0.modeldummy = var_22;
    var_0 maps\_vehicle::_id_2A96( var_22 );
    var_0 maps\_vehicle::_id_2A91( var_22 );
    level.player.ignoreme = 1;
    var_17 hidepart( "TAG_RAIL" );
    level._id_798D.modeldummy = var_9;
    level._id_798D maps\_vehicle::_id_2A91( var_9 );
    level._id_798D _id_79FB();
    common_scripts\utility::array_levelthread( level._id_798D._id_2974, maps\_utility::_id_282D, "lead_train_junk" );
    var_23 = level._id_798D._id_7957[0];
    var_23.modeldummy = var_11;
    var_23 maps\_vehicle::_id_2A91( var_11 );
    var_23 _id_79FB();
    var_23 = level._id_798D._id_7957[1];
    var_23.modeldummy = var_12;
    var_23 maps\_vehicle::_id_2A91( var_12 );
    var_23 _id_79FB();
    var_23 = level._id_798D._id_7957[2];
    var_23.modeldummy = var_13;
    var_23 maps\_vehicle::_id_2A91( var_13 );
    var_23 _id_79FB();
    var_22 hidepart( "TAG_RAIL" );
    var_8 = maps\_utility::_id_0BC3( var_8, var_9 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_11 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_12 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_13 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_21 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_14 );
    var_3 maps\_anim::_id_122D( var_8, "train_crash" );
    common_scripts\utility::array_call( var_8, ::hide );
    var_22 unlink();
    var_0 hide();
    var_16 linkto( var_17, "tag_gunner", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_3 maps\_anim::_id_122E( [ var_22, var_17 ], "train_crash", undefined, var_2, 0, 0 );
    var_17 thread maps\_anim::_id_124E( var_16, "idle_loop", "stop_idle_loop", "tag_gunner" );
    wait(var_2);
    var_24 = common_scripts\utility::array_remove( var_8, var_14 );
    common_scripts\utility::array_call( var_24, ::show );
    level._id_7979 notify( "stop_idle_loop" );
    var_16 unlink();
    thread _id_79F9( var_4 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_22 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_16 );
    var_8 = maps\_utility::_id_0BC3( var_8, var_17 );
    maps\_utility::_id_282D( var_11, "crashed_left_behinds" );
    maps\_utility::_id_282D( var_12, "crashed_left_behinds" );
    maps\_utility::_id_282D( var_13, "crashed_left_behinds" );
    maps\_utility::_id_282D( var_17, "crashed_left_behinds" );
    maps\_utility::_id_282D( var_21, "crashed_left_behinds" );
    maps\_utility::_id_282D( var_14, "crashed_left_behinds" );
    maps\_utility::_id_282D( var_0, "crashed_left_behinds" );
    maps\_utility::_id_282D( level._id_7979, "crashed_left_behinds" );
    maps\_utility::_id_282D( level._id_797A, "crashed_left_behinds" );
    maps\_utility::_id_282D( level._id_798D, "crashed_left_behinds" );
    maps\_utility::_id_282D( level._id_798D._id_7957[0], "crashed_left_behinds" );
    maps\_utility::_id_282D( level._id_798D._id_7957[1], "crashed_left_behinds" );
    maps\_utility::_id_282D( level._id_798D._id_7957[2], "crashed_left_behinds" );
    thread _id_7A03( "train_breaks_in_half", var_10, var_9, var_3 );
    thread _id_7A05( "london_truck_crash", var_21, var_17, var_3 );
    thread _id_7A01();
    var_17 thread maps\_utility::play_sound_on_entity( "scn_london_subway_truck_crash" );
    var_11 thread maps\_utility::play_sound_on_entity( "scn_london_subway_train_crash" );
    var_3 thread maps\_anim::_id_11DD( var_8, "train_crash" );
    var_4 maps\_anim::_id_1246( var_15, "train_crash" );
    var_0._id_0A39 = common_scripts\utility::array_remove( var_0._id_0A39, level._id_56DE );
    common_scripts\utility::array_thread( var_0._id_0A39, maps\_utility::_id_1902 );
    maps\_utility::_id_135B( var_0._id_0A39 );
    var_25 = maps\westminster_code::_id_7969( var_0 );
    var_26 = common_scripts\utility::array_remove( var_0._id_2974, var_25 );
    var_26 = common_scripts\utility::array_remove( var_26, var_22 );
    var_22 hide();
    maps\_utility::_id_135B( var_26 );
    var_8 = getentarray( "sas_squad", "targetname" );
    var_8 = common_scripts\utility::array_remove( var_8, level._id_56DE );

    foreach ( var_28 in var_8 )
    {
        if ( isdefined( var_28._id_0D04 ) )
            var_28 maps\_utility::_id_1902();
    }

    maps\_utility::_id_135B( var_8 );
    maps\_utility::_id_282E( "crashed_left_behinds" );
    level.player.ignoreme = 0;

    if ( isdefined( level._id_4553 ) )
        level._id_4553 delete();

    common_scripts\utility::flag_set( "train_crashed" );
    var_1 = getentarray( "westminster_tunnels_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_1 );
    maps\_utility::_id_27DF( var_1 );
    var_30 = getentarray( "westminster_tunnels_crash_fx_volume", "script_noteworthy" );
    maps\_utility::_id_27DE( var_30 );
    maps\_utility::_id_27DF( var_30 );
}

_id_79FE()
{
    wait 1;
    maps\_utility::_id_11F4( "london_sasl_seethedriver" );
    maps\_utility::_id_11F4( "london_sas2_pierceisdown" );
    wait 10;
    maps\_utility::_id_11F4( "london_ldr_holdon2" );
}

_id_79FF( var_0 )
{
    self waittill( "trigger" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = var_0 gettagorigin( "tag_eye" );
    var_1 linkto( var_0, "tag_eye", ( 0.0, 0.0, -44.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\_utility::_id_282D( var_1, "crashed_left_behinds" );
    var_2 = getaiarray( "axis" );

    foreach ( var_4 in var_2 )
        var_4 thread _id_7A00( var_1 );

    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "guys_shot_enough_at_train" );
}

_id_7A00( var_0 )
{
    self notify( "stop_orient_to_player" );
    self setentitytarget( var_0 );
    self endon( "death" );
    thread maps\westminster_code::_id_79A5( var_0 );
    wait(randomfloatrange( 1, 2 ));

    while ( isalive( self ) )
    {
        self shoot();
        wait(randomfloatrange( 0.05, 0.1 ));

        if ( common_scripts\utility::flag( "train_crash_explode" ) )
            break;

        if ( common_scripts\utility::flag( "guys_shot_enough_at_train" ) )
            break;
    }

    self clearentitytarget();
}

_id_7A01()
{
    common_scripts\utility::flag_wait( "train_crash_explode" );
    var_0 = level._id_798D._id_7957;
    var_0[var_0.size] = level._id_798D;

    foreach ( var_2 in var_0 )
        common_scripts\utility::array_thread( var_2._id_798F, ::_id_7A02 );

    var_4 = maps\westminster_code::_id_7969( level._id_798D );
    var_4 delete();

    foreach ( var_2 in var_0 )
    {
        var_2._id_56C2 show();
        var_2.modeldummy hidepart( "TAG_INTERIOR_UNLIT" );
    }

    level.player disableweapons();
}

_id_7A02()
{
    self._id_79B9 = 1;
    self kill();
}

_id_7A03( var_0, var_1, var_2, var_3 )
{
    level._id_7A04 = var_1;
    common_scripts\utility::flag_wait( var_0 );
    maps\_utility::_id_282E( "lead_train_junk" );
    var_1 dontinterpolate();
    var_3 maps\_anim::_id_124F( var_1, "train_crash" );
    var_3 thread maps\_anim::_id_1246( var_1, "train_crash" );
    var_1 show();
    var_2 hide();
}

_id_7A05( var_0, var_1, var_2, var_3 )
{
    var_1 hide();
    common_scripts\utility::flag_wait( var_0 );
    var_2 maps\_vehicle::_id_2B18( "all", "script_vehicle_uk_utility_truck" );
    var_1 show();
    var_2 hide();
}

_id_7A06()
{
    common_scripts\utility::flag_set( "transition_to_train" );
    maps\london_code::_id_5700( "start_train_start" );
    var_0 = maps\_utility::_id_272D( "sas_orange_truck_riders_start" );
}

_id_7A07( var_0 )
{
    if ( !isdefined( level._id_79F6 ) )
        return;

    level._id_79F6.ignoreme = 1;
}

_id_7A08( var_0 )
{
    if ( !isdefined( level._id_79F6 ) )
        return;

    level._id_79F6.ignoreme = 0;
}
