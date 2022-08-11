// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7BE1()
{
    maps\_shg_common::move_player_to_start( "medic_player" );
    maps\_compass::setupminimap( "compass_map_prague_escape_standoff", "standoff_minimap_corner" );

    if ( !isdefined( level.player ) )
    {
        level.player = getentarray( "player", "classname" )[0];
        level.player._id_1032 = "player_rig";
    }

    level.player enableweapons();
    level.player giveweapon( "m4m203_reflex" );
    level.player switchtoweapon( "m4m203_reflex" );
    maps\prague_escape_code::_id_7A3B( "price", "medic" );
    maps\prague_escape_code::_id_7A3B( "soap", "medic" );
    var_0 = getent( "trig_player_bar_door", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "resistance_medic4", "targetname" );
    level._id_7BE2 = var_1 maps\_utility::_id_166F( 1 );
    var_2 = getent( "resistance_leader", "targetname" );
    level._id_7BE3 = var_2 maps\_utility::_id_166F( 1 );
    level._id_7BE3 maps\_utility::_id_104A( "ak74u", "primary" );
    _id_7BE7();
    _id_7BEF();
    thread _id_7BFC();
    _id_7BF1();
    _id_7BE6();
    level thread _id_7BF6();
    common_scripts\utility::flag_set( "soap_on_table" );
    maps\prague_escape_sniper::_id_7AE5();
    common_scripts\utility::flag_set( "queue_sniper_music" );
    common_scripts\utility::flag_set( "queue_player_carry_music" );
    common_scripts\utility::flag_set( "queue_price_carry_music" );
    common_scripts\utility::flag_set( "queue_defend_music" );
    common_scripts\utility::flag_set( "queue_soap_death_music" );
}

_id_7BE4()
{
    maps\_utility::_id_265A();
    thread _id_7C09();

    if ( level._id_1F19 != "medic" )
    {
        thread _id_7C0B();
        thread _id_7C0C();
    }

    thread _id_7C04();
    _id_7BF5();
}

_id_7BE5()
{
    common_scripts\utility::flag_init( "start_window_gun_fire" );
    common_scripts\utility::flag_init( "player_door_objective" );
    common_scripts\utility::flag_init( "soap_death_scene" );
    common_scripts\utility::flag_init( "start_convulsion_death" );
    common_scripts\utility::flag_init( "player_hit_controls" );
    common_scripts\utility::flag_init( "player_trigger_check" );
    common_scripts\utility::flag_init( "leader_wave_start" );
    common_scripts\utility::flag_init( "leader_wave_clear" );
    common_scripts\utility::flag_init( "FLAG_soap_death_started" );
    common_scripts\utility::flag_init( "spawn_alley_btrs" );
    common_scripts\utility::flag_init( "stop_price_nag_lines" );
    common_scripts\utility::flag_init( "soap_convulsion_needtoknow" );
    common_scripts\utility::flag_init( "soap_convulsion_knowsyuri" );
    common_scripts\utility::flag_init( "price_convulsion_waitingfor" );
    common_scripts\utility::flag_init( "price_convulsion_dialogue10" );
    common_scripts\utility::flag_init( "price_convulsion_soap2" );
    common_scripts\utility::flag_init( "price_slowdeath_tellmelater" );
    common_scripts\utility::flag_init( "soap_slowdeath_needtoknow" );
    common_scripts\utility::flag_init( "soap_slowdeath_knowsyuri" );
    common_scripts\utility::flag_init( "price_put_pressure_dialogue02" );
    common_scripts\utility::flag_init( "stop_pistol_slowmo" );
    common_scripts\utility::flag_init( "play_soap_heartbeat" );
    common_scripts\utility::flag_init( "fast_heartbeat" );
    common_scripts\utility::flag_init( "medium_heartbeat" );
    common_scripts\utility::flag_init( "dying_heartbeat" );
    common_scripts\utility::flag_init( "queue_soap_death_music" );
}

_id_7BE6()
{
    level._id_4877.ignoreme = 1;
    level._id_4877.ignoreall = 1;
    level._id_4877.goalradius = 32;
    level._id_4877 maps\_utility::_id_24F5();
    level._id_4877 maps\_utility::_id_104A( "ak47", "primary" );
    level._id_54E0.ignoreme = 1;
    level._id_54E0.ignoreall = 1;
    level._id_54E0 setcandamage( 0 );
}

_id_7BE7()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_1 = getent( "escape_door_punch", "targetname" );
    level._id_7BE8 = spawn( "script_model", var_1.origin );
    level._id_7BE8 setmodel( "tag_origin_animate" );
    level._id_7BE8.angles = var_1.angles;
    level._id_7BE8._id_1032 = "punch_door";
    level._id_7BE8 useanimtree( level._id_1245["punch_door"] );
    var_1.origin = level._id_7BE8 gettagorigin( "origin_animate_jnt" );
    var_1.angles = level._id_7BE8 gettagangles( "origin_animate_jnt" );
    var_1 linkto( level._id_7BE8, "origin_animate_jnt" );
    var_0 thread maps\_anim::_id_11CF( level._id_7BE8, "price_punch" );
    var_2 = getent( "price_pistol", "targetname" );
    var_3 = spawn( "script_model", var_2.origin );
    var_3.angles = var_2.angles;
    var_3 setmodel( "prop_journal" );
    var_2 delete();
    level._id_7BE9 = spawn( "script_model", var_3.origin );
    level._id_7BE9 setmodel( "tag_origin_animate" );
    level._id_7BE9.angles = var_3.angles;
    level._id_7BE9._id_1032 = "price_journal";
    level._id_7BE9 useanimtree( level._id_1245["price_journal"] );
    var_3.origin = level._id_7BE9 gettagorigin( "origin_animate_jnt" );
    var_3.angles = level._id_7BE9 gettagangles( "origin_animate_jnt" );
    var_3 linkto( level._id_7BE9, "origin_animate_jnt" );
}

_id_7BEA( var_0 )
{
    var_1 = _id_7BEE( "weapon_colt1911_black" );
    level._id_4877 waittill( "detach_pistol" );
    var_2 = level._id_4877 gettagorigin( "TAG_INHAND" );
    var_3 = level._id_4877 gettagangles( "TAG_INHAND" );
    var_1 unlink();
    var_1.origin = var_2;
    var_1.angles = var_3;
}

_id_7BEB( var_0 )
{
    level._id_4877 notify( "detach_pistol" );
}

_id_7BEC( var_0 )
{
    var_1 = _id_7BEE( "prop_journal" );
    level._id_4877 waittill( "delete_journal" );
    var_1 delete();
}

_id_7BED( var_0 )
{
    level._id_4877 notify( "delete_journal" );
}

_id_7BEE( var_0 )
{
    var_1 = level._id_4877 gettagorigin( "TAG_INHAND" );
    var_2 = level._id_4877 gettagangles( "TAG_INHAND" );
    var_3 = spawn( "script_model", var_1 );
    var_3.angles = var_2;
    var_3 setmodel( var_0 );
    var_3 linkto( level._id_4877, "TAG_INHAND" );
    return var_3;
}

_id_7BEF()
{
    var_0 = getent( "ai_resistance_leader", "targetname" );
    level._id_7BF0 = var_0 maps\_utility::_id_166F( 1 );
    level._id_7BF0._id_1032 = "resistance_leader";
    level._id_7BF0.ignoreme = 1;
    level._id_7BF0.ignoreall = 1;
    level._id_7BF0.goalradius = 32;
    level._id_7BF0 _id_00CC();
    var_0 delete();
}

_id_00CB()
{
    if ( _id_5F9E::_id_5F0A( "magic_bullet_shield", 1 ) )
        maps\_utility::_id_1902();
}

_id_00CC()
{
    if ( ( !isdefined( self._id_0D04 ) || !self._id_0D04 ) && !self.delayeddeath )
        maps\_utility::_id_2611();
}

_id_7BF1()
{
    level._id_7BF2 = level._id_7BE3;
    level._id_7BF3 = level._id_7BE2;
    level._id_7BF2._id_1032 = "resistance_guy1";
    level._id_7BF2.ignoreme = 1;
    level._id_7BF2.ignoreall = 1;
    level._id_7BF2._id_0D45 = maps\prague_escape_code::_id_7A5F;
    level._id_7BF3._id_1032 = "resistance_guy2";
    level._id_7BF3.ignoreme = 1;
    level._id_7BF3.ignoreall = 1;
}

_id_7BF4( var_0 )
{
    if ( var_0._id_1032 == "resistance_guy1" )
        var_0 dropweapon( "ak74u", "right", 0 );

    var_0.allowdeath = 1;
    var_0 kill();
}

_id_7BF5()
{
    level thread _id_7BFF();
    level thread _id_7C00();
    common_scripts\utility::flag_wait( "soap_death_scene" );
    wait 0.5;
    common_scripts\utility::flag_set( "start_window_gun_fire" );
}

_id_7BF6()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    level._id_7BF7 = [ level._id_54E0, level._id_4877, level._id_7BF0 ];
    common_scripts\utility::flag_wait( "soap_on_table" );
    musicstop( 5 );
    var_0 thread maps\_anim::_id_11D6( level._id_7BF7, "soap_death_idle" );
    var_1 = getent( "trig_medic_start", "targetname" );
    var_1 sethintstring( &"PRAGUE_ESCAPE_HINT_MEDIC_SOAP" );
    var_1 common_scripts\utility::trigger_on();
    var_1 waittill( "trigger" );
    var_1 delete();
    maps\prague_escape_code::_id_7A5D();
    level._id_54E0.name = " ";
    level._id_4877.name = " ";
    common_scripts\utility::flag_set( "stop_price_nag_lines" );
    common_scripts\utility::flag_set( "FLAG_soap_death_started" );
    var_0 notify( "stop_loop" );
    var_0 notify( "stop_death_idle" );
    level.player disableweapons();
    level.player enableinvulnerability();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player enabledeathshield( 1 );
    var_2 = maps\_utility::_id_1287( "player_rig", level.player.origin );
    var_2.angles = level.player getplayerangles();
    var_0 maps\_anim::_id_11CF( var_2, "soap_death" );
    var_2 hide();
    var_3 = 0.25;
    level.player playerlinktoblend( var_2, "tag_player", var_3, var_3 * 0.25, var_3 * 0.25 );
    wait(var_3);
    var_2 show();
    level.player playerlinktoabsolute( var_2, "tag_player" );
    level.player common_scripts\utility::delaycall( 4, ::playerlinktodelta, var_2, "tag_player", 0, 15, 15, 15, 15 );
    level thread _id_7BF8();
    level thread _id_7C0D();
    maps\_utility::delaythread( 3, ::_id_01FC );
    var_0 thread maps\_anim::_id_1246( var_2, "soap_death" );
    var_0 maps\_anim::_id_11DD( level._id_7BF7, "soap_death" );
    level notify( "soap_is_dead" );
    level thread _id_7BFE( "soap_dead" );
    var_0 notify( "stop_loop" );
    common_scripts\utility::flag_set( "soap_death_scene" );
    maps\_utility::_id_25EE( "spawn_alley_btrs", 1.35 );
    common_scripts\utility::flag_wait( "start_window_gun_fire" );
    var_2 delete();
    level.player unlink();
    level.player enableweapons();
    common_scripts\utility::flag_set( "player_door_objective" );
    level thread maps\_utility::_id_25F3( "cellar_escape" );
    maps\prague_escape_code::_id_7A5E();
    level._id_4877.name = "Price";
    level._id_54E0.team = "neutral";
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    var_4 = [ "presc_pri_yurimoveyour", "presc_pri_overherenow", "presc_pri_yurigetoverhere2" ];
    wait 15;
    thread _id_5F9E::_id_5EF4( level._id_4877, var_4, [ "player_opened_door" ], 8 );
}

_id_01FC()
{
    var_0 = 19;
    thread maps\_utility::_id_25EF( "play_soap_heartbeat", var_0 );
    thread maps\_utility::_id_25EF( "fast_heartbeat", var_0 * 0.5 );
    maps\_utility::_id_25EE( "dying_heartbeat", var_0 * 0.5 );
}

_id_7BF8()
{
    maps\_utility::_id_1428( "prague_escape_soap_death_end" );
}

_id_7BF9()
{
    var_0 = spawn( "script_origin", level.player.origin );
    level.player playerlinktoabsolute( var_0 );
    var_0 moveto( ( 26013, 19636, level.player.origin[2] ), 0.5 );
    wait 0.5;
    level.player unlink();
    level.player enableweapons();
}

_id_7BFA( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = 1;
    level._id_7BFB = [];

    while ( !common_scripts\utility::flag( var_1 ) )
    {
        wait 1;
        var_3++;

        if ( common_scripts\utility::flag( var_1 ) )
            return;

        if ( var_3 >= var_2 || var_4 )
        {
            var_4 = 0;
            var_5 = maps\_utility::_id_0B53( var_0 );
            var_6 = common_scripts\utility::random( var_5 );
            level._id_4877 thread maps\_utility::_id_168C( var_6 );
            var_3 = 0;
            level._id_7BFB = common_scripts\utility::add_to_array( level._id_7BFB, var_6 );
            var_0 = common_scripts\utility::array_remove( var_0, var_6 );

            if ( var_0.size == 0 )
            {
                var_0 = level._id_7BFB;
                level._id_7BFB = [];
            }
        }
    }
}

_id_7BFC( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        var_2 = spawnstruct();
        var_2.origin = var_1.origin;
        var_2.angles = var_1.angles;
    }
    else
        var_2 = var_0;

    common_scripts\utility::flag_wait( "start_window_gun_fire" );
    var_2 notify( "stop_loop" );
    var_2 maps\_anim::_id_124A( level._id_7BF0, "escape_shoot_loop" );
    var_2 thread maps\_anim::_id_124E( level._id_7BF0, "escape_shoot_loop" );
    level._id_7BF0 thread _id_7BFD();
    var_3 = getent( "player_danger_zone", "targetname" );
    var_3 waittill( "trigger" );
    var_4 = maps\_utility::_id_1BF9( "s_physics_pre_door", "targetname" );

    foreach ( var_6 in var_4 )
        physicsexplosionsphere( var_6.origin, 5, 5, 1 );

    level._id_7BF0 notify( "kill_leader_nag_lines" );
    common_scripts\utility::flag_wait( "leader_wave_set" );
    common_scripts\utility::flag_set( "leader_escape_dialogue04" );
    var_2 notify( "stop_loop" );
    var_2 maps\_anim::_id_1246( level._id_7BF0, "escape_wave" );
    var_2 thread maps\_anim::_id_124E( level._id_7BF0, "escape_shoot_loop" );
    common_scripts\utility::flag_wait( "price_punch_dialog_03" );
    var_2 notify( "stop_loop" );
    level._id_7BF0 _id_00CB();
    level._id_7BF0 delete();
}

_id_7BFD()
{
    self endon( "kill_leader_nag_lines" );
    self endon( "death" );
    maps\_utility::_id_168C( "presc_rl_getout" );
}

_id_7BFE( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_2 = spawnstruct();
    var_2.origin = var_1.origin;
    var_2.angles = var_1.angles;
    var_2 maps\_anim::_id_124E( level._id_54E0, var_0 );
    common_scripts\utility::flag_wait( "player_opened_door" );
    var_2 notify( "stop_loop" );
    level._id_54E0 maps\_utility::_id_1902();
    level._id_54E0 delete();
}

_id_7BFF()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    var_1 = spawnstruct();
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    common_scripts\utility::flag_wait( "soap_death_scene" );
    level._id_7BF2 maps\_utility::_id_1902();
    level._id_7BF3 maps\_utility::_id_1902();
    common_scripts\utility::flag_wait( "start_window_gun_fire" );
    var_0 notify( "stop_loop" );
    common_scripts\utility::flag_wait( "start_blood_fx" );
    playfxontag( level._effect["ai_blood_splash"], level._id_7BF2, "J_Spine4" );
}

_id_7C00()
{
    var_0 = common_scripts\utility::getstruct( "anim_align_soap_death", "targetname" );
    common_scripts\utility::flag_wait( "soap_death_scene" );
    var_1 = spawnstruct();
    var_1.origin = ( 25999.0, 19539.0, 32.0 );
    var_1.angles = var_0.angles;
    var_0 notify( "stop_loop" );
    var_1 maps\_anim::_id_124A( level._id_4877, "price_punch_loop" );
    var_1 thread maps\_anim::_id_124E( level._id_4877, "price_punch_loop" );
}

_id_7C01()
{
    var_0 = getent( "fxanim_prague2_blind01_mod", "targetname" );
    var_1 = getent( "fxanim_prague2_blind02_mod", "targetname" );
    var_2 = getent( "fxanim_prague2_blind03_mod", "targetname" );
    var_0 useanimtree( level._id_1245["script_model"] );
    var_1 useanimtree( level._id_1245["script_model"] );
    var_2 useanimtree( level._id_1245["script_model"] );
    var_0._id_1032 = "blind_01";
    var_1._id_1032 = "blind_02";
    var_2._id_1032 = "blind_03";
    var_0 thread _id_7C02();
    var_1 thread _id_7C02();
    var_2 thread _id_7C02();
}

_id_7C02()
{
    maps\_anim::_id_1246( self, "cellar_blinds" );
    thread maps\_anim::_id_124E( self, "cellar_blinds_idle" );
    common_scripts\utility::flag_wait( "player_opened_door" );
    wait 5.0;
    self notify( "stop_loop" );
    wait 0.05;
    self delete();
}

_id_7C03( var_0 )
{

}

_id_7C04()
{
    var_0 = getentarray( "alley_btrs", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::_id_7C08 );
    common_scripts\utility::flag_wait( "spawn_alley_btrs" );
    var_1 = getent( "trig_spawn_alley_btrs", "targetname" );
    var_1 notify( "trigger" );
    wait 2.5;
    level thread _id_7C06();
    level thread _id_7C01();
    common_scripts\utility::exploder( 1100 );
}

_id_7C05()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "stop_stair_rumble" );
    self vehicle_turnengineoff();
    common_scripts\utility::flag_wait( "begin_outro_anim" );
    self vehicle_turnengineon();
}

_id_7C06()
{
    level endon( "player_opened_door" );
    level.player endon( "death" );
    var_0 = getent( "player_danger_zone", "targetname" );
    level.player enableinvulnerability();
    level._id_2342 = 1;
    var_1 = 0;

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
        {
            _id_7C07();
            var_1 += 1;

            if ( var_1 >= 3 )
            {
                level.player disableinvulnerability();
                level.player kill();
            }

            wait 2.5;
            continue;
        }

        var_1 = 0;
        wait 0.05;
    }
}

_id_7C07()
{
    var_0 = getentarray( "warn_shot_starts", "script_noteworthy" );
    level.player disableinvulnerability();
    var_1 = randomintrange( 5, 8 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = maps\_utility::_id_0AE9( level.player.origin, var_0 );
        level.player dodamage( 10, var_3.origin );
        wait 0.1;
    }

    level.player enableinvulnerability();
}

_id_7C08()
{
    self endon( "death" );
    self vehicle_turnengineoff();
    self setcandamage( 0 );
    playfxontag( common_scripts\utility::getfx( "spotlight_btr80_daytime" ), self, "tag_turret_light" );
    playfxontag( common_scripts\utility::getfx( "spotlight_btr80_daytime" ), self, "TAG_FRONT_LIGHT_LEFT" );
    playfxontag( common_scripts\utility::getfx( "spotlight_btr80_daytime" ), self, "TAG_FRONT_LIGHT_RIGHT" );
    var_0 = self.mgturret[0];
    var_0._id_61B4 = 0.1;
    var_0._id_22A1 = 5;
    var_0 setmode( "manual" );
    var_0 notify( "stop_burst_fire_unmanned" );
    self waittill( "reached_end_node" );
    thread _id_7C05();
    var_0 thread maps\_mgturret::_id_2278();
    var_1 = [ getent( "btr_1_target_a", "targetname" ), getent( "btr_1_target_b", "targetname" ), getent( "btr_1_target_c", "targetname" ), getent( "btr_1_target_d", "targetname" ), getent( "btr_2_target_a", "targetname" ), getent( "btr_2_target_b", "targetname" ), getent( "btr_2_target_c", "targetname" ), getent( "btr_2_target_d", "targetname" ) ];

    while ( !common_scripts\utility::flag( "kill_window_bullets" ) )
    {
        var_2 = common_scripts\utility::ter_op( self.script_noteworthy == "vh_alley_btr_1", randomintrange( 0, 4 ), randomintrange( 4, 8 ) );
        var_3 = var_1[var_2];

        if ( isdefined( var_3 ) )
        {
            var_0 settargetentity( var_3 );
            self setturrettargetent( var_3 );

            if ( common_scripts\utility::cointoss() )
                self setturrettargetent( var_3, ( randomintrange( -50, 50 ), 0, randomintrange( -30, 30 ) ) );
        }

        var_0 startfiring();
        var_4 = randomintrange( 20, 40 );

        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            self fireweapon();
            wait 0.5;
        }

        var_0 stopfiring();
        wait(randomfloatrange( 0.5, 1.0 ));
    }
}

_id_7C09()
{
    common_scripts\utility::flag_wait( "soap_on_table" );
    var_0 = getent( "e_save_soap_obj", "targetname" );
    objective_position( level._id_7A43, var_0.origin );
    objective_setpointertextoverride( level._id_7A43, &"PRAGUE_ESCAPE_HELP_SOAP" );
    common_scripts\utility::flag_wait( "soap_death_scene" );
    common_scripts\utility::flag_wait( "player_door_objective" );

    if ( isdefined( level._id_7B09 ) )
        objective_state_nomessage( level._id_7B09, "done" );

    if ( isdefined( level._id_7B89 ) )
        objective_state_nomessage( level._id_7B89, "done" );

    var_1 = getent( "e_door_objective", "targetname" );
    level._id_7C0A = maps\prague_escape_code::_id_7A42( &"PRAGUE_ESCAPE_OPEN_DOOR", 1, 1, var_1.origin );
    common_scripts\utility::flag_wait( "player_opened_door" );
    objective_state( level._id_7C0A, "done" );
}

_id_7C0B()
{
    common_scripts\utility::flag_wait( "soap_on_table" );
    var_0 = getent( "soap_death_mission_fail_trigger", "targetname" );
    var_1 = 20;

    for ( var_2 = 0; !level.player istouching( var_0 ) && var_2 < var_1; var_2 += 0.05 )
        wait 0.05;

    if ( var_2 >= var_1 && !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        setdvar( "ui_deadquote", &"PRAGUE_ESCAPE_HELP_SOAP" );
        level notify( "mission failed" );
        maps\_utility::_id_1826();
    }
}

_id_7C0C()
{
    common_scripts\utility::flag_wait( "soap_on_table" );
    var_0 = getent( "soap_death_mission_fail_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level.player )
            break;
    }

    var_2 = 20;

    for ( var_3 = 0; !common_scripts\utility::flag( "FLAG_soap_death_started" ) && var_3 < var_2; var_3 += 0.05 )
        wait 0.05;

    if ( !common_scripts\utility::flag( "FLAG_soap_death_started" ) )
    {
        setdvar( "ui_deadquote", &"PRAGUE_ESCAPE_HELP_SOAP" );
        level notify( "mission failed" );
        maps\_utility::_id_1826();
    }
}

_id_7C0D()
{
    level endon( "soap_is_dead" );
    common_scripts\utility::flag_set( "play_soap_heartbeat" );
    common_scripts\utility::flag_set( "fast_heartbeat" );
    var_0 = 0;

    while ( common_scripts\utility::flag( "play_soap_heartbeat" ) )
    {
        if ( common_scripts\utility::flag( "fast_heartbeat" ) )
        {
            level.player playrumbleonentity( "damage_light" );
            wait 0.4;
            wait(0 + randomfloat( 0.1 ));
        }

        if ( common_scripts\utility::flag( "dying_heartbeat" ) )
        {
            wait 0.05;
            level.player playrumbleonentity( "damage_light" );
            wait 0.8;
            wait(0 + randomfloat( 0.1 ) + ( var_0 + 0.1 ));
        }
    }
}

_id_7C0E( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_donttrytospeak" );
    common_scripts\utility::flag_wait( "price_slowdeath_tellmelater" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_tellmelater" );
    common_scripts\utility::flag_wait( "price_slowdeath_soap2" );
    level._id_4877 maps\_utility::_id_168C( "presc_pri_soap2" );
}

_id_7C0F( var_0 )
{
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_price2" );
    common_scripts\utility::flag_wait( "soap_slowdeath_needtoknow" );
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_needtoknow" );
    common_scripts\utility::flag_clear( "fast_heartbeat" );
    common_scripts\utility::flag_set( "dying_heartbeat" );
    common_scripts\utility::flag_wait( "soap_slowdeath_knowsyuri" );
    level._id_54E0 maps\_utility::_id_168C( "presc_mct_knowsyuri" );
    wait 4.65;
    common_scripts\utility::flag_set( "spawn_alley_btrs" );
}

_id_7C10( var_0 )
{
    level._id_4877 maps\_utility::_id_168C( "presc_pri_yurigetoverhere" );
}
