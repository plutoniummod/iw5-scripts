// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4629()
{
    wait 0.1;
    common_scripts\utility::flag_init( "tiff_checkpoint" );
    common_scripts\utility::flag_init( "tiff_hind_dead" );
    level._id_462A = [];
    level._id_462B = [];
    level._id_462C = [];
    level._id_462D = undefined;
    thread _id_462E();
    thread _id_463C();
    thread _id_4642();
    thread _id_4645();
    thread _id_4647();
    thread _id_4633();
    thread _id_4630();
    thread _id_4631();
    thread _id_4650();
    thread _id_4652();
    thread _id_4653();
    thread _id_4655();
    thread _id_4637();
    thread _id_46AB();
    thread _id_46AC();
    thread _id_46B4();
    maps\_utility::_id_1A5A( "axis", maps\ny_manhattan_code_intro::_id_45BD );
    maps\_utility::_id_27CB( "trading_guys_01", ::_id_46A8 );
    maps\_utility::_id_27CA( "nyse_rooftop_01", ::_id_46A9 );
    maps\_utility::_id_27CA( "nyse_rooftop_02", ::_id_46A9 );
    maps\_utility::_id_27CA( "tiff_guys", ::_id_46AA );
}

_id_462E()
{
    common_scripts\utility::flag_wait( "tiff_hummer_spawn" );
    var_0 = maps\_vehicle::_id_2A99( "tiff_hummer3" );
    var_1 = maps\_vehicle::_id_2A99( "tiff_hummer2" );
    var_1 maps\_utility::delaythread( 1, ::_id_462F );

    foreach ( var_3 in var_1._id_0A39 )
        var_3.ignoreall = 1;

    common_scripts\utility::flag_wait( "tiff_fight_04" );

    foreach ( var_3 in var_1._id_0A39 )
        var_3.ignoreall = 0;

    thread _id_4635( "nmy_wall_group_03" );
    maps\_audio::aud_send_msg( "tiff_hummer2_start", var_1 );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );

    foreach ( var_3 in var_1._id_0A39 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) )
            var_3 thread maps\ss_util::_id_441D();
    }
}

_id_462F()
{
    self endon( "death" );
    self endon( "stop_monitoring" );

    for (;;)
    {
        if ( self._id_0A39.size <= 0 )
        {
            maps\_vehicle::_id_2A3D();
            self notify( "stop_monitoring" );
        }

        wait 0.1;
    }
}

_id_4630()
{
    common_scripts\utility::flag_wait( "change_ally_color" );

    foreach ( var_1 in level._id_45A3 )
        var_1 maps\_utility::_id_13A4( "r" );

    wait 0.5;
    level._id_45C0 maps\_utility::_id_13A4( "y" );
}

_id_4631()
{
    common_scripts\utility::flag_wait( "wall_group1_done" );
    maps\_utility::_id_26BF( "color_trigger_03" );
    common_scripts\utility::flag_wait( "wall_group3_dead" );
    maps\_utility::_id_26BF( "colorsr4y4" );
    common_scripts\utility::flag_wait( "wall_baddies_03_dead" );
    maps\_utility::_id_26BF( "colors3001" );
}

_id_4632()
{
    common_scripts\utility::flag_wait( "tiff_sandman_moveout" );
    common_scripts\utility::flag_wait( "tiff_fight_03" );
}

_id_4633()
{
    common_scripts\utility::flag_wait( "tiff_hummer_spawn" );

    if ( !common_scripts\utility::flag( "tiff_guys_dead" ) )
    {
        var_0 = getaiarray( "axis" );
        common_scripts\utility::array_thread( var_0, maps\ss_util::_id_441C, "bullet", 3, 6 );
    }

    common_scripts\utility::flag_set( "change_ally_color" );
    maps\_utility::_id_1425( "exiting_stephanies" );
    common_scripts\utility::flag_wait( "tiff_fight_02" );
    var_1 = getentarray( "nmy_wall_group_2", "targetname" );
    var_2 = maps\_utility::_id_272B( var_1, 0, 1 );
    thread _id_4634( var_2, "wall_group1_done" );
    thread _id_463B();
    common_scripts\utility::flag_wait( "tiff_fight_03" );
    var_2 = getentarray( "wall_baddies_01", "script_noteworthy" );
    thread maps\ss_util::_id_4420( var_2, "nmy_wall_group_4_volume" );
    var_3 = getentarray( "nmy_wall_group_3", "targetname" );
    thread maps\_spawner::_id_2135( var_3 );
    maps\_spawner::_id_213C( 1011 );
    level._id_45A6 maps\ss_util::_id_4422( "reno_line7" );
    common_scripts\utility::flag_wait( "tiff_fight_04" );
    common_scripts\utility::array_thread( var_2, maps\ss_util::_id_441C, "bullet", 2, 4 );
    var_4 = getentarray( "wall_baddies_02", "script_noteworthy" );
    thread maps\ss_util::_id_4420( var_4, "volume_nyse_upper_combat" );
    var_5 = getentarray( "nmy_wall_group_4", "targetname" );
    thread maps\_spawner::_id_2135( var_5 );
    level._id_45C0 thread maps\_utility::_id_168C( "lonestar_line39" );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );
    common_scripts\utility::array_thread( var_4, maps\ss_util::_id_441C, "bullet", 4, 8 );
    maps\_spawner::_id_213C( 1004 );
    common_scripts\utility::flag_wait_either( "give_xm25", "skip_paw" );
    var_6 = getentarray( "wall_baddies_03", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\ss_util::_id_441C, "bullet", 4, 8 );
}

_id_4634( var_0, var_1 )
{
    level endon( var_1 );

    for (;;)
    {
        var_0 = common_scripts\utility::array_removeundefined( var_0 );

        if ( var_0.size < 3 )
            common_scripts\utility::flag_set( var_1 );

        wait 0.05;
    }
}

_id_4635( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 delete();
}

_id_4636( var_0, var_1 )
{
    var_2 = getentarray( var_1, "targetname" );
    var_3 = getnodearray( var_0, "targetname" );
    var_4 = 0;

    foreach ( var_6 in var_2 )
    {
        var_7 = var_6 dospawn();
        wait 0.05;
        var_8 = level._id_462A.size + var_4;
        level._id_462A[var_8] = var_7;

        if ( isdefined( var_3[var_4] ) && isdefined( var_2[var_4] ) )
            var_7 thread maps\_spawner::_id_21A4( var_3[var_4] );
        else if ( isdefined( var_2[var_4] ) )
            level._id_462B[level._id_462B.size] = var_2[var_4];

        wait 1;
        var_4++;
    }
}

_id_4637()
{
    common_scripts\utility::flag_wait_either( "tiff_hummer_spawn", "spawn_bravo_early" );
    level._id_4638 = [];
    var_0 = getentarray( "delta2_spawners", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 stalingradspawn();
        var_3 thread maps\_utility::_id_0D04( 1 );
        var_3 maps\_utility::_id_13A4( "r" );
        level._id_4638[level._id_4638.size] = var_3;

        if ( var_3.script_noteworthy == "d2_leader" )
        {
            level._id_4639 = var_3;
            level._id_4639._id_1032 = "delta2_leader";
        }
    }

    wait 1;

    if ( getdvarint( "demo_itiot" ) == 0 )
    {
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line177" );
        common_scripts\utility::flag_wait( "tiff_hummer_spawn" );
        thread _id_463A();
        common_scripts\utility::flag_wait( "tiff_fight_02" );
        var_5 = level.player getweaponslistall();

        foreach ( var_7 in var_5 )
        {
            if ( issubstr( var_7, "xm25" ) )
            {
                common_scripts\utility::flag_set( "player_has_xm" );

                if ( level.player getammocount( "xm25" ) <= 1 )
                {
                    level.player giveweapon( "xm25" );
                    level.player setweaponammoclip( "xm25", 4 );
                }

                level._id_45C4 maps\ss_util::_id_4422( "lonestar_line176" );
            }
        }

        if ( common_scripts\utility::flag( "player_has_xm" ) && !common_scripts\utility::flag( "player_used_xm25" ) )
        {
            var_9 = level.player getcurrentprimaryweapon();

            if ( !issubstr( var_9, "xm25" ) )
                maps\_utility::_id_1823( "hint_xm25", 5 );
        }
    }
}

_id_463A()
{
    maps\_shg_common::_id_168D();
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line37" );
    level._id_4639 maps\_utility::_id_168C( "d2_line1" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line131" );
    level._id_4639 maps\_utility::_id_168C( "d2_line4" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line132" );
    level._id_4639 maps\_utility::_id_168C( "d2_line5" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line133" );
    maps\_shg_common::_id_168E();
}

_id_463B()
{
    var_0 = maps\_vehicle::_id_2881( "ambient_hind01" );
    maps\_audio::aud_send_msg( "aud_beehind01_spawn", var_0 );
    wait 5;
    var_1 = maps\_vehicle::_id_2881( "ambient_hind02" );
    maps\_audio::aud_send_msg( "aud_beehind02_spawn", var_1 );
    wait 8;
    var_2 = maps\_vehicle::_id_2881( "ambient_hind01" );
    maps\_audio::aud_send_msg( "aud_beehind03_spawn", var_2 );
    common_scripts\utility::flag_wait( "tiff_fight_04" );
    wait 5;
    var_0 delete();
    var_1 delete();
    var_2 delete();
}

_id_463C()
{
    common_scripts\utility::flag_wait( "tiff_sandman_moveout" );
    common_scripts\utility::array_thread( level._id_463D, maps\ss_util::_id_441D );
    thread _id_463F();
    maps\_utility::_id_1425( "entering_stephanies" );
    thread _id_463E();
    thread _id_4640();
    thread maps\_utility::_id_265B( "allies" );
    common_scripts\utility::flag_wait_either( "tiff_first_guys_dead", "dialog_sandman_tiff_takecover" );
    wait 1;
    thread maps\ny_manhattan_code_intro::_id_460A( "dialog_sandman_tiff_takecover" );

    if ( !common_scripts\utility::flag( "dialog_sandman_tiff_takecover" ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line32" );

    if ( !common_scripts\utility::flag( "dialog_sandman_tiff_takecover" ) )
        level._id_45A6 maps\_utility::_id_168C( "reno_line30" );

    maps\_utility::_id_26BF( "allies_to_tiff_lower" );
    common_scripts\utility::flag_wait( "tiff_guys_dead" );
    wait 2;

    if ( !common_scripts\utility::flag( "change_ally_color" ) )
        maps\_utility::_id_26BF( "color_trigger_tiff_01" );

    if ( !common_scripts\utility::flag( "tiff_hummer_spawn" ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line35" );

    common_scripts\utility::flag_set( "spawn_bravo_early" );
}

_id_463E()
{
    var_0 = getnode( "node_tiff_grinch", "targetname" );
    level._id_45C0 maps\_utility::_id_168C( "manhattan_snd_holdup" );

    if ( !common_scripts\utility::flag( "player_into_tiffs" ) )
        level._id_45A6 maps\_utility::_id_168C( "reno_line6" );

    level._id_45A6 maps\_utility::_id_13A4( "r" );
    level._id_45A6 setgoalnode( var_0 );

    if ( !common_scripts\utility::flag( "player_into_tiffs" ) )
    {
        level._id_45C0 thread maps\_utility::_id_168C( "manhattan_snd_rogerthat" );
        level._id_45C0 maps\_anim::_id_1246( level._id_45C0, "sandman_signal_go" );
    }

    maps\_utility::_id_26BF( "colors_tiff_balcony" );
}

_id_463F()
{
    var_0 = [];
    var_1 = getentarray( "tiff_firstguys", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3 maps\_utility::_id_166F( 1 );
        var_0[var_0.size] = var_4;
    }

    common_scripts\utility::flag_wait( "tiff_firstguys_go" );

    foreach ( var_4 in var_0 )
    {
        var_7 = getnode( var_4.script_noteworthy, "targetname" );
        var_4 setgoalnode( var_7 );
    }
}

_id_4640()
{
    common_scripts\utility::flag_wait( "dialog_sandman_tiff_takecover" );
    wait 2;
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line33" );
    wait 5;
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line34" );
    wait 1;

    if ( level.player getammocount( "fraggrenade" ) >= 1 )
        maps\_utility::_id_1F61( "hint_frag" );
}

_id_4641()
{
    common_scripts\utility::flag_wait( "obj_nyse_rally_complete" );
    common_scripts\utility::flag_wait( "nyse_rooftop_hind" );
}

_id_4642()
{
    common_scripts\utility::flag_wait_either( "give_xm25", "skip_paw" );
    maps\_utility::_id_26BF( "nyse_skip_lobby" );
    common_scripts\utility::flag_set( "obj_nyse_rally_complete" );
    maps\_utility::_id_1425( "entering_stockexchange" );
    common_scripts\utility::flag_set( "skip_paw" );
    var_0 = getnode( "node_d2_lobby", "targetname" );
    level._id_4639 setgoalnode( var_0 );
    level._id_4639 setlookatentity();
    level._id_45C0 maps\_utility::_id_13A4( "c" );
    maps\_audio::aud_send_msg( "entering_stockexchange_before_vo" );
    level._id_4639 maps\_utility::_id_168C( "d2_line3" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line116" );
    var_1 = [];
    var_1[var_1.size] = "lonestar_line52";
    var_1[var_1.size] = "lonestar_line53";
    var_1[var_1.size] = "manhattan_snd_headingame";
    thread maps\_shg_common::_id_168B( level._id_45C0, "nyse_combat_start", var_1 );
    maps\_audio::aud_send_msg( "entering_stockexchange_after_vo" );
    thread _id_4643();
    thread _id_46A2();
}

_id_4643()
{
    common_scripts\utility::flag_wait_either( "nyse_combat_start", "nyse_entrance_vo" );

    foreach ( var_1 in level._id_462C )
    {
        if ( isalive( var_1 ) )
        {
            var_1.ignoreall = 0;
            var_1.ignoreme = 0;
        }
    }

    common_scripts\utility::flag_set( "nyse_combat_start" );
    maps\_audio::aud_send_msg( "mus_nyse_combat_start" );
    level._id_4644 = getent( "rooftop_playerclip", "targetname" );
    level._id_4644 notsolid();
    common_scripts\utility::flag_wait( "dialog_head_up_top" );

    foreach ( var_1 in level._id_45A3 )
    {
        var_1.ignoresuppression = 1;
        var_1.suppressionwait = 0;
        var_1 maps\_utility::_id_0EEC();
        var_1.ignorerandombulletdamage = 1;
        var_1 maps\_utility::_id_2714();
        var_1 maps\_utility::_id_1057();
        var_1 maps\_utility::_id_280D();
        var_1._id_1106 = 1;
    }

    var_5 = [];
    var_5[var_5.size] = "lonestar_line52";
    var_5[var_5.size] = "lonestar_line53";
    var_5[var_5.size] = "manhattan_snd_headingame";
    thread maps\_shg_common::_id_168B( level._id_45C0, "nyse_balcony_spawn", var_5 );
}

_id_4645()
{
    if ( !common_scripts\utility::flag( "nyse_start_point" ) )
    {
        common_scripts\utility::flag_wait( "nyse_reset_ally_colors" );

        foreach ( var_1 in level._id_45A3 )
            var_1 maps\_utility::_id_13A4( "b" );

        wait 0.5;
        maps\_utility::_id_26BF( "jammer_start_r_colors" );
        common_scripts\utility::flag_set( "obj_nyse_rally_given" );
        level._id_45C0 thread maps\_utility::_id_168C( "lonestar_line41" );
        level._id_45C0 maps\_utility::_id_13A4( "o" );
        var_3 = getnode( "node_sandman_lobby", "targetname" );
        level._id_45C0 setgoalnode( var_3 );
        level._id_45C0 waittill( "goal" );
        common_scripts\utility::flag_set( "lobby_sandman_in_position" );
    }
}

_id_4646( var_0 )
{
    maps\_audio::aud_send_msg( "flashbang_training_anim_begin" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "flashbang_training_start" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "flashbang_training_end" );
    level._id_45C0 maps\_utility::_id_2686();
}

_id_4647()
{
    maps\_anim::_id_1267( "lonestar", "open_door", "flashbang_open_door", "flashbang_training_start" );
    var_0 = getentarray( "flashbang_guys", "targetname" );
    level._id_463D = [];
    var_1 = getent( "sandman_kick_door", "targetname" );
    var_1._id_1032 = "door";
    var_1 maps\_anim::_id_1244();
    var_2 = getent( "flashbang_door_col", "targetname" );
    var_3 = getent( "flashbang_scriptnode", "targetname" );
    var_3 thread maps\_anim::_id_1246( var_1, "closed" );
    common_scripts\utility::flag_wait( "sandman_kick_start" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line104" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "broad_enemies", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "gaz_entrance_guy1", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "gaz_entrance_guy2", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "gaz_entrance_guy3", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "gaz_entrance_guy4", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "first_combat", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "first_combat_backup", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "first_combat_backup_02", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "massacre_guy", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "fc_gaz_guys", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "broad_aggressive", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "army_01", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "army_02", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "army_02_deadguys", "script_noteworthy" );
    thread maps\_utility::_id_265A( "allies" );
    level._id_45C4 maps\_utility::_id_13A4( "o" );
    var_4 = getnode( "reno_flashbang", "targetname" );
    level._id_45C4 setgoalnode( var_4 );
    level._id_45A6 maps\_utility::_id_13A4( "o" );
    var_5 = getnode( "grinch_fb_stairwell", "targetname" );
    level._id_45A6 setgoalnode( var_5 );
    maps\_utility::_id_1425( "15_broad_done" );

    foreach ( var_7 in var_0 )
    {
        var_8 = var_7 maps\_utility::_id_166F( 1 );
        var_8.ignoreall = 1;
        var_8.grenadeammo = 0;
        level._id_463D[level._id_463D.size] = var_8;

        if ( var_8.script_noteworthy == "flashbang_leader" )
        {
            level._id_4648 = var_8;
            var_8._id_1032 = "flashbang_leader";
            continue;
        }

        if ( var_8.script_noteworthy == "fb_guy1" )
            level._id_4649 = var_8;
    }

    foreach ( var_8 in level._id_45A3 )
        var_8.ignoreall = 1;

    thread _id_464B();
    var_3 maps\_anim::_id_124A( level._id_45C0, "flashbang_training_trans" );
    level._id_45C0 setlookatentity( level.player );
    var_3 maps\_anim::_id_1246( level._id_45C0, "flashbang_training_trans" );
    var_3 thread maps\_anim::_id_124E( level._id_45C0, "flashbang_training_idle", "stop_loop" );
    common_scripts\utility::flag_wait( "flashbang_start" );

    if ( !common_scripts\utility::flag( "fb_leader_flashbanged" ) )
        thread _id_464A();

    maps\_audio::aud_send_msg( "play_fake_9_bang_chatter" );
    level._id_45C0 maps\ny_manhattan_code_intro::_id_45FD( "lonestar_line27" );
    var_4 = getnode( "truck_fb_stair", "targetname" );
    level._id_45C4 setgoalnode( var_4 );
    thread maps\ny_manhattan_code_intro::_id_45F5( "russians_destroyed_building_fl2", "script_noteworthy" );

    if ( level.player getammocount( "ninebang_grenade" ) <= 1 )
        level.player giveweapon( "ninebang_grenade" );

    level._id_45C0 maps\_utility::delaythread( 1, maps\_utility::_id_168C, "lonestar_line27" );
    wait 1.0;
    var_3 notify( "stop_loop" );
    setsaveddvar( "ai_friendlysuppression", 0 );
    thread _id_4646( var_3 );
    maps\_utility::delaythread( 2, maps\_utility::_id_1F61, "hint_flashbang" );
    thread _id_464F();
    common_scripts\utility::flag_wait( "flashbang_open_door" );
    level._id_45C0 setlookatentity();
    var_3 thread maps\_anim::_id_1246( var_1, "open" );
    level._id_45C0 maps\_utility::_id_0EEC();
    level._id_45C0 maps\_utility::_id_2714();
    var_2 connectpaths();
    var_2 common_scripts\utility::delaycall( 1.2, ::delete );
    wait 3;

    foreach ( var_8 in level._id_463D )
    {
        if ( isdefined( var_8 ) )
            var_8.ignoreall = 0;
    }

    if ( isdefined( level._id_4648 ) && isalive( level._id_4648 ) )
    {
        level._id_4648 stopanimscripted();
        var_14 = getnode( "node_fb_leader", "targetname" );
        level._id_4648 setgoalnode( var_14 );
    }

    level._id_45C0.ignoreall = 0;
    level._id_45C4.ignoreall = 0;
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line28" );
    common_scripts\utility::flag_wait( "flashbang_done" );
    level._id_45A6.ignoreall = 0;
    level._id_45C4.ignoreall = 0;
    setsaveddvar( "ai_friendlysuppression", 1 );
    thread _id_464C();
    maps\_utility::_id_26BF( "flashbang_colors" );
    level._id_45C0 maps\_utility::_id_27B8();
    level._id_45C0 maps\_utility::_id_2715();
    level._id_45C4 maps\_utility::_id_13A4( "b" );

    if ( !common_scripts\utility::flag( "tiff_sandman_moveout" ) )
        level._id_45A6 maps\_utility::_id_13A4( "b" );
}

_id_464A()
{
    level._id_4648 endon( "flashbang" );
    common_scripts\utility::flag_wait( "flashbang_open_door" );

    if ( isdefined( level._id_4648 ) && isalive( level._id_4648 ) )
    {
        level._id_4648 thread _id_464E();
        level._id_4648 thread maps\_anim::_id_1246( level._id_4648, "pre_flashbang" );
    }
}

_id_464B()
{
    level endon( "flashbang_open_door" );
    level._id_4648 waittill( "flashbang" );
    common_scripts\utility::flag_set( "fb_leader_flashbanged" );

    foreach ( var_1 in level._id_463D )
        var_1.ignoreall = 0;

    var_3 = getnode( "node_fb_leader", "targetname" );
    level._id_4648 setgoalnode( var_3 );
}

_id_464C()
{
    level endon( "tiff_sandman_moveout" );

    if ( !common_scripts\utility::flag( "tiff_sandman_moveout" ) )
    {
        wait 1;
        level._id_45C0 maps\_utility::_id_168C( "manhattan_snd_lessresistance" );
        level._id_45A6 maps\_utility::_id_168C( "manhattan_rno_anythingoncomms" );
        level._id_45C4 maps\_utility::_id_168C( "manhattan_trk_static" );
    }
}

_id_464D()
{
    self endon( "death" );
    self endon( "stop_exit_threads" );
    self waittill( "flashbang" );
    maps\_utility::_id_1414();
    self notify( "stop_exit_threads" );
}

_id_464E()
{
    self endon( "death" );
    self endon( "stop_exit_threads" );
    thread _id_464D();
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    maps\_utility::_id_1414();
    self notify( "stop_exit_threads" );
}

_id_464F()
{
    var_0 = getnode( "node_fb_guy1", "targetname" );
    wait 2;

    if ( isdefined( level._id_4649 ) )
        level._id_4649 setgoalnode( var_0 );
}

_id_4650()
{
    common_scripts\utility::flag_wait( "nyse_rooftop_hind" );
    var_0 = maps\_vehicle::_id_2A9A( "nyse_hind_flyover" );
    maps\_audio::aud_send_msg( "nyse_hind_flyover", var_0 );

    if ( isdefined( level._id_4651 ) )
    {
        foreach ( var_2 in level._id_4651 )
        {
            if ( isalive( var_2 ) )
                var_2 kill();
        }
    }

    wait 1;
    var_0[0] thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 4 );
    var_0[0] waittill( "reached_dynamic_path_end" );
    var_0[0] delete();
}

_id_4652()
{
    var_0 = getentarray( "nyse_upper_combat", "targetname" );
    common_scripts\utility::flag_wait( "nyse_player_up_top" );

    foreach ( var_2 in var_0 )
        var_3 = var_2 maps\_utility::_id_166F( 1 );

    common_scripts\utility::array_thread( level._id_45A3, maps\ny_manhattan_code_intro::_id_460E );
    wait 0.05;
    common_scripts\utility::array_thread( level._id_45A3, maps\ny_manhattan_code_intro::_id_460C );
    common_scripts\utility::flag_wait( "dialog_second_tier" );

    foreach ( var_3 in level._id_45A3 )
        var_3.ignoresuppression = 1;

    level._id_45A6.ignoreall = 0;
    level._id_45C4 maps\_utility::_id_123B();
    level._id_45A6 maps\_utility::_id_123B();
    var_7 = getnode( "grinch_rooftop", "targetname" );
    var_8 = getnode( "truck_rooftop", "targetname" );
    level._id_45C4 common_scripts\utility::delaycall( 5, ::setgoalnode, var_8 );
    common_scripts\utility::flag_wait_either( "jammer_plant_dialog", "squad_at_roof" );
    level._id_45A6 maps\_utility::_id_2686();
    level._id_45C4 maps\_utility::_id_2686();
}

_id_4653()
{
    common_scripts\utility::flag_wait( "nyse_entrance_vo" );
    level._id_45C4 maps\_utility::_id_168C( "truck_line7" );
    common_scripts\utility::flag_wait( "sandman_vo_pushforward" );
    thread _id_46A7( "dialog_head_up_top" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "wall_baddies_01", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "wall_baddies_02", "script_noteworthy" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "wall_baddies_03", "script_noteworthy" );
    common_scripts\utility::flag_wait( "dialog_head_up_top" );
    level._id_45C0 maps\ss_util::_id_4422( "lonestar_line51" );
    common_scripts\utility::flag_wait( "over_the_rail" );
    level._id_45C0 maps\ss_util::_id_4422( "lonestar_line123" );
    common_scripts\utility::flag_wait( "dialog_get_up_ladder" );
    level._id_45C0 maps\ss_util::_id_4422( "lonestar_line57" );
    maps\_utility::_id_1425( "climbing_ladder" );
    common_scripts\utility::flag_wait( "dialog_second_tier" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line58" );
    thread maps\ny_manhattan_code_intro::_id_45F5( "trading_guys_01", "script_noteworthy" );
    common_scripts\utility::flag_wait( "jammer_plant_dialog" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line78" );
}

_id_4654()
{
    self endon( "death" );
    var_0 = maps\_utility::_id_1281( "rotors" );
    var_1 = getanimlength( var_0 );

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        self setanim( var_0 );
        wait(var_1);
    }
}

_id_4655()
{
    level._id_461B = &"NY_MANHATTAN_THERMITE_HINT";
    var_0 = getent( "org_thermite", "targetname" );
    level._id_4656 = getent( "thermite_jammer", "targetname" );
    var_1 = getnode( "node_sandman_roof_final", "targetname" );
    var_0.origin = level._id_4656.origin;
    level._effect["c4_explosion"] = level._effect["thermite_reaction"];
    level._id_4656 hide();
    level._id_4656 maps\_c4::_id_461A( undefined, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), level._id_4656.origin, "weapon_thermite_device", "weapon_thermite_device_obj" );
    thread _id_4658();
    thread _id_4659();
    thread _id_465F();
    thread _id_4660();
    common_scripts\utility::flag_wait( "thermite_planted" );

    if ( isdefined( level._id_4644 ) )
        level._id_4644 solid();

    maps\_utility::_id_26BF( "thermite_planted" );
    level._id_45C0 thread _id_0076();
    thread _id_4661();
    thread _id_4662();
    thread _id_4657();
    level.player setweaponhudiconoverride( "actionslot2", "dpad_thermite_bomb_static" );
    common_scripts\utility::flag_wait( "thermite_detonated" );
    level.player common_scripts\utility::delaycall( 3, ::setweaponhudiconoverride, "actionslot2", "none" );
    earthquake( 0.4, 1.5, level._id_4656.origin, 10000 );
    level.player playrumbleonentity( "damage_heavy" );
    level._id_1441 maps\_utility::delaythread( 10.8, maps\_utility::_id_27AF, 1, 0.1 );
    level._id_1441 maps\_utility::delaythread( 11.3, maps\_utility::_id_27AF, 0, 0.75 );
    level._id_45C4 maps\_utility::delaythread( 2, maps\_utility::_id_168C, "lonestar_line170" );
    level._id_45A6 maps\_utility::delaythread( 3.5, maps\_utility::_id_168C, "manhattan_rno_adios" );
    common_scripts\utility::flag_set( "obj_jammer_complete" );
    thread maps\_compass::setupminimap( "compass_map_ny_manhattan" );
    var_2 = getaiarray();

    foreach ( var_4 in var_2 )
        var_4.drawoncompass = 1;

    level._id_4656 hide();
    common_scripts\utility::flag_wait( "predator_defend_complete" );
    level._id_45C0 thread maps\_utility::_id_168C( "lonestar_line157" );
    wait 3;
    var_6 = common_scripts\utility::getstruct( "blackhawk_intro", "targetname" );
    level._id_4483 = maps\_vehicle::_id_2A99( "hind_vehicle" );
    level._id_4483 thread maps\ny_blackhawk::_id_4591( 1 );
    level._id_4483 thread _id_4654();
    level._id_4483.mgturret[0] setmode( "manual" );
    level._id_4483.godmode = 1;
    wait 0.05;
    common_scripts\utility::flag_set( "obj_capturehind_given" );
    thread _id_4663();
    wait 2;
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line158" );
}

_id_0076()
{
    level endon( "thermite_detonated" );
    self waittill( "goal" );
    self._id_0077 = 1;
}

_id_4657()
{
    level._id_4656 waittill( "c4_detonation" );
    common_scripts\utility::flag_set( "thermite_detonated" );
}

_id_4658()
{
    level._id_4656 waittill( "c4_planted" );
    maps\_audio::aud_send_msg( "thermite_plant" );
    common_scripts\utility::flag_set( "thermite_planted" );
    level._id_45C4 maps\_utility::_id_168C( "lonestar_line128" );
    common_scripts\utility::flag_wait( "thermite_player_clear" );

    if ( !common_scripts\utility::flag( "thermite_detonated" ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line171" );

    var_0 = [];
    var_0[var_0.size] = "lonestar_line172";
    var_0[var_0.size] = "lonestar_line173";
    thread maps\_shg_common::_id_168B( level._id_45C0, "thermite_detonated", var_0 );
}

_id_4659()
{
    var_0 = getent( "jamming_tower", "targetname" );
    var_0._id_1032 = "tower";
    var_0 maps\_anim::_id_1244();
    var_1 = getent( "jamming_tower_destroyed", "targetname" );
    var_1._id_1032 = "tower";
    var_1 maps\_anim::_id_1244();
    var_2 = getent( "tower_destroyed_collision", "targetname" );
    var_3 = getent( "jammer_destroyed_static", "targetname" );
    var_4 = getent( "jammer_destruct_rail", "targetname" );
    var_5 = getent( "org_tower_collapse", "targetname" );
    var_5 maps\_anim::_id_11CF( var_1, "collapse" );
    var_5 maps\_anim::_id_11CF( var_0, "idle" );
    var_1 hide();
    var_2 notsolid();
    var_3 hide();
    var_3 notsolid();
    common_scripts\utility::flag_wait( "dialog_second_tier" );
    thread _id_465A( var_0, var_5 );
    common_scripts\utility::flag_wait( "thermite_detonated" );
    var_0 thread _id_465E();
    common_scripts\utility::array_thread( level._id_45A3, ::_id_465C );
    maps\_utility::_id_1425( "jammer_destroyed" );
    var_0 hide();
    var_1 show();
    wait 2;
    var_5 thread maps\_anim::_id_1246( var_1, "collapse" );
    var_6 = maps\_utility::_id_127E( "collapse", var_1._id_1032 );
    var_7 = getanimlength( var_6 );
    wait(var_7 - 3.0);
    thread _id_465D();
    var_2 solid();
    var_4 hide();
    thread _id_465B();
    wait 2.5;
    wait 0.5;
    var_1 hide();
    var_3 show();
    var_3 solid();
}

_id_465A( var_0, var_1 )
{
    var_1 maps\_anim::_id_1246( var_0, "idle" );
    var_1 maps\_anim::_id_1246( var_0, "idle" );
}

_id_465B()
{
    maps\_utility::delaythread( 2.5, maps\ss_util::_id_4421, "manhattan_test_we_have_comms_fx" );
    common_scripts\utility::flag_wait( "squad_at_roof" );
    _id_01D8();
    thread _id_469D();
    thread _id_46A1();
    level.player thread _id_46A0();
    thread _id_469C();
    common_scripts\utility::flag_set( "obj_predator_given" );
    level._id_45A6.script_pushable = 0;
    level._id_45C0.script_pushable = 0;
    level._id_45C4.script_pushable = 0;
    maps\_shg_common::_id_168D();
    level._id_45A6 maps\_utility::_id_168C( "reno_line36" );
    maps\_utility::_id_11F4( "manhattan_hqr_backonline" );

    if ( !common_scripts\utility::flag( "player_used_predator" ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line139" );

    maps\_shg_common::_id_168E();
    thread _id_46AF();
    thread _id_4691();
    thread _id_46B2();
}

_id_01D8()
{
    var_0 = spawn( "script_origin", level._id_45C0.origin );
    var_0.angles = level._id_45C0.angles;
    level._id_45C0 thread maps\_anim::_id_1248( level._id_45C0, "radio" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line137" );
    maps\_utility::delaythread( 3, ::_id_4688 );
    maps\_utility::_id_11F4( "manhattan_hqr_proceed" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line138" );
    var_0 delete();
}

_id_465C()
{
    if ( common_scripts\utility::flag( "squad_at_roof" ) )
    {
        if ( isdefined( self._id_0077 ) && self._id_0077 )
            thread maps\_anim::_id_1246( self, "tower_destruct_react" );
    }
}

_id_465D()
{
    if ( common_scripts\utility::flag( "jammer_destruct_kill" ) )
        level.player kill();
}

_id_465E()
{
    level endon( "entering_hind" );

    while ( !common_scripts\utility::flag( "entering_hind" ) )
    {
        while ( common_scripts\utility::flag( "thermite_burn" ) )
        {
            level.player dodamage( 40, self.origin );
            level.player maps\_utility::play_sound_on_entity( "breathing_hurt_start" );
            level.player playrumbleonentity( "damage_light" );
            wait 0.5;
        }

        wait 0.05;
    }
}

_id_465F()
{
    common_scripts\utility::flag_wait( "jammer_guys_dead" );
    level._id_45C4 maps\_utility::delaythread( 1, maps\ss_util::_id_4422, "manhattan_trk_clear" );
    maps\_audio::aud_send_msg( "mus_stock_exchange_roof_combat_done" );
    var_0 = [];
    var_0[var_0.size] = "lonestar_line167";
    var_0[var_0.size] = "lonestar_line168";
    var_0[var_0.size] = "lonestar_line169";
    thread maps\_shg_common::_id_168B( level._id_45C0, "thermite_planted", var_0 );
    var_1 = getnode( "grinch_collapse", "script_noteworthy" );
    var_2 = getnode( "truck_collapse", "script_noteworthy" );
    level._id_45A6 maps\_utility::_id_13A4( "o" );
    level._id_45C4 maps\_utility::_id_13A4( "o" );
    level._id_45A6 setgoalnode( var_1 );
    level._id_45C4 setgoalnode( var_2 );
    level._id_45A6 thread _id_0076();
    level._id_45C4 thread _id_0076();

    if ( !common_scripts\utility::flag( "thermite_planted" ) )
        maps\_utility::_id_26BF( "colors_3007" );
}

_id_4660()
{
    common_scripts\utility::flag_wait( "thermite_planted" );
    common_scripts\utility::flag_wait( "squad_at_roof" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, maps\ss_util::_id_441C, "bullet", 2, 3 );
    wait 3;
}

_id_4661()
{
    level endon( "thermite_detonated" );
    wait 5;
    thread maps\_utility::_id_1F61( "hint_thermite_detonate" );
}

_id_4662()
{
    level endon( "thermite_detonated" );

    for (;;)
    {
        level.player waittill( "weapon_change" );
        wait 1;
        thread maps\_utility::_id_1F61( "hint_thermite_switch" );

        for (;;)
        {
            var_0 = level.player getcurrentprimaryweapon();

            if ( issubstr( var_0, "thermite" ) )
                break;

            wait 0.05;
        }

        thread _id_4661();
        wait 0.05;
    }
}

_id_4663()
{
    var_0 = getent( "org_tower_collapse", "targetname" );
    maps\_audio::aud_send_msg( "blackhawk_approach" );
    thread _id_4686( var_0 );
    thread _id_4664();
    var_0 maps\_anim::_id_1246( level._id_4483, "approach" );
    var_0 thread maps\_anim::_id_124E( level._id_4483, "approach_idle", "stop_idle" );
    level._id_4483 setanim( level._id_0C59[level._id_4483._id_1032]["approach"], 0, 0.0 );
    level._id_4483 setanim( level._id_0C59[level._id_4483._id_1032]["approach_idle"][0], 1, 0.0 );
    common_scripts\utility::flag_set( "blackhawk_at_rooftop" );

    if ( !common_scripts\utility::flag( "sandman_animating" ) )
        common_scripts\utility::flag_set( "player_can_board_blackhawk" );

    var_1 = [];
    var_1[var_1.size] = "lonestar_line160";
    var_1[var_1.size] = "lonestar_line161";
    var_1[var_1.size] = "lonestar_line162";
    var_1[var_1.size] = "lonestar_line163";
    thread maps\_shg_common::_id_168B( level._id_45C0, "entering_hind", var_1 );
    common_scripts\utility::flag_wait( "entering_hind" );
}

_id_4664()
{
    level endon( "entering_hind" );

    while ( !common_scripts\utility::flag( "entering_hind" ) )
    {
        while ( common_scripts\utility::flag( "player_can_jump_on_blackhawk" ) )
        {
            level.player notifyonplayercommand( "jump", "+gostand" );
            level.player waittill( "jump" );
            maps\_utility::_id_26BF( "player_at_hind" );
            wait 0.05;
        }

        wait 0.05;
    }
}

_id_4686( var_0 )
{
    level endon( "entering_hind" );
    var_1 = maps\_utility::_id_127E( "approach", level._id_4483._id_1032 );
    var_2 = getanimlength( var_1 );
    wait(var_2 - 3.0);
    common_scripts\utility::flag_waitopen( "player_blocking_sandman" );
    common_scripts\utility::flag_set( "sandman_animating" );
    common_scripts\utility::flag_clear( "player_can_board_blackhawk" );
    level._id_45C0 maps\ny_manhattan_code_intro::_id_460E();
    var_0 maps\_anim::_id_124A( level._id_45C0, "blackhawk_jump" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "blackhawk_jump" );
    level._id_45C0 linktoblendtotag( level._id_4483, "tag_player" );
    thread _id_4687();
    wait 1;
    common_scripts\utility::flag_set( "player_can_board_blackhawk" );
}

_id_4687()
{
    level._id_4483 maps\_anim::_id_1246( level._id_45C0, "blackhawk_land", "tag_player" );
    level._id_4483 maps\_anim::_id_124E( level._id_45C0, "blackhawk_land_idle", "stop_idle", "tag_player" );
}

_id_4688()
{
    level._id_3E10 = 0;
    common_scripts\utility::flag_set( "give_predator" );
    common_scripts\utility::flag_clear( "punish_time" );
    maps\_utility::_id_27CA( "enemy_predator_01", ::_id_469F );
    maps\_utility::_id_27CA( "enemy_predator_02", ::_id_469F );
    level._id_4689 = [];
    level._id_468A = [];
    level._id_468B = getentarray( "enemy_predator_01", "targetname" );
    level._id_468C = getentarray( "enemy_predator_02", "targetname" );
    level._id_468D = getnodearray( "enemy_predator_01_nodes", "targetname" );
    level._id_468E = getnodearray( "enemy_predator_02_nodes", "targetname" );
    maps\_utility::_id_27CA( "enemy_predator_01", ::_id_4692 );
    maps\_utility::_id_27CA( "enemy_predator_02", ::_id_4693 );
    thread maps\_spawner::_id_2135( level._id_468B );
    thread maps\_spawner::_id_2135( level._id_468C );
    wait 5;
    level._id_45A6 maps\_utility::_id_13A4( "b" );
    level._id_45C4 maps\_utility::_id_13A4( "b" );
    level._id_45A6 maps\_utility::_id_2686();
    level._id_45C4 maps\_utility::_id_2686();
    maps\_utility::_id_26BF( "colors_3009" );
    common_scripts\utility::flag_wait_or_timeout( "predator_wave2_dead", 30 );
    thread _id_4697();
    thread _id_469B();
    thread _id_4694( level._id_4689, level._id_468D );
    thread _id_4694( level._id_468A, level._id_468E );
    common_scripts\utility::flag_wait( "predator_defend_hind_dead" );
    level._id_4690 = level._id_468F;
    wait 3;
    maps\_utility::_id_1425( "predator_defend_finished" );
    common_scripts\utility::flag_set( "predator_defend_complete" );
    common_scripts\utility::flag_clear( "backtrack_warn" );
    level.player thread maps\_remotemissile::_id_3BE6( 0, 1 );
    level notify( "stop_predator_shuffle" );
}

_id_4691()
{
    var_0 = [];
    var_0[var_0.size] = "lonestar_line140";
    var_0[var_0.size] = "lonestar_line142";
    var_0[var_0.size] = "lonestar_line143";
    thread maps\_shg_common::_id_168B( level._id_45C0, "player_used_predator", var_0, 5, 10 );
}

_id_4692()
{
    level._id_4689[level._id_4689.size] = self;
}

_id_4693()
{
    level._id_468A[level._id_468A.size] = self;
}

_id_4694( var_0, var_1 )
{
    level endon( "stop_predator_shuffle" );

    for (;;)
    {
        wait 1;

        if ( var_0.size > 0 && var_1.size > 0 )
        {
            var_2 = randomint( var_0.size );
            var_3 = randomint( var_1.size );

            if ( isdefined( var_1[var_3] ) && isdefined( var_0[var_2] ) )
                var_0[var_2] thread maps\_spawner::_id_21A4( var_1[var_3] );
        }
    }
}

_id_4695()
{
    self endon( "death" );
    var_0 = getent( "hind_rotor_collision", "targetname" );
    var_0.health = 1;
    var_0 hide();
    var_0.origin = self gettagorigin( "main_rotor_jnt" );
    var_0.angles = self gettagangles( "main_rotor_jnt" );
    var_0 linkto( self, "main_rotor_jnt" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
        self notify( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
    }
}

_id_4696()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "predator_hind_dead" );
}

_id_4697()
{
    level._id_4697 = maps\_vehicle::_id_2881( "predator_defend_hind" );
    level._id_4697._id_29DC = getent( "wall_hind_crash", "script_noteworthy" );
    level._id_4697 thread _id_0612::_id_3C49();
    level._id_4697 thread _id_4695();
    level._id_4697 thread maps\ny_manhattan_code_intro::_id_45E8();
    level._id_4697 notify( "stop_street_strafe" );
    level._id_4697 notify( "stop_ai" );
    level._id_4697 thread _id_03C9::_id_4698();
    level._id_4697 thread maps\ny_manhattan_code_intro::_id_45CE();
    level._id_4697 thread _id_4696();
    var_0 = getent( "predator_hind_crash", "script_noteworthy" );
    level._id_4697._id_4699 = var_0;
    maps\_audio::aud_send_msg( "aud_predator_hind", level._id_4697 );
    common_scripts\utility::flag_wait( "start_predator_hind_orient" );
    thread _id_469A();

    if ( isdefined( level._id_4697 ) )
        level._id_4697 setlookatent( level.player );

    wait 4;
    common_scripts\utility::flag_set( "predator_lookat_changed" );

    if ( isdefined( level._id_4697 ) )
        level._id_4690 = level._id_4697;

    wait 10;

    if ( isdefined( level._id_4697 ) )
        level._id_4697 thread maps\ny_manhattan_code_intro::_id_45E6();

    wait 30;
    common_scripts\utility::flag_set( "predator_hind_deadly" );
}

_id_469A()
{
    maps\ss_util::_id_4421( "manhattan_snd_knockitout" );
    var_0 = [];
    var_0[var_0.size] = "manhattan_snd_pinneddown";
    var_0[var_0.size] = "manhattan_snd_usethereaper";
    var_0[var_0.size] = "manhattan_snd_alloverus";
    thread maps\_shg_common::_id_168B( level._id_45C0, "predator_defend_complete", var_0 );
}

_id_469B()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_1 = missile_createattractorent( var_0, 5000, 99999, level._id_4697 );

    while ( !common_scripts\utility::flag( "predator_defend_hind_dead" ) )
    {
        if ( !common_scripts\utility::flag( "predator_hind_deadly" ) )
        {
            var_2 = randomfloatrange( 256, 380 );
            var_3 = randomfloatrange( -400, 400 );
        }
        else
        {
            var_2 = randomfloatrange( 0, 128 );
            var_3 = randomfloatrange( -128, 128 );
        }

        var_4 = ( var_2, var_3, 0 );
        var_0.origin = level.player.origin + var_4;
        wait(randomintrange( 3, 7 ));
    }

    missile_deleteattractor( var_1 );
}

_id_469C()
{
    level endon( "predator_defend_complete" );

    while ( !common_scripts\utility::flag( "predator_defend_complete" ) )
    {
        common_scripts\utility::flag_wait( "predator_player_ranaway" );
        common_scripts\utility::flag_set( "backtrack_warn" );
        common_scripts\utility::flag_wait_or_timeout( "predator_player_ranaway_clear", 10 );
        wait 0.1;

        if ( !common_scripts\utility::flag( "predator_player_ranaway_clear" ) )
        {
            common_scripts\utility::flag_clear( "backtrack_warn" );
            setdvar( "ui_deadquote", &"NY_MANHATTAN_BRAVO_KILLED" );
            maps\_utility::_id_1826();
        }
        else
        {
            common_scripts\utility::flag_clear( "predator_player_ranaway" );
            common_scripts\utility::flag_clear( "predator_player_ranaway_clear" );
            common_scripts\utility::flag_clear( "backtrack_warn" );
        }

        wait 0.05;
    }
}

_id_469D()
{
    while ( !common_scripts\utility::flag( "predator_defend_complete" ) )
    {
        level waittill( "starting_predator_drone_control" );
        common_scripts\utility::flag_set( "player_used_predator" );
    }
}

_id_469E()
{
    common_scripts\utility::flag_wait( "bravo_killed" );

    if ( !common_scripts\utility::flag( "predator_wave1_dead" ) )
    {
        setdvar( "ui_deadquote", &"NY_MANHATTAN_BRAVO_KILLED" );
        maps\_utility::_id_1826();
    }
}

_id_469F()
{
    self waittill( "death", var_0, var_1 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        if ( isdefined( var_1 ) && var_1 == "MOD_PROJECTILE_SPLASH" )
        {
            level notify( "predator_someone_killed" );
            level._id_3E10++;
        }
    }
}

_id_46A0()
{
    self endon( "death" );
    var_0 = ( 0.0111, -0.342, -0.94 );

    while ( !common_scripts\utility::flag( "predator_defend_complete" ) )
    {
        self waittill( "player_fired_remote_missile" );

        while ( isdefined( self._id_3C12 ) )
        {
            var_1 = anglestoforward( self._id_3C12.angles );
            var_2 = vectordot( var_1, var_0 );

            if ( var_2 < 0.91 )
            {
                self notify( "force_out_of_uav" );
                var_3 = self._id_3C12.origin;
                self dodamage( 1, var_3 );
                break;
            }

            wait 0.05;
        }
    }
}

_id_46A1()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = [];
    var_2[var_2.size] = "pred_5_targets_down";
    var_2[var_2.size] = "pred_multiple_down";
    var_3 = [];
    var_3[var_3.size] = "pred_multiple_down";
    var_3[var_3.size] = "pred_multiple_eliminted";
    var_3[var_3.size] = "pred_good_effect";
    var_4 = [];
    var_4[var_4.size] = "pred_good_hit";
    var_4[var_4.size] = "pred_good_effect";
    var_4[var_4.size] = "pred_hit_confirmed";
    var_5 = [];
    var_5[var_5.size] = "pred_miss";
    var_5[var_5.size] = "pred_short_repeat";
    var_5[var_5.size] = "pred_zero_kills";
    var_6 = [];
    var_6[var_6.size] = "";
    var_6[var_6.size] = "";

    while ( !common_scripts\utility::flag( "predator_defend_complete" ) )
    {
        level waittill( "remote_missile_exploded" );
        common_scripts\utility::flag_clear( "predator_hit_line_success" );
        wait 1.0;

        if ( !common_scripts\utility::flag( "predator_defend_complete" ) )
        {
            if ( level._id_3E10 >= 5 )
            {
                while ( !common_scripts\utility::flag( "predator_hit_line_success" ) )
                {
                    var_7 = common_scripts\utility::random( var_2 );

                    if ( isdefined( var_0 ) && var_0 == var_7 )
                        continue;
                    else
                    {
                        var_0 = var_7;
                        level._id_45C0 maps\ss_util::_id_4422( var_7 );
                        level._id_45C0 maps\ss_util::_id_4423( "manhattan_snd_sendanothermissile", "manhattan_snd_hitemagain" );
                        common_scripts\utility::flag_set( "predator_hit_line_success" );
                    }
                }
            }
            else if ( level._id_3E10 >= 2 )
            {
                while ( !common_scripts\utility::flag( "predator_hit_line_success" ) )
                {
                    var_7 = common_scripts\utility::random( var_3 );

                    if ( isdefined( var_0 ) && var_0 == var_7 )
                        continue;
                    else
                    {
                        var_0 = var_7;
                        level._id_45C0 maps\ss_util::_id_4422( var_7 );
                        level._id_45C0 maps\ss_util::_id_4423( "manhattan_snd_sendanothermissile", "manhattan_snd_hitemagain" );
                        common_scripts\utility::flag_set( "predator_hit_line_success" );
                    }
                }
            }
            else if ( level._id_3E10 == 1 )
            {
                while ( !common_scripts\utility::flag( "predator_hit_line_success" ) )
                {
                    var_7 = common_scripts\utility::random( var_4 );

                    if ( isdefined( var_0 ) && var_0 == var_7 )
                        continue;
                    else
                    {
                        var_0 = var_7;
                        level._id_45C0 maps\ss_util::_id_4422( var_7 );
                        level._id_45C0 maps\ss_util::_id_4423( "manhattan_snd_sendanothermissile", "manhattan_snd_hitemagain" );
                        common_scripts\utility::flag_set( "predator_hit_line_success" );
                    }
                }
            }
            else if ( !isdefined( level._id_4697 ) || maps\ny_manhattan_code_hind::_id_45EA( level._id_4697 ) )
            {
                while ( !common_scripts\utility::flag( "predator_hit_line_success" ) )
                {
                    var_7 = common_scripts\utility::random( var_5 );

                    if ( isdefined( var_0 ) && var_0 == var_7 )
                        continue;
                    else
                    {
                        var_0 = var_7;
                        level._id_45C0 maps\ss_util::_id_4422( var_7 );
                        common_scripts\utility::flag_set( "predator_hit_line_success" );
                    }
                }
            }

            wait 0.05;
            level._id_3E10 = 0;
        }

        wait 0.05;
    }
}

_id_46A2()
{
    level._id_4651 = [];
    var_0 = getentarray( "enemy_nyse_balcony", "targetname" );
    createthreatbiasgroup( "nyse_balcony" );
    common_scripts\utility::flag_wait( "allies_up_top" );
    level._id_45A6 maps\_utility::_id_13A4( "o" );
    level._id_45C0 maps\_utility::_id_13A4( "o" );
    level._id_45C4 maps\_utility::_id_13A4( "o" );
    level._id_45A6 setgoalnode( getnode( "grinch_uptop", "targetname" ) );
    level._id_45C0 setgoalnode( getnode( "sandman_uptop", "targetname" ) );
    level._id_45C4 setgoalnode( getnode( "truck_uptop", "targetname" ) );
    common_scripts\utility::flag_wait( "dialog_head_up_top" );
    thread maps\_utility::_id_1425( "trading_floor_done" );
    level._id_45C0 maps\_utility::_id_13A4( "c" );
    thread _id_46A6();
    common_scripts\utility::flag_wait( "nyse_balcony_spawn" );
    level._id_45C4 maps\_utility::_id_13A4( "b" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 stalingradspawn();
        var_3 setthreatbiasgroup( "nyse_balcony" );
        level._id_4651[level._id_4651.size] = var_3;
    }

    setignoremegroup( "nyse_balcony", "sandman_15_broad" );
    setignoremegroup( "sandman_15_broad", "nyse_balcony" );
    thread _id_46A3();
    wait 1;
    level._id_45A6 thread maps\ss_util::_id_4422( "reno_line31" );
    common_scripts\utility::flag_wait( "balcony_guys_dead" );

    if ( !common_scripts\utility::flag( "nyse_rooftop_hind" ) )
        level._id_45A6 maps\_utility::_id_168C( "reno_line32" );

    level._id_45A6 maps\_utility::_id_13A4( "b" );
    level._id_45A6.ignoreall = 1;
    level._id_45A6 waittill( "goal" );
    level._id_45A6.ignoreall = 0;
}

_id_46A3()
{
    var_0 = getentarray( "trigger_ignore_all", "targetname" );

    foreach ( var_2 in var_0 )
        level thread _id_46A4( var_2 );
}

_id_46A4( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && isai( var_1 ) && !var_1 isbadguy() )
            var_1 thread _id_46A5( var_0 );
    }
}

_id_46A5( var_0 )
{
    self notify( "ignore_all_trigger_ai_think_stop" );
    self endon( "ignore_all_trigger_ai_think_stop" );
    self endon( "balcony_guys_dead" );
    self endon( "death" );
    maps\_utility::_id_2612( 1 );
    maps\_utility::_id_0A23( 1 );

    while ( self istouching( var_0 ) )
        wait 0.5;

    maps\_utility::_id_2612( 0 );
    maps\_utility::_id_0A23( 0 );
}

_id_46A6()
{
    common_scripts\utility::flag_wait( "sandman_up_top" );
    level._id_45A6 setgoalnode( getnode( "truck_balcony", "targetname" ) );
}

_id_46A7( var_0 )
{
    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line50" );

    var_1 = randomintrange( 5, 15 );
    wait(var_1);

    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line105" );

    var_1 = randomintrange( 5, 15 );
    wait(var_1);

    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45A6 maps\_utility::_id_168C( "reno_line29" );

    var_1 = randomintrange( 5, 15 );
    wait(var_1);

    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line106" );

    var_1 = randomintrange( 5, 15 );
    wait(var_1);

    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45A6 maps\_utility::_id_168C( "reno_line28" );

    var_1 = randomintrange( 5, 15 );
    wait(var_1);

    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line108" );

    var_1 = randomintrange( 5, 15 );
    wait(var_1);

    if ( !common_scripts\utility::flag( var_0 ) )
        level._id_45C0 maps\_utility::_id_168C( "lonestar_line107" );
}

_id_46A8()
{
    level._id_462C[level._id_462C.size] = self;

    if ( !common_scripts\utility::flag( "nyse_combat_start" ) )
    {
        self.ignoreall = 1;
        self.ignoreme = 1;
    }
}

_id_46A9()
{
    self.ignoresuppression = 1;
}

_id_46AA()
{
    self.favoriteenemy = level.player;
}

_id_46AB()
{
    var_0 = getnode( "node_grizzly_lobby", "targetname" );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );
    level._id_4639 maps\_utility::_id_13A4( "o" );
    level._id_4639 setgoalnode( var_0 );
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

_id_46AD()
{
    common_scripts\utility::flag_wait( "give_predator" );
    level._id_3C2C show();
    maps\_audio::aud_send_msg( "mus_predetor" );
    level._id_3BD3 = 5000;
    level._id_3BD8._id_46AE = 25;
    level.player maps\_remotemissile::_id_3BEB( "remote_missile_detonator" );
}

_id_46AF()
{
    level endon( "entering_hind" );

    for (;;)
    {
        if ( !common_scripts\utility::flag( "uav_in_use" ) )
            maps\_utility::_id_1F61( "hint_predator" );

        common_scripts\utility::flag_wait_either( "uav_in_use", "hind_dmg_hint" );
        common_scripts\utility::flag_waitopen( "uav_in_use" );
        common_scripts\utility::flag_wait_or_timeout( "uav_in_use", 30 );
    }
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

_id_46B1()
{
    level endon( "player_fired_remote_missile" );
    level endon( "predator_hind_dead" );
    level endon( "draw_target_end" );
    wait 3;
    maps\_utility::_id_1F61( "hint_predator_shoot" );
}

_id_46B2()
{
    level endon( "predator_defend_complete" );
    var_0 = getent( "player_dummy", "targetname" );
    var_1 = var_0 maps\_utility::_id_166F( 1 );
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_1 maps\_utility::_id_0D04();
    var_1 maps\_utility::_id_1057();
    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_5 = undefined;
    var_6 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_6 setmodel( "body_delta_elite_assault_aa" );
    var_6 attach( "head_hero_sandman_delta", "" );
    level.player thread _id_0612::_id_3C49();
    var_6 hide();

    for (;;)
    {
        while ( !common_scripts\utility::flag( "uav_in_use" ) )
        {
            var_4.origin = level.player.origin;
            var_5 = level.player getplayerangles();
            var_7 = level.player getstance();
            var_6.angles = var_5;
            var_6.origin = level.player.origin;
            wait 0.1;
        }

        while ( common_scripts\utility::flag( "uav_in_use" ) )
        {
            var_6 show();
            common_scripts\utility::flag_waitopen( "uav_in_use" );
            var_6 hide();
        }
    }
}

_id_46B3()
{
    level._id_468F = getent( "uav_lookat", "targetname" );
    level._id_4690 = level._id_468F;
    level._id_3C2C endon( "death" );

    for (;;)
    {
        if ( isdefined( level._id_3C14 ) )
            var_0 = level._id_3C14.origin;
        else
            var_0 = level._id_4690.origin;

        if ( isdefined( var_0 ) )
        {
            var_1 = vectortoangles( var_0 - level._id_3C2C.origin );
            level.uavrig moveto( level._id_3C2C.origin, 0.1, 0, 0 );
            level.uavrig rotateto( var_1, 0.1, 0, 0 );
        }

        wait 0.05;
    }
}

_id_46B4()
{
    common_scripts\utility::flag_wait( "start_itiot" );

    if ( getdvarint( "demo_itiot" ) == 1 )
    {
        thread _id_46B5();
        wait 0.5;
        thread _id_46B8( "black", 5, 1, 1 );
        maps\_audio::aud_send_msg( "e3_demo_fade_out", 2 );
        var_0 = [];
        var_0[0] = &"NY_MANHATTAN_ITIOT";
        thread _id_46B9( var_0, 1 );
        wait 1;
        level.player freezecontrols( 1 );
        level.player enableinvulnerability();
        thread maps\_utility::vision_set_fog_changes( "ny_manhattan", 0 );
        thread _id_46B6();
        thread _id_46B7();
        var_1 = getentarray( "broad_vehicles_hide", "script_noteworthy" );

        foreach ( var_3 in var_1 )
            var_3 show();

        wait 4;
        maps\_audio::aud_send_msg( "e3_demo_fade_in", 2 );
        level.player freezecontrols( 0 );
        level.player common_scripts\utility::delaycall( 3, ::disableinvulnerability );
        wait 2;
        level._id_45A6 maps\_utility::_id_168C( "reno_line7" );
        common_scripts\utility::flag_set( "tiff_fight_01a" );
    }
}

_id_46B5()
{
    var_0 = maps\_vehicle::_id_2A99( "tiff_hummer3" );
    var_1 = maps\_vehicle::_id_2A99( "tiff_hummer2" );
    var_1 maps\_utility::delaythread( 1, ::_id_462F );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );

    foreach ( var_3 in var_1._id_0A39 )
    {
        if ( isdefined( var_3 ) && isalive( var_3 ) )
            var_3 thread maps\ss_util::_id_441D();
    }
}

_id_46B6()
{
    level._id_4638 = [];
    var_0 = getentarray( "delta2_spawners", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 stalingradspawn();
        var_3 thread maps\_utility::_id_0D04( 1 );
        var_3 maps\_utility::_id_13A4( "r" );
        level._id_4638[level._id_4638.size] = var_3;

        if ( var_3.script_noteworthy == "d2_leader" )
        {
            level._id_4639 = var_3;
            level._id_4639._id_1032 = "delta2_leader";
        }
    }

    var_5 = getentarray( "e3_start_locs_bravo", "targetname" );
    var_6 = getentarray( "e3_start_locs_squad", "targetname" );
    wait 0.1;

    for ( var_7 = 0; var_7 < level._id_4638.size; var_7++ )
        level._id_4638[var_7] teleport( var_5[var_7].origin, var_5[var_7].angles );

    level.player maps\_utility::_id_1FDF( getent( "itiot_pre_player_start", "targetname" ) );
    wait 0.05;

    for ( var_7 = 0; var_7 < level._id_45A3.size; var_7++ )
    {
        level._id_45A3[var_7] teleport( var_6[var_7].origin, var_6[var_7].angles );
        level._id_45A3[var_7] maps\_utility::_id_13A4( "r" );
    }

    level.player maps\_utility::_id_1FDF( getent( "itiot_player_start", "targetname" ) );
    wait 0.05;
    level._id_45C0 maps\_utility::_id_13A4( "y" );
}

_id_46B7()
{
    var_0 = getentarray( "e3demo_pre_seed", "targetname" );
    thread maps\_spawner::_id_2135( var_0 );
    var_1 = getentarray( "nmy_wall_group_3", "targetname" );
    thread maps\_spawner::_id_2135( var_1 );
    maps\_spawner::_id_213C( 1011 );
    maps\_shg_common::_id_168D();
    level._id_45A6 maps\_utility::_id_168C( "reno_line7" );
    maps\_shg_common::_id_168E();
    common_scripts\utility::flag_wait( "tiff_fight_04" );
    var_2 = getentarray( "nmy_wall_group_4", "targetname" );
    thread maps\_spawner::_id_2135( var_2 );
    level._id_45C0 thread maps\_utility::_id_168C( "lonestar_line39" );
    common_scripts\utility::flag_wait( "obj_nyse_rally_given" );
    maps\_spawner::_id_213C( 1004 );
    var_3 = getentarray( "wall_baddies_03", "script_noteworthy" );
    thread maps\ss_util::_id_4420( var_3, "volume_nyse_upper_combat" );
    common_scripts\utility::flag_wait_either( "give_xm25", "skip_paw" );

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5 ) && isai( var_5 ) )
            var_5 delete();
    }
}

_id_46B8( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1.5;

    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.foreground = 1;
    var_4 setshader( var_0, 640, 480 );

    if ( isdefined( var_3 ) && var_3 > 0 )
    {
        var_4.alpha = 0;
        var_4 fadeovertime( var_3 );
        var_4.alpha = 1;
        wait(var_3);
    }

    wait(var_1);

    if ( isdefined( var_2 ) && var_2 > 0 )
    {
        var_4.alpha = 1;
        var_4 fadeovertime( var_2 );
        var_4.alpha = 0;
    }

    var_4 destroy();
}

_id_46B9( var_0, var_1 )
{
    var_2 = getarraykeys( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_5 = var_3 * var_1 + 1;
        maps\_utility::delaythread( var_5, ::_id_46BA, var_0[var_4], var_0.size - var_3 - 1, var_1, var_4 );
    }
}

_id_46BA( var_0, var_1, var_2, var_3 )
{
    level notify( "new_introscreen_element" );
    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4.horzalign = "center";
    var_4.vertalign = "middle_adjustable";
    var_4.sort = 1;
    var_4.foreground = 1;
    var_4 settext( var_0 );
    var_4.alpha = 0;
    var_4 fadeovertime( 0.2 );
    var_4.alpha = 1;
    var_4.hidewheninmenu = 1;
    var_4.fontscale = 2.4;
    var_4.color = ( 0.8, 1.0, 0.8 );
    var_4.font = "objective";
    var_4.glowcolor = ( 0.3, 0.6, 0.3 );
    var_4.glowalpha = 1;
    var_5 = int( var_2 * 1000 + 4000 );
    var_4 setpulsefx( 30, var_5, 700 );
    thread maps\_introscreen::_id_1DA3( var_4 );

    if ( !isdefined( var_3 ) )
        return;

    if ( !isstring( var_3 ) )
        return;

    if ( var_3 != "date" )
        return;
}
