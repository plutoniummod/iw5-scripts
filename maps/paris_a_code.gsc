// IW5 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7681()
{
    var_0 = 11;
    thread _id_6818();
    common_scripts\utility::flag_set( "flag_dialogue_opening" );
    level.player freezecontrols( 1 );
    level.player maps\paris_shared::_id_50A4();
    thread maps\_introscreen::_id_1D97( var_0, 4 );
    var_1 = [];
    var_1[var_1.size] = &"PARIS_INTROSCREEN_LINE1";
    var_1[var_1.size] = &"PARIS_INTROSCREEN_LINE2";
    var_1[var_1.size] = &"PARIS_INTROSCREEN_LINE3";
    var_1[var_1.size] = &"PARIS_INTROSCREEN_LINE4";
    var_1[var_1.size] = &"PARIS_INTROSCREEN_LINE5";
    maps\_introscreen::_id_1D96( var_1 );
    wait(var_0);
    level.player maps\paris_shared::_id_50A8( 0 );
    common_scripts\utility::flag_set( "intro_screen_complete" );
}

_id_6818()
{
    level._id_1441 thread maps\_utility::_id_27AF( 0.1, 11 );
    common_scripts\utility::flag_wait( "flag_little_bird_landed" );
    level.player playrumbleonentity( "viewmodel_large" );
    level._id_1441 maps\_utility::_id_27AE( 16 );
}

_id_7682()
{
    var_0 = [ level._id_7683, level._id_7684 ];
    var_1 = maps\_vehicle::_id_2A99( "little_bird" );
    thread maps\_friendlyfire::_id_1FE4( var_1 );
    var_1 makeunusable();
    var_2 = maps\paris_shared::_id_5076( "pilot_little_bird", "targetname" ) maps\_utility::_id_166F( 1 );
    var_2 maps\_utility::_id_24F5();
    var_2._id_1032 = "pilot";
    var_1 sethoverparams( 0, 0, 0 );
    thread _id_7685();

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 1 );

    foreach ( var_4 in var_0 )
        var_4 maps\_utility::_id_123B();

    level._id_7683 linkto( var_1, "tag_detach_left", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level._id_7684 linkto( var_1, "tag_detach_right", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 linkto( var_1, "tag_driver", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 thread maps\_anim::_id_124E( level._id_7683, "intro_heli_loop", "ender", "tag_detach_left" );
    var_1 thread maps\_anim::_id_124E( level._id_7684, "intro_heli_loop", "ender", "tag_detach_right" );
    var_1 thread maps\_anim::_id_124E( var_2, "intro_heli_loop", "nothing", "tag_driver" );
    var_6 = 35;
    var_7 = -15;
    var_8 = common_scripts\utility::spawn_tag_origin();
    var_8 linkto( var_1, "tag_guy2", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player playerlinkto( var_8, "tag_origin", 0.8, 0, 55, 5, 25, 0 );
    common_scripts\utility::waitframe();
    level.player setplayerangles( var_8.angles + ( var_7, var_6, 0 ) );
    common_scripts\utility::flag_wait( "intro_screen_complete" );
    maps\paris_shared::_id_50E0();
    var_1 maps\_vehicle::_id_1FA6();
    var_1 waittill( "unloading" );
    common_scripts\utility::flag_set( "flag_little_bird_landed" );
    earthquake( 0.2, 1, level.player.origin, 850 );
    maps\paris_shared::_id_5076( "intro_heli_blocker", "script_noteworthy" ) common_scripts\utility::delaycall( 4, ::delete );
    var_2 common_scripts\utility::delaycall( 15, ::delete );
    thread _id_7689( var_1 );
    var_9 = common_scripts\utility::getstruct( "heli_intro_struct", "script_noteworthy" );
    var_10 = level._id_7683 maps\paris_shared::_id_50A6( "intro_heli_exit" ) common_scripts\utility::spawn_tag_origin();
    level._id_7683 linkto( var_10 );
    level._id_7684 linkto( var_10 );
    var_11 = 2;
    var_10 moveto( var_9.origin, var_11, var_11 / 3, var_11 / 3 );
    var_10 rotateto( var_9.angles, var_11, var_11 / 3, var_11 / 3 );
    level._id_7683 common_scripts\utility::delaycall( var_11 + 0.5, ::unlink );
    level._id_7684 common_scripts\utility::delaycall( var_11 + 0.5, ::unlink );
    thread _id_768A( var_8 );

    if ( level.console && level.ps3 || !level.console )
        sethalfresparticles( 0 );

    var_1 notify( "ender" );
    var_10 maps\_anim::_id_11DD( var_0, "intro_heli_exit" );
    var_10 delete();
    common_scripts\utility::flag_set( "flag_obj_01_position_change_1" );
    maps\_utility::delaythread( 4, maps\_utility::_id_1C43 );
    maps\_utility::_id_09C9( ::_id_7687, var_9 );
    maps\_utility::_id_09C9( ::_id_7688, var_9 );
    maps\_utility::_id_275B();
}

_id_7685()
{
    level endon( "little_bird_camera_shake_stop" );

    for (;;)
    {
        earthquake( 0.08, 0.4, level.player.origin, 850 );
        wait(randomfloatrange( 0.05, 0.3 ));
    }
}

_id_7686()
{
    level notify( "little_bird_camera_shake_stop" );
}

_id_7687( var_0 )
{
    maps\paris_shared::_id_50DA( "roof_jumpdown_reno", 1, level._id_7684, 4 );
    var_0 maps\_anim::_id_1247( level._id_7684, "intro_roof_jumpdown" );
    level._id_7684 maps\paris_shared::_id_5085( "node_reno_heli_intro_complete", 0 );
}

_id_7688( var_0 )
{
    maps\paris_shared::_id_50DA( "roof_jumpdown_sandman", 1, level._id_7683, 3 );
    var_0 maps\_anim::_id_1247( level._id_7683, "intro_roof_jumpdown" );
    level._id_7683 maps\paris_shared::_id_5085( "node_lonestar_heli_intro_complete", 0 );
}

_id_7689( var_0 )
{
    var_0 vehicle_setspeed( 0, 10, 10 );
    maps\_audio::aud_send_msg( "aud_paris_intro_heli_exit", var_0 );
    wait 2.75;
    var_0 setairresistance( 10 );
    var_0 setjitterparams( ( 300.0, 300.0, 200.0 ), 0.25, 0.5 );
    var_0 sethoverparams( 100, 5, 5 );
    var_0 setmaxpitchroll( 30, 30 );
    var_0 vehicle_setspeed( 10, 10, 10 );
}

_id_768A( var_0 )
{
    level.player common_scripts\utility::delaycall( 1.5, ::enableweapons );
    wait 1.7;
    _id_7686();
    var_1 = common_scripts\utility::getstruct( "struct_intro_player_location", "script_noteworthy" );
    var_0 unlink();
    var_2 = common_scripts\utility::flat_angle( var_0.angles );
    var_3 = 0.4;
    level.player thread maps\paris_shared::_id_50D9( var_3, 0, 55, 5, 25 );
    var_0 moveto( var_1.origin, var_3, var_3 * 0.7, var_3 * 0.2 );
    var_0 rotateto( var_2, var_3, var_3 * 0.7, var_3 * 0.2 );
    wait(var_3);
    level.player unlink();
    var_0 delete();
    level.player maps\paris_shared::_id_50A5();
    maps\paris_shared::_id_50E1();
}

_id_768B()
{
    self endon( "death" );

    for (;;)
    {
        physicsexplosioncylinder( self.origin, 200, 100, 0.05 );
        common_scripts\utility::waitframe();
    }
}

_id_768C()
{
    var_0 = maps\paris_shared::_id_5076( "corpse_check_vitals", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_0 = maps\_vehicle_aianim::_id_25C1( var_0 );
    var_0._id_1032 = "corpse";
    var_1 = common_scripts\utility::getstruct( "struct_delta_check_vitals", "script_noteworthy" );
    var_1 maps\_anim::_id_11CF( var_0, "delta_check_vitals" );
    level._id_768D = var_0;
    var_1 = common_scripts\utility::getstruct( "struct_move_debris", "script_noteworthy" );
    level._id_768E = maps\_utility::_id_1287( "debris" );
    level._id_768E hide();
    level._id_768F = maps\_utility::_id_1287( "debris" );
    level._id_768F linkto( level._id_768E, "slab", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 maps\_anim::_id_11CF( level._id_768E, "move_debris" );
}

_id_7690()
{
    level._id_7683 thread _id_7691();
    level._id_7684 thread _id_7692();
}

_id_7691()
{
    common_scripts\utility::flag_wait( "flag_check_vitals" );
    maps\_utility::_id_123B();
    var_0 = common_scripts\utility::getstruct( "struct_delta_check_vitals", "script_noteworthy" );
    var_0 maps\_anim::_id_124A( self, "delta_check_vitals" );
    maps\paris_shared::_id_50DA( "check_vitals", 1, self, 2 );
    maps\_utility::delaythread( 4, common_scripts\utility::flag_set, "flag_move_debris_guy2_begin" );
    var_0 maps\_anim::_id_11DE( [ self, level._id_768D ], "delta_check_vitals" );
    maps\paris_shared::_id_50AF();
    var_0 = common_scripts\utility::getstruct( "struct_move_debris", "script_noteworthy" );
    var_0 maps\_anim::_id_124A( self, "move_debris" );

    if ( !common_scripts\utility::flag( "flag_move_debris_guy2_commited" ) )
        maps\paris_shared::_id_50DA( "jank_rooftops_sequence_lonestar_waiting", 1, self );
    else
        maps\paris_shared::_id_50DA( "jank_rooftops_sequence_lonestar_waiting", 0 );

    common_scripts\utility::flag_wait( "flag_move_debris_guy2_commited" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );

    while ( !maps\_utility::_id_0B20( self, 0.05 ) )
        common_scripts\utility::waitframe();

    maps\paris_shared::_id_50DA( "move_debris", 1, self, 3 );
    maps\_utility::delaythread( 7.6, common_scripts\utility::flag_set, "flag_move_debris_guy2_stop_idle" );
    maps\paris_shared::_id_460E();
    thread _id_7693( var_0 );
    maps\_audio::aud_send_msg( "debris_push_animation" );
    var_0 maps\_anim::_id_1247( self, "move_debris" );
    var_0 = common_scripts\utility::getstruct( "struct_delta_ledge_walk", "script_noteworthy" );
    var_0 maps\_anim::_id_124A( self, "delta_ledge_walk" );
    maps\paris_shared::_id_460C();
    maps\paris_shared::_id_50DA( "ledge_walk_guy1", 1, self, 1 );
    thread _id_7694( var_0 );
    var_0 maps\_anim::_id_1247( self, "delta_ledge_walk" );
    self notify( "shimmy_moment_npc_slowdown_end" );
    maps\_utility::_id_2686();
}

_id_7692()
{
    common_scripts\utility::flag_wait( "flag_check_vitals" );
    maps\_utility::_id_123B();
    maps\paris_shared::_id_5085( "node_reno_check_vitals", 1 );
    common_scripts\utility::flag_wait( "flag_move_debris_guy2_begin" );
    var_0 = 1;

    if ( self.a._id_0D26 == "crouch" )
        var_0 = 0;
    else if ( self.script == "cover_right" )
        var_0 = 1;
    else if ( animscripts\utility::_id_0C98() )
        var_0 = 0;

    if ( var_0 )
        maps\_utility::_id_1417( "go", 1 );

    maps\paris_shared::_id_50AF();
    var_1 = common_scripts\utility::getstruct( "struct_move_debris", "script_noteworthy" );
    var_1 maps\_anim::_id_124A( self, "move_debris_in" );
    common_scripts\utility::flag_set( "flag_move_debris_guy2_commited" );
    maps\paris_shared::_id_460E();
    var_1 maps\_anim::_id_1246( self, "move_debris_in" );
    var_1 thread maps\_anim::_id_124E( self, "move_debris_idle", "reno_ender" );
    common_scripts\utility::flag_wait( "flag_move_debris_guy2_stop_idle" );
    getent( "blocker_rooftops", "script_noteworthy" ) common_scripts\utility::delaycall( 5, ::delete );
    var_1 notify( "reno_ender" );
    var_1 maps\_anim::_id_1247( self, "move_debris" );
    var_1 = common_scripts\utility::getstruct( "struct_delta_ledge_walk", "script_noteworthy" );
    var_1 maps\_anim::_id_124A( self, "delta_ledge_walk" );
    var_1 maps\_anim::_id_11CF( self, "delta_ledge_walk" );
    var_2 = getstartorigin( var_1.origin, var_1.angles, maps\_utility::_id_1281( "delta_ledge_walk" ) ) + ( 0.0, -32.0, 60.0 );

    for (;;)
    {
        if ( common_scripts\utility::flag( "flag_dialogue_watch_your_step" ) )
            break;

        var_3 = level.player geteye();

        if ( sighttracepassed( var_3, var_2, 0, level.player, self ) )
            break;

        var_4 = self.origin + randomfloatrange( -16, 16 ) * anglestoright( self.angles ) + randomfloatrange( -16, 16 ) * anglestoforward( self.angles ) + randomfloatrange( 0, 64 ) * anglestoup( self.angles );

        if ( sighttracepassed( var_3, var_4, 0, level.player, self ) )
            break;

        common_scripts\utility::waitframe();
    }

    maps\paris_shared::_id_460C();
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    thread _id_7694( var_1 );
    maps\paris_shared::_id_50DA( "ledge_walk_guy2", 1, self, 2 );
    var_1 maps\_anim::_id_1247( self, "delta_ledge_walk" );
    self notify( "shimmy_moment_npc_slowdown_end" );
    maps\_utility::_id_2686();
}

_id_7693( var_0 )
{
    var_0 maps\_anim::_id_1247( level._id_768E, "move_debris" );
    level._id_768F unlink();
    level._id_768F physicslaunchserver( level._id_768F.origin + anglestoup( level._id_768F.angles ) * 108, ( 0.0, 0.0, -1000.0 ) );
}

_id_7694( var_0 )
{
    var_1 = 64;
    var_2 = 40;
    var_3 = 0;
    thread _id_7695( var_0 );
}

_id_7695( var_0 )
{
    if ( !isdefined( var_0._id_7696 ) )
        var_0._id_7696 = [];

    var_0._id_7696[var_0._id_7696.size] = self;
    self waittill( "shimmy_moment_npc_slowdown_end" );
    var_0._id_7696 = common_scripts\utility::array_remove( var_0._id_7696, self );
}

_id_7697( var_0 )
{
    var_1 = common_scripts\utility::getstruct( "struct_delta_ledge_walk", "script_noteworthy" );
    return maps\_utility::_id_0AE9( var_0, var_1._id_7696 );
}

_id_7698()
{
    common_scripts\utility::flag_wait( "player_rooftop_jets_flyby_01" );
    var_0 = maps\_vehicle::_id_2A9A( "jets_rooftops_01" );
    var_1 = maps\_vehicle::_id_2A9A( "jets_rooftops_02" );
    maps\_audio::aud_send_msg( "jets_flyby_01", var_0 );
}

_id_7699()
{
    common_scripts\utility::flag_wait( "player_rooftop_jets_flyby_02" );
    maps\_utility::_id_1425( "save_arch_building" );
}

_id_769A()
{
    common_scripts\utility::flag_wait( "player_rooftop_jump_complete" );
    maps\_utility::_id_26C1( "trigger_hurt_player_rooftops" );
    maps\_audio::aud_send_msg( "mus_pre_first_contact" );
    var_0 = 0.7;
    level.player thread maps\paris_shared::_id_50DC( 1, var_0, 2 );
    level._id_7683 maps\_utility::_id_1402( "flag_stairwell_reaction_ready" );
    level._id_7684 maps\_utility::_id_1402( "flag_stairwell_reaction_ready" );
    var_1 = common_scripts\utility::getstruct( "struct_delta_stairwell_reaction", "script_noteworthy" );
    var_2 = getnode( "node_sandman_stairwell_moment", "targetname" );
    var_3 = getnode( "node_reno_stairwell_moment", "targetname" );
    level._id_7683 thread _id_769B( var_2 );
    level._id_7684 thread _id_769B( var_3 );
    common_scripts\utility::flag_wait( "flag_bookstore_spray_moment" );
    level notify( "stairwell_reaction_path_to_node_npc_cancel" );
    common_scripts\utility::flag_set( "flag_dialogue_in_the_game" );
    thread _id_76A2();
    maps\paris_shared::_id_50DA( "stairwell_reaction", level._id_7683 maps\_utility::_id_1008( "flag_stairwell_reaction_ready" ) || level._id_7684 maps\_utility::_id_1008( "flag_stairwell_reaction_ready" ), var_2.origin + ( 0.0, 0.0, 32.0 ) );
    level._id_7683 thread _id_769C();
    level._id_7684 thread _id_769C();
    level._id_7683 thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2, 0.25 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level.player thread maps\paris_shared::_id_50DC( var_0, 1, 3 );
}

_id_769B( var_0 )
{
    level endon( "stairwell_reaction_path_to_node_npc_cancel" );
    maps\_utility::_id_123B();
    maps\paris_shared::_id_460E();
    var_1 = 12;
    maps\paris_shared::_id_5085( var_0, 1, var_1 );

    if ( distance( self.origin, var_0.origin ) < var_1 * 1.1 )
        maps\_utility::_id_13DC( "flag_stairwell_reaction_ready" );
    else
    {

    }
}

_id_769C( var_0 )
{
    if ( maps\_utility::_id_1008( "flag_stairwell_reaction_ready" ) )
    {
        maps\paris_shared::_id_50DA( "stairwell_reaction_" + self._id_1032, 1, self );
        maps\_anim::_id_1247( self, "delta_stairwell_reaction" );
    }
    else
        maps\paris_shared::_id_50DA( "stairwell_reaction_" + self._id_1032, 0 );

    maps\_utility::_id_2686();
    maps\paris_shared::_id_460C();
}

_id_769D()
{
    var_0 = maps\paris_shared::_id_5076( "trigger_rooftops_cqb_off", "targetname" );

    while ( !self istouching( var_0 ) )
        common_scripts\utility::waitframe();

    maps\_utility::_id_109E();

    if ( self._id_1032 == "lonestar" )
        thread maps\paris_shared::_id_50AE( 546, 0.8, 1.2, 0.25 );

    if ( self._id_1032 == "reno" )
        thread maps\paris_shared::_id_50AE( 468, 0.8, 1.2, 0.25 );
}

_id_769E()
{
    common_scripts\utility::flag_wait( "flag_bookstore_spray_moment" );
    maps\_audio::aud_send_msg( "bookstore_spray_moment" );
    maps\_utility::_id_265B( "allies" );
    maps\_audio::aud_send_msg( "mus_first_contact" );
    var_0 = getentarray( "ai_bookstore_initial", "targetname" );
    var_1 = getentarray( "ai_bookstore_initial_top", "targetname" );
    var_2 = common_scripts\utility::array_combine( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4 ) )
            var_4 maps\_utility::_id_166F( 1 );
    }

    maps\paris_shared::_id_5080( 1, [ "ai_bookstore_initial_top", "ai_encounter_initial_top", "ai_bookstore_initial", "ai_bookstore_spray_moment" ], 1 );
    common_scripts\utility::flag_set( "flag_ai_initial_top_retreat" );
}

_id_64EC()
{
    if ( !isdefined( self._id_164F ) )
        return;

    var_0 = strtok( self._id_164F, ":;, " );

    foreach ( var_2 in var_0 )
    {
        var_2 = tolower( var_2 );

        if ( var_2 == "balcony" )
            self._id_0D4B = ::_id_769F;
    }
}

_id_769F()
{
    if ( !isdefined( self ) )
        return 0;

    if ( self.a._id_0D26 == "prone" )
        return 0;

    if ( !isdefined( self.prevnode ) )
        return 0;

    if ( !isdefined( self.prevnode._id_64EE ) )
        return 0;

    var_0 = self.angles[1];
    var_1 = self.prevnode.angles[1];
    var_2 = abs( angleclamp180( var_0 - var_1 ) );

    if ( var_2 > 45 )
        return 0;

    var_3 = distance( self.origin, self.prevnode.origin );

    if ( var_3 > 16 )
        return 0;

    if ( isdefined( level._id_64EF ) )
    {
        var_4 = gettime() - level._id_64EF;

        if ( var_4 < 5000 )
            return 0;
    }

    var_5 = getentarray( "trigger_balcony", "targetname" );

    foreach ( var_7 in var_5 )
    {
        var_3 = distance( var_7.origin, self.origin );

        if ( var_3 < 48 )
            var_7 notify( "trigger" );
    }

    glassradiusdamage( self.origin, 48, 500, 500 );
    level._id_64EF = gettime();
    var_9 = maps\_utility::_id_270F( "balcony_death" );
    _id_76A0( var_9[randomint( var_9.size )] );
    return 1;
}
#using_animtree("generic_human");

_id_76A0( var_0 )
{
    self endon( "play_balcony_deathanim_stop" );

    if ( !animhasnotetrack( var_0, "dropgun" ) && !animhasnotetrack( var_0, "fire_spray" ) )
        animscripts\shared::_id_0D73();

    self setflaggedanimknoballrestart( "deathanim", var_0, %body, 1, 0.1 );
    animscripts\notetracks::_id_0D4C( "deathanim", ::_id_76A1 );
    animscripts\shared::_id_0D73();
}

_id_76A1( var_0 )
{
    if ( var_0 == "start_ragdoll" )
    {
        self startragdoll();
        var_1 = gettime() * 0.001;
        var_2 = self.origin;
        self waittillmatch( "deathanim", "end" );
        var_3 = gettime() * 0.001 - var_1;
        var_4 = ( self.origin - var_2 ) / var_3;
        var_5 = 5;
        var_6 = common_scripts\utility::spawn_tag_origin();
        self linkto( var_6 );
        var_6 movegravity( var_4, var_5 );
        wait(var_5);
        self unlink();
        var_6 delete();
        self notify( "play_balcony_deathanim_stop" );
    }

    return 0;
}

_id_76A2()
{
    var_0 = getent( "ai_bookstore_spray_moment", "script_noteworthy" );
    wait 0.15;
    var_1 = common_scripts\utility::getstruct( "bookstore_spray_node", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "bookstore_spray_node_teleport", "script_noteworthy" );
    var_3 = common_scripts\utility::getstruct( "bookstore_spray_target_start", "script_noteworthy" );
    var_4 = common_scripts\utility::getstruct( "bookstore_spray_target_end", "script_noteworthy" );
    var_5 = var_0 maps\_utility::_id_166F( 1 );

    if ( !isalive( var_5 ) )
        return;

    var_5 endon( "death" );
    var_5 maps\paris_shared::_id_460E();
    var_5 maps\paris_shared::_id_5085( "bookstore_spray_node_teleport", 0 );
    var_5 teleport( var_2.origin, var_2.angles );
    var_5 _id_770C( var_3.origin, var_4.origin );
    var_5 maps\_utility::_id_2724( 2048 );
    var_5 maps\paris_shared::_id_460C();
}

_id_76A3()
{
    maps\_utility::_id_09C9( common_scripts\utility::flag_wait, "flag_obj_01_position_change_5" );
    maps\_utility::_id_09C9( common_scripts\utility::flag_wait, "flag_ai_initial_top_retreat" );
    maps\_utility::_id_09CB();
    maps\_vehicle::_id_2881( "uaz_01" );
    maps\_utility::_id_26C1( "trigger_color_bookstore_force" );
    var_0 = getentarray( "ai_bookstore_exterior", "script_noteworthy" );
    var_1 = getentarray( "ai_bookstore_upper", "script_noteworthy" );
    var_2 = common_scripts\utility::array_combine( var_0, var_1 );

    foreach ( var_4 in var_2 )
        var_4 maps\_utility::_id_166F( 1 );
}

_id_76A4()
{
    common_scripts\utility::flag_wait_any( "flag_obj_01_position_change_5", "flag_ai_exits_stairwell" );
    var_0 = getentarray( "ai_bookstore_runners", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\paris_shared::_id_50B4 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\paris_shared::_id_50B5 );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_166F();
}

_id_76A5()
{
    common_scripts\utility::flag_wait( "flag_player_enters_bookstore" );
    thread _id_0211();
    thread maps\paris_shared::_id_5093( "dead_bodies_back_alley" );
    thread _id_76A6();
    thread _id_76A7();
    thread _id_76A8();
    maps\_audio::aud_send_msg( "mus_enter_book_store" );
}

_id_0211()
{
    var_0 = getent( "info_v_ai_bookstore_balcony", "targetname" );

    for (;;)
    {
        var_1 = 0;

        foreach ( var_3 in getaiarray( "axis" ) )
        {
            if ( var_3 istouching( var_0 ) )
            {
                var_1 = 1;
                break;
            }
        }

        if ( var_1 )
            break;

        common_scripts\utility::waitframe();
    }

    common_scripts\utility::flag_set( "flag_dialogue_bookstore_balcony" );
}

_id_0212()
{
    var_0 = getent( "info_v_ai_bookstore_top_floor", "targetname" );

    for (;;)
    {
        var_1 = 0;

        foreach ( var_3 in getaiarray( "axis" ) )
        {
            if ( var_3 istouching( var_0 ) )
            {
                var_1 = 1;
                break;
            }
        }

        if ( !var_1 )
            break;

        common_scripts\utility::waitframe();
    }

    if ( level.player istouching( var_0 ) )
    {
        if ( level._id_7683 istouching( var_0 ) )
        {
            common_scripts\utility::flag_set( "flag_dialogue_bookstore_top_floor_clear_1" );
            var_5 = getentarray( "trigger_color_bookstore", "targetname" );

            foreach ( var_7 in var_5 )
                var_7 common_scripts\utility::trigger_off();

            thread _id_0213();
            maps\paris_shared::_id_50DF( "trig_color_bookstore_sandman_lower_floor" );
        }
        else
            thread _id_01CB();
    }
}

_id_0213()
{
    var_0 = getaiarray( "axis" );

    if ( var_0.size > 3 )
        common_scripts\utility::flag_set( "flag_dialogue_bookstore_heavy_fire_1" );
}

_id_01CB()
{
    var_0 = getaiarray( "axis" );

    if ( var_0.size > 3 )
        common_scripts\utility::flag_set( "flag_dialogue_bookstore_heavy_fire_2" );
}

_id_76A6()
{
    var_0 = getentarray( "ai_bookstore_01", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_166F();

    var_4 = [ "ai_encounter_initial", "ai_encounter_initial_top", "ai_bookstore_runners", "ai_bookstore_top_rear", "ai_bookstore_01", "ai_bookstore_02", "ai_bookstore_heli_1", "ai_bookstore_spray_moment" ];
    maps\paris_shared::_id_507F( 6, var_4, 1 );
    level._id_7683 maps\_utility::_id_109B();
    level._id_7684 maps\_utility::_id_109B();
}

_id_76A7()
{
    common_scripts\utility::flag_wait( "flag_bookstore_combat_top_rear" );
    var_0 = getent( "info_v_ai_bookstore_top_rear", "targetname" );
    var_1 = getent( "info_v_ai_bookstore_bottom_rear", "targetname" );
    var_2 = var_0 maps\_utility::_id_2789( "axis" );
    var_2 = _id_770D( var_2, 3 );
    common_scripts\utility::array_call( var_2, ::setgoalvolumeauto, var_1 );
    var_3 = getentarray( "ai_bookstore_top_rear", "script_noteworthy" );

    foreach ( var_5 in var_3 )
        var_5 maps\_utility::_id_166F();

    common_scripts\utility::waitframe();
    thread _id_0212();
}

_id_76A8()
{
    common_scripts\utility::flag_wait( "flag_bookstore_combat_interior" );
    var_0 = getent( "info_v_ai_bookstore_bottom_rear", "targetname" );
    var_1 = var_0 maps\_utility::_id_2789( "axis" );
    var_1 = _id_770D( var_1, 3 );
    var_2 = 5 - var_1.size;
    var_3 = _id_770D( getentarray( "ai_bookstore_02", "script_noteworthy" ), var_2 );

    foreach ( var_5 in var_3 )
        var_5 maps\_utility::_id_166F();

    var_7 = [ "ai_encounter_initial", "ai_encounter_initial_top", "ai_bookstore_runners", "ai_bookstore_top_rear", "ai_bookstore_01", "ai_bookstore_02", "ai_bookstore_heli_1", "ai_bookstore_spray_moment" ];
    maps\paris_shared::_id_507F( 3, var_7, 1 );
    common_scripts\utility::flag_set( "flag_bookstore_straglers" );
    thread _id_76C5();
    thread _id_76A9();
    maps\paris_shared::_id_507F( 1, var_7, 1 );
    maps\paris_shared::_id_5081( var_7 );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::_id_76DA );
    var_8 = getentarray( "trigger_color_bookstore_combat_complete", "targetname" );

    foreach ( var_10 in var_8 )
        var_10 common_scripts\utility::trigger_off();

    common_scripts\utility::flag_set( "bookstore_combat_interior_rear_done" );
}

_id_76A9()
{
    maps\_utility::_id_26C3( "trigger_color_bookstore_force" );
    level._id_7684 maps\_utility::_id_123B();
    level._id_7683 maps\_utility::_id_123B();
    var_0 = getnode( "node_reno_clear_boorkstore", "targetname" );
    var_1 = getnodearray( "node_sandman_clear_boorkstore", "targetname" );
    var_2 = maps\_utility::_id_0AE9( level._id_7683.origin, var_1 );
    level._id_7684 maps\paris_shared::_id_5085( var_0, 0 );
    level._id_7683 maps\paris_shared::_id_5085( var_2, 0 );
}

_id_76AA()
{
    level._id_76AB = maps\_utility::_id_1287( "bookstore_door" );
    var_0 = common_scripts\utility::getstruct( "struct_bookstore_exit", "script_noteworthy" );
    var_0 maps\_anim::_id_11CF( level._id_76AB, "bookstore_exit_exit" );
    var_1 = maps\paris_shared::_id_5076( "blocker_bookstore_exit", "script_noteworthy" );
    var_1 connectpaths();
}

_id_76AC()
{
    common_scripts\utility::flag_wait( "bookstore_combat_interior_rear_done" );
    maps\_utility::_id_265A( "allies" );
    var_0 = getent( "trigger_color_bookstore_top", "targetname" );

    if ( isdefined( var_0 ) )
        maps\_utility::_id_26C1( "trigger_color_bookstore_top" );

    common_scripts\utility::flag_set( "flag_dialogue_bookstore_clear" );
    maps\_audio::aud_send_msg( "mus_bookstore_clear" );
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "flag_dialogue_check_door" );
    var_1 = common_scripts\utility::getstruct( "struct_bookstore_exit", "script_noteworthy" );
    level._id_7684 maps\_utility::_id_1402( "flag_bookstore_exit_ready" );
    level._id_7683 maps\_utility::_id_1402( "flag_bookstore_exit_ready" );
    level._id_7684 thread _id_76AD( var_1 );
    level._id_7683 thread _id_76AD( var_1 );
    level._id_7684 maps\_utility::_id_1654( "flag_bookstore_exit_ready" );
    level._id_7683 maps\_utility::_id_1654( "flag_bookstore_exit_ready" );
    maps\_utility::_id_1425( "save_bookstore_breach" );
    common_scripts\utility::flag_wait_all( "flag_bookstore_exit_player_nearby", "flag_dialogue_check_door_complete" );
    thread _id_76B0( "guy_bookstore_death_1", "struct_bookstore_alley_shooting_1", "bookstore_alley_shooting_1" );
    thread _id_76B0( "guy_bookstore_death_2", "struct_bookstore_alley_shooting_2", "bookstore_alley_shooting_2" );
    thread _id_76AF();
    thread _id_76B2();
    thread _id_76B3();
    common_scripts\utility::flag_set( "flag_obj_01_position_change_6" );
    common_scripts\utility::flag_set( "flag_bookstore_exit_start" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    var_1 = common_scripts\utility::getstruct( "struct_bookstore_exit", "script_noteworthy" );
    var_1 thread maps\_anim::_id_1246( level._id_76AB, "bookstore_exit_exit" );
    var_2 = maps\paris_shared::_id_5076( "blocker_bookstore_exit", "script_noteworthy" );
    var_2 common_scripts\utility::delaycall( 2.5, ::delete );
    common_scripts\utility::flag_wait( "flag_ai_clean_up_initial" );
    maps\_utility::_id_26C1( "trigger_color_bookstore_force" );
}

_id_76AD( var_0 )
{
    var_1 = self._id_1032 + "_ender";
    maps\paris_shared::_id_460E();
    var_0 maps\_anim::_id_124A( self, "bookstore_exit_st" );
    var_0 maps\_anim::_id_1246( self, "bookstore_exit_st" );
    var_0 thread maps\_anim::_id_124E( self, "bookstore_exit_idle", var_1 );
    maps\_utility::_id_13DC( "flag_bookstore_exit_ready" );
    maps\_utility::_id_109E();
    common_scripts\utility::flag_wait( "flag_bookstore_exit_start" );
    level.player setmovespeedscale( 0.8 );
    var_0 notify( var_1 );
    maps\paris_shared::_id_50DA( "bookstore_check_door_" + self._id_1032, 1, self, 2 );
    var_0 maps\_anim::_id_1247( self, "bookstore_exit_exit" );
    maps\paris_shared::_id_460C();
    maps\_utility::_id_2686();
    maps\_utility::_id_2712();
}

_id_76AE()
{
    var_0 = getnode( "node_gign_1_behind_kitchen", "targetname" );
    var_1 = getent( "gign_alley", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_1 endon( "death" );
    var_0 = getnode( "node_gign_1_behind_kitchen_guard", "targetname" );
    var_1 maps\paris_shared::_id_5085( var_0, 0 );
    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_4" );
    var_1 delete();
}

_id_76AF()
{
    var_0 = getent( "gign_alley_spray", "script_noteworthy" );
    wait 1;
    var_1 = common_scripts\utility::getstruct( "alley_spray_node", "script_noteworthy" );
    var_2 = common_scripts\utility::getstruct( "alley_spray_node_teleport", "script_noteworthy" );
    var_3 = common_scripts\utility::getstruct( "alley_spray_target_start", "script_noteworthy" );
    var_4 = common_scripts\utility::getstruct( "alley_spray_target_end", "script_noteworthy" );
    var_5 = getnode( "node_gign_behind_kitchen", "targetname" );
    var_6 = var_0 maps\_utility::_id_166F( 1 );
    var_6 maps\_utility::_id_2611();

    if ( !isalive( var_6 ) )
        return;

    var_6 endon( "death" );
    var_6 maps\paris_shared::_id_5085( "alley_spray_node_teleport", 0 );
    var_6 teleport( var_2.origin, var_2.angles );
    var_6 _id_770C( var_3.origin, var_4.origin );
    var_6 maps\paris_shared::_id_5085( var_5, 1 );
    var_6 maps\_utility::_id_1902();
    var_6 maps\_utility::delaythread( 1, maps\_utility::_id_1417, "onme" );
    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_4" );
    var_6 delete();
}

_id_76B0( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" ) maps\_utility::_id_166F( 1 );
    var_3._id_0D50 = maps\_utility::_id_26EC( var_2 );
    var_3._id_0D45 = ::_id_76B1;
    var_3 endon( "death" );
    var_3 maps\_utility::_id_24F5();
    var_3.ignoreme = 1;
    var_3.ignoreall = 1;
    var_4 = common_scripts\utility::getstruct( var_1, "targetname" );
    var_4 maps\_anim::_id_11C0( var_3, var_2 );
    var_4 maps\_anim::_id_11C1( var_3, var_2 );

    if ( isdefined( level._id_0C59["generic"][var_2 + "_death"] ) )
        var_4 maps\_anim::_id_11C0( var_3, var_2 + "_death" );

    waittillframeend;
    var_3 kill();
}

_id_76B1()
{
    self startragdoll();
}

_id_76B2()
{
    var_0 = common_scripts\utility::getstruct( "struct_gign_restaurant_wave", "targetname" );
    var_1 = getent( "gign_alley_wave", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_1 endon( "death" );
    var_0 thread maps\_anim::_id_11C8( var_1, "gign_wave", "end_wave" );
    common_scripts\utility::flag_wait( "flag_gign_wave_complete" );
    wait 2;
    var_0 notify( "end_wave" );
    var_1 stopanimscripted();
    var_2 = getnode( "node_gign_wave_kitchen", "targetname" );
    var_1 maps\_utility::_id_2612( 1 );
    var_1 maps\paris_shared::_id_5085( var_2, 1, 8 );
    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_4" );
    var_1 delete();
}

_id_76B3()
{
    common_scripts\utility::flag_wait( "flag_gign_meeting_runner" );
    level.player._id_1FE1 = 0;
    thread _id_76AE();
    var_0 = common_scripts\utility::getstruct( "struct_gign_meeting_runner", "targetname" );
    var_1 = getnode( "node_gign_meeting_runner", "targetname" );
    var_2 = getent( "gign_alley_runner", "script_noteworthy" ) maps\_utility::_id_166F( 1 );
    var_2 endon( "death" );
    var_2 maps\_utility::_id_2712();
    var_2 maps\_utility::_id_2612( 1 );
    var_0 maps\_anim::_id_11C1( var_2, "gign_meeting_runner" );
    var_2 maps\paris_shared::_id_5085( var_1, 1 );
    var_2 waittill( "goal" );
    var_2 delete();
}

_id_76B4()
{
    common_scripts\utility::flag_wait( "flag_ai_clean_up_initial" );
    maps\paris_shared::_id_5083( "ai_encounter_initial", 128 );
}

_id_76B5()
{
    common_scripts\utility::flag_wait( "flag_ai_clean_up_restaurant_alley" );
    maps\paris_shared::_id_5083( "ai_restaurant_alley", 128 );
    maps\paris_shared::_id_5083( "enemy_kill_civ_street_alley_2", 128 );
}

_id_76B6()
{
    self endon( "trigger_restaurant_meeting" );
    common_scripts\utility::flag_wait( "flag_obj_01_position_change_5" );

    for ( var_0 = 0; var_0 < 20; var_0++ )
    {
        var_1 = maps\_vehicle::_id_2A9A( "tank_battalion_bookstore" );
        maps\_audio::aud_send_msg( "tank_battalion_bookstore", var_1 );
        wait 5;
    }
}

_id_76B7()
{
    common_scripts\utility::flag_wait( "flag_jet_flyby_back_alley" );
    var_0 = maps\_vehicle::_id_2A9A( "jet_back_alley_01" );
    maps\_audio::aud_send_msg( "jet_flyby_back_alley", var_0 );
}

_id_76B8()
{

}

_id_76B9()
{
    common_scripts\utility::flag_wait( "restaurant_spawn_heroes" );
    level._id_76BA = maps\_utility::_id_272F( "frenchie" );
    level._id_76BB = maps\_utility::_id_272F( "redshirt" );
    level._id_76BC = maps\_utility::_id_272C( "extras_gign" );
    level._id_76BA maps\_utility::_id_123B();
    level._id_76BB maps\_utility::_id_123B();
    common_scripts\utility::array_thread( level._id_76BC, maps\_utility::_id_123B );
    level._id_76BA maps\_utility::_id_2611();
    level._id_76BB maps\_utility::_id_2611();

    foreach ( var_1 in level._id_76BC )
    {
        if ( isalive( var_1 ) )
            var_1 maps\_utility::_id_2611();
    }

    var_3 = common_scripts\utility::getstruct( "struct_conversation_with_gign", "script_noteworthy" );
    var_3 thread maps\_anim::_id_124E( level._id_76BA, "conversation_with_gign_idle", "stop_loop" );
    maps\_utility::_id_265B( "allies" );
    thread maps\paris_shared::_id_5093( "dead_gign_restaurant" );
    thread _id_76C6();
    thread _id_76BF();
    maps\paris_shared::_id_508F();
}

_id_76BD()
{
    var_0 = common_scripts\utility::getstruct( "struct_conversation_with_gign", "script_noteworthy" );
    level._id_7684 maps\_utility::_id_2713();
    level._id_7684 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level._id_7683 thread maps\paris_shared::_id_50AE( 312, 0.8, 1.2, 0.25 );
    level._id_76BC = maps\_utility::_id_1361( level._id_76BC );
    level._id_76BC = common_scripts\utility::array_removeundefined( level._id_76BC );
    common_scripts\utility::array_thread( level._id_76BC, maps\_utility::_id_123B );
    level._id_7683 maps\paris_shared::_id_50AF();
    level._id_7684 maps\paris_shared::_id_50AF();
    level._id_7684 maps\_utility::_id_123B();
    var_0 maps\_anim::_id_124A( level._id_7683, "conversation_with_gign" );
    var_0 maps\_anim::_id_11CF( level._id_7683, "conversation_with_gign" );

    for ( var_1 = 0; var_1 < 5; var_1 += 0.05 )
    {
        if ( common_scripts\utility::flag( "flag_player_in_restaurant" ) )
            break;

        var_2 = level.player geteye();
        var_3 = level._id_7683;
        var_4 = var_3.origin + randomfloatrange( -16, 16 ) * anglestoright( var_3.angles ) + randomfloatrange( -16, 16 ) * anglestoforward( var_3.angles ) + randomfloatrange( 0, 64 ) * anglestoup( var_3.angles );

        if ( sighttracepassed( var_2, var_4, 0, level.player, var_3 ) )
            break;

        common_scripts\utility::waitframe();
    }

    common_scripts\utility::flag_set( "flag_restaurant_meeting_start" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    level._id_7683 maps\_utility::_id_2713();
    level._id_7684 maps\_utility::_id_123B();
    level._id_7684 maps\_utility::_id_2612( 1 );
    level._id_7684 maps\paris_shared::_id_5085( getnode( "node_reno_kitchen", "targetname" ), 0 );
    common_scripts\utility::flag_set( "flag_dialogue_restaurant_meeting" );
    maps\_utility::delaythread( 11.25, common_scripts\utility::flag_set, "flag_conversation_blocker_leave" );
    var_0 notify( "stop_loop" );
    maps\paris_shared::_id_50DA( "restaurant_meeting", 1, level._id_76BA, 3 );
    var_0 maps\_anim::_id_11DE( [ level._id_7683, level._id_76BA ], "conversation_with_gign" );
    level._id_7683 thread maps\_anim::_id_1247( level._id_7683, "conversation_with_gign_end" );
    maps\_utility::_id_26BF( "trig_color_kitchen_force" );
    level._id_76BC = maps\_utility::_id_1361( level._id_76BC );
    level._id_76BC = common_scripts\utility::array_removeundefined( level._id_76BC );
    common_scripts\utility::array_thread( level._id_76BC, maps\paris_shared::_id_460E );

    foreach ( var_6 in level._id_76BC )
    {
        if ( isalive( var_6 ) )
            var_6 maps\_utility::_id_1902();
    }

    common_scripts\utility::flag_set( "flag_restaurant_meeting_complete" );
    thread maps\paris_shared::_id_5093( "dead_civ_courtyard_1" );
    thread _id_76BE();
    level notify( "restaurant_meeting_random_shots_stop" );
    maps\_utility::_id_09C9( ::_id_76C2 );
    maps\_utility::_id_09C9( ::_id_76C3 );
    maps\_utility::_id_09C9( ::_id_76C4 );
    maps\_utility::_id_275B();
    level._id_76BC = maps\_utility::_id_1361( level._id_76BC );
    level._id_76BC = common_scripts\utility::array_removeundefined( level._id_76BC );
    common_scripts\utility::array_thread( level._id_76BC, maps\_utility::_id_2686 );
    common_scripts\utility::array_thread( level._id_76BC, maps\paris_shared::_id_460C );
    thread _id_76C8();
    level.player setmovespeedscale( 1 );
}

_id_76BE()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "flag_dead_civ_yoga_studio" );
        var_0 = maps\paris_shared::_id_5093( "dead_civ_yoga_studio" );
        common_scripts\utility::flag_wait( "flag_dead_civ_yoga_studio_delete" );

        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2 ) )
                var_2 delete();
        }
    }
}

_id_76BF()
{
    var_0 = common_scripts\utility::getstruct( "struct_conversation_with_gign", "script_noteworthy" );
    var_1 = level._id_76BB;
    var_2 = maps\paris_shared::_id_5076( "conversation_blocker_wounded", "script_noteworthy" ) maps\_utility::_id_166F( 1, 1 );
    maps\paris_shared::_id_50DA( "jank_conversation_blocker_spawn", 1, var_2 );
    var_2._id_1032 = "wounded";
    var_2.drawoncompass = 0;
    var_2 maps\paris_shared::_id_460E();
    var_2 maps\_utility::_id_24F5();
    var_1 maps\_utility::_id_123B();
    var_3 = [ var_1, var_2 ];
    var_0 maps\_anim::_id_11BF( var_3, "conversation_blocker" );
    common_scripts\utility::flag_wait_any( "flag_restaurant_meeting_start", "flag_player_in_restaurant" );
    maps\paris_shared::_id_50DA( "jank_conversation_blocker_start", 1, var_2 );
    var_1 thread _id_76C0( var_0 );
    var_2 thread _id_76C1( var_0 );
}

_id_76C0( var_0 )
{
    maps\paris_shared::_id_460E();
    var_0 maps\_anim::_id_1246( self, "conversation_blocker" );
    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 thread maps\_anim::_id_124E( self, "conversation_blocker_idle_no_origin", "ender" );
    common_scripts\utility::flag_wait( "flag_conversation_blocker_leave" );
    var_1 notify( "ender" );
    var_1 maps\_anim::_id_1246( self, "conversation_blocker_exit", undefined, 0.633333 );
    maps\_anim::_id_1247( self, "conversation_blocker_exit_end" );
    maps\paris_shared::_id_5076( "blocker_restaurant", "script_noteworthy" ) delete();
    maps\paris_shared::_id_5085( "conversation_blocker_end_node", 1 );
    maps\paris_shared::_id_460C();
    maps\_utility::_id_2688();
}

_id_76C1( var_0 )
{
    var_0 maps\_anim::_id_1246( self, "conversation_blocker" );
    var_1 = spawnstruct();
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 maps\_anim::_id_124E( self, "conversation_blocker_idle_no_origin" );
}

_id_76C2()
{
    level._id_76BA maps\_utility::_id_123B();
    level._id_76BA maps\_utility::_id_109B();
    level._id_76BA maps\paris_shared::_id_460E();
    level._id_76BA maps\paris_shared::_id_5085( "node_sabre_exit_kitchen_1", 1 );
    level._id_76BA maps\_utility::_id_109E();
    wait 1.5;
    level._id_76BA maps\paris_shared::_id_5085( "node_sabre_exit_kitchen_2", 1 );
    wait 0.5;
    level._id_76BA maps\paris_shared::_id_460C();
    level._id_76BA maps\_utility::_id_2686();
}

_id_76C3()
{
    var_0 = getnode( "node_sandman_exit_kitchen", "targetname" );
    level._id_7683 maps\_utility::_id_123B();
    level._id_7683 maps\_utility::_id_109B();
    level._id_7683 maps\paris_shared::_id_460E();
    level._id_7683 maps\paris_shared::_id_5085( var_0, 1 );
    level._id_7683 maps\paris_shared::_id_460C();
    level._id_7683 maps\_utility::_id_109E();
    level._id_7683 maps\_utility::_id_2686();
}

_id_76C4()
{
    level._id_7684 maps\_utility::_id_2686();
    level._id_7684 maps\_utility::_id_2612( 0 );
}

_id_76C5()
{
    var_0 = 0.25;
    var_1 = 2.25;
    var_2 = 3;
    var_3 = 10;
    var_4 = 10;
    var_5 = 20;
    var_6 = 64;
    level endon( "restaurant_meeting_random_shots_stop" );
    var_7 = common_scripts\utility::getstructarray( "kitchen_spray_origin", "script_noteworthy" );
    var_8 = common_scripts\utility::getstructarray( "kitchen_spray_target", "script_noteworthy" );

    for (;;)
    {
        var_9 = randomintrange( var_2, var_3 );
        var_10 = min( 1.0 / randomfloatrange( var_4, var_5 ), 0.05 );
        var_11 = common_scripts\utility::random( var_7 );
        var_12 = common_scripts\utility::random( var_8 );

        for ( var_13 = 0; var_13 < var_9; var_13++ )
        {
            var_14 = var_11.origin;
            var_15 = var_12.origin + common_scripts\utility::randomvector( var_6 );
            magicbullet( "scar_h_acog", var_14, var_15 );
            wait(var_10);
        }

        wait(randomfloatrange( var_0, var_1 ));
    }
}

_id_76C6()
{
    var_0 = getentarray( "enemy_courtyard_1_wave_1", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );

    foreach ( var_2 in getentarray( "enemy_courtyard_1_wave_1", "script_noteworthy" ) )
    {
        if ( isalive( var_2 ) )
            var_2 maps\_utility::_id_2611();
    }

    common_scripts\utility::flag_wait( "flag_courtyard_1_magic_shield_off" );
    maps\paris_shared::_id_5090();

    foreach ( var_2 in getentarray( "enemy_courtyard_1_wave_1", "script_noteworthy" ) )
    {
        if ( isalive( var_2 ) )
            var_2 maps\_utility::_id_1902();
    }

    var_6 = [ "enemy_courtyard_1_wave_1" ];
    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_2" );
    maps\paris_shared::_id_5081( var_6 );
    var_0 = getentarray( "enemy_courtyard_1_wave_2", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );

    var_0 = getentarray( "enemy_courtyard_1_rpg", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );

    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_3" );
    var_0 = getentarray( "enemy_courtyard_1_wave_3", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );

    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_4" );
    thread _id_76C7();
    common_scripts\utility::flag_wait( "flag_courtyard_1_kill_spawners" );
    var_7 = [ "enemy_courtyard_1_wave_3" ];
    maps\paris_shared::_id_5081( var_7 );
    common_scripts\utility::flag_wait( "flag_courtyard_1_wave_5" );
    var_0 = getentarray( "enemy_courtyard_1_wave_5", "script_noteworthy" );

    foreach ( var_9 in var_0 )
        var_9 maps\_utility::_id_166F( 1 );
}

_id_76C7()
{
    var_0 = [ "enemy_courtyard_1_wave_2" ];
    maps\paris_shared::_id_5081( var_0 );
    var_1 = getentarray( "enemy_courtyard_1_wave_4", "script_noteworthy" );

    foreach ( var_3 in var_1 )
        var_3 maps\_utility::_id_166F( 1 );

    common_scripts\utility::waitframe();
    maps\paris_shared::_id_507F( 5, [ "enemy_courtyard_1_wave_1", "enemy_courtyard_1_rpg", "enemy_courtyard_1_wave_2", "enemy_courtyard_1_wave_3", "enemy_courtyard_1_wave_4" ], 1 );
    var_5 = getent( "info_v_enemy_courtyard_01_stairs", "targetname" );

    foreach ( var_7 in getaiarray( "axis" ) )
    {
        var_7 cleargoalvolume();
        var_7 setgoalvolumeauto( var_5 );
    }

    common_scripts\utility::waitframe();
    maps\paris_shared::_id_507F( 3, [ "enemy_courtyard_1_wave_1", "enemy_courtyard_1_rpg", "enemy_courtyard_1_wave_2", "enemy_courtyard_1_wave_3", "enemy_courtyard_1_wave_4" ], 1 );
    var_9 = getentarray( "trig_color_courtyard_1", "targetname" );

    foreach ( var_11 in var_9 )
    {
        if ( isdefined( var_11 ) )
            var_11 common_scripts\utility::trigger_off();
    }

    var_5 = getent( "info_v_enemy_courtyard_01_retreat", "targetname" );

    foreach ( var_7 in getaiarray( "axis" ) )
    {
        var_7 cleargoalvolume();
        var_7 setgoalvolumeauto( var_5 );
    }

    wait 2;
    maps\paris_shared::_id_50DF( "trig_color_courtyard_1_end" );
}

_id_76C8()
{
    common_scripts\utility::flag_wait( "flag_tank_battalion_side_alley_01" );
    level._id_7683 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level._id_7684 thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level._id_76BA thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
    level._id_76BB thread maps\paris_shared::_id_50AE( 234, 0.8, 1.2, 0.25 );
}

_id_76C9()
{
    self endon( "flag_stop_tank_battalion_side_alley_01" );
    common_scripts\utility::flag_wait( "flag_tank_battalion_side_alley_01" );

    for ( var_0 = 0; var_0 < 20 && !common_scripts\utility::flag( "flag_tanks_side_alley_aggro" ); var_0++ )
    {
        var_1 = maps\_vehicle::_id_2A9A( "tank_battalion_side_alley_01" );

        foreach ( var_3 in var_1 )
        {
            var_3 thread _id_76CB();
            var_3 thread _id_76CA();
        }

        maps\_audio::aud_send_msg( "courtyard_tanks", var_1 );
        wait 8;
    }
}

_id_76CA()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    common_scripts\utility::flag_set( "flag_tanks_side_alley_aggro" );
}

_id_76CB()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "flag_tanks_side_alley_aggro" );
    self vehicle_setspeed( 0, 15, 15 );
    maps\_vehicle::_id_2514();
}

_id_76CC()
{
    common_scripts\utility::flag_wait( "flag_player_enters_yoga_room" );
    maps\_audio::aud_send_msg( "mus_courtyard1_crossed" );
}

_id_76CD()
{
    common_scripts\utility::flag_wait( "flag_spawn_corpses_ac_alley" );
    thread maps\paris_shared::_id_5093( "dead_civ_ac_alley" );
}

_id_76CE()
{
    maps\_utility::_id_27CB( "enemy_ai_initial_ac_moment", ::_id_76D1 );
    maps\_utility::_id_27CB( "enemy_ai_initial_ac_moment_gaz", ::_id_76D1 );
    thread _id_76D0();
    thread _id_76CF();
    var_0 = getentarray( "enemy_ai_initial_ac_moment", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );

    thread _id_76D3();
    maps\_vehicle::_id_2A9A( "enemy_convoy_ac_moment_tanks" );
    common_scripts\utility::flag_wait( "flag_ac130_moment_dialogue" );
    var_1 = maps\_vehicle::_id_2A9A( "enemy_ac_moment_uaz" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) )
        {
            foreach ( var_5 in getaiarray( "axis" ) )
            {
                if ( var_5 animscripts\utility::_id_24C8( "rpg" ) )
                    missile_createrepulsorent( var_3, 5000, 1000, var_5 );
            }
        }
    }

    wait 10.0;
    level.player _id_0622::_id_3E90();
    level.player thread _id_5134();
    common_scripts\utility::flag_set( "flag_dialogue_ac130_player_has_strobe" );
    maps\_utility::_id_09C9( ::_id_6208 );
    maps\_utility::_id_09C9( common_scripts\utility::flag_wait, "flag_ac130_moment_ran_past" );
    maps\_utility::_id_09CB();
    level notify( "stop_air_support_strobe_kill_dialogue" );
    thread _id_76D4();
    common_scripts\utility::flag_set( "flag_dialogue_ac130_player_killed_targets" );

    foreach ( var_9 in var_0 )
    {
        if ( isdefined( var_9 ) )
            var_9 delete();
    }
}

_id_76CF()
{
    common_scripts\utility::flag_wait( "flag_ac_alley_vehicle_movement_complete" );
    var_0 = getentarray( "blocker_ac130_alley", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_2 connectpaths();
            var_2 delete();
        }
    }
}

_id_76D0()
{
    var_0 = getent( "blocker_hood_slide_ac_alley", "targetname" );
    var_0 connectpaths();
    common_scripts\utility::flag_wait( "flag_ac_alley_hood_slide_block" );
    var_0 disconnectpaths();
}

_id_76D1()
{
    self endon( "death" );
    var_0 = getent( "info_v_enemy_ac130_moment_retreat", "targetname" );
    var_1 = getent( "info_v_enemy_ac130_moment_fall_back", "targetname" );
    var_2 = getent( "info_v_enemy_courtyard_02_main", "targetname" );
    var_3 = getent( "info_v_enemy_courtyard_02_front", "targetname" );
    var_4 = getent( "info_v_enemy_courtyard_02_zone_4", "targetname" );
    var_3._id_76D2 = 0;
    var_2._id_76D2 = 0;
    self._id_2195 = 1;
    common_scripts\utility::flag_wait( "flag_dialogue_ac130_player_killed_targets" );
    wait(randomfloatrange( 0.5, 1.5 ));
    self notify( "stop_going_to_node" );

    if ( self istouching( var_0 ) )
    {
        self setgoalvolumeauto( var_1 );
        self.target = var_1.targetname;
        thread _id_76DA();
    }
    else
    {
        maps\_utility::_id_26F3( 1 );

        if ( var_3._id_76D2 < 3 )
        {
            var_3._id_76D2++;
            self setgoalvolumeauto( var_3 );
            self.target = var_3.targetname;
            common_scripts\utility::flag_wait( "courtyard_2_wave_3" );
            self setgoalvolumeauto( var_2 );
            self.target = var_2.targetname;
        }
        else if ( var_2._id_76D2 < 3 )
        {
            var_2._id_76D2++;
            self setgoalvolumeauto( var_2 );
            self.target = var_2.targetname;
        }
        else
        {
            self setgoalvolumeauto( var_4 );
            self.target = var_4.targetname;
        }
    }
}

_id_76D3()
{
    var_0 = getnode( "node_reno_ac130_moment", "targetname" );
    var_1 = getnode( "node_lonestar_ac130_moment", "targetname" );
    var_2 = getnode( "node_frenchie_ac130_moment", "targetname" );
    var_3 = getnode( "node_redshirt_ac130_moment", "targetname" );
    level._id_7684.ignoreme = 1;
    level._id_7683.ignoreme = 1;
    level._id_76BA.ignoreme = 1;
    level._id_76BB.ignoreme = 1;
    level._id_7684 maps\_utility::_id_123B();
    level._id_7683 maps\_utility::_id_123B();
    level._id_76BA maps\_utility::_id_123B();
    level._id_76BB maps\_utility::_id_123B();
    level._id_7684 maps\paris_shared::_id_5085( var_0, 0 );
    level._id_76BA maps\paris_shared::_id_5085( var_2, 0 );
    level._id_76BB maps\paris_shared::_id_5085( var_3, 0 );
    level._id_7683 maps\paris_shared::_id_5085( var_1, 1 );
    common_scripts\utility::flag_set( "flag_ac130_moment_friendlies_in_position" );
    level._id_7684.ignoreme = 0;
    level._id_7683.ignoreme = 0;
    level._id_76BA.ignoreme = 0;
    level._id_76BB.ignoreme = 0;
}

_id_76D4()
{
    common_scripts\utility::flag_set( "flag_ac130_moment_complete" );
    maps\_audio::aud_send_msg( "ac130_moment_complete" );
    level._id_76BB maps\_utility::_id_2686();
    wait 2;
    common_scripts\utility::flag_set( "flag_dialogue_down_the_alley" );
    common_scripts\utility::flag_wait( "flag_ac130_moment_friendlies_in_position" );
    level._id_76BA maps\_utility::_id_2686();
    wait 1;
    level._id_7684 maps\_utility::_id_2686();
    level._id_7683 maps\_utility::_id_2686();
}

_id_6208()
{
    for ( var_0 = 0; var_0 < 3; var_0 += var_1 )
        level waittill( "air_support_strobe_killed", var_1 );
}

_id_5134()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    self endon( "stop_air_support_hint" );
    wait 2.0;
    level.player maps\_utility::_id_1654( "flag_strobe_ready" );
    self._id_5135 = 0;
    level._id_76D5 = 0;

    if ( !_id_5138() )
    {
        var_0 = 30;
        thread _id_5136( var_0 );
        maps\_utility::_id_1823( "air_support_hint", var_0 );
        thread _id_76D6();
    }
}

_id_5136( var_0 )
{
    self endon( "death" );
    self endon( "stop_air_support_hint_timeout" );
    thread _id_5137( var_0 );
    self waittill( "stop_air_support_hint" );
    self._id_5135 = 1;
}

_id_5137( var_0 )
{
    self endon( "death" );
    self endon( "stop_air_support_hint" );
    wait(var_0);
    self notify( "stop_air_support_hint_timeout" );
}

_id_5138()
{
    return level.player._id_5135 || level.player getcurrentweapon() == "air_support_strobe";
}

_id_76D6()
{
    level.player endon( "death" );
    level notify( "air_support_strobe_fire_hint" );
    level endon( "air_support_strobe_fire_hint" );
    level._id_76D5 = 0;

    while ( !level._id_76D5 )
    {
        level.player maps\_utility::_id_1654( "flag_strobe_ready" );

        while ( level.player getcurrentweapon() != "air_support_strobe" )
            common_scripts\utility::waitframe();

        wait 1;

        if ( !level.player maps\_utility::_id_1008( "flag_strobe_ready" ) || level.player getcurrentweapon() != "air_support_strobe" )
            continue;

        if ( level.console )
        {
            maps\_utility::_id_1823( "air_support_fire_hint", 30 );
            level._id_76D5 = 1;
            continue;
        }

        maps\_utility::_id_1823( "air_support_fire_hint_pc", 30 );
        level._id_76D5 = 1;
    }
}

_id_76D7()
{
    if ( common_scripts\utility::flag( "btr_cortyard_killed" ) )
        return 1;

    if ( level.player getcurrentweapon() != "air_support_strobe" )
        return 1;

    return 0;
}

_id_76D8()
{
    maps\paris_shared::_id_5083( "enemy_ai_initial_ac_moment" );
}

_id_76D9()
{
    var_0 = getentarray( "enemy_courtyard_2_wave_1", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_166F( 1 );

    common_scripts\utility::flag_wait( "courtyard_2_wave_2" );
    thread _id_76DC();
    var_0 = getentarray( "enemy_courtyard_2_wave_2", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_166F( 1 );

    common_scripts\utility::flag_wait( "courtyard_2_wave_3" );
    thread _id_76DB();
    common_scripts\utility::flag_set( "flag_dialogue_heli_courtyard" );
    maps\_audio::aud_send_msg( "mus_cross_courtyard2" );
    common_scripts\utility::flag_wait( "flag_dialogue_btr_alley" );
    var_6 = [ "enemy_courtyard_2_wave_1", "enemy_courtyard_2_wave_2", "enemy_courtyard_2_wave_3", "enemy_courtyard_2_wave_4", "enemy_courtyard_2_brt_crew", "enemy_ai_initial_ac_moment", "enemy_ai_initial_ac_moment_gaz", "enemy_courtyard_2_heli_crew" ];
    maps\paris_shared::_id_507F( 8, var_6, 1 );
    var_0 = getentarray( "enemy_courtyard_2_wave_4", "script_noteworthy" );

    if ( var_0.size > 0 )
        maps\_spawner::_id_2135( var_0 );

    maps\paris_shared::_id_507F( 4, var_6, 1 );
    maps\paris_shared::_id_5081( var_6 );
    maps\paris_shared::_id_507F( 1, var_6, 1 );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::_id_76DA );
    common_scripts\utility::flag_wait( "flag_btr_approaching" );
    common_scripts\utility::flag_wait( "btr_cortyard_killed" );
    common_scripts\utility::flag_set( "flag_dialogue_courtyard_2_clear" );
    common_scripts\utility::flag_set( "flag_courtyard_2_combat_finished" );
    maps\_audio::aud_send_msg( "courtyard_2_combat_finished" );
    maps\_utility::_id_265A( "allies" );
    level.player _id_0622::_id_3E8F();
}

_id_76DA()
{
    self endon( "death" );

    for (;;)
    {
        if ( !maps\_utility::_id_1FBD( self.origin ) )
        {
            maps\paris_shared::_id_441E();
            break;
        }

        wait 1;
    }
}

_id_76DB()
{
    var_0 = getentarray( "enemy_courtyard_2_wave_3", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_id_166F( 1 );
}

_id_76DC()
{
    var_0 = maps\_vehicle::_id_2A9A( "mi17_courtyard_ambient" );
    var_1 = maps\_vehicle::_id_2881( "mi17_courtyard_02" );
    maps\_audio::aud_send_msg( "mi17_courtyard_02_start", var_1 );
    var_1 waittill( "death", var_2, var_3, var_4 );

    if ( isdefined( var_4 ) && var_4 == level._id_3E8A )
        level.player thread maps\_utility::_id_1E39( "DANGER_CLOSE" );
}

_id_3EB8()
{
    common_scripts\utility::flag_wait_any( "flag_obj_btr_courtyard", "flag_dialogue_heli_unloading", "flag_mi17_courtyard_02_dead" );
    wait 2;
    thread _id_76F0();
    level._id_3EB8 = maps\_vehicle::_id_2881( "btr_courtyard" );
    level._id_3EB8 thread _id_76DD();
    level._id_3EB8 maps\_utility::_id_1402( "btr_unloading" );
    level._id_3EB8._id_2955 = 1;
    level._id_3EB8._id_2941 = 1;
    level._id_3EB8 notify( "kill_badplace_forever" );
    level._id_3EB8 thread maps\_vehicle::_id_2A75();
    level._id_3EB8 thread _id_0028();
    level._id_3EB8 thread _id_76DE();
    level._id_3EB8 thread _id_76E3();
    level._id_3EB8 thread _id_038F::_id_5023();
    maps\_audio::aud_send_msg( "aud_btr_courtyard_start", level._id_3EB8 );
    maps\_utility::delaythread( 3.0, common_scripts\utility::flag_set, "flag_dialogue_btr_alley" );
    level.player maps\_utility::delaythread( 9.0, ::_id_5134 );

    if ( isalive( level._id_3EB8 ) )
        level._id_3EB8 waittill( "death" );

    maps\_spawner::_id_213E( 600 );
    common_scripts\utility::flag_set( "btr_cortyard_killed" );
    level.player notify( "stop_air_support_hint" );
    maps\_audio::aud_send_msg( "mus_btr_destroyed" );
}

_id_76DD()
{
    maps\_vehicle::_id_2A12();
    common_scripts\utility::flag_wait( "flag_btr_godoff" );
    maps\_vehicle::_id_2A13();
    var_0 = getent( "blocker_btr_alley", "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 connectpaths();
        var_0 delete();
    }

    level._id_3EB8 thread _id_76E7();
}

_id_0028()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_2 ) && issubstr( var_2, "rpg" ) )
        common_scripts\utility::flag_set( "flag_dialogue_destroyed_btr_with_rpg" );
}

_id_76DE()
{
    self endon( "death" );
    self endon( "kill_btr_move_think" );
    self._id_76DF = [];
    self._id_76DF["forward"]["back"] = "btr_path_forward_to_back";
    self._id_76DF["back"]["forward"] = "btr_path_back_to_forward";
    self._id_76DF["back"]["left"] = "btr_path_back_to_left";
    self._id_76DF["left"]["back"] = "btr_path_left_to_back";
    self._id_76DF["left"]["right"] = "btr_path_left_to_right";
    self._id_76DF["right"]["left"] = "btr_path_right_to_left";
    var_0 = "forward";
    self._id_76E0 = [];
    self._id_76E0["back"] = "forward";
    self._id_76E0["left"] = "back";
    self._id_76E1 = 0;

    for (;;)
    {
        self waittill( "reached_dynamic_path_end" );
        self._id_2941 = 0;

        if ( !self._id_76E1 )
        {
            wait 1;
            self._id_76E1 = 1;
            thread _id_76E8( "two_riders" );
        }

        var_1 = _id_76E2( var_0 );

        if ( var_1 == "none" )
            return;

        self._id_2941 = 1;
        wait 0.5;
        self._id_76E0[var_0] = var_1;
        var_2 = self._id_76DF[var_0][var_1];
        var_3 = getvehiclenode( var_2, "targetname" );
        self startpath( var_3 );
        thread maps\_vehicle::_id_26A1( var_3 );
        var_0 = var_1;
    }
}

_id_76E2( var_0 )
{
    var_1 = 2.5;
    var_2 = 8;
    var_3 = 0;
    wait(var_1);
    var_3 += var_1;

    for (;;)
    {
        var_4 = 0.5;
        wait(var_4);
        var_3 += var_4;
        var_5 = self.mgturret[0] gettagorigin( "tag_flash" );
        var_6 = level.player geteye();
        var_7 = sighttracepassed( var_5, var_6, 0, self.mgturret[0] );

        if ( var_7 && var_3 < var_2 )
            continue;

        var_8 = undefined;

        if ( isdefined( self._id_76E0 ) && isdefined( self._id_76E0[var_0] ) )
            var_8 = self._id_76E0[var_0];

        var_9 = self._id_76DF[var_0];
        var_10 = getarraykeys( var_9 );

        if ( var_10.size == 1 )
            return var_10[0];

        var_11 = randomintrange( 0, var_10.size - 1 );

        for ( var_12 = 0; var_12 < var_10.size; var_12++ )
        {
            var_13 = ( var_11 + var_12 ) % var_10.size;
            var_14 = var_10[var_13];

            if ( isdefined( var_8 ) && var_14 == var_8 )
                continue;
            else
                return var_14;
        }

        return "none";
    }
}

_id_76E3()
{
    self endon( "death" );
    self endon( "kill_btr_turret_think" );
    thread maps\_vehicle::_id_2B11();

    for (;;)
    {
        wait(randomfloatrange( 0.3, 0.8 ));
        var_0 = _id_76E6();

        if ( isdefined( var_0 ) )
        {
            _id_76E4( var_0 );
            wait 0.3;
        }
    }
}

_id_76E4( var_0 )
{
    var_0 endon( "death" );
    self setturrettargetent( var_0, ( 0.0, 0.0, 32.0 ) );

    if ( common_scripts\utility::cointoss() )
    {
        if ( isdefined( self.mgturret ) )
        {
            foreach ( var_2 in self.mgturret )
            {
                if ( isdefined( var_2 ) )
                {
                    var_2 setturretteam( "axis" );
                    var_2 setmode( "manual" );
                    var_2 settargetentity( var_0 );
                    var_2 startfiring();
                }
            }
        }

        wait(randomfloatrange( 3, 5 ));

        if ( isdefined( self.mgturret ) )
        {
            foreach ( var_2 in self.mgturret )
            {
                if ( isdefined( var_2 ) )
                {
                    var_2 cleartargetentity();
                    var_2 stopfiring();
                }
            }
        }
    }
    else
    {
        for ( var_6 = 0; var_6 < randomintrange( 1, 3 ); var_6++ )
        {
            _id_76E5();
            wait 0.5;
        }
    }
}

_id_76E5()
{
    for ( var_0 = 0; var_0 < randomintrange( 2, 4 ); var_0++ )
    {
        self fireweapon();
        wait 0.2;
    }
}

_id_76E6()
{
    var_0 = 4;
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_0; var_2++ )
        var_1[var_1.size] = level.player;

    return common_scripts\utility::random( var_1 );
}

_id_76E7()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "air_support_strobe_popped", var_0 );
        wait 1;

        if ( isdefined( self._id_2967 ) )
            self waittill( "deathrolloff" );

        if ( isdefined( var_0 ) && isdefined( var_0.origin ) && distance( var_0.origin, self.origin ) < 300 )
        {
            self notify( "kill_btr_move_think" );
            self notify( "kill_btr_turret_think" );
            self vehicle_setspeed( 0, 20, 20 );

            if ( self._id_76E1 )
            {
                thread _id_76E8( "driver_and_rider" );
                continue;
            }

            thread _id_76E8();
        }
    }
}

_id_76E8( var_0 )
{
    self endon( "death" );
    maps\_utility::_id_13DB( "btr_unloading" );

    if ( isdefined( var_0 ) )
        thread maps\_vehicle::_id_2514( var_0 );
    else
        thread maps\_vehicle::_id_2514();

    maps\_utility::_id_13DC( "btr_unloading" );
    wait 5.4;
    maps\_utility::_id_13DE( "btr_unloading" );
}

_id_76E9()
{
    wait 3;

    foreach ( var_1 in [ level._id_76BA, level._id_76BB, level._id_7683, level._id_7684 ] )
    {
        var_1 maps\_utility::_id_123B();
        var_1 maps\_utility::_id_2612( 1 );
        var_1 maps\_utility::_id_26F3( 1 );
    }

    level._id_7684 maps\paris_shared::_id_5085( "node_pre_move_manhole_reno", 0 );
    level._id_76BB maps\paris_shared::_id_5085( "node_pre_move_manhole_redshirt", 0 );
    level._id_7683 maps\paris_shared::_id_5085( "node_pre_move_manhole_lonestar", 0 );
    thread _id_76ED();
    thread _id_76EE();
    var_3 = [ level._id_76BA, level._id_7683 ];
    var_4 = [ level._id_76BA, level._id_7683, level._id_76EA ];
    common_scripts\utility::flag_wait_all( "flag_move_manhole_start", "flag_frenchie_manhole_ready" );
    level._id_76EB maps\_anim::_id_122A( var_3, "delta_pull_movemanhole" );
    maps\paris_shared::_id_50DA( "move_manhole", 1, level._id_7683, 3 );
    level._id_76EB maps\_anim::_id_11DE( var_4, "delta_pull_movemanhole" );
    level._id_76BA animcustom( ::_id_76EF );
    level._id_76EB thread maps\_anim::_id_124E( level._id_7683, "delta_pull_movemanhole_idle" );
    level._id_76EC connectpaths();
    wait 1.5;
    var_5 = maps\paris_shared::_id_5076( "flag_player_manhole", "script_noteworthy" );
    var_5 sethintstring( &"PARIS_USE_MANHOLE" );
    common_scripts\utility::flag_set( "flag_player_manhole_ready" );
    common_scripts\utility::flag_clear( "flag_player_manhole" );
    common_scripts\utility::flag_wait( "flag_player_manhole" );
    var_5 delete();
    maps\paris_shared::_id_50E0();
    var_6 = maps\paris_shared::_id_50A3( level._id_76EB, undefined, "player_manhole" );
    var_7 = 0.5;
    level.player maps\paris_shared::_id_50A4( 1 );
    level.player playerlinktoblend( var_6, "tag_player", var_7, var_7 / 3, var_7 / 3 );
    wait(var_7);
    var_6 show();
    level._id_76EB maps\_anim::_id_1246( var_6, "player_manhole" );
    maps\_loadout::_id_1C7B( "paris", 1 );
    setdvar( "paris_transition_movie", "1" );
    maps\_utility::_id_195A();
}

_id_76ED()
{
    level._id_76BA maps\paris_shared::_id_5085( "struct_pre_move_manhole_frenchie", 1 );
    common_scripts\utility::flag_set( "flag_frenchie_manhole_ready" );
}

_id_76EE()
{
    var_0 = common_scripts\utility::getstruct( "struct_pre_move_manhole_frenchie", "script_noteworthy" ).origin;

    while ( distance( var_0, level._id_76BA.origin ) > 120 )
        wait 1;

    common_scripts\utility::flag_set( "flag_dialogue_manhole_prompt" );
}

_id_76EF()
{
    self.allowpain = 0;
    self animmode( "none" );
    var_0 = getgroundposition( self.origin, 8, 512, -64 );
    var_1 = %paris_delta_down_ladder_loop;
    self setflaggedanimknoballrestart( "climbanim", var_1, %body, 1, 0.2, 1 );
    var_2 = getmovedelta( var_1, 0, 1 );
    var_3 = var_2[2] / getanimlength( var_1 );
    var_4 = ( var_0[2] - self.origin[2] ) / var_3;

    if ( var_4 < 0 )
        var_4 = 1.5;

    thread animscripts\notetracks::_id_0D4F( var_4, "climbanim" );
    var_5 = common_scripts\utility::spawn_tag_origin();
    self linkto( var_5, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_5 moveto( var_0, var_4 );
    wait(var_4);
    self unlink();
    var_5 delete();
    self animmode( "gravity" );
    self notify( "finished_descending_ladder" );
    self delete();
}

_id_76F0()
{
    common_scripts\utility::flag_wait( "flag_gaz_back_alley" );
    maps\_vehicle::_id_2A98( "gaz_crash_site_back_alley" );
}

_id_76F1()
{
    createthreatbiasgroup( "rooftop_allies" );
    level.player setthreatbiasgroup( "rooftop_allies" );
    level._id_7683 setthreatbiasgroup( "rooftop_allies" );
    level._id_7684 setthreatbiasgroup( "rooftop_allies" );
    setignoremegroup( "rooftop_allies", "axis" );
    setignoremegroup( "axis", "rooftop_allies" );
    maps\_utility::_id_09C9( ::_id_76F2 );
    maps\_utility::_id_09C9( common_scripts\utility::flag_wait, "flag_bookstore_spray_moment" );
    maps\_utility::_id_09CB();
    level.player setthreatbiasgroup( "allies" );
    level._id_7683 setthreatbiasgroup( "allies" );
    level._id_7684 setthreatbiasgroup( "allies" );
}

_id_76F2()
{
    foreach ( var_1 in getaiarray( "axis" ) )
        var_1 thread _id_76F3();

    maps\_utility::_id_1A5A( "axis", ::_id_76F3 );
    level waittill( "damaged_by_player" );
    maps\_utility::_id_26BB( "axis", ::_id_76F3 );
}

_id_76F3()
{
    level endon( "damaged_by_player" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.player )
            break;
    }

    level notify( "damaged_by_player" );
}

_id_76F4()
{
    level endon( "player_shimmy_stop" );
    level.player endon( "death" );
    var_0 = spawnstruct();
    var_1 = 45;
    var_2 = 0.5;
    var_3 = 0.5;
    var_4 = 1;
    var_5 = 1;
    var_6 = 0.5;
    var_7 = 16;
    var_8 = 0.7;
    var_9 = 24;
    var_10 = 360.0;
    var_11 = 90;
    var_12 = 48;
    var_13 = 24;
    var_14 = 24;
    var_15 = 40;
    var_16 = 40;
    var_17 = 20;
    var_18 = 5;
    var_19 = 60;
    var_0._id_76F5 = var_7 * -0.5;
    var_0._id_76F6 = var_7 * 0.5;
    var_20 = 0.05;
    var_0.points = [];
    var_0.angles = [];
    var_0._id_76F7 = [];
    var_0._id_76F8 = [];
    var_0._id_76F9 = [];
    var_0._id_76FA = [];
    var_21 = common_scripts\utility::getstruct( "struct_player_shimmy_start", "script_noteworthy" );
    var_22 = 0;

    while ( isdefined( var_21 ) )
    {
        var_0.points[var_22] = var_21.origin;
        var_0.angles[var_22] = var_21.angles;

        if ( var_22 > 0 )
        {
            var_0._id_76F7[var_22 - 1] = var_0.points[var_22] - var_0.points[var_22 - 1];
            var_0._id_76F8[var_22 - 1] = vectornormalize( var_0._id_76F7[var_22 - 1] );
            var_0._id_76F9[var_22 - 1] = length( var_0._id_76F7[var_22 - 1] );
            var_0._id_76FA[var_22 - 1] = vectornormalize( maps\_shg_common::_id_1684( ( 0.0, 0.0, 1.0 ), var_0._id_76F8[var_22 - 1] ) );
        }

        if ( isdefined( var_21._id_6B94 ) )
        {
            if ( var_22 == 0 )
                var_0._id_76FB = var_21._id_6B94;
            else
                var_0._id_76FC = var_21._id_6B94;
        }

        if ( isdefined( var_21.target ) )
        {
            var_21 = common_scripts\utility::getstruct( var_21.target, "targetname" );
            var_22++;
            continue;
        }

        break;
    }

    var_0._id_76F9[var_0._id_76F9.size - 1] = var_0._id_76F9[var_0._id_76F9.size - 1] + 0.125;

    for (;;)
    {
        for (;;)
        {
            var_23 = 0;

            for ( var_22 = 0; var_22 < var_0.points.size - 1; var_22++ )
            {
                if ( _id_7706( var_0, var_22 ) )
                {
                    var_23 = 1;
                    break;
                }
            }

            if ( var_23 )
                break;

            common_scripts\utility::waitframe();
        }

        _id_7707( var_0, level.player.origin );

        if ( !isdefined( var_0._id_76FD ) )
            continue;

        level.player maps\paris_shared::_id_50A4( 0 );
        maps\_audio::aud_send_msg( "mus_ledge_walk" );
        common_scripts\utility::flag_set( "flag_dialogue_watch_your_step" );

        if ( var_0._id_76FD == 0 )
            var_0._id_76FE += var_12;
        else
            var_0._id_76FE -= var_12;

        var_0._id_76FF = clamp( var_0._id_76FF, var_0._id_76F5, var_0._id_76F6 );
        var_21 = _id_7708( var_0 );
        var_24 = var_21.origin;
        var_25 = var_21.angles;
        var_26 = 1;
        var_27 = level.player.angles;
        var_28 = common_scripts\utility::spawn_tag_origin();
        var_29 = var_21.origin + ( 0, 0, var_19 ) - level.player geteye();
        var_30 = _id_7705( var_4, vectordot( level.player getvelocity(), vectornormalize( var_29 ) ), length( var_29 ) );
        level.player _id_7704( var_21.origin + ( 0, 0, var_19 ), var_21.angles, var_4, var_30._id_7701, var_30._id_7700, var_4 * 0.4, var_4 * 0.4, var_28, var_15, var_16, var_17, var_18 );
        var_31 = 0;
        var_32 = 0;
        var_33 = 0;
        var_34 = var_11 / var_10;
        var_0._id_7702 = 0;

        for (;;)
        {
            _id_7707( var_0, var_24 );

            if ( !isdefined( var_0._id_76FD ) )
                break;

            var_0._id_7703 = var_0._id_76FD;
            var_35 = level.player getnormalizedmovement();
            var_35 = ( var_35[0], var_35[1] * -1, 0 );

            if ( var_35[0] < 0.25 )
                var_26 = 0;

            if ( length( var_35 ) < 0.1 )
                var_31 = 1;

            if ( var_26 )
                var_36 = var_27;
            else
                var_36 = level.player.angles;

            var_37 = vectortoangles( var_35 );
            var_38 = common_scripts\utility::flat_angle( combineangles( var_36, var_37 ) );
            var_39 = anglestoforward( var_38 ) * length( var_35 );
            var_40 = vectordot( var_39, var_0._id_76F8[var_0._id_76FD] );
            var_41 = vectordot( var_39, var_0._id_76FA[var_0._id_76FD] );

            if ( abs( var_40 ) > 0.1 )
                var_33 += var_20;
            else
            {
                var_33 = 0;
                var_34 = var_11 / var_10;
            }

            var_42 = maps\paris_shared::_id_50B1( var_33, 0, var_2, 0, var_1 ) + var_9 * sin( var_33 * var_10 );

            if ( var_33 > var_34 )
            {
                var_43 = var_0.points[var_0._id_76FD] + var_0._id_76F8[var_0._id_76FD] * var_0._id_76FE;
                _id_7709( var_43, level.player.angles );
                level.player playrumbleonentity( "viewmodel_small" );
                var_34 += 360.0 / var_10;
            }

            if ( var_40 > 0 )
            {
                var_44 = _id_7697( var_24 );

                if ( isdefined( var_44 ) )
                {
                    var_45 = var_44.origin - var_24;

                    if ( vectordot( var_45, var_0._id_76F8[var_0._id_76FD] ) > 0 )
                    {
                        var_46 = length( var_45 );
                        var_40 = maps\paris_shared::_id_50B1( var_46, 32, 64, 0, var_40 );
                    }
                }
            }

            var_0._id_76FE += var_40 * var_42 * var_20;
            var_0._id_76FF += var_41 * var_42 * var_20;

            if ( var_31 && var_0._id_76FF > var_0._id_76F6 && var_35[0] > 0.5 )
                var_32 += var_20;
            else
                var_32 = 0;

            if ( var_32 > var_3 )
            {
                var_0._id_7702 = 1;
                break;
            }

            var_0._id_76FF = clamp( var_0._id_76FF, var_0._id_76F5, var_0._id_76F6 );
            var_21 = _id_7708( var_0 );
            var_25 = maps\paris_shared::_id_50B3( var_21.angles, var_25, var_8 );
            var_28.angles = var_25;
            var_24 = var_21.origin;
            var_28.origin = var_24 + ( 0, 0, var_19 ) - anglestoup( var_25 ) * var_19;
            wait(var_20);
        }

        if ( isdefined( var_0._id_7703 ) )
        {
            if ( var_0._id_7702 )
            {
                var_0._id_76FD = var_0._id_7703;
                var_0._id_76FF += var_14;
                var_47 = _id_7708( var_0 ).origin;
                var_48 = anglestoforward( level.player getplayerangles() );
                level.player enableweapons();
                var_2 = var_6 * 0.2;
                var_49 = var_6 * 0.5;
                level.player lerpviewangleclamp( var_6, var_2, var_49, 0, 0, 0, 0 );
                var_28 rotateto( vectortoangles( var_48 ), var_6, var_2, var_49 );
                var_28 moveto( var_47, var_6, var_2, var_49 );
                wait(var_6);
            }
            else
            {
                var_0._id_76FD = var_0._id_7703;
                var_50 = undefined;

                if ( var_0._id_76FD == 0 )
                {
                    var_0._id_76FE -= var_13;
                    var_50 = var_0._id_76FB;
                }
                else
                {
                    var_0._id_76FE += var_13;
                    var_50 = var_0._id_76FC;
                }

                var_47 = _id_7708( var_0 ).origin;

                if ( !isdefined( var_50 ) )
                {
                    if ( var_0._id_7703 == 0 )
                        var_50 = vectortoangles( var_0._id_76F8[var_0._id_7703] * -1 );
                    else
                        var_50 = vectortoangles( var_0._id_76F8[var_0._id_7703] );
                }

                var_51 = level.player getgunangles();
                var_52 = angleclamp180( var_51[1] - vectortoangles( var_0._id_76FA[var_0._id_7703] )[1] );
                var_50 = ( var_50[0], angleclamp( var_50[1] - var_52 ), var_50[2] );
                var_53 = getgroundposition( var_47, 16, 24, 24 );

                if ( isdefined( var_53 ) )
                    var_47 = var_53;

                level.player enableweapons();
                var_2 = var_5 * 0.2;
                var_49 = var_5 * 0.5;
                level.player lerpviewangleclamp( var_5, var_2, var_49, 180, 180, 90, 90 );
                var_28 rotateto( var_50, var_5, var_2, var_49 );
                var_28 moveto( var_47, var_5, var_2, var_49 );
                wait(var_5);
            }
        }

        level.player unlink();
        level.player maps\paris_shared::_id_50A5();
        var_28 delete();
        common_scripts\utility::waitframe();
        common_scripts\utility::waitframe();
    }
}

_id_7704( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = level.player getplayerviewheight();
    var_13 = 60;
    var_14 = common_scripts\utility::spawn_tag_origin();
    var_14.angles = self getplayerangles();
    var_14.origin = self.origin + ( 0, 0, var_13 ) + self getvelocity() * 0.1;
    var_15 = common_scripts\utility::spawn_tag_origin();
    var_15 linkto( var_14, "tag_origin", ( 0, 0, -1 * var_13 ), ( 0.0, 0.0, 0.0 ) );
    self playerlinktodelta( var_15, "tag_origin", 1, 0, 0, 0, 0, 1 );
    var_14 moveto( var_0, var_2, var_3, var_4 );
    var_14 rotateto( var_1, var_2, var_5, var_6 );
    wait(var_2);
    var_7.origin = var_0 + ( 0, 0, var_13 ) - anglestoup( var_1 ) * var_13;
    var_7.angles = var_1;
    self playerlinktodelta( var_7, "tag_origin", 1, var_8, var_9, var_10, var_11, 1 );
    var_15 delete();
    var_14 delete();
}

_id_7705( var_0, var_1, var_2 )
{
    var_3 = var_0 * 0.25;
    var_4 = spawnstruct();

    if ( var_2 > 0 && var_1 > 0 )
    {
        var_5 = var_1 / var_2;
        var_6 = 2.0 * var_0 - 2.0 / var_5;

        if ( var_6 > var_3 )
        {
            if ( var_6 <= var_0 )
            {
                var_4._id_7701 = 0;
                var_4._id_7700 = var_6;
            }
            else
            {
                var_4._id_7701 = 0;
                var_4._id_7700 = var_0;
            }
        }
        else
        {
            var_7 = 2.0 / ( 2.0 * var_0 - var_3 );

            if ( var_5 > var_7 * 0.5 )
            {
                var_4._id_7701 = 0;
                var_4._id_7700 = var_3;
            }
            else
            {
                var_4._id_7701 = var_3;
                var_4._id_7700 = var_3;
            }
        }
    }
    else
    {
        var_4._id_7701 = var_3;
        var_4._id_7700 = var_3;
    }

    return var_4;
}

_id_7706( var_0, var_1 )
{
    var_2 = level.player.origin - var_0.points[var_1];
    var_3 = vectordot( var_2, var_0._id_76F8[var_1] );
    var_4 = 2.5;

    if ( var_3 > 0 && var_3 < var_0._id_76F9[var_1] )
    {
        var_5 = vectordot( var_2, var_0._id_76FA[var_1] );

        if ( var_5 > var_0._id_76F5 * var_4 && var_5 < var_0._id_76F6 * var_4 )
            return 1;
    }

    return 0;
}

_id_7707( var_0, var_1 )
{
    var_0._id_76FD = undefined;

    for ( var_2 = 0; var_2 < var_0.points.size - 1; var_2++ )
    {
        var_3 = var_1 - var_0.points[var_2];
        var_4 = vectordot( var_3, var_0._id_76F8[var_2] );

        if ( var_4 < var_0._id_76F9[var_2] )
        {
            var_0._id_76FF = vectordot( var_3, var_0._id_76FA[var_2] );
            var_0._id_76FD = var_2;
            var_0._id_76FE = var_4;
            break;
        }
    }

    if ( isdefined( var_0._id_76FD ) && var_0._id_76FD == 0 && var_0._id_76FE < -0.125 )
        var_0._id_76FD = undefined;
}

_id_7708( var_0 )
{
    var_1 = spawnstruct();
    var_2 = var_0._id_76FD;
    var_1.origin = var_0.points[var_2] + var_0._id_76F8[var_2] * var_0._id_76FE + var_0._id_76FA[var_2] * var_0._id_76FF;
    var_3 = undefined;

    if ( var_0._id_76FE > var_0._id_76F9[var_0._id_76FD] && var_0._id_76FD + 1 < var_0._id_76F9.size )
        var_3 = var_0.points[var_0._id_76FD + 1];

    if ( var_0._id_76FE < 0 && var_0._id_76FD > 0 )
        var_3 = var_0.points[var_0._id_76FD];

    if ( isdefined( var_3 ) )
    {
        var_4 = var_1.origin - var_3;
        var_5 = length( var_4 );
        var_6 = -1 * var_0._id_76F5;

        if ( var_0._id_76FF > 0 )
            var_6 = var_0._id_76F6;

        if ( var_5 > var_6 )
        {
            var_4 *= var_6 / var_5;
            var_1.origin = var_3 + var_4;
        }
    }

    var_7 = clamp( var_0._id_76FE / var_0._id_76F9[var_2], 0, 1 );
    var_8 = _id_770A( var_0.angles[var_2] );
    var_9 = var_8;
    var_10 = var_8;

    if ( var_2 + 1 < var_0.angles.size )
        var_9 = _id_770A( var_0.angles[var_2 + 1] );

    if ( var_2 - 1 > 0 )
        var_10 = _id_770A( var_0.angles[var_2 - 1] );

    var_11 = var_9;

    if ( var_2 + 2 < var_0.angles.size )
        var_11 = _id_770A( var_0.angles[var_2 + 2] );

    var_12 = ( 1 + 2 * var_7 ) * squared( 1 - var_7 );
    var_13 = var_7 * squared( 1 - var_7 );
    var_14 = squared( var_7 ) * ( 3 - 2 * var_7 );
    var_15 = squared( var_7 ) * ( var_7 - 1 );
    var_16 = ( var_9 - var_10 ) / 2;
    var_17 = ( var_11 - var_8 ) / 2;
    var_1.angles = _id_770B( var_12 * var_8 + var_13 * var_16 + var_14 * var_9 + var_15 * var_17 );
    return var_1;
}

_id_7709( var_0, var_1 )
{
    playfx( common_scripts\utility::getfx( "ledge_footstep_dust" ), var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
    maps\_audio::aud_send_msg( "start_ledge_footstep" );
}

_id_770A( var_0 )
{
    return ( angleclamp180( var_0[0] ), angleclamp180( var_0[1] ), angleclamp180( var_0[2] ) );
}

_id_770B( var_0 )
{
    return ( angleclamp( var_0[0] ), angleclamp( var_0[1] ), angleclamp( var_0[2] ) );
}

_id_7110()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) && isalive( var_0 ) )
            var_0 kill();
    }
}

_id_770C( var_0, var_1 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    var_2 = 1.5;
    var_3 = 700;
    var_4 = 60 / var_3;
    var_5 = var_2 / var_4;
    var_6 = 39;
    var_7 = 0.3;
    var_8 = ( 0.0, 0.0, 0.0 );
    var_9 = common_scripts\utility::spawn_tag_origin();
    var_9.origin = var_0;
    self setentitytarget( var_9 );

    for ( var_10 = 0; var_10 < var_5; var_10++ )
    {
        var_8 = var_8 * var_7 + common_scripts\utility::randomvector( var_6 * ( 1 - var_7 ) );
        var_11 = maps\_utility::_id_281D( var_10 / var_5, var_0, var_1 ) + var_8;
        var_9.origin = var_11;
        self setentitytarget( var_9 );
        magicbullet( self.weapon, self gettagorigin( "tag_flash" ), var_11 );
        wait(var_4);
    }

    self clearentitytarget();
    var_9 delete();
}

_id_770D( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size && var_3 < var_1; var_3++ )
        var_2[var_2.size] = var_0[var_3];

    return var_2;
}
