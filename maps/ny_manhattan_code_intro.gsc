// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_459C()
{
    wait 0.5;
    setsaveddvar( "sm_spotlimit", 2 );
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan_intro", 1 );
    wait 20;
    thread maps\_utility::vision_set_fog_changes( "ny_manhattan", 2.5 );
    wait 15;
    setsaveddvar( "sm_spotlimit", 1 );
}

_id_459D()
{
    setblur( 10, 0 );
    wait 5;
    setblur( 0, 3 );
}

_id_459E()
{
    var_0 = level._id_1436;
    var_1 = [];
    var_1["nearStart"] = 4;
    var_1["nearEnd"] = 21;
    var_1["nearBlur"] = 4.5;
    var_1["farStart"] = 138;
    var_1["farEnd"] = 468;
    var_1["farBlur"] = 1.35;
    maps\_utility::_id_27C0( var_0, var_1, 0.2 );
    wait 20;
    maps\_utility::_id_27C0( var_1, var_0, 1 );
}

_id_3F72( var_0 )
{
    level.player takeallweapons();
    level.player giveweapon( "m4_hybrid_grunt_optim" );
    level.player setweaponammostock( "m4_hybrid_grunt_optim", 1500 );
    level.player switchtoweaponimmediate( "alt_m4_hybrid_grunt_optim" );
    level.player giveweapon( "fraggrenade" );
    level.player setoffhandsecondaryclass( "flash" );
    level.player giveweapon( "ninebang_grenade" );
    level.player giveweapon( "xm25" );
}

_id_459F( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_2 maps\_utility::_id_0D04();
            continue;
        }

        continue;
    }
}

_id_45A0( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2.ignoreme = 1;
}

_id_45A1( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2.ignoreme = 0;
}

_id_45A2()
{
    foreach ( var_1 in level._id_45A3 )
    {
        if ( isdefined( var_1.script_noteworthy ) && var_1.script_noteworthy == "leader" )
        {
            level._id_45A4 = var_1;
            level._id_45A4._id_1032 = "lonestar";
            continue;
        }

        continue;
    }
}

_id_45A5()
{
    thread _id_45A8();
    wait 1;
    thread _id_45AA();
    wait 3;
    level._id_45A6 maps\_utility::_id_168C( "reno_line5" );
    wait(randomfloatrange( 1, 3 ));
    thread _id_4610( 204 );
    wait 0.2;
    thread _id_4610( 203 );
    wait 0.5;
    thread _id_4610( 202 );
    wait(randomfloatrange( 2, 4 ));
    thread _id_4610( 203 );
    wait(randomfloatrange( 1, 3 ));
    thread _id_4610( 204 );
}

_id_45A7()
{
    common_scripts\utility::flag_wait( "heat_combat_humvees" );
    thread _id_45A5();
}

_id_45A8()
{
    var_0 = maps\_vehicle::_id_2881( "heat_humvee_1" );
    var_0 maps\_vehicle::_id_2AB3( "running" );
    maps\_audio::aud_send_msg( "humvee_1_heat_battle", var_0 );
    common_scripts\utility::flag_wait( "heat_humvee_1_path_end" );
    var_1 = var_0 maps\_vehicle::_id_2514();
    wait 3.05;
    thread _id_45EF( level._id_45A9 );
}

_id_45AA()
{
    var_0 = maps\_vehicle::_id_2881( "heat_humvee_2" );
    var_0 maps\_vehicle::_id_2AB3( "running" );
    maps\_audio::aud_send_msg( "humvee_2_heat_battle", var_0 );
    common_scripts\utility::flag_wait( "heat_humvee_2_path_end" );
    var_1 = var_0 maps\_vehicle::_id_2514();
    wait 3.23;
    thread _id_45EF( level._id_45AB );
    maps\_utility::_id_26C0( "broad_gaz_assault_spawn" );
    var_2 = [];
    var_3 = getentarray( "broad_gaz_rpg", "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5 ) )
        {
            var_6 = var_5 maps\_utility::_id_166F( 1 );

            if ( isdefined( var_6 ) )
            {
                var_6.targetname = var_5.targetname;
                var_6.grenadeammo = 0;
            }
        }
    }
}

_id_45AC()
{
    self._id_1032 = self.script_noteworthy;
    self.grenadeammo = 0;
    thread _id_45EE( self );
}

_id_45AD( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
        {
            var_2 maps\_utility::_id_1902();
            continue;
        }

        continue;
    }
}

_id_45AE()
{
    var_0 = getent( "", "targetname" );
    var_0 notify( "trigger", level.player );
}

_id_45AF()
{
    thread _id_4605();
    thread _id_45C8();
    thread _id_45BF();
    thread _id_45C3();
    thread _id_45C6();
    thread _id_45D2();
    thread _id_45E3();
    thread _id_45F3();
    thread _id_45D6();
    thread _id_45BE();
    thread _id_45BB();
    thread _id_4611();
    thread _id_4615();
    thread _id_45B2();
    thread _id_4608();
    thread _id_4609();
    level._id_45A9 = [];
    level._id_45AB = [];
    level.player disableweapons();
    level.player disableoffhandweapons();
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = level.player.origin;
    var_0.angles = level.player.angles;
    thread maps\_utility::_id_265A( "allies" );
    thread maps\_utility::_id_265A( "axis" );
    maps\_utility::_id_27CB( "fc_gaz_guys", ::_id_45E4 );
    maps\_utility::_id_27CB( "russians_destroyed_building_fl2", ::_id_45E4 );
    maps\_utility::_id_27CA( "russian_heat_enemies", ::_id_45E4 );
    maps\_utility::_id_27CA( "gaz_entrance_guys1", ::_id_45F0 );
    maps\_utility::_id_27CA( "gaz_entrance_guys2", ::_id_45F1 );
    maps\_utility::_id_27CA( "broad_gaz_assault", ::_id_45AC );

    for ( var_1 = 2; var_1 < 6; var_1++ )
        common_scripts\utility::run_thread_on_noteworthy( "exchange_path_0" + var_1, ::_id_45DF );

    createthreatbiasgroup( "first_combat" );
    createthreatbiasgroup( "player_squad_broad" );
    createthreatbiasgroup( "first_combat_done" );
    setignoremegroup( "player_squad_broad", "first_combat" );
    setignoremegroup( "first_combat", "player_squad_broad" );
    level.player setthreatbiasgroup( "player_squad_broad" );

    foreach ( var_3 in level._id_45A3 )
    {
        var_3 setthreatbiasgroup( "player_squad_broad" );

        if ( !common_scripts\utility::flag( "no_briefing_start" ) )
            var_3 maps\_utility::_id_0D04();
    }

    var_5 = getentarray( "first_combat", "script_noteworthy" );
    var_6 = getentarray( "first_combat_backup", "script_noteworthy" );
    var_7 = getentarray( "us_army_01", "targetname" );
    level._id_45B0 = [];

    foreach ( var_9 in var_7 )
    {
        var_10 = var_9 maps\_utility::_id_166F( 1 );
        var_10.grenadeammo = 0;
        var_10 maps\_utility::_id_0D04();
        var_10.ignoresuppression = 1;
        level._id_45B0[level._id_45B0.size] = var_10;
    }

    thread _id_45B4();
    common_scripts\utility::flag_wait( "briefing_done" );
    level.player enableweapons();
    thread _id_4603();
    common_scripts\utility::flag_wait( "player_shot_or_advanced" );
    maps\_utility::_id_265B( "allies" );
    maps\_utility::_id_265B( "axis" );
    thread _id_45B3();
    level.player enableoffhandweapons();
}

_id_45B1()
{
    if ( !common_scripts\utility::flag( "obj_jammer_complete" ) )
        self.drawoncompass = 0;
}

_id_45B2()
{
    common_scripts\utility::flag_wait( "exiting_exchange" );
    var_0 = getent( "exchange_street", "targetname" );
    var_1 = getent( "broad_street", "targetname" );
    remapstage( var_0.origin, var_1.origin );
}

_id_45B3()
{
    level.player common_scripts\utility::waittill_any( "weapon_fired", "grenade_fire", "flashbang" );
    common_scripts\utility::flag_set( "player_shot" );
}

_id_45B4()
{
    level._id_45B5 = getent( "wounded_guy", "targetname" );
    level._id_45B6 = getent( "wounded_medic", "targetname" );
    level._id_45B7 = getent( "radio_guy", "targetname" );
    level._id_45B5 _id_460E();
    level._id_45B6 _id_460E();
    level._id_45B5 maps\_utility::_id_0D04();
    level._id_45B6 maps\_utility::_id_0D04();
    level._id_45B5._id_1032 = "wounded_guy";
    level._id_45B6._id_1032 = "wounded_carrier";
    level._id_45B7._id_1032 = "generic";
    level._id_45B8 = getent( "org_radio_guy", "targetname" );
    level._id_45B9 = getent( "org_wounded_new", "targetname" );
    level._id_45B8 thread maps\_anim::_id_124E( level._id_45B7, "radio_idle", "radio_stop" );
    level._id_45B9 thread maps\_anim::_id_11CF( level._id_45B6, "run_to" );
    level._id_45B9 thread maps\_anim::_id_11CF( level._id_45B5, "wounded_idle" );
    level._id_45B5 maps\_utility::_id_24F5();
    level._id_45B5.name = undefined;
    level._id_45B6.name = undefined;
    var_0 = [];
    var_0[0] = level._id_45B6;
    var_0[1] = level._id_45B5;
    common_scripts\utility::flag_wait( "exchange_humvee_go" );
    wait 2;
    level._id_45B9 maps\_anim::_id_1246( level._id_45B6, "run_to" );
    level._id_45B9 maps\_anim::_id_11DD( var_0, "drag" );
    level._id_45B9 thread maps\_anim::_id_11D6( var_0, "help_loop", "wounded_stop" );
    common_scripts\utility::flag_wait( "intro_gaz" );

    if ( isdefined( level._id_45B5 ) && isdefined( level._id_45B5._id_0D04 ) )
        level._id_45B5 maps\_utility::_id_1902();

    if ( isdefined( level._id_45B6 ) && isdefined( level._id_45B6._id_0D04 ) )
        level._id_45B6 maps\_utility::_id_1902();

    level._id_45B8 notify( "radio_stop" );
    level._id_45B5 delete();
    level._id_45B6 delete();
}

_id_45BA()
{
    self endon( "death" );
    var_0 = getent( "volume_exchange_fallback", "targetname" );

    if ( !common_scripts\utility::flag( "out_of_sewer" ) )
        maps\_utility::_id_0D04();

    if ( common_scripts\utility::flag( "first_combat_fallback" ) )
        self setgoalvolumeauto( var_0 );
}

_id_45BB()
{
    maps\_utility::_id_27CB( "first_combat_backup", ::_id_45BA );
    maps\_utility::_id_26C0( "fc_backup" );
    common_scripts\utility::flag_wait( "briefing_done" );
    var_0 = getentarray( "first_combat_backup", "script_noteworthy" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) && isalive( var_2 ) )
        {
            if ( isdefined( var_2._id_0D04 ) && var_2._id_0D04 )
                var_2 maps\_utility::_id_1902();
        }
    }

    common_scripts\utility::flag_wait( "first_combat_fallback" );
    var_0 = getentarray( "first_combat_backup", "script_noteworthy" );
    thread maps\ss_util::_id_4420( var_0, "volume_exchange_fallback" );
    common_scripts\utility::flag_wait( "exchange_guys_retreat" );
    var_4 = getentarray( "fc_gaz_guys", "script_noteworthy" );
    thread maps\ss_util::_id_4420( var_4, "broad_enemies_volume_02" );
    thread maps\ss_util::_id_4420( level._id_45BC, "broad_enemies_volume_02" );
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

_id_45BE()
{
    var_0 = getentarray( "broad_vehicles_hide", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 hide();

    common_scripts\utility::flag_wait( "tiff_sandman_moveout" );

    foreach ( var_2 in var_0 )
        var_2 show();
}

_id_45BF()
{
    common_scripts\utility::flag_wait( "broad_squad_moveup" );
    thread _id_45C1();
    level._id_45C0 maps\ss_util::_id_4422( "lonestar_line23" );
    level._id_45C4 maps\ss_util::_id_4422( "manhattan_trk_moving" );
    wait 15;
    common_scripts\utility::flag_set( "broad_hind_start" );
}

_id_45C1()
{
    wait 5;

    if ( !common_scripts\utility::flag( "player_used_hybrid" ) )
        thread maps\_utility::_id_1823( "hint_hybrid", 10 );
}

_id_45C2()
{
    self notify( "enable_awareness" );
    wait 0.05;
    thread _id_460E();
}

_id_45C3()
{
    common_scripts\utility::flag_wait( "broad_hind_strafe_setup" );
    common_scripts\utility::flag_set( "player_reached_15_broad" );
    level._id_4485 notify( "stop_ai" );
    level._id_4485 notify( "stop_missiles" );
    thread maps\ss_util::_id_442B();
    thread _id_45C7();
    common_scripts\utility::array_thread( level._id_45A3, ::_id_45C2 );
    setsaveddvar( "ai_friendlysuppression", 1 );
    level._id_45C4 maps\_utility::_id_13A4( "o" );
    level._id_45C4 setgoalnode( getnode( "truck_goal_15_broad", "targetname" ) );
    maps\_audio::aud_send_msg( "15_broad_lobby_first_vo_line" );
    thread _id_45C5();
    maps\_utility::_id_262C( "dialog_sandman_up_stairs" );
    level._id_45C0 maps\ss_util::_id_4422( "lonestar_line102" );
    maps\_utility::_id_262C( "dialog_sandman_stairwell" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line146" );
}

_id_45C5()
{
    maps\_shg_common::_id_168D();
    level._id_45C4 maps\_utility::_id_168C( "manhattan_trk_gameplan" );
    level._id_45C0 maps\_utility::_id_168C( "manhattan_snd_sameasbefore" );
    level._id_45A6 maps\_utility::_id_168C( "manhattan_rno_likeit" );
    maps\_shg_common::_id_168E();
}

_id_45C6()
{
    var_0 = getent( "ny_hind_crash_hull", "targetname" );
    var_0._id_1032 = "15_broad_hind";
    var_0 maps\_utility::_id_2629();
    var_1 = getent( "org_deadguy", "targetname" );
    var_2 = getent( "crashed_hind_deadguy", "targetname" );
    var_2._id_1032 = "hind_deadguy";
    var_2 maps\_utility::_id_2629();
    var_2 attach( "head_russian_military_b", "" );
    var_1 thread maps\_anim::_id_11CF( var_2, "dead_idle" );
    var_0 thread maps\_anim::_id_124E( var_0, "blades_spin", "stop_loop" );
    var_3 = getent( "ny_hind_crash_wall", "targetname" );
    var_4 = getent( "broad_couch_hide", "targetname" );
    var_5 = getent( "broad_painting_hide", "targetname" );
    var_6 = getent( "org_hind_rpg01", "targetname" );
    var_7 = getent( "org_hind_rpg02", "targetname" );
    var_8 = getent( "org_hind_rpg03", "targetname" );
    var_9 = getent( "broad_hind_crash_connection", "targetname" );
    var_3 connectpaths();
    var_3 hide();
    var_3 notsolid();
    var_4 hide();
    var_5 hide();
    var_5 notsolid();
    var_9 connectpaths();
    var_9 notsolid();
    var_10 = common_scripts\utility::getstruct( "broad_hind_flyby", "targetname" );
    common_scripts\utility::flag_wait( "broad_hind_start_shooting" );

    if ( isdefined( level._id_4485 ) )
    {
        maps\_audio::aud_send_msg( "broad_hind_flyby" );
        level._id_4485 thread maps\_vehicle::_id_2951( var_10 );
        level._id_4485 vehicle_setspeed( 45, 45, 45 );
        level._id_4485 waittill( "reached_dynamic_path_end" );
        level._id_4485 delete();
    }
}

_id_45C7()
{
    level endon( "broad_hind_start_shooting" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "broad_hind_backtrack" ) )
        {
            if ( isdefined( level._id_4485 ) )
                level._id_4485 thread _id_45E8();

            common_scripts\utility::flag_waitopen( "broad_hind_backtrack" );

            if ( isdefined( level._id_4485 ) )
            {
                level._id_4485 notify( "stop_ai" );
                level._id_4485 notify( "stop_missiles" );
            }
        }

        wait 0.1;
    }
}

_id_45C8()
{
    var_0 = getent( "broad_hind", "targetname" );
    var_0.godmode = 1;
    common_scripts\utility::flag_wait( "broad_hind_start" );
    thread _id_45A5();
    wait 15;
    common_scripts\utility::flag_set( "obj_follow_through_buildings_given" );
    common_scripts\utility::flag_set( "obj_broad_complete" );
    maps\_utility::_id_26BF( "path_squad_into_15broad" );
    setsaveddvar( "ai_friendlysuppression", 0 );
    thread _id_45E5();
    setsaveddvar( "ai_friendlysuppression", 0 );
    thread _id_45D0();
    level._id_4485 = maps\_vehicle::_id_2881( "broad_hind" );
    var_1 = missile_createattractororigin( level._id_45C9.origin + ( 0.0, 0.0, 64.0 ), 10000, 10000, level._id_4485 );
    level._id_45C9.health = 200;
    maps\_audio::aud_send_msg( "broad_hind_start", level._id_4485 );
    level._id_45CA = getdvarint( "ragdoll_explode_force" );
    setsaveddvar( "ragdoll_explode_force", "1000" );
    level._id_45CB = getdvarint( "physveh_explodeforce" );
    setsaveddvar( "physveh_explodeforce", "200" );
    level._id_4485 thread _id_45E8( level._id_45C9 );
    level._id_4485 thread _id_45CE();
    level._id_4485 notify( "stop_ai" );
    level._id_4485 notify( "stop_street_strafe" );
    level._id_4485 maps\_utility::delaythread( 8, ::_id_45E6 );
    thread _id_45F7();
    wait 3;
    common_scripts\utility::array_thread( level._id_45A3, ::_id_45D1 );
    level._id_45C4 maps\_utility::_id_168C( "truck_line26" );
    level._id_45C0 maps\_utility::delaythread( 2.5, maps\_utility::_id_168C, "lonestar_line25" );
    var_2 = [];
    var_2[var_2.size] = "lonestar_line52";
    var_2[var_2.size] = "lonestar_line53";
    var_2[var_2.size] = "manhattan_rno_getinhere";
    thread maps\_shg_common::_id_168B( level._id_45C0, "broad_hind_strafe_setup", var_2 );
    thread _id_45CC( var_1 );
    thread _id_45CF();
    wait 7;

    if ( !common_scripts\utility::flag( "broad_hind_strafe_setup" ) )
        thread _id_45CD();
}

_id_45CC( var_0 )
{
    level._id_45C9 waittill( "death" );

    if ( isdefined( var_0 ) )
        missile_deleteattractor( var_0 );
}

_id_45CD()
{
    level endon( "broad_hind_strafe_setup" );

    while ( !common_scripts\utility::flag( "broad_hind_strafe_setup" ) )
    {
        maps\_utility::_id_1F61( "hint_obj" );
        common_scripts\utility::flag_waitopen_or_timeout( "hind_dmg_hint", 6 );
        wait 0.05;
    }
}

_id_45CE()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_9 ) && !issubstr( var_9, "remote_missile" ) && var_1 == level.player )
        {
            if ( isdefined( level._id_4485 ) && self == level._id_4485 && !isdefined( level._id_4431 ) )
            {
                common_scripts\utility::flag_set( "hind_dmg_hint" );
                maps\_utility::_id_1823( "hint_hind_dmg", 3 );
                maps\_utility::delaythread( 3, common_scripts\utility::flag_clear, "hind_dmg_hint" );
                continue;
            }

            if ( !isdefined( level._id_4431 ) || !level._id_4431 )
            {
                common_scripts\utility::flag_set( "hind_dmg_hint" );
                maps\_utility::_id_1F61( "hint_hind_dmg_predator" );
                maps\_utility::delaythread( 3.5, common_scripts\utility::flag_clear, "hind_dmg_hint" );
            }
        }
    }
}

_id_45CF()
{
    level endon( "broad_hind_strafe_setup" );
    level.player waittill( "death" );
    setdvar( "ui_deadquote", "@NY_MANHATTAN_DEATH_BROAD_HIND" );
}

_id_45D0()
{
    common_scripts\utility::flag_wait( "squad_reached_15_broad" );
    wait 10;
    setsaveddvar( "ai_friendlysuppression", 1 );
}

_id_45D1()
{
    thread _id_460E();
    common_scripts\utility::waittill_either( "goal", "enable_awareness" );
    _id_460C();
}

_id_45D2()
{
    common_scripts\utility::flag_wait( "start_banker_massacre" );
    wait 3;
    maps\_utility::delaythread( 2, maps\_utility::_id_26BF, "trigger_ally_path_start_heat_combat" );
    level._id_45B5 notify( "wounded_stop" );
    level._id_45B6 notify( "wounded_stop" );
    common_scripts\utility::flag_set( "obj_broad_given" );
}

_id_45D3()
{
    if ( maps\_utility::_id_133C( "engineeffects" ) )
        maps\_utility::_id_13DE( "engineeffects" );

    if ( maps\_utility::_id_133C( "afterburners" ) )
        maps\_utility::_id_13DE( "afterburners" );

    if ( maps\_utility::_id_133C( "contrails" ) )
        maps\_utility::_id_13DE( "contrails" );

    wait 0.05;
    self delete();
}

_id_45D4( var_0, var_1 )
{
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2.origin = var_0;
    var_2.angles = var_1;
    playfxontag( common_scripts\utility::getfx( "ship_explosion" ), var_2, "tag_origin" );
    wait 2;
    var_2 delete();
}

_id_45D5( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    thread _id_45D4( self.origin, self.angles );
    thread _id_45D3();
}

_id_45D6()
{
    level._id_45D7 = maps\_vehicle::_id_2881( "humvee_front" );
    maps\_audio::aud_send_msg( "intro_stryker", level._id_45D7 );
    level._id_45C9 = maps\_vehicle::_id_2A99( "broad_stryker" );
    level._id_45C9.godmode = 1;
    maps\_audio::aud_send_msg( "broad_stryker", level._id_45C9 );
    level._id_45D8 = maps\_vehicle::_id_2A99( "broad_stryker02" );
    maps\_audio::aud_send_msg( "broad_stryker02", level._id_45D8 );
    level._id_45D7 setvehiclelookattext( "", &"" );
    level._id_45D8 setvehiclelookattext( "", &"" );
    level._id_45C9 setvehiclelookattext( "", &"" );
    level._id_45D7.godmode = 1;
    level._id_45D7._id_1AA1 = 1;
    thread _id_45DB();
    wait 0.05;
    common_scripts\utility::flag_wait( "out_of_sewer" );
    level._id_45D7 thread _id_45D9();
}

_id_45D9()
{
    self endon( "death" );
    self endon( "stop_shooting" );

    if ( !isdefined( level._id_45DA ) )
        level._id_45DA[0] = self;
    else
        level._id_45DA[level._id_45DA.size] = self;

    for (;;)
    {
        var_0 = _id_45DD();

        if ( isdefined( var_0 ) )
            _id_45DE( var_0 );

        wait(randomintrange( 5, 10 ));
    }
}

_id_45DB()
{
    level endon( "start_banker_massacre" );
    var_0 = getentarray( "intro_stryker_prox_trigger", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 enablelinkto();
        var_2 linkto( level._id_45D7 );
    }

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_close_to_stryker" );
        var_4 = level._id_45D7 vehicle_getspeed();
        level._id_45D7 vehicle_setspeed( 0, 15, 5 );
        common_scripts\utility::flag_waitopen( "player_close_to_stryker" );
        level._id_45D7 vehicle_setspeed( var_4, 15, 5 );
    }
}

_id_45DC( var_0 )
{
    var_1 = self gettagorigin( "tag_flash" );
    var_2 = var_0 geteye();
    var_3 = var_2 - var_1;
    var_4 = vectornormalize( var_3 );
    var_5 = length( var_3 );
    var_6 = 90;
    var_7 = var_6 * var_6;

    foreach ( var_9 in level._id_45DA )
    {
        if ( var_9 == self )
            continue;

        var_10 = var_9 gettagorigin( "tag_player" ) - var_1;
        var_11 = length( var_10 );

        if ( var_11 - var_5 > var_6 )
            continue;

        var_10 = vectornormalize( var_10 );
        var_12 = vectordot( var_10, var_4 );

        if ( var_12 < 0 )
            continue;

        var_13 = sqrt( var_11 * var_11 + var_7 );
        var_14 = var_11;
        var_15 = var_14 / var_13;

        if ( var_15 < var_12 )
            return 1;
    }

    return 0;
}

_id_45DD()
{
    var_0 = getaiarray( "axis" );
    var_0 = maps\_utility::_id_0AEC( self.origin, var_0, undefined, undefined, 4000, 1024 );

    foreach ( var_2 in var_0 )
    {
        if ( isai( var_2 ) )
        {
            if ( !isdefined( var_2.ignoreme ) || var_2.ignoreme == 0 )
            {
                if ( sighttracepassed( self gettagorigin( "tag_barrel" ), var_2 geteye(), 0, self ) )
                {
                    if ( !_id_45DC( var_2 ) )
                        return var_2;
                }
            }
        }
    }

    return undefined;
}

_id_45DE( var_0 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
    {
        self setturrettargetent( var_0, ( 0.0, 0.0, 0.0 ) );

        while ( isdefined( var_0 ) )
        {
            var_1 = self gettagorigin( "tag_barrel" );
            var_2 = var_0 geteye();
            var_3 = self gettagangles( "tag_flash" );
            var_4 = anglestoforward( var_3 );
            var_5 = var_2 - var_1;
            var_5 = vectornormalize( var_5 );
            var_6 = vectordot( var_4, var_5 );

            if ( var_6 > 0.999 )
                break;

            wait 0.05;
        }

        if ( !isdefined( var_0 ) )
        {
            self notify( "stop_debug" );
            return;
        }
    }

    var_7 = isai( var_0 );
    var_8 = randomintrange( 5, 15 );

    for ( var_9 = 0; var_9 < var_8; var_9++ )
    {
        if ( var_7 && !isdefined( var_0 ) )
            break;

        if ( _id_45DC( var_0 ) )
            break;

        self fireweapon( "tag_flash", var_0, ( 0.0, 0.0, 0.0 ), 0.0 );
        maps\_audio::aud_send_msg( "Stryker_fire_weapon", var_0 );
        wait 0.1;
    }

    self notify( "stop_debug" );
}

_id_45DF()
{
    var_0 = undefined;
    var_1 = undefined;

    if ( isdefined( self.target ) )
        var_1 = getent( self.target, "targetname" );

    if ( isdefined( self._id_164F ) )
        var_0 = getent( self._id_164F, "targetname" );

    self waittill( "trigger" );

    if ( isdefined( var_0 ) )
    {
        var_0 connectpaths();
        var_0 notsolid();
    }
}

_id_45E0( var_0, var_1 )
{
    var_1._id_2ABC = 2;
    var_2 = maps\_utility::_id_127E( "gazcrash", var_1._id_1032 );
    var_3 = getanimlength( var_2 );
    var_4 = var_3 - 2.0;
    thread maps\_anim::_id_11DD( var_0, "gazcrash" );
    wait(var_4);
    var_1 thread maps\_vehicle::_id_2514( "all_but_gunner" );
    wait 3;

    foreach ( var_6 in var_1._id_0A39 )
    {
        if ( var_6._id_2252 != 3 )
            var_6._id_0EC6 = 0;
    }

    var_1.godmode = 0;
}

_id_45E1()
{
    var_0 = getent( "gazcrash_kill", "targetname" );
    wait 0.5;
    var_1 = getaiarray( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) && isdefined( var_3 ) && var_3 istouching( var_0 ) )
            var_3 maps\ss_util::_id_441D();
    }
}

_id_45E2( var_0, var_1 )
{
    var_0._id_0EC6 = 1;
    var_0._id_259F = 1;
}

_id_45E3()
{
    var_0 = getentarray( "gaz_path_blocker", "targetname" );
    common_scripts\utility::flag_wait( "briefing_done" );
    wait 1;
    var_1 = maps\_vehicle::_id_2A99( "intro_gaz" );
    var_1.health = 10000;
    var_1 maps\_vehicle::_id_2AC8( 1 );
    var_2 = undefined;
    maps\_audio::aud_send_msg( "intro_gaz", var_1 );

    foreach ( var_4 in var_1._id_0A39 )
    {
        var_1 thread _id_45E2( var_4, var_1 );

        if ( var_4._id_2252 == 3 )
        {
            var_2 = var_4;
            var_4._id_2955 = 1;
        }
    }

    var_1.godmode = 1;
    var_1._id_1032 = "intro_gaz";
    var_1 maps\_anim::_id_1244();
    var_1 maps\_vehicle::_id_2AB3( "running" );
    var_6 = getent( "intro_luxurysedan", "targetname" );
    var_6._id_1032 = "intro_luxurysedan";
    var_6 maps\_anim::_id_1244();
    var_7 = getent( "intro_subcompact", "targetname" );
    var_7._id_1032 = "intro_subcompact";
    var_7 maps\_anim::_id_1244();
    var_8[0] = var_1;
    var_8[1] = var_6;
    var_8[2] = var_7;
    var_9 = getent( "gazcrash_scripted_node", "targetname" );
    var_9 maps\_anim::_id_11BF( var_8, "gazcrash" );
    common_scripts\utility::flag_wait( "intro_gaz" );
    var_10 = getentarray( "first_combat_backup", "script_noteworthy" );

    foreach ( var_4 in var_10 )
        thread maps\ss_util::_id_441C( "bullet", 1, 6 );

    thread _id_45E1();
    var_1 connectpaths();
    var_9 thread _id_45E0( var_8, var_1 );
    level._id_45BC = getentarray( "first_combat_backup_02", "script_noteworthy" );

    foreach ( var_14 in level._id_45BC )
    {
        var_15 = var_14 maps\_utility::_id_166F( 1 );
        var_15.targetname = var_14.targetname;
        var_15.grenadeammo = 0;
        level._id_45BC[level._id_45BC.size] = var_15;
    }

    wait 2.0;
    level._id_45A6 maps\_utility::_id_168C( "reno_line3" );
    level._id_45C4 maps\_utility::_id_168C( "truck_line25" );

    foreach ( var_18 in var_0 )
    {
        var_18 connectpaths();
        var_18 notsolid();
    }

    level._id_45D7 notify( "stop_shooting" );
    common_scripts\utility::flag_wait_or_timeout( "exchange_guys_dead", 45 );

    if ( !common_scripts\utility::flag( "start_banker_massacre" ) )
        maps\_utility::_id_26BF( "colors2004" );
}

_id_45E4()
{
    self.grenadeammo = 0;
}

_id_45E5()
{
    wait 180;
    common_scripts\utility::flag_set( "punish_time" );
}

_id_45E6()
{
    self endon( "death" );
    self endon( "stop_street_strafe" );
    self endon( "stop_ai" );
    thread maps\ny_hind_ai::_id_4538();
    var_0 = spawn( "script_origin", level.player.origin );
    self._id_4535["target"] = var_0;
    self._id_4535["sweepcount"] = 0;

    for (;;)
    {
        maps\ny_hind_ai::_id_453B( "aiming" );
        var_1 = ( 1.0, 0.0, 0.0 );
        var_2 = ( 0.0, 1.0, 0.0 );

        if ( randomint( 2 ) > 0 )
            var_2 = -1 * var_2;

        var_3 = randomfloatrange( 120, 480 );
        var_4 = randomfloatrange( 60, 240 );
        var_5 = -1 * randomfloatrange( 60, 240 );
        var_6 = ( var_4 - var_5 ) / 60;
        var_7 = level.player.origin + var_3 * var_1 + var_4 * var_2;
        var_8 = level.player.origin + var_3 * var_1 + var_5 * var_2;
        var_0.origin = var_7;
        var_0 moveto( var_8, var_6, 0.2, 0.2 );
        wait(var_6);
    }
}

_id_45E7()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "punish_time" );
    self notify( "stop_stret_strafe" );
    thread maps\ny_hind_ai::_id_4536();
}

_id_45E8( var_0 )
{
    self endon( "death" );
    self endon( "stop_missiles" );
    thread _id_45E6();
    thread _id_45E7();
    var_1 = undefined;
    var_2 = undefined;
    var_3 = 0.94;
    var_4 = var_0;

    for (;;)
    {
        if ( !isdefined( var_0 ) || !isalive( var_0 ) )
        {
            if ( !isdefined( var_2 ) )
            {
                var_2 = spawn( "script_origin", level.player.origin );
                var_1 = missile_createattractorent( var_2, 10000, 2048, self );
                var_4 = level.player;
            }
        }

        wait 0.1;

        if ( maps\ny_manhattan_code_hind::_id_45E9( var_4, 0.707, var_3 ) )
        {
            var_5 = 1;

            if ( randomfloat( 100 ) > 75 )
            {
                var_5 = 2;

                if ( randomfloat( 100 ) > 75 )
                    var_5 = 4;
            }

            if ( !common_scripts\utility::flag( "punish_time" ) )
            {
                var_6 = randomfloatrange( 256, 512 );
                var_7 = randomfloatrange( -512, 512 );
            }
            else
            {
                var_6 = randomfloatrange( 0, 128 );
                var_7 = randomfloatrange( -128, 128 );
            }

            var_8 = self.origin[0] - var_4.origin[0];

            if ( var_8 < var_6 )
                var_6 = 0;

            var_9 = ( var_6, var_7, 0 );

            if ( isdefined( var_2 ) )
                var_2.origin = var_4.origin + var_9;

            if ( maps\ny_manhattan_code_hind::_id_45EA( self ) )
            {
                thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", var_5, var_4 );
                var_10 = [];
                var_10[0] = self;
                var_10[1] = var_5;
                var_10[2] = var_4;
                maps\_audio::aud_send_msg( "broad_hind_missiles", var_10 );
                self notify( "fired_missiles" );
            }

            if ( common_scripts\utility::flag( "punish_time" ) )
            {
                wait(randomfloatrange( 1, 3 ));
                var_3 = 0.707;
            }
            else
                wait(randomfloatrange( 2, 5 ));
        }
    }
}

_id_45EB()
{
    self endon( "death" );
    thread _id_45E6();
    common_scripts\utility::flag_wait( "exchange_hind_fire" );

    if ( maps\ny_manhattan_code_hind::_id_45EA( self ) )
        thread maps\_helicopter_globals::fire_missile( "hind_rpg_cheap", 4, level.player );
}

_id_45ED()
{
    wait 20.5;
    var_0 = maps\_vehicle::_id_2A9A( "intro_hind_flyover" );
    wait 0.05;
    wait 6;

    foreach ( var_2 in var_0 )
        var_2 delete();
}

_id_45EE( var_0 )
{
    var_1 = getent( "broad_enemies_volume_02", "targetname" );
    var_2 = getent( "intro_slide_tag", "targetname" );
    var_2 maps\_anim::_id_124A( var_0, "broad_enemy_entrance" );

    if ( isdefined( var_0 ) && isalive( var_0 ) && !var_0 maps\_utility::_id_0D69() )
    {
        var_2 maps\_anim::_id_1246( var_0, "broad_enemy_entrance" );
        wait 0.1;

        if ( isdefined( var_0 ) && isalive( var_0 ) )
            var_0 setgoalvolumeauto( var_1 );
    }
}

_id_45EF( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) && isalive( var_2 ) && !var_2 maps\_utility::_id_0D69() )
        {
            var_2._id_1032 = var_2.script_noteworthy;
            thread _id_45EE( var_2 );
        }
    }
}

_id_45F0()
{
    level._id_45A9[level._id_45A9.size] = self;
    self.grenadeammo = 0;
}

_id_45F1()
{
    level._id_45AB[level._id_45AB.size] = self;
    self.grenadeammo = 0;
}

_id_45F2()
{
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line103" );
    level._id_45A6 thread maps\_utility::_id_168C( "reno_line34" );
}

_id_45F3()
{
    var_0 = getent( "15_broad_breach_door", "targetname" );
    var_0._id_1032 = "broad_door";
    var_0 maps\_anim::_id_1244();
    var_1 = getent( "broad_breach_col", "targetname" );
    common_scripts\utility::flag_wait( "15_broad_breach" );
    var_2 = getaiarray( "axis" );
    createthreatbiasgroup( "street_guys" );
    createthreatbiasgroup( "sandman_15_broad" );
    common_scripts\utility::array_call( var_2, ::setthreatbiasgroup, "street_guys" );
    level._id_45C0 setthreatbiasgroup( "sandman_15_broad" );
    setignoremegroup( "street_guys", "sandman_15_broad" );
    setignoremegroup( "sandman_15_broad", "street_guys" );
    common_scripts\utility::array_thread( level._id_45A3, ::_id_460C );
    thread _id_45F2();
    maps\_utility::_id_1425( "15_broad" );
    var_0 maps\_anim::_id_124A( level._id_45C0, "mulekick_transition", "tag_origin" );
    var_0 maps\_anim::_id_1246( level._id_45C0, "mulekick_transition", "tag_origin" );
    var_0 thread maps\_anim::_id_124E( level._id_45C0, "mulekick_idle", "stop_loop" );
    common_scripts\utility::flag_wait( "15_broad_breach_go" );
    level._id_45C4 maps\_utility::_id_13A4( "b" );
    level._id_45C4 maps\_utility::_id_2686();

    if ( isdefined( level._id_45CA ) )
        setsaveddvar( "ragdoll_explode_force", "" + level._id_45CA );

    if ( isdefined( level._id_45CB ) )
        setsaveddvar( "physveh_explodeforce", "" + level._id_45CB );

    maps\_audio::aud_send_msg( "15_broad_breach_door_anim" );
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::_id_1246( level._id_45C0, "mulekick_kick", "tag_origin" );
    maps\_audio::aud_send_msg( "mulekick_kick" );
    thread _id_03C9::_id_45F4();
    var_1 connectpaths();
    var_1 common_scripts\utility::delaycall( 1, ::delete );
    common_scripts\utility::flag_set( "mulekick_done" );
    var_0 maps\_anim::_id_1246( var_0, "door_kick_door" );
    thread maps\_utility::_id_265A( "allies" );
    setsaveddvar( "ai_friendlysuppression", 0 );
    common_scripts\utility::noself_delaycall( 3, ::setsaveddvar, "ai_friendlysuppression", 1 );
    common_scripts\utility::flag_set( "broad_hind_strafe_setup" );
    level._id_45C0 maps\_utility::_id_2686();
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line105" );
    level._id_45C0.ignoresuppression = 1;
    common_scripts\utility::flag_wait( "15_broad_first_guys_dead" );
    wait 1;
    maps\_utility::_id_26BF( "sandman_15_broad_moveup" );
    common_scripts\utility::flag_wait( "15_broad_guys_dead" );
    maps\_utility::_id_26BF( "colors_c9b" );
}

_id_45F5( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4 ) )
        {
            if ( isdefined( var_4._id_0D04 ) && var_4._id_0D04 )
                var_4 maps\_utility::_id_1902();

            var_4 delete();
        }
    }
}

_id_45F6()
{
    level._id_45C9 waittill( "death" );
    common_scripts\utility::flag_set( "broad_humvee_dead" );
}

_id_45F7()
{
    level._id_4485 waittill( "fired_missiles" );
    level._id_45C9.godmode = 0;
}

_id_45F8()
{
    thread _id_45F6();
    var_0 = getent( "broad_stryker_disconnect", "targetname" );
    var_1 = getent( "org_stryker_infantry_explosion", "targetname" );
    var_2 = getent( "dest_stryker_infantry_explosion", "targetname" );
    common_scripts\utility::flag_wait( "broad_stryker_endpath" );
    var_3 = getentarray( "army_02_deadguys", "script_noteworthy" );

    foreach ( var_5 in var_3 )
    {
        wait(randomfloatrange( 0, 2 ));
        var_5 thread _id_460F();
    }

    common_scripts\utility::flag_wait( "broad_humvee_explosion" );
    thread _id_4610( 205 );
    common_scripts\utility::flag_wait( "broad_stryker_endpath" );
    var_0 connectpaths();
    var_0 notsolid();
}

_id_45F9()
{
    var_0 = getent( "sewer_exit_scripted_node", "targetname" );
    var_1 = getent( "intro_humvee", "targetname" );
    var_1._id_1032 = "intro_humvee";
    var_1 maps\_utility::_id_2629();
    var_2 = getent( "intro_m4", "targetname" );
    var_2._id_1032 = "intro_m4";
    var_2 maps\_utility::_id_2629();
    var_3 = getent( "intro_knife", "targetname" );
    var_3._id_1032 = "intro_knife";
    var_3 maps\_utility::_id_2629();
    var_4 = "viewmodel_m4_hybrid_iw5";
    var_2 hidepart( "tag_acog_2", var_4 );
    var_2 hidepart( "tag_m203", var_4 );
    var_2 hidepart( "tag_shotgun", var_4 );
    var_2 hidepart( "tag_silencer", var_4 );
    var_2 hidepart( "tag_sight_on", var_4 );
    var_2 hidepart( "tag_thermal_scope", var_4 );
    var_2 hidepart( "tag_red_dot", var_4 );
    var_2 hidepart( "tag_heartbeat", var_4 );
    var_2 hidepart( "tag_flash", var_4 );
    var_2 hidepart( "tag_brass", var_4 );
    var_2 hidepart( "tag_laser", var_4 );
    var_2 hidepart( "tag_magnifier", var_4 );
    var_2 hidepart( "tag_reticle_acog", var_4 );
    var_2 hidepart( "j_slider_m203", var_4 );
    var_2 hidepart( "j_grenade_m203", var_4 );
    var_2 hidepart( "tag_reticle_thermal_scope", var_4 );
    var_2 hidepart( "j_motion_tracker_roty", var_4 );
    var_2 hidepart( "j_release", var_4 );
    var_2 hidepart( "j_flip", var_4 );
    var_2 hidepart( "tag_motion_tracker", var_4 );
    var_2 hidepart( "j_pump_shotgun", var_4 );
    var_2 hidepart( "j_ammo_shotgun", var_4 );
    var_2 hidepart( "j_reload_shotgun", var_4 );
    var_2 hidepart( "j_plate_shotgun", var_4 );
    var_5 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_5 setmodel( "viewmodel_magnifier" );
    var_5._id_1032 = "intro_m4_scope";
    var_5 maps\_anim::_id_1244();
    var_2 maps\_anim::_id_11CF( var_5, "ny_intro", "tag_magnifier" );
    var_5 linkto( var_2, "tag_magnifier" );
    level._id_45C0.name = undefined;
    var_6 = [];
    var_6[0] = level._id_45C0;
    var_6[1] = level._id_4599;
    var_6[3] = var_2;
    var_0 maps\_anim::_id_11BF( var_6, "ny_intro" );
    var_0 maps\_anim::_id_11CF( level._id_45FA, "ny_intro" );
    var_0 maps\_anim::_id_11CF( var_3, "ny_intro" );
    var_0 maps\_anim::_id_11CF( var_1, "ny_intro" );
    level.player freezecontrols( 1 );
    level.player disableweapons();
    thread _id_6818();
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", 1 );
    setsaveddvar( "hud_showstance", 0 );
    setsaveddvar( "actionSlotsHide", 1 );
    level.player playerlinktoblend( level._id_4599, "tag_player", 0.5 );
    common_scripts\utility::flag_wait( "obj_follow_to_hind_given" );
    wait 0.5;
    level._id_4599 show();
    level._id_45FA show();
    thread _id_45FC();
    thread _id_45ED();
    thread _id_4600();
    thread _id_03C9::_id_45FB();
    thread _id_459C();
    thread _id_459D();
    thread _id_459E();
    var_7 = getent( "humvee_deadguy", "targetname" );
    var_7._id_1032 = "humvee_deadguy";
    var_7 maps\_utility::_id_2629();
    var_7 attach( "head_rangers_b", "" );
    var_0 thread maps\_anim::_id_11CF( var_7, "dead_idle" );
    var_1 setflaggedanimrestart( "blah", level._id_0C59["intro_humvee"]["wheel_loop"][0], 1, 1 );
    var_1 setflaggedanimrestart( "blargh", level._id_0C59["intro_humvee"]["ny_intro"], 1, 1 );
    var_0 thread maps\_anim::_id_1246( level._id_45FA, "ny_intro" );
    var_0 thread maps\_anim::_id_1246( var_3, "ny_intro" );
    var_0 maps\_anim::_id_11DE( var_6, "ny_intro" );
    level._id_45C0.name = "Sandman";
    level._id_45B6.name = "Cpl. Soucy";
    var_2 hide();
    var_5 hide();
    var_3 hide();
    maps\_autosave::_id_1C3F();
    maps\_utility::_id_26BF( "first_combat_2" );
    level._id_45C0 maps\_utility::_id_2131();
    level._id_45C0 maps\_utility::delaythread( 10, maps\_utility::_id_27B9 );
    level._id_45A6 maps\_utility::_id_27CC();
    level._id_45A6 maps\_utility::delaythread( 5, maps\_utility::_id_27CD );
    level._id_4599 hide();
    level._id_45FA hide();
    level.player unlink();
    level.player enableweapons();
    level.player enableoffhandweapons();
    level.player freezecontrols( 0 );
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", 0 );
    setsaveddvar( "hud_showstance", 1 );
    setsaveddvar( "actionSlotsHide", 0 );
    level._id_45D7 setvehiclelookattext( "Samaritan", &"" );
    level._id_45D8 setvehiclelookattext( "Frolic", &"" );
    level._id_45C9 setvehiclelookattext( "Firefly", &"" );
    common_scripts\utility::flag_set( "out_of_sewer" );
    common_scripts\utility::flag_set( "briefing_done" );
    wait 1;
}

_id_6818()
{
    wait 4.5;
    level._id_1441 maps\_utility::_id_27AD( 0.1 );
    wait 1;
    level._id_1441 maps\_utility::_id_27AE( 3 );
    common_scripts\utility::flag_wait( "exchange_humvee_go" );
    wait 0.2;
    level._id_1441 maps\_utility::_id_27AD( 0.1 );
    wait 0.5;
    level._id_1441 maps\_utility::_id_27AE( 0.5 );
}

_id_45FC()
{
    level._id_4599 waittillmatch( "single anim", "start_missiles" );
    var_0 = maps\_vehicle::_id_2881( "intro_missile_1" );
    var_0 thread _id_45D5( "intro_missile_1_hits", "intro_missile1_hits" );
    wait 1;
    var_1 = maps\_vehicle::_id_2881( "intro_missile_2" );
    var_1 thread _id_45D5( "intro_missile_2_hits", "intro_missile2_hits" );
    var_2 = getent( "intro_taxi", "script_noteworthy" );
    wait 6.4;
    maps\_audio::aud_send_msg( "taxi_explode", var_2 );
    var_2 maps\_utility::_id_2733();
    wait 0.5;
    common_scripts\utility::flag_set( "exchange_humvee_go" );
    var_3 = getent( "org_intro_rpg", "targetname" );
    var_4 = getent( "dest_intro_rpg", "targetname" );
    wait 7;
    var_5 = magicbullet( "rpg_straight", var_3.origin, var_4.origin );
    common_scripts\utility::flag_wait( "out_of_sewer" );
    common_scripts\utility::flag_set( "player_shot_or_advanced" );
}

_id_45FD( var_0 )
{
    var_1 = level.scr_sound[self._id_1032][var_0];
    maps\_audio::_id_170B( var_1 );
}

_id_45FE( var_0 )
{
    var_1 = level.scr_sound[self._id_1032][var_0];
    maps\_audio::_id_170F( var_1 );
}

_id_45FF( var_0 )
{
    var_1 = level.scr_sound[self._id_1032][var_0];
    return maps\_audio::_id_170D( var_1 );
}

_id_4600()
{
    level._id_45C0 _id_45FD( "lonestar_line135" );
    level._id_45C0 _id_45FD( "lonestar_line136" );
    wait 5.0;
    level._id_45C0 maps\_utility::_id_168C( "manhattan_snd_frostfrost" );
    level._id_45C0 waittillmatch( "single anim", "dialog1" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line135" );
    level._id_45C0 waittillmatch( "single anim", "dialog2" );
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line136" );
    maps\_shg_common::_id_168D();
    level._id_45C0 maps\_utility::_id_168C( "manhattan_snd_youup" );
    level._id_45A6 maps\_utility::_id_168C( "manhattan_rno_weregood" );
    maps\_shg_common::_id_168E();
}

_id_4601()
{
    var_0 = 1;
    var_1 = 0;
    var_2 = getkeybinding( "+speed_throw" );

    if ( !isdefined( var_2 ) || var_2["count"] == 0 )
    {
        var_0 = 0;
        var_2 = getkeybinding( "+toggleads_throw" );

        if ( isdefined( var_2 ) && var_2["count"] > 0 )
            var_1 = 1;
    }

    var_3 = 0;

    if ( var_1 )
        var_3 = 1;
    else if ( var_0 )
        var_3 = 2;

    return var_3;
}

_id_4602( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_4601();

    switch ( var_5 )
    {
        case 0:
            thread maps\_utility::_id_1823( "hint_ads_empty", var_2 );
            break;
        case 1:
            thread maps\_utility::_id_1823( var_1, var_2 );
            break;
        case 2:
            thread maps\_utility::_id_1823( var_0, var_2 );
            break;
    }

    if ( level.console )
        return;

    var_6 = var_5;

    while ( isdefined( level._id_13DD ) )
    {
        var_5 = _id_4601();

        if ( var_5 != var_6 )
        {
            switch ( var_5 )
            {
                case 0:
                    level._id_13DD settext( "" );
                    break;
                case 1:
                    level._id_13DD settext( var_4 );
                    break;
                case 2:
                    level._id_13DD settext( var_3 );
                    break;
            }

            var_6 = var_5;
        }

        wait 0.05;
    }
}

_id_4603()
{
    common_scripts\utility::flag_wait( "sandman_sewer_exit_moveup" );
    maps\_audio::aud_send_msg( "russian_radio_chatter" );
    common_scripts\utility::flag_set( "reno_truck_start" );
    wait 4;
    maps\_utility::_id_26BF( "trigger_p1" );
    common_scripts\utility::flag_wait( "reno_truck_take_left" );
    thread _id_4607();
    common_scripts\utility::flag_wait( "reno_tangos_ahead" );

    if ( !common_scripts\utility::flag( "player_used_ads" ) )
        thread _id_4602( "hint_ads", "hint_ads_toggle", 5, &"NY_MANHATTAN_HINT_ADS", &"NY_MANHATTAN_HINT_ADS_TOGGLE" );

    if ( level.console )
        maps\_utility::delaythread( 10, ::_id_4602, "hint_snapto", "hint_ads_empty", 3, &"NY_MANHATTAN_HINT_SNAPTO", "" );

    wait(randomfloatrange( 7, 10 ));
    thread _id_4610( 201 );
    wait 0.2;
    thread _id_4610( 200 );
    wait(randomfloatrange( 1, 3 ));
    thread _id_4610( 200 );
    magicbullet( "rpg", ( -1267.9, -3028.8, 24.0 ), ( -1267.9, -3028.8, 20.0 ) );
    wait 1;
    level._id_45C0 maps\_utility::_id_168C( "lonestar_line19" );
    common_scripts\utility::flag_wait( "start_banker_massacre" );
    level notify( "broad_combat_start" );
    level._id_45C9 maps\_vehicle::_id_1FA6();
    level._id_45D8 maps\_utility::delaythread( 1.5, maps\_vehicle::_id_1FA6 );
    level._id_45C9 thread _id_45D9();
    var_0 = getentarray( "stryker_infantry", "targetname" );

    foreach ( var_2 in var_0 )
        var_3 = var_2 maps\_utility::_id_166F( 1 );

    thread _id_45F8();
    wait 1;
    maps\_audio::aud_send_msg( "broad_humvee_02", level._id_4604 );
    maps\_shg_common::_id_168D();
    level._id_45C4 maps\_utility::_id_168C( "truck_line5" );
    level._id_45C4 maps\_utility::_id_168C( "manhattan_trk_dontshoothim" );
    level._id_45A6 maps\_utility::_id_168C( "manhattan_rno_noshit" );
    maps\_shg_common::_id_168E();
    common_scripts\utility::flag_wait( "dialog_truck_15broad" );

    if ( !common_scripts\utility::flag( "15broad_highguys_dead" ) )
        level._id_45C4 maps\_utility::_id_168C( "truck_line4" );

    common_scripts\utility::flag_wait( "15_broad_retreat" );
    var_5 = getentarray( "russians_destroyed_building_fl2", "script_noteworthy" );
    thread maps\ss_util::_id_4420( var_5, "volume_15_broad_retreat" );
}

_id_4605()
{
    common_scripts\utility::flag_wait( "player_advanced" );
    var_0 = getentarray( "first_combat_delay", "script_noteworthy" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3 stalingradspawn();
        var_1[var_1.size] = var_4;
        var_4.targetname = var_3.targetname;
        var_4.grenadeammo = 0;
        var_5 = getnode( var_4.targetname, "targetname" );
        var_4 setgoalnode( var_5 );
        var_4 thread _id_4606();
    }

    wait 4;
    thread maps\ss_util::_id_4420( var_1, "volume_exchange_fallback" );
    wait 5;

    foreach ( var_8 in var_1 )
    {
        wait(randomfloatrange( 0, 2 ));
        var_8 thread maps\ss_util::_id_441D();
    }
}

_id_4606()
{
    self endon( "death" );
    self waittill( "goal" );
    wait(randomfloatrange( 1, 2 ));

    if ( isdefined( self ) && isalive( self ) )
        thread maps\ss_util::_id_441D();
}

_id_4607()
{
    level._id_45B7 maps\_utility::_id_168C( "radio_loop02" );
}

_id_4608()
{
    level endon( "reno_tangos_ahead" );
    level endon( "player_used_ads" );

    for (;;)
    {
        if ( level.player adsbuttonpressed() )
            common_scripts\utility::flag_set( "player_used_ads" );

        wait 0.05;
    }
}

_id_4609()
{
    level endon( "tiff_fight_02" );
    level endon( "player_used_xm25" );

    for (;;)
    {
        var_0 = level.player getcurrentprimaryweapon();

        if ( issubstr( var_0, "xm25" ) )
            common_scripts\utility::flag_set( "player_used_xm25" );

        wait 0.05;
    }
}

_id_460A( var_0 )
{
    while ( !common_scripts\utility::flag( var_0 ) )
    {
        var_1 = randomintrange( 10, 20 );
        var_2 = randomintrange( 1, 3 );
        wait(var_1);

        if ( !common_scripts\utility::flag( var_0 ) )
        {
            if ( var_2 == 1 )
            {
                level._id_45C0 maps\_utility::_id_168C( "lonestar_line52" );
                continue;
            }

            if ( var_2 == 2 )
            {
                level._id_45C0 maps\_utility::_id_168C( "lonestar_line53" );
                continue;
            }

            level._id_45C0 maps\_utility::_id_168C( "lonestar_line54" );
        }
    }
}

_id_460B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = 10;

    if ( !isdefined( var_4 ) )
        var_4 = 20;

    while ( !common_scripts\utility::flag( var_1 ) )
    {
        var_6 = randomfloatrange( var_3, var_4 );
        var_7 = common_scripts\utility::random( var_2 );

        if ( isdefined( var_5 ) && var_7 == var_5 )
            continue;
        else
        {
            var_5 = var_7;
            wait(var_6);

            if ( !common_scripts\utility::flag( var_1 ) )
                var_0 maps\_utility::_id_168C( var_7 );
        }
    }
}

_id_460C()
{
    if ( isdefined( self._id_460D ) )
    {
        self.ignoreall = 0;
        self._id_100A = undefined;
        self.ignoresuppression = 0;
        self.suppressionwait = self._id_460D;
        self._id_460D = undefined;
        maps\_utility::_id_27B8();
        self.ignorerandombulletdamage = 0;
        maps\_utility::_id_2715();
        maps\_utility::_id_1071();
        maps\_utility::_id_2178( 3 );
        self.grenadeawareness = 1;
        self.ignoreme = 0;
        maps\_utility::_id_27CD();
        self._id_1106 = undefined;
    }
}

_id_460E()
{
    if ( !isdefined( self._id_460D ) )
    {
        self.ignoreall = 1;
        self._id_100A = 1;
        self.ignoresuppression = 1;
        self._id_460D = self.suppressionwait;
        self.suppressionwait = 0;
        maps\_utility::_id_0EEC();
        self.ignorerandombulletdamage = 1;
        maps\_utility::_id_2714();
        maps\_utility::_id_1057();
        maps\_utility::_id_280D();
        self.grenadeawareness = 0;
        self.ignoreme = 1;
        maps\_utility::_id_27CC();
        self._id_1106 = 1;
    }
}

_id_460F()
{
    if ( isdefined( self ) && isai( self ) || isplayer( self ) )
    {
        var_0 = self.origin;
        var_1 = 0.9;
        maps\_audio::aud_send_msg( "kill_guy_missile_incoming", [ var_0, var_1 ] );
        wait(var_1);
        maps\_audio::aud_send_msg( "kill_guy_missile_explosion", var_0 );
        playfx( common_scripts\utility::getfx( "ny_mortarexp_dud" ), var_0 );

        if ( isdefined( self ) && isai( self ) )
            self kill();
    }
}

_id_4610( var_0 )
{
    var_1 = randomfloatrange( 1.0, 1.5 );
    maps\_audio::aud_send_msg( "exploder_incoming", [ var_0, var_1 ] );
    wait(var_1);
    maps\_audio::aud_send_msg( "exploder_explosion", var_0 );
    common_scripts\utility::exploder( var_0 );
}

_id_4611()
{
    level endon( "stop_kill_player" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "broad_player_kill" );
        wait 3;

        if ( common_scripts\utility::flag( "broad_player_kill" ) )
        {
            level.player endon( "death" );
            magicbullet( "rpg_straight", level.player.origin + ( 0.0, 0.0, 8.0 ), level.player.origin + ( 0.0, 16.0, 6.0 ) );

            for (;;)
            {
                level.player dodamage( 10, level.player.origin );
                wait 0.1;
            }
        }
    }
}

_id_4612()
{
    thread _id_4614();
    var_0 = getentarray( "player_backtracked", "targetname" );
    common_scripts\utility::array_thread( var_0, ::_id_4613 );
}

_id_4613()
{
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "player_backtracked" );
    setdvar( "ui_deadquote", "@NY_MANHATTAN_FAIL_BACKTRACK" );
    maps\_utility::_id_1826();
}

_id_4614()
{
    level endon( "entering_hind" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "backtrack_warn" );
        maps\_utility::_id_1F61( "hint_backtrack" );
        common_scripts\utility::flag_waitopen( "backtrack_warn" );
        wait 0.05;
    }
}

_id_4615()
{
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    thread _id_4616();
    thread _id_4617();
}

_id_4616()
{
    common_scripts\utility::flag_wait( "broad_squad_moveup" );
    thread _id_4618();
    common_scripts\utility::flag_wait( "flashbang_start" );
    level notify( "stop_cinematic" );
    stopcinematicingame();
}

_id_4617()
{
    common_scripts\utility::flag_wait_either( "give_xm25", "skip_paw" );
    thread _id_4618();
    common_scripts\utility::flag_wait( "dialog_second_tier" );
    level notify( "stop_cinematic" );
    stopcinematicingame();
}

_id_4618()
{
    level endon( "stop_cinematic" );

    for (;;)
    {
        cinematicingameloopresident( "ny_manhattan_tvanamorphic" );
        wait 5;

        while ( iscinematicplaying() )
            wait 1;
    }
}
