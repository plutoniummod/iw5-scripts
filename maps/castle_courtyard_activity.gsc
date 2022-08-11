// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

start()
{
    common_scripts\utility::flag_set( "ruins_done" );
    maps\castle_code::_id_8094( "start_courtyard_activity", maps\castle_code::_id_8093 );
    maps\_shg_common::move_player_to_start( "start_courtyard_activity" );
    thread _id_810D( level._id_4877 );
    maps\_utility::vision_set_fog_changes( "castle_exterior", 0 );
    maps\castle_code::_id_8100( "startvista", 1 );
}

main()
{
    common_scripts\utility::flag_wait( "ruins_done" );
    level thread _id_811B();
    maps\_vehicle::_id_2A98( "courtyard_stealth_btr1" );
    var_0 = maps\_utility::_id_272C( "courtyard_stealth_guys", 1 );
    maps\_utility::_id_272C( "courtyard_activity_guys", 1 );
    var_0 thread _id_8101();
    maps\castle_code::_id_5296( ::_id_8104 );
    maps\castle_code::_id_80A1( 3, 10 );
    maps\castle_code::_id_80A2( 3, 6 );
    level thread _id_8111();
    _id_8095();
    thread _id_810F();
    maps\_utility::_id_265A( "allies" );
}

_id_8101()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self.size; var_1++ )
    {
        if ( isdefined( self[var_1].script_noteworthy ) && self[var_1].script_noteworthy == "overlook_intro_guard" )
        {
            self[var_1] thread maps\castle_code::_id_80A9();
            var_0[var_0.size] = self[var_1];
            self[var_1] thread maps\castle_code::_id_77E6( 1 );
        }
    }

    if ( var_0.size == 2 )
    {
        var_0[0] thread _id_8102( var_0[1] );
        var_0[1] thread _id_8102( var_0[0] );
    }
}

_id_8102( var_0 )
{
    level endon( "start_stealth_guard_patroll" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::waittill_any( "death", "friend_died" );
    var_0 notify( "friend_died" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

_id_7AA9()
{
    common_scripts\utility::flag_init( "player_at_overlook" );
    common_scripts\utility::flag_init( "do_courtyard_activity" );
    common_scripts\utility::flag_init( "do_btr_lift" );
    common_scripts\utility::flag_init( "stadium_lights_on" );
    common_scripts\utility::flag_init( "btr_dropped" );
    common_scripts\utility::flag_init( "courtyard_activity_done" );
    common_scripts\utility::flag_init( "price_going_in" );
    common_scripts\utility::flag_init( "motorpool_guard1_patrol_start" );
}

_id_8103( var_0 )
{
    level endon( "_stealth_spotted" );
    var_1 = getnode( "price_overlook_pos", "targetname" );
    level._id_4877.pacifist = 1;
    level._id_4877.ignoreme = 1;
    var_2 = level._id_4877.goalradius;
    level._id_4877 maps\_utility::_id_2712();
    level._id_4877 maps\_utility::_id_123B();
    var_0 maps\_anim::_id_124A( level._id_4877, "approach_overlook" );
    var_0 maps\_anim::_id_1246( level._id_4877, "approach_overlook" );
    level._id_4877 maps\_utility::_id_2713();
    level._id_4877 maps\_utility::_id_2724( var_2 );
}

_id_8104()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "ruins_failed" ) )
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );

    common_scripts\utility::flag_wait( "ruins_done" );
    var_0 = maps\castle_code::_id_7A41( "anim_align_dropdown" );
    _id_8103( var_0 );
    common_scripts\utility::exploder( 50 );
    maps\castle_code::_id_80A0( 5 );
    thread maps\castle_code::_id_8105( 7, "player_at_overlook" );
    _id_8106( var_0 );
    common_scripts\utility::flag_set( "player_at_overlook" );
    common_scripts\utility::flag_set( "do_btr_lift" );
    common_scripts\utility::flag_set( "do_courtyard_activity" );
    var_0 thread maps\_anim::_id_1246( self, "security_office_talk" );
    common_scripts\utility::waitframe();
    self setanimtime( maps\_utility::_id_1281( "security_office_talk" ), 0.65 );
    self waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_set( "price_going_in" );
    maps\_utility::_id_261A( 50 );
    var_0 maps\_anim::_id_1246( self, "jump_down" );
    thread maps\castle_code::_id_8105( 5, "stealth_player_in_motorpool" );
    common_scripts\utility::flag_set( "courtyard_activity_done" );
}

_id_8106( var_0 )
{
    self endon( "death" );
    var_1 = 200;

    if ( !maps\_utility::_id_2755( var_1, self.origin ) )
    {
        var_0 thread maps\_anim::_id_124E( self, "do_not_engage" );

        while ( !maps\_utility::_id_2755( var_1, self.origin ) )
            common_scripts\utility::waitframe();

        var_0 notify( "stop_loop" );
    }

    maps\castle_code::_id_80A3( "price_overlook" );
}

_id_8108()
{
    var_0 = getent( "overlook_player_clip", "targetname" );
    var_0 notsolid();
}

_id_8109()
{
    var_0 = getent( "overlook_player_clip", "targetname" );
    var_0 solid();
}

_id_810A()
{
    var_0 = getent( "overlook_player_clip", "targetname" );
    var_0 delete();
}

_id_810B()
{
    common_scripts\utility::flag_set( "display_nvg_on_hint" );
    common_scripts\utility::flag_wait_or_timeout( "nvg_on", 15 );
    wait 2;
}

_id_810C()
{
    common_scripts\utility::flag_set( "display_nvg_off_hint" );
    common_scripts\utility::flag_waitopen_or_timeout( "nvg_on", 5 );
}

_id_810D( var_0 )
{
    level endon( "security_office_closed" );
    common_scripts\utility::flag_set( "stadium_lights_on" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "nvg_on" ) )
        {
            wait 0.9;
            common_scripts\utility::exploder( 504 );
            common_scripts\utility::exploder( 505 );
            common_scripts\utility::exploder( 506 );
            maps\_utility::_id_261A( 501 );
            maps\_utility::_id_261A( 502 );
            maps\_utility::_id_261A( 503 );
        }
        else
        {
            wait 0.5;
            common_scripts\utility::exploder( 501 );
            common_scripts\utility::exploder( 502 );
            common_scripts\utility::exploder( 503 );
            maps\_utility::_id_261A( 504 );
            maps\_utility::_id_261A( 505 );
            maps\_utility::_id_261A( 506 );
        }

        level.player common_scripts\utility::waittill_either( "night_vision_on", "night_vision_off" );
        waittillframeend;
    }
}

_id_8095()
{
    maps\castle_code::_id_810E( "activity_initial_group2_guard1", "script_noteworthy", ::_id_8116, "player_approaches_overlook" );
    maps\castle_code::_id_810E( "activity_initial_group2_guard2", "script_noteworthy", ::_id_8116, "player_approaches_overlook" );
    maps\castle_code::_id_810E( "activity_initial_group2_guard3", "script_noteworthy", ::_id_8116, "player_approaches_overlook" );
    maps\castle_code::_id_810E( "btr_lift_guard1", "script_noteworthy", ::_id_8114 );
    maps\castle_code::_id_810E( "btr_lift_guard2", "script_noteworthy", ::_id_8114 );
    maps\castle_code::_id_810E( "btr_lift_guard3", "script_noteworthy", ::_id_8114 );
    maps\castle_code::_id_810E( "btr_lift_guard4", "script_noteworthy", ::_id_8114 );
    maps\castle_code::_id_810E( "btr_lift_guard5", "script_noteworthy", ::_id_8114 );
    maps\castle_code::_id_810E( "activity_group2_guard1", "script_noteworthy", maps\castle_courtyard_stealth::_id_80AB );
    maps\castle_code::_id_810E( "activity_group2_guard2", "script_noteworthy", maps\castle_courtyard_stealth::_id_80AB );
    maps\castle_code::_id_810E( "activity_group2_guard3", "script_noteworthy", maps\castle_courtyard_stealth::_id_80A8 );
    maps\castle_code::_id_810E( "activity_group2_guard_walker1", "script_noteworthy", ::_id_8117 );
    maps\castle_code::_id_810E( "activity_group2_guard_walker2", "script_noteworthy", ::_id_8117 );
    maps\castle_code::_id_810E( "activity_group3_guard1", "script_noteworthy", ::_id_8116, "do_courtyard_activity" );
    maps\castle_code::_id_810E( "activity_group3_guard2", "script_noteworthy", ::_id_8116, "do_courtyard_activity" );
}

_id_810F()
{
    common_scripts\utility::flag_wait( "stealth_player_in_motorpool" );
    _id_8110( "activity_initial_group2_guard2" );
    _id_8110( "activity_initial_group2_guard3" );
    _id_8110( "activity_group2_guard_walker1" );
    _id_8110( "activity_group2_guard_walker2" );
}

_id_8110( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) )
            var_3 delete();
    }
}

_id_8111()
{
    var_0 = maps\castle_code::_id_7A41( "anim_align_helipad" );
    var_1 = maps\_vehicle::_id_2A98( "courtyard_helicopter" )[0];
    var_1._id_1032 = "btr_helicopter";
    var_2 = maps\_vehicle::_id_2A98( "courtyard_stealth_btr2" )[0];
    var_2._id_1032 = "btr";
    var_2 vehicle_turnengineoff();
    var_3 = maps\_utility::_id_1287( "btr_rope" );
    var_0 maps\_anim::_id_11BF( maps\_utility::_id_2766( var_1, var_2, var_3 ), "btr_lift" );
    common_scripts\utility::flag_wait( "do_btr_lift" );
    var_1 thread _id_8112();
    var_1 thread _id_8113();
    common_scripts\utility::exploder( 520 );
    maps\_utility::delaythread( 15, common_scripts\utility::flag_set, "btr_dropped" );
    maps\_audio::aud_send_msg( "btr_sequence_start" );
    var_0 thread maps\_anim::_id_11DD( maps\_utility::_id_2766( var_1, var_2, var_3 ), "btr_lift" );
    wait 16;
    common_scripts\utility::exploder( 350 );
    wait 20;
    maps\_utility::_id_261A( 350 );
    wait 15;
    maps\_utility::_id_135B( maps\_utility::_id_2766( var_1, var_3 ) );
}

_id_8112()
{
    self endon( "death" );

    while ( isdefined( self ) )
    {
        playfxontag( level._effect["rotor_rain_effect"], self, "origin_animate_jnt" );
        wait 0.1;
    }
}

_id_8113()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    self waittill( "damage" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
}
#using_animtree("generic_human");

_id_8114()
{
    self._id_1032 = self.script_noteworthy;
    thread maps\castle_code::_id_80A9();
    var_0 = maps\castle_code::_id_7A41( "anim_align_helipad" );

    if ( level._id_1F19 != "platform_crawl" && level._id_1F19 != "security_office" )
    {
        var_0 maps\_anim::_id_11CF( self, "courtyard_activity_runup" );
        self hide();
        common_scripts\utility::flag_wait( "do_btr_lift" );
        self endon( "death" );
        self endon( "bulletwhizby" );
        self endon( "flashbang" );
        self endon( "grenade danger" );
        self endon( "explode" );
        self endon( "stealth_enemy_endon_alert" );
        self endon( "damage" );
        level endon( "_stealth_spotted" );
        self show();
        self.allowpain = 1;
        var_0 maps\castle_code::_id_80B1( self, "courtyard_activity_runup" );
        self clearanim( %root, 0 );
        var_0 maps\castle_code::_id_80B1( self, "courtyard_activity" );
    }

    if ( isdefined( self._id_8115 ) && self._id_8115 == 1 )
        return;

    if ( isdefined( self._id_164F ) && self._id_164F == "delete" )
        self delete();
    else
    {
        self setgoalpos( self.origin );
        var_0 maps\castle_code::_id_80AA( self, "courtyard_activity_idle" );
        return;
    }
}

_id_8116( var_0 )
{
    self._id_1032 = self.script_noteworthy;
    thread maps\castle_code::_id_80A9();

    if ( isdefined( self._id_1032 ) )
        self._id_0EC6 = 1;

    var_1 = maps\castle_code::_id_7A41( "anim_align_helipad" );

    if ( level._id_1F19 != "platform_crawl" && level._id_1F19 != "security_office" )
    {
        var_1 maps\_anim::_id_11CF( self, "courtyard_activity" );
        self hide();

        if ( isdefined( var_0 ) )
            common_scripts\utility::flag_wait( var_0 );

        self endon( "death" );
        self endon( "stealth_enemy_endon_alert" );
        self endon( "bulletwhizby" );
        self endon( "flashbang" );
        self endon( "grenade danger" );
        self endon( "explode" );
        self endon( "damage" );
        level endon( "_stealth_spotted" );
        self show();
        var_1 maps\castle_code::_id_80B1( self, "courtyard_activity" );
    }

    if ( isdefined( self._id_8115 ) && self._id_8115 == 1 )
        return;

    if ( isdefined( self._id_164F ) && self._id_164F == "delete" )
        self delete();
    else
    {
        self setgoalpos( self.origin );

        if ( isdefined( level._id_0C59[self._id_1032]["courtyard_activity_idle"] ) )
            var_1 maps\castle_code::_id_80AA( self, "courtyard_activity_idle" );
        else
        {

        }
    }
}

_id_8117()
{
    self endon( "death" );
    self endon( "stealth_enemy_endon_alert" );
    self endon( "bulletwhizby" );
    self endon( "flashbang" );
    self endon( "grenade danger" );
    self endon( "explode" );
    self endon( "damage" );
    level endon( "_stealth_spotted" );
    self._id_1032 = self.script_noteworthy;
    thread maps\castle_code::_id_80A9();

    if ( isdefined( self._id_1032 ) )
        self._id_0EC6 = 1;

    wait(randomfloat( 0.5 ));
    thread maps\_patrol::_id_204E( self.target );
    self waittill( "goal" );
    maps\_anim::_id_124E( self, "pairguards_idle" );
}

_id_8118()
{
    for (;;)
    {
        iprintln( self.origin[0] + " " + self.origin[1] + " " + self.origin[2] );
        wait 0.05;
    }
}

_id_8119()
{
    var_0 = getent( "courtyard_activity_ledge", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::_id_811A );
    common_scripts\utility::flag_wait( "do_btr_lift" );
    wait 5;

    while ( var_0.count > 0 )
    {
        var_0 maps\_utility::_id_166F();
        wait(randomfloatrange( 3.0, 7.0 ));
    }
}

_id_811A()
{
    self endon( "death" );
    var_0 = getnode( "courtyard_activity_ledge_goal", "targetname" );
    self.goalradius = 32;
    self setgoalpos( var_0.origin );
    self waittill( "goal" );
    self delete();
}

_id_811B()
{
    level waittill( "_stealth_spotted" );
    level.player._id_522E = 1;
    wait 1;
    level.player._id_522E = undefined;
}
