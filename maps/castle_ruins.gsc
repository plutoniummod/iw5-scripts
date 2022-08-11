// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_811C()
{
    maps\_shg_common::move_player_to_start( "start_ruins" );
    maps\castle_code::_id_8094( "start_ruins" );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
    maps\castle_code::_id_8100( "startvista", 1 );
}

_id_64AB()
{
    maps\_utility::_id_27CB( "ruins_patroller3", ::_id_812D, "ruins_first_patrol_flash", ::_id_812A, "ruin_patrol_goal_0", "ruins_first_patrol_fighting" );
    maps\_utility::_id_27CB( "ruins_patroller4", ::_id_812D, "ruins_first_patrol_flash", ::_id_812B, "ruin_patrol_goal_1", "ruins_first_patrol_fighting" );
    maps\_utility::_id_27CB( "ruins_patroller1", ::_id_812D, "ruins_seconds_patrol_go", ::_id_812C, "ruin_patrol_goal_2", "ruins_second_patrol_fighting" );
    maps\_utility::_id_27CB( "ruins_patroller2", ::_id_812D, "ruins_seconds_patrol_go", ::_id_812C, "ruin_patrol_goal_3", "ruins_second_patrol_fighting" );
}

_id_811D()
{
    level._id_014E = 0;
    level._id_014F = [];
    level._id_014F[0] = "castle_pri_lightemup";
    level._id_014F[1] = "castle_pri_compromised";
    thread _id_8137();
    thread _id_811E();
    thread _id_811F();
    maps\castle_code::_id_5296( ::_id_8120 );
    thread maps\castle_courtyard_activity::_id_810D( level._id_4877 );
    level thread _id_8129();
    level thread _id_8135();
    maps\_utility::_id_265A( "allies" );
    common_scripts\utility::flag_wait( "spawn_courtyard_activity" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "ruins_alerted" );
    common_scripts\utility::flag_init( "ruins_done" );
    common_scripts\utility::flag_init( "ruins_seconds_patrol_go" );
    common_scripts\utility::flag_init( "ruins_first_patrol_flash" );
    common_scripts\utility::flag_init( "ruins_first_patrol_go" );
    common_scripts\utility::flag_init( "ruins_flash_patrol_moving" );
    common_scripts\utility::flag_init( "ruins_price_free" );
    common_scripts\utility::flag_init( "ruins_first_patrol_fighting" );
    common_scripts\utility::flag_init( "ruins_second_patrol_fighting" );
    common_scripts\utility::flag_init( "continue_past_patrol" );
    common_scripts\utility::flag_init( "ruins_failed" );
}

_id_811E()
{
    var_0 = maps\_utility::_id_272C( "ruins_patrol_spawners", 1 );

    foreach ( var_2 in var_0 )
        var_2 thread _id_0226();

    thread _id_0229();
    maps\_utility::_id_2636( var_0, var_0.size );
    common_scripts\utility::flag_set( "ruins_price_free" );
    level._id_4877 notify( "stop_animating" );
}

_id_0226()
{
    if ( isdefined( self._id_1032 ) && self._id_1032 == "ruins_patroller4" )
        level._id_0227 = self;

    if ( isdefined( self._id_1032 ) && self._id_1032 == "ruins_patroller3" )
        level._id_0228 = self;

    common_scripts\utility::waittill_either( "damage", "death" );
    level notify( "stop_ruins_patrol_conv" );
}

_id_0229()
{
    level endon( "_stealth_spotted" );
    level endon( "stop_ruins_patrol_conv" );
    level waittill( "start_ruins_patrol_conv" );
    level._id_0227 maps\_utility::_id_168C( "castle_ru1_howslife" );
    wait 0.5;
    level._id_0228 maps\_utility::_id_168C( "castle_ru2_colddark" );
    wait 0.5;
    level._id_0227 maps\_utility::_id_168C( "castle_ru1_lovelife" );
    wait 0.5;
    level._id_0228 maps\_utility::_id_168C( "castle_ru2_veryfunny" );
}

_id_811F()
{
    level endon( "death" );
    common_scripts\utility::flag_wait( "ruins_seconds_patrol_go" );
    var_0 = maps\_utility::_id_272C( "ruins_patrol_spawners2", 1 );
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_wait3" );
    maps\_utility::_id_2636( var_0, var_0.size, 15 );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        common_scripts\utility::flag_set( "continue_past_patrol" );
}

_id_8120()
{
    thread maps\castle_code::_id_8093();
    thread _id_80D4();
}

_id_8121( var_0 )
{
    var_0._id_8122 hide();
}

_id_80D4()
{
    var_0 = maps\castle_code::_id_7A41( "ruins_middle" );
    self._id_8122 = maps\_utility::_id_1287( "price_pistol" );
    var_1 = maps\_utility::_id_2766( self, self._id_8122 );
    common_scripts\utility::waitframe();
    var_0 maps\_anim::_id_11DD( var_1, "ruins_start" );
    var_0 maps\_anim::_id_11DD( var_1, "ruins_talk" );
    self._id_8122 delete();
    level._id_8123 = 0;
    thread _id_8128( var_0 );
    common_scripts\utility::flag_set( "ruins_first_patrol_flash" );
    thread _id_8124();
    thread _id_8125();
    self endon( "death" );
    self endon( "stop_animating" );
    level endon( "player_shot" );
    level endon( "ruins_alerted" );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "ruins_first_patrol_go" );
    var_0 maps\_anim::_id_1246( self, "ruins_run_to_cover" );
    common_scripts\utility::flag_set( "ruins_first_patrol_go" );

    if ( !common_scripts\utility::flag( "ruins_alerted" ) )
        var_0 maps\_anim::_id_1246( self, "ruins_cover_hide" );

    if ( !common_scripts\utility::flag( "ruins_movement_1" ) && !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        thread maps\castle_code::_id_8105( 5, "ruins_movement_1" );
        var_0 thread maps\_anim::_id_124E( self, "ruins_cover_wait" );
        common_scripts\utility::flag_wait( "ruins_movement_1" );
        var_0 notify( "stop_loop" );
    }

    maps\castle_code::_id_80A3( "ruins_half_way" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level._id_4877 maps\_utility::delaythread( 1, maps\_utility::_id_168C, "castle_pri_move3" );
        var_0 thread maps\_anim::_id_1246( self, "ruins_run_to_patrol" );

        while ( self getanimtime( maps\_utility::_id_1281( "ruins_run_to_patrol" ) ) < 0.55 )
            wait 0.05;

        self.a._id_0D26 = "crouch";
        maps\_utility::_id_1414();
        maps\_utility::_id_109B();
        maps\_utility::_id_2686();
        common_scripts\utility::flag_set( "ruins_price_free" );
        maps\_utility::_id_2703( "soap_to_2nd_wall", "targetname" );
    }

    thread maps\castle_code::_id_8105( 9, "ruins_seconds_patrol_go" );
}

_id_8124()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    level endon( "player_shot" );
    common_scripts\utility::flag_wait( "ruins_first_patrol_go" );
    maps\_utility::_id_168C( "castle_pri_getdown" );
    wait 2;
    maps\_utility::_id_168C( "castle_pri_beforestarted" );
}

_id_8125()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "continue_past_patrol" );
    common_scripts\utility::flag_set( "spawn_courtyard_activity" );
    var_0 = maps\_utility::_id_263E( "ruins_patrol" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::_id_263E( "ruins_patrol2" ) );

    if ( var_0.size > 0 && common_scripts\utility::flag( "_stealth_spotted" ) )
        thread _id_8134();
    else
        thread maps\_utility::_id_168C( "castle_pri_thisway3" );

    common_scripts\utility::flag_set( "ruins_done" );
    level notify( "ruins_done" );
}

_id_8126()
{
    common_scripts\utility::waittill_any( "weapon_fired", "grenade_fire" );
    level notify( "player_shot" );
}

_id_8127()
{
    level endon( "ruins_break_stealth_stop" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "ruins_price_free" );
    wait 1;
    level._id_4877 thread maps\_utility::_id_168C( "castle_pri_spotted" );
}

_id_80E6()
{
    var_0 = undefined;
    level._id_4877 waittill( "death", var_1 );

    if ( isplayer( var_1 ) )
        var_0 = &"SCRIPT_MISSIONFAIL_KILLTEAM_BRITISH";
    else
        var_0 = &"CASTLE_YOUR_ACTIONS_GOT_PRICE";

    wait 2;
    setdvar( "ui_deadquote", var_0 );
    maps\_utility::_id_1826();
}

_id_8128( var_0 )
{
    level endon( "ruins_done" );
    self endon( "death" );
    level common_scripts\utility::waittill_any( "_stealth_spotted", "player_shot", "ruins_alerted" );
    var_1 = [];
    var_1[0] = "castle_pri_nexttime";
    var_1[1] = "castle_pri_mistakes";
    level._id_4877 maps\_utility::_id_168C( level._id_014F[level._id_014E] );
    level._id_014E++;

    if ( level._id_014E > level._id_014F.size )
        level._id_014E = 0;

    common_scripts\utility::flag_set( "ruins_alerted" );
    level notify( "ruins_alerted" );
    self.a._id_0D26 = "crouch";
    maps\_utility::_id_1414();
    var_0 notify( "stop_loop" );
    self.pacifist = 0;
    common_scripts\utility::flag_set( "ruins_price_free" );
    level._id_4877._id_20AF = 5000000;
    var_2 = undefined;

    for (;;)
    {
        var_3 = maps\_utility::_id_263E( "ruins_patrol" );
        var_3 = common_scripts\utility::array_combine( var_3, maps\_utility::_id_263E( "ruins_patrol2" ) );

        if ( var_3.size <= 0 )
            break;

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5.enemy ) || !var_5 maps\_utility::_id_1008( "_stealth_normal" ) )
            {
                var_2 = var_5 maps\_stealth_utility::_id_4215();
                var_5._id_0FA0 = undefined;
                var_5.threatbias = 5000;

                if ( !isalive( level._id_4877.enemy ) )
                    level._id_4877.favoriteenemy = var_5;

                var_5.health = 1;
            }
        }

        wait 0.5;
    }

    level._id_4877 maps\_utility::delaythread( 1.5, maps\_utility::_id_168C, var_1[level._id_8123] );
    level._id_8123++;

    if ( !common_scripts\utility::flag( "ruins_failed" ) )
    {
        level.player maps\_utility::_id_13DC( "_stealth_enabled" );
        common_scripts\utility::flag_set( "_stealth_enabled" );
        thread maps\_stealth_visibility_system::_id_42E8( "hidden" );

        if ( isdefined( var_2 ) )
            common_scripts\utility::flag_clear( var_2 );

        common_scripts\utility::flag_clear( "ruins_alerted" );
        common_scripts\utility::flag_clear( "_stealth_spotted" );
        self.pacifist = 1;
        level._id_4877._id_20AF = 1;

        if ( maps\_utility::_id_263C( "ruins_patrol2" ) > 0 )
            thread _id_8128( var_0 );
        else
        {
            common_scripts\utility::flag_set( "spawn_courtyard_activity" );
            common_scripts\utility::flag_set( "continue_past_patrol" );
            common_scripts\utility::flag_set( "ruins_done" );
        }
    }
}

_id_8129()
{
    maps\castle_code::_id_80A0( 5 );
    maps\castle_code::_id_80A2( 3, 6 );
}

_id_812A()
{
    thread _id_8132();
}

_id_812B()
{

}

_id_812C()
{
    thread maps\castle_code::_id_77E6( 1 );
}

_id_812D( var_0, var_1, var_2, var_3 )
{
    self endon( "stealth_enemy_endon_alert" );
    self endon( "death" );
    self._id_1032 = self.script_noteworthy;
    var_4 = maps\castle_code::_id_7A41( "ruins_middle" );
    var_4 maps\_anim::_id_11CF( self, "ruins_patrol" );
    common_scripts\utility::flag_wait( var_0 );
    _id_812E( var_3 );

    if ( isdefined( var_1 ) )
        self [[ var_1 ]]();

    var_4 thread maps\castle_code::_id_80B1( self, "ruins_patrol" );

    if ( self._id_1032 == "ruins_patroller1" || self._id_1032 == "ruins_patroller2" )
    {
        common_scripts\utility::waitframe();
        self setanimtime( level._id_0C59[self._id_1032]["ruins_patrol"], 0.25 );
    }

    self waittillmatch( "single anim", "end" );

    if ( self._id_1032 == "ruins_patroller3" )
    {
        level notify( "cheap_light" );
        level notify( "start_ruins_patrol_conv" );
    }

    thread maps\_patrol::_id_204E( var_2 );
    common_scripts\utility::flag_wait( "stealth_player_in_motorpool" );
    self delete();
}

_id_812E( var_0 )
{
    thread _id_812F( var_0 );
    thread maps\_stealth_utility::_id_4321();
}

_id_812F( var_0 )
{
    self endon( "death" );
    common_scripts\utility::waittill_any( "flashbang", "explode", "grenade danger" );
    wait 1.5;

    if ( isalive( self ) )
    {
        common_scripts\utility::flag_set( var_0 );
        common_scripts\utility::flag_set( "ruins_alerted" );
        level notify( "ruins_alerted" );
        maps\_utility::_id_1414();
    }
}

_id_8130( var_0 )
{
    common_scripts\utility::flag_set( "ruins_seconds_patrol_go" );
}

_id_8131( var_0 )
{
    iprintlnbold( "flash!" );
}

_id_8132()
{
    self endon( "death" );
    maps\castle_code::_id_77E6( 0 );
    thread maps\castle_courtyard_stealth::_id_80F5( "tag_flash", 0.98 );
    thread _id_8133();
    level common_scripts\utility::waittill_any( "cheap_light" );
    maps\castle_code::_id_77E6( 1 );
}

_id_8133()
{
    self endon( "death" );
    level common_scripts\utility::waittill_any( "_stealth_spotted", "ruins_alerted" );
    self getenemyinfo( level.player );
    self waittill( "death" );
    level notify( "cheap_light" );
}

_id_8134()
{
    common_scripts\utility::flag_set( "ruins_failed" );
    level._id_4877._id_20AF = 0.3;
    level._id_4877 maps\_utility::_id_2713();
    level._id_4877 maps\_utility::_id_123B();
    var_0 = getnode( "price_fail_location", "targetname" );
    level._id_4877 maps\_utility::_id_2718();
    level._id_4877 setgoalnode( var_0 );
    var_1 = getent( "ruins_fail", "targetname" );

    while ( var_1.count > 0 )
    {
        var_2 = var_1 maps\_utility::_id_166F();
        common_scripts\utility::waitframe();

        if ( isdefined( var_2 ) && isalive( level._id_4877 ) )
        {
            var_2 getenemyinfo( level.player );
            var_2 getenemyinfo( level._id_4877 );
            var_2 setgoalentity( level._id_4877 );
        }

        wait 1;
    }
}

_id_8135()
{
    level endon( "start_stealth_guard_patroll" );
    var_0 = getent( "alert_trigger_for_overlook", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_596C( var_0, var_1, var_2, var_3 )
{
    maps\_utility::_id_2636( var_0, var_1, var_3 );
    common_scripts\utility::flag_set( var_2 );
}

_id_8136( var_0 )
{
    _id_596C( var_0, var_0.count, "first_patrol_dead" );
}

_id_8137()
{
    while ( !common_scripts\utility::flag( "stealth_player_in_motorpool" ) )
    {
        common_scripts\utility::flag_wait( "price_mud" );
        animscripts\utility::_id_24BB( "mud", level._effect["castle_wet_footstep"] );
        animscripts\utility::_id_24BC( "mud", level._effect["castle_wet_footstep"] );
        common_scripts\utility::flag_waitopen( "price_mud" );
        _id_8138( "mud" );
        _id_8139( "mud" );
    }
}

_id_8138( var_0 )
{
    if ( isdefined( anim._id_20D1 ) )
    {
        var_1 = maps\_shg_common::_id_168F( anim._id_20D1, var_0 );

        if ( isdefined( var_1 ) )
            anim._id_20D1 = maps\_utility::array_remove_index( anim._id_20D1, var_1 );
    }

    level._effect["step_" + var_0] = undefined;
}

_id_8139( var_0 )
{
    if ( isdefined( anim._id_20D2 ) )
    {
        var_1 = maps\_shg_common::_id_168F( anim._id_20D2, var_0 );

        if ( isdefined( var_1 ) )
            anim._id_20D2 = maps\_utility::array_remove_index( anim._id_20D2, var_1 );
    }

    level._effect["step_small_" + var_0] = undefined;
}
