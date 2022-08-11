// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_audio::_id_17C1( 0 );
    maps\_audio::_id_16F4();
    _id_551F();
    _id_5520();
    _id_5526();
    _id_5523();
    maps\_audio_mix_manager::_id_1517( "warl_level_global_mix" );
    maps\_audio::_id_174C( ::_id_5527 );
    maps\_audio::_id_174C( ::_id_448C );
}

_id_447C()
{
    maps\_audio_mix_manager::_id_1509( "warl_level_global_mix" );
    maps\_audio_mix_manager::_id_1509( "warl_level_start" );
    maps\_audio_mix_manager::_id_1509( "warl_swamp_footsteps_shallow" );
    maps\_audio_mix_manager::_id_1509( "warl_swamp_npc_footsteps_shallow" );
    maps\_audio_mix_manager::_id_1509( "warl_swamp_footsteps_deep" );
    maps\_audio_mix_manager::_id_1509( "warl_swamp_npc_footsteps_deep" );
    maps\_audio_mix_manager::_id_1509( "warl_jungle_river" );
    maps\_audio_mix_manager::_id_1509( "warl_jungle_path" );
    maps\_audio_mix_manager::_id_1509( "warl_shanty_town" );
    maps\_audio_mix_manager::_id_1509( "warl_shanty_town_dense" );
    maps\_audio_mix_manager::_id_1509( "warl_player_tech_shoot" );
    maps\_audio_mix_manager::_id_1509( "warl_player_tech_explode" );
    maps\_audio_mix_manager::_id_1509( "warl_mortar_run" );
    maps\_audio_mix_manager::_id_1509( "warl_shanty_town_mortar_run" );
    maps\_audio_mix_manager::_id_1509( "warl_shanty_town_mortar_tower" );
    maps\_audio_mix_manager::_id_1509( "warl_sewer_pipe" );
    maps\_audio_mix_manager::_id_1509( "warl_house_town_dense" );
    maps\_audio_mix_manager::_id_1509( "warl_churchtown" );
    maps\_audio_mix_manager::_id_1509( "warl_churchtown_church" );
    maps\_audio_mix_manager::_id_1509( "warl_finale" );
}

_id_551F()
{
    maps\_audio::_id_1740( "shg" );
    maps\_audio::_id_156E( "soft_occlusion" );
    maps\_audio::_id_1735();
    maps\_audio::_id_178E( 0 );
}

_id_5520()
{
    level._id_16F5 = spawnstruct();
    level._id_16F5._id_5521 = 0;
    level._id_16F5._id_5522 = -174;
    _id_5525();
}

_id_5523()
{
    if ( !isdefined( level._id_16F5._id_5524 ) )
    {
        level._id_16F5._id_5524 = 1;
        _id_5536();
        _id_5539();
        _id_5535();
        thread _id_5546();
        thread _id_553B();
        thread _id_553C();
    }
}

_id_5525()
{
    level._id_16F5._id_440B["veh_drive_vol"] = [ [ 0.0, 0.0 ], [ 0.05, 0.1 ], [ 0.1, 0.1 ], [ 0.2, 0.2 ], [ 0.3, 0.3 ], [ 0.4, 0.4 ], [ 0.5, 0.5 ], [ 0.6, 0.6 ], [ 0.8, 0.8 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["veh_idle_vol"] = [ [ 0.0, 1.0 ], [ 0.05, 0.85 ], [ 0.1, 0.6 ], [ 0.2, 0.5 ], [ 0.3, 0.4 ], [ 0.4, 0.1 ], [ 0.5, 0.0 ], [ 0.6, 0.0 ], [ 0.8, 0.0 ], [ 1.0, 0.0 ] ];
    level._id_16F5._id_440B["veh_gravel_vol"] = [ [ 0.0, 0.0 ], [ 0.05, 0.25 ], [ 0.1, 0.5 ], [ 0.2, 0.75 ], [ 0.3, 1.0 ], [ 1.0, 1.0 ] ];
    level._id_16F5._id_440B["mi17_fake_scale"] = [ [ 0.0, 1.0 ], [ 0.05, 0.8 ], [ 0.1, 0.6 ], [ 0.2, 0.5 ], [ 0.3, 0.4 ], [ 0.4, 0.3 ], [ 0.5, 0.3 ], [ 0.6, 0.2 ], [ 0.8, 0.1 ], [ 1.0, 0.0 ] ];
}

_id_5526()
{
    common_scripts\utility::flag_init( "player_breach" );
    common_scripts\utility::flag_init( "aud_infiltrate_encounter_1" );
    common_scripts\utility::flag_init( "kill_sleeping_guard" );
    common_scripts\utility::flag_init( "aud_warlord_player_breach" );
    common_scripts\utility::flag_init( "player_using_mortar" );
    common_scripts\utility::flag_init( "aud_grass_hide" );
    common_scripts\utility::flag_init( "aud_river_big_moment_end" );
    common_scripts\utility::flag_init( "aud_player_using_tech_turret" );
    common_scripts\utility::flag_init( "aud_mortar_slowmo" );
    common_scripts\utility::flag_init( "snoring_guard_dead" );
    common_scripts\utility::flag_init( "aud_fake_mortar_exploded" );
    common_scripts\utility::flag_init( "inside_prechurch_burnthouse" );
    common_scripts\utility::flag_init( "mi17_flyby" );
    common_scripts\utility::flag_init( "aud_finale_all_clear" );
    common_scripts\utility::flag_init( "aud_first_heli_deleted" );
    common_scripts\utility::flag_init( "aud_second_heli_spawned" );
}

_id_5527( var_0, var_1 )
{
    var_2 = 1;

    switch ( var_0 )
    {
        case "start_stealth_intro":
            maps\_audio_mix_manager::_id_1517( "warl_level_start", 0 );
            _id_448B( "mus_intro" );
            wait 2.5;
            maps\_audio::_id_1794( "warl_intro_player_emerge_start" );
            wait 0.8;
            maps\_audio::_id_1794( "warl_intro_player_emerge" );
            thread _id_5541( 3 );
            wait 1;
            maps\_audio_zone_manager::_id_156C( "warl_jungle_river" );
            maps\_audio_mix_manager::_id_1520( "warl_level_start", 3 );
            thread _id_553D();
            thread _id_553F();
            break;
        case "start_river_big_moment":
            maps\_audio_zone_manager::_id_156C( "warl_jungle_path" );
            _id_448B( "mus_river_first_encounter_all_clear" );
            break;
        case "start_infiltration":
            maps\_audio_zone_manager::_id_156C( "warl_jungle_path" );
            _id_448B( "mus_bridge_guys_dead" );
            break;
        case "start_advance":
            maps\_audio_zone_manager::_id_156C( "warl_shanty_town_exterior" );
            _id_448B( "mus_go_hot" );
            break;
        case "start_technical":
            maps\_audio_zone_manager::_id_156C( "warl_shanty_town_exterior_dense" );
            _id_448B( "mus_to_technical" );
            break;
        case "start_mortar_run":
            maps\_audio_zone_manager::_id_156C( "warl_shanty_town_exterior_sparse" );
            _id_448B( "mus_mortar_inbound" );
            maps\_audio_mix_manager::_id_1517( "warl_mortar_run", 0.3 );
            break;
        case "start_player_mortar":
            maps\_audio_zone_manager::_id_156C( "warl_shanty_town_exterior_sparse_mortar_tower" );
            _id_448B( "mus_player_mortar" );
            break;
        case "start_assault":
            maps\_audio_zone_manager::_id_156C( "warl_shanty_town_exterior_sparse_mortar_tower" );
            _id_448B( "mus_player_mortar_done" );
            break;
        case "start_super_technical":
            maps\_audio_zone_manager::_id_156C( "warl_house_prechurchzone_burnt" );
            _id_448B( "mus_shoulder_charge_door" );
            break;
        case "start_player_breach":
            maps\_audio_zone_manager::_id_156C( "warl_churchtown_church_mainroom_interior" );
            _id_448B( "mus_pre_church_door_breach" );
            break;
        case "enter_warl_jungle_river_shallow":
            var_3 = var_1;

            if ( var_3 == "warl_jungle_river" )
                level notify( "aud_warl_stop_river_rain_drops" );

            break;
        case "exit_warl_jungle_river_shallow":
            var_4 = var_1;

            if ( var_4 == "warl_jungle_river" )
                thread _id_5541( 3 );

            break;
        case "enter_warl_jungle_path":
            var_3 = var_1;

            if ( var_3 == "warl_jungle_river_shallow" )
            {
                thread _id_553E();
                thread _id_5540();
            }

            break;
        case "exit_warl_jungle_path":
            var_4 = var_1;

            if ( var_4 == "warl_jungle_river_shallow" )
            {
                thread _id_553D();
                thread _id_553F();
            }

            break;
        case "enter_warl_shanty_town_exterior":
            var_3 = var_1;
            break;
        case "exit_warl_shanty_town_exterior":
            var_4 = var_1;
            break;
        case "enter_warl_stone_wherehouse":
            var_3 = var_1;
            break;
        case "exit_warl_stone_wherehouse":
            var_4 = var_1;
            break;
        case "enter_warl_shanty_town_exterior_dense":
            var_3 = var_1;
            break;
        case "exit_warl_shanty_town_exterior_dense":
            var_4 = var_1;
            break;
        case "enter_warl_shanty_town_exterior_sparse":
            var_3 = var_1;
            break;
        case "exit_warl_shanty_town_exterior_sparse":
            var_4 = var_1;
            break;
        case "enter_warl_shanty_town_exterior_dense_mortarrun":
            var_3 = var_1;
            break;
        case "exit_warl_shanty_town_exterior_dense_mortarrun":
            var_4 = var_1;
            break;
        case "enter_warl_shanty_town_exterior_sparse_mortar_tower":
            var_3 = var_1;
            break;
        case "exit_warl_shanty_town_exterior_sparse_mortar_tower":
            var_4 = var_1;
            break;
        case "enter_warl_sewer_pipe":
            var_3 = var_1;

            if ( var_3 == "warl_shanty_town_exterior_sparse_mortar_tower" )
            {
                maps\_audio::aud_send_msg( "mus_enter_sewer_pipe" );
                thread _id_5543( 1 );
            }

            break;
        case "exit_warl_sewer_pipe":
            var_4 = var_1;

            if ( var_4 == "warl_shanty_town_exterior_sparse_mortar_tower" )
                level notify( "aud_warl_stop_sewer_pipe_interiorflow" );

            break;
        case "enter_warl_house_town_dense":
            var_3 = var_1;

            if ( var_3 == "warl_sewer_pipe" )
            {
                maps\_audio::aud_send_msg( "mus_exit_sewer_pipe" );
                level notify( "aud_warl_stop_sewer_pipe_interiorflow" );
            }

            break;
        case "exit_warl_house_town_dense":
            var_4 = var_1;

            if ( var_4 == "warl_sewer_pipe" )
                thread _id_5543( 1 );

            break;
        case "enter_warl_werehouse_brick":
            var_3 = var_1;

            if ( var_3 == "warl_house_town_dense" )
                _id_5538();

            break;
        case "exit_warl_werehouse_brick":
            var_4 = var_1;

            if ( var_4 == "warl_house_town_dense" )
                _id_5537();

            break;
        case "enter_warl_house_town_dense_02":
            var_3 = var_1;
            break;
        case "exit_warl_house_town_dense_02":
            var_4 = var_1;
            break;
        case "enter_warl_house_shanty_interior_01":
            var_3 = var_1;
            break;
        case "exit_warl_house_shanty_interior_01":
            var_4 = var_1;
            break;
        case "enter_warl_house_prechurchzone_burnt":
            var_3 = var_1;
            common_scripts\utility::flag_set( "inside_prechurch_burnthouse" );

            if ( !maps\_utility::_id_0A36() )
                thread _id_554E();

            break;
        case "exit_warl_house_prechurchzone_burnt":
            var_4 = var_1;
            break;
        case "enter_warl_churchtown_exterior_dense":
            var_3 = var_1;
            break;
        case "exit_warl_churchtown_exterior_dense":
            var_4 = var_1;
            break;
        case "enter_warl_churchtown_church_mainroom_interior":
            var_3 = var_1;
            break;
        case "exit_warl_churchtown_church_mainroom_interior":
            var_4 = var_1;
            break;
        case "enter_warl_churchtown_church_dogroom":
            var_3 = var_1;
            break;
        case "exit_warl_churchtown_church_dogroom":
            var_4 = var_1;
            break;
        case "door_open_slow":
            var_5 = var_1[0];
            var_6 = var_1[1];

            if ( isdefined( var_6 ) )
                var_5 playsound( var_6 );
            else
                var_5 playsound( "warl_se_dooropen1_02" );

            break;
        case "door_open_slow_wide":
            var_5 = var_1[0];
            var_6 = var_1[1];

            if ( isdefined( var_6 ) )
                var_5 playsound( var_6 );
            else
                var_5 playsound( "warl_se_dooropen1_02" );

            break;
        case "fx_dragonfly_flyby":
            var_7 = var_1[0];
            var_8 = var_1[1];
            var_9 = var_1[2];
            var_10 = distance( level.player.origin, var_7 ) / 36.0;
            var_11 = spawn( "script_origin", var_7 );
            var_11 playloopsound( "insect_dragonfly_single_01_lp" );
            var_11 moveto( var_8, var_9 );
            wait(var_9);
            var_11 scalevolume( 0.0, 3 );
            wait 0.5;
            var_11 delete();
            break;
        case "intro_river_technicals":
            var_12 = var_1[0];
            var_13 = var_1[1];
            var_14 = "intro_river_technical_01";
            var_15 = "intro_river_technical_02";
            var_16 = "tech_drive_slow_lp";
            var_17 = "tech_sus_bounce_fast_river_intro";
            var_18 = "tech_idle_hi";
            var_19 = undefined;
            var_12 thread _id_5547( var_14, var_16, var_17, var_18, var_19 );
            var_20 = spawn( "script_origin", ( 2053.0, -1448.0, 10.0 ) );
            var_21 = spawn( "script_origin", ( 2736.0, -1896.0, 92.0 ) );
            var_20 playsound( "tech_river_01_L", "sounddone" );
            var_21 playsound( "tech_river_01_R", "sounddone" );
            common_scripts\utility::flag_wait( "river_technical_stopped" );
            maps\_audio::_id_15F3( var_20, 3 );
            maps\_audio::_id_15F3( var_21, 3 );
            break;
        case "super_technical":
            var_12 = var_1;
            var_14 = "super_technical";
            var_16 = "tech_drive_slow_lp";
            var_17 = "tech_dirt_roll_lp";
            var_18 = "tech_idle_hi";
            var_19 = undefined;
            var_12 thread _id_5547( var_14, var_16, var_17, var_18, var_19 );
            break;
        case "technical_1":
            break;
        case "technical_2":
            var_12 = var_1;
            level._id_16F5._id_5528 = var_12;
            var_14 = "technical_2";
            var_20 = spawn( "script_origin", ( 1098.0, 2150.0, 110.0 ) );
            var_21 = spawn( "script_origin", ( 2088.0, 2071.0, -1.0 ) );
            var_16 = "tech_drive_slow_lp";
            var_17 = "tech_dirt_roll_lp";
            var_18 = "tech_idle_hi";
            var_19 = "tech_gravel_lp";
            var_12 thread _id_5547( var_14, var_16, var_17, var_18, var_19 );
            var_20 playsound( "tech_dist_river_L", "sounddone" );
            var_21 playsound( "tech_dist_river_R", "sounddone" );
            var_12 waittill( "stealth_broken_unload" );
            maps\_audio::_id_15F3( var_20, 3 );
            maps\_audio::_id_15F3( var_21, 3 );
            break;
        case "river_technical_01":
            var_12 = var_1;
            thread _id_554B( var_12 );
            var_14 = "river_technical_01";
            var_20 = spawn( "script_origin", ( 456.0, 1940.0, 53.0 ) );
            var_21 = spawn( "script_origin", ( 1757.0, 2039.0, 53.0 ) );
            var_16 = "tech_drive_slow_lp";
            var_17 = "tech_dirt_roll_lp";
            var_18 = "tech_idle_hi";
            var_19 = "tech_gravel_lp";
            var_12 thread _id_5547( var_14, var_16, var_17, var_18, var_19 );
            var_20 playsound( "tech_river_01_L", "sounddone" );
            var_21 playsound( "tech_river_01_R", "sounddone" );
            var_12 waittill( "stealth_broken_unload" );
            maps\_audio::_id_15F3( var_20, 2 );
            maps\_audio::_id_15F3( var_21, 2 );
            break;
        case "river_prone_encounter":
            break;
        case "river_big_moment_second_beat":
            common_scripts\utility::flag_set( "aud_grass_hide" );
            common_scripts\utility::flag_wait( "aud_river_big_moment_end" );
            common_scripts\utility::flag_clear( "aud_grass_hide" );
            break;
        case "river_big_moment_end":
            common_scripts\utility::flag_set( "aud_river_big_moment_end" );
            break;
        case "river_driveby_technical":
            break;
        case "bridge_technical":
            var_12 = var_1;
            var_14 = "bridge_technical";
            var_20 = spawn( "script_origin", ( 2268.0, 4116.0, 90.0 ) );
            var_21 = spawn( "script_origin", ( 3682.0, 4039.0, 90.0 ) );
            var_16 = "tech_drive_slow_lp";
            var_17 = "tech_dirt_roll_lp";
            var_18 = "tech_idle_hi";
            var_19 = undefined;
            var_12 thread _id_5547( var_14, var_16, var_17, var_18, var_19 );
            var_20 playsound( "tech_bridge_by_L", "sounddone" );
            var_21 playsound( "tech_bridge_by_R", "sounddone" );
            var_12 waittill( "stealth_broken_unload" );
            maps\_audio::_id_15F3( var_20, 2 );
            maps\_audio::_id_15F3( var_21, 2 );
            break;
        case "player_technical_splashdown":
            var_22 = var_1;
            maps\_audio::_id_1794( "warl_jump_splashdown" );
            break;
        case "player_technical":
            var_12 = var_1;
            var_14 = "player_technical";
            var_16 = "tech_drive_slow_lp";
            var_17 = "tech_sus_bounce_fast";
            var_18 = "tech_idle_hi";
            var_19 = undefined;
            var_12 thread _id_5547( var_14, var_16, var_17, var_18, var_19 );
            common_scripts\utility::flag_wait( "player_technical_drivein" );
            maps\_audio::_id_15D7( "tech_player_inc_os", var_12 );
            break;
        case "player_using_tech_turret":
            common_scripts\utility::flag_set( "aud_player_using_tech_turret" );
            maps\_audio_mix_manager::_id_1517( "warl_player_tech_shoot", 0 );
            break;
        case "arena_technical_01":
            var_12 = var_1;
            var_12 thread _id_553A();
            var_14 = "arena_technical_01";
            var_20 = spawn( "script_origin", ( 2268.0, 4116.0, 90.0 ) );
            var_21 = spawn( "script_origin", ( 3321.0, 3739.0, 90.0 ) );
            var_16 = "tech_dirt_roll_fast";
            var_17 = "tech_sus_bounce_fast";
            var_18 = "tech_idle_hi";
            var_19 = undefined;
            var_12 playsound( "tech_arena_01_inc_os" );
            var_12 waittill( "stealth_broken_unload" );
            maps\_audio::_id_15F3( var_20, 2 );
            maps\_audio::_id_15F3( var_21, 2 );
            break;
        case "arena_technical_02":
            var_12 = var_1;
            var_12 thread _id_553A();
            var_14 = "arena_technical_02";
            var_16 = "tech_dirt_roll_fast";
            var_17 = "tech_sus_bounce_fast";
            var_18 = "tech_idle_hi";
            var_19 = undefined;
            var_12 playsound( "tech_arena_02_inc_os" );
            break;
        case "tech_mortar_incoming":
            common_scripts\utility::flag_set( "aud_mortar_slowmo" );
            thread _id_554A();
            break;
        case "player_turret_destroyed":
            maps\_audio_mix_manager::_id_1517( "warl_player_tech_explode", 0 );
            maps\_audio_mix_manager::_id_1520( "warl_player_tech_shoot", 0 );
            wait 1.2;
            maps\_audio_mix_manager::_id_1520( "warl_player_tech_explode", 0 );
            wait 0.5;
            thread common_scripts\utility::play_sound_in_space( "scn_tech_land_debris_front", level.player.origin );
            thread common_scripts\utility::play_sound_in_space( "scn_tech_debris_rain", level.player.origin );
            common_scripts\utility::flag_clear( "aud_player_using_tech_turret" );
            wait 0.6;
            maps\_audio_mix_manager::_id_1517( "warl_mortar_run", 0.3 );
            wait 4;
            common_scripts\utility::flag_clear( "aud_mortar_slowmo" );
            break;
        case "aud_fire_mortar_shell":
            thread _id_5531( var_1 );
            break;
        case "player_mortar_falling":
            var_23 = var_1;
            thread _id_5532( var_23 );
            break;
        case "mortar_run_end":
            maps\_audio_mix_manager::_id_1520( "warl_mortar_run", 0.1 );
            break;
        case "player_fire_mortar":
            thread common_scripts\utility::play_sound_in_space( "mortar_60mm_launch" );
            thread common_scripts\utility::play_sound_in_space( "mortar_60mm_tube_elem" );
            thread common_scripts\utility::play_sound_in_space( "mortar_60mm_fire_plr" );
            break;
        case "pre_truck_explode_fake_mortar_incoming":
            thread maps\_audio::_id_1794( "warl_fake_incoming_tech" );
            break;
        case "pre_truck_explode_fake_mortar":
            var_24 = var_1;
            var_25 = maps\_audio::_id_17A6( var_24 );
            var_26 = var_25.v["origin"];
            thread common_scripts\utility::play_sound_in_space( "warl_fake_mortar_explo_3d", var_26 );
            wait 1.6;
            thread maps\_audio::_id_1794( "warl_fake_incoming_tech_whoosh" );
            break;
        case "mortar_explosion":
            var_26 = var_1;
            thread _id_552E( var_26 );
            break;
        case "second_house_explode":
            break;
        case "mortar_house_explode":
            break;
        case "fall_through_roof":
            level._id_16F5._id_5529 = 1;
            break;
        case "player_mortar_attach":
            common_scripts\utility::flag_set( "player_using_mortar" );
            level.player playsound( "weap_mortar60mm_attach_plr" );
            _id_448B( "mus_player_mortar" );
            break;
        case "player_mortar_detach":
            common_scripts\utility::flag_clear( "player_using_mortar" );
            level.player playsound( "weap_mortar60mm_attach_plr" );
            break;
        case "mortar_technical_1_spawneds":
            break;
        case "sleeping_guard_spawned":
            var_27 = var_1;
            var_27 thread _id_5533();
            break;
        case "aud_kill_sleeping_guard":
            common_scripts\utility::flag_set( "kill_sleeping_guard" );
            break;
        case "aud_wake_sleeping_guard":
            common_scripts\utility::flag_set( "kill_sleeping_guard" );
            thread common_scripts\utility::play_sound_in_space( "warl_folding_chair_fall", ( 4564.0, 3198.0, 190.0 ) );
            wait 0.75;
            thread common_scripts\utility::play_sound_in_space( "warl_folding_chair_impact", ( 4564.0, 3198.0, 190.0 ) );
            break;
        case "compound_technical_right":
            var_28 = var_1;
            var_28 playsound( "tech_arena_01_inc_os" );
            break;
        case "warlord_assault":
            break;
        case "mi17_flyby":
            var_29 = var_1;
            common_scripts\utility::flag_set( "mi17_flyby" );
            var_30 = maps\_audio::_id_15D7( "warl_heli_by_overhead", var_29 );
            var_30 scalevolume( 1.0, 1 );
            thread _id_5550( var_29 );
            break;
        case "first_heli_deleted":
            common_scripts\utility::flag_set( "aud_first_heli_deleted" );
            break;
        case "warlord_end_all_clear":
            common_scripts\utility::flag_set( "aud_finale_all_clear" );
            break;
        case "mi17_finale_flyout":
            var_29 = var_1;

            if ( isdefined( var_29 ) )
            {
                level._id_16F5._id_552A = var_29;
                common_scripts\utility::flag_set( "aud_second_heli_spawned" );
            }

            var_29 thread _id_5551();
            break;
        case "church_doors_open":
            var_5 = var_1;
            thread common_scripts\utility::play_sound_in_space( "warl_church_door_open", var_5.origin );
            wait 0.3;
            thread common_scripts\utility::play_sound_in_space( "warl_hyena_church_reveal_01", ( 3454.0, 8758.0, 977.0 ) );
            wait 0.5;
            thread common_scripts\utility::play_sound_in_space( "warl_hyena_church_reveal_02", ( 3508.0, 8878.0, 977.0 ) );
            break;
        case "player_breach":
            common_scripts\utility::flag_set( "player_breach" );
            break;
        case "price_gun_sweetener":
            wait 0.05;
            thread _id_0015( var_1 );
            break;
        case "price_gun_sweetener_burst":
            wait 0.05;
            thread _id_0016( var_1 );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_448B( var_0, var_1 )
{
    thread _id_448C( var_0, var_1 );
}

_id_448C( var_0, var_1 )
{
    var_2 = 1;

    if ( getsubstr( var_0, 0, 4 ) != "mus_" )
        return 0;

    level notify( "kill_other_music" );
    level endon( "kill_other_music" );

    switch ( var_0 )
    {
        case "mus_intro":
            wait 1.0;
            maps\_audio_music::_id_15A7( "warl_intro", 6 );
            wait 10;
            maps\_audio::_id_17A2( 0.6, 6 );
            break;
        case "mus_stop_intro_music":
            maps\_audio::_id_17A2( 0.4, 10 );
            wait 10;
            maps\_audio_music::_id_15A8( 25 );
            break;
        case "mus_river_first_encounter_start":
            maps\_audio::_id_17A2( 1, 1 );
            maps\_audio_music::_id_15A7( "warl_tangos_approaching", 8.0 );
            break;
        case "mus_river_first_encounter_all_clear":
            maps\_audio::_id_17A2( 1, 1 );
            maps\_audio_music::_id_15A7( "warl_tangos_all_clear", 12.0 );
            break;
        case "mus_river_first_encounter_spotted":
            maps\_audio::_id_17A2( 1, 0.25 );
            maps\_audio_music::_id_15A7( "warl_go_hot", 0, 5 );
            break;
        case "mus_take_them_out":
            maps\_audio_music::_id_15A7( "warl_take_them_out", 5.0 );
            maps\_audio_dynamic_ambi::_id_149F( "warl_vo_african_taunt_pos", ( 470.0, 897.0, 35.0 ), "tire_fire_taunts", 1500, 3 );
            break;
        case "mus_take_them_out_busted":
            maps\_audio::_id_17A2( 1, 0.25 );
            maps\_audio_music::_id_15A7( "warl_go_hot", 0, 2 );
            break;
        case "mus_take_them_out_all_clear":
            maps\_audio_music::_id_15A7( "warl_take_them_out", 10.0 );
            break;
        case "mus_tire_burning_start":
            wait 25;
            maps\_audio_dynamic_ambi::_id_14A0( "warl_vo_african_taunt_pos", "tire_fire_taunts", 4 );
            break;
        case "mus_tire_burning_busted":
            maps\_audio_dynamic_ambi::_id_14A0( "warl_vo_african_taunt_pos", "tire_fire_taunts", 3 );
            maps\_audio::_id_17A2( 1, 0.25 );
            maps\_audio_music::_id_15A7( "warl_go_hot", 0, 2 );
            level._id_16F5._id_552B = 1;
            break;
        case "mus_tire_burning_all_clear":
            maps\_audio_dynamic_ambi::_id_14A0( "warl_vo_african_taunt_pos", "tire_fire_taunts", 3 );

            if ( isdefined( level._id_16F5._id_552B ) )
                wait 2;

            maps\_audio::_id_17A2( 1, 6 );
            maps\_audio_music::_id_15A7( "warl_tire_burning_all_clear", 10.0 );
            break;
        case "mus_river_big_moment_start":
            maps\_audio_dynamic_ambi::_id_149F( "warl_vo_african_big_moment_pos", ( 1582.0, 2141.0, -26.0 ), "big_moment", 1500, 6 );
            break;
        case "mus_river_big_moment_grass_start":
            maps\_audio_music::_id_15A8( 10 );
            wait 10;
            maps\_audio::_id_17A2( 1.0, 1 );
            break;
        case "mus_river_big_moment_grass_prone":
            break;
        case "mus_river_big_moment_grass_stop":
            maps\_audio_music::_id_15A7( "warl_get_down_all_clear", 8.0 );
            break;
        case "mus_river_big_moment_busted":
            maps\_audio::_id_17A2( 1, 0.25 );
            maps\_audio_music::_id_15A7( "warl_go_hot", 0, 2 );
            maps\_audio_dynamic_ambi::_id_14A0( "warl_vo_african_big_moment_pos", "big_moment", 1 );
            break;
        case "mus_river_big_moment_all_clear":
            maps\_audio_music::_id_15A7( "warl_bridge_guys_dead", 5.0 );
            maps\_audio::_id_17A2( 1, 5 );
            maps\_audio_dynamic_ambi::_id_14A0( "warl_vo_african_big_moment_pos", "big_moment", 5 );
            break;
        case "mus_church_mouse":
            maps\_audio::_id_17A2( 0, 12 );
            break;
        case "mus_bridge_guys_dead":
            maps\_audio_music::_id_15A7( "warl_bridge_guys_dead", 5.0 );
            maps\_audio::_id_17A2( 0.7, 5 );
            wait 20;
            maps\_audio_music::_id_15A8( 60 );
            break;
        case "mus_corner_kill":
            maps\_audio::_id_17A2( 1, 3 );
            maps\_audio_music::_id_15A7( "warl_corner_kill", 5.0 );
            break;
        case "mus_corner_kill_busted":
            break;
        case "mus_tower_snipe":
            wait 8;
            maps\_audio_music::_id_15A7( "warl_tower_snipe", 5.0 );
            break;
        case "mus_overwatch_busted":
            maps\_audio::_id_17A2( 1, 0.25 );
            maps\_audio_music::_id_15A7( "warl_go_hot", 0, 2 );
            break;
        case "mus_go_hot":
            maps\_audio::_id_17A2( 1, 0.25 );
            maps\_audio_music::_id_15A7( "warl_go_hot", 0, 2 );
            break;
        case "mus_to_technical":
            wait 4;
            maps\_audio_music::_id_15A7( "warl_to_technical", 5.0 );
            break;
        case "mus_player_on_technical":
            maps\_audio_music::_id_15A8( 10 );
            break;
        case "mus_mortar_inbound":
            maps\_audio::_id_17A2( 1, 0.1 );
            maps\_audio_music::_id_15A7( "warl_drone_e", 1 );
            wait 7;
            maps\_audio::_id_17A2( 1000, 1 );
            maps\_audio_music::_id_15A7( "warl_mortar_inbound", 1 );
            break;
        case "mus_yuri_down":
            maps\_audio::_id_17A2( 1, 10 );
            maps\_audio_music::_id_15A7( "warl_yuri_down", 1.0 );
            break;
        case "mus_player_mortar":
            maps\_audio::_id_17A2( 1, 3 );
            maps\_audio_music::_id_15A7( "warl_player_mortar", 5.0 );
            break;
        case "mus_player_mortar_done":
            maps\_audio_music::_id_15A7( "warl_post_player_mortar", 1 );
            break;
        case "mus_enter_sewer_pipe":
            if ( !isdefined( level._id_16F5._id_552C ) )
            {
                level._id_16F5._id_552C = 1;
                maps\_audio_music::_id_15A8( 8 );
            }

            break;
        case "mus_exit_sewer_pipe":
            if ( !isdefined( level._id_16F5._id_552D ) )
            {
                level._id_16F5._id_552D = 1;
                maps\_audio_music::_id_15A7( "warl_exit_sewer_pipe", 5 );
            }

            break;
        case "mus_house_shootout":
            break;
        case "mus_down_the_street":
            maps\_audio::_id_17A2( 0.5, 5 );
            maps\_audio_music::_id_15A7( "warl_to_technical", 3.0 );
            break;
        case "mus_shoulder_charge_door":
            wait 10;
            maps\_audio::_id_17A2( 1, 5 );
            maps\_audio_music::_id_15A7( "warl_down_the_street", 5.0 );
            break;
        case "mus_technical_destroyed":
            break;
        case "mus_pre_church_door_breach":
            maps\_audio_music::_id_15A7( "warl_pre_church_door_breach", 8.0 );
            break;
        case "mus_dog_scene":
            maps\_audio::_id_17A2( 1, 1 );
            maps\_audio_music::_id_15A7( "warl_dog_fight", 3.0 );
            wait 5;
            maps\_audio_zone_manager::_id_156C( "warl_end" );
            wait 15;
            maps\_audio_music::_id_15A7( "warl_drone_e", 8 );
            break;
        case "mus_price_kicks_doors":
            maps\_audio_music::_id_15A7( "warl_price_kicks_doors", 3.0 );
            wait 35;
            maps\_audio_music::_id_15A7( "warl_ending_filler", 4.0 );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_552E( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( common_scripts\utility::flag( "player_using_mortar" ) )
        {
            thread common_scripts\utility::play_sound_in_space( "mortar_impact_3d", var_0 );
            thread common_scripts\utility::play_sound_in_space( "player_3d_mortar", var_0 );
            thread common_scripts\utility::play_sound_in_space( "player_mortar_debris", var_0 );
            wait 0.2;
            thread common_scripts\utility::play_sound_in_space( "player_mortar_debris_lyr", var_0 );
        }
        else if ( !isdefined( level._id_16F5._id_5529 ) )
        {
            thread common_scripts\utility::play_sound_in_space( "npc_mortar_lfe", var_0 );
            thread common_scripts\utility::play_sound_in_space( "mortar_run_impact_2d", var_0 );
            thread common_scripts\utility::play_sound_in_space( "npc_2d_mortar", var_0 );
            thread common_scripts\utility::play_sound_in_space( "npc_mortar_debris_lyr", var_0 );
            wait 0.08;
            thread common_scripts\utility::play_sound_in_space( "mortar_impact_ring", var_0 );
            wait 0.2;
            thread common_scripts\utility::play_sound_in_space( "npc_mortar_debris", var_0 );
        }
        else
        {
            thread common_scripts\utility::play_sound_in_space( "mortar_run_impact_3d", var_0 );
            thread common_scripts\utility::play_sound_in_space( "npc_3d_mortar", var_0 );
            thread common_scripts\utility::play_sound_in_space( "npc_mortar_debris_lyr", var_0 );
            wait 0.08;
            thread common_scripts\utility::play_sound_in_space( "mortar_impact_ring", var_0 );
            wait 0.2;
            thread common_scripts\utility::play_sound_in_space( "npc_mortar_debris", var_0 );
        }
    }
}

_id_552F( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[1];
    var_3 = randomint( 5 );

    if ( var_3 < 4 )
        var_4 = randomfloatrange( 0.25, 0.65 );
    else
        var_4 = randomfloatrange( 0.65, 1.0 );
}

_id_5530( var_0, var_1 )
{
    var_2 = 0.5;
    var_3 = var_1 - var_2;

    if ( var_3 < 0 )
        var_3 = 0;

    wait(var_3);
    thread maps\_audio::_id_1794( "warl_artillery_incoming_whoosh" );
}

_id_5531( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[1];
    var_3 = var_0[2];
    var_4 = var_0[3];
    var_5 = spawn( "script_origin", var_2 );

    if ( common_scripts\utility::flag( "player_using_mortar" ) )
    {
        var_6 = spawn( "script_origin", var_1.origin );
        var_6 linkto( var_1 );
        wait 0.3;
        maps\_audio::_id_1788( var_6, "warl_artillery_incoming_plr", 1.0, 0.25, 0 );
        var_1 waittill( "death" );
        var_6 stopsounds();
        wait 0.05;
        var_6 delete();
    }
    else
    {
        thread common_scripts\utility::play_sound_in_space( "mortar_60mm_launch3d", var_3 );
        thread common_scripts\utility::play_sound_in_space( "mortar_60mm_tube_elem3d", var_3 );
        thread common_scripts\utility::play_sound_in_space( "mortar_60mm_fire3d", var_3 );
        wait 0.15;
        var_6 = spawn( "script_origin", var_1.origin );
        var_6 linkto( var_1 );
        wait 0.1;
        maps\_audio::_id_1788( var_6, "warl_artillery_incoming_npc", 1.0, 0.25, 0 );
        var_1 waittill( "death" );
        var_6 stopsounds();
        wait 0.05;
        var_6 delete();
    }
}

_id_5532( var_0 )
{

}

_id_5533()
{
    thread _id_5534();
    self playloopsound( "warl_guardsnore_lp" );
    common_scripts\utility::flag_wait_any( "snoring_guard_dead", "kill_sleeping_guard", "inf_stealth_spotted", "infiltration_over" );
    self stoploopsound( "warl_guardsnore_lp" );
    common_scripts\utility::play_sound_in_space( "warl_guardsurprise", ( 4575.0, 3191.0, 232.0 ) );
}

_id_5534()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "snoring_guard_dead" );
}

_id_5535()
{
    common_scripts\utility::loop_fx_sound( "warl_wind_heavy_lp", ( 3876.0, 2546.0, 800.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_wind_heavy_lp", ( 7198.0, 5314.0, -208.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_wind_heavy_lp", ( 6470.0, 7111.0, 1500.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_wind_med_lp", ( 6508.0, 8932.0, 632.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_wind_med_lp", ( 6118.0, 8511.0, 699.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_dog_in_house_lp", ( 6878.0, 8346.0, 626.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_water_pipe_drips", ( 6444.0, 8368.0, 576.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_water_pipe_drips", ( 6250.0, 8530.0, 576.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_water_pipe_drips", ( 6027.0, 8718.0, 576.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_water_pipe_outflow", ( 5883.0, 8853.0, 536.0 ), 1 );
    common_scripts\utility::loop_fx_sound( "warl_water_pipe_outflow", ( 5636.0, 9261.0, 468.0 ), 1 );
}

_id_5536()
{
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket1", ( 1477.0, -1764.0, 57.0 ), "cricket_log_encouter1", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket2", ( 1212.0, -36.0, -24.0 ), "cricket_log_encouter2", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket1", ( 520.0, 668.0, 15.0 ), "cricket_tire_encouter1", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket2", ( 824.0, 1010.0, 49.0 ), "cricket_tire_encouter2", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket1", ( 1772.0, 3118.0, -1.0 ), "cricket_after_bridgesnipe1", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket2", ( 2925.0, 3487.0, 2.0 ), "cricket_after_bridgesnipe2", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket2", ( 4152.0, 2656.0, 23.0 ), "cricket_after_cornerkill", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket2", ( 6929.0, 8136.0, 565.0 ), "cricket_before_tunnel", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_cricket2", ( 6125.0, 8635.0, 576.0 ), "cricket_inside_tunnel", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_river_positional", ( 1719.0, 1535.0, 0.0 ), "river_insects_by_log", 440, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_river_positional", ( 2010.0, 2062.0, 0.0 ), "river_insects_by_metal", 440, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_river_positional", ( 2334.0, 2725.0, 0.0 ), "river_insects_by_palette", 440, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_river_positional", ( 2475.0, 3280.0, 0.0 ), "river_insects_under_bridge", 440, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_river_positional", ( 2480.0, 3741.0, 0.0 ), "river_insects_by_trash_bags", 440, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 5169.0, 2961.0, 500.0 ), "tower_sniper_dead_cow", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 3561.0, 2786.0, 180.0 ), "tower_sniper_trash_pile1", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 3930.0, 2562.0, -14.0 ), "tower_sniper_trash_pile2", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 4189.0, 3149.0, 0.0 ), "tower_sniper_trash_pile3", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 4309.0, 3364.0, 0.0 ), "tower_sniper_trash_pile4", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 4227.0, 2804.0, 0.0 ), "tower_sniper_trash_pile5", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 5188.0, 2630.0, -50.0 ), "tower_sniper_trash_pile6", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 6127.0, 3238.0, -90.0 ), "tower_sniper_trash_pile7a", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 6097.0, 3222.0, -90.0 ), "tower_sniper_trash_pile7b", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_tunnel_positional", ( 6500.0, 8309.0, 576.0 ), "water_tunnel_1", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_tunnel_positional", ( 6234.0, 8538.0, 579.0 ), "water_tunnel_2", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_tunnel_positional", ( 5976.0, 8767.0, 576.0 ), "water_tunnel_3", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 5781.0, 9084.0, 538.0 ), "post_water_tunnel_trash_pile", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 6720.0, 10516.0, 503.0 ), "house_town_dense2_water1", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 7045.0, 10387.0, 495.0 ), "house_town_dense2_water2", 720, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_maggots_positional", ( 6987.0, 9598.0, 550.0 ), "house_town_dense2_water3", 720, 3 );
}

_id_5537()
{
    maps\_audio_dynamic_ambi::_id_149F( "warl_tunnel_positional", ( 6500.0, 8309.0, 576.0 ), "water_tunnel_1", 630, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_tunnel_positional", ( 6234.0, 8538.0, 579.0 ), "water_tunnel_2", 360, 3 );
    maps\_audio_dynamic_ambi::_id_149F( "warl_tunnel_positional", ( 5976.0, 8767.0, 576.0 ), "water_tunnel_3", 630, 3 );
}

_id_5538()
{
    maps\_audio_dynamic_ambi::_id_14A0( "warl_tunnel_positional", "water_tunnel_1", 3 );
    maps\_audio_dynamic_ambi::_id_14A0( "warl_tunnel_positional", "water_tunnel_2", 3 );
    maps\_audio_dynamic_ambi::_id_14A0( "warl_tunnel_positional", "water_tunnel_3", 3 );
}

_id_5539()
{
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles", ( 1208.0, -600.0, -47.0 ), "pre_hyena_01", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 946.0, -2.0, -42.0 ), "post_hyena_01", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 883.0, 221.0, -50.0 ), "post_hyena_02", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 789.0, 305.0, -27.0 ), "post_hyena_03", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 689.0, 237.0, -39.0 ), "post_hyena_04", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 798.0, -350.0, -50.0 ), "post_hyena_05", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 612.0, -339.0, -47.0 ), "post_hyena_06", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 541.0, -288.0, -35.0 ), "post_hyena_07", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 465.0, -136.0, -38.0 ), "post_hyena_08", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 320.0, -61.0, -21.0 ), "post_hyena_09", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles", ( 391.0, 82.0, -22.0 ), "post_hyena_10", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 431.0, 124.0, -30.0 ), "post_hyena_11", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 396.0, 156.0, 48.0 ), "post_hyena_12", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 249.0, 213.0, 64.0 ), "post_hyena_13", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 351.0, 297.0, 59.0 ), "post_hyena_14", 600, 1.0 );
    maps\_audio_dynamic_ambi::_id_149F( "fire_warlord_piles_sml", ( 52.0, 401.0, 2.0 ), "post_hyena_15", 600, 1.0 );
}

_id_553A()
{
    self waittill( "death" );
}

_id_553B()
{
    wait 3;
    common_scripts\utility::flag_wait( "mus_house_shootout" );
    maps\_audio::aud_send_msg( "mus_house_shootout" );
}

_id_553C()
{
    wait 3;
    common_scripts\utility::flag_wait( "mus_down_the_street" );
    maps\_audio::aud_send_msg( "mus_down_the_street" );
}

_id_553D()
{
    maps\_audio_mix_manager::_id_1517( "warl_swamp_footsteps_shallow", 0 );
    maps\_audio_mix_manager::_id_1517( "warl_swamp_footsteps_deep", 0 );
    wait 0.05;
    maps\_audio_mix_manager::_id_151E( "warl_swamp_footsteps_shallow", 0, 0 );
    level endon( "aud_warl_stop_monitor_footsteps" );
    var_0 = level._id_16F5._id_5522;

    for (;;)
    {
        var_1 = level.player.origin[2] - var_0;
        var_1 /= 40;
        var_2 = 1.0 - var_1;
        var_2 = clamp( var_2, 0.0, 1.0 );
        var_3 = var_1;
        var_1 = clamp( var_1, 0.0, 1.0 );
        maps\_audio_mix_manager::_id_151E( "warl_swamp_footsteps_shallow", var_3, 0.1 );
        maps\_audio_mix_manager::_id_151E( "warl_swamp_footsteps_deep", var_2, 0.1 );
        wait 0.1;
    }
}

_id_553E()
{
    level notify( "aud_warl_stop_monitor_footsteps" );
    maps\_audio_mix_manager::_id_1520( "warl_swamp_footsteps_shallow", 0 );
    maps\_audio_mix_manager::_id_1520( "warl_swamp_footsteps_deep", 0 );
}

_id_553F()
{
    maps\_audio_mix_manager::_id_1517( "warl_swamp_npc_footsteps_shallow", 0 );
    maps\_audio_mix_manager::_id_1517( "warl_swamp_npc_footsteps_deep", 0 );
    wait 0.05;
    maps\_audio_mix_manager::_id_151E( "warl_swamp_npc_footsteps_shallow", 0, 0 );
    level endon( "aud_warl_stop_monitor_footsteps" );
    var_0 = level._id_54E0.origin[2];

    for (;;)
    {
        var_1 = level._id_54E0.origin[2] - var_0;
        var_1 /= 40;
        var_2 = 1.0 - var_1;
        var_2 = clamp( var_2, 0.0, 1.0 );
        var_3 = var_1;
        var_1 = clamp( var_1, 0.0, 1.0 );
        maps\_audio_mix_manager::_id_151E( "warl_swamp_npc_footsteps_shallow", var_3, 0.1 );
        maps\_audio_mix_manager::_id_151E( "warl_swamp_npc_footsteps_deep", var_2, 0.1 );
        wait 0.1;
    }
}

_id_5540()
{
    level notify( "aud_warl_stop_monitor_footsteps" );
    maps\_audio_mix_manager::_id_1520( "warl_swamp_npc_footsteps_shallow", 0 );
    maps\_audio_mix_manager::_id_1520( "warl_swamp_npc_footsteps_deep", 0 );
}

_id_5541( var_0 )
{
    var_1 = 3.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    var_2 = spawn( "script_origin", level.player.origin );
    var_2 playloopsound( "warl_river_rain_drops_lp" );
    var_2 scalevolume( 0.0, 0 );
    wait 0.05;
    var_2 scalevolume( 1.0, var_1 );
    thread _id_5542( var_2, var_1 );
}

_id_5542( var_0, var_1 )
{
    level waittill( "aud_warl_stop_river_rain_drops" );
    var_0 scalevolume( 0.0, var_1 );
    wait(var_1 + 0.05);
    var_0 stoploopsound();
    wait 0.05;
    var_0 delete();
}

_id_5543( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    var_2 = spawn( "script_origin", level.player.origin );
    var_2 playloopsound( "warl_water_pipe_interiorflow" );
    var_2 scalevolume( 0.0, 0 );
    wait 0.05;
    var_2 scalevolume( 1.0, var_1 );
    thread _id_5544( var_2, var_1 );
}

_id_5544( var_0, var_1 )
{
    level waittill( "aud_warl_stop_sewer_pipe_interiorflow" );
    var_0 scalevolume( 0.0, var_1 );
    wait(var_1 + 0.05);
    var_0 stoploopsound();
    wait 0.05;
    var_0 delete();
}

_id_5545( var_0, var_1 )
{
    var_2 = spawn( "script_origin", var_1 );
    var_2 playsound( var_0, "sounddone" );
    var_2 waittill( "sounddone" );
    wait 0.05;
    var_2 delete();
}

_id_5546()
{
    common_scripts\utility::flag_wait( "aud_warlord_player_breach" );
    thread maps\_audio::_id_1791();
}

_id_5547( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = "null_lp";

    level._id_16F5._id_15D8 = spawn( "script_origin", self.origin );
    var_5 = spawn( "script_origin", self.origin );
    var_6 = spawn( "script_origin", self.origin );
    var_7 = spawn( "script_origin", self.origin );
    var_8 = spawn( "script_origin", self.origin );
    level._id_16F5._id_15D8._id_17CC = 1;
    var_9 = level._id_16F5._id_15D8;
    var_10 = level._id_16F5._id_15D8._id_17CC;
    var_5 linkto( self );
    var_7 linkto( self );
    var_6 linkto( self );
    var_8 linkto( self );
    var_5 playloopsound( var_1 );
    var_6 playloopsound( var_2 );
    var_7 playloopsound( var_3 );
    var_8 playloopsound( var_4 );
    var_5 scalevolume( 0.0 );
    var_6 scalevolume( 0.0 );
    var_7 scalevolume( 0.0 );
    var_8 scalevolume( 0.0 );
    wait 0.3;
    _id_5548( var_9, var_5, var_6, var_7, var_8, 1, 10, var_10 );
}

_id_5548( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_5 = 1;
    var_6 = 10;
    thread _id_5549( var_0, var_1, var_2, var_3, var_4 );
    var_0 endon( "instance_killed" );
    var_8 = 0;

    for (;;)
    {
        if ( isdefined( self ) )
        {
            var_9 = self vehicle_getspeed();
            var_9 = min( var_9, var_6 );
            var_9 = maps\_audio::_id_178B( var_8, var_9, 0.1 );
            var_10 = maps\_audio::_id_178A( var_9, var_5, var_6, level._id_16F5._id_440B["veh_drive_vol"] );
            var_11 = maps\_audio::_id_178A( var_9, var_5, var_6, level._id_16F5._id_440B["veh_idle_vol"] );
            var_12 = maps\_audio::_id_178A( var_9, var_5, var_6, level._id_16F5._id_440B["veh_gravel_vol"] );
            var_2 scalevolume( var_10, 0.1 );
            var_1 scalevolume( var_10, 0.1 );
            var_3 scalevolume( var_11, 0.1 );
            var_4 scalevolume( var_12, 0.1 );
            var_8 = var_9;
            wait 0.1;
        }
    }
}

_id_5549( var_0, var_1, var_2, var_3, var_4 )
{
    self waittill( "death" );
    var_0 notify( "instance_killed" );
    thread _id_440F( var_1, 5 );
    thread _id_440F( var_2, 5 );
    thread _id_440F( var_3, 5 );
    thread _id_440F( var_4, 5 );
}

_id_440F( var_0, var_1 )
{
    var_0 scalevolume( 0.0, var_1 );
    wait(var_1 + 0.05);
    var_0 stoploopsound();
    wait 0.05;
    var_0 delete();
}

_id_554A()
{
    maps\_audio::_id_1719();
    soundsettimescalefactor( "norestrict2d", 0 );
    soundsettimescalefactor( "norestrict", 0 );
    common_scripts\utility::flag_waitopen( "aud_mortar_slowmo" );
    maps\_audio::_id_1717();
}

_id_554B( var_0 )
{
    var_1 = spawn( "script_origin", var_0.origin );
    var_1 linkto( var_0 );
    var_1._id_554C = 1;
    var_1 playloopsound( "warl_militia_rap1" );
    var_0 thread _id_554D( var_1 );
    var_0 waittill( "death" );

    if ( var_1._id_554C )
    {
        var_1.origin = level._id_16F5._id_5528.origin;
        var_1 linkto( level._id_16F5._id_5528 );
        level._id_16F5._id_5528 waittill( "death" );
        var_1 scalevolume( 0, 3 );
        wait 3.05;
        var_1 stoploopsound();
    }

    var_1 delete();
}

_id_554D( var_0 )
{
    for (;;)
    {
        if ( !isdefined( self ) || !isdefined( var_0 ) )
            return;

        if ( self.health < self._id_163B )
        {
            var_0._id_554C = 0;
            var_0 stoploopsound();
        }

        wait 0.05;
    }
}

_id_554E()
{
    if ( !level._id_16F5._id_5521 )
    {
        if ( common_scripts\utility::flag( "inside_prechurch_burnthouse" ) )
        {
            var_0 = maps\_audio::_id_15D7( "warl_heli_circle_overhead", level.player, "loop", "kill_heli_circle_loop" );
            level._id_16F5._id_5521 = 1;
            var_0 scalevolume( 0.0 );
            wait 0.05;
            var_0 thread _id_554F();
            common_scripts\utility::flag_wait( "mi17_flyby" );

            if ( isdefined( var_0 ) )
            {
                var_0 scalevolume( 1, 1 );
                wait 1;
                var_0 scalevolume( 0.0, 3 );
                wait 3.5;
                level notify( "kill_heli_circle_loop" );
            }
        }
    }
}

_id_554F()
{
    level endon( "mi17_flyby" );
    var_0 = 2000;
    var_1 = ( 6100.0, 8089.0, 806.0 );
    var_2 = 2.5;

    for (;;)
    {
        var_3 = distance2d( level.player.origin, var_1 );
        var_4 = maps\_audio::_id_178A( var_3, 0, var_0, level._id_16F5._id_440B["mi17_fake_scale"] );
        self scalevolume( var_4, var_2 );
        wait(var_2);
        var_2 = 1;
    }
}

_id_5550( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_1 = spawn( "script_origin", var_0.origin );
        var_1 linkto( var_0 );
        var_2 = spawn( "script_origin", var_0.origin );
        var_2 linkto( var_0 );
        maps\_audio::_id_1788( var_1, "warl_heli_blades_loop", 1.0, 3, 1 );
        maps\_audio::_id_1788( var_2, "warl_heli_occluded_lo_lp", 1.0, 3, 1 );
        var_1 thread _id_5553();
        common_scripts\utility::flag_wait( "aud_first_heli_deleted" );
        var_2 unlink( var_0 );
        common_scripts\utility::flag_wait( "aud_second_heli_spawned" );
        var_3 = level._id_16F5._id_552A;

        if ( isdefined( var_3 ) )
            var_2 linkto( var_3 );
    }
}

_id_5551()
{
    if ( isdefined( self ) )
    {
        var_0 = spawn( "script_origin", self.origin );
        var_0 linkto( self );
        common_scripts\utility::flag_wait( "aud_warlord_player_breach" );
        wait 1.1;
        thread maps\_audio::_id_1788( var_0, "warl_heli_blades_loop_finale", 1, 0.2, 1 );
        maps\_audio_mix_manager::_id_1517( "warl_finale" );
        var_0 thread _id_5552();
    }
}

_id_5552()
{
    if ( isdefined( self ) )
    {
        common_scripts\utility::flag_wait( "aud_finale_all_clear" );
        wait 2;
        var_0 = maps\_audio::_id_15D7( "warl_heli_take_off_fly_out", self );
        var_0 thread _id_5554();
        maps\_audio::_id_1794( "warl_heli_blades_dust_wind_2d" );
        maps\_audio::_id_1794( "warl_heli_paper_flutter_2d" );
        wait 4;
        thread common_scripts\utility::play_sound_in_space( "warl_heli_takeoff_close", ( 3173.0, 7867.0, 1306.0 ) );
        wait 2;
        maps\_audio_mix_manager::_id_1520( "warl_finale", 5 );
        wait 3;

        if ( isdefined( self ) )
            self scalevolume( 0.0, 10 );

        wait 10;

        if ( isdefined( self ) )
            self delete();
    }
}

_id_5553()
{
    wait 7.5;

    if ( isdefined( self ) )
        thread maps\_audio::_id_15F3( self, 5 );
}

_id_5554()
{
    wait 4;

    if ( isdefined( self ) )
        self scalevolume( 0.3, 1 );

    wait 1.5;

    if ( isdefined( self ) )
        self scalevolume( 1.0, 3 );

    wait 3;

    if ( isdefined( self ) )
        self scalevolume( 0.0, 7 );
}

_id_5555( var_0, var_1 )
{
    wait(var_0);

    if ( isdefined( self ) )
        self scalevolume( 1.0, var_1 );
}

_id_5556( var_0, var_1 )
{
    wait(var_0);

    if ( isdefined( self ) )
        self scalevolume( 0.0, var_1 );
}

_id_0015( var_0 )
{
    var_1 = 20;
    var_2 = spawn( "script_origin", var_0.origin );
    var_2 linkto( var_0 );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_2 playsound( "weap_ak47_fire_npc_warl" );
        wait 0.05;
    }

    var_2 delete();
}

_id_0016( var_0 )
{
    var_1 = 1;
    var_2 = spawn( "script_origin", var_0.origin );
    var_2 linkto( var_0 );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_2 playsound( "weap_ak47_fire_npc_warl" );
        wait 0.05;
    }

    var_2 delete();
}
